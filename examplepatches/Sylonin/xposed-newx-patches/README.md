# X-Posed Patches for NewX

[Morphe](https://morphe.software) patches that bring
[X-Posed](https://github.com/xaitax/x-account-location-device)'s account location badges and
country filters to the Compose-based X (Twitter) Android app ("NewX"). This is a port of
[AetherMagee/xposed-patches](https://github.com/AetherMagee/xposed-patches), which targets
the older X 12.19.1.

## Install

Add this repository as a patch source in Morphe Manager:
https://morphe.software/add-source?github=Sylonin/xposed-newx-patches

Then patch the NewX APKM from APKMirror, version 12.40.1-prod.01 or newer. The patch refuses
older versions. 12.40.1-prod.01 and 12.41.0-prod.01 have been tested on their own and together
with [piko-newx](https://github.com/crimera/piko-newx) 3.75.0; newer versions have not. The patch
finds X's code by its structure, not by its obfuscated names, and stops with an error instead of
producing a broken app if something doesn't match.

## Features

- **Badges**: X-Posed's badge after names in post and reply headers, quotes, user lists, sheets,
  the profile page header, and messages (chat headers, the inbox and message requests): country
  flag, device icon, location-warning shield, and the circled-i. Device icons and the shield
  are on by default, as in X-Posed. X draws the badge as one of the name's badges, next to the
  verified badge.
- **Account sheet**: tap a badge for X-Posed's account card. It shows the profile picture,
  name and checkmark (blue, gold for organizations, grey for government), "Identity
  verified" and "Protected", the country, connection source and location accuracy, and
  followers, following and posts. Under "Account details" it lists when the account was
  created and its age, when it was verified, how often its handle changed, its affiliation
  with the organization's badge and link, and its user ID; tap the ID to copy a link to the
  account that keeps working after handle changes. X doesn't load media counts, so the card
  has none. Copy, save (to Pictures/X-Posed) or share the card as an image in X's current
  theme. From the sheet, highlight or hide posts from that country or from the account
  itself, or add the account to Always Show.
- **Share posts**: turn on "Show share button" in the badge settings for a button after the
  badge on posts. It makes an image of the post as X-Posed's evidence card: author, text,
  up to four photos, date and counts, and what X reports about the account's location and
  connection, with the post's link and the capture time in UTC. Copy, save or share the
  image. Under "Post on X", "Open in X" opens X's own post composer with the image attached
  and your text, as a quote of the post, a reply to it or a new post. Nothing is posted until
  you tap Post in X.
- **Filters**: highlight (default) or hide posts and replies, as in X-Posed's Blocking
  settings, by:
  - country, or X region label with optional member countries;
  - account, by permanent user ID, so it survives handle changes;
  - words or emoji in the display name or bio, and organization affiliation;
  - domains and exact URLs in the bio or website;
  - Parody, Commentary, Fan and government labels;
  - post language;
  - following count, total posts, and digits in the handle or display name;
  - X's location warning.

  A filtered quoted account only affects its quote card, and quotes ignore language and
  location-warning filters. In Hide mode the quote collapses to a notice that names the
  filters, with "Show quoted post". Your own posts are never filtered. A post you open is
  highlighted rather than hidden, unless an account filter matches it. People lists
  (followers, following, List members, search, suggestions) only highlight, so they stay
  complete.
- **Filter profiles**: named sets of filters to create, rename, delete and switch. Each
  signed-in X account remembers its profile; badge settings and the cache stay shared.
- **Filter behavior**: per profile, keep Highlight in X List timelines while other timelines
  hide, and hide replies and quotes of filtered posts (with "Show post"). For every profile:
  take the country from the connection source ("Switzerland App Store") instead of the
  account location, and turn off filters on bios, links and counts.
- **Profile details in timelines**: while a saved filter needs the profile location, website
  or post count, X's timeline requests ask for them, so these filters work without opening
  each profile.
- **Always Show**: no filter applies to accounts on this list, by handle as in X-Posed, which
  adds its author @xaitax on first run. An option also exempts accounts you follow, when X
  reports the follow status.
- **No passive engagement**: impressions, viewing time, video views and opening of filtered
  posts aren't reported to X. Likes, replies and reposts still are.
- **Settings and statistics**: badge style with a live preview, saved filters with search and
  undo, an editor for each filter type, highlight contrast, posts seen per country, cache hit
  rates and contributions, in pages styled like X's own. Open them from the account sheet.

Lookups go to the X-Posed community cache first, in batches of up to 100 handles. Misses
fall back to X's own "About this account" query, sent through the app's own signed-in
client. Fresh English results are contributed back to the cache, like the extension does.
Results are cached on the device for 60 days.

Badges show what X reports, not anyone's live location or the device used for a post. A
location warning is not proof of VPN use.

### Privacy

With the community cache on (default, can be turned off in settings), the handles of
accounts you see are sent to X-Posed's cache server (`x-posed-cache.xaitax.workers.dev`),
and what X reports about them is shared back. Your X session is never sent there. Filters are
stored on the device. Profile details read for filters (location, website, post count), post
languages, which post replies to which, and the names, pictures and counts the account sheet
shows are kept in memory only and are gone when X closes.
Asking X's timeline requests for profile details makes them larger but sends nothing new
about you; turn off "Use profile details" to keep X's requests unchanged. That setting also
turns off the account sheet's activity counts, which come from data X already loaded.

Opening the account sheet asks X's "About this account" once per account and session when
the sheet lacks the account's history, as X's own "About this account" page does. The sheet
loads profile pictures and affiliation badges from X's image server (`pbs.twimg.com`) and
keeps them in memory only. Card images are made on the device. Copy and Share hand them to
other apps through X's own file provider; Save adds them to Pictures/X-Posed.

Post cards use only what X already loaded for the post. The photos on them load from X's
image server. "Open in X" opens X's own composer and posts nothing by itself.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v4.5.2](https://github.com/Sylonin/xposed-newx-patches/releases/tag/v4.5.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 NewX&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Account location badges](#account-location-badges) | Shows X-Posed style country badges next to names, in profile and chat headers, and highlights or hides posts from chosen countries, without reporting passive engagement with them. Data comes from the X-Posed community cache, falling back to X's "About this account". Tap a badge for account details and settings. Posts can be shared as images. |  |

</details>

<!-- PATCHES_END -->

## Building

Requires JDK 21, the Android SDK and a GitHub token with `read:packages` for Morphe's
Gradle plugin.

```sh
GITHUB_ACTOR=<user> GITHUB_TOKEN=$(gh auth token) ./gradlew :patches:buildAndroid
```

The bundle is written to `patches/build/libs/patches-<version>.mpp`. With Nix, `devenv shell`
provides the toolchain and token. Unit tests for the filter logic run with
`./gradlew :extensions:extension:testDebugUnitTest`. How the patch finds and hooks X's code is
described in [docs/HOOKS.md](docs/HOOKS.md).

The country, region and language tables in `CountryData.java` are generated from an X-Posed
checkout with `node tools/generate-country-data.mjs <checkout>`.

## Credits

Built on [X-Posed](https://github.com/xaitax/x-account-location-device) by Alexander Hagenah
(MIT): badge design, country, region and language tables, the filter rules and their matching,
icons and the community cache. The settings icons are [Lucide](https://lucide.dev) icons (ISC),
as X-Posed uses them. Ported from
[xposed-patches](https://github.com/AetherMagee/xposed-patches) by AetherMagee (GPLv3), which
supplies the extension and the patch structure. Project setup and release tooling come from the
[Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). Follows the
approach of [piko](https://github.com/crimera/piko) for NewX. This project is not affiliated
with X-Posed, X Corp. or Morphe. Details are in [NOTICE](NOTICE).

## License

GPLv3, see [LICENSE](LICENSE) and [NOTICE](NOTICE).
