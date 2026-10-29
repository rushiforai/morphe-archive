# Weerplaza 3.13.1 patch audit

## Community Maps compatibility addition

After the first phone install, the user confirmed the app appeared to work
and requested the same community Google Maps key used by Buienalarm. The new
`Fix Google Maps` patch replaces the single literal
`com.google.android.geo.API_KEY` manifest entry with the existing generated
`CommunityMapsKey`. It leaves the separate Firebase `google_api_key` resource
unchanged. No credential is written into tracked source or validation output.

Every other Weerplaza control includes this compatibility patch through its
dependencies, so selecting an individual ad, tracking, premium or consent
control also fixes the Maps credential after re-signing. It is selectable alone.

The original decode passes the original-key/Firebase checks and fails the
patched-key check before implementation. The runner dependency test also
failed before the new profile existed. `tests/verify_weerplaza_maps.py` checks
the actual decoded manifest credential against the private generated build
configuration, and pins the unchanged Firebase resource independently.

The Maps-only selection, combined selection and all four separately selected
controls passed real Desktop patch reports, APK signing and independent decoded
checks. Logs: `maps-apply.log`, `maps-dependency-matrix.log`,
`maps-original-red.log` and `maps-dependencies-red.log` in this plan's ignored
workspace. The Python suite passes twelve tests. The new APK was installed on
the USB phone with `adb install -r`, preserving the patched app's data. Actual
map rendering remains a physical-device acceptance check; the credential
change alone is not a claim that every Google service was exercised.

The initial original-app comparison used a temporary emulator. The user then
requested its removal for storage reasons; its AVD, system image and virtual
disks were removed. Further device checks use the USB phone only.

Supported input: `nl.weerplaza.app`, version 3.13.1 / 734, minimum SDK 26,
APK set with ARM64, language and density splits. Accepted application signer:
`e7c541ac7f1f5f36fb7c2263e14b9d64297ba391115d926e9b81af337efa4dea`.
The patches do not change RevenueCat subscription state.

Evidence terminology: **seen** means shipped instructions/resources or an
identified anonymous HTTP response. **Inferred** means the resulting control
flow follows from those instructions. This audit does not claim that static
validation establishes observed Android runtime or network behavior.

## Reproducible evidence

The original read-only investigation is
`$TMPDIR/re/weerplaza-static-3131/INVESTIGATION.md`. In that directory,
`apktool/` contains resources and the manifest; `smali/smali_classesN/`
contains complete code. References below use `S3`, `S5`, `S6` for those
numbered smali roots. Inputs are the complete set in `../phone-apks/weerplaza`;
the shared input inventory records hashes.

`tests/verify_weerplaza.py DECODED [-e NAME ...]` checks effects on an
independent apktool decode. No `-e` checks the original. It also accepts the
split research layout above, without copying either extraction.

**Seen RED:** original passes with no effects. Each of the four requested
patch selections fails on its first missing effect. The baseline check also
checks the opposite of every individual effect assertion, including tracking
sinks, optional telemetry and WebView interception. Evidence:
`.superpowers/sdd/2026-10-27-news-weerplaza/weerplaza-red.log`.

The real bundle build uses the repository Gradle configuration. Cached build
log: `.superpowers/sdd/2026-10-27-news-weerplaza/weerplaza-followup-build.log`.
The final validation matrix uses:

```
JAVA_TOOL_OPTIONS=-Xmx1g python3 scripts/validate_targets.py \
  weerplaza ../phone-apks/weerplaza --compact
```

Android SDK build-tools must be on PATH. The runner invokes Desktop with
`--validate --bytecode-mode FULL`, verifies each APK signature and independently
decodes each output before running the selection-aware verifier. Reports and
per-stage logs are in `build/validation/weerplaza/`. Node.js is used to execute the emitted sanitizer scripts against DOM boundary fixtures.
The `--compact` option
removes successful transient decoded trees and single-selection APKs. It keeps
reports/logs and `weerplaza-all.apk` for runtime review. The consolidated log is
`.superpowers/sdd/2026-10-27-news-weerplaza/weerplaza-final-scope-matrix.log`.

## Selections and preserved contracts

| Selection | Dependencies/effect |
| --- | --- |
| Hide ads | Resource collapse, native/Compose/video ad gates, remote ad request policy and ad DOM/native bridge sanitizer |
| Hide Premium banner | Native menus/settings/automatic/refusal/hourly upsells, remote popup/links and exact subscription navigation guard |
| Disable tracking | Depends on Hide ads; collection flags, real sinks and IDs below |
| Skip consent screens | Depends on Hide ads and Disable tracking; existing NotRequired completion plus remote notice-loader guard/refusal-popup cleanup |

Named patches are restricted to the exact version and signer. Required
fingerprints and resource matches reject absent/ambiguous matches. Counts
are specific to this APK: eight removed optional Firebase registrars,
thirteen removed advertising/PPID uses-permissions and one own PPID
permission declaration. This app does not receive Weeronline's Facebook,
GTM-container or Cxense-specific assumptions.

## Ads and premium surfaces

**Seen; patched:**

| Evidence | Patch point and result |
| --- | --- |
| S6 `j9/j$a.smali:92` | `a()Z` returns false, dedicated ads flag; no billing entitlement fabrication |
| S6 `k9/d.smali:800,269`, `m9/e.smali:1685,449` | Both `f()V` loaders and real Google/OpenWrap view construction sinks `q()V` / `r()V` return before initialization/loading |
| S5 `l7/e.smali:52`; S6 `j9/r.smali:527` | App Compose `Ad` and shared `BannerAdSlot` emit no banner content |
| S5 `MeteoPlazaActivity.smali:1198` | `n0()V` returns before dynamic bottom-navigation banner insertion |
| S5 `NativeAdsWebView.smali:380,1425,1900` | `n(F)V` and `z(Z)V` suppress banner insertion/scheduling; `setAds(Z)V` stores false |
| S5 `MeteoPlazaApplication.smali:1375`; S5 `m7/b.smali:58` | The actual one-argument `MobileAds.initialize` sink and OpenWrap ad-request callback setup are inert |
| S3 `i1/a.smali:6476,309`; `i1/e.smali:10828` | Ad-scheduling `t(k1/e)Z` and MSAS `D(k1/e,Z)Z` return their disabled outcome, retaining the content player |
| S5 `b8/o.smali:626,753` | Targeting `p(LocationData,Snow,MeteoBlockResponse)V` invokes original failure completion `r(...,null)` and returns; that clears loading and publishes weather with an empty targeting map |
| S5 `l8/g.smali:625` | Automatic promotion launcher `j(AppCompatActivity)V` is inert |
| S5 `l7/g$d.smali:43` | Declined-consent upsell collector returns `fd/i0.a` (Unit), preserving completion |
| S5 `d8/q0.smali:1030` | AdditionalHourlyData `k(List,Z,ud/a,Composer,I)V` returns only for the false/subscription-promotion branch; the true/subscribed original hourly forecast body stays intact |

The misleadingly named `WeatherDataRequest` constructs only the ad
`/v2/ads/geotargetting` URL (S5 `api/WeatherDataRequest.smali:56`).
The patch deliberately reuses its caller's normal failure/empty-map path;
it does not strand weather refresh by dropping that callback.

Six `banner_container` resource layouts are collapsed: current/extremes,
sun, splash, splash-pro, flash and settings. The bottom-navigation ad holder
is also collapsed in `main_drawer`. Three navigation menus hide
`nav_remove_ads`; settings `menu_subscriptions` and `promotion_paywall` host
are collapsed. Constructors/factories for ad state remain non-null because
callers dereference them.

Twelve bundled, identified ad assets are removed after loaders are blocked:
`openwrapsdk.js`, `omsdk-v1.js`, `apn_omsdk.js`,
`apn_renderNativeAssets.html`, `apn_vastvideo.html`, `mobilevastplayer.js`,
`astmediationmanager.js`, `pob_mraid.js`, `dsa_page.html`,
`PubMatic_Logo.svg`, `pob_info_button.svg`, `pob_person_button.svg`.
`optionsparser.js`, content/player assets and Didomi privacy assets remain.

## Collector coverage

| Collector | Seen evidence | Control |
| --- | --- | --- |
| App Firebase events/screens/properties | S5 `u7/b.smali` `b` through `g` | All six initialization/dispatch facade methods return before collection |
| Runtime analytics consent updates | S6 `p9/a.smali:91` | `a(o9/e)V` inert; hard manifest analytics deactivation also overrides saved consent |
| Firebase Analytics | Manifest measurement receiver/service/jobservice and connector registrar | Components disabled; connector removed; analytics, automatic screen, advertising-ID, storage/consent and SGTM flags disabled |
| Crashlytics | S5 `com/google/firebase/crashlytics/a.smali`; `e4/e0.smali:602` | Getter constructs inert non-null wrapper, `d/e/f` sinks inert, both registrars removed, arbiter `d()Z` false even after persisted opt-in |
| Firebase Performance | Manifest Perf registrars and HTTP wrappers | Keep registrars/wrappers for functional HTTP; hard `firebase_performance_collection_deactivated=true` plus enabled/logcat flags false |
| Firebase Sessions / In-App Messaging | Manifest session and four messaging-marketing registrars | Registrars removed; collection flags false |
| FCM delivery analytics export | S5 `com/google/firebase/messaging/k0.smali:857` | `a()Z` false, including saved `export_to_big_query` opt-in; delivery export flag false |
| Cross-app Infoplaza PPID | S6 `n9/e.smali:139` | Generator returns empty string; exported provider disabled; own and six sister-app permissions removed |
| Advertising ID / attribution | Standard AdvertisingIdClient API and manifest | Zero UUID with limit-ad-tracking true; AD_ID, ADServices, install-referrer and Amazon attestation permissions removed |
| Blue Billywig video statistics | S3 `m1/i.smali:22976`, endpoint at `:329` | Single beacon sender `y(Map)V` inert; native content player retained |
| Didomi performance metrics | S6 `io/didomi/sdk/s9.smali:86` | Private sampling/enabling gate `a(String,String)Z` false |
| Didomi API events | S6 `io/didomi/sdk/apiEvents/b.smali:419,1126` | Queue gate `b(i[])Z` false; replay `f()V` and actual coroutine sender `c(i[])V` inert |
| Optional RevenueCat device/subscriber attributes | S5 PurchasesConfiguration, PurchasesOrchestrator and SubscriberAttributesManager | Device-ID/diagnostics getters false; identifier collection, Firebase instance ID and optional attribute setters inert; both cached unsynced-attribute accessors return empty maps |
| Optional RevenueCat feature/diagnostic uploads | S5 EventsManager, DiagnosticsTracker/Synchronizer | `track`, both event flushes, priority flush, both diagnostic sync methods and both diagnostic tracking methods inert |
| Remote content WebView trackers | S5 NativeAdsWebView client, independently fetched webapp HTML | Exact-host/subdomain interceptor below |

Firebase Init, Installations, Messaging, Remote Config and Performance
registrars remain. The app's configuration/migration, weather queue, map
configuration, receipts and RevenueCat identity/purchase APIs remain.
The decoded verifier includes original instruction digests for consent
write methods, manual preferences, weather model request/configuration,
push-preference migration, RevenueCat login and receipt callbacks. It also
asserts the weather publication and consent completion paths remain present.

### Didomi API event follow-up

**Seen:** `b(i[])Z` only fills `p/k` queues, toggles `j` and calls `c(i[])V`;
callers discard its boolean result. It accepts no application completion
callback. Private `f()V` replays that internal queue; `c(i[])V` launches
`b$e`'s network coroutine. The `b$a` and `b$b` callbacks update internal
Didomi event/backoff state, rather than publishing the app's consent flow.
Suppressing only the sender could leave an internal queue marked busy;
the patch also prevents enqueue and replay before those state changes.
Consent choices/storage, SDK readiness, remote configuration, translations
and manual preferences are preserved. **Inferred:** app consent completion
remains independent of this telemetry path; Android runtime confirmation
is still required.

### WebView follow-up

**Seen:** `NativeAdsWebView$c` is the app-owned WebViewClient. It originally
had URL navigation and page-finished callbacks but no request interceptor.
An anonymous fetch of `https://webapp.weerplaza.nl/` on 2026-10-27 contained
`https://www.googletagmanager.com/gtag/js?id=G-0SG1BD9ZNC` at HTML line 253.
The fetched evidence is transient `webapp.html` beside the investigation.

The ad patch adds both Android request-interception overloads to this
existing client; tracking and consent add their own independent policies. It parses the URI host, lowercases using Locale.ROOT, and
matches exact host or a dot-prefixed subdomain suffix. This avoids matching
weather URLs merely containing a collector hostname in their path/query.
It returns an empty `text/plain` response for these scoped policies:

- Ads: exact host or dot-subdomain suffix for `doubleclick.net`,
  `googlesyndication.com`, `googleadservices.com`, `adnxs.com`, `pubmatic.com`,
  `html-load.com`, `content-loader.com`, `css-load.com`, `html-load.cc`,
  `img-load.com`, `ad-delivery.net`, `cadmus.script.ac`.
- Tracking: exact host or dot-subdomain suffix for `googletagmanager.com`,
  `google-analytics.com`, `scorecardresearch.com`, `stats.bluebillywig.com`,
  `analytics.infraloods.nl`, `sentry.io`, `report.error-report.com`,
  `pushalert.co`. Exact host/path pairs: `imweather.com/api/auth/_log`,
  `api.privacy-center.org/v1/events` and `/v1/sync`; queries do not affect
  the path check. Weather/auth/config paths remain allowed.
- Consent: exact `sdk.privacy-center.org` host and path ending `/loader.js`,
  the observed remote advertising notice bootstrap. Native manual privacy
  uses another client/SDK and remains intact.

All other requests retain normal WebView loading via null response.
The original page-finished/navigation/title/weather callbacks stay intact;
manual Didomi WebViews are not replaced.

**Seen follow-up:** photo iframe HTML at `infoplaza.fotoloods.nl` contains
`<script defer data-domain="fotoloods.nl" src="https://analytics.infraloods.nl/js/script.js">`.
The added guard blocks that analytics host while retaining the photo document,
image and application-script hosts. Evidence: transient `web/fotoloods.html`
and `web/infraloods-analytics.js`.

### Remote UI and independent Premium routing

Focused evidence: `$TMPDIR/re/weerplaza-static-3131/WEBVIEW_AND_LOCKED_CARDS.md`
and its `web/` HTML/scripts. App world/winter/report/news templates expose
`SnippetBanner` wrappers, `.banner.snippet`, APP banner IDs and
`.js-premium-popup`; public WWW templates additionally expose subscription
links/status rows. The source traces each selector to concrete page lines.

Each selected UI control adds its own static JavaScript helper immediately
after the existing `onPageFinished` super call. The method originally has no
local registers: helpers receive original p1 (WebView) and leave every
original title/weather callback intact. A fixed original instruction digest
checks those callbacks after filtering only the injected helper calls.

Ad cleanup collapses the observed banner wrappers and replaces the ad bridge
once per observed object identity. Its `get/android/ios` return the required
**object** `{targeting:{},banners:[]}`; `add` is inert. Position/content methods
remain. Premium cleanup hides the exact popup/status rows and own-host
`/abonneren`/`/bevestigen` anchors. Consent cleanup suppresses the refusal popup
alongside the early SDK-loader request guard. Each script is scoped to the
Weerplaza host family and uses a distinct per-document marker.

MutationObservers cover dynamic child insertion and class/style changes.
Anchor styles change only when necessary; bridge methods change only on a new
bridge object. Popup activation restores only its own `overflow:hidden` lock;
a hidden refusal popup does not remove a weather/lightbox modal's scroll lock.
Emitted-script tests exercise these behaviors, repeated execution, dynamic
anchors, replaced bridge objects and observer idempotence.

For independent premium selection, `shouldOverrideUrlLoading(WebView,String)`
first rejects only exact own-host `/abonneren[/]` or `/bevestigen[/]` paths.
This stops the observed public Didomi refusal redirect before subscription
content or Custom Tabs launch. All remaining original navigation instructions
and branch destinations are digest-protected. Account/billing hosts, news
paths and subscription-looking text inside unrelated paths/queries remain
allowed. The subscription state and purchase implementation are untouched.

Actual nested embeds add identifiable collectors: photo iframe Plausible-style
analytics; map and Blue Billywig browser Sentry; map NextAuth `_log`; public
WWW AdShield recovery/fingerprinting and PushAlert browser marketing; remote
Didomi events and cross-device consent synchronization. Their concrete
source URLs, payload shapes and offsets are in the focused report. Native
weather FCM/push, shared site scripts, photos/maps/media, account/billing and
favorites hosts are retained.

## Maps credential provenance and physical regression

The first Maps build substituted the generated local key correctly, but the
physical radar still showed a blank map. A cold start reported a Google Maps
token request failure (`INVALID_ARGUMENT`). Independent binary-resource checks
then established that the generated local key differed from the key in the
installed, working Buienalarm app. Buienalarm rendered geography on the same
phone and network. The project's Actions release
[v1.2.0](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.2.0)
uses that same working key; its workflow supplies `SHARED_MAPS_API_KEY`. The local build had
instead reused an older generated build-output cache.

The repair supplies the verified working key through the Git-ignored explicit
build input. The Maps verifier now requires `SHARED_MAPS_API_KEY` or that input
file, so stale generated output cannot independently validate itself. No key
value belongs in source or evidence logs. The binary-key mismatch was checked
before rebuilding. Corrected Maps-only, combined and all four independent
control selections pass real patch reports, signing and decoded-effect checks
against the explicit input.

No certificate substitution, TLS change or SDK mutation is part of this
repair. Weerplaza loads its Maps implementation dynamically; the bundled
`X-Android-Cert` sites inspected belong to Firebase. The radar deliberately
uses map type `NONE` and its own Meteoplaza tile providers. The phone fetched
an exact base-layer tile successfully over verified TLS. WebView ad/tracker
filters do not intercept these native Maps or tile requests.

Evidence is recorded in the task directory's `maps-runtime-diagnosis.md` and
key-provenance RED/GREEN logs, plus the equality-only
`phone-community-key-comparison.json`, `actions-release-key-comparison.json`
and `corrected-community-key-comparison.json` under
`build/validation/weerplaza/`. The corrected combined APK, SHA-256
`8e781df5a2895a40caaf70c5a0326abdf7d6963cdc3ea889fe684252593dbbb5`,
was installed as a same-key update with app data preserved. The user then
confirmed that Weerplaza radar was fixed. This acceptance covers the reported
radar failure; other map modes and all overlays were not independently measured.

## Verification results and remaining limits

The original and each selection are checked independently. Every successful
matrix case must have a successful Desktop patch report, no failed patches,
a valid APK signature and the selected/dependent effects only. The Python
repository test suite (`python3 -m unittest discover -s tests -p 'test_*.py'`)
passes 15 tests; log: `maps-key-config-suite-green.log` in the task evidence directory.

**Still unknown / not established by these static checks:**

- Fresh/declined/granted consent and subscription runtime states; actual
  startup/navigation behavior, manual privacy usability and absence of stuck
  loading states. The critical completion paths are statically preserved.
- Broader weather/search/favorites/widgets/push receipt, content video and cast
  runtime behavior. The Maps follow-up above separately records the corrected
  same-key phone update and the user's radar acceptance.
- Complete outbound traffic. Remote content can change or use same-origin
  telemetry, redirect destinations, service workers, WebSockets or hosts not
  represented in the shipped inventory. A host interceptor is bounded
  coverage, not proof of complete WebView privacy.
- Remote DOM controls are statically and fixture-verified against the observed
  selectors/bridge contract; browser timing, real layout, scrolling and live
  callback behavior still need Android verification.
- **External-browser boundary:** the original client sends non-webapp links to
  Custom Tabs. Ordinary external routing remains unchanged. Its requests are
  outside this WebView interceptor; these controls do not claim to filter an
  external browser's subsequent network traffic. Exact own-host subscription
  redirects are stopped before this routing branch under the premium patch.
- Web-rendered sponsored/editorial markup and additional remote ad placements.
  No independent app-owned interstitial coordinator was found; that is not
  proof that remote configuration cannot expose another placement.
- The native locked-hourly promotion is now suppressed at its presentation
  boundary; its subscribe click callback is no longer emitted for unsubscribed
  users. The subscribed data path and entitlement state remain intact.
  Verification includes emitted branch direction/target and a canonical digest
  of every original body instruction and branch target. No paid capabilities
  are unlocked by this task.

The combined artifact is ready for independent review and isolated Android
runtime/network verification. Broad claims that all tracking is absent or
that all application functions have been observed working are premature.


## Execute-time original input preflight (2026-10-27)

Every named patch and every mutating dependency now depends directly on a
read-only input preflight. It checks the declared exact package, version name,
version code and manifest minimum SDK before a patch can alter resources,
bytecode or extensions. Signing metadata must contain at least one certificate,
and every distinct observed certificate SHA-256 must belong to the existing
allowed signer set. Missing, untrusted and mixed signer sets fail; verified
allowed signer declarations remain unchanged. These checks run even if a client
ignores compatibility metadata or forces selection.

`python3 tests/verify_original_input.py` runs the production validator and actual
resource patch using the real SDK, original APK metadata and controlled invalid
fixtures. It also checks that every dependency is guarded, rejection does not
write the manifest, and the production strict fingerprint resolver rejects
missing or multiple matches. The full descriptor helpers continue to distinguish
legal overloads.

All direct singleton fingerprints now explicitly require `matchAll(1..1)` through
`uniqueMatch()` inside patch execution. The intentional two-overload RevenueCat
operation retains `matchAll(2..2)`.
