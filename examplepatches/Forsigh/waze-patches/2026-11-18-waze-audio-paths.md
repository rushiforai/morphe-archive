# Wiring a non-SDK player into Waze — what the deep dive found

Date: 2026-11-18. Base studied: Waze 5.27.90.900 (decompiled locally) plus public sources listed at the end.

## The protocol, in one paragraph

Being a Waze audio partner is a three-channel arrangement, not one API. Waze finds candidates in its
server roster (`SdkConfiguration.appConfigs`, built from four arrays), probes "installed" by resolving a
receiver for `com.waze.sdk.audio.ACTION_INIT`, then broadcasts that action with a `token` extra. The player
binds `com.waze.sdk.SdkService`, transacts `ISdkService` method 1 with (token, settings Bundle, client
Messenger) and gets back its own Messenger. Playback itself is **not** on that channel: Waze resolves the
player's exported `MediaBrowserService`, browses it and drives it with `MediaController.TransportControls`,
reading `MediaSession` metadata for the panel. The settings Bundle carries `themeColor`, `openMeIntent`
and optionally `versionCode` (10 = two extra panel buttons). The Messenger carries only session lifecycle
(502/103), navigation pushes (702/704/705/706/709/710) and stats (106).

## Ranked ways to wire BitChord in

1. **Patch Waze's roster + register call (what we ship).** Cheapest for users: no root, no fork, no
   impersonation. Three edits: append the package to the roster arrays with the audio scope `0x200000`,
   answer the installed check for it, and short-circuit the connect to call `bf.O(...)` with a Bundle.
   Verified workable by pomee4 for myspoti/AntennaPod/Poweramp/Metrolist on 5.26.5.0.
2. **LSPosed module** (root only): hook the same three points at runtime. Keeps Play-signed Waze and
   Android Auto intact, no rebuilt APK. ~1-2 days of work, low maintenance because `com.waze.sdk.*`
   names are not obfuscated.
3. **Bridge APK wearing an allowlisted package id**: implements the receiver + SDK handshake and proxies a
   MediaController to BitChord's exported `MediaLibraryService`. BitChord stays stock and updatable, but
   the bridge must claim an id Waze's server roster already contains (cannot coexist with the real app).
4. **BitChord fork with `applicationId com.google.android.apps.youtube.music`** + a ~150-line SDK shim.
   Works without touching Waze; costs real YouTube Music and self-updates, GPL-3.0 vs the proprietary SDK
   is legally awkward.
5. **Dead ends**: config-only injection (overwritten every sync), Spotify-slot hijack (only buys
   availability; playback needs the legacy Spotify flow), the `com.waze.sdk.audio.sample` debug entry
   (present but the field is never read), official partnership (weeks-months, BitChord would fail review).

## Why dev.6 crashed, proven

The built bundle put registers outside the method frame:

- `com.waze.sdk.aq.e(String,String,Runnable)Z` has `.registers 6`, but the injected connect hook wrote
  `v3..v8` (`invoke-virtual/range {v3 .. v8}, bf->O(...)`).
- `com.waze.sdk.aq.d(String)Z` has `.registers 2` and the installed hook assumed a 10-register frame.

ART rejects both at class load: VerifyError as soon as the audio-partner list is touched. Cause: the
mutable method copy reported `registerCount = 10`; the immutable original reports the truth. Fix reads the
frame from `Fingerprint.originalMethod` and refuses to emit a block that needs more registers than exist.

New gate: `tools/verify-dex-frames.py <apk> [class-filter]` re-parses dexdump and reports any `vN` outside
`.registers` or `pN` outside `.ins`. Negative control: the dev.6 artefact gives 14 violations in `aq`;
the fixed build gives 0 in `aq` and `SdkConfiguration`.

## Open risks after the fix

- The session is registered with a null `Messenger`. Construction tolerates it; `ao`'s outbound senders
  (`ao.smali:1036`, `:1172`) do not, and they catch only `RemoteException`. If Waze ever pushes an
  instruction update to an audio-only partner, that NPEs. Next candidate fix: pass a Messenger backed by
  a main-looper Handler, discarding messages.
- 5.27.90.900's roster is server-side and A/B gated; a package absent from it still gets rejected by
  `bf.O` even with a valid registration.
- Whether Waze accepts a proxied MediaBrowser in place of the app's own has not been tested.

## Sources

- `Loupric/morphe-waze-music-patch` (patch source), `mohamedbassem612/youtube-music-decompiled`
  (`MusicWazeBroadcastReceiver`, `auna`, `aumv`, `aumq`), `mohamedbassem612/Spotify-decompiled`
  (`ffl1`, `ek70`, `vh3`), `romanchukg-cloud/spotify-android-head-units` (`HuWazeLink`, README),
  `meowarex/rl-mobile` (smali receiver/service), `bearinmindcat/morphe-patches` (`MusicApps.java`),
  `Pilotkosinus/morphe-waze-patches`, `pomee4/waze-audio-patches`, `kota-zo/Orpheon` (`PlaybackService`),
  `developers.google.com/waze/intro-audio`.
