# Building from source

You only need this to work on the patch. To use it, install the released `.mpp` with Morphe instead.

The instructions assume Linux x86-64 with Python 3.12+.

## Layout

| Path | Contents |
| --- | --- |
| `patches/` | Kotlin Morphe patch (resource and bytecode hooks) |
| `extensions/telegram/` | Java runtime code injected into BitChord |
| `vendor/tdlib-api/` | TDLib Java bindings matching the bundled native libraries |
| `compile-only/` | Stubs of BitChord/AndroidX classes, used only for compiling |
| `tests/`, `ui-tests/` | Host tests and Robolectric tests |
| `checks/` | Inspectors that run against patched APKs |
| `tools/` | Release and Morphe source helpers |

The native TDLib, OpenSSL and libc++ libraries are prebuilt binaries from [TGX-Android/tdlib](https://github.com/TGX-Android/tdlib). They aren't compiled here. Their hashes are pinned in `PROVENANCE.json`.

## Build and test

The simplest way to get the dependencies is from a released `.mpp`:

```bash
python3 tools/bootstrap_from_release.py --bundle bitchord-patches-<version>.mpp --download-tools
python3 build.py
python3 test.py
```

This puts the tools in `.deps/tools` and the native libraries in `.deps/tdlib`. The build output goes to `build/bitchord-patches-<version>.mpp`.

You can also run `python3 bootstrap.py` to download everything (JDK, Kotlin, Android platform, NDK, R8, Morphe Desktop and TDLib) from upstream. If you already have them, set `MORPHE_TOOLS` and `TDLIB_ANDROID` instead.

## Code style

CI checks formatting. Before committing, run:

```bash
java -jar google-java-format-1.24.0-all-deps.jar --aosp --replace $(git ls-files '*.java' | grep -v '^vendor/')
java -jar ktfmt-0.53-jar-with-dependencies.jar --kotlinlang-style $(git ls-files '*.kt')
black $(git ls-files '*.py')
```

## Android framework tests

These tests need JDK 21 and Maven 3.9+ on `PATH`. Maven downloads about 2 GB of dependencies.

```bash
python3 ui-tests/run.py
```

## Checking patched APKs

Put the three original BitChord 1.8.1 APKs listed in `PROVENANCE.json` in a directory, then run:

```bash
ORIGINAL_APKS_DIR=/path/to/apks python3 validate_apks.py
```

The script patches each ABI, then checks the hooks, signatures, DEX control flow and native libraries. It needs `readelf`.

The hooks target the R8-optimized 1.8.1 bytecode, so small changes can break merged coroutine branches. Run this script after changing anything in `TelegramPatch.kt`.

## New BitChord versions

The hooks are tied to the compiled code of one BitChord version, so each new version needs checking and usually some hooks updated.

The **BitChord compatibility** workflow (`.github/workflows/bitchord-watch.yml`) does the checking. Every day it looks for BitChord versions newer than `app_version` in `PROVENANCE.json`:

- a published release is tested from its APKs;
- an unreleased `vX.Y.Z` branch (BitChord develops each version on one) is built from its latest commit with `assembleProdRelease`, the same task BitChord's own release workflow runs.

Branch results only mean something if a source build compiles to the same code as BitChord's official release. To check that, run the workflow by hand with **calibrate** ticked: it builds the supported version from its tag and compares it class by class with the official APKs (`checks/CompareDex.java`). The run summary says whether every class the patch hooks is identical. Run it again whenever BitChord changes its build setup.

Each build is patched with Morphe's version check turned off, then run through `VerifyDexControlFlow` and `VerifyApk`. The result goes to one issue per version, labelled `bitchord-compat`: it's opened on the first result and commented on when the result changes. A failure names the hook that no longer matches (the `TelegramPatch.kt` line). A build that was already tested isn't tested again unless you run the workflow by hand with **force**.

To try a BitChord APK yourself:

```bash
python3 tools/check_bitchord.py --label v1.8.2 --out build/compat path/to/BitChord-*.apk
```

When a version passes and works on a phone, set `app_version`, the original APK entries in `PROVENANCE.json` and the patch's compatible versions to the new release, then follow the steps below.

## Releasing

1. Bump `patch_bundle_version` in `PROVENANCE.json` (the build scripts read it from there), update `CHANGELOG.md`, then build.
2. Record the new MPP hash in `PROVENANCE.json` (`patch_bundle_sha256`).
3. Regenerate the Morphe source metadata:

   ```bash
   python3 tools/prepare_mobile_source.py --bundle ../release-assets/bitchord-patches-<version>.mpp
   python3 tools/check_release.py --assets ../release-assets
   ```

4. Commit `patches-bundle.json` and `patches-list.json`. Attach the `.mpp`, both JSON files and `SHA256SUMS` to a GitHub release with the matching tag.

Morphe reads `patches-bundle.json` from `main`, and from `dev` when **Pre-release patches** is enabled.
