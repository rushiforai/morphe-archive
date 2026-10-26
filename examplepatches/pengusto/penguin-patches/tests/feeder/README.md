# Feeder #391 acceptance

Use only the exact official project-release F-Droid-flavor **2.25.0** APK. [The guide](../../docs/FEEDER.md) records its URL, SHA-256, official certificate and tested behavior. Generated APKs, keys, logs and screenshots belong in ignored `.scratch/`.

## Build and environment

Use Java 21, an Android SDK and normal GitHub Packages read credentials through the environment. Reuse an existing disposable AVD and test key; inspect local ignored setup notes before installing another SDK/image. Do not wipe an AVD, uninstall or clear app data. The checked runner uses Android 15 / API 35 ARM64, platform 35 and build-tools 36.0.0; the Gradle extension build also needs its configured compile platform (currently 36).

```sh
./gradlew :patches:generatePatchesList :extensions:feeder:lintRelease
```

Metadata generation depends on the exact Android MPP and reads its manifest version. Do not edit generated patch metadata manually. Set `-Pversion=...` and `-PpatchListOutput=.scratch/...` only for a local candidate build when necessary.

## Original, update and native UI acceptance

Set the explicit paths and disposable AVD identity for your machine:

```sh
python3 tests/feeder/acceptance.py \
  --original "$PENGUIN_ORIGINAL_APK" \
  --mpp "$PENGUIN_MPP" --desktop "$PENGUIN_DESKTOP_JAR" \
  --sdk "$ANDROID_HOME" --java-home "$JAVA_HOME" \
  --keystore "$PENGUIN_TEST_KEYSTORE" --key-alias "$PENGUIN_TEST_ALIAS" \
  --artifacts .scratch/feeder-acceptance \
  --serial "$PENGUIN_EMULATOR_SERIAL" --avd-name "$PENGUIN_AVD_NAME" \
  --disposable-emulator --baseline
```

The runner checks original checksum/certificate/package/version, emulator hardware/AVD/root, disposable consent and prior installation ownership. It refuses unknown app data, preserving the exact built-in Feeder News feed. Reuse its `owned-apks.json` for later runs against the same test installation. It never uninstalls, clears data, overrides compatibility or publishes.

Eleven owned synthetic article fixtures exercise Feeder's actual reader:

- Body/header/table images, actual clicks and Close/Back; PNG/JPEG/static GIF/WebP, declared srcset selection, missing captions, broken-image errors and retry.
- Real multi-pointer pinch, drag/pan, double-tap, zoom/reset buttons and fit/8x bounds; proper pointer-up streams and fresh UI/focus checks.
- Linked-image choice and original fragment target; unchanged text-link anchor navigation.
- Loopback HTTP fetch of a 3200x1800 image, native 2500-pixel decode cap, cached reuse with the server stopped, delayed-load dismissal and native job cancellation.
- Cached/uncached loading on a temporarily metered default AndroidWifi network, native Wi-Fi-only policy and retry when the native Repository permits loading. Both policy and network state are restored in `finally`; non-default starting network policies are rejected.
- German controls at 150% font scale, Activity recreation/stop, late callbacks and preservation of subscriptions/bookmarks/preferences.

The same-key update compares every `rssDatabase` row, preference, datastore file and article-blob hash before starting the patched app. Native reader tests may subsequently mark articles read. Publisher keys are never used. A matching disposable test certificate is required across updates.

`--installed-suite` only reruns the suite against this runner's owned patched APK and does not replace a complete original/update run. Only `am instrument -w -r` result code -1 plus PASS is success. Raw failures/logcat remain ignored.

## Bundle, inventory and rejection checks

Compile `VerifyFeederBundle.java` and `ModifiedFixture.java` with the verified Morphe Desktop JAR on the classpath. `VerifyFeederBundle NEW_MPP PRIOR_RELEASED_MPP` rejects bundled app stubs/runtime libraries and compares the previous released Fossify MPE byte for byte. The Feeder MPE must contain only its 22 own extension classes. `VerifyFeederApk PATCHED_APK` checks the actual R8 APK's app/extension references, including inherited app methods; inherited platform methods use the same framework boundary as direct platform calls.

```sh
python3 tests/feeder/verify_metadata.py \
  --java "$JAVA_HOME/bin/java" --desktop "$PENGUIN_DESKTOP_JAR" \
  --mpp "$PENGUIN_MPP" --metadata patches-list.json \
  --expected-version "$PENGUIN_RELEASE_VERSION" --artifacts .scratch/feeder-inventory
```

This checks Android patch DEX, exact manifest/metadata version, all **12 patches / nine apps** and the actual Morphe Desktop inventory. Feeder supports 2.25.0 only.

`ModifiedFixture ORIGINAL_APK OUTPUT_APK` creates an extra-NOP negative fixture; never install it. `reject_inputs.py --java JAVA --desktop DESKTOP --mpp MPP --original ORIGINAL --patched PATCHED --modified-bytecode NEGATIVE --artifacts DIR` verifies wrong package/version select zero patches and preserve DEX, while modified/already-patched input fails without output.

The guide links the public raw screenshots and curated provenance. Full test data, keys and logs stay local. Physical/OEM devices, other Android/APK distributions, TalkBack, animated GIF, SVG/AVIF and arbitrary authenticated/remote servers remain unproven.
