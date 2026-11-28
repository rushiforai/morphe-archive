# Third-Party Notices & Credits

This repository is licensed under the **GNU General Public License v3.0** ([`LICENSE`](LICENSE)).
It combines, modifies, and explicitly credits the following open-source projects in full
compliance with their respective licenses (GNU GPL v3.0 Sections 5(a)/5(b)/7(c), MIT, MPL-2.0,
and BSD). Modification notices with source commit snapshots and dates are also preserved in
[`NOTICE`](NOTICE).

---

## 1. Gboard Patches / GboardWu (`jasonwu1994/Gboard-patches`)

Provides the 46 Gboard keyboard, clipboard, theme, Frosted Glass, Web Clipboard, LAN FTP,
Calculator, Advanced Voice Typing, OCR, Backup & Restore, Package Rename, and Signature Bypass
Morphe patches, target-binding compiler, and extension framework:

- **Repository:** https://github.com/jasonwu1994/Gboard-patches
- **Author:** Jason Wu (`@jasonwu1994`)
- **Upstream Snapshot:** commit `aa6cb2bba1a0b9d1662469dec4f21e39ef4eb790` (2026-11-26)
- **License:** **GNU General Public License v3.0** (with Morphe Section 7c notice)
- **Modifications (2026-11-27, muhib-karim):** Unified into Rambler Bangla (`v30.0.0`–`v31.2.0`),
  forced `enable_agentic_dictation` unconditionally true in `GboardRamblerStockPolicy`,
  defaulted `Package Rename` to `Rambler Bangla` / `com.aidev2024.ramblerbangla`, and updated
  in-app package metadata.

---

## 2. Gboard Rambler Enhancements (`abotmaker/gboard-rambler-enhancements`)

Provides the 7 Rambler enhancement Morphe patches (Waveform Animation, Custom Instructions &
Per-App Rules, Personal Dictionary `MUSE_STATS`, Contact Names Sync, Cursor-Aware &
Append-Only Editing, App Context, and Rambler Productivity Tools), native Material You
settings hub, and dynamic bytecode resolver:

- **Repository:** https://github.com/abotmaker/gboard-rambler-enhancements
- **Author:** `@abotmaker`
- **Upstream Snapshot:** commit `5f7e50c210c8f29c01153387303f36f3def40f41` (v1.3.4, 2026-11-26)
- **License:** **GNU General Public License v3.0**
- **Modifications (2026-11-27, muhib-karim):** Unified into Rambler Bangla (`v30.0.0`–`v31.2.0`),
  extended `RamblerFlagRuntime`, `RamblerTextPipeline`, `RamblerEnhancementsActivity`, and
  `RamblerSharedPatches` with Bengali phonetic engine hooks, `nl-morphe-patches` 18.5.4 ports,
  and native Gboard suggestion-strip `@` mention integration.

---

## 3. `nl-morphe-patches` / Dutch App Patches (`johninnld/nl-morphe-patches`)

Provides the **AMOLED Dark Keyboard** Material 3 dark-surface override design, **Rambler
Toolbar & Revert Extras** (`enable_rambler_al_toolbar_overflow_menu`,
`rambler_preserve_rewritten_text_on_revert`, `enable_system_clipboard_direct_paste_for_quick_paste`),
**Hidden Flags Override** native `OVERRIDE` flag-store architecture, unconditional **Rambler
voice typing** flag activation pattern (`GboardRamblerCloudRuntime`), and original inspiration
for Rambler Custom Instructions, `UserFeatureCache` `MUSE_STATS` Personal Dictionary, Contact
Names syncing, Cursor-Aware Editing, and App Context:

- **Repository:** https://gitlab.com/johninnld/nl-morphe-patches
- **Documentation:** https://nl-morphe-patches-ed90fa.gitlab.io/apps/gboard/
- **Author:** `@johninnld`
- **Upstream Snapshot:** commit `f5607c15c12448e923dcbc3059bbe3f0b53fe3c4` (2026-11-26)
- **License:** **GNU General Public License v3.0** (with Morphe Section 7c notice)
- **Modifications (2026-11-27, muhib-karim):** Ported to Gboard `18.5.4.993608717-release-arm64-v8a`
  in `NlMorpheGboardPatches.kt` and `RamblerHiddenFlagOverrideRuntime.java` (`v31.0.0`–`v31.2.0`).

---

## 4. Hex by Anomaly (`anomalyco/hex`)

The **Hex Dot Scope** (`DotScopeSimulation` + `DotScopeShader` Strip trace & iOS halo looks),
**Hex Android Wave** (`VoiceVisualizer` 7-row scrolling sine dot wave), and **Processing**
(`Flow`, `Pulse`, `Sweep`) waveform animations were ported to Android Canvas from **Hex by
Anomaly** (via `abotmaker/gboard-rambler-enhancements`):

- **Repository:** https://github.com/anomalyco/hex
- **License:** **MIT License**

```text
MIT License

Copyright (c) 2026 Christopher Langton

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 5. QuickJS / QuickJS-NG (`quickjs-ng/quickjs`)

The `Swipeable Custom Top Row` script evaluator bundles a prebuilt native QuickJS-NG runtime
(`extensions/extension/native-payload/arm64-v8a/libgboardpatches_quickjs.so`, inherited from
`jasonwu1994/Gboard-patches`):

- **Repository:** https://github.com/quickjs-ng/quickjs
- **License:** **MIT License**

```text
MIT License

Copyright (c) 2017-2021 Fabrice Bellard
Copyright (c) 2017-2021 Charlie Gordon
Copyright (c) 2023-present QuickJS-NG Contributors (Ben Noordhuis, Saúl Ibarra Corretgé, et al.)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 6. PixelBoard (`Akshayykadam/PixelBoard`)

Original patch-layer extension-carrier conventions and 18.3.1 Rambler foundation:

- **Repository:** https://github.com/Akshayykadam/PixelBoard
- **Author:** Akshay Kadam (`@Akshayykadam`)
- **License:** **GNU General Public License v3.0**
- **Modifications (2026-09 to 2026-11-27, muhib-karim):** Extended with Bengali Unicode script
  preservation, V29.3+ phonetic & loanword engine, and Morphe 18.5.4 integration.

---

## 7. Morphe (`MorpheApp`)

Built with the **Morphe Patcher** toolchain and compatible with **Morphe Manager** (subject to
the Morphe Section 7c Project Name Restriction preserved verbatim in [`NOTICE`](NOTICE)):

- **Website:** https://morphe.software
- **Repository:** https://github.com/MorpheApp/morphe-patcher
- **License:** **GNU General Public License v3.0** (with Section 7c Project Name Restriction)

---

## 8. Rboard Theme Repository (`GboardThemesV3`)

The `Custom Theme` patch (inherited from `jasonwu1994/Gboard-patches`) optionally imports
community keyboard themes from the Rboard Theme repository (`GboardThemesV3`):

- **Repository:** https://github.com/GboardThemesV3/Themes

---

## 9. Avro Keyboard Phonetic Dictionary, CMU Pronouncing Dictionary & smali/baksmali

- **Avro Keyboard** (`OthmanAhmad/Avro`) — **Mozilla Public License 2.0**
  (https://mozilla.org/MPL/2.0/) — V29 Tier-1 Bangla normalization table (2,265 pairs).
- **CMU Pronouncing Dictionary** (Carnegie Mellon University) — **BSD-style license**
  (full notice verbatim in [`NOTICE-cmudict.txt`](NOTICE-cmudict.txt)) — V29.3+ English
  loanword spelling table.
- **smali / baksmali** (JesusFreke) — **BSD License** — build-time tools fetched on demand
  (not vendored).
- **OpenBangla Keyboard Dictionary** (`OpenBangla/OpenBangla-Keyboard`) — **GNU GPL v3.0**
  (https://github.com/OpenBangla/OpenBangla-Keyboard) — 159,384 authoritative Bengali words
  compiled into `GboardRamblerBanglaLexiconData.java` (`v31.9.0`).
- **LibreOffice `bn_BD` Hunspell Dictionary** (`LibreOffice/dictionaries`) — **GNU GPL v2.0+ / LGPL / MPL**
  (https://github.com/LibreOffice/dictionaries/tree/master/bn_BD) — Bangladesh Bangla Academy
  dictionary roots compiled into `GboardRamblerBanglaLexiconData.java` (`v31.9.0`).
- **HermitDave FrequencyWords (`bn_full.txt`, `en_50k.txt`)** (`hermitdave/FrequencyWords`) — **MIT / CC-BY-SA**
  (https://github.com/hermitdave/FrequencyWords) — spoken Bengali & English frequency rankings for
  phonetic-skeleton candidate ranking (`v31.9.0+`) and top-25k loanwords (`v32.2.0`).
- **AI4Bharat Aksharantar (`ben`)** (`ai4bharat/Aksharantar`) — **CC-BY-4.0**
  (https://huggingface.co/datasets/ai4bharat/Aksharantar) — human-verified Roman-to-Bengali
  transliteration dataset compiled into `GboardRamblerLoanTableData.java` and
  `GboardRamblerBanglishData.java` (`v32.2.0`).
