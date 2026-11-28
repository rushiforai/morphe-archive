# Project brain

Working memory for coding agents, required by [`AGENTS.md`](../AGENTS.md). Keep
**Status** and **Next step** current, and append one **Session log** line before
you stop. Rules live in `AGENTS.md`; history lives in git and
[`CHANGELOG.md`](../CHANGELOG.md). Do not copy either here.

## Status

- `main` (`v32.4.0`) ships Rambler Bangla as a unified
  Morphe Patcher 2.1.0 suite targeting Gboard `18.5.4.993608717-release-arm64-v8a`
  with **60 selectable Morphe patches** and a persistent maintainer-signed
  release APK (`679cfdec...` for in-place upgrades):
  - **4 Rambler Bangla patches**: `Rambler Bangla Lite Script Policy`
    (fail-closed SHA-256 fingerprint-guarded JetsonLite `fja.d` / `ezn.b` hooks,
    supporting both Gboard 18.5.4 `adcb7fd5...` and 18.3.1 `347a9484...` cleanup
    prompts plus Hinglish override `a0245134...`),
    `Rambler Bangla Phonetic & Multilingual Engine` (complete V29.3+/V29.5
    runtime + active Gboard locale handoff via `fhv.w()` + EN/BN pairing default
    ON + fail-closed sensitive/password/incognito bypass),
    `At-Mention & Email Strip Suggestions` (100% personalized `@grok` / `@claude` /
    `@gmail.com` learning injected directly into Gboard's native suggestion strip
    via `pbh` / `pbo` / `owu` / `phr` with native theme matching & drag-up-to-remove),
    and `Clipboard Drag-to-Reorder` (4-direction `ItemTouchHelper.Callback` / `fqi`
    drag-to-reorder within Pinned/Recent with persistent `ClipboardContentProvider`
    timestamp reassignment + stationary long-press Pin/Delete fallback + live toggle).
  - **3 `nl-morphe-patches` Gboard 18.5.4 ports**: `AMOLED Dark Keyboard`
    (live-toggled `Lrmt;` `#000000` dark surfaces, default OFF so stock Material You
    dark gray contrast stays normal), `Rambler Toolbar & Revert Extras`,
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

- 2026-11-28 (v32.4.0): Added **SwiftKey Mode** (`Patches → Keyboard → SwiftKey Mode`: in-place Shift-to-Capitalize word at cursor defaulting to Double-tap with Single-tap selectable, smart space trim before punctuation, custom text-expansion shortcuts on Gboard's native strip via `RamblerSwiftKeyShortcutsStore`, and reversible 1-tap SwiftKey Preset with 200 ms long-press); upgraded `RamblerAtMentionStore` + `RamblerAtMentionStripRuntime` for full-email & 1-digit prefix suggestions (`1` → `11name@gmail.com`) with strict OTP/PIN/number/unit guards; phonetically audited all Aksharantar loanwords against CMUdict (`20,609` clean entries, fixing `these→দিজ`, `those→দোজ`, `will→উইল`, `who→হু`, `whose→হুজ`); added generalized trailing-`ো`, full-lexicon single-homophone & missing-hasanta repairs (`পৌষ মাস`, `ফাল্গুন মাস`, `চৈত্র মাস`, `আগের চেয়ে`, `কিবোর্ডে`); and refreshed README/Pages/SVGs/credits.
- 2026-11-28 (v32.3.0): Added hasanta-tolerant & nasal+sibilant (`নস/নশ→ংস`) conjunct repair to `GboardRamblerBanglaLexicon.skeleton3`, added `টুকু`/`তুকু→টুকু` suffix + `-তেশি/-তেশে/-তেশো → -তেছি/-তেছে/-তেছো` verb endings, expanded `JOIN_PAIRS` (`chchh`, `nt`, `nsh`, etc.), added contextual `এখান → এখন` (preserving `এখান থেকে`/`পর্যন্ত`) + `মনে হচ্ছে`/`পুরোপুরি`/`বাংলাটা` fixes, wired the 25k Banglish table into `GboardRamblerSentenceLang.classify()` for Mixed (`abc → বাংলা`), and added the 20–30s Android install timing note to `RamblerEnhancementsActivity` App updates UI.
- 2026-11-28 (v32.2.0): Eliminated `GboardRamblerLoanSpell` first-dictation cold-miss (`client → কলিএনত`, `everything → এভেরয়থিং`) via preload in `RamblerTextPipeline.syncActiveGboardKeyboard` + 150ms `READY.await`, added 9 systematic CMUdict repairs + 60+ curated Bangladeshi loanwords (`ক্লায়েন্ট`, `এভরিথিং`, `অ্যান্ড্রয়েড`, `ফ্লুয়েন্সি`, `মাল্টিলিঙ্গুয়াল`, `আপডেটেড`, `ডাউনলোডেড`), enabled Bengali conversion inside English-heavy Mixed (`abc → বাংলা`) clauses in `GboardRamblerSentenceLang`, added lexicon-backed hyphenated case-suffix joining (`কাল-কে → কালকে`, preserving `বাংলা-ইংলিশ`), and added `PackageManager.INSTALL_SCENARIO_FAST` + 256KB staging buffer in `RamblerAutoUpdater` for faster Android 12–16 updates.
- 2026-11-28 (v32.1.0): Added language-wide Level-3 dental↔retroflex (`ট/ঠ/ত/থ`, `ড/ঢ/দ/ধ`), initial `আ↔অ`, `ৈ→ই`, colloquial verb (`-তেসি/-তেসে → -তেছি/-তেছে`), and Level-4 vowel-tolerant matching to `GboardRamblerBanglaLexicon`, fixed illegal `্য় → ্য` jofola in `GboardRamblerScriptFix.transliterate()` and `GboardRamblerBanglaNormalizer`, strengthened `GEMINI_PURE_BANGLA_INSTRUCTION` for fast colloquial speech, and verified all real-phone dictation samples (`ফাটাফাটি`, `ব্যাপার`, `সবই`, `ঠিকমতো`, `একদম`, `অবস্থা`, `লিখতেছি`, `বেশিরভাগ`, `ক্লিয়ারলি`).
- 2026-11-28 (v32.0.0): Wired live Gemini Rambler+ active-keyboard Bangla Academy script prompt injection into `RamblerCustomInstructionRules.applyToBundle` + per-mic-tap keyboard sync in `captureSessionContext` (pure Bangla & Mixed Bangla+English fluent directly from Gemini; English untouched), made `GboardRamblerBanglaLexicon` 100% non-blocking (0ms dictation delay, lean 89,556-word set loading in <60ms), fixed `সব-i` enclitic order + Unicode dashes in `GboardRamblerSentenceLang` & `GboardRamblerBanglaNormalizer`, fixed `হৈতেচে`→`হচ্ছে`/`বানান তা`→`বানানটা`/`ঠিকমত`→`ঠিকমতো`, and optimized `settings-previews` (4.55MB → 0.89MB) to slim the APK by ~3.9MB with all 60 patches intact.
- 2026-11-28 (v31.9.0): Built full-language 190,405-word offline Bengali orthography & phonetic-skeleton engine (`GboardRamblerBanglaLexicon` + `GboardRamblerBanglaLexiconData` generated by `scripts/build_bangla_lexicon.py` from OpenBangla GPL-3.0 + LibreOffice `bn_BD` GPL-2.0+ + HermitDave FrequencyWords MIT/CC-BY-SA) with Level-1 homophone snap, Level-2 aspiration/`ব্য`↔`বে`/geminate snap, and agglutinative suffix repair; fixed Android 14–16 in-app updater `PackageInstaller` BAL suppression by moving APK staging off the UI thread and switching to an explicit package-scoped `PendingIntent.getBroadcast` foreground `BroadcastReceiver` + 10s watchdog + `MediaStore.Downloads` fallback.
- 2026-11-28 (v31.8.0): Added `GboardRamblerBanglaNormalizer` post-LLM & post-ASR Bengali orthography engine running on 100% of Bengali commits (removed `!containsLatin` early skip), fixed `-i` enclitic (`-আই` -> `ই` / `সবকিছুই`), expanded `EXCEPTIONS` (120+ `shob*`/`bujh*`/`bhalo*`/`shundor*`/`shomoy*` rules, fixed double-nukta strings) & `CURATED_BANGLA_LOANS` (+34 natural loanwords: `হোয়াটেভার`, `ফোনেটিকস`, `রাইট নাও`, etc.), strengthened `ALL_BANGLA_SCRIPT_RULE` with Bangla Academy spelling + Bengali dari (`।`), added full screenshot regression tests, and published `v31.8.0` for in-app OTA update testing.
- 2026-11-28 (v31.7.0): Redesigned `Patches` UI with Rambler Bangla's own Deep Navy / Ocean / Amber visual identity (hero card, `16dp` bordered cards, amber-bar uppercase section headers, zero upstream circular icon badges), moved `@Mention & Email Strip` (`GboardAtMentionSettingsFeature`), `AMOLED Dark Keyboard`, and `Hide launcher icon` to direct 1-tap toggles under `Patches → Keyboard`, moved `Quick-paste direct clipboard chip` alongside `Drag-to-reorder clips` under `Patches → Clipboard`, kept `Rambler Enhancements` strictly voice-focused (`voiceEntries()`), hardened explicit `targetPackage`+`targetClass` on `Settings → About → App auto-updates`, regenerated `GboardSettingsSearchIndexData.java`, and updated README/Pages/SVGs/Morphe manifests.
- 2026-11-28 (v31.6.0): Moved App Auto-Updates under `Settings → About → App updates` (`GboardAboutPageResourcePatch` + `RamblerEnhancementsActivity.SECTION_UPDATES`), redesigned the `Patches` tab into 4 Rambler Bangla sections (`Keyboard`, `Voice & Smart Input`, `Clipboard & Sharing`, `System & Preferences`), moved `AMOLED Dark Keyboard (#000000)`, `Hide launcher icon`, and `Clipboard drag-to-reorder` out of `Rambler Enhancements` into `Patches` via Direct-Boot-safe `GboardRamblerKeyboardPrefs`, regenerated `GboardSettingsSearchIndexData.java`, and updated README/Pages/SVGs/Morphe manifests.
- 2026-11-28 (v31.5.0): Fixed Pure Bangla narration spellings (`CURATED_BANGLA_LOANS` 70+ natural Bengali loanwords + Avro Tier-1 priority in `layout == 1` + systematic `cleanCmuLoanSpelling` across 17,841 CMUdict entries + hyphenated Bengali enclitics `সব-i` -> `সব-ই`), added SHA-256 verified In-App GitHub Auto-Updater (`RamblerAutoUpdater` + `PackageInstaller` + `REQUEST_INSTALL_PACKAGES`), and added beginner-friendly 2-Minute Setup Guide to README & GitHub Pages.
- 2026-11-28 (v31.4.0): Implemented true 3-keyboard active-mode Rambler dictation (`English (US)` = English/phonetic Latin, `বাংলা` = 100% Bangla, `abc → বাংলা` = clause-aware intra-sentence Mixed Bangla + English across both `GboardRamblerLiteScriptRuntime` LLM prompt and `GboardRamblerScriptFix` / `GboardRamblerSentenceLang` post-ASR using live `Lpev`/`ImeDef` detection; fixed `containsBengali` bailout & disabled `GboardRamblerLayoutPair` default English hijacking), added adaptive Rambler Bangla (`র`) app logo (`ic_rambler_bangla_launcher`) and live Hide launcher icon toggle (Issue #39), updated homepage/Pages/credits, and responded to Issues #19 and #39.
- 2026-11-28 (v31.3.1): Fixed ART `VerifyError` crash in `Lrmt;-><init>` caused by R8 reusing `p1` (`Context`) as an `int` before `return-void` (switched AMOLED toggle check to zero-arg `RamblerEnhancementsSettings.isAmoledDarkKeyboardEnabled()`), added clobbered-`p1` unit test, strict JADX clean-decompile checks, and real ART `cmd package compile -m verify -f` + live IME activation check in `android-smoke.yml`.
- 2026-11-27 (v31.3.0): Added live in-app Settings toggle for `AMOLED Dark Keyboard` (default OFF so stock dark gray contrast stays normal) and persistent 4-direction `Clipboard Drag-to-Reorder` (`fqi` `ItemTouchHelper` patch — 60 patches total), updated GitHub homepage & SVGs, maintainer-signed APK (`679cfdec...`) + API 35 KVM smoke test.
- 2026-11-27 (v31.2.0): Replaced floating `@` overlay with true native Gboard
  suggestion-strip integration (`pbh` / `pbo` / `owu` / `phr` candidate pipeline;
  zero white box; inherits AMOLED/Material You/Frosted Glass/Custom themes +
  native drag-up-to-remove), kept 100% personalized standalone `@` learning from
  v31.1.0, signed via persistent maintainer certificate (`679cfdec...`), passed
  CI (`#45901580767`), Static suite (`#45901580798`), and Android 15 KVM smoke
  test (`#45902128012`), merged PR #33 (`f4f0123`), published `v31.2.0`, and
  synced `README.md`, `docs/index.html`, `docs/PROJECT_BRAIN.md`, and `HANDOFF.md`.
- 2026-11-27 (v31.1.0): Made `@` suggestions 100% personalized (no static
  standalone defaults; learns on space/punctuation, Send/Enter, field switch,
  hide, and voice dictation; manual add dialog in Settings), switched APK
  release signing to persistent maintainer key (`679cfdec...`) via
  `private-test-build.yml`, merged PR #32 (`efe1b6b`), and published `v31.1.0`.

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
