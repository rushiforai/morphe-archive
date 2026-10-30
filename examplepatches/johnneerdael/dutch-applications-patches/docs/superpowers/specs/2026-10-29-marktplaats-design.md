# Marktplaats advertising and optional measurement controls

Continue the user's SSD, app-by-app privacy-patch work from the verified
v1.14.0-dev.1 candidate. This is an implementation design for the already
authorized work; technical choices below are the executor's calls, not new
preferences attributed to the user. Publish a reviewed dev candidate for phone
testing; Marktplaats is not approved for main.

## Intent and original input

Remove commercial display/native advertising and optional measurement while
preserving the marketplace: real seller listings, search, account/security,
chat, requested notifications, real purchases, shipping and paid seller products.

- Original `nl.marktplaats.android` **16.17.0**, code **633462**, minimum API **32**.
- Complete Play APKS: `/Volumes/EXT-SSD1/phone-apks/marktplaats.apks`.
- APKS SHA-256 `367ff2e710f0fa0ee4a37067326c26633b72eb1dbcae4fa707959ac996a039d1`.
- Base SHA-256 `341cdd423d7ba8a11b5aed3f4627c33947e0588e554cad7d4feb5d2abe7e4794`.
- Publisher certificate `742dc275b25928621a8fbdb4362876825c8aec6a4afdbd04d0b8d72b9ca22052`;
  do not confuse Google's source stamp with the publisher.
- Reuse the existing private decode and phase2 indexes under
  `/Volumes/MorpheResearch/research-2026-10-28/apps/marktplaats`.

Preserve the 79 previous controls, 18 apps and all 200 previous individual
class/extension/native payloads. The aggregate bundle DEX will be rebuilt.
Three new controls give an expected catalogue of **82 controls / 19 apps**.
Never publish the original or rebuilt publisher APK, keys, raw signed headers,
account data or private decompilation.

## Approaches and calls

A whole-host/client block would remove listings, auth, chat and transactions
because advertising and functional APIs share transports. A cosmetic-only patch
would leave ad requests, targeting and independent SDK workers active. Use typed
ad-slot filtering, native no-content/failure outcomes and narrow app/SDK lifecycle
and measurement gates instead. This follows the established project pattern.

Real marketplace adverts are core content. Preserve DEFAULT_LISTING, ICAS seller
inventory (including promoted listings), seller headers, similar items, legal/
DAC7 notices and shipping/service information. Filter only explicitly identified
SDK/native display slots and sponsored advertising content. Do not invent paid
business eligibility, orders, quotas, ranking, buyer protection or subscriptions.

## Public controls

| Control | Default | Dependencies / effect |
| --- | --- | --- |
| Hide ads | On | Typed search/VIP/home ad suppression plus ad-only init/load/targeting/measurement gates. |
| Disable tracking | On | Includes Hide ads; suppresses audited optional measurement, attribution, diagnostics, study and marketing SDK activity. |
| Disable ThreatMetrix (expert) | Off | Independent; prevents ThreatMetrix startup/profiling through the app's genuine disabled path. May cause server-side account/payment/security checks to fail. |

All mutators directly depend on the exact original-input guard. Guard unique
method signatures, access flags, register/instruction counts and owned anchors.
Use per-app helpers; never neutralize an entire R8-merged class.

## Hide ads

The flexible search API returns `FlexibleSearchResponse.items`, a list of
`SearchResultItem`; the legacy `AdSearchResult.ad` is ordinary seller inventory.
Filter exactly `SRP_HEADER_NATIVE_AD`, `SRP_LIST_NATIVE_AD`, `DISPLAY_BANNER` using
the actual `SearchResultItem.itemType`. Preserve retained objects, order, query,
correlation, histograms, pagination and other response metadata. Cover all native
construction/deserialization/copy paths reaching consumers, not just one getter
if component/direct-field paths bypass it. Preserve null/unknown native semantics;
return the original collection when nothing is removed where practical.

Exclude these same exact string capabilities from
`feature/search/search/api/LrpItemsRequest.supportedTypes`. Preserve userSegments
and the complete functional search request. Filter returned ad slots as well so
cached/server rows cannot bypass the policy. The VIP DISPLAY_BANNER content
section must be absent before binding; retain seller media and content order.

Stop Google/PubMatic/Prebid initialization at the ad-only `c37.c`, `c37.d` and
`c1c.a(Context)` entry points; disable MobileAdsInitProvider. Preserve `c37.a`
WebView compatibility and `c37.b` category caching, along with unrelated activity
resume/chat/saved-search work.

Close each independent loader: search display, VIP top/full-description display,
home and VIP Google custom native, first-party native-ad fetch and sponsored
content. Prefer preventing binding and native unavailable/empty state. A loader
with callbacks must finish its real failure/no-content state exactly once; never
report an ad loaded without a view, leave on-start pending or reserve a blank
rectangle. Preserve native disposal and genuine seller-media callbacks.

Stop ad-only targeting, native impression/click/view-duration and banner metrics
uploads without changing the shared functional API. The native-ad list repository
already has a nullable result path. Its sponsored cold flow must emit a defined
native no-content/error result or complete only when its actual consumer handles
that completion. Confirm consumers before choosing the edit; a silent unconsumed
empty flow is insufficient evidence. Stop producer/timer work as well as send
sinks where suppression would otherwise create a growing queue or retry loop.

## Disable tracking

Suppress the app-owned `cz9` event/screen/property sinks while preserving UI and
functional session/authorization providers. Use `ei.d`'s existing disabled
Adjust/Criteo wrapper for every consent state; close Adjust auto-init and later
activation, including restored state. Preserve privacy-request semantics and
Facebook authentication. Suppress Facebook measurement activation/events without
removing its login implementation or the entire Graph transport.

Prevent Datadog bootstrap/instrumentation and user observers: the audited
`tracking/config/a.m()` false path exits bootstrap. Disable its automatic RUM
provider separately. Actual HTTP requests must retain real responses/exceptions;
no fabricated network result or blanket interceptor return.

Disable Braze marketing/profile/in-app engagement, including auto-init, consent/
login re-enable, restored settings and background push entry points. Use the
shipped SDK's real disabled state rather than a null SDK object. Retain the
independent first-party FCM service, chat/order/account/security notifications and
requested saved-search alerts; explain that Braze marketing messages are disabled.

Stop both UserZoom's resume-time initialization and synchronous study triggers,
including the separate `wg` initialization/callback slice and `c8h.a` leaf.
Preserve unrelated resume work, ordinary navigation, seller/chat camera and media
uploads. Bundled recording capability is not observed execution; RECORD_AUDIO
was not declared in the inspected manifest.

Use permanent per-product Firebase Analytics/Performance deactivation and
Crashlytics/Sessions/FCM-export controls supported by this APK. The original
manifest already has some false defaults; preserve and guard those actual nodes
rather than assume every flag is absent. Stop app crash initialization/observers,
stored/runtime re-enable and independent settings HTTP where collection flags do
not cover it. Set FCM delivery export false while retaining receipt/token work.
Remove only audited advertising-ID/AdServices permissions and stop GAID reads via
the native unavailable state. Preserve functional IDs, auth/header generation,
Remote Config, Installations, App Check and genuine error propagation.

Collection flags alone do not cover persisted telemetry. Gate the actual CCT
uploader after optional client metrics are appended. Filter only exact transport
names established in this APK for Crashlytics, Sessions, Performance, optional
FCM export and CCT metrics. Preserve unknown/functional objects, order, context,
extras and native HTTP/result/retry paths. If all records are filtered, use native
fatal-error deletion as an intentional privacy discard, never a successful-send
acknowledgement. Keep original graphs and handlers outside owned edits.

Native consent decisions, storage, completion/error callbacks, settings reopening
and functional headers remain. Do not fabricate consent grants or consent UI
completion. This scope does not add a consent/notification onboarding replacement.

## Independent security profiling option

ThreatMetrix is security/device profiling, not simply an ad host. The ordinary
tracking control retains it and documents `faas.marktplaats.nl` prominently.
The expert option stops `threatmetrix/a.d(wrapper,Application)` before SDK
getInstance/init/profile and forces the app's enable predicate `a.e()` false.
Its real header routine `a.b(Request)` then uses its existing empty-map path
before any blocking session-ID wait. Preserve constructor state, real auth/token
refresh and all ordinary headers. Validate every caller, including refresh paths;
do not leave a deferred wait running with an uninitialized SDK.

No synthetic profile/session ID, successful security result or token is allowed.
The backend's acceptance without profiling is unknown: the option is off by
default, explicitly warns of login/checkout/security failures and preserves real
server rejection. It is a client privacy option, not a server-check bypass.

## Evidence, validation and delivery

Use the existing SSD worktree and one heavy local pipeline. Originals and private
research stay intact. Reclaim only known reproducible build artifacts; use an
additional SSD APFS staging allocation if needed, without detaching the live
research volume. Keep archive/version selection unambiguous when building from
the prior dev bundle.

Pin original whole graphs for edited methods and retained search/data conversion,
category cache, location, startup/native licensing, consent, auth/refresh, chat/
FCM, transactions and seller-business contracts. Add bounded native-instruction
tests at meaningful changed boundaries with actual DEX/platform ABI checks.
Observe original RED and selected GREEN; do not replace functional SDK/server
outcomes with success mocks. Preserved unexecuted platform/HTTP bodies are pinned
evidence, not full Android/runtime tests.

Exercise mixed/all/empty/unknown ad rows, metadata and identity retention,
callbacks/completion/disposal, consent/remote/restored re-enable, local queue
admission/lifetimes, telemetry-only versus mixed persisted batches, native failure/
retry/deletion and real expert-mode no-profile header fallback. Run actual
production SDK wrong-input/certificate/method negatives before mutation.

FULL patch/rebuild/sign/decode validation covers original, each public control and
all selections with their dependency closure. Python/Node/strict bilingual docs
and local links must pass. Prove the previous 79 catalogue entries/defaults and
200 individual payloads unchanged. The new per-app README lists concrete domains,
purposes, inspected data, control effects and remaining functional/security traffic
with clear source/configuration versus captured-traffic labels.

After one fresh full-branch review and any verified blocking fix, publish the
authorized dev build. Download it and verify code/catalogue/feed/version and
provenance against the tested candidate. Keep phone acceptance, re-signed startup,
Maps/auth, real transactions, security profiling opt-out and actual network
behaviour explicitly pending; do not install/reset a phone, make publisher probes,
change accounts or perform transactions as part of this off-device implementation.
Main publication waits for the user's approval. Continue with TVgids.nl afterward.
