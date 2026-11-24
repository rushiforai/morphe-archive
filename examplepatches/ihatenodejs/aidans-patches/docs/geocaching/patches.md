# Geocaching Patch Specifications

## Patch Catalog

| Patch Name                                   | Category        | Default | Description                                                                                                                                                                                                                                                                  |
| -------------------------------------------- | --------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Remove Tracking and Analytics**            | `Privacy`       | `true`  | Neutralizes first-party analytics (AnalyticsRepo), Google Analytics / Firebase (Analytics, Crashlytics, Performance, In-App Messaging), Facebook App Events, Iterable marketing telemetry, Usercentrics consent collection, and zeros the Google Play Advertising ID (AAID). |
| **Remove Lists**                             | `Interface`     | `true`  | Removes the Lists option from the bottom navigation bar.                                                                                                                                                                                                                     |
| **Unlock Cache Filter and Sorting Tools**    | `Features`      | `true`  | Unlocks advanced cache search filters and sorting options without prompting for Geocaching Premium.                                                                                                                                                                          |
| **OpenStreetMap Drop-in Replacement**        | `Customization` | `true`  | Replaces proprietary Google Maps tiles with free, community-driven OpenStreetMap tiles without losing geocache pins, clusters, popups, or gestures.                                                                                                                          |
| **Local Premium**                            | `Interface`     | `true`  | Enables local Premium membership status across profile and account screens, removes upgrade promotions, banners, and icons, and enriches public cache details (description, hints, owner) when server blocks basic accounts.                                                 |
| **Unlock Templates**                         | `Features`      | `true`  | Unlocks geocache log templates, allowing creating, editing, and applying custom log templates without Geocaching Premium.                                                                                                                                                    |
| **Unlock Experimental Features**             | `Features`      | `false` | Unlocks beta and experimental features in Settings without Geocaching Premium.                                                                                                                                                                                               |
| **Remove Shop**                              | `Interface`     | `true`  | Removes the Shop Geocaching promotional section and link from the Profile screen.                                                                                                                                                                                            |
| **Enable Developer Tools and Feature Flags** | `Developer`     | `false` | Exposes the internal Debug Menu in Settings and provides selectors for LaunchDarkly feature flags, Remote Config controls, and remaining membership gates.                                                                                                                   |

---

## 1. Remove Tracking and Analytics

### Overview

Neutralizes all tracking, attribution, and analytics engines embedded within the application without breaking account authentication, network API sync, or offline cache bundling.

### Configuration Options

- `stripCrashlytics` (default: `true`): Neutralizes Firebase Crashlytics logging, custom keys, user IDs, and exception reporting.
- `stripFacebook` (default: `true`): Neutralizes the remaining Facebook App Events dispatch and settings downloads (10.24.0 no longer exposes `AppEventsLogger` to app code).
- `stripIterable` (default: `true`): Neutralizes Iterable marketing event tracking and device registration.
- `stripUsercentrics` (default: `true`): Neutralizes Usercentrics consent telemetry events while preserving the readiness lifecycle necessary for user login.

### Bytecode Modifications

1. **Google Play Advertising ID (AAID)**:
   - Target: `com.google.android.gms.ads.identifier.AdvertisingIdClient.getAdvertisingIdInfo(Context)`
   - Rewritten to construct and return `AdvertisingIdClient$Info("00000000-0000-0000-0000-000000000000", true)` with ad tracking permanently limited.
2. **First-Party Analytics & Web Bridges**:
   - `AnalyticsRepo`: Stubs every event dispatcher (`a`, `b`, `e`, `f`, `g`, `h`, `i`, `j`, `k`, `l`, `m`) as a required match.
   - `AnalyticsRepo$a`: Neutralizes static companion tracking bridge `a`.
   - `AnalyticsWebInterface`: Neutralizes Javascript interface `logEvent` called from embedded web views.
3. **Firebase SDKs**:
   - `FirebaseAnalytics`: Stubs `logEvent`, `setAnalyticsCollectionEnabled`, `setUserProperty`, `setDefaultEventParameters`, `setSessionTimeoutDuration`, and `setUserId`, and returns `null` from `getAppInstanceId`. This is the effective choke point: ~30 app classes call `logEvent` directly (65 call sites) instead of going through `AnalyticsRepo`.
   - `FirebasePerformance`: Stubs `setPerformanceCollectionEnabled`.
   - `FirebaseInAppMessaging`: Stubs `setAutomaticDataCollectionEnabled` and `setMessagesSuppressed`.
   - `FirebaseCrashlytics`: Stubs `log`, `recordException`, `setUserId`, `setCustomKey`, and `setCrashlyticsCollectionEnabled`.
4. **Facebook SDK**:
   - Stubs the event dispatch and flush funnels `com.facebook.appevents.b.e`/`b.d` and `FetchedAppSettingsManager.loadAppSettingsAsync`.
5. **Iterable API**:
   - Stubs `IterableApi` (`Lcom/iterable/iterableapi/d;`): `p` (`events/track`, required), `r`/`q`/`s`/`t`/`u`/`h` (in-app and push-open events), and `m`/`n`/`b`/`o`/`l` (profile and device registration updates).
6. **Usercentrics CMP**:
   - Neutralizes telemetry event dispatcher `com.groundspeak.geocaching.intro.permissions.usercentrics.a.j(UsercentricsAnalyticsEventType)` while leaving core initialization intact to prevent login coroutine deadlock.

---

## 2. Remove Lists

### Overview

Removes the Lists option from the bottom navigation bar (`res/menu/bottom_nav_menu.xml`). Since custom lists require server-authoritative synchronization that is locked to Geocaching Premium accounts, this patch eliminates the non-functional tab, leaving four evenly-spaced navigation options (Map, Profile, Messages, and Hides).

### Resource Modifications

1. **Bottom Navigation Menu**:
   - Target: `res/menu/bottom_nav_menu.xml`
   - Removes `<item android:id="@+id/list_nav_graph" ... />` from the menu definition so `BottomNavigationView` only inflates the four working primary surfaces.

---

## 3. Unlock Cache Filter and Sorting Tools

### Overview

Unlocks all advanced cache search filters and sorting options, allowing users to filter by cache type, size, difficulty, terrain, attributes, and minimum favorite points, and sort caches by distance, name, favorite points, rating, and event date without prompting for Geocaching Premium.

### Bytecode Modifications

1. **Map Top-Right Filter Button**:
   - Targets: `com.groundspeak.geocaching.intro.mainmap.map.e.c(MenuItem)` (Google Maps) and `com.groundspeak.geocaching.intro.mainmap.map.k.c(MenuItem)` (MapLibre)
   - When `menu_item_filter` is selected, intercepts the `Ldic;->e()Z` result by setting it to `0x1` (`true`), bypassing the upsell branch and directly launching coroutines navigating to `toFiltersNavGraph`.
2. **Filter Screen ViewModel Criteria**:
   - Target: `com.groundspeak.geocaching.intro.geocachefilter.FilterViewModel.e(ZLpo3;)Ljava/util/ArrayList;`
   - Intercepts all 12 `Ldic;->e()Z` gate checks by forcing each result register to `0x1` (`true`), unlocking:
     - All cache types (Traditional, Multi-Cache, Mystery, EarthCache, Event, etc.)
     - All container sizes (Micro, Small, Regular, Large, Other)
     - Difficulty rating sliders (1.0 - 5.0)
     - Terrain rating sliders (1.0 - 5.0)
     - Cache attributes (Dog friendly, Kid friendly, Available in winter, etc.)
     - Minimum favorite points threshold
     - Found / Not found status
     - Owned / Not owned status
     - Placed date filters
   - Target: `FilterViewModel$populatePrefs$1.invokeSuspend(Object)`
     - Intercepts the `Ldic;->e()Z` check to execute the full filter population flow without stripping premium criteria.
3. **Filter Screen Dialog Clicks**:
   - Target: `ap3.onClick(DialogInterface, I)`
   - Injects `dialogInterface.dismiss(); return-void;` at index 0 to eliminate upsell prompts from dialog actions.
4. **List View Sorting**:
   - Target: `lg4.invoke()Ljava/lang/Object;`
   - Intercepts the `Ldic;->e()Z` check by forcing the register to `0x1` (`true`), bypassing the upsell launch and displaying `SortByDialogFragment` (`"sortByDialog"`).
5. **GeoTour Sorting**:
   - Target: `dk4.p()Lkec;`
   - Intercepts the `Ldic;->e()Z` check by forcing the register to `0x1` (`true`), bypassing upsell and displaying `geotourSortDialog`.
6. **Filter Preferences & Criteria Parser**:
   - Targets: `to3.h()Lso3;` (`FilterPreferences.h`), `to3.b()` (`FilterPreferences.b`)
   - Forces `Ldic;->e()Z` check results to `0x1` (`true`), ensuring user-saved filter criteria (cache types, sizes, difficulty, terrain, attributes, min favorites, etc.) are actually loaded into the `Lso3;` preference object and evaluated across map search and list views instead of defaulting to empty filter sets.
   - In `to3.h()`, replaces the hardcoded `Boolean.TRUE` for `includeOwnedDisabledCaches` with `null` (`const/4 v15, 0x0`), and sanitizes inactive toggle filters to `null`, preventing the Geocaching server from rejecting basic account map search requests with HTTP 403 Forbidden.
7. **Cache Type Query Parameter**:
   - Target: `wk0.invoke` (search query-parameter builder)
   - Drops the `cacheTypes` list when all types are selected so the `cacheTypes` query parameter is omitted from `/mobile/v2/map/search`, avoiding HTTP 403 responses for basic accounts. Filtering then happens client-side.
8. **Client-Side Map Item Filtering & Lifecycle Synchronization**:
   - Target: `com.groundspeak.geocaching.intro.map.rendering.a.e(List, Ldic, CoordinateDisplayMode)`
     - Injects `GeocacheFilterBridge.filterMapItems(List)` at instruction 0 using `invoke-static/range`, filtering all map items (`Luq8`, `Ltq8`) against active filter criteria (types, sizes, difficulty, terrain, minimum favorites, hide finds, hide owned) before generating pins for MapLibre, Google Maps, and list views.
   - Targets: `SharedMapViewModel$trySearching$1`, `SharedMapViewModel$trySearching$2`, and `SharedMapViewModel$reloadPins$1`
     - Injects `GeocacheFilterBridge.updateAndFilterMapItems` on database and network search item emissions, replacing the master in-memory list with the latest non-empty emission and publishing its filtered subset to `SharedMapViewModel.s0`.
     - Injects `GeocacheFilterBridge.reapplyFilters` into `reloadPins$1` to re-filter that latest retained list (falling back to `currentList` only when the master list is empty) when filter criteria change.
   - Target: `MapLibreFragment.onResume()`
     - Injects `SharedMapViewModel.v()` (`reloadPins`) on fragment resume so returning from `FilterNavHostActivity` immediately triggers pin reloading and updates the map.
   - Target: `SharedMapViewModel$refreshFilteredState$1`
     - Triggers `SharedMapViewModel.v()` whenever filter state is refreshed.

---

## 4. OpenStreetMap Drop-in Replacement

### Overview

Replaces Google Maps with OpenStreetMap (MapLibre vector engine) across the main map and navigation screens. Completely eliminates the Google watermark logo and broken unauthenticated Google Maps canvases on re-signed builds, routing all map exploration, pins, clustering, cache preview sheets, bottom navigation trays, filters, search, and route navigation through the native MapLibre engine.

### In-App Map Style Controls

The map settings menu (`MapTypeSelectionFragment` and bottom sheet) is rewired from the defunct Google Map types ("Street", "Satellite", "Terrain", "Hybrid") into dynamic OpenStreetMap style options:

- **Bright** (`https://tiles.openfreemap.org/styles/bright`): Colorful OpenMapTiles vector basemap.
- **Liberty** (`https://tiles.openfreemap.org/styles/liberty`): Clean, detailed OpenStreetMap style.
- **Positron** (`https://tiles.openfreemap.org/styles/positron`): Minimal, light basemap with muted tones.
- **Dark** (`https://tiles.openfreemap.org/styles/dark`): Contrast dark mode vector tiles.
- **Custom URL**: Prompts for any custom MapLibre vector style JSON endpoint and saves it locally.

### Preview Thumbnails

The legacy Google Map type thumbnail preview images (`map_preview_*.webp`) are replaced with rendered OpenStreetMap raster previews of a high-density location (Times Square / Midtown Manhattan, NYC) to accurately demonstrate each style's visual presentation.

### Architectural Layers & Patches

The OpenStreetMap integration is packaged as a unified `compositeFeaturePatch`:

1. **Bytecode Layer** (`bytecode`): Core Dalvik bytecode modifications routing all map deciders, view models, style requests, and settings interactions to MapLibre and `OsmStyleBridge`.
2. **Resource Layer** (`resources`):
   - **Strings**: Updates `res/values/strings.xml` to rename Map types to "Map styles" and replace legacy Google Map labels and descriptions with OpenStreetMap presets ("Bright", "Liberty", "Positron", "Dark", "Custom URL").
   - **Preview Assets**: Replaces legacy Google Map preview thumbnails in `res/drawable-xxhdpi/` with 240x240 rendered raster previews of Times Square / Midtown Manhattan, NYC for each style.

### Bytecode Modifications

1. **Main Map Decider Fragment**:
   - Target: `com.groundspeak.geocaching.intro.mainmap.map.MapDeciderFragment.onResume()`
   - Intercepts `List.contains()` result to unconditionally force `0x1` (`true`), permanently routing navigation to `toMapLibreMapFragment` (`0x7f0a0579`).

2. **Navigation View Model**:
   - Target: `com.groundspeak.geocaching.intro.navigationmap.NavigationViewModel.h()Z`
   - Injected with `const/4 v0, 0x1; return v0;`, ensuring `NavigationMapActivity` displays the MapLibre engine instead of Google Maps.

3. **Dynamic Style URL Resolution**:
   - Targets: every class that embeds the hardcoded `https://maptiles.geocaching.com/vector/style.json` literal (`aa7`, `com.groundspeak.geocaching.intro.mainmap.map.n`, `NavigationViewModel`, the hide-cache map sliver, `qa7`, `rz1`).
   - Replaces hardcoded style references with `invoke-static OsmStyleBridge.getActiveStyleUrl()`, loading user-selected or custom style endpoints on demand.

4. **Map Style Selection Interception (Screen & Experimental Bottom Sheet)**:
   - Targets: `MapTypeSelectionFragment.A(Lmap/type/a;)V` (full-screen dialog, click item `ga7`, style id `MapType->A:B`) and `t77.invoke(Object)` (`MapLibreFragment` Compose bottom sheet, premium gate `f56.C(MapType)`).
   - Forwards `(fragment, mapTypeId)` to `OsmStyleBridge.onStyleSelected(fragment, mapTypeId)`.
   - Bypasses the Premium upsell gate and the Google Maps fallback navigation (`0x7f0a0567`), stores the selected style in SharedPreferences (`UserMapPrefs.OSM_STYLE_URL` and `UserMapPrefs.PREFERRED_MAP_TYPE`), prompts for a custom URL when "Custom URL" is chosen, dismisses `MapTypeSelectionFragment` where `dismiss()` exists, and prompts to restart the app.

5. **Neutralize Google Maps Fallback Listener**:
   - Target: `r77.invoke(Object, Object)`
   - Forces the `List.contains()` result register to `0x1` (`true`), preventing the fragment result listener from navigating back to Google Maps (`0x7f0a0567`) when non-Trails styles are selected.

6. **FTUE Onboarding Neutralization & Redirection Bypass**:
   - Targets: `m64.d(Ldic, Z)Z` and `m64.e(Ldic)Z` (`FtueSuggestionFlowState`, keyed by the `FtueSuggestionFlowState.NAMESPACE` literal).
   - Injected with `const/4 v0, 0x0; return v0;`, neutralizing first-time user suggestion flow checks.
   - Target: `com.groundspeak.geocaching.intro.onboarding.OnboardingMapActivity.onCreate(Bundle)`
   - Neutralizes `onDestroy` and injects an immediate redirect to `MainActivity` with `MainActivity.SKIP_INITIAL_SUGGESTION_FLOW=true`.
   - Target: `MainActivity.G(MainActivityVM$b, MainActivity$NavDestination)V`
   - Overrides `$c` (`OnboardingMapActivity`) and `b` (`PagingEducationActivity`) suggestion flow states with `$a` (`MainActivityVM$b$a`), guaranteeing `MainActivity` never bounces to `OnboardingMapActivity`.

7. **Map Resume Redirects**:
   - Targets: `MapLibreFragment.onResume()` and `GoogleMapFragment.onResume()`.
   - Forces the `sharedprefs.a.f()` preferred-map-type result so MapLibre always stays selected and Google Maps never regains control.

8. **Details Overview Map**:
   - Target: `va7.d` (`Cache Details` overview map sliver)
   - Forces the MapLibre branch unconditionally so the cache-details overview renders with MapLibre instead of Google Maps.

### Notes

- 10.24.0 removed the `BETTER_EVENTS_MAP` LaunchDarkly flag; the "Event dates" toggle is now unconditional, so the previous flag-force step was dropped instead of being remapped.
- The experimental Compose bottom sheet has no reflective dismissal channel anymore (`SharedMapViewModel.k0` is now a `CameraPosition`); selecting a style still applies and stores it, and the sheet closes when the user dismisses it.

---

## 5. Local Premium

Enables local Premium membership status across the application and removes upgrade promotions, canisters, and locked premium banners across primary exploration and configuration surfaces:

1. Enables local Premium membership status in Account and Profile views, setting profile header membership to "Premium member" and account screen to "Membership type: Premium".
2. Eliminates the floating map upgrade canister and pill button from the top-left corner of the map.
3. Removes the promotional upgrade card ("Artwork Geocaching Premium", "Access it all", "Go Premium") and the server-dependent Statistics item from the Profile screen.
4. Removes the "Upgrade to Premium" menu row from the Settings screen.
5. Removes the "Upgrade to Premium" button and spacer row from the Account screen while preserving "Disable or delete account".
6. Enriches cache details (description, hints, placed-by owner name) for public regular and advanced caches by scraping public listing details when the server rejects basic account API requests with HTTP 403 Forbidden.
7. Shows a one-shot notice when opening a Premium Member Only cache to explain that full cache details (complete description, hints, activity logs) are restricted by the server.

### Options

- `showLocalPremiumWarnings` (Boolean, default `true`): Shows a one-shot notice per cache when opening a Premium Member Only cache whose full data is restricted by the server.

### Bytecode Modifications

1. **Premium Membership Predicate**:
   - Target: `Ldic;->e()Z`, the user-session premium predicate (`3 == f || 2 == f`).
2. **Map Top-Left Upgrade Canister**:
   - Targets: `com.groundspeak.geocaching.intro.mainmap.map.SharedMapViewModel.<init>` and `H(MapMode)`
     - Intercepts `Ldic;->e()Z` checks by forcing move-result registers to `0x1` (`true`), ensuring the upgrade-visible state is initialized and maintained as `false`.
   - Target: `com.groundspeak.geocaching.intro.mainmap.map.i.b(sy7, w74, go1, I)`
     - Forces the `Boolean.booleanValue()Z` result register to `0x0` (`false`), so the Composable emits no upgrade container.
3. **Profile Header, Statistics & Bottom Promotional Card**:
   - Target: `com.groundspeak.geocaching.intro.profile.o.a(OwnProfileResponse)`
     - Replaces the `OwnProfileResponse.Profile.k()` membership-title result (via `Llw5;->l(II)I` with `0x7f140717`) with `"Premium member"` before it populates the Profile header.
   - Target: `com.groundspeak.geocaching.intro.profile.l.c` (13 parameters)
     - Injects `const/16 v$p5Reg, 0x1` before the `if-nez p5` branch to guarantee unconditional execution of the premium branch.
     - Neutralizes `Lmjc;->f:Lgf9;` (`iget-object`), `je9.p` (Statistics Composable), and the following `f.v` spacer, cleanly eliminating the Statistics row which relies on unavailable server-side data.
4. **Settings Screen Upgrade Row**:
   - Target: `com.groundspeak.geocaching.intro.fragments.settings.SettingsFragment.w(Lct8;Lgo1;I)V`
     - Intercepts the `Ldic;->e()Z` check by forcing the move-result register to `0x1` (`true`), taking the premium branch that skips `settings/f0.g` ("Upgrade to Premium").
5. **Account Screen Upgrade Row & Title**:
   - Target: `com.groundspeak.geocaching.intro.fragments.AccountFragment.w`
     - Overrides the `R.string.membership_type_basic` title result (string resource `0x7f140719`) with `"Membership type: Premium"`.
     - Redirects control flow past the `settings/f0.g` upgrade item and following spacer, preserving "Disable or delete account".
6. **Public Cache Data Enrichment Fallback**:
   - Targets: `com.groundspeak.geocaching.intro.model.d.e` (`LegacyGeocacheRepo.loadGeocache`, takes `Loy1;`) and `com.groundspeak.geocaching.intro.model.LegacyGeocacheRepo$fetchLegacyCacheFromServer$2.invokeSuspend`
   - In `d.e`, intercepts the database conversion (`Lfj4;->n(Lkn6;)LegacyGeocache;`) to register the database's `LiteGeocache` in `GeocacheEnrichmentBridge.rememberLiteGeocache`.
   - In `fetchLegacyCacheFromServer$2`, intercepts the error return point when server requests fail with HTTP 403 Forbidden (which the Groundspeak mobile API returns for basic accounts on traditional caches with Difficulty > 1.5 or Terrain > 1.5, and on non-traditional caches).
   - Routes through `GeocacheEnrichmentBridge.onFetchFailed`, which scrapes the public cache page on `geocaching.com` (where all non-PMO cache descriptions, hints, and owner details are public). When public listing data is retrieved, enriches the cache with `placedBy`, `shortDescription`, `longDescription`, and `encodedHints`, preserving the original cache's availability and publication status, saves it into the local SQLite cache database with `IsLite = 0`, and returns a success result. If public scraping fails or times out, the original failure is preserved so stale/blank records are not cached or stored.
   - Restores missing cache descriptions, hint button functionality, and owner attribution across cache details, description webviews, and navigation screens.
7. **PMO Restricted-Cache Notice**:
   - Target: `com.groundspeak.geocaching.intro.geocachedetails.GeocacheDetailsActivity.C(LegacyGeocache)V`
   - Injects `GeocacheEnrichmentBridge.notifyPmoRestricted(Context, Object)` at method entry. When the cache is Premium Member Only, a Toast explains that the server restricts its complete data for basic accounts; the notice fires at most once per cache code per process so recompositions cannot spam it.
   - 10.24.0 renders cache details in Compose and no longer ships `res/layout/cd_item_summary.xml` or `geocachedetails.overviewitems.CacheSummaryItem`; the previous in-layout banner therefore has no anchor and was replaced by the notice above.

---

## 6. Unlock Templates

### Overview

Unlocks the full client-side geocache log templates system, allowing Basic accounts to create, edit, save, and apply custom log templates in the log creation workflow without a Geocaching Premium subscription.

### Bytecode Modifications

1. **Settings Screen Gate**:
   - Target: `com.groundspeak.geocaching.intro.fragments.settings.SettingsFragment.y(Lvjc;)V`
   - Intercepts the `Ldic;->e()Z` check in the templates branch by forcing the result to `0x1` (`true`), bypassing the premium upsell and directly navigating to `R.id.toTemplatesListFragment` (`0x7f0a0587`).
2. **Settings Item Badge**:
   - Target: `com.groundspeak.geocaching.intro.fragments.settings.c0.<init>` (templates row, title `templates_title`)
   - Replaces the `const/4 v5, 0x1` premium-badge literal passed to `ujc.<init>(IILjava/lang/Integer;IZI)V` with `0x0`, removing the locked "Premium" badge next to Templates in Settings.

3. **Local Room DB CRUD Redirection**:
   - Target: `com.groundspeak.geocaching.intro.network.api.templates.a`
   - Neutralizes remote API dependencies so creating, updating, deleting, and loading templates operates purely against the local SQLite `templates` Room database table:
     - `a(String, String, Continuation)`: Returns synthetic `Success(LogTemplate(0, title, text))` (`Lly9(Loz6)`), allowing `TemplatesRepo.addNewTemplate` to insert directly into the local DAO.
     - `b(int, Continuation)`: Returns `Success(Unit)` (`Lly9(Lkec)`), allowing `TemplatesRepo.deleteTemplate` to delete by local ID.
     - `c(Continuation)`: Returns `Failure("local")` (`Lky9`), triggering `TemplatesRepo.getAllTemplates`'s built-in offline fallback that loads all persisted templates from Room DB.
     - `d(int, String, String, Continuation)`: Returns `Success(Unit)` (`Lly9(Lkec)`), allowing `TemplatesRepo.updateTemplate` to update the local row by ID.

---

## 7. Unlock Experimental Features

### Overview

Unlocks beta and experimental features in Settings without a Geocaching Premium membership, providing access to in-development tools, multiple log photos, Omni-Search, dark mode web descriptions, and 10% Projects.

### Configuration Options

- `unlockAllBetaFeatures` (default: `true`): Unlocks all 10% beta features (Activity Feed, Cache Log Translation, Autofill, Confetti, etc.).
- `enableUnpersistedExperimentalFeatures` (default: `true`): Persists and enables the Collaborative Lists, Has Parking, and Trackables Only toggles in Experimental Features.
- `bypassExperimentalServerSync` (default: `true`): Keeps experimental feature toggles local without POSTing to or being overwritten by `/mobile/v1/user/settings/mobileexperiments`.

### Bytecode Modifications

1. **Settings Screen Gate**:
   - Target: `com.groundspeak.geocaching.intro.fragments.settings.SettingsFragment.z()V`
   - Intercepts the `Ldic;->e()Z` check by forcing the result to `0x1` (`true`), bypassing upsell and directly pushing `R.id.toExperimentalFeaturesFrag` (`0x7f0a0547`).
2. **Settings Item Badge**:
   - Target: `com.groundspeak.geocaching.intro.fragments.settings.q.<init>` (experimental features row, title `experimental_features`)
   - Replaces the `const/4 v5, 0x1` premium-badge literal passed to `ujc.<init>(IILjava/lang/Integer;IZI)V` with `0x0`, removing the locked "Premium" badge next to Experimental Features in Settings.
3. **Beta Feature Flags**:
   - Target: `Lu36;->z(LaunchDarklyFlag)Z`, the LaunchDarkly evaluation wrapper used by 93 call sites.
   - When `unlockAllBetaFeatures` is enabled, intercepts `LaunchDarklyFlag.I` (`show-mobile-10-percent-menu`), `LaunchDarklyFlag.O` (`recent-log-icons`), and `LaunchDarklyFlag.X` (`support-darkmode-webdescription`), returning `true` unconditionally so all beta features and their preferences populate and persist cleanly without interfering with application startup or LaunchDarkly initialization.
4. **Hidden Experimental Toggles**:
   - Targets: `experimentalfeatures.g$g` (Collaborative Lists), `g$j` (Has Parking), and `g$y` (Trackables Only) plus their preference reader `Lqh3;->a(g)Z`.
   - When `enableUnpersistedExperimentalFeatures` is enabled, forces the reader to `true` and persists the toggle so the rows render and stay enabled.
5. **Server Sync Bypass**:
   - Targets: `com.groundspeak.geocaching.intro.experimentalfeatures.e` (`saveFeatureToServer` and `syncFeatures`).
   - When `bypassExperimentalServerSync` is enabled, keeps experimental toggles local instead of POSTing to `/mobile/v1/user/settings/mobileexperiments` or being overwritten by it.

---

## 8. Remove Shop

### Overview

Removes the Shop Geocaching promotional item row and promotional card ("Everything you need to hide, play, and share", featured shop items/banners) from the Profile screen.

### Bytecode Modifications

1. **RemoteConfig Shop Link Gate**:
   - Target: `Lku9;->h()Z`
   - Injected with `const/4 v0, 0x1; return v0;`, unconditionally forcing `shopLinkIsHidden` to `true`. This causes `ProfileViewModel` to initialize `ShopLinkData` with `isHidden = true`, cleanly eliminating the shop link from the profile domain model.
2. **Profile Screen Composable**:
   - Target: `com.groundspeak.geocaching.intro.profile.l.c`
   - Injects `const/4 v$reg, 0x1` right before the `if-nez` branch evaluating `ShopLinkData.isHidden` (`Lura;->a:Z`), guaranteeing the composable unconditionally branches to skip both the Shop Geocaching row and the featured promotional banner card without disrupting Compose slot table alignment.

---

## 9. Enable Developer Tools and Feature Flags

### Overview

Exposes the internal Geocaching Developer/Debug menu in Settings and unlocks client-side LaunchDarkly feature flags, Remote Config parameters, and residual membership gates. Disabled by default (`default = false`) to avoid unintentional test mode activations or telemetry disruptions for standard users.

### Configuration Options

1. **Debug & Diagnostic Surfaces**:
   - `exposeDebugMenuInSettings` (default: `true`): Restores the internal Debug Menu item in Settings (LaunchDarkly overrides, Remote Config overrides, AutoLogger, Style/Component/Tooltip previews, and DebugSharedPrefs toggles).
2. **Remaining Client Membership Gates**:
   - `unlockTrailsMapTypeGate` (default: `true`): Unlocks Trails and Wheelchair Trails in `MapTypeSelectionFragment` when OpenStreetMap Drop-in Replacement is not enabled.
   - `unlockNewsletterSettingsGate` (default: `true`): Unlocks newsletter language selection and hides the Basic-account upgrade banner in `NewsletterSettingsFragment`.
   - `unlockHideCachePremiumOption` (default: `true`): Enables Premium-only controls in the hide-cache flow and `ConversationViewModel` GC code validation.
3. **LaunchDarkly Feature Flag Selectors**:
   - `enableShareablesInApp` (default: `false`): Forces `show-shareables` and `mobile-shareables-filter`.
   - `enableCollaborativeLists` (default: `false`): Forces `collab-list-release`.
   - `enableLodestones` (default: `false`): Forces `show-lodestones-mobile` and `show-lodestone-mobile-finders`.
   - `enableEditLogDate` (default: `false`): Forces `edit-geocache-log` and `show-log-date-selector`.
4. **Remote Config Override Selectors**:
   - `forceMapTrayEnabled` (default: `false`): Forces `mapTray`.
   - `forceHideLastLogCount` (default: `false`): Forces `hideLastLogDNF`.
   - `forceShowDowntimeBanner` (default: `false`): Forces `showMobileDowntimeBanner`.

### Bytecode Modifications

- Makes `settings/m.<init>` public and appends a `fma.b` row section for the debug menu item to `SettingsFragment.w(Lct8;Lgo1;I)V`; clicking it routes through `SettingsFragment.y(Lvjc;)V` to `R.id.toDebugMenu` (`0x7f0a0544`).
- Trails gate: forces the `"userIsPremium"` result in `nb7.invoke` to `0x1`.
- Newsletter gate: forces the `Ldic;->e()Z` result in `q97.invoke` to `0x1`.
- Hide-cache gate: forces the `Ldic;->e()Z` result inside `hidecache/t.i()Z`.
- Shareables billing gate: forces the `Ldic;->e()Z` result in `shareables/o.<init>`.
- Conversation GC-code validation: forces the `Ldic;->e()Z` result in `ConversationViewModel$validateGcCode$2.invokeSuspend`.
- LaunchDarkly overrides: prepends flag-key comparisons to `com.groundspeak.geocaching.intro.analytics.launchdarkly.b.i(LaunchDarklyFlag)Z`, preserving manual overrides stored in LaunchDarkly shared preferences.
- Remote Config overrides: prepends key comparisons to `Lku9.a(String, boolean)`, preserving `RemoteConfig.REMOTE_CONFIG_DEBUG_PREFS` overrides.

### Notes

- 10.24.0 dropped several former targets: the `Debug.TEST_AWARD` marker, the `cache-details-rework`/`show-total-log-count`/`better-events-*`/`select-cache-types`/`save-filter-settings` LaunchDarkly flags, most diagnostic flags, and the `MAP_AUTO_UPDATE_DISABLED`/`SEND_DIAGNOSTIC_INFO_LOGS`/`LINEAR_CALLOUTS_ENABLED` Remote Config keys. The corresponding options (`enableAchievementDebugTap`, `enableCacheDetailsRedesign`, `showTotalLogCount`, `enableBetterEventsFilter`, `enableSelectCacheTypes`, `enableDiagnosticFlags`, `forceDisableMapAutoUpdate`, `forceSendDiagnosticLogs`, `forceLinearCalloutsEnabled`) were removed instead of being left as silent no-ops.
