# Changelog

All notable changes to Rambler Bangla. Dates are AEST/AEDT.

## [31.2.0] - 2026-11-27

**True Native Gboard Suggestion-Strip Integration for `@Mention` Suggestions (Zero Floating Overlay / Zero White Background).**

- **Native Gboard suggestion strip (`InputBundle` / `IKeyboardDelegate` / `CandidateViewBuilder`):** Replaced the floating custom `HorizontalScrollView` pill bar with direct native `Candidate` (`owu`) injection into Gboard's own suggestion strip (`pbh.K`, `pbo.aa`, `phr.aw`). Personalized `@handles` (`@grok`, `@claude`, etc.) now render natively inside Gboard's suggestion bar with exact theme matching (AMOLED `#000000`, Material You Dark/Light, Frosted Glass blur, and Custom Themes), native typography/dividers, tap-to-insert (`-10002`), and native long-press/drag-up "Remove suggestion" (`-10031`).
- **Maintainer-signed APK:** Signed via `.github/workflows/private-test-build.yml` (`679cfdec...`) so upgrading from `v31.1.0` installs seamlessly in-place with zero uninstall and zero data loss.

## [31.1.0] - 2026-11-27

**100% Personalized `@Mention` Strip Suggestions & Persistent Maintainer-Key APK Signing.**

- **Personalized `@` suggestions (zero fixed standalone defaults):** Removed hardcoded `DEFAULT_EMAIL_DOMAINS` backfill from standalone `@` mentions and defaulted Gboard's fixed `enable_email_provider_completion` override OFF so typing `@` / `@g` surfaces only your own learned `@handles` (`@grok`, `@claude`, etc.), ranked by frequency and recency. Common email-domain fallback now applies only in explicit email-address context (`name@g`).
- **Reliable learning across every input flow:** Captures all newly completed `@handles`/`@domains` in the buffer, flushes pending `@tokens` on Send/Enter/field-clear, field-switch (`onStartInputView`), and keyboard close (`onInputWindowHidden`) without false-learning backspaced typos, and learns dictated `@handles` in `RamblerTextPipeline` (strictly fail-closed in password/incognito fields).
- **In-app `@Mention` management:** Added an **Add custom @mentions or domains** dialog and top-learned preview inside Rambler Bangla Settings alongside live toggle and Clear All.
- **Persistent maintainer signing key:** Signed the `v31.1.0` Release APK with the repository's persistent maintainer certificate (`679cfdec...`) via GitHub Actions (`private-test-build.yml`), enabling seamless in-place APK upgrades on Android without uninstalling.

## [31.0.0] - 2026-11-27

**Rambler+ Activation Fix, `nl-morphe-patches` Integration, SwiftKey-Style `@Mention` Strip Suggestions (59 Morphe Patches), Phonetic Bangla Voice Handoff & In-App Branding.**

- **Fixed Rambler+ activation under Voice typing:** Forced `enable_agentic_dictation`, `config_agentic_dictation`, `enable_jetson_in_toolbar`, `enable_rambler_al_toolbar`, `enable_rambler_toolbar_at_cursor_position`, and `ad_activation_type = 2L` unconditionally in both `GboardRamblerStockPolicy` (`oki.g()`) and `RamblerFlagRuntime` (`oki.x()`), matching stock Pixel rollout and `johninnld/nl-morphe-patches` so `ModuleManager` always loads `AgenticDictationExtension` and selecting **Rambler+** activates immediately without restart.
- **Phonetic Bangla voice dictation reliability:** Wired Gboard's live active language tag (`fhv.w()`) into `GboardRamblerScriptFix` on extension activation, defaulted EN/BN multilingual pairing (`GboardRamblerLayoutPair`) ON for any enabled `bn*` keyboard, and added comprehensive E2E phonetic Bangla + CMUdict loanword + multilingual + protected-span unit tests.
- **SwiftKey-style `@Mention & Email Strip Suggestions` (new Morphe patch + live toggle):** Automatically learns typed `@handles` (e.g. `@grok`, `@claude`) and email domains (e.g. `@gmail.com`) on-device, displays tap-to-insert Material You pill chips on the suggestion strip when typing `@` / `@prefix`, supports long-press to forget and Settings clear/toggle, enables Gboard's native `enable_email_provider_completion` flag, coexists cleanly with Calculator & Manual Incognito, and stays strictly fail-closed in password/incognito fields.
- **Integrated `johninnld/nl-morphe-patches` Gboard features for Gboard 18.5.4 (3 new Morphe patches, 55 → 59 total with `@Mention` strip):**
  - `AMOLED Dark Keyboard` — dynamic Material 3 `rmt` pure `#000000` dark surface override.
  - `Rambler Toolbar & Revert Extras` — floating Rambler toolbar overflow menu, keep rewritten text on revert, and one-tap direct clipboard quick-paste chip.
  - `Hidden Flags Override` — native Gboard 18.5.4 `okf.g(olk.OVERRIDE)` → `okq.e()` live flag override store with toggles inside Settings.
- **In-app author & branding:** Updated in-app author/repo fields (`Patches`, `About`, and `Rambler Bangla` settings) to `muhib-karim` / `Rambler Bangla` while preserving complete, source-license-compliant upstream credits in `ATTRIBUTION.md`, `THIRD-PARTY-NOTICES.md`, `NOTICE`, `README.md`, and `docs/index.html`.

## [30.0.0] - 2026-11-27

Unified **Morphe Patcher 2.1.0** patch suite targeting Gboard `18.5.4.993608717-release-arm64-v8a` with **55 selectable Morphe patches** in a single `patches-30.0.0.mpp` bundle, combining Rambler Bangla's Bengali-first phonetic/voice engine with all upstream features from `abotmaker/gboard-rambler-enhancements` (v1.3.4) and `jasonwu1994/Gboard-patches` (v4.5.0).

- **Rambler Bangla Lite Script Policy (Morphe patch):** Dynamically resolves Gboard 18.5.4's JetsonLite cleanup builder (`fja.d`) and prompt owner (`ezn.b`) using fail-closed SHA-256 fingerprint verification, supporting both 18.5.4 and 18.3.1 anchor orderings. Preserves Bengali Unicode for `bn-BD`, `bn-IN`, and `bn-Beng` while respecting explicit `bn-Latn` Romanization.
- **Rambler Bangla Phonetic & Multilingual Engine (Morphe patch):** Ports the complete V29.3+/V29.5 Bengali phonetic transliteration engine (`GboardRamblerScriptFix`, `GboardRamblerSegmentLock`, `GboardRamblerSentenceLang`, `GboardRamblerLoanSpell`, `GboardRamblerLoanTable`, `GboardRamblerTier1`, `GboardRamblerEnglishWords`, `GboardRamblerDiag`, `GboardRamblerLayoutPair`) into the Morphe extension, wired ahead of `RamblerTextPipeline` with fail-closed password/sensitive/incognito field bypass and a native Material You **Rambler Bangla (phonetic & script)** Settings page.
- **Gboard Rambler Enhancements (`abotmaker/gboard-rambler-enhancements` v1.3.4, GPL v3.0):** All 7 patches integrated — Hex by Anomaly Waveform Animation (MIT), Custom Instructions & Per-App Rules, Personal Dictionary (`MUSE_STATS`), Contact Names Sync, Cursor-Aware & Append-Only Editing, App Context, and Rambler Productivity Tools (Smart Search Bars, Spacebar Long-Press Rambler, Toolbar quick-access button, Fix & Learn, On-Device Dictation Stats, Hands-Free Voice Send & Search, Voice Snippets, Find & Replace, Dictation History, Auto Parallel Retry, Longer Dictation Sessions, and JSON Backup & Restore).
- **Gboard Patches / GboardWu (`jasonwu1994/Gboard-patches` v4.5.0, GPL v3.0):** All 46 patches integrated — Advanced Voice Typing, AI Writing Tools, Backup & Restore, Clipboard Enhancements & Custom Character Limit, Custom Theme (Rboard/ZIP), Frosted Glass, Web Clipboard, LAN FTP Server, Floating Web Search, Simple Calculator, OCR / Scan Text, Toolbar Editing Buttons, Long-Press Editing Shortcuts, Swipeable Custom Top Row, Swipe Down to Dismiss, Shift + Backspace Forward Delete, Incognito Mode Toggle, Custom Symbols, G Logo on Spacebar, Rounded Keyboard Panel, Keypress Vibration Intensity Control, Dictionaries & Predictions, Package Rename (defaulting to `Rambler Bangla` / `com.aidev2024.ramblerbangla`), Signature Bypass, and all Gboard feature unlocks.
- **Attribution & Notices:** Full third-party credits and licenses documented in `ATTRIBUTION.md`, `THIRD-PARTY-NOTICES.md`, `NOTICE` (Morphe Section 7c), `NOTICE-cmudict.txt`, and `README.md`.
- **Legacy 18.3.1 standalone patcher & CI preserved:** All 88 Python unit tests and 22 static-suite checks remain intact; historical `v29.3-smali-hooks.diff` moved to `docs/historical/v29.3-smali-hooks.diff`.

## Unreleased (in review, PR #26)

Identity-rename (`rename/`) correctness fix plus its end-to-end gate. No patcher, runtime, fingerprint or signing changes, and no APKs.

- Fix: `rename/axml_pool.py` `StringPool.rebuild` wrote the Python code-point count into the AXML string-pool length prefixes; the format contract is UTF-16 code units, so a replacement value with an astral character (e.g. an emoji in the app label) produced a corrupt pool entry: aapt2 logs "Bad string block" and reads an empty label, androguard raises `ResParserError`. Covered by unit tests in `tests/python/test_axml_pool.py`.
- Static suite gains an end-to-end identity-rename round-trip gate: a label-variant fixture (`android:label="PixelBoard"`) is renamed to a label containing an astral character, and the exact label must read back through aapt2's strict string-pool parser and androguard. The fixture carries no package-identity strings, so the gate exercises the manifest label rewrite only, not package, DEX or arsc renaming. The suite is now 21 checks; README, CONTRIBUTING, RELEASING, ARCHITECTURE and the Pages site quote the new count, and a homepage check fails on any stale quoted suite count.

## V29.5 - 2026-10-24 (in review, not released)

Clipboard Recent | History. Static and host-tested only: no phone or emulator has run this build yet. It is an overlay on the maintainer's V29.4 rc4 build, not a published release.

- The clipboard panel gets a small Recent | History tab row above the clip list. Recent is the stock list, unchanged; ClipOrder, ClipDrag, ClipSmooth and ClipAccess still act on it. History is a scrolling list of the last 50 unique text clips, newest first, above up to 10 pinned clips that do not count towards the 50. Copying the same text again moves it to the top. Tap pastes into the current field; long-press offers Pin or Unpin and Delete.
- History survives keyboard restarts. It lives in one app-private file in the no-backup directory, written atomically, and is never read before the phone is first unlocked. No network code.
- Recording rides on Gboard's own clipboard read, so it works while the panel is closed. It only records live copies (clipboard timestamp within 10 seconds) of plain text up to 32,768 characters. It skips clips marked `IS_SENSITIVE`, clips Gboard masks, Gboard incognito, clipboard opt-in off, and copies made while a password or no-learning field is active, even if focus moves on before the read is handled. Deleting an entry leaves no copy or hash of its text. History is hidden in those fields too.
- New runtime classes in `extension-src/.../rambler/` (`GboardRamblerClipHistory`, `ClipHistoryPanel`, `ClipHistoryStore`, `ClipHistoryPolicy`, `ClipHistoryGboardPrivacy`). Seven hook calls in seven Gboard methods, each pinned by method hash in `fingerprints/clipboard-history-rc4.json`: IME start, finish and destroy (`aeij`), the clipboard read (`kvk.call`), and panel open, close and view discard (`ClipboardKeyboard`).
- `scripts/build_clip_history.sh BASE OUTPUT` refuses anything but the exact rc4 APK. It checks every hooked method's hash and anchor, that every hook calls an existing runtime method with the right number of arguments, and that every Gboard name the runtime reaches by reflection exists. It also checks that untouched classes and APK entries are unchanged. It adds the runtime as `classes6.dex` and writes an unsigned, zipaligned APK. No resource or manifest changes.
- 9 new Python unit tests (49 in total), including a JVM harness for the store and privacy policy, and synthetic hook, guard and ZIP fixtures.

## [29.4.1] - 2026-10-21

Docs only. No patcher, runtime, fingerprint or signing changes, and no APKs.

- README rewritten as the project homepage: what and why, architecture mermaid (fingerprint guard, smali patch, policy runtime, verify), device-free CI, build from source, fail-closed safety, source-only and legal note, FAQ, roadmap and links. Latest release now points at v29.4.
- GitHub Pages landing page restyled to match: mobile-first, WCAG AA colour tokens, skip link and landmarks, native FAQ, no scripts, external fonts or trackers.
- New stdlib unit tests (`tests/python/test_docs_homepage.py`) keep the README and the site honest: required sections, badges, local links, quoted test count, contrast, no trackers. The CI unit job now runs 40 tests.
- CI: `ci.yml` bumps `actions/checkout` 4 to 7, `actions/setup-python` 5 to 7 and `actions/setup-java` 4 to 6 (Dependabot #15, #17, #16).
- Docs index lists the V29.4 release notes; project memory files for coding agents (`AGENTS.md`, `CLAUDE.md`, `docs/PROJECT_BRAIN.md`), `TASKS.md`, `HANDOFF.md` and `SKILLS_USED.md`.

## V29.4 - 2026-10-18

Source-only release. No runtime or conversion changes against V29.3. Details: [`docs/V29.4-RELEASE-NOTES.md`](docs/V29.4-RELEASE-NOTES.md).

- New maintainer signing key (certificate SHA-256 `679cfdec...2e78`); the V29.3 key is lost. Builds signed with the new key cannot install over V29.3 builds: uninstall once first. Record: [`ledger/v29.4-provenance.md`](ledger/v29.4-provenance.md).
- The maintainer key now lives only in GitHub Actions secrets (plus an offline backup kept by the maintainer). New manual workflow `maintainer-key-check.yml` signs the synthetic fixture with it and checks the signer; it publishes no APK.
- Docs: portfolio README, architecture, user guide and releasing docs, docs index; community files (code of conduct, contributing, PR and issue templates, CODEOWNERS, Dependabot).
- CI: `ci.yml` runs 26 Python unit tests for the patcher helpers and the static suite on every push and pull request.
- Patcher fix: array parameters count as one register slot in `dex_patch.py`, whatever the element type.
- Project website (GitHub Pages), banner, brand sheet, icon showcase and favicon (2026-10-05 to 2026-10-08).
- Fixture hygiene: personal-looking emails in the v29.3 corpus, target and golden fixtures replaced with `example.com` addresses.
- Removed the temporary clipboard-mask and instrumented-settings diagnostic probes and their workflows.
- Dependency bumps: `actions/checkout` 4.2.2 to 7.0.1, `actions/upload-artifact` 4.6.2 to 7.0.2.

### Maintainer test builds 245 to 253 - October 2026

Private builds, not public downloads, and not part of this source release. Evidence levels in the README's "Maintainer builds, October 2026" table.

- 253: compatibility update, two static reviews passed; the maintainer reports the Gboard AI writing-tools icon is back on their phone. Cause not proven.
- 251: removes the pin exemption for the stray "123" label (static review; phone check pending).
- 250: unpinned path clean on the phone; pinned still showed "123".
- 247 to 249: spacebar label and list/popup candidates; not shipped.
- Planned: clause segmentation, phonetic typing with EN/BN toggle, Bangla (Latin).

## V29.3 - 2026-09-24

- One language per sentence in multilingual voice typing.
- Real Bangla spellings for English words (CMU Pronouncing Dictionary plus reviewed overrides).
- Protected text: #hashtags, @handles, links, emails and times stay in Latin letters.
- Clipboard drag-to-reorder (in development).
- Host corpus of 292 cases passes all gates. Details: [`docs/V29.3-RELEASE-NOTES.md`](docs/V29.3-RELEASE-NOTES.md).

## V29 - 2026-09-23

- Bangla spelling normalization: garble-resistant English near-match demotion and a 2,265-pair roman-to-script table.
- Design: [`docs/V29-DESIGN.md`](docs/V29-DESIGN.md).

## V28 / v28d

- Segment-locked multilingual dictation. Last stable baseline. Evidence: [`docs/EVIDENCE.md`](docs/EVIDENCE.md).
