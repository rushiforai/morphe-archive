# Maps consumer replay smoke

These test-only APKs validate the Google Maps consumer against controlled local broadcasts. They are not Waze or Flitsmeister and do not prove the native exporters, road accuracy, physical driving, Android Auto rendering, or audible output through a head unit.

`ReplayService` sends schema-1 primitive snapshots with Android's share-identity option from a real `com.waze` or `nl.flitsmeister` process. Its visible notification says "Maps controlled replay test". `MapsConsumerProbe` reads the actual patched Maps process through same-signature instrumentation. It reports accepted sessions, raw/effective values, zone state, road-alert adapter output, native label-generator binding, compact view attachment and accessibility description. It does not change consumer fields or synthesize a native GPS fix.

Use an explicitly selected, disposable API 34+ emulator. The runner refuses physical devices, unrooted shells, and replacement of a non-test Waze/Flitsmeister installation. Stock Maps stays installed alongside the patched package `org.ungoogled.android.apps.maps`.

Build with the local Morphe test signing key used for the patched APK. The default Morphe BKS format has an empty store password and the upstream default entry password; this helper does not read or alter application signing configuration.

```sh
python3 scripts/maps/runtime/build.py --sdk "$ANDROID_HOME" --desktop /path/to/morphe-desktop-all.jar --key /path/to/morphe.keystore --out /path/to/runtime-probes
```

Install the fully validated patched APK, then enable the task-scoped root emulator shell:

```sh
adb -s emulator-5554 install -r /path/to/defaults.apk
adb -s emulator-5554 root
```

Run a case or the complete replay suite:

```sh
python3 scripts/maps/runtime/smoke.py --sdk "$ANDROID_HOME" --serial emulator-5554 --probes /path/to/runtime-probes --out /path/to/runtime-evidence --case all
```

The runner backs up Maps' existing `ungoogled_ui` preferences before selecting sources, then restores them and removes the three test APKs in its cleanup block. `--keep-probes` retains the test APKs for manual inspection. It never clears Maps data or uninstalls stock Maps. Screenshots, JSON snapshots, raw instrumentation output and preference backups stay in the caller-selected output directory; keep that directory private when using an existing emulator profile.

Cases cover unknown values/native fallback, active partial average-speed zones, valid zero speed, malformed road arrays, explicit clearing, the retained upstream Waze bridge, provider death with local expiry, and a source-package claim that conflicts with Android's authenticated sender. A receiver's direct native-marker adapter output is evidence of binding and object construction; an actual map screenshot is still required to assess rendered pins. Widget screenshots and accessibility descriptions establish the real phone view, not the car display.
