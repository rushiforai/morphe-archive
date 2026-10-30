# Twitch patch work

## Objective and current state

Apply the same workflow used for Rumble and Kick: inspect the original app, implement
the viable equivalents of the existing patches, verify the resulting APK and runtime
settings, and publish a tested stable Lurk release through the repository workflow.

The supported target is `tv.twitch.android.app` **31.8.0**, version code **3108006**.
The patches were written against 31.6.0 (3106006), moved to 31.7.0 (3107006) on 2026-10-21 and to
31.8.0 on 2026-10-29. Two APKMirror bundles of 31.8.0 are stored with `bin/apk-add`, which verified
their signature, in `apks/twitch/31.8.0/`: the arm64-v8a 480-640 dpi bundle for phones (Android 10+,
the default input) and the arm64-v8a, x86 and x86_64 480 dpi bundle (Android 8.0+) that emulator
installs pick. The phone bundle's base APK SHA-256 is
`09fad5136771353a7cd7748f894d406f03b6c129e3e637287f98baf5c48666a4`.

Allowed sources are APKMirror, Google Play and Uptodown (see [CONTRIBUTING.md](../CONTRIBUTING.md)).
The variants used are listed here:

- [APKMirror release and variants](https://www.apkmirror.com/apk/twitch-interactive-inc/twitch/twitch-live-streaming-31-8-0-release/)
- [APKMirror arm64-v8a bundle](https://www.apkmirror.com/apk/twitch-interactive-inc/twitch/twitch-live-streaming-31-8-0-release/twitch-live-streaming-31-8-0-android-apk-download/)
- [APKMirror arm64-v8a + x86 + x86_64 bundle](https://www.apkmirror.com/apk/twitch-interactive-inc/twitch/twitch-live-streaming-31-8-0-release/twitch-live-streaming-31-8-0-4-android-apk-download/)

What changed from 31.6.0 to 31.7.0 for the patches: the React Native bundle (still Hermes v98)
renumbered its strings, functions, literals and registers, and the React Native player moved its
player, metadata, stream URL and release handling from `TwitchIVSPlayerView` into a new
`PlaybackSession`. Patterns that carry string IDs now resolve them from the bundle
(`HermesBundle.id8`/`id16`).

What changed from 31.7.0 to 31.8.0: the bundle (still Hermes v98) has a new SHA-256 and renumbered
again. `PlaybackSession` became `PlaybackSlot`, which a registry keeps per playback key and attaches
to a `PlaybackEdge` (the player view, a `PlaybackDisplay`) instead of owning a final display; Mute
stitched ads now finds the session by the two player interfaces it implements rather than by name.
`PreloadHolder.preload` gained an owner parameter after the URL (Playlist proxy). The edits whose
registers, offsets or memo-cache slots are the compiler's (Hide Clips in `DiscoveryFeedContent`,
the player's Share button) were re-derived from 31.8.0's disassembly. Of the other 61 functions with
Hermes edits, 48 are the same as in 31.7.0 apart from string, literal and jump encodings, 6 changed but
are edited by name (a component returning null, a prop read as false), and 7 anonymous ones are found
by byte anchors and size checks (Hide Clips' three clip callbacks, compared by hand, are unchanged).
The version-pinned tests that name R8-renamed classes, string or resource IDs or Metro module numbers
were moved to 31.8.0's, and the stock bundle's SHA-256 they pin with it.

APKMirror reports the signing certificate SHA-256 as
`1338f9b049893cc70b78432a177582f90bd4bc6296ea4ed35bcc7df59687ac53`.
The supplied APK's verified signature matches this certificate, which is now pinned
in `twitch/shared/Constants.kt`. Decompiled Java, smali and resources are under
`$MORPHE_WORK/twitch/31.8.0/` (`bin/decompile twitch`). Twitch also embeds a Hermes v98 React Native bundle
and web-view JavaScript; native screens alone do not cover every feature.

## Coverage

The table below covers the 13 Twitch patches that match the Rumble set. The ones added after
comparing Lurk with other Twitch bundles are in [Patches beyond the Rumble set](#patches-beyond-the-rumble-set). These are original patches
based on this APK; the Rumble and Kick fingerprints do not apply directly.

| Rumble patch area | Twitch equivalent and boundary |
| --- | --- |
| Change app name | Opt-in launcher label, default `Twitch Lurk`. |
| Lurk icon | Purple Lurk artwork, adaptive/round/monochrome launcher resources. |
| Remove tracking permissions | Removes the two present advertising-ID and Play install-referrer permissions. This alone does not stop other identifiers or telemetry. |
| Clone app | Opt-in package `tv.twitch.android.app.lurk`; renames all provider authorities (ten in 31.8.0), including Amazon's suffix, and the app's signature permission. Amazon sign-in and verified app links are unverified after re-signing. |
| Disable analytics | Native/RN Spade, local vendor consent decisions, ComScore permission, Branch events/tracking mode, Sentry and Crashlytics collection controls. Details below. |
| Clean share links | Native/RN share intents and clipboard paths; removes known tracking parameters only on Twitch-owned hosts. Keeps timestamps, unknown parameters, fragments and unrelated URLs. |
| Disable autoplay | Separate switches for fresh feed-preview defaults and automatic next-video/clip advancement. Manual playback stays available. |
| Default video quality | Opt-in default rendition, Source initially. Saved choices including Auto win; unavailable renditions use Twitch's fallback. |
| Hide Shorts | `Hide Clips`: Home discovery and native channel-profile Clips tabs. Clip routes remain present. |
| Hide tipping and Rants | `Hide Bits tipping`: purchase/cheering controls, including native and RN chat buttons and the chat header's Get Bits. Received chat messages stay untouched. |
| Hide Premium upsells | `Hide subscription upsells`: Subscribe/Gift prompts (the chat header's too) and Turbo promotions. Existing subscriber status and native member-management rows remain. |
| Block cookie notice | Hides the automatic notice only. Does not accept consent, change saved consent or disable manual privacy settings. |
| Block ads | `Block client ads`: takes the existing native client ad-decline path and completes its result. Does not remove ads stitched into streams or cover every RN ad path. |
| Unlock Premium | No patch. Local Turbo state exists, but no useful equivalent entitlement change was established. Signed playback/account benefits are server controlled. |

## Patches beyond the Rumble set

These were added on 2026-10-15 after comparing Lurk with other Twitch patch bundles and mods at the
feature level. Each was written from 31.6.0's own code and moved to 31.7.0 and 31.8.0 with the rest.

### Feature checklist

Every feature from that comparison that Lurk didn't have, and what covers it now. The sources compared
were ReVanced, the community Morphe bundles (hoomans, uyu, Kizu, ryykitty, Canic), PurpleTV and
ReVive, bttv-android, TwitchMod, Xtra, Twire and Frosty.

| Feature in other bundles | Lurk |
| --- | --- |
| Stitched (SSAI) ad handling without a proxy | Avoid stitched ads (picture-by-picture stream during breaks) and Mute stitched ads (fallback) |
| Proxy ad blocking | Playlist proxy (opt-in, own URL) |
| Hide display ads, audio ads | Block display ads |
| Fix login / notifications in re-signed builds | Fix notifications. Sign-in sends nothing signature-derived; the traced cause is in [Sign-in after re-signing](#sign-in-after-re-signing). |
| Disable Bugsnag | Not in 31.6.0 through 31.8.0. Nielsen and Sprig, the remaining reporters, are now in Disable analytics. |
| Disable Google Play services | Declined |
| Anonymous chat | Anonymous chat |
| Show deleted messages, ignore chat clears | Show deleted messages, with Ignore chat clears |
| Chat timestamps | Chat timestamps |
| Highlights and blacklist | Chat keywords |
| Chat appearance | Chat appearance |
| Badge, emote and message scale and spacing (Frosty) | Chat appearance |
| Emote and badge info sheet (Frosty) | Emote and badge info |
| 7TV/BTTV/FFZ emotes | Third-party emotes (opt-in), in the emote picker and autocomplete too |
| Third-party badges and pronouns | Third-party badges, with pronouns (opt-in) |
| Recent chat history | Declined: Twitch already loads it |
| Danmaku | Chat overlay (opt-in) |
| Hide Hype Train, leaderboards, gift and sub banners, pinned cheers, watch streaks | Hide chat highlights |
| Background audio | Background audio |
| Sleep timer | Sleep timer |
| Refresh stream | Refresh stream |
| Brightness/volume gestures, seek interval | Player gestures |
| Hide Clip/Cast/Share buttons | Hide player buttons |
| Video stats / latency | Show video stats (with uptime), Latency badge |
| Disable low latency, force ExoPlayer | Normal latency, Force ExoPlayer |
| VOD chapters | VOD chapters |
| VODHunter (sub-only and deleted VODs) | Declined |
| Default startup tab | Default startup tab |
| Hide Home sections | Hide Home sections (and Hide Clips now covers the native Home tabs) |
| Hide mature-content warning | Hide mature content warning |
| Tablet UI | Tablet layout |
| Navigation bar position | Navigation bar position |
| Auto-claim channel points | Auto-claim channel points |
| Auto-claim Drops | Auto-claim Drops (presses the drops notification's Claim) |
| Twitch debug mode | Declined |
| Twitch's newer React Native player bypassing native hooks | Use native player |

Two patches have no counterpart in those bundles. *Watch without signing in* opens Twitch's own
signed-out mode. *Fix stuck start screen* fixes a stock start-up stall. The reasons for each decline
are under [Declined](#declined).

### Watch without signing in

Twitch (31.6.0 through 31.8.0) still ships its signed-out browsing mode. It sits behind the Eppo `loggedOutExperiment`,
which is unassigned by default. Three places decide between the main UI and `LoginActivity`: the
intent router, `ViewerLandingActivity.onCreate` and the settings screen. All three call the
experiment's one boolean getter: false while signed in, otherwise whether the device was given a
variant. The getter's class is found by its variant strings (`variant1` … `variant7`, `no_nudges`).
With the switch on, a signed-out device counts as in the experiment. The signed-in check runs first,
so signed-in use doesn't change.

Signed out, requests carry only Twitch's Client-ID and device ID, chat connects as an anonymous
`justinfan` reader, and following, chatting and other account actions open Twitch's own sign-in
prompts. Verified on the emulator:
- with the switch on, launch reaches `ViewerLandingActivity`, Home plays a live stream, a channel's
  native theatre plays with its chat, and Browse works;
- with it off, launch returns to `LoginActivity`.

This mode also makes signed-out playback and chat testable on the emulator.

### Fix notifications

Every Morphe-patched APK is re-signed. Firebase Installations checks `X-Android-Package` and
`X-Android-Cert` against Twitch's API key restrictions, so the re-signed app gets
`403 Requests from this Android client application … are blocked`. Push registration then never
completes. Checked against the live endpoint:
- re-signed certificate: 403;
- original certificate with `tv.twitch.android.app`: 200;
- the clone's package name: 403 even with the original certificate.

The patch sets both header values right before the two `addRequestProperty` calls in the
Installations client. The client is found by its three header strings. It sends the original package
name and the original certificate's SHA-1 (`8C68C138…9463`, from the pinned certificate), the values
unpatched Twitch sends. The `fix_notifications` switch (Interface, on by default, after a restart) picks
the original or the app's own value through `TwitchNotifications.firebaseHeader`, using a register
proven dead at each call for the original.

Verified on the emulator: the clone's `PersistedInstallation` moved from `FisError: BAD CONFIG` to
status 3 (registered) with auth and refresh tokens, and an FCM token was stored. Delivering a
notification needs an account.

No client-side sign-in gate depends on the signature; see [Sign-in after re-signing](#sign-in-after-re-signing)
for the full trace, including the one report that carries the signature to Twitch's servers.

### Sign-in after re-signing

Other bundles ship a "Fix login" for "This app version/OS is not currently supported" after re-signing,
blaming a background Play Integrity report. Traced in 31.7.0's code, the question comes out like this.

**The Play Integrity report.** `yut` (found by its `play_integrity_setup_begin` analytics event) is started by
`obv` once the app's lifecycle reaches STARTED: `b()` waits two minutes, then runs only if the Eppo flag
`Android-Play-Integrity` (`qdg.i`, default off, assigned by Twitch's servers through the `tut` cached
experiment) is on. `a()` prepares Google's Standard Integrity API (`pvc.z`, `StandardIntegrityManager`
prepare), `d()` requests a token whose `requestHash` is a random attestation request ID (`pvc.r`), and `c()`
hands it to `s5s.v`, which POSTs `PassportPlayIntegrityAttestationRequest{request_id, token, client_id,
device_id, session_id}` to `https://passport.twitch.tv/api/v1/android/attestation` (`AccountService.attest`,
called from `x7`). The response is only reported to analytics (`passport_attest_response`), and every failure
is caught and logged (`play_integrity_*_failure`). The token is made and signed by Google Play services: it
carries the installed package's name, its signing certificate's SHA-256 and version code as Play computes them
(for a re-signed APK, the re-signer's certificate and `UNRECOGNIZED_VERSION`), so the app has no value in it to
replace. This report is the only place where a signature-derived value reaches Twitch, and it is tied to the
login only through the `device_id` the server sees on both.

**The login request.** The native login (`LoginFragment` → presenter `qko` → `AccountService.protectedLogin`,
`POST passport.twitch.tv/protected_login`) sends `ProtectedLoginRequestInfoModel`: username, password, Authy
and Twitch Guard codes, captcha proof, `undeleteUser`, `forceTwitchguard`, obscured e-mail and the constant
Client-ID. Nothing in it is derived from the signature. Its protection is Kasada: `ue1` registers
`passport.twitch.tv/protected_login` and `gql.twitch.tv/integrity` with the Kasada SDK (`x-kpsdk-v a-1.20.1`),
a Java and WebView client with no native library, whose `x-kpsdk-dv` value is an encrypted
`{SDK int, versionName}` (`tgs.f`). The `Client-Integrity` token comes from `gql.twitch.tv/integrity` behind the
same Kasada check. No code of the app or of these SDKs reads Twitch's own signing certificate: the only
readers are Firebase Installations (`X-Android-Cert`, which *Fix notifications* answers), the Amazon sign-in SDK
(Amazon's own sign-in), Chromium's `BuildInfo`, and Play Core and AndroidX checks of *other* packages (Play
Store, Play services, font providers).

**The message.** The string isn't in the app's resources or native code. Passport answers a refused
`protected_login` with an error code and text; the native enum `f7t` names the integrity ones
(`IntegrityInvalid` 5021, `IntegrityMissing` 5022, `AppOutdated` 5023, `AppUnsupported` 5024, `IntegrityFailed`
5025, `IntegrityUnexpected` 5026). The login presenter has cases for none of them, so it shows the server's
`error` text as it is. Twitch's bundled web login form (`assets/public/assets`, `AuthFormLoginError` and
`AuthFormSignupError`) maps 5021, 5022, 5025 and 5026 to "This app version/OS is not currently supported." in
the app and "Your browser is not currently supported." in a browser. The message is therefore the server's
verdict on the login's integrity check (Kasada), and possibly on the attestation the same device sent earlier;
nothing on the device produces it.

**Conclusion.** The approach of *Fix notifications* (sending the original package name and certificate
digest) has nothing to act on: no Twitch request carries a package name or certificate digest the app computes,
and the one signature-derived value is inside Google's signed token. The remaining client-side lever is the
one other bundles use, not sending the attestation at all (the report is optional for the app: it runs only
under a server flag and its failures are ignored). Whether Twitch's server refuses logins because of that
report, or because of Kasada's own verdict, can only be told with an account on a device where the flag is on,
so Lurk doesn't ship that change on speculation. If a user reports the error, the place to stop the report is
`yut.a` (the method logging `play_integrity_setup_begin`).

### Default startup tab

The bottom bar is Home, Browse, Create, Activity and Profile. Following is not a tab. A plain launch
reaches the intent router (the method writing `destinationOrdinal`, with `intent_router`) with the
`Default` destination. The patch replaces only `Default`, with `Browse`, `Following` or
`NotificationCenter` looked up by name in the same enum. Links keep their destination.

Changing the bar's own default tab is not an option: the navigation host requires Home as the start
destination (`Must use NavGraphFragment resolver for start destination`). Verified on the emulator:
Browse opens at launch.

### Trackers in Disable analytics

31.8.0, like 31.6.0 and 31.7.0, has no Bugsnag, Facebook SDK, SafetyNet or Amazon APS. Disable analytics now also:
- turns Nielsen's server-to-server ping into a no-op. That is the method calling
  `NielsenS2SService.firePing`, a GET to `imrworldwide.com` with the advertising ID;
- skips `UserLeap.configure(Context, String)`, so Sprig surveys and tracking never get an
  environment. Every public `Sprig` method has zero spare registers, so the facade can't be guarded
  directly.

A blanket "disable Google Play services" switch is deliberately not offered. It would break push,
Google and FIDO sign-in, Cast and billing.

### Background audio and Show video stats

Twitch already has "Continue Playing Audio in the Background" (Always, Headphones/Speaker, Never),
with its own audio-only switch, `TwitchPlaybackService` foreground notification and media session.
Its default is Never. Every theatre reads the setting through one getter, and the patch rewrites that
getter's `"never"` fallback. A saved choice still wins. Verified on the emulator: leaving a live
stream with Home keeps the media session `PLAYING`, with an active media `AudioTrack` and Twitch's
transport notification.

The native player's stats panel (latency, bitrate, buffer, dropped frames, codecs, node, cluster)
is gated by one getter: staff account plus a debug preference. The getter is found by
`showVideoDebugPanel` and a `SharedPreferences.getBoolean` call, and the switch returns true from it.
Verified on the emulator: an (i) button appears in the overlay and opens the panel. Twitch's staff
debug menu is not exposed. Faking staff status would change experiment targeting and expose
network-altering tools.

The panel also shows a live stream's *Uptime*. Twitch's master playlist carries `#EXT-X-TWITCH-INFO` with
the session's `SERVING-ID` and `STREAM-TIME`, the stream's age in seconds when usher served it. Twitch's
parser (the static `(String)` method reading `#EXT-X-TWITCH-INFO:`, `STREAM-TIME` and `SERVING-ID`) shows the
serving ID in the panel and drops the stream time. A hook at the parser's start hands the playlist to
`TwitchStats.masterPlaylist`, which keeps the start time on the `elapsedRealtime` clock per serving ID (16 at
most). The panel's rows are built in one lambda that turns each state entry into a label/value row
(`getLabel()`, then the row's `(String, String)` constructor, collected with `ArrayList.add`); right before
Twitch iterates that list into list items, `TwitchStats.statsRows` finds the row labelled "Serving ID" and
appends "Uptime" as `H:MM:SS`, made with Twitch's row constructor through a bridge stub. The panel rebuilds
its rows on every stats update, so the value counts up. VODs and clips have no stream time and get no row.
No request is added. Verified on the emulator on a live channel: the panel's Uptime read 4:23:37, five
seconds after the overlay's own counter read 4:23:32.

### Use native player

Live channels open in the React Native "Ultralight" theatre only when
`RNTheatreRouteDecisionKt.rnTheatreRouteDecision` returns `Route`. That needs the Eppo flag
`android-ultralight`. Twitch evaluates it, like its other per-account experiments, only for a signed-in
account; signed out it reads its default, off. Twitch's flag configuration (October 2026) gives it to
nearly every signed-in account on 31.5.2 or newer, so for them Home is React Native. A channel opened
there still goes through the route decision (`openChannel` → `routeChannelOpen`). Most Lurk playback, chat and
ad patches hook the native theatre. The method has no spare registers, so while the switch is on its
`isLiveChannel` parameter goes through `TwitchPlayback.routeLiveToReactNative` and reads false.
Twitch answers `RefuseNotLiveChannel`. Its two callers (`TwitchRNTheatreLauncher`,
`TwitchRNHostNavigationModule.routeChannelOpen`) treat every refusal the same way and open the native
theatre. VODs and clips are always native.

Signed out, Ultralight can be switched on for a test with Twitch's staff override: `user_type` set to
`staff` and `ultralight_enabled_override` to true in `twitch_user_prefs.xml`. Home is then React Native
but its feed asks you to log in; channels still open in the native theatre while the switch is on, though
Twitch's Ultralight splash can stay drawn over it.

### Fix stuck start screen

On the emulator, stock Twitch stalled on its blank `LandingActivity` in about 1 of 4 cold starts: 2 of
8 stock runs, and the same rate with Lurk's patches. `LandingActivity` routes only when two RxJava
subjects have both emitted: Branch's app-open result and the install-referrer properties. When
Branch's session callback never fires, the activity stays up with an idle main thread until the app
is closed.

The patch makes the routing method (the one logging `parse_launcher_intent`) run once per activity.
`onCreate` schedules a 5-second fallback that calls it if the activity is still up and hasn't routed,
and a late Branch answer is then ignored. With the patch, 16 cold starts gave 0 stalls; the fallback
fired twice. The `fix_stuck_start` switch (Interface, on by default) turns both off: every route runs,
as unpatched, and no fallback is scheduled.

Implementing this exposed a patcher pitfall. A non-range `invoke-static { p0, v0 }` in a method whose
`p0` maps above v15 (here v30) is dropped from the output without an error or warning. The same
happens to every instruction with four-bit register fields (`iget`, `instance-of`, `move-object`,
`const/4`, `if-eq`): Morphe's inline smali compiler prints the rejection to stderr and leaves the line
out. Two checks guard against it:

- The Twitch patches insert smali through `twitch/shared/Smali.kt`, which compiles each snippet,
  counts the instructions that came out and fails the patch unless every instruction line compiled.
  Calls are built with `invokeStatic()` (plain form up to v15, `/range` above), and entry hooks that
  need a parameter in a four-bit form copy it into a local first (`lowParameters()`).
- `tests/twitch/expected-hooks.txt` lists every extension method the patches call from app code,
  grouped by the settings key of the patch that injects it. `bin/test-twitch` runs
  `tests/twitch/verify_hooks.py`, which keeps the groups of the patches the APK includes (read from
  its settings registry) and checks each call is in the patched dex.

### Player: sleep timer, refresh, gestures and latency

The player patches hook IVS `CorePlayerImpl` (the SDK's names are kept) and Twitch's own control
paths. Calls into obfuscated Twitch methods go through empty extension stubs whose bodies the patch
fills in.

*Sleep timer* re-arms on every `play()`. It pauses through the Guest Star pause-all registry (native
and portal) and through `TwitchMediaSessionModule`/`FeedPlayerRegistry` (React Native), so background
audio can be resumed from its notification.

*Refresh stream* calls the error screen's Retry, `N1(0, true)`. For live that fetches a new token and
playlist; a VOD keeps its position. It's triggered by a long press on the settings gear of the live
(`player_control_overlay`) and VOD/clip (`player_control_overlay_widget`) overlays, or a long press on
the middle of the video. The gear's long-click listener is replaced only while the switch is on when the
overlay is built, so a player opened with it off keeps Twitch's gear as is; turning it on applies to
players opened afterwards (`UiBoundaryProbe refresh-off`).

*Player gestures*:
- change the three VOD skip constants, and swap Twitch's "10"/"30" icons for arrow-only copies made
  at patch time;
- add brightness and volume swipes through `DraggableConstraintLayout`/`ConstraintTheatreContainerView`,
  landscape only, leaving the middle fifth for drag-to-minimize.

*Force landscape* (`force_landscape`, off by default) also takes the shared player-view hook. While the switch
is on, each player view gets one attach-state watcher: once the view is attached under
`video_presenter_container` (the theatre's content, live and video alike; Home's feed and its Clips tab are
elsewhere) in a portrait activity, it asks the activity for `SCREEN_ORIENTATION_SENSOR_LANDSCAPE`, the request
Twitch's rotate button makes, and keeps the earlier request. When the view leaves the window it puts that back
if landscape is still the activity's request. In practice Twitch resets the orientation itself when the
theatre closes, so the restore only matters when it doesn't. Twitch's rotate button still turns the theatre
to portrait. Verified on the emulator: a live channel and a VOD opened in landscape (display rotation 90, log
`orientation: landscape for a player (was 2)`), back returned to portrait Home, and a clip link opened in
Home's Clips feed without rotating. Re-expanding a minimized theatre doesn't rotate again.

*Normal latency* sets `setLiveLowLatencyEnabled(false)` before native loads and overrides the React
Native and portal calls. On the emulator, latency rose from about 2 s to 6–7 s.

*Latency badge* (`latency_badge`, off by default) puts a small pill with the live latency ("2.4 s") at the
top left of the native player in the theatre. It is added through the shared player-view hook
(`TwitchPlayerViews.attached`) to the presenter's player view, a `FrameLayout`, only while the switch is on,
and polls once a second while attached to a window. The latency is the presenter's own getter: the base
presenter method returning `long` that calls the IVS wrapper's latency method (found by its `MediaPlayer`
field read and `getLiveLatency()` call), reached through a bridge stub. The pill shows only for a positive
latency and when the view sits under `theatre_root_container`, so Home's feed previews, VODs and clips get
nothing. Twitch's native player has no seek to live (only the React Native theatre has a DVR "jump to live"
pill), so a tap calls the presenter's Retry with `(0, true)`, the same call the error screen and *Refresh
stream* make: a new access token and playlist, which start at the live edge. Verified on the emulator on a
live channel: the pill read 2.3–2.7 s with low latency, a tap logged `jump to live from 2342 ms`, the stream
reloaded on a new serving ID, and Home's previews showed no pill. A stream far behind live wasn't reproduced
(the emulator's network throttle didn't raise IVS's latency), so recovery from a large delay is the reload's
usual behavior rather than something measured here.

Verified on the emulator, signed out, in the classic theatre. The React Native, portal and vertical
theatres are checked statically only. `UiBoundaryProbe gesture-hook` calls the patched
`DraggableConstraintLayout.onInterceptTouchEvent` on ART: its injected call claims a vertical edge
swipe with the switch on and leaves it to Twitch with the switch off. `overlay-destroy-view` does the
same for `VerticalTheatreFragment.onDestroyView`, whose injected call retires the view's chat feeder
before Twitch's own teardown. Both fail on an APK without the hooks.

### Fill screen

*Fill screen* (`fill_screen`, Playback, off by default; the patch is selected by default, like Kick's and
Rumble's of the same name) makes a landscape stream or video use the whole screen of a phone taller than 16:9,
the strip beside the camera cutout included, cropping the video's top and bottom instead of showing bars at its
sides.

Where the bars come from: from Android 11, Twitch's activities call AndroidX's `enableEdgeToEdge`, so the window
already reaches into the cutout area (`layoutInDisplayCutoutMode=always` in `dumpsys window`). But one insets
listener pads Twitch's full-screen containers, `fullscreen_layout` (where the theatre lives) among them, by the
WindowInsetsCompat types system bars, keyboard and display cutout (`0x28f`). In landscape the cutout's inset is
a strip at the short edge, and the theatre then fits a 16:9 video into what's left: on the emulator (1600x720
in landscape, a 136 px cutout inset) the theatre starts at x=136 and the video is 1280 wide at x=228, so the
cutout side shows 228 px of black and the other side 92 px.

One switch does both parts, as Kick's and Rumble's Fill screen is one switch: the issue asks for the zoom past
the cutout, and the cutout strip without the zoom would only move a letterboxed 16:9 video and leave bars on
both sides.

Three hooks, all through `TwitchFillScreen`:

- The insets listener, the `onApplyWindowInsets` lambda that pads by `0x28f` or, for other views, by its
  cutout-less sibling `0x20f` (found by both literals and its `View.setPadding` call). Its types go through
  `insetTypes`, which leaves the cutout out for the container of a player that qualifies. When a player starts
  or stops qualifying the extension asks for an insets pass, and Twitch's own listener sets the padding, so
  letting go gives Twitch's exact padding back.
- The native player view delegate's video sizing: the delegate is found by its constructor's
  `playback_view_container`, `error_frame` and `cc_tv` ids, and the method is its `(II)V` method that reads the
  display type enum (`AspectRatio`, `ForceCrop`, `MatchWidth`, which keeps its constant names) and fits the
  video container. The player's presenter calls it on every layout of the player view, so rotating, showing
  the chat or entering picture-in-picture checks again. Its start hands `measure` the player and the video's
  size.
- The React Native player's surface sizing, `PlaybackSurface.measureForContent` (the class keeps its name):
  its IVS resize mode goes through `surfaceResizeMode`.

A player qualifies in landscape, outside picture-in-picture, when its video is wider than tall and the player
covers at least 90% of the window apart from the cutout: not the player next to the chat (live's side chat,
a video's chat replay), not a minimized one. A native player must also sit under `video_presenter_container`,
the theatre's content (live, videos and clips; Home's feed previews are elsewhere).

For a native player that qualifies:

- Twitch fits its video container as usual, and the video surface inside it (a `TextureView`, or a
  `SurfaceView` for protected streams) is scaled until it covers the player: 1.25 for a 16:9 video on the
  emulator, the 1600x900 picture cropped to 1600x720. The player stops clipping its children so the container
  shows the scaled surface, and the player's parent still clips it at the player's edge. Twitch's own crop to
  fill (`ForceCrop`, its pinch to zoom) isn't used: Twitch takes the automatic picture-in-picture window's shape
  from the video container's visible bounds, and with `ForceCrop` those became 1600x720, so picture-in-picture
  opened at 20:9 with the video cropped. With the scale the container keeps its fitted size and
  picture-in-picture opens at 16:9 as before.
- Every view of the theatre beside the video (the control overlay, chat over the video, the stream's details,
  captions and ad overlays, Lurk's latency badge) that reaches into the cutout strip is padded by as much, so it
  stays where Twitch put it and only the video uses the strip. Views clear of the strip, such as a centered
  banner, are left alone. When the player stops qualifying, each view gets its own padding back unless Twitch
  changed it in the meantime.
- On Android 10, Twitch leaves the window's cutout mode at its default (it only goes edge to edge from Android
  11), so the extension sets `LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES` while a player qualifies and puts the
  window's own mode back after.

The React Native player (Twitch's Ultralight theatre, used only while *Use native player* is off and Twitch's
server routes a channel there) gets `ZOOM`, the IVS mode React Native's own "cover" uses, instead of `FIT`, and
its container's cutout strip in the same way. React Native keeps its own controls clear of the cutout, and its
picture-in-picture window is a fixed 16:9.

With the switch off, `measure` returns at once and the other two hooks hand back Twitch's value. Twitch's pinch
to zoom still works; with Fill screen on, pinching in doesn't bring the bars back in landscape. The patch records
`twitch.fill_screen.display_type`, `view_delegate`, `video_size`, `container_insets` and `rn_surface_measure` as
locators.

Checked: `tests/twitch/verify_fill_screen.py` (part of `bin/test-host`) runs the production helper against a
view-tree double of the landscape theatre with a cutout: the switch off, the claim (container padding, scale,
views beside the video), the player next to the chat, portrait, picture-in-picture, vertical and ultrawide
videos, the cutout on the right, the player leaving the window, a padding Twitch changed meanwhile, Android 10's
window mode and the React Native resize mode; breaking any of the claim's parts makes it fail. On the emulator,
signed out with *Watch without signing in*, with Android's "tall" display cutout emulation (`cmd overlay`):

- live, landscape, chat over the video or hidden: the theatre spans 0 to 1600, the fitted container is 1280x720
  and its surface is scaled to 1600x900; the back button stays at x=136, the stream's details likewise; with the
  cutout on the right (rotation 270) the settings button stays clear of it;
- live with the side chat and a video with chat replay: the 136 px strip and the fitted video as without the
  patch; with the chat hidden, a video fills the screen like a live stream;
- portrait, leaving the theatre (it rotates and minimizes) and picture-in-picture (398x224, the whole video):
  as without the patch, and returning from picture-in-picture fills the screen again;
- the switch off: the same view bounds as an APK without the patch.

A punch hole was checked the same way (#44, a Pixel 5): Android's "hole" emulation, a corner punch hole whose
safe inset is 199 px, on a 1080x2340 display at 440 dpi (`wm size`, `wm density`). In landscape, live, with the
chat hidden or over the video, and the hole on the left (rotation 90) or the right (rotation 270):

- the switch off: the theatre leaves the hole's 199 px strip out, and the fitted 1920x1080 video sits off center,
  309 to 311 px of black on the hole's side and 110 to 112 px on the other;
- the switch on: the theatre spans 0 to 2340, the fitted container is centered (about 210 to 2130) and its surface is
  scaled by 1.22, so the picture covers the whole screen; the chat over the video, the Follow, Bits and channel
  points buttons and "Send chat" stay where they were, clear of the hole.

The React Native theatre was reached only with a test build that forced Twitch's route decision (not part of
the bundle). On the emulator's 914 dp wide landscape window it showed the chat or extensions beside the player,
which Fill screen left alone; after React Native's own wide-player toggle the player covered the window, and
Fill screen used the strip with `ZOOM` while React Native's controls stayed clear of the cutout. Not verified:
a phone's real cutout (punch holes and notches only on the emulator's overlays), Android 10, protected
(`SurfaceView`) streams, and signed-in playback.

### Display ads, stitched ads and the playlist proxy

*Block display ads* wraps the four lazy creators of Twitch's `AdEdgeApi` Retrofit service
(`https://edge.ads.twitch.tv/`) in a proxy. The proxy returns `Result.error(IOException)`, Retrofit's
own network-failure result, which every native ad caller already treats as "no ad". That covers
stream display (squeezeback, lower third), audio, multi-format, headliner and feed ads. In React
Native:
- requests to `edge.ads.twitch.tv` fail inside `NetworkingModule`;
- the RN VAST player reports Twitch's `noAd` error;
- two equal-length Hermes edits remove RN feed ad slots (`extractAdSlots`) and FeedAd cards
  (`isEdgeVisible`).

Brand surveys, which replace unfilled feed ads, are dropped. Sponsorship and paid-promotion labels
are untouched.

*Mute stitched ads* watches each player's EXT-X-DATERANGE cues: the native player's `h(JSONObject)`
handler and the RN playback session's `handleMetadata`. The session is the one class that implements
both `PlaybackCommands` and `PlayerListenerTarget` (`PlaybackSlot` in 31.8.0, `PlaybackSession` in
31.7.0); its display is the RN player view, which in 31.8.0 is the `PlaybackEdge` the slot is
attached to, until it is detached or released. The patch adds two public static helpers to the
session, because its display and player getter are private and `handleMetadata` has one free
register; with no view attached the hooks do nothing. A break is keyed by the IVS player, so a cue
after the slot moves to another view covers that view instead. From `twitch-stitched-ad` until `twitch-stream-source`
= `live`, it mutes the IVS player through `setMuted` and covers the video in black. Twitch itself mutes
with the volume, so the user's own mute is untouched. A break also ends on a new stream, a release, or
a timer set from the ad's duration (capped at 240 s). The ad still plays for its full length.

*Avoid stitched ads* (on by default) is based on measurements taken on 2026-10-15, signed out, with
the app's Client-ID:
- A commercial reaches every full-quality session that's open when it starts, whatever the player
  type or platform (mobile_player, popout, embed, site, frontpage; android, web, ios).
- Sessions opened during a commercial get join-in ads within seconds.
- Android `picture-by-picture` and `autoplay` sessions got none, but stop at 360p.
- Only two commercials were observed in about 2.5 hours, so this rests on a small sample.

No full-quality player type avoids breaks, so the patch doesn't change the player type. Instead it
hooks IVS's Java HTTP client (`OkHttpClient.execute` for the request URL, `ByteBufferConsumer.consume`
for the body), which every Twitch player uses. When a media playlist's next segments are ads:
- it serves the playlist of an anonymous picture-by-picture session instead, renumbered by program
  date-time and marked as a discontinuity, so the player doesn't reload;
- it checks the stream's own playlist on each refresh and switches back once that is live again,
  without the old ad cues;
- a break past 4 minutes, an unreadable playlist or a backup that stops answering ends the switch;
- without a backup, Mute stitched ads applies.

When a break ends that way rather than by the stream's own playlist coming back, the stream returns on
a new session: a new `play_session_id` with the account's token while that token has more than a
minute left, otherwise a token requested with the Client-ID only, as for the backup. In the second case
the rest of the playback runs on an anonymous session, not the account's. Its effect on subscriber ad
exemption, minutes watched and Drops is untested; the description says so.

Playlist reads and backup discovery share a six-second monotonic budget, including queued work,
headers and continually progressing bodies. Compressed and expanded bodies are limited to 1 MiB.
Three I/O workers and eight pending operations bound stalled providers; cancellation releases the
caller even if a provider ignores interruption. Workers check cancellation before further reads and
chained requests. An expired discovery retains the already-read ad playlist so the existing mute
fallback still applies. Delayed responses cannot restore a retired source or regress the media
sequence; when a newer source cannot be fetched, the last accepted window is reused. If that rendition
has no accepted window yet, the consumer reports an error without delivering a retired or manufactured
empty playlist. Native IVS probes found repeated synthetic empty windows cause rapid polling.
Provider I/O runs outside the short stream state monitor; source generations prevent late workers
from overwriting a newer transition, and request hooks stay usable while old I/O remains blocked.
`tests/twitch/test_async.py` verifies these paths with local delayed/trickling HTTP and controlled
IVS providers. A permanently blocked platform provider can retain one worker until it returns;
the worker count stays bounded and saturated callers fail promptly or use the existing body.

`bin/test-twitch-ad-backup` runs the hooked consumer on ART against live Twitch playlists. A test
build with a faked break went 1080p → 360p → 1080p without a reload. No real commercial was caught
in the app.

Switching *Avoid stitched ads* off stops new breaks, not the streams it already changed. A stream on
a picture-by-picture session, or renumbered after one, keeps being served until it ends: its own
playlist has the original sequence numbers, and serving it as is would move the player's media
sequence. A break in progress therefore returns to the stream the usual way when it's over. Streams it
never changed pass unchanged from the moment the switch is off. `TwitchAsyncProbe disabled` checks
both cases.

*Playlist proxy* is opt-in and does nothing without its `proxyUrl` option. It sends live usher requests
to the configured proxy. Its switch starts on once a URL is set, since setting one is the opt-in. The
proxy sees which channel is watched and when, and receives the signed playback token in the request
URL: in the query when it takes usher's place, inside the encoded Twitch URL with `{url}`, so its access
logs can keep it. Whatever it returns is what the player plays, including segments of its own; the
description says so and to use only a proxy you trust. *Avoid stitched ads* reads
only `usher.ttvnw.net` master playlists, so a stream loaded through the proxy is never tracked: with
both patches on, the proxy alone decides what the playlists hold, and Mute stitched ads still acts on
any ad cues they keep. `TwitchAsyncProbe proxy` checks that a proxied master, in place of usher or with
the usher URL in its query, isn't consumed.

`bin/test-twitch-ads` runs these hooks on ART. Signed out, no display or stitched ads were served,
so real ad delivery is verified only through the probe and the emitted bytecode. The proxy was checked
end to end with a local test proxy.

### AMOLED black

*AMOLED black* (`amoled_black`, off by default, applies after a restart) blacks out the dark theme's greys on
screens drawn with Android views. A resource patch on the dark colors (`values-night` `background_body` =
`hinted_grey_1` #0e0e10, `background_base` #18181b, `background_alt`/`background_float` #1f1f23) can't be
switched off at runtime, and turning those colors into theme-attribute color lists would make every
`Resources.getColor` call without a theme return the fallback magenta, so the patch works at runtime instead.
A call at the start of `TwitchApplication.onCreate` registers activity callbacks; the switch is read at the
first activity and kept until the app restarts. In dark mode each Twitch activity gets a black window
background and navigation bar, and after each layout (a global-layout listener on the decor view, plus each
resume) every view background that is a `ColorDrawable` or a single-color `GradientDrawable` of the palette is
repainted: #0e0e10 and #18181b black, #1f1f23 #0b0b0d so cards stay apart. Lurk's own settings screen is left
alone. Compose screens draw their own backgrounds, and dialogs and bottom sheets are separate windows, so those
stay dark grey. Verified on the emulator with screenshots: Browse's background read #0e0e10 with the switch off
and #000000 with it on, and the theatre's player area, chat and leaderboard rows read #000000.

### Clip download

*Clip download* (`clip_download`, off by default) adds "Download clip" to the menu (⋮) of a clip in the clips
feed, where clip links and Home's Clips tab open. The menu is `DiscoveryFeedOverflowMenuFragment`, whose
`onCreateView` binds the sheet's view delegate to its presenter; right after that call,
`TwitchClips.overflowMenu(presenter, viewDelegate)` reads the presenter's `FragmentArguments` (feed item →
`getClipModel()` → slug, title, broadcaster; all unobfuscated model getters) and adds a row in the sheet's style
above Cancel. A tap closes the sheet and, on a background thread, asks gql.twitch.tv with the app's Client-ID
only for `clip(slug) { videoQualities { quality sourceURL } playbackAccessToken(params: {platform: "android",
playerType: "mobile_player"}) { signature value } }`. The clip CDN answers 401 without the signed token, so the
best quality's address gets `?sig=…&token=…` and goes to Android's `DownloadManager`, which saves it as
`Downloads/Twitch/<channel>-<title>-<slug>.mp4` with its own notification. Clips opened elsewhere (the theatre's
clip player, React Native) have no row. Verified on the emulator, signed out: the row appeared in a clip's menu,
and two clips downloaded as MP4s of 21.7 MB and 37.6 MB (`ftyp` header) into Downloads/Twitch.

### Interface: chat highlights, player buttons, Home and mature labels

Native Home is not React Native: RN Home and the Ultralight theatre run only with `android-ultralight`.
That includes the signed-out Home. *Hide Clips* therefore also filters the native Home tab provider at
its three users, keeping Clips when Home opens on a clip.

*Hide chat highlights* covers:
- the native highlight dispatch, by type ID (Hype Train, gift banners);
- the chat-notice mapper, by event and subscription kind;
- the private-callout dispatch (watch streaks);
- the leaderboard, pinned-cheer and celebration state constructors;
- in RN, early returns from the matching services, components and `LibraryTmiClient` handlers.

*Hide player buttons* filters the clip button state and live overlay options, every AndroidX
`MediaRouteButton` (Cast), and the VOD and vertical-theatre share buttons. *Hide Home sections*
clears the `ShowStoriesShelf` argument and filters the Following page's section list. *Hide mature
content warning* makes the label-acknowledgement check return true without saving anything; age,
region, guardian and account gates still apply.

*Hide Bits tipping* now also filters `ConfigureMessageInput(isBitsPickerVisible=)`. The classic chat
input reads its Bits button and tray from that state, not from the toolbar states.

The chat header, the row between the player and the chat (`ChatHeaderPresenter`: the channel's extensions on
the left, buttons on the right), offers Follow, Subscribe, Gift A Sub, Get Bits or Upgrade. Twitch picks
them from `ButtonsEligibilityState`, keeps the first two (three with Upgrade), and adds a Bits icon when Bits are
for sale but Get Bits didn't fit. A signed-in viewer who follows and subscribes sees "Get Bits" and "Gift A
Sub" there (#45); signed out it offers only Follow, since Bits and subscriptions need an account. The
state's constructor now filters:

- `isBitsButtonEnabled` through `bitsVisible` (*Hide Bits tipping*): no Get Bits and no Bits icon;
- `canShowUpgradeButton` through `subscriptionUpsellVisible` and `subscriptionState` through
  `subscriptionButtons` (*Hide subscription upsells*). The state is an enum whose constants keep their names
  (the patch checks for them); with the switch on it becomes `SUBSCRIBED` for a subscriber and `DISABLED`
  otherwise, the two values that offer neither Subscribe nor Gift A Sub.

The remaining buttons move into the free places. With none left, Twitch hides the row and moves the extensions
into the leaderboard row. Follow stays: it isn't a purchase. The patches record
`twitch.match.chat_header_buttons_state`, its two `twitch.ui_flag.chat_header_buttons_state.*` fields and
`twitch.hide_subscription_upsells.chat_header_subscription_state`.

`bin/test-twitch-interface` builds the real state and runs Twitch's own mapper from it to the buttons on ART,
for every combination of the two switches: a follower who subscribes (the issue's row), a viewer who neither
follows nor subscribes, a subscriber who can upgrade, and a signed-out viewer; `--stock` checks that the original
APK gives Twitch's buttons for all of them. On the emulator, signed out, a throwaway build (not part of the
bundle) forced the state to a following subscriber with Bits for sale: with both switches off the row showed
"Get Bits" and "Gift A Sub" as in the issue, with *Hide Bits tipping* only "Gift A Sub", and with both
switches on the row was gone. Not verified: a real signed-in account.

`bin/test-twitch-highlights` runs the real classes on ART with each switch on and off. Following
sections, Hype Train and the RN paths are verified only statically.

### Chat

*Anonymous chat* (off by default, restart) logs the native IRC socket in as a `justinfan` guest with
`PASS listen`, while the rest of the app stays signed in. The credential fields are found through the
`UserCredentials(nickname=, oauthToken=)` toString. React Native's `chatAuthOptions` returns its guest
login. The input shows Twitch's log-in restriction relabelled "read only", and the `SendChatMessage`
mutation returns Twitch's own failure result, so nothing posts under the account.

*Show deleted messages* keeps the text of deleted or timed-out messages, struck through. It covers
native lines already shown and messages that arrive deleted. React Native retention is limited to
verified received, ordinary chat bodies, including lines still waiting in the original chat-delay queue.
It preserves deleted flags and timing, suppresses content actions on newly retained rows, and leaves
hidden, unpublished, masked, AutoMod and low-trust content protected. Missing or invalid runtime helpers
use the original delayed-drop predicate. The setting requires restart. *Ignore chat clears* treats a `CLEARCHAT`
without a target user as a no-op, in native and React Native chat; timeouts and bans still apply.

*Chat timestamps* turns on Twitch's own history timestamp for live channel chat, not whispers, with a
24/12-hour choice. The choice replaces the `H:mm` pattern of the one formatter that also draws chat
history's timestamps, so it is read only while the switch is on; with it off, history keeps Twitch's
clock (`ChatArtProbe` checks both).

*Auto-claim channel points* (off by default, needs an account) calls the bonus chest's own claim action
once per claim ID, from the points button presenter's subscriber to the points store. The action takes
`(claim ID, ChatModeMetadata)`; the chest's two tap handlers read the chat mode from the chat UI's
state, which the presenter can't reach, so the patch passes null. That is safe in 31.7.0, checked
statically: the three implementations of the action null-check only the claim ID (R8's `getClass`
form of Kotlin's parameter check) and hand the chat mode to the claim's success callback, which reads it
behind `chatModeMetadata != null` for the `chatroom_type` field of the
`channel_points_client_bonus_points_claim` analytics event (blocked by Disable analytics). The patch
fails on a version where any implementation dereferences the chat mode before overwriting its register
(`neverDereferenced`, every path). Without an account, the claim was exercised on ART only with a
stand-in for the action, so the request itself is unverified.

`bin/test-twitch-chat <apk>` runs the real classes with each switch on and off. Signed-in IRC login
and bonus claims are verified only through bytecode and the probe.

*Auto-claim Drops* (`drops_auto_claim`, off by default, needs an account) has the same shape: it presses the
Claim button of Twitch's drops notification for you. The notification presenter of a channel (found by its
`translateChannelAvailableDropsResponse`/`translateAvailableDrops` lambda names) shows the first drop
presentation (`DropPresentation(change=…)`) of its list in one case of a merged Function1: it makes the view
state from the presentation and pushes it with `RxPresenter`'s state call. Right after that push,
`TwitchDrops.presented(presenter, presentation)` runs. When the presentation's drop is a `Claimable(…)` whose
instance ID it hasn't claimed in this process, it makes the presenter's own view-event handler (the
`(presenter, case)` lambda its view binding subscribes to the view's `EventDispatcher` with) and hands it the
Claim button's event, `Claim(claimingState=<the drop>, secondsPassedUntilClaim=0)`, through bridge stubs. That
is the handler a tap reaches: it marks the drop as claiming, sends Twitch's `ClaimDropRewardsMutation` with the
drop instance ID through the account's GraphQL client, and reports its "claim" analytics event (blocked by
Disable analytics). Drops earned while no notification is up (another channel, another device) stay in the
inventory; a failed claim isn't retried until the next start.

`bin/test-twitch-drops <apk>` (`DropsArtProbe`) runs the injection point with real `Claimable` and
`DropPresentation` objects and the real presenter, repository and claim service, with the GraphQL client left
out: off claims nothing; on, Twitch's handler runs and stops at the client's request method (`yuj.k` in
31.7.0), so the claim got as far as the request; the same drop isn't claimed twice, another one is, and a
presentation without a claimable drop isn't. The request, its account and integrity headers and the server's
answer were not exercised: Twitch's Apollo client can't be pointed at a loopback server on ART without
rebuilding the app's dependency graph, and no account exists to run it for real.

*Chat keywords* highlights native and React Native chat lines that mention you (your signed-in login) or contain one
of your highlight words, with a tinted row and an optional vibration. It hides lines with blocked
words or from blocked users. The word and user lists are Lurk's first text settings: a `TextSetting`
in the registry JSON, edited in a dialog on the settings screen. Words match as whole words in any
case. Blocked live messages are dropped at the chat list feeder, before the Chat overlay sees them.
History and VOD replay lines are marked by the shared line builder (`ChatMessageSpanGroup`) and
collapsed by the row binders.

*Compact chat* adds two switches, both off by default. *Hide badges* (`chat_hide_badges`) empties the badge
span right before the line builder puts a line's spans together (`ChatMessageSpanGroup`), after Twitch's and
the third-party badges went into it. *Emotes as text* (`chat_text_emotes`) makes the emote span builder (the
one the third-party emote click hook also uses) return the emote's code as a plain `SpannableString`, the same
code field Twitch writes into its own span, so no image span and no image load happen. *Highlight first-time
chatters* (`chat_first_chatters`, a patch of its own, off by default) uses the `first-msg=1` tag Twitch's chat
server puts on a chatter's first message in a channel. Native chat splits every IRC line into
`IrcEventComponents(messageTags=…)`; a hook at the start of its constructor keeps the `id` of such messages (512
at most). The line builder notes each line's message ID at its start and, at its end, marks the sender span
of a remembered one; the row binders (the same hook Chat keywords uses) tint that row green unless Twitch
shows it selected. All three cover native live chat; the first two also chat history and VOD replay, which
carry no `first-msg` tag. React Native chat is unchanged. Verified on the emulator, signed out, on a busy live
channel: no badges on any line, `LUL` and channel emotes shown as text, and a row tinted green right after
the log said `chat: first message <id>`.

*Chat appearance* sets:
- chat text size (`chat_text_size`, 70% to 200% of Twitch's; 85, 115 and 130, the first choices, stay valid);
- emote size and badge size (`chat_emote_size`, `chat_badge_size`, 50% to 300%);
- message spacing (`chat_message_spacing`, 25% to 300% of Twitch's space around a message);
- alternating row shading, numbered by arrival and skipping hidden lines;
- plain /me messages;
- the landscape chat column's width (the theatre guideline) and background opacity.

Every choice starts at "Twitch's default" (`0`). Text size and spacing are applied by the row binders' hook
(`TwitchChatStyle.bindRow`), after Twitch binds a row: the text view's size and minimum height (24 dp in
Twitch's style, which otherwise keeps small text from making rows shorter) are scaled, and so are the vertical
padding and margins of the row and its text view (live chat's container padding, 3 or 4 dp, and VOD replay's
text padding and top margin, 4 dp each). Twitch sets live chat's padding and size on every bind and VOD replay's
only when the row is made, so the values Lurk gave last are remembered to tell its own from Twitch's.

Emote and badge sizes are set where Twitch sizes every chat image span: the chat image loader's class has one
method that turns a placeholder's size class (Twitch's enum: `Emote` 24 dp, `GigantifiedEmote` 72 dp, `Badge`
18 dp, `Gif`, notice icons...) into a square box in pixels, used for the line's layout before the image loads and
to fit the loaded image. At each of its returns, `TwitchChatStyle.imageSize` scales the box of `Emote` and
`GigantifiedEmote` by the emote size and of `Badge` by the badge size; everything else keeps Twitch's size.
Third-party emotes are Twitch emote objects and third-party badges and pronouns are Twitch badge view models, so
they scale alike, and the wide-emote hook (`TwitchEmotes.sizeEmote`) widens the scaled box. The size class names
are checked in the enum's static initializer at patch time. While emotes are larger than Twitch's size, the
emote URL builder's scale (2 in chat) is raised to Twitch's largest image (3) at its start
(`TwitchChatStyle.emoteScale`), so large emotes stay sharp. Static third-party emotes follow it; animated
ones stay at 2x, as before, to keep their GIFs small. The image box is shared by every surface that draws
chat-style images (whispers, notices), so they follow the emote and badge sizes too.

React Native chat takes the finer text sizes through the same `scale` value (any whole percent from 50 to 200);
emote and badge size and spacing are native only, since RN's emote and badge components size themselves from
module constants.

React Native wrappers use the actual row, body, timestamp, text-metrics, selector and landscape-column
exports. History filtering preserves the original store and stable snapshots. Live keyword vibration
subscribes only while its store is mounted; history, deleted lines and rerenders do not notify.
All-off restores the original exports. `bin/test-twitch-chat-style` checks native styling on ART,
including mentions with a fixture account, the real image box at each size class with the sizes on and off,
and text size and spacing on real views bound twice (live) and once (replay) and then switched off;
`bin/test-twitch-rn` checks native RN bridge ownership. Verified on the emulator, signed out, on xQc's live chat
and a VOD's chat replay at 115% text, 175% emotes, 150% badges and 50% spacing.

The original floating one-chat overlay projects away the message type and omits store/channel props.
Its original host now publishes its genuine store and exact numeric destination/login through
tree-local React context after commit. Projected rows must match the canonical original line's
id/body/user/userId/source-room/deleted/hidden/unpublished fields before using provider or received
deletion privileges. Immutable authority rejects a changed destination before effects run; cleanup
retires only its own publisher. The original store hook runs once and returns unchanged, and the
host component type/key stays stable so drag/collapse/scroll state survives. There is no extra
network request, timer or global render provenance.

The column width/opacity settings target `landscape-column-chat`, reached through the original
video double-tap cycle; floating one-chat retains its stock opacity. Nondefault column opacity
uses the existing empty background as black and existing foreground as theme color with alpha,
then clears only the two measured covering fills in ClassicChatColumn/ChatArea. Header/composer,
text/emote colors, player, gutters and actions keep their original styles. A stable React Provider
carries primitive opacity or neutral null without adding a native View or remounting chat when
opacity changes. While wrappers are installed, neutral paths preserve original native styles and
child objects, rather than literal outer React object identity; full configure-off restores the
original exports. Unknown shapes keep stock handling. The visible opacity controls and real provider
images were checked on a phone on 2026-10-18, after the earlier style-only readback with cached
badge/pronoun metadata.

The original RN live store is keyed by channel login. Keyword notification ownership preserves that
bounded login exactly; provider row acquisition independently uses the numeric channel/source-room ID.

The compiled chat reads Lurk's chat settings through one synchronous native call and keeps them until
the native side invalidates them, which it does whenever an activity resumes (Lurk settings is an
activity of its own), or until `configure` runs. Rows, message bodies, timestamps and the history
selector share that read instead of asking per render, and keyword verdicts are cached by line
content per config revision. `TwitchRNChat.config()` builds its JSON only when a value or the keyword
lists changed. `tests/twitch/test_chat.js` counts the native calls.

The pinned live RN owners are discovered by unique exports in Hermes98, with an additional compiled
bundle installed before consumers render. Both embedded and prepared main bundles retain
`assets://index.android.bundle`; ReactInstance and native-module teardown retire their own state.
The source/deleted-predicate bundles use the pinned official compiler. The original122-byte delayed
callback cannot hold the guarded fallback, so a verified241-byte compiled body is appended with its
full37-byte header and exception metadata. Off restores the original header, length and checksum.

VOD navigation is positively native: `TwitchRNHostNavigationModule.openVodInternal` constructs a
`PartialVodModel` and invokes the native theatre router. Native replay token/binder hooks apply there;
no separate RN replay renderer was established. Signed-out RN smoke uses an isolated final rollout
routing override, preserving earlier route/auth gates, followed by exact production restoration.
Actual guest Fabric rows and actual-store local moderation fixtures establish consumer integration;
these fixtures do not establish authenticated server moderation, sending, or physical-phone rendering.

### Third-party emotes and badges

Both are opt-in: every switch starts off, and its summary names the hosts it contacts. Emotes hook
Twitch's own whole-word matcher (`clientParsedEmotes`). They add 7TV, BetterTTV and FrankerFaceZ
emotes as Twitch emote objects with synthetic `lurk…` IDs, and the central emote URL builder maps
those IDs to each provider's CDN. Animated emotes use GIF; static ones, or all of them when Twitch's
animated-emotes setting is off, use PNG.

Native live chat builds every message's line model in one place (the mapper that turns chat events into
`LiveChatMessage`s calls the matcher for chat, notices, replies and shared chat), whether an account is signed
in or not; signing in changes the IRC login, not that path (checked in the bytecode; not run signed in).
Signed in, the set the matcher reads starts with the account's own emotes (Twitch's `UserEmotesQuery`) and
Lurk's follow, so Twitch's emote wins a code both have. Twitch's per-account experiments make Home React Native
for signed-in accounts (see [Use native player](#use-native-player)); the only one the matcher itself consults
(`mcl-gifs-parsing-killswitch`) switches how GIF tokens render. A channel's chat delay holds the same message back without changing its path. A
service turned on while a channel is open loads its lists with the next message, without rejoining (checked on
the emulator: xQc's 7TV list arrived about a second after the switch, and the next lines had 7TV emotes). A
channel with no set on a service still gets the service's global emotes; a 404 for the channel is an empty list,
not a failure (checked on a channel none of the three services knows: three empty channel lists, then the
global ones). The landscape one-chat overlay of the native theatre is native too and gets the same emotes.

VOD replay splits its named message tokens. React Native chat gets `emotes=` ranges added to incoming
IRC frames, and its `ImageSource` maps the same URLs. Compiled RN row wrappers additionally enrich
history with cached emote/badge/pronoun snapshots. Offsets use Unicode code points, matching Twitch's
segmenter, and native emotes retain precedence. Provider effects explicitly acquire/release demand;
reading a catalog or IRC frame never schedules requests. One runtime timer polls a small native
revision token every two seconds while committed provider rows exist; unchanged tokens do not refresh
rows or fetch catalogs. Cache publication, badge/pronoun image availability and switch changes invalidate
mounted rows. Last release, all-off and module disposal stop polling. Lists are fetched in background workers;
failed/missing data leaves codes as text. Queues, per-room caches and snapshots are bounded. Queued
work rechecks switches and surviving owners before each new request, preserving shared native demand.

*Emotes in the picker* (`emotes_picker`, off by default) puts the same emotes in the native emote picker and
the chat input's autocomplete. The picker's presenter (`EmotePickerPresenter`, found by its
`createEmotePickerState` reducer name) combines the user's emote sets with the channel's in one Function3 case
that R8 merged into a shared lambda class; the case is found by its argument casts (presenter, `Tuid`, `List`,
two `Optional`s). Right after the `List` cast, `TwitchEmotes.pickerSets` appends one `OwnerEmoteSet` per
service, owned by an `EmoteOwner` with a negative ID no account has and the service's name as login and
display name. Twitch then groups it like any channel's set and builds the section itself: a header with the
service's name (no avatar), the emote items made with its own `D2`, and its own tap handling, which inserts the
code. The emote objects are the `WithOwner` ones chat's matcher uses, so their images go through the same URL
hook. Autocomplete's filter asks its current source (chatters, emotes or commands) for matches through one
interface call; that call goes through `TwitchEmotes.autocomplete`, which makes the same call and, for the emote
source only, merges in the services' emotes of the channel whose chat connected last: codes starting with the
typed text after Twitch's own, then codes containing it, without codes Twitch already has. Both read the cached
lists chat loads; no other request is made. The constructors, the source's interface methods and the emote's
code getter are reached through bridge stubs filled at patch time.

Signed out, Twitch shows "Login to Chat" in place of the chat input, so neither the picker nor autocomplete can
be opened on the emulator. `bin/test-twitch-emotes <apk>` (`EmotePickerArtProbe`) runs the real presenter case
with Lurk's cache filled as if the services had answered: with the switch on it builds a "7TV" and a
"BetterTTV" section holding the channel's and global emotes, with it off (or no service on) none. It runs the
real autocomplete filter over Twitch's emote source for `:pe` and checks the order and the duplicate rule, and
that a chatter source keeps its own answer. Drawing the sections and inserting a tapped emote are Twitch's
unchanged code but were not seen in the app.

Badges download FrankerFaceZ's and Chatterino's public lists of badge holders and match them on the
device, so no chatter is looked up. Badge images come from the https addresses in those lists:
FrankerFaceZ's are on cdn.frankerfacez.com; Chatterino's are on fourtf.com today, but the host is
whatever Chatterino's list names, which the descriptions say. Holder and chatter IDs are 64-bit. The exception is *pronouns* (`badges_pronouns`, off by default):
pronouns.alejo.io has no bulk list, so the username of each chatter whose message you see is looked
up there.
- Answers, including "none", are cached for an hour, for up to 2000 users.
- Duplicate lookups are merged, at most 4 requests a second.
- A chatter's first line can appear before the pronoun is known.
- Pronouns are drawn as a small text badge.

*Chat overlay* (off by default) scrolls live chat right to left across the top of the video, like
danmaku. It's fed from the native chat list feeder, found through the `LiveChatMessage(messageId=`
toString. The overlay is a plain view on `android.R.id.content` that ignores all touches. It attaches
only in landscape outside picture-in-picture while a video surface covers at least half the width,
and detaches in portrait, in picture-in-picture, when the video goes away, or after 15 s without
chat. The exact viewer feeder owns posted messages. Its stream-model observer retires the former
destination without waiting for another message, and onDestroyView retires that feeder without removing
a newer viewer's overlay. A recreated view can reuse the feeder with fresh state. This takes effect at
the measured model emission or teardown, not before a navigation intent reaches either boundary.
React Native chat, VODs and chat replay don't pass through that feeder. With the switch off, a message
costs one settings read: the main thread gets a task only to remove an overlay still on screen, once
(`UiBoundaryProbe overlay-off-idle`).

Twitch already loads recent chat history on join (native
`ChatHistory`, RN preload) and replays VOD chat, so a third-party history service isn't used.

### Emote and badge info

*Emote and badge info* (`chat_emote_info`, a patch of its own, selected by default, switch off) shows a small
sheet when an emote or a badge is tapped in native live chat, chat history or VOD chat replay: the image larger,
its name (the emote's code, or the badge's title), where it comes from ("7TV channel emote", "Twitch global
badge", "FrankerFaceZ badge", "Pronouns from pronouns.alejo.io"...), who made or added it when the service's list
says (7TV's `data.owner`, BetterTTV's shared emotes' `user`, FrankerFaceZ's `owner`), and a *Copy name* button.
The sheet is a plain framework `Dialog` with views made in code, at the bottom of the screen, in the colors of
Twitch's dark or light theme (the activity's night mode, which Twitch's theme setting sets).

What Twitch does on a tap:
- an emote carries a click span that opens Twitch's emote card, but Twitch opens the card only for a signed-in
  account (`isLoggedIn` before the card's fragment); signed out, the tap does nothing;
- a username opens the viewer card (signed out, nothing showed on the emulator, with or without the patch);
- a badge has no tap action;
- a long press anywhere on a line opens Twitch's message menu (Reply, Copy). The chat text view's movement
  method sees the long press first and swallows its release, so spans never get it.

The hook sits where the line builder puts a line's spans together (`ChatMessageSpanGroup`, the same point Compact
chat uses): the badge span and the message span go through `TwitchChatInfo.badges`/`message`, which put a tap
span (`ClickableSpan`) over every image span without a tap of its own: all badges, and emotes whose image URL is
Twitch's or a service's (cheermotes and GIFs keep Twitch's handling). Twitch emotes keep Twitch's emote card span
while an account is signed in (Twitch's user preferences hold its login); signed out, Lurk's span goes over it with
the highest span priority, so the chat's `LinkMovementMethod` picks it and the tap shows Lurk's sheet instead of
nothing. Turning the switch on applies to lines built from then on; with it off, a tap span left on an older line
does nothing.

The URL and size class of an image span come from Twitch's placeholder drawable (the class the chat image box
takes, with a single `String` field) through two bridge stubs, `isPlaceholder` and `placeholderUrl`, filled at
patch time. Badge titles come from Twitch's badge registry: the method that looks a badge key (set ID and version)
up in the channel's badges, then the global ones, gets a hook right after each lookup's cast
(`twitchChannelBadge`, `twitchGlobalBadge`), which keeps the last 512 URLs with their set, version and scope. The
key's `BadgeKey(setId=…, version=…)` toString is checked at patch time and parsed at run time. The title follows
Twitch's own where it's known ("1-Year Subscriber", "Tier 3 6-Month Subscriber", "cheer 1000", "50 Gift Subs",
"Prime Gaming", "Verified"), else the set ID in words. Third-party emotes are found in Lurk's cached lists by the ID
in their CDN URL, preferring the channel whose chat is open, then any channel, then the global list; third-party
badges and pronouns by their image URL. Opening the sheet loads one larger copy of the image (Twitch 3.0, 7TV 4x,
BetterTTV 3x, FrankerFaceZ 4, falling back to the chat's URL) from the host the chat image came from, at most 4 MB,
decoded with `ImageDecoder` so animated emotes move; nothing else is sent.

React Native chat is unchanged: its emotes have their own `onPressEmote` callbacks and no native spans.
`bin/test-twitch-chat-style` (`ChatStyleArtProbe`) runs the real line builder with a Twitch badge view model and
checks the tap span with the switch on and off, the tap spans over Twitch, 7TV, cheermote and GIF images signed
in and out (including the span order), the badge registry hook's titles and the larger-image URLs;
`test_providers.py` checks which list a third-party emote came from, and `bin/test-twitch-providers` the owner and
title fields of each service's list. Verified on the emulator, signed out, light and dark: a 7TV channel emote
("NAHH", "by itsCerv"), a Twitch emote ("LUL"), a channel subscriber badge ("2-Month Subscriber", "Twitch channel
badge"), a global badge ("Twitch Recap 2025"), FrankerFaceZ's supporter badge, a pronoun badge and a 7TV emote in
VOD chat replay; *Copy name* put the name on the clipboard; a long press on an emote opened Twitch's Reply/Copy
menu, not the sheet. Twitch's emote card and viewer card for a signed-in account were not checked: no account.

### VOD chapters

*VOD chapters* (on by default) adds a Chapters button next to the rotate button in the native VOD
player's overlay. It reads the video's `moments(momentRequestType: VIDEO_CHAPTER_MARKERS)` (position,
duration, game) from gql.twitch.tv with the app's Client-ID only, since chapters are public. That
is one anonymous request per video the native VOD player loads, feed previews included, which the
description and switch summary say. This shares one background request per video between prefetches
and open overlays. Two chapter jobs run
at once with eight queued; successful results and failure backoff each retain at most 32 videos.
Failures retry after 15 seconds. Each load keeps at most eight weak owners, and at most 32 pending
buttons can wait for a dialog. Requests use the same six-second monotonic budget and 1 MiB body
limit as playlist I/O. Tapping a row seeks through Twitch's own VOD seek.

Feed previews also load VOD presenters, so the button finds its video through its own overlay: the
presenter whose visible player view lies under it (captured in the base presenter's view binding),
mapped to the video it loaded. That binding has one hook, `TwitchPlayerViews.attached`, which Refresh
stream and VOD chapters share: whichever patch runs first inserts it, and it passes the view on to
each included patch. `VodModel.getId()` carries a `v` prefix that GQL rejects, so the
prefix is stripped. Pending dialogs check the original presenter, video, overlay attachment and
current setting before appearing. Player-view detach callbacks retire both prefetch and open demand on the main thread; an old
attachment cannot retire its replacement. Navigation and disabling chapters retire queued/provider work;
results remain shared when another owner still needs that video. `tests/twitch/test_vod_requests.py`
covers sharing, retry, eviction, queue/waiter bounds and stale delivery using platform HTTPS, JSON
and UI doubles; it does not verify Twitch's live GraphQL schema or actual Android rendering.
Verified on the emulator: the dialog listed a VOD's three chapters, and tapping
the second seeked to 26:29.

### Tablet layout, navigation bar position and Force ExoPlayer

*Tablet layout* makes Twitch read its tablet resources as true. `isTablet` switches the form factor
to Tablet, so Home and the player rotate and the player shows chat beside the video in landscape.
`is_tablet` only affects the cast dialogs. `following_drawer_use_sidebar` gives the navigation rail,
in landscape only unless "Navigation rail in portrait" is on: signed in, Twitch opens its 320 dp
Following sidebar next to the rail, which would leave almost no room in portrait.

*Navigation bar position* inflates a copy of the main layout with the bar anchored at the top and
hands the gesture-bar inset to the screen, or hides the bar's labels.

*Force ExoPlayer* sets `PlayerConfiguration.forceExoPlayer` for HLS content. Live channels and
videos then play on Twitch's dormant ExoPlayer 2 backend, which still sends `player_backend=Exo2` to
usher; Twitch itself only uses it for MP4 feed and story items. Clips and encrypted streams stay on
IVS. Lurk's IVS hooks (Normal latency, Mute stitched ads, video stats, quality names) don't apply to
ExoPlayer. `androidx.media3` in the APK is the React Native transparent-video view, not playback.

All three were verified on the emulator signed out. The Following sidebar is checked only
statically.

### Declined

These features appear in other Twitch bundles and mods but are deliberately not built:

- **Twitch debug mode** (ReVanced): the debug menu (`debug_app_actions`, RN `canReachDevTools`)
  is staff-gated, and release builds fold the debug-build check to false. Reaching it means passing
  the app off as a staff account, or bypassing the staff gate on a menu whose tools change experiment
  assignments, GQL and Spade endpoints, latency and ad behaviour on Twitch's service. *Show video
  stats* covers the debug view viewers use, the player stats panel.
- **Disable Google Play services** (PurpleTV): Play services carries push (see *Fix notifications*),
  Google and FIDO sign-in, Cast, Play Integrity attestation and billing. A blanket switch would break
  them; the analytics SDKs that use it are blocked individually instead.
- **VOD unlock / VODHunter** (PurpleTV: sub-only and deleted VODs): not implemented. The sub-only
  part was not built. Recovering deleted
  VODs doesn't work in any case: for broadcasts whose VODs are gone, every VOD CDN host answered 403
  for the computed playlist path, so the segments are removed.
- **Third-party recent chat history** (PurpleTV, Xtra: recent-messages.robotty.de): Twitch already
  loads its own recent messages on join (native `ChatHistory`, the RN preload), and VODs replay their
  chat. A third-party source would duplicate lines and send each joined channel to another service.

## Implementation evidence

### Privacy and client ads

Native Spade dispatch completes the nullable success callback exactly once rather
than leaving callers waiting. The native batch transport is also guarded. RN's
`createSpadeReporter` retains its object/API while enqueue and flush return their
normal synchronous `undefined`. Local SDK consent lookup returns the actual Denied
enum without writing the account's consent model. ComScore's local permission is false.

Branch retains its SDK request/callback state machine with tracking-disabled mode
forced on and explicit event reporting suppressed. That mode permits some link
requests; the patch does not claim zero Branch traffic. Sentry's three startup
providers and explicit initialization are guarded. Crashlytics' automatic collection
arbiter and both collection setters are disabled, along with explicit report-send,
log, exception and user-ID methods. The `setCustomKey` overloads have no spare register,
so the internal method they all call is guarded instead. Its fatal handler may still retain local crash
files. Firebase's initialization provider and messaging remain intact. No
Firebase Analytics implementation was found in this APK.

The cookie patch changes only `ConsentOptions.shouldShowNotification`. Manual
settings, vendor values, age restrictions and DMA fields retain their original
values. Pair this with Disable analytics when local SDK restrictions are desired.
The ad patch targets one branch of a merged RxJava callback and returns the same
`Optional<Boolean.FALSE>` as Twitch's own `decline_all_ads` path. Other synthetic
branches remain unchanged. Authenticated streaming is needed to measure its actual
ad coverage; this is not a SureStream/server-side ad remover.

### Playback and sharing

Feed previews change the missing `autoplay_enabled` fallback to Never in both the
initial getter and observer. Existing Always, WiFi-only and Never values remain
authoritative. The next-video control is separate: it hides/cancels the native
recommendation countdown after binding the manual Play card, gates only the automatic
dispatch event, and disables the RN feed's automatic clip-advance hook. Manual
selection and swiping are preserved. This version has no implemented native getter
for the RN clip-advance preference, so Lurk's next-video switch controls that path.

Quality defaults affect missing native live/VOD/clip preferences, the last-used
video fallback after audio-only playback, and an absent RN `preferred-video-quality`
storage row. They never replace saved values.

The native player (live, VOD, vertical video) selects a rendition by its exact IVS
name, and Twitch names the source rendition like `1080p60 (source)`. Lurk's Source
choice is stored as `chunked`, the source's HLS group ID, which is never a name. While
a default is chosen, a hook at the start of the player's select-by-name resolves
`chunked`, or a named choice that is the source (`1080p60` for `1080p60 (source)`), to
the full name; exact names and Auto pass through. Requests made before the qualities
load are retried by Twitch through the same method. Native clips use `ClipQuality`
strings without frame rates (`source`, `1080`, `720`, `480`, `360`; 160p maps to the
smallest clip quality, `240`), and Twitch picks the closest one a clip has.

*On mobile data* (`video_quality_metered`, under Default video quality, "Same as on Wi-Fi" by default) is a
second choice that replaces the default wherever the default is used, while `Network.isMetered` says the
active network is metered (mobile data, or Wi-Fi marked as metered) and only when it is lower than the
default; Twitch's own default (Auto) counts as the highest. The network is asked each time a default is
looked up: at the native player's select-by-name and preference fallbacks, and for the RN storage row and
the last-used fallback at startup. A saved player choice still wins on any network. `PlaybackLinksProbe`
(`verify_playback_links.py`) covers the ranking, the network double and every lookup. Verified on the
emulator with Source as the default and 480p on mobile data: on Wi-Fi the stats panel showed `chunked` at
1920x1080; after `svc wifi disable` (the cellular network is metered) and a restart it showed 852x480 at about
1 Mbps, and the log said `quality: metered network, 480p instead of chunked`.

RN shares one exact rendition name across content types (after mapping `p30` to `p`);
if that name is unavailable, its existing effect resets to Auto and saves that. Source
has no fixed name, so it leaves the RN row absent and RN players start on Auto. Named
resolutions require an exact match, including frame rate, apart from the source suffix
on native players. This is not a nearest-resolution selector and does not force a
bandwidth minimum.

Sharing hooks cover six native/RN intent-producing methods and three clipboard
boundaries. They clean only `EXTRA_TEXT` among intent string extras and preserve
unchanged clipboard objects. Known UTM/click parameters and `tt_*` campaign fields,
including the `tt_click_id` UUID generated by this build, are removed. Timestamp
parameters, clip identifiers, unknown parameters and raw URL encoding are preserved.

### Interface and entitlement

RN Home filtering removes Clips from the tab labels, index model and pager children
together. Explicit clip requests, including initial requests with an empty Following
feed, use Twitch's existing native clip player. The initial effect retains its
deduplication so rerenders do not open the same clip repeatedly. Native channel tabs
filter the app's own `EnumEntries` through a read-only proxy, preserving the expected
interface and order. Explicit clip IDs, clip content and Clips profile scopes retain
their native tab. Native and RN Bits
flags are disabled, while dedicated purchase/tray/one-tap components return null.
Ordinary received chat messages are not filtered.

Subscription suppression distinguishes Subscribe/Gift states from existing
subscription state. RN Subscribe rendering retains the subscribed indicator through
normal, icon and cached-render paths. Dedicated Gift, Turbo and Theatre ad-upgrade
components are hidden. Native Turbo signup/startup offers and the account promotion
row are skipped; existing Turbo members retain their management row, and Subscriptions
and Drops remain. Intentional paywalls, direct purchase flows and other WebView
promotions are outside the tested hooks.

`UserModel.getHasTurbo` feeds stored profile/observer state and multiple consumers,
including portal state, promotion UI, player analytics and Drops. RN also queries
`hasTurbo`/`turboStatus` separately. Changing this bit cannot establish signed playback
or account entitlement, so no `Unlock Turbo` patch is advertised.

### Runtime settings and Hermes

Only included patches register controls in Lurk's non-exported settings activity.
Settings initialize before affected SDK providers and at Application startup, once
per process.

The screen has three ways in. The settings patch adds a **Lurk** row to Twitch's own Settings
screen, after Privacy Notice. That screen comes in two versions, and `SettingsActivity` picks one
when it opens: signed in, the Compose `MainSettingsFragmentV2`; signed out with the logged-out
experiment (which Watch without signing in turns on), the list `MainSettingsFragment`. Signed out
without the experiment, Settings isn't reachable at all: the activity sends you to the landing
screen. The gear on the signed-out Log In tab opens the list version.

- Compose version: the section composable that draws System through Privacy Notice (found by those
  five string resources) calls one row composable, `row(title, description, onClick, icon, ?,
  composer, $changed, $default)`, for each. A method added to the section's class draws the Lurk
  row the same way, with Twitch's `ghost` icon and an onClick from `Settings.openAction(Class)`:
  R8 renamed Kotlin's `Function0` in Twitch, so the extension implements the type the row takes
  as a proxy. The call goes right after the Privacy Notice row.
- List version: the presenter's list builder (no parameters, the same five strings) adds a menu
  row model per destination. After Privacy Notice, `TwitchSettingsRow.addMenuRow` adds one titled
  Lurk with no destination, made by a bridged constructor call. Twitch's row tap handler (the one
  `invoke-interface` taking the destination enum) ignores a row without a destination, so its
  first instruction now asks `TwitchSettingsRow.menuRowClicked`, which opens Lurk settings for the
  Lurk row (by identity) and lets every other row through.

The launcher shortcut (`lurk_settings`) is pushed to the top of the app's dynamic shortcuts at
every start on Android 11 and newer: Twitch publishes a conversation shortcut for each whisper
notification with `pushDynamicShortcut`, which puts the newest first and moves the rest down, and
launchers show only the first few. Before Android 11 it is added once and updated when the app or
Lurk version changes. And an exported `activity-alias` of the settings activity answers
`android.intent.action.APPLICATION_PREFERENCES`, which Android's App info page turns into
"Additional settings in the app". The activity itself stays non-exported and reads nothing from
the intent that starts it, so another app can only open the screen.

Checked on the emulator, signed out: the list row opens Lurk settings and Back returns to
Twitch's Settings; App info › Additional settings in the app opens it; a direct start of the
settings activity from the shell is refused while the alias opens it; five conversation shortcuts
pushed as the system user put the Lurk shortcut at rank 5, and the next start of Twitch puts it
back at rank 0. The Compose version was checked signed out in a test build that swapped the
fragment (not part of the bundle): the row draws with the ghost icon after Privacy Notice and
opens Lurk settings. Reaching it the normal way, signed in, needs an account and wasn't checked.

The original Hermes v98 bundle SHA-256 is
`059f4713e0cea80b58e68b675fb05d63053056869e2ac60c79f5d57567a3e583` (31.8.0).
Patch-time parsing pins that hash/version, verifies function boundaries and unique
instruction patterns, and permits only equal-length non-overlapping edits. Every edit also passes
`HermesBundle.requireSafeEdit`, which decodes the function with the v98 instruction lengths
(generated from hermes-dec's hbc98 definitions) and reads its jumps, `UIntSwitchImm` jump tables and
catch table. An edit must start and end on instructions and its replacement must decode to whole
instructions. Nothing outside the edit may jump into its interior, since the helpers pad with
`Unreachable` (0x00), which aborts the app. The one exception is a landing instruction from which the
replacement keeps the original bytes: Hide subscription upsells' cache-hit path still reaches the
same `Ret`. Edits in one function are also checked pairwise, together when they share a setting and in
any combination when they don't. A function with a `StringSwitchImm` is refused, since its table isn't
decoded. `bin/test-twitch-interface-hermes` runs `HermesEditSafetyProbe.kt`: every function of the
stock bundle must decode, and padding over a real jump target must be refused. The
runtime loader snapshots switches. When every switch is at its patch-time default it
loads the embedded asset as is and deletes any earlier private copy; otherwise it
validates the embedded hash and edit manifest, applies original/replacement bytes,
recomputes the Hermes footer and writes a private copy. All switches off must
reproduce the independently hashed stock bundle. Changes require a restart.
Next to the copy, `lurk-twitch.json` records what it was made from (the manifest's SHA-256, the
embedded bundle's SHA-256 and the switch snapshot) and the copy's length and modification time. A
later cold start with the same selection loads the copy without reading or hashing the 28 MB asset;
any difference, a missing sidecar or a copy changed since it was written means a rebuild, and the
sidecar is deleted before a rebuild starts. Android clears the code cache on app updates.
`bin/test-twitch` checks reuse, rebuilds on a changed switch, a modified copy and a missing sidecar,
and that the defaults remove both files.

The shipped release `RNSourceModePolicy` disables Metro and selects the embedded
asset through `RNReactHostFactory` and `DefaultReactHost`; the file path argument is
null. The native asset loader is the hook. Although HotUpdater SDK classes are
present, no app call selecting a HotUpdater bundle URL was found, so no speculative
update bypass is added.

## Verification and limits

The test device is the disposable Android 16 x86_64 `emulator-5580`. Original
Twitch and the patched clone install together. Resource checks cover the label,
all icon layers, exact permission delta, every provider authority (ten in 31.8.0) and their
protection attributes, component class identities, the non-exported settings activity and its one
exported alias, which answers only APPLICATION_PREFERENCES (`tests/twitch/verify_resources.py
--settings`).
The patched APK passes signature and 16 KiB alignment verification; Android's
package compilation in verify mode succeeds.

The real settings activity displays included controls, publishes a launcher
shortcut, persists analytics off/on changes, and restarts into a new process from
its Restart Twitch action. Both states reach the same sign-in screen as stock
without fatal exceptions, missing-method errors or verification errors in the
captured startup logs. The native-only ad/consent selection has exactly two controls,
leaves the RN loader untouched and retains the original Hermes asset without a
manifest. The independent interface/playback selection also patches successfully.

Moving to 31.8.0 was checked on 2026-10-29: with every patch selected and without `-f`, all 54
patches apply to both stored bundles (the phone bundle with a Playlist proxy URL set, so that its
hooks are emitted too), and `bin/verify-hooks` finds all 140 expected hooks; the default selection
applies its 42. `bin/test-host`, every `bin/test-twitch*` probe and the Python output checks listed
below pass on the patched emulator bundle, and their stock negative controls see Twitch's own behavior. The
default build, signed out, starts on Home, plays a live channel in the native theatre with chat, and
opens Lurk settings from the Lurk row in Twitch's Settings.

Android probes execute the injected loader and actual app classes, not stand-ins
for the target methods:

- `bash bin/test-twitch <patched.apk>`: every injected extension call of the included patches
  (`expected-hooks.txt`), then embedded defaults, process snapshot, independent switches and exact
  all-off reconstruction of the original bundle.
- `bash bin/test-twitch-privacy <patched.apk>`: real Spade callback once/null/off
  paths, completed client-ad emitter, Crashlytics upload permission and four
  dispatch guards. Disabled controls reach the deliberately empty original
  dependencies, proving they resume original execution.
- `bash bin/test-twitch-interface <patched.apk>`: real enum ABI, ordering,
  immutability and original-list identity, plus native Bits state constructors and the chat header's buttons
  through Twitch's own mapper. `--stock <base.apk>` runs the original enum/chat/chat header negative controls.
- `bash bin/test-twitch-playback <patched.apk>`: real recommendation binding with
  next-video suppression off must reach the original progress-bar operation.
  `--stock <base.apk>` runs the original control path.
- `bin/test-twitch-interface-hermes <stock.bundle> [patched.bundle]`: production transforms and
  actual caller instructions for the two-tab model/pager, initial selection, swipe
  bounds, explicit native clip callbacks and empty-feed initial-effect deduplication.
- `bash bin/test-twitch-emotes <patched.apk>`: the emote picker presenter's section building and the
  autocomplete filter with *Emotes in the picker* on and off (`EmotePickerArtProbe`).
- `bash bin/test-twitch-drops <patched.apk>`: *Auto-claim Drops* through the drops notification's own Claim
  handler, once per drop, only for claimable drops (`DropsArtProbe`).

The Python verifiers under `tests/twitch/` inspect emitted DEX and use the original
JavaScript/Hermes as behavioral inputs. They check callback completion, untouched
synthetic cases, saved/default quality and autoplay choices, automatic versus
manual playback, consent immutability, interface state and outgoing link boundaries.
An independent Hermes decoder checks all 28 edits across 21 functions, including
instruction boundaries and branches, with all five controls on, all off and each
on alone. `verify_interface_hermes_structure.py` also checks the 18 interface
functions and switch targets using the production interface probe's manifest.
`verify_playback_links.py`,
`verify_interface.py` and `test_privacy_consent.py` compile production Java helpers
with boundary fixtures. The existing Rumble and Kick Android probes also pass on
APKs made with the expanded patch bundle.

### Locators

The probes and verifiers exercise R8-renamed classes, which change with every Twitch build. The patches
record what they matched with `Locators.record`, and the settings patch writes the records into the
patched APK as `assets/lurk/locators.json`:

- every `twitchMatch` records its method as `twitch.match.<name>`, from the fingerprint object's name
  (`ChatRestrictionFingerprint` gives `twitch.match.chat_restriction`, value `Lyn6;->b(...)`), or for a
  fingerprint built in place, from its description;
- every native UI flag a patch filters records its field as `twitch.ui_flag.<state>.<flag>`;
- members found without a fingerprint are recorded by their patch: `twitch.auto_claim.action`,
  `twitch.chat_timestamps.line_config`/`message_source`, `twitch.ignore_chat_clears.ignored_result`,
  `twitch.show_deleted.name_span`, `twitch.mute_stitched_ads.native_player`/`root_view`/`rn_session`/`rn_display`,
  `twitch.block_client_ads.request`, `twitch.disable_analytics.crashlytics_permission`,
  `twitch.block_cookie_notice.options_constructor`, `twitch.hide_chat_highlights.dispatch`/`highlight_*`,
  `twitch.hide_clips.home_tabs`,
  `twitch.hide_subscription_upsells.subscribe_renderer`/`turbo_dialog_route`/`chat_header_subscription_state` and
  `twitch.emote_picker.section`/`autocomplete_map`/`autocomplete_order`/`autocomplete_order_type` and
  `twitch.latency_badge.latency` and `twitch.auto_claim_drops.handler`/`handler_case` and
  `twitch.emote_badge_info.placeholder`.

`ChatArtProbe`, `AdsProbe`, `PrivacyAdsProbe` and `HighlightsArtProbe` read the file through
`ProbeLocators.java`, and `verify_privacy.py` and `verify_interface_emitted.py` through `locators.py`;
other classes come from the located ones by reflection (constructor and parameter types, the one
method of a signature). Each lookup carries the 31.7.0 name as a fallback, used while an APK has no
locators. Still pinned, to 31.8.0's names: what no patch matches (in `HighlightsArtProbe` the state flag
fields, the raid highlight, notice kinds, callout lambda, Home tab source and Following sections; the
overlay's hidden state in `AdsProbe`; the deleted-message string ID in `ChatArtProbe`; the compile-time
`bx50`/`nig` stubs of `PrivacyAdsProbe`; `verify_interface_emitted.py`'s preservation controls and Turbo
string IDs; `verify_playback_js.py`'s `enabled` string ID; the stock bundle SHA-256 in `BundleProbe`,
`test_privacy_hermes.py` and `verify_delayed_hermes.py`; `DelayedHermesProbe`'s Metro module numbers;
the DiscoveryFeedContent offsets in `InterfaceClipNavigationProbe`), and the probes not converted yet
(`InterfaceArtProbe` apart from its chat header buttons state, which it reads from
`twitch.match.chat_header_buttons_state` while pinning Twitch's mapper `ow5` and `NoDiscount` `rw5`,
`PlaybackArtProbe`, `RNBridgeProbe`, and
`ChatStyleArtProbe` apart from its chat image box, which it reads from `twitch.match.chat_image_box`).
`verify_playback_bytecode.py` finds its methods by content and pins no names.

Guest native VOD, replay, chapters and PiP, and the RN consumer, provider and reload paths, were
checked on the emulator and on a phone on 2026-10-18. The following account limits remain:
**signed-in playback and chat, sending messages, actual server ad delivery, purchases,
subscription/member screens and Amazon sign-in remain unverified.** Stock Twitch
requires Log In or Sign Up, including for a direct channel URL, and no test account
was available. Since "Watch without signing in" opens Twitch's own signed-out mode,
signed-out live playback, the native theatre and read-only chat can be checked on
the emulator. Bytecode and callback probes establish
specific local behavior, not complete authenticated end-to-end coverage. The
app also contains WebView code outside the covered native/RN presentation hooks.

Decoded APKs (`bin/decompile twitch`), build logs and probe output go to `$MORPHE_WORK`
(`twitch/<version>/`, `twitch-chat/`, `twitch-interface/` and so on); none of it is in the repository.

## Implementation and release requirements

Use original, app-specific fingerprints based on strings, signatures and instruction
patterns. Do not copy third-party Twitch patches. Reuse the repository's shared Lurk
settings screen and extension infrastructure; register only settings for included
patches. Restore original execution when runtime switches are disabled. Features
read only during initialization must clearly require a restart.

Before each behavior change, establish a meaningful failing check against stock or
an isolated production helper. Verify emitted bytecode, register safety, return
contracts and callbacks as well as user-visible behavior. Test the full patch set
and independent combinations where dependencies could hide a failure. Use only the
disposable `emulator-5580` for runtime checks.

The release gate requires successful patching of the verified original package,
APK signature/alignment checks, startup and representative playback/chat checks,
settings toggling, and Rumble/Kick regression checks if shared code changes. Record
unavailable authenticated coverage explicitly. No unsupported feature should be
listed as implemented merely to match another app's patch count.

Work on `dev`. After local verification and review, push a semantic feature commit,
validate the workflow-built prerelease, merge `dev` into `main` without squashing,
and validate the published stable bundle and generated Morphe source metadata.
Do not edit generated release files or publish a release by hand.
