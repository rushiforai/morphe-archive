# GridCraft

Give the open-source GridCraft spreadsheet app the Microsoft Excel name and launcher icon.

**App version:** 0.0.1-beta · **Build:** 1012 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select a GridCraft APK from its [GitHub releases](https://github.com/artcraft-android/gridcraft-android/releases), the arm64 build or the armeabi-v7a build. **Custom branding** is compatible with every GridCraft version: it only changes the app's name and launcher icon in the manifest and adds its own icon resources, so new releases need no patch update. The version above is the reference input. GridCraft for Android is developed by [artcraft-android/gridcraft-android](https://github.com/artcraft-android/gridcraft-android).

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Custom branding** | On | Renames GridCraft to Microsoft Excel and sets the Microsoft Excel launcher icon. The name and icon can be changed. |

## Advertising and tracking services

This patch changes only the app name and launcher icon. GridCraft's features, permissions and network behaviour are unchanged.

## Before using

**Custom branding** has an **App name** field, prefilled with Microsoft Excel, and an **App icon** dropdown: Original GridCraft or Microsoft Excel (the green Excel logo on white, default). Clear the name to keep GridCraft's own name. The Excel icon is an adaptive icon; its white X is the monochrome layer for themed icons. Changing the name or icon requires patching again.

The new name appears in the launcher, recent apps and Android app information. GridCraft's own screens, share entries, notifications and saved-file folders keep the GridCraft name.

GridCraft is not affiliated with Microsoft. Microsoft and Excel are trademarks of Microsoft Corporation. The icon is user-selected launcher artwork for your own device and does not turn GridCraft into Microsoft's app.

A patched APK must be signed again. A GridCraft installation signed by its publisher cannot be updated with a different signing key, so remove it first or install the patched copy on a device without it.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
