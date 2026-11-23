# 🧩 Gboard_Pro — Patch & Extension Source

<div align="center">

[![Status](https://img.shields.io/badge/CI-Passing-00B894?style=flat-square)](https://github.com/smartworldarafath/Gboard_Pro)
[![Bundle Version](https://img.shields.io/badge/Bundle-v1.2.0-0984E3?style=flat-square)](https://github.com/smartworldarafath/Gboard_Pro)
[![Upstream Base](https://img.shields.io/badge/Gboard-18.4.1_Release-E17055?style=flat-square&logo=google)](https://github.com/smartworldarafath/Gboard_Pro)
[![Maintainer](https://img.shields.io/badge/Maintainer-Arafath-6C5CE7?style=flat-square&logo=github)](https://github.com/smartworldarafath)

**Kotlin Bytecode Patches & Runtime Extension Module for Gboard_Pro**

---

### ⬇️ Pre-Built Downloads

**If you just want to install the keyboard, grab the pre-compiled files below:**

<p>
  <a href="https://github.com/smartworldarafath/Gboard_Pro/releases/download/v18.4.1-Stable-V7/Gboard_Pro-18.4.1-V7.apk">
    <img src="https://img.shields.io/badge/⬇️_Signed_APK-v18.4.1_V7_(127_MB)-00C853?style=for-the-badge&logo=android&logoColor=white" height="40" alt="Download Gboard_Pro APK"/>
  </a>
  &nbsp;&nbsp;
  <a href="https://www.apkmirror.com/apk/google-inc/gboard/gboard-the-google-keyboard-18-4-1-985164140-release/">
    <img src="https://img.shields.io/badge/🌐_Clean_Base_APK-APKMirror_(v18.4.1)-FF6F00?style=for-the-badge&logo=google&logoColor=white" height="40" alt="Download Base Gboard APK"/>
  </a>
  &nbsp;&nbsp;
  <a href="https://github.com/smartworldarafath/Gboard_Pro/raw/main/patches/Gboard_Pro.mpp">
    <img src="https://img.shields.io/badge/🧩_Patch_Bundle-Gboard_Pro.mpp_(1.6_MB)-2979FF?style=for-the-badge&logo=android&logoColor=white" height="40" alt="Download Gboard_Pro Patch Bundle"/>
  </a>
</p>

---

</div>

## 🔍 Module Overview

This directory houses the Gradle build logic, bytecode patches, and Android runtime extension used by **Gboard_Pro**:

- **Rambler Conversational Dictation**: Hooks Gboard 18.4.1's `VoiceSettingsFragment` selector, enables `enable_jetson = true` out of the box, verifies `dictation_jni` on fused APKs, and releases `GoogleAsrService` when the keyboard hides.
- **AI Writing Suite & V2 Prompt Bar**: Unlocks proofreading, tone transformation, Android 16 quick-insert span guards, and Pixel-gated Writing Tools V2 / AICore / Astrea backend switching.
- **Inline Spell Checker Chips & OCR**: Bytecode patches for Android 12+ inline spell-check chips (`GboardSpellCheckerChipsPatch`), CameraX "Scan text" OCR, and floating screenshot paste chips.
- **Material 3 Belka Keys & Emoji V2**: Runtime Phenotype management for rounded pill keycaps, Emoji Palette V2 tabs, restored emoji size scaling, and full-opacity candidate rendering.
- **OEM Clipboard Sync & Smart Autocorrect**: Foreground clipboard listener synchronization for Samsung One UI / Vivo, Delight5 N-gram tuning, primary-key auto-correct revert, and ASL Signboard support.
- **Side-by-Side Coexistence**: Renames the package for independent installation under the **Gboard_Pro** label with signature verification bypass.

---

## 🛠️ Developer Commands

Compile the `.mpp` patch bundle:
```bash
./gradlew :patches:buildAndroid
```

Output artifact path:
```text
patches/build/libs/patches-1.2.0.mpp
```

Run the verification and unit test suite:
```bash
./gradlew test
```

---

## 👤 Maintainer

**Arafath**
- GitHub: [@smartworldarafath](https://github.com/smartworldarafath)
- Repository: [Gboard_Pro](https://github.com/smartworldarafath/Gboard_Pro)
- License: [GNU General Public License v3.0](../LICENSE)
