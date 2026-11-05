# 👋🧩 Crazy Erudite Patches

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=LuckyToShine/czyeru

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.9.5](https://github.com/LuckyToShine/czyeru/releases/tag/v1.9.5)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;71 patches total
<details open>
<summary>📦 Conexión Lince UVM&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 1.0.63 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED dark theme](#amoled-dark-theme) | Turns on the dark theme that is inside the app and makes its background black. Text and backgrounds that the app sets by itself are changed too. Pictures are not changed. | • Background color |
| [Allow screenshots](#allow-screenshots) | Lets you take screenshots and screen recordings in the app, for example of your student ID. |  |
| [Disable forced update](#disable-forced-update) | Reports a newer app version to the school's server and hides the store update pop-up, so the app keeps working instead of getting stuck loading when a new version comes out. | • App version |
| [Hide survey pop-ups](#hide-survey-pop-ups) | Stops the pop-up with an image, a text and a button that the app shows on the home screen for surveys and notices, including forms you already answered. |  |
| [Keep session open](#keep-session-open) | Asks the school's login server for an offline session, so the app does not sign you out and send you back to the Microsoft login after about 30 minutes. The server must allow offline sessions. |  |

</details>

<details open>
<summary>📦 Sticker.ly&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.37.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED theme](#amoled-theme) | Forces a true black AMOLED theme across all Stickerly screens, Jetpack Compose UI, dialogs, and bottom sheets. |  |

</details>

<details open>
<summary>📦 TikTok&nbsp;&nbsp;•&nbsp;&nbsp;60 patches</summary>
<br>

**🎯 Supported versions:**

| 47.6.3 | 47.4.3 | 47.2.41 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Always show publish date](#always-show-publish-date) | Always shows the publish date in video author information. Thanks to lyyako for the original implementation. |  |
| [Block author button](#block-author-button) | Adds a button on videos to block the creator in one tap, with undo. Also adds the pause switches (comments, returning to the app, first video, keep paused). Starts off. Turn it on in Erudite settings > Hushfeed features. |  |
| [Collection picker search](#collection-picker-search) | Adds an option to show a search bar on the sheet where you pick the collection for a saved video, so you do not have to scroll through every collection. |  |
| [Collection videos search](#collection-videos-search) | Adds an option to show a search bar inside a collection that filters loaded videos by description or creator. |  |
| [Comment sort controls](#comment-sort-controls) | Exposes TikTok's native full comment-sort sheet, including its hot, time, media, and creator modes, instead of relying on rollout gates. |  |
| [Comment tools](#comment-tools) | Hides comments with words you pick or from accounts you pick, and adds a search box for a video's comments. It can also make links tappable and show poll results before you vote. Starts off. Turn it on in Erudite settings > Hushfeed features. |  |
| [Copy bio and IDs](#copy-bio-and-ids) | Lets you long-press a bio to copy it and adds share sheet buttons that copy a display name, username, user ID or video ID. On a profile card inside a LIVE room, long-press the bio or the name to copy it, long-press the username for the user ID, or tap the copy mark by the username. On by default. Turn it off in Erudite settings > Hushfeed features. |  |
| [Copy comments without username](#copy-comments-without-username) | Copies only the comment text without including the creator's username. |  |
| [Custom offline videos limit](#custom-offline-videos-limit) | Adds a custom entry to TikTok's offline videos menu with a configurable limit from 1 to 1000 videos. |  |
| [Diagnostic tools](#diagnostic-tools) | Adds diagnostic logging, crash capture, reports, and an optional rolling feed debugger. |  |
| [Disable login requirement](#disable-login-requirement) | Removes TikTok's mandatory login gate from supported flows. |  |
| [Disable long-press quick share](#disable-long-press-quick-share) | Keeps long-pressing Share from opening TikTok's quick-share interaction. |  |
| [Disable long-press repost](#disable-long-press-repost) | Keeps holding Like from opening TikTok's repost action. |  |
| [Disable screen capture detection](#disable-screen-capture-detection) | Disables capture detection and secure-window screenshot protection, including Circle to Search blocking. |  |
| [Double-tap controls](#double-tap-controls) | Lets a double tap on a video do nothing, like or unlike it, open its comments, copy the video or sound link, find the sound on YouTube Music or open search, instead of only liking it. Each corner of the video can get its own action too. Starts off. Pick an action in Erudite settings > Hushfeed features. |  |
| [Downloads](#downloads) | Adds watermark-free downloads, video quality selection, comment sticker saving, configurable folders, and filename templates. |  |
| [Enable Live search](#enable-live-search) | Shows TikTok's search entry in the Live drawer where supported. |  |
| [Enable non-personalized search](#enable-non-personalized-search) | Uses TikTok's non-personalized search mode instead of its saved account choice. |  |
| [Enable voice comments](#enable-voice-comments) | Enables TikTok's native voice-comment recording and publishing entry points. |  |
| [Expand activity list](#expand-activity-list) | Shows the whole Activity and New followers lists in the Inbox, so you don't have to tap View all. Starts off. Turn it on in Erudite settings > Hushfeed features. |  |
| [Favorite playlists grid](#favorite-playlists-grid) | Adds an option to show favorite playlists in a 3-column 8pt grid with square covers and the title and video count below. |  |
| [Favorite playlists search V1](#favorite-playlists-search-v1) | Adds an option to show a search bar on the favorite playlists page that instantly filters your playlists by name, loading the remaining pages in the background while you search. |  |
| [Favorites rate limit retry](#favorites-rate-limit-retry) | Adds an option to queue favorites TikTok refuses with "You're adding to Favorites too fast" and save them automatically once TikTok allows it, also after the app is restarted. |  |
| [Feature Gate Lab](#feature-gate-lab) | Adds a menu for viewing and overriding supported TikTok feature flags and configuration values. |  |
| [Feed filter](#feed-filter) | Hides feed ads, TikTok Shop items, livestreams, stories, photo posts, and videos outside configured view or like ranges. |  |
| [Feed tab navigation](#feed-tab-navigation) | Controls which loaded top and bottom navigation tabs remain visible, blocks newly added tabs when requested, and can hide the Tako AI bubble. |  |
| [Fix Google login](#fix-google-login) | Restores Google account sign-in after patching. |  |
| [Foldable split comment view](#foldable-split-comment-view) | Forces TikTok's tablet-style split layout (video beside comments instead of a bottom sheet) once the screen is at least as wide as a configurable threshold, for foldables TikTok doesn't already recognize as tablet-class. |  |
| [Force show Auto scroll](#force-show-auto-scroll) | Adds a setting that bypasses TikTok's rollout gates for its native Auto scroll action on supported videos. |  |
| [Hide AI content](#hide-ai-content) | Hides posts marked as AI-generated or AI-modified by TikTok or their creators. Unmarked AI content may still appear. |  |
| [Hide CAPTCHA popups](#hide-captcha-popups) | Adds a default-off setting to hide browsing and LIVE puzzle dialogs while preserving login and account verification. |  |
| [Hide FYP unpersonalized slop videos](#hide-fyp-unpersonalized-slop-videos) | Hides certain batches of unpersonalized slop posts that appear in your For You feed. |  |
| [Hide feed LIVE button](#hide-feed-live-button) | Adds an option to hide the LIVE button at the top left of video feeds. |  |
| [Hide feed follow button](#hide-feed-follow-button) | Adds an option to hide the + follow button below creator avatars in video feeds. |  |
| [Hide feed save button](#hide-feed-save-button) | Adds an option to hide the save/favourites button from video feeds. |  |
| [Hide feed search button](#hide-feed-search-button) | Adds an option to hide the search button at the top right of video feeds. |  |
| [Hide floating promotions](#hide-floating-promotions) | Removes floating promotional badges, coin icons, and timer banners from the Home feed. |  |
| [Hide quick comment reactions](#hide-quick-comment-reactions) | Hides TikTok's exposed quick emoji row in supported comment inputs. |  |
| [Hide suggested accounts](#hide-suggested-accounts) | Removes suggested-account cards from profile and inbox surfaces. Thanks to tymmesyde for the original implementation. |  |
| [Hold-and-slide 2x lock](#hold-and-slide-2x-lock) | Enables TikTok's native hold, slide down, and release gesture to lock 2x speed. |  |
| [Inbox activity search](#inbox-activity-search) | Adds an option to show a search bar on the Activity notifications and New followers pages to filter by user, comment, or notification text. |  |
| [Keep collections loaded](#keep-collections-loaded) | Adds an option to remember every collection you have loaded, so the collections page and the save sheet show them all right away instead of loading them page by page again. |  |
| [Keep the Favorites tab](#keep-the-favorites-tab) | Keeps the Favorites tab and your saved videos on your profile when TikTok tries out a version of the app that hides them, and makes the collections popup you get by holding the Favorites button dark when TikTok is. Both are on by default. Turn them off in Erudite settings > Hushfeed features. |  |
| [Liked videos search V1](#liked-videos-search-v1) | Adds an option to show a search bar on the liked videos page that instantly filters your liked videos by description or creator, loading the remaining pages in the background while you search. |  |
| [Liked videos search V2](#liked-videos-search-v2) | Liked videos search V1 plus an experimental server search: each query also asks TikTok's server for matching liked videos, so videos that have not loaded yet show up right away. Falls back to V1 when the server does not return your liked videos. |  |
| [Not interested button](#not-interested-button) | Adds a button on videos that tells TikTok you're not interested in one tap, so it can show you fewer like it. Starts off. Turn it on in Erudite settings > Hushfeed features. |  |
| [Open external links directly](#open-external-links-directly) | Opens profile and story website links in the system browser instead of TikTok's in-app browser. Thanks to lyyako for the original implementation. |  |
| [Playback speed](#playback-speed) | Enables playback-speed controls for all videos and remembers the selected speed between videos. |  |
| [Region spoof](#region-spoof) | Adds in-app controls for changing the region TikTok reads. |  |
| [Remember clear display](#remember-clear-display) | Remembers TikTok's clear-display state between videos. |  |
| [Resume videos after scrolling](#resume-videos-after-scrolling) | Continues supported videos from where playback stopped when returning after a scroll. |  |
| [Sanitize sharing links](#sanitize-sharing-links) | Removes tracking parameters from TikTok links before they are shared. |  |
| [Settings](#settings) | Adds the Crazy Erudite Patches settings menu to TikTok. Supports TikTok 47.6.3, 47.4.3 and 47.2.41. |  |
| [Share sheet modification](#share-sheet-modification) | Adds toggles and allow-lists for the video share sheet's "Send to", "Share via app", and "Video Actions" sections. |  |
| [Show exact counts](#show-exact-counts) | Shows likes, comments and other counts as full numbers, like 1,234,567 instead of 1.2M. Starts off. Turn it on in Erudite settings > Hushfeed features. |  |
| [Show seekbar](#show-seekbar) | Shows TikTok's native video seekbar where it would normally be hidden. |  |
| [Show seekbar thumbnail](#show-seekbar-thumbnail) | Shows TikTok's video preview thumbnail while dragging the seekbar. |  |
| [Sort collections](#sort-collections) | Adds an option to sort collections by recent activity (normal), by video count (most first) or by reverse video count (fewest first). |  |
| [Stop video looping](#stop-video-looping) | Stops videos at the end instead of replaying them. |  |
| [Translate comments](#translate-comments) | Adds comment translation controls using TikTok's translation system, with selectable language exclusions. |  |

</details>

<details open>
<summary>📦 Simple Time Tracker&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.60 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom icons](#custom-icons) | Adds your own vector icons (.xml files) to the icon picker. Put the files in Android/data/com.razeeman.util.simpletimetracker/files/custom_icons, then open the icon picker. They are at the end of the list and show in your activity color. |  |

</details>

<details open>
<summary>📦 Cinevi&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 4.0.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom loading video](#custom-loading-video) | Replaces the loading screen shown when a video starts with your own video. WebM (VP9 or AV1) or MP4 (H.265/HEVC). | • Video file<br>• Scaling<br>• Loop<br>• Mute<br>• Hide the original loading screen<br>• Background color<br>• Only accept WebM (VP9/AV1) and MP4 (H.265) |
| [Disable ads](#disable-ads) | Removes ads (splash, banners, popups, interstitials and native ads). |  |
| [Purple theme](#purple-theme) | Recolors the app's accent (selected tabs, buttons, highlights, progress) from the stock orange to a purple gradient. Does not change the layout of any screen. | • Accent color (gradient start)<br>• Accent color (gradient end) |

</details>

<details open>
<summary>📦 Iris Gallery&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 0.8.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Move to Secure Folder](#move-to-secure-folder) | Adds Samsung Secure Folder as a destination when moving items to Locked. Only active on devices where Secure Folder is available. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Crazy Erudite Patches are licensed under the [GNU General Public License v3.0](LICENSE)
