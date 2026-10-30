# Flitsmeister

**Supported app:** 14.17 · **Build:** 1287 · **Input:** APKS

`nl.flitsmeister`

[Download the original APKS](https://buzzheavier.com/87mpz44q4p8h){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

New in [patch bundle v1.19.2](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.19.2): the Android Auto fix restores connection updates disabled by the earlier PairIP startup workaround. Required audio, network, location and background-work callbacks also work again. The user confirmed that Flitsmeister appears in the Android Auto launcher, opens its map and runs without crashes on the tested phone/car setup.

Flitsmeister uses current positions for routes and warnings. It also records usage and movement automatically, contains marketing software and offers paid third-party partner services. The audit treats these components separately.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Android Auto and background work | The earlier PairIP startup workaround suppressed required connection and other system callbacks; a WorkManager job could return no valid result. | Fix PairIP startup restores thirteen functional callbacks, including the Android Auto connection refresh and background-work result. |
| [Firebase](../trackers/firebase.md) and [Insider](../trackers/insider.md) | The audit identified analytics, crash, performance and session reports, marketing events and profiles, geofences and stored jobs. | The patch suppresses the identified SDK calls, collection settings, and advertising and attribution identifiers. |
| Automatic movement records | Footprints records warnings encountered on the road. FCD batches contain GPS data, timestamps, speed, heading and session IDs. | The identified collection, startup, timers and uploads stop. |
| Usage and trip history | The code review traced navigation and incident metrics, trip statistics and automatic records of cameras passed. | The identified uploads and listeners stop. The app still resets local statistics in the existing way. |
| CITS connected warnings | Live GPS exchange supports connected warnings. There are also optional sensor and evaluation data, and permanent device-ID metadata. | The optional measurement data and metadata stop. Live CITS GPS exchange remains enabled. |
| Commercial traffic-area messages | The LBA catalogue contains commercial messages and records for information and monitoring. | The patch suppresses commercial records, assets and displays. Shared catalogue metadata and messages for information and monitoring remain. |

## What remains and what is still unknown

Live location still leaves the app through CITS. Essential map and routing services, account registration and push registration also remain. Hazard reports you submit yourself and manual ratings remain; automatic road-closure feedback with GPS stops.

Disable partner services removes Parking, Toll and Carwash from menus and settings, plus the Parking shortcut. It also stops fetching customer data before the known crash in native code. Some underlying partner classes and deep links remain. All six controls are enabled by default.

On 30 October 2026, the user confirmed that Flitsmeister appears in the Android Auto launcher, opens its map and runs without crashes on the tested phone/car setup. Other hosts, every paid server benefit and exhaustive traffic coverage remain unverified. Use the original Android 12L+ Play split set.

## Available controls

Disable partner services, Disable tracking, Fix PairIP startup, Hide Pro notices, Hide ads, Unlock Pro.

Update the patch source in Morphe Manager to stable v1.19.2 or a newer stable release, patch the original Flitsmeister 14.17 / 1287 APKS again and keep Fix PairIP startup enabled. Install the new result using the same signing key as your existing patched app to retain its data. Updating the patch source alone does not update the installed app. Android Auto still requires a genuine Flitsmeister login and acceptance by the car host. If the app remains absent from the car launcher, also check the installation-source findings in the technical evidence. [Callback validation and remaining limits](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/privacy/flitsmeister/README.md#runtime-callback-restoration).

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 30 October 2026 against [stable v1.19.2](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.19.2), commit `a739a8b`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a739a8b8ddc0da5c7b9f563ed5436c429dccbc27/docs/FLITSMEISTER_PATCH_AUDIT.md) and [callback validation](https://github.com/johnneerdael/dutch-applications-patches/blob/a739a8b8ddc0da5c7b9f563ed5436c429dccbc27/docs/privacy/flitsmeister/README.md#runtime-callback-restoration). The repair passes 49 synthetic Android Runtime behavior cases and emitted-APK checks. The Android Auto launcher and map were confirmed on the tested phone/car setup; other hosts, all driving scenarios and backend features have not been exhaustively tested. This guide includes no additional captured network traffic. [How to read the evidence](../reference/methodology.md).
