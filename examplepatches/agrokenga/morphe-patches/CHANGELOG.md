## [1.1.0-dev.7](https://github.com/[secure]/morphe-patches/compare/v1.1.0-dev.6...v1.1.0-dev.7) (2026-11-03)

### 🐛 Bug Fixes

* **iap:** relax ELF header parsing in full bypass patch ([c8e8f1a](https://github.com/[secure]/morphe-patches/commit/c8e8f1a1e0723bea675549d48acb97114a8d1e5e))

## [1.1.0-dev.6](https://github.com/[secure]/morphe-patches/compare/v1.1.0-dev.5...v1.1.0-dev.6) (2026-11-03)

### ✨ New Features

* add IAP full bypass, game log overlay, and commerce docs ([4cb7b34](https://github.com/[secure]/morphe-patches/commit/4cb7b349574f86d938d2d3bd2f716d6e94e40f32))

## [1.1.0-dev.5](https://github.com/[secure]/morphe-patches/compare/v1.1.0-dev.4...v1.1.0-dev.5) (2026-11-03)

### 🐛 Bug Fixes

* **iap:** bypass Play Store UI by patching PurchaseBundle InitiatePurchase call ([9c334f4](https://github.com/[secure]/morphe-patches/commit/9c334f42483d59472d26631a0751be46c26f5b52))

## [1.1.0-dev.4](https://github.com/[secure]/morphe-patches/compare/v1.1.0-dev.3...v1.1.0-dev.4) (2026-11-03)

### 🐛 Bug Fixes

* **iap:** patch correct method PlayFabApiCall.Execute instead of ExecuteAsync ([3d2cd25](https://github.com/[secure]/morphe-patches/commit/3d2cd25afcd8f92843752cc91ff2280309bdb78e))

## [1.1.0-dev.3](https://github.com/[secure]/morphe-patches/compare/v1.1.0-dev.2...v1.1.0-dev.3) (2026-11-03)

### ✨ New Features

* **iap:** add IAP Free patch to bypass PlayFab server for store purchases ([e79dbd2](https://github.com/[secure]/morphe-patches/commit/e79dbd2f42511596bb101b8022ce5520b6adc852))

## [1.1.0-dev.2](https://github.com/[secure]/morphe-patches/compare/v1.1.0-dev.1...v1.1.0-dev.2) (2026-11-03)

### ✨ New Features

* **patches:** add native visual feedback overlay ([0ddb676](https://github.com/[secure]/morphe-patches/commit/0ddb676398fe00af905cc7f130722626dc3b040a))

## [1.1.0-dev.1](https://github.com/[secure]/morphe-patches/compare/v1.0.1-dev.1...v1.1.0-dev.1) (2026-11-02)

### ✨ New Features

* **patches:** add native demo and cheats screen unlock ([26582a1](https://github.com/[secure]/morphe-patches/commit/26582a1baae3d5ffba7096ce353a3e019da75ca3))

## [1.0.1-dev.1](https://github.com/[secure]/morphe-patches/compare/v1.0.0...v1.0.1-dev.1) (2026-11-02)

### 🐛 Bug Fixes

* **iap:** parse ELF32 segment flags correctly ([d39d9aa](https://github.com/[secure]/morphe-patches/commit/d39d9aae13cfbaef43102cc9cb90e27ea0d6fe8e))

## 1.0.0 (2026-11-02)

### ✨ New Features

* **iap:** add native libil2cpp probe patch ([9f746fa](https://github.com/[secure]/morphe-patches/commit/9f746fad61a5bf56b6240026bd6584b17c0dc665))
* **iap:** add PlayFab IAP bypass patch with dynamic fulfillment mocking ([de8ee6a](https://github.com/[secure]/morphe-patches/commit/de8ee6ac874e826983c7fef1c2b5500764ea5ed4))
* **iap:** add PlayFab IAP bypass patch with mock fulfillment ([c2477bd](https://github.com/[secure]/morphe-patches/commit/c2477bd34c3dc198e5cdef83fb3f9c0d95cfe224))

### 🐛 Bug Fixes

* changed a few configuration files ([4b59ad6](https://github.com/[secure]/morphe-patches/commit/4b59ad68cfc5be2b738755d3889ba768b4e65595))
* **ci:** authenticate GitHub Packages and gate releases on build ([7b052f0](https://github.com/[secure]/morphe-patches/commit/7b052f0077bc08569e17899709fc12f48a7b4824))
* **ci:** avoid empty Semaphore condition literals ([0b7cbff](https://github.com/[secure]/morphe-patches/commit/0b7cbff67f32d95f4214b75ca10b4c95db87cbbb))
* **ci:** correct Semaphore condition quoting ([92f604d](https://github.com/[secure]/morphe-patches/commit/92f604d8887caaf0316958b7b84e98ae4e71173a))
* **ci:** install Android SDK before Gradle builds ([c55e88a](https://github.com/[secure]/morphe-patches/commit/c55e88afe66b899f4e08f61e4d46b53880f66876))
* **tooling:** harden patch metadata generation ([dd23dab](https://github.com/[secure]/morphe-patches/commit/dd23dabb4fb499c5cb859f72c6287bb516c067c6))
