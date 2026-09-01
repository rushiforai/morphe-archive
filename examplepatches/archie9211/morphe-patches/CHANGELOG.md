## [1.3.5](https://github.com/archie9211/morphe-patches/compare/v1.3.4...v1.3.5) (2026-08-31)

### 🐛 Bug Fixes

* mock PairIP LicenseCheckState to LOCAL_CHECK_OK to prevent native overlay ([09791a6](https://github.com/archie9211/morphe-patches/commit/09791a6b90dcf7aff93d21334a60772e9b0022de))

## [1.3.4](https://github.com/archie9211/morphe-patches/compare/v1.3.3...v1.3.4) (2026-08-31)

### 🐛 Bug Fixes

* use move-object/from16 in FreediumPatch to avoid assembler crash on high registers ([97055fd](https://github.com/archie9211/morphe-patches/commit/97055fd2e8fc5a903ebf53bd2bb364826546adf1))

## [1.3.3](https://github.com/archie9211/morphe-patches/compare/v1.3.2...v1.3.3) (2026-08-31)

### 🐛 Bug Fixes

* use move-object/from16 to avoid dalvik assembler crash on high registers ([0e64ae7](https://github.com/archie9211/morphe-patches/commit/0e64ae7c508cd578c5a9dfe5e5ce3657e89adc37))

## [1.3.2](https://github.com/archie9211/morphe-patches/compare/v1.3.1...v1.3.2) (2026-08-31)

### 🐛 Bug Fixes

* use invoke-super/range to avoid invalid register v29 ([233ce09](https://github.com/archie9211/morphe-patches/commit/233ce09c1baa166dfb9c59edb992a9238bf45489))

## [1.3.1](https://github.com/archie9211/morphe-patches/compare/v1.3.0...v1.3.1) (2026-08-31)

### 🐛 Bug Fixes

* bypass play store check using fingerprint and onStart ([e997797](https://github.com/archie9211/morphe-patches/commit/e997797aa5bd3207c3b4d63b821ec832549dffe7))

## [1.3.0](https://github.com/archie9211/morphe-patches/compare/v1.2.1...v1.3.0) (2026-08-26)

### ✨ New Features

* bypass PairIP signature and license checks ([a2bedb3](https://github.com/archie9211/morphe-patches/commit/a2bedb31fd0f2fbad422106508863fa2ebac2fa2))

## [1.2.1](https://github.com/archie9211/morphe-patches/compare/v1.2.0...v1.2.1) (2026-08-26)

### 🐛 Bug Fixes

* ensure patch options use String type instead of kotlin.String for Morphe Manager compatibility ([7d2d50c](https://github.com/archie9211/morphe-patches/commit/7d2d50c4ad837d37bbecd3c25535fc568bafe30f))

## [1.2.0](https://github.com/archie9211/morphe-patches/compare/v1.1.2...v1.2.0) (2026-08-26)

### 🐛 Bug Fixes

* **medium:** address unlock button issue, hide premium banners, and hide freedium header ([77844bc](https://github.com/archie9211/morphe-patches/commit/77844bc708307b11f0ac9802b3238fdae83ba719))

### ✨ New Features

* Add Freedium mirror patch for Medium app ([050ec75](https://github.com/archie9211/morphe-patches/commit/050ec750e45a162a31026e24eec267fd0252edd7))

## [1.1.0](https://github.com/archie9211/morphe-patches/compare/v1.0.6...v1.1.0) (2026-08-26)

### ✨ New Features

* Add Freedium mirror patch for Medium app ([050ec75](https://github.com/archie9211/morphe-patches/commit/050ec750e45a162a31026e24eec267fd0252edd7))

## [1.0.6](https://github.com/archie9211/morphe-patches/compare/v1.0.5...v1.0.6) (2026-08-25)

### 🐛 Bug Fixes

* correct fingerprint method name from 'PremiumResponse toString' to 'toString' ([4d41b97](https://github.com/archie9211/morphe-patches/commit/4d41b973842461ed156a62504d4f414afe720ce8))

## [1.0.5](https://github.com/archie9211/morphe-patches/compare/v1.0.4...v1.0.5) (2026-08-25)

### 🐛 Bug Fixes

* relax premium response fingerprint string ([4e76e1b](https://github.com/archie9211/morphe-patches/commit/4e76e1b0837cba9bf74d47b4ec9093cdf075f8d1))

## [1.0.4](https://github.com/archie9211/morphe-patches/compare/v1.0.3...v1.0.4) (2026-08-25)

### 🐛 Bug Fixes

* rename patches-list.json to patches.json to meet Morphe app requirements ([4175595](https://github.com/archie9211/morphe-patches/commit/4175595dc97516a68c7294f606a2e8754fb48b27))

## [1.0.3](https://github.com/archie9211/morphe-patches/compare/v1.0.2...v1.0.3) (2026-08-25)

### 🐛 Bug Fixes

* auto-resolve backmerge conflicts by prioritizing main ([30028ce](https://github.com/archie9211/morphe-patches/commit/30028ce82b728e2148fb8310af55096f1442788e))

## [1.0.2](https://github.com/archie9211/morphe-patches/compare/v1.0.1...v1.0.2) (2026-08-25)

### 🐛 Bug Fixes

* add issues and PR permissions for semantic-release and disable fail comments ([f4d4729](https://github.com/archie9211/morphe-patches/commit/f4d4729068ae7b419b5d4b0882825285af3a8a9a))

## [1.0.1](https://github.com/archie9211/morphe-patches/compare/v1.0.0...v1.0.1) (2026-08-25)

### 🐛 Bug Fixes

* include patches-bundle.json and patches-list.json in github release assets ([865b75f](https://github.com/archie9211/morphe-patches/commit/865b75f8b48a4acade4905d7cc565d12ac3d4a16))

## 1.0.0 (2026-08-25)

### 🐛 Bug Fixes

* Resolve unimported and incorrect Morphe API usages ([464d7ec](https://github.com/archie9211/morphe-patches/commit/464d7ece0829277d564728e7579f2f17b9509e9b))
* update imports and instructions API in PremiumPatch and guide ([771c0e7](https://github.com/archie9211/morphe-patches/commit/771c0e7606f8be2ab63d0592b82349fae0aa381c))

### ✨ New Features

* Add audiorelay premium patch ([eba46ee](https://github.com/archie9211/morphe-patches/commit/eba46eeb68a8c25ee11405f89c94a81307734cc5))
