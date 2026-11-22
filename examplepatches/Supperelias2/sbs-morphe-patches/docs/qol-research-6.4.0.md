# SBS 6.4.0: QoL patch research

Research date: 2026-11-21. Inspected original, signature-verified mobile
`com.sbs.ondemand.android` 6.4.0 (16659) and Android TV
`com.sbs.ondemand.tv` 6.4.0 (16690).

The original findings below describe proposals rather than device-tested features.
A later mobile-only implementation preview is documented in the
[experimental settings guide](mobile-settings-experimental.md); TV proposals
remain separate. Findings come from targeted
manifest inspection, reconstructed Java and DEX disassembly in the CLI
workspace. The intro/recap issue was checked in raw bytecode on both apps.
There was no device playback test or capture of account traffic. Effort ratings
are relative implementation estimates, not promises that a patch already works.
No original APKs, decompiled sources, stream URLs or credentials are included.

## Recommended order

1. Correct intro/recap seeking on the direct-stream path.
2. Build optional automatic intro/recap skipping on that corrected path.
3. Add persistent video quality and configurable seek intervals.
4. Improve TV overlay behavior and offer an optional pointer-input filter.
5. Consider the larger privacy, channel-zapping and external-player projects.

## Confirmed candidates

### 1. Correct intro/recap seeking for direct streams

**Mobile and TV; small to medium effort; highest priority.**

`PlayerViewModel.skipIntro()` and `skipRecap()` obtain the existing end marker
from `PlaybackEventViewModel`. They convert it with the IMA
`StreamManager.getStreamTimeMsForContentTimeMs()` method. When that manager is
null, both methods explicitly select position zero and pass it to
`ExoPlayer.seekTo()`.

Consequently, a direct stream without an IMA manager can jump back to the
beginning when the skip button is pressed. This is a verified code path, not
an observed failure on the user's device. Their position-analytics calls also
use zero in the absent-manager case; this does not establish that all saved
watch history is broken.

The fix should choose the correct time domain for the active provider: direct
content uses its marker time, while a DAI stream retains the original mapping.
Validate marker bounds and media duration, preserve seek-state bookkeeping,
and handle a stale manager left over from earlier playback. Merely assuming
that any non-null manager belongs to the current stream is insufficient.

### 2. Automatically skip intros and recaps

**Mobile and TV; medium effort; depends on item 1.**

The apps already contain skip actions and marker data, including the
`PlaybackEventViewModel` intro/recap boundaries. Add separate opt-in preferences
for intro and recap skipping, with one execution per segment and per media item.

Use content time, retain manual seeking, and avoid repeatedly skipping when a
viewer deliberately rewinds. Titles without usable markers should play normally;
the patch cannot infer reliable boundaries from missing metadata alone.

### 3. Remember video quality

**Verified on mobile; medium effort. Check TV's setting lifecycle separately.**

`TrackSelectorController.videoQualitySelected()` updates the selected state and
calls `setMaxVideoBitrate()`. There is no persistence operation in that method,
while audio and subtitle selection already use `AppStorage`.

Store a durable quality policy and reapply it after the player and available
tracks are ready. Do not persist an old per-stream track object or index: another
episode can expose different renditions. Keep an Auto option and fall back when
the chosen ceiling is unavailable. A bitrate ceiling does not guarantee an exact
resolution or create higher-quality video on the server.

### 4. Adjustable rewind and fast-forward intervals

**Mobile and TV; small to medium effort.**

`PlayerManager` initializes both seek increments to 15,000 ms and supplies them
to `ExoPlayer.Builder.setSeekBackIncrementMs()` and
`setSeekForwardIncrementMs()`. TV `PreferencesStorage` also contains interval
getters, but the inspected player paths do not consume those preferences.

Expose separate values, such as 10 seconds back and 30 seconds forward. Update
the actual builder fields, the dedicated TV/live seek paths, labels and mobile
PiP actions together. Changing an unused preference getter alone is not enough.
Respect live-DVR bounds and remote key repeats.

### 5. Subtitle appearance and placement

**Verified mobile rendering hook; medium effort. Verify TV rendering separately.**

`ODPlayerKt.SubtitleOverlay` configures `SubtitleView` with a fixed
`CaptionStyleCompat` and allows embedded styles. A patch can offer font scale,
outline/background and bottom margin, or honor Android caption preferences.

An optional consistent-style mode must also address embedded style precedence.
Test forced subtitles, accessibility captions, aspect-ratio changes and player
overlays. Burnt-in subtitles are video pixels and cannot be resized by changing
the subtitle view.

### 6. Configurable TV controls timeout and a clean paused picture

**TV; small effort for timeout, medium for pause/Back behavior.**

`PlayerUiStateController.resetControlsHideTimer()` uses a fixed three-second
delay. `hideControls()` refuses to hide while paused or while a pause ad is
visible. `forceHideControls()` exists, but the ordinary visibility path also
updates `PlaybackEventViewModel`.

Offer a timeout preference and an optional Back action that hides the controls
while remaining paused. Keep both visibility states and focus synchronized;
otherwise the overlay and playback-event buttons can disagree. Preserve a clear
way to reveal the controls and exit the player.

### 7. A G60S-friendly pointer-input mode

**TV; medium effort; useful for USB air remotes with accidental pointer input.**

`MainActivity` extends `ComponentActivity` and declares no touch or generic-motion
dispatch override. An Activity-level hook could consume selected pointer motion
and mouse clicks before Compose receives them, while retaining DPAD, Back,
Enter and media-key events.

First identify the actual event source/device from the USB receiver using a
small local input diagnostic. The current analysis did not observe the G60S's
events on the TV. Make filtering opt-in and preferably device/source-specific;
some remotes report useful buttons through mouse input too.

This would affect SBS only. It cannot turn off Android's global mouse pointer
or fix input behavior in other apps.

### 8. Configure the TV still-watching limit

**TV; medium effort.**

`PlayerViewModel` contains a four-hour inactivity threshold, an episode-count
threshold and a 20-second prompt timeout. The timeout eventually invokes
`exitDueToInactivity()`, which exits and releases the player. The
`PreferencesStorage.getAreYouStillWatchingTimer()` and episode-count flags are
debug accelerators here: changing them to true shortens thresholds rather than
disabling the feature.

Add an explicit local preference for the duration or for disabling the limit.
Gate timer and prompt scheduling, cancel already scheduled jobs when appropriate,
and handle the episode threshold consistently. Hiding the popup alone still
leaves the later exit active. Do not synthesize viewing or analytics events.

Keep the separate ten-minute pause-expiry logic intact: it helps refresh stale
streams after a long pause. An unlimited live session can continue consuming
data when nobody is watching.

### 9. Better TV shortcuts and a configurable starting section

**TV; medium effort.**

The inspected `ODPlayerKt` key handler already handles DPAD, Enter, media
play/pause, rewind and fast-forward. Additional explicit bindings could cover
separate Play/Pause keys, subtitles/audio and a direct shortcut to the existing
`PlayerViewModel.backToLive()` action. Check key-down/up/repeat behavior and
modal focus before adding bindings.

`TvNavigationHostKt` starts at `dashboard`; `DashBoardScreenKt` selects Home for
the inner navigation. Live TV and Favourites are existing destinations. A startup
preference and a reordered drawer are plausible improvements. Preserve Back-stack,
deep-link and focus behavior; changing just one Home route constant is incomplete.

## Larger projects

### 10. Minimal-telemetry mode

**TV initialization and dispatch verified; medium to high effort.**

This is supported by actual calls, not just SDK names in the APK.
`TvApplication.onCreate()` requests the advertising ID and initializes Conviva.
The Adobe receiver factory calls `AdobeAnalytics.Companion.initialise()`, which
configures/registers MobileCore extensions. `AnalyticsManagerImpl` dispatches
navigation events to Adobe and playback events to Adobe/OzTAM. Limited-ad-tracking
already replaces the advertising ID with an opt-out value, but dispatch remains.

An opt-in mode can gate identifier collection and selected analytics
initialization/dispatch together. Keep controllers safe to call, and audit
session creation/cleanup. Login, content requests and watch-progress persistence
must be traced separately rather than disabling every method named `track*`.
No claim of zero tracking is justified without subsequent lifecycle and network
verification.

### 11. Playback diagnostics and targeted recovery improvements

**Mobile and TV; medium to high effort.**

`PlayerManager.attemptErrorRecovery()` already retries some errors and requests
provider fallback; it suppresses identical errors within 30 seconds. SBS 6.4.0
also contains `PlayerViewModel.startResumeStallWatchdog(Context)`, called from
the inspected TV resume path, excluding live playback, with an eight-second
buffering check. Therefore
neither basic retry nor all watchdog behavior is missing.

A useful addition is an opt-in overlay showing provider, resolution/bitrate,
decoder, buffer state and a sanitized error/retry reason. It would help separate
VPN/network failures from decoder problems. Extending recovery to other contexts
requires bounded attempts, preserved position, lifecycle cancellation and an
understanding of the existing watchdog. Avoid endless retries on access errors
or exposing stream URLs, session identifiers or tokens.

### 12. Persistent VOD playback speed

**Mobile player hook verified; medium to high effort.**

The player uses Media3/ExoPlayer, but the inspected mobile settings and player
initialization do not expose a persistent playback-speed policy. A VOD-only
control could offer, for example, 0.75x, 1.25x and 1.5x with normal audio pitch.

This needs a settings control, persistence and restoration whenever the player
is recreated. Keep live playback at normal speed and verify subtitles, resume,
position reporting and the original DAI path. Treat it as an implementation
candidate rather than an already tested engine toggle.

### 13. Open a direct stream in an external player

**Mobile direct-stream loading hook verified; experimental, high effort.**

`PlayerManager.loadAkamaiMedia(videoId, url)` builds a `MediaItem` from the URL
and prepares/plays it. It is a concrete handoff point for an optional Android
external-player intent.

That method alone does not prove a stream is public, permanent, unencrypted or
independent of headers/session state. External codec/DRM support, expiring URLs,
access restrictions and watch-progress/resume integration all need investigation.
Keep URLs local and transient. Casting can use a different receiver and request
path; do not promise that the phone's ad patch automatically patches Chromecast.

### 14. Channel zapping and a compact live guide

**TV; high effort, further integration research required.**

The TV app contains Live TV, `EPGScreenKt` and live-schedule infrastructure.
The inspected player key handler has no explicit channel-up/down branch. A new
in-player guide could select the next accessible channel through the normal
media-loading path and briefly show the current/next program.

It would need a current channel list, cancellation of superseded loads, provider
fallback and careful state/focus handling during rapid zapping. Rights, streams
and EPG data remain server-dependent. The presence of EPG classes does not make
this a one-constant patch or prove there is no navigation elsewhere in the app.

### 15. An optional binge-watching profile

**Mobile and TV integration; medium to high effort.**

Combine independent preferences for intro/recap skipping, next-episode delay
and the still-watching limit. `PlaybackEventButtonKt.NextEpisodeLayout()` has
countdown state and `ODPlayerKt` already exposes watch-credits/cancel actions;
the existing autoplay toggle should remain available.

A shorter countdown or waiting until credits finish is a useful enhancement,
not evidence that basic autoplay is missing. Several countdown coroutine paths
have JADX reconstruction errors and need raw-bytecode and device verification
before changing them. Preserve cancellation, deliberate rewinds and per-title
metadata behavior. Implement and test the small independent patches before
combining them into a profile.

## Existing features and limits

- Autoplay already has user controls; a plain on/off patch would duplicate them.
- Audio/subtitle selection already has persistence. New styling or richer
  defaults are different features.
- Mobile PiP is declared in the manifest and has a dedicated handler.
- TV already has live-edge, restart, remote controls, partial focus restoration
  and recovery logic. Improvements should extend those paths.
- SBS documents VOD at 720p and supported live streams at up to 1080p. Removing
  client limits cannot create an absent 4K rendition.
- Offline downloads are a larger subsystem, not an identified hidden toggle;
  SBS describes the service as streaming-only.
- No new geographic-access bypass was investigated or promised here.

## Sources and local reproduction

Official product behavior was checked against the current SBS help pages:

- [Autoplay settings](https://help.sbs.com.au/hc/en-au/articles/7003858132879-How-do-I-enable-or-disable-auto-play-on-my-device)
- [Still-watching behavior](https://help.sbs.com.au/hc/en-au/articles/16080507221263-Why-Am-I-Seeing-Are-You-Still-Watching-On-SBS-On-Demand)
- [Video quality limits](https://help.sbs.com.au/hc/en-au/articles/13147785701903-What-video-quality-and-bandwidth-can-I-expect-when-streaming-on-SBS-On-Demand)
- [Subtitle appearance](https://help.sbs.com.au/hc/en-au/articles/5097791804687-Can-I-change-the-size-or-colour-of-subtitles)
- [Streaming/offline availability](https://help.sbs.com.au/hc/en-au/articles/360002023895-Can-I-watch-or-download-SBS-On-Demand-content-outside-Australia)

Local evidence is preserved under
`analysis/sbs-mobile-6.4.0/qol-playback` and
`analysis/sbs-tv-6.4.0/qol-tv` in the private CLI workspace, not this repository.
Some coroutine/Compose methods have reconstruction errors; raw DEX is the
authoritative evidence where those errors matter. Analysis used `morphe-exec`,
targeted `apkanalyzer dex code --class ...` dumps, and selected JADX classes.
For lower memory use, extract the relevant DEX to the analysis directory and
run targeted JADX on that file with a bounded heap rather than repeatedly
loading the complete APK. No proposed QoL patch was applied during this research.
