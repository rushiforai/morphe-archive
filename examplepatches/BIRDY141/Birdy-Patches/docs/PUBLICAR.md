# Cómo publicar los parches

## Qué es "morphe-patches.software"

Es el índice comunitario de Morphe. **No aloja parches**: lista *bundles* (fuentes de parches) que cada autor publica en
su propio repositorio público de GitHub o GitLab. Para aparecer ahí se envía la URL del repositorio con el formulario
"Submit a bundle". El índice lee las *releases* del repositorio.

Hoy el índice tiene **1 bundle** para "YouTube for Android TV" (`com.google.android.youtube.tv`), con 2 parches
(probablemente ysamjo). Ninguno incluye MicroG-RE, menú propio en Ajustes, botones del reproductor ni "Spoof device".

Los usuarios instalan los parches así: en Morphe Manager añaden la URL del repositorio como fuente de parches y
parchean su propio APK de YouTube TV. **Nunca se distribuye el APK de Google**, ni original ni parcheado.

## Pasos

1. **Nombre del proyecto (decidido el 2026-11-09).** App: **FaroTV**. Sección en Ajustes: **FaroTV**. Repositorio:
   **farotv-patches** (`github.com/jair1c/farotv-patches`). Bundle: "FaroTV Patches". "Morphe" solo aparece de forma
   descriptiva ("compatible with Morphe"), como pide la sección 7c del NOTICE de Morphe.
2. **Metadatos** en `patches/build.gradle.kts`: ya puestos (FaroTV Patches, autor jair1c, source/website/contact del
   repositorio farotv-patches).
3. **Repositorio git** en `morphe-tv-patches/` (no en la carpeta raíz: `apk/` y `tools/` contienen el APK de Google, la
   clave de firma y herramientas de terceros que **no** se suben).
   - `.gitignore` ya excluye `build/`.
   - Hay que revisar que no entren `build.log` ni nada de `apk/`.
4. **GitHub**: crear el repositorio público y subir la rama `dev` (prerelease) y luego `main` (estable). El workflow
   `release.yml` de la plantilla compila, crea la release con el `.mpp` y actualiza `patches-bundle.json` /
   `patches-list.json`. Necesita:
   - el secreto `MORPHE_SIGNING_KEY` (clave para firmar el `.mpp`; se genera una nueva, no la del APK);
   - commits con formato *Conventional Commits* (`feat:`, `fix:`) para que semantic-release decida la versión;
   - en Settings → Actions, permitir que Actions cree pull requests (lo usa `open_pull_request.yml`).
5. **Compilar con GitHub Packages**: el workflow ya usa `GITHUB_TOKEN`, que en Actions tiene permiso para leer
   paquetes.
6. **Probar** la release instalándola desde Morphe Manager (añadir fuente → URL del repositorio) en un TV.
7. **Enviar** la URL del repositorio en https://morphe-patches.software/#submit (marcar "I maintain this bundle").

## Licencias y créditos

- Código derivado de Morphe/ReVanced (GmsCore support, Clone app): GPLv3 con los términos de la sección 7 del
  NOTICE de Morphe, que ya está incluido.
- utv-runtime (MIT, Dylan Duff) y ysamjo/morphe-patches (GPLv3): citados en `NOTICE`.
- `libytvshim.so` es código propio (GPLv3); conviene publicar también su fuente (`native/ytvshim/`), como ya está.

## Riesgos a decidir antes de publicar

- **Bloqueo de anuncios** y **Spoof device** van contra las condiciones de YouTube. Es habitual en este tipo de
  proyectos, pero el riesgo (avisos de DMCA o retirada del repositorio) es del autor.
- "Spoof device" viene desactivado por defecto.
- Los parches solo están probados con la versión **7.32.300**. Hay que declararlo así en `compatibleWith` (ya está) y
  en el README.

## Estado (2026-11-10)

- Repositorio público: https://github.com/jair1c/farotv-patches
- Versiones: `v1.0.0-dev.1` (prueba) y `v1.0.0` (estable, "Latest"), con `.mpp` firmado.
- Commits con el correo privado de GitHub (`197553077+jair1c@users.noreply.github.com`). El historial se reescribió
  una vez para quitar el correo personal; las notas de semantic-release se movieron a los commits nuevos.
- Enviado al índice de morphe-patches.software el 2026-11-10 (sin correo). El formulario detectó los 6 parches.
  Queda pendiente de revisión por los mantenedores del índice.
- Pendiente: probar la instalación desde Morphe Manager añadiendo el repositorio como fuente.
