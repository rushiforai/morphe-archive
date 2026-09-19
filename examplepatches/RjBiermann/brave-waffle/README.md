# 🧩 Morphe patches

Custom patches for the [Morphe](https://morphe.software) patcher.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=RjBiermann/brave-waffle

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.8.0](https://github.com/RjBiermann/brave-waffle/releases/tag/v1.8.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;10 patches total
<details open>
<summary>📦 AIS&nbsp;&nbsp;•&nbsp;&nbsp;10 patches</summary>
<br>

**🎯 Supported versions:**

| 6.7.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass TV PRO check on site browsing](#bypass-tv-pro-check-on-site-browsing) | Requests site video data with isTV=false so browsing sites on the TV UI does not require a PRO membership server-side. |  |
| [Hide account/PRO nav links](#hide-account-pro-nav-links) | Adds a settings toggle ('Hide account / PRO links') that hides the account and PRO-only entries (Your Account, Get Free PRO, PRO Benefits, PornDB, Global Search, PornTabs) from the mobile navigation drawer. Off by default. |  |
| [Mod settings page](#mod-settings-page) | Adds an 'AIO Mods' section with runtime toggles to the app's own settings screens (phone settings fragment and TV settings). |  |
| [Remove TV player error dialog](#remove-tv-player-error-dialog) | Suppress the 'Error occured' popup on playback failures. Toggleable in the settings screens ('Show player errors' on TV). |  |
| [Remove ads](#remove-ads) | Removes video ad breaks from the standard and popup video players. |  |
| [Remove news promotions](#remove-news-promotions) | Removes the third-party paysite promotion banner from the startup news page. |  |
| [Remove search ad tiles](#remove-search-ad-tiles) | Removes the ad-tracker tiles (porn-app.com/nat1, /midad) from site search results. |  |
| [Spoof app signature](#spoof-app-signature) | Reports the original app signature to the API so patched builds are not rejected. |  |
| [Unlock PRO](#unlock-pro) | Unlocks all PRO features permanently. |  |
| [Use free sites on TV without account](#use-free-sites-on-tv-without-account) | Bypasses the 'User Account needed' gate so free sites are listed and playable on the TV UI without a user account. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

AIS Patches are licensed under the [GNU General Public License v3.0](LICENSE)
