# X-Posed Patches

[Morphe](https://morphe.software) patches that bring
[X-Posed](https://github.com/xaitax/x-account-location-device)'s account location badges and
country filters to the X (Twitter) Android app.

## Install

Add this repository as a patch source in Morphe Manager:
https://morphe.software/add-source?github=AetherMagee/xposed-patches

Then patch X 12.19.1-release.0 (the APKM from APKMirror). Works on its own and alongside
[piko](https://github.com/crimera/piko).

## Features

- **Badges**: X-Posed's badge after names in post headers: country flag, optional device
  icon and location-warning shield, and the circled-i. Same look and sizes as the extension,
  drawn by X like its verified badge.
- **Account sheet**: tap a badge to see what X reports about the account (country, connection
  source, location accuracy, affiliation) and highlight or hide posts from that country.
- **Country filters**: highlight (default) or hide posts from chosen countries or X regions.
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
> **[v1.0.0](https://github.com/AetherMagee/xposed-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Twitter&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 12.19.1-release.0 |
| :---: |

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

The bundle is written to `patches/build/libs/patches-<version>.mpp`. Hook notes for porting
to new X versions are in [docs/HOOKS.md](docs/HOOKS.md).

## Credits

Built on [X-Posed](https://github.com/xaitax/x-account-location-device) by Alexander Hagenah
(MIT): badge design, country and region tables, icons and the community cache. This project
is not affiliated with X-Posed, X Corp. or Morphe.

## License

GPLv3, see [LICENSE](LICENSE) and [NOTICE](NOTICE).
