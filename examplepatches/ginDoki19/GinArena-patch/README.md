# <img src="assets/icon.png" width="36" alt=""> GinArena Patch

**GinArena Patch** is a [Morphe](https://morphe.software/) patch bundle for free **1DM**
(`idm.internet.download.manager`), **CRICFy TV** (`com.cricfytv.sports`), **CricZ TV**
(`com.pro.cricztv`), **PlayZ TV** (`com.playz.tv`), and **MX Player** (`com.mxtech.videoplayer.ad`). Morphe Manager automatically
filters patches per app, so selecting an app shows only the patches compatible with that app.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=ginDoki19/GinArena-patch

Or manually add this repository as a remote source in Morphe Manager:

```text
github.com/ginDoki19/GinArena-patch
```

## 🩹 Patches list

<!-- PATCHES_START -->
> **[v2.5.1](https://github.com/ginDoki19/GinArena-patch/releases/tag/v2.5.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;13 patches total
<details open>
<summary>📦 1DM&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 20.0 |
| :---: |
| Universal APKM (160-640 dpi, Android 7.0+), build 30257 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AdBlocker turbo & userscript bundle](#adblocker-turbo-userscript-bundle) | Syncs SHA-256-verified pre-compiled AdBlocker binary engines + per-list filter archives (28 default lists, ~1.22M active rules) automatically in the background with instant Hosts & filters hydration, accelerates on-device filter compilation via 64 KB write buffering + foreground thread scheduling, and optionally seeds and auto-updates the mobile-adapted Bypass All Shortlinks userscript. | • AdBlocker engine mode<br>• Bundle Bypass All Shortlinks userscript |
| [Browser setup prompts only once](#browser-setup-prompts-only-once) | Shows the default-browser, accessibility, shortcut-menu-strip, and adblocker setup prompts once, recording each as shown as soon as it appears so closing the browser before dismissing cannot make it repeat. |  |
| [Optimize cold start and battery](#optimize-cold-start-and-battery) | Eliminates cold-start Chromium WebView initialization in Download Manager and background services, defers Browser AdBlock filter parsing until Browser launch, defers the CheckAppVersion subprocess past startup, pauses MainActivity's 1 Hz background wakeup loop when minimized, and keeps 1DM alive in Android Recents on Back press without killing background downloads. |  |
| [Preset browser settings](#preset-browser-settings) | Sets fresh-install browser fallbacks for normal and incognito modes: Brave search, matching suggestions, and Google search by image by default. Saved or imported choices are preserved and can be changed later in 1DM. | • Search engine<br>• Search suggestions<br>• Search by image |
| [Remove ads and promotions](#remove-ads-and-promotions) | Removes banner, interstitial, fallback, and Amazon ads, 1DM+ sale/VPN/drawer/rate promotions, sponsored browser tiles, promo FCM topics, and 17 ad/telemetry SDK initializers and native/asset payloads from free 1DM 20.0 (30257). |  |

</details>

<details open>
<summary>📦 MX Player&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 3.4.1 |
| :---: |
| Standalone APK (arm64-v8a / armeabi-v7a, Android 7.0+), build 2001003551 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Clean Me page](#clean-me-page) | Removes the Status Saver, Legal, and Help sections from the Me page while keeping the 8-item local tools grid, App Theme, Settings, and Custom Pop-up Play. |  |
| [Custom codec](#custom-codec) | Bundles an MX Player v3.1.0 custom codec (aio-v3.1.0_r1.zip, architecture ZIP, or libffmpeg.mx.so*) directly into the app for out-of-the-box E-AC-3, TrueHD, MLP, DTS, and AC-3 software audio decoding. | • Custom codec file |
| [Remove ads & bloat](#remove-ads-bloat) | Removes banner, folder, player, interstitial, rewarded, app-open, exit, and Me-page ads, removes the Home horizontal shortcut strip and online Zodiac App Themes, and disables Live TV, mxplay OTT streaming, MX Tube, Shorts, and Games while keeping Local Music, All-Files-Access setup, and 1-tap Classic Themes working offline and online. |  |
| [Remove bottom navigation bar](#remove-bottom-navigation-bar) | Removes the bottom navigation bar from the UI and moves Me to the upper-right corner of the Home toolbar. Leave unchecked to keep the bottom navigation bar. |  |

</details>

<details open>
<summary>📦 PlayZ TV&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.3.1 |
| :---: |
| Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 6.0+), build 8 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove ads, popups & restrictions](#remove-ads-popups-restrictions) | Replaces the native signature-locked decryption in pure Java so encrypted channel and event feeds keep loading after Morphe re-signs the APK, and removes start/player/support/external ads plus the automatic Telegram promo dialog. |  |

</details>

<details open>
<summary>📦 CRICFy TV&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.3 | 7.4 |
| :---: | :---: |
| Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 7.0+), build 53 | Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 7.0+), build 54 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove ads, proxy & restrictions](#remove-ads-proxy-restrictions) | Removes CashRaven background bandwidth sharing, all ads and sponsor/unlock gates, external browser redirects, the startup Telegram join dialog, promo marquee banners, forced-update lockouts, and promo push notifications. Optional clone/sniffer-check bypass and native-library stripping are off by default. | • Hide promo marquee ticker<br>• Bypass update & force-update screen<br>• Block promotional push notifications<br>• Bypass clone, work-profile & sniffer checks<br>• Strip proxy & ad native libraries |

</details>

<details open>
<summary>📦 CricZ TV&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.3 |
| :---: |
| Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 6.0+), build 10 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove ads, telemetry & restrictions](#remove-ads-telemetry-restrictions) | Replaces native signature-locked config decryption in pure Java, removes all banner/popunder/timer ads and the local NanoHTTPD ad server, suppresses the startup Telegram popup and player watermarks, strips Firebase telemetry and push notifications, and bypasses update lockouts. Optional root/sniffer bypass and native/telemetry stripping are off by default. | • Hide promo announcement bar<br>• Remove push notifications<br>• Bypass update & force-update screen<br>• Bypass root & sniffer checks<br>• Strip native & telemetry bloat |

</details>

<details open>
<summary>📦 SK Tech TV&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.7 |
| :---: |
| Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 6.0+), build 17 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove ads, telemetry & restrictions](#remove-ads-telemetry-restrictions) | Replaces native signature-locked config decryption in pure Java so encrypted channel and event feeds keep loading after Morphe re-signs the APK, removes all banner/start/support/external ads, optionally disables the in-app web view, suppresses update lockouts, and optionally bypasses root/sniffer/proxy-cert checks. Strips Firebase telemetry and push notifications. | • Remove push notifications<br>• Bypass update & force-update screen<br>• Bypass root & sniffer checks<br>• Strip native & telemetry bloat<br>• Disable WebActivity (potential ad surface) |

</details>

<!-- PATCHES_END -->

---

## 📦 1DM (20.0, build 30257)

<details>
<summary><b>📖 App details</b> — what it does, cloud architecture, target version and notes (click to expand)</summary>

### What it does

Turns free **1DM 20.0** (`idm.internet.download.manager`) into an instant-opening, zero-drain download manager and browser — backed by an automated **Cloud Pre-Built AdBlocker (`~1.22M` active rules)** and **Shortlink Bypass** pipeline so you never wait 4 minutes on *"Rebuilding filters..."* or cook your phone's CPU, while keeping the `.mpp` patch bundle tiny (`~630 KB`) and free-1DM boundaries strictly intact.

#### AdBlocker turbo & userscript bundle *(default: on — flagship cloud suite)*

Upgrades 1DM 20.0's built-in Browser AdBlocker and Userscript engine with zero `.mpp` size bloat and zero manual upkeep:

- **AdBlocker engine mode** (`adblockerMode`, default: **Cloud Pre-Built + Weekly Auto-Sync**):
  - **☁️ Cloud Pre-Built + Weekly Auto-Sync (`cloud_sync`):** Every week, GitHub Actions runs 1DM 20.0's real filter compiler headlessly against live upstream sources (with 1DM's embedded `js_resources.txt` `+js` scriptlets & `$redirect` resources mounted) and publishes a SHA-256-verified `schema: 2` pack to the rolling `onedm-cache` release. On your device, 1DM quietly fetches and swaps the pre-compiled binary engines (`abnfp.bin`, `abnhp.bin`, `abcfp.bin`) + all **28** default filter list archives (EasyList, EasyPrivacy, uBlock Origin, AdGuard, OISD Full, HaGeZi Pro, Peter Lowe, regional & anti-adblock lists) in **under 2 seconds**:
    - **Instant `Hosts & filters` hydration:** Populates 1DM's filter database and `.adblocker_1dm` archives automatically so **Hosts & filters** immediately displays all **`~1,224,500+` active filters** alongside each list's rule count, size, and last-updated date — no manual *Update* tap required, and the redundant *"Enable filter lists auto-update?"* prompt is suppressed.
    - **Smart hybrid handoff:** Custom **My Filter** rules keep working natively. Tapping **Update** on the default 28-list set runs a fast ~1–2s Cloud check, while toggling extra lists or adding custom filter URLs automatically hands compilation over to **Local Turbo**.
  - **⚡ Local Turbo Parser + Weekly Auto-Rebuild (`local_turbo`):** Prefers 100% on-device compilation with `7`-day auto-updates. Replaces 1DM's unbuffered `RandomAccessFile` compiler output with a `64 KB` buffered writer + in-memory index patching (eliminating **~4,000,000 flash syscalls** per rebuild with 100% byte-identical output) and keeps worker scheduling on foreground CPU cores (`priority = 1`) so local rebuilds finish dramatically faster without UI lag.
  - **Stock 1DM (`stock`):** Leaves 1DM's stock AdBlocker untouched.
- **🔗 Bundled Bypass All Shortlinks userscript** (`bundleBypassShortlinks`, default: **on**):
  - Automatically installs and updates a mobile-adapted **Bypass All Shortlinks Debloated** `.1dmus` bundle from the weekly Cloud cache — pre-authorizing redirect/background XHR `@connect` domains (which otherwise fail silently in 1DM), adding `window.close` grant support, and bundling offline `MonkeyConfig` resized for phone screens (`min(92vw, 600px)` × `min(80vh, 480px)`).
  - Preserves your **enabled / disabled** toggle across updates, routes per-script *Check for update* safely through the mobile-adapted bundle instead of raw desktop JS, and **never re-installs** the script if you choose to delete it.

#### Optimize cold start and battery *(default: on)*

Built specifically to eliminate opening lag (especially on budget / low-RAM / eMMC phones like Redmi 8A), phone heating, and idle background drain:

- **Zero `120+ MB` Chromium WebView spin-up on cold start:** Stops 1DM from initializing the Android System WebView / Trichrome engine on the main UI thread when you only open the Download Manager or run a background download. WebView only loads when you actually open the built-in Browser.
- **Deferred Browser AdBlock & `:CheckAppVersion` startup work:** Defers AdBlock engine loading until Browser launch and delays the secondary `:CheckAppVersion` subprocess past startup (skipping it completely if the app was already minimized), keeping cold-start UI rendering fast and smooth.
- **Zero `1 Hz` idle battery drain (86,400 wakeups/day saved):** Pauses `MainActivity`'s 1-second background `TimerTask` and `ActivityManager` Binder IPC polling whenever 1DM is minimized, resuming live progress updates instantaneously when brought back to the screen.
- **Keeps 1DM in Android Recents & protects background downloads on Back press:** Replaces 1DM's destructive `finishAndRemoveTask()` + `Process.killProcess` Back-button behavior with standard Android `moveTaskToBack(true)` — pressing **Back** sends 1DM cleanly to the background without vanishing from Recent Apps or interrupting active downloads, while the explicit drawer **Exit** button still closes the app completely.

#### Remove ads and promotions *(default: on)*

Strips all advertising, nags, and third-party tracking bloat from free **1DM 20.0 (30257)** while keeping every download, torrent (`libjlibtorrent`), FFmpeg, VPN, and browser feature working:

- **Manifest & startup SDK debloat:** Removes **17** startup ad/mediation/Sentry/AppMetrica/Firebase `ContentProvider`s and UnityAds initializers, **16** ad/FCM background services, **7** wakeup receivers, ~115 ad activities (keeping Dropbox, Biometric, Billing, and Play Services intact), and tracking permissions (`AD_ID`, `ACCESS_ADSERVICES_*`, Install Referrer, C2DM).
- **~10.5 MB native & asset cleanup:** Strips **11** third-party ad/telemetry `.so` libraries per ABI and **64** MRAID/VAST/OMSDK ad asset files while keeping all **14** core functional native libraries and 1DM's built-in AdBlocker/Userscript assets untouched.
- **Clean UI & zero nags:** Disables Appodeal, Amazon, and SQLite fallback banners, interstitials, waterfall timers, *"Rate 1DM"* popups, *"Upgrade to 1DM+"* / *"1DM+ on sale"* / VPN promo banners, sponsored browser start-page shortcuts (preserving user shortcuts and **Add Shortcut**), and promotional FCM topics.

#### Browser setup prompts only once *(optional — off by default)*

Records the **Set as default browser**, **Accessibility settings**, **Shortcut menu strip**, and **Setup adblocker** prompts as shown as soon as they appear, so closing the browser without dismissing them won't make them nag you again next launch.

#### Preset browser settings *(optional — off by default)*

Sets clean fresh-install fallbacks for normal and incognito browsing without overwriting any setting you've already saved or imported:

- **Search engine:** Brave by default (Google, DuckDuckGo/Lite, Bing, StartPage/Mobile, Yahoo/Japan, Yandex/Russian, Baidu, and AOL available).
- **Search suggestions:** Matched automatically to your chosen search engine where supported (or **None** instead of silently leaking keystrokes to Google).
- **Search by image:** Google by default (Bing, Yandex, TinEye, SauceNAO, and Sogou available).

GinArena Patch does **not** unlock paid **1DM+** features (scheduler, higher part/concurrency caps, paid DNS entries, …) and contains no 1DM+ code or resources.

### Target app (1DM)

| Field | Value |
| --- | --- |
| Package | `idm.internet.download.manager` |
| Version | **20.0** (versionCode 30257), stable |
| Input file | Official **universal APKM** (base + ABI/dpi splits) so both `arm64-v8a` and `armeabi-v7a` devices are covered |
| Stock download | [APKMirror — 1DM 20.0 (universal) (160-640dpi) (Android 7.0+)](https://www.apkmirror.com/apk/Vicky%20Bonick/idm-download-video-movie-music-anime-torrent/1dm-browser-video-download-20-0-release/1dm-browser-video-download-20-0-2-android-apk-download/) |
| Signing certificate SHA-256 | `9f48b6b2741fe7e4f78ea7375f469e99086c07f45a6c7f38407f0483d2451ce7` |
| APKM SHA-256 | `4c36d570f5cdbbbdbba4d2217aba33ed0e1bbf6179e6eb3b9eb17d936124b005` |
| `base.apk` SHA-256 | `b55935a4435da5d3623aa8c94384039d9f07128a58ba1a93f427a5a21924c3ab` |

Do **not** use the separate **20257** variant for this patch.

> **Uptodown note:** If Morphe’s “help me find an APK” flow opens Uptodown and downloads the 1DM 20.0 XAPK, that file has also been tested successfully. Select it in Morphe Manager instead of installing it. For x86/x86_64 devices, or if the Uptodown result is not exactly 20.0, use the APKMirror universal APKM above.

</details>

---

## 📦 MX Player (3.4.1, build 2001003551)

<details>
<summary><b>📖 App details</b> — what it does, target version and notes (click to expand)</summary>

### What it does

Keeping it simple here: these patches turn free **MX Player** (`com.mxtech.videoplayer.ad`)
into what it should've been in the first place — a clean, fast local video and music player.
No ads, no online junk, no weird surprises. Patch it, open it, it just works. Signature
stuff is handled quietly under the hood, so there's nothing extra for you to configure.

Choices are **minimal on purpose**: two patches are **on by default** (that's the actual
debloat), and two small extras are **optional**. No endless toggle maze — pick the optional
stuff only if you want it.

> **Want heavy customization instead?** Totally fair — this probably isn't your patch then.
> Go with the OG MX Player patches by **BlazeFTL** 👉
> [FTL-Patches](https://github.com/BlazeFTL/FTL-Patches). They go much deeper with options
> and tweaks. GinArena's version is deliberately the opposite: few choices, debloated,
> stable, done. Use whichever style suits you — no hard feelings. 🤝

<a id="remove-ads-bloat"></a>
#### Remove ads & bloat

*On by default — the main one.* Kills ads everywhere (home banners, folder ads, player and
pause ads, pop-ups, Me-page promos, exit ads), removes the shortcut strip at the top of
Home and the online ad-locked *Other Themes* (Zodiac etc.), and switches off the online
clutter: **Live TV**, **OTT shows**, **MX Tube**, **Shorts**, and **Games**. The stuff you
actually use stays right where it was — **Local Music**, **Continue Watching**, the
**All-Files-Access** screen, **Adaptive / Light / Dark** modes, and all **32 Classic Themes**
(applying in 1 tap, offline and online).

#### Clean Me page

*On by default.* Just tidies up the **Me** tab: WhatsApp Status Saver, promo banners,
**Legal**, **Help**, and **Data Privacy** clutter are gone, while your 8 local tool
shortcuts (*Video Playlist*, *Private Folder*, *FolderCleaner*, *Bookmarks*, *File
Transfer*, *Equalizer*, *Smooth Play*, *Decoder*), **App Theme**, **Settings**, and
**Custom Pop-up Play** all stay.

#### Remove bottom navigation bar

*Optional — off by default.* Like the normal bottom bar (**Folders**, **Music**,
**Transfer**, **Me**)? Leave this off. Want a cleaner, full-height folder list instead?
Turn it on — the bottom bar hides and **Me** moves to the top-right of the Home toolbar
(*Music* and *File Transfer* are still easy to reach inside *Me*). Entirely your call.

#### Custom codec

*Optional — off by default.* Only if you care about Dolby/DTS audio: pick
`aio-v3.1.0_r1.zip` in the patch option while patching, and **E-AC-3 (Dolby Digital Plus)**,
**TrueHD**, **MLP**, **DTS**, and **AC-3** videos just play out of the box
(`Settings → Decoder → Custom codec` will show `Bundled custom codec (v3.1.0)`). Don't need
it? Skip it — nothing else changes.

### Target app & downloads (MX Player)

> **Important:** Download the **standalone `.apk` file** (~111 MB), **not** a `.xapk` or
> `.apkm` split bundle. APKPure, Uptodown, and APKMirror all distribute the exact same official
> Amazon Mobile LLC signed standalone APK below.

| Field | Value |
| --- | --- |
| Package | `com.mxtech.videoplayer.ad` |
| Version | **3.4.1** (versionCode 2001003551) — standalone universal APK (`arm64-v8a` + `armeabi-v7a`, Android 7.0+) |
| Stock APK — **APKPure** | [Latest 3.4.1 APK](https://apkpure.com/mx-player-app/com.mxtech.videoplayer.ad) · [Version history (`3.4.1`)](https://apkpure.com/mx-player-app/com.mxtech.videoplayer.ad/versions) *(choose the **APK** download, not `XAPK`)* |
| Stock APK — **Uptodown** | [MX Player versions (`apk 3.4.1`)](https://mx-player.en.uptodown.com/android/versions) *(choose the **`apk`** variant)* |
| Stock APK — **APKMirror** | [MX Player releases on APKMirror](https://www.apkmirror.com/apk/amazon-mobile-llc/mx-player/) *(choose the **`3.4.1` `APK`** variant, not `BUNDLE`)* |
| Signing certificate SHA-256 | `0d9b4c778672e753d45aba4f10df31e1d10bf75b1245469131ef01b82f0f91b6` |
| `3.4.1` APK SHA-256 | `db775bd81460e31bd21602cf0b842bc3e2fd769b0bd23250e70036cc4cf95bf4` |
| Optional **Custom Codec v3.1.0** | [GitHub — `iDNA420/MX-FFmpeg` `v3.1.0_r1` (`aio-v3.1.0_r1.zip` recommended)](https://github.com/iDNA420/MX-FFmpeg/releases/tag/v3.1.0_r1) (`SHA-256: ebb0bd5db0f855caca6167747987a229836d7cc0062a2d5c23dbf91d057c617b`) — keep it as a `.zip` and select it inside the **Custom codec** patch option in Morphe Manager |

---

### Stock download note

Morphe patch metadata does not have a dedicated “stock app download URL” field, and Morphe Manager
does not read a download destination from a patch bundle. Exact download URLs and SHA-256 hashes
therefore stay in this README, where they are clickable, while the in-Manager version cards carry
short readable build labels and validate the package name, file type, version, `versionCode`,
`minSdk`, and official signing-certificate SHA-256.

</details>

---

## 📦 CRICFy TV (7.4 build 54 · 7.3 build 53)

<details>
<summary><b>📖 App details</b> — what it does, target version and notes (click to expand)</summary>

### What it does

The **Remove ads, proxy & restrictions** patch (enabled by default) delivers a clean, safe,
privacy-respecting experience on **CRICFy TV 7.4** (7.3 also supported) across phones, tablets,
and Android TV:

- **Removes CashRaven background residential proxy:** Neutralizes the CashRaven bootstrap
  (`createManaged` / forced `optIn()`) so the SDK instance is never created, disables
  `CashRavenService` and `CrBootReceiver` (plus `AppExitGuardService` on 7.3), and removes the
  dead **Bandwidth Sharing** drawer item so tapping it can never crash the app.
- **Native signature-tamper bypass (`ResourceMode.RAW`):** Dynamically parses ELF32/ELF64 `.dynsym`
  and `PT_LOAD` headers across all four ABIs (`arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`) in
  `libnative-lib.so` and patches `AntiTamper::isTampered` to return `false`, allowing `Baker.merge`
  to decrypt live server configurations after Morphe re-signs the APK without touching CRICFy's
  anti-tamper `resources.arsc`.
- **Anti-decompiler DEX payload sanitizer:** Repairs deliberately corrupted dead-code
  `array-payload` (`0x0300`) instructions before `dexlib2` rewrites touched classes.
- **Complete ad, sponsor-gate & redirect removal:** Disables Unity Ads startup initialization,
  `AlertNew` countdown gates, sponsor banners, startup full-screen custom ads
  (`CustomAdFullBinding`), external browser / `WebActivity` redirects, and all three pre-playback
  channel lock/sponsor gates (`UnlockDilaogBinding`, countdown WebView, and browser redirect) so
  channels open immediately.
- **No startup Telegram join popup:** Suppresses the startup `DialogTgJoinBinding` (`dialog_alert`)
  prompt on `MainActivity` launch while leaving voluntary social links in the side drawer intact.
- **Configurable quality-of-life options (on by default unless noted):**
  - **Hide promo marquee ticker** (`hidePromoMarquee`) — hides the scrolling announcement/redirect
    marquee bar on Home, Player, and Floating Player screens.
  - **Bypass update & force-update screen** (`bypassUpdateGate`) — skips optional and forced
    `FragmentUpdate` lockouts on Splash startup.
  - **Block promotional push notifications** (`blockPromoPushNotifications`) — suppresses
    promotional/redirect FCM notifications and skips the Android 13+ notification permission prompt
    while keeping silent RemoteConfig (`type == 3`) stream API refreshes working.
  - **Bypass clone, work-profile & sniffer checks** (`bypassEnvironmentChecks`, **off by
    default**) — allows running inside work profiles (`userId 999`), app cloners, or alongside
    HTTP debugging tools. Not needed for ad/proxy removal; enable only if you use such tools.
  - **Strip proxy & ad native libraries** (`stripNativeBloat`, **off by default**) — removes
    ~7.7 MB of unused `libcr_android.so`, `libjnidispatch.so`, `libunitycoherencenative.so`,
    legacy `armeabi`/`mips` folders, and `assets/ad-viewer/`. Purely a size saving: with this
    off, the libraries stay in the APK but are never loaded, because their Java entry points
    are already removed above.

### Target app (CRICFy TV)

| Field | Value |
| --- | --- |
| Package | `com.cricfytv.sports` |
| Version | **7.4** (versionCode 54) — recommended; **7.3** (versionCode 53) also supported. Universal APK (`arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`) |
| Stock download | Official [cricfyapk.io/download/](https://cricfyapk.io/download/) page or the developer's official Telegram channel |
| Signing certificate SHA-256 | `f2cd86fcbc92461a3300cec47b6f74d20f0c89dd7162ecc333b3dd2c16e79841` |
| APK SHA-256 (7.4) | `d37c0c70200981a9558d32abd16ffb7966ae83a2fc84157b82e6869c4e16ae6f` |
| APK SHA-256 (7.3) | `d5b7a8cf16a9966a58d25841b1a108b7dba445fcd409ee932933b98f81d2de0d` |

> **Version safety:** only **7.4 (54)** and **7.3 (53)** are supported. The patch validates
> every fingerprint and
> the native `AntiTamper` symbol before writing anything, and **aborts with an error instead of
> producing a broken APK** if the app internals have changed. Future CRICFy versions are refused
> by design until they receive a fresh audit — do not force-patch other versions in Expert Mode.

</details>

---

## 📦 CricZ TV (7.3, build 10)

<details>
<summary><b>📖 App details</b> — what it does, target version and notes (click to expand)</summary>

### What it does

The **Remove ads, telemetry & restrictions** patch (enabled by default) provides a clean, fast,
server-compatible experience on **CricZ TV 7.3** across phones, tablets, and Android TV:

- **Pure-Java signature-independent decryption (`DataHelper.MyApp`):** Replaces native
  `libnative-lib.so` decryption in pure Java (`Base64` → byte-pair swap → reverse → `Base64` →
  AES-128-CBC with the stock certificate-derived key) while preserving graceful fallback to Tier-2
  AES decryption (`c6.f0.j`), so live RemoteConfig (`api_url`) and all encrypted channel/event
  feeds keep working after Morphe re-signs the APK, without the stock app's signing-certificate
  check blocking decryption.
- **Complete ad, popunder, timer-gate & local ad-server removal:** Sanitizes parsed `app.txt`
  ad flags, disables external Chrome / CustomTabs popunder redirects (`vc.b.A`), removes the
  10-second `SupportActivity` sponsor countdown gate (`kc.k.T`), and disables `"adpro*"` match-feed
  banner injection (`hc.h.g`) so the local `NanoHTTPD` port `1120` ad server (`qc.k`) and its
  debuggable ad `WebView` never start.
- **No startup Telegram popup or video watermarks:** Suppresses the startup `dialog_telegram`
  modal on `MainActivity` launch (while keeping voluntary Settings links functional) and clears
  `player_text` / `@id/playerTxt` overlays across Portrait, Landscape, PiP, and Floating Player.
- **Preserves Firebase RemoteConfig:** The minimal `RemoteConfigRegistrar` +
  `FirebaseInstallationsRegistrar` + `AbtRegistrar` graph required to resolve live backend
  domain rotations is always kept intact. The opt-in *Strip native & telemetry bloat* option
  below (off by default) can additionally remove Analytics, Crashlytics, Sessions,
  DataTransport, AdServices, and `ProfileInstaller`.
- **Configurable quality-of-life options (on by default unless noted):**
  - **Hide promo announcement bar** (`hidePromoMarquee`) — collapses the scrolling `message_card`
    promo banner on both the Events home screen and the Player screen.
  - **Remove push notifications** (`removePushNotifications`) — disables `PushService` and Firebase
    Cloud Messaging, skips Android 13+ `POST_NOTIFICATIONS` prompts across `SplashActivity`,
    `MainActivity`, and `TvActivity`, and strips FCM receivers/permissions from `AndroidManifest.xml`.
  - **Bypass update & force-update screen** (`bypassUpdateGate`) — skips forced and optional update
    lockouts on Splash startup (`SplashActivity.z`) and Player deeplink exit (`PlayerActivity.v`),
    and removes `REQUEST_INSTALL_PACKAGES`.
  - **Bypass root & sniffer checks** (`bypassEnvironmentChecks`, **off by default**) — neutralizes
    RootBeer + `su`/`magisk` shell lockouts (`b8.h.r`), Frida/sniffer package scans (`rc.b` /
    `p4.v.O`), and proxy-certificate SubjectDN lockouts (`qc.b`). Not needed on ordinary
    phones/TVs. The six `MainActivity` startup tamper crash-bombs are always neutralized
    separately so patched builds start reliably.
  - **Strip native & telemetry bloat** (`stripNativeAndTelemetryBloat`, **off by default**) —
    removes `libnative-lib.so` across all four ABIs (and `libtoolChecker.so` only when the root
    bypass above is enabled, because `RootBeerNative` loads it), keeping Media3's
    `libffmpegJNI.so` and `libdav1dJNI.so`, plus telemetry manifest services/receivers. Purely a
    size saving: with this off, the libraries stay in the APK but are never loaded.

### Target app (CricZ TV)

| Field | Value |
| --- | --- |
| Package | `com.pro.cricztv` |
| Version | **7.3** (versionCode 10), universal APK (`arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`) |
| Stock download | Official developer Telegram channel: [t.me/cricztvapp](https://t.me/cricztvapp) — verify the APK SHA-256 below after downloading |
| Signing certificate SHA-256 | `9ff349c0c047abd68e169980484b43926b6ff2d251a430fe44e3ae3e2930e1d2` |
| APK SHA-256 | `74a8a13da7ab1865dc9e3bbb511fe82bb0f8c093fcf2404ac4a59ecdce44fb82` |

> **Version safety:** only **7.3 (10)** is supported. Every fingerprint is validated before writing
> anything, and future CricZ TV versions are refused by design until they receive a fresh audit —
> do not force-patch other versions in Expert Mode.

</details>

---

## 📦 PlayZ TV (2.3.1, build 8)

<details>
<summary><b>📖 App details</b> — what it does, target version and notes (click to expand)</summary>

### What it does

The **Remove ads, popups & restrictions** patch (enabled by default) provides a clean, fast,
server-compatible experience on **PlayZ TV 2.3.1** across phones, tablets, and Android TV:

- **Pure-Java signature-independent decryption (`Px.app`):** Replaces native `libnative-lib.so`
  decryption in pure Java (`Base64` → byte-pair swap → reverse → `Base64` → AES-128-CBC with the
  stock certificate-derived key), so encrypted channel/event feeds keep working after Morphe
  re-signs the APK. The native signer-certificate self-test (`Px.check`, which aborts a
  re-signed build on startup) is neutralized, and any decode failure returns an empty result
  so the app's own Java AES fallbacks (`q4.a0.j`) still apply — the app never crashes on a
  bad payload.
- **Complete ad & popunder removal:** Sanitizes the parsed `app.txt` config at the single
  choke point (`wc.d.u`): banner/start/support ad flags off and external-ad preferences
  cleared, and disables the timed Support / Custom Browser popunder (`wc.d.y`).
- **No automatic Telegram popup:** Suppresses the automatic `dialog_telegram` promo
  (`lc.n.a`), while manual Telegram links elsewhere remain untouched.
- **Stability first:** TLS setup (`rc.b.a`), streaming, and update behavior are untouched; no
  permissions are changed and no native libraries are stripped (the stock library stays in
  the APK but is never loaded by the patched `Px` bridge).

### Target app (PlayZ TV)

| Field | Value |
| --- | --- |
| Package | `com.playz.tv` |
| Version | **2.3.1** (versionCode 8), universal APK (`arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`) |
| Stock download | Use the exact stock **2.3.1** APK and verify the APK SHA-256 below before patching |
| Signing certificate SHA-256 | `05ecca660d7656ce2c65a878c9e49a169558c2a44976f26c369393eccf9dc44b` |
| APK SHA-256 | `003c8b6e9afe4a3f17ab45112a99ad8d2bf715f1981a521c61dab5f453a1d827` |

> **Version safety:** only **2.3.1 (8)** is supported. Every fingerprint is validated before writing
> anything, and future PlayZ TV versions are refused by design until they receive a fresh audit —
> do not force-patch other versions in Expert Mode.

</details>

---

## 📦 SK Tech TV (2.7, build 17)

<details>
<summary><b>📖 App details</b> — what it does, target version and notes (click to expand)</summary>

### What it does

The **Remove ads, telemetry & restrictions** patch (enabled by default) provides a clean,
server-compatible experience on [**SK Tech TV 2.7**](https://sktech.site/) across phones, tablets, and Android TV:

- **Pure-Java signature-independent decryption:** Replaces the native signature-locked feed
  decryption in pure Java, so the encrypted app config, live event feeds, and live TV channel
  feeds keep loading and playing after Morphe re-signs the APK. The native library is never
  loaded anymore, and any decode failure returns an empty result instead of crashing.
- **Complete ad & popunder removal:** Sanitizes the parsed remote config at its single choke
  point (banner/start ads off, sponsor-gate URL and promo marquee blanked, external-ad
  preferences cleared), disables the browser / Chrome CustomTabs popunder, and bypasses the
  timed "support" sponsor gate so streams open directly in the player.
- **Startup integrity neutralized:** The Java anti-tamper crash-bombs are disabled, so the
  re-signed build starts normally on phones and TVs.

#### Options

- **Remove push notifications** *(default: on)* — Disables the FCM push service and its manifest
  entries, skips the Android 13+ notification permission prompts, and removes the push
  permissions.
- **Bypass update & force-update screen** *(default: on)* — Skips forced and optional update
  lockouts at startup and on player exit, and removes the install permission used by the in-app
  self-updater. With this on, the app will never update itself; update instead by re-patching a
  newer audited stock build.
- **Bypass root & sniffer checks** *(default: off)* — Neutralizes the RootBeer root lockout,
  Frida/sniffer package detection, and the proxy-certificate lockout. Only needed if the stock
  app refuses to run on your device (rooted, or a packet-capture app is installed); certificate
  validation itself still goes through the system trust manager.
- **Strip native & telemetry bloat** *(default: off)* — Deletes the now-unused native library
  (plus the root-check library when the root bypass is also on) and strips Firebase Analytics,
  Crashlytics, Sessions, DataTransport, and AdServices manifest entries. Purely a size saving.
- **Disable WebActivity (potential ad surface)** *(default: off)* — Closes the in-app WebView
  immediately so remote config can never open ad landing pages. Anything that legitimately uses
  it (for example score pages) will simply close as well.

### Target app (SK Tech TV)

| Field | Value |
| --- | --- |
| Package | `com.live.sktechtv` |
| Version | **2.7** (versionCode 17), universal APK (`arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`) |
| Official site | [sktech.site](https://sktech.site/) |
| Stock download | [Official SK Tech download page](https://downloadsktech.pages.dev/download) — use the exact stock **2.7** APK and verify the APK SHA-256 below before patching |
| Signing certificate SHA-256 | `9ff349c0c047abd68e169980484b43926b6ff2d251a430fe44e3ae3e2930e1d2` |
| APK SHA-256 | `5095235d7a77e588d570780cea99a25dd807c9cb3ee814e450af82a49423cdcd` |

> **Version safety:** only **2.7 (17)** is supported. Always patch a **fresh stock** APK — never
> re-patch an already patched build. Future SK Tech TV versions are refused by design until they
> receive a fresh audit — do not force-patch other versions in Expert Mode.

</details>

---

## Usage (Morphe Manager)

1. Add this repository as a remote patch source using the link at the top of this README.
2. Download the official stock **1DM 20.0 APKM**, **CRICFy TV 7.4 APK**, **CricZ TV 7.3 APK**,
   **PlayZ TV 2.3.1 APK**, or
   **MX Player 3.4.1 standalone APK** above onto your device.
3. Uninstall the stock app first if it is already installed (re-signing changes the APK signature).
4. In Morphe Manager, choose **Select from storage**, pick the downloaded stock `.apkm` / `.apk`
   file (rather than an already-patched installed app), configure options if desired (for MX
   Player's optional **Custom codec** patch, tap its gear icon and pick `aio-v3.1.0_r1.zip`
   directly without unzipping it), then patch and install. If a third-party source or patch is not
   visible, enable Expert Mode in Morphe settings.
5. Repeat with the fresh stock file when new versions are audited and supported.

> [!IMPORTANT]
> **Always patch the fresh stock app — never re-patch an already-patched APK.** If a patched app
> stops working (streams won't load, crashes, or the developer releases a new version), do not
> patch your saved/patched APK again. Re-download the exact stock file from the links above and
> patch it from the beginning.
>
> **New in v2.5.0:** overhauls **1DM (`20.0`, build `30257`)** with an automated
> **Cloud Pre-Built AdBlocker** (`~1.22M` active rules across 28 filter lists synced in `< 2s` with
> full `Hosts & filters` hydration and zero 4-minute local rebuild), **Local Turbo** `64 KB`
> buffered compilation, auto-synced mobile **Bypass All Shortlinks** userscript, zero-WebView cold
> start, zero `1 Hz` background battery drain, **Back**-press Recents/download preservation, and
> ~10.5 MB of ad/SDK debloat. If you use **MX Player (`3.4.1`)**, **PlayZ TV (`2.3.1`)**,
> **CRICFy TV (`7.3`)**, or **CricZ TV (`7.3`)** and are already on `v2.4.2`, you don't need to
> re-patch those apps.

## Building from source

Requirements: JDK 21 and a GitHub token with `read:packages` for Morphe's GitHub Packages
dependencies. Configure `gpr.user` / `gpr.key` in your user Gradle properties, or set
`GITHUB_ACTOR` / `GITHUB_TOKEN`. Then:

```bash
bash gradlew :patches:buildAndroid
# output: patches/build/libs/patches-*.mpp
```

## Development

- Use semantic commit messages (`feat:`, `fix:`, `chore:`). Pushing to `dev` creates pre-releases;
  merging `dev` into `main` (merge commit, not squash) or pushing `feat:`/`fix:` to `main` creates
  stable releases and back-merges automatically.
- Do not manually edit generated files such as `patches-list.json`, `patches-bundle.json`, or
  `CHANGELOG.md`; the release workflow updates them.
- New app versions require a fresh fingerprint audit before compatibility is declared.

## Credits

- [BlazeFTL/FTL-Patches](https://github.com/BlazeFTL/FTL-Patches) — inspiration for MX Player patch ideas.
- [callMeBeyonder/morphe-patches](https://github.com/callMeBeyonder/morphe-patches) — inspiration and initial CRICFy TV patch idea.
- [Morphe](https://morphe.software/) — Morphe Patcher and Morphe Manager.

## Notes

- These patches only modify app files locally on your device. Support app developers by purchasing
  official paid editions such as 1DM+ if you want paid features.

## License

GinArena Patch is licensed under the [GNU General Public License v3.0](LICENSE).
