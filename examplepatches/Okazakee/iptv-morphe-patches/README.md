# 👋🧩 IPTV Morphe Patches

Custom Morphe patches for **IPTV Pro Stream Player** (`com.iptvprostreamplayer.v1`).

Unlocks the Pro subscription locally by bypassing the Firebase `subscription_needed` flag and forcing the RevenueCat `pro` entitlement to active. Works fully offline — no server validation. Play Store install check bypass is provided via direct APK (`patched-signed.apk`).

**Which app versions are supported:** see [COMPATIBILITY.md](COMPATIBILITY.md) for the supported builds, their verification status and the full release history. Morphe Manager only offers the versions declared in the bundle and refuses anything else.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Okazakee/iptv-morphe-patches

In Morphe Manager, add source `Okazakee/iptv-morphe-patches`, select **Unlock Pro (IPTV)** and patch your APK. For Play Store sideload bypass, use the direct `patched-signed.apk` (25M, verified on Pixel_9_Pro Play Store).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.2](https://github.com/Okazakee/iptv-morphe-patches/releases/tag/v1.3.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 IPTV Pro Stream Player&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.2.7 | 2.7.17 | 2.7.21 | 2.7.24 |
| :---: | :---: | :---: | :---: |
| Older target · pre-2.7.21 | Older target · pre-2.7.21 | Verified 2026-10-19 · vc204 | Verified 2026-10-27 · vc207 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro (IPTV)](#unlock-pro-iptv) | Deactivates subscription_needed, forces the pro entitlement active, and spoofs Google Play for app-internal installer-source checks. |  |

</details>

<details open>
<summary>📦 IPTV Pro Stream Player (FR)&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.7.21 | 2.7.24 |
| :---: | :---: |
| Verified 2026-10-19 · vc204 | Verified 2026-10-27 · vc207 |

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

