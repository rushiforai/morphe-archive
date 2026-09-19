## [1.8.0](https://github.com/RjBiermann/brave-waffle/compare/v1.7.1...v1.8.0) (2026-09-18)

### ✨ New Features

* keep real login dialog on TV via login tile ([f9db0c2](https://github.com/RjBiermann/brave-waffle/commit/f9db0c2df86103de973fd11eaab96892bdb60faa))

## [1.7.1](https://github.com/RjBiermann/brave-waffle/compare/v1.7.0...v1.7.1) (2026-09-18)

### 🐛 Bug Fixes

* invert m72.c error-dialog gate (default off must suppress, not show) ([3cbf62b](https://github.com/RjBiermann/brave-waffle/commit/3cbf62b7eab97aa0dfe008772f57315cbf2cfde9))

## [1.7.0](https://github.com/RjBiermann/brave-waffle/compare/v1.6.0...v1.7.0) (2026-09-18)

### ✨ New Features

* add settings-page toggles on phone and TV screens ([f6281a5](https://github.com/RjBiermann/brave-waffle/commit/f6281a55ac1076ada933834548ab646b0e20abcc))

## [1.6.0](https://github.com/RjBiermann/brave-waffle/compare/v1.5.1...v1.6.0) (2026-09-18)

### ✨ New Features

* remove ad-tracker tiles from site lists and search results ([f349fb3](https://github.com/RjBiermann/brave-waffle/commit/f349fb315731176c60bfad7e213f978e254928c0))

## [1.5.1](https://github.com/RjBiermann/brave-waffle/compare/v1.5.0...v1.5.1) (2026-09-18)

### 🐛 Bug Fixes

* TV-scope SiteInfoRequest forcing so phone search works ([2ad4398](https://github.com/RjBiermann/brave-waffle/commit/2ad4398c5b8e8f3fd081fb35ddc038107a699750))

## [1.5.0](https://github.com/RjBiermann/brave-waffle/compare/v1.4.1...v1.5.0) (2026-09-18)

### ✨ New Features

* suppress TV player 'Error occured' popup ([d90d217](https://github.com/RjBiermann/brave-waffle/commit/d90d21763e2ed2ac5adb25c5ca1c9f5c673fc342))

## [1.4.1](https://github.com/RjBiermann/brave-waffle/compare/v1.4.0...v1.4.1) (2026-09-18)

### 🐛 Bug Fixes

* drop the dev-branch backmerge plugin ([332fa59](https://github.com/RjBiermann/brave-waffle/commit/332fa5995154d292e60edabc4fd3bb2500fb58de))

## [1.4.0](https://github.com/RjBiermann/brave-waffle/compare/v1.3.0...v1.4.0) (2026-09-18)

### 🐛 Bug Fixes

* decode the dummy ad URL before replacing VMAP ad tags ([1d3a165](https://github.com/RjBiermann/brave-waffle/commit/1d3a1655e704ca81e5920ab959486302496ee3b7))

### ✨ New Features

* bypass TV PRO check on site browsing ([1790c46](https://github.com/RjBiermann/brave-waffle/commit/1790c462f8e1c378fdd93d2c882ecf69217b3c1f))

## [1.3.0](https://github.com/RjBiermann/brave-waffle/compare/v1.2.1...v1.3.0) (2026-09-18)

### ✨ New Features

* hide account/PRO nav drawer links (disabled by default) ([9a43f65](https://github.com/RjBiermann/brave-waffle/commit/9a43f65891eb19dfdbcea9d05cbd62777aa5b15a))

## [1.2.1](https://github.com/RjBiermann/brave-waffle/compare/v1.2.0...v1.2.1) (2026-09-17)

### 🐛 Bug Fixes

* route the TV account gate to the anonymous login instead of the dialog ([f5d1a9e](https://github.com/RjBiermann/brave-waffle/commit/f5d1a9ec6f10c0e25b7708732bdd340093ea999d))

## [1.2.0](https://github.com/RjBiermann/brave-waffle/compare/v1.1.0...v1.2.0) (2026-09-17)

### ✨ New Features

* use free sites on TV without a user account ([610d7a2](https://github.com/RjBiermann/brave-waffle/commit/610d7a2bf37743d68e122f22682ceb2441d554a1))

## [1.1.0](https://github.com/RjBiermann/brave-waffle/compare/v1.0.4...v1.1.0) (2026-09-17)

### 🐛 Bug Fixes

* compile issues in news promotion patch ([af97077](https://github.com/RjBiermann/brave-waffle/commit/af9707705c48bf7f56b20afb4b06863137deea6f))

### ✨ New Features

* Remove news promotions patch ([e4c5194](https://github.com/RjBiermann/brave-waffle/commit/e4c5194aaa8fdb1ba216c4539648d9ad7581d92e))

## [1.0.4](https://github.com/RjBiermann/brave-waffle/compare/v1.0.3...v1.0.4) (2026-09-17)

### 🐛 Bug Fixes

* read result register from move-result-object, not the invoke itself ([a1b7fad](https://github.com/RjBiermann/brave-waffle/commit/a1b7fad9b0d3da10f0101d1fc3d8dbcf4263e2ac))

## [1.0.3](https://github.com/RjBiermann/brave-waffle/compare/v1.0.2...v1.0.3) (2026-09-17)

### 🐛 Bug Fixes

* spoof signature at the inline digest site in x93.b (setSignatures is never called on this path) ([590c1cb](https://github.com/RjBiermann/brave-waffle/commit/590c1cb6d498ae8b969755268473e16e8dac2264))
* use fingerprint mutable method for instruction replacement ([2664582](https://github.com/RjBiermann/brave-waffle/commit/26645826e9bb65a961f123601d2ed79f32d0d624))

## [1.0.2](https://github.com/RjBiermann/brave-waffle/compare/v1.0.1...v1.0.2) (2026-09-17)

### 🐛 Bug Fixes

* keep PRO unlock client-side, report pro=0 in request hash ([29d68ee](https://github.com/RjBiermann/brave-waffle/commit/29d68ee6d179da45e69e39bd020b2acc572e513e))

## [1.0.1](https://github.com/RjBiermann/brave-waffle/compare/v1.0.0...v1.0.1) (2026-09-17)

### 🐛 Bug Fixes

* spoof signing certificate hash reported to the API ([9ecce5f](https://github.com/RjBiermann/brave-waffle/commit/9ecce5f875c3ab12becd7ebec87a064058668818))

## 1.0.0 (2026-09-17)

### ✨ New Features

* initial patches (Unlock PRO, Remove ads) ([a5f77b6](https://github.com/RjBiermann/brave-waffle/commit/a5f77b6065c18cd3ade00f253134a973277c5875))

## [1.1.0](https://github.com/RjBiermann/aio-streamer-morphe-patches/compare/v1.0.0...v1.1.0) (2026-09-17)

### ✨ New Features

* remove ads in all three ad tag variants (vmap, vmapc, vmap_swipe) ([f1bee21](https://github.com/RjBiermann/aio-streamer-morphe-patches/commit/f1bee2128e5079c285e2a85ccbb45aa8bdaafdac))

## 1.0.0 (2026-09-17)

### 🐛 Bug Fixes

* appIconColor must be 0xRRGGBB (no alpha) ([264549e](https://github.com/RjBiermann/aio-streamer-morphe-patches/commit/264549ee8bff588608d4805d97a4cc8b380ba21f))
* match official patches-library API (Int icon color, app.morphe.util dep) ([de643b5](https://github.com/RjBiermann/aio-streamer-morphe-patches/commit/de643b51d1cfebf8047b5244241e96483d57408e))

### ✨ New Features

* initial patches for AIO Streamer ([44101fb](https://github.com/RjBiermann/aio-streamer-morphe-patches/commit/44101fbc6edc252d77d75b13c67f4a2e7c89bc76))
