# Trouw Core Patches Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add the five Trouw controls with independently verified native behavior and publish a development increment for later phone testing.

**Architecture:** Retain the released Volkskrant implementation unchanged. Copy the independently matched native contracts into an app-specific Trouw package and verifier. Use only evidenced shared WebView collector/ad policies; do not invent Trouw website selectors or newsletter rules.

**Tech Stack:** Morphe patcher 2.0.1, Kotlin, smali, Python, Desktop FULL validation, apktool.

**Spec:** `docs/superpowers/specs/2026-10-27-expanded-dutch-apps-design.md`

## Global Constraints

- Input is `be.persgroep.android.news.mobiletr` 7.53.1 / 23136515, minSDK32, APKS, publisher signing lineage equal to the released Volkskrant input.
- No device/emulator actions; phone acceptance is deferred until the user returns.
- No APK, decompiled source, raw article body, credentials or private data in Git.
- Every mutating patch directly depends on Trouw's original-input guard; all singleton method matches use the repository's strict fingerprint cardinality.
- One heavy JVM at a time, max1GiB. The controller owns the JVM lease, shared validator/catalog/README integration, version and Git publication.
- Preserve genuine account/purchase state, manual privacy/login, startup completions, navigation and editorial/media content.
- This increment does not claim unknown website selectors, newsletter marketing, sponsored feed-card markers, server-inserted media ads or device rendering have been verified. Those remain explicit open acceptance items.

## Review Focus

- Removed FIAM registrars must not leave the startup suppression adapter dereferencing a missing component; retain the full original startup coroutine.
- Contentsquare readiness and disabled-ad callbacks must complete once; Piano callbacks retain the real EventRecord-to-EventStatus transformation and ID fetch returns Result<String>.
- Both ordinary article coroutine branches and moment results preserve editorial object identity and final paragraphs; only exact advertising/advertorial markers are filtered.
- Existing WebView callbacks, superclass delegation, account-removal bridge, loading/error handling and embed resizing remain intact.
- Trouw-specific strings/domains must come from its actual artifact, not a blind Volkskrant rename; automatic subscriber-benefit onboarding remains a required follow-up if not covered by the native controls.

## Task 1: App-specific native controls and verifier

**Files:** Create `patches/src/main/kotlin/patches/trouw/{Compatibility,AdsPatch,TrackingPatch,ConsentScreensPatch,PremiumPatch,FullArticlesPatch,ContentFiltersPatch,WebContentPatch}.kt`, `tests/verify_trouw.py`, `docs/trouw-audit.md`.

**Interfaces:** Expose named `Hide ads`, `Disable tracking`, `Skip consent screens`, `Hide Premium banner`, `Read full articles`, compatible only with Trouw. Export Python `verify(root: Path, selected: set[str]) -> None` and CLI decoded-root plus repeated `-e`. Use the exact79 target descriptors,14 retained digests, two article coroutine digests and resource counts in the ignored `trouw-findings.md` and existing Volkskrant verifier as independently compared evidence.

- [ ] Copy/adapt the verifier first. Original Trouw with no selections must pass; each named positive selection must fail on the original for its intended behavior. Record the commands/output in the task report before production edits.
- [ ] Copy the matching native patch contracts into the Trouw package. Compatibility uses package/version/code/minSDK above and the two existing Volkskrant publisher hashes, with an app-specific shared original-input guard. Retain strict method matching.
- [ ] Ads retain Disabled listener completion, null ViewGroup, IMA content resume, explicit DTO/component filtering and both completed ordinary/moment advertorial-result branches. Preserve suspended/error/editorial identities.
- [ ] Tracking preserves readiness listener completion, completed ID Job and Result<String>, genuine callback element types, FIAM consumer safety and actual call kinds. Native Comscore replacements remove the native flag rather than prepending code.
- [ ] Preserve `CatsureQueueSyncRepository.syncQueue(CurrentQueue):V`, `CatsureHeartbeatRepository.sendHeartbeat(AmaliaAudioPlayerState,String):V` and both send coroutines byte-for-byte until their server-side queue/active-device/progress roles are resolved. The initial copied suppressions had insufficient telemetry-only evidence; assert retained digests and keep classification open. Other independently classified event telemetry remains suppressed.
- [ ] Empty marketing uses `ResultOf.Success(MarketingTemplateResolveResult(false, Collections.emptyList()))` to avoid both blocking and inline whole-body replacement. Premium label returns its existing None singleton. Automatic consent returns completed Unit and retains manual resurfaceConsent unchanged.
- [ ] Web policy retains evidenced shared SDK ad/collector hosts from the released implementation; omit unobserved `c2.volkskrant.nl`, `vx.volkskrant.nl`, VK newsletter filtering and VK DOM cleanup. Do not fabricate equivalent Trouw rules. Test URI host/subdomain boundaries and delegated allowed requests.
- [ ] Extend the copied verifier for Trouw labels/policies and Trouw premium sample evidence: `5f40769` has12 paragraphs, final54-word SHA256 `f39434a2b140163d8ba292bec2f8ee980803417e50e04c628be708e80d86a7e6`; `16dbb92` has22, final57-word SHA256 `08505c94a8d5126e2b9950eec02bed3d22dc9e602facd7a6257fc4c227df915c`. Live probe reads shipped fallback privately, TLS verification enabled, and confirms premium=true rather than assuming it.
- [ ] Inspect the separately observed `OnboardingLoginInformationViewDataMapper` subscriber-benefit row. Record its exact boundary and whether safely covered; preserve functional login/onboarding. Implement only after its own RED assertion and exact contract are established, otherwise list the row as open follow-up without claiming all promotional surfaces are gone.
- [ ] Run syntax/unit/original checks; obtain the JVM lease for build/apply validation. Controller performs shared runner/preflight integration, then actual each-single/all Desktop FULL patch/sign/redecode checks. Include actual emitted call-kind audit and the five Review Focus regressions.
- [ ] Write app audit distinguishing static evidence, live API evidence and deferred phone acceptance. Self-review; commit only app-owned files and report tests/concerns to the controller. Do not push or edit shared catalog/README/runner/version files.

## Task 2: Integration and development publication (controller)

**Files:** `scripts/validate_targets.py`, `tests/{test_validate_targets,verify_original_input}.py`, generated catalog, README and release metadata.

**Interfaces:** Consume Task1's exact names/compatibility and `verify_trouw.verify`; publish only patch-bundle artifacts to the authorized development channel.

- [ ] Add Trouw target/original signer/version guard regressions, including changed versionCode, minSDK, rotated allowed signer, mixed unknown signer and missing/ambiguous target rejection. Preserve existing six targets.
- [ ] Complete actual single/all application validation with signatures and independent decoded assertions; verify current bundle generation selects the current version rather than a stale cached MPP.
- [ ] Request an independent app review against the spec, emitted behavior and test evidence; address important findings before publication.
- [ ] Generate catalog, update README to separate six phone-verified apps from new static-only prerelease apps, commit and push to `dev`, then inspect its actual Actions/release status.
- [ ] Keep deferred acceptance and unknown discovery items for in-scope apps open in the discovery ledger. Follow per-app stable-release approvals and do not mark the full current scope complete prematurely. FD and De Telegraaf were excluded on 2026-10-28 and are not outstanding requirements.
