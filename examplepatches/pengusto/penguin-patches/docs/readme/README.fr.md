# Penguin Patches

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="../assets/penguin-patches-banner-tailor-dark.png">
  <source media="(prefers-color-scheme: light)" srcset="../assets/penguin-patches-banner-tailor.png">
  <img src="../assets/penguin-patches-banner-tailor.png" alt="Penguin Patches" width="1800">
</picture>

[English](../../README.md) · [Deutsch](README.de.md) · [简体中文](README.zh-CN.md) · [日本語](README.ja.md) · [Español](README.es.md) · [한국어](README.ko.md) · [Português (Brasil)](README.pt-BR.md) · [Français](README.fr.md)

[![Release](https://img.shields.io/github/v/release/pengusto/penguin-patches?label=release)](https://github.com/pengusto/penguin-patches/releases/latest) [![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-blue)](../../LICENSE) [![Android](https://img.shields.io/badge/platform-Android-3DDC84)](../SETUP.md) [![Morphe compatible](https://img.shields.io/badge/Morphe-compatible-6f42c1)](../SETUP.md)

**Vos applications, un peu meilleures.**

Penguin Patches est une collection indépendante de correctifs Android compatible avec Morphe Manager. Elle améliore ou corrige des fonctions d’applications existantes. Le projet n’est affilié ni à Morphe ni aux projets d’origine.

> Cette page a été traduite par IA et n’a pas été relue par une personne de langue maternelle. La galerie complète et les guides techniques sont actuellement en anglais ; en cas de divergence, la version anglaise fait référence.

## Fonctionnalités

Les correctifs comprennent notamment des descriptions de calendrier lisibles, le zoom d’images dans Feeder, des réglages pour Finamp et un client OAuth Reddit personnel pour Infinity+. Le catalogue et le guide de chaque application précisent les changements et les versions d’origine prises en charge.

**Applications prises en charge:** [Feeder](../FEEDER.md) · [Finamp](../FINAMP_NATIVE.md) · [Fossify Calendar](../CALENDAR.md) · [Fossify Clock](../CLOCK.md) · [Fossify Contacts](../CONTACTS.md) · [Fossify File Manager](../FILE_MANAGER.md) · [Fossify Messages](../MESSAGES.md) · [Fossify Music Player](../MUSIC.md) · [Infinity+](../INFINITY.md) · [Komikku](../KOMIKKU.md) · [Kvaesitso](../KVAESITSO.md) · [Mihon](../MIHON.md) · [Read You](../READYOU.md) · [Tasks.org](../TASKS.md)

[**Applications et versions exactes prises en charge →**](../../README.md#generated-patch-catalogue)

## Avant et après

Exemple : dans Finamp, le correctif place l’artiste de l’album avant les autres participants. Les images sont de véritables captures d’un APK Android utilisant des données musicales synthétiques.

| Avant : les autres participants précèdent l’artiste de l’album | Après : l’artiste de l’album apparaît en premier |
| :---: | :---: |
| <img src="../../tests/finamp/evidence/2026-10-28/credits-before.png" alt="Avant : les autres participants précèdent l’artiste de l’album" width="360"> | <img src="../../tests/finamp/evidence/2026-10-28/credits-after.png" alt="Après : l’artiste de l’album apparaît en premier" width="360"> |

[Voir toutes les comparaisons](../../README.md#patch-previews) · [Captures et preuves](../../tests/finamp/evidence/2026-10-28/README.md)

## Aperçu des correctifs

- [Éviter les notifications des conversations visibles](../../README.md#preview-avoid-notifications-for-visible-conversations)
- [Choisir le délai de notification des alarmes](../../README.md#preview-choose-upcoming-alarm-notification-time)
- [Configurer son client OAuth pour Infinity+](../../README.md#preview-configure-custom-oauth-for-infinity)
- [Retirer la notification après marquage comme lu](../../README.md#preview-dismiss-notifications-when-marking-conversations-read)
- [Finamp Complete : les sept améliorations](../../README.md#preview-finamp-complete-all-seven-fixes)
- [Importer les flux OPML imbriqués](../../README.md#preview-import-nested-opml-feeds)
- [Garder non lues les conversations en arrière-plan](../../README.md#preview-keep-background-conversations-unread)
- [Conserver les favoris après renommage ou suppression de dossiers](../../README.md#preview-keep-favorites-consistent-after-folder-rename-or-removal)
- [Conserver les mangas locaux dans les recherches avec exclusion](../../README.md#preview-keep-local-manga-in-exclusion-searches)
- [Accéder à la tâche parente](../../README.md#preview-navigate-to-the-parent-task)
- [Privilégier la pochette intégrée à chaque titre](../../README.md#preview-prefer-each-track-s-embedded-cover)
- [Conserver les téléchargements exclus de la catégorie par défaut](../../README.md#preview-preserve-excluded-default-category-downloads)
- [Afficher des descriptions de calendrier lisibles](../../README.md#preview-readable-calendar-descriptions)
- [Rétablir la modification des widgets depuis la recherche](../../README.md#preview-restore-widget-editing-from-the-search-menu)
- [Séparer les rappels par défaut des événements sur la journée](../../README.md#preview-separate-all-day-reminder-defaults)
- [Afficher les adresses et notes des contacts fusionnés](../../README.md#preview-show-emails-and-notes-from-merged-contacts)
- [Agrandir les images des articles](../../README.md#preview-zoom-article-images)

## Installation

1. [Penguin Patches → Morphe](https://morphe.software/add-source?github=pengusto/penguin-patches). Ajoutez Penguin Patches comme source dans Morphe. Si le lien ne s’ouvre pas, choisissez « Sources → Add → Remote » dans Morphe Manager et saisissez l’URL du dépôt.
2. Ouvrez le guide de l’application depuis le catalogue et vérifiez la version exacte, la variante et le SHA-256 de l’APK d’origine. Sélectionnez les correctifs et leurs options.
3. Appliquez les correctifs, signez avec votre clé Morphe sauvegardée et installez. Vérifiez d’abord le fonctionnement avec des données sans importance.

**Sauvegardez d’abord :** les correctifs conservent l’identifiant du paquet d’origine. Un APK signé avec un autre certificat ne peut pas mettre directement à jour l’installation existante. Sauvegardez les données et la clé de signature ; ne désinstallez pas l’application uniquement pour contourner un conflit de signature.

[Guide complet d’installation et de signature →](../SETUP.md)

## État et limites

Seuls les APK d’origine indiqués dans chaque guide ont été vérifiés. Les preuves distinguent les APK officiels corrigés des forks de code testés séparément. Les appareils physiques restent non vérifiés ; consultez chaque guide pour les autres limites.

Les versions stables proviennent de `main` ; activez les préversions de `dev` seulement pour tester les changements à venir. Infinity+ nécessite votre propre client OAuth Reddit autorisé.

[Preuves et limites](../VERIFICATION.md) · [Infinity+](../INFINITY.md) · [Finamp](../FINAMP_NATIVE.md)

## Technologies

Les définitions des correctifs utilisent Kotlin et les composants auxiliaires Android utilisent Java ; le projet est compilé avec Gradle. Le guide de développement précise les prérequis : Java 21, Android SDK et accès au registre de paquets.

## Développement et aide

[Compiler et contribuer](../DEVELOPMENT.md) · [Travail upstream et feuille de route](../ROADMAP.md) · [Signaler un problème](https://github.com/pengusto/penguin-patches/issues/new/choose) · [Soutenir le développement](https://github.com/sponsors/pengusto)

## Licence et provenance

Le code du projet est distribué sous GPL-3.0. Consultez NOTICE et les informations de provenance pour les conditions liées au nom du projet et les crédits du code et des images tiers.

[GPL-3.0](../../LICENSE) · [NOTICE](../../NOTICE) · [Provenance et crédits des images](../PROVENANCE.md)
