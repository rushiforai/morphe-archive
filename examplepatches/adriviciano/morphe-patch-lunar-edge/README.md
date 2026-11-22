# Lunar Edge: parches para Morphe

Versión principal **0.3.0** para **Lunar Edge 4.0.2 (40002)**, paquete `com.lunaredge.browser`.

[**Añadir la fuente a Morphe**](https://morphe.software/add-source?github=adriviciano/morphe-patch-lunar-edge) · [Descargar el paquete estable](https://github.com/adriviciano/morphe-patch-lunar-edge/releases/latest)

## Instalar o actualizar

1. Añade la fuente GitHub `adriviciano/morphe-patch-lunar-edge` en Morphe. Si ya la tenías, actualiza la fuente para obtener **0.3.0**.
2. Selecciona el APK/XAPK **original completo de Lunar Edge 4.0.2** desde almacenamiento.
3. Mantén seleccionados los **cuatro parches** y parchea e instala con Morphe.
4. Abre un vídeo y pulsa emitir para seleccionar una Android TV o Chromecast conectado al mismo Wi-Fi.

Si participaste en las pruebas, desactiva las fuentes locales beta y de diagnóstico. Parte del original, sin Cast aplicado. No hace falta una entrada previamente corregida. Conserva la misma clave de firma de Morphe al actualizar una instalación parcheada.

URL de metadatos para clientes que la soliciten:

```text
https://raw.githubusercontent.com/adriviciano/morphe-patch-lunar-edge/main/patches-bundle.json
```

## Parches incluidos

Los cuatro están activados por defecto:

| Parche | Función |
| --- | --- |
| Fix local video engine | Repara el rechazo de la firma modificada en el motor local, que provocaba un falso error de servidor. Admite las bibliotecas conocidas ARM64 y ARMv7. |
| Remove player video ads | Omite las rutas de anuncios del reproductor mediante su continuación existente. |
| Remove player display ads | Omite intersticiales y anuncios superpuestos del reproductor principal. |
| Enable Google Cast | Añade descubrimiento de Android TV/Chromecast, emisión HLS con puente CORS y controles de reproducción, pausa, posición y volumen. Conserva DLNA como alternativa. |

Cast depende de la reparación del motor, por lo que no se puede omitir accidentalmente. Las modificaciones verifican firmas de métodos y las bibliotecas nativas conocidas antes de aplicarse. Otras versiones o variantes requieren un análisis nuevo. Los anuncios de otras pantallas quedan fuera del alcance.

## Emitir a la TV

La emisión en segundo plano ya está integrada en la fuente principal **0.3.0**. No es necesario importar la beta como fuente local. [Pasos de comprobación con pantalla apagada](CAST_PREVIEW.md).

La 0.2.1 registra el servicio que faltaba para alimentar la lista DLNA. Se ha confirmado detección y reproducción en una LG 43UK6300PLB con webOS, con más de dos minutos de avance observado. Google Cast pausa ahora el reproductor local mediante L() en lugar de liberarlo mediante O(). Sigue pendiente comprobar si ese cambio resuelve el corte intermitente de Cast en la Grundig; no estaba disponible durante estas pruebas.

El móvil y la TV deben estar en el mismo Wi-Fi. El selector **Google Cast · 0.3.0** busca receptores y permite introducir su IP si falla el descubrimiento. **Otros televisores (DLNA)** abre el selector original.

Para el HLS del motor local, la app mantiene un puente HTTP en el móvil que añade CORS y sirve listas, segmentos, claves e inicializaciones a la TV elegida. Desde la 0.3.0, un servicio visible mantiene la sesión al bloquear la pantalla o cambiar de aplicación, con una notificación para detenerla. Permite las notificaciones si Android lo solicita. La compilación y las verificaciones pasan; la prueba física con pantalla apagada sigue pendiente. Desde los controles puedes abrir **Diagnóstico de carga** y copiar un informe sin URL ni tokens si aparece un error.

La reproducción de un vídeo real de Lunar Edge se ha confirmado en la Grundig Android TV del usuario con la beta 4; esta estable incorpora ese mismo comportamiento. Las pruebas automáticas verifican protocolo, diagnóstico y puente HLS/CORS. No se ha comprobado cada modelo de TV, fuente, subtítulo, cambio de episodio ni la reproducción prolongada con pantalla apagada.

## Compilar y verificar

Requiere Java/JDK 21, PowerShell y Android SDK Platform 35 (`ANDROID_HOME`).

```powershell
.\scripts\setup-tools.ps1
.\build.ps1
.\scripts\test-cast.ps1
.\scripts\generate-metadata.ps1
```

Genera `dist/lunar-edge-patches-0.3.0.mpp`, con clases JVM, DEX para Morphe en Android y la extensión Cast integrada. Las herramientas se descargan con versiones y SHA256 fijados. Se usa la API incluida en Morphe Desktop 2.2.0 y D8 de JADX 1.5.6.

Ejemplo con Morphe Desktop:

```powershell
java -jar tools\morphe-desktop.jar patch -p dist\lunar-edge-patches-0.3.0.mpp -o dist\lunar-edge-patched.apk 'Lunar+Edge_4.0.2_APKPure.xapk'
.\scripts\verify.ps1 -ApkPath dist\lunar-edge-patched.apk
```

La verificación inspecciona los cambios DEX, Cast/DLNA, motor nativo y firma. ARM64 se probó en el móvil; ARMv7 se verificó estáticamente. Usa una entrada completa que incluya la biblioteca nativa para tu arquitectura.

## Publicación

`patches-list.json` y `patches-bundle.json` se generan desde el paquete principal. Las etiquetas ejecutan GitHub Actions: compila, pasa las pruebas, verifica los metadatos y publica el MPP y sus sumas SHA256. Las versiones estables actualizan la release principal; las versiones con sufijo quedan como prerelease.

No se publican APK, XAPK, herramientas ni claves de firma. El repositorio contiene los parches; cada usuario aporta su APK original. Este proyecto no está afiliado a Morphe ni a Lunar Edge. La extensión no incluye código ni bibliotecas de PyChromecast.

## Referencias

- [Morphe Patcher](https://github.com/MorpheApp/morphe-patcher)
- [Plantilla oficial](https://github.com/MorpheApp/morphe-patches-template)
- [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop)
