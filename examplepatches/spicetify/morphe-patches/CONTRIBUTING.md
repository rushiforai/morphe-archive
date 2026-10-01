# Contributing

Keep changes focused on Spotify Android customizations. Submit source and
tests without Spotify binaries, account data, signing keys, or access tokens.
Use the existing patches and tests as examples when authoring or porting a
patch.

For settings and server changes, use the
[standalone development app](dev-app/) to test the shared
extension code without rebuilding Spotify or downloading Morphe packages.

## APK analysis skill

The repository includes a pinned [apk-reverse skill](.agents/skills/apk-reverse/SKILL.md)
for APK inspection, DEX comparisons, and repack diagnostics. Codex can discover
it from `.agents/skills` on your next turn. Its source revision is recorded in
[UPSTREAM.json](.agents/skills/apk-reverse/UPSTREAM.json).

Use Python 3.10 or later. This pinned version's doctor uses
`sys.stdlib_module_names`, which is unavailable in Python 3.9 despite the
upstream compatibility claim. Check the tools from the repository root with
your compatible interpreter, for example:

```sh
python3.11 .agents/skills/apk-reverse/scripts/doctor.py --json
```

For a connected device, add `--device YOUR_DEVICE_SERIAL` to select it
explicitly. The doctor reads device state when ADB is available. If your
tools are outside `PATH`, set `APKREV_TOOLS` to their directories, separated
by `:` on macOS and Linux or `;` on Windows. Exit code 3 means an optional
capability lacks a dependency; read the report for the specific capability.

Use this skill alongside the Morphe workflow below. Production patches remain
Morphe source, and the repository's artifact and device checks still apply.
Keep APKs, signing material, and device reports outside the tracked files.

## Build and test

Use Java 21 and an Android SDK. Set `JAVA_HOME` and `ANDROID_HOME` to their
installation directories. The Gradle wrapper selects the Gradle version.

Morphe dependencies use GitHub Packages. Authenticate GitHub CLI with
`read:packages`, then expose credentials only for the build process:

```sh
gh auth refresh -h github.com -s read:packages
GITHUB_ACTOR="$(gh api user --jq .login)" \
GITHUB_TOKEN="$(gh auth token)" \
./gradlew :extensions:extension:testDebugUnitTest :patches:test buildAndroid
```

The bundle is `patches/build/libs/patches-*.mpp`. You can also supply `gpr.user`
and `gpr.key` in your user-level `~/.gradle/gradle.properties`. Never put
credentials in this repository's `gradle.properties`.

Run `buildAndroid` after the last separate Gradle test or build invocation
before copying a bundle to Manager. A later `:patches:jar` task can replace
the `.mpp` with a JVM archive that Desktop loads but Manager cannot use.
The artifact verifier rejects bundles without the root `classes.dex` entry.

## Verify a patch

Unit tests cover URL cleanup and resource editing. They do not prove that a
Spotify build still uses the patched method or resources.

The normal Gradle test command also runs synthetic DEX verifier checks.
After applying a bundle with Morphe Desktop, inspect the signed output:

```sh
python3 scripts/verify-artifact.py \
  --stock /path/to/stock-base.apk \
  --patched /path/to/patched.apk \
  --bundle /path/to/patches.mpp \
  --desktop /path/to/morphe-desktop-all.jar \
  --aapt2 "$ANDROID_HOME/build-tools/36.0.0/aapt2" \
  --apksigner "$ANDROID_HOME/build-tools/36.0.0/apksigner" \
  --sharing \
  --theme
```

Use your installed build-tools version in those paths. Run with Java 21 on
`PATH`, or supply `--java "$JAVA_HOME/bin/java"`. Omit `--sharing` when that
patch is disabled. Omit `--theme` when that patch is disabled. Theme colors
are chosen at runtime, so the checker requires every color resource to match
the stock APK. It also checks that each pinned Encore palette class remaps
every stock theme constant it loads. It verifies color values and IDs, equivalent relocated XML
selectors, the local builder hook, both final URL hooks, the preference-aware
wrapper, the private settings Activity, unchanged permissions, and the APK
signature. It also compares all four installed settings bridge classes with
the exact bundle used for patching, including their code and class metadata.
This catches missing or replaced menu code that still has valid references.
Verify the bundle's release checksum and provenance separately; matching an
untrusted bundle does not establish that its code is correct.
It does not execute Spotify or cover every resource configuration.

For builds with optional features, add `--home-pins` and/or
`--server-files` to match the selected patches. The checker validates their
capability flags and the server provider's private manifest declaration.
Add `--hide-premium-tab` for the navigation patch. Its checker verifies the
original flag consumer, argument and result register, following conditional
branch, installed capability, and compiled helper logic that preserves the
original flag while negating the hide preference. Synthetic DEX tests reject
misplaced or missing hooks, mismatched capabilities, and altered helper logic.
The four-argument Java settings checker remains available for `dev.3` APKs;
the Python checker expects capability methods for the selected features.

Add `--hide-brand-ads` for **Hide Home and Browse ads**. Its checker verifies
all three list consumers, getter placement, registers, and the native iterator
calls. It also compares the native section/list model classes with the stock
APK and the compiled filter with the selected bundle. Model drift must stop
patching; `verify-failures.py --case changed-brand-ad-model` checks that refusal
without modifying your stock APK. Runtime removal still needs a visible ad
and an on/off comparison on a Free account.

Check refusal paths against the same stock base APK and bundle:

```sh
python3 scripts/verify-failures.py \
  --stock /path/to/stock-base.apk \
  --bundle /path/to/patches.mpp \
  --desktop /path/to/morphe-desktop-all.jar
```

This command creates temporary APK copies with changed settings code, a
missing sharing fingerprint, a changed server response field, or a renamed
theme resource. Each case must report the expected patch failure, exit
with status 1, and produce no output APK. Temporary copies are deleted
afterward. The strict settings snapshot also detects the sharing-marker
mutation because an inspected obfuscated class contains that literal. These
controlled changes test refusal paths, not compatibility with another Spotify release.
The command never installs an app. Use Java 21 on `PATH` or pass `--java`.

For a combined settings build, also exercise the settings verifier's mutation
cases against your private APK:

```sh
./gradlew :patches:testSettingsArtifactVerifier -PsettingsApk=/path/to/patched.apk
```

Use an APK built from the current checkout's bridge. These tests remove or
miswire startup, menu, capability, analytics, Activity, and bridge instructions
in memory, including empty menu and navigation implementations. The stock
and patched APKs stay unchanged. CI cannot
run these cases without a privately supplied Spotify fixture.

Record the stock APK's version, version code, ABI, SHA-256, Android version,
and Morphe version. Apply each patch separately and together, inspect the
output, and test the affected behavior on Android. Record missing runtime
checks in your pull request description.

Keep compatibility targets experimental until the normal Manager source-add,
patch, installation, and update flows pass. Test sharing with tracks, albums,
playlists, and episodes, including timestamp links. Check theme colors in
Home, library, player, settings, and dialogs. Pin and unpin Home shortcuts,
restart Spotify, and confirm the shortcuts still open their targets. For
server files, scan an HTTPS WebDAV folder, enable **Local audio files**, play
and seek a track, interrupt a scan, and confirm recovery after restarting.
Confirm login, playback, queue, Connect, background playback, and
notifications still work. Check that unsupported inputs and invalid options
fail clearly without producing an APK. Test source updates, same-key
reinstall, cancellation, and recovery to stock Spotify. Confirm a push starts
CI and prerelease automation for the expected commit. Record the exact device,
build, and results in the pull request before enabling a stable release.

When importing code, record its source revision, license, retained notices,
and local changes in [third-party sources](THIRD_PARTY_NOTICES.md).

## Repeat a device check

After verifying an APK with `verify-artifact.py`, use the device checker to
compare or install that exact signed APK. Export Manager-built APKs first.
Use Python 3.9 or later, Java 21, Android build tools, and an unlocked device
with USB debugging authorized. Supply the device serial explicitly:

```sh
python3 scripts/device-check.py \
  --serial YOUR_DEVICE_SERIAL \
  --apk /path/to/verified.apk \
  --sha256 VERIFIED_APK_SHA256 \
  --aapt2 "$ANDROID_HOME/build-tools/36.0.0/aapt2" \
  --apksigner "$ANDROID_HOME/build-tools/36.0.0/apksigner" \
  --adb "$ANDROID_HOME/platform-tools/adb" \
  --report /tmp/morphe-device-check.json
```

The default command checks the candidate's digest, package, version, and
signature, then compares it with the installed Spotify APK. It does not
install anything. It requires an existing single-APK installation with the
same signing certificate. Split installations and certificate mismatches
stop the command without uninstalling Spotify or clearing its data.

Add `--install` to update Spotify with `adb install -r`. If the exact APK is
already installed, the command skips installation. Afterward it compares the
installed bytes with the candidate. Android may require confirmation on the
device. No signing key is read or exported. On failure, inspect the report
and device before retrying; the command does not roll back automatically.

Add `--album-id 1oLxSFO8bJwsU2OmZY4cdU` to open a public album and record a
fresh UI observation. This requires the candidate to be installed. The report
contains hashes, timings, and an error classification without raw UI text or
account information. `status: passed` means the checking procedure completed;
read `albumObservation` separately. Visible Spotify UI never proves audible
playback, and `playbackVerified` remains false. The English error classifier
does not recognize translated messages or errors that arrive after its sample.

Run the command's safeguards without a device:

```sh
python3 scripts/test-device-check.py
```

This shortcut accelerates repeated comparisons. It does not replace artifact
verification, a normal Manager installation pass, or listening to playback.

## Release

The repository retains the official template's semantic-release workflow.
Work targets `dev`; `feat:` and `fix:` commits produce prereleases there.
The README's explicit `refs/heads/dev` source URL always follows prereleases;
enable **Experimental app versions** separately to show the initial Spotify
target. Sources configured through a regular repository URL also need their
prerelease setting enabled once a stable feed exists. Merge `dev` into `main`
without squashing only when the stable verification pass is complete.

Stable release automation is disabled unless the repository variable
`STABLE_RELEASE_ENABLED` is `true`. Enable it only after recording the
required runtime evidence. Tests run before release preparation.

Check that the push starts a workflow for the expected commit. If no run
appears, investigate the trigger and use **Actions > Release > Run workflow**
with branch **dev** for an explicit experimental build. A manual run proves
the build and release jobs, not the automatic push trigger.

Let automation generate `patches-list.json`, `patches-bundle.json`, and the
changelog. Do not manually create releases or upload bundles. Preserve
release commits and tags so semantic-release can calculate later versions.
