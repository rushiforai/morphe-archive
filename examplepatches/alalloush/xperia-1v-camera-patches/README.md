# 🧩 Xperia 1 V camera patches

[Morphe](https://morphe.software) patches that run **Sony's current camera app** — the Xperia 1 VI/VII
"Camera" (`jp.co.sony.mc.cameraapp`) — on the **Xperia 1 V** (pdx234) under LineageOS, and fix Sony's
**Photography Pro** (`com.sonymobile.photopro`) on the same ROM. No root required.

Tested: Xperia 1 V (XQ-DQ54), LineageOS 23.2 / Android 16, Camera 1.0.2.A.0.8, Photo Pro 1.7.2.A.0.9.
All lenses (0.7× / 1× / 3.5× / 5.2× variable tele), photo, RAW, bokeh, aspect ratios, video up to 4K 120 fps,
slow motion, hand shutter — working.

## ❓ About

Sony consolidated Photo/Video/Cinema Pro into one Camera app with the 1 VI. It talks to the same Sony camera
HAL family the 1 V ships, but sideloaded on the 1 V it fails in three places, each identified from the
device's own logs and fixed here:

| Problem | Where it comes from | Patch |
|---|---|---|
| **"Memory unavailable"**, shutter disabled (both apps) | The apps probe `Android/data/<pkg>/files/DCIM` via `Context.getExternalFilesDirs()`. LineageOS pdx234's `StorageManagerService.mkdirs` fails to create that dir ("Failed to prepare"), so the framework returns no usable primary volume and the app latches `MEMORY_NO_MEMORY_CARD`. Nothing inside the app can create the dir. | **Storage fallback** — redirects `StorageUtil`'s platform calls to a wrapper that falls back to a directory under the app's internal storage and reports it as the primary volume. Photos still save to `DCIM` through MediaStore. |
| **No viewfinder / camera error** (Camera app) | The 1 V HAL rejects the first capture request (`ILLEGAL_ARGUMENT`). Its `validateCaptureSettings` log names two causes: `objectSelectTriggerArea` is sent with 5 ints (5th = tap frame number, a 1 VI latency-compensation feature) but the 1 V tag holds 4; and `sceneDetectMode` must be accompanied by `conditionDetectMode`, which the 1 VI app never sets. | **Xperia 1 V camera HAL compatibility** — hooks the single choke point `CaptureRequestHolder.setRequest`, truncates the area to 4 ints and adds `conditionDetectMode=1`. |
| `com.sonymobile.cameracommon` "doesn't exist" (Camera app) | Android 11+ package visibility: as system apps on stock they see each other implicitly; sideloaded, the Camera app needs a `<queries>` entry, and nobody declares the Sony permissions it requests. | **Camera common visibility** — adds the `<queries>` entry and declares `CAMERA_STATUS_PROVIDER` / `CAMERA_ADDON`. Optional: cameracommon only provides a camera-status provider and gyro calibration. |

What is *not* a bug: no Telephoto macro / "Close-up shooting" (the 1 V tele lens does not focus that close; the
HAL does not advertise `closeUpModeOpticalZoomRatioRanges`), and Slow motion offering one speed per resolution
(`availableVariableFpsVideoModes` absent). These are correct capability gating on 1 V hardware.

### How to use these patches

1. Add the source in Morphe: https://morphe.software/add-source?github=alalloush/xperia-1v-camera-patches
   (or paste `github.com/alalloush/xperia-1v-camera-patches` under Sources → +).
2. Get the pristine APKs (APKMirror): `jp.co.sony.mc.cameraapp` (newest, minAPI 35) and, if you want it,
   `com.sonymobile.photopro` (1.7.2.A.0.9 is the last release).
3. Patch each app with this source and install. Both apps declare `com.sonymobile.permission.SOMC_CAMERA`, so
   they must share a signer — patching both through Morphe takes care of that. Uninstall any Sony-signed
   copies first (`INSTALL_FAILED_DUPLICATE_PERMISSION` otherwise).
4. Optional: `com.sonymobile.cameracommon` from APKMirror, also run through Morphe so the signer matches.

Newer Camera versions: the same package keeps shipping with the 1 VII/VIII firmware. Re-patch them with this
bundle; the fingerprints target Sony's unobfuscated class names. If a new HAL validation gate appears, the
HAL prints it in logcat as `camera-hal … validateCaptureSettings: Fail …`.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/alalloush/xperia-1v-camera-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 Sony Camera&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.0.2.A.0.8 | 🧪&nbsp;1.0.2.A.0.6 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Camera common visibility](#camera-common-visibility) | Lets the camera app see and use com.sonymobile.cameracommon (camera status provider, gyro calibration) when both are sideloaded: adds the <queries> entry and declares the CAMERA_STATUS_PROVIDER and CAMERA_ADDON permissions. |  |
| [Storage fallback](#storage-fallback) | Fixes "Memory unavailable" on ROMs that cannot create Android/data/<pkg>/files (LineageOS on the Xperia 1 V): the storage probe falls back to the app's internal storage. Photos still go to DCIM through MediaStore. |  |
| [Xperia 1 V camera HAL compatibility](#xperia-1-v-camera-hal-compatibility) | Makes the Xperia 1 VI camera app work on the Xperia 1 V camera HAL: truncates objectSelectTriggerArea to the 4 ints the 1 V HAL defines and sends conditionDetectMode alongside sceneDetectMode, which the 1 V HAL validates together. |  |

</details>

<details open>
<summary>📦 Photography Pro&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.7.2.A.0.9 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Storage fallback](#storage-fallback) | Fixes "Memory unavailable" on ROMs that cannot create Android/data/<pkg>/files (LineageOS on the Xperia 1 V): the storage probe falls back to the app's internal storage. Photos still go to DCIM through MediaStore. |  |

</details>

<!-- PATCHES_END -->

## 🛠️ Building locally

Morphe's Gradle plugin is published on GitHub Packages, which needs a token even for public packages: put
`gpr.user` / `gpr.key` (scope `read:packages`) in `~/.gradle/gradle.properties`, then `./gradlew buildAndroid`
→ `patches/build/libs/patches-*.mpp`. Releases are built by `release.yml` from semantic commits on `main`
(`feat:`/`fix:` release, `chore:` does not).

## 📜 License

GNU General Public License v3.0 — see [LICENSE](LICENSE).
