# pixel10pro-camera-patches

[Morphe](https://morphe.software) patches for **Pixel Camera**, built for exactly one device and one app version:

| | |
|---|---|
| Device | **Google Pixel 10 Pro** (`blazer`, Tensor G5) |
| App | Pixel Camera `com.google.android.GoogleCamera` |
| Version | **11.1.040.982810059.19** (versionCode 69703284, APKM) |

The bundle does three things:
- brings the Pixel 11 camera features the Pixel 10 Pro does not ship with (Camera Looks, viewfinder quick-access controls, Creator Suite);
- adds the fixes a re-signed 11.1 build needs to work properly on the Pixel 10 Pro;
- opens captured media in **Google Photos patched with Morphe**.

> It does not work with any other Pixel Camera version. The patches hook obfuscated classes of this exact build. On another version they fail on purpose instead of producing a broken app. They have not been tested on other Pixels.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Camera Looks Backport** | on | Pixel 11 Camera Looks (Sauce/Tomte, including Flat, Buffalo and Dijon) with tone, colour and detail fine-tuning. It also carries the brightness, JPEG quality and noise-reduction hooks the other patches rely on. |
| **Viewfinder Quick Access Controls** | on | Left/right quick-access shortcut slots, brightness/shadow sliders and Looks shortcuts in the viewfinder. Requires Camera Looks. |
| **Pixel Camera Creator Suite** | on | Teleprompter (Biotite), audio VU meter (Mica), social framing guides (Slate). Disables the crashing "Save to a project" button. Requires Camera Looks. |
| **Pixel 10 Photo Saving Fix** | on | Fixes 12MP photos not being saved on Pixel 10/10 Pro (timestamp sync; flare removal and eclipse turned off). |
| **Permanent Portrait Mode Fix** | on | Runs Portrait on TFLite (CPU/GPU): a re-signed build cannot use the EdgeTPU. |
| **Pixel Camera Clone (Non-Root)** | on | Package `com.google.android.GoogleCamera.morphe`, installed next to the system camera. **Required.** **Do not change its `packageName` option**: Camera Looks expects exactly `.morphe`. |
| **Use Morphe Google Photos** | on | The thumbnail opens Morphe-patched Google Photos (`app.morphe.android.apps.photos`), including the secure review from the lock screen. Set the `photosPackageName` option if your package name differs. |
| Use third-party gallery | **off** | Alternative to "Use Morphe Google Photos": opens the system default gallery (any app). **Do not enable both.** |
| Use third-party gallery on lock screen | **off** | See the warning below. |

[CLASSIFICATION.md](CLASSIFICATION.md) has the full list, with the reasons for each inclusion and exclusion. Not included:
- Pro Manual Controls: the 10 Pro already has Pro controls and 50MP;
- 10x Quick Zoom, AV1, 4K60 HDR & Log, Video Lens Switching, Max Display Brightness, Pro Image Quality.

> **Note:** Camera Looks forces a shared feature-flag table that also enables some video options (AV1, HDR, Log). Leaving the video patches out does not remove those options. Details are in CLASSIFICATION.md.

### ⚠️ Third-party gallery on the lock screen

"Use third-party gallery on lock screen" is **off by default** and should stay off. Third-party galleries do not honour Android's "secure review" contract, which says to show only the shots taken during the locked session. With this patch **your whole library may be viewable without unlocking the phone**.

"Use Morphe Google Photos" does not have this problem. On the lock screen the camera uses Photos' secure review action, which shows only the current session's shots.

## Requirements

- A Pixel 10 Pro with **Morphe-patched Google Photos** installed (for example from the Morphe Google Photos bundle, together with its GmsCore/MicroG). The default package is `app.morphe.android.apps.photos`. To check it:
  ```
  adb shell pm list packages photos
  ```
- The official Pixel Camera **11.1.040.982810059.19** APKM.

## Installing with Morphe Manager (recommended)

1. In Morphe Manager, add this repository as a patch source: `https://github.com/matteomorganti/pixel10pro-camera-patches`.
2. Pick Pixel Camera and select the 11.1.040.982810059.19 APKM.
3. Keep this bundle's patches at their defaults (see the table above).
4. Recommended settings for Morphe's universal patches (still to be confirmed on a device):

   | Patch | Recommendation |
   |---|---|
   | Pixel Camera Clone (Non-Root) (this bundle) | **on** |
   | Clone app (official Morphe) | **off**: it would rename the package a second time and break the provider authority Camera Looks expects |
   | Change installer source | **on** (to be confirmed) |
   | Disable Play Store updates | **off** (to be confirmed) |
   | Override certificate pinning | **off** (to be confirmed) |
   | Spoof signature | off |

5. Patch and install. Keep 6-8 GB of free space: the APKM is 1.6 GB and has to be merged, patched and re-signed.

Patching with Morphe Manager signs the camera with the **same key** as your Morphe-patched Photos. That may matter if Photos checks who is calling it (the "processing" preview, Locked Folder).

## Morphe Desktop / CLI

The official CLI now lives at [MorpheApp/morphe-desktop](https://github.com/MorpheApp/morphe-desktop/releases) (tested with v2.3.0).

```
java -jar morphe-desktop-2.3.0-all.jar list-patches --patches=patches-<version>.mpp -p -v -o
```

```
java -jar morphe-desktop-2.3.0-all.jar patch -p patches-<version>.mpp -o PixelCamera-patched.apk PixelCamera_11.1.040.982810059.19.apkm
```

Other options:
- a different Photos package: add `-O photosPackageName=<package>` after `-e "Use Morphe Google Photos"`;
- Morphe's universal patches: also pass `-p https://github.com/MorpheApp/morphe-patches`;
- `-i` installs over adb.

The CLI signs with its own key (`CN=Morphe`), which is not the key Morphe Manager uses.

## What to check on the phone

None of this has been tested on a device yet (see "Not verified" in [COMPATIBILITY.md](COMPATIBILITY.md)). In short:
- the thumbnail opens patched Photos, both unlocked and on the lock screen;
- Looks, Quick Access and Creator Suite work;
- Portrait works and 12MP photos are saved;
- Add Me does not crash.

## Building

Requirements:
- JDK 21;
- Android SDK with `platforms;android-36` and `build-tools;36.0.0` (`sdk.dir` in `local.properties`);
- a GitHub token with `read:packages`: the `app.morphe:*` dependencies are on GitHub Packages, which requires authentication even for public packages.

```
export GITHUB_ACTOR=<user> GITHUB_TOKEN=<token>
./gradlew build
./gradlew :patches:buildAndroid
unzip -l patches/build/libs/patches-*.mpp | grep classes.dex
```

**`:patches:buildAndroid` is required.** Without it the bundle holds only JVM `.class` files and Morphe Manager rejects it ("missing dex entries").

On Windows, if Gradle fails with `Unable to establish loopback connection`, point `TMP`/`TEMP` and `-Djdk.net.unixdomain.tmpdir` at a folder whose path has no 8.3 short names (see WORKLOG.md).

To check the gallery fingerprints against a `base.apk` (extract it from the APKM, which is a zip):

```
python3 -I tools/verify_fingerprints.py base.apk
```

### Releasing

Push a `v*` tag (e.g. `v0.1.0`). The `.github/workflows/release.yml` workflow then:
1. builds with `buildAndroid`;
2. checks that the `.mpp` contains `classes.dex`;
3. publishes the `.mpp` as a release asset;
4. commits the updated `patches-bundle.json` and `patches-list.json` to the default branch.

## License and credits

GPL-3.0. Code comes from [Akshayykadam/Pixel-Camera](https://github.com/Akshayykadam/Pixel-Camera) (GPL-3.0) and [Gamer92000/pixelcamera-patches](https://github.com/Gamer92000/pixelcamera-patches) (GPL-3.0-or-later). See [CREDITS.md](CREDITS.md).

**Notice:** `patches/src/main/resources/PortraitControllers.dex` and `QuickAccessControllers.dex` come from Akshayykadam. They contain **modified Pixel Camera (Google) classes**, not original GPL code.

Unofficial project, not affiliated with Google or Morphe.
