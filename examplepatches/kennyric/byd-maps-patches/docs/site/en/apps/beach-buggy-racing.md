# Beach Buggy Racing

List the game on the Android Auto car screen and on car hosts such as DriveDeck and Gearslip.

**App version:** 2026.11.02 · **Build:** 220 · **Original file:** APKM

[Use your original APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original APKM archive in Morphe Manager, including the base, architecture and language APKs.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Parked app for Android Auto** | On | Adds Android Auto's parked-app declaration to the manifest, so hosts that follow the documented discovery list the game on the car screen by themselves. |
| **Hide ads** | On | Turns off the game's ad support the way the game itself does on televisions and cars: no ad SDK starts, no consent screen appears and every ad request follows the game's own no-ad path. |
| **Disable tracking** | On | Stops the advertising identifier, install-referrer attribution and analytics SDKs (Firebase, AppsFlyer or Braze per game), and disables measurement, crash-report and advertiser-collection flags in the manifest. |

## Before using

Google lists the game on Android Auto through an internal, Play-managed game allowlist inside the Android Auto app. The game itself does not declare the public parked-app category, so hosts that follow Google's documented discovery cannot list it. This patch adds `android.intent.category.CAR_LAUNCHER` to the launcher activity and keeps the existing game category. Gameplay, saves and online services are unchanged; on Android 15 and later the game runs on the phone and the connected host shows it on the car screen.

Android Auto still needs Unknown sources in its developer settings for a patched app. Validated with build and patched-manifest checks against the original APKM. No car-screen play session has been run.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
