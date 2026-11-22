# Versión principal 0.3.0: emisión en segundo plano

Integra en la fuente habitual de Morphe el soporte de emisión con pantalla apagada o cambiando a otra app, tanto para Google Cast como para DLNA/LG. Se inicia un servicio visible al elegir la TV y aparece una notificación con **Dejar de emitir**. Mantiene CPU y conexión durante la sesión y libera los recursos al terminar.

Actualiza la fuente `adriviciano/morphe-patch-lunar-edge` en Morphe, selecciona el APK/XAPK original completo de Lunar Edge 4.0.2 y los cuatro parches. Desactiva las fuentes beta locales para utilizar el paquete principal. No hace falta importar un MPP manualmente.

Permite notificaciones si Android lo solicita. Cuando el vídeo se reproduzca en la TV, cambia de app y bloquea después la pantalla; comprueba que continúa y que al detener desaparece la notificación.

La compilación, las comprobaciones de manifiesto/DEX y las regresiones de sesiones y streaming pasan. **La prueba física con pantalla apagada sigue pendiente**: el usuario la hará después. La publicación en la fuente principal se realiza a petición expresa, sin dar esa prueba por superada.
