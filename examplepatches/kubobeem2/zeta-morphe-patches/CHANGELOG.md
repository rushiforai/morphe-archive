## [1.4.1](https://github.com/kubobeem2/zeta-morphe-patches/compare/v1.4.0...v1.4.1) (2026-11-14)

### 🐛 Bug Fixes

* **integrity:** merge native autoprotect patch into the paywall patch ([00b729d](https://github.com/kubobeem2/zeta-morphe-patches/commit/00b729dea35cec794419ffb234ffb62f41459e42))

## [1.4.0](https://github.com/kubobeem2/zeta-morphe-patches/compare/v1.3.0...v1.4.0) (2026-11-14)

### ✨ New Features

* **integrity:** add native .so patch to bypass PairIP autoprotect ([20d62dd](https://github.com/kubobeem2/zeta-morphe-patches/commit/20d62dd51f5fcfd853cdfa5ddb6c3ccc5488ad95))

## [1.3.0](https://github.com/kubobeem2/zeta-morphe-patches/compare/v1.2.5...v1.3.0) (2026-11-14)

### ✨ New Features

* **integrity:** NOP LicenseClient.checkLicense to silence Java license check ([b5fc996](https://github.com/kubobeem2/zeta-morphe-patches/commit/b5fc996e23aa35c5266778ff5c8ad3f06b26a7e6))

## [1.2.5](https://github.com/kubobeem2/zeta-morphe-patches/compare/v1.2.4...v1.2.5) (2026-11-13)

### 🐛 Bug Fixes

* **integrity:** revert StartupLauncher.launch NOP (VM startup is essential, app crashes) ([2cdb8f0](https://github.com/kubobeem2/zeta-morphe-patches/commit/2cdb8f012cdfc81d35f1f2e0b7c28dd63870a3f0))

## [1.2.4](https://github.com/kubobeem2/zeta-morphe-patches/compare/v1.2.3...v1.2.4) (2026-11-13)

### 🐛 Bug Fixes

* **integrity:** disable PairIP VM startup program (StartupLauncher.launch) ([0a93687](https://github.com/kubobeem2/zeta-morphe-patches/commit/0a9368750cf2a325c7bd4b1e3e42fa15095e16ec))

## [1.2.3](https://github.com/kubobeem2/zeta-morphe-patches/compare/v1.2.2...v1.2.3) (2026-11-13)

### 🐛 Bug Fixes

* **integrity:** bypass PairIP license paywall instead of nonexistent showDialog ([7a64773](https://github.com/kubobeem2/zeta-morphe-patches/commit/7a64773879deb61c7dbb93cdaaab8faf309e8979))
* **integrity:** restore Kotlin source (previous push stored base64 text) ([1058484](https://github.com/kubobeem2/zeta-morphe-patches/commit/1058484a96f1af4aae29c5b4ad901cada6f46858))

## [1.2.2](https://github.com/kubobeem2/zeta-morphe-patches/compare/v1.2.1...v1.2.2) (2026-11-13)

### 🐛 Bug Fixes

* **integrity:** narrow showDialog fingerprint by name and exclude abstract methods ([dc99756](https://github.com/kubobeem2/zeta-morphe-patches/commit/dc997566b04af44351d32f4f66f64fb577beaacf))

## [1.2.1](https://github.com/kubobeem2/zeta-morphe-patches/compare/v1.2.0...v1.2.1) (2026-11-13)

### 🐛 Bug Fixes

* **release:** use merge strategy with theirs for backmerge to avoid rebase conflicts ([4c5c2bd](https://github.com/kubobeem2/zeta-morphe-patches/commit/4c5c2bda2aa0fc44eb3ec5791027e9612b1239b7))

## [1.2.0](https://github.com/kubobeem2/zeta-morphe-patches/compare/v1.1.0...v1.2.0) (2026-11-13)

### ✨ New Features

* **integrity:** add Bypass Play Integrity and Installer Check patch ([9082e6d](https://github.com/kubobeem2/zeta-morphe-patches/commit/9082e6da55262ea0e9a93ca64fa118f843916eeb))

### 🐛 Bug Fixes

* **integrity:** fix Fingerprint declaration for getInstallerPackageName ([b8eb45e](https://github.com/kubobeem2/zeta-morphe-patches/commit/b8eb45eb9a5d2bdb61a0aa720c02bfb35fe2d5a1))

## [1.1.0](https://github.com/kubobeem2/zeta-morphe-patches/compare/v1.0.1...v1.1.0) (2026-11-13)

### ✨ New Features

* **clone:** add Clone Zeta patch to change package name and bypass integrity checks ([c0ef8f1](https://github.com/kubobeem2/zeta-morphe-patches/commit/c0ef8f198618335e0d8dae6264ad463053c6d58a))

## [1.0.1](https://github.com/kubobeem2/zeta-morphe-patches/compare/v1.0.0...v1.0.1) (2026-11-13)

### 🐛 Bug Fixes

* **ads:** catch PatchException when ad sdk classes are absent ([c3f4c4c](https://github.com/kubobeem2/zeta-morphe-patches/commit/c3f4c4cd0f789a74162741c2f6d14eb2edbb72e6))

## 1.0.0 (2026-11-13)

### ✨ New Features

* initial release of zeta morphe patches with ads block, tps monitor, and hermes memory ([15ce92b](https://github.com/kubobeem2/zeta-morphe-patches/commit/15ce92bbd1ec77f44e3b1a00fc933765831dc4ab))

### 🐛 Bug Fixes

* make gradlew executable ([993929c](https://github.com/kubobeem2/zeta-morphe-patches/commit/993929c6650e33a35eb1935813ccefe66bd95901))
* use Fingerprint.method directly instead of result.mutableMethod ([3448a72](https://github.com/kubobeem2/zeta-morphe-patches/commit/3448a727b2054c85652ebb19952295eb9011b44c))
