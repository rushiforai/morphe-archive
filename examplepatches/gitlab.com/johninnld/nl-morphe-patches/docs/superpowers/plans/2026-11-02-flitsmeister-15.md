# Flitsmeister 15.0 full port implementation plan

> **For agentic workers:** Use the subagent-driven-development skill for independent port cohorts and review the whole branch before completion. Track evidence in `.analysis/flitsmeister-15/` and this checklist.

**Goal:** Port every existing Flitsmeister control to 15.0/1289 for publisher API29 and API32 packages, preserving 14.17 support.

**Delivery update (2026-11-03):** The user requested physical-phone testing and subsequently authorized a stable release on main. The final integration is on `release/flitsmeister-15-codeberg`, based on the migrated Codeberg main after1.35.1, and includes its ninth control, Support Gearslip and DriveDeck. The original development worktrees and unrelated primary-checkout changes are preserved. Current evidence and runtime boundaries are recorded in `docs/research/2026-11-03-flitsmeister-15-validation.md`. Codeberg authentication succeeds as JohninNL; delivery uses its Forgejo workflows and existing signing identity.

**Architecture:** Keep the existing exact 14.17 bindings. Introduce separately guarded version15 startup/operation/extension profiles derived from the publisher artifacts, recovered runtime bodies and independent contract oracles. Never weaken a guard to make a changed method pass.

**Tech Stack:** Kotlin Morphe patches, Java Android extension, Python independent APK validators, APKTool/JADX, rooted API36 arm64 emulator, Frida as needed.

**Spec:** `docs/research/2026-11-02-flitsmeister-15-compatibility.md` and the user instruction to port all features, with emulator/Frida explicitly authorized.

## Global constraints

- All eight controls: Fix PairIP startup, Unlock Pro, Hide Pro notices, Broadcast navigation data, Disable partner services, Hide ads, Disable tracking, Guest mode.
- Preserve both existing14.17 and new15.0; publisher signature and package/version/SDK checks stay mandatory.
- Restore actual protected functional behavior before disabling PairIP dispatch. No null-return substitute for essential methods.
- Preserve unrelated primary-worktree changes. Development and main integration use isolated worktrees.
- Only johninnl Git author/committer; no release/version bumps. Stable promotion requires user confirmation after concrete validation.
- Static success does not prove runtime, Android Auto host admission or backend service outcomes.

## Review focus

- Existing obfuscated names may resolve to unrelated15 classes: verify semantics, references, cardinalities, registers and branches.
- MainActivity/background methods moved into the VM: recover full behavior and exceptions.
- Multi-control interaction changes instruction positions: validate individual and combined selections.
- Navigation reflection can silently fail: test live emitted data and corresponding speed/alert/zone values.
- SDK29/32 manifests/resources differ despite common DEX: validate both complete split inputs.

## Tasks and ledger

- [x] Validate baseline Python suite, original signatures and isolated source state; prepare the initial emulator.
- [x] Recover version15 startup, 20 functional protected bodies, captured strings and exact ARM64 native requirements; verify emitted callbacks independently.
- [x] Port feature settings/UI/Android Auto/Pro notices with independent contract oracles.
- [x] Port ads/partner/tracking/telemetry/guest cohorts and independent fixtures.
- [x] Port navigation hooks, extension bindings and validators; integrate current-main managed audio and host support.
- [x] Integrate strict version dispatch and compatibility metadata.
- [x] Build and run release Gradle checks, Python suite and release automation regressions.
- [x] Finish nine individual + combined selections on both15 publisher split sets and retained14.17. All three final immutable-bundle matrices passed.
- [x] Complete bounded phone acceptance: startup/map, HUD, icon change/reopen, local PRO badge and soundpack offer removal. Report unverified background IPC, physical Android Auto host and backend behavior separately.
- [x] Complete independent reviews and fix the emitted audio-focus continuation regression.
- [ ] Finish final evidence audit, commit under the required identity and publish the user-authorized stable release on Codeberg.

## Current evidence

Assessment census:245 plans;220 demonstrable mismatches;25 unproven candidates. All eight controls depend on startup. Base DEX/assets are identical across both15 inputs; SDK29/32 packaging differs.12 old callback bodies are now direct; one old obfuscated descriptor is absent.22 current incoming VMRunner methods include essential startup/activity/service bodies.

Ruling: Worktree creation and emulator installation/instrumentation proceed under the user's explicit full-port/emulator authorization; no repeated permission checkpoint. No shared-branch promotion or release is included before validation.
