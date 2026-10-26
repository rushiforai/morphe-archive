# Kvaesitso #1504 acceptance

## Morphe patch against the official APK

The Morphe candidate targets **only the original official Kvaesitso 1.41.0**.
Input SHA-256 and certificate are pinned in
[`docs/KVAESITSO.md`](../../docs/KVAESITSO.md). Build with Java 21 and the
normal `./gradlew :patches:buildAndroid` task when GitHub Packages access is
available. Never force compatibility or use a patched APK as patch input.

For a local machine without registry credentials, `build_local.py` uses the
unmodified official Morphe Gradle plugin v1.3.4 checkout and public Morphe
Desktop 1.18.1 API classes (Patcher 1.15.1). It verifies the source revision
and Desktop SHA-256. Only an ignored Gradle init script and local Maven cache
are created; no global Gradle configuration is changed. Supply these verified
inputs explicitly:

```sh
python3 tests/kvaesitso/build_local.py \
  --plugin-source .scratch/morphe-gradle-plugin \
  --desktop .scratch/android-tests/artifacts/morphe-desktop-1.18.1-all.jar \
  --sdk .scratch/android-sdk \
  --java-home "$JAVA_HOME" --gradle-home .scratch/gradle-cache \
  --work-dir .scratch/kvaesitso/reproducible-build --lint
```

Patch the official APK with the resulting release MPP (or an explicitly selected local build):

```sh
java -jar "$MORPHE_DESKTOP" patch "$ORIGINAL_APK" \
  -p patches/build/libs/patches-1.0.0-dev.7.mpp \
  --exclusive -e 'Restore widget editing from the search menu' --unsigned \
  -o .scratch/kvaesitso/morphe/patched-unsigned.apk \
  -r .scratch/kvaesitso/morphe/patch-result.json \
  -t .scratch/kvaesitso/morphe/patch-work
java -cp "$MORPHE_DESKTOP" tests/kvaesitso/VerifyPatchedApk.java \
  .scratch/kvaesitso/morphe/patched-unsigned.apk
```

`VerifyPatchedApk.java` checks all non-framework method/field references from
the new runtime against the actual R8-shrunk APK and rejects duplicate DEX
classes. Compile stubs and Kotlin/Compose/coroutines libraries must not be
packaged in `extensions/kvaesitso.mpe`.

Sign a copy of the original and the patched APK with the **same disposable
test key**. The baseline must retain the original code and resources. Never
use a production signing key, and never uninstall an app containing real data.
The acceptance script verifies the signatures, package, original checksum,
baseline contents and named rooted AOSP fixture before installing anything.

```sh
python3 tests/kvaesitso/morphe_acceptance.py \
  --adb "$ANDROID_HOME/platform-tools/adb" --serial emulator-5580 \
  --apksigner "$ANDROID_HOME/build-tools/36.0.0/apksigner" \
  --aapt2 "$ANDROID_HOME/build-tools/36.0.0/aapt2" \
  --original "$ORIGINAL_APK" \
  --baseline .scratch/kvaesitso/morphe/baseline.apk \
  --patched .scratch/kvaesitso/morphe/patched.apk \
  --artifacts .scratch/kvaesitso/morphe/acceptance --disposable-emulator
```

Start the full run with a fresh fixture on the dedicated
`penguin_kvaesitso_api35` AVD: English UI, 1080×2400, a top search bar,
default widgets and no real user data. This script installs same-key test APKs,
changes fixture settings, seeds two synthetic notes in Room, reorders a note
removes a synthetic Media widget and adds a built-in Note through the picker.
It tests the exact original failure,
same-key update data retention, five menu/layout entry scenarios, three custom
gesture destinations, absent destinations and the current second widget page.
Editing checks verify every retained widget's identity/content, settings and
restart persistence. Content checks compare decoded JSON: the native editor
normalizes default `NULL` configs to `{}` and compacts JSON while saving edits.
The update check before editing compares every column exactly. A summary file
appears only after the relevant assertions
pass; navigation and editing have separate summary files. `--editing-only`
reuses the already installed and checksum-verified prepared fixture and skips
the baseline/navigation phase.

`reject_inputs.py` also verifies rejection of already patched/rebuilt release
bytecode and compatibility filtering for the debug package. Pass `--java`,
`--desktop`, `--mpp`, `--patched`, `--native-release`, `--debug`, and an ignored
`--artifacts` directory. Desktop may produce a zero-patch copy for an
incompatible package; the script requires zero applied patches and identical
DEX in that case.

## Matched public evidence capture

Reuse the existing accepted synthetic fixture and same-key APKs to capture
the original menu, patched menu and the actual opened widget editor:

```sh
python3 tests/kvaesitso/capture_evidence.py \
  --sdk /Users/jarvis/Library/Android/sdk \
  --java-home '/Applications/Android Studio.app/Contents/jbr/Contents/Home' \
  --serial emulator-5580 --avd-name penguin_kvaesitso_api35 \
  --original .scratch/kvaesitso/downloads/original-v1.41.0.apk \
  --baseline .scratch/kvaesitso/morphe/baseline.apk \
  --patched .scratch/kvaesitso/morphe/patched.apk \
  --artifacts .scratch/kvaesitso/issue-evidence/capture --disposable-emulator
```

For a newly built release APK, pass its independently verified SHA-256 with
`--expected-patched-sha SHA256`; the named fixture may contain the reviewed
prototype or that exact same-key release APK.

This runner verifies original/patched hashes, package/version, certificates,
unchanged baseline code/resources, the named rooted AOSP AVD and the owned
installation with its pre-existing synthetic note. It reuses the shared real
UI regression: hidden Edit button, separate widget page, search menu opened
from home. An original failure counts only when the actual hidden preference
was checked and the missing menu action caused `FAIL #1504`; setup errors fail
the capture. The patched run must reach the real editor and Add widget action,
exit through Done/Back, reopen editing and retain the hidden preference.

Every Widget column/row and setting is compared across the same-key update and
editor navigation. The initial settings are restored, the patched APK is left
installed and widget data must remain unchanged. No widget is added, removed
or reordered by this capture. PNGs are native screenshots without image edits;
fresh target-package XML and raw logs/databases remain ignored. The runner
publishes nothing. Only explicitly authorized, reviewed PNGs and a curated
provenance/checksum summary may be copied to `pr-assets`.

## Shared real-UI regression

`menu_regression.py` operates the installed app through its real accessibility
hierarchy and Android input events. It refuses physical devices, checks the
target package, and rejects stale UIAutomator dumps. Use an isolated emulator
with English UI, a top search bar and no real user data. Do not run parallel UI
tests on it.

```sh
python3 tests/kvaesitso/menu_regression.py \
  --adb "$ANDROID_HOME/platform-tools/adb" \
  --serial emulator-5580 \
  --package de.mm20.launcher2.debug \
  --button hidden --layout separate --start-page home \
  --artifacts .scratch/kvaesitso/example
```

The script verifies the actual hidden/visible edit-button preference, checks
the overflow menu, opens the widget editor, reaches Add widget, exits with
Done and Android Back, and confirms the preference was preserved. For a
visible button it also verifies that the menu does not duplicate that action
and opens editing through the existing button at the end of the widget list.

Repeat with `--button visible`, `--start-page widgets`, `--start-page search`,
and `--layout home`. The script assumes the default upward gesture opens the
separate widget page. The `home` layout may require scrolling past the clock.

With the official release APK use `--package de.mm20.launcher2.release`. The
unfixed 1.41.0 must fail with `FAIL #1504` after printing `Verified edit button
preference: hidden` and `Search bar menu: Wallpaper, Settings, Help`. Setup or
navigation failures do not establish reproduction or fix success.

Screenshots and XML snapshots are written only to the selected local artifact
directory. No APKs, signing keys or user data are part of this test source.
See `docs/KVAESITSO.md` for the pinned input and validation results.

## Native update/data and release acceptance

`native_acceptance.py` prepares a synthetic pre-existing note in the baseline
debug build, updates it with the same-key fixed debug build, compares every
Widget row, exercises reordering/removal, and verifies the retained note after
a process restart. It then tests the shrunk release build in light/separate
and dark/combined-home layouts and checks the crash buffer.

This script **clears the debug test package and replaces the release test
package**. Use only a new disposable emulator with no real user data. It
requires an explicit fixture flag, refuses physical devices and checks the
emulator hardware property. Do not run it on an emulator containing anything
you need to preserve. The note is a seeded database fixture; this test does
not claim to test adding a note through the unrelated widget picker.

```sh
python3 tests/kvaesitso/native_acceptance.py \
  --adb "$ANDROID_HOME/platform-tools/adb" --serial emulator-5580 \
  --baseline /path/to/native-baseline-debug.apk \
  --fixed /path/to/native-fixed-debug.apk \
  --release /path/to/app-default-release.apk \
  --artifacts .scratch/kvaesitso/acceptance \
  --disposable-emulator
```

Baseline and fixed debug APKs must use the same disposable certificate and
package name. The release test uses its own release package name and the same
disposable signing setup. An official upstream APK uses a different certificate.
