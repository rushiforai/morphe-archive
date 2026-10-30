# Marktplaats advertising and privacy implementation plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans inline. Steps use checkbox (`- [ ]`) syntax for tracking. One fresh whole-branch review follows implementation; no implementer/reviewer per task.

**Goal:** Deliver a reviewed Marktplaats dev candidate which removes display/native advertising and optional measurement while preserving genuine marketplace functions.
**Architecture:** Typed ad-slot filters, native no-content/completion paths and narrowly guarded SDK gates. The independent, default-off security option uses the app's real no-profile header fallback.
**Tech Stack:** Kotlin/Morphe/dexlib, APK-bound smali instruction fixtures, actual SDK input negatives, FULL rebuild/sign/decode checks, Python/Node/MkDocs.
**Spec:** docs/superpowers/specs/2026-10-29-marktplaats-design.md

## Global constraints

- Exact original `nl.marktplaats.android`16.17.0/code633462/minSdk32, APKS on the SSD; publisher742dc275b25928621a8fbdb4362876825c8aec6a4afdbd04d0b8d72b9ca22052. Original hashes are in the spec; reuse the existing private decode/indexes.
- Starting verified dev d5b3d11f22718d5ec74718df2673d70235fe1bbf; preserve79 previous catalogue entries/defaults and200 individual class/extension/native payloads. Three new controls produce82controls/19apps. Keep all7 original native libraries.
- Hide ads and Disable tracking default on; tracking includes ads. Disable ThreatMetrix (expert) defaults off and is independent. Every mutator directly depends on originalInput. No class-wide patch to merged helpers, global host/client removal or fake purchase/auth/consent/send success.
- Preserve real seller/ICAS inventory, search metadata/pagination, category cache, seller media, consent, accounts/auth, first-party chat/FCM/search alerts, genuine payments/shipping/business products and ordinary error propagation. No device/account/transaction/network-probe actions.
- One heavy pipeline. Research volume has little free space; use an owned additional SSD APFS staging allocation instead of detaching it. Archive the old local1.13.0 bundle before generating metadata for a new build so the loader cannot select stale classes.
- Partial local controls are implementation steps, not a finished Marktplaats deliverable. First dev publication waits for all traced advertising/optional-measurement paths, security-mode checks, documentation and fresh final review.

## Review Focus

- Null/unknown/mixed cached search rows, all-ad responses and copy/deserialization must not lose listings or alter pagination; Task1 pins list identities, metadata and every constructor path.
- Banner failure/cancellation and sponsored-flow completion must not leave loading space, duplicate callbacks or background retries; Task2 executes actual consumers and disposal paths.
- Restored SDK preferences, consent grants, user login and FCM callbacks must not re-enable optional tracking or grow a disabled sender's queue; Task3 checks admission/init/lifecycle plus genuine functional push branches.
- Generated and persisted CCT measurements must not bypass filtering, while unknown transports retain genuine HTTP/error/retry/deletion behavior; Task3 checks metrics on/off, native cleanup and result dispatch and pins unexecuted transport bodies.
- Expert security mode must use native empty headers without starting/waiting for a profile, preserve other request/auth behavior and leave real backend rejection possible; Task4 checks fresh/refresh/header paths, Task5 documents the runtime gate.

## File responsibilities

New production files under `patches/src/main/kotlin/patches/marktplaats/`:
`Compatibility.kt` (target/input/exact resolver), `AdSlots.kt` (typed collections),
`AdsResources.kt` (ad initializer), `AdsPatch.kt` (public wiring),
`AdRequests.kt` (load/target/event consumers), `TrackingResources.kt` (product
flags/providers/permissions), `TrackingPatch.kt` (public wiring),
`VendorTracking.kt` (app/attribution/marketing/study gates),
`FirebaseTracking.kt` (diagnostics/performance/export),
`PersistedMeasurement.kt` (typed CCT filter), `SecurityPatch.kt` (expert gate).
Add only focused helper files demanded by concrete duplication.

Tests: `marktplaats_contracts.py` (hashes/ABIs only), `marktplaats_vm.py` (typed
native execution and platform boundaries), `marktplaats_ads_vm.py`,
`marktplaats_tracking_vm.py`, `marktplaats_security_vm.py`, `verify_marktplaats.py`,
`MarktplaatsInputRegression.java`, `verify_marktplaats_input.py`. Reuse shared
VM/canonicalization/SDK-declaration utilities; do not refactor other apps.

### Task 1: Exact input and typed advertising policy

**Files:** Compatibility.kt, AdSlots.kt, AdsResources.kt, AdsPatch.kt; contracts/base VM/ads VM/verifier; `scripts/validate_targets.py`, its routing tests and current-app guide mappings/count tests.
**Interfaces:** produce `marktplaats` compatibility, `originalInput`, `exact(owner,signature,flags,registers,count):MutableMethod`, `hideAds`; verifier `verify(root,selected,apk)` and CLI `root --apk APK [-e NAME]`. Behaviour-only mode runs one named native group without owned-edit restoration for original RED checks. Produce `verify_slots(f,hidden)` and `verify_ad_init(f,hidden)`.

- [x] Pin original package/version/signer/base and all7 native hashes. Pin original changed/retained graphs from actual source, including FlexibleSearchResponse constructors/getters/conversion, LrpItemsRequest, item enum/getter, phone/tablet VIP sections, ad init/disposal, startup, auth/request headers, consent, push and transaction/business contracts. Run original verifier. Expected: original input/graphs/native behaviour GREEN; no SDK/network/device invocation outside explicit fixtures.
- [x] Write native tests: mixed first/middle/last/all/empty/unknown/null slot cases remove exactly SRP_HEADER_NATIVE_AD, SRP_LIST_NATIVE_AD, DISPLAY_BANNER; DEFAULT/ICAS and other native objects/order remain. Assert correlation/histograms/search metadata untouched; every constructor/default/copy path sees the policy. Request supportedTypes loses only those exact native string capabilities; userSegments/request objects remain identical. Phone/tablet VIP lists lose only DISPLAY_BANNER. Observe original behaviour-only RED for desired suppression and GREEN for retained data.
- [x] Implement guarded list helpers on actual model owners, using public item accessors. Preserve no-removal collection identity where practical; preserve original null/error handling. Apply at common constructor/storage paths, not a getter bypassed by component/direct fields. Implement only ad init c37.c/c37.d/c1c.a and MobileAds provider suppression here; preserve c37 category/WebView work. Expected: no native initializer invocation with Hide ads; unrelated activity work unchanged.
- [x] Add public compatibility/wiring and validator route. Add Marktplaats guide mapping/count19 when its first public control becomes visible; keep generated metadata accurate for the partial local state. Build, apply and verify the current control against original source. Expected selected native groups GREEN, source restoration exact, Python suite GREEN. Commit `feat(marktplaats): filter typed ad slots and stop ad initialization`.

### Task 2: Complete independent ad request and lifetime paths

**Files:** AdRequests.kt and AdsPatch.kt; extend ads VM/contracts/verifier.
**Interfaces:** consume Task1 exact/input/hideAds/model helpers. Produce `suppressAdRequests()` within BytecodePatchContext and `verify_ad_consumers(f,hidden)`; Hide ads now covers all source-established ad paths.

- [x] Trace actual search display, VIP top/full-description, home/VIP custom-native and sponsored-content consumers. The407-instruction homepage e.c dispatcher requires classification before choosing an edit. Pin all owned anchors and retained callback/UI/lifecycle graphs. Observe original RED for each independently active load/target/event path and retained functional callbacks GREEN.
- [x] Gate loaders/targeting with native absent/failure state. For s2i.a's callbacks, no start-without-completion and no fabricated loaded view; real failure/no-content callback exactly once. Validate actual home/VIP state has no reserved loading rectangle, seller media remains and dispose/detach/pause paths remain valid. Expected selected no SDK construction/load or ad-only targeting; native consumer completes; real listing operations unchanged.
- [x] Stop NativeAdRepo list fetch/event and the actual sponsored coroutine, including direct construction callers. Use source-established nullable/empty/no-content states; verify the real consumer before selecting a cold-flow completion. Stop banner/native impression/viewability metrics and unnecessary producer/timer work. Expected no advertising request/measurement, finite completion and no growing queue/retry loop; no functional network result invented.
- [x] Build and FULL apply/rebuild/sign/decode Hide ads. Run original/selected native verifier and Python suite. Expected all ad groups GREEN, exact restoration of original graphs/handlers and manifest outside owned edits. Commit `feat(marktplaats): suppress independent ad loads and measurements`.

### Task 3: Optional measurement and persisted upload gates

**Files:** TrackingPatch/TrackingResources/VendorTracking/FirebaseTracking/PersistedMeasurement.kt; tracking VM/contracts/verifier; validator dependency mapping.
**Interfaces:** public `disableTracking` includes `hideAds`; `verify_measurement(f,disabled)` covers app, vendor/product, admission/lifetime and persisted paths. CCT helper owner/field/register ABI is derived from this actual APK, not copied from another app.

- [ ] Add native baseline/RED tests for cz9 event/page/property sinks; ei.d's real uq disabled wrapper under all consent inputs; Facebook activation versus preserved auth; Datadog predicate/provider; Braze native disabled state and consent/login/FCM re-enable; both UserZoom resume and c8h study paths; GAID unavailable state; Firebase permanent product predicates, app crash override and later/stored enablement; FCM export versus real message/token handling. Expected original native functional cases GREEN, requested suppression RED. Record actual metadata nodes before editing.
- [ ] Implement narrow app/SDK gates, product flags and only audited advertising permissions/providers. Prevent initialization, event admission and observers where merely stopping send would retain growing queues. Use native disabled SDK state, not null singleton objects. Preserve CMP decisions/UI-finish/error/settings and independent first-party push; keep security profiling unchanged in this control. Expected selected source sinks remain off after grants/login/resume; genuine function/error paths retain graphs.
- [ ] Trace actual Firebase settings/Performance/CCT transports and persisted source names. Add native metrics-on/off empty/all/mixed/unknown batches, admission/lifetime, unavailable-settings validation, native cleanup and true-result success/transient/retry tests. Observe original RED. Filter after generated metrics at a common anchor; all-filtered data uses native fatal deletion; retained data keeps context/extras/order and real outcome. No success acknowledgement. Expected selected native groups GREEN and original transport body/handlers restored exactly.
- [ ] Add validator `Disable tracking:[Hide ads]`. Build and FULL validate affected controls and all current selections; run Python suite. Expected native original/selected cases, reports/signatures and retained-source hashes GREEN. Commit `feat(marktplaats): disable optional measurement and queued uploads`.

### Task 4: Independent expert security-profiling control

**Files:** SecurityPatch.kt; security VM/contracts/verifier; validator mapping.
**Interfaces:** public `disableThreatMetrix`, name `Disable ThreatMetrix (expert)`, defaultfalse, directly originalInput only. Produce `verify_security(f,expert)`; normal tracking does not change ThreatMetrix state.

- [ ] Execute native fresh wrapper initialization, enable predicate and header fallback against real class/SDK declarations. Pin all app callers, constructor, blocking/refresh coroutine and real request/auth graph. Test default/native-enabled profile path and original configuration-disabled emptyMap path; no actual SDK/network profiling. Observe original RED for desired expert no-init/no-profile/no-wait policy; preserved default behavior GREEN.
- [ ] Prevent threatmetrix/a.d before SDK getInstance/init and force a.e false with exact guards. Keep initialized b false; execute real a.b(Request) for POST/PUT and other methods. Expected actual native emptyMap, no deferred/session wait or profiling call, untouched ordinary request/auth values and native server-error handling. No fabricated ID/token or security success.
- [ ] Wire independent default-off selection and explicit warning about possible login/checkout/security failures. Build and FULL validate expert-only plus all; original/default cases remain native. Expected no interaction with unselected ad/tracking controls, Python GREEN, catalogue82/19. Commit `feat(marktplaats): add expert security profiling opt-out`.

### Task 5: Input negatives, privacy documentation and review handoff

**Files:** actual SDK input regression runner; docs/marktplaats-audit.md;
docs/privacy/marktplaats/README.md and index; EN/NL apps/marktplaats.md plus
category/navigation/research/download/catalogue mappings and README generation.
**Interfaces:** consume all3 public controls and real dependency closure. Map
package to guide slugmarktplaats; use the existing Other category, including
explicit README Other membership so a mapped app cannot disappear from summaries.

- [ ] Run production original-input/method guards with real disjoint certificates. Original accepted; wrong package/version/code/minSdk and missing/untrusted/mixed signer rejected before mutation. Missing/ambiguous/flags/register/count negatives reject. Expected all SDK assertions GREEN and rejected manifests byte-identical.
- [ ] Run final FULL original, each public control and explicit all with effective dependencies. Expected successful apply/rebuild/signature/native effects; all original graphs restore outside exact edits. Reuse already passing unaffected checks; rerun affected ones after any change. Verify all7 native libraries unchanged.
- [ ] Write domain/data/effect/remaining-service README, audit and bilingual guide. Cover first-party metrics/ad APIs, Google/PubMatic/Prebid, Adjust/Criteo/Facebook, Braze endpoint, Datadog US1, Firebase, Sourcepoint, UserZoom, functional services and retained-default/optional ThreatMetrix. Clearly distinguish source-wired/configured/unknown activity, no captured-network claim. Record queue/privacy discards, native callback evidence, SDK local-state limits, marketing-push effect and phone/security/backend limitations.
- [ ] Generate metadata/README/catalogues. Run Python, Node, strict docs/local links and scope proof against downloaded v1.14.0-dev.1: previous79 entries/defaults and200 individual payloads unchanged; aggregate DEX rebuilt plus new app classes. Fetch/rebase current main documentation if required. Expected GREEN and no original APK/source/key material staged. Commit audit/docs, then pin guide source links to the implementation commit separately.
- [ ] Close implementation evidence and prepare the fresh whole-branch review handoff. Expected all task contracts recorded in the ledger; final review/publication remain required post-implementation delivery.

## Commands and verification conventions

Run from the SSD worktree. `source build/env.sh`; set GitHub build credentials
from the existing gh session without printing them. Build using
`python3 scripts/build.py buildAndroid generatePatchesList --offline --no-daemon --max-workers=1 -Dorg.gradle.parallel=false -Dkotlin.compiler.execution.strategy=in-process`
with a bounded heap and SSD temporary directory. Expected `BUILD SUCCESSFUL`.

Native verifier:
`PYTHONPATH=tests python3 tests/verify_marktplaats.py DECODED --apk APK [-e NAME]`.
For original desired REDs use `--behaviour-only slots|ads|tracking|security` with
the corresponding selected expected policy. Expected original baseline PASS,
desired policy AssertionError at the actual effect, selected PASS. Pin restored
graphs in normal mode; behaviour-only mode does not claim artifact validity.

FULL route:
`python3 scripts/validate_targets.py marktplaats /Volumes/EXT-SSD1/phone-apks/marktplaats.apks --compact`.
Expected original, individual and all report/signature/effects PASS. Keep final
combined APK/decode for fresh review if space permits; compact successful
intermediates only. Python task contract:
`python3 -m unittest discover -s tests` → OK.
Final Node: `node --test tests/test_release_branding.cjs` →6 pass.
Docs: existing docs venv `python -m mkdocs build --strict` and
`python scripts/check_docs_site.py` → complete paired pages/local links PASS.

## Post-implementation review and delivery

After task closure, one fresh whole-branch reviewer checks the spec, this Review
Focus and every ledger ruling. Re-grade by user impact; one verified RED→GREEN
fix pass for Important/Critical only; Minor findings are deferred and disclosed.
Publish the already authorized dev candidate, download it and verify its code,
catalogue, feed/version and provenance against the tested build. Keep main and
phone/account/transaction actions separate. Preserve release evidence and archive
only this plan's scratch workflow; retain the SSD worktree for TVgids.nl.
