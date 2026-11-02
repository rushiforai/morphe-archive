# Gearslip density validation

Use disposable Android emulators and separately named test installations. Keep the official phone installation and its data intact.

Build the collection and run the Gearslip extension and bytecode tests. Set `GEARSLIP_ORIGINAL_APK` to the original 0.3.31-alpha APK to run the optional real-APK hook tests; CI skips those artifact-dependent cases.

```bash
./gradlew :patches:buildAndroid :patches:test :extensions:gearslip:testDebugUnitTest --no-daemon
```

Apply **Control car display density**, **Hide apps from drawer** and **Keep music player entries** with Morphe to that original APK. Also check density alone, and the existing drawer/music patches on 0.3.12-alpha. Do not force the density patch onto unsupported versions.

Prepare the combined patched APK for isolated testing:

```bash
python3 scripts/gearslip/prepare_test_copy.py patched.apk test-copy
python3 scripts/gearslip/build_density_probe.py density-probe
```

The first helper changes only test packaging, preserves the patched DEX byte-for-byte and signs with the Android debug keystore. The second builds a matching instrumentation APK. Install both only on the chosen disposable emulator, using its explicit serial:

```bash
adb -s emulator-5554 install -r test-copy/gearslip-test.apk
adb -s emulator-5554 install -r density-probe/density-probe.apk
adb -s emulator-5554 shell am instrument -w nl.johninnl.gearslip.densityprobe/.DensityProbe
```

Expect a passing result and instrumentation code `-1`. The probe executes the real modified connection and `Lent` classes, checks configuration DPI and dp dimensions, verifies unchanged pixels, exercises session snapshots and reset, and checks Apps ordering without mutating the enum. It writes only the disposable copy's density preference and finishes at **From car**. It does not bind a real navigation app or create a projection.

Complete the rendered checks separately:

1. Open Gearslip's phone home screen. Confirm **Apps** appears before **Screen** and opens its app list.
2. Open **Screen → Car display density**, immediately after **Size**. Select **200 DPI**, return home, then open **Preview**.
3. Confirm the caption shows 200 DPI. Inspect `adb -s emulator-5554 shell dumpsys display`: the `gearslip-preview` display must retain its pixel size and report density 200.
4. Close the preview, choose 240 DPI and reopen it. Confirm both readings change to 240. Repeat with **From car** to restore the original density.
5. Reopen the density screen after restarting the test app to confirm persistence. Check the density-only patched build independently.

An emulator verifies patch execution and UI wiring. A physical head-unit test is still needed for app-specific layouts, readability and touch alignment on the EONON X3U.
