# Stremio Morphe Patches

Patches for Stremio and Vimu, for use with Morphe. Made for Android TV: auto-skips intros, recaps and credits, avoids SDH subtitles, picks the best stream, and passes your episode and subtitles to external players.

I made this for my own TV. It just skips the boring bits so playback keeps going.

## Features

* Exact skips from the video file own chapter markers (Opening, OP, Intro, Opening Credits, Main Titles and similar names).
* IntroDB timings for TV shows.
* AniSkip timings for anime.
* Online timings snap to chapter edges when both exist.
* Resuming inside an intro still skips.
* Seeking back on purpose shows a "Skip intro" button instead of skipping again.
* Remote keys are never blocked. OK on the button skips, everything else works as normal.
* Settings in Stremio: on/off, anime on/off, Auto or Manual, recaps on/off.
* Hide spoilers: optional switch in Settings > Interface that hides thumbnails and synopses for unwatched episodes.
* External player progress: Stremio stays alive while an external player is open, so progress saves for Vimu, MX Player, mpv, VLC. The player starts at the saved position.
* Avoid SDH subtitles: picks full dialogue subtitles over hearing-impaired tracks, and strips sound notes when no other track remains. Switches in Settings > Playback.
* External player hand-off: Stremio passes the show, episode and selected subtitle to the external player, so Vimu skips intros and picks the right subtitle.
* Skip credits: jumps to the end of the credits so after-credits scenes still play, then shows a Next episode pill. Settings: Skip credits Auto/Button/Off (default Button) and Skip previews on/off (default off). Series only.
* Binge with external players: when an episode finishes in Vimu, MX Player, VLC or mpv, the next episode starts in the same player. Setting on/off (default on). Series only.
* Remember tracks per show: reuses the last audio language and subtitle choice for other episodes of the same series. Setting on/off (default on).
* Auto-pick best stream: plays the top ranked stream without showing the list. Cached first, then resolution, then HDR, then size. Setting on/off (default on) plus Always show stream list (default off). Long-press an episode to open its stream list once. Streams that name another season or episode, season packs and files over 25 GB are skipped or ranked last.
* Spoiler titles: when Hide spoilers is ON, unwatched episode titles show as Episode N in the row and header.
* Vimu: intro skip with Skip button and Auto/Manual settings, crash fixes, and progress result.

Tested on Stremio 1.6.12 (com.stremio.one, Android TV).
Tested on Vimu 12.00. If your copy doesn't patch cleanly, open an issue.

## Install with Morphe Manager

1. Add this repo as a patch source in Morphe Manager:
   https://morphe.software/add-source?github=tikkamasalla/stremio-morphe-patches
2. Pick the Stremio app (or Vimu), enable the patches you want (for example "Intro Skip"), patch and install.
3. Optional: the "Enable debug mode" patch option opens a log window when playback starts, useful to see the detected title, season, episode and API responses.

## Known limits

* Movies are never skipped.
* Only the Stremio 1.6.12 TV flow is tested. Other versions may not hook.
* File chapters work offline. AniSkip, TheIntroDB, IntroDB.app and SkipDB need internet. No API keys needed.
* Lookup order: file chapters, AniSkip for anime, TheIntroDB for shows, IntroDB.app as fallback per segment type, then SkipDB as a final fallback. The IMDb id comes from Stremio's own video id; if that is missing, a keyless Cinemeta name lookup is used and remembered for 60 days.
* Online timings snap to chapter edges within 15 s. Weak "Intro" chapter names only count when AniSkip, TheIntroDB or IntroDB.app agrees within 15 s, or when none of them has anything for the episode.
* If the exact seek fails it falls back to a normal seek.

## Vimu support

The same bundle also carries an "Intro Skip (Vimu)" patch for Vimu 12.00 (net.gtvbox.videoplayer).

It skips intros and recaps the same way: file chapter markers first, then AniSkip for anime, TheIntroDB for shows, IntroDB.app as fallback per segment type, and SkipDB as a final fallback. None of the lookup steps needs an API key. It uses an IMDb id from the playing item when one is present, else a keyless Cinemeta title lookup that is remembered for 60 days. Auto mode skips at once, Manual mode shows a Skip button. The Vimu Settings rows cover Skip intros, anime openings, Auto/Manual mode, and recaps. The patch also includes crash fixes from the same mod: deferred prepare for the tunneling crash on cold start, media session release on exit, seek timer cancel, and a 2 byte fix in libmediaengine.so for a native crash on rapid seeks. It also returns position and duration so Stremio can save progress.

Patch your own copy of the Vimu 12.00 APK. Copies that were already modified by someone else may carry extra checks that this patch does not remove, so test on your own copy.

## Build locally

```bash
./gradlew :patches:build
```

The bundle lands in `patches/build/libs/patches-*.mpp`. Apply it with Morphe Desktop.

<!-- PATCHES_START -->
> **[v1.6.0](https://github.com/tikkamasalla/stremio-morphe-patches/releases/tag/v1.6.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;12 patches total
<details open>
<summary>📦 Stremio&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Auto-pick best stream](#auto-pick-best-stream) | Skips the stream list and plays the top ranked stream. Enable Always show stream list to see every stream. |  |
| [Avoid SDH subtitles](#avoid-sdh-subtitles) | Prefers full dialogue subtitles over SDH/CC tracks and strips sound notes when none remain.<br><br>Avoid SDH v1.0.0<br>Repository: https://github.com/tikkamasalla/stremio-morphe-patches |  |
| [Binge with external players](#binge-with-external-players) | Auto-plays the next episode in the same external player when an episode finishes in Vimu, MX Player, VLC or mpv. |  |
| [External player progress](#external-player-progress) | Saves watch progress in Stremio when playing in an external player, and starts the player at the saved position. |  |
| [External player progress manifest](#external-player-progress-manifest) | Declares the keep-alive service for External player progress. Runs with that patch. |  |
| [Hide spoilers](#hide-spoilers) | Hides thumbnails and synopses for unwatched episodes in Stremio.<br><br>Hide spoilers v1.0.0<br>Repository: https://github.com/tikkamasalla/stremio-morphe-patches |  |
| [Intro Skip](#intro-skip) | Adds intro and recap skip controls for TV shows, movies and anime in Stremio.<br><br>Intro Skip v1.0.0<br>Repository: https://github.com/tikkamasalla/stremio-morphe-patches | • Enable debug mode |
| [Remember tracks per show](#remember-tracks-per-show) | Remembers the last audio and subtitle choice for each series and applies it to other episodes. |  |

</details>

<details open>
<summary>📦 Vimu&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;12.00 ST | 🧪&nbsp;12.00 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [External player result (Vimu)](#external-player-result-vimu) | Returns position and duration from Vimu so Stremio saves progress. Runs with the Intro Skip (Vimu) patch. |  |
| [Intro Skip (Vimu)](#intro-skip-vimu) | Adds intro and recap skip for TV shows, movies and anime in Vimu.<br><br>Intro Skip v1.0.0<br>Repository: https://github.com/tikkamasalla/stremio-morphe-patches |  |
| [Intro Skip native fix (Vimu)](#intro-skip-native-fix-vimu) | Fixes native crashes on rapid seeks in the Vimu media engine. Runs with the Intro Skip (Vimu) patch. |  |
| [Intro Skip settings row (Vimu)](#intro-skip-settings-row-vimu) | Adds the Intro Skip settings to Vimu Settings. Runs with the Intro Skip (Vimu) patch. |  |

</details>

<!-- PATCHES_END -->

## Credits

Started from aniskip-stremio by AzukiSensei (https://github.com/AzukiSensei/aniskip-stremio), GPLv3. Rewritten with chapter-based skipping, IntroDB support and new skip logic.

SDH annotation rules adapted from liongalahad-nuviotv-morphe-patches (GPLv3).

## License

GPLv3, see [LICENSE](LICENSE).
