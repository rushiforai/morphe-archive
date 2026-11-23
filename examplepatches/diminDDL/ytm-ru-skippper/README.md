# YTM ru Skippper

Do streaming platforms keep failing to distinguish between ruzzian and Ukrainian music? Are you tired of blocking and skipping these tracks manually? 

You're in luck! This repository contains Morphe patches for YouTube Music that instantly skip russian (or any other country) tracks and can show each artist's country as a flag in the now playing screen. 

The patch first checks the title for russian-only letters, if that is inconclusive it looks up each artist's country on [MusicBrainz](https://musicbrainz.org). A track matching the skip list is skipped through the "Next" action, meaning it still sends a signal to Google that you skipped it.

## How to use the patches

Add this repo as a patch source in Morphe Manager: 
tap the button below, or go into **Sources -> + -> Remote** and enter `https://github.com/diminDDL/ytm-ru-skippper`.

<a href="https://morphe.software/add-source?github=diminDDL/ytm-ru-skippper">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Then patch YouTube Music with **Auto-skip russian tracks** enabled, with at least **GmsCore support** official Morphe patch. The rest of the official patches are optional.

- **GmsCore support** allows the patched app to be install alongside the original (for cases when YTM came pre-installed on your device) and signed through MicroG. It is needed for a normal non-root install.
- It also adds the Morphe settings screen, where **Settings -> Morphe -> Auto-skip** will appear. For a root install without GmsCore support, enable any other official patch that has a Morphe setting, such as **Hide ads**. Without Morphe's settings screen the skipper still runs, just with the default settings.

**Supported version:** YouTube Music `9.30.53`. The patches need to hook into obfuscated app code, so other versions are not supported.

## Settings

Open **Settings -> Morphe -> Auto-skip**.

| Setting | Default | Notes |
| --- | --- | --- |
| Enable auto-skip | on | Master switch for skipping. |
| Show skip toast | on | Names the skipped track and the rule. |
| Show artist flags | off | MusicBrainz country flags after linked artists on Now Playing. Works with auto-skip off. |
| Skip russian titles | on | Titles with ы, э or ъ are skipped immediately. |
| Keep Ukrainian titles | on | Titles with і, ї, є or ґ are kept without a country lookup. |
| Skip by artist country | on | Looks up each credited artist on MusicBrainz. |
| Blocked countries | `RU` | ISO codes, comma-separated. A code also matches its English name, since MusicBrainz sometimes returns an area name. |
| Never skip | empty | Artist names, one per line, case-insensitive exact match. Overrides every other rule. |
| Always skip | empty | Artist names, one per line, skipped regardless of country. |
| Skip delay | 0 s | Plays a matching track this long before skipping (0–60). |
| Country lookup time limit | 15 s | A country result arriving later than this no longer skips the track (3–120). |

Rules apply in the following order: Never skip -> Always skip -> russian title -> Ukrainian title -> artist country.

**Privacy:** for tracks that reach the country check, or when flags are on, the credited artist names are sent to MusicBrainz. Requests are spaced at least 1.1 seconds apart and retried at most twice, following MusicBrainz's [rate limits](https://musicbrainz.org/doc/MusicBrainz_API/Rate_Limiting).

**Known limitation:** MusicBrainz lookups use the top search result for an artist name, so artists sharing a name with another artist can get the wrong country.

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/diminDDL/ytm-ru-skippper/releases/tag/v1.0.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**2 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**YouTube Music**](PATCHES.md#youtube-music-comgoogleandroidappsyoutubemusic) | 2 | `9.30.53` | [`com.google.android.apps.youtube.music`](https://play.google.com/store/apps/details?id=com.google.android.apps.youtube.music) |
<!-- PATCHES_END -->

## Development

The project follows the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). Build with JDK 21 and Android SDK Platform 36. Configure `gpr.user` and `gpr.key` in `~/.gradle/gradle.properties` with a GitHub token that has `read:packages`, then run:

```sh
./gradlew :patches:buildAndroid
```

The bundle is written to `patches/build/libs/`. [Morphe setup guide](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/1_setup.md)

`patches/src/main/kotlin/dev/ytmruskippper/patches/` holds the patches, which run at patch time:

- `Patches.kt` defines the two patches.
- `Fingerprints.kt` locates the hooked app code. The fingerprints name obfuscated classes of YouTube Music `9.30.53`, so supporting another version means updating them.
- `PlaybackHooks.kt` adds the track callbacks: player response, media session metadata and notification track.
- `SettingsScreen.kt` declares Settings → Morphe → Auto-skip as a Morphe add-on preferences file (`morphe_addon_prefs.xml`), which the official Settings patch merges in.
- `Shared.kt` holds the app compatibility and the extension class names.

`extensions/skipper/src/main/java/dev/ytmruskippper/skipper/` holds the code that runs in the app:

- `TrackSkipper` decides whether to skip the current track and sends Next.
- `SkipRules` holds the title, artist list and country rules.
- `MusicBrainz` looks up artist countries, with rate limiting and retries.
- `ArtistFlags` adds the flags to the Now Playing artist line.
- `NotificationTrack` reads the video ID and artist runs from the app's track model.
- `SkipperSettings` and `MorpheSettings` read the settings. `MorpheSettings` registers them with Morphe's `Setting` classes, which come from `app.morphe:morphe-extensions-library` at compile time and from the official shared extension at runtime.
- `PlaybackProbe` backs **Playback metadata probe**, a debug patch, off by default, that logs track callbacks under the `YtmPlaybackProbe` Logcat tag. The skipper logs under `YtmRuSkipper`.

### Releases

Pushes to `main` run `.github/workflows/release.yml`. Semantic-release picks the version from [conventional commits](https://www.conventionalcommits.org) (`feat:` → minor, `fix:` → patch), builds the `.mpp`, attaches it to a GitHub release and updates `patches-bundle.json`, which Morphe Manager reads. Commits such as `chore:` or `docs:` only verify that the project compiles.

Releases are unsigned unless you add a `MORPHE_SIGNING_KEY` repository secret and commit the matching `morphe-signing.pub`.

### Local testing without Gradle

`scripts/build-local.sh` builds the bundle with Morphe Desktop's bundled libraries, using the stubs in `scripts/morphe-stubs`, and patches a local APK. Run it from the folder that contains this repository and the APK: `VERSION=0.6.0 bash ytm-ru-skippper/scripts/build-local.sh`. The bundle and patched APK are written to `probe-output/` next to the repository. By default it also applies the official default patches; set `OFFICIAL=minimal` to apply only GmsCore support. Paths to Morphe Desktop, the official bundle, the test keystore and the APK are at the top of the script, and each can be overridden with an environment variable of the same name.
