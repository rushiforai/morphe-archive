# YouTube Music private patch bundle — plan

Our own patch bundle, applied next to the full official Morphe bundle in Morphe Manager, in one patch run. Not a fork: we never change Morphe's code.
Public GitHub repo while testing, private once it's ready. After each major Morphe or YT Music release: re-patch, check every feature, fix what broke.

## Build and test workflow
We always patch for real: Morphe Manager and Morphe Desktop's CLI use the same patcher library, so the same bundles give the same app on the PC and on the phone (only the signing key differs).
- Build: our bundle (`./gradlew buildAndroid` → `patches-*.mpp`) in a Docker container with JDK + Android SDK; no JDK on the PC. Gradle needs a GitHub token with `read:packages`.
- Patch: Morphe Desktop CLI in the same container: `patch -p <morphe .mpp> -p <our .mpp> youtube-music.apk`.
- Test: `adb install` on the LDPlayer 14 emulator (`D:\LDPlayer\LDPlayer14\adb.exe`, root on).
  - Sign-in through MicroG-RE.
  - logcat with Morphe's debug logging.
  - Root to inspect app files.
- One loop: build → patch → install, a few minutes.
  - Optional later: a debug-only loader so UI tweaks skip re-patching.
- Phone: the final .mpp files go into Morphe Manager (repo URL while public, file import once private).
- Emulator caveats:
  - x86_64 running ARM apps through translation, so native libraries are built for x86_64 + arm64;
  - automix timing is checked on the real phone.

### Ready (set up 2026-11-08)
- Docker image `ytm-patches-tools`: [docker/Dockerfile](docker/Dockerfile). Contents: JDK 21, Android SDK (licenses accepted), Morphe Desktop 2.1.1 CLI, apkeep.
- App: YouTube Music 9.30.53 (Morphe 2.1.0's newest stable target) as an untouched XAPK in `work/apk/`.
  - Every split is signed by Google's certificates, the same ones Morphe lists. Checked with [docker/verify-xapk.sh](docker/verify-xapk.sh).
  - The XAPK holds arm64-v8a libraries only; the emulator runs them through translation.
- Bundle: [bundle/](bundle/), from Morphe's template; "Ayham Patches", package `app.ayham`, with the "Hello" pipeline-check patch.
- `scripts/build-bundle.ps1`: builds our bundle in Docker (gh token needs `read:packages`); first build ~4 min, cached after.
- `scripts/patch.ps1 [-Install]`: patches with the Morphe bundle + ours and installs on the emulator.
  - Selection: all 51 YT Music patches (defaults + "Network proxy"), no universal patches.
  - Writes `work/out/result.json`. Last run: 52 applied (51 + Hello), 0 failed.
- Signing key: Morphe's default shared keystore in `work/morphe-data/morphe.keystore` (alias/password "Morphe", same as Manager); keep it, or reinstalls wipe app data.
- Emulator:
  - Morphe MicroG 7.3.0 (the build morphe.software/microg links to; package `app.revanced.android.gms`);
  - patched app `app.morphe.android.apps.youtube.music`.
  - Sign-in still to do (user).
- Smali gotcha: `this` in `MusicActivity.onCreate` sits above v15, so injected calls need `invoke-static/range { p0 .. p0 }`.
- Morphe docs notes: `docs/morphe-notes.md`.

## 0. Spike (first)
A throwaway test build that tries only the risky parts, so a dead end shows up on day one. Each item ends in "works" or "doesn't, use the fallback".
1. Pipeline: Docker build image, a "hello" patch in our bundle, CLI patch with Morphe's bundle + ours, install and sign in on the emulator, and the hello patch shows up.
2. Morphe crossfade hook: our patch can hook Morphe's crossfade code (`app.morphe.extension.music.patches.CrossfadePatch`) in the same run, which means our patch runs after Morphe's. Fallback: our own copy of the crossfade, with Morphe's turned off.
3. Player controls: add seek + playback speed to YT's ExoPlayer class and use them on the incoming crossfade player.
4. Native code + models: ONNX Runtime + `libbitchord_analysis.so` + the two models load in the patched app. Fallback: download them on first run instead of shipping them.
5. Audio for analysis: a track downloads with Morphe's `StreamingDataRequest.fetchRequestForDownload` and decodes to PCM with MediaCodec. The next track's id comes from the media session queue.
6. Calling Morphe from our code: `LyricsManager.getInstance().getCurrentLineText()` and Morphe's `StreamingDataRequest` are reachable from our extension.
7. Player page hook: attach one test view over YT's now-playing page and hide one stock view, the base for the BitChord UI.
8. Song version: wrap Morphe's `setVideoIdResolver` (ask Morphe's first, then ours) and swap one music video for its song.
### Batch A results (2026-11-10, items 2, 3, 6, 7, 8): all work
Test patch: `bundle/.../spike/SpikeAPatch.kt` + `SpikeA.java`, driven by `spike.properties` in the app's external files dir. Morphe-touching edits run in `finalize`, which runs after every patch's execute, so Morphe's extension classes are already in the app; that solves the cross-bundle ordering problem without `dependsOn`.
- 2 Crossfade hook: works. We hook Morphe's `CrossfadePatch.getCrossfadeDurationMs()` (one value sets both the fade length and the auto-advance trigger point, trigger = length + 300 ms) and `onPendingPlayerReady(ExoPlayerAccess)` (the incoming player). Proven: Morphe set to 3 s, ours 8 s → fade-out ran 8041 ms; monitor showed `trigger@8300ms` and fired at 8.1 s remaining.
- 3 Seek + speed: works. Speed already exists: Morphe's playback speed patch adds `patch_setPlaybackParameters(speed, pitch)` to the same player class (`ctb`); it passes our speed through while Morphe's speed setting is 1.0x (if the user sets another speed, Morphe's 1 s loop would fight automix). Seek: we add `ayham_seekTo(long)` to `ctb`, calling Media3 `BasePlayer.seekTo(long)` (found by its bytecode shape). Proven: incoming player seeked to 0:30 at fade start, YT's seek bar and Morphe's synced lyrics followed; 1.06x applied and reset.
- 6 Calling Morphe: works. `LyricsManager.getInstance().getCurrentLineText()` returns live synced lines; `StreamingDataRequest.fetchRequestForDownload` is present. Spike used reflection; for real code add compile-only stubs of those classes.
- 7 Player page hook: works with caveats. `player_page` is a CoordinatorLayout (ids: `player_page`, `player_view_pager_container`, `time_bar`, `music_playback_controls`, `video_action_bar`, `audio_video_switch_toggle`, `cast_button_container` ...). Overlay drawn; `video_action_bar` hidden. Caveats: YT re-shows hidden views on every layout pass (re-hid 21 times; real UI needs a stronger hide, e.g. zero size or hooking its visibility), and a child of `player_page` also shows over the miniplayer when collapsed (track the expand state).
- 8 Song version: works. Hooked Morphe's `setVideoIdResolver` to wrap whatever it installs (Morphe's `PlayAlbumSongsPatch` resolver runs first, ours after). Proven: Starboy video `34Na4j8AVgA` → song `3_g2un5M350`, played the song's audio with album art under the video's queue entry, no errors. Also note: YT's own audio/video switch on a video only plays the video's audio, not the song. To do in the real feature: also hook Morphe's `setVideoLengthResolver` (UI showed the video's 4:33 for the 3:51 song) and find the counterpart automatically.
- Build note: our extension dex carries the Kotlin stdlib (duplicates of classes already in the app); the patcher accepted it, but drop it from the extension later.

### Batch B results (2026-11-10, items 4, 5, and item 7 retested as "move"): all work
Test patch: `SpikeBPatch.kt` + `SpikeB.java` (+ JNI stubs `com.music.bitchord.playback.smart.TrackFeatures` / `MelSpectrogram`, BitChord's .so binds to those names).
- 4 Native code + models: works. A patch can add `.so` files to `lib/arm64-v8a`, but new files are stored compressed, and YT ships `extractNativeLibs=false` (install failed: "Failed to extract native libraries"). Fix: the patch sets `android:extractNativeLibs="true"`. Then `libbitchord_analysis` loads in ~30 ms, ONNX Runtime 1.28.0 (Java API in our extension dex, needs extension minSdk 26) starts in ~0.6 s, Beat This! model loads in ~2 s and the vocals model in ~0.1-0.5 s, both read from files in the app's external dir (the "download on first run" route; shipping them in the APK is also possible). Extension adds ~11 MB to the bundle, the three .so files ~25 MB to the APK.
- 5 Audio for analysis: works end to end, automatically. Next track id: the media session queue has titles but no ids (`mediaId=null`), and Morphe's audio/video switch queue capture is not in this build; Morphe's Jam bridge (`jam.YouTubeMusicBridge.queue`, a `QueueAccess` captured from YT's queue class) works: `patch_jamItems()` / `patch_jamCurrent()` / `patch_jamVideoId()`, read on `patch_jamExecutor()`. For a radio/mix the main lane holds only the current song; the next one is `patch_jamAutoplayItems()[0]` (25 items). Then Morphe's `LocalDownloadManager.resolveStream` (itag 251 Opus) + its `openAudioConnection` range requests (1 MB, HTTP 206), MediaCodec decode, BitChord native analysis, mel spectrogram, and Beat This!. Timings on the emulator for a 5:49 song: download 1.1 s, decode 10 s, analysis 1.2 s (BPM 106, key G minor, mix-in 35 s, mix-out 344 s), mel 1 s, Beat This! on 30 s of audio 4 s (so a full song is ~45 s on one thread; fine while the current song plays, but run it in chunks/background).
- 7 (redo) Move, don't hide: reparenting `video_action_bar` into our own container breaks it (the Litho content renders empty). Keeping it in its parent and moving it with `translationY` works: the real chips row (likes with RYD count, dislike, Lyrics, comments, Save, share, Morphe's Download) sits right above the seek bar, fully drawn, and taps work (Lyrics opened the lyrics sheet, Download started Morphe's download). YT resets the position on every layout pass, so it is re-applied from a layout listener. This is the base for "all YT elements, reordered": move real views, never rebuild them.

9. Offline, the biggest unknown (airplane mode, rooted emulator):
   - a. Does YT Music open its player at all when offline?
   - b. Which request it sends for a song (plain player request, or bundled "Onesie"/SABR), and whether a saved response can answer it.
   - c. Feeding the local file, keeping the first that works: hook YT's media data source; pre-fill YT's own player cache; a tiny 127.0.0.1 server.
   - d. Look at YT Music's own offline storage (how Premium downloads are kept).

### Batch C results (2026-11-10, item 9, partial)
How to go offline on LDPlayer: not `svc wifi disable` (adb runs over the emulator's Wi-Fi, so adb dies and a reboot keeps it off; the user had to switch Wi-Fi back on in the window). Not a full `iptables` REJECT on `wlan0` either: adb survives, but system services stall and the whole emulator ANRs. The emulator's iptables has no `owner` match, and Android 14 here has no per-app network command. Next time: block YT's hosts only (e.g. a DNS/hosts entry for `*.youtube.com`, `*.googlevideo.com`, `*.googleapis.com`), or test on a real phone in airplane mode.
- a. YT opens its player offline? No. Opening a song while offline gives "Please check your network connection" with "Go to downloads" and "Try again"; YT's queue and browse requests fail (Cronet `ERR_CONNECTION_REFUSED`), and the player request is never sent. So offline in YT's own player means answering YT's own requests (browse/next/player) from saved data, not just feeding the audio.
- b. Request shape: not captured (the player request is never sent offline); needs a capture while online. Open.
- c. Feeding the local file: not tested yet. Open; the biggest remaining unknown.
- d. YT's own offline storage: `files/offline/shared` holds only `offline_settings.schema.pb` on this non-Premium account; nothing to reuse.
- Morphe 2.1.0's offline player: "Go to downloads" opens Morphe's Downloads page (also reachable via intent `GoogleApiActivity` + data `morphe_downloads_intent`). Files: `<externalFilesDir>/Music/Morphe/<videoId>.webm` (same itag 251 Opus as streaming) + `.json` metadata + `.jpg` cover, app-private, not in MediaStore. Playback: its own `OfflinePlaybackService` (`android.media.MediaPlayer` + its own MediaSession "MorpheOfflinePlayback"), its own mini bar and full page (cover, title, seek, shuffle/prev/play/next/repeat, queue). None of YT's player elements, so none of our player patches would show there unless we hook Morphe's page/service too.
- Device files: the code is still in 9.30 (strings "Device files", "Show device files", "Sorry, you can't mix device files and YouTube Music tracks in your queue"), but the signed-in Library shows no entry for it. Not tested signed out (that would sign the account out; ask first). Note the "can't mix" rule: a device-files queue can't hold streamed songs.
- Side find: Morphe's lyrics has an `AppleMusicProvider` (Apple catalog API `amp-api.music.apple.com`); its catalog lookup could be shared with the animated-art feature.

### Batch C finished + leftovers (2026-11-10): offline solved, everything else works
Test patch: `SpikeCPatch.kt` + `SpikeC.java` + `ProtoWire.java` (offline), `SongVersion.java`, `SpikeD.java` + `AppleCanvas.java` + `HlsClip.java` (canvas), `SpikeE.java` (stats), `ClearCanvasCachePreference.java` (settings).
- Offline in YT's own player: works, with YT Music's native download engine (the same offline libraries as YouTube), on a free account.
  - Download: every Download tap goes through Morphe's `DownloadsPatch.onMenuDownload`; we return early and call YT's own save (`azcj.h(videoId, offlineability, logger, metadata)`, impl `lss`), after unlocking the offlineability renderer (`bzij`: offlineable on, dialog removed, PREMIUM_LOCKED → FREE).
  - The download manager comes from the activity's DI component (`iuy.gR.hC()`); the `kcz` resolver is never built for free accounts. Spike hardcodes `iuy`/`gR`; the real patch needs fingerprints.
  - The server answers the offline player request with "Premium required to download" and no formats. We replace that response (hook after the fetch in `azdj`, helper method added there): formats from Morphe's `StreamingDataRequest.fetchRequestForDownload` (VISIONOS etc.), field 58 offlineEligible on each format, offlineState {token, lifetime 365 d, OK}, player config exo flags. Refresh hooks in `aydw.d` / `aysj.g` keep it valid.
  - Proven: saved `files/offline/<id>/streams/3/*.v3.exo` (itag 140 AAC 128k, 3.3 MB for 3:26); with the app's network cut it plays in YT's own player to the end, including a part never streamed; Library → Downloads → "Downloaded songs" plays offline with YT's full UI, Lyrics chip and our overlay; Smart downloads (Premium) is offered.
  - The open items from this round (playlist/album downloads, Morphe's page on top, itag 140, hardcoded names) are closed in the next entry.
- Offline open items, closed (2026-11-10, second round): all work.
  - Format: offering only itag 251 in the replaced response makes the engine save Opus; it plays offline as "Opus · 143 kbps · 2 ch · itag 251". Real feature: 251 by default, 140 as fallback.
  - No hardcoded names for the manager: the patch finds which Dagger switch case builds the save class (`lss` = case 401 of `iux`), which component field keeps its scoped provider (`iuy.gR`) and its getter (`cnhe.hC`), and adds `ayham_offlineManager(component)` to the component class.
  - Album and playlist pages: the page Download button is a Premium upsell with no id in it, so Morphe can't tell which page it belongs to. Our hook at the start of Morphe's `commandResolverOnClick` remembers the last opened page from its browse command (`browseEndpoint` 48687626, browseId field 2, `MPREb_…` / `VL…`). On the upsell it starts Morphe's `PlaylistDownloader` (listing, confirm dialog, notification), and Morphe's `downloadPlaylistTrack` is hooked so each track goes to YT's native save. Tested: album "Dawn FM (Alternate World)", 23 tracks, all 23 saved by YT's engine; the user playlist "automix test" reaches the same dialog (cancelled).
  - Downloads page: in native mode, commands carrying `FEmusic_offline` skip Morphe (its local screen no longer opens on top), so Library → Downloads is YT's own: "Downloaded songs · 24 songs".
  - Restart: force-stop and reopen keeps all songs as "Download complete".
  - Refresh: forced by making `last_refresh_timestamp` 4 days old. The server answered all 23 songs with action 3 "Premium required"; our hook turned each into OK and the songs stayed (new refresh time, not deleted). With the app's network cut, an album track then played to the end in YT's player.
  - Removal: YT's own "Remove download" works per song (24 → 23, file gone) and for the whole "Downloaded songs" list (0 files, 0 rows left).
  - Gaps for the real feature: songs saved this way show in "Downloaded songs" but not as an album/playlist in YT's Downloads (they are saved one by one); Morphe's dialog counts "not downloaded yet" from its own files, not YT's; portrait has no player chips row, so there's no Download chip in the player (song ⋮ menus have none either); Morphe's Litho debug log floods logcat (use `logcat -G 16M` when testing).
- Upstream check, Morphe v2.2.0 (released 2026-11-10; 210 files changed, YTM 9.30.53 still supported, 9.45.51 added as experimental): no conflict with our hooks.
  - Files our hooks sit in: `DownloadsPatch`, `PlaylistDownloader`, `LocalDownloadManager`, `CrossfadePatch` unchanged; `StreamingDataRequest` changed (+145 lines; `addInlinePlayback` renamed `addAppPlayerConfig`, which we don't use), but `setVideoIdResolver`, `fetchRequestForDownload` and `VideoIdResolver` are the same; `setVideoLengthResolver`, `LyricsCache.clear`, `LyricsManager` the same.
  - Patched with 2.2.0: all 55 patches applied, every Spike hook found (no warning). On the emulator: resolvers wrapped, lyric line, stats (Opus 251), chips row moved, crossfade (incoming player seeked to 30 s, speed 1.06), automix analysis (Morphe's Jam queue bridge + stream fetch + native analysis + both ONNX models), song version (`4NRXx6U8ABQ` → `J7p4bzqLvCw`, 3:22), Apple canvas (Anti-Hero), native download, YT's own Downloads page, offline play with the network cut.
  - Found on the way (our gap, same in 2.1.0): the player's own Download button calls Morphe's `startDownload(videoId, external)` directly, not `onMenuDownload`, so it used Morphe's downloader. Fixed by hooking `startDownload` (the one place every in-app download ends); the button now shows YT's own "Downloaded" check.
  - `scripts/patch.ps1` now defaults to `patches-2.2.0.mpp`.
- Albums and playlists as real entries in YT's Downloads (2026-11-11, `playlistRoute=app`): works.
  - On a playlist/album page the Download button sends YT's Premium upsell. We answer it by sending YT's own `offlinePlaylistEndpoint` (73082583: {1 playlistId, 2 ADD, 4 {60572968 {1 offlineable}}}) through YT's command router, which is captured at its dispatch method (`apeq.c(command, Map)`, found as the class whose static step calls Morphe's `commandResolverOnClick`).
  - The re-parse needs `ExtensionRegistryLite.getGeneratedRegistry()`. With the default empty registry, the endpoint lands in unknown fields and nothing handles it.
  - YT's offline-playlist handler (`kcy.c`, found as the caller of Morphe's `offlinePlaylistEndpointOnClick`) gets the endpoint with the Premium dialog removed, so a real tap on an endpoint that carries the dialog works too.
  - YT then fetches each track's offline player response. Our existing replacement swaps its "Premium required" for itag 251.
  - Albums: the page id is `MPREb_…`. The `OLAK5uy_…` playlist id is read from the album page with Morphe's own `PlaylistTracksRequest` (reflection, web client, no account), then saved the same way. If no id is found, it falls back to Morphe's playlist downloader.
  - Tested: "automix test" (6 tracks) → "Download complete", listed as "Playlist • 6 tracks"; "Bow Bow Bow (Remix)" single (`MPREb_NztYzOcQrxA` → `OLAK5uy_lp7…`) → listed as "Single • Download complete", plays with the network cut (Opus 148 kbps, itag 251). Both removed again with YT's own "Remove download"; the Downloads page is empty, with 0 `.exo` files left.
- Parity with the YT Extension (Vivimusic Web+, its full feature list read 2026-11-11). The user wants mostly what it does, plus downloads.
  - Already in Morphe, so nothing to build:
    - lyrics: 26 providers, word sync, romanization, translation, offset, refetch, dynamic background;
    - SponsorBlock (music_offtopic);
    - Last.fm and ListenBrainz scrobbling, with love on like;
    - crossfade on skip and auto-advance;
    - theme and custom font.
  - Ours, tested: Apple animated art, song version instead of music video, stats line, lyric line, offline downloads (songs, albums, playlists), crossfade length, automix analysis.
  - Equalizer, new spike (works): YT Music sends Android's `OPEN_AUDIO_EFFECT_CONTROL_SESSION` for each player.
    - `SpikeEq` (property `eq=bass|vocals|night|room|flat`) attaches `android.media.audiofx.Equalizer` (5 bands; the extension's 3-band presets mapped onto them) plus `PresetReverb` for "room".
    - audio_flinger shows the effect registered and enabled on YT's session. It follows the next track's new session (249 → 257) and is released on close.
  - Tested later the same day (entries below): automix blend v1, settings switches, BitChord screen, Apple artist art and palette.
  - Skipped by the user (2026-11-11): Spotify Canvas, Spotify → YTM playlist transfer, image-only mode, vinyl disc, resource-saver switch.
  - Automix loop mix and AutoDJ v2: tested later the same day (entry below).
  - Web-only, not needed on Android: update checker and announcements (Morphe Manager updates the app), layout-compat mode, mouse-wheel volume, keyboard shortcuts, pill bar, tab icons, localization fallback.
  - Found in the POC run: when the song version replaces a music video, YT stays in video mode, so the animated art stays off for it.
- Automix blend, quick port of the extension's v1 (BitChord `scheduleTransition`) on Morphe's crossfade (2026-11-11, `SpikeF`, `automix=1`): beat-matched blend works; loop mix and AutoDJ v2 in the next entry.
  - Analysis: next track read from Morphe's Jam queue bridge; the outgoing tail and incoming head are downloaded, decoded, run through BitChord's native BPM and Beat This! (ONNX, 60 s). 37–47 s for both songs on the emulator.
  - Planner: incoming tempo octave-matched to the outgoing one; tempo-match only within 0.90–1.25; 32/16 beats (≤ 12 s) or 8; exit = last downbeat before the content end minus a bar and the blend; cue = first downbeat in the first 25 % of the next song. Example: 16 beats = 10.65 s, 90.2 → 93.2 BPM, speed 0.9676, exit 218.70 s, cue 2.78 s.
  - Run: at the exit we skip (media key), Morphe's crossfade fades over our blend length, the incoming player is seeked to cue + elapsed × speed + 260 ms lead and set to the outgoing tempo. Beat offset measured 0–50 ms; bass swap at the midpoint (EQ −12 dB on the incoming lows, then on the outgoing), tempo glided back to 1.0 over 24 s.
  - Rough edges: ExoPlayer position reads jitter ~244 ms while speed ≠ 1.0, so a position servo oscillates (off; the fixed lead works). The EQ has 5 coarse bands, so "filters" are shelf sweeps, not real HP/LP.
  - Conflict: our song-version lookup (0.6–1.5 s) makes Morphe's pending player "stuck IDLE" (2 s limit) and the blend falls back to a plain skip. Real feature: look up the next song's version ahead of time.
  - Superseded for loop mix and v2 by `SpikeL` (next entry): our own audio deck instead of Morphe's crossfade.
- Automix loop mix and AutoDJ v2 (2026-11-11, `SpikeL`, `automixMode=loop|v2`): both work end to end.
  - Engine: BitChord's own native renderer (`libbitchord_loopmix.so`, JNI bound to `com.music.bitchord.playback.loopmix.LoopMixRenderer`): two Signalsmith Stretch decks following beat knots, with gain, 250 Hz shelf and high-pass envelopes (no low-pass). Rendered into our `AudioTrack` (float stereo 48 kHz).
  - Analysis per song: download, decode only the region (outgoing last 70 s, incoming first 90 s), resample to 48 kHz, music end and intro end (native), Beat This! (60 s), vocal mask (open-unmix int8 through BitChord's `VocalSpectrogram` natives, 3 windows of 21 s). 33–38 s per pair; a 10-minute song took 100 s (decoding to its tail is 72 s).
  - Planners ported from the extension's `automix.js`: `planLoopMix` + `loopSchedule` (loops with ≤ 3 % sung and runs ≤ 0.2 s; fold; ramp bars), and plan v2 (content end, vocal re-route of exit/cue, 25 % cue cap, outgoing tempo ramp, filter mix when tempos are far apart; `djShape` envelopes sampled every 25 ms). Loop mode falls back to v2 when a pair has no instrumental bars.
  - Takeover from YT: a patch-level volume gate on `ctb.patch_setVolume` (`SpikeL.gate`) holds YT's players silent; at the takeover the outgoing player is muted and our deck plays; mid-mix we send media-next; YT's incoming player is held silent, aligned to our deck and unmuted at the handover point.
  - Clock: deck mapped to YT's clock from the median of 40 readings (YT position − frames heard). Takeover splice error measured −34 to +122 ms, mostly under 20 ms.
  - Incoming alignment: one seek, wait until the player advances at 1×, median of 40 readings, then damped speed nudges (±8 % max) instead of more seeks. Before: errors swung −759…+602 ms with repeated seeks; now 1–54 ms at handover.
  - Runs: v2 blends on an EDM radio (Avicii "Levels" → next, 126 → 130 BPM, splice +19 ms, handover 1 ms; one with vocal re-route "both sang 99 %, moved to 16 %"). Loop mix on deadmau5 "Strobe" → next: 4-bar loop at 581.6 s into a 2-bar loop at 47.2 s (128.0 / 127.8 BPM, sung 0 % / 0.6 %), 8 bars (15 s), splice +4 ms, handover 28 ms.
  - Loop mix rarely applies: most songs sing over the last minute or the opening (the "automix test" playlist was 83–100 % sung, EDM vocal tracks too), so it falls back to v2. That matches the extension's rules.
  - Fixed on the way: `SpikeL` must be public (`ctb` calls the gate); ExoPlayer is read on main only; one download came back unreadable ("Failed to instantiate extractor"), now retried once.
  - Rough edges: the handover still drifts ±30–50 ms after a nudge (a beat flam at worst); analysis starts late (after the song begins) so short songs may miss it; long songs decode slowly; YT's UI shows the next song only at media-next, mid-mix.
- Settings, one switch per feature (2026-11-11): works. `SpikeAPatch` adds a category "Ayham features (spike)" at the top of Morphe's settings with 7 `SwitchPreference`s (`ayham_canvas`, `ayham_autoSong`, `ayham_native`, `ayham_eq`, `ayham_automix`, `ayham_stats`, `ayham_lyricLine`); they persist in Morphe's own `morphe_prefs` and overlay `spike.properties`. EQ and stats obeyed live; canvas needs an app restart.
- BitChord-style now-playing screen (2026-11-11, `SpikeG`, `ui=bitchord`): works.
  - YT's title row, time bar and controls stay in the tree at alpha 0; our panel sits under the art in BitChord's order: codec line, title/artist + ⋯, lyric line, seek bar with times, shuffle/prev/play/next/repeat, volume slider + output device ("This phone"; tapping it opens YT's cast picker). YT's real chips row (like, dislike, Lyrics, comments, Save, Share, Download) is drawn under the panel.
  - Our buttons click YT's hidden real views (`performClick`), so the ⋯ menu is YT's own (with Morphe's items), and shuffle/repeat/next/prev/play are YT's logic. Tested: play/pause, next, prev, repeat, ⋯ menu, seek (to 1:25, lyrics followed), volume (stream 3 → 8 of 15), collapse hides the panel.
  - Time: YT's time bar is a custom view (`MusicPlaybackControlsTimeBar`); the length is read from its accessibility text ("… of 2 minutes 14 seconds"), the position from the player, seek through our `ayham_seekTo`.
  - Rough edges: icons are text glyphs (the ⏸ draws as an emoji); `bringToFront` in a pre-draw listener relayouts every frame (removed; z by `translationZ`).
- Apple artist art and palette (2026-11-11, `SpikeH`, `artistArt=1`): works.
  - Same source as the extension (from BitChord): iTunes search (`entity=musicArtist`, exact-name match) → the artist's music.apple.com page → `serialized-server-data` JSON → header's `artwork` (or `colorBackdropArtwork`): url template, `bgColor`, `textColor1`. First artist of "A, B & C" is used.
  - Applied: a backdrop of ours at index 0 of the player page (palette background + hero photo fading into it, visible around the art); the BitChord panel takes the background, and its text, seek and volume bars take the accent.
  - Tested: The Weeknd (#efebf2 / #070504), Isabel LaRosa (#2f4e7a / #d7dff8), Selena Gomez, Neoni; 1.0–1.6 s per artist, cached per artist after that.
- POC build (2026-11-11), `work/out/ytm-patched.apk`, set by `spike.properties`: `fadeMs=8000 native=1 offlineAudio=251 playlistRoute=app canvas=1 canvasApple=1 autoSong=1 eq=bass`. The overlay now shows the stats line and the current lyric line.
- Device files: shows offline while signed in (chips "Downloads" and "Device files"), lists MediaStore audio and plays it in YT's player. Online the chip is hidden in Home but Library has "Show device file tracks". No clone APK was needed. Not needed for offline any more.
- Song version, automatic: oEmbed title → ANDROID_MUSIC search → best ATV match, swapped only when the current item is OMV (unknown types are left alone). `4NRXx6U8ABQ` → `J7p4bzqLvCw` in 1.16 s; UI shows the song's 3:22 and art (Morphe's length resolver wrapped, length from WEB_REMIX `next`). Unauthenticated `next` has no "counterpart" field, so search stays the way.
- Rough edges: overlay hidden when collapsed, shown when expanded (page position tracked). Chips row moved by translationY: ~20 resets per skip/scroll/back, all re-applied before the frame is drawn (pre-draw listener); 325 recorded frames, no visible jump. In video mode YT's video pager draws over our overlay (z-order to fix). Speed conflict understood: Morphe's `overridePlaybackSpeed` wins when its speed isn't 1.0, so automix applies tempo × user speed through the unhooked call. Kotlin stdlib dropped from the extension (2.45 MB → 173 KB dex), ONNX + analysis still work.
- Animated art, simple canvas (no Kawarp): works, except the Apple lookup was not run here.
  - A `TextureView` + muted looping `MediaPlayer` added over YT's `player_thumbnail` (same parent, same size/position, center-crop), song read from the player page's visible title/artist, paused when collapsed, resumed when expanded, switched on skip.
  - MediaPlayer can't play fMP4 HLS (error -1007), and Apple's clips are fMP4. Fix without ExoPlayer: `HlsClip` downloads the H.264 variant's init + segments (up to 40 s) into one cached .mp4, which MediaPlayer loops fine. Tested with Apple's public fMP4 sample: first frame 3.1 s after the song change (download included), 0.2 s from cache. Portrait: the art is full width there and YT's own gradient fades the clip into the title.
  - `AppleCanvas` is BitChord's token scrape + search + scoring ported to Java, switched by `canvasApple=1`; not run in this session (the agent's tool refused calling Apple's API with a scraped token), so matching still needs a run by the user.
  - Checked against the YT Music Extension's `apple-canvas.js`: same browse page, script regex, Origin/Referer, search (`types=songs`, `include=albums`, `extend=editorialVideo`) and motion keys. Two fixes taken from it: token chosen by kid `WebPlayKid` or iss `AMPWebPlay`, else any unexpired one; an empty search result returns "no canvas" instead of throwing.
  - Run on the emulator (2026-11-10, user's go-ahead): works. Token scraped (268 chars), search and match right every time (score 25). "A Lonely Night" (Starboy) and "BIRDS OF A FEATHER" (HIT ME HARD AND SOFT): those albums have no `editorialVideo` on Apple, so no clip, correctly. "Anti-Hero" (Midnights): motion art found, 8 segments / 23 s / 10.5 MB in 0.9 s, whole lookup 1.4 s, MediaPlayer prepared in 59 ms, the clip plays over YT's art.
  - Correction: the portrait player does show the chips row (with Download) on this song; it was missing on the earlier songs, so the row depends on the song.
  - Done in the finishing pass (below): variant by view size, debounce of song changes, cache cap.
- Stats for nerds, line 1: works. Capture YT's player (`ctb`) at the end of its constructor, find the audio Format (`cdr`, toString "Format(...)") by walking fields once (path `ctb.g → cto.y → cpy.c → dbo.l`, 5 ms), then reuse the path: "Opus · 192 kbps · 2 ch · itag 251". Sample rate is -1 in that Format (Opus is 48 kHz anyway).
- Settings: works. Our finalize can add rows to Morphe's own settings XML (`res/xml/morphe_prefs*.xml`); a custom `android.preference.Preference` from our extension shows in Morphe's settings screen ("Clear animated art cache", size, tap clears: freed 39.1 MB). Morphe's lyrics cache clear is `LyricsCache.clear()` (public static, returns bytes).
- Automix, full build (2026-11-11, package `automix`, replaces `SpikeF`/`SpikeL`): both versions as in the YT Music Extension, all mix styles tested end to end on the emulator.
  - Settings ("Automix" category in Morphe's settings): on/off switch; "Automix version" Original AutoDJ (v1) / Advanced AutoDJ (v2); "Shorter blend when keys clash" (v2 only, greyed under Original); "Blend length" Auto / up to 4, 8, 16, 32 bars; "Saved song analyses" (count + size, tap clears). Prefs `ayham_automix_enabled|version|key_aware|bars`. All rows tested: values saved, the key row and the dependants grey out correctly, Clear empties the analyses, off stops planning and drops queued analyses.
  - Planner: a Java port of the extension's `automix.js` (v1 + v2 plan, loop mix plan and schedule), checked against the JS on 6,250 random cases with 0 mismatches. Loop mix is tried first for each pair and used when found; otherwise blend / filter mix; pairs it can't beatmatch go to Morphe's crossfade.
  - Analysis: one download + decode per song (Beat This! on the first and last 59 s, the native analyser for key and fallback grid, the vocal mask on 5 windows); about 30 s per song on the emulator. Kept in `files/automix/analysis` (JSON) and `cache/automix/pcm` (head 150 s + tail 120 s, last 4 songs). Models ship in the APK (`assets/automix`) and are copied on first use.
  - Engine: our own AudioTrack plays both decks from the decoded audio (gain, low/high shelves, high/low pass per the extension's curves) while YT's players are held silent; YT's next player is seeked and speed-nudged onto the incoming deck, then handed over.
  - Tested runs: loop mix (Strobe → next, splice −4 ms; Levels → next), v2 blend (splice 0 ms, alignment within ~50 ms through the tempo glide), v1 filter mix (0 ms), v1 16-bar blend with the playing song sped up to x1.082, pause during a mix (stops at once, YT plays on), skip during a mix (aborts cleanly), the queue changing the next song mid-mix (deck fades out, the new song plays).
  - Fixed during the tests: forced handover blocked by a running nudge; a jump of YT's position taken as seek latency; the deck clock locked on loose readings right after a seek (now waits for IQR ≤ 40 ms and re-checks until the takeover); loop mix not retried when the song's decoded audio was being restored.
  - Key: the extension takes key and confidence from essentia's KeyExtractor (whole song; confidence = the profile correlation `strength`, ~0.5–0.9; the clash rule needs ≥ 0.5 on both). BitChord's native analyser gives only a best-to-second gap (0.001–0.08) and was a semitone off on "Levels" (C minor for C♯ minor). Now `KeyStrength.java` finds the key the extension's way: whole-song chroma (8192-sample FFT, 55 Hz–5 kHz), Pearson correlation with the 24 Krumhansl profiles, best key + its correlation (analysis version `ayham.2`, older saves are redone). Native key only as a fallback with confidence 0. Tested: strengths 0.39–0.67, Levels → C♯ minor, and the clash rule fired on Strobe → next ("keys clash (F♯ major → D major), short blend"). Not identical to essentia (HPCP + `bgate` profile), so a borderline song can land on the other side of 0.5.
  - Sung parts from synced lyrics (as the extension: lyrics first, vocal mask only as the fallback): `SungLyrics.java` asks Morphe's own lyrics providers (user's order, title/artist/length, only high-match synced results, video-id-keyed providers skipped) and turns the lines into spans the extension's way (`sungSpansFromLines`: 0.15 s lead, 0.35 s tail, no end = until the next line, at most 10 s). Kept in `files/automix/lyrics`, cleared with the analyses. Before this the vocal mask alone rejected the loop on Vaina Loca → SI NO ES CONTIGO; with lyrics our plan is the extension's exactly (4-bar loop at 153.31 s, 94 BPM, into a 4-bar loop at 9.60 s, 100 BPM, ramp 3 bars, 12 bars, YT moves on at 13.99 s, handover from 34.44 s).
  - YT's clock on some streams (Vaina Loca's Opus) moves only every ~250 ms and holds in between, so a median of plain readings sat ~120 ms late (splice −113 / −126 ms). The deck clock and the alignment now count only fresh readings (the position just moved): 5 fresh of ~160 tries, IQR 1.7 ms.
  - The incoming player is aligned to where the deck will be after its loop lets go (the extension's `trackAt(tk − 1.5)`), not round the loop (it was re-seeked by the loop's 9.6 s). Nudges are up to 8 % for at most 1 s (the player is silent), so the handover lands at the extension's point. Final run of the pair: takeover splice +0 ms, handover at mix 34.432 s (extension 34.44 s) with YT +14 ms off the deck (both measured from the last fresh reading).
  - Level: YT's loudness normalisation goes through `ExoPlayer.setVolume` (`avmo.O` → `ExoPlayer.E(avgn.f)`, the config Morphe's "Disable DRC audio" nulls), so the gate already sees it; each deck now plays at its player's requested volume (the incoming one from when YT's next player appears, gliding ~0.3 s), so takeover and handover splice at YT's level. Both songs of the test pair were at 1.000 (the AudioTrack showed 0 dB too).
  - Not like the extension: manual skips are left to Morphe, music videos are not detected. (The seek-bar mix zone and the held lyric line came in the finishing pass.)

### Finishing pass (2026-11-11 evening): spike code made into the features, all tested on the emulator
- Settings drive everything now: the "Ayham features" category in Morphe's settings (BitChord player screen, Artist colours, Animated art + "Clear animated art cache", Lyric line, Stats lines, Always play the song version, YT Music's own downloads, Equalizer + preset). `spike.properties` is only a developer override on top, and was removed from the emulator. Every switch applies live, no restart:
  - BitChord screen off gives YT's own screen back at once, on brings the panel back;
  - Equalizer preset change re-applies to the playing session and automix's decks ("1 sessions now on 'vocals'"), off → on re-attaches the playing session (a bug found and fixed here: switching off forgot the open session);
  - Animated art off drops the clip and shows YT's art.
- BitChord panel:
  - the controls wear YT's own icons, copied from YT's buttons (the visible `playback_control_icon` inside shuffle/repeat), play/pause from the framework icons because YT's is an animated morph whose copy restarts at "play";
  - second info line: "Automix · 94 BPM · F♯ major · grid 1.00 → next 100 BPM · C minor · grid 1.00 · mixing (loop)";
  - mix zone on the seek bar from the takeover to the end, pulsing while the mix runs;
  - the lyric line holds the looped line while a loop mix holds the song;
  - tapping the lyric line opens YT's Lyrics sheet; the panel hides while any of YT's sheets (Up next / Lyrics / Related) is open, and returns when it closes;
  - a new activity or player page rebuilds the panel; one refresh loop per panel.
  - Bug found and fixed: the mix zone measured to full height and pushed the seek bar, controls and volume off screen.
- Automix with the EQ: the decks get the same preset; tested again on Vaina Loca → SI NO ES CONTIGO: takeover −3 ms, handover at mix 34.444 s +2 ms, deck effects released after.
- Animated art:
  - variant by the art's size (smallest H.264 variant that covers it, 360p / 720p / 1080p; the 1360 px art takes 1080x1080);
  - a song must stay 0.7 s before its lookup (YT's "Starboy" → "Starboy (feat. Daft Punk)": the first is skipped before lookup);
  - cache capped at 80 MB, least recently shown first;
  - fixed: a clip paused before its first frame never resumed (resume now keys on "prepared").
- Song version:
  - the queue's next video is looked up in the background as soon as it is known ("looking ahead at g5qU7p7yOY8 → uvXtC13GlxQ"); the resolver waits for a lookup in flight instead of asking twice;
  - the video-mode problem is solved: when the playing video was swapped for its song and YT still shows the (black) video page, YT's own song/video toggle is clicked once for that video. Tested on "Anti-Hero (Official Music Video)": switched to song mode 2 s in, position kept, motion art playing. Tapping back to video is left alone.
- Offline downloads: tested again (a playlist download, 6 songs, 18 MB): each declined offline response replaced with itag 251; the itag 140 fallback is in place for songs without 251. Download removed afterwards.
- (Later the same evening) the overlay used when the BitChord screen is off shows the automix line too, and is restyled: small white text with a shadow on the art's lower edge, no coloured boxes.

### Player screen redone + plan leftovers (2026-11-11 night)
- The BitChord panel above was wrong: it hid YT's views (alpha 0) and drew copies. Redone from BitChord's phone layout (NowPlayingScreen.kt / PlayerControls.kt, default settings) with YT's own views:
  - YT's title row, seek bar + controls and chips row are the real views, only drawn lower with translationY in BitChord's order: art | title | lyric line | seek bar + controls | volume | chips | output device. Their own translation is kept and given back when the player collapses or is dragged, a sheet starts to rise (not only once the art has shrunk), or the switch goes off. Nothing of YT's is hidden.
  - Ours fills the gaps only: the artwork mesh behind the page (BitChord's ArtworkMeshBackdrop: 6×6 averaged grid, saturation ×1.12, flipped so the art's last row meets the seam, 32×32 blurred, floor #121212, 900 ms crossfade, dark gradient; plus a lightness cap of 0.42 of ours, because plain white text has no blend modes to stay readable), stats on the art's lower edge, lyric line (16 sp semibold white 78 %, chevron, opens YT's Lyrics), volume row (BitChord ThinSlider: capsule, no thumb, 6 → 10 dp while dragged), automix band on YT's seek bar (white 50 %, soft start, pulses while mixing), output device line (11 sp, white 55 %, opens YT's cast picker; dropped on short screens).
  - Title white, artist white 55 %, as in BitChord. The Apple palette (artist colours) no longer tints anything.
  - Tested: Flowers playing and paused, the Queue sheet opening and closing, video mode. Known: YT's seek bar moves once a second (YT's own update rate); smoothing it is left for later.
- Square cover for swapped videos: the song's own thumbnail (maxres → sd → hq), dark bars trimmed, centre square, drawn over YT's art (YT's stays underneath, the animated art above). Tested: Flowers (Official Video) → its song's 720×720 cover.
- Animated art cache rules: lookups saved in the app's files for 24 h, misses included, errors not; a saved clip whose file is still there plays even after 24 h and with no network. The Apple token has a backup copy (used after a restart until it expires; a 401 drops it and scrapes again).
- Full offline: when YT's native download saves a song, its lyrics (Morphe's providers in the user's order, stored in Morphe's own lyrics store under the track key its player uses) and its animated art clip (app files, no cap, saved against the video id) are saved with it. Tested on SI NO ES CONTIGO: "lyrics saved from QQProvider", no motion art for that album; download removed afterwards. The stats line shows "Offline" when there is no validated network (with or without the stats switch). Not tested: playback with the network actually off (that needs the emulator's network switched off).
  - Limits: automix offline falls back to Morphe's crossfade unless the songs' decoded PCM is still cached (last 4 songs); a downloaded music video plays as itself offline (the song-version lookup needs the network), so it gets no square cover; YT's own chips stay as YT shows them offline.
- Automix: music videos are detected from the song-version lookup's video type (OMV, not swapped) and get no loop mix, as in the extension. Manual skips stay with Morphe's crossfade, which is what the extension's manual-skip fade does too.
- Safety: a feature whose hook throws 5 times is switched off until the app restarts (BitChord screen, animated art, square cover so far), logged, with one toast.
- Clear lyrics cache: Morphe's own "Clear lyrics cache" row in its Lyrics settings already does it (LyricsClearCachePreference); ours would only duplicate it.
- Token watcher: see the next section.

### Offline tested with the network off, fixes, token watcher (2026-11-11 late)
- Fixed: the Apple artist backdrop (SpikeH, `artistArt`) stayed on the player page when it shrank to the mini player, so the artist photo and its palette colour sat behind YT's white mini-player text (unreadable on light palettes, e.g. Bow Bow Bow). It now fades with the page like the mesh. Its tick is also under the 5-failures safety switch.
- Offline test tool: `scripts/emu_net.py`. On LDPlayer, airplane mode also cuts adb's shell until the network is back, so offline tests run as a script on the emulator: `python scripts/emu_net.py run TEST.sh --minutes 3` starts it under an on-device watchdog (network back on after N minutes whatever happens), checks every 10 s with a hard limit, then stops the watchdog and the script and pulls `/sdcard/offtest`. Tested: a normal script (back online in ~30 s) and a hanging one (the watchdog brought it back at 60 s).
- Tested with airplane mode on and a cold start: YT's "No connection" prompt → Downloads → the downloaded playlist → Starboy and Bow Bow Bow played (Opus 251, "Offline" in the stats line, synced lyrics from the copy saved at download time, automix stats from the saved analysis, mesh from the art, the saved "no clip" lookup for the animated art), mini player fine, no crash.
- Fixed from that test: with YT's restored queue offline (empty title, nothing playing) the lyric line showed Morphe's last line from an earlier song; it is now empty when YT's title is. Automix's loop-mix retry asks every 30 s offline instead of every 5 s.
- Download unlock: in one playlist download, 2 of 6 songs stayed "Premium required to download" (YT then stores "This video requires payment", and its Retry doesn't ask again; only removing and re-downloading does). A second run of the same playlist saved all 6. The stream fetch for the replaced response is now tried 3 times (1.5 s, 3 s apart) before giving up.
- Token watcher: `watcher/apple_token_watch.py` (stdlib Python) + `.github/workflows/apple-token-watch.yml` (daily 06:17 UTC, and by hand). It scrapes the web player token the way `AppleCanvas` does, searches a probe song (Anti-Hero, Midnights) and loads its motion-art HLS playlist, and compares the latest commit of the scrape code in BitChord (`AppleMusicCanvas.kt`) with `watcher/upstream.json` (the extension's `src/apple-canvas.js` was dropped from the watch on 2026-11-18: it is plain upstream code now). A failure opens one issue ("Apple token watch failed"); later failures comment on it. After reviewing an upstream change: `python watcher/apple_token_watch.py --accept` and commit `upstream.json`. Tested locally: all good, and a simulated upstream change fails as it should. Needs the project pushed to a GitHub repository to run (git initialised locally, no commit yet).

- Audit fixes (same night):
  - SongVersion skips lookups offline and for 2 min after a failure.
  - Analyzer: a too-long song isn't re-downloaded.
  - SpikeCover asks again after 30 s with no cover.
  - SpikeH: the backdrop is removed when switched off, and band names with "," or "&" are tried whole first.
  - HlsClip: temp file per thread. Engine: `selfCall` is volatile. SungLyrics checks for a missing file at most every 5 s.
  - emu_net: kill order, watchdog check, and a 20 s timeout on `adb devices`.
  - Automix band: drawn from the player's own length, so it doesn't depend on English text.
  - YT's title and artist colours come back when the BitChord screen is switched off.
  - Tests: JVM 75/75, Python 42/42. On the emulator: playback, song change and collapse OK.
- Repo public at github.com/ayhamo/ytmusic-patches (first commit 9546bec). Morphe source link: `https://morphe.software/add-source?github=ayhamo/ytmusic-patches`. Not used yet: the Release workflow (by hand) has to run first. The work since 9546bec isn't committed.
- GitHub's secret-scanning alert for `AIzaSyAOgh…` in SongVersion.java is a false positive: it's YouTube Music's public app key, also in the YT APK and in Morphe's source. Close the alert as false positive.

## 1. Lyric line above the seek bar
- Shows the current line from Morphe's lyrics (`LyricsManager.getInstance().getCurrentLineText()`). Needs Morphe's "Third-party lyrics" on.
- Tapping it opens YT Music's lyrics tab (Morphe's providers).

## 2. Animated art (simple canvas, no Kawarp)
- BitChord's simple canvas: the Apple motion clip, muted and looping, drawn over YT's own album art; YT's still art stays underneath. No Kawarp (too heavy for the phone).
- Ports BitChord `AppleMusicCanvas.kt` (token scrape, search, matching). Player: Android `MediaPlayer` on a `TextureView`, fed a cached .mp4 built from the HLS clip (see spike results); no ExoPlayer in the extension.
- Square clip on the square art; in portrait YT's art is full width, so the tall 3:4 clip may fit better there (to try).
- Cache:
  - lookups per song/artist/album/region, 24 h, misses included, errors not;
  - a miss reached before the album is known gets retried;
  - Apple token with a backup copy, re-scraped on 401;
  - clips as files in the app cache, size cap adjustable, cleared from settings.
- Token watcher: daily GitHub Action tests the scrape and opens an issue on failure; also watch the scrape code in BitChord and the extension.

## 3. Automix (BitChord engine, on top of Morphe's crossfade)
- Built 2026-11-11 (see the spike results): the extension's two versions (Original / Advanced AutoDJ), loop mix, blend and filter mix, with settings.
- Analyse each song from its start, from the downloaded audio. The next track's head is analysed as soon as it's known.
- Tiers: loop mix → beat-matched blend / filter mix → Morphe's crossfade while analysis isn't ready.
- DJ filters are done in our own deck player, not through a shared audio hook.
- Abort list from the extension:
  - ads, pause, seek, skip;
  - song/video pairing;
  - late autoplay queue;
  - short tracks.
- Fixed 2026-11-12, "the mix doesn't happen":
  - **Cause:** the queue is read every ~1.5 s. Right after our engine moved YT on, that read still named the outgoing song. The engine took this as "the queue played another song" and dropped a 34 s loop mix into a 1.5 s crossfade from the new song's start. It now waits for the queue to catch up.
  - **Tested:** Dusk Till Dawn → Starboy loop mix. Takeover at 3:41, YT moved on at 13.4 s, handover at 28.4 s, done. Starboy plays on from 0:23 (the decks played its opening).
  - **Mix lengths, as BitChord and the extension have them:** the loop mix is set by bars (4 enter + tempo-ramp bars + 2, rounded to the loop; about 30 s). A blend or filter mix is 16 beats (doubled when both sides are calm), capped at 12 s (8 s filter), so about 10 s is right for those. The crossfade fallback is 12 s.
  - **"Original AutoDJ" / "Advanced AutoDJ":** the YT extension's names. Original is its port of BitChord web's AutoDJ; Advanced adds the BitChord phone app's ideas.
- The seek bar during a mix (the extension's "flashing", crossfade.js stepPulse):
  - YT's seek bar is hidden. A white fill grows from the takeover point to the bar's end and pulses on the mix's beats, following the tempo ramp: brightness (0.5 + 0.5 cos 2πφ)², resting at 0.1.
  - With no beat grid (a crossfade) it breathes every 1.8 s.
  - The band stays after YT has moved on to the next song, and YT's bar comes back at the handover.
  - Tested on the emulator.
- Stats for nerds, as BitChord's (PlayerControls SleeveNerdStats + CrossfadeController describeAutomix):
  - Line 1, white 65 %: codec · sample rate (when YT gives one) · kbps · Mono/Stereo. No itag.
  - Line 2, white 50 %, up to 2 lines: the mix running ("looping" / "letting go" + the loop), else the one planned ("loop mix in N s · out 8-bar, clear by lyrics · in 4-bar, clear by mask · 94 → 100 BPM over 3 bars", "filter mix in N s · 4 bars · reason", "mixing in N s · 8 bars · next at 1.034×", "crossfading in N s · 12 s", each with "no loop: why"), else "this song: analysed (94 BPM F# major, dsp grid 0.82) · next: analysing…".
  - Centred, 11 sp medium, black 55 % shadow. Tested on the emulator through a Dusk Till Dawn → Starboy loop mix.
- The lyric strip is never blank (BitChord shows the line due, or its ♪ note): once Morphe's line is 60 ms past its end and Morphe still names it, the line at the playhead is shown instead (♪ Instrumental in a gap). A second refresh runs right when that is due, not at the next 500 ms poll.
  - Lines sharing a start time (a sung line and its ad-lib, "Bounce on the stage..." and "back it up" at 45.55 s in Bow Bow Bow): the line ends at the next line that starts later, and the first of them is the one at the playhead (Morphe shows that one). Before, such a line lasted 0 ms and was drawn faded out: only the chevron showed.
  - Repeated lines ("Bow (work out, work out)" several times): the copy matched is the one running now, else the next to start (Morphe names a line a moment early), else the last one past; and the line is found again once the playhead passes its end. Before, the earlier ended copy was matched and the line drew faded out.
  - Checked on Bow Bow Bow, 40 samples from 0:41: only the instant of a line's fade-out shows no words, as in BitChord.
- During a mix, between YT moving on and the handover, the incoming song plays on our deck while YT's player is held, so Morphe's clock (and its line) is not where the singing is. The strip then takes the incoming song's line at our deck's position (`Automix.incomingHeardMs`), only once Morphe's lyrics are that song's (`lyricsVideoId` equals the mix's incoming id). Before, it showed the intro phrase ("Cue the vocals") over the singing. Tested Starboy → Bow Bow Bow.
- The mix bar, as BitChord's PlayerScrubber: when a mix starts YT's bar is hidden, our fill sweeps from where the song was to the bar's end in 700 ms (FastOutSlowIn), then holds full width for the whole blend, white at 0.92 × the beat pulse (0.1 between beats, 1 on one; the pulse fades in over 900 ms), on a white 26 % track. "Mixing" is white 85 % × cover × (0.5 + 0.5 × pulse). Before, the fill grew with the mix's progress and read as the song's progress carrying on. YT's screen moves to the next song mid-mix, as BitChord (HANDOFF_AT 0.5) and the YT Extension do.
- Open, found while testing: Morphe's lookup sometimes ends "not found" for the incoming song after an automix switch, though its lyrics are cached (Starboy, about 2 handovers in 5). Its forced reload (`reloadAfterSettingsChange`) ran and still ended "not found", so it was rolled back; the cause is inside Morphe's matching, which logs no reason. Also open: right after a cold start, the first mix can fall back to Morphe's crossfade ("mix not built: decoded audio missing") while the queue ahead is still being analysed. Wrong-language lyrics (Chinese lyrics on "i don't need ur love") come from Morphe's provider match; BitChord has no language check either.
- Mix level (2026-11-24): while both songs sound, a soft limiter holds the sum under -1 dBFS (5 ms lookahead, ~100 ms release). Each deck is held to ±1 after its filters, before its level, so a lone deck peaks where YT's player would. A plain blend (Poker Face, 4 bars at 119 BPM) lowered 1.1 dB at most.
  - Accepted: a few samples touch full scale for about 60 ms at the takeover, while YT's ramp and our deck overlap; a fade would risk a dip.

## 4. BitChord-style now-playing UI
Every element YT Music's player has, laid out and styled like BitChord. Nothing YT Music has is dropped, and nothing BitChord-only is added unless it's useful here.
- Rule: YT's own interactive views (chips, ⋯ menu, Song/Video switch, shuffle, repeat, crossfade controls) are the real YT views, moved and restyled, not copies. That way Morphe's patches (hide buttons, Return YouTube Dislike, flyout menu filters, crossfade) still control them.
- Our own drawn pieces, driven through YT Music's MediaSession (platform API):
  - animated art over YT's art;
  - codec line + automix status line;
  - title/artist;
  - lyric line (tap opens YT's lyrics tab);
  - BitChord seek bar with the crossfade/automix animation;
  - big controls;
  - volume slider.
- Layout, top to bottom:
  - art;
  - info lines;
  - title/artist with YT's ⋯ menu;
  - lyric line;
  - seek bar;
  - controls (with YT's shuffle/repeat);
  - volume slider;
  - output device name, with the cast button folded into that area;
  - YT's chips row (like, dislike, comments, share, save) underneath.
- Not taken from BitChord:
  - ★ (YT's like/save chips do that);
  - the decoder/audio-pipeline button;
  - the lyrics and queue buttons (YT's swipe-up tabs already open Up next / Lyrics / Related);
  - the floating pill bar.
- Song/Video switch and the swipe-up tabs stay where YT puts them.

### Apple Music-style player (asked 2026-11-11, built 2026-11-12)
The user's Apple Music screenshots and BitChord's "Fullscreen cover art" and "Animated covers" settings. Ignore "Backdrop videos". This replaces the "Not taken from BitChord" list above (★, lyrics/queue buttons) for the BitChord screen.

Built:
- **Settings:** "Fullscreen cover art" (`ayham_fullArt`, on by default), and "Animated art" renamed to "Animated covers" (`ayham_canvas`). Both switches are also in the player's … menu (`Features.setSwitch`, same pref).
- **`FullArt`** (called from `PlayerScreen.tick`):
  - Scales YT's `player_view_pager_container` about (0,0), so the card (`watch_fragment_container`) fills the width from y = 0. The animated cover inside it scales along.
  - Fades the lower 42 % with a RenderEffect DST_IN smootherstep mask (API 31+).
  - Morphs over 420 ms. It's up while the position moves or a clip shows; after 1 s paused with no clip it goes back to the card. Portrait and a square card only.
  - YT's top bar gets +100 Z, and so does its layer (`player_page_bottom_layer`) relative to the card: Z orders only siblings, so the grown card (a CardView with elevation) would otherwise take the top bar's taps.
  - Everything is given back per value: a translation or scale YT set itself while we held the view stays YT's; the rest goes back, pivot reset if it wasn't set.
- **Title row:** ★ (clicks YT's like chip; lit from YT's media session: its like action's icon is `yt_fill_…thumb_up` when liked, `yt_outline_…` when not; the chip itself has no selected state) and … (PopupMenu with the two switches and "More options", which opens YT's own menu), with 34dp discs. The title and artist get a max width so they end before the ★ (given back). Not the row's end padding: YT re-sets it on every layout, which made the page lay out again on every frame (~60 layout passes a second, found by bisecting `tick`).
- **Under the volume:** YT's whole chips row (like, dislike, Lyrics, comments, Save, Share, Download). No buttons of ours: YT's Lyrics chip and swipe-up sheet cover lyrics and the queue, and YT's cast button is in its top bar.
- **Lyric line position:** centred in the room between the title row and the seek bar.
- **Lyric line:** filled word by word when Morphe's chosen lyrics carry word timings (`LyricTiming` reads `LyricsManager.currentLyrics`, `state` and `getPositionMs()`; `LyricWords` is the pure maths). Redrawn 25×/s only while a timed line is being sung or fading (BitChord redraws its sung line every frame); line-only providers (KuGou, LRCLIB, NetEase) stay plain.
- **Lyric line, BitChord's strip** (from BitChord's `PlayerLyrics.kt`, 2026-11-12):
  - 16sp W600, letter spacing 0.05sp, all white: a line at 78 %, its unsung part at 55 % of that, the sung part clipped on top;
  - each line fades out over the last 28 % of its time (160–700 ms) before the next starts; an empty line under 2.5 s counts as a breath;
  - a new line slides up from +35 % of its height while the old one fades up to −35 % (340 ms, FastOutSlowIn);
  - the intro ("Warming up", …, one per song) and instrumental gaps ("Instrumental") with a 16dp note at 50 %; plain lyrics show a note and "Lyrics";
  - loading ("Getting the lyrics", …) at 55 %; "Lyrics not available" at 55 %, held 5 s, faded over 900 ms;
  - a 14dp chevron at 50 % right after the words whenever there are lyrics; only then the row is tappable;
  - the next line is read the moment the old one ends (not at the next 500 ms poll).
  - Tested: loading line, intro, word fill, slide and fade on dandelion; 0 layout passes in 5 s paused or playing.
- **Lyrics provider (why Midnight Sun varies):** Morphe asks providers in its source order (first 4 at once, the rest after 2 s) and, with "word sync" on (default), waits up to 5 s for a word-timed result before settling for line timing. Its default order has the word-timed LrcRed, BiniLyrics, Unison, Musixmatch, Lyricify and AMLL switched off; Apple and QQ are the word-timed sources that are on. When they don't answer within 5 s, NetEase's line timing wins. Turning on LrcRed/BiniLyrics in Morphe's lyrics sources (as BitChord and the YT extension do first) should make word timing the usual case. Neither BitChord nor the extension swaps lyrics once shown.
- **Fullscreen cover on pause:** same rule as BitChord's `rememberForkArtAwake`: fullscreen while playing (buffering counts), back to the card 1 s after a pause, kept fullscreen while an animated cover plays, 420 ms FastOutSlowIn morph.
- **BitChord's card (copied from its code, 2026-11-12):** we now lay out the card ourselves in song mode, with full-screen cover on or off.
  - The card is the screen width less a 30dp gutter on each side, at most 560dp, centred at YT's card top. On the emulator that's 1120 px where YT's was 1360 px, and the column needs less room on a short screen.
  - When paused the card scales to 0.86 (963 px, BitChord's is 964). It starts at the tap and uses BitChord's spring (damping 0.75, stiffness 200). A song with a clip never shrinks.
  - The column starts below the card's box, so the title row stays put (y=1561) while the banner comes and goes and the card shrinks. The mesh seam and the stats line follow the drawn art.
  - Lyrics on pause: Morphe's lyric clock runs on until YT's session reports the pause (about 1 s). The line used to jump to the next one and back. Now the tap holds the line and its fill until play resumes; a seek lets go.
  - Tested on the emulator: SI NO ES CONTIGO paused and playing (banner holds 1 s, 0.4 s morph into the 0.86 card), Anti-Hero with its clip (frozen 57 ms after the tap, stays fullscreen), lyric line steady through the pause, 0 layout passes in 6 s playing.
- **Seek bar:** YT's own (not redrawn by us). BitChord's is a thumbless 7dp capsule (12dp while dragging, 34dp touch area), played 92 %, unplayed 26 %, elapsed / "-remaining" 12sp W600 at 55 %, position polled every 500 ms only while playing and visible. Not copied: it would mean replacing YT's view.
- **Review fixes:**
  - ID lookups are cached;
  - the like state is checked in the 500 ms refresh;
  - the mesh redraws when the seam moves;
  - the mesh's art copy follows the banner's scale and skips the faded part;
  - the card offset subtracts the pager's scroll.

Not done (later, if wanted):
- "-m:ss" remaining time;
- the tall 3:4 motion clip filling the banner;
- a status-bar scrim;
- the banner shrinks straight back (no morph) when a sheet opens.
- Fixed 2026-11-12, dragging the page down: a drag of a few dp used to give YT its layout back, so the art snapped to YT's card and back on every small drag (the user's recording). Our layout, banner included, now slides down with the page; YT's comes back only near the mini player.

Emulator findings (2026-11-12):
- In YT 9.30 the art card (`watch_fragment_container`, a CardView) is its own layer in `player_page`, drawn over an empty `player_view_pager_container`. FullArt moves the card itself; it only falls back to the pager (and a shape search inside it) for layouts that keep the card inside.
- Playing = our player's position or YT's `time_bar` progress moved in the last second. Our captured player alone was not enough.
- The card holds YT's video SurfaceView. Its hole in the window showed black through the fade, so it is hidden while the banner is up (songs only: a video is not square) and shown again on give-back.
- Verified: banner while playing, card 1 s after pause, menu toggle off and on, song change, queue, lyrics (YT's own), collapse.
- Verified after the audit fixes: ★ like/unlike lit to match; animated cover in the banner; a music video in video mode gives the card back at once and plays (surface shown); song mode of a music video shows the banner; cast and ⋮ open with the banner up; 0 layout passes in 5 s paused (was ~300), one per new lyric line while playing; word fill on dandelion.
- After switching a music video to song mode, the toggle would not switch back to video, also with the BitChord screen off: Morphe keeps video mode off while its crossfade/automix is active (expected; songs play as their song version anyway).
- Which lyrics provider Morphe picks varies per run: Midnight Sun came word-timed once and NetEase (line timing) another time; Morphe's own Lyrics tab showed the same line timing then, so our line follows Morphe.

### Naming (2026-11-12)
The spike code has real names now:
- **Packages:** `extension/music/spike` → `features`, and `patches/music/spike` → `features`.
- **Classes:**
  - SpikeA → Features
  - SpikeB → NativeCheck (developer check)
  - SpikeC → NativeDownloads
  - SpikeD → AnimatedCover
  - SpikeE → PlayerTap
  - SpikeEq → EqPresets (`Equalizer` clashes with android.media.audiofx)
  - SpikeG → PlayerScreen
  - SpikeH → ArtistArt
  - SpikeCover → SongCover
- **Patches shown in Morphe:**
  - "BitChord player and automix" (was Spike A);
  - "Automix libraries" (was Spike B; resources moved to `natives/lib`);
  - "Downloads without Premium" (was Spike C);
  - "Hello" is now off by default.
- **Unchanged on purpose:**
  - the developer override file `spike.properties`;
  - NativeCheck's `spike/` model and cache folders on the device;
  - the `ayham_*` setting keys, so existing settings stay.

- BitChord spec, from its source (`NowPlayingScreen.kt`, `PlayerControls.kt`, `ForkSleeveClip.kt`, `CanvasArtworkPlayer.kt`, `ArtworkMeshBackdrop.kt`):
  - **Defaults:** both settings default on. The 3-dots rows are hidden for radio stations.
  - **Banner:**
    - full width from y = 0, height ≈ width + status bar − 10dp;
    - crop, centred;
    - corners 8dp × (1 − shown);
    - fade 42 %, smootherstep;
    - status scrim alpha = 0.16 + 0.49 × luminance of the cover's top band, 8 steps;
    - no art: no banner.
  - **Rows:**
    - title 20sp bold white; artist 20sp at 55 %;
    - lyric line 16sp at 55 %;
    - seek bar is a capsule with no thumb, 7dp (12dp while dragging), elapsed / "-remaining";
    - transport: ◀◀ goes to the previous track (restarts after 10 s), ▶▶ goes to the next;
    - device line 11sp at 55 %, "This phone".
  - **Animated clip:** muted, looped, fades in over 320 ms. When paused it freezes on its frame and the banner stays.
- Emulator notes from tonight:
  - LDPlayer's NAT can break TCP (ping still works, every connect times out, even with YT stopped). Fix: `ldconsole reboot --index 2` (emulator-5558 = Main-2).
  - After a reboot it comes up in landscape; `settings put system user_rotation 1` brings portrait back.

## 5. Always play the song version
- Morphe's "Play albums songs" (`PlayAlbumSongsPatch`) does this only for album tracks: it serves the song's audio under the video's id, so the queue and player never restart.
- Ours does it for every music video (search, home, playlists, radio):
  - counterpart from YT's song/video pairing, search as fallback;
  - pairs cached, misses included.
- Wraps Morphe's resolver instead of replacing it. Check what YT's own "Don't play music videos" setting already covers.

## 6. Offline in YT Music's own player
Route chosen by the spike (2026-11-10): YT Music's own native downloads, unlocked for free accounts (see Batch C results). That replaces the plan below of saving responses and feeding Morphe's files; Morphe's downloader and Device files are not needed for it.
Today Morphe's downloads play in its own small `MediaPlayer` screen (`OfflinePlaybackService.java`), not YT's player.
Goal: Morphe's downloader keeps the files, but tapping a downloaded song opens YT Music's own player, which "streams" the local file fully offline. All patches then work offline.
1. At download time, also save:
   - the player response and next/queue response (likes, counts);
   - thumbnails;
   - the best lyrics (wait for the best provider);
   - the animated art clip.
2. Downloaded playlists and albums kept as playlists and albums; Songs / Artists / Albums / Playlists tabs.
3. Tapping a downloaded song starts YT's player for that videoId.
4. Offline, YT's player request for it is answered from the saved response, next to where Morphe's stream spoofing swaps stream data.
5. The local file is fed by the method that wins spike item 9c.
6. Chips that need the network: hidden or filled from saved data; "Offline" badge.
- Morphe 2.1.0 (Nov 6, the bundle we already patch with; morphe-patches#4406) upgraded its offline player: full-screen, shuffle, repeat, reorder and remove in the queue, album and playlist downloads, downloaded marks in lists, playlists from downloads. It is still Morphe's own player, not YT's, so our goal stands; spike confirmed it is `OfflinePlaybackService` with `android.media.MediaPlayer` and its own page (see Batch C results).
- Fallback if the spike says no: Morphe's 2.1.0 offline player as it is (it now covers library, shuffle and queue), with our art and lyric line added where possible; our own Media3 screen only if that fails.
- Lead found 2026-11-08, now the first thing to test for offline: YT Music has a native "Device files" mode (shown when signed out, or via "Device files only"). It plays local audio files in YT's own player, with Playlists / Albums / Artists chips and YT's full now-playing screen and queue.
  - Confirmed on the emulator: playback runs in YT's own `BackgroundPlayerService` and media session, not Morphe's `OfflinePlaybackService`.
  - If this works, offline = Morphe downloads saved where Device files reads them; much simpler than faking YT's responses (A2).
  Spike item 9 checks:
  - Do our player patches (art, lyric line, BitChord UI, automix) and Morphe's (crossfade, lyrics) apply there?
  - Can Morphe's downloads appear there? Saved into the shared Music folder / MediaStore with proper tags and cover.
  - Can it be reached while signed in (offline)?

### Moved to Morphe's own downloads (2026-11-12, Morphe 2.3.0-dev.2)
- Upstream merged "feat(YouTube Music - Downloads): Native offline downloads support" (morphe-patches#4698, in v2.3.0-dev.2). It does what our "Downloads without Premium" did: the same YT hooks (offlineability, upsell, declined player response, refreshed offline state), driven by Morphe's "Download mode" setting (default In-app). It also deletes `LocalDownloadManager`, `PlaylistDownloader` and Morphe's own offline player.
- So we take theirs:
  - `scripts/patch.ps1` defaults to `patches-2.3.0-dev.2.mpp`.
  - `FreeDownloadsPatch` / `NativeDownloads` are gone. In their place, "Offline lyrics and art" (`OfflineExtrasPatch` + `OfflineSave`): one read-only call at the start of Morphe's `BaseInAppDownloadsPatch.replaceDeclinedOfflinePlayerResponse`, which runs for every song YT saves; a response with an offline state (field 14) hands its video id to `OfflineExtras` (lyrics, animated art, video type). The settings switch `ayham_native` now turns this on or off.
  - Automix and the native check fetched audio through `LocalDownloadManager.resolveStream` / `openAudioConnection`. Now `AudioStream`: Morphe's `StreamingDataRequest.fetchRequestForDownload` with the download clients, the highest-bitrate audio format with a plain url from the player response (field 4 → 3), fetched in 1 MB ranges with the same headers.
- Upstream saves AAC (it skips `audio/webm`), where ours saved Opus 251: a 2:15 song is a 2.2 MB stream file.
- 2.3.0-dev.2 also adds "A-B loop" and "Disable audio ducking", and shows a modal "Android System WebView is out of date" box on the emulator (WebView 124), answered once with "Do not show again".
- Tested on the emulator: patching (56 applied, 0 failed, no warnings from our hooks), a song's Download from its menu → saved in Downloads with its check mark, and our hook saved its lyrics (LunaProvider). Java tests 129, Python 42 (136 after the fixes below).
- Also tested: a playlist's Download ("new test", 1 track) → "Download complete", lyrics saved (Apple Music provider); automix on the new `AudioStream` (Opus 251, analysis ~16 s a song, loop mix built and run, handover aligned to 6 ms); our player screen unchanged, with upstream's Download chip in the action row.
- Offline play tested with `scripts/emu_net.py run` (airplane mode, on-device watchdog): the downloaded song plays in our player (0:22 → 0:35 in 13 s), lyric line, cover and the "Downloaded" chip shown, network back on by itself.
- Fixed on the way: the stats line threw every second for a downloaded song ("Expected receiver of type dbo, but got avny"). `PlayerTap` reuses the field path to the audio Format found on the first player, and the offline player holds other classes on that path. `follow` now returns null when an object on the path isn't of the field's class, so the path is searched again for that player; the line then shows the saved file's format (AAC · 131 kbps). Test in `PlayerTapTest`.
- We wait for Morphe's stable 2.3.0 before releasing (asked 2026-11-12): on stable 2.2.0 there would be no downloads at all.

### Open issues closed (2026-11-12, on 2.3.0-dev.2)
- A-B loop: works with our screen. The seek bar is YT's own (we only draw the automix band over it, without taking touches): long-pressing it set the start (green) and end (blue) markers, and YT jumped back to 0:05.272 every 20 s. The setting was switched on for the test and back to its default (off) after.
- First mix after a cold start: not a bug. After a launch the saved analysis loads, but its decoded audio (≈50 MB a song, the newest 4 kept) may be gone and is fetched and decoded again: measured, the playing song in 10 s, the next one in 18 s, the loop mix ready 21 s into the song. Only a mix due in those first ~20 s falls back (to Morphe's crossfade, then retried every 5 s), so seeking to the end right after a launch.
- Wrong-language lyrics (`LyricsGuard`, two hooks in `PlayerFeaturesPatch`'s finalize):
  - Cause: Morphe's providers match by title, artist and length only. Luna searches a Chinese catalogue and falls back to its top hit; the prefetch caches a result with no match check; a cached or remembered result is shown again with no check; nothing looks at the language.
  - Fix: at the start of `LyricsMatch.isValidLyrics` (the gate of every result, one by one, the prefetch, the remembered preference and our offline save) lyrics are refused when the song's title and artist have no CJK and more than half the lyric lines hold Chinese characters with no kana or Hangul line. Counted by lines: the Luna match for "i don't need ur love" has 447 Chinese characters against 1003 Latin letters, but Chinese on most lines. Japanese and Korean lyrics are never refused (romanized names are common there). A one-line Chinese placeholder ("纯音乐，请欣赏" for an instrumental) is refused too.
  - `LyricsCache.get` is wrapped (`aroundCacheGet`: it runs the real get once and filters it) so a stored wrong match is dropped too. The method has a single free register: the early-return path reuses `p1`.
  - Tested: "i don't need ur love" now shows its English lyrics from the next provider; refused again during a mix and in the prefetch of a queued song.
- No lyrics after a quick switch (an automix handover): Morphe stores each provider's miss on disk for good (`#notfound`, no expiry), and a lookup cut short by the switch counts as a miss, so a reload reads the misses again (why the earlier reload nudge didn't work). `LyricsGuard` listens to Morphe's lyrics state: on NOT_FOUND it looks the song up once more after 2 s, skipping the stored misses for that video for 20 s (the cache wrap), once per video per run. Tested on an instrumental (one retry, then it stays at "no lyrics", no loop); two mixes in a row kept their lyrics, the race itself didn't come up.
- Album download: "Midnight Sun" (10 songs) saved, every song's lyrics saved; the album's animated cover saved once (`files/ayham-offline/canvas/cca0f133-720.mp4`, 4.9 MB) and shared by its 9 songs. Played offline with the watchdog: the song plays and the animated cover moves (the canvas cache still had its copy, so the saved copy, the fallback, was not the one used).
- Java tests 136, Python 42.
- Lesson: don't use airplane mode on LDPlayer for offline tests. Its adb runs over the emulator's network, so adb drops and the emulator has to be rebooted.

### From the first real-phone test (2026-11-15, `ytm-ayham-phone.apk`, package `app.ayham.ytmusic`), to fix later
1. Look: the cast button and the ⋮ button in the player's top bar should be as transparent as YT's audio/video switch.
2. Bug: after the screen turned off on its timeout and was turned back on, the player showed YT's old layout. Only restarting the app and starting the playlist again brought our screen back. A screen-off/on path probably doesn't rebuild or re-apply the BitChord layout; maybe a lifecycle event (onStop/onStart or a recreated view) isn't caught.
3. Feature: the YT Music Extension added an automix overview. Put an automix overview behind a ⋮ button next to the ★ in our title row. Wait until the extension's version is ready, then port it the same way.
4. Bug: lyrics tracking runs slightly late ("a few msec", the user's estimate; not measured yet). Plan: take Metrolist's lyrics timing approach later. The comparison chat will coordinate the Metrolist code, and both this project and the YT Music Extension will read from that shared source.
5. Look: the "Mixing" label sits too low and touches the pause button; move it up. To make room, maybe move YT's top bar (the playlist name and its menu) down a little.
6. Automix: Vaina Loca → SI NO ES CONTIGO on Advanced AutoDJ didn't mix the way the user wanted. The YT Music Extension logged exactly the automix the user wants for this pair; compare our plan with that log.
7. Bug: when the mix ended and the song carried on, the audio cut for a moment ("a msec or 2"), and the user also heard a stretch with no song. Probably the handover from our deck back to YT's player (gate unmute or alignment). Check it in the phone's logs.
   - Found and fixed 2026-11-17 on the emulator:
     - When the incoming song is a music video swapped to its song, `AnimatedCover.songMode` clicked YT's song/video toggle mid-mix. YT reloaded its player and ignored our alignment seeks, so the handover landed 114 s off: YT jumped into the middle of the song.
     - The click now waits until no mix runs.
     - `Engine.rescueOffHandover` also seeks YT's playing player to the deck when a forced handover is more than 1 s off.
     - Retest on a swapped music-video pair: handover +18 ms.
8. Layout: the controls take about half the screen; the user wants more room for the art. Tighten the padding. Talk it over with the user first.
9. Bug: rotating the phone to landscape shows the art full screen like a YouTube video (YT's own landscape layout). After rotating back to portrait, all our player changes are gone. Probably the same cause as item 2: a recreated activity or view isn't picked up again. Also design a landscape layout of our own, as BitChord has.

### Phase 0 (2026-11-17): Morphe 2.3.0 stable
- Morphe 2.3.0's patches need Morphe Desktop 2.2.0: the patcher in 2.1.1 lacks `PatchInterfacesKt`.
  - The Dockerfile now pins `MORPHE_DESKTOP=2.2.0`, and `patch.ps1` defaults to `patches-2.3.0.mpp`.
  - 60 patches applied, 0 failed; every hook of ours was found.
- Re-checked on the emulator, all working:
  - song version, square cover and artist art;
  - stats, lyric line and lyrics guard hooks;
  - animated cover (Anti-Hero);
  - automix analysis and a filter mix (takeover −4 ms, handover +18 ms).
- Screen off/on and rotation keep our screen on the emulator. YT doesn't rebuild its activity on this tablet emulator, so items 2/9 need the phone's logs.
- Lyrics (item 4), measured on the emulator (Anti-Hero, word-timed):
  - Morphe's lyric clock (`getPositionMs`) matches YT's player position within about ±60 ms.
  - Morphe's line text already runs 800 ms ahead (its mini-line offset `LYRICS_MINI_NEXT_OFFSET_MS`, −800 by default), so with our 500 ms poll the line comes up 300–800 ms early, and the word fill follows the player.
  - One real late case: during a mix the deck's line was picked exactly at its start and finished its 340 ms slide late. Fixed: the next sung line now comes up at least 340 ms early (`LyricTiming.dueLine`, `LEAD_MS`), on the deck too, and out of an intro or a gap on time instead of at the next poll.
  - Not reproduced otherwise. Next: check on the phone by ear, and Morphe's per-track lyric offset (`TrackOffsetStore`) and "Lyrics offset" setting.
- Phone build: `work/out/ytm-ayham-phone.apk` (package `app.ayham.ytmusic`, Morphe 2.3.0).
- On the real phone (S21 FE, Android 15, speaker), 2026-11-17:
  - Speaker latency: no tuning needed. Takeovers −8 to +9 ms, handovers +1 to +11 ms (one −44 ms). Both our deck and YT's player are placed by `AudioTrack.getTimestamp`.
  - Items 2/9 (our screen lost after screen off/on or another app): YT parks its bottom sheet below the window while it lays the page out (2922 on a 2340 screen). We learnt that as the sheet's resting place, so its real place then read as "sheet open" for good. Fixed in `PlayerScreen.tick`: a parked sheet doesn't count, and the resting place is learnt again once the sheet stays still for 0.6 s. The phone's log now shows our screen coming back after every screen off/on.
  - Item 7 (cut after the mix), measured by recording the phone's audio with scrcpy (`--audio-source=playback --audio-dup`) and looking for dropouts. There were two causes:
    - The handover could fall mid-nudge, so YT's speed went back to x1 as it was unmuted. It now waits until YT's speed has been steady for 300 ms.
    - Stopping our deck's AudioTrack right after the mix muted the whole phone for ~10 ms (recorded). The deck now plays 3 s of silence before it stops. Four mixes recorded since: no cut.
  - Item 5: the "Mixing" label now sits just under the bar (12dp, was 20dp), clear of the pause button.
  - Bluetooth: the user's call is that speaker working means Bluetooth works too (both paths are placed by `AudioTrack.getTimestamp`). Not tested separately.
  - Item 1: cast and ⋮ are drawn at 55% (`dimTopIcons`), given back with YT's layout. The user approved the look.
  - Item 4 on the phone: the strip jumped to the next line mid-line on fast verses (Midnight Sun), because Morphe names the next line 800 ms early. The strip now holds the sung line until 340 ms before the next one (`LyricTiming.aheadOf`/`held`, plus a wake-up timed to the switch, `lineNext`). On the emulator every line switched 320–355 ms early. The word fill also read late: a word fills over its own sung time, so it was fully lit only as it ended. It now runs 150 ms ahead (`FILL_LEAD_MS`). The user confirmed both on the phone.
  - The user's layout ask: the queue sheet rests 28dp lower (easing back as it is pulled up), the column takes all the slack above it, and the art banner reaches down to the seek bar, its sides cropped evenly, so no empty band is left under the art. Back from the open queue leaves YT's sheet half open: that place is no longer learnt as the resting place (only the bottom 30% of the screen counts).
- Phase 1 (shared specs): `spec/` is a copy of the extension's master. `scripts/check-spec.ps1` fails when they differ. `SpecFixturesTest` runs our planner on the 5 real pairs: every plan field matches the extension's golden plans, v1 and v2, within 1e-3. The new `curves` are skipped until they are ported (the first Phase 2 task).
- Testing from here on (the user, 2026-11-17): every feature on the emulator; the phone once at the very end of all features, with a debug build, going through each feature.

## 8. Stats for nerds (last, after all spike items are verified)
- The info lines under the art, as in BitChord:
  - Line 1, the source format: codec · sample rate · bitrate · channels (e.g. "Opus · 48.0 kHz · 160 kbps · 2 ch"), read from YT's player (audio input format).
  - Line 2, automix status: this song (analysed / analysing, BPM, key, grid confidence) and the next song (analysed / analysing / failed).
- Own toggle; tapping could expand more detail later (client used, stream itag, buffer).

## 7. Settings
- All in their own screen, Morphe settings > BitChord fork (2026-11-12), with the categories Player and Automix. The keys are unchanged, so saved settings carry over.
- The Automix version, Blend length and Equalizer preset lists draw their choices in the dialog's own text colour. YT's theme made them black on the dark dialog, so the rows looked blank.
- One switch per feature; off = stock YT Music.
- "Clear animated art cache" with its size.
- "Clear lyrics cache" reuses Morphe's (`LyricsClearCachePreference`).

## Safety and upstream
- A feature whose hook fails at runtime turns itself off and logs it, instead of crashing.
- Where we touch the same areas as Morphe (most to least risk):
  1. Offline playback: the player-request path, shared with Morphe's stream spoofing.
  2. Automix: hooks Morphe's crossfade code.
  3. Song version: shares Morphe's resolver slot (wrapped).
  4. BitChord UI: the player page Morphe also adjusts (covered, not edited).
  5. Animated art, lyric line, settings: own views only.

## Skipped
- BitChord's other features (EQ, loudness, spatial, queue/radio features).
- The shared audio-processing hook, and with it the automix DJ filters.
- Navidrome stays in BitChord.
