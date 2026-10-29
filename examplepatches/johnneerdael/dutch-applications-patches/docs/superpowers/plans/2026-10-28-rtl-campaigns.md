# RTL campaigns Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans inline.

**Goal:** Prevent all native and Swrve campaign presentation while retaining manual notification settings and push.
**Architecture:** Default-on Hide ads uses source-backed campaign eligibility/selection and pre-render gates. Retain original methods behind owned edits and typed genuine no-message results. Preserve functional notification state and push graph.
**Tech Stack:** Kotlin/dexlib, Python original/emitted smali contracts and bounded execution, existing Morphe FULL APK matrix.
**Spec:** docs/superpowers/specs/2026-10-28-rtl-campaigns-design.md

## Global Constraints
- RTL12.7.1/1558 only, original signer/version guards and original APK hash85aacb2b5785c338a9801a57fe71f57f41d47bae1ada56ef19fee9b8520299e4.
- No fabricated consent, subscriptions, shown/handled/delivered campaign results or OS permissions.
- Preserve manual Settings, user opt-ins, FCM/Swrve functional push and all other approved app payloads.
- Before UI creation; no close-after-show workaround.
- SSD worktree, one local JVM, no phone install/reset.

## Review Focus
- Known B&B/sport/election and unknown native campaign IDs/types cannot reach shared presentation.
- Cached, session-start, event, message-center, deeplink and embedded Swrve routes return native no-message outcomes before UI/callback presentation.
- Suppression never changes notification choices, records an impression or claims successful display.
- Manual Settings and actual push/service lifecycle remain intact across fresh/returning data and real failures.
- Existing cookie/onboarding fix, native media and all other approved app payloads remain exact.

### Task 1: Campaign gates and evidence
**Files:** patches/rtl/Campaigns.kt and AdsPatch.kt; tests/rtl_campaign_contracts.py and verify_rtl_campaigns.py; verifier integration; per-app README/audit/bilingual guides/catalogue.
**Interfaces:** Existing AdsFixture/StartupFixture, true canonical graphs and owned-edit restoration; source-only SDK survey contributes original contracts.
- [x] Finish original native/shared-SDK call graph and functional retention evidence.
- [x] Write tests against original and previous release; expected RED for native campaign eligibility/presentation and remaining SDK campaign paths.
- [x] Implement guarded common gates, with genuine null/false/void semantics. Expected emitted fixtures GREEN and full original graphs retained outside owned edits.
- [x] Verify original and individual/combined FULL APK/report/sign/decode selections, Python/Node/docs checks and prior app payloads; expected PASS.
- [x] Update per-app tracking/SDK scope docs and all public descriptions to final verified behavior; commit.

### Task 2: Expert Swrve opt-out
**Files:** patches/rtl/DisableSwrvePatch.kt; native no-op helper if required; focused expert contracts/fixtures/resources; verifier/validation metadata and app docs.
**Interfaces:** Consumes Task1 campaign suppression through explicit dependency; defaultOFF must not change Task1 normal behavior. Produces full Swrve opt-out with clear push-loss warning.
- [x] Audit SDK native disabled factory/config/global publication, app consumers/callbacks, independently executable persisted workers and push/fallback components.
- [x] Write old-APK RED behavior checks proving real initialization/job dispatch/push remains without expert selection.
- [x] Use native no-op factory path and truthful terminal disabled-worker results, disable exact SDK/FCM push entry components, retain app content/auth/config. Expected emitted expert checks GREEN and normal default paths unchanged.
- [x] Verify original and every individual/combined FULL selection plus no-op callback/config/worker and resource invariants. Default expert=false and warning metadata checked.
- [x] Update privacyREADME/bilingual guides/audit; commit verified implementation.

### Delivery gate
- [x] One fresh whole-increment final review, one verified fix pass if needed.
- [x] Authorized dev publication, downloaded payload/catalogue/version/attestation proof, explicit phone acceptance pending.
