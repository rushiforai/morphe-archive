# Native description regression tests

Use an isolated emulator with the patched official Fossify Calendar 1.12.0 installed. The test APK must use the same temporary certificate as that installed APK. Never use a personal signing key for these tests.

Set `ANDROID_HOME`, Java 21 `JAVA_HOME`, `TEST_KEYSTORE` and `TEST_KEY_ALIAS`. The example uses the disposable Android test-key password `android`. From the repository root:

```sh
TOOLS="$ANDROID_HOME/build-tools/36.0.0"
API="$ANDROID_HOME/platforms/android-35/android.jar"
OUT=.scratch/regression
mkdir -p "$OUT/classes" "$OUT/dex"
"$JAVA_HOME/bin/javac" -cp "$API" -d "$OUT/classes" extensions/extension/src/main/java/io/github/pengusto/patches/extension/calendar/DescriptionPreview.java tests/DescriptionRegression.java tests/DescriptionInstrumentation.java
"$TOOLS/d8" --lib "$API" --output "$OUT/dex" "$OUT/classes/io/github/pengusto/patches/extension/calendar/DescriptionRegression.class" "$OUT/classes/io/github/pengusto/patches/extension/calendar/DescriptionInstrumentation.class"
"$TOOLS/aapt2" link -I "$API" --manifest tests/AndroidManifest.xml -o "$OUT/test.apk"
(cd "$OUT/dex" && zip -q ../test.apk classes.dex)
"$TOOLS/apksigner" sign --ks "$TEST_KEYSTORE" --ks-pass pass:android --ks-key-alias "$TEST_KEY_ALIAS" "$OUT/test.apk"
adb install -r "$OUT/test.apk"
adb shell am instrument -w io.github.pengusto.patches.calendar.tests/io.github.pengusto.patches.extension.calendar.DescriptionInstrumentation
```

Expected: `PASS: 13 native Android description regression cases`. Failure returns an assertion in the instrumentation result. Only the two test classes are bundled; rendering runs from the installed patched app. Android's HTML parser requires an Application context, so do not substitute a standalone dalvikvm/app_process run.

Also verify the actual day and Simple event list UI, empty-description visibility, exact source toggle, title-only save/readback, explicit source replacement and same-certificate updates. These integration checks are documented in `docs/VERIFICATION.md`; the parser tests alone do not prove correct bytecode hooks or sync behavior.

## Messages and File Manager instrumentation

`messages/` and `filemanager/` contain minimal Android Instrumentation classes and manifests. Compile with the Android 35 SDK and Java 21; use D8 and AAPT2 to package only the respective test classes (including FavoritePathsInstrumentation$Callback), not the runtime extension classes. Install the test APK with the same disposable test certificate as the patched target APK. Run:

```sh
adb shell am instrument -w io.github.pengusto.patches.messages.tests/io.github.pengusto.patches.tests.ReadNotificationsInstrumentation
adb shell am instrument -w io.github.pengusto.patches.filemanager.tests/io.github.pengusto.patches.tests.FavoritePathsInstrumentation
```

Both refuse physical-device execution. The File Manager tests temporarily replace the isolated app's favorite set, then restore it; use a fresh emulator without real user data. They use internal shared-storage fixtures and the target app's actual `renameFile` implementation. Messages needs notification permission. Keep Messages as default SMS app for the separate emulated-SMS UI integration test. Expected: 6 notification assertions and 26 favorite/path/callback/native-rename assertions. Android notification cancellation is asynchronous; the test uses a bounded state wait.

Also verify original vs patched UI with native screenshots, original-to-patched same-key update, read-state/provider retention, multiple UI renames, ordinary unfavorite vs file deletion, restart persistence and crash log. Exact reproduction and unverified storage/device gates are in docs/MESSAGES.md and docs/FILE_MANAGER.md.

## Messages lifecycle instrumentation

`tests/messages/VisibleConversationsInstrumentation.java` and `LifecycleManifest.xml` run 18 additional assertions against the actual patched target. Compile only the test class into the instrumentation APK, using the extension classes as compile references. Sign with the same disposable key as the emulator target and invoke:

```sh
adb shell am instrument -w io.github.pengusto.patches.lifecycle.tests/io.github.pengusto.patches.tests.VisibleConversationsInstrumentation
```

Use an isolated ranchu emulator, Messages default-SMS role, and no real user data. The test inserts only two synthetic inbox records and removes them in finally. Activity fixtures are created on main. Verify #927 and #928 independently at the APK-application level and together with #929 in the installed app; real UI/provider before/after tests remain required.

## Feeder image zoom (#391)

[Feeder acceptance](feeder/README.md) checks the exact original project-release F-Droid APK 2.25.0, separate image viewer, actual gestures, linked-image choices, native loader/cache/network policy, lifecycle and same-key data preservation. Static checks verify APK linkage, isolation of the existing Fossify runtime, rejection cases and agreement between the eight-patch/six-app release metadata and Morphe Desktop inventory. All Android tests require an explicitly owned disposable emulator.

## Patcher compatibility (all apps)

Before a release, run `tests/release/patcher_matrix.py MPP APK_DIR OUT_DIR DESKTOP_JAR...` with at least one Morphe Desktop 1.18.x (patcher 1.x) and one 1.19+ (patcher 2.x, as in Manager 2.x). It applies every app's patches to the original official APKs and checks that class-digest-guarded patches reject their own output. Compatibility guards use `codeDigest()` (canonical code text), not DexPool-serialized bytes, which differ between patcher versions.

## Additional patched-official-APK suites

- [Kvaesitso #1504: widget editor access, editing and update retention](kvaesitso/README.md)
- [Clock #14: configurable notice, per-alarm scheduling, skip and native UI](clock/README.md)
- [Calendar #381: all-day defaults, both Calendar patches and draft restoration](calendar/README.md)
- [Tasks.org #2838: parent navigation, native save/discard and filters](tasks/README.md)
- [Infinity+ 8.3.4: custom OAuth, subscription gate, redirects and invalid options](infinity/README.md)

The release bundle contains 13 patches for ten apps. Original APK provenance,
exact versions and known device/data limits are recorded in the linked guides.
These runners publish nothing and require an explicitly disposable fixture.

`tests/release/VerifyReleaseBundle.java`, run with the verified Morphe Desktop
JAR on the classpath and arguments `CURRENT_MPP PRIOR_RELEASED_MPP`, checks all
six MPE modules for runtime isolation and compares every prior release payload
byte for byte. The metadata checks additionally compare the actual Desktop
inventory with generated metadata and the MPP manifest version.
