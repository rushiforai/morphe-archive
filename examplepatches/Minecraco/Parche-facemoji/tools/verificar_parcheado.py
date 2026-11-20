"""Comprueba que los parches han llegado de verdad a la APK parcheada.

Se usa despues de `./gradlew verificarParcheo`: mira el manifiesto y el bytecode del APK
resultante para confirmar que las inyecciones estan donde deben.

Uso: python3 tools/verificar_parcheado.py patches/build/verificacion/facemoji-parcheado.apk
"""

from __future__ import annotations

import subprocess
import sys
import zipfile
from pathlib import Path

# (patron de clase, texto que debe aparecer en su bytecode, descripcion)
COMPROBACIONES = [
    (
        r"^Lcom/baidu/simeji/coolfont/CoolFontBean;",
        "esVipActivo",
        "VIP: el gancho pregunta por el ajuste antes de forzar la bandera",
    ),
    (
        r"^Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils;",
        "esAnunciosActivo",
        "Anuncios: el gancho pregunta por el ajuste antes de apagar la sugerencia",
    ),
    (
        r"^Lcom/google/firebase/analytics/FirebaseAnalytics;",
        "esRastreoActivo",
        "Rastreo: el gancho pregunta por el ajuste antes de neutralizar el envio",
    ),
    (
        r"^Lcom/baidu/simeji/skins/v0;",
        "agregarFilaEnLista",
        "Ajustes: la lista real (SettingFragment) mete la fila la primera",
    ),
    (
        r"^Lcom/baidu/simeji/skins/v0;",
        "esNuestraFila",
        "Ajustes: el toque de la fila abre los ajustes del parche",
    ),
    (
        r"^Lef/n;",
        "agregarEntrada",
        "Ajustes: la pantalla principal (SettingsMainFragment) anyade la fila del parche",
    ),
    (
        r"^Lcom/baidu/simeji/settings/SettingsAdvancedFragment;",
        "agregarEntrada",
        "Ajustes: la pantalla avanzada anyade la fila del parche",
    ),
]


def comprobar_manifiesto(apk: Path) -> bool:
    """Comprueba que la actividad de ajustes esta declarada en el manifiesto."""
    try:
        from androguard.core.axml import AXMLPrinter
    except Exception:  # noqa: BLE001
        print("manifiesto: sin androguard, no se comprueba")
        return True

    try:
        with zipfile.ZipFile(apk) as fichero:
            xml = AXMLPrinter(fichero.read("AndroidManifest.xml")).get_xml()
        texto = xml.decode("utf-8", "replace") if isinstance(xml, bytes) else str(xml)
    except Exception as error:  # noqa: BLE001
        print(f"manifiesto: no se pudo leer ({error})")
        return False

    declarada = "parchefacemoji.extension.facemoji.settings.SettingsActivity" in texto
    lanzable = "android.intent.category.LAUNCHER" in texto
    con_sufijo = "-Mod" in texto

    print(f"manifiesto: {'OK, actividad declarada' if declarada else 'FALTA la actividad'}")
    print(f"icono propio: {'OK, categoria LAUNCHER presente' if lanzable else 'FALTA LAUNCHER'}")
    print(f"version marcada: {'OK, aparece el sufijo -Mod' if con_sufijo else 'FALTA el sufijo -Mod'}")

    return declarada and lanzable and con_sufijo


def comprobar_smali(apk: Path) -> bool:
    """Comprueba que cada gancho esta presente en el bytecode del APK parcheado."""
    todo_correcto = True

    for patron, esperado, descripcion in COMPROBACIONES:
        salida = subprocess.run(
            [sys.executable, "tools/analizar_apk.py", str(apk), "--smali", patron],
            capture_output=True,
            text=True,
        ).stdout

        correcto = esperado in salida
        todo_correcto = todo_correcto and correcto
        print(f"{'OK  ' if correcto else 'FALLO'} {descripcion}")

    return todo_correcto


def main() -> int:
    if len(sys.argv) != 2:
        print(__doc__)
        return 2

    apk = Path(sys.argv[1])
    if not apk.is_file():
        print(f"No existe el APK: {apk}")
        return 2

    correcto = comprobar_manifiesto(apk)
    correcto = comprobar_smali(apk) and correcto

    print("\nRESULTADO:", "todo correcto" if correcto else "hay comprobaciones fallidas")
    return 0 if correcto else 1


if __name__ == "__main__":
    raise SystemExit(main())
