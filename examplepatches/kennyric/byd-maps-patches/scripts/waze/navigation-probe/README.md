# Navigation broadcast / Gearslip probe

Local test tooling, not shipped inside the patch extension or a Vela integration.

Use an arm64 Google APIs Android 36 emulator with the supplied Gearslip release installed. Build `Receiver.java` + `Launch.java` as package `nl.johninnl.wavereceiver` using `receiver-manifest.xml`; sign it with an independent test key. Build `Probe.java` as `nl.johninnl.wazenavprobe` using `probe-manifest.xml`; sign it with the same Android test key as the patched Waze APK and all its original splits.

Compile with `javac --release 8` against `platforms/android-36/android.jar`, convert the resulting classes with the SDK `d8`, link the respective manifest with `aapt2 link -I android.jar`, add `classes.dex` to the APK and sign with `apksigner`. Use a fresh output directory. These are test keys; do not use the repository's bundle-signing secret.

Patch the supplied Waze base with **Broadcast navigation data**, option `receiverPackage=nl.johninnl.wavereceiver`, and **Support Gearslip**. This deliberately tests the new patches without the zone overlay or Share alerts patch. Install the base with the original arm64/density/language splits signed with the same test key. Initialize Waze and grant its location/background-location and notification permissions on the test emulator.

Launch the receiver once to clear Android's stopped-package state, then run:

```sh
adb -s emulator-5640 shell am start -n nl.johninnl.wavereceiver/.Launch
adb -s emulator-5640 shell am instrument -w nl.johninnl.wazenavprobe/nl.johninnl.wazenavprobe.Probe
adb -s emulator-5640 exec-out run-as nl.johninnl.wavereceiver cat files/events.jsonl > events.jsonl
python3 scripts/waze/validate_navigation_events.py events.jsonl
```

The native probe resolves the real location provider through Koin (the old `mInstance` field is not used), checks Gearslip host admission with validation enabled and negative host/UID cases, backgrounds Waze with the Home action, then drives the actual patched native callbacks. It tests English/translated units, legacy observations, insights IDs and disable behavior. The external receiver is a different UID and signing key; on Android 14+ it records framework sender identity.

The receiver app is debuggable for extracting its test JSONL and has no internet permission. Its manifest receiver works because the test patch explicitly targets its package. The default implicit protocol instead requires a dynamic receiver in a running consumer/service. Captures may contain prior runs; the verifier selects the latest publisher process session.

This tests native callback wiring and local IPC in the background. It does not simulate a physical head unit or establish live-road/whole-zone enforcement accuracy.

## Gearslip host admission

`HostProbe.java` runs Waze's own `HostValidator` and `hosts_allowlist` against the installed hosts. Use it whenever **Support Gearslip** changes. The probe above runs with the official Gearslip release, so it cannot show that a patched build is accepted.

Patch Waze with **Support Gearslip** only, and sign it with the same test key as the probe. Build the probe as `nl.johninnl.wazehostprobe` using `host-probe-manifest.xml`. Sign Gearslip with a different key, so its certificate matches neither the official release nor Waze:

```sh
adb -s emulator-5640 shell am instrument -w -r nl.johninnl.wazehostprobe/.HostProbe
```

The run must end with `RESULT PASS`. For a real connection, open **Preview** in Gearslip. Waze's car screen should appear, not "would not start". Grant Gearslip's notification permission first, because its prompt covers the preview.
