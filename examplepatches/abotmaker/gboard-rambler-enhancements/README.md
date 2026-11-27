# Gboard Rambler Enhancements

[![Add Source to Morphe](https://img.shields.io/badge/Morphe-Add%20Patch%20Source-4285F4?style=for-the-badge)](https://morphe.software/add-source?github=abotmaker/gboard-rambler-enhancements&name=Gboard%20Rambler%20Enhancements&app=com.google.android.inputmethod.latin&appName=Gboard)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg?style=for-the-badge)](LICENSE)

Standalone [Morphe](https://morphe.software) patches for **Gboard Rambler** — **[Hex](https://github.com/anomalyco/hex)** waveforms + voice productivity tools. Stacks cleanly with **[GboardWu](https://github.com/jasonwu1994/Gboard-patches)** (`v4.5.0+`).

<p align="center">
  <img src="assets/rambler-hex-waveforms-demo.gif" alt="Hex waveform animations demo" width="840" />
</p>

<details>
  <summary>Settings Hub, Smart Search Bars &amp; Spacebar Quick Access preview</summary>
  <p align="center">
    <img src="assets/rambler-settings-and-rules-showcase.png" alt="Rambler Enhancements v1.3.4 settings showcase" width="840" />
  </p>
</details>

## Features (7 Patches)

| Patch | What it adds |
|---|---|
| **Waveform Animation** | Hex Dot Scope & Android Wave (listening), Flow / Pulse / Sweep (processing), custom colors & glow tuning |
| **Productivity Tools** | Long-press Spacebar trigger *(Smart Hybrid / Hold / Toggle)*, Auto-Learn From Fixes *(opt-in Beta, with toast & review UI)*, Smart Search Bars *(auto-strip period & per-app Auto-Search)*, Rambler toolbar button, Voice Send/Search, Snippets, Find & Replace, private Stats & History with 1-Tap Fix & Learn, Auto Retry, Longer Sessions, JSON Backup |
| **Custom Instructions** | Default + per-app prompts, named rules, searchable app picker, disabled apps & per-app behavior overrides |
| **Personal Dictionary** | Live `MUSE_STATS` voice dictionary with add, `.txt` import/export, remove & clear |
| **Contact Names** | Auto-seeds up to 1,000 phone contacts into `MUSE_STATS` *(requires Personal Dictionary)* |
| **Cursor-Aware Editing** | Cursor/selection edits, Re-select after edit *(off by default)*, and Append-only dictation |
| **App Context** | Shares active app name, input type & field hint with Rambler |

> Settings live in **Gboard Settings → Voice typing → Rambler voice typing** and via the **Rambler** toolbar icon.

## Quick Setup

1. Add both sources in **Morphe Manager**:
   - **GboardWu:** `https://raw.githubusercontent.com/jasonwu1994/Gboard-patches/main/patches-bundle.json`
   - **This pack:** `https://raw.githubusercontent.com/abotmaker/gboard-rambler-enhancements/main/patches-bundle.json`
2. In **GboardWu**, enable **`Advanced Voice Typing`** *(required)* + any other GboardWu patches you want.
3. In **Gboard Rambler Enhancements**, select any of the 7 patches above *(don't also enable duplicate Rambler patches from another fork)*.

**Compatibility:** Verified on Gboard **`18.5.4.993608717-release-arm64-v8a`** (standalone & with GboardWu `v4.5.0+`). Newer builds are best-effort via dynamic fingerprinting. **Android 13+** required for Hex waveforms.

## Credits & License

- Waveforms & Auto-Learn From Fixes ported from [Hex by Anomaly](https://github.com/anomalyco/hex) (MIT — [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md))
- Rambler patches adapted from [`nl-morphe-patches`](https://gitlab.com/johninnld/nl-morphe-patches) · Built for [Morphe](https://morphe.software) & [GboardWu](https://github.com/jasonwu1994/Gboard-patches) · **[GPL v3.0](LICENSE)**
