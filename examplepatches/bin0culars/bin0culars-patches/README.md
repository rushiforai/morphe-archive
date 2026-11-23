# 🔭 bin0culars patches

Patches for apps patched with [Morphe](https://morphe.software), made by bin0culars.

## ❓ About

bin0culars patches adds quality-of-life and layout changes to Android apps. It currently targets Reddit: tablet layouts, feed and comment tweaks, media and sharing improvements. Everything is built to work alongside Morphe's own Reddit patches.

### How to use these patches

In Morphe Manager, add this repository as a patch source: https://github.com/bin0culars/bin0culars-patches

<a href="https://morphe.software/add-source?github=bin0culars/bin0culars-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.13.0](https://github.com/bin0culars/bin0culars-patches/releases/tag/v1.13.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;18 patches total
<details open>
<summary>📦 Reddit&nbsp;&nbsp;•&nbsp;&nbsp;18 patches</summary>
<br>

**Package name:** `com.reddit.frontpage`

**🎯 Supported versions:**

| 2026.47.0 | 2026.46.0 | 2026.45.0 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Account switcher private mode](#account-switcher-private-mode) | Lets you choose whether the account switcher offers Anonymous Browsing or Incognito, even with one account. Choose in Settings → bin0culars mods. |  |
| [Always show Hide](#always-show-hide) | Keeps the Hide option in the post menu on Home, even when Reddit swaps it for recommendation options. Turn it on in Settings → bin0culars mods. |  |
| [AutoModerator comments](#automoderator-comments) | Collapses or hides comments from u/AutoModerator. Choose in Settings → bin0culars mods. |  |
| [Collapse all comments](#collapse-all-comments) | Adds a button next to the comment count on a post that collapses or expands all comments. Choose what it collapses in Settings → bin0culars mods. |  |
| [Colorize comment indent lines](#colorize-comment-indent-lines) | Gives each reply level in a comment thread its own line colour. Turn it on in Settings → bin0culars mods. |  |
| [Content-type filter](#content-type-filter) | Show only videos, images, text or link posts on Home and Popular. |  |
| [Disable bottom bar auto-hide](#disable-bottom-bar-auto-hide) | Keeps the bottom navigation bar visible while scrolling. Turn it on in Settings → bin0culars mods. |  |
| [Disable home feed auto-refresh](#disable-home-feed-auto-refresh) | Stops the home feed from reloading and jumping to the top when you come back to the app. Turn it on in Settings → bin0culars mods. |  |
| [Disable refresh on back to exit](#disable-refresh-on-back-to-exit) | Pressing back on the home feed exits without scrolling to the top and reloading. Turn it on in Settings → bin0culars mods. |  |
| [Download all from gallery](#download-all-from-gallery) | Tapping Download on a gallery post asks whether to save just the current item or every item in the gallery. |  |
| [Feed auto-scroll](#feed-auto-scroll) | Adds a play button to the navigation bar that slowly scrolls the feed on screen. Speed is set in bin0culars mods. |  |
| [Full-screen reply](#full-screen-reply) | Opens replies in the older full-screen editor that shows the comment you're replying to, so you can select and quote its text. Turn it on in Settings → bin0culars mods. |  |
| [Home feed tabs](#home-feed-tabs) | Adds swipeable For You, Following and Popular tabs to the home feed. Turn it on in Settings → bin0culars mods. |  |
| [Post side panel](#post-side-panel) | On tablets in landscape, opens posts in a panel on the right while the feed stays visible. Can be turned off in Settings → bin0culars mods. |  |
| [Same-subreddit full-screen media](#same-subreddit-full-screen-media) | Lets full-screen videos and images show only posts from the subreddit you opened. Turn it on in Settings → bin0culars mods. |  |
| [Share post content](#share-post-content) | App shortcuts and "Share via…" in the share sheet send the post's image, video or text instead of its link. |  |
| [Swipe up for comments](#swipe-up-for-comments) | In the full-screen video player, swiping up opens the comments and the next video is a sideways swipe away. Turn it on in Settings → bin0culars mods. |  |
| [Tablet grid feed](#tablet-grid-feed) | Shows the feed as a grid with 2 or 3 columns on tablets and other wide screens. Phones are unchanged. |  |

</details>

<!-- PATCHES_END -->

## 📱 Reddit

### Highlights

- **Tablets:** a 2–3 column grid feed on wide screens, and posts that open in a side panel in landscape while the feed stays visible.
- **Feed:** swipeable For You / Following / Popular tabs, a content-type filter, hands-free auto-scroll, Hide always available in the post menu, and no surprise reloads: Home keeps its place when you come back to the app or press back to exit.
- **Navigation:** keep the bottom bar visible while you scroll.
- **Posts and comments:** a collapse/expand-all button next to the comment count (fold all comments, only replies, or only deep replies), the full-screen reply editor with the parent comment visible (select and quote its text), AutoModerator comments shown, collapsed or hidden, and coloured comment lines (one colour per reply level; Rainbow, Pastel or Muted).
- **Media:** swipe up for comments in the video player, and full-screen media that stays in the subreddit you opened.
- **Sharing:** share the post's image, video or text instead of its link, and download every item of a gallery at once.
- **Privacy:** choose whether the account switcher offers Anonymous Browsing or Incognito.

### Settings

All Reddit patches are controlled from Reddit Settings → **bin0culars mods** (this row replaces the "Reddit rules" link). Settings are grouped into Feed, Posts and comments, Media viewer, Navigation, Links and sharing, and Privacy. Some changes need a restart; Reddit offers one when you leave the screen.

Tested on Reddit 2026.45.0, 2026.46.0 and 2026.47.0.

### Use with Morphe's Reddit patches

Morphe Manager's simple mode patches each app from one source. To combine these patches with Morphe's own Reddit patches (for example Start as guest or Hide ads), turn on **Expert mode** in Morphe Manager's settings.

1. Settings → Expert mode.
2. Tap Reddit and choose the app version.
3. On the patch selection screen, each source has its own tab: pick the patches you want in the bin0culars-patches tab and in the Morphe Patches tab (tap "source hidden" if that tab is not shown).
4. Tap Patch and confirm **Proceed anyway** on the "Multiple patch sources selected" notice.

Reddit settings then show both a **bin0culars mods** and a **Morphe** entry.

## 🐛 Issues and requests

For bug reports and feature requests, visit https://github.com/bin0culars/bin0culars-patches/issues.

## 🛠️ Building

Build the patches bundle with:

```bash
./gradlew buildAndroid
```

Building requires a GitHub personal access token with `read:packages` permissions, configured via `gpr.user`/`gpr.key` in `~/.gradle/gradle.properties` or via the `GITHUB_ACTOR`/`GITHUB_TOKEN` environment variables.

The built bundle is output to `patches/build/libs/patches-*.mpp`.

## 📜 License

bin0culars patches are licensed under the [GNU General Public License v3.0](LICENSE), with additional conditions under section 7 — see [NOTICE](NOTICE). Parts are adapted from [Morphe patches](https://github.com/MorpheApp/morphe-patches).
