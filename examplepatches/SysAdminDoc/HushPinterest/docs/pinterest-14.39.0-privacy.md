# Pinterest 14.39.0: Tracking and privacy

Traced on Pinterest 14.38.0 on October 9, 2026 and remapped to 14.39.0 (version code 14398020) on October 10. Part of the [factory app audit](pinterest-14.39.0-audit.md). Source baseline `6383001`. See the audit entry point for the APK identity, live observations, and evidence limits.

## Tracking, attribution and privacy controls

This section covers the original Pinterest 14.39.0 APK (version code 14398020) and HushPinterest source at `6383001`. It was first traced on 14.38.0 on October 9, 2026, and every native descriptor below was found again on 14.39.0 on October 10. Where a name changed, the 14.38.0 one follows in parentheses. Behavior descriptions were traced on 14.38.0. On 14.39.0 each identity was found again by the same string, annotation or caller and checked for the same shape, not traced again instruction by instruction. Descriptors belong to one exact Pinterest build, so don't copy one into a fingerprint for another.

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

Suppressed calls complete locally using Pinterest's own asynchronous response shapes. Coroutine methods receive `NetworkResponse.Success(Unit)`. The supported `log/` shape receives the app's `Single.just` factory around an empty JSON object. Compatible remaining methods receive a completed Completable. This allows subscribers to finish instead of waiting indefinitely. The deferred tracking queue remains eligible to run so its work can consume those completed responses. See [response construction](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/DisableAnalyticsPatch.kt#L276) and the [queue behavior contract](../extensions/pinterest/src/test/java/app/hushpinterest/extension/pinterest/privacy/AnalyticsTest.java#L59).

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

The patch finds the enum by its preserved labels, then identifies the scheduler through its Runnable, enum field and Map-writing method. It checks the task label before running that method. In 14.39.0, the enum containing `TAG_APPSFLYER_INIT` is `Ld30/v;` (`Lx20/u;` in 14.38.0). Unknown labels stay eligible, as do auth, account, feed, Firebase Messaging and WorkManager jobs. Source: [task list](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/Analytics.java#L35), [scheduler discovery](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/DisableAnalyticsPatch.kt#L487).

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
| GmsCore support's Play services names | Calls, permissions and authorities name microG-RE | Still name microG-RE, since the rewrite reads no setting | Repatch without GmsCore support |
| Change package name | The copy runs under its own package, permissions and authorities | Unchanged | Repatch without Change package name, which installs as a different app |

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

Firebase describes Analytics deactivation as permanent for that version of the app. Crashlytics has a different contract: `setCrashlyticsCollectionEnabled` overrides its manifest default, and `sendUnsentReports` can submit retained reports while automatic collection is disabled. The direct DEX scan found neither call by name and found no `firebase_crashlytics` instruction-string hit in 14.38.0 or 14.39.0. Treat this as an update check, not a demonstrated escape. Adding a defensive manifest flag doesn't prove that its SDK ships or transmits data. Sources: [Firebase Analytics controls](https://firebase.google.com/docs/analytics/android/configure-data-collection), [Crashlytics Android API](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics).

Remove ad tracking permissions removes exactly these declarations:

- `com.google.android.gms.permission.AD_ID`
- `android.permission.ACCESS_ADSERVICES_AD_ID`
- `android.permission.ACCESS_ADSERVICES_ATTRIBUTION`
- Application property `android.adservices.AD_SERVICES_CONFIG`

It doesn't remove Internet access, authentication, cookies, push registration or all attribution mechanisms. Google documents an all-zero advertising ID when an app targeting API 33 or later lacks AD_ID. This Pinterest build targets API 36. See [patch implementation](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/RemoveAdTrackingPermissionsPatch.kt#L24) and [Android's AD_ID behavior](https://developer.android.com/about/versions/13/behavior-changes-13#advertising-id).

### Identifier and attribution evidence in the original APK

This table records exact 14.39.0 native anchors, with the 14.38.0 name in parentheses where it changed. Each finding is static. It establishes construction or reading of a value, not server receipt.

| Native anchor | Direct observation | Patch implication |
| --- | --- | --- |
| `Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;` and `->isLimitAdTrackingEnabled()Z` | Public getter boundary used by Google measurement, AppsFlyer, ad code and first-party callers | Current Hide advertising ID hooks every return and supplies zeros / true |
| `La80/g;->intercept(Lra3/b0;)Lra3/s0;` (`Lv70/g;`), getter call at instruction 155, header key at 162 | One merged interceptor branch reads the Google ID and adds `X-Pinterest-Advertising-Id`; absent values become an empty string | Existing getter filtering covers this API-header path, not only dedicated telemetry uploads |
| Same interceptor, strings at instructions 149, 170, 185, 261 and 266 | Adds `Accept-Language`, `X-Pinterest-WebView-Supported`, `X-Pinterest-AppState` and optional `X-Pinterest-Platform-BID`; WebView capability uses `android_3p_webview_ads` | Classify optional fields before filtering. The header table below explains both |
| Same merged interceptor, `AuthenticatedHeaderInterceptor` error text and `Bearer %s` | Other branches enforce authorized domains and handle authentication | A whole-method stub would be unsafe. Target the relevant branch and value |
| `Lb/n5;->c(Landroid/content/Context;)Ljava/lang/String;` (`Lb/l5;`), instructions 14 to 24 | Reads Secure `android_id`, derives a value and caches it through `Lads_mobile_sdk/kv0;->g:AtomicReference` | Candidate for ad-specific caller analysis. The Google Info getter patch doesn't cover it |
| `Lads_mobile_sdk/uc1;->a()V` and `Ldl/b0;->a(Context)Z` | Call `Lb/n5;->c` | Trace these consumers before deciding whether to suppress, normalize or leave the derived value |
| `Lxg/r2;->I(Landroid/content/Context;)Llp1/x;` (`Lz/a1;->C`) | Combines Android ID, model, manufacturer, Build.SERIAL and package name with `com.linecorp.linesdk.sharedpreference.encryptionsalt`, then derives AES and HmacSHA256 keys | Concrete non-telemetry use. Global Android ID replacement could break decryption of existing local data |
| `Lads_mobile_sdk/ez;->x(Lk63/a;)Ljava/lang/Object;` | Reads Secure `advertising_id` at instruction 52 (53 in 14.38.0) | Alternative ID source outside Google Info getter coverage; platform conditions still need classification |
| `Lcom/appsflyer/internal/AFb1jSDK;->k_(Landroid/content/ContentResolver;)Lcom/appsflyer/internal/AFb1mSDK;` | Checks manufacturer `Amazon`, then reads `limit_ad_tracking` and `advertising_id` | Present alternative-platform path, not evidence of use on Samsung. AppsFlyer transport protection is separate |
| `Lxm0/b;->onInstallReferrerSetupFinished(I)V` (`Llm0/b;`) | Reads Google Play ReferrerDetails, passes the string to `Lxm0/e;->b`, stores the resulting JSON through two preference keys and ends the connection | First-party referrer processing exists independently of AppsFlyer |
| `Lxm0/e;->b(Ljava/lang/String;)Ljava/lang/String;` (`Llm0/e;`) | Handles `af_dp` with `pid=mweb`, parses decoded `utm_content`, distinguishes organic attribution and retains campaign/source/medium fields | Preserve deferred navigation before removing install attribution |
| `Lxm0/a;->call()Ljava/lang/Object;` (`Llm0/a;`) | Builds APP_START metadata with entry route, `full_url`, theme, powerscore and optional `mweb_unauth_id` / `amp_client_id` from the incoming URI, then hands the same map to both sinks in the next row | Both sinks end at endpoints Disable analytics wraps (traced 2026-10-10, below) |
| `Ld40/b;->d0(APP_START, ...)` and conditional `Lv30/e;->l(...)` from `Lxm0/a;->call` (`Lx30/b;->b` and `Lp30/e;->l`) | `d0` on `Ll20/b0;` (the real logger; `Ll20/y;` only builds the event) queues an `Lop2/u1;` event, and event batches go out as bytes through `Lkd/e;->U` and `Lnj2/b;->a` to `Lnj2/a;->a`, `POST v3/callback/event/`. `l("android.app_start.<kind>", map)` runs `Lv30/c;` on a worker, which calls `Lv30/f;->c`, `POST v3/callback/track_funnel/{event}/` with the map as form fields, `full_url` included | Covered while Disable analytics is on: both service methods carry annotated paths the patch rewrites every call to, and the `Lv30/c;` call is an ordinary interface call. The hop from the `Ll20/b0;` queue to `Lkd/e;->U` wasn't walked one call at a time. Off or paused, Pinterest gets the full launch URL as before |
| `Lcom/appsflyer/internal/AFi1aSDK;->getRevenue(...)` | Reads Play InstallReferrerClient and ReferrerDetails | AppsFlyer attribution consumer |
| `Lcom/appsflyer/internal/AFj1oSDK$3;->onGetAppsReferrerSetupFinished(I)V` | Reads Xiaomi GetApps referrer details | Platform-specific SDK path; execution on a Google Play install is unproven |
| `Ld30/v;-><clinit>()V` (`Lx20/u;`) | Contains `TAG_APPSFLYER_INIT` | Current startup enum anchor |
| `Luf/a;-><init>(Luf/a;Lqe/b;Lqe/d;Ltf/c;)V` | Contains `https://notify.bugsnag.com` | Default reporting destination is present; this alone doesn't prove an upload |

The request-header branch copies a cached base map before adding current values. Read on 14.39.0 (2026-10-10): the base map is `Lz70/a;->g`, built once by `Lxj2/b;` (case 3), and `La80/g;->intercept` (switch case 2) puts every entry on each API request, then adds the per-request values. Disable analytics doesn't touch headers, so only the rows marked covered change today.

| Header | Value | Coverage |
|---|---|---|
| `User-Agent` | `Pinterest for Android/<version> (<build>; <Android release>)`, with `for Android Tablet` on tablets | None. Functional |
| `X-Pinterest-Device` | `Build.MODEL` | None |
| `X-Pinterest-Device-Manufacturer` | `Build.MANUFACTURER` | None |
| `X-Pinterest-InstallId` | 26 hex characters from a random UUID plus the last five of the MD5 of those characters and `user`, made once per install and kept as `PREF_INSTALL_ID` in `pinterest.persist.xml`, `Lkd/y;->L` | None, and none planned. Stable until Pinterest's data is cleared. Swapping it mid-session broke nothing that was checked (see [Install ID](#install-id)) |
| `X-Pinterest-App-Type-Detailed` | The app type enum's number | None. Functional |
| `Accept-Language` | The device locale | None. Functional |
| `X-Pinterest-Advertising-Id` | The Google advertising ID, or empty | Covered by Hide advertising ID (row above) |
| `X-Pinterest-WebView-Supported` | `true` or `false` from the `android_3p_webview_ads` experiment | None. An ad capability flag, not an identifier |
| `X-Pinterest-AppState` | `active`, `background`, `active_offline` or `background_offline`: the `Lvc0/b;` value in `Lvc0/c;->a`, which `MainActivity.onResourcesReady` and `baseActivity/a.onResume` keep current | None. A foreground and offline flag, not an identifier |
| `X-Pinterest-Platform-BID` | Pinterest's `_b` browser ID cookie. At launch `ReleaseHiltApplication.j()` loads `Lad0/e;->g` from a Google Block Store record named `pid` (`ps_encoded_bid`, `ps_expiry_time`, `ps_last_update_time`). With no record, `Lad0/e;->a` copies the cookie jar's `_b` into a new one that expires years later. `Lhd0/d;->c` saves it with cloud backup on whenever Block Store reports end-to-end encrypted backup. Behind the `android_pid_synchronization` experiment, the response interceptor `Li52/z;->intercept` writes each new `_b` Set-Cookie and its `X-Pinterest-Platform-BID-Update-Time` back. Each step reports an `identity.android.pid.*` event, and a refused cookie logs `BID_COOKIE_REJECTED` through `Ld40/b;->d0` | Covered by Hide advertising ID. With Google backup on, Block Store keeps the record through an uninstall and can restore it on a new phone, so a fresh install could send the old browser ID before anyone signs in. Without backup, Google Play services deletes it when the app is uninstalled. With the switch on, the `pid` read in `Lhd0/d;->b` finds no record and each `pid` save through `Lhd0/d;->c` becomes the wrapper's own delete, `Lhd0/d;->a`, so the stored copy goes and a reinstall or a new phone starts without the old ID. The header still carries this install's own `_b` cookie. `Lad0/e;->c` is Pinterest's own delete (`BID_COOKIE_DELETED`) |
| `X-Node-ID` | `true`, on `graphql` requests only | None. Functional |
| `X-Pinterest-Force-Experiments`, `X-Pinterest-Integration-Test-Mode` | Only when `Lsn0/h;->a()` is set, a test-build flag | Not sent by a normal install |
| `Authorization` | `Bearer` plus the session token, approved domains only | Must stay |

Preserve authorization checks and normal feed operations when testing any narrower privacy hook.

### Install ID

The install ID doubles as Pinterest's signed-out ID. Seventeen methods call `Lkd/y;->L` on 14.39.0. Besides the base header map (`Lxj2/b;`), `Lfc/c;` and `Li52/z;` put it on other request paths, and it goes out as `X-Pinterest-Unauth-ID` from `Lz82/a;->intercept`, which `La60/f;` builds with the user ID. It's AppsFlyer's `unauth_id` (`Lb2/k0;`), part of the analytics context (`Lb40/b;`, `Ll20/b0;`, `Ll20/d0;`), and the ID on push received, opened and board-invite events (`Llu/f;`, `Lcom/google/android/play/core/appupdate/b;->E0`, `Lhk0/b;`). reCAPTCHA timing and error logs carry it (`Lcom/pinterest/security/a;->k`, `Lop2/h8;->F`), the in-app survey URL sends it as `sessionId=` (`Lru0/v;`), and `Lb92/i;` mixes it into a random seed. AppsFlyer keeps its own copy in its preferences, next to the account's user ID.

Checked on 2026-10-10 on the signed-in emulator with the patched build. With Pinterest stopped, `PREF_INSTALL_ID` was swapped for a fresh value made the same way. Pinterest kept the new value, stayed signed in, refreshed and scrolled Home, ran a search, and kept the session through a cold restart. The original value went back afterwards and the session held again. So replacing it is safe for sign-in, sessions, the feed and search. Push couldn't be checked, because on a re-signed build Firebase Installations refuses Pinterest's API key (`API_KEY_ANDROID_APP_BLOCKED`) and no push token is issued at all. A hook to replace it isn't worth adding. Pinterest links the ID to the account at sign-in, every fresh install already gets a new one, and the app can't be browsed signed out, so a rotating value wouldn't hide anything Pinterest doesn't already know.

The Play referrer parser copies `utm_source`, `utm_medium`, `utm_campaign` and `app_upsell_type`, and can mark `from_play_install_referrer_link`. The APP_START builder distinguishes push, pull-notification, deep-link and web-URL starts. Its event map can contain the entire incoming URL. Cleaning a URL only after its original value has been recorded won't reduce that earlier event, so the launch URL is protected by Disable analytics stopping both uploads, not by Strip link tracking.

Do not describe every Android ID reader as tracking. The LINE SDK key-derivation path above is a concrete counterexample with potential account-data consequences. Only change identifiers at a proven telemetry or ad boundary.

### Advertising ID behavior

Hide advertising ID supplies `00000000-0000-0000-0000-000000000000` and `true` for tracking limited. It filters the getter's answer after the getter's own read. It doesn't erase old SDK caches or server history. Fourteen caller methods of the ID getter are in the 14.39.0 DEX, the same count the 14.38.0 scan found. They include methods in `Ll20/b0;` and `Ll20/h0;`, AppsFlyer, Google measurement code and the request-header branch above. See [bytecode filter](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/HideAdvertisingIdPatch.kt#L44), [runtime answers](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/AdvertisingId.java#L33) and [fixture contract](../patches/src/test/kotlin/app/morphe/patches/pinterest/privacy/AdvertisingIdFixtureTest.kt#L43).

The same switch keeps Pinterest's browser ID out of Block Store. A hook at the head of the wrapper's read, `Lhd0/d;->b`, answers no record for the `pid` key. One at the head of its save, `Lhd0/d;->c`, hands a `pid` save to the wrapper's own delete, `Lhd0/d;->a`, on the save's continuation, so the save's callers get the delete's Boolean. Other keys and a coroutine resume (a null key) run Pinterest's own code, and off or Pause leaves both stock. Each launch then reports an `identity.android.pid.get.headers` not_found event. A delete only happens when Pinterest would have saved: `Lad0/e;->a` saves only when the default `CookieHandler` is a `CookieManager` holding an unexpired `_b` cookie, and the `_b` sync in `Li52/z;->intercept` saves when a new one arrives. A first launch after a reinstall usually has no `_b` yet, so a record restored to Block Store can stay there until a later launch carries the cookie. The read stays blocked meanwhile, but turning the switch off before then lets Pinterest read the old ID again. The wrapper catches its own failures, so a delete that fails answers false, just like a failed save. The patch finds the wrapper by shape: the one class outside the extension whose instance methods build Google's `RetrieveBytesRequest`, `StoreBytesData` and `DeleteBytesRequest` from a key, a key and its bytes, and a key list, each on one continuation type.

Checked on 2026-10-10 on an Android 16 emulator with Google Play services and no Google account, signed out of Pinterest, reading Google Play services' Block Store file as root. Stock 14.39.0 saved a `pid` record on its second launch. The patched build with the switch on counted one skipped read and one save turned into a delete over two launches, and left no record. With the switch off, or on but paused, it saved the record the way stock did. Switched back on with that record in place, it skipped the read and deleted the record. Google Play services removed the record every time Pinterest was uninstalled (`Removed Blockstore data for com.pinterest upon uninstallation`), which is what Google documents for a phone without backup. So moving from stock to a patched build, which takes an uninstall because the signatures differ, already clears the old record on such a phone. The backed-up path wasn't reproduced. Request headers are encrypted, so the `X-Pinterest-Platform-BID` value itself wasn't read. See [Block Store hooks](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/HideAdvertisingIdPatch.kt#L224) and [runtime](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/AdvertisingId.java#L76).

Analytics and advertising ID runtime hooks allow original behavior until `Utils.settingsReady()` is true. The extension sets context at the start of Application.onCreate and resolves Pause/safe-mode state before enabling setting reads. Potential calls before that point need separate analysis. Forcing settings initialization before context is available can make the settings class unusable for the rest of the process. See [startup hook](../patches/src/main/kotlin/app/morphe/patches/pinterest/misc/extension/PinterestExtensionPatch.kt#L31) and [settings-readiness contract](../extensions/shared/library/src/main/java/app/hushpinterest/extension/shared/Utils.java#L498).

### Shared links and attribution fields

Strip link tracking redirects three framework boundaries: `Intent.putExtra(String,String)`, `Intent.putExtra(String,CharSequence)` and `ClipData.newPlainText`. Only `Intent.EXTRA_TEXT` is cleaned. Navigation, sign-in extras and unrelated extra keys keep their original values. See [boundary selection](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/StripLinkTrackingPatch.kt#L23).

| Query class | Fields removed or preserved |
| --- | --- |
| Removed from covered HTTP(S) links | `utm_*`, `fbclid`, `gclid`, `dclid`, `msclkid`, `gbraid`, `wbraid`, `igshid`, `mc_cid`, `mc_eid`, `_ga`, `_gl`, `epik`, `srsltid` |
| Removed only on `pinterest.com`, its subdomains, the `www.pinterest.<country>` app-link domains and `pin.it` | `sender`, `sender_id`, `tracking_id`, `share_uid` |
| Preserve the entire URL when present | `signature`, `sig`, `token`, `access_token`, `auth`, `authorization`, `code`, `x-amz-signature`, `x-goog-signature`, `oauth_signature`, and any key starting `x-amz-` or `x-goog-` |

The cleaner retains raw functional values, duplicate keys, ordering and fragments. Strip link tracking alone doesn't resolve opaque `pin.it` tokens. Its Plain pin links switch (off by default) does: a `pin.it` link whose pin Pinterest's own invite log named becomes `https://www.pinterest.com/pin/<id>/`, and an unknown copied one is looked up in the background. With that switch on, a bare `/pin/<id>/` link on `pinterest.com`, one of the two-letter `xx.pinterest.com` sites or a `www.pinterest.<country>` domain from the 14.39.0 app-link list becomes the same canonical link, and a `/pin/<id>/sent/` invite link loses its invite query. Other hosts, other paths (boards, sign-in, account settings) and pin links with any other query or a fragment stay as they are. See [canonical links](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/PlainPinLinks.java#L208). The APP_START attribution keys `mweb_unauth_id` and `amp_client_id` also remain outside the current removal set. These are precise coverage candidates, not a reason to delete arbitrary query parameters. Implementation: [LinkTracking.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/LinkTracking.java#L31), [host scope](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/LinkTracking.java#L119), [signed-link preservation](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/privacy/LinkTracking.java#L124).

Nested destination URLs, tracking inside fragments, HTML/URI ClipData, Intent data and app-specific direct-share fields aren't established as covered. Each needs its own fixture and destination-preservation checks. A canonical pin-link option should use an already known typed pin ID where possible, avoiding an extra resolver request.

### Authentication, push and Hush's own requests

The privacy patches leave Firebase Messaging, Installations, WorkManager and auth declarations intact. The local Push readiness report checks notification permission, enablement, optional delegation, messaging components and the analytics metadata. It does not verify server registration or live delivery. Firebase's sign-up on a re-signed build is a separate matter. Pinterest's Firebase key refuses a request that names the re-signed build's certificate, so the Installations sign-up got a 403 and no push token came. Fix push notifications (on by default) answers Pinterest's certificate fingerprint in that one request, and the patch reference records a fresh emulator install where the sign-up then registered. That repairs the registration step only. A real push arriving on a phone hasn't been seen yet. See [manifest preservation contract](../patches/src/test/kotlin/app/morphe/patches/pinterest/privacy/AnalyticsManifestTest.kt#L26) and [PushReadiness.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/settings/PushReadiness.java#L27).

Spoof signature for Google sign-in is a compatibility patch. It adds metadata interpreted by microG-RE or signature-spoofing modules, and microG-RE only reads it when the app talks to microG-RE, which takes GmsCore support. Stock Google Play services ignores that metadata; it doesn't give an ordinarily re-signed APK Pinterest's approved OAuth signing identity. Keep email sign-in and OAuth return routes in acceptance checks for changes to attribution or navigation. See [GoogleSignInSpoofPatch.kt](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/GoogleSignInSpoofPatch.kt#L125).

GmsCore support sends every Play services call Pinterest makes to microG-RE instead of Google Play services: sign-in, Credential Manager, Firebase messaging and its token requests, Phenotype, Clearcut and the rest of Morphe's list. What leaves the phone is then up to microG-RE, which talks to Google for the account and for push. It's opt-in and only for phones with microG-RE, because on a phone without it those calls have nowhere to go. See [GmsCoreSupportPatch.kt](../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/GmsCoreSupportPatch.kt).

Traffic analysis must account for Hush's own optional requests. Automatic release checks start off, use GitHub's latest-release endpoint at most once daily after enabling, and send a HushPinterest/version User-Agent with a constrained cookie and redirect policy. Manual Check now is user-triggered. Download features can make user-requested media and original-availability requests to Pinterest media hosts. Copy image and Share image each fetch one whole picture from the media host per tap, at most 64 MiB within one 30 second budget that the original lookup shares, and keep it in the app's cache for the app it goes to. Copy image keeps the newest picture only, and Share image the newest three ([CopyImage.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/actions/CopyImage.java), [ShareImage.java](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/actions/ShareImage.java)). These aren't automatic telemetry, but they must be classified correctly in a capture. See [release-check policy](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/settings/ReleaseCheck.java#L60), [headers](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/settings/ReleaseCheck.java#L398) and [original lookups](../extensions/pinterest/src/main/java/app/hushpinterest/extension/pinterest/actions/PinTransfer.java#L31).

### Build inventory and the 14.38.0 to 14.39.0 diff

`scripts/app-inventory.ps1` writes a sorted inventory of one Pinterest APK, one `key = value` line per entry, so two builds can be compared line by line. `scripts/AppInventory.java` does the reading with the dexlib2 copy inside the Morphe desktop CLI. Nothing is patched, installed or run. Code is credited to its package, and a package the shrinker renamed is written as `~`, because that name changes with every build and would make every line look moved. `-Detail` adds the real class and method names under each line. `-BaseApk` inventories a second build and writes what each section gained, lost or changed.

```
scripts/app-inventory.ps1 -Apk <new APK> -BaseApk <old APK> -Detail
```

Retrofit's annotation classes are renamed in Pinterest, so the endpoint list doesn't rely on their names. The tool finds the method where Retrofit itself reads a service method's annotations: it tests each annotation with `instance-of` and names the verb in a string right after. That ties every renamed annotation class to its verb. The startup tasks are the `TAG_*` constants of the enum whose static initializer names the most of them, which is the startup task enum. A constant is counted as read wherever code outside the enum loads its field.

Run on October 10, 2026 against the 14.39.0 APK (version code 14398020, SHA-256 `4ecc7f9a34c89fd98d0e2133c294517772857b935969847bfd92b3e25b13e78d`) and the 14.38.0 APK (version code 14388010, SHA-256 `af6b383adb445cebee1ca43f14ac409f91475c1d62e0e11ef52ef52e29fb0553`, signed by the same Pinterest certificate). The 14.38.0 APK was downloaded for the comparison only and deleted afterwards.

| Section | 14.39.0 | 14.38.0 | What a line holds |
| --- | --- | --- | --- |
| `endpoints` | 470 | 472 | A verb and relative path, and how many service methods share it. In 14.39.0 that's 217 GET, 135 POST, 73 PUT, 43 DELETE and 2 PATCH |
| `startup-tasks` | 52 | 51 | A startup task constant and how many places read it |
| `hosts` | 746 | 746 | A host named in a URL or as a whole string, and the packages whose code holds it |
| `transport` | 5 | 5 | A connection opener (`URL.openConnection`, Cronet, `HttpEngine`, OkHttp, Volley) and who calls it |
| `sdk` | 81 | 80 | A third-party package that keeps its names, and its class count |
| `identifiers` | 26 | 26 | A reader of the advertising ID, Android ID, install referrer, installer or a device identifier, and who calls it |

**Confirmed static, 14.39.0.** These are findings about code present in the APK. None of them shows that a request was sent.

- All nine `TELEMETRY_PATHS` above are among the POST endpoints. A few other POST paths have reporting-like names and aren't classified yet: `/v3/orientation/user_landing_signals/`, `callback/invite_sent/external/`, `callback/raw_idea_pin_data/` and `pins/{pinUid}/signal_request_review/`.
- The ten startup tasks Disable analytics skips are all there, each read in one place (`TAG_FIREBASE_ANALYTICS_INIT` in two). Seven constants aren't read anywhere outside the enum, so this build probably never schedules them by name: `TAG_ADD_ACCOUNT`, `TAG_BOARDS_PREFETCH`, `TAG_COMPOSE_WARMUP`, `TAG_CORE_FEATURE_LOADER_REGISTRY`, `TAG_SHUFFLES_LIB_INIT`, `TAG_UNDEFINED` and `TAG_WARM_UP_VIDEO_CONNECTION`. Tasks with reporting-like names that stay eligible include `TAG_LOG_APP_EXIT`, `TAG_LOG_REPORT_FULLY_DRAWN`, `TAG_CRASH_REPORTING`, `TAG_SCREENSHOT_DETECTION` and `TAG_TRACKING_REQUESTS`, the deferred queue the telemetry wrappers rely on.
- 553 of the 746 hosts are AWS endpoints, every one of them held by the AWS SDK and nearly all by its region table. Most of the other 193 belong to Pinterest and Google. What's left is mostly ad measurement domains, with AppsFlyer, Bugsnag and the LINE SDK among the others.
- `URL.openConnection` has 28 call sites: three in AppsFlyer, one each in Bugsnag, the Google advertising ID client, Firebase Messaging, Glide, the AWS client and `ads_mobile_sdk`, three in Chromium's `org/chromium/net` and 16 in renamed packages. Hush's transport hook covers the AppsFlyer and Bugsnag ones. Cronet's `newUrlRequestBuilder` has six call sites (`ads_mobile_sdk`, reCAPTCHA and four renamed), and the platform `HttpEngine` has one.
- The advertising ID getter `Info.getId()` has 15 call sites, 14 of them outside Google's own client, which matches the caller count under Advertising ID behavior. The Secure `android_id` read appears in three methods, `Lb/n5;->c`, AppsFlyer and `Lxg/r2;->I`, and the last of those also reads `Build.SERIAL`. That's the LINE SDK key derivation in the table above.
- Two readers the tables above don't list yet. `Lvn0/b;->b` calls `AccountManager.getAccounts`, and reCAPTCHA's `Lcom/google/android/recaptcha/internal/aa;->a` calls `PackageManager.getInstalledPackages`. Neither has been traced further.
- Install attribution: the Play referrer client is built in `PinterestActivity.onCreate` and read in `Lxm0/b;`, and AppsFlyer has its own. AppsFlyer also names the Facebook, Facebook Lite and Instagram install referrer providers. The broadcast receivers of AppsFlyer and Google measurement both check for the Play `INSTALL_REFERRER` action. Installer lookups (`getInstallerPackageName` and `getInstallSourceInfo`) come from the ad SDK, AppsFlyer, Bugsnag, reCAPTCHA, Chromium and three renamed classes.
- No direct call turned up to TelephonyManager's device ID, IMEI or phone number getters, the Wi-Fi or Bluetooth MAC getters, MediaDrm's property reader, the app set ID or the Firebase installation ID. The tool matches those exact framework methods, so a call through a renamed wrapper of a library class wouldn't be caught.

**What moved from 14.38.0 to 14.39.0.** The whole diff is 26 lines.

- Endpoints: `GET` and `POST feeds/home/early_flush_test/` are gone, and `POST v3/callback/event/` now has one service method instead of two. Disable analytics still finds its wrapper target for that path in 14.39.0.
- Startup tasks: `TAG_SECURE_PREFS_ENCRYPTION_CANARY` is new and read in one place.
- Hosts: none added or removed. Thirteen hosts changed which packages hold them, or in how many places. That's code moving between packages, mostly renamed ones.
- Transport and identifiers: no change.
- SDKs: `com/google/zxing` (six classes) keeps its names now, and eight packages changed their class counts by one to six.

### Concrete privacy opportunities

Canonical pin links have shipped as Strip link tracking's Plain pin links switch, so that row is gone.

| Priority | Candidate | Required proof and acceptance |
| --- | --- | --- |
| High | Run `scripts/app-inventory.ps1 -BaseApk` on every APK update and classify what it adds | The tool records the endpoints, startup tasks, hosts, transports and identifier readers. Classifying a new path or reader is still a person's job. A successful patch must not imply that new telemetry was inventoried |
| High | Compare stock and patched network behavior using controlled actions | Same app build and comparable account/consent state; welcome, feed, search, closeup, share, background and restart. Preserve TLS and account data. Store sanitized counts and destinations rather than secrets or raw account payloads |
| Medium | Extend regional-host and known attribution-key cleaning | Exact trusted domains; `mweb_unauth_id` and `amp_client_id` only after destination checks. Cover deceptive suffixes, encoding, uppercase keys and unrelated sites with legitimate `sender` values |
| Medium | Reduce install attribution without removing first-open navigation | Trace referrer fields individually. Check Play installs and sideloads, organic attribution, campaign links, `af_dp`, `utm_content`, sign-in and error handling |
| Medium | Audit collection before settings readiness | Inspect provider initialization and other early entry points. Preserve safe mode, secondary processes and cold-start behavior. Prefer targeted controls over premature settings reads |
| Medium | Separate Engage recommendations from general analytics | Explain the affected recommendation feature. Verify devices with and without Engage, service recovery and absence of retry loops |
| Medium | Audit native and web measurement paths | Establish the path before changing it. Compare video, media, auth and ad-session behavior with the candidate enabled and disabled |
| Medium | Separate crash diagnostics from usage and advertising telemetry | Keep current defaults. Define what may remain local and what can upload, rather than grouping all reporting together |
| Low | Improve permanent-versus-runtime privacy diagnostics | Show installed manifest facts and bounded hook counters without identifiers or misleading claims of anonymity |

The source and existing tests establish exact hook boundaries and intended behavior. They don't establish that every tracking path is stopped. A complete runtime comparison must distinguish cold from warm starts, test Off and Pause, check delayed or cached uploads and record server experiments. Local counters and intact messaging components are useful evidence, but neither proves network suppression or live notification delivery.

### Decoded Android network policy

The original `res/xml/network_security_config.xml`, unchanged in 14.39.0, sets `base-config cleartextTrafficPermitted="true"`. A more specific domain configuration sets cleartext to false for `pinterest.com`, `pinimg.com`, `branch.io`, `facebook.com`, `appsflyer.com`, `bugsnag.com` and `cedexis.com`, including their subdomains. The broad base rule therefore isn't a claim that these listed services use plain HTTP.

The only explicit user-certificate trust anchor is inside `debug-overrides`. This original release isn't debuggable, so that node doesn't establish that a user-installed certificate will enable TLS interception. No trust configuration, certificate or pinning code was changed during the survey. The separate `res/xml/ga_ad_services_config.xml` declares attribution with `allowAllToAccess="true"`; that is an access policy, not evidence that an attribution event occurred.

A narrower base cleartext policy is a possible hardening change. First inventory real HTTP use, especially external web destinations, redirects and SDK fallbacks. Changing the default without those checks could break intentional navigation. Retain the domain and trust-policy diff as part of each original-APK update review.

### Initial network capture and the working follow-up

The later [runtime measurement](pinterest-14.39.0-runtime.md), on 14.38.0, used a guest capture on the active Wi-Fi interface and obtained useful application traffic. It confirmed primary-UID-correlated TLS connections naming Pinterest services and AppsFlyer, with independent per-UID traffic and CPU counters. The earlier failed capture below is retained to explain why its apparent silence was misleading.

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
