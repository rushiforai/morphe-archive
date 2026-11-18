# RainViewer 8.4.1 premium-feature audit

Target: **8.4.1 / 44084**, package `com.lucky_apps.RainViewer`. Analysis uses the supplied APKM, original DEX/resources, and the app's running plan-comparison screen. All **19 feature rows** were inventoried across the comparison screen. The privacy patches leave entitlement calculations and billing verification intact.

“Local” describes where a control or operation is implemented. It does not mean that weather data is bundled or available offline. “Mixed” means local gates/rendering with remote weather inputs. A client gate is evidence of a local restriction, not proof that a server will accept an unlocked request. No paid account, purchase or entitlement forgery was used.

## Complete plan-comparison inventory

| Feature | Free → Essential / Pro | Implementation and dependency | Evidence in original DEX |
| --- | --- | --- | --- |
| Radar Playback | 6h → 48h / 48h | Mixed. Local timeline/history clipping; frames and timestamps come from map services. | `p04.b`, `eh5.z`, remote `PremiumFeaturesPlayerIntervalData`, `MapsRequest` and map-frame loaders. |
| Radar Nowcast | 30m → 120m / 120m | Mixed. Local maximum interval, forecast selection and lock. Forecast frames require remote input. | `p04.a`, `eh5.B`, `map_forecast_period_*` resources; maximum/free forecast intervals in `y` defaults. |
| Minute-by-Minute Precipitation Chart | 1h/10m → 2h/5m | Mixed. Local chart renderer; paid request asks for an expanded server response. | `hz1` passes `eh5.D` into `ForecastRequest.expandedNowcast`; `xe2.a` adds `nowcast=120&nowcastStep=300`. |
| Radar Map Updates | 5m → 2m | Mixed. Local refresh policy/locked setting; new observations still require service data. | `hv5` reads `eh5.d0`; `ra` opens `oz1.FASTER_UPDATES`; map loaders refresh remote frames. |
| Exact Frames | Locked → enabled | **Local control.** Animation settings and frame/interpolation behavior are implemented in the APK. Existing radar frames remain the input. | `vj` reads `eh5.f0`; `qj` explicitly exposes `isExactFramesEnabled` and `isExactFramesLocked`; `aj` persists `exact_frames_enabled_key`; `ij` owns animation settings. |
| Rain Direction | Locked → enabled | Mixed. Local direction decoding/overlay drawing over downloaded imagery; not a bundled weather model. | `eh5.L`, `dx7`, `a24` parses pixels into `ArrowV2` and computes geographic positions; `po1` maps to `oz1.ARROWS`. |
| Rain Direction in Widgets | Locked → enabled | Mixed. Local widget configuration/compositing uses the same remotely sourced movement information. | `r94` combines the `eh5.L` gate with map-widget data; `MapWidgetConfigureActivity` exposes the arrows setting. |
| Tropical Storms | Locked → enabled | Mixed. Local list/map rendering and gate; storm data is remote. | `eh5.P`, `o74`, `x77`; `x31` requests `mobile/storms/count` and `mobile/storms/`. |
| Tap on Map for Details | Locked → enabled | **Local gate and decoding over remote tiles.** Pixel values, color scales, unit conversion and the info window are local. Fresh underlying weather tiles are still needed. | `q34`/`n34` read `eh5.b0` for `isTapForDetailsLocked`; `fe7.m` decodes/labels tile values, including precipitation, temperature and QPE. |
| Rainfall Totals (QPE) | Locked → enabled | Mixed. Local layer, legend and pixel-value decoder; accumulation time ranges/imagery are remote. | `oz1.RAINFALL_TOTALS`, `ep1`, `MapLayer.RAINFALL_TOTALS`, `fe7.m`, radar-accumulation exchange DTOs. |
| Model Forecast | 24h → 72h | Mixed. Local interval cap and layer controls; model forecasts are downloaded. | `p04.a` returns 86400 or 259200 seconds for model layers; `MapsExchange`/`MathModelExchange` and map loaders supply frames. |
| All Pro Radar Data | Locked → Pro only | Mixed. Local products/tilts UI and binary decoder; station-specific products are remote. | `eh5.h0`, `gq3`, `m24`, `x31` product lists/timestamps, `kx6` downloads `mobile/radars/{RADAR_IMAGE_ID}/products/{PRODUCT_ID}/{TIMESTAMP}`. |
| Pro Radar Playback | 30m → 30m / 48h | Mixed. Local history clipping and product timeline; older scans require server data. | `p04.b` reads `eh5.X` for single-radar history; Pro timestamps/binary data loaders in `x31`/`kx6`. |
| Hourly Forecast | 12h → 72h | Mixed. Local chart/list restriction and renderer; paid request asks for more data. | `eh5.F`, `hz1`, `ForecastRequest.moreDaysInCharts`; `xe2.a` adds `hours=72&days=15`. |
| Daily Forecast | 7d → 14d | Mixed. Same request expansion; local display range. The request asks for 15 days while the plan comparison advertises 14. | `xe2.a`, `ForecastRequest.moreDaysInCharts`, `ChartData`, forecast daily DTOs/renderers. |
| Air Quality (AQI) | Locked → enabled | Mixed. Local AQI views/lock; pollutants/index data is remote. | `eh5.V`, `hz1`, `ForecastRequest.aqi`; `xe2.a` appends `aqi` to requested properties; `ForecastFragment` routes locked AQI to `oz1.AQI`. |
| AI Weather Insights | Locked → enabled | **Server-backed.** The local APK displays a returned summary; it does not contain the AI model generating it. | `eh5.T`, `kg2`, `ub2`, `ForecastAiSummaryRequest`; `xe2.c` requests `mobile/forecast/assistant` and parses `ForecastAiSummary`. |
| Favorite Locations | 2 → 20 | **Local cap, with remote synchronization.** The “save more” decision is in the APK; creating/synchronizing a place also calls the backend. | `nf2.invokeSuspend` checks `!eh5.x && size >= 2`, then `size < 20`; `hz1` constructs `FavoriteRequest.AddFavoriteRequest`. Server acceptance beyond normal limits was not tested. |
| Ad-Free Experience | Ads → no ads | **Local behavior.** Ad gates and SDK entry points live in the APK. The Hide ads patch removes the advertisements independently of entitlement. | Final `BannerData`, `PositionedBannerData`, `AdData`, `InterstitialBannerData`, `InHouseBannerData` gates; Google Mobile Ads initialization. |

## Additional locally implemented premium restriction

**Sharing without a watermark:** the sharing screen contains a local watermark switch. `os6` checks `eh5.H`; `ms6` carries `isShowWatermark`; `tr6` persists the sharing state. GIF/video rendering is local, using the available map frames. This restriction exists in code but is not a separate row in the 19-row plan comparison. The privacy patches leave the watermark and premium gate intact while removing sharing ads.

## Gate model and legacy states

`eh5` computes observable feature flags from the local `hw7` premium-status enum. This build distinguishes Free, legacy V1, Pro/V2, reward, referral, no-ads and Essential states. Therefore, replacing one generic premium boolean would not accurately describe every gate. `PremiumWorker` refreshes premium state, and `PremiumFeaturesContentProvider` exposes a legacy `free`/`paid` result from `premium`/`premium_v1` preferences. Neither is changed by these patches.

The `oz1` enum also retains legacy sale points for alerts and update timing. Their presence alone does not establish a separate paid feature in the current plan comparison. Notification delivery is a remote push function; the 19-row inventory above records what this version actually presents.

## Evidence limits

The table identifies every row displayed by this version's built-in comparison and the additional watermark restriction found during sharing-code analysis. It establishes local implementation and network dependencies. The original privacy-only audit retained locks and premium state. The subsequent opt-in local Pro experiment and its server-response evidence are documented in [local Pro research](local-pro-research.md); those findings supersede the original untested-server status only for the specific paths exercised.
