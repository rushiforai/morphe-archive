# Komikku patch acceptance

Run from the Penguin checkout. Use only the explicitly owned, disposable
`komikku` AVD on `emulator-5584`, Android 35 ARM64; every Android helper verifies
that identity. Existing personal installations and the shared `penguin` AVD
are outside this runner's scope.

## Inputs and environment

Set `JAVA_HOME` to an existing Java 21 installation and `ANDROID_HOME` to the
existing SDK containing platform 35 and build-tools 36.0.0. The Penguin Gradle
build additionally needs platform 36; use the existing SDK that contains it.
Do not duplicate SDKs or multi-gigabyte AVD data to satisfy these paths. A fresh
owned overlay over a copied initial userdata image is sufficient.

Pin the official [input and signer](../../docs/KOMIKKU.md#original-input).
Keep APKs, tool jars, keystores, raw archives and build output under `.scratch`.
Use separate Morphe Desktop directories: its JAR-adjacent data directory
contains mutable signing/import state.

The original fixture APK is the official executable payload signed with the
same disposable key as Manager exports. Verify their executable class digests
are equal before treating it as the original baseline. `KOMIKKU_TEST_KEYSTORE`
points to that local key (alias `test`, fixture password `android`). Import it
through Manager's Signing key UI; keys are never committed.

```sh
sh tests/komikku/build-native.sh
"$ANDROID_HOME/platform-tools/adb" -s emulator-5584 install -r --no-incremental .scratch/komikku/native/acceptance.apk
```

Install and launch the baseline once, then seed only an empty disposable
library. The instrumentation refuses pre-existing non-fixture manga. It creates
Local Source CBZs and synthetic custom covers through Android APIs.

```sh
"$ANDROID_HOME/platform-tools/adb" -s emulator-5584 shell am instrument --user 0 -w -r \
  -e disposable true -e mode seed \
  io.github.pengusto.patches.komikku.acceptance/io.github.pengusto.patches.komikku.tests.LocalSearch
python3 tests/komikku/acceptance.py --phase original --adb "$ANDROID_HOME/platform-tools/adb"
```

Expected original predicate failures: 2/8. The UI runner verifies ten observed
sets, including the original's defective results. Invoke `-e mode regression`
for later predicate runs; do not seed an existing fixture again.

## Manager and same-key installation

Import the candidate MPP through the actual Manager UI, then load the official
original APK from storage. Confirm its internal original cache has the pinned
SHA-256. From its patch selection screen:

```sh
python3 tests/komikku/manager_case.py --adb "$ANDROID_HOME/platform-tools/adb"
```

This explicitly observes off/on selection, invokes Patch, checks Patched and
records the actual runtime from logcat. It handles the one-time foreground
patching prompt. The accepted run uses Manager 2.2.0's embedded JVM.

Tap Save, then from Android's save picker:

```sh
python3 tests/komikku/export_apk.py --adb "$ANDROID_HOME/platform-tools/adb" \
  --apksigner "$ANDROID_HOME/build-tools/36.0.0/apksigner" \
  --name komikku-manager-unique-case.apk
```

Exports are asynchronous. The helper refuses stale filenames, requires four
stable positive-size samples and verifies the completed APK's signature before
recording success. Capture state immediately around Manager's actual Install /
Android UPDATE operation, then verify that the installed APK's hash equals the
export. On a fresh runner, enable Morphe's Android installation permission and
invoke Install again if Settings returns without showing the installer.

```sh
python3 tests/komikku/snapshot.py before-update --adb "$ANDROID_HOME/platform-tools/adb" --serial emulator-5584
# Manager: Install -> Android: UPDATE; verify installed APK hash.
python3 tests/komikku/snapshot.py after-update --adb "$ANDROID_HOME/platform-tools/adb" --serial emulator-5584
python3 tests/komikku/acceptance.py --phase patched --adb "$ANDROID_HOME/platform-tools/adb"
```

The state JSONs must match. They include every database table, user preference,
local fixture file hash and owner marker. Raw archives retain everything;
application logs and the two computed cover caches are recorded separately.
Check native predicate results separately: the patched APK must pass 8/8.
`LocalSearch.java` injects the real Application context for its focused predicate
test; the actual UI suite separately exercises normal app initialization and
search parsing. It never substitutes the predicate or edits an app screenshot.

## Structural and release checks

```sh
java -cp "$MORPHE_DESKTOP_JAR" tests/komikku/VerifyLocalSearch.java "$ORIGINAL_APK" "$MANAGER_EXPORT"
java -cp "$MORPHE_DESKTOP_JAR:$MPP" tests/release/CompareDex.java "$DESKTOP_OUTPUT" "$MANAGER_EXPORT"
java -cp "$MORPHE_DESKTOP_JAR" tests/release/VerifyReleaseBundle.java "$MPP" "$PRIOR_RELEASE_MPP"
python3 -B -m unittest discover -s tests/komikku -p 'test_*.py' -v
```

`VerifyLocalSearch` requires all 377 instructions and incoming branches to remain
unchanged except the intended null edge. Replacing the instruction in place is
necessary: insert/delete redirected three incoming edges past the guard in the
rejected prototype. Also patch with Desktop 1.18.1 and 1.19.1, compare output,
reject re-patching, and compare all existing MPE/Finamp payload bytes with the
previous release. Generate the catalogue with Gradle and README with its normal
generator; do not hand-edit release metadata.

[Accepted evidence](evidence/2026-10-30/README.md) includes hashes, exact source
refs, screenshots/XML, real Manager stages and retained state.
