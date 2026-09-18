# 🧩 CBC Patches

Morphe patches for the CBC News Android app (`ca.cbc.mobile.android.cbcnewsandroidwebview`).

## ❓ About

Removes advertising from the CBC News app: banner/in-read display ads, ads spliced into article
bodies, full-screen interstitials and on-demand video pre/mid-rolls (Google IMA).

Not affiliated with, endorsed by, or connected to the Canadian Broadcasting Corporation.
Live streams that use Google DAI are stitched server-side and are not affected.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=LimeLimes/cbc-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/LimeLimes/cbc-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 CBC News&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 7.11.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads](#disable-ads) | Prevents the app from requesting banner, in-read and mediated ads. |  |
| [Disable article ads](#disable-article-ads) | Prevents ads from being inserted into article bodies. |  |
| [Disable interstitial ads](#disable-interstitial-ads) | Prevents the app from showing full-screen interstitial ads. |  |
| [Disable video ads](#disable-video-ads) | Prevents pre-roll and mid-roll ads from playing in the video player. |  |

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
