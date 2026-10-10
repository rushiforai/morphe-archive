# Pinterest 14.38.0: Tracking and privacy

Inspected October 9, 2026. Part of the [factory app audit](pinterest-14.38.0-audit.md). Source baseline `932f0c5`. See the audit entry point for the APK identity, live observations, and evidence limits.

## Tracking, attribution and privacy controls

This section covers the original Pinterest 14.38.0 APK (version code 14388010) and HushPinterest source at `932f0c5`, inspected on October 9, 2026. Native descriptors below belong to that exact Pinterest build, so don't copy one into a fingerprint for another Pinterest build.

**Confirmed static** means the conclusion follows from an APK instruction, manifest declaration or current Hush source. **Candidate** identifies a useful patch investigation. **Unknown at runtime** means the audit hasn't established that the code ran or that data reached a server. An included SDK, permission or URL string doesn't establish transmission.

### What the current privacy patches control

Pinterest has several distinct tracking mechanisms. First-party API telemetry, third-party reporting SDKs, ad measurement, request headers, install attribution and shared links each have their own entry points. Hiding a promoted pin removes visible content after the response has arrived. It doesn't by itself prevent the request, its headers or an earlier event.

Hush currently targets nine annotated telemetry paths, ten startup jobs, AppsFlyer and Bugsnag Java URL transports, a Google Engage service gateway, the two Google advertising ID getters and outgoing share/clipboard text. Manifest edits add another layer. These controls reduce specific mechanisms; they don't make a signed-in account anonymous or stop every network request.

The main implementation is [DisableAnalyticsPatch.kt](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/DisableAnalyticsPatch.kt#L58), with runtime decisions in [Analytics.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/Analytics.java#L35).

### First-party telemetry endpoints

**Confirmed static.** The following nine annotation values form the complete current `TELEMETRY_PATHS` allowlist. They are relative API paths, not nine blocked domains. The purpose column describes the name and existing use as a telemetry target. It does not claim that the full request payload has been captured.

| Exact annotation value | Apparent purpose | Current patch boundary |
| --- | --- | --- |
| `v3/callback/event/` | Event callbacks | Direct DEX calls to the annotated service method |
| `v3/callback/ping/` | Ping or heartbeat reporting | Same wrapper boundary |
| `v3/callback/post_install/` | Post-install reporting | Same wrapper boundary |
| `v3/callback/track_funnel/{event}/` | Named funnel events | Same wrapper boundary |
| `v3/register/track_action/{event}/` | Registration action telemetry | Same wrapper boundary |
| `v4/log/mobile_perf/` | Mobile performance reports | Same wrapper boundary |
| `callback/client_network_error/` | Client networking error reports | Same wrapper boundary |
| `log/` | Generic log upload | Same wrapper boundary |
| `track/` | Generic tracking upload | Same wrapper boundary |

Discovery reads method annotations, finds callers and constructs runtime wrappers. It refuses the patch if any required path has no callable target. It doesn't classify arbitrary URLs by the presence of words such as `track` or `log`. See the [endpoint selection and caller preflight](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/DisableAnalyticsPatch.kt#L164).

Suppressed calls complete locally using Pinterest's own asynchronous response shapes. Coroutine methods receive `NetworkResponse.Success(Unit)`. The supported `log/` shape receives the app's `Single.just` factory around an empty JSON object. Compatible remaining methods receive a completed Completable. This allows subscribers to finish instead of waiting indefinitely. The deferred tracking queue remains eligible to run so its work can consume those completed responses. See [response construction](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/DisableAnalyticsPatch.kt#L274) and the [queue behavior contract](../extensions/pinterest/src/test/java/app/hushpinterest/extension/pinterest/privacy/AnalyticsTest.java#L59).

There is a useful maintenance limit here. Direct virtual, interface and static calls are scanned, but reflection, native code, JavaScript, dynamically assembled paths and newly added service annotations need separate inspection. An app update could retain all nine paths and introduce a tenth telemetry service without failing this allowlist. Keep a complete annotation-and-caller inventory for each new APK. [PrivacyCalls.kt](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/PrivacyCalls.kt#L29) defines the supported invocation forms.

### Startup jobs

**Confirmed static.** Disable analytics recognizes these ten enum names. The meanings follow their explicit labels.

| Blocked task | Role |
| --- | --- |
| `TAG_APPSFLYER_INIT` | AppsFlyer initialization |
| `TAG_FIREBASE_ANALYTICS_INIT` | Firebase Analytics initialization |
| `TAG_RUM_REPORTING` | Real user monitoring |
| `TAG_LOG_LOCATION_PERMISSIONS` | Reporting location permission state |
| `TAG_LOG_DEVICE_PROFILE` | Reporting the device profile |
| `TAG_LOG_ENTRY_POINT` | Recording the app entry route |
| `TAG_SCHEDULE_SUBMIT_NETWORK_METRICS` | Scheduling network metrics submission |
| `TAG_LANDING_SIGNALS_UPLOAD` | Uploading landing signals |
| `TAG_ADS_APP_INSTALL_LOG` | Ad-related installation reporting |
| `TAG_ADS_OPEN_MEASUREMENT_SDK_INIT` | Open Measurement initialization |

The patch finds the enum by its preserved labels, then identifies the scheduler through its Runnable, enum field and Map-writing method. It checks the task label before running that method. In 14.38.0, the enum containing `TAG_APPSFLYER_INIT` is `Lx20/u;`. Unknown labels stay eligible, as do auth, account, feed, Firebase Messaging and WorkManager jobs. Source: [task list](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/Analytics.java#L35), [scheduler discovery](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/DisableAnalyticsPatch.kt#L487).

Turning Disable analytics off later doesn't retroactively run initialization work already skipped. Compare startup behavior after a restart. Task presence alone doesn't establish that every job runs for every region, account or experiment.

### SDK reporting and service boundaries

| Component | Confirmed code | Existing Hush control | Limit |
| --- | --- | --- | --- |
| AppsFlyer | Advertising ID readers, Android ID handling, Google Play and Xiaomi referrer consumers | Skips the named initialization task and replaces `URL.openConnection()` calls inside `Lcom/appsflyer/` | An alternate transport or entry point needs separate coverage. Local collection isn't the same as upload |
| Bugsnag | Crash client, NDK/ANR plugin paths and `https://notify.bugsnag.com` | Replaces `URL.openConnection()` calls inside `Lcom/bugsnag/` | This isn't proof that every native reporting path is intercepted. Local crash capture can continue independently |
| Firebase Analytics | Named startup task, measurement code and manifest defaults | Task suppression and manifest deactivation | Messaging and Installations remain available |
| Google Engage | A service client anchored by `com.google.android.engage.BIND_APP_ENGAGE_SERVICE` | Withholds the bound service at its gateway while the switch is active | Recommendation surfaces can also depend on this service |
| Open Measurement | Named initialization task | Skips that startup task | Other ad-session creation and embedded web paths still need inventory |
| Google mobile ads | Advertising ID use under `ads_mobile_sdk` | Getter filtering plus the separate Hide ads patch | The AppsFlyer/Bugsnag transport hook doesn't block all Google ad traffic |

For AppsFlyer and Bugsnag, the active hook supplies a local `HttpsURLConnection` stand-in. It discards output and answers HTTP 200 with `{}` without opening the original connection. When inactive, it calls the original URL opener. Engage takes a different approach: the hook supplies null at the existing service null check, allowing the SDK's normal unavailable-service error path to handle the call. See [transport selection](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/DisableAnalyticsPatch.kt#L196), [transport runtime](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/Analytics.java#L67) and [Engage gateway](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/DisableAnalyticsPatch.kt#L531).

### Permanent manifest changes versus runtime controls

The settings switch and the APK's manifest are different controls. Turning a switch off or pausing Hush can restore eligible runtime paths, but it cannot restore removed declarations or rewrite metadata in the installed APK.

| Control | While active | Off or Pause | Restart / repatch boundary |
| --- | --- | --- | --- |
| Telemetry upload wrappers | Complete locally | Original method becomes eligible | An already completed call isn't replayed |
| AppsFlyer/Bugsnag URL hooks | Local completed connection | Original URL opener becomes eligible | Previously queued events and SDK cache behavior need runtime checks |
| Startup task filter | Skips ten named jobs | Later eligible jobs can run | Restart to reevaluate skipped initialization |
| Engage service gateway | Uses SDK's unavailable-service path | Original service becomes eligible | Recheck recovery after an active request fails |
| Google advertising ID getters | All-zero ID and tracking-limited answer | Original getter answer | Existing cached values aren't erased by this filter |
| Shared-link cleaner | Removes known query fields at covered outgoing boundaries | Original shared/copied text | Already copied or sent text is unchanged |
| Eight analytics metadata fields | Installed manifest values remain in effect | Values remain present | Repatch without Disable analytics to remove its manifest edits |
| Three ad permissions and ad-services property | Declarations absent | Declarations remain absent | Repatch without Remove ad tracking permissions |
| Google sign-in signature metadata | Metadata remains present | Metadata remains present | Repatch without the compatibility patch |

Disable analytics writes all eight metadata values below. “Permanent edit” means Hush cannot undo the manifest change with its runtime switch. Individual SDKs can still give some runtime APIs precedence over a manifest default.

| Application metadata | Patched value | Meaning and qualification |
| --- | --- | --- |
| `firebase_analytics_collection_deactivated` | `true` | Analytics deactivation for this APK |
| `firebase_crashlytics_collection_enabled` | `false` | Default automatic Crashlytics collection off, if that SDK is included |
| `firebase_performance_collection_deactivated` | `true` | Performance deactivation flag, if supported by the included SDK |
| `google_analytics_adid_collection_enabled` | `false` | Google Analytics advertising ID collection off |
| `google_analytics_default_allow_analytics_storage` | `false` | Denied default |
| `google_analytics_default_allow_ad_storage` | `false` | Denied default |
| `google_analytics_default_allow_ad_user_data` | `false` | Denied default |
| `google_analytics_default_allow_ad_personalization_signals` | `false` | Denied personalization default |

The source writes these values only after the full bytecode preflight succeeds. Duplicate declarations cause refusal before the edit. The existing fixture contract expects the four `google_analytics_default_allow_*` fields to be `true` in both stock target manifests. That is a manifest fact, not an observation of regional consent behavior. See [metadata implementation](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/DisableAnalyticsPatch.kt#L72), [preflight dependency](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/DisableAnalyticsPatch.kt#L105) and [fixture manifest contract](../patches/src/test/kotlin/app/morphe/patches/pinterest/privacy/AdTrackingManifestTest.kt#L33).

Firebase describes Analytics deactivation as permanent for that version of the app. Crashlytics has a different contract: `setCrashlyticsCollectionEnabled` overrides its manifest default, and `sendUnsentReports` can submit retained reports while automatic collection is disabled. The direct DEX scan found neither call by name and found no `firebase_crashlytics` instruction-string hit in 14.38.0. Treat this as an update check, not a demonstrated escape. Adding a defensive manifest flag doesn't prove that its SDK ships or transmits data. Sources: [Firebase Analytics controls](https://firebase.google.com/docs/analytics/android/configure-data-collection), [Crashlytics Android API](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics).

Remove ad tracking permissions removes exactly these declarations:

- `com.google.android.gms.permission.AD_ID`
- `android.permission.ACCESS_ADSERVICES_AD_ID`
- `android.permission.ACCESS_ADSERVICES_ATTRIBUTION`
- Application property `android.adservices.AD_SERVICES_CONFIG`

It doesn't remove Internet access, authentication, cookies, push registration or all attribution mechanisms. Google documents an all-zero advertising ID when an app targeting API 33 or later lacks AD_ID. This Pinterest build targets API 36. See [patch implementation](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/RemoveAdTrackingPermissionsPatch.kt#L24) and [Android's AD_ID behavior](https://developer.android.com/about/versions/13/behavior-changes-13#advertising-id).

### Identifier and attribution evidence in the original APK

This table records exact 14.38.0 native anchors. Each finding is static. It establishes construction or reading of a value, not server receipt.

| Native anchor | Direct observation | Patch implication |
| --- | --- | --- |
| `Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;` and `->isLimitAdTrackingEnabled()Z` | Public getter boundary used by Google measurement, AppsFlyer, ad code and first-party callers | Current Hide advertising ID hooks every return and supplies zeros / true |
| `Lv70/g;->intercept(Lr93/b0;)Lr93/r0;`, getter call at instruction 155, header key at 162 | One merged interceptor branch reads the Google ID and adds `X-Pinterest-Advertising-Id`; absent values become an empty string | Existing getter filtering covers this API-header path, not only dedicated telemetry uploads |
| Same interceptor, strings at instructions 149, 170, 185, 261 and 266 | Adds `Accept-Language`, `X-Pinterest-WebView-Supported`, `X-Pinterest-AppState` and optional `X-Pinterest-Platform-BID`; WebView capability uses `android_3p_webview_ads` | Classify optional fields before filtering. Platform-BID's meaning and lifetime remain unknown |
| Same merged interceptor, `AuthenticatedHeaderInterceptor` error text and `Bearer %s` | Other branches enforce authorized domains and handle authentication | A whole-method stub would be unsafe. Target the relevant branch and value |
| `Lb/l5;->c(Landroid/content/Context;)Ljava/lang/String;`, instructions 14 to 24 | Reads Secure `android_id`, derives a value and caches it through `Lads_mobile_sdk/kv0;->g:AtomicReference` | Candidate for ad-specific caller analysis. The Google Info getter patch doesn't cover it |
| `Lads_mobile_sdk/uc1;->a()V` and `Ldl/b0;->a(Context)Z` | Call `Lb/l5;->c` | Trace these consumers before deciding whether to suppress, normalize or leave the derived value |
| `Lz/a1;->C(Landroid/content/Context;)Lfu0/t;` | Combines Android ID, model, manufacturer, Build.SERIAL and package name with `com.linecorp.linesdk.sharedpreference.encryptionsalt`, then derives AES and HmacSHA256 keys | Concrete non-telemetry use. Global Android ID replacement could break decryption of existing local data |
| `Lads_mobile_sdk/ez;->x(Lk53/a;)Ljava/lang/Object;` | Reads Secure `advertising_id` at instruction 53 | Alternative ID source outside Google Info getter coverage; platform conditions still need classification |
| `Lcom/appsflyer/internal/AFb1jSDK;->k_(Landroid/content/ContentResolver;)Lcom/appsflyer/internal/AFb1mSDK;` | Checks manufacturer `Amazon`, then reads `limit_ad_tracking` and `advertising_id` | Present alternative-platform path, not evidence of use on Samsung. AppsFlyer transport protection is separate |
| `Llm0/b;->onInstallReferrerSetupFinished(I)V` | Reads Google Play ReferrerDetails, passes the string to `Llm0/e;->b`, stores the resulting JSON through two preference keys and ends the connection | First-party referrer processing exists independently of AppsFlyer |
| `Llm0/e;->b(Ljava/lang/String;)Ljava/lang/String;` | Handles `af_dp` with `pid=mweb`, parses decoded `utm_content`, distinguishes organic attribution and retains campaign/source/medium fields | Preserve deferred navigation before removing install attribution |
| `Llm0/a;->call()Ljava/lang/Object;` | Builds APP_START metadata with entry route, `full_url`, theme, powerscore and optional `mweb_unauth_id` / `amp_client_id` from the incoming URI | Follow the event through the uploader before deciding whether existing hooks already suppress transmission |
| `Lx30/b;->b(APP_START, ...)` and conditional `Lp30/e;->l(...)` from `Llm0/a;->call` | Event construction reaches reporting abstractions | End-to-end transport coverage remains to be established for this specific route |
| `Lcom/appsflyer/internal/AFi1aSDK;->getRevenue(...)` | Reads Play InstallReferrerClient and ReferrerDetails | AppsFlyer attribution consumer |
| `Lcom/appsflyer/internal/AFj1oSDK$3;->onGetAppsReferrerSetupFinished(I)V` | Reads Xiaomi GetApps referrer details | Platform-specific SDK path; execution on a Google Play install is unproven |
| `Lx20/u;-><clinit>()V` | Contains `TAG_APPSFLYER_INIT` | Current startup enum anchor |
| `Luf/a;-><init>(Luf/a;Lri/h;La0/a;Ltf/c;)V` | Contains `https://notify.bugsnag.com` | Default reporting destination is present; this alone doesn't prove an upload |

The request-header branch copies a cached base map before adding current values. Further inspection should enumerate that map's complete contents and each field's purpose. Preserve authorization checks and normal feed operations when testing any narrower privacy hook.

The Play referrer parser copies `utm_source`, `utm_medium`, `utm_campaign` and `app_upsell_type`, and can mark `from_play_install_referrer_link`. The APP_START builder distinguishes push, pull-notification, deep-link and web-URL starts. Its event map can contain the entire incoming URL. Cleaning a URL only after its original value has been recorded won't reduce that earlier event.

Do not describe every Android ID reader as tracking. The LINE SDK key-derivation path above is a concrete counterexample with potential account-data consequences. Only change identifiers at a proven telemetry or ad boundary.

### Advertising ID behavior

Hide advertising ID supplies `00000000-0000-0000-0000-000000000000` and `true` for tracking limited. It filters the getter's answer after the getter's own read. It doesn't erase old SDK caches or server history. Fourteen caller methods of the ID getter were found in the 14.38.0 DEX scan, including `Lf20/d0;`, `Lf20/k0;`, AppsFlyer, Google measurement code and the request-header branch above. See [bytecode filter](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/HideAdvertisingIdPatch.kt#L31), [runtime answers](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/AdvertisingId.java#L23) and [fixture contract](../patches/src/test/kotlin/app/morphe/patches/pinterest/privacy/AdvertisingIdFixtureTest.kt#L38).

Analytics and advertising ID runtime hooks allow original behavior until `Utils.settingsReady()` is true. The extension sets context at the start of Application.onCreate and resolves Pause/safe-mode state before enabling setting reads. Potential calls before that point need separate analysis. Forcing settings initialization before context is available can make the settings class unusable for the rest of the process. See [startup hook](../patches/src/main/kotlin/app/morphe/patches/pinterest/misc/extension/PinterestExtensionPatch.kt#L31) and [settings-readiness contract](../extensions/shared/library/src/main/java/app/hushpinterest/extension/shared/Utils.java#L498).

### Shared links and attribution fields

Strip link tracking redirects three framework boundaries: `Intent.putExtra(String,String)`, `Intent.putExtra(String,CharSequence)` and `ClipData.newPlainText`. Only `Intent.EXTRA_TEXT` is cleaned. Navigation, sign-in extras and unrelated extra keys keep their original values. See [boundary selection](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/StripLinkTrackingPatch.kt#L23).

| Query class | Fields removed or preserved |
| --- | --- |
| Removed from covered HTTP(S) links | `utm_*`, `fbclid`, `gclid`, `dclid`, `msclkid`, `gbraid`, `wbraid`, `igshid`, `mc_cid`, `mc_eid`, `_ga`, `_gl`, `epik`, `srsltid` |
| Removed only on `pinterest.com`, its subdomains and `pin.it` | `sender`, `sender_id`, `tracking_id`, `share_uid` |
| Preserve the entire URL when present | `signature`, `sig`, `token`, `access_token`, `auth`, `authorization`, `code`, `x-amz-signature`, `x-goog-signature`, `oauth_signature`, and any key starting `x-amz-` or `x-goog-` |

The cleaner retains raw functional values, duplicate keys, ordering and fragments. It doesn't resolve opaque `pin.it` tokens or convert them to `/pin/<id>/` links in this source revision. Pinterest-specific cleaning covers `.com` and `pin.it`, while app links include additional regional domains. The APP_START attribution keys `mweb_unauth_id` and `amp_client_id` also remain outside the current removal set. These are precise coverage candidates, not a reason to delete arbitrary query parameters. Implementation: [LinkTracking.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/LinkTracking.java#L30), [host scope](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/LinkTracking.java#L87), [signed-link preservation](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/LinkTracking.java#L92).

Nested destination URLs, tracking inside fragments, HTML/URI ClipData, Intent data and app-specific direct-share fields aren't established as covered. Each needs its own fixture and destination-preservation checks. A canonical pin-link option should use an already known typed pin ID where possible, avoiding an extra resolver request.

### Authentication, push and Hush's own requests

The privacy patches leave Firebase Messaging, Installations, WorkManager and auth declarations intact. The local Push readiness report checks notification permission, enablement, optional delegation, messaging components and the analytics metadata. It does not verify server registration or live delivery. See [manifest preservation contract](../patches/src/test/kotlin/app/morphe/patches/pinterest/privacy/AnalyticsManifestTest.kt#L26) and [PushReadiness.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/settings/PushReadiness.java#L27).

Spoof signature for Google sign-in is a compatibility patch. It adds metadata interpreted by microG-RE or signature-spoofing modules. Stock Google Play services ignores that metadata; it doesn't give an ordinarily re-signed APK Pinterest's approved OAuth signing identity. Keep email sign-in and OAuth return routes in acceptance checks for changes to attribution or navigation. See [GoogleSignInSpoofPatch.kt](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/GoogleSignInSpoofPatch.kt#L111).

Traffic analysis must account for Hush's own optional requests. Automatic release checks start off, use GitHub's latest-release endpoint at most once daily after enabling, and send a HushPinterest/version User-Agent with a constrained cookie and redirect policy. Manual Check now is user-triggered. Download features can make user-requested media and original-availability requests to Pinterest media hosts. These aren't automatic telemetry, but they must be classified correctly in a capture. See [release-check policy](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/settings/ReleaseCheck.java#L60), [headers](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/settings/ReleaseCheck.java#L398) and [media transfer](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/actions/PinTransfer.java#L47).

### Concrete privacy opportunities

| Priority | Candidate | Required proof and acceptance |
| --- | --- | --- |
| High | Generate telemetry, transport, startup-tag and identifier diffs for every APK update | Record exact annotations, callers and newly unclassified paths. A successful patch must not imply that new telemetry was inventoried |
| High | Compare stock and patched network behavior using controlled actions | Same app build and comparable account/consent state; welcome, feed, search, closeup, share, background and restart. Preserve TLS and account data. Store sanitized counts and destinations rather than secrets or raw account payloads |
| High | Trace APP_START and optional API-header fields to their final transport | Determine whether current telemetry wrappers already suppress each route. Preserve authorization, normal requests, deferred links and push registration |
| High | Offer canonical pin links using a typed pin ID | Separate opt-in control; preserve non-pin invites and signed links. Check image/video copy/share, unknown pin.it links, direct-to-app shares, cancellation and absence of UI-thread networking |
| Medium | Extend regional-host and known attribution-key cleaning | Exact trusted domains; `mweb_unauth_id` and `amp_client_id` only after destination checks. Cover deceptive suffixes, encoding, uppercase keys and unrelated sites with legitimate `sender` values |
| Medium | Reduce install attribution without removing first-open navigation | Trace referrer fields individually. Check Play installs and sideloads, organic attribution, campaign links, `af_dp`, `utm_content`, sign-in and error handling |
| Medium | Audit collection before settings readiness | Inspect provider initialization and other early entry points. Preserve safe mode, secondary processes and cold-start behavior. Prefer targeted controls over premature settings reads |
| Medium | Separate Engage recommendations from general analytics | Explain the affected recommendation feature. Verify devices with and without Engage, service recovery and absence of retry loops |
| Medium | Audit native and web measurement paths | Establish the path before changing it. Compare video, media, auth and ad-session behavior with the candidate enabled and disabled |
| Medium | Separate crash diagnostics from usage and advertising telemetry | Keep current defaults. Define what may remain local and what can upload, rather than grouping all reporting together |
| Low | Improve permanent-versus-runtime privacy diagnostics | Show installed manifest facts and bounded hook counters without identifiers or misleading claims of anonymity |

The source and existing tests establish exact hook boundaries and intended behavior. They don't establish that every tracking path is stopped. A complete runtime comparison must distinguish cold from warm starts, test Off and Pause, check delayed or cached uploads and record server experiments. Local counters and intact messaging components are useful evidence, but neither proves network suppression or live notification delivery.

### Decoded Android network policy

The original `res/xml/network_security_config.xml` sets `base-config cleartextTrafficPermitted="true"`. A more specific domain configuration sets cleartext to false for `pinterest.com`, `pinimg.com`, `branch.io`, `facebook.com`, `appsflyer.com`, `bugsnag.com` and `cedexis.com`, including their subdomains. The broad base rule therefore isn't a claim that these listed services use plain HTTP.

The only explicit user-certificate trust anchor is inside `debug-overrides`. This original release isn't debuggable, so that node doesn't establish that a user-installed certificate will enable TLS interception. No trust configuration, certificate or pinning code was changed during the survey. The separate `res/xml/ga_ad_services_config.xml` declares attribution with `allowAllToAccess="true"`; that is an access policy, not evidence that an attribution event occurred.

A narrower base cleartext policy is a possible hardening change. First inventory real HTTP use, especially external web destinations, redirects and SDK fallbacks. Changing the default without those checks could break intentional navigation. Retain the domain and trust-policy diff as part of each original-APK update review.

### Initial network capture and the working follow-up

The later [runtime measurement](pinterest-14.38.0-runtime.md) used a guest capture on the active Wi-Fi interface and obtained useful application traffic. It confirmed primary-UID-correlated TLS connections naming Pinterest services and AppsFlyer, with independent per-UID traffic and CPU counters. The earlier failed capture below is retained to explain why its apparent silence was misleading.

A whole-emulator packet capture ran during the signed-in factory survey on October 9, 2026, approximately 4:11 PM to 4:29 PM EDT. Pinterest was in the foreground while home, pin, search and settings screens were inspected. Other apps and system services were present. No TLS decryption was performed, and no advertiser destination was opened.

The capture mechanism did not provide useful application traffic in this environment. Its 2,824-byte PCAP contained eight Ethernet packets. The first and last recorded packets were 843 seconds apart, which describes the observed packet span, not the full capture window.

| Recorded evidence | Count |
| --- | --- |
| Ethernet packets | 8 |
| Multicast DNS response packets, UDP port 5353 | 4 |
| ICMPv6 packets | 4 |
| TCP packets | 0 |
| Conventional DNS queries or responses, port 53 | 0 |
| Visible TLS ClientHello SNI names | 0 |
| Application destinations established by this capture | 0 |

The multicast DNS records described local discovery. Their names and address values are excluded from the public evidence. No app-level attribution can be made from these packets.

**This result does not show that Pinterest sends no tracking or advertising traffic.** A sparse capture can miss the application's actual network path. Reused connections also produce no new TLS ClientHello, so absent SNI would not establish absent traffic even with a working capture. The offline parser additionally does not decode QUIC/HTTP3, encrypted DNS, hidden Encrypted ClientHello names, TCP DNS or fragmented IP traffic. Visible outer SNI, when present, can be a cover name rather than the hidden destination.

The follow-up established a working collection path and conservative per-app correlation. Static endpoint and SDK findings still remain separate from confirmed payload delivery. Stock and patched builds should now be compared using equivalent actions, account state and cold/warm starts. Record sanitized destinations and counts, keep authentication data private, and distinguish a DNS lookup or TLS handshake from a completed upload.
