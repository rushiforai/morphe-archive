# Building the unofficial WireGuard bundle from source

The v2.2.0 source merges the official stable Morphe Patches v2.2.0 at
`44031c561ea048c8f196877f30a49c13bfd6afb6`. The existing custom WireGuard implementation and localization fixes are retained.
All patches and fixes from that stable base are included. The public library pin
matches the official `2.2.0-dev.3` dependency; later unreleased patch commits are
not included.

Both native ABIs, Java/Kotlin extensions, and the Android patch DEX are built
from source. The build does not repair a previous release archive or modify
compiled Boolean literals. The final JVM and DEX defaults must both be true;
the in-app connection default remains false.

## Tools and fixed inputs

| Input | Required version |
| --- | --- |
| Gradle | Checked-in wrapper 9.8.2, pinned SHA-256 |
| Gradle JVM | JDK 21 used for maintenance verification; Java target remains 17 |
| Android platform / Build-Tools | 36 / 36.0.0 |
| Go | 1.26.10 |
| Android NDK | r28c, 28.2.13676358 |
| Native minimum API / ABIs | 26 / arm64-v8a, x86_64 |

Install the required SDK packages if absent and review the applicable license
prompts. Set your own `JAVA_HOME`, `ANDROID_HOME`, `WIREGUARD_GO_BIN` (if the
pinned Go is not on PATH), and optionally `ANDROID_NDK_HOME`. No machine-specific
configuration, SDK, signing key or credentials are included in the source ZIP.

```sh
sdkmanager --install 'platforms;android-36' 'build-tools;36.0.0' 'ndk;28.2.13676358'
```

The native script rejects a different Go version, NDK revision or API. It
verifies `go.sum` modules and uses `-mod=readonly`, `-trimpath`, no VCS stamp,
fixed linker flags, and 16 KiB-compatible ELF alignment. Gradle fixes its native
output directory to the exact files it packages, so an inherited comparison
output override cannot cause stale payload selection. No native binaries or Go
implementation vendor tree are required in the Git patch.

The four public build inputs are pinned as follows:

| Directory | Repository | Commit |
| --- | --- | --- |
| morphe-patches-gradle-plugin | MorpheApp/morphe-patches-gradle-plugin | 5b7e4619931a8c78b7858e598e002222d37021b9 |
| morphe-patches-library | MorpheApp/morphe-patches-library | 538d9a6574cbacb4ca66d8b687c44d93b2d8d470 |
| morphe-patcher | MorpheApp/morphe-patcher | d19545e8505e0329cc640723cb8ff91eddd3cd05 |
| ARSCLib | MorpheApp/ARSCLib | 675bed2de397097400ba6f0c808e28005ae5aa53 |

The plugin has one documented optional-auth configuration patch. It omits the
GitHub Maven repository when no actor/token is supplied rather than evaluating
a null fallback. No dummy/private credentials are created. Dependency source
snapshots in the full ZIP already have this patch; do not apply it twice.
Go module versions and checksums remain those of the working v2.1.1 native
engine. See `native/wireguard/go.mod`, `go.sum`, and `licenses/SOURCES.md`.
Maven Central, Google Maven, Plugin Portal, JitPack and the Go module service are
still needed on an uncached machine; this is not an offline build.

## Normal dependency access

When your normal Morphe build environment has the required GitHub Packages
access, use the original Gradle tasks:

```sh
bash gradlew :patches:test :extensions:shared-youtube:library:testDebugUnitTest \
  :extensions:youtube:testDebugUnitTest :extensions:music:testDebugUnitTest \
  :patches:checkStringResources --no-daemon
bash gradlew :patches:verifyWireGuardBundleLoading --no-daemon
```

The loader verification depends on `buildAndroid`, which now builds the native
libraries before resources are packaged. Run this archive task last: the
upstream Android task appends DEX to its JVM archive in place, so a later JVM
archive task can recreate it without DEX. `testDebugUnitTest` is the ordinary AGP
unit-test task; this configuration does not expose a release unit-test task.

## Public source build without GitHub credentials

The full source ZIP contains the main `morphe-wireguard/` directory and the four
pinned public dependencies. Their original LICENSE/NOTICE files are retained.
For a main-project-only checkout, fetch them into a new external directory:

```sh
wireguard_sources=/path/to/new-public-sources
python3 scripts/prepare-wireguard-public-sources.py "$wireguard_sources"
```

The script refuses to replace an existing directory, checks the exact revisions,
and applies the optional-auth patch only to the newly created plugin clone.
When using the full ZIP, skip preparation and set `wireguard_sources` to the
extracted parent that already contains those four snapshots.

From the main project directory in Bash:

```sh
wireguard_gradle=(bash ./gradlew
  --init-script build-support/wireguard-public-sources.init.gradle
  "-Dmorphe.publicSources=$wireguard_sources"
  "-Dmorphe.patchRoot=$PWD" --no-daemon --max-workers=2)

"${wireguard_gradle[@]}" :patches:test \
  :extensions:shared-youtube:library:testDebugUnitTest \
  :extensions:youtube:testDebugUnitTest :extensions:music:testDebugUnitTest \
  :patches:checkStringResources
"${wireguard_gradle[@]}" :patches:verifyWireGuardBundleLoading
```

The explicit canonical patch root prevents an included build from including its
own plugin recursively. Source directory names need not match a machine path.
Keep the supplied dependency snapshot names and do not add a `smali/` sibling;
otherwise upstream may select an unintended local dependency substitution.
The historical `public-sources.init.gradle` remains for old sibling-layout
commands, while the canonical-root init above is preferred for this release.
All local cache/output directories and `.git` metadata are excluded from the
source distribution. Building a ZIP on this host is distinct from independently
rebuilding the extracted ZIP on another machine.

## Final artifact checks

Use actual paths for the bundle and installed Android SDK/NDK:

```sh
wireguard_bundle=patches/build/libs/patches-2.2.0.mpp
python3 -m unittest discover -s scripts/tests -p 'test_*.py'
python3 scripts/verify-wireguard-bundle.py "$wireguard_bundle" \
  --dexdump "$ANDROID_HOME/build-tools/36.0.0/dexdump"
python3 scripts/set-wireguard-defaults.py verify "$wireguard_bundle" \
  --dexdump "$ANDROID_HOME/build-tools/36.0.0/dexdump"

# Native tests use loopback peers and generated keys, not a personal provider.
(cd native/wireguard && "$WIREGUARD_GO_BIN" test -race -count=1 ./...)
(cd native/wireguard && "$WIREGUARD_GO_BIN" vet ./...)
WIREGUARD_JAVA_HOME="$JAVA_HOME" bash scripts/test-wireguard-jni.sh
```

For APK-level patching and Desktop validation, use
`scripts/validate-wireguard-apk.py --help`. It accepts original APKs and records
actual patch/SDK/validation results. A successful APK build/`--validate` does
not establish app launch, profile import, remote handshake, playback, DNS path,
network handoff, or complete app coverage.

[Maintenance validation](wireguard-i18n-2.1.4.md) records the
commands actually executed and their limits. Historical v2.1.0/v2.1.2 reports
remain in `docs/` and do not stand in for this release's checks. For device
checks use [the acceptance checklist](wireguard-device-acceptance.md).
The checksums for the published release are in `RELEASE-SHA256SUMS.txt` in the
custom repository/release. Byte equality across other operating systems or NDK
host packages is not claimed. Do not run the historical artifact `repair`
subcommand to create v2.2.0; all release inputs come from this source build.
