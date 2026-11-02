# Wuplay Android TV

**App version:** 0.9.4-beta · **Build:** 49 · **Original file:** APK

[Download original app](https://buzzheavier.com/03cd7t0bs8qt){ .md-button .md-button--primary }

Select the original Wuplay Android TV APK in Morphe Manager.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Publish selected catalog channels** | Off | Adds TV channels under Settings > Catalogs to publish only checked Home catalogs from the default profile. |

## Advertising and tracking services

This patch adds catalog publishing. It does not change advertising or tracking controls.

## Before using

Inside Wuplay, open **Settings > Catalogs > TV channels**. Check the Home catalogs to publish and press **Save and refresh**. Nothing is selected initially. The separate TV launcher entry is no longer used.

The default profile is the first stored Wuplay profile. Keep that profile active when loading or refreshing catalogs. Only supported content catalogs enabled on that profile's Home screen are offered. Other catalogs, navigation groups, Library and Watchlist are excluded. Previously published catalogs removed from Home or unchecked are removed on a successful refresh. Publishing uses the same account, catalog access and filtering as Wuplay.

Publishing and visibility on the TV's Home screen are separate. **Add to TV Home** asks Android TV to approve selected published channels that are not already visible. The first channel may be approved automatically; additional channels can show a system prompt. Cancel stops further prompts and keeps the published data. Custom launchers may use their own settings instead. Monet can consume published channels without this visibility approval.

Requires Android TV 8 or later. Each selected catalog contains up to 100 movie/series tiles with accessible artwork. Refresh runs on foreground entry and every 30 minutes while Wuplay is open. Existing requests may finish after leaving the app; Home eligibility and selections are checked again before publication. Failed reads retain previous content until a successful refresh; a successful empty result clears that catalog. Uncheck a catalog and save to remove its channel.

Titles open Wuplay's details screen in its active profile. No Monet change is included in this patch. Installing an APK signed with a different certificate may require uninstalling the original app; preserve your account and settings first.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
