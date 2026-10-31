## [1.1.3](https://github.com/steeepaaaan/pdalife-morphe-patches/compare/v1.1.2...v1.1.3) (2026-10-27)

### 🐛 Bug Fixes

* Fix compilation errors in NeutralizePdalifeJniOnLoadPatch.kt ([bbd033d](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/bbd033d01e91f5a0f01d3f2d75f8c88597922f60))

## [1.1.2](https://github.com/steeepaaaan/pdalife-morphe-patches/compare/v1.1.1...v1.1.2) (2026-10-27)

### 🐛 Bug Fixes

* Fix Kotlin compilation errors in NeutralizePdalifeJniOnLoadPatch.kt ([7507a90](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/7507a90bf12f7d9557f4c82e5e2df0955b8a71bb))
* Remove empty gpr.key from gradle.properties so GPR_KEY env var fallback works in CI ([ae2d4fd](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/ae2d4fddfb6a45d0fed3a390ca57b2f609650890))

## [1.1.1](https://github.com/steeepaaaan/pdalife-morphe-patches/compare/v1.1.0...v1.1.1) (2026-10-27)

### 🐛 Bug Fixes

* Keep libPDALIFE.so, remove only PDALIFE.conf/assets to prevent UnsatisfiedLinkError ([48241fb](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/48241fbe0c044f71a6ffcd112a73adf60a26f1bc))

## [1.1.0](https://github.com/steeepaaaan/pdalife-morphe-patches/compare/v1.0.0...v1.1.0) (2026-10-27)

### 🐛 Bug Fixes

* Add GPR_USER/GPR_KEY env var fallbacks for CI credentials ([4d7dadd](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/4d7dadd4c483cf5d90bbc67da640e9f5062b5397))
* Close AndroidManifest.xml document after editing to prevent resource lock ([a271cb1](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/a271cb1bd8c12111f13cf39625602a3a0529aebf))
* Fix System.getenv() null-safe syntax in settings.gradle.kts ([acb1030](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/acb1030299cdd2655cd16db035a931afc1e942f0))
* Pass GPR_KEY/GPR_USER env vars to CI and handle empty gradle.properties values ([c03dd7c](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/c03dd7c6003bbbd485accb7739130fac071d9edb))
* Remove empty gpr.key from gradle.properties so env var fallback works ([48d5f30](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/48d5f30ea33a2844bdb64cd77d046030323b57be))
* Remove empty gpr.key from gradle.properties so GPR_KEY env var fallback works ([d4e6b1a](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/d4e6b1ab0bbdd6dba4f2192d9fb1edca20f4e4a3))
* Set default=false for universal patches (Morphe requirement) ([611f99f](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/611f99fef324ff6206181068015f67bdbacaa062))

### ✨ New Features

* Add universal patches alongside targeted patches ([9aa9317](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/9aa93178ba38c6843bca15749b15de50048c8b1c))
* Make PDALIFE patches universal (always included for all apps) ([53f5461](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/53f54611c9dce8b74382f2e44138fb4c2baed596))

## [1.1.0](https://github.com/steeepaaaan/pdalife-morphe-patches/compare/v1.0.0...v1.1.0) (2026-10-27)

### 🐛 Bug Fixes

* Add GPR_USER/GPR_KEY env var fallbacks for CI credentials ([4d7dadd](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/4d7dadd4c483cf5d90bbc67da640e9f5062b5397))
* Close AndroidManifest.xml document after editing to prevent resource lock ([a271cb1](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/a271cb1bd8c12111f13cf39625602a3a0529aebf))
* Fix System.getenv() null-safe syntax in settings.gradle.kts ([acb1030](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/acb1030299cdd2655cd16db035a931afc1e942f0))
* Pass GPR_KEY/GPR_USER env vars to CI and handle empty gradle.properties values ([c03dd7c](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/c03dd7c6003bbbd485accb7739130fac071d9edb))
* Remove empty gpr.key from gradle.properties so env var fallback works ([48d5f30](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/48d5f30ea33a2844bdb64cd77d046030323b57be))
* Remove empty gpr.key from gradle.properties so GPR_KEY env var fallback works ([d4e6b1a](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/d4e6b1ab0bbdd6dba4f2192d9fb1edca20f4e4a3))
* Set default=false for universal patches (Morphe requirement) ([611f99f](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/611f99fef324ff6206181068015f67bdbacaa062))

### ✨ New Features

* Add universal patches alongside targeted patches ([9aa9317](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/9aa93178ba38c6843bca15749b15de50048c8b1c))
* Make PDALIFE patches universal (always included for all apps) ([53f5461](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/53f54611c9dce8b74382f2e44138fb4c2baed596))

## 1.0.0 (2026-10-27)

### 🐛 Bug Fixes

* Add PATCHES_START/PATCHES_END markers to README ([9c72cab](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/9c72cab93e668ef304cf60bb8f9bc0593e58d20a))
* Make gradlew executable for CI ([ceb04a3](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/ceb04a3cb28459fb04394a6f8df0bf9452047e7d))

### ✨ New Features

* Add universal patch option and remove Shovel Knight Dig ([941b065](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/941b065f4293a0d1db9909bc7340b24bfa814995))
* Initial PDALIFE banner remover patch ([929dc64](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/929dc64e2916aa596944d0212ad4e31814b078a6))
* Trigger release ([be039d0](https://github.com/steeepaaaan/pdalife-morphe-patches/commit/be039d02db784e70142de83c7fa98862a438eb97))
