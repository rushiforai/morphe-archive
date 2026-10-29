# NU.nl optional onboarding implementation plan

> **For agentic workers:** Use superpowers:executing-plans for the owned NU implementation; parent owns integration/build/release.

**Goal:** Automatically pass notification/account offers while keeping topics interactive.
**Architecture:** Preserve actual show acknowledgements and shown count, then dispatch original modal dismiss with an exact captured/current-ID check plus source-bound native queue-head/once guard.
**Tech stack:** Kotlin DEX patches and independent Python smali execution.
**Spec:** `docs/superpowers/specs/2026-10-28-nunl-optional-onboarding-design.md`.

## Constraints and review focus

Same four public names/dependencies and NU26.9.0/210156/min32/APKS/signer preflight. No new OS permission, account, subscription, consent or topic writes. Preserve manual positive settings, genuine sessions/deep links and NU+ missing-content limitation. Review suspension/failure, incoming resume labels, stale/duplicate show completion, restored remaining lists, current topic and unknown screens.

- [x] Write `tests/nunl_onboarding.py`: actual original ShowScreenUseCase coroutine + modal processDismissIntent/goToNextScreen/save-state executor; pin all preserved routes and API/call kinds. Observe original fresh notification/account flow RED.
- [x] Implement locally singleton-matched helpers in `patches/nunl/OnboardingPatch.kt`, attached to existing consent execute. Capture actual screen ID; tag actual optional button and auto action; guard exact two IDs/current presenter, then queue-head/once at native dispatch; dispatch original DismissScreen after all original show work on both successful completion branches. Preserve every original instruction and branch target; use no borrowed live registers.
- [x] Extend `verify_nunl.py` to check original remainders, actual emitted calls, fresh/restored/missing/unknown/topic/manual and duplicate/stale/suspended completion scenarios. Keep all existing functional onboarding acknowledgement regressions.
- [x] Parent compiles and runs NU original/consent/all FULL/sign/redecode plus central tests. Update audit with emitted evidence; retain device validation as pending. Do not commit/publish separately from requested TV+NU dev release.

Evidence: actual original show/ack/native modal baseline PASS; original fresh flow RED (optional pages remain); original native queued double dismiss RED (LOGIN then TOPIC closed). Review exposed the latter stale event issue; final source binds optional manual and automatic actions and validates actual native queue head/once claim. First emitted consent-only patch/FULL/sign/redecode passed. Independent required-source verification GREEN at `build/validation/nunl/decoded-skip-consent-screens-vo4a07qj`, with23 generated helpers/212 actual references/0 invalid. Initial semantic verification exposed test-only late-bound deferred IO fixture arguments and inherited Kotlin static-owner resolution, both corrected without production changes. All awaits, delayed event orders, final close, original topic native callback and actual monitor catchall pass. Whole Python suite40/40. Parent all-controls validation passed; device validation remains pending.

User acceptance: all changes from v1.7.0-dev.1 were approved for stable publication on 2026-10-28. Earlier pending-runtime notes describe pre-acceptance test evidence, without claiming exhaustive independent device/network coverage.
