## [1.9.0](https://github.com/benzophury/oraimo-health-morphe-patches/compare/v1.8.0...v1.9.0) (2026-09-01)

### 🐛 Bug Fixes

* **manifest:** remove AirGapManifestPatch to prevent SecurityException crashes ([e1d104a](https://github.com/benzophury/oraimo-health-morphe-patches/commit/e1d104ab957289b2df459aac2e1d07ba8dc76587))

## [1.8.0](https://github.com/benzophury/oraimo-health-morphe-patches/compare/v1.7.0...v1.8.0) (2026-08-31)

### 🐛 Bug Fixes

* **ci:** add CI markers to README for automated Morphe release generation ([67439af](https://github.com/benzophury/oraimo-health-morphe-patches/commit/67439afb1bc2d2be8c58df9595ec456616efce2e))

### ✨ New Features

* **core:** introduce modular v2.3 patches with DNS hardcoding, offline network mode, and layout pruning ([5473a7c](https://github.com/benzophury/oraimo-health-morphe-patches/commit/5473a7c3668d355885b3a5e2b314315455ad8159))
* **debloat:** add manifest debloat patch to prune telemetry services and cloud activities ([87628fb](https://github.com/benzophury/oraimo-health-morphe-patches/commit/87628fb73a93b540e1ebc66626687c64151b57a6))

## [1.7.0](https://github.com/benzophury/oraimo-health-morphe-patches/compare/v1.6.0...v1.7.0) (2026-08-31)

### 🐛 Bug Fixes

* **ble:** enforce 32-character MD5 user ID token for MoYoung CRPBle SDK handshake ([9486d31](https://github.com/benzophury/oraimo-health-morphe-patches/commit/9486d311878e292e930fcca99c369f995b9a171b))

## [1.6.0](https://github.com/benzophury/oraimo-health-morphe-patches/compare/v1.5.0...v1.6.0) (2026-08-31)

### 🐛 Bug Fixes

* **ble:** populate DeviceCache.saveUserId for Bluetooth authentication handshake ([685cafb](https://github.com/benzophury/oraimo-health-morphe-patches/commit/685cafb640ab25fbb552269c21bad003c61a440a))

## [1.5.0](https://github.com/benzophury/oraimo-health-morphe-patches/compare/v1.4.0...v1.5.0) (2026-08-31)

### ✨ New Features

* **core:** consolidate into 1 single unified Pure Device Mode patch ([ecbefa6](https://github.com/benzophury/oraimo-health-morphe-patches/commit/ecbefa6630bab71cace846ee9fa4a7071d860e1e))

## [1.4.0](https://github.com/benzophury/oraimo-health-morphe-patches/compare/v1.3.0...v1.4.0) (2026-08-31)

### 🐛 Bug Fixes

* **offline:** correct DataUploadService.enqueueWork fingerprints and stubs ([ad9186e](https://github.com/benzophury/oraimo-health-morphe-patches/commit/ad9186e3d383de76d2b0f3b3c61e821cf6c09c6d))

## [1.3.0](https://github.com/benzophury/oraimo-health-morphe-patches/compare/v1.2.1...v1.3.0) (2026-08-31)

### ✨ New Features

* **core:** stabilize default patch group and configure minor releases ([78218aa](https://github.com/benzophury/oraimo-health-morphe-patches/commit/78218aacf336cfca8d6ef20b0c71abe2f0578183))
* **ui:** consolidate core stability and offline hooks into unified Pure Device Mode patch ([2bf74c6](https://github.com/benzophury/oraimo-health-morphe-patches/commit/2bf74c61e054633bd17cb7ca10e9187f38771f8e))

## [1.2.1](https://github.com/benzophury/oraimo-health-morphe-patches/compare/v1.2.0...v1.2.1) (2026-08-31)

### 🐛 Bug Fixes

* **launch:** correct onGetLaunchAd parameter type to RecommendEntity ([280f9d4](https://github.com/benzophury/oraimo-health-morphe-patches/commit/280f9d4e0f94d86a63c0e75553e345a5d9ca3e04))

## [1.2.0](https://github.com/benzophury/oraimo-health-morphe-patches/compare/v1.1.1...v1.2.0) (2026-08-31)

### 🐛 Bug Fixes

* **ci:** add PATCHES_START/PATCHES_END markers to README for generate_patches_readme.py ([f5df5c8](https://github.com/benzophury/oraimo-health-morphe-patches/commit/f5df5c860f0bf57f9acb4f7372e29e1bb343f763))
* **ci:** correct README marker from [EXPANDED] to EXPANDED to match generate_patches_readme.py regex ([9638dcd](https://github.com/benzophury/oraimo-health-morphe-patches/commit/9638dcdc5ea042e83996092862a6899b42f41fb3))
* **manifest:** use document() API instead of xmlEditor for RemoveInternetPermissionPatch ([19310e0](https://github.com/benzophury/oraimo-health-morphe-patches/commit/19310e066c27e71b6c44e19f1e3c3dd16191745f))
* **test:** add kotlin-test dependency so PatchIntegrityTest compiles ([681cbbf](https://github.com/benzophury/oraimo-health-morphe-patches/commit/681cbbf915ee3ac47bcfd04fa147f33dec7f189b))

### ✨ New Features

* **patches:** decompose into granular single-responsibility offline patches ([af81d36](https://github.com/benzophury/oraimo-health-morphe-patches/commit/af81d3644209338b4455819784c49526c65bac9c))
* **ui:** add Pure Device Mode and granular navigation tab patches ([5bf2ff8](https://github.com/benzophury/oraimo-health-morphe-patches/commit/5bf2ff873b32a2511848df9300323d6efac9ae04))
* **ui:** merge Pure Device Mode into main ([ea76223](https://github.com/benzophury/oraimo-health-morphe-patches/commit/ea762234e2a6d001113912953102992ed8883eee))

## [1.1.1](https://github.com/benzophury/oraimo-health-morphe-patches/compare/v1.1.0...v1.1.1) (2026-08-29)

### 🐛 Bug Fixes

* **ci:** remove dev backmerge plugin from semantic release ([e5614d7](https://github.com/benzophury/oraimo-health-morphe-patches/commit/e5614d7dbb30d209f38b9fb7a9d755eab9a29c7f))

## [1.1.0](https://github.com/benzophury/oraimo-health-morphe-patches/compare/v1.0.0...v1.1.0) (2026-08-29)

### 🐛 Bug Fixes

* **offline:** IsLogin returns true & initialise DB in guest mode ([780b6d1](https://github.com/benzophury/oraimo-health-morphe-patches/commit/780b6d14ab648c22792eb846b0d3911fe0e51905))

### ✨ New Features

* keep NeutralizeCloudUploadPatch unchanged ([fa74cdd](https://github.com/benzophury/oraimo-health-morphe-patches/commit/fa74cddd44d6f03c1ff140fd489767ce228dbe66))

## 1.0.0 (2026-08-29)

### ✨ New Features

* initial offline and privacy patches for Oraimo Health ([2e64bd3](https://github.com/benzophury/oraimo-health-morphe-patches/commit/2e64bd3d75261c2a07ee01c0e7a7e61b562229dc))
