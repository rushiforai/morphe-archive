# 👋🧩 Morphe Portal Patches

Custom Morphe patches for Meta Portal apps.

A Fork Of https://github.com/andronedev/morphe-portal-patch To Make The Patches Compatible With Latest Morphe Patcher

Use Along Morphe Patches For YouTube Otherwise Only Using These Patches May Crash The App Or Basically Patch On Top Of A Already Patched Morphe YouTube Build

This repo is Portal-scoped: it only holds patches for apps that run on Meta Portal.

## ❓ About

Forces YouTube / YouTube Music to run at a higher display density on low-DPI devices like Meta
Portal, removes the experimental-version nag dialog, and lets the app versionName be overridden
so re-patched builds are recognised as updates.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/BlazeFTL/Morphe-Portal-Patches-New/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 20.51.39 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom DPI](#custom-dpi) | Forces a higher display density for this app only, so the whole UI scales up without changing the system density. Intended for low-dpi devices such as Meta Portal (160 dpi). | • Custom DPI |
| [Custom version name](#custom-version-name) | Overrides the app versionName so a re-patched build of the same upstream version is recognised as a new version. Lets patch-only changes propagate as updates even when the upstream YouTube/YT Music version is unchanged. | • Version name |
| [Disable experimental notice](#disable-experimental-notice) | Removes the morphe experimental-version warning dialog, which otherwise nags on every re-patched build whose version differs from the recommended one. |  |

</details>

<details open>
<summary>📦 YouTube Music&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 8.51.51 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom DPI](#custom-dpi) | Forces a higher display density for this app only, so the whole UI scales up without changing the system density. Intended for low-dpi devices such as Meta Portal (160 dpi). | • Custom DPI |
| [Custom version name](#custom-version-name) | Overrides the app versionName so a re-patched build of the same upstream version is recognised as a new version. Lets patch-only changes propagate as updates even when the upstream YouTube/YT Music version is unchanged. | • Version name |
| [Disable experimental notice](#disable-experimental-notice) | Removes the morphe experimental-version warning dialog, which otherwise nags on every re-patched build whose version differs from the recommended one. |  |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=BlazeFTL/Morphe-Portal-Patches-New

Or manually add this repository url as a patch source in Morphe: https://github.com/BlazeFTL/Morphe-Portal-Patches-New

### 🛠️ Building

To build Morphe Portal Patches,
you can follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## 📜 License

Morphe Portal Patches are licensed under the [GNU General Public License v3.0](LICENSE)
