## [2.0.0](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.5.0...v2.0.0) (2026-09-05)

### ⚠ BREAKING CHANGES

* "Hide Video Store on home", "Hide ratings until
watched", and "Match bottom nav to top bar color" are no longer
separate Manager patches. Their toggles now live entirely inside "Mod
settings" instead. Anyone with these three enabled as standalone
patches needs to re-patch and turn them on from the Letterboxd Mods
screen instead.

"Hide Video Store" also now defaults to off (it used to default to on
as a standalone patch).

"Hide ratings until watched"'s reveal-style option changed shape: the
single "revealStyle" list is now three separate Mod settings options,
Cover, Reveal animation, and Confetti color.

### chore

* Consolidate 3 patches into Mod settings; flip Hide Video Store default ([6a0ed2e](https://github.com/mvaishak/letterboxd-morphe-patches/commit/6a0ed2e41e7b1b61a49b52931c7e1e2c26a3c659))

### 🐛 Bug Fixes

* Attach preference screen before wiring the dependency ([27594c0](https://github.com/mvaishak/letterboxd-morphe-patches/commit/27594c02fb6055652fa96b1ef39e55ca7f763b32))
* Constrain dialog width so they aren't edge-to-edge ([2d89190](https://github.com/mvaishak/letterboxd-morphe-patches/commit/2d891904ad933a33e455fbba4b8aa873493fd388))
* Drop the streaming-app preview; fix the Cover dialog's forced height ([d4d054c](https://github.com/mvaishak/letterboxd-morphe-patches/commit/d4d054c9a33eb4dae28b5b055f2e29f5ad93d254))
* Explain the Material You / OLED conflict; extend OLED to modal sheets ([7c7de3f](https://github.com/mvaishak/letterboxd-morphe-patches/commit/7c7de3f4e2387a2254e7fce1cc2d7fe11dc65a8b))
* Give ModSettingsActivity its own header instead of the platform action bar ([d33c67b](https://github.com/mvaishak/letterboxd-morphe-patches/commit/d33c67b3e803bb36dae01aff7c090c1135e65514))
* Give the nav-style and reveal-style pickers bordered option cards ([2430bbb](https://github.com/mvaishak/letterboxd-morphe-patches/commit/2430bbb9ee248ae6ba4bbf9778f90f37be053ef6))
* Make "Hide Where to Watch" actually stick ([3b510b5](https://github.com/mvaishak/letterboxd-morphe-patches/commit/3b510b531ef63c43d031c293ea725def07243c46))
* Material You back to a patch; OLED unfilled rating stars ([cd3e568](https://github.com/mvaishak/letterboxd-morphe-patches/commit/cd3e5681238199005017b6fdcda698d0839b4046)), closes [#2E2E2E](https://github.com/mvaishak/letterboxd-morphe-patches/issues/2E2E2E) [#4A4A4A](https://github.com/mvaishak/letterboxd-morphe-patches/issues/4A4A4A)
* Repair invalid escape sequence in Mod settings description ([b2083b9](https://github.com/mvaishak/letterboxd-morphe-patches/commit/b2083b93a288d0741188690ef9bb826ae97a7626))
* Restart/welcome dialog only dismisses via a button (no outside-touch / back) ([9b202ee](https://github.com/mvaishak/letterboxd-morphe-patches/commit/9b202ee6818844542e24f8b09e320e203d01715a))
* Shorten OLED conflict text; extend OLED to tag chips; Mod settings follows the app theme ([ea94a4f](https://github.com/mvaishak/letterboxd-morphe-patches/commit/ea94a4fa0aa3196236d1d2d7a51bbca0842a29cf))
* Show all 3 Material You tones; theme the accent picker's background ([2760e54](https://github.com/mvaishak/letterboxd-morphe-patches/commit/2760e548a62f4ff1e3f1f5a089d4accfa10eeb01))
* Simplify Open in player to on/off; shrink the button ([1e37148](https://github.com/mvaishak/letterboxd-morphe-patches/commit/1e37148fbd847d206d77b4ae59b195223d56e4b1))
* Space out the streaming button; fix the tag chip's literal hardcoded colors ([2a8d6db](https://github.com/mvaishak/letterboxd-morphe-patches/commit/2a8d6db6ab59b98c11a071bcb29ba593c01cb3b4))
* Tag chips always match colorPrimary (e.g. the Film button), not forced black ([e25483d](https://github.com/mvaishak/letterboxd-morphe-patches/commit/e25483de6219b2852437bc5381a9754afa977a25))
* Update instructions for accessing Mod settings in README and patch description ([9c74762](https://github.com/mvaishak/letterboxd-morphe-patches/commit/9c7476249461cdf2705169a532810a9098a0b948))
* Use a platform theme for ModSettingsActivity ([a31eec5](https://github.com/mvaishak/letterboxd-morphe-patches/commit/a31eec5614d37043b48a4d901736a78802c768d3))
* Use Letterboxd's own font for the tap-to-reveal text ([c743c41](https://github.com/mvaishak/letterboxd-morphe-patches/commit/c743c41cc1211ec4dae2d6df8ba1ff2da2ec9fce))
* Use tone 200 for Material You accents, not 600 ([4fb43d7](https://github.com/mvaishak/letterboxd-morphe-patches/commit/4fb43d7610f798ff4a72b2cae0151da73a228b55))
* Welcome dialog — show after login, mark seen only on dismiss ([987a93f](https://github.com/mvaishak/letterboxd-morphe-patches/commit/987a93ff75b7a7c92061eadc88732e7ad71f1fb7))
* welcome dialog fingerprint; MY locks nav-match; reveal-style previews ([e106e14](https://github.com/mvaishak/letterboxd-morphe-patches/commit/e106e1429f0def01712dff0169e45f591a5ca9a4))

### ✨ New Features

* Add 'Mod settings' patch (Phase 1 — settings shell) ([0952b9b](https://github.com/mvaishak/letterboxd-morphe-patches/commit/0952b9b603e8fc0aea57b15a673ee44cb1bdfea0))
* Add "Classic red" confetti color; default to Confetti + Letterboxd colors ([5df6cd0](https://github.com/mvaishak/letterboxd-morphe-patches/commit/5df6cd08e46e51380247f35f60352b22636a5409))
* Add Pixel crumble and Confetti reveal styles; drop panel/shimmer captions ([b4159fd](https://github.com/mvaishak/letterboxd-morphe-patches/commit/b4159fdacdb137a879ddbf92beea40de203169a7))
* Crumble as a transition modifier; confetti as a real floating burst ([7324249](https://github.com/mvaishak/letterboxd-morphe-patches/commit/7324249a5ef9dd98e584d34a1fef11ae15e10031))
* Fold 5 toggles into Mod settings; add Hide Where to Watch and Open in player ([c9f07f7](https://github.com/mvaishak/letterboxd-morphe-patches/commit/c9f07f718d3dfa18823d357fe678e505d12bba40))
* In-app entry point — long-press the profile-tab settings icon ([8f652dd](https://github.com/mvaishak/letterboxd-morphe-patches/commit/8f652dd87f203f1926f9693b82dacc49089acd6d))
* In-app Material You (wallpaper tint) surface style ([0ae77f6](https://github.com/mvaishak/letterboxd-morphe-patches/commit/0ae77f64af5e357c90788bc6d0016e6f8839a7c7))
* Lock OLED under Material You; nav-style previews; welcome dialog; rename ([3cd71dd](https://github.com/mvaishak/letterboxd-morphe-patches/commit/3cd71ddcc61da06c0b522a7d957acf1529c56b02))
* Material You accent — device tone in the picker, default when active ([d4799d0](https://github.com/mvaishak/letterboxd-morphe-patches/commit/d4799d00d5fd8dee22918a6cc4f64c479d0ff0ab))
* Morphe-style accent picker + HSV hex dialog ([cef81bb](https://github.com/mvaishak/letterboxd-morphe-patches/commit/cef81bb75f81153da116dea51adf9051b8c67879))
* Phase 2 — gate 'Hide Video Store on home' on Prefs ([729bd77](https://github.com/mvaishak/letterboxd-morphe-patches/commit/729bd77df58ca6b6e506b0a179330060aeeba66d))
* Phase 3 — make 'Match bottom nav to top bar color' runtime-toggleable ([572e148](https://github.com/mvaishak/letterboxd-morphe-patches/commit/572e148f8fe67df03dac81d456afa8a771817d10)), closes [#000000](https://github.com/mvaishak/letterboxd-morphe-patches/issues/000000)
* Phase 4 Slice 1 — runtime OLED overlay via ResourcesLoader ([f22ec27](https://github.com/mvaishak/letterboxd-morphe-patches/commit/f22ec273d0c9dcb039cec54357c12153c7eed7e1))
* Phase 4 Slice 2 — accent-colour presets + OLED navbar note ([17c833b](https://github.com/mvaishak/letterboxd-morphe-patches/commit/17c833b61e4494ac66cc31f129c033733741596b))
* Phase 4 Slice 3 — custom hex accent (on-device .arsc encoder) ([fa52a96](https://github.com/mvaishak/letterboxd-morphe-patches/commit/fa52a969872128cb3a454c3261edf0ec9ecfa25a))
* Prompt to restart when a restart-only setting changes ([c8bd313](https://github.com/mvaishak/letterboxd-morphe-patches/commit/c8bd313faff0314052b3445939b71f4d1cbcfcae))
* Real Nuvio deep link; restore Stremio/Nuvio picker ([b73f37e](https://github.com/mvaishak/letterboxd-morphe-patches/commit/b73f37ebfba542bde424924fdb4a11295f86362d))
* Restart lands on the home tab ([0dbf698](https://github.com/mvaishak/letterboxd-morphe-patches/commit/0dbf6986dd1519c68fc47e8c2d8857a09074fd04))
* Restart to the profile tab; themed restart/welcome dialogs ([470c23b](https://github.com/mvaishak/letterboxd-morphe-patches/commit/470c23b3e56b9dc2cde6624b87b735eae5a5591e))
* Split reveal style into Cover/Animation/Confetti color; add haptics ([f4d25be](https://github.com/mvaishak/letterboxd-morphe-patches/commit/f4d25be9ee44e037e6f6fb116e8a91f60e0681c9))

## [2.0.0-dev.1](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.6.0-dev.1...v2.0.0-dev.1) (2026-09-05)

### ⚠ BREAKING CHANGES

* "Hide Video Store on home", "Hide ratings until
watched", and "Match bottom nav to top bar color" are no longer
separate Manager patches. Their toggles now live entirely inside "Mod
settings" instead. Anyone with these three enabled as standalone
patches needs to re-patch and turn them on from the Letterboxd Mods
screen instead.

"Hide Video Store" also now defaults to off (it used to default to on
as a standalone patch).

"Hide ratings until watched"'s reveal-style option changed shape: the
single "revealStyle" list is now three separate Mod settings options,
Cover, Reveal animation, and Confetti color.

### chore

* Consolidate 3 patches into Mod settings; flip Hide Video Store default ([6a0ed2e](https://github.com/mvaishak/letterboxd-morphe-patches/commit/6a0ed2e41e7b1b61a49b52931c7e1e2c26a3c659))

### 🐛 Bug Fixes

* Drop the streaming-app preview; fix the Cover dialog's forced height ([d4d054c](https://github.com/mvaishak/letterboxd-morphe-patches/commit/d4d054c9a33eb4dae28b5b055f2e29f5ad93d254))
* Explain the Material You / OLED conflict; extend OLED to modal sheets ([7c7de3f](https://github.com/mvaishak/letterboxd-morphe-patches/commit/7c7de3f4e2387a2254e7fce1cc2d7fe11dc65a8b))
* Give the nav-style and reveal-style pickers bordered option cards ([2430bbb](https://github.com/mvaishak/letterboxd-morphe-patches/commit/2430bbb9ee248ae6ba4bbf9778f90f37be053ef6))
* Make "Hide Where to Watch" actually stick ([3b510b5](https://github.com/mvaishak/letterboxd-morphe-patches/commit/3b510b531ef63c43d031c293ea725def07243c46))
* Shorten OLED conflict text; extend OLED to tag chips; Mod settings follows the app theme ([ea94a4f](https://github.com/mvaishak/letterboxd-morphe-patches/commit/ea94a4fa0aa3196236d1d2d7a51bbca0842a29cf))
* Show all 3 Material You tones; theme the accent picker's background ([2760e54](https://github.com/mvaishak/letterboxd-morphe-patches/commit/2760e548a62f4ff1e3f1f5a089d4accfa10eeb01))
* Simplify Open in player to on/off; shrink the button ([1e37148](https://github.com/mvaishak/letterboxd-morphe-patches/commit/1e37148fbd847d206d77b4ae59b195223d56e4b1))
* Space out the streaming button; fix the tag chip's literal hardcoded colors ([2a8d6db](https://github.com/mvaishak/letterboxd-morphe-patches/commit/2a8d6db6ab59b98c11a071bcb29ba593c01cb3b4))
* Tag chips always match colorPrimary (e.g. the Film button), not forced black ([e25483d](https://github.com/mvaishak/letterboxd-morphe-patches/commit/e25483de6219b2852437bc5381a9754afa977a25))
* Use Letterboxd's own font for the tap-to-reveal text ([c743c41](https://github.com/mvaishak/letterboxd-morphe-patches/commit/c743c41cc1211ec4dae2d6df8ba1ff2da2ec9fce))
* Use tone 200 for Material You accents, not 600 ([4fb43d7](https://github.com/mvaishak/letterboxd-morphe-patches/commit/4fb43d7610f798ff4a72b2cae0151da73a228b55))

### ✨ New Features

* Add "Classic red" confetti color; default to Confetti + Letterboxd colors ([5df6cd0](https://github.com/mvaishak/letterboxd-morphe-patches/commit/5df6cd08e46e51380247f35f60352b22636a5409))
* Add Pixel crumble and Confetti reveal styles; drop panel/shimmer captions ([b4159fd](https://github.com/mvaishak/letterboxd-morphe-patches/commit/b4159fdacdb137a879ddbf92beea40de203169a7))
* Crumble as a transition modifier; confetti as a real floating burst ([7324249](https://github.com/mvaishak/letterboxd-morphe-patches/commit/7324249a5ef9dd98e584d34a1fef11ae15e10031))
* Fold 5 toggles into Mod settings; add Hide Where to Watch and Open in player ([c9f07f7](https://github.com/mvaishak/letterboxd-morphe-patches/commit/c9f07f718d3dfa18823d357fe678e505d12bba40))
* Material You accent — device tone in the picker, default when active ([d4799d0](https://github.com/mvaishak/letterboxd-morphe-patches/commit/d4799d00d5fd8dee22918a6cc4f64c479d0ff0ab))
* Real Nuvio deep link; restore Stremio/Nuvio picker ([b73f37e](https://github.com/mvaishak/letterboxd-morphe-patches/commit/b73f37ebfba542bde424924fdb4a11295f86362d))
* Split reveal style into Cover/Animation/Confetti color; add haptics ([f4d25be](https://github.com/mvaishak/letterboxd-morphe-patches/commit/f4d25be9ee44e037e6f6fb116e8a91f60e0681c9))

## [1.6.0-dev.1](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.5.0...v1.6.0-dev.1) (2026-09-04)

### 🐛 Bug Fixes

* Attach preference screen before wiring the dependency ([27594c0](https://github.com/mvaishak/letterboxd-morphe-patches/commit/27594c02fb6055652fa96b1ef39e55ca7f763b32))
* Constrain dialog width so they aren't edge-to-edge ([2d89190](https://github.com/mvaishak/letterboxd-morphe-patches/commit/2d891904ad933a33e455fbba4b8aa873493fd388))
* Give ModSettingsActivity its own header instead of the platform action bar ([d33c67b](https://github.com/mvaishak/letterboxd-morphe-patches/commit/d33c67b3e803bb36dae01aff7c090c1135e65514))
* Material You back to a patch; OLED unfilled rating stars ([cd3e568](https://github.com/mvaishak/letterboxd-morphe-patches/commit/cd3e5681238199005017b6fdcda698d0839b4046)), closes [#2E2E2E](https://github.com/mvaishak/letterboxd-morphe-patches/issues/2E2E2E) [#4A4A4A](https://github.com/mvaishak/letterboxd-morphe-patches/issues/4A4A4A)
* Repair invalid escape sequence in Mod settings description ([b2083b9](https://github.com/mvaishak/letterboxd-morphe-patches/commit/b2083b93a288d0741188690ef9bb826ae97a7626))
* Restart/welcome dialog only dismisses via a button (no outside-touch / back) ([9b202ee](https://github.com/mvaishak/letterboxd-morphe-patches/commit/9b202ee6818844542e24f8b09e320e203d01715a))
* Update instructions for accessing Mod settings in README and patch description ([9c74762](https://github.com/mvaishak/letterboxd-morphe-patches/commit/9c7476249461cdf2705169a532810a9098a0b948))
* Use a platform theme for ModSettingsActivity ([a31eec5](https://github.com/mvaishak/letterboxd-morphe-patches/commit/a31eec5614d37043b48a4d901736a78802c768d3))
* Welcome dialog — show after login, mark seen only on dismiss ([987a93f](https://github.com/mvaishak/letterboxd-morphe-patches/commit/987a93ff75b7a7c92061eadc88732e7ad71f1fb7))
* welcome dialog fingerprint; MY locks nav-match; reveal-style previews ([e106e14](https://github.com/mvaishak/letterboxd-morphe-patches/commit/e106e1429f0def01712dff0169e45f591a5ca9a4))

### ✨ New Features

* Add 'Mod settings' patch (Phase 1 — settings shell) ([0952b9b](https://github.com/mvaishak/letterboxd-morphe-patches/commit/0952b9b603e8fc0aea57b15a673ee44cb1bdfea0))
* In-app entry point — long-press the profile-tab settings icon ([8f652dd](https://github.com/mvaishak/letterboxd-morphe-patches/commit/8f652dd87f203f1926f9693b82dacc49089acd6d))
* In-app Material You (wallpaper tint) surface style ([0ae77f6](https://github.com/mvaishak/letterboxd-morphe-patches/commit/0ae77f64af5e357c90788bc6d0016e6f8839a7c7))
* Lock OLED under Material You; nav-style previews; welcome dialog; rename ([3cd71dd](https://github.com/mvaishak/letterboxd-morphe-patches/commit/3cd71ddcc61da06c0b522a7d957acf1529c56b02))
* Morphe-style accent picker + HSV hex dialog ([cef81bb](https://github.com/mvaishak/letterboxd-morphe-patches/commit/cef81bb75f81153da116dea51adf9051b8c67879))
* Phase 2 — gate 'Hide Video Store on home' on Prefs ([729bd77](https://github.com/mvaishak/letterboxd-morphe-patches/commit/729bd77df58ca6b6e506b0a179330060aeeba66d))
* Phase 3 — make 'Match bottom nav to top bar color' runtime-toggleable ([572e148](https://github.com/mvaishak/letterboxd-morphe-patches/commit/572e148f8fe67df03dac81d456afa8a771817d10)), closes [#000000](https://github.com/mvaishak/letterboxd-morphe-patches/issues/000000)
* Phase 4 Slice 1 — runtime OLED overlay via ResourcesLoader ([f22ec27](https://github.com/mvaishak/letterboxd-morphe-patches/commit/f22ec273d0c9dcb039cec54357c12153c7eed7e1))
* Phase 4 Slice 2 — accent-colour presets + OLED navbar note ([17c833b](https://github.com/mvaishak/letterboxd-morphe-patches/commit/17c833b61e4494ac66cc31f129c033733741596b))
* Phase 4 Slice 3 — custom hex accent (on-device .arsc encoder) ([fa52a96](https://github.com/mvaishak/letterboxd-morphe-patches/commit/fa52a969872128cb3a454c3261edf0ec9ecfa25a))
* Prompt to restart when a restart-only setting changes ([c8bd313](https://github.com/mvaishak/letterboxd-morphe-patches/commit/c8bd313faff0314052b3445939b71f4d1cbcfcae))
* Restart lands on the home tab ([0dbf698](https://github.com/mvaishak/letterboxd-morphe-patches/commit/0dbf6986dd1519c68fc47e8c2d8857a09074fd04))
* Restart to the profile tab; themed restart/welcome dialogs ([470c23b](https://github.com/mvaishak/letterboxd-morphe-patches/commit/470c23b3e56b9dc2cde6624b87b735eae5a5591e))

## [1.5.0](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.4.0...v1.5.0) (2026-09-04)

### 🐛 Bug Fixes

* Stop rating stars peeking out under the spoiler overlay ([4746d8d](https://github.com/mvaishak/letterboxd-morphe-patches/commit/4746d8d9c49edccc32a873f970555b5723f8c160))

### ✨ New Features

* Add 'Hide ratings until watched' patch ([76e4984](https://github.com/mvaishak/letterboxd-morphe-patches/commit/76e49844bc02b413530092313077f6e062426ff2))
* Add reveal-style dropdown to 'Hide ratings until watched' ([141ac7c](https://github.com/mvaishak/letterboxd-morphe-patches/commit/141ac7c291538ad3d082632a288a50075014d634))
* Add tap-to-reveal to 'Hide ratings until watched' ([50e9bc3](https://github.com/mvaishak/letterboxd-morphe-patches/commit/50e9bc3e1aadcdb45feb488c444213dd8ae9b275))

## [1.5.0-dev.4](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.5.0-dev.3...v1.5.0-dev.4) (2026-09-04)

### 🐛 Bug Fixes

* Stop rating stars peeking out under the spoiler overlay ([4746d8d](https://github.com/mvaishak/letterboxd-morphe-patches/commit/4746d8d9c49edccc32a873f970555b5723f8c160))

## [1.5.0-dev.3](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.5.0-dev.2...v1.5.0-dev.3) (2026-09-04)

### ✨ New Features

* Add reveal-style dropdown to 'Hide ratings until watched' ([141ac7c](https://github.com/mvaishak/letterboxd-morphe-patches/commit/141ac7c291538ad3d082632a288a50075014d634))

## [1.5.0-dev.2](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.5.0-dev.1...v1.5.0-dev.2) (2026-09-04)

### ✨ New Features

* Add tap-to-reveal to 'Hide ratings until watched' ([50e9bc3](https://github.com/mvaishak/letterboxd-morphe-patches/commit/50e9bc3e1aadcdb45feb488c444213dd8ae9b275))

## [1.5.0-dev.1](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.4.0...v1.5.0-dev.1) (2026-09-03)

### ✨ New Features

* Add 'Hide ratings until watched' patch ([76e4984](https://github.com/mvaishak/letterboxd-morphe-patches/commit/76e49844bc02b413530092313077f6e062426ff2))

## [1.4.0](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.3.0...v1.4.0) (2026-09-02)

### 🐛 Bug Fixes

* Set Brighter Watched-by stars to default; drop Poster corner shape from README ([0bee2b6](https://github.com/mvaishak/letterboxd-morphe-patches/commit/0bee2b68dbed5725ab95b2c0e86e973b93d4d404))

### ✨ New Features

* Accent option becomes a colour picker (any hex) ([177e151](https://github.com/mvaishak/letterboxd-morphe-patches/commit/177e151208c5332a24e7087819edd6444dcacd57)), closes [#1FE86A](https://github.com/mvaishak/letterboxd-morphe-patches/issues/1FE86A)
* Add Brighter Watched-by stars patch and bottom-nav selected-style option ([06a2773](https://github.com/mvaishak/letterboxd-morphe-patches/commit/06a27735185bb1132d7fc331872ec2dda20f6689))
* Remove Poster corner shape patch; Brighter Watched-by stars on by default ([3e55637](https://github.com/mvaishak/letterboxd-morphe-patches/commit/3e55637f9c336b79f1730fc0a164452776e6c751))

## [1.4.0-dev.3](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.4.0-dev.2...v1.4.0-dev.3) (2026-09-02)

### 🐛 Bug Fixes

* Set Brighter Watched-by stars to default; drop Poster corner shape from README ([0bee2b6](https://github.com/mvaishak/letterboxd-morphe-patches/commit/0bee2b68dbed5725ab95b2c0e86e973b93d4d404))

### ✨ New Features

* Remove Poster corner shape patch; Brighter Watched-by stars on by default ([3e55637](https://github.com/mvaishak/letterboxd-morphe-patches/commit/3e55637f9c336b79f1730fc0a164452776e6c751))

## [1.4.0-dev.2](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.4.0-dev.1...v1.4.0-dev.2) (2026-09-02)

### ✨ New Features

* Accent option becomes a colour picker (any hex) ([177e151](https://github.com/mvaishak/letterboxd-morphe-patches/commit/177e151208c5332a24e7087819edd6444dcacd57)), closes [#1FE86A](https://github.com/mvaishak/letterboxd-morphe-patches/issues/1FE86A)

## [1.4.0-dev.1](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.3.0...v1.4.0-dev.1) (2026-09-02)

### ✨ New Features

* Add Brighter Watched-by stars patch and bottom-nav selected-style option ([06a2773](https://github.com/mvaishak/letterboxd-morphe-patches/commit/06a27735185bb1132d7fc331872ec2dda20f6689))

## [1.3.0](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.2.0...v1.3.0) (2026-09-02)

### ✨ New Features

* Add accent-colour option and brighter OLED elevation to Material You ([24eda9b](https://github.com/mvaishak/letterboxd-morphe-patches/commit/24eda9b16f5b71f4bfdf01122498c083e4fbca9f)), closes [#00E054](https://github.com/mvaishak/letterboxd-morphe-patches/issues/00E054) [#1FE86A](https://github.com/mvaishak/letterboxd-morphe-patches/issues/1FE86A) [#161616](https://github.com/mvaishak/letterboxd-morphe-patches/issues/161616) [#2E2E2E](https://github.com/mvaishak/letterboxd-morphe-patches/issues/2E2E2E) [#0A0A0A](https://github.com/mvaishak/letterboxd-morphe-patches/issues/0A0A0A) [#161616](https://github.com/mvaishak/letterboxd-morphe-patches/issues/161616) [#2A2A2A](https://github.com/mvaishak/letterboxd-morphe-patches/issues/2A2A2A)

## [1.2.0-dev.2](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.2.0-dev.1...v1.2.0-dev.2) (2026-09-02)

### ✨ New Features

* Add accent-colour option and brighter OLED elevation to Material You ([24eda9b](https://github.com/mvaishak/letterboxd-morphe-patches/commit/24eda9b16f5b71f4bfdf01122498c083e4fbca9f)), closes [#00E054](https://github.com/mvaishak/letterboxd-morphe-patches/issues/00E054) [#1FE86A](https://github.com/mvaishak/letterboxd-morphe-patches/issues/1FE86A) [#161616](https://github.com/mvaishak/letterboxd-morphe-patches/issues/161616) [#2E2E2E](https://github.com/mvaishak/letterboxd-morphe-patches/issues/2E2E2E) [#0A0A0A](https://github.com/mvaishak/letterboxd-morphe-patches/issues/0A0A0A) [#161616](https://github.com/mvaishak/letterboxd-morphe-patches/issues/161616) [#2A2A2A](https://github.com/mvaishak/letterboxd-morphe-patches/issues/2A2A2A)

## [1.2.0-dev.1](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.1.0...v1.2.0-dev.1) (2026-09-02)

### ✨ New Features

* Add OLED surface option to Material You theme ([e85843c](https://github.com/mvaishak/letterboxd-morphe-patches/commit/e85843c4725118ccd9e65073c8a96dfc2e0e2f89))
* Add poster shape, denser grid, and hide-Video-Store-on-home patches ([49fa23a](https://github.com/mvaishak/letterboxd-morphe-patches/commit/49fa23abd274440f63ec769ace35807a16f88fcb))

## [1.1.0](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.0.0...v1.1.0) (2026-09-02)

### 🐛 Bug Fixes

* Flatten Material You chrome and fix sheet/divider tones ([719d6f7](https://github.com/mvaishak/letterboxd-morphe-patches/commit/719d6f7e73c0fee7789f7946e6c0d30d83c4ecd3))
* Remove the template example patch ([3f965e5](https://github.com/mvaishak/letterboxd-morphe-patches/commit/3f965e55a306ce20162030bdd2f0ecfad3de8a26))

### ✨ New Features

* Add Material You theme patch for Letterboxd ([8e52fc3](https://github.com/mvaishak/letterboxd-morphe-patches/commit/8e52fc3052dee51798192eae3fd2d080a177a7c4))

## [1.1.0-dev.3](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.1.0-dev.2...v1.1.0-dev.3) (2026-09-02)

### 🐛 Bug Fixes

* Remove the template example patch ([3f965e5](https://github.com/mvaishak/letterboxd-morphe-patches/commit/3f965e55a306ce20162030bdd2f0ecfad3de8a26))

## [1.1.0-dev.2](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.1.0-dev.1...v1.1.0-dev.2) (2026-09-02)

### 🐛 Bug Fixes

* Flatten Material You chrome and fix sheet/divider tones ([719d6f7](https://github.com/mvaishak/letterboxd-morphe-patches/commit/719d6f7e73c0fee7789f7946e6c0d30d83c4ecd3))

## [1.1.0-dev.1](https://github.com/mvaishak/letterboxd-morphe-patches/compare/v1.0.0...v1.1.0-dev.1) (2026-09-02)

### ✨ New Features

* Add Material You theme patch for Letterboxd ([8e52fc3](https://github.com/mvaishak/letterboxd-morphe-patches/commit/8e52fc3052dee51798192eae3fd2d080a177a7c4))

## 1.0.0 (2026-09-02)

### ✨ New Features

* Add Letterboxd patch to match bottom nav to top bar color ([a73ad34](https://github.com/mvaishak/letterboxd-morphe-patches/commit/a73ad343913e47d9e461013f6385c10c4cc7ed20))
