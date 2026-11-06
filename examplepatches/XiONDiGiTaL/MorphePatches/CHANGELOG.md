## [1.1.1](https://github.com/XiONDiGiTaL/MorphePatches/compare/v1.1.0...v1.1.1) (2026-11-06)

### 🚀 Updated App Support

* **tandem:** support Tandem 6.12.0 alongside 6.38.0 ([7df07ac](https://github.com/XiONDiGiTaL/MorphePatches/commit/7df07acfaf39adec55dfd3f0ed4a5035c5dc661a))

## [1.1.0](https://github.com/XiONDiGiTaL/MorphePatches/compare/v1.0.2...v1.1.0) (2026-11-04)

### ✨ New Features

* **tandem:** add a clone package patch ([d8fb4fb](https://github.com/XiONDiGiTaL/MorphePatches/commit/d8fb4fb359d9aefc35f9b09f16127000d564caef))

### 🐛 Bug Fixes

* **ci:** read the clone id from the binary manifest as UTF-16 ([09c6f4b](https://github.com/XiONDiGiTaL/MorphePatches/commit/09c6f4bab85271160d0e41f9731e847069950054))

## [1.0.2](https://github.com/XiONDiGiTaL/MorphePatches/compare/v1.0.1...v1.0.2) (2026-11-04)

### 🐛 Bug Fixes

* **patches:** close PairIP's licence screen and its kill switch ([4eca703](https://github.com/XiONDiGiTaL/MorphePatches/commit/4eca70381e8b3ade184f1f2639b4ef0c279cd3d0))

## [1.0.1](https://github.com/XiONDiGiTaL/MorphePatches/compare/v1.0.0...v1.0.1) (2026-11-03)

Re-released: the first `patches-1.0.1.mpp` aborted at patch time and has been withdrawn.

### 🐛 Bug Fixes

* **patches:** empty method bodies through the implementation's own `removeInstruction` instead of dexlib2's read-only instruction list
* **patches:** match the community ad composable with `isStatic`, because Morphe compares `accessFlags` exactly and the method is `public static final`
* **companion:** add the offline Tandem Study app and document it

## 1.0.0 (2026-11-01) — retired

The first published bundle, built before both patch-time fixes below. Patching with it aborts before
any change is made; use 1.0.1 instead.

### ✨ New Features

* add Tandem dark-mode patch scaffold and link it from README ([b077257](https://github.com/XiONDiGiTaL/MorphePatches/commit/b07725749eef49e68a07c99ad7ed4d5c4c647a13))
* **tandem:** add PairIP bypass and Adjust tracking patches ([0eea305](https://github.com/XiONDiGiTaL/MorphePatches/commit/0eea3054a4b6fd102a8b6773eb6263c8fca662bd))
* **tandem:** add Remove ads patch ([342df2b](https://github.com/XiONDiGiTaL/MorphePatches/commit/342df2bef36a61a6b09a9340297099dd04ef6628))
* **tandem:** ship force-dark-mode patch and prebuilt bundle for 6.38.0 ([c20aeaa](https://github.com/XiONDiGiTaL/MorphePatches/commit/c20aeaa6f863fa24e77b7adce6faf998145ef631))
