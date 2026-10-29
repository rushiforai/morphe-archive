# Flitsmeister

**Supported app:** 14.17 · **Build:** 1287 · **Input:** APKS

`nl.flitsmeister`

[Download the original APKS](https://buzzheavier.com/87mpz44q4p8h){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

Flitsmeister uses current positions for routes and warnings. It also records usage and movement automatically, contains marketing software and offers paid third-party partner services. The audit treats these components separately.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| [Firebase](../trackers/firebase.md) and [Insider](../trackers/insider.md) | The audit identified analytics, crash, performance and session reports, marketing events and profiles, geofences and stored jobs. | The patch suppresses the identified SDK calls, collection settings, and advertising and attribution identifiers. |
| Automatic movement records | Footprints records warnings encountered on the road. FCD batches contain GPS data, timestamps, speed, heading and session IDs. | The identified collection, startup, timers and uploads stop. |
| Usage and trip history | The code review traced navigation and incident metrics, trip statistics and automatic records of cameras passed. | The identified uploads and listeners stop. The app still resets local statistics in the existing way. |
| CITS connected warnings | Live GPS exchange supports connected warnings. There are also optional sensor and evaluation data, and permanent device-ID metadata. | The optional measurement data and metadata stop. Live CITS GPS exchange remains enabled. |
| Commercial traffic-area messages | The LBA catalogue contains commercial messages and records for information and monitoring. | The patch suppresses commercial records, assets and displays. Shared catalogue metadata and messages for information and monitoring remain. |

## What remains and what is still unknown

Live location still leaves the app through CITS. Essential map and routing services, account registration and push registration also remain. Hazard reports you submit yourself and manual ratings remain; automatic road-closure feedback with GPS stops.

Disable partner services removes Parking, Toll and Carwash from menus and settings, plus the Parking shortcut. It also stops fetching customer data before the known crash in native code. Some underlying partner classes and deep links remain. All six controls are enabled by default.

Approval on a device does not establish that an Android Auto host accepts the app, that every paid server benefit works, or that all traffic has been examined. Use the original Android 12L+ Play split set.

## Available controls

Disable partner services, Disable tracking, Fix PairIP startup, Hide Pro notices, Hide ads, Unlock Pro.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 28 October 2026 against main `6102fa9`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/FLITSMEISTER_PATCH_AUDIT.md) and [source catalogue](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Code inspection shows how the inspected code handles events and data. Device tests establish the behaviour checked on those devices. This guide includes no additional captured network traffic. [How to read the evidence](../reference/methodology.md).
