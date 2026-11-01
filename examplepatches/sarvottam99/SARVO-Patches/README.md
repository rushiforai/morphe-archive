# SARVO Patches

A growing, multi-app collection of Android patches for **Morphe Manager**.

SARVO Patches is designed as one installable patch bundle for multiple Android apps. Each patch declares the app package and supported versions it targets, so new app families can be added without creating a separate bundle for every app.

**Current app support:** Panasonic MirAIe — `com.panasonic.in.miraie`, version `01.4.32`.

<a href="https://morphe.software/add-source?github=sarvottam99/SARVO-Patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add SARVO Patches to Morphe Manager" height="48">
</a>

## Install

Add **SARVO Patches** to Morphe Manager using the button above, or add this GitHub source manually:

`sarvottam99/SARVO-Patches`

Choose the stable release for normal use. To try development builds, enable pre-releases for this source in Morphe Manager.

## Patch catalogue

The catalogue below is generated from the actual patch bundle during each release. It includes supported app package names, tested versions, patch descriptions and available options.

<!-- PATCHES_START EXPANDED -->
> **[v1.1.1](https://github.com/sarvottam99/SARVO-Patches/releases/tag/v1.1.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 MirAIe&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**Package name:** `com.panasonic.in.miraie`

**🎯 Supported versions:**

| 🧪&nbsp;01.4.32 | 01.4.30 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change installer source](#change-installer-source) | Spoofs the installer source so the app appears to be installed from an app store. | • Spoofed package installer name |
| [Dark mode](#dark-mode) | Forces MirAIe into night mode, enables Android Force Dark, darkens its legal WebView, and keeps energy-chart labels readable. |  |
| [Disable Play Store updates](#disable-play-store-updates) | Disables Play Store updates by setting the version code to the maximum allowed. This patch may cause unexpected issues with some apps and does not work if the app is installed by root mounting |  |
| [Hide Lifestyle tab](#hide-lifestyle-tab) | Hides only the Lifestyle tab from MirAIe's bottom navigation. Other tabs, icons and their order remain unchanged. |  |
| [Remove dashboard promotional banner](#remove-dashboard-promotional-banner) | Removes the dashboard promotional carousel before it initializes. |  |
| [Spoof signature](#spoof-signature) | Spoofs the package signature of the original APK. |  |

</details>

<!-- PATCHES_END -->

## Project notes

SARVO Patches is an independent community project. It is not affiliated with, endorsed by, or sponsored by Panasonic or the Morphe project. **Morphe Manager** and the Morphe patching framework are separate projects.

## License

SARVO Patches is licensed under the [GNU General Public License v3.0](LICENSE).
