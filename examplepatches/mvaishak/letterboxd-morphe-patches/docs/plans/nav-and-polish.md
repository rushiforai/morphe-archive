# Nav & polish batch

Six workstreams from the brainstorm. Base APK: Letterboxd 3.5.4-496, decoded to
`scratchpad/lb/decoded`. All findings below are from that decode.

Status: **implemented** (#1–#5), verified at the smali level, pending on-device test.
#6 paused by the user. Commits `40e94f1`, `8425584`, `70f8bc0`, `af13174` on `dev`.

## On-device test checklist

1. **Hide ads** — free account: no AdMob banner on a film page or elsewhere.
2. **Runtime as 1h 47m** — film page shows e.g. "1h 47m"; toggle off in Mods → back to "107 mins".
3. **Bottom navigation → Shown items** — uncheck Log + Activity, check Watchlist → bar becomes
   Films · Search · Watchlist · Profile; tapping Watchlist opens your watchlist (via Profile tab).
   Re-check everything → blocked at 5 with a toast.
4. **Launch tab** — set to Watchlist, cold-start → opens on the watchlist; then hide Watchlist →
   cold-start falls to the first remaining tab.
5. **Home tabs** — hide Reviews/Lists/Journal, move Films to top → home shows only Films and
   opens on it; reorder so Reviews is first → home opens on Reviews.
6. Regression: default (no Mods changes) → bar and home tabs behave exactly as stock.

---

## 1. Hide ads & Pro upsells  (patch: `HideAdsPatch`, default ON)

Reimplementation of the De-Vanced "Hide ads" patch — not a copy. Their version
adds an entry instruction to `setShowAds` and calls a `returnEarly` util per
fingerprint with a `when(returnType)` ladder. Ours:

- One `Fingerprints.kt` with the four AdMob targets, matched by `method.name` +
  class suffix (same signal, our own objects).
- One private `MutableMethod.neutralize()` extension in the patch that inspects
  `returnType` once (`V` / `Z` / object) and no-ops or returns a falsy value —
  replaces their free `blockShowAds(name, method)` + `PatchException` ladder with
  a single reusable helper, and drops the "unsupported return type" throw in
  favour of a compile-time `when` that is exhaustive for the types we target.
- `AdmobHelper.setShowAds(Z)` → overwrite the incoming param with `0` at index 0.
- `AdmobHelper.shouldShowAds()` , `FilmFragment.showAds()` ,
  `AMemberExtensionKt.showAds()` → `neutralize()`.

Confirmed present in decode:
`Lcom/letterboxd/letterboxd/helpers/AdmobHelper;->{setShowAds,shouldShowAds}`,
`.../film/FilmFragment;->showAds`, `.../util/AMemberExtensionKt;->showAds`.

Resource side (same patch, `resourcePatch`):
- `MemberStatsSummariesAdapter` renders `R.string.stats_upgrade_prompt`
  ("Upgrade for full stats and more") — hide that row. Verify exact view id
  during impl.
- Scan `PopularFragment` feed for a Pro upsell card; hide if found.
- Leave `fragment_upgrade_direct.xml` (the actual Upgrade screen) untouched.

Files: `patches/.../letterboxd/ads/HideAdsPatch.kt`,
`patches/.../letterboxd/ads/Fingerprints.kt`, `patches-list` regenerated.
Proof: `./gradlew buildAndroid`; patch the APK with only this patch enabled;
`grep` the patched smali to confirm `shouldShowAds` returns `0x0`.

---

## 2. Runtime as "1h 47m"  (fold into `ModSettingsPatch`, toggle default ON)

Hook: `FilmHeaderFragment.configureRuntime(Ljava/lang/Integer;Lcom/letterboxd/letterboxd/databinding/FragmentFilmHeaderBinding;)V`
(smali line ~1270). Today it does
`getString(R.string.film_runtime_suffix /* "%1$d mins" */, minutes)` then
`StringTransformationsKt.ensureBidiCorrectness(...)`.

Bytecode edit: replace the `getString(...)` result with
`RuntimeFormat.format(Ljava/lang/Integer;)Ljava/lang/String;` (new extension
class). Helper: if the Mod-settings toggle is off, reproduce `"<n> mins"`;
if on, `h = n/60`, `m = n%60` → `"1h 47m"` / `"47m"` / `"2h"`. Feeds into the
existing `ensureBidiCorrectness` call unchanged.

Fingerprint: new `FilmHeaderConfigureRuntimeFingerprint` (name + class suffix).
Settings: `KEY_RUNTIME_HHMM` in `Prefs`, a row in `ModSettingsView` Ratings/Film
section, no dialog (plain switch).
Files: `extensions/.../RuntimeFormat.java`, `Prefs.java`, `ModSettingsView.java`,
`ModSettingsPatch.kt`, `Fingerprints` for that patch.
Proof: build; patched smali shows the `RuntimeFormat` invoke in
`configureRuntime`; on-device the film page reads "1h 47m".

---

## 3 + 4 merged: Bottom nav (pick items) + launch tab

Coupled — launch-tab resolution depends on which items are visible.

### `NavItems` model (shared extension class)

Canonical items, fixed order, menu ids:
`popular(nav_popular) · search(nav_search) · log(nav_log) · activity(nav_activity)
 · watchlist(morphe_nav_watchlist, NEW) · profile(nav_profile)`

- **`profile` forced on**, cannot be unchecked. Everything else toggleable.
- `KEY_NAV_ITEMS` = CSV of enabled keys in canonical order. Default
  `popular,search,log,activity,profile` (today's behaviour; watchlist off).
- **Cap 5 visible** incl. Profile; the dialog blocks a 6th check.
- Reordering NOT in v1 — canonical order only.

### Menu construction — `NavItems.applyMenu(BottomNavigationView)`

`MainActivity.setup` re-inflates `bottom_nav_menu.xml` every call, so this
re-applies itself. Per canonical item: `menu.findItem(id).setVisible(enabled)`
(visibility, not `removeItem` — keeps the `fromMenuId` chain and indices intact;
BottomNavigationView honours it). For `watchlist` when enabled and absent:
`menu.add(0, morphe_nav_watchlist, <order>, R.string.watchlist)` + bundled vector
icon, before Profile.
Hook: after `inflateMenu` in `setup(BottomNavigationView, MainActivity$Tab)V`
(new `MainActivitySetupFingerprint`).

### Watchlist routing — `setup$lambda$0` → `WatchlistNav` (final)

`Route.MemberWatchlist` lives **inside the Member (Profile) tab's nav graph** — it
is not a peer of the five tab destinations, and `MainActivity.getNavController()`
from another tab returns a nested controller that can't resolve it. Navigating to
it cross-graph wedged the back stack (leaving took a system back + ~8s).

Final flow (`WatchlistNav`, all reflection):
- **open**: `bar.setSelectedItemId(nav_profile)` — a normal fast tab switch that
  brings the Member tab's controller forward — then on `bar.post` navigate
  `Route$MemberWatchlist` within it; set `WatchlistNav.showing = true`.
- `onMenuSelected` returns `true` for the synthetic id → the Watchlist item shows
  selected.
- **any other bottom-nav tap while `showing`**: `onMenuSelected` calls
  `WatchlistNav.dismiss` (one `popBackStack` to peel the watchlist off the Profile
  tab), clears the flag, returns `false` → the app's own tab switch then runs from
  a clean root, single tap.
- Watchlist tap while already `showing` → no-op.

Icon: a hand-drawn `ClockIcon` (`Drawable`) in `NavItems`, `getConstantState()`
null so the bar uses the instance directly; stateful, grey `#AABBCC` at rest and
a live read of `@color/blue40BCF4` when `state_checked` — a tinted VectorDrawable
lost its tint to the bar's null `itemIconTint`.

Rejected: full-screen overlay hosting `WatchlistFilmsFragment` (covered the bar,
no filters); re-firing `letterboxd://shortcut/watchlist` (async two-step, bar/
content out of sync); navigating the route directly (cross-graph back-stack
wedge); keeping the Watchlist item highlighted while the app sat on the Profile
tab (broke the Profile tab tap).

### Launch tab — `LaunchTab.menuId(int lastUsedId)` in `setup`

Single-instruction swap: right before `setSelectedItemId(v)`, replace `v` with
`LaunchTab.menuId(v)`:
- `KEY_LAUNCH_TAB = last` (default) → return `lastUsedId` unchanged.
- else if the chosen key is currently visible → its menu id.
- else → **first id in `NavItems.visibleIds()`** ("next option in the list").
- unusable result → return `lastUsedId` (fail open).

### Settings — Mod settings, new "Bottom navigation" group

- `NavItemsDialog` — checkboxes Films / Search / Log button / Activity /
  Watchlist; Profile checked+disabled; blocks a 6th.
- `LaunchTabDialog` — "Last used" + one row per currently-enabled item.

Files: `extensions/.../settings/{NavItems,NavItemsDialog,LaunchTab,LaunchTabDialog,
WatchlistOverlay}.java`, `Prefs.java` (`KEY_NAV_ITEMS`, `KEY_LAUNCH_TAB`),
`ModSettingsView.java`; `ModSettingsPatch.kt` + fingerprints
`MainActivitySetupFingerprint`, `MainActivitySetupLambda0Fingerprint`; resource
patch adds `morphe_nav_watchlist` id + a watchlist vector. `@string/watchlist`
(0x7f130631) / `@string/action_watchlist` already exist.
Proof: build; patch; enable Search+Watchlist+Profile only, launch tab =
Watchlist → cold start opens the watchlist, bar shows 3 items; disable Watchlist
→ launch falls to Search.

---

## Nav architecture (decoded — applies to #4 and #5)

- `bottom_nav_menu.xml` items: `nav_popular, nav_search, nav_log, nav_activity,
  nav_profile`.
- `MainActivity.setup(nav, startTab)` inflates the menu fresh every call, resolves
  the start `MainActivity$Tab` (persisted, else `POPULAR`), `setSelectedItemId`,
  installs `setup$lambda$0` as the item-selected listener.
- `setup$lambda$0(activity, nav, item)`:
  - `item.itemId == nav_log` → `openAddLogEntry$app()`, return false (special-cased
    early — the model for how we intercept a slot).
  - else `MainActivity$Tab.Companion.fromMenuId(id)`; **null → logs "Unknown menu
    item" and does nothing.** So a brand-new menu id is inert unless the enum
    knows it.
  - maps id → a `RootNavHostFragment$Tab$*` route object
    (`Popular / Browse / Activities / Member / Welcome`, all Kotlin `object`s used
    as type-safe nav routes) → `navController.navigate(route, lambda)`.
- The current user's watchlist today lives as a **section inside `MeFragment`**
  (the Profile tab) — `MeFragment$SectionsPagerAdapter` hosts
  `WatchlistFilmsFragment`. Also `MemberWatchlistFragment` exists. No standalone
  watchlist Activity host.

## 4. Custom bottom nav  (fold into `ModSettingsPatch`)

Target end state (user's ask): **Films · Search · Watchlist · Profile**.

- **Hide the Log (+) button** — runtime: after `inflateMenu` in `setup`, call
  `BottomNav.apply(Menu)` → `menu.removeItem(nav_log)` when the toggle is on. The
  `nav_log` branch in `setup$lambda$0` just goes dead. Toggle `KEY_NAV_HIDE_LOG`.
- **Watchlist in place of Activity** — the user doesn't use Activity, so
  repurpose that slot rather than doing enum/graph surgery for a 6th tab:
  - `resourcePatch` on `bottom_nav_menu.xml`: `nav_activity` → `android:icon`
    = a watchlist glyph (bundle a vector), `android:title` = `@string/watchlist`.
  - bytecode in `setup$lambda$0`: intercept `item.itemId == nav_activity` early
    (same shape as the `nav_log` special-case) and route to the current member's
    watchlist instead of `Activities.INSTANCE`. Mechanism to confirm at impl time,
    in order of preference: (a) `navController.navigate(Member.INSTANCE)` if the
    Member route accepts a "start tab = watchlist" arg; (b) navigate to Member then
    post a select of the watchlist pager tab in `MeFragment`; (c) fall back to
    firing whatever intent `MemberWatchlistFragment` is normally shown with.
  - gated by `KEY_NAV_WATCHLIST_SLOT` (default on when this patch is enabled).
- **Reordering / fully custom icons**: not in scope. Runtime reorder of a
  `BottomNavigationView` menu means clear + re-add and loses selection state; if
  wanted later, bake order into `bottom_nav_menu.xml` at patch time via a
  `stringOption`.

Files: `extensions/.../settings/BottomNav.java`, `Prefs.java`,
`ModSettingsView.java`, `ModSettingsPatch.kt`, a watchlist vector drawable +
`bottom_nav_menu.xml` edit in the resource patch, new fingerprint for
`setup$lambda$0`.
Proof: build; patch; on-device the bottom bar reads Films / Search / Watchlist /
Profile and the Watchlist slot opens the watchlist.

## 5. Home tab strip — hide / reorder / default  (fold into `ModSettingsPatch`)

Home tabs **Films / Reviews / Lists / Journal** come from
`PopularFragment$SectionsPagerAdapter` (+ its `$WhenMappings` position→section
map), wired by a `TabLayoutMediator` with a `TabConfigurationStrategy` title
lambda (`PopularFragment` smali ~263-278); `setCurrentItem(I)` at ~483.

Approach: bytecode-patch `PopularFragment$SectionsPagerAdapter` so its section
list is filtered/reordered from a Prefs-backed order (`HomeTabs.order()` helper
returning the visible section enum ordinals), and patch the `setCurrentItem` call
so Home opens on the user's chosen default section. `getItemCount`,
`createFragment`, `WhenMappings` and the title strategy all read from the same
filtered list to stay consistent.

Settings: `KEY_HOME_TABS` (ordered CSV of `films,reviews,lists,journal`),
`KEY_HOME_DEFAULT_TAB`. A `HomeTabsDialog` (reorder + show/hide) in
`ModSettingsView` Home section.
Risk: medium — adapter item count, tab count, and `WhenMappings` must move
together or the pager desyncs. Isolate all of it behind `HomeTabs`.
Files: `extensions/.../settings/HomeTabs.java`, `HomeTabsDialog.java`,
`Prefs.java`, `ModSettingsView.java`, `ModSettingsPatch.kt`, new fingerprints for
the adapter + the `setCurrentItem` site.
Proof: build; patch; hide Reviews+Lists+Journal, default Films → Home shows only
the Films tab and opens on it.

---

## 6. "Your year so far" card  — PAUSED by user (2026-09-07). Research kept for later.

**Data availability:**
- Home already fetches `MemberStatistics` — `PopularViewModelKt.fetchMemberStatistics`
  (used today to gate the Year-in-Review banner). No new network call needed.
- `MemberStatistics.counts` (`MemberStatisticsCounts`) is parsed and in memory with:
  `filmsInDiaryThisYear`, `filmsInDiaryLastYear`, `diaryEntriesThisYear`,
  `diaryEntriesLastYear`, `watches`, `watchlist`, `ratings` (count), `reviews`,
  `followers`, `following`.
- Also on `MemberStatistics`: `ratingsHistogram` (all-time, 10 buckets),
  `summaryYears` (List — per-year summaries; element model not yet decoded),
  `yearsInReview`.

**Verdict per metric:**
- **Films watched this year + vs last year** → free, already in memory.
- **Hours watched this year** → NOT in the payload. No runtime sum anywhere; would
  need a paginated diary walk with per-film runtimes (exactly what Pro gates).
- **Avg rating this year** → NOT directly available. Only an all-time histogram
  (all-time average is derivable; this-year is not).
- `summaryYears` element model is worth decoding — if it carries per-year runtime
  or rating totals, hours + avg become free too.

**Rendering:** `PopularFragment` is View-based (`FragmentPopularBinding`,
ConstraintLayout + AppBarLayout + TabLayout + ViewPager2). A native card is
feasible (inject above the TabLayout, or as a header inside the Films page's
list) using the extension's `OnGlobalLayoutListener` pattern. The existing
`YearInReviewBanner` is Compose but that's Letterboxd's; ours stays native.

**Recommendation:** ship a "Films this year: N (▲/▼ vs last year)" card with zero
new API calls. Decode `summaryYears` first; only if it lacks the fields, decide
whether hours/avg are worth an extra diary fetch (they probably aren't).
