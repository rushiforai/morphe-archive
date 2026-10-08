# 🧩 Ahmed Yarub's Patches

Personal patches for use with [Morphe](https://morphe.software).

## ❓ About

Patches built with [Morphe Patcher](https://github.com/MorpheApp/morphe-patcher) for apps I
use. Each patch is developed against a specific, decompiled APK version, and only versions
that have actually been verified are declared as compatible.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=ahmedyarub/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.12.0](https://github.com/ahmedyarub/morphe-patches/releases/tag/v1.12.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;57 patches total
<details open>
<summary>📦 X&nbsp;&nbsp;•&nbsp;&nbsp;40 patches</summary>
<br>

**🎯 Supported versions:**

| 12.32.0-prod.01 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Add ability to copy media link](#add-ability-to-copy-media-link) | Adds "Copy media link" to the post menu: the direct links of the post's photos, videos and GIFs. |  |
| [Custom download folder](#custom-download-folder) | Saves downloaded photos and videos to a folder of your choice instead of Download/X. | • Folder |
| [Custom share menu](#custom-share-menu) | Hides options from the post menu. | • Hidden options |
| [Custom sharing domain](#custom-sharing-domain) | Shares and copies links with another domain, such as fxtwitter.com, in place of x.com. | • Domain |
| [Customize Inline action Bar items](#customize-inline-action-bar-items) | Hides actions from the bar under each post. | • Hide reply<br>• Hide repost<br>• Hide like<br>• Hide views (or dislike, where it replaces views)<br>• Hide bookmark<br>• Hide share |
| [Customize Navigation Bar items](#customize-navigation-bar-items) | Hides tabs from the bottom navigation bar. Home always stays. | • Hide Explore<br>• Hide Grok<br>• Hide Notifications<br>• Hide Messages |
| [Customize default reply sorting](#customize-default-reply-sorting) | Sets the sort replies open with. | • Default sort |
| [Customize explore tabs](#customize-explore-tabs) | Hides tabs from the Explore page. | • Hidden tabs |
| [Customize notification tabs](#customize-notification-tabs) | Hides tabs from Notifications. At least one tab always stays. | • Hide All<br>• Hide Mentions<br>• Hide Verified<br>• Hide Priority |
| [Customize search suggestions](#customize-search-suggestions) | Hides kinds of suggestion from the search box. | • Hide accounts<br>• Hide search suggestions |
| [Customize search tab items](#customize-search-tab-items) | Hides tabs from search results. At least one tab always stays. | • Hide Top<br>• Hide Latest<br>• Hide People<br>• Hide Media<br>• Hide Lists |
| [Customize side bar items](#customize-side-bar-items) | Hides rows from the side bar. | • Hide Premium<br>• Hide Money<br>• Hide Communities<br>• Hide Sports<br>• Hide Bookmarks / History<br>• Hide Community Notes<br>• Hide Offline videos<br>• Hide Lists<br>• Hide Boost<br>• Hide Spaces<br>• Hide Follow requests<br>• Hide Monetization<br>• Hide Creator Studio<br>• Hide Analytics<br>• Hide Grok |
| [Customize timeline top bar](#customize-timeline-top-bar) | Hides tabs from the top of the home timeline. At least one tab always stays. | • Hide For you<br>• Hide Following<br>• Hide Subscriptions<br>• Hide the topics suggestion<br>• Hide pinned lists<br>• Hide pinned communities<br>• Hide pinned topics<br>• Hide the Add tab |
| [Delete from database](#delete-from-database) | Adds options to the Morphe settings to delete cached promoted entries or clear cached timelines. |  |
| [Disable auto timeline scroll on launch](#disable-auto-timeline-scroll-on-launch) | Opens the home timelines where you left them, instead of at the newest posts. |  |
| [Enable Undo Posts](#enable-undo-posts) | Holds each post for a few seconds before sending it, so it can be undone. | • Undo period |
| [Enable debug menu for posts](#enable-debug-menu-for-posts) | Adds "Post data" to the post menu: everything the app knows about the post, as text. |  |
| [Enable force HD videos](#enable-force-hd-videos) | Always plays videos at the highest quality the device supports, whatever the connection. |  |
| [Filter posts by keyword](#filter-posts-by-keyword) | Hides posts whose text contains any of your keywords, ignoring case. Edit the keywords from "Filtered keywords" in any post's menu, or in the Morphe settings. | • Initial keywords |
| [Force enable translate](#force-enable-translate) | Offers to translate every post, not only those the server marks translatable. |  |
| [Handle custom twitter links](#handle-custom-twitter-links) | Opens links to other X frontends, such as fxtwitter and vxtwitter, in the app. They have to be enabled under "Open by default" in the app's system settings. | • Hosts |
| [Hide Banner](#hide-banner) | Hides the "See new posts" pill at the top of the timeline. |  |
| [Hide Community Notes](#hide-community-notes) | Hides Community Notes under posts. |  |
| [Hide FAB](#hide-fab) | Hides the floating Post button. |  |
| [Hide badges from navigation bar icons](#hide-badges-from-navigation-bar-icons) | Hides the unread counts and dots on the bottom navigation bar. |  |
| [Hide promote button](#hide-promote-button) | Hides the Boost button on your posts and the Boost item in their menu. |  |
| [Hook feature flag](#hook-feature-flag) | Overrides the app's feature switches with values chosen when patching. | • Feature switches |
| [Import/Export login token](#import-export-login-token) | Adds Export login and Import login to the Morphe settings, opened from the app icon's shortcuts. An export holds everything needed to use your account. |  |
| [Legacy share links](#legacy-share-links) | Shares posts as x.com/<username>/status/<id> rather than x.com/i/status/<id>. |  |
| [Native downloader](#native-downloader) | Lets every photo, video and GIF be saved from its long-press menu and the media viewer, without a watermark. |  |
| [Native reader mode](#native-reader-mode) | Adds "Reader mode" to the post menu: the post's text, selectable, with links to its media. |  |
| [Native translator](#native-translator) | Adds "Translate with Google" to the post menu. |  |
| [No shortened URL](#no-shortened-url) | Opens links in posts at their real address instead of through t.co. |  |
| [Remove Ads](#remove-ads) | Removes promoted posts, accounts and trends from timelines. |  |
| [Remove premium upsell](#remove-premium-upsell) | Removes Premium upsells: the Upgrade button on the home timeline, the Premium side bar row, and the Get verified cards and prompts. |  |
| [Share Tweet as Image](#share-tweet-as-image) | Adds "Share as image" to the share sheet of a post, which shares it as an image card. |  |
| [Show poll results](#show-poll-results) | Shows the results of polls without voting. Polls cannot be voted on while this is applied. |  |
| [Show sensitive media](#show-sensitive-media) | Shows media marked sensitive without blurring it behind a warning. |  |
| [Support external downloader](#support-external-downloader) | Adds "Open in downloader" to the post menu, which shares the post's link with an app of your choice. |  |
| [Unlock Premium checks](#unlock-premium-checks) | Makes the app's own Premium subscription checks always pass. Features the server enforces still need a subscription. |  |

</details>

<details open>
<summary>📦 Instagram&nbsp;&nbsp;•&nbsp;&nbsp;15 patches</summary>
<br>

**🎯 Supported versions:**

| 450.0.0.50.77 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass signature check](#bypass-signature-check) |  |  |
| [Disable analytics](#disable-analytics) | Blocks analytics requests sent to Instagram and Facebook servers. |  |
| [Disable screenshot detection](#disable-screenshot-detection) | Disables screenshot detection in direct messages and stories. |  |
| [Download media](#download-media) | Adds ability to download posts, reels, stories and highlights |  |
| [Download voice message](#download-voice-message) | Enables ability to download voice messages |  |
| [Filter stories](#filter-stories) | Hides categories of stories from the story tray. | • Hide ad stories<br>• Hide suggested stories<br>• Hide highlights |
| [Hide Instants](#hide-instants) | Hides Instants from DMs page. |  |
| [Hide Threads profile button](#hide-threads-profile-button) | Hides the Threads button from the profile page action bar (top right of the profile page). |  |
| [Hide ads](#hide-ads) | Hides ads in the feed. |  |
| [Hide suggested content](#hide-suggested-content) | Hides suggested reels and suggested accounts. Suggested stories are hidden by Filter stories. | • Hide suggested reels<br>• Hide suggested accounts |
| [Improve image viewing](#improve-image-viewing) | Requests the maximum resolution images from the server. |  |
| [Make ephemeral media permanent](#make-ephemeral-media-permanent) | Changes unexpired view once, view twice media to permanent view. |  |
| [Open links externally](#open-links-externally) | Opens links in the system browser instead of the in-app browser. |  |
| [Sanitize share links](#sanitize-share-links) | Removes tracking parameters from links shared out of the app. |  |
| [Save deleted messages](#save-deleted-messages) | Keeps a local copy of incoming DMs so ones the sender deletes stay readable. Messages are stored unencrypted in the app's private storage. | • Days to keep messages |

</details>

<details open>
<summary>📦 Reddit&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 2026.37.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove Reddit Pro section](#remove-reddit-pro-section) | Removes the Reddit Pro section from the community drawer, and the Reddit Pro promos: the post creation and subreddit join upsell sheets, and the Reddit Pro banner on the profile feed. |  |
| [Remove Resources and Games on Reddit sections](#remove-resources-and-games-on-reddit-sections) | Removes the Resources and Games on Reddit sections from the community drawer. |  |

</details>

<!-- PATCHES_END -->

&nbsp;

## 🚀 Building

The Morphe patches Gradle plugin is published to GitHub Packages, so a GitHub token with
`read:packages` is required to build:

```sh
GITHUB_ACTOR=<username> GITHUB_TOKEN=<token> ./gradlew build
```

Or put `gpr.user` and `gpr.key` in `~/.gradle/gradle.properties`.

## 🧪 Testing

`./gradlew :patches:test` checks the bundle itself and runs on every pull request.

The patches only mean something against the app builds they target, so the main tests apply
them to real APKs, which are not in the repository:

```sh
./gradlew :patches:apkTest -Pmorphe.apks=instagram=<base.apk or .apkm>,reddit=<base.apk or .apkm>
```

This applies every patch for each app and fails when a patch throws, when a fingerprint
matches anything but exactly one method, or when patched code refers to a method or field
that does not exist. Add `-Pmorphe.isolated=true` to also apply each patch on its own, which
catches a patch that only works because another one was selected with it.

The patched APKs are left in `patches/build/patched`. `scripts/verify-dex.sh` runs ART's
verifier over one on a rooted emulator, which catches register and type mistakes that only
fail when the app loads the class.

## 📜 License

GNU General Public License v3.0. See [LICENSE](LICENSE).
