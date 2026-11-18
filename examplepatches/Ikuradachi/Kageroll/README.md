# Kageroll

Crunchyroll patches for use with Morphe.

## ❓ About

Kageroll focuses exclusively on patches for the Crunchyroll Android app. Patch requests and bug reports should relate to Crunchyroll.

This is an independent project, not affiliated with or endorsed by Crunchyroll or the Morphe project. Available patches and supported app versions are listed below when published.

### How to use these patches

Click the button below, or manually add this repo URL to Morphe Manager: https://github.com/Ikuradachi/Kageroll

<a href="https://morphe.software/add-source?github=Ikuradachi/Kageroll">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.5.0](https://github.com/Ikuradachi/Kageroll/releases/tag/v1.5.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;10 patches total
<details open>
<summary>📦 Crunchyroll&nbsp;&nbsp;•&nbsp;&nbsp;10 patches</summary>
<br>

**Package name:** `com.crunchyroll.crunchyroid`

**🎯 Supported versions:**

| 3.129.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [1080p download quality](#1080p-download-quality) | Upgrades the High offline download quality tier to 1080p and selects the single best matching video track. |  |
| [Allow screenshots](#allow-screenshots) | Removes FLAG_SECURE from membership card and Compose dialogs to permit screenshots and disables Android 14+ screen capture detection in the Arc reader. |  |
| [Auto-skip segments](#auto-skip-segments) | Automatically skips intros, recaps, credits, previews, or promos in the video player. | • Auto-skip intros<br>• Auto-skip recaps<br>• Auto-skip credits<br>• Auto-skip next-episode previews<br>• Auto-skip promos |
| [Disable background services](#disable-background-services) | Disables background broadcast receivers, schedulers, widget polling, Firebase sessions initialization and service binding, and DataTransport JobScheduler tasks to eliminate background wakeups and idle battery drain. |  |
| [Disable telemetry](#disable-telemetry) | Blocks Segment initialization, Mux events, advertising ID lookup, Firebase Analytics pre-init, Crashlytics NDK native loading, Braze session and push flush alarms, and Datadog uploads; disables Firebase Analytics after consent updates, denies automatic Crashlytics uploads, and selects disabled Datadog setup. |  |
| [Manual video quality](#manual-video-quality) | Replaces the preset quality tiers with manual per-resolution selection and Auto. |  |
| [Picture-in-Picture](#picture-in-picture) | Enables native Picture-in-Picture playback support. |  |
| [Playback speed](#playback-speed) | Unhides the player's speed menu and fills it out to 0.5x-2.0x. |  |
| [Proxy token requests](#proxy-token-requests) | Routes token acquisition and refresh through your SOCKS proxy, with optional proxy authentication. | • SOCKS proxy host<br>• SOCKS proxy port<br>• SOCKS proxy username<br>• SOCKS proxy password<br>• Local token diagnostics |
| [Suppress bloat workers](#suppress-bloat-workers) | Forces Google Engage, Continue Watching, Datadog, and OneTrust CMP background workers to return success immediately without performing network requests, disk I/O, or image prefetching. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 🙏 Credits

Thanks to [MeGaNeKoS](https://github.com/MeGaNeKoS) and the contributors to [CR-Unblocker](https://github.com/MeGaNeKoS/CR-Unblocker) for their work on proxy-based access to region-restricted Crunchyroll content, which inspired Kageroll's proxy token requests patch.

Kageroll was also inspired by Yomiroll, a former extension for Aniyomi. Thanks to its creators and contributors.

## 📜 License

Kageroll is licensed under the [GNU General Public License v3.0](LICENSE). See [NOTICE](NOTICE) for naming and branding restrictions.
