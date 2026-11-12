## [1.5.1](https://github.com/sabbirdj/viper-patches/compare/v1.5.0...v1.5.1) (2026-11-12)

### 🐛 Bug Fixes

* correct parameter register in Bangladesh VPN H/I tier patches ([ffade23](https://github.com/sabbirdj/viper-patches/commit/ffade23955e300cfd76ae4bc8c6d2363e53c3d35))

## [1.5.0](https://github.com/sabbirdj/viper-patches/compare/v1.4.0...v1.5.0) (2026-11-12)

### ✨ New Features

* add Bangladesh VPN VIP unlock patch ([3d3a2c1](https://github.com/sabbirdj/viper-patches/commit/3d3a2c1f28287b4c3cb2c7b5c99e2c340c562c38))

## [1.4.0](https://github.com/sabbirdj/viper-patches/compare/v1.3.0...v1.4.0) (2026-11-11)

### ✨ New Features

* **shohay:** add Spoof installer source (Play Store) patch ([8c62b9f](https://github.com/sabbirdj/viper-patches/commit/8c62b9faaaed2fe8d1ab801393c448a9209cfeb7))

## [1.3.0](https://github.com/sabbirdj/viper-patches/compare/v1.2.5...v1.3.0) (2026-11-11)

### ✨ New Features

* **shohay:** add Morphe patches for Shohay Pregnancy Health 2.1.1 ([1f93b77](https://github.com/sabbirdj/viper-patches/commit/1f93b77a238f77ea4a7ff319af21f7701ba023a7))

### 🐛 Bug Fixes

* **shohay:** correct Instruction import path in login patch ([edf3873](https://github.com/sabbirdj/viper-patches/commit/edf3873d9a92b64dbdfb1e4d6e28a6b4b1fba170))

## [1.2.5](https://github.com/sabbirdj/viper-patches/compare/v1.2.4...v1.2.5) (2026-11-10)

### 🐛 Bug Fixes

* remove NetMonster patches ([3aa89e2](https://github.com/sabbirdj/viper-patches/commit/3aa89e20e8a2ea9b739d5a9ed5f8c84fc927e390))

## [1.2.4](https://github.com/sabbirdj/viper-patches/compare/v1.2.3...v1.2.4) (2026-11-10)

### 🐛 Bug Fixes

* **netmonster:** restore maps_dynamite retry-kill dropped in v1.2.3 ([1c7c018](https://github.com/sabbirdj/viper-patches/commit/1c7c0180a42ef376d26fa0ef51012b79a28bf14b))

## [1.2.3](https://github.com/sabbirdj/viper-patches/compare/v1.2.2...v1.2.3) (2026-11-10)

### 🐛 Bug Fixes

* **netmonster:** escape $ in SharedPreferences$Editor inside Kotlin raw string ([cf8f15b](https://github.com/sabbirdj/viper-patches/commit/cf8f15b2e94e8f968c8d5ed7d1a7afe1f2280208))
* **netmonster:** force MicroG-RE VTM map renderer (Mapbox .so is 4KB-aligned, fails on Android 16) ([b6fbf16](https://github.com/sabbirdj/viper-patches/commit/b6fbf16821c86e0171b66d3860233d3db84cf751))

## [1.2.2](https://github.com/sabbirdj/viper-patches/compare/v1.2.1...v1.2.2) (2026-11-10)

### 🐛 Bug Fixes

* **netmonster:** neutralise maps_dynamite retry so map always reaches MicroG-RE fallback ([bb22a1f](https://github.com/sabbirdj/viper-patches/commit/bb22a1f29860f62f8ecda9ab044b84fcfd75ac6d))

## [1.2.1](https://github.com/sabbirdj/viper-patches/compare/v1.2.0...v1.2.1) (2026-11-10)

### 🐛 Bug Fixes

* bypass Play Services gate so NetMonster map reaches MicroG-RE ([7cb18ad](https://github.com/sabbirdj/viper-patches/commit/7cb18ade349defc893258492fd9def9c23130228))

## [1.2.0](https://github.com/sabbirdj/viper-patches/compare/v1.1.2...v1.2.0) (2026-11-10)

### ✨ New Features

* draw NetMonster map through MicroG-RE ([b73abca](https://github.com/sabbirdj/viper-patches/commit/b73abcaf9b849ec7d6c05eb2c793f09b1b890ba9))

## [1.1.2](https://github.com/sabbirdj/viper-patches/compare/v1.1.1...v1.1.2) (2026-11-10)

### 🐛 Bug Fixes

* set NetMonster premium expiry to 2099 ([f7d649a](https://github.com/sabbirdj/viper-patches/commit/f7d649a919a73761aa5a96688e0936a4210ef7c5))

## [1.1.1](https://github.com/sabbirdj/viper-patches/compare/v1.1.0...v1.1.1) (2026-11-10)

### 🐛 Bug Fixes

* force NetMonster premium card boolean and expiry (hide PURCHASE) ([db1904d](https://github.com/sabbirdj/viper-patches/commit/db1904db13ca2ddecb485ac33e89132181165ef4))

## [1.1.0](https://github.com/sabbirdj/viper-patches/compare/v1.0.8...v1.1.0) (2026-11-10)

### ✨ New Features

* add NetMonster Premium patch (5.3.1) ([4100af2](https://github.com/sabbirdj/viper-patches/commit/4100af207417df95117ed667adba4baf78a61adf))

## [1.0.8](https://github.com/sabbirdj/viper-patches/compare/v1.0.7...v1.0.8) (2026-11-10)

### 🐛 Bug Fixes

* use replaceInstruction for APKS Installer ads (same fix as SAI v1.0.7) ([e4dfa82](https://github.com/sabbirdj/viper-patches/commit/e4dfa82768e5c107f658b2b9520833f442b4dcc3))

## [1.0.7](https://github.com/sabbirdj/viper-patches/compare/v1.0.6...v1.0.7) (2026-11-10)

### 🐛 Bug Fixes

* access instructions via method.implementation (MutableMethod has no instructions property) ([ea95737](https://github.com/sabbirdj/viper-patches/commit/ea957375592bbf0fd8b65deaec55b603639b4025))
* use replaceInstruction for fk0/dk0 so the forced boolean actually runs ([a3e6253](https://github.com/sabbirdj/viper-patches/commit/a3e6253c010afc7e32186cb9abbcd31fa12b5eb5))

## [1.0.6](https://github.com/sabbirdj/viper-patches/compare/v1.0.5...v1.0.6) (2026-11-10)

### 🐛 Bug Fixes

* use addInstructionsWithLabels so branch targets are not skipped ([8c03ffc](https://github.com/sabbirdj/viper-patches/commit/8c03ffc7cf0c1d3cf62f968d1eb4e349f47c9073))

## [1.0.5](https://github.com/sabbirdj/viper-patches/compare/v1.0.4...v1.0.5) (2026-11-10)

### 🐛 Bug Fixes

* pin SAI fingerprints to their defining class and method ([47a7ebd](https://github.com/sabbirdj/viper-patches/commit/47a7ebddd3069f69eccc37616075208ed4b90181))

## [1.0.4](https://github.com/sabbirdj/viper-patches/compare/v1.0.3...v1.0.4) (2026-11-10)

### 🐛 Bug Fixes

* remove strict apkFileType and ABI restrictions from SAI and APKS Installer ([ceedbaa](https://github.com/sabbirdj/viper-patches/commit/ceedbaa337bff7fc95081a477b80b23319dcbd58))

## [1.0.3](https://github.com/sabbirdj/viper-patches/compare/v1.0.2...v1.0.3) (2026-11-10)

### 🐛 Bug Fixes

* restore original target compatibility rules ([aa1b615](https://github.com/sabbirdj/viper-patches/commit/aa1b6158de8bd2f05e4c40e46ff13968fe81514a))

## [1.0.2](https://github.com/sabbirdj/viper-patches/compare/v1.0.1...v1.0.2) (2026-11-10)

### 🐛 Bug Fixes

* update repository metadata and trigger signed release ([8ab7bea](https://github.com/sabbirdj/viper-patches/commit/8ab7bea87d490c7e59f92670366eb00c46ce0daf))

## [1.0.1](https://github.com/sabbirdj/viper-patches/compare/v1.0.0...v1.0.1) (2026-11-10)

### 🐛 Bug Fixes

* relax apkFileType and version targets for SAI and APKS Installer ([989e34a](https://github.com/sabbirdj/viper-patches/commit/989e34ae5d3c471aa64d18a0d9abd17f43f57bff))

## 1.0.0 (2026-11-10)

### ✨ New Features

* fix patch compilation and build configuration ([25bed97](https://github.com/sabbirdj/viper-patches/commit/25bed97221379a6ad17012b62a62405f51391b70))

### 🐛 Bug Fixes

* make gradlew executable ([0821786](https://github.com/sabbirdj/viper-patches/commit/08217860202eb4dae02974996a8c0a98b231a01c))
* remove dummy GitHub credentials and add mavenLocal repo ([1992b59](https://github.com/sabbirdj/viper-patches/commit/1992b59f2b555b6e2b7e69b2d81124774da784bd))
* use 0xRRGGBB icon colors (patcher rejects ARGB) ([2c10cb8](https://github.com/sabbirdj/viper-patches/commit/2c10cb8411a4c8b4c1b407130879b74b64f439da))
* use Int color values in Compatibility ([f0784fb](https://github.com/sabbirdj/viper-patches/commit/f0784fbe67e3467ab33ea73f2ec0874f72259cc5))
