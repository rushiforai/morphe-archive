## [1.2.1](https://github.com/bigyank/morphe-patches-samsung/compare/v1.2.0...v1.2.1) (2026-06-30)

### 🐛 Bug Fixes

* **Samsung Health:** skip empty c6r fingerprint on Health 7.x ([036254a](https://github.com/bigyank/morphe-patches-samsung/commit/036254a6ad640248db59b7e07c038c1e5fb7046a))

## [1.2.0](https://github.com/bigyank/morphe-patches-samsung/compare/v1.1.0...v1.2.0) (2026-06-30)

### ✨ New Features

* add Samsung Health 7.00.0.107 Knox and account patch support ([25aad69](https://github.com/bigyank/morphe-patches-samsung/commit/25aad69406430a8585bdaaa77327366a7f3ed478))

## [1.1.0](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.16...v1.1.0) (2026-06-22)

### ✨ New Features

* stable v1.1.0 Samsung Health patch bundle for Knox 0x1 ([b09fab4](https://github.com/bigyank/morphe-patches-samsung/commit/b09fab484ab00cada5ec1855c58e22ec8838cde7))

## 1.0.0 (2026-06-22)

### 🐛 Bug Fixes

* add BytecodePatchContext to stub helper functions ([b80232f](https://github.com/bigyank/morphe-patches-samsung/commit/b80232fa427a10e784008da91ada90483795eb5b))
* add Morphe 1.3.x compatible PatchListGenerator ([2f03f43](https://github.com/bigyank/morphe-patches-samsung/commit/2f03f43582a8f5a4e6779bc53673870ee9f1ffe7))
* add Samsung Account signature bypass for patched Health login ([d85f461](https://github.com/bigyank/morphe-patches-samsung/commit/d85f461fdd63005ce0cf882e07b98ec484a088e4))
* align Morphe plugin API with 1.3.x for CI build ([0fbc194](https://github.com/bigyank/morphe-patches-samsung/commit/0fbc194c7b600f8cb71f5d0c48abea82c24da2a9))
* avoid sl9 SAK stub that caused startup VerifyError ([d3067ee](https://github.com/bigyank/morphe-patches-samsung/commit/d3067ee30856b5b1e5ca43ff680f8f3aed6eb42e))
* build Mac-style stubs with dexlib2 instruction builders ([75f486e](https://github.com/bigyank/morphe-patches-samsung/commit/75f486e80e1cd4eb64d53feeeff82abdfb3a30ca))
* clear try/catch handlers when stubbing Knox methods ([eea561d](https://github.com/bigyank/morphe-patches-samsung/commit/eea561d780fdbe22a7f5b21175f39528f34d056f))
* compile account patch by storing replacement strings during scan ([84a1cc7](https://github.com/bigyank/morphe-patches-samsung/commit/84a1cc76241c49fe7e377379344e02d45cfaca43))
* compile account provider stubs using reflection like Knox patch ([b2d975c](https://github.com/bigyank/morphe-patches-samsung/commit/b2d975ca14329a6461ce8556213e3f8b8e0f69a8))
* compile Mac-style stubs inside execute context ([17fadfd](https://github.com/bigyank/morphe-patches-samsung/commit/17fadfdf51803c961a1a7798db8297843ecd38d8))
* correct isKnoxAvailableCore access flags for Health 6.32 ([0f52b91](https://github.com/bigyank/morphe-patches-samsung/commit/0f52b91130c70a7afa593bea9a887b1e567e6b05))
* dex-only account bypass with provider stubs to avoid OOM loop ([a804e5c](https://github.com/bigyank/morphe-patches-samsung/commit/a804e5c982de547b4a96c1bbbd1a2f1b980b3bf4))
* downgrade Gradle to 8.14.3 for Morphe plugin compatibility ([4a4b4d6](https://github.com/bigyank/morphe-patches-samsung/commit/4a4b4d667ad30b668a0b46b21ba6c2350a3b802f))
* drop dev backmerge from semantic-release config ([6ad1c29](https://github.com/bigyank/morphe-patches-samsung/commit/6ad1c299daddf8c8f3792e0d13c991772fb00a5f))
* emit patches-list.json in README-compatible format ([5a7aed0](https://github.com/bigyank/morphe-patches-samsung/commit/5a7aed090d8361f7a3cc9288826dc6aaba3ef2df))
* inline register-aware stubs on MutableMethod apply receiver ([6c2af10](https://github.com/bigyank/morphe-patches-samsung/commit/6c2af10f82d53063aa935bdc925a22be56e7bac4))
* iterate mutableClass.methods directly in account bypass patch ([ae60c49](https://github.com/bigyank/morphe-patches-samsung/commit/ae60c497bc7b72bba2bcf8e3bcd85b8abfa893c5))
* keep register-safe stubs inside patch execute context ([ec64289](https://github.com/bigyank/morphe-patches-samsung/commit/ec642895c20c1f3f9459a0f13eb7ec9bdbf509f1))
* make Samsung Account bypass dex-only to prevent Morphe OOM ([a9b64d5](https://github.com/bigyank/morphe-patches-samsung/commit/a9b64d58db48aff83b271c16d0caf1b12dfa7821))
* match macOS apktool stubs to restore account sign-in ([efe5413](https://github.com/bigyank/morphe-patches-samsung/commit/efe541366784b4cca732f2724f097a3279c58c3b))
* replace all Samsung Account package strings in dex like Mac patcher ([4cd36e2](https://github.com/bigyank/morphe-patches-samsung/commit/4cd36e2cbefa800a86bc9f07f5e4cd4f8c3dde4a))
* replace method bodies fully to clear try/catch handlers ([f615f96](https://github.com/bigyank/morphe-patches-samsung/commit/f615f9627e3bb4859b9a172f3b957d8adf93838c))
* resolve Kotlin compile errors for Morphe 1.3.x ([bedd7d1](https://github.com/bigyank/morphe-patches-samsung/commit/bedd7d107bf527bd85dabfc92c10ed108c13dbf2))
* resolve Samsung Account patch compile error in CI ([2b1738f](https://github.com/bigyank/morphe-patches-samsung/commit/2b1738f72cd4ed6d852790f26342bb41d960f873))
* restore inline MutableMethod stubs for Morphe compile ([78a627e](https://github.com/bigyank/morphe-patches-samsung/commit/78a627ed0dce221c36f12a313c5a24092cef3f85))
* restore manifest/res replacement for Samsung Account bypass ([ac9268b](https://github.com/bigyank/morphe-patches-samsung/commit/ac9268bb8c230083808f075047c0de5a41f057bb))
* scan dex read-only before mutating classes for account bypass ([a26e347](https://github.com/bigyank/morphe-patches-samsung/commit/a26e3479734fe6fb8834dcae8c124d41696488c4))
* **shealth:** escape isRooted marker string to fix Kotlin compile ([92feff9](https://github.com/bigyank/morphe-patches-samsung/commit/92feff93fe7de68ac6da6fda60e0c8ef3d88fd18))
* **shealth:** scan dex for OOBE Knox gates instead of obfuscated fingerprints ([6e55fca](https://github.com/bigyank/morphe-patches-samsung/commit/6e55fca553f5a4982adcff3d19a26e647c1fd0c5))
* use BytecodePatchContext extensions for stub helpers ([eadbd24](https://github.com/bigyank/morphe-patches-samsung/commit/eadbd242420a547f076ec6d4dea08038b3432587))
* use Morphe MutableMethod APIs in BytecodeStubUtils ([f9f4358](https://github.com/bigyank/morphe-patches-samsung/commit/f9f43581c73c13c5997250ad69c7dfa95d766aa7))

### ✨ New Features

* add Samsung Health Knox bypass Morphe patches ([68451b5](https://github.com/bigyank/morphe-patches-samsung/commit/68451b55084f9f1d880f8ee95a1e416b51dfaa28))

### 🚀 Updated App Support

* **shealth:** add isRooted dex scan and SamsungAppsPatcher audit docs ([da5d22c](https://github.com/bigyank/morphe-patches-samsung/commit/da5d22c4020f126a9b0106dd62b3a6848441f3e2))
* **shealth:** add OOBE Knox stubs and extra SDK integrity bypasses ([cfd3b98](https://github.com/bigyank/morphe-patches-samsung/commit/cfd3b9859ab67efd3bea54679609bd0e6b05c142))
* **shealth:** add Samsung Health 6.31.3.013 compatibility target ([e98506b](https://github.com/bigyank/morphe-patches-samsung/commit/e98506b746e284ea652f4cc4f04470e3541b4555))

## [1.0.16](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.15...v1.0.16) (2026-06-22)

### 🐛 Bug Fixes

* **shealth:** escape isRooted marker string to fix Kotlin compile ([801dfc6](https://github.com/bigyank/morphe-patches-samsung/commit/801dfc60394e0406bee544800c42550583a26fe9))

### 🚀 Updated App Support

* **shealth:** add isRooted dex scan and SamsungAppsPatcher audit docs ([ef1f4ab](https://github.com/bigyank/morphe-patches-samsung/commit/ef1f4abded486da37829b841b30b87c49c0891fb))

## [1.0.15](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.14...v1.0.15) (2026-06-22)

### 🐛 Bug Fixes

* **shealth:** scan dex for OOBE Knox gates instead of obfuscated fingerprints ([7e0faff](https://github.com/bigyank/morphe-patches-samsung/commit/7e0faff49189d748b9237814566fb062b8f4e3fa))

## [1.0.14](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.13...v1.0.14) (2026-06-22)

### 🚀 Updated App Support

* **shealth:** add OOBE Knox stubs and extra SDK integrity bypasses ([7d03ded](https://github.com/bigyank/morphe-patches-samsung/commit/7d03ded0372037fb859e2d427fbce4d48e6a2a9d))

## [1.0.13](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.12...v1.0.13) (2026-06-22)

### 🚀 Updated App Support

* **shealth:** add Samsung Health 6.31.3.013 compatibility target ([d5fccf6](https://github.com/bigyank/morphe-patches-samsung/commit/d5fccf6e8dccd1cff97e52ebd812496f5493b8db))

## [1.0.12](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.11...v1.0.12) (2026-06-22)

### 🐛 Bug Fixes

* add BytecodePatchContext to stub helper functions ([33ae16d](https://github.com/bigyank/morphe-patches-samsung/commit/33ae16dcccc574b9ac5f033c208b7a8918e59b5e))
* use BytecodePatchContext extensions for stub helpers ([8cea61c](https://github.com/bigyank/morphe-patches-samsung/commit/8cea61c0d78d8b3d50ba91e0287e6d02a36fd3d7))
* use Morphe MutableMethod APIs in BytecodeStubUtils ([3dcf337](https://github.com/bigyank/morphe-patches-samsung/commit/3dcf33731e54e30dd9b2c407a9f38f0c526ed396))

## [1.0.11](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.10...v1.0.11) (2026-06-22)

### 🐛 Bug Fixes

* compile account provider stubs using reflection like Knox patch ([8f6447d](https://github.com/bigyank/morphe-patches-samsung/commit/8f6447d9df4517fe7529fc3d2bbc38f0be4f2993))
* dex-only account bypass with provider stubs to avoid OOM loop ([479c339](https://github.com/bigyank/morphe-patches-samsung/commit/479c339bf4543e9ae9fc39fc3c139e143c7236f5))

## [1.0.10](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.9...v1.0.10) (2026-06-22)

### 🐛 Bug Fixes

* restore manifest/res replacement for Samsung Account bypass ([fefc9e9](https://github.com/bigyank/morphe-patches-samsung/commit/fefc9e9df0e73494ab8a71582c13f9a4defae49f))

## [1.0.9](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.8...v1.0.9) (2026-06-22)

### 🐛 Bug Fixes

* compile account patch by storing replacement strings during scan ([3f4481b](https://github.com/bigyank/morphe-patches-samsung/commit/3f4481bf486c1e630d2c8acfa98fb4e2ccae22d1))
* replace all Samsung Account package strings in dex like Mac patcher ([70c353d](https://github.com/bigyank/morphe-patches-samsung/commit/70c353dd78718226785d902823d38d206e2df5f4))

## [1.0.8](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.7...v1.0.8) (2026-06-22)

### 🐛 Bug Fixes

* scan dex read-only before mutating classes for account bypass ([c1536f8](https://github.com/bigyank/morphe-patches-samsung/commit/c1536f8cefae185ef9628bc7e41012eb77e46807))

## [1.0.7](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.6...v1.0.7) (2026-06-22)

### 🐛 Bug Fixes

* make Samsung Account bypass dex-only to prevent Morphe OOM ([535550f](https://github.com/bigyank/morphe-patches-samsung/commit/535550f01fe06d992d038b8fbf6d8fcf311bf1ec))

## [1.0.6](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.5...v1.0.6) (2026-06-22)

### 🐛 Bug Fixes

* add Samsung Account signature bypass for patched Health login ([4e34bc4](https://github.com/bigyank/morphe-patches-samsung/commit/4e34bc4857c2bffb27b000edc6dbaa87404cd258))
* iterate mutableClass.methods directly in account bypass patch ([03a4b47](https://github.com/bigyank/morphe-patches-samsung/commit/03a4b47e14723c15da4e412d033fa37acebd7d5c))
* resolve Samsung Account patch compile error in CI ([83b19f4](https://github.com/bigyank/morphe-patches-samsung/commit/83b19f44693debd90de113286d345b601a390589))

## [1.0.5](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.4...v1.0.5) (2026-06-22)

### 🐛 Bug Fixes

* build Mac-style stubs with dexlib2 instruction builders ([b044de2](https://github.com/bigyank/morphe-patches-samsung/commit/b044de2922712a0297d4760e15f7ed2afdfbdfa7))
* compile Mac-style stubs inside execute context ([65716f4](https://github.com/bigyank/morphe-patches-samsung/commit/65716f494272a378b48f7db496651152644fa7c3))
* match macOS apktool stubs to restore account sign-in ([4f812a2](https://github.com/bigyank/morphe-patches-samsung/commit/4f812a2c6c7405eb6b40aa96a99db0da24b82068))

## [1.0.4](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.3...v1.0.4) (2026-06-22)

### 🐛 Bug Fixes

* clear try/catch handlers when stubbing Knox methods ([96736a2](https://github.com/bigyank/morphe-patches-samsung/commit/96736a2b6e3322d9d54c72952b75ffc462130d33))
* replace method bodies fully to clear try/catch handlers ([559a2c8](https://github.com/bigyank/morphe-patches-samsung/commit/559a2c89996b1b742be935a6a5b8f2c38a7c4593))

## [1.0.3](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.2...v1.0.3) (2026-06-22)

### 🐛 Bug Fixes

* avoid sl9 SAK stub that caused startup VerifyError ([c8874a8](https://github.com/bigyank/morphe-patches-samsung/commit/c8874a8dcddc7e6ed29f5e90f90a70246e0ab2da))
* inline register-aware stubs on MutableMethod apply receiver ([59fffa5](https://github.com/bigyank/morphe-patches-samsung/commit/59fffa50f6240247159a07e3bf069e14ffac1dab))
* keep register-safe stubs inside patch execute context ([f37f4aa](https://github.com/bigyank/morphe-patches-samsung/commit/f37f4aa295762353f2212934793a8e635726cc6a))

## [1.0.2](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.1...v1.0.2) (2026-06-22)

### 🐛 Bug Fixes

* correct isKnoxAvailableCore access flags for Health 6.32 ([0804fa6](https://github.com/bigyank/morphe-patches-samsung/commit/0804fa65269e37b15261c39697773e51a722f447))
* restore inline MutableMethod stubs for Morphe compile ([9bf0a06](https://github.com/bigyank/morphe-patches-samsung/commit/9bf0a06fa3fc3baf993e2862196f8f7113bbc4f4))

## [1.0.1](https://github.com/bigyank/morphe-patches-samsung/compare/v1.0.0...v1.0.1) (2026-06-22)

### 🐛 Bug Fixes

* drop dev backmerge from semantic-release config ([d900692](https://github.com/bigyank/morphe-patches-samsung/commit/d90069234222e823cd0a35033c951073b73efba5))

## 1.0.0 (2026-06-22)

### 🐛 Bug Fixes

* add Morphe 1.3.x compatible PatchListGenerator ([d3bf0eb](https://github.com/bigyank/morphe-patches-samsung/commit/d3bf0ebd5f24c11d53243e4f590a7b24afa4a1d2))
* align Morphe plugin API with 1.3.x for CI build ([3cd5f2d](https://github.com/bigyank/morphe-patches-samsung/commit/3cd5f2d76d0935acf20b5edb934bcf2e1003f10d))
* downgrade Gradle to 8.14.3 for Morphe plugin compatibility ([80cdeda](https://github.com/bigyank/morphe-patches-samsung/commit/80cdedafb7615d19d590c3437da60b3acb5e0dce))
* emit patches-list.json in README-compatible format ([a5bf4f4](https://github.com/bigyank/morphe-patches-samsung/commit/a5bf4f4aaf49928b8a2776af11c0080757f1cc95))
* resolve Kotlin compile errors for Morphe 1.3.x ([342cd20](https://github.com/bigyank/morphe-patches-samsung/commit/342cd20a18b5fb366ae3f913deda999a97d6dcbb))

### ✨ New Features

* add Samsung Health Knox bypass Morphe patches ([dfff4db](https://github.com/bigyank/morphe-patches-samsung/commit/dfff4db1ece82a0e86d1aad067e6c42e47a264da))
