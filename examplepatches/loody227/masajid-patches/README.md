# Masajid Patches (custom Morphe bundle)

Custom Morphe patch bundle for `sa.gov.moia.beneficiaryapp` («مساجد Masajid»), built
**locally without the Morphe GitHub Packages registry** (no `read:packages` token needed).

## Patches

| Patch | What it does |
|---|---|
| **Bypass PairIP license check** | No-ops `LicenseClient.initializeLicenseCheck` / `checkLicense` / `connectToLicensingService` / `processResponse` / `startPaywallActivity`, returns `true` from `performLocalInstallerCheck`, and disables `ResponseValidator.validateResponse`. Without this a re-signed build is rejected. |
| **Bypass root / bootloader detection** | Forces boolean checks to `false`: every `Z` method in `MainActivity`, in any class carrying a root indicator string (`/system/bin/su`, `/sbin/.magisk`, `ro.boot.verifiedbootstate`, `ro.boot.flash.locked`, `persist.magisk.zygisk`, `com.topjohnwu.magisk`, `lsposed`, `magiskd`, `which su`), and the obfuscated detectors `La6/b;`, `Ly2/b;`, `Ly2/c;`. |
| **Bypass mock-location detection** | Renames the feature keys `is_mocked` → `is_mocked_disabled`, `isMock` → `isMock_disabled`, and the op `android:mock_location` → `android:mock_location_disabled`, so the Dart lookups miss and the AppOps probe fails; also forces the boolean detector classes to `false`. |

Compatibility: `sa.gov.moia.beneficiaryapp` **1.0.1** (versionCode `ARM64_V8A=29`).

## How the local build works (no registry)

Morphe's own tooling (`app.morphe.patches` Gradle plugin + `morphe-patches-library`) is only
published on GitHub Packages and needs a `read:packages` token. That is avoided entirely:

1. `morphe-patcher` itself pulls **no Morphe artifact** — its dependencies come from Maven
   Central, Google, and JitPack, so it builds offline of the registry.
2. It is built and published to the **local Maven repo**, then this project compiles against it
   with a plain `kotlin("jvm")` plugin.
3. The bundle is a **JAR** (the `.mpp` format): our patch classes + a `META-INF/MANIFEST.MF`
   carrying `Version` and `Patcher-Version`, which is what `loadPatchesFromJar` reads.

## Build

```bash
# one-time: build the patcher into ~/.m2 (signing disabled)
cd ../morphe-patcher
./gradlew publishToMavenLocal -x test --no-daemon -PskipSigning=true   # produces app.morphe:morphe-patcher:1.14.0

cd ../masajid-bundle
./gradlew buildBundle --no-daemon
# -> build/libs/masajid-patches-1.0.0.mpp
```

> `morphe-patcher/build.gradle.kts` was edited so the `signing { }` block is skipped with
> `-PskipSigning=true` (there is no GPG key and no registry to publish to).

## Use

```bash
cd ..
java -jar tools/morphe-desktop-1.16.0-all.jar patch \
  --patches=masajid-bundle/build/libs/masajid-patches-1.0.0.mpp \
  --keystore work/patch.keystore --keystore-password android \
  --keystore-entry-alias patch --keystore-entry-password android \
  --striplibs arm64-v8a --continue-on-error \
  -o work/patched-from-bundle.apk work/merged.apk
```

Output is signed with `work/patch.keystore` (`CN=Morphe Patch`), the **same key** the app is
already installed with, so it updates in place:

```bash
adb install -r work/patched-from-bundle.apk
```

The same `.mpp` can be added as a source in Morphe Manager (Local source) or Morphe Desktop
(Expert → patch source → Local patch file).

## Verify the bundle

```bash
java -jar tools/morphe-desktop-1.16.0-all.jar \
  list-patches --patches=masajid-bundle/build/libs/masajid-patches-1.0.0.mpp \
  --with-packages --with-versions
```

## Re-patch after an app update

1. Bump `AppTarget(version = "…")` in `src/main/kotlin/app/masajid/patches/shared/Constants.kt`
   (add `versionCodes` if the architecture versionCode changes).
2. If an obfuscated detector class was renamed, update `OBFUSCATED_DETECTORS` in
   `security/BypassRootDetectionPatch.kt` and the class list in
   `security/BypassMockLocationPatch.kt`. The string-based parts (`is_mocked`, `isMock`,
   `android:mock_location`, root indicators) survive renames on their own.
3. `./gradlew buildBundle` and patch again.

## Layout

```
src/main/kotlin/app/masajid/patches/
  shared/Constants.kt              # Compatibility (package, version, ABI)
  shared/PatcherUtils.kt           # clearBody / growRegisters / returnFalse / renameStringLiteral
  pairip/BypassPairIpPatch.kt
  security/BypassRootDetectionPatch.kt
  security/BypassMockLocationPatch.kt
```
