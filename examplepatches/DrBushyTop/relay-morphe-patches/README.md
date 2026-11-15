# Relay Morphe patches

Extra [Morphe](https://morphe.software) patches for Relay for Reddit, made to be applied together with
[patcheddit](https://github.com/wchill/patcheddit)'s Relay patches.

## ❓ About

- **Open Reddit images in the image viewer**: Reddit now sends browsers that open an `i.redd.it` or
  `preview.redd.it` link to the post page instead of the image. Relay only recognised `.jpg` and `.png`
  links as images, so a `.jpeg`, `.webp` or `?format=mp4` link in a comment opened the whole thread in
  the in-app browser. These links now open in Relay's own image and video viewer.
- **Show comment images inline**: Draws image and GIF links (Reddit uploads, Giphy and Imgur) inside the
  comment instead of as a bare link. Tapping one opens the full-screen viewer. A GIF opens as Reddit's MP4
  version, which has playback controls.
  - Images load only for comments on screen, newest first, three at a time. Comments that scroll away
    before their turn are not loaded.
  - Pictures go through Relay's own image cache, so opening one full screen doesn't download it again.
  - A strip of room under each picture works like the comment's text: tapping it collapses the comment
    instead of opening the picture.
  - A GIF shows a small still of its first frame first. On Wi-Fi the animation then loads and plays;
    on mobile data or any metered network the still stays, with a play button, and tapping it opens the MP4.
  - In a post marked NSFW, pictures stay hidden behind a "tap to open" box unless Relay's own
    Settings > Filters > NSFW Thumbnails is on.
  - The toggles are in Settings > Behaviour > Comments: **Inline pictures and GIFs** turns the feature
    off (comments show links as before), and **Only on Wi-Fi** shows links on mobile data or any metered
    network.
  - The patch includes the viewer fix above.
- **Prefer high refresh rate**: Relay never asks for a refresh rate, so on phones with an adaptive
  refresh rate it stays at 60 Hz, scrolling included. While Relay is drawing (scrolling, flinging,
  animating) it now asks for the display's highest refresh rate (120 Hz, 144 Hz, ...), and drops the
  request 0.6 s after the screen goes still, so static content can run at a lower rate again.
- **Night theme like OLED, grey in dim light** (off by default; for vivo phones): vivo's LTPO phones hold
  the screen at 60 Hz in dim light while half of it or more is darker than 49/255, so a black theme is held
  at 60 Hz exactly when the screen is dimmest. Measured on a vivo X300 Ultra, that costs more battery
  (about 30 mA) than dark grey does at that brightness. With this patch, Relay's **Night** theme looks the
  same as Night (OLED), but while the brightness setting is below 3% (auto-brightness in a dark room), its
  blacks fade to dark grey (51/255). Darker tones are lifted in proportion, so toolbars and cards stay apart,
  and text and anything brighter than 102/255 is unchanged. Pictures, videos (thumbnails, previews,
  pictures in comments) and web pages in Relay's browser keep their own colours; toolbars and buttons over
  them turn grey with the rest.
  Night (OLED) itself is not changed. Needs Android 13 or later.
- **Fix GIF sound**: For some GIF hosts, Relay asks the host for the video only when its remote config
  says so. Patcheddit turns remote config off, so Relay played Reddit's own copy of the clip, which has no
  sound. It now loads the original, with sound when the clip has it (Relay's "Mute videos" setting still
  starts it muted). The host's API no longer gives Relay's own API key the video files, so the patch uses
  the anonymous access the host's website uses. When the original can't be loaded (removed, or the host is
  down), Reddit's silent copy plays as before.
- **Fix video crashes**: Relay crashed on a post whose video has no URL (opening the post's More menu,
  for one), and when the video controls button was tapped before a video loaded.
- **Reject ad consent**: Relay's free version asks for consent to ad cookies and personal data with
  Google's consent form. The form now never shows, and Relay stores the answer "Reject all" gives: no
  consent and no legitimate interest for any purpose, special feature or vendor (IAB list and Google's
  other ad providers alike). Relay's ad networks read that answer, so only ads that need no consent
  (non-personalised, without cookies for tracking) can load. Any answer given before, including from the
  form in Relay's About screen, is replaced on each start.

Supported: Relay for Reddit 10.2.40 (`free.reddit.news`, the version patcheddit requires) and Relay Pro
10.2.40 (`reddit.news`). Only the free version is tested.

### How to use these patches

Add both sources to Morphe Manager, then patch Relay with patcheddit's patches and these together:

- https://github.com/wchill/patcheddit
- https://github.com/DrBushyTop/relay-morphe-patches

<a href="https://morphe.software/add-source?github=DrBushyTop/relay-morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.6.2](https://github.com/DrBushyTop/relay-morphe-patches/releases/tag/v1.6.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;14 patches total
<details open>
<summary>📦 Relay for Reddit&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**Package name:** `free.reddit.news`

**🎯 Supported versions:**

| 10.2.40 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix GIF sound](#fix-gif-sound) | Plays GIF videos from the site that hosts them, with sound, instead of Reddit's silent copy. When the original can't be loaded, Reddit's copy plays as before. |  |
| [Fix video crashes](#fix-video-crashes) | Stops Relay from crashing on a post whose video has no URL (when the post's More menu opens, for one) and when the video controls button is tapped before a video loads. |  |
| [Night theme like OLED, grey in dim light](#night-theme-like-oled-grey-in-dim-light) | Makes the Night theme look like Night (OLED), except at very low brightness, where its blacks turn dark grey. For vivo phones with an adaptive refresh rate: they hold a mostly black screen at 60 Hz in dim light, which uses more battery than the grey. Night (OLED) is not changed. |  |
| [Open Reddit images in the image viewer](#open-reddit-images-in-the-image-viewer) | Opens i.redd.it and preview.redd.it images (.jpeg, .webp, ...) in Relay's image viewer. Relay only recognised .jpg and .png, so these went to the browser, which Reddit now redirects to the comment thread. Also plays Reddit's MP4 copies of GIFs in Relay's video player. |  |
| [Prefer high refresh rate](#prefer-high-refresh-rate) | Asks for the display's highest refresh rate while Relay is scrolling or animating, so scrolling is not held at 60 Hz on adaptive refresh rate phones. The request is dropped once the screen is still, so static content can run at a lower rate. |  |
| [Reject ad consent](#reject-ad-consent) | Answers Relay's ad consent request (Google's cookie and personal data form) with "reject all" without showing it: no purposes, no vendors, no legitimate interest. An answer given before is replaced. |  |
| [Show comment images inline](#show-comment-images-inline) | Draws pictures and GIFs linked in a comment (Reddit uploads, Giphy, i.imgur) inside the comment instead of as a link. Tapping one opens it full screen as before. GIFs animate on Wi-Fi and show a still on mobile data. Follows Relay's NSFW Thumbnails setting. Can be turned off, or limited to Wi-Fi, in Settings > Behaviour > Comments. |  |

</details>

<details open>
<summary>📦 Relay for Reddit Pro&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**Package name:** `reddit.news`

**🎯 Supported versions:**

| 10.2.40 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix GIF sound](#fix-gif-sound) | Plays GIF videos from the site that hosts them, with sound, instead of Reddit's silent copy. When the original can't be loaded, Reddit's copy plays as before. |  |
| [Fix video crashes](#fix-video-crashes) | Stops Relay from crashing on a post whose video has no URL (when the post's More menu opens, for one) and when the video controls button is tapped before a video loads. |  |
| [Night theme like OLED, grey in dim light](#night-theme-like-oled-grey-in-dim-light) | Makes the Night theme look like Night (OLED), except at very low brightness, where its blacks turn dark grey. For vivo phones with an adaptive refresh rate: they hold a mostly black screen at 60 Hz in dim light, which uses more battery than the grey. Night (OLED) is not changed. |  |
| [Open Reddit images in the image viewer](#open-reddit-images-in-the-image-viewer) | Opens i.redd.it and preview.redd.it images (.jpeg, .webp, ...) in Relay's image viewer. Relay only recognised .jpg and .png, so these went to the browser, which Reddit now redirects to the comment thread. Also plays Reddit's MP4 copies of GIFs in Relay's video player. |  |
| [Prefer high refresh rate](#prefer-high-refresh-rate) | Asks for the display's highest refresh rate while Relay is scrolling or animating, so scrolling is not held at 60 Hz on adaptive refresh rate phones. The request is dropped once the screen is still, so static content can run at a lower rate. |  |
| [Reject ad consent](#reject-ad-consent) | Answers Relay's ad consent request (Google's cookie and personal data form) with "reject all" without showing it: no purposes, no vendors, no legitimate interest. An answer given before is replaced. |  |
| [Show comment images inline](#show-comment-images-inline) | Draws pictures and GIFs linked in a comment (Reddit uploads, Giphy, i.imgur) inside the comment instead of as a link. Tapping one opens it full screen as before. GIFs animate on Wi-Fi and show a still on mobile data. Follows Relay's NSFW Thumbnails setting. Can be turned off, or limited to Wi-Fi, in Settings > Behaviour > Comments. |  |

</details>

<!-- PATCHES_END -->

## 🧑‍💻 Development

- Work on the `dev` branch. Commits use semantic messages (`feat:`, `fix:`, `chore:`). `feat:` and `fix:`
  commits on `dev` make a pre-release, and merging `dev` into `main` makes a stable release. `release.yml`
  makes all releases and updates `patches-list.json`, `patches-bundle.json` and `CHANGELOG.md`; don't edit
  those by hand.
- Releases are signed with the key in the `MORPHE_SIGNING_KEY` secret; `morphe-signing.pub` is its public half.
- `adb shell setprop log.tag.RelayInlineMedia DEBUG` turns on the inline media patch's debug log;
  `RelayRefreshRate`, `RelayDimBlack`, `RelayGifSound` and `RelayAdConsent` do the same for the refresh rate, black level, GIF sound and ad consent patches.
- The extension is shrunk to `app.drbushytop.**` only (see `extensions/proguard-rules.pro`). That keeps its
  classes from colliding with patcheddit's extension when both bundles are applied to one APK.

### 🛠️ Building locally

Needs JDK 21 and the Android SDK. The Morphe Gradle plugin is fetched from GitHub Packages, which
needs a GitHub token:

```sh
export GITHUB_ACTOR=$(gh api user -q .login) GITHUB_TOKEN=$(gh auth token)
./gradlew buildAndroid
```

The bundle is written to `patches/build/libs/patches-*.mpp`. Apply it together with patcheddit's bundle
using [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop):

```sh
java -jar morphe-desktop-*-all.jar patch \
  -p patcheddit-patches.mpp -p patches/build/libs/patches-*.mpp \
  -o relay-patched.apk relay-10.2.40.apk
```

## 📜 License

These patches are licensed under the [GNU General Public License v3.0](LICENSE).
