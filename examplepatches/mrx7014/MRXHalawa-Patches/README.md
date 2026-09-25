# MRXHalawa-Patches

<img src="banner.png" />

> [!IMPORTANT]
> **THIS PROJECT IS A FORK OF [MORPHE PATCHES](https://github.com/MorpheApp/morphe-patches).**
> **The original project, its upstream history, and the original authors are credited here.**
> **Visit the official upstream repository:** https://github.com/MorpheApp/morphe-patches

## About MRXHalawa-Patches

**MRXHalawa-Patches** is a community-maintained fork of Morphe Patches, created to provide a customized and independently maintained collection of patches for supported Android applications. It extends the original patching ecosystem with a refreshed project identity while preserving the upstream foundation and attribution.

The patches are designed to customize app behavior and appearance, hide unwanted content, add quality-of-life features, and expose additional settings through **Morphe Patcher**. The project is intended for developers and advanced users who want transparent, configurable, and community-driven Android app modifications.

## Project links

| Resource | Link |
|---|---|
| **This fork** | [MRXHalawa-Patches](https://github.com/mrx7014/MRXHalawa-Patches) |
| **Original upstream project** | [Morphe Patches](https://github.com/MorpheApp/morphe-patches) |

## Supported applications

The generated list below contains the supported applications, patch descriptions, and target versions. It is updated automatically during the release workflow.

<!-- PATCHES_START -->
> **[v1.48.0](https://github.com/mrx7014/MRXHalawa-Patches/releases/tag/v1.48.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;104 patches total
<details>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;82 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;21.36.45 | 🧪&nbsp;21.35.442 | 🧪&nbsp;21.28.208 | 21.13.164 | 21.07.247 | 20.31.42 | 20.21.37 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Add to queue](#add-to-queue) | Overrides the feed flyout 'Play next in queue' with the Morphe video queue. |  |
| [Alternative thumbnails](#alternative-thumbnails) | Adds options to replace video thumbnails using the DeArrow API or image captures from the video. |  |
| [Ambient mode](#ambient-mode) | Adds options to bypass power saving restrictions for Ambient mode and disable it entirely or in fullscreen. |  |
| [App refresh rate](#app-refresh-rate) | Adds an option to change the app refresh rate. |  |
| [Block channels](#block-channels) | Adds an option to permanently hide content and channel results from specific YouTube channels by channel ID, @handle, or channel URL in Home, Subscriptions, Search, related videos, Shorts shelves, and comments. |  |
| [Bypass image region restrictions](#bypass-image-region-restrictions) | Adds an option to use a different host for user avatar and channel images and can fix missing images that are blocked in some countries. |  |
| [Bypass link redirects](#bypass-link-redirects) | Adds an option to bypass redirects and open the original link directly. |  |
| [Captions](#captions) | Adds an option to disable captions from being automatically enabled or to set caption cookies. |  |
| [Change form factor](#change-form-factor) | Adds an option to change the UI appearance to a phone, tablet, or automotive device. |  |
| [Change header](#change-header) | Adds an option to change the header logo in the top left corner of the app. | • Custom header logo |
| [Change start page](#change-start-page) | Adds an option to set which page the app opens in instead of the homepage. |  |
| [Check watch history domain name resolution](#check-watch-history-domain-name-resolution) | Checks if the device DNS server is preventing user watch history from being saved. |  |
| [Copy video link](#copy-video-link) | Adds options to display buttons in the video player to copy video links. |  |
| [Custom branding](#custom-branding) | Adds options to change the app icon and app name. Branding cannot be changed for mounted (root) installations. | • App name<br>• Custom icon |
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
| [Navigation bar](#navigation-bar) | Adds options to hide and change the bottom navigation bar (such as the Shorts button)  and the upper navigation toolbar. |  |
| [Network proxy](#network-proxy) | Adds settings to route supported network requests through an HTTP or HTTPS proxy. Including this patch may cause connectivity problems on certain devices |  |
| [Open Shorts in regular player](#open-shorts-in-regular-player) | Adds options to open Shorts in the regular video player. |  |
| [Open channel of live avatar](#open-channel-of-live-avatar) | Adds an option to prevent a channel's current live video from opening when tapping its avatar. |  |
| [Open links externally](#open-links-externally) | Adds an option to always open links in your browser instead of with the in-app browser. |  |
| [Open system share sheet](#open-system-share-sheet) | Adds an option to always open the system share sheet instead of the in-app share sheet. |  |
| [Open videos fullscreen](#open-videos-fullscreen) | Adds options to automatically open videos in fullscreen portrait or landscape mode. |  |
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
<summary>📦 Reddit&nbsp;&nbsp;•&nbsp;&nbsp;18 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;2026.35.0 | 🧪&nbsp;2026.34.0 | 🧪&nbsp;2026.24.0 | 2026.14.0 | 2026.04.0 |
| :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
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

## Building

This project uses Gradle and the MRX Halawa Patches plugin. To build locally, use:

```bash
./gradlew build
```

To generate the patch metadata list:

```bash
./gradlew generatePatchesList
```

## License

Morphe Patches is licensed under the GNU General Public License v3.0 with the additional requirements described in [NOTICE](NOTICE).
