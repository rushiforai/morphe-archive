# Fizz Android App Hidden Feature Flags, Cohorts, & Mobile Studio Catalog

**Target Package:** `com.ashtoncofer.Buzz`  
**Analyzed Version:** `1.53.0` (VersionCode: `394385`)  
**Target Runtime:** Native Android (Target SDK: `36` / Android 16, Min SDK: `23` / Android 6.0); Jetpack Compose, Dagger/Hilt, Kotlinx Coroutines, Retrofit 2/OkHttp 4, Google Play Integrity / PairIP  

---

## Executive Summary & Architecture

The Fizz Android application employs a sophisticated multi-layered feature gating, remote configuration, and developer diagnostic architecture. Unlike React Native applications that evaluate feature gates via JavaScript Redux sagas or string tables, Fizz executes on native ART/Dalvik with Jetpack Compose declarative UI trees bound to reactive Kotlin Coroutine `StateFlow` streams.

The configuration hierarchy spans four primary operational layers:

```
                                [ Fizz Backend / Cloud API ]
                                              |
                        +---------------------+---------------------+
                        |                                           |
                        v                                           v
         [ Server Remote Session State ]              [ Superadmin / Mod Status ]
         - Endpoint: `/app/session-state`             - Evaluated in `SessionState` (`mc.j0`)
         - Deserialized into `mc.j0`                  - Backend roles: `isAdmin`, `isSuperAdmin`
         - Cached in `cached_session_state.json`      - Superadmin endpoints: `/superadmin/*`
                        |                                           |
                        +---------------------+---------------------+
                                              |
                                              v
                       [ Local SharedPreferences Overrides Layer ]
         - Remote Config Overrides: `fizz_remote_config_overrides` (`z5` / `p`)
         - User Role Overrides: `fizz_user_property_overrides` (`o6` / `i8`)
         - Subscription Overrides: `fizz_subscription_status_override` (`m6` / `o1`)
         - Feed Simulate Overrides: `fizz_simulate_feed` (`i6` / `r6`)
         - Location Spoof Presets: `fizz_simulated_location` (`j6` / `u6`)
         - Ad Campaign Placement: `fizz_force_placement` (`u3`)
         - Custom Backend Router: `fizz_mono_app_settings` (`b4` / `k2`)
         - Debug Toggles & Overlays: `fizz_debug_flags` (`n3` / `s` / `t.f7219a`)
                                              |
                                              v
                     [ Mobile Studio: Hidden On-Device Developer Suite ]
         - Secret Hardware Trigger: Alternating Volume Keys (UP <-> DOWN within 1.2s)
         - `MainActivity.onKeyDown` dispatches to `ce.j1.f4612a` (`mobileStudioOpenRequests`)
         - Root Compose Drawer: `ce.i1` (`mobile-studio-panel`, `mobile-studio-scrim`)
         - Three Operational Tabs: "Config", "Test/Simulate", "Debug" (`ce.k1`)
         - Live Superadmin Execution: Delete seen posts, generate test reports, reset caches
                                              |
                                              v
                     [ Jetpack Compose ViewModels & View Tree Gating ]
         - ViewModels observe `currentSessionStore.c` / `q0` StateFlows
         - Conditional Compose composables, navigation routes, and tabs
```

### 1. Server Remote Session State (`mc.j0` / `app/session-state`)
On app cold start and user authentication, Fizz dispatches a request to `/app/session-state`. The server delivers a monolithic `SessionState` payload (`mc.j0`) containing over 100 properties, including active community membership, user roles, feature flags, moderation guidelines, IAP product identifiers, and feed configurations. This payload is stored in memory (`kc.a currentSessionStore`) and snapshotted to disk (`cached_session_state.json`).

### 2. Remote Configuration Overrides (`z5` / `p` / `fizz_remote_config_overrides`)
Fizz provides an internal abstraction layer (`com.fizzsocial.fizz.data.local.z5`) that intercepts the server-delivered `SessionState` and overrides individual feature switches. Feature flags are modeled as typed enum constants (`com.fizzsocial.fizz.data.local.p`). If an entry is present in `fizz_remote_config_overrides.xml`, the override takes precedence over the server value.

### 3. Mobile Studio Developer Suite (`ce.a1` / `ce.r1` / `MobileStudioViewModel`)
Fizz bundles an internal on-device developer studio called **Mobile Studio**. Mobile Studio provides full runtime control over API backend routing, GPS coordinates, feed ranking algorithms, user impersonation, ad placements, and role privilege escalation. It is rendered as a modal Compose overlay drawer (`mobile-studio-panel`) across the entire application.

### 4. Secret Hardware Key Sequence
Mobile Studio is accessed via a physical hardware key listener embedded in `MainActivity.onKeyDown`. Alternating **Volume Up** (`24`) and **Volume Down** (`25`) within 1,200 ms triggers `mobileStudioOpenRequests` (`ce.j1`), sliding out the developer drawer without any visible UI button.

---

## Top 10 Most Interesting Hidden Feature Flags & Tools

### 1. Mobile Studio On-Device Developer Suite (`MainActivity.onKeyDown`)
- **Control Mechanism:** `MainActivity.onKeyDown` -> `ce.j1.f4612a` (`mobileStudioOpenRequests`) -> `AppViewModel.P` -> `ce.i1.a` (`mobile-studio-panel`)
- **Internal Classes:** `com.fizzsocial.fizz.ui.mobilestudio.MobileStudioViewModel`, `ce.r1` (`MobileStudioUiState`), `ce.a1` (`MobileStudioContent`), `ce.k1` (`MobileStudioTab`)
- **Trigger Sequence:** Physical hardware keys: **Volume Up -> Volume Down** (or **Volume Down -> Volume Up**) pressed in sequence within **1.2 seconds** (`1200ms`).
- **Mechanics & Findings:**
  - `MainActivity` tracks sequential volume key events. When alternating volume buttons are pressed with no repeats within 1,200 ms, `this.m0.f4612a.r(il.z.f16838a)` dispatches an emission to `mobileStudioOpenRequests`.
  - The root Compose container in `MainActivity` collects `AppViewModel.P` and animates a modal drawer containing three distinct tabs: **Config**, **Test/Simulate**, and **Debug**.
  - While ordinary user builds can trigger the volume key sequence, full panel visibility is gated on `AppViewModel.f7884c0`, which verifies whether `currentSession.isSuperAdmin` (`j0.K`) is true or `spoofUser.isSpoofing` (`x6.b()`) is active.

```java
// Decompiled from MainActivity.java (Lines 511-529)
@Override
public final boolean onKeyDown(int i2, KeyEvent event) {
    if ((i2 == 24 || i2 == 25) && event.getRepeatCount() == 0) {
        int i10 = i2 != 24 ? 24 : 25;
        long jUptimeMillis = SystemClock.uptimeMillis();
        Integer num = this.f6566o0;
        if (num != null && num.intValue() == i10 && jUptimeMillis - this.f6567p0 <= 1200) {
            this.f6566o0 = null;
            j1 j1Var = this.m0;
            j1Var.f4612a.r(il.z.f16838a); // Opens Mobile Studio
        } else {
            this.f6566o0 = Integer.valueOf(i2);
            this.f6567p0 = jUptimeMillis;
        }
    }
    return super.onKeyDown(i2, event);
}
```

---

### 2. Cloudrun Sandbox Custom Backend Router (`RUN_CLOUDRUN_SANDBOX`)
- **Control Store / SharedPreferences:** `b4` (`monoAppSettingsStore`), `fizz_mono_app_settings.xml`
- **Keys:** `RUN_CLOUDRUN_SANDBOX` (Boolean), `CLOUDRUN_SANDBOX_URL` (String, default `http://localhost:3000`), `saved_sandbox_urls` (Set<String>)
- **Associated ViewModel Method:** `MobileStudioViewModel.h(boolean)`
- **Mechanics & Findings:**
  - Allows Fizz mobile engineers to redirect all network requests away from production Google Cloud Run microservices to an arbitrary local development workstation or staging deployment.
  - When `RUN_CLOUDRUN_SANDBOX` is set to `true`, the base OkHttp `HttpUrl` host interceptor swaps the remote host with `CLOUDRUN_SANDBOX_URL`.
  - The UI provides a URL history selector (`saved_sandbox_urls`) and instant URL validation using OkHttp's `HttpUrl.Companion.parse()`.

---

### 3. User Impersonation & Identity Spoofing Engine (`fizz_spoof_user`)
- **Control Store / SharedPreferences:** `l6` (`spoofUserStore`), `x6` (`SpoofUser`), `fizz_spoof_user.xml`
- **Keys:** `SPOOF_USER_ID_ENABLED` (Boolean), `SPOOF_USER_ID` (String), `SPOOF_USER_PREVIOUS_IDS` (Set<String>)
- **Getter:** `spoofUserStore.a()` returns spoofed `userId` or `null`
- **Mechanics & Findings:**
  - Enables full on-device impersonation of any user identity across the entire social graph without needing their phone number, SMS OTP, or Firebase auth tokens.
  - When enabled, `spoofUserStore.a()` intercepts outgoing API requests and injects the spoofed target user ID into `X-Fizz-User-Id` / query parameters.
  - Crucially, activating user spoofing (`spoofUser.b() == true`) also bypasses the superadmin check in `AppViewModel.f7884c0`, unlocking access to administrative and Mobile Studio features for arbitrary accounts.

---

### 4. Superadmin & Moderator Role Escalation (`fizz_user_property_overrides`)
- **Control Store / SharedPreferences:** `o6` (`userPropertyOverridesStore`), `j8`, `fizz_user_property_overrides.xml`
- **Enums & Keys:** `i8.isAdmin`, `i8.isSuperAdmin`, `i8.isEligibleForModerator`, `i8.isModerator`, `i8.isBankAdmin`, `i8.globalFeedEnabled`, `i8.showSubscriberBadge`
- **Associated Endpoints:** `moderation/reports/fetch`, `moderation/moderate`, `moderation/moderator-stats`, `superadmin/config/delete-expired-already-seen-posts`
- **Mechanics & Findings:**
  - Allows forcing administrative privileges locally by intercepting `mc.j0` session resolution in `o6.a()`.
  - Enabling `isModerator` immediately mounts the moderator dashboard, report queue (`ModeratorReportsViewModel`), and user moderation tools.
  - Enabling `isSuperAdmin` (`j0.K`) unlocks superadmin controls, unmasks anonymous authors in debug overlays, permits cross-community switching, and exposes developer tooling throughout the app.

---

### 5. Fizz+ & Fizz+ Gold Lifetime Subscription Overrides (`fizz_subscription_status_override`)
- **Control Store / SharedPreferences:** `m6` (`subscriptionStatusOverrideStore`), `fizz_subscription_status_override.xml`
- **Keys:** `subscriptionStatus` (`"Active"` | `"Expired"`), `lifetimeMemberStatus` (`"Active"` | `"Expired"`)
- **Enum Model:** `tc.o1` (`Active`, `Expired`)
- **Associated Entitlements:** `fizz_plus`, `fizz_plus_gold`, `fizz_plus_lifetime`, `tc.l.Boost`
- **Mechanics & Findings:**
  - Completely overrides Google Play Billing Client and RevenueCat customer entitlements on device.
  - Setting `subscriptionStatus` to `Active` injects a synthetic active `tc.c1` entitlement into `entitlementsStore.l`, granting full Fizz+ capabilities: custom app icons (`AppIconPickerViewModel`), explore location browsing, gender/age demographic search filters, and profile customization.
  - Setting `lifetimeMemberStatus` to `Active` grants permanent **Fizz+ Gold Lifetime** status, bypassing recurring billing checks entirely.

---

### 6. Simulated Location & Multi-Campus Preset Spoofer (`fizz_simulated_location`)
- **Control Store / SharedPreferences:** `j6` (`simulatedLocationStore`), `u6` (`SimulatedLocation`), `fizz_simulated_location.xml`
- **Keys:** `SIMULATED_LOCATION` (JSON-serialized `u6`), `SavedSimulatedLocations` (JSON-serialized `List<u6>`)
- **UI Tag:** `simulate-location-map-open`
- **Mechanics & Findings:**
  - Overrides Android hardware GPS and cellular geofencing, allowing users to teleport to any university campus in the United States.
  - Features an embedded interactive map picker (`simulate-location-map-open`) where developers can tap anywhere on earth to select a latitude/longitude coordinate pair.
  - Supports saving named location presets (`SavedSimulatedLocations`), allowing 1-tap switching between different campus feeds (e.g. Stanford, Harvard, Michigan).

---

### 7. Feed Recommendation & Ranking Tuning (The 13 Overrides)
- **Control Store / SharedPreferences:** `i6` (`simulateFeedSettingsStore`), `r6` (`SimulateFeedSettings`), `fizz_simulate_feed.xml`
- **Field Inventory:**
  1. `feedFilter` (`f8`): `None`, `onlyOrganicContent`, `onlySuperAdminContent`, `onlyBankContent`
  2. `hotScoreOrderingField` (`e2`): `Empty`, `hotScore`, `hotScoreDebug`, `hotScoreDebug2`, `hotScoreRecent`, `hotScoreRecentDebug`, `hotScoreOld`, `hotScoreOldDebug`
  3. `hotScoreLocalizedOrderingField` (`d2`): `Empty`, `hotScoreLocalized`, `hotScoreLocalizedDebug`, `hotScoreRecent`, `hotScoreRecentDebug`
  4. `userTypeTag` (`k8`): `None`, `AUTHOR_USER_TYPE:collegeStudent`, `AUTHOR_USER_TYPE:nonCollegeStudent`
  5. `genderTag` (`c2`): `None`, `AUTHOR_DEMOGRAPHIC:GENDER_man`, `AUTHOR_DEMOGRAPHIC:GENDER_woman`, `AUTHOR_DEMOGRAPHIC:GENDER_other`
  6. `classYearTag` (`i`): Filter posts by author college graduation year
  7. `ageTag` (`b`): Filter posts by author age group
  8. `ethnicityTags` (`Set<String>`): Filter posts by demographic tags
  9. `clusterInterestTags` (`Set<String>`): Filter posts by AI cluster interest topics
  10. `feedSessionCount` (`Integer`): Override local feed session counter for new-user ranking
  11. `feedSessionCountGlobal` (`Integer`): Override global session counter
  12. `symkMinGapBetweenPosts` (`Integer`) & `symkShowOnlyNudges` (`Boolean`): Someone You May Know insertion frequency
  13. `demoMode` (`d1`): `None`, `appleReviewer`, `investorDemoSA`, `investorDemoUS`
- **Mechanics & Findings:**
  - Injects query parameters into `/users/feed` network calls, instructing the backend recommendation algorithm to alter feed ranking weights, isolate specific cohorts, or activate investor demo feeds (`investorDemoUS`, `investorDemoSA`) populated with curated content.

---

### 8. Sponsored Ad & Campaign Force Placement Engine (`fizz_force_placement`)
- **Control Store / SharedPreferences:** `u3` (`forcePlacementStore`), `fizz_force_placement.xml`
- **Keys:**
  - `SIMULATE_FEED_FORCE_PLACEMENT` (Boolean): Force an ad placement into feed slots
  - `SIMULATE_FEED_FORCE_FRONT_DOOR` (Boolean): Force ad to appear at the very top ("front door") of the feed
  - `SIMULATE_FEED_FORCE_CAMPAIGN_ID` (String): Target marketing campaign UUID
  - `SIMULATE_FEED_FORCE_PLACEMENT_ID` (String): Specific feed slot placement UUID
  - `SIMULATE_FEED_FORCE_CREATIVE_ID` (String): Specific image/video creative asset UUID
- **Mechanics & Findings:**
  - Bypasses ad-server auction bidding, frequency capping, and impression pacing to immediately render a specified sponsor creative inside the user's feed for QA verification.

---

### 9. Real-Time Visual Diagnostics & Feed Debug Overlays (`fizz_feed_debug` / `fizz_debug_flags`)
- **Control Stores:** `r3` (`feedDebugTracker`), `c1`, `b1`, `n3` (`debugFlagsStore`), `s` / `t.f7219a`
- **Keys:** `SHOW_FEED_DEBUG_OVERLAY`, `FEED_DEBUG_SEEN_IDS`, `SHOW_VIEW_DEBUG_LINES`, `SHOW_VIEW_TRACKING_DEBUGGER`, `SHOW_FRAME_RATE`
- **UI Composable:** `ce.d0.a` (`feed-metadata-overlay`), `ce.i1`
- **Mechanics & Findings:**
  - **Feed Ingestion Tracker (`SHOW_FEED_DEBUG_OVERLAY`):** Overlays color-coded origin tags on each feed card indicating how the item entered memory: `Cache` (disk cache), `RefreshNetwork` (initial pull-to-refresh), `PaginationNetwork` (infinite scroll batch), or `BackgroundSwap` (cross-account community switch).
  - **Performance & Layout Debuggers:** Renders real-time FPS frame drop counters (`SHOW_FRAME_RATE`), layout bounding boxes (`SHOW_VIEW_DEBUG_LINES`), and impression tracking rects (`SHOW_VIEW_TRACKING_DEBUGGER`).
  - **Diagnostic Channels (`ec.f`):** Maintains live in-memory circular logging buffers for `Pusher Console` (WebSocket events), `Push Notifications` (FCM payloads), `Decoding Errors` (Kotlinx serialization failures), and `Feed Performance` (render latency).

---

### 10. Direct Message Screenshot Notification Surveillance (`isDmScreenshotNotificationEnabled`)
- **Control Property:** `mc.j0.u1` (`isDmScreenshotNotificationEnabled` in `SessionState`)
- **Associated Endpoint:** `POST /chat/notify-screenshot`
- **Mechanics & Findings:**
  - In private 1-on-1 direct messaging conversations, `ConversationViewModel` observes Android system screenshot broadcast and ContentObserver events.
  - When a screenshot occurs, if `isDmScreenshotNotificationEnabled` is true, coroutine worker `rd.b2` fires a POST to `/chat/notify-screenshot`, informing the chat counterpart that their private messages were captured.
  - Neutralizing this flag locally or blocking `/chat/notify-screenshot` enables completely silent DM screenshots without notifying the other party.

---

## Exhaustive Feature Flag & Config Inventory

### Category 1: Mobile Studio, Developer Drawer, & Debugger Tools

| Feature Flag / Setting Key | Storage File / Class | Default | Description & Functionality |
|---|---|---|---|
| `mobileStudioOpenRequests` | `ce.j1` / `MainActivity` | Flow | Hardware sequence (Volume Up <-> Down in 1.2s) triggering Mobile Studio drawer. |
| `RUN_CLOUDRUN_SANDBOX` | `fizz_mono_app_settings` / `b4` | `false` | Diverts all network traffic to local or staging Cloud Run sandbox instance. |
| `CLOUDRUN_SANDBOX_URL` | `fizz_mono_app_settings` / `b4` | `"http://localhost:3000"` | Custom base HTTP/HTTPS URL for the sandbox backend. |
| `saved_sandbox_urls` | `fizz_mono_app_settings` / `b4` | Empty Set | Persistent list of previously used sandbox backend endpoints. |
| `SHOW_FRAME_RATE` | `fizz_debug_flags` / `n3` | `false` | Renders a real-time FPS frame-rate counter in an overlay across Compose views. |
| `SHOW_SUPER_ADMIN_NAMES` | `fizz_debug_flags` / `n3` | `true` | Displays real user names for superadmins instead of anonymized aliases. |
| `SHOW_MEME_NAME` | `fizz_debug_flags` / `n3` | `false` | Displays internal meme template identifier tags above meme feed items. |
| `SHOW_VIEW_DEBUG_LINES` | `fizz_debug_flags` / `n3` | `false` | Draws Compose component bounding boxes and padding margins for layout debugging. |
| `SHOW_FEED_DEBUG_OVERLAY` | `fizz_debug_flags` / `n3` | `false` | Renders metadata overlay displaying post ingestion source (Cache/Refresh/Pagination). |
| `SHOW_VIEW_TRACKING_DEBUGGER`| `fizz_debug_flags` / `n3` | `false` | Renders viewport intersection overlays verifying feed post impression tracking. |
| `PLAY_HAPTIC_ON_PAGINATION` | `fizz_debug_flags` / `n3` | `true` | Emits haptic vibration tick when fetching the next page of feed posts. |
| `ENGLISH_TRANSLATION` | `fizz_debug_flags` / `n3` | `false` | Forces automated English translation on foreign language posts. |
| `Force Crash` | `MobileStudioForcedCrash` / `ce.a` | N/A | Developer button throwing unhandled `MobileStudioForcedCrash` to test Sentry. |

---

### Category 2: User Roles, Permissions, & Moderation Privileges

| Gating Field / Property | Store / Class / Type | Default | Description & Functionality |
|---|---|---|---|
| `isAdmin` | `fizz_user_property_overrides` / `i8` | `false` | Grants community administrator access, campus switcher, and badge controls. |
| `isSuperAdmin` | `fizz_user_property_overrides` / `i8` | `false` | Master superadmin privilege granting Mobile Studio access, unblocking, and tools. |
| `isEligibleForModerator` | `fizz_user_property_overrides` / `i8` | `false` | Marks account as eligible to submit volunteer moderator application. |
| `isModerator` | `fizz_user_property_overrides` / `i8` | `false` | Unlocks live moderation report queue, ban tools, and moderation statistics. |
| `isBankAdmin` | `fizz_user_property_overrides` / `i8` | `false` | Unlocks administrative access to institutional and campus bank posts. |
| `globalFeedEnabled` | `fizz_user_property_overrides` / `i8` | `false` | Unlocks access to the national cross-university Global Feed tab. |
| `showSubscriberBadge` | `fizz_user_property_overrides` / `i8` | `false` | Renders the subscriber star badge on the user's avatar, posts, and comments. |
| `SPOOF_USER_ID_ENABLED` | `fizz_spoof_user` / `l6` | `false` | Master switch activating user identity spoofing. |
| `SPOOF_USER_ID` | `fizz_spoof_user` / `l6` | `""` | Target user UUID to impersonate in API headers and state queries. |
| `SPOOF_USER_PREVIOUS_IDS` | `fizz_spoof_user` / `l6` | Empty Set | History of previously spoofed user identifiers for fast switching. |

---

### Category 3: Subscription Tiers & In-App Purchases (Fizz+ & Gold)

| Feature Flag / Override Key | Store / Class / Type | Remote Config Key | Description & Functionality |
|---|---|---|---|
| `subscriptionStatus` | `fizz_subscription_status_override` | `tc.o1` | Forces Fizz+ subscription state (`Active` / `Expired`). |
| `lifetimeMemberStatus` | `fizz_subscription_status_override` | `tc.o1` | Forces Fizz+ Gold Lifetime status (`Active` / `Expired`). |
| `Iap` | `p.Iap` / `z5` | `showIAP` | Master switch toggling visibility of in-app purchase store and upsell sheets. |
| `BoostBenefit` | `p.BoostBenefit` / `z5` | `boostBenefitEnabled` | Enables post boost perks and karma multipliers (`tc.l.Boost`). |
| `fizzPlusBenefits` | `mc.j0.D0` (`Set<tc.l>`) | Set | Active subscriber benefits: custom icon, explore mode, demographic filters. |
| `fizzPlusGoldProductId` | `mc.j0.N0` (`String`) | Product ID | Google Play SKU for Fizz+ Gold subscription tier. |
| `fizzPlusFlashSaleProductIds` | `mc.j0.M0` (`List<String>`) | Product IDs | Discounted SKUs surfaced during timed flash-sale events. |
| `fizzPlusPromotionalOfferIds` | `mc.j0.L0` (`Set<String>`) | Offer IDs | Promotional win-back and retention subscription offer IDs. |

---

### Category 4: Feed Simulation, Ranking Algorithms, & Demo Modes

| Setting / Field | Store / Class / Type | Options / Formats | Description & Functionality |
|---|---|---|---|
| `feedFilter` | `fizz_simulate_feed` / `f8` | `None`, `onlyOrganic`, `onlySuperAdmin`, `onlyBank` | Filters feed to show only organic user posts, superadmin posts, or bank posts. |
| `hotScoreOrderingField` | `fizz_simulate_feed` / `e2` | `hotScore`, `hotScoreDebug`, `hotScoreRecent`, `hotScoreOld` | Selects backend ranking algorithm scoring field for Hot feed. |
| `hotScoreLocalizedOrderingField`| `fizz_simulate_feed` / `d2` | `hotScoreLocalized`, `hotScoreRecent`, Debug variants | Selects localized algorithm scoring field for regional campus Hot feed. |
| `demoMode` | `fizz_simulate_feed` / `d1` | `None`, `appleReviewer`, `investorDemoSA`, `investorDemoUS` | Loads curated mock/investor demo content for App Store review or VC pitching. |
| `userTypeTag` | `fizz_simulate_feed` / `k8` | `College Student`, `Non-College Student` | Simulates viewing feed as a verified college student vs. non-college outsider. |
| `genderTag` | `fizz_simulate_feed` / `c2` | `Man`, `Woman`, `Other` | Simulates feed ranking tailored to specific author gender cohorts. |
| `feedSessionCount` | `fizz_simulate_feed` / `Integer` | Integer (e.g. `0`, `5`) | Overrides local session count to simulate cold new-user onboarding ranking. |
| `feedSessionCountGlobal` | `fizz_simulate_feed` / `Integer` | Integer | Overrides global lifetime session count for algorithm calibration. |
| `symkMinGapBetweenPosts` | `fizz_simulate_feed` / `Integer` | Integer (e.g. `10`) | Minimum number of feed posts between Someone You May Know insertion cards. |
| `symkShowOnlyNudges` | `fizz_simulate_feed` / `Boolean` | `true` / `false` | Restricts SYMK feed components exclusively to contact synchronization nudges. |
| `Reset Viewed Posts` | `ce.l1.ResetViewedPosts` | Backend Action | Invokes `/superadmin/config/delete-expired-already-seen-posts` to un-see all posts. |
| `Add Mock Reports` | `ce.l1.AddMockReports` | Backend Action | Invokes `/moderation/reports/create-test-reports` to seed moderation test data. |
| `Add Mock Posts` | `ce.l1.AddMockPosts` | Local Channel | Injects synthetic post items directly into `HomeFeedViewModel` via `ce.a2`. |
| `Add Mock Announcements` | `ce.l1.AddMockAnnouncements` | Local Channel | Injects synthetic campus announcements into the active feed. |

---

### Category 5: Location Simulation & Multi-Campus Access

| Feature Flag / Setting Key | Storage File / Class | Default | Description & Functionality |
|---|---|---|---|
| `SIMULATED_LOCATION` | `fizz_simulated_location` / `j6` | `null` | Active mock location overriding Android device GPS coordinates. |
| `SavedSimulatedLocations` | `fizz_simulated_location` / `j6` | Empty List | Catalog of saved university campus coordinates for quick relocation. |
| `communityDisplayId` | `mc.j0.r` | Server string | Active university community slug (e.g. `stanford`, `harvard`). |
| `communityAccent` | `mc.j0.u` | Color hex | Primary campus branding color applied across Compose headers and buttons. |
| `allowedCommunities` | `mc.j0.M` (`List<mc.a>`) | List | List of all communities this account has administrative permission to switch into. |
| `AdminChangeCommunity` | `AdminChangeCommunityViewModel` | Admin only | Dedicated UI permitting instant switching between any university campus. |

---

### Category 6: Sponsored Ad Placement & Campaign Testing

| Feature Flag / Setting Key | Storage File / Class | Default | Description & Functionality |
|---|---|---|---|
| `SIMULATE_FEED_FORCE_PLACEMENT` | `fizz_force_placement` / `u3` | `false` | Master toggle forcing an ad into the user's feed. |
| `SIMULATE_FEED_FORCE_FRONT_DOOR`| `fizz_force_placement` / `u3` | `false` | Forces the ad into position 1 (top of feed) regardless of pacing rules. |
| `SIMULATE_FEED_FORCE_CAMPAIGN_ID`| `fizz_force_placement` / `u3` | `""` | UUID of specific ad campaign to fetch and render. |
| `SIMULATE_FEED_FORCE_PLACEMENT_ID`|`fizz_force_placement` / `u3` | `""` | UUID of ad placement slot to test. |
| `SIMULATE_FEED_FORCE_CREATIVE_ID`|`fizz_force_placement` / `u3` | `""` | UUID of specific image, video, or carousel creative asset to display. |

---

### Category 7: Social Features, Direct Messaging, & Media

| Feature Flag / Enum Constant | Remote Config Key | Default | Description & Functionality |
|---|---|---|---|
| `VoiceNotePosts` | `features.voiceNotes.enabled` | `false` | Enables recording and uploading audio voice notes in post composer. |
| `MultiMedia` | `multiMediaEnabled` | `true` | Allows attaching multiple images/videos to a single feed post. |
| `Marketplace` | `marketplaceEnabled` | `false` | Unlocks campus buy/sell marketplace tab and item listing creation. |
| `GifPicker` | `giphySDK` | `true` | Integrates Giphy SDK picker into comment composer and direct messaging. |
| `MemesV2` | `memesV2Enabled` | `false` | Refreshed meme template editor with custom font overlays and sticker packs. |
| `maxRecentMemeCount` | `mc.j0.S0` | `20` | Maximum number of recently edited meme templates cached in local recents. |
| `AgeAndGenderIdentity` | `ageAndGenderIdentityEnabled` | `false` | Displays author demographic flair (e.g. `"21 · Woman"`) on profile and posts. |
| `StickyProfileSelection` | `stickyProfileSelection` | `false` | Remembers selected identity (Real name vs. Anonymous) between post sessions. |
| `StickyIdentitySelection` | `stickyIdentitySelection` | `false` | Remembers selected demographic flairs across composer sessions. |
| `PublicProfiles` | `publicProfilesEnabled` | `false` | Enables rich public user profiles with bios, photos, majors, and social links. |
| `CommunityTab` | `communityTabEnabled` | `false` | Bottom navigation tab aggregating campus groups, organizations, and matches. |
| `CommunityMatches` | `mc.j0.l1` | `false` | Dating/friend matching feature pairing students within the same university. |
| `SomeoneYouMayKnow` | `someoneYouMayKnowEnabled` | `false` | Contact book matching discovering real-world classmates on Fizz. |
| `FriendsAndMutualsFeed` | `friendsAndMutualsFeedEnabled` | `false` | Dedicated sub-feed filtering posts exclusively to mutual contacts and friends. |
| `isDmScreenshotNotificationEnabled`| `mc.j0.u1` | `true` | Triggers `/chat/notify-screenshot` when a screenshot is taken in private DMs. |
| `maxVideoDurationSeconds` | `mc.j0.C1` | `15` | Maximum allowable video clip duration in the camera capture composer. |

---

### Category 8: Onboarding, Spotlight, & Review Prompts

| Feature Flag / Enum Constant | Remote Config Key | Default | Description & Functionality |
|---|---|---|---|
| `OnboardingSpotlight` | `onboardingSpotlightEnabled` | `false` | Interactive tutorial spotlighting core navigation tabs for new installs. |
| `spotlightSkipSteps` | `mc.j0.i1` | `false` | Permits skipping onboarding tutorial steps immediately. |
| `spotlightSkipButtonDelaySeconds` | `mc.j0.j1` | `0` | Delay timer before the "Skip" button becomes clickable in onboarding. |
| `LeaveReviewButton` | `showLeaveReviewButtonInSettings` | `false` | Surfaces "Leave a Review" redirect button to Google Play in Settings. |
| `fizz_boost_prompt` | SharedPreferences | N/A | One-time composer prompt nudging users to boost their post. |
| `fizz_gift_prompt` | SharedPreferences | N/A | Exponential backoff counter prompting users to gift Fizz+ after DM sends. |
| `fizz_notification_banner_prefs` | SharedPreferences | N/A | Cooldown manager for persistent "Notifications Off" warning banner (7 days). |
| `fizz_share_profile_dismissals` | SharedPreferences | N/A | Dismissal tracking for "Share Your Profile" promotional banner. |

---

### Category 9: Visual Diagnostics, Performance, & Metadata Overlays

| Feature Flag / Setting Key | Storage File / Class | Default | Description & Functionality |
|---|---|---|---|
| `feed_item_metadata` | `fizz_feed_item_metadata` / `s3` | Set | Chooses which backend metadata keys (`itemMetadata`) draw in the overlay. |
| `h1.Post` | `s3` / `g1` | Set | Enables real-time metadata overlay inspection on feed posts. |
| `h1.Announcement` | `s3` / `g1` | Set | Enables real-time metadata overlay inspection on campus announcements. |
| `ec.f.Pusher` | `ec.h.f12137a` | Buffer | Live circular buffer capturing WebSocket Pusher events and chat signals. |
| `ec.f.PushNotifications` | `ec.h.f12137a` | Buffer | Live circular buffer logging incoming FCM push notifications and payload parsing. |
| `ec.f.DecodingErrors` | `ec.h.f12137a` | Buffer | Captures Kotlinx serialization JSON parse failures with exact stack traces. |
| `ec.f.FeedPerformance` | `ec.h.f12137a` | Buffer | Measures pagination latency, view composition durations, and network roundtrips. |

---

### Category 10: Local State, Cache Domains, & Preference Stores

The local state resetter (`ResetLocalStateViewModel` / `ab.s` / `ab.t`) catalogs every preference file and cache directory across 6 architectural domains:

```
                                [ ResetLocalStateViewModel ]
                                              |
        +---------------+---------------+-----+---------+---------------+---------------+
        |               |               |                 |               |               |
        v               v               v                 v               v               v
  [ SessionAuth ] [ Onboarding ]    [ Nudges ]        [ Caches ]      [ Recents ]    [ Overrides ]
  - auth_tokens   - onboarding_     - notification_   - feed_disk_    - search_       - force_placement
  - phone_linked    markers           banner            cache           recents       - simulated_location
  - session_state - installed_      - public_profile_ - picker_data_  - search_       - simulate_feed
  - entitlements    version           cta               cache           filters       - spoof_user
                  - referral_       - disappearing_   - media_caches  - picker_       - user_property
                    attribution       tip               (Coil, feed_    recents       - remote_config
                                    - boost_prompt      video, voice) - marketplace_  - debug_flags
                                    - gift_prompt                     - browsing_loc  - feed_metadata
                                    - share_profile                   - recent_memes  - feed_debug
                                    - weekly_picks                    - recent_gifs   - mono_app
                                                                      - post_drafts   - analytics_id
```

| Domain (`ab.m`) | Preference / Cache Store | Description & Contents |
|---|---|---|
| **SessionAuth** | `fizz_encrypted_tokens` | Access and refresh JWT tokens; clearing signs out the installation. |
| **SessionAuth** | `fizz.auth_tier.has_linked_phone` | Clears phone-linked state to re-prompt phone linking landing screen. |
| **SessionAuth** | `cached_session_state.json` | Cold-start session state snapshot rendered before network responds. |
| **SessionAuth** | `cached_entitlements_status.json`| Subscription, credit balance, and purchase catalogue snapshot. |
| **Onboarding** | `fizz_onboarding_prefs` | Welcome screens, permission prompts, document proof, SYMK onboarding. |
| **Onboarding** | `fizz_installed_version` | Version comparison marker used to detect application upgrades. |
| **Onboarding** | `fizz_referral_attribution` | Deferred deep-link referral token redeemable during signup. |
| **Nudges** | `fizz_notification_banner_prefs`| 7-day cooldown timer for notification warning banner. |
| **Nudges** | `fizz_public_profile_cta` | Profile completion call-to-action prompt visibility state. |
| **Nudges** | `fizz_disappearing_tip` | Disappearing direct messages hint visibility state. |
| **Nudges** | `fizz_boost_prompt` | Composer one-time post boost prompt visibility state. |
| **Nudges** | `fizz_gift_prompt` | Post-send gift prompt exponential backoff and claim states. |
| **Nudges** | `fizz_share_profile_dismissals`| Share profile banner dismissal cooldowns. |
| **Nudges** | `fizz_performed_actions` | History of reported actions (`users/record-performed-action`). |
| **Nudges** | `fizz_weekly_picks_badge` | Tracking for "NEW!" badge on Weekly Picks feed. |
| **Caches** | `filesDir/feed_cache` | Disk-cached feed JSON payloads rendered during cold start. |
| **Caches** | `fizz_picker_data_cache` | Cached GIF and meme picker catalogs and user favorites. |
| **Caches** | `feed_media` / `feed_video` | Coil image memory/disk cache, ExoPlayer video cache, voice notes. |
| **Recents** | `fizz_search_prefs` | Recent search queries in discovery. |
| **Recents** | `fizz_search_filters` | Fizz+ age and gender search filters. |
| **Recents** | `fizz_picker_recent_searches` | Recent searches inside GIF/meme picker dialogs. |
| **Recents** | `fizz_marketplace_search_prefs`| Recent search queries in campus marketplace. |
| **Recents** | `fizz_browsing_location` | Recent explore locations and campuses browsed. |
| **Recents** | `fizz_recent_memes` / `gifs` | Recent meme templates and GIF attachments used. |
| **Recents** | `fizz_post_drafts` & `filesDir/drafts`| Unsent post drafts and associated staged media files. |
| **Overrides** | `fizz_force_placement` | Simulated ad campaign and placement overrides. |
| **Overrides** | `fizz_simulated_location` | Active spoofed coordinates and saved campus presets. |
| **Overrides** | `fizz_simulate_feed` | The 13 feed simulation parameters and demo mode switches. |
| **Overrides** | `fizz_spoof_user` | Active spoofed user UUID and saved spoof history. |
| **Overrides** | `fizz_user_property_overrides` | Local overrides for admin, superadmin, moderator, and bank roles. |
| **Overrides** | `fizz_remote_config_overrides` | Local overrides for the 19 `p` feature flag switches. |
| **Overrides** | `fizz_debug_flags` | Layout debuggers, FPS counter, and diagnostic switches. |
| **Overrides** | `fizz_mono_app_settings` | Cloudrun sandbox toggle and custom backend URLs. |
| **Overrides** | `analytics.identity` | Mixpanel identity and anonymous UUID tracking state. |
| **Overrides** | `analytics.events` | Offline disk queue for client event uploads (`ra.da`). |

---

## Reverse Engineering & Patching Strategies

### Strategy A: Unlocking Mobile Studio on Any Build
Mobile Studio is fully compiled into production release APKs, but access is gated by `AppViewModel.f7884c0` (evaluating `currentSession.isSuperAdmin` or `spoofUser.isSpoofing`). To permanently unlock Mobile Studio so that the volume key sequence works on any account:

1. **Option 1 (Dalvik Patch on Superadmin Check):**
   Patch `AppViewModel.f7884c0` to observe `Boolean.TRUE` instead of combining `isSuperAdmin` and `spoof.b()`. In Dalvik bytecode:
   ```smali
   # In AppViewModel constructor or getter for f7884c0:
   const/4 v0, 0x1
   invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
   move-result-object v0
   ```

2. **Option 2 (Hardware Listener Patch in `MainActivity`):**
   In `MainActivity.onKeyDown`, remove the condition checking `this.m0` so that any volume key press immediately invokes `j1Var.f4612a.r(il.z.f16838a)`.

---

### Strategy B: Forcing Feature Flags via `fizz_remote_config_overrides`
To force any of the 19 feature flags cataloged in `com.fizzsocial.fizz.data.local.p` (e.g. `Marketplace`, `VoiceNotePosts`, `MemesV2`, `PublicProfiles`) without modifying Dalvik bytecode:

Inject default XML entries into the target APK's `shared_prefs/fizz_remote_config_overrides.xml` during app initialization or via a resource patch:
```xml
<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
<map>
    <boolean name="Marketplace" value="true" />
    <boolean name="VoiceNotePosts" value="true" />
    <boolean name="MultiMedia" value="true" />
    <boolean name="MemesV2" value="true" />
    <boolean name="PublicProfiles" value="true" />
    <boolean name="CommunityTab" value="true" />
    <boolean name="FriendsAndMutualsFeed" value="true" />
</map>
```
Alternatively, in Dalvik bytecode, patch `z5.a(mc.j0)` to unconditionally return `true` for target enum constants.

---

### Strategy C: Permanent Fizz+ & Gold Lifetime Unlock
To unlock Fizz+ and Fizz+ Gold without purchasing:

1. **Preference Level:** Write `subscriptionStatus = "Active"` and `lifetimeMemberStatus = "Active"` to `fizz_subscription_status_override.xml`.
2. **Bytecode Level (`m6.a`):**
   Patch `m6.a(m6)` (the check evaluating whether subscription override is permitted) to unconditionally return `true`:
   ```smali
   .method public static final a(Lcom/fizzsocial/fizz/data/local/m6;)Z
       .registers 2
       const/4 v0, 0x1
       return v0
   .end method
   ```
3. **Session Level (`z5.a`):**
   Ensure `j0.C0` (`isIapEnabled`) and `j0.D0` (benefits set) contain `tc.l.Boost`, `tc.l.CustomIcon`, `tc.l.Explore`, and `tc.l.SearchFilters`.

---

### Strategy D: Neutralizing Screenshot Surveillance
In `mc.j0` (or in `ConversationViewModel`), force `isDmScreenshotNotificationEnabled` (`j0.u1`) to return `false`, or neutralize `jc.l2.q` from dispatching the POST request to `/chat/notify-screenshot`. This is already shipped in the repository's `RemoveTrackingAndAnalyticsPatch`.

---

## Shipped Patch Cross-Reference

The Morphe patches developed in this repository directly interact with the feature flag and telemetry architecture cataloged above:

| Feature / Architecture Area | Target Mechanism | Shipped Morphe Patch | Source File |
|---|---|---|---|
| **DM Screenshot Surveillance** | Neutralizes `/chat/notify-screenshot` alert dispatch | [Remove Tracking & Analytics](../fizz/patches.md#patch-remove-tracking-and-analytics) | `patches/.../fizz/tracking/RemoveTrackingAndAnalyticsPatch.kt` |
| **First-Party Event Uploads** | Disables `ra.da` batch event uploads to `/app/track-client-events` | [Remove Tracking & Analytics](../fizz/patches.md#patch-remove-tracking-and-analytics) | `patches/.../fizz/tracking/RemoveTrackingAndAnalyticsPatch.kt` |
| **Third-Party Telemetry SDKs** | Blocks Mixpanel (`dk.u`), Airbridge (`sa.n`), Adjust (`sa.b`), Sentry (`io.sentry`) | [Remove Tracking & Analytics](../fizz/patches.md#patch-remove-tracking-and-analytics) | `patches/.../fizz/tracking/RemoveTrackingAndAnalyticsPatch.kt` |
| **Advertising Identifier (AAID)**| Neutralizes `sa.k.a` querying Google Advertising ID | [Remove Tracking & Analytics](../fizz/patches.md#patch-remove-tracking-and-analytics) | `patches/.../fizz/tracking/RemoveTrackingAndAnalyticsPatch.kt` |
| **Play Integrity / PairIP** | Bypasses `com.pairip.licensecheck.LicenseClient` | [Remove Tracking & Analytics](../fizz/patches.md#patch-remove-tracking-and-analytics) | `patches/.../fizz/tracking/RemoveTrackingAndAnalyticsPatch.kt` |
| **Native Typography & Emojis** | Replaces Noto emoji engine with iOS Apple Color Emoji via `EmojiFontBridge` | [Replace Emoji Font With iOS](../fizz/patches.md#patch-replace-emoji-font-with-ios) | `patches/.../fizz/customization/ReplaceEmojiFontWithIosPatch.kt` |
