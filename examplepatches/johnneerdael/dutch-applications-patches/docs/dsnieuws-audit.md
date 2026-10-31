# DS Nieuws 22.0.0 patch audit

Target: `com.twipemobile.dsmobile`, **22.0.0 / 2012316104**, minSdk32, original Play APKS. Original base APK SHA-256: `f283adebf67816d502474bf78d106f9aba910e31b167012a75be77de2fc02029`. Publisher signer SHA-256: `bba4779e6525e454cecd8c3b9000dbdedba504086fdf57483535bc5db6271c4f`. The compatibility guard enforces this exact package, version, versionCode, minimum SDK and publisher signature.

## Scope and evidence

**Seen:** fresh apktool decodes confirm the Mediahuis One platform, Kaching advertising and sharedsdk tracking. Forty-eight independently selected method bodies match byte-for-byte between Nieuwsblad and DS Nieuws. Their complete plain-JavaScript newspaper-reader bundles share SHA-256 `6a56bf9f5104fb4c56e7f8d0bb9b04c790c54e230b304f73707c5f06af926fbd`. REA package inspection confirms the Nieuwsblad identity (Evidence `ev_3b428f22d052211e5b48d7ae81e4f61ee4139a0adc6b36c8c8f83a247d4fce3d`); signer verification is separate from REA package inspection.

**Inferred:** the audited disabled/error contracts preserve native callers' expected behavior. **Unknown:** runtime ad-container collapse, media playback, reader interstitial handling, re-signed acceptance and actual network traffic. The initial static audit did not include an install, uninstall, data reset or device automation; bounded phone observations are recorded in the follow-up section below.

## Four separate controls

| Control | Audited boundary |
| --- | --- |
| Hide ads | Return Kaching's actual `AdsAndTrackingDisabled` singleton from display, video-preroll and audio-preroll requests. Callers consume `getOrNull()`. Keep ad-free account claims unchanged. |
| Disable tracking | Stop first-party GA, sharedsdk partners/attention/Cxense/promotion, Gemius CIM including video, Comscore NMO including video/startup, Datadog, Mux, Firebase analytics/crash/performance/messaging analytics, advertising-ID acquisition and Airship analytics. Disable Twipe remote logger transports and Engage Readers initialization/events in the actual RN bundle. Includes Hide ads. |
| Skip consent screens | Stop automatic Didomi/account-consent UI and PayOrOk navigation; persist onboarding completion through the original SettingsDataSource setter before the original getter/branch. Stop the DS coach mark. Includes Disable tracking and Hide ads. |
| Hide Premium banner | Return false from the publisher's paywall-UI and subscribe-button configuration switches. Preserve server article-access and account decisions. |

Every method match is a singleton with exact owner, name, parameter list and return type. Original instructions remain after the owned early-return/argument prefix. The onboarding insertion asserts the singleton original getter and its receiver register, then preserves the complete original navigation body. Missing or ambiguous contracts fail patching.

## Callback and state contracts

Kaching callers map a non-Success result to a nullable advertisement or preroll URL. The patch must return the typed disabled variant, rather than a null result object. Sharedsdk's ViewTracker generates its random view ID before dispatching to partners; empty partners preserve this string. The advertising-ID API returns a real `AdvertisingIdClient.Info` containing the zero UUID and limit-ad-tracking enabled.

The main navigation graph is installed before the onboarding-completed check. Calling the retained SettingsDataSource setter persists the real preference through PreferenceDelegate, including its normal observation path. Returning an empty onboarding-step list would crash the original coroutine, which indexes the first step; that approach is excluded.

PayOrOk suppression belongs at `DefaultNavigateToPayOrOkUseCase.execute(NavController)V`, which only navigates. The original PayOrOkService remains intact, including genuine paid-user `rejectVendorsAndPurposes` and existing-screen dismissal. No acceptance, ad-free entitlement or subscription state is forged. Didomi initialization/readiness, manual account controls, push-token registration and real authentication stay intact.

## Embedded reader tracking

The actual RN bundle contains an active Kinesis logger transport (`logging-events`, region eu-west-1), a Loggly alternative and remote logger configuration. The existing transport factory already supplies a promise-completing disabled transport. The patch selects it before any transport branch, so later remote configuration cannot re-enable network logging. Shipped credentials are never reproduced in source, tests or documentation.

Engage Readers is separate: its initialization can load a native/downloaded SDK, events are guarded by an enabled boolean, and timer shutdown has its own unconditional native tracking call. Three targeted edits stop initialization, retain the disabled event state and complete timer shutdown with a resolved promise. The original exported object, user-type/subscription setters and callback/promise shapes remain. The verifier executes the actual emitted Metro module against native boundaries; it rejects any native tracker call and exercises initialization, events, timers and subsequent enable/disable. The complete original JS hash is recovered after reversing only these four edits.

## Premium UI correction to the original research

The earlier research stated that CueCustomPaywall cards would remain. Fresh inspection shows that `CueCustomPaywallBuilder.buildPaywall` immediately returns null when `isPaywallPopOverProtected` is false; that helper checks `disabled`. The existing publisher UI switch therefore suppresses this custom card indirectly, as well as the Zephr card. The verifier retains and checks that real helper path. This does not change `getCanDisplayFullArticle`, article request bodies, tokens, account accesses or Twipe issue authorization. Read full articles is not offered for this platform: server-delivered bodies and edition rights remain genuine.

## Verification status

Original input: the no-control verifier passes **1200 retained method contracts**. All four selected-control checks fail on the untouched original before Kotlin implementation. The verifier independently checks 89 exact mutation targets, manifest collection flags and advertising permissions, typed return values, persisted onboarding state, retained navigation, actual RN behavior and original content/account/push/billing/access methods. DS additionally pins its alternative-billing implementation.

All four individual selections and the combined selection pass real Desktop FULL patching, successful applied-patch reports, APK signing, apksigner verification and independent decoded-effect checks. The final 89-target tracking/consent/premium/combined run is recorded in `build/research-20261030/dsnieuws-final-validation.log`; its no-control original passes too. The earlier Hide ads pass remains valid because neither review correction changed that control. Per-selection reports, signature logs and verifier logs are retained under `build/validation/dsnieuws/`.

The final output verifier checks all 1200 original/retained method contracts, 44 independently pinned switch key/true-case-target mappings and the actual emitted RN module behavior. Eleven focused Mediahuis regressions pass, covering payload semantics and data-padding equivalence without hiding executable changes. The full repository suite of 218 tests passes with three explicitly skipped optional tests (`build/research-20261030/corrected-all-tests.log`). Independent review found no unresolved findings after the two documented corrections.

The local full validation bundle SHA-256 is `dcb842d5951b6b21b1fecfb2ed1dd9c93a4a403ec6c96bbaa2884b710b6d8d4c`. This bundle used a Maps placeholder for unrelated local validation; it is not a published release artifact. Publication requires the repository's normal release build. At that earlier audit stage, partner/campaign behavior still needed device confirmation; the later shared footer correction and owner approval are recorded below. Server article/edition behavior and actual network traffic remain unverified. No original app was replaced or cleared during the initial audit. [Research](research/2026-10-30/dsnieuws.md) · [Privacy effects](privacy/dsnieuws/README.md) · [English guide](site/en/apps/dsnieuws.md).

## Agnoplay data-plugin review correction

The independent Agnoplay data plugin is separate from Gemius CIM and Mux. When configured, its analytics listener posts event names and media metadata to a server-provided endpoint. Tracking now stops `AgnoExoMediaPlayer.configureAgnoplayDataPlugin(PlayerItem)V`, whose sole optional effect is installing that listener (after removing any previous instance). Original disabled/empty capture-list branches already support an absent listener. The listener set, playback lifecycle, release, other listeners and original method tail stay independently pinned; only the owned return prefix changes. The untouched original and previously emitted tracking APK both fail the new installer-stop check before the source fix. Exact endpoint values are remote media configuration, not asserted as captured traffic.

## Independent switch payload verification

The Mediahuis verifier separately pins 44 original switch key/true-case-target pairs across article-model construction and sharedsdk partner creation. A dedicated parser distinguishes payload data rows from executable label definitions. This supplements the original method hashes without replacing them. Regression checks reject valid-but-wrong case targets/keys and branches into alignment padding, while accepting only proven non-executable switch-data padding and label renaming.

Published candidate: [v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4). The downloaded CI bundle has SHA-256 `3b8552f366231151645f219b4599eb31d060b3ed973d5bac49e433c5dc15c27a`; all 45 new-app/shared class payloads and the release catalogue match the validated source. Reapplying all controls with the downloaded published bundle also passed the patch report, output-signature and independent decoded-output checks for this app (`published-dsnieuws-validation.log`). At that initial verification stage, runtime and live-network acceptance remained unverified.

## Bounded phone follow-up

The phone menu showed no Abonneer entry while the genuine Log in path remained available. This is a menu-state observation, not a claim that subscriber rights, article access or edition delivery changed. Static REA tracing confirms the subscription getter now covers the menu row; Login remains on its separate AuthProvider path. A separate update dialog belongs to AuthProvider migration, with no code-push path found; that migration remains distinct from the Play update flow.

The current source adds the common promotion predicate at the shared component-items boundary, covering sponsored parent groups and the precise DS NYT card in homepage, article recirculation, section and local-group construction paths. The final original, Hide ads-only and all-controls outputs pass FULL patching, output signatures and independent decoded checks with 1237 retained method contracts and 45 switch mappings. At that earlier stage, partner and campaign removals had not been confirmed on-device. The phone was occupied by another app, so those UI checks stopped. The later footer reproduction, correction and owner acceptance are recorded below.

Server article/edition rights, live campaign layouts, remote code, playback and actual network effects remain unverified. The no-Abonneer menu state does not prove access to subscriber-only content.

The initial partial runtime follow-up was published in [v1.22.0-dev.2](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.22.0-dev.2). The full source suite passed 260 tests with four optional skips. HLN passed all five individual selections and their combination; both Mediahuis apps passed the changed Hide ads selection and all controls together after the final article/local correction. Those final APKs are installed without clearing app data. The earlier interrupted screen checks did not establish those individual responses. Subsequent owner approval after the shared footer correction is recorded below.

## Footer Shop correction and stable release approval

The owner’s 13:18 Nieuwsblad screenshots reproduced the bottom-of-page Shop feed in the installed v1.22.0-dev.2 candidate after the earlier partial corrections. This separate neutral-themed HTML widget was outside the earlier sponsored-parent and NYT rules. The later frozen footer correction is separate from that dev2 release and is included in the requested stable publication. The frozen correction identifies its exact CMS widget name, single-HTML-item shape, resize marker, publisher iframe host/path and nonempty ID before suppressing it. Unrelated HTML and editorial groups remain eligible. Nieuwsblad and DS Nieuws use the same shared predicate, with each app independently checked against its own payload and original contracts. Final Hide ads-only and combined outputs passed FULL patching, patch reports, signatures and independent emitted verification: 1242 method contracts and 45 switch mappings for DS Nieuws. The complete source suite had already passed 266 tests with four optional skips. The final APKs were installed without clearing app data. The footer correction was subsequently published in [v1.23.0-dev.2](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.23.0-dev.2), from source `5611e659fb3b9722f78cdc8a9b4ddf572e7ffcd5`.

The owner confirmed the corrected Nieuwsblad footer (“fixed”) and authorized release of both apps once the same correction was established for DS. The DS-specific payload and output checks establish that shared correction; a separate visual DS footer acceptance is not invented. This approval supersedes the earlier overall release-pending status. Genuine consent, login, article/edition server rights, untested playback states and complete network silence remain bounded by the evidence above. No further manual or device testing was requested.
