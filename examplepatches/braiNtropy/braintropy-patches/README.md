# 👋🧩 braiNtropy Patches

Custom patches for apps I use, for use with Morphe.

## ❓ About

This repository contains patches maintained by [braiNtropy](https://github.com/braiNtropy).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v2.3.0](https://github.com/braiNtropy/braintropy-patches/releases/tag/v2.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Waking Up&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.24.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks all premium content and removes subscription banners. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Expo OTA updates](#disable-expo-ota-updates) | Disables expo-updates: the app no longer contacts the Expo update server (u.expo.dev) on launch and can never download or run over-the-air JavaScript updates published by the developer. Only applies to apps built with Expo. |  |
| [Disable Pairip license check](#disable-pairip-license-check) | Disables the Google Play license check (Pairip) that redirects installs not purchased through the Play Store to the buy page. The check never runs, so this also works on degoogled devices without Play services. Does not bypass Play Integrity attestation. |  |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=braiNtropy/braintropy-patches

Or manually add this repository URL as a patch source in Morphe: https://github.com/braiNtropy/braintropy-patches

### 🛠️ Building

After granting the GitHub CLI token `read:packages` access, build on Windows with:

```powershell
.\build-patches.ps1
```

The patch bundle is generated under `patches/build/libs/`. See the
[Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for the complete workflow.

## 📜 License

braiNtropy Patches are licensed under the [GNU General Public License v3.0](LICENSE).
