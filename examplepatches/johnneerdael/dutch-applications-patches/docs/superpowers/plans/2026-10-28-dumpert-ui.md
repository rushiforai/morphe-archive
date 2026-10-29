# Dumpert Account Presentation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** Remove Dumpert subscription banners and show the local ad-free account presentation.

**Architecture:** Extend Hide ads with a shared pre-Compose promotion stop and three free-card display edits plus the signed-in subtitle. Keep actual premium branches, product metadata and business state original.

**Tech Stack:** Kotlin Morphe bytecode patches; independent original APK/DEX/smali Python verification; existing semantic-release dev workflow.

**Spec:** `docs/superpowers/specs/2026-10-28-dumpert-ui-design.md`

## Global Constraints

- Dumpert 5.8.0 / 22001778 / minSdk32, original signed APKS only.
- Preserve actual paid state, login/JWT, billing/ack/restore and consent outcomes.
- Existing three controls and dependency graph; no new control or fabricated product.
- SSD storage and temp; one capped root JVM at a time; no phone install/reset.
- Publish dev only, preserve current approved apps and stashed RTL work.

## Review Focus

- Signed-out and signed-in free accounts must lose both promotions and Free/ads copy.
- A real subscriber must retain native product metadata and management actions.
- Missing billing metadata must retain native loading behavior, without a null dereference.
- Compose restart/default/register layouts and group balance must remain intact.
- No global state/provider mutation or unrelated catalog/payload change may enter release.

### Task 1: UI edit, independent verification and dev delivery

**Files:** Create `patches/src/main/kotlin/patches/dumpert/AccountPresentation.kt`; extend `AdsPatch.kt`, `tests/dumpert_contracts.py`, `tests/verify_dumpert.py`; create focused UI verifier/test; update README and audit.

**Interfaces:** Existing Hide ads calls a UI-only helper in patch context; all three selected controls inherit it. UI verifier restores only the owned edits before checking independent original hashes.

- [x] Pin original banner, free/paid account composables and genuine providers/callbacks from shipped DEX; write original-negative and corruption fixtures before production edits.
- [x] Observe selected UI checks fail on the last published bundle, with original/unselected and retained contract checks passing.
- [x] Implement the shared banner STOP, two localized resource replacements, blank Free label, and signed-in subtitle replacement with exact opcode/register/field/count guards.
- [x] Run unit suite, capped offline Android build, FULL/report/signature/decoded matrix for all four selections. Verify real paid/loading/register/restart branches by original graph hashes and UI instruction flow.
- [x] Update README/audit with UI-only semantics and partial device acceptance; confirm no RTL payload and unchanged non-Dumpert catalog/compiled payloads.
- [x] Fresh whole-increment review; one material-fix pass with RED→GREEN if needed. Publish authorized dev follow-up and verify terminal workflow, feed and exact published code payloads. Commit delivery evidence; restore RTL branch/stash and continue its active plan.

Expected: original passes; old selected outputs fail specifically for missing UI changes; new four selections and all tests pass; published asset matches tested code; main unchanged.
