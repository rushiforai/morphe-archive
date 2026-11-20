"""Busca las pantallas de ajustes basadas en preferencias dentro de la APK.

Lee resource table y los ficheros `res/xml/*.xml`, y muestra los que son un
`<PreferenceScreen>` con sus filas (clave y titulo resuelto), para poder identificar cual es la
pantalla de ajustes que se ve en la app.

Uso:  python tools/buscar_xml_ajustes.py facemoji.apkm [--min-filas 4]
"""

from __future__ import annotations

import argparse
import sys
import zipfile
from pathlib import Path


def abrir_apk(path: Path) -> zipfile.ZipFile:
    """Devuelve el zip de la APK, sacando el base.apk si es un .apkm/.xapk."""
    zf = zipfile.ZipFile(path)
    nombres = zf.namelist()
    if "base.apk" in nombres:
        import io
        datos = zf.read("base.apk")
        return zipfile.ZipFile(io.BytesIO(datos))
    return zf


def cargar(nombres: tuple[str, ...], atributo: str):
    """Importa `atributo` del primer modulo de androguard que lo tenga."""
    import importlib

    for nombre in nombres:
        try:
            modulo = importlib.import_module(nombre)
        except Exception:
            continue
        if hasattr(modulo, atributo):
            return getattr(modulo, atributo)
    return None


def tabla_recursos(apk: zipfile.ZipFile) -> dict[int, str]:
    """id de recurso -> valor por defecto (solo cadenas)."""
    ARSCParser = cargar(
        (
            "androguard.core.resources.arsc",
            "androguard.core.resources",
            "androguard.core.axml",
            "androguard.core.bytecodes.axml",
        ),
        "ARSCParser",
    )
    if ARSCParser is None:
        print("(sin ARSCParser: se muestran las claves sin resolver los titulos)\n")
        return {}

    valores: dict[int, str] = {}
    for nombre in apk.namelist():
        if not nombre.endswith("resources.arsc"):
            continue
        arsc = ARSCParser(apk.read(nombre))
        for paquete in arsc.get_packages_names():
            try:
                configuraciones = arsc.get_configurations(paquete)
            except Exception:
                configuraciones = {}
            for idioma in configuraciones:
                if idioma not in ("DEFAULT", "es"):
                    continue
                try:
                    entradas = arsc.get_res_config(paquete, idioma).values()
                except Exception:
                    continue
                for entrada in entradas:
                    for res_id, valor in entrada.items():
                        if isinstance(valor, str) and res_id not in valores:
                            valores[res_id] = valor
    return valores


def texto_atributo(elemento, atributo: str, valores: dict[int, str]) -> str | None:
    for clave, valor in elemento.attrib.items():
        if clave.endswith(atributo):
            if isinstance(valor, str) and valor.startswith("@"):
                try:
                    identificador = int(valor[1:].lstrip("+"), 16)
                except ValueError:
                    return valor
                return valores.get(identificador, valor)
            return valor
    return None


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apk", type=Path)
    parser.add_argument("--min-filas", type=int, default=3)
    args = parser.parse_args()

    try:
        from loguru import logger as loguru_logger

        loguru_logger.remove()
    except Exception:
        pass

    AXMLPrinter = cargar(
        (
            "androguard.core.axml",
            "androguard.core.bytecodes.axml",
        ),
        "AXMLPrinter",
    )
    if AXMLPrinter is None:
        print("No se ha podido cargar androguard (AXMLPrinter).")
        return 1

    apk = abrir_apk(args.apk)
    valores = tabla_recursos(apk)
    print(f"{len(valores)} cadenas de recursos leidas\n")

    for nombre in sorted(apk.namelist()):
        if not (nombre.startswith("res/xml") and nombre.endswith(".xml")):
            continue
        try:
            arbol = AXMLPrinter(apk.read(nombre)).get_xml_obj()
        except Exception:
            continue

        if arbol.tag != "PreferenceScreen":
            continue

        hijos = [h for h in arbol if isinstance(h.tag, str)]
        if len(hijos) < args.min_filas:
            continue

        print(f"### {nombre}  ({len(hijos)} filas)")
        for hijo in hijos:
            clave = texto_atributo(hijo, "key", valores) or ""
            titulo = texto_atributo(hijo, "title", valores) or ""
            print(f"    <{hijo.tag}>  key={clave!r}  titulo={titulo!r}")
        print()

    return 0


if __name__ == "__main__":
    sys.exit(main())
