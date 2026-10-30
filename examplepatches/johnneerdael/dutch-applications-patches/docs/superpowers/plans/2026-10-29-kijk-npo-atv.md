# KIJK and NPO Start TV Implementation Plan

> **For agentic workers:** Use superpowers:executing-plans to implement task by task in this worktree, followed by one independent whole-branch review.

**Goal:** Build exact-input Morphe ad and tracking patches for the two pulled Android TV builds.

**Architecture:** Separate `patches.kijkatv` and `patches.npostarttv` with shared original-input validation. A small ATV extension owns KIJK URL/HTML policy and callback-preserving WebView integration. NPO edits only evidenced optional inputs and typed collection boundaries.

**Tech Stack:** Kotlin Morphe patches, Java Android extension, Python unittest, Node JavaScript fixtures, APK/smali output verification.

**Spec:** `docs/superpowers/specs/2026-10-29-kijk-npo-atv-design.md`

## Global Constraints

- Exact packages, version codes, minimum SDKs and publisher hashes from the spec.
- No publisher APK/source, credentials or captures in Git.
- Preserve real playback, DRM, authentication, captions and remote controls.
- Separate build/static verification from device acceptance.

## Review Focus

- Other origins and functional Talpa/NPO endpoints must remain reachable.
- Bootstrap must run before hosted player configuration is consumed.
- Pause-ad suppression must retain actual pause/focus behavior.
- Coroutine results must complete with the caller's actual return type.
- PairIP restoration must use TV-specific data and preserve required lifecycle work.

## Task 1 KIJK controls

- [x] Write failing executable policy/bootstrap tests for exact hosts, endpoint negatives, early config, independent selection and original callback behavior.
- [x] Implement `extensions/atv` policy and WebView wrapper; add exact KIJK compatibility and ad/tracking patches.
- [x] Build the extension and patch bundle; apply each control and combined selection to the original split set.
- [x] Independently inspect emitted output, preserve unrelated methods, verify signatures and reject mismatched input.

## Task 2 NPO controls

- [x] Extend original-TV research with startup restoration, optional measurement callers and free-tier feature gates.
- [x] Write failing verification checks for concrete preroll getters, typed tracking returns and retained functional methods.
- [x] Restore NPO startup/AppAuth and real receiver behavior; user confirms production free-account playback after the optional IMA loader gate. Broader runtime acceptance remains below.
- [x] Patch individual/combined selections, independently decode and verify signatures, emitted effects and retained contracts.

## Task 3 delivery

- [x] Run the project test suite and focused output checks; record unresolved device requirements and access boundaries.
- [x] Obtain an independent whole-branch review, fix material findings with regression checks, and rebuild affected outputs.
- [x] Commit the experimental implementation on this branch and deliver bundle/KIJK candidate paths with precise coverage and limitations. NPO runtime completion remains open above.

## Task 4 NPO handover integration

Preserve the installed `startup-appauth-discovery.apk` and account/playback state. Do not install or restore anything on `.12` during the user's playback.

- [x] Add an executable ART contract harness for the actual receiver and AppAuth instruction prefixes, using synthetic dependencies on the separate `.89` box. Cover executor dispatch, action filtering, all noisy listeners, typed discovery errors and stream closure on unexpected/error-wrapping failures.
- [x] Restore both receiver variants through the existing network runnable and `BecomingNoisy` event pipeline. Integrate the real AppAuth discovery behavior into the startup compatibility dependency without diagnostic logging or receiver suppression.
- [x] Build individual/combined selections, verify every retained method and restored startup/helper contract, and obtain independent review. User authorized the same-signer receiver-restored startup update; cold launch and preserved app UID/profile data observed on `.12`.
- [ ] Complete user-coordinated functional acceptance, including cold starts, login, playback, network changes, audio route handling and background transitions.
- [x] Audit optional ad inputs, telemetry producers, queues and background paths; add seven tracking boundaries and early Sentry provider removal, with exact-output/ART tests and independent review.
- [x] Fix the Frida-confirmed token-request regression; verify three cold starts and advancing content playback with the combined update on `.12`.
- [ ] Extend long-duration playback, bounded runtime traffic, fresh sign-in and physical route/network acceptance.
