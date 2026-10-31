# 🔄🧩 Sync Up

> [!WARNING]
> **This project has been primarily driven by AI. Use it with caution.**
> The only patches that have been tested are the ones I use myself; everything
> else is unverified. Review the code before you run it, and expect rough edges.

[![Add to Morphe](https://img.shields.io/github/v/release/RashKash103/sync-up?sort=semver&display_name=tag&label=Add%20to%20Morphe&labelColor=1f1f26&color=6750a4&style=for-the-badge)](https://morphe.software/add-source?github=RashKash103/sync-up)

Morphe patches for [Sync for Reddit](https://play.google.com/store/apps/details?id=com.laurencedawson.reddit_sync).

Click the badge above to add this patch source to Morphe Manager. It always shows the
current release.

## ❓ About

Sync for Reddit was discontinued after Reddit's 2023 API pricing changes. Sync Up is a
Morphe compatible patch bundle that brings it back: it patches the app to use your own
OAuth client credentials and fixes a handful of things that broke along the way.

Sync Up started as a port of the Sync for Reddit patches from
[Patcheddit](https://github.com/wchill/patcheddit) by [wchill](https://github.com/wchill).
The initial import is a faithful copy of those patches, with the patches for the other
third party Reddit clients (Boost, RIF, Relay, BaconReader, Joey, Infinity+, Continuum,
Slide) and for Sync for Lemmy left out. Improvements specific to Sync for Reddit are made
here on top of that baseline.

If you use one of those other apps, use [Patcheddit](https://github.com/wchill/patcheddit)
directly — it is the upstream project and it supports all of them.

### How to use these patches

Add this patch source to Morphe Manager: https://morphe.software/add-source?github=RashKash103/sync-up

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.9.4](https://github.com/RashKash103/sync-up/releases/tag/v1.9.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;31 patches total
<details open>
<summary>📦 Sync for Reddit&nbsp;&nbsp;•&nbsp;&nbsp;30 patches</summary>
<br>

**🎯 Supported versions:**

| v23.06.30-13:39 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Add archive links to menus](#add-archive-links-to-menus) | Adds Wayback Machine and archive.today options to the menus behind a post and behind a link. |  |
| [Automatically undelete Imgur media](#automatically-undelete-imgur-media) | Loads Imgur images and videos that no longer exist from the Wayback Machine. |  |
| [Automatically undelete Reddit content](#automatically-undelete-reddit-content) | Restores the text of removed posts and comments, and the names of deleted authors, from Project Arctic Shift. |  |
| [Disable Sync for Lemmy bottom sheet](#disable-sync-for-lemmy-bottom-sheet) | Disables the bottom sheet at the startup that asks you to signup to "Sync for Lemmy". |  |
| [Disable ads](#disable-ads) | Removes the ads shown between posts. |  |
| [Fix /s/ links](#fix-s-links) | Opens Reddit's shortened /s/ share links in the app. |  |
| [Fix Imgur links](#fix-imgur-links) | Resolves Imgur links in the app instead of through Sync's proxy, which no longer exists. |  |
| [Fix Redgifs API](#fix-redgifs-api) | Fixes loading RedGifs media, which RedGifs otherwise refuses. |  |
| [Fix loading more comments](#fix-loading-more-comments) | Loads the comments behind a "view more" from the thread instead of the endpoint Reddit stopped answering. |  |
| [Fix opening albums](#fix-opening-albums) | Looks a post up through Reddit's thread endpoint instead of the one Reddit stopped answering, which is what an album is opened by. |  |
| [Fix post thumbnails](#fix-post-thumbnails) | Fixes loading post thumbnails by correcting their URLs. |  |
| [Fix revealing spoilers](#fix-revealing-spoilers) | Opens a spoiler where it sits when it is tapped, which Sync otherwise answers with "Missing post information". |  |
| [Fix video downloads](#fix-video-downloads) | Fixes a bug in Sync's MPD parser resulting in only the audio-track being saved. |  |
| [Gestures for the video player](#gestures-for-the-video-player) | Double tap a video or GIF to play or pause it rather than zoom, drag sideways to seek, and drag up or down after a double tap for volume. |  |
| [Keep the links in the text of a post](#keep-the-links-in-the-text-of-a-post) | Keeps the formatting and links in the body shown under a post, which Sync otherwise discards. |  |
| [Keep transparency in a picture](#keep-transparency-in-a-picture) | Draws the transparent parts of a picture opened in the viewer as the background behind it rather than as white. |  |
| [Load threads whose text contains a dollar sign](#load-threads-whose-text-contains-a-dollar-sign) | Stops a thread failing to load when the text in it contains a dollar sign. |  |
| [Make an address in a post tappable](#make-an-address-in-a-post-tappable) | Draws a bare address in a post's body as a link. |  |
| [Modify login WebView](#modify-login-webview) | Modify the WebView used for logging into reddit to prevent login issues |  |
| [More actions on the floating button](#more-actions-on-the-floating-button) | Puts up to four of Sync's own actions beside the feed's floating button. |  |
| [Recover post thumbnails from the archive](#recover-post-thumbnails-from-the-archive) | Loads a post's thumbnail from the Wayback Machine when its Reddit preview has been purged. |  |
| [Redirect Gfycat links to RedGifs](#redirect-gfycat-links-to-redgifs) | Loads Gfycat links from RedGifs, including the autoplaying video Sync asks its own proxy for. |  |
| [Show a hidden profile from the archive](#show-a-hidden-profile-from-the-archive) | Fills in a profile from Project Arctic Shift when Reddit answers with nothing. |  |
| [Show a subreddit's banner on its feed](#show-a-subreddit-s-banner-on-its-feed) | Draws the banner a subreddit sets at the top of its posts, rather than only on its About page. |  |
| [Show media in a comment where it sits](#show-media-in-a-comment-where-it-sits) | Draws a link in a comment as the picture or video it points at rather than as a chip naming where it goes. |  |
| [Show videos posted in comments](#show-videos-posted-in-comments) | Draws a video posted in a comment in the comment, and plays it when tapped. |  |
| [Spoof client](#spoof-client) | Restores functionality of the app by using custom client ID. | • OAuth client ID<br>• Redirect URI<br>• User agent<br>• Imgur client ID |
| [Translate posts and comments](#translate-posts-and-comments) | Translates a post or comment where it sits, on this device or through DeepL or Google Cloud. |  |
| [Unlock Sync Ultra](#unlock-sync-ultra) | Turns on the Sync Ultra features that work on the device alone, and removes the offers to buy it. |  |
| [Use /user/ endpoint](#use-user-endpoint) | Replaces the deprecated /u profile endpoint with /user. |  |

</details>

<details open>
<summary>📦 Sync for Reddit Pro&nbsp;&nbsp;•&nbsp;&nbsp;29 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Add archive links to menus](#add-archive-links-to-menus) | Adds Wayback Machine and archive.today options to the menus behind a post and behind a link. |  |
| [Automatically undelete Imgur media](#automatically-undelete-imgur-media) | Loads Imgur images and videos that no longer exist from the Wayback Machine. |  |
| [Automatically undelete Reddit content](#automatically-undelete-reddit-content) | Restores the text of removed posts and comments, and the names of deleted authors, from Project Arctic Shift. |  |
| [Disable Sync for Lemmy bottom sheet](#disable-sync-for-lemmy-bottom-sheet) | Disables the bottom sheet at the startup that asks you to signup to "Sync for Lemmy". |  |
| [Fix /s/ links](#fix-s-links) | Opens Reddit's shortened /s/ share links in the app. |  |
| [Fix Imgur links](#fix-imgur-links) | Resolves Imgur links in the app instead of through Sync's proxy, which no longer exists. |  |
| [Fix Redgifs API](#fix-redgifs-api) | Fixes loading RedGifs media, which RedGifs otherwise refuses. |  |
| [Fix loading more comments](#fix-loading-more-comments) | Loads the comments behind a "view more" from the thread instead of the endpoint Reddit stopped answering. |  |
| [Fix opening albums](#fix-opening-albums) | Looks a post up through Reddit's thread endpoint instead of the one Reddit stopped answering, which is what an album is opened by. |  |
| [Fix post thumbnails](#fix-post-thumbnails) | Fixes loading post thumbnails by correcting their URLs. |  |
| [Fix revealing spoilers](#fix-revealing-spoilers) | Opens a spoiler where it sits when it is tapped, which Sync otherwise answers with "Missing post information". |  |
| [Fix video downloads](#fix-video-downloads) | Fixes a bug in Sync's MPD parser resulting in only the audio-track being saved. |  |
| [Gestures for the video player](#gestures-for-the-video-player) | Double tap a video or GIF to play or pause it rather than zoom, drag sideways to seek, and drag up or down after a double tap for volume. |  |
| [Keep the links in the text of a post](#keep-the-links-in-the-text-of-a-post) | Keeps the formatting and links in the body shown under a post, which Sync otherwise discards. |  |
| [Keep transparency in a picture](#keep-transparency-in-a-picture) | Draws the transparent parts of a picture opened in the viewer as the background behind it rather than as white. |  |
| [Load threads whose text contains a dollar sign](#load-threads-whose-text-contains-a-dollar-sign) | Stops a thread failing to load when the text in it contains a dollar sign. |  |
| [Make an address in a post tappable](#make-an-address-in-a-post-tappable) | Draws a bare address in a post's body as a link. |  |
| [Modify login WebView](#modify-login-webview) | Modify the WebView used for logging into reddit to prevent login issues |  |
| [More actions on the floating button](#more-actions-on-the-floating-button) | Puts up to four of Sync's own actions beside the feed's floating button. |  |
| [Recover post thumbnails from the archive](#recover-post-thumbnails-from-the-archive) | Loads a post's thumbnail from the Wayback Machine when its Reddit preview has been purged. |  |
| [Redirect Gfycat links to RedGifs](#redirect-gfycat-links-to-redgifs) | Loads Gfycat links from RedGifs, including the autoplaying video Sync asks its own proxy for. |  |
| [Show a hidden profile from the archive](#show-a-hidden-profile-from-the-archive) | Fills in a profile from Project Arctic Shift when Reddit answers with nothing. |  |
| [Show a subreddit's banner on its feed](#show-a-subreddit-s-banner-on-its-feed) | Draws the banner a subreddit sets at the top of its posts, rather than only on its About page. |  |
| [Show media in a comment where it sits](#show-media-in-a-comment-where-it-sits) | Draws a link in a comment as the picture or video it points at rather than as a chip naming where it goes. |  |
| [Show videos posted in comments](#show-videos-posted-in-comments) | Draws a video posted in a comment in the comment, and plays it when tapped. |  |
| [Spoof client](#spoof-client) | Restores functionality of the app by using custom client ID. | • OAuth client ID<br>• Redirect URI<br>• User agent<br>• Imgur client ID |
| [Translate posts and comments](#translate-posts-and-comments) | Translates a post or comment where it sits, on this device or through DeepL or Google Cloud. |  |
| [Unlock Sync Ultra](#unlock-sync-ultra) | Turns on the Sync Ultra features that work on the device alone, and removes the offers to buy it. |  |
| [Use /user/ endpoint](#use-user-endpoint) | Replaces the deprecated /u profile endpoint with /user. |  |

</details>

<details open>
<summary>📦 Sync for Reddit Dev&nbsp;&nbsp;•&nbsp;&nbsp;29 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Add archive links to menus](#add-archive-links-to-menus) | Adds Wayback Machine and archive.today options to the menus behind a post and behind a link. |  |
| [Automatically undelete Imgur media](#automatically-undelete-imgur-media) | Loads Imgur images and videos that no longer exist from the Wayback Machine. |  |
| [Automatically undelete Reddit content](#automatically-undelete-reddit-content) | Restores the text of removed posts and comments, and the names of deleted authors, from Project Arctic Shift. |  |
| [Disable Sync for Lemmy bottom sheet](#disable-sync-for-lemmy-bottom-sheet) | Disables the bottom sheet at the startup that asks you to signup to "Sync for Lemmy". |  |
| [Fix /s/ links](#fix-s-links) | Opens Reddit's shortened /s/ share links in the app. |  |
| [Fix Imgur links](#fix-imgur-links) | Resolves Imgur links in the app instead of through Sync's proxy, which no longer exists. |  |
| [Fix Redgifs API](#fix-redgifs-api) | Fixes loading RedGifs media, which RedGifs otherwise refuses. |  |
| [Fix loading more comments](#fix-loading-more-comments) | Loads the comments behind a "view more" from the thread instead of the endpoint Reddit stopped answering. |  |
| [Fix opening albums](#fix-opening-albums) | Looks a post up through Reddit's thread endpoint instead of the one Reddit stopped answering, which is what an album is opened by. |  |
| [Fix post thumbnails](#fix-post-thumbnails) | Fixes loading post thumbnails by correcting their URLs. |  |
| [Fix revealing spoilers](#fix-revealing-spoilers) | Opens a spoiler where it sits when it is tapped, which Sync otherwise answers with "Missing post information". |  |
| [Fix video downloads](#fix-video-downloads) | Fixes a bug in Sync's MPD parser resulting in only the audio-track being saved. |  |
| [Gestures for the video player](#gestures-for-the-video-player) | Double tap a video or GIF to play or pause it rather than zoom, drag sideways to seek, and drag up or down after a double tap for volume. |  |
| [Keep the links in the text of a post](#keep-the-links-in-the-text-of-a-post) | Keeps the formatting and links in the body shown under a post, which Sync otherwise discards. |  |
| [Keep transparency in a picture](#keep-transparency-in-a-picture) | Draws the transparent parts of a picture opened in the viewer as the background behind it rather than as white. |  |
| [Load threads whose text contains a dollar sign](#load-threads-whose-text-contains-a-dollar-sign) | Stops a thread failing to load when the text in it contains a dollar sign. |  |
| [Make an address in a post tappable](#make-an-address-in-a-post-tappable) | Draws a bare address in a post's body as a link. |  |
| [Modify login WebView](#modify-login-webview) | Modify the WebView used for logging into reddit to prevent login issues |  |
| [More actions on the floating button](#more-actions-on-the-floating-button) | Puts up to four of Sync's own actions beside the feed's floating button. |  |
| [Recover post thumbnails from the archive](#recover-post-thumbnails-from-the-archive) | Loads a post's thumbnail from the Wayback Machine when its Reddit preview has been purged. |  |
| [Redirect Gfycat links to RedGifs](#redirect-gfycat-links-to-redgifs) | Loads Gfycat links from RedGifs, including the autoplaying video Sync asks its own proxy for. |  |
| [Show a hidden profile from the archive](#show-a-hidden-profile-from-the-archive) | Fills in a profile from Project Arctic Shift when Reddit answers with nothing. |  |
| [Show a subreddit's banner on its feed](#show-a-subreddit-s-banner-on-its-feed) | Draws the banner a subreddit sets at the top of its posts, rather than only on its About page. |  |
| [Show media in a comment where it sits](#show-media-in-a-comment-where-it-sits) | Draws a link in a comment as the picture or video it points at rather than as a chip naming where it goes. |  |
| [Show videos posted in comments](#show-videos-posted-in-comments) | Draws a video posted in a comment in the comment, and plays it when tapped. |  |
| [Spoof client](#spoof-client) | Restores functionality of the app by using custom client ID. | • OAuth client ID<br>• Redirect URI<br>• User agent<br>• Imgur client ID |
| [Translate posts and comments](#translate-posts-and-comments) | Translates a post or comment where it sits, on this device or through DeepL or Google Cloud. |  |
| [Unlock Sync Ultra](#unlock-sync-ultra) | Turns on the Sync Ultra features that work on the device alone, and removes the offers to buy it. |  |
| [Use /user/ endpoint](#use-user-endpoint) | Replaces the deprecated /u profile endpoint with /user. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Android debugging](#enable-android-debugging) | Enables Android developer debugging capabilities. Including this patch can slow down the app. |  |

</details>

<!-- PATCHES_END -->

### What the patches do

The list above is generated from the bundle and carries the short description shown in
Morphe Manager. This section covers the same patches in more detail: what each one
changes, and where it stops.

Patches that reach out to an archive only do so when the app has already come up empty,
and never speculatively. Nothing is prefetched, and nothing is sent anywhere except the
service being asked.

#### Getting the app working again

- **Spoof client** — Replaces Sync's revoked OAuth credentials with your own client ID,
  redirect URI and user agent. Nothing else works without this. See
  [Getting started](#-getting-started). Its `Imgur client ID` option is separate and optional;
  see [Uploading pictures to Imgur](#uploading-pictures-to-imgur).
- **Fix /s/ links** — Reddit's shortened `/s/` share links resolve to a real thread rather
  than failing.
- **Use /user/ endpoint** — Profiles are fetched from `/user/`; the `/u/` form Sync used is
  no longer served.
- **Fix opening albums** — Reddit stopped answering `/api/info`, the endpoint Sync looks a post
  up by, and refuses `/by_id` beside it, so an album raised an error instead of opening. The
  post is read from its own thread, which publishes the same gallery, and the reply is cut back
  to the shape the old endpoint answered in. Ordinary listings were never affected.
- **Fix loading more comments** — Reddit stopped answering `/api/morechildren` as well, so a
  "view more" only ever raised an error. The comments behind it are read from the thread, where
  Reddit still serves any comment and everything hanging from it, and the reply is flattened the
  way the old endpoint answered. The comments already on screen are left out, so nothing is
  drawn twice.
- **Modify login WebView** — Routes the login page through the extension so that signing in
  completes.
- **Disable ads**, **Disable Sync for Lemmy bottom sheet** — Removes the ads shown between
  posts, and the prompt to sign up to Sync for Lemmy at startup.

#### Media that no longer loads

- **Fix Redgifs API** — RedGifs refuses Sync's requests as they stand; this makes them
  acceptable again.
- **Redirect Gfycat links to RedGifs** — Gfycat shut down and its domains no longer resolve.
  Much of its content moved to RedGifs, and Gfycat links are answered from there. Content
  that did not move stays broken.
- **Fix Imgur links** — Sync resolves Imgur links through a proxy of its own that no longer
  exists. Those requests are answered in the app instead. An album that still exists is read
  from its own page; one that has gone is looked for in the archive, where only albums
  captured while Imgur still rendered the list into the page can be recovered.
- **Automatically undelete Imgur media** — Imgur removed a large amount of older content.
  Images and videos that no longer exist are loaded from the Wayback Machine, including the
  still shown for a video in a feed. Only what the archive happens to hold is recoverable.
- **Fix post thumbnails** — Corrects the thumbnail URLs Sync builds.
- **Recover post thumbnails from the archive** — Reddit purges the preview it generated for
  older posts, leaving a blank tile even where opening the post still works. The linked
  image is fetched from the Wayback Machine, and only once the preview has actually failed.
- **Fix video downloads** — Corrects Sync's MPD parser, which saved only the audio track.
- **Show media in a comment where it sits** — Sync draws a link in a comment inline only
  where the address ends in one of five extensions or names one of a handful of services;
  everything else becomes a chip naming where it goes. This widens that to everything Sync
  can draw, and draws the picture itself rather than a card beside the address. Sizes come
  from what Reddit sends alongside the comments, so a picture is in proportion the first
  time rather than standing as a card until it has been measured. A video is drawn as the
  frame it starts on with a play mark over it, since a player cannot live in a line of
  text; tapping it opens it and it plays. Anything that cannot be drawn — a picture whose
  size is not known yet, a video with no frame to take — is left exactly as Sync drew it,
  which is a card. Off by default, under *Comment options*.

  How large media is drawn is settled by three settings beside it. By default each picture
  is drawn at **its own size** — the pixels it actually has — so a low-resolution image is
  small rather than blown up to the width of the comment, and *Largest media size* caps how
  far one may grow. *Media size* can instead hold every picture to the same width or the
  same height, set by *Media width* and *Media height*. Whichever two do not apply to the
  size in use are faded, and they change as the size is chosen. Nothing is ever drawn wider
  than the comment it sits in.

- **Show videos posted in comments** — Reddit writes a video posted in a comment as a link
  to a player page on its own site, which opens in a browser and is answered with a banned
  notice. The link is pointed at the video itself, so it is drawn beside the comment like
  any other media and plays in Sync's own player. Whether it is drawn is governed by Sync's
  own *Inline image previews* setting.

#### Text that is missing or inert

- **Automatically undelete Reddit content** — Restores the text of removed posts and
  comments from Project Arctic Shift, and the name of an author whose account has since
  been deleted. A note under the author says why the content was taken down. Only text is
  recoverable, only where the archive holds it, and media in a removed post stays gone.
- **Show a hidden profile from the archive** — An account can hide its own posts and
  comments from its profile, which Sync shows as a user with nothing to their name. Project
  Arctic Shift still serves what it recorded while those posts were public. Only a profile
  that comes back empty is filled in, and only its posts, comments and overview tabs.
- **Keep the links in the text of a post** — Sync renders the body shown under a post in
  full and then discards the result, drawing bare characters. Keeping it means quotes,
  emphasis and links appear. Images are still discarded, so a feed loads no more than it
  did. A link in a post body in a feed becomes tappable, so tapping directly on one opens
  the link rather than the post.
- **Make an address in a post tappable** — Sync turns a bare address into a link only where
  it recognises the host, which is Reddit, Imgur and a couple besides. Any address in a
  post body is written as a link instead. An address already written as a link is left
  alone.
- **Load threads whose text contains a dollar sign** — Sync rewrites code blocks and links
  before drawing them and puts the matched text back as a replacement, where a dollar sign
  does not stand for itself. Text such as `${SYS_USER}` aborted the whole thread with
  "Error loading page".
- **Add archive links to menus** — Adds Wayback Machine and archive.today options to the
  menu behind a post's overflow button and to the one behind a link, next to *Open in
  browser*, for reading a page since taken down or put behind a paywall. Nothing is
  requested until one is tapped.

- **Fix revealing spoilers** — Tapping a spoiler opens it where it sits. Sync answers a tap by
  taking the markers out of the body it stores for the post and writing that back, which only
  runs for one kind of post and reads a body the markers have already been taken out of, so a
  tap said "Missing post information" instead. A spoiler is hidden by being painted in the
  colour it sits on, so the one tapped is remembered and that painting is skipped. Nothing is
  fetched, stored or rewritten, and a spoiler closes again if the text is built afresh.

#### Gestures

- **Gestures for the video player** — In a video or GIF: double tap to play or pause rather
  than zoom, drag sideways to seek, and drag up or down after a double tap to change the
  volume. Each is read as the gesture is made, so anything here can be turned on or off under
  *Gestures* in Sync's settings without repatching, and with all of them off the viewer
  behaves exactly as it did.
  - *Drag sideways to seek* is off, outside galleries, or everywhere. It defaults to outside
    galleries, since an album already uses a sideways drag to move between items.
  - *Seek across a full drag* is how much of the video a drag from edge to edge covers,
    capped at the video's length so a short clip is always reachable end to end.
  - *Change seek precision while dragging* covers more of the video as the finger wanders up
    from where the drag began and less as it wanders down, in steps, with the overlay naming
    the step it is in.
  - *Double tap before seeking* requires a double tap to be held before a drag seeks, for a
    screen where a stray drag would be unwelcome.
  - Volume moves the device's own volume, in the steps the device has.
  - A long press still shows and hides the viewer's controls, as it does without the patch.

#### Translation

- **Translate posts and comments** — Translates a post or a comment where it stands, in place
  of the text rather than under it. Everything about it is set up under *Translation* in Sync's
  own settings, and nothing is translated until asked for.
  - **Where it is offered.** Sync's own translation is a paid feature that also waits on a flag
    it is no longer given, so its *Translate* entries never appear. Both questions are answered
    from the setting instead, and only where they are asked about translating — the rest of the
    app is untouched.
  - **On this device by default.** ML Kit translates without sending the text anywhere, using a
    model fetched the first time a pair of languages is asked for. The first translation into a
    new language waits on a few megabytes; the rest are quick.
  - **DeepL and Google Cloud** translate through a key of your own, entered in the same
    settings. Every run of words in a post goes in one request rather than one each. DeepL's
    remaining allowance is shown against the key, and what it is told about how to translate is
    sent only for the languages that accept it. Neither is used unless chosen.
  - **Any post with words in it**, from a feed or from the comments screen, and a post's title
    as well as its body — Sync itself offers this only for a post with a body, opened from the
    comments screen.
  - **A button in the row under a comment**, beside reply and the rest. Sync has no such button:
    its own translating is offered from the menu at the top of a thread and from a comment's own
    menu. This one is made as each comment is drawn and themed as one of the app's own buttons,
    and the row is left exactly as it was where translation is turned off.
  - **What was written is kept**, so asking a second time puts the original back — the entry
    says *Untranslate* while it would. The line under
    the author says which language it is being read from while it stands translated, beside the
    note about restored text where a comment is both. The note is checked against what the post
    says rather than remembered from when it was asked for, so a thread read again from Reddit —
    which quietly undoes a translation — does not leave it claiming otherwise.
  - **Markdown survives.** Sync translates the text as it is drawn, so links come back as their
    own words and the paragraphs run together. Here the text as written is translated, a line at
    a time, with everything that is not language — where a link points, an address, the name of
    a subreddit or a person, code, emotes, spoilers, and the marks that make text bold or
    italic — held out of the translation and put back after. Where a service does not give one
    of those back, that line is translated again in pieces, which reads less well and cannot
    break a link.
  - **A whole thread, or one conversation in it.** Sync's own *Translate all* is taken over so
    that it translates the way everything else here does, and a comment's menu offers the
    conversation under it. Each comment's language is judged on its own, since a thread holds
    several; one whose language cannot be told is left alone and counted, and asking about that
    one on its own offers to choose a language. A thread asked for whole keeps up: what loads
    into it afterwards is translated as it arrives.
  - **DeepL is told what a comment is answering** — the post, or the post and the comments above
    it, as the setting says. It translates against that without translating it, which is what a
    reply that is a fragment needs. Nothing is sent for a post, which answers nothing.
  - Translations are kept for as long as the setting says, so reading a thread again does not
    pay for it twice. What is being kept, and clearing it, are in the same settings.

#### Sync Ultra

- **Unlock Sync Ultra** — Turns on the parts of Sync's subscription that need nothing but the
  device they run on, and takes away what can no longer be had.
  - **Website previews** in comments — including the picture beside them. Sync asks its own
    proxy for that picture and the proxy refuses everything now, so every preview but a video's
    came out as a broken image. The page is read instead and asked which picture it names for
    being quoted, which is what pages have carried in their head for years. What each page
    answers is remembered, so a thread full of links to one place asks it once.
  - **Reading text out of an image**, **tagging a user**,
    **following a link past Google's copy of a page**, **opening the app logged out**, and the
    joke-link bypass. Each still obeys its own setting; the patch only answers the questions
    asked before that setting is reached.
  - Those questions were three: whether the copy is paid for, whether a flag was turned on from
    afar, and — for several of them — whether the account reading it is one of the developer's
    own. The last two mean some of these were finished and then never given to anyone.
  - **What is left alone**: paints, tags and settings kept on Sync's own servers, its cloud
    backup, and its own restoring of removed comments. Those need services that no longer
    answer, and a button that can only fail is worse than no button. Sync's own translating is
    replaced rather than unlocked — see *Translation* above.
  - The **Sync Ultra screen is removed** from settings, along with the cloud backup section that
    needed it and the offer to buy it in the account switcher.

#### Other

- **Enable Android debugging** — Inherited from upstream, off by default, and applies to any
  app rather than to Sync alone. It slows the app down and is only useful when debugging it.

## 🚀 Getting started

1. Install [Morphe Manager](https://morphe.software/) and switch it to advanced/expert mode.
2. Click [this link](https://morphe.software/add-source?github=RashKash103/sync-up) to add
   this patch source to Morphe Manager.
3. Get the APK for Sync for Reddit. APKM bundles (aka split APKs) also work.
   * Use the last released version, `v23.06.30-13:39`. The Pro and Dev package names are
     supported too, but no specific version of them is verified.
4. Select the patches you want, then patch.
   * You will need an OAuth client ID from https://www.reddit.com/prefs/apps/. Reddit is no
     longer issuing new ones without an approval process that usually ends in denial, so see
     [What if I don't have a client ID?](#what-if-i-dont-have-a-client-id) below.
   * Make sure the redirect URI in the `Spoof client` options and on
     https://www.reddit.com/prefs/apps/ match exactly.
5. Once patching is complete, install the app and set it up as usual.

### Uploading pictures to Imgur

Attaching a picture to a post or a comment uploads it to Imgur, and Sync identifies itself with
a client ID shared by every copy of the app. That ID has long since spent its daily allowance —
Imgur answers an upload with `x-ratelimit-clientremaining: 0` — so the upload fails and Sync
says *Failed to upload image*. Everything else about Imgur, including viewing and opening links,
is unaffected.

Registering your own is free, takes a minute, and gives you the full allowance to yourself:

1. Go to https://api.imgur.com/oauth2/addclient while signed in to Imgur.
2. Pick any name, and choose **OAuth 2 authorization without a callback URL**.
3. Copy the **Client ID** — fifteen hex characters, no secret needed.
4. Put it in the `Imgur client ID` option of the `Spoof client` patch and repatch.

Left alone, the option keeps Sync's own ID and uploading keeps failing. No working ID is shipped
in the bundle, for the same reason the Reddit one is not: a shared credential is scraped and
revoked, and then it works for nobody.

### What if I don't have a client ID?

You can use the client ID from another working third party Reddit app (sadly not the official
one). RedReader is the one to use: they have a deal with Reddit to use the API for free for
accessibility reasons. The same steps work with other apps, but then that app's developer pays
for the API calls you make, which is not recommended.

1. Install RedReader from the Play Store and log in with it.
2. After you log in you should get an email titled `You've authorized a new app in your Reddit
   account`. Look for `App ID:` in that email and note the random looking string.
   * You can uninstall RedReader afterwards.
3. In Morphe Manager, set these values for the `Spoof client` patch. Make sure there are no
   extra spaces or trailing slashes.
   * `OAuth client ID` — the random looking string from the email.
   * `Redirect URI` — `redreader://rr_oauth_redir` (or the matching value if you took the
     client ID from a different app).
   * `User agent` — `org.quantumbadger.redreader/1.25.1`. Ignore the description that says
     what the user agent format should be.
4. Select your other patches and patch as normal.

The client ID is not shipped inside the patch on purpose: it would end up scraped, revoked,
and broken for everyone.

### Resolving login problems

**I cannot select the username/password fields on the login page — my keyboard pops up and
disappears again.**
Switch your phone to landscape mode. There is a cookie banner that needs to be dismissed, but
it is bugged and only shows up in landscape.

**I get `{}` or `Error: Invalid request to Oauth API`.**
Your redirect URI is probably wrong. It has to match exactly between the patch options and
your Reddit app at https://www.reddit.com/prefs/apps/. Do not add a trailing `/`.

**Reddit says my username/password are invalid even though they are correct.**
Reddit does not like the network you are logging in from (corporate/work network, country with
banned IP ranges, etc). Try a VPN or cellular data. Restarting your phone, clearing Chrome
cookies, clearing app data for Android System WebView, or updating Android System WebView can
also help.

**I cannot hit Accept on the Authorize screen.**
Change your Reddit site language to English. This screen is reported not to work otherwise.

**I still get 403 Blocked.**
A garbage user agent eventually gets blocked by Reddit. Reddit also blocks any mention of
`rubenmayayo`, and other substrings such as `isfun` are known to trigger blocks.

**I get 401 when I open the app.**
You probably created a web app instead of an installed app. Delete it, create an installed app,
and repatch with the new client ID. Also, do not use autofill when logging into Reddit — type
or paste your password manually.

**I get 400 Bad Request while logged in.**
Log out and back in, or uninstall the app (back up your settings first) and reinstall it.

**I get a `null: null` error when I open the app.**
Your client ID is incorrect. Check that you copied it correctly.

## 🛠️ Building locally

1. Set up a GitHub PAT as described in the
   [Morphe Patcher setup docs](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment).
   The build resolves the Morphe Gradle plugin and libraries from GitHub Packages.
2. Run `./gradlew buildAndroid` (JDK 21).
3. The bundle is written to `patches/build/libs/patches-*.mpp`. Apply it with
   [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) or Morphe Manager like any
   other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more.

### 🧪 Testing against a real APK

`test/test_all_apks.py` rebuilds the bundle, downloads the latest
[Morphe Desktop](https://github.com/MorpheApp/morphe-desktop), and patches every APK you drop into
`test/`:

```sh
cp ~/Downloads/sync-for-reddit.apk test/
uv run test/test_all_apks.py
```

Patch options are read from `test/config.json` if it exists (Morphe options file format);
without it, the patches run with their defaults, which means `Spoof client` will fail its
required `client-id` option. `test/config.json` and `test/output/` are gitignored.

## 🧑‍💻 Development

- **Make all changes on the `dev` branch.** `main` holds stable releases.
- Use [semantic commit](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index)
  messages. In practice three types are enough:
  - `feat: Added a new feature` — minor release
  - `fix: Some problem now fixed` — patch release
  - `chore: Change you do not want in the user facing changelog` — no release
- `fix:` and `feat:` commits on `dev` publish a pre-release automatically. Users can opt into
  those by enabling `pre-release` for this source in Morphe Manager.
- When `dev` is ready for a stable release, merge it into `main` (merge, do not squash).
- Releases are handled entirely by [release.yml](.github/workflows/release.yml) and
  [.releaserc](.releaserc). Do not create releases by hand.
- Never edit the generated files by hand: `CHANGELOG.md`, `patches-list.json`,
  `patches-bundle.json`, and the patches list section of this README.

[CLAUDE.md](CLAUDE.md) documents the repository layout and conventions in more detail.

### 📙 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## 📜 License

Sync Up is licensed under the [GNU General Public License v3.0](LICENSE).

Sync Up is a derivative work of Patcheddit, which is itself derived from Morphe. Both carry
additional conditions under GPLv3 Section 7 that are inherited by this project and reproduced
in full in the [NOTICE](NOTICE) file:

- **Attribution (7b).** Any application or derivative work that uses this code must display an
  easily accessible, user-facing message with the exact wording:

  > This app uses code from Patcheddit. To learn more, visit https://reddit.com/r/patcheddit

  and

  > This app uses code from Morphe. To learn more, visit http://morphe.software

- **Name restriction (7c).** The names **"Patcheddit"** and **"Morphe"** may not be used as the
  identity of derivative works. Sync Up is an independent project and is not authored by,
  affiliated with, or endorsed by either project; it is merely compatible with Morphe and
  derived from Patcheddit.

Sync Up adds no further conditions of its own under Section 7.

## 🙏 Credits

- [wchill](https://github.com/wchill) and the Patcheddit contributors, whose Sync for Reddit
  patches this project is built from.
- The [Morphe](https://github.com/MorpheApp) project, for the patcher, the patch library and
  the tooling.
- [ReVanced](https://github.com/ReVanced), whose prior work both of the above build on.
