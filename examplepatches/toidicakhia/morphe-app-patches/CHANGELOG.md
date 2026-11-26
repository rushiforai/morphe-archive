## [1.8.0](https://github.com/toidicakhia/morphe-app-patches/compare/v1.7.2...v1.8.0) (2026-11-25)

### 🐛 Bug Fixes

* **release:** build the patches file before generating the patch list ([285fbd2](https://github.com/toidicakhia/morphe-app-patches/commit/285fbd202694c31490f437cf9250ca66965b987b))
* **release:** keep classes.dex when generating the patch list ([716c82a](https://github.com/toidicakhia/morphe-app-patches/commit/716c82a1048eb728ff43d0c756f1ed0b07f91e56))
* **terabox:** accurate task clicker order and watch-ad targeting ([4d7148e](https://github.com/toidicakhia/morphe-app-patches/commit/4d7148e4eca1c295ceca5c0f8cda85f911f80c58))
* **terabox:** click AdMob's close X with a real touch and cap its end card ([2ca5158](https://github.com/toidicakhia/morphe-app-patches/commit/2ca51589cf4e5aa941baaef2c1bd75aa67f4d721))
* **terabox:** close a stuck follow-up native ad after 20 s ([42f65ce](https://github.com/toidicakhia/morphe-app-patches/commit/42f65ce45429f81a0150665c90a5bcbf91aba33a))
* **terabox:** close end cards from every network in the MAX waterfall ([dea4bdb](https://github.com/toidicakhia/morphe-app-patches/commit/dea4bdb1294916fb37db95774cb616854f3b5bf7))
* **terabox:** close every ad SDK and speed up task clicks ([d4b6fd0](https://github.com/toidicakhia/morphe-app-patches/commit/d4b6fd0c008b09f24b8486f2726ea1dd6eb403a4))
* **terabox:** close playable end cards that draw their own close X ([2eb4f1a](https://github.com/toidicakhia/morphe-app-patches/commit/2eb4f1a800e2be8f36da8ef338f24e6bf7265d17))
* **terabox:** close the ads that owe no reward, and retry the ones that do ([621f7bb](https://github.com/toidicakhia/morphe-app-patches/commit/621f7bbb46878cef1d5186c69b2d872cb5648885))
* **terabox:** close the app's native ad and widen SDK activity coverage ([4637368](https://github.com/toidicakhia/morphe-app-patches/commit/4637368359e523128f85237238b999cb8380ec8e))
* **terabox:** follow the new Gold-center task layout ([e82a10b](https://github.com/toidicakhia/morphe-app-patches/commit/e82a10bf601d45e88ade77f91416aa8f71dfe50e))
* **terabox:** give landing pages the short grace, not the reward timeout ([0510419](https://github.com/toidicakhia/morphe-app-patches/commit/0510419fac16c9fd67caad2f18f6c84507eeeeb4))
* **terabox:** harden ad unwinding and task clicker retries ([150a1fd](https://github.com/toidicakhia/morphe-app-patches/commit/150a1fdadadce15a29b92b501aa64438c0bd08ef))
* **terabox:** harden auto ad closing and speed up task clicks ([32be8ca](https://github.com/toidicakhia/morphe-app-patches/commit/32be8cabb18a788b222e4b8bd6f933047b109f08))
* **terabox:** let the app's own deep links through the redirect blocker ([042f4dc](https://github.com/toidicakhia/morphe-app-patches/commit/042f4dc9993f022cbfc8fdb2003e206c76be9f91))
* **terabox:** stop cutting AdMob rewarded ads after the interstitial grace ([dcc7751](https://github.com/toidicakhia/morphe-app-patches/commit/dcc77513c1106c697d05b6d64f9778267407f729))
* **terabox:** stop cutting rewarded ads at the 6s grace ([7bb9169](https://github.com/toidicakhia/morphe-app-patches/commit/7bb9169530b49ab17937a3c12428697bd7b8fb2e))
* **terabox:** tag reward popups for WebViews without :has() ([17dd21c](https://github.com/toidicakhia/morphe-app-patches/commit/17dd21c3e3264a6c25ca1dac3245400e2ce6d1a0))

### ✨ New Features

* **locket:** add Spoofer server patch ([3cb0632](https://github.com/toidicakhia/morphe-app-patches/commit/3cb063227485dd9e95a13f9fb288cea98c3f8fdd))
* **terabox:** add auto reward ads patch ([3e48a50](https://github.com/toidicakhia/morphe-app-patches/commit/3e48a5086c6f55bec501a7daee141a931163d685))
* **terabox:** block the store and browser hand-offs that steal focus ([7f89e19](https://github.com/toidicakhia/morphe-app-patches/commit/7f89e199cfe43207cab69e26ea9989d22080952f))
* **terabox:** check-in clicker and SSL pinning bypass ([c467a1a](https://github.com/toidicakhia/morphe-app-patches/commit/c467a1acb00fa4f6e7469ac4dc7f322e7c331069))
* **terabox:** close every ad network through its own control ([b53eb77](https://github.com/toidicakhia/morphe-app-patches/commit/b53eb776f476c7b5a539cb61fbdc8113c1530a86))
* **terabox:** close rewarded ads after reward and auto claim tasks ([42bdbdf](https://github.com/toidicakhia/morphe-app-patches/commit/42bdbdf5486d62e3efab0b1759763cf59c319f9d))
* **terabox:** selector-based task clicker with an on-screen status ([9fc4db0](https://github.com/toidicakhia/morphe-app-patches/commit/9fc4db04d74c862ce6e274ddf08af9ac0ae1418c))
* **wedj:** add patches for WeDJ 1.1.4.5 and 1.1.1.3 ([f97d536](https://github.com/toidicakhia/morphe-app-patches/commit/f97d5361d55ef6227aa37bf44f0c98925ea37387))

### 🚀 Updated App Support

* **terabox:** update patches for TeraBox 4.28.5 ([6a364bc](https://github.com/toidicakhia/morphe-app-patches/commit/6a364bc3449bff23fe15c53cb7adcf1286fe19e6))
* **terabox:** update patches for TeraBox 4.29.0 ([6428142](https://github.com/toidicakhia/morphe-app-patches/commit/6428142803f6e4530fd3b228236b2abdca268813))
* **vtvgo:** update patches for VTVGo 12.11.19 ([0f3229e](https://github.com/toidicakhia/morphe-app-patches/commit/0f3229eb19384a94393323730debd41705c20fc4))

## [1.7.2](https://github.com/toidicakhia/morphe-app-patches/compare/v1.7.1...v1.7.2) (2026-11-17)

### 🐛 Bug Fixes

* remove Remote Desktop Manager and TeraBox patches ([ca27fff](https://github.com/toidicakhia/morphe-app-patches/commit/ca27fff))

### ✨ New Features

* **vtvgo:** sync the settings button with the exact control bar state ([5c63afd](https://github.com/toidicakhia/morphe-app-patches/commit/5c63afd))
* **vtvgo:** track player layout changes for the settings button ([fe13840](https://github.com/toidicakhia/morphe-app-patches/commit/fe13840))
* **vtvgo:** sync quality menu with player state ([757a3e3](https://github.com/toidicakhia/morphe-app-patches/commit/757a3e3))
* **vtvgo:** add video quality settings button ([bc16a72](https://github.com/toidicakhia/morphe-app-patches/commit/bc16a72))
* **devolutions:** add Skip Age Verification patch ([7de5f63](https://github.com/toidicakhia/morphe-app-patches/commit/7de5f63))
* **locket:** add Unlock Locket Gold patch ([72fc89e](https://github.com/toidicakhia/morphe-app-patches/commit/72fc89e))
* **vtvgo:** add Unlock Video Quality patch ([abaf1c1](https://github.com/toidicakhia/morphe-app-patches/commit/abaf1c1))
* **devolutions:** add Faster Startup patch for Remote Desktop Manager ([cc4dec4](https://github.com/toidicakhia/morphe-app-patches/commit/cc4dec4))

## [1.7.1](https://github.com/toidicakhia/morphe-app-patches/compare/v1.7.0...v1.7.1) (2026-11-15)

### 🚀 Updated App Support

* **vtvgo:** update patches for VTVGo 12.11.13 ([5d60f23](https://github.com/toidicakhia/morphe-app-patches/commit/5d60f23ce6e991d2b67b6218214fa5f029db0c4a))

## [1.7.0](https://github.com/toidicakhia/morphe-app-patches/compare/v1.6.0...v1.7.0) (2026-11-13)

### 🐛 Bug Fixes

* correct app icon colors and show app icons in README ([da698b3](https://github.com/toidicakhia/morphe-app-patches/commit/da698b30c6204ad53cdd68559258d25f6f564f29))

### ✨ New Features

* **devolutions:** add patches for Remote Desktop Manager 2026.3.1.5 ([128121c](https://github.com/toidicakhia/morphe-app-patches/commit/128121c1ae46415be8075b44b3236275d9085845))
* **vtvgo:** add patches for VTVGo 12.11.05 ([8f49fe0](https://github.com/toidicakhia/morphe-app-patches/commit/8f49fe0a8e618e021892ee47e94661b43130c3a6))

## [1.6.0](https://github.com/toidicakhia/morphe-app-patches/compare/v1.5.0...v1.6.0) (2026-11-07)

### ✨ New Features

* **universal copy:** support 7.2.0 and remove Internet permission ([04b8b1b](https://github.com/toidicakhia/morphe-app-patches/commit/04b8b1be9d71103f9aa4be8b6896bbab35f5d1ef))

## [1.5.0](https://github.com/toidicakhia/morphe-app-patches/compare/v1.4.1...v1.5.0) (2026-10-30)

### ✨ New Features

* add Universal Copy Unlock Plus patch ([60f5057](https://github.com/toidicakhia/morphe-app-patches/commit/60f50574c1e7f5368065824aa6393c6c343b1143))

## [1.4.1](https://github.com/toidicakhia/morphe-app-patches/compare/v1.4.0...v1.4.1) (2026-10-28)

### 🐛 Bug Fixes

* repair TeraBox Google login and keep Benefits ads ([aa7223e](https://github.com/toidicakhia/morphe-app-patches/commit/aa7223ee96a667561d707ac897739b19a06f73e3))

## [1.4.0](https://github.com/toidicakhia/morphe-app-patches/compare/v1.3.0...v1.4.0) (2026-10-28)

### 🐛 Bug Fixes

* harden WARP analytics dispatch detection ([6108aa9](https://github.com/toidicakhia/morphe-app-patches/commit/6108aa9d2d5cd8957d671b6b7c64fc2988735fac))

### ✨ New Features

* add EZVIZ signature check bypass ([e9671ca](https://github.com/toidicakhia/morphe-app-patches/commit/e9671caf1d8550102e4a48b0ebd7d240c406b0f6))
* add HTTP Sniffer 2.4.9 support ([2aefbb3](https://github.com/toidicakhia/morphe-app-patches/commit/2aefbb3af27ab535b58d249a08dd8261cd9e497d))
* add TeraBox patches ([2ea18d4](https://github.com/toidicakhia/morphe-app-patches/commit/2ea18d47c2ecb85819df65986fc223f911943f25))

## [1.3.0](https://github.com/toidicakhia/morphe-app-patches/compare/v1.2.0...v1.3.0) (2026-10-28)

### ✨ New Features

* add 1.1.1.1 WARP patches ([92fff38](https://github.com/toidicakhia/morphe-app-patches/commit/92fff38d5d01d50efa30bf35ea56d909cd1c6d67))

## [1.2.0](https://github.com/toidicakhia/morphe-app-patches/compare/v1.1.0...v1.2.0) (2026-10-27)

### ✨ New Features

* add EZVIZ ad removal and SSL unpinning patches ([91d3d08](https://github.com/toidicakhia/morphe-app-patches/commit/91d3d082bd91b24bc18ae8306f132d50edc8a0ed))

## [1.1.0](https://github.com/toidicakhia/morphe-app-patches/compare/v1.0.0...v1.1.0) (2026-10-24)

### ✨ New Features

* add HTTP Sniffer VIP unlock patch ([9e7673c](https://github.com/toidicakhia/morphe-app-patches/commit/9e7673c02a7b66be05920a040e0ce305a4966eee))

## 1.0.0 (2026-10-24)

### 🐛 Bug Fixes

* add README patches end marker ([a7eb887](https://github.com/toidicakhia/morphe-app-patches/commit/a7eb887990fac6590ec2b4dc8f914de69252d786))

### ✨ New Features

* add NetMonster premium unlock patch ([d726cd5](https://github.com/toidicakhia/morphe-app-patches/commit/d726cd5efff5768add73f137850ecff74949e7f8))
