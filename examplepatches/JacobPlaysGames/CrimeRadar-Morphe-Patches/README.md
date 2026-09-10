# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=JacobPlaysGames/CrimeRadar-Morphe-Patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.9.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/releases/tag/v1.9.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;13 patches total
<details open>
<summary>📦 CrimeRadar&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**🎯 Supported versions:**

| 26.33.1 | 26.34.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Branding](#branding) | Changes app name to 'CrimeRadar+' and tints the icon for easy identification. |  |
| [Change package name](#change-package-name) | Changes the app package name to allow installing alongside the original. | • New package name |
| [Debug Settings](#debug-settings) | Adds a CrimeRadar+ debug info entry to the settings screen. |  |
| [Notification Limits Raised](#notification-limits-raised) | Raises per-category daily push caps and heads-up push limits. |  |
| [Premium Bypass](#premium-bypass) | Bypasses premium subscription checks to unlock all premium features. |  |
| [Remove History Cap](#remove-history-cap) | Removes the 200-item local reading history limit. |  |
| [Replay Minutes Override](#replay-minutes-override) | Overrides daily replay listening time limits to unlimited. |  |
| [Telemetry Kill](#telemetry-kill) | Disables Instabug and Adjust telemetry SDKs for privacy. |  |

</details>

<details open>
<summary>📦 Scanner Radio&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 8.29 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Branding](#branding) | Changes app name to 'Scanner Radio+' for easy identification. |  |
| [Change package name](#change-package-name) | Changes the app package name to allow installing alongside the original. | • New package name |
| [Pairip DRM Bypass](#pairip-drm-bypass) | Disables Pairip DRM/integrity checks that crash patched APKs on startup. |  |
| [Premium Bypass](#premium-bypass) | Bypasses premium subscription checks to unlock all premium features. |  |
| [Telemetry Kill](#telemetry-kill) | Disables InMobi, FairBid telemetry/ad SDKs and ad display for privacy. |  |

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
