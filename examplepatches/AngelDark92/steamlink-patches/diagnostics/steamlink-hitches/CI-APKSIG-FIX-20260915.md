# CI compilation fix: missing apksig dependency

Date: 2026-09-15. Reported release: `1.18.0-dev.1`.

Follow-up: the compile fix below exposed a D8 conflict between apksig 8.7.3 and
Morphe's runtime 9.1.1. The current fix aligns both classpaths and gates release
preparation on DEX packaging; see [CI-D8-FIX-20260915.md](CI-D8-FIX-20260915.md).

## Cause and change

`DecoderInputBufferingApkAudit.kt` imports `com.android.apksig.ApkVerifier`, but the Gradle compile classpath had no declared `apksig` dependency. The cached `morphe-desktop-1.13.1-all.jar` contains that API, masking the omission in the standalone local build. CI failed during `:patches:compileKotlin`, before catalog generation; the shell command and Gradle deprecation warnings were not the reported compilation failure.

Added `com.android.tools.build:apksig:8.7.3` to the version catalog and `compileOnly(libs.apksig)` to the patches module. The APK audit runner already supplies it through Morphe Desktop. Keeping it compile-only avoids adding an audit-only signature library to the MPP's bundled dependencies. Production patch behavior, exact compatibility pairs and native payloads are unchanged.

References: [Google artifact metadata](https://dl.google.com/dl/android/maven2/com/android/tools/build/apksig/8.7.3/apksig-8.7.3.pom), [Morphe plugin v1.3.3 dependency packaging](https://github.com/MorpheApp/morphe-patches-gradle-plugin/blob/v1.3.3/src/main/kotlin/app/morphe/patches/gradle/PatchesPlugin.kt), [plugin repository configuration](https://github.com/MorpheApp/morphe-patches-gradle-plugin/blob/v1.3.3/src/main/kotlin/app/morphe/patches/gradle/SettingsPlugin.kt).

## Verification

- Removed all 267 `com/android/apksig/` entries from a temporary copy of the cached desktop JAR. Compiling all 28 production Kotlin files without a replacement reproduced the same 2 unresolved references.
- Added the official Google `apksig-8.7.3.jar` to that classpath: all 28 production Kotlin files compiled successfully. Existing redundant-conversion warnings remain.
- A temporary Gradle 9.6.1 project using the repository's real version catalog resolved `libs.apksig` from Google and confirmed it appears on `compileClasspath` and is absent from `runtimeClasspath`.
- The official library's `ApkVerifier` verified both retained original APKs: `2.0.22/5002322` and `2.0.23/5002363`. This was a read-only signature check, not new APK patching or device validation.
- Official downloaded JAR SHA-256: `c070ed1394629d74641aa0906f60b2ffa1ee77e6366a1f93437f59717b1aeb89`.
- `git diff --check` passed. The normal local Gradle build still stops before compilation because the existing `app.morphe.patches:1.3.3` plugin cannot resolve here. A successful full release workflow has not been claimed; rerun CI after pushing the fix.

## Cleanup

Temporary validation directory: `build/ci-apksig-validation-20260915` (41,224,168 bytes, approximately 39 MiB). Compact compiler/signature logs, dependency metadata and the Gradle harness were copied and hash-verified in `../cleanup-records/2026-09-15-ci-apksig/`. The directory has no tracked files or reparse points.

Cleanup is deferred: automatic approval review rejected deletion of this exact scratch directory, including a separate explicit-path removal after preflight, with only `blocked by policy` as the reason. The scratch directory remains; remove it when the execution policy permits. Original tools, APKs, diagnostic evidence and standard Gradle dependency caches are preserved. No experimental APK/bundle was generated or deployed.
