## [1.3.0](https://github.com/SatanMerde/D-moniakPatches/compare/v1.2.0...v1.3.0) (2026-09-21)

### ✨ New Features

* **coinsnap:** mark CoinSnap VIP patch as experimental and in development ([1f60895](https://github.com/SatanMerde/D-moniakPatches/commit/1f60895a1eabf961e4552d8ed57c88e57a60a4fe))

## [1.2.0](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.17...v1.2.0) (2026-09-21)

### ✨ New Features

* **coinsnap:** add CoinSnap VIP Pro unlock patch ([0c6c60d](https://github.com/SatanMerde/D-moniakPatches/commit/0c6c60d61d528f04f112c3b16edde8195a7eee1c))

## [1.1.17](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.16...v1.1.17) (2026-09-20)

### 🐛 Bug Fixes

* **hungryshark:** generate dynamic order IDs and fire proper completion callbacks ([cd2f24b](https://github.com/SatanMerde/D-moniakPatches/commit/cd2f24b05cb3d157a971248f8816927b838e5d80))

## [1.1.16](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.15...v1.1.16) (2026-09-20)

### 🐛 Bug Fixes

* **hungryshark:** fire correct completion callback to allow repeated purchases ([8808175](https://github.com/SatanMerde/D-moniakPatches/commit/88081756d6c4a2a12edc4e88e4f06bbc252362bc))

## [1.1.15](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.14...v1.1.15) (2026-09-19)

### 🐛 Bug Fixes

* **hungryshark:** fix inverted branch conditions preventing shop callbacks from firing ([52525be](https://github.com/SatanMerde/D-moniakPatches/commit/52525be0d529ce6c8ea98c9394861d20ce43746b))

## [1.1.14](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.13...v1.1.14) (2026-09-19)

### 🐛 Bug Fixes

* **hungryshark:** clean method replacement for google billing service and preserve houston bytecode ([979538c](https://github.com/SatanMerde/D-moniakPatches/commit/979538cd12eab95c7e012e1bf0adc2887cd06839))

## [1.1.13](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.12...v1.1.13) (2026-09-19)

### 🐛 Bug Fixes

* **hungryshark:** guard onPurchasesUpdated against cold startup queries to fix loading hang ([45250df](https://github.com/SatanMerde/D-moniakPatches/commit/45250df8babba19c18c70af4f890c5fce2b2d887))

## [1.1.12](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.11...v1.1.12) (2026-09-19)

### 🐛 Bug Fixes

* **hungryshark:** resolve loading screen hang by preserving initialise and fix purchase completion ([089831e](https://github.com/SatanMerde/D-moniakPatches/commit/089831e0fa3e9931e801014734ce5b05bee86832))

## [1.1.11](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.10...v1.1.11) (2026-09-19)

### 🐛 Bug Fixes

* **hungryshark:** bypass ubisoft orion and houston validation to resolve shop freeze ([7cac43a](https://github.com/SatanMerde/D-moniakPatches/commit/7cac43ad61ebc8dd49b7276114cc2cae7274d1f0))

## [1.1.10](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.9...v1.1.10) (2026-09-19)

### 🐛 Bug Fixes

* **hungryshark:** make sku extraction null-safe and prevent exceptions in launch billing flow ([af7bbcb](https://github.com/SatanMerde/D-moniakPatches/commit/af7bbcba5a67625411ba0e39e7b51d80c228175e))

## [1.1.9](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.8...v1.1.9) (2026-09-19)

### 🐛 Bug Fixes

* **hungryshark:** resolve shop purchase freeze via real sku extraction and purchases updated broadcast ([e461ece](https://github.com/SatanMerde/D-moniakPatches/commit/e461ecead7615c33b7b4c10463fa08527699996a))

## [1.1.8](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.7...v1.1.8) (2026-09-19)

### 🐛 Bug Fixes

* **hungryshark:** fix constructor reference in billing listener capture ([153dde8](https://github.com/SatanMerde/D-moniakPatches/commit/153dde880e5e6bdb8c7c30bc2d9698d2fedfe8fa))
* **hungryshark:** fix shop purchase freeze by capturing billing listener via system properties and correct list branch logic ([d139504](https://github.com/SatanMerde/D-moniakPatches/commit/d139504cf6cbb04b87599ed13cf7b6fcf239416c))

## [1.1.7](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.6...v1.1.7) (2026-09-19)

### 🐛 Bug Fixes

* **hungryshark:** eliminate loading freeze and enable shop unlock via self-contained pure smali billing bypass ([b045062](https://github.com/SatanMerde/D-moniakPatches/commit/b0450629e9b7ffce35da13b6efb91d8dd7cd8a01))

## [1.1.6](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.5...v1.1.6) (2026-09-18)

### 🐛 Bug Fixes

* **hungryshark:** prevent VerifyError freeze with check-cast and complete billing lifecycle ([f5c6911](https://github.com/SatanMerde/D-moniakPatches/commit/f5c69118777a0f94a0d99c7a78dfda292ad9d235))

## [1.1.5](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.4...v1.1.5) (2026-09-18)

### 🐛 Bug Fixes

* **hungryshark:** use FiveRegisterInstruction/RegisterRangeInstruction interfaces for call site matching ([ed269c2](https://github.com/SatanMerde/D-moniakPatches/commit/ed269c2d0f5adeaff508fff998a4c01237332227))

## [1.1.4](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.3...v1.1.4) (2026-09-18)

### 🐛 Bug Fixes

* **hungryshark:** patch launchBillingFlow call sites in game code instead of BillingClient impl ([c588ead](https://github.com/SatanMerde/D-moniakPatches/commit/c588eade207719fd756f729231eb791b12b07655))

## [1.1.3](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.2...v1.1.3) (2026-09-18)

### 🐛 Bug Fixes

* **hungryshark:** isolate Free Shopping to launchBillingFlow and restrict strictly to billingclient package ([e009d42](https://github.com/SatanMerde/D-moniakPatches/commit/e009d426b5a9fc94058986929552d791efeb3806))

## [1.1.2](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.1...v1.1.2) (2026-09-18)

### 🐛 Bug Fixes

* **hungryshark:** prevent loading freeze by removing intrusive startup lifecycle hooks ([99ddbce](https://github.com/SatanMerde/D-moniakPatches/commit/99ddbce2b71b0b6f3c1708bd52880b15bee7a707))

## [1.1.1](https://github.com/SatanMerde/D-moniakPatches/compare/v1.1.0...v1.1.1) (2026-09-18)

### 🐛 Bug Fixes

* **hungryshark:** fix Free Shopping smali register errors and eliminate Google Play dialog ([02ad80c](https://github.com/SatanMerde/D-moniakPatches/commit/02ad80cf108ebaa5c45fa226ad5064bee72be7d0))

## [1.1.0](https://github.com/SatanMerde/D-moniakPatches/compare/v1.0.9...v1.1.0) (2026-09-18)

### ✨ New Features

* **hungryshark:** add Free Shopping patch for in-app purchases and shop unlocks ([5ae65e7](https://github.com/SatanMerde/D-moniakPatches/commit/5ae65e762d1e7c4114713545b69d8e2ac78fba79))

## [1.0.9](https://github.com/SatanMerde/D-moniakPatches/compare/v1.0.8...v1.0.9) (2026-09-17)

### 🐛 Bug Fixes

* **hungryshark:** intercept Google Unity Mobile Ads RewardedAd to fix video load failure ([8e206f7](https://github.com/SatanMerde/D-moniakPatches/commit/8e206f7545dcb923b80d18249e34b350e42fd12e))

## [1.0.8](https://github.com/SatanMerde/D-moniakPatches/compare/v1.0.7...v1.0.8) (2026-09-17)

### 🐛 Bug Fixes

* **hungryshark:** implement comprehensive multi-SDK ad bypass with register-safe parameter cloning ([0a8037d](https://github.com/SatanMerde/D-moniakPatches/commit/0a8037d752955afdeb0e4ce72f83d6e70d609f1a))

## [1.0.7](https://github.com/SatanMerde/D-moniakPatches/compare/v1.0.6...v1.0.7) (2026-09-17)

### 🐛 Bug Fixes

* **hungryshark:** eliminate JsonUtils dependency, use JSONObject(String) literal for MAX Unity events ([e543479](https://github.com/SatanMerde/D-moniakPatches/commit/e5434796915ad0a31f2312cd55065ab3ace5ce60))

## [1.0.6](https://github.com/SatanMerde/D-moniakPatches/compare/v1.0.5...v1.0.6) (2026-09-17)

### 🐛 Bug Fixes

* **hungryshark:** rewrite patch with direct smali injection (Nai64 approach) to bypass AppLovin MAX Unity rewarded ads ([d1a8ee2](https://github.com/SatanMerde/D-moniakPatches/commit/d1a8ee24dfb2126ef14d765a2272b7ede3d4412d))

## [1.0.5](https://github.com/SatanMerde/D-moniakPatches/compare/v1.0.4...v1.0.5) (2026-09-17)

### 🐛 Bug Fixes

* **hungryshark:** bypass video ad loading failures with universal readiness and synchronous MAX events ([406890a](https://github.com/SatanMerde/D-moniakPatches/commit/406890ae35e7483822721ecffcd3b9aca0d1debd))

## [1.0.4](https://github.com/SatanMerde/D-moniakPatches/compare/v1.0.3...v1.0.4) (2026-09-17)

### 🐛 Bug Fixes

* intercept AppLovin MAX Unity Plugin ad readiness and reward callbacks ([6363f95](https://github.com/SatanMerde/D-moniakPatches/commit/6363f95cae7aaf4547fd046830378b54554635dd))

## [1.0.3](https://github.com/SatanMerde/D-moniakPatches/compare/v1.0.2...v1.0.3) (2026-09-17)

### 🐛 Bug Fixes

* restore billing and fix ad load lifecycle across MAX, Unity Ads and IronSource ([90da006](https://github.com/SatanMerde/D-moniakPatches/commit/90da00642dd7d6ad720a4d981fbe03f78f239a88))

## [1.0.2](https://github.com/SatanMerde/D-moniakPatches/compare/v1.0.1...v1.0.2) (2026-09-17)

### 🐛 Bug Fixes

* bypass AppLovin MAX Unity Plugin ad readiness check and reward callbacks ([edf248c](https://github.com/SatanMerde/D-moniakPatches/commit/edf248cefb065c70c0fb1422a45fbfde2c9eeb2b))

## [1.0.1](https://github.com/SatanMerde/D-moniakPatches/compare/v1.0.0...v1.0.1) (2026-09-17)

### 🐛 Bug Fixes

* prevent NPE on abstract ad methods and add AI disclaimer ([a258362](https://github.com/SatanMerde/D-moniakPatches/commit/a258362b0c6931041957b5ab4d658b49c8ff4351))

## 1.0.0 (2026-09-17)

### 🐛 Bug Fixes

* ensure gradlew and scripts are executable on Linux CI runners ([efd2636](https://github.com/SatanMerde/D-moniakPatches/commit/efd26362f36fef3a4ad0b820fd2e952b95c9c4d3))

### ✨ New Features

* Initial commit with Hungry Shark World rewarded ads bypass patch ([7e400a1](https://github.com/SatanMerde/D-moniakPatches/commit/7e400a1836fc594fd599d7d4be1c2435948178e7))
