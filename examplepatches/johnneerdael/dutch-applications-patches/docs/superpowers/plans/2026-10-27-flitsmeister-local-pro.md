# Flitsmeister Local Pro Controls Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement separately selectable local Pro-feature eligibility and Pro-notice suppression, including the traced Android Auto gates, for later phone acceptance.

**Architecture:** App-specific version-restricted Morphe patches change only the classified local eligibility scalars, rendering operations and fixed resource nodes. Keep genuine membership providers, purchases, account/server/hardware state, preferences, permissions and Android Auto host validation unchanged. One guarded anonymous dependency owns overlapping Android Auto notice operations.

**Tech Stack:** Kotlin/Morphe2.0.1, smali, XML resources, Python emitted-code tests, Desktop FULL apply/sign/redecode.

**Spec:** `docs/superpowers/specs/2026-10-27-expanded-dutch-apps-design.md`

## Global Constraints

- Target `nl.flitsmeister` 14.17 / 1287, minSDK32, APKS, publisher SHA256 `ba4fdde5ed7d1082f6ba1af87df2ca39c81b094af20d36ff55b583aa3e3353e6`.
- No device, ADB, emulator or Android Auto execution until the user returns. Development publication authorized; full acceptance/stable promotion deferred.
- Every mutating dependency directly depends on app-specific shared.originalInput. Eager exact fingerprints reject missing/ambiguous methods; each instruction/resource operation asserts fixed cardinality and actual register layout.
- One heavy JVM at a time, max1GiB, controller lease required. Controller owns shared runner/preflight/catalog/README/publication.
- No APK/decompiled code, private data, keys, credentials or screenshot profile fields in Git. Analysis clone/complete decode is `$TMPDIR/re/expanded-flitsmeister/{input,decoded}`.
- Do not write genuine tier, receipt, trial, discount, activation, physical-hardware or server-success values. No generic Intent blockade or null SDK replacement.
- This increment implements two local controls. Ads/tracking/consent and server-dependent Pro outcomes remain explicit full-goal requirements for subsequent work; do not label the complete app accepted.

## Concrete contract input

Ignored `.superpowers/sdd/2026-10-27-expanded-dutch-apps/flitsmeister-findings.md` is the independently collected, exact version-specific input. Its top Implementation entry links the final closed tables. Later tables supersede earlier exploratory notes. Consume these fixed decisions rather than devising new global-tier shortcuts:

- `Pro feature settings`:48 guarded synchronous saved-setting methods, six Flow combiners, one already-ungated `gm8.m(Context)Z` retained.
- `Implementation decision table — all64 non-gm8 sle.b consumer methods`: exact FEATURE/PROMOTION/ADS-SEPARATE/RETAIN operation and test for every method.
- `Implementation decision table — all46 rle.b consumer methods`:25 final endDefaults scalar overrides, five immediate/join scalars, ten callsite-scoped State replacements, six unchanged methods. Corrected eih/dg8-default role is SettingsHomeUIState; dg8's other switch case is history onboarding.
- `fmcore genuine-tier bridge consumers`:17 methods in15 files,16 local scalar operations and one unused tier read retained.
- `ProPlus/menu feature gates beyond sle.b`:four local routes; real trial/activation/parking/tolling/Dash states retained.
- `Standalone Hide Pro notices` ten exact rendering/lifecycle operations plus `Notice-only Android Auto rendering closure`.

Each table provides full descriptors, exact registers/anchors/branches, retained behavior and original-failing verifier names. Verify source cardinality before applying them; line numbers are evidence locations, never mutation anchors.

## Review Focus

- Saved false preferences and chosen enums stay false/chosen after eligibility changes; do not turn every warning/option on. Test all six Flow preference/tier combinations.
- Compose default and explicit-false/recomposition paths converge on final eligibility overrides; lazy State reads receive a nonnull immutable feature-local true State. Global tier flows and purchase UI remain original.
- Shared R8 methods keep unrelated discriminator branches, callbacks, suspension and error values. Constructor field initialization, UI content callbacks and Compose group balance remain intact.
- Android Auto notice-only selection retains denied-map/account/readiness/version states; Unlock changes only the tier operand. Both controls apply overlapping edits once and retain navigation category, minCarApiLevel5 and the original six allowed hosts.
- Subscription updates retain real dates/receipts/hardware/account state; avatar photos/Start/Dash badges, settings controls, GPS/report data, permission failures and genuine server activation outcomes remain functional.

## Task 1: Two standalone controls and emitted verifier

**Files:** Create `patches/src/main/kotlin/patches/flitsmeister/{Compatibility,FeatureSettingsPatch,FeatureUiPatch,AndroidAutoPatch,PremiumPatch,FeatureEligibility}.kt`, `tests/verify_flitsmeister.py`, a focused test-only contract-data module if needed, and `docs/FLITSMEISTER_PATCH_AUDIT.md`.

**Interfaces:** Public named `Unlock Pro` and `Hide Pro notices`, compatible only with the exact target above. Python `verify(root: Path, selected: set[str]) -> None`, CLI decoded-root and repeated `-e`. App compatibility has internal `originalInput`/getOriginalInput and eager context-aware `exact` helper for actual-SDK regression.

- [ ] Derive independent original hashes and failing behavioral assertions from the actual original artifact, before production edits. Original noflagsPASS; Unlock and Hide positive selections RED for their respective behavior. Pin unchanged genuine providers/purchase/account/host contracts and other R8 discriminator branches.
- [ ] Add exact compatibility/preflight and operation helpers that validate signatures, reference/opcode neighborhoods and expected register counts. Use legal high-register const/invoke forms after resolving parameter aliases; reject changed layouts. No generic class-wide patch by source/package name.
- [ ] Unlock gm8's48 synchronous entitlement operands while preserving the actual saved setting reads/defaults/enums. Modify six combiners am8..fm8 to return the preference operand rather than entitlement AND preference. Keep gm8.m original. No blanket true return from settings methods.
- [ ] Apply only FEATURE-role operations from the64 sle.b table; PROMOTION operations belong to notice control and ADS-SEPARATE remain for a future ad control. Retain all documented billing/account/hardware/discount/trial consumers.
- [ ] Apply the46 rle.b table:25 exact final endDefaults joins, five immediate/join scalars, ten scoped State-call replacements, six retained methods. Introduce `Lmorphe/flitsmeister/FeatureEligibility;` only if absent: implements the actual `androidx.compose.runtime.State`, getValue()Object returns Boolean.TRUE and static state(Composer)State returns a fresh immutable helper. No setter, global state write or snapshot/pref mutation. Verify actual interface/method flags and call kinds.
- [ ] Apply17 local t25.j-result scalar overrides across16 changed methods in the17-method fmcore table. Both x9i.a callsites are required: its later speed-camera report branch must still respect the saved speed-camera preference when traffic-camera reporting is enabled. Preserve the genuine z80.E/ye4.E/t25.j bridge, road/location/report spam filters and user choices; retain the unused tsk read. Prevent loss-of-tier preference resets through only the classified w91 scalars.
- [ ] Apply cnj.a's two local tier operands to reach the real TripLogging activation/main routes; preserve account, activation status and trial dates. Apply only the classified bz5/ryb/nzb menu branch operations to call existing history/Appjection/fuel route callbacks. Do not spoof real server responses or paid benefits.
- [ ] A shared anonymous Android Auto dependency owns fb2.onCreate Pro-screen push suppression and fb2.onGetTemplate Pro-action removal, referenced by both controls. Unlock additionally changes only ea2.j's Pro branch and classified stale ac2/yb2 tier blockers; retain login, readiness/version, permissions and host validation. Notice-only additionally skips only mdb.c NOT_PRO drawing in ga2.onDraw through the existing loading-cleanup join, leaving the real denied state unchanged.
- [ ] Notice control implements exactly the ten closed rendering/lifecycle operations: kie.a/b banner leafs empty; dje.b/d Pro/Plus icon leafs empty with dje.a/e/c retained; zdh banner AnimatedVisibility false while its real settings-content invocation stays; one svg NotPro promotional child invocation removed; two XML Pro-banner roots gone/zero-height with all binding IDs retained; two proLabel nodes gone/zero geometry/margins/inaccessible; two selective cvb/eb0 avatar badge paths omit only PRO/PLUS and retain nullable badge contract; expired j6b sink checks coroutine failure, clears UI-only K3 and returns real Unit; unique t0a.f onboarding-event post omitted with account/receipt mapper intact; classified decorative tier notices suppressed without changing menu content.
- [ ] Verifier checks every table row, each fixed cardinality and the entire original instruction body after normalizing only its expected mutation. Independently execute emitted gate fragments: saved preference true/false/enums, genuine tier false/true, default/explicit-false UI paths, lazy State, Android Auto account/ready/version/host combinations, notice-only denied state and shared-dependency application count. Preserve error/suspended values and actual callback arguments/ordering; do not verify only string prefixes or the same table re-used by production.
- [ ] Pin original global provider/flow/bridge/purchase/trial/discount/hardware methods and all retained table rows; verify original Android Auto manifest/resources/host list and untouched permission declarations. Resource tests retain every binding ID and unrelated geometry/content. Audit actual emitted APK+Android SDK class/interface/static call kinds and new immutable State contract.
- [ ] Run build and actual Desktop FULL apply/sign/redecode for Unlock only, Hide only and both; no --force. Exercise meaningful Node/Python/JVM harnesses as needed, with no device. Record exact RED/GREEN commands/output, self-review and commit app-owned files only after passing evidence. No shared-file edits or push.
- [ ] App audit describes each local feature group, notice scope, unchanged genuine sources and deferred server/device/Android Auto behavior. Ads/tracking/consent remain open and their discovery findings retained; local eligibility is not proof of activated backend products.

## Task 2: Shared integration, independent review and dev publication (controller)

**Files:** Shared validator/profile/routing tests, actual-SDK preflight, app metadata, README, generated catalog.

- [ ] Add exact two-control profile and app-specific verifier route; original-input negatives and actual eager helper checks for Flitsmeister. Keep all released controls intact.
- [ ] Review app plus integration independently against table coverage and five Review Focus cases. Resolve Important findings and independently confirm each-only/both semantics and helper cardinality.
- [ ] Generate current-version catalog from the built source with no stale MPPs; compare prior entries unchanged; commit and push to dev. Inspect actual CI/release/version/download digest and apply the published artifact to the original input with FULL/sign/redecode.
- [ ] Keep whole-app privacy/backend/phone requirements open; no stable main promotion or completion claim until the full user goal is proven.
