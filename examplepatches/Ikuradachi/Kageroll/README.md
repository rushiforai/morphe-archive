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
> **[v1.3.0](https://github.com/Ikuradachi/Kageroll/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 Crunchyroll&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**Package name:** `com.crunchyroll.crunchyroid`

**🎯 Supported versions:**

| 3.127.0 | 3.128.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow screenshots](#allow-screenshots) | Removes FLAG_SECURE from membership card and Compose dialogs to permit screenshots and disables Android 14+ screen capture detection in the Arc reader. |  |
| [Disable telemetry](#disable-telemetry) | Blocks Segment and Mux events, disables Firebase Analytics after consent updates, denies automatic Crashlytics uploads and selects disabled Datadog setup. SDK initialization, queued Segment events, local metadata, Firebase collection before consent updates, local crash recording and explicit report submission remain; independent Braze and Singular behavior is unchanged. |  |
| [Picture-in-Picture](#picture-in-picture) | Enables native Picture-in-Picture playback support. |  |
| [Playback speed](#playback-speed) | Unhides the player's speed menu and fills it out to 0.5x-2.0x. |  |
| [Proxy token requests](#proxy-token-requests) | Routes token acquisition and refresh through your SOCKS proxy, with optional proxy authentication. | • SOCKS proxy host<br>• SOCKS proxy port<br>• SOCKS proxy username<br>• SOCKS proxy password<br>• Local token diagnostics |

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
