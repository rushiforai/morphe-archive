# Buienalarm 4.32.0 tracking inventory

This inventory concerns the extracted 4.32.0 (3723) APKs. It distinguishes packaged capability, inspected entry paths and disabled controls. It does not establish that every possible runtime or dynamically downloaded telemetry path has been eliminated.

## Artifact boundary

The Play Store base contains three DEX files with 21,278 classes, identical to the original standalone input's DEX bytes. There is an additional Meta Audience Network DEX asset with 3,605 class definitions. The ARM64 split contains graphics-path, datastore-counter and QuickJS libraries. The native string scan found no independent tracking endpoints; this is not a proof about all native execution or Java callbacks.

The static walkthrough used the decoded manifest, class/method references, bundled assets and endpoint strings. No decrypted HTTP capture is part of the evidence. The REA Android provider was unavailable because its separately required JADX MCP JAR was not configured; the artifact analysis used local apktool/smali instead.

## Identified collectors and controls

Paths below are relative to the original apktool extraction. Obfuscated names are intentionally bounded to the verified DEX version.

| System / capability found | Inspected path | Disable tracking control |
| --- | --- | --- |
| GA4 events, properties and user-ID linkage | `bk2.a`, `du3.c`, `xe8.invoke`; SDK collection precedence in `je9.Y3` / `g9c.b` | Hard `firebase_analytics_collection_deactivated=true`; app-owned event/property/PPID-ID submissions return before SDK calls. Hard deactivation takes precedence over persisted or later API enablement. |
| Background measurement and analytics connector | Manifest AppMeasurement receiver/service/job, AnalyticsConnectorRegistrar and preview activity | Connector registrar removed; measurement components and preview activity disabled. Weather WorkManager components are retained. |
| Google Tag Manager | `assets/containers/GTM-P87V6J8.json` contains UA-32940946-2 and Firebase screenview tags; `nkc` probes TagManager during enabled measurement | Container removed; inspected reflection path is also gated by hard analytics deactivation. Container presence alone did not prove it executed. |
| Facebook App Events and consent-based re-enablement | `zf2.invoke`, `of.invoke` case 5; MainActivity DI factory creates `com.facebook.appevents.k` | Consent listener and init providers disabled. Logger construction returns an inert non-null facade, with purchase/GPS/auto-IAP consumers (`rf2`, `q43`, `u20`) stopped. This avoids the startup crash produced by disabling initialization alone. |
| Meta Audience Network dynamic payload | `assets/audience_network/classes.dex` and provider | Provider disabled and executable asset removed. The ordinary app DEX's separate App Events facade is handled above. |
| Google Mobile Ads / advertising signals | Banner startup initializer, MobileAdsInitProvider, AdService and advertising/referrer SDKs | Banner initializer returns its existing Unit singleton; providers/service disabled; banner-loader and ad-decision gates retained. AD_ID, AdServices and install-referrer permissions removed. The subsequent full-screen report identified lazy interstitial coordinator `ms3.a`, now stopped before request/deferred creation and display. |
| PubMatic/OpenWrap, device profiling, OMID and independent crash reporting | `MPBannerFragment` constructs PubMatic only after its enabled check; POBDeviceInfoReader / POBCrashReporter are inside that SDK | Inspected app-level entry is gated before PubMatic construction. OpenWrap and OMID JavaScript payloads removed. No independent PubMatic manifest initializer was found. SDK classes remain packaged but their identified app entry is disabled. |
| Amazon PrivacyPass ad attestation | PubMatic OMID attestation adapter | ATTEST permission and optional PrivacyPass library declaration removed. |
| Partner ad targeting | `io.b` requests `/v2/ads/targetting`, called by banner-only paths | This precise method returns before making the request. The shared `api.meteoplaza.com` host is not blocked because it also serves weather. |
| Cross-app PPID | `xq5.a`, PPIDContentProvider, six sibling-app query permissions; MainActivity attaches PPID/city/country to ad targeting | ID source returns empty before reads, generation or cross-app queries; provider disabled; query permissions removed; targeting and analytics ID consumers stopped. Existing stored values are not claimed to be erased. |
| Firebase Crashlytics | Registrar/Ktx registrar; `gk2` API is dereferenced unconditionally by app code | Registrars removed, getter returns a non-null inert wrapper, and all three public logging/exception/custom-key sinks are stopped. |
| Firebase Sessions | Sessions registrar and local/remote enablement paths | Registrar removed and local enablement false. Separate from Firebase Installations. |
| Firebase In-App Messaging | Core/display and Ktx registrars | Four marketing registrars removed. Firebase Messaging weather notifications are retained. |
| FCM notification analytics and BigQuery delivery export | `qa1.p` prefers persisted export setting over manifest; optional analytics connector used by notification event logging | Export predicate returns false regardless of cached preference; analytics connector removed. Delivery and notification handling remain intact. |
| Didomi operational metrics | `io.didomi.sdk.e9` checks whether performance/API metrics are enabled | Metrics predicate returns false. Consent configuration and explicit manual privacy interactions remain functional; consent setters are not rewritten. |
| Legacy LiveRamp configuration | `assets/gdpr-mobile-liveramp.json`; no direct code reference found in the inspected ordinary DEX | Dormant configuration asset removed. Its presence was not treated as observed traffic. |
| RevenueCat automatic optional identifiers | Configuration defaults true; GoogleDeviceIdentifiersFetcher collects ad ID/IP/device attributes | Automatic identifier getter returns false and explicit optional collection entry point is stopped. |
| Firebase-to-RevenueCat linkage and optional attributes | App `tr` calls `setFirebaseAppInstanceID`; `t41` supplies `subscription_type` | Optional setter entry points stopped. Unsynced optional-attribute getters return empty maps so previously cached attributes are not uploaded; the existing empty-map completion path is retained. |
| RevenueCat paywall/ad events and diagnostics | `EventsManager.track/flushEvents`, priority/legacy flush; DiagnosticsTracker/Synchronizer | Collection, persistence and queued-flush entry points stopped. Callback-bearing transport and purchase-verification methods are not given fake responses. |
| Maps-utils library attribution | AttributionIdInitializer sends fixed `gmp_git_androidmapsutils_v4.5.0` | Only that startup metadata is removed. This was library-usage instrumentation, not a unique user ID. |

No standalone namespace was found for AppsFlyer, Adjust, Amplitude, Sentry, Mixpanel, Segment, Snowplow, Branch, Flurry, AppMetrica, OneSignal, Airship, CleverTap, MoEngage, Kochava, Singular or Braze in the inspected ordinary DEX. Several names are RevenueCat reserved integration attributes; Didomi also has an AppsFlyer reflection adapter. Those strings are not evidence that the corresponding SDK is installed or running.

## Preserved functional interactions

- Firebase Init, Common, Installations, Remote Config, ABT and Messaging remain. ABT is required by Remote Config; analytics is an optional provider. Configuration fetch still needs a Firebase installation identity.
- Weather routing and its data APIs remain unchanged. Weather requests necessarily carry a requested location and ordinary service metadata.
- NotifyHub notification registration, notification ID and location updates remain because they provide precipitation notifications. These are continuing identifiable service interactions, not a claim of zero network identity.
- RevenueCat identity, receipts, customer information, entitlements, offerings and transaction callbacks remain. IdentityManager, PostReceiptHelper and the weather ApiManager implementation were checked unchanged in inspected output.
- Google Maps rendering is retained. Dynamite/Play-services code loaded outside the APK is a runtime boundary; the patch does not claim to remove all operational telemetry from Google's external components.
- Manual Privacy preferences and Didomi's stored consent APIs remain. Skip consent screens writes neither acceptance nor rejection; it only routes the existing automatic UI flow through its completion state after tracking controls are enabled.
- Necessary AndroidX context, lifecycle, profile and WorkManager initialization remains. Local logging and local runtime functionality are not automatically classified as remote tracking.

## Verification and release status

`tests/verify_privacy.py` checks the identified manifest controls, payload removal, SDK/event/ID/targeting entry points, preserved consent APIs/manual preferences, and unchanged weather/TLS resources. Static verification is not a packet-capture proof of no traffic.

Before the user's request to stop further agent-run tests, the fresh emulator flow reached Ready and MainActivity's Manage locations state without cookie or ad-choice screens, and Firebase activated the live weather configuration with analytics deactivated. No claim of physical-phone validation follows. Prereleases are for the user's real-world testing.
