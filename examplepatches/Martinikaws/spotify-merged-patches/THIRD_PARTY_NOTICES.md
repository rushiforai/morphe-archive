# Third-party sources

This repository retains the upstream GPL-3.0 license and Morphe NOTICE.
The following revisions document the source used for the first milestone.

## Morphe patch template

The repository began with
[MorpheApp/morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template/tree/f99b2938bd25b202a6185a774d487a07d1061915)
at `f99b2938bd25b202a6185a774d487a07d1061915`, under GPL-3.0 and its NOTICE.
Build files, the Gradle wrapper, and release tooling originate there.
September 17, 2026 modifications replace example patches, project metadata,
documentation, and issue forms, and add tests and release verification gates.

## Historical Spotify implementations

[anddea/revanced-patches](https://github.com/anddea/revanced-patches/tree/3174510163d9787571bd93275b54932b575f82ed)
at `3174510163d9787571bd93275b54932b575f82ed` provides the GPL-3.0 historical
reference for these features:

- `patches/src/main/kotlin/app/revanced/patches/spotify/layout/theme/CustomThemePatch.kt`
- `patches/src/main/kotlin/app/revanced/patches/spotify/misc/privacy/Fingerprints.kt`
- `patches/src/main/kotlin/app/revanced/patches/spotify/misc/privacy/SanitizeSharingLinksPatch.kt`
- `extensions/shared/src/main/java/app/revanced/extension/spotify/misc/privacy/SanitizeSharingLinksPatch.java`

The theme's color map starts from that implementation's resource selection
and extends it to the colors listed in `patches/src/main/resources/theme/`,
checked against Spotify 9.1.80.2221. The patch requires each mapped color
exactly once, edits no color values, and declares the mapped colors
overlayable. It does not import the historical extension, animation hooks, or
icon assets.

The sharing implementation uses a new fingerprint for Spotify 9.1.80.2221's
URL builder. Its new Java helper removes named tracking parameters while
preserving other query parameters and fragments, instead of truncating the
query. These adaptations were made on September 17, 2026.

No code from binary-only candidates was imported. Spotify APKs and other
proprietary assets are excluded.

## Morphe theme overlay

`ThemeOverlay.java` ports the self-targeting overlay technique of Morphe's
[`ThemeColorOverlay.java`](https://github.com/MorpheApp/morphe-patches/blob/86e146c54bad8450265f2ac2d734722fd682794c/extensions/shared-youtube/library/src/main/java/app/morphe/extension/shared/theme/ThemeColorOverlay.java)
in MorpheApp/morphe-patches (GPL-3.0 with the Morphe NOTICE this repository
retains), at `86e146c54bad8450265f2ac2d734722fd682794c`. Its header keeps
Morphe's copyright and notice reference. `ThemeRuntime.java` follows Morphe in
registering the overlay on every start, because Android deletes an app's own
overlays when it is installed again. Local changes, made on September 25,
2026: one overlay for all mapped Spotify colors instead of separate dark and
light background overlays, a single shared `ResourcesLoader` that is updated
in place, and loading through activity lifecycle callbacks instead of
Morphe's base-context hook. On October 2, 2026: each update closes the
provider it replaces.

## Spicetify color schemes

`SpicetifyTheme.java` reads a pasted `color.ini` the way desktop Spicetify
does. It reimplements the color rules of `ParseColor` in
[`src/utils/color.go`](https://github.com/spicetify/cli/blob/2b32e6a5cabe64c577c5f153eca91e931c33455f/src/utils/color.go)
from spicetify/cli at `2b32e6a5cabe64c577c5f153eca91e931c33455f`
(LGPL-2.1), and the section, key and comment rules of
[go-ini](https://github.com/go-ini/ini/tree/v1.67.0) v1.67.0 (Apache-2.0),
which the CLI reads the file with. No code is copied. Local changes: a value
that starts with `#` is a `#RGB`, `#RRGGBB` or `#AARRGGBB` color instead of
a comment, spaces around decimal channels are ignored, and values the CLI
would complete with defaults, clamp, or read from the desktop
(`${xrdb:...}` and environment variables) are skipped, as are lines it
would reject.

## Spicetify Marketplace

The Marketplace page follows the discovery, blacklist and manifest rules of
[spicetify/marketplace](https://github.com/spicetify/marketplace/tree/ec6f772891bad4bf08b645447c2ade6b06c4f991)
at `ec6f772891bad4bf08b645447c2ade6b06c4f991` (MIT), reimplemented in Java.
No code or assets are copied. The blacklist is fetched at runtime from that
repository's `main` branch. Local changes: only themes with a color scheme
Spotify can use are listed, most stars first; with the extensions patch,
extensions are listed on a tab of their own, those with an Android version
first, and an extension repository with no Android version is listed from its
search result, by its name and description, without its manifest; only the
first 50 items of a manifest are read, and long names and descriptions are cut
short; and the list is cached for six hours.

## Galaxy

A theme's background image is shown the way
[harbassan/spicetify-galaxy](https://github.com/harbassan/spicetify-galaxy/tree/2b2e33c02c5adffd6737e4a93c261e961fad8eca),
at `2b2e33c02c5adffd6737e4a93c261e961fad8eca`, shows one on desktop: the image
fills the window, center-cropped and darkened, Spotify's page background turns
see-through over it, and blurring it is an option that starts off. The
Marketplace's Galaxy V2 entry downloads that repository's `color.ini`,
`preview_playlist.png` and `assets/default_bg.jpg` from its `main` branch when
it's shown or applied. Galaxy's own Marketplace listing brings the same image:
its `theme.js` names it as `defImage`, and both are downloaded when the theme
is applied. That repository has no license, so nothing from it is copied or
bundled: no code, CSS, or images.

## Spicetify extensions

Trash Bin follows the behavior of Spicetify's desktop extension
[`Extensions/trashbin.js`](https://github.com/spicetify/cli/blob/7bd6df4b2197132e201c68150f720a4f6f0abd83/Extensions/trashbin.js)
in spicetify/cli (LGPL-2.1, by khanhas and OhItsTom), at
`7bd6df4b2197132e201c68150f720a4f6f0abd83`. It is reimplemented in Java for
Spotify's Android player, and no code is copied. The trash list keeps the
desktop export format, `{"songs":{uri:true},"artists":{uri:true}}`, so a list
exported on one moves to the other.

Shuffle+ follows the behavior of Spicetify's desktop extension
[`Extensions/shuffle+.js`](https://github.com/spicetify/cli/blob/e95f8025c133c277c6601b1977cf3b39a2fa5c2f/Extensions/shuffle+.js)
in spicetify/cli (LGPL-2.1, by khanhas and Tetrax-10), at
`e95f8025c133c277c6601b1977cf3b39a2fa5c2f`: it lists every song of a playlist,
an album or Liked Songs, shuffles them with Fisher-Yates, and plays that exact
order. It is reimplemented in Java for Spotify's Android player, and no code is
copied.

Hide podcasts follows the behavior of the desktop extension
[`hidePodcasts.js`](https://github.com/theRealPadster/spicetify-hide-podcasts/tree/cc3e71597c5aee760e1003529147bec00a8a8a2d)
in theRealPadster/spicetify-hide-podcasts (GPL-3.0), at
`cc3e71597c5aee760e1003529147bec00a8a8a2d`. Only its behavior is followed: it
hides podcasts on Home and in Search, and audiobooks unless that option is
turned off. It is reimplemented in Java for Spotify's Android screens, and no
code is copied.

## APK reverse engineering skill

`.agents/skills/apk-reverse` contains the skill directory from
[newliver666/apk-reverse](https://github.com/newliver666/apk-reverse/tree/7b6c6932a95f03d778e81e5e1a2cbf6f62dc97fd)
at `7b6c6932a95f03d778e81e5e1a2cbf6f62dc97fd`, under the MIT license.
The upstream copyright and license are retained in the skill's
[LICENSE](.agents/skills/apk-reverse/LICENSE). The imported files are unchanged;
`UPSTREAM.json` records their provenance. This development tool is separate
from the patch bundle and Android extension.
