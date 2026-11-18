# v2.1.2 Android default-selection correction

v2.1.2 (2026-11-08) corrects default patch selection in the Android bundle.
It is a standard release, not a pre-release.

## Cause

The published v2.1.1 bundle has `default=true` in both JVM `WireGuardPatchKt.class`
initializers and in `patches-list.json`. Its Android `classes.dex` still passes
`false` to `PatchKt.patch` for both apps. The previous updater changed only the
JVM classes and manifest. Morphe Manager
[loads Android patches from DEX](https://github.com/MorpheApp/morphe-manager/blob/main/app/src/main/java/app/morphe/manager/patcher/patch/PatchBundle.kt),
so the JVM-only check missed the setting actually used on Android.

## Correction and verification

`scripts/set-wireguard-defaults.py` now accepts only the exact released v2.1.1
bundle, SHA-256
`9905a6a9a57d281532c94a9b53215a5414ccc4185b880031c0f67d0361fd69ca`.
It identifies each initializer's Boolean argument using Android SDK `dexdump`,
changes `const/4 v3, 0` to `const/4 v3, 1`, and updates DEX SHA-1 and Adler32.
The manifest version becomes `2.1.2`.

The release bundle passed these checks:

- Both JVM initializers pass `true`, checked with JDK `javap`.
- Both Android initializers pass `true` to `PatchKt.patch`, checked with SDK
  `dexdump`; the published v2.1.1 fails this same default-selection check.
- DEX SHA-1, Adler32, SDK checksum verification and ZIP CRC checks pass.
- DEX instruction changes are exactly Music byte `0x098aa3` and YouTube byte
  `0x13a90b`, both `03 → 13`. All other DEX changes are header hashes.
- Only `classes.dex` and `META-INF/MANIFEST.MF` differ between the bundles.
  JVM classes, native libraries, extension DEX, resources, dependency payloads
  and archive member names/order are unchanged.
- The review patch and corresponding source use `default=true` for both apps,
  with matching Kotlin metadata assertions and JVM loader assertions.

Bundle SHA-256:
`179132ea77ee7ce8f5afc3c595f0aff2edf9ff19362ba4d40e3396c4cbe0864f`.

This is a narrowly scoped artifact repair, not a full Gradle rebuild or an
Android runtime test. No new APK application, playback, handshake or leak test
was run. The maintainer's successful v2.1.1 device use remains the existing
functional evidence; it did not verify default patch selection.

## Reproduce

With Python 3, a JDK providing `javap`, Android SDK Build-Tools 36.0.0, and the
published v2.1.1 bundle downloaded as `published-v2.1.1.mpp`:

```sh
python3 scripts/set-wireguard-defaults.py repair \
  published-v2.1.1.mpp morphe-wireguard-youtube-music-preview-2.1.2.mpp \
  --dexdump "$ANDROID_SDK_ROOT/build-tools/36.0.0/dexdump" \
  --timestamp-ms 1794114000000

python3 scripts/set-wireguard-defaults.py verify \
  morphe-wireguard-youtube-music-preview-2.1.2.mpp \
  --dexdump "$ANDROID_SDK_ROOT/build-tools/36.0.0/dexdump"
```

The updater refuses unknown input hashes and existing output paths. Run the
`verify` command after future full builds as well; source/JVM assertions alone
do not establish the Android default.

## Updating Morphe

The standard v2.1.2 release includes the bundle, corresponding source and
SHA-256 checksums. The repository's `patches-bundle.json` and `patches-list.json`
select v2.1.2 after the release assets are available. The custom source reads
`main/patches-bundle.json`; a GitHub release alone does not change the source's
download URL or version.
[Source update implementation](https://github.com/MorpheApp/morphe-manager/blob/main/app/src/main/java/app/morphe/manager/domain/bundles/RemotePatchBundle.kt).

After the source update, normal mode includes each app's WireGuard patch by
default. Expert mode preserves previously saved selections; choose
**Selections → Recommended patches** (**선택 항목 → 추천 패치**) once if needed.
[Selection implementation](https://github.com/MorpheApp/morphe-manager/blob/main/app/src/main/java/app/morphe/manager/ui/viewmodel/PatchFlow.kt).

Patch inclusion does not enable traffic tunneling. `WIREGUARD_ENABLED` remains
`false` until a profile is imported and the in-app switch is enabled.
