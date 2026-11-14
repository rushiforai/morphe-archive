# SoundCloud Combined Patches (Morphe)

Combined SoundCloud (`com.soundcloud.android`) patches for use with [Morphe](https://morphe.software), featuring full Vietnamese localization, Android Auto Home, privacy/ad removal, AMOLED black-and-orange styling, Cast icon removal, and client-side Go+ caching.

## Add Source to Morphe

Click to add this repository directly in Morphe:

> **https://morphe.software/add-source?github=longthree1/morphe-patches**

Or add the repository URL manually in **Morphe Manager → Settings → Sources**:

> `https://github.com/longthree1/morphe-patches`

---

## Target App Compatibility

| App | Package Name | Format | Target Version | Version Code | Min SDK |
|---|---|---|---|---|---|
| SoundCloud | `com.soundcloud.android` | `APKM` | `2026.11.02-release` | `379060` | `29` (Android 10+) |

*(Note: Both Android 10+ and Android 9+ 2-arch APKM variants sharing build `379060` and official SoundCloud signing certificate `aff930d671fa0a57b8c41d1678cc2a8ea717075a74e346942a140afa441339d2` are accepted.)*

---

## Included Patches (`8/8` Enabled by Default)

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/longthree1/morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 SoundCloud&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**🎯 Supported versions:**

| 2026.11.02-release |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ✅&nbsp;Default | ⚙️&nbsp;Options |
|----------|----------------| :---: |-----------|
| [AMOLED dark theme](#amoled-dark-theme) | Changes dark theme surfaces, the bottom navigation bar, and the mini-player footer to true black (#000000) for AMOLED screens while preserving SoundCloud orange accents. | ON |  |
| [Disable analytics](#disable-analytics) | Stops SoundCloud's TrackingHandler from storing and dispatching analytics events. Other tracking SDKs and online services remain active. | ON |  |
| [Disable consent popup](#disable-consent-popup) | Uses SoundCloud's no-op consent controller to skip the OneTrust popup. Does not grant consent or disable tracking; select Disable analytics separately. | ON |  |
| [Enable SoundCloud Go+ (experimental)](#enable-soundcloud-go-experimental) | Enables client-side Go+ UI flags and standard-quality (SQ) offline track/playlist caching. High-quality audio streaming (HQ / 256kbps AAC) and high-quality downloads do NOT work because stream quality entitlements are enforced server-side. | ON |  |
| [Hide Cast icon](#hide-cast-icon) | Hides SoundCloud's Cast button in both the toolbar menu and standalone media route views. | ON |  |
| [Home in Android Auto](#home-in-android-auto) | Fills the car Home tab with regular cover tiles from the phone's Home, using the app's existing account. Tracks, mixes and artists play; playlists and albums open. Publishes the real playback queue for Up next, with queue item selection. Falls back to SoundCloud's original car Home if the phone Home cannot load. | ON |  |
| [Remove ads and upsells](#remove-ads-and-upsells) | Stops SoundCloud from requesting audio/display ads and hides Go upsell prompts. Does not change the account's plan, features or entitlements. | ON |  |
| [Vietnamese language](#vietnamese-language) | Adds Vietnamese UI resources and known server-provided interface labels, preserves content titles, and enables Tiếng Việt in app locale selection. | ON |  |

</details>

<!-- PATCHES_END -->

---

## Feature Summary & Limitations

### Vietnamese language
- Adds **2,760 translated strings** and **64 plural rules** (`res/values-vi/`).
- Enables **Tiếng Việt** directly inside SoundCloud **Basic settings → Language** via Android 13+ per-app language (`res/xml/locales_config.xml`), and follows Vietnamese system language automatically.
- Translates recognized server-provided Discover/Search UI labels, headers, banners, filters, and tabs at display time while preserving track titles, playlist titles, artist names, genres, and search queries.

### Home in Android Auto
- Populates the Android Auto **Home** tab with regular cover tiles from your phone Home SDUI feed using your logged-in account (tracks, mixes, artists play; playlists and albums browse).
- Exports the active playback queue (`Up next`) to MediaSession with queue-item selection and automatic fallback to original car Home if the feed cannot load.

### Disable analytics
- Prevents SoundCloud's `TrackingHandler` from storing or dispatching tracking/telemetry events while preserving worker shutdown messages to avoid `Looper` leaks.

### Disable consent popup
- Routes the OneTrust cookie/consent prompt to SoundCloud's built-in no-op consent controller.

### Remove ads and upsells
- Disables client-side audio and display ad request switches (`getShouldRequestAds`, `isMonetizableAdGeo`, `AdPlacementConfiguration`) and hides Go/Go+ upsell prompts.

### AMOLED dark theme
- Replaces dark mode backgrounds, `BottomTabBarRestyle`, dialogs, and the mini-player footer (`bth_footer_shape`) with pure black (`#000000`) for AMOLED displays while **preserving SoundCloud's signature orange accents**.

### Hide Cast icon
- Hides the Google Cast button in both toolbar menus and `ThemeableMediaRouteButton` views.

### Enable SoundCloud Go+ (experimental)
- Forces client-side `offline_sync`, `no_audio_ads`, and `hq_audio` feature flags (`GoFeatures`) and displays Go+ tier status (`UserConsumerPlan`, `Tier.HIGH`) to unlock the native offline track/playlist caching UI.

> [!WARNING]
> **Go+ Limitations — High-Quality Streaming & High-Quality Downloads Do NOT Work**
>
> Enabling `Enable SoundCloud Go+ (experimental)` only modifies client-side feature flags:
> - **What works:** Go+ UI badge, upsell gate bypass, and **standard-quality (`sq`) offline caching** via SoundCloud's native offline storage.
> - **What does NOT work:** **High-quality audio streaming (`HQ` / 256 kbps AAC / lossless) and high-quality downloads do NOT work.** Stream quality tiers and HQ audio URLs are validated and gated on SoundCloud's servers; selecting "High" in streaming/download settings still resolves standard-quality (`sq`) streams on free accounts.

---

## Disclaimer

This project is provided for **educational and personal interoperability purposes only**:
- **No affiliation:** Not affiliated with, endorsed by, or connected to SoundCloud or the Morphe project.
- **No warranty:** Provided "as is" without warranty of any kind. Use at your own risk.
- **No APK distribution:** Pre-patched APK binaries are not distributed in this repository. Apply the `.mpp` bundle to your own legally obtained APKM using Morphe.

---

## Building From Source

Requirements: **JDK 21** and an Android SDK (via `ANDROID_HOME` or `local.properties`).

```bash
./gradlew :extensions:soundcloud:testDebugUnitTest :patches:generatePatchesList
```

Built `.mpp` bundles are output to `patches/build/libs/patches-<version>.mpp`.
Releases, Git tags, `patches-bundle.json`, `patches-list.json`, and `CHANGELOG.md` are built and published automatically by GitHub Actions (`.github/workflows/release.yml`) on pushes to `main`.

---

## Credits & Upstream Attribution

This combined patch bundle integrates and builds upon open-source work from:
- [JohninNL/nl-morphe-patches](https://gitlab.com/johninnld/nl-morphe-patches) — *Home in Android Auto*, *Disable analytics*, *Disable consent popup*, *Remove ads and upsells*, and extension bridge architecture
- [lootdev78/psylos-morphe-patches](https://github.com/lootdev78/psylos-morphe-patches) — *Hide Cast icon*
- [V4n1X/morphe-patches](https://github.com/V4n1X/morphe-patches) — *AMOLED dark theme* and *Enable SoundCloud Go+* baseline overrides
- **Hoo-dles** & **kondratjev** — Original SoundCloud patch logic inherited via upstream repositories
- [MorpheApp/morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template) — Patcher API and automated Morphe release tooling

---

## License

Licensed under the **GNU General Public License v3.0 (GPLv3)**. See [`LICENSE`](LICENSE) and [`NOTICE`](NOTICE) (including Morphe GPLv3 Section 7c name restrictions and upstream notices).
