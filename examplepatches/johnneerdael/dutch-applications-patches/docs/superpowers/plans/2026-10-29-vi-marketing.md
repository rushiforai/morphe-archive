# VI publisher promotion fix implementation plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans inline.

**Goal:** Remove publisher marketing cards from VI home without changing working articles.
**Architecture:** Hide ads installs a typed response-list filter and a pre-composition marketing-renderer guard; all other controls keep their current dependencies.
**Tech Stack:** Kotlin/dexlib, original/emitted smali fixtures, Morphe FULL validation, Python/Node/MkDocs.
**Spec:** docs/superpowers/specs/2026-10-29-vi-marketing-design.md

## Global constraints
- Existing SSD worktree, original nl.vi 5.13.52/code910/minSdk32; signer and base SHA remain those pinned by VI compatibility/contracts.
- Only Hide ads gains behavior. Do not change auth, receipts, Pro metadata/body delivery, request/redirect policy, consent, callback results or other apps.
- Preserve stored input and non-marketing object order/identity; preserve null and return the same list when no marketing exists. No creative-title/URL matching.
- One memory-heavy local pipeline; no device/emulator actions. Publish only the patch bundle to dev.

## Review focus
- Three repeated campaigns and changed creative values all disappear through the typed boundary (Task1 mixed/repeat fixtures).
- Genuine Pro/news/match/live/unknown/null entries remain in order with identical objects (Task1 identity fixtures).
- Empty/all-marketing and cached lists cannot leave a visible promotion or index a missing item (Task1 empty UI branch and cached renderer fixtures).
- Read-only input and repeated getter access do not mutate response state (Task1 immutable/reentry fixtures).
- Combined selection preserves current article/redirect/privacy behavior and prior app payloads (Task2 FULL-all and published comparison).

### Task 1: Typed marketing suppression
**Files:** create `patches/vi/MarketingPromotions.kt`, `tests/{vi_marketing_contracts,vi_marketing_edits,verify_vi_marketing}.py`; modify `AdsPatch.kt`, `verify_vi.py` and the existing VI fixture boundaries only as required.
**Interfaces:** public controls unchanged; new static `CuratedNewsResponse.morpheWithoutMarketing(List):List`, four locals; getter insertion calls it on the stored list. The dedicated marketing renderer returns before its original body.
- [x] Pin getter, renderer, home grid/empty-branch, typed model/parcel and mapping graphs from the known original; baseline must match their ABI and hashes.
- [x] Execute the original getter and cached renderer. Expected baseline retains marketing/reaches Compose; requesting suppression is RED for the actual observed behavior.
- [x] Add the typed helper, getter insertion and renderer prefix with exact guards. No input mutation; non-marketing input returns its original list. Keep native body graphs.
- [x] Build, FULL apply/report/sign/decode and verify Hide ads. Expected all repeat/identity/empty/null/read-only/reentry/cached fixtures GREEN and existing ads/article checks retained. Run Python suite and commit.

### Task 2: Integrated dev delivery
**Files:** update VI audit, research/privacy README and bilingual guides; generated catalogue/README when metadata changes; retain release branding.
**Interfaces:** consume unchanged four-control APPS/metadata and Task1's emitted verifier.
- [x] FULL combined selection and original baseline pass current contracts plus the new marketing checks. Existing article/header/redirect/privacy fixtures remain GREEN.
- [x] Describe publisher promotions and the user-reported article success accurately; pin guide evidence to the code commit. Python/Node/generated catalogue/strict bilingual docs pass.
- [x] Compare all prior app payloads and catalogue entries, allowing only the intended VI ads changes and containing DEX. Fetch main docs and rebase if needed before dev push.
- [x] One fresh whole-increment review; fix Important/Critical findings in one RED→GREEN pass. Publish the authorized dev build and verify downloaded payloads, catalogue/feed/version and CI attestation. Phone retest remains pending.
