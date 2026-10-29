# FTM Commercial and Trial Promotion Cleanup Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development to implement the app task, then independent review and controller integration. Steps use checkbox (`- [ ]`) syntax.

**Goal:** Remove the book-sale announcement and guest trial promotions observed on the user's phone while preserving editorial content and functional account/navigation/media controls.

**Architecture:** Extend the existing guarded FTM WebView cleanup with a separately selectable Hide ads control and narrow premium-promotion classification. Persistent scoped CSS and an idempotent DOM observer cover remote insertion/replacement. Keep the live publisher scripts and existing native client/callback bodies.

**Tech Stack:** Kotlin/Morphe2.0.1, emitted smali and JavaScript, Python/Node verification, Desktop FULL/sign/redecode.

**Spec:** `docs/superpowers/specs/2026-10-27-expanded-dutch-apps-design.md`; user-reported FTM book-sale and trial surfaces, followed by signed-in/anonymous comparison requests.

## Global Constraints

- Exact original nl.ftm.ftmpulse 2.6.8 / 58, minSDK32 APKS and existing publisher signer guard remain unchanged. Every mutating dependency directly depends on originalInput; singleton lookups remain eager and exact.
- No genuine account, trial, expiry, receipt, authentication, consent or native preferences are fabricated. Preserve the user's currently signed-in session. Trial extension is not part of this task.
- No publisher APK/JS/HTML, raw article text, private fields or credentials enter Git. Private runtime captures are in `build/validation/ftm/phone-20261027/`; original live sources are `$TMPDIR/re/expanded-ftm/web/` and original decode is sibling decoded/.
- Root owns all ADB/phone actions. No emulator. One heavy JVM at a time, max1GiB, controller lease required. Root owns shared profile/preflight/catalog/README/publication.
- This fixes the evidenced surfaces. Other commercial containers, initial account-choice onboarding, remaining collectors and universal content access remain open unless independently established.

## Evidence and decisions

- `promotion-structure-private.json` captures anonymous homepage roots: `aside.announcement-bar.light`, data-template=default, data-show-in-pulse=true, two product links to `https://winkel.ftm.nl/products/hoe-china-ons-bespeelt`, and `button.close`. Actual numeric announcement ID122 is evidence, not a required hardcoded ID.
- The live footer's FA function shows announcements and hides `.share-stickybar`; its actual qA close handler hides the announcement, restores the share bar and stores the dismissed announcement ID. A cleanup that merely hides the announcement can leave the share toolbar suppressed. Preserve the existing close behavior for positively classified automatic shop announcements, without clicking shop/purchase links or changing unrelated dismissal state.
- Match commercial product links only inside the evidenced automatic `aside.announcement-bar` container: parsed HTTP/HTTPS host exactly winkel.ftm.nl and encoded path beginning `/products/`. Preserve ordinary service/outage announcements, manual subscription forms and suffix-spoof/invalid links. Unknown banner-pp blocks remain editorial unless separately proven; do not blanket-hide them.
- Premium roots: `aside.trial-member-announcement` with header-announcement or diapositive-announcement, linking to the real site `/start/trial`; `.part.trust-nugget-pp` with a real-site `/proefabonnement` link. Hide only the automatic promotion roots. Manual /app-login, profile, signup/payment pages and generic trust/editorial blocks survive. Preserve current `.share-stickybar-outer` behavior.
- Actual root replacement matters: an announcement originally commercial can later receive service/form content. Reclassify and clear only our marker when positive evidence disappears. Original `.show()` cannot resurrect a marked advertisement. Repeated cleanup must not install duplicate observers or cause mutation loops/polling.
- Three article responses preserved all signed-in editorial paragraphs in order anonymously (19/20,45/46,18/19; guest extra is a trial nugget). One podcast delivered identical text/audio URL anonymously,206 audio/mpeg; signed-in phone playback advanced then paused. These are bounded sample results, not universal/permanent access proof.

## Review Focus

- A commercial announcement closes without leaving hidden share controls or a page-blocking overlay state.
- A service notice or manual membership form replacing the same root becomes visible and functional.
- Future insertions and publisher display changes remain covered, with one observer per cleanup and no loops.
- Generic editorial banner/trust blocks, manual account/privacy and native media/navigation remain untouched in every patch selection.
- Hide ads alone changes only advertisement presentation; dependency composition and exact host restrictions remain correct.

## Task 1: App controls and independent regression checks

**Files:** Modify `patches/src/main/kotlin/patches/ftm/WebContentPatch.kt`, `PremiumPatch.kt`, `TrackingPatch.kt`, `tests/verify_ftm.py`, `docs/FTM_TRACKING_AUDIT.md`; create `patches/src/main/kotlin/patches/ftm/AdsPatch.kt` and a focused test fixture module only if needed.

**Interfaces:** Public fifth control `Hide ads`, internal `hideAds`, direct dependencies originalInput and webContent; enable an independent Ads flag. Disable tracking includes Hide ads; Skip consent screens retains its Disable tracking dependency. Existing four names and callback/request contracts stay intact. Python verify(root,selected) and repeated -e remain the entry points. Shared profile integration belongs to root, so report the fixed dependency names before FULL validation.

- [ ] Add original/emitted failing assertions before production: actual captured shop-announcement and two trial roots survive existing cleanup; preserve negative service/form/editorial/manual/privacy/media fixtures. Use synthetic, structurally faithful public fixtures, never raw publisher HTML.
- [ ] Add the Ads flag and targeted cleanup. Use parsed positive product-link classification and the existing scoped close button behavior. Preserve noncommercial state; style overrides protect classified roots from later display changes. Reclassify replacements, keep registration idempotent and avoid polling/global Storage overrides.
- [ ] Extend premium cleanup for the evidenced trial announcements and subscription-linked trust nugget. Preserve all editorial parts and manual account/signup/payment controls. Initial account-choice onboarding is unclassified and must stay functional.
- [ ] Expand emitted JS tests to execute cleanup and later mutations, repeated calls, source .show/close semantics, replaced service/form contents, invalid/spoof hosts/URLs, storage denial, unavailable optional APIs and cross-control combinations. Retain all original native/manifest/body/callback digests and actual SDK call-kind checks. Use the private source fixture option to check real FA/qA where useful; do not commit captured publisher code.
- [ ] Run original baseline and five-control RED checks, Python syntax/unit tests, then request the JVM lease, build and each-single/all FULL application/sign/redecode through the root-integrated profile. Preserve failure evidence. Audit the actual phone findings and remaining limits accurately.
- [ ] Commit only app-owned files after checks and self-review. No shared-file edits, push or ADB. Write the implementation report next to the extracted task brief; return status/commit/tests/concerns only.

## Task 2: Controller integration, review and phone acceptance

- [ ] Add Hide ads and Disable tracking->Hide ads to the FTM profile and routing tests; preserve prior apps. Run actual SDK preflight and focused project units.
- [ ] Fresh independent app/integration review, then install the same-signer update on USB phone and visibly check book-sale/trial cleanup, editorial final paragraphs, share toolbar, login/privacy and podcast playback. Foreground coordination may be needed; preserve the current login.
- [ ] Update README, generate catalog from a current bundle with no stale MPPs, commit and push the reviewed increment to dev. Verify actual published artifact/digest and FULL all-control output. No FTM stable promotion until user approval.
