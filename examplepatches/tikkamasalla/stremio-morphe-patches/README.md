<p>
<picture>
  <source srcset="assets/hero@2x.webp" type="image/webp">
  <img src="assets/hero.png" width="100%" alt="Stremio Morphe Patches. A TV player plays an episode, a Skip Intro button slides in, and the playhead jumps over the intro.">
</picture>
</p>

Patch Stremio and Vimu to skip intros, recaps, and credits, auto-pick streams, filter out SDH subtitles (subtitles for the deaf and hard of hearing), and sync playback and language choices with external players. Built for Android TV, with phone support added in 1.7. You apply the patches to your own APK using the Morphe app patcher.

## At a glance

| Feature | What it does | Where you turn it on |
|---|---|---|
| [Fingerprint Lookahead](#fingerprint-lookahead) | Works out skip times no online source has, by fingerprinting the next episode's audio and matching it against other episodes of the show. | Mod settings, `Work out missing skip times` (off by default) |
| [Chapter-aware skip sources](#chapter-aware-skip-sources) | Skips intros, recaps, and credits from the file's own chapters first, then this project's timings and four online sources. | `Intro Skip` patch |
| [Borrowed chapters](#borrowed-chapters-with-audio-proof-alignment) | Copies intro and credits marks from another release of the same episode after audio alignment verifies both files match. | Mod settings, `Borrow chapters from other releases` (off by default) |
| [Anime theme-song matching](#anime-theme-song-matching) | Matches a show's official theme songs against episode audio to fill a missing intro or credits. | Runs with `Work out missing skip times` |
| [Early-outro guard](#early-outro-guard) | Keeps an early outro from being offered as "Skip intro". | Always on |
| [Auto-pick best stream](#auto-pick-best-stream) | Launches the top-ranked stream immediately and skips the selection list. | `Auto-pick best stream` patch (on by default) |
| [Per-show track memory](#per-show-track-memory) | Saves your audio and subtitle languages per show, in Stremio's player and in Vimu. | `Remember tracks per show` patch |
| [External player hand-off](#external-player-hand-off) | Passes the episode, start position, and subtitles to your external player, records progress, and starts the next episode in the same player. | `External player progress` and `Binge with external players` patches |
| [Spoiler shield](#spoiler-shield) | Hides thumbnails, titles, and synopses of unwatched episodes. | `Hide spoilers` patch |

## Install

1. Add this patch source in Morphe Manager: https://morphe.software/add-source?github=tikkamasalla/stremio-morphe-patches
2. Select Stremio or Vimu and choose your patches, such as "Intro Skip".
3. Patch and install the APK.

**Keep your original Stremio app.** The patched APK replaces your existing Stremio installation by default. Enable the `Side-by-side install` patch (off by default) to install the build as "Stremio Morphe" (`com.stremio.one.morphe`) alongside your original app.

**Patch a clean Vimu 12.00 APK.** Do not use pre-modified APKs from third parties, which include extra tamper checks these patches do not remove. Stock Vimu also closes if its signing certificate changes. Keep the `Re-sign check (Vimu)` patch enabled so the re-signed build runs.

**Open Mod settings.** Every patch option lives in the Mod settings screen:
* **Android TV:** Select Mod settings from the top row of Stremio Settings, or press the `MENU` key on your remote.
* **Phone:** Long-press the Stremio icon on your home screen.

## Supported versions

Eleven Stremio patches are on by default across all five supported versions. A twelfth patch, `Side-by-side install`, is off by default. Support for 1.12.0 and 2.5.0 arrived in 1.7.

| App | Version | Notes |
|---|---|---|
| Stremio TV (`com.stremio.one`, Android TV) | 1.6.12 | Reference build. Supports every feature, exact seeks, and progress bar skip marks. |
| Stremio TV | 1.10.4 | `arm64` and `armeabi-v7a` builds. |
| Stremio TV | 1.12.0 | `arm64` and `armeabi-v7a` (bundle). |
| Stremio phone (`com.stremio.one`, touch UI) | 2.4.0, 2.5.0 | Touch skip button. Open Mod settings from the launcher shortcut. |
| Vimu Media Player (`net.gtvbox.videoplayer`) | 12.00 | Seven dedicated Vimu patches. |

On every Stremio version except 1.6.12, skips snap to keyframes (landing 1-2 s early) and the progress bar does not show skip marks. See the [feature guide](docs/FEATURES.md) for a full version breakdown.

## Features

### Fingerprint Lookahead

<p>
<picture>
  <source srcset="assets/fingerprint-lookahead@2x.webp" type="image/webp">
  <img src="assets/fingerprint-lookahead.png" width="100%" alt="While episode 4 plays, the audio of episode 5 is fingerprinted. The audio envelopes of episodes 2 and 3 slide into alignment with it, and the stretch all three share is marked as the intro.">
</picture>
</p>

Cross-episode audio fingerprinting for episodes the online sources do not cover. Online sources are checked first and are always on. While you watch an episode, the app fingerprints the audio at the start and end of the next episode in the background, matches it against other episodes of the same show, and skips what at least 2 other episodes agree on. Detected timestamps have the lowest priority and follow your Auto or Manual setting.

In Mod settings the row is still labelled `Work out missing skip times` (off by default). The next release renames it to Fingerprint Lookahead.

| Streamer hardware test (real streams) | Time per episode | Debrid data read | Result |
|---|---:|---:|---|
| 1080p, comparison episodes cached locally | about 6 minutes | about 0.4 GB | Intro skipped automatically |
| 1080p, one comparison episode to fetch | about 19 minutes | about 0.9 GB | Intro and credits found, frame-accurate |
| 4K remux, nothing cached locally | about 40 minutes | about 5 GB | Analysis finished, no matches on that show |

Results apply only to the exact file analyzed, with a limit of one attempt per episode per day. If analysis finishes after you start the next episode, the intro skip may not be ready in time.

### Chapter-aware skip sources

<p>
<picture>
  <source srcset="assets/skip-sources@2x.webp" type="image/webp">
  <img src="assets/skip-sources.png" width="100%" alt="A TV player with chapter marks on its progress bar. The Skip Intro button slides in and the playhead jumps to the end of the Opening chapter. A list shows the seven skip sources in order, with file chapters used.">
</picture>
</p>

Skip segments automatically or show an on-screen Skip button in Manual mode. Movies and post-credit scenes never skip: skipping credits seeks to the end of the credits, not the end of the file. No API keys are needed.

| Order | Source | Notes |
|---:|---|---|
| 1 | Embedded video chapters | Matroska and WebM files streamed over `http(s)`. Online timestamps snap to chapter edges. |
| 2 | [IntroKiller Engine](https://github.com/tikkamasalla/introkiller-engine) | This project's published timings |
| 3 | AniSkip | Anime, resolved to the exact season and cour first |
| 4 | TheIntroDB | |
| 5 | IntroDB.app | Fills in missing segment types |
| 6 | SkipDB | Final online fallback |
| 7 | Fingerprint Lookahead | Lowest priority, only when switched on |

Online timestamps apply only when your file's duration matches the source's measured runtime within 2 s. Playback never waits for a slow or offline server: failed sources retry at 5 s, 20 s, and 60 s.

### Borrowed chapters with audio-proof alignment

<p>
<picture>
  <source srcset="assets/borrowed-chapters@2x.webp" type="image/webp">
  <img src="assets/borrowed-chapters.png" width="100%" alt="Two releases of the same episode. Release A has intro and credits chapters, release B has none. Their audio slides into alignment, the offset is verified, and the chapter marks move down onto release B.">
</picture>
</p>

Copies intro and credits marks from another release of the same episode after audio alignment verifies both files match. If alignment fails, nothing is copied. `Borrow chapters from other releases` is off by default and works independently of `Work out missing skip times`.

| Offline test, 40 file pairs | Result |
|---|---:|
| Copied segments that landed within 1 s | 44 of 45 |
| Median error | 0.001 s |
| Story cuts | 0 |
| Deliberately mismatched pairs refused | 62 of 62 |

### Anime theme-song matching

<p>
<picture>
  <source srcset="assets/theme-matching@2x.webp" type="image/webp">
  <img src="assets/theme-matching.png" width="100%" alt="An official opening song slides across one episode's spectrogram. The match score peaks where it locks, and that stretch is marked as the opening.">
</picture>
</p>

Matches a show's official opening and ending songs from AnimeThemes.moe against episode audio. It runs with `Work out missing skip times`, needs only one episode, requires a Kitsu id, and never overrides another source.

| Standalone PC test, 123 episodes | Result |
|---|---:|
| Intros found | 82 of 114 |
| Credits found | 80 of 105 |
| Real wrong skips | 0 |
| Blood+ intros found | 0 of 5, then 5 of 5 |
| Episodes where the app matcher agreed | 99 of 99 compared |

### Early-outro guard

<p>
<picture>
  <source srcset="assets/early-outro-guard@2x.webp" type="image/webp">
  <img src="assets/early-outro-guard.png" width="100%" alt="An online credits entry at 0:38 with no intro arrives while an episode starts. The early-outro guard blocks it, and no Skip Intro button is offered.">
</picture>
</p>

Drops early credits entries on episodes without an intro, so an early outro is not offered as "Skip intro". Keeps openings that TheIntroDB mislabels as credits. Verified by self-tests in both Stremio's player and Vimu.

### Auto-pick best stream

<p>
<picture>
  <source srcset="assets/auto-pick@2x.webp" type="image/webp">
  <img src="assets/auto-pick.png" width="100%" alt="A stream list for an episode. The CAM and telesync rows are struck out, the rest re-rank, and the list collapses to the cached 2160p single-episode stream, which starts.">
</picture>
</p>

Launches the top-ranked stream immediately and skips the selection list. Filters out CAM, telesync, and screener copies, wrong season or episode numbers, addon warning cards, and external web links. If every stream fails the filter, the stream list stays on screen.

| Rank | Rule |
|---:|---|
| 1 | Single-episode file before a season pack |
| 2 | Cached before uncached |
| 3 | Resolution (requires an explicit 4K label such as `2160p` or `4K`; a bare `UHD` tag does not count) |
| 4 | HDR or Dolby Vision, then file size, codec, and seeders |

Next-episode prefetch (`Prepare next episode`) resolves the next episode's best stream in the background, so pressing Next, finishing the episode, or using Binge starts it immediately.

### Per-show track memory

<p>
<picture>
  <source srcset="assets/track-memory@2x.webp" type="image/webp">
  <img src="assets/track-memory.png" width="100%" alt="A player with an audio and subtitle panel. Japanese audio and English subtitles are picked once, and the show's next episodes switch from default tracks to those choices.">
</picture>
</p>

Stremio's player and Vimu save your audio and subtitle languages per show. The SDH subtitle filter (`Avoid SDH subtitles`) selects standard dialogue tracks over hearing-impaired subtitles.

### External player hand-off

<p>
<picture>
  <source srcset="assets/external-player@2x.webp" type="image/webp">
  <img src="assets/external-player.png" width="100%" alt="Stremio hands the episode, start position and subtitles to an external player window. Positions flow back every 10 seconds, and after a real finish the next episode starts in the same player.">
</picture>
</p>

Passes the show title, episode, start position, and subtitles to your external player, records playback progress, and starts the next episode automatically in the same player. Vimu writes its position every 10 s, so progress survives a crash. Pressing Back, Home, or stopping early never launches the next episode. Vimu, mpv, and Just Player are tested.

### Spoiler shield

<p>
<picture>
  <source srcset="assets/spoiler-shield@2x.webp" type="image/webp">
  <img src="assets/spoiler-shield.png" width="100%" alt="An episode list. Watched episodes show their picture and title. Unwatched ones are blurred and titled Episode 3 and Episode 4. Once episode 3 is watched, its blur lifts and its title appears.">
</picture>
</p>

`Hide spoilers` hides thumbnails and synopses of unwatched episodes and replaces their titles with `Episode N`.

### Also included

| Feature | What it does |
|---|---|
| Smoother playback | Frame-rate matching in Stremio's own player: `Seamless only`, `Always`, or `Off`. |
| Larger playback buffer | Buffers 50-120 s ahead (up to 256 MB), on by default, to reduce stalls on high-bitrate streams. |
| Mod settings | One screen with every patch option. |
| Side-by-side install | Installs the patched app as Stremio Morphe next to the original. Off by default. |

## Known limits

* **Embedded chapters:** Read only from Matroska and WebM files streamed over `http(s)`.
* **Unindexed releases:** Brand-new episodes without online timestamps cannot skip unless `Work out missing skip times` is on.
* **Unmarked scenes:** Online credits timestamps can occasionally skip over an unmarked mid-credits or post-credits scene.
* **Required settings:** `Remember tracks` requires Stremio's built-in "auto select" option on builds newer than 1.6.12. `Auto-pick` requires `Always show stream list` to be turned off.

## Network connections

Outside of standard Stremio traffic, your addons, and your debrid service, the patches connect only to these hosts:

* **Skip timestamps:** `api.aniskip.com`, `api.theintrodb.org`, `api.introdb.app`, `api.skipdb.tv`, and `raw.githubusercontent.com` (for this project's published timings file).
* **Anime theme-song backup (only when `Work out missing skip times` is on):** `kitsu.app`, `graphql.anilist.co`, `graphql.animethemes.moe`, and AnimeThemes' audio host.
* **Show matching:** `graphql.anilist.co`, `kitsu.app`, and `v3-cinemeta.strem.io`.

Requests send only the show id or title, season, episode number, and file duration (where required by the source). The patches never send account credentials, stream URLs, or debrid keys.

## Help

If patching fails or a feature misbehaves, open an issue with your app version, device model, the Morphe log, and relevant logcat lines. See the [feature guide](docs/FEATURES.md) for logcat filter tags.

To build the patches from source, run `./gradlew :patches:build` and load `patches/build/libs/patches-*.mpp` in Morphe Desktop.

<!-- PATCHES_START -->
> **[v1.8.0](https://github.com/tikkamasalla/stremio-morphe-patches/releases/tag/v1.8.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;19 patches total
<details open>
<summary> Vimu&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**Supported versions:**

| 12.00 ST | 12.00 |
| :---: | :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Addon subtitles in subtitle menu (Vimu)](#addon-subtitles-in-subtitle-menu-vimu) | Lists the addon subtitles from Stremio in Vimu's subtitle menu. Runs with the Intro Skip (Vimu) patch. |  |
| [External player result (Vimu)](#external-player-result-vimu) | Returns position and duration from Vimu so Stremio saves progress. Runs with the Intro Skip (Vimu) patch. |  |
| [Intro Skip (Vimu)](#intro-skip-vimu) | Adds intro and recap skip for TV shows, movies and anime in Vimu.<br><br>Intro Skip v1.0.0<br>Repository: https://github.com/tikkamasalla/stremio-morphe-patches |  |
| [Intro Skip native fix (Vimu)](#intro-skip-native-fix-vimu) | Fixes native crashes on rapid seeks in the Vimu media engine. Runs with the Intro Skip (Vimu) patch. |  |
| [Intro Skip settings row (Vimu)](#intro-skip-settings-row-vimu) | Adds the Intro Skip settings to Vimu Settings. Runs with the Intro Skip (Vimu) patch. |  |
| [Progress journal provider (Vimu)](#progress-journal-provider-vimu) | Declares the progress journal provider. Runs with External player result (Vimu). |  |
| [Re-sign check (Vimu)](#re-sign-check-vimu) | Lets the app run after re-signing. |  |

</details>

<details open>
<summary> Stremio&nbsp;&nbsp;•&nbsp;&nbsp;12 patches</summary>
<br>

| Patch | Description | Options |
|----------|----------------|-----------|
| [Auto-pick best stream](#auto-pick-best-stream) | Skips the stream list and plays the top ranked stream. Enable Always show stream list to see every stream. |  |
| [Avoid SDH subtitles](#avoid-sdh-subtitles) | Prefers full dialogue subtitles over SDH/CC tracks and strips sound notes when none remain.<br><br>Avoid SDH v1.0.0<br>Repository: https://github.com/tikkamasalla/stremio-morphe-patches |  |
| [Binge with external players](#binge-with-external-players) | Auto-plays the next episode in the same external player when an episode finishes in Vimu, MX Player, VLC or mpv. |  |
| [External player progress](#external-player-progress) | Saves watch progress in Stremio when playing in an external player, and starts the player at the saved position. |  |
| [External player progress manifest](#external-player-progress-manifest) | Declares the keep-alive service for External player progress. Runs with that patch. |  |
| [Hide spoilers](#hide-spoilers) | Hides thumbnails and synopses for unwatched episodes in Stremio.<br><br>Hide spoilers v1.0.0<br>Repository: https://github.com/tikkamasalla/stremio-morphe-patches |  |
| [Intro Skip](#intro-skip) | Adds intro and recap skip controls for TV shows, movies and anime in Stremio.<br><br>Intro Skip v1.0.0<br>Repository: https://github.com/tikkamasalla/stremio-morphe-patches | • Enable debug mode |
| [Mod settings](#mod-settings) | Adds one Mod settings screen with every setting of these patches: from Stremio Settings on TV 1.10.4/1.12.0, from the launcher shortcut or App info on phone 2.x. |  |
| [Mod settings manifest](#mod-settings-manifest) | Declares the Mod settings screen in the manifest. Runs with Mod settings. |  |
| [Remember tracks per show](#remember-tracks-per-show) | Remembers the last audio and subtitle choice for each series and applies it to other episodes. |  |
| [Side-by-side install](#side-by-side-install) | Installs the patched app separately as Stremio Morphe (package com.stremio.one.morphe) so it can sit next to the normal Stremio instead of replacing it. Off by default. |  |
| [Smoother playback](#smoother-playback) | Frame-rate matching (Seamless only / Always / Off), a larger, debrid-friendly playback buffer, and no stream re-open freeze when arriving addon subtitles would not change what is on screen, for Stremio's own player. |  |

</details>

<!-- PATCHES_END -->

## Credits

Started from [aniskip-stremio](https://github.com/AzukiSensei/aniskip-stremio) by AzukiSensei, GPLv3. Rewritten with chapter-based skipping, IntroDB support and new skip logic. The SDH annotation rules are adapted from liongalahad-nuviotv-morphe-patches (GPLv3).

## License

GPLv3, see [LICENSE](LICENSE).
