## [1.10.0](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.3...v1.10.0) (2026-11-24)

### 🐛 Bug Fixes

* **aftership:** harden byte patch bounds ([d8acd66](https://github.com/ihatenodejs/aidans-patches/commit/d8acd66abd4a0291fc7f00248eac2f5a378ad3f2))
* **apk-lab:** bound the Play runtime and signal-safe child lifecycle ([2681a83](https://github.com/ihatenodejs/aidans-patches/commit/2681a83f7b3b29a5b1048d60b7b2b31cac663c83))
* **apk-lab:** complete native dispenser authentication ([9a347ef](https://github.com/ihatenodejs/aidans-patches/commit/9a347ef5e61d4683f87aa44711523cb91f665994))
* **apk-lab:** complete paired benchmark correctness ([818e4fe](https://github.com/ihatenodejs/aidans-patches/commit/818e4fe9766d84c66cf6d9cabec680fd1f28945d))
* **apk-lab:** flush stdout before exit so a closed pipe exits zero ([44f1c57](https://github.com/ihatenodejs/aidans-patches/commit/44f1c5799863c5edc33dd3bfc2fb729d4cdc01a0))
* **apk-lab:** harden Play credentials and acquisition boundaries ([00121f2](https://github.com/ihatenodejs/aidans-patches/commit/00121f28251cc920acbe7798daa364e0dfa1f86c))
* **apk-lab:** kill descendant process groups on cancel and timeout ([4e1c022](https://github.com/ihatenodejs/aidans-patches/commit/4e1c022ce2fabd96df761056db3dce923e53380f))
* **apk-lab:** make native checks portable and track frozen fixtures ([2440ce1](https://github.com/ihatenodejs/aidans-patches/commit/2440ce1d4f2edeecf88e611b50ee7f65b0f79e68))
* **apk-lab:** raise resource dump output bound ([c87b760](https://github.com/ihatenodejs/aidans-patches/commit/c87b760ae1a637eaebfe2682acbb3af645a0511e))
* **apk-lab:** retry transient executable-busy probes ([c090c83](https://github.com/ihatenodejs/aidans-patches/commit/c090c839ee1c71f4e2490213b14c50f0a978167d))
* **apk-lab:** serialize workspace publication and cleanup ([436522b](https://github.com/ihatenodejs/aidans-patches/commit/436522b675c0c76998efc7bda3bef25fa821f4d8))
* **audit:** stop sharing cargo target dirs with hook snapshots ([3a43244](https://github.com/ihatenodejs/aidans-patches/commit/3a43244b522585c41f545ef1a642313e35ea4665))
* **ci:** authenticate release pushes with the ruleset bypass deploy key ([291cf37](https://github.com/ihatenodejs/aidans-patches/commit/291cf37f7d6c5aa17c55d2cbc9c923af16bbaa11))
* **release:** install Bun before the release preflight ([8d13254](https://github.com/ihatenodejs/aidans-patches/commit/8d1325447c36bd9a8495e741df2c1bc12d7e41df))
* **release:** stop the automated release push from running repo hooks ([69458b4](https://github.com/ihatenodejs/aidans-patches/commit/69458b48c74dc389df9773f9fbc175bf722fa952))
* **sezzle:** correct shortcut filter and strip Braze banner ([4d071a3](https://github.com/ihatenodejs/aidans-patches/commit/4d071a3a50f6b2d383918ec9cb9076f827ea0734))
* **sezzle:** hide Get Rewards header pill ([0708514](https://github.com/ihatenodejs/aidans-patches/commit/0708514674ffacf5319ff9e59dfcf36b03c9f867))
* **sezzle:** hide Pay Later Anywhere variants and add shortcut options ([1488561](https://github.com/ihatenodejs/aidans-patches/commit/1488561178fbedf77cbc0ab61c39da4631d8991a))
* **sezzle:** remove Anywhere and Premium account benefit rows ([e0d12c3](https://github.com/ihatenodejs/aidans-patches/commit/e0d12c3226aef146772e35740a8fa99af5773c93))
* **sezzle:** restore Home and add clean Home options ([0d66382](https://github.com/ihatenodejs/aidans-patches/commit/0d66382b4e792752391c2262a95b55fe3df23d2b))
* **sezzle:** restore Home shortcuts and add gift card toggle ([a0f5d73](https://github.com/ihatenodejs/aidans-patches/commit/a0f5d731e3e72285d0f4d50a65bd4050de0d0c92))
* **tools:** emitted one -p argument per patch selection so -O options bind ([0e433b3](https://github.com/ihatenodejs/aidans-patches/commit/0e433b33daa90a1b8844bf0efff6ee1ebfeefcaf))

### ✨ New Features

* **apk-lab:** add acquisition preflight acceptance ([c7c55cc](https://github.com/ihatenodejs/aidans-patches/commit/c7c55ccc6742108e6b3bd0bd8b75280beaf61e60))
* **apk-lab:** add APKPure acquisition fallback ([2087dc8](https://github.com/ihatenodejs/aidans-patches/commit/2087dc80f03e77e1fbc84e9887eb3ec4b0afc586))
* **apk-lab:** add migration harness with frozen contracts and baseline ([3a9efad](https://github.com/ihatenodejs/aidans-patches/commit/3a9efadb7b02c745b00f121443a436681136412f))
* **apk-lab:** add native Play delivery probe ([3ea1bb9](https://github.com/ihatenodejs/aidans-patches/commit/3ea1bb9c668ce1c322f74540a713613efca1e93c))
* **apk-lab:** add native tool discovery and inspection ([030e817](https://github.com/ihatenodejs/aidans-patches/commit/030e8175febf7ab1944fdf47d001ef891c6dcd08))
* **apk-lab:** add paired Python Rust benchmarks ([5e1aeb3](https://github.com/ihatenodejs/aidans-patches/commit/5e1aeb3ffe1481135c6817ae3bf5d857402f9d55))
* **apk-lab:** add secure archive and workspace core ([a162b7e](https://github.com/ihatenodejs/aidans-patches/commit/a162b7e5c55d481f4a0045b4b081162736e55ebb))
* **apk-lab:** add typed native core foundation ([2b7d063](https://github.com/ihatenodejs/aidans-patches/commit/2b7d063e6e30ccccc35bf9504de0571ced760cf1))
* **apk-lab:** port acquisition accounts and CI ([424c44e](https://github.com/ihatenodejs/aidans-patches/commit/424c44eecf0b576cc94dd881e5a0b8c81f84792f))
* **apk-lab:** port analysis commands to native Rust ([dfd43dd](https://github.com/ihatenodejs/aidans-patches/commit/dfd43dd383a59279264face81915dde3d893c04a))
* **apk-lab:** port patch verification and device operations ([e2a2990](https://github.com/ihatenodejs/aidans-patches/commit/e2a29903fe83d110990ea53b35f216505375be54))
* **apk-lab:** seed fixtures from a local artifact with expectations ([80c5047](https://github.com/ihatenodejs/aidans-patches/commit/80c504752fc4b562c57ecbfb219c03f77afafa32))
* **canvas:** added splash screen and landing logo theming to Change App Icon patch ([9926d0d](https://github.com/ihatenodejs/aidans-patches/commit/9926d0dd1e52bd1c7be19683c8094d9176faba39))
* **fizz:** added support for Fizz 1.72.0 via per-version bytecode targets ([27b0b51](https://github.com/ihatenodejs/aidans-patches/commit/27b0b514f4b65949cacd73efd19d7a1b83bab2e6))
* **geocaching:** update patches for 10.24.0 ([31ef2e1](https://github.com/ihatenodejs/aidans-patches/commit/31ef2e125c650a22e436d1f8ddb8d6926fb4ac18))
* **icons:** prove exact native image compatibility ([8365070](https://github.com/ihatenodejs/aidans-patches/commit/83650707cfe700ffeffc20a7a3047c5d0c7d2e25))
* **icons:** record native icon proof fixtures ([e9f4205](https://github.com/ihatenodejs/aidans-patches/commit/e9f420501b864fa415c08246c9a7f2a002777d4a))
* **release:** reconcile missing channel notes before release ([d8c0896](https://github.com/ihatenodejs/aidans-patches/commit/d8c0896eaaff1c9516bfb87be35bf34f5a03a47c))
* **release:** retry superseded release runs once ([4dbf1df](https://github.com/ihatenodejs/aidans-patches/commit/4dbf1df65616a0e6eccd30be0b061cbcd9dec0cd))

### 🚀 Updated App Support

* **365pay:** add support for 10.2606.1 ([136aab6](https://github.com/ihatenodejs/aidans-patches/commit/136aab641fceac46d64e80197712a4cd068166fe))
* **blackjack:** support 2.23.01 ([dd02445](https://github.com/ihatenodejs/aidans-patches/commit/dd024454c81eb2999dd903e5b34fa683b86c0328))
* **credit-karma:** support 26.47 ([55e9dfe](https://github.com/ihatenodejs/aidans-patches/commit/55e9dfe4f4b302584998c346335e134687c9d721))
* **navigate360-student:** update patches for 26.23.8 ([073bcc3](https://github.com/ihatenodejs/aidans-patches/commit/073bcc39bb715b33f38375ca4d81d789671f17d6))
* **nhl:** support 17.2.0 ([bd64492](https://github.com/ihatenodejs/aidans-patches/commit/bd644924c6c0ed3acd02438bf85ffdb4c764ab9f))
* **sezzle:** update to 5.3.24 ([4ddd356](https://github.com/ihatenodejs/aidans-patches/commit/4ddd356bc8b2cbbd5296949b7bd2664ebc5cb4ca))
* **sidelineswap:** support 2.3.2 compose rewrite ([84d1f94](https://github.com/ihatenodejs/aidans-patches/commit/84d1f9470bd505aa0a5ab568a5e55398781b1245))

### 🔧 Improvements

* **apk-lab:** parse DEX class tables directly ([bd3512b](https://github.com/ihatenodejs/aidans-patches/commit/bd3512b4bf0f89188ac81496ca3d83335662bcf2))
* **apk-lab:** remove redundant large-APKM work ([f1d4224](https://github.com/ihatenodejs/aidans-patches/commit/f1d4224d38e6f0713fabbeadd845143ed769ffa9))

## [1.10.0-dev.12](https://github.com/ihatenodejs/aidans-patches/compare/v1.10.0-dev.11...v1.10.0-dev.12) (2026-11-23)

### 🐛 Bug Fixes

* **ci:** authenticate release pushes with the ruleset bypass deploy key ([291cf37](https://github.com/ihatenodejs/aidans-patches/commit/291cf37f7d6c5aa17c55d2cbc9c923af16bbaa11))
* **sezzle:** hide Get Rewards header pill ([0708514](https://github.com/ihatenodejs/aidans-patches/commit/0708514674ffacf5319ff9e59dfcf36b03c9f867))
* **sezzle:** hide Pay Later Anywhere variants and add shortcut options ([1488561](https://github.com/ihatenodejs/aidans-patches/commit/1488561178fbedf77cbc0ab61c39da4631d8991a))
* **sezzle:** remove Anywhere and Premium account benefit rows ([e0d12c3](https://github.com/ihatenodejs/aidans-patches/commit/e0d12c3226aef146772e35740a8fa99af5773c93))
* **sezzle:** restore Home and add clean Home options ([0d66382](https://github.com/ihatenodejs/aidans-patches/commit/0d66382b4e792752391c2262a95b55fe3df23d2b))
* **sezzle:** restore Home shortcuts and add gift card toggle ([a0f5d73](https://github.com/ihatenodejs/aidans-patches/commit/a0f5d731e3e72285d0f4d50a65bd4050de0d0c92))

## [1.10.0-dev.11](https://github.com/ihatenodejs/aidans-patches/compare/v1.10.0-dev.10...v1.10.0-dev.11) (2026-11-23)

### 🐛 Bug Fixes

* **release:** install Bun before the release preflight ([8d13254](https://github.com/ihatenodejs/aidans-patches/commit/8d1325447c36bd9a8495e741df2c1bc12d7e41df))
* **sezzle:** correct shortcut filter and strip Braze banner ([4d071a3](https://github.com/ihatenodejs/aidans-patches/commit/4d071a3a50f6b2d383918ec9cb9076f827ea0734))

### ✨ New Features

* **release:** reconcile missing channel notes before release ([d8c0896](https://github.com/ihatenodejs/aidans-patches/commit/d8c0896eaaff1c9516bfb87be35bf34f5a03a47c))
* **release:** retry superseded release runs once ([4dbf1df](https://github.com/ihatenodejs/aidans-patches/commit/4dbf1df65616a0e6eccd30be0b061cbcd9dec0cd))

## [1.10.0-dev.10](https://github.com/ihatenodejs/aidans-patches/compare/v1.10.0-dev.9...v1.10.0-dev.10) (2026-11-23)

### 🚀 Updated App Support

* **sezzle:** update to 5.3.24 ([4ddd356](https://github.com/ihatenodejs/aidans-patches/commit/4ddd356bc8b2cbbd5296949b7bd2664ebc5cb4ca))

## [1.10.0-dev.9](https://github.com/ihatenodejs/aidans-patches/compare/v1.10.0-dev.8...v1.10.0-dev.9) (2026-11-23)

### 🚀 Updated App Support

* **nhl:** support 17.2.0 ([bd64492](https://github.com/ihatenodejs/aidans-patches/commit/bd644924c6c0ed3acd02438bf85ffdb4c764ab9f))

## [1.10.0-dev.8](https://github.com/ihatenodejs/aidans-patches/compare/v1.10.0-dev.7...v1.10.0-dev.8) (2026-11-23)

### 🚀 Updated App Support

* **credit-karma:** support 26.47 ([55e9dfe](https://github.com/ihatenodejs/aidans-patches/commit/55e9dfe4f4b302584998c346335e134687c9d721))

## [1.10.0-dev.7](https://github.com/ihatenodejs/aidans-patches/compare/v1.10.0-dev.6...v1.10.0-dev.7) (2026-11-23)

### 🚀 Updated App Support

* **blackjack:** support 2.23.01 ([dd02445](https://github.com/ihatenodejs/aidans-patches/commit/dd024454c81eb2999dd903e5b34fa683b86c0328))

## [1.10.0-dev.6](https://github.com/ihatenodejs/aidans-patches/compare/v1.10.0-dev.5...v1.10.0-dev.6) (2026-11-23)

### 🚀 Updated App Support

* **navigate360-student:** update patches for 26.23.8 ([073bcc3](https://github.com/ihatenodejs/aidans-patches/commit/073bcc39bb715b33f38375ca4d81d789671f17d6))

## [1.10.0-dev.5](https://github.com/ihatenodejs/aidans-patches/compare/v1.10.0-dev.4...v1.10.0-dev.5) (2026-11-23)

### 🚀 Updated App Support

* **365pay:** add support for 10.2606.1 ([136aab6](https://github.com/ihatenodejs/aidans-patches/commit/136aab641fceac46d64e80197712a4cd068166fe))

## [1.10.0-dev.4](https://github.com/ihatenodejs/aidans-patches/compare/v1.10.0-dev.3...v1.10.0-dev.4) (2026-11-23)

### ✨ New Features

* **geocaching:** update patches for 10.24.0 ([31ef2e1](https://github.com/ihatenodejs/aidans-patches/commit/31ef2e125c650a22e436d1f8ddb8d6926fb4ac18))

## [1.10.0-dev.3](https://github.com/ihatenodejs/aidans-patches/compare/v1.10.0-dev.2...v1.10.0-dev.3) (2026-11-22)

### 🐛 Bug Fixes

* **aftership:** harden byte patch bounds ([d8acd66](https://github.com/ihatenodejs/aidans-patches/commit/d8acd66abd4a0291fc7f00248eac2f5a378ad3f2))

### 🚀 Updated App Support

* **sidelineswap:** support 2.3.2 compose rewrite ([84d1f94](https://github.com/ihatenodejs/aidans-patches/commit/84d1f9470bd505aa0a5ab568a5e55398781b1245))

## [1.10.0-dev.2](https://github.com/ihatenodejs/aidans-patches/compare/v1.10.0-dev.1...v1.10.0-dev.2) (2026-11-22)

### ✨ New Features

* **canvas:** added splash screen and landing logo theming to Change App Icon patch ([9926d0d](https://github.com/ihatenodejs/aidans-patches/commit/9926d0dd1e52bd1c7be19683c8094d9176faba39))

## [1.10.0-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.3...v1.10.0-dev.1) (2026-11-21)

### 🐛 Bug Fixes

* **tools:** emitted one -p argument per patch selection so -O options bind ([0e433b3](https://github.com/ihatenodejs/aidans-patches/commit/0e433b33daa90a1b8844bf0efff6ee1ebfeefcaf))

### ✨ New Features

* **fizz:** added support for Fizz 1.72.0 via per-version bytecode targets ([27b0b51](https://github.com/ihatenodejs/aidans-patches/commit/27b0b514f4b65949cacd73efd19d7a1b83bab2e6))

## [1.9.3](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.2...v1.9.3) (2026-11-20)

### 🐛 Bug Fixes

* **apk-lab:** redact goopdl stderr before truncating ([cb23dd5](https://github.com/ihatenodejs/aidans-patches/commit/cb23dd5bd3dc6c6c0c3f9a90fa81d40961ee342e))
* **ci:** fall back to status for fizz version code ([d1c14e4](https://github.com/ihatenodejs/aidans-patches/commit/d1c14e424af0ebe8171d37f122b7cea5ff366877))
* **release:** use merge strategy for stable backmerges ([0bd4915](https://github.com/ihatenodejs/aidans-patches/commit/0bd4915f12af14e6bfc0d620b27bb54ea13804a7))

### 🚀 Updated App Support

* **fizz:** sync dynamic version spoofing seed from Google Play ([197dc41](https://github.com/ihatenodejs/aidans-patches/commit/197dc41c4e6be58f55d13af3969b509d3acce1e0))

## [1.9.3-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.2...v1.9.3-dev.1) (2026-11-20)

### 🐛 Bug Fixes

* **apk-lab:** redact goopdl stderr before truncating ([cb23dd5](https://github.com/ihatenodejs/aidans-patches/commit/cb23dd5bd3dc6c6c0c3f9a90fa81d40961ee342e))
* **ci:** fall back to status for fizz version code ([d1c14e4](https://github.com/ihatenodejs/aidans-patches/commit/d1c14e424af0ebe8171d37f122b7cea5ff366877))
* **release:** use merge strategy for stable backmerges ([0bd4915](https://github.com/ihatenodejs/aidans-patches/commit/0bd4915f12af14e6bfc0d620b27bb54ea13804a7))

### 🚀 Updated App Support

* **fizz:** sync dynamic version spoofing seed from Google Play ([197dc41](https://github.com/ihatenodejs/aidans-patches/commit/197dc41c4e6be58f55d13af3969b509d3acce1e0))

## [1.9.2-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.1...v1.9.2-dev.1) (2026-11-20)

### 🐛 Bug Fixes

* **apk-lab:** redact goopdl stderr before truncating ([cb23dd5](https://github.com/ihatenodejs/aidans-patches/commit/cb23dd5bd3dc6c6c0c3f9a90fa81d40961ee342e))
* **ci:** fall back to status for fizz version code ([d1c14e4](https://github.com/ihatenodejs/aidans-patches/commit/d1c14e424af0ebe8171d37f122b7cea5ff366877))
* **release:** use merge strategy for stable backmerges ([0bd4915](https://github.com/ihatenodejs/aidans-patches/commit/0bd4915f12af14e6bfc0d620b27bb54ea13804a7))

### 🚀 Updated App Support

* **fizz:** sync dynamic version spoofing seed from Google Play ([197dc41](https://github.com/ihatenodejs/aidans-patches/commit/197dc41c4e6be58f55d13af3969b509d3acce1e0))

## [1.9.2](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.1...v1.9.2) (2026-11-20)

### 🐛 Bug Fixes

* **canvas:** stop PDF viewer crash and remove evaluation watermark ([32a1414](https://github.com/ihatenodejs/aidans-patches/commit/32a14149153b7970ae9a321331a39e29e5928183))

## [1.9.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.0...v1.9.1) (2026-11-20)

### 🐛 Bug Fixes

* **apk-lab:** harden fixture acquisition and clone checks ([27c23f0](https://github.com/ihatenodejs/aidans-patches/commit/27c23f0d4090413fb193be7a244d8f319695c127))
* **apk-lab:** serialize first compatibility case before fan-out ([07ad704](https://github.com/ihatenodejs/aidans-patches/commit/07ad70446387536c2b98f429567efd4c54938b96))

### 🚀 Updated App Support

* **pro-metronome:** update supported version to 1.14 ([98edc10](https://github.com/ihatenodejs/aidans-patches/commit/98edc10e1fe2a587e25780da4218de0f09068907))

## [1.9.0](https://github.com/ihatenodejs/aidans-patches/compare/v1.8.0...v1.9.0) (2026-11-20)

### 🐛 Bug Fixes

* **adobe-reader:** resolve fragment lifecycle and in-app review task failure ([20d5e52](https://github.com/ihatenodejs/aidans-patches/commit/20d5e52561537a8935ba5839ebd6247f6de4b6a0))
* **adobe-scan:** add atomic ocr model extraction and validate presentation relationships ([54378d8](https://github.com/ihatenodejs/aidans-patches/commit/54378d86d468e5f7ed384baf8e758c3d7a7dcb67))
* **adobe-scan:** deferred promotional neutralizers and pruned options ([cf4c77f](https://github.com/ihatenodejs/aidans-patches/commit/cf4c77f285377e76a2ce8a1ef791b0e7f84bc4f2))
* **adobe-scan:** disabled host pkg-config in native build ([8902907](https://github.com/ihatenodejs/aidans-patches/commit/89029070771cdb45fef49da9b636af18ef16d068))
* **adobe-scan:** fix native JNI memory safety, asset file descriptors, and document export formats ([0a7dfc4](https://github.com/ihatenodejs/aidans-patches/commit/0a7dfc4e39d047ccbacab19ed0834ad0f0a72537))
* **adobe-scan:** hardened pdf engine operations and build packaging ([00f23d9](https://github.com/ihatenodejs/aidans-patches/commit/00f23d99fc9177b19252ac5c521e874f8ae90b8a))
* **adobe-scan:** preserve export password whitespace, refresh combine protection, and wrap zip streams ([528c6ac](https://github.com/ihatenodejs/aidans-patches/commit/528c6acebd942cb34a968638e68f634b01d4f751))
* **adobe-scan:** removed branch labels from preference hiding ([0d930cf](https://github.com/ihatenodejs/aidans-patches/commit/0d930cfacdab0561ccb6870b35407a549054b8ce))
* **adobe-scan:** switched worker process guard register to p1 ([9b7f4ca](https://github.com/ihatenodejs/aidans-patches/commit/9b7f4ca0286fb6a919388404154a5a8173e75a72))
* **apk-lab:** sanitize token prompt, validate accounts per-entry, track manifest tags, and support negative bounds ([e53cef8](https://github.com/ihatenodejs/aidans-patches/commit/e53cef8dae6fc54ef001925e07b63730d4ae70e7))
* **apk-lab:** scope manifest attributes, track indentation depth, and count account check failures ([45320f9](https://github.com/ihatenodejs/aidans-patches/commit/45320f931dfaf662623f5443daa2b2c8922425f9))
* **audit:** display stderr on prettier formatting failures ([55b757b](https://github.com/ihatenodejs/aidans-patches/commit/55b757b230e34219fb3c9ecc07174bca4d6fd560))
* **audit:** tracked cmake configure duration and preserved failure status ([036953e](https://github.com/ihatenodejs/aidans-patches/commit/036953e1b9ffd75a53d56ffe841366e0b6e64c0c))
* **deps:** address review feedback on regex escaping, validation, and timeouts ([e4b1433](https://github.com/ihatenodejs/aidans-patches/commit/e4b14330db427ad05c32a970a7f1dd1c35ac8b63))
* **deps:** extend timeout for cli update test ([700737f](https://github.com/ihatenodejs/aidans-patches/commit/700737f2991ad01aff93f2206ff4699057fb7332))
* **deps:** fix scoped package parsing, PyPI regex, and CI targets (Plan 004) ([ee7b382](https://github.com/ihatenodejs/aidans-patches/commit/ee7b382d760f0928c4e32cea29168e88538a2413))
* **deps:** fixed scalar version fallback in proposal application ([0853a45](https://github.com/ihatenodejs/aidans-patches/commit/0853a45f3e6a327ebe4017b32d2c01d91f263ce6))
* **nhl:** address code review feedback on fetch destination mapping and preprocessor fallbacks ([c31bb3b](https://github.com/ihatenodejs/aidans-patches/commit/c31bb3bf3be4c5e09563efc128ad53865b75fa4c))
* **nhl:** fix adblock concurrency stalls, stream truncation, and request type filtering ([fc197a4](https://github.com/ihatenodejs/aidans-patches/commit/fc197a463254ff0dd8d75503e3d6a6b0760b56a5))
* **nhl:** neutralized ad insertion calls in pregame and boxscore ([830e8b3](https://github.com/ihatenodejs/aidans-patches/commit/830e8b3614e6754ed54d8c67b5c6966c3ef598c8))
* **nhl:** required concrete method implementations in patch lookups ([fd367ff](https://github.com/ihatenodejs/aidans-patches/commit/fd367ffd1c1457343d9e9dffc9deb9f1eafa98eb))
* **patches:** resolve Dalvik bytecode hazards in NHL, Adobe, and Credit Karma ([054f9ee](https://github.com/ihatenodejs/aidans-patches/commit/054f9ee10de7de9c5c8c7d3ca251d9a0e3f4aa00))
* **release:** format generated readme tables with prettier ([dba6e07](https://github.com/ihatenodejs/aidans-patches/commit/dba6e078da945cbf60e32a5198e53e4b75fc12e8))
* **site:** bind adobe scope to adobe-scan and untrap card stretch link ([d7164f4](https://github.com/ihatenodejs/aidans-patches/commit/d7164f4ac311242e5f4ef7f1fdd553dd685ba97b))
* **worker:** ensure consistent cache retention across permissions and media assets ([6cb897d](https://github.com/ihatenodejs/aidans-patches/commit/6cb897dd54e368785b5021b9b31cd83460de8e97))
* **worker:** retain cached screenshots and reviews on empty scrape responses ([28a80cb](https://github.com/ihatenodejs/aidans-patches/commit/28a80cbdae0d8848754b6f8003c5f296b636153e))

### ✨ New Features

* **adobe-reader:** added ad and tracking removal patches ([93dbab9](https://github.com/ihatenodejs/aidans-patches/commit/93dbab9b3ebd6e10a478cdc6742ed17c97e708d2))
* **adobe-scan:** added local premium patch and native pdf engine ([86a7fa2](https://github.com/ihatenodejs/aidans-patches/commit/86a7fa2cf6b3eda104a61b7535b1c44bc7f46558))
* **adobe-scan:** added password support for pdf export ([407b37e](https://github.com/ihatenodejs/aidans-patches/commit/407b37e16d502f90235d62a5ae6a8c9a1486cc95))
* **apk-lab:** added string analysis and manifest inspection tools ([4241876](https://github.com/ihatenodejs/aidans-patches/commit/4241876deefd9a37a23b84835df2136463fec5b2))
* **audit:** add domain filtering to verification orchestrator ([e59c8b6](https://github.com/ihatenodejs/aidans-patches/commit/e59c8b673d939b67bf0e3bee477c5b07d5b030bb))
* **audit:** add markdown formatting, linting, and link verification ([9e00213](https://github.com/ihatenodejs/aidans-patches/commit/9e0021385134bc5ba41e3b5a0a9c21b10df460ed))
* **canvas-student:** add hidden feature and privacy patches ([fa4576b](https://github.com/ihatenodejs/aidans-patches/commit/fa4576b02afa3b3f7e59fc5b42e1daa6072e2659))
* **canvas:** Added Canvas icon, name, and clone customization patches ([5ea7227](https://github.com/ihatenodejs/aidans-patches/commit/5ea7227cd58adad04d1f0d67e66feb92d03517a5))
* **canvas:** bumped supported Canvas Student version to 8.12.0 ([68998bf](https://github.com/ihatenodejs/aidans-patches/commit/68998bfbf470dd315b732c6c85975d999caec1f5))
* **credit-karma:** added tracking removal patch and documentation ([96c916e](https://github.com/ihatenodejs/aidans-patches/commit/96c916e88ce15dc4eb996c3250c7b07543d9dcc3))
* **deps:** added dependency inventory and policy management tooling ([62a13e6](https://github.com/ihatenodejs/aidans-patches/commit/62a13e689199a8841f699a7a162ca11f3ee476e8))
* **deps:** merge plan-004-execution into dev ([a5b48ac](https://github.com/ihatenodejs/aidans-patches/commit/a5b48acd94da5dc6e12a52df5ca660199950392c))
* **fizz:** added block update prompts patch ([4c9a989](https://github.com/ihatenodejs/aidans-patches/commit/4c9a989390af09a98b29cee26af439434a058f20))
* **nhl:** added native ad blocker and tracking neutralizers ([f0735bb](https://github.com/ihatenodejs/aidans-patches/commit/f0735bbc47213320355a86dfd318469c700e7300))
* **nhl:** added notification and live activity support ([6d7476d](https://github.com/ihatenodejs/aidans-patches/commit/6d7476da984e1b830aa7bfe40bff242787135960))
* **patches:** enabled dual companion resources in composite patches ([be89c4a](https://github.com/ihatenodejs/aidans-patches/commit/be89c4ae3f925ef4b4b5a38d12bce5ba63ead5ff))
* **patches:** updated telemetry options and regenerated catalog ([87d9ad5](https://github.com/ihatenodejs/aidans-patches/commit/87d9ad53fb69f96bd5f4d38d8d164535c1bde81b))
* **pro-metronome:** added pro unlock and tracking removal patches ([7261380](https://github.com/ihatenodejs/aidans-patches/commit/7261380e844ccd30946135e7d24364eb6e7d3a1c))
* **site:** added app store listings and screenshot rail component ([df9e621](https://github.com/ihatenodejs/aidans-patches/commit/df9e621f53388ef37059c349416964de3915dc7f))
* **worker:** added media asset and review reconciliation logic ([d5f4cd6](https://github.com/ihatenodejs/aidans-patches/commit/d5f4cd64c27ebc00f12601ba6387324385d32ea4))
* **worker:** added package version endpoint ([311667a](https://github.com/ihatenodejs/aidans-patches/commit/311667a9053143aa2e6f7604b07a0f981e5d431b))

## [1.9.0-dev.9](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.0-dev.8...v1.9.0-dev.9) (2026-11-20)

### ✨ New Features

* **canvas-student:** add hidden feature and privacy patches ([fa4576b](https://github.com/ihatenodejs/aidans-patches/commit/fa4576b02afa3b3f7e59fc5b42e1daa6072e2659))

## [1.9.0-dev.8](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.0-dev.7...v1.9.0-dev.8) (2026-11-20)

### ✨ New Features

* **canvas:** Added Canvas icon, name, and clone customization patches ([5ea7227](https://github.com/ihatenodejs/aidans-patches/commit/5ea7227cd58adad04d1f0d67e66feb92d03517a5))
* **canvas:** bumped supported Canvas Student version to 8.12.0 ([68998bf](https://github.com/ihatenodejs/aidans-patches/commit/68998bfbf470dd315b732c6c85975d999caec1f5))

## [1.9.0-dev.7](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.0-dev.6...v1.9.0-dev.7) (2026-10-24)

### 🐛 Bug Fixes

* **nhl:** required concrete method implementations in patch lookups ([fd367ff](https://github.com/ihatenodejs/aidans-patches/commit/fd367ffd1c1457343d9e9dffc9deb9f1eafa98eb))

### ✨ New Features

* **nhl:** added notification and live activity support ([6d7476d](https://github.com/ihatenodejs/aidans-patches/commit/6d7476da984e1b830aa7bfe40bff242787135960))

## [1.9.0-dev.6](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.0-dev.5...v1.9.0-dev.6) (2026-10-24)

### 🐛 Bug Fixes

* **adobe-scan:** switched worker process guard register to p1 ([9b7f4ca](https://github.com/ihatenodejs/aidans-patches/commit/9b7f4ca0286fb6a919388404154a5a8173e75a72))
* **apk-lab:** sanitize token prompt, validate accounts per-entry, track manifest tags, and support negative bounds ([e53cef8](https://github.com/ihatenodejs/aidans-patches/commit/e53cef8dae6fc54ef001925e07b63730d4ae70e7))
* **apk-lab:** scope manifest attributes, track indentation depth, and count account check failures ([45320f9](https://github.com/ihatenodejs/aidans-patches/commit/45320f931dfaf662623f5443daa2b2c8922425f9))
* **audit:** display stderr on prettier formatting failures ([55b757b](https://github.com/ihatenodejs/aidans-patches/commit/55b757b230e34219fb3c9ecc07174bca4d6fd560))
* **release:** format generated readme tables with prettier ([dba6e07](https://github.com/ihatenodejs/aidans-patches/commit/dba6e078da945cbf60e32a5198e53e4b75fc12e8))
* **site:** bind adobe scope to adobe-scan and untrap card stretch link ([d7164f4](https://github.com/ihatenodejs/aidans-patches/commit/d7164f4ac311242e5f4ef7f1fdd553dd685ba97b))
* **worker:** ensure consistent cache retention across permissions and media assets ([6cb897d](https://github.com/ihatenodejs/aidans-patches/commit/6cb897dd54e368785b5021b9b31cd83460de8e97))
* **worker:** retain cached screenshots and reviews on empty scrape responses ([28a80cb](https://github.com/ihatenodejs/aidans-patches/commit/28a80cbdae0d8848754b6f8003c5f296b636153e))

## [1.9.0-dev.5](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.0-dev.4...v1.9.0-dev.5) (2026-10-24)

### 🐛 Bug Fixes

* **adobe-reader:** resolve fragment lifecycle and in-app review task failure ([20d5e52](https://github.com/ihatenodejs/aidans-patches/commit/20d5e52561537a8935ba5839ebd6247f6de4b6a0))
* **adobe-scan:** add atomic ocr model extraction and validate presentation relationships ([54378d8](https://github.com/ihatenodejs/aidans-patches/commit/54378d86d468e5f7ed384baf8e758c3d7a7dcb67))
* **adobe-scan:** fix native JNI memory safety, asset file descriptors, and document export formats ([0a7dfc4](https://github.com/ihatenodejs/aidans-patches/commit/0a7dfc4e39d047ccbacab19ed0834ad0f0a72537))
* **deps:** address review feedback on regex escaping, validation, and timeouts ([e4b1433](https://github.com/ihatenodejs/aidans-patches/commit/e4b14330db427ad05c32a970a7f1dd1c35ac8b63))
* **deps:** fix scoped package parsing, PyPI regex, and CI targets (Plan 004) ([ee7b382](https://github.com/ihatenodejs/aidans-patches/commit/ee7b382d760f0928c4e32cea29168e88538a2413))
* **nhl:** address code review feedback on fetch destination mapping and preprocessor fallbacks ([c31bb3b](https://github.com/ihatenodejs/aidans-patches/commit/c31bb3bf3be4c5e09563efc128ad53865b75fa4c))
* **nhl:** fix adblock concurrency stalls, stream truncation, and request type filtering ([fc197a4](https://github.com/ihatenodejs/aidans-patches/commit/fc197a463254ff0dd8d75503e3d6a6b0760b56a5))
* **patches:** resolve Dalvik bytecode hazards in NHL, Adobe, and Credit Karma ([054f9ee](https://github.com/ihatenodejs/aidans-patches/commit/054f9ee10de7de9c5c8c7d3ca251d9a0e3f4aa00))

### ✨ New Features

* **deps:** merge plan-004-execution into dev ([a5b48ac](https://github.com/ihatenodejs/aidans-patches/commit/a5b48acd94da5dc6e12a52df5ca660199950392c))

## [1.9.0-dev.4](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.0-dev.3...v1.9.0-dev.4) (2026-10-24)

### ✨ New Features

* **fizz:** added block update prompts patch ([4c9a989](https://github.com/ihatenodejs/aidans-patches/commit/4c9a989390af09a98b29cee26af439434a058f20))
* **worker:** added package version endpoint ([311667a](https://github.com/ihatenodejs/aidans-patches/commit/311667a9053143aa2e6f7604b07a0f981e5d431b))

## [1.9.0-dev.3](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.0-dev.2...v1.9.0-dev.3) (2026-10-23)

### 🐛 Bug Fixes

* **adobe-scan:** deferred promotional neutralizers and pruned options ([cf4c77f](https://github.com/ihatenodejs/aidans-patches/commit/cf4c77f285377e76a2ce8a1ef791b0e7f84bc4f2))
* **adobe-scan:** disabled host pkg-config in native build ([8902907](https://github.com/ihatenodejs/aidans-patches/commit/89029070771cdb45fef49da9b636af18ef16d068))
* **adobe-scan:** hardened pdf engine operations and build packaging ([00f23d9](https://github.com/ihatenodejs/aidans-patches/commit/00f23d99fc9177b19252ac5c521e874f8ae90b8a))
* **adobe-scan:** preserve export password whitespace, refresh combine protection, and wrap zip streams ([528c6ac](https://github.com/ihatenodejs/aidans-patches/commit/528c6acebd942cb34a968638e68f634b01d4f751))
* **adobe-scan:** removed branch labels from preference hiding ([0d930cf](https://github.com/ihatenodejs/aidans-patches/commit/0d930cfacdab0561ccb6870b35407a549054b8ce))
* **audit:** tracked cmake configure duration and preserved failure status ([036953e](https://github.com/ihatenodejs/aidans-patches/commit/036953e1b9ffd75a53d56ffe841366e0b6e64c0c))
* **deps:** extend timeout for cli update test ([700737f](https://github.com/ihatenodejs/aidans-patches/commit/700737f2991ad01aff93f2206ff4699057fb7332))
* **deps:** fixed scalar version fallback in proposal application ([0853a45](https://github.com/ihatenodejs/aidans-patches/commit/0853a45f3e6a327ebe4017b32d2c01d91f263ce6))

### ✨ New Features

* **adobe-scan:** added local premium patch and native pdf engine ([86a7fa2](https://github.com/ihatenodejs/aidans-patches/commit/86a7fa2cf6b3eda104a61b7535b1c44bc7f46558))
* **adobe-scan:** added password support for pdf export ([407b37e](https://github.com/ihatenodejs/aidans-patches/commit/407b37e16d502f90235d62a5ae6a8c9a1486cc95))
* **audit:** add domain filtering to verification orchestrator ([e59c8b6](https://github.com/ihatenodejs/aidans-patches/commit/e59c8b673d939b67bf0e3bee477c5b07d5b030bb))
* **audit:** add markdown formatting, linting, and link verification ([9e00213](https://github.com/ihatenodejs/aidans-patches/commit/9e0021385134bc5ba41e3b5a0a9c21b10df460ed))
* **patches:** enabled dual companion resources in composite patches ([be89c4a](https://github.com/ihatenodejs/aidans-patches/commit/be89c4ae3f925ef4b4b5a38d12bce5ba63ead5ff))

## [1.9.0-dev.2](https://github.com/ihatenodejs/aidans-patches/compare/v1.9.0-dev.1...v1.9.0-dev.2) (2026-10-21)

### 🐛 Bug Fixes

* **nhl:** neutralized ad insertion calls in pregame and boxscore ([830e8b3](https://github.com/ihatenodejs/aidans-patches/commit/830e8b3614e6754ed54d8c67b5c6966c3ef598c8))

## [1.9.0-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.8.0...v1.9.0-dev.1) (2026-10-18)

### ✨ New Features

* **adobe-reader:** added ad and tracking removal patches ([93dbab9](https://github.com/ihatenodejs/aidans-patches/commit/93dbab9b3ebd6e10a478cdc6742ed17c97e708d2))
* **apk-lab:** added string analysis and manifest inspection tools ([4241876](https://github.com/ihatenodejs/aidans-patches/commit/4241876deefd9a37a23b84835df2136463fec5b2))
* **credit-karma:** added tracking removal patch and documentation ([96c916e](https://github.com/ihatenodejs/aidans-patches/commit/96c916e88ce15dc4eb996c3250c7b07543d9dcc3))
* **deps:** added dependency inventory and policy management tooling ([62a13e6](https://github.com/ihatenodejs/aidans-patches/commit/62a13e689199a8841f699a7a162ca11f3ee476e8))
* **nhl:** added native ad blocker and tracking neutralizers ([f0735bb](https://github.com/ihatenodejs/aidans-patches/commit/f0735bbc47213320355a86dfd318469c700e7300))
* **patches:** updated telemetry options and regenerated catalog ([87d9ad5](https://github.com/ihatenodejs/aidans-patches/commit/87d9ad53fb69f96bd5f4d38d8d164535c1bde81b))
* **pro-metronome:** added pro unlock and tracking removal patches ([7261380](https://github.com/ihatenodejs/aidans-patches/commit/7261380e844ccd30946135e7d24364eb6e7d3a1c))
* **site:** added app store listings and screenshot rail component ([df9e621](https://github.com/ihatenodejs/aidans-patches/commit/df9e621f53388ef37059c349416964de3915dc7f))
* **worker:** added media asset and review reconciliation logic ([d5f4cd6](https://github.com/ihatenodejs/aidans-patches/commit/d5f4cd64c27ebc00f12601ba6387324385d32ea4))

## [1.8.0](https://github.com/ihatenodejs/aidans-patches/compare/v1.7.0...v1.8.0) (2026-10-17)

### 🐛 Bug Fixes

* **apk-lab:** prevented overwriting input artifact during deploy ([0275070](https://github.com/ihatenodejs/aidans-patches/commit/0275070f7b758809063d82ef062bd61ef99d63dc))
* **apk-lab:** validate move-result variants and invoke producers ([823def9](https://github.com/ihatenodejs/aidans-patches/commit/823def9784b437dd180ce4342d6c796704eb482e))
* **ci:** revert 5412f299237e486590dab6e8dda1e89ba6419150 ([dbffd82](https://github.com/ihatenodejs/aidans-patches/commit/dbffd8207faeaeb6a061d539a3361d5a41bf29f2))
* **geocaching:** sanitized loaded caches and fixed fallback enrichment ([de0a05b](https://github.com/ihatenodejs/aidans-patches/commit/de0a05b936420b8d5c908fb03f19ac2197120d45))
* **hermes:** corrected large function header offset decoding in bundle editor ([64bbd82](https://github.com/ihatenodejs/aidans-patches/commit/64bbd827e9e54e3bb8fb0488cabbeda5b9da0bb5))
* **nhl:** corrected developer settings gate to return false ([b555a5f](https://github.com/ihatenodejs/aidans-patches/commit/b555a5f4cfef68921be08d7de3e7c401b9ff77ec))
* **nhl:** preserve synthetic default matching for Blaze analytics ([b6bd2b2](https://github.com/ihatenodejs/aidans-patches/commit/b6bd2b2b6ddb99d6a7ef9e5c284fba32ea1eb536))
* **nhl:** validated patch targets and patched all constructor returns ([5c3b57b](https://github.com/ihatenodejs/aidans-patches/commit/5c3b57b13ed725c04f44d76f32000aa05c7cec01))
* **worker:** use utf-16 code-unit order for monitored apps catalog ([964e01f](https://github.com/ihatenodejs/aidans-patches/commit/964e01f00da67982c7c259ced8a797f3449c09cc))

### ✨ New Features

* **365pay:** add support for 365 pay ([52cd8a5](https://github.com/ihatenodejs/aidans-patches/commit/52cd8a5805cd84f1aab098a48ad774ff55c3dec8))
* **365pay:** added display cutout adaptation patch ([be08c95](https://github.com/ihatenodejs/aidans-patches/commit/be08c954996edfaf0c310f99d4b5f6a0b6b0402a))
* **365pay:** expanded telemetry removal for crashlytics branch and onesignal ([1b11aee](https://github.com/ihatenodejs/aidans-patches/commit/1b11aeec83f2b15eff069d97f93ba5084b7889a8))
* **adobe-scan:** added compress pdf removal and card action cleanup ([ea76005](https://github.com/ihatenodejs/aidans-patches/commit/ea760053cb44a96d20de4e55736f0edf6027cfc9))
* **adobe-scan:** added remove attribution patch ([726f4f4](https://github.com/ihatenodejs/aidans-patches/commit/726f4f4ae2526707581faf8f285eb63feb57c282))
* **apk-lab:** add crash-trace command to harvest device exceptions ([d99b76d](https://github.com/ihatenodejs/aidans-patches/commit/d99b76d38c6eacae0a117eb0083652366f0bb708))
* **apk-lab:** add decompiled smali resolution to crash trace reports ([670d76b](https://github.com/ihatenodejs/aidans-patches/commit/670d76b213538a21048a65274f5f219c23431ec8))
* **apk-lab:** add text value search and graceful split handling to res command ([a1039e1](https://github.com/ihatenodejs/aidans-patches/commit/a1039e1464665eb4c5dceb5cd7afbb09a7148fb3))
* **apk-lab:** add unified dev iteration command ([931406c](https://github.com/ihatenodejs/aidans-patches/commit/931406c2a610827376c970c7dedc88e9b5924eee))
* **apk-lab:** added keystore option to deploy command ([7091327](https://github.com/ihatenodejs/aidans-patches/commit/7091327309f7c1977df9b1fa7d6fc6335cd5784c))
* **apk-lab:** support automatic keystore negotiation and custom credentials ([419a89c](https://github.com/ihatenodejs/aidans-patches/commit/419a89c03f5beca4d980b053a05da87f146a7759))
* **apk-lab:** validate register aliasing and move-result sequences ([93aa649](https://github.com/ihatenodejs/aidans-patches/commit/93aa649f56c5651402c163c6f3b1c33620be5a32))
* **audit:** add phase and full-suite summary formatting ([1ff79c4](https://github.com/ihatenodejs/aidans-patches/commit/1ff79c4993fb112a2981e30d3a8fe8b4e96ec2ee))
* **geocaching:** added cookie support and pmo fallback to bridge ([015ace0](https://github.com/ihatenodejs/aidans-patches/commit/015ace068cb8c819e2a5715cc3133e1c9b226043))
* **geocaching:** added public cache data enrichment fallback ([32b5d14](https://github.com/ihatenodejs/aidans-patches/commit/32b5d148cbdbc9c8677f9995c99ba43d380c57e3))
* **geocaching:** added warning banner on PMO caches ([6f9e5ee](https://github.com/ihatenodejs/aidans-patches/commit/6f9e5eee94b0d991ffcd679da889867b72b5d8b9))
* **nhl:** added patches for ads, tracking, and hidden features ([5f33a90](https://github.com/ihatenodejs/aidans-patches/commit/5f33a9086d352a2906ef4814a68c70be5ef88d20))
* **play-metadata:** added enrichment pipeline and app detail views ([75f97e3](https://github.com/ihatenodejs/aidans-patches/commit/75f97e3fb9a13c4d526252a520e20ef4a4b4e8fb))
* **site/components:** added developer menu card and phone preview ([60aa338](https://github.com/ihatenodejs/aidans-patches/commit/60aa338faeda1a53bb73f5f92db66774d0d11d40))
* **site:** added app catalog and play store metadata support ([f42bb98](https://github.com/ihatenodejs/aidans-patches/commit/f42bb9805a623e62cdb78ae7bb39296e7760b3fc))
* **site:** redesigned landing page and ui components ([9f23004](https://github.com/ihatenodejs/aidans-patches/commit/9f23004674b9ea810b32eb0dffc1f7f7837e3e96))
* **worker:** added aggregate and per-package test passing badges ([5c46b59](https://github.com/ihatenodejs/aidans-patches/commit/5c46b596e6ad567b40b03188b46bcb494e2df61c))
* **worker:** added GITHUB_TOKEN support to download statistics ([a6d630f](https://github.com/ihatenodejs/aidans-patches/commit/a6d630f67851b7f53a7a129b7e474f22c8544a09))

## [1.8.0-dev.9](https://github.com/ihatenodejs/aidans-patches/compare/v1.8.0-dev.8...v1.8.0-dev.9) (2026-10-17)

### ✨ New Features

* **geocaching:** added warning banner on PMO caches ([6f9e5ee](https://github.com/ihatenodejs/aidans-patches/commit/6f9e5eee94b0d991ffcd679da889867b72b5d8b9))
* **worker:** added GITHUB_TOKEN support to download statistics ([a6d630f](https://github.com/ihatenodejs/aidans-patches/commit/a6d630f67851b7f53a7a129b7e474f22c8544a09))

## [1.8.0-dev.8](https://github.com/ihatenodejs/aidans-patches/compare/v1.8.0-dev.7...v1.8.0-dev.8) (2026-10-16)

### 🐛 Bug Fixes

* **apk-lab:** prevented overwriting input artifact during deploy ([0275070](https://github.com/ihatenodejs/aidans-patches/commit/0275070f7b758809063d82ef062bd61ef99d63dc))

### ✨ New Features

* **apk-lab:** add decompiled smali resolution to crash trace reports ([670d76b](https://github.com/ihatenodejs/aidans-patches/commit/670d76b213538a21048a65274f5f219c23431ec8))
* **apk-lab:** add text value search and graceful split handling to res command ([a1039e1](https://github.com/ihatenodejs/aidans-patches/commit/a1039e1464665eb4c5dceb5cd7afbb09a7148fb3))
* **apk-lab:** add unified dev iteration command ([931406c](https://github.com/ihatenodejs/aidans-patches/commit/931406c2a610827376c970c7dedc88e9b5924eee))
* **apk-lab:** added keystore option to deploy command ([7091327](https://github.com/ihatenodejs/aidans-patches/commit/7091327309f7c1977df9b1fa7d6fc6335cd5784c))
* **apk-lab:** support automatic keystore negotiation and custom credentials ([419a89c](https://github.com/ihatenodejs/aidans-patches/commit/419a89c03f5beca4d980b053a05da87f146a7759))
* **geocaching:** added cookie support and pmo fallback to bridge ([015ace0](https://github.com/ihatenodejs/aidans-patches/commit/015ace068cb8c819e2a5715cc3133e1c9b226043))

## [1.8.0-dev.7](https://github.com/ihatenodejs/aidans-patches/compare/v1.8.0-dev.6...v1.8.0-dev.7) (2026-10-16)

### 🐛 Bug Fixes

* **ci:** revert 5412f299237e486590dab6e8dda1e89ba6419150 ([dbffd82](https://github.com/ihatenodejs/aidans-patches/commit/dbffd8207faeaeb6a061d539a3361d5a41bf29f2))
* **geocaching:** sanitized loaded caches and fixed fallback enrichment ([de0a05b](https://github.com/ihatenodejs/aidans-patches/commit/de0a05b936420b8d5c908fb03f19ac2197120d45))

### ✨ New Features

* **geocaching:** added public cache data enrichment fallback ([32b5d14](https://github.com/ihatenodejs/aidans-patches/commit/32b5d148cbdbc9c8677f9995c99ba43d380c57e3))

## [1.8.0-dev.6](https://github.com/ihatenodejs/aidans-patches/compare/v1.8.0-dev.5...v1.8.0-dev.6) (2026-10-16)

### 🐛 Bug Fixes

* **apk-lab:** validate move-result variants and invoke producers ([823def9](https://github.com/ihatenodejs/aidans-patches/commit/823def9784b437dd180ce4342d6c796704eb482e))
* **nhl:** preserve synthetic default matching for Blaze analytics ([b6bd2b2](https://github.com/ihatenodejs/aidans-patches/commit/b6bd2b2b6ddb99d6a7ef9e5c284fba32ea1eb536))
* **worker:** use utf-16 code-unit order for monitored apps catalog ([964e01f](https://github.com/ihatenodejs/aidans-patches/commit/964e01f00da67982c7c259ced8a797f3449c09cc))

### ✨ New Features

* **apk-lab:** add crash-trace command to harvest device exceptions ([d99b76d](https://github.com/ihatenodejs/aidans-patches/commit/d99b76d38c6eacae0a117eb0083652366f0bb708))
* **apk-lab:** validate register aliasing and move-result sequences ([93aa649](https://github.com/ihatenodejs/aidans-patches/commit/93aa649f56c5651402c163c6f3b1c33620be5a32))
* **audit:** add phase and full-suite summary formatting ([1ff79c4](https://github.com/ihatenodejs/aidans-patches/commit/1ff79c4993fb112a2981e30d3a8fe8b4e96ec2ee))

## [1.8.0-dev.5](https://github.com/ihatenodejs/aidans-patches/compare/v1.8.0-dev.4...v1.8.0-dev.5) (2026-10-16)

### ✨ New Features

* **adobe-scan:** added compress pdf removal and card action cleanup ([ea76005](https://github.com/ihatenodejs/aidans-patches/commit/ea760053cb44a96d20de4e55736f0edf6027cfc9))
* **play-metadata:** added enrichment pipeline and app detail views ([75f97e3](https://github.com/ihatenodejs/aidans-patches/commit/75f97e3fb9a13c4d526252a520e20ef4a4b4e8fb))
* **site/components:** added developer menu card and phone preview ([60aa338](https://github.com/ihatenodejs/aidans-patches/commit/60aa338faeda1a53bb73f5f92db66774d0d11d40))
* **site:** added app catalog and play store metadata support ([f42bb98](https://github.com/ihatenodejs/aidans-patches/commit/f42bb9805a623e62cdb78ae7bb39296e7760b3fc))

## [1.8.0-dev.4](https://github.com/ihatenodejs/aidans-patches/compare/v1.8.0-dev.3...v1.8.0-dev.4) (2026-10-14)

### 🐛 Bug Fixes

* **nhl:** corrected developer settings gate to return false ([b555a5f](https://github.com/ihatenodejs/aidans-patches/commit/b555a5f4cfef68921be08d7de3e7c401b9ff77ec))

### ✨ New Features

* **365pay:** added display cutout adaptation patch ([be08c95](https://github.com/ihatenodejs/aidans-patches/commit/be08c954996edfaf0c310f99d4b5f6a0b6b0402a))

## [1.8.0-dev.3](https://github.com/ihatenodejs/aidans-patches/compare/v1.8.0-dev.2...v1.8.0-dev.3) (2026-10-14)

### 🐛 Bug Fixes

* **hermes:** corrected large function header offset decoding in bundle editor ([64bbd82](https://github.com/ihatenodejs/aidans-patches/commit/64bbd827e9e54e3bb8fb0488cabbeda5b9da0bb5))

### ✨ New Features

* **365pay:** add support for 365 pay ([52cd8a5](https://github.com/ihatenodejs/aidans-patches/commit/52cd8a5805cd84f1aab098a48ad774ff55c3dec8))
* **365pay:** expanded telemetry removal for crashlytics branch and onesignal ([1b11aee](https://github.com/ihatenodejs/aidans-patches/commit/1b11aeec83f2b15eff069d97f93ba5084b7889a8))

## [1.8.0-dev.2](https://github.com/ihatenodejs/aidans-patches/compare/v1.8.0-dev.1...v1.8.0-dev.2) (2026-10-14)

### 🐛 Bug Fixes

* **nhl:** validated patch targets and patched all constructor returns ([5c3b57b](https://github.com/ihatenodejs/aidans-patches/commit/5c3b57b13ed725c04f44d76f32000aa05c7cec01))

### ✨ New Features

* **nhl:** added patches for ads, tracking, and hidden features ([5f33a90](https://github.com/ihatenodejs/aidans-patches/commit/5f33a9086d352a2906ef4814a68c70be5ef88d20))

## [1.8.0-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.7.0...v1.8.0-dev.1) (2026-10-13)

### ✨ New Features

* **adobe-scan:** added remove attribution patch ([726f4f4](https://github.com/ihatenodejs/aidans-patches/commit/726f4f4ae2526707581faf8f285eb63feb57c282))

## [1.7.0](https://github.com/ihatenodejs/aidans-patches/compare/v1.6.0...v1.7.0) (2026-10-13)

### 🐛 Bug Fixes

* **geocaching:** neutralized server sync for experimental features ([ab635cb](https://github.com/ihatenodejs/aidans-patches/commit/ab635cb6170d5ba5fb1e821f4f5e2c9c4e59c7b2))
* **release:** update bun lockfile for semantic-release github plugin ([cea934f](https://github.com/ihatenodejs/aidans-patches/commit/cea934f8955192f773b46ea402fed80045e8c641))
* **site:** prevented linking prior workflow run url on queued badges ([97c50a9](https://github.com/ihatenodejs/aidans-patches/commit/97c50a92aa8eb35ba0039d3487246db23893c3c1))

### ✨ New Features

* **geocaching:** added developer tools patch and experimental toggles ([e99ec24](https://github.com/ihatenodejs/aidans-patches/commit/e99ec24ffaf7b78e5b1adfc0e4e68d1fbbabd8c9))
* **geocaching:** added experimental map sheet support for osm styles ([1f29c32](https://github.com/ihatenodejs/aidans-patches/commit/1f29c327d9c847bc34cad0dbb7970b331d0375e5))
* **sidelineswap:** added remove invite friends patch ([04328a9](https://github.com/ihatenodejs/aidans-patches/commit/04328a924ddd04de690da61b7b3937adbb26d789))
* **site:** added ViewMoreAppsCard and Crosshair components ([b66cb3d](https://github.com/ihatenodejs/aidans-patches/commit/b66cb3d1d7746bc24ad4f5964d4cbbfc0cc5a4e2))

## [1.7.0-dev.3](https://github.com/ihatenodejs/aidans-patches/compare/v1.7.0-dev.2...v1.7.0-dev.3) (2026-10-13)

### ✨ New Features

* **geocaching:** added developer tools patch and experimental toggles ([e99ec24](https://github.com/ihatenodejs/aidans-patches/commit/e99ec24ffaf7b78e5b1adfc0e4e68d1fbbabd8c9))

## [1.7.0-dev.2](https://github.com/ihatenodejs/aidans-patches/compare/v1.7.0-dev.1...v1.7.0-dev.2) (2026-10-13)

### 🐛 Bug Fixes

* **site:** prevented linking prior workflow run url on queued badges ([97c50a9](https://github.com/ihatenodejs/aidans-patches/commit/97c50a92aa8eb35ba0039d3487246db23893c3c1))

### ✨ New Features

* **sidelineswap:** added remove invite friends patch ([04328a9](https://github.com/ihatenodejs/aidans-patches/commit/04328a924ddd04de690da61b7b3937adbb26d789))

## [1.7.0-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.6.1-dev.1...v1.7.0-dev.1) (2026-10-12)

### 🐛 Bug Fixes

* **release:** update bun lockfile for semantic-release github plugin ([cea934f](https://github.com/ihatenodejs/aidans-patches/commit/cea934f8955192f773b46ea402fed80045e8c641))

### ✨ New Features

* **geocaching:** added experimental map sheet support for osm styles ([1f29c32](https://github.com/ihatenodejs/aidans-patches/commit/1f29c327d9c847bc34cad0dbb7970b331d0375e5))

## [1.6.1-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.6.0...v1.6.1-dev.1) (2026-10-12)

### 🐛 Bug Fixes

* **geocaching:** neutralized server sync for experimental features ([ab635cb](https://github.com/ihatenodejs/aidans-patches/commit/ab635cb6170d5ba5fb1e821f4f5e2c9c4e59c7b2))

### ✨ New Features

* **site:** added ViewMoreAppsCard and Crosshair components ([b66cb3d](https://github.com/ihatenodejs/aidans-patches/commit/b66cb3d1d7746bc24ad4f5964d4cbbfc0cc5a4e2))

## [1.7.0-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.6.0...v1.7.0-dev.1) (2026-10-12)

### ✨ New Features

* **site:** added ViewMoreAppsCard and Crosshair components ([b66cb3d](https://github.com/ihatenodejs/aidans-patches/commit/b66cb3d1d7746bc24ad4f5964d4cbbfc0cc5a4e2))

## [1.6.0](https://github.com/ihatenodejs/aidans-patches/compare/v1.5.1...v1.6.0) (2026-10-11)

### 🐛 Bug Fixes

* **apk-lab:** allowed jadx exit code 3 during analysis ([bf848ba](https://github.com/ihatenodejs/aidans-patches/commit/bf848ba47fc3b20f6de605cffe3896ed13ca2d8a))
* **audit:** address review comments ([a28833d](https://github.com/ihatenodejs/aidans-patches/commit/a28833d7d2ed7458560a8444244898dba7c5abf9))
* **audit:** resolve post-merge quality gates, formatting, and task dependencies ([43be30e](https://github.com/ihatenodejs/aidans-patches/commit/43be30e5c3e25ef9dc939ad6ebedd297c7ff872a))
* **ci:** reported terminal status to worker on pipeline failures ([9deac83](https://github.com/ihatenodejs/aidans-patches/commit/9deac838c87151580b8b71aa3b78ebeb38032107))
* **ci:** resolve nitpick comments ([50b19a9](https://github.com/ihatenodejs/aidans-patches/commit/50b19a9a848a5b2afb50bfb3221014b26062bb8f))
* **ci:** set User-Agent in compatibility submission and reuse acquired artifact for target check if version matches ([8384ed1](https://github.com/ihatenodejs/aidans-patches/commit/8384ed122976fa1cd99f094cec9fb37886cc5f62))
* **geocaching:** removed server-dependent profile statistics in local premium patch ([ee9aa13](https://github.com/ihatenodejs/aidans-patches/commit/ee9aa134b6459452b30b80fc68a89892c330f3bf))
* **patches/main:** fixed geocaching navigation map loading and MapLibre routing ([76f393e](https://github.com/ihatenodejs/aidans-patches/commit/76f393e8215354631a166145ad74146153f81f8c))
* **site:** corrected test verification scope on status page ([1c9d6a4](https://github.com/ihatenodejs/aidans-patches/commit/1c9d6a40fa8a63187a6a65e067726bd23323be88))
* **tools/apk-lab:** fixed anr package matching and smali validation ([63e2b11](https://github.com/ihatenodejs/aidans-patches/commit/63e2b1178a6d82256c792be6bb3835de7472468d))
* **tools/apk-lab:** fixed inspection, monitoring, and smali edge cases ([15c5aaa](https://github.com/ihatenodejs/aidans-patches/commit/15c5aaa701d42025a63ada5e5d8fd41d15811355))
* **worker:** reduced outstanding request ttl to one scrape cycle ([9eaf4fd](https://github.com/ihatenodejs/aidans-patches/commit/9eaf4fded0cb188e056b6858edbad5a52d9a623e))

### ✨ New Features

* **compatibility:** Added APKMirror fallback and missing-APK status ([fc536ae](https://github.com/ihatenodejs/aidans-patches/commit/fc536ae5dcfaaac2b81b31d11591c83b6f18230e))
* **compatibility:** added push matrix runs and failure stage tracking ([7f07e44](https://github.com/ihatenodejs/aidans-patches/commit/7f07e44e5a4718075cd4a0ba3d674d5570eeefb3))
* **geocaching:** added client-side map filtering and search fixes ([ff953c8](https://github.com/ihatenodejs/aidans-patches/commit/ff953c856a95cbcb7cacdd0ac6fed33dbc10a839))
* **geocaching:** added OpenStreetMap style switching and previews ([b4bc94a](https://github.com/ihatenodejs/aidans-patches/commit/b4bc94a5ffb68b797fce644863cff850851cef67))
* **geocaching:** added support and patches for Geocaching ([e9c822a](https://github.com/ihatenodejs/aidans-patches/commit/e9c822a62be2046c41cac8e4719cdd0d791ea16f))
* **patches/main:** Added Geocaching Shop removal patch ([310ceb1](https://github.com/ihatenodejs/aidans-patches/commit/310ceb1a3fc3e242e93c5be2b5155dbb10db6b6c))
* **site:** added app name filtering to patch search ([b0a8796](https://github.com/ihatenodejs/aidans-patches/commit/b0a879641e8d09d2d6c131b11c5b46e937592081))
* **tools/apk-lab:** added deploy, monitor, and APK inspection commands ([fea8c0c](https://github.com/ihatenodejs/aidans-patches/commit/fea8c0cec079e21f18227e86a5f9f9fa1df17686))
* **worker:** added release download statistics and SVG chart endpoints ([60fafd7](https://github.com/ihatenodejs/aidans-patches/commit/60fafd7c57cf97862b1bd4de99bce8cd1d34f77e))

## [1.6.0-dev.6](https://github.com/ihatenodejs/aidans-patches/compare/v1.6.0-dev.5...v1.6.0-dev.6) (2026-10-11)

### ✨ New Features

* **worker:** added release download statistics and SVG chart endpoints ([60fafd7](https://github.com/ihatenodejs/aidans-patches/commit/60fafd7c57cf97862b1bd4de99bce8cd1d34f77e))

## [1.6.0-dev.5](https://github.com/ihatenodejs/aidans-patches/compare/v1.6.0-dev.4...v1.6.0-dev.5) (2026-10-11)

### 🐛 Bug Fixes

* **geocaching:** removed server-dependent profile statistics in local premium patch ([ee9aa13](https://github.com/ihatenodejs/aidans-patches/commit/ee9aa134b6459452b30b80fc68a89892c330f3bf))

## [1.6.0-dev.4](https://github.com/ihatenodejs/aidans-patches/compare/v1.6.0-dev.3...v1.6.0-dev.4) (2026-10-11)

### 🐛 Bug Fixes

* **patches/main:** fixed geocaching navigation map loading and MapLibre routing ([76f393e](https://github.com/ihatenodejs/aidans-patches/commit/76f393e8215354631a166145ad74146153f81f8c))

## [1.6.0-dev.3](https://github.com/ihatenodejs/aidans-patches/compare/v1.6.0-dev.2...v1.6.0-dev.3) (2026-10-10)

### 🐛 Bug Fixes

* **tools/apk-lab:** fixed anr package matching and smali validation ([63e2b11](https://github.com/ihatenodejs/aidans-patches/commit/63e2b1178a6d82256c792be6bb3835de7472468d))
* **tools/apk-lab:** fixed inspection, monitoring, and smali edge cases ([15c5aaa](https://github.com/ihatenodejs/aidans-patches/commit/15c5aaa701d42025a63ada5e5d8fd41d15811355))

### ✨ New Features

* **tools/apk-lab:** added deploy, monitor, and APK inspection commands ([fea8c0c](https://github.com/ihatenodejs/aidans-patches/commit/fea8c0cec079e21f18227e86a5f9f9fa1df17686))

## [1.6.0-dev.2](https://github.com/ihatenodejs/aidans-patches/compare/v1.6.0-dev.1...v1.6.0-dev.2) (2026-10-10)

### 🐛 Bug Fixes

* **apk-lab:** allowed jadx exit code 3 during analysis ([bf848ba](https://github.com/ihatenodejs/aidans-patches/commit/bf848ba47fc3b20f6de605cffe3896ed13ca2d8a))
* **audit:** resolve post-merge quality gates, formatting, and task dependencies ([43be30e](https://github.com/ihatenodejs/aidans-patches/commit/43be30e5c3e25ef9dc939ad6ebedd297c7ff872a))

### ✨ New Features

* **geocaching:** added client-side map filtering and search fixes ([ff953c8](https://github.com/ihatenodejs/aidans-patches/commit/ff953c856a95cbcb7cacdd0ac6fed33dbc10a839))
* **geocaching:** added OpenStreetMap style switching and previews ([b4bc94a](https://github.com/ihatenodejs/aidans-patches/commit/b4bc94a5ffb68b797fce644863cff850851cef67))
* **geocaching:** added support and patches for Geocaching ([e9c822a](https://github.com/ihatenodejs/aidans-patches/commit/e9c822a62be2046c41cac8e4719cdd0d791ea16f))
* **patches/main:** Added Geocaching Shop removal patch ([310ceb1](https://github.com/ihatenodejs/aidans-patches/commit/310ceb1a3fc3e242e93c5be2b5155dbb10db6b6c))

## [1.6.0-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.5.1...v1.6.0-dev.1) (2026-10-09)

### 🐛 Bug Fixes

* **audit:** address review comments ([a28833d](https://github.com/ihatenodejs/aidans-patches/commit/a28833d7d2ed7458560a8444244898dba7c5abf9))
* **ci:** reported terminal status to worker on pipeline failures ([9deac83](https://github.com/ihatenodejs/aidans-patches/commit/9deac838c87151580b8b71aa3b78ebeb38032107))
* **ci:** resolve nitpick comments ([50b19a9](https://github.com/ihatenodejs/aidans-patches/commit/50b19a9a848a5b2afb50bfb3221014b26062bb8f))
* **ci:** set User-Agent in compatibility submission and reuse acquired artifact for target check if version matches ([8384ed1](https://github.com/ihatenodejs/aidans-patches/commit/8384ed122976fa1cd99f094cec9fb37886cc5f62))
* **site:** corrected test verification scope on status page ([1c9d6a4](https://github.com/ihatenodejs/aidans-patches/commit/1c9d6a40fa8a63187a6a65e067726bd23323be88))
* **worker:** reduced outstanding request ttl to one scrape cycle ([9eaf4fd](https://github.com/ihatenodejs/aidans-patches/commit/9eaf4fded0cb188e056b6858edbad5a52d9a623e))

### ✨ New Features

* **compatibility:** Added APKMirror fallback and missing-APK status ([fc536ae](https://github.com/ihatenodejs/aidans-patches/commit/fc536ae5dcfaaac2b81b31d11591c83b6f18230e))
* **compatibility:** added push matrix runs and failure stage tracking ([7f07e44](https://github.com/ihatenodejs/aidans-patches/commit/7f07e44e5a4718075cd4a0ba3d674d5570eeefb3))
* **site:** added app name filtering to patch search ([b0a8796](https://github.com/ihatenodejs/aidans-patches/commit/b0a879641e8d09d2d6c131b11c5b46e937592081))

## [1.5.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.5.0...v1.5.1) (2026-10-09)

### 🐛 Bug Fixes

* **ci:** set User-Agent in compatibility submission and reuse acquired artifact for target check if version matches ([1901351](https://github.com/ihatenodejs/aidans-patches/commit/1901351bfddb604a4674695a86d9826f6a0a0caf))

## [1.5.0-dev.3](https://github.com/ihatenodejs/aidans-patches/compare/v1.5.0-dev.2...v1.5.0-dev.3) (2026-10-09)

### 🐛 Bug Fixes

* **audit:** address review comments ([a28833d](https://github.com/ihatenodejs/aidans-patches/commit/a28833d7d2ed7458560a8444244898dba7c5abf9))
* **ci:** reported terminal status to worker on pipeline failures ([9deac83](https://github.com/ihatenodejs/aidans-patches/commit/9deac838c87151580b8b71aa3b78ebeb38032107))
* **ci:** resolve nitpick comments ([50b19a9](https://github.com/ihatenodejs/aidans-patches/commit/50b19a9a848a5b2afb50bfb3221014b26062bb8f))
* **ci:** set User-Agent in compatibility submission and reuse acquired artifact for target check if version matches ([8384ed1](https://github.com/ihatenodejs/aidans-patches/commit/8384ed122976fa1cd99f094cec9fb37886cc5f62))
* **site:** corrected test verification scope on status page ([1c9d6a4](https://github.com/ihatenodejs/aidans-patches/commit/1c9d6a40fa8a63187a6a65e067726bd23323be88))
* **worker:** reduced outstanding request ttl to one scrape cycle ([9eaf4fd](https://github.com/ihatenodejs/aidans-patches/commit/9eaf4fded0cb188e056b6858edbad5a52d9a623e))

### ✨ New Features

* **compatibility:** Added APKMirror fallback and missing-APK status ([fc536ae](https://github.com/ihatenodejs/aidans-patches/commit/fc536ae5dcfaaac2b81b31d11591c83b6f18230e))
* **compatibility:** added push matrix runs and failure stage tracking ([7f07e44](https://github.com/ihatenodejs/aidans-patches/commit/7f07e44e5a4718075cd4a0ba3d674d5570eeefb3))
* **site:** added app name filtering to patch search ([b0a8796](https://github.com/ihatenodejs/aidans-patches/commit/b0a879641e8d09d2d6c131b11c5b46e937592081))

## [1.5.0-dev.2](https://github.com/ihatenodejs/aidans-patches/compare/v1.5.0-dev.1...v1.5.0-dev.2) (2026-10-09)

### 🐛 Bug Fixes

* **site:** clean up status page, worker, and apk lab ([#16](https://github.com/ihatenodejs/aidans-patches/issues/16)) ([a666f02](https://github.com/ihatenodejs/aidans-patches/commit/a666f02c74b7c2a5f2d716df0a94f38ec127624c))

## [1.5.0](https://github.com/ihatenodejs/aidans-patches/compare/v1.4.0...v1.5.0) (2026-10-09)

### 🐛 Bug Fixes

* **site:** clean up status page, worker, and apk lab ([#16](https://github.com/ihatenodejs/aidans-patches/issues/16)) ([a666f02](https://github.com/ihatenodejs/aidans-patches/commit/a666f02c74b7c2a5f2d716df0a94f38ec127624c))

### ✨ New Features

* **sezzle:** Added subscription removal patch and shortcut toggle ([47801e6](https://github.com/ihatenodejs/aidans-patches/commit/47801e691eca3274ceb00d21ac43932a48ca5545))

## [1.5.0-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.4.0...v1.5.0-dev.1) (2026-10-09)

### ✨ New Features

* **sezzle:** Added subscription removal patch and shortcut toggle ([47801e6](https://github.com/ihatenodejs/aidans-patches/commit/47801e691eca3274ceb00d21ac43932a48ca5545))

## [1.4.0](https://github.com/ihatenodejs/aidans-patches/compare/v1.3.1...v1.4.0) (2026-10-08)

### 🐛 Bug Fixes

* **apk-lab:** address review feedback on asm, native extraction, il2cpp layouts, and unity cli ([9e1addc](https://github.com/ihatenodejs/aidans-patches/commit/9e1addccd11969151c735345d231718afc730e21))
* **apk-lab:** Allowed overriding default kwargs in tool runner ([76801f6](https://github.com/ihatenodejs/aidans-patches/commit/76801f612922c52a52bb264a01eb9d78f0a1e53d))
* **apk-lab:** detect conflicting duplicate native library entries within an APK ([d85bc28](https://github.com/ihatenodejs/aidans-patches/commit/d85bc28f716251f3e0952a93e8bb5798aaf4693e))
* **apk-lab:** Included AndroidManifest in patchable member check ([af7fcd6](https://github.com/ihatenodejs/aidans-patches/commit/af7fcd6d19ec5d22d9f8494ac774a7ed3fa26124))
* **apk-lab:** Included resources.arsc in patch artifact detection ([845d8f1](https://github.com/ihatenodejs/aidans-patches/commit/845d8f1623fa68063ccf17ee9e5e62df1c746cb4))
* **blackjack:** update to 2.22.09 ([34eca78](https://github.com/ihatenodejs/aidans-patches/commit/34eca782360220175556fc587f37a8c5e011c9e0))
* **build:** Selected newest patch artifact ([185b8bc](https://github.com/ihatenodejs/aidans-patches/commit/185b8bce6097df0a9c9d435a482d1fd898115b43))
* **sezzle:** Corrected rewards dispatch and CodePush method matching ([0b60e45](https://github.com/ihatenodejs/aidans-patches/commit/0b60e450f3fbae774b4ec7888458bb8152f62e10))
* **sezzle:** Preserved Sezzle Send navigation in rewards patch ([9245a74](https://github.com/ihatenodejs/aidans-patches/commit/9245a74c3d49b921938e435bd31edf1114217147))
* **sezzle:** Stubbed CodePush bundle resolution in update patch ([c1cac39](https://github.com/ihatenodejs/aidans-patches/commit/c1cac396717618c97eae379f4328677b74975ca2))

### ✨ New Features

* **apk-lab:** add deterministic ARM64 instruction encoder and CLI ([58324dc](https://github.com/ihatenodejs/aidans-patches/commit/58324dc430cc9ed8659e29ced02be7776e257289))
* **apk-lab:** add IL2CPP metadata extractor and symbol search command ([13d41bd](https://github.com/ihatenodejs/aidans-patches/commit/13d41bdc0d492fdf705e48f8d497cf3ede376235))
* **apk-lab:** add Unity serialized asset inspector and GameObject locator ([4cdb737](https://github.com/ihatenodejs/aidans-patches/commit/4cdb7378b6f5d4ccf3204ff55eb34da95f524a80))
* **apk-lab:** added apk compatibility testing and status tracking ([c077d5a](https://github.com/ihatenodejs/aidans-patches/commit/c077d5a2b72447f455c9e80268f95c59a7bd7395))
* **apk-lab:** extract native libraries across splits during analyze ([55e7aa1](https://github.com/ihatenodejs/aidans-patches/commit/55e7aa13a782c5096b7ea564f2f1e43eb446c837))
* **fizz:** Added feed advertisement removal patch ([6c10066](https://github.com/ihatenodejs/aidans-patches/commit/6c100662f9516b125cf4ce3fe60808fb3c9e1678))
* **sezzle:** Added configurable shortcut filtering ([5716677](https://github.com/ihatenodejs/aidans-patches/commit/57166774f3ce51eed55606f7c9d783750397183f))
* **sidelineswap:** Added AMOLED theme patch ([619e112](https://github.com/ihatenodejs/aidans-patches/commit/619e112c7304eb0a0a03d677fb0d65f47448b99c))
* **sidelineswap:** Added cart item and CardView theming ([9603003](https://github.com/ihatenodejs/aidans-patches/commit/9603003d69265ffafd4ce4fbe5a39dfe27ea4469))
* **sidelineswap:** Added dark WebView support and expanded AMOLED theme ([d0de58a](https://github.com/ihatenodejs/aidans-patches/commit/d0de58a456ec9d9bd8a2f421cf216ef6f8420f75))
* **sidelineswap:** Added payment sheet theming and address list fix ([4290b27](https://github.com/ihatenodejs/aidans-patches/commit/4290b270af2c009b4ef1c1c52c483a0b5c9a0b57))
* **sidelineswap:** Added shipping badge and avatar stroke theming ([cdfed1e](https://github.com/ihatenodejs/aidans-patches/commit/cdfed1e4bbba03c8d94d789ca57824c5964a5498))

## [1.4.0-dev.7](https://github.com/ihatenodejs/aidans-patches/compare/v1.4.0-dev.6...v1.4.0-dev.7) (2026-10-08)

### 🐛 Bug Fixes

* **apk-lab:** Included AndroidManifest in patchable member check ([af7fcd6](https://github.com/ihatenodejs/aidans-patches/commit/af7fcd6d19ec5d22d9f8494ac774a7ed3fa26124))

### ✨ New Features

* **sidelineswap:** Added AMOLED theme patch ([619e112](https://github.com/ihatenodejs/aidans-patches/commit/619e112c7304eb0a0a03d677fb0d65f47448b99c))
* **sidelineswap:** Added cart item and CardView theming ([9603003](https://github.com/ihatenodejs/aidans-patches/commit/9603003d69265ffafd4ce4fbe5a39dfe27ea4469))
* **sidelineswap:** Added dark WebView support and expanded AMOLED theme ([d0de58a](https://github.com/ihatenodejs/aidans-patches/commit/d0de58a456ec9d9bd8a2f421cf216ef6f8420f75))
* **sidelineswap:** Added payment sheet theming and address list fix ([4290b27](https://github.com/ihatenodejs/aidans-patches/commit/4290b270af2c009b4ef1c1c52c483a0b5c9a0b57))
* **sidelineswap:** Added shipping badge and avatar stroke theming ([cdfed1e](https://github.com/ihatenodejs/aidans-patches/commit/cdfed1e4bbba03c8d94d789ca57824c5964a5498))

## [1.4.0-dev.6](https://github.com/ihatenodejs/aidans-patches/compare/v1.4.0-dev.5...v1.4.0-dev.6) (2026-10-08)

### 🐛 Bug Fixes

* **apk-lab:** Allowed overriding default kwargs in tool runner ([76801f6](https://github.com/ihatenodejs/aidans-patches/commit/76801f612922c52a52bb264a01eb9d78f0a1e53d))
* **apk-lab:** Included resources.arsc in patch artifact detection ([845d8f1](https://github.com/ihatenodejs/aidans-patches/commit/845d8f1623fa68063ccf17ee9e5e62df1c746cb4))
* **sezzle:** Corrected rewards dispatch and CodePush method matching ([0b60e45](https://github.com/ihatenodejs/aidans-patches/commit/0b60e450f3fbae774b4ec7888458bb8152f62e10))
* **sezzle:** Preserved Sezzle Send navigation in rewards patch ([9245a74](https://github.com/ihatenodejs/aidans-patches/commit/9245a74c3d49b921938e435bd31edf1114217147))
* **sezzle:** Stubbed CodePush bundle resolution in update patch ([c1cac39](https://github.com/ihatenodejs/aidans-patches/commit/c1cac396717618c97eae379f4328677b74975ca2))

## [1.4.0-dev.5](https://github.com/ihatenodejs/aidans-patches/compare/v1.4.0-dev.4...v1.4.0-dev.5) (2026-10-08)

### 🐛 Bug Fixes

* **apk-lab:** address review feedback on asm, native extraction, il2cpp layouts, and unity cli ([9e1addc](https://github.com/ihatenodejs/aidans-patches/commit/9e1addccd11969151c735345d231718afc730e21))
* **apk-lab:** detect conflicting duplicate native library entries within an APK ([d85bc28](https://github.com/ihatenodejs/aidans-patches/commit/d85bc28f716251f3e0952a93e8bb5798aaf4693e))

### ✨ New Features

* **apk-lab:** add deterministic ARM64 instruction encoder and CLI ([58324dc](https://github.com/ihatenodejs/aidans-patches/commit/58324dc430cc9ed8659e29ced02be7776e257289))
* **apk-lab:** add IL2CPP metadata extractor and symbol search command ([13d41bd](https://github.com/ihatenodejs/aidans-patches/commit/13d41bdc0d492fdf705e48f8d497cf3ede376235))
* **apk-lab:** add Unity serialized asset inspector and GameObject locator ([4cdb737](https://github.com/ihatenodejs/aidans-patches/commit/4cdb7378b6f5d4ccf3204ff55eb34da95f524a80))
* **apk-lab:** extract native libraries across splits during analyze ([55e7aa1](https://github.com/ihatenodejs/aidans-patches/commit/55e7aa13a782c5096b7ea564f2f1e43eb446c837))

## [1.4.0-dev.4](https://github.com/ihatenodejs/aidans-patches/compare/v1.4.0-dev.3...v1.4.0-dev.4) (2026-10-08)

### 🐛 Bug Fixes

* **blackjack:** update to 2.22.09 ([34eca78](https://github.com/ihatenodejs/aidans-patches/commit/34eca782360220175556fc587f37a8c5e011c9e0))

## [1.4.0-dev.3](https://github.com/ihatenodejs/aidans-patches/compare/v1.4.0-dev.2...v1.4.0-dev.3) (2026-10-07)

### ✨ New Features

* **sezzle:** Added configurable shortcut filtering ([5716677](https://github.com/ihatenodejs/aidans-patches/commit/57166774f3ce51eed55606f7c9d783750397183f))

## [1.4.0-dev.2](https://github.com/ihatenodejs/aidans-patches/compare/v1.4.0-dev.1...v1.4.0-dev.2) (2026-10-07)

### ✨ New Features

* **apk-lab:** added apk compatibility testing and status tracking ([c077d5a](https://github.com/ihatenodejs/aidans-patches/commit/c077d5a2b72447f455c9e80268f95c59a7bd7395))

## [1.4.0-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.3.1...v1.4.0-dev.1) (2026-10-06)

### 🐛 Bug Fixes

* **build:** Selected newest patch artifact ([185b8bc](https://github.com/ihatenodejs/aidans-patches/commit/185b8bce6097df0a9c9d435a482d1fd898115b43))

### ✨ New Features

* **fizz:** Added feed advertisement removal patch ([6c10066](https://github.com/ihatenodejs/aidans-patches/commit/6c100662f9516b125cf4ce3fe60808fb3c9e1678))

## [1.3.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.3.0...v1.3.1) (2026-10-06)

### 🐛 Bug Fixes

* **ci:** allow release workflow to create backmerge PRs ([8bc1992](https://github.com/ihatenodejs/aidans-patches/commit/8bc1992dc6904a73ad205adc858db1847ff7afe3))

## [1.3.1-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.3.0...v1.3.1-dev.1) (2026-10-06)

### 🐛 Bug Fixes

* **ci:** allow release workflow to create backmerge PRs ([8bc1992](https://github.com/ihatenodejs/aidans-patches/commit/8bc1992dc6904a73ad205adc858db1847ff7afe3))

## [1.3.0](https://github.com/ihatenodejs/aidans-patches/compare/v1.2.0...v1.3.0) (2026-10-05)

### 🐛 Bug Fixes

* add semantic-release-backmerge plugin ([234cab1](https://github.com/ihatenodejs/aidans-patches/commit/234cab18dcce7c2eb3493ea0ceec0b001eaacac1))
* **release:** rollback incorrect version, implement @kilianpaquier/semantic-release-backmerge ([7df1007](https://github.com/ihatenodejs/aidans-patches/commit/7df1007579ff01f896aaee32bd791acb6e9c0bc6))
* **site:** fixed status data and deployment safeguards ([f4f1e77](https://github.com/ihatenodejs/aidans-patches/commit/f4f1e77a0e5577e72bf9d23964c97ac14021bcc9))

### ✨ New Features

* **sezzle:** added js bundle patch to remove ads and tracking ([a5c9937](https://github.com/ihatenodejs/aidans-patches/commit/a5c993787b66b2da0c9b6a37dafe6a7263b6ec0e))
* **site:** added documentation and showcase website ([4fba928](https://github.com/ihatenodejs/aidans-patches/commit/4fba9284c3a663680f2324b70210e50ba379a9b2))
* **site:** added live status polling and dynamic patch counts ([e1907ab](https://github.com/ihatenodejs/aidans-patches/commit/e1907ab24c827a4d8b490fbf5b6449353b494877))
* **worker:** added custom domain route and refresh authorization ([1acbd40](https://github.com/ihatenodejs/aidans-patches/commit/1acbd40067e180d51b7526de8ea96b401cf99823))

## [1.3.0-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.2.0...v1.3.0-dev.1) (2026-10-05)

### 🐛 Bug Fixes

* add semantic-release-backmerge plugin ([234cab1](https://github.com/ihatenodejs/aidans-patches/commit/234cab18dcce7c2eb3493ea0ceec0b001eaacac1))
* **release:** rollback incorrect version, implement @kilianpaquier/semantic-release-backmerge ([7df1007](https://github.com/ihatenodejs/aidans-patches/commit/7df1007579ff01f896aaee32bd791acb6e9c0bc6))

### ✨ New Features

* **sezzle:** added js bundle patch to remove ads and tracking ([a5c9937](https://github.com/ihatenodejs/aidans-patches/commit/a5c993787b66b2da0c9b6a37dafe6a7263b6ec0e))

## [1.2.0](https://github.com/ihatenodejs/aidans-patches/compare/v1.1.0...v1.2.0) (2026-10-03)

### 🐛 Bug Fixes

* **fizz:** fixed developer button visibility on single-feed layouts ([0bc1f31](https://github.com/ihatenodejs/aidans-patches/commit/0bc1f31358350260a0b437eb5ab8151255574f71))
* **fizz:** preserved 2048 UPM metrics for Apple Color Emoji ([cbd6f86](https://github.com/ihatenodejs/aidans-patches/commit/cbd6f86735c84fabe381ffc61e19c53567a4f684))

### ✨ New Features

* **adobe-scan:** added patch suite and documentation for adobe scan ([89eae8e](https://github.com/ihatenodejs/aidans-patches/commit/89eae8e7e9bfc36784f5c90798ba36fb4dd36bfe))
* **blackjack:** added internet and notification permission removal patches ([2f23c54](https://github.com/ihatenodejs/aidans-patches/commit/2f23c541fa089abf3fbc1f52f620b1e0a1457ba0))
* **fizz:** added developer settings mod menu patch ([aee93d8](https://github.com/ihatenodejs/aidans-patches/commit/aee93d8e05aa66e620b8d25cfbd498439dbcc8e1))
* **fizz:** added ios emoji font replacement patch and dynamic build pipeline ([0bf8157](https://github.com/ihatenodejs/aidans-patches/commit/0bf81570512fc4db0ff731d9b6b5e113236ed870))
* **fizz:** added patch suite and documentation for fizz ([1ecfacf](https://github.com/ihatenodejs/aidans-patches/commit/1ecfacffb6af05ac285dd006c0b18f353d00867e))

## [1.2.0-dev.5](https://github.com/ihatenodejs/aidans-patches/compare/v1.2.0-dev.4...v1.2.0-dev.5) (2026-10-03)

### 🐛 Bug Fixes

* **fizz:** preserved 2048 UPM metrics for Apple Color Emoji ([cbd6f86](https://github.com/ihatenodejs/aidans-patches/commit/cbd6f86735c84fabe381ffc61e19c53567a4f684))

## [1.2.0-dev.4](https://github.com/ihatenodejs/aidans-patches/compare/v1.2.0-dev.3...v1.2.0-dev.4) (2026-10-03)

### 🐛 Bug Fixes

* **fizz:** fixed developer button visibility on single-feed layouts ([0bc1f31](https://github.com/ihatenodejs/aidans-patches/commit/0bc1f31358350260a0b437eb5ab8151255574f71))

## [1.2.0-dev.3](https://github.com/ihatenodejs/aidans-patches/compare/v1.2.0-dev.2...v1.2.0-dev.3) (2026-10-03)

### ✨ New Features

* **fizz:** added developer settings mod menu patch ([aee93d8](https://github.com/ihatenodejs/aidans-patches/commit/aee93d8e05aa66e620b8d25cfbd498439dbcc8e1))

## [1.2.0-dev.2](https://github.com/ihatenodejs/aidans-patches/compare/v1.2.0-dev.1...v1.2.0-dev.2) (2026-10-03)

### ✨ New Features

* **fizz:** added ios emoji font replacement patch and dynamic build pipeline ([0bf8157](https://github.com/ihatenodejs/aidans-patches/commit/0bf81570512fc4db0ff731d9b6b5e113236ed870))

## [1.2.0-dev.1](https://github.com/ihatenodejs/aidans-patches/compare/v1.1.0...v1.2.0-dev.1) (2026-10-03)

### ✨ New Features

* **adobe-scan:** added patch suite and documentation for adobe scan ([89eae8e](https://github.com/ihatenodejs/aidans-patches/commit/89eae8e7e9bfc36784f5c90798ba36fb4dd36bfe))
* **blackjack:** added internet and notification permission removal patches ([2f23c54](https://github.com/ihatenodejs/aidans-patches/commit/2f23c541fa089abf3fbc1f52f620b1e0a1457ba0))
* **fizz:** added patch suite and documentation for fizz ([1ecfacf](https://github.com/ihatenodejs/aidans-patches/commit/1ecfacffb6af05ac285dd006c0b18f353d00867e))

## [1.1.0](https://github.com/ihatenodejs/aidans-patches/compare/v1.0.0...v1.1.0) (2026-10-02)

### 🐛 Bug Fixes

* **ads:** Disabled Braze in-app message registration ([06077d1](https://github.com/ihatenodejs/aidans-patches/commit/06077d14007ccfcf34cb5a01bee0598844eba2a6))
* **aftership:** aligned map controls with tracking toolbar ([4e03d67](https://github.com/ihatenodejs/aidans-patches/commit/4e03d674715136664b8c2fe1bde9560dd99de96c))
* **aftership:** resolved checkpoint coordinates from geo entities ([caf5cb9](https://github.com/ihatenodejs/aidans-patches/commit/caf5cb9c6df2d2d9252916ebe6cd37e44aef0ca7))
* **blackjack:** aligned skip level dialog touch target with safe area insets ([cc2ecca](https://github.com/ihatenodejs/aidans-patches/commit/cc2ecca92ef89df7c563dead4b212a0ef3d3028a))
* **blackjack:** closed chip file stream via try-with-resources ([a0758bc](https://github.com/ihatenodejs/aidans-patches/commit/a0758bca3149c77e89d8bfe683e25619a30b36ea))
* **blackjack:** logged 16 kb page alignment configuration failure ([780cdda](https://github.com/ihatenodejs/aidans-patches/commit/780cdda9343709841d0727189b09b80a49f7eaf2))
* **blackjack:** recalibrated skip level dialog touch target ([e128e1b](https://github.com/ihatenodejs/aidans-patches/commit/e128e1b844f8793897cd552b73c8803ccc95b66a))
* **generator:** mapped patch dependencies by display name ([328db4b](https://github.com/ihatenodejs/aidans-patches/commit/328db4b8c104ead3b6cea75255e809018a1f6e3d))
* **sezzle:** corrected byte sequences for hidden AI elements ([26f16bd](https://github.com/ihatenodejs/aidans-patches/commit/26f16bd1d30ff1fb60a84fb77d3cf287bd7dd1ac))
* **sezzle:** corrected jail monkey rooted check class targeting ([d556f97](https://github.com/ihatenodejs/aidans-patches/commit/d556f97c0c577a1c15b61e37b38802c986ddf243))
* **sezzle:** preserved total cents fallback in header navigation ([e480112](https://github.com/ihatenodejs/aidans-patches/commit/e480112d9a4a13f7ab3efb977d70bea22ae94e78))
* **sidelineswap:** refined method matching for telemetry overrides ([987a098](https://github.com/ihatenodejs/aidans-patches/commit/987a098ac588f5c5c0ae8b39175e89007f91636b))
* **sidelineswap:** validated hex format for brand color options ([67a83d1](https://github.com/ihatenodejs/aidans-patches/commit/67a83d1fd9575deffe25ae177e7dd8b07183c8c4))

### ✨ New Features

* **patches/main:** Expanded Sezzle navigation controls ([b76447c](https://github.com/ihatenodejs/aidans-patches/commit/b76447cda548ca22fdf981efaec51c11dd3ff43a))
* **patches:** Added multi-application patch suites ([9ba0e11](https://github.com/ihatenodejs/aidans-patches/commit/9ba0e11f7f9c81a2a940534eeb0baefdb863d927))

## 1.0.0 (2026-09-20)
