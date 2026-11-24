# TikTok Lite Patches

Parches compatibles con Morphe para **TikTok Lite 47.8.15**, paquete `com.zhiliaoapp.musically.go`, código de versión `470815`. La compilación preliminar se probó con los APK divididos de Google Play para ARM64 en un Galaxy A36.

| Parche | Módulo original | Función |
| --- | --- | --- |
| Hide feed ads | `base.apk` | Filtra anuncios en dos recorridos del feed e instala la extensión de Ajustes del mod que usan los demás parches. |
| Prefer clean source for video downloads | `split_df_edit_filter.apk` | Prefiere la fuente de reproducción para las descargas permitidas. Si falta esa fuente, usa la selección original. |
| Open mod settings from profile | `split_df_edit_filter.apk` | Añade Ajustes del mod a Ajustes y privacidad, oculta la sección nativa Acerca de cuando reconoce su estructura y permite abrir el panel manteniendo pulsado Perfil (Yo). |

## Instalación probada con Morphe Desktop

1. Consigue los APK originales de tu instalación y el archivo `.mpp` de [GitHub Releases](https://github.com/KyVexo/tiktok-lite-patches/releases). En Morphe, habilita las versiones preliminares si quieres consultar la serie dev.
2. En una ejecución con selección exclusiva, aplica **Hide feed ads** a `base.apk`. Esta parte del parcheo es necesaria para que funcionen los parches del split.
3. En otra ejecución con selección exclusiva, aplica **Prefer clean source for video downloads** y **Open mod settings from profile** a `split_df_edit_filter.apk`.
4. Conserva los nombres de los splits y usa el mismo identificador y certificado para todos los APK de la instalación. Para actualizar una instalación parcheada, conserva su clave de firma.

La instalación completa en una sola operación desde Morphe Manager sigue pendiente de validar. La descarga del bundle desde GitHub y la instalación de los APK son pasos distintos.

Este repositorio contiene código y bundles de parches. Cada usuario aporta sus APK originales. Proyecto independiente de TikTok y del equipo de Morphe.
