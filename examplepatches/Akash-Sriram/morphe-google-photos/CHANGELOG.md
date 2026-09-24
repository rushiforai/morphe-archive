## [1.10.1](https://github.com/Akash-Sriram/morphe-google-photos/compare/v1.10.0...v1.10.1) (2026-09-23)

### 🚀 Updated App Support

* **Google Photos:** promote Google Photos v7.93.0.982110057 to stable target ([01366bc](https://github.com/Akash-Sriram/morphe-google-photos/commit/01366bca5d3e6a3c6eae1c0483ced6e3bb0f21ab))

## [1.10.0](https://github.com/Akash-Sriram/morphe-google-photos/compare/v1.9.0...v1.10.0) (2026-09-23)

### 🐛 Bug Fixes

* **Google Photos:** parallelize model downloads and resolve startup freezes ([99287f6](https://github.com/Akash-Sriram/morphe-google-photos/commit/99287f67ad97a13d4e1b61cf71b3cd65e36e0e50))

### ✨ New Features

* **Google Photos:** add deviceComplianceCheckPatch to suppress Play Protect screen ([5613eae](https://github.com/Akash-Sriram/morphe-google-photos/commit/5613eae789aa0cbc37686817fbfd11ccfe754338)), closes [MorpheApp/morphe-patches#2977](https://github.com/MorpheApp/morphe-patches/issues/2977) [#13](https://github.com/Akash-Sriram/morphe-google-photos/issues/13)

## [1.9.0](https://github.com/Akash-Sriram/morphe-google-photos/compare/v1.8.0...v1.9.0) (2026-09-22)

### ✨ New Features

* **Google Photos - Branding:** add Custom Morphe branding patch and 46 assets ([38f188e](https://github.com/Akash-Sriram/morphe-google-photos/commit/38f188e795db2525aed643eb3df6111d6469091c))

## [1.8.0](https://github.com/Akash-Sriram/morphe-google-photos/compare/v1.7.0...v1.8.0) (2026-09-22)

### 🐛 Bug Fixes

* **Google Photos:** repair map binder resolution, Mapbox camera fly-to, and gate ML model seeder ([1ea95c4](https://github.com/Akash-Sriram/morphe-google-photos/commit/1ea95c4b135e64cf2307043a716124c35f789cb8))

### ✨ New Features

* **Google Photos:** remove in-app update checker from base patches repository ([4e8d94b](https://github.com/Akash-Sriram/morphe-google-photos/commit/4e8d94b69f09072bb4e82ce03af30cacdfecff37))

## [1.7.0](https://github.com/Akash-Sriram/morphe-google-photos/compare/v1.6.2...v1.7.0) (2026-09-21)

### ✨ New Features

* **Google Photos:** add AMOLED dark theme patch (closes [#12](https://github.com/Akash-Sriram/morphe-google-photos/issues/12)) ([e4cbe58](https://github.com/Akash-Sriram/morphe-google-photos/commit/e4cbe58e49fd3b7df95bcb50a728ddfa196d9900))

## [1.6.2](https://github.com/Akash-Sriram/morphe-google-photos/compare/v1.6.1...v1.6.2) (2026-09-21)

### 🐛 Bug Fixes

* **Google Photos - Updater:** add in-app update checker and normalize changelog scopes for Morphe Manager ([64fcd6e](https://github.com/Akash-Sriram/morphe-google-photos/commit/64fcd6eb33902a6144981e1c05b8f11930344b73))
* **Google Photos - Updater:** add REQUEST_INSTALL_PACKAGES permission and handle SecurityException ([05fed19](https://github.com/Akash-Sriram/morphe-google-photos/commit/05fed1972aceb62b57e1cd386894ff5364b2a382))

## [1.6.1](https://github.com/Akash-Sriram/morphe-google-photos/compare/v1.6.0...v1.6.1) (2026-09-21)

### 🐛 Bug Fixes

* **Google Photos:** repair map live location tracking and dynamic Mars provider authority [skip ci] ([4cddf8f](https://github.com/Akash-Sriram/morphe-google-photos/commit/4cddf8fbd4f25fc4811555133f661af23f7f6e8e))

## [1.5.1](https://github.com/Akash-Sriram/morphe-google-photos/compare/v1.5.0...v1.5.1) (2026-09-20)

### 🐛 Bug Fixes

* **Google Photos:** remove hardware and id spoofing to prevent Play Protect certification errors ([1fea300](https://github.com/Akash-Sriram/morphe-google-photos/commit/1fea300a0c3bc46c36d87297432e51949be52850))

## [1.5.0](https://github.com/Akash-Sriram/morphe-google-photos/compare/v1.4.1...v1.5.0) (2026-09-19)

### 🐛 Bug Fixes

* **Google Photos - Flags:** purge obsolete 3024 and legacy memory flags, align 3999 to official dump ([e729331](https://github.com/Akash-Sriram/morphe-google-photos/commit/e72933185457d609d3ca07ab8fba03380db98d26))
* **Google Photos - Flags:** purge truncated 4-digit flags, use verified 8-digit keys, and ensure synchronous persistence ([f6c0d66](https://github.com/Akash-Sriram/morphe-google-photos/commit/f6c0d666be8572a2959ee3dcd1ec7440a93da6c9))
* **Google Photos - Flags:** sync recipe toggle state bidirectionally with Curated Flags and write zero-values on disable ([97b0788](https://github.com/Akash-Sriram/morphe-google-photos/commit/97b0788457f2a97b8aea116e861d90b659d4fbe6))
* **Google Photos:** align story cutouts, system fonts, OneGoogle avatar, and seed data ([4e294c2](https://github.com/Akash-Sriram/morphe-google-photos/commit/4e294c28fc8dd65e8830f60a3ffff1c49d00cf17))
* **Google Photos:** resolve Locked Folder cloud backup on mod package name ([02caf09](https://github.com/Akash-Sriram/morphe-google-photos/commit/02caf093742bc5b273fc0a178163e05139471c6c))
* **Google Photos - Ui:** dynamic flag count in reset menu, now shows correct 29 instead of stale 26 ([0821a8a](https://github.com/Akash-Sriram/morphe-google-photos/commit/0821a8a1bbd32bf982c0186af424f749ed583e9e))

### ✨ New Features

* **Google Photos - Flags:** add 45709528 (Enhanced Pixel Processing) to curated flags, updating total to 25 ([0e6466f](https://github.com/Akash-Sriram/morphe-google-photos/commit/0e6466f32af3e38ca6e8f9d9fa99ae14f6f95fb4))
* **Google Photos - Flags:** add curated flags table and refine patch definitions ([8c0e159](https://github.com/Akash-Sriram/morphe-google-photos/commit/8c0e1599ae8dea90e5c624f2839eabdde83cf72b))

## [1.4.1](https://github.com/Akash-Sriram/De-Vanced/compare/v1.4.0...v1.4.1) (2026-09-18)

### 🐛 Bug Fixes

* **Google Photos - Ci:** prevent gradlew.bat line ending changes from failing backmerge ([3af9529](https://github.com/Akash-Sriram/De-Vanced/commit/3af95291e23708bce7e7153cb9f3384ff10b0aa2))

## [1.4.0](https://github.com/Akash-Sriram/De-Vanced/compare/v1.3.1...v1.4.0) (2026-09-18)

### 🐛 Bug Fixes

* **Google Photos - Ci:** remove duplicate release note generation from semantic-release ([4d6093e](https://github.com/Akash-Sriram/De-Vanced/commit/4d6093eb7ef2cfafca26ce6c63f8dbf4b1f2d7bc))
* **Google Photos:** catch Throwable and skip framework views during avatar reflection ([6aa80b8](https://github.com/Akash-Sriram/De-Vanced/commit/6aa80b8c562d773b4aa46d61dd593e180fe2605b))
* **Google Photos:** restore global background model seeder and clean readiness gates ([336e7f5](https://github.com/Akash-Sriram/De-Vanced/commit/336e7f59875d62a8f423f23fe8ba54c2c65bb6cd))

### ✨ New Features

* **Google Photos:** align with latest patch template and refine photo patches ([8b6468a](https://github.com/Akash-Sriram/De-Vanced/commit/8b6468a1194f19a9dbce20fdd762f3bd4027a68c))

## [1.3.1](https://github.com/Akash-Sriram/De-Vanced/compare/v1.3.0...v1.3.1) (2026-09-16)


### Bug Fixes

* **Google Photos:** bypass GmsCore battery optimization and background check dialogs ([24e3a1e](https://github.com/Akash-Sriram/De-Vanced/commit/24e3a1ebc1def251d36abfa856e23cd1ebbe5c96))

# [1.3.0](https://github.com/Akash-Sriram/De-Vanced/compare/v1.2.3...v1.3.0) (2026-09-15)


### Features

* **Google Photos:** dynamic ML model discovery and download from MDD manifests ([e39c700](https://github.com/Akash-Sriram/De-Vanced/commit/e39c700c7a19173fcf5c2a848afbdd3c8cddc389))

## [1.2.3](https://github.com/Akash-Sriram/De-Vanced/compare/v1.2.2...v1.2.3) (2026-09-13)


### Bug Fixes

* **Google Photos - Google Photos V7.92:** Restore ML Models and Fix Story Crashes ([9fa2350](https://github.com/Akash-Sriram/De-Vanced/commit/9fa23505e4c76790da39d84ae18035dd1d1f168b))
* **Google Photos:** revert crashy dynamic story fingerprinting and separate model readiness gates safely ([e34f695](https://github.com/Akash-Sriram/De-Vanced/commit/e34f695c4200ace18840cdb8a5ea2cba8af48e01))
* **Google Photos:** use dynamic fingerprinting for memory style flags ([62bc026](https://github.com/Akash-Sriram/De-Vanced/commit/62bc026b4cf2320f6a017ec80688a15361e27ece))

## [1.2.2](https://github.com/Akash-Sriram/De-Vanced/compare/v1.2.1...v1.2.2) (2026-09-13)


### Bug Fixes

* **Google Photos:** unconditionally report models as loaded to fix 0MB bug for Moods suite ([c032335](https://github.com/Akash-Sriram/De-Vanced/commit/c0323359bc4aa4ee2f870ca89681c10fe5364dd0))

## [1.2.1](https://github.com/Akash-Sriram/De-Vanced/compare/v1.2.0...v1.2.1) (2026-09-13)


### Bug Fixes

* **Google Photos:** bump REMOTE_MODELS_URL to v1.1-models to support 72 models ([8dfc0c3](https://github.com/Akash-Sriram/De-Vanced/commit/8dfc0c329d8e7949de904c59ae901d27ed752735))
* **Google Photos:** remove leftover Google CDN fallback from seeder ([2022eaf](https://github.com/Akash-Sriram/De-Vanced/commit/2022eaf1c6f062f49b38f4965f272db9359e6e47))

# [1.2.0](https://github.com/Akash-Sriram/De-Vanced/compare/v1.1.0...v1.2.0) (2026-09-13)


### Features

* **Google Photos:** add dynamic auto-fingerprinting and v7.92 support for memory style flags ([8bd398c](https://github.com/Akash-Sriram/De-Vanced/commit/8bd398c50093da46f594f6bd7b8f02a845f93ee4))
* **Google Photos:** expand neural model pack to 72 models with Moods suite ([764ff87](https://github.com/Akash-Sriram/De-Vanced/commit/764ff87a822e1e550cecd4526a52da26c8f99ac1))

# [1.1.0](https://github.com/Akash-Sriram/De-Vanced/compare/v1.0.0...v1.1.0) (2026-09-13)


### Features

* **Google Photos:** port SystemProperties spoofing to cover native C/C++ property reads ([605e4cb](https://github.com/Akash-Sriram/De-Vanced/commit/605e4cb5451379f02370b503df4451dbade37774))

# 1.0.0 (2026-09-12)


### Bug Fixes

* **Google Photos:** avoid forcing Photos frictionless login ([9cb1e11](https://github.com/Akash-Sriram/De-Vanced/commit/9cb1e117551bf759c11163417cef160b3f9bac37))
* **Google Photos:** change googlephotos extension to base shared and remove unused cert pinning patch ([6c93248](https://github.com/Akash-Sriram/De-Vanced/commit/6c93248de1039ede74d92af8d4d18f4ce1b44787))
* **Google Photos - Ci:** restore semantic-release rules so feat, fix, and release commits trigger versions ([3728b97](https://github.com/Akash-Sriram/De-Vanced/commit/3728b978519854968a56847075aa9d58565a85e3))
* **Google Photos - Flags:** prevent auto-reseeding defaults on clear-all and enforce high-contrast dialog buttons ([bbcb716](https://github.com/Akash-Sriram/De-Vanced/commit/bbcb7160ea420512e23ce87b0e5a8d6f6d23dcc2)), closes [hi#contrast](https://github.com/hi/issues/contrast)
* **Google Photos:** google photos patch logic ([58f8bc8](https://github.com/Akash-Sriram/De-Vanced/commit/58f8bc80dfd601cfe5a5dfee81e64d78bab0f496))
* **Google Photos:** enable complete Maps SDK multi-DEX routing and MicroG-RE VTM support ([c6ce1b5](https://github.com/Akash-Sriram/De-Vanced/commit/c6ce1b5b1ec6a8aae48a914617fbd2f901165e03))
* **Google Photos:** fix Map Explore current location FAB and persistent location puck ([50386ec](https://github.com/Akash-Sriram/De-Vanced/commit/50386ecc07672f1ca1eebed30855b81642748955))
* **Google Photos:** isolate Phenotype from GmsCore wipe and fix HomeActivity startup lifecycle hook ([26c03a9](https://github.com/Akash-Sriram/De-Vanced/commit/26c03a94c243504330c01d3ce22f52d95de82b6a))
* **Google Photos:** make legacy check optional to prevent matching errors ([ffcf044](https://github.com/Akash-Sriram/De-Vanced/commit/ffcf0447961f9f4c0e214ec0c9ded7e7e775a4e6))
* **Google Photos:** prevent NullPointerException in BackupNotificationManager during local media sync scheduling ([7b481ae](https://github.com/Akash-Sriram/De-Vanced/commit/7b481ae5e61e2310c8f7813036bfda8f8194b4cc))
* **Google Photos:** resolve classcast exception in smali string injection ([669f375](https://github.com/Akash-Sriram/De-Vanced/commit/669f37545acc687eb00d0fc2fe7d2fe749c34a7d))
* **Google Photos:** resolve DCIM backup control patch compatibility issues ([8096849](https://github.com/Akash-Sriram/De-Vanced/commit/8096849b16c29fd04600fe1e830aeea5d09cad1f))
* **Google Photos:** resolve HomeActivity onCreate fingerprint and remove redundant constructor hooks ([bbf7a21](https://github.com/Akash-Sriram/De-Vanced/commit/bbf7a21bba34453ca9e6fe9d06f1f304078c7af3))
* **Google Photos:** silence avatar fetch error toasts and avoid redundant build-number update dialogs ([63aa7b4](https://github.com/Akash-Sriram/De-Vanced/commit/63aa7b4e5d6002d9780ef374e45ea562b92a879e))
* **Google Photos:** use single userinfo.profile scope and support direct avatar fallback from accountManager ([a3bfb5a](https://github.com/Akash-Sriram/De-Vanced/commit/a3bfb5a746decfbe019c7968c56e509d01e5ed81))
* **Google Photos:** inline changePackageNamePatch as private implementation to hide it ([0976e55](https://github.com/Akash-Sriram/De-Vanced/commit/0976e55733cf04a58ee1c4fc3270b7e3d7affbe5))
* **Google Photos:** make Google Photos spoof build patch self-contained ([7b431dd](https://github.com/Akash-Sriram/De-Vanced/commit/7b431dd5a707231b5289db60a6fdee5d24b27832))
* **Google Photos:** make gradlew executable ([3be2ec5](https://github.com/Akash-Sriram/De-Vanced/commit/3be2ec51fff5990c174c166e7a02625971832063))
* **Google Photos - Phenotype:** use theme-independent button backgrounds and high contrast text for Samsung OneUI & AOSP ([2c9e9fe](https://github.com/Akash-Sriram/De-Vanced/commit/2c9e9fe6d04860f652b48c5a4f597d5b4f34010b))
* **Google Photos:** fix editor launch by reverting unnecessary package name string rewrites and finalize phenotype UI defaults ([c29f936](https://github.com/Akash-Sriram/De-Vanced/commit/c29f9369760aad5b8f52ba030b328f7a114ac554))
* **Google Photos:** handle signed-out state and support avatar in account switcher list ([f7c82ee](https://github.com/Akash-Sriram/De-Vanced/commit/f7c82ee420526db3c10a721fcac6f3c915e00ecc))
* **Google Photos:** remove duplicate Morphe Photos compatibility target ([7099408](https://github.com/Akash-Sriram/De-Vanced/commit/70994082e501851e7a362dfefc644b8a1d593a6d))
* **Google Photos:** render avatar in clean circle with anti-aliased border ring ([5411a4e](https://github.com/Akash-Sriram/De-Vanced/commit/5411a4eac78e9e4a22757ff34ecf114e5be464d0))
* **Google Photos:** resolve avatar loading with openid scope and dynamic view binding ([18315d8](https://github.com/Akash-Sriram/De-Vanced/commit/18315d89db51ded1a255395963de50695db53958))
* **Google Photos:** support onboarding bottom sheet account avatar and multi-depth row binding ([6f8cdaa](https://github.com/Akash-Sriram/De-Vanced/commit/6f8cdaa12bf9c02470e64e5ccadbc74d40e3d782))
* **Google Photos:** release 1.0.1 ([b68b315](https://github.com/Akash-Sriram/De-Vanced/commit/b68b31503e57a9253237a3bf2be8bacfd23f7c86))
* **Google Photos:** release 1.0.1 ([26175cf](https://github.com/Akash-Sriram/De-Vanced/commit/26175cf2910917be08734a741087018e127a1648))
* **Google Photos:** release v1.0.3 with Google Recorder fix ([c03c701](https://github.com/Akash-Sriram/De-Vanced/commit/c03c701a6ba658afb4f4f2093faca9e6bc91e49c))
* **Google Photos:** release v1.0.4 (Photos account persistence + TikTok defaults) ([b04a57e](https://github.com/Akash-Sriram/De-Vanced/commit/b04a57e97d82d8e236e0979ff1069c540380f353))
* **Google Photos:** restore GmsCoreSupportPatch to shared extension module ([ec9ce23](https://github.com/Akash-Sriram/De-Vanced/commit/ec9ce239f2159c5f6219b48a1431663f5a1005de))
* **Google Photos:** stabilize Google Photos GmsCore support ([b3ef0b6](https://github.com/Akash-Sriram/De-Vanced/commit/b3ef0b672fd411d468fc80ca827056266352ba14))


### Features

* **Google Photos - Flags:** set exact default UI preset flags and fix photo editor launch ([235b894](https://github.com/Akash-Sriram/De-Vanced/commit/235b8941bc4f38d14e3a5e75d2a3ec15d6368e8c))
* **Google Photos:** add PhenotypeFlagManager with Import/Export, clean top toolbar and decouple update checker ([171b43e](https://github.com/Akash-Sriram/De-Vanced/commit/171b43eb31fe56153dcebd82dd4065112d3ff328))
* **Google Photos:** add standalone Account avatar patch and decouple GmsCore support ([1008618](https://github.com/Akash-Sriram/De-Vanced/commit/1008618e4ea510c779573ab1914eb36851f2f0b0))
* **Google Photos:** bundle verified floating pill Phenotype XML and hook Application early seeding ([ad3efba](https://github.com/Akash-Sriram/De-Vanced/commit/ad3efbaf4bc2b162295090d9041e8ae67dc733c5))
* **Google Photos:** stabilize non-root support with 2021 feature flags, avatar bridge & media fixes ([507c805](https://github.com/Akash-Sriram/De-Vanced/commit/507c805de8078257006dc2a167e688a8188fa8ab))
* **Google Photos:** add background streaming downloader for non-root model provisioning ([f265b26](https://github.com/Akash-Sriram/De-Vanced/commit/f265b2631a32740a9e3ebb91716ddb4968978850))
* **Google Photos:** add Google Photos avatar bridge and Play Services signature bypass ([#114](https://github.com/Akash-Sriram/De-Vanced/issues/114)) ([9e29ee7](https://github.com/Akash-Sriram/De-Vanced/commit/9e29ee7beaeeb43576a047568debcd44a7b7cad3))
* **Google Photos:** add PhotosModelSeeder for persistent ML model and MDD rehydration ([712ffee](https://github.com/Akash-Sriram/De-Vanced/commit/712ffee068bb4065cbbf6207af2190db8e8bca78))
* **Google Photos:** bundle full 223KB official phenotype flags for modern floating pill navigation ([6977531](https://github.com/Akash-Sriram/De-Vanced/commit/6977531df9f843e7a7867bb2f9cee02c285a2287))
* **Google Photos:** bundle official phenotype flags and auto-seed in-memory on first launch ([d3d112b](https://github.com/Akash-Sriram/De-Vanced/commit/d3d112be46b40daf78b647a0bf01ebddab7e90aa))
* **Google Photos:** embed clean official phenotype flags with dynamic account sync and early application hook ([cb6c752](https://github.com/Akash-Sriram/De-Vanced/commit/cb6c7520e770148b26b5a80634bd991d3c44e8a2))
* **Google Photos:** enable all Google Photos patches by default and prune obsolete legacy patches ([e6f9655](https://github.com/Akash-Sriram/De-Vanced/commit/e6f965520fa9fa0f1984ffe5d2789bb72fc4119b))
* **Google Photos:** enable all PIXEL_PRELOAD and PIXEL_EXPERIENCE features ([d2ecdf4](https://github.com/Akash-Sriram/De-Vanced/commit/d2ecdf41a7eaa015881022b1a17506ac8e4be55b))
* **Google Photos:** enable modern Pixel experience features across multi-DEX for redesigned Collections UI ([ad26f7e](https://github.com/Akash-Sriram/De-Vanced/commit/ad26f7eac45e52dab53c4949d76d7955f2d30617))
* **Google Photos:** hard-bake memory style flags and local font fallback for scrapbook cutouts ([5f72625](https://github.com/Akash-Sriram/De-Vanced/commit/5f7262588e0b0f5c9af06136df9f31c29f80c335))
* **Google Photos:** limit default spoof features to Pixel 2016 and add model readiness gates ([d5de929](https://github.com/Akash-Sriram/De-Vanced/commit/d5de929597c681a8d04f24c4e9dadb0ab1eaf084))
* **Google Photos:** pre-fetch avatars on launch and bind account row avatars dynamically ([c921078](https://github.com/Akash-Sriram/De-Vanced/commit/c9210781302fa96c4a3205173d47698c83f26652))
* **Google Photos:** redesign phenotype flag manager with M3 floating modal, live GMS Flags API sync, and unified dialogs ([1b38d88](https://github.com/Akash-Sriram/De-Vanced/commit/1b38d88d78fd417ebb3579fb10c63d84638cf84d))
* **Google Photos:** sync official phenotype flags and optimize flag manager UI ([5cf6026](https://github.com/Akash-Sriram/De-Vanced/commit/5cf60269162a95f8a76a39d42168ec6d274623de))
* **Google Photos:** relax FrictionlessEligibilityFingerprint to support Google Photos 7.87.0+ ([3eef011](https://github.com/Akash-Sriram/De-Vanced/commit/3eef011b82ddaadb745f972ae2e1f4ea2be00b16))
* **Google Photos:** release v1.1.0 ([901b2ec](https://github.com/Akash-Sriram/De-Vanced/commit/901b2ec28fb8e5863d2085d471f0cf529de08422))

# [1.0.0](https://github.com/Akash-Sriram/De-Vanced/releases/tag/v1.0.0) (2026-09-13)

Welcome to the inaugural standalone release of **De-Vanced (Morphe Patches)**! This release consolidates months of advanced research and engineering into a unified, out-of-the-box experience for Google Photos on both rooted and non-rooted devices (including Samsung Galaxy S24, Pixel, OnePlus, Xiaomi, and more).

---

### ✨ Core Highlights & Features

#### 🧠 Neural Model Auto-Seeder & Background Streaming (`PhotosModelSeeder`)
- **Seamless Non-Root Delivery**: Automatically provisions all official TensorFlow Lite ML models required for Google Photos AI editing tools.
- **Moods & Creative Lab Expansion**: Bundled complete 20-asset neural suite (Vision Transformer ToneFix model `vit_tonefix_v2.tflite`, 10 3D LUT profiles, 5 film textures, and 2 light leak overlays) bringing the total bundle to 72 verified models (~336.8 MB) with automated MDD group registration.
- **In-App Background Downloader**: On fresh installs (such as on Samsung Galaxy S24), streams and unzips the verified model pack directly from GitHub Releases CDN with zero user intervention.
- **Clear-Data Immunity**: Simultaneously caches all models and MDD manifests into persistent external storage (`/storage/emulated/0/Android/media/app.morphe.android.apps.photos/`), ensuring models instantly rehydrate after "Clear Data" without needing network access.
- **Model Readiness Smali Gates**: Hard-baked bytecode overrides for `Lanqb`, `Lanrk`, `Laspz`, and `Larea` to report Magic Eraser, Portrait Segmenter, and Sky replacement models as loaded and ready.

#### ☁️ Unlimited Original Quality Backup (Pixel 2016 Spoof)
- **Permanent Unmetered Cloud Storage**: Default feature spoofing set to original Google Pixel (`NEXUS_PRELOAD`) for unlimited photo and video backups at full original quality.
- **Tensor TPU Crash Prevention**: Selectively avoids newer Pixel 8/9 spoof flags (`PIXEL_2023_MIDYEAR_PRELOAD`) that trigger missing `.darwinn` Tensor NPU hardware traps on Qualcomm Snapdragon and Samsung Exynos chipsets.

#### 🎛️ Complete Official Phenotype Flags Engine (2,492 Flags)
- **Zero-Config Feature Parity**: Embeds the full set of 2,492 production phenotype flags (`PhenotypeSeedData.java`), automatically seeded into SharedPreferences on first boot.
- **In-App Phenotype Flag Manager**: Access and customize experimental Google Photos flags directly from the app toolbar with built-in search, toggle overrides, and JSON import/export.
- **Dynamic Google Account Synchronization**: Automatically links the active Google account token across multi-account environments to preserve individual settings.

#### 👤 Dynamic Google Account Avatar Bridge
- **Native Account Switcher Support**: Fetches and renders user Google profile avatars dynamically in circular anti-aliased views across top app bars and account switcher sheets without requiring Google Play Services signature spoofing.

#### 🎨 Scrapbook Memories & Local Font Provider Bypass
- **Offline Font Resolution**: Hard-bakes a local font provider bypass (`BakeMemoryStyleFlagsPatch.kt`) pointing to system `/system/fonts/` (Roboto, Noto Serif), eliminating corrupted cutout text or crashes caused by missing GMS font certificates.
- **Memory Styles**: Fully unlocks modern scrapbooking styles, animated collage templates, and memory music playback.

---

### 📦 Compatibility
- **Target Application**: Google Photos (`com.google.android.apps.photos` / `app.morphe.android.apps.photos`)
- **Supported Versions**: `7.0.0` - `7.92.0+`
- **Supported Android Versions**: Android 8.0 (API 26) through Android 15 (API 35)
- **Supported Architectures**: `arm64-v8a`, `armeabi-v7a`