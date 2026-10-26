# Calendar #381 acceptance

The **Separate all-day reminder defaults** patch targets the original
official Fossify Calendar **1.12.0** APK only. See
[provenance, behavior and limits](../../docs/CALENDAR_REMINDERS.md).
No release, push, upstream post or public evidence upload is part of these tests.

Final results, 2026-10-24:

| Check | Result |
| --- | --- |
| Official baseline regression / saved fixture | 7 checks pass |
| Standalone patch APK integration | 131 checks pass |
| Both Calendar patches together | 131 checks pass |
| Visible dialogs, process death and native restored-draft save | 92 checks pass |
| Incompatible metadata, repeated patch and modified DEX | 4 cases pass |
| Actual app API linkage | 63 references resolve; no duplicates |
| Existing common / Kvaesitso / Clock MPEs | All 3 byte-identical |
| Gradle build / new-extension lint | Pass; no lint issues |
| Matched original / patched screenshot capture and data retention | Pass; 4 raw screenshots |

Use an explicitly named **rooted disposable AOSP emulator**, with no real
calendar/accounts/data, and an existing disposable signing key. The runners
require `--disposable-emulator`, verify the AVD, `ranchu`, APK identity/certificate
and installed APK ownership, and retain data with same-key `install -r` updates.
They refuse physical devices. Artifacts must be under ignored `.scratch/`.
Do not use these fixtures or their signing key for real-user installations.

Before setup, read `.scratch/android-tests/README.md` and `env.sh` if present.
Reuse the existing SDK/AVD; no new SDK, emulator, key or provider is required.

## Build

Normally use Java 21, Android SDK and `./gradlew :patches:buildAndroid` with
environment-only GitHub Packages credentials. The existing offline-registry
fallback pins the official plugin source and verified Desktop API:

```sh
python3 tests/kvaesitso/build_local.py \
  --plugin-source .scratch/morphe-gradle-plugin \
  --desktop .scratch/android-tests/artifacts/morphe-desktop-1.18.1-all.jar \
  --sdk .scratch/android-sdk \
  --java-home '/Applications/Android Studio.app/Contents/jbr/Contents/Home' \
  --gradle-home .scratch/gradle-cache \
  --work-dir .scratch/calendar-381/build \
  --version 1.0.0-dev.7 \
  --extra-task :extensions:calendarreminders:lintRelease
```

Build and new-extension lint pass; lint reports **no issues**. The new Java MPE
contains eight own classes and no Kotlin runtime, third-party library or app
stubs. The prior common, Kvaesitso and Clock MPEs are byte-identical.

## Original baseline and patched APK integration

Paths below identify the existing Mac mini fixture. Supply your actual verified
paths, AVD/serial and existing disposable key. Never replace the serial with a
physical device. The original APK checksum/signer are enforced by the runner.

```sh
CAL381_SDK=/Users/jarvis/Library/Android/sdk
CAL381_JAVA='/Applications/Android Studio.app/Contents/jbr/Contents/Home'
CAL381_MPP=patches/build/libs/patches-1.0.0-dev.7.mpp
CAL381_DESKTOP=.scratch/android-tests/artifacts/morphe-desktop-1.18.1-all.jar
CAL381_OUT=.scratch/calendar-381/acceptance

python3 tests/calendar/acceptance.py \
  --original .scratch/calendar-381/downloads/original-1.12.0.apk \
  --mpp "$CAL381_MPP" --desktop "$CAL381_DESKTOP" \
  --sdk "$CAL381_SDK" --java-home "$CAL381_JAVA" \
  --keystore .scratch/android-user/debug.keystore --key-alias androiddebugkey \
  --serial emulator-5580 --avd-name penguin_kvaesitso_api35 \
  --artifacts "$CAL381_OUT" --baseline --disposable-emulator
```

Run the same command again with `--html` instead of `--baseline` to apply and
test **both** Calendar patches together. Every patch application starts from
the official original APK; previously patched APKs are never the source for an
update. The runner records successful reports, baseline payload equality,
same-key data retention, APK hashes and crash/linkage logs.

The original baseline confirms that an all-day event receives the same
30/120-minute defaults as a timed event, and saves a synthetic event to retain
across the patched update. The installed patched APK integration covers:

- Fixed timed/all-day defaults, three values, off/at-start and native reuse-last precedence.
- Native all-day switch listeners, current reminder text, and independent manual minutes/types for each draft mode. The detailed type fixtures write the native fields on the main thread; they do not claim real CalDAV/email reminder delivery.
- Actual `Activity.recreate()` in both modes, preserving current and alternative-mode reminders.
- Native save/readback, exact original HTML source, existing events and duplicates without adopting new defaults, and title-only save to the same row.
- Unchanged database contents during unsaved draft/recreation/duplicate operations and before/after same-key APK update.
- Native local-midnight calculation and 12 elapsed hours before it in UTC, Europe/Berlin and America/New_York on 2027-03-28, 2027-11-07 and 2027-12-31. Java/Joda process defaults are restored in `finally`.
- The real AlarmManager entry created by native save, matching local midnight minus the first due reminder plus Calendar's existing one-second offset.
- Settings visibility when toggling native reuse and no duplicate section insertion after repeated setup.

## Visible settings UI and real process death

The independent `UiSnapshot` test driver from `tests/clock/UiSnapshot.java` and
`UiManifest.xml` must already be installed with the disposable key; build/package
it as described in [Clock UI tests](../clock/README.md). It targets itself and
can inspect Calendar without stopping its process. The UI runner verifies the
installed APK's exact SHA-256, takes fresh snapshots, rejects offscreen/clipped
controls and stores only ignored local screenshots.

```sh
python3 tests/calendar/ui_acceptance.py \
  --adb "$CAL381_SDK/platform-tools/adb" \
  --serial emulator-5580 --avd-name penguin_kvaesitso_api35 \
  --patched "$CAL381_OUT/combined-patched.apk" \
  --artifacts .scratch/calendar-381/ui --disposable-emulator
```

This selects 6 hours / 1 day / at-start through visible dialogs; rejects an
out-of-range custom value; saves 90 custom minutes; verifies Cancel; checks
settings persistence; switches a real timed draft to all-day and back; then
backgrounds the activity, kills only its background process, verifies it is
gone, restores the existing task through Recents and confirms a new PID and
both modes' retained reminders. `am kill` retains the saved task; `force-stop`
would discard that task and is not used for this restoration step.
The restored draft is then saved with the native Save button; a SQLite readback
verifies the same unique title, all-day flag and all three reminder values.

## Bundle, APK linkage and rejection tests

```sh
mkdir -p .scratch/calendar-381/tools .scratch/calendar-381/rejections
"$CAL381_JAVA/bin/javac" -cp "$CAL381_DESKTOP" -d .scratch/calendar-381/tools \
  tests/calendar/VerifyCalendarBundle.java tests/calendar/ModifiedFixture.java \
  tests/kvaesitso/VerifyPatchedApk.java
"$CAL381_JAVA/bin/java" -cp "$CAL381_DESKTOP:.scratch/calendar-381/tools" \
  VerifyCalendarBundle "$CAL381_MPP" \
  patches/build/libs/patches-1.0.0-dev.7.mpp
"$CAL381_JAVA/bin/java" -cp "$CAL381_DESKTOP:.scratch/calendar-381/tools" \
  VerifyPatchedApk "$CAL381_OUT/combined-patched.apk" \
  'Lio/github/pengusto/patches/extension/calendarreminders/'
"$CAL381_JAVA/bin/java" -cp "$CAL381_DESKTOP:.scratch/calendar-381/tools" \
  ModifiedFixture .scratch/calendar-381/downloads/original-1.12.0.apk \
  .scratch/calendar-381/rejections/modified-input.apk
python3 tests/calendar/reject_inputs.py \
  --java "$CAL381_JAVA/bin/java" --desktop "$CAL381_DESKTOP" --mpp "$CAL381_MPP" \
  --original .scratch/calendar-381/downloads/original-1.12.0.apk \
  --patched "$CAL381_OUT/combined-patched.apk" \
  --modified-bytecode .scratch/calendar-381/rejections/modified-input.apk \
  --artifacts .scratch/calendar-381/rejections
```

The modified fixture adds a NOP to the guarded native toggle while keeping DEX
valid. It is negative-test input only; **never install it**. The Python runner
also creates unsigned manifest-only wrong-version/wrong-package fixtures.
Morphe selects zero patches for incompatible metadata and leaves DEX unchanged;
reapplying this patch or changing guarded bytecode fails with no patched output.
The shipped-APK linkage checker resolves 63 extension method/field references
against actual app classes and rejects duplicates/missing APIs.

Use `morphe-desktop list-patches --patches "$CAL381_MPP" -p -v -o` to verify
that **Separate all-day reminder defaults**, the independent Calendar HTML
patch and all eight other patches appear. The public release overview remains
unchanged until a separately authorized release.

## Matched screenshot evidence

After successful combined acceptance and visible-UI tests, capture the same
unsaved all-day draft on the unchanged official payload and the Morphe-patched
APK. The existing synthetic fixture must have fixed timed defaults of
30/120/disabled and all-day defaults of 360/1440/0, with reuse-last disabled.

```sh
python3 tests/calendar/capture_evidence.py \
  --sdk "$CAL381_SDK" --java-home "$CAL381_JAVA" \
  --original .scratch/calendar-381/downloads/original-1.12.0.apk \
  --baseline "$CAL381_OUT/original-resigned.apk" \
  --patched "$CAL381_OUT/combined-patched.apk" \
  --acceptance-artifacts "$CAL381_OUT" \
  --artifacts .scratch/calendar-381/evidence/capture \
  --serial emulator-5580 --avd-name penguin_kvaesitso_api35 \
  --disposable-emulator
```

The runner verifies APK provenance/payload/certificates and prior acceptance,
captures raw before/after, settings and timed-draft PNGs with fresh UI snapshots,
and compares every database row/preference before and after same-key updates
and draft navigation. It saves no events and restores the patched test APK.
Keyboard visibility is checked explicitly and the native IME is dismissed
before capturing. Required controls must be visible. All artifacts remain ignored; the runner publishes
nothing. Public evidence and comments require separate user authorization.
