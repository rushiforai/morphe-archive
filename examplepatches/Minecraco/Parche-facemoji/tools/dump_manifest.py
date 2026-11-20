"""Imprime el manifiesto de la APK en texto: actividades y filtros principales."""

from __future__ import annotations

import sys
import zipfile
from pathlib import Path


def atributo(elemento, nombre: str) -> str:
    """Lee un atributo aunque androguard lo devuelva con espacio de nombres."""
    for clave, valor in elemento.attrib.items():
        if clave == nombre or clave.endswith("}" + nombre) or clave.endswith(":" + nombre):
            return valor
    return "?"


def main() -> int:
    try:
        from loguru import logger as loguru_logger

        loguru_logger.remove()
    except Exception:
        pass

    from androguard.core.axml import AXMLPrinter

    ruta = Path(sys.argv[1])
    zf = zipfile.ZipFile(ruta)
    if "base.apk" in zf.namelist():
        import io
        zf = zipfile.ZipFile(io.BytesIO(zf.read("base.apk")))

    arbol = AXMLPrinter(zf.read("AndroidManifest.xml")).get_xml_obj()

    paquete = arbol.attrib.get("package", "?")
    print(f"paquete: {paquete}\n")

    for aplicacion in arbol:
        if aplicacion.tag != "application":
            continue
        for elemento in aplicacion:
            if elemento.tag not in ("activity", "activity-alias"):
                continue
            nombre = atributo(elemento, "name")
            categoria = ""
            for filtro in elemento:
                if filtro.tag != "intent-filter":
                    continue
                categorias = [atributo(c, "name") for c in filtro if c.tag == "category"]
                if any("LAUNCHER" in c for c in categorias):
                    categoria = "  <== ICONO EN EL CAJON"
            print(f"{elemento.tag}: {nombre}{categoria}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
