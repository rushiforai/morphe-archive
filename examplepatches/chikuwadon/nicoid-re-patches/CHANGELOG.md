## 1.4.1 (2026-10-03)

### 🐛 Bug Fixes

* **nicoid:** Show video statistics with play, comment, heart, and folder icons in the official order.
* **nicoid:** Dim video statistics icons in dark mode and remove the registration prompt and divider from video information.

## 1.4.1-dev.2 (2026-10-03)

### 🐛 Bug Fixes

* **nicoid:** Dim video statistics icons in dark mode and remove the registration prompt and divider from video information.

## 1.4.1-dev.1 (2026-10-03)

### 🐛 Bug Fixes

* **nicoid:** Show video statistics with play, comment, heart, and folder icons in the official order.

## 1.4.0 (2026-10-03)

### ✨ New Features

* **nicoid:** Add manual session-cookie sign-in for devices that cannot use the WebView sign-in screen.

### 🐛 Bug Fixes

* **nicoid:** Restore video cache downloads with the required delivery cookie and Origin header.
* **nicoid:** Open external pop-up playback links without bringing the main app to the foreground.

## 1.4.0-dev.1 (2026-10-03)

### ✨ New Features

* **nicoid:** Add manual session-cookie sign-in for devices that cannot use the WebView sign-in screen, with Japanese, English, and Traditional Chinese UI.

### 🐛 Bug Fixes

* **nicoid:** Restore video cache downloads with the required delivery cookie and Origin header.
* **nicoid:** Open external pop-up playback links without bringing the main app to the foreground.

## 1.3.5-dev.3 (2026-10-03)

### 🐛 Bug Fixes

* **nicoid:** Fix an installation failure introduced in the previous development build.

## 1.3.5-dev.2 (2026-10-03)

### 🐛 Bug Fixes

* **nicoid:** Keep the originating app in front when opening a video link in pop-up playback mode.

## 1.3.5-dev.1 (2026-10-03)

### 🐛 Bug Fixes

* **nicoid:** Restore the delivery credential used by video cache downloads.
* **nicoid:** Suppress the outdated Android 11 migration prompt for the current app-specific folder.
* **nicoid:** Clarify cache storage options.

## 1.3.4 (2026-10-02)

### 🐛 Bug Fixes

* **nicoid:** apply selected language to added UI ([0c1f182](https://github.com/chikuwadon/nicoid-re-patches/commit/0c1f1820679bfeafc4eb8230a844889da19e5ce6))

## 1.3.4-dev.1 (2026-10-02)

### 🐛 Bug Fixes

* **nicoid:** apply selected language to added UI ([0c1f182](https://github.com/chikuwadon/nicoid-re-patches/commit/0c1f1820679bfeafc4eb8230a844889da19e5ce6))

## 1.3.3 (2026-10-02)

### 🐛 Bug Fixes

* **nicoid:** Add missing English and Traditional Chinese translations and improve interface wording.
* **nicoid:** Update the patch description in Morphe Manager to English.

## 1.3.2 (2026-10-02)

### 🐛 Bug Fixes

* **nicoid:** Minor fixes have been made.

## 1.3.1 (2026-10-02)

### 🐛 Bug Fixes

* **nicoid:** Minor fixes have been made.

## 1.3.0 (2026-10-02)

### 🐛 Bug Fixes

* **nicoid:** Fix pull-to-refresh getting stuck on search results.
* **nicoid:** Fix Shorts video sizing, seek bar visibility, and swipe navigation.
* **nicoid:** Apply Material You colors to loading indicators and new screens.

### ✨ New Features

* **nicoid:** Add NicoNico Shorts playback with full-screen portrait video and comments.
* **nicoid:** Add swipe navigation and tap-to-show controls for the Shorts list, home, and video information.
* **nicoid:** Add a Shorts home with horizontal thumbnails, keyword search, and refresh.
* **nicoid:** Add an option to hide the Shorts menu entry.
* **nicoid:** Add pull-to-refresh for search results.
* **nicoid:** Add app restart to the menu and debug log sharing to settings.

## [1.3.0-dev.4](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.3.0-dev.3...v1.3.0-dev.4) (2026-10-02)

### 🐛 Bug Fixes

* center the niconico return icon on Shorts home ([98fe020](https://github.com/chikuwadon/nicoid-re-patches/commit/98fe020d27062bec57fe4e243a5004b02c255b4c))

## [1.3.0-dev.3](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.3.0-dev.2...v1.3.0-dev.3) (2026-10-02)

### 🐛 Bug Fixes

* hide Shorts controls, search short videos and finalize home menu ([5b0aefc](https://github.com/chikuwadon/nicoid-re-patches/commit/5b0aefcce6f9a2b1dd80ca6217c8ebc33e06a1ad))
* verify the short-only search endpoint in helper builds ([eaf384a](https://github.com/chikuwadon/nicoid-re-patches/commit/eaf384a9061e6bd8635b548cb268505e722fcaf2))

## [1.3.0-dev.2](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.3.0-dev.1...v1.3.0-dev.2) (2026-10-02)

### 🐛 Bug Fixes

* fill Shorts video area and reorganize playback and menu controls ([475d654](https://github.com/chikuwadon/nicoid-re-patches/commit/475d6549613774ef288f364a319be1916a8fad5c))
* import Shorts list and debug preference widgets ([c3e75d1](https://github.com/chikuwadon/nicoid-re-patches/commit/c3e75d1d15efc8806648f4e7a6ee31545a2ea984))

## [1.3.0-dev.1](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.2.1...v1.3.0-dev.1) (2026-10-02)

### 🐛 Bug Fixes

* check DEX using stable markers ([9553293](https://github.com/chikuwadon/nicoid-re-patches/commit/9553293b64aa45105da9016e2df220f43d704ded))
* create D8 output directory ([b981cec](https://github.com/chikuwadon/nicoid-re-patches/commit/b981cece710eee160dc568466fef01b789b9258a))
* generate patch version before helper compilation ([4882741](https://github.com/chikuwadon/nicoid-re-patches/commit/488274103bb0f3009fb07c6006bd7941368735e3))
* match shorts loading text in build check ([efa1ac9](https://github.com/chikuwadon/nicoid-re-patches/commit/efa1ac9fd99f53fd0c1929f9b6ba2e7dede75a9d))
* preserve existing helper classes when building DEX ([4c0d77a](https://github.com/chikuwadon/nicoid-re-patches/commit/4c0d77ad992b9811c8391a513b5e5846b984064c))
* refresh search via normal loading flow and theme indicator ([073d422](https://github.com/chikuwadon/nicoid-re-patches/commit/073d422c7f32c9de7901a3f182dcb6adaa1a5668))
* retain Morphe package repository for CI builds ([80f5caa](https://github.com/chikuwadon/nicoid-re-patches/commit/80f5caaff1ba6809b1689db62c8926c87fee5150))
* update patch description ([6bd9db6](https://github.com/chikuwadon/nicoid-re-patches/commit/6bd9db6520e61f2612ad8380dc47fac327e60e8c))

### ✨ New Features

* add portrait short-video feed and guarded swipe navigation ([887b3ee](https://github.com/chikuwadon/nicoid-re-patches/commit/887b3eea6cc90befe77c2a38681f8eb48f669128))
* improve Shorts playback and refresh behavior ([2aa2401](https://github.com/chikuwadon/nicoid-re-patches/commit/2aa2401939456fbc8362179966ea4442b689ce61))
* modernize shorts feed, settings and refresh behavior ([1d8e74e](https://github.com/chikuwadon/nicoid-re-patches/commit/1d8e74e72e0168d28518dae8e94e273bb5877129))
* refresh ranking and search lists with pull gesture ([d440fae](https://github.com/chikuwadon/nicoid-re-patches/commit/d440fae35d0f87aee9b0ecd4b88d2df395c373d9))
* rename patch entry to nicoid Re ([92a8b53](https://github.com/chikuwadon/nicoid-re-patches/commit/92a8b53acd552940b3af128fa4648399a4bb1476))

## [1.2.0-dev.8](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.2.0-dev.7...v1.2.0-dev.8) (2026-10-02)

### ✨ New Features

* improve Shorts playback and refresh behavior ([2aa2401](https://github.com/chikuwadon/nicoid-re-patches/commit/2aa2401939456fbc8362179966ea4442b689ce61))

## [1.2.0-dev.7](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.2.0-dev.6...v1.2.0-dev.7) (2026-10-02)

### 🐛 Bug Fixes

* preserve existing helper classes when building DEX ([4c0d77a](https://github.com/chikuwadon/nicoid-re-patches/commit/4c0d77ad992b9811c8391a513b5e5846b984064c))

## [1.2.0-dev.6](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.2.0-dev.5...v1.2.0-dev.6) (2026-10-02)

### 🐛 Bug Fixes

* check DEX using stable markers ([9553293](https://github.com/chikuwadon/nicoid-re-patches/commit/9553293b64aa45105da9016e2df220f43d704ded))
* create D8 output directory ([b981cec](https://github.com/chikuwadon/nicoid-re-patches/commit/b981cece710eee160dc568466fef01b789b9258a))
* generate patch version before helper compilation ([4882741](https://github.com/chikuwadon/nicoid-re-patches/commit/488274103bb0f3009fb07c6006bd7941368735e3))
* match shorts loading text in build check ([efa1ac9](https://github.com/chikuwadon/nicoid-re-patches/commit/efa1ac9fd99f53fd0c1929f9b6ba2e7dede75a9d))
* retain Morphe package repository for CI builds ([80f5caa](https://github.com/chikuwadon/nicoid-re-patches/commit/80f5caaff1ba6809b1689db62c8926c87fee5150))

### ✨ New Features

* modernize shorts feed, settings and refresh behavior ([1d8e74e](https://github.com/chikuwadon/nicoid-re-patches/commit/1d8e74e72e0168d28518dae8e94e273bb5877129))

## [1.2.0-dev.5](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.2.0-dev.4...v1.2.0-dev.5) (2026-10-01)

### ✨ New Features

* add portrait short-video feed and guarded swipe navigation ([887b3ee](https://github.com/chikuwadon/nicoid-re-patches/commit/887b3eea6cc90befe77c2a38681f8eb48f669128))

## [1.2.0-dev.4](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.2.0-dev.3...v1.2.0-dev.4) (2026-10-01)

### 🐛 Bug Fixes

* refresh search via normal loading flow and theme indicator ([073d422](https://github.com/chikuwadon/nicoid-re-patches/commit/073d422c7f32c9de7901a3f182dcb6adaa1a5668))

## [1.2.0-dev.3](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.2.0-dev.2...v1.2.0-dev.3) (2026-10-01)

### ✨ New Features

* refresh ranking and search lists with pull gesture ([d440fae](https://github.com/chikuwadon/nicoid-re-patches/commit/d440fae35d0f87aee9b0ecd4b88d2df395c373d9))

## [1.2.0-dev.2](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.2.0-dev.1...v1.2.0-dev.2) (2026-10-01)

### 🐛 Bug Fixes

* update patch description ([6bd9db6](https://github.com/chikuwadon/nicoid-re-patches/commit/6bd9db6520e61f2612ad8380dc47fac327e60e8c))

## [1.2.0-dev.1](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.1.0...v1.2.0-dev.1) (2026-10-01)

### ✨ New Features

* rename patch entry to nicoid Re ([92a8b53](https://github.com/chikuwadon/nicoid-re-patches/commit/92a8b53acd552940b3af128fa4648399a4bb1476))

## [1.1.0](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.0.0...v1.1.0) (2026-10-01)

### 🐛 Bug Fixes

* expose popup and background playback in related-video menus ([cd0fa3d](https://github.com/chikuwadon/nicoid-re-patches/commit/cd0fa3dffd2f250495bfcedf787fa3f10a2ffb21))

### ✨ New Features

* add playback policies and improve popup and video information ([3ea7f8a](https://github.com/chikuwadon/nicoid-re-patches/commit/3ea7f8a56b7c11f3659d5bb78a8958313f50b116))
* release nicoid Re v1.1.0 ([5946e79](https://github.com/chikuwadon/nicoid-re-patches/commit/5946e79a9135c620021c37e743c2ba1b84aaa6a2))

## [1.1.0-dev.2](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.1.0-dev.1...v1.1.0-dev.2) (2026-10-01)

### 🐛 Bug Fixes

* expose popup and background playback in related-video menus ([cd0fa3d](https://github.com/chikuwadon/nicoid-re-patches/commit/cd0fa3dffd2f250495bfcedf787fa3f10a2ffb21))

## [1.1.0-dev.1](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.0.0...v1.1.0-dev.1) (2026-10-01)

### ✨ New Features

* add playback policies and improve popup and video information ([3ea7f8a](https://github.com/chikuwadon/nicoid-re-patches/commit/3ea7f8a56b7c11f3659d5bb78a8958313f50b116))

## 1.0.0 (2026-10-01)

### ✨ New Features

* prepare stable nicoid mod v1.00 release ([491641d](https://github.com/chikuwadon/nicoid-re-patches/commit/491641d5f521bacf0e7b72e51ff1124a22398cdd))
* release nicoid Re v1.00 ([bcc5118](https://github.com/chikuwadon/nicoid-re-patches/commit/bcc5118bd10929ebe801c9f48a610185755e69df))

## 1.0.0-dev.1 (2026-09-30)

### ✨ New Features

* prepare stable nicoid mod v1.00 release ([491641d](https://github.com/chikuwadon/nicoid-re-patches/commit/491641d5f521bacf0e7b72e51ff1124a22398cdd))
