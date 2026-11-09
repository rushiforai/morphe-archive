# Penguin Patches

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="../assets/penguin-patches-banner-tailor-dark.png">
  <source media="(prefers-color-scheme: light)" srcset="../assets/penguin-patches-banner-tailor.png">
  <img src="../assets/penguin-patches-banner-tailor.png" alt="Penguin Patches" width="1800">
</picture>

[English](../../README.md) · [Deutsch](README.de.md) · [简体中文](README.zh-CN.md) · [日本語](README.ja.md) · [Español](README.es.md) · [한국어](README.ko.md) · [Português (Brasil)](README.pt-BR.md) · [Français](README.fr.md)

[![Release](https://img.shields.io/github/v/release/pengusto/penguin-patches?label=release)](https://github.com/pengusto/penguin-patches/releases/latest) [![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-blue)](../../LICENSE) [![Android](https://img.shields.io/badge/platform-Android-3DDC84)](../SETUP.md) [![Morphe compatible](https://img.shields.io/badge/Morphe-compatible-6f42c1)](../SETUP.md)

**Deine Apps. Ein bisschen besser.**

Penguin Patches ist eine unabhängige Sammlung gezielter Android-Patches für den Morphe Manager. Sie ergänzt oder korrigiert Funktionen in bestehenden Apps. Das Projekt ist weder mit Morphe noch mit den ursprünglichen App-Projekten verbunden.

> Diese Seite wurde mit KI übersetzt und nicht muttersprachlich geprüft. Die ausführliche Patch-Galerie und die technischen Anleitungen sind derzeit auf Englisch; bei Abweichungen gilt die englische Fassung.

## Was das Projekt macht

Die Patches reichen von lesbaren Kalenderbeschreibungen und Bildzoom in Feeder bis zu Einstellungen für Finamp und einem eigenen Reddit-OAuth-Client für Infinity+. Welche Änderungen und Originalversionen unterstützt werden, steht im Katalog und in der jeweiligen App-Anleitung.

**Unterstützte Apps:** [Feeder](../FEEDER.md) · [Finamp](../FINAMP_NATIVE.md) · [Fossify Calendar](../CALENDAR.md) · [Fossify Clock](../CLOCK.md) · [Fossify Contacts](../CONTACTS.md) · [Fossify File Manager](../FILE_MANAGER.md) · [Fossify Messages](../MESSAGES.md) · [Fossify Music Player](../MUSIC.md) · [Infinity+](../INFINITY.md) · [Komikku](../KOMIKKU.md) · [Kvaesitso](../KVAESITSO.md) · [Mihon](../MIHON.md) · [Read You](../READYOU.md) · [Tasks.org](../TASKS.md)

[**Unterstützte Apps und genaue Versionen →**](../../README.md#generated-patch-catalogue)

## Vorher und nachher

Beispiel: In Finamp steht nach dem Patch der Albuminterpret vor den übrigen Mitwirkenden. Die Bilder zeigen echte Android-APK-Aufnahmen mit synthetischen Musikdaten.

| Vorher: Weitere Mitwirkende stehen vor dem Albuminterpreten | Nachher: Der Albuminterpret steht zuerst |
| :---: | :---: |
| <img src="../../tests/finamp/evidence/2026-10-28/credits-before.png" alt="Vorher: Weitere Mitwirkende stehen vor dem Albuminterpreten" width="360"> | <img src="../../tests/finamp/evidence/2026-10-28/credits-after.png" alt="Nachher: Der Albuminterpret steht zuerst" width="360"> |

[Alle Patch-Vergleiche ansehen](../../README.md#patch-previews) · [Aufnahmen und Nachweis](../../tests/finamp/evidence/2026-10-28/README.md)

## Patch-Übersicht

- [Keine Benachrichtigung für sichtbare Unterhaltungen](../../README.md#preview-avoid-notifications-for-visible-conversations)
- [Vorwarnzeit für Wecker wählen](../../README.md#preview-choose-upcoming-alarm-notification-time)
- [Eigenen OAuth-Client für Infinity+ einrichten](../../README.md#preview-configure-custom-oauth-for-infinity)
- [Benachrichtigung beim Markieren als gelesen entfernen](../../README.md#preview-dismiss-notifications-when-marking-conversations-read)
- [Finamp Complete: alle sieben Änderungen](../../README.md#preview-finamp-complete-all-seven-fixes)
- [Verschachtelte OPML-Feeds importieren](../../README.md#preview-import-nested-opml-feeds)
- [Unterhaltungen im Hintergrund ungelesen lassen](../../README.md#preview-keep-background-conversations-unread)
- [Favoriten nach Umbenennung oder Löschung konsistent halten](../../README.md#preview-keep-favorites-consistent-after-folder-rename-or-removal)
- [Lokale Manga bei Ausschlusssuchen behalten](../../README.md#preview-keep-local-manga-in-exclusion-searches)
- [Zur übergeordneten Aufgabe wechseln](../../README.md#preview-navigate-to-the-parent-task)
- [Eingebettetes Cover des Titels bevorzugen](../../README.md#preview-prefer-each-track-s-embedded-cover)
- [Ausgenommene Downloads der Standardkategorie behalten](../../README.md#preview-preserve-excluded-default-category-downloads)
- [Kalenderbeschreibungen lesbar anzeigen](../../README.md#preview-readable-calendar-descriptions)
- [Widget-Bearbeitung im Suchmenü wiederherstellen](../../README.md#preview-restore-widget-editing-from-the-search-menu)
- [Eigene Erinnerungsstandards für ganztägige Termine](../../README.md#preview-separate-all-day-reminder-defaults)
- [E-Mails und Notizen zusammengeführter Kontakte anzeigen](../../README.md#preview-show-emails-and-notes-from-merged-contacts)
- [Artikelbilder vergrößern](../../README.md#preview-zoom-article-images)

## Installation

1. [Penguin Patches → Morphe](https://morphe.software/add-source?github=pengusto/penguin-patches). Penguin Patches als Quelle in Morphe hinzufügen. Falls der Link nicht öffnet: in Morphe Manager „Sources → Add → Remote“ wählen und die Repository-URL eingeben.
2. Im Katalog die App-Anleitung öffnen und exakt die dort angegebene originale APK-Version, Variante und SHA-256 prüfen. Patches und Optionen auswählen.
3. Die APK patchen, mit dem gesicherten Morphe-Schlüssel signieren und installieren. Das Verhalten zunächst mit entbehrlichen Daten prüfen.

**Vorher sichern:** Die Patches behalten die Paket-ID der Original-App. Eine andere Signatur kann eine bestehende Installation nicht direkt aktualisieren. App-Daten und Signaturschlüssel sichern; nicht einfach zur Umgehung eines Signaturkonflikts deinstallieren.

[Vollständige Anleitung zu Einrichtung und Signierung →](../SETUP.md)

## Status und Grenzen

Nur die jeweils dokumentierten Original-APKs sind geprüft. Die Nachweise unterscheiden APK-Tests und separat getestete Quellcode-Forks. Physische Geräte bleiben ungeprüft; weitere Einschränkungen stehen in den einzelnen Anleitungen.

Stabile Releases stammen aus `main`; Vorabversionen auf `dev` nur gezielt aktivieren. Infinity+ erfordert einen eigenen autorisierten Reddit-OAuth-Client.

[Nachweise und Einschränkungen](../VERIFICATION.md) · [Infinity+](../INFINITY.md) · [Finamp](../FINAMP_NATIVE.md)

## Technik

Die Patch-Definitionen verwenden Kotlin, Android-Laufzeithilfen Java und der Build Gradle. Der Entwicklungsleitfaden nennt die Voraussetzungen: Java 21, Android SDK und Zugriff auf die Paketregistrierung.

## Entwicklung und Hilfe

[Build und Beiträge](../DEVELOPMENT.md) · [Upstream-Arbeit und Roadmap](../ROADMAP.md) · [Problem melden](https://github.com/pengusto/penguin-patches/issues/new/choose) · [Entwicklung unterstützen](https://github.com/sponsors/pengusto)

## Lizenz und Herkunft

Der Projektcode steht unter GPL-3.0. Hinweise zu Projektname, Drittanbieter-Code und Abbildungen stehen in NOTICE und den Herkunftsangaben.

[GPL-3.0](../../LICENSE) · [NOTICE](../../NOTICE) · [Herkunft und Bildnachweise](../PROVENANCE.md)
