# RainViewer local Pro and remote-data research

Research date: 2026-11-02. Target: RainViewer 8.4.1/44084, `com.lucky_apps.RainViewer`. Runtime: rooted Android 16/API36 arm64 AVD `rainviewer_privacy_validation`, serial `emulator-5554`. Results apply to the observed anonymous session, station and time window.

## Confirmed result

The installed development build shows **Your plan: Pro** and exposes client controls while the publisher still reports **`purchased=false`, `type=0`, `products=[]`, `is_trial=false`**. The stored purchase type remains0. The final update preserved the working Free session credential; its hash was compared before/after without publishing the credential.

The publisher accepted ordinary map requests and returned radar, satellite, satellite precipitation and six precipitation/temperature model collections. The app also rendered KMUX reflectivity and **VRAD velocity** after fresh product downloads. The product catalogue marked110 of112 products `isLocked=true`. Therefore, for these tested product paths, a locked catalogue item plus an unpaid purchase state did not prevent the server from supplying usable product data after the client capability gate was opened. This does not establish the policy of every endpoint or account.

## Exact implementation boundaries

Original source references below are relative to the retained primary-checkout analysis `.analysis/rainviewer-8.4.1/readable/`.

| Boundary | Exact original location | Final behavior |
| --- | --- | --- |
| Tier enum | `defpackage/hw7.java`, enum V2, wire name `pro`; original smali `hw7.<clinit>` assigns `Lhw7;->e` | Use the shipped Pro enum rather than changing enum IDs or server purchase objects. |
| Capability factory | `defpackage/eh5.java:343`, `j(ft0,hw7,boolean)` / `Leh5;->j(Lft0;Lhw7;Z)Ljava/lang/Object;` | Insert `sget-object p2, Lhw7;->e:Lhw7;`. Original flow updates, readiness input and coroutine state machine remain intact. This does not force every flag true: original eligibility/readiness logic still runs. |
| Settings plan | `defpackage/zo6.java:129`, `g(boolean,et0)` | Original plan model selects Pro from the substituted local flags. No Settings-string replacement. |
| Settings Manage action | `defpackage/ph5.java:17`, constructor parameter3 / `isManageVisible`; `defpackage/ha9.java:914`, `h(...)` renderer | Skip subscription screens sets the model boolean false. The original renderer removes Manage text, chevron and clickable navigation to Subscription details; plan badge/features remain. |
| Real purchase state | `tw7`, `er2`, `PremiumWorker`, `PurchaseObject`; `/mobile/purchases/android/actual` | Original code and server response remain intact. Cached response confirms unpaid state. |
| Map request | `com/lucky_apps/data/radarsmap/entity/request/MapsRequest.java:28`, constructor `(IIIIIZ)V`; `defpackage/x31.java:555`, `l(MapsRequest,ft0)` | Before field/cache identity initialization: history<=21600s, nowcast<=7200s, step>=300s, NWP horizon<=86400s, accumulation=false. Smaller/zero inputs and `nwpLayers` remain intact. |
| Forecast extensions | `com/lucky_apps/common/data/forecasts/entity/ForecastRequest.java:27`, constructor `(IDDZZZ)V`; `defpackage/xe2.java:37`, `a(ForecastRequest)` | Three request booleans become false, omitting expanded chart days, expanded nowcast and AQI extension. Coordinates and request tag remain unchanged. |
| Frame cadence | `defpackage/m04.java:569`, `k()I` | Return300s so local frame expectations match the constrained request step. The exposed two-minute setting does not obtain two-minute data. |
| AI endpoint | `defpackage/sh2.java:244`, `f(boolean)` -> `ag2` -> `id2` -> `pe2.c` -> `mg0.b` -> `defpackage/xe2.java:102`, `c(ForecastAiSummaryRequest,ft0)` | Separate Hide AI insights patch prevents dispatch and supplies the shipped `pi6` Gone state to `if2` forecast UI models. A temporary test restored only the original dispatch and received code210, Not allowed, with no summary. |
| Weather warnings overlay | `defpackage/pd3.java:122`, `e(MapLayer)`; `defpackage/db.java:110`, `c()` | Optional hidden overlay-button model and false dispatch condition. Applies even with a previously enabled overlay preference. Ordinary forecast warnings use a separate path. |
| Audience telemetry | `defpackage/cx7.java:56`, variant0 -> `nr2.a` | Local Pro depends on Disable tracking, preventing the substituted tier from being reported as paid analytics. |
| Error enforcement | `defpackage/sl.java:84`, `e(String,String)` | Unmodified. Publisher code81 still becomes an authentic blocked error. |

The Kotlin implementation is `patches/src/main/kotlin/patches/rainviewer/LocalProPatch.kt`, with `AiInsightsPatch.kt` and `WeatherWarningsPatch.kt` for the requested UI controls. All nine patches are now enabled by default, including Local Pro and hiding the warnings overlay. Each remains selectable; Local Pro includes Hide AI insights. `Fix integrity` and `Fix Google services` implement the independent compatibility work described in [integrity investigation](integrity-investigation.md).

The map ceilings deliberately preserve the accepted Free request shape. They are conservative delivery choices, not proof that the server would reject larger individual values. The earlier broad Pro experiment changed multiple fields simultaneously and later received code81; causation between each field and the rejection was not isolated.

## Observed payloads

The final compiled build emitted requests such as:

```text
/mobile/maps?interval=7200&no_step_limit=1&nowcast_interval=7200&step=300&nwp_layers=1&nwp_interval=86400
```

The publisher returned code0. Further history requests with `interval=21600`, `nowcast_interval=0` also returned code0. Headers, signatures, credentials and opaque tokens are excluded from the report.

| Data | Measured result | Interpretation |
| --- | --- | --- |
| Global radar | 25 past frames over2h and24 future frames; future timestamps span1h55m | Free requests already provide approximately2h of nowcast input; the stock Free UI advertises30m. |
| Satellite | 12 past frames in the2h request | Usable layer collection is present; geographic cloud conditions determine visible pixels. |
| Satellite precipitation | 12 past and12 future frames in the2h request | Remote collection is present. |
| Numerical precipitation | ECMWF, GFS, ICON, ICON-EU, HRRR, WRF-ROMS TH | Each had24 hourly future frames spanning23h between first/last timestamps. This sample does not prove72h of future map data. |
| Numerical temperature | Same six model names | Same24 future-frame count; some models also include approximately24h of historical frames. Past+future must not be mistaken for a72h forecast. |
| Accumulation | `radarAccumulation` key present, past/future lists empty | A key alone is not usable rainfall-total data. The final build deliberately omitted the accumulation request flag. |
| Ordinary forecast | Nowcast7 points over1h; hourly24 points over23h; daily8 points over169h | Free payload contains more hourly points than the12h Free UI label, but this response does not prove72h hourly coverage. |
| KMUX product catalogue |112 products across DBZH, VRAD, WRAD, ZDR, PHIDP, RHOHV, CFPR;110 marked locked | Server catalogue metadata carries a lock bit. |
| KMUX timestamps |923 timestamps spanning approximately59.94h | Timestamp availability exceeds the stock Free30m Pro-radar playback label. Older binary frames were not exhaustively downloaded. |
| KMUX reflectivity | DBZH0.0°, fresh multi-megabyte files; map values and altitude tooltip rendered | Usable actual product data, not only an unlocked menu. |
| KMUX velocity | VRAD0.0°, fresh files approximately5.4MB each; red/green velocity imagery rendered | Confirmed usable data for this product while the purchase response remains Free. Other product/tilt combinations are not all verified. |
| AI summary | `/mobile/forecast/assistant` returned code210, message Not allowed, empty data at00:55:58UTC | A genuine server rejection with the same unpaid session. The UI described it as a connection error. No summary was delivered. |
| Warning polygons | `/mobile/alerts/` returned code81 twice; Weather Warnings thumbnail showed a red error badge | The overlay was unavailable in the test. A later renewed-session walkthrough still showed the error; its isolated network trace did not capture a completed response. This does not isolate licence vs integrity enforcement. |

After the rejected AI request, subsequent warning and eventually map requests returned code81. Those later failures are recorded separately from the earlier34 successful responses. The test cannot establish whether the AI request caused a session block or exposed a delayed enforcement decision. The temporary AI-enabled APK is excluded from the delivered build. The requested final build hides both unsupported controls and stops their dispatch paths.

## Per-feature finding after the local Pro change

The original [premium audit](premium-audit.md) and portable research report contain the original19 comparison rows plus watermark restriction,94 source excerpts, the gate matrix and billing/storage analysis. The table below records what the new experiment changes in those findings. “Exposed” describes the client gate, not complete runtime validation.

| Feature | Gate / code | Current finding and limit |
| --- | --- | --- |
| Radar Playback | `eh5.z`, `p04.b` | Pro timeline controls exposed; requests retain<=6h history. Do not claim48h global-radar payload. |
| Radar Nowcast | `eh5.B`, `p04.a` | Extended-forecast lock removed; ordinary accepted request returned approximately2h future radar frames. |
| Minute-by-minute chart | `eh5.D`, `hz1`, `xe2.a` | Local expanded chart gate exposed; paid nowcast query extension remains off. Current Free response has1h/7 points. |
| Radar Map Updates | `eh5.d0`, `hv5`, `m04.k` | Control exposed; request and frame cadence remain5m. |
| Exact Frames | `eh5.f0`, `vj`, `qj`, `aj` | Client animation restriction exposed; uses available frames. Exact-frame rendering was not separately acceptance-tested in this run. |
| Rain Direction | `eh5.L`, `dx7`, `a24` | Local overlay control exposed. Arrows derive from existing imagery; no paid request flag identified. |
| Rain Direction in Widgets | `eh5.L`, `r94`, `l2.d` | Local widget rendering path exposed; no widget runtime acceptance test. |
| Tropical Storms | `eh5.P`, `x31` | Control exposed; `/mobile/storms/count` returned code0. Full storm-detail coverage not exhaustively verified. |
| Tap on Map for Details | `eh5.b0`, `q34`, `n34`, `fe7.m` | Visible radar value/altitude tooltip confirmed. Uses underlying remote imagery. |
| Rainfall Totals | `ep1`, `MapLayer.RAINFALL_TOTALS` | UI exposed; accumulation input intentionally not requested; returned lists empty. No usability claim. |
| Model Forecast | `eh5.B`, `p04.a`, `MapsRequest` | Model controls exposed; six precipitation and six temperature collections present with24 future hourly frames each.72h not confirmed. |
| All Pro Radar Data | `gq3`, `m24`, `x31`, `kx6` | Product selector and tilt control exposed. DBZH and VRAD0.0° data actually rendered while server purchase state is Free. Remaining products/tilts untested. Readiness flows remain governed by the original factory. |
| Pro Radar Playback | `eh5.X`, `p04.b`, `x31`, `kx6` |923 returned timestamps span nearly60h. Only recent binary frames rendered;48h playback is not yet proven. |
| Hourly Forecast | `eh5.F`, `hz1`, `ForecastRequest` | Local range exposed; no paid `hours=72` extension sent. Current Free payload has24 hourly points. |
| Daily Forecast | Same request expansion | Local range exposed; current Free payload has8 daily points.14-day availability not proven. |
| Air Quality | `eh5.V`, `hz1`, `xe2.a` | Local AQI entry exposed; `aqi` request extension stays off. No AQI payload claim. |
| AI Weather Insights | `eh5.T`, `sh2.f`, `xe2.c`, `if2`, `pi6`, `zc2` | Original request tested and rejected with code210. Final forecast UI hides AI and retains Temperature; dispatch disabled. |
| Favorite Locations | `eh5.x`, `nf2` | Local cap becomes20; synchronization code intact. Creating/syncing more than2 not acceptance-tested. |
| Ad-free experience | Final ad DTO gates and SDK entry points | Included Disable tracking/Hide ads controls suppress the identified ads independently of purchase state. |
| Watermark-free sharing | `eh5.H`, `os6`, `ms6`, `tr6` | Local switch gate exposed. A watermark-free export was not separately rendered in this run. |

## Verification and remaining work

Gradle Android bundle build and Kotlin tests passed. Python regressions:413 tests,45 existing skips, no failures. Emitted-DEX verifiers execute request constructors for Free/oversized/zero values and all8 forecast-flag combinations, check original factory structure, preserve billing/publisher response methods, and test migration commit failures and subsequent launches. Independent static review found no blocking implementation issues.

Runtime logs retain sanitized endpoint/response summaries and timestamps. Cached raw responses and private credential backups remain private under the ignored analysis directory; only selected nonpersonal counts, timestamps and purchase booleans are exported. The observer returns original response bodies and does not manufacture successful server responses. A late-attach helper experiment failed in Frida before it could run; it is excluded from acceptance evidence.

The final UI cleanup was installed and inspected without instrumentation: AI tab/summary absent, ordinary temperature and Coastal Flood Statement retained, Weather Warnings map control absent, other overlays retained. The separate Manage cleanup preserves the plan model and disables its unavailable Subscription details action. Constructor behavior is exercised across both original Manage values and relevant default-argument masks.

This is a source-branch development result. It is not a stable release, a purchased entitlement, an offline weather implementation, or proof that every server route lacks tier enforcement. In particular, the AI endpoint did refuse this Free request. The data findings should be rechecked when app/server versions or account state change.
