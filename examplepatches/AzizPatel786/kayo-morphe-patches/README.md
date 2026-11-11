# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=AzizPatel786/kayo-morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.6.1](https://github.com/AzizPatel786/kayo-morphe-patches/releases/tag/v1.6.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Kayo Sports (Android TV)&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.8.1 | 4.6.1 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Kayo Android TV 4K quality & performance](#kayo-android-tv-4k-quality-performance) | Fixes startup license lockout on sideloaded Kayo TV builds and unlocks 4K50 UHD / HEVC / HDR10 / Widevine L1 / HDCP 2.2 capabilities, D-pad remote quality & audio selector, 80 Mbps instant startup, and Live Stream Diagnostics HUD on Kayo Sports (Android TV). |  |

</details>

<details open>
<summary>📦 Kayo Sports&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 6.1.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Kayo Mobile quality & performance](#kayo-mobile-quality-performance) | Unlocks 1080p50 / 4K50 UHD stream quality, multi-audio commentary switching, 80 Mbps instant startup, deep rebuffer-proof buffering, Picture-in-Picture (PiP), and Live Stream Diagnostics HUD on Kayo Sports (Mobile). |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

UserXYZ Patches are licensed under the [GNU General Public License v3.0](LICENSE)
