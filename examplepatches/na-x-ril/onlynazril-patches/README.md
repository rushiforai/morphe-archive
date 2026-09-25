# 👋🧩 onlynazril Patches

Personal patch collection for apps I use: labels on names, and the details apps leave out.

## ❓ About

Patches are built on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template)
and follow the [Morphe patcher](https://github.com/MorpheApp/morphe-patcher). The bundle currently
targets TikTok, where it shows the account handle, the region and the post time next to names on
the feed (including a video shared into a chat) and in comments, with a Tweaks row to switch each
surface and each part on or off. More apps are planned.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=na-x-ril/onlynazril-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/na-x-ril/onlynazril-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 TikTok&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 47.0.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Always @handle · region · post time](#always-handle-region-post-time) | Shows the @handle, the region and the post time on feed videos and comments, including a video shared into a chat. Each surface and each part has a switch in Tweaks. |  |
| [Tweaks settings row](#tweaks-settings-row) | Adds the Tweaks row to TikTok settings: the switches for the @handle stamp, its surfaces, the region and the post time. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid` (needs the GitHub token described above)
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

onlynazril Patches are licensed under the [GNU General Public License v3.0](LICENSE).

Files under `patches/src/main/kotlin/app/morphe/` are derived from other GPLv3 projects and keep
their own headers; the additional terms are in [NOTICE](NOTICE).
