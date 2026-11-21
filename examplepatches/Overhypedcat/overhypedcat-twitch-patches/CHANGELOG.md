## [4.2.0](https://github.com/[secure]/overhypedcat-twitch-patches/compare/v4.1.1...v4.2.0) (2026-11-20)

### New Features

* Screen lock inside the player's controls, song removal status in a few words, patcher 2.4.0 ([a4f0a68](https://github.com/[secure]/overhypedcat-twitch-patches/commit/a4f0a68baa1c8c179c900eb81897b29fe6ca0cc2))

## [4.1.1](https://github.com/[secure]/overhypedcat-twitch-patches/compare/v4.1.0...v4.1.1) (2026-11-16)

### Bug Fixes

* Song pill in the vertical view, and review fixes for the screen lock ([8b462b7](https://github.com/[secure]/overhypedcat-twitch-patches/commit/8b462b71b7f2346c5d582553e9fe0c8d18fd262c))
* The screen lock works on both of Twitch's players and moves aside for labels ([bef5262](https://github.com/[secure]/overhypedcat-twitch-patches/commit/bef5262b356539e0da30aa9a4fc69bb5246f3f02))

## [4.1.0](https://github.com/[secure]/overhypedcat-twitch-patches/compare/v4.0.1...v4.1.0) (2026-11-16)

### Bug Fixes

* Display ads beside the stream (LeftThird, Banner) are declined ([0c61303](https://github.com/[secure]/overhypedcat-twitch-patches/commit/0c613037f5d70a73b29ca6270714766b323a2048))

### New Features

* Screen lock in full screen, and a song removal pill on the player ([651b810](https://github.com/[secure]/overhypedcat-twitch-patches/commit/651b81079092fb9a23fd1226c543b810d2d70c7c))

## [4.0.1](https://github.com/[secure]/overhypedcat-twitch-patches/compare/v4.0.0...v4.0.1) (2026-11-15)

### Bug Fixes

* Patch switches in full screen and in the vertical view's Options ([dd1074d](https://github.com/[secure]/overhypedcat-twitch-patches/commit/dd1074da019b079ebd3b7b503889f19d200ab0ad))
* Safer injection of the patch switches in every Options layout ([33508c0](https://github.com/[secure]/overhypedcat-twitch-patches/commit/33508c0ecafd2e13888c81b43386c5bce69a3229))

## [4.0.0](https://github.com/[secure]/overhypedcat-twitch-patches/compare/v3.0.3...v4.0.0) (2026-11-15)

### ⚠ BREAKING CHANGES

* the Detailed log switch in Settings, Preferences is gone; it is Debug mode in Settings, Patch settings now.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01CMF1BzWRsg9zTYU8F2p8HB

### Bug Fixes

* Lasting song removal problems stay shown, a replaced VPN server is never reused ([6dbf64d](https://github.com/[secure]/overhypedcat-twitch-patches/commit/6dbf64d33e1a7c59be503e4250ccde8bfc1a7b04))
* One toast for a song library problem, and Add a VPN server clears once one is added ([b2288e3](https://github.com/[secure]/overhypedcat-twitch-patches/commit/b2288e360a761071dc717c1434a3a5af97328d62))
* Polish of song removal, the quality unlock and the settings ([f16b187](https://github.com/[secure]/overhypedcat-twitch-patches/commit/f16b1877ab3b69f21c7e19d4059ca11978aceaa1))
* Song copies are decoded about twice as fast ([8872e1a](https://github.com/[secure]/overhypedcat-twitch-patches/commit/8872e1a2f00cb7b5484f26e933fe644cc43154e4))
* Song removal and the VPN only for the stream being watched ([3cf4ed5](https://github.com/[secure]/overhypedcat-twitch-patches/commit/3cf4ed561bae5ee34c304571a1cd9e544f69759d))

### New Features

* Song removal is switched on per channel ([d9c3c6e](https://github.com/[secure]/overhypedcat-twitch-patches/commit/d9c3c6e0ccc75c9a8ffa7d754dc45e9e5472264d))
* Song removal, quality unlock and patch settings ([b2e2f1f](https://github.com/[secure]/overhypedcat-twitch-patches/commit/b2e2f1fce52fe6b96dedcdbd0fbba2abcc8c421f))

## [3.0.3](https://github.com/[secure]/overhypedcat-twitch-patches/compare/v3.0.2...v3.0.3) (2026-11-09)

### Bug Fixes

* No ad label in picture in picture or the mini player ([5aa9f92](https://github.com/[secure]/overhypedcat-twitch-patches/commit/5aa9f92c93a80f8096a781227cd976482babc8f7))

## [3.0.2](https://github.com/[secure]/overhypedcat-twitch-patches/compare/v3.0.1...v3.0.2) (2026-11-09)

### Bug Fixes

* No ad label on feed previews while scrolling ([8790ff3](https://github.com/[secure]/overhypedcat-twitch-patches/commit/8790ff3f0c5a44982729a3590f97d6dd4a1cc38c))

## [3.0.1](https://github.com/[secure]/overhypedcat-twitch-patches/compare/v3.0.0...v3.0.1) (2026-11-09)

### Bug Fixes

* In Audio Only mode the ad block shows as a message instead of a misplaced label ([1532248](https://github.com/[secure]/overhypedcat-twitch-patches/commit/1532248d9dad7fb76bfd701c09a04c46f545f52f))

## [3.0.0](https://github.com/[secure]/overhypedcat-twitch-patches/compare/v2.1.5...v3.0.0) (2026-11-09)

### ⚠ BREAKING CHANGES

* Version 3 of the patches. Includes the fixes and efficiency work since 2.1.5.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01CMF1Byn4vzgmF1mbGXbNkJ

### Bug Fixes

* Backup streams that stop refreshing, false error codes, and less work per playlist ([1c3f24d](https://github.com/[secure]/overhypedcat-twitch-patches/commit/1c3f24dc2b7b1fdcbff9c1a10c73ab194d84d24c))

### New Features

* Version 3, ad feedback for past broadcasts and a message when the label cannot be placed ([b7678e2](https://github.com/[secure]/overhypedcat-twitch-patches/commit/b7678e2922413c61af745e89937ca7b3fef9d333))

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
