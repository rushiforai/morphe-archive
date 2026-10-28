# Rumble 3.21.0

`Unlock Premium` targets `com.rumble.battles` **3.21.0 / versionCode 887**, using the
APKMirror APKM and signing certificate pinned in `rumble/shared/Constants.kt`.

Sign in, or sign out and back in after installing, to fetch a fresh profile. The patch
overrides the profile's local premium flag; a signed-out session never fetches that
profile. Server-authorized streams, purchases and subscription metadata are unaffected.
Signed-in behavior has not been verified with an account (see below).

## Implementation

Inspired by the profile-entry approach in
[hoomans-morphe-patches](https://github.com/arandomhooman/hoomans-morphe-patches/blob/018277825a611ad61f3a16a70e562291c06f4081/patches/src/main/kotlin/hooman/morphe/patches/rumble/premium/UnlockPremiumPatch.kt),
which targets 3.14.5. This implementation fingerprints the specific `isPremium:Z`
field read, method signature and two-instruction getter, requires a unique match,
and returns `true` after that read while the `unlock_premium` switch is on (see
[Lurk settings](#lurk-settings)). It does not depend on the obfuscated getter name
or the assumption that the DTO has only one boolean getter.

The independently traced 3.21.0 path is:

```text
UserProfile.l() reads isPremium (JSON is_premium)
  -> we.a.t(...) maps it into lf.h
  -> lf.h.x() returns the entity's premium flag
  -> mf.f passes it to yg.d.d1(...)
  -> session DataStore key isUserPremiumKey
```

These obfuscated names describe this APK only; they are not patch fingerprints.
Only the getter's result changes. Nullable `premiumData`, account
validation, age verification and onboarding retain their original behavior.

### What a premium flag without premium data does

The patch leaves `premiumData` (JSON `premium`: plan, start and expiration dates, renewal, provider) null
for a free account while `isPremium` reads true. Traced in 3.21.0:

- The mapper turns `premiumData` into an entity (`UserProfilePremiumDataEntity`), and the profile use cases
  only ever test it for null: `isUserPremiumKey = premiumData != null || isPremium`. Nothing in the app shows
  the plan or dates, so a null `premiumData` with the flag on has no code path that could fail on it.
- The session's premium flow (the `isUserPremiumKey` reader) feeds the ad use cases, the feeds' and video
  page's view models, the Downloads screen and the Premium upsell checks. With it true the app stops asking
  for ads and shows Downloads instead of its upsell.
- Premium-only videos, live gates (`liveGate`), downloads and premium comments are decided by the server:
  each video carries `has_access_to_premium`, and its sources, download and comment requests are authorized
  with the session. The patch can't change those. What the app shows when the server refuses (an empty
  player, an error, a paywall) has not been seen.

None of this was run signed in: there was no Rumble account for testing. `PremiumProbe` runs the getter and
the mapper on the real APK with fixtures.

## Build and test

With GitHub Packages access configured as described in the workspace README:

```sh
bin/patch rumble
bin/emu start
bash bin/test-rumble ~/build/lurk-morphe-patches/out/rumble-3.21.0-patched.apk
```

`bin/test-rumble` runs every probe in `tests/rumble/`, or only the ones named after the APK
(`bash bin/test-rumble <apk> PremiumProbe`). Running them all also runs three checks on the APK's dex:

- `tests/rumble/verify_compose.py`: the Compose trace labels and App Info rows the patches rely on (see
  [Finding code](#finding-code-in-3210)).
- The extension hooks: `tests/rumble/expected_hooks.py` reads the settings registry out of the dex and lists
  the hooks of `tests/rumble/expected-hooks.txt` whose setting is registered, and
  `tests/verify_extension_calls.py` fails unless app code calls each one. Add a line there with every new hook.
- `tests/rumble/verify_switch_reads.py`: every registered setting's key is loaded by some code, app or
  extension, so a switch can't silently do nothing.

| Probe | Covers |
|---|---|
| `AdsProbe` | Block ads: the repository's ad answers, Boosted videos left out of the five video lists, `Video.boosted`, `ad_block` sections |
| `PrivacyProbe` | Disable analytics and Keep watch progress, Block cookie notice (Ketch, cached consent, the Airship-only start loop, Airship features), Clean share links |
| `HideProbe` | Hide Shorts (parser, channel tabs, `ShortsListView`), Hide Premium upsells, Hide tipping and Rants |
| `PlaybackProbe` | Fill screen (Media3's real `AspectRatioFrameLayout` measured in landscape and portrait), Seek interval, the sleep timer's pause through the listener |
| `ChatProbe`, `KeywordsProbe` | Hide chat clutter, Show deleted messages, Chat timestamps, Chat keywords |
| `CountProbe`, `InterfaceProbe`, `SearchProbe`, `UpdateProbe` | Show exact counts, startup tab and Home sections, Don't save searches, Block update prompts |
| `ThemeProbe` | AMOLED black: the theme's color set and the palette || `PlayerProbe`, `QualityProbe`, `RefreshProbe` | Remember speed, audio focus, keep screen on; Default video quality; Refresh stream |
| `PremiumProbe` | Unlock Premium's getter and mapper |

Disable autoplay changes DataStore defaults inside coroutine readers that can't run under `app_process`;
`verify_switch_reads.py` checks that its keys are read, and the 2026-10-14 walk-through covers the behavior.
Composables are called with a null Composer: a hooked one returns before touching it, Rumble's own code
fails on it. Each probe calls the patched APK's real methods; settings are
switched by rewriting their defaults in the registry, since there is no Context under `app_process`
(`ProbeSupport.setting`). `tests/rumble/verify_settings.py <apktool-dir>` checks the settings registry of a
decoded patched APK: unique keys, valid sections and choices, and the documented defaults. `PremiumProbe` executes the actual APK's profile
getter and mapper on `emulator-5580` using free and paid fixtures, including absent subscription
metadata. It also checks unrelated account state. No probe uses a Rumble account or sends API
requests.

The probes reach obfuscated classes, methods and fields through locators: while patching, each patch records
what it matched with `Locators.record("rumble.<patch>.<what>", …)` (50 entries with the default patches:
classes as `Lpkg/A;`, methods as `Lpkg/A;->name(…)R`, fields as `Lpkg/A;->name:T`), and the settings patch
writes them into the patched APK as `assets/lurk/locators.json`. `ProbeSupport.locate`, `type`, `method` and `fieldName` read that
file from the APK on the probe's classpath and fall back to the names in 3.21.0 while it is absent (the stock
APK, or a build from before the asset). A new Rumble version then needs no probe edits for anything a patch
matches. What no patch touches (Compose state internals, ExoPlayer and Composer methods in `RefreshProbe`, the
profile mapper in `PremiumProbe`) stays pinned to 3.21.0 and has to be re-derived; other lookups go by type or
signature (`ProbeSupport.bySignature`, `staticOfType`).

To confirm the negative control, the same probe against the original base APK must
fail with `Profile must report premium when server is_premium=false`:

```sh
bash bin/test-rumble ~/build/lurk-morphe-patches/rumble/3.21.0/base.apk PremiumProbe
```

## Validation on 2026-10-14

- Stock APK: the expected assertion fails. Patched APK: free and paid fixtures pass.
- Morphe Desktop 1.18.1 applies the patch, rebuilds and signs successfully.
- The signed APK installs and cold-launches to Rumble's sign-in screen on Android 16.
- All six output DEX files pass `dexdump` and D8; APK manifest, signature and alignment
  verification pass. The optional cross-DEX verifier reports the same 42 missing
  optional SDK/reference issues on both stock and patched APKs, with no added issues.
- The workspace Gradle build was blocked by HTTP 401 from GitHub Packages, so the tested
  `.mpp` was compiled against the patcher API in the existing Morphe Desktop JAR, using
  the Kotlin compiler and Android D8. It contains both JVM classes and Android DEX.
  Releases build the patch with Gradle in CI.

Artifacts are in `~/build/lurk-morphe-patches/out/`: `rumble-3.21.0.mpp`,
`rumble-3.21.0-patched.apk` and the Morphe result JSON. Build and verification logs
are in `~/build/lurk-morphe-patches/build-rumble/`; the launch screenshot is in
`~/build/lurk-morphe-patches/shots/rumble-premium-launch.png`.

## Lurk icon

`Lurk icon` replaces the launcher icon with `assets/rumble-icon.png`. Rumble 3.21.0 builds its
adaptive icon from `drawable/ic_launcher_background.xml` and `drawable/ic_launcher_foreground.xml`
(`mipmap-anydpi/ic_launcher[_round].xml`) and ships `.webp` fallbacks per density. The patch
overwrites those files under the same names, so resource IDs and the manifest stay untouched, and
adds a themed (monochrome) layer. It fails if any of the files is missing in a new version.

Regenerate the resources after changing the artwork with
`bin/app-icon rumble <artwork.png>`.

Validated on 2026-10-14 with a local build: Morphe Desktop 1.18.1 applies `Lurk icon` and
`Unlock Premium` to 3.21.0; the launcher and the Android 16 splash screen show the new icon and the
app cold-launches to its home feed.

## Block cookie notice

Rumble 3.21.0 shows its cookie and privacy notice through the Ketch consent SDK (organization `rumble`,
property `rumble_android_app`). Rumble's consent service calls `Ketch.load()` at startup and on every
resume. Settings > Data Consent calls `Ketch.showPreferences()`. Each loads Ketch's web experience in a
WebView, which fetches the config for the user's jurisdiction and sends the identities Rumble supplied
(Android advertising ID and AppsFlyer installation ID) to `global.ketchcdn.com`. What it shows depends on
the jurisdiction: a banner or modal where privacy laws apply. In `us___no_privacy_laws` it shows nothing
and records consent to every purpose (`targeted_advertising`, `analytics`, `essential_services`).
Recorded consent starts AppsFlyer and enables Firebase Analytics. Opening Data Consent records the same
defaults as soon as the dialog appears, before anything is tapped.

The patch makes both SDK methods return `false` immediately, which is what they return when they cannot
create the WebView. They are found by the SDK's log lines ("Not loading…" / "Not showing preferences…
as an experience is already being shown") and the `(ZZII)Z` signature, so the R8-renamed class name
doesn't matter. Without stored consent, Rumble's tracker hooks only ever receive an empty purpose set:
AppsFlyer is never initialized, and Firebase Analytics, Firebase Performance and the Facebook SDK's
automatic event logging stay off.
Settings > Data Consent no longer opens anything.

Rumble also keeps the last decision in `consent_cache.json` and applies it at startup without Ketch, so
consent recorded while the switch was off, or before the patch was included, would still start the
trackers on every launch. While the switch is on, the cached model's `hasDecision` getter returns `false`
(found as the class whose `toString` starts `CachedConsent(hasDecision=`; it is the only `()Z` there).
Startup then hands every tracker an empty purpose set, as on a fresh install: Firebase Analytics,
Crashlytics, Performance and Facebook switch their persisted collection off again, and AppsFlyer is never
started. The cached consent strings still go into ad requests, which Block ads stops. Turning the switch
off uses the cached consent again.

### Push notifications (Airship)

Rumble's consent service keeps a set of trackers (AppsFlyer, Firebase Analytics, Crashlytics, Performance,
Facebook, Airship), each tied to one purpose. Two loops hand them the granted purposes: an update loop that
every change runs, and a start loop that runs once, only when a decision exists. Airship, Rumble's push
service, is taken off in its tracker's start method, so with no decision it never starts. Rumble files
Airship, Crashlytics and Firebase Performance under `essential_services`. Granting that purpose through
Rumble's own path would switch Crashlytics and Performance on too, and the start loop starts AppsFlyer
whatever was granted (its start method calls `init` and `start` and only passes the purposes on as consent
flags). So stock Rumble starts AppsFlyer even for a user who rejects everything but essential services.

While Block cookie notice is on, the start loop (found in the consent service, whose constructor checks
`trackers`, `sendDebugLogEventUseCase` and `getAdvertisingIdUseCase`, as the `()V` method that sets a flag
and calls the tracker interface's `(Set, boolean)` method) starts only the tracker that calls into
`com.urbanairship.UAirship`, with `essential_services`. It sets the loop's "started" flag itself, so it runs
once. The other trackers only ever get the update loop's empty set.

For `essential_services` the Airship tracker enables push, contacts (your Rumble user ID as Airship's named
user when signed in, as in stock Rumble), tags and attributes, in-app messages and Airship's own analytics.
`RumblePrivacy.airshipFeatures` filters the array the tracker passes to Airship's privacy manager and drops
analytics (Airship's public `FEATURE_ANALYTICS` value, 16) while the switch is on.

Checked on 2026-10-22 on the Android 16 emulator, signed out, default patch selection:

- Fresh install, switch on: logcat shows `consent: starting Airship with essential_services only`, Airship's
  "taking off", "Airship ready", "Push registration updated", and `consent: Airship analytics left off`
  followed by Airship deleting its analytics events. Airship's `PrivacyManager.enabledFeatures` is 101 (in-app
  messages, push, tags, contacts). No Ketch, AppsFlyer or Crashlytics connections; Firebase consent `G100`.
- Switch off (Ketch records consent): Ketch, AppsFlyer (`cdn-settings.appsflyersdk.com`) and Crashlytics
  settings connect, and Airship's features are 117 (the same plus analytics).
- Switched on again and restarted: features 101, Crashlytics and Performance collection persisted as off.
  Crashlytics sent the reports it had queued while it was on (`crashlyticsreports-pa.googleapis.com`) during
  that first launch, before the empty purpose set reached it.
- Within 45 s neither run created an Airship channel ("No channel ID"), stock path included, so channel
  creation and notification delivery are not established on the emulator. They need a device with Google
  Play and a real push.

The switch offers a restart after either toggle. It blocks future Ketch calls immediately, but cannot
undo SDK initialization or replace consent already applied to the running process. Restart to apply the
startup consent path consistently; turning it off also needs a restart to restore that path. The
consent and restart SDK-state matrix was checked in a running process on 2026-10-18; notification
delivery and live queued-event drain remain untested.

Validated on 2026-10-14 on the Android 16 emulator, fresh data each time, location resolved by Ketch as
US-MO:

- Stock: Ketch loads on launch, sends the advertising ID in its `log` request and writes
  `consent_cache.json` with every purpose granted. AppsFlyer records `first_launch`, Firebase consent is
  `G111` and measurement is enabled.
- Patched (`Block cookie notice` only): launch, signed-out home feed, background/resume and Settings >
  Data Consent make no Ketch requests and no crashes. No `consent_cache.json`, no AppsFlyer
  `first_launch`, Firebase consent `G100` with measurement disabled.
- Morphe Desktop 1.18.1 applies it together with `Unlock Premium`. The bundle was built with the local
  fallback described above, because Gradle still can't reach GitHub Packages.

The visible banner itself wasn't reproduced, since no notice is shown at that location; the patch doesn't
depend on jurisdiction, because both entry points that can display one are disabled.

## Lurk settings

Every Rumble patch that changes code can be switched off and on in the app, without patching again:
Settings > App info > **Lurk**, long-press the launcher icon > **Lurk settings**, or Android's App info
page for Rumble > **Additional settings in the app**. The screen lists
only the patches that were included. Each switch starts at the patch's default (or its patch option)
and keeps the user's choice from then on, including across updates. Reset to defaults forgets those
choices.

Defaults follow one rule: a patch that changes what the app does is selected in Manager and its switch
starts off; the description ends "Starts off. Turn it on in Lurk settings > <Section>." The exceptions start
on: privacy (Block ads, Block cookie notice, Disable analytics, Clean share links, Don't save searches),
lockout protection (Block update prompts), nags (Hide Premium upsells) and restoring expected behavior
(Resume videos when signed out, Refresh stream), plus the chat features that match Twitch's defaults. Hide
Shorts, Hide tipping and Rants, Disable autoplay and Default video quality moved to this rule on 2026-10-22:
they used to be unselected with the switch (or the 1080p default quality) on, so a user who had selected one
finds its switch off after updating, unless it was changed on the screen before.

| Switch | Key | Takes effect |
|---|---|---|
| Block ads | `block_ads` | at the next ad request |
| Block cookie notice | `block_cookie_notice` | after a restart |
| Clean share links | `clean_share_links` | at the next share |
| Disable analytics, Keep watch progress | `disable_analytics`, `keep_watch_progress` | at the next upload |
| Hide Premium upsells | `hide_premium_upsells` | when the screen is drawn again |
| Hide Shorts | `hide_shorts` | after a restart |
| Hide tipping and Rants | `hide_tipping` | when the data is loaded again |
| Hide Join buttons, Hide Shop buttons | `hide_join_button`, `hide_shop_button` | when the buttons are drawn again |
| Hide comments, Hide related videos | `hide_comments`, `hide_related_videos` | when a video is opened again |
| Hide premium-only videos | `hide_premium_only` | when a list is loaded again |
| Block update prompts | `block_update_prompts` | after a restart |
| Default video quality (a choice; "Rumble's default" is 0) | `video_quality` | at the next video |
| Live streams too | `video_quality_live` | after a restart |
| On mobile data (a choice; "Same as on Wi-Fi" is 0) | `video_quality_mobile` | at the next video |
| Show exact counts | `exact_counts` | when the screen is drawn again |
| Hide pinned messages, Hide sponsor reads | `chat_hide_pinned`, `chat_hide_sponsor_reads` | when the chat is drawn again |
| Hide raid notices, Hide gift notices | `chat_hide_raid_notices`, `chat_hide_gift_notices` | at the next chat messages |
| Hide chat badges, Hide live chat | `chat_hide_badges`, `chat_hide_all` | when a stream is opened again |
| Show deleted messages | `show_deleted_messages` | when the chat is drawn again |
| Chat timestamps | `chat_timestamps` | when the chat is drawn again |
| Chat keywords, Highlight mentions, Vibrate on highlights | `chat_keywords`, `chat_highlight_mentions`, `chat_highlight_vibrate` | at the next chat messages |
| Highlight words, Blocked words, Blocked users (text) | `chat_highlight_words`, `chat_blocked_words`, `chat_blocked_users` | at the next chat messages |
| Don't save searches | `no_search_history` | at the next search |
| Resume videos when signed out | `resume_signed_out` | at the next video |
| Remember playback speed | `remember_speed` | at the next speed read or pick |
| Default playback speed (a choice in hundredths; "1x (Rumble's)" is 0) | `default_speed` | at the next video |
| Fill screen | `fill_screen` | when the player is laid out again |
| Player gestures | `player_gestures` | at the next touch |
| Keep playing during other sounds (a choice; "Pause" is 0) | `audio_focus` | at the next interruption |
| Keep screen on while paused | `keep_screen_on_paused` | at the next pause |
| Sleep timer (a choice in minutes; "Off" is 0) | `sleep_timer` | when playback next starts |
| Refresh stream | `refresh_stream` | when the error panel is drawn again |
| Seek interval (a choice in seconds; "15 seconds (Rumble's)" is 0) | `seek_seconds` | at the next tap |
| Default startup tab (a choice; "Rumble's choice" is -1) | `startup_tab` | after a restart |
| Hide Create tab | `hide_create_tab` | after a restart |
| Hide category rows, Hide creator rows, Hide playlist rows | `home_hide_categories`, `home_hide_creators`, `home_hide_playlists` | when Home loads again |
| Hide Home sections by title (text) | `home_hide_titles` | when Home loads again |
| AMOLED black, Near-black surfaces | `amoled_black`, `amoled_near_black` | after a restart |
| No autoplay of the next video, No feed previews | `autoplay_next_video_off`, `feed_previews_off` | after a restart |
| Background audio by default | `background_audio` | after a restart |
| Unlock Premium | `unlock_premium` | after signing in again |

Resource patches (Lurk icon, Remove tracking permissions, Disable tracking SDKs, Clone app, Change app
name) change the APK itself, so they aren't listed.

How it works:

- `rumble/settings/SettingsPatch.kt` is a hidden patch the others depend on. It merges
  `extensions/shared.mpe`, adds the extension's `SettingsActivity` to the manifest (with its own task
  affinity, so the launcher shortcut never opens inside Rumble's picture-in-picture task), and calls
  `Settings.init(context)` first thing in `RumbleApplication.onCreate()`. The activity isn't exported;
  an exported `activity-alias` of it answers only `android.intent.action.APPLICATION_PREFERENCES`, the
  action Android's App info page links to, and the activity reads nothing from the intent that starts it.
  `Settings.init` pushes the launcher shortcut back to the top of Rumble's shortcuts at every start on
  Android 11 and newer (shared with Twitch, whose whisper shortcuts would otherwise bury it).
- The Lurk row is a fourth `RowItemWithArrowView` after Send Feedback in the `AppInfoSection`
  composable, drawn by a static method the patch adds next to it with the same arguments as Rumble's
  rows. Its onClick is a `kotlin.jvm.functions.Function0` the extension makes with a `Proxy`, since
  the extension doesn't compile against Kotlin.
- That lookup requires exactly three calls to one row composable `(modifier, text, value, showArrow,
  composer, $changed, $default)` in `AppInfoSection` (Data Consent, Credits, Send Feedback). A version with
  a fourth row or a different row composable fails the settings patch, and with it every Rumble patch that
  has a switch. `tests/rumble/verify_compose.py <apk>` counts those rows (and checks the Compose trace
  labels below); run it on a new version's APK before anything else.
- Each patch registers its switches at the end of `execute`, so a patch that is left out or fails
  shows none. The settings patch writes them as JSON into `Settings.registryJson()` in `finalize`.
- Injected code calls `Settings.isEnabled(key)` (or `getInt(key)`) and runs Rumble's original code
  when it returns false. Values live in the `lurk_settings` SharedPreferences, written only when
  changed on the screen; unknown keys count as off.
- Restart Rumble (shown after changing a switch that needs it) relaunches the launcher activity and
  exits the process.

Validated on 2026-10-14 on the Android 16 emulator with a local build, every patch except Clone app
and Change app name applied (Gradle still can't reach GitHub Packages):

- The Lurk row appears after Send feedback and opens the screen in Rumble's task; Back returns to Settings.
- The launcher shortcut opens it full screen, also while a video plays in picture-in-picture.
- App info > Additional settings in the app opens it (checked on 3.21.0 when the alias was added, with
  the Lurk row still opening it after Send feedback).
- Hide Shorts off + Restart Rumble: the Shorts tab and Home row come back. On + restart: hidden again.
- The same walk-through (fresh launch, the featured video for 35 s, three scrolls) through the logging
  proxy: with Block ads and Disable analytics on, only Rumble's own hosts and `graph.facebook.com`.
  Both off: `e.rumble.com`, `a.ads.rmbl.ws`, `d4.ads.rmbl.ws`, `imasdk.googleapis.com` and
  `pagead2.googlesyndication.com` are back. Both on again: gone again. Each run started from a stopped
  app, so changes taking effect mid-session weren't checked separately.
- Keep watch progress is disabled while Disable analytics is off. The quality picker, Reset to
  defaults and dark mode (including switching while the screen is open) work.
- `bin/test-rumble` passes on the patched APK. A build with only Clean share links and Clone app
  shows just that switch and works under `com.rumble.battles.lurk`.

## Finding code in 3.21.0

R8 renames Rumble's classes and methods, so the patches below find code through what survives:

- Constructors check each parameter by name (`"eventRemoteDataSource"`, `"rumbleAdRepository"`, …).
- Kotlin data objects return their source name from `toString()` (`"Success"`, `"EmptyVideoAdList"`).
- Enum constants keep their names in `<clinit>` (`"SHORTS"`, `"Tip"`, `"OFF"`).
- Compose functions carry a trace label (`"com.rumble.battles.….ShortsListView (ShortsListView.kt:65)"`),
  matched without the line number.
- Gson DTOs in `com.rumble.network.dto` keep their class and field names; only the getters are renamed.

The helpers for these are app-agnostic and live in `patches/shared/compose/` (`Lookups.kt`, `Compose.kt`,
`ToString.kt`, `Dataflow.kt`, `Preferences.kt`, `Loops.kt`), each taking an `AppCode` built from the app's
`Compatibility` for its error messages; `rumble/shared/` keeps thin wrappers with Rumble's name (`RUMBLE`) and
the Rumble-only fingerprints. Each patch fails with a message rather than guess when a lookup doesn't find
exactly one match, naming the version the patches target (taken from `COMPATIBILITY_RUMBLE`).

Two of these could break many patches at once:

- **Compose trace labels.** Twelve hooks (the `composableFingerprint`s and the bottom bar's lambda) depend on
  the labels the Compose compiler writes when the app is built with source information. A build without
  them fails all twelve; the error of each names its label and the check. `tests/rumble/verify_compose.py
  <apk>` lists each label with its match count and the file using it, or says in one message that the
  build has no labels at all. `bin/test-rumble` runs it.
- **`checkNotNullParameter` names.** Constructor parameter names reach the dex only through Kotlin's null
  checks. A build with `-assumenosideeffects` for `Intrinsics.checkNotNullParameter` would drop them, and
  with them the lookups of Block ads, Disable analytics, Block cookie notice's Airship start, Disable
  autoplay, Default video quality, Resume signed out, Don't save searches, Remember playback speed and the
  chat mapper. Those fail with "expected exactly one …" naming the class.

## Disable analytics

Rumble's event repository (constructor strings `eventRemoteDataSource`, `appRequestName`,
`watchProgressDao`) sends every first-party event:

- to `e.rumble.com`: clicks on videos, categories, playlists, related videos, Shorts and the Premium button;
  viewable impressions; downloads; and watch progress. Watch progress carries the advertising ID, volume,
  playback rate, quality and fullscreen state.
- to Rumble's debug log (`debug/log2`): copies of AppsFlyer and Firebase events, plus search result clicks.

Bodies include the installation ID, and most events add the user ID, username and AppsFlyer ID. Only four
of the event use cases check consent, so Block cookie notice doesn't stop these. The patch returns at
the top of the three upload methods: `Success` for event lists (as after an upload, so queued watch time is
cleared rather than retried) and `Unit` for the other two.

The Keep watch progress switch (initially the `keepWatchProgress` option) lets the watch progress events
of an upload through, and only those: Rumble batches them with the other events, so the upload's list
goes through `RumblePrivacy.watchProgressOnly` with the event's class (found by its `toString`,
`"WatchProgressEvent(timeRange="`). A batch without any is answered with `Success`. The upload method hands
its arguments straight to a coroutine, so replacing its list parameter is safe. Those events carry the
user ID, advertising ID and AppsFlyer ID, which the switch's text says. Rumble's watch history is server side
(`watch_history.clear`), probably fed by these events; that is untested, as it needs an account.

## Block ads

The ad repository is the one implementation of the interface the video ad use case takes first
(constructor strings `rumbleAdRepository`, `getCustomAdTag`, `createPreRollVideoIdUseCase`). The patch
answers each request with a result Rumble already handles:

- **Video ads** (pre-rolls, mid-rolls and live mid-rolls, played through Google's IMA SDK):
  `EmptyVideoAdList`.
- **Feed and video page display ads** (`a.ads.rmbl.ws` / `a-delivery.rmbl.ws`, which receive the zone,
  keywords, user and video IDs, `ad_device_id` and the consent strings): `WaitingForAds`. Both injectors
  treat it like a failed request.
- **Impression pixels and click/progress beacons**: success, so `d4.ads.rmbl.ws` gets no Boosted or ad
  impressions and clicks.
- **Boosted videos** are paid placements: the server sets a video's `boosted` (the advertiser's thumbnail and
  title, the bid, and click and impression URLs), and the card shows that creative with a "Boosted" label.
  A hidden patch passes the server's video lists (the getters of `HomeSectionDto.videos`,
  `RelatedVideoData.videos`, `Video.related`, `VideoItems.items` for search and `CategoryVideoListData.items`;
  Gson DTOs, found by field name) through `RumbleInterface.videos(list, kind)`, which leaves out every element
  whose `boosted` field is set while `block_ads` is on. Hide premium-only videos and Hide related videos share
  that one hook. `Video.boosted` returns null as well, so a Boosted video reaching the app through another list
  shows as the plain video, without the creative, label or reports.
- **Home's `ad_block` sections** (a display ad between Home's rows) parse as `HIDE`, like Hide Shorts does
  for `shorts`, so they are neither loaded nor drawn.

The Revcontent DTOs in the app are unused.

Checked on 2026-10-22 on the emulator, signed out: with Block ads off, Home's Editor Picks row had a card
labeled "Boosted"; with it on, scrolling all of Home shows none and nothing crashes. No `ad_block` section
came up on Home in either run, so that hook is checked only in the code.

## Remove tracking permissions

Removes `AD_ID`, `ACCESS_ADSERVICES_AD_ID`, `ACCESS_ADSERVICES_ATTRIBUTION`, `AD_SERVICES_CONFIG`, the
install referrer permission, the Samsung and Huawei store referrer permissions and `READ_PHONE_STATE`.
It also removes the AppsFlyer referrer `<queries>` entries.

- Without `AD_ID`, Google Play services returns the all-zero ID on Android 13 (API 33) and newer, where the
  permission exists. That covers every SDK and Rumble's own `ad_device_id` (home layout, banners, watch
  progress); Rumble's reader doesn't filter zeros. On Android 12 and older Play services doesn't check the
  permission and returns the real ID, unless the user deleted or reset it in Android's settings.
- `READ_PHONE_STATE` is declared by the app but never requested, and no code needs it.
- Every other user catches the failure or checks the permission first.

## Disable tracking SDKs

A resource patch with no switch: it sets the SDKs' own manifest `<meta-data>` switches, adding each one that
Rumble doesn't already declare. Rumble ships the collection defaults off and turns each SDK on from its
consent trackers once consent is recorded (see Block cookie notice); this patch takes away what consent can
turn back on.

| Meta-data | Value | Effect |
|---|---|---|
| `firebase_analytics_collection_deactivated` | true | Firebase Analytics is off for good; `setAnalyticsCollectionEnabled(true)` is ignored. |
| `google_analytics_adid_collection_enabled` | false | No advertising ID in Analytics, should it run anyway. |
| `firebase_performance_collection_deactivated` | true | Firebase Performance is off for good ("permanently disabled"). |
| `firebase_crashlytics_collection_enabled` | false | Already Rumble's default. Crashlytics' run-time setting overrides it. |
| `com.facebook.sdk.AutoInitEnabled` | false | The SDK initializes but not fully, and refuses Graph requests. |
| `com.facebook.sdk.AutoLogAppEventsEnabled`, `AdvertiserIDCollectionEnabled`, `MonitorEnabled` | false | Defaults; Rumble's Facebook tracker can still turn the first two on. |

AppsFlyer has no manifest switch: Rumble starts it in code (`init` and `start`) whenever any consent decision
exists, so only Block cookie notice keeps it off. Crashlytics also follows consent. The Facebook login SDK
isn't in the app (no `FacebookActivity`), so nothing needs the fully initialized SDK.

Checked on 2026-10-22 on the Android 16 emulator, fresh install, signed out, through the logging proxy
(launch, Use Rumble signed out, three scrolls, Home):

- Default selection without this patch: Rumble's hosts, `remote-data.urbanairship.com`,
  `graph.facebook.com` (the Facebook SDK's settings and gatekeeper fetch), Firebase installations, Remote
  Config and logging.
- With it: the same without `graph.facebook.com`. Logcat shows "GraphRequest can't be used when Facebook SDK
  isn't fully initialized" for each fetch, and no crash.
- With Block cookie notice off, Ketch recorded essential services only (its banner jurisdiction): Firebase
  logs "App measurement deactivated via the manifest", Performance never writes `isEnabled`, Crashlytics
  is switched on (`firebase_crashlytics_collection_enabled` true) and AppsFlyer starts (`AFRequestCache`).

Firebase installations and Remote Config stay: push tokens need installations, and Remote Config carries the
update prompts Block update prompts handles. Firebase logging (`firebaselogging.googleapis.com`) is Google's
transport for Firebase SDK telemetry and stays as well.

## Hide Shorts

- **Bottom bar:** Other code refers to tabs by their position in the tab list (`ContentViewModel` saves
  index 0 or 3 as the default tab). So the Shorts entry stays in the list, and the bar's drawing loop
  skips it while still counting it. The Shorts route is found by `toString` (`"ShortsScreen"`).
- **Shorts rows:** `ShortsListView` returns immediately. That covers Home, My Feed, channels, search
  and My Videos.
- **Home sections:** `HomeSectionKind` maps `"shorts"` to `HIDE`, so the section isn't loaded either.
- **Channel tabs:** `Creator.tabs` loses `"shorts"`, unless it is the channel's only tab.
- **Category tabs:** the `SHORTS` entry is removed from the list the category tab builder makes.
- **Search filter chips:** `SHORTS` is removed from the copy of the filter enum's entries used for the chips.

`rumble.com/shorts/…` links still open the Shorts player.

## Hide Premium upsells

- The video page's Premium sheet: the check behind `premium_promo_display_delay_days` returns false.
- `PremiumBannerView` (Upgrade Now on Home and My Feed), `PremiumOfferBanner` (account screen) and
  `DownloadsUpsellView` return immediately.
- Live chat's Premium gift list (`LiveChatConfig.giftList`) is null.

The Premium tag on premium-only videos and the comment/chat paywalls stay, since they describe content.
Premium status itself isn't touched; that's Unlock Premium's job.

## Hide tipping and Rants

- `Tip` is dropped from the list of action buttons the channel and video headers may draw. A hidden patch
  passes that list (the composable whose strings include `possibleCreatorActionButtonTypesToDisplay`) through
  `RumbleInterface.actionButtons` with the enum's `Tip`, `Join` and `Shop` constants; it returns Rumble's own
  list while no switch hides one, and the same filtered list for the same list, so the buttons can still
  skip recomposition. Both callers pass the list (their `$default` masks, 0 and 0x2002, leave bit 14 clear),
  so the default-argument code after the hook doesn't overwrite it.
- `Creator.tipsInfo` and `VideoSource.wallet` (the Shorts tip button) are null.
- `LiveChatConfigRant.enable` returns false, which hides the Rant button.
- `LiveChatConfigRant.walletEnabled` returns false, which disables paying with Rumble Wallet.

Rants other viewers send still show.

## Hide premium-only videos

Rumble's mapper marks a video premium-only when the Gson DTO's `availability` is `premium` (ignoring case);
`has_access_to_premium` (`hasAccessToPremium`) says whether the account may watch it. While
`hide_premium_only` is on, the shared video list hook (see Block ads) leaves out the premium-only videos without
access, in Home sections, related videos, search and categories. Channel pages and My Feed load their videos
through other DTOs the hook doesn't reach, so they may still show them. `HideProbe` runs a Home section's real
getter with a free, a locked and an unlocked premium-only video. No premium-only video came up on the emulator,
so the hiding wasn't seen in the app.

## Hide comments and related videos

- **Comments:** the video page adds its Comments button (which opens `CommentsView` with its
  `CommentsHeaderView`) only when the video entity says comments are on, which comes from the Gson DTO field
  `Video.areCommentsDisabled`. While `hide_comments` is on its getter returns `TRUE`, so Rumble leaves the button
  out as for a video whose creator turned comments off. Emptying the two composables instead would leave a
  button that opens an empty panel.
- **Related videos:** the shared video list hook (see Block ads) passes `RelatedVideoData.videos` (the related
  endpoint) and `Video.related` as related lists; `RumbleInterface.videos` returns an empty list for those while
  `hide_related_videos` is on. The page then shows Rumble's own empty state ("There is nothing to see here"),
  and Autoplay next video has nothing to play.

Checked on 2026-10-22: a VOD's page shows Like, Share, Comments and Repost and a list of related videos with
both switches off; with both on, Share, Repost and Save follow Like and the related list is Rumble's empty
state. `HideProbe` runs both getters.

## Hide Join and Shop buttons

The channel and video headers draw Follow, Join (paid channel membership), Tip and Shop (a creator's store)
from one list of button types. The hidden action buttons patch Hide tipping uses also passes the `Join` and
`Shop` constants; `RumbleInterface.actionButtons` drops each while `hide_join_button` or `hide_shop_button`
is on. Checked on 2026-10-22: with Hide Join buttons on, The Dan Bongino Show's channel shows Tip and Follow
(Tip, Join and Follow with it off). No channel with a Shop button came up; `HideProbe` covers both lists.

## Disable autoplay

Both options change a DataStore default in `UserPreferenceManager` (constructor strings `autoplayOnKey`,
`playbackInFeedKey`, `videoQualityKey`). The patch follows each key to its field, the field's synthetic
accessor, and the inner class reading it. It then changes the value used when nothing is stored, so
Settings > Playback still works.

- **Next video:** `autoplayOnKey ?: true` becomes `?: !autoplay_next_video_off`.
- **Feed previews:** `playbackInFeedKey ?: ALWAYS_ON` becomes `?: OFF` while `feed_previews_off` is on. Home's featured video asks its
  player builder to play even when feed playback is off; the patch clears that flag, so the featured card
  follows the setting too.

## Background audio by default

Settings > Playback > Background Play offers picture-in-picture (1), sound only (2) and off (3), stored as the
DataStore Int `backgroundPlayKey`. With nothing stored, `UserPreferenceManager`'s reader picks
picture-in-picture where the device supports it, else sound only. The patch finds that reader the way Disable
autoplay finds its defaults (key, field, synthetic accessor, the inner class method that unboxes the Int) and
inserts after the `check-cast` of the stored value: while `background_audio` is on and nothing is stored, the
value becomes sound only's (read from the enum constant `SOUND` with the getter the reader itself compares
with), and Rumble's own mapping does the rest. A choice made in Rumble's settings is stored and wins. Only the
stored value's register is used, since it is null on the path that changes it.

Checked on 2026-10-22 on the emulator, signed out, with a VOD from Home's Editor Picks: switch off, Home moves
the video into a picture-in-picture window; switch on (and a restart), Home leaves no window and the media
session stays PLAYING, the position moving on in the background.

## Default video quality

The player chooses its start source with (sources, last picked height, last picked bitrate, the server's
preferred height, isLive, data saver, live uses Auto). That signature is unique, with the string
`sourceList`.

- With no picked quality, Rumble uses `preferred_video_resolution`, which is 480p on phones.
- The choice starts at "Rumble's default" (0; the `quality` option sets another start). Once a height is
  chosen, the patch fills it in with the highest bitrate, and Rumble's own nearest-height logic does the
  rest.
- A quality picked in the player is stored app-wide and keeps winning.
- Data saver still takes precedence.

Only starting a video runs the chooser: the player itself, when a Short is created or becomes current, and
the Shorts cache preloading the rendition it will play. A quality picked in the player plays that source
directly and is saved through Rumble's own quality-save use case.

**Live streams too** (`video_quality_live`, initially the `live` option, off). Before it looks at any
height, the chooser returns the Auto source (height and bitrate 0) for a live stream while Rumble's
"live uses Auto" preference is true. That is DataStore `liveVideoUseAutoKey`, read as `?: true`. Picking
Auto in the player stores true; picking a quality on a live stream stores false. While the switch is on
and a default quality is chosen, the patch changes the `?: true` default to false, the same way Disable
autoplay changes its defaults. Live streams then start at the default quality, until Auto is picked in the
player. With the switch off the default is Rumble's again.

**On mobile data** (`video_quality_mobile`, initially the `mobileQuality` option, "Same as on Wi-Fi").
On a metered network (mobile data, or a Wi-Fi hotspot marked as metered) a cap C lowers the quality a video
starts at; it never raises it:

- The start height is what Rumble or the default quality would start at (a saved pick, the default
  quality, or the server's preferred height), lowered to C. A saved Auto counts as C.
- Rumble picks the source nearest a height by the difference of reciprocals, which can land above C when no
  source has exactly that height (480 sits exactly between 360 and 720). So the extension reads each
  source's height (the `resolution` getter of the player source, found through its `toString`) and starts at
  the highest available height at or below the target, or the lowest one if every source is above it.
- While capped, the live-stream Auto return is skipped, so a live stream starts at the nearest rendition at
  or below C, even when Auto was picked. A stream that only has Auto stays on Auto.
- A quality picked in the player still plays, and Rumble saves it as usual. The next video on mobile data
  starts at C again; back on Wi-Fi the saved pick applies, because Lurk never writes `videoQualityKey`,
  `videoBitrateKey` or `liveVideoUseAutoKey`.
- With the choice at "Same as on Wi-Fi", or off a metered network, the chooser gets exactly the values it
  got before.

`QualityProbe` runs the real chooser with fake sources (default quality, a kept pick, live Auto, Rumble's
default), the live default with each setting, and the cap function. The metered check can't be faked under
`app_process`.

## Block update prompts

Rumble can lock old versions out from Firebase Remote Config. `ContentViewModel` (constructor strings
`shouldForceNewAppVersionUseCase`, `shouldSuggestNewAppVersionUseCase`) asks two use cases at startup,
passing the literal `"3.21.0"`:

- **Forced:** `ShouldForceNewAppVersionUseCase` compares `forced_app_version` with that version. If it is
  newer, `com.rumble.battles.landing.ForceUpdateView` replaces the app with an "update required" screen.
- **Suggested:** `ShouldSuggestNewAppVersionUseCase` compares `suggested_app_version`, at most once a day
  (DataStore `lastNewVersionDisplayTimeStampKey`), and shows
  `com.rumble.battles.landing.AppUpdateAvailableAlertDialog`.

Both are found by their Remote Config key and the name their catch block logs, plus the signature: `(String)Z`
and the suspend `(String, Continuation)Object`. While `block_update_prompts` is on (its default) they
return false before reading Remote Config. There is no Play in-app update library in the APK. The patch can't
help if Rumble's API starts refusing old clients; no such check was found in 3.21.0.

`UpdateProbe` calls both use cases with null dependencies: patched, they return false; with the switch off
(or on the stock APK) the original code runs and fails on the missing Firebase setup. The remote flags can't
be flipped from outside, so the blocked screens weren't seen on a device.

## Show exact counts

Every count in the app (video cards and the video page, Shorts like and comment buttons, channel
followers, "watching now") goes through one static formatter, `(long count, boolean keepDecimal)String`. It
returns the number below 1000, otherwise 12K, 1.2M or 3B; it is the only method with all three suffix
strings. No DTO carries a server-formatted count. While `exact_counts` is on, the formatter returns the
count grouped for the device locale (`NumberFormat.getIntegerInstance()`, 12,345).

The narrowest place is the Shorts side rail, which has no fixed width. A test build that showed 1,234,567
for every count kept the rail on screen (x 922-1071 of 1080) without covering the video, so the text size is
left alone. `CountProbe` checks the formatter both ways.

## Clone app and Change app name

Clone app sets the manifest package (default `com.rumble.battles.lurk`) and moves everything another
install would conflict with:

- permissions under `com.rumble.battles.` and `com.rumble.READ_RUMBLE_DATA`, with every reference to them
- provider authorities, including `com.rumble.provider`. That one is also a string in code, which the
  patch rewrites; Rumble uses it for the provider its other apps read.
- intent categories and task affinities carrying the package name

Class names stay. The app ID Rumble sends its API (`com.rumble.battles`, a constant) stays, so the server
sees an ordinary Rumble client. The patch runs in `finalize`, after other patches change the manifest.

Change app name sets `app_name`, the application's label; only `res/values` defines it. Quotes,
backslashes and a leading `@` or `?` are escaped.

## Clean share links

Every share sheet goes through one share use case: videos, live streams, Shorts, reposts, playlists and
channels. It takes `(text, title)`, and `android.intent.extra.TITLE` appears nowhere else in the app. The
patch passes the text through `RumblePrivacy.cleanShareLink`, which cuts everything from the first `?` off
the link when its host is `rumble.com` or a subdomain (any case); other links are left alone.

3.21.0 doesn't tag the links it shares:

- The use case gets the server's `url`, or `https://rumble.com/shorts/<id>`, unchanged. `e9s` and
  `src_v1_*` only reach analytics events.
- Shared links checked on 2026-10-14 had no query string, including a video opened from a Home
  recommendation row.

So the patch is a guard in case the server or a later version starts adding tags.

## Validation on 2026-10-14 (new patches)

All built with the local fallback (Gradle still gets 401 from GitHub Packages) against Morphe Desktop
1.18.1. All 14 Rumble patches apply together to 3.21.0.

Network was checked on the Android 16 emulator through a logging CONNECT proxy (the emulator's global
`http_proxy`). Each build ran the same walk-through: fresh install, signed out, Home, a live video for 40 s,
three scrolls, background.

- **Stock:** connects to `e.rumble.com`, `a.ads.rmbl.ws`, `d4.ads.rmbl.ws`, `imasdk.googleapis.com`,
  `pagead2.googlesyndication.com`, Ketch, AppsFlyer, Airship, Crashlytics and `app-measurement.com`.
- **Disable analytics + Block ads:** no `e.rumble.com`, `a.ads.rmbl.ws`, IMA or `pagead2` connections. The
  `d4.ads.rmbl.ws` pixel stopped after impressions were included.
- **All privacy patches:** only Rumble's own hosts (`rumble.com`, `hugh.cdn.rumble.cloud`, `wn0`, `web7`)
  and Firebase installations/Remote Config/logging, `graph.facebook.com` (the Facebook SDK's settings
  fetch) and Google Play services. No crashes, and no ART verifier errors in logcat.
- **`keepWatchProgress`:** one `e.rumble.com` connection, when a video starts; no crashes.
- **UI against stock:**
  - The bottom bar has no Shorts tab, and tabs still select correctly.
  - Home has no Shorts row, Premium banner or video Premium sheet.
  - Search shows All / Videos / Channels; stock adds Shorts.
  - On The Dan Bongino Show's channel, stock has a Tip button and Videos / Shorts / Reposts tabs; patched
    has no Tip and Videos / Reposts.
  - Settings shows Autoplay next video off and Playback in feeds Off; turning autoplay back on persists.
  - The featured card stays still (identical frames 2 s apart) but plays when opened.
  - A regular video starts at 1080p (with 360p / 720p / 1080p / Auto available).
- **Clean share links:** the share use case was called directly from the APK on the emulator
  (`app_process`, a Context that captures the share intent). Patched: rumble.com, `www.rumble.com` and
  Shorts links lose their query string and fragment; `notrumble.com` and `example.com` links are unchanged.
  Stock passes all of them through. Sharing a live stream in the app with all patches shows the clean link.
- **Clone:** `com.rumble.battles.lurk`, "Rumble Lurk" with the Lurk icon, installs and runs next to stock
  Rumble.

Not verified at runtime: category tabs, Rants and the Rumble Wallet (both need an account), the account
screen offer banner, and the downloads upsell.

## Don't save searches

Searches are kept only in the local Room table `queries(id, query, time)`. `SearchViewModel` (a kept name)
takes the use cases that save a search, update its time and read the recent searches. The patch finds each
one's type through the constructor's `checkNotNullParameter` names (`saveQueryUseCase`,
`updateQueryUseCase`, `getRecentQueriesUseCase`), following a copy back to the parameter, and patches
the one public suspend method of each. While `no_search_history` is on (its default), save and update
return `Unit` without writing, and the recent searches are an empty list. The list filtered as you type
filters that list, so it is empty too. Autocomplete suggestions come from Rumble's server and stay.

Stored rows aren't deleted, so turning the switch off shows them again; Clear all in Rumble's search
deletes them. Signed out, Rumble's own logout use case (which also deletes every search) runs at launch,
so the table is emptied at each start whether the patch is included or not.

`SearchProbe` calls the three use cases with no repository: they return before reaching it while on, and
fail on the missing repository while off.

## Resume videos when signed out

Rumble keeps a position per video in the local table `last_positions(video_id, last_position, user_id)`,
also signed out (`user_id` empty). The player saves it through `SaveLastPositionUseCase` when it stops, is
released or another video starts. `DefineCurrentWatchPositionUseCase` (constructor strings
`getLastPositionUseCase`, `sessionManager`) decides where a video starts:

1. It reads the local position.
2. If the server's `lastPositionSeconds` and the duration are both 0, it uses the local position.
3. Otherwise it asks the session whether you're signed in: signed in, the server's position (or the local
   one when the server has none); **signed out, 0**.
4. Near the end of the video it starts at 0.

jadx can't decompile the coroutine, so the patch works from the smali. After the `Boolean.booleanValue()`
of the signed-in check, the false branch is a `move-wide` of 0 over the register pair that holds the local
position on both paths into it. The patch replaces that move with `RumblePlayback.signedOutPosition`, which
returns the local position while `resume_signed_out` is on (its default) and 0 otherwise. Step 4 still
applies, and signed in nothing changes.

## Interface

### Default startup tab

Rumble remembers whether Home (0) or My Feed (3) was last selected, in SharedPreferences `rumble_prefs`
key `defaultTabIndexKey`, and `ContentViewModel` opens on it. The helper's getter is found as the
`()I` method calling `SharedPreferences.getInt` in the class whose constructor names those two strings.
While `startup_tab` is 0 or 3 it returns that instead; at -1 (its default) Rumble's stored tab is used. The
bottom bar's tab list is fixed (Home, Shorts, Create, My Feed, Account), and Hide Shorts and Hide Create
tab keep the positions, so the indexes stay valid.

### Hide Create tab

The bottom bar's tabs are routes: `Discover`, `ShortsScreen`, `CameraGalleryScreen`, `Feeds` and
`Profile`, Kotlin data objects found by their `toString`. Hide Create tab skips `CameraGalleryScreen`
the same way Hide Shorts skips `ShortsScreen` (the shared `hideBottomTab`): the entry stays in the list
and keeps its position.

### Hide Home sections

Home is a list of server sections, `HomeSectionDto(kind, title, ...)`, with kinds `videos`, `shorts`,
`categories`, `creators`, `playlists`, `ad_block` and `hide`. Most named rows (Editor Picks, Live, News, ...)
are `videos` sections with server titles; the app hardcodes no slugs. The patch passes the `kind` getter
through `RumbleInterface.homeSectionKind`, which returns `hide` for a categories, creators or playlists row
whose switch is on, or a section whose `title` (read by its field name) matches an entry of
`home_hide_titles`, ignoring case. A `hide` section is neither loaded nor drawn, as Hide Shorts relies on.

`InterfaceProbe` runs the real startup tab getter (with a stored My Feed) and the section `kind` getter with
each setting.

### AMOLED black

`RumbleTheme` (`com.rumble.theme.RumbleTheme`) wraps Material's theme, whose dark colors already use `#000000`
for background and surface, and provides Rumble's own color set (`RumbleColors`, one instance per theme) through a
CompositionLocal. In dark mode pages, sheets and dialogs are drawn black. Raised surfaces use one dark grey,
`#1B2127`: the floating bottom bar, search fields, chips and tags, loading placeholders and some cards (profile
rows, featured channels, the wallet views). Dividers, the Join button and dialog buttons use a lighter grey,
`#283139`, which marks the edges.

Rumble builds `#1B2127` with Compose's `Color(Long)` in exactly two places, each found by that literal going
straight into a static `(J)J` call:

- the color set's `(Z)V` constructor (its argument is "light"): the dark set's surface. The light set uses
  `#F6F7F9` from another field, so light mode keeps it.
- the palette's static initializer, Rumble's named colors as static constants: the same grey for surfaces that
  stay dark in both themes (the bottom bar over Shorts, Premium banners, the wallet and promo code views) and,
  translucent, for the scrims behind sheets and over the player.

The patch passes the ARGB value through `RumbleInterface.amoledSurface` before that call: black while
`amoled_black` is on, `#0B0B0C` (the near-black of Kick's AMOLED black) while Near-black surfaces
(`amoled_near_black`) is on too, else Rumble's grey. Both are built once per process, so the switches apply after
a restart. What stays: the `#283139` dividers and button backgrounds, Material's elevation tint on a few raised
buttons (`#121212`, such as Cancel under the video menu), thumbnails and the player's controls. In light mode only
the always-dark surfaces change. Each lookup needs exactly one match and the literal must reach the color call
unchanged, so a version that drops or moves the grey fails to patch instead of patching something else.

Checked on 2026-10-22 on the emulator in dark mode, after Restart Rumble: the bottom bar (Home and Shorts) and
the search field go from `#1B2127` to `#000000`, and to `#0B0B0C` with Near-black surfaces; the video menu's
dividers stay `#283139`. In light mode with both switches on, Home's bar stays `#F6F7F9` and the Shorts bar is
near-black. `ThemeProbe` runs the real color set constructor (off, on, near-black, Near-black surfaces alone,
patch not included) and the palette's initializer with the switch on.

## Player

### Remember playback speed

The speed menu lists the nine constants of Rumble's speed enum (`SPEED_0_25` to `SPEED_2`, with `NORMAL`).
A Kotlin object keeps the picked speed per scope (video page, other) in memory; its setter and getter are
found through their `videoScope`/`speed` null checks, and the player service resets every scope to 1x. The
player takes the stored speed unless the video is live without DVR. While `remember_speed` is on, a pick is
also kept by name in the SharedPreferences file `lurk_rumble` (Lurk's own state, not the settings), and the
getter returns it for every scope, also after a restart. While off, picks don't replace Lurk's saved speed
and the getter uses Rumble's own value. The saved value is retained: turning the switch on again restores
the last speed picked while it was enabled, until another enabled pick replaces it. With no saved value,
Rumble's own speed applies until that first enabled pick.

### Default playback speed

Shares the speed store hooks with Remember playback speed (a hidden patch): the setter reports picks to
`RumblePlayback.onSpeedPicked`, the store's reset (its one `()V` method, which the player service calls to set
every scope back to 1x) reports to `onSpeedReset`, and the getter asks `rememberedSpeed`. That returns, in
order: the speed Remember playback speed saved, while it is on; the `default_speed` choice, until a speed is
picked after the last reset; else nothing, so Rumble's own value applies. The choice's values are the speed
in hundredths (150 for 1.5x), mapped to the speed enum's constant names (`SPEED_1_5`). Live streams without
rewind ignore the getter and play at 1x.

Checked on 2026-10-22 on the emulator: with 1.5x chosen, a VOD from Home starts with its media session at speed
1.5; at "1x (Rumble's)" it plays at 1.0. `PlayerProbe` runs the real store (reset, default, a pick winning,
the next reset) and `test_state_transitions.py` the extension's order on the JVM.

### Fill screen

The phone players are Media3 `PlayerView`s that Rumble always gives the FIT resize mode (the custom
`SurfaceView` with its own FIT/ZOOM is only used on TV). Rumble sets the mode once and only again when it
changes, so the patch changes it where `AspectRatioFrameLayout` (inflated from XML, so the name is kept)
reads it in `onMeasure`. While `fill_screen` is on, in landscape and outside picture-in-picture,
`RumblePlayer.resizeMode` turns FIT into ZOOM: the video fills the screen and the edges are cropped. Each
rotation re-measures, so portrait goes back to FIT.

### Player gestures

The phone player is Media3's `PlayerView` under Rumble's Compose controls, which take the touches, so the patch
takes them where they enter the app: `RumbleMainActivity` (named in the manifest; it has no
`dispatchTouchEvent` of its own, which the patch checks) gets one that asks `RumbleGestures.dispatch` first and
otherwise calls the superclass's. While `player_gestures` is on, a touch starts a candidate only in landscape,
outside picture-in-picture and TalkBack, on the left or right 35% of the largest `AspectRatioFrameLayout` (the
video frame, at least half the window wide), away from its top 15% and bottom 20% (the close button and seek
bar). It becomes a swipe once it moves vertically past the touch slop and twice as far as sideways; the rest of
the app then gets `ACTION_CANCEL`, so Rumble's taps, double-taps and drags work as before. Up on the left raises
the window's brightness, on the right the media volume, with an indicator over the video. Back in portrait, the
next touch hands brightness back to the system.

Rumble already skips 15 s on a double-tap at either side of the video (Seek interval changes that distance
through the same default-argument twins), so the patch adds no double-tap.

Checked on 2026-10-22 on the emulator, landscape, a VOD playing: a swipe up on the right raised the media volume
from 5 to 12 (of 25); a swipe up on the left set the window's brightness override (display manager
`mWindowManagerBrightnessOverride=0.447`). A double-tap on the right of the playing video in portrait jumped it
from 16 s to 34 s in stock behavior.

### Keep playing during other sounds

`RumblePlayerService` (named in the manifest) is the player's `OnAudioFocusChangeListener`: it resumes on
any gain and pauses on any loss. Its `onAudioFocusChange` asks `RumblePlayback.ignoreFocusLoss` first.
The `audio_focus` choice: 0 (Rumble's), 1 ignores transient losses (`LOSS_TRANSIENT` and
`LOSS_TRANSIENT_CAN_DUCK`), 2 ignores every loss. A loss is never ignored while the phone is in a call or
ringing (`AudioManager.getMode()`). Unplugging headphones still pauses.

### Keep screen on while paused

A static helper adds or clears `FLAG_KEEP_SCREEN_ON` on the activity of a `Context` (found as the
`(Context, boolean)` method calling both `Window.addFlags` and `clearFlags`). The player's state effect
calls it with "on unless paused or finished, outside an ad"; it is found as the caller that checks the state
against the Paused class (whose `toString` starts with `Paused(isBuffering=`). The state classes are
package-private, so the effect reads the state itself (in a register that is dead after the call) and passes
it to `RumblePlayer.keepScreenOn`, which keeps the screen on for Paused while `keep_screen_on_paused` is on.
The end of a video and leaving the player still let the screen turn off.

### Sleep timer

The same choices and behavior as Twitch's, in the shared `SleepTimer`: playback pauses the chosen time
after it last started or resumed. The player service's `Player.Listener` (the inner class checking states 1
and 4 in `onPlaybackStateChanged`) reports `onIsPlayingChanged` to it, with itself as the player. To pause,
the extension pauses each listener that reported playback through `lurkPause`, a public static method the
patch adds to the listener class: it reads the listener's service (a package-private field, which the
extension couldn't read), the service's player through the service's public static accessor, and calls the
pause Rumble's media session uses. That pause is found from Media3: `Player.pause()` is the `()V` method of
`BasePlayer` (a class implementing the interface `ExoPlayer` extends) that only calls `setPlayWhenReady(false)`,
and the service's media session player (an inner class of the service) overrides it with a call to one
`()V` method of Rumble's player. This works in the background and in picture-in-picture, and it pauses Rumble
even when another app owns the active media session. Only if no listener could be paused does the extension
send `KEYCODE_MEDIA_PAUSE` through `AudioManager.dispatchMediaKeyEvent`, which the system routes to the active
media session. Twitch's sleep timer uses the same class with Twitch's own pause action.

Checked on 2026-10-22 with a test build that counts minutes as seconds, "Keep playing during other sounds"
at "Keep playing" and the timer at 30: Rumble played a VOD, then a cloned Rumble (Clone app) played another
one while Rumble kept playing. 30 s after Rumble last started, Rumble logged "sleep timer: paused 1 player"
and its media session went to PAUSED, while the clone's session kept PLAYING. The system's media button
session was still Rumble's at that moment, so the run shows the direct pause, not a media key going astray.

### Refresh stream

When playback fails, the player draws `MobileErrorView` (Back and Settings; Replay only after the end).
While `refresh_stream` is on (its default), the panel's modifier gets Compose's `clickable`, resolved from
the App Info rows as for the Lurk row, and a tap reloads the player at the same point:

- The player's quality switch (found by its `videoSource` null check and `RumblePlayer` log tag) plays a
  source again, re-prepares and seeks to the current position. The patch adds a public static method to the
  player class that calls it with the current source; the extension reaches it through a bridged stub,
  because the player's fields are private.
- The quality switch also reports the source to Rumble's quality-change callback, which saves it as your
  pick. The added method swaps that callback for one that does nothing during the call, so a reload saves
  no quality.
- The player's load method (the one asking the start-source chooser) records which player loaded which
  video, so a panel reloads its own player.
- The hook runs at the start of the composable, on every recomposition. `RumblePlayer.refreshable` makes
  one tap action per video and remembers the last panels' (modifier, video) pairs, so a panel drawn again
  gets the same clickable modifier and Compose can skip what didn't change. Its one caller passes the
  modifier (`Modifier.fillMaxSize()`, `$default` 0), so the default-argument code after the hook doesn't
  overwrite it.

Rumble retries network errors itself: with the network cut, live streams and VODs keep buffering for
minutes without the error panel and resume when the network returns. The panel, and so the reload, is for
errors the player gives up on.

### Seek interval

The player's rewind and forward buttons call its seek methods through their default-argument twins, which
fill in 15,000 ms; TV remote keys pass their own 10 s. The patch passes the twins' constant through
`RumblePlayer.seekMillis`, which returns the `seek_seconds` choice while one is set. The buttons' icons
(`ic_backward`, `ic_forward`) draw the arrow with strokes and "15s" as a filled path. A resource patch adds
copies with only the arrow (`lurk_seek_back`, `lurk_seek_forward`, with the helper Twitch's player
gestures use), and the icon reads (the R class fields with those IDs) return a copy while another interval is
chosen. At "15 seconds (Rumble's)" the buttons and icons are Rumble's own.

`PlayerProbe` runs the real speed store with the switch on and off, and the focus and keep-screen-on
decisions. `RefreshProbe` checks the clickable panel modifier and the silent callback.

## Live chat

Rumble's live chat arrives as JSON events on a chat endpoint (`web7.rumble.com` in testing). Gson parses
them into DTOs in `com.rumble.network.dto.livechat`, which keep their field names; a mapper turns each
`LiveChatMessage` into a `LiveChatMessageEntity` (a Kotlin data class, found through its `toString`), and
Compose rows draw the entities.

**The chat hook** is a hidden patch that Hide chat clutter depends on. The getters of
`LiveChatMessageData.messages` (each event's messages) and `LiveChatInitData.messages` (the history sent on
joining) pass their list through `RumbleChat.messages`. It drops the messages a switch hides before any
entity is built, so they don't count as unread either. It returns Rumble's own list while nothing is hidden,
and the same filtered list when the getter runs again on the same DTO. While no chat switch is on (raid
notices, gift notices, Chat keywords) it returns at once, without reading the DTO. Switches of patches that
weren't included count as off there, because unknown keys normally count as on. The signed-in user's name
for mentions is learned from the users list only while Chat keywords is on, so turning it on during a
stream highlights mentions after the next chat update that lists you (reopening the chat does).

### Hide chat clutter

| Switch | How |
|---|---|
| Hide pinned messages | `PinnedMessageSectionView` (the pinned message above the chat) returns at once. |
| Hide raid notices | The chat hook drops messages with a `raidNotification`. The raid countdown, the auto-join dialog and Rumble's own Auto-join Raids setting stay. |
| Hide gift notices | The chat hook drops messages with a `giftPurchaseNotification`. The notice for your own gift stays. |
| Hide sponsor reads | `HostReadsMessageView` (`host_ad_read` events: a creator's sponsor spot with a product link) returns at once. These aren't ad-network ads, so they stay out of Block ads. |
| Hide chat badges | `LiveChatUser.badges` is empty. The message row tints messages from users with the `recurring_subscription` badge, so that tint goes too. |
| Hide live chat | `Video.liveChatDisabled` (`is_chat_disabled`) is true, as for a stream whose creator turned chat off. The video page shows the description and related videos instead, and Rumble no longer connects to the chat endpoint. |

Event types aren't remapped: an unknown type becomes a `LiveChatError` event, and whether that triggers a
reconnect wasn't traced.

### Show deleted messages

`LiveChatViewModel` marks a message deleted when moderators delete it or mute its sender
(`deleted = deletedIds.contains(id) || mutedUserIds.contains(userId) || deleted`), and the entity keeps the
original text. Two rows draw `R.string.live_chat_deleted_message` ("Message was removed by moderator")
instead: the deleted message row and the Rant row. After each `stringResource` call the patch passes the
label and the entity to `RumbleChat.deletedLabel`, which appends ": " and the text while
`show_deleted_messages` is on. The text comes from the entity's `message` getter through a bridged stub.
The row lambda keeps the entity in a captured field; in the Rant row it is the register of the nearest call
on the entity, checked not to change before the label. The label is a plain `String`, so there is no
strike-through.

### Chat timestamps

`LiveChatContentView(modifier, ..., message, userName, ...)` draws a message row. The regular and the
deleted message rows call it from lambdas that capture the entity; the patch follows the `userName`
argument back to the entity's `userName` getter and passes the name and entity to
`RumbleChat.nameWithTime`. While `chat_timestamps` is on it puts the time first (`H:mm` or `h:mm` after the
device's 24-hour setting) with the name's color and weight. `timeReceived` is already local time: the mapper
parses the DTO's ISO `time` and converts it to `ZoneId.systemDefault()`. Rants, notifications, pinned
messages and Premium purchase messages get no time.

### Chat keywords

The same switches, texts and defaults as Twitch's Chat keywords, matched by the shared `ChatFilter`
(whole words, any case; blocked users without the `@`):

- **Hiding:** the chat hook builds a `userId` to `userName` map from the DTO's `users` and drops messages
  from blocked users or with blocked words, live messages and the join history alike. They never become
  rows, can't be @-mentioned and don't count as unread.
- **Highlighting:** at the start of `LiveChatMessageView(modifier, entity, ...)` (its one caller passes
  the modifier) `RumbleChat.highlight` returns Rumble's modifier, or for a highlighted message
  `Modifier.background(Rumble green at 30%)` around it. The background call is the one the Rant row uses,
  resolved at patch time by its signature; the extension reaches it through a bridged stub. Rows that
  aren't highlighted keep Rumble's modifier instance, so Compose can still skip them.
- **Mentions:** the live chat event mapper `(time, event, baseUrl, currentUserId, creatorName)` gets the
  signed-in user's chat ID (`_u` and the user ID in base 36). The history sent on joining lists the
  current user among its `users`, which gives the name to match (`@name`, or the name as a word). Signed
  out there is no ID and no mention.
- **Vibrate:** a highlighted live message (not the history) vibrates, once per message and at most every
  three seconds.

The patches that read entities share one hidden patch that fills the extension's getter stubs (text,
sender, time), so each is filled once. `KeywordsProbe` runs the hook, the learned username, mention and
word highlights and the real Compose background modifier with each setting.

`ChatProbe` runs the real DTO getters (live messages, history, badges, `liveChatDisabled`) and the bridged
entity getters with each switch on and off, including the hook with the keys unregistered.

## Validation on 2026-10-16

Built with the local fallback (Gradle still gets 401 from GitHub Packages) against Morphe Desktop 1.18.1,
with every Rumble patch except Clone app and Change app name, and run on the Android 16 emulator signed out.
Lurk switches were set by writing `lurk_settings.xml` as root. `tests/verify_extension_calls.py` confirms
that app code calls every new extension method.

- **Block update prompts:** `UpdateProbe` passes. The app starts and plays normally with the switch on.
- **Show exact counts:** Home shows "3,339" watching instead of "3.3K". Shorts side rail checked with a
  forced 1,234,567 (see above).
- **Default video quality:**
  - Live streams too on: a live stream (360p, 720p and two 1080p renditions) starts at 1080p. Off: Auto.
  - On mobile data (Wi-Fi off; the emulator's cellular network is metered), cap 480p: the same live stream
    starts at 360p, its highest rendition at or below the cap. A VOD starts at 480p instead of 1080p.
  - Picking 1080p in the player plays it. The next VOD on mobile data starts at 480p again, and with Wi-Fi
    back on the next one starts at the saved 1080p.
  - A Short on mobile data starts at 480p.
- **Chat timestamps:** live chat rows show "2:30  StantheJokemanShow", matching the emulator clock (12-hour).
- **Hide chat clutter:** Hide chat badges removes every badge (10 on screen before, 0 after) and the
  subscriber tint. Hide live chat shows the video page without chat, and the proxy log has no
  `web7.rumble.com` (chat) connection; with the switch off it is opened 3 s after the stream starts.
  Pinned messages, raids, gift notices and sponsor reads didn't occur during testing; `ChatProbe` covers
  the raid and gift filter.
- **Show deleted messages:** no message was deleted while watching; `ChatProbe` covers the label.
- **Chat keywords:** on a busy live chat, highlight word "the" tints every message with the whole word "the"
  (on a subscriber's row it blends with Rumble's tint); blocked word "the" leaves none of the 14 visible
  lines with it. Mentions need an account and weren't tried; `KeywordsProbe` covers them.
- **Don't save searches:** with the switch on, a search for "news" leaves `queries` empty and the search
  box shows no recent searches. Off, "podcast" is stored and listed under Recent. Hiding kept rows is
  covered by `SearchProbe`: signed out, Rumble had already deleted the row at the next launch.
- **Resume videos when signed out:** search, watch the first result for 40 s, start the second (which saves
  the first at 41 s), go back and open the first again: it continues from 0:41 with the switch on and starts
  at 0:00 with it off. Positions survive a restart.
- **Remember playback speed:** 1.5x picked on one video; after a force-stop the next video plays at 1.5x
  (media session speed 1.5). Switch off: 1.0.
- **Fill screen:** a 16:9 video in landscape fullscreen on the 20:9 emulator fills the width with the switch
  on and is letterboxed with it off; portrait is unchanged.
- **Keep playing during other sounds:** another process took audio focus while a VOD played. Rumble's
  default pauses on a transient request; choice 1 keeps playing through it but pauses for a permanent one;
  choice 2 keeps playing through both.
- **Keep screen on while paused:** with a 15 s screen timeout (and stay-awake-while-charging off), a video
  paused for 30 s keeps the screen awake with the switch on; off, the screen goes to sleep.
- **Sleep timer:** checked with a test build that counts minutes as seconds: with "15", Rumble's media
  session goes to PAUSED 15 s after playback starts (it then paused with a media key; see Sleep timer for
  the direct pause it uses now); Twitch logs "paused 1 native players" 15 s after a stream starts.
- **Default startup tab:** "My Feed" opens Rumble on My Feed after a cold start, "Home" on Home.
- **Hide Create tab:** the bottom bar shows Home, My Feed and Account (with Hide Shorts); each still opens its
  own screen.
- **Hide Home sections:** with category and creator rows hidden and the titles "Editor Picks, sports", Home loses Editor
  Picks, Sports and Top Channels and keeps the other twelve sections. No categories or playlists row was on
  Home during testing.
- **Refresh stream:** cutting the network (Wi-Fi and data off) for four minutes during a live stream, and two
  and a half during a VOD, left both buffering, with no error panel; both resumed when the network returned.
  The reload was checked with a test build that triggers it 15 s after a video loads: playback carries on
  from its position, and Rumble's DataStore gets no quality keys.
- **Seek interval:** at 30 seconds the forward button moves a VOD about 30 s ahead and the buttons show
  arrows without "15s"; at Rumble's setting it moves about 15 s. Twitch's generated seek icons are
  byte-identical with the shared helper.
- **All together:** with every Rumble patch except Change app name, 30 patches apply; each new patch also
  applies on its own (`--exclusive`). All probes pass on the full build, and `verify_extension_calls.py`
  finds every new hook called from app code. With Manager's default selection, `verify_settings.py` passes
  and the Lurk screen shows each new setting in its section at its default; a setting that needs a restart
  shows Restart Rumble. The default build's walk-through (Home, a video, scrolling) connects only to Rumble's
  hosts, `graph.facebook.com` and Firebase logging, without crashes or verifier errors. The Clone app build
  installs and runs next to Rumble.
- **Twitch, after the shared ChatFilter and SleepTimer:** `bin/test-twitch`, `test-twitch-chat`,
  `test-twitch-chat-style` and `test-twitch-playback` pass, and Twitch's app code patches byte-identically
  to before.

Retained refresh integration regression: `bin/test-rumble <patched.apk> RefreshProbe` executes the
actual emitted video-load hook, error-panel prefix, click/reload bridge and stock `x4` on ART.
Player/state/Compose boundaries verify source URL, full-width seek position, per-video mapping,
repeated taps, disabled/null cases and preserved quality callbacks. The generated reload now restores
its callback in a catch-all handler too: stock `x4` catches ordinary Exceptions, but an escaping Error
or failure inside its logger previously left the no-op callback installed. These exceptions are
synthetic regression inputs; no live occurrence is claimed. `tests/rumble/verify_refresh.py` checks
emitted catch metadata and the fatal-state branch to the mobile panel. A real emulator network
failure, the fatal-panel tap and continuing playback were observed on 2026-10-18 under a
three-method error-policy fixture. Unchanged production recovered automatically from the observed outage; natural fatal
entry, physical-phone and authenticated/Premium behavior are not established by that fixture.
