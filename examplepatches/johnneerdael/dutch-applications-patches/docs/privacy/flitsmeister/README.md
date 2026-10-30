# Flitsmeister

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [Evidence notes](../../TRACKING_DESTINATIONS.md) · [All app READMEs](../README.md).

Use the original Play Store split APK set, **14.17 / 1287**, Android 12L+. All six controls are enabled by default and available without Expert mode.

| Patch | Effect |
| --- | --- |
| Fix PairIP startup | Restores all 1,442 captured startup strings and 17 reflection registrations, merges the original lifecycle DEX and exact stock MapLibre 13.6.0 native library, and restores functional car, audio, network, location and worker callbacks while avoiding damaged PairIP execution. |
| Unlock Pro | Enables the traced local Pro feature gates and Android Auto tier gate while preserving saved settings, genuine account/activation state and host validation. |
| Hide Pro notices | Removes the identified Pro banners, badges, upsell screens and Android Auto notices while retaining settings and real denied/account states. |
| Disable partner services | Hides paid Parking, Toll and Carwash menu entries and the Parking shortcut; stops customer fetches before the known native crash. Removes their Settings entries as well. |
| Hide ads | Suppresses commercial LBA records, image downloads/cache, notifications and dialog routes; turns general ads off and removes only the Ads setting. Keeps informative and monitoring traffic messages. |
| Disable tracking | Disables identified automatic SDK and app-owned usage/location telemetry, advertising identifiers and permissions. Preserves account/push operations, explicit reports and core map/routing functionality. |

The combined six-control artifact passes FULL compilation, signature verification and independent DEX/resource contracts. The user confirmed device validation and approved stable promotion on 2026-10-28. Live CITS location exchange, essential map/routing requests and operational account/push registration remain; mixed safety/commercial catalog metadata still downloads, with commercial entries filtered before use. User-reported device acceptance does not establish exhaustive runtime network coverage, Android Auto host acceptance or every backend-dependent feature and consent flow. See the [Flitsmeister audit](../../FLITSMEISTER_PATCH_AUDIT.md).


## Runtime callback restoration

The 30 October 2026 compatibility repair restores thirteen functional callbacks that previously reached a null-returning VM dispatcher:

- Car-connection broadcasts query the current connection state.
- WorkManager continuation jobs return success with their input Data; constraint broadcasts retain their null checks and original Intent.
- Media3 network, volume and scheduler callbacks retain their executors, release checks and initial-sticky handling.
- MapLibre connectivity keeps explicit overrides; the navigation notification calls the existing null-safe stop helper.
- Location-mode, timezone, night-mode, shortcut-completion and dock-state callbacks retain their original provider and error behavior.

Matching upstream sources and shipped helpers establish the replacements. The exact packaged Joda and RxAndroidBle versions are not available in metadata; those two mappings also rely on unchanged surrounding code. Dormant instrumentation callbacks and SDK stubs are kept separate from normal app behavior. The existing measurement opt-outs remain in place.

**Validation:** 49 synthetic Android Runtime behavior cases pass against the source and emitted FULL-mode APKs, both startup-only and with all six controls. The original patched callbacks fail the corresponding regression groups. Preservation checks retain the class/parameter metadata, other helpers, startup data, assets and native-library identities. A comparison of 339,311 methods found thirteen functional changes; three additional raw differences are equivalent jump encodings and merged adjacent exception ranges.

The user subsequently confirmed that Flitsmeister appears in the Android Auto launcher, opens its map and works without crashes on the tested car/phone setup with all six controls. This is bounded acceptance of that setup, not exhaustive driving, backend or hardware coverage. Genuine login and host validation remain enabled. See the installer findings below for the separate package-admission issue.


### Installer findings

The user-confirmed car acceptance required a successful host-admission path as well as the callback repair. The inspected host rejected the original Shell-initiated installation before starting the car service. Updating through the genuine Google system installer with the tested privileged-source flow preserved app data and produced the expected initiating/installing attribution. Merely setting ADB's `-i` field had not changed the initiating source. [Technical evidence and limits](../../FLITSMEISTER_PATCH_AUDIT.md#installer-attribution-is-a-separate-requirement).

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

These are version-specific source findings and decoded-output checks, not a claim of zero traffic or a completed packet capture.

| Destination / component | Inspected purpose and data | Patch effect / remaining exposure |
| --- | --- | --- |
| Firebase Measurement, Crashlytics, Performance and Sessions | Analytics events, identifiers, crash/session/performance telemetry. | Collection/event gates disabled, exact manifest opt-outs enforced; operational Firebase token/auth interfaces retained. |
| Insider SDK transport and geofences | Marketing profiles, events, location/geofence and persisted-session jobs. | Initialization, event/profile sinks, jobs and SDK-only transport suppressed. |
| `footprints.flitsmeister.app/add_signal` | Automatic warning-encounter trajectories. | Collection startup disabled. |
| `fcd-*.flitsmeister.app/android` | Automatic GPS batches with timing, speed, heading and session identifiers. | Startup, timer and egress disabled. |
| `metrics.flitsmeister.app/add` | Navigation/incident usage metrics. | Sending coroutine disabled. |
| `account.flitsmeister.app/parse/functions/saveTripData`, `/fleet/events` | Trip statistics and automatically encountered-camera events. | Upload/listener paths suppressed; existing local statistics reset retained. |
| CITS / Be-Mobile | Live connected warnings, GPS exchange and optional monitoring/sensor data. | Optional telemetry and permanent device-ID metadata suppressed. Live GPS exchange remains pending the user's tradeoff decision. |
| `lba-android.flitsmeister.app` | Mixed safety/commercial catalog and image assets. | Commercial entries, assets and display paths blocked; catalog metadata and informative/monitoring traffic items retained. |
| App-service reports, maps/routing and push registration | Explicit reports/ratings, functional location requests and authenticated push token linkage. | Necessary operations retained; automatic road-closure GPS feedback disabled. These calls can still expose functional identifiers/location and IP addresses. |

See the [Flitsmeister audit](../../FLITSMEISTER_PATCH_AUDIT.md) for boundaries and pending runtime acceptance.

</details>
