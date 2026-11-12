<p align="center"><img src="patches-bundle.png" alt="Short Enigma Patches logo" width="160"/></p>

# Expert RAW Patches

Patches for **Samsung Expert RAW** that add a **Disable post-processing** switch: each shot is captured as **one frame** instead of a multi-frame burst. There's no multi-frame merge or HDR stacking for the RAW (DNG) or the JPEG, and the photo is saved right away (~3 s) without the "Refining image" notification.

Two ways to apply it:

| | What it is | Status |
|---|---|---|
| **[Morphe patches](#morphe-patches)** | Patch bundle (`.mpp`) for Morphe Manager / Morphe CLI | Tested on a Galaxy S23 |
| **[Standalone patcher](standalone-patcher/)** | `python3 patch.py ExpertRAW.apk` — no Morphe needed | Tested on a Galaxy S23 |

This repository is a fork of [Morphe Patches](https://github.com/MorpheApp/morphe-patches), trimmed to the core Morphe code plus the Expert RAW patches. YouTube, YouTube Music and Reddit patches were removed (see [NOTICE](NOTICE)). **It ships no Samsung code.** You supply your own copy of the app.

## Supported

| App | Version | Package | Tested device |
|---|---|---|---|
| Samsung Expert RAW | 6.0.02.8 (arm64) | `com.samsung.android.app.galaxyraw` | Galaxy S23 (SM-S911B), stock firmware, locked bootloader, no root |

Other versions are rejected. Each patch checks the code it modifies and stops instead of producing a broken APK.

## What you get

- **Settings → Pictures → Disable post-processing**, just above Labs. Toggling the switch prompts to restart the app immediately with a matching confirmation dialog.
- **Switch on:**
  - single-frame capture in 12 MP, 24 MP and 50 MP modes (`dsCondition 0xAA0001` instead of `0xAA000B`)
  - processed and saved immediately, with no deferred processing and no "Refining image" notification
  - the camera thumbnail updates and opens the photo in Gallery
- **Switch off and Lab modes** (ND filter, Astrophoto, Multiple exposure…): stock behaviour.

Samsung's native library still turns the single frame into the DNG and the JPEG (demosaic, tone mapping, possibly single-frame noise reduction). What the switch removes is the multi-frame stacking. How long that takes depends on the scene: ~3 s in good light, ~9 s in low light, where the library picks its AI low-light mode (`MODE_GRAW_AI_ISP_LOWLIGHT_WIDE`).

## What you lose

The Galaxy Store build is signed with Samsung's platform key, which grants it about 50 system permissions. A patched, re-signed APK can't get those. The **Samsung signature compatibility** patch works around each one, but these don't survive:

- Gallery's "Processing…" placeholder (photos appear once finished)
- camera cutout setting, call-state handling (Not sure)
- Galaxy Store updates

## Morphe patches

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/ShortEnigma0/expertraw-morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Expert RAW&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 6.0.02.8 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable post-processing](#disable-post-processing) | Adds Settings > Pictures > "Disable post-processing". When on, each shot is a single frame instead of a multi-frame burst (no multi-frame merge or HDR stacking for RAW and JPEG), saved right away without the "Refining image" notification. Lab modes are unchanged. |  |
| [Samsung signature compatibility](#samsung-signature-compatibility) | Lets a re-signed Expert RAW run on a stock Galaxy: calls that need Samsung's platform signature are made safe, private storage under /data/sec is moved to app storage and Samsung's private media provider is emulated with MediaStore. Voice shutter and volume-key shutter stop working. |  |

</details>

<!-- PATCHES_END -->

Build the bundle (details and the no-token setup in [EXPERTRAW.md](EXPERTRAW.md)):

```bash
GITHUB_ACTOR=local GITHUB_TOKEN=unused ./gradlew :patches:buildAndroid   # -> patches/build/libs/patches-<version>.mpp
```

Then apply it to the Expert RAW 6.0.02.8 APK with Morphe Manager, or with the Morphe CLI ([morphe-desktop](https://github.com/MorpheApp/morphe-desktop/releases)):

```bash
java -jar morphe-desktop-2.1.1-all.jar patch -p patches-2.1.0.mpp \
  -e "Disable post-processing" -e "Samsung signature compatibility" --exclusive \
  -o ExpertRAW-patched.apk ExpertRAW-6.0.02.8.apk
```

## Install

Signatures differ from the Store version, so it has to be removed first. That also removes its settings:

```bash
adb uninstall com.samsung.android.app.galaxyraw
adb install -r --user 0 patched.apk
```

*(You can also install the APK directly on your phone using Morphe Manager or a file manager).*

1. Open Expert RAW and grant the requested permissions (Camera, Microphone, etc.).
2. The app will prompt to grant **"Allow access to manage all files"** (required to save DNG and JPEG files directly to `DCIM/Expert RAW/`). Toggle it **ON** and press **Back** (no ADB command required).
3. Turn on **Settings → Pictures → Disable post-processing** and tap **Restart** on the confirmation dialog.

Photos are saved to `DCIM/Expert RAW/`. To check it's working:

```bash
adb logcat -s GrawMod
# post-processing bypass ON: forcing single-frame capture (no multi-frame merge)
```

## How it works

- **Single frame:** hooks `ExpertRawPhotoMaker.isSingleFrameCondition()` (12/24 MP) and `ArcHighResExpertRawPhotoMaker.updateEvList(Z)` (50 MP). This turns on Samsung's own single-frame path, normally used only for manual exposures over 250 ms.
- **Immediate save:** `PostProcessThread.waitRequest()` processes 1-frame requests now instead of waiting for the camera to go to background, and the progress notification is suppressed for them.
- **Re-signed compatibility:** every `ContentResolver` call and the signature-guarded framework calls in the app are routed through safe wrappers (`SafeCR`, `SafeSys`). `secmedia` queries are answered from MediaStore.
- **Thumbnail:** refreshed after MediaScanner indexes the saved file, and Gallery is opened with a standard `content://media` URI.

Sources: [`patches/.../expertraw`](patches/src/main/kotlin/app/morphe/patches/expertraw) (Kotlin patches) and [`extensions/expertraw`](extensions/expertraw) (Java extension).

## License

[GNU General Public License v3.0](LICENSE), with the additional Section 7 terms inherited from Morphe Patches. See [NOTICE](NOTICE), which must be kept with any copy or derivative.

- The Morphe framework code is © the Morphe project.
- The Expert RAW patches, extension and standalone patcher are © 2026 ShortEnigma0, GPL-3.0-only.

## Legal, DMCA & Trademark Disclaimer

* **No Proprietary Code or Binaries:** This project does **NOT** host, mirror, bundle, or distribute any proprietary APKs, copyrighted binary code, or assets belonging to Samsung Electronics Co., Ltd. or any third party. The tools operate solely via local, client-side differential bytecode modification on an APK supplied by the user.
* **Non-Circumvention:** This project does **not** bypass or circumvent DRM, encryption, access controls, or copyright protection mechanisms (17 U.S.C. § 1201).
* **Trademark Notice:** "Samsung", "Galaxy", "Galaxy Store", "Expert RAW", and "One UI" are registered trademarks of Samsung Electronics Co., Ltd. "Morphe" is a trademark of the Morphe project. Reference to these marks is made strictly under **nominative fair use** for identification and technical compatibility purposes. This project is **not affiliated with, sponsored by, or endorsed by** Samsung Electronics Co., Ltd. or the Morphe project.
* **Disclaimer of Warranty:** Provided strictly **"AS IS", WITHOUT WARRANTY OF ANY KIND** under GPLv3. Users assume all responsibility for their own use.
* **DMCA Inquiries & Takedown:** For full legal policies or to submit a copyright notification pursuant to 17 U.S.C. § 512, see [DMCA.md](DMCA.md) or open an issue on GitHub.
