# Gearslip caller validation

The compatibility patch authenticates only configured host packages using the `clientUid` supplied to `MusicBrowserService.onGetRoot`, forwarded unchanged into the app's allowlist method. It retains the actual caller package and never substitutes Google's Android Auto package. Its separate eligibility hook enables browsing for that configured client after authentication. Other clients retain the original methods.

`packageNames` defaults to `app.seb3thehacker.gearslip`. A separate Gearslip test copy must be explicitly configured, for example `app.seb3thehacker.gearslip.morphetest`. That package is not a default trusted host. Explicit manifest queries make those configured package lookups visible on Android 11 and newer.

Run the JVM extension policy checks:

```sh
python3 -m unittest tests/test_gearslip_ytm_policy.py
```

Compatibility is declared as Any. Discovery uses the original UID diagnostic and ownership lookup, then the browser-root and eligibility call graph. The production patch has no release/obfuscation map. It preserves original method bodies behind wrappers so changed register allocations do not shift parameters. Unknown/ambiguous contracts fail before APK emission.

Inspect the actual emitted APK and recover runtime-test bindings without a release table:

```sh
python3 scripts/ytmusic/verify_gearslip_dex.py patched.apk --dexlib-classpath /path/to/morphe-desktop-all.jar > bindings.json
```

`--version` is an optional informational label. The inspector reads every APK DEX and verifies wrapper UID forwarding, original policy/eligibility fallbacks and browser references. It is not an interpreter and does not establish successful playback.

`CallerPolicyProbe.java` uses the discovered bindings (`manager`, `caller`, `client`, `trust`, `eligible`, `browsable`, `context`, `membership`) as instrumentation arguments. It contains no release table. Build a minimal, separately installed policy fixture and probe using `build_policy_fixture.py`, then pass each binding as `-e key value` to its printed runner. These fixtures copy each input DEX unchanged and do not expose a music service or account providers. The probe checks configured host ownership, spoof/invalid UID rejection, eligibility and original unrelated-client fallback with deliberately unset server dependencies. Unrelated-client results or exceptions are compared directly with the preserved original methods, without assuming a particular flag implementation. Other declared versions can be used as fixture labels; this alone does not turn unchanged DEX into a newly tested real app release.

Known real reference APKs are 9.30.53 and 9.44.52. A version-relabelled fixture verifies that metadata no longer blocks otherwise recognized code. Renamed types/methods/fields and changed register allocations are covered by `BrowserDiscoveryTest` alongside rejection cases.

To validate the real Binder path separately, connect the configured host's `MediaBrowserCompat` to the patched target's `com.google.android.apps.youtube.music.mediabrowser.MusicBrowserService`. Record the callback package and UID from the service's callback or the compat transport, and verify `PackageManager.getPackagesForUid(clientUid)` contains exactly that claimed package. Do not read `Binder.getCallingUid()` later from a handler callback: it can be the service's own UID. A test app claiming the host's package while using another UID must fail; an unrelated correctly identified client must retain the stock result. Capture root ID, children result, metadata and play/pause separately. A reflective policy check does not establish successful browsing, authenticated content, playback or vehicle projection.

The matching signing key for the existing installed Morphe YT Music copy is unavailable locally. Do not replace or uninstall that account-bearing app. Parent-controlled validation uses separately installed copies. No emulator is required or recreated by these tools.
