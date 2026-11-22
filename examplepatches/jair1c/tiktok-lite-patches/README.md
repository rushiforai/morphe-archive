# TikTok Lite Patches

Parches independientes compatibles con Morphe para **TikTok Lite 47.8.15**, paquete `com.zhiliaoapp.musically.go`, código de versión `470815`. La versión preliminar se probó con la variante ARM64 de Google Play en un Galaxy A36.

| Parche | Módulo original | Función |
| --- | --- | --- |
| Hide feed ads | `base.apk` | Filtra entradas marcadas como anuncios y algunas etiquetas comerciales explícitas. La cobertura de todos los anuncios sigue en evaluación. |
| Prefer clean source for video downloads | `split_df_edit_filter.apk` | Prefiere la fuente de reproducción al guardar un video permitido. Conserva la selección original si falta esa fuente. |

## Prueba con Morphe Desktop

Usa una copia de los APK originales de tu propia instalación y el bundle de [Releases](https://github.com/jair1c/tiktok-lite-patches/releases). Los parches se aplican en dos ejecuciones con selección exclusiva, cada uno sobre el módulo indicado. Para instalar la copia, el conjunto de APK debe compartir el identificador de prueba y el mismo certificado. El módulo modificado conserva su nombre de split.

El flujo probado en el Galaxy A36 prepara los módulos por separado y los instala con ADB. La instalación en un solo paso con Morphe Manager está pendiente de validar. Una actualización de la copia de prueba requiere conservar su clave de firma.

Este repositorio contiene código y bundles de parches. Cada usuario aporta sus APK originales. Proyecto independiente de TikTok y del equipo de Morphe.
