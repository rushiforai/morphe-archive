# Pruebas de 1.5.0-dev.1

Fecha: 15 de noviembre de 2026. Dispositivo LX352, Android 12, ARM de 32 bits. Base YouTube TV 8.02.300, variante con Spoof device. Se descargó el bundle de la publicación de GitHub, se aplicó con validación y se instaló conservando los datos.

SHA-256 del bundle publicado: `f23e48358f79f2bdfca5fecdbf3dc0bd2d019281f8c23919d408661f095154cc`.

## SponsorBlock

Aprobado el salto real del patrocinio en `edkymo3w4Ms` (Air Jordan 4 Lightning Review and On Foot !). La API devolvió el segmento 21.458305–72.82421. El registro del TV muestra `sponsorblock: skipped patrocinio 21.5-72.8`; la sesión multimedia continuó reproduciendo sin error, con posición posterior al segmento. No se sustituyeron datos por segmentos simulados.

## Return YouTube Dislike

Aprobada la consulta y la representación visible en `dQw4w9WgXcQ`. El registro indica 521904 y el botón enfocado muestra «521,9 mil». Se desactivó temporalmente la opción de ocultar los votos. No se pulsaron Me gusta, No me gusta ni Suscribirse. También se recibió un resultado para `ApXoWvfEYVU` (663470).

## Reinicio

Aprobados el diálogo nativo «Reinicio necesario», la cancelación «Más tarde» y la confirmación «Reiniciar» al cambiar Ocultar Shorts. El registro muestra `restart requested`, nueva carga del runtime, registro de 26 ajustes y reaplicación de filtros. Es una recarga de la interfaz web; no implica terminar y crear un nuevo proceso Android.

## Reproductor

Se desactivaron individualmente las opciones y reaparecieron Canal, Descripción, Suscribirse, votos, Comentarios, Guardar y la fila de relacionados. En el menú aparecen Denunciar, Comentarios y Estadísticas.

Para la comprobación aislada se desactivan todos los filtros, se activa solo el evaluado y se vuelve a abrir el video. Las capturas de Katy Perry - Roar (`CevxZvSJLk8`) confirman por separado Canal, Descripción, Suscribirse, Me gusta/No me gusta, Comentarios y Guardar: desaparece el control evaluado y reaparecen los anteriores al desactivar su filtro. Denunciar/Enviar comentarios también pasa la comparación del menú: con su filtro activo desaparecen Denunciar y la entrada de comentarios del menú, mientras Estadísticas permanece disponible.

Preguntar (IA) y Súper gracias no aparecen en los videos examinados; cambiar sus ajustes no demuestra su ocultación real.

Estadísticas pasa la prueba aislada inversa: con solo ese filtro activo desaparece Estadísticas del menú, y Denunciar y Comentarios vuelven a mostrarse. No se ejecutaron denuncias ni se enviaron comentarios.

Relacionados pasa la comparación visual: sin el filtro se muestra la fila de miniaturas bajo los controles; con solo ese filtro activo la fila desaparece y los botones permanecen visibles.

| Ajuste | Resultado real |
| --- | --- |
| Canal | Aprobado, aislado |
| Descripción | Aprobado, aislado |
| Suscribirse | Aprobado, aislado |
| Me gusta / No me gusta | Aprobado, aislado |
| Comentarios | Aprobado, aislado |
| Guardar | Aprobado, aislado |
| Denunciar / Enviar comentarios | Aprobado, aislado en menú |
| Estadísticas | Aprobado, aislado en menú |
| Relacionados | Aprobado, aislado |
| Preguntar (IA) | No ofrecido por YouTube en los videos probados; no verificado |
| Súper gracias | No ofrecido por YouTube en los videos probados; no verificado |

Se restauran los filtros de ocultación al estado activado encontrado al iniciar las pruebas. No se modificaron el código funcional ni el bundle publicado para ejecutar estas comprobaciones.

## Límites e incidencias

Durante la sesión previa a la instalación de esta publicación, el sistema forzó la detención de MicroG y terminó FaroTV por esa dependencia. Sigue siendo el punto pendiente acordado; estas pruebas no lo corrigen ni lo dan por resuelto.

Las capturas y registros completos permanecen locales en `compatibilidad/pruebas-funciones`, fuera del repositorio: contienen datos de la cuenta. No se publica ningún APK. Esta publicación sigue siendo de prueba y no se ha promovido a estable.
