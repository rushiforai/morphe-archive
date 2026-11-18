## [2.3.0](https://github.com/ineednotitle/Proteus-Patches/compare/v2.2.1...v2.3.0) (2026-11-18)

### 🐛 Bug Fixes

* **brave:** add experimental privacy patches for v2.2.4 ([8b2ac3f](https://github.com/ineednotitle/Proteus-Patches/commit/8b2ac3f3cad226e9a94279c64420a3a4a6bba10c))
* **instagram:** avoid register exhaustion in Change like animation ([5de3b6a](https://github.com/ineednotitle/Proteus-Patches/commit/5de3b6aa74e315222d7c9ba705a45b9920e392b8))
* **instagram:** make like-animation register allocation robust ([240a3ad](https://github.com/ineednotitle/Proteus-Patches/commit/240a3ad51a670b3e173a4123c911a41ec69dfc66))
* **mereframe:** contain the native integrity throw in every bridge wrapper ([788c131](https://github.com/ineednotitle/Proteus-Patches/commit/788c131eb0986fc1bae4075ffb27bc7a3b619079)), closes [#5](https://github.com/ineednotitle/Proteus-Patches/issues/5) [ineednotitle/Proteus-Patches#5](https://github.com/ineednotitle/Proteus-Patches/issues/5)
* **mereframe:** degrade to the sweep when the pinned session wrapper drifts ([2a07249](https://github.com/ineednotitle/Proteus-Patches/commit/2a07249feb2fdad0d3d13e559d994a85b55d827b))
* **mereframe:** make the Stage 2 sweep key natives correctly and guard every wrapper ([4e37212](https://github.com/ineednotitle/Proteus-Patches/commit/4e37212844c928590677bd7460bf61fff95550b7)), closes [arity#returnType](https://github.com/ineednotitle/arity/issues/returnType)
* **mereframe:** match opcode names case-insensitively in the Stage 2 sweep ([2c9495f](https://github.com/ineednotitle/Proteus-Patches/commit/2c9495f9d0d49eead78465c0c1acb64ec20fe575))
* **patches:** update Meesho package, Amazon Business/ads/autoplay/screenshot, and Mereframe native bypass/Pro ([46f7362](https://github.com/ineednotitle/Proteus-Patches/commit/46f73628311383e568cd3974cf94582c720775b6))
* **pinterest:** run URL tests without Android unit-test task ([4c55433](https://github.com/ineednotitle/Proteus-Patches/commit/4c55433c1c635498bbdc910cbaa4b38b865173fc))
* **readme:** render app summaries and add donation buttons [skip ci] ([4320123](https://github.com/ineednotitle/Proteus-Patches/commit/4320123f51dbfe51f53c9632b1d6d4d4086119ec))
* **reddit:** discover comment TreeData by constructor shape ([ac6bcc7](https://github.com/ineednotitle/Proteus-Patches/commit/ac6bcc75e0a046c298903d6b201d796a437d72e5))
* **reddit:** match rotated external-browser helper types [skip ci] ([6c25bc5](https://github.com/ineednotitle/Proteus-Patches/commit/6c25bc510338ef21c0e2f655948cadc2ae8cdba9))
* **reddit:** restore tombstone-rendered deleted comments [skip ci] ([ea4f805](https://github.com/ineednotitle/Proteus-Patches/commit/ea4f8059d9b5e80e118c2d49c40df290998c1c0a))
* retain license texts in Android bundle ([1c3d6fe](https://github.com/ineednotitle/Proteus-Patches/commit/1c3d6fee8b32140dfa4828f00d585aa45fa5b1bd))
* **test:** remove stray token from InstagramPatchTest import ([4a52fa6](https://github.com/ineednotitle/Proteus-Patches/commit/4a52fa62b7f3b34f1c6657eb6ba74cbf589ad6de))
* **universal:** improve permission controls and rebuild 2.2.2 bundle ([7f4d195](https://github.com/ineednotitle/Proteus-Patches/commit/7f4d195d39e33e8b6314e2949f317cc8220db0d8))

### ✨ New Features

* **instagram:** add Instagram 439.0.0.37.89 patch suite and CI verification ([3c7e00f](https://github.com/ineednotitle/Proteus-Patches/commit/3c7e00f0e5ab310d7de6a0f32f068582fd33c207))
* **instagram:** add settings UI, Ghost Mode, Reels controls and tools ([94c01ea](https://github.com/ineednotitle/Proteus-Patches/commit/94c01eadab926cc6a292125cb5edcfe07f8d27c6))
* **pinterest:** add experimental video download ([66bf9fb](https://github.com/ineednotitle/Proteus-Patches/commit/66bf9fbe012e7afa04ac9a4b7c26100006fbbaff))
* Reddit listing filters and Mereframe Pro unlock (v2.2.10) [skip ci] ([30be24e](https://github.com/ineednotitle/Proteus-Patches/commit/30be24e1e51886d05b2d26ac6b609d1fe52eaf8f))
* **reddit:** add comment-tree hooks and support section [skip ci] ([9548465](https://github.com/ineednotitle/Proteus-Patches/commit/9548465511ac184b9e526acf1f77e09729c84242))
* **release:** expand Proton Pass and Gboard patches for v2.2.10 ([2a54826](https://github.com/ineednotitle/Proteus-Patches/commit/2a548265f4a57f3b54f607f7d15e8d6313823229))
* **universal:** optimize all 24 patches and add category-toggled aggressive permission removal (v2.2.2) ([1420f3e](https://github.com/ineednotitle/Proteus-Patches/commit/1420f3ecec508e871f42c161200f32dc11456bd0))

> All releases up to and including v2.3.0 are stable releases.

## [2.3.1](https://github.com/ineednotitle/Proteus-Patches/compare/v2.3.0...v2.3.1) (2026-11-14)

Pre-release re-cut: replaces the earlier v2.3.1 assets.

### ✨ New Features

* **table-notes:** add Table Notes (`vivekagarwal.playwithdb`, 20261111) premium unlock. Forces the five entitlement flags and the tier in `App.<clinit>` so PDF/Word/Excel export, publishing and the paid feature set unlock, and the AdMob banner/interstitial slots are skipped (issue #29).
* **netflix:** add the Netflix (Android TV, `com.netflix.ninja`) patch set — clone, CertCheck, household-prompt suppression, network-fingerprint minimisation and the in-process ad remover, ported from ajstrick81/morphe-androidtv-patches (GPL-3.0). Experimental for 13.2.x.
* **mereframe:** short-circuit the `Ul.X` paywall funnel so Pro features stop falling through to the upsell sheet.

### 🐛 Bug Fixes

* **mereframe:** preserve each guarded wrapper's array-length contract (`p`/`a`/`V`/`m` expect 3 elements, `T` expects 12) and keep the catch handler outside its own try range, so the develop/encode path stops silently producing nothing ("RAW is safe" but it didn't develop) and unrelated throws no longer loop in the handler (issue #34).
* **mereframe:** contain the native integrity throw in every bridge wrapper ([1c63dd1](https://github.com/ineednotitle/Proteus-Patches/commit/1c63dd1a6d8da262d2c56fc27d6af9d6b463650b)), closes [#5](https://github.com/ineednotitle/Proteus-Patches/issues/5)
* **mereframe:** degrade to the sweep when the pinned session wrapper drifts ([4bb14f2](https://github.com/ineednotitle/Proteus-Patches/commit/4bb14f2ea0309710ab2b057cb1307501157cfd24))
* **mereframe:** make the Stage 2 sweep key natives correctly and guard every wrapper ([676ff17](https://github.com/ineednotitle/Proteus-Patches/commit/676ff1763a5c7b1dafb2116ac2032ae666219917))
* **mereframe:** match opcode names case-insensitively in the Stage 2 sweep ([5a986a7](https://github.com/ineednotitle/Proteus-Patches/commit/5a986a72d04514a179b7eece6b1e2a3b0b6a9bf2))
* **reddit:** discover comment TreeData by constructor shape, so "Show deleted posts and comments" applies on every 2026.42.0 build ([4466ba5](https://github.com/ineednotitle/Proteus-Patches/commit/4466ba51611b1a3d44bbaa7561c5e525b7207f7c)), closes [#35](https://github.com/ineednotitle/Proteus-Patches/issues/35)
* **amazon:** Amazon Business compatibility and the screenshot-detection patch (PR [#31](https://github.com/ineednotitle/Proteus-Patches/pull/31)) are part of the bundle.

## [2.3.0](https://github.com/ineednotitle/Proteus-Patches/compare/v2.2.10...v2.3.0) (2026-11-12)

### ✨ New Features

* **release:** expand Proton Pass and Gboard patches for v2.2.10 ([2de3200](https://github.com/ineednotitle/Proteus-Patches/commit/2de3200757447185ba8eaa9dd127d85e4d807b2c))

## [2.2.2](https://github.com/ineednotitle/Proteus-Patches/compare/v2.2.1...v2.2.2) (2026-11-05)

### 🐛 Fixes and usability

* **bundle:** rebuild and verify the Android DEX bundle after generating patch metadata, replacing the withdrawn v2.2.2 release.
* **permissions:** clarify category and legacy-list behavior, validate custom lists, accept short Android permission names, and fix nearby Wi-Fi matching. Added regression tests and a usage guide.

### ✨ Improvements

* **universal:** optimize all 24 universal patches with shared single-pass manifest helpers, tolerant list parsing, consistent logging and guarded best-effort layers
* **universal:** make `Remove dangerous permissions` easy to use with 16 category switches, aggressive defaults, keep/extra lists and a legacy exact-list override

## [2.2.1](https://github.com/ineednotitle/Proteus-Patches/compare/v2.2.0...v2.2.1) (2026-11-05)

### 🐛 Bug Fixes

* **reddit:** replace the content-filter config placeholder via its `const-string` instead of a `<clinit>` fingerprint (D8 folds static String initializers into DEX field values on Patcher 2.2.0 / Reddit 2026.42.0)

## [2.2.0](https://github.com/ineednotitle/Proteus-Patches/compare/v2.1.2...v2.2.0) (2026-11-05)

### ✨ New Features

* **reddit:** add AutoMod comment blocking and content filters patches ([b6146b7](https://github.com/ineednotitle/Proteus-Patches/commit/b6146b7))

## [2.1.2](https://github.com/ineednotitle/Proteus-Patches/compare/v2.1.1...v2.1.2) (2026-11-05)

### 🐛 Bug Fixes

* **universal:** harden all 24 universal patches ([c8cbf3f](https://github.com/ineednotitle/Proteus-Patches/commit/c8cbf3fb4775299d613439469959a8c0428dd635))
* **universal:** resolve vendorGroup scope in GmsCore support ([b58d721](https://github.com/ineednotitle/Proteus-Patches/commit/b58d72196e5eba278052b1c34bc4f112efd23690))

## [2.1.1](https://github.com/ineednotitle/Proteus-Patches/compare/v2.1.0...v2.1.1) (2026-11-04)

### 🐛 Bug Fixes

* **gboard:** patch Agentic Dictation flags in class initializer ([b31572f](https://github.com/ineednotitle/Proteus-Patches/commit/b31572fd93ea711d018bf2342f4b6c7f746371b1))

## [2.1.0](https://github.com/ineednotitle/Proteus-Patches/compare/v2.0.1...v2.1.0) (2026-11-04)

### 🐛 Bug Fixes

* **gboard:** resolve bytecode patch context access ([7f54155](https://github.com/ineednotitle/Proteus-Patches/commit/7f5415577e1765c6780044d515054652c29206ae))

### ✨ New Features

* **gboard:** add offline-only voice typing privacy patch ([e3c0385](https://github.com/ineednotitle/Proteus-Patches/commit/e3c0385ba7ddd71087bc0c4d2e798f526c86eae5))

## [2.0.1](https://github.com/ineednotitle/Proteus-Patches/compare/v2.0.0...v2.0.1) (2026-11-04)

### 🐛 Bug Fixes

* missing extension classes (MUBI/Meesho toolkit, GmsCore, DCIM) + make the bundle discoverable ([#2](https://github.com/ineednotitle/Proteus-Patches/issues/2)) ([88834ec](https://github.com/ineednotitle/Proteus-Patches/commit/88834ecd4414d06f2a2500cee3ccef7db464eb6c))
* **readme:** restore the PATCHES_START marker that broke releases ([#3](https://github.com/ineednotitle/Proteus-Patches/issues/3)) ([e61bb72](https://github.com/ineednotitle/Proteus-Patches/commit/e61bb72cf87d5e21776561858bd1a41ad042bc29))
