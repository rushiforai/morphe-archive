## [1.34.2](https://github.com/legendsciber/morphe-patches/compare/v1.34.1...v1.34.2) (2026-09-06)

### 🐛 Bug Fixes

* v29 - remove IL2CPP domain_get, use direct RVA addressing ([585ecf0](https://github.com/legendsciber/morphe-patches/commit/585ecf07c7f05d46f8142306931c1c3559dae99b))

## [1.34.1](https://github.com/legendsciber/morphe-patches/compare/v1.34.0...v1.34.1) (2026-09-06)

### 🐛 Bug Fixes

* add commas between byte array lines in SoBytes parts ([ad55b51](https://github.com/legendsciber/morphe-patches/commit/ad55b5161e3a2274734182aaff2fbb203715c79d))
* split IAPBypassSoBytes into parts to avoid JVM method size limit ([b71d4eb](https://github.com/legendsciber/morphe-patches/commit/b71d4eb48d67a89bed60e3e9f906794ad4b649be))
* update SF2 IAP bypass description in README ([f1b0c6c](https://github.com/legendsciber/morphe-patches/commit/f1b0c6ca5c6ea689e8c014adf810b988390099b0))
* v28 IAP bypass - hook GooglePlayStore.Purchase + OnPurchaseSucceeded ([5a7507d](https://github.com/legendsciber/morphe-patches/commit/5a7507dcaaa7b02dabbe93bfae6df42a7182a669))

## [1.34.0](https://github.com/legendsciber/morphe-patches/compare/v1.33.1...v1.34.0) (2026-09-06)

### ✨ New Features

* SF2 IAP Bypass v27 - hook MakePurchase with IL2CPP API to bypass Google Play ([d53e2cd](https://github.com/legendsciber/morphe-patches/commit/d53e2cde6738e385b9025a2254bea6110ad9a345))

## [1.33.1](https://github.com/legendsciber/morphe-patches/compare/v1.33.0...v1.33.1) (2026-09-06)

### 🐛 Bug Fixes

* SF2 IAP Bypass v26 - fix libil2cpp base address parsing ([a11b359](https://github.com/legendsciber/morphe-patches/commit/a11b3590539414f81d3053995e73c05f5120daa9))

## [1.33.0](https://github.com/legendsciber/morphe-patches/compare/v1.32.2...v1.33.0) (2026-09-06)

### ✨ New Features

* SF2 IAP Bypass - hook IAGKBFCKFKB (RealMoney->Gold) + HDDFDBIKKFH (999999) ([eeb7779](https://github.com/legendsciber/morphe-patches/commit/eeb7779ea298d071a5fc3c5dc8cf8523d8705b56))

## [1.32.2](https://github.com/legendsciber/morphe-patches/compare/v1.32.1...v1.32.2) (2026-09-05)

### 🐛 Bug Fixes

* v24 poll for libil2cpp.so in background thread since it is not loaded yet at JNI_OnLoad time ([1d79e6b](https://github.com/legendsciber/morphe-patches/commit/1d79e6b9ecd22a45121e70a4bd950e4a5fef2a27))

## [1.32.1](https://github.com/legendsciber/morphe-patches/compare/v1.32.0...v1.32.1) (2026-09-05)

### 🐛 Bug Fixes

* v24 move hook to JNI_OnLoad so it runs on System.loadLibrary() ([ab2a4a9](https://github.com/legendsciber/morphe-patches/commit/ab2a4a9c4c8e5e69d95c2777aafba29523c67bd4))

## [1.32.0](https://github.com/legendsciber/morphe-patches/compare/v1.31.34...v1.32.0) (2026-09-05)

### ✨ New Features

* v24 hash bypass - hook KLPJOKOFLJD.LFENGGKOJDO to always return true ([3641375](https://github.com/legendsciber/morphe-patches/commit/3641375b0f618741833f12717d0640477b8bc67a)), closes [#1](https://github.com/legendsciber/morphe-patches/issues/1)

## [1.31.34](https://github.com/legendsciber/morphe-patches/compare/v1.31.33...v1.31.34) (2026-09-05)

### 🐛 Bug Fixes

* **shadowfight:** v22b - raise safe pointer lower bound to 0x1000000, fix crash ([ee01a7f](https://github.com/legendsciber/morphe-patches/commit/ee01a7ffed1532443909a2142b22324ace448f3a))

## [1.31.33](https://github.com/legendsciber/morphe-patches/compare/v1.31.32...v1.31.33) (2026-09-05)

### 🐛 Bug Fixes

* **shadowfight:** v22 - XML/keyword scan for coins/bonus/gems/ruby in NLP data ([e941fb2](https://github.com/legendsciber/morphe-patches/commit/e941fb2ddc2bce1ab1d69e9c7b5f5286729e22ab))

## [1.31.32](https://github.com/legendsciber/morphe-patches/compare/v1.31.31...v1.31.32) (2026-09-05)

### 🐛 Bug Fixes

* **shadowfight:** v21 - fix signed byte encoding in HardcodeSoBytes.kt ([f2403f4](https://github.com/legendsciber/morphe-patches/commit/f2403f4062a3509ebe0a1162a5f33286bb81b4cd))
* **shadowfight:** v21 scan - PJK exact ObscuredInt offsets, fix 8-byte alignment bug ([eca3f33](https://github.com/legendsciber/morphe-patches/commit/eca3f33a3179948b47557dff8c1180f6cf1c6790))

## [1.31.31](https://github.com/legendsciber/morphe-patches/compare/v1.31.30...v1.31.31) (2026-09-05)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([2937ecb](https://github.com/legendsciber/morphe-patches/commit/2937ecb168492c25090d14871025df8eac180b9e))

## [1.31.30](https://github.com/legendsciber/morphe-patches/compare/v1.31.29...v1.31.30) (2026-09-05)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([87dd97d](https://github.com/legendsciber/morphe-patches/commit/87dd97d04fb3d48fee61680c9c43e77907e61815))

## [1.31.29](https://github.com/legendsciber/morphe-patches/compare/v1.31.28...v1.31.29) (2026-09-05)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([98991dc](https://github.com/legendsciber/morphe-patches/commit/98991dc889116b8ac31c8fd33d3cb5236c226bda))

## [1.31.28](https://github.com/legendsciber/morphe-patches/compare/v1.31.27...v1.31.28) (2026-09-05)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([219081e](https://github.com/legendsciber/morphe-patches/commit/219081e95e677845d8a6da3a4b66971bf317cab0))

## [1.31.27](https://github.com/legendsciber/morphe-patches/compare/v1.31.26...v1.31.27) (2026-09-05)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([1a7cb28](https://github.com/legendsciber/morphe-patches/commit/1a7cb2831c008677934cf35a63abbd60150632ad))

## [1.31.26](https://github.com/legendsciber/morphe-patches/compare/v1.31.25...v1.31.26) (2026-09-05)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([666a89a](https://github.com/legendsciber/morphe-patches/commit/666a89aedc99858604970692b85fda7b64e59db3))

## [1.31.25](https://github.com/legendsciber/morphe-patches/compare/v1.31.24...v1.31.25) (2026-09-05)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([1488e02](https://github.com/legendsciber/morphe-patches/commit/1488e02caf8dc73465a754a8bd0b61c6a7592b03))

## [1.31.24](https://github.com/legendsciber/morphe-patches/compare/v1.31.23...v1.31.24) (2026-09-05)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([5394cf9](https://github.com/legendsciber/morphe-patches/commit/5394cf9f49d9a626c3fb7153ff107037fce8793f))

## [1.31.23](https://github.com/legendsciber/morphe-patches/compare/v1.31.22...v1.31.23) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([b2e4122](https://github.com/legendsciber/morphe-patches/commit/b2e41222d84b22bdc522bf7bbb2a980ea3e28eea))

## [1.31.22](https://github.com/legendsciber/morphe-patches/compare/v1.31.21...v1.31.22) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([02e1d87](https://github.com/legendsciber/morphe-patches/commit/02e1d87312c883cfb93d1f820eaa7557497d1c99))

## [1.31.21](https://github.com/legendsciber/morphe-patches/compare/v1.31.20...v1.31.21) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([7d614ad](https://github.com/legendsciber/morphe-patches/commit/7d614ad7d99fde06922032ec49919be484baa4a6))

## [1.31.20](https://github.com/legendsciber/morphe-patches/compare/v1.31.19...v1.31.20) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([7b0365a](https://github.com/legendsciber/morphe-patches/commit/7b0365a4a06f8e3136d786e04542b1cc11041664))

## [1.31.19](https://github.com/legendsciber/morphe-patches/compare/v1.31.18...v1.31.19) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([03d2013](https://github.com/legendsciber/morphe-patches/commit/03d20134063ec9f65c1fe546d88725da8271f973))

## [1.31.18](https://github.com/legendsciber/morphe-patches/compare/v1.31.17...v1.31.18) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([0c8faea](https://github.com/legendsciber/morphe-patches/commit/0c8faea5f425beeec9f4dac04debb85b36408de4))

## [1.31.17](https://github.com/legendsciber/morphe-patches/compare/v1.31.16...v1.31.17) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([0e6a606](https://github.com/legendsciber/morphe-patches/commit/0e6a60658877b5971bc2708e291f69d9f6921e74))

## [1.31.16](https://github.com/legendsciber/morphe-patches/compare/v1.31.15...v1.31.16) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([9bb0fcb](https://github.com/legendsciber/morphe-patches/commit/9bb0fcb59286e0c0c6b13860461c03902337182c))

## [1.31.15](https://github.com/legendsciber/morphe-patches/compare/v1.31.14...v1.31.15) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([8c2ded6](https://github.com/legendsciber/morphe-patches/commit/8c2ded6abe21758e2a557f79cc12b51d1017f62f))

## [1.31.14](https://github.com/legendsciber/morphe-patches/compare/v1.31.13...v1.31.14) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([3196123](https://github.com/legendsciber/morphe-patches/commit/31961236a79488a53a847970ab33b6e9f50d8d83))

## [1.31.13](https://github.com/legendsciber/morphe-patches/compare/v1.31.12...v1.31.13) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([863c85f](https://github.com/legendsciber/morphe-patches/commit/863c85faa169c7028fb6f0ac44fea05af10549c7))

## [1.31.12](https://github.com/legendsciber/morphe-patches/compare/v1.31.11...v1.31.12) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** v2 scan - NLP chain trace, remove crash-prone FindObjectsOfType ([d4514e4](https://github.com/legendsciber/morphe-patches/commit/d4514e480482e376db7c615b3f19fc9367428e34))

## [1.31.11](https://github.com/legendsciber/morphe-patches/compare/v1.31.10...v1.31.11) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** direct FindObjectsOfType for BFBONKPKBNL, remove broken FIFBDNADAAL chain ([9117db0](https://github.com/legendsciber/morphe-patches/commit/9117db0492fbf3f85dc5b300ebdbcb46d99add83))

## [1.31.10](https://github.com/legendsciber/morphe-patches/compare/v1.31.9...v1.31.10) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** direct FindObjectsOfType for BFBONKPKBNL, remove broken FIFBDNADAAL chain ([fa79a25](https://github.com/legendsciber/morphe-patches/commit/fa79a25606b3d4039b02e4618ccca310788ec478))
* **shadowfight:** direct FindObjectsOfType for BFBONKPKBNL, remove broken FIFBDNADAAL chain ([568dbe7](https://github.com/legendsciber/morphe-patches/commit/568dbe70c0a35601b1a93a1787c14b942924e0aa))

## [1.31.9](https://github.com/legendsciber/morphe-patches/compare/v1.31.8...v1.31.9) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** instance method calls, list _size field, 20s delay ([c3b70e6](https://github.com/legendsciber/morphe-patches/commit/c3b70e68c661c7c47e5b7fc301b4c5bab8c31e95))

## [1.31.8](https://github.com/legendsciber/morphe-patches/compare/v1.31.7...v1.31.8) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** remove SIGSEGV handler from hardcode, defer scan to bg thread ([f76e61c](https://github.com/legendsciber/morphe-patches/commit/f76e61cab43cfffb1072f842a5d2a941bea86b38))

## [1.31.7](https://github.com/legendsciber/morphe-patches/compare/v1.31.6...v1.31.7) (2026-09-04)

### 🐛 Bug Fixes

* **shadowfight:** SCAN MODE - log all offsets before healing ([cf29b40](https://github.com/legendsciber/morphe-patches/commit/cf29b40cb4ffd56a4c088760f36f48740f132faf))
* **shadowfight:** SCAN MODE with proper byte signing ([a4acd52](https://github.com/legendsciber/morphe-patches/commit/a4acd52428c002223c6c79aa037238a3fd9a4587))

## [1.31.6](https://github.com/legendsciber/morphe-patches/compare/v1.31.5...v1.31.6) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** direct holder chains without scanning ([c08820b](https://github.com/legendsciber/morphe-patches/commit/c08820b21938e43fa8f6d591c9a745731fb954f0))

## [1.31.5](https://github.com/legendsciber/morphe-patches/compare/v1.31.4...v1.31.5) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** find wallet via object graph walk ([e32a648](https://github.com/legendsciber/morphe-patches/commit/e32a6485532ca408eece0576cb323800f31fd9e3))

## [1.31.4](https://github.com/legendsciber/morphe-patches/compare/v1.31.3...v1.31.4) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** fast instance lookup and game-only scan ([0ae1981](https://github.com/legendsciber/morphe-patches/commit/0ae19817c7abafcc84f33491ce6452c1e33f4f0b))

## [1.31.3](https://github.com/legendsciber/morphe-patches/compare/v1.31.2...v1.31.3) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** speed up instance scan with progress logs ([5b6cbd5](https://github.com/legendsciber/morphe-patches/commit/5b6cbd55df747fbc1410ccd4567b0e9be481dd64))

## [1.31.2](https://github.com/legendsciber/morphe-patches/compare/v1.31.1...v1.31.2) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** make instance scan fault-tolerant ([b199065](https://github.com/legendsciber/morphe-patches/commit/b19906544b61ebe6b20ec93fc33acc3467228ffd))

## [1.31.1](https://github.com/legendsciber/morphe-patches/compare/v1.31.0...v1.31.1) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** prevent scan faults and crash log flood ([09a71f9](https://github.com/legendsciber/morphe-patches/commit/09a71f943a82c0397c7159681c199c6fc36d12d1))

## [1.31.0](https://github.com/legendsciber/morphe-patches/compare/v1.30.0...v1.31.0) (2026-09-03)

### ✨ New Features

* **shadowfight:** log hardcode output to file ([0111503](https://github.com/legendsciber/morphe-patches/commit/011150373891e93df83a5fb3ab0e4d98b0b6cba8))

## [1.30.0](https://github.com/legendsciber/morphe-patches/compare/v1.29.2...v1.30.0) (2026-09-03)

### ✨ New Features

* **shadowfight:** separate crash log into its own library ([959439d](https://github.com/legendsciber/morphe-patches/commit/959439ddeb0679e0a2ac4dd8a0cbcd2cf37820b9))

## [1.29.2](https://github.com/legendsciber/morphe-patches/compare/v1.29.1...v1.29.2) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** separate dump and crash logs ([eb2ff46](https://github.com/legendsciber/morphe-patches/commit/eb2ff46b2b224c9272800484e7f08fd2caf019f2))

## [1.29.1](https://github.com/legendsciber/morphe-patches/compare/v1.29.0...v1.29.1) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** simplify patch names and descriptions ([b6bba65](https://github.com/legendsciber/morphe-patches/commit/b6bba654def8ca5c8a5104f549ce3524c7c389d6))

## [1.29.0](https://github.com/legendsciber/morphe-patches/compare/v1.28.8...v1.29.0) (2026-09-03)

### ✨ New Features

* **shadowfight:** hardcode 5 ObscuredInt values 999999999 ([ffa1f46](https://github.com/legendsciber/morphe-patches/commit/ffa1f46100717b0d80fae768bb5bc06e61100306))

## [1.28.8](https://github.com/legendsciber/morphe-patches/compare/v1.28.7...v1.28.8) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** dump Gems Coins exact offsets with plain values ([ca15eb6](https://github.com/legendsciber/morphe-patches/commit/ca15eb64fdcbb66a676912720bbbb12d793f7a39))

## [1.28.7](https://github.com/legendsciber/morphe-patches/compare/v1.28.6...v1.28.7) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** dump only to Download, overwrite, log other values ([37f2a23](https://github.com/legendsciber/morphe-patches/commit/37f2a23ebd72e53ae994aa63115df64816affa2f))

## [1.28.6](https://github.com/legendsciber/morphe-patches/compare/v1.28.5...v1.28.6) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** fix dump via lib loadLibrary ([5f7b8df](https://github.com/legendsciber/morphe-patches/commit/5f7b8df39a56b5696048b4bd51b39e27df16c650))

## [1.28.5](https://github.com/legendsciber/morphe-patches/compare/v1.28.4...v1.28.5) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** fix dump file logging to shizuku-terminal ([bbd344c](https://github.com/legendsciber/morphe-patches/commit/bbd344ccc9b4d6dcb3934c9ce2cd8240709c553a))

## [1.28.4](https://github.com/legendsciber/morphe-patches/compare/v1.28.3...v1.28.4) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** fix dump file logging to shizuku-terminal ([b191999](https://github.com/legendsciber/morphe-patches/commit/b191999567ea7f5ccce29eeb154bf906023ed375))

## [1.28.3](https://github.com/legendsciber/morphe-patches/compare/v1.28.2...v1.28.3) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** keep only 2 dump patches experimental, fix file logging ([88c41df](https://github.com/legendsciber/morphe-patches/commit/88c41dfa0ad604dd65f7c54212c28853022335a3))

## [1.28.2](https://github.com/legendsciber/morphe-patches/compare/v1.28.1...v1.28.2) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** add file logging to shadowdump (no rish needed) ([042c4e9](https://github.com/legendsciber/morphe-patches/commit/042c4e9754b8bc7d894419f0b4aa1d4b7fbe9181))

## [1.28.1](https://github.com/legendsciber/morphe-patches/compare/v1.28.0...v1.28.1) (2026-09-03)

### 🐛 Bug Fixes

* **shadowfight:** add file logging to shadowdump (no rish needed) ([6c3772c](https://github.com/legendsciber/morphe-patches/commit/6c3772cf25c5303bd7fe34f0e080f028813ded04))

## [1.28.0](https://github.com/legendsciber/morphe-patches/compare/v1.27.0...v1.28.0) (2026-09-02)

### ✨ New Features

* **shadowfight:** add experimental 2.46.0 patches to main ([eb70c13](https://github.com/legendsciber/morphe-patches/commit/eb70c135d7654098530728fe7399f80f9bd13293))

## [1.27.0](https://github.com/legendsciber/morphe-patches/compare/v1.26.2...v1.27.0) (2026-09-02)

### 🐛 Bug Fixes

* remove shadowfight from readme for pre-release ([a81d5f0](https://github.com/legendsciber/morphe-patches/commit/a81d5f0e2944f0b8e98678e5296765eee255c80a))
* **shadowfight:** add plain ObscuredInt dump for Gems Coins ([bb92493](https://github.com/legendsciber/morphe-patches/commit/bb9249342a020d673e93a10dcddcd345ec31e2d8))
* **shadowfight:** fix dump fingerprint no filters ([14d51ff](https://github.com/legendsciber/morphe-patches/commit/14d51ff01dd17f18347ef5a85e2f4fdbfb03e3f8))
* **shadowfight:** fix dump helper ClassNotFound via lib loadLibrary ([31fdd38](https://github.com/legendsciber/morphe-patches/commit/31fdd38c89c7744229cbba3a67dcd985d5e57c1b))
* **shadowfight:** fix DumpHelper ClassNotFound via IOUtils readInputStreamFully ([cbaa974](https://github.com/legendsciber/morphe-patches/commit/cbaa974053728e2e93d291db6ab7e4522f547900))
* **shadowfight:** fix VerifyError this-is-File via super injection ([a1d83c4](https://github.com/legendsciber/morphe-patches/commit/a1d83c4e6d79f89bc09e899a6cbccf89170eb2bd))
* **shadowfight:** fix VerifyError via helper dex for dump ([335d5cd](https://github.com/legendsciber/morphe-patches/commit/335d5cd54ad8d4f6375fbdda62ad4ef89db5fee7))

### ✨ New Features

* **shadowfight:** add CheatsPanel debug menu restore (8 RET stubs) ([cf64178](https://github.com/legendsciber/morphe-patches/commit/cf6417845b5f7a8d240349c02bc0292ff1baa81b))
* **shadowfight:** add hardcode 999999999 for ObscuredInt wallets ([ba28d50](https://github.com/legendsciber/morphe-patches/commit/ba28d50ad73ab024ce8ba55f11946f3284e6a3b7))
* **shadowfight:** add runtime dump for hardcode (pre-release) ([2615983](https://github.com/legendsciber/morphe-patches/commit/261598343f26414e4b96980c1b7c7c2deca12099))

## [1.29.1](https://github.com/legendsciber/morphe-patches/compare/v1.29.0...v1.29.1) (2026-09-02)

### 🐛 Bug Fixes

* **shadowfight:** add plain ObscuredInt dump for Gems Coins ([bb92493](https://github.com/legendsciber/morphe-patches/commit/bb9249342a020d673e93a10dcddcd345ec31e2d8))

## [1.29.0](https://github.com/legendsciber/morphe-patches/compare/v1.28.5...v1.29.0) (2026-09-02)

### ✨ New Features

* **shadowfight:** add hardcode 999999999 for ObscuredInt wallets ([ba28d50](https://github.com/legendsciber/morphe-patches/commit/ba28d50ad73ab024ce8ba55f11946f3284e6a3b7))

## [1.28.5](https://github.com/legendsciber/morphe-patches/compare/v1.28.4...v1.28.5) (2026-09-02)

### 🐛 Bug Fixes

* **shadowfight:** fix dump helper ClassNotFound via lib loadLibrary ([31fdd38](https://github.com/legendsciber/morphe-patches/commit/31fdd38c89c7744229cbba3a67dcd985d5e57c1b))

## [1.28.4](https://github.com/legendsciber/morphe-patches/compare/v1.28.3...v1.28.4) (2026-09-02)

### 🐛 Bug Fixes

* **shadowfight:** fix VerifyError via helper dex for dump ([335d5cd](https://github.com/legendsciber/morphe-patches/commit/335d5cd54ad8d4f6375fbdda62ad4ef89db5fee7))

## [1.28.3](https://github.com/legendsciber/morphe-patches/compare/v1.28.2...v1.28.3) (2026-09-02)

### 🐛 Bug Fixes

* **shadowfight:** fix VerifyError this-is-File via super injection ([a1d83c4](https://github.com/legendsciber/morphe-patches/commit/a1d83c4e6d79f89bc09e899a6cbccf89170eb2bd))

## [1.28.2](https://github.com/legendsciber/morphe-patches/compare/v1.28.1...v1.28.2) (2026-09-02)

### 🐛 Bug Fixes

* **shadowfight:** fix DumpHelper ClassNotFound via IOUtils readInputStreamFully ([cbaa974](https://github.com/legendsciber/morphe-patches/commit/cbaa974053728e2e93d291db6ab7e4522f547900))

## [1.28.1](https://github.com/legendsciber/morphe-patches/compare/v1.28.0...v1.28.1) (2026-09-02)

### 🐛 Bug Fixes

* **shadowfight:** fix dump fingerprint no filters ([14d51ff](https://github.com/legendsciber/morphe-patches/commit/14d51ff01dd17f18347ef5a85e2f4fdbfb03e3f8))

## [1.28.0](https://github.com/legendsciber/morphe-patches/compare/v1.27.0...v1.28.0) (2026-09-02)

### ✨ New Features

* **shadowfight:** add runtime dump for hardcode (pre-release) ([2615983](https://github.com/legendsciber/morphe-patches/commit/261598343f26414e4b96980c1b7c7c2deca12099))

## [1.27.0](https://github.com/legendsciber/morphe-patches/compare/v1.26.2...v1.27.0) (2026-09-01)

### ✨ New Features

* **shadowfight:** add CheatsPanel debug menu restore (8 RET stubs) ([cf64178](https://github.com/legendsciber/morphe-patches/commit/cf6417845b5f7a8d240349c02bc0292ff1baa81b))

## [1.26.2](https://github.com/legendsciber/morphe-patches/compare/v1.26.1...v1.26.2) (2026-09-01)

### 🐛 Bug Fixes

* **extremecardriving:** fix DAO null via manager->info->dao 2-step chain ([3315f76](https://github.com/legendsciber/morphe-patches/commit/3315f767f6617dbdd8c0d8c496970ee972535ec2))

## [1.26.1](https://github.com/legendsciber/morphe-patches/compare/v1.26.0...v1.26.1) (2026-09-01)

### 🐛 Bug Fixes

* **extremecardriving:** fix hardcode to find ManagerPlayerData without image name check ([ec0f9e0](https://github.com/legendsciber/morphe-patches/commit/ec0f9e0f6514e510c6b3bb05703b1aaeffad3d36))

## [1.26.0](https://github.com/legendsciber/morphe-patches/compare/v1.25.14...v1.26.0) (2026-09-01)

### ✨ New Features

* **extremecardriving:** switch to direct hardcode via ManagerPlayerData DAO offsets ([a227d65](https://github.com/legendsciber/morphe-patches/commit/a227d6550997aecbaa9b7b1402f792d69cbee155))

## [1.25.14](https://github.com/legendsciber/morphe-patches/compare/v1.25.13...v1.25.14) (2026-09-01)

### 🐛 Bug Fixes

* **extremecardriving:** expand global singleton search and add PlayerPrefs fallback ([eff0fa8](https://github.com/legendsciber/morphe-patches/commit/eff0fa8d5144132762714fd296a38579149e265d))

## [1.25.13](https://github.com/legendsciber/morphe-patches/compare/v1.25.12...v1.25.13) (2026-09-01)

### 🐛 Bug Fixes

* **extremecardriving:** fix currency hack to handle PlayerInfo_DAO singleton via generic scan ([ec4ce37](https://github.com/legendsciber/morphe-patches/commit/ec4ce37c42ce210b36bd12d5b134ea5d7a74d397))

## [1.25.12](https://github.com/legendsciber/morphe-patches/compare/v1.25.11...v1.25.12) (2026-09-01)

### 🐛 Bug Fixes

* **extremecardriving:** fix currency hack to handle PlayerInfo_DAO singleton via generic scan ([e059ccf](https://github.com/legendsciber/morphe-patches/commit/e059ccfc393aa1896ec223d10bb1a68840c4d896))

## [1.25.11](https://github.com/legendsciber/morphe-patches/compare/v1.25.10...v1.25.11) (2026-09-01)

### 🐛 Bug Fixes

* **extremecardriving:** fix native SIGSEGV via correct assembly array handling ([6d325fc](https://github.com/legendsciber/morphe-patches/commit/6d325fc6ccf333a6227395331218aa9156b30a8c))

## [1.25.10](https://github.com/legendsciber/morphe-patches/compare/v1.25.9...v1.25.10) (2026-09-01)

### 🐛 Bug Fixes

* **extremecardriving:** fix VerifyError via helper dex with minimal registers ([191bddc](https://github.com/legendsciber/morphe-patches/commit/191bddcabd20a2e436c86bc8639baa77f6430ebc))

## [1.25.9](https://github.com/legendsciber/morphe-patches/compare/v1.25.8...v1.25.9) (2026-09-01)

### 🐛 Bug Fixes

* **extremecardriving:** fix IllegalAccessError and VerifyError via manual copy after super ([1ab56b4](https://github.com/legendsciber/morphe-patches/commit/1ab56b436463c0f285643ffd486e449f0befb1be))

## [1.25.8](https://github.com/legendsciber/morphe-patches/compare/v1.25.7...v1.25.8) (2026-09-01)

### 🐛 Bug Fixes

* **extremecardriving:** fix VerifyError this-is-File by injecting after super.onCreate ([7f272af](https://github.com/legendsciber/morphe-patches/commit/7f272aff04a3fb2d06bfd2ace6665848006b5327))
* **extremecardriving:** fix VerifyError this-is-File by injecting after super.onCreate ([2b83d9c](https://github.com/legendsciber/morphe-patches/commit/2b83d9c8dae88f3f825912116b65e6634538e03b))

## [1.25.7](https://github.com/legendsciber/morphe-patches/compare/v1.25.6...v1.25.7) (2026-09-01)

### 🐛 Bug Fixes

* **extremecardriving:** fix VerifyError via ExifInterfaceUtils copy with minimal registers ([5374f75](https://github.com/legendsciber/morphe-patches/commit/5374f7560ecf458da6d743689012293dc6de8973))

## [1.25.6](https://github.com/legendsciber/morphe-patches/compare/v1.25.5...v1.25.6) (2026-09-01)

### 🐛 Bug Fixes

* **extremecardriving:** fix INSTALL_FAILED_INVALID_APK via assets + Runtime.load ([cabb0cb](https://github.com/legendsciber/morphe-patches/commit/cabb0cba63db7ffb6976baddd939b2781cafc8e9))

## [1.25.5](https://github.com/legendsciber/morphe-patches/compare/v1.25.4...v1.25.5) (2026-09-01)

### 🐛 Bug Fixes

* **extremecardriving:** rewrite patches from scratch with reusable Unity template ([f07b61a](https://github.com/legendsciber/morphe-patches/commit/f07b61a305e645c7a76ec0bf0beeb1e41747c95b))

## [1.25.4](https://github.com/legendsciber/morphe-patches/compare/v1.25.3...v1.25.4) (2026-08-31)

### 🐛 Bug Fixes

* **extremecardriving:** embed .so as base64 in smali, no rawResourcePatch ([81c4d8b](https://github.com/legendsciber/morphe-patches/commit/81c4d8b05018092363c8f200bd0052621c883cee))

## [1.25.3](https://github.com/legendsciber/morphe-patches/compare/v1.25.2...v1.25.3) (2026-08-31)

### 🐛 Bug Fixes

* **extremecardriving:** embed .so as base64 in smali, no rawResourcePatch ([8b2e968](https://github.com/legendsciber/morphe-patches/commit/8b2e968af50a36e28ee773e86f708b6f1ee05e4d))

## [1.25.2](https://github.com/legendsciber/morphe-patches/compare/v1.25.1...v1.25.2) (2026-08-31)

### 🐛 Bug Fixes

* **extremecardriving:** embed .so as base64 in smali, no rawResourcePatch ([9bd4bc1](https://github.com/legendsciber/morphe-patches/commit/9bd4bc12fa23477efca2561f5482774e1ee25542))

## [1.25.1](https://github.com/legendsciber/morphe-patches/compare/v1.25.0...v1.25.1) (2026-08-31)

### 🐛 Bug Fixes

* **extremecardriving:** embed .so as base64 in smali, no rawResourcePatch ([939d529](https://github.com/legendsciber/morphe-patches/commit/939d529ca3946032a5dac816c5a57aa444144477))

## [1.25.0](https://github.com/legendsciber/morphe-patches/compare/v1.24.3...v1.25.0) (2026-08-30)

### 🐛 Bug Fixes

* **extremecardriving:** fix build - embed .so as base64, use single bytecodePatch ([c858179](https://github.com/legendsciber/morphe-patches/commit/c8581796eb8b515d606155700a647232ea28ca61))
* **extremecardriving:** fix build - split into rawResourcePatch + bytecodePatch ([f6662fc](https://github.com/legendsciber/morphe-patches/commit/f6662fcb279984613dbaa889086192874b92158a))
* **extremecardriving:** fix build - split into rawResourcePatch + bytecodePatch ([47a272c](https://github.com/legendsciber/morphe-patches/commit/47a272cb0cadd9c30675345da354b7382f1588cd))
* **extremecardriving:** fix build - use classLoader to load .so from resources ([f1747e0](https://github.com/legendsciber/morphe-patches/commit/f1747e097e2751b0d766b883484fa4d45daaa0c8))

### ✨ New Features

* **extremecardriving:** add unlimited currencies patch ([41b163a](https://github.com/legendsciber/morphe-patches/commit/41b163a5c5b7717827fd0b7a678d8338c045906a))

## [1.24.3](https://github.com/legendsciber/morphe-patches/compare/v1.24.2...v1.24.3) (2026-08-30)

### 🐛 Bug Fixes

* **pcr:** fix event 66 crash by using separate v6 index register for aput-wide ([a25629b](https://github.com/legendsciber/morphe-patches/commit/a25629b83d8cd51547096afb18d2979b125f17a8))

## [1.24.2](https://github.com/legendsciber/morphe-patches/compare/v1.24.1...v1.24.2) (2026-08-30)

### 🐛 Bug Fixes

* **pcr:** simplify IAP bypass - remove event 66, use only return patches to avoid crash ([3a2325e](https://github.com/legendsciber/morphe-patches/commit/3a2325e2d7723182948413c00c11c08567d31d63))

## [1.24.1](https://github.com/legendsciber/morphe-patches/compare/v1.24.0...v1.24.1) (2026-08-30)

### 🐛 Bug Fixes

* **pcr:** use String.format instead of StringBuilder to avoid crash in PurchaseProduct/PurchaseSubscription ([93c3915](https://github.com/legendsciber/morphe-patches/commit/93c391575dafa9c6615978a074dc8f143304e977))

## [1.24.0](https://github.com/legendsciber/morphe-patches/compare/v1.23.0...v1.24.0) (2026-08-30)

### ✨ New Features

* **pcr:** fire event 66 with SKU in purchases array from PurchaseProduct ([2bfa349](https://github.com/legendsciber/morphe-patches/commit/2bfa3494ef39d0ae15fcccfe6c79f00a27beab36))

## [1.23.0](https://github.com/legendsciber/morphe-patches/compare/v1.22.1...v1.23.0) (2026-08-30)

### ✨ New Features

* **pcr:** trigger async event 66 from PurchaseProduct via queryPurchasesAsync ([009321a](https://github.com/legendsciber/morphe-patches/commit/009321a4be19eb3d41d1a429f50cc80e7a0ba5c4))

## [1.22.1](https://github.com/legendsciber/morphe-patches/compare/v1.22.0...v1.22.1) (2026-08-30)

### 🐛 Bug Fixes

* **pcr:** fix smali escape syntax in queryPurchasesAsync bypass ([ad10a8d](https://github.com/legendsciber/morphe-patches/commit/ad10a8d3399d3bd0949ca38c975679c11b0a7e48))

## [1.22.0](https://github.com/legendsciber/morphe-patches/compare/v1.21.0...v1.22.0) (2026-08-30)

### 🐛 Bug Fixes

* **pcr:** restore missing fingerprints ([41413b6](https://github.com/legendsciber/morphe-patches/commit/41413b65b699bfaf11fc9c7bd5377fa5798e88ff))

### ✨ New Features

* **pcr:** add queryPurchasesAsync bypass to trigger async event ([3c079c0](https://github.com/legendsciber/morphe-patches/commit/3c079c0655fa0214fa4e6709a1c08d4ef5bd5256))

## [1.21.0](https://github.com/legendsciber/morphe-patches/compare/v1.20.0...v1.21.0) (2026-08-30)

### ✨ New Features

* **pcr:** add full IAP bypass with fake purchase JSON and signature ([d6a5398](https://github.com/legendsciber/morphe-patches/commit/d6a5398b3becebe0cf70548fcf34a46d77324d98))

## [1.20.0](https://github.com/legendsciber/morphe-patches/compare/v1.19.0...v1.20.0) (2026-08-30)

### ✨ New Features

* **pcr:** add full IAP bypass - purchase, state, signature, store connected ([07f31b1](https://github.com/legendsciber/morphe-patches/commit/07f31b107979c0edc51c10d341c2f4599a36fc69))

## [1.19.0](https://github.com/legendsciber/morphe-patches/compare/v1.18.0...v1.19.0) (2026-08-30)

### ✨ New Features

* **pcr:** add Pixel Car Racer IAP bypass patch ([a2607ab](https://github.com/legendsciber/morphe-patches/commit/a2607ab441d38e65b67b832d6f7329796546b70f))

## [1.18.0](https://github.com/legendsciber/morphe-patches/compare/v1.17.40...v1.18.0) (2026-08-29)

### ✨ New Features

* **mctoolbox:** premium patch - rename files and finalize naming ([99cd49a](https://github.com/legendsciber/morphe-patches/commit/99cd49a7e65391478a2ea8dd6ad7438fe4effa8c))

## [1.17.40](https://github.com/legendsciber/morphe-patches/compare/v1.17.39...v1.17.40) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (IAP bypass) - set premium_unlocked + ya0.H(true) for UI update ([d0e1e4d](https://github.com/legendsciber/morphe-patches/commit/d0e1e4d15e37b0090420b2c8c8c935b541ded32f))

## [1.17.39](https://github.com/legendsciber/morphe-patches/compare/v1.17.38...v1.17.39) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (IAP bypass) - fix register range, copy p0-p2 to v10-v12 ([7fe15b0](https://github.com/legendsciber/morphe-patches/commit/7fe15b0a7ce09daf1ae14eea33b1c06dc5bbaf63))

## [1.17.38](https://github.com/legendsciber/morphe-patches/compare/v1.17.37...v1.17.38) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (IAP bypass) - set premium + dismiss dialog + show Toast ([6239ef0](https://github.com/legendsciber/morphe-patches/commit/6239ef0159072fa34c5e081e88621c89fa38de7d))

## [1.17.37](https://github.com/legendsciber/morphe-patches/compare/v1.17.36...v1.17.37) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (IAP bypass) - use move-object/from16 for large register ([1f06c31](https://github.com/legendsciber/morphe-patches/commit/1f06c31fdfa08b9148dc14df858aed6298e64023))

## [1.17.36](https://github.com/legendsciber/morphe-patches/compare/v1.17.35...v1.17.36) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (IAP bypass) - fix VerifyError, use move-object pattern ([190871d](https://github.com/legendsciber/morphe-patches/commit/190871da729011a684d84630625b68aa5e8d6f46))

## [1.17.35](https://github.com/legendsciber/morphe-patches/compare/v1.17.34...v1.17.35) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (IAP bypass) - n21.k subscribe button only, no crash blocks ([307daf3](https://github.com/legendsciber/morphe-patches/commit/307daf3da3891cb08566ca288a8e8f8ac016cf23))

## [1.17.34](https://github.com/legendsciber/morphe-patches/compare/v1.17.33...v1.17.34) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (IAP bypass) - n21.k subscribe button directly activates premium ([9a1dcf0](https://github.com/legendsciber/morphe-patches/commit/9a1dcf00142bd7603604b9cd643d7dfe075ab375))

## [1.17.33](https://github.com/legendsciber/morphe-patches/compare/v1.17.32...v1.17.33) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (IAP bypass) - tc0.d always true, single clean patch ([e4d936f](https://github.com/legendsciber/morphe-patches/commit/e4d936fbdb6a76dad97ce66e2fe6e5701da5c15f))

## [1.17.32](https://github.com/legendsciber/morphe-patches/compare/v1.17.31...v1.17.32) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (IAP bypass) - tc0.d always true + overlay routing + crash blocks ([b7f4357](https://github.com/legendsciber/morphe-patches/commit/b7f4357f7937d4aeabb6f5303bffc582956c18fd))

## [1.17.31](https://github.com/legendsciber/morphe-patches/compare/v1.17.30...v1.17.31) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - Q=true WITH F() firing + overlay routing fix ([dd049ef](https://github.com/legendsciber/morphe-patches/commit/dd049eff6cb91c39a74e139997f45e6897840e2b))

## [1.17.30](https://github.com/legendsciber/morphe-patches/compare/v1.17.29...v1.17.30) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - add mz0.g skip back + all previous fixes ([5cebf26](https://github.com/legendsciber/morphe-patches/commit/5cebf26372dd81389779b630afbe6160a74741e2))

## [1.17.29](https://github.com/legendsciber/morphe-patches/compare/v1.17.28...v1.17.29) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - Q=true everywhere + force xa0.c.Q=false in tz0 ([2eb6070](https://github.com/legendsciber/morphe-patches/commit/2eb60706fa72418a9fcc8da2faece9de794c3862))

## [1.17.28](https://github.com/legendsciber/morphe-patches/compare/v1.17.27...v1.17.28) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - fix tz0 fingerprint (no params) ([9455749](https://github.com/legendsciber/morphe-patches/commit/945574917f2e844b2699e3e5290909c9f240f312))

## [1.17.27](https://github.com/legendsciber/morphe-patches/compare/v1.17.26...v1.17.27) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - Q=true + force overlay routing + block popups ([5e7f8e9](https://github.com/legendsciber/morphe-patches/commit/5e7f8e960d07dce211f198974c6abc15ec698b24))

## [1.17.26](https://github.com/legendsciber/morphe-patches/compare/v1.17.25...v1.17.26) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - Q=true + block all crash paths including tz0 ([41ed792](https://github.com/legendsciber/morphe-patches/commit/41ed792fdc493000803b9b808ee468c77765a5d0))

## [1.17.25](https://github.com/legendsciber/morphe-patches/compare/v1.17.24...v1.17.25) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - Q=true + block all popup crash paths ([b45c622](https://github.com/legendsciber/morphe-patches/commit/b45c6223b18a2fbbe7ce3a1874a775f7435bbf30))

## [1.17.24](https://github.com/legendsciber/morphe-patches/compare/v1.17.23...v1.17.24) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - minimal: just set Q=true via ya0.H, skip F() ([13ff616](https://github.com/legendsciber/morphe-patches/commit/13ff6167b5dcadc2117547307d8dbdca04ad0982))
* **mctoolbox:** premium (under testing) - Q=true + mz0.g skip, no onResume ([7343bc4](https://github.com/legendsciber/morphe-patches/commit/7343bc43608196fbcd17edcde303c7bf6ce06ab6))

## [1.17.23](https://github.com/legendsciber/morphe-patches/compare/v1.17.22...v1.17.23) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - set Q on mz0.d + bridge.b.c + write native SharedPrefs ([dc52342](https://github.com/legendsciber/morphe-patches/commit/dc523422db308a62a88b3a8da5ed09bd06922380))

## [1.17.22](https://github.com/legendsciber/morphe-patches/compare/v1.17.21...v1.17.22) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - simplify xs0 fingerprint ([3fdbc12](https://github.com/legendsciber/morphe-patches/commit/3fdbc127e025b5436685080fcdad407567b65fc8))

## [1.17.21](https://github.com/legendsciber/morphe-patches/compare/v1.17.20...v1.17.21) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - fix compile errors ([6f0814e](https://github.com/legendsciber/morphe-patches/commit/6f0814ec2e323684791fcd108748784b031b0267))
* **mctoolbox:** premium (under testing) - try-catch xs0.g() + set Q=true directly ([3328b04](https://github.com/legendsciber/morphe-patches/commit/3328b04ea8c6fc6d00ba426bf0686f2eebd972f0))

## [1.17.20](https://github.com/legendsciber/morphe-patches/compare/v1.17.19...v1.17.20) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - escape dollar signs in smali strings ([34c48ed](https://github.com/legendsciber/morphe-patches/commit/34c48ed757a69e121a8b8a54615763ecf30c9406))
* **mctoolbox:** premium (under testing) - use Handler.post + hz0 for deferred bridge refresh ([284a566](https://github.com/legendsciber/morphe-patches/commit/284a5665589c8445a7bab323c7b6921ac63ca1e6))

## [1.17.19](https://github.com/legendsciber/morphe-patches/compare/v1.17.18...v1.17.19) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - defer overlay to onResume when window is ready ([ed13354](https://github.com/legendsciber/morphe-patches/commit/ed13354205d00f490b721d074efa7ebc582649dc))

## [1.17.18](https://github.com/legendsciber/morphe-patches/compare/v1.17.17...v1.17.18) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - block tz0.a() to stop ALL overlay crashes ([1cabefc](https://github.com/legendsciber/morphe-patches/commit/1cabefc3e84eb222cb219ce888789138afdeafa9))

## [1.17.17](https://github.com/legendsciber/morphe-patches/compare/v1.17.16...v1.17.17) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - delay t20 overlay with Handler.postDelayed ([f5e6d45](https://github.com/legendsciber/morphe-patches/commit/f5e6d4547069392af45e2a3d633b02554ea686b4))

## [1.17.16](https://github.com/legendsciber/morphe-patches/compare/v1.17.15...v1.17.16) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - add tz0.a() back to block t20.run crash ([8509cb3](https://github.com/legendsciber/morphe-patches/commit/8509cb355ff6d8b629591ef00660022fc4f8e5a2))

## [1.17.15](https://github.com/legendsciber/morphe-patches/compare/v1.17.14...v1.17.15) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - remove invalid bz0 fingerprint ([dc8efbd](https://github.com/legendsciber/morphe-patches/commit/dc8efbdc2d11a1fbaada78f5ea15211414753650))

## [1.17.14](https://github.com/legendsciber/morphe-patches/compare/v1.17.13...v1.17.14) (2026-08-29)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - block all 4 popup crash paths ([f7a1233](https://github.com/legendsciber/morphe-patches/commit/f7a12330923fec252095d32e38bb3bb7f1490153))

## [1.17.13](https://github.com/legendsciber/morphe-patches/compare/v1.17.12...v1.17.13) (2026-08-28)

### 🐛 Bug Fixes

* **mctoolbox:** premium (under testing) - clean up naming and docs ([2b02262](https://github.com/legendsciber/morphe-patches/commit/2b0226237de3bfc9b3d7ac255f740bfe0a6495f7))

## [1.17.12](https://github.com/legendsciber/morphe-patches/compare/v1.17.11...v1.17.12) (2026-08-28)

### 🐛 Bug Fixes

* **mctoolbox:** premium - make tz0.a() no-op to prevent overlay crash ([78690b0](https://github.com/legendsciber/morphe-patches/commit/78690b0d59e31f84d373081ecd2d21dd09d23f5a))

## [1.17.11](https://github.com/legendsciber/morphe-patches/compare/v1.17.10...v1.17.11) (2026-08-28)

### 🐛 Bug Fixes

* **mctoolbox:** premium - bypass tz0.a() Q check to prevent overlay crash, keep UI working ([e0ec5b1](https://github.com/legendsciber/morphe-patches/commit/e0ec5b17cb854be0c8a9322dde68d106afd330a8))

## [1.17.10](https://github.com/legendsciber/morphe-patches/compare/v1.17.9...v1.17.10) (2026-08-28)

### 🐛 Bug Fixes

* **mctoolbox:** premium - block xs0.g() to prevent all popup crash chains ([32347e3](https://github.com/legendsciber/morphe-patches/commit/32347e3f802951703fd3843ecc8d9623686ef89f))

## [1.17.9](https://github.com/legendsciber/morphe-patches/compare/v1.17.8...v1.17.9) (2026-08-28)

### 🐛 Bug Fixes

* **mctoolbox:** premium - patch jz0.a() to prevent showAtLocation crash during init ([8444d59](https://github.com/legendsciber/morphe-patches/commit/8444d59602d3df1f3cb949989e6e3342e6733af4))

## [1.17.8](https://github.com/legendsciber/morphe-patches/compare/v1.17.7...v1.17.8) (2026-08-28)

### 🐛 Bug Fixes

* **mctoolbox:** premium - force Q=true, skip F() to prevent BadTokenException crash ([8939dc9](https://github.com/legendsciber/morphe-patches/commit/8939dc96945449110c930753d1f5234489b5bba4))

## [1.17.7](https://github.com/legendsciber/morphe-patches/compare/v1.17.6...v1.17.7) (2026-08-27)

### 🐛 Bug Fixes

* **mctoolbox:** patch ya0 only - skip F() to prevent data binding popup crash ([ffe4835](https://github.com/legendsciber/morphe-patches/commit/ffe4835e208e5c7e95e4e297dffd91e4d093d941))

## [1.17.6](https://github.com/legendsciber/morphe-patches/compare/v1.17.5...v1.17.6) (2026-08-27)

### 🐛 Bug Fixes

* **mctoolbox:** minimal 2-point patch on ya0 only - no UI code touched ([c1cb5e6](https://github.com/legendsciber/morphe-patches/commit/c1cb5e698248e7c00e0c5cfa58b0286e88afa29d))

## [1.17.5](https://github.com/legendsciber/morphe-patches/compare/v1.17.4...v1.17.5) (2026-08-27)

### 🐛 Bug Fixes

* **mctoolbox:** use Handler.postDelayed for overlay to fix crash while keeping floating logo ([2df7107](https://github.com/legendsciber/morphe-patches/commit/2df710721cd1269e8c58d3bc7c416cb7bc444c18))

## [1.17.4](https://github.com/legendsciber/morphe-patches/compare/v1.17.3...v1.17.4) (2026-08-27)

### 🐛 Bug Fixes

* **mctoolbox:** patch tz0.a() to prevent WindowManager.addView overlay crash ([3e567fa](https://github.com/legendsciber/morphe-patches/commit/3e567fa3f1d5caac979bf7f27a2cd8a086b0451b))

## [1.17.3](https://github.com/legendsciber/morphe-patches/compare/v1.17.2...v1.17.3) (2026-08-27)

### 🐛 Bug Fixes

* **mctoolbox:** patch all 4 premium popup classes to prevent BadTokenException ([f7762f1](https://github.com/legendsciber/morphe-patches/commit/f7762f121bc69f054e8c821c35fd7be942406b12))

## [1.17.2](https://github.com/legendsciber/morphe-patches/compare/v1.17.1...v1.17.2) (2026-08-27)

### 🐛 Bug Fixes

* **mctoolbox:** patch jz0.a() to skip premium popup and fix BadTokenException ([0108e04](https://github.com/legendsciber/morphe-patches/commit/0108e04cea4f02277c8364cade569068b3b30bdc))

## [1.17.1](https://github.com/legendsciber/morphe-patches/compare/v1.17.0...v1.17.1) (2026-08-27)

### 🐛 Bug Fixes

* **mctoolbox:** remove F() notification from premium patch to fix BadTokenException crash ([1781510](https://github.com/legendsciber/morphe-patches/commit/1781510ef7424ad1da1d38cbf227f27e3300b71f))

## [1.17.0](https://github.com/legendsciber/morphe-patches/compare/v1.16.0...v1.17.0) (2026-08-27)

### ✨ New Features

* **mctoolbox:** replace Watch Ad patch with direct Premium enable; remove Smash Hit ad removal ([4a66c24](https://github.com/legendsciber/morphe-patches/commit/4a66c2401b1503653713aafc8a0f970d96774e6b))

## [1.16.0](https://github.com/legendsciber/morphe-patches/compare/v1.15.1...v1.16.0) (2026-08-27)

### ✨ New Features

* **smashhit:** rewrite premium patch based on working Entree3k/okish approaches ([e611da3](https://github.com/legendsciber/morphe-patches/commit/e611da3c1d74bfaf9c2f8636fe1f8b43cf7c1a63))

## [1.15.1](https://github.com/legendsciber/morphe-patches/compare/v1.15.0...v1.15.1) (2026-08-27)

### 🐛 Bug Fixes

* **smashhit:** fix storegetstatus/storegeterror fingerprints to match lambda methods ([1487042](https://github.com/legendsciber/morphe-patches/commit/1487042a8795cc5369eb6cc157e41b3359985383))

## [1.15.0](https://github.com/legendsciber/morphe-patches/compare/v1.14.0...v1.15.0) (2026-08-27)

### ✨ New Features

* **smashhit:** patch storegetstatus/storegeterror to fix purchase flow stuck ([ebd28c2](https://github.com/legendsciber/morphe-patches/commit/ebd28c2072f3d06a1503dbff37f47695397860fc))

## [1.14.0](https://github.com/legendsciber/morphe-patches/compare/v1.13.1...v1.14.0) (2026-08-27)

### ✨ New Features

* **smashhit:** patch startPurchaseFlow to prevent Play Store from opening ([7aefb06](https://github.com/legendsciber/morphe-patches/commit/7aefb06ea9e017f488485783faee419ccc1a23cd))

## [1.13.1](https://github.com/legendsciber/morphe-patches/compare/v1.13.0...v1.13.1) (2026-08-27)

### 🐛 Bug Fixes

* **smashhit:** remove incorrect filter from IsProductOwnedFingerprint ([6f9bbd8](https://github.com/legendsciber/morphe-patches/commit/6f9bbd8272b79ddac8f9a72c4840713cd3118106))

## [1.13.0](https://github.com/legendsciber/morphe-patches/compare/v1.12.1...v1.13.0) (2026-08-27)

### ✨ New Features

* **smashhit:** improve premium patch with multi-point bypass and ad-free unlock ([38b0125](https://github.com/legendsciber/morphe-patches/commit/38b0125d5de84d95e64c5f0619e510e1230f1d0b))

## [1.12.1](https://github.com/legendsciber/morphe-patches/compare/v1.12.0...v1.12.1) (2026-08-27)

### 🐛 Bug Fixes

* **smashhit:** remove incorrect fingerprint filters and fix premium fingerprint ([69a5844](https://github.com/legendsciber/morphe-patches/commit/69a584483dac556951e5b87103f4e03170fddd1d))

## [1.12.0](https://github.com/legendsciber/morphe-patches/compare/v1.11.0...v1.12.0) (2026-08-27)

### ✨ New Features

* **smashhit:** add Smash Hit 1.5.14 ad removal and premium patches ([4fe8f22](https://github.com/legendsciber/morphe-patches/commit/4fe8f2281fc36f927847059b0fa0682b74a347de))

## [1.11.0](https://github.com/legendsciber/morphe-patches/compare/v1.10.0...v1.11.0) (2026-08-27)

### ✨ New Features

* **hillclimb:** drop 1.70.0 support, keep only 1.71.1 ([23dab78](https://github.com/legendsciber/morphe-patches/commit/23dab789b39f1e3d775d96c8f698f8465a02ee11))

## [1.10.0](https://github.com/legendsciber/morphe-patches/compare/v1.9.0...v1.10.0) (2026-08-27)

### ✨ New Features

* **hillclimb:** add Hill Climb Racing 1.71.1 support and fix lambda classes ([cef79b7](https://github.com/legendsciber/morphe-patches/commit/cef79b7458b57d26aad95b9e9373d48fb56bef45))

## [1.9.0](https://github.com/legendsciber/morphe-patches/compare/v1.8.1...v1.9.0) (2026-08-27)

### ✨ New Features

* **blockblast:** split ad removal and premium into separate patches ([8801ff0](https://github.com/legendsciber/morphe-patches/commit/8801ff0782c3f2cb0ba5a9d26b986cc9d0421725))

## [1.8.1](https://github.com/legendsciber/morphe-patches/compare/v1.8.0...v1.8.1) (2026-08-26)

### 🐛 Bug Fixes

* **blockblast:** correct AdSdkInitFingerprint method name to h(Context) ([1ffd2bb](https://github.com/legendsciber/morphe-patches/commit/1ffd2bb629c22c640897bf02c6833edb5eb50236))

## [1.8.0](https://github.com/legendsciber/morphe-patches/compare/v1.7.4...v1.8.0) (2026-08-26)

### ✨ New Features

* **blockblast:** add ad removal + subscription simulation patch ([6e4c075](https://github.com/legendsciber/morphe-patches/commit/6e4c075afafae50d689d1ca79e78b379c716e21a))

## [1.7.4](https://github.com/legendsciber/morphe-patches/compare/v1.7.3...v1.7.4) (2026-08-26)

### 🐛 Bug Fixes

* **mctoolbox:** also set internal/premium_unlocked and refresh ya0.Q flag ([7a70d7d](https://github.com/legendsciber/morphe-patches/commit/7a70d7d58e121e678ae5f4b6bb3e554a3c731757))

## [1.7.3](https://github.com/legendsciber/morphe-patches/compare/v1.7.2...v1.7.3) (2026-08-26)

### 🐛 Bug Fixes

* **mctoolbox:** use bridge.b.S() to directly write premium time instead of native I(900.0f) ([e1f5e14](https://github.com/legendsciber/morphe-patches/commit/e1f5e1451b10048918ba4b64d8fc658ea8a9f022))

## [1.7.2](https://github.com/legendsciber/morphe-patches/compare/v1.7.1...v1.7.2) (2026-08-26)

### 🐛 Bug Fixes

* **mctoolbox:** watch-ad instant reward now actually grants +15min premium ([87ec60e](https://github.com/legendsciber/morphe-patches/commit/87ec60ef0e17a4b6729363ef4b37ffdca895295b))

## [1.7.1](https://github.com/legendsciber/morphe-patches/compare/v1.7.0...v1.7.1) (2026-08-26)

### 🐛 Bug Fixes

* **mctoolbox:** watch-ad instant reward now actually grants +15min premium ([eb02de4](https://github.com/legendsciber/morphe-patches/commit/eb02de4f8ec4967a8c59ece4289ea8d5982a1723))
* **mctoolbox:** watch-ad instant reward now actually grants +15min premium ([500984a](https://github.com/legendsciber/morphe-patches/commit/500984aba5af19bd5117e9d0bea80cc3f5b695f8))

## [1.7.0](https://github.com/legendsciber/morphe-patches/compare/v1.6.0...v1.7.0) (2026-08-26)

### 🐛 Bug Fixes

* **mctoolbox:** compile errors — escape dollar signs, simplify to prepend injection ([8aca409](https://github.com/legendsciber/morphe-patches/commit/8aca40935eb60e567655bfd6f21c825d56ba4127))

### ✨ New Features

* **mctoolbox:** watch-ad failure handler now instantly grants +15min premium ([2c15b29](https://github.com/legendsciber/morphe-patches/commit/2c15b29936ac009bd4be7fcb58c7189d1efe65ac))

## [1.6.0](https://github.com/legendsciber/morphe-patches/compare/v1.5.0...v1.6.0) (2026-08-25)

### ✨ New Features

* **mctoolbox:** watch-ad grants +15min instantly without playing any ad ([eb5f456](https://github.com/legendsciber/morphe-patches/commit/eb5f456d3bd44f8c55a218aa035ef73254dac920))

## [1.5.0](https://github.com/legendsciber/morphe-patches/compare/v1.4.4...v1.5.0) (2026-08-25)

### ✨ New Features

* **mctoolbox:** instant watch-ad premium (no ads, always unlocked); remove version unlock patch ([93237c3](https://github.com/legendsciber/morphe-patches/commit/93237c3893bc26d10c1565af8b5a278b24974ab8))

## [1.4.4](https://github.com/legendsciber/morphe-patches/compare/v1.4.3...v1.4.4) (2026-08-25)

### 🐛 Bug Fixes

* **mctoolbox:** NoSuchMethodError — edit() must be called on SharedPreferences, not on Editor ([013d3b1](https://github.com/legendsciber/morphe-patches/commit/013d3b117e073fe86393bbec327a46cc9c2a5557))

## [1.4.3](https://github.com/legendsciber/morphe-patches/compare/v1.4.2...v1.4.3) (2026-08-25)

### 🐛 Bug Fixes

* **mctoolbox:** escape dollar sign in raw string (Kotlin interpolation broke smali) ([d9762a3](https://github.com/legendsciber/morphe-patches/commit/d9762a39f43042cbe718287c339d2ede4bc85910))
* **mctoolbox:** play-spoof writes test=0 pref at onCreate entry (covers all installer names) ([e3ac36c](https://github.com/legendsciber/morphe-patches/commit/e3ac36ce88be9cfa7102da5bdcd0082e69292322))

## [1.4.2](https://github.com/legendsciber/morphe-patches/compare/v1.4.1...v1.4.2) (2026-08-25)

### 🐛 Bug Fixes

* **mctoolbox:** VerifyError — play-spoof inject after startsWith move-result, not between invoke/result ([b9d1e78](https://github.com/legendsciber/morphe-patches/commit/b9d1e7829ac9a189a82ce6af13c5adaf682561e5))

## [1.4.1](https://github.com/legendsciber/morphe-patches/compare/v1.4.0...v1.4.1) (2026-08-25)

### 🐛 Bug Fixes

* **mctoolbox:** VerifyError — inject only at c() result sites, skip inverted :655 ([380bc96](https://github.com/legendsciber/morphe-patches/commit/380bc96d30c7a5ccc20c2324f5ab419012861777))

## [1.4.0](https://github.com/legendsciber/morphe-patches/compare/v1.3.1...v1.4.0) (2026-08-25)

### ✨ New Features

* **mctoolbox:** drop package redirect; final duo = version unlock + play spoof ([fd63c6d](https://github.com/legendsciber/morphe-patches/commit/fd63c6d5177f5fbf146638c9e1865c452a2718be))

## [1.3.1](https://github.com/legendsciber/morphe-patches/compare/v1.3.0...v1.3.1) (2026-08-25)

### 🐛 Bug Fixes

* **mctoolbox:** drop exact accessFlags from fingerprint; proper 64-bit gate bypass ([b5a8f7c](https://github.com/legendsciber/morphe-patches/commit/b5a8f7cd14d9187b8d8cb8260567595ea38c981d))
* **mctoolbox:** repair Fingerprints.kt (duplicate object, stray paren, missing lookup fp) ([90194e9](https://github.com/legendsciber/morphe-patches/commit/90194e9d49e4d6b70d6102301c82e014402c92e6))

## [1.3.0](https://github.com/legendsciber/morphe-patches/compare/v1.2.0...v1.3.0) (2026-08-25)

### ✨ New Features

* **mctoolbox:** split into granular patches (install/version/abi/play) ([9c2e379](https://github.com/legendsciber/morphe-patches/commit/9c2e379d12aacbe5bd7a0845268e43e7e52d8ae2))

## [1.2.0](https://github.com/legendsciber/morphe-patches/compare/v1.1.0...v1.2.0) (2026-08-24)

### ✨ New Features

* **mctoolbox:** bypass 32/64-bit supported-version gates ([81eaf21](https://github.com/legendsciber/morphe-patches/commit/81eaf21b7208fb51e74c8cf92b3d38dc0ec10058))

## [1.1.0](https://github.com/legendsciber/morphe-patches/compare/v1.0.1...v1.1.0) (2026-08-24)

### ✨ New Features

* **mctoolbox:** always-valid install location patch for Toolbox 5.4.58 ([7d386ac](https://github.com/legendsciber/morphe-patches/commit/7d386aca3fdfbb46b10880b0fe0f179245f43165))

## [1.0.1](https://github.com/legendsciber/morphe-patches/compare/v1.0.0...v1.0.1) (2026-08-24)

### 🐛 Bug Fixes

* **ci:** remove dev backmerge plugin from releaserc ([4082c24](https://github.com/legendsciber/morphe-patches/commit/4082c240c2e3518b864fa6fe593fa9cbda033fa6))

## 1.0.0 (2026-08-23)

### 🐛 Bug Fixes

* **ci:** remove npm cache option from release workflow (no lockfile in repo) ([d80d678](https://github.com/legendsciber/morphe-patches/commit/d80d678aae39f183fedfdd7aafb7a0da0e46396b))
* replace returnEarly with inline return-void instructions ([2a5265b](https://github.com/legendsciber/morphe-patches/commit/2a5265b97133919f4c89885b6cb937d59d958223))

### ✨ New Features

* Hill Climb Racing patches (initial release) ([b695860](https://github.com/legendsciber/morphe-patches/commit/b6958607ffa2199a55832f0628b5bc2d0a5dbf74))
