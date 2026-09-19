## [1.6.0](https://github.com/Amitaisela/travian-morphe-patches/compare/v1.5.2...v1.6.0) (2026-09-18)

### ✨ New Features

* **Travian: Legends:** remind a minute before an attack lands, report friendly arrivals ([3e09958](https://github.com/Amitaisela/travian-morphe-patches/commit/3e0995824538d1ed13dd3a29dc68af72ee1bfde5))

## [1.5.2](https://github.com/Amitaisela/travian-morphe-patches/compare/v1.5.1...v1.5.2) (2026-09-18)

### 🐛 Bug Fixes

* **Travian: Legends:** run checks one at a time and log trained unit ids ([c8e16b2](https://github.com/Amitaisela/travian-morphe-patches/commit/c8e16b25db9df0ac17f4db78fc05be0c96880af0))

## [1.5.1](https://github.com/Amitaisela/travian-morphe-patches/compare/v1.5.0...v1.5.1) (2026-09-18)

### 🐛 Bug Fixes

* **Travian: Legends:** send one notification per troop training, not two ([0193b0d](https://github.com/Amitaisela/travian-morphe-patches/commit/0193b0d08d373230127a09db63af610612fe7f45))

## [1.5.0](https://github.com/Amitaisela/travian-morphe-patches/compare/v1.4.1...v1.5.0) (2026-09-18)

### ✨ New Features

* **Travian: Legends:** alert on incoming attacks and raids ([141372d](https://github.com/Amitaisela/travian-morphe-patches/commit/141372d529068bcd2968cb69814eaebc77d88835))

## [1.4.1](https://github.com/Amitaisela/travian-morphe-patches/compare/v1.4.0...v1.4.1) (2026-09-18)

### 🐛 Bug Fixes

* keep checking while the game isn't logged in yet ([0c3f19c](https://github.com/Amitaisela/travian-morphe-patches/commit/0c3f19cc908ece168835aa5d88f8202a11055263))

## [1.4.0](https://github.com/Amitaisela/travian-morphe-patches/compare/v1.3.0...v1.4.0) (2026-09-18)

### ✨ New Features

* check every 5 minutes using a cached world token ([b54dbd9](https://github.com/Amitaisela/travian-morphe-patches/commit/b54dbd984e9366d4cac9c472a5af5e3d018b3510))

## [1.3.0](https://github.com/Amitaisela/travian-morphe-patches/compare/v1.2.0...v1.3.0) (2026-09-18)

### ✨ New Features

* notify from the game's own session with no login, no persistent notification ([fbf0561](https://github.com/Amitaisela/travian-morphe-patches/commit/fbf056119b6de41d36a6c2db9f3c106767915a6a))

## [1.2.0](https://github.com/Amitaisela/travian-morphe-patches/compare/v1.1.1...v1.2.0) (2026-09-17)

### ⚠ BREAKING CHANGES

* the "Travian account email"/"Travian account password"
patch options are removed. Existing patched installs need to be re-patched
and will be asked to log in once in-app.

### ✨ New Features

* store no credentials on disk, add building/troop detail to notifications ([512af7f](https://github.com/Amitaisela/travian-morphe-patches/commit/512af7fadd8e1168fc5278350e782970545d9f68))

## [1.1.1](https://github.com/Amitaisela/travian-morphe-patches/compare/v1.1.0...v1.1.1) (2026-09-16)

### 🐛 Bug Fixes

* set real patch metadata (name, author, source) ([8e1e756](https://github.com/Amitaisela/travian-morphe-patches/commit/8e1e756051d99585a398b830c2fe45beec253b26))

## [1.1.0](https://github.com/Amitaisela/travian-morphe-patches/compare/v1.0.1...v1.1.0) (2026-09-16)

### ✨ New Features

* declare support for Travian: Legends v4.0.1 ([d291201](https://github.com/Amitaisela/travian-morphe-patches/commit/d291201a609b4947de1a82c8c600a39767978c35))

## [1.0.1](https://github.com/Amitaisela/travian-morphe-patches/compare/v1.0.0...v1.0.1) (2026-09-16)

### 🐛 Bug Fixes

* simplify release config to single main branch (no dev branch exists) ([9097347](https://github.com/Amitaisela/travian-morphe-patches/commit/9097347ec02c92cd6bfa95030eb8920224673140))

## 1.0.0 (2026-09-15)

### 🐛 Bug Fixes

* restore executable bit on gradlew (lost when committing from Windows, broke CI) ([55daf87](https://github.com/Amitaisela/travian-morphe-patches/commit/55daf87c2b7cd73c0aa6e62818cae754ab6b16e4))

### ✨ New Features

* add Travian Legends build/troop queue notifier patch ([398923e](https://github.com/Amitaisela/travian-morphe-patches/commit/398923edb0a44b6dd3054f19b38167f618253fe3))
