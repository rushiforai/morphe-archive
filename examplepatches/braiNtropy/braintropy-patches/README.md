# 👋🧩 braiNtropy Patches

Custom patches for apps I use, for use with Morphe.

## ❓ About

This repository contains patches maintained by [braiNtropy](https://github.com/braiNtropy).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v2.5.0](https://github.com/braiNtropy/braintropy-patches/releases/tag/v2.5.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 Waking Up&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 3.24.1 | 3.27.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable update prompt](#disable-update-prompt) | Suppresses the "Update Required" dialog shown on launch when the server reports a newer preferred build, and spoofs the app-version/app-build request headers so the server (which rejects outdated builds with a 404) keeps serving the app. Does not affect the version shown in the app. |  |
| [Unlock Premium](#unlock-premium) | Unlocks all premium content and removes subscription banners. |  |

</details>

<details open>
<summary>📦 RP Hypertrophy&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.6.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Enables app features locked behind the subscription paywall. |  |

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

The `Unlock Premium` patch for RP Hypertrophy is derived from
[hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) (GPL-3.0),
with thanks to hoo-dles for the original endpoint analysis.
