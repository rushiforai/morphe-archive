## [1.6.2](https://github.com/Darkaxt/morphe-patches/compare/v1.6.1...v1.6.2) (2026-11-25)

### 🐛 Bug Fixes

* **doodlejump:** fix empty-pool check that disabled off-screen entity persistence ([821e6aa](https://github.com/Darkaxt/morphe-patches/commit/821e6aa49faef686897627f7692c0ad70c939afd))

## [1.6.1](https://github.com/Darkaxt/morphe-patches/compare/v1.6.0...v1.6.1) (2026-11-25)

### 🐛 Bug Fixes

* **doodlejump:** persist off-screen bonuses/monsters/UFOs/black holes and mute off-screen hazard sounds ([219aadb](https://github.com/Darkaxt/morphe-patches/commit/219aadb872d0cb77a1dc064784c6a6014f97bebc))

## [1.6.0](https://github.com/Darkaxt/morphe-patches/compare/v1.5.0...v1.6.0) (2026-11-23)

### ✨ New Features

* **thelonging:** replace global CanvasScaler patch with 4 targeted 4:3/foldable patches ([dc23ff3](https://github.com/Darkaxt/morphe-patches/commit/dc23ff3d4b2827a02aa1189709e79bbcc766859f))

## [1.5.0](https://github.com/Darkaxt/morphe-patches/compare/v1.4.3...v1.5.0) (2026-11-23)

### ✨ New Features

* **thelonging:** add Fix 4:3 / Foldable UI Scaling patch (Unity CanvasScaler Expand mode) ([b6cba0a](https://github.com/Darkaxt/morphe-patches/commit/b6cba0a79286d7ca640089090260fd5b2ce76e25))

## [1.4.3](https://github.com/Darkaxt/morphe-patches/compare/v1.4.2...v1.4.3) (2026-11-23)

### 🐛 Bug Fixes

* **doodlejump:** bridge off-screen pattern-jump gaps up to screen_top+300 and fade in softlock rescues when falling ([7cc015b](https://github.com/Darkaxt/morphe-patches/commit/7cc015b385bf5b2ec663630adea2099d83a11c58))

## [1.4.2](https://github.com/Darkaxt/morphe-patches/compare/v1.4.1...v1.4.2) (2026-11-23)

### 🐛 Bug Fixes

* **doodlejump:** spawn fallback single-use platforms strictly outside the visible screen area ([24bf6e1](https://github.com/Darkaxt/morphe-patches/commit/24bf6e19cf32d38caf997602fbdabacab95afc12))

## [1.4.1](https://github.com/Darkaxt/morphe-patches/compare/v1.4.0...v1.4.1) (2026-11-23)

### 🐛 Bug Fixes

* **doodlejump:** skip bridging below Doodler while climbing and animate injected platforms with native fade-in ([29e71d4](https://github.com/Darkaxt/morphe-patches/commit/29e71d49f9dc6d1628fff25ac94987e0938b7f5c))
* **doodlejump:** spawn fallback single-use platforms strictly outside the visible screen area ([24bf6e1](https://github.com/Darkaxt/morphe-patches/commit/24bf6e19cf32d38caf997602fbdabacab95afc12))

## [1.1.0-dev.4](https://github.com/Darkaxt/morphe-patches/compare/v1.1.0-dev.3...v1.1.0-dev.4) (2026-11-23)

### ✨ New Features

* **doodlejump:** fix pool exhaustion, monster knockback, Game Over transition, top-bar HUD, and +1 life per 10k pts ([390df2e](https://github.com/Darkaxt/morphe-patches/commit/390df2ecf94b9d5fd355b580ff530770f302f6b7))
* **doodlejump:** render life icons using the active theme's Doodler sprite ([8d0e9dc](https://github.com/Darkaxt/morphe-patches/commit/8d0e9dc082c347e94e007bd6d923e0031839edc4))
* **doodlejump:** use single-use disappearing platforms (type 3) for injected gap bridges ([56d7233](https://github.com/Darkaxt/morphe-patches/commit/56d723369850a6bec824c076cc1e297158e349dd))

### 🐛 Bug Fixes

* **doodlejump:** bridge post-pattern vertical gaps immediately off-top instead of after delay ([71a475e](https://github.com/Darkaxt/morphe-patches/commit/71a475e2e92d2b3f8925a4fe25224045a06bdf71))
* **doodlejump:** bridge unreachable >130-unit vertical platform gaps during climbing and falling ([55799d9](https://github.com/Darkaxt/morphe-patches/commit/55799d98f729e04f2fdde1393edbb401ebd83f40))
* **doodlejump:** end run immediately at 0 lives on monster/UFO KO and restore GLES texture/env state ([a575b96](https://github.com/Darkaxt/morphe-patches/commit/a575b96d21120da730fc7871f8666a522d653ff1))
* **doodlejump:** handle all theme special platforms/hazards polymorphically via vtable across all 17 themes ([bffc3c4](https://github.com/Darkaxt/morphe-patches/commit/bffc3c4d3af9a419361bcfaac36106c1e3d969bf))
* **doodlejump:** link libc++ statically so libDoodleJump.so has no libc++_shared.so dependency ([320246e](https://github.com/Darkaxt/morphe-patches/commit/320246e6a2c3b7d4b8e97ef16fc8d26b32731266))
* **doodlejump:** preserve sorted platform history and prevent empty-screen gaps on fall ([e526860](https://github.com/Darkaxt/morphe-patches/commit/e526860eed1ea85d31fd6d4d88b9051f44283f12))
* **doodlejump:** read active theme Doodler sprite from game+0x9010 table ([d197355](https://github.com/Darkaxt/morphe-patches/commit/d19735515271f2931125b711a1bb95598c89f21d))
* **doodlejump:** recognize Winter icicle platforms, prevent platform/monster overlap, and keep top edge populated ([e94f74d](https://github.com/Darkaxt/morphe-patches/commit/e94f74d6224a27b41b2593fe5911ef363c363e63))
* **doodlejump:** recover +1 life per 10,000 clean climb since last damage ([a0bf18f](https://github.com/Darkaxt/morphe-patches/commit/a0bf18f17bee5b13c511dc95bf75c06919c2b28b))
* **doodlejump:** skip bridging below Doodler while climbing and animate injected platforms with native fade-in ([29e71d4](https://github.com/Darkaxt/morphe-patches/commit/29e71d49f9dc6d1628fff25ac94987e0938b7f5c))

## [1.4.0](https://github.com/Darkaxt/morphe-patches/compare/v1.3.7...v1.4.0) (2026-11-23)

### ✨ New Features

* **doodlejump:** use single-use disappearing platforms (type 3) for injected gap bridges ([56d7233](https://github.com/Darkaxt/morphe-patches/commit/56d723369850a6bec824c076cc1e297158e349dd))

## [1.3.7](https://github.com/Darkaxt/morphe-patches/compare/v1.3.6...v1.3.7) (2026-11-23)

### 🐛 Bug Fixes

* **doodlejump:** handle all theme special platforms/hazards polymorphically via vtable across all 17 themes ([bffc3c4](https://github.com/Darkaxt/morphe-patches/commit/bffc3c4d3af9a419361bcfaac36106c1e3d969bf))

## [1.3.6](https://github.com/Darkaxt/morphe-patches/compare/v1.3.5...v1.3.6) (2026-11-23)

### 🐛 Bug Fixes

* **doodlejump:** recognize Winter icicle platforms, prevent platform/monster overlap, and keep top edge populated ([e94f74d](https://github.com/Darkaxt/morphe-patches/commit/e94f74d6224a27b41b2593fe5911ef363c363e63))

## [1.3.5](https://github.com/Darkaxt/morphe-patches/compare/v1.3.4...v1.3.5) (2026-11-23)

### 🐛 Bug Fixes

* **doodlejump:** bridge post-pattern vertical gaps immediately off-top instead of after delay ([71a475e](https://github.com/Darkaxt/morphe-patches/commit/71a475e2e92d2b3f8925a4fe25224045a06bdf71))

## [1.3.4](https://github.com/Darkaxt/morphe-patches/compare/v1.3.3...v1.3.4) (2026-11-23)

### 🐛 Bug Fixes

* **doodlejump:** bridge post-pattern vertical gaps immediately off-top instead of after delay ([71a475e](https://github.com/Darkaxt/morphe-patches/commit/71a475e2e92d2b3f8925a4fe25224045a06bdf71))
* **doodlejump:** bridge unreachable >130-unit vertical platform gaps during climbing and falling ([55799d9](https://github.com/Darkaxt/morphe-patches/commit/55799d98f729e04f2fdde1393edbb401ebd83f40))
* **doodlejump:** end run immediately at 0 lives on monster/UFO KO and restore GLES texture/env state ([a575b96](https://github.com/Darkaxt/morphe-patches/commit/a575b96d21120da730fc7871f8666a522d653ff1))
* **doodlejump:** handle all theme special platforms/hazards polymorphically via vtable across all 17 themes ([bffc3c4](https://github.com/Darkaxt/morphe-patches/commit/bffc3c4d3af9a419361bcfaac36106c1e3d969bf))
* **doodlejump:** link libc++ statically so libDoodleJump.so has no libc++_shared.so dependency ([320246e](https://github.com/Darkaxt/morphe-patches/commit/320246e6a2c3b7d4b8e97ef16fc8d26b32731266))
* **doodlejump:** preserve sorted platform history and prevent empty-screen gaps on fall ([e526860](https://github.com/Darkaxt/morphe-patches/commit/e526860eed1ea85d31fd6d4d88b9051f44283f12))
* **doodlejump:** read active theme Doodler sprite from game+0x9010 table ([d197355](https://github.com/Darkaxt/morphe-patches/commit/d19735515271f2931125b711a1bb95598c89f21d))
* **doodlejump:** recognize Winter icicle platforms, prevent platform/monster overlap, and keep top edge populated ([e94f74d](https://github.com/Darkaxt/morphe-patches/commit/e94f74d6224a27b41b2593fe5911ef363c363e63))
* **doodlejump:** recover +1 life per 10,000 clean climb since last damage ([a0bf18f](https://github.com/Darkaxt/morphe-patches/commit/a0bf18f17bee5b13c511dc95bf75c06919c2b28b))

## [1.1.0-dev.4](https://github.com/Darkaxt/morphe-patches/compare/v1.1.0-dev.3...v1.1.0-dev.4) (2026-11-23)

### ✨ New Features

* **doodlejump:** fix pool exhaustion, monster knockback, Game Over transition, top-bar HUD, and +1 life per 10k pts ([390df2e](https://github.com/Darkaxt/morphe-patches/commit/390df2ecf94b9d5fd355b580ff530770f302f6b7))
* **doodlejump:** render life icons using the active theme's Doodler sprite ([8d0e9dc](https://github.com/Darkaxt/morphe-patches/commit/8d0e9dc082c347e94e007bd6d923e0031839edc4))

### 🐛 Bug Fixes

* **doodlejump:** bridge post-pattern vertical gaps immediately off-top instead of after delay ([71a475e](https://github.com/Darkaxt/morphe-patches/commit/71a475e2e92d2b3f8925a4fe25224045a06bdf71))
* **doodlejump:** bridge unreachable >130-unit vertical platform gaps during climbing and falling ([55799d9](https://github.com/Darkaxt/morphe-patches/commit/55799d98f729e04f2fdde1393edbb401ebd83f40))
* **doodlejump:** end run immediately at 0 lives on monster/UFO KO and restore GLES texture/env state ([a575b96](https://github.com/Darkaxt/morphe-patches/commit/a575b96d21120da730fc7871f8666a522d653ff1))
* **doodlejump:** link libc++ statically so libDoodleJump.so has no libc++_shared.so dependency ([320246e](https://github.com/Darkaxt/morphe-patches/commit/320246e6a2c3b7d4b8e97ef16fc8d26b32731266))
* **doodlejump:** preserve sorted platform history and prevent empty-screen gaps on fall ([e526860](https://github.com/Darkaxt/morphe-patches/commit/e526860eed1ea85d31fd6d4d88b9051f44283f12))
* **doodlejump:** read active theme Doodler sprite from game+0x9010 table ([d197355](https://github.com/Darkaxt/morphe-patches/commit/d19735515271f2931125b711a1bb95598c89f21d))
* **doodlejump:** recognize Winter icicle platforms, prevent platform/monster overlap, and keep top edge populated ([e94f74d](https://github.com/Darkaxt/morphe-patches/commit/e94f74d6224a27b41b2593fe5911ef363c363e63))
* **doodlejump:** recover +1 life per 10,000 clean climb since last damage ([a0bf18f](https://github.com/Darkaxt/morphe-patches/commit/a0bf18f17bee5b13c511dc95bf75c06919c2b28b))

## [1.1.0-dev.4](https://github.com/Darkaxt/morphe-patches/compare/v1.1.0-dev.3...v1.1.0-dev.4) (2026-11-23)

### ✨ New Features

* **doodlejump:** fix pool exhaustion, monster knockback, Game Over transition, top-bar HUD, and +1 life per 10k pts ([390df2e](https://github.com/Darkaxt/morphe-patches/commit/390df2ecf94b9d5fd355b580ff530770f302f6b7))
* **doodlejump:** render life icons using the active theme's Doodler sprite ([8d0e9dc](https://github.com/Darkaxt/morphe-patches/commit/8d0e9dc082c347e94e007bd6d923e0031839edc4))

### 🐛 Bug Fixes

* **doodlejump:** bridge post-pattern vertical gaps immediately off-top instead of after delay ([71a475e](https://github.com/Darkaxt/morphe-patches/commit/71a475e2e92d2b3f8925a4fe25224045a06bdf71))
* **doodlejump:** bridge unreachable >130-unit vertical platform gaps during climbing and falling ([55799d9](https://github.com/Darkaxt/morphe-patches/commit/55799d98f729e04f2fdde1393edbb401ebd83f40))
* **doodlejump:** end run immediately at 0 lives on monster/UFO KO and restore GLES texture/env state ([a575b96](https://github.com/Darkaxt/morphe-patches/commit/a575b96d21120da730fc7871f8666a522d653ff1))
* **doodlejump:** link libc++ statically so libDoodleJump.so has no libc++_shared.so dependency ([320246e](https://github.com/Darkaxt/morphe-patches/commit/320246e6a2c3b7d4b8e97ef16fc8d26b32731266))
* **doodlejump:** preserve sorted platform history and prevent empty-screen gaps on fall ([e526860](https://github.com/Darkaxt/morphe-patches/commit/e526860eed1ea85d31fd6d4d88b9051f44283f12))
* **doodlejump:** read active theme Doodler sprite from game+0x9010 table ([d197355](https://github.com/Darkaxt/morphe-patches/commit/d19735515271f2931125b711a1bb95598c89f21d))
* **doodlejump:** recover +1 life per 10,000 clean climb since last damage ([a0bf18f](https://github.com/Darkaxt/morphe-patches/commit/a0bf18f17bee5b13c511dc95bf75c06919c2b28b))

## [1.1.0-dev.4](https://github.com/Darkaxt/morphe-patches/compare/v1.1.0-dev.3...v1.1.0-dev.4) (2026-11-23)

### ✨ New Features

* **doodlejump:** fix pool exhaustion, monster knockback, Game Over transition, top-bar HUD, and +1 life per 10k pts ([390df2e](https://github.com/Darkaxt/morphe-patches/commit/390df2ecf94b9d5fd355b580ff530770f302f6b7))
* **doodlejump:** render life icons using the active theme's Doodler sprite ([8d0e9dc](https://github.com/Darkaxt/morphe-patches/commit/8d0e9dc082c347e94e007bd6d923e0031839edc4))

### 🐛 Bug Fixes

* **doodlejump:** bridge unreachable >130-unit vertical platform gaps during climbing and falling ([55799d9](https://github.com/Darkaxt/morphe-patches/commit/55799d98f729e04f2fdde1393edbb401ebd83f40))

## [1.3.3](https://github.com/Darkaxt/morphe-patches/compare/v1.3.2...v1.3.3) (2026-11-23)

### 🐛 Bug Fixes

* **doodlejump:** preserve sorted platform history and prevent empty-screen gaps on fall ([e526860](https://github.com/Darkaxt/morphe-patches/commit/e526860eed1ea85d31fd6d4d88b9051f44283f12))

## [1.3.2](https://github.com/Darkaxt/morphe-patches/compare/v1.3.1...v1.3.2) (2026-11-23)

### 🐛 Bug Fixes

* **doodlejump:** end run immediately at 0 lives on monster/UFO KO and restore GLES texture/env state ([a575b96](https://github.com/Darkaxt/morphe-patches/commit/a575b96d21120da730fc7871f8666a522d653ff1))

## [1.3.1](https://github.com/Darkaxt/morphe-patches/compare/v1.3.0...v1.3.1) (2026-11-23)

### 🐛 Bug Fixes

* **doodlejump:** read active theme Doodler sprite from game+0x9010 table ([d197355](https://github.com/Darkaxt/morphe-patches/commit/d19735515271f2931125b711a1bb95598c89f21d))

## [1.3.0](https://github.com/Darkaxt/morphe-patches/compare/v1.2.1...v1.3.0) (2026-11-23)

### ✨ New Features

* **doodlejump:** render life icons using the active theme's Doodler sprite ([8d0e9dc](https://github.com/Darkaxt/morphe-patches/commit/8d0e9dc082c347e94e007bd6d923e0031839edc4))

### 🐛 Bug Fixes

* **doodlejump:** recover +1 life per 10,000 clean climb since last damage ([a0bf18f](https://github.com/Darkaxt/morphe-patches/commit/a0bf18f17bee5b13c511dc95bf75c06919c2b28b))

## [1.2.1](https://github.com/Darkaxt/morphe-patches/compare/v1.2.0...v1.2.1) (2026-11-23)

### 🐛 Bug Fixes

* **doodlejump:** recover +1 life per 10,000 clean climb since last damage ([79df7f3](https://github.com/Darkaxt/morphe-patches/commit/79df7f32ea9fdb346447cef7a9ab0324d4cdd637))

## [1.2.0](https://github.com/Darkaxt/morphe-patches/compare/v1.1.3...v1.2.0) (2026-11-22)

### ✨ New Features

* **doodlejump:** fix pool exhaustion, monster knockback, Game Over transition, top-bar HUD, and +1 life per 10k pts ([390df2e](https://github.com/Darkaxt/morphe-patches/commit/390df2ecf94b9d5fd355b580ff530770f302f6b7))

## [1.1.3](https://github.com/Darkaxt/morphe-patches/compare/v1.1.2...v1.1.3) (2026-11-22)

### 🐛 Bug Fixes

* **doodlejump:** link libc++ statically so libDoodleJump.so has no libc++_shared.so dependency ([320246e](https://github.com/Darkaxt/morphe-patches/commit/320246e6a2c3b7d4b8e97ef16fc8d26b32731266))
* **doodlejump:** release v1.1.3 with statically linked libc++ ([4bc22ba](https://github.com/Darkaxt/morphe-patches/commit/4bc22ba4b66554d4b27de147b78139253d59b523))

## [1.1.2](https://github.com/Darkaxt/morphe-patches/compare/v1.1.1...v1.1.2) (2026-11-22)

### 🐛 Bug Fixes

* **doodlejump:** release v1.1.2 with extractNativeLibs manifest fix ([f1f9188](https://github.com/Darkaxt/morphe-patches/commit/f1f9188972d764183a004dac78d105cdf8e09647))
* **doodlejump:** set android:extractNativeLibs=true for newly added native lib ([cd56999](https://github.com/Darkaxt/morphe-patches/commit/cd569993e71daa52eaf6cba9d19dbec9ab189ac1))

## [1.1.1](https://github.com/Darkaxt/morphe-patches/compare/v1.1.0...v1.1.1) (2026-11-22)

### 🐛 Bug Fixes

* **doodlejump:** load bundled mod library from patch bundle classloader ([7335dbd](https://github.com/Darkaxt/morphe-patches/commit/7335dbdd3a119a91b2e3b3511feeadfb9ce27f17))
* **doodlejump:** release v1.1.1 with bundle classloader fix ([602df71](https://github.com/Darkaxt/morphe-patches/commit/602df71c7e69ff8fe0771c7e3a3eef3783cf1625))

## [1.1.0](https://github.com/Darkaxt/morphe-patches/compare/v1.0.0...v1.1.0) (2026-11-22)

### ✨ New Features

* **doodlejump:** add Foldable Seamless Wide View patch with cylindrical wrap-around rendering ([31ce220](https://github.com/Darkaxt/morphe-patches/commit/31ce220f94eb57b606dff28eb6324809758d06df))
* **doodlejump:** release v1.1.0 with Foldable Seamless Wide View patch ([8f71b56](https://github.com/Darkaxt/morphe-patches/commit/8f71b566df1809f93e243093c29eeace58dd29d8))

### 🐛 Bug Fixes

* remove template example patch ([3af4c48](https://github.com/Darkaxt/morphe-patches/commit/3af4c48b7a141e7e931002fb40610d1a99e2c07f))
* remove template example patch from main ([ee8a9e6](https://github.com/Darkaxt/morphe-patches/commit/ee8a9e674611d09eade94dd828af2350a212812c))

## 1.0.0 (2026-11-22)

### ✨ New Features

* **doodlejump:** add Endless Fall & 3-Lives patch ([3535081](https://github.com/Darkaxt/morphe-patches/commit/353508101bac1fb87c0ca96cb21522a073f1f275))
* **doodlejump:** release v1.0.0 with Endless Fall & 3-Lives patch ([99c8ad8](https://github.com/Darkaxt/morphe-patches/commit/99c8ad8188e0940dc511a4a2ce3c33d71d518f4b))

## 1.0.0-dev.1 (2026-11-22)

### ✨ New Features

* **doodlejump:** add Endless Fall & 3-Lives patch ([3535081](https://github.com/Darkaxt/morphe-patches/commit/353508101bac1fb87c0ca96cb21522a073f1f275))
