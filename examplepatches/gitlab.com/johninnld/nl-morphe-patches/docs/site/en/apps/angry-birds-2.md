# Angry Birds 2

List the game on the Android Auto car screen and on car hosts such as DriveDeck and Gearslip.

**App version:** 26.7.3 · **Build:** 50305634 · **Original file:** APKS

[Use your original APKS](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original APKS archive in Morphe Manager, including the base, architecture and game-content APKs. The game-content split is installed together with the base APK, so the levels are present without a Play Store download.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Parked app for Android Auto** | On | Adds Android Auto's parked-app declaration to the manifest, so hosts that follow the documented discovery list the game on the car screen by themselves. |
| **Hide ads** | On | Stops the game's ad bridge: every ad request reports the game's own no-fill error, so interstitial and reward flows close cleanly and no ad network is contacted. |
| **Disable tracking** | On | Stops the advertising identifier, app set ID and install-referrer attribution, disables Google measurement, Firebase Analytics, Crashlytics and Sessions upload, turns off Facebook's advertiser identifier and event upload, and empties the crash-report endpoint. |
| **Hide paid shop tab** | On | Hides the paid Shop tab and its content even when opened from the gem counter, plus the Treasure Pass purchase button and paid reward row. Bonus, Daily Deals, free rewards and quests remain available. |

## Before using

Google lists the game on Android Auto through an internal, Play-managed game allowlist inside the Android Auto app. The game itself does not declare the public parked-app category, so hosts that follow Google's documented discovery cannot list it. The parked-app patch adds `android.intent.category.CAR_LAUNCHER` to the launcher activity and keeps the existing game category. Progress, clans and Rovio's online services are unchanged.

Rewards that rely on watching an ad are no longer offered, because there is never a filled ad to show. Everything else keeps working.

Android Auto still needs Unknown sources in its developer settings for a patched app. Validated with build, patch-session and patched-manifest checks against the original APKS. No car-screen play session has been run.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
