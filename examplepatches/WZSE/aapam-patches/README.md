# aapam patches

Patches for apps I like.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=WZSE/aapam-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/WZSE/aapam-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;12 patches total
<details open>
<summary>📦 Telegram&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

<details open>
<summary>🎯 12.8.3&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Anti-disappearing media](#anti-disappearing-media) | Keeps view-once and self-destructing media viewable forever; the sender sees them as expired. |  |

</details>

<details open>
<summary>🎯 12.10.1&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Anti-disappearing media](#anti-disappearing-media) | Keeps view-once and self-destructing media viewable forever; the sender sees them as expired. |  |

</details>

</details>

<details open>
<summary>📦 Prime Video Android TV&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

<details open>
<summary>🎯 6.23.23+v15.5.0.70-armv7a&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bundle native ad-strip hook](#bundle-native-ad-strip-hook) | Packages the Prime Video libignite interception library for this APK's ABIs. |  |
| [Clone Prime Video](#clone-prime-video) | Renames the package to <original>.mod (and its provider authorities / custom permissions) so the patched app installs side-by-side with a non-removable system Prime Video. Opt-in. |  |
| [Disable auto-updates](#disable-auto-updates) | Prevents Google Play Store from automatically replacing the patched APK with the official unpatched version. |  |
| [Load native ad-strip hook](#load-native-ad-strip-hook) | Loads libpvhook.so at startup before Prime Video constructs its media pipeline. |  |
| [Override certificate pinning](#override-certificate-pinning) | Adds a network_security_config trusting user CAs (no pin sets) so AdGuard Premium can inspect the app's platform-stack HTTPS. Optional adjunct: Prime Video's ad plane is largely native libcurl, so DNS blocking is the primary tool. |  |
| [Prime Video extension](#prime-video-extension) | Integrates the Prime Video ATV extension for ad group skipping. |  |
| [Skip ads](#skip-ads) | Multi-layer ad suppression targeting the SSAI schedule, impression reporting, and the Volley network chokepoint. |  |

</details>

<details open>
<summary>🎯 6.24.5+v16.0.0.231-allAbis&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bundle native ad-strip hook](#bundle-native-ad-strip-hook) | Packages the Prime Video libignite interception library for this APK's ABIs. |  |
| [Clone Prime Video](#clone-prime-video) | Renames the package to <original>.mod (and its provider authorities / custom permissions) so the patched app installs side-by-side with a non-removable system Prime Video. Opt-in. |  |
| [Disable auto-updates](#disable-auto-updates) | Prevents Google Play Store from automatically replacing the patched APK with the official unpatched version. |  |
| [Load native ad-strip hook](#load-native-ad-strip-hook) | Loads libpvhook.so at startup before Prime Video constructs its media pipeline. |  |
| [Override certificate pinning](#override-certificate-pinning) | Adds a network_security_config trusting user CAs (no pin sets) so AdGuard Premium can inspect the app's platform-stack HTTPS. Optional adjunct: Prime Video's ad plane is largely native libcurl, so DNS blocking is the primary tool. |  |
| [Prime Video extension](#prime-video-extension) | Integrates the Prime Video ATV extension for ad group skipping. |  |

</details>

</details>

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
