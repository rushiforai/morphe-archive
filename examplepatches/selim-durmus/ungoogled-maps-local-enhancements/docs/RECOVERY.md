# Recovery and Morphe workflow

## What one repository gives you

The repository contains the complete extension source, pinned upstream source, the original upstream MPP patch bundle, patch selections/options, tests and the build driver. Cloning it preserves all source and patch logic. Building also requires an exact Google Maps APK and your signing key; those are provided by the separate encrypted recovery archive.

The full pipeline is:

1. Verify the stock Maps APK and tool hashes against config/build-lock.json.
2. Verify both bundles against config/morphe-source-lock.json and our bundle's source checksums.
3. Run the preserved Morphe Desktop CLI with the bearinmind release and Tutto Enhancements version locked in config/morphe-source-lock.json (bearinmind 2.10.0 and Tutto 1.7.0), using config/morphe-combined-options.json.
4. Apply 21 upstream patches plus our enhancement patch in FULL bytecode mode. Ad hiding is included; microG is disabled.
5. Align, sign with the same key, and compare the output certificate with the preserved working app.

Morphe Manager is optional: it can now apply the two sources together on Android. Add this repository as the Tutto Enhancements source alongside bearinmind's source. See MORPHE-SOURCE.md. The legacy `--from baseline` path still compiles our helpers from source and uses the older upstream baseline.

## Private recovery archive

The archive is a password-protected 7z with encrypted filenames. Extract it using a compatible 7z tool and the recovery password kept separately. The APK signing password is inside the archive; it is distinct from the recovery archive password.

The recovery-kit directory contains:

- inputs/maps-stock.apk: exact original Google Maps input.
- inputs/maps-baseline.apk: original upstream-patched copy, for the alternative build path.
- inputs/maps-working.apk: last user-confirmed APK, for recovery without rebuilding.
- signing/: original signing material and its password.
- python/ and jdk/: portable Windows x64 Python and JDK.
- sdk/: Android platform/build tools and license metadata.
- tools/: pinned Apktool and Morphe Desktop.
- source/: a source snapshot, full project Git bundle and upstream-history bundle.
- MANIFEST.sha256.json: checksums for all included files except this manifest itself.

If included, personal/ contains a Local saved export. App data is not recovered merely by reinstalling an APK; import that export separately. An archive without a personal export preserves the software and signing identity only.

The full file manifest is inside the encrypted archive, since it includes signing-file hashes. Public build-lock.json records only non-secret inputs and tool hashes.

## Fresh Windows machine

1. Extract the recovery archive to a private folder.
2. Clone this repository, or restore the bundled repository if GitHub is unavailable.
3. From the repository directory, run build-all.ps1 with -RecoveryRoot pointing to recovery-kit. If script execution policy prevents this, invoke recovery-kit/python/python.exe directly with build-all.py and --recovery-root.
4. Read the resulting verification reports. Install with adb install -r only after checking the signing identity and testing the APK.

If Git is unavailable, use source/project/ from the archive: a Git checkout is not needed to build. Portable Python, Java and Android build tools are already included. Building does not download packages or contact upstream. The script never installs an APK automatically.

Keep one backup on separate storage and keep the recovery password in a password manager or another independent safe location. A second copy on the same disk does not protect against losing that disk.

## Offline verification

The optional -VerifyOffline mode uses the preserved JDK 21 with a test-only SecurityManager that denies Java socket permissions. A negative control verifies denial before patching. Every Java child process inherits this guard; each build uses a fresh Morphe tool/cache directory. Native build tools perform local file operations. This is a scoped build test, not an operating-system firewall or an offline mode for the finished Maps app.

The guard and probe are test utilities; neither is packaged into the Android APK. The wrapper itself contains no downloader. The private archive manifest can be checked with verify-recovery.py before building.

## Version and source-build limits

This release targets Maps 26.44.06.1006895251 / 1068856906. Since 1.6.0 the stock build reads `inputs/maps-stock-26.44.06.apk` and `tools/morphe-desktop.jar` must be Morphe Desktop 2.2.0 (needs Java 21); copy both into the recovery kit (hashes in config/build-lock.json). The old 26.36.04 `inputs/maps-stock.apk` is only for tags up to v1.5.1. Our native bindings are also version-gated. A newer Maps APK requires a reviewed port and new tests; Google service availability is outside this backup's control.

Routine stock APK builds use the two archived MPPs. Rebuilding our MPP uses build-bundle.py, the recovery tools, and the official Kotlin compiler 2.4.20 ZIP (one additional, hash-pinned download). This compiler is not in the original v1.2.0 encrypted archive. Recompiling the upstream MPP itself remains a different operation: its Gradle project uses external Gradle/Google/GitHub/JitPack dependencies and may require a GitHub Packages credential. Its full Gradle dependency cache is not part of this recovery kit. The source is preserved for future changes, but an offline rebuild of the upstream MPP from source is not claimed.

The original encrypted archive and its v1.2.0 source snapshot remain unchanged. Use a current repository checkout plus that archive's recovery-kit to build the latest pinned combination. Keep a copy of the updated repository off the PC too; the old archive alone recreates the old release.

To accept a new upstream release, keep the previous tag and archive, update source and MPP together, review the selected options, and rebuild/test on the exact target Maps version.
