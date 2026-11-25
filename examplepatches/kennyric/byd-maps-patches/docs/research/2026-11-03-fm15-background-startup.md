# Flitsmeister 15: silent startup from a visible receiving map

Status: development evidence, not a release or complete FM15 warning-acceptance claim. The corrected Maps/Vela sender starts the captured released FM15 engine without opening FM's screen. Runtime GREEN is on Android 14/API 34. Android 16/API 36 has unit and AOSP support; physical-phone acceptance is pending.

## Failure and intended behavior

The user's failing trigger was selecting Flitsmeister in Maps, not booting the phone. The captured phone runs API 36; FM15 targets SDK 37. FM had fine/coarse location permission, with background location and notifications denied. Android allowed the foreground-service start but reported `allowWiu:-1`. Promotion of the location foreground service then threw `SecurityException` in `ProviderEngineService.onStartCommand` / `startForeground`. A bound control service alone did not establish a running engine.

The intended handoff keeps FM entirely in the background after its one-time setup. A visible, authorized receiving map supplies the eligible startup handoff; the provider still needs its own location permission. Granting all-time location or opening FM's activity is not the general repair for a receiver that fails to pass that handoff.

## Narrow receiver change and platform boundaries

The shared `NavigationClient` retains provider package/UID and foreground-service PendingIntent checks. It adds:

| Boundary | Sender behavior |
| --- | --- |
| API 29+ | Bind with `BIND_AUTO_CREATE | BIND_INCLUDE_CAPABILITIES`. |
| API 34–35, resumed receiver Activity | Send the authenticated foreground-service PendingIntent with `MODE_BACKGROUND_ACTIVITY_START_ALLOWED`. |
| API 36+, resumed receiver Activity | Use `MODE_BACKGROUND_ACTIVITY_START_ALLOW_IF_VISIBLE`. |
| Earlier APIs or no resumed receiver Activity | Preserve the existing send path; do not manufacture visible eligibility. |

These are two distinct platform checks: permission to start an FGS and eligibility to use a while-in-use permission after starting it. Android's [FGS restrictions](https://developer.android.com/develop/background-work/services/fgs/restrictions-bg-start) document that distinction and the visible different-app PendingIntent exemption. [`BIND_INCLUDE_CAPABILITIES`](https://developer.android.com/reference/android/content/Context#BIND_INCLUDE_CAPABILITIES) explicitly transfers applicable existing foreground capabilities for target-R-and-newer apps. The [sender opt-in guidance](https://developer.android.com/guide/components/activities/secure-bal) describes API 34+ and the API 36 visible-only mode.

The Android 16 AOSP paths inspected were [`PendingIntentRecord`](https://android.googlesource.com/platform/frameworks/base/+/refs/heads/android16-release/services/core/java/com/android/server/am/PendingIntentRecord.java), [`ActiveServices`](https://android.googlesource.com/platform/frameworks/base/+/refs/heads/android16-release/services/core/java/com/android/server/am/ActiveServices.java), and [`ForegroundServiceTypePolicy`](https://android.googlesource.com/platform/frameworks/base/+/refs/heads/android16-release/core/java/android/app/ForegroundServiceTypePolicy.java). FGS PendingIntent dispatch derives sender background-start privileges from the options and visible caller; while-in-use eligibility accepts the resulting activity-start privilege. This is source support for API 36, not a replacement for the pending phone runtime check.

## Paired evidence

All retained paths below are relative to the native-warning worktree. The base directory is `.analysis/native-warning-bindings/fm15-port/`. Local analysis artifacts are evidence references, not files distributed with a release.

| Artifact | SHA-256 |
| --- | --- |
| `phone-installed-fm15.apk` | `65596fecc77ce74a6e8841f7d3fc089d8541eb2aabfd01713331f63dd9ec4b68` |
| `phone-maps-trigger-logcat.txt` | `7f0d36668c02b68568620d5414ca92b2651e3701be7d097f35f5df343b00f613` |
| `phone-permissions-before-trigger.json` | `83d6a1dcd81a53dda9ada1ff7fc53bffad60b2f93594f60fd0fe3f1e91758f0c` |
| `startup-repro-01/phone-fm15-test-signed.apk` | `81f68fb80fdc3a2648cefa23b3e95812a313ba2b15b3ddb61fb6258a29c60e76` |
| `startup-fixed-receivers/maps/app.apk` | `a82f7f459ded5835b1b30c659ff7c000bd53181a8b9a95104d05d954f6588d04` |
| `startup-fixed-receivers/vela/app.apk` | `a1cee95fc0dbb550c22630312550c326b113bbff203f4868eb3854678742043c` |
| Receiver build MPP, recorded in `startup-fixed-receivers/maps/receipt.json` and `startup-fixed-receivers/vela/receipt.json` | `fe6e2bc455e58b8fd18c290e8314cd0e5623b6be8e8a76e9ce3644cd30638cb5` |
| `startup-no-background-02/result.json` (RED) | `d2139060649cf5abc4460b87beb36c60b238e294f6fad935a49f75faaae9d6f6` |
| `startup-fixed-green-03/result.json` (GREEN) | `b2e980d956c748802939837081f58412085f6497915c7f2638b747434fdbe34e` |
| `startup-fixed-green-03/paired-startup-verification.json` | `1ca00644027094df4273a23a43881c8b762c4ce02c428e4f837d1c49ca5487d9` |
| `navigation-capability-red.xml` | `6fe06235860025c0087710fc4a37a66ebe10967e1fba0ec32c12ff2574d90ba1` |
| `navigation-capability-green.xml` | `dfedf97e2f18ff46732da42a7c54c8e151bda371d9a938c83b86c443e6373307` |
| `navigation-capability-unit-verification.json` | `7600f642a02399fbb1b0d2f17f0987708299258b3568ee1c5ff55576d06cede6` |

The test-signed FM source preserves every regular non-signing ZIP member's exact name and bytes from the captured phone APK. Signing omitted only two empty directory entries (`lib/`, `lib/arm64-v8a/`); this is a recorded metadata-only exception, not a claim that the earlier strict ZIP-member check passed. Source and receiver test certificate SHA-256: `2ce9d34e9493f2bb91c9c7863ba2a4e839f5ef27864e404e8a5624ebc0be0597`.

Both paired runtime runs used the owned API 34 AVD with fine/coarse location granted, background location denied and notifications denied. The source process began cold. Selection used the real receiver app graph and production startup client; the observer did not construct a synthetic client or set ready/navigation flags.

| Run | Observed outcome |
| --- | --- |
| RED, old Maps receiver | Four actual start attempts, four while-in-use location-FGS promotion failures, STATUS `stopped`/`start_blocked`, no running integration/native location FGS. |
| GREEN, updated Maps | Native STATUS `running` after 2,045 ms; both real integration and native services were foreground with location type 8; no promotion error. |
| GREEN, updated Vela | Native STATUS `running` after 2,245 ms; both real integration and native services were foreground with location type 8; no promotion error. |

GREEN recorded ActivityTaskManager events and no FM Activity launches. FM's screen stayed closed. RED did not record that activity trace, so absence of an FM launch is not inferred from its log. Receiver health showed a connected/running muted FM provider in Maps and the available fallback status in Vela. No GNSS or road data was injected; this proves startup and available legacy-feed health, not route or warning playback.

The unit RED had two failing positive capability cases while two negative controls passed. GREEN passed all 31 shared startup tests, including API 34/36 behavior, a nonvisible receiver and a wrong-creator control. Both runtime outcomes restored all three original app hashes, preferences and metadata, permission grants/flags, window settings and firewall state; helpers and owned test processes were removed.

## Separate FM15 warning-port evidence and open acceptance

The original SDK 29 FM15 base SHA-256 is `09d01a21ae058c9c9a75dcd0714f39ddbd37b63b68259692675f19b1a39a66ea`; the SDK 32 base is `7668b9d93a309520184a01194aa47dde40a05b0e74e96a2237c428ed7a613bf0`. All seven DEX files match between those originals; this does not establish resource/manifest equivalence.

FM15 producer validation separately passed all 159 model-manifest members in English and Dutch (170 adapter calls) and eight actual native-capture scenarios covering 15 announcement roots. Retained model evidence is `model-runtime-01/versioned-green/result.json`; capture evidence is `capture-runtime-02/result.json`, SHA-256 `a7d2c7aa8458f473bc0fa11b2810a5b61f1bab80d970dca4e6223fedc111b918`. These producer checks do not turn the startup runtime APK above into a validated new-warning producer/receiver combination.

The seven excluded nonwarning enum rows were independently checked against original FM15 DEX, with bounded field-reference and method evidence in `nonwarning15/report.json`. In particular, the `TOLLING` report remains a map/route toll marker; `TOLL_CONTROL` is a distinct SpeedCam warning subtype. The exclusion does not claim toll data is unused or absent from road-context UI.

Physical-phone startup acceptance, full integrated FM15 warning delivery, moving/delayed receiver acceptance for the port, lifecycle transitions and physical car/audio routing remain open. Earlier 14.17 research retains its original artifact scope. Neither producer coverage nor this startup GREEN establishes a completed port or a published release.
