# Flitsmeister runtime callback restoration plan

> **For agentic workers:** Use the executing-plans workflow for implementation. Keep APKs, device captures and signing material outside Git.

**Goal:** Restore the functional callbacks silenced by the Flitsmeister 14.17 / build 1287 startup repair, then reproduce the Bluetooth/driving report without confusing diagnostic failures with application failures.

**Architecture:** Preserve the captured startup initialization and existing feature/privacy patches. Replace individually pinned functional VM wrappers with verified upstream behavior, reusing shipped helpers and schedulers. Keep Android Auto host package rejection separate from application behavior.

**Tech stack:** Kotlin/Morphe bytecode patches, smali, Python, synthetic Android Runtime probes, REA/JADX 0.7.1.

**Spec:** The user-requested Bluetooth/Android Auto crash investigation and static audit of `flitsmeister.apks`; private audit inventories and REA Evidence are retained with the investigation captures.

## Global constraints

- Target exactly Flitsmeister 14.17 / versionCode 1287 and verify original wrapper layouts and program identifiers.
- Preserve real account, permission, subscription-provider, callback and scheduling behavior.
- Preserve selected measurement opt-outs; do not restore telemetry ingress as a side effect.
- Do not change Android Auto's host validation or claim hardware acceptance from static tests.
- Preserve original DEX versions. Diagnostic APKTool round trips that downgrade 039 to 035 are invalid controls.
- Do not commit private APKs, device identifiers, captures, credentials or signing material.
- Do not publish a release before functional validation and review.

## Review focus

- Repeated car broadcasts must refresh connection state once each; provider failures must propagate normally.
- WorkManager continuation success must preserve the supplied Data, including empty data, and never return null.
- Audio/network callbacks must retain the shipped scheduler and release/sticky-broadcast guards.
- Connectivity overrides and navigation-stop null checks must retain their original meaning.
- Privacy selection and the genuine Android Auto login/readiness gates must remain intact.

## Task 1: Car connection and WorkManager continuation

- [x] Add `tests/run_flitsmeister_runtime.py` to run actual source/emitted instruction bodies on ART with synthetic framework dependencies and no application installation.
- [x] Demonstrate failures against the existing patched car receiver and continuation worker.
- [x] Add named instruction bodies and pinned wrapper replacements in `patches/src/main/kotlin/patches/flitsmeister/RuntimeCallbacks.kt`; invoke restoration from `StartupCompatibility.kt`.
- [x] Verify repeated/null-input car broadcasts, failure propagation, empty/input-preserving WorkManager results, and absence of VM dispatch in the repaired methods.

## Task 2: Remaining source-verified functional callbacks

- [x] Pin Media3, MapLibre, navigation, WorkManager tracker, AppCompat, Core and Compose helper shapes against the exact bundled versions.
- [x] Add failing behavior cases before implementing each restoration; retain original executor, cleanup, override and null-check behavior.
- [x] Audit remaining location/timezone/legacy-map callbacks and distinguish dormant test callbacks and opted-out measurement ingress.

## Task 3: Emitted APK and device verification

- [x] Build patches and a fresh FULL-mode candidate from the original split bundle.
- [x] Verify all original method declarations and unrelated bodies; run ART probes against decoded emitted methods.
- [x] Run the host suite and obtain an independent review of the current changes.
- [ ] Confirm stable capture and ordinary phone operation before requesting a car test. Record Android Auto host rejection, actual crashes and remaining unknowns separately.
