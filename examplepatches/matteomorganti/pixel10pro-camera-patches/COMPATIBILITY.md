# Compatibility

| Item | Value |
|---|---|
| App | Pixel Camera, `com.google.android.GoogleCamera` |
| Supported version | **11.1.040.982810059.19** |
| versionCode | 69703284 |
| Format | APKM: base.apk plus 32 feature/asset splits. All DEX code is in base.apk. |
| minSdk / targetSdk | 37 / 37 (read from the base.apk manifest) |
| Original signature (SHA-256) | `f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83`, the same for every split (`tools/apksigcert.py`) |
| Target device | Pixel 10 Pro (`blazer`, Tensor G5) |
| Target Photos | `app.morphe.android.apps.photos` 7.98.0.1001971222 (read from the phone over adb) |

## Verified on 2026-11-25

- `tools/verify_fingerprints.py` on the 11.1 base.apk: **PASS**. Each gallery fingerprint has exactly one match, and the register preconditions hold.
- Static check: every obfuscated class and method referenced by the ported patches exists in 11.1. The classes replaced by `PortraitControllers.dex` and `QuickAccessControllers.dex` have exactly the same methods as the 11.1 originals.
- `./gradlew build` and `./gradlew :patches:buildAndroid` succeed. Toolchain: `app.morphe.patches` plugin 1.3.4, `morphe-patcher` 1.8.0, Gradle 9.6.1, JDK 21.
- Full run with Morphe Desktop/CLI **v2.3.0** on the APKM: all default patches **applied** (Camera Looks Backport, Viewfinder Quick Access Controls, Pixel Camera Creator Suite, Pixel 10 Photo Saving Fix, Permanent Portrait Mode Fix, Pixel Camera Clone, Use Morphe Google Photos).
- A second run with "Use third-party gallery" and "… on lock screen" enabled also applied cleanly.
- Output APK: package `com.google.android.GoogleCamera.morphe`, `<queries>` points to patched Photos, and the Photos strings and actions are rewritten (see WORKLOG.md, Phase 5).

## Not verified (needs the phone)

- Installing and launching on the Pixel 10 Pro.
- Thumbnail → patched Photos, both unlocked and from the lock screen.
- Photos integrations that may check the camera's package or signature: the "processing" preview (CameraAssistantService), Pact, saving to Locked Folder.
- Camera Looks (preview and saved photo), Quick Access, Creator Suite.
- Portrait (front and rear), 12MP and 50MP photos, HDR video.
- Add Me in the renamed build: does it crash? Gamer92000's "Run Add Me without the EdgeTPU" patch is not included.
- `TomteInitHelper` native features (grain, front backlight): `libpropatcher.so` is not shipped in the bundle, so they stay inactive without crashing.
