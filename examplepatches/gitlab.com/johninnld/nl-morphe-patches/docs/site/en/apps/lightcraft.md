# LightCraft

Give the open-source LightCraft photo editor the Adobe Lightroom name and launcher icon.

**App version:** 0.0.6-beta · **Build:** 6012 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select a LightCraft APK from its [GitHub releases](https://github.com/artcraft-android/lightcraft-android/releases), the arm64 build or the armeabi-v7a build. **Custom branding** is compatible with every LightCraft version: it only changes the app's name and launcher icon in the manifest and adds its own icon resources, so new releases need no patch update. The version above is the reference input. LightCraft for Android is developed by [artcraft-android/lightcraft-android](https://github.com/artcraft-android/lightcraft-android).

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Custom branding** | On | Renames LightCraft to Adobe Lightroom and sets the Adobe Lightroom launcher icon. The name and icon can be changed. |

## Advertising and tracking services

This patch changes only the app name and launcher icon. LightCraft's features, permissions and network behaviour are unchanged.

## Before using

**Custom branding** has an **App name** field, prefilled with Adobe Lightroom, and an **App icon** dropdown: Original LightCraft or Adobe Lightroom (the light-blue Lr on navy, default). Clear the name to keep LightCraft's own name. The Lightroom icon is an adaptive icon whose Lr glyph is also the monochrome layer for themed icons. Changing the name or icon requires patching again.

The new name appears in the launcher, recent apps and Android app information. LightCraft's own screens, share entries, notifications and saved-file folders keep the LightCraft name.

LightCraft is not affiliated with Adobe Inc.. Adobe and Lightroom are trademarks of Adobe Inc. The icon is user-selected launcher artwork for your own device and does not turn LightCraft into Adobe Inc.'s app.

A patched APK must be signed again. A LightCraft installation signed by its publisher cannot be updated with a different signing key, so remove it first or install the patched copy on a device without it.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
