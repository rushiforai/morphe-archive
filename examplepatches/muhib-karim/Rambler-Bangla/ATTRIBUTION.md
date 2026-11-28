# Attribution and licensing

Rambler Bangla v32.4.0 is a unified **GNU GPL v3.0** Morphe patch suite for Gboard 18.5.4+.
It builds on, integrates, modifies, and explicitly credits the following open-source projects
in full compliance with their respective source licenses (GNU GPL v3.0 Sections 5a/5b/7c, MIT,
MPL-2.0, CC-BY-4.0, CC-BY-SA, and BSD):

## Core Upstream Patch Suites

- **Gboard Patches / GboardWu** by Jason Wu (`@jasonwu1994`) —
  https://github.com/jasonwu1994/Gboard-patches — **GNU GPL v3.0**
  (snapshot `aa6cb2bb`, 2026-11-26; modified 2026-11-27 by `muhib-karim`).
  All 46 Gboard keyboard, clipboard, theme, Frosted Glass, Web Clipboard, LAN FTP,
  Calculator, Advanced Voice Typing, OCR, Backup & Restore, Toolbar Editing, Package Rename,
  and Signature Bypass patches, along with the target-binding compiler and extension framework.
- **Gboard Rambler Enhancements** by `@abotmaker` —
  https://github.com/abotmaker/gboard-rambler-enhancements — **GNU GPL v3.0**
  (snapshot `5f7e50c2`, v1.3.4, 2026-11-26; modified 2026-11-27 by `muhib-karim`).
  All 7 Rambler power-user patches (Hex Waveform Animation, Custom Instructions & Per-App
  Rules, Personal Dictionary `MUSE_STATS`, Contact Names Sync, Cursor-Aware & Append-Only
  Editing, App Context, and Rambler Productivity Tools including Smart Search Bars, Spacebar
  Long-Press Rambler, Toolbar button, Fix & Learn, On-Device Dictation Stats, Voice
  Send/Search, Snippets, Find & Replace, Dictation History, Auto Parallel Retry, and JSON
  Backup/Restore) and the dynamic bytecode resolver.
- **`nl-morphe-patches` (Dutch App Patches)** by `@johninnld` —
  https://gitlab.com/johninnld/nl-morphe-patches (docs: https://nl-morphe-patches-ed90fa.gitlab.io/apps/gboard/) — **GNU GPL v3.0**
  (snapshot `f5607c15`, 2026-11-26; adapted for Gboard 18.5.4 on 2026-11-27 by `muhib-karim`).
  AMOLED Dark Keyboard (`#000000` Material 3 dark palette override), Rambler Toolbar & Revert
  Extras (`enable_rambler_al_toolbar_overflow_menu`, `rambler_preserve_rewritten_text_on_revert`,
  `enable_system_clipboard_direct_paste_for_quick_paste`), unconditional Rambler cloud flag
  activation pattern (`GboardRamblerCloudRuntime`), native `OVERRIDE`-layer Hidden Flags
  architecture, and original inspiration for Rambler Custom Instructions, `MUSE_STATS` Personal
  Dictionary, Contact Names syncing, Cursor-Aware Editing, and App Context.
- **PixelBoard** by Akshay Kadam (`@Akshayykadam`) —
  https://github.com/Akshayykadam/PixelBoard — **GNU GPL v3.0**
  (modified 2026-09 to 2026-11-27 by `muhib-karim`).
  Original extension-carrier architecture, runtime-ABI conventions, and early 18.3.1 Rambler
  foundation from which Rambler Bangla V28–V31 evolved.

## Embedded & Compatible Open-Source Components

- **Hex by Anomaly** by Christopher Langton —
  https://github.com/anomalyco/hex — **MIT License**.
  Hex Dot Scope, Hex Android Wave, and Processing (`Flow`, `Pulse`, `Sweep`) waveform
  animations ported to Android Canvas. Full MIT notice in [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md).
- **QuickJS / QuickJS-NG** (Fabrice Bellard, Charlie Gordon, QuickJS-NG contributors) —
  https://github.com/quickjs-ng/quickjs — **MIT License**.
  Native JavaScript engine (`libgboardpatches_quickjs.so`) used by `Swipeable Custom Top Row`
  (inherited from `jasonwu1994/Gboard-patches`). Full MIT notice in [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md).
- **Morphe** (`MorpheApp/morphe-patcher`, `MorpheApp/morphe-cli`) —
  https://morphe.software — **GNU GPL v3.0** (with Section 7c Project Name Restriction,
  see [`NOTICE`](NOTICE)).
- **Rboard Theme Repository** (`GboardThemesV3/Themes`) — community keyboard themes supported
  by the `Custom Theme` patch.
- **smali / baksmali** (JesusFreke) — **BSD License** (fetched at build time, not vendored).

## Rambler Bangla Linguistic Data

- **Avro Keyboard phonetic dictionary** (`OthmanAhmad/Avro Keyboard`,
  **Mozilla Public License 2.0**) — the romanized-Bangla to Bengali Unicode spelling pairs
  underlying the V29 Tier-1 normalization table (2,247 alphabetic pairs plus 18 additions and
  19 corpus overrides; total 2,265 pairs). MPL 2.0 text: https://mozilla.org/MPL/2.0/
- **CMU Pronouncing Dictionary** (Carnegie Mellon University, **BSD-style license**) —
  pronunciations used by `data/loanspell/gen_java.py` to generate the V29.3+ English-to-Bangla
  loanword table (`data/loanspell/loan-table.tsv` and `GboardRamblerLoanTable.java`).
  Full notice: [`NOTICE-cmudict.txt`](NOTICE-cmudict.txt).
- **OpenBangla Keyboard Dictionary** (`OpenBangla/OpenBangla-Keyboard`, **GNU GPL v3.0**) —
  https://github.com/OpenBangla/OpenBangla-Keyboard — 159,384 authoritative Bengali words used
  by `scripts/build_bangla_lexicon.py` to build `GboardRamblerBanglaLexiconData.java`.
- **LibreOffice `bn_BD` Hunspell Dictionary** (`LibreOffice/dictionaries`, **GNU GPL v2.0+ / LGPL / MPL**) —
  https://github.com/LibreOffice/dictionaries/tree/master/bn_BD — 79,224 Bangladesh Bangla Academy
  root entries combined into the 190,405-word offline valid Bengali lexicon.
- **HermitDave FrequencyWords (`bn_full.txt`, `en_50k.txt`)** (`hermitdave/FrequencyWords`, **MIT / CC-BY-SA**) —
  https://github.com/hermitdave/FrequencyWords — OpenSubtitles spoken Bengali & English frequency rankings
  used to rank phonetic-skeleton spell-correction candidates (`v31.9.0+`) and top-25k loanwords (`v32.2.0`).
- **AI4Bharat Aksharantar (`ben`)** (`ai4bharat/Aksharantar`, **CC-BY-4.0**) —
  https://huggingface.co/datasets/ai4bharat/Aksharantar — human-verified Roman-to-Bengali transliteration
  pairs compiled by `scripts/build_bangla_loan_and_phonetic.py` into `GboardRamblerLoanTableData.java`
  (20,609 CMU-validated English→Bengali loanwords after v32.4.0 phonetic audit) and
  `GboardRamblerBanglishData.java` (25,000 Shift-free Banglish words strictly validated against
  OpenBangla + `bn_BD`, `v32.2.0+`).

## Licensing & Non-Affiliation

This repository is licensed under the **GNU General Public License v3.0** (see [`LICENSE`](LICENSE)),
with full third-party notices and GPL v3.0 Section 5(a)/7(c) notices preserved in
[`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md), [`NOTICE`](NOTICE), and
[`docs/LICENSING-AUDIT.md`](docs/LICENSING-AUDIT.md).

Rambler Bangla is an independent open-source project and is **not affiliated with Google LLC**
nor with the **Morphe** project. No Google Gboard APKs, DEX dumps, smali dumps of Google
classes, model files, or signing keys are committed to this repository.
