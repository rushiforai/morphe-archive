## [1.9.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.8.6...v1.9.0) (2026-09-10)

### ✨ New Features

* **scannerradio:** patch all 12 pairip-injected lifecycle methods ([a96f165](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/a96f16525fc9cd2246821f786034a0cd7e4e5a71))

## [1.8.6](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.8.5...v1.8.6) (2026-09-10)

### 🐛 Bug Fixes

* **scannerradio:** fix Kotlin lexer errors by removing string templates from R8 init ([b5942cc](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/b5942cc4e4d05fabc7d5f1ce2337be71971e5bba))

## [1.8.5](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.8.4...v1.8.5) (2026-09-10)

### 🐛 Bug Fixes

* **scannerradio:** init all R8 string dedup classes to prevent null NPEs in hiltInternalInject ([076864d](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/076864d2eb8e97d8b34e0ca670eb841dab7bb0a3))

## [1.8.4](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.8.3...v1.8.4) (2026-09-10)

### 🐛 Bug Fixes

* **scannerradio:** remove smali comments from injected instructions ([83e249f](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/83e249f13b0cbca0f7282bb02732acfbeef6d2c6))

## [1.8.3](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.8.2...v1.8.3) (2026-09-09)

### 🐛 Bug Fixes

* **scannerradio:** init R8 string dedup fields to prevent sjJeZY NPE ([cd680b3](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/cd680b305be9b96ff7e18af182fb52ccf8d422ba))

## [1.8.2](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.8.1...v1.8.2) (2026-09-09)

### 🐛 Bug Fixes

* **scannerradio:** call parent onCreate() instead of no-op to preserve Hilt DI ([c2bfad6](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/c2bfad63b5009ec1257c7ac3bf1e101e45d535ce))

## [1.8.1](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.8.0...v1.8.1) (2026-09-09)

### 🐛 Bug Fixes

* **scannerradio:** no-op MyApplication.onCreate() pairip-injected IronSource reflection ([643a58a](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/643a58a4368114cd46a4d805c672dd24f395a5b2))

## [1.8.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.7.5...v1.8.0) (2026-09-09)

### ✨ New Features

* **scannerradio:** add Pairip DRM bypass to fix startup SIGSEGV ([e96b89a](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/e96b89abdcdb606575325f550d97e199e7ce4a45))

## [1.7.5](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.7.4...v1.7.5) (2026-09-09)

### 🐛 Bug Fixes

* **scannerradio:** remove broken File() operations from BrandingPatch ([33cab2b](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/33cab2b3bcf6c1039e6359de5216c4cd4330c21b))

## [1.7.4](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.7.3...v1.7.4) (2026-09-09)

### 🐛 Bug Fixes

* **scannerradio:** remove accessFlags from fingerprints ([8d2e929](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/8d2e929713f964a4e78210c8705554091fa0a341))

## [1.7.3](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.7.2...v1.7.3) (2026-09-09)

### 🐛 Bug Fixes

* **scannerradio:** InMobi SdkInitializationListener is standalone in v8.29 ([af931ae](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/af931ae1d7f5f514954690c42e23098380d00e1b))

## [1.7.2](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.7.1...v1.7.2) (2026-09-09)

### 🐛 Bug Fixes

* **scannerradio:** use real smali class names not jadx deobfuscated names ([c1d8f13](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/c1d8f13474276dd606af7da4b5e2b334f950a826))

## [1.7.1](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.7.0...v1.7.1) (2026-09-09)

### 🐛 Bug Fixes

* **scannerradio:** update fingerprints for v8.29 ProGuard mapping ([d2efc9e](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/d2efc9e46db64f505583c5fc86a7b22843f209ca))

## [1.7.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.6.0...v1.7.0) (2026-09-09)

### ✨ New Features

* **scannerradio:** add minSdk=29 to Scanner Radio target ([f5fa369](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/f5fa36949b2bc6da0b1877ce9903dd9863476ecf))

## [1.6.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.5.0...v1.6.0) (2026-09-08)

### ✨ New Features

* **scannerradio:** make patches version-agnostic ([9c74cc8](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/9c74cc8783b61a27b0cb1e7a3a3ec78e3db625ef))

## [1.5.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.4.0...v1.5.0) (2026-09-08)

### 🐛 Bug Fixes

* **crimeradar:** disable debug settings patch (default=false) ([5d16621](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5d1662140520f41e483056d0709266beb8ddcbbc))
* **crimeradar:** fix debug settings patch (insert before return-void, remove onClick) ([41847f7](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/41847f737485c3f4cbc2875a440d8c96953bb7f9))
* **crimeradar:** point patches-bundle.json to v1.3.1 (v1.4.0 asset deleted) ([c69e362](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/c69e3628aa49ddf0f45be8722bb2aa5272dcc895))
* **crimeradar:** strip comments from debug settings smali (may fix assembler) ([4363e05](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/4363e052ae2add9d5e227581c798ad3a73b6d4e2))
* **crimeradar:** update patches-bundle.json to v1.4.0 (fixed debug settings) ([b76dada](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/b76dadaba784d522e511719ef80c7e6ee4e7ed7c))
* **crimeradar:** update patches-bundle.json to v1.4.0 (published release) ([1569505](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/15695055938ef1af63d63b5a059674a65d727424))
* **crimeradar:** update patches-bundle.json to v1.4.1 ([54e31b9](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/54e31b95eaa38f04d158a686d567825203ed337d))
* **crimeradar:** update patches-bundle.json to v1.4.1 ([e23487d](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/e23487dcbac5a1313c065d6918bf8ef83796b9c3))

### ✨ New Features

* **scannerradio:** add morphe patches for Scanner Radio v8.21.1 ([ec793c8](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/ec793c88c5c4551d6b76425b72b0dcae66c2d8f3))

## [1.4.1](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.4.0...v1.4.1) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** disable debug settings patch (default=false) ([5d16621](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5d1662140520f41e483056d0709266beb8ddcbbc))
* **crimeradar:** fix debug settings patch (insert before return-void, remove onClick) ([41847f7](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/41847f737485c3f4cbc2875a440d8c96953bb7f9))
* **crimeradar:** point patches-bundle.json to v1.3.1 (v1.4.0 asset deleted) ([c69e362](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/c69e3628aa49ddf0f45be8722bb2aa5272dcc895))
* **crimeradar:** strip comments from debug settings smali (may fix assembler) ([4363e05](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/4363e052ae2add9d5e227581c798ad3a73b6d4e2))
* **crimeradar:** update patches-bundle.json to v1.4.0 (fixed debug settings) ([b76dada](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/b76dadaba784d522e511719ef80c7e6ee4e7ed7c))
* **crimeradar:** update patches-bundle.json to v1.4.0 (published release) ([1569505](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/15695055938ef1af63d63b5a059674a65d727424))
* **crimeradar:** update patches-bundle.json to v1.4.1 ([54e31b9](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/54e31b95eaa38f04d158a686d567825203ed337d))
* **crimeradar:** update patches-bundle.json to v1.4.1 ([e23487d](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/e23487dcbac5a1313c065d6918bf8ef83796b9c3))

## [1.4.1](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.4.0...v1.4.1) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** disable debug settings patch (default=false) ([5d16621](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5d1662140520f41e483056d0709266beb8ddcbbc))
* **crimeradar:** fix debug settings patch (insert before return-void, remove onClick) ([41847f7](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/41847f737485c3f4cbc2875a440d8c96953bb7f9))
* **crimeradar:** point patches-bundle.json to v1.3.1 (v1.4.0 asset deleted) ([c69e362](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/c69e3628aa49ddf0f45be8722bb2aa5272dcc895))
* **crimeradar:** update patches-bundle.json to v1.4.0 (fixed debug settings) ([b76dada](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/b76dadaba784d522e511719ef80c7e6ee4e7ed7c))
* **crimeradar:** update patches-bundle.json to v1.4.0 (published release) ([1569505](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/15695055938ef1af63d63b5a059674a65d727424))
* **crimeradar:** update patches-bundle.json to v1.4.1 ([e23487d](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/e23487dcbac5a1313c065d6918bf8ef83796b9c3))

## [1.4.1](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.4.0...v1.4.1) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** fix debug settings patch (insert before return-void, remove onClick) ([41847f7](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/41847f737485c3f4cbc2875a440d8c96953bb7f9))
* **crimeradar:** point patches-bundle.json to v1.3.1 (v1.4.0 asset deleted) ([c69e362](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/c69e3628aa49ddf0f45be8722bb2aa5272dcc895))
* **crimeradar:** update patches-bundle.json to v1.4.0 (fixed debug settings) ([b76dada](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/b76dadaba784d522e511719ef80c7e6ee4e7ed7c))
* **crimeradar:** update patches-bundle.json to v1.4.0 (published release) ([1569505](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/15695055938ef1af63d63b5a059674a65d727424))

## [1.4.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.3.0...v1.4.0) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** disable debug settings patch (causes settings crash) ([f582b87](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/f582b87078335b0e578d02ce221fb73f0a293555))
* **crimeradar:** fix debug settings crash (wrong DEX field name id vs jadx f38808id) ([4d8b1e8](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/4d8b1e8df34a2472d6c8334aecf16097309cb3b9))
* **crimeradar:** point patches-bundle.json to stable v1.3.1 (disable broken debug settings) ([0b91f61](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/0b91f6152983fbae5d97c4292ee08df41134f6fc))
* **crimeradar:** remove broken notification range patch (crashes settings screen) ([5e51f24](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5e51f24c2fcc53915e6af9879badf45109935452))
* **crimeradar:** update patches-bundle.json to v1.3.1 ([06071bf](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/06071bf0994308039d057ee16b25479f5c3b8ac4))
* **crimeradar:** update patches-bundle.json to v1.4.0 ([98ca4fa](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/98ca4fa03eb7f4ec3dfc8185a8f9657e75766400))
* **crimeradar:** update patches-bundle.json to v1.4.0 ([2ea1078](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/2ea107867f6e360f5f53e49d374d0ae12057c217))
* **crimeradar:** update patches-bundle.json to v1.4.0 ([d7bc462](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/d7bc462b09f4b3d5dca1f8e03cd53bc2bb1ae4e0))

### ✨ New Features

* **crimeradar:** add debug settings panel to settings screen ([b7eb8c9](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/b7eb8c96cbc7942caf712a3de589182708f328e3))

## [1.4.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.3.0...v1.4.0) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** fix debug settings crash (wrong DEX field name id vs jadx f38808id) ([4d8b1e8](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/4d8b1e8df34a2472d6c8334aecf16097309cb3b9))
* **crimeradar:** remove broken notification range patch (crashes settings screen) ([5e51f24](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5e51f24c2fcc53915e6af9879badf45109935452))
* **crimeradar:** update patches-bundle.json to v1.3.1 ([06071bf](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/06071bf0994308039d057ee16b25479f5c3b8ac4))
* **crimeradar:** update patches-bundle.json to v1.4.0 ([2ea1078](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/2ea107867f6e360f5f53e49d374d0ae12057c217))
* **crimeradar:** update patches-bundle.json to v1.4.0 ([d7bc462](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/d7bc462b09f4b3d5dca1f8e03cd53bc2bb1ae4e0))

### ✨ New Features

* **crimeradar:** add debug settings panel to settings screen ([b7eb8c9](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/b7eb8c96cbc7942caf712a3de589182708f328e3))

## [1.4.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.3.0...v1.4.0) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** remove broken notification range patch (crashes settings screen) ([5e51f24](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5e51f24c2fcc53915e6af9879badf45109935452))
* **crimeradar:** update patches-bundle.json to v1.3.1 ([06071bf](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/06071bf0994308039d057ee16b25479f5c3b8ac4))
* **crimeradar:** update patches-bundle.json to v1.4.0 ([d7bc462](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/d7bc462b09f4b3d5dca1f8e03cd53bc2bb1ae4e0))

### ✨ New Features

* **crimeradar:** add debug settings panel to settings screen ([b7eb8c9](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/b7eb8c96cbc7942caf712a3de589182708f328e3))

## [1.3.1](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.3.0...v1.3.1) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** remove broken notification range patch (crashes settings screen) ([5e51f24](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5e51f24c2fcc53915e6af9879badf45109935452))
* **crimeradar:** update patches-bundle.json to v1.3.1 ([06071bf](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/06071bf0994308039d057ee16b25479f5c3b8ac4))

## [1.3.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.2.2...v1.3.0) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** update patches-bundle.json to v1.3.0 ([020f8b8](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/020f8b86b1e3cc813b5891e8940c621f027654e4))

### ✨ New Features

* **crimeradar:** add branding patch (app name 'CrimeRadar+' + purple icon tint) ([9d0db33](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/9d0db33db9027315f3c8bee0a6d71b36f51cf1e9))
* **crimeradar:** add notification range patch (5x radius multiplier) ([cb37773](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/cb37773d301968e42d9e8d5ab862d6094baa781a))
* **crimeradar:** notification range extended (5x radius multiplier) ([19979fe](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/19979fe0ae9b8f3cb2f6c2dfe9b85bd9ff18d6a6))

## [1.3.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.2.2...v1.3.0) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** update patches-bundle.json to v1.3.0 ([020f8b8](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/020f8b86b1e3cc813b5891e8940c621f027654e4))

### ✨ New Features

* **crimeradar:** add branding patch (app name 'CrimeRadar+' + purple icon tint) ([9d0db33](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/9d0db33db9027315f3c8bee0a6d71b36f51cf1e9))
* **crimeradar:** add notification range patch (5x radius multiplier) ([cb37773](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/cb37773d301968e42d9e8d5ab862d6094baa781a))

## [1.3.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.2.2...v1.3.0) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** update patches-bundle.json to v1.3.0 ([020f8b8](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/020f8b86b1e3cc813b5891e8940c621f027654e4))

### ✨ New Features

* **crimeradar:** add branding patch (app name 'CrimeRadar+' + purple icon tint) ([9d0db33](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/9d0db33db9027315f3c8bee0a6d71b36f51cf1e9))

## [1.2.2](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.2.1...v1.2.2) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** remove server-enforced location limit patch (does not work) ([c472bee](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/c472beecd80b091530d87de28b5677f32b1ef466))

## [1.2.1](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.2.0...v1.2.1) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** correct HistoryCap and Adjust fingerprint access flags ([7375ee6](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/7375ee647882e20ed851d8ec208811d8250013c2))
* **crimeradar:** remove broken Z() replay fingerprint ([7d17d2e](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/7d17d2e51aacf2d44db50422be4dbbea83a3448f))
* **crimeradar:** remove Z() fingerprint, keep Y() only for replay minutes ([3a9c71f](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/3a9c71fed5ad3f4c9a6b6dde93355913e70d22ef))
* **crimeradar:** update patches-bundle.json to v1.2.1 ([81c6d5d](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/81c6d5da2afb7b51dbd92f3d4820089bdadc72f6))
* **crimeradar:** update patches-bundle.json to v1.2.1 ([5965e95](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5965e95720e66e36acbab27aa9fe8ca8cbb929dd))

## [1.2.1](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.2.0...v1.2.1) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** correct HistoryCap and Adjust fingerprint access flags ([7375ee6](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/7375ee647882e20ed851d8ec208811d8250013c2))
* **crimeradar:** remove Z() fingerprint, keep Y() only for replay minutes ([3a9c71f](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/3a9c71fed5ad3f4c9a6b6dde93355913e70d22ef))
* **crimeradar:** update patches-bundle.json to v1.2.1 ([81c6d5d](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/81c6d5da2afb7b51dbd92f3d4820089bdadc72f6))
* **crimeradar:** update patches-bundle.json to v1.2.1 ([5965e95](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5965e95720e66e36acbab27aa9fe8ca8cbb929dd))

## [1.2.1](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.2.0...v1.2.1) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** correct HistoryCap and Adjust fingerprint access flags ([7375ee6](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/7375ee647882e20ed851d8ec208811d8250013c2))
* **crimeradar:** update patches-bundle.json to v1.2.1 ([81c6d5d](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/81c6d5da2afb7b51dbd92f3d4820089bdadc72f6))
* **crimeradar:** update patches-bundle.json to v1.2.1 ([5965e95](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5965e95720e66e36acbab27aa9fe8ca8cbb929dd))

## [1.2.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.1.3...v1.2.0) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** patch all premium gates (promotions, paywalls, map limits) ([5915d57](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5915d57f8f3963e69a0d0c8e2505624070e66e04))
* **crimeradar:** update patches-bundle.json to v1.1.4 ([9ae388a](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/9ae388a6ed97b6f61c788499cd01f32a0e588942))
* **crimeradar:** update patches-bundle.json to v1.2.0 ([2d13c0b](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/2d13c0bd4172eadcf0540661ac83ea9289c22f1a))
* **crimeradar:** update patches-bundle.json to v1.2.0 with all patches ([5c9ddb8](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5c9ddb8b25d6f12703496d42c9db36fc1d54ada6))

### ✨ New Features

* **crimeradar:** add replay minutes, telemetry kill, history cap, notification patches ([e1b3f5c](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/e1b3f5ce18633ef13cc6ef0eaad241e930349a89))
* **crimeradar:** override server-sent location limit to 999 ([ece784b](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/ece784bef7cf86fe6ac6415a13a0fb91b7837aaf))

## [1.2.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.1.3...v1.2.0) (2026-08-24)

### 🐛 Bug Fixes

* **crimeradar:** patch all premium gates (promotions, paywalls, map limits) ([5915d57](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5915d57f8f3963e69a0d0c8e2505624070e66e04))
* **crimeradar:** update patches-bundle.json to v1.1.4 ([9ae388a](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/9ae388a6ed97b6f61c788499cd01f32a0e588942))
* **crimeradar:** update patches-bundle.json to v1.2.0 ([2d13c0b](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/2d13c0bd4172eadcf0540661ac83ea9289c22f1a))
* **crimeradar:** update patches-bundle.json to v1.2.0 with all patches ([5c9ddb8](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5c9ddb8b25d6f12703496d42c9db36fc1d54ada6))

### ✨ New Features

* **crimeradar:** add replay minutes, telemetry kill, history cap, notification patches ([e1b3f5c](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/e1b3f5ce18633ef13cc6ef0eaad241e930349a89))
* **crimeradar:** override server-sent location limit to 999 ([ece784b](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/ece784bef7cf86fe6ac6415a13a0fb91b7837aaf))

## [1.2.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.1.3...v1.2.0) (2026-08-23)

### 🐛 Bug Fixes

* **crimeradar:** patch all premium gates (promotions, paywalls, map limits) ([5915d57](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5915d57f8f3963e69a0d0c8e2505624070e66e04))
* **crimeradar:** update patches-bundle.json to v1.1.4 ([9ae388a](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/9ae388a6ed97b6f61c788499cd01f32a0e588942))
* **crimeradar:** update patches-bundle.json to v1.2.0 ([2d13c0b](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/2d13c0bd4172eadcf0540661ac83ea9289c22f1a))

### ✨ New Features

* **crimeradar:** override server-sent location limit to 999 ([ece784b](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/ece784bef7cf86fe6ac6415a13a0fb91b7837aaf))

## [1.1.4](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.1.3...v1.1.4) (2026-08-23)

### 🐛 Bug Fixes

* **crimeradar:** patch all premium gates (promotions, paywalls, map limits) ([5915d57](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5915d57f8f3963e69a0d0c8e2505624070e66e04))
* **crimeradar:** update patches-bundle.json to v1.1.4 ([9ae388a](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/9ae388a6ed97b6f61c788499cd01f32a0e588942))

## [1.1.3](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.1.2...v1.1.3) (2026-08-23)

### 🐛 Bug Fixes

* **crimeradar:** also rewrite [@string](https://github.com/string) resource authorities for install conflicts ([5eb11e3](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/5eb11e329f3f01e8afdf79494eb6bde4094a0b80))

## [1.1.2](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.1.1...v1.1.2) (2026-08-23)

### 🐛 Bug Fixes

* **crimeradar:** rewrite all provider authorities including hardcoded SDK ones ([429841d](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/429841de694931fe1e7139c5769d14c6ff3ea417))

## [1.1.1](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.1.0...v1.1.1) (2026-08-23)

### 🐛 Bug Fixes

* **crimeradar:** add v26.34.0 compatibility ([b99abb5](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/b99abb50b4708275b3bc47e3b688084196692bc8))
* **crimeradar:** enable package name patch by default ([f4e7bf5](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/f4e7bf5a1931283510502359d8b855555af04a4f))

## [1.1.0](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/compare/v1.0.0...v1.1.0) (2026-08-23)

### ✨ New Features

* **crimeradar:** add package name patch, remove examples ([fb689c8](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/fb689c8c5b928eee35297b2b6d57235b9e8f98a4))

## 1.0.0 (2026-08-23)

### ✨ New Features

* **crimeradar:** add premium bypass patch ([4110dd3](https://github.com/JacobPlaysGames/CrimeRadar-Morphe-Patches/commit/4110dd3b0e001f51f159fb1d2669520c7a6fdbf8))
