# Humo 7.53.1 implementation research

Inspected `be.humo.tvgids` on 2026-10-30. Original base SHA-256: `9058e1f3aa1b197ed73ba63fbbf928dc97ee11c5e04488fe8318cfe7bc210e00`. Scope: static shipped-artifact inspection and patch-output verification; no device execution or publisher backend request.

## Identity and reused contracts

The source report in the local APK research handover was rechecked against a fresh eight-DEX APKTool decode. All 112 descriptor targets resolve exactly once. All 19 published retained-method hashes and all 70 structural contracts pass for this app. The separate per-app implementation prevents these additions from changing any published sibling patch. Humo keeps its own exact package/version/code/minSdk/signers.

## Belgian-specific decisions

| Boundary | Observed contract | Implementation |
| --- | --- | --- |
| `VideoSdkModule.provideSdkTracking(DpgBrand,AnalyticsDispatcher)` | Belgian branches instantiate `VideoSdkTrackingImpl`; Dutch branches instantiate `VideoSdkTrackingNoOpt`. Both take the same real dispatcher. | Return a newly constructed NoOpt using the original dispatcher. Base `init(Context)` is already callback-free; no Gemius dispatcher is created. |
| Video `core/ad/AdSettingsProvider.init()V` | Launches a coroutine; constructor initializes `StateFlow` with `AdSettings.Companion.getDefault()`. | Return void before the remote ad-settings fetch. Preserve constructor/default and readers. |
| Game `gameview/ad/settings/AdSettingsProvider.init()V` | Separate coroutine/API/cache; constructor initializes non-null default settings. | Stop this independent advertising-prefetch entry point too. |
| `FeatureFlags.getPrebidEnabled()Z` | Single consumer in `XandrInitialisationConfigBuilder`; De Morgen config enables Prebid, Humo does not. | Return false together with the other provider flags and stopped SDK initialization. |
| BrandMetrics | Every bundled brand config includes `phx.bmtrcs.com`. | Block exact/subdomain `bmtrcs.com` in the two owned WebView clients. |
| Game IMA | Initialized StateFlow/listeners precede final request; real error consumers can reject rewards. | Replace only the request with `reportAdError("Advertising disabled")`; retain original continuation consumers. |

`VideoSdkModule` and NoOpt reside in `smali_classes7` in the fresh decode. Exact descriptor lookup avoids relying on this DEX directory number. `provideSdkTracking` has zero locals, so its dead `p0` receiver can hold the new result while `p2` retains the dispatcher. Both app bodies match for these new boundaries.

## Independent preservation

`tests/belgian_edition_originals.py` records independent original method pins for each brand. `tests/belgian_edition_onboarding.py` executes the real completion flow with its own brand table. Humo differs from the Parool cohort in two retained onboarding UI bodies, so using the Parool brand map would be incorrect. All 270 retained methods, the complete startup graph, 13 additional original bodies and five game consumers are checked for each app.

## Evidence and limits

Local evidence lives under `build/research-20261030/edition-evidence/`. The De Morgen REA identity observation is `ev_caa7e9acfa5088f27547fbb1ea1c6cf1a1f45ac8f849ba1fb55cb228de5b7050`: package/version/code/minSdk/targetSdk confirmed, signatures not verified by REA. Independent `apksigner verify --print-certs` supplies publisher certificates including Humo's two SDK-specific signers; Google source stamps are excluded.

The original checks pass, and selected effects were RED before Kotlin implementation. Build and complete per-selection output validation passed and are recorded in the [audit](../../humo-audit.md). Static findings do not prove traffic absence, complete anonymous premium delivery, PDF entitlement or re-signed device acceptance.

## Catsure follow-up: optional local upload boundary

A full-tree instruction reference inventory covers all original smali classes. `CatsureQueueSyncRepository.syncQueue(CurrentQueue)V` has one caller (`AudioQueueHolder.commit`, lines 1139–1268 in the fresh smali); the local StateFlow update precedes it (1224), and local manual-item persistence follows it (1263). `CatsureHeartbeatRepository.sendHeartbeat(state,String)V` has three tracker callers through onHeartbeat/onPause/onStop. Both repositories only build payloads and launch detached coroutines; both coroutine responses are discarded. Response field/getter reads outside the model/serializer classes are absent. One synthetic external reference asks only for a queue response serializer.

App audio authorization is independent: `AudioSdkAuthProvider.checkPlaybackAuthorisation/requestPlaybackAuthorisation` calls the marketing resolver. The Catsure HTTP client consumes an existing DPG JWT and brand header; it does not create the playback authorization. Both new repository bodies are identical between De Morgen and Humo. Static evidence supports stopping the two void upload methods without removing local queue publication/persistence or inventing a response. Remote cross-device queue/playback updates are deliberately lost; actual backend consequences and device playback remain Unknown.

Global `AmaliaDeviceIdProvider` is preserved because the separate radio `enrichStreamUri(Uri)` caller still uses it. The verifier pins all 386 local queue/persistence/device/radio/auth methods for each app and executes native queue commits with current/no-current/unchanged cases, entering actual emitted no-op sinks when tracking is selected. Fresh per-sink RED records and the complete reference/pin inventory are under ignored `edition-evidence/catsure-each-sink-red.json`, `catsure-red-results.json` and `catsure-trace.json`. Real changed-selection output validation is recorded in the audit after rebuilding.

Published candidate: [v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4). The downloaded CI bundle has SHA-256 `3b8552f366231151645f219b4599eb31d060b3ed973d5bac49e433c5dc15c27a`; all 45 new-app/shared class payloads and the release catalogue match the validated source. Reapplying all controls with the downloaded published bundle also passed the patch report, output-signature and independent decoded-output checks for this app (`published-humo-validation.log`). Runtime and live-network acceptance remain unverified.
