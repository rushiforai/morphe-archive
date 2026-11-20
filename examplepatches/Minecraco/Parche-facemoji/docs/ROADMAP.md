# 🚧 Roadmap

## Hecho

- **Ajustes de Minecraco**: pantalla propia (interruptores de anuncios, VIP y rastreo) con una
  fila dentro de los ajustes de Facemoji, que es un `android.preference.PreferenceFragment`.
  Los parches son condicionales: el smali pregunta al ajuste antes de actuar.
- **Verificación del parcheo en CI**: `verificarParcheo` aplica el bundle a la APK real y un
  script comprueba manifiesto y bytecode del APK resultante.
- **Eliminar anuncios** (parcial): apaga el motor de **sugerencias patrocinadas** del teclado
  (`AdSuggestionUtils`), que es el anuncio que aparece mientras se escribe.
- **Desbloquear VIP**: fuentes de color (`CoolFontBean`), series de stickers (`SeriesStickerItem`,
  `StickerItem`), TextBomb (`TextBombBean`) y frases del teclado Rizz (`RizzConfigInfoDetail`,
  `RizzConfigInfoDetail2`, `RizzIceBreakerConfigInfoDetail`), incluidos los desbloqueos por vídeo.
- **Desactivar rastreo**: Firebase Analytics, Crashlytics, AppsFlyer (Facebook no está en la app).
- **Quitar permiso de ID de publicidad** (`AD_ID`).

## Cómo se hizo (3.7.0)

El análisis completo está en [`analisis/`](../analisis). Lo importante:

- El `RemoveAdsPatch` original apuntaba a la API pública de AdMob y **no coincidía con nada**
  (`--comprobar` daba 0/10): la app no usa `BaseAdView`, `InterstitialAd` ni `AdLoader`.
- La red real es **Pangle/CSJ (ByteDance)**, cuyas clases ha renombrado R8. No hay ningún nombre
  estable dentro del SDK para engancharse, así que el parche no puede bloquearlo desde dentro.
- El sistema VIP no está centralizado: cada catálogo lleva su propia bandera `isVip` y esas
  banderas conservan el nombre, que es lo que explota el parche.

## Hecho: entrada en la lista de ajustes principal

La pantalla de ajustes que se ve en la app **no es una pantalla de preferencias**. Se descartaron,
una por una, las seis pantallas basadas en `PreferenceScreen` de la APK (`prefs_advanced`,
`prefs_correction`, `prefs_gesture`, `prefs_screen_gesture`, `prefs_about_debug`,
`prefs_about_release`): son los ajustes del **teclado**, no esta pantalla.

La pantalla real la construye `SettingFragment`, que en la 3.7.0 es `com.baidu.simeji.skins.v0`
(se localizó porque es el único código que menciona `FaqActivity`). Monta un `RecyclerView` con
filas del modelo `La9/b`, guardadas en el campo `menuItems`, y despacha los toques con un
`packed-switch` sobre el tipo de la fila.

Cómo se resuelve:

1. Se inyecta una llamada al final del método que llena la lista (`u2`, el `onViewCreated`).
2. Esa llamada busca la lista por su contenido (el primer campo `List` cuyos elementos responden a
   `getKey()`), crea una fila más con el mismo modelo y la pone en el índice 0.
3. Se engancha el manejador de toques (`V2`) para que, si la fila pulsada es la nuestra
   (comparada por identidad), abra la pantalla del parche.

Aprendizaje para la próxima vez: las búsquedas de huellas hay que hacerlas **sin restringir el
paquete** a `com/baidu/simeji`. Las dos pistas que resolvieron esto (`Lef/n` y
`skins/v0`) estaban en clases ofuscadas fuera de los paquetes "lógicos".

## Pendiente: publicidad a pantalla completa

Los anuncios de bienvenida y los emergentes los sirve Pangle. Opciones para atacarlos en el futuro:

1. **Encontrar el envoltorio propio de la app** que llama a Pangle. En 3.7.0 no hay llamadas
   directas (`--llamadas 'openadsdk'` da 0 resultados), así que o se hace por reflexión o vive en
   clases con nombre de una letra. Habría que seguir el flujo desde
   `com.baidu.simeji.skins.video.*VideoRewardActivity` con jadx.
2. **Parchear el arranque del SDK** por firma de método en vez de por clase (los nombres de método
   de Pangle también se renombraron, así que es frágil).
3. **Bloquear a nivel de red** (`hosts`/DNS): no es un parche de Morphe, pero es lo único que
   corta el 100 % de los anuncios sin tocar el bytecode.

## Ideas siguientes

- **Ajustes por bandera**: hoy el interruptor de VIP toca todas las banderas a la vez (fuentes,
  stickers, TextBomb, Rizz). Se podrían separar en cuatro interruptores.
- **Más pantallas de ajustes**: solo se ha enganchado `SettingsAdvancedFragment`; si hay otra
  pestaña de ajustes donde encaje mejor la fila, añadirla.
- **Compatibilidad de versiones**: cuando cambie la versión, volver a ejecutar
  `tools/analizar_apk.py --comprobar` para ver qué huellas siguen vivas.
- **Ocultar avisos internos** (valoración, actualización obligatoria): sus métodos suelen ser
  `void` sin parámetros y encajan con `blockVoidMethods`.
