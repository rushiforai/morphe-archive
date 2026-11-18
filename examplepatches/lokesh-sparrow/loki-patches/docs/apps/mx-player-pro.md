<!-- HEADER_START -->
# <img src="../../assets/icons/com.mxtech.videoplayer.pro.png" width="36" height="36" align="top" alt=""> MX Player Pro

![version](https://img.shields.io/badge/version-1.93.4-2563eb?style=for-the-badge&labelColor=0d1117) ![patches](https://img.shields.io/badge/patches-3-14b8a6?style=for-the-badge&labelColor=0d1117) ![file](https://img.shields.io/badge/file-APK-0ea5e9?style=for-the-badge&labelColor=0d1117) ![menu](https://img.shields.io/badge/menu-Settings-6e7681?style=for-the-badge&labelColor=0d1117)

[← All apps](../../README.md#apps)&nbsp;&nbsp;•&nbsp;&nbsp;`com.mxtech.videoplayer.pro`&nbsp;&nbsp;•&nbsp;&nbsp;[v3.3.0](https://github.com/lokesh-sparrow/loki-patches/releases/tag/v3.3.0)

**🎯 Supported versions:** `1.93.4`
<!-- HEADER_END -->

## Features

| Feature | What you get |
|---|---|
| 💎 **Pro, licensed** | The Google Play licence check is skipped, so a patched copy never locks itself |
| 🎞️ **All codecs** | AC3, E-AC3, DTS, DTS-HD, TrueHD and MLP audio play: the custom codec 1.87.0 is fetched while patching, checked, and written into the app in place of MX's stripped decoder |
| 🔑 **Google Drive sign-in** | Through MicroG-RE (optional patch) |

## How-to

### Open the Loki Patches menu

Three ways in, all opening the same menu:

- **Me page** (long press done for you: MX Player → the account icon at the top right) → **Loki Patches**, the row
  above Settings.
- **Settings** → **Loki Patches** (first row).
- Long press the MX Player icon on your home screen → **Loki Patches**.

The Loki Patches menu takes its colours from the same theme setting MX uses: Amoled Black, Dark Theme and the
Classic dark skins give a dark page, Light Theme and the Classic light skins a light one, and Adaptive follows the
system. Change the theme in MX and reopen the menu; the two screens stay in step.

### Patch it

Nothing to prepare: keep the internet on while patching. The patch downloads the codec for your phone's
architecture (about 6 MB per architecture) from [USBhost/MX_FFmpeg release 1.90.1v2](https://github.com/USBhost/MX_FFmpeg/releases/tag/1.90.1v2)
and refuses it unless its SHA-256 matches the one that release publishes.

### Check the codec is in use

MX Player → **Settings** → **Decoder** → **Custom codec** now reads **1.87.0**: that is the packed-in library, and
the Loki Patches menu says the same under **Player** → **All codecs**.

### Patch offline, or use a different pack

Pick **mx_aio.zip** (or a `libffmpeg.mx.so`) in the patch's **Codec file** option, or leave `mx_aio.zip` in the
**Download** folder. Either is used instead of the download; anything the file does not cover is still downloaded.

## FAQ

**Why did an earlier build close itself right after opening?**
MX Player Pro reads the signature of its own APK at start and kills the process when the APK was signed by anyone
else, which is always the case for a patched copy. These patches stop that check from running; without it no MX
Player patch of any kind can work.

**Which file do I download?**
The plain **APK** of **MX Player Pro** 1.93.4 (arm64-v8a, armeabi-v7a) from APKMirror.

**Where does the codec come from?**
From USBhost's public MX_FFmpeg release, downloaded while patching and checked against its published SHA-256.
It is written into the app, so the patched APK grows by about 12 MB; the app itself downloads nothing. The bundle
does not carry the codec, so it stays small.

**Does this work with the free MX Player?**
No. The patches target MX Player Pro (`com.mxtech.videoplayer.pro`).

## Patches

<!-- PATCHES_START -->
| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|---|---|---|
| **All codecs** | Replaces MX Player's stripped decoder with the custom codec 1.87.0, so AC3, E-AC3, DTS, DTS-HD, TrueHD and MLP audio play. The codec is downloaded while patching from USBhost's public MX_FFmpeg release and checked against its SHA-256, then written into the app: nothing to set up afterwards. | • Codec file |
| **GmsCore support (MX Player Pro)** | Routes Google sign-in and Google Drive through MicroG-RE (GmsCore) instead of Google Play services, so MX Player Pro can sign in to Google Drive on a re-signed build. MicroG-RE has to be installed and signed in to a Google account. |  |
| **Skip license check** | MX Player Pro asks Google Play to confirm the purchase and locks itself when the answer is missing, which is always the case for a patched copy. The check is skipped and the app counts as licensed. |  |
<!-- PATCHES_END -->
