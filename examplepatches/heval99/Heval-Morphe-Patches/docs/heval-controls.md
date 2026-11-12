# Patch settings (Heval Controls framework)

Patch settings is an in-app settings screen for patched apps. The user can switch supported
patch features on or off at runtime without patching again. A choice is a saved preference that
the patched code reads, so a change takes effect at once, or after a restart for features read
only at startup.

Users see the name "Patch settings": the Manager patch, the screen title, the Settings row and
every message on screen. The code keeps the internal framework name Heval Controls
(`hevalcontrols` packages and module paths, `HevalSettings`, `HevalControlsActivity`,
`hevalControlsPatch`, the `heval_controls` SharedPreferences file, the
`<package>.hevalcontrols` provider authority and the `HevalControls` log tag), so saved choices
and existing installs are unaffected.

2026-11-03: renamed in the UI from "Heval Controls" to "Patch settings" at the owner's request.
Feature ids, preference keys and the registry format did not change. Manager selections keyed on
the old patch name reset to the default (on).

Status (2026-11-03): Truecaller 26.42.5 ships it. Its "Patch settings" patch (default on) adds a
"Patch settings" row below Help on the main Settings screen, and 20 converted Truecaller patches
are runtime switches (`truecaller/controls/TruecallerControls.kt` and the patches that use
`truecallerControls.featurePatch`), plus five profile menu switches from "Hide profile menu items"
(list in [Truecaller features](#truecaller-features)). Sofascore
26.10.19 ships it too: a "Patch settings" row after Preferences on its Settings screen, with
switches for sports, match tabs, pop-ups, promo sections, animation speed, widget refresh and
three converted patches
(`sofascore/controls/SofascoreControls.kt`; list in [Sofascore features](#sofascore-features)). LinkedIn
4.1.1261 was the first app (an in-app entry row in
the home nav panel and runtime features). It was removed on 2026-10-15 after the test account was
banned, so the LinkedIn names below are examples only. The design study, with alternatives and the
HushMessenger analysis, is kept outside the repo; this page is the developer guide.

## Contents

- [Architecture](#architecture)
- [How a feature answers at runtime](#how-a-feature-answers-at-runtime)
- [Adding Heval Controls to an app](#adding-heval-controls-to-an-app)
- [Feature hook example](#feature-hook-example)
- [Truecaller features](#truecaller-features)
- [Sofascore features](#sofascore-features)
- [FotMob features](#fotmob-features)
- [App-specific Java helpers](#app-specific-java-helpers)
- [List settings (pickers)](#list-settings-pickers)
- [What cannot be toggled at runtime](#what-cannot-be-toggled-at-runtime)
- [Crash guard and safe mode](#crash-guard-and-safe-mode)
- [Settings screen](#settings-screen)
- [Registry format](#registry-format)
- [Testing](#testing)
- [Known limits and next steps](#known-limits-and-next-steps)
- [Credits](#credits)

## Architecture

| Part | Path | Role |
|---|---|---|
| Extension | `extensions/hevalcontrols/` | Builds `extensions/hevalcontrols.mpe`: the init provider and the settings screen, plus the bundled core. |
| Core library | `extensions/hevalcontrols/core/` | Plain Android library (not an extension, because it is nested; same rule as `extensions/smartwod/stub`). Holds the engine, the registry codec and the crash-guard logic, with JVM unit tests. |
| Patch helpers | `patches/src/main/kotlin/app/template/patches/shared/hevalcontrols/` | `hevalControlsPatch(...)` (the host patch), `featurePatch(...)`, `HevalFeature`, the registry encoder and the gate helpers. |

Java classes (package `app.template.extension.hevalcontrols`):

| Class | Purpose |
|---|---|
| `HevalSettings` (core) | The engine. `isEnabled(String)` is the hot path that every hook calls. |
| `Registry`, `RegistryCodec`, `Feature` (core) | Hold the feature list that the patch writes at patch time, and decode it. |
| `CrashGuard` (core) | Counts quick crashes at startup and turns on safe mode. |
| `OptionIcons` (core) | Builds emoji flags for list pickers (see [List settings](#list-settings-pickers)). |
| `PrefsStore`, `Store`, `AppContext` (core) | Store choices in SharedPreferences, and provide the context and process helpers. |
| `InitProvider` | A non-exported ContentProvider that starts the engine and the crash guard before `Application.onCreate`. |
| `ui.HevalControlsActivity`, `ui.Views`, `ui.Palette`, `ui.Diagnostics` | The settings screen, with every view built in code. |
| `ui.ListPicker`, `ui.OptionImageLoader` | The picker of a list setting, and the loader and cache of its option images (see [List settings](#list-settings-pickers)). |

The extension is pure Java (minSdk 23, no androidx, no kotlin-stdlib, no resources). An `.mpe`
is a single dex file. Its resources and manifest are discarded, so every string and colour lives
in code, and the patch adds the manifest entries.

There is only one copy of the core in the app. Only the host patch calls
`extendWith("extensions/hevalcontrols.mpe")`. An app-specific extension must depend on
`:extensions:hevalcontrols:core` with `compileOnly`, never `implementation`. The patcher merges
duplicate classes with "first copy wins", so a second copy built from a different revision would
be silently ignored.

## How a feature answers at runtime

`HevalSettings.isEnabled("<id>")` returns `true` only when the patched behaviour should run.
`false` always means stock behaviour. The rules, in order:

1. **Before the engine has started** (no context yet, for example inside
   `Application.attachBaseContext`): it returns the feature's registered default, and does not
   cache that answer. The engine starts in `InitProvider.onCreate`. If a hook runs first, the
   engine starts lazily through `ActivityThread.currentApplication()`.
2. **Engine failure** (the settings could not be read), **global pause** or **safe mode**: it
   returns `false` for every feature.
3. **Unknown id**, an unsupported registry, or a **dependency** that is off, missing or cyclic:
   it returns `false`.
4. Otherwise it returns the user's saved choice, or the registered default.
5. **Any exception**: it returns `false`.

"Fail-open" here means the app keeps working and falls back to stock behaviour. It never means
that a modification is forced on.

The hot path does no file IO and no allocation. It reads one `volatile` reference to an
immutable snapshot, then does one `HashMap` lookup. The snapshot is rebuilt on every change by a
SharedPreferences listener. That listener is held strongly, because SharedPreferences keeps its
listeners in a `WeakHashMap`.

Storage is the private SharedPreferences file `heval_controls`, with these keys:

| Key | Holds |
|---|---|
| `f.<id>` | A feature choice (boolean). |
| `l.<id>` | A list feature's picked keys (string set; missing or empty = stock). See [List settings](#list-settings-pickers). |
| `o.<id>` | A list feature's seen options (string set of `key TAB label`, at most 500). |
| `_paused` | The global pause. |
| `_safe_mode` | Safe mode. |
| `_theme` | The theme: `system`, `light`, `dark` or `amoled`. |

Writes use `commit()`, so a restart or a crash cannot lose them. Crash-guard records are separate
`AtomicFile`s in `filesDir/heval_controls/`.

## Adding Heval Controls to an app

1. **Create the host**, once per app, in `patches/.../<app>/controls/<App>Controls.kt`. The
   example uses LinkedIn names (the real file also passes its entry-point patch, see step 3).

   ```kotlin
   package app.template.patches.linkedin.controls

   import app.template.patches.shared.Constants.COMPATIBILITY_LINKEDIN
   import app.template.patches.shared.hevalcontrols.hevalControlsPatch

   internal val linkedInControls = hevalControlsPatch(COMPATIBILITY_LINKEDIN)

   // Expose the host patch, so Manager lists "Patch settings".
   @Suppress("unused")
   val linkedInHevalControlsPatch = linkedInControls.patch
   ```

   The host patch adds the provider and the activity to the manifest, merges the `.mpe`, and in
   `finalize` writes the registry, the bundle version and the patched app version into
   `Registry`. It is available on every installer, Root Mount included (see
   [Known limits](#known-limits-and-next-steps) for what a mount install loses).

2. **Write each feature as its own named patch** with `featurePatch`. That patch depends on the
   host, runs your edits, and registers the feature only after every edit has succeeded:

   ```kotlin
   @Suppress("unused")
   val hidePromotedPostsPatch = linkedInControls.featurePatch(
       HevalFeature(
           id = "linkedin.hide_promoted",
           name = "Hide promoted posts",
           description = "Removes promoted posts from the feed.",
           category = "Feed",
           default = true,              // keep today's behaviour for converted patches
       ),
   ) {
       // Validate every hook site first, then edit.
       val method = PromotedVisibleFingerprint.method
       method.hevalReturnEarly("linkedin.hide_promoted", false)
   }
   ```

   Patches that cannot be switched at runtime can still be listed. Register them with
   `buildTimeOnly = true`, and they show as "Applied at patch time".

   A feature patch `dependsOn` the host, so selecting any converted patch also applies "Patch
   settings". The host is selected by default; deselecting it in Manager while a converted patch
   is selected still applies it. It also means a broken host anchor (for Truecaller, the Settings
   entry point) makes every converted patch fail loudly, not only the host.

3. **Add an entry point.** This is per app. A menu-row hook calls
   `HevalControlsActivity.open(Context)` through
   `invoke-static {pX}, Lapp/template/extension/hevalcontrols/ui/HevalControlsActivity;->open(Landroid/content/Context;)V`
   (or starts the activity by class name). The activity is `exported="false"`, so only the app
   itself can open it. Pass the unnamed entry-point patch to the host,
   `hevalControlsPatch(COMPATIBILITY_X, dependencies = setOf(entryPatch))`, so the entry is always
   part of "Patch settings". Truecaller's entry (`truecaller/controls/TruecallerControls.kt` and
   `HevalControlsEntry` in `extensions/truecaller`) adds a row styled like Help right after it on
   the main Settings screen. An entry must first check that the activity is registered
   (`PackageManager.getActivityInfo` for the component; `NameNotFoundException` means a Root Mount
   install with the stock manifest) and show nothing otherwise. If starting the activity fails, it
   logs and shows a short toast.

4. **Smoke test.** Assert that the extension classes are in the emitted dex, that the
   `Registry.encoded()` string equals `HevalRegistryCodec.encode(...)` of the expected features,
   and that each gated method starts with the gate. Also assert the provider (authority
   `<package>.hevalcontrols`, `exported=false`, `initOrder=1000`) and the activity
   (`exported=false`) in the decoded manifest. `HevalControlsPatcherTest.kt` shows all of these
   assertions.

Feature ids must match `^[a-z][a-z0-9_.]{0,63}$`. Use the form `<app>.<feature>`. Never rename a
shipped id: it names the user's saved choice.

## Feature hook example

`addHevalGate` inserts the gate: while the feature is on, the patched path runs, and the original
code after it is the stock path. `addHevalStockPath` is the inverse, for code the patch generated
itself (a helper method that exists only in the patched app): while the feature is off, the given
stock path runs and must end with a return, throw or goto; while it is on, execution falls into the
original (patched) code. Truecaller's Hide Blocking tab, Show caller number in call log and Fix T9
contact search use it at index 0 of their own helpers. The `hevalReturnEarly` and
`hevalReturnNull` helpers wrap `addHevalGate` for the three common shapes:

| Helper | Method shape | Patched path |
|---|---|---|
| `hevalReturnEarly(id)` | `void` | Returns at once (`return-void`). |
| `hevalReturnEarly(id, value)` | `boolean` | Returns `value`. |
| `hevalReturnNull(id)` | Returns an object | Returns `null`. |

For example, `isPromotedVisible()Z` with `hevalReturnEarly("linkedin.hide_promoted", false)`
becomes:

```smali
.method public final isPromotedVisible()Z
    .registers 3
    const-string v0, "linkedin.hide_promoted"
    invoke-static/range {v0 .. v0}, Lapp/template/extension/hevalcontrols/HevalSettings;->isEnabled(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :heval_stock
    const/4 v0, 0x0
    return v0
    :heval_stock
    # original body, untouched
    iget-boolean v0, p0, Lcom/linkedin/...;->a:Z
    return v0
.end method
```

How the scratch register is chosen:

- At index 0 the gate uses `v0`, because nothing is live at method entry. The method must have at
  least one local register.
- At another index, pass `register =`, or the helper uses morphe-patches-library's
  `findFreeRegister`.
- The helper refuses parameter registers, and it refuses to insert before a `move-result`.
- The invoke is `/range`, so registers above v15 work.

Any other edit can use `addHevalGate` with your own patched path:

```kotlin
method.addHevalGate("app.feature", index = 0) { v -> "return-void" }

// A generated helper whose body is the patched behaviour: while off, return the stock answer.
helper.addHevalStockPath("app.feature") { v -> "return-void" }
```

Two more shapes keep a stock path where the original patch removed or overwrote code:

- `addHevalSkip(id, index, target)` jumps from `index` to `target` while the feature is on
  (`if-nez` on the isEnabled result) and falls through to the original code while it is off. Use it
  instead of removing an instruction (Disable call button haptics keeps each haptic dispatch and
  jumps over it) or instead of an unconditional `goto` (the LazyColumn item skips of Hide frequently
  called contacts and Hide important senders). The scratch register comes from `findFreeRegister`,
  so pick an `index` whose own code already reaches `target`.
- `MutableClass.addHevalValueHelper(id, name, type) { v -> ... }` adds a static `(T)T` helper (`Z`,
  `I` or `F`) that returns its argument unchanged while the feature is off, and
  `MutableMethod.filterThroughHevalHelper(index, register, helper)` passes a register through it
  (`invoke-static/range`, `move-result`). Use it where the patch forced or changed a value in place
  (`const/4 vX, 0x0` before a branch or a store, `neg-float`): the site needs no free register.

```smali
# Restore classic call log: the "featureFavouriteContacts" result before the swipe guard
invoke-virtual {v1}, Lgj9;->a()Z
move-result v1
invoke-static/range {v1 .. v1}, Lz78;->morpheClassicCallLogSwipe(Z)Z   # false while on, v1 while off
move-result v1
if-nez v1, :cond_43
```

The usual rules still apply (AGENTS.md):

- Gate only concrete methods (`implementation != null`).
- Use `.method`, not `methodOrNull`, for mandatory anchors.
- Gate every overload that matters.
- Use stable anchors.

## Truecaller features

Truecaller 26.42.5 (2026-11-03). Every converted switch defaults on; its Manager patch keeps its
name, description and default. The profile menu switches (marked "off") start off. A shipped id is
never renamed.

| Feature id | Patch | Restart | Gated sites |
|---|---|---|---|
| `truecaller.hide_promotions` | Hide promotions | yes | toggle overrides, referral context gate at index 0 (answers false) |
| `truecaller.disable_nags` | Disable nags | no | toggle overrides |
| `truecaller.disable_who_viewed_me` | Disable Who viewed me (off) | no | toggle override |
| `truecaller.disable_auto_launch` | Disable auto-launch | no | toggle override |
| `truecaller.disable_update_prompts` | Disable update prompts | no | gates at index 0 |
| `truecaller.hide_assistant_tab` | Hide Assistant tab | yes | gate at index 0 (answers false) |
| `truecaller.hide_scam_feed` | Hide Scam feed | yes | gate at index 0 (answers false) |
| `truecaller.hide_blocking_tab` | Hide Blocking tab | yes | its tabs helper (stock path) |
| `truecaller.hide_family_button` | Hide family button | yes | toggle override |
| `truecaller.show_caller_number` | Show caller number in call log | no | its subtitle helper (stock path) |
| `truecaller.fix_t9_search` | Fix T9 contact search | yes | its refresh helper (stock path) |
| `truecaller.hide_after_call_contacts` | Hide after-call screen for contacts | no | toggle overrides |
| `truecaller.hide_business_media` | Hide business media | no | toggle overrides, screen entry gate, media helper |
| `truecaller.hide_messages_tab` | Hide Messages tab | yes | its tabs helper, default tab getter, selectTab, bar helper |
| `truecaller.hide_premium_tab` | Hide Premium tab | yes | its tabs helper, Settings `isPremiumItemVisible` store (value helper) |
| `truecaller.restore_classic_call_log` | Restore classic call log | yes | toggle override, swipe guard (value helper) |
| `truecaller.hide_call_log_filters` | Hide call log filters | yes | filter row composable and filter setter (index 0) |
| `truecaller.hide_frequent_contacts` | Hide frequently called contacts | no | LazyColumn item skip |
| `truecaller.hide_important_senders` | Hide important senders | no | LazyColumn item skip |
| `truecaller.disable_call_button_haptics` | Disable call button haptics | no | haptic dispatch skips, drag progress (value helper) |
| `truecaller.swap_call_buttons` | Swap call answer and decline buttons | no | offsets and call style check (value helpers), notification layouts |
| `truecaller.hide_profile_premium_banner` | Hide profile menu items (off) | no | row state renderers (Enabled -> Disabled helper) |
| `truecaller.hide_profile_watch` | Hide profile menu items (off) | no | MenuItemUiState isVisible store (row helper), empty-group drop |
| `truecaller.hide_profile_invite` | Hide profile menu items (off) | no | MenuItemUiState isVisible store (row helper), empty-group drop |
| `truecaller.hide_profile_connect` | Hide profile menu items (off) | no | MenuItemUiState isVisible store (row helper), empty-group drop |
| `truecaller.hide_profile_help` | Hide profile menu items (off) | no | MenuItemUiState isVisible store (row helper), empty-group drop |

The five profile menu switches (#120) come from one opt-in patch, "Hide profile menu items", and
start off, so the menu (the screen the profile picture opens) is stock until the user hides a row.
The menu builds its rows each time it opens, so a change shows the next time it opens. Each row
switch makes the row's MenuItemUiState invisible, which the menu already filters out; while any of
them is on, a section left without rows is dropped so no divider is left behind. The Premium banner
switch makes the banner's row state (titled "Premium member" or "Upgrade to Premium") the Disabled
state, which draws nothing. The Settings screen's Wear OS row is still "Hide Wear OS settings".

Added 2026-11-08 (Truecaller 26.43.5, smoke test only): Hide promotions also makes the per-context
referral gate answer false, so no referral entry point shows (most of its keys are read from
server-written SharedPreferences, which toggle overrides cannot reach). Disable nags also covers the
invalid-profile reminder ("featureInvalidProfileNotification"). Disable Who viewed me is opt-in and
starts off: it reads "featureWhoViewedMe" as off, which stops the app reporting your views of other
profiles and removes the feature; "No profile view notifications" only silences the notification.

Hide call log filters is marked restart because its row is a composable: an open call log screen
keeps the row it composed until the screen composes it again. Swap call answer and decline buttons
also has a resource part. It cannot be switched in place, so the patch adds swapped copies of the
notification layouts (`<name>_heval_swapped`) and leaves the stock ones untouched. The notification
class asks `SwapCallButtons.layout(int)` in `extensions/truecaller` for each layout id: the copy's
id (found by name at runtime, because the patcher assigns new resource ids when it encodes) while
the feature is on, the stock id while it is off.

Not converted: Disable ads, Disable telemetry, Disable contact upload, Enable Premium, GmsCore
support, Spoof signature, Hide Wear OS settings and Use SMS for verification codes.

## Sofascore features

Sofascore 26.10.19 (2026-11-03). Unlike Truecaller, most Sofascore patches hold several
switches: each switch is registered only when its anchor exists in the app. Switches marked
"off" start off, so the app is stock until the user turns them on.

| Feature id | Patch | Default | Restart | Gated sites |
|---|---|---|---|---|
| `sofascore.hide_sport_<slug>` (25, `-` as `_`) | Hide sports | off | yes | sport_order queries (`filterSportOrders`, `filterSportNames`), home sport getter (`visibleSport`) |
| `sofascore.hide_ai_insights` | Hide AI insights | on | no | EventHeadFlags `getAiInsights` (flag and not switch) |
| `sofascore.hide_tab_<tab>` (commentary, crowdsourcing, media, graphs, standings, cup_tree, matches) | Hide match tabs | off | no | EventHeadFlags getters, the match page tab check (`isEventTabHidden`) |
| `sofascore.hide_modal_<key>` (match_of_the_week, remove_ads, promotion, weekly_challenge, survey, propose_follow) | Hide promo pop-ups | on | no | modal queue enqueue and evaluator (`hideModal`) |
| `sofascore.hide_promo_<id>` (10 Remote Config keys) | Hide promo sections | off | yes | Remote Config boolean getter (`hidePromoSection`) |
| `sofascore.hide_betting_content` | Hide betting content | on | no | its forced values |
| `sofascore.block_marketing_notifications` | Block marketing notifications | on | no | its dismiss, keep-gone and in-app message sites |
| `sofascore.disable_rating_prompts` | Disable rating prompts | on | no | its forced value |
| `sofascore.animations_off` | Animation speed | off | yes | `AnimationSpeed.init` first in ReleaseApp.onCreate, every app call to `Settings.Global.getFloat` (`AnimationSpeed.getFloat`) |
| `sofascore.animations_fast` | Animation speed | off | yes | the same sites |
| `sofascore.slower_widget_refresh` | Slower widget refresh | off | yes | widget refresh interval (`widgetRefreshInterval`) |
| `sofascore.hidden_countries` (list) | Hide countries | off | yes | SportCategoriesResponse.getCategories (`filterCategories`), CategoriesForDateResponse.getCategories (`filterCategoryWrappers`), SearchResponse.getResults (`filterSearchResults`), the sportLiveEvents and getIndexedEventsPage request returns (`filterEventList`), the categoryScheduledEvents request return (`filterCategoryEvents`), seeds by `CountryFilter.init` at the end of ReleaseApp.onCreate |
| `sofascore.hidden_competitions` (list) | Hide competitions | off | yes | the same shared sites minus the leagues list, plus UniqueTournamentGroupResponse.getUniqueTournaments (`filterUniqueTournaments`); icons by `CompetitionFilter.init` (called from `CountryFilter.init`) |
| `sofascore.spoiler_free` | Spoiler-free mode | on | no | EventActivity and LeagueActivity onCreateOptionsMenu (`addMatchItem`, `addCompetitionItem`) and their (Event)V / (UniqueTournament)V methods (`onMatch`, `onCompetition`); master of the five rows below |
| `sofascore.spoiler_notifications` | Spoiler-free mode | on | no | FCMListenerService.onMessageReceived (`blocksPush`) |
| `sofascore.spoiler_lists` | Spoiler-free mode | on | no | EventListScoreTextView.setText (`scoreText`), the match row binder's start (`markRow`) |
| `sofascore.spoiler_widget` | Spoiler-free mode | on | no | the widget row builder's return (`maskWidgetRow`) |
| `sofascore.spoiler_events` (list) | Spoiler-free mode | off | no | read by every spoiler hook; filled by the match page item |
| `sofascore.spoiler_competitions` (list) | Spoiler-free mode | off | no | read by every spoiler hook; filled by the competition page item |

AMOLED black (2026-11-09, `sofascore.amoled_black`, build-time only) is an opt-in resource patch (the night values of
`surface_1` and `surface_P`); the Patch settings screen shows it as a read-only "Applied at patch time" row
(titled "Pure black dark theme" since 2026-11-11; the Manager patch is still "AMOLED black").
Sofascore reads its dark colors by name, so a runtime switch is not possible (the patcher's resource API can only
edit entries of existing resource files, so a second color set under a new qualifier cannot be added).

Sofascore row titles changed on 2026-11-11 (ids and Manager patch names unchanged): "Hidden countries" and
"Hidden competitions" are "Hide countries" and "Hide competitions", "Turn off animations" is "No animations",
"Hide goal alerts" is "Hide alerts for marked matches"; the sections are Scores and spoilers, Leagues and
countries, Sports, Match page, Bottom tabs, Pop-ups and banners, Betting and promotions, Look and feel.

Hidden countries (2026-11-03) keys are the categories' `alpha2` codes (Sofascore's own, e.g. EN
England, SX Scotland, WA Wales, NX Northern Ireland, XK Kosovo); categories without one (World,
Europe, International, tennis tours) are `slug:<slug>`. The picker is seeded with the app's own
country list (234 entries in 26.10.19, read from its `<clinit>` at patch time into
`CountryFilter.seeds()`), and every category the filters see is reported with its name, also while
nothing is picked. Filtered: the leagues list (never emptied), the date feed's country rows,
search (events, competitions, teams, players; managers, referees, venues, sports and stages stay),
the Live tab and the chronological view (a new EventListResponse). Not filtered: the live counts map
(`LiveCategoriesResponse`, category id -> count, no country), pinned leagues fetched by their own
tournament requests, team/player/tournament pages, the widget and notifications. Favourites are not
exempt: a hidden country wins.

Hidden competitions (2026-11-03) keys are UniqueTournament ids ("17" is the Premier League) and the
labels are "category · name" ("England · Premier League"), so the alphabetical picker groups them by
country. Both list patches depend on one unnamed hook patch (`sofascoreListFiltersPatch` in
`sofascore/countries/ListFilterHooks.kt`) that edits every site once; `CountryFilter` in
`extensions/sofascore` holds the hooks, and each feature patch only rewrites its `patched()` getter
(`CountryFilter.patched`, `CompetitionFilter.patched`) to true, so a hook skips the list whose patch is
not in. Filtered: the Live tab, the chronological view and an expanded country of the date feed (the
`categoryScheduledEvents` request, `api/v1/category/{cid}/scheduled-events/{date}`; events by
`tournament.uniqueTournament.id`), a date-feed country row when every id in its
`uniqueTournamentIds` is hidden (the row's match count stays stock), search (competition results and
events) and a country's competitions in Leagues (`UniqueTournamentGroupResponse.getUniqueTournaments`,
which may become empty: the app skips an empty group). Options are reported from Leagues, expanded
countries and search only, not from the Live tab or the chronological view: those carry hundreds of
competitions a day and a list keeps at most 500 seen options, which would leave no room for the ones
the user looks for. A picked competition is reported wherever it is filtered, so its label stays
saved. Not filtered: pinned/favourite leagues fetched by their own requests, team/player/tournament
pages, the widget and notifications. No static seed: Sofascore has no bundled competition list (one
could be baked at patch time only from a hand-made list, which would go stale).

A hidden sport never empties the sport list: if every sport is hidden, the filter returns the full
list, and a hidden home sport falls back to the first visible one.

Animation speed (2026-11-03) is a three-way choice made of two switches, because the registry only
has on/off switches: "Turn off animations" (scale 0, no activity transitions) wins over "Faster
animations" (the system animator scale times 0.5), and with both off every hook passes the system
value through. `extensions/sofascore` `AnimationSpeed` scales only the "animator_duration_scale"
key in the redirected `getFloat` calls (Compose's motion scale, Material indicators, Lottie), sets
ValueAnimator's duration scale through the hidden `setDurationScale` (reflection; a blocked call is
logged once under the `HevalControls` tag and the getFloat part still works) and keeps it set when
the framework resets it (a duration-scale listener on API 33+, and before each activity is created).
Slower widget refresh changes the widget work's repeat interval from 30 minutes to one hour; the
app enqueues it with the UPDATE policy from the widget receiver's onEnabled/onUpdate, so a change
applies at the widget's next update.

Spoiler-free mode (2026-11-08, Sofascore 26.10.26, phase 1) lets the user mark a match on its match
page or a competition on its page ("Spoiler-free: on/off" in the overflow menu; `SpoilerFree` in
`extensions/sofascore`). The marks are the two lists (event ids, UniqueTournament ids), which depend
on the master switch, so the user can un-mark entries in Patch settings. Each surface has its own
switch (on by default, depending on the master), so the user picks what is hidden and turning one
off restores stock for that surface only: notifications drops a push whose "notification" JSON opens
a marked event (pushes carry no competition id, so a marked competition does not block pushes);
match lists blank every EventListScoreTextView cell of a marked match's row (scores, period scores,
aggregate, penalties, status) also on later updates, while the kickoff time cell stays; the widget
empties a marked match's score cells and shows its kickoff time as the status. Only the display
changes: the Event objects, sorting, the Live tab, live updates and stored favourites are stock.
Not covered: the match page header and tabs, search, favourites' and featured match views, the chat
and share card, team form, standings, the winner colour of team names, Wear, notifications the
system shows on its own while the app is in the background, and old finished marks (they stay
until the user un-marks them).

Not converted: Disable ads,
Enable Premium, Disable telemetry, Disable Facebook SDK, GmsCore support and Spoof signature.

## FotMob features

FotMob 240.17974.20261023 (2026-11-03). The "Patch settings" row sits after Support on FotMob's
Settings screen (`fotmob/controls/FotMobControls.kt`, `HevalControlsEntry` in `extensions/fotmob`).
Every switch defaults on once its patch is selected; the Manager names, descriptions and defaults
did not change for the converted patches.

| Feature id | Patch | Manager default | Restart | Gated sites |
|---|---|---|---|---|
| `fotmob.hide_betting_content` | Hide betting content | off | no | odds gate (index 0) |
| `fotmob.disable_rating_prompts` | Disable rating prompts | on | no | RatingAppMessage producer (index 0) |
| `fotmob.disable_plus_promo_popup` | Disable FotMob+ promo popup | on | no | PlusPromoConfig reader (index 0) |
| `fotmob.use_system_font` | Use system font | off | yes | font flag store (value helper), Typeface loader (index 0), `SystemFontPatch` (create, composeFamily, theme overlay) |
| `fotmob.disable_animations` | Turn off animations | off | yes | `AnimationSpeed` (getFloat redirect, ValueAnimator scale, transitions) |
| `fotmob.faster_animations` | Faster animations | off | yes | `AnimationSpeed` (half the system animator scale) |
| `fotmob.slower_live_refresh` | Slower live refresh | off | no | match page ticker limit 15 -> 30 (value helper) |
| `fotmob.hidden_countries` (list) | Hide countries | off | yes | LiveMatchesAndLeagueRank.<init> (`filterLiveMatches`), LeagueConverter.convert returns (`filterLeagues`), Suggestion constructors' league/team/match stores (`filterLeagueSuggestions`, `filterTeamSuggestions`, `filterMatchSuggestions`) |
| `fotmob.hidden_competitions` (list) | Hide competitions | off | yes | the same shared sites (`fotMobListFiltersPatch`); logos and seeds by `CompetitionFilter.init` (called from `CountryFilter.init`) |
| `fotmob.spoiler_free` | Spoiler-free mode | on | no | PushMessagingService.onMessageReceived (index 0, `SpoilerFree.blocksPush`), the menu/activity_match_facts_v2 and menu/league_info builders (index 0, `addMatchItem` / `addCompetitionItem`); widget row via `SpoilerFree.hidesScoreInWidget` / `status`; the score rows via `SpoilerFree.hidesScoreInLists` (match page header: `hidesScoreOnMatchPage`, live-update notification: `hidesScoreInNotifications`) |
| `fotmob.spoiler_matches` (list) | Spoiler-free mode | - | no | marked on the match page; needs `fotmob.spoiler_free` |
| `fotmob.spoiler_competitions` (list) | Spoiler-free mode | - | no | marked on the competition page; needs `fotmob.spoiler_free` |
| `fotmob.spoiler_notifications` | Spoiler-free mode | on | no | what gets hidden: the push drop and the ongoing live-update notification; needs `fotmob.spoiler_free` |
| `fotmob.spoiler_lists` | Spoiler-free mode | on | no | what gets hidden: the score rows in the match lists; needs `fotmob.spoiler_free` |
| `fotmob.spoiler_match_page` | Spoiler-free mode | on | no | what gets hidden: the score at the top of the match page; needs `fotmob.spoiler_free` |
| `fotmob.spoiler_widget` | Spoiler-free mode | on | no | what gets hidden: the score in the live score widget; needs `fotmob.spoiler_free` |

Each surface has its own switch (all default on, all off while `fotmob.spoiler_free` is off), so the
user chooses in Patch settings what marked matches hide; every hook asks its own surface.

Spoiler-free mode (2026-11-08, phase 1; smoke-tested on 241.18134, not run on a device). The user marks a
match ("Spoiler-free: on/off" in the match page's overflow menu, keyed by FotMob's match id from the
`PARAM_MATCHID` extra) or a competition (the same item on the competition page, keyed by the
`leagueId` extra, like Hidden competitions). The marks are the two lists above; both depend on the
switch, so turning it off restores stock everywhere, and marks can be removed in Patch settings. A
match counts as marked when its id is marked or its league id or parent league id is a marked
competition. Covered: match push notifications (the FCM message's `m`, `lid`, `plid`; the push is
dropped before FotMob handles it) and the home-screen live score widget (kickoff time instead of the
score, empty status label) and the six methods that format the live score and ask `Match` whether it
has started (the live row, the fixture row, the match page header, two view-holder methods and the
live-update worker): a marked match counts as not started there, so they show the kickoff time. Not
covered yet: score-drawing methods that never ask whether the match started (the team form line,
the holder-based builders, the shared string helper), the match page tabs (events, stats, momentum),
the league and team widgets, search, head-to-head, brackets, standings, the bold winner in the live
row, the status text ("FT", the minute) and the widget's bold winner after a penalty shootout. The
live-update worker still shows an ongoing notification for a marked match, with kickoff time instead
of the score. Marks of finished matches stay until the user removes them (at most 500 per list).

Hidden countries (2026-11-03) keys are FotMob's league country codes (FIFA three-letter codes; `INT` national-team and `INT-2` club competitions, which match lists and search both call `INT`: `CountryData` in `extensions/fotmob` tells them apart by league id from the bundled `res/raw/available_leagues`, the last leagues list (saved in `heval_fotmob_countries`) and every leagues list loaded; while a league is unknown, a raw `INT` is hidden only when both are picked). Favourite leagues and favourite teams' matches always stay (FotMob's `FAVORITE_LEAGUES_JSON` / `FAVORITE_TEAMS_JSON`, re-read when they change). The picker is seeded with 217 FIFA codes plus the two International groups by `CountryFilter.init` from `ActivityHooks.register`, and the leagues list reports what it sees. The Leagues tab never goes empty (if every league would be hidden, the full list stays). The onboarding league picker uses the same leagues list, so it is filtered too; search filters leagues, teams (by league id) and matches, not players or referees; the widget and notifications are not filtered.

AMOLED black (2026-11-09, `fotmob.amoled_black`, default on once the patch is in, restart required) is a
runtime switch. The resource step (`amoledOverlayResourcePatch`) checks that the ten attributes of the night
`Base.Theme.FotMob.DayNight` still reference their stock grays (`nero_black`, `chinese_black`, `raisin_black`,
`dark_charcoal`) and adds a style `HevalAmoledOverlay` to `res/values/styles.xml` with the same ten
attributes at AMOLED values (`#0a0a0a` cards and Material surfaces, `#000000` bottom bar, `#141414` card
headers and unselected chips, `#121212` bottom sheets). `ActivityHooks.onActivityCreated` calls
`AmoledBlack.applyTheme`, which applies that style to the activity's theme when the switch is on and the
screen is in dark mode. The night theme itself and the shared colors are not edited, so the light theme is
untouched and the switch can turn the look off again. Not run on a device.

Hidden competitions (2026-11-03) keys are league ids ("47" is the Premier League); a stage or group league of the match lists (`ParentId` > 0, e.g. a qualification round) is keyed by its parent, as FotMob's own `League` picks a league's primary id, so all stages of a competition hide together (a league picked by its own id goes too, and search names a stage's league by the parent the match lists linked it to). Labels are "country · name" ("England · Premier League", "International (clubs) · Champions League"; the country part is the Hidden countries picker's name), so the alphabetical picker groups competitions by country. Both list patches depend on one unnamed hook patch (`fotMobListFiltersPatch` in `fotmob/countries/ListFilterHooks.kt`) that edits every site once; `CountryFilter` holds the hooks, and each feature patch only rewrites its `patched()` getter (`CountryFilter.patched`, `CompetitionFilter.patched`) to true, so a hook skips the list whose patch is not in. A league goes when its country or its competition is picked; favourite leagues and favourite teams' matches still win. Filtered: match lists, the Leagues tab and onboarding's league picker (never emptied) and search (league hits by id, teams and matches by their `leagueId`). Options: the app's bundled `res/raw/available_leagues` (388 leagues) is the in-memory seed, registered on a background thread by `CompetitionFilter.init`; the leagues list and search report only competitions the seed does not already name the same way, so the 500 saved options are spent on new ones, and match lists never report (hundreds of competitions a day). Not filtered: league/team/match pages, the widget and notifications.

Turn off animations wins when both animation switches are on. Use system font keeps the stock theme
resources: its resource part only adds the `HevalSystemFontOverlay` styles, and
`ActivityHooks.onActivityCreated` applies them to each new screen while the switch is on. The
activity hooks are registered from `FotMobApp.onCreate`. Not converted: Disable ads, Disable
telemetry, Enable FotMob+, GmsCore support and Spoof signature.

## 365Scores features

365Scores 15.0.0 (2026-11-09). The entry point is a "Patch settings" row at the end of the Settings
page (`scores365/controls/Scores365Controls.kt`): the page's list builder (found by the strings
"Change Server" and "SETTINGS_CATEGORY_NOTIFICATIONS") gets one more row of the page's own row
class, built like the dev-only "Change Server" row (same constructor and icon attribute) with the
id 0x5EE7, and the row click handler (found by its `BolaoWebActivity` class constant) asks
`SettingsEntry.handles(requireContext(), id)` first and returns when it answers true. The hook gets
its Context from `Fragment.requireContext()` on p0, so the patch refuses to apply when p0 is
overwritten before the hook.

| Feature id | Patch | Default | Restart | Gated sites |
|---|---|---|---|---|
| `scores365.spoiler_free` | Spoiler-free mode | on | no | master; the match and competition toggles (`addMatchToggle`, `addCompetitionToggle`) are shown only while it is on |
| `scores365.spoiler_notifications` | Spoiler-free mode | on | no | the notification handler (`blocksNotification`, surface 0) |
| `scores365.spoiler_lists` | Spoiler-free mode | on | no | the row score formatter (`rowScoreText`, surface 1) |
| `scores365.spoiler_match_header` | Spoiler-free mode | on | no | the ScoreBoxView header (`afterScoreBox`, surface 2) |
| `scores365.spoiler_status` | Spoiler-free mode | on | no | the status text of rows and the header (surface 3) |
| `scores365.spoiler_winner` | Spoiler-free mode | on | no | winner hints of rows and the header (surface 4) |

| `scores365.hidden_competitions` (list) | Hide competitions | off | no | `GamesObj.getGames()` and `getCompetitions()` (`ListFilters.filterGames` / `filterCompetitions`) |
| `scores365.hidden_countries` (list) | Hide countries | off | no | the same two getters |

Hidden competitions and countries (2026-11-09, owner request: 365Scores lacked what Sofascore and
FotMob have). Both lists are read at run time, so a change needs no restart. Keys are competition
ids (`GameObj.getCompetitionID()`, the key of the `competitions` map) and country ids
(`CompetitionObj.getCid()`); labels are "country · name" and the country name, learned from the
responses the app loads (`filterCompetitions` reports every competition and country of a response
once). The shared hook patch (unnamed, `scores365ListFiltersPatch` in `scores365/lists`) makes the
two getters of the parsed response return a filtered copy: a game of a hidden competition or of a
hidden country is left out, and so is the competition; the response itself is unchanged, so paging
and updates keep working. Because the getters belong to the shared response type, a hidden competition
is also gone from the match lists of team and competition pages. Not filtered: standings, news,
search results, widgets and notifications. Not run on a device.

`SpoilerFree.isSurfaceOn(surface)` reads the surface's switch through `HevalSettings.isEnabled`, which
is off while the master is off. The marked matches and competitions are still kept in the
extension's own preference file (`morphe_spoiler_free`), so 365Scores has no "Marked matches" list
picker yet. AMOLED black (`scores365.amoled_black`, build-time only) is shown as a read-only row for the same
reason as on Sofascore: the app picks its dark colors by name in code and layouts and its themes have only three
attributes. Not converted: Disable ads, Enable Premium, Disable update prompts, GmsCore support and
Spoof signature.

## App-specific Java helpers

When a feature needs logic (list filtering, URL rewriting, reflection), put it in a per-app
extension. Read switches through `HevalSettings` with `compileOnly` access to the core. (The
LinkedIn extension so far only needs `compileOnly(project(":extensions:linkedin:stub"))` for
LinkedIn's own classes.) For example:

```kotlin
// extensions/<app>/build.gradle.kts
dependencies { compileOnly(project(":extensions:hevalcontrols:core")) }
```

```java
public static List<Object> filterFeed(List<Object> items) {
    if (!HevalSettings.isEnabled("linkedin.hide_promoted")) return items;   // stock
    try {
        // ... filter ...
    } catch (Throwable failure) {
        HevalSettings.reportFailure("linkedin.hide_promoted", failure);    // class + frame only
        return items;                                                       // stock on error
    }
}
```

`reportFailure` keeps only the exception class and the first `app.template.extension` frame,
never the message. The screen then shows the feature as "Failed, using stock behaviour" for the
rest of the process.

## List settings (pickers)

Added 2026-11-03 for "Hidden countries" in Sofascore and FotMob. A list setting is not a switch: the
user picks items to hide from a checklist, and the app extension asks whether a key is hidden. The
app-side hooks live in the per-app extensions; the framework only stores the picks, offers the
options and draws the picker.

**Declare** it with `HevalListFeature` and register it like a switch, through `featurePatch` or
`host.register` from a patch that already edited the hook sites:

```kotlin
internal val HIDDEN_COUNTRIES = HevalListFeature(
    id = "sofascore.hidden_countries",          // permanent: names the saved picks
    name = "Hidden countries",
    description = "Leagues and matches from the countries you pick are hidden.",
    category = "Leagues",
    restartRequired = false,                    // true when the app reads the list once per process
    dependencies = emptyList(),                 // switches that must be on for the list to apply
)

val hideCountriesPatch = sofascoreControls.featurePatch(HIDDEN_COUNTRIES) { /* hook sites */ }
```

`HevalListFeature(...)` is `HevalFeature(kind = HevalFeatureKind.LIST, default = false)`. A list
can never be on by default (an empty list is the default and is stock) or build-time-only; the
`HevalFeature` constructor rejects both.

**Read** it from the app extension (`compileOnly(project(":extensions:hevalcontrols:core"))`):

| Java API (`HevalSettings`) | What it does |
|---|---|
| `static Set<String> getHidden(String listId)` | The keys to hide right now. Immutable, shared, never null: one volatile read and one map lookup, no IO, no allocation. Empty before the engine starts, on engine failure, pause, safe mode, an unknown or switch id, or a dependency that is off. A change replaces the set, so don't cache it. |
| `static boolean isHidden(String listId, String key)` | `getHidden(listId).contains(key)`; false for a null key. Never throws. |
| `static boolean isEnabled(String listId)` | True while the effective list is non-empty, so a smali gate can skip the filter cheaply. |
| `static void registerOptions(String listId, Map<String,String> keyToLabel)` | Static seed options (a bundled list), in memory for this process only, merged across calls. Call it from code that runs at process start so the picker has them. |
| `static void reportOptionsSeen(String listId, String key, String label)` | The app showed this option; the picker will offer it. Persisted under `o.<id>`, written in a background batch about 1.5 s after the first new option. A known key with the same label costs two map lookups and no IO. |
| `static void reportOptionsSeen(String listId, Map<String,String> keyToLabel)` | The same for several options. |
| `static void setOptionIconProvider(String listId, HevalSettings.OptionIconProvider provider)` | Optional per-option icon (null removes it): `provider.iconFor(key)` returns a short text such as an emoji flag, or null. In memory for this process only, like the seeds; icons are never saved and never decide what is hidden. Register it with the seeds. A provider that implements `HevalSettings.OptionImageProvider` (which extends `OptionIconProvider`) also answers `imageUrlFor(key)`: an https image the picker swaps in for the text icon once loaded. |
| `static String optionImageUrl(String listId, String key)` | The picker's image lookup: the provider's URL, trimmed, or null when the provider has no images, answers null, or answers anything but `https://<host>...` of at most 512 printable-ASCII chars. Never throws. |

For the settings screen (also public): `setHidden(String, Set<String>)`, `setHidden(String, String,
boolean)`, `clearHidden(String)`, `pickedHidden(String)` (the picks ignoring pause and safe mode)
and `options(String)` (seeds, then persisted and pending seen options, whose labels win, plus every
picked key, labelled by its key when nothing names it, so a pick can always be undone).

Rules and limits:

- Keys are any non-empty string up to 100 characters without a tab or line break (use a stable
  key such as a country code or the app's own id, not the label). Labels are trimmed, have tabs and
  line breaks replaced and are cut to 120 characters; an empty label becomes the key.
- At most 500 picks and 500 persisted options per list; further new options are dropped. Unknown
  and switch ids are ignored by every call.
- "Reset all to defaults" empties every list; the seen options stay (they are not a choice).
- A restart-required list counts as pending when its effective picks differ from the process
  start, not only when it turns on or off.
- The app should never let the list hide everything it needs (Sofascore's sports filter keeps the
  full list when every item is hidden); that rule belongs in the app extension.

Example (app extension):

```java
public static List<Country> filterCountries(List<Country> countries) {
    if (!HevalSettings.isEnabled("sofascore.hidden_countries")) {
        for (Country c : countries) HevalSettings.reportOptionsSeen("sofascore.hidden_countries", c.alpha2, c.name);
        return countries;                                         // stock
    }
    Set<String> hidden = HevalSettings.getHidden("sofascore.hidden_countries");
    List<Country> kept = new ArrayList<>(countries.size());
    for (Country c : countries) {
        HevalSettings.reportOptionsSeen("sofascore.hidden_countries", c.alpha2, c.name);
        if (!hidden.contains(c.alpha2)) kept.add(c);
    }
    return kept.isEmpty() ? countries : kept;
}
```

**Screen.** A list row shows the name, the description and a state line ("None hidden", "3
hidden", "3 hidden (paused)", "3 hidden, restart required") with an "Edit" hint; it is spoken as a
button. Tapping it shows the picker in place of the main screen: the name and a "Done" button, the
description, the "N hidden" summary (a polite live region), a note when pause, safe mode or a
dependency keeps the picks from applying, a search field (case- and accent-insensitive, on the
label and the key), "Clear all" (it turns into "Undo clear" until the next change) and an
alphabetical checklist (locale collation). Every tap is saved at once. Each checklist row is one
48 dp+ focus stop, announced as a checkbox with its label and "Hidden" or "Shown". Back or Done
returns to the main screen; the open picker and its search survive rotation and theme changes.
With no options yet it says "Nothing to pick yet. Items appear here after the app has shown them."

**Icons** (2026-11-03, for country flags): when the list has an icon provider, each row draws its
icon in a fixed-width column before the label (a row without one keeps the column empty, so labels
line up; a list without any icons looks as before). Sorting and search use only the label and the
key, and the row is spoken by its label, never the icon. `HevalSettings.optionIcon(listId, key)`
is the picker's lookup: it drops a blank, multi-line or over-32-character answer and a provider
that throws. `OptionIcons` (core) builds the emoji: `countryFlag("DE")` (regional-indicator pair,
only for two letters A-Z), `subdivisionFlag("gbeng")` and the `ENGLAND`, `SCOTLAND`, `WALES`,
globe and trophy constants. Sofascore maps its alpha2 keys (EN, SX = Scotland, WA, NX = United
Kingdom, TU = Tuvalu, SW = Sint Maarten) and region slugs in `extensions/sofascore` `CountryIcons`;
FotMob maps its FIFA codes through a FIFA -> ISO table in `extensions/fotmob` `CountryIcons` (ANT,
Netherlands Antilles, has no flag). Both are checked by `CountryIconsTest`
(`:extensions:<app>:testDebugUnitTest`). A font without a flag shows the two letters instead.

**Images** (2026-11-03): a provider that implements `HevalSettings.OptionImageProvider` also names
an image per option, from the app's own image server (the same picture the app shows), and the
picker uses the emoji as the instant and offline fallback. `HevalSettings.optionImageUrl(listId,
key)` keeps only `https://<host>...` URLs of at most 512 printable-ASCII chars and never throws. A
separate interface, not a default method, so a provider without images needs no change whatever the
extensions' desugaring. `ui.OptionImageLoader` draws a row's text icon at once and loads the image
off the main thread: a pool of 3 background-priority daemon threads that takes the newest request
first (rows on screen before the ones scrolled past), `HttpURLConnection` with a mobile browser
User-Agent, 5 s connect and read timeouts, only a 200 answer that is still https after redirects,
at most 256 KB. `BitmapFactory` decodes it with `inSampleSize` and the result is scaled to fit the
32 dp column (an `ImageView` over the text icon in the same `FrameLayout`, so rows stay aligned).
Cache: an `LruCache` of 4 MB of bitmaps, plus PNGs in `getCacheDir()/heval_icons/<sha1(url)>.png`
(5 MB at most, the oldest written go first; a file older than 30 days is fetched again and kept if
that fails). The image view is tagged with its URL, so a recycled row never gets the image of the
option it showed before. A failure keeps the emoji, silently, and is not retried until the picker
opens again. The image is not focusable or spoken; the row is still read by its label. Sofascore:
`https://img.sofascore.com/api/v1/country/{alpha2}/flag` for every two-letter key (slug keys have
none); its competitions picker uses `https://img.sofascore.com/api/v1/unique-tournament/{id}/image`
over the country's flag (from the category seen with the competition in this process) or a trophy
(`CompetitionIcons`, checked by `CompetitionFilterTest`). FotMob: `https://images.fotmob.com/image_resources/logo/teamlogo/{code lower case}.png` for
every country code, ANT included (INT and INT-2 have none); its competitions picker uses
`https://images.fotmob.com/image_resources/logo/leaguelogo/{id}.png` over the flag of the league's
country (`CountryData`) or a trophy (`CompetitionIcons`, checked by `CompetitionFilterTest`). Both are checked by `CountryIconsTest`,
and `assertOptionIconsWired(..., images = true)` in the smoke tests checks the provider implements
`OptionImageProvider` and `ListPicker` calls `optionImageUrl` and `OptionImageLoader.bind`.

**Diagnostics** list a list feature as `<id>: <state>, list, picked=N, hidden_now=N, options=N`:
counts only, never keys or labels.

## What cannot be toggled at runtime

A runtime switch needs a code path where both the stock and the patched behaviour still exist.
These cannot have one:

- **Manifest edits.** Removed or added permissions, `<meta-data>` (Firebase or analytics
  deactivation), `<queries>`, package renames, removed providers or receivers. The app's own
  components could in principle be enabled or disabled with
  `PackageManager.setComponentEnabledSetting`, which applies after a restart. Removed permissions
  and meta-data cannot.
- **Resource edits.** XML defaults, layouts, strings, drawables.
- **Signature and identity.** "Spoof signature", "GmsCore support" (string rewrites across the
  dex), package names.
- **Structural bytecode changes.** Superclass swaps, deleted classes or methods, a wholesale
  `returnEarly` on methods without a stock path, or rewrites of hundreds of call sites, where
  each gate costs a call.
- **Process-start decisions.** SDK initialisation in `Application.onCreate`, dependency
  injection graphs, caches. Register these with `restartRequired = true`. The screen then shows
  a "Restart" badge and a "Restart now" bar.
- **Native libraries** and anything decided server-side.

Register these with `buildTimeOnly = true` if they should appear on the screen.

## Crash guard and safe mode

The crash guard is based on HushMessenger's `CrashGuard`:

- **Start record.** Every main-process start writes a record, `"<pid> <wall ms>"`.
- **Quick crash.** At the next start, the previous run counts as a quick crash in two cases:
  - On Android 11+: the exit history (`getHistoricalProcessExitReasons`) reports a Java crash,
    a native crash or an ANR within 60 s of the start.
  - On Android 10 and older: our uncaught-exception handler appended ` crashed` within 60 s.
- **Safe mode.** After three quick crashes in a row, safe mode turns on (`_safe_mode`, written
  with `commit()`), and every runtime feature answers stock. The process shows a toast.
- **Reset.** A process that stays alive for 60 s resets the streak.

The screen shows a safe-mode banner with two buttons:

- **Resume** turns safe mode off.
- **Resume paused** turns the global pause on first, so the user can switch features back on one
  at a time.

The limits are stated in the UI, too. Safe mode cannot help when:

- the crash comes from a patch-time change;
- the crash happens before `InitProvider` runs (for example in `attachBaseContext`);
- it is a native crash on Android 10 or older;
- the app was installed with Root Mount: `InitProvider` is not registered there, so the crash
  guard is never armed and no start records are written. A safe mode saved earlier is still
  honoured by the lazily started engine.

## Settings screen

`HevalControlsActivity` is a framework `Activity` with views built in code.

**Main screen, from top to bottom:**

1. **Header**, then an information card: the app version, "patched for", the bundle version,
   the feature counts and the runtime status.
2. **Banners**: safe mode, engine failure, unreadable registry, and pending restarts with a
   "Restart now" button.
3. **Master switch**: "Pause all patches".
4. **Feature rows**, one collapsible section per category (2026-11-09: an icon and a chevron on the
   header; 2026-11-11: the header reads "N of M on", in accent when something is on; when the screen
   has a search field (8+ features) a section starts collapsed unless one of its rows is on; a
   category whose name contains "spoiler" is listed first; core `Sections.java`). An enabled row has
   a 4 dp accent bar at its start and a bold accent "On"; descriptions are 14sp, cut at two lines
   (the spoken description keeps the full text). A search field above the sections (shown from 8
   features on) filters rows by name, description or category. Each row has an icon (the
   feature's `icon` key, else its category's: `ui/Icons.java`, drawn in code, no resources), a
   name, a description, a state line and, for restart-required features, a "Restart" badge. A
   list feature's row opens its picker (see [List settings](#list-settings-pickers)). Switches
   that share a `choice` title in one category (2026-11-09) are one row with a picker dialog
   ("Normal" plus one entry per switch; picking one turns its switch on and the others off): the
   animation-speed pairs of Sofascore, FotMob and Flashscore. The switches, ids and hooks are
   unchanged. In the registry the optional tenth field is the icon key and the eleventh the
   choice title (earlier optional fields are written empty when a later one is present).
5. **Appearance**: a theme cycle (System, Light, Dark, AMOLED black).
6. **Diagnostics**: "Copy diagnostics".
7. **App**: "Restart app", and "Reset all to defaults" with an inline confirmation.

**Row states:** On, Off, Off (paused / safe mode / needs X), Restart required, Unsupported (a
dependency that is not in this APK), Failed, and Applied at patch time.

**Accessibility:**

- Each row is one focus stop, announced as a switch with its state (`setStateDescription` on
  API 30+). A list row is announced as a button with its "N hidden" state; picker rows as
  checkboxes.
- Headings are marked on API 28+.
- Touch targets are at least 48 dp.
- Changes are announced.
- The root ignores touches while it is obscured (tapjacking).

**Layout and system UI:**

- Edge-to-edge insets include the display cutout.
- The light or dark system bar icons follow the palette.
- Back closes the reset confirmation through `OnBackInvokedCallback` on API 33+, with
  `onBackPressed` below that.
- The layout direction follows the locale. The host's `supportsRtl` still decides whether RTL
  applies.

**Diagnostics** contain versions, the device model, flags and feature states (list settings as
counts only). Failures appear as an exception class and frame only. The report has no account data,
app content or identifiers.
The clipboard copy is marked sensitive.

**Profiles, export and import** (2026-11-09). A "Profiles" section above Appearance: "Save current
settings as a profile" (a name of 1 to 40 characters, at most 20 profiles, kept in their own
`heval_profiles` file so "Reset all to defaults" never removes them), one row per saved profile
(Apply or Delete), "Copy settings", "Share settings" and "Import settings from the clipboard"
(with a confirmation that says how many settings it applies). The text is
`hevalcontrols-settings:1` followed by one line per choice (`f TAB id TAB 1|0` for a switch,
`l TAB id TAB key` for each picked key of a list), written by `SettingsTransfer.export` and read by
`SettingsTransfer.parse`; it holds choices only, not the pause, safe mode, theme or the options a
picker has seen. Importing is forgiving: records for features this app does not have, of the wrong
kind or with a bad value are skipped and counted, text without the header is rejected, and a list
missing from the text is imported as empty (the text is a snapshot). A profile or import is applied
in one write (`HevalSettings.applyChoices`). Covered by `SettingsTransferTest`; the screen part has
not run on a device.

**Calm mode** (2026-11-09) is a one-tap row at the top of the Profiles section, shown when the registry has
at least one switch with the `calm` flag (`HevalFeature(calm = true)`, the twelfth registry field, `1`). It
first saves the current choices as the profile "Before Calm mode" (replacing an older one), then turns every
calm switch on in one write; nothing else changes, so turning it off is applying that profile. The flag is set
on: FotMob - Spoiler-free mode and its four surfaces, Hide betting content, Disable rating prompts, Disable
FotMob+ promo popup; Sofascore - Spoiler-free mode and its three surfaces, Hide betting content, Disable
rating prompts, Block marketing notifications and the hide-modal pop-up switches; 365Scores - Spoiler-free
mode and its five surfaces. Not run on a device.

**Extension points** (not built yet): none open at the moment; a launcher shortcut and translations
remain on the list below.

## Registry format

The host patch writes the registry string into `Registry.encoded()` with a `const-string/jumbo`
instruction. It does not use `returnEarly(String)`, because that emits unescaped smali and breaks
on tabs and line feeds.

Version 1 looks like this:

```
hevalcontrols-registry:1
<id> TAB <name> TAB <description> TAB <category> TAB <default 0|1> TAB <restart 0|1> TAB <buildTimeOnly 0|1> TAB <dep,dep>
```

Rules:

- Text fields escape `\`, tab, LF and CR as `\\`, `\t`, `\n` and `\r`.
- The decoder skips malformed or duplicate records, drops invalid dependency ids, ignores
  trailing fields (so appending a field stays version 1), and never throws.
- A different header version gives an empty, unsupported registry. Every hook then answers
  stock, and the screen asks for a repatch.
- An optional ninth field is the kind (2026-11-03): `list` marks a list setting; empty, missing or
  any other value is a switch. The encoder writes it only for lists, so a registry of switches
  encodes byte-for-byte as before and stays version 1. A list record is always default off; one
  with buildTimeOnly `1` is skipped as malformed.

The fixture `extensions/hevalcontrols/core/src/test/resources/registry-v1.txt` pins the format on
both sides (switches only, unchanged since version 1), and `registry-v1-lists.txt` pins a registry
with lists. The Kotlin encoder test and the Java decoder test both read them.

## Testing

| What | Command | What it covers |
|---|---|---|
| Core JVM unit tests | `.\gradlew :extensions:hevalcontrols:core:testDebugUnitTest` | Registry decode and versioning, defaults, toggle and persistence on a fake store, pause, safe mode, fail-open, dependencies, restart-pending, unknown ids, crash-guard counting and resume. `HevalSettingsListTest`: list picks, pause, safe mode, dependencies, reset, seen options (persistence, bounds, background batch) and seeds. |
| Patch-side tests | `.\gradlew :patches:buildAndroid :patches:cleanTest :patches:test --tests "HevalControls*" --no-build-cache` | `HevalControlsTest` covers the encoder against both fixtures, that switch records keep eight fields, feature and list validation, the manifest components, the gate helpers and that the Truecaller host is available on every installer (Root Mount included). `HevalControlsPatcherTest` runs a test-only host, a switch and a list feature through the real patcher on `apks/nativecamera/base.apk` (skipped without it). |
| Lint | `.\gradlew :extensions:hevalcontrols:core:lintRelease :extensions:hevalcontrols:lintRelease` | Checks API levels against minSdk 23. |

CI (`release.yml`) runs no tests. Consider adding the core unit-test task there.

## Known limits and next steps

- **Other processes.** A secondary process starts the engine lazily and reads the choices once.
  The change listener does not reach across processes, so a change applies there after a
  restart. The crash guard runs in the main process only.
- **Root Mount** keeps the stock manifest, so `InitProvider` and `HevalControlsActivity` are not
  registered (the patch still adds them; mount ignores them). The patched dex runs, so the
  features work: the first hook starts the engine lazily through
  `ActivityThread.currentApplication()`, answering the registered defaults until the Application
  exists and the saved choices after that. What is lost: the settings screen (the entry row is
  not shown, so every feature stays at its default), the crash guard and the safe-mode toast.
  Because the feature patches depend on the host, the host stays available on Root Mount;
  making it unavailable would remove every converted patch there.
- **Restart-required features are informational.** `isEnabled` returns the current choice. The
  screen counts differences from the process start.
- **Hook failures** are kept in memory only, for the current process.
- **Not built yet:** a launcher shortcut (LinkedIn replaces its own dynamic shortcuts, so one
  added by us would be removed), search, import and export, profiles and translations.
- **RTL:** in an RTL layout, LTR values such as "4.1.1261 (216900)" in the information card are
  reordered by bidi ("(216900) 4.1.1261"); they should be forced LTR.

## Credits

The engine rules, init provider, crash guard, view helpers, settings screen structure and patch
gate shape are based on [SysAdminDoc/HushMessenger](https://github.com/SysAdminDoc/HushMessenger)
(GPL-3.0) at `5ae3ddf`. They were modified on 2026-10-14. Each ported or adapted file carries a
header that says what was taken and what changed, and the repository `NOTICE` has the entry.
