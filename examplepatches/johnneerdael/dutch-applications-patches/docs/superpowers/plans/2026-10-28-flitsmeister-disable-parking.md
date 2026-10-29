# Disable Flitsmeister Parking Implementation Plan

**Goal:** Remove the Parking menu option and prevent the customer refresh that crashes during native library initialization after activation.

**Architecture:** Add a separately selectable `Disable Parking` patch for the existing exact 14.17 target. Hide only the Parking menu renderer and return a Kotlin Result failure at the two customer-fetch entry points, before network, encryption or storage work. Preserve app data and the existing startup and Pro changes.

**Tech Stack:** Kotlin Morphe bytecode patches, independently decoded APK contracts, Python, ADB.

**Spec:** User's explicit request in this session to remove Parking rather than repair its third-party integration.

## Constraints and review focus

- Work in the existing dirty `fix/flitsmeister-pairip` worktree; preserve all pre-existing edits. The user subsequently authorized integration and a published dev release.
- No account clearing, plaintext encryption substitute, fabricated customer/account state, native-library replacement or backend activation.
- Test existing authenticated account state after the user's Parking activation attempt.
- Verify failure uses the app's real Kotlin Result representation, including immediate suspend-function completion.
- Check the neighboring menu entries and all existing Pro contracts.
- Record that the existing startup verifier pins predate the current VMRunner/license changes and fail independently of this change.

## Task 1: Add the control and prove its emitted behavior

- [ ] Add an independent decoded-artifact regression check for the missing Parking renderer and both unavailable customer-fetch results; run it against the current combined artifact and observe failure.
- [ ] Implement `ParkingPatch.kt` with original-input/layout/anchor guards and explicit startup dependency; register the control in the validation matrix.
- [ ] Build and apply all four controls with FULL bytecode compilation; verify signing and emitted Parking and existing Pro contracts.
- [ ] Install as a same-signature update and verify repeated launches with the existing account and no Parking menu entry.
- [ ] Finish Current speed/menu acceptance; record the separate zero-duration Devices carousel bug and unchanged source evidence.
- [ ] Review the diff and report findings without merging.

## Validation ledger

The initial phone APK contained startup fixes only: all 395 Pro contracts matched the original and the helper was absent. A fresh three-control APK built and installed successfully and removed the visible Pro badges. Devices cycles rapidly with animator duration scale 0.0; its activity, composables and animation coroutine are identical in publisher original, startup-only and combined artifacts. Parking activation triggers SIGSEGV in libwizUl.so at native constructor offset 0xc77b4, called from NatWizUtil initialization during customer encryption; subsequent launches repeat the fetch and crash. All 20 existing Python tests pass. The Pro artifact verifier passes all 395 contracts when startup classes and manifest are explicitly compared with the installed startup-only baseline; the repository's old startup pins fail for VMRunner, LicenseActivity and LicenseClient.


## Release authorization update

On 2026-10-28 the user reconnected USB, then explicitly requested that Parking and Carwash Settings entries also be removed and that the functional current work be committed and pushed as a dev release immediately. Device testing must use the published dev build and must not delay publication. Stable main is outside this authorization.
