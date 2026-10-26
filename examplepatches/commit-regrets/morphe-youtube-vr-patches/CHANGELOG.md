## [1.28.0](https://github.com/commit-regrets/morphe-youtube-vr-patches/compare/v1.27.0...v1.28.0) (2026-10-25)

### 🐛 Bug Fixes

* **ci:** judge upstream versions by what the store serves, not what the channel has uploaded ([d68afca](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/d68afca883c42c36a8d36019ea0ed13f2b8aa747)), references [#40](https://github.com/commit-regrets/morphe-youtube-vr-patches/issues/40) [#40](https://github.com/commit-regrets/morphe-youtube-vr-patches/issues/40)
* **ci:** pass supportedVersions to upstream issue generator ([7a7d84f](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/7a7d84feefdd079b459b578567b26836ca41a3e2))

### ✨ New Features

* verify YouTube VR 1.89.09 alongside 1.88.10 ([1f72aad](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/1f72aada7f7e3bf3843074ecdc5729afda578849))

## [1.27.0](https://github.com/commit-regrets/morphe-youtube-vr-patches/compare/v1.26.0...v1.27.0) (2026-10-14)

### 🐛 Bug Fixes

* **sponsorblock:** bound the stored-default migration, so a cyclic table cannot hang start-up ([11ddf39](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/11ddf396c5384ff75e7f9b79ad42a84a6d84756a))
* **sponsorblock:** make the five-option behaviour picker actually fit the card ([6bb3eaa](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/6bb3eaa74409dccaea966d4381e193c7f4661b69))
* **sponsorblock:** offer the innermost nested segment, as the phone patch does ([83d4625](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/83d46253637d7d12ad63d73361831af4de0222d2))
* **sponsorblock:** one decision per tick, so a skip never also raises the button ([5292038](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/529203827cfcdd2cfab812c88e2a279d9d932646))

### ✨ New Features

* **sponsorblock:** implement "Show a Skip button", in the app's own skip-Ad card ([d2b6b9d](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/d2b6b9d5e3c558e86244e3632c68145775ca57d8))

## [1.26.0](https://github.com/commit-regrets/morphe-youtube-vr-patches/compare/v1.25.0...v1.26.0) (2026-10-13)

### 🐛 Bug Fixes

* **ads:** answer 'no ad slots' from the two accessors every reader asks (unverified on device) ([d423421](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/d423421c292278de60183b5c144ca84b02555c55))
* **ads:** answer the ad-slot accessors with the app's own empty list, verified on device ([eb548e4](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/eb548e4b1191cb3496f0de86ffeeef36e6cb1e68))
* **ads:** drop the ad cue-point list, the fifth client-side ad path (unverified on device) ([4a93429](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/4a93429a021acc81f4f13bbced51267554b32550))
* retry the spoofed /player request once before the cooldown ([bb7b4fb](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/bb7b4fb7545e22cb5ed7d2f0dd4a4a9f732f4809))

### ✨ New Features

* **script:** add -SmokeTest, and say what 'Hide ads' actually covers ([f1359df](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/f1359df2439c06a3fca49ea15fbe7dea3cfc0ca1))

## [1.25.0](https://github.com/commit-regrets/morphe-youtube-vr-patches/compare/v1.24.0...v1.25.0) (2026-10-13)

* **deps:** bump actions/setup-java from 6.0.0 to 6.0.1 ([#34](https://github.com/commit-regrets/morphe-youtube-vr-patches/issues/34)) ([59e7234](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/59e7234425f58d75a0598995875f47fa69e97b73))
* **deps:** bump actions/upload-artifact from 4 to 7 ([#33](https://github.com/commit-regrets/morphe-youtube-vr-patches/issues/33)) ([6df58a3](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/6df58a393d42d64daae851d92c926bbafe66e6ec))
* **deps:** bump com.diffplug.spotless from 7.2.1 to 8.10.4 ([#32](https://github.com/commit-regrets/morphe-youtube-vr-patches/issues/32)) ([a58d7fb](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/a58d7fb43c95eb5493cc12d84e0778ce9916645f))
* **deps:** bump gradle-wrapper from 9.7.1 to 9.8.1 ([#31](https://github.com/commit-regrets/morphe-youtube-vr-patches/issues/31)) ([68cbae1](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/68cbae1e02453302919e1bfe9fc9202e99db3d43))

### 🐛 Bug Fixes

* keep the QUIC row's advice on screen ([650a7f0](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/650a7f0ae39781d637d9bd079f2673343608b2fc))
* remove the SSAI patch that could not do what its name said ([c8ab4dd](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/c8ab4ddab979ca1bd35d161ec6e6c6718ea284fa))

### ✨ New Features

* add the QUIC switch, and drop the DRC patch nothing reads ([c58f40a](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/c58f40a58b7e385b2eba4908d200c5867586ab25))

## [1.24.0](https://github.com/commit-regrets/morphe-youtube-vr-patches/compare/v1.23.1...v1.24.0) (2026-10-13)

### 🐛 Bug Fixes

* describe what the Extension patch actually provides ([cef1e21](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/cef1e217faa58000d3b9cd1e77923601f1de8811))
* point at the Extension patch as the ad blocker in the SSAI note ([d0314aa](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/d0314aa8af5a5bc8f2e7b8020efd2b5244610c29))
* qualify the quality picker's array references (@type/name) ([a7fad4f](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/a7fad4fd43d2a338bbaccfbd61fd8af77d3f63d2))
* remove the Spoof osName patch (measured ineffective on VR) ([4e8f3ad](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/4e8f3ad0ec6d92a140661a629a4e85c3b9be4fa2))
* say that the two spoof options ship set to the no-op value ([be145f3](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/be145f3426cfe8d95e3e3e77a1b0b865a045377a))
* select SponsorBlock by default and drop its stale off-by-default note ([f9611dc](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/f9611dc8470f7253c15468e5d211cd5aea757dd4))
* single-source the supported app version in Constants.kt ([6a74415](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/6a74415e3f17ba5caa2ac4e751d0832ef34b16d2))
* state that the Disable QUIC option is off by default ([81d99a6](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/81d99a6eebffff0ba40c87640f42e899722cf063))
* state the measured result in the Spoof osName note ([96ba4f9](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/96ba4f9dc1dc642ec2b224dde6e237f8092ab982))
* verify the quality hook's Optional and make its settings row usable ([468b6df](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/468b6df8f312cd8f1335d44839508b038b299cca))

### ✨ New Features

* add the Default video quality patch ([043bee1](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/043bee17388b28eb71879035eaa34657775bb311))
* force verbose logging in local test builds ([51f7a30](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/51f7a30a5fc132f8aad9c56c1f293a39e10e7986))

## [1.23.1](https://github.com/commit-regrets/morphe-youtube-vr-patches/compare/v1.23.0...v1.23.1) (2026-10-11)

### 🐛 Bug Fixes

* **sponsorblock:** find the settings XML from Manager's split patcher session ([579f978](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/579f978e3a5019cca481ded103e2872bd9caf286))

## [1.23.0](https://github.com/commit-regrets/morphe-youtube-vr-patches/compare/v1.22.2...v1.23.0) (2026-10-11)

### ✨ New Features

* install the patched app as a clone from this bundle, on by default ([d58c5bc](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/d58c5bc01c62f3305d75755be2f66e7a0cf5f20c))

## [1.22.2](https://github.com/commit-regrets/morphe-youtube-vr-patches/compare/v1.22.1...v1.22.2) (2026-10-11)

* gate the build on Spotless formatting and detekt static analysis ([32aa53b](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/32aa53b2c476d1d5da38351cfa11371f238527d3))

### 🐛 Bug Fixes

* **ci:** debug which writer the preset resolves on the runner ([f8d582f](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/f8d582f190f4c38e5a9440f3fafb8b084a231616))
* **ci:** ESM-resolution debug with full stack on render failure ([ee7aa80](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/ee7aa80378d282e640d2337ed659180e08792fac))
* **ci:** npm ci for releases -- npm install re-resolved away the plugin override ([7b392f3](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/7b392f37205a5a38bb1bc4dcca1df2d4ce43858a))
* **ci:** one writer copy -- the preset resolved a hoisted writer@8 ([4b657b4](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/4b657b436ea100a372cd9233ef959f8c73e483e6))
* **ci:** pair the changelog preset v10 with release-notes-generator 15 ([3bcd5e1](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/3bcd5e16cef0e9b8d0fdec48822d269341cefe2e))
* **ci:** pin the changelog preset to v9 -- the release action ships writer@8 ([f353871](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/f3538718525b032caf4f7a649d832a4797019a32))
* **ci:** read package.json files directly in the writer debug ([9001b27](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/9001b277309eec0f9fb97733c93d0aab1b8a8dec))
* **ci:** run semantic-release directly so the preset and writer share a tree ([c8b0306](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/c8b03060352c8e4c1b88cb511158adc06bca3ef2))
* **ci:** runtime debug of the preset's writer on the runner ([aac7c5b](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/aac7c5b8832ee10e0e51d6ec7dfc41bd737df807))
* **ci:** track the release debug script (build/probe is gitignored) ([6e70252](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/6e70252fb2337b8bf6e9ca51d48609c0b0523013))
* clear the four -Xlint:all deprecation warnings in the extension ([4135d04](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/4135d04d820eab2e8d766855bba4e290fa836b28))

## [1.22.2-develop.1](https://github.com/commit-regrets/morphe-youtube-vr-patches/compare/v1.22.1...v1.22.2-develop.1) (2026-10-11)

* gate the build on Spotless formatting and detekt static analysis ([32aa53b](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/32aa53b2c476d1d5da38351cfa11371f238527d3))

### 🐛 Bug Fixes

* **ci:** debug which writer the preset resolves on the runner ([f8d582f](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/f8d582f190f4c38e5a9440f3fafb8b084a231616))
* **ci:** ESM-resolution debug with full stack on render failure ([ee7aa80](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/ee7aa80378d282e640d2337ed659180e08792fac))
* **ci:** npm ci for releases -- npm install re-resolved away the plugin override ([7b392f3](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/7b392f37205a5a38bb1bc4dcca1df2d4ce43858a))
* **ci:** one writer copy -- the preset resolved a hoisted writer@8 ([4b657b4](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/4b657b436ea100a372cd9233ef959f8c73e483e6))
* **ci:** pair the changelog preset v10 with release-notes-generator 15 ([3bcd5e1](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/3bcd5e16cef0e9b8d0fdec48822d269341cefe2e))
* **ci:** pin the changelog preset to v9 -- the release action ships writer@8 ([f353871](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/f3538718525b032caf4f7a649d832a4797019a32))
* **ci:** read package.json files directly in the writer debug ([9001b27](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/9001b277309eec0f9fb97733c93d0aab1b8a8dec))
* **ci:** run semantic-release directly so the preset and writer share a tree ([c8b0306](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/c8b03060352c8e4c1b88cb511158adc06bca3ef2))
* **ci:** runtime debug of the preset's writer on the runner ([aac7c5b](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/aac7c5b8832ee10e0e51d6ec7dfc41bd737df807))
* **ci:** track the release debug script (build/probe is gitignored) ([6e70252](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/6e70252fb2337b8bf6e9ca51d48609c0b0523013))
* clear the four -Xlint:all deprecation warnings in the extension ([4135d04](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/4135d04d820eab2e8d766855bba4e290fa836b28))

## [1.22.1](https://github.com/commit-regrets/morphe-youtube-vr-patches/compare/v1.22.0...v1.22.1) (2026-10-11)

### 🐛 Bug Fixes

* **ci:** revert the changelog preset to v9 -- v10 needs a newer writer ([87bc354](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/87bc354c6879bf7b93408792b7423c202040feb1))
* **ci:** run the release notes on conventional-changelog-conventionalcommits v10 ([c5acb62](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/c5acb62fb4311453152c94a5b09c6d413b2bc180))

## [1.22.0](https://github.com/commit-regrets/morphe-youtube-vr-patches/compare/v1.21.0...v1.22.0) (2026-10-11)

### 🐛 Bug Fixes

* **ci:** repair the build workflow's YAML ([145f347](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/145f347611cddf47e688b8f8565605ae0e4fc59e))
* **ci:** upload the bundle with supported globs, and record two CI lessons ([3ca56b5](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/3ca56b51c4d92cdeab311760dd8e5b2632ba62e1))
* log the gate toggle once per tap ([4d30aa9](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/4d30aa9c96221c97d7b199c821b040ad65b30ba1))
* one verbose-tap echo per tap, not two ([79a0344](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/79a0344a681b7ef64078a258f7bd92ef334c9a70))
* read and write the screens' preference file (youtube.xml) ([227fb9c](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/227fb9c801fbe2f42a267900b8361d50d29f0191))
* the verbose row's tap echo prints in both directions ([2b35cc6](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/2b35cc6d1b054b679d602350cc909545983101a9))
* the verbose-logging row writes its own value ([29257fb](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/29257fbada6a428c6baa1ba7fb280de8af602d58))

### ✨ New Features

* a development build logs by default, a release still does not ([9a66717](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/9a66717bc88e481d86ee50cadb214a25579208fa))
* gate the extension's logging behind a "Verbose logging" row ([00ea6cf](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/00ea6cf6e1fe261de77d512663cdef766150eb21))
* name the file the settings widgets actually write ([d116521](https://github.com/commit-regrets/morphe-youtube-vr-patches/commit/d116521d9446b11493ec166e4b90cc370c84da22))
