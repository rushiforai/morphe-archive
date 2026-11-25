# Accountless browser-hook checks

`build_fixture.py` copies an emitted APK's DEX and resources byte-for-byte into a minimal fixture. It omits the app Application, providers, exported browser and Internet permission. The companion `BrowseProbe.java` executes the actual emitted classes on Android.

Requirements: Java, Python, Android SDK platform 36, build-tools 36.1.0 and the normal local Android debug keystore. The harness currently uses the macOS SDK location under the home directory, matching the existing YT Music policy harness.

Build in a fresh output directory:

```sh
python3 scripts/music-browser/build_fixture.py patched.apk .analysis/fixture-ytm-library --label ytm_library
```

Install only these separately named fixtures on the intended test emulator:

```sh
adb -s SERIAL install -r .analysis/fixture-ytm-library/fixture.apk
adb -s SERIAL install -r .analysis/fixture-ytm-library/probe.apk
adb -s SERIAL shell am instrument -w --no-hidden-api-checks -e app ytm nl.johninnl.musicprobe.ytm_library/nl.johninnl.musicprobe.BrowseProbe
```

The YT Music probe checks the emitted entry hook, two root tabs, seven native library categories, original fallback for unrelated browsers, captured `RemoteUserInfo` access, and safe native Home-loader completion without an account. `requestClass` and `infoClass` instrumentation arguments can override the exact supplied APK's `llc` / `ccn` bindings when testing another independently inspected build.

For Myspoti, build with `--label myspoti_library`, install that fixture and probe, and pass `-e app myspoti` with runner `nl.johninnl.musicprobe.myspoti_library/nl.johninnl.musicprobe.BrowseProbe`. It checks the shared permission wrapper, unchanged original decisions for other clients, and forged-package rejection at the real browser root.

A passing instrumentation result is `INSTRUMENTATION_CODE: -1` with `result=PASS`. These fixtures do not establish signed-in catalogue delivery, account access, playback, queue behavior, reconnect or Manager installation. Test those separately with the user's normal Gearslip host and a suitably signed music-app installation. Do not replace an account-bearing app using a different signer merely to run this harness.
