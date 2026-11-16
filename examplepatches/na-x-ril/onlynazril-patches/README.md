# 👋🧩 onlynazril Patches

Personal patch collection for apps I use: labels on names, and the details apps leave out.

## ❓ About

Patches are built on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template)
and follow the [Morphe patcher](https://github.com/MorpheApp/morphe-patcher). The bundle currently
targets TikTok, where it shows the account handle, the region and the post time next to names on
the feed (including a video shared into a chat) and in comments; filters ads and out-of-range videos
out of the feed; saves a share sheet's media without the watermark; sets a profile background where
the rollout has not reached; draws the app's text in a font file you import; asks for a display
refresh rate from Tweaks; and can hide the image-search entry TikTok shows while a video is paused.
Holding the Home tab in the bottom bar opens Tweaks, where every one of those is switched on or
off. More apps are planned.

> The AMOLED theme patch is experimental and on by default. It rewrites resource colours and
> code-held constants to black, can leave some screens uneven or affect the light theme, and is
> undone only by repatching. See [docs/amoled.md](docs/amoled.md).

### How to use these patches

[Add to Morphe Manager](https://morphe.software/add-source?github=na-x-ril/onlynazril-patches)

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.6.0](https://github.com/na-x-ril/onlynazril-patches/releases/tag/v1.6.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;13 patches total
<details open>
<summary>📦 TikTok&nbsp;&nbsp;•&nbsp;&nbsp;13 patches</summary>
<br>

**🎯 Supported versions:**

| 47.7.1 | 47.7.2 | 47.7.3 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description |
|----------|----------------|
| [AMOLED theme](#amoled-theme) | Full AMOLED: every dark resource colour and code-held constant becomes black, alpha kept. Borders and controls lose their separation too; repatch to undo. |
| [App refresh rate](#app-refresh-rate) | Sets the app's preferred display refresh rate. In Tweaks: Default (system), 60 fps, 90 fps or 120 fps. On by default; Default leaves the rate to Android. |
| [Copy comments without username](#copy-comments-without-username) | Leaves the username out of a copied comment: the clipboard gets the comment's own text. On by default; the switch is in Tweaks. |
| [Custom font](#custom-font) | Answers every resolver TikTok gets one of its own faces from - the native factory, the Compose loader, the asset loader Lynx reads and the WebView interceptor hybrid pages are fed through - so an imported font file replaces TikTok's own text on every surface. The switch and the picker are in Tweaks; off by default, and inert until a font is imported. |
| [Download](#download) | Opens the app's own download for every share sheet and saves the file without the watermark, taking the highest quality variant. Each part has a switch in Tweaks; the feature is off by default. |
| [Feed filter](#feed-filter) | Removes ads, promotional-music posts, survey cards, LIVE items, drama videos, and videos outside a view- or like-count range from the feed. Each part has a switch in Tweaks; ads are on by default, survey, LIVE and drama are off. |
| [Handle, time & region](#handle-time-region) | Shows the @handle, the region and the post time on feed videos and comments, including a video shared into a chat. Each surface and each part has a switch in Tweaks. |
| [Hide CAPTCHA popups](#hide-captcha-popups) | Skips the risk-control puzzle TikTok shows while browsing, and lets the app carry on. Account verification (login, SMS or two-factor) is never hidden. On by default; the switch is in Tweaks. |
| [Keep screen on](#keep-screen-on) | Keeps the display awake while TikTok is open, so a video does not dim the screen. Off returns the system screen timeout. On by default; the switch is in Tweaks. |
| [Pause image search](#pause-image-search) | Adds a switch to disable the image-search entries TikTok shows while a video is paused, including the pause-panel row and the visual search pill. On by default; turn it off to show them again. |
| [Profile background](#profile-background) | Answers the AB gate that carries the profile background, so a static image or a video can be set on accounts the rollout has not reached. The switch is in Tweaks; the feature is off by default. |
| [Resume playback](#resume-playback) | Continues a video from where you stopped. The twelve most recently opened videos are kept until the app closes; the first and last seconds, set in Tweaks, are skipped. |
| [Tweaks screen](#tweaks-screen) | Hosts the Tweaks screen, where every other patch in this bundle is switched on or off: the @handle stamp and its surfaces, the region, the post time, the comment copy, the captcha, the feed filter, the download, the profile background and the custom font. Hold the Home tab in the bottom bar to open it. |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid` (needs the GitHub token described above)
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

onlynazril Patches are licensed under the [GNU General Public License v3.0](LICENSE).

Files under `patches/src/main/kotlin/app/morphe/` are derived from other GPLv3 projects and keep
their own headers; the additional terms are in [NOTICE](NOTICE).
