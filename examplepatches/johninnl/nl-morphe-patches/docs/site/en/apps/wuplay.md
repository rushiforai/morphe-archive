# Wuplay Android TV

**App version:** 0.9.4-beta · **Build:** 49 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the original Wuplay Android TV APK in Morphe Manager.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Publish selected catalog channels** | Off | Adds a Wuplay TV channels launcher entry to choose catalogs from the default profile and publish them to Android TV launchers. |

## Advertising and tracking services

This patch adds catalog publishing. It does not change advertising or tracking controls.

## Before using

Open **Wuplay TV channels** from your TV's app list. Choose catalogs and press **Save and refresh**. Nothing is selected initially. Launchers may require enabling the published channels in their own settings.

The default profile is the first stored Wuplay profile. Keep that profile active when loading or refreshing catalogs. The selector lists content catalogs; navigation groups, Library and Watchlist use different paths and are excluded. Publishing uses the same account, catalog access and filtering as Wuplay.

Requires Android TV 8 or later. Each selected catalog contains up to 100 movie/series tiles with accessible artwork. Refresh runs on foreground entry and every 30 minutes while Wuplay is open. Existing requests may finish after leaving the app. Failed refreshes retain previous content; a successful empty result clears that catalog. Uncheck a catalog and save to remove its channel.

Titles open Wuplay's details screen in its active profile. No Monet change is included in this patch. Installing an APK signed with a different certificate may require uninstalling the original app; preserve your account and settings first.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
