# Dumpert Privacy and Ads Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans inline, one app increment at a time. Steps use checkbox (`- [x]`) syntax for tracking. Begin implementation after the Parool dev increment is published.

**Goal:** Add separately selectable Dumpert ad, tracking and automatic-consent controls and publish a validated dev increment for phone testing.

**Architecture:** A separate `patches.dumpert` package uses the existing original-input guard and independent decoded-output matrix. Route the app's original no-ad mapping/player branches; stop optional measurement at its actual send/identifier boundaries while retaining initialized functional objects. No Deluxe entitlement or billing state is changed.

**Tech Stack:** Kotlin Morphe patches, JDK21, Python3 independent verifiers, Desktop1.19.1 FULL, apktool, Android build-tools36.1.0, semantic-release dev workflow.

**Spec:** `docs/superpowers/specs/2026-10-28-dutch-app-rollout-design.md`; original evidence in `docs/research/2026-10-28/dumpert.md`; private source `/Volumes/MorpheResearch/research-2026-10-28/apps/dumpert/decoded`.

## Global Constraints

- `nl.dumpert`, 5.8.0 / 22001778, minSdk32, APKS, publisher signer `0370088e565d42bd3cfca2bad7c7293cfb6090de2f7fa45c2bc5a087140a2db5`.
- Controls: Hide ads; Disable tracking (includes Hide ads); Skip consent screens (includes Disable tracking and Hide ads). Preserve manual privacy/login/purchase controls and real accounts/Deluxe/Billing outcomes.
- Do not treat bundled remote-embed or SSAI capability as proven removable advertising. No paid-media access claim is supported by this research.
- All new allocation stays on SSD. Use ignored `build/env.sh`; cap/serialize owned JVM jobs at1GiB. Never print credentials, raw article/media bodies or user/session values.
- Preserve approved app source/catalog. User authorized sequential implementation and dev publication; main/stable remains separate. Each app's README must disclose tracking domains, purposes/data, patch effects and retained/unknown flows with evidence labels.

## Review Focus

- Generic injector output must retain original typed content mapping, order, stable IDs and paging; returning raw input or stopping loaders after Loading begins is insufficient.
- Detail and Shorts have independent IMA insertion/coordinator paths; no latch, ad-loading/scroll lock, loop regression or fabricated completion may survive a no-ad decision.
- Didomi readiness/state/manual preferences must work with automatic setup skipped; no consent grant or broken onReady callback.
- Hilt/Piano/Facebook/Firebase objects must remain non-null where functional code dereferences them. Suppression must survive consent changes, foreground/config refresh and queued sends.
- Real guest/account, favourites/comments/kudos, uploads, push and current/legacy Billing error/cancel/pending/ack/token-refresh behavior must remain genuine; remote social/SSAI and signer-bound auth limits stay explicit.

---

### Task 1: Independent contracts and routing

**Files:** Create `tests/verify_dumpert.py`, `tests/dumpert_contracts.py`, `tests/test_dumpert_contracts.py`, `tests/dex_declarations.py`, `tests/test_dex_declarations.py`; modify `tests/test_validate_targets.py` and `scripts/validate_targets.py`.
**Interfaces:** `verify(root: Path, selected: set[str]) -> None`, CLI positional decode root plus repeated `-e` and optional `--apk` for its actual source APK; `verifier_command(app, destination, effective, apk: Path | None = None)` passes `--apk` for Dumpert only; APPS `dumpert` with the three controls/dependencies above. Task2/3 consume the independently pinned target/retained contracts, not Kotlin-generated expectations.

- [x] Add a routing test asserting exactly the three controls and dedicated verifier, and observe its missing-route failure with `source build/env.sh; python3 -m unittest discover -s tests`.
- [x] Pin actual identity/resources, app sender/consumer descriptors and normalized original method digests before production edits. Include GenericAdInjector, common AdView, both player/ad eligibility paths, SDK init/identifier targets, central/direct PostRec/Firebase/Piano paths, Didomi automatic/manual/readiness and genuine account/Billing/media contracts from the research.
- [x] Add semantic checks using actual decoded/emitted instructions: 21 editorial items remain21 mapped items with original identities/order and no ad slots; empty input stays empty; direct/detail/shorts paths avoid ad requests without orphaned loading; ordinary coordinator fallback clears latch/loading and restores looping. Test real callbacks/flow/result types, not an invented success enum.
- [x] Reuse the corrected DEX invocation audit pattern including class/interface, static/instance and private/direct access, actual register aliases and DEX boolean values. Missing/ambiguous methods and unexpected SDK consumers fail clearly.
- [x] The Parool profiler established a significant SSD bottleneck opening every decoded class just to read headers. For this new verifier, test and implement `DexDeclarations.from_apk(Path)` as a read-only index of actual DEX class flags/superclasses and method signatures/access/direct-vs-virtual definitions. Test multidex, overloads, private/static/interface/constructor flags, truncated offsets, malformed ULEB128 and conflicting duplicates before implementation. Resolve actual invoked declarations from this index and Android SDK metadata; select morphe helpers/owned target methods from DEX method names, then inspect their real decoded instruction graphs. Preserve full call coverage. When no bound APK is supplied, retain strict smali declaration discovery rather than silently omit unknown targets. Cross-check sampled indexed original declarations against actual original smali headers and run the private/direct failure fixtures. This changes no approved verifier and does not replace callback/content semantics with a metadata-only check.

- [x] Run original verifier with no selections (PASS); run each selected control against the original (FAIL on absent effect). Add routing, run all Python tests (PASS), commit verifier/routing evidence.

### Task 2: Native display and video ad controls

**Files:** Create `patches/src/main/kotlin/patches/dumpert/Compatibility.kt`, `AdsPatch.kt`; extend app verifier/tests from Task1.
**Interfaces:** guarded `hideAds` bytecodePatch named Hide ads, app compatibility/originalInput helpers. Tracking/consent will depend on hideAds.

- [x] Before implementation, assert no-ad emitted behavior on the original and observe RED. Pin retained method bodies around the exact intended edits.
- [x] Gate the common `AdViewKt.AdView-8u0NR3k(...Composer;III)V` before Compose groups/VM/request creation. Direct detail/support and failure-promotion surfaces must not start or reserve an ad slot.
- [x] In `GenericAdInjector.injectAds(List)List`, replace only the first `adInterval` read with0; preserve the original interval<=0 createItemSlot mapping. The second read belongs to the retained unreachable ad branch. Assert exact first-read/register/branch structure.
- [x] Disable only advertising eligibility and both IMA attachments using actual supported null/no-ad branches. `DumpertContentPost.getCanShowAds()Z` is an ad-eligibility value, not a Deluxe claim. Preserve detail URI/MIME/metadata/build and Shorts coordinator invocation/fallback/watchdog/loop/reset paths. Any ad-specific helper returning null must have its real null consumer pinned and exercised.
- [x] Stop app/consent-ready AdsManager initialization, Prebid and GMA startup at their audited boundaries, with genuine initialized state/callback contracts. Do not suppress a load after its caller starts awaiting it.
- [x] Run semantic original/selected checks and whole Python suite (PASS), capped offline buildAndroid (PASS), apply Hide ads with FULL/sign/redecode (PASS); commit.

### Task 3: Tracking, identifiers and automatic consent

**Files:** Create `patches/src/main/kotlin/patches/dumpert/TrackingPatch.kt`, `ConsentScreensPatch.kt`; add focused helper/resource files if responsibilities require them; extend independent verifier/contracts/tests.
**Interfaces:** named `disableTracking` depends on hideAds; `skipConsentScreens` depends on disableTracking. Every mutating dependency directly consumes originalInput.

- [x] Write/observe RED assertions for native collectors, optional identifiers and automatic consent while retained accounts/manual readiness remain original.
- [x] Stop central analytics fan-out, direct Firebase user/property paths, Comscore initialization/native ingress and separate PostRecTracker side effects. Preserve actual kudo/favourite/comment/content mutations. Permanently disable Firebase analytics and optional diagnostics/sessions/push statistics, including runtime re-enable and inventoried queued/explicit sends; retain auth/FCM/installation/configuration.
- [x] Stop PPID/ad/AppSet acquisition and optional targeting outputs with their actual completed Unit/String/map contracts. PpidProvider methods include `prefetchIdentifiers(Continuation)Object`, `resolvePpid(Continuation)Object`, `resolvePpidNow()String`, `getAdvertisingId()String` and `isLimitAdTrackingEnabled()Z`. Resolve PPID uses native null (not empty); advertising/DMP getters require nonnull empty String. Prefetch completes actual Unit. LAT=true is an explicit privacy result, not the native absent-info default. Do not change account/JWT/billing identifiers.
- [x] Cover Piano pageviews/segments/association and its SDK advertising-ID/queued transports; return native empty/no-op completion types. Preserve CxenseModule's non-null initialized SDK contract: it dereferences getInstance/configuration. Removing CxSdkInitializer while this DI remains is forbidden. Preserve original eager segment StateFlow (initially null). Gate private fetchSegments and public retrieveUserSegments with native empty List results; trackPageView must return the native fallback UUID String and update lastRndValue, never Unit. SDK four send* leaves invoke private notifyCallback(EventRecord list,null), preserving actual customId/isSent EventStatus conversion; retain run/scheduling/expiry. Its scheduled AdvertisingIdProvider void lambda may stop without dropping a user callback. Gate Facebook optional initialization/events/advertiser-ID paths while retaining genuine sign-in.
- [x] Make only `DidomiConsentManagerImpl.setupConsentUI(FragmentActivity)V` skip automatic setup. Keep initializeDidomiSdk, onReady, vendor/state listeners and separate showPreferences unchanged; write no consent. Stop separately identified optional CMP metrics, retaining functional configuration/preferences traffic.
- [x] Exercise consent/foreground/config re-enable, missing/cached IDs, initialized dependency consumers, immediate/completed suspend paths and manual settings; whole Python suite and capped offline buildAndroid PASS. Commit.

### Task 4: Matrix, transparency, review and dev release

**Files:** Modify README.md and patches/build.gradle.kts; create `docs/dumpert-audit.md`; generator/workflow owns catalogs/manifests.
**Interfaces:** original APKS + built MPP + verifier produce four signed selections (three singles and all), audit, verified dev release and next-app handoff.

- [x] Run `python3 scripts/validate_targets.py dumpert /Volumes/EXT-SSD1/phone-apks/dumpert-original.apks` under SSD/JDK environment. Expect original-negative and every individual/combined FULL/report/signature/decoded check PASS. Retain decodes while space allows; reuse an unchanged original only with exact base hash plus full original verifier rerun.
- [x] Generate catalog and assert existing entries unchanged and exactly three new Dumpert controls; verify package/version/code/minSdk/signer guards and compiled approved payloads.
- [x] Promote the existing README research-only Dumpert section to development support, updating its destination/purpose/data/effect table and status rather than duplicating it. Keep source vs capture labels. Include GAM/Prebid, Comscore/Piano/Firebase, optional api-dms.dumpert.nl post-rec identifiers/events, retained publisher/auth/push/config/billing/CMP and remote-embed/SSAI limits. Record exact evidence and remaining phone scenarios in audit; do not claim device acceptance.
- [x] Fresh whole-increment review once, resolve material findings with RED→GREEN and whole-suite evidence, commit; verify all required checks terminal.
- [x] Fetch/integrate current dev without overwriting concurrent work; publish with existing semantic-release workflow and verify terminal Actions, version/catalog/MPP asset URLs. Main unchanged. Report phone scope and continue RTL Nieuws; overall goal remains active.
