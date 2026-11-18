# AliExpress Clean Feed Implementation Plan

> **For agentic workers:** Use superpowers:executing-plans inline; repository batching rules take precedence over frequent test/build switching.

**Goal:** Remove identifiable paid placements, inline campaigns and game incentives while retaining usable shopping.
**Architecture:** Filter converted FastJSON arrays and filter known Ultron/Galaxy displayed components after native parsing. Keep feature installation and settings gates explicit.
**Tech Stack:** Kotlin Morphe bytecode patches; Java extension; existing Gradle/JUnit verification.
**Spec:** `docs/research/2026-11-07-aliexpress-clean-feed.md`

## Global constraints

- Only supported stock AliExpress inputs; no physical phone access.
- Preserve pending primary checkout work and validation-tooling freeze.
- No claim of unbiased server ranking; no promotion/publication without confirmation.
- Complete connected implementation before one grouped checkpoint and bounded runtime session.

## Review focus

- JSON arrays converted from strings/maps must be filtered after conversion.
- Organic entries retain identity, order, prices and pagination metadata.
- Both protocol structure formats lose only identified promotional references.
- Mixed account service/game rows retain shopping functions.
- Disabled/uninstalled controls preserve stock behaviour.

## Batch 1

- [x] Add `ContentFilter.java` and behavioural unit tests for explicit P4P markers, unknown shapes, wrapped products, mixed account rows, Ultron/Galaxy hierarchy pruning and idempotence.
- [x] Hook every `JSONObject.getJSONArray` return using the existing control-flow-label insertion helper. Delegate installation/settings gates through `SponsoredProducts`.
- [x] Add `Remove promotions and games` with normalized-floor, menu-visibility and native coin/pig render hooks. Add installed-patch metadata, settings switch and bilingual app documentation.
- [ ] Trace and handle the Fast & Free campaign destination before claiming surface completeness.
- [ ] Run complete `scripts/local-release/verify.cjs`, exact-APK patching and static patched-output inspection at the checkpoint.
- [ ] Execute one prepared runtime session with existing observer coverage; record gaps/failures and stop before offline diagnosis.
- [ ] Archive compact evidence and clean owned job outputs/worktree, preserving source changes in a reviewable artifact/branch.

## Current checkpoint

The full verification command set is accounted for across retained logs: the initial native cleanup regression failed twice, passed after fresh quiescence proof, and affected upstream mirror checks passed separately. Android/extension tests and bilingual generated-document checks passed, including affected repeats after the target restriction and registration guard. Both exact-input patch runs applied all ten patches and signed successfully. Runtime acceptance remains failed as documented in the research report. Do not mark the objective complete or publish this candidate.

Next action requires named approval for one private read-only inspection script and its compiled bundle; the existing observer remains unchanged. No further product guess or repeat UI acceptance is authorized by a tooling failure alone.
