# RJ Morphe Patches

![Pipeline Status](https://gitlab.com/rudrakshrajpurohit417/rj-patches/badges/main/pipeline.svg)
![Latest Release](https://gitlab.com/rudrakshrajpurohit417/rj-patches/-/badges/release.svg)
![License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)

Custom [Morphe](https://morphe.software) patches: MovieBox, GPS Map Camera, and Local TTS.

---

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://gitlab.com/rudrakshrajpurohit417/rj-patches/-/releases/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total

<details open>
<summary>📦 Local TTS&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.2.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Default |
|---|---|:---:|
| **Local TTS Pro** | Unlocks local Pro features (full-length reader, all voices, and audio export) by overriding the shared Pro entitlement state mapping. | ✅ |

</details>

<details open>
<summary>📦 GPS Map Camera&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.9.40 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Default |
|---|---|:---:|
| **Premium Unlocked** | Full unredacted patch: Neutralizes PairIP licensing & anti-tamper, unlocks Pro VIP lifetime licenses, removes all watermarks, and silences all ad placements. | ✅ |

</details>

<details open>
<summary>📦 MovieBox&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.0.03.0930.03 | 4.0.03.0922.03 | 4.0.03.0918.03 | 4.0.03 | 4.0.02 |
| :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Default |
|---|---|:---:|
| **Premium Unlocked** | All-in-one unlock: full VIP access, 1080p/4K resolutions, ad-free experience, and optimized video streaming buffers for zero stuttering. | ✅ |

</details>

<!-- PATCHES_END -->

---

## Usage

[![Add to Morphe Manager](https://img.shields.io/badge/Add%20to-Morphe%20Manager-blue?style=for-the-badge)](https://morphe.software/add-source?gitlab=rudrakshrajpurohit417/rj-patches)

1. Open [Morphe Manager](https://morphe.software) on your Android device
2. Ensure `https://gitlab.com/rudrakshrajpurohit417/rj-patches` is added as a patch source
3. Select your app and apply the patch:
   - **Local TTS**: Apply **Local TTS Pro**
   - **GPS Map Camera**: Apply **Premium Unlocked**
   - **MovieBox**: Apply **Premium Unlocked**

---

## Applying Patches via CLI

```bash
# Local TTS Pro
morphe-cli patch \
  --patches=patches-1.2.0.mpp \
  --apk="Local TTS_v1.2.1(121).apks" \
  --exclusive -e "Local TTS Pro" \
  --out=LocalTTS-patched.apk

# MovieBox
morphe-cli patch \
  --patches=patches-1.2.0.mpp \
  --apk=moviebox.apk \
  --out=moviebox-patched.apk

# GPS Map Camera
morphe-cli patch \
  --patches=patches-1.2.0.mpp \
  --apk=gpsmapcamera.apkm \
  --out=gpsmapcamera-patched.apk
```

---

## Disclaimer

> **⚠️ Legal Notice**
>
> This project is provided for **educational and research purposes only**. The patches in this repository modify third-party applications and may violate the terms of service of those applications.

---

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE).
