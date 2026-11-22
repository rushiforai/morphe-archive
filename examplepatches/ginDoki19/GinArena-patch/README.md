<div align="center">

<img src="assets/icon.png" width="96" alt="GinArena Patch" />

# GinArena Patch

**Curated [Morphe](https://morphe.software/) patches for Android utilities, media players, and TV apps — local-first, fingerprint-locked, and open source.**

<p>
  <a href="https://morphe.software/add-source?github=ginDoki19/GinArena-patch">
    <img src="https://img.shields.io/badge/Morphe-Add%20Patch%20Source-4F46E5?style=for-the-badge&logo=android&logoColor=white" alt="Add to Morphe" />
  </a>
  <a href="https://github.com/ginDoki19/GinArena-patch/releases/latest">
    <img src="https://img.shields.io/github/v/release/ginDoki19/GinArena-patch?style=for-the-badge&label=stable&color=16A34A" alt="Latest Stable Release" />
  </a>
  <a href="https://github.com/ginDoki19/GinArena-patch/releases">
    <img src="https://img.shields.io/github/v/release/ginDoki19/GinArena-patch?include_prereleases&style=for-the-badge&label=dev&color=D97706" alt="Latest Dev Release" />
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/github/license/ginDoki19/GinArena-patch?style=for-the-badge&color=0EA5E9" alt="License" />
  </a>
  <a href="https://github.com/ginDoki19/GinArena-patch/stargazers">
    <img src="https://img.shields.io/github/stargazers/ginDoki19/GinArena-patch?style=for-the-badge&color=EAB308" alt="GitHub Stars" />
  </a>
</p>

**Quick add in Morphe Manager:** [Open source link](https://morphe.software/add-source?github=ginDoki19/GinArena-patch) · or add manually: `github.com/ginDoki19/GinArena-patch`

</div>

> [!TIP]
> Morphe Manager automatically filters patches by package, so picking an app only shows compatible patches. All detailed guides below are collapsed — expand only what you need.

---

## 🩹 Patches list

The bundle summary below is refreshed automatically by the release workflow.

<!-- PATCHES_START -->
> **[v2.13.0](https://github.com/ginDoki19/GinArena-patch/releases/tag/v2.13.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;42 patches total&nbsp;&nbsp;•&nbsp;&nbsp;**[⬇️ Download patches-2.13.0.mpp](https://github.com/ginDoki19/GinArena-patch/releases/download/v2.13.0/patches-2.13.0.mpp)**
<details>
<summary>📦 1DM&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 20.0 |
| :---: |
| Universal APKM (160-640 dpi, Android 7.0+), build 30257 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AdBlocker turbo & userscript bundle](#adblocker-turbo--userscript-bundle) | Updates the built-in ad blocker automatically in seconds instead of minutes, and can add a shortlink bypass userscript. | • AdBlocker engine mode<br>• Bundle Bypass All Shortlinks userscript |
| [Browser setup prompts only once](#browser-setup-prompts-only-once) | Shows the one-time browser setup prompts only once, even if you close the browser early. |  |
| [Optimize cold start and battery](#optimize-cold-start-and-battery) | Makes the app open faster, use less battery in the background, and stay in Recents when you press Back. |  |
| [Preset browser settings](#preset-browser-settings) | Sets Brave as the default search engine on fresh installs. You can change it anytime in 1DM. | • Search engine<br>• Search suggestions<br>• Search by image |
| [Remove ads and promotions](#remove-ads-and-promotions) | Removes banner and popup ads, upgrade offers, and sponsored shortcuts. |  |

</details>

<details>
<summary>📦 MX Player&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 3.4.1 | 3.4.3 |
| :---: | :---: |
| Standalone APK (arm64-v8a / armeabi-v7a, Android 7.0+), build 2001003551 | Standalone APK (arm64-v8a / armeabi-v7a, Android 7.0+), build 2001003553 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Clean Me page](#clean-me-page) | Removes Status Saver, Legal, and Help from the Me page. |  |
| [Custom codec](#custom-codec) | Bundles an MX Player custom codec; official v3.1.0_r1 codecs are verified. | • Custom codec file<br>• Allow unverified codecs |
| [Remove ads & bloat](#remove-ads--bloat) | Removes ads and online extras like Live TV, Tube, Shorts, and Games for a clean local player. |  |
| [Remove bottom navigation bar](#remove-bottom-navigation-bar) | Removes the bottom navigation bar and moves Me to the top-right corner. |  |

</details>

<details>
<summary>📦 Daylio&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 1.72.0 |
| :---: |
| APKM (arm64-v8a / armeabi-v7a / x86 / x86_64, 480-640 dpi, Android 8.0+), build 291 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable premium](#enable-premium) | Unlocks Daylio's local premium state. Account- or server-dependent features (restore purchase, cloud entitlements) still behave as they do on a free account; this is not a purchase. |  |
| [Google Drive backup via MicroG RE](#google-drive-backup-via-microg-re) | Makes the Google Drive backup sign-in work on a re-signed Daylio by signing in as the original app, and stops the "won't run without Google Play services" dialog. Needs MicroG RE installed with a Google account added. Daylio's local journal and every other feature are unaffected. | • Sign in as the original app<br>• Send Google calls to MicroG<br>• Let the app find Google and MicroG |
| [Remove promos & partner ads](#remove-promos--partner-ads) | Removes Daylio's built-in advertising: the BetterHelp partner offer, the cross-promotion cards for the developer's other apps, and the "More Great Apps" row that opens a screen of their app catalogue. Daylio has no ad network; the journal, statistics and backups are untouched. | • Hide the BetterHelp partner banner<br>• Hide the "try our other app" cards |
| [Remove tracking & marketing](#remove-tracking--marketing) | Daylio ships no ad SDK - this build has none to block. It does ship Firebase Analytics, Tag Manager, Crashlytics and the advertising-ID permissions; this turns those off. Every part is switchable. | • Turn off analytics<br>• Turn off crash reporting<br>• Remove advertising-ID and install-referrer access<br>• Remove discount notifications |

</details>

<details>
<summary>📦 CRICFy TV&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 7.5 |
| :---: |
| Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 7.0+), build 55 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix search keyboard focus](#fix-search-keyboard-focus) | Opens search on Android TV and helps keep the keyboard connected during category searches on TV and phones. Clears TV search on navigation or close. |  |
| [Hide playback controls at stream open](#hide-playback-controls-at-stream-open) | Keeps playback controls hidden when a stream opens or the player switches between embedded and fullscreen. The controls remain available. |  |
| [Improve Android TV playback controls](#improve-android-tv-playback-controls) | On Android TV, prefers the seekbar when controls open and helps retain focus when live-source tabs auto-focus. Seeking depends on the stream. |  |
| [Pin favourite categories to the top](#pin-favourite-categories-to-the-top) | Long-press a category to pin it to the top of the Category list. Long-press a pinned category to reorder it. On Android TV the menu offers Arrange to move several in one go, Move to top, Move left and Move right one place, and Move up and Move down a whole row. On a phone it offers Move left, Move right, Move to top and Unpin, one place at a time. The order you choose is the order you get, and it survives a restart. Nothing moves until you pin something. |  |
| [Remove ads, proxy & restrictions](#remove-ads-proxy--restrictions) | Stops background bandwidth sharing, removes ads, and hides the player app logo on 7.5. | • Hide promo marquee ticker<br>• Bypass update & force-update screen<br>• Block promotional push notifications<br>• Bypass clone, work-profile & sniffer checks<br>• Strip unused ad native libraries |

</details>

<details>
<summary>📦 WPS Office&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 26.11.1 |
| :---: |
| Standalone APK (arm64-v8a, Android 10+), build 1651, APKMirror |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Google sign-in via MicroG RE](#google-sign-in-via-microg-re) | Makes Google sign-in work on a re-signed WPS by signing in as the original app. Needs MicroG RE installed with a Google account added. WPS account login is unaffected. | • Sign in as the original app<br>• Send Google calls to MicroG<br>• Report Play services as available<br>• Route notifications through MicroG<br>• Let the app find Google and MicroG |
| [Unlock premium features](#unlock-premium-features) | Opens the paid tools - PDF, export, editing, fonts and templates - by answering the app's payment checks. Every part has its own switch, so you choose what is unlocked. Sign in first: signed out, WPS reports no membership at all. | • Unlock premium tools (main switch)<br>• Show a Pro account<br>• Open Pro menus<br>• Pass ownership checks<br>• Remove ads<br>• Hide the "already a member" popup<br>• Hide the upgrade banner on tool pages<br>• Turn AI features off<br>• Skip the ad pre-check<br>• Report the stock signature |

</details>

<details>
<summary>📦 CrexiFy TV&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 4.5 |
| :---: |
| Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 6.0+), build 12 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide playback controls at stream open](#hide-playback-controls-at-stream-open) | Keeps playback controls hidden when a stream opens or the player switches between embedded and fullscreen. The controls remain available. |  |
| [Improve Android TV playback controls](#improve-android-tv-playback-controls) | Helps the Android TV remote reveal native playback controls and focus the seekbar when available. Live streams may not be seekable. |  |
| [Pin favourite categories to the top](#pin-favourite-categories-to-the-top) | Long-press a category to pin it to the top of the Category list. Long-press a pinned category to reorder it. On Android TV the menu offers Arrange to move several in one go, Move to top, Move left and Move right one place, and Move up and Move down a whole row. On a phone it offers Move left, Move right, Move to top and Unpin, one place at a time. The order you choose is the order you get, and it survives a restart. Nothing moves until you pin something. |  |
| [Remove configured startup and banner ads](#remove-configured-startup-and-banner-ads) | Suppresses configured startup/banner ads, the Telegram prompt and message ticker. |  |

</details>

<details>
<summary>📦 CricZ TV&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 7.3 |
| :---: |
| Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 6.0+), build 10 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide playback controls at stream open](#hide-playback-controls-at-stream-open) | Keeps playback controls hidden when a stream opens or the player switches between embedded and fullscreen. The controls remain available. |  |
| [Improve Android TV playback controls](#improve-android-tv-playback-controls) | Helps the Android TV remote reveal native playback controls and focus the seekbar when available. Live streams may not be seekable. |  |
| [Pin favourite categories to the top](#pin-favourite-categories-to-the-top) | Long-press a category to pin it to the top of the Category list. Long-press a pinned category to reorder it. On Android TV the menu offers Arrange to move several in one go, Move to top, Move left and Move right one place, and Move up and Move down a whole row. On a phone it offers Move left, Move right, Move to top and Unpin, one place at a time. The order you choose is the order you get, and it survives a restart. Nothing moves until you pin something. |  |
| [Remove ads, telemetry & restrictions](#remove-ads-telemetry--restrictions) | Removes ads, promo popups, and tracking, and keeps channels working after patching. | • Hide promo announcement bar<br>• Remove push notifications<br>• Bypass update & force-update screen<br>• Bypass root & sniffer checks<br>• Strip native & telemetry bloat |

</details>

<details>
<summary>📦 Playfy TV&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 1.7 |
| :---: |
| Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 5.0+), build 8 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide playback controls at stream open](#hide-playback-controls-at-stream-open) | Keeps playback controls hidden when a stream opens or the player switches between embedded and fullscreen. The controls remain available. |  |
| [Improve Android TV playback controls](#improve-android-tv-playback-controls) | On Android TV, prefers the seekbar over play/pause when controls open. Seeking depends on the stream. |  |
| [Pin favourite categories to the top](#pin-favourite-categories-to-the-top) | Long-press a category to pin it to the top of the Category list. Long-press a pinned category to reorder it. On Android TV the menu offers Arrange to move several in one go, Move to top, Move left and Move right one place, and Move up and Move down a whole row. On a phone it offers Move left, Move right, Move to top and Unpin, one place at a time. The order you choose is the order you get, and it survives a restart. Nothing moves until you pin something. |  |
| [Remove ads, telemetry & restrictions](#remove-ads-telemetry--restrictions) | Removes ads and tracking, and hides the player app logo. | • Remove push notifications<br>• Bypass update & force-update screen<br>• Bypass sniffer-app check<br>• Strip native & telemetry bloat |

</details>

<details>
<summary>📦 PlayZ TV&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 2.3.1 |
| :---: |
| Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 6.0+), build 8 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide playback controls at stream open](#hide-playback-controls-at-stream-open) | Keeps playback controls hidden when a stream opens or the player switches between embedded and fullscreen. The controls remain available. |  |
| [Improve Android TV playback controls](#improve-android-tv-playback-controls) | Helps the Android TV remote reveal native playback controls and focus the seekbar when available. Live streams may not be seekable. |  |
| [Pin favourite categories to the top](#pin-favourite-categories-to-the-top) | Long-press a category to pin it to the top of the Category list. Long-press a pinned category to reorder it. On Android TV the menu offers Arrange to move several in one go, Move to top, Move left and Move right one place, and Move up and Move down a whole row. On a phone it offers Move left, Move right, Move to top and Unpin, one place at a time. The order you choose is the order you get, and it survives a restart. Nothing moves until you pin something. |  |
| [Remove ads, popups & restrictions](#remove-ads-popups--restrictions) | Removes ads and promo popups, and keeps channels working after patching. |  |

</details>

<details>
<summary>📦 SK Tech TV&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 2.7 |
| :---: |
| Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 6.0+), build 17 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide playback controls at stream open](#hide-playback-controls-at-stream-open) | Keeps playback controls hidden when a stream opens or the player switches between embedded and fullscreen. The controls remain available. |  |
| [Improve Android TV playback controls](#improve-android-tv-playback-controls) | Helps the Android TV remote reveal native playback controls and focus the seekbar when available. Live streams may not be seekable. |  |
| [Pin favourite categories to the top](#pin-favourite-categories-to-the-top) | Long-press a category to pin it to the top of the Category list. Long-press a pinned category to reorder it. On Android TV the menu offers Arrange to move several in one go, Move to top, Move left and Move right one place, and Move up and Move down a whole row. On a phone it offers Move left, Move right, Move to top and Unpin, one place at a time. The order you choose is the order you get, and it survives a restart. Nothing moves until you pin something. |  |
| [Remove ads, telemetry & restrictions](#remove-ads-telemetry--restrictions) | Removes ads, tracking, and forced updates, and keeps channels working after patching. | • Remove push notifications<br>• Bypass update & force-update screen<br>• Bypass root & sniffer checks<br>• Strip native & telemetry bloat<br>• Disable WebActivity (potential ad surface) |

</details>

<details>
<summary>📦 AdGuard&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.15.2 | 4.16.0 |
| :---: | :---: |
| Universal APK (arm64-v8a, armeabi-v7a, x86, x86_64), Android 9+ | Universal APK (arm64-v8a, armeabi-v7a, x86, x86_64), Android 9+ |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock AdGuard Premium](#unlock-adguard-premium) | Opens the paid features and removes the license prompts. The app then reports a lifetime family license, so no purchase screen appears. |  |

</details>

<details>
<summary>📦 APK Decompiler&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.12.0 |
| :---: |
| Standalone APK (arm64-v8a / armeabi-v7a, Android 9.0+), build 4120 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock premium](#unlock-premium) | Unlocks local premium tools and cleans up VIP labels. |  |

</details>

<!-- PATCHES_END -->

<details>
<summary><b>🗺️ Supported Apps at a Glance</b> — 12 apps, exact target builds &amp; input formats</summary>
<br>

| App | Package | Target Version (Build) | Input Format |
|---|---|---|---|
| **1DM** | `idm.internet.download.manager` | `20.0` (`30257`) | Universal APKM |
| **MX Player** | `com.mxtech.videoplayer.ad` | `3.4.1` (`2001003551`), `3.4.3` (`2001003553`) | Standalone APK |
| **Daylio** | `net.daylio` | `1.72.0` (`291`) | APKM |
| **WPS Office** | `cn.wps.moffice_eng` | `26.11.1` (`1651`) | Standalone APK (`arm64-v8a`) |
| **AdGuard** | `com.adguard.android` | `4.15.2` (`42321001`), `4.16.0` (`42420015`) | Universal APK |
| **APK Decompiler** | `com.apktools.app.decompile` | `4.12.0` (`4120`) | Standalone APK |
| **CRICFy TV** | `com.cricfytv.sports` | `7.5` (`55`) | Universal APK |
| **CricZ TV** | `com.pro.cricztv` | `7.3` (`10`) | Universal APK |
| **CrexiFy TV** | `com.crexify.tv` | `4.5` (`12`) | Universal APK |
| **PlayZ TV** | `com.playz.tv` | `2.3.1` (`8`) | Universal APK |
| **SK Tech TV** | `com.live.sktechtv` | `2.7` (`17`) | Universal APK |
| **Playfy TV** | `com.playfy.tv` | `1.7` (`8`) | Universal APK |

</details>

---

## 📖 App & Patch Guides

<details>
<summary><b>📺 Shared TV Patches</b> — category pinning, playback controls, TV search &amp; debloat matrix</summary>
<br>

### Hide playback controls at stream open

*On by default* for **CRICFy TV, CricZ TV, CrexiFy TV, PlayZ TV, SK Tech TV, and Playfy TV**. Keeps player controls hidden when a stream opens or switches between embedded and fullscreen; controls remain available via touch or remote.

### Improve Android TV playback controls

*On by default* for **CRICFy TV 7.5, CricZ TV 7.3, PlayZ TV 2.3.1, CrexiFy TV 4.5, SK Tech TV 2.7, and Playfy TV 1.7** (depends on **Hide playback controls at stream open**). Prefers the seekbar over play/pause on TV when controls open, restores player focus across transitions, and on CRICFy multi-source streams helps retain seekbar focus when source tabs auto-focus. Seeking depends on stream support; SK Tech still needs a real-device playback/remote check.

### Pin favourite categories to the top

*Off by default* across all six TV apps (tick when patching if you want category pinning).

- **Pin / Unpin & Reorder:** Long-press any category to pin it to the top of the list; long-press a pinned category to reorder (`Arrange`, `Move to top`, `Move left/right`, `Move up/down` on TV; one-step move & `Unpin` on phones).
- **Local & non-intrusive:** Order is stored locally in app preferences; nothing moves until you pin something, and stock long-press on non-category items is untouched.
- **Shared extension:** Powered by one shared `extensions/playfy.mpe` module (`Pins`) hooked per app at patch time.

### Fix search keyboard focus

*On by default* for **CRICFy TV 7.5 (build 55)**. Opens search on Android TV, keeps the soft keyboard connected during category searches on TV/phones, and clears TV search when navigating away or closing the search bar (hiding only the keyboard preserves the query).

### Remove ads, telemetry & restrictions

*On by default* for **CricZ TV 7.3, SK Tech TV 2.7, and Playfy TV 1.7** — removes ads, promo popups, push notifications, and telemetry while keeping channels working:

| Option | CricZ TV | SK Tech TV | Playfy TV | Notes |
|---|:---:|:---:|:---:|---|
| Hide promo announcement bar | **on** | — | — | Hides top promo banner |
| Remove push notifications | **on** | **on** | **on** | Blocks promo push & permission prompts |
| Bypass update & force-update screen | **on** | **on** | **on** | Skips forced update lockouts |
| Bypass root & sniffer checks | off | off | — | Enable only if stock refuses to open on your device |
| Bypass sniffer-app check | — | — | off | Enable only if blocked by installed network tools |
| Strip native & telemetry bloat | off | off | off | Removes unused libs/telemetry to save space |
| Disable WebActivity (potential ad surface) | — | off | — | Blocks in-app web views (score pages also close) |

</details>

<details>
<summary><b>📦 1DM</b> (<code>20.0</code>, build <code>30257</code>) — Cloud AdBlocker, cold-start boost &amp; stock APKM</summary>
<br>

Makes free **1DM 20.0** (`idm.internet.download.manager`) a fast, ad-free downloader and browser. *Does not unlock paid 1DM+ features or include 1DM+ code.*

#### AdBlocker turbo & userscript bundle

*On by default.* Keeps the 28-list (~1.22M rules) ad blocker updated via **AdBlocker engine mode**:
- **☁️ Cloud (default):** Downloads weekly prebuilt filters in ~2 seconds (falls back to Local Turbo if you add custom lists, and keeps existing filters if a build is delayed).
- **⚡ Local Turbo:** Rebuilds filters locally much faster than stock, updating weekly.
- **Stock:** Leaves 1DM's built-in builder unchanged.
- **Bypass All Shortlinks** userscript *(on by default)*: Mobile-focused, self-updating, respects your toggle, and stays deleted if removed.

#### Optimize cold start and battery

*On by default.* Defers loading the browser engine until needed, stops background battery drain when minimized, and keeps 1DM in Recents on **Back** (drawer **Exit** still closes completely).

#### Remove ads and promotions

*On by default.* Strips banner/popup ads, *"Rate 1DM"* / *"Upgrade to 1DM+"* nags, VPN/sale promos, sponsored shortcuts, and ~10 MB of ad/tracking SDKs without affecting downloads, torrents, or the browser.

#### Browser setup prompts only once

*Off by default.* Shows one-time browser setup prompts (default browser, accessibility, adblocker) only once even if dismissed early.

#### Preset browser settings

*Off by default.* Sets Brave as the default search engine on fresh installs and Google for image search (existing settings are preserved and remain editable).

| Field | Value |
|---|---|
| Package & Version | `idm.internet.download.manager` — **20.0** (build `30257`, not `20257`) |
| Stock Download | [APKMirror — 1DM 20.0 universal APKM (160–640 dpi, Android 7.0+)](https://www.apkmirror.com/apk/Vicky%20Bonick/idm-download-video-movie-music-anime-torrent/1dm-browser-video-download-20-0-release/1dm-browser-video-download-20-0-2-android-apk-download/) *(Uptodown 20.0 XAPK also works if selected directly in Morphe)* |
| APKM SHA-256 | `4c36d570f5cdbbbdbba4d2217aba33ed0e1bbf6179e6eb3b9eb17d936124b005` |
| `base.apk` SHA-256 | `b55935a4435da5d3623aa8c94384039d9f07128a58ba1a93f427a5a21924c3ab` |
| Signing Cert SHA-256 | `9f48b6b2741fe7e4f78ea7375f469e99086c07f45a6c7f38407f0483d2451ce7` |

</details>

<details>
<summary><b>📦 MX Player</b> (<code>3.4.1</code> / <code>3.4.3</code>) — Ad-free local player, custom codec &amp; stock APKs</summary>
<br>

Turns free **MX Player** (`com.mxtech.videoplayer.ad`) into a lightweight local player with minimal toggles. *(For deep customization, see [BlazeFTL/FTL-Patches](https://github.com/BlazeFTL/FTL-Patches).)*

<a id="remove-ads-bloat"></a>
#### Remove ads & bloat

*On by default.* Removes all ads and disables **Live TV**, **OTT**, **MX Tube**, **Shorts**, and **Games**, keeping **Local Music**, **Continue Watching**, and all **32 Classic Themes**.

#### Clean Me page

*On by default.* Removes Status Saver, Legal, Help, and promos from the **Me** tab while keeping App Theme, Settings, Data Privacy, and Custom Pop-up Play.

#### Remove bottom navigation bar

*Off by default.* Hides the bottom bar for a full-height folder view and moves **Me** to the top-right.

#### Custom codec

*Off by default.* Bundles official `v3.1.0_r1` **AIO**, **ARMv7**, or **ARM64** codec ZIPs (dual-ABI APKs fetch and verify the companion codec automatically when online). Unverified codecs require **Allow unverified codecs** and must cover all APK ABIs.

> [!IMPORTANT]
> Download the **standalone `.apk`** (~111 MB), **not** an `.xapk`, `.apkm`, or split `BUNDLE`.

| Field | Value |
|---|---|
| Package & Versions | `com.mxtech.videoplayer.ad` — **3.4.1** (`2001003551`) & **3.4.3** (`2001003553`), standalone APK (`arm64-v8a` + `armeabi-v7a`, Android 7.0+) |
| Stock APKs | [APKPure (`3.4.1` APK)](https://apkpure.com/mx-player-app/com.mxtech.videoplayer.ad/versions) · [Uptodown (`3.4.1` APK)](https://mx-player.en.uptodown.com/android/versions) · [APKMirror (`3.4.3` standalone APK)](https://www.apkmirror.com/apk/amazon-mobile-llc/mx-player/mx-player-3-4-3-release/mx-player-3-4-3-2-android-apk-download/) |
| `3.4.1` APK SHA-256 | `db775bd81460e31bd21602cf0b842bc3e2fd769b0bd23250e70036cc4cf95bf4` |
| Signing Cert SHA-256 | `0d9b4c778672e753d45aba4f10df31e1d10bf75b1245469131ef01b82f0f91b6` |
| Optional Codec (`v3.1.0_r1`) | [`aio-v3.1.0_r1.zip`](https://github.com/iDNA420/MX-FFmpeg/releases/tag/v3.1.0_r1) (`SHA-256: ebb0bd5db0f855caca6167747987a229836d7cc0062a2d5c23dbf91d057c617b` — keep zipped) |

</details>

<details>
<summary><b>📺 CRICFy TV</b> (<code>7.5</code>, build <code>55</code>) — Proxy removal, TV fixes &amp; stock APK</summary>
<br>

#### Remove ads, proxy & restrictions

*On by default.* Cleans **CRICFy TV 7.5** for phones, tablets, and Android TV:
- **Disables CashRaven proxy & consent prompt** — stops background bandwidth sharing and suppresses the launch consent dialog without faking preferences.
- **No ads, sponsor gates, or startup Telegram popup** (drawer links still work); hides the player app logo while keeping broadcaster logos and live channel configs working.
- **Options:** *On:* hide promo ticker, skip forced updates, block promo push. *Off:* bypass clone/sniffer checks, strip unused Unity ad native libs (~2 MB saved).

| Field | Value |
|---|---|
| Package & Version | `com.cricfytv.sports` — **7.5** (build `55`, universal APK). Only `7.5` is supported. |
| Stock Download | [cricfyapk.io/download/](https://cricfyapk.io/download/) or official Telegram |
| APK SHA-256 | `a6c12f1c5bdc1eff9da78788b27560c9c6fed7527b32e267f207eb746f0a23b7` |
| Signing Cert SHA-256 | `f2cd86fcbc92461a3300cec47b6f74d20f0c89dd7162ecc333b3dd2c16e79841` |

</details>

<details>
<summary><b>📺 CricZ TV</b> (<code>7.3</code>, build <code>10</code>) — Ad/telemetry removal &amp; stock APK</summary>
<br>

Uses **Remove ads, telemetry & restrictions** *(on by default)* to strip banners, popups, sponsor countdowns, the built-in ad server, startup Telegram popup, video watermarks, and telemetry/push bloat while keeping channels working.

| Field | Value |
|---|---|
| Package & Version | `com.pro.cricztv` — **7.3** (build `10`, universal APK). Only `7.3` is supported. |
| Stock Download | Official Telegram: [t.me/cricztvapp](https://t.me/cricztvapp) |
| APK SHA-256 | `74a8a13da7ab1865dc9e3bbb511fe82bb0f8c093fcf2404ac4a59ecdce44fb82` |
| Signing Cert SHA-256 | `9ff349c0c047abd68e169980484b43926b6ff2d251a430fe44e3ae3e2930e1d2` |

</details>

<details>
<summary><b>📺 CrexiFy TV</b> (<code>4.5</code>, build <code>12</code>) — Ad removal, signer fix &amp; stock APK</summary>
<br>

#### Remove configured startup and banner ads

*On by default.* Suppresses startup/banner ads, the automatic Telegram prompt, and the promo ticker (including other server notices on the ticker; manual links remain). Also adapts the signer-bound decoder and disables its startup integrity check for re-signed builds.

| Field | Value |
|---|---|
| Package & Version | `com.crexify.tv` — **4.5** (build `12`, universal APK). Only `4.5` is supported. |
| APK SHA-256 | `76f9bac391a3b109025f465dd922b6d14555acd4806dd994e2156022c0bc76c7` |
| Signing Cert SHA-256 | `17e2ae241663794ce890f350e1e0d884c59727418bac22518a62ac2e66131062` |

</details>

<details>
<summary><b>📺 PlayZ TV</b> (<code>2.3.1</code>, build <code>8</code>) — Ad/popup removal &amp; stock APK</summary>
<br>

#### Remove ads, popups & restrictions

*On by default.* Removes ads, timed popunder pages, and the automatic Telegram popup while keeping manual links, permissions, and channels untouched.

| Field | Value |
|---|---|
| Package & Version | `com.playz.tv` — **2.3.1** (build `8`, universal APK). Only `2.3.1` is supported. |
| APK SHA-256 | `003c8b6e9afe4a3f17ab45112a99ad8d2bf715f1981a521c61dab5f453a1d827` |
| Signing Cert SHA-256 | `05ecca660d7656ce2c65a878c9e49a169558c2a44976f26c369393eccf9dc44b` |

</details>

<details>
<summary><b>📺 SK Tech TV</b> (<code>2.7</code>, build <code>17</code>) — Ad/telemetry removal &amp; stock APK</summary>
<br>

Uses **Remove ads, telemetry & restrictions** *(on by default)* to skip ads and sponsor gates so streams open directly in the player. Includes optional toggles for root/sniffer bypass, native bloat stripping, and disabling `WebActivity` *(off by default; also closes score pages)*.

| Field | Value |
|---|---|
| Package & Version | `com.live.sktechtv` — **2.7** (build `17`, universal APK). Only `2.7` is supported. |
| Stock Download | [sktech.site](https://sktech.site/) · [Official download page](https://downloadsktech.pages.dev/download) |
| APK SHA-256 | `5095235d7a77e588d570780cea99a25dd807c9cb3ee814e450af82a49423cdcd` |
| Signing Cert SHA-256 | `9ff349c0c047abd68e169980484b43926b6ff2d251a430fe44e3ae3e2930e1d2` |

</details>

<details>
<summary><b>📺 Playfy TV</b> (<code>1.7</code>, build <code>8</code>) — Ad/telemetry removal &amp; stock APK</summary>
<br>

Uses **Remove ads, telemetry & restrictions** *(on by default)* to remove pre-roll/banner/sponsor ads, the startup Telegram popup, the player app logo, forced updates, and installed-app checks while keeping channels working. *(Note: on one tested device Playfy stayed on the splash screen — still under investigation.)*

| Field | Value |
|---|---|
| Package & Version | `com.playfy.tv` — **1.7** (build `8`, universal APK). Only `1.7` is supported. |
| Stock Download | [playfytv.vip](https://playfytv.vip/) |
| APK SHA-256 | `2a05ce967df3eb355de8f64b3c675cbc6e97b768e80fd10c54bdb6c7ac80df51` |
| Signing Cert SHA-256 | `38cde288f060fa8f476ab6811ff215767c35117bf6248fd8ad157cd4566898cc` |

</details>

<details>
<summary><b>📦 Daylio</b> (<code>1.72.0</code>, build <code>291</code>) — Local premium, MicroG Drive backup &amp; stock APKM</summary>
<br>

> [!CAUTION]
> Always create and verify a Daylio backup before testing. Never uninstall an existing install on a signature mismatch without a verified backup.

#### Enable premium

*On by default.* Unlocks Daylio's **local** premium state at its preference reader/writer without faking purchases. Cloud/restore entitlements remain server-controlled.

#### Google Drive backup via MicroG RE

*Off by default* — enable only if you use **MicroG RE 7.3.1** (`app.revanced.android.gms`) instead of Google Play Services. Leave all three options **on** together:

| Option | Default | Effect |
|---|:---:|---|
| Sign in as the original app | **on** | Supplies Daylio's original package/SHA-1 to MicroG for Google OAuth |
| Send Google calls to MicroG | **on** | Routes Play Services calls to MicroG and suppresses the *"won't run without Google Play services"* dialog |
| Let the app find Google and MicroG | **on** | Adds Android 11+ `<queries>` visibility for both Play Services packages |

#### Remove promos & partner ads

*On by default.* Hides the BetterHelp top-bar icon/screen and the developer's cross-promo cards / *"More Great Apps"* row.

#### Remove tracking & marketing

*On by default.* Daylio ships **no ad SDK** — this disables Firebase Analytics/Tag Manager, Crashlytics, and `AD_ID`/install-referrer permissions (with an optional *off-by-default* toggle to mute discount offer notifications). Entries, stats, and backups are untouched.

| Field | Value |
|---|---|
| Package & Version | `net.daylio` — **1.72.0** (build `291`, Android 8.0+, APKM). `1.71.1` is no longer supported. |
| Stock Download | [APKMirror — Daylio 1.72.0 APKM](https://www.apkmirror.com/apk/habitics/daylio-diary-journal-mood-tracker/daylio-journal-mood-tracker-1-72-0-release/) |
| APKM SHA-256 | `65dfbb7892e7cd7e1fef76e05fd036c7d1327d61402e3b573af3762d3b879074` |
| Signing Cert SHA-256 | `6afb7e4100413a77e13b6a1e4f8ac1f9e3421862b3678fb9abe6aa531e859a9d` |

</details>

<details>
<summary><b>📦 WPS Office</b> (<code>26.11.1</code>, build <code>1651</code>) — Local Pro tools, MicroG sign-in &amp; stock APK</summary>
<br>

> [!IMPORTANT]
> Uninstall stock WPS first (back up local files) and **sign in** on the patched app — WPS reports no membership while signed out. On first launch, back out of Google One Tap if it stalls and sign in on the regular login screen underneath.

#### Unlock premium features

*On by default.* Unlocks **on-device** tools (PDF split/merge/compress, image export, watermark-free save, local OCR, bundled Pro fonts/templates). Cloud AI, cloud conversion/OCR, cloud storage, and remote `func_switch`/`/auth_query` features are server-authorized and cannot be unlocked client-side.

| Option | Default | Effect |
|---|:---:|---|
| **Unlock premium tools (main switch)** | **on** | Answers local entitlement checks as Pro |
| Show a Pro account / Open Pro menus / Pass ownership checks | **on** | Displays Pro status and opens local tools/fonts/templates |
| Remove ads / Hide "already a member" / Hide tool-page upgrade banner | **on** | Removes ads and membership banners/popups |
| Turn AI features off / Skip the ad pre-check / Report the stock signature | **off** | Optional troubleshooting & analytics tweaks |

#### Google sign-in via MicroG RE

*Off by default* — enable only when using MicroG RE (leave off with real Play Services). Keeps all 5 sub-options on: spoofs original package/cert to MicroG, routes calls/notifications through MicroG, reports Play Services available, and adds Android 11+ visibility.

| Field | Value |
|---|---|
| Package & Version | `cn.wps.moffice_eng` — **26.11.1** (build `1651`, standalone `arm64-v8a` APK, Android 10+). `26.11.0` is dropped. |
| Stock Download | [APKPure — WPS Office `26.11.1` APK](https://apkpure.com/wps-office-pdf-doc-editor/cn.wps.moffice_eng) |
| APK SHA-256 | `ef7b6b169831ad1c98fd2231942049879003fb44cc154b0007f647844b868fea` |
| Signing Cert SHA-256 | `643990878d3ca83952a5be5f3e58d9f8bb6cdc57bf0f228700212071c68db3d7` |

</details>

<details>
<summary><b>📦 AdGuard</b> (<code>4.15.2</code> &amp; <code>4.16.0</code>) — Lifetime family state, HTTPS CA guide &amp; stock APKs</summary>
<br>

#### Unlock AdGuard Premium

*On by default.* Sets AdGuard's single licence store to a lifetime family licence and ignores free-tier server overwrites, unlocking Ad blocking, DNS/HTTPS filtering, and Firewall/per-app rules without extra switches. Targets the phone APK (`adguard-4.15.2.apk` / `adguard-4.16.apk`); the separate TV APK is not audited.

**HTTPS filtering & Personal CA:** This patch modifies 3 classes (`29,311` total in `4.15.2`, `28,745` in `4.16.0`) and leaves all 32 native libraries untouched — AdGuard still generates its own local `Adguard Personal CA` on your device. Because switching from stock requires uninstalling first (deleting the old private key), export custom rules beforehand, remove any leftover old *"Adguard Personal CA"* under *Settings → Security → Encryption & credentials → User credentials*, and install the new certificate generated by the patched app (or leave HTTPS filtering off and use DNS filtering).

| Field | Value |
|---|---|
| Package & Targets | `com.adguard.android` — **4.15.2** (`42321001`) & **4.16.0** (`42420015`), universal APK, Android 9+ |
| Stock 4.16.0 (`42420015`) | [GitHub Releases — `adguard-4.16.apk`](https://github.com/AdguardTeam/AdguardForAndroid/releases/tag/v4.16) · SHA-256 `14e1199eee2600f3200d24a6a6488b5b09277f010252e979ab7c5b2d8cdd226c` |
| Stock 4.15.2 (`42321001`) | [GitHub Releases — `adguard-4.15.2.apk`](https://github.com/AdguardTeam/AdguardForAndroid/releases/tag/v4.15.2) · SHA-256 `29c99a8ca2563be68a41f91cb68b624bfe5434157d59a0f7f96c344ee3c58546` |
| Signing Cert SHA-256 | `bdcc3c69c26d4627773ae6d7e7e5b2c89e94ed8dc02261525ff80ac4c9412db7` |

</details>

<details>
<summary><b>📦 APK Decompiler</b> (<code>4.12.0</code>, build <code>4120</code>) — Local VIP unlock &amp; stock APK</summary>
<br>

#### Unlock premium

*On by default.* Enables local premium tools and cleans up VIP labels/buttons (does not grant server-side features or a Play purchase).

| Field | Value |
|---|---|
| Package & Version | `com.apktools.app.decompile` — **4.12.0** (build `4120`, `arm64-v8a` / `armeabi-v7a` standalone APK, Android 9.0+) |
| Stock Download | [APKPure — APK Decompiler `4.12.0`](https://apkpure.com/decompile-app-based-on-jadx/com.apktools.app.decompile) |
| APK SHA-256 | `f85934cf2c0ce8224b0fccb4c0d631813cfd028680d0c23ef28ea886a9d1053b` |
| Signing Cert SHA-256 | `80c8e7990b68af1301f76057e7eabe63de4240e3ca74da46c36a9c8084c68386` |

</details>

---

<details>
<summary><b>🚀 How to Use (Morphe Manager)</b> — step-by-step setup, updating &amp; rules</summary>
<br>

1. Add this repo in Morphe Manager via the [Add Patch Source](https://morphe.software/add-source?github=ginDoki19/GinArena-patch) link or `github.com/ginDoki19/GinArena-patch`. *(If third-party sources/patches are hidden, enable **Expert Mode** in Morphe settings.)*
2. Download the exact **stock** `.apk` or `.apkm` matching the app section above (and verify its SHA-256).
3. In Morphe Manager, choose **Select from storage** and pick the downloaded stock file (for MX Player's optional **Custom codec**, tap its gear icon and pick `aio-v3.1.0_r1.zip` directly without unzipping).
4. Review options, patch, and install. *(Keep your Morphe signing key backed up — updating in place requires the same signing key.)*

> [!IMPORTANT]
> - **Never re-patch an already-patched APK.** Always start from the clean stock file above.
> - **Do not force-patch unsupported versions** in Expert Mode; new versions require a fingerprint audit.
> - **1DM 20.0** includes cloud adblocker updates and cold-start optimizations. Other apps that are already working do not need re-patching just because the bundle version bumped.

</details>

<details>
<summary><b>❓ FAQ &amp; Troubleshooting</b> — signature conflicts, MicroG RE &amp; server checks</summary>
<br>

- **Why does Android say "App not installed / conflicts with existing package"?**
  Patched APKs are signed with your Morphe key, not the original developer key. Back up your app data first, uninstall the stock build, then install the patched build.
- **When do I enable the MicroG RE patches (Daylio / WPS)?**
  Only if your device uses MicroG RE instead of Google Play Services. Leave them **off** on devices with standard Google Play Services.
- **Why aren't server-side AI or cloud features unlocked?**
  Client patches only modify on-device checks. Features verified or executed by a remote server (cloud storage, cloud AI, Play entitlements) cannot be unlocked locally.

</details>

<details>
<summary><b>🛠️ Building &amp; Contributing</b> — Gradle build, semantic commits &amp; CI release flow</summary>
<br>

**Requirements:** JDK 21 and a GitHub token with `read:packages` (`gpr.user`/`gpr.key` in Gradle properties, or `GITHUB_ACTOR`/`GITHUB_TOKEN` env vars).

```bash
bash gradlew :patches:buildAndroid
# output: patches/build/libs/patches-*.mpp
```

- **Commit convention:** `feat:`, `fix:`, `chore:`. Pushing to `dev` cuts a pre-release; merging `dev` into `main` (merge commit, not squash) cuts a stable release and auto-back-merges.
- **Generated files:** Do not manually edit `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`, or the `<!-- PATCHES_START -->` block in `README.md`; CI regenerates them on release.

</details>

<details>
<summary><b>🙏 Credits, Disclaimer &amp; License</b> — upstream acknowledgements &amp; GPL-3.0</summary>
<br>

### Credits

- [Epxec/android-patches](https://github.com/Epxec/android-patches) — original Daylio premium patch idea (`1.69.2`, re-derived for `1.71.1` and `1.72.0`).
- [BlazeFTL/FTL-Patches](https://github.com/BlazeFTL/FTL-Patches) — inspiration for MX Player patches.
- [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) — earlier WPS Office & AdGuard patch ideas (rebuilt from scratch for current builds).
- [callMeBeyonder/morphe-patches](https://github.com/callMeBeyonder/morphe-patches) — initial CRICFy TV patch inspiration.
- [rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches) — earlier AdGuard patch reference.
- [Morphe](https://morphe.software/) — Morphe Patcher and Morphe Manager.

### Disclaimer & License

These patches modify app files locally on your device for personal/educational use. Support app developers by purchasing official paid editions (such as 1DM+) when you enjoy their software.

Licensed under the [GNU General Public License v3.0](LICENSE).

</details>
