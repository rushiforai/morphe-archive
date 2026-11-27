# Attribution and licensing

Rambler Bangla v31.0.0 is a unified **GNU GPL v3.0** Morphe patch suite for Gboard 18.5.4+.
It builds on, integrates, and credits the following open-source projects in full compliance
with their respective source licenses (GPL-3.0, MIT, MPL-2.0, BSD, and Morphe Section 7c):

## Core Upstream Patch Suites

- **Gboard Patches / GboardWu** by Jason Wu (`@jasonwu1994`) —
  https://github.com/jasonwu1994/Gboard-patches — **GNU GPL v3.0**.
  All 46 Gboard keyboard, clipboard, theme, Frosted Glass, Web Clipboard, LAN FTP,
  Calculator, Advanced Voice Typing, OCR, Backup & Restore, Toolbar Editing, Package Rename,
  and Signature Bypass patches, along with the target-binding compiler and extension framework.
- **Gboard Rambler Enhancements** by `@abotmaker` —
  https://github.com/abotmaker/gboard-rambler-enhancements — **GNU GPL v3.0**.
  All 7 Rambler power-user patches (Hex Waveform Animation, Custom Instructions & Per-App
  Rules, Personal Dictionary `MUSE_STATS`, Contact Names Sync, Cursor-Aware & Append-Only
  Editing, App Context, and Rambler Productivity Tools including Smart Search Bars, Spacebar
  Long-Press Rambler, Toolbar button, Fix & Learn, On-Device Dictation Stats, Voice
  Send/Search, Snippets, Find & Replace, Dictation History, Auto Parallel Retry, and JSON
  Backup/Restore) and the dynamic bytecode resolver.
- **`nl-morphe-patches` (Dutch App Patches)** by `@johninnld` —
  https://gitlab.com/johninnld/nl-morphe-patches (docs: https://nl-morphe-patches-ed90fa.gitlab.io/apps/gboard/) — **GNU GPL v3.0**.
  AMOLED Dark Keyboard (`#000000` Material 3 dark palette override), Rambler Toolbar & Revert
  Extras (`enable_rambler_al_toolbar_overflow_menu`, `rambler_preserve_rewritten_text_on_revert`),
  unconditional Rambler cloud flag activation pattern (`GboardRamblerCloudRuntime`), native
  `OVERRIDE`-layer Hidden Flags architecture, and original inspiration for Rambler Custom
  Instructions, `MUSE_STATS` Personal Dictionary, Contact Names syncing, Cursor-Aware Editing,
  and App Context.
- **Hex by Anomaly** by Christopher Langton —
  https://github.com/anomalyco/hex — **MIT License**.
  Hex Dot Scope, Hex Android Wave, and Processing (`Flow`, `Pulse`, `Sweep`) waveform
  animations ported to Android Canvas. Full MIT notice in [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md).
- **PixelBoard** by Akshay Kadam (`@Akshayykadam`) —
  https://github.com/Akshayykadam/PixelBoard — **GNU GPL v3.0**.
  Original extension-carrier architecture, runtime-ABI conventions, and early 18.3.1 Rambler
  foundation from which Rambler Bangla V28–V29 evolved.
- **Morphe** (`MorpheApp/morphe-patcher`, `MorpheApp/morphe-cli`) —
  https://morphe.software — **GNU GPL v3.0** (with Section 7c Project Name Restriction,
  see [`NOTICE`](NOTICE)).
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

## Licensing & Non-Affiliation

This repository is licensed under the **GNU General Public License v3.0** (see [`LICENSE`](LICENSE)),
with full third-party notices preserved in [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md)
and [`NOTICE`](NOTICE).

Rambler Bangla is an independent open-source project and is **not affiliated with Google LLC**
nor with the **Morphe** project. No Google Gboard APKs, DEX dumps, smali dumps of Google
classes, model files, or signing keys are committed to this repository.
