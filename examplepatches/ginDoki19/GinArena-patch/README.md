# <img src="assets/icon.png" width="36" alt=""> GinArena Patch

**GinArena Patch** is a [Morphe](https://morphe.software/) patch bundle for free **1DM**
(`idm.internet.download.manager`), **CRICFy TV** (`com.cricfytv.sports`), and **CricZ TV**
(`com.pro.cricztv`). Morphe Manager automatically filters patches per app, so selecting an app
shows only the patches compatible with that app.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=ginDoki19/GinArena-patch

Or manually add this repository as a remote source in Morphe Manager:

```text
github.com/ginDoki19/GinArena-patch
```

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v2.3.0](https://github.com/ginDoki19/GinArena-patch/releases/tag/v2.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 1DM&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 20.0 |
| :---: |
| Universal APKM (160-640 dpi, Android 7.0+), build 30257 |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Browser setup prompts only once](#browser-setup-prompts-only-once) | Shows the browser accessibility and shortcut-menu-strip setup prompts once, then records each as shown as soon as it appears so closing the browser before dismissing it cannot make it repeat. |  |
| [Preset browser settings](#preset-browser-settings) | Sets fresh-install browser fallbacks for normal and incognito modes: Brave search, matching suggestions, and Google search by image by default. Saved or imported choices are preserved and can be changed later in 1DM. | • Search engine<br>• Search suggestions<br>• Search by image |
| [Remove ads and promotions](#remove-ads-and-promotions) | Removes visible banner/full-screen ads and 1DM+ promotions from free 1DM 20.0 (30257), including the downloads-home VPN promo bar and sponsored browser start-page tiles. User shortcuts remain available. |  |

</details>

<details open>
<summary>📦 CRICFy TV&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.3 |
| :---: |
| Universal APK (arm64-v8a / armeabi-v7a / x86 / x86_64, Android 7.0+), build 53 |

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

<!-- PATCHES_END -->

---

## 📦 1DM (20.0, build 30257)

### What it does

It removes visible advertising and promotion UI from the free app while keeping the app's own
flow intact:

- Consent / ad-SDK initialization is short-circuited, but the app's continuation callbacks still run.
- Persistent network banners and the built-in 1DM+ house/promo banners are never loaded or shown,
  and their views are forced `GONE`.
- Full-screen interstitial paths are skipped, again running the caller's continuation.
- The navigation drawer **“Upgrade to 1DM+”** item is hidden.
- The **“1DM+ on sale”** toolbar subtitle is disabled (the legitimate *Update app* subtitle is kept).
- The empty banner container (`MaxHeightLinearLayout`) is collapsed to 0×0 so no blank strip remains.
- The downloads-home promo strip (`offer_vpnLL`) is forced onto the app's own hide path, so the
  ProtonVPN installation offer—and the other promo messages rotated through that same strip—are not
  shown. This does not alter 1DM's actual VPN settings or functionality.
- Sponsored browser start-page tiles are removed:
  - the modern start page no longer selects database `BannerInfo` tile ads (`isTileAd()` now
    returns false), including previously cached *Play Quiz / Play Games* promotions;
  - the legacy/simple start page's two remotely configured sponsored shortcuts are nulled before
    its HTML is built.

User-created browser shortcuts and the **Add Shortcut** tile use a separate path and remain available.

#### Browser setup prompts only once (opt-in)

This separate patch is **off by default**. The stock browser can show its
**Accessibility settings** and **shortcut menu strip** setup
prompts again if the browser activity/process ends before their dismiss callbacks save the
“shown” flags. This patch lets each prompt appear normally the first time, then performs the
same in-memory and persisted shown-flag write immediately after `show()`. Closing the browser
before dismissing either dialog therefore cannot make that same setup prompt keep returning.

#### Preset browser settings (opt-in)

This separate patch is **off by default**, so it is not selected accidentally. When a user
enables it, it changes only the fresh-install/missing-key fallbacks for normal and incognito
browsing:

- **Search engine:** Brave by default, with Google, DuckDuckGo/Lite, Bing, StartPage/Mobile,
  Yahoo/Japan, Yandex/Russian, Baidu, and AOL available as patch options.
- **Search suggestions:** matched to the selected search provider where 1DM supports it;
  providers without a matching suggestion service use **None** instead of silently using
  Google. A supported provider or None can also be chosen explicitly.
- **Search by image:** Google by default, with Bing, Yandex, TinEye, SauceNAO, and Sogou
  available. 1DM does not offer Brave or DuckDuckGo for reverse image search.

Saved or imported 1DM choices are not overwritten, and every provider can still be changed
later inside 1DM's General Settings.

GinArena Patch does **not** unlock any 1DM+ paid features (scheduler, higher part/concurrency
caps, paid DNS entries, …), and it contains no 1DM+ code or resources.

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

---

## 📦 CRICFy TV (7.3, build 53)

### What it does

The **Remove ads, proxy & restrictions** patch (enabled by default) delivers a clean, safe,
privacy-respecting experience on **CRICFy TV 7.3** across phones, tablets, and Android TV:

- **Removes CashRaven background residential proxy:** Strips `CashRaven.createManaged` / forced
  `CashRaven.optIn()` from `App.onCreate`, disables `CashRavenService`, `AppExitGuardService`, and
  `CrBootReceiver`, and removes the dead **Bandwidth Sharing** drawer item so tapping it can never
  crash the app.
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
| Version | **7.3** (versionCode 53), universal APK (`arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`) |
| Stock download | Official [cricfyapk.io/download/](https://cricfyapk.io/download/) page or the developer's official Telegram channel |
| Signing certificate SHA-256 | `f2cd86fcbc92461a3300cec47b6f74d20f0c89dd7162ecc333b3dd2c16e79841` |
| APK SHA-256 | `d5b7a8cf16a9966a58d25841b1a108b7dba445fcd409ee932933b98f81d2de0d` |

> **Version safety:** only **7.3 (53)** is supported. The patch validates every fingerprint and
> the native `AntiTamper` symbol before writing anything, and **aborts with an error instead of
> producing a broken APK** if the app internals have changed. Future CRICFy versions are refused
> by design until they receive a fresh audit — do not force-patch other versions in Expert Mode.

---

## 📦 CricZ TV (7.3, build 10)

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

---

### Stock download note

Morphe patch metadata does not have a dedicated “stock app download URL” field, and Morphe Manager
does not read a download destination from a patch bundle. Exact download URLs and SHA-256 hashes
therefore stay in this README, where they are clickable, while the in-Manager version cards carry
short readable build labels and validate the package name, file type, version, `versionCode`,
`minSdk`, and official signing-certificate SHA-256.

## Usage (Morphe Manager)

1. Add this repository as a remote patch source using the link at the top of this README.
2. Download the official stock **1DM 20.0 APKM**, **CRICFy TV 7.3 APK**, or **CricZ TV 7.3 APK**
   above onto your device.
3. Uninstall the stock app first if it is already installed (re-signing changes the APK signature).
4. In Morphe Manager, choose **Select from storage**, pick the downloaded stock `.apkm` / `.apk`
   file (rather than an already-patched installed app), configure options if desired, then patch
   and install. If a third-party source or patch is not visible, enable Expert Mode in Morphe
   settings.
5. Repeat with the fresh stock file when new versions are audited and supported.

> [!IMPORTANT]
> **Always patch the fresh stock app — never re-patch an already-patched APK.** If a patched app
> stops working (streams won't load, crashes, or the developer releases a new version), do not
> patch your saved/patched APK again. Re-download the exact stock file from the links above and
> patch it from the beginning.
>
> **New in v2.3.0:** adds **CricZ TV 7.3** support — ads, popunder redirects, the 10-second
> sponsor gate, the startup Telegram popup, player watermarks, and push notifications are
> removed, while live config decryption keeps working on the re-signed build. As with CRICFy TV
> since v2.2.1, the environment-check bypass (root / cloner / sniffer) and native-library
> stripping options are **off by default** — turn them on only if you actually use root, app
> cloners, work profiles, or HTTPS-filtering tools. If your current patched 1DM or CRICFy TV
> works fine, you don't need to do anything.

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

- [callMeBeyonder/morphe-patches](https://github.com/callMeBeyonder/morphe-patches) — inspiration and initial CRICFy TV patch idea.
- [Morphe](https://morphe.software/) — Morphe Patcher and Morphe Manager.

## Notes

- These patches only modify app files locally on your device. Support app developers by purchasing
  official paid editions such as 1DM+ if you want paid features.

## License

GinArena Patch is licensed under the [GNU General Public License v3.0](LICENSE).
