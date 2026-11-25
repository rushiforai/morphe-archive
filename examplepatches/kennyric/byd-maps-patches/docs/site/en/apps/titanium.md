# Titanium Browser

Give the open-source Titanium browser the Chrome name and launcher icon.

**App version:** 157.0.8103.78 · **Build:** 810307874 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select a Titanium APK from its [GitHub releases](https://github.com/jqssun/android-titanium-browser/releases), the arm64-v8a build or the armeabi-v7a build. **Custom branding** is compatible with every Titanium version: it only changes the app's name and launcher icon in the manifest and adds its own icon resources, so new releases need no patch update. The version above is the reference input. Titanium Browser is developed by [jqssun/android-titanium-browser](https://github.com/jqssun/android-titanium-browser) (GPL-2.0).

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Custom branding** | On | Renames Titanium to Chrome and sets the Chrome launcher icon. The name and icon can be changed. |

## Advertising and tracking services

This patch changes only the app name and launcher icon. Titanium's features, extensions, permissions and network behaviour are unchanged.

## Before using

**Custom branding** has an **App name** field, prefilled with Chrome, and an **App icon** dropdown: Original Titanium or Chrome (the Chrome logo on white, default). Clear the name to keep Titanium's own name. The Chrome icon is an adaptive icon; the logo's silhouette is the monochrome layer for themed icons. Changing the name or icon requires patching again.

The new name appears in the launcher, recent apps, the default-browser choice and Android app information. Titanium's own screens, notifications and download folders keep the Titanium name.

Titanium is not affiliated with Google. Google and Chrome are trademarks of Google LLC. The icon is user-selected launcher artwork for your own device and does not turn Titanium into Google's app.

A patched APK must be signed again. A Titanium installation signed by its publisher cannot be updated with a different signing key, so remove it first or install the patched copy on a device without it.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
