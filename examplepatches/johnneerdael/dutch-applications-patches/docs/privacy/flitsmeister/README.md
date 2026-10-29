# Flitsmeister

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [Evidence notes](../../TRACKING_DESTINATIONS.md) · [All app READMEs](../README.md).

Use the original Play Store split APK set, **14.17 / 1287**, Android 12L+. All six controls are enabled by default and available without Expert mode.

| Patch | Effect |
| --- | --- |
| Fix PairIP startup | Restores all 1,442 captured startup strings and 17 reflection registrations, merges the original lifecycle DEX and exact stock MapLibre 13.6.0 native library, and bypasses the damaged startup dispatcher and Java signature/license gates. |
| Unlock Pro | Enables the traced local Pro feature gates and Android Auto tier gate while preserving saved settings, genuine account/activation state and host validation. |
| Hide Pro notices | Removes the identified Pro banners, badges, upsell screens and Android Auto notices while retaining settings and real denied/account states. |
| Disable partner services | Hides paid Parking, Toll and Carwash menu entries and the Parking shortcut; stops customer fetches before the known native crash. Removes their Settings entries as well. |
| Hide ads | Suppresses commercial LBA records, image downloads/cache, notifications and dialog routes; turns general ads off and removes only the Ads setting. Keeps informative and monitoring traffic messages. |
| Disable tracking | Disables identified automatic SDK and app-owned usage/location telemetry, advertising identifiers and permissions. Preserves account/push operations, explicit reports and core map/routing functionality. |

The combined six-control artifact passes FULL compilation, signature verification and independent DEX/resource contracts. The user confirmed device validation and approved stable promotion on 2026-10-28. Live CITS location exchange, essential map/routing requests and operational account/push registration remain; mixed safety/commercial catalog metadata still downloads, with commercial entries filtered before use. User-reported device acceptance does not establish exhaustive runtime network coverage, Android Auto host acceptance or every backend-dependent feature and consent flow. See the [Flitsmeister audit](../../FLITSMEISTER_PATCH_AUDIT.md).


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
