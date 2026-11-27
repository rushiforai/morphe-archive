# Project brain

Working memory for coding agents, required by [`AGENTS.md`](../AGENTS.md). Keep
**Status** and **Next step** current, and append one **Session log** line before
you stop. Rules live in `AGENTS.md`; history lives in git and
[`CHANGELOG.md`](../CHANGELOG.md). Do not copy either here.

## Status

- Branch `feat/v31-rambler-plus-nl-patches` upgrades Rambler Bangla to `v31.0.0`
  (Morphe Patcher 2.1.0 targeting Gboard `18.5.4.993608717-release-arm64-v8a`)
  with **59 selectable Morphe patches**:
  - **3 Rambler Bangla patches**: `Rambler Bangla Lite Script Policy`
    (fail-closed SHA-256 fingerprint-guarded JetsonLite `fja.d` / `ezn.b` hooks,
    supporting both Gboard 18.5.4 `adcb7fd5...` and 18.3.1 `347a9484...` cleanup
    prompts plus Hinglish override `a0245134...`),
    `Rambler Bangla Phonetic & Multilingual Engine` (complete V29.3+/V29.5
    runtime + active Gboard locale handoff via `fhv.w()` + EN/BN pairing default
    ON + fail-closed sensitive/password/incognito bypass), and
    `At-Mention & Email Strip Suggestions` (SwiftKey-style `@grok` / `@claude` /
    `@gmail.com` suggestion strip + `enable_email_provider_completion`).
  - **3 `nl-morphe-patches` Gboard 18.5.4 ports**: `AMOLED Dark Keyboard`
    (dynamic `Lrmt;` `#000000` dark surfaces), `Rambler Toolbar & Revert Extras`,
    and `Hidden Flags Override` (`okf.g(olk.OVERRIDE)` -> `okq.e()`).
  - **7 Gboard Rambler Enhancements patches** merged from
    `abotmaker/gboard-rambler-enhancements` v1.3.4 (GPL-3.0).
  - **46 Gboard Patches (GboardWu) patches** merged from
    `jasonwu1994/Gboard-patches` v4.5.0 (GPL-3.0), with unconditional
    `enable_agentic_dictation` activation fixing Rambler+ toggle under Voice
    typing, `Package Rename` defaulting to `Rambler Bangla` /
    `com.aidev2024.ramblerbangla`, and in-app author set to `muhib-karim`
    (full upstream license credits in repo docs).
- All legacy 18.3.1 standalone patcher files, 88 Python unit tests, and 22
  static-suite checks remain intact and green.
- `README.md` quotes the number of Python unit tests, and
  `tests/python/test_docs_homepage.py` fails if it is wrong. Update the number
  whenever a test is added or removed.

## Next step

1. Maintain Gboard version bindings as newer Gboard 18.5.4+ releases ship.
2. Keep upstream syncs from `jasonwu1994/Gboard-patches` and
   `abotmaker/gboard-rambler-enhancements` attributed in `ATTRIBUTION.md` and
   `THIRD-PARTY-NOTICES.md`.

## Session log

- 2026-11-27 (v31.0.0): Fixed Rambler+ activation root cause (`enable_agentic_dictation`
  unconditionally true in `GboardRamblerStockPolicy` + `RamblerFlagRuntime`), wired live
  active Gboard locale (`fhv.w()`) into `GboardRamblerScriptFix` with EN/BN pairing
  default ON, integrated `johninnld/nl-morphe-patches` Gboard 18.5.4 features (`AMOLED
  Dark Keyboard`, `Rambler Toolbar & Revert Extras`, `Hidden Flags Override`), added
  SwiftKey-style `At-Mention & Email Strip Suggestions` (-> 59 Morphe patches total),
  updated in-app author to `muhib-karim`, preserved full license-compliant
  upstream attribution across repo docs, refreshed homepage (`README.md` + `docs/index.html`),
  verified on Colab + GitHub Actions CI + Android 15 KVM emulator, and cut `v31.0.0`.
- 2026-11-27: Unified Morphe patch suite v30.0.0 (`feat/morphe-unified-v30`):
  merged all 46 `jasonwu1994/Gboard-patches` v4.5.0 patches + all 7
  `abotmaker/gboard-rambler-enhancements` v1.3.4 patches + 2 new Rambler Bangla
  18.5.4 Morphe patches with full V29.5 phonetic/multilingual/loanword runtime
  and native Settings UI. Built & verified `patches-30.0.0.mpp` and patched
  Gboard 18.5.4 APK via Morphe CLI on Colab, ran all Gradle/Python/emulator tests,
  updated credits (`ATTRIBUTION.md`, `THIRD-PARTY-NOTICES.md`, `NOTICE`),
  `SKILLS_USED.md`, and cut release `v30.0.0`.
- 2026-11-15: scan_fingerprints fail-closed abort, verify_apk.sh static-suite
  gate (21 -> 22 checks), bootstrap_tools.sh header correction. Local
  verification: 88 Python tests, static suite 22/22. Delivered as unmerged
  PR #27, stacked on #26.
- 2026-11-15: Bumped pinned guava 27.1-android to 33.8.0-android and
  failureaccess 1.0.1 to 1.0.3 (version from guava-parent pom). Upstream .sha1
  matched; re-pinned only those two sha256 lines by hand. Local verification:
  bootstrap verify, static suite 22/22, 88 Python tests OK.

- 2026-11-10: Fixed the CI pass gate and added its self-test (1 commit).
- 2026-11-10: Production-grade pass, phase 2 (10 commits): patcher fail-open
  fixes with unit tests, `verify_apk.sh` exit codes, `score.py` default
  baseline, `bootstrap_tools.sh` download handling, `ci.yml` SHA pins and
  self-test step, onboarding-probe URL allowlist, README known limitations,
  user-guide environment variables, this file. Not pushed.
- 2026-11-10: After review on PR #23, fixed the APK URL host parsing in the
  three emulator workflows and added `url_allowlist_selftest.sh` (1 commit).
  Not pushed.
