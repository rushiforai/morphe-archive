# Monet Android TV

**App version:** 1.1.0 · **Build:** 134 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the original Monet launcher APK in Morphe Manager.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Individual Wuplay catalog rows** | Off | Adds individual published Wuplay catalogs to Monet's Content picker, with Wuplay icons and refresh independent of Recommendations. |

## Advertising and tracking services

This patch adds Wuplay content choices. It does not change advertising or tracking controls.

## Before using

First use [Wuplay's catalog publisher](wuplay.md): open **Wuplay TV channels**, choose catalogs from the default profile, and press **Save and refresh**.

In Monet, create a custom media row, select **Wuplay**, and choose a catalog in **Content**. Repeat for each desired catalog. Monet's normal row names, ordering, layout, card limits and hide-title controls remain available. Existing Continue Watching, Recommendations and combined choices remain intact.

Only channels published by the supported Wuplay app are added by this patch. Other publishers are not treated as Wuplay catalogs. Catalog choices use stable publisher identities, so renaming or recreating an Android channel preserves a saved selection. Empty catalogs stay selectable; removed catalogs keep an unavailable saved selection.

Catalog refresh runs while Monet is in the foreground, independently of whether Recommendations is visible or enabled. Failed reads keep the last successful content. Data is limited to 256 channels and 100 titles per channel. Account access, playback and any native Monet premium restrictions remain controlled by their respective apps.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
