# Omroep Brabant Privacy and Ads Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans inline. One app increment at a time; read-only independent source surveys and one final fresh review.

**Goal:** Implement and publish the next validated Omroep Brabant development increment.

**Architecture:** Separate `patches.brabant` controls consume exact independently
matched original/native contracts. Reuse declaration/Smali/SDK and bounded
instruction infrastructure; pin this app's own types, results and lifecycle.

**Tech Stack:** Kotlin Morphe, Python3, JDK21, Desktop1.19.1 FULL, apktool,
Android build-tools36.1.0, existing semantic-release dev workflow.

**Spec:** `docs/superpowers/specs/2026-10-28-omroep-brabant-design.md`, supplementing
`docs/superpowers/specs/2026-10-28-dutch-app-rollout-design.md`.

## Global Constraints

- `nl.omroepbrabant.android`,11.1.0/7331764,minSdk32,APKS; signer SHA256 `5b364bd01320e86c272a126b37b62be15753363565d930706c721d4909416a03`.
- Exact base SHA256 `c0229a1054b91109eda4fb386ecce2eb8a4c5dc2436c843f3b1cd20f67f9a860`; original archive on SSD is `omroep-brabant-original.apks`.
- Hide ads; Disable tracking includes ads; Skip consent screens includes both. Preserve real content/history/media/push/configuration/manual privacy and initialized mixed services.
- No invented consent, UUID/token, entitlement, receipt, ad reward/completion or delivered telemetry success. No TLS/integrity bypass or unsupported full-body claim.
- Preserve all67 prior catalog entries and compiled payloads; no stable promotion. Dev publication is already authorized. New storage and serialized capped JVMs stay on SSD.

## Review Focus

- Pinch native/Compose/XML and repeated attaches must complete once with zero placeholder/slot space, without starting requests or abandoning listeners.
- Outbrain/Start.io must be omitted before widget/provider/remote work; regular content/navigation remains. Vertical ad removal must preserve video identity/order and selection/index behavior.
- Blue Billywig renderer and late services can bypass a null scheduling getter; real no-ad content/lifecycle and TCF-overwritten statistics need distinct coverage.
- Local read DB/history and ContentInsights cleanup share methods with network telemetry; retain local effects, nonnull initializers and real suspended/cached/error result types.
- Consent/config/foreground re-enable, restored queues and merged SDK branches must not restart collection or break push/radio/config/manual privacy; retain real failure/retry/completion.

---

### Task 1: Independent contracts and APK-bound verification route

**Files:** Create `tests/brabant_contracts.py`, `tests/verify_brabant.py`, focused
fixture/contract tests. Modify `scripts/validate_targets.py`, `tests/test_validate_targets.py`.
Private independent evidence: `build/brabant-ads-survey.json`/notes and
`build/brabant-tracking-survey.json`/notes.

**Interfaces:** APPS key `brabant` has the three dependencies above;
`verify(root: Path, selected: set[str], apk: Path | None = None) -> None`;
CLI root/repeated `-e`/`--apk`. Contract rows are owner, full signature, binary
access flags, locals, canonical count/hash; separate complete switch/error
maps and effect roles feed Tasks2/3. Original original-method-hashes.json36
research anchors are a starting reference, not production-derived expectations.

- [ ] Add `test_brabant_privacy_controls_and_bound_apk_verifier`, run `source build/env.sh; python3 -m unittest discover -s tests`. Expected: FAIL missing brabant route.
- [ ] Add routing without changing existing optional APK bindings. Expected: whole suite PASS.
- [ ] Independently cross-check original DEX declarations and source for ads/callbacks/player plus telemetry/IDs/consent/native results/retained services; merge consistent survey rows and full switch/error maps. Pin exact proposed edits and typed completion contracts before implementation.
- [ ] Add original/selected retained-body and call-kind/register/selection auditing. Run original bound verifier: PASS; each selected original: FAIL absent effect. Fail closed while a control's semantic proof is pending.
- [ ] Use explicit reference/identity/null semantics and actual app-native Unit/results/readiness; reuse bounded interpreter only where its instructions match. Add missing interpreter fixtures RED→GREEN as needed. Effect-specific execution fixtures may finish with Tasks2/3; no release until all pass. Commit with green whole suite.

### Task 2: Display/recommendations and separate video ad paths

**Files:** Create `patches/src/main/kotlin/patches/brabant/Compatibility.kt`,
`AdsPatch.kt` and focused placement/video/resource helpers; extend decoded verifier.

**Interfaces:** `hideAds` uses exact compatibility and originalInput. Exact edit
records and retained callback/player contracts are consumed from Task1.
Anchors include Pinch `OptOutAdView.e(Lk9;)V`, `ja.R0(Lja;Ly9;)V`, model
construction, `xc0.invokeSuspend`, `kj7.A0(Lfy2;Ljava/util/Map;)V`, and original
EmbedObject scheduling/services getters; actual source decides native result paths.

- [ ] Observe intended original effects RED before production edits. Preserve exact original count/register/access/anchor guards in every edit.
- [ ] Suppress Pinch model/requests with real no-fill callbacks and zero-space consumers; cover XML and Compose/error/reattach routes. Omit Outbrain before remote bridge/MREC and isolate ad startup only after dependency mapping. Expected: actual callbacks settle once, no ad-only rows/placeholders/requests, ordinary content identities/order retained.
- [ ] Suppress vertical insertions before selected-index math; route all audited regular/renderer/late scheduling/services through native no-ad content setup. Preserve clip/playlist, media preparation, errors/ready/pause/resume/destroy/radio/live/cast. Expected: native lists/indices/content and completion preserved, no ad scheduling.
- [ ] Run emitted execution checks, whole suite, capped offline buildAndroid and Hide ads FULL/report/signature/decode. Expected: PASS; commit. Keep known remote/SSAI scope explicit.

### Task 3: Collectors, optional IDs, queued work and automatic privacy

**Files:** Create `patches/brabant/TrackingPatch.kt`, `ConsentScreensPatch.kt`,
focused SDK/ID/video/resource/queue helpers; extend independent verifier/data.

**Interfaces:** `disableTracking` depends on hideAds; `skipConsentScreens`
depends on disableTracking; all mutating paths consume originalInput. Exact
app-native result roles, source callbacks, persisted names and queue lifecycles
are Task1 outputs, not copied RTL/Piano/Firebase descriptors.

- [ ] Observe original-negative collector/typed completion/ID/queue/consent checks before corresponding implementation.
- [ ] Stop app `xd` and push direct Firebase events, Piano through its native false gate and SDK send/queue leaves, ContentInsights activation while preserving `nt.l`/mixed `nt.n`, NMO registration/cache/forwarding and first-party `nt.j` read telemetry after local DB effects. Expected: initialized singleton/SDK, local history and real result/callback/suspension complete; no invented ID/Unit substitute.
- [ ] Disable optional IDs, Blue Billywig statistics despite TCF re-enable, Firebase optional analytics/crash/session/push statistics and proven persisted transport names. Audit separate Pinch/Outbrain/SDK diagnostics and web assets; retain mixed functional traffic with disclosure. Expected: empty/cached/foreground/re-enable/restored batches/unknown events preserve types, identity/order/extras and genuine retry/failure/deletion, no fake delivery.
- [ ] Skip automatic custom/UMP presentation using real busy/ready/native completion paths; preserve stored choice, manual settings and generic embed/puzzle vendor gate. Expected: no fabricated consent, blocked startup or lost UI completion; manual path retains original body.
- [ ] Run emitted result/list/cleanup/queue/error/manual/automatic execution checks, whole suite and capped buildAndroid. Expected: PASS; commit.

### Task 4: Final matrix, README transparency, review and dev delivery

**Files:** Promote existing Omroep Brabant README table; create
`docs/omroep-brabant-audit.md`; update about metadata and destination evidence.
Catalog/version/feed remain generator/workflow owned.

**Interfaces:** Original APKS + final MPP → original and four signed FULL/decoded
selections, then exact tested compiled payloads → actual downloaded dev release.

- [ ] Run fresh original+three individual+all FULL/report/signature/decoded verification, exact APK binding and all effect/retained checks. Expected: PASS.
- [ ] Generate catalog and prove67existing entries/payloads retained plus exactly3Brabant controls, exact target/code/minSDK/signer. Expected: only intended new app classes/combinedDEX/about metadata differences.
- [ ] Promote README domains/purpose/data/identifiers/effects/remaining/unknown/source-versus-capture table; document shared publisher/BBvms hosts, no SSAI/runtime guarantee, push/media/consent dependencies and acceptance pending. Expected: all20tracking tables retained and correct current app status.
- [ ] One fresh whole-increment read-only review after implementation. Regrade actual effects; one material RED→GREEN fix pass + green suite/affected artifact checks, ledger deferred minors/rulings. No per-task reviewer.
- [ ] Fetch/integrate dev, preserve tested code and main boundary, publish authorized dev through existing workflow. Verify terminal Release/attestation and actual downloaded MPP/catalog/feed/README. Expected: exact tested payloads, correct version and source, main unchanged. Report phone scope; continue VI. Overall rollout stays active.
