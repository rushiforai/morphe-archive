# Letterboxd Morphe Patches

<div align="center">

Patches for the **Letterboxd** Android app (`com.letterboxd.letterboxd`),
built for [Morphe](https://morphe.software).

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg?style=flat-square)](https://www.gnu.org/licenses/gpl-3.0)
[![Built for Morphe](https://img.shields.io/badge/Built%20for-Morphe-1E5AA8?style=flat-square)](https://morphe.software)
[![Platform: Android](https://img.shields.io/badge/Platform-Android-3DDC84?style=flat-square&logo=android)](https://android.com)
[![GitHub Stars](https://img.shields.io/github/stars/mvaishak/letterboxd-morphe-patches?style=flat-square&logo=github)](https://github.com/mvaishak/letterboxd-morphe-patches/stargazers)
[![Total Downloads](https://img.shields.io/github/downloads/mvaishak/letterboxd-morphe-patches/total?style=flat-square&color=orange&label=total%20downloads)](https://github.com/mvaishak/letterboxd-morphe-patches/releases)
[![Latest Release Downloads](https://img.shields.io/github/downloads/mvaishak/letterboxd-morphe-patches/latest/total?style=flat-square&color=green&label=latest%20downloads)](https://github.com/mvaishak/letterboxd-morphe-patches/releases/latest)


</div>

---

## About

A collection of patches for Letterboxd on Android. Theming, layout
tweaks, a few small conveniences.

Almost everything lives in one in-app screen, **Letterboxd Mods**, instead of
the patcher. Pick your patches once. Change styling, ratings behaviour, and
which sections show up, any time, from inside the app.

Not affiliated with Letterboxd or the Morphe project.

---

## The Mods screen

Long-press the **settings gear on your profile tab** to open **Letterboxd
Mods** (needs the **Mod settings** patch, on by default). A one-time note
points this out the first time you launch after patching. Some changes apply
right away, others need a restart, and you'll be prompted either way.

### Custom artwork

Open a film's **More** menu and tap **Change poster and backdrop**. The
**LOCAL** badge marks the picker added by the patch.

1. Choose **Posters** or **Backdrops**. Connect TMDB with your **API Key (v3
   auth)** to browse artwork, or tap **Use image URL** and paste a direct HTTPS
   image link.
2. Preview the image and tap **Apply artwork**. To undo it, open the same tab
   and tap **Restore original poster** or **Restore original backdrop**.

On your own profile, use **Change backdrop**. Open **Letterboxd Mods →
Appearance → Artwork & appearance** to manage your TMDB connection and
**Artwork mode**. **Automatic** uses the native controls when your account has access to
them. **Always use local artwork** gives you the local picker, and **Off**
turns off local overrides. Local changes stay on this device.

### Backup and reset

Open **Letterboxd Mods → Backup & Reset** to export settings and all local artwork
assignments. Import accepts older settings backups and fills empty artwork slots.
The backup stores image links, so they still need to be reachable. Keep your
TMDB API key separately and re-enter it when you need to browse TMDB on a new device.

**Reset settings** restores the Mods defaults and keeps your artwork and key.
**Reset all Morphe data** also clears local artwork, the key, and Mods caches.
Both leave your Letterboxd account and app data in place. The all-data reset
clears caches owned by Mods. Letterboxd's shared image and WebView caches
follow the app's normal retention.

### IMDb trivia

With the **IMDb trivia (personal)** patch on Letterboxd 3.6.7, swipe the tabs on
a film page past **Releases** to reach **Trivia**. Use the filters to pick a
category, **Load more** to see more entries, and tap a spoiler to reveal it.
Films need an IMDb link.

The first few entries can load while you browse the film page. Open
**Help & About → Feature Guide** for patch requirements and more instructions.

### Appearance

- **Pure black (OLED)**: true-black surfaces. Elevated bits like cards and
  sheets stay a faint grey so the ratings histogram doesn't disappear into
  it. Needs Android 12+. Locked off while the separate **Material You theme**
  patch is on.
- **Accent colour**: recolours the stars, rating indicators, and the
  selected bottom-nav icon:
  - Nine presets (Letterboxd green, amber, orange, coral, pink, violet, blue,
    teal, mono), plus a full HSV/hex picker.
  - **Material You** (Android 12+, only shows up once **Material You theme**
    is on): your wallpaper's own palette, as three tones: Material You,
    Material You 2, Material You 3. Picked automatically once it's available.

### Navigation

- **Shown items**: choose and arrange the bottom bar destinations.
- **Launch tab**: choose where Letterboxd opens.
- **Match bottom nav to top bar**: paints the bottom nav bar black, matching
  the top bar.
- **Bottom nav selected style**: *Stock*, *No pill*, *No pill + white icon*,
  *No pill + accent icon*, or *Accent pill*. The green **+** is never touched.

### Home Screen

- **Home tabs**: choose and reorder the sections on Home.
- **Hide sponsored Spotlight**: hides the sponsored card on the Films tab.
  On by default when **Hide sponsored content** is patched in.
- **Hide Video Store**: removes the "Letterboxd Video Store" promo row from
  the Films tab. Off by default.

### Film Pages

- **Hide Where to Watch**: removes the "Where to watch" section from a
  film's page. Off by default.
- **Runtime as 1h 47m**: shows hours and minutes on film pages.
- **Open in player**: adds a small icon-only button beside Trailer on a
  film's page that opens it directly in **Stremio** or **Nuvio**, your pick.
  Off by default.

### Ratings & Spoilers

- **Hide ratings until watched**: covers a film's community rating (average
  + histogram) until you mark it watched. Resets every visit. Only the film
  page, ratings in lists and search are untouched. On by default.
  - **Cover**: what it looks like while hidden: *Frosted panel* (default),
    *Tap-to-show link*, *Shimmer*, or *Tap to burst*.
  - **Reveal animation**: how it disappears on tap, separate from the cover:
    *Pop*, *Crumble*, or *Confetti* (default).
  - **Confetti color**: only shows up once Confetti is picked: *Accent*,
    *Letterboxd colors* (default), or *Classic red*.
  - **Reveal haptic feedback**: a short vibration on reveal. On by default.

---

## Screenshots

A few of these were shot before things moved into the Mods screen. Same
settings, same look.

### Material You surface style

The two "Wallpaper tint" columns are two different device wallpapers: the dark
chrome tracks whatever palette Android hands it.

| | Wallpaper tint A | Wallpaper tint B | Pure black (OLED) |
| :--- | :---: | :---: | :---: |
| **Film page** | <img src="docs/screenshots/materialyou-wallpaper-film.jpg" width="200"> | <img src="docs/screenshots/materialyou-wallpaper2-film.jpg" width="200"> | <img src="docs/screenshots/materialyou-oled-film.jpg" width="200"> |
| **Home** | <img src="docs/screenshots/materialyou-wallpaper-home.jpg" width="200"> | <img src="docs/screenshots/materialyou-wallpaper2-home.jpg" width="200"> | <img src="docs/screenshots/materialyou-oled-home.jpg" width="200"> |

### Accent colour

Same film page, OLED surface: a preset swatch or any hex. Visible on the ratings
histogram and the selected bottom-nav tab.

| Letterboxd green | Amber | Blue |
| :---: | :---: | :---: |
| <img src="docs/screenshots/accent-green.jpg" width="220"> | <img src="docs/screenshots/accent-amber.jpg" width="220"> | <img src="docs/screenshots/accent-blue.jpg" width="220"> |

### Bottom nav selected style

The green **+** button is untouched in every mode.

| Stock (grey pill, blue icon) | No pill, white icon |
| :---: | :---: |
| <img src="docs/screenshots/bottomnav-stock.png" width="320"> | <img src="docs/screenshots/bottomnav-nopill-white.png" width="320"> |

| No pill, accent icon | Accent pill |
| :---: | :---: |
| <img src="docs/screenshots/bottomnav-nopill-accent.png" width="320"> | <img src="docs/screenshots/bottomnav-accent-pill.png" width="320"> |

### Denser poster grid

| Cozy | Dense |
| :---: | :---: |
| <img src="docs/screenshots/grid-default.jpg" width="220"> | <img src="docs/screenshots/grid-dense.jpg" width="220"> |

### Hide Video Store on home

| Before | After |
| :---: | :---: |
| <img src="docs/screenshots/videostore-before.jpg" width="220"> | <img src="docs/screenshots/videostore-after.jpg" width="220"> |

### Open in player

| Stremio button next to Trailer |
| :---: |
| <img src="docs/screenshots/open-in-player.png" width="220"> |

### Hide ratings until watched: cover

The film's community rating is fully covered until you tap.

| Confetti | Frosted panel | Tap to burst | Tap-to-show link |
| :---: | :---: | :---: | :---: |
| <img src="docs/screenshots/confetti.gif" width="220"> | <img src="docs/screenshots/spoiler-panel.jpg" width="220"> | <img src="docs/screenshots/spoiler-burst.jpg" width="220"> | <img src="docs/screenshots/spoiler-link.jpg" width="220"> |


---

## Install

1. On the device, open this link to add the source in Morphe Manager:
   <https://morphe.software/add-source?github=mvaishak/letterboxd-morphe-patches>
2. In the source settings, enable **pre-releases** for the newest (`dev`) builds,
   or leave it off for stable releases only.
3. Load a clean, unpatched Letterboxd APK from
   [APKMirror](https://www.apkmirror.com/apk/letterboxd/) or
   [Uptodown](https://letterboxd.en.uptodown.com/android). Not a file another
   tool has already patched or re-zipped.
4. Select the patches you want and patch.

> **Opening the Mods screen.** Almost everything configurable lives in one
> in-app screen. Long-press the **settings gear on your profile tab** to open
> it. A one-time note also shows on first launch after patching.

Use Letterboxd **3.6.7**, **3.5.6**, or **3.5.4** for the full patch set.
For updates, give Morphe a clean Letterboxd APK or APK bundle as input, then
install the new patched build over your current one.

---

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v3.0.1](https://github.com/mvaishak/letterboxd-morphe-patches/releases/tag/v3.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;15 patches total
<details open>
<summary>Letterboxd&nbsp;&nbsp;•&nbsp;&nbsp;15 patches</summary>
<br>

**Supported versions:**

| 3.6.7 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Adult posters](#adult-posters) | Adds a Mods setting to show unblurred adult film posters supplied by Letterboxd. |  |
| [Appearance](#appearance) | In-app appearance controls, adjustable from the Letterboxd Mods screen without re-patching: a true-black OLED surface, a custom accent colour (presets or any hex), and the bottom-navigation selected style. Applied at runtime via resource overlays on Android 12 and later. Needs the "Mod settings" patch. If the separate "Material You theme" patch is also applied, its OLED and nav-bar-match switches are disabled here automatically — the two theming systems can't run at once. |  |
| [Brighter Watched-by stars](#brighter-watched-by-stars) | Other people's star ratings in a film's "Watched by" row use a very dark grey (#445566) that is hard to read, especially on a black theme. This switches them to the lighter grey (#99AABB) the rest of the app already uses for other people's ratings. A small legibility fix, on by default. |  |
| [Change app icon](#change-app-icon) | Choose a built-in Letterboxd launcher icon from the App icon settings. |  |
| [Copy lists](#copy-lists) | Use Clone in a list's More menu to save an independent copy with the films in order. |  |
| [Custom artwork](#custom-artwork) | Choose local posters and backdrops from TMDB or an image URL, independently of your Letterboxd subscription. |  |
| [Denser poster grid](#denser-poster-grid) | Tightens the spacing around posters in grids so they render larger and closer together. Does not change the number of columns. | • Grid density |
| [Hide ads](#hide-ads) | Stops the Google AdMob banners shown to free accounts from loading anywhere in the app. On by default. |  |
| [Hide sponsored content](#hide-sponsored-content) | Hides Letterboxd's sponsored Spotlight / featured-trailer card on the Films home tab, including its space. Toggle it in Mod settings. On by default. |  |
| [IMDb trivia (personal)](#imdb-trivia-personal) | Shows categorized IMDb trivia for the current film. Enable only for authorized personal use. |  |
| [Material You theme](#material-you-theme) | Repaints Letterboxd's dark chrome — window background, surfaces, cards, the top bar, tab strip, bottom nav and sheets — from the device's Material You palette on Android 12+ (no effect below). No accent or OLED options here; those live in the "Mod settings" screen — but that screen's "Pure black (OLED)" and "Match bottom nav" switches turn themselves off while this patch is applied, since it already repaints those surfaces on its own. No effect on Jetpack Compose screens. |  |
| [Mod settings](#mod-settings) | HOW TO OPEN: long-press the settings gear on your profile tab. — This adds a "Letterboxd Mods" screen that collects the other patches' options (theme, accent, hide ratings, hide video store, hide where to watch, open in player, match bottom nav, etc.) so you can change them inside the app instead of re-patching. Some changes apply immediately, others after a restart, and you'll be prompted either way. | • Cover |
| [Profile badge](#profile-badge) | Preview a Pro, Patron, or custom badge on your own profile on this device. |  |
| [Rating slider haptics](#rating-slider-haptics) | Feel a light tick at each half-star step as you drag the rating slider. |  |
| [Smooth film credits tabs](#smooth-film-credits-tabs) | Shows already-loaded cast and crew credits immediately when switching film detail tabs. |  |

</details>

<!-- PATCHES_END -->


### Patch notes

**Hide sponsored content** (*on by default*): removes the sponsored Spotlight /
featured-trailer card and its space from the Films home tab. This is separate
from **Hide ads**, which blocks Google AdMob banners. Regular film trailers
and other home sections stay available. Use **Hide sponsored Spotlight** in
**Letterboxd Mods → Home** to show or hide the card after patching.

**Mod settings** bundles a few behaviours that used to be separate patches:
hiding the Video Store row, hiding Where to Watch, Open in player, hiding
ratings until watched, matching the bottom nav. All of it lives in
[The Mods screen](#the-mods-screen) above.

**Appearance** (*on by default, Android 12+*): OLED, accent colour
(including Material You), and the bottom-nav selected style. Needs **Mod
settings**.

**Material You theme** (*opt-in, Android 12+*): repaints the app bar, tab
strip, bottom nav, cards, and sheets to your wallpaper palette. Different
from the Material You accent option above, this one repaints the whole
chrome, and needs a re-patch to change. Turning it on locks the OLED and
bottom-nav-match switches in Mod settings.

**Denser poster grid** (*opt-in*): tightens the spacing around posters so
they're bigger and closer together. Same column count. Density (Cozy /
Compact / Dense) is picked at patch time, not from Mod settings.

**Brighter Watched-by stars** (*on by default*): switches other people's
star ratings in a film's "Watched by" row to the lighter grey the rest of
the app already uses. Always on.

## Building

Use the [Morphe UI design playbook](docs/design/MORPHE_DESIGN_PLAYBOOK.md)
when adding or changing UI.

Requires a JDK 21 and the Android SDK (platform 36, build-tools 36).

```bash
./gradlew buildAndroid
```

The bundle is written to `patches/build/libs/patches-*.mpp`; apply it with
[Morphe Desktop](https://github.com/MorpheApp/morphe-desktop). See the
[Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more.

---

## Releasing

Handled by `release.yml` and semantic-release. Do not tag or upload releases by
hand, and do not edit the generated files (`patches-list.json`,
`patches-bundle.json`, `CHANGELOG.md`, or the patch table above).

- Work on the **`dev`** branch with
  [conventional commits](https://www.conventionalcommits.org): `feat:` and `fix:`
  cut a pre-release; `chore:` and `docs:` do not. A commit with a
  `BREAKING CHANGE:` footer (or a `!` after the type) cuts a **major** release
  regardless of type.
- Pushing to `dev` builds a pre-release and opens a `dev` to `main` pull request.
- Merge that pull request with a merge commit (not squash) to cut a stable
  release.

---

## Acknowledgements

The runtime `.arsc` resource-overlay theming technique behind **Appearance**
(Material You / OLED) is adapted from
[Piko](https://github.com/crimera/piko), a Morphe patches collection for
Twitter/X and Instagram. See [NOTICE](NOTICE) for the credit owed under
Piko's GPLv3 Section 7 terms.

## License

[GNU General Public License v3.0](LICENSE). See [NOTICE](NOTICE) for Morphe's
and Piko's additional conditions under GPLv3 Section 7.
