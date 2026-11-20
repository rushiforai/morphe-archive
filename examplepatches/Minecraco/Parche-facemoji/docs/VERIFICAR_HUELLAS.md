# 🔍 Verificar y ajustar las huellas

Los parches buscan métodos por sus **huellas** (*fingerprints*). Si una huella no coincide
en tu versión de Facemoji, el parche no funciona. Esta guía explica cómo comprobarlo y cómo
arreglarlo.

## 1. Comprobación rápida con el verificador incluido

Solo necesitas Python 3 (sin Java, sin apktool):

```bash
python3 tools/analizar_apk.py Facemoji.apkm --comprobar
```

Salida real sobre la 3.7.0:

```text
=== Eliminar anuncios ===
  [x] Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils;->b
  [x] Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils;->c
  [x] Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils$AdSuggestionSwitch;->getEnable
  ...
  => 5/5 huellas disponibles.

=== Desbloquear VIP ===
  [x] Lcom/baidu/simeji/coolfont/CoolFontBean;->isVip
  ...
  => 12/12 huellas disponibles.
```

- `[x]` la huella existe en tu APK: el parche la va a interceptar.
- `[ ]` no existe: o la app no usa ese SDK, o ha cambiado (hay que ajustar la huella).

Para un análisis exacto (clase + método, no solo cadenas) instala androguard:

```bash
pip install androguard
python3 tools/analizar_apk.py Facemoji.apkm --comprobar
```

## 2. Ver qué SDK trae la app

```bash
python3 tools/analizar_apk.py Facemoji.apkm --informe
```

Lista AdMob, Facebook Audience Network, Unity Ads, AppLovin, Pangle, ironSource,
Mintegral, Firebase, Crashlytics, AppsFlyer y Adjust.

En la 3.7.0 el resultado es: Pangle/CSJ ~2.000 referencias, AppsFlyer 414, Crashlytics 400,
AdMob 67 (solo stub de mediación), Firebase Analytics 36. **Facebook, Unity, AppLovin,
ironSource, Mintegral, Vungle y Adjust no están.**

## 2 bis. Herramientas de análisis que trae el verificador

Todas necesitan androguard y sirven para localizar objetivos nuevos cuando cambie la versión:

```bash
# Clases cuyo descriptor coincide con una expresion regular
python3 tools/analizar_apk.py Facemoji.apkm --clases-regex '^Lcom/baidu/simeji/[^$]*Vip[^$]*;'

# Metodos (con firma y tipo de retorno) de esas clases
python3 tools/analizar_apk.py Facemoji.apkm --metodos '^Lcom/baidu/simeji/coolfont/CoolFontBean;'

# Metodos por NOMBRE en cualquier clase (util si R8 renombra el paquete pero no el metodo)
python3 tools/analizar_apk.py Facemoji.apkm --metodos-nombre '(?i)^(is_?vip|is_?pro)[A-Za-z_]*$'

# Quien llama a algo (para encontrar el envoltorio propio de un SDK)
python3 tools/analizar_apk.py Facemoji.apkm --llamadas 'is_vip_subscriber' \
    --llamadas-clases '^Lcom/baidu/simeji/'

# Bytecode de una clase, para leer la logica antes de parchearla
python3 tools/analizar_apk.py Facemoji.apkm --smali '^Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils;'
```

## 3. Ajustar una huella que ya no coincide

Las redes publicitarias y los SDK de analítica no ofuscan su API pública, pero a veces
cambian el paquete o la firma del método (por ejemplo, un `show()` que pasa a
`show(Activity, Callback)`).

1. Busca la clase real:

   ```bash
   python3 tools/analizar_apk.py Facemoji.apkm --clases com/google/android/gms/ads
   ```

2. Con [jadx](https://github.com/skylot/jadx) o `apktool d`, abre la clase y mira el método:

   ```bash
   jadx-gui Facemoji.apkm
   ```

3. Actualiza la huella en `patches/src/main/kotlin/app/parchefacemoji/patches/facemoji/ads/Fingerprints.kt`.
   Según lo que devuelva el método, el parche usa una utilidad distinta de `shared/Hooks.kt`:
   `blockVoidMethods` (void), `forceBoolean` (`Z`), `forceInt` (`I`) o `forceBooleanObject`
   (`Ljava/lang/Boolean;`).

## 3 bis. Comprobar que el bundle se aplica (sin dispositivo)

Antes de instalar nada se puede comprobar que el parcheo no rompe la app:

```bash
APK_A_VERIFICAR=/ruta/base.apk ./gradlew verificarParcheo
python3 tools/verificar_parcheado.py patches/build/verificacion/facemoji-parcheado.apk
```

El primero aplica todos los parches y escribe un APK; el segundo revisa el resultado: que la
actividad esté en el manifiesto y que los cuatro ganchos estén en su clase. En el repositorio lo
hace el workflow **Verificar que el parche se aplica** (pestaña *Actions*), que deja el resultado
en [`analisis/96-verificacion-apk.txt`](../analisis/96-verificacion-apk.txt).

## 4. Comprobar en el dispositivo

Con la app parcheada instalada y el teclado abierto:

```bash
adb logcat -s ParcheFacemoji
```

Deberías ver líneas como:

```text
D ParcheFacemoji: anuncio: Peticion de sugerencias
D ParcheFacemoji: vip: Fuentes de color: es VIP
```

Si el log aparece, la interceptación funciona y solo queda comprobar visualmente que el
anuncio ya no se muestra. Si no aparece ninguna línea, la huella no coincide en tu versión.

## 5. Localizar el código VIP

```bash
pip install androguard     # recomendado, lista también métodos
python3 tools/analizar_apk.py Facemoji.apkm --vip
```

Imprime dos listas:

- **Cadenas** que parecen claves de preferencias, campos JSON o SKUs
  (`is_vip`, `vip_status`, `premium_theme`…).
- **Métodos** cuyo nombre contiene `vip`/`premium`/`isPro`/`subscri` (si hay androguard).

Ese listado es lo que se usó para escribir el parche de desbloqueo VIP. Si cambia la versión,
vuelve a ejecutar `--comprobar` y, para las huellas que hayan dejado de coincidir, `--metodos`
sobre la clase afectada para ver su firma nueva.

## 6. Reportar

Abre una incidencia en
<https://github.com/Minecraco/Parche-facemoji/issues> con:

- Versión de Facemoji (`ajustes → acerca de` o el nombre del fichero APK).
- La salida de `python3 tools/analizar_apk.py tu.apkm --comprobar`.
- El mensaje de error de Morphe Manager, si lo hubo.
