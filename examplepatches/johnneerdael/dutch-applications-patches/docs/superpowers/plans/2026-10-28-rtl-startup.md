# RTL startup follow-up Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox syntax for tracking.

**Goal:** Skip RTL automatic cookie and notification onboarding with real choices preserved.
**Architecture:** Redirect only the initial PrivacyGate coroutine branch to its native readiness closure; redirect the startup notification navigator to native Unit completion after the native result check. Pin both complete original graphs and manual/default settings with independent DEX contracts.
**Tech Stack:** Kotlin/Dexlib, Python native-smali fixtures, existing Morphe CLI matrix.
**Spec:** docs/superpowers/specs/2026-10-28-rtl-startup-design.md

## Global Constraints
- RTL 12.7.1/1558, original input guard and existing signer set.
- Existing Skip consent screens default true, depends on Disable tracking and Hide ads.
- No fabricated consent or notification opt-in/permission; preserve manual settings and upgrades.
- Other approved app payloads remain exact.
- SSD build and one local JVM; no phone installation/reset.

## Review Focus
- Initial coroutine errors propagate; real resumed consent/error routes retain their graph.
- The other 28 merged coroutine cases remain exact.
- Returning users and manually enabled notification settings remain untouched.
- All control combinations preserve manual privacy/notification routes and defaults.
- Resource/package/report integrity and approved app payloads survive publication.

### Task 1: RTL startup routes and verification
**Files:** patches/rtl/ConsentScreensPatch.kt; tests/rtl_startup_contracts.py; tests/verify_rtl_startup.py; tests/verify_rtl.py; docs/privacy/rtl-nieuws/README.md; docs/rtl-nieuws-audit.md; bilingual RTL app guides.
**Interfaces:** Consumes original smali/DexDeclarations, shared canonical/VM and existing matrix. Produces independent startup contracts, runtime verifier and default-on consent implementation.
- [ ] Trace original initial/resumed privacy and startup notification routes, defaults and manual setters.
- [ ] Write complete graph contracts and fixtures for both initial routes, errors, returning state and preserved manual/default settings. Run previous release: expected FAIL on direct startup PrivacyGate and notification routing.
- [ ] Implement narrow branch redirections with original opcode/reference/count/register guards, after native error checks. Expected new emitted fixtures PASS; original output remains exact when control unselected.
- [ ] Run original and each individual/control-combined FULL APK/sign/decode/report matrix; existing tests and approved payload preservation. Expected PASS.
- [ ] Update per-app privacy README, audit and bilingual app guide to explain startup controls and evidence limits; integrate latest main documentation navigation. Existing docs/unit checks PASS.
### Delivery gate after Task 1
- [ ] Commit the verified change and request one fresh whole-increment review; one RED→GREEN fix pass for Important/Critical findings.
- [ ] Publish authorized dev branch; verify actual released payload/catalog/version/attestation and report phone testing availability. No stable promotion.
