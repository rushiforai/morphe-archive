# GameSnacks

Install Google's car game portal on a phone and list it on the Android Auto car screen and on car hosts such as DriveDeck and Gearslip.

**App version:** 1.40.827663177 · **Build:** 40 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the original APK in Morphe Manager. This build is a single APK, not a split archive.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Parked app for Android Auto** | On | Makes the automotive-hardware requirement optional so the app installs on a phone, and adds Android Auto's parked-app declaration to the manifest. |

## Before using

GameSnacks is published for Android Automotive OS: its manifest requires automotive hardware, which stops a phone from installing it at all. The patch marks that requirement optional, so the same app installs on the phone that runs Android Auto or a car host, and adds `android.intent.category.CAR_LAUNCHER` to the launcher activity while keeping the existing game category.

The games themselves are web pages served from gamesnacks.com, so there is no ad or tracking SDK inside this app to remove and no such patch is offered. An internet connection is required, and the portal's own page content is outside what this patch set can change.

Android Auto still needs Unknown sources in its developer settings for a patched app. Validated with a build and patch session on the original APK and against the patched manifest. No car-screen play session has been run.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
