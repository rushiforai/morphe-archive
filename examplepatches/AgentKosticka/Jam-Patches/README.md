# Jam Patch Source

Optional prerelease patch source for [Jam Layer](https://github.com/AgentKosticka/Jam-Layer), providing Jam queue sharing for YouTube Music **9.15.51 ARM64 only**.

This bundle includes the Morphe patch catalog plus the **Jam queue sharing** patch, which is selected by default. Its runtime integration remains disabled until enabled in Player settings and YouTube Music is restarted. Since the bundle includes the upstream catalog, remove the standard Morphe patch source in Morphe Manager before adding this source to avoid duplicate patches.

Add the GitHub source `AgentKosticka/Jam-Patches` in Morphe Manager and enable prereleases. Patch a clean YouTube Music 9.15.51 ARM64 APK, then enable Jam queue sharing in Player settings and restart the app. Install the signed `app-release.apk` from the [latest Jam Layer release](https://github.com/AgentKosticka/Jam-Layer/releases/latest) on the devices you want to pair.

Development changes land on `dev`; semantic release publishes prerelease `.mpp` bundles for Morphe Manager. The bundle includes all Morphe patches as required by Jam's upstream patch dependencies.

This is a prerelease-only source. Both `main` and `dev` source metadata point to the current Jam prerelease because Manager resolves repository URLs through `main` and compares both channels. Neither entry point should refer to the standard upstream Morphe bundle. In Expert mode, deselect **Jam queue sharing** if you do not want it included; the feature itself remains disabled by default at runtime.

## Source and validation

The source baseline is fork commit [`1bb87b1f58ef28f3489f76e03daae3238cade8e9`](https://github.com/AgentKosticka/morphe-patches/commit/1bb87b1f58ef28f3489f76e03daae3238cade8e9). Jam review and runtime fixes from `feat/jam-queue-sharing` commit [`4039c05495af3a0388c7b3414a8686d387534117`](https://github.com/AgentKosticka/morphe-patches/commit/4039c05495af3a0388c7b3414a8686d387534117) are overlaid on 30 source and test files, preserving the custom-source baseline for non-Jam Music strings. The Jam APK validation selection also includes Lyrics to check their shared settings resources. The matching Companion commit is [`741ccac0e3cec6927747a12f9bbdd5a5838b2e58`](https://github.com/AgentKosticka/Jam-Layer/commit/741ccac0e3cec6927747a12f9bbdd5a5838b2e58).

The baseline can be reproduced with `python .github/scripts/sync_fork.py ../morphe-patches 1bb87b1f58ef28f3489f76e03daae3238cade8e9`; then apply the committed Jam overlay and removals recorded in `reviewOverlay`, merging only Jam strings into the Music resources. `source-revision.json` records the review overlay file hashes and paths alongside the source baseline, dependency revisions, and build metadata overlay. Source identity and release metadata remain specific to this repository.

The fork passed Jam regression tests, 9.15.51 patch/build and DEX hierarchy verification, and manual device checks including autoplay, clock updates and LAN discovery. Participant next/previous controls now forward to the host through the authenticated Jam command path and consume the local player click. The new published bundle still requires the clean Morphe Manager source and two-device manual acceptance test. Versions 9.34.52, 9.35.54 and 9.36.50 failed required semantic capability resolution and are not supported.

## Patch catalog

<!-- PATCHES_START -->
> **[v1.0.0-dev.12](https://github.com/AgentKosticka/Jam-Patches/releases/tag/v1.0.0-dev.12)**&nbsp;&nbsp;•&nbsp;&nbsp;`dev`&nbsp;&nbsp;•&nbsp;&nbsp;151 patches total
<details>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;84 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;21.38.123 | 🧪&nbsp;21.37.42 | 🧪&nbsp;21.28.208 | 21.16.256 | 21.13.164 | 20.31.42 | 20.21.37 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Add to queue](#add-to-queue) | Overrides the feed flyout 'Play next in queue' with the Morphe video queue. |  |
| [Alternative thumbnails](#alternative-thumbnails) | Adds options to replace video thumbnails using the DeArrow API or image captures from the video. |  |
| [Ambient mode](#ambient-mode) | Adds options to bypass power saving restrictions for Ambient mode and disable it entirely or in fullscreen. |  |
| [App refresh rate](#app-refresh-rate) | Adds an option to change the app refresh rate. |  |
| [Bypass image region restrictions](#bypass-image-region-restrictions) | Adds an option to use a different host for user avatar and channel images and can fix missing images that are blocked in some countries. |  |
| [Bypass link redirects](#bypass-link-redirects) | Adds an option to bypass redirects and open the original link directly. |  |
| [Captions](#captions) | Adds an option to disable captions from being automatically enabled or to set caption cookies. |  |
| [Change form factor](#change-form-factor) | Adds an option to change the UI appearance to a phone, tablet, or automotive device. |  |
| [Change header](#change-header) | Adds an option to change the header logo in the top left corner of the app. | • Custom header logo |
| [Change start page](#change-start-page) | Adds an option to set which page the app opens in instead of the homepage. |  |
| [Channel search](#channel-search) | Adds an option to search inside the channel that is currently open instead of searching all of YouTube. |  |
| [Check watch history domain name resolution](#check-watch-history-domain-name-resolution) | Checks if the device DNS server is preventing user watch history from being saved. |  |
| [Copy video link](#copy-video-link) | Adds options to display buttons in the video player to copy video links. |  |
| [Custom branding](#custom-branding) | Adds options to change the app icon and app name. For mounted (root) installations the branding is applied while patching, because it cannot be changed from the app settings. | • App name<br>• Custom icon<br>• App icon |
| [Custom player overlay opacity](#custom-player-overlay-opacity) | Adds an option to change the opacity of the video player background when player controls are visible. |  |
| [Disable DRC audio](#disable-drc-audio) | Adds an option to disable DRC (Dynamic Range Compression) audio. |  |
| [Disable QUIC protocol](#disable-quic-protocol) | Adds an option to disable QUIC (Quick UDP Internet Connections) network protocol. |  |
| [Disable Shorts resuming on startup](#disable-shorts-resuming-on-startup) | Adds an option to disable Shorts from resuming on app startup when Shorts were last being watched. |  |
| [Disable double tap actions](#disable-double-tap-actions) | Adds an option to disable player double tap gestures. |  |
| [Disable fullscreen gestures](#disable-fullscreen-gestures) | Adds options to selectively disable gestures for entering and exiting fullscreen mode, and to disable pinch-to-zoom. |  |
| [Disable haptic feedback](#disable-haptic-feedback) | Adds an option to disable haptic feedback in the player for various actions. |  |
| [Disable layout updates](#disable-layout-updates) | Adds an option to disable server side layout updates and use an older UI. |  |
| [Disable player popup panels](#disable-player-popup-panels) | Adds an option to disable panels (such as live chat) from opening automatically. |  |
| [Disable playlist autoplay](#disable-playlist-autoplay) | Adds an option to stop a playlist from automatically advancing to the next video. |  |
| [Disable rolling number animations](#disable-rolling-number-animations) | Adds an option to disable rolling number animations of video view count, user likes, and upload time. |  |
| [Disable scrolling speed limit](#disable-scrolling-speed-limit) | Adds an option to remove limits of how fast the home and subscription feed can be scrolled. |  |
| [Disable sign in to TV popup](#disable-sign-in-to-tv-popup) | Adds options to disable the popups asking to sign into or connect to a TV on the same local network. |  |
| [Disable video codecs](#disable-video-codecs) | Adds options to disable or force HDR, and to disable VP9 codecs. |  |
| [Double tap to seek](#double-tap-to-seek) | Adds additional double-tap to seek values to the YouTube settings menu. |  |
| [Downloads](#downloads) | Adds support to download videos with an external downloader app using the in-app download button or a video player action button. |  |
| [Enable debugging](#enable-debugging) | Adds options for debugging and exporting Morphe logs to the clipboard. |  |
| [Exit fullscreen mode](#exit-fullscreen-mode) | Adds options to automatically exit fullscreen mode when a video reaches the end. |  |
| [Force fullscreen landscape](#force-fullscreen-landscape) | Adds an option to rotate the player to landscape when entering fullscreen mode on tablets and other large screen devices. |  |
| [Force original audio](#force-original-audio) | Adds an option to always use the original audio track. |  |
| [Fullscreen video scale](#fullscreen-video-scale) | Adds options to stretch or zoom videos to fill the screen in fullscreen mode. |  |
| [GmsCore support](#gmscore-support) | Allows the app to work without root by using a different package name when patched using a GmsCore instead of Google Play Services. |  |
| [Hide Shorts components](#hide-shorts-components) | Adds options to hide components related to Shorts. | • Hide Shorts app shortcut<br>• Hide Shorts widget |
| [Hide ads](#hide-ads) | Adds options to hide general ads, Premium promotions and video ads. |  |
| [Hide autoplay preview](#hide-autoplay-preview) | Adds an option to hide the autoplay preview at the end of videos. |  |
| [Hide end screen cards](#hide-end-screen-cards) | Adds an option to hide suggested video cards at the end of videos. |  |
| [Hide end screen suggested video](#hide-end-screen-suggested-video) | Adds an option to hide the suggested video at the end of videos. |  |
| [Hide info cards](#hide-info-cards) | Adds an option to hide info cards that creators add in the video player. |  |
| [Hide layout components](#hide-layout-components) | Adds options to hide general layout components. |  |
| [Hide player flyout menu components](#hide-player-flyout-menu-components) | Adds options to hide menu components that appear when pressing the gear icon in the video player. |  |
| [Hide player overlay buttons](#hide-player-overlay-buttons) | Adds options to hide the player Cast, Autoplay, Captions, Previous & Next buttons, and to hide or change the opacity of the player control buttons background. |  |
| [Hide related video overlay](#hide-related-video-overlay) | Adds an option to hide the related video overlay shown when swiping up in fullscreen. |  |
| [Hide related videos](#hide-related-videos) | Adds options to hide related videos. |  |
| [Hide timestamp](#hide-timestamp) | Adds an option to hide the timestamp in the bottom left of the video player. |  |
| [Hide video action buttons](#hide-video-action-buttons) | Adds options to hide video action buttons in fullscreen and portrait modes. |  |
| [Loop video](#loop-video) | Adds an option to loop videos and display loop video button in the video player. |  |
| [Media notification controls](#media-notification-controls) | Adds options to disable the seekbar and previous/next buttons in the media notification and headphone controls. |  |
| [Miniplayer](#miniplayer) | Adds options to change the in-app minimized player. Patching 21.28.206 and lower has more miniplayer types to choose from. |  |
| [Mute button](#mute-button) | Adds an option to show a player button that mutes the video audio. |  |
| [Navigation bar](#navigation-bar) | Adds options to hide and change the bottom navigation bar (such as the Shorts button) and the upper navigation toolbar. |  |
| [Network proxy](#network-proxy) | Adds settings to route supported network requests through an HTTP or HTTPS proxy. Including this patch may cause connectivity problems on certain devices |  |
| [Open Shorts in regular player](#open-shorts-in-regular-player) | Adds options to open Shorts in the regular video player. |  |
| [Open channel of live avatar](#open-channel-of-live-avatar) | Adds an option to prevent a channel's current live video from opening when tapping its avatar. |  |
| [Open links externally](#open-links-externally) | Adds an option to always open links in your browser instead of with the in-app browser. |  |
| [Open system share sheet](#open-system-share-sheet) | Adds an option to always open the system share sheet instead of the in-app share sheet. |  |
| [Open videos fullscreen](#open-videos-fullscreen) | Adds options to automatically open videos in fullscreen portrait or landscape mode. |  |
| [Override YouTube Music buttons](#override-youtube-music-buttons) | Overrides YouTube Music buttons to open Morphe Music or any compatible third-party client. |  |
| [Play all](#play-all) | Adds an option to play all the videos from a channel and to display play all button in the video player. |  |
| [Playback in feeds](#playback-in-feeds) | Adds the 'Playback in feeds' setting of YouTube to the Morphe settings, where it is always available even if YouTube hides it. |  |
| [Playback speed](#playback-speed) | Adds options to customize available playback speeds, set a default playback speed, and show a speed dialog button in the video player. |  |
| [PoToken provider](#potoken-provider) | Adds option to get PoToken using an external PoToken minter app. |  |
| [Reload video](#reload-video) | Adds an option to display reload video button in the video player. |  |
| [Remember live stream playback position](#remember-live-stream-playback-position) | Adds an option to remember the playback position of an ongoing live stream and resume from there when reopening that live stream. |  |
| [Remove background playback restrictions](#remove-background-playback-restrictions) | Removes restrictions on background playback, including playing kids videos in the background. |  |
| [Remove viewer discretion dialog](#remove-viewer-discretion-dialog) | Adds an option to remove the dialog that appears when opening a video that has been age-restricted by accepting it automatically. This does not bypass the age restriction. |  |
| [Return YouTube Dislike](#return-youtube-dislike) | Adds an option to show the dislike count of videos with Return YouTube Dislike. |  |
| [Sanitize sharing links](#sanitize-sharing-links) | Removes the tracking query parameters from shared links. |  |
| [Save to Watch later](#save-to-watch-later) | Adds an option to display save to Watch later button in the video player. |  |
| [Seekbar](#seekbar) | Adds options to show old seekbar thumbnails, disable precise seeking when swiping up on the seekbar, slide to seek instead of playing at 2x speed when pressing and holding, tapping the player seekbar to seek, hiding the video player seekbar, enabling seeking in live streams, and expanding the live stream DVR duration. |  |
| [Settings menu filter](#settings-menu-filter) | Adds an option to hide items on the standard YouTube settings screen by their visible name. |  |
| [Shorts autoplay](#shorts-autoplay) | Adds options to automatically play the next Short. |  |
| [SponsorBlock](#sponsorblock) | Adds options to enable and configure SponsorBlock, which can skip undesired video segments such as sponsored content. |  |
| [Spoof app version](#spoof-app-version) | Adds an option to trick the app into thinking you are running an older version. |  |
| [Spoof device dimensions](#spoof-device-dimensions) | Adds an option to spoof the device dimensions which can unlock higher video qualities. |  |
| [Spoof video streams](#spoof-video-streams) | Adds options to spoof the client video streams to fix playback. |  |
| [Swipe controls](#swipe-controls) | Adds options to enable and configure volume and brightness swipe controls. |  |
| [Theme](#theme) | Adds options for theming, and settings to change the app foreground and background colors. | • Dark theme color<br>• Light theme color |
| [Video quality](#video-quality) | Adds options to set default video qualities and always use the advanced video quality menu. |  |
| [Voice over translation](#voice-over-translation) | Adds additional voice over languages using text-to-speech synchronized to the video playback. |  |
| [Wide search bar](#wide-search-bar) | Adds a wide search bar to the top of the home and subscription feed. |  |

</details>

<details>
<summary>📦 Reddit&nbsp;&nbsp;•&nbsp;&nbsp;20 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;2026.38.0 | 🧪&nbsp;2026.37.0 | 🧪&nbsp;2026.24.0 | 2026.14.0 | 2026.04.0 |
| :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [App icon](#app-icon) | Adds an option to select from the Reddit app icons available in the manifest. |  |
| [Custom branding name for Reddit](#custom-branding-name-for-reddit) | Changes the Reddit app name to the name specified in patch options. | • App name |
| [Custom font](#custom-font) | Adds an option to replace Reddit Sans / Roboto with a custom TTF or OTF font file at runtime. |  |
| [Disable modern home](#disable-modern-home) | Adds an option to disable the modern home UI. This patch works with Reddit 2026.24.0 and earlier. |  |
| [Disable screenshot popup](#disable-screenshot-popup) | Adds an option to disable the popup that appears when taking a screenshot. |  |
| [Force system font](#force-system-font) | Adds an option that renders Reddit with the device system font instead of Reddit Sans / Roboto. |  |
| [Hide Ask button](#hide-ask-button) | Adds an option to hide Ask button in the search bar. |  |
| [Hide Reddit search](#hide-reddit-search) | Permanently hides the Reddit search in the contextual menu. This patch does not work with root mounting |  |
| [Hide Trending shelves](#hide-trending-shelves) | Adds an option to hide the Trending shelves from feed and search suggestions. |  |
| [Hide ads](#hide-ads) | Adds options to hide ads. |  |
| [Hide communities shelf](#hide-communities-shelf) | Adds an option to hide the related or suggested communities shelf in subreddits. |  |
| [Hide navigation buttons](#hide-navigation-buttons) | Adds options to hide buttons in the navigation bar. |  |
| [Hide sidebar components](#hide-sidebar-components) | Adds options to hide the sidebar components. |  |
| [Open links directly](#open-links-directly) | Adds an option to skip over redirection URLs in external links. |  |
| [Open links externally](#open-links-externally) | Adds an option to always open links in your browser instead of with the in-app-browser. |  |
| [Remove subreddit dialog](#remove-subreddit-dialog) | Adds options to remove the NSFW community warning and notifications suggestion dialogs by dismissing them automatically. |  |
| [Sanitize sharing links](#sanitize-sharing-links) | Adds an option to sanitize sharing links by removing tracking query parameters. |  |
| [Show view count](#show-view-count) | Adds an option to show the view count of Posts. |  |
| [Spoof signature](#spoof-signature) | Spoofs the signature of the app to fix notification issues. |  |
| [Start as guest](#start-as-guest) | Skips the forced startup login screen using Reddit's native guest browsing mode. |  |

</details>

<details>
<summary>📦 YouTube Music&nbsp;&nbsp;•&nbsp;&nbsp;43 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;9.37.54 | 🧪&nbsp;9.36.50 | 🧪&nbsp;9.35.54 | 9.15.51 |
| :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [App refresh rate](#app-refresh-rate) | Adds an option to change the app refresh rate. |  |
| [Bypass certificate checks](#bypass-certificate-checks) | Bypasses certificate checks which prevent YouTube Music from working on Android Auto. |  |
| [Change header](#change-header) | Adds an option to change the header logo in the top left corner of the app. | • Custom header logo |
| [Change miniplayer color](#change-miniplayer-color) | Adds an option to change the miniplayer background color to match the fullscreen player. |  |
| [Change start page](#change-start-page) | Adds an option to set which page the app opens in instead of the homepage. |  |
| [Check watch history domain name resolution](#check-watch-history-domain-name-resolution) | Checks if the device DNS server is preventing user watch history from being saved. |  |
| [Crossfade](#crossfade) | Adds a true dual-player crossfade between consecutive tracks. Requires YouTube Music 9.00 or newer; on older versions the patch is a no-op. |  |
| [Custom branding](#custom-branding) | Adds options to change the app icon and app name. For mounted (root) installations the branding is applied while patching, because it cannot be changed from the app settings. | • App name<br>• Custom icon<br>• App icon |
| [Disable DRC audio](#disable-drc-audio) | Adds an option to disable DRC (Dynamic Range Compression) audio. |  |
| [Disable QUIC protocol](#disable-quic-protocol) | Adds an option to disable QUIC (Quick UDP Internet Connections) network protocol. |  |
| [Disable dislike redirection](#disable-dislike-redirection) | Adds an option to prevent skipping to the next track when the dislike button is pressed. |  |
| [Downloads](#downloads) | Adds support to download songs using the in-app download button, either with an external downloader app or inside YouTube Music. |  |
| [Enable debugging](#enable-debugging) | Adds options for debugging and exporting Morphe logs to the clipboard. |  |
| [Enable exclusive audio playback](#enable-exclusive-audio-playback) | Enables the option to play audio without video. |  |
| [Enable forced miniplayer](#enable-forced-miniplayer) | Adds an option to enable forced miniplayer when switching between music videos, podcasts, or songs. |  |
| [Enable swipe to dismiss miniplayer](#enable-swipe-to-dismiss-miniplayer) | Adds an option to enable dismissing the miniplayer by swiping down on it. |  |
| [Force original audio](#force-original-audio) | Adds an option to always use the original audio track. |  |
| [GmsCore support](#gmscore-support) | Allows the app to work without root by using a different package name when patched using a GmsCore instead of Google Play Services. |  |
| [Hide ads](#hide-ads) | Adds options to hide fullscreen ads, Premium promotions and video ads. |  |
| [Hide buttons](#hide-buttons) | Adds options to hide the cast, history, notification, and search buttons. |  |
| [Hide filter bar](#hide-filter-bar) | Adds an option to hide the filter bar at the top of the homepage. |  |
| [Hide flyout menu components](#hide-flyout-menu-components) | Adds options to hide individual items from the player and queue flyout menus. |  |
| [Hide layout components](#hide-layout-components) | Adds options to hide general layout components. |  |
| [Hide music action buttons](#hide-music-action-buttons) | Adds options to hide action buttons under the player. |  |
| [Jam queue sharing](#jam-queue-sharing) | Adds a native Jam queue panel and authenticated bridge. Experimental; validated on YTM 9.15.51. Root installation is not supported. |  |
| [Miniplayer previous and next buttons](#miniplayer-previous-and-next-buttons) | Adds options to show previous and next track buttons in the miniplayer. |  |
| [Navigation bar](#navigation-bar) | Adds options to hide navigation bar, labels and buttons. |  |
| [Network proxy](#network-proxy) | Adds settings to route supported network requests through an HTTP or HTTPS proxy. Including this patch may cause connectivity problems on certain devices |  |
| [Play albums songs](#play-albums-songs) | Adds an option to play the song version of album tracks instead of music videos. |  |
| [PoToken provider](#potoken-provider) | Adds option to get PoToken using an external PoToken minter app. |  |
| [Remember repeat state](#remember-repeat-state) | Adds an option to remember the repeat state when playing a new track or playlist. |  |
| [Remember shuffle state](#remember-shuffle-state) | Adds an option to remember the shuffle state when playing a new track or playlist. |  |
| [Remove background playback restrictions](#remove-background-playback-restrictions) | Removes restrictions on background playback, including playing kids videos in the background. |  |
| [Remove viewer discretion dialog](#remove-viewer-discretion-dialog) | Adds an option to remove the dialog that appears when opening a video that has been age-restricted by accepting it automatically. This does not bypass the age restriction. |  |
| [Return YouTube Dislike](#return-youtube-dislike) | Adds an option to show the dislike count of tracks with Return YouTube Dislike. |  |
| [Sanitize sharing links](#sanitize-sharing-links) | Removes the tracking query parameters from shared links. |  |
| [Scrobbling](#scrobbling) | Adds options to add played tracks to Last.fm and ListenBrainz. |  |
| [Settings menu filter](#settings-menu-filter) | Adds an option to hide items on the standard YouTube Music settings screen by their visible name. |  |
| [SponsorBlock](#sponsorblock) | Adds options to enable and configure SponsorBlock, which can skip non-music segments. |  |
| [Spoof app version](#spoof-app-version) | Adds an option to trick the app into thinking you are running an older version. |  |
| [Spoof video streams](#spoof-video-streams) | Adds options to spoof the client video streams to fix playback. |  |
| [Theme](#theme) | Adds options for theming, and settings to change the app foreground and background colors. | • Dark theme color |
| [Third-party lyrics](#third-party-lyrics) | Adds an option to show synced lyrics with experience enhancement from 15+ providers in the lyrics panel. |  |

</details>

<details>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change installer source](#change-installer-source) | Spoofs the installer source so the app appears to be installed from an app store. | • Spoofed package installer name |
| [Clone app](#clone-app) | Changes the app package name to allow installing the same app multiple times. By default ".morphe" is appended to the package name. Each cloned install must use a unique package name. Cloning does not work with all apps and using this patch may cause app crashes or other unexpected behavior. | • Package name<br>• Update permissions<br>• Update providers |
| [Disable Play Store updates](#disable-play-store-updates) | Disables Play Store updates by setting the version code to the maximum allowed. This patch may cause unexpected issues with some apps and does not work if the app is installed by root mounting |  |
| [Override certificate pinning](#override-certificate-pinning) | Overrides certificate pinning, allowing to inspect traffic via a proxy. |  |

</details>

<!-- PATCHES_END -->

This project is licensed under the [GNU General Public License v3.0](LICENSE). See [NOTICE](NOTICE) for required attribution and naming terms.
This source bundle embeds public Morphe source projects for reproducible builds:

- `morphe-patcher` at `5eacde46237f2fe657eb9bfbe90d2528d248a336`
- `morphe-patches-library` at `e930e2eea34437fbdc4836a4daa8213f0ca8abcf`
- `morphe-patches-gradle-plugin` at `9e6220d8ac3c0092c233af4e216f3bab6bb22e0d`, with the existing `SettingsPlugin.kt` overlay defaulting absent GitHub credentials to empty strings for public composite builds

The projects are distributed under their included licenses. Submodules are flattened so CI does not depend on access to private package registries.

