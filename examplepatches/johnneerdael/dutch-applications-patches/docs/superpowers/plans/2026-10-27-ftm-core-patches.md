# FTM Core Patches Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Deliver a reviewed FTM development increment blocking identified collectors, automatic cookie notices and subscription prompts while preserving delivered article bodies and native app bridges.

**Architecture:** App-specific Morphe bytecode/resource controls on the existing WebViewClient and Firebase messaging analytics sinks. Keep the live website, account/audio/locale/notification bridges and original callbacks. Intercept known transport boundaries; do not bundle or replace proprietary remote JavaScript.

**Tech Stack:** Kotlin, Morphe patcher2.0.1, smali, Python/Node emitted-code checks, Desktop FULL validation.

**Spec:** `docs/superpowers/specs/2026-10-27-expanded-dutch-apps-design.md`

## Global Constraints

- Original `nl.ftm.ftmpulse`, 2.6.8 / 58, minSDK32, APKS, publisher SHA256 `2c43fc30715b100523c79a628892c257bb4f347910e34cdc686b7fec97fbd90b`.
- No device, ADB or emulator. Dev publication authorized; stable promotion and phone acceptance deferred.
- All mutating dependencies directly depend on FTM's shared original-input guard. Eager exact fingerprints use shared.uniqueMatch, not default first-match lookup.
- One heavy JVM at a time, max1GiB; controller owns lease, shared target/catalog/README/preflight integration and publication.
- No proprietary APK/JS/HTML, article text, personal fields or credentials in Git. Raw samples stay under `$TMPDIR/re/expanded-ftm`.
- This is an intermediate increment. Full genuinely restricted-publication proof, unknown ad containers and remaining collector/server classifications stay open; no claim that the expanded-app scope or all FTM requirements are complete. The governing spec records the current scope; FD and De Telegraaf were excluded on 2026-10-28.

## Review Focus

- Keep complete MainActivity initialization, nativeApp readiness metadata, pending locale links, pull-to-refresh/spinner, back navigation, external URL dispatch, share/audio and FCM token delivery.
- Block optional requests before page JavaScript executes; pageFinished-only CSS/cleanup is not transport suppression.
- Empty article decision responses must follow the website's actual success callback path, never fake account/subscription JSON or manufacture missing article text.
- Keep first-party reading-history, genuine account/device-security, membership/payment and notification-preference routes; naming or a discarded result alone does not establish telemetry-only.
- UI cleanup is scoped to exact production hosts and evidenced automatic elements. Preserve manual privacy/login, editorial banner-pp blocks, charts and media.

## Task 1: Native/Web controls and independent verifier

**Files:** Create `patches/src/main/kotlin/patches/ftm/{Compatibility,WebContentPatch,TrackingPatch,ConsentScreensPatch,PremiumPatch,FullArticlesPatch}.kt`, `tests/verify_ftm.py`, `docs/FTM_TRACKING_AUDIT.md`.

**Interfaces:** Named controls `Disable tracking`, `Skip consent screens`, `Hide Premium banner`, `Read full articles`; app-specific `verify(root: Path, selected: set[str]) -> None` and CLI decoded-root/repeated `-e`. Do not introduce a no-op Hide ads: actual commercial loader/container evidence is still open. Discovery input is ignored `expanded-dutch-apps/ftm-findings.md`, original smali/resources `$TMPDIR/re/expanded-ftm/decoded`, private live footer/routing under sibling web/.

- [ ] Write original-verifier baseline and selected-control RED checks before production. Pin retained original method digests independently from the original decode, including MainActivity.onCreate, WebViewClient navigation/history/start callbacks and the full pageFinished body after removing only the injected call. Include audio/locale/share/push entry contracts.
- [ ] Compatibility uses the exact input above. Put public static helpers in the existing `Lnl/ftm/ftmpulse/MainActivity$MyWebViewClient;` (super WebViewClient). A shared guarded web installer adds both shouldInterceptRequest overloads and one entry call from onPageFinished; preserve all original callback instructions and original client assignment.
- [ ] Use explicit false-by-default helper flags for tracking, article-decision bypass, consent CSS and premium CSS. Named controls enable their flag through an exact singleton method-list lookup; avoid SDK cached indexes for newly added helpers. Read full articles and Hide Premium banner share a guarded article-decision dependency; Skip consent screens directly depends on Disable tracking. All flags/dispatchers remain composable under individual/all selections.
- [ ] Parse HTTP/HTTPS request URLs with Android Uri, lowercase host via Locale.ROOT, fail open on null/invalid/no-host/other-scheme inputs. Use getEncodedPath for exact ASCII route matching so encoded separators do not become unrelated matching paths. Exact/subdomain-match only known collector hosts: `insight.ftm.nl`, `eventor.ftm.nl`, `glitchtip.ftm.nl`, `diffuser-cdn.app-us1.com`. On exact `www.ftm.nl`/`www.ftm.eu`, additionally block `/activecampaign/event/create/view_comments/{numericId}` (a pure observed comments-visibility collector). Return an empty successful JavaScript/text response, with an empty nonnull stream, only when tracking is enabled. Preserve suffix-spoof hosts and query-string lookalikes.
- [ ] When article bypass is enabled, exact production site hosts and path `/abonnement/paywall/{numericId}` return empty successful `text/html` UTF-8 response. This is the actual supported Gk success case: no modal, no Hk body deletion, normal loaded/allowed callbacks. Other subscription, login, favorite, comments, gifting/share and body/media paths delegate untouched to the actual superclass. Test exact path boundaries/encoded separators/query lookalikes and both overloads.
- [ ] Tracking patches only these exact static MessagingAnalytics methods: `deliveryMetricsExportToBigQueryEnabled()Z` and `shouldUploadScionMetrics(Bundle)Z` return false; `logToScion(String,Bundle)V`, `logToFirelog(MessagingClientEvent$Event,Intent,TransportFactory)V`, `setUserPropertyIfRequired(Bundle)V` return void. Existing code proves they only export notification analytics/conversion properties. Preserve FirebaseMessaging/Installations, display/channel/token forwarding and setters. Add nonduplicated manifest metadata delivery_metrics_exported_to_big_query_enabled=false and firebase_analytics_collection_deactivated=true.
- [ ] Tracking pageFinished cleanup on exact site hosts removes only five known optional Eventor localStorage keys: eventor_initialized, eventor_sessionId, eventor_userId, eventor_prev_at, eventor_prev_loggedIn. Handle denied storage without breaking the page. Do not alter window.FTM.user/account/app_data/native preferences. Temporary ID creation before pageFinished is an explicit remaining limitation; request blocking is already active before script execution. No whole Storage API replacement or polling timers.
- [ ] Consent cleanup adds an idempotent scoped style hiding `.cookie-consent` only; leaves `.cookie-unconsent` manual control and existing local/server consent values untouched. Premium cleanup hides `.share-stickybar-outer` (observed automatic trial/exmember bar), not editorial banner-pp or all membership links. Persisted style selectors automatically cover later DOM insertions. Do not skip document JS or replace browser clients.
- [ ] Verifier executes actual emitted request-policy methods with varied URLs/flag combinations, validates actual Android SDK/APK class-interface-static call kinds and superclass delegation, empty MIME/stream contracts, metric false/void prefixes and manifest states. Evaluate extracted emitted JS with Node against a small DOM/storage harness: exact hosts, future inserts/style rules, repeated calls, unavailable storage, preserved unrelated state/manual privacy/editorial/media nodes. Assert original retained digests and non-target method preservation.
- [ ] Add a private opt-in live probe for received body counts and substantive final paragraph ancestry (raw text remains scratch). Run the actual captured Gk/Sc/Hk callback logic privately with empty/HTML/JSON/error responses to establish loaded/allowed completion and preservation of every supplied editorial child; test bodies long enough to expose the original third-child deletion. Do not count the currently open app-UA samples as proven paid-only bypass.
- [ ] Original noflagsPASS, four selections RED, build, each-single/all Desktop FULL apply/sign/redecode and live JS contracts before commit. Record exact commands/output in task report. Audit open ad coverage, temporary local IDs, pageview/device-log server classifications, genuinely restricted publication and all deferred phone checks. Commit only app-owned files; no shared edits/push.

## Task 2: Integration/review/prerelease (controller)

**Files:** `scripts/validate_targets.py`, `tests/test_validate_targets.py`, `tests/OriginalInputRegression.java`, README, generated catalog and app metadata.

- [ ] Add four-control FTM profile with Skip consent screens -> Disable tracking; verifier derives shared article bypass for either Read full articles or Hide Premium banner. Extend actual SDK preflight for FTM original/negative metadata and actual eager helper wiring. Preserve released inputs/dependencies.
- [ ] Review app and shared integration independently, including the five Review Focus classes and source-sensitive web/native call contracts. Resolve Important findings, regenerate current-version catalog after clearing stale generated MPPs, commit and push to dev.
- [ ] Inspect real Actions/prerelease plus downloaded artifact digest, catalog and actual published-bundle all-control validation. README explicitly labels incomplete coverage and deferred phone tests; retain all full-goal requirements as open until proven.
