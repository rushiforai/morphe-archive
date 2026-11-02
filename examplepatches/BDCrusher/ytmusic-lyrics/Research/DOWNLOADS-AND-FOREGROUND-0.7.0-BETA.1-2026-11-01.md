# Downloads and foreground surfaces - 0.7.0-beta.1

Working implementation for the user-requested YouTube-style in-app audio downloader and October 31 phone feedback. Exact original arm64 YouTube Music 9.42.52/94252240 and 9.43.51/94351240. Full Collection only; Shaders and Download playlist remain optional. Do not mix this Full Collection with another complete official source. Jam remains 9.42.52-only. Final acceptance is recorded in the new distribution's verification.json; this document alone is not a release receipt.

## Download behavior

Use the existing **Morphe > Player > Downloads** mode and external-app selector. Default mode retains the native account/availability flow. External mode hands off one canonical displayed-playlist URL through the selected application's normal review flow; YTDLnis owns its own format choices. In-app mode opens the themed audio quality sheet, showing returned Opus formats, estimated size and Remember my settings. A playlist asks once for its batch. Estimates use exact returned length when known; otherwise bitrate and duration. The playlist preview paginates authenticated native pages and estimates from known lengths and one returned stream; sizes can differ per track and missing lengths are shown.

New in-app files are actual **Opus in WebM**, with codec/sample validation before atomic completion. The `.webm` extension describes the container; files are not renamed to `.opus` or silently substituted with AAC. Existing AAC files are kept, and the catalogue prefers the Opus recording when both exist. Static JPEG artwork and metadata remain alongside the audio. The storage card shows owned audio, static covers, track/native playlist metadata and free space; it excludes files in the read-only external folder.

Both playlist-header download actions resolve the displayed playlist, never Now Playing. Native header VM traversal supports different wrappers around the verified component. Batch enumeration keeps every original position, repeated entries and continuations; at most two tracks download simultaneously. Pause, resume, retry missing and cancel remaining preserve completed files. Partial enumeration and repeated continuation tokens never become a complete playlist. Status uses accessible native subtitle runs for Downloaded, Downloading and Queued; this is not a verified stock circular badge renderer.

## Same playlist, native player

Normal playlist rows keep native WatchEndpoints and native player/queue ownership. An offline whole-play action reuses an actual available row's native endpoint with its original playlist identity. The progress page opens the original playlist instead of starting the separate offline service. The old individual file catalogue/service remains available for manual file management/playback; it is not the route used by normal playlist taps.

Saved audio has sanitized native format metadata retaining initialization/index/codec data. A typed native adapter delivers bytes through the application's own NetFetch callbacks for Cronet and Envoy, including byte ranges, seeking, cancellation and errors. A current native response keeps all fields/status and substitutes only its saved streaming format. Cold offline playback also uses saved native player and `/next` responses keyed by recording, original playlist and position. Metadata warms through the authenticated native client after download and recovers on foreground/restart. No network rejection becomes a cached authenticated success; online failures retain their original cause/cancellation. The original native client owns authentication and availability.

The chosen YTDLnis folder remains read-only. Exact recording IDs in filenames are required. On resume it indexes readable files and checks actual containers/codecs through Android MediaExtractor. The native adapter supports seekable WebM/Opus and M4A/AAC-LC; other containers/codecs, ambiguous IDs and non-seekable providers are not treated as native-offline ready. Folder indexing must finish before using those entries, and native song metadata must have been prepared while online. Files are not copied into app-private audio storage. Native decoding, queue transitions and SAF behavior require phone acceptance.

## SponsorBlock

When the SponsorBlock patch is selected, SponsorBlock is enabled and Save SponsorBlock chapters is on, successful downloads fetch normal segment metadata and save a sidecar with category names, colors, UUIDs, lock state and original timestamps. Cached segments feed the existing skip policy and colored seekbar markers offline. Current ignored-category settings remain respected. Failures preserve saved audio/segments. No audio is cut or retimed; no container-embedded chapter tags or new native chapter picker are claimed. The original progress-bar color remains under the existing segment markers.

## Shaders and navigation

Both original APKs initialize `player_page_background` as invisible. Background effect lifetime now follows its visible native parent, while animated covers still follow native poster visibility to avoid covering the actual video. Lyrics effects bind the verified engagement sheet containing body and header. Clear/restore only the relevant native paint chains; preserve close-button ripples, handle indicator and native theme updates. Static poster artwork is the fallback for native videos; actual video frames are not sampled.

Foreground viewport extension targets that sheet and releases ancestor clipping even when the child already reaches the window edge. The shared coordinator keeps the navigation bar/divider/contrast protection transparent and preserves safe controls/insets. Real Samsung three-button/gesture, keyboard, landscape, dialogs and actual foreground coverage remain device acceptance checks.

The native muted looping cover fits the full animation rather than cropping it. Repeated updates reuse the same decoder. Pause/hidden/reduced-motion state remains separate from lyric timing. Slow TextureView readback stops further periodic captures for that cover session, retaining its frame for actual Kawarp motion; the native cover decoder continues looping. This avoids repeated expensive captures at the cost of following every cover frame on slower devices. The background FPS control remains independent of Better Lyrics timing. No universal zero-stutter claim.

## Lyrics, settings and diagnostics

The existing Better Lyrics/Braccato text engine, native panel entry definitions, source selection, permanent best-lyric library and source recovery remain intact. Individual audio completion also requests background lyric prefetch. No invented word timing or competing scroll algorithm is added. Existing preferences, offsets, source credentials, chosen-folder grants and library namespaces are preserved.

Themed native download choices/switches and the storage card join the existing settings page. The quality dialog handles navigation insets itself. Existing native settings-root paint, feature cards, Shaders customization and quiet source status stay in place. The normal **Enable debug logging / Export debug logs** remains the only logging flow. Native metadata misses, read failures and adaptive cover readback are included; there is no timer or automatic error banner.

## Evidence and remaining acceptance

Read `Verification/revision40/WORK.md`, the final matrix, source freeze and compiled audits, then the staged `verification.json` for exact artifact identities and completed counts. Fixtures exercise actual source with explicit Android/native codec/GPU/SAF/client boundaries simulated. No devices, MuMu, signing, installation, real media download or cleanup is part of these checks. Compilation and simulation do not prove phone smoothness, visible Samsung transparency or native media playback. Publication is complete only when the matching new Toolkit receipt exists.
