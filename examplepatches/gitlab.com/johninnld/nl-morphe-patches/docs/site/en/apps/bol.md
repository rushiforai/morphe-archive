# bol

**App version:** 2026.23.1 · **Build:** 430517 · **Original file:** APKS

[Download original app](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete APKS archive with the base app and its splits in Morphe Manager. The patched output is a single installable APK. Android 12L or later is required.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Disable Play license check** | On | Allows the patched app to start without the Play Store download screen closing it. |
| **Disable tracking** | On | Stops usage analytics, attribution, experiment reports and advertising identifiers while retaining push notifications. |
| **Hide consent screens** | On | Skips data-usage, data-sharing and notification opt-in onboarding with local tracking choices declined. Manual notification settings and server account consent remain unchanged. |
| **Hide promotional content** | On | Removes banners, brand campaigns, Home merchandising, seasonal artwork and the offers footer, game and day-deal promotions, campaign suggestions and promotional feeds. Prices and checkout discounts remain. |
| **Hide sponsored content** | On | Removes paid products, sponsored brand cards, shopping-assistant placements and display advertisements, including separately loaded Home ads. |

## Before using

The original three controls were created by [Wouter075](https://github.com/wouter075/bol-patches). This version adds fixes for missed advertising paths, additional promotional and tracking controls, and consent-screen removal. Only version 2026.23.1 build 430517 is supported.

A patched app has a different signature. Replacing the original Play Store installation requires removing that installation first, which removes its local data. Push registration and shopping services still use the network.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
