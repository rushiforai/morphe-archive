## [1.1.1](https://github.com/eweddwg/belkart-pay-patches/compare/v1.1.0...v1.1.1) (2026-09-23)

### 🐛 Исправления

* **Белкарт Pay:** exact mapping for Belkart 00.01.10 internal card repo ([8f5602e](https://github.com/eweddwg/belkart-pay-patches/commit/8f5602ef5f75984115e228ffbc6772f3ab810220))
* **Белкарт Pay:** fix Compatibility imports and targets list type ([9fb013f](https://github.com/eweddwg/belkart-pay-patches/commit/9fb013fba14affad3398e329d0e2d588f523221f))
* **Белкарт Pay:** read card directly via SQLiteDatabase from app databases dir ([e0b4a6a](https://github.com/eweddwg/belkart-pay-patches/commit/e0b4a6aaa1c6e62396e525410100432754d9d52c))
* **Белкарт Pay:** trigger release build with speed up workflow ([8613eb6](https://github.com/eweddwg/belkart-pay-patches/commit/8613eb691bda7a5173d7b07d31a3201b52bf6ada))

## [1.1.0](https://github.com/eweddwg/belkart-pay-patches/compare/v1.0.0...v1.1.0) (2026-09-23)

### ✨ Новое

* Update release.yml ([29abfe9](https://github.com/eweddwg/belkart-pay-patches/commit/29abfe9d15ab75ab169ddfb4cf23b55540bd0794))

## 1.0.0 (2026-09-23)

### 🐛 Исправления

* correct build script comment ([02e4991](https://github.com/eweddwg/belkart-pay-patches/commit/02e499189571bc16dcf064f745e04912ddc525c3))
* describe real Wallet payment flow ([d68e00a](https://github.com/eweddwg/belkart-pay-patches/commit/d68e00ae19460877ac261939c9d4414af0652d76))
* enable NFC on every app open instead of once per process ([d5917fa](https://github.com/eweddwg/belkart-pay-patches/commit/d5917fa4809ad8d44599fd8d1c747df43f97d3c5))
* hook NFC enable from Application onCreate ([e16292f](https://github.com/eweddwg/belkart-pay-patches/commit/e16292f456328603a0d08e2e29d84bc6fb20970d))
* improve Android wallet payment compatibility ([390ccb6](https://github.com/eweddwg/belkart-pay-patches/commit/390ccb65f7048593dbfa5c305e5fb3cc29d1341f))
* keep resource API inside patch execution ([7cb2fbe](https://github.com/eweddwg/belkart-pay-patches/commit/7cb2fbeacfa2a3bcba76f01ba7b2b3afad7363ba))
* make Wallet quick launch reliably open payment screen ([6d5e2cb](https://github.com/eweddwg/belkart-pay-patches/commit/6d5e2cbe9df7c4f58f0f75600b761a3337ddd8e2))
* match host apdu resource correctly ([9cb299f](https://github.com/eweddwg/belkart-pay-patches/commit/9cb299faeede980483de163eaf55cfd2f1f32263))
* resolve application context inside NFC hook ([74e1651](https://github.com/eweddwg/belkart-pay-patches/commit/74e165148d774682f73cf1de2eb6edf7550e15a6))
* Restore generatePatchesList task and ship Russian descriptions ([1cc7383](https://github.com/eweddwg/belkart-pay-patches/commit/1cc73832bf9ef50ae8db818a949d5f745273e83b))
* Use hardware bitmap for wallet card so lock screen shortcut can be added ([49b3df2](https://github.com/eweddwg/belkart-pay-patches/commit/49b3df2b5e0471bae25400c686f82513c5a8a1f9))
* use range invoke for wallet activity hook ([60a2d17](https://github.com/eweddwg/belkart-pay-patches/commit/60a2d17bcb12870cb2714b71b6eabf5ca93c29b8))
* **Белкарт Pay:** declare supported app version 00.01.10 ([3bd5ecb](https://github.com/eweddwg/belkart-pay-patches/commit/3bd5ecb1db05d379d8f55d3be6cf83b604516f81))
* **Белкарт Pay:** publish releases from dev as regular releases ([a018ac2](https://github.com/eweddwg/belkart-pay-patches/commit/a018ac251a5617b2bc36cb84eb20687fe53da827))
* **Белкарт Pay:** resolve Room database helper via hierarchy and hook NFC into MainActivity ([0be8b7a](https://github.com/eweddwg/belkart-pay-patches/commit/0be8b7a12fc1d239b2c589b232d927b0b380128f))
* **Белкарт Pay:** restore app display name ([998cc82](https://github.com/eweddwg/belkart-pay-patches/commit/998cc8281f32aaa2c02ea9608ee961195621a1a9))

### ✨ Новое

* add automatic NFC enable patch ([def8c5f](https://github.com/eweddwg/belkart-pay-patches/commit/def8c5f21484e4047f513577cd122e15c9438849))
* Add Quick Access Wallet support for Belkart Pay ([0c5dafa](https://github.com/eweddwg/belkart-pay-patches/commit/0c5dafaa896703b79c7d5a47494f61505c1a84f7))
* add root NFC enable hook ([460493d](https://github.com/eweddwg/belkart-pay-patches/commit/460493db6de5a6cf73cc1cee62aff4318d1bf33a))

## [1.0.0-dev.11](https://github.com/eweddwg/belkart-pay-patches/compare/v1.0.0-dev.10...v1.0.0-dev.11) (2026-09-23)

### 🐛 Исправления

* **Белкарт Pay:** resolve Room database helper via hierarchy and hook NFC into MainActivity ([0be8b7a](https://github.com/eweddwg/belkart-pay-patches/commit/0be8b7a12fc1d239b2c589b232d927b0b380128f))

## [1.0.0-dev.10](https://github.com/eweddwg/belkart-pay-patches/compare/v1.0.0-dev.9...v1.0.0-dev.10) (2026-09-23)

### 🐛 Исправления

* **Белкарт Pay:** declare supported app version 00.01.10 ([3bd5ecb](https://github.com/eweddwg/belkart-pay-patches/commit/3bd5ecb1db05d379d8f55d3be6cf83b604516f81))
* **Белкарт Pay:** restore app display name ([998cc82](https://github.com/eweddwg/belkart-pay-patches/commit/998cc8281f32aaa2c02ea9608ee961195621a1a9))

## [1.0.0-dev.9](https://github.com/eweddwg/belkart-pay-patches/compare/v1.0.0-dev.8...v1.0.0-dev.9) (2026-09-23)

### 🐛 Исправления

* enable NFC on every app open instead of once per process ([d5917fa](https://github.com/eweddwg/belkart-pay-patches/commit/d5917fa4809ad8d44599fd8d1c747df43f97d3c5))

## [1.0.0-dev.8](https://github.com/eweddwg/belkart-pay-patches/compare/v1.0.0-dev.7...v1.0.0-dev.8) (2026-09-23)

### 🐛 Исправления

* make Wallet quick launch reliably open payment screen ([6d5e2cb](https://github.com/eweddwg/belkart-pay-patches/commit/6d5e2cbe9df7c4f58f0f75600b761a3337ddd8e2))

## [1.0.0-dev.7](https://github.com/eweddwg/belkart-pay-patches/compare/v1.0.0-dev.6...v1.0.0-dev.7) (2026-09-23)

### 🐛 Исправления

* use range invoke for wallet activity hook ([60a2d17](https://github.com/eweddwg/belkart-pay-patches/commit/60a2d17bcb12870cb2714b71b6eabf5ca93c29b8))

## [1.0.0-dev.6](https://github.com/eweddwg/belkart-pay-patches/compare/v1.0.0-dev.5...v1.0.0-dev.6) (2026-09-23)

### 🐛 Исправления

* hook NFC enable from Application onCreate ([e16292f](https://github.com/eweddwg/belkart-pay-patches/commit/e16292f456328603a0d08e2e29d84bc6fb20970d))
* resolve application context inside NFC hook ([74e1651](https://github.com/eweddwg/belkart-pay-patches/commit/74e165148d774682f73cf1de2eb6edf7550e15a6))

## [1.0.0-dev.5](https://github.com/eweddwg/belkart-pay-patches/compare/v1.0.0-dev.4...v1.0.0-dev.5) (2026-09-23)

### 🐛 Исправления

* correct build script comment ([02e4991](https://github.com/eweddwg/belkart-pay-patches/commit/02e499189571bc16dcf064f745e04912ddc525c3))
* describe real Wallet payment flow ([d68e00a](https://github.com/eweddwg/belkart-pay-patches/commit/d68e00ae19460877ac261939c9d4414af0652d76))

### ✨ Новое

* add automatic NFC enable patch ([def8c5f](https://github.com/eweddwg/belkart-pay-patches/commit/def8c5f21484e4047f513577cd122e15c9438849))
* add root NFC enable hook ([460493d](https://github.com/eweddwg/belkart-pay-patches/commit/460493db6de5a6cf73cc1cee62aff4318d1bf33a))

## [1.0.0-dev.4](https://github.com/eweddwg/belkart-pay-patches/compare/v1.0.0-dev.3...v1.0.0-dev.4) (2026-09-23)

### 🐛 Исправления

* improve Android wallet payment compatibility ([390ccb6](https://github.com/eweddwg/belkart-pay-patches/commit/390ccb65f7048593dbfa5c305e5fb3cc29d1341f))
* keep resource API inside patch execution ([7cb2fbe](https://github.com/eweddwg/belkart-pay-patches/commit/7cb2fbeacfa2a3bcba76f01ba7b2b3afad7363ba))
* match host apdu resource correctly ([9cb299f](https://github.com/eweddwg/belkart-pay-patches/commit/9cb299faeede980483de163eaf55cfd2f1f32263))

## [1.0.0-dev.3](https://github.com/eweddwg/belkart-pay-patches/compare/v1.0.0-dev.2...v1.0.0-dev.3) (2026-09-23)

### 🐛 Bug Fixes

* Restore generatePatchesList task and ship Russian descriptions ([1cc7383](https://github.com/eweddwg/belkart-pay-patches/commit/1cc73832bf9ef50ae8db818a949d5f745273e83b))

## [1.0.0-dev.2](https://github.com/eweddwg/belkart-pay-patches/compare/v1.0.0-dev.1...v1.0.0-dev.2) (2026-09-23)

### 🐛 Bug Fixes

* Use hardware bitmap for wallet card so lock screen shortcut can be added ([49b3df2](https://github.com/eweddwg/belkart-pay-patches/commit/49b3df2b5e0471bae25400c686f82513c5a8a1f9))

## 1.0.0-dev.1 (2026-09-23)

### ✨ New Features

* Add Quick Access Wallet support for Belkart Pay ([0c5dafa](https://github.com/eweddwg/belkart-pay-patches/commit/0c5dafaa896703b79c7d5a47494f61505c1a84f7))
