## [1.6.1](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.6.0...v1.6.1) (2026-11-10)

### 🐛 Bug Fixes

* **tv:** eliminate live stream buffering and clamp network bandwidth on Android TV ([be1363c](https://github.com/AzizPatel786/kayo-morphe-patches/commit/be1363c2981743f139b0cfbcbd1a642207cd03a7))

## [1.6.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.5.0...v1.6.0) (2026-11-10)

### 🐛 Bug Fixes

* **release:** trigger clean semantic-release for v1.6.0 ([a7bc509](https://github.com/AzizPatel786/kayo-morphe-patches/commit/a7bc50943454b4a536b10994947660d692781553))

### ✨ New Features

* **tv:** tailor Kayo Android TV patch for v4.8.1 (4000172) while preserving v4.6.1 compatibility ([ac87c33](https://github.com/AzizPatel786/kayo-morphe-patches/commit/ac87c335c2b9bdb80363cd17aab59d1a414af062))

## [1.5.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.4.3...v1.5.0) (2026-11-10)

### ✨ New Features

* **kayo:** split into specialized Mobile and Android TV patches and fix TV Pairip startup lockout ([85407d3](https://github.com/AzizPatel786/kayo-morphe-patches/commit/85407d38712ff3ac7e71d959b0cb5cc0ee22b5d7))

## [1.4.3](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.4.2...v1.4.3) (2026-11-08)

### 🔧 Improvements

* **kayo:** unlock full ExoPlayer/Media3 QoE on Mobile & TV and eliminate reflection overhead ([0eaddd8](https://github.com/AzizPatel786/kayo-morphe-patches/commit/0eaddd84787b1e3e7fec72c6847450e678bac052))

## [1.4.2](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.4.1...v1.4.2) (2026-11-07)

### 🐛 Bug Fixes

* **kayo:** guarantee multi-switch audio commentary and 1080p50+ playback with TDD suite ([5d80dfc](https://github.com/AzizPatel786/kayo-morphe-patches/commit/5d80dfcd566eee16726bdad7c66d02cb884f790b))

## [1.4.1](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.4.0...v1.4.1) (2026-11-06)

### 🐛 Bug Fixes

* **kayo:** allow repeated audio track switching and enforce 1080p playback on mobile ([74359b4](https://github.com/AzizPatel786/kayo-morphe-patches/commit/74359b43852615e04161e05918d52b9dc1c58799))

## [1.4.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.3.0...v1.4.0) (2026-11-06)

### ✨ New Features

* **kayo:** add decoder dropped frame counter, active network transport detection, and TV Back-to-dismiss HUD ([044c0ef](https://github.com/AzizPatel786/kayo-morphe-patches/commit/044c0ef61a039f191eb254fd93b52987696a9df1))

## [1.3.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.2.1...v1.3.0) (2026-11-06)

### ✨ New Features

* **kayo:** add 50fps badge display, long-press HUD toggle, and commentary audio track switcher ([83264a5](https://github.com/AzizPatel786/kayo-morphe-patches/commit/83264a59546c5150efa71df1e584bd5a79e0556d))

## [1.2.1](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.2.0...v1.2.1) (2026-11-06)

### 🐛 Bug Fixes

* **kayo:** revert low-level ExoPlayer2 constructor bytecode hooks to resolve launch crash ([90a3bd3](https://github.com/AzizPatel786/kayo-morphe-patches/commit/90a3bd3755f6a3afd0767356c53d3864b3d1bff9))

## [1.2.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.11...v1.2.0) (2026-11-06)

### ✨ New Features

* **kayo:** unify mobile player with TV engine - 80Mbps bandwidth meter, 60s/120s buffer, speed lock, and PiP button ([08b6e7e](https://github.com/AzizPatel786/kayo-morphe-patches/commit/08b6e7eae7bf6b6f17ebf9469d6244b3b84c5e83))

## [1.1.11](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.10...v1.1.11) (2026-11-06)

### 🐛 Bug Fixes

* **kayo:** remove mobile client-side bitrate/viewport caps and default Auto to highest rendition ([6d7632f](https://github.com/AzizPatel786/kayo-morphe-patches/commit/6d7632f6231e71de4ee1b49f82c0c53585f56caa))

## [1.1.10](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.9...v1.1.10) (2026-10-30)

### 🐛 Bug Fixes

* **kayo:** eliminate Android TV buffering on locked qualities via LoadControl, LivePlaybackSpeedControl, and live offset tuning ([0326dec](https://github.com/AzizPatel786/kayo-morphe-patches/commit/0326deccccf2f4a039976462d56743e0fd069581))

## [1.1.9](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.8...v1.1.9) (2026-10-30)

### 🐛 Bug Fixes

* **kayo:** lock ExoTrackSelection.Definition constructor and AdaptiveTrackSelection on Android TV ([21b6e97](https://github.com/AzizPatel786/kayo-morphe-patches/commit/21b6e9707e123fa8e2b2b0d080892d77790cd4a9))

## [1.1.8](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.7...v1.1.8) (2026-10-30)

### 🐛 Bug Fixes

* **kayo:** fix Dalvik register overflow in selectTracksForType, hardware codec names for 4K, and initial button label ([d13e976](https://github.com/AzizPatel786/kayo-morphe-patches/commit/d13e9763bdf7bcb7f865cbea7c8003d669fcccf5))

## [1.1.7](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.6...v1.1.7) (2026-10-30)

### 🐛 Bug Fixes

* **kayo:** enable true 4K UHD manifest detection and eliminate buffering loop on Android TV ([4084903](https://github.com/AzizPatel786/kayo-morphe-patches/commit/408490363be8c94d7373d58c9e5db9ad1b999357))

## [1.1.6](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.5...v1.1.6) (2026-10-28)

### 🐛 Bug Fixes

* **tv:** default stream selection to maximum available quality ([ab603cc](https://github.com/AzizPatel786/kayo-morphe-patches/commit/ab603cc15532013aa5ebf8aa09bcf91b318c9ed4))

## [1.1.5](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.4...v1.1.5) (2026-10-28)

### 🐛 Bug Fixes

* **tv:** eliminate stream buffering and enforce fixed quality selection ([6f85807](https://github.com/AzizPatel786/kayo-morphe-patches/commit/6f85807cd88b355a2f01b4e666f94fe5d185c1fb))

## [1.1.4](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.3...v1.1.4) (2026-10-28)

### 🐛 Bug Fixes

* **tv:** lock rendition in AdaptiveTrackSelection and selectTracksForType to prevent ABR downgrades ([45743c6](https://github.com/AzizPatel786/kayo-morphe-patches/commit/45743c6927c0720e5df3604a35926e18c47cb0ea))

## [1.1.3](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.2...v1.1.3) (2026-10-27)

### 🐛 Bug Fixes

* **tv:** fix d-pad up button focus and double tap diagnostics ([e227a10](https://github.com/AzizPatel786/kayo-morphe-patches/commit/e227a1045791c270b31483d69b7cf95e55c07034))

## [1.1.2](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.1...v1.1.2) (2026-10-27)

### 🐛 Bug Fixes

* **tv:** restore tv quality button visibility and direct remote menu access ([8e9db18](https://github.com/AzizPatel786/kayo-morphe-patches/commit/8e9db1898309889cf4dd18f9140a634e13988ee6))

## [1.1.1](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.1.0...v1.1.1) (2026-10-27)

### 🐛 Bug Fixes

* **tv:** fix stream closed d-pad popup and resolve video buffering ([1f44561](https://github.com/AzizPatel786/kayo-morphe-patches/commit/1f4456120e1559f0c8340d07029322388dcb361f))

## [1.1.0](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.6...v1.1.0) (2026-10-26)

### ✨ New Features

* **tv:** add in-player video quality button and d-pad navigation for android tv ([11090ff](https://github.com/AzizPatel786/kayo-morphe-patches/commit/11090ff938d9cb993370103a98890c5254f89e5a))

## [1.0.6](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.5...v1.0.6) (2026-10-24)

### 🐛 Bug Fixes

* **tv:** lock rendition in selectTracksForType, bypass buffer hysteresis, and fix manifest track diagnostics ([90ba75c](https://github.com/AzizPatel786/kayo-morphe-patches/commit/90ba75c7bf1b99f0d23c419700fb5ba16c71cd5a))

## [1.0.5](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.4...v1.0.5) (2026-10-24)

### 🐛 Bug Fixes

* **tv:** unlock 4k uhd, force widevine l1, bypass l3 downgrade, and fix manifest track extraction ([82a76b7](https://github.com/AzizPatel786/kayo-morphe-patches/commit/82a76b7c56ca9918f9d573d2f9197b5cee065ef6))

## [1.0.4](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.3...v1.0.4) (2026-10-24)

### 🐛 Bug Fixes

* **tv:** add audio metrics, live bandwidth tracking, and fix player view hook ([9257098](https://github.com/AzizPatel786/kayo-morphe-patches/commit/92570986abc1fe508b13b4ce135c34221504e601))

## [1.0.3](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.2...v1.0.3) (2026-10-24)

### 🐛 Bug Fixes

* **tv:** lock 4k uhd track selection on media3 and spoof physical display size ([bf29996](https://github.com/AzizPatel786/kayo-morphe-patches/commit/bf29996c4061c864a48c3f1551563fafa832e5f0))

## [1.0.2](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.1...v1.0.2) (2026-10-23)

### 🐛 Bug Fixes

* **patch:** make all fingerprints fully optional and prevent classFingerprint crash on Android TV ([c6f8c42](https://github.com/AzizPatel786/kayo-morphe-patches/commit/c6f8c42bbcdb72d1cc939b2244c2ee4349eb1232))

## [1.0.1](https://github.com/AzizPatel786/kayo-morphe-patches/compare/v1.0.0...v1.0.1) (2026-10-23)

### 🐛 Bug Fixes

* **ci:** remove unneeded backmerge plugin for single branch setup ([886119a](https://github.com/AzizPatel786/kayo-morphe-patches/commit/886119a51cf959fff237669054a9cb378951d8d5))

## 1.0.0 (2026-10-23)

### 🐛 Bug Fixes

* **ci:** fix release workflow, releaserc json syntax, and gradle credentials ([6e92001](https://github.com/AzizPatel786/kayo-morphe-patches/commit/6e920010a7d65ae9415240cf8afd306b176e3a0f))
* **tv:** add Kayo Android TV 4.6.1 support and make mobile fingerprints optional ([cd4329c](https://github.com/AzizPatel786/kayo-morphe-patches/commit/cd4329ca908ab382e821902f8ae941d8c26aa7ab))

### ✨ New Features

* **kayo:** add In-player quality menu patch for Kayo Sports ([6f9adcf](https://github.com/AzizPatel786/kayo-morphe-patches/commit/6f9adcf093f1f87d5fb91f1162f9058a4cb0085d))
* **kayo:** add live stream diagnostics button and HUD overlay for 4K/1080p metrics ([c688a4f](https://github.com/AzizPatel786/kayo-morphe-patches/commit/c688a4f84e1a782aa4e7bb8764fc35573470feea))
* **kayo:** unlock 4K UHD and 1080p50 playback and remove resolution caps ([794217f](https://github.com/AzizPatel786/kayo-morphe-patches/commit/794217fcf3789d339b752152cf23eedd146d448b))
