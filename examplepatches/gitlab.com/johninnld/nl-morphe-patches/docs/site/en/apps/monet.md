# Monet Android TV

**App version:** 1.1.1 · **Build:** 135 · **Original file:** APK

[Download original app](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the original Monet launcher APK in Morphe Manager. The patch verifies Monet 1.1.1 (build 135) by its exact native contracts before changing anything, and rejects other versions.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Unlock Premium** | On | Unlocks Monet's local premium features. Billing and license storage stay native; only the local evaluator's false return changes. |
| **Unlimited displayed cards** | Off | Remove the 20-card limit from Displayed Cards. Add -10, +10 and Max to the original themed picker, preserving its layout and single-card steps. |
| **Individual Wuplay catalog rows** | Off | Adds individual published Wuplay catalogs to Monet's Content picker, with Wuplay icons and refresh independent of Recommendations. |
| **Individual Nuvio catalog rows** | Off | Adds individual published catalogs to Monet's Content picker, accepting every supported catalog publisher. |

Select only one catalog source patch: the Wuplay and Nuvio rows patches hook the same native methods and cannot be combined. Unlock Premium and Unlimited displayed cards combine freely with either.

## Advertising and tracking services

These patches add Wuplay or Nuvio content choices and local premium and card-count controls. They do not change advertising or tracking controls.

## Before using

First use [Wuplay's catalog publisher](wuplay.md): inside Wuplay, open **Settings > Catalogs > TV channels**, choose Home catalogs from the default profile, and press **Save and refresh**. Android TV's optional **Add to TV Home** approval is not required for Monet to read the published channels.

In Monet, create a custom media row, select **Wuplay**, and choose a catalog in **Content**. Repeat for each desired catalog. Monet's normal row names, ordering, layout, card limits and hide-title controls remain available. Existing Continue Watching, Recommendations and combined choices remain intact.

Only channels published by the supported Wuplay app are added by this patch. Other publishers are not treated as Wuplay catalogs. Catalog choices use stable publisher identities, so renaming or recreating an Android channel preserves a saved selection. Empty catalogs stay selectable; removed catalogs keep an unavailable saved selection.

Catalog refresh runs while Monet is in the foreground, independently of whether Recommendations is visible or enabled. Failed reads keep the last successful content. Data is limited to 256 channels and 100 titles per channel. Account access, playback and any native Monet premium restrictions remain controlled by their respective apps.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
