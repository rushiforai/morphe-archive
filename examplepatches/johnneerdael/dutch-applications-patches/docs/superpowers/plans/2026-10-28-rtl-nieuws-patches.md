# RTL Nieuws Privacy and Ads Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans inline, one app increment at a time. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add three safe RTL Nieuws privacy/ad controls and publish the next validated development increment.

**Architecture:** Separate `patches.rtl` bytecode/resource controls reuse original-input guards and verifier infrastructure. Independently pin actual RTL callbacks, disabled configs, obfuscated SDK types and persisted transport contracts before writing their changes. Preserve functional initialized objects and native result/readiness states.

**Tech Stack:** Kotlin Morphe patches, Python3, JDK21, Desktop1.19.1 FULL, apktool, Android build-tools36.1.0, semantic-release dev workflow.

**Spec:** `docs/superpowers/specs/2026-10-28-rtl-nieuws-design.md`, supplementing `docs/superpowers/specs/2026-10-28-dutch-app-rollout-design.md`; original evidence `docs/research/2026-10-28/rtl-nieuws.md`.

## Global Constraints

- `nl.rtl.rtlnieuws`,12.7.1/1558,minSdk32,APKS; signer SHA256 `80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92` or `862a0a19d90fe0c678bde313d7a8606e3a97a0c209ab0b56626eb8eaf18571f9`.
- Hide ads; Disable tracking includes ads; Skip consent screens includes both. Preserve actual JWT/account/ad-free/Billing outcomes, media token/play/DRM, push, manual privacy and configuration.
- No received premium body or native article paywall contract was established. Do not add an unlock/full-body control or promise backend/SSAI delivery.
- All new research/output/Gradle/temp allocation stays on SSD. Root serializes owned JVM jobs at1GiB; source-only agents do not start JVM/device/network work. Never print credentials/raw publisher bodies.
- Preserve current approved/main state and all existing dev catalog/code payloads. Dev publication is already authorized; no approval menu. SDK/config/source destinations are distinct from captured transfers.

## Review Focus

- A common banner renderer can have multiple callers and a remembered250-height placeholder; ad skipping must deliver its real terminal callback and remove initial/reserved space without blocking completion.
- Regular/vertical/legacy video and native creative ads use different paths; no VMAP/ad scheduling may start after loading begins, and actual token/play/DRM failures and Futures must remain genuine.
- Obfuscated SDK Unit/results/continuations and merged lambda cases differ from the newspaper apps; scope edits to the ad/measurement case and preserve unrelated branches and initialized consumers.
- Collection flags miss restored/persisted queues and video source/session trackers; block proven measurement transport names before actual sends while retaining genuine response/retry and functional shared SDK paths.
- Automatic privacy refresh and manual resurface have separate readiness semantics; no stuck busy flag, fabricated choice, push/account regression or signer-bound acceptance claim is allowed.

---

### Task 1: Independent RTL contracts and verification routing

**Files:** Create `tests/rtl_contracts.py`, `tests/verify_rtl.py`, `tests/test_rtl_contracts.py`; modify `scripts/validate_targets.py`, `tests/test_validate_targets.py`. Private evidence only in `build/rtl-ads-survey.json`/notes and `build/rtl-tracking-survey.json`/notes.
**Interfaces:** APPS key `rtl` with the three dependencies above; `verify(root: Path, selected: set[str], apk: Path | None = None) -> None`; CLI decode root/repeated `-e`/optional actual `--apk`. Reuse `DexDeclarations`, strict class/method access audit and cached source parsing. Do not alter existing verifiers' behavior. Data-only roles pin exact original targets/retained methods independently; Tasks2/3 consume those contracts.

- [ ] Add the RTL route/three-control/actual-APK binding test and run `source build/env.sh; python3 -m unittest discover -s tests`. Expected: FAIL missing RTL routing.
- [ ] Combine independently verified ads and telemetry/consent surveys into data-only original declarations/counts/registers/canonical hashes/return/readiness contracts; cross-check actual original DEX flags and smali. Pin functional auth/Billing/DRM/media/push/feedback/privacy paths.
- [ ] Implement original/selected verification and call-kind/access/register checks. Original exact input with no selections must PASS; each selected control must FAIL absent effects. SDK Unit is verified from RTL source, not assumed as Kotlin/Unit. Use explicit reference semantics in new execution fixtures; do not copy the deferred Dumpert VM empty-reference equality limitation.
- [ ] Add semantic fixtures for native terminal callback/height/completion, separate video no-ad inputs/content success/error/DRM Futures, true disabled analytics/source/session configs, persisted measurement batches and automatic/manual consent readiness. Exercise actual emitted instruction graphs and preserve original retained body hashes.
- [ ] Run whole Python suite (PASS), record observed RED→GREEN and commit verifier/routing/contracts. Move effect-specific semantic additions into Tasks2/3 when their exact output requires it, with a ledgered ruling and no release until covered.

### Task 2: Native placements and separate video ad paths

**Files:** Create `patches/src/main/kotlin/patches/rtl/Compatibility.kt`, `AdsPatch.kt`, focused placement/video/resource helpers as needed; extend verifier fixtures.
**Interfaces:** `hideAds` named Hide ads, exact app compatibility and originalInput. Target descriptors/merged-case guards/native failure result types must come from Task1. Tracking depends on this control.

- [x] Observe original-negative assertions before production edits. Pin every intended edit and surrounding functional method before mutation.
- [x] Suppress DPG placements with native scoped terminal failure/completion and zero initial/reserved height; handle the independent branded GAM route before Compose/Loading. Cover secondary callers/native creative mediation without dropping awaited callbacks or changing global consent/ad-free account state.
- [x] Route regular video through its actual AdFree/no-VMAP branch and native empty AdvertisingConfig; preserve token/play/metadata/DRM and source publication. Preserve already-ad-free vertical loading. Cover established legacy no-ad branches with their native types; document unresolved remote/SSAI scope.
- [x] Gate only audited ad startup/requests/resources after initialized dependencies/callback obligations are established. No blind provider/SDK removal.
- [x] Run semantic checks, whole Python suite, capped offline buildAndroid and Hide ads FULL/report/signature/decoded validation (all PASS); commit.

### Task 3: Collectors, IDs, video analytics and automatic consent

**Files:** Create `patches/src/main/kotlin/patches/rtl/TrackingPatch.kt`, `ConsentScreensPatch.kt`, focused SDK/resource/identifier/video tracking helpers; extend independent verifier/tests.
**Interfaces:** `disableTracking` includes hideAds; `skipConsentScreens` includes disableTracking. Every mutating dependency consumes originalInput. All exact SDK/builder/disabled-return contracts are Task1 data, not guessed newspaper/Dumpert descriptors.

- [ ] Observe RED on native app/SDK/video/identifier/queue/consent effect checks before implementation.
- [ ] Stop app fan-out and direct/queued Snowplow/NMO/SmartOcto/Firebase/video source/session tracking through actual disabled configs and real typed completed values. Cover foreground/config/consent re-enable and existing persisted transport batches, including exact Firebase Performance log-source whitelist. Preserve other events' identity/order/extras and real response/retry status; never fabricate delivered success.
- [ ] Disable optional advertising/profile/DMOI/ID collection and association while satisfying initialized SDK/Flow/Job/callback contracts. Preserve actual auth IDs/JWT/account/Billing synchronization and functional headers/Futures.
- [ ] Audit Swrve/Usabilla/diagnostics/push-statistics and executable web/TagManager assets precisely. Retain mixed push/feedback/config/auth/DRM dependencies. Disclose any remaining transport rather than infer a full-network block.
- [ ] Skip only automatic consent refresh; preserve manual resurface and execute original busy=false/ready=true completion with no written choice. Keep listeners/ready/manual account/notification behavior genuine.
- [ ] Run actual emitted completion/empty/cached/foreground/consent/queue/error cases, whole Python suite and capped buildAndroid (PASS); commit.

### Task 4: Final matrix, transparency, review and dev delivery

**Files:** Promote existing RTL README section; create `docs/rtl-nieuws-audit.md`; update about metadata and destination evidence. Catalog/feed/version remain generator/workflow owned.
**Interfaces:** original `/Volumes/EXT-SSD1/phone-apks/rtl-nieuws-original.apks` + final MPP → four signed FULL/decoded selections and verified dev release.

- [ ] Run original and three individual/all selection matrix with exact APK binding. Reuse unchanged original decode only with exact base SHA256 and complete original verifier rerun. All reports, signatures, callback/content/readiness/queue checks must PASS.
- [ ] Generate catalog; all existing entries/payloads remain unchanged with exactly three RTL additions. Verify target package/version/code/minSdk/signers. Record current approved source boundary after any concurrent dev merge.
- [ ] Promote the existing research-only README table with exact tracking domains/purposes/data/effects and retained/unknown flows. Include separate VMAP/DRM/auth/config, Snowplow/NMO/SmartOcto/Bitmovin, identifiers, Swrve/feedback, persisted telemetry and remote/SSAI limits. No phone acceptance claim.
- [ ] One fresh whole-increment review; regrade material findings, make one RED→GREEN fix pass plus green suite and affected final artifact validation. Ledger rulings and deferred minors.
- [ ] Fetch/integrate current dev; verify final merged code payloads match tested output. Publish through semantic-release dev, verify terminal Release/attestation and actual downloaded MPP code/catalog/feed/README. Main unchanged. Report phone scope and continue Omroep Brabant; overall rollout goal stays active.
