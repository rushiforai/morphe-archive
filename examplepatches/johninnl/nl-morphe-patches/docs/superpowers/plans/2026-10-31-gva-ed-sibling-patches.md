# GVA and ED sibling patch implementation plan

**Goal:** Port every applicable sibling control to the exact GVA and ED publisher builds pulled from the USB phone.

**Architecture:** Keep independent app modules and exact package, version, version-code, minSdk and publisher-signature preflights. Reuse sibling behavior only after comparing shipped code; retain original logic outside the selected control. GVA follows HBVL/Mediahuis One; ED follows AD/Kubus.

**Tech stack:** Kotlin Morphe patcher, APKTool smali inspection, REA JADX evidence, Python independent emitted-code verifiers.

## Constraints

- Every author and committer must be johninnl <349981574+johninnl@users.noreply.github.com>; audit before each commit or push.
- Publish only from main; no manual release/version/generated metadata changes.
- Preserve phone app/data state; produce and validate artifacts locally.
- GVA 22.0.0 / 2012316104 / minSdk 32; ED 9.22.0 / 9220000 / minSdk 32.

## Review focus

- Match exact original publisher signer rather than assuming a sibling certificate.
- Audit obfuscated ED classes despite matching AD version numbers.
- Preserve editorial content, manual login, push, media and account/purchase state.
- Verify each public control alone and all controls together, including dependencies.
- Distinguish static emitted validation from runtime/server article-access evidence.

## Tasks

- [x] Inventory shipped targets with REA and compare sibling controls and exact original method contracts.
- [x] Port four Mediahuis controls to GVA; validate independent method/switch/reader and own-brand Shop fixtures.
- [x] Port five Kubus controls to ED with explicit obfuscation mapping, independent original pins and emitted behavioral checks.
- [x] Add both apps to validation routing and bilingual app docs/catalogue destinations; regenerate metadata using official build tools without selecting a release version.
- [x] Build Android bundle, run original + individual + combined patch matrices, Python regressions and relevant documentation checks.
- [x] Review resulting diff, re-audit identity, commit only scoped implementation under johninnl; retain evidence and patched local artifacts.

## Evidence ledger

- Initial identity audit passed for login, effective author/committer and reachable history.
- GVA REA package: ev_5e748bc3ecc69ba4cf022542c0a2eabd463ea3986c558b94ad99b17f81e05fb1.
- ED REA package: ev_202d1b8ec4f970512f1d670dcad8d6461c4bb3248fa15ef98a3edad25f11d7cb.
- GVA REA Kaching class: ev_d5ec7a205ac2c736a82eddac0d4ca0fdaa33c2f9b81a52f7643a59e75556497d.
- ED REA SectionResponse: ev_20b7ee240f621efe6b86f042b56b44f1f8c0cf229ff452722d601b837a5e0333.
- GVA class search rejected duplicate inventory; direct exact-class inspection works. No completeness claim from failed inventory.
- AD phone reference is Morphe-signed; use only as a structural comparison and never as original publisher input.

- GVA full matrix PASS: original, four independent selections and all controls, signatures and 1181 retained method contracts. Final bundle GVA class bytes are identical to the matrix bundle.
- Production guard harness PASS: 91 assertions across both apps.
- ED all-controls Desktop application and FULL DEX validation PASS; emitted verifier still being finalized.
- Official Gradle metadata generation adds exactly nine app-control records and changes no existing record or version.

- Independent code review found no actionable GVA/ED/source/verifier/docs issues. ED preference constructor branch4, exact high-register article argument, game completion path and preserved CFGs were checked separately.
- All five individual ED selections PASS; combined matrix verification is finishing.

- ED full matrix PASS: original, five independent selections and all controls, patch reports, FULL DEX compilation, output signatures, and complete emitted/retained contracts.
- Final Python suite: 331 tests PASS, 34 skipped. Node release/identity suite: 29 PASS. Strict documentation build and 78 bilingual rendered pairs PASS; 80 app-page metadata checks PASS.
- All 13 pulled original APK checksums remain unchanged. No installation or phone data change was performed.

## Dev promotion gate

- User requested a dev build first and explicit confirmation before main.
- Keep all work on the feature/dev branch. Derive the dev version with the existing semantic-release analyzer/rules; build a separate prerelease artifact without changing the tracked release version.
- Do not merge, push to main, or publish a stable release until the user confirms the dev build.
