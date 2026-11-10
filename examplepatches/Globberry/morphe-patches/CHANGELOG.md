## [1.2.10](https://github.com/Globberry/morphe-patches/compare/v1.2.9...v1.2.10) (2026-11-10)

### 🐛 Bug Fixes

* remove catch-all yMQp6hm patch that crashed with Boolean cast to Runnable; keep only f6olX-specific patches (yMQp6hm=Boolean.TRUE, NMGZ06=Boolean.TRUE, lSqPRgn=true, yMQp6hm field=false) ([39aa0a3](https://github.com/Globberry/morphe-patches/commit/39aa0a3dac78f5d669695d5852287c0e065ca972))

## [1.2.9](https://github.com/Globberry/morphe-patches/compare/v1.2.8...v1.2.9) (2026-11-10)

### 🐛 Bug Fixes

* remove catch-all yMQp6hm patch that crashed v5YtyUtD.MeOIJuj; keep f6olX patches only (yMQp6hm=Boolean.TRUE, NMGZ06=Boolean.TRUE, lSqPRgn=true, yMQp6hm field=false) ([e86b815](https://github.com/Globberry/morphe-patches/commit/e86b81511865a059080d6e42f11dea275e67bf0c))

## [1.2.8](https://github.com/Globberry/morphe-patches/compare/v1.2.7...v1.2.8) (2026-11-10)

### 🐛 Bug Fixes

* exclude native/abstract yMQp6hm methods with wrong param count from catch-all patch ([c1fc6d1](https://github.com/Globberry/morphe-patches/commit/c1fc6d10d031c9f236ac174e115400c31502f985))

## [1.2.7](https://github.com/Globberry/morphe-patches/compare/v1.2.6...v1.2.7) (2026-11-10)

### 🐛 Bug Fixes

* set yMQp6hm field=false so yMQp6hm() doesn't return sentinel; fix NMGZ06() to return Boolean.TRUE instead of KZr7ww (passes check-cast) ([d3af6bd](https://github.com/Globberry/morphe-patches/commit/d3af6bdb1f06a3720b96176e59834b7f09083c14))

## [1.2.6](https://github.com/Globberry/morphe-patches/compare/v1.2.5...v1.2.6) (2026-11-10)

### 🐛 Bug Fixes

* f6olX.yMQp6hm() returns Boolean.TRUE directly instead of sentinel so export callers pass the if-ne Pro check ([0937791](https://github.com/Globberry/morphe-patches/commit/0937791fd9ac3f046e942fec1e7b1158c3512cb6))
* f6olX.yMQp6hm() returns Boolean.TRUE directly instead of sentinel so export callers pass the if-ne Pro check ([f4ecc12](https://github.com/Globberry/morphe-patches/commit/f4ecc1294aec8cdb736263a437dfcc7cad6077b0))

## [1.2.5](https://github.com/Globberry/morphe-patches/compare/v1.2.4...v1.2.5) (2026-11-09)

### 🐛 Bug Fixes

* force return Boolean.TRUE in f6olX export-critical methods (GX9XN3ZIZ, MeOIJuj, c3oEd, cdo7kOuyS, eFUbX) to bypass eFUbX.yMQp6hm Pro check during premium export ([cd12c04](https://github.com/Globberry/morphe-patches/commit/cd12c04160dd380841c8409e97013e076dc235b2))

## [1.2.4](https://github.com/Globberry/morphe-patches/compare/v1.2.3...v1.2.4) (2026-11-09)

### 🐛 Bug Fixes

* set f6olX clinit yMQp6hm=true/lSqPRgn=false, fix NMGZ06 to keep lSqPRgn=false, patch lSqPRgn() to return true for export Pro check ([8057905](https://github.com/Globberry/morphe-patches/commit/80579056531b552f2987222ea96f26f5786ba7bf))

## [1.2.3](https://github.com/Globberry/morphe-patches/compare/v1.2.2...v1.2.3) (2026-11-09)

### 🐛 Bug Fixes

* set f6olX static yMQp6hm/lSqPRgn fields and fix yMQp6hm() NMGZ06 call params for export Pro check ([630aa2a](https://github.com/Globberry/morphe-patches/commit/630aa2a91ed47a753bcbe9d49034f79f44abf151))

## [1.2.2](https://github.com/Globberry/morphe-patches/compare/v1.2.1...v1.2.2) (2026-11-09)

### 🐛 Bug Fixes

* set NativeIdentity.c3oEd field=true and fix NMGZ06 to publish to GX9XN3ZIZ field for 1.5.10 Pro unlock ([32b22b8](https://github.com/Globberry/morphe-patches/commit/32b22b8f89aff6dd7fa7de4668850189caaac125))

## [1.2.1](https://github.com/Globberry/morphe-patches/compare/v1.2.0...v1.2.1) (2026-11-09)

### 🐛 Bug Fixes

* correct uHQuORIu class name case and NMGZ06 patch for 1.5.10 Pro unlock ([13718f6](https://github.com/Globberry/morphe-patches/commit/13718f6562aecf0c2f09aa3ce8f2c68b8fd68b1c))

## [1.2.0](https://github.com/Globberry/morphe-patches/compare/v1.1.0...v1.2.0) (2026-11-09)

### ✨ New Features

* update patches for Keyflow 1.5.10 with version-robust classDefForEach matching ([e49e977](https://github.com/Globberry/morphe-patches/commit/e49e97720f00c96e2e7c8c341e23767f55f347c8))

## [1.1.0](https://github.com/Globberry/morphe-patches/compare/v1.0.7...v1.1.0) (2026-11-09)

### ✨ New Features

* add version-robust [ALL] patches (fingerprint-based) ([4ba6946](https://github.com/Globberry/morphe-patches/commit/4ba69467414463d33330c28bf7cbb6ff3ffb5858))

## [1.0.7](https://github.com/Globberry/morphe-patches/compare/v1.0.6...v1.0.7) (2026-11-09)

### 🐛 Bug Fixes

* add uhgAYKl2b.xo0eU patch to bypass mx6nK.azrbON Pro state check (always false) ([3d91312](https://github.com/Globberry/morphe-patches/commit/3d913125e6cb5e7897dc5790c2c68390205ed4b4))

## [1.0.6](https://github.com/Globberry/morphe-patches/compare/v1.0.5...v1.0.6) (2026-11-09)

### 🐛 Bug Fixes

* add kjXTc billing client patches (znlhtRTp=true, KEsFip5xs neutered) to match mod ([d9da17a](https://github.com/Globberry/morphe-patches/commit/d9da17a4f6bf569062ee367634ebc926bf807d9e))

## [1.0.5](https://github.com/Globberry/keyflow-patches/compare/v1.0.4...v1.0.5) (2026-11-08)

### 🐛 Bug Fixes

* quote hex string literals in Signer patch const-string ([c13f35d](https://github.com/Globberry/keyflow-patches/commit/c13f35d306d2294ea3392630d411fb487b2ade7b))

## [1.0.4](https://github.com/Globberry/keyflow-patches/compare/v1.0.3...v1.0.4) (2026-11-08)

### 🐛 Bug Fixes

* invoke-direct for StringBuilder constructor in Signer patch ([6d3e333](https://github.com/Globberry/keyflow-patches/commit/6d3e3338b068971e9d268d75c44e40452fde4334))

## [1.0.3](https://github.com/Globberry/keyflow-patches/compare/v1.0.2...v1.0.3) (2026-11-08)

### 🐛 Bug Fixes

* remove VerifyError-causing azrbON injection; add pX6SrQYLl getter fake-receipt patch ([34aa6b1](https://github.com/Globberry/keyflow-patches/commit/34aa6b1aad85345364af44ef9f4ee802d5c627dd))

## [1.0.2](https://github.com/Globberry/keyflow-patches/compare/v1.0.1...v1.0.2) (2026-11-08)

### 🐛 Bug Fixes

* quote string literals in Signer patch const-string ([e350cf7](https://github.com/Globberry/keyflow-patches/commit/e350cf719fcffad1ee45289aa631209cf473fd36))

## [1.0.1](https://github.com/Globberry/keyflow-patches/compare/v1.0.0...v1.0.1) (2026-11-08)

### 🐛 Bug Fixes

* chunk base64 cert to avoid inline smali lexer errors in Signer patch ([b5a75e4](https://github.com/Globberry/keyflow-patches/commit/b5a75e4f6b1cc82ebd4f889029703e73f1771ec0))

## 1.0.0 (2026-11-08)

### ✨ New Features

* initial Keyflow patches (PairIP, signer identity, Pro unlock) ([e39c68a](https://github.com/Globberry/keyflow-patches/commit/e39c68a0359e1c8b7b909af4d52ddf053e214f09))
