# Buienalarm

**Supported app:** 4.32.0 · **Build:** 3723 · **Input:** APKS

`org.yoki.android.buienalarm`

[Download the original APKS](https://buzzheavier.com/jtbt2vu0n7jp){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

The app requests weather data when you check rain for a saved place. A separate advertising path also supplies an identifier that works across apps, along with the selected city and country. Both use the same weather host, so blocking it entirely would also remove forecasts.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| [Advertising targeting](../learn/identifiers.md) | A PPID, the selected city and country, and ad context reach `/v2/ads/targetting` on `api.meteoplaza.com`. This identifier can link activity across related apps. | Disable tracking stops that call and the PPID source; weather routes on the same host remain. |
| [Firebase](../trackers/firebase.md) and [Meta](../trackers/meta.md) | The code review traced integrations for events, properties, app use, purchases, identity and diagnostics. The audit did not identify exact upload hosts. | The patch suppresses the identified initialization, collection, identifiers and queued sends. |
| [RevenueCat](../trackers/revenuecat.md) | Optional customer attributes and a link to a Firebase ID can add data to the identity used for subscriptions. | Optional telemetry and attributes are stopped; real customer identity, receipts and transaction results remain. |
| [Didomi](../trackers/didomi.md) | Didomi handles consent setup and can also make optional performance and API measurements. | Optional metrics stop; privacy settings you open yourself and stored choices remain. |

## What remains and what is still unknown

Weather, location search, Maps, notification registration and billing still involve servers. Alert services can receive requested places and a notification identity. The audit did not identify the exact NotifyHub upload host.

The inspected ARM64 Play split set requires Android 12L; the older standalone file has a different minimum Android version. These patches do not grant Premium.

## Available controls

Disable tracking, Fix Google services, Hide Premium banner, Hide ads, Skip consent screens.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 28 October 2026 against main `6102fa9`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_AUDIT.md) and [source catalogue](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Code inspection shows how the inspected code handles events and data. Device tests establish the behaviour checked on those devices. This guide includes no additional captured network traffic. [How to read the evidence](../reference/methodology.md).
