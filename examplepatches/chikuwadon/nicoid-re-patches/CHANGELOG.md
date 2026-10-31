## 1.9.12 (2026-10-30)

### ✨ New Features

* **nicoid:** Add a Refresh action to reload the current tab.
* **nicoid:** Add a close button to the selected tab with an Undo action.

### 🐛 Bug Fixes

* **nicoid:** Fix crashes and playback getting stuck when switching from popup to background playback and returning to the normal player.
* **nicoid:** Fix video information remaining stuck loading after returning from background playback.
* **nicoid:** Use the mini player when starting background playback from customized playback controls, and correct the background playback and mute icons. ([#94](https://github.com/chikuwadon/nicoid-re-patches/issues/94))
* **nicoid:** Fix popup playback crashing when activating hold-to-speed playback. ([#96](https://github.com/chikuwadon/nicoid-re-patches/issues/96))
* **nicoid:** Fix popup playback controls and the seek bar flickering when set to remain visible.
* **nicoid:** Fix playback speed and quality text overlapping when resizing the popup.
* **nicoid:** Place the popup play/pause button in the toolbar when playback controls are set to remain visible.
* **nicoid:** Fix popup resizing gestures interfering with the seek bar.
* **nicoid:** Fix videos failing to be removed from Watch Later.
* **nicoid:** Fix the notification close button not responding after the app process exits.
* **nicoid:** Fix long-pressing a tab unexpectedly switching tabs, and correct the available tab movement actions.
* **nicoid:** Prevent related videos from creating tabs labeled “nicoid Re.”
* **nicoid:** Fix search suggestions not returning after being disabled and enabled again.
* **nicoid:** Correct the size of the Cast stop icon in normal playback. ([#88](https://github.com/chikuwadon/nicoid-re-patches/issues/88))

### 🔧 Improvements

* **nicoid:** Keep the selected tab visible in the tab bar when switching with horizontal swipes.
* **nicoid:** Improve tab switching stability and recovery from empty video lists.
* **nicoid:** Reduce unnecessary layout updates when resizing popup playback.
* **nicoid:** Cancel unnecessary search suggestion requests when changing the search text or leaving the search dialog.
* **nicoid:** Improve resource cleanup after popup playback ends.
* **nicoid:** Improve video list initialization and remove redundant processing.

## 1.9.11 (2026-10-29)

### 🐛 Bug Fixes

* **nicoid:** Fix the comment activity graph remaining visible after playback controls disappear, becoming hidden in fullscreen, or appearing too dark. ([#84](https://github.com/chikuwadon/nicoid-re-patches/issues/84))
* **nicoid:** Fix the center playback button remaining visible after popup playback controls disappear.
* **nicoid:** Fix the notification close button leaving playback or the mini player active.

### 🔧 Improvements

* **nicoid:** Keep hold-to-speed playback active when moving a finger after the long press begins. ([#87](https://github.com/chikuwadon/nicoid-re-patches/pull/87))
* **nicoid:** Adjust swipe-seek feedback size and text outlines for normal and fullscreen playback.
* **nicoid:** Restrict authentication cookies to appropriate destinations and improve redirect handling during cache downloads.
* **nicoid:** Strengthen validation of notification playback actions.
* **nicoid:** Improve login WebView security and clear its cookies when logging out.

## 1.9.10 (2026-10-28)

### ✨ New Features

* **nicoid:** Add an option to enable or disable horizontal swipe seeking independently of the seek bar and double-tap seeking. ([#93](https://github.com/chikuwadon/nicoid-re-patches/issues/93))

### 🐛 Bug Fixes

* **nicoid:** Fix the ranking period shown in the toolbar not updating when the selected period changes. ([#89](https://github.com/chikuwadon/nicoid-re-patches/issues/89))
* **nicoid:** Fix popup playback resizing and the final video frame remaining fixed when the popup is moved or resized. ([#90](https://github.com/chikuwadon/nicoid-re-patches/issues/90))
* **nicoid:** Fix a white bar remaining visible over the video during playback. ([#91](https://github.com/chikuwadon/nicoid-re-patches/issues/91))
* **nicoid:** Use the mini player when starting background playback from video lists or video information, and preserve playback when returning to the normal player. ([#92](https://github.com/chikuwadon/nicoid-re-patches/issues/92))
* **nicoid:** Fix outdated thumbnails remaining visible when video list rows are reused.
* **nicoid:** Fix some video dates being displayed incorrectly.
* **nicoid:** Fix the patch version shown in settings not matching the installed version.

### 🔧 Improvements

* **nicoid:** Add icons to distinguish ranking and search tabs.
* **nicoid:** Improve horizontal tab switching with a smoother swipe transition.
* **nicoid:** Reduce unnecessary screen refreshes when returning to Nico Reports.
* **nicoid:** Reduce repeated loading and rendering when opening device playlists.
* **nicoid:** Reduce unnecessary processing when displaying and scrolling video lists.
* **nicoid:** Improve keyword filtering performance.
* **nicoid:** Reduce repeated drawing calculations for the comment activity graph.
* **nicoid:** Improve playback resource management and overall stability.
* **nicoid:** Adjust the size of playback icons in fullscreen.
* **nicoid:** Adjust the spacing in the search dialog.
* **nicoid:** Move the double-tap seek and popup double-tap seek settings to the Player category.
* **nicoid:** Add descriptions for the playback control visibility and video details button settings.
* **nicoid:** Make punctuation consistent in setting descriptions.
* **nicoid:** Include app, patch, and device information in exported debug logs.

## 1.9.9 (2026-10-27)

### ✨ New Features

* **nicoid:** Replace the previous in-app background playback bar with a mini player for continuing playback while browsing. Tap or swipe up to return to normal playback.
* **nicoid:** Add optional, persistent tabs for searches, watch history, playlists, and other video lists. Save up to 64 tabs, switch with horizontal swipes, and reorder by dragging.
* **nicoid:** Add configurable actions for switching apps and pressing Back during playback.
* **nicoid:** Add an option to keep playback controls hidden during double-tap seeking and hold-to-speed playback. ([#79](https://github.com/chikuwadon/nicoid-re-patches/issues/79))
* **nicoid:** Add optional swipe gestures for entering popup playback, entering landscape fullscreen, and returning to portrait playback. ([#80](https://github.com/chikuwadon/nicoid-re-patches/issues/80)) ([#81](https://github.com/chikuwadon/nicoid-re-patches/issues/81)) ([#83](https://github.com/chikuwadon/nicoid-re-patches/issues/83))
* **nicoid:** Add a customizable popup playback button for returning directly to portrait playback. ([#85](https://github.com/chikuwadon/nicoid-re-patches/issues/85))

### 🐛 Bug Fixes

* **nicoid:** Fix videos failing to be removed from the Watch Later list.
* **nicoid:** Fix the comment activity graph appearing darker in fullscreen playback. ([#84](https://github.com/chikuwadon/nicoid-re-patches/issues/84))
* **nicoid:** Fix the Cast disconnect button appearing too small and playback controls and video information being hidden when casting Shorts. ([#88](https://github.com/chikuwadon/nicoid-re-patches/issues/88))
* **nicoid:** Fix the ranking period shown in the toolbar not matching the selected period. ([#89](https://github.com/chikuwadon/nicoid-re-patches/issues/89))

### 🔧 Improvements

* **nicoid:** Show the cumulative seek distance during repeated double-tap seeking. ([#82](https://github.com/chikuwadon/nicoid-re-patches/issues/82))
* **nicoid:** Update Mylist and Watch Later video menus to allow removal from the current list while retaining registration to the other list.
* **nicoid:** Consolidate background playback, popup playback, and fullscreen swipe options into the “Vertical swipes” settings dialog. Make swipe-down background and popup playback mutually exclusive.
* **nicoid:** Place “Use multiple tabs” under General.
* **nicoid:** Move the video-list tap action, “When switching apps,” and “When going back during playback” settings under General.
* **nicoid:** Integrate the popup-only “Normal playback” button into playback control customization.

## 1.9.8 (2026-10-24)

### ✨ New Features

* **nicoid:** Add optional fixed quality for Google Cast: highest available, 720p, 480p, or 360p. Fixed mode selects the best available format up to the chosen resolution from playback startup and buffers instead of switching to a lower quality. Applies to the next Cast playback. ([#77](https://github.com/chikuwadon/nicoid-re-patches/issues/77))
* **nicoid:** Add a one-tap Cast disconnect button to the playback controls. ([#77](https://github.com/chikuwadon/nicoid-re-patches/issues/77))

### 🐛 Bug Fixes

* **nicoid:** Fix the portrait seek bar remaining visible after playback controls hide in normal and Shorts playback, while preserving the always-visible controls setting. ([#78](https://github.com/chikuwadon/nicoid-re-patches/issues/78))
* **nicoid:** Fix the phone’s comment list appearing empty during Google Cast playback. ([#77](https://github.com/chikuwadon/nicoid-re-patches/issues/77))
* **nicoid:** Fix double-tapping a comment seeking the inactive local player instead of the Cast receiver. ([#77](https://github.com/chikuwadon/nicoid-re-patches/issues/77))

### 🔧 Improvements

* **nicoid:** Keep comment-list following synchronized with the Cast playback position. ([#77](https://github.com/chikuwadon/nicoid-re-patches/issues/77))
* **nicoid:** Reuse fetched Cast comments without additional downloads and prevent outdated session results from replacing the current video’s comment list. ([#77](https://github.com/chikuwadon/nicoid-re-patches/issues/77))

## 1.9.7 (2026-10-23)

### 🐛 Bug Fixes

* **nicoid:** Fix silent playback and playback progress repeatedly moving backward when switching from popup to background playback.
* **nicoid:** Prevent outdated popup playback retries from restarting paused playback or affecting a different video.
* **nicoid:** Fix playback API connections not being released when a request fails.
* **nicoid:** Reject malformed or incomplete local cache playback requests before they cause excessive memory usage.

### 🔧 Improvements

* **nicoid:** Reduce memory usage when loading large thumbnails and cached notification artwork while preserving their display resolution.
* **nicoid:** Skip unnecessary artwork reads for outdated playback notifications.
* **nicoid:** Validate playback API redirects before forwarding authentication data and limit excessively large responses.
* **nicoid:** Remove unused generated code from playback and image-loading components.

## 1.9.6 (2026-10-23)

### ✨ New Features

* **nicoid:** Add adjustable hold-to-speed playback in normal and popup players. Hold the video to temporarily change playback speed, then release to restore the previous speed. ([#76](https://github.com/chikuwadon/nicoid-re-patches/issues/76))
* **nicoid:** Add a “Playback speed while holding” slider below the default playback speed setting. The default is 2.0×, and moving the slider to the far left disables the feature. ([#76](https://github.com/chikuwadon/nicoid-re-patches/issues/76))
* **nicoid:** Add a translucent comment activity graph to the seek bar in normal and popup players, highlighting moments with more fetched comments. Enabled by default and configurable in settings.

### 🐛 Bug Fixes

* **nicoid:** Fix unresponsive seeking and playback controls failing to hide automatically when playback is locked to landscape orientation.
* **nicoid:** Fix upper playback controls becoming compressed or displaced during initial layout in tablet mode. ([#75](https://github.com/chikuwadon/nicoid-re-patches/issues/75))
* **nicoid:** Fix mobile data quality settings selecting an incorrect resolution, including when a VPN uses a mobile connection.
* **nicoid:** Fix playback starting at a lower resolution than the configured quality.
* **nicoid:** Select video quality by available resolution rather than stream order, and use an available fallback when the requested resolution is unavailable.
* **nicoid:** Fix blank space and incorrect movement and resize boundaries in popup playback for some video resolutions and aspect ratios.
* **nicoid:** Fix popup resizing and saved window dimensions when using hold-to-speed.
* **nicoid:** Fix a crash after popup touch operations.
* **nicoid:** Fix videos incorrectly appearing as unregistered in a series. Distinguish retrieval failures from confirmed absence of series information and allow retrying failed requests.
* **nicoid:** Handle incomplete or failed comment responses without blocking Google Cast playback startup. ([#70](https://github.com/chikuwadon/nicoid-re-patches/issues/70))

### 🔧 Improvements

* **nicoid:** Add fMP4 HLS playback compatibility to the legacy Google Cast receiver to address playback remaining on “Preparing,” while preserving television-side comments and existing playback controls. ([#70](https://github.com/chikuwadon/nicoid-re-patches/issues/70))
* **nicoid:** Improve Google Cast cleanup when switching videos or ending playback, and prevent delayed loading callbacks from restarting an obsolete playback request. ([#70](https://github.com/chikuwadon/nicoid-re-patches/issues/70))
* **nicoid:** Expand Google Cast diagnostics to include receiver connections, media requests, loading progress and playback errors. ([#70](https://github.com/chikuwadon/nicoid-re-patches/issues/70))
* **nicoid:** Show a compact, translucent speed indicator below the upper playback controls while holding.
* **nicoid:** Restore the previous playback speed when dragging the popup, while prioritizing corner resizing and two-finger scaling.
* **nicoid:** Position the portrait seek bar inside the bottom edge of the player and keep its placement consistent across playback control settings.
* **nicoid:** Raise the fullscreen seek bar slightly to reduce interference at the bottom edge of the screen and make seeking easier.
* **nicoid:** Retrieve series information through Niconico’s V4 additional-information API, automatically refresh expired request credentials and briefly cache successful results.
* **nicoid:** Reuse valid playback URLs and recently retrieved metadata to reduce redundant requests and unnecessary playback-session creation while preserving quality switching and video caching.
* **nicoid:** Reuse fetched comment data for the activity graph without additional downloads, video decoding or playback polling. Share graph data between normal and popup players, and keep it aligned with control visibility and window resizing.
* **nicoid:** Reduce unnecessary processing during video quality selection and graph drawing, and release player view listeners and overlays when they are no longer needed.
* **nicoid:** Show a clear login-required message when sensitive videos cannot be played while signed out.
* **nicoid:** Suppress repeated notifications about partial statistics refresh failures while continuing to update available statistics.

## 1.9.5 (2026-10-19)

### 🐛 Bug Fixes

* **nicoid:** Fix a crash when changing playback quality.
* **nicoid:** Fix popup player movement bounds.
* **nicoid:** Fix playback controls being positioned outside the visible area in tablet mode. ([#75](https://github.com/chikuwadon/nicoid-re-patches/issues/75))
* **nicoid:** Fix a crash when updating the displayed playback time.

### 🔧 Improvements

* **nicoid:** Improve playback quality switching in normal and popup players. Switch between available video tracks without reloading the stream when supported, while preserving playback position and paused state.
* **nicoid:** Preserve the current playback position and playback state when a stream reload is required for a quality change.
* **nicoid:** Keep user selections synchronized across Nico Report tabs.
* **nicoid:** Improve Google Cast startup diagnostics, including playback request submission and results, to investigate playback remaining on “Preparing.” ([#70](https://github.com/chikuwadon/nicoid-re-patches/issues/70))

## 1.9.4 (2026-10-18)

### 🐛 Bug Fixes

* **nicoid:** Fix crashes when opening videos in landscape or with the player orientation locked to landscape.
* **nicoid:** Keep video titles updating after the title bar moves into the fullscreen overlay, and safely handle delayed updates when player views are no longer available.
* **nicoid:** Prevent crashes during fullscreen transitions when the destination layout is not yet ready.
* **nicoid:** Reconnect playback controls to newly created views instead of retaining detached controls after player-view recreation.
* **nicoid:** Restore playback-control placement and fullscreen window state when the player view is removed or leaves fullscreen.
* **nicoid:** Prevent the normal-playback toolbar from moving behind the status bar in tablet mode, while avoiding duplicate inset spacing. ([#73](https://github.com/chikuwadon/nicoid-re-patches/issues/73))
* **nicoid:** Fix crashes when returning from settings after changing the theme or app language.
* **nicoid:** Avoid repeated screen recreation when the applied theme and language have not changed, and cancel pending recreation for screens that are closing or have already been destroyed.
* **nicoid:** Update Startup screen and other choice-setting summaries immediately after selection, including custom-ranking choices, without requiring users to leave and reopen settings.
* **nicoid:** Preserve dynamic setting summaries after translation so the displayed label continues to follow the selected value.
* **nicoid:** Fix Nico Reports failing to load immediately after app startup by restoring saved sign-in information before the first feed request. ([#74](https://github.com/chikuwadon/nicoid-re-patches/issues/74))
* **nicoid:** Prevent an empty or uninitialized sign-in store from masking a saved session, while keeping the current active session and explicit sign-out state authoritative. ([#74](https://github.com/chikuwadon/nicoid-re-patches/issues/74))
* **nicoid:** Keep cached list responses separate when sign-in cookies, language or other request headers differ.
* **nicoid:** Prevent requests started before a manual refresh from putting outdated responses back into the page cache.
* **nicoid:** Keep saved settings, identifiers and other non-interface values outside UI translation, preventing unintended changes to stored data.
* **nicoid:** Correct invalid Google Cast relay addresses when legacy Wi-Fi information reports `0.0.0.0`, using an available Wi-Fi or Ethernet address instead. ([#70](https://github.com/chikuwadon/nicoid-re-patches/issues/70))

### 🔧 Improvements

* **nicoid:** Share simultaneous requests for the same search or ranking page to reduce duplicate downloads and response processing.
* **nicoid:** Reduce temporary allocations when checking and processing search and ranking page responses.
* **nicoid:** Reuse parsed timestamps and date formatters when displaying video rows, reducing repeated date parsing and object creation.
* **nicoid:** Speed up content filtering for large video lists by removing excluded rows in a single pass while preserving the order of the remaining videos.
* **nicoid:** Remove canceled waiting tasks from the work queue promptly so obsolete requests do not retain unnecessary data or delay newer work.
* **nicoid:** Keep cleanup of canceled connections off the caller thread, including connections that arrive after cancellation.
* **nicoid:** Release obsolete thumbnail requests when rows are detached or reused, while preserving downloads still needed by other visible rows.
* **nicoid:** Allow idle thumbnail workers to shut down and restart when needed, reducing unnecessary background thread retention.
* **nicoid:** Reduce temporary drawing-object creation and repeated view lookups when drawing the fullscreen playback-control background.
* **nicoid:** Keep theme changes responsive while saving preference updates.
* **nicoid:** Center Nico Reports content within a readable width on tablets and wide screens while preserving the existing phone layout. ([#73](https://github.com/chikuwadon/nicoid-re-patches/issues/73))
* **nicoid:** Improve the consistency of checked, selected, active and disabled control colors across light, dark and AMOLED themes.
* **nicoid:** Improve primary-button text contrast against the actual accent color in each theme.
* **nicoid:** Apply consistent theme colors to dialog text, links, text fields, hints, cursors, selection highlights, switches and progress controls.
* **nicoid:** Correct remaining default purple or pink control tints where the app's theme accent should be used.
* **nicoid:** Preserve the intended borders, underlines and spacing of custom input fields when shared dialog styling is applied.
* **nicoid:** Adapt dialog action-button placement to the available width so longer translated labels remain visible on narrow screens, returning to a horizontal layout when space allows.
* **nicoid:** Preserve button order and touch-target sizes when dialog actions switch between horizontal and vertical layouts.
* **nicoid:** Refresh previously opened screens after theme or language changes so returning to them uses the current settings.
* **nicoid:** Expand English and Traditional Chinese translations across settings, player controls, comment appearance options, cache actions, playlists, dialogs and error messages.
* **nicoid:** Improve consistency in translated setting labels, action names and related interface terminology.
* **nicoid:** Correct English singular and plural forms for comment-row counts and time values.
* **nicoid:** Recognize additional locale spelling variants and legacy Chinese language names.
* **nicoid:** Use the Japanese fallback consistently when the system language is not supported.
* **nicoid:** Preserve translation of interface text while keeping selected setting values and user-provided names unchanged, including custom-ranking names containing percent signs.

## 1.9.3 (2026-10-18)

### ✨ New Features

* **nicoid:** Add pull-to-refresh to Nico Reports.

### 🐛 Bug Fixes

* **nicoid:** Fix the Multiple Selection menu action failing to enter selection mode in local and account watch histories. ([#67](https://github.com/chikuwadon/nicoid-re-patches/issues/67))
* **nicoid:** Prevent crashes when returning to the ranking list after deleting a custom ranking. ([#68](https://github.com/chikuwadon/nicoid-re-patches/issues/68))
* **nicoid:** Apply player-button visibility settings in normal playback without requiring a fullscreen transition. ([#72](https://github.com/chikuwadon/nicoid-re-patches/issues/72))
* **nicoid:** Fix Nico Reports failing to load when opened immediately after app startup. ([#74](https://github.com/chikuwadon/nicoid-re-patches/issues/74))
* **nicoid:** Fix popup position jumps during dragging and resizing, and preserve the adjusted window position.
* **nicoid:** Correct automatic transitions to popup playback when switching apps and preserve the playback position.
* **nicoid:** Prevent duplicate player openings when returning from background or popup playback.
* **nicoid:** Prevent screen rotation from incorrectly triggering app-switch playback actions.

### 🔧 Improvements

* **nicoid:** Rework fullscreen control placement to remove unnecessary outer margins and improve icon sizing, title spacing and seek-bar accessibility.
* **nicoid:** Improve popup control alignment and sizing as the playback window changes size.
* **nicoid:** Retain tab contents and scroll positions in Nico Reports and Following, avoiding repeated loading when switching tabs.
* **nicoid:** Adapt the comment appearance editor to landscape and tablet layouts so the preview does not crowd out the settings. ([#73](https://github.com/chikuwadon/nicoid-re-patches/issues/73))
* **nicoid:** Improve font rendering, sizing and comment placement in the appearance preview.

## 1.9.2 (2026-10-17)

### ✨ New Features

* **nicoid:** Add a dedicated comment appearance editor with a preview, custom font support, finer font-weight adjustment, and controls for text size, opacity, shadows, display duration and maximum rows. ([#66](https://github.com/chikuwadon/nicoid-re-patches/issues/66))
* **nicoid:** Add one-tap background playback.
* **nicoid:** Add customizable player buttons with visibility controls, drag reordering and a reset option.
* **nicoid:** Extend always-visible playback controls to popup playback, with options for normal playback, popup playback, both or neither.
* **nicoid:** Add visibility settings for follow, like and Niconi Ads buttons in video details.
* **nicoid:** Allow the popup video-information button to be placed on the left or right.
* **nicoid:** Add tag suggestions to custom-ranking conditions using the existing search suggestion system. ([#68](https://github.com/chikuwadon/nicoid-re-patches/issues/68))
* **nicoid:** Add bulk watch-history deletion and improve access to selection controls. ([#67](https://github.com/chikuwadon/nicoid-re-patches/issues/67))

### 🐛 Bug Fixes

* **nicoid:** Fix account watch-history deletion and remove entries from the list only after successful deletion. ([#67](https://github.com/chikuwadon/nicoid-re-patches/issues/67))
* **nicoid:** Fix custom rankings failing to display when tag conditions are specified. ([#68](https://github.com/chikuwadon/nicoid-re-patches/issues/68))
* **nicoid:** Improve series continuous-playback handling and restore playback queues correctly when list views are recreated. ([#62](https://github.com/chikuwadon/nicoid-re-patches/issues/62))
* **nicoid:** Prevent crashes caused by uninitialized playback lists when taking screenshots or recreating player views.
* **nicoid:** Fix popup playback startup crashes caused by controls being customized before native views are initialized.
* **nicoid:** Restore the translucent popup toolbar background and prevent the center playback button from remaining visible after controls are hidden.
* **nicoid:** Refresh video statistics during pull-to-refresh instead of retaining outdated values.
* **nicoid:** Add an authenticated HLS relay for Google Cast playback, including playlist, audio, video and encryption-key delivery, to address playback remaining stuck on the preparation screen. ([#70](https://github.com/chikuwadon/nicoid-re-patches/issues/70))

### 🔧 Improvements

* **nicoid:** Display tag-filtered rankings after collecting the first 100 matching videos, then load further results as needed.
* **nicoid:** Improve pull-to-refresh behavior, retain existing results while loading, and preserve the displayed data when updates fail.
* **nicoid:** Standardize selection-count, select-all and clear-selection controls across supported lists. Keep selection mode active after clearing the selection.
* **nicoid:** Refine comment-preview control spacing, center dropdown text and improve the visibility of the back button.
* **nicoid:** Set the default comment shadow size to 0.5 dp and place comment appearance settings first in the comment category.
* **nicoid:** Improve player icon sizing and use thinner outlines for the center playback icons.
* **nicoid:** Distinguish follow states with neutral-colored icons for unfollowed creators and accent-colored icons for followed creators.
* **nicoid:** Clarify button-setting names and add explanatory summaries.

## 1.9.1 (2026-10-15)

### ✨ New Features

* **nicoid:** Organize local playlists into folders, with create, rename, move and delete actions.
* **nicoid:** Add a confirmation dialog for stopping ongoing cache acquisition.
* **nicoid:** Long-press an NG rule to open its individual deletion confirmation.

### 🐛 Bug Fixes

* **nicoid:** Correct interactions between series continuous playback and single-video repeat, keeping playback behavior and the repeat indicator synchronized. ([#62](https://github.com/chikuwadon/nicoid-re-patches/issues/62))
* **nicoid:** Correct theme application to dialogs, dropdowns and video-information controls, removing unintended purple and pink colors. ([#63](https://github.com/chikuwadon/nicoid-re-patches/issues/63))
* **nicoid:** Allow horizontal tab navigation from blank areas below short or empty lists.
* **nicoid:** Stop related cache acquisition before deleting cached files to prevent interrupted transfers from recreating them.
* **nicoid:** Keep playlist creation and selection actions fixed at the bottom, including when lists contain few or no items.

### 🔧 Improvements

* **nicoid:** Display video posting dates below statistics in mylists, separately from mylist registration dates.
* **nicoid:** Standardize video-list typography, thumbnail proportions, uploader placement and statistics across rankings, search, caches, watch histories, mylists and playlists.
* **nicoid:** Use `YYYY/MM/DD HH:mm` timestamps with posting, registration or viewing labels. Show each screen’s primary date first and supplementary posting dates below statistics.
* **nicoid:** Preserve watch counts, cache capacity and acquisition status, mylist notes and playlist playback controls within the shared row layout.
* **nicoid:** Retain the original large ranking-number overlay, with a small right-edge margin.
* **nicoid:** Standardize multiple-selection controls with fixed Delete and Done actions, selection counts above the list, and Select All/Clear Selection in the overflow menu.
* **nicoid:** Refine NG editor and list spacing, enlarge confirmation buttons and provide consistent touch targets.
* **nicoid:** Unify list separators using the subtle playlist-list appearance.
* **nicoid:** Replace decorative shadows and gradients with flat styling across light and dark themes while preserving existing shapes and interaction feedback.
* **nicoid:** Give video tags independent flat backgrounds with small gaps, and improve dark-mode uploader-background contrast.
* **nicoid:** Refresh legacy UI icons.
* **nicoid:** Adjust the video-row long-press delay to reduce accidental menu activation while retaining extended-hold selection.

## 1.9.0 (2026-10-14)

### ✨ New Features

* **nicoid:** Customize ranking genre order and visibility.
* **nicoid:** Create custom rankings by combining genres and tag conditions, with support for startup-screen selection.
* **nicoid:** Load additional ranking entries up to 1,000th place.
* **nicoid:** Open Niconi Ads in the in-app browser from video details.
* **nicoid:** Follow and unfollow public mylists.
* **nicoid:** Organize followed users, channels and mylists into tabs with animated swipe navigation.

### 🐛 Bug Fixes

* **nicoid:** Prevent comments from being clipped when playback controls remain visible.
* **nicoid:** Remove unintended purple and pink colors from dark-mode controls and dialogs.

### 🔧 Improvements

* **nicoid:** Redesign custom-ranking management with a fixed create button, drag reordering and batch deletion.
* **nicoid:** Refine search-dialog alignment and date/duration controls.
* **nicoid:** Standardize following-list row heights and circular user/channel icons.
* **nicoid:** Improve spacing in dialogs and video-detail controls.
* **nicoid:** Use a flat, single-color triangle for video-list actions.

## 1.8.6 (2026-10-14)

### ✨ New Features

* **nicoid:** Add cache re-acquisition from the cache list.
* **nicoid:** Add continuous and shuffle playback controls to creator Shorts lists, and shuffle playback to series lists and mylists.
* **nicoid:** Add sorting to device and account watch histories.

### 🐛 Bug Fixes

* **nicoid:** Fix cache-mode playback controls, automatic acquisition, acquisition failures and repeated downloads of completed cached videos. Allow playback while acquisition runs and report acquisition progress. ([#53](https://github.com/chikuwadon/nicoid-re-patches/issues/53))
* **nicoid:** Make the series continuous-playback checkbox correctly enable and disable playback in the current player. ([#62](https://github.com/chikuwadon/nicoid-re-patches/issues/62))
* **nicoid:** Restore the theme setting and correct theme application to video-information panels, including tablet layouts. ([#63](https://github.com/chikuwadon/nicoid-re-patches/issues/63))
* **nicoid:** Restore Shorts playback when returning from normal playback, preserving the selected video and playback position. ([#64](https://github.com/chikuwadon/nicoid-re-patches/issues/64))
* **nicoid:** Correct completed-cache detection and displayed cache sizes.
* **nicoid:** Keep cache acquisition-date sorting unchanged when video information or comments are refreshed.
* **nicoid:** Apply dark-mode colors to public mylist descriptions.
* **nicoid:** Display video durations on series and creator Shorts thumbnails.
* **nicoid:** Preserve available uploader names and posting dates in watch histories during cached playback.

### 🔧 Improvements

* **nicoid:** Refresh video information, statistics and comments during cached playback when permitted by the cache-only setting, while continuing to play the saved video.
* **nicoid:** Organize comment settings and restore missing comment-count and Google Cast controls.
* **nicoid:** Show the current playback mode and comment-fetch count with explanatory summaries.
* **nicoid:** Standardize watch-history row layout and playback-menu ordering.

## 1.8.5 (2026-10-13)

### 🐛 Bug Fixes

* **nicoid:** Initialize an unspecified upload-date range to today's date instead of reusing an old saved range.
* **nicoid:** Keep video-duration text fields, slider handles and unlimited-range controls in sync.
* **nicoid:** Preserve existing cached comments when replacement fails and recover interrupted updates.
* **nicoid:** Correct transfer-size estimates for HLS segments with implicit byte-range offsets.
* **nicoid:** Handle malformed local playlist data without crashing or overwriting the stored snapshot.

### 🔧 Improvements

* **nicoid:** Limit cache-file lookups to the relevant video folder, reuse metadata and refresh it after writes.
* **nicoid:** Keep playlist lists and scroll positions during selection, reuse video rows and save changes in the background.
* **nicoid:** Reduce repeated thumbnail-cache scans while retaining expiry and storage limits.
* **nicoid:** Verify implementation ownership and packaged helper behavior to prevent source changes from being masked by older overrides.

## 1.8.4 (2026-10-13)

### 🐛 Bug Fixes

* **nicoid:** Remove the obsolete ad-removal purchase option from settings and keep its purchase functionality disabled.
* **nicoid:** Restore patch version information when the settings entry is missing.
* **nicoid:** Reject fractional, incorrectly typed and overflowing numeric values when importing settings.
* **nicoid:** Recover cached comments from the legacy file when the compressed copy is unreadable.
* **nicoid:** Stop additional comment-history requests after the player closes or the video changes, and avoid retaining unused player instances.

### 🔧 Improvements

* **nicoid:** Avoid rewriting unchanged cache-folder settings and repeatedly compiling cache filename patterns.
* **nicoid:** Remove duplicate legacy comment files without recompressing an existing valid copy.
* **nicoid:** Reuse parsed search conditions and remove unused search-dialog adapter initialization.
* **nicoid:** Ensure updated helper implementations are included in the patch and expand regression checks for settings, storage and playback integration.

## 1.8.3 (2026-10-13)

### ✨ New Features

* **nicoid:** Add settings export and import for backups.
* **nicoid:** Add configurable search ranges for upload dates and video duration, with date pickers, duration sliders and second-precision input.
* **nicoid:** Add optional double-tap seeking during popup playback, using the normal playback seek interval. Show a dedicated close button when enabled. Disabled by default.

### 🐛 Bug Fixes

* **nicoid:** Fix comment posting for official-channel videos by selecting the designated posting thread and correct watch identity. ([#44](https://github.com/chikuwadon/nicoid-re-patches/issues/44))
* **nicoid:** Fix crashes when opening the cache list or downloading cached videos, and prompt for a storage folder when none is selected. ([#49](https://github.com/chikuwadon/nicoid-re-patches/issues/49))
* **nicoid:** Restore cache playback, reuse completed downloads and allow normal pause and resume without starting another download. ([#53](https://github.com/chikuwadon/nicoid-re-patches/issues/53))
* **nicoid:** Fix incorrect row removal and crashes when unfollowing users, and enable long-press unfollowing for official channels. ([#60](https://github.com/chikuwadon/nicoid-re-patches/issues/60))
* **nicoid:** Preserve full video details when reopening the Shorts information popup. ([#61](https://github.com/chikuwadon/nicoid-re-patches/issues/61))
* **nicoid:** Restore uploader names in account watch history.
* **nicoid:** Fix upload-date and video-duration filters not being applied to search results.
* **nicoid:** Restore formatted upload dates, uploader names and statistic icons in the cache list.
* **nicoid:** Fix clipped search-range labels and inconsistent dark-theme colors in search and cache-copy dialogs.

### 🔧 Improvements

* **nicoid:** Require an explicitly selected folder for video caches instead of using app-private storage.
* **nicoid:** Set upload-date presets relative to today: today only, one week ago, one month ago or one year ago through today.
* **nicoid:** Compress cached comments and remove orphan comment files to reduce unnecessary storage use.
* **nicoid:** Mark cache entries without completed video data as incomplete, and preserve statistic icons during progress updates.
* **nicoid:** Refine search buttons, popup close-button sizing and play/pause icon outlines.
* **nicoid:** Remove the experimental cache acceleration feature.

## 1.8.2 (2026-10-11)

### ✨ New Features

* **nicoid:** Support comment commands for named and hexadecimal colors, fixed top and bottom placement, and text sizes.
* **nicoid:** Add creator-page Shorts and series lists, portrait Shorts playback with swiping through the creator’s uploads, and continuous series playback. ([#56](https://github.com/chikuwadon/nicoid-re-patches/issues/56))
* **nicoid:** Show followed channels alongside followed users, with separate category headers, and add access to followed mylists. ([#54](https://github.com/chikuwadon/nicoid-re-patches/issues/54))
* **nicoid:** Open Shorts from Nico Reports in portrait playback and swipe through uploads in the current creator filter and chronological order. ([#58](https://github.com/chikuwadon/nicoid-re-patches/issues/58))
* **nicoid:** Add 90 fps and 120 fps comment-rendering options, with display refresh-rate requests on supported devices.
* **nicoid:** Add an optional mode that keeps player controls and the seek bar visible outside the video, disabled by default.

### 🐛 Bug Fixes

* **nicoid:** Fix crashes when scrolling the comment list immediately after opening a video with a large comment-fetch limit. ([#50](https://github.com/chikuwadon/nicoid-re-patches/issues/50))
* **nicoid:** Fix comment posting for official-channel videos by using the correct watch identity. ([#44](https://github.com/chikuwadon/nicoid-re-patches/issues/44))
* **nicoid:** Fix cache-list access after switching from shared storage to app-private storage. ([#49](https://github.com/chikuwadon/nicoid-re-patches/issues/49))
* **nicoid:** Reuse completed cached videos without downloading them again, and restore normal pause and resume controls during cache playback. ([#53](https://github.com/chikuwadon/nicoid-re-patches/issues/53))
* **nicoid:** Fix incorrect comment-download failure messages and update download progress while caching is in progress. ([#55](https://github.com/chikuwadon/nicoid-re-patches/issues/55))
* **nicoid:** Fix cache-list progress updates on the first visit and prevent successful downloads from being reported as interrupted.
* **nicoid:** Fix incorrect row selection when entering multiple-selection mode in the cache list.
* **nicoid:** Restore the AMOLED theme option and apply its colors consistently to search dialogs, video-ID entry and overflow menus. ([#51](https://github.com/chikuwadon/nicoid-re-patches/issues/51))
* **nicoid:** Apply dark and AMOLED theme colors to tablet player information panels and navigation tabs. ([#59](https://github.com/chikuwadon/nicoid-re-patches/issues/59))
* **nicoid:** Fit the entire Shorts video into the playback area without cropping its top or bottom. ([#59](https://github.com/chikuwadon/nicoid-re-patches/issues/59))
* **nicoid:** Restore switching from portrait Shorts playback to the normal player, and keep Shorts playback active when dismissing video information. ([#57](https://github.com/chikuwadon/nicoid-re-patches/issues/57))
* **nicoid:** Synchronize play and pause icons with the actual playback state after Android media-control actions in both normal and Shorts playback. ([#57](https://github.com/chikuwadon/nicoid-re-patches/issues/57))
* **nicoid:** Restore Shorts overlays, like controls and comments across the full portrait playback area.
* **nicoid:** Fix creator Shorts detection and display the creator’s name in Shorts and series pages. ([#56](https://github.com/chikuwadon/nicoid-re-patches/issues/56))
* **nicoid:** Update quality-setting summaries immediately after selection.
* **nicoid:** Fix stalled seek-bar updates, clipped controls and playback-completion freezes when controls are always visible outside the video.

### 🔧 Improvements

* **nicoid:** Improve comment frame pacing with precise timing for 60 fps, 90 fps and 120 fps rendering.
* **nicoid:** Remove the total retrieval limits for followed channels, creator Shorts and creator series, and remove the 200-video playback limit for creator Shorts. ([#54](https://github.com/chikuwadon/nicoid-re-patches/issues/54), [#56](https://github.com/chikuwadon/nicoid-re-patches/issues/56))
* **nicoid:** Show live download percentages and downloaded sizes in the cache list.
* **nicoid:** Use the configured default video quality when downloading cached videos.
* **nicoid:** Restore cached-comment identity metadata required for Nicoru actions.
* **nicoid:** Expand Shorts video information with upload dates, statistic icons, tags, uploader comments and working creator navigation.
* **nicoid:** Use wrapping hashtag chips, a circular creator avatar and a compact like icon in Shorts video information.
* **nicoid:** Show upload dates and statistic icons in creator Shorts and series video lists, using smaller text than video titles.
* **nicoid:** Match followed-channel row and icon sizes to followed-user rows, and remove duplicate following shortcuts.
* **nicoid:** Remove the extra creator Shorts and series button from video information.
* **nicoid:** Refine always-visible player controls with compact sizing, reordered actions, a dedicated play/pause button and a comment area that stays clear of the controls.
* **nicoid:** Show descriptive selected-item counts in deletion confirmations and place Done before Delete in multiple-selection controls.
* **nicoid:** Improve image loading, reuse completed caches and cancel obsolete requests when switching creator-page tabs.

## 1.8.1 (2026-10-09)

### ✨ New Features

* **nicoid:** Add double-tap seeking with a 1–60 second slider and an Off position at the left end. ([#41](https://github.com/chikuwadon/nicoid-re-patches/issues/41))
* **nicoid:** Open video actions in a popup on long press.
* **nicoid:** Add an uploader-blocking action with confirmation, registering the uploader or channel name as an exact-match content filter.
* **nicoid:** Add device-local playlists with folder creation and deletion, video moves, and single or batch video deletion.
* **nicoid:** Add checkbox controls for continuous and shuffle playback within the current playlist folder, supporting normal, popup and background playback.
* **nicoid:** Add shuffle playback to device and account watch history.
* **nicoid:** Allow folder creation when choosing an account mylist for video registration.
* **nicoid:** Show series, parent works and child works for Shorts, and support creator following. ([#43](https://github.com/chikuwadon/nicoid-re-patches/issues/43))

### 🐛 Bug Fixes

* **nicoid:** Restore channel following and correct navigation to creator pages. ([#42](https://github.com/chikuwadon/nicoid-re-patches/issues/42))
* **nicoid:** Fix crashes when posting comments. ([#44](https://github.com/chikuwadon/nicoid-re-patches/issues/44))
* **nicoid:** Restore Watch Later registration using the current endpoint. ([#45](https://github.com/chikuwadon/nicoid-re-patches/issues/45))
* **nicoid:** Restore portrait Shorts playback when entering fullscreen from the normal player. ([#46](https://github.com/chikuwadon/nicoid-re-patches/issues/46))
* **nicoid:** Restore official-channel uploaded-video lists, including thumbnails and statistics, using the same row layout as user uploads. ([#47](https://github.com/chikuwadon/nicoid-re-patches/issues/47))
* **nicoid:** Show downloaded thumbnail artwork in media controls during offline cache playback. ([#48](https://github.com/chikuwadon/nicoid-re-patches/issues/48))
* **nicoid:** Restore app-private cache storage as the default and a selectable location, allowing downloads without choosing a shared-storage folder. ([#49](https://github.com/chikuwadon/nicoid-re-patches/issues/49))
* **nicoid:** Remove empty cache folders after deleting their cached videos.
* **nicoid:** Preserve the settings screen and scroll position when changing the app language.
* **nicoid:** Fix video-list taps and honor the configured playback mode in playlists.
* **nicoid:** Synchronize Shorts overlays with playback controls and resume paused Shorts on video taps.
* **nicoid:** Clear selected rows when leaving multiple-selection mode.
* **nicoid:** Fix crashes when opening settings, creator pages, Shorts and video-action popups.

### 🔧 Improvements

* **nicoid:** Match device-playlist layouts and selection controls to account mylists.
* **nicoid:** Use an extended long press to enter multiple-selection mode in watch history, mylists, cache lists and playlists, while retaining the action popup on a regular long press.
* **nicoid:** Unify multiple-selection controls, show the selected-item count, remove the Copy action, and remove Delete all history from overflow menus.
* **nicoid:** Simplify the Shorts overlay with compact creator and title text, translucent like and follow icons, and an oval comment entry while preserving the bottom controls.
* **nicoid:** Apply consistent dark-mode and theme colors to action popups, comment forms, folder dialogs and playback-setting sliders.
* **nicoid:** Add a reset-to-default control for the default playback speed.
* **nicoid:** Clarify content-filter setting summaries.

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

* **nicoid:** Restore playback controls in landscape tablet mode. ([#26](https://github.com/chikuwadon/nicoid-re-patches/issues/26))

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
