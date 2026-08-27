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
