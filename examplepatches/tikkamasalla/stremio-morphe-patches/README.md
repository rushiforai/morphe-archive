# Stremio Morphe Patches

Patches for Stremio and Vimu that skip intros, recaps and credits for you. They also pick the best stream, avoid SDH subtitles (subtitles for the deaf and hard of hearing), and pass your episode, subtitles and audio and subtitle choices to external players. They are made for Android TV, with phone support from 1.7. You apply them to your own copy of the app with Morphe, a tool that patches Android apps.

## Install

1. In Morphe Manager, add this repo as a patch source: https://morphe.software/add-source?github=tikkamasalla/stremio-morphe-patches
2. Pick the Stremio app (or Vimu) and turn on the patches you want, for example "Intro Skip".
3. Patch and install.

The patched app replaces your current Stremio. To keep both, turn on the Side-by-side install patch, which is off by default. It installs the patched app as "Stremio Morphe" (package com.stremio.one.morphe) next to the original.

For Vimu, patch your own copy of the Vimu 12.00 APK. A copy that someone else already modified may carry extra checks that these patches do not remove. Stock Vimu exits when its signing certificate changes, which happens with every patched build, and the Re-sign check (Vimu) patch lets the patched app run.

## Supported versions

| App | Version | Notes |
|---|---|---|
| Stremio TV (com.stremio.one, Android TV) | 1.6.12 | Reference version. Every feature works here. |
| Stremio TV | 1.10.4 | arm64 and armeabi-v7a builds. |
| Stremio TV | 1.12.0 | arm64 and armeabi-v7a (bundle). |
| Stremio phone (com.stremio.one, touch UI) | 2.4.0, 2.5.0 | Touch skip button. Mod settings from the launcher shortcut. |
| Vimu Media Player (net.gtvbox.videoplayer) | 12.00 | Seven patches of its own. |

The eleven Stremio patches that apply by default work on all five Stremio versions. A twelfth, Side-by-side install, is off by default. 1.12.0 and 2.5.0 are new in 1.7. If your copy does not patch cleanly, open an issue and attach the Morphe log.

On every version except 1.6.12, skips can land 1-2 s early and the progress bar has no skip marks. The settings are in one Mod settings screen. On TV, open it from the first row of Stremio Settings or with the MENU key. On a phone, long-press the launcher icon. The [feature guide](docs/FEATURES.md) lists every difference.

## What you get

Skipping. Intros, recaps and credits are skipped automatically, or with a Skip button in Manual mode. The times come from the chapters inside the video file, then from AniSkip, TheIntroDB, IntroDB.app and SkipDB, with no API keys. Times from [IntroKiller Engine](https://github.com/tikkamasalla/introkiller-engine) are tried before the online sources. Movies and post-credit scenes are never skipped.

Working out missing skip times. This optional setting, off by default, fills the gap when no online source has times for an episode. While one episode plays, the app studies the next one in the background by comparing its audio with other episodes of the show, then uses the result as the lowest-priority source. It follows your Auto or Manual choice like any other skip.

| Tested on one Streamer, real streams | Time for one episode | Data read through your debrid service | Result |
|---|---:|---:|---|
| 1080p, comparison episodes already stored | about 6 minutes | about 0.4 GB | Intro skipped automatically |
| 1080p, one comparison episode to fetch | about 19 minutes | about 0.9 GB | Intro and credits found, correct on frames |
| 4K remux, nothing stored | about 40 minutes | about 5 GB | Finished, found nothing on that show |

Each result applies only to the exact file it was worked out for, and each episode gets one try per day. A slow job can finish after the next episode has started, so its intro may be missed.

Three more changes came with it in 1.8:

| Feature | What it does | What we measured |
|---|---|---|
| Borrow chapters from other releases (off by default) | Copies intro and credits marks from another release of the same episode, after an audio check proves the two files line up. | Offline test of 40 file pairs: 44 of 45 copied segments landed within 1 s, median error 0.001 s, no story cut. All 62 deliberately mismatched cases were refused. It has not yet produced a result on a real device. |
| Anime theme-song backup (runs with Work out missing skip times) | Fills a missing intro or credits by matching the show's official songs. It needs only one episode, works only for shows with Kitsu ids, and never replaces another source. | The PC version, used alone on 123 episodes, found 82 of 114 intros and 80 of 105 credits with no real wrong skips, and rescued Blood+ from 0 of 5 intros to 5 of 5. The app's matcher agreed with it on all 99 episodes compared. It has not yet run on a real device. |
| Early outro fix | Stops an outro near the start of an episode from being offered as "Skip intro". An opening that TheIntroDB mislabels as credits is still treated as the intro, because that case is real. | Covered by self-tests in both Stremio's player and Vimu. |

Streams. Auto-pick best stream plays the top-ranked stream without showing the list. It never picks a CAM, telesync or screener.

Tracks and subtitles. The audio and subtitle language you pick is remembered for each show, in Stremio's player and in Vimu. Avoid SDH subtitles prefers full dialogue tracks.

External players. Stremio passes the show, episode, start position and subtitles to the player, saves your progress, and starts the next episode in the same player.

The patches also add Hide spoilers, Smoother playback and a Mod settings screen.

## Known limits

* File chapters are read from Matroska and WebM files only, and they need an http(s) stream.
* If no online source has data for an episode, such as a new release, there is nothing to skip unless Work out missing skip times is on.
* Online credits times can run over a mid-credits or post-credits scene.
* Remember tracks needs Stremio's "auto select" setting on (newer builds). Auto-pick needs "Always show stream list" off.

## What the patches connect to

Besides Stremio's own traffic, your addons and your debrid service, the patched code contacts only these. For skip times: api.aniskip.com, api.theintrodb.org, api.introdb.app, api.skipdb.tv, and raw.githubusercontent.com for this project's own times file. The anime theme-song backup, only when Work out missing skip times is on: kitsu.app, graphql.anilist.co, graphql.animethemes.moe and AnimeThemes' audio host. For finding the right show: graphql.anilist.co, kitsu.app, v3-cinemeta.strem.io. Lookups send the show id or title, season, episode and, where the source uses it, the file's length. No account, stream address or debrid key is sent.

## Help

Open an issue with the app version, your device, the Morphe log if patching failed, and the relevant logcat lines. The feature guide lists the log tags. To build the patches yourself, run `./gradlew :patches:build` and apply the bundle in `patches/build/libs/patches-*.mpp` with Morphe Desktop.

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
