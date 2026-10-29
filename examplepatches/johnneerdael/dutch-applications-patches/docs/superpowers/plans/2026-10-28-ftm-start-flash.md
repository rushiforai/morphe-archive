# FTM startup flash fix

> **For agentic workers:** Use superpowers:executing-plans; request independent review before dev publication.

**Goal:** Prevent loading the post-edition account page on the ordinary edition Continue action.
**Architecture:** Add the modern main-frame navigation callback. For GET navigation from an exact production `/start/locale-switcher` URL to the same edition's exact `/start/splash`, use `/skip-start` instead. Give the replacement to the original String navigation handler first, then load it only if that handler did not consume it, and cancel the original account request. Other requests delegate to the superclass, which retains the original native routing. Keep the existing guest-only DOM cleanup as a fallback for direct/restored account pages.
**Tech stack:** Kotlin DEX helpers, actual emitted-instruction execution, Android SDK call audit, existing Chromium regression.
**Spec:** User-reported flash after edition selection; retain the guest/manual-login constraints in `../specs/2026-10-28-ftm-guest-start-design.md`.

The original edition link is server-rendered, targeting `/start/splash`. Android documents that the modern callback can cancel a link navigation before load. It is not invoked for app-initiated loadUrl, so no promise is made about arbitrary direct native account-page loads. Exact URL pairs intentionally fail open on query/fragment/encoded/foreign/cross-edition paths. The guest skip uses the publisher's normal cookies/session; no authentication, logout, consent or preference writes are added.

- [x] Execute a failing navigation regression against v1.7.0-dev.2's emitted client.
- [x] Add the exact-pair helper and modern callback, preserving every original method; verify main-frame/GET gating, native consumed/unconsumed branches, and all negative navigation boundaries.
- [x] Run FULL/sign/redecode original/consent/all, required browser tests, private callback regression, central units and original-input guards; obtain independent review.
- [x] Publish and verify the dev artifact; keep actual Android phone acceptance pending.

Evidence: baseline RED `build/ftm-start-flash-red.log`. Original, consent-only, Hide ads (consent disabled) and all-controls FULL/sign/redecode pipeline GREEN in `build/ftm-start-flash-matrix.log`. Each emitted native policy check executes 256 route/flag/request/router/state combinations plus nullable input guards; the router itself is a recorded boundary with original code separately hash-pinned, so these checks do not establish live server-session or Android history behavior. Existing required Chromium checks, private publisher callback probe, 40 Python units and 351 original-input assertions pass. Independent review approved for dev publication; its minor wording finding was corrected to distinguish modeled state from runtime session acceptance. No device operations performed.

Published [v1.7.0-dev.3](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.7.0-dev.3), source 02edac9 / release 1af8232. Workflow 40635557467 succeeded. Downloaded Android MPP SHA256 bb5830c2bcd0a491a31eaeef68044687490502da6bab86fa36fdca7d4e1f8367 matches GitHub; all seven FTM classes match the tested candidate and the Android DEX contains the new helper/route fragments. The published bundle passes 351 original-input assertions and retains exact tested metadata for all 52 controls. Phone visual acceptance remains pending.
