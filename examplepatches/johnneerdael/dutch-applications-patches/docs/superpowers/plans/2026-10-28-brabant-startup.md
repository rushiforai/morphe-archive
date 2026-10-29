# Omroep Brabant startup follow-up Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans inline.

**Goal:** Stop automatic notification permission requests and remove cookie settings UI before display.
**Architecture:** Existing default-on Skip consent screens owns three exact bytecode edits and a layout visibility resource edit; original bodies and functional notification settings remain.
**Tech Stack:** Kotlin/dexlib, Python original/emitted canonical contracts and native instruction fixtures, Morphe FULL APK validation.
**Spec:** docs/superpowers/specs/2026-10-28-brabant-startup-design.md

## Global Constraints
- Package nl.omroepbrabant.android11.1.0/code7331764/minSdk32; original signer5b364bd01320e86c272a126b37b62be15753363565d930706c721d4909416a03.
- No consent/permission acceptance, state forgery, push-service removal or post-display dismissal.
- Existing SSD worktree, one local JVM, no phone install/reset; all other approved app payloads unchanged.
- Retain generated view-binding node so the menu inflation contract remains valid; remove it from layout flow before first frame.

## Review Focus
- Fresh and retained API33+ startup never schedules the notification coroutine, while earlier SDK startup is preserved.
- Manual notification entry still opens real OS settings with correct package; existing push state/delivery remains.
- Cookie dialog host returns before any Compose/effect/flow collection/Modal construction, with no persisted consent change.
- Cookie row is absent from visible layout and its original click cannot set modal-visible state; generated bindings stay valid.
- Independent controls and all other app payloads are preserved, including RTL expert default-off.

### Task 1: Startup/menu/dialog suppression
**Files:** brabant/ConsentTargets.kt, ConsentScreensPatch.kt, new ConsentResources.kt; tests/brabant_startup_contracts.py, verify_brabant_startup.py and verifier/resource integration; app README/audit/bilingual guides/catalogue.
**Interfaces:** Existing OwnedMethod/OwnedEdit and applyOwnedEdits, canonical whole-graph restoration, TrackingFixture.
- [x] Pin original uj5.onCreate302 instructions (SDK guard264→273), La76.onClick197 instructions (cookie case8 at56, manual notification case7 at73), ut.u shared dialog host and retained binder/caller/push paths.
- [x] Add actual instruction fixtures and resource invariants; run previous-build RED. Expected failure: startup schedules case20 notification coroutine, cookie callback changes visibility, host enters Compose, cookie row visible.
- [x] Replace startup264 with goto273; prepend truthful return to cookie case56 retaining its invoke behind it; prefix ut.u return-void. Set only privacy_policy layout visibility=gone before inflation. Expected GREEN, no permission/consent writes.
- [x] Verify all original graphs restored outside owned edits; original and independent/combined FULL/rebuild/report/signature/decode checks. Reuse prior modes only with exact patch class identity proof. Run Python, Node and strict bilingual docs. Expected PASS.
- [x] Update app scope/warnings/catalogue, commit, task-done with green verifier/suite.

### Delivery gate
- [x] One fresh whole-increment review; one RED→GREEN fix pass for Important/Critical if needed.
- [x] Authorized dev publication with downloaded payload/catalogue/feed/version/attestation proof; leave phone acceptance pending.
