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
- `stripFacebook` (default: `true`): Neutralizes Facebook App Events logger methods and settings downloads.
- `stripIterable` (default: `true`): Neutralizes Iterable marketing event tracking and device registration.
- `stripUsercentrics` (default: `true`): Neutralizes Usercentrics consent telemetry events while preserving the readiness lifecycle necessary for user login.

### Bytecode Modifications

1. **Google Play Advertising ID (AAID)**:
   - Target: `com.google.android.gms.ads.identifier.AdvertisingIdClient.getAdvertisingIdInfo(Context)`
   - Rewritten to construct and return `AdvertisingIdClient$Info("00000000-0000-0000-0000-000000000000", true)` with ad tracking permanently limited.
2. **First-Party Analytics & Web Bridges**:
   - `AnalyticsRepo`: Stubs out all event dispatchers (`m`, `a`, `b`, `c`, `f`, `g`, `h`, `i`, `j`, `k`, `l`, `n`, `o`, `p`, `q`).
   - `AnalyticsRepo$a`: Neutralizes static companion tracking bridge `a`.
   - `vm3` & `go3`: Neutralizes Firebase Analytics event helpers.
   - `AnalyticsWebInterface`: Neutralizes Javascript interface `logEvent` called from embedded web views.
3. **Firebase SDKs**:
   - `FirebaseAnalytics`: Stubs `logEvent`, `setAnalyticsCollectionEnabled`, `setUserProperty`, `setDefaultEventParameters`, `setSessionTimeoutDuration`, and `setUserId`.
   - `FirebasePerformance`: Stubs `setPerformanceCollectionEnabled`.
   - `FirebaseInAppMessaging`: Stubs `setAutomaticDataCollectionEnabled` and `setMessagesSuppressed`.
   - `FirebaseCrashlytics`: Stubs `log`, `recordException`, `setUserId`, `setCustomKey`, and `setCrashlyticsCollectionEnabled`.
4. **Facebook SDK**:
   - Stubs `AppEventsLogger` (`activateApp`, `logEvent`, `logPurchase`, `flush`, `setFlushBehavior`), `FetchedAppSettingsManager.loadAppSettingsAsync`, and `wv.l`.
5. **Iterable API**:
   - Stubs `IterableApi` (`p`, `trackPushOpen`, `updateEmail`, `updateUser`, `registerDeviceToken`, `disableDeviceForCurrentUser`).
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
   - When `menu_item_filter` is selected, intercepts `l3c.d()` result by setting it to `0x1` (`true`), bypassing the upsell branch and directly launching coroutines navigating to `toFiltersNavGraph`.
2. **Filter Screen ViewModel Criteria**:
   - Target: `com.groundspeak.geocaching.intro.geocachefilter.FilterViewModel.e(ZLzj3;)Ljava/util/ArrayList;`
   - Intercepts all 12 `l3c.d()` gate checks by forcing each result register to `0x1` (`true`), unlocking:
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
     - Intercepts `l3c.d()` check to execute the full filter population flow without stripping premium criteria.
3. **Filter Screen Dialog Clicks**:
   - Target: `jk3.onClick(DialogInterface, I)`
   - Injects `dialogInterface.dismiss(); return-void;` at index 0 to eliminate upsell prompts from dialog actions.
4. **List View Sorting**:
   - Target: `kb4.invoke()Ljava/lang/Object;`
   - Intercepts `l3c.d()` check by forcing register to `0x1` (`true`), bypassing `rb4` upsell launch and displaying `SortByDialogFragment` (`"sortByDialog"`).
5. **GeoTour Sorting**:
   - Target: `hf4.p()Lszb;`
   - Intercepts `l3c.d()` check by forcing register to `0x1` (`true`), bypassing upsell and displaying `geotourSortDialog`.

6. **Filter Preferences & Criteria Parser**:
   - Targets: `dk3.h()` (`FilterPreferences.h`), `dk3.b()` (`FilterPreferences.b`), and `ak3.invoke`
   - Forces `l3c.d()` check results to `0x1` (`true`), ensuring user-saved filter criteria (cache types, sizes, difficulty, terrain, attributes, min favorites, etc.) are actually loaded into `ck3` and evaluated across map search and list views instead of defaulting to empty filter sets.
   - In `dk3.h()`, replaces the hardcoded `Boolean.TRUE` for `includeOwnedDisabledCaches` with `null` (`const/4 v15, 0x0`), and sanitizes inactive toggle filters to `null`, preventing the Geocaching server from rejecting basic account map search requests with HTTP 403 Forbidden.
7. **Client-Side Map Item Filtering & Lifecycle Synchronization**:
   - Target: `com.groundspeak.geocaching.intro.map.rendering.a.e(List, Ll3c)`
     - Injects `GeocacheFilterBridge.filterMapItems(List)` at instruction 0 using `invoke-static/range`, filtering all map items (`Luq8`, `Ltq8`) against active `FilterModel` criteria (types, sizes, difficulty, terrain, minimum favorites, hide finds, hide owned) before generating pins for MapLibre, Google Maps, and list views.
   - Targets: `SharedMapViewModel$trySearching$1`, `SharedMapViewModel$trySearching$2`, and `SharedMapViewModel$reloadPins$1`
     - Injects `GeocacheFilterBridge.updateAndFilterMapItems` on database and network search item emissions, replacing the master in-memory list with the latest non-empty database/network emission and emitting its filtered subset to `SharedMapViewModel.p0`.
     - Injects `GeocacheFilterBridge.reapplyFilters` into `reloadPins$1` to re-filter that latest retained list (falling back to `currentList` only when the master list is empty) when filter criteria change.
   - Target: `MapLibreFragment.onResume()`
     - Injects `SharedMapViewModel.p()` (`reloadPins`) on fragment resume so returning from `FilterNavHostActivity` immediately triggers pin reloading and updates the map.
   - Target: `SharedMapViewModel$refreshFilteredState$1`
     - Triggers `SharedMapViewModel.p()` whenever filter state is refreshed.

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
   - Targets: `t07`, `com.groundspeak.geocaching.intro.mainmap.map.n`, `com.groundspeak.geocaching.intro.navigationmap.NavigationViewModel`, and `dx1`.
   - Replaces hardcoded style references with `invoke-static OsmStyleBridge.getActiveStyleUrl()`, loading user-selected or custom style endpoints on demand.

4. **Map Style Selection Interception (Screen & Experimental Bottom Sheet)**:
   - Targets: `MapTypeSelectionFragment.z` (full-screen dialog) and `ky6.invoke(Object)` (`MapLibreFragment` Compose bottom sheet used when Experimental "Adjustable Highly Favorited" is enabled).
   - Intercepts map style clicks (`l07` in `MapTypeSelectionFragment.z` and `MapType` in `ky6.invoke`) and forwards `(fragment, mapTypeId)` to `OsmStyleBridge.onStyleSelected(fragment, mapTypeId)`.
   - Bypasses `w05.G` (Premium upsell gate) and the Google Maps fallback navigation (`0x7f0a0567`), stores the selected style in SharedPreferences (`UserMapPrefs.OSM_STYLE_URL` and `UserMapPrefs.PREFERRED_MAP_TYPE`), prompts for a custom URL when "Custom URL" is chosen, dismisses either `MapTypeSelectionFragment` or the Compose bottom sheet (`SharedMapViewModel.k0`), and prompts to restart the app.

5. **Neutralize Google Maps Fallback Listener**:
   - Target: `hy6.invoke(Object, Object)`
   - Forces `List.contains()` result register to `0x1` (`true`), preventing the fragment result listener from navigating back to Google Maps (`0x7f0a0567`) when non-Trails styles are selected.

6. **FTUE Onboarding Neutralization & Redirection Bypass**:
   - Targets: `i14.d(l3c, Z)Z` and `i14.e(l3c)Z`
   - Injected with `const/4 v0, 0x0; return v0;`, neutralizing first-time user suggestion flow checks.
   - Target: `com.groundspeak.geocaching.intro.onboarding.OnboardingMapActivity.onCreate(Bundle)`
   - Neutralizes `onDestroy` and injects an immediate redirect to `MainActivity` with `MainActivity.SKIP_INITIAL_SUGGESTION_FLOW=true`.
   - Target: `MainActivity.G(MainActivityVM$b, MainActivity$NavDestination)V`
   - Overrides `$c` (`OnboardingMapActivity`) and `b` (`PagingEducationActivity`) suggestion flow states with `$a` (`MainActivityVM$b$a`), guaranteeing `MainActivity` never bounces to `OnboardingMapActivity`.

7. **Better Events Map Customization Toggle**:
   - Targets: `le7.invoke` and `r07.a`
   - Forces `LaunchDarklyFlag.O` (`BETTER_EVENTS_MAP`) evaluation to `true`, making the "Event dates" toggle visible in both the Map settings screen and experimental bottom sheet.

---

## 5. Local Premium

Enables local Premium membership status across the application and removes upgrade promotions, canisters, and locked premium banners across primary exploration and configuration surfaces:

1. Enables local Premium membership status in Account and Profile views, setting profile header membership to "Premium member" and account screen to "Membership type: Premium".
2. Eliminates the floating map upgrade canister and pill button from the top-left corner of the map.
3. Removes the promotional upgrade card ("Artwork Geocaching Premium", "Access it all", "Go Premium") and the server-dependent Statistics item from the Profile screen.
4. Removes the "Upgrade to Premium" menu row from the Settings screen.
5. Removes the "Upgrade to Premium" button and spacer row from the Account screen while preserving "Disable or delete account".
6. Enriches cache details (description, hints, placed-by owner name) for public regular and advanced caches by scraping public listing details when the server rejects basic account API requests with HTTP 403 Forbidden.
7. Injects a styled light-orange alert banner directly above the Difficulty / Terrain / Size meters for Premium Member Only caches to notify users that full cache details (complete description, hints, activity logs) are restricted by the server.

### Options

- `showLocalPremiumWarnings` (Boolean, default `true`): Displays styled in-app warning alerts on Premium Member Only caches where full cache data is restricted by the server.

### Resource Modifications

1. **Cache Summary Warning Alert**:
   - Target: `res/layout/cd_item_summary.xml`
   - Injects a `LinearLayout` container (`@+id/pmo_warning_container`, `android:tag="pmo_warning_container"`) constrained between `@id/view_extra_space` and `@id/dts_container`. Contains a warning icon (`@drawable/warning_filled`) and notice text. Initial visibility is set to `gone` and dynamically toggled at runtime.

### Bytecode Modifications

1. **Map Top-Left Upgrade Canister**:
   - Targets: `com.groundspeak.geocaching.intro.mainmap.map.SharedMapViewModel.<init>` and `A(MapMode)`
     - Intercepts `l3c.d()` checks by forcing move-result registers to `0x1` (`true`), ensuring StateFlow `r0` is initialized and maintained as `false`.
   - Target: `com.groundspeak.geocaching.intro.mainmap.map.i.b(im7, h24, tl1, I)`
     - Forces `Boolean.booleanValue()Z` result register to `0x0` (`false`), ensuring the Composable branches directly to group `-0x6f32da68` and cleanly emits nothing.
2. **Profile Header, Statistics & Bottom Promotional Card**:
   - Target: `com.groundspeak.geocaching.intro.profile.o.a(OwnProfileResponse)`
     - Replaces the `OwnProfileResponse.Profile.k()` membership-title result with `"Premium member"` before it populates the Profile header.
   - Target: `x29.invoke(Object, Object, Object)`
     - Intercepts `l3c.d()` check by forcing register `v5` to `0x1` (`true`), passing `z2 = true` to `com.groundspeak.geocaching.intro.profile.l.b`.
   - Target: `com.groundspeak.geocaching.intro.profile.l.b`
     - Injects `const/16 v$p5Reg, 0x1` before the `if-nez p5, :cond_587` branch to guarantee unconditional execution of the premium branch, bypassing `q.b`.
     - Neutralizes `u4c.f` (`iget-object`), `k19.p` (Statistics Composable), and the following `f.u` spacer with `nop`, cleanly eliminating the Statistics row which relies on unavailable server-side data.
3. **Settings Screen Upgrade Row**:
   - Target: `com.groundspeak.geocaching.intro.fragments.settings.SettingsFragment.v(lg8, tl1, I)`
     - Intercepts `l3c.d()` check by forcing move-result register to `0x1` (`true`), taking branch `:cond_23a` and bypassing `e0.g` ("Upgrade to Premium").
4. **Account Screen Upgrade Row & Title**:
   - Target: `com.groundspeak.geocaching.intro.fragments.AccountFragment.v(a, i24, tl1, I)`
     - Intercepts `Ll65;->U(tl1, I)Ljava/lang/String;` following `R.string.membership_type_basic` (0x7f140692) and overrides the string register with `"Membership type: Premium"`.
     - Replaces `sget-object v2, e0;->g` with `BuilderInstruction30t(Opcode.GOTO_32, targetLabel)` targeting `invoke-virtual {v11, v1}, Lb44;->t(Z)V`, cleanly skipping the `f.v` upgrade item and `f.u` spacer while preserving `odb.b` and `m.g`.
5. **Public Cache Data Enrichment Fallback**:
   - Targets: `com.groundspeak.geocaching.intro.model.d.e` (`LegacyGeocacheRepo.loadGeocache`) and `com.groundspeak.geocaching.intro.model.LegacyGeocacheRepo$fetchLegacyCacheFromServer$2.invokeSuspend`
   - In `d.e`, intercepts `Lie4.l(gf6)` to register the database's `LiteGeocache` in `GeocacheEnrichmentBridge.rememberLiteGeocache`.
   - In `fetchLegacyCacheFromServer$2`, intercepts the error return point when server requests fail with HTTP 403 Forbidden (which the Groundspeak mobile API returns for basic accounts on traditional caches with Difficulty > 1.5 or Terrain > 1.5, and on non-traditional caches).
   - Routes through `GeocacheEnrichmentBridge.onFetchFailed`, which scrapes the public cache page on `geocaching.com` (where all non-PMO cache descriptions, hints, and owner details are public). When public listing data is retrieved, enriches the cache with `placedBy`, `shortDescription`, `longDescription`, and `encodedHints`, preserving the original cache's availability and publication status, saves it into the local `y82` SQLite database with `IsLite = 0`, and returns a `Success(xk9)` result. If public scraping fails or times out, the original failure is preserved so stale/blank records are not cached or stored.
   - Restores missing cache descriptions, hint button functionality, and owner attribution across cache details, description webviews, and navigation screens.
6. **Cache Summary PMO Warning Banner Binding**:
   - Target: `com.groundspeak.geocaching.intro.geocachedetails.overviewitems.CacheSummaryItem.bindViewHolder(Li56;)V`
   - Injects a call to `GeocacheEnrichmentBridge.bindCacheSummaryWarning(itemView, data)` before view binding. Resolves the cache stub's `premium` status, applies light-orange alert styling (supporting both dark and light UI modes), and sets warning banner visibility.

---

## 6. Unlock Templates

### Overview

Unlocks the full client-side geocache log templates system, allowing Basic accounts to create, edit, save, and apply custom log templates in the log creation workflow without a Geocaching Premium subscription.

### Bytecode Modifications

1. **Settings Screen Gate**:
   - Target: `com.groundspeak.geocaching.intro.fragments.settings.SettingsFragment.x(d5c)`
   - Intercepts `l3c.d()` when `c5cVar instanceof b0` by forcing the check result to `0x1` (`true`), bypassing `toPremiumUpsellActivity` and directly navigating to `R.id.toTemplatesListFragment`.
2. **Settings Item Badge**:
   - Target: `com.groundspeak.geocaching.intro.fragments.settings.b0.<init>`
   - Replaces `const/4 v5, 0x1` with `const/4 v5, 0x0`, removing the locked "Premium" badge next to Templates in Settings.

3. **Local Room DB CRUD Redirection**:
   - Target: `com.groundspeak.geocaching.intro.network.api.templates.a`
   - Neutralizes remote API dependencies so creating, updating, deleting, and loading templates operates purely against the local SQLite `templates` Room database table:
     - `a(String, String, Continuation)`: Returns synthetic `Success(LogTemplate(0, title, text))` (`xk9(cq6)`), allowing `TemplatesRepo.addNewTemplate` to insert directly into `TemplatesDao` (`u8b`).
     - `b(int, Continuation)`: Returns `Success(Unit)` (`xk9(szb)`), allowing `TemplatesRepo.deleteTemplate` to delete by local ID from `TemplatesDao` (`Lai;`).
     - `c(Continuation)`: Returns `Failure("local")` (`wk9`), triggering `TemplatesRepo.getAllTemplates`'s built-in offline fallback that loads all persisted templates from Room DB (`Lo4b;`).
     - `d(int, String, String, Continuation)`: Returns `Success(Unit)` (`xk9(szb)`), allowing `TemplatesRepo.updateTemplate` to update the local row by ID in `TemplatesDao` (`Lt8b;`).

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
   - Target: `com.groundspeak.geocaching.intro.fragments.settings.SettingsFragment.y()`
   - Intercepts `l3c.d()` by forcing the check result to `0x1` (`true`), bypassing upsell and directly pushing `R.id.toExperimentalFeaturesFrag`.
2. **Settings Item Badge**:
   - Target: `com.groundspeak.geocaching.intro.fragments.settings.p.<init>`
   - Replaces `const/4 v5, 0x1` with `const/4 v5, 0x0`, removing the locked "Premium" badge next to Experimental Features in Settings.
3. **Beta Feature Flags**:
   - Target: `Ll75.E(LaunchDarklyFlag)`
   - When `unlockAllBetaFeatures` is enabled, intercepts `LaunchDarklyFlag.K` (`show-mobile-10-percent-menu`), `T` (`recent-log-icons`), and `b0` (`support-darkmode-webdescription`) in the high-level LaunchDarkly evaluation wrapper `l75.E`, returning `true` unconditionally so all beta features and their preferences populate and persist cleanly without interfering with application startup or LaunchDarkly initialization.

---

## 8. Remove Shop

### Overview

Removes the Shop Geocaching promotional item row and promotional card ("Everything you need to hide, play, and share", featured shop items/banners) from the Profile screen.

### Bytecode Modifications

1. **RemoteConfig Shop Link Gate**:
   - Target: `eh9.h()Z`
   - Injected with `const/4 v0, 0x1; return v0;`, unconditionally forcing `shopLinkIsHidden` to `true`. This causes `ProfileViewModel` (`q.<init>`) to initialize `ShopLinkData` with `isHidden = true`, cleanly eliminating the shop link from the profile domain model.
2. **Profile Screen Composable**:
   - Target: `com.groundspeak.geocaching.intro.profile.l.b`
   - Injects `const/4 v$reg, 0x1` right before the `if-nez v$reg, :cond_54d` branch evaluating `ShopLinkData.isHidden` (`hda.a`), guaranteeing the composable unconditionally branches to skip both the Shop Geocaching row (`k19.n`) and the featured promotional banner card (`q.a`) without disrupting Compose slot table alignment.

---

## 9. Enable Developer Tools and Feature Flags

### Overview

Exposes the internal Geocaching Developer/Debug menu in Settings and unlocks client-side LaunchDarkly feature flags, Remote Config parameters, and residual membership gates. Disabled by default (`default = false`) to avoid unintentional test mode activations or telemetry disruptions for standard users.

### Configuration Options

1. **Debug & Diagnostic Surfaces**:
   - `exposeDebugMenuInSettings` (default: `true`): Restores the internal Debug Menu item in Settings (LaunchDarkly overrides, Remote Config overrides, AutoLogger, Style/Component/Tooltip previews, and DebugSharedPrefs toggles).
   - `enableAchievementDebugTap` (default: `false`): Enables the internal `Debug.TEST_AWARD` tap handler in `AchievementActivity` to test confetti and cycle achievement states.
2. **Remaining Client Membership Gates**:
   - `unlockTrailsMapTypeGate` (default: `true`): Unlocks Trails and Wheelchair Trails in `MapTypeSelectionFragment` when OpenStreetMap Drop-in Replacement is not enabled.
   - `unlockNewsletterSettingsGate` (default: `true`): Unlocks newsletter language selection and hides the Basic-account upgrade banner in `NewsletterSettingsFragment`.
   - `unlockHideCachePremiumOption` (default: `true`): Enables Premium-only controls in `HideCacheViewModel` and `ConversationViewModel` GC code validation.
3. **Feature Flag & Remote Config Selectors**:
   - Individual toggles for Cache Details redesign, list sorting, and experiments.

### Bytecode Modifications

- Targets `SettingsFragment.y()` to register the internal debug entry point.
- Intercepts LaunchDarkly evaluation wrappers in `Ll75;` and RemoteConfig resolution methods to apply local overrides.
