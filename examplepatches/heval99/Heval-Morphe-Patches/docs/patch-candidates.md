# Patch candidates - save for later

Shortlist of apps worth patching next, re-checked 2026-10-06 against the 926-package /
215-bundle community aggregate (`community_coverage.json`, rebuilt from
morphe-patches.software's `data/bundles.json`). None of the open candidates below are
on `docs/patch-blocklist.md`. Community coverage is informational only (owner decision
2026-10-07): an app covered by another bundle is still fair game.

Before starting one, follow the normal workflow in `AGENTS.md`: download the latest APK,
triage for PairIP/shields/server-side gates, find a stable anchor, then patch + smoke
test + decompile-verify.

## Tier 1 - ads only, easiest wins (GMA/AppLovin init+load kills)

| App | Package | Latest seen | Notes |
|---|---|---|---|
| Shazam | `com.shazam.android` | 16.62.1 | **Shipped 2026-10-05** - "Disable telemetry" (FirebaseAnalytics.logEvent + public Crashlytics surface). **2026-10-11** - "Open in Morphe YouTube apps" (issue #48: remaps the YouTube / YT Music "Open in" rows to the Morphe packages, falling back to stock; first extension module `extensions/shazam`). No ad SDK, billing or shields in the dex; no premium gate (free app) |
| Simple Radio | `com.streema.simpleradio` | 6.2.0 | **Shipped 2026-09-29** - "Enable Premium" (local `iab_premium` pref gate + `isPremium()`) and "Disable ads" (GMA init + MAX interstitial load/show) |
| WiFi Analyzer | `com.farproc.wifi.analyzer` | 3.11.2 | **Dropped by the owner 2026-11-12 (quality focus)** (shipped 2026-09-29) - "Disable ads" (single `Settings` show-ad gate on the `next_show_ad_time_millisec` pref) |
| SoundHound | `com.melodis.midomiMusicIdentifier.freemium` | 10.5.8 | **Shipped 2026-10-07** - "Disable ads" (GMA init + startPreload, every load/loadAd/loadAds on banner/native/interstitial/rewarded/app-open/Ad Manager classes, Meta AN init). NOTE the package: the earlier `com.melodis.soundhound.android` guess does not exist. Premium (Play Billing, obfuscated) parked |
| Dictionary.com | `com.dictionary` | 12.1.3 | **Parked 2026-10-07, needs deep dive.** Package/version verified against the APK (677). No IAP surface in app code (the billingclient bytes come from AppsFlyer's SDK). Ads are the problem: R8 stripped/inlined the GMA lite wrappers - only `MobileAds` + `nativead.NativeAd` remain public; banner/native/interstitial load through an R8-renamed Amazon-APS pipeline (Q4.d slots, P5.i/M5 flows, Q5.b placement enum with `/1027916/ANDROID_*` GAM units) and the readable `com.dictionary.foundation.ads.AdInitializer` bootstrap only covers the startup path, not the on-demand composable path (Q6.v). Candidate anchors for a future attempt: AdInitializer.b(Context) preamble, P5.i.b(Q5.a), GMA ClientApi located by its creator strings |
| Moon+ Reader | `com.flyersoft.moonreader` | 10.7 | **Shipped 2026-10-06** - "Disable ads" (MrAd.disableAds() forced true; the only app class touching the ad SDK) |
| 433 | `com.football433` | 2.3.548 | **Shipped 2026-10-17 (local, pending push)** - "Disable ads" (every google_mobile_ads plugin load reports a no-fill failure, so the ad slots collapse; the rewarded wallpaper download goes ahead without an ad, the app's own fallback when the ad fails to load; decompile- and emulator-verified against stock) and "Disable telemetry" (experimental: Sentry manifest switch, UXCam start blocked, Airship analytics off, Branch attribution NONE; Segment and the app's own collector are not covered). Flutter app, versionCode 868. APKMirror has no listing; the APK is from APKPure (XAPK) and carries the Play source stamp |

## Tier 2 - ads + local Pro/Premium

| App | Package | Latest seen | Notes |
|---|---|---|---|
| Pi Music Player | `com.Project100Pi.themusicplayer` | 3.2.0.0 | **Shipped 2026-09-29** - "Enable Premium" (static flag + 5-list in R8 holder; a()/b() forced, temp-ad-free resetter neutered, flag seeded in clinit) and "Disable ads" (GMA init/loads + MAX interstitial load/show) |
| TuneIn Radio | `tunein.player` | 42.5 | **Blocked 2026-10-05** - full PairIP shield; see blocklist |
| Podcast Republic | `com.podcast.podcasts` | 9.17.0 | **Shipped 2026-10-05** - "Disable ads" (GMA init/loads, MAX load/show, Meta AN + InMobi init). No premium gate: ad-free is Firebase invite state only |
| Castbox | `fm.castbox.audiobook.radio.podcast` | 11.26.1 | **Shipped 2026-10-05** - "Disable ads" (GMA init/loads, MAX load/show, Meta AN + InMobi init). No premium gate: vip lists are server-synced, purchases RSA-verified |
| Smart AudioBook Player | `ak.alizandro.smartaudiobookplayer` | 11.8.2 | Full-version unlock is a single local `Billings$LicenseType` getter (two other bundles force it). Known caveat: re-signing breaks Google sign-in. Package corrected 2026-10-07 (was `a.a.smartplayer.app`). **Next to attempt** |
| Cube ACR | `com.catalinagroup.callrecorder` | 2.4.281 | Local Play Billing purchase state + rewarded-video premium timers; ~7 methods on obfuscated classes. Package corrected 2026-10-07 (was `com.cubil.msgs.callrecorder`) |
| Today Weather | `mobi.lockdown.weather` | 2.5.0 | Ads + premium upgrade; local purchase flags. Re-signing breaks the Google Maps key (needs a resource step). Package corrected 2026-10-07 (was `com.todayweather.dev`) |
| Alarm Clock Xtreme | `com.alarmclock.xtreme.free`? | ? | Ads + PRO via Play Billing; not covered by any bundle. Package from secondary sources only - verify before starting |
| Radio Garden | `com.jonathanpuckey.radiogarden`? | ? | Fits the Simple Radio / Podcast Republic cluster; IAP removes marketing messages. Package from secondary sources only (`radio.garden` looks wrong) - verify before starting |
| UEFA Champions League app | `com.uefa.ucl` | ? | Football-adjacent (Sofascore/FotMob/Livescore cluster); needs a triage for ad SDK vs sponsor content. Uncovered 2026-10-06 |
| The Guardian | `com.guardian` | 6.238.23405 | **Shipped 2026-10-16** (pending push) - "Disable ads" (GMA load short-circuit, ShouldLoadAds false), "Disable article limit" (no meter request, offline wall becomes None; the free sign-in gate is kept), "Disable telemetry" (SDK manager gate off, Ophan uploader, Firebase Analytics/Crashlytics, push received-beacon, FA manifest flag). Stable 6.238.23405 (versionCode 23405). Decompile-verified; emulator-verified for stability, consent and telemetry log lines. Ads and the article limit are bytecode-only, because the emulator gets no ads and no meter wall |

## Tier 3 - simple Pro unlocks

| App | Package | Latest seen | Notes |
|---|---|---|---|
| Device Info HW | `ru.andr7e.deviceinfohw` | 5.27.1 | **Blocked 2026-09-29** - no Pro boolean exists in this build; see blocklist |
| Xplore File Manager | `com.lonelycatgames.Xplore` | 4.49.10 | **Blocked 2026-10-10** - PairIP VM + native tamper check; see blocklist |
| DartCounter | `com.dartcounter.mobile` | 9.7.5 | **Blocked 2026-10-11** - PairIP VM + native tamper check; Ultimate entitlement is server-side; see blocklist |
| spacedesk | `ph.spacedesk.beta` | 2.1.38 | **Blocked 2026-10-11** - free licence has the same features as paid; paid tier is a commercial business licence, and forcing it would spoof one to the PC driver (owner decision); see blocklist |

## Also covered by other bundles (informational, not a blocker)

MacroDroid (3 bundles), Pocket Casts, Hevy, CapCut, InShot, VN Video Editor, PicsArt,
Photomath, MX Player (`.ad`), AccuWeather, Alarmy, Strong, Lifesum, ReadEra, Automate,
Poweramp, Twitch (6 bundles), Stremio.

Checked 2026-10-07 against the 926-package rebuild:
- Flud (`com.delphicoder.flud`, not the earlier `com.delphic.flud` guess) - Morning
  Entree ("Flud Ad-Free & Bypasses"), rushiranpise and shaun-the-sheep ("Remove Ads")
- CX File Explorer (`com.cxinventor.file.explorer`) - hxreborn/morphe-patches
  ("Unlock premium" + themes)

Moved from the blocklist on 2026-10-07 (checked against the 777-package aggregate,
September 2026): SD Maid SE (`eu.darken.sdmse`), Poweramp, Solid Explorer, Podcast
Addict, Windy, Hermit, Calimoto, Nova Launcher, Sleep as Android, MiXplorer.

## Not suggested (checked, rejected or deferred)

- myTuner Radio (`com.mytuner.mobile`), Forza Football (`com.forzafootball`), The Free
  Dictionary (`com.tfd.mobile.TfdSearch`) - not on APKMirror; try APKPure/Aptoide first.
- Squid (`com.steadfastinnovation.android.projectpapyrus`) - premium validated server-side.
- Root Explorer (`com.speedsoftware.rootexplorer`), Titanium Backup
  (`com.keramidas.TitaniumBackup`), Torque (`org.prowl.torquefree`), Symfonium
  (`com.symfonion.symfonium`) - paid/trial apps; works like Tasker but it is straight
  piracy. Only on explicit request.
- Online games on the target device (Jawaker Tarneeb, Racify, UEFA Eurofantasy, Sorare)
  - online-server games: training/economy state is server-authoritative (the same wall
  the UFM 27 mod hit; see `apks/games/UFM 27/MODDING-NOTES.md`). Skip the whole category.

## Queued by owner (2026-10-11)

Triaged 2026-10-12; status per row.

| App | Package | Notes |
|---|---|---|
| AZ Screen Recorder | `com.hecorat.screenrecorder.free` | **Blocked 2026-10-12** - full PairIP still ships on 6.9.9 (VMRunner, libpairipcore.so); see blocklist |
| Spark Mail | `com.readdle.spark` | **Blocked 2026-10-12** - Premium/Plus/Pro are server-side (Readdle backend returns BillingInfo); see blocklist |
| BlueMail | `me.bluemail.mail` | **Shipped 2026-10-12** - "Disable ads" (2.2.408; ads via react-native-google-mobile-ads). Premium/ad-free entitlement is server-side and not patched. Not runtime-tested (ARM-only libs, extractNativeLibs=false; stock also fails on the x86_64 emulator) |
| PDF Reader | `pdf.pdfreader.viewer.editor.free` | **Pending 2026-10-12** - only APK found is an unverified Aptoide 2.1.6 (Play shows 2.1.5), signed by a self-signed "Jx Clarynx" cert that does not match the Play developer ("QR Code Scanner."). APKMirror and APKPure do not carry it. **2026-10-14: confirmed adware repack** (same signer and injected launcher-activity payload as the fake Futbin "27.5"); quarantined, never use it. Waiting for the genuine Play build from the owner's phone |
| SmartWOD Timer | `net.smartwod.timer` | **Shipped 2026-10-12** - "Enable Premium" (RNIapModule.getAvailableItemsByType @ReactMethod hooked via `extensions/smartwod` to report lifetime (Premium+) and ad-free as owned; premium is decided in JS from react-native-iap results checking only productId) and "Disable ads" (1.46.9). Runtime-verified on a Play-certified emulator (Premium+ / Lifetime, no ads) |

## Recommended first batch

Shazam + Simple Radio + Device Info HW + Pi Music Player: two trivial ad kills and two
local pro gates, all verified available on APKMirror.

## Status (2026-09-19)

Tier 1 progress, all checked against the latest APKMirror builds:

| App | Status |
|---|---|
| Textra SMS | **Dropped by the owner 2026-11-12 (quality focus)** (shipped; last verified 4.87) - "Enable Pro" (license pref class located structurally; l() -> true, k() -> false); see blocklist |
| jetAudio | **Shipped** - "Enable Pro" (purchase info class located by its inline literal; leaf getters -> true) |
| Unified Remote | **Dropped by the owner 2026-11-12 (quality focus)** (shipped; last verified 3.25.1) - "Enable Pro" (forced the local `License.Status` check; RevenueCat only feeds the paywall UI) |
| AZ Screen Recorder | **Blocked** - full PairIP (`SignatureCheck`, `VMRunner`, `VmDecryptor`); see patch-blocklist |
| ACR Phone | Parked - readable billing prefs bridge but the premium computation is obfuscated and a periodic purchase-refresh worker can overwrite cached state |
| Car Scanner ELM OBD2 | Parked - fully obfuscated app code, no RevenueCat; billing path not located yet |
| JuiceSSH | Parked - purchases stored in an ORMLite `purchase` table, premium gate in obfuscated code |
| Business Calendar 2 | **Patched 2026-10-11** - "Disable ads" (readable app code; `AdsUtil.showAdsForUser(Context)` gates the mediation SDK start and interstitials). Pro untouched |

## Requested by users (v1.14.0-dev.5 release, 2026-10-14)

From user comments on the v1.14.0-dev.5 release.
In queue order. Verdicts are first impressions; nothing has been triaged yet.

**Bug report (fix first)**

| App | Package | Notes |
|---|---|---|
| AiScore | `com.onesports.score` | **Bug, 3 reports:** goal alerts never arrive on the patched app, even with every notification permission granted (FotMob works for the same users). Likely Firebase push rejecting the re-signed app, as with 365Scores/Sofascore (fixed there with Spoof signature / GmsCore support) |

**App requests**

| # | App | Package | Requested | Notes |
|---|---|---|---|---|
| 1 | Brevent | `me.piebridge.brevent` | Unlock all features / premium | Most upvoted request (7); owner replied "i will try" |
| 2 | WeMuslim (Athan & Qibla) | `com.fyxtech.muslim` | Ads + analytics, premium, hide Premium tab and upgrade banners | **Triaged 2026-10-14 (3.5.0, vc 141, APKMirror, developer signer CN=athan O=yalla):** premium is server-side (membership comes from the server over protobuf; purchases confirmed server-side). Ads-only is possible but large: Pangle, AppLovin MAX, Unity, GMA, Meta AN, Amazon behind obfuscated gating. No Premium bottom tab in 3.5.0 (nav: Home, Prayer, Discover, Messages, Me); upgrade banners are anchorable by layout id. **Blocked 2026-10-14** on 3.5.4 (vc 149): ads/telemetry/banner patches built and green (smoke + CLI) but the native `libagora-ey.so` JNI_OnLoad rejects re-signed builds (runtime-tested, differential control); see blocklist. Parked on `wip/wemuslim`. |
| 3 | Interval Timer | `cc.dreamspark.intervaltimer` | Remove ads ("ads mess with the UI") | **Shipped 2026-10-14 (2.3.30)** - Disable ads + Disable telemetry; emulator: no ads or gaps, workouts run |
| 4 | Camera (Ocean Galaxy, "Timemark") | `com.oceangalaxy.camera.new` | Not specified | **Blocked 2026-10-14** (v10.0.270) - SecNeo packer plus libInnoSecure native protection |
| 5 | Tennis app ("TNNS Live") | `com.tennisrn` | Not specified | **Not now (2026-10-14, 8.4.1)** - React Native; ad-free decided in JS from RevenueCat (server); blocking ads would mean ~12 ad networks |
| 6 | VesselFinder | `com.astrapaging.vff` | Not specified | **In progress 2026-10-14 (6.7.8)** - ads-only (Capacitor AdvertPlugin + GMA); premium is server-side (account roles); PairIP licence check only |
| 7 | Textpand | unknown | Not specified | Find the package first |
| 8 | Moneycontrol | `com.divum.MoneyControl` | Not specified | **In progress 2026-10-14 (14.6.2)** - ads-only; Pro content and entitlements are server-side; bundles Akamai bot protection (runtime check needed) |
| 9 | A Better Routeplanner | `com.iternio.abrpapp` | Not specified | **Server-side (2026-10-14, 7.1.8)** - no ads; purchases verified server-side; premium data is server-backed |
| 10 | The Wall Street Journal (+ NYT, Washington Post, Financial Times, Guardian) | `wsj.reader_sp`, ... | Paywall / ads | Subscriptions are server-side; ad removal at most |
| 11 | Ultimate Guitar, WiFi Map Pro, The Pioneer | various | Not specified | **2026-10-14:** Ultimate Guitar blocked (full PairIP VM); WiFi Map blocked (DexProtector) and premium via Adapty server-side; The Pioneer (`de.gstmb.podcasts`) server-side (RevenueCat membership, no ads) |
| 12 | Backdrops | `com.backdrops.wallpapers` | Newer patch | Already in another Morphe bundle, and wallpapers update regardless; low priority |
| 13 | X-VPN | unknown | Premium | **Skipped 2026-10-14** (owner decision) |
| 14 | Twitch | `tv.twitch.android.app` | Remove ads | **Skipped 2026-10-14** (owner decision; ads are mostly server-inserted, Xtra covers it) |
| 15 | Cronometer | `com.cronometer.android` | Not specified | Already on the blocklist (APKMirror 403, likely server-side) |
| 16 | UniTV | not on Google Play | Full version | Off-Play IPTV service from a download site; skip |

| 17 | LuckyClick (auto clicker) | `com.peter890331.luckyclick.app` | Remove ads ("really long and unskippable") | **Triaged 2026-10-14 (3.28, vc 68):** **Dropped by the owner 2026-11-12 (quality focus)** (shipped 2026-10-14; last verified 3.28, vc 68) - Disable ads (app's own AD_FREE_PERMANENT flag + GMA backstop) and Disable license check (PairIP licence check only). Emulator: no ads, Start goes straight to capture |
| 18 | Car Scanner ELM OBD2 | `com.ovz.carscanner` | Unlock premium | Already parked (fully obfuscated, billing path not located; see "Also covered" list). Genuine APK in apks/carscanner |
| 19 | Cherrygram (Telegram fork) | github.com/arslan4k1390/Cherrygram | Premium | Open source; "premium" is Telegram Premium, which is server-side. Likely skip |
| 20 | Lovora | unknown | Not specified | Find the package first |
| 21 | VidMate | not on Google Play | Not specified | Off-Play downloader from download sites (repack risk); skip |

**Community note (resolved 2026-10-19):** a Korean user worried about patching KakaoTalk, which handles payments and certificates in Korea (a re-signed build may break Kakao Pay and certificate features). KakaoTalk support was removed on 2026-10-19 (see the blocklist), so no warning is needed.

## Open GitHub issues (2026-10-14)

From [the issue tracker](https://github.com/heval99/Heval-Morphe-Patches/issues). Truecaller (shipped 2026-10-13) has four of the five, so it goes first.

| Issue | App | Type | Notes |
|---|---|---|---|
| [#54](https://github.com/heval99/Heval-Morphe-Patches/issues/54) | Truecaller | Bug | Repeated "your premium expired" notifications, random freezes and crashes; after a clean install, spam calls are still not blocked |
| [#52](https://github.com/heval99/Heval-Morphe-Patches/issues/52) | Truecaller | Bug | Spam Protection falls back from Max to Basic; "Servers can't be reached" toasts; Premium tab stuck loading; Frequently called contacts enabled with its setting hidden (`isFrequentlyCalledVisible` false, per a commenter); **T9 dialer search finds no saved contacts**; unasked contact-UI, fraud-protection and SMS-tab changes. Likely the server treating the patched app as non-premium or modified (shared cause with #54) plus separate client bugs (T9, frequently called) |
| [#53](https://github.com/heval99/Heval-Morphe-Patches/issues/53) | Truecaller | Request | Hide the Blocking, Family invite and Premium tabs; block the tracking that flags the app as modified ("install from Play Store"). Owner replied "Looking into it" |
| [#50](https://github.com/heval99/Heval-Morphe-Patches/issues/50) | Truecaller | Request | **Declined 2026-10-14** - Truecaller hard-codes `content://com.truecaller` and the `com.truecaller.account` type, registration is attested by package, and dialer/call-screening roles have one holder. Replied; our broken GmsCore "Clone" value is being removed for Truecaller |
| [#55](https://github.com/heval99/Heval-Morphe-Patches/issues/55) | BoxBox | Bug | "Neither Disable ads nor Enable Premium works" after a clean install. Matches the 5.4.17 breakage fixed in 71bb868 (dev pre-release v1.14.0-dev.5 and later; emulator-verified); stable v1.13.0 still ships the old patches. Confirm the reporter's bundle and BoxBox versions |
| [#51](https://github.com/heval99/Heval-Morphe-Patches/issues/51) | Duplila - Mirror Screen | Request | **Dropped by the owner 2026-11-12 (quality focus)** (shipped 2026-10-14 (5.1)) - Enable Premium, Disable ads, Disable license check. Not runtime-tested (armeabi-v7a only) |
| [#58](https://github.com/heval99/Heval-Morphe-Patches/issues/58) | Digi Sport (`ro.rcsrds.digisport`, RCS & RDS) | Request | **Patched 2026-10-16** (1.1.15, vc 75; committed locally, not pushed) - "Disable ads", "Disable live stream ads" (no longer experimental since 2026-11-12: the owner reports DIGI-network users confirm live TV plays; we could not check it, live TV is geo-blocked to DIGI), "Hide betting odds", "Disable telemetry", "Disable update prompts", "Skip ad consent form", "Hide sponsored articles", "Hide promotions". Smoke, CLI decompile and emulator pass (no crash; ads, UMP form and Settings block gone; video plays). Not runtime-verified: live playback, odds (stock showed none), pre-roll (no ad fill), sponsored cards. App code is unobfuscated. The reporter's DAI swap (setMediaSourceForDai → setMediaSourceForPreRoll) would break ssai:// live items, so it was not used |
