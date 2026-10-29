# NOS Teletekst implementation plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans inline.

**Goal:** Disable the established audience tracking and NOS-app promotion without changing usable Teletekst.
**Architecture:** Two independent default-on source-guarded bytecode controls. Return the native empty MultiTracker at the DI factory and false at the specific promotion predicate. Retain original bodies and functional paths.
**Tech Stack:** Kotlin/dexlib, actual smali fixtures, Morphe FULL APK verification, SDK guard regression, Python/Node/MkDocs.
**Spec:** docs/superpowers/specs/2026-10-29-teletekst-design.md

## Global constraints
- Exact com.eoffice.android 2.8.10/code62/minSdk23/signature/base SHA from the spec; input `/Volumes/EXT-SSD1/phone-apks/nos-teletekst.apks` and existing private decode under SSD research.
- Public Disable tracking and Hide promotions default on; no dependencies between them. Every mutation directly depends on the shared original-input guard.
- Factory keeps native context validation; empty Tracker array is non-null. No SdkTracker/NPO construction, fake send/consent result or erased app state.
- Promotion gate only; preserve page818, all Main content/callback/security/TV/privacy/preferences behaviour. No commercial-ad or premium claim.
- One memory-heavy local pipeline; no new whole-app decompile, phone actions, emulator or publisher APK publication. Keep prior app code payloads/defaults identical.

## Review focus
- Existing stored measurement cannot acquire a worker independently of the changed factory (Task1 source init/provider/worker checks and cold factory fixtures).
- DI and all normal screen events keep a non-null functioning Tracker; null context still fails (Task1 actual wrapper/MultiTracker/error fixtures).
- Tracking-only still permits the real third-visit promotion; promotion-only preserves other tracking (Task1 four-mode matrix).
- Page refresh, pause, retries, bookmarks/share and TV privacy remain intact (Task1 native refresh/pause checks and retained whole graphs).
- Wrong input metadata/signer/minSdk and ambiguous targets reject before mutation (Task2 actual SDK preflight and original FULL validation).

### Task 1: Native tracker and promotion controls
**Files:** create `patches/src/main/kotlin/patches/teletekst/{Compatibility,TrackingPatch,PromotionsPatch}.kt`; `tests/{teletekst_contracts,teletekst_vm,verify_teletekst}.py`; extend `rtl_vm.py`/its unit tests for array-length, plus `scripts/validate_targets.py` and its routing test.
**Interfaces:** `guarded(owner,signature,flags,registers,count)` returns the unique exact MutableMethod. Factory `provideTracker(Context):Tracker` has8 original instructions/4registers/flags17, insert5 instructions at2 after null check. Private promotion `dialogShouldBeShown(String,Z):Z` has23 instructions/5registers/flags2, prefix `const/4 v0,0; return v0`.
- [x] Pin the original factory/DI/native MultiTracker/promotion and functional/SDK source graphs; establish baseline behaviour.
- [x] Observe array-length unit RED then implement strict reference-array length; baseline full fixture must run native tracker dispatch.
- [x] Observe original RED for requested no-SDK factory and no-promotion policy, with original third-visit/installed/other-page and context checks GREEN.
- [x] Implement only the two source-owned insertions and compatibility/preflight. Wire individual/combined routing.
- [x] Build; FULL apply/report/sign/decode both individual controls and all, original/source identity and native effects GREEN; Python suite GREEN. Commit.

### Task 2: Input guards, documentation and dev delivery
**Files:** focused actual SDK preflight runner; `docs/teletekst-audit.md`, `docs/privacy/nos-teletekst/README.md`, bilingual `apps/nos-teletekst.md`, app indexes/nav/download guidance and generated catalogues/README. Refresh bundle summary to avoid its stale enumerated app list.
**Interfaces:** consume Task1's two controls/verifier; package-to-guide mapping for com.eoffice.android → nos-teletekst/news; existing controls/defaults unchanged.
- [x] Exercise actual production preflight with original and wrong package/version/code/missing/untrusted/mixed signer/minSdk, and dependency ordering. Expected original accepted and every invalid case rejected without manifest mutation.
- [x] Document topspin.npo.nl/mob-event and nmonpoendpoint.2cnt.net purpose/data, source-versus-capture evidence, unchanged content/security/TV notice and retained local IDs. Add bilingual guides and catalogue navigation.
- [x] Python/Node/catalogue/strict docs pass; prove prior payloads and catalogue entries unchanged,77controls/17apps, both new controls default on. Fetch/rebase main docs before dev push if needed.
- [x] Prepare the final review package and dev delivery with phone acceptance pending. After implementation tasks close, run one fresh review and at most one verified fix pass; publish the authorized dev release and verify downloaded payload/catalogue/feed/version/attestation. Archive/delete only this workflow workspace and continue the larger goal.
