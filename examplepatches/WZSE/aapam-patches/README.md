# aapam patches

Patches for apps I like.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=WZSE/aapam-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/WZSE/aapam-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 ZEE5 Android TV&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 5.83.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable CleverTap](#disable-clevertap) | Prevents the CleverTap analytics SDK from initializing, stopping behavioral tracking and advertising-id (GAID) collection. |  |
| [Disable Firebase analytics](#disable-firebase-analytics) | Prevents Firebase Analytics from initializing, stopping event and user-property reporting to Google. |  |
| [Disable ads](#disable-ads) | Removes Google IMA ad insertion (client-side and server-side DAI) from the ZEE5 player. The media source factory is returned DRM-configured but with ad-insertion components never attached, so content and DRM playback are unaffected. |  |
| [Disable analytics](#disable-analytics) | Disables all third-party analytics (CleverTap, Firebase, Mixpanel, videoanalytics) by short-circuiting the central analytics dispatch method. No tracking data is sent. |  |

</details>

<!-- PATCHES_END -->

## 📜 License

aapam Patches are licensed under the [GNU General Public License v3.0](LICENSE)
