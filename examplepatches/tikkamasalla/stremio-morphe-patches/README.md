# Stremio Morphe Patches

Patch Stremio and Vimu to skip intros, recaps, and credits, auto-pick streams, filter out SDH subtitles (subtitles for the deaf and hard of hearing), and sync playback and language choices with external players. Built for Android TV, with phone support added in 1.7. You apply the patches to your own APK using the Morphe app patcher.

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

### Skip intros, recaps, and credits

Skip segments automatically or show an on-screen Skip button in Manual mode. Movies and post-credit scenes never skip. No API keys are needed.

Timestamps load in this priority order:
1. Embedded video chapters
2. [IntroKiller Engine](https://github.com/tikkamasalla/introkiller-engine)
3. AniSkip, TheIntroDB, IntroDB.app, and SkipDB

### Work out missing skip times

Online sources are checked first and are always on. Turn on `Work out missing skip times` (off by default) for episodes they do not cover. While you watch an episode, the app compares the next episode's audio in the background against other episodes of the same show and works the timestamps out itself. Detected timestamps have the lowest priority and follow your Auto or Manual setting.

Results apply only to the exact file analyzed, with a limit of one attempt per episode per day. If analysis finishes after you start the next episode, the intro skip may not be ready in time.

| Streamer hardware test (real streams) | Time per episode | Debrid data read | Result |
|---|---:|---:|---|
| 1080p, comparison episodes cached locally | about 6 minutes | about 0.4 GB | Intro skipped automatically |
| 1080p, one comparison episode to fetch | about 19 minutes | about 0.9 GB | Intro and credits found, frame-accurate |
| 4K remux, nothing cached locally | about 40 minutes | about 5 GB | Analysis finished, no matches on that show |

Version 1.8 added three detection upgrades:

| Upgrade | Behavior | Test results |
|---|---|---|
| Borrow chapters from other releases (off by default) | Copies intro and credits marks from another release of the same episode after audio alignment verifies both files match. | Offline test of 40 file pairs: 44 of 45 copied segments landed within 1 s (median error 0.001 s, zero story cuts). Refused all 62 deliberately mismatched pairs. |
| Anime theme-song backup (runs with `Work out missing skip times`) | Matches a show's official theme songs against episode audio. Needs only one episode, requires a Kitsu id, and never overrides another source. | Standalone PC test across 123 episodes: found 82 of 114 intros and 80 of 105 credits with no real wrong skips, and took Blood+ from 0 of 5 intros to 5 of 5. The app matcher agreed on all 99 compared episodes. |
| Early outro fix | Drops early credits entries on episodes without an intro so an early outro is not offered as "Skip intro". Keeps openings that TheIntroDB mislabels as credits. | Verified by self-tests in both Stremio's player and Vimu. |

### Streams, tracks, and external players

* **Auto-pick best stream:** Launches the top-ranked stream immediately and skips the selection list. Filters out CAM, telesync, and screener copies.
* **Remember language tracks:** Stremio's player and Vimu save your audio and subtitle languages per show.
* **Avoid SDH subtitles:** Selects standard dialogue tracks over hearing-impaired subtitles.
* **External player sync:** Passes the show title, episode, start position, and subtitles to your external player, records playback progress, and starts the next episode automatically in the same player.
* **Interface and playback:** Includes `Hide spoilers` for unwatched episodes and `Smoother playback` for frame-rate matching.

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
