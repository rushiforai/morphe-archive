# Kick

Static analysis of the supplied APKMirror bundle on 2026-10-14, compared with the 14
Rumble patches in this repository. **None of the existing patches applies to Kick
unchanged.** All declare Rumble compatibility; most also fingerprint Rumble Kotlin
classes or Compose UI. Kick uses React Native/Expo, Hermes bytecode and native
player modules. Several features are good candidates for independent Kick patches.

The assessment below, up to "Workspace result", was the starting point and is kept as
it was written. Twelve Kick patches were implemented from it, and a second batch,
inspired by Xtra and by Lurk's own Twitch patches, added more. The notes from
"Implemented patch set" on describe them and separate tested behavior from the
remaining limitations. The analysis below was done on Kick 40.32.1. The patches are now
checked against Kick 40.33.0, where the patched code is unchanged apart from renumbered
string, shape and literal IDs.

## Input and analysis

- Package/version: `com.kick.mobile`, `40.32.1`, version code `60006965`.
- Supplied bundle: `com.kick.mobile_40.32.1-60006965_1arch_2dpi_22lang_fd6d4ac6871fe5704e9fdc59b19d8d86_apkmirror.com.apkm`.
- Architecture: arm64-v8a; includes density and language splits.
- `bin/apk-add --copy` verified the base APK signature and pinned its certificate in
  `kick/shared/Constants.kt`: `b12320227268c9c37e190b493120a7f6ce83c0e9a761f9213df677b58d095b73`.
  This is a first-import pin, not a comparison against a previously trusted Kick certificate.
- Base APK SHA-256: `d4e58dc6fac60d983608fda6338c489ed8756f55761cb189489dabd22d9544d2`.
- Hermes bundle SHA-256: `a9d911b3f8b640d8e56b7527929a093c2356d97992409c453d167fdf39538d9a`.
- 11 DEX files; `assets/index.android.bundle` is Hermes v99, approximately 12.5 MiB.
  Its SHA-1 footer matches its contents.

`bin/decompile kick 40.32.1` produced Java, smali, resources, Hermes disassembly and
decompiled JavaScript under `~/build/lurk-morphe-patches/kick/40.32.1/`. `bin/scan kick 40.32.1`
provided an initial SDK inventory. Code inspection expanded that inventory; SDK
presence alone does not establish that it transmits data in a particular session.

JADX reported decompilation errors. hermes-dec 0.1.7 warns that v99 is not formally
supported and emitted 4,922 warnings, including unknown environment registers.
Its output contains 46,821 function entries, 570 with zero bytecode length. Do not
treat reconstructed JavaScript as executable source or a zero-length entry as proof
that a feature is absent. The targets below are supported by manifest/resource
inspection, named bytecode instructions and native code where available; exact edits
still need validation against smali/Hermes instructions and runtime behavior.

## Patch-by-patch assessment

| Rumble patch | Kick assessment | Evidence and required change |
| --- | --- | --- |
| **Change app name** | Straightforward | Kick uses `@string/app_name`, defined as `Kick` only in the base `res/values/strings.xml`. Reuse the resource-editing approach with Kick compatibility and defaults. |
| **Lurk icon** | Straightforward | Kick has launcher and round icons, but adaptive XML lives in `mipmap-anydpi-v26`, with foreground/background WebP resources. Rumble's exact file list would fail. Supply Kick artwork and handle split-resource precedence. |
| **Remove tracking permissions** | Straightforward | Four of Rumble's eight permissions are present. Remove those four; replace the Rumble-specific validation and referrer-query assumptions. This reduces tracking access but does not disable all telemetry. |
| **Clone app** | Feasible; broader verification | Rename Kick's package, declared permissions and 13 provider authorities. Rumble's required `com.rumble.provider` bytecode target is absent. Review deep links, token sharing and sign-in under the new package/signature. |
| **Disable analytics** | Strong candidate; new implementation | Firebase event logging, Insider, Datadog, Mux/Datazoom and first-party player telemetry have separate paths. Rumble's single event-repository patch cannot cover them. Preserve callback/Promise completion and distinguish telemetry from playback/session requests. |
| **Disable autoplay** | Strong candidate for feed previews | `preferencesSettingsSlice` defaults `showStreamPreviews` to true and has a toggle. Change that default while respecting stored preferences. Rumble's separate next-video behavior was not established in Kick. |
| **Default video quality** | Strong candidate; new implementation | The player store starts with `selectedQualityGroupPreset: 'auto'`; it supports `higherQuality`, `dataSaver`, `advanced` and user-selected quality. Native IVS exposes quality selection and an adaptive-quality ceiling. Decide whether the patch promises a preferred resolution or only a ceiling. |
| **Hide tipping and Rants** | Good equivalent: hide KICKs/gifting entry points | `KicksShopButton`, `GetKicksButton`, purchase/send screens and gift-subscription buttons are identifiable. Hide entry points without changing balances, purchase authorization or received messages. Rants and Rumble Wallet themselves have no direct equivalent. |
| **Hide Premium upsells** | Good equivalent: hide subscription/gift prompts | Kick exposes `ChannelSubButton`, `ChannelGiftSubButton` and subscription sheets. Target these UI components; keep genuine subscriber-only content indicators. There is no matching Rumble Premium promotion system. |
| **Hide Shorts** | Feasible equivalent: Hide Clips | `BrowseClipsScreen`, `ChannelClipsScreen`, Clips routes and clip-list queries exist. This would hide Kick clips, which are a different content category from Rumble Shorts. Route/tab and browse/category entry points need their own coverage. |
| **Clean share links** | Feasible, currently low benefit | Traced channel/live/VOD/clip share hooks construct clean path URLs. No tracking query was found in these paths. A host-scoped sanitizer could be added to Kick's share boundary if needed; do not blindly remove functional queries from every shared URL. |
| **Block ads** | Research candidate; full removal unproven | Kick has PAL, Amazon MediaTailor sessions, manifest/tracking URL selection and player ad events. Rumble's empty-ad-repository result cannot be reused. Blocking measurement or hiding an ad overlay does not establish that media segments are ad-free. |
| **Block cookie notice** | No matching target established | Rumble's two Ketch entry-point strings are absent from Kick's DEX strings, and no equivalent Ketch notice flow was found. Kick has a personalised-ads preference and SDK consent APIs; those are different targets. |
| **Unlock Premium** | No useful direct equivalent established | Rumble overrides `UserProfile.isPremium`. That DTO is absent. Kick's `useSubscribeToChannel` reads channel info, payment configuration and the signed-in user's channel relationship. Faking a local subscribed value would not establish paid access or subscription benefits. |

## Concrete targets

Paths in this section are relative to `~/build/lurk-morphe-patches/kick/40.32.1/`. Function IDs
identify this exact bundle for investigation; they are not version-stable fingerprints.

### Resources and cloning

`apktool/AndroidManifest.xml` and `apktool/res/values/strings.xml` establish the
label, icons, permissions, providers and update configuration.

The four tracking permissions shared with Rumble are:

```text
com.google.android.gms.permission.AD_ID
android.permission.ACCESS_ADSERVICES_AD_ID
android.permission.ACCESS_ADSERVICES_ATTRIBUTION
com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE
```

Kick does not declare Rumble's `AD_SERVICES_CONFIG`, `READ_PHONE_STATE`, Samsung
store-referrer permission or Huawei store-referrer permission. The existing patch
requires all eight, so merely changing `compatibleWith` would still fail.

Kick declares `com.kick.mobile.SHARE_TOKEN` and
`com.kick.mobile.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION`. Its exported
`com.kick.mobile.tokenprovider` is protected by the former signature permission;
`expo/modules/kickauthtokenprovider/KickAuthTokenProvider.java` also checks allowed
calling packages. A clone must preserve these restrictions while renaming its own
authority/permission. Sharing authentication with the official broadcaster app
cannot be assumed to work after re-signing. Deep-link schemes include `kick`,
`com.kick.mobile` and `exp+kick-mobile`; verify intent routing with both apps installed.

### Playback preferences

In `hermes/disassembly.hasm` and `hermes/decompiled.js`:

- `preferencesSettingsSlice` initializes `showStreamPreviews: true` and
  `muteStreamPreviews: true`. `toggleShowStreamPreviews` is function **35368**.
  This is a concrete default-setting target that can retain Kick's own toggle.
- `usePlayerStoreIVSModuleSlice` is function **16410**. Its initial object includes
  `selectedQualityGroupPreset: 'auto'`, `autoQualityMode: true` and
  `userSelectedQuality: undefined`.
- `setUserSelectedQuality` (**34162**) updates `autoMaxQuality` from the chosen
  height while keeping adaptive quality enabled. `setSelectedQualityGroupPreset`
  (**34163**) handles `auto`, `higherQuality`, `dataSaver` and `advanced`.
- `jadx/sources/com/kick/mobile/kickivsplayerv2/KickIvsPlayerV2View.java` exposes
  `setQuality(String)`, `setAutoMaxQuality(Integer)` and `setAutoQualityMode(boolean)`.
  A literal resolution and an adaptive upper limit have different behavior.

Changing the global player `autoplay` field is not a verified replacement for
Rumble's next-video default. It could affect intentionally opened streams. Target
the preview preference first and trace any next-video policy separately.

### UI and sharing

Hermes contains these useful component/hook anchors:

| Target | Function ID | Intended use |
| --- | --- | --- |
| `KicksShopButton` | 26415 | Hide chat gift-shop entry point. |
| `GetKicksButton` | 26693 | Hide KICKs purchase entry point. |
| `ChannelSubButton` | 26323 | Hide channel subscription CTA. |
| `ChannelGiftSubButton` | 26307 | Hide gift-subscription CTA. |
| `ChannelSubscribeBottomSheet` | 22554 | Trace subscription sheet entry points. |
| `BrowseClipsScreen` | 26980 | Trace browse Clips UI. |
| `ChannelClipsScreen` | 27776 | Trace channel Clips UI. |
| `useShareStreamLink` | 24095 | Builds live, VOD and clip share payloads. |
| `useShareChannelLink` | 27837 | Builds channel share payloads. |
| `useSubscribeToChannel` | 26320 | Shows why channel subscription state differs from Rumble Premium. |

The traced share payloads use `BASE_URL/channel`, `BASE_URL/channel/videos/id` and
`BASE_URL/channel/clips/id`, passed to the React Native sharing library. This does
not prove every share surface is clean, but makes link cleaning a lower priority.

For UI patches, trace parents as well as components so hiding a button does not leave
an empty row or sheet. Keep navigation routes valid if deep links should still work.

### Analytics and ads

Kick's app-level Hermes `logEvent` wrapper (**14492**) appends current/previous
navigation paths and `app_platform: android_mobile`, then calls Firebase Analytics.
Native integration is through
`io/invertase/firebase/analytics/NativeRNFBTurboAnalytics.java`. Manifest collection
defaults are `firebase_analytics_collection_enabled=true` and
`firebase_analytics_collection_deactivated=false`. Crashlytics' manifest collection
default is already false; runtime changes were not tested.

Other concrete surfaces include:

- `com/useinsider/react/RNInsiderModule.java`: initialization and `tagEvent`.
- Datadog native modules/provider and Hermes tracking configuration.
- `com/kick/mobile/kickivsplayerv2/KickIvsPlayerV2View.java`:
  `initializeMuxAnalyticsListener`, `setMuxAnalyticsConfig`,
  `setDatazoomAnalyticsConfig` and `sendDatazoomAnalyticsEvent`.
- Hermes `postPlayerTelemetry` (**16565**): authenticated POST to
  `/api/v1/stream/{id}/playback` on the mobile subdomain. Despite its name this is
  **playback acquisition**: its response supplies stream URLs and configuration.
  The analytics patch deliberately preserves this call.

FingerprintJS integration also exists, including `RNFingerprintjsProModule` and
`useFingerprintId`. Removing `AD_ID` does not disable this code. (Disable analytics now
covers it with its own opt-in switch; see [Disable analytics](#disable-analytics).)
Likewise, do not remove Pusher/Centrifugo indiscriminately; the package contains chat
transport integration, not just analytics libraries.

`DatazoomAnalyticsManager.java` creates Amazon MediaTailor sessions with optional
tracking URLs and attaches ad-event listeners. PAL handles nonce requests and playback
signals. Hermes `usePlayerStoreAdsSlice` (**16391**) supplies `onAdEvent` (**34139**),
and playback loaders inspect `manifestUrl` and `trackingUrl`.

These establish ad-related integration, but not a tested way to obtain ad-free
media. The next ad investigation should compare actual live/VOD playback responses
and manifests and test both playback and ad delivery. Do not classify disabling PAL,
Datazoom or ad overlays alone as a complete ad blocker. Datazoom's analytics and ad
session handling are coupled, which also matters for the analytics patch.

Live ads, checked on 40.32.3 signed out on an emulator, on one network: the playback response
gave the player a plain IVS channel URL (`*.playback.live-video.net/api/video/v1/...channel.<id>.m3u8`)
and no MediaTailor tracking URL, with PAL nonces both on and off (Disable analytics off and on).
Without a tracking URL no MediaTailor session reports `AD_START`/`AD_END`, so `onAdEvent` and the
player's "Ad" label (`player.controls.ad.label`) can't appear. The IVS SDK's own ad marker,
`AdCue` (start, duration, pod position and count, PRE/MID/POST roll type, tracking URLs), arrives
through `Player.Listener.onCue`, which Kick's listener ignores; on the most-watched English live
stream no cue of any kind arrived in eight minutes. A patch that mutes and covers the player during
a stitched ad break could key on either signal, but neither could be observed. Ads stitched into the
media itself can't be skipped by a client patch, only muted and covered. (Mute stitched live ads, added later and
experimental, keys on both and on IVS's own ad break events; see [Mute stitched live ads](#mute-stitched-live-ads).)

## Shared infrastructure and implementation order

**Account for Expo updates before shipping Hermes edits.** The manifest enables
`expo.modules.updates.ENABLED`, sets checks on launch to `ALWAYS`, and configures a
production Expo update URL/channel. Downloaded JavaScript could supersede patched
embedded code. The native `expo/modules/updates/UpdatesController.java` has an
explicit disabled-controller path. A Kick-specific dependency should ensure the
patched embedded bundle is used, including when an existing install has cached
updates; verify fresh installs and upgrades. Disabling updates also gives up those
over-the-air fixes until the app is repatched.

The local Morphe `hermesPatch` helper checks the Hermes magic, performs byte-pattern
replacements and recalculates the SHA-1 footer. It is not a JavaScript compiler or
semantic fingerprint engine. Its replacement helper edits the first match and pads
shorter replacements. Add explicit version/match-count checks and preserve bytecode
layout; do not globally replace shared strings such as `auto` or `true`.

Rumble's runtime-settings dependency also needs a Kick adapter. The shared Java
settings activity/registry and launcher shortcut can be reused, initialized from
`com.kick.mobile.MainApplication.onCreate`. The Rumble Compose settings-row hook
cannot transfer to React Native. Hermes switches need a native bridge or another
explicit way to read settings; including the shared extension alone does not provide
that connection. (The runtime bundle loader under "Implementation contracts" now
provides it.)

Do not advertise cookie-notice blocking or premium unlocking for Kick on the evidence
available here. Recheck all targets when changing the supported version.

## Workspace result

The original upload was left in place; the verified copy is in `apks/kick/40.32.1/`.
About 1.7 GiB of extracted/decompiled analysis material remains in
`~/build/lurk-morphe-patches/kick/40.32.1/` for implementation follow-up. Temporary resource-split
audit extracts were removed. The resource-split audit found no `app_name` or launcher
icon overrides in the supplied language/density splits.

The original assessment checked the 18 documented Hermes function IDs against
nonempty disassembly entries and covered all 14 Rumble patches. Implementation
details and validation follow.

## Implemented patch set

| Patch | Selected by default | Lurk settings | Behavior |
| --- | --- | --- | --- |
| Change app name | No | None (patch time) | Configurable launcher label; default `Kick Lurk`. |
| Lurk icon | Yes | None (patch time) | Adaptive Lurk icon in Kick green, including themed icon. |
| Remove tracking permissions | Yes | None (patch time) | Removes the four verified advertising/referrer permissions. |
| Clone app | No | None (patch time) | Separate package, permissions and 13 provider authorities; defaults to `com.kick.mobile.lurk`. |
| Disable analytics | Yes | On; Block device fingerprinting, off | Firebase collection/event bridge, Insider initialization/events/queued jobs, Datadog initialization, Mux/Datazoom and PAL nonce suppression; optionally FingerprintJS Pro. Promise completion is preserved. |
| Disable autoplay | Yes | On | Changes the initial feed-preview preference; saved preferences and Kick's own toggle take precedence. |
| Default video quality | No | On; quality on mobile data, Same as on Wi-Fi | Configurable adaptive default/Auto ceiling, consistently applied to initialization, reset and cleanup. Explicit player selections retain Kick's normal rules. A lower starting ceiling can be set for mobile data. |
| Hide KICKs tipping | Yes | Off | Gift-shop, purchase and leaderboard tipping entry points; received gifts remain. |
| Hide subscription upsells | Yes | Off | Subscribe/gift-subscription prompts, preserving the subscribed badge. |
| Hide Clips | Yes | Off | Browse/channel/category tabs and channel clip rail. Direct playback routes remain. |
| Clean share links | Yes | On | Known campaign/click parameters on Kick URLs only; functional parameters, other hosts and attachments remain. |
| Bypass VOD ad sessions | No | Off (Playback) | Experimental original-VOD-URL fallback. No live-ad removal claim. |
| Mute stitched live ads | Yes | Off (Playback) | Experimental: mutes and covers a live ad break the player reports, until it ends; the ad still plays. Not observed with a real ad. |
| Block update prompts | Yes | On | Kick's forced-update screen and update sheet, and the Play Store version lookup behind them. |
| Hide rating prompt | Yes | On | Kick's automatic "rate the app" prompts. |
| Show deleted messages | Yes | On; Ignore chat clears, on | Moderator-style struck-through deleted, timed-out and banned messages in chat, set inside the chat page so Kick's server sees no change; a moderator's clear keeps the messages. |
| Hide chat highlights | Yes | Nine switches, all off | Pinned messages, polls and predictions, goals, sub and gift messages, host messages, reward redemptions, event and drops banners, pinned KICKs, celebration prompts. |
| Stay on channel when it hosts | Yes | Off | The host dialog waits for Watch now instead of switching when its countdown ends. |
| Background audio | Yes | On; a second switch for picture-in-picture, off | Audio keeps playing through Kick's own audio service when you leave the app. |
| Normal latency | Yes | Off | Turns off low-latency mode for live streams. |
| Fill screen | Yes | Off | In landscape, 16:9 streams fill a taller phone's screen, cropped top and bottom, instead of showing side bars. |
| Show video stats | Yes | Off | A panel over the player with latency, bitrate, buffer, dropped frames, quality and codecs, refreshed every second. |
| Sleep timer | Yes | Off (choice) | Pauses playback a chosen time after it last started. |
| Default startup tab | Yes | Home (choice) | Opens Kick on Browse or Following instead. |
| Hide Home sections | Yes | Three switches, all off | Featured, recommended streams and categories rows on Home. |
| Show exact counts | Yes | Off | Viewer and follower counts in full (306,112 instead of 306.1K). |
| Hide mature-content warning | Yes | Off | Mature streams open without the 18+ warning when signed out. |
| Seek interval | Yes | Kick's 10 seconds (choice) | 5, 15, 20 or 30-second skips in videos and rewound live streams. |
| Don't save searches | Yes | On | New searches aren't added to the search history. |
| AMOLED black | Yes | Off (choice) | Pure black background, optionally near-black cards and sheets. |
| Third-party emotes | Yes | 7TV emotes, off | The channel's and 7TV's global emotes in live chat. |
| Chat timestamps | Yes | Off; clock 24-hour | The time next to each chat message, signed out too, as 13:05 or 1:05. |
| Chat text size | Yes | Kick's size; Compact chat, off | Chat text from 12 to 24 px; less space between messages. |
| Chat keywords | Yes | Off; mentions on, vibration off, lists empty | Tints messages that mention you or contain highlight words, optionally vibrating; hides blocked words and users. |
| Anonymous chat | Yes | Off | The chat page opens without the sign-in token and the account, as when signed out; sending chat messages is refused. |
| Lurk in account menu | Yes | On, kept while paused (Advanced) | A Lurk row in the account menu (signed in) that opens Lurk settings. |

The second batch follows one switch policy, the same in all three apps: every patch whose
effect can be decided at run time has a Lurk setting that turns it fully off, and a new
patch with a switch is selected by default while its switch starts off, so a freshly
patched app behaves like stock until you turn something on. The exceptions start on:
lockout protection (Block update prompts, and Lurk in account menu, a way back into the Lurk
screen), nags (Hide rating prompt), local privacy (Don't save searches), and features that match
what the same patch does by default on Twitch (Show deleted messages, Background audio).

There is no cookie-notice or Premium-unlock patch: no corresponding Kick feature
was established. The VOD patch does not promise removal of ads already stitched
into the source stream. Its generator still completes with an object, allowing
both the VOD and live-rewind consumers to use their existing original-URL fallback.
Live playback authorization and media URLs remain unchanged.

The Lurk settings screen opens from Kick's account menu (tap your profile picture while signed
in) › **Lurk**, from the launcher icon (long-press › **Lurk settings**) and from Android's App info
page for Kick (› **Additional settings in the app**). Signed out, Kick has no account menu: it
sends `/account` to the login screen, so the other two are the ways in. Settings show only the
patches included in that APK. Hermes and SDK-startup switches require a restart;
the screen offers a restart action. The quality height is a patch-time option;
its runtime switch restores Kick's default when disabled.

The settings activity isn't exported. The settings patch adds an exported `activity-alias` of it
that answers only `android.intent.action.APPLICATION_PREFERENCES`, which App info links to, and the
activity reads nothing from the intent that starts it. The launcher shortcut is pushed back to the
top of Kick's shortcuts at every start on Android 11 and newer; some launchers (often on older
Android versions) show no app shortcuts at all, which is what the other two ways in are for.

Hermes patches disable Expo OTA updates, including the controller path that reads
the update database. Native-only combinations leave Expo enabled. Repatch with a
supported new app version to receive JavaScript updates. Every patch that edits Kick's
JavaScript ends its Manager description with the same sentence saying so
(`OTA_UPDATES_OFF` in `kick/shared/KickHermesPatch.kt`), so turning all of their switches off
is not the same as an unpatched Kick: the updates stay off.

## Second batch

Each entry says what Kick does, what the patch changes and how it was checked. Hermes
switches take effect after **Restart Kick** on the Lurk settings screen; native ones apply
at once. Function names are Kick's own JavaScript names; anonymous functions are found by
the properties they read and the strings they load.

### Disable analytics

What the switch stops, each at its native boundary, with any React Native or Expo promise
settled so the JavaScript awaiting it carries on:

- Firebase Analytics: collection off from the first start (manifest default, then
  `setAnalyticsCollectionEnabled(false)` in `MainApplication.onCreate`), and the event bridge
  (`NativeRNFBTurboAnalytics.logEvent`) resolves without dispatching.
- Insider: `RNInsiderModule.init`, the `InsiderEvent` builder, and the two job services that
  upload queued sessions and events, which report synchronous completion.
- Datadog: both initialization paths (`DdSdkImplementation.initialize`, which resolves its
  promise, and `DdSdkNativeInitialization`). Without the SDK, the view, action, log and trace
  calls Kick's JavaScript keeps making reach Datadog's own no-op objects
  (`GlobalRumMonitor.get` returns `NoOpAdvancedRumMonitor`, `Logger.Builder` on the no-op core
  builds a logger with no Datadog handler), so nothing is queued or sent.
- Mux: `KickIvsPlayerV2View.initializeMuxAnalyticsListener` returns at once.
  `setMuxAnalyticsConfig` still stores the config and calls it, but it is the only place a
  `MuxAnalyticsListener`, and so `MuxStats`, is created.
- Datazoom: `DatazoomAnalyticsManager.apply` returns at once. It is the only caller of
  `Datazoom.init` and the only place the adapter is set; `sendDatazoomAnalyticsEvent` then only
  records a fullscreen flag, and an ad click finds no adapter.
- Google PAL: `PalSDKModuleBridge.generateNonce` resolves with Kick's own "SDK unavailable"
  result, so the playback request goes out without a nonce, as on a device without PAL.

Kick's own API requests are not touched, including `postPlayerTelemetry`, the playback request
that returns the stream URLs (and tells Kick what you watch, as any streaming site's playback
request does).

"Block device fingerprinting" (`block_fingerprinting`, off by default) covers FingerprintJS Pro.
Kick configures it with its own proxy endpoint on kick.com. The fingerprint is requested when a
signed-in session starts (`FpjsUserSessionHandler`, tagged with the session type, user ID and
username, cached for a day), when you sign up (its request ID goes with `api/v1/signup/complete`)
and for age assurance (`useCheckAgeAssurance` reports `missing_fpjs_request_id` without one).
The switch makes `getVisitorDataWithTimeout` and `getVisitorIdWithTimeout`, which every call goes
through, reject the way the SDK reports a network error, before the SDK is reached. It starts
off because sign-up and age checks can then fail. It is read on each request (no restart) and
checks that it is registered, so an unreadable settings registry can't turn it on.

Checked: `bin/test-kick` runs the real `logEvent`, Datadog `initialize`, PAL `generateNonce` and
both FingerprintJS methods on ART and checks the promise calls; `verify_privacy.py` covers the
switch logic. On the emulator, signed out, Kick started and loaded Home with fingerprinting blocked,
and made no FingerprintJS request at start either way; the signed-in, sign-up and age-check paths
need an account and were checked statically only.

### Block update prompts

Kick's root layout renders `AppUpdateHandler`. On start it compares the remote minimum
version (`mobileAndroidForcedUpdateVersion`) and the suggested-update flags with the
installed version, asks Google Play for the store version, and stores the result. A child
then opens the forced-update screen, which can't be dismissed, after five seconds, or
shows an "update available" sheet. A patched app can't take a Play update, so the patch
returns null from `AppUpdateHandler`: neither prompt shows and the Play lookup doesn't
run. It is a leaf of the root layout with no children, and nothing else calls the check.
Expo's own over-the-air updates are already off whenever Kick's JavaScript is patched.
If Kick's server ever rejects an old version, you won't see Kick's warning: patch a newer
version. Checked: Kick starts and renders Home with the switch on; the forced path can't
be triggered from outside.

### Hide rating prompt

`useAppRating` opens Kick's rating sheet after a won prediction, a number of follows or a
redeemed reward, through `showAppRatingDialog`. That asks the rating store's
`shouldShowAppRating` first (never shown, or more than 120 days ago), and the patch makes
it return false. The developer-settings button that forces the sheet is untouched. The
follow trigger fires on a follow once you have followed ten channels and the app has been open
for an hour in total (`app-session-time`); below that it only counts the follow. Checked on the
emulator with a test account: after ten follows and an hour in the app, the next follow with the
switch on (the default) showed no sheet and left the count at ten, so the trigger fired and was
suppressed; with the switch off and Kick restarted, the next follow opened the "Rate us" sheet.
One more path needs no account: a trigger that fires in landscape persists
`shouldShowAppRatingOnNextPortrait`, and `AppRatingOrientationHandler` opens the sheet on the
next portrait screen through the same check; with that flag set in Kick's AsyncStorage
(`app-rating`), the switch off showed the sheet at start and the switch on didn't.

### Show deleted messages

The app doesn't draw chat messages itself. On the stream screen and on a channel's Chat tab,
`HTMLChatWrapper` opens Kick's chat web page, `https://chat.mobile.kick.com`, in a WebView
and passes it a JSON `config` URL parameter: the chatroom and channel IDs, the viewer's
`userCanModerate`, text size, locale and session headers. The page keeps its own realtime
connection and draws every chat line, including deletions, bans, subs, gifts, hosts and
reward redemptions. The app's own chat store has handlers for the same events
(`handleDeleteChatMessageEvent`, `handleClearChatEvent`, `handleSubscriptionEvent` and
others), but in 40.32.1 and 40.32.3 nothing calls most of them, and the entries it keeps are only drawn
by VOD chat replay. Chat lines are changed through that config, and through a script Lurk runs in the
page (see [Chat page script](#chat-page-script)).

The page shows a removed message according to `userCanModerate`. When it's false, a deleted
message's text becomes "Deleted by a moderator" and a ban or timeout removes the user's
messages. When it's true, the text is struck through with "(Deleted)", "(Timed out)" or
"(Banned)", with Kick's "AI Mod" label and the rules it flagged when its AI moderation
acted, and lines such as "X timed out Y for 10 minutes", "X banned Y" and "X unbanned Y"
appear.

The config is part of the page's address, which Kick's server receives with every chat open,
so the patch doesn't change it. The page reads its config when it loads from
react-native-webview's `window.ReactNativeWebView.injectedObjectJson()` when that function
exists, and from the address only otherwise; Kick's chat WebView sets no injected object, so
stock Kick uses the address. The patch hooks the end of `RNCWebView`'s constructor: with the
switch on, `KickChat` registers `assets/lurk-chat-moderator.js`
(`patches/src/main/resources/kick/chat/moderator-view.js`) on the new view as an androidx.webkit
document-start script (`WebViewCompat.addDocumentStartJavaScript`) limited to
`https://chat.mobile.kick.com`, so it runs in the chat page before any of the page's own
scripts. It reads the address's `config`, sets `userCanModerate` to true and defines
`injectedObjectJson` to return that copy. The address, and so the request Kick's server sees,
keeps the app's value. Gift previews (`preview=true`), a malformed config, a missing bridge
object and an injected object the app provides itself are left alone. The androidx.webkit calls
are bridged at patch time, and the patch fails if Kick's copy of androidx.webkit no longer has
them; an Android System WebView without `DOCUMENT_START_SCRIPT` support (none current) logs a
warning and shows chat as stock. The switch is read when a chat WebView is created, so it applies
to chats opened afterwards, with no restart. No JavaScript in Kick's bundle is edited, so this
patch doesn't turn off Expo's over-the-air updates. (Up to Lurk 1.12, the patch made the config
builder store `true` in the address instead, which Kick's server could see.)

The app's own `userCanModerate`, which its moderation menus read, doesn't change. The page uses
the value for one control too: large (mid and high tier) KICKs gifts in chat get the moderators'
menu with Delete. The page only hands that tap to the app (a `delete-kicks` click message), and
the app's handler calls `deletePinnedItem` only when its chatroom store's own `userCanModerate`
is true, so for anyone else the tap does nothing and no request reaches Kick.

Messages removed before you opened the chat don't come back: history arrives without them.
The page only marks messages it has already drawn. Kick's AI moderation often removes a
message within milliseconds, while it's still waiting in the page's queue, and such a message
then shows as an ordinary one, as in stock Kick.

"Ignore chat clears", the second switch, is on by default as on Twitch. When a moderator
clears the chat, the page empties its message list (`app.innerHTML = ""`, from its
`ChatroomClearEvent` handler); the chat page script makes that one assignment on the list do
nothing, so the messages stay and new ones keep arriving.

Checked on the emulator (Android 16, signed out) on large live channels. Real events: with the
switch on, 43 timeouts in about 20 minutes, a moderator's delete and a permanent ban left the
messages in place, marked "(Timed out)", "(Deleted)" or "(Banned)", with "moderator timed out X"
lines; with it off and Kick restarted, a timeout removed the user's message and added no line,
as in stock. No moderator cleared a chat in 15 minutes across 14 large live channels. So for
clears, and for both states of every event, a test build with WebView debugging on handed
realtime frames in the page's own format (a delete, a permanent ban, a clear, a mid-tier KICKs
gift) to the page's socket, which runs them through Kick's own handlers. With the switches on: the
deleted and the banned user's messages stayed struck through with "(Deleted)" and "(Banned)"
plus "X banned Y", the clear left all messages, and the KICKs gift showed the moderators' menu.
With them off: "Deleted by a moderator", the banned user's messages removed with no line, the
chat emptied (40 lines to none) and no menu, as in stock. The menu's Delete wasn't tapped on
the device; the app's handler (above) ignores it from a non-moderator.

The document-start version was checked the same way on the emulator (Android 16, signed out) on
a live channel with about 30,000 viewers, through the WebView debugger that Kick's release build
leaves on: the loaded address had `"userCanModerate":false`, `injectedObjectJson()` returned the
same config with `true`, and a timeout frame in the page's own Centrifugo format, handed to its
open socket, left the user's two messages struck through with "(Timed out)" and added
"moderator timed out target for 10 minutes". With the switch off and the chat reopened, the page
had no `injectedObjectJson` and the same frame removed the user's message with no line, as in
stock. `tests/kick/test_chat_page.py` runs the script at document start in headless Chrome on a
page that reads its config the way Kick's does, and checks that the request for the page keeps
the app's value.

### Hide chat highlights

| Switch | What it changes | Hidden |
| --- | --- | --- |
| Hide pinned messages | `PinnedMessage` returns null | The message pinned above chat |
| Hide polls and predictions | `PollFloating`, `PredictionBannerView` return null | Poll and prediction cards; a hidden poll can't be voted in |
| Hide goals | `FloatingGoalCard` returns null | The channel goal card |
| Hide sub and gift messages | The sub and gift card callbacks return; the page hides its sub and gift lines | "Just subscribed" and gifted-sub lines in chat, and their cards above it |
| Hide host messages | The host card callback returns; the page hides its host lines | "X is hosting with N viewers", in chat and as a card above it |
| Hide reward redemptions | The page hides its reward lines | "X has redeemed ..." lines in chat |
| Hide event and drops banners | `DropsBanner`, `StreamEventBanner` return null | Drops campaign and "Only on Kick" event banners |
| Hide pinned KICKs | `PinnedKicks` returns null | KICKs gifts pinned above chat |
| Hide celebration prompts | `ConsumingCelebration` returns null | The celebration button in the chat footer |

The components' parents are ordinary lists and footers, so the space closes up. A new
subscriber, a gift and a host each queue a timed card (`EventBanner`) in the floating stack
above chat, where pinned messages, polls and goals also live. Three anonymous callbacks, which
Kick's realtime listeners call, queue them; they now return at once. The lines for the same
events inside the chat, and reward redemptions, which only appear there, come from Kick's chat
web page (see Show deleted messages); the app's own sub, gift, host and reward handlers are
never called. The chat page script hides those lines by the page's own classes for them
(`subscription-container`, `subgift-container`, `host-container`, `reward-redeem-container`),
so they take no space; the page still receives them. Kick can rename those classes in its page at
any time, and the switches would then silently stop hiding the lines, so the description says so
and the page contract (see [Chat page script](#chat-page-script)) pins them. Pinned KICKs sits here rather than under
Hide KICKs tipping because it shows a gift someone already sent. Checked on the emulator: the
pinned KICKs and prediction cards disappear, and with the sub callbacks returning no sub card
appeared above chat. On a channel with channel-point rewards, all 85 real redemptions in nine
minutes were drawn by the page and hidden. Subs, gifts and hosts were rare during the tests, so
those were handed to the page's socket as realtime frames in a test build (see Show deleted
messages): with the switches on Kick drew each line and it stayed hidden; with them off each
showed, as in stock.

### Stay on channel when it hosts

When the channel you watch hosts another one, Kick's realtime connection sends
`ChatMoveToSupportedChannelEvent` and `JoinHostDialogContent` shows "X is taking you to watch
another stream" with a countdown (`useCountdown({duration, startOnMount: true, onEnd})`). The
component is mounted with the stream screen; the countdown restarts when an event arrives,
and at zero `onEnd` switches to the hosted channel if you're on a stream, clip or VOD screen.
Watch now doesn't switch by itself: it sets the dialog's `pressed` state, which hides it, and
shows a "taking you to X in N seconds" toast, and the countdown's end does the switching.
Cancel and close clear the event.

The patch sets `startOnMount` to that `pressed` state instead of `true`, so the countdown only
runs after Watch now. Until then the dialog waits, showing the full duration, for Watch now,
Cancel or close. The literal's `startOnMount` is a constant, so the store goes where the
options memo wrote its cache entry for `onEnd`; the options object is then rebuilt on each
render, which `useCountdown`, reading only its fields, doesn't notice. (The first version
returned from `onEnd` instead, which also stopped Watch now from switching.)

Checked on the emulator with a test build that hands the app's own realtime module a host
event, so the real dialog appears: with the switch off, the countdown ran and switched
channels; with it on, the dialog waited at "Redirect in 10s" for over half a minute, and Watch
now switched once Kick's countdown had run.

### Background audio

Kick already keeps audio going with the screen locked and in picture-in-picture: its
`KickIvsPlayerV2Manager.shouldRunAudioService()` is `isPlaying && (screen locked ||
picture-in-picture)`, and `AudioService` is a media-playback foreground service with a
notification. Leaving the app without picture-in-picture (the device has none, or the
second switch is on) starts nothing, so the audio stops once Android freezes the app.

The patch starts Kick's audio service from `MainActivity.onUserLeaveHint()`, while Kick is
still in front, which Android allows; starting it later from the background would throw.
`shouldRunAudioService()` then also returns true while Kick was left playing, so the player
state changes, unlock and resume that would stop the service keep it, and
`onActivityResume` hands control back to Kick's own rule. With background audio on and
picture-in-picture off by default, the only change from stock is where Kick couldn't open
picture-in-picture: the audio keeps playing. Closing the picture-in-picture window still
pauses, as in stock. "No automatic picture-in-picture" skips Kick's automatic window when
you leave while watching: both the window Kick opens from `onUserLeaveHint` and, on
Android 12 and later, the system's auto-enter, which Kick turns on in the window's
picture-in-picture parameters (`updatePipParams`). Kick's own picture-in-picture button
still works. Checked on the emulator (Android 16), signed out, on a live stream: with
the defaults, Home opens picture-in-picture and `AudioService` runs in the foreground as
in stock; with automatic picture-in-picture off, Home leaves no window, `AudioService`
runs in the foreground and the stream's audio track keeps playing.

### Normal latency

Kick's player view turns on IVS low-latency mode for every player it creates, and nothing
else sets it. The patch hooks the IVS SDK's `setLiveLowLatencyEnabled(boolean)`, the same
hook Lurk uses on Twitch: with the switch on, the request becomes false. It applies to
streams opened afterwards.

### Fill screen

Kick's player is its own Expo view, `KickIvsPlayerV2View`, which draws the IVS player into
a `SurfaceView` and scales that view in `updateSurfaceViewTransform()` by an IVS
`ResizeMode`: FIT unless React Native passes a `resizeMode`, which Kick's player store
leaves undefined. The method checks the mode against FIT right before comparing the
video's width / height with the view's, and the patch hooks it there:
`KickPlayer.resizeMode` gets the mode and both ratios. While `fill_screen` is on, in
landscape, outside picture-in-picture, it hands back FILL when FIT would leave bars at
the sides of a video wider than tall: the video fills the width and its top and bottom
are cropped (a 16:9 stream on a 20:9 screen loses a fifth of its height). A player next to
the chat, which FIT letterboxes, and vertical videos keep FIT, so they aren't cut down to a
narrow band. The view runs the method on every layout, so the switch applies the next time
the player is laid out (rotating, showing or hiding the chat) with no restart, and portrait
goes back to FIT. Kick's own pinch-to-zoom still works on top.

Checked: `verify_player.py` (run by `bin/test-host`) covers the decision table, and `bin/test-kick`
runs Kick's real transform on ART with a 20:9 view (16:9 video:
0.8 x 1 with the switch off, 1 x 1.25 on; portrait, a vertical video and an 800x720 view
keep FIT's scale). On the emulator (720x1600), signed out, a 16:9 live stream in
fullscreen with the chat hidden showed black bars at the sides with the switch off and
filled the screen with it on; with the chat shown next to it, the player kept FIT's
letterbox.

### Show video stats

Kick's player view runs an observer every second while it is attached and has a player
(`playerObserverCallback`, on its player thread). There `handlePlayerStatistics(Player)` reads the IVS player's
average bitrate, duration and live latency for React Native's `onVideoStatistics` event, which Kick's player store
never asks for (`sendVideoStatistics` stays false). The patch hooks the start of that method. With `video_stats` on,
`KickStats` reads what the IVS player keeps through the public names of Amazon's SDK, which its native code needs:
`getLiveLatency`, `getAverageBitrate`, `getBandwidthEstimate`, `getBufferedPosition` minus `getPosition`,
`getStatistics` (the video bitrate, frame rate, dropped and decoded frames) and `getQuality` (name, size, codecs). It
draws them as white monospace lines on a translucent box in the player's top left corner. The panel is a drawable in
the player view's `ViewOverlay`: drawn over the video's `SurfaceView` and under Kick's own controls, which are
separate React Native views, so it never takes a touch. The switch is read at every refresh, so the panel appears
within a second of turning it on and goes at the next refresh after turning it off; while it is off the hook returns
before reading anything. Recorded videos show no latency line (IVS reports none for them). In picture-in-picture Kick
moves the video into a window-sized host above its views, which hides the panel.

Checked on the emulator, signed out, on a live channel with about 130,000 viewers: the panel showed a latency of
17.9 s, 569 kbps (network estimate 108.89 Mbps), 17.6 s of buffer, 74 of 371 frames dropped at 30 fps, 360p at
640x360 and `avc1.4D401F, mp4a.40.2` (the emulator's software decoder settles on 360p and falls behind), and it was
gone a second after the switch was turned off. `bin/test-kick` runs Kick's real `handlePlayerStatistics` on ART
(`PlayerProbe`) with a stand-in IVS player and Amazon's own `Statistics` and `Quality`: the six expected lines with the
switch on, drawn in the top left corner only, Kick's own code still running after the hook, nothing read from the
player while off, a player that throws tolerated, and the panel removed once the switch is off.

### Mute stitched live ads

Experimental, off by default, and not seen working on a real ad: none reached a signed-out session (see the live
ads notes under [Analytics and ads](#analytics-and-ads)). Kick's player can learn of a stitched ad break three ways,
and the patch listens to all three:

- IVS's `AdCue` (start, duration, pod position and count, roll type, tracking URLs), through
  `Player.Listener.onCue`, which Kick's listener ignores. The listener is the anonymous class that is the type of the
  view's `playerListener` field and keeps the view in a synthetic field. The hook goes at the start of its `onCue`:
  Kick's first instruction overwrites `this` with the name for `checkNotNullParameter`, so the patch borrows that
  register to load the view, and fails if that instruction moves. Only an `AdCue` starts a break. Any other cue (IVS
  timed metadata, `TextMetadataCue`) is logged with Debug logging on and otherwise ignored: nothing says which timed
  metadata would mark an ad, and streamers use it for other things.
- IVS's own ad break events, `onAdBreakStarted` and `onAdBreakEnded(AdBreak)`, for breaks IVS inserts itself. Kick's
  listener keeps `Player.Listener`'s empty ones; the patch adds the two methods to it, and fails if Kick ever
  overrides them.
- The ads of a MediaTailor session. `DatazoomAnalyticsManager` hands every forwarded session event to the view's
  `onMuxAdEvent` callback, the constructor's lambda that takes a `MuxAdEventData`: `adStart` starts a break for the
  ad's `durationSeconds`, `adEnd` ends it 1.5 s later unless the next ad of the pod starts. Kick only makes a session
  when the playback response carries a MediaTailor tracking URL and Datazoom runs, so with Disable analytics on (its
  default), which stops Datazoom, this signal never comes.

A break mutes the player through the view's own `setMuted`, so the command goes through Kick's player thread like
Kick's own, and sets the view's foreground to opaque black with "Ad break" in the middle: over the video's
`SurfaceView` and the Show video stats panel, under Kick's React Native controls. `setMuted` itself is hooked:
`KickAds` remembers the mute React Native last asked for, keeps the player muted when Kick asks for sound during a
break, and restores that request at the end, so a player Kick had muted stays muted. A break ends when its time is up,
when the IVS break or the last MediaTailor ad ends, or when the view loads another stream (`setStreamUrl`,
`loadSource`) or is destroyed. Its time: an `AdCue`'s duration for each ad left in its pod, else the cue's own span; an
`AdBreak`'s duration; a MediaTailor ad's; else 30 s; at most 4 minutes, plus 2 s, since a cue can come a little before
its ad. IVS gives cue times in milliseconds, and a duration under 1,000 is taken as seconds. With the switch off
nothing starts, and a break already running still ends, so Lurk never leaves a player muted or covered. The ad keeps
playing for its full length; this only silences and hides it, and Kick's player still reports it. In
picture-in-picture Kick moves the video into a window-sized host, which the cover doesn't reach; the sound stays off.

Checked with synthetic signals only. `PlayerProbe` (run by `bin/test-kick`) makes IVS `AdCue`, `AdBreak` and
`TextMetadataCue` objects with Amazon's own classes and Kick's own `MuxAdEventData`, and feeds them to Kick's real
listener (`onCue` and the added methods) and to the view's MediaTailor callback on ART, with the view's real `setMuted`
and player thread in front of a stand-in IVS player that records what it's told. Off, an ad cue changes nothing; on,
a timed-metadata cue changes nothing; an ad cue mutes and covers at once (opaque black with the label drawn), Kick's
own unmute during the break doesn't reach the player, and both come back when the cue's time is up and not before; a
cue for the first of three ads covers the whole pod; another stream ends a break at once; a player Kick had muted
stays muted afterwards; the IVS break start and end and MediaTailor's `adStart`, a quick `adEnd` and `adStart` between
two ads, and the last `adEnd` each do what they should; turning the switch off during a break still ends it. The cue
lengths come out as expected for milliseconds, seconds, a cue's own span and none.
On the emulator (Android 16), signed out, with the switch on and Debug logging on, 12 minutes of the most-watched live
channel (Arabic, about 130,000 viewers) and 15 minutes of a large English one (xQc), sampled every 30 s: Kick's
audio track was playing in 50 of 54 samples (paused in the rest while the stream rebuffered), the player was never
covered, and neither an ad cue nor any other cue, IVS ad break or MediaTailor event arrived, so no real ad could be
recorded; together with the earlier eight minutes, about 35 minutes of top live streams carried no ad signal of any
kind to a signed-out client.

### Sleep timer

The shared sleep timer arms on IVS `play()` and stops tracking a player on `pause()` and
`release()`, as on Twitch. When it fires, it pauses through Kick's player view (the one
React Native last played through), whose `pause()` also updates the audio service and lets
the player controls show Play. That view queues its IVS command on a player executor. The
injected executor hook wraps only operations enqueued during a sleep dispatch and checks the
expiry again when the command executes; a new start or resume invalidates queued broad pauses.
Ordinary player operations keep their original Runnable. The dispatch context is cleared even if
the action throws. Three seconds later, the fallback pauses only players eligible at expiry whose
play generation still matches; a genuinely missed old player remains eligible even when a different
player started afterwards. A notice says the timer paused playback.

The APK-free sleep tests cover both dispatch boundaries and the fallback with bounded two-thread
fixtures, including reentrant IVS stop callbacks. After decoding a Kick APK patched with Sleep timer,
run `python3 -I tests/kick/verify_sleep_queue.py <apktool-dir>` to check that the actual executor
Runnable argument receives the emitted expiry guard. Helper tests establish ordering and exclusion;
live playback, control state and background transitions still need device UI verification.

### Quality on mobile data

Part of Default video quality. Every quality ceiling reaches the player through
`KickIvsPlayerV2View.setAutoMaxQuality(Integer)`: the starting one, Auto, a picked quality
and the re-apply on each player state. Kick doesn't remember a pick across videos, so on a
metered network the choice caps a starting ceiling: none, Kick's 720 or the patch's own
height. Any other height is a pick and passes through, and Kick's stored values aren't
changed. Picking exactly 720p (or the patch's height) on mobile data can't be told apart
from a start and is capped too. Picking Auto is capped, since Auto means "let the app
decide". It applies when the ceiling is next set (a stream load or a player state change),
not on a network change mid-stream.

### Default startup tab

Kick is an Expo Router app: links go through `Linking.getInitialURL()`, which reads the
activity's intent when its action is VIEW. Its link mapper already turns
`https://kick.com/browse` into Browse and `https://kick.com/following` into Following. On a
fresh start from the launcher (no saved state, no link), the patch makes the launch intent
such a link before `MainActivity.onCreate` reads it. Links, notifications and restored
activities keep their own intent, and since the activity is `singleTask`, returning to a
running Kick keeps the current screen.

### Show exact counts

Kick's JavaScript writes every viewer and follower count through its own Expo module,
`requireNativeModule('KickIntlFormatter').formatNumber(number, locale, compact)` (for example in
`useFollowersCount`). Kick leaves `compact` unset, and the native
`KickIntlFormatterModule.formatNumber` treats anything but `false` as compact: a
`CompactDecimalFormat` with one decimal ("306.1K"). The patch hooks the start of that method: with
the switch on, `compact` becomes `false`, so the module's own plain formatter writes the number in
full with the locale's grouping ("306,112"). The module caches a formatter per locale and mode,
so the switch applies to the next count drawn, with no restart, and no JavaScript is edited.
Checked: `bin/test-kick` runs Kick's real formatter on ART (306112 gives "306.1K" off and "306,112"
on, also when Kick asks for compact explicitly); on the emulator, Browse's category viewer counts
went from "299.6K" to "297,116".

### Hide mature-content warning

A mature stream shows "18+ Mature Content Warning" over the player (the `MatureContent`
component), with Cancel and "I am 18+", also signed out. "I am 18+" calls the preferences
store's `setIsOver18(true)`. Whether the warning shows depends on `useIsOver18()`, which returns
the signed-in account's own `is_over_18`, or else that preference, read through the selector
`state => state.isOver18`. The patch makes only that selector return true (`returnAtEntry`,
found as the one function reading `isOver18`, and checked to be exactly LoadParam, GetById,
Ret): signed out, mature streams open as if you had answered "I am 18+"; signed in, the
account's age decides as before, and Kick's age-assurance checks (`useAgeProtectedContent`) are
not touched. The stored preference doesn't change. Restart-gated, like every Hermes switch.

Checked on the emulator, signed out, with Kick's data cleared: on a mature live channel the
warning showed with the switch off and "I am 18+" then played the stream; with the switch on and
Kick restarted, the same stream played with no warning. `verify_interface.py` runs the edited
selector (true when on, the stored value when off).

The same channel showed Subscribe and gift buttons signed out, which also checked Hide
subscription upsells on the device: with its switch on both disappear and Follow fills the row.

### Hide Home sections

`HomePageIndex` renders `FeaturedStreamsRow`, `RecommendedStreamsRow` and `CategoriesRow`,
then the sections Kick's server configures. Each row loads its own data and shows its own
loading placeholder, so returning null removes it and its placeholder; the server
sections move up. The recommended row only shows when signed in.

### Seek interval

Kick's player config holds `controls.skip.scale = {livestream: [60], vod: [10, 10, 10],
'live-vod': [10, 10, 10], clip: [10]}`. The `vod` and `live-vod` arrays read the same three
integers in the literal buffer, and nothing else reads them, so a choice edit rewrites the
three values. The live-edge and clip arrays share their bytes with unrelated literals and
stay.

### Don't save searches

The search-history store's `addHistoryEntry` prepends each query. It returns at its
opening guard instead, so nothing is added; removing a saved search still works. The store
is saved together with the sign-in tokens, so the patch doesn't clear it natively, and
searches saved before stay until you remove them.

### AMOLED black

Kick is dark only. Its `Colors.surface.default` object holds `highest` `#1C1E20`, `base`
`#141517` and `lowest` `#090A0B`. Hermes stores strings overlapping each other (`'#141517'`
shares bytes with `'1'`, `'17'` and others), so the colours aren't edited in place: the
object's string IDs in the literal buffer are swapped for existing strings. "Black
background" makes `lowest` `#000000`; "Black background and surfaces" also makes `base`
`#0B0B0C`, one step above black, so cards and sheets still stand out. `highest` (raised
elements and borders) stays. `MainActivity.onCreate` also sets the window background,
seen during transitions, to black. The splash screen, drawn before any app code runs,
stays Kick's `#090A0B`, and colours hardcoded in components stay as they are.

### Lurk in account menu

Kick's account menu (`AccountScreen`, the screen your profile picture opens) is React Native, so a
new row can't be added the way Rumble's is: Hermes edits keep their length, and nothing can be
inserted. The menu already ends with a row nobody but Kick staff sees: `AccountMenuItem` with
`href: '/dev-settings'`, icon `terminal`, label `t('account.items.settings.message')` ("Developer
settings") and `testID: 'Account-Menu-Dev-Settings'`, drawn only when the account's roles include a
staff role. The patch turns that row into the Lurk row:

- the role check's `JmpFalse` becomes a `Mov` of the tested register onto itself, so the row is
  drawn for every signed-in account;
- `LoadConstString key; Call2 t(key)` for the label becomes `LoadConstStringLongIndex` of the row's
  testID string and a `Mov` of that register onto itself, so the label skips the translation;
- the href's string ID in the literal buffer becomes the ID of a string that reads `lurk://settings`.

Hermes has no spare string, and strings can't be added, so two are rewritten in the string table
(`HermesBundle.rewriteString`: the first bytes in the string storage and the length byte of the
string's table entry). The row's own testID becomes "Lurk", which the label now loads too, and "Enter
valid JSON." becomes `lurk://settings`; that message belongs to the value check of the developer
feature-flag screen, which only the replaced row opened. A string can only be rewritten when it is no
identifier (property name), function name, object key or string-switch case, shares no storage byte
with another string (Hermes packs strings into each other: `'/dev-settings'` is the end of a route
file's name, so the href's own string can't be changed), and is loaded and read exactly where the
patch expects.

Tapping the row runs expo-router's `Link`: `lurk://settings` has a URL scheme, so expo-router hands it
to `Linking.openURL` instead of navigating. The patch hooks the start of React Native's
`IntentModule.openURL`: `Settings.openLink` opens Lurk settings for exactly that link and the promise
resolves with true; any other link goes on to Android as before. No activity declares the `lurk`
scheme, so other apps can't use it and nothing else in Kick opens it.

The patch is separate from the hidden settings patch because of what Hermes edits cost: like every
JavaScript patch it turns off Kick's over-the-air JavaScript updates, and putting it in the settings
patch would turn them off for native-only selections too. It is selected by default (the default
selection already edits Kick's JavaScript) and its switch starts on and stays on while Lurk is
paused, as it is a way back into the screen; turning it off takes a restart, after which the row is
Kick's staff-only row again.

Checked: `bin/test-kick-hermes` runs the edited `AccountScreen` code from the role check for an
account without staff roles (`verify_interface.py`): on, it draws an `AccountMenuItem` labelled Lurk
with href `lurk://settings`, which expo-router's external-link test accepts; off, nothing, as in stock.
`verify_literals.py` decodes every string with the switch on and off: exactly the two strings change.
`bin/test-kick` runs Kick's real, patched `IntentModule.openURL` on ART (`SettingsLinkProbe`): Lurk's
link starts the settings activity and resolves the promise; another link reaches React Native's own
code. On the emulator the patched Kick starts and runs, and the switch shows under Advanced. The row
itself on screen needs a signed-in account and wasn't checked.

### Chat page script

The switches that change chat lines (Ignore chat clears, Hide sub and gift messages, Hide host
messages, Hide reward redemptions, Chat keywords, Chat timestamps, Chat text size and 7TV emotes) work inside
Kick's chat page, since
that is where the lines are drawn. Any patch with one of them adds a hook to react-native-webview's
`RNCWebViewClient.onPageStarted` and `onPageFinished`, after their super calls. For a page on
`chat.mobile.kick.com`, other than the single-gift KICKs preview (`preview=true`),
`KickChat` evaluates the script (`patches/src/main/resources/kick/chat/chat-page.js`, copied
into the APK as `assets/lurk-chat.js`) with the switches that are on, and logs what it did.
With none on, nothing is evaluated. At page start the WebView can still be showing the
previous document, so the script runs at both, checks the page's host and applies itself once
per page. It only adds a style rule, replaces the list's `innerHTML` setter and observes the
list for new messages; everything else on the page is Kick's. With Show deleted messages on, it
also reports, once the page has loaded, whether the moderator view script ran ("moderator view"
or "no moderator view" in the `lurk` log).

What the scripts rely on in Kick's page is pinned in `tests/kick/chat-page-contract.json`: the
class names the live page uses (from its stylesheet and the classes its script adds, tests or
writes), the script's name and hash at capture, and a yes/no for each behavior a patch needs (the
list, a clear through `innerHTML`, the config read through `injectedObjectJson` first, the
moderator view, the timestamp and text size functions). It holds names only, none of Kick's code.
`python3 -I tests/kick/refresh_chat_page_contract.py --check` compares the live page with it and
fails when something Lurk needs is gone; without `--check` it rewrites the file (and still fails
on a missing item), so a refresh shows in the diff what Kick changed. `test_chat_page.py` checks
offline, in `bin/test-host`, that every class selector in `chat-page.js`, the moderator view
script and `KickChat` is one the captured page uses. The capture of 2026-10-22
(`/assets/index-C_aD-CUl.js`) has 72 classes and every required item. The page is served by Kick and
can change at any time: the script then does nothing for what it no longer finds, and Lurk
can't check it at patch time. `tests/kick/test_chat_page.py` runs it in headless Chrome on a
copy of the page's structure.

### Chat timestamps and Chat text size

Kick's chat page styles its lines from custom properties on `<body>` that its own code sets inline
from the app's chat settings: `--timestamps-display` (each line already has a `.timestamp`, shown
through it), `--chatroom-font-size` (text, emotes and badges scale with it) and `--message-gap`
(between lines). Kick's own chat settings menu has "Show timestamps" and "Text size", but tapping
it signed out opened the sign-in screen on the emulator. With Chat timestamps on, the chat page
script adds a stylesheet rule holding `--timestamps-display: inline !important`; Chat text size
holds `--chatroom-font-size` at the chosen 12 to 24 px, and Compact chat sets `--message-gap` to 0,
the line height to 1.3 and each line's vertical padding to 1 px. An author `!important` rule beats
the page's inline values, so the result doesn't depend on when the page applies its settings, and
while set, Lurk's choice wins over Kick's own. They apply to chats opened afterwards. The page
contract pins the three properties in the live page's stylesheet.

Checked on the emulator, signed out, on a live channel: with the switches on and 20 px chosen, the
page's own `--timestamps-display` was `none` while the timestamps showed, the message text measured
20 px, the list's row gap 0 and the line padding 1 px; off, the page's values applied.
`test_chat_page.py` checks the same on a page with Kick's rules, including the page setting its own
values afterwards, and `bin/test-kick-chat` checks the options KickChat passes on ART.

"Chat timestamps clock" (`chat_timestamp_format`, Twitch's key, values and default: `0` for 24-hour, 13:05, `1` for
12-hour, 1:05) applies while Chat timestamps is on, as on Twitch. Kick's page writes each line's time with
`toLocaleTimeString(locale, {hour: '2-digit', minute: '2-digit'})` in its config's locale: "01:05 PM" in English,
"13:05" in German, "01:05 م" in Arabic. The chat page script reads the hour and minute back from that text
through a table of every minute of a day written the same way, in the same locale (`window.locale`, else the config's,
else the page's default `en`), and writes them as Twitch does: `H:mm` or `h:mm`, without a period marker, as Twitch's
native chat (`SimpleDateFormat` with its `H:mm`, or Lurk's `h:mm`) and its React Native chat show them. Lines already
on the page are rewritten when the script runs and new ones as they arrive. Text the table doesn't know, or that two
minutes of the day share, stays as Kick wrote it. The page contract pins the page's call (`code:timestamp-format`).
`KickChat` passes the choice as the `clock` option only while Chat timestamps is on; it applies to chats opened
afterwards. `test_chat_page.py` checks the rewrite in headless Chrome (English 12-hour text to 24-hour and 12-hour,
later lines, a German page, and nothing without Chat timestamps), and `bin/test-kick-chat` the option on ART. On the
emulator, signed out, on a live channel with Chat timestamps on: the 12-hour clock showed 5:51 and, with the chat
reopened, the 24-hour clock 17:51 for the history and 17:53 for new lines.

### Chat keywords

The same lists and matching as on Twitch and Rumble (`ChatFilter`, keys `chat_keywords`,
`chat_highlight_mentions`, `chat_highlight_words`, `chat_highlight_vibrate`, `chat_blocked_words`,
`chat_blocked_users`): blocked users and words hide a message, a mention of you or a highlight word
tints it, whole words in any case, blocks first. Kick's chat page draws every line, and each line
element carries its sender (`data-sender-username`, `data-sender-slug`), its text as sent
(`data-original-content`) and its ID. With the switch on, the chat page script sends the lines
already shown and each new one (batched every 50 ms, at most 200 a batch) to the app through
react-native-webview's bridge, the way the 7TV catalog goes. `KickChat` takes only messages from
the chat page's origin with the page's generation token, matches each line with `ChatFilter`, and
answers through `evaluateJavascript` with the lines to tint (Kick green, a 16% background and a
left bar) or hide (`display: none`). Blocked users match the name shown or the kick.com handle.
Mentions use the signed-in account from the page's config (`selfUser`); your own messages never
count. "Vibrate on highlights" vibrates once per highlighted line, at most every three seconds,
through `ChatFilter.vibrate` (Kick declares `VIBRATE`). Nothing leaves the phone. The answer comes
after the page has drawn the line, so a hidden line can show for a moment. The bridge hooks
(`RNCWebView.onMessage`, `destroy`) live in the chat page patch and are shared with 7TV.

Checked on the emulator, signed out, on a live channel with about 40,000 viewers: with "o" blocked
and "e, kkk" highlighted, lines containing the word "o" had `display: none`, lines with "e" or "kkk"
and no "o" had the tint, others were unchanged, and the system recorded a 120 ms vibration from Kick.
Mentions need an account and were checked on ART only: `bin/test-kick-chat` runs the real `KickChat`
and `ChatFilter` with a batch from a page whose config names a signed-in user (blocked by name and
by handle, blocked word, mention, own message, highlight words and phrases, a malformed ID, a stale
generation and a foreign origin), and `test_chat_page.py` checks the page side in headless Chrome.

### Chat parity with Twitch

`tests/kick/test_chat_parity.py` (run by `bin/test-kick-hermes`; it needs no APK or device, only a JDK and Node.js)
checks that Chat keywords and Chat timestamps give the same result on Kick as on Twitch for the same input. On the
JVM it compiles the production `ChatFilter`, `KickChat`, `TwitchChatKeywords`, `TwitchChat` and `TwitchContext`
against small Android doubles, opens a Kick chat page through `KickChat.onPage` and hands it Chat keywords batches the
way the page script sends them, and asks `TwitchChatKeywords.classify`, which Twitch's native and React Native chats
both use, about the same messages with the same lists. 24 messages, with mentions on and off, cover mentions of the
account (by login or name and by display name or kick.com handle; your own messages never count), highlight words and
phrases, blocked words and users (`@` and case ignored), case folding beyond ASCII, whole-word matching and blocks
winning over highlights; all 48 verdicts are the expected ones on both apps. Twitch's login and display name stand for
Kick's name shown in chat and kick.com handle. For timestamps it formats six moments with Twitch's native pattern
(`TwitchChat.timestampPattern` applied to Twitch's own `H:mm`) and Twitch's React Native 12-hour clock (`chat.js`), and
runs Lurk's real chat page script in Node over pages whose times Kick wrote in English, British English, German,
French, Japanese and Arabic: each clock gives the same text everywhere. One difference is by design and not checked as
parity: Kick also hides a blocked user by kick.com handle, which Twitch, matching the login only, has no counterpart
for.

### Anonymous chat

The chat page's config (see [Show deleted messages](#show-deleted-messages)) is built by an anonymous function in
`HTMLChatWrapper`, found as the one that reads `getRequestBaseHeaders` and `searchParams` and loads
`https://chat.mobile.kick.com`. Besides the chatroom and the chat settings it carries three things from the app:
`headers`, from `getRequestBaseHeaders()`, which are the app's fixed request headers (`Cache-Control`, Kick's
`User-Agent`, `x-app-platform`, `x-app-version`, `x-kick-app` and a constant `x-req-trace`) and nothing about the
account; `token`, the secure store's sign-in token; and `selfUser`, `{id, slug, username}`, built only when there is
an account. The page keeps the token (`setToken`) and sends it as a Bearer token on its `authenticated` requests: the
realtime connection and channel tokens (`/api/v1/realtime/auth/connection` and `/channel`) and Pusher's
`/broadcasting/auth`, so its connection to Kick's chat is the account's. The config is in the page's address, so the
token and the account also reach `chat.mobile.kick.com` with every chat open.

With `chat_anonymous` on, two instructions of the config builder load undefined instead: the token's store into the
literal (its slot keeps the literal's `null`) and the account's load before the `selfUser` branch (the branch then
leaves `selfUser` undefined, which `JSON.stringify` drops). That is the config a signed-out app builds; `headers` and
everything else stay. The edit is one 8-byte window, found by its instructions (the token slot's store on the
literal, the environment load the `JmpFalse` tests, and the `selfUser` store it jumps to), not by register numbers.
It is a Hermes switch, so it applies after a restart.

Sending is disabled with it, as on Twitch: the app sends chat itself, signed in, through its own API, which would put
your name in the chat you read as a guest. `KickHttp`, the OkHttp interceptor that every React Native client gets from
`OkHttpClientProvider.createClientBuilder()` (shared with 7TV emotes), refuses `POST` requests to Kick's
`/api/v2/messages/send/{chatroom}` (messages, replies and quick emotes) and
`/api/v2/chatrooms/{id}/celebrations/{id}/action` (which can post a celebration message) with an `IOException`, before
they reach the network. React Native's fetch then rejects as on a lost connection and Kick's send handler gets
an error; what Kick shows for it couldn't be seen without an account. The interceptor is added when Kick builds its
clients at start, so this also applies after a restart, together with the config edit. Mentions of you aren't
highlighted while it's on, by Kick's page or by Chat keywords, since both take your name from `selfUser`.

What it doesn't change: the app's own realtime connection, which subscribes to the channel's chatroom events for the
stream screen (hosting, subs and gifts) and authenticates with the account, and the player's playback request
(`postPlayerTelemetry`, which returns the stream URLs), both still identify you to Kick. Whether Kick's chatter list
comes from the chat page's connection, and so leaves you off it, couldn't be checked: there is no Kick account to
look at the list with, so the signed-in effect is known from the code only, and the description says so.

Checked: `verify_chat_config.py` (run by `bin/test-kick-hermes`) executes the config builder from its object literal
to `JSON.stringify` with the APK's edit off and on: off, the config carries the token, `selfUser` and the headers; on,
the token is `null`, `selfUser` absent, the headers and every other value unchanged, and the JSON holds neither the
token nor the account, as the stock code builds it signed out. `bin/test-kick-chat` runs the real `KickHttp` on ART:
with the switch on it refuses message, reply and celebration posts on `kick.com` and its subdomains without calling
the network, and passes a `GET` of the same path, other `POST`s, other hosts and the playback request; off, no
interceptor is added. On the emulator, signed out, on a live channel with about 130,000 viewers: with the switch on and
Kick restarted (37 Hermes edits selected), chat loaded and drew new messages, and the page's config, read through the
WebView debugger, was the same as with the switch off (`token` null, no `selfUser`), as a signed-out app's is.

### Third-party emotes

"7TV emotes" (`emotes_7tv`) starts off and requires restart. Enabling it adds channel
and global emotes to messages, the existing native picker and native `:query`
autocomplete. A channel alias wins over a global alias; native Kick names win in the
picker so name-only native callbacks remain unambiguous. Selecting 7TV inserts the raw
word in the existing draft at its UTF-16 selection, preserving replies and stock send
handling. It requires the authenticated session and the current native composer's
committed `editable` permission/rules prop. It never sends a message itself.

The page independently fetches globals and the channel owner's set from 7tv.io. Each
request has a 10-second header/body deadline, a 2 MiB response limit and at most three
transient attempts; 429 honors a capped Retry-After. Successful globals render while
owner lookup stalls. Failed or malformed refreshes retain the last valid catalog. Authoritative no-set responses
and omitted empty emote vectors clear the removed entries and reconcile set subscriptions. The owner's Kick
user ID comes from the same Kick response the app already received for the channel (`KickHttp`), so the page
never asks Kick itself; a channel whose owner the app hasn't seen gets globals only. Native channel lookup maps
hold at most 256 entries.

Active-set and emote-data zero-width flags layer over the adjacent emote, including a
native Kick image; layers never cross text, links, newlines or messages. A standalone
overlay renders normally. Live refresh restores only Lurk-owned nodes and preserves
existing native/link handlers. Catalog changes update existing messages and native
suggestions without replacing draft/reply state.

The feature subscribes to current set IDs at **wss://events.7tv.io/v3**, debounces
validated set updates into refetches, watches heartbeats, and reconnects with capped
backoff (at most eight attempts per burst). Visible pages revalidate every five minutes
to find changed channel sets. Hidden pages abort requests and close sockets; page
teardown cancels observers, timers, sockets and fetches. Provider GETs omit cookies and
referrers; images use no-referrer. 7TV receives the channel owner's Kick ID, set IDs and
normal request IP metadata; it receives no Kick credentials or chat draft. Because the
lookup repeats every five minutes and the socket stays open while a chat is visible, 7TV can
tell from your IP address which channels you watch and for how long; the patch description and
the switch say so. Images load from **cdn.7tv.app**. With the patch excluded or the switch off, Lurk makes no provider
requests. 7TV badges and paints are not included.

The WebView sends only bounded catalog snapshots for its current native document token
and channel. Native validation strips unknown fields, rejects foreign origins/stale
documents and allows only 7TV CDN emote URLs. Input-ref reset/remount retires the native
catalog generation; a fresh page association is required before augmentation resumes.
Pagehide and native WebView destruction invalidate only that page’s authority. The stock WebView bridge continues to
handle ordinary messages. A separately compiled HBC99 bootstrap extends chatRoomStore,
ImageCacheV2.getImage and the existing picker/autocomplete actions. Module IDs come
from unique export/Metro registration signatures in the hash-locked stock bundle.
Native images use Kick's cache. Exact `files.kick.com` and `files.cdn.kick.com` image
requests are mapped to 7TV. Static requests use `2x_static.webp` for animated sources;
naturally static sources retain `2x.webp`. The native section supplies Kick's supported
globe tab icon and an accessible 7TV label.

Builds compile committed `patches/src/main/runtime/{kick,twitch}/*.js` through
`bin/lib/compile-hermes.py`, using official mise-managed `hermes-compiler` packages
`260318099.0.4` (HBC99) and `250829098.0.19` (HBC98). The packages have no executable shim;
the script resolves their package location with Node and verifies package provenance,
compiler version and emitted header. Generated resource metadata records source,
compiler-binary and bytecode SHA-256. Gradle regenerates resources and removes obsolete
outputs; CI installs the same pins before host checks and build. No generated HBC is
checked in. The reusable Java loader validates metadata and queues the compiled bundle
after either main-loader branch, retaining only weak runtime references cleared on
destroy.

`tests/kick/test_chat_page.py` executes the real page script in offline Chrome;
`test_composer.js` is a boundary fixture, not proof of the native UI.
`test_page_lifecycle.js` drives the production page function with controlled provider
responses and timers to verify authoritative removals, sequence-gap refetch, heartbeat
expiry, retry exhaustion, set-ID resubscription and disposal. `bin/test-kick-modules <stock index.android.bundle>` checks the pinned HBC export/registration discovery, and `bin/test-kick-catalog` exercises
the APK's Java data validator on ART. Actual runtime loader ordering, image rendering,
composer insertion and sourceURL preservation are checked separately in the target app.
The emulator smoke rendered the native 7TV picker and suggestions, inserted raw words
into a middle-of-draft selection and proved its native caret by subsequent typing. It
uses the documented ARM translation workaround, so it is not physical-phone UI proof.
Insertion uses the pinned AndroidTextInput Commands.setTextAndSelection with the current
host event counter, followed by stock draft/selection setters. Text and caret change
atomically, so the later native span replacement preserves the caret's distance from
the new end. There is no delayed correction to overwrite later user movement. Authenticated
send correctness requires a separately authorized send test.

## Implementation contracts and verification

The Hermes helper accepts only the pinned v99 bundle SHA-256, parses its function
and string tables, requires unique targets and rejects overlapping or unequal-length
edits. The official Morphe `hermesPatch` performs the actual replacements and footer
update. A generated manifest (`assets/lurk-hermes.json`, format 2) records each edit's
original bytes and, for a switch, its replacement and default, or, for a choice, the
bytes each choice value writes and the value the APK ships with. The native
bundle loader takes a settings snapshot. When every setting is at its patch-time
default it loads the embedded asset as is and deletes any earlier private copy and its
sidecar; otherwise it verifies the embedded hash, chooses ranges from the snapshot, refreshes
SHA-1 and atomically writes an app-private bundle (`code_cache/lurk-kick.hbc`), then a
sidecar (`lurk-kick.json`) with the embedded bundle's SHA-256, the snapshot, and the private
copy's length and SHA-256. A later start with the same embedded bundle and the same snapshot
reuses the private copy once its length and SHA-256 still match, instead of reading, editing
and writing 12 MB again (on the emulator: about 110 ms to build, 30 to 60 ms to reuse); any
difference builds it again. Turning every switch off and every choice to 0 reconstructs the
original bundle byte for byte; reloading in the same process keeps the original snapshot. On
a manifest/file error it logs and uses embedded defaults. `bin/test-kick` checks the reuse,
the rebuild for a changed setting, a changed copy and another embedded bundle, and the
cleanup at defaults on ART.

The edit helpers, all equal-length and fail-closed:

- Every bytecode edit, whatever made it, must start and end on instruction boundaries, leave
  the code after it decoding as before, and keep every jump and switch case out of its changed
  bytes: a branch landing after the first changed byte and on or before the last one is
  refused at patch time, since it would run the replacement from its middle or from the
  Unreachable (`0x00`) padding that aborts the process. Switch cases come from the jump tables,
  which v99 writes right after a function's declared bytecode, at the next 4-byte boundary:
  `UIntSwitchImm` has one 32-bit offset per value from its min to its max, `StringSwitchImm` a
  (string ID, offset) pair per case, both counted from the switch.
- `returnNull` / `returnAtEntry`: return null, undefined or false as a function's first
  instruction. `returnAtEntry` takes any prologue of environment, global, parameter and
  property loads, decoded with the v99 instruction lengths; both refuse a function that
  branches into the replaced bytes.
- `skipGuard`: a handler's opening `if (!event) return;` jump becomes a `Mov` of the
  tested register onto itself, so the handler always returns before doing anything.
- `dataChoice`: values in the literal buffer that array and object literals read, as a
  choice. Hermes shares value bytes between literals, so each edit
  names the literals allowed to read its bytes and fails if any other literal does. Their
  replacement window is grown until its original bytes are unique in the bundle.
- `dataSwitch`: a literal-buffer edit like `dataChoice`, as a switch; the same reader check.
- `rewriteString`: makes a string read a shorter ASCII text while a switch is on (its storage bytes
  and the length in its table entry). Refused unless the string is no identifier, function name,
  object key or string-switch case, shares no storage byte with another string, and is loaded and
  read only where the patch says. `verify_literals.py` decodes every string with each switch on and
  requires exactly the expected ones to change. See Lurk in account menu.
- `functionUsing`: selects an anonymous function by the properties it reads and the
  strings it loads, rather than by bytes that embed build-local string IDs.
- Edits only one patch needs live in that patch: Disable autoplay rewrites
  `preferencesSettingsSlice` with `replaceBody` (its body size and offsets are pinned, so any
  change fails the patch), and Hide subscription upsells finds `ChannelSubButton`'s unsubscribed
  path with `sequence` (the `subscription` read, the forward `JmpTrueLong` on it, the next
  `GetByIndex`). Opcodes are named in `HermesOp`.
- `objectKeys`: an object literal's property names, read from the bundle's shape table in
  slot order, so an edit can find the slot a named property is stored in.
- `literals` / `slotArrays`: every array and object literal instruction with the value
  bytes it reads, and the array literals stored into an object's slots right after it is
  made. Literal edits find their values through these, not through buffer offsets.
- `sequence`, `reads`, `creates`, `getById`: one run of instructions matched by opcode,
  property, object keys and register flow, and a `GetById` pattern built with this bundle's
  string ID. Shape numbers, literal offsets and string IDs change in every Kick release;
  these keep the registers and code shape exact without pinning those numbers.

Verification tools retained in this repository. The ones that need no device run together:

```sh
bin/decompile kick                       # once per Kick version: the stock bundle and decode
bin/test-kick-hermes "$MORPHE_WORK/out/kick-<version>-patched.apk"
ANDROID_SERIAL=emulator-5580 bin/test-kick "$MORPHE_WORK/out/kick-<version>-patched.apk"
ANDROID_SERIAL=emulator-5580 bin/test-kick-chat "$MORPHE_WORK/out/kick-<version>-patched.apk"
```

Probes that call Kick's own methods take their names from the patched APK where they can: the
patches record what they matched with `Locators.record` (`patches/shared/Locators.kt`), and the
settings patch writes the records into `assets/lurk/locators.json`. Kick records the Disable
analytics hooks (`kick.disable_analytics.firebase_log_event`, `datadog_initialize`,
`pal_generate_nonce`, `insider_session_upload_job`, `insider_amplification_job`,
`fingerprintjs_visitor_data`, `fingerprintjs_visitor_id`, each a full method reference) and Fill
screen's transform (`kick.fill_screen.surface_transform`), which `BundleProbe` runs on ART, and the
Metro module IDs the 7TV composer found
(`kick.third_party_emotes.module_store`, `module_images`, `module_session`, `module_host`,
`module_input`), which `bin/test-kick-modules <stock bundle> <patched.apk>` compares with a fresh
discovery. While an APK has no locator file, both fall back to the names and IDs written in the
probe, and say so. Kick's own classes keep their names (R8 doesn't rename them), so today this
mostly protects against library renames and Metro renumbering.

`bin/test-kick-hermes` runs `verify_sources.py`, `test_hermes.py`, `verify_literals.py`,
`verify_interface.py`, `verify_hosting.py`, `verify_chat_config.py`, `verify_quality.py`, `HermesProbe.kt`,
`verify_player.py`, `verify_privacy.py`, `test_chat_parity.py`,
`verify_sleep_queue.py` and `verify_analytics_jobs.py`, and skips (saying so) the ones for patches
the APK doesn't have; patch with `-e "Default video quality"` to include the quality check. The
stock bundle's hash and the Kick version come from the patch sources (`tests/kick/pins.py`), so a
version bump edits them in `Hermes.kt` and `Constants.kt` only.

- `tests/kick/verify_resources.py`: actual decoded resource/manifest assertions,
  including signature-protected token sharing, intact internet permission and
  (`--analytics`) Firebase Analytics starting disabled.
- `tests/kick/HermesProbe.kt`: actual-bundle parsing, negative controls for every
  helper, uniqueness, overlap rejection, preview literals, unique literal windows and
  exact restoration. It decodes every function of the bundle and requires every jump and
  switch case (19 `UIntSwitchImm` and 117 `StringSwitchImm` in 40.33.0) to land on an
  instruction boundary, and checks that an edit whose changed bytes span a jump's or a switch
  case's landing point is refused while the same window changed only after it is accepted. It
  runs on the JVM, compiled with `kick/shared/Hermes.kt`.
- `tests/kick/test_hermes.py`: independent instruction/branch decoding of emitted
  edits; all-on, all-off, each switch alone and each choice value (plus 0 and an
  unknown value); SHA checks.
- `tests/kick/verify_literals.py`: for literal-buffer edits, decodes every function and
  requires that only the intended array/object literals read the edited bytes, and that
  every choice value keeps each literal's tags, count and length. For string-table edits it
  decodes every string with each switch on and requires exactly the expected strings to change,
  none of them an identifier. `test_hermes.py` runs it.
- `bin/test-kick`: first checks with `tests/verify_extension_calls.py` that Kick's code
  calls every extension method in `tests/kick/expected-hooks.txt` (the default selection's
  hooks), so an injected call Morphe dropped fails the run; then executes the injected Java
  loader on Android, checking defaults, process snapshots, independent switches, the exact
  bytes of each choice value, exact stock restoration and the reuse of the private copy;
  invokes the two Insider job guards and checks synchronous completion without SDK dispatch. A second probe,
  `PlayerProbe`, runs the player view's hooks in a fresh process with Kick's real player classes and a stand-in IVS
  player (Show video stats, Mute stitched live ads). A third, `SettingsLinkProbe`, calls React Native's
  patched `IntentModule.openURL` with Lurk's link and another one (Lurk in account menu).
  Hand-written invokes in the Kick patches either use `/range`, copy a parameter into low
  locals first (Datadog's `initialize`, whose promise is `v11` today) or call
  `requireLowRegisters`, so a later Kick version with more locals fails at patch time instead
  of losing the call.
- `tests/kick/verify_privacy.py`: production share/PAL helpers with boundary doubles,
  including host spoofing, functional parameters, switch isolation and the opt-in
  fingerprinting block.
- `tests/kick/verify_interface.py`: executes the emitted Interface edits, off and on, in a
  small interpreter with boundary doubles: the Browse and channel tab lists lose Clips with no
  hole and Chat moves up, the category header keeps Live only, the PopularClipsRow element
  becomes null, ChannelSubButton returns null only on its unsubscribed path, the tipping, gift,
  leaderboard, Home row and update components return null at entry, and the AMOLED surface
  object holds each choice's colours with its other values unchanged. It also shows that the
  registers Hide Clips overwrites with undefined hold undefined there in stock code; the patch
  checks the same at patch time (every instruction naming the register first must load
  undefined or return it).
- `tests/kick/verify_quality.py`: interprets actual reset/setter instructions to
  verify first playback, Auto, explicit selections and clearing a selection. Its
  negative control reproduces the initial-only patch's 1080p-to-720p reset bug.
- `tests/kick/verify_analytics_jobs.py`: compares actual decoded job methods with
  stock, including unchanged instructions, branches and exception handlers when off.
- `tests/kick/test_chat_page.py`: the chat page script in headless Chrome, offline, on a copy
  of the page's structure: host guard, one application per page, hidden lines, ignored
  clears (with a control), 7TV words in old and new messages, global emotes only without a known
  owner (and no request to Kick), and no referrer or cookies on its requests (with a control).
- `tests/kick/verify_player.py`: production `KickPlayer` with boundary doubles: the
  mobile-data ceiling's decision table (with and without a Default video quality
  height), normal latency and the background audio decisions.

The combined APK was built and patched with all twelve patches. Its resource,
signature and alignment checks passed. Native-only and Clips-only combinations
passed and registered exactly their selected settings. Rumble still patched with
the shared extension, and its profile/entity integration probe passed.

Runtime tests use the existing Android emulator. Both stock Kick and the patched
clone initially fail in SoLoader because the x86 emulator's direct-APK loader searches
for x86 libraries while this upload supplies ARM libraries. Extracting the original
ARM libraries into each test install's native-library directory allows startup through
the emulator's existing translation layer. This workaround changes only the emulator;
it is not shipped in a patch or APK. The apps coexist, the patched bundle executes,
Home/Browse/channel screens open, and the Lurk screen/shortcut is registered. Browse
and channel tabs show the intended Clips removal, and Videos navigation works.
Public live playback and incoming chat were exercised with analytics and interface
patches enabled. The final combined asset has 25 edits across 20 functions and six
independent Hermes switches; the native sharing/analytics switches are separate.
The visible Hide Clips switch and Restart Kick action were exercised: the process
restarted, its private bundle matched the selected bytes exactly, and Browse's Clips
tab returned. The launcher shortcut points to the non-exported settings activity; App info reaches
it through the alias, which answers only APPLICATION_PREFERENCES.

These tests do not establish zero telemetry from the first process instruction.
Firebase's content provider initializes before the application collection hook, so
Disable analytics also sets the manifest's `firebase_analytics_collection_enabled`
default to false; Firebase prefers the value the startup hook persists, so the switch
still turns collection back on.
The native composer, provider and loader paths were checked again on the emulator and on a phone on
2026-10-18, after the historical observations above.
Authenticated feature flows, broadcaster token sharing and every server ad configuration
need device/account coverage. Do not interpret SDK suppression or static VOD fallback
validation as verified removal of every video ad.

Retained patch-integration regressions: `tests/kick/verify_hosting.py` executes the emitted
`stay_on_host` manifest edit, actual JSX handlers/countdown and persistent React compiler caches.
It covers waiting, Watch now, Cancel/close, stock/off behavior, route guards and consecutive events,
with three failing bytecode mutations. `bin/test-kick-chat <patched.apk>` captures production
KickHttp/KickChat JavaScript on ART and runs it in offline Chrome, covering response preservation,
full/info channel IDs, malformed and missing config, globals, previews and independent switches.
Malformed config now falls back to global emotes while retaining hide/ignore-clear options.
See `tests/README.md` for prerequisites and the exact boundary limitations.
