## [1.3.0](https://github.com/alalloush/xperia-1v-camera-patches/compare/v1.2.0...v1.3.0) (2026-09-07)

### ✨ New Features

* Streaming presets patch (1080p60/120, 4K30/60, bitrate and GOP options); shorter connect-mode labels ([dead495](https://github.com/alalloush/xperia-1v-camera-patches/commit/dead495533f5d49b168e2bf175b4d4b3ba1d8305))

## [1.2.0](https://github.com/alalloush/xperia-1v-camera-patches/compare/v1.1.4...v1.2.0) (2026-09-07)

### 🐛 Bug Fixes

* Build connect-mode constants without growing register counts ([3be446d](https://github.com/alalloush/xperia-1v-camera-patches/commit/3be446dcbd17dc273d7ce1731cf4b18bb2f630d1))

### ✨ New Features

* Add PC via USB / PC via Wi-Fi connect modes for the raw stream; drop latency diagnostics ([a6c821e](https://github.com/alalloush/xperia-1v-camera-patches/commit/a6c821ef199b09bcf10d148de236e0241f60c4a5))

## [1.1.4](https://github.com/alalloush/xperia-1v-camera-patches/compare/v1.1.3...v1.1.4) (2026-09-07)

### 🐛 Bug Fixes

* Log raw encoder output timestamps for latency diagnosis ([746c673](https://github.com/alalloush/xperia-1v-camera-patches/commit/746c673164ab5220cf462d9587648716a3d7edfc))

## [1.1.3](https://github.com/alalloush/xperia-1v-camera-patches/compare/v1.1.2...v1.1.3) (2026-09-07)

### 🐛 Bug Fixes

* Trim Sony's encoded-frame backlog in raw mode (constant 1.6 s latency) ([5d37940](https://github.com/alalloush/xperia-1v-camera-patches/commit/5d37940e2fce8c7a9be3162d1c6e25f6f0ccdd20))

## [1.1.2](https://github.com/alalloush/xperia-1v-camera-patches/compare/v1.1.1...v1.1.2) (2026-09-07)

### 🐛 Bug Fixes

* Release frame-age logging build for latency diagnosis ([c94cbb0](https://github.com/alalloush/xperia-1v-camera-patches/commit/c94cbb0b258ad0f345b63975b3804549cf0554f1))

## [1.1.1](https://github.com/alalloush/xperia-1v-camera-patches/compare/v1.1.0...v1.1.1) (2026-09-07)

### 🐛 Bug Fixes

* Select the raw H.264 transport by stream key "raw" (Sony validates the URL scheme) ([b99f1eb](https://github.com/alalloush/xperia-1v-camera-patches/commit/b99f1eb9cd7634dfdca3b4f865739e773e22a3a9))

## [1.1.0](https://github.com/alalloush/xperia-1v-camera-patches/compare/v1.0.0...v1.1.0) (2026-09-07)

### ✨ New Features

* Add Raw H.264 stream patch (tcp:// URL in Live streaming sends Annex-B H.264 directly, wired or wireless) ([3760a56](https://github.com/alalloush/xperia-1v-camera-patches/commit/3760a56fde08d4b40c9805c7c537ac5b8bee9f04))

## 1.0.0 (2026-09-05)

### ✨ New Features

* Xperia 1 V camera patches ([824a9e3](https://github.com/alalloush/xperia-1v-camera-patches/commit/824a9e3acb02d345415be120a3fd65b04424f2d8))
