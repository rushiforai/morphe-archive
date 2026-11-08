## [1.9.0](https://github.com/sqzass/patches/compare/v1.8.2...v1.9.0) (2026-11-07)

### 🐛 Bug Fixes

* **hermes:** throw PatchException instead of generic Exception in LibraryHermesPatch ([1aeeac4](https://github.com/sqzass/patches/commit/1aeeac4286fc3864a92a5da781af2cd0e3dfe0c3))
* **hermes:** throw PatchException instead of generic Exception in LibraryHermesPatch ([fc9c36c](https://github.com/sqzass/patches/commit/fc9c36c61f74b5df713d573db2e273b186051063))
* **pairip:** use firstOrNull guards in gutPairIpVm so missing PairIP classes don't crash patching ([e4b5cc6](https://github.com/sqzass/patches/commit/e4b5cc635c5ad617cda9ca488cb41741ea2fb292))
* **pairip:** use firstOrNull guards in gutPairIpVm so missing PairIP classes don't crash patching ([7a58eb5](https://github.com/sqzass/patches/commit/7a58eb50809d643fccd499ab95cec656a4f80f8b))
* **spoofing:** escape dollar signs in descriptors and make patched accumulator mutable ([10cef1c](https://github.com/sqzass/patches/commit/10cef1c4f0edd14c000f6cd76d2b441be1098f70))

### ✨ New Features

* **constants:** populate real app compatibility definitions ([c8675ce](https://github.com/sqzass/patches/commit/c8675cec8f6e3bd0d8aecde8cbb38b433206424a))
* **constants:** populate real app compatibility definitions ([521de58](https://github.com/sqzass/patches/commit/521de58276b860a3d9579a4c5400cf888140a098))
* **shared:** add bytecode and resource patching utilities ([ad9b273](https://github.com/sqzass/patches/commit/ad9b27375c9de78405c0c64e14f00fe3a649e8eb))
* **shared:** add bytecode and resource patching utilities ([4fcd731](https://github.com/sqzass/patches/commit/4fcd731e24a8cc98f8ce720ebd24748dd830f5b1))
* **shared:** add cert, drm, firebase, gms, installer, signature subpackages ([01a1eb8](https://github.com/sqzass/patches/commit/01a1eb8a18960a8ebeeb7f0534d744bb93779ad5))
* **shared:** add cert, drm, firebase, gms, installer, signature subpackages ([4a8ca72](https://github.com/sqzass/patches/commit/4a8ca721ce5cc5b8877610902dcceeeaf2a6784b))
* **spoofing:** add advertising ID, battery level, and MAC address spoof patches ([45194a5](https://github.com/sqzass/patches/commit/45194a5459ef32b0542c130c61a3093f8240cf12))
* **spoofing:** add advertising ID, battery level, and MAC address spoof patches ([d89e45d](https://github.com/sqzass/patches/commit/d89e45de8e37d0f431ab6b95b723fe9ffa38ebff))

## [1.9.0-dev.1](https://github.com/sqzass/patches/compare/v1.8.2...v1.9.0-dev.1) (2026-11-07)

### 🐛 Bug Fixes

* **hermes:** throw PatchException instead of generic Exception in LibraryHermesPatch ([1aeeac4](https://github.com/sqzass/patches/commit/1aeeac4286fc3864a92a5da781af2cd0e3dfe0c3))
* **hermes:** throw PatchException instead of generic Exception in LibraryHermesPatch ([fc9c36c](https://github.com/sqzass/patches/commit/fc9c36c61f74b5df713d573db2e273b186051063))
* **pairip:** use firstOrNull guards in gutPairIpVm so missing PairIP classes don't crash patching ([e4b5cc6](https://github.com/sqzass/patches/commit/e4b5cc635c5ad617cda9ca488cb41741ea2fb292))
* **pairip:** use firstOrNull guards in gutPairIpVm so missing PairIP classes don't crash patching ([7a58eb5](https://github.com/sqzass/patches/commit/7a58eb50809d643fccd499ab95cec656a4f80f8b))
* **spoofing:** escape dollar signs in descriptors and make patched accumulator mutable ([10cef1c](https://github.com/sqzass/patches/commit/10cef1c4f0edd14c000f6cd76d2b441be1098f70))

### ✨ New Features

* **constants:** populate real app compatibility definitions ([c8675ce](https://github.com/sqzass/patches/commit/c8675cec8f6e3bd0d8aecde8cbb38b433206424a))
* **constants:** populate real app compatibility definitions ([521de58](https://github.com/sqzass/patches/commit/521de58276b860a3d9579a4c5400cf888140a098))
* **shared:** add bytecode and resource patching utilities ([ad9b273](https://github.com/sqzass/patches/commit/ad9b27375c9de78405c0c64e14f00fe3a649e8eb))
* **shared:** add bytecode and resource patching utilities ([4fcd731](https://github.com/sqzass/patches/commit/4fcd731e24a8cc98f8ce720ebd24748dd830f5b1))
* **shared:** add cert, drm, firebase, gms, installer, signature subpackages ([01a1eb8](https://github.com/sqzass/patches/commit/01a1eb8a18960a8ebeeb7f0534d744bb93779ad5))
* **shared:** add cert, drm, firebase, gms, installer, signature subpackages ([4a8ca72](https://github.com/sqzass/patches/commit/4a8ca721ce5cc5b8877610902dcceeeaf2a6784b))
* **spoofing:** add advertising ID, battery level, and MAC address spoof patches ([45194a5](https://github.com/sqzass/patches/commit/45194a5459ef32b0542c130c61a3093f8240cf12))
* **spoofing:** add advertising ID, battery level, and MAC address spoof patches ([d89e45d](https://github.com/sqzass/patches/commit/d89e45de8e37d0f431ab6b95b723fe9ffa38ebff))

## [1.8.2](https://github.com/sqzass/patches/compare/v1.8.1...v1.8.2) (2026-10-25)

### 🐛 Bug Fixes

* drop stale derived register on overwrite in const tracking ([ebb0195](https://github.com/sqzass/patches/commit/ebb0195b0cec0b2c6bcc4854d46deb66cf3ea7bf))

## [1.8.1](https://github.com/sqzass/patches/compare/v1.8.0...v1.8.1) (2026-10-25)

### 🐛 Bug Fixes

* stage resource files before document() parse in font attribute rewrite loop ([ed27409](https://github.com/sqzass/patches/commit/ed2740980530ef6a6e311cc1987db37a74e52caa))

## [1.8.0](https://github.com/sqzass/patches/compare/v1.7.2...v1.8.0) (2026-10-25)

### ✨ New Features

* add custom font injection patch (closes [#5](https://github.com/sqzass/patches/issues/5)) ([b91cf04](https://github.com/sqzass/patches/commit/b91cf044d7771be15b5ef581121a9181ab6547af))

## [1.7.2](https://github.com/sqzass/patches/compare/v1.7.1...v1.7.2) (2026-10-25)

### 🐛 Bug Fixes

* correct Smali literals, signature matching, resource lookups, and manifest attributes across patches ([4b8ef4a](https://github.com/sqzass/patches/commit/4b8ef4a7a32a9221db8b519461d3d71fae92ea6b))

## [1.7.1](https://github.com/sqzass/patches/compare/v1.7.0...v1.7.1) (2026-10-15)

### 🐛 Bug Fixes

* handle stale instruction indices safely during bytecode patching loops ([deeaad6](https://github.com/sqzass/patches/commit/deeaad66b18e906a9348497c65e4870d759c29f1))

## [1.7.0](https://github.com/sqzass/patches/compare/v1.6.0...v1.7.0) (2026-10-15)

### ✨ New Features

* add integrity patches to bypass anti-tamper checks and PairIP protection ([e2d34d3](https://github.com/sqzass/patches/commit/e2d34d36a3bd738af3bcf74f8a78f226f901b1e1))
* add package rename, universal cleanup, DexGuard decrypt hook ([6937fbf](https://github.com/sqzass/patches/commit/6937fbfed80158288aacb54328aaf4e087ee8936))
* add Play Billing mock, premium unlock, free purchases, ads-free rewards ([9c9e7c5](https://github.com/sqzass/patches/commit/9c9e7c532793d88ff4405ceed68b3b917defb71c))
* add Play licensing, integrity, and Play Protect bypass patches ([bb41c8d](https://github.com/sqzass/patches/commit/bb41c8d0619bbbbf7ac759b33e19cb9caa0e81c1))

## [1.6.0](https://github.com/sqzass/patches/compare/v1.5.0...v1.6.0) (2026-10-15)

### ✨ New Features

* clarify option descriptions ([5b3eab5](https://github.com/sqzass/patches/commit/5b3eab5b1d757a53b6c11adf7322b7caba2fdd1f))

## [1.5.0](https://github.com/sqzass/patches/compare/v1.4.0...v1.5.0) (2026-10-12)

### ✨ New Features

* add privacy patches for analytics and backups ([105b1b1](https://github.com/sqzass/patches/commit/105b1b19af9c72cf52a7633a94a3d185fe1ec025))

## [1.4.0](https://github.com/sqzass/patches/compare/v1.3.0...v1.4.0) (2026-10-12)

### ✨ New Features

* merge debugging/cert patches and fold package visibility into permissions ([8f10b4b](https://github.com/sqzass/patches/commit/8f10b4bf56fad238bb95495d52c7bf3089f434b3))

## [1.3.0](https://github.com/sqzass/patches/compare/v1.2.0...v1.3.0) (2026-10-11)

### ✨ New Features

* add privacy patches and shared utility modules for app hardening ([4dea216](https://github.com/sqzass/patches/commit/4dea21651af618ae6860ed3d338e75466a33f67f))

## [1.2.0](https://github.com/sqzass/patches/compare/v1.1.0...v1.2.0) (2026-10-11)

### ✨ New Features

* added more things that remove tracking ([57289db](https://github.com/sqzass/patches/commit/57289db02e1192eaba25279a1049d25e48ed2b7f))

## [1.1.0](https://github.com/sqzass/patches/compare/v1.0.0...v1.1.0) (2026-10-11)

### ✨ New Features

* dummy push ([ecd9d67](https://github.com/sqzass/patches/commit/ecd9d67af8db05d32863b29a1535d77aabedc158))

## 1.0.0 (2026-10-11)

### ✨ New Features

* init patches ([3348d49](https://github.com/sqzass/patches/commit/3348d497b144472ff15ec7f545226320714de6d2))
