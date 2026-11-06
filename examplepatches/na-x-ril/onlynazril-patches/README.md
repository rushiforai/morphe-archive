# 👋🧩 onlynazril Patches

Personal patch collection for apps I use: labels on names, and the details apps leave out.

## ❓ About

Patches are built on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template)
and follow the [Morphe patcher](https://github.com/MorpheApp/morphe-patcher). The bundle currently
targets TikTok, where it shows the account handle, the region and the post time next to names on
the feed (including a video shared into a chat) and in comments; filters ads and out-of-range videos
out of the feed; saves a share sheet's media without the watermark; sets a profile background where
the rollout has not reached; and draws the app's text in a font file you import. Holding the Home
tab in the bottom bar opens Tweaks, where every one of those is switched on or off. More apps are
planned.

> The AMOLED theme patch is optional and experimental. It rewrites resource colours, can leave some
> screens uneven or affect the light theme, and is undone only by repatching. See
> [docs/amoled.md](docs/amoled.md).

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=na-x-ril/onlynazril-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.5.0](https://github.com/na-x-ril/onlynazril-patches/releases/tag/v1.5.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;10 patches total
<details open>
<summary>📦 TikTok&nbsp;&nbsp;•&nbsp;&nbsp;10 patches</summary>
<br>

**🎯 Supported versions:**

| 47.7.1 | 47.7.2 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED code colours](#amoled-code-colours) | Replaces opaque dark surface colours held as constants in code with black. Pulled in by AMOLED theme; does nothing for resources. |  |
| [AMOLED theme](#amoled-theme) | Total AMOLED: every colour whose brightest channel is 0x60 or lower becomes black, alpha kept. Borders and controls lose their separation too; repatch to undo. |  |
| [Always @handle · region · post time](#always-handle-region-post-time) | Shows the @handle, the region and the post time on feed videos and comments, including a video shared into a chat. Each surface and each part has a switch in Tweaks. |  |
| [Copy comments without username](#copy-comments-without-username) | Leaves the username out of a copied comment: the clipboard gets the comment's own text. On by default; the switch is in Tweaks. |  |
| [Custom font](#custom-font) | Answers every resolver TikTok gets one of its own faces from - the native factory, the Compose loader, the asset loader Lynx reads and the WebView interceptor hybrid pages are fed through - so an imported font file replaces TikTok's own text on every surface. The switch and the picker are in Tweaks; off by default, and inert until a font is imported. |  |
| [Download](#download) | Opens the app's own download for every share sheet and saves the file without the watermark, taking the highest quality variant. Each part has a switch in Tweaks; the feature is off by default. |  |
| [Feed filter](#feed-filter) | Removes ads and promotional-music posts, and videos outside a view- or like-count range, from the feed. Each part has a switch in Tweaks; ads are on by default. |  |
| [Hide CAPTCHA popups](#hide-captcha-popups) | Skips the risk-control puzzle TikTok shows while browsing, and lets the app carry on. Account verification (login, SMS or two-factor) is never hidden. On by default; the switch is in Tweaks. |  |
| [Profile background](#profile-background) | Answers the AB gate that carries the profile background, so a static image or a video can be set on accounts the rollout has not reached. The switch is in Tweaks; the feature is off by default. |  |
| [Tweaks screen](#tweaks-screen) | Hosts the Tweaks screen, where every other patch in this bundle is switched on or off: the @handle stamp and its surfaces, the region, the post time, the comment copy, the captcha, the feed filter, the download, the profile background and the custom font. Hold the Home tab in the bottom bar to open it. |  |

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
