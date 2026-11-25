# PdfCraft

Give the open-source PdfCraft PDF app the Adobe Acrobat name and launcher icon.

**App version:** 0.0.7-beta · **Build:** 7012 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select a PdfCraft APK from its [GitHub releases](https://github.com/artcraft-android/pdfcraft-android/releases), the arm64 build or the armeabi-v7a build. **Custom branding** is compatible with every PdfCraft version: it only changes the app's name and launcher icon in the manifest and adds its own icon resources, so new releases need no patch update. The version above is the reference input. PdfCraft for Android is developed by [artcraft-android/pdfcraft-android](https://github.com/artcraft-android/pdfcraft-android) on the [PdfCraft](https://github.com/storytold/pdfcraft) engine (MIT or Apache-2.0).

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Custom branding** | On | Renames PdfCraft to Adobe Acrobat and sets the Adobe Acrobat launcher icon. The name and icon can be changed. |

## Advertising and tracking services

This patch changes only the app name and launcher icon. PdfCraft's features, permissions and network behaviour are unchanged.

## Before using

**Custom branding** has an **App name** field, prefilled with Adobe Acrobat, and an **App icon** dropdown: Original PdfCraft, Adobe Acrobat (the current flat icon, default) or Adobe Acrobat classic (the earlier red gradient icon). Clear the name to keep PdfCraft's own name. Both Acrobat icons are adaptive icons with a monochrome layer for themed icons. Changing the name or icon requires patching again.

The new name appears in the launcher, recent apps and Android app information. PdfCraft's own screens, its "Open in PdfCraft" share entry, notifications and saved-file folders keep the PdfCraft name.

PdfCraft is not affiliated with Adobe. Adobe and Acrobat are trademarks of Adobe Inc.; the icon is user-selected launcher artwork for your own device and does not turn PdfCraft into Adobe's app.

A patched APK must be signed again. A PdfCraft installation signed by its publisher cannot be updated with a different signing key, so remove it first or install the patched copy on a device without it.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
