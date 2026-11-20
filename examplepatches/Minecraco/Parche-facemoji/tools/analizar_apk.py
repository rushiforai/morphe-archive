#!/usr/bin/env python3
"""Analiza una APK/APKM de Facemoji y comprueba las huellas (fingerprints) de los parches.

No necesita Java ni apktool: lee el ZIP y el grupo de cadenas de los ficheros DEX.
Si tienes `androguard` instalado (`pip install androguard`) las comprobaciones son
exactas (clase + metodo); si no, se hace una comprobacion por cadenas del DEX.

Ejemplos de uso:

    # Resumen de SDK de anuncios / analitica detectados
    python3 tools/analizar_apk.py Facemoji.apkm --informe

    # Comprueba si las huellas de los parches existen en esta version
    python3 tools/analizar_apk.py Facemoji.apkm --comprobar

    # Busca cadenas relacionadas con la suscripcion VIP / premium
    python3 tools/analizar_apk.py Facemoji.apkm --buscar "vip|premium|subscribe"

    # Lista clases de un paquete (requiere androguard)
    python3 tools/analizar_apk.py Facemoji.apkm --clases com/simejikeyboard

    # Localiza el codigo de suscripcion VIP (para el parche pendiente)
    python3 tools/analizar_apk.py Facemoji.apkm --vip
"""

from __future__ import annotations

import argparse
import re
import struct
import sys
import zipfile
from pathlib import Path

# --------------------------------------------------------------------------------------
# Huellas que usan los parches: (clase, metodo) que se espera encontrar en el DEX.
# Mantener sincronizado con patches/src/main/kotlin/app/parchefacemoji/patches/facemoji/*/
# --------------------------------------------------------------------------------------
HUELLAS = {
    "Eliminar anuncios": [
        ("Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils;", "b"),
        ("Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils;", "c"),
        ("Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils$AdSuggestionSwitch;", "getEnable"),
        ("Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils$EcommerceSuggestionSwitch;", "getEnable"),
        ("Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils$GpAdSugConfig;", "getEnable"),
    ],
    "Desbloquear VIP": [
        ("Lcom/baidu/simeji/coolfont/CoolFontBean;", "isVip"),
        ("Lcom/baidu/simeji/coolfont/CoolFontBean;", "isFontLock"),
        ("Lcom/baidu/simeji/coolfont/CoolFontBean;", "isFontStateLockOrVip"),
        ("Lcom/baidu/simeji/coolfont/CoolFontBean;", "isLockType"),
        ("Lcom/baidu/simeji/coolfont/CoolFontBean;", "isVipUnLockByVideoOrSubscribe"),
        ("Lcom/baidu/simeji/coolfont/CoolFontBean;", "getVipIsUnLock"),
        ("Lcom/baidu/simeji/sticker/series/SeriesStickerItem;", "isSeriesVip"),
        ("Lcom/baidu/simeji/skins/content/itemdata/StickerItem;", "isSeriesVip"),
        ("Lcom/baidu/simeji/inputview/convenient/textbomb/TextBombBean;", "isVip"),
        ("Lcom/gbu/ime/kmm/biz/chatgpt/bean/rizzKeyboard/RizzConfigInfoDetail;", "isVip"),
        ("Lcom/gbu/ime/kmm/biz/chatgpt/bean/rizzKeyboard/RizzConfigInfoDetail2;", "isVip"),
        ("Lcom/gbu/ime/kmm/biz/chatgpt/bean/rizzKeyboard/RizzIceBreakerConfigInfoDetail;", "isVip"),
    ],
    "Ajustes Minecraco": [
        ("Lef/n;", "onResume"),
        ("Lcom/baidu/simeji/settings/SettingsAdvancedFragment;", "onResume"),
    ],
    "Desactivar rastreo": [
        ("Lcom/google/firebase/analytics/FirebaseAnalytics;", "logEvent"),
        ("Lcom/google/firebase/analytics/FirebaseAnalytics;", "setUserProperty"),
        ("Lcom/google/firebase/analytics/FirebaseAnalytics;", "setUserId"),
        ("Lcom/google/firebase/analytics/FirebaseAnalytics;", "setDefaultEventParameters"),
        ("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "log"),
        ("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "setUserId"),
        ("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;", "recordException"),
        ("Lcom/facebook/appevents/AppEventsLogger;", "logEvent"),
        ("Lcom/appsflyer/AppsFlyerLib;", "logEvent"),
    ],
}

# Marcadores para el resumen de SDK.
MARCADORES = {
    "Google AdMob": ["Lcom/google/android/gms/ads/"],
    "Facebook Audience Network": ["Lcom/facebook/ads/"],
    "Facebook Core (eventos)": ["Lcom/facebook/appevents/"],
    "Unity Ads": ["Lcom/unity3d/ads/"],
    "AppLovin": ["Lcom/applovin/"],
    "Pangle / CSJ (ByteDance)": ["Lcom/bytedance/sdk/openadsdk/", "Lcom/pangle/"],
    "ironSource / LevelPlay": ["Lcom/ironsource/"],
    "Mintegral": ["Lcom/mbridge/msdk/"],
    "Vungle / Liftoff": ["Lcom/vungle/"],
    "Firebase Analytics": ["Lcom/google/firebase/analytics/"],
    "Firebase Crashlytics": ["Lcom/google/firebase/crashlytics/"],
    "AppsFlyer": ["Lcom/appsflyer/"],
    "Adjust": ["Lcom/adjust/sdk/"],
    "Google UMP (consentimiento)": ["Lcom/google/android/ump/"],
}


# --------------------------------------------------------------------------------------
# Lectura de la APK
# --------------------------------------------------------------------------------------
def silenciar_androguard() -> None:
    """androguard 4.x escribe su log DEBUG por stderr; aqui solo estorba."""
    try:
        from loguru import logger as loguru_logger  # type: ignore

        loguru_logger.remove()
    except Exception:
        pass


def dex_blobs(path: Path) -> dict[str, bytes]:
    """Devuelve {nombre: bytes} de todos los DEX, entrando en APKs si es un APKM/XAPK."""
    blobs: dict[str, bytes] = {}

    with zipfile.ZipFile(path) as zf:
        for info in zf.infolist():
            if info.filename.endswith(".dex"):
                blobs[info.filename] = zf.read(info)
            elif info.filename.endswith(".apk"):
                import io

                with zipfile.ZipFile(io.BytesIO(zf.read(info))) as inner:
                    for inner_info in inner.infolist():
                        if inner_info.filename.endswith(".dex"):
                            name = f"{info.filename}:{inner_info.filename}"
                            blobs[name] = inner.read(inner_info)

    if not blobs:
        sys.exit(f"No se ha encontrado ningun DEX dentro de {path}")
    return blobs


def _uleb128(data: bytes, offset: int) -> tuple[int, int]:
    result = 0
    shift = 0
    while True:
        byte = data[offset]
        offset += 1
        result |= (byte & 0x7F) << shift
        if not byte & 0x80:
            return result, offset
        shift += 7


def dex_strings(data: bytes):
    """Itera el grupo de cadenas (string_ids) de un DEX."""
    if len(data) < 0x70 or not data.startswith(b"dex\n"):
        return
    string_ids_size, string_ids_off = struct.unpack_from("<II", data, 0x38)
    for index in range(string_ids_size):
        string_off_loc = string_ids_off + 4 * index
        if string_off_loc + 4 > len(data):
            return
        string_off = struct.unpack_from("<I", data, string_off_loc)[0]
        _, start = _uleb128(data, string_off)
        end = data.find(b"\x00", start)
        if end < 0:
            continue
        yield data[start:end].decode("utf-8", "replace")


def cargar_androguard():
    try:
        from androguard.core.dex import DEX  # type: ignore
    except Exception:
        return None
    return DEX


# --------------------------------------------------------------------------------------
# Comprobaciones
# --------------------------------------------------------------------------------------
def informe(cadenas: set[str]) -> None:
    print("SDK detectados (busqueda por cadenas del DEX):\n")
    for nombre, marcadores in MARCADORES.items():
        encontrados = sum(1 for c in cadenas if any(c.startswith(m) for m in marcadores))
        if encontrados:
            print(f"  [x] {nombre}: {encontrados} referencias")
        else:
            print(f"  [ ] {nombre}: no encontrado")
    print(
        "\nNota: los marcadores son descriptores de tipo (Lpaquete/Clase;), por eso la "
        "busqueda es fiable aunque el DEX este ofuscado en el codigo propio de la app."
    )


def comprobar(cadenas: set[str], dex_por_nombre: dict[str, bytes]) -> int:
    """Comprueba las huellas. Devuelve el numero de parches que no encuentran ninguna."""
    DEX = cargar_androguard()
    exacto = DEX is not None
    print(f"Modo de comprobacion: {'exacto (androguard)' if exacto else 'por cadenas del DEX'}\n")

    metodos: set[tuple[str, str]] = set()
    if exacto:
        for nombre, blob in dex_por_nombre.items():
            try:
                dex = DEX(blob)
            except Exception as exc:  # DEX corrupto o comprimido
                print(f"  ! no se pudo leer {nombre}: {exc}")
                continue
            for clase in dex.get_classes():
                clase_desc = clase.get_name()  # formato Lpaquete/Clase;
                for metodo in clase.get_methods():
                    metodos.add((clase_desc, metodo.get_name()))

    parches_sin_huella = 0
    for parche, huellas in HUELLAS.items():
        print(f"=== {parche} ===")
        encontradas = 0
        for clase, metodo in huellas:
            if exacto:
                ok = (clase, metodo) in metodos
            else:
                ok = clase in cadenas and metodo in cadenas
            encontradas += ok
            print(f"  {'[x]' if ok else '[ ]'} {clase}->{metodo}")
        if encontradas == 0:
            parches_sin_huella += 1
            print("  => Ninguna huella coincide: este parche fallaria o no haria nada.")
        else:
            print(f"  => {encontradas}/{len(huellas)} huellas disponibles.")
        print()

    return parches_sin_huella


def buscar(cadenas: set[str], patron: str) -> None:
    try:
        regex = re.compile(patron, re.IGNORECASE)
    except re.error as exc:
        sys.exit(f"Expresion regular no valida: {exc}")

    coincidencias = sorted(c for c in cadenas if regex.search(c))
    print(f"{len(coincidencias)} coincidencias:\n")
    for cadena in coincidencias:
        print(f"  {cadena}")


def listar_clases(dex_por_nombre: dict[str, bytes], prefijo: str) -> None:
    DEX = cargar_androguard()
    if DEX is None:
        sys.exit("Esta opcion necesita androguard: pip install androguard")

    prefijo_desc = prefijo.replace(".", "/").lstrip("L")
    for nombre, blob in dex_por_nombre.items():
        try:
            dex = DEX(blob)
        except Exception:
            continue
        for clase in dex.get_classes():
            clase_desc = clase.get_name()
            if prefijo_desc in clase_desc:
                print(f"{clase_desc}  ({nombre})")


# Nombres y claves que suelen aparecer en el codigo de suscripciones / VIP.
PATRON_VIP = re.compile(
    r"(?i)(vip|premium|subscri|purchase|billing|\bsku\b|entitle|paywall|is_?pro\b|is_?paid)"
)
PATRON_METODOS_VIP = re.compile(r"(?i)(vip|premium|is_?pro\b|is_?paid|subscri|entitle)")


def analizar_vip(dex_por_nombre: dict[str, bytes], cadenas: set[str]) -> None:
    """Busca los puntos de entrada del sistema VIP para poder escribir el parche."""
    print("=== Cadenas candidatas (claves de prefs, campos JSON, SKUs) ===")
    coincidencias = sorted(c for c in cadenas if PATRON_VIP.search(c))
    for cadena in coincidencias[:150]:
        print(f"  {cadena}")
    if len(coincidencias) > 150:
        print(f"  ... y {len(coincidencias) - 150} mas")

    DEX = cargar_androguard()
    if DEX is None:
        print(
            "\nPara listar tambien clases y metodos candidatos instala androguard:\n"
            "  pip install androguard\n"
            "y vuelve a ejecutar con --vip."
        )
        return

    print("\n=== Metodos candidatos (clase -> metodo) ===")
    encontrados = 0
    for blob in dex_por_nombre.values():
        try:
            dex = DEX(blob)
        except Exception:
            continue
        for clase in dex.get_classes():
            clase_desc = clase.get_name()
            for metodo in clase.get_methods():
                nombre_metodo = metodo.get_name()
                if not PATRON_METODOS_VIP.search(nombre_metodo):
                    continue
                print(f"  {clase_desc}->{nombre_metodo}")
                encontrados += 1
                if encontrados >= 200:
                    print("  ... (limite de 200 alcanzado)")
                    return
    if encontrados == 0:
        print("  Ninguno: el codigo esta ofuscado y habra que buscar por cadenas o por flujo.")


def clases_regex(dex_por_nombre: dict[str, bytes], patron: str) -> None:
    """Lista las clases cuyo descriptor coincide con una expresion regular."""
    DEX = cargar_androguard()
    if DEX is None:
        sys.exit("Esta opcion necesita androguard: pip install androguard")

    regex = re.compile(patron)
    vistas: set[str] = set()
    for nombre, blob in dex_por_nombre.items():
        try:
            dex = DEX(blob)
        except Exception:
            continue
        for clase in dex.get_classes():
            clase_desc = clase.get_name()
            if clase_desc in vistas or not regex.search(clase_desc):
                continue
            vistas.add(clase_desc)
            print(f"{clase_desc}  ({nombre})")
    print(f"\n{len(vistas)} clases coinciden con {patron}")


def metodos_de(dex_por_nombre: dict[str, bytes], patron: str) -> None:
    """Imprime los metodos de las clases cuyo descriptor coincide con una expresion regular."""
    DEX = cargar_androguard()
    if DEX is None:
        sys.exit("Esta opcion necesita androguard: pip install androguard")

    regex = re.compile(patron)
    for blob in dex_por_nombre.values():
        try:
            dex = DEX(blob)
        except Exception:
            continue
        for clase in dex.get_classes():
            clase_desc = clase.get_name()
            if not regex.search(clase_desc):
                continue
            print(f"### {clase_desc}")
            for metodo in clase.get_methods():
                try:
                    descriptor = metodo.get_descriptor()
                except Exception:
                    descriptor = "(?)"
                try:
                    acceso = metodo.get_access_flags_string() or ""
                except Exception:
                    acceso = "?"
                retorno = descriptor.rsplit(")", 1)[-1]
                print(f"    {acceso:22} {metodo.get_name()}{descriptor}  -> {retorno}")
            print()


def llamadas(
    dex_por_nombre: dict[str, bytes],
    patron: str,
    patron_clases: str = r"^L(com/baidu/simeji|com/gbu|sdk)/",
    limite: int = 300,
) -> None:
    """Busca los metodos que llaman a algo que coincida con una expresion regular.

    Se usa para encontrar desde el codigo de la app los puntos de entrada de un SDK
    cuya API esta ofuscada (por ejemplo Pangle).
    """
    DEX = cargar_androguard()
    if DEX is None:
        sys.exit("Esta opcion necesita androguard: pip install androguard")

    regex = re.compile(patron)
    regex_clases = re.compile(patron_clases)
    vistos: set[tuple[str, str]] = set()

    for blob in dex_por_nombre.values():
        try:
            dex = DEX(blob)
        except Exception:
            continue
        for clase in dex.get_classes():
            clase_desc = clase.get_name()
            if not regex_clases.search(clase_desc):
                continue
            for metodo in clase.get_methods():
                try:
                    if metodo.get_code() is None:
                        continue
                    instrucciones = metodo.get_instructions()
                except Exception:
                    continue
                for instruccion in instrucciones:
                    try:
                        salida = instruccion.get_output()
                    except Exception:
                        continue
                    if not regex.search(salida):
                        continue
                    clave = (clase_desc, metodo.get_name())
                    if clave in vistos:
                        continue
                    vistos.add(clave)
                    print(f"{clase_desc}->{metodo.get_name()}{metodo.get_descriptor()}")
                    print(f"      {salida.strip()}")
                    if len(vistos) >= limite:
                        print(f"\n{len(vistos)} metodos (limite alcanzado)")
                        return

    print(f"\n{len(vistos)} metodos coinciden con {patron}")


def metodos_por_nombre(
    dex_por_nombre: dict[str, bytes],
    patron: str,
    limite: int = 400,
) -> None:
    """Lista metodos cuyo NOMBRE coincide con una expresion regular, en cualquier clase.

    Sirve para localizar APIs de SDKs cuyo paquete se ha ofuscado: el nombre del metodo
    suele sobrevivir cuando el SDK declara reglas de proguard para su API publica.
    """
    DEX = cargar_androguard()
    if DEX is None:
        sys.exit("Esta opcion necesita androguard: pip install androguard")

    regex = re.compile(patron)
    vistos: set[tuple[str, str]] = set()

    for blob in dex_por_nombre.values():
        try:
            dex = DEX(blob)
        except Exception:
            continue
        for clase in dex.get_classes():
            clase_desc = clase.get_name()
            for metodo in clase.get_methods():
                nombre = metodo.get_name()
                if not regex.search(nombre):
                    continue
                clave = (clase_desc, nombre)
                if clave in vistos:
                    continue
                vistos.add(clave)
                print(f"{clase_desc}->{nombre}{metodo.get_descriptor()}")
                if len(vistos) >= limite:
                    print(f"\n{len(vistos)} metodos (limite alcanzado)")
                    return

    print(f"\n{len(vistos)} metodos coinciden con {patron}")


def smali(dex_por_nombre: dict[str, bytes], patron: str, limite: int = 1500) -> None:
    """Imprime el bytecode de los metodos de las clases que coinciden con el patron."""
    DEX = cargar_androguard()
    if DEX is None:
        sys.exit("Esta opcion necesita androguard: pip install androguard")

    regex = re.compile(patron)
    lineas = 0

    for blob in dex_por_nombre.values():
        try:
            dex = DEX(blob)
        except Exception:
            continue
        for clase in dex.get_classes():
            clase_desc = clase.get_name()
            if not regex.search(clase_desc):
                continue
            print(f"\n### {clase_desc}")
            for metodo in clase.get_methods():
                try:
                    if metodo.get_code() is None:
                        continue
                    instrucciones = metodo.get_instructions()
                except Exception:
                    continue
                print(f"  .method {metodo.get_name()}{metodo.get_descriptor()}")
                for instruccion in instrucciones:
                    try:
                        print(
                            f"      {instruccion.get_name():24}"
                            f"{instruccion.get_output().strip()}"
                        )
                    except Exception:
                        continue
                    lineas += 1
                    if lineas >= limite:
                        print(f"\n(limite de {limite} lineas alcanzado)")
                        return


def subclases(dex_por_nombre: dict[str, bytes], patron: str) -> None:
    """Lista las clases cuyo padre coincide con el patron."""
    DEX = cargar_androguard()
    if DEX is None:
        sys.exit("Esta opcion necesita androguard: pip install androguard")

    regex = re.compile(patron)
    encontradas = 0

    for blob in dex_por_nombre.values():
        try:
            dex = DEX(blob)
        except Exception:
            continue
        for clase in dex.get_classes():
            try:
                padre = clase.get_superclassname()
            except Exception:
                continue
            if padre and regex.search(padre):
                print(f"{clase.get_name()}  extends  {padre}")
                encontradas += 1

    print(f"\n{encontradas} clases")


def usa_clase(dex_por_nombre: dict[str, bytes], patron: str, limite: int = 200) -> None:
    """Lista las clases que mencionan un tipo (const-class, new-instance, ...)."""
    DEX = cargar_androguard()
    if DEX is None:
        sys.exit("Esta opcion necesita androguard: pip install androguard")

    regex = re.compile(patron)
    vistas: set[str] = set()

    for blob in dex_por_nombre.values():
        try:
            dex = DEX(blob)
        except Exception:
            continue
        for clase in dex.get_classes():
            if regex.search(clase.get_name()):
                continue
            for metodo in clase.get_methods():
                try:
                    if metodo.get_code() is None:
                        continue
                    instrucciones = metodo.get_instructions()
                except Exception:
                    continue
                for instruccion in instrucciones:
                    try:
                        salida = instruccion.get_output()
                    except Exception:
                        continue
                    if not regex.search(salida):
                        continue
                    clave = f"{clase.get_name()}  ({metodo.get_name()}{metodo.get_descriptor()})"
                    if clave in vistas:
                        break
                    vistas.add(clave)
                    print(clave)
                    if len(vistas) >= limite:
                        print(f"\n(limite de {limite} alcanzado)")
                        return


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Comprueba las huellas de los parches de Parche Facemoji sobre una APK.",
    )
    parser.add_argument("apk", type=Path, help="Ruta de la APK / APKM / XAPK de Facemoji")
    parser.add_argument("--informe", action="store_true", help="Resumen de SDK detectados")
    parser.add_argument("--comprobar", action="store_true", help="Comprueba las huellas de los parches")
    parser.add_argument("--buscar", metavar="REGEX", help="Busca cadenas del DEX (VIP, premium, ...)")
    parser.add_argument("--clases", metavar="PAQUETE", help="Lista clases que contengan el paquete")
    parser.add_argument(
        "--clases-regex",
        metavar="REGEX",
        help="Lista clases cuyo descriptor coincide con la expresion regular",
    )
    parser.add_argument(
        "--metodos",
        metavar="REGEX",
        help="Imprime los metodos de las clases cuyo descriptor coincide (requiere androguard)",
    )
    parser.add_argument(
        "--llamadas",
        metavar="REGEX",
        help="Busca metodos que llamen a algo que coincida (requiere androguard)",
    )
    parser.add_argument(
        "--llamadas-clases",
        metavar="REGEX",
        default=r"^L(com/baidu/simeji|com/gbu|sdk)/",
        help="Restringe la busqueda de llamadas a estas clases",
    )
    parser.add_argument(
        "--metodos-nombre",
        metavar="REGEX",
        help="Lista metodos cuyo nombre coincide, en cualquier clase (requiere androguard)",
    )
    parser.add_argument(
        "--smali",
        metavar="REGEX",
        help="Imprime el bytecode de las clases cuyo descriptor coincide (requiere androguard)",
    )
    parser.add_argument(
        "--subclases",
        metavar="REGEX",
        help="Lista las clases cuyo padre coincide (requiere androguard)",
    )
    parser.add_argument(
        "--usa-clase",
        metavar="REGEX",
        help="Lista las clases que mencionan ese tipo en su codigo (requiere androguard)",
    )
    parser.add_argument(
        "--vip",
        action="store_true",
        help="Busca el codigo de suscripcion VIP (cadenas y metodos candidatos)",
    )
    args = parser.parse_args()

    if not args.apk.is_file():
        sys.exit(f"No existe el fichero: {args.apk}")

    silenciar_androguard()

    dex_por_nombre = dex_blobs(args.apk)
    cadenas: set[str] = set()
    for blob in dex_por_nombre.values():
        cadenas.update(dex_strings(blob))

    print(f"{len(dex_por_nombre)} ficheros DEX, {len(cadenas)} cadenas distintas\n")

    if not any(
        (args.informe, args.comprobar, args.buscar, args.clases, args.clases_regex,
         args.metodos, args.metodos_nombre, args.llamadas, args.smali, args.vip,
         args.subclases, args.usa_clase)
    ):
        args.informe = True

    if args.informe:
        informe(cadenas)
    if args.comprobar:
        comprobar(cadenas, dex_por_nombre)
    if args.buscar:
        buscar(cadenas, args.buscar)
    if args.clases:
        listar_clases(dex_por_nombre, args.clases)
    if args.clases_regex:
        clases_regex(dex_por_nombre, args.clases_regex)
    if args.metodos:
        metodos_de(dex_por_nombre, args.metodos)
    if args.metodos_nombre:
        metodos_por_nombre(dex_por_nombre, args.metodos_nombre)
    if args.llamadas:
        llamadas(dex_por_nombre, args.llamadas, args.llamadas_clases)
    if args.smali:
        smali(dex_por_nombre, args.smali)
    if args.subclases:
        subclases(dex_por_nombre, args.subclases)

    if args.usa_clase:
        usa_clase(dex_por_nombre, args.usa_clase)

    if args.vip:
        analizar_vip(dex_por_nombre, cadenas)


if __name__ == "__main__":
    main()
