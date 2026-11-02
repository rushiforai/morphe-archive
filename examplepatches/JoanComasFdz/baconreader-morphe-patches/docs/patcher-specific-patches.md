<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->

# Patcher-specific: patches (Morphe)

The settings of the patches and how the Morphe ports differ from ReVanced. What each patch does is in [patches.md](patches.md).

## ReVanced source

Ported from [ReVanced Patches](https://gitlab.com/ReVanced/revanced-patches)' BaconReader merge requests !6989 and !6998. See [NOTICE](../NOTICE).

## Settings

Patches with settings add them to one screen. Open it from BaconReader's settings → Patches, the last entry of the menu.

- The screen is built in Java by the extension (`BaconReaderPreferenceFragment`) and shown in BaconReader's `GoogleApiActivity`, in BaconReader's theme (light, dark or black).
- Its sections are Images and videos, Links, Comments and Chat. A section shows only when a selected patch has settings in it. An About section at the end shows "BaconReader Patches" and the patches' version.
- A setting that needs another is greyed out while that one is off.
- Settings are stored in Morphe's `morphe_prefs` preferences. The screen has no export or import.
- The entry, the screen and the drawer's version footer come with `settingsPatch`, an internal patch without a name. Every patch with settings depends on it, so they show whenever one of those patches is selected, and never otherwise.
- The drawer ends with "Patches <version> (Morphe)", such as "Patches 1.2.0 (Morphe)". The version is the `version` in `gradle.properties` the `.mpp` was built with.

Errors of the patches show in a dialog over the current screen, with the details to copy or save to Downloads. Morphe's own `Logger.printException` shows there too. An error a patch doesn't catch still closes the app.

### Embed comment images settings

| Section | Setting | Key | Default |
|---|---|---|---|
| Images and videos | Show images | `revanced_baconreader_show_images` | On |
| Images and videos | Full width by default | `revanced_baconreader_images_full_width` | Off. Needs Show images |
| Images and videos | Long press to download | `revanced_baconreader_images_long_press_download` | On. Needs Show images |
| Images and videos | Load images only on Wi-Fi | `revanced_baconreader_images_wifi_only` | Off. Needs Show images |
| Images and videos | Play videos in comments | `revanced_baconreader_show_videos` | On |
| Images and videos | Gestures: text only | None | |
| Links | Show YouTube video titles | `revanced_baconreader_youtube_titles` | On |
| Links | Show YouTube thumbnails | `revanced_baconreader_youtube_thumbnails` | Off |
| Links | Show X posts | `revanced_baconreader_x_posts` | On |
| Links | Show Bluesky posts | `revanced_baconreader_bluesky_posts` | On |

### Improve post media loading settings

In the Links section:

| Setting | Key | Default |
|---|---|---|
| JavaScript in link posts | `revanced_baconreader_link_preview_javascript` | On: every site runs JavaScript, except the blocked ones. Off: only the allowed ones |
| Blocked sites | `revanced_baconreader_link_preview_javascript_blocked` | Empty. Greyed out while JavaScript in link posts is off |
| Allowed sites | `revanced_baconreader_link_preview_javascript_allowed` | `bsky.app`, `imgur.com`, `instagram.com`, `reddit.com`, `streamable.com`, `twitch.tv`, `twitter.com`, `vimeo.com`, `x.com`, `youtu.be`, `youtube.com`. Greyed out while JavaScript in link posts is on |

Sites go one per line, and include their subdomains.

### Prompt to open Reddit links settings

In the Links section:

| Setting | Key | Default |
|---|---|---|
| Open Reddit links in BaconReader: how many Reddit links open in BaconReader; tap to open Android's "Open by default" screen | None | |
| Whether the prompt was answered, not shown | `revanced_baconreader_open_links_prompt_shown` | Off |

### Load more comments settings

In the Comments section:

| Setting | Key | Default |
|---|---|---|
| Comments to load: 200 to 500, with a number box and a slider | `revanced_baconreader_comment_limit` | `500` |
| Auto-load "load more comments": Off, 1 reply, or up to 2 to 5 replies | `revanced_baconreader_auto_load_more_comments` | Up to 2 replies (`2`) |

### Show user avatars settings

In the Comments section:

| Setting | Key | Default |
|---|---|---|
| Show user avatars | `revanced_baconreader_user_avatars` | Off |
| Avatar size: Normal, Medium, Large or Extra large | `revanced_baconreader_user_avatar_size` | Normal (`0`). Needs Show user avatars |
| Avatar background | `revanced_baconreader_user_avatar_background` | On. Needs Show user avatars |

### Video autoplay in detail view settings

In the Images and videos section:

| Setting | Key | Default |
|---|---|---|
| Autoplay videos in Detail View | `revanced_baconreader_autoplay_videos_in_detail_view` | On |

Off, the detail view of a post shows the post's preview image (the largest of Reddit's preview resolutions) with a play button in place of a video shown by ExoPlayer (v.redd.it, and the MP4 and GIFV videos of Imgur and RedGIFs), and doesn't load the video. A tap on it gives the video back to BaconReader, which shows and plays it as it does with the setting on. The detail view is the one whose `PostMediaHandler` listener is `DetailLinkFragment$6`: the full-screen photo viewer and the browser keep autoplaying, and so do the videos in comments. A post without a preview image shows a black page with the play button.

### Reddit chat settings

In the Chat section:

| Setting | Key | Default |
|---|---|---|
| Chat messages apart from the inbox | `revanced_baconreader_check_chat_messages` | On |

## Differences from ReVanced

The ports follow ReVanced's BaconReader merge requests !6989 and !6998 closely: the same settings keys, the settings screen in `GoogleApiActivity`, the same edits (removed instructions, `nop`s, a method rebuilt without its try block) and the same reflection in the extension. The differences:

- **Versions.** The patches are pinned to BaconReader 6.1.4 (`shared/Constants.kt`).
- **Settings entry.** It's called "Patches".
- **Morphe's errors.** Errors the Morphe extensions library reports with `Logger.printException` show in the patches' error dialog instead of a toast. The dialog's "Patches" line shows the patches' version.
- **User agent.** Avatar images and the audio of saved videos are downloaded with the user agent `android:com.onelouder.baconreader (Morphe)`.
- **List thumbnails.** For Imgur posts, BaconReader writes the image's URL into the register of the post, which the thumbnail loader then got instead of the post. The port does the app's Imgur step in the extension (`imgurThumbnail`), so the loader gets the post.
- **Fix unread messages.** While Reddit chat keeps chat messages apart from the inbox, the unread check asks for up to 100 messages and leaves the chat ones out.
- **Tables and accessibility.** ReVanced draws a table on one character of the text, so TalkBack and UI tests see nothing of it. Here each cell and the "↔ Expand" / "Fit to screen" button are virtual views of the text, with their text and where they show, and the button and the cells with a link can be clicked.
- **Links in spoilers.** In ReVanced, a tap on a link in a hidden spoiler opens the link without showing the spoiler: the app's touch handler takes the link first. Here the link waits until the spoiler shows.
- **Hidden spoilers and accessibility.** ReVanced only paints a hidden spoiler over, so TalkBack reads it aloud. Here, while a spoiler is hidden, the text's description reads it as "spoiler".
- **Comment search buttons.** ReVanced's find bar names only its text field and its filter button. Here its arrows and its close button are named too: "Previous match", "Next match" and "Close search".
- **Not from ReVanced:**
  - Reddit chat, ported from baconreader-reseam-patches;
  - Video autoplay in detail view, ported from baconreader-reseam-patches;
  - Disable final release announcement;
  - the drawer's version footer.
