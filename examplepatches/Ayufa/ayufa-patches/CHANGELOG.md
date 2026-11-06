## [1.1.0](https://github.com/Ayufa/youtube-custom-patches/compare/v1.0.0...v1.1.0) (2026-11-04)

### ✨ New Features

* Restore the Live latency keeper with a Morphe settings toggle ([812189e](https://github.com/Ayufa/youtube-custom-patches/commit/812189eb8b6d38b0a6e0fb51386ea63340aee267))
* Support the Live latency keeper on YouTube 21.30.216 as well ([9b1f35b](https://github.com/Ayufa/youtube-custom-patches/commit/9b1f35b04aa0f69a69e28398d43206d1b98e0c10))

### 🐛 Bug Fixes

* Add temporary diagnostic logging to find why the keeper does not seek ([69edf67](https://github.com/Ayufa/youtube-custom-patches/commit/69edf677a4b07ef1b2479b8ea2daf5dc01b3b379))
* Estimate live lag from wall-clock time instead of the video length ([bfbca52](https://github.com/Ayufa/youtube-custom-patches/commit/bfbca522833b417f166a0db98ec162870165e6f6))

## [1.1.0-dev.4](https://github.com/Ayufa/youtube-custom-patches/compare/v1.1.0-dev.3...v1.1.0-dev.4) (2026-11-03)

### 🐛 Bug Fixes

* Estimate live lag from wall-clock time instead of the video length ([bfbca52](https://github.com/Ayufa/youtube-custom-patches/commit/bfbca522833b417f166a0db98ec162870165e6f6))

## [1.1.0-dev.3](https://github.com/Ayufa/youtube-custom-patches/compare/v1.1.0-dev.2...v1.1.0-dev.3) (2026-11-03)

### 🐛 Bug Fixes

* Add temporary diagnostic logging to find why the keeper does not seek ([69edf67](https://github.com/Ayufa/youtube-custom-patches/commit/69edf677a4b07ef1b2479b8ea2daf5dc01b3b379))

## [1.1.0-dev.2](https://github.com/Ayufa/youtube-custom-patches/compare/v1.1.0-dev.1...v1.1.0-dev.2) (2026-11-03)

### ✨ New Features

* Support the Live latency keeper on YouTube 21.30.216 as well ([9b1f35b](https://github.com/Ayufa/youtube-custom-patches/commit/9b1f35b04aa0f69a69e28398d43206d1b98e0c10))

## [1.1.0-dev.1](https://github.com/Ayufa/youtube-custom-patches/compare/v1.0.0...v1.1.0-dev.1) (2026-11-03)

### ✨ New Features

* Restore the Live latency keeper with a Morphe settings toggle ([812189e](https://github.com/Ayufa/youtube-custom-patches/commit/812189eb8b6d38b0a6e0fb51386ea63340aee267))

## 1.0.0 (2026-11-03)

### ⚠ BREAKING CHANGES

* The Live latency keeper patch has been removed.

### ✨ New Features

* Add Live latency keeper and Hide live chat clutter patches ([5eff2a9](https://github.com/Ayufa/youtube-custom-patches/commit/5eff2a9dcec7bb62a6bafb4763ddaf268bc4560b))
* Fix live chat disappearing and add Morphe settings toggles ([4d7f108](https://github.com/Ayufa/youtube-custom-patches/commit/4d7f10853372e0188bbb397cdda93d3479892dfc))
* Move the clutter switches to a dedicated Ayufa settings screen ([7735511](https://github.com/Ayufa/youtube-custom-patches/commit/7735511327f199c07e35e30c9496fd47d01c9af4))
* Remove the Live latency keeper patch ([53eecf4](https://github.com/Ayufa/youtube-custom-patches/commit/53eecf4e49c1640e4c16ea8ae4fb974e00ebf5a4))

### 🐛 Bug Fixes

* Always use invoke-static/range for presenter constructor hooks ([a0d779c](https://github.com/Ayufa/youtube-custom-patches/commit/a0d779ced7951c68a5575d204d5992bf2a3f62ec))
* Correct matchAll context usage and clinit literal helper calls ([2228777](https://github.com/Ayufa/youtube-custom-patches/commit/22287772cf18e167f68311982b2bdbb52de04fbe))
* Hook live chat presenters instead of layout inflation ([cbc5ede](https://github.com/Ayufa/youtube-custom-patches/commit/cbc5ede5389173db20275bbfbc2099c7d97f06cd))
* Mutate the extension fields' encoded initial values in place ([16a2d75](https://github.com/Ayufa/youtube-custom-patches/commit/16a2d759ae07e94e7673bb47a65dfe7507fde9e6))
* Register patch options in the patch builders ([8e55e15](https://github.com/Ayufa/youtube-custom-patches/commit/8e55e15ec9eb12240301f9488f287a826ee3c4a9))
* Remove temporary hook diagnostics ([9a25688](https://github.com/Ayufa/youtube-custom-patches/commit/9a256880a0b8e2692776c732e91309e3be45a744))
* Use invoke-static/range for high registers; add temporary hook diagnostics ([f9675bd](https://github.com/Ayufa/youtube-custom-patches/commit/f9675bd096306fd71c42aa12e0664712776c82e0))
* Write patch options into extension field initial values ([c3eee99](https://github.com/Ayufa/youtube-custom-patches/commit/c3eee992de76c692c80824aa3fd86d77e616319a))

## [1.0.0-dev.10](https://github.com/Ayufa/youtube-custom-patches/compare/v1.0.0-dev.9...v1.0.0-dev.10) (2026-11-03)

### ✨ New Features

* Move the clutter switches to a dedicated Ayufa settings screen ([7735511](https://github.com/Ayufa/youtube-custom-patches/commit/7735511327f199c07e35e30c9496fd47d01c9af4))

## [1.0.0-dev.9](https://github.com/Ayufa/youtube-custom-patches/compare/v1.0.0-dev.8...v1.0.0-dev.9) (2026-11-03)

### ✨ New Features

* Fix live chat disappearing and add Morphe settings toggles ([4d7f108](https://github.com/Ayufa/youtube-custom-patches/commit/4d7f10853372e0188bbb397cdda93d3479892dfc))

## [1.0.0-dev.8](https://github.com/Ayufa/youtube-custom-patches/compare/v1.0.0-dev.7...v1.0.0-dev.8) (2026-11-03)

### ⚠ BREAKING CHANGES

* The Live latency keeper patch has been removed.

### ✨ New Features

* Remove the Live latency keeper patch ([53eecf4](https://github.com/Ayufa/youtube-custom-patches/commit/53eecf4e49c1640e4c16ea8ae4fb974e00ebf5a4))

## [1.0.0-dev.7](https://github.com/Ayufa/youtube-custom-patches/compare/v1.0.0-dev.6...v1.0.0-dev.7) (2026-11-03)

### 🐛 Bug Fixes

* Register patch options in the patch builders ([8e55e15](https://github.com/Ayufa/youtube-custom-patches/commit/8e55e15ec9eb12240301f9488f287a826ee3c4a9))

## [1.0.0-dev.6](https://github.com/Ayufa/youtube-custom-patches/compare/v1.0.0-dev.5...v1.0.0-dev.6) (2026-11-03)

### 🐛 Bug Fixes

* Mutate the extension fields' encoded initial values in place ([16a2d75](https://github.com/Ayufa/youtube-custom-patches/commit/16a2d759ae07e94e7673bb47a65dfe7507fde9e6))
* Write patch options into extension field initial values ([c3eee99](https://github.com/Ayufa/youtube-custom-patches/commit/c3eee992de76c692c80824aa3fd86d77e616319a))

## [1.0.0-dev.5](https://github.com/Ayufa/youtube-custom-patches/compare/v1.0.0-dev.4...v1.0.0-dev.5) (2026-11-03)

### 🐛 Bug Fixes

* Remove temporary hook diagnostics ([9a25688](https://github.com/Ayufa/youtube-custom-patches/commit/9a256880a0b8e2692776c732e91309e3be45a744))

## [1.0.0-dev.4](https://github.com/Ayufa/youtube-custom-patches/compare/v1.0.0-dev.3...v1.0.0-dev.4) (2026-11-03)

### 🐛 Bug Fixes

* Always use invoke-static/range for presenter constructor hooks ([a0d779c](https://github.com/Ayufa/youtube-custom-patches/commit/a0d779ced7951c68a5575d204d5992bf2a3f62ec))

## [1.0.0-dev.3](https://github.com/Ayufa/youtube-custom-patches/compare/v1.0.0-dev.2...v1.0.0-dev.3) (2026-11-03)

### 🐛 Bug Fixes

* Use invoke-static/range for high registers; add temporary hook diagnostics ([f9675bd](https://github.com/Ayufa/youtube-custom-patches/commit/f9675bd096306fd71c42aa12e0664712776c82e0))

## [1.0.0-dev.3](https://github.com/Ayufa/youtube-custom-patches/compare/v1.0.0-dev.2...v1.0.0-dev.3) (2026-11-03)

### 🐛 Bug Fixes

* Use invoke-static/range for high registers; add temporary hook diagnostics ([f9675bd](https://github.com/Ayufa/youtube-custom-patches/commit/f9675bd096306fd71c42aa12e0664712776c82e0))

## [1.0.0-dev.3](https://github.com/Ayufa/youtube-custom-patches/compare/v1.0.0-dev.2...v1.0.0-dev.3) (2026-11-03)

### 🐛 Bug Fixes

* Use invoke-static/range for high registers; add temporary hook diagnostics ([f9675bd](https://github.com/Ayufa/youtube-custom-patches/commit/f9675bd096306fd71c42aa12e0664712776c82e0))

## [1.0.0-dev.2](https://github.com/Ayufa/youtube-custom-patches/compare/v1.0.0-dev.1...v1.0.0-dev.2) (2026-11-03)

### 🐛 Bug Fixes

* Hook live chat presenters instead of layout inflation ([cbc5ede](https://github.com/Ayufa/youtube-custom-patches/commit/cbc5ede5389173db20275bbfbc2099c7d97f06cd))

## 1.0.0-dev.1 (2026-11-03)

### ✨ New Features

* Add Live latency keeper and Hide live chat clutter patches ([5eff2a9](https://github.com/Ayufa/youtube-custom-patches/commit/5eff2a9dcec7bb62a6bafb4763ddaf268bc4560b))

### 🐛 Bug Fixes

* Correct matchAll context usage and clinit literal helper calls ([2228777](https://github.com/Ayufa/youtube-custom-patches/commit/22287772cf18e167f68311982b2bdbb52de04fbe))
