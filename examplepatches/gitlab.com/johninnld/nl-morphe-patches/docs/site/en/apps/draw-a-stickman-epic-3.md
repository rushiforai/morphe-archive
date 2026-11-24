# Draw a Stickman: EPIC 3

Play the game on the Android Auto car screen and on car hosts such as DriveDeck and Gearslip.

**App version:** 1.13.19873 · **Build:** 19873 · **Original file:** APKS

[Use your original APKS](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original APKS archive in Morphe Manager, including the base and architecture APKs.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Hide ads** | On | Completes Unity Ads initialization locally and reports no-fill/not-ready for ads, including calls without a listener. Returns no bidding token through either token API. |
| **Disable tracking** | On | Removes advertising/referrer permissions, disables advertising launch providers and Facebook app-event queues, returns no bidding token, and suppresses game and Unity analytics collection/event entry points. |

## Before using

This game already declares itself a parked app: its launcher activity carries `android.intent.category.CAR_LAUNCHER` and the app declares the game category, so car hosts that follow Google's documented discovery list it without a manifest patch. Only the ad and tracking patches are offered here.

Rewards that rely on watching an ad are no longer offered, because there is never a filled ad to show. Drawing tools, purchases already made and progress keep working.

Validated with build, patch-session and patched-manifest checks against the original APKS. No car-screen play session has been run.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
