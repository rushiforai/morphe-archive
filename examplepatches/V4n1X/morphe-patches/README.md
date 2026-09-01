# 🍃 V4n1X Patches

Patches for use with [Morphe](https://morphe.software).

## ❓ About

A collection of bytecode/resource patches for Android apps, built for the Morphe patcher.
Currently focused on SoundCloud (`com.soundcloud.android`).

## 🩹 Patches list

📦 SoundCloud • 4 patches

| 💊 Patch | 📜 Description |
|---|---|
| [Enable SoundCloud Go](#enable-soundcloud-go) | Enables SoundCloud Go premium features. |
| [AMOLED dark theme](#amoled-dark-theme) | Changes the default dark theme to use true blacks for AMOLED screens. |
| [Disable analytics](#disable-analytics) | Disables SoundCloud's analytics. |
| [Disable consent popup](#disable-consent-popup) | Disables the OneTrust consent/cookies popup on first launch. |

### Enable SoundCloud Go

Enables app features locked behind the subscription paywall:
forces the current tier/plan to Go+, suppresses upsell UI and disables ads.

### AMOLED dark theme

Changes the default dark theme to use true blacks for AMOLED screens. *(Disabled by default)*

### Disable analytics

Disables SoundCloud's analytics event dispatching.

### Disable consent popup

Disables the OneTrust consent/cookies popup on first launch.

## 📚 How to use

Click here to add these patches to Morphe:

> https://morphe.software/add-source?github=V4n1X/morphe-patches

Or manually add this repository URL in Morphe Manager → Sources:

> `https://github.com/V4n1X/morphe-patches`

## ⚖️ Disclaimer

This project is provided for **educational purposes only**. The patches are intended to help developers
understand Android bytecode modification and the Morphe patching framework.

- **No affiliation** — This project is not affiliated with, endorsed by, or connected to any of the patched applications or their developers.
- **No warranty** — These patches are provided "as is" without warranty of any kind. Use at your own risk.
- **Terms of Service** — Using modified versions of applications may violate their Terms of Service. It is your responsibility to review and comply with applicable terms.
- **No redistribution** — The patched APK files should not be redistributed. These patches are meant to be applied by end users to their own legally obtained APKs.
- **Fair use** — These patches are developed through independent reverse engineering for interoperability and personal use, consistent with fair use principles.

The author assumes no liability for any consequences resulting from the use of these patches.

## 🙏 Credits

Based on patches from:

- [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) — AMOLED dark theme, analytics/telemetry patch
- [kondratjev/morphe-patches](https://github.com/kondratjev/morphe-patches) — Enable SoundCloud Go, consent popup & analytics patches

Built on the official [MorpheApp/morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template).

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/V4n1X/morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 SoundCloud&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 2026.07.03-release | 2026.08.19-release |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED dark theme](#amoled-dark-theme) | Changes the default dark theme to use true blacks for AMOLED screens. |  |
| [Disable analytics](#disable-analytics) | Disables SoundCloud's analytics. |  |
| [Disable consent popup](#disable-consent-popup) | Disables the OneTrust consent/cookies popup and collapses banner views. |  |
| [Enable SoundCloud Go+](#enable-soundcloud-go) | Enables SoundCloud Go+ premium features, offline listening, HQ audio, and disables audio/visual ads. |  |
| [Material You dynamic theme](#material-you-dynamic-theme) | Applies Android 12+ Material You dynamic accent colors from the system wallpaper palette. |  |

</details>

<!-- PATCHES_END -->

## 🛠️ Building

```sh
./gradlew buildAndroid
```

The built `.mpp` file will be at `patches/build/libs/`.

## 📜 License

V4n1X Patches are licensed under the [GNU General Public License v3.0](LICENSE)
