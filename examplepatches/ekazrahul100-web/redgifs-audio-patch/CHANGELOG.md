## [1.3.12](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.3.11...v1.3.12) (2026-08-02)

### 🐛 Bug Fixes

* remove strict redditVideo null check and add token caching ([4fea2f1](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/4fea2f1f8b9ce6693dae6273ab45c46e7a509d58))

## [1.3.11](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.3.10...v1.3.11) (2026-08-02)

### 🐛 Bug Fixes

* override PostTypesKt to prevent RedGifs from mapping to GifElement ([83d53ec](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/83d53ec75ca5d7ca5da1d1a46a71367182340bc3))

## [1.3.10](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.3.9...v1.3.10) (2026-08-02)

### 🐛 Bug Fixes

* bump version to v1.3.10 to bypass morphe manager cache ([030425f](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/030425f976ab8b45749f8a2887e09f11b8777ff3))

## [1.3.9](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.3.8...v1.3.9) (2026-08-02)

### 🐛 Bug Fixes

* safely intercept gb.a.v isGif check in feed mapper for redgifs urls ([e8e897c](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/e8e897c3c207c2ea5d3fcb6f0f149293bedf54ec))
* trigger new release ([67023f1](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/67023f199c494c62efddb7342944c771b464d5a5))

## [1.3.9](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.3.8...v1.3.9) (2026-08-02)

### 🐛 Bug Fixes

* safely intercept gb.a.v isGif check in feed mapper for redgifs urls ([e8e897c](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/e8e897c3c207c2ea5d3fcb6f0f149293bedf54ec))

## [1.3.8](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.3.7...v1.3.8) (2026-08-02)

### 🐛 Bug Fixes

* patch AudioState.ABSENT to MUTED in feed mapper to show speaker icon for all videos ([9a76f43](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/9a76f4387ff82a3da20b3713e00e4aa11ec57234))

## [1.3.7](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.3.6...v1.3.7) (2026-08-02)

### 🐛 Bug Fixes

* nullify mp4Urls and packagedMp4Url to prevent lightweight gif player fallback ([2c24d81](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/2c24d818cd6af2f3f22e9d729e79912612db61de))

## [1.3.6](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.3.5...v1.3.6) (2026-08-02)

### 🐛 Bug Fixes

* comprehensively patch all url fields including mp4Urls to prevent silent stream fallback for short videos ([dc9fad7](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/dc9fad7bdf18f1c2a574cd6b1afb2bd7ed81c654))

## [1.3.5](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.3.4...v1.3.5) (2026-08-02)

### 🐛 Bug Fixes

* restore working patch without crashing linkmedia ([32b939b](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/32b939b68d876158dd340d5d504b4f8e34daddef))

## [1.3.4](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.3.3...v1.3.4) (2026-08-02)

### 🐛 Bug Fixes

* actually undo redditVideo nullification to resolve crash ([c20c0ed](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/c20c0ed54f1c166ef8f634f686513e9311799a30))

## [1.3.3](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.3.2...v1.3.3) (2026-08-02)

### 🐛 Bug Fixes

* fallback to WebView for videos under 60s ([1a84777](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/1a8477717490c14e0e7b11a185b187c20b7ffbf6))

## [1.3.2](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.3.1...v1.3.2) (2026-08-02)

### 🐛 Bug Fixes

* global override for isGif and remove toasts ([6499ef3](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/6499ef3c4d2d28522223ea225fd44b5b70dfca7d))

## [1.3.1](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.3.0...v1.3.1) (2026-08-02)

### 🐛 Bug Fixes

* force duration to 600000ms for short redgifs ([22c8a53](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/22c8a531fec825b0a430d44b8b16b5175fef6529))

## [1.3.0](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.2.8...v1.3.0) (2026-08-02)

### ✨ New Features

* hook LinkMedia to overwrite RedditVideo properties and enable native audio ([0f7b460](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/0f7b460c83962f9d4c3601932c60253e171ce242))

## [1.2.8](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.2.7...v1.2.8) (2026-08-02)

### 🐛 Bug Fixes

* smart Toast diagnostics - only show for RedGifs URLs with step-by-step trace ([d91927a](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/d91927a3a0c87c4b1287ede3ce007561fb9fcef3))

## [1.2.7](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.2.6...v1.2.7) (2026-08-02)

### 🐛 Bug Fixes

* switch to file-based debug logging for complete execution trace ([ab8e625](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/ab8e6255a93b8c34ce16d61eb786ff0059457d34))

## [1.2.6](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.2.5...v1.2.6) (2026-08-02)

### 🐛 Bug Fixes

* include anonymous inner class in dex (was causing crash) ([8c7ce6e](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/8c7ce6ea514fe5b2519dc05b2e2a2994af93f54c))

## [1.2.5](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.2.4...v1.2.5) (2026-07-11)

### 🐛 Bug Fixes

* add toast debugging back to trace execution ([4d873c2](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/4d873c2a2e996482472bcefee7c2376f897d3353))

## [1.2.4](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.2.3...v1.2.4) (2026-07-11)

### 🐛 Bug Fixes

* entirely remove temp register dependency to prevent VerifyError crashes on app load ([91bf319](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/91bf319363133b8cd7d76a753de44c8d826149ff))

## [1.2.3](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.2.2...v1.2.3) (2026-07-11)

### 🐛 Bug Fixes

* use temp register to avoid destroying p2, add debug Toast logging ([6e44855](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/6e44855fcf637fe561c89864e4c4e66b8b9bb2b2))

## [1.2.2](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.2.1...v1.2.2) (2026-07-11)

### 🐛 Bug Fixes

* hook VideoMedia constructor instead of RedditVideo to intercept RedGifs embeds ([41688de](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/41688de5c2ce23cc7d2f549e610f0969462f8b82))

## [1.2.1](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.2.0...v1.2.1) (2026-07-11)

### 🐛 Bug Fixes

* aggressively force global UI checks to unmute videos ([4ad98e1](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/4ad98e12ca09f7d234448fe3f42f758cd88824d3))
* resolve Kotlin compile error in patch DSL ([c83999e](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/c83999e13c2e02f46d041474c5a4ac49f21e7ad4))

## [1.2.0](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.1.3...v1.2.0) (2026-07-11)

### ✨ New Features

* restore functional RedGifs helper with lowercase ID fix ([ea9cfda](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/ea9cfdaa2eef2998f93b3ad9502261f161a2ab5a))

## [1.1.3](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.1.2...v1.1.3) (2026-07-11)

### 🐛 Bug Fixes

* push diagnostic patch that forces null to verify login interference ([551bbd1](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/551bbd10f328421922e8fd3604fff845952e1c92))

## [1.1.2](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.1.1...v1.1.2) (2026-07-11)

### 🐛 Bug Fixes

* remove StrictMode stub from dex to prevent possible SecurityExceptions or class loading issues ([3d2e3e4](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/3d2e3e451abdc0dd9f7350e6054f7c223860894e))

## [1.1.1](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.1.0...v1.1.1) (2026-07-11)

### 🐛 Bug Fixes

* call toLowerCase() on redgifs ID before fetching from API ([d65d93d](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/d65d93d8f851e4820d2245371c7dc6dcc7f864bf))

## [1.1.0](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.0.4...v1.1.0) (2026-07-11)

### 🐛 Bug Fixes

* remove java sources to prevent gradle compile errors since we use precompiled dex ([8498be8](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/8498be8b494f3b11c370cda97ea2df0a53cf9ff4))

### ✨ New Features

* implement correct RedGifs Auth token fetch and proper class injection via extendWith ([c533356](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/c533356b99dae0810556b431de5e587beb960966))

## [1.0.4](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.0.3...v1.0.4) (2026-07-11)

### 🐛 Bug Fixes

* bundle RedGifsHelper as smali in resources to fix NoClassDefFoundError ([7a96154](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/7a961546cf5811ce73be1460b3067df8647c8383))

## [1.0.3](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.0.2...v1.0.3) (2026-07-11)

### 🐛 Bug Fixes

* bundle RedGifsHelper as smali to fix NoClassDefFoundError runtime crash ([bb67c9c](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/bb67c9cdf9b4ed0160cee55ae5d332fd578c5136))

## [1.0.2](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.0.1...v1.0.2) (2026-07-11)

### 🐛 Bug Fixes

* remove org.json dependency and use Regex ([6f0d2b6](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/6f0d2b60571d8b0bbfecdb06fb225970384b290f))
* Rewrite patch to hook RedditVideo constructor and fetch RedGifs HD mp4 ([f59c15e](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/f59c15ee8c2ee0f52675dcb1d41707763d1c8f6c))

## [1.0.1](https://github.com/ekazrahul100-web/redgifs-audio-patch/compare/v1.0.0...v1.0.1) (2026-07-11)

### 🐛 Bug Fixes

* resolve compile errors from invalid ReVanced imports ([13a1950](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/13a1950ecc9192aae90133f2af730bc390417b05))
* rewrite patch using correct Morphe DSL and precise hook point ([469f940](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/469f94083e702b66daf98eda2155cba6ce3a2395))

## 1.0.0 (2026-07-11)

### 🐛 Bug Fixes

* migrate patch to Morphe DSL ([94c5038](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/94c50382aaae8737ca4c2ab50d4ca4a7cd902eb3))
* update imports to use Morphe patcher ([c9252f0](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/c9252f0f31ce11436c6d1ec147abf764b5bb6a49))

### ✨ New Features

* add RedGifs audio fix patch ([9f45e14](https://github.com/ekazrahul100-web/redgifs-audio-patch/commit/9f45e149117cf8b4d2a816ebe545b6413fc3cf95))
