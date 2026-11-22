# Nyandex

> [!WARNING]
> **Nyandex is fully vibe-coded.** All of it (the patches, the extensions, the tests, the release
> setup and this README) was written by an AI coding agent, Claude Code. The maintainer directed
> the work and tried the patched app, but no human wrote the code or reviewed it line by line.
> Expect bugs, read the code before you trust it, and use it at your own risk.

Yandex Music patches for [Morphe](https://morphe.software): lyrics from LRCLIB, a Material You
theme, hideable bottom-bar tabs, haptic feedback, an in-app settings page, and privacy fixes.

Nyandex is an independent project. It is compatible with Morphe but not made by or affiliated
with the Morphe project, and it is not affiliated with Yandex.

## How to use

Add this repository to Morphe Manager as a patch source:

<a href="https://morphe.software/add-source?github=Ser1-1y/nyandex">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

or add `https://github.com/Ser1-1y/nyandex` manually. Then patch Yandex Music in Morphe Manager.

- **Always patch the original APK/APKM** of a supported version (see below), never an app that
  is already patched.
- Keep **Подменить подпись приложения** (Spoof app signature) enabled (it is on by default).
  Without it Yandex ID login fails with "application signature mismatch".
- After patching, Nyandex options are in the app: **Settings → Nyandex → Nyandex Settings**.

### Supported versions

| App | Versions |
|---|---|
| Yandex Music (`ru.yandex.music`) | `2026.11.1 #171gpr`, `2026.11.2 #172.1gpr` |

The patches locate their targets by code structure, but they are only tested on these versions.
Morphe Manager compares the full version name, including the build suffix.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.6.0](https://github.com/Ser1-1y/nyandex/releases/tag/v1.6.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**14 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Yandex Music**](PATCHES.md#yandex-music-ruyandexmusic) | 14 | `2026.11.1 #171gpr`, `2026.11.2 #172.1gpr` | [`ru.yandex.music`](https://play.google.com/store/apps/details?id=ru.yandex.music) |
<!-- PATCHES_END -->

## Notes

- **Lyrics** come only from LRCLIB, a free community database; Yandex's lyrics API is not used
  (no lyrics requests and no lyric view reports). Every track offers lyrics; LRCLIB receives the
  track's artist, title and duration (nothing else). Tracks LRCLIB has no lyrics for show the
  app's lyrics error, and a toast appears when LRCLIB cannot be reached. LRCLIB lyrics are
  community-contributed and may be copyrighted; the patch is meant for personal use.
  If the exact title has no match, the lookup retries without credits and release tags
  ("feat. …", "Remastered", "Live", "Radio Edit") and then searches LRCLIB, accepting only
  results with a matching artist and duration. The next track's lyrics are loaded in advance,
  and every answer is saved in the app's cache, so replays and offline tracks keep their lyrics
  ("no lyrics" is retried after 3 days). The Nyandex settings page has a timing offset (for
  Bluetooth delay), a switch for loading in advance, a limit on how many lyrics are saved
  (3000 by default, or off), and a button that clears the saved lyrics.
- **Clean share links** removes `utm_*` and the random `ref_id` from shared and copied links;
  `invite_id` stays on invitation links.
- **Monet** is applied through Android 12+ dynamic colors. On older Android versions the app keeps
  its stock colors.
- **Hidden tabs** disappear after restarting the app; the settings page offers a restart.
  The remaining tabs share the bar's width: a tap anywhere in a tab's part of the bar opens it
  (switch: Settings → Nyandex → Bottom bar).
- **Haptic feedback** adds a short vibration to taps on buttons and tabs, long presses and
  pull-to-refresh. It follows the system "Touch feedback" setting, and each kind can be turned
  off on the Nyandex settings page. Taps on rows and other controls without a button role are
  off by default.

Patch names and descriptions are in Russian.

## Building

Requirements: JDK 17 or newer and the Android SDK (`ANDROID_HOME`).

```bash
./gradlew :patches:buildAndroid
```

The bundle is written to `patches/build/libs/patches-<version>.mpp`. Load it in Morphe Manager as
a local patch source.

The Morphe Gradle plugin and libraries are published on GitHub Packages, which needs a GitHub
token with `read:packages` (`gpr.user` / `gpr.key` in `~/.gradle/gradle.properties`, or
`GITHUB_ACTOR` / `GITHUB_TOKEN`). Alternatively, point `MORPHE_SOURCE_DIR` at a directory that
contains local checkouts of `morphe-patches-gradle-plugin`, `morphe-patcher` and
`morphe-patches-library`, and the build uses those instead.

### Tests

```bash
YM_APK=/path/to/stock/base.apk ./gradlew :patches:test --rerun
```

The integration tests apply every patch to a stock APK, write the patched APK, and inspect the
resulting bytecode, manifest and resources. Without `YM_APK` they are skipped; the LRCLIB unit
tests always run. Run once per supported version.

## Releases

Releases are created by GitHub Actions with semantic-release from
[Conventional Commits](https://www.conventionalcommits.org) on `main` (`dev` publishes
pre-releases). `patches-bundle.json` points Morphe Manager at the latest release.

## License

GPLv3, see [LICENSE](LICENSE). Built from the
[Morphe patches template](https://github.com/MorpheApp/morphe-patches-template); see
[NOTICE](NOTICE) for the Morphe project's name restriction. «Подменить подпись приложения» uses
the signature spoof of the Morphe patches library.
