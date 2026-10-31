# Patches screen instrumentation

This dependency-free `android.app.Instrumentation` test runs against the installed, patched Curve 5.63.0 APK. It verifies the real Curve components, saved state, draft retention across activity recreation, toolbar Back, system Back, and Apply followed by the real launch activity. It also checks that the screen is private and uses Curve's existing theme.

Run only on the disposable **morphe_sample_api36** emulator. Never install or run this instrumentation on a phone or an emulator containing an account. The runner requires an explicit AVD argument and refuses physical-device hardware. The shell must independently verify the AVD name before installation.

The test reads and restores the private `morphe_patches` preferences, preserving original values and key absence. Synthetic tiles exercise the master toggle, checklist, reset, recreation, cancellation and atomic Apply. It never targets a signed-in installation. It reads no account preferences and makes no network requests itself. Curve's normal startup still runs during instrumentation and relaunch; use the signed-out test emulator. A process crash can interrupt the `finally` restoration, so do not use a personal installation.

Build and run **after the required three-reviewer gate**. No new Gradle module or dependencies are needed. From the repository root, use JDK 21 and Android build tools 36.0.0 from the [workspace setup](../../docs/workspace-setup.md):

1. Compile both Java files with `javac --release 17 -cp "$ANDROID_HOME/platforms/android-36/android.jar" -d <classes> tests/curve-screen/*.java`.
2. Convert every generated class, including inner classes, with `d8 --min-api 28 --lib "$ANDROID_HOME/platforms/android-36/android.jar" --output <dex> <class files>`.
3. Package `AndroidManifest.xml` using `aapt2 link -I "$ANDROID_HOME/platforms/android-36/android.jar" --manifest tests/curve-screen/AndroidManifest.xml -o <unsigned.apk>`, then add `classes.dex` from step 2 to the APK root.
4. Align with `zipalign -P 16 -f 4 <unsigned.apk> <aligned.apk>`. Sign with the same local Curve key used for the patched app: `apksigner sign --ks "$HOME/.android/morphe-curve-signing/curve-local.p12" --ks-key-alias curve-local --ks-pass "file:$HOME/.android/morphe-curve-signing/password.txt" --out <test.apk> <aligned.apk>`. Do not print the password or add a separate `--key-pass` argument. Verify the signature before installation.
5. Verify and use an explicit emulator serial for every device command:

```sh
test "$(adb -s emulator-5556 emu avd name | tr -d '\r' | head -n 1)" = morphe_sample_api36 || exit 1
adb -s emulator-5556 install -r <signed-patched-curve.apk>
adb -s emulator-5556 install -r <test.apk>
adb -s emulator-5556 shell am instrument -w -r \
  -e avd morphe_sample_api36 \
  app.local.curve.screen.test/app.local.curve.screen.test.PatchesScreenTest
```

Require both the `PASS Patches screen` stream result and instrumentation result code `-1`. A shell exit code alone does not establish success. No uninstall, app-data clearing, account login, or private-data capture is part of this test.

This test does not prove visual contrast or layout quality. Inspect the screen separately in dark/light themes and with large text on the dedicated signed-out emulator, restoring its original settings afterward.

For **Remove Cringe**, compile both Java files in this folder. Run the same instrumentation against variants with and without the optional patch, passing `-e cringe true` or `-e cringe false` respectively. The check asserts conditional switch visibility, draft cancellation/recreation and atomic saving. The included variant also tests every curated string in all seven languages, the excluded names, server title matching, TextView resource reads and actual Curve XML inflation with the switch on/off/on. An optional `-e capture <name>` saves a screenshot in the target Curve APK's external files directory, since instrumentation runs as the target app. Use the dedicated signed-out emulator only.

For **Batch Go Back in Time**, also pass `-e batch true` or `-e batch false` to match the installed variant. Checks cover conditional switch visibility, default-on behavior, draft restoration/cancellation, atomic Apply, stale tile removal/click handling and re-enabling. The tile checklist starts collapsed, restores its expanded draft across recreation and retains selection/reset behavior. Native batch tests separately check that disabling blocks new submissions while preserving result and stop controls.

The included variant also checks Batch GBIT's position immediately before Patches, duplicate/stale tile removal, stable ordering on repeated augmentation, an empty grid, and decoding its dedicated transparent PNG from the patched APK.
