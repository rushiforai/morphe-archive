# Feature guide

This page holds the detail behind the [README](../README.md). Each section starts with what you notice as a viewer, then gives the exact rules and numbers.

## Skipping

You see a Skip button, or an automatic jump over the intro, recap or credits, depending on your settings. The patch collects skip times from several sources and ignores any that look unsafe.

The sources, in the order they are tried: the video file's own chapters (named sections inside the file), AniSkip (anime), TheIntroDB, IntroDB.app (which fills in segment types that are still missing), then SkipDB as the last fallback. No API keys are needed. This project's own published timings are tried before the online sources. An entry is used only when your file's length matches the length it was measured on, within 2 s. While the length is unknown, the entry is held.

Chapters named Opening, OP, Opening Credits, Main Titles, Title Sequence, Theme and similar names count as an intro. Online timings snap to chapter edges.

For credits, the skip jumps to the end of the credits instead of the end of the file, so an after-credits scene still plays. Chapters named post-credit, mid-credit, stinger, epilogue or bonus scene are never skipped, and a credits segment stops where one begins. A chapter named "Ending" counts as story. It counts as credits only when it starts in the last 20% of the file, runs at most 240 s, and something agrees with it: an online credits segment starting within 15 s, a preview or credits chapter right after it, or it is the last chapter.

A preview from a named chapter or an online source follows the Skip previews setting (auto-skip or button). A preview that the patch only infers always gets a button, even in Auto mode. That covers the short tail after the credits, and the first dialogue lines found in the subtitle text.

These rules keep incomplete data from skipping the wrong thing:

* Segments with an unknown end are ignored. So are intro, recap and credits segments with an unknown start.
* Credits with a start but no end are used only once the runtime is known, only when they start in the last 40% of the file, and only when the source's file length fits this file.
* When two online sources agree closely on a segment, only the part both agree on is skipped.
* When sources disagree about a segment at 0:00, the Skip button shows instead of an automatic skip.
* A title counts as a series only once its id (or Stremio's type) proves it. Until then skipping stays off.
* With the Intro skip switch off, nothing is looked up and no skip button shows. On Stremio, the Next episode pill still appears for series.

Resuming inside an intro still skips it. If you seek back on purpose, or seek into a segment yourself, a Skip button shows instead of another automatic skip. Remote keys are never blocked.

If a source is down, the player does not wait for it. The other sources apply at once, and the failed source is retried after 5 s, 20 s and 60 s. A late answer is merged without skipping twice.

For anime, the title is resolved to the right season and cour (a broadcast block, including "Part 2" style entries) before AniSkip is asked. A recap that starts at 0:00 is kept when its length is plausible (10-180 s).

The skip settings are on/off, anime on/off, Auto or Manual, recaps on/off, Skip credits (Auto, Button or Off, default Button), Skip previews (on/off, default off) and Show skip marks (on/off, default on, 1.6.12 only). Skip marks are coloured marks on the progress bar.

## Streams

You press play and the best stream starts without a list. Auto-pick best stream never chooses a CAM, telesync or screener, a stream for another season or episode, an addon warning card or an external link. It ranks the rest like this: a single-episode file before a season pack, cached before uncached, then resolution (a 4K label such as 2160p or 4K is required, and a bare "UHD" is not enough), HDR or Dolby Vision, size, codec and seeders. There is no size cap. If every stream is bad, the list stays on screen.

Auto-pick waits 4 s when a cached stream is there and 8 s otherwise. It is on by default, and Always show stream list is off by default. Long-press an episode to open its list once.

While an episode plays, the best stream for the next one is prepared in the background, so Next, the end of the episode or Binge starts it at once. This needs Auto-pick on and Always show stream list off, and it has its own on/off setting, Prepare next episode. If the prepared stream has not started after 25 s, the patch gives up on it.

Hide spoilers is an optional switch. It hides thumbnails and synopses of unwatched episodes and shows "Episode N" instead of their titles.

## Tracks and subtitles

Pick an audio or subtitle language once, and the show's other episodes start with it. Stremio's player and Vimu share this memory, for IMDb and Kitsu ids. 

On 1.6.12, the remembered languages are set as the player's preferred languages before playback starts, so nothing switches and rebuffers afterwards. Vimu applies the memory before its own default rules. Without a memory, Vimu prefers Japanese audio for anime, then your Stremio audio language, then English. Anime also gets a full-dialogue subtitle in your language instead of Signs and Songs.

Avoid SDH subtitles prefers full dialogue subtitles over SDH tracks, and strips sound notes when no other track remains. In Vimu, the same rule applies to the file's embedded tracks.

In Vimu, Stremio passes the subtitle you chose plus up to five more (your language first, then English). If the file has no good embedded track in your language, Vimu loads the best addon subtitle itself and lists the rest in its own menu. The GREEN or GUIDE remote key cycles addon, embedded and off.

## External players

Vimu, mpv and Just Player have been tested. MX Player and VLC follow the player's public intent API and have not been tested. With no default player set and Vimu not installed, Android shows its chooser. After you pick MX Player there, it stays the remembered player until you use Forget remembered player in Mod settings.

Back or Home in the player never marks an episode as finished. An episode is marked watched at 90% or on a real completion. Vimu writes its position to a journal every 10 s, and pausing saves it at once, so progress survives a crash. Stremio reads the journal while the player is open and when Stremio is started again after being closed (a cold start). Recovery after a cold start works on 1.6.12 only.

Binge with external players starts the next episode in the same player when an episode really finishes. It is on by default and applies to series only. Back, Home or a stop before the end never starts the next episode. VLC and mpv give no result on a normal end, so the patch needs the runtime to tell an early quit from a real end. With an unknown runtime, no next episode starts.

## Settings and extras

Mod settings is one screen with every setting of these patches.

* Smoother playback, in Stremio's own player: frame-rate matching under the Match frame rate setting (Seamless only, Always or Off).
* Larger playback buffer, in Stremio's own player: 50-120 s of read-ahead, up to 256 MB, on by default, for fewer stalls on high-bitrate streams.
* Playback diary: a small local log, on by default, readable with `adb pull`. No stream addresses or accounts are written to it.
* Enable debug mode, an option of the Intro Skip patch: opens a log window when playback starts and shows the detected title, season, episode and API responses.

## Differences between Stremio versions

1.6.12 is the reference build. Its settings are rows in Stremio Settings (Interface for Hide spoilers, Playback for the rest), skips use an exact seek, and only this build has skip marks and cold start recovery.

1.10.4, 1.12.0, 2.4.0 and 2.5.0 use a newer Stremio player screen, so the patches hook the app's core layer and player engines instead. Intro Skip, Auto-pick, Hide spoilers, Remember tracks per show, Avoid SDH subtitles, External player progress and Binge are all ported. You will notice these differences:

* Skips use the engine's normal seek, so they can land on the nearest keyframe, about 1-2 s early.
* Remember tracks keeps the language only. "Subtitles off" is not remembered, and Stremio's "auto select" setting has to be on.
* Avoid SDH cleans cue text on the ExoPlayer engine only. With the mpv engine, mpv's own SDH filter is switched on.
* If the next episode was prepared while this one played, it starts at once. Otherwise the patch opens the next episode's stream page and Auto-pick starts it.

1.12.0 and 2.5.0 are new in 1.7. 2.4.0 patches cleanly like 2.5.0, but most of the checking was done on 2.5.0.

## Vimu

Vimu 12.00 (net.gtvbox.videoplayer) gets seven patches. Intro Skip (Vimu) uses the same sources and rules as Stremio. Vimu Settings gets rows for Skip intros, anime openings, Auto/Manual mode, recaps, credits Auto/Button/Off, previews, and the preferred audio language.

Intro Skip native fix (Vimu) is a 2 byte fix in libmediaengine.so for a native crash on rapid seeks. It is built for both armeabi-v7a and arm64-v8a (the arm64 build is new in 1.7).

## Known limits

* A chapter named just "Intro" counts only when AniSkip, TheIntroDB or IntroDB.app has an intro that agrees with it within 15 s. If no online source has an intro, a lone "Intro" chapter counts in Vimu only when it is 20-150 s long and does not start at 0:00, which is usually a cold open. On Stremio it is not used.
* The IMDb id comes from Stremio's own video id. Kitsu ids work for AniSkip, but IntroDB.app and SkipDB need an IMDb id, so they are not asked for Kitsu-only anime.
* Credits over 180 s from an online source show the Skip button even in Auto mode, but a shorter window can still contain a scene.

## Reporting a problem

Open an issue with the app version, your device, the Morphe log if patching failed, and the relevant logcat lines. Useful tags are IntroSkip, IntroSkipPort (hooks on 1.10.4 and newer), AutoPick, TrackMemory, ExtProgress, BingeDbg, SdhAvoid and ModSettings. For Vimu: VimuIntroSkip, VimuResult, VimuTracks, VimuAddonSubs, VimuSubDialog and VimuFix. For example:

```bash
adb logcat -s IntroSkip IntroSkipPort AutoPick TrackMemory ExtProgress BingeDbg SdhAvoid ModSettings
```
