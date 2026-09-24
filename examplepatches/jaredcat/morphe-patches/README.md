# 👋🧩 Morphe Patches

My own repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: <https://morphe.software/add-source?github=jaredcat/morphe-patches>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/jaredcat/morphe-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Expand&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 2.1.1 |
| :---: |
| Download the arm64 XAPK from APKPure (not APKMirror). Use Morphe’s file picker if Continue opens Google. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Analytics](#disable-analytics) | Prevents Adjust and Firebase Analytics from collecting or sending analytics. |  |
| [Unlock Plus](#unlock-plus) | Unlocks Expand Plus without a subscription. |  |

</details>

<details open>
<summary>📦 OfferUp&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2026.38.0 |
| :---: |
| Patch the device split APKs (base + arm64 + en + xxhdpi) or an APKS/APKM matching this version. Listing map embed will not work after install (resigning breaks the Maps API key). |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide Ads](#hide-ads) | Hides Google, Nimbus, Moloco, Liftoff, in-feed promo tiles, Inbox banners, and the Go Premium bar. Note: patching OfferUp breaks the listing map embed (Maps API key is tied to the Play Store signature). |  |

</details>

<details open>
<summary>📦 ASL Bloom&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.36.63 |
| :---: |
| Use the XAPK matching your device architecture. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks ASL Bloom Premium lessons and features. |  |

</details>

<details open>
<summary>📦 Lumenate&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.1.3 |
| :---: |
| Download the arm64 XAPK from APKPure (not APKMirror). Use Morphe’s file picker if Continue opens Google. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks Lumenate Premium without a subscription. |  |

</details>

<details open>
<summary>📦 Sweepy&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 6.1.3 |
| :---: |
| Patch the device split APKs (base + arm64 + locale + density) or an APKS/APKM matching this version. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks Sweepy Premium features. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

JCAT Patches are licensed under the [GNU General Public License v3.0](LICENSE)
