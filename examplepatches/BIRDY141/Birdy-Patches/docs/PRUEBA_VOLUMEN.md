# Teclas de volumen: corrección en desarrollo

Solicitud relacionada: [#17](https://github.com/jair1c/farotv-patches/issues/17).

## Causa y alcance

En YouTube TV 7.32.300 y 8.02.300, `CobaltActivity.onKeyDown/onKeyUp` consulta `dispatchKeyEventToIme` antes del manejo normal de Android. El motor web puede consumir las teclas de volumen. FaroTV no tenía una modificación propia de estas teclas.

El parche **Fix volume keys**, activado por defecto, devuelve `false` en esa consulta exclusivamente para subir (24), bajar (25) y silenciar (164). Así continúa el manejo original de Android. Las demás teclas mantienen la ruta original; no se ajusta manualmente el volumen ni se introduce un temporizador de repetición.

## Pruebas del 16 de noviembre de 2026

- LX352, Android 12, YouTube TV 8.02.300, conexión ADB en 192.168.101.10.
- Antes: el inicio de Android respondía a toques cortos; FaroTV, una vez cargado, mantenía el volumen en 7 al enviar subir y bajar por ADB.
- Después, con **v1.7.0-dev.2** instalada: subir/bajar cortos dieron 5 → 6 → 5 → 6 → 5. Una pulsación larga de subir dio 5 → 8 y otra de bajar 8 → 7. Estos últimos valores describen la inyección ADB, no una velocidad uniforme del mando físico.
- Sin excepciones AndroidRuntime en la muestra recogida tras las pruebas.
- Silenciar y volver a activar por ADB funcionaron: volumen 4 sin silencio → 0 silenciado → 4 sin silencio. La actividad continuó abierta tras enviar izquierda/derecha.
- El parche se aplicó y reconstruyó correctamente también sobre 7.32.300; esa versión no se instaló en el TV durante esta prueba.
- Las nueve pruebas de traducción e interfaz pasaron y GitHub compiló/publicó la versión de desarrollo correctamente.

El usuario confirmó que funciona con el mando físico del LX352. El fallo de volumen queda corregido en ese equipo. Queda la prueba de Yared en su dispositivo; tampoco se han validado receptores HDMI-CEC o salidas Bluetooth. No promover a estable hasta terminar la validación acordada. Esta versión de desarrollo incluye además el árabe de iiurn, cuya validación visual sigue pendiente.
