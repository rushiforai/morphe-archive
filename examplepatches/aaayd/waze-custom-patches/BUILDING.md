# Build and release notes

## Nightly releases

GitHub Actions checks APKMirror at **00:00 UTC daily** (01:00 UK summer time).
It compares against all published Waze releases, regardless of patch bundle series.
Only a higher upstream versionCode with no version-number downgrade triggers a
build and release. The same or an older Waze build stops before downloading the
app or setting up the Android build toolchain.
Otherwise it downloads the newest uploaded release's ARM64 package, verifies
Waze's original signing certificate on every split, and attempts all eight patches.

A successful release contains:

- The **untouched original** `.apkm` split package (or `.apk` if upstream supplies one).
- A signed **pre-patched ARM64 APK** with all eight patches.
- An updated **`.mpp` Morphe bundle** with eight separate options targeting that version.
- Patch results, build metadata and SHA-256 checksums.

Original split packages need a split-package installer or Morphe. The patched
APK can be installed directly; Android Auto setup uses the embedded companion
installer and Shizuku. Each nightly uses the same signing key. Builds signed by
Morphe on your phone can use a different key and cannot necessarily be updated by
the downloadable APK. Do not uninstall to switch keys unless you intend to lose
local app data.

A new version is an **attempted port**, not guaranteed compatibility. The native
icon-sizing builder discovers renderer functions, report groups and call sites; bytecode
and theme patches also validate their targets. If Waze changes these, the job
fails, retains diagnostics for 14 days and publishes nothing. It retries on the
next night until fixed. It never silently ships a subset of the eight patches.
CI validates patching, bundle choices, signatures, package metadata and alignment;
it does not perform a phone/emulator runtime test.

The manual **Run workflow** button retries immediately. `force` builds test
artifacts only, even for a new Waze version; it never publishes a release.
Interrupted uploads remain drafts until a later successful upload finishes.
After publishing, the workflow updates `patches-bundle.json` and `CHANGELOG.md`
together. Runs with no new Waze version also check that this source metadata is
current, without rebuilding the APK or bundle. An interrupted metadata update is
therefore repaired on the next run.

## Testing patch updates

Pushes and pull requests run the Python regression suite on Linux and Windows
without signing secrets. These checks cover discovery invariants and release
gates; the full APK and compatibility fixture build remains in the nightly job.
On a failed nightly, download the `waze-build` artifact: it includes verified
input metadata, the main build log, and JSON, text and log diagnostics from
compatibility fixtures. Captured Android tool failures are included in the log.

Bump `BUNDLE_SERIES` in `ci/release_config.py` and update `RELEASE_NOTES` when
changing patches. These changes ship with the next newer Waze build. To test
them sooner, run the workflow with `force` and download its build artifacts.
Changing the patch series does not bypass the Waze version gate or update the
public Morphe source. The publishing step rechecks the gate before any upload.

## Repository setup

The workflow requires these encrypted repository Actions secrets:

| Secret | Value |
| --- | --- |
| `WAZE_KEYSTORE_BASE64` | Base64 of the persistent PKCS12 signing keystore |
| `WAZE_STORE_PASSWORD` | Keystore password |
| `WAZE_KEY_PASSWORD` | Key password; alias is `Morphe` |

Set repository variable `WAZE_RELEASE_CERT_SHA256` to the release certificate hash.
Keep a secure backup of this key: changing it prevents seamless APK updates.
Keys, personal phone captures, browser profiles and downloaded Waze packages are
excluded from Git. The small companion APK is pinned and included alongside its
source in `companion/`.

Enable Actions on the default branch. A private repository may consume GitHub
Actions minutes/storage from your account plan. Scheduled runs can be delayed by
GitHub; source-site availability can also cause a failed check.

## Local build

Requirements: Python 3.11+, JDK 21, Android SDK platform 36 and build-tools 36.0.0.
Set `JAVA_HOME` and `ANDROID_HOME`, and export the two password environment variables.

```sh
python -m pip install -r ci/requirements.txt
python -m unittest discover -s ci/tests -v
python ci/upstream.py check
python ci/upstream.py download
python ci/build.py --keystore /path/to/waze-release.p12
```

Outputs go to `dist/nightly/`. The builder downloads a hash-pinned Morphe Desktop
1.18.0 dependency and uses the checked-in Gradle wrapper. `--input /path/file.apkm`
allows a local original package, but its actual version and certificate must match
`build/upstream.json`. Patch target/version metadata is generated at build time;
source files are not rewritten by the nightly job.

`ci/native_icons.py` and `ci/native_layout.py` locate report tables through resource
string references, bound analysis with the ELF unwind table, and trace constructor
arguments. They verify the vector builder and report counts without requiring
fixed helper instruction bytes. Compact and textured table layouts are supported.
It verifies every report group against `ci/native_icon_catalog.json`, including
original image geometry and pixels. It computes branch targets and either uses
unused executable-segment tail space or appends a separate aligned RX segment
with a mapped program-header table. Original load addresses and permissions stay
unchanged. The output is independently disassembled and its ELF mappings checked.

The nightly build generates an exact-hash profile in `build/generated/native-icons`.
Known regression profiles are in `src/main/resources/themes/native-profiles`.
Morphe only applies a matching profile, checks every original instruction, and
verifies the complete output hash before writing the renderer. Python, Capstone
and ELF analysis run on the build host, not the phone.

`ci/compatibility_fixtures.json` pins older original packages from several compiler
and renderer generations. Their native profiles are generated before packaging
the bundle. Full-support fixtures rebuild all eight patches without forcing
compatibility. The January fixture separately requires seven successful patches
and rejection of its unsupported inlined native layout. Only that diagnostic
build bypasses the version list, after original signatures and hashes are checked;
it is never published as an installable release.
Changed helpers, missing constructor calls, ambiguous matches, incorrect image
geometry and unexpected architectures are rejected. A successful build does not
prove runtime compatibility. The 5.24.0.2 renderer requires the appended-segment
fallback; that path has structural checks but still needs a device test.

`WazeBindings.kt` finds bytecode hooks using string anchors, signatures, call
relationships and field types. Resource preparation/reset, settings rendering,
config getters, mood eligibility and badge rendering do not depend on obfuscated
class or method names. Selected extensions get a verified direct bytecode bridge to the actual
application provider. Settings setters and config identifier reflection literals
are rebound to the APK. Setters may return void or the view; delegated layout
inflation is traced through helper methods. Mood lookup follows the screen call
graph, and beta gates follow the config value across register moves and primitive
or boxed boolean reads. The badge UI is added after superclass screen resume. The native config read supplies the identifier getter; it is not guessed
from an arbitrary integer field. Android lifecycle, XML custom view and JNI API
contracts remain explicit boundaries.
The badge selector resolves artwork and layout controls by resource name, and
patching requires those resources to exist. JVM fixtures change their numeric IDs
between runs to check that the selector does not cache old IDs. Native queue and
login APIs used by reflection are checked before injecting the extensions.

The release build also rewrites the pinned 5.24.5.0 fixture with nine renamed
classes and twenty renamed methods, then applies all eight patches and inspects
the resulting hooks and runtime bindings. A second fixture adds a competing
resource hook and must be rejected. Only these synthetic fixtures bypass the
original certificate check. They are never published or installed. These tests
cover routine obfuscation drift, not arbitrary changes in Waze's behaviour.

Mood catalogue discovery follows the eligibility manager's superclass chain and
validates either the original array-returning JNI pair or the newer protobuf
pair. Small bridges enable hidden entries while preserving the caller's sorting
flag, registers and native results, including calls that share a flag register.
The real-DEX validator checks catalogue discovery and patched bridges alongside
the eligibility gates, with negative, range-call and repeat-application cases.
The pinned 5.28.5.0 fixture covers the inherited protobuf loader.

ELF mapping checks follow the [Android linker loading rules](https://android.googlesource.com/platform/bionic/+/master/linker/linker_phdr.cpp).
The old single-version profile and asset-generation script remain as a regression
reference and are not used to discover new native offsets.

Existing Windows scripts and detailed notes are retained for development:
[themes](THEME-SELECTOR.md), [icon sizing](REPORT-ICON-SIZING.md),
[badges](BADGE-SELECTOR.md), [moods](DRIVER-ICONS.md).
Older scripts may require ignored local analysis fixtures and Android tools;
`ci/build.py` is the self-contained release path.

This is an independent custom-patch project. Waze, Google Maps and Morphe are
third-party products; their names are used to describe compatibility.

The release build verifies all 256 patch-selection dependency combinations, tests
settings row composition in all 65 subsets/orders using JVM view fixtures, and
patches the original package with themes alone, icons alone, Android Auto alone, alert distance alone, camera sound alone
and all eight options. APK checks confirm that unchecked features add no classes,
assets, settings hooks or companion components. These checks do not replace a
physical-device runtime test.

All eight options share a hidden version refresh so changing the selection can
update a previous patched installation and refresh Waze's extracted skins.
It does not enable any unchecked feature.

The alert-distance extension is also exercised against controlled JVM config
API fixtures, including read-back mismatch and rollback. APK validation checks
the getter, native-startup, config-refresh and settings hooks. These checks do
not prove when a real car will display a report.

The camera-sound extension has its own JVM native API fixtures for startup,
config refresh, failed writes, read-back mismatch and unrelated settings.
It writes only the speed-camera-below-limit setting and reads it back directly.
Real camera audio is not exercised by CI.

Theme generation parses balanced Lua tables, requires recognised core colours,
and skips absent optional entries with diagnostics. A present but malformed or
duplicate colour is rejected. The selectable icon manifest contains assets that
actually exist in the target package; unmatched artwork stays original. Semantic
fixtures test register moves, normal/range calls, long instruction separation,
primitive/boxed values, optional palettes and rejection of ambiguous or invalid
inputs. These checks supplement the real APK builds.

Resource completion matching follows synchronous extraction helpers. Icon loading
supports direct asset reads and delegated skin streams. The 2023 fixture expects
seven patches; its inlined native renderer still rejects icon sizing.

Optional icon mismatches produce patch-log warnings and an embedded report shown
by **Icon pack > Icon warnings**. A separate fallback manifest restores stock
artwork, including stale overrides from an earlier installation. Missing badge
artwork hides only that choice. Native groups without an artwork mapping keep
their original calls; missing or ambiguous structural evidence still fails.

Regression APKs remove an icon, resize another, add an unmapped report icon, and
remove the recognised artwork schema. Partial changes must rebuild with explicit
fallbacks; the broken schema must fail. JVM tests also verify stock restoration.
