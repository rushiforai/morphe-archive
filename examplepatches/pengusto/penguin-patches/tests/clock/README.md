# Clock #14 Morphe acceptance

The patch supports the **original official Clock 1.6.0 APK only**.
The baseline probe and acceptance instrumentation call the installed app's real
methods on a disposable Android 35 emulator. Test APKs contain no app stubs or
replacement extension implementations. The commands below publish nothing.
See [results, artifact hashes and limits](../../docs/CLOCK.md).

Input:

- [Official Clock 1.6.0 APK](https://github.com/FossifyOrg/Clock/releases/download/1.6.0/clock-10-foss-release.apk), package `org.fossify.clock`, version code 10.
- SHA-256: `43cf9f0ec45f1f1ff2df47286622e5b8f3acedaeb07b7f7641b5243dbedca079` (matches the release asset digest).
- Official certificate SHA-256: `affdb124d3f4720c2f98dbca9eacba0514fba4306e20a2786c861c3c0d6ff292`.
- [Release source](https://github.com/FossifyOrg/Clock/tree/1.6.0), commit `4ecb9e33c51c0b2096af2379e7ac9dc17c3e07e6`.

## Build

Normal build: Java 21, Android SDK and `./gradlew :patches:buildAndroid`, with
GitHub Packages read credentials passed through the environment. On this Mac
mini the existing fallback uses pinned, unmodified official Morphe Gradle
plugin 1.3.4 source and verified Desktop 1.18.1 APIs. It does not change project
credentials or global configuration:

```sh
python3 tests/kvaesitso/build_local.py \
  --plugin-source .scratch/morphe-gradle-plugin \
  --desktop .scratch/android-tests/artifacts/morphe-desktop-1.18.1-all.jar \
  --sdk .scratch/android-sdk \
  --java-home '/Applications/Android Studio.app/Contents/jbr/Contents/Home' \
  --gradle-home .scratch/gradle-cache \
  --work-dir .scratch/clock/build \
  --version 1.0.0-dev.7 \
  --extra-task :extensions:clock:lintRelease \
  --extra-task :stubs:clock:lintRelease
```

MPP: `patches/build/libs/patches-1.0.0-dev.7.mpp`. The isolated
`clock.mpe` excludes implicit Kotlin stdlib and compile-only Clock stubs; the
existing shared Fossify and Kvaesitso payloads must remain unchanged.

## Original regression probe

Run this only before installing the patched fixture. `probe_original.py`
verifies the input hash, identity and certificate, re-signs
with an existing disposable key, and verifies unchanged code/resources. It
refuses physical devices and a Clock installation with different code or a
different certificate. The key stays outside Git. The probe uses two in-memory
alarms with synthetic IDs, creates and cancels their PendingIntents, and does
not insert alarms, schedule ringing, or modify app preferences. The app may
initialize its normal empty/default data on first instrumentation launch.

From the repository root, with the existing SDK and disposable test key:

```sh
python3 tests/clock/probe_original.py \
  --original .scratch/clock/downloads/original-1.6.0.apk \
  --sdk /Users/jarvis/Library/Android/sdk \
  --java-home '/Applications/Android Studio.app/Contents/jbr/Contents/Home' \
  --keystore .scratch/android-user/debug.keystore \
  --key-alias androiddebugkey \
  --serial emulator-5580 \
  --avd-name penguin_kvaesitso_api35 \
  --artifacts .scratch/clock/identity-probe \
  --disposable-emulator
```

Recorded result on 2026-10-24:

```text
upcomingCollision=true
skipActionCollision=false
cancellingFirstCancelsSecond=true
REPRODUCED: distinct alarms share the upcoming PendingIntent; skip actions remain distinct
INSTRUMENTATION_CODE: -1
```

The probe separately asserts distinct main-alarm PendingIntents. Its green
outcome means it reproduced the original defect. The full suite below also
requires the unpatched identity assertion to fail and the patched assertion to
pass. Raw probe output and `finding.json` stay in the ignored artifacts directory.

## Patched official-APK integration

Inspect existing `.scratch/android-tests/README.md` and `env.sh` before setting
up Android. Reuse the existing named AVD and SDK. The example assumes an
existing disposable Android test key, alias `androiddebugkey`, password
`android`. Never use personal keys or real data. The runner refuses a physical
device, the wrong AVD, an official/foreign certificate, or an unowned installed
Clock payload. Reuse the same artifacts directory to retain ownership records.

```sh
python3 tests/clock/acceptance.py \
  --original .scratch/clock/downloads/original-1.6.0.apk \
  --mpp patches/build/libs/patches-1.0.0-dev.7.mpp \
  --desktop .scratch/android-tests/artifacts/morphe-desktop-1.18.1-all.jar \
  --sdk /Users/jarvis/Library/Android/sdk \
  --java-home '/Applications/Android Studio.app/Contents/jbr/Contents/Home' \
  --keystore .scratch/android-user/debug.keystore \
  --key-alias androiddebugkey \
  --serial emulator-5580 --avd-name penguin_kvaesitso_api35 \
  --artifacts .scratch/clock/acceptance --disposable-emulator --baseline
```

`--baseline` requires the real shared-PendingIntent regression, seeds custom
records in the unchanged official payload re-signed with the disposable key,
then installs the Morphe-patched APK with that same key. SQLite rows and
existing preferences are compared before/after update. The runner uses the
actual package, version, native APIs, receivers and notification action
PendingIntents. It never uninstalls, clears app data or forces compatibility.

Main coverage: real delayed advance-notice delivery, unchanged ringing time,
overlapping alarms in both scheduling orders, same-time alarms, correct
ID/timestamp/label, one-time and recurring skips, stale actions, one-shot
deletion, native delete, app 12/24-hour format, early/cancelled deliveries,
actual native ringing and five-minute snooze. Selected local weekday
calculations include midnight/year and DST-date boundaries in three timezones.

Separate phases terminate the app process and invoke the real native
rescheduling receiver to prove a skipped occurrence stays skipped. This is not
a device reboot test. A permission-denial phase verifies that the absence of
notification permission does not change main ringing scheduling or crash.

To test another lead time, repeat the command **without `--baseline`**, adding
`--lead N --mode timing`. Recorded values: **1, 30, 720, 1440**; default **120**
runs the full suite. `summary-N.json` records MPP/APK hashes and update retention.
All fixture alarm IDs are reserved test IDs `910014`–`910016`; cleanup refuses
non-fixture labels and verifies preservation of unrelated rows.

## Native UI acceptance

After the full default suite, with its default patched APK still installed:

```sh
python3 tests/clock/ui_acceptance.py \
  --sdk /Users/jarvis/Library/Android/sdk \
  --java-home '/Applications/Android Studio.app/Contents/jbr/Contents/Home' \
  --keystore .scratch/android-user/debug.keystore --key-alias androiddebugkey \
  --serial emulator-5580 --avd-name penguin_kvaesitso_api35 \
  --patched .scratch/clock/acceptance/patched-120.apk \
  --acceptance-artifacts .scratch/clock/acceptance \
  --artifacts .scratch/clock/ui --disposable-emulator
```

This seeds two synthetic recurring alarms, edits A's label through the native
dialog, verifies every other alarm field and unrelated row, toggles B off,
checks only B's notice disappears, deletes A through native selection/delete,
and restarts the app. Instrumentation checks the real DB, notification and
metadata state after these actions and removes fixture records at the end.

`UiSnapshot.java` is a separate instrumentation package targeting itself. It
reads fresh accessibility state without killing Clock or requiring its ticking
off-screen clock page to go idle. It waits for an actual active/focused window;
the runner rejects missing/ambiguous/hidden controls and handles the IME before
tapping save. It does not reuse an earlier UI dump. On failure, inspect the
captured state and fixture before rerunning; do not bypass the assertions.
XML, screenshots, DB snapshots, logs and `summary.json` remain under `.scratch`.

## Matched notification evidence

After default acceptance, capture the original and patched APKs with the same
two synthetic daily alarm definitions, approximately 45 and 60 minutes ahead:

```sh
python3 tests/clock/capture_evidence.py \
  --sdk /Users/jarvis/Library/Android/sdk \
  --java-home '/Applications/Android Studio.app/Contents/jbr/Contents/Home' \
  --keystore .scratch/android-user/debug.keystore --key-alias androiddebugkey \
  --serial emulator-5580 --avd-name penguin_kvaesitso_api35 \
  --original .scratch/clock/downloads/original-1.6.0.apk \
  --baseline .scratch/clock/acceptance/original-resigned.apk \
  --patched .scratch/clock/acceptance/patched-120.apk \
  --acceptance-artifacts .scratch/clock/acceptance \
  --artifacts .scratch/clock/notification-evidence --disposable-emulator
```

The original has no upcoming notification outside its ten-minute window. The
120-minute patched build receives both notices through real AlarmManager
delivery. Invoking A's real notification action leaves B's notice intact.
The runner compares stored rows across the same-key update and both setups,
checks recurring definitions after skipping, and removes only owned fixtures.
It captures raw native PNGs and fresh accessibility XML, with no image edits,
direct warning receiver calls or injected notification objects. Clock's group
is expanded using its own freshly observed accessibility control.

On this emulator, very near exact alarms are clamped to a minimum delivery
delay. Keep the scheduling instrumentation alive for eight seconds; starting
another instrumentation targeting Clock force-stops it and can discard pending
broadcasts. Opening native Clock also reschedules alarms, so wait again before
capturing. Use the independent UI driver to observe delivery. Exclude Android's
`ranker_group` summary when counting actual per-alarm notices. These are harness
constraints, not evidence of a product regression.

Images and the curated verification summary may be copied to `pr-assets` only
with explicit publication authorization. APKs, keys, full logs and databases
stay ignored. This script itself publishes nothing.

## Bundle, ABI and negative-input checks

```sh
"/Applications/Android Studio.app/Contents/jbr/Contents/Home/bin/javac" \
  -cp .scratch/android-tests/artifacts/morphe-desktop-1.18.1-all.jar \
  -d .scratch/clock/tools tests/clock/VerifyClockBundle.java \
  tests/kvaesitso/VerifyPatchedApk.java
"/Applications/Android Studio.app/Contents/jbr/Contents/Home/bin/java" \
  -cp .scratch/android-tests/artifacts/morphe-desktop-1.18.1-all.jar:.scratch/clock/tools \
  VerifyClockBundle patches/build/libs/patches-1.0.0-dev.7.mpp \
  patches/build/libs/patches-1.0.0-dev.7.mpp
"/Applications/Android Studio.app/Contents/jbr/Contents/Home/bin/java" \
  -cp .scratch/android-tests/artifacts/morphe-desktop-1.18.1-all.jar:.scratch/clock/tools \
  VerifyPatchedApk .scratch/clock/acceptance/patched-120.apk \
  Lio/github/pengusto/patches/extension/clock/
python3 tests/clock/reject_inputs.py \
  --java '/Applications/Android Studio.app/Contents/jbr/Contents/Home/bin/java' \
  --desktop .scratch/android-tests/artifacts/morphe-desktop-1.18.1-all.jar \
  --mpp patches/build/libs/patches-1.0.0-dev.7.mpp \
  --original .scratch/clock/downloads/original-1.6.0.apk \
  --patched .scratch/clock/acceptance/patched-120.apk \
  --wrong-version .scratch/clock/downloads/original-1.5.0.apk \
  --wrong-package .scratch/kvaesitso/downloads/original-v1.41.0.apk \
  --artifacts .scratch/clock/rejections
```

The incompatible-version control is the [official Clock 1.5.0 APK](https://github.com/FossifyOrg/Clock/releases/download/1.5.0/clock-9-foss-release.apk),
SHA-256 `c494c178bb9ffb3b3c6954aa520fc2c1be83e87aba62112da0aa76b2a61f69ea`.
Negative checks require zero applied patches and unchanged DEX for the wrong
version/package, clear rejection without an output APK for already patched
bytecode, and explicit failure for numeric lead values 0, -1 and 1441.
Morphe Desktop's option-validator fallback was observed to silently use 120;
the patch therefore checks bounds inside execution, verified by the negative
patch reports. Bundle inspection rejects unrelated runtime classes or stubs;
the APK ABI check resolves against actual shipped R8 classes, not stub jars.

No real audio, physical/OEM, deep-Doze or full-reboot claim. No APKs, signing
keys or complete device logs are committed. The native source-only fix paths
for the other Fossify apps are separate from this patched-official-APK proof.
