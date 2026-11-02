## [2.1.5](https://github.com/[secure]/overhypedcat-twitch-patches/compare/v2.1.4...v2.1.5) (2026-11-01)

### Bug Fixes

* Block the main page's banner and feed ads again, without a label ([bff8766](https://github.com/[secure]/overhypedcat-twitch-patches/commit/bff8766c43354e897f38036a17f149c45819374c))

## [2.1.4](https://github.com/[secure]/overhypedcat-twitch-patches/compare/v2.1.3...v2.1.4) (2026-11-01)

### Bug Fixes

* Only block the ad server while a stream is being watched ([768cd84](https://github.com/[secure]/overhypedcat-twitch-patches/commit/768cd84bb86b841cc71e323003136d2cfd967749))

## [2.1.3](https://github.com/[secure]/overhypedcat-twitch-patches/compare/v2.1.2...v2.1.3) (2026-11-01)

### Bug Fixes

* Client-side ad blocking ran on few paths; label tied to the watched stream ([9d4fc80](https://github.com/[secure]/overhypedcat-twitch-patches/commit/9d4fc80731b02735a895fdf9bf790af53e8a2041))

## [2.1.2](https://github.com/[secure]/overhypedcat-twitch-patches/compare/v2.1.1...v2.1.2) (2026-11-01)

### Bug Fixes

* Ad feedback only while watching a stream, over its video ([c505e51](https://github.com/[secure]/overhypedcat-twitch-patches/commit/c505e51d83572303478aa078491e57b2030a0ce1))

## [2.1.1](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v2.1.0...v2.1.1) (2026-11-01)

### Bug Fixes

* Visible "Blocking ads" label and no 5 second stalls during an ad ([9d1d67f](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/9d1d67f3b25b966f07e57370e47b9fd890020c7f))

## [2.1.0](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v2.0.0...v2.1.0) (2026-11-01)

### New Features

* Block the ads the app plays itself ([9be9f21](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/9be9f21f8be90e85bb0216ea698fdc557b4d7aa3))

## [2.0.0](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.3.3...v2.0.0) (2026-10-28)

### ⚠ BREAKING CHANGES

* version 2 of the patches. Ad break handling changed:
breaks are tracked per quality and end after two clean playlist polls.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>

### New Features

* Version 2, fixes from the code review ([c7c7357](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/c7c735759f639ff34ad9d66437c0692799320804))

## [1.3.3](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.3.2...v1.3.3) (2026-10-28)

### Bug Fixes

* Only treat segments as ads while a stitched ad is announced ([e58caf1](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/e58caf13e1953041f0ec3f6ae31a9fce08bc887f))

## [1.3.2](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.3.1...v1.3.2) (2026-10-28)

### Bug Fixes

* Remove the encrypted DNS, keep blocking ad servers ([7b6f9db](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/7b6f9dbf0dd1880ca1ca3247b626dee310cb052e))

## [1.3.1](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.3.0...v1.3.1) (2026-10-28)

### Bug Fixes

* Ask encrypted DNS and the phone's DNS at the same time ([4b24165](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/4b24165fc0c5e57452ea9d980d4372ed25616967))

## [1.3.0](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.2.1...v1.3.0) (2026-10-28)

### New Features

* Block ad servers and use encrypted DNS inside the app ([7345729](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/7345729f26184102f49afe23e4835ed2b384c0ad))

## [1.2.1](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.2.0...v1.2.1) (2026-10-28)

### Bug Fixes

* Ad blocking crashed on every stream in v1.2.0 (E3) ([6231de0](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/6231de0684541ebcb7f59786b03d61d5b8f31f44))

## [1.2.0](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.1.3...v1.2.0) (2026-10-28)

### New Features

* Detailed log switch in Settings, Preferences ([ca0b2e7](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/ca0b2e7c6d88225204c0825e3da85121f21d9a07))

## [1.1.3](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.1.2...v1.1.3) (2026-10-28)

### Bug Fixes

* Stop flooding Twitch with requests when no ad-free stream exists ([7891ea2](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/7891ea2380b3192995d2984da19824603cb0ff9a))

## [1.1.2](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.1.1...v1.1.2) (2026-10-28)

### Bug Fixes

* Leave stream previews alone and hide the label when the ad ends ([6640bbc](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/6640bbc93be149000d83482b9a6bb68a26923325))

## [1.1.2-dev.1](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.1.1...v1.1.2-dev.1) (2026-10-28)

### Bug Fixes

* Leave stream previews alone and hide the label when the ad ends ([6640bbc](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/6640bbc93be149000d83482b9a6bb68a26923325))

## [1.1.1](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.1.0...v1.1.1) (2026-10-28)

### Bug Fixes

* Place the Blocking ads label in the corner of the video ([5d49b84](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/5d49b84cfdef17d8f034d35f7de8c764bf5c24c9))
* Stop false E1 warning when opening a stream ([8554c25](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/8554c2566984a1cab48f9d529c54b335bb1dcd16))

## [1.1.1-dev.1](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.1.0...v1.1.1-dev.1) (2026-10-28)

### Bug Fixes

* Place the Blocking ads label in the corner of the video ([5d49b84](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/5d49b84cfdef17d8f034d35f7de8c764bf5c24c9))
* Stop false E1 warning when opening a stream ([8554c25](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/8554c2566984a1cab48f9d529c54b335bb1dcd16))

## [1.1.0](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.0.0...v1.1.0) (2026-10-28)

### Bug Fixes

* Stop endless loading when switching between ad-free and original stream ([20d64c6](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/20d64c65ef16445367745a044cd95e1f31fe6ddb))

### New Features

* Show a small "Blocking ads" label while an ad break is blocked ([eb0c7d3](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/eb0c7d3697a7c9487ee5ddcf3b86dbf220e6d488))

## [1.1.0-dev.1](https://github.com/Overhypedcat/overhypedcat-twitch-patches/compare/v1.0.0...v1.1.0-dev.1) (2026-10-28)

### Bug Fixes

* Stop endless loading when switching between ad-free and original stream ([20d64c6](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/20d64c65ef16445367745a044cd95e1f31fe6ddb))

### New Features

* Show a small "Blocking ads" label while an ad break is blocked ([eb0c7d3](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/eb0c7d3697a7c9487ee5ddcf3b86dbf220e6d488))

## 1.0.0 (2026-10-28)

### New Features

* Block Twitch stream ads ([53bce00](https://github.com/Overhypedcat/overhypedcat-twitch-patches/commit/53bce00f902913ed0e0ba3ee608c4c0caf58aa4b))
