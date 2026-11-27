# X Filter Patches

Morphe patches for X (Twitter) that filter timeline posts by type, author, media and text. They can be used alongside Piko.

## Usage

1. Add this repo as a patch source in Morphe Manager (button below, or the URL `https://github.com/ErnestTrung/x-filter`), or build the `.mpp` locally (see below).

   <a href="https://morphe.software/add-source?github=ErnestTrung/x-filter">
     <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
   </a>

2. Patch the X APKM from APKMirror (tested: `12.19.1-release.0`).
3. Open the **X Filters** launcher icon to set filters. Changes apply to timeline pages loaded after the change, so pull to refresh.

x86_64 emulators: X ships no x86 native libraries, so install with `adb install --abi arm64-v8a <apk>` (needs an image with ARM translation). Otherwise it crashes on `libyoga.so`.

## Filters

**Feed items** (all timelines): promoted posts (on by default), who to follow, creators to subscribe to, communities to join, today's news, Premium prompts, and "Discover more" under replies.

**Posts** (Home, Search, Replies and Lists, each switchable):

| Filter | Hides |
|---|---|
| Reposts / Quote posts / Replies | that post type |
| Accounts you don't follow | posts from accounts you don't follow (this includes your own) |
| Blue-check accounts you don't follow | paid blue checks; business and government checks are kept |
| Photos / Videos or GIFs / Text-only | by media |
| Links / Polls / Sensitive media / Community posts | by content |
| Max hashtags | posts with more hashtags than N |
| Muted users | `@handle`, one per line; reposts by or of them included |
| Languages | everything outside the listed codes (`en, de`) |
| Contains / Regex | text match, case-insensitive; also checks the quoted post |
| Starts with / Ends with | text match, case-insensitive |
| Min / Max length | posts shorter or longer than N characters |

Text rules match the post text as shown in the app: the leading `@reply` handles and trailing media links are excluded. In Replies, only replies are filtered, never the opened post or its parents.

## How it works

One hook at the start of Jackson's `createParser(InputStream)`, the point every API response passes through (the same point Piko's "Log server response" patch uses). GraphQL timeline responses are parsed with `org.json`, matching entries are removed, and the JSON is handed back to the app. Other responses are passed through unbuffered. On any error the original response is used.

Debug: `adb logcat -s XFilter` prints the response root and the number of removed entries.

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/ErnestTrung/x-filter/releases/tag/v1.0.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**1 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**X**](PATCHES.md#x-comtwitterandroid) | 1 | `12.19.1-release.0` | [`com.twitter.android`](https://play.google.com/store/apps/details?id=com.twitter.android) |
<!-- PATCHES_END -->

## Building

Requires a GitHub token with `read:packages` (the Morphe gradle plugin is on GitHub Packages) in `~/.gradle/gradle.properties`:

```properties
gpr.user=<github username>
gpr.key=<token>
```

```sh
./gradlew :extensions:extension:testDebugUnitTest   # filter tests
./gradlew buildAndroid                              # patches/build/libs/patches-*.mpp
```

## License

GPLv3. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
