# App details

Technical notes for every patch: how each target is found, what is changed, and what has been verified.
The Twitch user guide is in Japanese in [twitch.md](twitch.md); its matching rules are in [twitch-maintenance.md](twitch-maintenance.md).

Supported versions are kept short. Each app supports its newest version and the one before
it. YouTube and Reddit instead support the official Morphe patches' stable and newest targets
plus the newest store version, so both bundles apply to the same APK. Twitch also keeps 30.7.2,
the last version for Android 12 and older. A version leaves the list once newer ones are
verified. The verification notes below also record versions that are no longer supported.

## SmartNews

`SmartNews cleanup` disables stable ad remote-config and server-insertion flags,
neutralises known ad view surfaces, hides every tokenised ad layout (including
the newer feed/header/premium containers), collapses SmartNews-marked and publisher
sponsored nodes inside reader WebViews, and repairs the settings switch drawable after
resource rebuilding. Typed empty/default values are used where returning null would
leave the feed waiting indefinitely.

The primary anchors are stable configuration strings and un-obfuscated Android
descriptors. Obfuscated class and method names are not used as the main match.
The patch logs a `SmartNews cleanup summary`; a new app version must not be added
to compatibility until the critical match total is non-zero and launch, settings,
feed, weather, and crash-log checks pass.

Weather config resolves the getter's return type against the stable
`AdsInWeatherConfig$Companion` and its public, typed `default()` factory.
The 26.9.11 repair preserves the disabled default from 26.8.50. Emulator smoke
tests require populated article lists before and after scrolling. 26.10.10,
26.10.20 and 26.10.30 applied without changes: the public feed showed no sponsored or ad markers before or after
scrolling on the API 36 emulator, with no fatal errors in the process log.

SmartNews ships two signed builds of the same version. The universal APK (version
codes `100xxxx`, Uptodown) is signed with `40f82012…bf5c700`; the Google Play split
build (version codes `1xxx`, APKMirror APKM with a Google Play source stamp) is signed
with `867abbf0…6d744883`. Their dex files differ. For 26.10.10, 26.10.20 and 26.10.30 both builds were patched
without `--force` and checked on the API 36 emulator (the Play build is ARM64-only, so on
an x86_64 image with ARM translation): the unpatched Play builds showed `Ad ·` feed
items (for 26.10.30 the unpatched universal APK, `Ad · DirectMax`), the patched builds showed none, and the process logs had no fatal errors. Other
versions keep the single version code that was verified until the other build is checked.

### Auto claim mission rewards

The My missions page (`https://tour.smartnews.com/campaign/`, the Points tab) is a web
app in SmartNews' SNClient bridge WebView. The patch hooks the bridge class, found by its
`@JavascriptInterface postMessageWithId(String, String, String)` method and its WebView
attach method that calls `addJavascriptInterface`, and injects a script into that page
only.

Background (option `claim_in_background`, default on): five seconds after the main
screen resumes (at most every 5 minutes, and every 10 minutes while it stays open), the
same `MissionsLandingPageFragment` the Points tab uses is added to a 1 x 1 transparent
container in the main activity, so the app's own bridge and sign-in apply. The AndroidX
fragment calls are obfuscated, so the patch copies the transaction factory, add and commit
calls from the Points tab's own transaction around `MissionsLandingPageFragment.newInstance`
and finds the remove call by AndroidX's "Cannot remove Fragment attached to a different
FragmentManager" message. The container id is chosen so that `findViewById` cannot match
any existing view. The page is removed when the script reports that it is done, after 90
seconds, or when the activity stops. A toast shows the points claimed and any lottery result.

Primary path: when the page renders its reward popup (`data-pixel-id`
`sn-point-mission-complete-popup`), the popup is hidden and its claim buttons
(`mission-complete-popup-redeem-btn`) are clicked, so the page runs exactly what a manual
tap runs and updates its balance and cards in place. Lottery buttons are clicked only for
`LOTTERY` rewards (learned from the page's own campaign responses); the lottery dialog's
fixed 3600 ms animation timer is shortened to zero, a losing result is drawn again when
the page offers that (at most twice) and otherwise closed, and a winning result stays
visible. With the `draw_lotteries` option off, or when the popup lists anything else, the
popup stays visible.

Fallback, a few seconds later and again when the page syncs progress or the tab becomes
visible: `getAppInfo`, `stampRally:syncMissionsProgress`, the mission list through
`stampRally:getCampaigns` (or `GET /api/missions/v1/campaigns` with the page's `rt`), then
`POST /api/missions/v1/missions/redeem` for completed `POINTS`/`D_POINT` rewards the popup
did not handle, and the lottery API (`result`, then `draw`) for `LOTTERY` rewards. Only
this path reloads the page (at most every 30 seconds).

Missions that need an action first (open a URL, watch an ad, link a d ACCOUNT, tap a push
notification) are not completed by the patch; once the action is done their reward is
claimed like any other. A toast summarises the result; failures are reported once per app
session. `setprop log.tag.SabopuraMissions DEBUG` logs every bridge message and mission.

26.9.20 and 26.10.10 were verified on API 36 emulators. For 1.15.5 the patch was also applied
to 26.10.20 and to the Google Play APKMs of 26.10.10 and 26.10.20: on all of them the background
page started, the bridge attached and the mission list loaded; after reading three articles and
restarting the app, 26.10.20 (universal and Play) claimed the reading reward (1 point) in the
background, with no fatal errors. On 26.10.30 (universal and Play) the background page started
and its script ran on the emulator; the server refused the test device (`CLIENT_CONDITION_DISABLED`),
so no reward was claimed there. In the background mode the
Japanese edition, staying on Home, drew an article lottery (won) and claimed a 2-point
reading reward within about 1.5 seconds of the page starting, with nothing shown on screen
except the toast; leaving the app mid-run removed the page without errors. In the Japanese edition, signed
out, the daily channel reward and an article-reading reward were credited and the
article lottery was drawn twice through the page's own dialog within about 1.5 seconds of
opening the Points tab, without the reward popup or the lottery animation being shown.
Daily point rewards were also confirmed on a signed-in phone.

### Open in external browser

Off by default. Pages that SmartNews would show in its own web view open in another browser
instead: as a Custom Tab of that browser (option `custom_tabs`, default on) or in the browser
app itself, with `Browser.EXTRA_APPLICATION_ID` so that browsers reuse one tab. A browser
without a Custom Tabs service always gets the browser-app intent, so it does not open inside
SmartNews' task. Option `browser` is `default` or one or more package names separated by commas.
The browser is the first installed one of that list, else the default browser app set in Android
(which may also be a link-router app), else the first installed browser; the intent always names
that package, so neither the system chooser nor an app that claims the link through app links
opens instead. A list helps with browsers published under more than one package name. Only when
no browser is installed does the page stay in SmartNews.

Two places are hooked:

- Article taps. Feeds, lists, search results and StandaloneArticleActivity (notifications, linked
  articles) all open articles through one method of the obfuscated article presenter, found by
  its `LegacyLinkMasterDetailFlowPresenter$Companion` field, the `(Context, request, boolean)`
  shape and its "open article_view" trace. The hook reads the article's JSON model fields
  (`LiteArticle.url`, `internalUrl`, `articleViewStyle`, `premium`) and returns early once the
  article goes to a browser. `WEB` and `HYBRID` articles and articles without a style leave;
  `SMART` and `SMART_VIDEO` articles stay in SmartView unless option `smart_view_articles` is on;
  video, coupon, app, audio, premium and unknown styles always stay. HYBRID opens on its web tab
  in ArticleContainer, the article screen these versions use; SmartNews' newer Compose reader
  (behind a server flag, not seen in testing) would show it in SmartView instead. Like SmartNews,
  `internalUrl` comes before `url`, so the browser loads the page SmartNews would have loaded
  (observed differences are tracking parameters such as `from=smtnews`). When the presenter
  runs in StandaloneArticleActivity, that activity's own close method (found by its `isTaskRoot`
  and `finish` calls) runs before the browser starts: it would otherwise stay empty, and when it
  is the task root it starts MainActivity, which must end up below the browser.
- WebBrowserActivity, which shows links, related articles, "Read this on the Web" and ad pages.
  Its one `(String)V` method that calls `WebView.loadUrl` is hooked, so exactly the pages
  SmartNews would load as web pages leave, including related articles for which SmartNews found
  no SmartView version; the activity then finishes. With `smart_view_articles` on, pages started
  with `allowSmartView` leave right after `super.onCreate`, before the SmartView lookup: the hook
  clears the intent's URL and the activity finishes through its own "no URL" path.

Pages on `smartnews.com` and its subdomains stay in the app because they rely on its bridges
(missions, coupons, explainers). The My missions page uses SnClientBrowserActivity and is not
affected. Articles read in a browser are presumably not counted by SmartNews' reading missions
(not checked); with the default options SmartView articles stay in the app.

26.10.30 (universal APK, default options) on an Android 16 (API 36) emulator, US edition:
"Read this on the Web" and a related link without a SmartView version opened in a Chrome Custom
Tab, and back returned to the SmartView article. That image's emulator process then repeatedly
crashed (access violation) while SmartNews showed SmartView articles, including articles the
patch keeps in the app, so the remaining checks ran on an Android 17 (API 37) emulator:

- 26.10.30 universal APK, default options, Japanese and US editions: feed articles (all SmartView)
  stayed in the app and back returned to the feed; WebBrowserActivity started directly with an
  outside URL, with and without `allowSmartView`, opened a Chrome Custom Tab, and a smartnews.com
  URL stayed in the app.
- `smart_view_articles` on: feed articles opened in a Chrome Custom Tab, the smartnews.com
  explainer stayed, and a source article opened from the explainer (StandaloneArticleActivity)
  went to Chrome with back returning to the explainer. StandaloneArticleActivity started as the
  task root went to Chrome with MainActivity below it (26.10.30 and 26.10.10). With `custom_tabs`
  off, Chrome's browser activity opened instead and back returned to SmartNews.
- Firefox 157 as the default browser: pages opened and rendered in Firefox's Custom Tab. A
  link-router app as the default browser: pages reached its app chooser.
- An ARM64-only Chromium-based browser as the chosen browser (a two-package list, also typed with
  a space after the comma) and as the default browser: its Custom Tab opened. Its renderer crashes
  under the emulator's ARM translation even when it opens a page by itself, so the page content
  was not shown there.
- 26.9.20, 26.10.10 and 26.10.20 universal APKs and the Google Play APKMs of 26.10.10, 26.10.20
  and 26.10.30 with `smart_view_articles` on: feed articles opened in a Chrome Custom Tab and back
  returned to SmartNews (26.9.20, 26.10.10 and the 26.10.20 APKM also after the last code
  change). WebBrowserActivity started directly sent outside pages to Chrome, also through the
  `allowSmartView` path, and kept a smartnews.com page on 26.9.20, 26.10.10, 26.10.20 (APKM) and
  26.10.30.

The crash logs of the completed runs had no SmartNews entries. The author also confirmed the
patch working on a phone.

## Reddit

`Auto-translate Reddit content` invokes Reddit's existing translation callbacks
for visible posts and comments. The default target language is Japanese (`ja`);
the `target_language` option accepts a BCP-47 language tag.

The patch includes a small runtime extension that rate-limits callbacks and
suppresses repeated translation requests for the same post or comment.
Feed posts, comments and the post on the post-detail screen are covered. Once
an item has been shown translated, it is not translated again automatically,
so "show original" keeps the original text for the rest of the app session.
Only the translate action of the comment accessibility callback is invoked;
its "show original" action is left to the user.

Reddit `2026.28.0[2628060]` and `2026.30.0[2630060]` were verified to patch and
rebuild successfully. The latter was also signed, installed, and cold-launched
on an Android API 36 emulator without an AndroidRuntime fatal crash. End-to-end
translated content after account login was not verified, so this remains the
main device-test item.

Reddit `2026.37.0[2637051]` through `2026.42.0[2642001]`
passed the forced compatibility probe and a
logged-out cold launch on the dedicated API 36 emulator. The public `/r/all`
route led to onboarding and an authentication sheet; no guest route or public
posts were visible. Reviewed screenshots and process logs showed no fatal
crash or callback/request loop symptoms. Patched DEX inspection confirmed
real post and comment translation callbacks. Translated content rendering
remains unverified behind this authentication gate. `2026.24.0[2624051]`, the official Morphe
patches' stable target, passed the same checks; its patched DEX has the same ten translation
call sites as 2026.42.0 (four post, two comment, one accessibility comment, two post detail and
the extension's own queue). `2026.43.0[2643041]` applied without changes and passed the same checks,
with the same ten call sites.

Reddit fingerprints use stable translation state/event descriptors. Obfuscated
callback classes, model classes, field names, and synthetic-lambda selector
numbers are derived from each target APK at patch time. Missing UI variants are
allowed, but the patch intentionally fails instead of producing a no-op when no
critical translation callback can be resolved. The target-language header is
best-effort so a header-only refactor does not disable otherwise valid callbacks.

## YouTube

YouTube has two independent patches in the same bundle. Enable either or both; they share
one set of player hooks so using both does not duplicate any work.

### Ambient light

`Ambient light` brings the Ambient light for YouTube browser extension to the Android app.
It samples the current video frame (PixelCopy for SurfaceView, `getBitmap` for TextureView)
at a low resolution, averages it down for stable colours, and builds a blurred glow that is
stretched outward from the picture (spread), darkened towards the screen edge, and smoothed
between frames to avoid flicker. The glow layer is inserted inside the player directly
above the video and below every player control, so it only paints the pillarbox/letterbox
bars and never covers buttons, captions, or the picture. Optional black-bar detection picks
colours from the picture inside letterboxed movies and can also light those burned-in bars.

In the regular (non-fullscreen) player the watch page becomes see-through and the video's
light fills the whole screen, like the desktop extension: the page background itself is made
transparent where it is painted (YouTube's own ambient mode is hidden) and the light is drawn
underneath, so YouTube's own text, icons and thumbnails sit directly on the light in either
theme. The light calms down while the user touches or scrolls the page (touches on the player
itself are ignored) and fades back after an idle delay. There is no light in the miniplayer.
The light runs straight out of the picture: right next to the player the picture's shapes
carry on and stay crisp, farther away they soften. Each column takes its colour from a band of
the picture that grows to the whole height, and flat-coloured edge lines are skipped. Inside the
player, black bars are covered with the same light and the picture's edges fade into it (bars
in which text such as subtitles was seen recently stay untouched), so player and page read as
one picture. The light keeps the video's colours in either theme. "Blur the light strongly"
switches to a blurred glow that only carries the colours and tones very bright light down for
readable text, and "Hide the progress bar under the video" skips YouTube's thin time bar while
the controls are hidden.

Open `Settings > Video and audio > Ambient light` to configure it: how the light looks
(show the video itself behind the page, darker towards the bottom, spread the light on scene
changes, pulse slowly while paused), fullscreen / regular-player display, blur, spread, edge
fade, brightness, saturation, frame rate, colour detail, smoothing, black-bar handling, and
energy saving. The light is drawn on its own small, low-resolution surfaces, so a new light
frame does not redraw YouTube's page or player. It samples still pictures less often, stops
updating while playback is paused or buffering, does nothing in picture-in-picture and
background playback, and hides itself for protected (DRM) videos whose frames cannot be read.

### Player menu

Both patches add a row with an on/off switch to the player settings menu, like YouTube's own
`Loop video` row. Tap the row to switch the feature on or off. Long-press it to open a small
sheet over the video with the switch, the most used values as sliders (danmaku: text size,
opacity, scroll duration, vertical coverage; ambient light: brightness, saturation,
smoothing, and how the light looks) and a link to the full settings screen.

### Danmaku comments

`Danmaku comments` displays regular comments, live chat, and premiere chat over
the player in a right-to-left NicoNico/bilibili-style overlay. It does not use
YouTube Data API or an API key, and never opens the visible comments or chat
panel. It reads YouTube's keyless internal comment and chat responses in the
background using the app's current in-memory request context.

Open `Settings > Video and audio > Danmaku` (or long-press the `Danmaku` row in the player
menu) to configure the overlay. A frame rate limit (`60 fps`) saves battery on 120 Hz
displays. The screen is
embedded in YouTube's native preference hierarchy and uses its standard switches,
selection dialog, and sliders. Regular videos and live/premiere streams have
independent switches. Regular comments can be limited to timestamped comments;
every timestamp in a multi-timestamp comment becomes a separately timed segment,
while each untimestamped comment receives one stable slot and is not intentionally
repeated. Live messages and chat replay messages use the current playback position
and replay-provided video offsets. For live streams, premieres, and their archives,
the comment source can be switched between live chat preferred (the default), regular
comments only, or live chat plus timestamped regular comments.
Long-comment filtering defaults to 100 characters and can be changed or disabled
in the app. Like counts, handles, timestamps, and other comment metadata are not
rendered as danmaku. YouTube custom emoji and channel stamps are drawn inline from
their attachment images using a bounded memory-only cache. The collision scheduler
measures comment widths and delays or omits entries that cannot use a lane safely (or,
optionally, overlaps them NicoNico-style when the screen is crowded).

Further options: NG words (one per line or comma separated; matching ignores case, full/half
width and hiragana/katakana; `/regex/` rules are supported), merging repeated spam such as
`www` into one `×N` comment, Super Chat and membership colours, bold text, outline / shadow
edges, constant-duration (NicoNico) or constant-speed (bilibili) scrolling, regular-player
text scale or fullscreen-only display, and reset to defaults. Comments keep moving in the
miniplayer and picture-in-picture, with the text scaled to the player. Appearance and filter changes are applied instantly from the comments that
were already received; only a change of comment source triggers a new background fetch.

Rendering records each comment once into a hardware display list (RenderNode) and only moves
it per frame, draws only the comments currently on screen, and stops its frame loop while the
video is paused or buffering and between sparse comments.

Verification: for every added YouTube version a public replay is opened on the API 36
emulator and the danmaku overlay must attach, fetch comments and draw them. 21.40.165,
21.40.166, 21.41.526, 21.41.529, 21.42.243, 21.43.523, and the official Morphe targets 21.20.405 and
21.42.241 passed this check, the last three also with the watch page tinted by ambient light. The emulator build needs a test-only startup shim that is applied
after patching and never enters the MPP. On the emulator, YouTube's stream protection rejects the
re-signed build after roughly 20 to 60 seconds of playback (`ump.spsrejectfailure` in the QoE ping,
then "There was a problem with playback"); an unpatched re-signed 21.41.526 stopped the same way, so
this is not a patch failure.

## Pinterest

The three Pinterest patches replace Binarymend Patches 1.3.1 (GPLv3). Binarymend
addresses Pinterest 14.11.0's obfuscated names (`qu/c`, `api/model/yd`, `d9/c`,
`g10/n4`); in 14.38.0 those classes were renamed or removed and all three
patches fail to apply. The rewrites use stable anchors instead:

- `Remove Promoted Pins`: the Pin model is the `com/pinterest/api/model` class
  whose Boolean fields carry the JSON names `is_promoted` and `is_active_ad`;
  their getters return `false`. 14.38 no longer reads `is_active_ad`, so only
  `is_promoted` is required. As in Binarymend, pins are not filtered out of the
  feed; Pinterest stops treating them as promoted.
- `Disable Bugsnag Telemetry`: Bugsnag's ImmutableConfig (the class that builds
  the `Bugsnag-Payload-Version`/`Bugsnag-Api-Key` headers) reports
  `shouldDiscardByReleaseStage() = true`, so the SDK discards every error and
  session itself.
- `Disable General Telemetry`: the startup task run method skips the same 14
  analytics, attribution, ads-measurement and tracking task tags
  (`TAG_APPSFLYER_INIT`, `TAG_TRACKING_REQUESTS`, ...), found through the tag enum.

14.11.0, 14.38.0, 14.39.0 and 14.40.0 were patched, installed and launched to the
sign-in screen on the API 36 emulator without crashes; for 14.11.0, 14.38.0 and 14.40.0
the patched methods were also checked by decompiling the output (in 14.40.0 the
`is_promoted` getter returns `false`). 14.41.0 applied without changes; it launched to the
sign-in screen without crashes, and the output DEX has the `is_promoted` getter returning
`false`, Bugsnag's release stage check returning `true` and the 14 startup task tags
skipped. 14.42.0 applied without changes and passed the same launch and DEX checks. Feed
behaviour after login was not verified.

## pixiv

- `Hide pixiv ads`: every ad slot (viewer overlays, illust/manga/novel list
  ads, the illust detail ad item including self-serve ads, and the AppLovin
  interstitial) is gated by one method that returns `!isPremium`. It is found
  from two independent call sites (the novel list method that references
  `NovelAdItemViewHolder`, and the interstitial loader after the
  `AppLovin SDK is not initialized yet` log string) and made to return `false`.
  The patch fails if the call sites disagree or the body is not the expected
  boolean-field inversion. Premium features are not unlocked.
- `Disable pixiv ad SDKs` (requires `Hide pixiv ads`): skips the app's
  AppLovin MAX, Google Mobile Ads and Amazon APS initialization calls. Only
  app code (R8 default package or `jp/pxv/`) is matched, so calls inside SDKs
  and mediation adapters are not touched.

6.199.0 was patched, decompiled to check the four modified methods, installed
and launched on the API 36 emulator without crashes. The unpatched app logs
AppLovin, Mintegral, Pangle and Google ads activity at launch; the patched app
logged none. 6.200.0 applied without changes; the unpatched app again logged AppLovin
and Pangle at launch on the API 36 emulator and the patched app logged none, with no
fatal errors. 6.201.0 also applied without changes: the four modified methods were
checked in the output, and on the API 36 emulator the unpatched app logged AppLovin and
Pangle at launch while the patched app logged none, with no fatal errors. 6.202.1 also
applied without changes, with the same result: only the four intended methods changed,
and the unpatched app logged AppLovin and Pangle at launch while the patched app logged
none, with no fatal errors. 6.200.0 was retired once 6.202.1 was verified. Ad slots
after login were not verified.

## Google News

Rewrites of the two Google News patches from docbt/patched-up 1.10.0 (GPLv3).
The upstream CustomTabs patch addresses 5.163's obfuscated names and fails on
5.168 (`LaeahFingerprint` does not match).

- `Enable CustomTabs`: `CustomTabsTrampolineActivity` (not obfuscated) holds the
  browser-picker interface (single `String pick()` method). Every implementation
  is replaced with an extension that returns the default browser if it offers a
  Custom Tabs service, else the first browser that does, else `null`. The app
  derives `useCustomTabs = pick() != null` itself, so the upstream
  `useCustomTabs = true` rewrites are not needed; without a Custom Tabs browser
  the app keeps its WebView instead of binding a null package.
- `GmsCore support`: renames the package (option `packageName`, default
  `com.google.android.apps.magazines.morphe`, the upstream default, so updates
  over upstream installs keep working) together with both provider authorities,
  the `content_authority` string that `NSContentProvider` matches URIs against,
  and the app-defined permissions (`START_AUDIO_PLAYBACK`, receiver permission);
  the stock app and the patched app install side by side. GMS strings, content
  URIs and manifest c2dm names move to `app.revanced`, MicroG is added to
  `<queries>`, GNP keeps registering as the stock package, and the two GMS
  availability checks are required matches. Upstream's
  `.SuggestionProvider`/`.fileprovider` rewrite (absent in Google News) is
  dropped. Option `spoofedSignature` keeps upstream's value by default and
  offers Google News' own certificate SHA-1 (`38918a45...`) for fresh-install
  sign-in problems.

- `Disable device account notification sync`: GnpSdk periodically registers
  every Google account on the device for push notifications and requests an
  `oauth2:.../auth/notifications` token for each. Under MicroG every unapproved
  request posts "Account <name> / requested by Google News", one per account.
  The device-account provider (found through its "missing permission
  GET_ACCOUNTS" log and `getAccountsByType`; one method in 5.163, blocking and
  suspend variants since 5.168) now returns an empty list, as when GET_ACCOUNTS is
  missing. Account-bound push notifications are no longer registered; the app's
  own sign-in (AuthHelper) is not affected.

Both versions were patched and the manifest, resources and modified methods
were checked in the output. On API 36, 5.168 patched with `Enable CustomTabs` and
`Disable device account notification sync` launched to its home screen. The Android
emulator process itself then exits while the feed loads; this also happens with the
stock app and with every GPU mode, so article opening and MicroG sign-in are unverified.

5.170 removed `NSContentProvider` from the app (class and manifest entry). `GmsCore
support` still renames the remaining GNP file provider authority and the
`content_authority` string, and the stock and patched apps still install side by side.
All three patches applied without changes and the modified methods (both browser pickers,
both device-account methods, the GMS identifiers) and the manifest were checked in the
output. On API 36 the patched app (with and without `GmsCore support`) launched without
fatal errors in airplane mode; online the build without `GmsCore support` reached its home
screen and the emulator then exited as with 5.168, also with the stock 5.170 and with 5.168.

## Sankaku App

Rewrite of "Disable Infinite Upgrade Popup" from HellveticaPatches 1.1.3
(GPLv3). Sankaku is a React Native app whose logic lives in the Hermes bundle
`assets/index.android.bundle`. Upstream replaces fixed byte sequences per
release, lists only 4.23-4.26 (so 4.27 is skipped) and leaves the bundle's
SHA-1 footer stale. Its OTA guard only stops new update checks; a bundle that
HotUpdater already downloaded is still loaded natively, which matches the
upstream report that the popup returns on 4.26.

`HermesBundle` parses bytecode versions 98-99 (header, small/large function
headers, string table) to find functions by name, rewrites their entry to
`load r0, <constant>; ret r0` and recomputes the footer.

- `Disable Infinite Upgrade Popup`: `showPopupUpsell` returns `undefined` and
  `checkShowPopupUpsellModal` returns `false`. Requires the OTA patch.
- `Disable OTA bundle updates`: HotUpdater's `checkForUpdate` (the one that
  loads the "requires HotUpdater.wrap()" message) returns `null`, which the
  `wrap()` HOC treats as "no update"; the native `getJSBundleFile()` (found
  through its `prepareLaunch: bundleId=` log) always returns
  `assets://index.android.bundle`, so previously downloaded OTA bundles are
  ignored too.

4.26, 4.27 and 4.28 (official APKs from `welcome.sankaku.app/app-download`) were
patched; a byte diff against the original bundle shows only the three function
entries and the footer changed, the hermes-dec disassembly of the patched
functions is as intended, and the patched native method returns the asset URL.
4.27 and 4.28 were installed and launched on the API 36 emulator without fatal errors
(4.28 also past the welcome screen to Browse); the popup timing itself was not exercised.

