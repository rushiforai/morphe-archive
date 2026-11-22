# Idiomas de la web

La página de GitHub Pages (`docs/index.html`, controlador `docs/site.js`) ofrece un selector superior con español, inglés, chino simplificado, hindi, árabe, portugués, francés, bengalí, ruso y urdu. Son idiomas de la web; los catálogos de la aplicación para TV son independientes y ofrecen español, inglés y árabe (este último en desarrollo).

La selección inicial usa el parámetro `?lang=`, después la preferencia local guardada y después los idiomas del navegador. Las variantes regionales usan el idioma base. Si ninguno está disponible, usa inglés. El selector guarda la elección cuando el navegador lo permite y actualiza el enlace sin recargar la página. Las estadísticas se descargan una sola vez y se vuelven a presentar con los formatos numéricos y de fecha del idioma seleccionado.

## Añadir o revisar una traducción

1. Copiar `docs/locales/en.json` a un nuevo archivo y traducir sus 93 valores, conservando las claves, enlaces y marcadores `{title}`, `{version}` y `{time}`.
2. Añadir la opción al selector `#site-language`, con su etiqueta escrita en el propio idioma. El controlador obtiene de ese selector los idiomas disponibles.
3. Si requiere otra dirección de escritura, añadirlo a la condición RTL del controlador. Árabe y urdu ya usan `dir="rtl"`; las capturas originales no se invierten.
4. Ejecutar `node --test tools/tests/site-locales.test.cjs`. La prueba comprueba claves, marcadores, opciones del selector y etiquetas de formato permitidas. Actualizar el número esperado de idiomas al incorporar uno nuevo.
5. Revisar el texto y el diseño en un navegador antes de publicar. Los catálogos son traducciones iniciales; se aceptan correcciones de hablantes de cada idioma.

No se consulta ningún servicio externo de traducción. Las capturas mantienen el idioma con el que se tomaron; sus títulos, descripciones y textos de accesibilidad sí cambian.

## Verificación del 15 de noviembre de 2026

- Diez idiomas a 1440, 390 y 320 píxeles de ancho: 30 combinaciones, sin desbordamiento horizontal ni errores JavaScript.
- Idioma y dirección del documento; títulos, descripciones, atributos accesibles y formatos de estadísticas.
- Persistencia de la selección, detección de preferencias regionales del navegador y respaldo en inglés para un idioma no disponible.
- Filtros de versiones, ampliación de capturas, cierre con Escape y mensajes de error de GitHub.

Las estadísticas de las pruebas locales se simularon para hacer las comprobaciones reproducibles; no son cifras de descargas reales. Las capturas y los resultados detallados se guardan localmente en `compatibilidad/web-idiomas`.

El despliegue utiliza la configuración existente de GitHub Pages: rama `main`, carpeta `/docs`. El cambio se guarda primero en `dev`, se comprueba y después se integra en `main`; no modifica ni publica un nuevo bundle de parches.
