# Feature guide

Technical rules, thresholds, and fallback logic for the patches covered in the [README](../README.md).

## Skipping

Skip intros, recaps, and credits automatically (`Auto` mode) or display an on-screen Skip button (`Manual` mode). No API keys are required.

### Skip settings

Configure these options in Mod settings:
* `Intro skip`: Master switch (on/off). Turning this off stops all lookups and hides the skip button. On Stremio, the `Next episode` pill still appears for series.
* Anime openings: On/off.
* Mode: `Auto` or `Manual`.
* Recaps: On/off.
* `Skip credits`: `Auto`, `Button`, or `Off` (default `Button`).
* `Skip previews`: On/off (default off).
* `Show skip marks`: On/off (default on, Stremio `1.6.12` only). Draws coloured segment markers on the progress bar.

### Timestamp sources and lookup rules

The patch checks sources in this order:
1. Embedded chapters in the video file
2. This project's published timings
3. AniSkip (anime)
4. TheIntroDB
5. IntroDB.app (fills in missing segment types)
6. SkipDB (final fallback)

**Runtime verification.** Online timestamps apply only when your file's duration matches the source's measured runtime within 2 s. If the player does not know the file runtime yet, it holds the entry until the duration loads.

**Retries.** Playback never waits for a slow or offline server. Available sources apply immediately, while failed sources retry at 5 s, 20 s, and 60 s. Late responses merge cleanly without triggering a double skip.

**Anime and ID matching.** Before querying AniSkip, the patch resolves the anime title to the exact season and cour (broadcast block, including "Part 2" entries). A recap starting at `0:00` is kept if its duration is 10-180 s. Stremio provides the IMDb id or Kitsu id from its video metadata. Kitsu ids work with AniSkip, whereas IntroDB.app and SkipDB require an IMDb id and are skipped for Kitsu-only anime.

**Playback controls.** Resuming an episode inside an intro still triggers a skip. If you manually rewind or seek into a skipped segment, the player shows the Skip button instead of auto-skipping again. Remote control keys are never blocked.

### Chapter rules

* **Intros:** Chapters named `Opening`, `OP`, `Opening Credits`, `Main Titles`, `Title Sequence`, `Theme`, and close variations count as intros. Online timestamps snap to chapter edges.
* **Generic "Intro" chapters:** A chapter named simply `"Intro"` counts only when AniSkip, TheIntroDB, or IntroDB.app agrees with it within 15 s. If no online source has an intro, Vimu still accepts a lone `"Intro"` chapter when it runs 20-150 s and starts after `0:00` (such as after a cold open). Stremio ignores lone `"Intro"` chapters without online confirmation.
* **Credits and post-credit scenes:** Skipping credits seeks to the end of the credits segment rather than the end of the file, so post-credit scenes play normally. Chapters named `post-credit`, `mid-credit`, `stinger`, `epilogue`, or `bonus scene` never skip, and any credits segment trims where one of those begins.
* **"Ending" chapters:** A chapter named `Ending` counts as story by default. It is treated as credits only when all three conditions hold: it starts in the last 20% of the file, runs 240 s or less, and has a confirming signal (an online credits entry within 15 s, a preview or credits chapter immediately after it, or it is the final chapter in the file).
* **Previews:** Previews from named chapters or online sources follow your `Skip previews` setting (auto-skip or button). Previews inferred by the patch (the short tail after credits, or segments detected from opening dialogue lines in subtitle text) always display a button, even in `Auto` mode.

### Safety checks

The patch drops incomplete or conflicting timestamps to avoid cutting into the story:
* **Series confirmation:** Skipping stays off until the video id or Stremio's metadata confirms the title is a series episode.
* **Missing boundaries:** Segments without an end time are ignored. Intro, recap, and credits segments without a start time are ignored.
* **Open-ended credits:** Credits with a start time but no end time apply only after the file runtime loads, only if they begin in the last 40% of the file, and only if the source's file length matches yours.
* **Long credits:** Online credits segments longer than 180 s always show the Skip button instead of auto-skipping, even in `Auto` mode (though a shorter window can still overlap an unmarked scene).
* **Source overlap:** When two online sources closely agree on a segment, only their overlapping time range is skipped.
* **Early credits:** An early credits entry on an episode with no intro is dropped so an early outro is not offered as `Skip intro`. The only exception is TheIntroDB, which sometimes mislabels a real opening as credits; those entries are treated as the intro.
* **Conflicts at 0:00:** When sources disagree on a segment starting at `0:00`, the player shows the Skip button instead of auto-skipping.

### Local audio detection and fallbacks

* **Work out missing skip times (off by default):** When `Prepare next episode` locates the next episode's file, an isolated background process compares the audio at the start and end of that file against other episodes of the show. Because the analyzer runs in its own process, a crash inside it never interrupts playback. At least 2 other episodes must match to report a segment. Results rank below all other sources, follow your `Auto` or `Manual` setting, and apply strictly to the exact file analyzed. If analysis finishes while you are already watching inside the detected segment, the player shows a Skip button and never jumps automatically. Quotas cap usage at 1 attempt per episode per day, 24 episodes per show per day, and 100 GB of data read per day.
* **Borrow chapters from other releases (off by default):** Works independently of `Work out missing skip times`. Copies intro and credits chapter marks from another release of the same episode after an audio alignment check proves both files match. If alignment fails, nothing is copied. In an offline test of 40 file pairs, 44 of 45 copied segments landed within 1 s (median error 0.001 s, zero story cuts), and all 62 deliberately mismatched pairs were rejected.
* **Anime theme-song backup:** Runs when `Work out missing skip times` is on and an anime with a Kitsu id still lacks an intro or credits. Matches the show's official opening and ending songs from AnimeThemes.moe against the episode audio. It requires only a single episode, so it can work where comparing episodes cannot. It fills only missing segment types, and does nothing if it cannot confirm the exact show. Tested standalone on a PC across 123 episodes, it found 82 of 114 intros and 80 of 105 credits with no real wrong skips, and took Blood+ from 0 of 5 intros found to 5 of 5. The app matcher agreed with the PC build on all 99 compared episodes.

## Streams

### Auto-pick best stream

Press play on an episode to launch the highest-ranked stream without opening the stream selection list. `Auto-pick` is on by default and requires `Always show stream list` to be off (off by default). Long-press an episode to open its stream list manually for that play.

`Auto-pick` waits 4 s when a cached stream is available and 8 s otherwise. It filters out CAM, telesync, and screener copies, wrong season or episode numbers, addon warning cards, and external web links. If every stream fails the filter, the stream list stays on screen.

Remaining streams rank in this order:
1. Single-episode file before a season pack
2. Cached before uncached
3. Resolution (requires an explicit 4K label such as `2160p` or `4K`; a bare `UHD` tag does not count)
4. HDR or Dolby Vision
5. File size (no size cap)
6. Codec
7. Seeders

### Preload and spoiler controls

* **Prepare next episode:** Resolves the next episode's best stream in the background during playback so pressing Next, finishing the episode, or using Binge starts it immediately. Requires `Auto-pick` on, `Always show stream list` off, and `Prepare next episode` on. If the prepared stream fails to start within 25 s, the patch drops it.
* **Hide spoilers:** Optional toggle that hides thumbnails and synopses of unwatched episodes and replaces their titles with `Episode N`.

## Tracks and subtitles

Select an audio or subtitle language once, and future episodes of that show start with the same choice. Stremio's built-in player and Vimu share this saved preference across both IMDb and Kitsu ids.

* **Track pre-selection:** On Stremio `1.6.12`, remembered languages are set as the player's preferred tracks before playback begins, preventing mid-stream track switches and rebuffering.
* **Vimu language defaults:** Vimu checks your saved show preference before its own default rules. When no preference is saved for a show, Vimu prefers Japanese audio for anime, then your Stremio audio language, and finally English. For anime subtitles, it selects a full-dialogue track in your language over a Signs and Songs track.
* **Avoid SDH subtitles:** Prefers standard dialogue tracks over hearing-impaired (SDH) tracks, and strips sound cues when an SDH track is the only option left. In Vimu, this also applies to subtitle tracks embedded inside the video file.
* **Vimu addon subtitles:** When launching Vimu, Stremio passes your chosen subtitle plus up to five fallback tracks (your language first, then English). If the video file has no suitable embedded track in your language, Vimu loads the best addon subtitle automatically and lists the remaining options in its subtitle menu. Press the `GREEN` or `GUIDE` remote key to cycle through addon subtitles, embedded subtitles, and subtitles off.

## External players

Vimu, mpv, and Just Player are tested. MX Player and VLC use their public Android intent APIs and are untested.

If you have no default player set and Vimu is not installed, Android displays the system app chooser. Selecting MX Player in the chooser saves it as your remembered player until you select `Forget remembered player` in Mod settings.

* **Progress and crash recovery:** Pressing Back or Home inside an external player never marks an episode watched. An episode counts as watched only at 90% progress or on genuine completion. Vimu writes its playback position to a local journal every 10 s and saves immediately on pause, preserving your position if the app crashes. Stremio reads that journal while the player is open and on cold start (cold-start recovery works on `1.6.12` only).
* **Binge with external players:** On by default for series only. When an episode genuinely finishes, the next episode starts automatically in the same external player. Pressing Back, Home, or stopping playback early never launches the next episode. Because VLC and mpv return no completion result on a normal exit, the patch checks the known file runtime to separate an early exit from a finished episode; if the runtime is unknown, the next episode does not start.

## Settings and playback extras

`Mod settings` groups every patch option into one screen and adds these playback tools:
* **Smoother playback (Stremio player):** Adds frame-rate matching under `Match frame rate` (`Seamless only`, `Always`, or `Off`).
* **Larger playback buffer (Stremio player):** On by default. Buffers 50-120 s ahead (up to 256 MB) to reduce stalls on high-bitrate streams.
* **Playback diary:** On by default. Writes a compact local log that you can fetch with `adb pull`. Never records stream URLs or account details.
* **Enable debug mode (Intro Skip patch option):** Opens an on-screen log window when playback starts, showing the detected title, season, episode, and API responses.

## Stremio version differences

**Stremio 1.6.12** is the reference build:
* Patch options appear as rows inside Stremio Settings (`Interface` for `Hide spoilers`, `Playback` for the rest).
* Skips use an exact seek.
* Supports progress bar skip marks and cold-start external player recovery.

**Stremio 1.10.4, 1.12.0, 2.4.0, and 2.5.0** use a newer player architecture, so the patches hook the app's core layer and playback engines directly. Versions `1.12.0` and `2.5.0` were added in 1.7 (`2.4.0` patches cleanly like `2.5.0`, though most testing was done on `2.5.0`). `Intro Skip`, `Auto-pick`, `Hide spoilers`, `Remember tracks per show`, `Avoid SDH subtitles`, `External player progress`, and `Binge` work on these versions with four differences:
* **Keyframe seeking:** Skips use the engine's standard seek, which snaps to the nearest keyframe and can land 1-2 s early.
* **Remember tracks:** Saves the language only, does not remember "Subtitles off", and requires Stremio's built-in "auto select" option to be enabled.
* **Avoid SDH:** Strips hearing-impaired cues from subtitle text on the ExoPlayer engine, and enables mpv's built-in SDH filter on the mpv engine.
* **Next episode launch:** Starts the next episode immediately if it was prepared during playback; otherwise, opens the next episode's stream screen where `Auto-pick` starts it.

## Vimu patches

Vimu `12.00` (`net.gtvbox.videoplayer`) has seven dedicated patches:
* **Intro Skip (Vimu):** Uses the exact same timestamp sources and safety rules as Stremio. Adds rows to Vimu Settings for `Skip intros`, anime openings, `Auto`/`Manual` mode, recaps, credits (`Auto`/`Button`/`Off`), previews, and preferred audio language.
* **Intro Skip native fix (Vimu):** Applies a 2 byte fix in `libmediaengine.so` to prevent a native crash during rapid seeks. Supports both `armeabi-v7a` and `arm64-v8a` (`arm64` support arrived in 1.7).

## Reporting a problem

Open an issue with your app version, device model, the Morphe log if patching failed, and the relevant logcat lines:
* **Stremio log tags:** `IntroSkip`, `IntroSkipPort` (hooks on 1.10.4 and newer), `AutoPick`, `TrackMemory`, `ExtProgress`, `BingeDbg`, `SdhAvoid`, and `ModSettings`.
* **Vimu log tags:** `VimuIntroSkip`, `VimuResult`, `VimuTracks`, `VimuAddonSubs`, `VimuSubDialog`, and `VimuFix`.

Filter Stremio logs with:

```bash
adb logcat -s IntroSkip IntroSkipPort AutoPick TrackMemory ExtProgress BingeDbg SdhAvoid ModSettings
```
