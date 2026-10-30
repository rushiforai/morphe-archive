# Nieuwsblad: verified Mediahuis One patch targets

Reviewed 30 October 2026. **Seen** means inspected in original packaged resources or smali; **Inferred** describes expected consequences; **Unknown** identifies missing runtime evidence.

The original `com.twipemobile.nbmobile` APK is version 22.0.0 / 2012316104, minimum SDK32. Base SHA-256 `a6376116b33239c317c0c386f8d874f2528380519ea52320c55e235da7588378`; publisher signer `470c723d29e5b9a8ac74f9ea45c4461dbc7f68831aa96d63c0f1218140865d44`. Nieuwsblad and DS Nieuws share Mediahuis One, Kaching and a byte-identical plain-JS Twipe reader bundle. They are news applications with an embedded newspaper reader. DS ships an additional alternative-billing implementation; this remains unchanged.

## Verified boundaries

Fresh decodes verify 48 selected method bodies identical across both apps. The independent implementation verifier expands this to 89 exact ad/tracking/consent/UI boundaries and 1139 original/retained method hashes. Targets use descriptors across all dex files; dex-directory numbers differ between brands.

Kaching's three request methods return `KachingResult`; the existing `AdsAndTrackingDisabled` singleton returns null from `getOrNull`. AdManager, article video and podcast callers already consume that nullable result. Actual blank-slot collapse and playback remain runtime questions.

Sharedsdk TrackingService.createPartners returns a List. Returning the standard empty List suppresses partner creation while ViewTracker still generates its view ID. Attention, Cxense and promotion have separate void sinks. First-party GA, CIM, NMO, Datadog, Firebase, Mux and video CIM have additional independent boundaries. Push identity and real account/session state remain functional.

The actual RN Kinesis code sends PutRecordsCommand to the logging-events stream; the general transport factory also supports HTTP/Loggly and later remote settings. Its original disabled transport completes promises without network calls. Engage Readers has separate init, enable, event and timer paths. Four singleton resource edits suppress these collectors while preserving the rest of the bundle. No shipped credential values are retained in this report.

Onboarding calls the original SettingsDataSource.setOnboardingCompleted(true) before the existing getter/branch, after the main graph is set. Empty onboarding steps are unsafe: the original coroutine unconditionally indexes the first step. PayOrOk navigation is suppressed at the pure navigation use case, preserving real reject-vendor/purpose handling for actual paid users.

CueCustomPaywall's build method calls the disabled-aware popover helper and returns null when disabled. This corrects the earlier report's claim that its card is unaffected. The UI switches do not change the server's displayFullArticle decision, account accesses or edition token.

## Validation and limits

The untouched original passes all retained contracts with no controls; each selected control was RED before implementation. All four individual controls and the combined selection now pass real Desktop FULL patching, signing, apksigner verification and independent emitted-output verification. The final tracking/consent/premium/combined results are in `build/research-20261030/nieuwsblad-final-validation.log`; the earlier unchanged Hide ads selection also passed. The actual emitted RN module passes controlled native-boundary tests for initialization, events, timers and promise completion. All 1139 method contracts and 44 independent switch key/true-target mappings pass; 11 Mediahuis regressions and the repository suite (218 tests, three optional skips) pass. This proves the inspected static output and controlled JS behavior. Device acceptance, server access behavior and runtime traffic remain unverified. See the [audit](../../nieuwsblad-audit.md) for current status and exact invariants.

The separate Agnoplay data-plugin analytics listener uploads configured events and media metadata independently of Gemius/Mux. Its optional installer is now stopped; all other playback methods and the original installer tail remain pinned. Original and prior emitted tracking artifacts first failed this added check.

Published candidate: [v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4). The downloaded CI bundle has SHA-256 `3b8552f366231151645f219b4599eb31d060b3ed973d5bac49e433c5dc15c27a`; all 45 new-app/shared class payloads and the release catalogue match the validated source. Reapplying all controls with the downloaded published bundle also passed the patch report, output-signature and independent decoded-output checks for this app (`published-nieuwsblad-validation.log`). Runtime and live-network acceptance remain unverified.
