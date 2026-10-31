# TV360 Bitel 1.6 (Huawei) — paquete exclusivo de parches

Esta rama está dedicada únicamente a **TV360 Bitel 1.6**, paquete
`com.bitel.tv360`, `versionCode=161`.

Los **13 parches para TV360 3.5 (338)** permanecen en la rama histórica
`feat/tv360-bitel-35-rotation-zoom-privacy`. Sus archivos Kotlin fueron
excluidos de esta rama 1.6 porque sus fingerprints buscan métodos que
no existen en la APK Huawei. No mezclar paquetes `.mpp` de ambas ramas.

## Diez parches disponibles (todos optativos)

1. `TV360 Bitel 1.6 - Sensor Rotation` — manifiesto de HomeBoxActivity.
2. `TV360 Bitel 1.6 - Sensor Rotation (Runtime)` — llamadas en HomeBoxActivity.
3. `TV360 Bitel 1.6 - Video Resize (Fit / Fill)` — selector **al parchear en Morphe**: Ajustar/FIT (sin recorte) o Llenar/ZOOM (recorta bordes). No es un selector dentro del reproductor.
4. `TV360 Bitel 1.6 - Optional Analytics Privacy` — preferencias de analítica opcional.
5. `TV360 Bitel 1.6 - Optional Crash Reports Privacy` — preferencias de Crashlytics.
6. `TV360 Bitel 1.6 - Hide Status Bar` — oculta solo la barra superior de Android en HomeBoxActivity; no toca la barra inferior ni LoginActivity.
7. `TV360 Bitel 1.6 - Expand Behind Status Bar` — junto con Hide Status Bar, conserva las banderas de distribución al navegar y al restablecer visibilidad tras el reproductor; no modifica márgenes propios de TV360.
8. `TV360 Bitel 1.6 - Experimental Picture in Picture` — intenta activar PiP automático en Android 12+ solo cuando `AlticastTopPlayerFragmentBase.onPlayerStateChanged` informa reproducción activa (READY y playWhenReady). **Experimental**: requiere coincidencia exacta del método; al salir la app todavía puede pausar el vídeo.
9. `TV360 Bitel 1.6 - Pure AMOLED Black` — cambia a negro puro `#FF000000` exclusivamente 16 recursos verificados de fondos opacos. Conserva texto, acento rojo, carteles, vídeo, transparencias y controles.
10. `TV360 Bitel 1.6 - Android 16 HyperOS Black Bars` — experimento para Android 16+: solicita ocupar el área de recorte superior y fondo negro puro para navegación de tres botones, conservando los botones; depende de `Expand Behind Status Bar` (y de `Hide Status Bar`). No se ejecuta en Android 15.

**Estado (2026-10-25):** el usuario confirma acceso con numero y contrasena,
reproduccion de video normal y rotacion automatica en Lenovo TB361FU Android 15
tras eliminar el pinch defectuoso. La combinacion exacta de parches habilitados
no esta certificada individualmente. `Hide Status Bar` es nuevo y **aun no se ha
probado en el dispositivo**; compilacion y funcionamiento son verificaciones diferentes.

## Error de reproducción corregido: LinkageError en pinch-to-zoom

El registro de Logcat del usuario al abrir el reproductor mostró:

```
java.lang.LinkageError: Method boolean n2.y.onTouch(
  android.view.View, android.view.MotionEvent
) overrides final method in class n2.n1
  at n2.d.<init>(AlticastPlayerController.java:192)
```

Causa demostrada: el antiguo `Huawei16PinchZoomPatch.kt` inyectaba
`onTouch(View, MotionEvent)` e implementaba `View.OnTouchListener`
directamente en `n2.y`, pero su clase base `n2.n1` declara ese método
como `final`. Android rechaza esa clase con `LinkageError` en cuanto
intenta construir el reproductor. El posterior `System.exit(2)`
es una consecuencia del fallo fatal, no una salida programada.

**Se ha eliminado por completo ese parche del paquete Huawei 1.6.**
No basta con importar el MPP corregido si ya está instalada una APK
modificada: hay que crear una nueva APK **a partir del original**
`TV360 Bitel 1.6.apk`, sin el pinch defectuoso, y verificarla antes de instalar.
No reutilizar una APK parcheada como entrada.

Los parches optativos restantes requieren pruebas aisladas; la reproducción
normal y la rotación automática ya han sido reportadas por el usuario. Este fallo concreto no aporta evidencia de problemas con
DRM, licencias o bibliotecas nativas. No tocar esos componentes.

## Error de compatibilidad resuelto en esta rama

El registro del usuario mostraba 19 parches y fallaba:

```
TV360 Bitel - Content Analytics Controls
Failed to match Fingerprint(
  definingClass=Lcom/viettel/tv360/ui/home/ContentItemClickListener;,
  name=onClick, returnType=V, parameters=[]
)
```

La auditoría local confirmó que `ContentItemClickListener` está
**ausente** en 1.6. Este parche pertenecía a 3.5; no hay un cambio de
firma/método que pueda hacerlo compatible sin realizar un portado real.
La solución fue excluir todas las fuentes 3.5 de este paquete 1.6.

## Pure AMOLED Black (novedad experimental)

- Parche de **solo recursos**, optativo (`default=false`), para la APK Huawei 1.6 (161).
- Auditoría de solo lectura: en el `aapt2 dump resources` facilitado por el usuario aparecen `colorPrimary=#ff121212`, `colorPrimaryDark=#ff121212`, `colorItemPrimary=#ff282828` y `color34=#ff222222`; los XML de inicio y detalle de película los usan como fondos. Otros doce colores de superficies tienen nombres y valores también verificados en el volcado.
- Modifica únicamente esas **16 entradas** de `res/values/colors.xml`. Antes de editar, exige que todas estén presentes una sola vez y con los valores originales esperados; una variante incompatible se rechaza con `PatchException`.
- No cambia iconos, texto, rojo de selección, transparencia, contenido de vídeo, imágenes, login ni bibliotecas nativas.
- **Limitación:** fondos incrustados en drawables, imágenes, estilos o código dinámico que no usen estas 16 entradas pueden continuar grises. No está probado en la tablet; la compilación tampoco garantiza el efecto visual.
- Para probarlo, usar el APK original local como entrada y activar únicamente `Pure AMOLED Black` además de los parches **ya verificados** que se deseen conservar. No desinstalar ni borrar datos ante un conflicto de firma.

## Android 16 / HyperOS: recorte superior y botones negros (experimental)

- Evidencia: fotografía aportada por el usuario del Redmi Note 13 Pro 4G, Android 16, con iconos de estado ocultos pero una franja superior sin contenido y barra de **tres botones sobre blanco**; la Lenovo Android 15 ya funciona correctamente. El estado interno de la ventana Redmi no está confirmado por `dumpsys`.
- Parche **opcional**, compatible con `com.bitel.tv360` 1.6 (161), con guardia `SDK_INT >= 36`. **En Android 15 no realiza ningún cambio**.
- Usa los métodos ya existentes `HomeBoxActivity.onCreate(Bundle)` y `onResume()` y conserva la lógica ya validada de `Hide Status Bar` y `Expand Behind Status Bar`.
- Arriba: `layoutInDisplayCutoutMode = ALWAYS (3)` para permitir que la ventana ocupe la zona de la cámara frontal. No manipula márgenes de interfaz no auditados, no fuerza un `setDecorFitsSystemWindows(false)` que pudiera tapar las pestañas inferiores.
- Abajo: añade `FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS`, limpia `FLAG_TRANSLUCENT_NAVIGATION`, solicita `navigationBarColor = #FF000000`, desactiva `navigationBarContrastEnforced` y pide iconos de navegación **claros** para conservar los tres botones visibles.
- **Hipótesis que debe probarse:** la reserva superior proviene del modo de display cutout de una APK con `targetSdk=33`; HyperOS puede mantener su propia reserva o la app puede tener un espacio interno. La API habilita el uso de esa zona, pero no garantiza por sí sola que el encabezado se desplace hasta arriba.
- **No desinstalar TV360 ni borrar datos** para probar. Construir siempre desde el APK original local; comparar capturas del Redmi en Inicio, TOP 10 y detalles, y comprobar rotación, pantalla de vídeo, salida por botones, acceso y diálogos. Si los botones de navegación quedan ocultos bajo contenido o hay botones superiores tapados por la cámara, interrumpir la prueba y revertir a la versión que ya funciona.
- Fuentes Android: [display cutouts](https://developer.android.com/develop/ui/views/layout/display-cutout), [edge-to-edge](https://developer.android.com/develop/ui/views/layout/edge-to-edge).

## Uso en Morphe Manager

- Importar el artefacto `patches-1.51.0.mpp` de una ejecución de
  GitHub Actions **posterior** al commit de aislamiento de fuentes,
  no el artefacto antiguo que presentaba 19 parches TV360.
- Sustituir/eliminar la fuente de parches antigua si Manager sigue
  enumerando los parches 3.5. El nombre de versión 1.51.0 puede repetirse
  entre artefactos de distintos commits, así que comprobar el run/commit.
- En la lista correspondiente a `com.bitel.tv360` 1.6 deberían
  aparecer diez parches TV360, todos con nombre
  `TV360 Bitel 1.6 - ...`.
- Probar por separado: primero `Hide Status Bar`, después `Expand Behind Status Bar`
  (depende del primero). El primero reaplica `FLAG_FULLSCREEN` al terminar
  `onCreate` y `onResume`; en Android 11+ solicita ocultar únicamente
  `WindowInsets.Type.statusBars()`. El segundo conserva `0x500` en el
  decor y en dos restablecimientos originales de TV360 (listener `d0`
  y runnable `h0.a`); no cambia `navigationBars()` ni desactiva globalmente
  `setDecorFitsSystemWindows`.
- **No validado visualmente:** comprobar Inicio, TOP 10, ficha de película,
  regresar del reproductor, rotación, login, diálogos y barra de navegación.
  Si la franja gris de ~62 px persiste, recoger una captura de ventanas con
  TV360 *realmente* en primer plano. La segunda franja negra del vídeo es
  distinta y queda fuera de esta corrección.
- No instalar sobre una APK con certificado de firma diferente: preservar
  aplicación y datos, sin desinstalar para probar estos parches.
- Para video FIT/ZOOM, el selector aparece en las opciones **de Morphe** antes
  de generar la APK, NO durante la reproducción. FIT fuerza modo 0 en ambas
  llamadas verificadas; ZOOM fuerza modo 4 en la segunda (la primera ya es 4).
  Cambiar de opción requiere reconstruir; la interfaz en vivo no está implementada.
- PiP es **experimental** y NO verificado en el dispositivo. Antes de
  seleccionarlo, revisar el método `onPlayerStateChanged` con
  `audit_huawei16_pip.py` sobre la APK original sin subirla. El parche
  requiere la firma exacta `(AnalyticsListener.EventTime, boolean, int)`.
  Solo activa autoentrada si hay reproducción READY; la continuidad de
  vídeo/audio al salir de TV360 aún no está comprobada y la app podría pausarla.
- No volver a habilitar ningún parche antiguo de `Pinch FIT/ZOOM`: causaba
  un `LinkageError` del reproductor. Los controles de gestos que ya trae
  TV360 permanecen intactos.
- Mantener las librerías nativas ARM64 de la APK Huawei para las
  pruebas: su eliminación no causa este fallo de fingerprint pero sí
  podría impedir el inicio de la aplicación.

**Ninguno de los tres cambios nuevos está validado en la tablet**; la
compilación de Kotlin no equivale a compatibilidad con el APK ni a éxito
visual de PiP/espaciado. No instalar ni desinstalar sobre una versión con
firma diferente si hay riesgo de perder datos.

Los scripts `audit_huawei16_*.py` son de solo lectura y funcionan en
Termux sobre el APK original sin subirlo a servicios externos.

Los parches no modifican firmas nativas, DRM, licencias ni protecciones.

Detalle y evidencias: `HUAWEI_1_6.md`.
