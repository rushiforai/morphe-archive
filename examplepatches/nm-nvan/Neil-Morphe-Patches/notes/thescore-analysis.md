# theScore 26.15.0 — reverse-engineering notes

Target: `com.fivemobile.thescore`, versionName `26.15.0`, versionCode `39574`, minSdk/targetSdk per manifest,
launcher activity `com.thescore.base.ui.MainActivity`, application `com.fivemobile.thescore.ScoreApplication`.

Decompiled with jadx (output kept outside the repo). Obfuscated classes live in the **default package**
(jadx shows them as `defpackage/abc.java`; the dex descriptor is `Labc;`). Obfuscated names below are for
26.15.0 only and **must not** be used alone in fingerprints.

## 0. Fingerprinting anchors that survive obfuscation

- **SourceFile attributes are intact.** Every class still carries its Kotlin source file name
  (e.g. `MastheadAdManagerDelegate.kt`). Fingerprints can use
  `custom = { _, classDef -> classDef.sourceFile == "X.kt" }` together with return type / parameter shape.
- **Coroutine debug metadata** (`@DebugMetadata`, shown by jadx as `@u37(c = "...")`) keeps real class names,
  e.g. `com.thescore.ads.delegate.BannerAdManagerDelegate`.
- **Remote-config flag strings** (`"com.thescore.*"`), SharedPreferences keys, and `toString()` strings of data
  classes are plentiful and stable.
- Resource IDs: feature modules read them from their **unobfuscated library R classes**
  (`sget Lcom/thescore/repositories/R$string;->title_help:I`), not as inlined constants, so
  `resourceLiteral(...)` alone does not match there. Use the `resourceReference(...)` helper
  (field read or literal).
- `bv` (Items.kt) keeps the unobfuscated `getUniqueId()` / `getStableId()`; `TabInfo`, `Text$Resource`,
  `Text$Raw`, the `TabsConfig$*`, `AccountsConfig$*` and other `com.thescore.repositories.data.*` model classes
  keep their names.

## 1. APK shape

The provided file is **a base split, not a complete APK**:

- Manifest: `android:requiredSplitTypes="base__abi,base__density"`, meta-data
  `com.android.vending.splits.required=true`, stamp type `STAMP_TYPE_DISTRIBUTION_APK`.
- No `lib/` directory (native libs live in the `config.<abi>` split); density resources live in `config.<dpi>`.
- All 5 `classes*.dex` and `resources.arsc` are present, so code analysis is complete.

Implication: installing this file alone fails (missing required splits). Patch the full bundle
(APKM/APKS/XAPK) or a merged APK. Compatibility should therefore declare `apkFileType = ApkFileType.APKM`.

### 26.12.0 (APKMirror bundle)
`com.fivemobile.thescore_26.12.0-38771_…apkmirror.com.apkm`: versionCode 38771, a complete bundle
(base + `config.arm64_v8a` + `config.xxhdpi` + `config.xxxhdpi`). Obfuscated names differ from 26.15.0
(e.g. masthead delegate `Lbxe;`, list adapter `Lwod;`, ad storage `Lms;`), but source files, strings and item IDs
are the same. Known difference: `MastheadAdManagerDelegate` has no deferred loader in 26.12.0.
Patches are verified to apply to both versions with Morphe CLI 1.18.1.

## 2. Ads

### SDKs present
Google Mobile Ads / Ad Manager (`com.google.android.gms.ads`, "dfp"), Nimbus (`com.adsbynimbus`, with Vungle
demand), Amazon APS (`com.amazon` aps), Teads (`tv.teads`), Outbrain, IMA (video), AppHarbr (ad quality).
theScore wraps them all behind its own ad layer.

### Central blocking point (used by the "Remove ads" patch)
Every theScore ad of any type is loaded through the `ScoreAdWrapper` interface (`ScoreAdWrapper.kt`):
`load(AdType, String, String, String, Map, EventInfo, callback: (AdResult) -> Unit)`. There are three
implementations: `ScoreGoogleAdWrapper` (GAM banner/masthead/big box/sponsor/golf/bracket),
`ScoreNativeGoogleAdWrapper`, `ScoreVideoAdWrapper` (Scorecast field/ice video). Calling the callback with
`AdFailed(null)` (toString `"AdFailed(code="`, `AdsGateway.kt`) at the start of each makes every placement take its
normal no-fill path. Paths that bypass it: splash (`AdStorageGateway`), clip pre-roll (IMA via
`GoogleAdManager` media item + ad tag), interstitials (`InterstitialAdManagerDelegate` frequency-cap check) and
Teads (`TeadsAdManagerDelegate`). A network interceptor like adobo's Reddit patch would not work here: the ad SDKs,
notably Google's, don't use the app's OkHttp client.

### theScore ad architecture
| Role | Class (26.15.0) | SourceFile / anchor |
|---|---|---|
| Ad type enum | `Lmu;` | `AdType.kt`; names `MASTHEAD, BIG_BOX, BANNER, NATIVE, PRESENTED_BY, VIDEO, BIG_BOX_SHORT, BRACKET_BANNER, GOLF_BANNER` |
| Delegate base | `Lhr;` (abstract) | `AdManagerDelegate.kt`; `g(Context, AdParams, Continuation): Object` = load ad, base returns `Boolean.FALSE` |
| Delegate lookup | `Llq;->a(Lmu;)Lhr;` | `AdDelegateProvider.kt` |
| Gateway impl | `Lvab;` implements `Lgr;` | `GoogleAdManager.kt` |
| Ad view factory | `Lwwk;` | `ScoreAdProvider.kt` |
| Masthead | `Lbif;` | `MastheadAdManagerDelegate.kt` |
| Big box | `Lbo3;` | `BigBoxAdManagerDelegate.kt` |
| Banner | `Ls92;` | `BannerAdManagerDelegate.kt` |
| Interstitial | `Lfcc;` | `InterstitialAdManagerDelegate.kt`; strings `interstitial_ad_frequency_cap_ms`, `interstitial_ad_last_shown_timestamp` |
| Native / Presented-by / Golf / Bracket | `Lgtg;` / `Lk2j;` / `Lvza;` / `Lmy3;` | `*AdManagerDelegate.kt` |
| Ad storage (meta) | `Lct;` | `AdStorageGateway.kt` |

Ad **list items** (all extend `Lbv;`) and their unique IDs:

| Item | Class | uniqueId |
|---|---|---|
| BigBoxAdItem | `Lvn3;` | `"BIGBOXAD-" + n` |
| BannerAdItem | `Lp92;` | `"BANNERAD-0"` |
| TeadsAdItem | `Lavn;` | `"TeadsAd-" + n` |
| NativeAdItem | `Letg;` | dynamic (match by class / `toString`) |

`Lmy;` (`AdsViewHolderFactory.kt`) maps those to view types 126 / 228 / 134 / 132.

### Splash / startup ad
- Model: `Lfqm;` `SplashAd(splashType, url)`; type enum `Lgqm;`: `IMAGE_SPONSOR, IMAGE_FULLSCREEN, VIDEO_FULLSCREEN, VIDEO_SPONSOR`.
  Config comes from `ScoreMetaAds.splash_screens` / `video_splash_screens`.
- **Entry point:** `Lct;->b(Llb6;)Ljava/lang/Object;` (gateway method `gw.b`). Reads
  `location_region_code` / `location_country`, then calls `I(...)` (video) if flag
  `com.thescore.animated_launch_screens` is on, else `H(...)` (image). Both return `SplashAd` or `null`.
- Consumer: `StartupManager.kt` (`Luzm;`, coroutine in `Lwzm;`): `if (splashAd != null) show… else finish startup`.
  `null` is a normal "no splash" path. UI is `StartupForm.kt` (`Lizm;`, views `fullscreen_splash_ad`, `splash_video`).
- **Hook:** return `null` at the start of `ct.b(Continuation)`. Fingerprint: strings
  `"location_region_code"`, `"location_country"`, `"com.thescore.animated_launch_screens"`; returns `Ljava/lang/Object;`; 1 param.

### Banner under the game header (masthead)
- Layout `layout_matchup_header.xml`: `FrameLayout @id/masthead_ad_container` (`wrap_content`) above the toolbar
  inside the CollapsingToolbarLayout. The same container exists in `layout_scores_header.xml` and `layout_topic_header.xml`.
- Loaded by `MastheadAdManagerDelegate` (`Lbif;`):
  - `g(Context, lr, Continuation)` loads the ad → on success `u(id)` adds the ad view to the container.
  - `a(MainActivity, lr$b, Continuation)` = deferred loader (`DeferredAdLoader.kt` interface `Ldk7;`).
  - Both resolve `Boolean.FALSE` when no ad is available; the container then stays empty (0 height).
- **Hook:** make both methods return `Boolean.FALSE` at entry. Fingerprints: SourceFile
  `MastheadAdManagerDelegate.kt` + shape (`(Landroid/content/Context;L…;L…;)Ljava/lang/Object;` and
  `(Lcom/thescore/base/ui/MainActivity;L…;L…;)Ljava/lang/Object;`).
  Note: this also removes the masthead on the Scores and topic headers.

### Large inline ad in the Scores list (big box)
- `BigBoxAdItem` (`Lvn3;`) is inserted by `LeagueEventsTransformer.kt` (`Leyd;`), `MultiSportEventsTransformer.kt`
  (`Lkig;`), `MultisportEventsAssembler.kt` (`Lvkg;`), `TournamentListViewModelDelegate.kt` (`Lsvo;`),
  `MatchupTransformer.kt` (`Lssf;`). Rendering: `BigBoxAdViewHolder.kt` (`Lgo3;`) + `BigBoxAdManagerDelegate`.
  The ad queue for scores is `BigBoxScoresAdQueue.kt` (`Lmo3;`).
- All lists end up in the shared adapter **`Lh8e;` (`ListAdapter.kt`)**, `h8e.t(List<? extends bv>)` = set data
  (DiffUtil). Subclasses `Lb95;`, `Lc95;`, `Lw58;` don't override `t`.
- **Hook:** at the start of `h8e.t(List)`, replace `p1` with a filtered copy that drops ad items
  (by `getUniqueId()` prefix / class). Removing items before DiffUtil leaves no blank slot.
  As a second layer, `BigBoxAdManagerDelegate.g(...)` → `Boolean.FALSE`.
  Fingerprint for `t`: SourceFile `ListAdapter.kt`, `public`, returns `V`, params `[Ljava/util/List;]`.

### Other ad placements (optional)
Interstitials (`Lfcc;`), sticky banners (`Ls92;`), "presented by" sponsor units (`Lk2j;`, e.g.
`presented_by_ad_container` on standings), ScoreCast video ads (`video_ad_container`, `ScoreGoogleAdWrapper`/IMA),
Teads in articles, and native ads in the Scorecast list (strategy entries `NATIVE_AD`, `BIG_BOX_ADS`, `BANNER_ADS`, see §6).

## 3. Bottom navigation

- **Compose**, not BottomNavigationView. A `ComposeView` `@id/bottom_navigation` in `activity_main` renders
  `TheScoreBottomNavBar.kt` (`Luho;`). Each tab has its own nav graph and its own `NavHostFragment`.
- `MainActivity.x0` (static `List<Integer>`) = nav graph res IDs in order:
  `navigation_news, navigation_scores, navigation_favorites, navigation_videos, navigation_leagues`.
- Tab list is created in an R8 lambda `Lh4f;->invoke(Object)Object` (case 0) called from `MainActivity.U()`:
  `new su3(x0, fm, R.id.nav_host_container, …, deepLink, listOf(vu3(news), vu3(scores), vu3(favorites), wu3.a(false), vu3(leagues)))`.
- `Lvu3;` (`BottomNavTabUiState.kt`): `graphId, icon, label, testTag`; `toString()` →
  `"BottomNavTabUiState(graphId=… testTag=navigation_xxx)"`.
- **Bet** is the `navigation_videos` slot: `Lwu3;->a(Z)` (`BottomNavTabs.kt`) returns Bet or Videos; it's swapped at
  runtime based on flag `com.thescore.bet_section`. A toggle keyed on testTag `navigation_videos` hides it either way.
- Controller **`Lsu3;`** (`BottomNavController.kt`), ctor `(List navGraphIds, FragmentManager, int containerId, …, List tabs)`.
  Strings: `"BottomNavController requires at least one tab"`, `"bottomNavigation#"`, `"navGraphIds ("`.
  Enforces `navGraphIds.size == tabs.size` ("parallel-ordered"). Fields: selected id flow, tab list flow
  (`ImmutableList`), `SparseArray` id→fragment tag, and the **home tab** (`f`/`g` = always `x0[0]` = News).
- **Hook:** in `su3.<init>`, after the size check, replace the `tabs` list with a filtered copy (by testTag;
  Leagues is never removed). Fragments/deep links still come from `x0`, so nothing else changes.
- **Default start tab:** not remote-configured. `Llvl;` (`SettingsStorageGateway.kt`) `j()I` reads SharedPreferences
  `navigator.last_active_tab_v2` (`tab.news|tab.scores|tab.favorites|tab.videos|tab.leagues`) and **falls back to
  `navigation_scores`**. So the app opens on the last-used tab, or Scores on first run. `lvl.e(I)` saves it on each switch.
  A deep link overrides it.
- **Hiding the start tab:** no crash (`su3.a(id)` still shows that fragment), but the screen would show a hidden tab
  with nothing highlighted. Also, Back always returns to the home tab (News). Plan:
  - hook `lvl.j()`: if the result is a hidden tab, return `navigation_leagues`;
  - at the end of `su3.<init>`, if News is hidden, repoint the home tab (`f`, `g`, `i`) to Leagues.
  - Side effect to know: starting on Leagues auto-reopens the last league page (`KEY_LAST_LEAGUE`, `lvl.f()`); this is stock behaviour.
- Programmatic selection: `su3.a(I)` / `MainActivity.f(I)` (interface `tu3`).

## 4. Top header tabs (game + league screens)

Shared stack (no Compose): `com.thescore.base.ui.tabs.TabsFragment` → `Lmxh;` (`PagerFragment.kt`) → ViewPager2 +
TabLayout + `TabLayoutMediator`; adapter `Lxuh;` (`PageAdapter.kt`, FragmentStateAdapter, `List<oxh>`);
item `com.thescore.repositories.ui.tabs.TabInfo` (title `Text`, `Configs config`, `default`, …);
ViewModel `Lyrn;` (`TabsFragmentViewModel.kt`); per-screen delegates extend `Llc9;` (`FavoritableTabsViewModelDelegate.kt`).

- The **default tab is chosen by flag** (`TabInfo.default`), not index (`Lhxh;`). If the default is hidden, the first
  remaining tab is selected. A one-item list hides the TabLayout. An empty list shows "no data available", so never return empty.
- Filtering must happen **at the delegates** (data source). The fragment/adapter re-read the unfiltered list for
  icons and the initial adapter, so filtering later would desync indices.

### Game screen: `Llrf;` (`MatchupTabsViewModelDelegate.kt`)
- `B(omf, int, boolean): List<oxh>`: team sports, MMA, auto, tennis. Strings `"driver_records"`,
  `"com.thescore.public_chat"`, `"soccer"`. Several `return-object` paths.
- `v(String, League, Continuation): Object`: golf. Strings `"/golf/leagues/1"`, `"/pga"`, `"GOLF"`.
- Full tab set (string res → setting key):

| Title resource(s) | Shown as | When | Key |
|---|---|---|---|
| `tab_feed` (golf: `title_news`) | FEED / NEWS | not tennis | `feed` |
| `tab_chat` | CHAT | flag `com.thescore.public_chat` | `chat` |
| `tab_score_cast` / `tab_matchup` | SCORECAST / MATCHUP | always (default tab) | `scorecast` |
| `tab_lineups` | LINEUPS | soccer | `lineups` |
| `stats` | STATS | | `stats` |
| `tab_betting` / `tab_betting_info` | BETTING / BETTING INFO | | `betting` |
| `tab_plays`, `tab_drives`, `tab_mbm`, `tab_pitch_by_pitch` | PLAYS / DRIVES / MBM | | `plays` |
| `tab_fights` | FIGHTS | MMA | `fights` |
| `tab_results`, `tab_qualifying`/`tab_qualifiers` | RESULTS / QUALIFYING | auto racing | `results`, `qualifying` |
| `tab_field`, `tab_leaders`, `tab_matches` | FIELD / LEADERS / MATCHES | golf | `leaderboard` |
| `tab_course`, `tab_info` | COURSE / INFO | golf | `course`, `info` |

- Deep-link keys map (`lrf.E`): feed, chat, matchup/scorecast/preview, lineups, stats, betting, bettinginfo, plays,
  drives, mbm, pitchbypitch, news, field, leaders, matches, fights, results, qualifying, qualifiers, course, info.
- **Risk:** remote flag `com.thescore.new_matchup_page` (checked in `Lbf2;`) routes game screens to a new Compose page
  (`MatchupPageScreen.kt` `Lxmf;` / `MatchupPageContent.kt` `Lnmf;`, tabs News/Chat/Scorecast/Betting). It's off for
  this account (the screenshots show the classic page). If the server enables it, the tab/Scorecast hooks won't apply;
  forcing that flag off is an option.

### League screen: `Lb0e;` (`LeaguePageViewModelDelegate.kt`)
- The list is built in coroutine `La0e;->invokeSuspend` (`LeaguePageViewModelDelegate$getLiveData$1`) and emitted via
  `uce.emit(list)`. Strings `"com.thescore.bracket_tab"`, `"standings"`, `"League"`, `"Bracket"`.
- **Server-driven:** tabs come from `League.sections` (`key`, `name`, `default`). Titles are the server's text
  (`Text.Raw`), which is why "Standings" isn't in strings.xml.

| section.key | Config class | Key |
|---|---|---|
| `events` (SCORES) | `TabsConfig$LeagueScheduleConfig` / `$TournamentScheduleConfig` | `scores` |
| `news` | `FeedConfig$ResourceUrisConfig$UriConfig` | `news` |
| `chat` | `ChatListConfig` (flag `com.thescore.public_chat`) | `chat` |
| `standings` | `TabsConfig$StandingsTabsConfig` | `standings` |
| `leaders` | `TabsConfig$LeadersTabsConfig` | `leaders` |
| `bracket` (synthetic, flag `com.thescore.bracket_tab`) | `BracketComposeConfig` | `bracket` |
| any other key (teams, players, …) | shared `UriConfig` with server title | lower-cased title |

- **Hook:** before the final `emit` in `a0e.invokeSuspend`, filter the list argument.
- Team (`Ls4o;`), player (`Ltoi;`), tournament (`Lbvo;`) and sub-tab delegates use the same stack and are left alone.

### Header icons
- Menu `res/menu/sports_option_menu.xml`: `menu_alerts` (bell), `menu_favorite` (star), `menu_calendar` and
  `menu_share` (`showAsAction=never`, so they populate the overflow ⋮). All hidden by default.
- Inflated in `Lbf2;->onCreateOptionsMenu`; state applied through `Lc4g;` (MenuAppBarViewHolder).
- Star/bell: `Lhc9;` (`FavoritableAppBarViewHolder.kt`) sets action views and visibility.
- Overflow: game screens `Lwif;` (`MatchupAppBarViewHolder.kt`) shows `menu_calendar` (not finished) and
  `menu_share`. League screens (`Lvzd;`) only inherit star/bell, so there's no overflow there.
- Back arrow: plain `androidx.appcompat.widget.Toolbar` (`layout_toolbar.xml`), navigation icon set in `Lew0;->E(Z)V`
  (`AppBarFragment.kt`, shared by every screen).

## 5. League chip row (Leagues screen header)

- This is the **"recent leagues" pill row**, the first item of the Leagues tab RecyclerView
  (`ListsFragment` + `LeaguesConfig`).
- Built by `Ll1e;` (`LeaguesMenuTransformer.kt`) `a(LeaguesMeta, Continuation)`: reads recent league slugs
  (`Lirj;` `RecentLeaguesStorage.kt`, SharedPreferences `RECENT_LEAGUES`, written when you open a league) and returns
  `listOf(RecentLeaguePillsItem(pills))` or an empty list. Item `Lerj;` (`RecentLeaguePillsItem.kt`), view holder
  `Lhrj;` (Compose LazyRow inside).
- **Hook:** return an empty list at the start of `l1e.a(...)`. Fingerprint: string `"RECENT_LEAGUES"`, params start with
  `Lcom/thescore/repositories/data/meta/LeaguesMeta;`. Alternative: filter the `RecentLeaguePillsItem` in the
  `h8e.t` hook (uniqueId `"RecentLeaguePillsItem"`).

### Spotlight section (Leagues tab)
- Below the chip row: a "Spotlight" header (`R.string.spotlight_text_redesign`) plus one row per active spotlight
  (`com.thescore.repositories.data.spotlights.Spotlight`, e.g. "WNBA Finals: Game 3").
- Built in `Ll1e;->c(Ljava/util/ArrayList;L…;)Ljava/io/Serializable;` (same `LeaguesMenuTransformer.kt`):
  calls `b(spotlights)` to build rows (also records `seen_spotlights` in SharedPreferences), then returns
  `header + rows`, or an empty list when there are none.
- **Hook:** return an empty list at the start of `c(...)`. Header and rows disappear together, no gap.
  Fingerprint: `resourceLiteral(ResourceType.STRING, "spotlight_text_redesign")`, return type `Ljava/io/Serializable;`.

## 6. Game Scorecast screen blocks

- RecyclerView of `bv` items (several view holders render Compose inside). Pipeline:
  `Lmnf;` (`MatchupPageViewModelDelegate.kt`) → `Lssf;` (`MatchupTransformer.kt`) → `mnf.q(list)` → emit.
- **Block order is enum-driven.** Strategy classes `Lymf;` and `Lymf$a…$h;` (`MatchupPageStrategy.kt`) return
  `List<yjf>` from `a()/b()/c()` (chosen per sport in `Ltg2;`), and `ssf` switches over them by ordinal.
- Enum `Lyjf;` (real enum, names kept): `BOXSCORE, LIVE_STREAM_CTA, EMPTY, NATIVE_AD, LIVE_ODDS, BETTING_POLL,
  BET_HISTORY, CLIPS, PROP_ANALYSIS, TEAM_FORM, LIVE_TABLE_PREVIEW, MATCHUP_PREVIEW_RECAP, PLAYER_COMPARISON,
  STARTING_LINEUP, PLAYER_INJURIES, TEAM_STATS, TEAM_RECORDS, LAST_TEN_MEETINGS, LAST_FIVE_MEETINGS, GAME_DETAILS,
  LAST_PLAY, PENALTY_SHOOTOUTS, TIMELINE, LINE_SCORE, SCORING_SUMMARY, SHOTS_ON_GOAL, MATCHUP_PENALTIES, THREE_STARS,
  HEAD_TO_HEAD, PAST_MEETINGS, PLAYER_PROFILES, MATCH_DETAILS, TOURNAMENT_DETAILS, MATCH_SUMMARY, THE_SCORE_CAST,
  CALL_TO_ACTION, UNAVAILABLE_ITEM, BIG_BOX_ADS, BANNER_ADS, GAME_NEWS`.
- **Game News** = `GAME_NEWS`: item `Lwta;` (`GameNewsSectionAdapterItem`, uniqueId `"GameNewsSectionAdapterItem_…"`),
  created only in `ssf.f(Scores$Event, z0c): wta` (returns null when disabled; gated by flag
  `com.thescore.game_news_enabled`). Title `game_news_title`, RotoWire content.
- **Odds** = `LIVE_ODDS`: header `Lj35;` (ClickableHeader, `odds_title` + "Go to SBET" link), market grid `Lzz2;`
  (`"bet-data-wrapper-"`), `Lagl;` "See All Odds" (`"SeeAllOddsItem "`); fallback path `Lol3;` (`"BettingOdds-"`).
- **Hook (preferred):** filter the strategy lists. Before each `return-object` in the `()Ljava/util/List;` methods of
  `ymf` and its subclasses, run an extension filter that drops enum entries by `name()`. Whole blocks (header, cards,
  See All) disappear together, and the `ordinal()` switch is unaffected. Backup for Game News: `ssf.f` → `null`.
- Candidate extra toggles: `BETTING_POLL`, `PROP_ANALYSIS`, `BET_HISTORY`, `LIVE_STREAM_CTA`, `CLIPS`,
  `PLAYER_INJURIES`, `TEAM_STATS`, `LAST_PLAY`, `SCORING_SUMMARY`, `HEAD_TO_HEAD`, plus `NATIVE_AD`/`BIG_BOX_ADS`/`BANNER_ADS` for the ad patches.

## 7. My Account screen and App Preferences

- RecyclerView (`ListsFragment`) of `bv` rows; delegate `Lqg;` (`AccountViewModelDelegate.kt`) for
  `AccountsConfig$MyAccountConfig`.
- Rows are built in R8 lambda `Log;->invoke(Object,Object)Object` (duplicated for `com.thescore.tsb_mode` on/off):
  SBET Mode, Odds Format, theScore Bet CTA | Favorites, Leagues, Bookmarks, Muted Users |
  **App Preferences** (`title_app_preferences`, config `AccountsConfig$SettingsConfig$AccountSettingsConfig`,
  background `bg_rounded_top_corner`), Help, About | Log Out.
- Row model `Ldvl;` (`SettingsItems.kt`, `toString` `"SettingsOptionItem(title=…"`): 11-arg ctor
  `(Text title, Text message, Text selected, hjl, Configs, boolean divider, uul$a tag, Integer background, boolean enabled, String linkUrl, Integer icon)`.
- Clicks: `Lgvl;` (`SettingsOptionItemViewHolder.kt`) `y(View, uul)`. A row with no config, no link and tag `NONE`
  is a harmless no-op.
- App Preferences screen: same row system, built in `Luvl;->invokeSuspend` (`SettingsViewModelDelegate$getAccountSettingsMenu$1`).
- **Plan:** insert a cloned `dvl` row "Morphe Settings" right after the App Preferences row (before each
  `return-object` in `og.invoke`), intercept its click at the start of `gvl.y`, and open a full-screen `Dialog` built
  in extension code (no new manifest entry).

## 8. Sign-in and re-signing

| Method | Present? | Effect of re-signing |
|---|---|---|
| Email/password (theScore "Cognito" REST API, `CognitoService.kt`, `POST oauth/access_token`) | Yes, primary | Not cert-bound itself, **but** login/sign-up add Play Integrity attestation headers when flags `com.thescore.attestation_login` / `attestation_signup` are on. A re-signed APK gets an "unrecognized app" verdict. Whether the server rejects it can only be found at runtime. |
| Google Sign-In / Credential Manager | No (library bundled, not used) | n/a |
| Facebook Login | No SDK (only legacy `fb…://authorize` intent scheme) | n/a |
| Apple | No | n/a |
| theScore Bet / ESPN Bet account linking (IMI, ContentProvider bridge) | Yes | **Breaks.** It relies on signature-level permissions and cert checks between the apps. |
| Firebase (FCM, Remote Config, Analytics, Crashlytics) | Yes, no Firebase Auth / App Check | Normally unaffected. |

Install-time facts:
- The APK **declares signature-level permissions owned by the betting app**
  (`bet.thescore.android.permission.REQUEST_DATA` and `.dev`/`.other` variants). If **theScore Bet**
  (`bet.thescore.android`) is installed, installing a re-signed theScore will likely fail with
  `INSTALL_FAILED_DUPLICATE_PERMISSION`. (ESPN Bet's permissions are `normal`, so no conflict.)
- The stock theScore must be uninstalled first (signature mismatch).
- No pairip, licence check, or app self-signature check was found. Play Integrity is the only attestation.
  Out of scope for this project; nothing here touches it.
