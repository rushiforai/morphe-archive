# NRC newspaper navigation implementation plan

> **For agentic workers:** Use superpowers:executing-plans for the owned NRC implementation; parent owns integration/review/builds.

**Goal:** Hide unavailable newspaper navigation without changing entitlement or breaking four remaining tabs.
**Architecture:** Filter matching shipped menu/root factories; normalize retired destinations; version only controller saved navigation state.
**Tech stack:** Kotlin bytecode patches; Python independent emitted-smali execution.
**Spec:** `docs/superpowers/specs/2026-10-28-nrc-newspaper-navigation-design.md`.

## Constraints and review focus

NRC 5.12.24/626, minSdk23, original signer/input guards; original five names unchanged; new default-enabled `Hide newspaper tab` only depends on originalInput. No device/JVM actions by this worker, no fabricated grants. Preserve non-reader deep links and restored four-tab stacks. Check original callback indices, typed scratch registers, old restored reader fragments, unchanged account/media/transport and API23 invoke kinds.

- [x] Add `tests/nrc_navigation.py` executing actual P0/root, BottomTabBarView.i/menu, navigateToTab and initialization boundary. Pin original lifecycle/controller/route/click bodies; demonstrate original returns five tabs (RED).
- [x] Add `patches/nrc/NewspaperTabPatch.kt`: ordered exact removal of reader from both factories; READER-to-NEWS before original navigateToTab; NEWS initial enum; original initialize through a versioned Bundle wrapper; original save through schema marker helper. Enforce exact target/cardinality and retain original instructions.
- [x] Integrate independent verifier with sixth selection while keeping web dependency detection restricted to original five. Check all factory identities/order, all remaining click indices, retired destinations, legacy reader/podcast state reset versus marked four-tab state restore, original lifecycle/deep links and Java/Android method kinds.
- [x] Root builds and verifies original + six singles + all, including existing font/403/source/private premium and 320 retained methods. Record evidence, update audit/research, leave device validation pending.

Initial original factory RED: `[NEWS, READER, PODCASTS, PUZZLES, MORE_MENU]`. Original baseline verifier passed. First actual tab-only FULL/sign/redecode passed; independent verifier exposed a test VM null representation issue, corrected by treating empty object references as nonnull and typed zero Bundle as null. Added an actual empty-Bundle case. Final tab-only emitted verifier GREEN at `build/validation/nrc/decoded-hide-newspaper-tab-6qnpyi9q`; no production change was needed for that verifier issue. Parent matrix pending.
