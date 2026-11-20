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
> **[v1.6.0](https://github.com/Ikuradachi/Kageroll/releases/tag/v1.6.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;23 patches total
<details open>
<summary>📦 Crunchyroll&nbsp;&nbsp;•&nbsp;&nbsp;23 patches</summary>
<br>

**Package name:** `com.crunchyroll.crunchyroid`

**🎯 Supported versions:**

| 3.129.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [1080p download quality](#1080p-download-quality) | Upgrades the High offline download quality tier to 1080p and selects the single best matching video track. |  |
| [ASS subtitle style & margin override](#ass-subtitle-style-margin-override) | Customizes ASS subtitle font scale, bottom margin, outline, shadow, and colors, and adapts subtitle viewport margins to the active video aspect ratio and resize mode. | • Subtitle font scale<br>• Scale inline s tags<br>• ASS bottom MarginV offset<br>• Extra bottom screen margin (dp)<br>• Outline thickness<br>• Shadow depth<br>• Primary text color<br>• Outline color<br>• Adapt margins to aspect & resize mode |
| [Allow screenshots](#allow-screenshots) | Removes FLAG_SECURE from membership card and Compose dialogs to permit screenshots and disables Android 14+ screen capture detection in the Arc reader. |  |
| [Aspect mode cycle & persistence](#aspect-mode-cycle-persistence) | Cycles video aspect modes (Fit, Zoom, Fill) on pinch and remembers the selected mode across sessions. | • Enable 3-way aspect cycle<br>• Default aspect mode |
| [Auto-skip segments](#auto-skip-segments) | Automatically skips intros, recaps, credits, previews, or promos in the video player. | • Auto-skip intros<br>• Auto-skip recaps<br>• Auto-skip credits<br>• Auto-skip next-episode previews<br>• Auto-skip promos |
| [Controls auto-hide timeout](#controls-auto-hide-timeout) | Customizes the delay before player controls automatically hide, or disables auto-hiding. | • Controls auto-hide timeout (ms) |
| [Disable background services](#disable-background-services) | Disables background broadcast receivers, schedulers, widget polling, Firebase sessions initialization and service binding, and DataTransport JobScheduler tasks to eliminate background wakeups and idle battery drain. |  |
| [Disable telemetry](#disable-telemetry) | Blocks Segment initialization, Mux events, advertising ID lookup, Firebase Analytics pre-init, Crashlytics NDK native loading, Braze session and push flush alarms, and Datadog uploads; disables Firebase Analytics after consent updates, denies automatic Crashlytics uploads, and selects disabled Datadog setup. |  |
| [Hide feed & show promos](#hide-feed-show-promos) | Hides promotional cards, vertical promo rows, floating action buttons, and show-page promo banners. | • Hide CR Arc feed card<br>• Hide hero carousel<br>• Hide game promo cards<br>• Hide media promo cards<br>• Hide Games rows<br>• Hide Manga rows<br>• Hide Music rows<br>• Hide Go Premium button<br>• Hide promotional FAB<br>• Hide CR Arc FAB<br>• Hide show page promo banner |
| [Hide maturity rating overlay](#hide-maturity-rating-overlay) | Hides the maturity rating overlay when starting or resuming playback. |  |
| [Manual video quality](#manual-video-quality) | Replaces the preset quality tiers with manual per-resolution selection and Auto. |  |
| [Picture-in-Picture](#picture-in-picture) | Enables native Picture-in-Picture playback support. |  |
| [Playback speed](#playback-speed) | Unhides the player's speed menu and expands playback speed options up to 4.0x. | • Maximum playback speed |
| [Player gestures](#player-gestures) | Enables pinch-to-zoom, double-tap-to-seek, and vertical swipe gestures for brightness and volume. | • Enable pinch-to-zoom<br>• Enable double-tap-to-seek<br>• Enable brightness swipe<br>• Enable volume swipe |
| [Player preference defaults](#player-preference-defaults) | Overrides initial default values for audio language, subtitles, autoplay, cellular streaming, closed captions, audio description, and playback speed. | • Default audio language<br>• Default subtitle language<br>• Default autoplay<br>• Default stream over cellular<br>• Default closed captions<br>• Default audio description<br>• Default playback speed |
| [Proxy token requests](#proxy-token-requests) | Routes token acquisition and refresh through your SOCKS proxy, with optional proxy authentication. | • SOCKS proxy host<br>• SOCKS proxy port<br>• SOCKS proxy username<br>• SOCKS proxy password<br>• Local token diagnostics |
| [Remaining time toggle](#remaining-time-toggle) | Allows tapping the player timestamp or duration to toggle between elapsed time and remaining time (-MM:SS). | • Start in remaining time mode |
| [Screen & orientation lock](#screen-orientation-lock) | Adds a screen lock toggle to the player toolbar and locks orientation against accidental rotation. | • Add screen lock button<br>• Lock orientation while screen is locked<br>• Always ignore rotation fullscreen changes |
| [Seek interval](#seek-interval) | Customizes the double-tap and rewind/fast-forward seek interval in the video player. | • Seek interval (seconds) |
| [Skip animated splash](#skip-animated-splash) | Skips the animated startup splash video and its audio focus request, and skips cold-start checkout WebView preloading. | • Skip animated splash video<br>• Skip RazorPay WebView preload |
| [Suppress bloat workers](#suppress-bloat-workers) | Forces Google Engage, Continue Watching, Datadog, and OneTrust CMP background workers to return success immediately without performing network requests, disk I/O, or image prefetching. |  |
| [Suppress modals & prompts](#suppress-modals-prompts) | Suppresses Braze in-app message overlays, Play in-app review prompts, Play in-app update prompts, and the startup notification permission prompt. | • Discard Braze in-app messages<br>• Disable Play in-app review<br>• Disable Play in-app updates<br>• Suppress notification permission prompt |
| [Up Next banner window](#up-next-banner-window) | Customizes how many seconds before the end of an episode the Up Next banner appears. | • Up Next banner window (seconds) |

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
