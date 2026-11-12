# Expert RAW "Disable post-processing" patcher

Adds a **Settings → Pictures → Disable post-processing** switch to Samsung Expert RAW.
With it on, each shot is captured as **one frame** instead of a multi-frame burst (no multi-frame
merge or HDR stacking for the RAW or the JPEG). The photo is processed and saved right away
(~3 s), with no "Refining image" notification. The camera thumbnail opens it in Gallery.
Toggling the switch prompts to restart the app immediately with a matching confirmation dialog.

Lab modes (ND filter, Astrophoto, Multiple exposure…) and shots with the switch off behave as stock.

> This tool ships **no Samsung code**. You give it your own copy of the Expert RAW APK and it patches that.

## Tested on

| Expert RAW | APK SHA-256 | Device |
|---|---|---|
| 6.0.02.8 (600208022), arm64 | `3737f63abc2fb62889e8a6ae140d074eee28445f3f41058f09d6c34ea1e937f7` | Galaxy S23 (SM-S911B), stock, locked bootloader |

Other versions are refused unless you pass `--force`. With `--force`, every patch checks that its
anchor code is where it expects and stops with an error if not, so you won't get a silently broken APK.

## Requirements

- Python 3.8+
- Java 17+ (`keytool` on PATH)
- [apktool](https://apktool.org) 2.9+ or 3.x (tested 3.0.3)
- Android SDK build-tools **35+** (`zipalign` with `-P 16`, `apksigner`); found automatically via
  `ANDROID_HOME`, or pass `--zipalign` / `--apksigner`
- `adb` to install

## Usage

```bash
python3 patch.py ExpertRAW-6.0.02.8.apk
```

This writes `ExpertRAW-noPP-6.0.02.8.apk`. On first run it creates `patcher-key.jks` next to the script.
**Keep that key:** an update signed with a different key can't be installed over this one.
To use your own key instead: `--ks my.jks --ks-pass … --ks-alias …`. Use `-o out.apk` to choose the output
path, and `--keep-work` to keep the decoded project for inspection.

## Installing

The patched app is signed with your key, not Samsung's, so it can't update the Galaxy Store version:

```bash
adb uninstall com.samsung.android.app.galaxyraw        # removes the Store version (and its settings)
adb install -r --user 0 ExpertRAW-noPP-6.0.02.8.apk
```

*(You can also transfer the APK to your phone and install it directly via a file manager).*

1. Open Expert RAW and allow the requested permissions (Camera, Microphone, etc.).
2. The app will automatically prompt to grant **"Allow access to manage all files"** (required to save DNG and JPEG files directly to `DCIM/Expert RAW/`). Toggle it **ON** and press **Back** (no ADB command required).
   *(Optional: If installing via ADB script, you can pre-grant it via `adb shell appops set --user 0 com.samsung.android.app.galaxyraw MANAGE_EXTERNAL_STORAGE allow`).*
3. Go to **Settings → Pictures → Disable post-processing**. When changed, a matching dialog will ask if you want to restart the app now—tap **Restart** to apply immediately.

Photos go to `DCIM/Expert RAW/`.

Check it's working (optional):

```bash
adb logcat -s GrawMod
# post-processing bypass ON: forcing single-frame capture (no multi-frame merge)
# immediate single-frame processing: true
# thumbnail refreshed after scan: /storage/emulated/0/DCIM/Expert RAW/<name>.jpg
```

## What you lose

The Store build is signed with Samsung's platform key and gets ~50 system permissions that a re-signed
APK can never get. The patcher works around each one; these features don't survive:

- Voice shutter commands ("Smile", "Capture"…)
- Volume-key shutter (likely)
- Gallery's "Processing…" placeholder (photos appear once finished)
- Camera cutout setting, call-state handling
- Galaxy Store updates (re-run the patcher on a new version instead, if it's supported)

Samsung's native processing library still turns the single frame into the DNG and the JPEG
(demosaic, tone mapping, possibly single-frame noise reduction). What the switch removes is the
multi-frame stacking.

## How it works

1. **Feature:** `ExpertRawPhotoMaker.isSingleFrameCondition()` (12MP/24MP) and
   `ArcHighResExpertRawPhotoMaker.takePostProcessingPicture()` (50MP) are hooked. This turns on Samsung's
   own single-frame path (normally used only for manual exposures over 250 ms), giving
   `dsCondition = 0xAA0001` (1 frame) instead of `0xAA000B` (11 frames).
2. **Instant save:** `PostProcessThread.waitRequest()` lets 1-frame requests run immediately instead of
   waiting for the camera to go to background, and suppresses their progress notification.
3. **Running without Samsung's signature:**
   - every `ContentResolver` call → `SafeCR` (denied Samsung providers return empty results;
     `secmedia` queries are answered from the standard MediaStore)
   - privileged framework calls → `SafeSys` no-op wrappers
   - `/data/sec` (SELinux-restricted) → app-private storage
   - GPPM (Gallery post-processing manager) reported as disabled
4. **Thumbnail:** refreshed after MediaScanner indexes the saved file, and it opens Gallery with a
   standard `content://media` URI.

## Layout

```
patch.py          the patcher (stdlib only)
smali/            pre-built helper classes copied into the APK (com.samsung.android.app.galaxyraw.mod)
java/src/         Java source of PpImmediate, SecMediaShim, PpRefresh
java/stubs/       compile-time stubs of app classes (never shipped)
java/build.sh     rebuild java/src -> smali/ (developers only)
```

PpBypass, PpBypassPreference, SafeCR and SafeSys are hand-written smali. The `SAFESYS` list in
`patch.py` must stay in the same order as the `w<N>_` wrappers in `smali/SafeSys.smali`.

## License

Copyright (C) 2026 ShortEnigma0.

This patcher (`patch.py`, `smali/`, `java/`) is free software: you can redistribute it and/or modify it
under the terms of the **GNU General Public License, version 3** (GPL-3.0-only), the same license as the rest
of this repository. See [`../LICENSE`](../LICENSE). It is provided **without any warranty**.

The patcher is original work and contains no Morphe code. It contains **no Samsung code**: it only edits an APK
the user supplies. The classes under `smali/` and `java/` are original helper code that the patcher adds to that APK;
`java/stubs/` are compile-time stand-ins that are never shipped.

## Legal, DMCA & Trademark Disclaimer

* **No Proprietary Code or Binaries:** This tool does **NOT** host, mirror, bundle, or distribute any proprietary APKs, copyrighted binary code, or assets belonging to Samsung Electronics Co., Ltd. It operates exclusively via local, client-side differential bytecode modification on an APK supplied by the user.
* **Non-Circumvention:** This tool does **not** bypass or circumvent DRM, encryption, access controls, or copyright protection mechanisms (17 U.S.C. § 1201).
* **Trademark Notice:** "Samsung", "Galaxy", "Galaxy Store", "Expert RAW", and "One UI" are registered trademarks of Samsung Electronics Co., Ltd. Reference to these marks is made strictly under **nominative fair use** for identification and technical compatibility purposes. This tool is **not affiliated with, sponsored by, or endorsed by** Samsung Electronics Co., Ltd.
* **Disclaimer of Warranty:** Provided strictly **"AS IS", WITHOUT WARRANTY OF ANY KIND** under GPLv3. You are responsible for having the right to modify the APK you patch. Modifying and re-signing the app removes features that depend on Samsung's signature (see "What you lose").
* **DMCA Inquiries & Takedown:** For full legal policies or to submit a copyright notification pursuant to 17 U.S.C. § 512, see [DMCA.md](DMCA.md) or open an issue on GitHub.

