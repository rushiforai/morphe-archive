# X-Posed Patches for NewX

[Morphe](https://morphe.software) patches that bring
[X-Posed](https://github.com/xaitax/x-account-location-device)'s account location badges and
country filters to the Compose-based X (Twitter) Android app ("NewX"). This is a port of
[AetherMagee/xposed-patches](https://github.com/AetherMagee/xposed-patches), which targets
the older X 12.19.1.

## Install

Add this repository as a patch source in Morphe Manager:
https://morphe.software/add-source?github=Sylonin/xposed-newx-patches

Then patch the NewX APKM from APKMirror. The supported versions are the ones
[piko-newx](https://github.com/crimera/piko-newx) supports: 12.34.0-prod.01, 12.35.0-prod.01,
12.36.1-prod.01, 12.37.0-prod.01, 12.37.1-prod.01, 12.37.2-prod.01 and 12.38.1-prod.01. Only 12.37.2-prod.01
has been tested. The patch finds X's code by its structure, not by its obfuscated names, and
stops with an error instead of producing a broken app if something doesn't match.

It works on its own and alongside piko-newx.

## Features

- **Badges**: X-Posed's badge after names in post and reply headers, quotes, user lists, sheets and
  messages: country flag, optional device icon and location-warning shield, and the circled-i.
  X draws it as one of the name's badges, next to the verified badge. Badges are not shown on
  the profile page header.
- **Account sheet**: tap a badge to see what X reports about the account (country, connection
  source, location accuracy, affiliation) and highlight or hide posts from that country.
- **Country filters**: highlight (default) or hide posts and replies from chosen countries or X regions.
  A filtered quoted account only affects its quote card.
- **No passive engagement**: impressions, viewing time, video views and opening of filtered
  posts aren't reported to X. Likes, replies and reposts still are.
- **Settings and statistics**: badge style with a live preview, filters, highlight contrast,
  posts seen per country, cache hit rates and contributions, in a page styled like X's own.
  Open it from the account sheet.

Lookups go to the X-Posed community cache first, in batches of up to 100 handles. Misses
fall back to X's own "About this account" query, sent through the app's own signed-in
client. Fresh English results are contributed back to the cache, like the extension does.
Results are cached on the device for 60 days.

Badges show what X reports, not anyone's live location or the device used for a post. A
location warning is not proof of VPN use.

### Privacy

With the community cache on (default, can be turned off in settings), the handles of
accounts you see are sent to X-Posed's cache server (`x-posed-cache.xaitax.workers.dev`),
and what X reports about them is shared back. Your X session is never sent there.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v2.1.0](https://github.com/Sylonin/xposed-newx-patches/releases/tag/v2.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 NewX&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 12.34.0-prod.01 | 12.35.0-prod.01 | 12.36.1-prod.01 | 12.37.0-prod.01 | 12.37.1-prod.01 | 12.37.2-prod.01 | 12.38.1-prod.01 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Account location badges](#account-location-badges) | Shows X-Posed style country badges next to names and highlights or hides posts from chosen countries, without reporting passive engagement with them. Data comes from the X-Posed community cache, falling back to X's "About this account". Tap a badge for account details and settings. |  |

</details>

<!-- PATCHES_END -->

## Building

Requires JDK 21, the Android SDK and a GitHub token with `read:packages` for Morphe's
Gradle plugin.

```sh
GITHUB_ACTOR=<user> GITHUB_TOKEN=$(gh auth token) ./gradlew :patches:buildAndroid
```

The bundle is written to `patches/build/libs/patches-<version>.mpp`. With Nix, `devenv shell`
provides the toolchain and token. How the patch finds and hooks X's code is described in
[docs/HOOKS.md](docs/HOOKS.md).

## Credits

Built on [X-Posed](https://github.com/xaitax/x-account-location-device) by Alexander Hagenah
(MIT): badge design, country and region tables, icons and the community cache. Ported from
[xposed-patches](https://github.com/AetherMagee/xposed-patches) by AetherMagee (GPLv3), which
supplies the extension and the patch structure. Project setup and release tooling come from the
[Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). Follows the
approach of [piko](https://github.com/crimera/piko) for NewX. This project is not affiliated
with X-Posed, X Corp. or Morphe. Details are in [NOTICE](NOTICE).

## License

GPLv3, see [LICENSE](LICENSE) and [NOTICE](NOTICE).
