## [1.4.27](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.26...v1.4.27) (2026-09-30)

### 🐛 Bug Fixes

* resolve crash on start by keeping loop bytecode intact and safe build call ([dbd2e15](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/dbd2e154a182e40a610f2bc5d5b908b70736ac60))

## [1.4.26](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.25...v1.4.26) (2026-09-30)

### 🐛 Bug Fixes

* prevent duplicate key and empty root crashes when selecting media provider ([3d733b1](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/3d733b1e87dfb75497e22f63544b29b2a31e62e9))

## [1.4.25](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.24...v1.4.25) (2026-09-30)

### 🐛 Bug Fixes

* remove non-public field access on bwyf to prevent VerifyError crash ([eac7ebe](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/eac7ebe51a9981afce8af1a092e9337a334ba4cb))

## [1.4.24](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.23...v1.4.24) (2026-09-30)

### 🐛 Bug Fixes

* direct injection of Morphe YT Music ResolveInfo fallback into media providers map ([210b0d9](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/210b0d92fd591b6f59db6ef944c13a242cb2350d))

## [1.4.23](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.22...v1.4.23) (2026-09-30)

### 🐛 Bug Fixes

* set explicit package on MediaBrowserService Intent and fix XML namespace in manifest patch ([96047dc](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/96047dc9182488f29fb54b7715b24ca657e37fbf))

## [1.4.22](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.21...v1.4.22) (2026-09-30)

### 🐛 Bug Fixes

* use addInstructions before queryIntentServices for MATCH_ALL injection (not between invoke and move-result) ([fddc3a9](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/fddc3a98d531775a5012559898ba449ccd26d7fc))

## [1.4.21](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.20...v1.4.21) (2026-09-30)

### 🐛 Bug Fixes

* correct BsmaTrustedAppsFingerprint filter order to match bytecode order (mango[18] before music[19]) ([9860c7f](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/9860c7ff3955e8cc7b33f81434f45823553a284a))

## [1.4.20](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.19...v1.4.20) (2026-09-30)

### 🐛 Bug Fixes

* correct const/high16 literal to 0x20000 (full 32-bit value, not raw high-word 0x0002) ([d8edc78](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/d8edc783acd7fe2c91241f1c94cf123d8c37e334))

## [1.4.19](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.18...v1.4.19) (2026-09-29)

### 🐛 Bug Fixes

* inject MATCH_ALL via same-size CHECK_CAST replacement to avoid method expansion and startup crash ([0b70df9](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/0b70df9f3fe94bd5422226cb014c141df39eb72e))

## [1.4.18](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.17...v1.4.18) (2026-09-29)

### 🐛 Bug Fixes

* replace YT Music package in bsma.a trusted allowlist so Maps accepts Morphe YT Music ([5e29368](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/5e293680428981e42e8f6a0493e7b183d4762102))

## [1.4.17](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.16...v1.4.17) (2026-09-29)

### 🐛 Bug Fixes

* revert to stable 6daf2cb content - no startup crash ([cd95a4d](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/cd95a4daa818d7e9ce6acacab594c40f3d5139ae))

## [1.4.16](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.15...v1.4.16) (2026-09-29)

### 🐛 Bug Fixes

* eliminate all addInstructions calls - use only replaceInstruction to prevent startup crash from offset shifts ([3d76b91](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/3d76b910976ea31378c6411c2a81e07a7433b5d7))

## [1.4.15](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.14...v1.4.15) (2026-09-29)

### 🐛 Bug Fixes

* safely bypass cpwy.b and cpwy.d by explicitly targeting the if-eqz register to prevent memory corruption ([a4deea5](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/a4deea5067846e7551f3d4c32d60c03cbaed5bda))

## [1.4.14](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.13...v1.4.14) (2026-09-29)

### 🐛 Bug Fixes

* revert to EXACT 1.8.6 stable code for bytecode patches to resolve UI click crash ([c6e7d25](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/c6e7d256d28bfaf3eda83d4d4cd7dc53a8d441f0))

## [1.4.13](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.12...v1.4.13) (2026-09-29)

### 🐛 Bug Fixes

* remove global apww.l() patch causing NPE on media session creation ([f1f80f0](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/f1f80f05838d200645d81937cf38d9fad4829c80))

## [1.4.12](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.11...v1.4.12) (2026-09-29)

### 🐛 Bug Fixes

* replace move-result atomically to avoid addInstructions offset bug ([e47b2f1](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/e47b2f1b6658c6c396b9adc0e857f05f079b4d6c))

## [1.4.11](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.10...v1.4.11) (2026-09-29)

### 🐛 Bug Fixes

* add MATCH_ALL injection but conditionally preserve move-result register to prevent NullPointerException ([0336789](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/0336789ec3bd6cf1f7ac1c150338ada3d1b2ee22))

## [1.4.10](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.9...v1.4.10) (2026-09-29)

### 🐛 Bug Fixes

* remove MATCH_ALL to prevent VerifyError, use safe boolean flag override ([678e7d1](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/678e7d10cdcccfe104467ddee172612f1000b526))

## [1.4.9](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.8...v1.4.9) (2026-09-29)

### 🐛 Bug Fixes

* safely restore MATCH_ALL flag after move-result-object ([1feb38f](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/1feb38f077ef6818c4e47c16b0e9c51b98804be2))

## [1.4.8](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.7...v1.4.8) (2026-09-29)

### 🐛 Bug Fixes

* hardcode target package to bypass CLI config cache ([0e34fd4](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/0e34fd4160c48ae6a838a89e753675e2454e79b1))
* revert boolean flag bypass that causes startup crash ([5a28b5e](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/5a28b5e4cb17597d19c6aac2dce465a9db20cd20))

## [1.4.7](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.6...v1.4.7) (2026-09-29)

### 🐛 Bug Fixes

* use boolean flag bypass to safely allow Morphe YT Music ([f35a6cf](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/f35a6cfde584a470acfcd38716160037020f248c))

## [1.4.6](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.5...v1.4.6) (2026-09-29)

### 🐛 Bug Fixes

* enforce MATCH_ALL flag safely with register restoration ([bc66f10](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/bc66f109bbf3bb99d0d322c28f6e6fa7f6cbf133))

## [1.4.5](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.4...v1.4.5) (2026-09-29)

### 🐛 Bug Fixes

* revert queryIntentServices MATCH_ALL injection ([6daf2cb](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/6daf2cb346c69d38eeba491c40d88116e5a775c6))

## [1.4.4](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.3...v1.4.4) (2026-09-29)

### 🐛 Bug Fixes

* enforce MATCH_ALL flag in queryIntentServices to fix Android 11+ visibility for YT Music ([272d966](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/272d966dcd314fe4fe19551d37e41ec7130e109f))
* use FiveRegisterInstruction instead of Instruction35c to fix build ([6d9a2c3](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/6d9a2c3432eebffc816d74eec6c52e1ccb7ef2ad))

## [1.4.3](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.2...v1.4.3) (2026-09-29)

### 🐛 Bug Fixes

* actually revert spotify bypass to trigger release ([cadce2b](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/cadce2bfaa644410e35737d11a6084213afcad31))
* revert RestoreMapDataPatch crash fixes that break v1.4.0 ([ebf1827](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/ebf1827c0880b01a2a25acd32191e8d417d8dff9))

## [1.4.2](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.1...v1.4.2) (2026-09-29)

## [1.4.1](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.4.0...v1.4.1) (2026-09-29)

### 🐛 Bug Fixes

* add missing replaceInstruction import in RestoreMapDataPatch ([5ed2970](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/5ed2970355a6f303ff89408b0d480a9c52814a06))
* apply known crash fixes to v1.4.0 RestoreMapDataPatch ([c68818b](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/c68818bd6590c172732092f71e84d2316ed1f74c))
* refine media provider bypass to include Spotify without causing duplicates ([6f2ec06](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/6f2ec06af32014757b4c1b6f106b8eeef859e7c3))

## [1.4.0](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.3.1...v1.4.0) (2026-09-28)

### ✨ New Features

* **maps:** add package renaming and MicroG spoofing patches ([c9b0b2d](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/c9b0b2d552bf39749d071ddb260067665a2845d5))

## [1.3.1](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.3.0...v1.3.1) (2026-09-27)

### 🐛 Bug Fixes

* **maps:** resolve crash by preventing duplicate keys in media provider map ([8576bf0](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/8576bf062aab405be3954fc5faf25bfb833663bd))

## [1.3.0](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.2.0...v1.3.0) (2026-09-27)

### ✨ New Features

* **maps:** comprehensive bypass for navigation media provider resolution ([d857279](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/d857279894362da5cd7216fcb26a85444116ef97))

## [1.2.0](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.1.0...v1.2.0) (2026-09-27)

### ✨ New Features

* **maps:** force phenotype media feature flag to true and allow apkm bundles ([73ceb0f](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/73ceb0fa368eb8fb47a976f631b49e91186c8aaf))

## [1.1.0](https://github.com/bartlomiejfornalczyk/morphe-patches/compare/v1.0.0...v1.1.0) (2026-09-27)

### ✨ New Features

* add manifest package visibility and bypass server flag for Google Maps YouTube Music ([18a19cf](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/18a19cfc51cf94f631770ac2566e164ab9c026cd))

## 1.0.0 (2026-09-27)

### ✨ New Features

* update patches-bundle manifest for v1.0.0 ([dfb83f8](https://github.com/bartlomiejfornalczyk/morphe-patches/commit/dfb83f817257f08605739e41cd75d1b5f244f64c))
