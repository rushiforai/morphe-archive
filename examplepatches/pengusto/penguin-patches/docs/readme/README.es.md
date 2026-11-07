# Penguin Patches

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="../assets/penguin-patches-banner-tailor-dark.png">
  <source media="(prefers-color-scheme: light)" srcset="../assets/penguin-patches-banner-tailor.png">
  <img src="../assets/penguin-patches-banner-tailor.png" alt="Penguin Patches" width="1800">
</picture>

[English](../../README.md) · [Deutsch](README.de.md) · [简体中文](README.zh-CN.md) · [日本語](README.ja.md) · [Español](README.es.md) · [한국어](README.ko.md) · [Português (Brasil)](README.pt-BR.md) · [Français](README.fr.md)

[![Release](https://img.shields.io/github/v/release/pengusto/penguin-patches?label=release)](https://github.com/pengusto/penguin-patches/releases/latest) [![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-blue)](../../LICENSE) [![Android](https://img.shields.io/badge/platform-Android-3DDC84)](../SETUP.md) [![Morphe compatible](https://img.shields.io/badge/Morphe-compatible-6f42c1)](../SETUP.md)

**Tus aplicaciones, un poco mejores.**

Penguin Patches es una colección independiente de parches para Android compatible con Morphe Manager. Añade mejoras y corrige problemas de aplicaciones existentes. No está afiliada a Morphe ni a los proyectos originales.

> Esta página se ha traducido con IA y no cuenta con revisión de un hablante nativo. La galería completa y las guías técnicas están actualmente en inglés; en caso de discrepancia prevalece la versión inglesa.

## Qué hace

Incluye, entre otros cambios, descripciones legibles en Calendar, zoom de imágenes en Feeder, ajustes de Finamp y un cliente OAuth de Reddit propio para Infinity+. Consulta el catálogo y la guía de cada aplicación para conocer los cambios y las versiones originales compatibles.

**Aplicaciones compatibles:** [Feeder](../FEEDER.md) · [Finamp](../FINAMP_NATIVE.md) · [Fossify Calendar](../CALENDAR.md) · [Fossify Clock](../CLOCK.md) · [Fossify Contacts](../CONTACTS.md) · [Fossify File Manager](../FILE_MANAGER.md) · [Fossify Messages](../MESSAGES.md) · [Fossify Music Player](../MUSIC.md) · [Infinity+](../INFINITY.md) · [Komikku](../KOMIKKU.md) · [Kvaesitso](../KVAESITSO.md) · [Mihon](../MIHON.md) · [Read You](../READYOU.md) · [Tasks.org](../TASKS.md)

[**Aplicaciones y versiones exactas compatibles →**](../../README.md#generated-patch-catalogue)

## Antes y después

Ejemplo: en Finamp, el parche coloca al artista del álbum antes que los demás participantes. Las imágenes son capturas reales de APK en Android con datos musicales sintéticos.

| Antes: otros participantes aparecen antes del artista del álbum | Después: el artista del álbum aparece primero |
| :---: | :---: |
| <img src="../../tests/finamp/evidence/2026-10-28/credits-before.png" alt="Antes: otros participantes aparecen antes del artista del álbum" width="360"> | <img src="../../tests/finamp/evidence/2026-10-28/credits-after.png" alt="Después: el artista del álbum aparece primero" width="360"> |

[Ver todas las comparaciones](../../README.md#patch-previews) · [Capturas y pruebas](../../tests/finamp/evidence/2026-10-28/README.md)

## Resumen de parches

- [Evitar notificaciones de conversaciones visibles](../../README.md#preview-avoid-notifications-for-visible-conversations)
- [Elegir el aviso anticipado de cada alarma](../../README.md#preview-choose-upcoming-alarm-notification-time)
- [Configurar un cliente OAuth propio en Infinity+](../../README.md#preview-configure-custom-oauth-for-infinity)
- [Descartar la notificación al marcar como leído](../../README.md#preview-dismiss-notifications-when-marking-conversations-read)
- [Finamp Complete: las ocho mejoras](../../README.md#preview-finamp-complete-all-eight-fixes)
- [Importar fuentes OPML anidadas](../../README.md#preview-import-nested-opml-feeds)
- [Mantener sin leer las conversaciones en segundo plano](../../README.md#preview-keep-background-conversations-unread)
- [Mantener favoritos al renombrar o borrar carpetas](../../README.md#preview-keep-favorites-consistent-after-folder-rename-or-removal)
- [Conservar manga local en búsquedas de exclusión](../../README.md#preview-keep-local-manga-in-exclusion-searches)
- [Ir a la tarea superior](../../README.md#preview-navigate-to-the-parent-task)
- [Priorizar la portada incrustada de cada canción](../../README.md#preview-prefer-each-track-s-embedded-cover)
- [Conservar descargas excluidas de la categoría predeterminada](../../README.md#preview-preserve-excluded-default-category-downloads)
- [Mostrar descripciones de Calendar legibles](../../README.md#preview-readable-calendar-descriptions)
- [Restaurar la edición de widgets desde la búsqueda](../../README.md#preview-restore-widget-editing-from-the-search-menu)
- [Separar recordatorios predeterminados de eventos de día completo](../../README.md#preview-separate-all-day-reminder-defaults)
- [Mostrar correos y notas de contactos combinados](../../README.md#preview-show-emails-and-notes-from-merged-contacts)
- [Ampliar imágenes de artículos](../../README.md#preview-zoom-article-images)

## Instalación

1. [Penguin Patches → Morphe](https://morphe.software/add-source?github=pengusto/penguin-patches). Añade Penguin Patches como fuente de Morphe. Si el enlace no se abre, elige «Sources → Add → Remote» en Morphe Manager e introduce la URL del repositorio.
2. Abre la guía de la aplicación desde el catálogo y comprueba la versión exacta, la variante y el SHA-256 del APK original. Selecciona los parches y sus opciones.
3. Aplica los parches, firma con la clave de Morphe guardada e instala. Comprueba primero el resultado con datos prescindibles.

**Haz una copia de seguridad:** los parches conservan el identificador de paquete original. Un APK firmado con otro certificado no puede actualizar directamente la instalación existente. Guarda los datos y la clave de firma; no desinstales la aplicación solo para evitar un conflicto de firma.

[Guía completa de instalación y firma →](../SETUP.md)

## Estado y límites

Solo se han comprobado los APK originales indicados en cada guía. Los registros distinguen los APK oficiales parcheados de las bifurcaciones de código probadas por separado. Los dispositivos físicos siguen sin verificar; consulta cada guía para otros límites.

Las versiones estables proceden de `main`; activa las versiones preliminares de `dev` solo si quieres probar cambios futuros. Infinity+ necesita un cliente OAuth de Reddit propio y autorizado.

[Pruebas y límites](../VERIFICATION.md) · [Infinity+](../INFINITY.md) · [Finamp](../FINAMP_NATIVE.md)

## Tecnología

Las definiciones de parches usan Kotlin y los componentes auxiliares de Android usan Java; Gradle compila el proyecto. La guía de desarrollo detalla los requisitos de Java 21, Android SDK y acceso al registro de paquetes.

## Desarrollo y ayuda

[Compilar y contribuir](../DEVELOPMENT.md) · [Trabajo upstream y hoja de ruta](../ROADMAP.md) · [Informar de un problema](https://github.com/pengusto/penguin-patches/issues/new/choose) · [Apoyar el desarrollo](https://github.com/sponsors/pengusto)

## Licencia y procedencia

El código del proyecto se distribuye bajo GPL-3.0. Consulta NOTICE y la documentación de procedencia para conocer las condiciones del nombre del proyecto y los créditos del código y las imágenes de terceros.

[GPL-3.0](../../LICENSE) · [NOTICE](../../NOTICE) · [Procedencia y créditos de imágenes](../PROVENANCE.md)
