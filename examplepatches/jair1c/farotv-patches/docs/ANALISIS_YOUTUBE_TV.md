# Análisis: YouTube para Android TV 7.32.300

Fecha: 2026-11-09. APK descargado de APKMirror (variante APK única, armeabi-v7a, Android 7.0+).

## Datos del APK

| Campo | Valor |
|---|---|
| Paquete | `com.google.android.youtube.tv` |
| Versión | 7.32.300 (versionCode 732300320) |
| minSdk / targetSdk | 24 / 36 |
| Arquitectura | solo `armeabi-v7a` |
| Tamaño | 74.950.560 bytes |
| Firma | `CN=ytandroidtv, O=Google Inc.` |
| Firma SHA-256 | `21199d112cece428c82cb0df221da24ff8674c7a982a83a17a970eec43305b4a` |
| Firma SHA-1 | `61226bdb57cc32c8a2a9ef71f7bc9548e95dcc0b` |
| Actividad de arranque | `com.google.android.apps.youtube.tv.activity.ShellActivity` (leanback) |

## Conclusión principal: la interfaz es web (Cobalt / "Chrobalt")

- `lib/armeabi-v7a/libchrobalt.so` (61 MB): Cobalt, el motor de Google para TVs, ahora basado en Chromium.
- `assets/cobalt_shell.pak`: recursos del shell.
- La app carga **`https://www.youtube.com/tv`**, la misma web de YouTube que usan las Smart TV (cliente `TVHTML5`).
- Java solo pone el "envoltorio": actividad, reproductor de bajo nivel (ExoPlayer/MediaCodec), audio, cuentas y Cast.

**Consecuencia:** casi nada de los parches de YouTube móvil se puede copiar. Esos parches tocan la interfaz nativa
(Litho, layouts, recursos), y en la TV la interfaz es JavaScript descargado de internet que no viene dentro del APK.

## Dónde se puede intervenir

### 1. Inyectar JavaScript en la página (vía principal)
Es la idea de proyectos como TizenTube en Tizen: meter un script en `youtube.com/tv` que salte o quite anuncios,
añada SponsorBlock, etc.

Lo que se encontró:
- `dev/cobalt/shell/Shell.java`: ahí se registra el puente Java↔JS (`initializeJavaBridge`) y se carga la URL inicial
  (`shellManager load url:`). Fingerprint: `InitializeJavaBridgeFingerprint`.
- `dev/cobalt/coat/javabridge/*`: interfaz `CobaltJavaScriptAndroidObject` + anotación `@CobaltJavaScriptInterface`.
  Funciona como `addJavascriptInterface` de WebView. Hoy solo se expone `HTMLMediaElementExtension`.
- `cobalt.org.chromium.content.browser.JavascriptInjectorImpl`: inyector de interfaces de Chromium.
- `org.jni_zero.GEN_JNI` conserva los nativos
  `WebContentsImpl_evaluateJavaScript(...)` y `RenderFrameHostImpl_executeJavaScriptInIsolatedWorld(...)`.
  Sus envoltorios Java fueron eliminados por R8, pero la función nativa sigue ahí. **Sin probar**: llamarla desde la
  extensión requiere el puntero nativo del `WebContentsImpl`.
- `dev/cobalt/shell/StartupGuardNavigationObserver.java`: observador de navegación (`didFinishNavigationInPrimaryMainFrame`,
  `didStartLoading`). Buen sitio para inyectar el script cada vez que carga la página.

Plan sugerido:
1. Engancharse a `didFinishNavigationInPrimaryMainFrame` (o a `Shell` tras `loadUrl`).
2. Desde la extensión Java, ejecutar un `userscript.js` empaquetado en la extensión mediante `evaluateJavaScript`.
3. Si `evaluateJavaScript` no es accesible, alternativa: registrar un objeto propio con `@CobaltJavaScriptInterface`
   y, desde la URL inicial o un parámetro, hacer que la página lo use.

### 2. URL de arranque
`dev/cobalt/coat/CobaltActivity.java` toma `--url=` de los argumentos de Starboard y avisa si no empieza por
`https://www.youtube.com/tv` (`Non-Youtube startup URL detected.`). Fingerprint: `StartupUrlFingerprint`.
Sirve para añadir parámetros a la URL o apuntar a una página propia de pruebas.

### 3. Capa nativa (`libchrobalt.so`)
Bloquear peticiones de anuncios a nivel de red sería lo más potente, pero exige parchear binario ARM de 61 MB.
No recomendado para empezar.

## MicroG-RE (GmsCore)

La app sí depende de Google Play Services. Cadenas encontradas:
- `com.google.android.gms.signin.internal.ISignInService`, `IAccountAccessor`, `auth_account_client` → **inicio de sesión**
- `com.google.android.gms.droidguard.internal.IDroidGuardService`, `potokens.internal.IPoTokensService` → **verificación del dispositivo / PoToken**
- `com.google.android.gms.cast.tv.*` → **Cast** (mandar videos desde el móvil)
- `phenotype`, `clearcut`, `mobstore` → configuración remota y telemetría
- Receptor `android.accounts.action.ACCOUNT_REMOVED` → usa cuentas de Android (AccountManager)

Implicaciones:
- El parche `GmsCoreSupportPatch` de morphe-patches (carpeta `shared/misc/gms`) se puede **copiar** (es GPLv3)
  y llamar con `fromPackageName = com.google.android.youtube.tv`, `spoofedPackageSignature = 61226bdb...`
  y un fingerprint de `onCreate` de `ShellActivity`/`CobaltActivity`. No está en `morphe-patches-library`,
  así que hay que traerlo al proyecto.
- **DroidGuard/PoToken** es el riesgo mayor: si MicroG-RE no lo resuelve, YouTube puede bloquear la reproducción.
  En móvil Morphe lo compensa con `spoofVideoStreamsPatch`; en TV habría que comprobarlo.
- MicroG-RE **no declara `leanback`**: se instala por adb, pero no aparece en el launcher de la TV, y su pantalla
  de inicio de sesión está pensada para pantalla táctil.
- Alternativa a investigar: la web de TV permite iniciar sesión con código (youtube.com/activate). Si ese flujo
  funciona sin GMS, quizá se pueda prescindir de MicroG para la cuenta. **Sin comprobar.**
- Cast TV seguramente deje de funcionar con MicroG.

## Orden de trabajo propuesto

1. **Prueba mínima:** parchear solo el nombre de paquete + GmsCore support, instalar en la TV y ver si arranca,
   carga `youtube.com/tv` y permite iniciar sesión.
2. **Inyección de JS:** conseguir ejecutar un `console.log` propio en la página (depurable con `chrome://inspect`,
   ya que `Shell` llama a `setAllowInspection(true)`).
3. **Bloqueo de anuncios en JS:** filtrar `adPlacements`/`playerAds` en las respuestas del reproductor dentro de la página.
4. SponsorBlock, ajustes, etc.

## Estado: parche "GmsCore support" para TV (compilado y aplicado el 2026-11-09; sin probar en TV)

Resultado del parcheo de 7.32.300 con morphe-desktop 2.1.1 (`--validate`):
- Paquete nuevo `app.tvpatches.android.youtube.tv`; los metadatos `SPOOFED_PACKAGE_NAME`/`SIGNATURE` de MicroG están en el manifest.
- `dls.b` devuelve 0 de inmediato (Play Services "disponible") y `dls.c` vuelve sin hacer nada.
- `ekg.a()` contiene `app.tvpatches.android.youtube.tv` en lugar del paquete original.
- `CobaltActivity.onCreate` llama a `GmsCoreSupportPatch.checkGmsCore(this)` antes de `super.onCreate`.
- APK firmado con la clave por defecto de Morphe (`tools/morphe-data/morphe.keystore`).

Prueba en una TV real (Skyworth OTT-01, Android 12): arranca, carga `youtube.com/tv`, usa MicroG-RE y reproduce, tanto
como invitado como con la sesión iniciada **por código de activación** (yt.be/activate; confirmado por el usuario).
DroidGuard/PoToken no bloqueó la reproducción. El inicio de sesión con la cuenta de MicroG-RE no se ha probado, así
que todavía no está claro cuánto depende la app de MicroG. La pantalla de inicio de sesión ofrece activación por código (yt.be/activate), que no pasa por la pantalla de
cuentas de MicroG. Detalle en el README raíz.

Archivos:
- `patches/.../shared/clone/CloneAppPatch.kt`: copia de Morphe; añadido `com.google.android.youtube.tv` a la lista de apps
  cuyos permisos y providers los gestiona el parche GmsCore.
- `patches/.../shared/gms/GmsCoreSupportPatch.kt`: versión recortada del de Morphe. Se quitaron los ajustes, el manejo
  de enlaces y GNP (las cadenas de GNP no existen en la app de TV). La consulta de paquetes MicroG está incluida aquí.
- `patches/.../youtubetv/misc/gms/GmsCoreSupportPatch.kt`: aplica lo anterior a YouTube TV.
- `extensions/.../youtubetv/GmsCoreSupportPatch.java`: extensión mínima; si falta MicroG-RE muestra un diálogo usable con mando.

Anclas comprobadas con jadx en 7.32.300:
- `GooglePlayUtilityFingerprint` → `dls.b(Context, int)` (cadenas `MetadataValueReader`, `This should never happen.`).
- `ServiceCheckFingerprint` → `dls.c(Context, int)` (`Google Play Services not available`).
- `PrimeMethodFingerprint` → `ekg.a()`, que contiene la lista de paquetes de Google, incluido `com.google.android.youtube.tv`.
- `CobaltActivityOnCreateFingerprint` → `dev.cobalt.coat.CobaltActivity.onCreate(Bundle)`. `ShellActivity` solo lanza
  `MainActivity`, que hereda de `CobaltActivity`.

## Pendiente para compilar

- Token de GitHub con permiso `read:packages` en `~/.gradle/gradle.properties` (`gpr.user`, `gpr.key`).
  Sin él, `gradlew buildAndroid` no descarga el plugin de Morphe.
- Probar en un Android TV real o en el emulador de Android TV (imagen ARM o con traducción ARM, ya que el APK es solo armeabi-v7a).

## Ficheros clave (salida de jadx)

- `com/google/android/apps/youtube/tv/activity/ShellActivity.java`
- `dev/cobalt/coat/CobaltActivity.java` (≈ línea 1000: URL de arranque)
- `dev/cobalt/shell/Shell.java` (≈ líneas 60–100: puente JS y `loadUrl`)
- `dev/cobalt/shell/StartupGuardNavigationObserver.java`
- `dev/cobalt/coat/javabridge/`
- `org/jni_zero/GEN_JNI.java` (líneas 808–820, 1332, 1616)
