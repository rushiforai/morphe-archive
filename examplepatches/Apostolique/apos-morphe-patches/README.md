# Apos Morphe Patches

Unofficial [Morphe](https://morphe.software/) patches. Right now there is one: **Boost for Tildes**, which makes the Boost for Lemmy Android app browse [tildes.net](https://tildes.net).

## Add the source to Morphe Manager

Paste this into Manager's source URL field:

```text
github.com/Apostolique/apos-morphe-patches
```

Or open this on the phone Morphe is installed on, and it hands the source straight to the app:

[**Add to Morphe**](https://morphe.software/add-source?github=Apostolique/apos-morphe-patches)

```text
https://morphe.software/add-source?github=Apostolique/apos-morphe-patches
```

That second one is a browser link rather than something to type into Manager. The feed itself, if you would rather point at it directly:

```text
https://raw.githubusercontent.com/Apostolique/apos-morphe-patches/main/patches-bundle.json
```

All three end up in the same place. Manager reads the latest release and offers the patches for whatever you have installed, and anything added here later shows up under the same source.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/Apostolique/apos-morphe-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Boost for Lemmy&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.0.32 | 🧪&nbsp;1.0.33 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Boost for Tildes](#boost-for-tildes) | Adds tildes.net to Boost for Lemmy, as an account beside the Lemmy ones. |  |

</details>

<!-- PATCHES_END -->

**1.0.32 is the one to install.** That is the version the patch was written against and the one it has been used on most. 1.0.33 carries the same fingerprint strings and applies cleanly, so Manager offers it as experimental.

## What Boost for Tildes does

Boost speaks Lemmy's HTTP API. Tildes has no API at all, so the patch injects an OkHttp interceptor into Boost and answers the `/api/v3/*` calls by scraping Tildes' own HTML:

```
┌───────────────────────────────────────┐                     ┌────────────┐
│ Boost for Lemmy (patched)             │   HTML over HTTPS   │            │
│   Retrofit ──► interceptor ──► scraper│ ──────────────────► │ tildes.net │
│               Lemmy v3 JSON           │ ◄────────────────── │            │
└───────────────────────────────────────┘                     └────────────┘
```

Nothing runs alongside the app. There is no server, no port and no certificate to keep alive. The feed, comment trees, voting, bookmarks, private messages and the composer all work, and the session survives a force-stop.

The same bundle cuts the sort menu down to the five orders Tildes has, rewrites Boost's wording so its communities read as groups and its posts as topics, and takes off the controls Tildes has nothing behind.

A patched Boost is still an ordinary Lemmy client on a Lemmy account. Everything the bundle changes follows the account rather than the install, so Boost's own sorts, scores, comment folding and wording all come back the moment you open a feed somewhere else.

### Being a good guest

Tildes is one small non-profit server, and its [robots.txt](https://tildes.net/robots.txt) welcomes scrapers that identify themselves and keep a reasonable rate. The interceptor sends a User-Agent naming this project, holds upstream requests to one per 700 ms, coalesces identical in-flight requests, and caches a page for 30 seconds. A pull to refresh reads past the cache for five seconds, since that gesture is a person saying something changed. The rate limit still applies to everything it causes.

You can leave the rate and the coalescing alone. If you fork this, please keep them.

## Building

The Morphe patcher lives on GitHub Packages, which wants a token with the **`read:packages`** scope even though the artifacts are public. Without one every request is a 401.

With the `gh` CLI:

```bash
gh auth refresh -s read:packages
GITHUB_ACTOR=$(gh api user --jq .login) GITHUB_TOKEN=$(gh auth token) ./gradlew buildAndroid
```

Or put a classic token in `~/.gradle/gradle.properties` so it stays out of your shell history:

```properties
gpr.user=your-github-username
gpr.key=ghp_xxxxxxxxxxxxxxxxxxxx
```

That writes `patches/build/libs/patches-<version>.mpp`. Use **`buildAndroid`**, not `build`: plain `build` emits JVM class files only, while Manager reads a bundle's `classes.dex`. A bundle without one loads without error and reports "0 patches".

## Layout

```
patches/       the patches, one package per app
extensions/    code compiled into the target APK, one module per app
```

Adding an app means a directory under `extensions/` and a package under `patches/`. Nothing else needs to know: the Morphe Gradle plugin finds every `extensions/*/build.gradle.kts` on its own, and Manager groups patches by the packages they declare, so a second app appears beside the first under the same source URL.

## Releases

A push to `main` runs [semantic-release](https://semantic-release.gitbook.io/). It reads the commits since the last tag, works out the version, writes `CHANGELOG.md` and `patches-bundle.json`, builds the bundle at that version and attaches it to a GitHub release. Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/): `fix:` for a patch bump, `feat:` for a minor one, `bump:` for app-support updates. Anything else releases nothing.

## Licensing

GPL-3.0, since the Morphe patcher and extension libraries this links against are. Those carry an additional condition under GPL section 7 about naming, which [NOTICE](NOTICE) reproduces as received.

Patches contain no Boost code, so publishing this bundle distributes only original work. It transforms an APK you already have. Publishing a *patched APK* would be redistributing Boost itself, which is a different matter and is not done here.

## Disclaimer

This is an unofficial community patch bundle. It is provided as-is, for the app versions listed above, and you use it at your own risk.

Nothing here is endorsed by anyone it touches: not Morphe, not Boost's developer, not Tildes. It works by reading Tildes' own HTML rather than through an API, so a change to the site can break it with no warning, and the versions above are the only ones it has been tried against. Patching an app on your own phone is your call to make.
