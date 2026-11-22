# Solicitud #17: subtítulos y rendimiento

## Subtítulos: comprobación en LX352

El 16 de noviembre de 2026 se revisó YouTube TV 8.02.300 con FaroTV v1.7.0-dev.2. El reproductor existente ofrece:

1. Abrir los controles del vídeo y seleccionar el engranaje de configuración.
2. Entrar en **Subtítulos**.
3. Desplazarse hasta el final de la lista y abrir **Traducido de forma automática**.
4. Elegir un idioma de los ofrecidos por YouTube para ese vídeo.

Se observaron español como recomendado y otros idiomas, como alemán, árabe, chino tradicional, coreano, francés e hindi. Al seleccionar español quedó marcado **Español (Traducido de forma automática)**. Esto confirma la disponibilidad y selección del menú en el vídeo probado; todavía no confirma la descarga y presentación de texto traducido durante el vídeo. El texto «Los subtítulos se ven así» del panel es una muestra de estilo, no evidencia de traducción del contenido.

La revisión del código web público servido por [YouTube TV](https://www.youtube.com/tv) confirma que ese menú depende de la lista `translationLanguages` que expone el reproductor. No se añadió un parche para inventar pistas ni una traducción externa. La [ayuda oficial de YouTube para TV](https://support.google.com/youtube/answer/15921047?hl=es) describe los ajustes de subtítulos y su disponibilidad por vídeo.

Para reproducir el caso de Yared se necesita el enlace de un vídeo concreto y el idioma de destino, junto con su versión de YouTube TV/FaroTV. No dar por resuelto su caso solo porque el menú esté disponible en otro vídeo. No se ha implementado reconocimiento de voz ni traducción de vídeos sin una pista de subtítulos.

## Rendimiento: primera mejora comprobada

En **v1.7.0-dev.3**, la hoja CSS que oculta los vídeos relacionados del reproductor solo se reescribe cuando cambia ese ajuste. Antes se reescribía en cada respuesta que incluía controles del reproductor.

La prueba automatizada usa 500 respuestas consecutivas: antes registraba 500 escrituras CSS y después una. También comprueba que activar y desactivar el ajuste sigue actualizando la hoja. Esto reduce trabajo redundante; no equivale a una mejora porcentual del rendimiento total de la app ni demuestra que todos los tirones denunciados por Yared estén resueltos.

Las diez pruebas de traducción e interfaz y la compilación de GitHub pasaron. La investigación de otros cuellos de botella requiere medir el caso de navegación/reproducción en el dispositivo afectado. En el LX352 se observó presión de memoria durante una instalación con la app abierta; esa observación no identifica por sí sola la causa de la lentitud habitual.

El volumen ya fue confirmado con el mando físico del LX352; se documenta en [PRUEBA_VOLUMEN.md](PRUEBA_VOLUMEN.md). El soporte árabe y las mejoras continúan en desarrollo hasta completar sus pruebas respectivas.
