# Compatibilidad de FaroTV

## Estado del 15 de noviembre de 2026

Los puntos de cierre en segundo plano y prueba desde la interfaz de Morphe Manager quedan pendientes por decisión del usuario. Esta rama solo trabaja en compatibilidad, a partir de la estable v1.4.2; no incluye el commit local 714c164.

| YouTube TV | ABI examinada | Firma original | Parcheo normal | Con Spoof device | Prueba en TV |
| --- | --- | --- | --- | --- | --- |
| 7.32.300 | armeabi-v7a | Google | Validado previamente | Validado previamente | LX352 y OTT-01 |
| 8.02.300 | armeabi-v7a | Google, verificada | Correcto con v1.4.2 y --validate | Correcto con v1.4.2 y --validate | Compatibilidad estable; reproducción y funciones comprobadas en LX352 con Spoof device |

APK de 8.02.300: versión de paquete 802300320, 75 163 552 bytes. SHA-256 del archivo:
`a4fab76d43098e62fa2fcb3a20df0693475d4c2e4872bc13477e619b1d33b8cb`.

Fuente: https://www.apkmirror.com/apk/google-inc/youtube-for-android-tv-android-tv/youtube-for-android-tv-8-02-300-release/

La versión 8.02.300 se declara compatible sin marca experimental después de las pruebas de reproducción y funciones en el LX352. Esta clasificación no amplía las arquitecturas ni los dispositivos probados: la ejecución sin Spoof device en otro TV y los controles que YouTube no ofreció siguen sin verificar.

La compilación local con la declaración experimental terminó correctamente. Se repitieron los cuatro casos (7.32.300 y 8.02.300, con y sin Spoof device) sin `--force`: todos pasaron `--validate`, reconstrucción del APK y comprobación del nombre de paquete. Los resultados JSON no contienen parches fallidos.

## Prueba real en el LX352

El 15 de noviembre se actualizó sobre 7.32.300, con la misma firma y sin borrar datos, usando la variante con Spoof device. Se guardó el APK anterior para recuperación local.

- Se conservó la cuenta previamente autorizada. No se repitió una autorización nueva por QR.
- Arranque y navegación por Inicio correctos; marca FaroTV y filtros de anuncios y Shorts activos en el registro.
- Reproducción comprobada visualmente y mediante la sesión multimedia (estado reproduciendo y sin error).
- Configuración muestra FaroTV Parches, ilustraciones y opciones SponsorBlock. Compras y membresías permanece oculta.
- Acerca de lee correctamente YouTube 8.02.300; la versión de parches de esta compilación local sigue siendo 1.4.2.
- En 300 segundos de monitorización se mantuvo el PID 4492. La primera muestra registra ShellActivity y las siguientes MainActivity en primer plano. No se detectaron FATAL EXCEPTION, ANR de FaroTV ni errores registrados por TvPatches.
- La prueba posterior sobre el bundle publicado `1.5.0-dev.1` confirma un salto real de SponsorBlock, el contador visible de Return YouTube Dislike, el diálogo de reinicio y nueve filtros individuales del reproductor. Preguntar (IA) y Súper gracias no aparecieron y siguen sin verificación real. Los detalles constan en [PRUEBAS_1.5.0-dev.1.md](PRUEBAS_1.5.0-dev.1.md). La variante sin spoof solo tiene validación de parcheo; no se ejecutó en otro TV.

Las capturas, los registros y monitor.json quedan fuera del repositorio, en la carpeta local `compatibilidad/prueba-lx352-8.02.300`, porque incluyen datos de la sesión del usuario. No se publica ningún APK.

## Repetir la comprobación

`tools/Test-Compatibility.ps1` recibe un APK original, el bundle, morphe-desktop, la carpeta build-tools del SDK y una carpeta de salida. Verifica el certificado de Google, parchea las variantes normal y spoof con resolución única de fingerprints y comprueba el paquete de salida. No instala las aplicaciones. `-ForceVersion` sirve únicamente para explorar un APK aún no declarado compatible.

## Arquitecturas

La prueba actual cubre ARM de 32 bits. El editor ELF y la biblioteca libytvshim.so de Spoof device solo cubren esa arquitectura. ARM64 necesita su biblioteca, un editor ELF64 y un APK original con el que validar las importaciones. No anunciar ARM64 ni x86 como compatibles a partir de estas pruebas.
