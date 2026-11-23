# Upflix

**App version:** 5.12.10 · **Build:** 423 · **Original file:** APKS

[Use the original APKS](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the original Upflix split bundle (base APK plus the density and arm64 splits) in Morphe Manager and enable the three patches below.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Disable ads and tracking** | On | Removes every in-app ad placement and the advertising consent screen. Stops analytics, crash reporting, advertising-ID collection, third-party IP lookups and the profile documents the app uploaded about your device. The "remove ads" cards, premium badges and paywall are removed too. |
| **Disable Play license check** | On | Lets the patched app start after it has been reinstalled outside Google Play. |
| **Disable Crashlytics reporter** | On | Stops the crash reporter that would otherwise close the app when a minor script error occurs. |

## What changes in the app

Onboarding keeps its country and streaming-service steps, and no longer asks for notification permission or ad consent. All ad slots, full-screen ads and premium upsells are gone, so the app opens straight to the tab bar.

## Advertising and tracking services

No advertising or analytics service remains active. Push notifications and the two-device Roulette Duo feature used the vendor's own collection service and are disabled as part of the tracking removal.

## Before using

Install the original split bundle once, then reinstall the patched build because the signature differs. Your lists, settings and country selection are stored locally.
