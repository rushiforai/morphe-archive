## 1.8.0 (2026-10-08)

### ✨ New Features

* **nicoid:** Restore Nico Reports with creator and activity filters, including video-view milestones.
* **nicoid:** Add My Page with profile information and shortcuts to account pages.
* **nicoid:** Add creator follow and unfollow controls to video information, with an option to hide the follow button. ([#39](https://github.com/chikuwadon/nicoid-re-patches/issues/39))
* **nicoid:** Show series, parent works and child works in video information, with thumbnails, expandable lists and in-app playback for videos.
* **nicoid:** Add settings search.
* **nicoid:** Add an NG comment manager with rule creation, deletion and batch deletion.
* **nicoid:** Expand content filtering with partial, exact and regular-expression matching, rule enable/disable controls, and confirmed single or batch deletion.

### 🐛 Bug Fixes

* **nicoid:** Restore normal playback at the current position when returning to the app from automatic background playback. ([#37](https://github.com/chikuwadon/nicoid-re-patches/issues/37))
* **nicoid:** Fix a crash when returning to normal playback after extended popup playback.
* **nicoid:** Fix deletion of account watch history. ([#38](https://github.com/chikuwadon/nicoid-re-patches/issues/38))
* **nicoid:** Apply dark-mode colors to the license dialog and content-filter forms.
* **nicoid:** Fix the missing English translation for the startup-screen setting.

### 🔧 Improvements

* **nicoid:** Rename the Content filter settings category to Other and move content filtering, search suggestions, sidebar Shorts visibility and creator follow-button visibility into it.
* **nicoid:** Use compact My Page rows and a circular follow icon with a distinct following state.
* **nicoid:** Keep all Nico Reports activity filters visible without horizontal scrolling and select Content uploads by default.
* **nicoid:** Reuse loaded series and work lists when expanding them again.

## 1.7.2 (2026-10-07)

### 🐛 Bug Fixes

* **nicoid:** Fix settings-screen theming when using the legacy Android PreferenceActivity.
* **nicoid:** Fix background playback when switching apps and preserve the playback position during the transition. ([#37](https://github.com/chikuwadon/nicoid-re-patches/issues/37))

## 1.7.1 (2026-10-07)

### ✨ New Features

* **nicoid:** Add a bold-comments setting.
* **nicoid:** Add a comment retrieval target in 500-comment steps, up to 10,000 comments, and merge additional modern comment history without duplicates.
* **nicoid:** Add a search-suggestions toggle.

### 🐛 Bug Fixes

* **nicoid:** Restore video titles and thumbnails in Android media controls during normal playback. ([#28](https://github.com/chikuwadon/nicoid-re-patches/issues/28))
* **nicoid:** Apply dark-mode and Material You colors consistently to NG input fields and the empty saved-NG message. ([#27](https://github.com/chikuwadon/nicoid-re-patches/issues/27))
* **nicoid:** Restore single-tap expansion of truncated comments, reserve NG actions for long presses, and recognize rapid double taps correctly. ([#31](https://github.com/chikuwadon/nicoid-re-patches/issues/31))
* **nicoid:** Keep auto-follow and sort controls visible while scrolling, and retain auto-follow until manually disabled. ([#34](https://github.com/chikuwadon/nicoid-re-patches/issues/34))
* **nicoid:** Follow the last comment at or before the current playback position and align it with the bottom of the list. ([#36](https://github.com/chikuwadon/nicoid-re-patches/issues/36))
* **nicoid:** Prevent internal video navigation from triggering app-switch background playback, and let other videos open normally during background playback. ([#37](https://github.com/chikuwadon/nicoid-re-patches/issues/37))
* **nicoid:** Rebind media controls and clear the previous player session when switching between background videos, fixing stopped playback and stale playback times. ([#37](https://github.com/chikuwadon/nicoid-re-patches/issues/37))
* **nicoid:** Align search and NG-input carets with their underlines and use theme-aware video-ID input backgrounds.
* **nicoid:** Complete missing Japanese, English, and Traditional Chinese translations, including reset buttons, startup options, and comment settings.

### 🔧 Improvements

* **nicoid:** Use subdued NG buttons, reduce delete-button size, and confirm before deleting a saved NG rule.
* **nicoid:** Center comment text vertically and reduce comment-list text size to display more rows.
* **nicoid:** Move tap behavior below link behavior in General and remove the empty Video list category.
* **nicoid:** Save debug logs to Downloads after confirmation using `nicoid-re_log_yyyyMMddHHmmss.txt` filenames.
* **nicoid:** Shorten the cast comment-reduction description and clarify the comment retrieval summary.
* **nicoid:** Reduce settings-translation work and comment-history parsing allocations to improve responsiveness.

## 1.7.0 (2026-10-06)

### ✨ New Features

* **nicoid:** Add Android media controls for normal, background, and popup playback, including lock-screen controls. ([#28](https://github.com/chikuwadon/nicoid-re-patches/issues/28))
* **nicoid:** Add an AMOLED dark theme with pure-black backgrounds. ([#30](https://github.com/chikuwadon/nicoid-re-patches/issues/30))
* **nicoid:** Jump to a comment’s playback time by double-tapping it in the comment list. ([#31](https://github.com/chikuwadon/nicoid-re-patches/issues/31))
* **nicoid:** Adjust scrolling-comment speed through the comment display-duration setting. ([#33](https://github.com/chikuwadon/nicoid-re-patches/issues/33))
* **nicoid:** Automatically follow the current playback position in the comment list, including after seeking. ([#34](https://github.com/chikuwadon/nicoid-re-patches/issues/34))
* **nicoid:** Show nicoru counts and selected states, send and undo nicoru reactions, and sort comments by nicoru count. ([#35](https://github.com/chikuwadon/nicoid-re-patches/issues/35))
* **nicoid:** Add video likes with a rounded outline and a fixed label.
* **nicoid:** Add a startup-screen selector, search suggestions, and a separate mobile-data quality setting.

### 🐛 Bug Fixes

* **nicoid:** Fix unreadable NG-registration input fields in dark mode and Material You. ([#27](https://github.com/chikuwadon/nicoid-re-patches/issues/27))
* **nicoid:** Increase comment sizes for full-screen Shorts and keep comments within the viewport. ([#29](https://github.com/chikuwadon/nicoid-re-patches/issues/29))
* **nicoid:** Redraw comment sorting immediately and keep nicoru buttons enabled for undo. ([#35](https://github.com/chikuwadon/nicoid-re-patches/issues/35))
* **nicoid:** Fix ranking refresh behavior and refine playback and popup handling.

### 🔧 Improvements

* **nicoid:** Add sliders for comment size, opacity, shadow size, maximum rows, and display duration.
* **nicoid:** Show saved NG rules with per-item deletion and rounded theme-aware registration/deletion buttons.
* **nicoid:** Refine reaction icons, ranking period selection, search suggestions, and theme consistency.

## 1.6.3 (2026-10-05)

### ✨ New Features

* **nicoid:** Choose Light mode, Dark mode, or Material You from theme settings.

### 🐛 Bug Fixes

* **nicoid:** Restore playback controls in landscape tablet mode. (#26)

### 🔧 Improvements

* **nicoid:** Increase playback-control sizes and spacing in tablet mode.
* **nicoid:** Remove the encyclopedia indicator from video tags because article-existence information is unreliable.

## 1.6.2 (2026-10-05)

### 🐛 Bug Fixes

* **nicoid:** Use icons consistently for video statistics in local and account watch history, and hide unavailable account watch counts.

### 🔧 Improvements

* **nicoid:** Display views, comments, likes, and mylists as icons in video information, with additional spacing around the statistics row.

## 1.6.1 (2026-10-05)

### 🐛 Bug Fixes

* **nicoid:** Complete missing English and Traditional Chinese translations for playback-speed controls, volume/brightness swipe settings, cache operations, permissions, Cast status, sorting, playlists, following, and video statistics.

## 1.6.0 (2026-10-05)

### ✨ New Features
* **nicoid:** Choose a cache folder using the Android folder picker.
* **nicoid:** Adjust playback speed from 0.1× to 3.0× in 0.05× steps with a slider, including the default speed setting.
* **nicoid:** Add optional vertical-swipe volume and brightness controls with accidental-swipe protection.

### 🐛 Bug Fixes
* **nicoid:** Restore offline playback of cached videos and local watch-history persistence.
* **nicoid:** Keep scrolling comments at normal speed during faster playback and fix popup comment outlines and crashes.
* **nicoid:** Keep unrelated comment files out of the selected cache folder and prevent unplayable cache markers from appearing in gallery apps.
* **nicoid:** Apply dark mode to comment-command dialogs and show the default playback speed correctly.

### 🔧 Improvements
* **nicoid:** Group each cached video in its own video-ID folder and consolidate HLS segments into a cache container.
* **nicoid:** Refresh playback icons and refine control sizes, spacing, translucent backgrounds, and fullscreen title bars.
* **nicoid:** Center translucent volume and brightness indicators on the video and use icons with percentage values.
* **nicoid:** Unify rounded dialog styling and improve text-field spacing and underline alignment.
* **nicoid:** Notify when a cache download starts as well as when it finishes.

## 1.5.0 (2026-10-04)

### ✨ New Features
* **nicoid:** Add logout to account settings.
* **nicoid:** Add keyword and channel filters to hide matching videos.
* **nicoid:** Show paid labels on video thumbnails.

### 🐛 Bug Fixes
* **nicoid:** Fix deleted local watch history reappearing after reload and remove duplicated watch-count text.
* **nicoid:** Simplify saved-login summaries and quality labels before loading a video.
* **nicoid:** Support authenticated HLS delivery in Google Cast forwarding.

### 🔧 Improvements
* **nicoid:** Reduce repeated list and thumbnail requests and cancel obsolete loading tasks.

## 1.5.0-dev.8 (2026-10-04)

### 🐛 Bug Fixes

* **nicoid:** Refine paid labels with top-left placement, duration-matched text, a rounded bottom-right corner, and a dark gray background in dark mode.

## 1.5.0-dev.7 (2026-10-04)

### 🐛 Bug Fixes

* **nicoid:** Fix paid labels not appearing when video list rows are first displayed.

## 1.5.0-dev.6 (2026-10-04)

### ✨ New Features

* **nicoid:** Label paid videos in video lists.

## 1.5.0-dev.5 (2026-10-04)

### 🐛 Bug Fixes

* **nicoid:** Reduce repeated ranking/search requests and thumbnail downloads, and optimize content filtering.
* **nicoid:** Cancel obsolete Shorts requests when leaving a screen.

## 1.5.0-dev.4 (2026-10-04)

### 🐛 Bug Fixes

* **nicoid:** Show keyword and channel filters directly below comment settings.
* **nicoid:** Preserve delivery authentication and relay HLS playlists and resources for Google Cast.

## 1.5.0-dev.3 (2026-10-04)

### 🐛 Bug Fixes

* **nicoid:** Show keyword and channel filters directly below comment settings.
* **nicoid:** Preserve delivery authentication and relay HLS playlists and resources for Google Cast.

## 1.5.0-dev.2 (2026-10-04)

### ✨ New Features

* **nicoid:** Add a channel-name filter and place content filters directly below comment settings.

### 🐛 Bug Fixes

* **nicoid:** Add Google Cast diagnostics to distinguish discovery, receiver launch, and stream transfer failures.

## 1.5.0-dev.1 (2026-10-03)

### ✨ New Features

* **nicoid:** Add sign-out and a keyword content filter for video lists and Shorts.

### 🐛 Bug Fixes

* **nicoid:** Fix deleted local watch history reappearing after reload.
* **nicoid:** Remove redundant sign-in, quality, and watch-count descriptions.

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

* **nicoid:** Keep the originating app in front when opening a video link in pop-up playback mode.

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

* **nicoid:** Apply selected language to added UI ([0c1f182](https://github.com/chikuwadon/nicoid-re-patches/commit/0c1f1820679bfeafc4eb8230a844889da19e5ce6))

## 1.3.4-dev.1 (2026-10-02)

### 🐛 Bug Fixes

* **nicoid:** Apply selected language to added UI ([0c1f182](https://github.com/chikuwadon/nicoid-re-patches/commit/0c1f1820679bfeafc4eb8230a844889da19e5ce6))

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

## [1.2.0](https://github.com/chikuwadon/nicoid-re-patches/compare/v1.1.0...v1.2.0) (2026-10-01)

### ✨ New Features

* **nicoid:** rename patch entry to nicoid Re ([3852687](https://github.com/chikuwadon/nicoid-re-patches/commit/3852687e134c206f02e70a98159be229aaf5b4fa))

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

## [1.1.0](https://github.com/chikuwadon/nicoid-mod-patches/compare/v1.0.0...v1.1.0) (2026-10-01)

### 🐛 Bug Fixes

* **nicoid:** expose popup and background playback in related-video menus ([cd0fa3d](https://github.com/chikuwadon/nicoid-mod-patches/commit/cd0fa3dffd2f250495bfcedf787fa3f10a2ffb21))

### ✨ New Features

* **nicoid:** add playback policies and improve popup and video information ([3ea7f8a](https://github.com/chikuwadon/nicoid-mod-patches/commit/3ea7f8a56b7c11f3659d5bb78a8958313f50b116))
* **nicoid:** release nicoid Re v1.1.0 ([5946e79](https://github.com/chikuwadon/nicoid-mod-patches/commit/5946e79a9135c620021c37e743c2ba1b84aaa6a2))

## [1.1.0-dev.2](https://github.com/chikuwadon/nicoid-mod-patches/compare/v1.1.0-dev.1...v1.1.0-dev.2) (2026-10-01)

### 🐛 Bug Fixes

* expose popup and background playback in related-video menus ([cd0fa3d](https://github.com/chikuwadon/nicoid-mod-patches/commit/cd0fa3dffd2f250495bfcedf787fa3f10a2ffb21))

## [1.1.0-dev.1](https://github.com/chikuwadon/nicoid-mod-patches/compare/v1.0.0...v1.1.0-dev.1) (2026-10-01)

### ✨ New Features

* add playback policies and improve popup and video information ([3ea7f8a](https://github.com/chikuwadon/nicoid-mod-patches/commit/3ea7f8a56b7c11f3659d5bb78a8958313f50b116))

## 1.0.0 (2026-10-01)

Changes from the original nicoid 6.49 to nicoid Re v1.0.0.

### ✨ New Features

* **nicoid:** Add an in-app web login using the current NicoNico account page and save the authenticated session.
* **nicoid:** Add optional Material You wallpaper colors on Android 12 and later.
* **nicoid:** Resize popup playback with a two-finger pinch, preserving the video aspect ratio and saving the window bounds.
* **nicoid:** Add popup quality, playback-speed (0.75×, 1×, 1.25×, 1.5×, and 2×), and loop controls.
* **nicoid:** Add five comment sizes (60%, 80%, 100%, 120%, and 140%) for normal and popup playback, applied from the next playback.

### 🐛 Bug Fixes

* **nicoid:** Restore video loading and playback through current watch metadata and authenticated HLS delivery APIs.
* **nicoid:** Restore comment loading through the current comment-thread API.
* **nicoid:** Update ranking, keyword/tag search, and account watch-history retrieval for current service endpoints and response formats.
* **nicoid:** Adapt video caching and cached-comment loading to HLS playback.
* **nicoid:** Fix the comment-renderer transfer crash when returning from popup to normal playback.
* **nicoid:** Preserve the playback position and playing/paused state when changing quality, and map high quality to the highest available stream.
* **nicoid:** Fix light-theme uploader/action backgrounds and comment-list text, including when the system uses dark mode.

### 🔧 Improvements

* **nicoid:** Show available video resolutions in quality settings after metadata loads, with video-dependent descriptions before loading.
* **nicoid:** Place compact, right-aligned popup controls at the top so the seek bar stays unobstructed, and improve text-control readability and touch areas.
* **nicoid:** Clamp popup resizing and movement to screen bounds and suppress button/seek actions during pinch gestures while retaining single-finger movement and corner resizing.
* **nicoid:** Move Google Cast connect/disconnect controls below the comment settings and remove their duplicate menu/sidebar entries.
* **nicoid:** Disable advertising requests and banner creation, and remove advertising startup registrations and the ad-removal billing screen.
* **nicoid:** Identify the modified app as nicoid Re with the separate package `com.sauzask.nicoid.hls` and show the patch version in Settings while retaining app version 6.49.

## 1.0.0-dev.1 (2026-09-30)

### ✨ New Features

* prepare stable nicoid mod v1.00 release ([491641d](https://github.com/chikuwadon/nicoid-mod-patches/commit/491641d5f521bacf0e7b72e51ff1124a22398cdd))
