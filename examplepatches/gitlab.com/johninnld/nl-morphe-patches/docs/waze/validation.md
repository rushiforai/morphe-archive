# Waze 5.26.90.901 validation

Validation date: 2026-11-01. Input: supplied APKMirror APKM, package `com.waze`, version code `1030746`, minimum SDK 32. The source catalog contains all 24 Waze patches in upstream commit `32e42e0f757581147307af27196e3aca517d0570` plus the existing two audio patches.

This records the initial 26-patch catalog. The subsequent 27-patch privacy follow-up is documented in the [privacy audit](privacy-audit.md).

## Build and artifact checks

- Original audio bundle: both audio patches applied unchanged with `--validate`, without forced compatibility.
- Complete catalog: all 26 applied together and individually, with no failed patches or failed patch/rebuild steps.
- Nondefault options: speed/unit/sign sizes, custom app name containing an ampersand, disabled black map, font size/background/arrow width, world speed sign, police distance and background timeout applied successfully from the original APKM input.
- Android build and three Robolectric sharing tests passed. The two disable tests first reproduced the imported heartbeat defect before its fix.
- Python regression suite: 393 tests, 39 skipped (unavailable optional fixtures), no failures.
- Godot parser on this APK: all three scenes found, with 2 + 3 + 35 = 40 scalable animation keys.

## Runtime checks

Installed the patched base with original arm64, xxhdpi, English and Dutch splits signed with one local test key on an API 36 arm64 phone emulator. Startup succeeded. Runtime logs confirmed configuration overrides, the patched speedometer binding, ten skin files rewritten, and forty pin scale keys rewritten. A second start wrote zero skin/pin values, confirming changes do not accumulate.

The dedicated emulator also opened the patched side menu and its Customization screen, including its switches and numeric values. Synthetic updates through the patched native-manager handlers exercised the average-speed zone colors and alert bridge. Synthetic camera approaches triggered speed-camera and Flock alerts at 300 m. These are synthetic checks, not road tests.

Both sync callbacks now dispatch native configuration writes through `NativeManager.Post`; final logs show the override method on the native thread. The sharing switch cancels heartbeats and clears cached alerts; Robolectric verifies it also blocks an in-flight update from restarting sharing.

All 15,077 numeric resource IDs were preserved. The patcher normalized 42 case-colliding resource names to ID-based aliases; resources accessed by the extension retain their names. Permission removal, base-only app labels, Firebase performance deactivation and custom size/name output were inspected. The final DEX has no duplicate class definitions; all three injected Waze method references resolve and 2,843 extension invokes have correct argument widths.

[validation.json](validation.json) records artifact hashes and check counts. Raw local evidence remains under `.analysis/waze-526/` and is not shipped with the patch source.

## Limits

These checks establish build compatibility, successful patch application and the runtime behavior explicitly listed above. They do not establish signed-in SoundCloud/YT Music playback, all media shelves, live navigation or road-camera alerts, Android Auto, live companion Maps reception, telemetry traffic suppression, or server-side mood acceptance. Report speed limit retains the upstream unverified label. Camera and zone self-tests use synthetic data and cannot establish road behavior.

The generated release tables and `patches-list.json` remain owned by release automation. The source catalog is documented separately until a bundle containing it is released.

## Phase-one driving controls

On 2026-11-01 the six opt-in driving patches were validated against the same
5.26.90.901 / 1030746 APKM. The catalog now has 35 patches; all passed together
and independently (36 patch/rebuild runs with fingerprint uniqueness validation,
without forced compatibility). [Phase-one evidence](phase1-validation.json)
records the input and candidate bundle hashes. The local bundle retains the
checkout's version; release automation assigns the published version.

Inspection of the final combined APK verified the 11 new typed configuration
writes and their IDs/values. The stock lane-guidance user preference and shared
on-tap map-control preference are not overridden. A compass-only visibility hook
handles the additional on-tap gate; its disabled path preserves the stock result.
The hook is omitted when only toll prices are selected.

Nine option cases passed: nondefault selections, display-only selections,
zero/20,000 m boundaries, invalid zoom mode, negative/excessive distance and empty
map/speed-limit selections. Invalid selections fail explicitly. Five new
Robolectric tests cover choice/reset, independent compass/toll switches,
warning-distance editing/reset/range and compass visibility with the control on
for both stock Boolean outcomes and off restoring those outcomes.

The Android build, 23 Waze extension tests, the other release-workflow Gradle
checks, 413 Python tests (45 optional-fixture skips), 39 release integration tests,
strict documentation build, candidate app-guide checks and rendered-site checks
passed. These are build, patch-application, static and simulated UI checks.
No new device installation, road-alert test, toll-data test, Gearslip session or
Google Android Auto session was performed for these six controls.

## Phase-two alert, privacy and display controls

On 2026-11-01 all five phase-two patches and the existing catalog passed together
and independently against the supplied 5.26.90.901 / 1030746 APKM: 40 patches,
41 patch/rebuild runs with unique fingerprint validation and no forced compatibility.
[Phase-two evidence](phase2-validation.json) records the candidate/input hashes,
11 option cases and static verification. Version selection remains automated.

The camera controls write map, notification and sound settings for the selected
five camera types, plus map/feature/notification settings for two crosswalk types.
Speed-bump warning suppression writes its own on-route flag false while marker
visibility stays independent. Projection reconnect delay is bounded to 1–10
minutes (2 by default) and converted to native milliseconds; phone background
and Android Automotive keep-alive settings are not changed.

The verifier below compares the original and patched DEX. Exactly one recents
fetch call changes; every other reader branch and the JNI declaration remain
intact. It evaluates the injected bridge for enabled and disabled states: hiding
returns an empty payload without a native fetch, while off returns the original
native payload. For the display hook it verifies the original wide register pair
and the unchanged remainder of display selection/control flow, including resolution
and supported-mode filtering. Its unpatched negative control is rejected.

```sh
java -cp MORPHE_DESKTOP_JAR scripts/waze/WazePhaseTwoVerifier.java ORIGINAL_BASE_APK PATCHED_APK
```

Android/release Gradle checks, 26 Waze tests, the 413-test Python suite (45 optional
fixture skips), 39 release integration tests, candidate app guides, strict MkDocs,
links and rendered site checks passed. Settings tests cover independent speed-bump
switches, delay units/bounds without changing phone timeout, and display editing,
bounds, reset and off=60 Hz. The refresh ceiling defaults to 90 Hz and is editable
from 60 to 120 Hz; rendering FPS is not guaranteed.

No new road, vehicle, live recents-list or physical-display power/thermal session
was performed. These results establish patch compatibility, emitted control flow
and simulated settings behavior; native data coverage and real device behavior
remain separate acceptance checks.
