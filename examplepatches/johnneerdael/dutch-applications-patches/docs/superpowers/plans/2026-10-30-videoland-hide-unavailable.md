# Videoland Hide Unavailable Content Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** Hide subscription-unavailable catalogue entries while preserving current-account source data, pagination, structural information and available playback.

**Architecture:** A dedicated Videoland runtime extension supplies a conservative target predicate, copied presentation models and a filtering PagingSource. Legacy native PagedLists are rebuilt around their original raw-key source; newer item sources use the same wrapper. Contextual presentation wrappers select catalogue templates, and exhaustion-aware observers collapse empty legacy rows. Wire models and cached originals remain unchanged.

**Tech Stack:** Kotlin Morphe patcher 2.0.1, Android Java extension, compile-only declarations of the inspected app ABI, Python independent verifier, actual-Dex ART fixtures, Android TV acceptance.

**Spec:** `docs/superpowers/specs/2026-10-30-videoland-hide-unavailable-design.md` (approved).

## Global Constraints

- Independent `Hide unavailable content` patch, initially default-off; only direct functional dependency is originalInput.
- Inspected publisher APKS: nl.rtl.videoland.v2 1.117.0 / code1622 / minSDK24 / existing publisher signer.
- Preserve source collections, cached Block/Item/Action/Target objects and native raw page keys. No per-card API requests or account/product/DRM changes.
- Subscription lock on the primary activation chain is the positive signal. Keep unknown/malformed availability and non-subscription-only restrictions.
- Filter collection templates R/S/T/U/V/X; preserve Solo, SideGlass, Spotlight, guide schedules, player/structural/unknown templates.
- Never execute compiled ABI stubs in the APK. Verify extension DEX contains only owned runtime classes.
- No online research or dependency migration. Use the isolated worktree and cached build inputs.

## Review Focus

- Cached payload reuse/account changes: filtering copies lists/models and retains original item identity, so an unlocked payload restores all items.
- Entirely filtered initial/intermediate pages: async bootstrap and directional raw-key coalescing must reach later data without blocking UI or synthesizing exhaustion.
- Cancellation/errors/invalidation: forward caller context and native error/invalid results; link source invalidation in both directions; complete once.
- Empty-row timing/focus: pending visible delivery must not transiently collapse a row; exhausted zero-data rows must notify and relinquish focus.
- Structural/unknown content and secondary upsells: keep information and unrelated lock types; do not filter by secondary actions or icon appearance.

## Files and interfaces

- Create `extensions/videoland/` Android extension with `build.gradle.kts`, manifest, Java runtime under `src/main/java/patches/videoland/`, and compile-only API declarations under `stubs/`.
- Runtime interfaces: `Availability.keep(Object):boolean`, `filter(List):List`, `visibleBlock(Block):Block`, `visibleIndex(Block,int):int`, `visiblePager(Block,A1):A1`, `wrapSource(W1):W1`, `rowCount(Qk.t):int`.
- `FilteredSource extends w4.W1` delegates to the native source; its bv.c operation forwards caller context and coalesces empty raw pages using native Append/Prepend parameters.
- Create `UnavailableContentPatch.kt`, `UnavailableContentContracts.kt` and a generic host-only method-contract utility if needed; retain old subscription contract accessors for regression compatibility.
- Create `tests/VideolandAvailabilityProbe.java`, `tests/run_videoland_availability.py`, `tests/videoland_unavailable_contracts.json`, focused verifier regressions; extend the existing independent Videoland verifier with an explicit unavailable selection and strict owned-helper inventory.
- Document acceptance at `docs/research/2026-10-30-videoland-hide-unavailable.md`.

### Task 1: Conservative predicate and copied catalogue models

**Interfaces:** Produces Availability.keep/filter/visibleBlock/visibleIndex and a clean extension resource `extensions/videoland.mpe` consumed by subsequent tasks.

- [x] Write actual-APK ART fixtures for ordinary/null/unknown items, primary and secondary actions, direct/nested subscription locks, other locks, malformed/cyclic chains, stable order/identity, unchanged input lists, and the collection whitelist.
- [x] Run against the original APK; expect a clear failing assertion that the owned availability helper is missing.
- [x] Add the Android extension and compile-only stubs; keep stub outputs out of runtime DEX. Implement fixed-budget identity-based chain traversal with conservative exception handling. Return the original list/model when unchanged; otherwise create shallow visible copies.
- [x] Declare the default-off patch with originalInput and extendWith; no user APK installation until paging and UI integration pass.
- [x] Build offline with `python3 scripts/build_videoland.py`; apply explicitly to fresh original input; run the predicate/model ART cases. Expect preserved originals and only subscription-positive primary entries removed.
- [x] Commit the tested component.

### Task 2: Filtered paging with raw-key preservation

**Interfaces:** Consumes filter(List); produces FilteredSource and visiblePager/wrapSource. Source load signature is `d(W1$a,bv.c):Object`; pages have N=data/O=prev/P=next. Preserve native errors/invalid results and caller cancellation.

- [x] Add failing actual-Dex fixtures for raw keys vs visible lengths, all-filtered seed, all-filtered intermediate append/prepend, asynchronous completion, exhausted end, repeated keys, invalidation, cancellation and backend errors.
- [x] Implement owned W1 wrapper plus operation continuation. Follow the requested direction until visible data or real exhaustion; preserve spanning keys; reject non-progressing keys through a normal error result. Legacy refresh restarts from the source beginning rather than using visible positions as raw offsets.
- [x] Rebuild legacy visible H using its raw source (`k()`), initial `Q.N[0]`, copied raw config (placeholders off/counts unknown), and original dispatchers. Keep raw page size and metadata. Bootstrap an empty pending seed through native `H.s(0)`; do not perform remote initial work synchronously.
- [x] Native newer Le8/a sources use the same wrapper. Retain input/cache models and source invalidation ownership.
- [x] Execute the fixture suite on ART with actual native paging classes. Expect later visible items reached exactly once with raw keys unchanged and one correct completion.
- [x] Commit the tested component.

### Task 3: Presentation integration and exhausted-row collapse

**Interfaces:** Consumes predicate/models/paging; exposes the complete independent patch.

- [x] Record measured declarations, field ABI, flags/register/instruction counts and full operand/control-flow digests for every hook and required native ABI. Reject unsupported/ambiguous contracts before original-method mutation.
- [x] Add failing emitted-output assertions for d8/a and f8/a constructors, j8/Q's context-aware item factory, and Qk/t.c. Add row/selection fixtures for empty, pending, delivered, exhausted and replaced sources.
- [x] In legacy d8/a construction, replace only presentation pager/block/index with visible counterparts. In f8/a construction copy only the selected presentation block/index; wrap the item-source factory in j8/Q while its Block context is available (leave V/s and layout-block paging intact).
- [x] Use collection whitelist projection so slideshow direct-Q rendering receives filtered copies while Solo/player/EPG originals are preserved.
- [x] Hook Qk/t.c to an owned exhaustion-aware row count. Register weak UI observers idempotently and post notifications on the UI dispatcher. Native Grid/Belly empty handling remains in use. Keep pending/delivering rows; collapse genuinely exhausted empty ones.
- [x] Extend independent verification to permit exactly the owned insertions/helper classes, preserving every original unselected method graph and manifest ownership. Mutate a branch, an unowned method and a helper effect in regressions; expect rejection.
- [x] Run original/selection isolation and full ART coverage; expect exact owned effects and no stub classes.
- [x] Commit integration.

### Task 4: TV acceptance, composition and delivery

**Interfaces:** Consumes the complete independent bundle; produces candidate, hashes, device evidence and final documentation.

- [x] Build/apply from fresh original APKS with FULL mode and compatible signer. Independently decode/verify. Keep original input untouched.
- [x] On the current free account confirm Bureau Groningen retains series information/available episode3 and removes subscription-locked episode1/2 cards; test home, search, remote focus/Back and available playback.
- [x] Exercise wholly filtered collections and later-page loading with real native ART fixtures; validate native UI notifications and account-payload reload. Check an unlocked account-shaped fixture keeps all items; do not require another login round unless live evidence leaves a material question.
- [x] Verify filter-only and filter+existing ads/tracking selections independently; the old experimental routing patch remains independent/default-off.
- [x] Run repository Python tests, JVM input/contract checks, new actual-Dex ART suite and relevant app-page/docs checks. Re-run only when a change/failure warrants it.
- [x] Fresh-context whole-branch review; fix important findings with reproducing tests. Record limitations and decisions.
- [x] Deliver clean MPP/source/hash/verification report. Retain a compatible rollback APK, remove any development logging, and leave the agreed feature candidate installed only after acceptance. No release/version bump or publication is implicit.

## Execution notes

- Newer source wrapping uses j8/Q, where Block context is available; V/s remains original.
- Fresh review required five Compose cleanup guards and a Cover recycled-action reset; native fixtures reproduce both gaps before the fixes.
- The user confirmed live catalogue filtering works and requested subscription-button removal; the follow-up returns the native absent presentation action for a subscription-positive target.
- Final checks:81 ART assertions,71 JVM contracts,281 Python tests (17 conditional skips),8 artifact regressions,58 app pages, and independent preservation of140770 original methods/declarations for both selections.
- Full MkDocs site output check could not run because local i18n plugin is missing; no network dependency installation was attempted.
- Branch/worktree retained for delivery. No merge, remote push, release/version bump or publication is part of this task.
