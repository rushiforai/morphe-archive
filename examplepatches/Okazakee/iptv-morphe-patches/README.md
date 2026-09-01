# 👋🧩 IPTV Morphe Patches

Custom Morphe patches for **IPTV Pro Stream Player** (`com.iptvprostreamplayer.v1`).

Unlocks the Pro subscription locally by bypassing the Firebase `subscription_needed` flag and forcing the RevenueCat `pro` entitlement to active. Works fully offline — no server validation. Play Store install check bypass is provided via direct APK (`patched-signed.apk`).

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Okazakee/iptv-morphe-patches

In Morphe Manager, add source `Okazakee/iptv-morphe-patches`, select **Unlock Pro (IPTV)** and patch your APK. For Play Store sideload bypass, use the direct `patched-signed.apk` (25M, verified on Pixel_9_Pro Play Store).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/Okazakee/iptv-morphe-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 IPTV Pro Stream Player&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.2.7 | 2.7.17 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro (IPTV)](#unlock-pro-iptv) | Deactivates subscription_needed, forces the pro entitlement active, and spoofs Google Play for app-internal installer-source checks. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

IPTV Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)

feat: test

