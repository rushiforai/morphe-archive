# TikTok Lite Patches

La versión estable v0.1.1 está dirigida a **TikTok Lite 47.8.2** (código `470802`), paquete `com.zhiliaoapp.musically.go`. Se probó el APK nodpi de APKMirror en un Galaxy A36 con una copia instalada como `.morphe`.

| Parche | Función |
| --- | --- |
| Hide feed ads | Filtra anuncios, muestra un contador de sesión y añade el interruptor opcional para ocultar publicaciones de fotos. |
| Prefer clean source for video downloads | Prefiere la fuente de reproducción cuando la descarga está permitida y la fuente limpia está disponible. |
| Open mod settings from profile | Añade Ajustes del mod a Ajustes y privacidad. Mantener pulsado Perfil también abre el panel. |
| Stop video looping | Añade un interruptor en Reproducción para detener el video al terminar. Viene apagado. |
| Clean share links | Quita parámetros de seguimiento conocidos y deja solo la URL al usar Copiar enlace. Se selecciona al parchear. |
| Show exact counts | Añade un interruptor en Apariencia para ver cifras completas en el feed y los perfiles. El interruptor viene apagado. |
| Show video seekbar | Añade un interruptor en Reproducción para mostrar la barra de progreso y adelantar o retroceder. |
| Hide suggested accounts | Añade un interruptor en Privacidad para ocultar las cuentas recomendadas en Perfil y Mensajes. |
| Hide inbox story tray | Añade un interruptor en Privacidad para ocultar la bandeja de historias en Mensajes. |
| Pause first video on launch | Añade un interruptor en Reproducción para iniciar el primer video de Para ti en pausa. |

Los interruptores aparecen cuando se aplica el parche correspondiente en Morphe Manager.

**Ajustes del mod → Apariencia** también permite elegir el color de acento mediante muestras o un HEX personalizado. Se aplica al panel, al botón de seguir del feed y a los contadores y al aviso flotante de Mensajes. El rosa original es el valor inicial.

## Instalar la versión estable

1. Añade el catálogo estable a Morphe Manager o descarga el bundle `.mpp` de la versión estable en [GitHub Releases](https://github.com/KyVexo/tiktok-lite-patches/releases) y usa el APK original **47.8.2 nodpi**.
2. Aplica los parches al APK con Morphe. Puedes activar **Clone app** para instalar la copia junto a la original. Si actualizas una copia existente, usa el mismo identificador y certificado de firma.
3. En el teléfono, abre **Ajustes y privacidad → Ajustes del mod** o mantén pulsado **Perfil**.

La preliminar v0.1.1-dev.7 se verificó en el Galaxy A36 con APK generados por Morphe Manager. El parche LIVE no se incluye en 47.8.2 porque ese APK carece del módulo de reproducción usado por la edición anterior.

Este proyecto distribuye código y bundles de parches. Cada usuario aporta su APK original. Proyecto independiente de TikTok y del equipo de Morphe.

## Validación pendiente en Perfil

En TikTok Lite 47.8.2, **Ocultar cuentas recomendadas** ya se probó en Mensajes con el interruptor activado y desactivado, sin reiniciar la app. Las conversaciones y notificaciones quedaron visibles.

La validación visual en **Perfil** sigue pendiente porque las recomendaciones aún no aparecen en la copia `.morphe` del Galaxy. Cuando aparezcan con el interruptor apagado, comprobar que el bloque desaparezca al activarlo y reaparezca al desactivarlo.
