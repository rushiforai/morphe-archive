# FTM guest startup implementation plan

> **For agentic workers:** Use superpowers:executing-plans for this small extension; request independent review before publication.

**Goal:** Skip the post-edition account offer while preserving guest state, edition selection and manual login.
**Architecture:** Extend the existing consent cleanup on the original WebView page-finished callback. Use the evidenced same-origin guest skip link with history replacement and a document-local once guard.
**Tech stack:** Kotlin DEX patches, Python emitted-bytecode verification, real Chromium fixtures.
**Spec:** `docs/superpowers/specs/2026-10-28-ftm-guest-start-design.md`.

- [x] Add a browser regression to `tests/ftm_browser_fixtures.py` and wire it into `tests/verify_ftm.py`; observe RED against the previous emitted cleanup.
- [x] Extend `patches/ftm/WebContentPatch.kt` consent cleanup and its public description. Verify both editions, exact route/structure/state/link boundaries, once semantics, retained edition/manual controls and unchanged account/storage state.
- [x] Build and validate FTM original/consent/all through FULL/sign/redecode, existing private web probes and required Chromium fixtures; run central regressions and original-input guards.
- [x] Obtain independent code review and update the audit/catalog.
- [x] Publish and verify the dev artifact. Keep phone acceptance pending.

Evidence: old emitted policy RED in `build/ftm-guest-before-red.log`; original/consent/all pipeline GREEN in `build/ftm-guest-matrix.log`. Real Chromium passes 72 enabled cases plus 72 cases with consent cleanup excluded. Private publisher callback probe passes, central suite 40/40 and actual-SDK input guards 351/351. Final Android bundle contains classes.dex. Review approved without blocking findings. No device operations performed.

Published [v1.7.0-dev.2](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.7.0-dev.2), source 6402e4c / release ce5a66b. Release workflow 40634537205 succeeded. Downloaded MPP SHA256 bb4ada13ade4a792e8c521fcde6e967cba8644952189ae23599aacb8e849df4c matches GitHub; all seven FTM class files match the tested candidate, the Android DEX contains the new policy, and the published bundle passes 351 original-input assertions. Published catalog retains all 52 dev controls with exact tested metadata. Phone acceptance and stable promotion remain pending.
