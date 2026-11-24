# Proyectos similares (revisado el 2026-11-09)

Búsqueda en GitHub (`gh search repos`) con varias combinaciones: youtube tv patches, morphe tv, revanced android tv,
tizentube, youtube leanback, youtube cobalt, notubetv. Revisados README y, en el caso de ysamjo, también el código.

## Parchean la app oficial de YouTube para Android TV (`com.google.android.youtube.tv`)

| Proyecto | Desde | Herramienta | ¿Cambia el paquete? | ¿MicroG? | Qué hace |
|---|---|---|---|---|---|
| [ysamjo/morphe-patches](https://github.com/ysamjo/morphe-patches) (★8, GPLv3) | 2026-10-10 | **Morphe** | No (mismo paquete, re-firmado) | No | URL de arranque (`cobalt.APP_URL`) + userscript de bloqueo de anuncios vía `evaluateJavaScript`. Sus propias pruebas dicen que la eficacia del bloqueo **no está demostrada** del todo. 7.11.300 / 7.25.302. |
| [NRXQuantum/morphe-youtube-tv-shorts](https://github.com/NRXQuantum/morphe-youtube-tv-shorts) (★0, GPLv3) | 2026-11-09 | **Morphe** | No indicado | No | Quita los Shorts inyectando JS en `onResume` (mismo método: `WebContentsImpl.b` + `evaluateJavaScript`). 7.28.301. |
| [DylanDuff/utv-runtime](https://github.com/DylanDuff/utv-runtime) (★0, MIT) | 2026-10-11 | apktool + smali | **Sí, convive con el original** | No; "sobrevive a los rechazos de Play Services" | Runtime JS con ajustes dentro de la propia configuración de YouTube: bloqueo de anuncios, ocultar pestañas, ocultar Shorts. |
| [pearlxcore/YouTube-TV-NoAds](https://github.com/pearlxcore/YouTube-TV-NoAds) (★13, MIT) | 2026-10-25 | patcher propio en Python | Parece que sí ("su propio icono en la TV") | No mencionado | Filtro de anuncios. APK listo para descargar (7.30.301). Probado en Sony, Hisense y TCL. |
| [whitedictator/youtube-medusa](https://github.com/whitedictator/youtube-medusa) (★11, sin licencia en el repo) | 2026-10-26 | No indicado (código fuente no publicado en el repo) | **Sí** (`local.rvxtv.youtube`) | No mencionado | Basado en YouTube TV 7.24.300: SponsorBlock, anuncios, doblaje Yandex, códecs, actualizador propio. El más completo. |

## Clientes independientes (no parchean la app oficial)

- [ycngmn/NoTubeTV](https://github.com/ycngmn/NoTubeTV) (★381): archivado; recomienda TizenTube Cobalt.
- [reisxd/TizenTubeCobalt](https://github.com/reisxd/TizenTubeCobalt): Cobalt compilado por ellos + mods de TizenTube.
- Otros: VacuumTube (escritorio), SmartTube, YTArk, cleantube, YouPipe-TV, FireTube…

## No son de YouTube

- [ajstrick81/morphe-androidtv-patches](https://github.com/ajstrick81/morphe-androidtv-patches) (★289): parches de Morphe
  para Disney+, Prime Video, Netflix, HBO Max, etc. **No incluye YouTube.**

## Qué aporta YouTV Morphe frente a esto

- **Lo único que no encontré en ningún otro:** el parche **"GmsCore support" (MicroG-RE)** para YouTube TV hecho como
  parche de Morphe. Cambia el paquete, así que convive con el original.
- **Pero no está claro que MicroG sea necesario.** utv-runtime y Medusa cambian el paquete sin usar MicroG, y nuestro
  inicio de sesión se hizo **por código de activación**, que no pasa por la cuenta de MicroG.
  **Resultado de la prueba (2026-11-09):** sin MicroG la app **se cierra al arrancar**, porque el Play Services real
  rechaza DroidGuard para el paquete nuevo. Con MicroG funciona. El parche de MicroG es, por tanto, la diferencia
  real frente a los demás. (utv-runtime y Medusa, en cambio, capturan ese rechazo; no sabemos qué pierden con ello.)
- La inyección de JS para anuncios y Shorts **ya existe** como parche de Morphe (ysamjo, NRXQuantum). Se puede
  reutilizar (GPLv3) en vez de reescribirla.
