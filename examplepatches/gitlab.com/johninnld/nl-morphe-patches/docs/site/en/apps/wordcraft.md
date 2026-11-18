# WordCraft

Give the open-source WordCraft word processor the Microsoft Word name and launcher icon.

**App version:** 0.0.1-beta · **Build:** 1012 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select a WordCraft APK from its [GitHub releases](https://github.com/artcraft-android/wordcraft-android/releases), the arm64 build or the armeabi-v7a build. **Custom branding** is compatible with every WordCraft version: it only changes the app's name and launcher icon in the manifest and adds its own icon resources, so new releases need no patch update. The version above is the reference input. WordCraft for Android is developed by [artcraft-android/wordcraft-android](https://github.com/artcraft-android/wordcraft-android).

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Custom branding** | On | Renames WordCraft to Microsoft Word and sets the Microsoft Word launcher icon. The name and icon can be changed. |

## Advertising and tracking services

This patch changes only the app name and launcher icon. WordCraft's features, permissions and network behaviour are unchanged.

## Before using

**Custom branding** has an **App name** field, prefilled with Microsoft Word, and an **App icon** dropdown: Original WordCraft or Microsoft Word (the blue Word logo on white, default). Clear the name to keep WordCraft's own name. The Word icon is an adaptive icon; its white W is the monochrome layer for themed icons. Changing the name or icon requires patching again.

The new name appears in the launcher, recent apps and Android app information. WordCraft's own screens, share entries, notifications and saved-file folders keep the WordCraft name.

WordCraft is not affiliated with Microsoft. Microsoft and Word are trademarks of Microsoft Corporation. The icon is user-selected launcher artwork for your own device and does not turn WordCraft into Microsoft's app.

A patched APK must be signed again. A WordCraft installation signed by its publisher cannot be updated with a different signing key, so remove it first or install the patched copy on a device without it.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
