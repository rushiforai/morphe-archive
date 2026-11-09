## [1.67.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.67.2...v1.67.3) (2026-11-09)

### 🐛 Bug Fixes

* **droidcam:** restore decrypted .data in arm64 native libs, fixing crash on Stop ([37ee498](https://github.com/mwbra130/Retro-Bowl-College/commit/37ee4984c4fa195f91807fb33ad2b19241c4b5b2))

## [1.67.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.67.1...v1.67.2) (2026-11-09)

### 🐛 Bug Fixes

* **droidcam:** restore decrypted .data in native libs, fixing crash on Stop ([a155c60](https://github.com/mwbra130/Retro-Bowl-College/commit/a155c6039d212f64d2fbabf8fb35cbd11bd7641b))

## [1.67.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.67.0...v1.67.1) (2026-11-09)

### 🐛 Bug Fixes

* **droidcam:** fold runtime files and camera fix into Disable PairIP so only two patches are selectable ([8f567ab](https://github.com/mwbra130/Retro-Bowl-College/commit/8f567aba9668376744ca98b2011b314e07c04e6f))

## [1.67.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.66.1...v1.67.0) (2026-11-09)

### 🐛 Bug Fixes

* **droidcam:** silence PairIP license check entry point on 10.0 ([0b1eec5](https://github.com/mwbra130/Retro-Bowl-College/commit/0b1eec5e4a4c21311e31c865f26fa73bb4ba57c9))

### ✨ New Features

* **droidcam:** port PairIP bypass and Pro unlock to DroidCam 10.0 ([93b4261](https://github.com/mwbra130/Retro-Bowl-College/commit/93b426103e01a763c933ee7faf7e4d8fcab87b52))

## [1.66.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.66.0...v1.66.1) (2026-11-08)

### 🐛 Bug Fixes

* **aodnotify:** mark 6.10 targets as stable after on-device confirmation ([2d30712](https://github.com/mwbra130/Retro-Bowl-College/commit/2d30712599b428b2b5af6cdf6138f105e4601985))

## [1.66.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.65.1...v1.66.0) (2026-11-08)

### ✨ New Features

* **aodnotify:** add aodNotify 6.10 compatibility ([94a454a](https://github.com/mwbra130/Retro-Bowl-College/commit/94a454a3c21098caa55531f94d9307065db53b72))
* **aodnotify:** add aodNotify 6.10 fingerprints (Pro sync writer + PairIP license funnel) ([121281a](https://github.com/mwbra130/Retro-Bowl-College/commit/121281a2b57b69d82586799f3f3f8f6bb78940dc))
* **aodnotify:** add Bypass PairIP license check patch for aodNotify 6.10 ([078e306](https://github.com/mwbra130/Retro-Bowl-College/commit/078e306d0e0cc38b8ca8a589621b6e0d52cb3210))
* **aodnotify:** add Enable Pro patch for aodNotify 6.10 ([415ac71](https://github.com/mwbra130/Retro-Bowl-College/commit/415ac718b1633b4bd70a62c126a748ac31a3c37b))

## [1.65.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.65.0...v1.65.1) (2026-11-08)

### 🐛 Bug Fixes

* **googlemessages:** trim OLED black mode to core schemes after launch crash ([20455d9](https://github.com/mwbra130/Retro-Bowl-College/commit/20455d9085f82b5028eb876d5cf57c4cf979365e))

## [1.65.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.64.0...v1.65.0) (2026-11-08)

### ✨ New Features

* **googlemessages:** add OLED black mode patch for Google Messages ([532ac1a](https://github.com/mwbra130/Retro-Bowl-College/commit/532ac1a2c9afdb11e834b703751d242017367355))

## [1.64.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.63.0...v1.64.0) (2026-11-06)

### ✨ New Features

* **droidcam:** add PairIP bypass and Pro unlock patches for DroidCam 9.0 ([bda54cd](https://github.com/mwbra130/Retro-Bowl-College/commit/bda54cd8134f323bdbc231bc07abf510e6ad8885))

## [1.63.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.62.6...v1.63.0) (2026-11-04)

### ✨ New Features

* quarantine DiskWala patch set to morphe-quarantine (at Matsen's instruction) ([fae2a11](https://github.com/mwbra130/Retro-Bowl-College/commit/fae2a11b89deae74866020f07a4aa07de42c224d))

## [1.62.6](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.62.5...v1.62.6) (2026-11-04)

### 🐛 Bug Fixes

* **diskwala:** Patch native libraries must be a resourcePatch for the manifest surgery ([7db7a19](https://github.com/mwbra130/Retro-Bowl-College/commit/7db7a1983f8017d3900db9638bdded9cb1e7626d))

## [1.62.5](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.62.4...v1.62.5) (2026-11-04)

### 🐛 Bug Fixes

* **diskwala:** full kuntal pipeline parity — restore VM-extracted onCreates, factory/manifest bypass, clinit stubs ([e166905](https://github.com/mwbra130/Retro-Bowl-College/commit/e166905aaacb0f37062881d8404943c3842facf5))

## [1.62.4](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.62.3...v1.62.4) (2026-11-04)

### 🐛 Bug Fixes

* **diskwala:** correct adrp stock words in native guard (0x2a6dc/0x2a6f8) ([5799521](https://github.com/mwbra130/Retro-Bowl-College/commit/579952188463033b009ca8c3c53ad96734e2c939))

## [1.62.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.62.2...v1.62.3) (2026-11-04)

### 🐛 Bug Fixes

* **diskwala:** replace hybrid set with kuntal-devrat exact patches ported to 27.3 ([50152c4](https://github.com/mwbra130/Retro-Bowl-College/commit/50152c4eafdac7aad94629e6f08a3c3d5cf16e70))

## [1.62.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.62.1...v1.62.2) (2026-11-04)

### 🐛 Bug Fixes

* **diskwala:** StartupLauncher fingerprint to kuntal's exact minimal shape ([8466945](https://github.com/mwbra130/Retro-Bowl-College/commit/846694537ade1cf73e5d459ea38e6f56141f2d35))

## [1.62.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.62.0...v1.62.1) (2026-11-04)

### 🐛 Bug Fixes

* **diskwala:** match StartupLauncher.launch on 27.3 (instance method, PUBLIC only) and fail loudly if VM stubs miss ([120379b](https://github.com/mwbra130/Retro-Bowl-College/commit/120379b1be044694e11136a2a995bcc9a7d4f0fb))

## [1.62.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.61.0...v1.62.0) (2026-11-04)

### ✨ New Features

* **diskwala:** restore DiskWala patches, port kuntal PairIP VM + native bypass to 27.3 ([762f8d7](https://github.com/mwbra130/Retro-Bowl-College/commit/762f8d7a859263cd646a2ed57f7baa9bf77aca9c))

## [1.61.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.60.0...v1.61.0) (2026-11-03)

### ✨ New Features

* isolate Strava patch set to morphe-quarantine ([397f6a0](https://github.com/mwbra130/Retro-Bowl-College/commit/397f6a0ac0c6ca48250c02eed3ef7b895f19d6be))
* quarantine BusinessX patch set to morphe-quarantine (at Matsen's instruction) ([4bd91b9](https://github.com/mwbra130/Retro-Bowl-College/commit/4bd91b9fdab5d3db8c9e609fca1c5d49d759cef9))

## [1.60.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.59.0...v1.60.0) (2026-11-03)

### ✨ New Features

* quarantine not-working patch sets (DiskWala, WVC, RainViewer, X-plore, Yin Yang, Vehico) to morphe-quarantine ([ab760f1](https://github.com/mwbra130/Retro-Bowl-College/commit/ab760f1f40ccbdcef43d4204e282a3e6028d2fc9))

## [1.59.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.58.1...v1.59.0) (2026-11-03)

### ✨ New Features

* **businessx:** add Enable Premium patch with required installer source companion ([a27cd85](https://github.com/mwbra130/Retro-Bowl-College/commit/a27cd850f01586d5974c38f66cb347e72af00b00))

## [1.58.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.58.0...v1.58.1) (2026-11-03)

### 🐛 Bug Fixes

* **xplore:** mark Enable Premium + PairIP bypass experimental (on-device PairIP Play wall, parked) ([ecb68a6](https://github.com/mwbra130/Retro-Bowl-College/commit/ecb68a6138416b765e66a70b81de75434709ee2f))

## [1.58.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.57.1...v1.58.0) (2026-11-03)

### ✨ New Features

* X-plore Enable Premium (Dinner-tier donation state) + PairIP signature bypass for 4.52.02 ([c81ca0d](https://github.com/mwbra130/Retro-Bowl-College/commit/c81ca0d35221ba6ed407cf838f5c2a1b72fc3211))

## [1.57.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.57.0...v1.57.1) (2026-11-03)

### 🐛 Bug Fixes

* 1DM Remove ads - cut NewBannerView show funnel, downloads offer strip (method + layout), old BannerView setAd ([3c5f6ad](https://github.com/mwbra130/Retro-Bowl-College/commit/3c5f6ad6983c513573de66c9058c49b563aee6e2))
* 1DM Remove ads - escape dollar in MainActivity$a definingClass (Kotlin string template broke generatePatchesList) ([0580ee7](https://github.com/mwbra130/Retro-Bowl-College/commit/0580ee74a3359164ec3f10470cfd031d476dfb8f))
* 1DM Remove ads - pin real house-promo show entry, add offer strip + old BannerView fingerprints ([d700ac5](https://github.com/mwbra130/Retro-Bowl-College/commit/d700ac56721824e0b9c09f170aaa02e15673663f))

## [1.57.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.56.2...v1.57.0) (2026-11-03)

### ✨ New Features

* 1DM Remove ads patch (Appodeal + direct Amazon funnels, house promo strip, 1DM+ drawer upsell bar) ([4612a09](https://github.com/mwbra130/Retro-Bowl-College/commit/4612a097ebd94b1b66d7a133a34f9e4cadc624a7))
* 1DM Remove ads patch (Appodeal + direct Amazon funnels, house promo strip, 1DM+ drawer upsell bar) ([db9c609](https://github.com/mwbra130/Retro-Bowl-College/commit/db9c609e674b81898eb82953c1969c555c72e6ba))
* 1DM Remove ads patch (Appodeal + direct Amazon funnels, house promo strip, 1DM+ drawer upsell bar) ([b492319](https://github.com/mwbra130/Retro-Bowl-College/commit/b492319d6118ce522350df68716e84857b0beeea))

## [1.56.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.56.1...v1.56.2) (2026-11-03)

### 🐛 Bug Fixes

* **diskwala:** mark DiskWala patches experimental (PairIP native wall confirmed on-device) ([bff689b](https://github.com/mwbra130/Retro-Bowl-College/commit/bff689ba1c48b898b5c44a2fff137c6cfbc3742d))
* **yinyang:** mark Yin Yang patches experimental (parked unresolved on-device) ([0542b12](https://github.com/mwbra130/Retro-Bowl-College/commit/0542b129a73c809c7d476b23a027bf3bb99bbedd))

## [1.56.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.56.0...v1.56.1) (2026-11-03)

### 🐛 Bug Fixes

* **mp3tagger:** correct reader polarity in fingerprints — Lmr0.a is the free-tier predicate ([1de33d8](https://github.com/mwbra130/Retro-Bowl-College/commit/1de33d84a3f54c38c27933d89c70391210eb2507))
* **mp3tagger:** pin free-tier reader to 0 (owned) — v1.54.0 pinned the free value 1 ([a3427d8](https://github.com/mwbra130/Retro-Bowl-College/commit/a3427d800bb6358660448d3209ae072c0ef747fb))

## [1.56.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.55.0...v1.56.0) (2026-11-03)

### ✨ New Features

* **diskwala:** bypass PairIP startup license checks so re-signed builds launch ([07c20d6](https://github.com/mwbra130/Retro-Bowl-College/commit/07c20d6c8a3919f7ea29200f47e38a965248e933))

## [1.55.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.54.1...v1.55.0) (2026-11-03)

### ✨ New Features

* **rocketplayer:** add Enable Premium patch pinning the PremiumHelper entitlement reader ([b4e2e70](https://github.com/mwbra130/Retro-Bowl-College/commit/b4e2e7043a76d42876410dc6ffb81e2637437e10))

## [1.54.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.54.0...v1.54.1) (2026-11-03)

### 🐛 Bug Fixes

* **yinyang:** add YSubscription constructor fingerprint for the premium source pin ([35b7e6c](https://github.com/mwbra130/Retro-Bowl-College/commit/35b7e6caadad7a5abfd611d6aa22c047cf2366c2))
* **yinyang:** pin YSubscription isPremium and isLifetime at its constructor so lifetime is actually granted ([fbd9c10](https://github.com/mwbra130/Retro-Bowl-College/commit/fbd9c10598012cb18c90b2703abdf591efca45ea))

## [1.54.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.53.0...v1.54.0) (2026-11-03)

### ✨ New Features

* Add Smart MP3 Tagger Enable Lifetime Pro patch ([2fa3466](https://github.com/mwbra130/Retro-Bowl-College/commit/2fa3466e3a7361708be41fb06dc14b2af786dd06))

## [1.53.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.52.0...v1.53.0) (2026-11-03)

### ✨ New Features

* **unifiedremote:** add Enable Full patch pinning the license status reader ([cc10957](https://github.com/mwbra130/Retro-Bowl-College/commit/cc109573b9f810882d8cf726ab647656d6f9c5da))

## [1.52.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.51.0...v1.52.0) (2026-11-03)

### 🐛 Bug Fixes

* **yinyang:** appIconColor must be an Int literal (6-digit hex) ([f94d72c](https://github.com/mwbra130/Retro-Bowl-College/commit/f94d72cbfa70c80a6c7f16721486342ed1c0e6b0))

### ✨ New Features

* Add DiskWala Enable Premium patch ([fde8443](https://github.com/mwbra130/Retro-Bowl-College/commit/fde8443b246cb36be952c3d8056012ec3712a993))
* **yinyang:** add Enable Premium and Change installer source patches for Yin Yang Launcher 5.13.1 ([7877414](https://github.com/mwbra130/Retro-Bowl-College/commit/787741403b13573c8aa2d2104a3adbcb75b50e07))

## [1.51.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.50.0...v1.51.0) (2026-11-03)

### ✨ New Features

* **videocutter:** add Remove ads patch with required installer source companion ([5fa133f](https://github.com/mwbra130/Retro-Bowl-College/commit/5fa133fe2316bf7bc89bd2539cffa42fae429e7e))

## [1.50.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.49.0...v1.50.0) (2026-11-03)

### 🐛 Bug Fixes

* Mark Vehico Remove ads patch experimental ([a8d3920](https://github.com/mwbra130/Retro-Bowl-College/commit/a8d39205738819a33c666027dcd357debd7bb021))

### ✨ New Features

* Add Notes Remove ads patch (AdMob interstitial + native load no-ops) ([7f28606](https://github.com/mwbra130/Retro-Bowl-College/commit/7f286064a1bf9132e76253e53aad3c679a283c45))

## [1.49.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.48.1...v1.49.0) (2026-11-03)

### ✨ New Features

* Add Hermit Enable Premium patch (entitlement predicate pin) ([5eae64d](https://github.com/mwbra130/Retro-Bowl-College/commit/5eae64da41243a1b69efc149adbe186ab557828c))
* Add Vehico Remove ads patch ([e305a64](https://github.com/mwbra130/Retro-Bowl-College/commit/e305a642c331a1a27b4548e31b8c1131c0fcfde0))

## [1.48.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.48.0...v1.48.1) (2026-11-03)

### 🐛 Bug Fixes

* Make Echo Change installer source recommended (on by default) ([90e55a7](https://github.com/mwbra130/Retro-Bowl-College/commit/90e55a7c9ce960442497ed667330d6db5fecf48a))

## [1.48.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.47.0...v1.48.0) (2026-11-03)

### ✨ New Features

* Add Tuner (Cifra Club) Enable Premium patch (is-registered gate pin, removes ads) ([0a626c5](https://github.com/mwbra130/Retro-Bowl-College/commit/0a626c5f0f490b73f4d021f298249fc52a9feeb0))

## [1.47.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.46.0...v1.47.0) (2026-11-03)

### ✨ New Features

* Add Alarmy Enable Premium patch (PremiumState gate pins for 26.42.0) ([76e4036](https://github.com/mwbra130/Retro-Bowl-College/commit/76e40361a70cb6b0e9321dc49afb702019c7956e))

## [1.46.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.45.0...v1.46.0) (2026-11-03)

### ✨ New Features

* Add Echo Equalizer Pro unlock (is-Pro gate pin + installer source) ([b807280](https://github.com/mwbra130/Retro-Bowl-College/commit/b8072805cf60d3ad7244100fe1f3b0081a120640))

## [1.45.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.44.0...v1.45.0) (2026-11-03)

### 🐛 Bug Fixes

* Correct ISS Live Now Constants to patcher API types ([09a3d5d](https://github.com/mwbra130/Retro-Bowl-College/commit/09a3d5d39cbc80094394804f3c434a34e6e4d8ef))

### ✨ New Features

* Add ISS Live Now Enable Premium patch ([33b88ec](https://github.com/mwbra130/Retro-Bowl-College/commit/33b88ecbdc48d8fb6b671045cd180eb1dc9be9a4))

## [1.44.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.43.0...v1.44.0) (2026-11-03)

### ✨ New Features

* **rokuremote:** Enable Pro patch for Roku Remote 1.3.2 (pin X_PREMIUM_ENABLED reader) ([8621031](https://github.com/mwbra130/Retro-Bowl-College/commit/86210316304fb3fae83a04123d87f0d08ddd506b))

## [1.43.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.42.4...v1.43.0) (2026-11-03)

### ✨ New Features

* remove BeReal, Geometry Dash Lite and Subway Surfers patches; mark Happy Color, RainViewer, Strava, Web Video Caster experimental ([9e03135](https://github.com/mwbra130/Retro-Bowl-College/commit/9e03135651812722e9fb5a8d6dc58eb3305a60f8))

## [1.42.4](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.42.3...v1.42.4) (2026-11-02)

### 🐛 Bug Fixes

* **rainviewer:** insert the code-81 return at the throw, not the branch-target new-instance ([27e2b27](https://github.com/mwbra130/Retro-Bowl-College/commit/27e2b27d7ec841b8196e0b8b76d1cfd35491ff80))

## [1.42.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.42.2...v1.42.3) (2026-11-02)

### 🐛 Bug Fixes

* **webvideocaster:** correct smali method reference in PairIP application checks patch ([bd77e9a](https://github.com/mwbra130/Retro-Bowl-College/commit/bd77e9af8af82e3b5937967efb9d47d3c131e25f))

## [1.42.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.42.1...v1.42.2) (2026-11-02)

### 🐛 Bug Fixes

* **rainviewer:** pin premium status at the eh5 chokepoint (h/j) — tw7 sync is not the only writer ([3c3aefd](https://github.com/mwbra130/Retro-Bowl-College/commit/3c3aefdcf6eeaeada9a8969fd5f063523c64c5ad))

## [1.42.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.42.0...v1.42.1) (2026-11-02)

### 🐛 Bug Fixes

* **webvideocaster:** kill PairIP checks at the Application call site, remove LicenseActivity from manifest ([a571735](https://github.com/mwbra130/Retro-Bowl-College/commit/a5717350a32abe2525ca75b139165214b2d0b471))

## [1.42.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.41.1...v1.42.0) (2026-11-02)

### ✨ New Features

* **rainviewer:** add Bypass integrity check patch (Raindrop verdict + code 81) ([eff7eba](https://github.com/mwbra130/Retro-Bowl-College/commit/eff7eba3e4ac7158836389615bfe4b47c4671763))

## [1.41.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.41.0...v1.41.1) (2026-11-02)

### 🐛 Bug Fixes

* **webvideocaster:** remove startup-interference patches that crash the app ([b3143cd](https://github.com/mwbra130/Retro-Bowl-College/commit/b3143cdb634ba72f14ba5f6968f430971df1a66f))

## [1.41.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.40.0...v1.41.0) (2026-11-02)

### ✨ New Features

* **rainviewer:** add Enable Premium and Change installer source patches for 8.4.1 ([7b461f7](https://github.com/mwbra130/Retro-Bowl-College/commit/7b461f700864284d3a2c043bab0595f6d4716b12))

## [1.40.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.39.1...v1.40.0) (2026-11-02)

### ✨ New Features

* **happycolor:** Remove ads patch for Happy Color 2.24.1 (AppLovin MAX loadAd no-ops) ([ed416a0](https://github.com/mwbra130/Retro-Bowl-College/commit/ed416a03a85871402cc79d8327127c14c9bfdf52))

## [1.39.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.39.0...v1.39.1) (2026-11-02)

### 🐛 Bug Fixes

* **poweramp:** pin the missed cert-table reader in native scan_root (byte 0x32a must equal 2; unpinned it reads the random tamper-fill, scanner returns FAIL and playback of scanner-resolved files breaks) ([32c54d4](https://github.com/mwbra130/Retro-Bowl-College/commit/32c54d423f9badd69a38b09bc178c352fd6b8f2f))
* **poweramp:** restore the MutableMethod import clobbered by a stale-file push (it was added in 3816e7a18; the scan-gate push overwrote the file from an older copy) ([359af48](https://github.com/mwbra130/Retro-Bowl-College/commit/359af4822a8b8880e98f49fb2949a3fdec0f2e72))

## [1.39.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.38.1...v1.39.0) (2026-11-02)

### 🐛 Bug Fixes

* **poweramp:** add missing MutableMethod import (compile fix; unblocks the v1.39.0 release) ([3816e7a](https://github.com/mwbra130/Retro-Bowl-College/commit/3816e7a183a69b1d49caedf46db3432ec06bff7e))
* **poweramp:** force license/FP state at the restore setter's real value register (1031 loads prefs into v0; the 1025 v1 const was dead and skewed later defaults) ([5756c78](https://github.com/mwbra130/Retro-Bowl-College/commit/5756c780425047adaecf2e904cdaa81594f86ab4))

### ✨ New Features

* add Block PairIP startup activity launch patch for Web Video Caster ([28025ce](https://github.com/mwbra130/Retro-Bowl-College/commit/28025cee6570e6cdb9da06fe2eeda7518fc0bb04))

## [1.38.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.38.0...v1.38.1) (2026-11-02)

### 🐛 Bug Fixes

* correct StartupLauncher fingerprint flags for Web Video Caster (DECLARED_SYNCHRONIZED, not SYNCHRONIZED) ([3137f99](https://github.com/mwbra130/Retro-Bowl-College/commit/3137f99f68e5e5a0ffce7a79e9946a84e8f3b443))

## [1.38.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.37.1...v1.38.0) (2026-11-02)

### ✨ New Features

* add Disable PairIP startup program patch for Web Video Caster ([40e2866](https://github.com/mwbra130/Retro-Bowl-College/commit/40e28665c49a99951cbf39057fe5f241e57da7e4))

## [1.37.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.37.0...v1.37.1) (2026-11-02)

### 🐛 Bug Fixes

* **poweramp:** merge output-pair probes and resolve all signatures before applying (overlapping split signatures missed after sibling rewrite) ([1419bc0](https://github.com/mwbra130/Retro-Bowl-College/commit/1419bc0b708ffc38d7de6a90c8a9b66513c2c380))

## [1.37.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.36.3...v1.37.0) (2026-11-02)

### ✨ New Features

* **poweramp:** re-derived 1031 native probe set (21 signatures vs libpowerampcore table slot 0x98f060, strict matching restored) ([615047d](https://github.com/mwbra130/Retro-Bowl-College/commit/615047d22566f90b3817a8d5b7bccd1a4717c9f8))
* **webvideocaster:** add Disable PairIP license activity manifest patch ([21c3d47](https://github.com/mwbra130/Retro-Bowl-College/commit/21c3d47e4d4ecb38168ba02a9eeede855518089d))
* **webvideocaster:** add round-3 PairIP license fingerprints (verdict handler, launchers, shutdown, activity) ([faa3bff](https://github.com/mwbra130/Retro-Bowl-College/commit/faa3bff4a36356648506b7daeb10335b21add6ef))
* **webvideocaster:** stub PairIP verdict handler, launchers, delayed shutdown and license activity ([8571006](https://github.com/mwbra130/Retro-Bowl-College/commit/857100608d37a94ab5caba7b3342802e617cbdc4))

## [1.36.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.36.2...v1.36.3) (2026-11-02)

### 🐛 Bug Fixes

* **poweramp:** find FeaturePackPref purchased store structurally (1031 renamed BuyPrefBase.n); derive controller state field instead of hardcoded f ([6d2a943](https://github.com/mwbra130/Retro-Bowl-College/commit/6d2a9436ee0fc76d4ea6055af50dc594756ef061))

## [1.36.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.36.1...v1.36.2) (2026-11-02)

### 🐛 Bug Fixes

* **poweramp:** force signature-check field to valid after last store (1031 onCreate has no const/4 v2,0) ([1f52555](https://github.com/mwbra130/Retro-Bowl-College/commit/1f525551b8becc79fea15d599e3401fb99db6abe))

## [1.36.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.36.0...v1.36.1) (2026-11-02)

### 🐛 Bug Fixes

* **webvideocaster:** re-cut 1.35.4 after semantic-release push race (build was green) ([cdb61e4](https://github.com/mwbra130/Retro-Bowl-College/commit/cdb61e4dbd5188655287332ecaad2fb520d8582e))

## [1.36.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.35.3...v1.36.0) (2026-11-02)

### 🐛 Bug Fixes

* **webvideocaster:** bypass PairIP license check so re-signed builds are not sent to the Play block page ([9169d5c](https://github.com/mwbra130/Retro-Bowl-College/commit/9169d5c4f01e63dfe6bb1f823ca4ec436199b2bb))

### ✨ New Features

* **poweramp:** port hooman Unlock Premium to build-1031 (dex anchors verified, native probes pending) ([654fbfa](https://github.com/mwbra130/Retro-Bowl-College/commit/654fbfa290ba71305051d289ab7921be127a6fe7))

## [1.35.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.35.2...v1.35.3) (2026-11-02)

### 🐛 Bug Fixes

* **webvideocaster:** bypass PairIP signature check so re-signed builds can start ([9fc1658](https://github.com/mwbra130/Retro-Bowl-College/commit/9fc16587b3a3cb953c357d6a8ede372f7118a04c))

## [1.35.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.35.1...v1.35.2) (2026-11-02)

### 🐛 Bug Fixes

* add PairIP SignatureCheck fingerprint for Web Video Caster ([2880ec3](https://github.com/mwbra130/Retro-Bowl-College/commit/2880ec31d719cc402b4c08364515ab29f87684c0))

## [1.35.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.35.0...v1.35.1) (2026-11-02)

### 🐛 Bug Fixes

* **webvideocaster:** rewrite the false assignment instead of inserting before valueOf (goto paths skipped the insert) ([fc2659f](https://github.com/mwbra130/Retro-Bowl-College/commit/fc2659fa0b82868fb98dbdfefc0214d3656cab42))

## [1.35.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.34.0...v1.35.0) (2026-11-02)

### ✨ New Features

* **webvideocaster:** add premium manager fingerprints (Lv36 setter, Le89 init) ([0f6afc7](https://github.com/mwbra130/Retro-Bowl-College/commit/0f6afc7387e33c8e0ac4e415a76a80d77168c7e3))
* **webvideocaster:** add Web Video Caster 6.1.0 compatibility ([f13a85a](https://github.com/mwbra130/Retro-Bowl-College/commit/f13a85a90d917832815b160f15df8f1fa2606934))
* **webvideocaster:** unlock premium via central premium funnel (force Yes entitlement + hasPremium) ([6f258b4](https://github.com/mwbra130/Retro-Bowl-College/commit/6f258b4f61f49d887f2f9c01d2faed0f3cc08f8b))

## [1.34.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.33.3...v1.34.0) (2026-11-02)

### ✨ New Features

* **gradientweather:** add Change installer source patch (spoof installer for PairIP check) ([8258d0b](https://github.com/mwbra130/Retro-Bowl-College/commit/8258d0b5d2579f156b71482233c845298a4369b4))

## [1.33.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.33.2...v1.33.3) (2026-11-02)

### 🐛 Bug Fixes

* **gradientweather:** capture lifetime field reference via run (apply returned the method, breaking .type) ([fd72be1](https://github.com/mwbra130/Retro-Bowl-College/commit/fd72be1511759f433105ec2731e1002176a2c0fb))
* **gradientweather:** match fingerprints to real 1.3.4 methods ([23903bb](https://github.com/mwbra130/Retro-Bowl-College/commit/23903bb4b57c666c964800fe1901276494f47a3f))
* **gradientweather:** pin entitlement sync store to the lifetime tier ([12edb80](https://github.com/mwbra130/Retro-Bowl-College/commit/12edb802194b88a5576f118dd4f4c3bdbc0ba79e))

## [1.33.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.33.1...v1.33.2) (2026-11-02)

### 🐛 Bug Fixes

* **gradientweather:** add getReference instruction util ([9719eb8](https://github.com/mwbra130/Retro-Bowl-College/commit/9719eb811b7d54ed62705c2a73f34767157eb5fd))
* **gradientweather:** import getReference from app.zdrgon.util ([3fa57e3](https://github.com/mwbra130/Retro-Bowl-College/commit/3fa57e3b5f3813c915b7c3677aa2ee959f325bf8))

## [1.33.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.33.0...v1.33.1) (2026-11-02)

### 🐛 Bug Fixes

* **gamesinone:** fingerprint needs exact access flags (public final) ([bdd2776](https://github.com/mwbra130/Retro-Bowl-College/commit/bdd2776fa425be097e957006814cc0f92795cc93))

## [1.33.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.32.0...v1.33.0) (2026-11-02)

### ✨ New Features

* **gamesinone:** unlock premium (VIP) for Games In One 0.4.5 ([9b477fd](https://github.com/mwbra130/Retro-Bowl-College/commit/9b477fdab259e9e08e26ff35a973631a78bc5100))
* **gamesinone:** unlock premium (VIP) for Games In One 0.4.5 ([0a80788](https://github.com/mwbra130/Retro-Bowl-College/commit/0a8078896bb6db2ac0747edeed350986c3968e72))
* **gamesinone:** unlock premium (VIP) for Games In One 0.4.5 ([82d858f](https://github.com/mwbra130/Retro-Bowl-College/commit/82d858ff2eafbd7f28b8ff52a153bd337bdd9bb3))
* **gamesinone:** unlock premium (VIP) for Games In One 0.4.5 ([9853b9c](https://github.com/mwbra130/Retro-Bowl-College/commit/9853b9ce11522a6056bec91d9e1a278e191c8075))
* **gamesinone:** unlock premium (VIP) for Games In One 0.4.5 ([405c87c](https://github.com/mwbra130/Retro-Bowl-College/commit/405c87c96b1b0120c509363b47830be1ae9a3dcc))
* **gamesinone:** unlock premium (VIP) for Games In One 0.4.5 ([c16d810](https://github.com/mwbra130/Retro-Bowl-College/commit/c16d810f62c56b11a1a8d080ced9d654ac46c609))
* **gamesinone:** unlock premium (VIP) for Games In One 0.4.5 ([06cf0e4](https://github.com/mwbra130/Retro-Bowl-College/commit/06cf0e4c88bec8106bb777246067ed833ef2e852))
* **gamesinone:** unlock premium (VIP) for Games In One 0.4.5 ([839e493](https://github.com/mwbra130/Retro-Bowl-College/commit/839e4932f0e7b3807d63720465bbd938c8a3d12c))
* **gamesinone:** unlock premium (VIP) for Games In One 0.4.5 ([55d887c](https://github.com/mwbra130/Retro-Bowl-College/commit/55d887c3ef2398c7d03447e1ecacb38c20ebcd23))
* **gamesinone:** unlock premium (VIP) for Games In One 0.4.5 ([9fd7bef](https://github.com/mwbra130/Retro-Bowl-College/commit/9fd7bef53ee7a910c88a05236fa87b7ffa73b6a2))

## [1.32.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.31.7...v1.32.0) (2026-10-29)

### 🐛 Bug Fixes

* **strava:** release for long-press Home settings entry ([bb3d1f1](https://github.com/mwbra130/Retro-Bowl-College/commit/bb3d1f1a96c4fb9c0dc384b53234b2a96d7a943b))

### ✨ New Features

* **strava:** long-press Home tab opens patch settings; settings-screen bar removed ([eec743c](https://github.com/mwbra130/Retro-Bowl-College/commit/eec743cfdee6b54b555957833600039fda21dcfc))
* **strava:** long-press Home tab opens patch settings; settings-screen bar removed ([f3fc1ad](https://github.com/mwbra130/Retro-Bowl-College/commit/f3fc1ad95bef94d5035bdb66ac5fa96c8f794e29))

## [1.31.7](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.31.6...v1.31.7) (2026-10-29)

### 🐛 Bug Fixes

* **strava:** settings entry takes its own layout space (LinearLayout stack) instead of overlaying the settings list ([055e4f0](https://github.com/mwbra130/Retro-Bowl-College/commit/055e4f0c3c2aa69123fa3f579c11bc8c3c171d48))

## [1.31.6](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.31.5...v1.31.6) (2026-10-29)

### 🐛 Bug Fixes

* **strava:** open settings via StravaSettings.openSettings (PatchContext pattern) ([bfe5be5](https://github.com/mwbra130/Retro-Bowl-College/commit/bfe5be56d0abead9bcde9b5df819bbeab22bc65c))
* **strava:** track resumed activity and add openSettings, hxreborn PatchContext style ([c4ec08b](https://github.com/mwbra130/Retro-Bowl-College/commit/c4ec08b51eb74d162ac1bd6e811965702349f4b5))

## [1.31.5](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.31.4...v1.31.5) (2026-10-29)

### 🐛 Bug Fixes

* **strava:** document settings panel theme choice (release v1.31.4 asset never published after GitHub storage error) ([c7c5eb0](https://github.com/mwbra130/Retro-Bowl-College/commit/c7c5eb0daf028c1ca488796cc640d5b976f63d85))

## [1.31.4](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.31.3...v1.31.4) (2026-10-29)

### 🐛 Bug Fixes

* **strava:** settings panel theme - use StravaPreferenceTheme (framework style name resolved to a dialog theme, panel opened as a dismissible dialog) ([2e93d94](https://github.com/mwbra130/Retro-Bowl-College/commit/2e93d948066006fbc1e6b12c694cf0f8c9911611))

## [1.31.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.31.2...v1.31.3) (2026-10-29)

### 🐛 Bug Fixes

* **strava:** bake hide-filter defaults as extension field initializers ([ae88899](https://github.com/mwbra130/Retro-Bowl-College/commit/ae888990c818ee1078656aa0305aadcaa37e69f4))
* **strava:** make the trim default write defensive like the hide options write ([b1541fe](https://github.com/mwbra130/Retro-Bowl-College/commit/b1541fe66c784688084dc6b69216a266c9db7156))
* **strava:** never fail the patch when extension fields are not visible at patch time ([1f1fecd](https://github.com/mwbra130/Retro-Bowl-College/commit/1f1fecd47287a01c629b52fd1a850c73c28744d2))

## [1.31.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.31.1...v1.31.2) (2026-10-29)

### 🐛 Bug Fixes

* **strava:** call through low registers in the bottom navigation onCreate wrapper ([81a3def](https://github.com/mwbra130/Retro-Bowl-College/commit/81a3defa4e5f94c55334120d3273d5da177fa830))

## [1.31.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.31.0...v1.31.1) (2026-10-29)

### 🐛 Bug Fixes

* **strava:** wrap onCreateView using parameter registers, drop register-count guard ([008fd72](https://github.com/mwbra130/Retro-Bowl-College/commit/008fd722b839797d32fea9bc784b0dbae4d45a19))

## [1.31.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.30.0...v1.31.0) (2026-10-29)

### ✨ New Features

* **strava:** add in-app settings screen and settings/tab hooks ([6b2a5ac](https://github.com/mwbra130/Retro-Bowl-College/commit/6b2a5ace60b708f2eb4ab1ad42477dee0150c678))
* **strava:** add local events option to hide feed elements ([5807552](https://github.com/mwbra130/Retro-Bowl-College/commit/58075529f0ae97ce2d07075a01b31dd2c850a15c))
* **strava:** add runtime launcher name/icon switcher ([55657ff](https://github.com/mwbra130/Retro-Bowl-College/commit/55657ff9f9b38c2d8b10d203812ab2fc9addbc50))
* **strava:** add runtime settings store for the patch settings screen ([32da1c5](https://github.com/mwbra130/Retro-Bowl-College/commit/32da1c5c120014f5203644747cae2ac1c3f6f53e))
* **strava:** add settings patch (manifest activity, context, settings entry, tab hooks) ([a195742](https://github.com/mwbra130/Retro-Bowl-College/commit/a1957425e46ba5f849f0c4b9f98f5d867bd092bb))
* **strava:** check register counts instead of mutating them when wrapping methods ([ee01e37](https://github.com/mwbra130/Retro-Bowl-College/commit/ee01e37d8d28106516485bc891a17b9da5d40a06))
* **strava:** expose module type in the modular framework stub ([f459209](https://github.com/mwbra130/Retro-Bowl-College/commit/f4592095d1a3844f1a15cc5cf1dc92f3e8c880f5))
* **strava:** move branding helpers to context extension functions ([27fceaf](https://github.com/mwbra130/Retro-Bowl-College/commit/27fceafa1bbef6a275b7ce247658e5f7355f08a9))
* **strava:** prepare runtime-switchable launcher name/icon combinations ([cf0a6e9](https://github.com/mwbra130/Retro-Bowl-College/commit/cf0a6e9e4299a82e288091cc896232d63e496d10))
* **strava:** read hide filters from runtime settings and hide local events carousel ([dbd5d20](https://github.com/mwbra130/Retro-Bowl-College/commit/dbd5d2041accf430c88a6e4c9c50a28f1be9d632))
* **strava:** read route trim enabled/distance from runtime settings ([35d1e05](https://github.com/mwbra130/Retro-Bowl-College/commit/35d1e0522729297d755ecbe458bc78cbdeafec6a))
* **strava:** replace brand orange across all values, color lists and drawables ([36329ea](https://github.com/mwbra130/Retro-Bowl-College/commit/36329ea4780c017414323bdd12830a48881085b2))
* **strava:** route trim uses runtime settings with the option as default ([41ac350](https://github.com/mwbra130/Retro-Bowl-College/commit/41ac350ef4cf0c7714b5c8b6362a700df4d09954))

## [1.30.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.29.2...v1.30.0) (2026-10-29)

### ✨ New Features

* **strava:** enable password login by forcing OTP response usePassword fall-through ([3e4740c](https://github.com/mwbra130/Retro-Bowl-College/commit/3e4740c27c1202edc5203f0989c2ffa47db46d7d))

## [1.29.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.29.1...v1.29.2) (2026-10-29)

### 🐛 Bug Fixes

* **strava:** record device test findings: package rename crash and sign-in limits ([0ec8217](https://github.com/mwbra130/Retro-Bowl-College/commit/0ec821782532634e6545e787f09fcfc846916e2a))

## [1.29.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.29.0...v1.29.1) (2026-10-28)

### 🐛 Bug Fixes

* **strava:** intercept modular entry decorators outside the framework packages ([1f492c8](https://github.com/mwbra130/Retro-Bowl-College/commit/1f492c851bc8e9143a7a3d3ab817c9c62b501316))
* **strava:** pass null modular getter results through instead of crashing ([36fcda4](https://github.com/mwbra130/Retro-Bowl-College/commit/36fcda4ed21a978e2f105e45a17ab1778aefe5d4))

## [1.29.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.28.0...v1.29.0) (2026-10-28)

### ✨ New Features

* **strava:** add Strava 486.9 custom patches and extension ([37b42ec](https://github.com/mwbra130/Retro-Bowl-College/commit/37b42ec78e8e62c4c88a2ac12751cd2e9e0d175f))
* **strava:** add Strava 486.9 custom patches and extension ([db3a24b](https://github.com/mwbra130/Retro-Bowl-College/commit/db3a24ba06370210a82da981a2a7b8de07806f0a))
* **strava:** add Strava 486.9 custom patches and extension ([e05a7b9](https://github.com/mwbra130/Retro-Bowl-College/commit/e05a7b9c867e320fbdaa307b12120392e13c340f))
* **strava:** add Strava 486.9 custom patches and extension ([a25ac9c](https://github.com/mwbra130/Retro-Bowl-College/commit/a25ac9cbf5a7f7eab0753fb27a7d26264a293f8e))
* **strava:** add Strava 486.9 custom patches and extension ([939fe6f](https://github.com/mwbra130/Retro-Bowl-College/commit/939fe6fa021ed3d2edd023cca88b69360975a940))
* **strava:** add Strava 486.9 custom patches and extension ([db293dc](https://github.com/mwbra130/Retro-Bowl-College/commit/db293dcdd4b95e5b24c78c951132cd66f76409d5))
* **strava:** add Strava 486.9 custom patches and extension ([887e5f5](https://github.com/mwbra130/Retro-Bowl-College/commit/887e5f56872018089dd18009337a2c403f55204c))
* **strava:** add Strava 486.9 custom patches and extension ([3231f53](https://github.com/mwbra130/Retro-Bowl-College/commit/3231f535fcd95c52615aec7a9c90ddf6778a10e1))
* **strava:** add Strava 486.9 custom patches and extension ([29e9552](https://github.com/mwbra130/Retro-Bowl-College/commit/29e95524aff24d2676330f6fdb35130e94230241))
* **strava:** add Strava 486.9 custom patches and extension ([dd5b300](https://github.com/mwbra130/Retro-Bowl-College/commit/dd5b300b512cff5229d30b14f9ae5e2ed1795ef5))
* **strava:** add Strava 486.9 custom patches and extension ([20b89f9](https://github.com/mwbra130/Retro-Bowl-College/commit/20b89f94309dbe00295be81e7e52152400c9374f))
* **strava:** add Strava 486.9 custom patches and extension ([5dcfe16](https://github.com/mwbra130/Retro-Bowl-College/commit/5dcfe16b5dd43e863ea32ec165d38ca7e3768f0e))
* **strava:** add Strava 486.9 custom patches and extension ([a42f97d](https://github.com/mwbra130/Retro-Bowl-College/commit/a42f97d51960ba2e8db9875b30a6cf38d4d1ecf2))
* **strava:** add Strava 486.9 custom patches and extension ([31ef181](https://github.com/mwbra130/Retro-Bowl-College/commit/31ef181d9e3543ae6b4782441464f7684ba3453d))
* **strava:** add Strava 486.9 custom patches and extension ([55811a4](https://github.com/mwbra130/Retro-Bowl-College/commit/55811a432f03f9915324bd1057e35361117a607f))
* **strava:** add Strava 486.9 custom patches and extension ([4e4ee5c](https://github.com/mwbra130/Retro-Bowl-College/commit/4e4ee5c5865b16cba81f6a66c95ce9efbeec0efe))
* **strava:** add Strava 486.9 custom patches and extension ([07baf9c](https://github.com/mwbra130/Retro-Bowl-College/commit/07baf9c07d7e1928fa75ceacecd4b9734153cbf3))
* **strava:** add Strava 486.9 custom patches and extension ([d914a66](https://github.com/mwbra130/Retro-Bowl-College/commit/d914a666e5da3a1777ba90a93002023e9c2285b9))
* **strava:** add Strava 486.9 custom patches and extension ([f9b63e2](https://github.com/mwbra130/Retro-Bowl-College/commit/f9b63e2d976913dd114ea5c005dad7011c1547cb))
* **strava:** add Strava 486.9 custom patches and extension ([3a0038b](https://github.com/mwbra130/Retro-Bowl-College/commit/3a0038bd913c07fad5f4c5bc09863bd8181365c1))
* **strava:** add Strava 486.9 custom patches and extension ([1b7afdb](https://github.com/mwbra130/Retro-Bowl-College/commit/1b7afdb75948308aecdbd806438b095a283eeafe))
* **strava:** add Strava 486.9 custom patches and extension ([a8cf76f](https://github.com/mwbra130/Retro-Bowl-College/commit/a8cf76fdf4f170e2a7de68540fe5ae8703c811e2))
* **strava:** add Strava 486.9 custom patches and extension ([d77f9b1](https://github.com/mwbra130/Retro-Bowl-College/commit/d77f9b142f12f080ce633b9a909acba6189b3214))
* **strava:** add Strava 486.9 custom patches and extension ([e00d617](https://github.com/mwbra130/Retro-Bowl-College/commit/e00d61746f9ce1e5a70ce0fe2ef630a2e3a2f58a))
* **strava:** add Strava 486.9 custom patches and extension ([0cb9c78](https://github.com/mwbra130/Retro-Bowl-College/commit/0cb9c781bdb4cbde4633fee16ab5569cbad0ce5c))
* **strava:** add Strava 486.9 custom patches and extension ([e34ea81](https://github.com/mwbra130/Retro-Bowl-College/commit/e34ea815a42c12849db743bd0de9389abcf74f30))
* **strava:** Strava Custom Morphe bundle v0.1 ([7878c21](https://github.com/mwbra130/Retro-Bowl-College/commit/7878c214e65d344ba1d1f9c450d2834f8f677d8f))

## [1.28.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.27.0...v1.28.0) (2026-10-27)

### ✨ New Features

* **crossyroad:** add Unlock all characters patch for Crossy Road 7.14.0 ([4b72953](https://github.com/mwbra130/Retro-Bowl-College/commit/4b72953d969f97cf6f5f3e43930d6c8af199c133))

## [1.27.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.26.0...v1.27.0) (2026-10-27)

### ✨ New Features

* **crossyroad:** add Crossy Road patches for 7.14.0 (Free store, Unlimited gold) ([240eada](https://github.com/mwbra130/Retro-Bowl-College/commit/240eada293948e72eb7bd6ab823509677e09ff5c))

## [1.26.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.25.1...v1.26.0) (2026-10-16)

### ✨ New Features

* add BlockAdsPatch for Subway Surfers 3.70.0 (UnityAds.show no-op) ([2efaaba](https://github.com/mwbra130/Retro-Bowl-College/commit/2efaabad2168e982c504ad5747f3954de9c0ef68))

## [1.25.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.25.0...v1.25.1) (2026-10-15)

### 🐛 Bug Fixes

* revert vehicle patch (caused black UI) ([3949211](https://github.com/mwbra130/Retro-Bowl-College/commit/3949211bb4c62b37007d3329582bdab2d0e1118b))

## [1.25.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.24.2...v1.25.0) (2026-10-15)

### ✨ New Features

* unlock vehicles via setUnlocked count patch ([eac7508](https://github.com/mwbra130/Retro-Bowl-College/commit/eac7508378956a1e9331e38828a1316cb732e4e2))

## [1.24.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.24.1...v1.24.2) (2026-10-15)

### 🐛 Bug Fixes

* disable broken vehicle patch, keep only working machines ([c861a73](https://github.com/mwbra130/Retro-Bowl-College/commit/c861a73bc3122a756ee51af2ab1c1b887d52af7e))

## [1.24.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.24.0...v1.24.1) (2026-10-15)

### 🐛 Bug Fixes

* dynamic bl offset for vehicle unlock (was hardcoded) ([05ada57](https://github.com/mwbra130/Retro-Bowl-College/commit/05ada576badc06f99acc7331b53563f8dca1863a))
* revert to hardcoded bl (dynamic version failed build) ([9093a00](https://github.com/mwbra130/Retro-Bowl-College/commit/9093a0085ecb75dd5cc8165c2732b05cd17fe3ee))

## [1.24.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.23.1...v1.24.0) (2026-10-15)

### ✨ New Features

* unlock vehicles via buyBtn -> unlockAll patch ([df0498e](https://github.com/mwbra130/Retro-Bowl-College/commit/df0498eff3b5130212779fdad31ec56dc9efb940))

## [1.23.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.23.0...v1.23.1) (2026-10-15)

### 🐛 Bug Fixes

* force money re-patch and disable broken vehicle unlock ([29696fd](https://github.com/mwbra130/Retro-Bowl-College/commit/29696fdff773fd9f76d6672db9c720791a8593df))

## [1.23.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.22.4...v1.23.0) (2026-10-15)

### ✨ New Features

* unlock all vehicles and characters via native patch ([cfb49f2](https://github.com/mwbra130/Retro-Bowl-College/commit/cfb49f248524787e4b093706092d669ed8acbfed))

## [1.22.4](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.22.3...v1.22.4) (2026-10-15)

### 🐛 Bug Fixes

* unlock all three slot machines (was only machine1) ([4334640](https://github.com/mwbra130/Retro-Bowl-College/commit/4334640f3e4ab56ff30f24116349e5b41c3ffaf0))

## [1.22.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.22.2...v1.22.3) (2026-10-15)

### 🐛 Bug Fixes

* slot machine unlock with unique 24-byte pattern ([ff6246d](https://github.com/mwbra130/Retro-Bowl-College/commit/ff6246dbcad578d2964986e618094f8dbe974599))

## [1.22.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.22.1...v1.22.2) (2026-10-15)

### 🐛 Bug Fixes

* disable broken RedMachineUnlock patch (caused crashes) ([a51dbc8](https://github.com/mwbra130/Retro-Bowl-College/commit/a51dbc84962f874aef9e08e2c8663226caf9aca2))

## [1.22.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.22.0...v1.22.1) (2026-10-15)

### 🐛 Bug Fixes

* unlock slot machines at startup via ownership check bypass ([727d93a](https://github.com/mwbra130/Retro-Bowl-College/commit/727d93a2175c579e7bbde2a0d0c6f16fc9666b6a))

## [1.22.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.21.5...v1.22.0) (2026-10-15)

### ✨ New Features

* add Red Slot Machine Unlock native patch ([8a8870a](https://github.com/mwbra130/Retro-Bowl-College/commit/8a8870af6748a8ad5f55268d56a3253b0ba36d13))

## [1.21.5](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.21.4...v1.21.5) (2026-10-15)

### 🐛 Bug Fixes

* bump patcher to 1.23.0, force vehicle re-unlock ([faf5367](https://github.com/mwbra130/Retro-Bowl-College/commit/faf536797dd08566b3bb11c93dab32f0a8117ff3))

## [1.21.4](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.21.3...v1.21.4) (2026-10-15)

### 🐛 Bug Fixes

* remove SharedPreferences test patches ([e0c4eb7](https://github.com/mwbra130/Retro-Bowl-College/commit/e0c4eb7db1269b0445b6b41e267a49093e92bf7f))

## [1.21.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.21.2...v1.21.3) (2026-10-15)

### 🐛 Bug Fixes

* remove test patches that break build ([8138ae4](https://github.com/mwbra130/Retro-Bowl-College/commit/8138ae437be27eb895c243634317333a06778fe6))

## [1.21.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.21.1...v1.21.2) (2026-10-15)

### 🐛 Bug Fixes

* version-aware patch marker for Smashy Road 2 ([0194082](https://github.com/mwbra130/Retro-Bowl-College/commit/01940827da12733637652ca833cdacfc333e9679))

## [1.21.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.21.0...v1.21.1) (2026-10-15)

### 🐛 Bug Fixes

* remove diagnostic billing patch ([dee25e5](https://github.com/mwbra130/Retro-Bowl-College/commit/dee25e53d307b223894df878f6fd5893e3cffe77))

## [1.21.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.20.0...v1.21.0) (2026-10-15)

### 🐛 Bug Fixes

* remove FreePurchasePatch to restore working build ([6bf150c](https://github.com/mwbra130/Retro-Bowl-College/commit/6bf150c331142871e4d3c1955276967ad9f6e83a))

### ✨ New Features

* add simple free IAP patch for Smashy Road 2 ([dbfb883](https://github.com/mwbra130/Retro-Bowl-College/commit/dbfb8833cbb6b869c8969bd577dee3eb8e7eb04a))

## [1.20.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.19.0...v1.20.0) (2026-10-15)

### 🐛 Bug Fixes

* add billing client compileOnly dep for extension ([27f1932](https://github.com/mwbra130/Retro-Bowl-College/commit/27f1932b7c8bf79318c138abc263a3e3d052ebc2))
* make BillingFaker fully reflective, drop billing compile dep ([eb0cfd7](https://github.com/mwbra130/Retro-Bowl-College/commit/eb0cfd766a1fec18f3c898f8667339eb1f2a0a44))
* remove duplicate extendWith from FreePurchasePatch ([4b7fa71](https://github.com/mwbra130/Retro-Bowl-College/commit/4b7fa719f682ce9433de43f5936f92d266b97306))
* retrigger release after tag cleanup ([1761658](https://github.com/mwbra130/Retro-Bowl-College/commit/1761658abd6c5c665a572279ac8c6f0a122876db))
* temporarily remove FreePurchasePatch to restore working build ([f325558](https://github.com/mwbra130/Retro-Bowl-College/commit/f3255580abc37088e5a5eb5e485eccf2c7d230b5))
* use methodOrNull pattern for billing fingerprints ([27a3641](https://github.com/mwbra130/Retro-Bowl-College/commit/27a36415c26254879c5a189c9b3e0b45fa557026))

### ✨ New Features

* add free IAP bypass for Smashy Road 2 ([5c5b76d](https://github.com/mwbra130/Retro-Bowl-College/commit/5c5b76dee0cd0e3556652034e31744936546e68c))

## [1.19.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.18.0...v1.19.0) (2026-10-15)

### 🐛 Bug Fixes

* Smashy Road 2 patcher runs once, preserves progress on relaunch ([14e40e6](https://github.com/mwbra130/Retro-Bowl-College/commit/14e40e68d5aa38cda6c28546099b332c3ea94489))

### ✨ New Features

* add Smashy Road 2 v1.45 support ([aa72037](https://github.com/mwbra130/Retro-Bowl-College/commit/aa72037e22441758d809e9e646cfa0d8daa83cdb))

## [1.18.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.17.1...v1.18.0) (2026-10-15)

### ✨ New Features

* unlock all Smashy Road 2 vehicles/characters via save patcher ([2a94ff3](https://github.com/mwbra130/Retro-Bowl-College/commit/2a94ff307a0021a0b2ff57421c8b809260c74b7d))

## [1.17.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.17.0...v1.17.1) (2026-10-15)

### 🐛 Bug Fixes

* trigger release for 3-patch BeReal bundle ([5062d7a](https://github.com/mwbra130/Retro-Bowl-College/commit/5062d7a4247b2d0876729f0b4fae1edfeeb0580b))

## [1.16.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.15.0...v1.16.0) (2026-10-15)

### ✨ New Features

* block BeReal ads at show() and activity layers ([c5a44d3](https://github.com/mwbra130/Retro-Bowl-College/commit/c5a44d3b2aa40dbbbf974a165732df6165ddbf0b))

## [1.15.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.14.3...v1.15.0) (2026-10-15)

### 🐛 Bug Fixes

* disable Adjust tracking kill for BeReal crash diagnosis ([4008cef](https://github.com/mwbra130/Retro-Bowl-College/commit/4008cef8977649583d69abc6e06fb48619302be5))

### ✨ New Features

* block BeReal interstitials at FullscreenAdActivity ([b11e18d](https://github.com/mwbra130/Retro-Bowl-College/commit/b11e18d0c5e7108005b2521b1a1fdc693f556aaa))

## [1.14.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.14.2...v1.14.3) (2026-10-15)

### 🐛 Bug Fixes

* disable AppLovin init kill for BeReal crash diagnosis ([114bb67](https://github.com/mwbra130/Retro-Bowl-College/commit/114bb67456c7eee20a3b7b1556a8eb629d3a3584))

## [1.14.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.14.1...v1.14.2) (2026-10-15)

### 🐛 Bug Fixes

* disable BeReal ADN SdkManager hook entirely ([77d3738](https://github.com/mwbra130/Retro-Bowl-College/commit/77d3738e97cf166d862abe2121d0461fb9f7b586))

## [1.14.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.14.0...v1.14.1) (2026-10-15)

### 🐛 Bug Fixes

* remove null ad-instance getters from BeReal ADN patch ([5841ef3](https://github.com/mwbra130/Retro-Bowl-College/commit/5841ef35dedd81fa5b62a72aa8009a5b67b69235))

## [1.14.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.13.0...v1.14.0) (2026-10-14)

### ✨ New Features

* block ads at KPAdPlayerActivity, the single ad display chokepoint ([dc6287d](https://github.com/mwbra130/Retro-Bowl-College/commit/dc6287dbd7da2d6fa35449e04f39580854fa86cb))

## [1.13.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.12.1...v1.13.0) (2026-10-14)

### ✨ New Features

* hook kpadplayer FullScreenAdManager for rewards without ads ([7bfca28](https://github.com/mwbra130/Retro-Bowl-College/commit/7bfca28c3bbdd32a9252999c4a24cc641797a837))

## [1.12.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.12.0...v1.12.1) (2026-10-14)

### 🐛 Bug Fixes

* only block interstitials, leave rewarded ads working ([f8f42bc](https://github.com/mwbra130/Retro-Bowl-College/commit/f8f42bc9c6754b73b45e2e508a83b65d280e3274))

## [1.12.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.11.2...v1.12.0) (2026-10-14)

### ✨ New Features

* grant rewards for AdMob and Unity new-API rewarded ads ([1e00fd9](https://github.com/mwbra130/Retro-Bowl-College/commit/1e00fd9c3b6e81553dc6598b24de79f4219f808e))

## [1.11.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.11.1...v1.11.2) (2026-10-14)

### 🐛 Bug Fixes

* isolate Subway Surfers ad hooks so one bad SDK can't crash the patch ([8f29415](https://github.com/mwbra130/Retro-Bowl-College/commit/8f29415851c35ac1433d0b05026367497514d01b))

## [1.11.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.11.0...v1.11.1) (2026-10-14)

### 🐛 Bug Fixes

* make Subway Surfers ad skip resilient to missing SDKs ([46fa175](https://github.com/mwbra130/Retro-Bowl-College/commit/46fa1753b893db3f77fa1589c3f3511d6aa305fb))

## [1.11.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.10.1...v1.11.0) (2026-10-14)

### ✨ New Features

* block all ad SDKs in Subway Surfers ([5dd9c1c](https://github.com/mwbra130/Retro-Bowl-College/commit/5dd9c1cd658aed76a781eaaabccca55ab27dc8de))

## [1.10.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.10.0...v1.10.1) (2026-10-14)

### 🐛 Bug Fixes

* support com.kiloo.subwaysurf package variant for Subway Surfers ad skip ([71f53d5](https://github.com/mwbra130/Retro-Bowl-College/commit/71f53d514a81db5115292f778d2ec9338d5e4091))

## [1.10.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.9.3...v1.10.0) (2026-10-14)

### ✨ New Features

* add Subway Surfers Unity Ads skip patch ([bf55aa3](https://github.com/mwbra130/Retro-Bowl-College/commit/bf55aa3c237a7b1eeaebd98bb7e8f7024763dfec))

## [1.9.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.9.2...v1.9.3) (2026-10-14)

### 🐛 Bug Fixes

* report ADN init failure instead of nopping, null the ad getters ([e57d70d](https://github.com/mwbra130/Retro-Bowl-College/commit/e57d70d531311590aa4ca7c7b725370808d615cf))

## [1.9.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.9.1...v1.9.2) (2026-10-14)

### 🐛 Bug Fixes

* make video autoplay fingerprint behavioral instead of obfuscated-name based ([ece83ff](https://github.com/mwbra130/Retro-Bowl-College/commit/ece83fff632e5187c1e3bae0a12c81ee543a194d))

## [1.9.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.9.0...v1.9.1) (2026-10-13)

### 🐛 Bug Fixes

* hook Adjust SDK initSdk directly instead of obfuscated wrapper ([7a2226b](https://github.com/mwbra130/Retro-Bowl-College/commit/7a2226baed264a63e798014cac6184374d3e6ad1))

## [1.9.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.8.6...v1.9.0) (2026-10-13)

### ✨ New Features

* BeReal 3.97.1 support and Voodoo ADN ad kill-switch ([05b267d](https://github.com/mwbra130/Retro-Bowl-College/commit/05b267da8c35e1d3f277b36579b3547922c43886))

## [1.8.6](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.8.5...v1.8.6) (2026-09-25)

### 🐛 Bug Fixes

* disable check* vehicle/character unlocking (broke legit wins) ([7440348](https://github.com/mwbra130/Retro-Bowl-College/commit/7440348c2bc3cb6024d3c743ecf41e76cb71c724))

## [1.8.5](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.8.4...v1.8.5) (2026-09-25)

### 🐛 Bug Fixes

* always construct the GD save; build full level records ([ada8f81](https://github.com/mwbra130/Retro-Bowl-College/commit/ada8f81cf02592716e8f9b5922716a080f74f067))

## [1.8.4](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.8.3...v1.8.4) (2026-09-25)

### 🐛 Bug Fixes

* patch the real save files (CCGameManager2.dat / CCLocalLevels2.dat) ([8a28ecf](https://github.com/mwbra130/Retro-Bowl-College/commit/8a28ecffcf1be3520548e24226db6b65bb15fd25))

## [1.8.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.8.2...v1.8.3) (2026-09-25)

### 🐛 Bug Fixes

* bump run-once marker to done_v8 ([106da15](https://github.com/mwbra130/Retro-Bowl-College/commit/106da15f355c9e34e8a53b1b9dbdd314e0c0c552))
* storage scan to locate the real save + append log lines ([2181626](https://github.com/mwbra130/Retro-Bowl-College/commit/21816262488c3910139d056bd40bf23e98ac1d17))

## [1.8.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.8.1...v1.8.2) (2026-09-25)

### 🐛 Bug Fixes

* use mainQuestClaimed flags for missions, remove vehicle lock keys ([4cbd504](https://github.com/mwbra130/Retro-Bowl-College/commit/4cbd504cee2b21b46574c10007ef70d28d0d8c71))

## [1.8.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.8.0...v1.8.1) (2026-09-25)

### 🐛 Bug Fixes

* use real mainQuestProgress/sideQuestProgress keys for mission completion ([030a069](https://github.com/mwbra130/Retro-Bowl-College/commit/030a069d50a44bb257bc892301d70036eb2a48cf))

## [1.8.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.7.1...v1.8.0) (2026-09-25)

### ✨ New Features

* unlock all Smashy Road 2 vehicles and characters ([1cd4b76](https://github.com/mwbra130/Retro-Bowl-College/commit/1cd4b7612c408b7e21dd3c75edac793bb7b3eb8a))

## [1.7.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.7.0...v1.7.1) (2026-09-25)

### 🐛 Bug Fixes

* copy SR2 debug files to Downloads for easy retrieval ([9009732](https://github.com/mwbra130/Retro-Bowl-College/commit/90097326d65a9675c5d4b24bc6cbeb5e87a84dcf))

## [1.7.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.6.0...v1.7.0) (2026-09-25)

### ✨ New Features

* Smashy Road 2 complete all missions and max vehicle durability ([bedaa8a](https://github.com/mwbra130/Retro-Bowl-College/commit/bedaa8ad36d43d3d17a80420e6766797a82837d0))

## [1.6.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.5.1...v1.6.0) (2026-09-24)

### ✨ New Features

* unlock red/blue slot machines via real hasMachine flags ([0d6536d](https://github.com/mwbra130/Retro-Bowl-College/commit/0d6536dcb82cc666d11760b52a66e6d233f708a2))

## [1.5.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.5.0...v1.5.1) (2026-09-24)

### 🐛 Bug Fixes

* insert missing Smashy Road 2 upgrade/pro-pass keys instead of only rewriting existing ones ([c5c093a](https://github.com/mwbra130/Retro-Bowl-College/commit/c5c093a257e013793a12e7c67549f646990de2e8))

## [1.5.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.4.0...v1.5.0) (2026-09-24)

### ✨ New Features

* Smashy Road 2 pro pass unlock + red slot machine attempt ([f09d4a6](https://github.com/mwbra130/Retro-Bowl-College/commit/f09d4a6c924862102a6447c1fa13fdcb099bd13e))

## [1.4.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.3.7...v1.4.0) (2026-09-24)

### ✨ New Features

* Smashy Road 2 unlimited coins & upgrade cards patch ([ca5b8e6](https://github.com/mwbra130/Retro-Bowl-College/commit/ca5b8e63801dc986adce4ae4f85ed729ce2a78ef))

## [1.3.7](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.3.6...v1.3.7) (2026-09-24)

### 🐛 Bug Fixes

* forensics for reverted saves + clone genuine level records ([2dfe878](https://github.com/mwbra130/Retro-Bowl-College/commit/2dfe8789dfa75f37fb40f1d7571d7f002ca303c9))

## [1.3.6](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.3.5...v1.3.6) (2026-09-24)

### 🐛 Bug Fixes

* diagnose whether the game keeps or reverts the patched save ([5beb5ce](https://github.com/mwbra130/Retro-Bowl-College/commit/5beb5ce50612f56cd64e14a1485c58f719aca5b6))

## [1.3.5](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.3.4...v1.3.5) (2026-09-24)

### 🐛 Bug Fixes

* stop PairIP native library from loading to prevent tamper-kill crash ([4dd4fc6](https://github.com/mwbra130/Retro-Bowl-College/commit/4dd4fc61d4cbcafc264dba1329c1bd6f960077cc))

## [1.3.4](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.3.3...v1.3.4) (2026-09-24)

### 🐛 Bug Fixes

* well-formed level records, correct stats, and dual-file patching for GD Lite ([bd8bb9d](https://github.com/mwbra130/Retro-Bowl-College/commit/bd8bb9d0d4af7905fe3e1b272cf1493c9fbafd16))

## [1.3.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.3.2...v1.3.3) (2026-09-24)

### 🐛 Bug Fixes

* create missing Geometry Dash Lite level records in GLM_01 ([3d5567a](https://github.com/mwbra130/Retro-Bowl-College/commit/3d5567a31a5e9b09f3b82d6a43c4d883967cea8f))

## [1.3.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.3.1...v1.3.2) (2026-09-23)

### 🐛 Bug Fixes

* remove unrelated satellite patch, fix Retro Bowl folder layout, clean up README ([30df9a7](https://github.com/mwbra130/Retro-Bowl-College/commit/30df9a752bf3f266b81ce22fba41f30d87c23bfd))

## [1.3.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.3.0...v1.3.1) (2026-09-23)

### 🐛 Bug Fixes

* harden BeReal license bypass against paywall screen and crash ([849d44f](https://github.com/mwbra130/Retro-Bowl-College/commit/849d44f9257071d72ebbe0a14bcc9cc23985d2dc))

## [1.3.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.2.0...v1.3.0) (2026-09-23)

### ✨ New Features

* add BeReal license-check bypass patch (P7) ([863f3be](https://github.com/mwbra130/Retro-Bowl-College/commit/863f3be04440742c4a4bd2927b1e91bed5e246a1))

## [1.2.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.1.7...v1.2.0) (2026-09-23)

### ✨ New Features

* add BeReal cleanup patches (sponsored posts, ads, trackers, feed) ([bd9938e](https://github.com/mwbra130/Retro-Bowl-College/commit/bd9938ed3b5131e96e0bfdad0ae5d5349c3d09bd))

## [1.1.7](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.1.6...v1.1.7) (2026-09-23)

### 🐛 Bug Fixes

* read CCGameManager.dat from dataDir root, backup original, self-check output ([7db530b](https://github.com/mwbra130/Retro-Bowl-College/commit/7db530b5c70de92a4ea4f40a02919e45ae37e74d))

## [1.1.6](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.1.5...v1.1.6) (2026-09-23)

### 🐛 Bug Fixes

* scan whole app data dir incl. shared_prefs to find real save location ([319aeb0](https://github.com/mwbra130/Retro-Bowl-College/commit/319aeb0ffc493a8f0ea4520dc7e01311305027dd))

## [1.1.5](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.1.4...v1.1.5) (2026-09-23)

### 🐛 Bug Fixes

* recursive recently-modified file scan to locate the real save ([30de5c9](https://github.com/mwbra130/Retro-Bowl-College/commit/30de5c914f24ace19d5665a79780ea0bac5545a7))

## [1.1.4](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.1.3...v1.1.4) (2026-09-23)

### 🐛 Bug Fixes

* show save-location report on screen for screenshotting ([9fde689](https://github.com/mwbra130/Retro-Bowl-College/commit/9fde689392af94502c74b76df835228882f09475))

## [1.1.3](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.1.2...v1.1.3) (2026-09-23)

### 🐛 Bug Fixes

* probe save locations when Geometry Dash Lite save is missing ([062bdb4](https://github.com/mwbra130/Retro-Bowl-College/commit/062bdb4a13dfaffb96efd82eea8934a5f16c67df))

## [1.1.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.1.1...v1.1.2) (2026-09-23)

### 🐛 Bug Fixes

* make Geometry Dash Lite save patch robust and diagnosable ([7347b33](https://github.com/mwbra130/Retro-Bowl-College/commit/7347b33977675ba19c5c2650d1ba4746b76181b8))

## [1.1.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.1.0...v1.1.1) (2026-09-23)

### 🐛 Bug Fixes

* merge extension classes into patched app so Geometry Dash Lite no longer crashes on launch ([87eaf4b](https://github.com/mwbra130/Retro-Bowl-College/commit/87eaf4b7cd3b0e5481af1e584a64c55538483a5a))

## [1.1.0](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.0.2...v1.1.0) (2026-09-23)

### ✨ New Features

* add Geometry Dash Lite complete-all-levels patch ([dd2a378](https://github.com/mwbra130/Retro-Bowl-College/commit/dd2a37801c5330dc0f6e119b04dfab32c0c2150f))

## [1.0.2](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.0.1...v1.0.2) (2026-09-23)

### 🐛 Bug Fixes

* use order-independent string matching for premium fingerprint ([66a683f](https://github.com/mwbra130/Retro-Bowl-College/commit/66a683fe7b68f2efa87c7ca197a875ce9ca5d6fd))

## [1.0.1](https://github.com/mwbra130/Retro-Bowl-College/compare/v1.0.0...v1.0.1) (2026-09-23)

### 🐛 Bug Fixes

* make premium fingerprint build-proof ([73d948f](https://github.com/mwbra130/Retro-Bowl-College/commit/73d948fce66bbfef5036068788ad6e311aa54c63))

## 1.0.0 (2026-09-23)

### ✨ New Features

* add Direct-to-Cell satellite data optimization patch ([0a376be](https://github.com/mwbra130/Retro-Bowl-College/commit/0a376bef080d10d0f3a2eb1020ce5baf3818234a))
* remove example patch and clean patch list ([0841e34](https://github.com/mwbra130/Retro-Bowl-College/commit/0841e3425f2bbaf1050cecc09c148dc9c31be0d1))

## [1.1.0](https://github.com/Z-drgon/morphe-patches/compare/v1.0.0...v1.1.0) (2026-09-12)

### ✨ New Features

* remove example patch and clean patch list ([0841e34](https://github.com/Z-drgon/morphe-patches/commit/0841e3425f2bbaf1050cecc09c148dc9c31be0d1))

## [1.1.0](https://github.com/Z-drgon/morphe-patches/compare/v1.0.0...v1.1.0) (2026-09-12)

### ✨ New Features

* remove example patch and clean patch list ([0841e34](https://github.com/Z-drgon/morphe-patches/commit/0841e3425f2bbaf1050cecc09c148dc9c31be0d1))

## 1.0.0 (2026-09-12)

### ✨ New Features

* add Direct-to-Cell satellite data optimization patch ([0a376be](https://github.com/Z-drgon/morphe-patches/commit/0a376bef080d10d0f3a2eb1020ce5baf3818234a))
