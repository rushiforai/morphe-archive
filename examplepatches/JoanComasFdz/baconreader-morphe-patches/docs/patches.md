<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->

# Patches

What each patch does, in a line; its page says more. Shared by the Reseam and Morphe BaconReader repos, word for word,
with the pages in [patches/](patches/). Each patcher's settings, keys and differences from ReVanced are in
[patcher-specific-patches.md](patcher-specific-patches.md).

## 🔧 Fixes

What broke since 2023.

| Patch | What it does |
|---|---|
| [Spoof client](patches/spoof-client.md) | You can log in to Reddit again, and BaconReader loads your feeds. |
| [Fix Redgifs API](patches/fix-redgifs-api.md) | RedGIFs videos play again. |
| [Fix Imgur API](patches/fix-imgur-api.md) | Imgur albums and galleries open again, and images you attach to comments and posts upload again. |
| [Fix list thumbnails](patches/fix-list-thumbnails.md) | The post list shows its thumbnails again, finds the missing ones, and blurs NSFW and spoiler thumbnails. |
| [Fix unread messages](patches/fix-unread-messages.md) | The orange inbox envelope turns back to normal once every message is read. |
| [Fix lost post votes](patches/fix-lost-post-votes.md) | A vote made on a post while its comments load stays on the post in the post list. |
| [Fix load more comments](patches/fix-load-more-comments.md) | "load more comments" loads the hidden comments again. |
| [Fix meme templates](patches/fix-meme-templates.md) | The drawing screen's meme templates load again, with Imgflip's 100 most used ones. |
| [Fix empty saved files](patches/fix-empty-saved-files.md) | Saving a post's media to the device no longer leaves an empty file next to the saved one. |
| [Fix slide show](patches/fix-slide-show.md) | The Slide Show View fits the screen again, and a long post text scrolls. |
| [Fix Reddit links](patches/fix-reddit-links.md) | Share links, video links and other Reddit links open in BaconReader instead of its browser. |
| [Save videos with sound](patches/save-videos-with-sound.md) | Reddit videos saved with "Save to device" keep their sound. |
| [Show request errors](patches/show-request-errors.md) | A failed Reddit request shows its real error instead of BaconReader's message that it stopped working in July 2023. |

## ✨ Features

| Patch | What it does |
|---|---|
| [Reddit chat](patches/reddit-chat.md) | Reddit's chat inside BaconReader, with its unread messages counted and notified. |
| [Embed comment images](patches/embed-comment-images.md) | Comments and post texts show their images, GIFs, emotes, Imgur albums and videos, and what YouTube, X and Bluesky |
| [Improve post media loading](patches/improve-post-media-loading.md) | Post media shows how far its download is, galleries open faster, and you choose which link post pages run JavaScript. |
| [Show tables](patches/show-tables.md) | Tables in comments and posts show as a grid of rows and columns. |
| [Markdown editor](patches/markdown-editor.md) | A big text box with Reddit's formats above it and a character counter, for comments, replies, edits, messages and |
| [Search comments](patches/search-comments.md) | A search button on posts finds the comments with a text or a user name. |
| [Load more comments](patches/load-more-comments.md) | Posts open with up to 500 comments, and fewer "load more comments" to tap. |
| [Show user avatars](patches/show-user-avatars.md) | The author's avatar shows before the name, as on Reddit's website. |
| [Flair filter](patches/flair-filter.md) | A "Flair" button in a subreddit's sort bar shows only the posts with the flairs you pick. |
| [Inbox comment reply screen](patches/inbox-comment-reply-screen.md) | "Reply" in the inbox opens the full comment reply screen, with the message you're replying to. |
| [Hide formatted spoilers](patches/hide-formatted-spoilers.md) | Every spoiler in comments and posts stays hidden until you tap it. |
| [Text post icon](patches/text-post-icon.md) | Text posts in the post list get a page icon instead of a button that looks like a video's play button. |
| [Prompt to open Reddit links](patches/prompt-to-open-reddit-links.md) | BaconReader asks once to set up Reddit links to open in it, which Android doesn't let an app do by itself. |
| [Video autoplay in detail view](patches/video-autoplay-in-detail-view.md) | A setting to stop videos from loading and playing by themselves when you open a post. |
| [Account colors](patches/account-colors.md) | A color for each account, shown as a line under the toolbars, so you see which account is in use. |
| [Select text](patches/select-text.md) | "Select text" in the menus of posts and comments lets you select and copy any part of their text. |
| [Patches entry in settings](patches/patches-entry-in-settings.md) | BaconReader's settings get a "Patches" entry, and the left menu tells which build of the patches is installed. |

## 🧹 Cleanups

| Patch | What it does |
|---|---|
| [Remove awards](patches/remove-awards.md) | Award icons and award actions, which no longer work, are gone. |
| [Remove Random feeds](patches/remove-random-feeds.md) | Random and My Random, which no longer load, are gone from the feed list. |
| [Remove Log out](patches/remove-log-out.md) | "Log out" is gone from the menu's accounts, so you can't log out of every account at once by mistake. |
| [Disable unavailable sidebar](patches/disable-unavailable-sidebar.md) | "View Sidebar" is greyed out on feeds that have no sidebar. |
| [Disable feedback popup](patches/disable-feedback-popup.md) | The popup asking for feedback about BaconReader no longer shows. |
| [Disable final release announcement](patches/disable-final-release-announcement.md) | The "FINAL RELEASE ANNOUNCEMENT!" popup no longer shows when the app starts. |

The patches are pinned to version 6.1.4, BaconReader's last release, of `com.onelouder.baconreader` and
`com.onelouder.baconreader.premium`. Only Premium has been tested.
