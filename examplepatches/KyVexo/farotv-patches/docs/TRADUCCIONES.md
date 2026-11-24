# Idiomas de FaroTV

Los textos visibles propios de FaroTV se guardan en `extensions/extension/src/main/locales/`. Los catálogos disponibles son `es.json`, `en.json` y `ar.json`. El árabe fue aportado por [iiurn](https://github.com/iiurn) en la solicitud #16. Incluyen ajustes y descripciones, avisos de SponsorBlock, accesibilidad del contador de votos, reinicio, tarjetas informativas y diálogos nativos de MicroG.

La interfaz consulta el idioma explícito de YouTube (`HL` o `INNERTUBE_CONTEXT.client.hl`), después el idioma del documento y, si no está disponible, el del navegador. Un idioma regional como `es-PE` usa `es` si no hay catálogo regional. Un idioma no disponible usa inglés. Cada texto también tiene respaldo individual en inglés. Los títulos se resuelven cuando YouTube vuelve a construir los ajustes, sin cambiar los identificadores guardados.

Los diálogos nativos usan el último idioma detectado por la interfaz. Antes de que la interfaz pueda cargar por primera vez —por ejemplo, si falta MicroG— utilizan el idioma de Android. Los textos del instalador del sistema y los textos originales de YouTube siguen siendo responsabilidad de esas aplicaciones.

## Añadir un idioma

1. Copiar `en.json` en la misma carpeta, usando una etiqueta de idioma en minúsculas como `fr.json`, `pt-br.json` o `ar.json`.
2. Traducir los valores y conservar todas las claves, así como los marcadores `{brand}`, `{section}`, `{youtube}`, `{features}`, `{count}`, `{abi}`, `{message}` y `{status}` donde aparezcan. Los nombres FaroTV, Morphe, SponsorBlock, MicroG-RE y Return YouTube Dislike son marcas o nombres propios.
3. Conservar los espacios de `list.and` y `sponsor.skipped`: separan textos compuestos.
4. Ejecutar `node --test tools/tests/i18n.test.cjs` y compilar. Gradle y GitHub verifican que todos los catálogos tengan las mismas claves y marcadores. Se incorporan automáticamente tanto al código web como al nativo; no hay que editar cada función ni mantener una lista de idiomas en código.
5. Publicar primero una versión `.dev` y comprobar el idioma real en un TV. Los idiomas de derecha a izquierda también necesitan revisar dirección, foco del mando y disposición visual; añadir su catálogo no basta para dar esa presentación por validada.

Las traducciones están incluidas en los parches: no se realizan consultas a servicios de traducción ni se necesitan claves externas.

## Árabe: validación en desarrollo

Los avisos propios de SponsorBlock y los diálogos nativos de MicroG aplican dirección RTL. Los ajustes y la confirmación de reinicio usan los componentes de YouTube y su idioma configurado. No se fuerza la dirección de toda la página ni se modifican las preferencias guardadas. Falta comprobar en TV la disposición, el foco del mando, los textos largos y los diálogos nativos antes de promover esta versión a estable.
