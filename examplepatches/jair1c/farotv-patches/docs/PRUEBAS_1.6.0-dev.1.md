# Pruebas de idiomas: 1.6.0-dev.1

Fecha: 15 de noviembre de 2026. LX352, Android 12, YouTube TV 8.02.300 con Spoof device. Se descargó el bundle publicado por GitHub, se parcheó con `--validate` y se instaló conservando los datos. La publicación continúa como `.dev`.

## Comprobaciones automatizadas

`node --test tools/tests/i18n.test.cjs`: seis pruebas aprobadas. Comprueban claves y marcadores en los 77 textos de cada catálogo, variantes regionales, prioridad del idioma de YouTube sobre el del navegador, respaldo en inglés por idioma y por texto, conservación de los identificadores y valores guardados, construcción de los 26 ajustes y tarjetas informativas, comandos del diálogo de reinicio, formato y accesibilidad de votos, y aviso traducido de SponsorBlock. Las respuestas de votos y segmentos de estas pruebas son simuladas; no sustituyen pruebas reales de los servicios.

Compilación local y publicación en GitHub correctas; la verificación de traducciones también se ejecuta en el workflow de publicación.

## Comprobaciones visuales en el TV

- Con YouTube en Español (Latinoamérica): FaroTV Parches, Bloquear anuncios y las descripciones se muestran en español.
- Poner Android en inglés no cambió la preferencia de idioma ya guardada por YouTube. FaroTV siguió a YouTube en español, como corresponde.
- Se seleccionó English (US) en YouTube > Settings > Language y se confirmó su recarga. La interfaz propia cambió a FaroTV Patches, Block ads, Customize player y los demás ajustes visibles en inglés.
- Al cambiar Hide Shorts aparece el diálogo Restart required con su mensaje, Restart y Later en inglés. Se probó Later y se restauró la opción activada usando Restart.
- La tarjeta About muestra FaroTV Patches 1.6.0-dev.1, su descripción completa y View repository en inglés. App version confirma Language: en.
- Se restauraron Android a `es-PE` y YouTube a Español (Latinoamérica). Los ajustes propios vuelven a FaroTV Parches, Bloquear anuncios y sus descripciones en español; el registro confirma `UI language: es`. La cuenta y los interruptores se conservaron.

Las capturas y registros completos se conservan solo localmente en `compatibilidad/pruebas-funciones`, porque contienen datos de la cuenta.

## Límites

Los diálogos nativos de descarga e instalación de MicroG se tradujeron con los mismos catálogos y compilan, pero no se desinstaló MicroG para forzar ese flujo. Su presentación visual completa sigue sin probar en esta versión. El formato y el aviso de SponsorBlock tienen pruebas automatizadas de traducción; esta sesión no repite un salto real de patrocinio ni una consulta de votos en ambos idiomas.

No se declara resuelto el cierre cuando el sistema detiene MicroG ni la instalación desde la interfaz de Morphe Manager. No se respondió ni se cerró la solicitud #11 de GitHub.
