# Expanded Dutch Apps Discovery and Delivery Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Deliver reviewed patches and required acceptance for the five in-scope apps: FTM, AD, Trouw, NRC and Flitsmeister.

**Architecture:** Version-restricted app-specific Kotlin/resource patches with the existing shared input guard and independent emitted-output verifiers. Preserve the released six-app behavior.

**Tech Stack:** Morphe patcher2.0.1, Kotlin/Gradle, Android SDK36.1, apktool/smali, Python, Node and leanrea local CLI analysis.

**Spec:** `docs/superpowers/specs/2026-10-27-expanded-dutch-apps-design.md`

**Scope change, 2026-10-28:** FD and De Telegraaf were removed at the user's request. Their previous inventories and findings are historical records, not pending research, implementation or acceptance tasks. Do not resume either app unless the user explicitly requests it. Current per-app progress is recorded in the README and app-specific plans/audits.

## Global Constraints

- Inputs and exact versions are the five active rows in the spec. The ignored original `input-inventory.json` also contains the two excluded historical inputs.
- No device validation or device changes until the user returns. No emulator.
- Frequent reviewed development pushes/prereleases are authorized; stable main promotion of new apps is not yet authorized.
- One heavy JVM at a time, max1GiB; clones/reusable extraction under `$TMPDIR/re/expanded-APP/`.
- No proprietary APK/decompiled source, raw article bodies, keys, private data or credentials in Git.
- Preserve original app functionality, callback/coroutine contracts, genuine billing/auth and Android Auto host validation.

## Review Focus

- Disabled optional SDK still consumed during startup must complete safely; test every app-owned consumer.
- BFF/session/onboarding acknowledgement requests must survive even when sharing a tracking transport.
- A premium article must retain all supplied paragraphs/final content across both inline and blocking marketing paths.
- Injected calls must match actual SDK/APK owner kind, generic return and Android minimum-API availability.
- Flitsmeister tier changes must enable real settings/Android Auto while retaining GPS/warnings and genuine account/payment state.

## Task1: Original inventory and analysis workspace

**Files:** Ignored `input-inventory.json`, per-app cloned `input/`, decode logs/ready markers; no product files.
**Interfaces:** Produces package/version/code/minSDK/signer set, hash, complete split set and decoded resource/smali or shipped-JS paths for each app.

- [x] Inventory the original seven inputs with aapt2, apksigner and ZIP/magic inspection; exclude source-stamp certificates. Only the five current spec rows remain in scope.
- [x] Reuse the linked worktree on branch `feat/expanded-dutch-apps` from stable997326c; existing15 Python tests pass.
- [x] Decode each necessary APK serially and notify researchers only after successful ready marker.

## Task2: DPG discovery — Trouw and AD

**Files:** Ignored `trouw-findings.md`, `ad-findings.md` in this task workspace.
**Interfaces:** Each report supplies exact method/class/resource references, all collector consumers/callbacks, commercial markers, premium-body protocol/evidence and a patch/verifier boundary list. Reports distinguish seen/inferred/unknown and never include auth values.

- [x] Compare Trouw against released Volkskrant at exact method/resource level, not owner/version alone.
- [x] Establish AD's actual framework and independent controllers and body protocol.
- [ ] Record the5 review-focus regressions each app needs and any actual server/host prerequisite.

## Task3: Flitsmeister discovery

**Files:** Ignored `flitsmeister-findings.md`.
**Interfaces:** Produces exact ads/tracker/consent/promotion sinks and a feature-gate table including Android Auto; required callbacks, host/service/manifest and functional location data paths.

- [ ] Map Pro/ProPlus feature and promotion consumers, preserving account/purchase state.
- [ ] Inventory collectors versus functional alerts/GPS/navigation and required startup completions.
- [ ] Trace Android Auto entry, tier gate and genuine host acceptance requirements.

## Task4: FTM and NRC discovery

**Files:** Ignored `{ftm,nrc}-findings.md`.
**Interfaces:** Same concrete report schema as Task2.

- [x] Trace FTM independently from its actual shipped artifacts; see `docs/FTM_TRACKING_AUDIT.md` and its app-specific plans.
- [x] Trace NRC's Twipe reader and received body/cache/content restrictions; see `docs/NRC_PATCH_AUDIT.md` and its app-specific plan.

## Task5: Per-app implementation and prerelease increments

**Files:** Per-app implementation plans under `docs/superpowers/plans/`; app Kotlin package, `tests/verify_APP.py`, app audit; centrally owned validator/catalog/README updates.
**Interfaces:** Consumes a completed concrete report; produces the five named patch behaviors and `verify(root, selected)`/`-e` interface, exact preflight compatibility and typed emitted checks.

- [ ] Write each implementation plan only when exact patch signatures, values and test boundaries are known; do not use unresolved placeholders as an implementation spec.
- [ ] For each app: RED original/failed output -> minimal implementation -> actual single/all selection validation -> independent review -> commit -> frequent dev push/prerelease.
- [ ] Update generated catalogs through the generator; label prerelease static checks and deferred phone tests accurately.
- [ ] Keep unavailable body/Pro/host requirements for in-scope apps open and continue independent apps rather than claiming a partial app satisfies the complete goal. Excluded historical apps do not block acceptance.

## Task6: Deferred acceptance

- [ ] After user returns, obtain any concrete replacement/data-loss permission needed and run phone/Android Auto validation.
- [ ] Address observed defects with actual regressions and same-key updates; keep original six apps intact.
- [ ] Promote new apps to main only after later user approval. Never mark the full goal achieved from static checks alone.
