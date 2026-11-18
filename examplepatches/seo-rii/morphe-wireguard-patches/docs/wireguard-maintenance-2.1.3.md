# WireGuard v2.1.3 maintenance and validation

This report records the custom distribution built on Morphe Patches v2.1.0 at
`8fa2c7a1a832498de8f179748998a3ca87e198eb`. The contribution branch tracks a
newer upstream base; its results do not replace the custom build's checks below.

The maintainer's reported successful device use of v2.1.1 is historical,
first-hand experience. It is not a v2.1.3 Android acceptance run.

## Changes

- The settings Activity reuses Morphe's existing theme, toolbar and preference
  layout. The switch reflects the saved setting and requires confirmation,
  validation and restart before changing routing.
- Profile operations separate document access, text decoding/size, native
  validation/loading, encrypted storage, and stored-profile loading failures.
  Only a dedicated JNI exception carries the parser's fixed, sanitized reason.
  Provider/storage exception messages and causes are not exposed or retained.
- The parser accepts case-insensitive `PersistentKeepalive = off`, bare numeric
  interface addresses, and bare numeric `AllowedIPs`. A bare route is exactly
  `/32` or `/128`; it never broadens to a subnet. Existing explicit CIDRs and
  DNS coverage checks remain in effect.
- Applicable contribution fixes abort incomplete plain HTTP response bodies,
  remove/stop peers before closing the device/TUN, recover AtomicFile backups,
  and clean up native startup/listener failures and temporary random buffers.
- Native code, Java/Kotlin and Android patch DEX use the source build. Both app
  patches remain default-selected; routing remains disabled until the user
  imports a supported profile and explicitly enables it. The profile storage
  format and encryption-key alias are unchanged.

## Artifact and toolchain

| Item | Verified value |
| --- | --- |
| Bundle | `morphe-wireguard-youtube-music-preview-2.1.3.mpp` |
| Bundle SHA-256 | `557463a7dd755857d81742f998e34b654010c75dc1de830e713c0b8fc569b25d` |
| Source base | `8fa2c7a1a832498de8f179748998a3ca87e198eb` |
| Gradle / JVM | Wrapper 9.8.2 / JDK 21.0.13+9; Java target 17 |
| Android SDK / Build-Tools | 36 / 36.0.0 |
| Go / NDK | 1.26.10 / 28.2.13676358 |
| Native API / ABIs | 26 / arm64-v8a, x86_64 |
| Morphe Desktop | 2.1.1 |

The native payloads built in the custom and contribution source trees matched:

| ABI | ELF bytes | SHA-256 |
| --- | ---: | --- |
| arm64-v8a | 10,092,616 | `92a4775daa7c6ab83b50193d8a746b66876fcc35a243c5c107613bb8ee0d83b4` |
| x86_64 | 10,804,168 | `faef4a8b199be97e628a5f4f955b5a2782e236ae5992f032c4fc171702ad186e` |

This is a same-host comparison with pinned inputs. It does not establish
independent reproduction on another operating system or NDK host package.

## Executed source checks

| Check | Result |
| --- | --- |
| Full Gradle source build and resource checks | Passed |
| Java/Kotlin JUnit results | 608 cases: 603 passed, 5 existing APK-dependent cases skipped, no failures/errors |
| New import-workflow regression suite | 24 passed, included in the JUnit total |
| Standalone host JNI | 42 checks passed |
| Python verification-wrapper tests | 33 passed |
| Native Go tests with race detector | Passed; 26 top-level tests |
| `go vet ./...` | Passed |
| Bounded parser fuzzing | 20,450 executions passed |
| Real Morphe JAR patch loader | 202 patches; both default-selected WireGuard patches and app-specific dependencies present |
| JVM and Android patch DEX selection flags | Both apps default to `true` |
| Native payload packaging | Both ABIs match built ELF files; architecture, 16 KiB alignment and JNI exports checked |
| DEX/JNI compatibility | Three exact native signatures; dedicated exception and public String constructor present; both ELF class names match |
| English resources and notices | Unique required keys and complete license index present; 41 WireGuard English strings checked in the final APKs |
| Review patch applicability | `git apply --cached --check` passed against the original base in an isolated index |

The import tests exercise real decoding and operation sequencing against
external provider, native and storage boundary stubs. They confirm safe failure
classification, no secret-bearing causes, no save before validation, and no
save after interruption. They do not execute Android's document provider or
hardware-backed key store. Existing host store tests exercise the encrypted
envelope with a test-only provider rather than AndroidKeyStore hardware.

Commands used, with tool/dependency paths supplied by the build environment:

```sh
wireguard_gradle=(bash ./gradlew
  --init-script build-support/wireguard-public-sources.init.gradle
  "-Dmorphe.publicSources=$wireguard_sources"
  "-Dmorphe.patchRoot=$PWD" -Pversion=2.1.3 --no-daemon --max-workers=2)
"${wireguard_gradle[@]}" :patches:test \
  :extensions:shared-youtube:library:testDebugUnitTest \
  :extensions:youtube:testDebugUnitTest :extensions:music:testDebugUnitTest \
  :patches:checkStringResources
"${wireguard_gradle[@]}" :patches:verifyWireGuardBundleLoading

python3 -m unittest discover -s scripts/tests -p 'test_*.py'
python3 scripts/verify-wireguard-bundle.py "$wireguard_bundle" \
  --dexdump "$ANDROID_HOME/build-tools/36.0.0/dexdump"
python3 scripts/set-wireguard-defaults.py verify "$wireguard_bundle" \
  --dexdump "$ANDROID_HOME/build-tools/36.0.0/dexdump"
WIREGUARD_JAVA_HOME="$JAVA_HOME" bash scripts/test-wireguard-jni.sh
(cd native/wireguard && "$WIREGUARD_GO_BIN" test -race -count=1 ./...)
(cd native/wireguard && "$WIREGUARD_GO_BIN" vet ./...)
(cd native/wireguard && "$WIREGUARD_GO_BIN" test -run '^$' \
  -fuzz FuzzValidate -fuzztime=10s -parallel=2 .)
```

The default-selection helper was used only to inspect the source-built bundle.
Its historical `repair` operation was not used to create v2.1.3.

## Executed APK checks

The signed Google originals were checked against the existing signature
allowlists, and their ZIP CRCs were verified before patching. The YouTube
original is universal; the wrapper created a clearly labeled unsigned
arm64-only fixture while verifying retained entries against the original.
The original file was preserved. The Music original is already arm64-only.
No compatibility force option was used.

| Target | WireGuard plus dependencies | Full default selection | Final DEX files |
| --- | --- | --- | --- |
| YouTube 21.30.216 | `--validate` and APK inspection passed | `--validate` and APK inspection passed | 12 focused / 15 defaults |
| YouTube Music 9.30.53 | `--validate` and APK inspection passed | `--validate` and APK inspection passed | 10 focused / 10 defaults |

All four final APKs were unsigned test artifacts. Inspection verified native
payload equality, ABI set, manifest registration/permissions, English resources,
license assets, the inclusion marker, runtime/JNI classes and network-hook
calls. These checks do not prove execution of the hooks or protected DNS paths
on Android. The counterpart contribution bundle passed its own four cases;
those are not counted as additional custom-distribution cases.

Reproduce with your own original APK paths and installed tools:

```sh
python3 scripts/validate-wireguard-apk.py matrix \
  --bundle "$wireguard_bundle" --desktop "$wireguard_desktop" \
  --java "$JAVA_HOME/bin/java" \
  --build-tools "$ANDROID_HOME/build-tools/36.0.0" \
  --readelf "$wireguard_readelf" \
  --target "youtube=$youtube_apk" --target "music=$music_apk" \
  --output-dir "$wireguard_new_results" \
  --default-selection --derive-64bit-input --abis arm64-v8a
```

Labels must contain only the safe characters accepted by the CLI; use a new
output directory. The wrapper records source/bundle hashes, derivation,
Desktop results and APK inspection in JSON. No target APK is distributed here.

## Not executed for this release

- Reproducing the reported import error on the reporting user's device/profile.
- Installing either target app and checking actual settings theme, toolbar,
  rotation, picker URI grants, import, encryption or restart behavior on Android.
- Real server handshake, video/music playback, DNS request-path or traffic-leak
  measurements, failed-server behavior, Wi-Fi/mobile handoff or long-running
  socket/thread/resource tests on Android.
- Concurrent target apps/processes, physical arm64/x86_64 device coverage, and
  a full minimum/latest experimental app-version acceptance matrix.

The attempted emulator environment did not provide a usable Android framework;
no target-app test was counted as executed. The source ZIP includes
`docs/wireguard-device-acceptance.md` with reproducible steps and **expected
results** for the outstanding device checks.

## Security and compatibility boundaries

Only intercepted requests use the authenticated local proxy and userspace
WireGuard stack. Other app traffic and separate processes are outside the
coverage claim. Intercepted requests must fail without direct fallback.
Local listener readiness is not evidence of a remote handshake or Internet
access. The patch does not use `VpnService` or provide a complete system kill
switch.

The supported subset still requires one peer, numeric endpoint/DNS addresses,
explicit DNS coverage and 64-bit APKs. Shell hooks, routing-table options,
hostname endpoints, DNS search domains, 32-bit ABIs and root mounting remain
unsupported. A syntactically accepted profile can still fail to handshake.

Profiles remain encrypted in app-private no-backup storage with an
AndroidKeyStore key. Java/Go strings and runtime copies cannot be completely
erased. The supported single-process path is distinct from safe simultaneous
cross-process profile mutation; cross-process coordination is not established
by the host tests. Use distinct server-issued client profiles for concurrent
YouTube/Music use.

See [source build and provenance](wireguard-source-build.md), the source ZIP's
dependency notices, and the historical
[default-selection report](wireguard-default-verification.md). GPL-3.0 and the
original Morphe NOTICE are retained. No private profiles, credentials, signing
keys or proprietary APKs are included in the release.
