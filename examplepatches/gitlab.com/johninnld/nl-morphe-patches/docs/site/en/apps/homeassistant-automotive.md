# Home Assistant (Automotive)

Use Home Assistant's native car interface with DriveDeck or another compatible projection host.

**App version:** 2026.11.2-full · **Build:** 25803 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original Automotive APK in Morphe Manager. The **Android Auto** patch ports this build to a phone and compatible templated car hosts.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Allow any Android Auto host** | On | Opens Home Assistant's native car interface to every compatible projection host, without a host package or certificate check. |
| **Android Auto** | On | Ports the Automotive APK to the standard Android Auto templated interface, with phone setup, projected car-data and microphone support. The original Automotive behavior remains available on Automotive hardware. |

## Advertising and tracking services

This patch changes access to the car interface. Home Assistant's existing server connections, Webhooks, notifications and online services remain active.

## Before using

Sign in to a Home Assistant server on the phone first. The car screens reuse that account and server selection. The host must support the car templates the app uses; Google's Android Auto keeps working.

The Android Auto port applies to the Automotive APK only. Open the patched app on the phone to complete setup, then open Home Assistant in your car host. Vehicle readings require actual host support and user-granted permissions; unavailable readings are not invented. A sideloaded app may need Unknown sources enabled in Android Auto's developer settings.

Host access is unrestricted when this patch is selected: every Android Auto compatible host, including DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto and AARE, may connect, whatever its package name or signing key. Install a patched copy only if this is the behavior you want.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
