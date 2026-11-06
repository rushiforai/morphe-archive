# Pinterest 14.39.0: Advertising delivery

Traced on Pinterest 14.38.0 on October 9, 2026 and remapped to 14.39.0 (version code 14398020) on October 10. Part of the [factory app audit](pinterest-14.39.0-audit.md). Source baseline `6383001`. See the audit entry point for the APK identity, live observations, and evidence limits.

## Advertising delivery and feed controls

Pinterest 14.39.0 contains connected paths for Pinterest promotions and third-party ads. The original APK's models, request helpers and SDK callers establish the client architecture described here. Factory browsing on 14.38.0 showed promoted image and video placements in Home, sponsored shopping tiles in search, and sponsored related shopping beneath an ordinary pin. The [runtime study](pinterest-14.39.0-runtime.md) captured attributable application traffic and measured media activity. Its encrypted packets do not establish the account's active ad partners, request payloads or server-side auction behavior. Advertiser names visible on screen do not identify the SDK serving the ad.

HushPinterest currently controls four stages: decoded item lists, four native ad views, Google Mobile Ads startup and (from 14.43.0) the consent check Meta's Audience Network waits on. These stages have different effects. Removing an item from a list prevents selected presentation work after the content has arrived. It doesn't undo the request that fetched it, prove that all impression events were suppressed or stop every possible SDK path.

### Native delivery pipeline

The following identities were read from the original 14.39.0 APK, with the 14.38.0 name in parentheses where it changed. They're useful for tracing this version, but the obfuscated names should not become fingerprints by themselves. Behavior descriptions were traced on 14.38.0. On 14.39.0 each identity was found again by the same string, annotation or caller and checked for the same shape, not traced again instruction by instruction.

| Stage | Native path and evidence | Consequence for patch work |
|---|---|---|
| Third-party configuration | `com.pinterest.repository.pin.PinService.getThirdPartyAdConfigSuspend(Continuation)` declares `thirdpartyad/config/`. `Lx10/b;->a(Lm63/c;)Ljava/lang/Object;` (`Lr10/b;`) calls it and unwraps its `NetworkResponse`. | This is a configuration request, separate from the content feed and event uploads. |
| Configuration cache | `Lx10/b;->a` serializes the `com.pinterest.api.model.mp` (`oo`) result to `THIRD_PARTY_AD_CONFIG`, stores an expiry derived from the configuration and records the current app version code. `Lu10/c;->b(Lm63/c;)Ljava/lang/Object;` (`Lo10/c;`) checks the cached version and expiry before using or refreshing it. | Blocking the configuration URL alone doesn't establish that a retained configuration is inactive. |
| GMA initialization | `Lo00/j;->c()V` (`Li00/i;`) checks the GMA experiment, registers/checks consent for enum `Ler2/b;->GOOGLE_MOBILE_ADS` (`Lgq2/b;`), checks readiness and uses atomic guards before starting initialization work. Direct callers include `MainActivity.onCreate(Bundle)` and `Liv/h;->run()V` (`Lcv/i;`). | This is the startup entry currently guarded by Hide ads. Consent handling and native readiness must remain intact when the switch is off. |
| Request preparation | `Lo00/f;->c(Lo00/o;Ljava/util/Map;)V` (`Li00/f;`) removes old `x-pinterest-gma` entries through `x-pinterest-gma-5`, then can repopulate them with data selected for the current surface. It also adds `x-pinterest-webview-user-agent`. `Lo00/f;->e(Lo00/o;String)String` can gzip and Base64-encode the prepared value according to configuration. | These are specific ad-related request fields. Their existence doesn't justify modifying unrelated headers, cookies or authentication. The semantic contents of every token haven't been decoded here. |
| Content-surface callers | The request helper is called by the home model, `OrganicPinCloseupPresenter.maybeAddGmaHeadersForRelatedPinsPagedList`, `PromotedPinCloseupPresenter.maybeAddGmaHeaders` and board new-ideas paths. `Lo00/f;->d(Lo00/o;LinkedHashMap)V` also handles `SEARCH_TEXT_ADS` and is called by `OrganicPinCloseupPresenter.maybeAddGmaHeadersForSearchTextAds`. Enum `Lo00/o` (`Li00/m`) names HOME, SEARCH, RELATED, BOARD_IDEAS, GULP and NEWS_HUB. | GMA preparation participates in ordinary content surfaces. Blocking an entire feed endpoint would also discard organic content. |
| Ad-bearing model | Pin model `com.pinterest.api.model.oe` (`pe`) has `ad_data`, `is_promoted`, `is_third_party_ad` and `ad_destination_url`. `ad_data.third_party` contains an encoded `ad_payload`, `content_type`, verification data and DSP metadata. | Model filtering provides a common interception point after decoding, including when an ad has a payload but no true Boolean marker. |
| SDK loading | `Lo00/j;->f(...)V` and `->g(...)V` check `Lo00/j;->e()Z` and readiness, read `Pin.d4().G0()` (`c4()`), inspect `content_type` for `application/gzip`, obtain `ad_payload` through `model/g.j()` and pass the result toward `ads_mobile_sdk` loading. `Lo00/j.e` checks SDK-start state and the experiment. | This is a traced SDK integration, not an inference from a bundled package name. The startup guard and the later load gate are distinct opportunities. |
| Meta Audience Network (14.43.0) | 14.43.0 ships Meta's SDK as `assets/audience_network/classes.dex`, loaded at runtime, so the patcher and the verifiers never see it. `Ln10/l;` manages it from the root dex. `f(String, pe, p10/f)` fills a Meta slot only after `Lts2/c;->a(Lss2/b;)Z` says consent is given for `Lss2/b;->META_AUDIENCE_NETWORK`. On a no it fails the slot as `consent_revoked`, and `l` registers an empty `META` bidder token through `PinService.registerThirdPartyClientTokens`. `Lp10/d;` builds the `NativeAd` and runs the SDK's init. | Hide ads answers that check no for the Meta vendor alone, at its first instruction, so Pinterest takes the path it already takes when someone turns that consent off. Every other vendor gets Pinterest's answer, and nothing changes with the switch off. The patch finds the check by shape (the one instance method taking an enum that declares `META_AUDIENCE_NETWORK` and returning a boolean) and skips with a warning if there isn't exactly one. |

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

| Path | 14.39.0 service anchor | Role |
|---|---|---|
| `feeds/homepins/` | `com.pinterest.feature.home.model.k.b(Map,Map)` and `.d(Map,Map)` | Ordinary home content |
| `feeds/homevideopins/` | Same owner `.a(Map,Map)` and `.k(Map,Map)` (`.m`) | Video home content |
| `search/pins/` | `Lxn2/b;->h(String,boolean,boolean,String,Continuation)` (`Lzm2/b;`) | Ordinary search results |
| `thirdpartyad/config/` | `PinService.getThirdPartyAdConfigSuspend` | Third-party ad configuration |
| `boards/{boardId}/deal_ads/` | `Lpm2/e;->p(String,String,String,String,String)` (`Lrl2/e;->n`) | Dedicated board ad-related content |
| `premiere_ad/videos/` | `Lwd1/d;->a(String,Continuation)` (`Lkd1/d;`) | Premiere-ad video content |
| `boards/{boardId}/shopping/feed/modularized/` | `Lpm2/e;->I(...)` and `->z(...)`, two methods with this path (`Lrl2/e;->k(...)`) | Shopping modules |
| `aom/closeup/pins/{pinUid}/modules/` | `PinService.getShopTheLookFeed` | Closeup commercial modules |
| `visual_search/stela/pins/{pinUid}/module/` | `PinService.loadCloseupShoppingModule` | Additional closeup shopping content |
| `thirdpartyad/{pinId}/report/` | `PinService.reportThirdPartyAdSuspend` | A user's report action |
| `thirdpartyad/{pinUid}/feedback/` and `promoted/{pinUid}/feedback/` | `Ly70/c;->b(...)` and `->f(...)` (`Lt70/b;->b` and `->h`) | A user's feedback action |
| `/v3/ad_previews/` | `PinBoostApiClientService.getAdPreviews` | Advertiser preview tools |
| `analytics/pins/{pin_id}/mobile/metrics/` and `analytics/pins/{pin_id}/paid_details/` | `Le80/a;->a(...)`, `->c(...)`, `->d(...)` (`Lz70/a;`) | Creator metrics reads |

In particular, an `analytics` path can retrieve a user's metrics. It is not automatically a passive upload. Report, feedback and undo actions should retain their native behavior.

### Model fields worth preserving as anchors

The serialized annotation is still `Lmp/b;` in 14.39.0. HushPinterest avoids depending on this obfuscated annotation name by finding a String-returning `value()` method. It caches field maps per native model class and walks superclasses. See [ModelFields.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/ModelFields.java#L35).

The pin model moved from `pe` to `oe`, and its field letters didn't change.

| Native field | JSON name | Type and use |
|---|---|---|
| `oe.C1` | `is_promoted` | Boxed Boolean paid-placement marker |
| `oe.J1` | `is_third_party_ad` | Boxed Boolean third-party marker |
| `oe.d` | `ad_data` | `com.pinterest.api.model.e`, the ad payload holder |
| `oe.e` | `ad_destination_url` | String destination marker |
| `oe.C3` | `tracking_params` | Opaque String tracking metadata |
| `oe.H1` | `is_shoppable` | Boxed Boolean product classification |
| `oe.m` | `ai_disclosures` | List of native AI disclosures |
| `n1.y` | `featured_board_metadata` | Typed featured-board metadata |
| `ll.t` (`il.t`) | `story_type` | Enum `com.pinterest.api.model.ll$c` (`il$c`), including `SHOPPING_SPOTLIGHT` |
| `p3.d`, `z5.d` | `story_type` | String form on other models |

The ad-data model contains `third_party`, `third_party_v2`, `ad_attribution_text`, `campaign_objective_type`, `creative_type`, `destination_type`, `disclosure_label`, `disclosure_url`, `grid_cta_data`, `merchant_data` and `local_ads_serving_metadata`. Its first third-party model, `com.pinterest.api.model.g`, has `ad_payload`, `ad_verifications`, `client_type`, `content_type`, `dsp_source`, `extensions` and `sideswipe_pin`.

These names document the schema. They do not prove a particular response populated every field, collected a location or used a particular DSP.

### Existing patch interception map

| Control | Fingerprint and edit | Current coverage boundary |
|---|---|---|
| Shared feed filter | Match `toString()` text `, _items count:`, `PagedResponse(bookmark=` and `ModelListWithBookmark(models=`. Inject `FeedFilter.filter(List)` at the start of every implemented constructor with exactly one List parameter. | Handles top-level elements passed to the three recognized holder families, and one level into each module that stays (`ModuleItems`). It doesn't go deeper than that. |
| Ad-only views | Rewrite or add `setVisibility(int)` and `onMeasure(int,int)` on four named native view classes. | Forces GONE and zero measurement while active. A new ad renderer requires its own proven target. |
| Google Mobile Ads | Find one nonstatic no-argument void method reading enum field `GOOGLE_MOBILE_ADS`; insert `Ads.skipGoogleAds()` and an early return. | Controls an initialization attempt. It does not actively shut down an existing SDK instance or replay a skipped attempt when a switch changes. |
| Meta Audience Network | Find the one nonstatic method that takes a single enum declaring `META_AUDIENCE_NETWORK` and returns a boolean (14.43.0's `ts2.c.a`); insert `Ads.skipMetaConsent(vendor)` at its start and return false when it says so. | Answers consent for Meta only, while the switch is on and HushPinterest isn't paused. An SDK Pinterest already started stays up until the next launch. |

The holder identities are `t52.d`, `tu1.h0` and `zm2.b` in 14.39.0 (`e52.d`, `gu1.l0` and `bm2.c` in 14.38.0). The first holder still has two eligible constructors. A constructor's list register is discovered from its parameter types, so added non-list parameters don't require a fixed register number.

The four ad views are `TextAdView`, `LegacyPromotedCloseupActionButtonModule`, `PromotedPinCloseupFloatingActionBarModule` and `BoardSponsoredCuratorView`. Their complete names are in [FeedListAnchors.kt](../patches/src/main/kotlin/app/morphe/patches/pinterest/ads/FeedListAnchors.kt#L43). An inherited final method prevents an unsafe override.

Read [FeedListHookPatch.kt](../patches/src/main/kotlin/app/morphe/patches/pinterest/ads/FeedListHookPatch.kt#L45), [HideAdsPatch.kt](../patches/src/main/kotlin/app/morphe/patches/pinterest/ads/HideAdsPatch.kt#L72) and [FeedFilter.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/FeedFilter.java#L31) before changing these sites.

Missing holders are warned and skipped. Zero remaining holders refuses the shared hook. The `feedAds` capability is true when at least one holder family installs; `adViews` is true when at least one ad view installs. Those flags stay coarse, so the patch also records each target in `HookTargets` ([HookTargets.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/HookTargets.java)): every holder with how many of its list constructors were hooked against the 14.39.0 count (`feedList` 2, `pagedResponse` 1, `modelList` 1), and every ad view with how many of `setVisibility` and `onMeasure` it holds. A holder with fewer list constructors than 14.39.0 is hooked where it can be and warned about. In a partial build the Feed page names each target that's missing or only partly in, and the report's `[PATCHES]` section lists every target with its count. Nested search Shopping ideas groups and related-pin shopping wrappers have no target of their own, and the report says so. The filter reaches the pins in them only through the module that carries them (see Pins inside a module below). FeedFixtureTest requires full target coverage on declared builds, and FeedPatchesTest covers the all-target and partial-target records.

### Exact filter behavior

Hide ads starts on. It removes a top-level item when any of these conditions matches:

* Boolean true in `is_promoted`, `is_promoted_pin`, `is_promoted_carousel_pin`, `is_promoted_video`, `is_third_party_ad`, `is_active_ad`, `is_cpc_ad`, `is_downstream_promotion`, `promoted_is_lead_ad`, `promoted_is_catalog_carousel_ad`, `promoted_is_max_video`, `promoted_is_quiz` or `promoted_is_showcase`.
* Nonblank String in `pin_promotion_id`, `pin_promotion_id_reformatted`, `campaign_id_reformatted`, `ad_destination_url` or `promoted_android_deep_link`. The 14.39.0 pin (`oe`) has no plain `pin_promotion_id`. It keeps the two reformatted ids instead, and they're the ones Pinterest's own ads debugger shows as Pin Promotion ID and Campaign ID.
* Nonnull `ad_data`, even if that object contains no populated fields.
* `story_type` that is the shopping spotlight: the String `shopping_spotlight`, or an enum constant named exactly `SHOPPING_SPOTLIGHT` (the typed `ll$c` form). Other enum values, editorial or unknown, don't qualify. See `Ads.isSpotlight`.

The list includes compatibility markers, not a claim that every marker exists on the current Pin model. `Boolean.TRUE` is required for flags; numeric and String lookalikes don't qualify. `promoter`, `sponsorship`, eligibility fields and `has_been_promoted` are deliberately excluded because ordinary pins can carry them. Preserve those negative cases. See [Ads.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/Ads.java#L23).

Hide shopping starts off and is broader than paid-ad filtering. It recognizes `is_shoppable`, `is_sponsored`, `is_eligible_for_pdp`, `featured_board_metadata` and 17 commercial story types. It accepts String story values and enum names, then compares them using `Locale.ROOT`. Organic product pins can be shopping content.

`is_eligible_for_pdp` was added for #6. A retailer's catalog pin (target.com, nordstromrack.com, entirebooks.com and so on) shows in Home with the shop's name and a tag icon, and readers take it for an ad. It carries no promotion flag, ad payload, promoter or advertiser id, and `is_shoppable` is null, so neither switch caught it. On the S22 (2026-10-10, Debug logging field dump of 172 Home pins) `is_eligible_for_pdp=true` was set on exactly the 45 retailer product pins and on no ordinary pin. Pinterest's own pin helpers (`xe`, getter `oe.M5()`) test it beside `is_promoted` (`Z5()`). It stays under Hide shopping, not Hide ads, because nothing marks those pins as paid. `is_eligible_for_related_products` still doesn't count. See [Shopping.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/Shopping.java#L27).

Hide AI-labeled pins starts off. In this 14.39.0 study it read only the nonempty `ai_disclosures` List above. Since the 14.40.0 fix (0.0.11) a pin counts when any of three native fields says so: a set `digital_media_source_type` (every value of that enum names trained algorithmic media or a synthetic performer, and one the app doesn't know reads as null), text in `digital_media_source_type_label` on its own, or a nonempty `ai_disclosures`. 14.40.0 still parses that list, but its feeds and search sent none in the October 14 checks, so the source type carries most of it, often with no label in the grid. Those two fields aren't in the 14.39.0 table above, which stays as measured. Main now targets 14.41.0 (version code 14418010), and its feeds haven't been measured for these fields, as the supported-build row of the [14.39.0 audit](pinterest-14.39.0-audit.md#baseline-and-evidence) says. The filter doesn't infer AI from an image, caption or creator. Unlabeled content stays. See [AiPins.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/AiPins.java#L17).

The shared filter keeps order and object identity for retained entries. It returns the original List when nothing changes and allocates a replacement only after the first removal. An unexpected exception returns the original page. Removal counters are assigned to the first matching family in the order ads, AI, shopping; they don't represent unique pins or network bytes saved. The counts for top-level removals are staged during the loop and published only after the whole list has gone through, so a later exception returns the original page without counting a removal that never happened. Counts for entries taken out of a module work differently. Each is published as soon as that module's shorter list is in place, so if the outer list then fails and the original page is shown, the module keeps the removals it already made and their counts stay. See [FeedFilter.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/FeedFilter.java#L45).

### Pins inside a module (#6)

A feed module is one top-level item that carries its own pins. In 14.39.0 that's `z5`, the dynamic story `DynamicStoryDeserializer` builds: every child of its JSON `objects` goes into the unannotated `public List f51914y`, and 78 renderers read that field directly (Home rows, closeup shopping and "complete the look" modules, deal and shop-by-ad carousels). The story model `ll` names its list `objects` and wraps each entry in `ll$b`, which holds one model in unannotated fields. Neither list was ever seen by the filter, so an ad inside a module stayed, and a related module came back each time the same pin was opened.

`ModuleItems` handles any kept item whose model has a `story_type`:

* Every nonstatic, nonfinal field declared as `List`, `AbstractList` or `ArrayList` on the class or its non-platform superclasses is read. Fields are found by type, not name, so a renamed field still works.
* An entry is judged when it's a model (it has JSON names) or a wrapper whose first non-null, non-primitive field holds a model. Anything else (image addresses, ids, null) stays.
* The same three switches decide, in the same order. What goes is left out of a copy, and the copy replaces the field. Counts (`promoted pin removed from a module` and the like) are published only after the swap succeeds.
* A module whose list ends up empty is removed too and counted as `module left empty removed`, so no heading is left over an empty row. Only the row's own list can end up that way. The other lists hold no models, so nothing in them is judged: `z5.O` has the preview addresses, `z5.V` has the hair pattern search chips (`q8`, which has no JSON names) and `ll`'s `content_ids` has ids. With Debug logging on a signed-in emulator on 2026-10-12, O and V were empty in every module the home and search pages sent.
* It's one level only. A module inside a module is judged as an item and never opened. A failure is reported as `module filter` under the first active family and leaves that list as it was. The rest of the page still filters.

`z5.O` keeps the 236x preview addresses parsed from the same JSON and isn't rewritten. A module that draws a collage from it could still show a removed pin's picture. See [ModuleItems.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/ModuleItems.java).

### Measurement is a separate control

Disable analytics targets nine annotated Pinterest paths: `v3/callback/event/`, `v3/callback/ping/`, `v3/callback/post_install/`, `v3/callback/track_funnel/{event}/`, `v3/register/track_action/{event}/`, `v4/log/mobile_perf/`, `callback/client_network_error/`, `log/` and `track/`.

It also skips selected startup tasks, including `TAG_ADS_OPEN_MEASUREMENT_SDK_INIT`, `TAG_ADS_APP_INSTALL_LOG` and `TAG_APPSFLYER_INIT`; intercepts AppsFlyer and Bugsnag URL transports; refuses Google Engage calls through the SDK's native unavailable-service path; and changes Firebase/Google Analytics manifest metadata. New endpoint names and new transports don't automatically enter this coverage. See [DisableAnalyticsPatch.kt](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/DisableAnalyticsPatch.kt#L58) and [Analytics.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/Analytics.java#L35).

The upload wrappers return native completed response shapes instead of introducing failures that could trigger retries. A new suppressed request needs the same response-contract analysis. Don't reuse a completed telemetry response for a content or configuration service without tracing its consumers.

The APK also contains `AdsQcmAnalytics$QcmFeedImpressionPayload` with `ad_destination_url`, and `AdsClickthroughComparisonLogger$ClickthroughComparisonPayload` with `pin_promotion_id`. These are useful anchors for a measurement trace. Their names alone don't establish which upload path eventually handles them.

### Confirmed limits and refresh behavior

The typed spotlight mismatch is closed. `ll.t` (`il.t` in 14.38.0) is an enum, and [Ads.isSpotlight](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/Ads.java) now accepts either the exact String or the exact enum constant name, so an `ll` item whose only qualifying signal is enum `SHOPPING_SPOTLIGHT` matches Hide ads with Hide shopping off. [ShoppingFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/pinterest/ads/ShoppingFixtureTest.kt) checks that some model's `story_type` field is still typed as the enum holding that constant. A live paid typed-spotlight item wasn't captured on 14.38.0, so the device result is still open.

The GMA lifecycle constraint is also specific. The Hide ads runtime helper decides whether an initialization call can proceed. Changing the switch doesn't itself stop an initialized SDK or re-invoke a skipped call. Native code may attempt initialization again through its own callers. A restart provides a defined initial state for comparison; live toggling needs separate acceptance on an account where GMA is enabled. The current settings summary describes filtering and collapsed panels without this qualification. See [Ads.skipGoogleAds](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/ads/Ads.java#L93) and the [Feed settings row](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/settings/HushPinterestPreferenceFragment.java#L249).

Pause makes runtime switches answer off. Future list constructions retain native entries, and future visibility/measurement calls receive their original arguments. It doesn't recreate a page that was already filtered. Disable analytics' skipped startup tasks also need a later native startup attempt, while its manifest metadata stays changed until the APK is patched again without those changes. See [Settings.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/settings/Settings.java#L27) and [PatchFamily.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/settings/PatchFamily.java#L33).

### Prioritized patch work

Three items from the first version of this list have shipped and are gone from it. Hide ads matches the typed spotlight story (0.0.7), removal counts are published only after a whole list passes, and a fixture contract checks the pin fields the filters read. Feed modules are now filtered by their item lists, and a module left empty is dropped, so the nested-module row below is about pages a filter empties. Partial-coverage reporting has shipped too: `HookTargets` records each holder's and view's installed targets, so that row below is kept only for the rule it sets (a single holder isn't reported as full coverage).

| Priority | Work item | Proposed hook or investigation | Acceptance conditions |
|---|---|---|---|
| P1 | Establish per-surface ad coverage. | Compare factory and patched home, search, related pins, boards, closeup overlays, video, carousel and third-party placements. Use bounded classifier reasons rather than IDs or payload logs. | Each served placement has an active/off/Pause result, pagination and gap checks. A surface that served no ad remains unverified. Visual removal and measured request suppression are reported separately. |
| P1 | Define GMA switch transitions. | Clarify restart behavior first. Trace a shared native load gateway before considering a live guard; preserve callback completion and native readiness. | Cover on-at-launch, off-at-launch, on-after-start, off-after-skip and Pause. No blank containers, retry loop or broken organic feed. A GMA-ineligible run doesn't establish these results. |
| P2 | Reduce targeted GMA request signals. | Investigate a guarded return in the uniquely matched `Lo00/f.c` and `.d` helpers after native removal of the five GMA keys. Trace cached signal queues and preserve all ordinary request fields. | Active filtering omits targeted GMA fields on fresh/cached requests. Off/Pause restores native preparation. Authentication, media and pagination work. This alone isn't described as blocking Pinterest's own promotions. |
| P2 | Trace `third_party_v2`. | Map `model/zp` (`model/zo`), its getters and renderer/SDK consumers. Retain generic `ad_data` list filtering. | Fixture call sites and a served sample establish reachability before adding a new guard. Ordinary content and inactive settings retain native behavior. |
| P2 | Expose partial coverage precisely. | Track each holder family and view separately, including every eligible constructor and method. | Missing targets produce a concrete partial-coverage result. Zero holders still refuses. A single installed holder isn't reported as full feed coverage. |
| P2 | Check nested commercial modules and filtered empty pages. | Trace typed carousel/module list owners and paging consumers. Avoid recursive reflection over arbitrary models. | Keep order, listeners and ordinary nested content. Empty modules collapse. Any refill is bounded, preserves bookmarks and can't loop or skip organic entries. These are investigations, not confirmed rendering bugs. |
| P3 | Offer narrower shopping choices. | Consider independent choices for product pins, shopping stories and featured boards using existing typed classifications. | Organic product pins can remain while modules are hidden. Paid filtering still works independently. Defaults, Pause and settings imports stay predictable. |

### Existing verification sources

[FeedFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/pinterest/ads/FeedFixtureTest.kt#L40) checks native holder uniqueness, all three holder families, all four views, GMA guard insertion and capability flags. [FeedPatchesTest.kt](../patches/src/test/kotlin/app/morphe/patches/pinterest/ads/FeedPatchesTest.kt#L53) covers partial target sets and refusal when every holder is absent.

[FeedFilterTest.java](../extensions/pinterest/src/test/java/app/hushpinterest/extension/pinterest/ads/FeedFilterTest.java#L128) covers common markers, order, AI coexistence, null/empty input, Pause, missing capabilities and measurement helpers. It has String and enum story stand-ins, so it covers the typed Ads spotlight case, with Hide shopping off, Hide ads off and Pause. [ShoppingTest.java](../extensions/pinterest/src/test/java/app/hushpinterest/extension/pinterest/ads/ShoppingTest.java#L45) does cover both String and enum stories for the shopping classifier. [ShoppingFixtureTest.kt](../patches/src/test/kotlin/app/morphe/patches/pinterest/ads/ShoppingFixtureTest.kt#L21) checks corresponding native schema markers.

These are existing source checks, not a new test-run result. They establish where regression checks belong. A passing fixture suite still cannot prove server experiment assignment, live serving frequency, absence of every impression request or end-to-end network privacy.
