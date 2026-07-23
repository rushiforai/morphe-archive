# VocaColle Morphe v1.1 verification

Date: 2026-07-23
Patch version: `1.1.0-dev.2` release candidate (local pre-release build metadata: `1.1.0-dev.1`)
Target: `jp.nicovideo.nicobox` `7.40.0` (`versionCode=177`)

This document records the local release gate used before pushing v1.1 to the
`dev` prerelease branch. The source APK, patched APKs, test keystore, and MPP
build output are deliberately excluded from Git.

## Automated gate

```sh
python3 -m unittest discover -s tools/tests -p 'test_*.py'
./gradlew --no-daemon clean check buildAndroid
```

Result:

- Python catalog/generator tests: 16 passed
- Extension JVM tests: 54 passed, 0 failed, 0 skipped
- Patch JVM tests with the actual APK matrix enabled: 20 passed, 0 failed, 0 skipped
- Android lint: passed with 0 errors
- MPP build: passed

The generated MPP contained seven compatible VocaColle patches for 7.40.0.
The final local pre-push MPP SHA-256 was:

```text
96ebc492c5370494c10fb1f588e87c95a0c20b447863d511784dbf2c10b60b33
```

The hash identifies this local build only. ZIP timestamps and the release
version prepared by semantic-release can change the published artifact hash.

## APK matrix

The full-DEX integration test applied these combinations to a locally supplied
original VocaColle 7.40.0 APK:

```sh
./gradlew :patches:test --rerun-tasks \
  -Dvocacolle.apk=/path/to/vocacolle-7.40.0.apk \
  -Dvocacolle.matrix.output=/tmp/vocacolle-v11-final-matrix
```

The source-only automated gate above intentionally reports this one test as
skipped because the proprietary input APK is not stored in Git. The command in
this section is the required local target-backed gate and ran all patch tests
with zero skipped tests.

- `settings-only`
- `localization-only`
- `full-default`

All three outputs were signed with a disposable test key outside the repository
and passed `apksigner verify` and `zipalign -c -P 16 4`. All retained package
`jp.nicovideo.nicobox`, `versionCode=177`, and `versionName=7.40.0`.

Test-signed matrix SHA-256 values:

```text
1cc0fe80e9511ba33c04e9ba2812a241be4e68473855d5e3cca78c5f4229a73c  full-default-signed.apk
043753af1039847eb8594c96d0023f622d13415b8ada477ecc074c2016237797  localization-only-signed.apk
798559fc31ee48bd29de66e1870d4aaa38812ae21a819b6e4cc1abe69268c6c3  settings-only-signed.apk
```

Additional inspection confirmed:

- string resource configurations include `en` and `ko`
- `formatted="false"` metadata is preserved by the catalog renderer
- `UiLanguageTranslator`, `AppLanguageController`, `MorpheCache`, and
  `MorpheHttpClient` are present in the patched DEX
- the original application `onCreate()` references
  `AppLanguageController.applySavedLanguage(...)`
- production methods reference `UiLanguageTranslator`
- settings-only `AndroidManifest.xml` and `resources.arsc` remain byte-identical
  to the original APK
- the full-default permission set equals the original permission set

## Security and repository scope

- Added-line secret, shell-injection, unsafe deserialization, and debug-log scans
  reported no matches.
- No APK, MPP, keystore, signing material, build output, or Python/Kotlin cache
  is tracked.
- The HTTP foundation is unused by default and therefore introduces no new
  external request in v1.1.

## Device-only acceptance boundary

No APK was installed on a device or Waydroid during this gate. The following
remain device acceptance checks rather than release-blocking automated checks:

- launcher cache refresh
- opening Morphe settings through the visible settings menu
- System/Japanese/English/Korean switching and process-restart persistence
- AppInfo patch-version suffix rendering
- runtime hardcoded/server label appearance
- storage summary and clear-cache interaction
- Back/Up behavior and the original OSS licenses path
