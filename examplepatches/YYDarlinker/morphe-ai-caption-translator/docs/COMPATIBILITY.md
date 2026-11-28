# Compatibility

Anchored AI Captions v2.0.0 uses Patcher **2.6.0** and requires **Morphe Manager 2.8.0+** or **Morphe Desktop 2.4.0+**. Manager 2.7.x and earlier are unsupported.

| Official companion bundle | Original YouTube APK | Status |
| --- | --- | --- |
| Morphe Patches 2.4.0 | 21.30.216 | Stable baseline |
| Morphe Patches 2.4.0 | 21.47.483 | Experimental |

Desktop 2.4.0 validation includes fingerprint matching, APK rebuilding, all three Morphe settings variants and final DEX audits. The maintainer reports device tests for both targets. Use the original unpatched APK with the matching package, signature and ABI. Both targets require Android API 29 or newer. The broader patch declarations are in [Constants.kt](../patches/src/main/kotlin/app/yydarlinker/patches/shared/Constants.kt).

## Validate a composition

Freeze the add-on MPP with [full verification](DEVELOPMENT.md). For each target, run Desktop CLI `patch --validate --unsigned --save-original=OFF` with separate `-p` arguments for the official MPP and the same frozen add-on MPP, followed by the original APK. Use `-t`, `-o` and `-r` for the run's temporary directory, output APK and JSON report.

Check the rebuilt settings resources for the add-on rows, official Captions page and stable caption blocks. Audit the final APK using `:patches:auditComposition`. The [patch build script](../patches/build.gradle.kts) defines the inputs for that audit and the local `:patches:verifyComposition` harness.
