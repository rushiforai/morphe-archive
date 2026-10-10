# Pinterest 14.38.0: Advertising delivery

Inspected October 9, 2026. Part of the [factory app audit](pinterest-14.38.0-audit.md). Source baseline `932f0c5`. See the audit entry point for the APK identity, live observations, and evidence limits.

## Advertising delivery and feed controls

Pinterest 14.38.0 contains connected paths for Pinterest promotions and third-party ads. The original APK's models, request helpers and SDK callers establish the client architecture described here. Factory browsing showed promoted image and video placements in Home, sponsored shopping tiles in search, and sponsored related shopping beneath an ordinary pin. The [runtime study](pinterest-14.38.0-runtime.md) captured attributable application traffic and measured media activity. Its encrypted packets do not establish the account's active ad partners, request payloads or server-side auction behavior. Advertiser names visible on screen do not identify the SDK serving the ad.

HushPinterest currently controls three stages: decoded item lists, four native ad views and Google Mobile Ads startup. These stages have different effects. Removing an item from a list prevents selected presentation work after the content has arrived. It doesn't undo the request that fetched it, prove that all impression events were suppressed or stop every possible SDK path.

### Native delivery pipeline

The following identities were read from the original 14.38.0 APK. They're useful for tracing this version, but the obfuscated names should not become fingerprints by themselves.

| Stage | Native path and evidence | Consequence for patch work |
|---|---|---|
| Third-party configuration | `com.pinterest.repository.pin.PinService.getThirdPartyAdConfigSuspend(Continuation)` declares `thirdpartyad/config/`. `Lr10/b;->a(Lm53/c;)Ljava/lang/Object;` calls it and unwraps its `NetworkResponse`. | This is a configuration request, separate from the content feed and event uploads. |
| Configuration cache | `Lr10/b;->a` serializes the `com.pinterest.api.model.oo` result to `THIRD_PARTY_AD_CONFIG`, stores an expiry derived from the configuration and records the current app version code. `Lo10/c;->b(Lm53/c;)Ljava/lang/Object;` checks the cached version and expiry before using or refreshing it. | Blocking the configuration URL alone doesn't establish that a retained configuration is inactive. |
| GMA initialization | `Li00/i;->c()V` checks the GMA experiment, registers/checks consent for enum `Lgq2/b;->GOOGLE_MOBILE_ADS`, checks readiness and uses atomic guards before starting initialization work. Direct callers include `MainActivity.onCreate(Bundle)` and `Lcv/i;->run()V`. | This is the startup entry currently guarded by Hide ads. Consent handling and native readiness must remain intact when the switch is off. |
| Request preparation | `Li00/f;->c(Li00/m;Ljava/util/Map;)V` removes old `x-pinterest-gma` entries through `x-pinterest-gma-5`, then can repopulate them with data selected for the current surface. It also adds `x-pinterest-webview-user-agent`. `Li00/f;->e(Li00/m;String)String` can gzip and Base64-encode the prepared value according to configuration. | These are specific ad-related request fields. Their existence doesn't justify modifying unrelated headers, cookies or authentication. The semantic contents of every token haven't been decoded here. |
| Content-surface callers | The request helper is called by the home model, `OrganicPinCloseupPresenter.maybeAddGmaHeadersForRelatedPinsPagedList`, `PromotedPinCloseupPresenter.maybeAddGmaHeaders` and board new-ideas paths. `Li00/f;->d(Li00/m;LinkedHashMap)V` also handles `SEARCH_TEXT_ADS` and is called by `OrganicPinCloseupPresenter.maybeAddGmaHeadersForSearchTextAds`. Enum `Li00/m` names HOME, SEARCH, RELATED and BOARD_IDEAS. | GMA preparation participates in ordinary content surfaces. Blocking an entire feed endpoint would also discard organic content. |
| Ad-bearing model | Pin model `com.pinterest.api.model.pe` has `ad_data`, `is_promoted`, `is_third_party_ad` and `ad_destination_url`. `ad_data.third_party` contains an encoded `ad_payload`, `content_type`, verification data and DSP metadata. | Model filtering provides a common interception point after decoding, including when an ad has a payload but no true Boolean marker. |
| SDK loading | `Li00/i;->f(...)V` and `->g(...)V` check `Li00/i;->e()Z` and readiness, read `Pin.c4().G0()`, inspect `content_type` for `application/gzip`, obtain `ad_payload` through `model/g.j()` and pass the result toward `ads_mobile_sdk` loading. `Li00/i.e` checks SDK-start state and the experiment. | This is a traced SDK integration, not an inference from a bundled package name. The startup guard and the later load gate are distinct opportunities. |

The connected path is therefore:

```text
Third-party configuration and cached state
  -> consent, experiment and SDK readiness
  -> ad-related data attached to Pinterest content requests
  -> Pinterest models containing promotion metadata or third-party payloads
  -> native list/presenter and SDK loading paths
  -> views and separate measurement callbacks
```

`ad_data.third_party_v2` also exists. Its consumers were not traced in this pass. That is a specific follow-up target, not evidence that a second renderer bypasses the current filter.

### Content and commercial endpoints

These are API declarations in the original APK. The table distinguishes content, configuration and deliberate user actions so that a future blocker doesn't treat every commercial-looking route as telemetry.

| Path | 14.38.0 service anchor | Role |
|---|---|---|
| `feeds/homepins/` | `com.pinterest.feature.home.model.k.b(Map,Map)` and `.d(Map,Map)` | Ordinary home content |
| `feeds/homevideopins/` | Same owner `.a(Map,Map)` and `.m(Map,Map)` | Video home content |
| `search/pins/` | `Lzm2/b;->h(String,boolean,boolean,String,Continuation)` | Ordinary search results |
| `thirdpartyad/config/` | `PinService.getThirdPartyAdConfigSuspend` | Third-party ad configuration |
| `boards/{boardId}/deal_ads/` | `Lrl2/e;->n(String,String,String,String,String)` | Dedicated board ad-related content |
| `premiere_ad/videos/` | `Lkd1/d;->a(String,Continuation)` | Premiere-ad video content |
| `boards/{boardId}/shopping/feed/modularized/` | `Lrl2/e;->k(...)` | Shopping modules |
| `aom/closeup/pins/{pinUid}/modules/` | `PinService.getShopTheLookFeed` | Closeup commercial modules |
| `visual_search/stela/pins/{pinUid}/module/` | `PinService.loadCloseupShoppingModule` | Additional closeup shopping content |
| `thirdpartyad/{pinId}/report/` | `PinService.reportThirdPartyAdSuspend` | A user's report action |
| `thirdpartyad/{pinUid}/feedback/` and `promoted/{pinUid}/feedback/` | `Lt70/b;->b(...)` and `->h(...)` | A user's feedback action |
| `/v3/ad_previews/` | `PinBoostApiClientService.getAdPreviews` | Advertiser preview tools |
| `analytics/pins/{pin_id}/mobile/metrics/` and `analytics/pins/{pin_id}/paid_details/` | `Lz70/a;->a(...)`, `->c(...)`, `->d(...)` | Creator metrics reads |

In particular, an `analytics` path can retrieve a user's metrics. It is not automatically a passive upload. Report, feedback and undo actions should retain their native behavior.

### Model fields worth preserving as anchors

The serialized annotation is `Lmp/b;` in 14.38.0. HushPinterest avoids depending on this obfuscated annotation name by finding a String-returning `value()` method. It caches field maps per native model class and walks superclasses. See [ModelFields.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/ModelFields.java#L35).

| Native field | JSON name | Type and use |
|---|---|---|
| `pe.C1` | `is_promoted` | Boxed Boolean paid-placement marker |
| `pe.J1` | `is_third_party_ad` | Boxed Boolean third-party marker |
| `pe.d` | `ad_data` | `com.pinterest.api.model.e`, the ad payload holder |
| `pe.e` | `ad_destination_url` | String destination marker |
| `pe.C3` | `tracking_params` | Opaque String tracking metadata |
| `pe.H1` | `is_shoppable` | Boxed Boolean product classification |
| `pe.m` | `ai_disclosures` | List of native AI disclosures |
| `n1.y` | `featured_board_metadata` | Typed featured-board metadata |
| `il.t` | `story_type` | Enum `com.pinterest.api.model.il$c`, including `SHOPPING_SPOTLIGHT` |
| `p3.d`, `z5.d` | `story_type` | String form on other models |

The ad-data model contains `third_party`, `third_party_v2`, `ad_attribution_text`, `campaign_objective_type`, `creative_type`, `destination_type`, `disclosure_label`, `disclosure_url`, `grid_cta_data`, `merchant_data` and `local_ads_serving_metadata`. Its first third-party model, `com.pinterest.api.model.g`, has `ad_payload`, `ad_verifications`, `client_type`, `content_type`, `dsp_source`, `extensions` and `sideswipe_pin`.

These names document the schema. They do not prove a particular response populated every field, collected a location or used a particular DSP.

### Existing patch interception map

| Control | Fingerprint and edit | Current coverage boundary |
|---|---|---|
| Shared feed filter | Match `toString()` text `, _items count:`, `PagedResponse(bookmark=` and `ModelListWithBookmark(models=`. Inject `FeedFilter.filter(List)` at the start of every implemented constructor with exactly one List parameter. | Handles top-level elements passed to the three recognized holder families. It doesn't recursively inspect arbitrary nested objects. |
| Ad-only views | Rewrite or add `setVisibility(int)` and `onMeasure(int,int)` on four named native view classes. | Forces GONE and zero measurement while active. A new ad renderer requires its own proven target. |
| Google Mobile Ads | Find one nonstatic no-argument void method reading enum field `GOOGLE_MOBILE_ADS`; insert `Ads.skipGoogleAds()` and an early return. | Controls an initialization attempt. It does not actively shut down an existing SDK instance or replay a skipped attempt when a switch changes. |

The holder identities are `e52.d`, `gu1.l0` and `bm2.c` in 14.38.0. The first holder has two eligible constructors in 14.38.0. A constructor's list register is discovered from its parameter types, so added non-list parameters don't require a fixed register number.

The four ad views are `TextAdView`, `LegacyPromotedCloseupActionButtonModule`, `PromotedPinCloseupFloatingActionBarModule` and `BoardSponsoredCuratorView`. Their complete names are in [FeedListAnchors.kt](../patches/src/main/kotlin/app/morphe/patches/pinterest/ads/FeedListAnchors.kt#L43). An inherited final method prevents an unsafe override.

Read [FeedListHookPatch.kt](../patches/src/main/kotlin/app/morphe/patches/pinterest/ads/FeedListHookPatch.kt#L45), [HideAdsPatch.kt](../patches/src/main/kotlin/app/morphe/patches/pinterest/ads/HideAdsPatch.kt#L72) and [FeedFilter.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/FeedFilter.java#L31) before changing these sites.

Missing holders are warned and skipped. Zero remaining holders refuses the shared hook. The `feedAds` capability is true when at least one holder family installs; `adViews` is true when at least one ad view installs. Those are coarse coverage flags. The fixture checks require all three holder families and all four views on declared builds, but a partial future build needs its warning details preserved.

### Exact filter behavior

Hide ads starts on. It removes a top-level item when any of these conditions matches:

* Boolean true in `is_promoted`, `is_promoted_pin`, `is_promoted_carousel_pin`, `is_promoted_video`, `is_third_party_ad`, `is_active_ad`, `is_cpc_ad`, `is_downstream_promotion`, `promoted_is_lead_ad`, `promoted_is_catalog_carousel_ad`, `promoted_is_max_video`, `promoted_is_quiz` or `promoted_is_showcase`.
* Nonblank String in `pin_promotion_id`, `ad_destination_url` or `promoted_android_deep_link`.
* Nonnull `ad_data`, even if that object contains no populated fields.
* String `story_type` equal to `shopping_spotlight`.

The list includes compatibility markers, not a claim that every marker exists on the current Pin model. `Boolean.TRUE` is required for flags; numeric and String lookalikes don't qualify. `promoter`, `sponsorship`, eligibility fields and `has_been_promoted` are deliberately excluded because ordinary pins can carry them. Preserve those negative cases. See [Ads.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/Ads.java#L23).

Hide shopping starts off and is broader than paid-ad filtering. It recognizes `is_shoppable`, `is_sponsored`, `featured_board_metadata` and 17 commercial story types. It accepts String story values and enum names, then compares them using `Locale.ROOT`. Organic product pins can be shopping content. See [Shopping.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/Shopping.java#L27).

Hide AI-labeled pins starts off. It requires a nonempty `ai_disclosures` List. It doesn't infer AI from an image, caption or creator. Unlabeled content stays. See [AiPins.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/AiPins.java#L17).

The shared filter keeps order and object identity for retained entries. It returns the original List when nothing changes and allocates a replacement only after the first removal. An unexpected exception returns the original page. Removal counters are assigned to the first matching family in the order ads, AI, shopping; they don't represent unique pins or network bytes saved. Counts are currently published during the loop, so a later exception can restore the original page after a removal has already been counted. See [FeedFilter.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/FeedFilter.java#L45).

### Measurement is a separate control

Disable analytics targets nine annotated Pinterest paths: `v3/callback/event/`, `v3/callback/ping/`, `v3/callback/post_install/`, `v3/callback/track_funnel/{event}/`, `v3/register/track_action/{event}/`, `v4/log/mobile_perf/`, `callback/client_network_error/`, `log/` and `track/`.

It also skips selected startup tasks, including `TAG_ADS_OPEN_MEASUREMENT_SDK_INIT`, `TAG_ADS_APP_INSTALL_LOG` and `TAG_APPSFLYER_INIT`; intercepts AppsFlyer and Bugsnag URL transports; refuses Google Engage calls through the SDK's native unavailable-service path; and changes Firebase/Google Analytics manifest metadata. New endpoint names and new transports don't automatically enter this coverage. See [DisableAnalyticsPatch.kt](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/DisableAnalyticsPatch.kt#L58) and [Analytics.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/Analytics.java#L35).

The upload wrappers return native completed response shapes instead of introducing failures that could trigger retries. A new suppressed request needs the same response-contract analysis. Don't reuse a completed telemetry response for a content or configuration service without tracing its consumers.

The APK also contains `AdsQcmAnalytics$QcmFeedImpressionPayload` with `ad_destination_url`, and `AdsClickthroughComparisonLogger$ClickthroughComparisonPayload` with `pin_promotion_id`. These are useful anchors for a measurement trace. Their names alone don't establish which upload path eventually handles them.

### Confirmed limits and refresh behavior

The typed spotlight mismatch is narrow and confirmed by the native schema and current Java comparison. `il.t` is an enum, while [Ads.isAd](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/Ads.java#L74) compares `story_type` directly to a String. An `il` item whose only qualifying signal is enum `SHOPPING_SPOTLIGHT` won't match that branch. [Shopping.isShopping](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/Shopping.java#L45) does recognize the enum when its separate switch is on. String story models remain supported by Hide ads. A live paid typed-spotlight item wasn't captured, so this finding doesn't establish a visible ad leak in the surveyed account.

The GMA lifecycle constraint is also specific. The Hide ads runtime helper decides whether an initialization call can proceed. Changing the switch doesn't itself stop an initialized SDK or re-invoke a skipped call. Native code may attempt initialization again through its own callers. A restart provides a defined initial state for comparison; live toggling needs separate acceptance on an account where GMA is enabled. The current settings summary describes filtering and collapsed panels without this qualification. See [Ads.skipGoogleAds](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/Ads.java#L93) and the [Feed settings row](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/settings/HushPinterestPreferenceFragment.java#L250).

Pause makes runtime switches answer off. Future list constructions retain native entries, and future visibility/measurement calls receive their original arguments. It doesn't recreate a page that was already filtered. Disable analytics' skipped startup tasks also need a later native startup attempt, while its manifest metadata stays changed until the APK is patched again without those changes. See [Settings.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/settings/Settings.java#L27) and [PatchFamily.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/settings/PatchFamily.java#L33).

### Prioritized patch work

| Priority | Work item | Proposed hook or investigation | Acceptance conditions |
|---|---|---|---|
| P1 | Make spotlight handling consistent with its native type. | Normalize the exact known enum name and String value through a narrow classifier helper. Keep paid placement and general shopping choices separate. | With only Hide ads active, a fixture-shaped typed spotlight matches the intended policy. Editorial/unknown enums remain. String behavior, Pause and the shopping switch remain independent. Record live visibility separately. |
| P1 | Establish per-surface ad coverage. | Compare factory and patched home, search, related pins, boards, closeup overlays, video, carousel and third-party placements. Use bounded classifier reasons rather than IDs or payload logs. | Each served placement has an active/off/Pause result, pagination and gap checks. A surface that served no ad remains unverified. Visual removal and measured request suppression are reported separately. |
| P1 | Define GMA switch transitions. | Clarify restart behavior first. Trace a shared native load gateway before considering a live guard; preserve callback completion and native readiness. | Cover on-at-launch, off-at-launch, on-after-start, off-after-skip and Pause. No blank containers, retry loop or broken organic feed. A GMA-ineligible run doesn't establish these results. |
| P2 | Reduce targeted GMA request signals. | Investigate a guarded return in the uniquely matched `Li00/f.c` and `.d` helpers after native removal of the five GMA keys. Trace cached signal queues and preserve all ordinary request fields. | Active filtering omits targeted GMA fields on fresh/cached requests. Off/Pause restores native preparation. Authentication, media and pagination work. This alone isn't described as blocking Pinterest's own promotions. |
| P2 | Trace `third_party_v2`. | Map `model/zo`, its getters and renderer/SDK consumers. Retain generic `ad_data` list filtering. | Fixture call sites and a served sample establish reachability before adding a new guard. Ordinary content and inactive settings retain native behavior. |
| P2 | Expose partial coverage precisely. | Track each holder family and view separately, including every eligible constructor and method. | Missing targets produce a concrete partial-coverage result. Zero holders still refuses. A single installed holder isn't reported as full feed coverage. |
| P2 | Check nested commercial modules and filtered empty pages. | Trace typed carousel/module list owners and paging consumers. Avoid recursive reflection over arbitrary models. | Keep order, listeners and ordinary nested content. Empty modules collapse. Any refill is bounded, preserves bookmarks and can't loop or skip organic entries. These are investigations, not confirmed rendering bugs. |
| P2 | Commit removal counts after successful filtering. | Accumulate bounded counts during a page pass and publish them after a successful result. | A later model failure produces no false removal count for restored items. Diagnostics contain no IDs, URLs or model values. |
| P2 | Detect schema drift before release. | Add fixture contracts for actual field types and annotation coverage, including enum stories and payload-only ads. | A renamed/removed marker is visible during compatibility review. Historical promotion metadata remains a negative case. Unknown models remain usable. |
| P3 | Offer narrower shopping choices. | Consider independent choices for product pins, shopping stories and featured boards using existing typed classifications. | Organic product pins can remain while modules are hidden. Paid filtering still works independently. Defaults, Pause and settings imports stay predictable. |

### Existing verification sources

[FeedFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/pinterest/ads/FeedFixtureTest.kt#L40) checks native holder uniqueness, all three holder families, all four views, GMA guard insertion and capability flags. [FeedPatchesTest.kt](../patches/src/test/kotlin/app/morphe/patches/pinterest/ads/FeedPatchesTest.kt#L53) covers partial target sets and refusal when every holder is absent.

[FeedFilterTest.java](../extensions/pinterest/src/test/java/app/hushpinterest/extension/pinterest/ads/FeedFilterTest.java#L128) covers common markers, order, AI coexistence, null/empty input, Pause, missing capabilities and measurement helpers. Its story stand-in uses a String, so it doesn't cover the typed Ads spotlight case. [ShoppingTest.java](../extensions/pinterest/src/test/java/app/hushpinterest/extension/pinterest/ads/ShoppingTest.java#L45) does cover both String and enum stories for the shopping classifier. [ShoppingFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/pinterest/ads/ShoppingFixtureTest.kt#L21) checks corresponding native schema markers.

These are existing source checks, not a new test-run result. They establish where regression checks belong. A passing fixture suite still cannot prove server experiment assignment, live serving frequency, absence of every impression request or end-to-end network privacy.
