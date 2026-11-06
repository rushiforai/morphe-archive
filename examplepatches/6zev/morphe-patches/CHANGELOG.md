## [1.6.0](https://github.com/6zev/morphe-patches/compare/v1.5.1...v1.6.0) (2026-11-03)

### ✨ New Features

* make the ADB server's own log readable ([33c92a1](https://github.com/6zev/morphe-patches/commit/33c92a16843741694388cfc9cf527470bb667bf0))

## [1.5.1](https://github.com/6zev/morphe-patches/compare/v1.5.0...v1.5.1) (2026-11-02)

### 🐛 Bug Fixes

* no-op the liba.so call that force-stops the app ([cfeb192](https://github.com/6zev/morphe-patches/commit/cfeb192d8ef6e27cab3d9963b852cde6c01f327e))

## [1.5.0](https://github.com/6zev/morphe-patches/compare/v1.4.2...v1.5.0) (2026-11-02)

### ✨ New Features

* drop self-stop commands in the ADB shell helper ([4f1a97b](https://github.com/6zev/morphe-patches/commit/4f1a97b3d3fe2e1b27348f692b0b1464a87f2a43))

## [1.4.2](https://github.com/6zev/morphe-patches/compare/v1.4.1...v1.4.2) (2026-11-02)

### 🐛 Bug Fixes

* the self-stop guard tested the branch the wrong way round ([107fea2](https://github.com/6zev/morphe-patches/commit/107fea26477184f3d809a630e30cd8cd990e32dd))

## [1.4.1](https://github.com/6zev/morphe-patches/compare/v1.4.0...v1.4.1) (2026-11-02)

### 🐛 Bug Fixes

* make the app's own stop command a no-op ([26056ba](https://github.com/6zev/morphe-patches/commit/26056bae4198a4e362314f56d8445001fa5b4d45))

## [1.4.0](https://github.com/6zev/morphe-patches/compare/v1.3.3...v1.4.0) (2026-11-02)

### ✨ New Features

* keep the app out of its own Stop recent apps list ([f483382](https://github.com/6zev/morphe-patches/commit/f483382fc68dd6bda2bee0ca1c23406a76087f1d))

## [1.3.3](https://github.com/6zev/morphe-patches/compare/v1.3.2...v1.3.3) (2026-11-02)

### 🐛 Bug Fixes

* disable the verification routine instead of disarming it ([d45a1d9](https://github.com/6zev/morphe-patches/commit/d45a1d903bde9d9f855ea50e9d3abb2133319b4e))

## [1.3.2](https://github.com/6zev/morphe-patches/compare/v1.3.1...v1.3.2) (2026-11-02)

### 🐛 Bug Fixes

* neutralise every trap, and the anti-tamper constructor on 32-bit ([4c9ce8c](https://github.com/6zev/morphe-patches/commit/4c9ce8c6d26da3aa52aedae3530cab4736df93e5))

## [1.3.1](https://github.com/6zev/morphe-patches/compare/v1.3.0...v1.3.1) (2026-11-02)

### 🐛 Bug Fixes

* read the build guard at the width of the instruction ([6f4483b](https://github.com/6zev/morphe-patches/commit/6f4483b3e9f48caa4d39e223b402fb1689f4b9cb))

## [1.3.0](https://github.com/6zev/morphe-patches/compare/v1.2.1...v1.3.0) (2026-11-02)

### ✨ New Features

* patch the 32-bit ARM engine library too ([f6941fd](https://github.com/6zev/morphe-patches/commit/f6941fdcadfbcdcef71bd60404aad67a70d0d70a))

## [1.2.1](https://github.com/6zev/morphe-patches/compare/v1.2.0...v1.2.1) (2026-11-02)

### 🐛 Bug Fixes

* nop the trap instructions instead of replacing the whole routine ([dd444b2](https://github.com/6zev/morphe-patches/commit/dd444b21b9c41bf7c4ce148c57de122f66b5d106)), closes [#0](https://github.com/6zev/morphe-patches/issues/0)

## [1.2.0](https://github.com/6zev/morphe-patches/compare/v1.1.0...v1.2.0) (2026-11-02)

### ✨ New Features

* patch the native engine library instead of dropping it ([3577807](https://github.com/6zev/morphe-patches/commit/35778076f22512249c76c0364432ac5b8ea643df)), closes [#0](https://github.com/6zev/morphe-patches/issues/0)

## [1.1.0](https://github.com/6zev/morphe-patches/compare/v1.0.2...v1.1.0) (2026-11-01)

### ✨ New Features

* merge the two patches into a single Unlock premium patch ([49a74ab](https://github.com/6zev/morphe-patches/commit/49a74ab4e55420b013ae874dd6b792f58ea61ee8))

## [1.0.2](https://github.com/6zev/morphe-patches/compare/v1.0.1...v1.0.2) (2026-11-01)

### 🐛 Bug Fixes

* stub the native engine methods so the app no longer dies with UnsatisfiedLinkError ([a87caf2](https://github.com/6zev/morphe-patches/commit/a87caf2e5d77b7ad6a898ab6d7a7ee31cccfa45c))

## [1.0.1](https://github.com/6zev/morphe-patches/compare/v1.0.0...v1.0.1) (2026-11-01)

### 🐛 Bug Fixes

* point metadata and links at the actual repository ([11c50a4](https://github.com/6zev/morphe-patches/commit/11c50a42c8f5e37aaaa1592b8a4124bc61ca3ef5))

## 1.0.0 (2026-11-01)

### ✨ New Features

* tvQuickActions Pro patches (unlock premium, skip native engine load) ([19dc4f3](https://github.com/6zev/morphe-patches/commit/19dc4f3bab618fbe18e22064022bb94471c11af9))

### 🐛 Bug Fixes

* app icon color must be 0xRRGGBB, not ARGB ([685e31c](https://github.com/6zev/morphe-patches/commit/685e31cc022df377ddc36c1f40c7131850240de6))
* use an Int app icon color literal ([e74b1d0](https://github.com/6zev/morphe-patches/commit/e74b1d0d3bfeaf60c443929bdfddff9df91929be))
