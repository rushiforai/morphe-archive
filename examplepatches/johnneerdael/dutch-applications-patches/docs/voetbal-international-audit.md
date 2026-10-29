# Voetbal International 5.13.52 implementation audit

Implementation is in progress. No VI controls have been published yet.
The original package is `nl.vi`, build 910, minSdk 32, from the Play APKS.
The base APK SHA-256 is
`01d3bcbe0551da17e04c697ca0e7a6965cc07db4a55b510d334a730572d64974`.
Research and the sanitized server-response comparison are linked from the
[per-app README](privacy/voetbal-international/README.md).

## Article delivery and locked overlays

The public route returned a 679-character teaser and paywall for article 2151890.
The shipped native app-header/premium route returned 45 content blocks and
17,012 text characters without that marker. Another Pro item supplied gated
media and images; an invalid-signature control returned 401. These samples
establish a useful delivery path. Media licensing remains unverified.

Read full articles selects the existing `Scope.PREMIUM` in both ID and by-path
data-source overloads. A sender-owned helper extends its original IAP predicate
only for HTTPS GET to `pb-api.vi.nl`, default/443 port, the exact domain 200
article-ID or article-path endpoint, one premium scope value, and no genuine
Pro account. Existing IAP requests retain their original path; actual Pro
sessions retain normal session authentication. The helper writes no account
or receipt state.

An internal request attribute marks only the patch-extended requests. Immediately
before Ktor sends a redirect, the guard applies the same route policy and removes
the copied app header if the target is outside it. The attribute is never sent as
an HTTP header. Native IAP requests remain unmarked and retain their original
redirect behavior; other headers and the native redirect coroutine remain.

The native header formatter, key and HMAC remain. Its timestamp uses UTC
`Instant` minus 120 seconds instead of device-local time and a cached Amsterdam
offset. Its generated-value log invoke is removed. Keys, header values and
article text are excluded from public tests, logs and evidence. Cryptographic
primitives and platform time/transport are explicit fixture boundaries.

The native paywall component returns before composition. The carousel receives
its local unlocked rendering argument before its original body; actual
Authentication/IAP and article metadata are retained. A cached Pro paywall
takes the existing native reload continuation. Native request errors remain
errors.

Twenty-eight original whole-graph contracts cover these paths and retained
crypto, configuration, authentication, parser/request and continuation code.
Original fixtures reproduced missing premium scope/header, wrong-zone time,
generated-value logging, locked rendering and failed cached-teaser reload.
The emitted FULL APK passed patch-report, signature and decoded-effect checks.
The actual sender and continuation pass fresh, suspend/resume, IO-failure and
invalid-label fixtures with required/session headers and native token-save
ordering retained. Phone acceptance was pending at the initial development gate;
the subsequent stable-publication approval is recorded below.
Redirect fixtures cover another origin, non-article routes, ports, HTTP downgrade,
scope changes, allowed and multi-hop targets, non-GET methods, genuine IAP,
native Authorization removal, suspension and synchronous/resumed IO failures.

The request implementation uses the shipped PXR Media client namespace. Its
premium-scope and native app-header pattern is a concrete starting point for
researching other PXR apps. Publisher host, domain ID, configuration and UI
changes remain app-specific; this VI audit establishes no cross-app delivery
result.

## Display and video advertising

Hide ads selects the native display policy's false result and suppresses the
separate interstitial preload and legacy banner initialization. Legacy banner
requests complete once through the native absent-banner callback. The supplied
`Ads_BLOCK` list insertion is omitted without changing surrounding content.

Both ad-only JW before-play handlers return before requesting ads. The native
player configuration retains playlist, preload, controls, autostart and build,
while omitting its advertising configuration. The SDK's original null-config
consumer skips IMA settings initialization.

The bundled JW plugin selector also excludes the audited advertising plugin
names and URL aliases before activation, and disables automatic advertising
plugin selection. Fixtures cover pre/mid/post-roll, VMAP and explicit remote
plugin configurations. The selector retains functional plugins. This does not
establish removal of ads embedded into a publisher's media stream.

Native interstitial dismissal still runs on Main, emits the actual visibility
change and launches normal article navigation. The native cancellation handler
also retains its navigation fallback. No loaded-ad or delivery result is
fabricated. SDK, dispatcher and navigation-platform boundaries are modeled;
the relevant native application instructions execute in the fixtures.

The ads-only FULL APK passed its report, signature and decoded-effect checks
with 97 original method contracts. The combined article/ad APK passed the
same checks. Android phone acceptance remains pending.

## Tracking and identifiers

Disable tracking includes Hide ads. It guards the inspected ViAnalytics,
livestream and BlueConic collector entries, optional Facebook collection
getters and Firebase collection defaults. The crash collection getter stays
false even with a retained true preference. The App's explicit crash setter
passes false. Seven Crashlytics breadcrumb calls are removed; the surrounding
local logging and export code remains.

The three advertising-ID paths use their existing unavailable results: an
IOException-backed FetchIDResult on the current context, an empty video ID
through the native Main callback, and false availability on the current
context. Dedicated `ad_id` and `ifa_id` reads return empty. Other preferences
and actual account/subscription state remain.

Two independently executable Google measurement HTTP runnables throw a local
IOException inside their original try block, before opening a connection.
Their real error continuations still run on the SDK worker path. Stored crash
reports take their native failure continuation and fail the actual waiting
task. comScore's connection method returns its native false result.

The CCT helper filters the audited Firebase crash, session, FCM measurement,
performance and client-metrics transport names. An entirely discarded batch
returns the native fatal-error result. Unknown events retain their objects,
order, extras and original backend processing. No successful delivery is
invented for discarded telemetry. Native uploader cleanup and retry code
remains unchanged.

The JW selector excludes automatic and explicit `jwpsrv` activation, including
its URL aliases and remote fallback selection. Its module-list entry is
removed. The player, native bridge, content plugins and original collector
asset bytes remain; keeping an unused asset does not activate it.

The tracking-only FULL APK passed 222 original method contracts, native
provider/identifier/error/dispatch fixtures, signature/report checks and the
actual bundled JavaScript selector tests. The assembler widened one retained
short goto in the display-ID coroutine; the verifier accepts only that same
target at the exact original instruction. Combined article/ads/tracking
validation also passed. Phone acceptance remains pending.

## Consent and age checks

Skip consent screens includes Disable tracking and Hide ads. Its startup entry
validates the Activity, invokes the original private age-gate helper, and
returns before constructing or requesting a UMP consent update. No advertising
consent UI is created and no consent choice is saved.

Manual reopening validates its inputs, clears the native loading flag, calls
the real dismissal callback once and returns before the SDK/form/profile path.
Callback errors propagate. The original local age decision, age-choice buttons
and stored age preferences remain. Fixtures cover the one-shot and period
branches, previously false and true consent state, busy/manual reentry and
callback errors. They execute the original age decision helper with explicit
local-state/UI boundaries; no age or consent choice is fabricated.

## Initial integrated validation and remaining limits

All four independent selections passed FULL patch application, report,
signature and decoded-effect checks. The final article and combined checks cover
228 original method graphs,
owned edits, helpers, provider resources and the actual player selector.
The final combined selection passed the same checks.

The compiled bundle adds four default-on controls for the sixteenth app. All
71 prior catalogue entries and 176 existing code/extension/native payloads
remain unchanged; the containing DEX is rebuilt and VI payloads are added.
The branch includes main's documentation changes. This initial dev gate did not
imply stable approval. The subsequent approval is recorded below; universal
media licensing and a complete decrypted traffic capture are not established.

## Publisher marketing follow-up, 29 October 2026

The user tested v1.12.0-dev.1 and reported that Pro content works and ordinary
ads are absent, while the print-special promotion can appear three times on
home. A public, credential-free curation request returned HTTP200 and five
`marketingBlock` entries including that creative. The committed
[shape evidence](research/2026-10-28/voetbal-international-marketing-shape.json)
contains counts and a hash, without creative/article text or credentials.

The shipped mapper uses the separate `CurationItem.Marketing` type. Hide ads
adds `CuratedNewsResponse.morpheWithoutMarketing(List):List` at its list getter:
it retains all other objects in order, preserves null, returns the original
list when nothing is removed and never mutates stored response data. Thus the
grid uses the filtered item count and its native empty-list branch. The dedicated
`CuratedMarketingItem` returns before Compose/image/click setup as a fallback for
cached entries. No title, image URL, purchase destination, Pro flag or account
state is used to classify a promotion.

The follow-up extends the original/emitted checks to 255 method graphs.
Fixtures cover three repeats, changed creative values, ordinary and Pro news,
matches/live/unknown/null entries, read-only lists, unchanged object/list
identity, repeated getter access, all-marketing responses and cached renderer
entry. The earlier article/header/redirect/privacy/player checks remain part of
the combined verifier. Only VI's ad implementation and its new filter change;
189 prior payloads and 74 catalogue entries remain byte/value-identical, with
only the VI Hide ads description updated. The four controls and defaults remain.

On 29 October 2026 the user explicitly approved Voetbal International for release
on main. Stable promotion uses the verified v1.12.0-dev.2 payload, including this
marketing follow-up, while retaining every previously approved app. The user's
positive article report and release approval are acceptance evidence; they do
not establish every media entitlement or a complete decrypted traffic capture.
