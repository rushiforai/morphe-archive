# Flitsmeister

**Supported app:** 14.17 · **Build:** 1287 · **Input:** APKS

`nl.flitsmeister`

[Download the original APKS](https://buzzheavier.com/87mpz44q4p8h){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

New in [patch bundle v1.23.1](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.23.1): Disable tracking prevents the identified Insider crash when driving starts. The app still called marketing functions after the corresponding SDK initialization had been disabled. Both message toggles now return safely, preserving the driving-state observer and existing privacy controls. This targeted repair was checked on Android Runtime; a real driving test of this version remains pending.

Flitsmeister uses current positions for routes and warnings. It also records usage and movement automatically, contains marketing software and offers paid third-party partner services. The audit treats these components separately.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Insider when driving starts | The driving-state observer disables marketing messages. The old toggle crashed when Disable tracking had prevented SDK initialization. | Disable tracking makes both Insider message toggles return safely without restarting the SDK or changing the driving-state observer. |
| Android Auto installation source | The inspected host rejects this Car App Library app after a plain Shizuku installation. Its Unknown sources checkbox does not admit this app category. | Keep the crash repair and use the KingInstaller workflow below; changing patch controls does not fix installation attribution. |
| Android Auto and background work | The earlier PairIP startup workaround suppressed required connection and other system callbacks; a WorkManager job could return no valid result. | Fix PairIP startup restores thirteen functional callbacks, including the Android Auto connection refresh and background-work result. |
| [Firebase](../trackers/firebase.md) and [Insider](../trackers/insider.md) | The audit identified analytics, crash, performance and session reports, marketing events and profiles, geofences and stored jobs. | The patch suppresses the identified SDK calls, collection settings, and advertising and attribution identifiers. |
| Automatic movement records | Footprints records warnings encountered on the road. FCD batches contain GPS data, timestamps, speed, heading and session IDs. | The identified collection, startup, timers and uploads stop. |
| Usage and trip history | The code review traced navigation and incident metrics, trip statistics and automatic records of cameras passed. | The identified uploads and listeners stop. The app still resets local statistics in the existing way. |
| CITS connected warnings | Live GPS exchange supports connected warnings. There are also optional sensor and evaluation data, and permanent device-ID metadata. | The optional measurement data and metadata stop. Live CITS GPS exchange remains enabled. |
| Commercial traffic-area messages | The LBA catalogue contains commercial messages and records for information and monitoring. | The patch suppresses commercial records, assets and displays. Shared catalogue metadata and messages for information and monitoring remain. |

## What remains and what is still unknown

Live location still leaves the app through CITS. Essential map and routing services, account registration and push registration also remain. Hazard reports you submit yourself and manual ratings remain; automatic road-closure feedback with GPS stops.

Disable partner services removes Parking, Toll and Carwash from menus and settings, plus the Parking shortcut. It also stops fetching customer data before the known crash in native code. Some underlying partner classes and deep links remain. All six controls are enabled by default.

On 30 October 2026, the user confirmed that Flitsmeister appears in the Android Auto launcher and opens its map on the tested phone/car setup. That was not a complete driving test and does not establish that the earlier version was free of driving-related crashes. Other hosts, every paid server benefit and exhaustive traffic coverage remain unverified. That acceptance used the original Android 12L+ Play split set.

The patches also accept the publisher-signed Android 10+ variant of 14.17 / 1287. The download button above provides the existing Android 12L+ split set; Android 10 devices need the publisher's API 29 APKM as input. All six controls pass compilation and independent APK checks while retaining minSDK 29; the Android 12L+ variant remains supported. Use a patch bundle containing this compatibility update: v1.19.2 rejects that input. Running on an Android 10 device or car remains unverified. [Variant validation](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-flitsmeister-android10.md).

## Available controls

Disable partner services, Disable tracking, Fix PairIP startup, Hide Pro notices, Hide ads, Unlock Pro.

Update the patch source in Morphe Manager to the latest stable release, patch the original Flitsmeister 14.17 / 1287 APKS again and keep Fix PairIP startup and Disable tracking enabled. Install the new result using the same signing key as your existing patched app to retain its data. Updating the patch source alone does not update the installed app. Android Auto still requires a genuine Flitsmeister login and acceptance by the car host.

If Flitsmeister disappears from Android Auto after reinstalling, follow the [Android Auto installation guide](../guides/android-auto.md). [Install and start Shizuku-Next](../guides/shizuku.md), then download [KingInstaller](https://github.com/fcaronte/KingInstaller/releases), then use Morphe’s **external KingInstaller** option:

Start Shizuku and authorize KingInstaller to use it. Select **KingInstaller** as the external installer in Morphe and send the patched APK to it. In KingInstaller, enable **Shizuku**, choose **Install as king**, and confirm **Update** in Android’s installation screen.

The user confirmed that KingInstaller works on the physical phone. A fresh source check on the phone matched the required attribution; an independent emulator test through KingInstaller’s actual UI restored Android Auto launcher visibility. Keep the existing signing key and update without uninstalling; the crash repair remains enabled. A new car session and other hosts remain unverified.

Morphe Manager 2.3.0’s built-in System installer and Shizuku modes, including their Play Store toggle, did not produce the required source in the tested paths. Android Auto’s developer mode and Unknown sources checkbox alone were insufficient for this app category. [Installer evidence and developer fallback](https://github.com/johnneerdael/dutch-applications-patches/blob/8a7d2c0b5bf20a653ced309e4d93858e3c788ced/docs/research/2026-10-30-flitsmeister-android-auto-installer.md#remediation-and-validation-boundary).

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

The [Android Auto installation-source investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/8a7d2c0b5bf20a653ced309e4d93858e3c788ced/docs/research/2026-10-30-flitsmeister-android-auto-installer.md) compares the actual v1.23.0 and v1.23.1 bundles and emitted APKs. Their Android Auto declarations, resources and callbacks are unchanged; the crash repair changes only the two Insider message toggles. A separate emulator check reproduces host denial after Shell installation with developer mode and Unknown sources enabled.

Reviewed 30 October 2026: the Insider repair from [PR #54](https://github.com/johnneerdael/dutch-applications-patches/pull/54), commit `0f3ffee`, with [pinned source and technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/0f3ffee7bb4086c1b053bc610f5c5484bb674ea5/docs/FLITSMEISTER_PATCH_AUDIT.md#insider-message-toggles-during-driving). The full Android build and canonical arm64 validation matrix pass. On the phone, five targeted Android Runtime cases reproduce the old failure; three corrected cases pass, including 100 stopped/driving/stopped cycles. These tests execute emitted SDK methods with stub dependencies; they simulate neither a GPS journey nor the complete app. The earlier Android Auto callback repair is separately [recorded for v1.19.2](https://github.com/johnneerdael/dutch-applications-patches/blob/a739a8b8ddc0da5c7b9f563ed5436c429dccbc27/docs/privacy/flitsmeister/README.md#runtime-callback-restoration). Other hosts, real driving scenarios, backend features and complete network traffic have not been exhaustively tested. [How to read the evidence](../reference/methodology.md).
