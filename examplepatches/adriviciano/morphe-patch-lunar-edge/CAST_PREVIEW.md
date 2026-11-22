# Emisión en segundo plano · 0.3.0

La versión principal 0.3.0 incorpora el mantenimiento de segundo plano para Google Cast y DLNA/LG. Falta comprobarlo en un móvil real: el usuario hará la prueba después.

## Instalar y probar

1. Actualiza la fuente GitHub `adriviciano/morphe-patch-lunar-edge` en Morphe a **0.3.0**. [Añadir la fuente](https://morphe.software/add-source?github=adriviciano/morphe-patch-lunar-edge).
2. Utiliza esa fuente principal y desactiva las fuentes beta locales anteriores. No hace falta importar un MPP manualmente.
3. Selecciona el APK/XAPK original completo de Lunar Edge 4.0.2 y los cuatro parches. No uses una APK con Cast aplicado.
4. Parchea e instala conservando la misma firma de Morphe. Inicia un vídeo y selecciona la TV; en LG usa «Otros televisores (DLNA)».
5. Permite las notificaciones si Android lo solicita. Al emitir debe aparecer **Emitiendo a TV** con **Dejar de emitir**.
6. Comprueba primero el vídeo con la app abierta. Cambia a otra aplicación dos minutos y luego bloquea la pantalla otros dos o más minutos. Verifica que el vídeo sigue avanzando en ambas situaciones.
7. Desbloquea, vuelve a Lunar Edge y detén la emisión. La notificación debe desaparecer. Si hay un corte en Google Cast, copia el Diagnóstico de carga; incluye el estado del servicio de segundo plano.

Cerrar únicamente el diálogo de controles no detiene la emisión. El botón Dejar de emitir sí la detiene. La función está limitada a una sesión de emisión; no convierte la reproducción local sin TV en audio de fondo ni pretende sobrevivir a Forzar detención de Android.

## Implementación

- Servicio interno `CastKeepAliveService`, tipo `connectedDevice`, iniciado al elegir receptor desde la Activity visible. No se inicia al abrir el selector ni desde el arranque del sistema.
- Notificación persistente para volver a la app y detener. Permiso de notificaciones opcional; no es requisito de inicio del servicio.
- Wake lock parcial renovable durante la sesión y solicitud Wi-Fi de Android. WifiLock de alto rendimiento solo en Android anterior a 14, donde mantiene su comportamiento con pantalla apagada; desde API34 se transforma en low-latency y no protege ese caso.
- Guardas después de `super.onPause()` y `super.onResume()`: se conserva el comportamiento original cuando esa Activity no emite. Durante la emisión se evita la parada del motor y la reanudación con sonido del reproductor local.
- Hooks de conexión, parada, descarte, eventos y desconexión DLNA. Cast libera el servicio al terminar, detener o perder la sesión.
- La sesión usa un identificador de propietario para que una desconexión antigua no cierre una emisión nueva. Se liberan wake lock, Wi-Fi, callback de red y notificación al terminar; no hay reinicio automático tras muerte del proceso.

## Validación y límites

Pruebas de propiedad/cierre concurrente de sesión, regresiones del puente y verificación de manifiesto y DEX en APK ARM64/ARMv7. La verificación exige permisos, servicio no exportado, tipo correcto, guardas que respeten super y ruta original, y hooks DLNA.

La compilación y las verificaciones no sustituyen la prueba física con pantalla apagada, las restricciones de batería del fabricante o el ahorro profundo prolongado. No se ha confirmado aún ese comportamiento en el móvil del usuario.

Referencias oficiales: [tipos de servicio](https://developer.android.com/develop/background-work/services/fgs/service-types#connected-device), [wake locks](https://developer.android.com/develop/background-work/background-tasks/awake/wakelock), [WifiManager](https://developer.android.com/reference/android/net/wifi/WifiManager#WIFI_MODE_FULL_HIGH_PERF).
