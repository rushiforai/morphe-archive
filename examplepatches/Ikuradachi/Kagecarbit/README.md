# Kagecarbit

CarbitLink patches for use with Morphe.

## ❓ About

Kagecarbit focuses exclusively on patches for the CarbitLink Android app. Patch requests and bug reports should relate to CarbitLink.

This is an independent project, not affiliated with or endorsed by CarbitLink or the Morphe project. Available patches and supported app versions are listed below when published.

### How to use these patches

Click the button below, or manually add this repo URL to Morphe Manager: https://github.com/Ikuradachi/Kagecarbit

<a href="https://morphe.software/add-source?github=Ikuradachi/Kagecarbit">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/Ikuradachi/Kagecarbit/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 CarbitLink&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Package name:** `net.easyconn.carman.wws`

**🎯 Supported versions:**

| 6.5.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable tracking and analytics (Experimental)](#disable-tracking-and-analytics-experimental) | Attempts to block background telemetry and trackers. Not guaranteed to stop 100% of data collection. |  |
| [Enable browser](#enable-browser) | Shows the browser in the projected mirror grid for non-SDK mode. |  |
| [GmsCore support](#gmscore-support) | Uses Morphe GmsCore for Google sign-in and sign-out. |  |
| [Unlock VIP features](#unlock-vip-features) | Enables Mapbox, Google Maps, Spotify integration, and TwinSpace features. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Kagecarbit is licensed under the [GNU General Public License v3.0](LICENSE). See [NOTICE](NOTICE) for naming and branding restrictions.
