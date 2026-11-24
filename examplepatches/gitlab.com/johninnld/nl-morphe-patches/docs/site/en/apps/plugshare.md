# PlugShare (Automotive)

Use PlugShare's native charging maps and car screens with Android Auto or another compatible templated host.

**App version:** AAOS v1.8.2 · **Build:** 100400 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original Automotive APK in Morphe Manager. This target contains all four supported architectures.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Android Auto** | On | Ports the Automotive build to the standard Android Auto templated protocol, including maps, searches, bookmarks and sign-in. Allows compatible hosts without a package or certificate allow-list and uses the host's real car-data capabilities. |

## Advertising and tracking services

This patch changes platform compatibility and access to the car interface. PlugShare's account, charging data, maps and other online services remain active.

## Before using

Open PlugShare from Android Auto, DriveDeck, Gearslip or another compatible templated car host. Sign in using the native car screens. The phone launcher explains how to open the car interface.

Vehicle readings require actual host support and user-granted permissions. Unavailable values remain unavailable. On Automotive hardware, the original native launcher and car-data backend are retained. A sideloaded app may need Unknown sources enabled in Android Auto's developer settings.

Every compatible host may connect when this patch is selected. The Automotive APK uses the same package name as other PlugShare builds, so Android treats it as the same installed app.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
