# News and Weerplaza Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add and verify Morphe patches removing ads, tracking and premium notices in Volkskrant, NU.nl and Weerplaza, and restore full-article rendering in Volkskrant.

**Architecture:** Extend the existing version-restricted Kotlin bytecode/resource patch bundle. Keep app-specific patches and independent decoded-output verifiers separate. Extend the existing Desktop validation runner for the new targets and complete split APK inputs.

**Tech Stack:** Kotlin, Morphe patcher 2.0.1 / patches plugin 2.1.0-dev.1, Gradle, Android SDK, apktool, Python 3, USB-connected physical Android phone.

**Spec:** `docs/superpowers/specs/2026-10-27-news-weerplaza-design.md`

**Current acceptance state:** Weerplaza's corrected static matrix passes and the user confirmed radar rendering after replacing a stale local key with the verified Actions release key. NU.nl's startup crash and onboarding-loop regressions are corrected; the phone reached the rendered news feed, retained completion over two cold starts and the user confirmed the fix. Volkskrant's startup regression is corrected and independently re-reviewed; the user confirmed articles, columns and podcasts are fully readable. Broader collector verification and the documented ordinary sponsored-card classification limit remain outside that functional confirmation. Passing static checks alone do not complete these tasks.

## Global Constraints

- Support only Volkskrant 7.53.1/23136515, NU.nl 26.9.0/210156 and Weerplaza 3.13.1/734 from `../phone-apks/`.
- Preserve existing patches and all pre-existing uncommitted Weeronline work.
- Do not commit proprietary APKs/decompiled source, credentials, signing keys or private app data.
- Missing or ambiguous patch points must fail. Do not use forced compatibility to declare success.
- Preserve content/weather/account/video/push flows. Do not fabricate subscription purchases or weaken TLS.
- Full Volkskrant bodies and final paragraphs must be verified; hiding a marketing view alone is insufficient.
- Keep the overall goal active until runtime and collector coverage support the full requested behavior.
- User explicitly requested removing the emulator and using the USB phone. Do not recreate an emulator or remove original phone applications/data without confirmation.

## Review Focus

- Cached consent must not re-enable collector upload; test the SDK collection arbiter and sender, not just manifest defaults.
- Coroutine and callback completion must preserve content/loading transitions; check return types and existing empty-result paths.
- Ads embedded in video/HTML/remote BFF blocks need their actual loaders suppressed; test player configuration and bundled JS sinks.
- Split-required Play Store inputs need ABI/density resources after patching; inspect the merged output and launch it.
- Premium content must remain a complete body after inline and blocking marketing paths; inspect the mapper and runtime final paragraphs.

## Task 1: Weerplaza patches

**Files:** Create `patches/src/main/kotlin/patches/weerplaza/{Compatibility,AdsPatch,PremiumPatch,TrackingPatch,ConsentScreensPatch}.kt`, `tests/verify_weerplaza.py`, `docs/WEERPLAZA_TRACKING_AUDIT.md`.

**Interfaces:** Consumes the copied APK's complete smali/resource evidence under `$TMPDIR/re/weerplaza-static-3131/`. Produces four named patches (`Hide ads`, `Hide Premium banner`, `Disable tracking`, `Skip consent screens`) compatible with `nl.weerplaza.app` 3.13.1/734, minimum SDK 26, signer `e7c541ac7f1f5f36fb7c2263e14b9d64297ba391115d926e9b81af337efa4dea`. The verifier exposes `verify(root: Path, selected: set[str]) -> None` and a CLI taking a decoded root and repeated `-e` patch names.

- [ ] Write decoded-output checks for the shared ad flag/loaders, app Compose/bottom-navigation containers, video gates, premium menus/settings/startup prompts, tracker/ID/upload sinks and consent callback completion. With no `-e`, the original must pass. Each requested patched behavior must fail against the original for the expected missing effect.
- [ ] Implement version/signature compatibility and exact fingerprints from evidence. Target shared ads flag `Lj9/j$a;->a()Z`, actual loader sinks, app ad wrapper and bottom-navigation loader. Preserve weather publication when bypassing the ads geotargeting request: use its existing empty-map/failure completion path.
- [ ] Disable app analytics, Firebase collection including persisted opt-in, Infoplaza PPID and advertising IDs, video statistics and every other inventoried collector. Keep messaging and weather configuration operational. Do not assume Weeronline-only SDKs exist.
- [ ] Remove premium/automatic paid-choice surfaces without granting subscription state. Skip automatic consent only after ad/tracking dependencies and preserve any required completion result.
- [ ] Build, apply each selection and all selections with `--validate --bytecode-mode FULL`, independently decode and run the verifier. Expected: every selection has a successful patch report, valid signature and only its own/dependent effects. Record evidence and gaps in the audit; commit only task-owned files after passing checks.

## Task 2: NU.nl patches

**Files:** Create `patches/src/main/kotlin/patches/nunl/{Compatibility,AdsPatch,PremiumPatch,TrackingPatch,ConsentScreensPatch,ContentFiltersPatch,WebContentPatch}.kt`, `tests/verify_nunl.py`, `docs/NUNL_TRACKING_AUDIT.md`.

**Interfaces:** Consumes `$TMPDIR/re/nunl/` APK/smali investigation, especially `findings.txt` and the superseding `followup-findings.txt`. Produces the same four named patches for `nl.sanomamedia.android.nu` 26.9.0/210156, minimum SDK 32, verified signers `80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92` and `a78f41c09876d3cccbd87b5ef0d537ce7e2577f45e2749aff8fc5f8d21f8e986`. Verifier interface/CLI matches Task 1.

- [ ] Write and run original-negative/patch-effect-positive checks before patch code. Cover DPG banner views/initialization, VACS/IMA configuration, sponsored BFF blocks, premium/pay-choice UI, all tracking SDK sinks, JWPlayer JS pixels and push statistics forwarding.
- [ ] Implement nullable banner-view and VACS URL/IMA config suppression while keeping playlist URLs and ordinary BFF content. `VideoData.isAdsDisabled` alone is not an observed player control.
- [ ] Filter commercial full blocks at `ScreenTransformerImpl.transformBlockData(List)` / its validator and commercial carousel/paired children at the mapper's existing nullable link boundary. Use actual `teaser_type=advertorial`, partner flavor and NUshop targets; remove commercial section headings/dividers by the observed decoded section identity. Preserve adjacent normal sections and editorial `teaser_type=article` / `player` content. Never insert null whole blocks. Use synthetic model fixtures instead of committing public news payloads.
- [ ] Disable DPG/Snowplow, Firebase, Comscore/Nobo, user profile/identifiers, video telemetry, BrandMetrics and other inventoried collectors at sinks. Preserve local UI variables, cookies/read state and notification opening; do not no-op the whole tracking engine or disable push-forwarding receivers.
- [x] Preserve the exact functional BFF acknowledgements for the three onboarding cards. Actual server probes show `wncCardShownEvent` for `breakingNews`, `promoteLogin` and `followTopics` records completion; blocking these creates the observed loop. Keep other BFF events blocked and retain UDS removal. Verify the emitted predicate and actual phone completion across cold starts.
- [ ] Remove the persistent UDS token at both header getter and generation path: observed anonymous frontpage, net-binnen, articles, video and menus work without it. Preserve functional account authentication. Cover remote collectors in InlineWebView/full-screen/login/inbox clients where present; preserve JWPlayer's existing asset-loader interceptor before applying any filtering. Keep `/blocks` JS and functional f1bridge handlers; disable only the identified tracking handler/sinks.
- [ ] Remove automatic premium/privacy gates using app coroutine completion paths. Do not no-op a suspended SDK callback without completing it.
- [ ] Filter the observed `contentBlocker-*` WebAppBlock premium/registration notice specifically rather than dropping all WebAppBlock embeds. This is notice suppression, not evidence of missing NU+ body recovery; the full-article requirement belongs to Volkskrant.
- [ ] Build and validate each selection and all together using the real patcher and independently decoded APKs. Document exact inventory, exclusions that are functional traffic, and runtime gaps; commit task-owned files after successful checks.

## Task 3: Volkskrant patches and full articles

**Files:** Create `patches/src/main/kotlin/patches/volkskrant/{Compatibility,AdsPatch,PremiumPatch,TrackingPatch,ConsentScreensPatch,FullArticlesPatch,ContentFiltersPatch,WebContentPatch}.kt`, `tests/verify_volkskrant.py`, `docs/VOLKSKRANT_TRACKING_AUDIT.md`.

**Interfaces:** Consumes `$TMPDIR/re/volkskrant-investigator/`, including `FINDINGS.md`, `WEB_EMBED_SUPPLEMENT.md` and `public-article-evidence.json`. Produces the four common patch names and `Read full articles` for `be.persgroep.android.news.mobilevk` 7.53.1/23136515, minimum SDK 32, verified signers `80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92` and `34a28a4862a6204d7c70ebacc7105fae14ac880486c5d2d56a2b9c17907b27c4`. Verifier interface/CLI matches Task 1.

- [ ] Write and run original-negative/patch-positive checks before implementation for actual ad gates/loaders, tracker startup/senders/IDs, premium/consent gates, and successful empty marketing-template result. Check that article-body mapping remains intact.
- [ ] Disable Xandr/Prebid/Google and other inventoried ad paths, video ads, sponsored modules and reserved slots. Hide premium menus, sticky prompts and marketing surfaces without substituting a fake purchase.
- [ ] Filter actual Advertisement body DTOs and exact article newsletter promotional embeds before mapping/rendering; preserve editorial paragraphs, charts, lists, quotes, images, podcasts and layout bridges. Trace concrete `ADVERTORIAL` markers to safe feed/overview removal; never hide the disclosure alone or classify all Branded/syndicated content as sponsored.
- [ ] Disable app/SDK collector sinks, including startup providers: Heap, ContentSquare, Snowplow, Comscore, Gemius, Piano, Firebase, Facebook/GTM, ACRA and other inventoried SDKs. Preserve article/account/video/push functionality and required callback objects.
- [ ] Add scoped request policies to the app's `DefaultWebViewClient` and `EmbedWebViewViewModel$EmbedWebViewClient`; preserve navigation, title/loading/error, account-removal and `app.notifyHeightUpdated()` callbacks. Keep editorial/social embeds and consent gating. Disable actual three-argument ContentSquare WebView attachment and callback-free Heap registration, while completing the Contentsquare startup listener that unblocks awaiting consumers. R8 synthetic-lambda class names alone are not evidence of analytics; inspect the selected target.
- [ ] Implement full-article rendering through the app-owned marketing-template repository/loader's normal successful empty-result path. A false `TemplatePosition.isBlocker` alone is insufficient because inline templates can replace the whole article body. Preserve received body components and completed coroutine semantics.
- [ ] Build and independently verify each selection and all together. Reproduce anonymous premium-body response evidence without persisting shipped credentials in tracked files. Record article IDs/paragraph counts/hashes and verify full bodies in runtime. Commit task-owned files only after validation.

## Task 4: Split-input validator, metadata and integration

**Files:** Modify `scripts/validate_targets.py`, `patches/build.gradle.kts`, handwritten sections of `README.md`; add focused Python validator tests where needed. Generated metadata remains generator-owned.

**Interfaces:** Consumes each task's four/five patch names and `tests/verify_{weerplaza,nunl,volkskrant}.py` CLI. Adds targets to the current validation runner; existing Buienradar and Weeronline routing remains unchanged.

- [x] First test an input directory with base+split APKs: archive every supplied split, use the base only for original-code inspection, reject a missing base or unexpected non-APK input. Check target-specific verifier routing and patch dependency expansion with real temporary files and command construction.
- [x] Implement directory-to-APKS staging and exact new target profiles. Add optional single-selection filtering for focused diagnosis while keeping full matrix validation as the default. Use installed SDK tools through PATH without changing system configuration.
- [ ] Build the complete bundle with `python3 scripts/build.py buildAndroid`. Expected: Gradle success and a real versioned `.mpp` under `patches/build/libs/`.
- [ ] Run `python3 scripts/validate_targets.py APP ../phone-apks/SOURCE` for Weerplaza, NU.nl and Volkskrant. Inspect all reports, signing and independently decoded effects. Exercise original profiles after any common-runner change. Update app metadata and handwritten documentation; generate patch lists only through the existing generator.

## Task 5: Runtime, collector audit and final review

**Files:** Update the three audit documents and plan progress; runtime artifacts stay under ignored `build/validation/`.

**Interfaces:** Consumes the combined patched APKs and all static validation reports. Produces runtime evidence for the actual behavioral requirements, a final reviewed bundle and an honest completion audit.

- [ ] Use the USB-connected physical phone, as explicitly requested after emulator removal. Keep its existing apps/data intact; obtain confirmation before any original replacement requiring uninstall/data loss, after the patched artifact is ready. Compare original and patched startup, navigation, news/weather content, video, consent and premium prompts; inspect crashes/loading state. Do not recreate an emulator.
- [ ] Capture representative collector activity and demonstrate that inventoried tracking paths do not send after startup, content navigation and video. Include persisted-consent/re-enablement behavior and any shared functional endpoints.
- [ ] For Volkskrant compare complete bodies and final paragraphs of the tested premium articles, including inline and blocking marketing cases. Record UI/body evidence rather than treating a missing overlay as proof.
- [ ] Request a fresh independent code review of this task's complete diff, spec, reports and known gaps; resolve important findings with focused failing/passing checks. Run final build and required validation after changes.
- [ ] Audit every original requirement against current files and runtime evidence. Mark the goal complete only when all requirements are proven; otherwise retain active status and continue from the documented gaps.
