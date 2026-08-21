## [2.1.1](https://github.com/anxyis/anxy-patches/compare/v2.1.0...v2.1.1) (2026-08-20)


### Bug Fixes

* **destruction:** 2.0.0 - fix Dalvik instruction formats (Format11x for return/return-object) and expand target versions ([8f9e190](https://github.com/anxyis/anxy-patches/commit/8f9e190516234f7b5caedc437abb0eddad41b009))

# [2.1.0](https://github.com/anxyis/anxy-patches/compare/v2.0.0...v2.1.0) (2026-08-20)


### Bug Fixes

* **build:** cleanly compile and package v2.0.0 with immutable method replacement ([5539342](https://github.com/anxyis/anxy-patches/commit/553934207f3e173e51c282c2991133ec69c5b34f))


### Features

* **release:** 2.0.0 - Complete Static Root Destruction of ModdedBySatriyaid & TGSatriyaidChannel ([19228b4](https://github.com/anxyis/anxy-patches/commit/19228b4905a876ab503023fe1de3f064ea924d75))

## [1.5.1](https://github.com/anxyis/anxy-patches/compare/v1.5.0...v1.5.1) (2026-08-20)


### Bug Fixes

* **destruction:** 1.4.1 - use ImmutableMethod replacement to prevent UnsupportedOperationException ([f1f4094](https://github.com/anxyis/anxy-patches/commit/f1f40944fad112d6b5100d2c3781aa9248dc71f0))

# [1.5.0](https://github.com/anxyis/anxy-patches/compare/v1.4.0...v1.5.0) (2026-08-20)


### Features

* **destruction:** 1.4.0 - Permanent Root Destruction of ModdedBySatriyaid & TGSatriyaidChannel ([6b5e50f](https://github.com/anxyis/anxy-patches/commit/6b5e50fd459d69d3b073d3871b0ac2cf409da50a))

# [1.2.0](https://github.com/anxyis/anxy-patches/compare/v1.1.0...v1.2.0) (2026-08-20)


### Features

* **daemon:** integrate PopupDismisser background runtime daemon to suppress all dynamic dialogs ([fbe3edb](https://github.com/anxyis/anxy-patches/commit/fbe3edbc27d5e6a4801671ed9f3d76649831be67))

# [1.1.0](https://github.com/anxyis/anxy-patches/compare/v1.0.1...v1.1.0) (2026-08-20)


### Features

* **alightmotion:** add dedicated AM Pro 5.0.273.1028420 suite and graceful native guards ([ccd7637](https://github.com/anxyis/anxy-patches/commit/ccd7637941c8187879246e2f30265548636704a8))

## [1.0.1](https://github.com/anxyis/anxy-patches/compare/v1.0.0...v1.0.1) (2026-08-20)


### Bug Fixes

* **build:** embed classes.dex and Morphe manifest attributes into MPP bundle ([17c8e66](https://github.com/anxyis/anxy-patches/commit/17c8e6621853ba5f93056b5afec688f2464beb63))

# 1.0.0 (2026-08-20)


### Bug Fixes

* **build:** add GitHubPackages Morphe registry repository ([b1e32c7](https://github.com/anxyis/anxy-patches/commit/b1e32c7c629556e48c3221d50fa38fa868bcfdcf))
* **ci:** add package-lock.json and configure Node 22 for semantic-release ([df0eb54](https://github.com/anxyis/anxy-patches/commit/df0eb54cc8bc4092f7dca373a694bd4d8c8bb57d))
* **ci:** make gradlew executable on Linux runners ([8f4c421](https://github.com/anxyis/anxy-patches/commit/8f4c421b65b968b92df6296c3e1dc2f410b0dbe4))


### Features

* Initial release of anxy-patches for Morphe Manager ([9d6a198](https://github.com/anxyis/anxy-patches/commit/9d6a198c4e429f37d3df68bbad298c5317201420))

# Changelog

All notable changes to this project will be documented in this file.

## 1.0.0 (2026-08-20)

### Features
- Initial release of `anxy-patches` for Morphe Manager.
- Comprehensive popup suppression patch suite for **After Motion Z+ / Alight Motion** (`5.0.273`).
- Injected `NoPopupSeedProvider` and `PopupDismisser` runtime background daemon extension.
- Native AArch64 binary NOP patch for `libsatriyaid.so`.
- Smali bytecode suppression for `fq.ab`, `zzzb.vbd`, `zzzb.vwp`, `zzzb.uio`, and `zzw.xyz`.
