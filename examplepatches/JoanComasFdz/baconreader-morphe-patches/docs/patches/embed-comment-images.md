<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: EmbedCommentImagesTests -->

# Embed comment images

Comments and post texts show their images, GIFs, emotes, Imgur albums and videos, and what YouTube, X and Bluesky
links point to.

- Images, GIFs and image links show as images, instead of a "GIF" link or the link's address. A bare image link is
  replaced by its image. Reddit's emotes show in the text, instead of their raw code.
- An Imgur album shows its images, one at a time: swipe to the next one, with a counter such as "1 / 3".
- Tap an image to switch between full width and 200×200, double tap it to open it in full screen, where you can pinch
  to zoom, and long press it to save it to Downloads/BaconReader.
- Videos uploaded in comments, which BaconReader couldn't play, and links to video files play in the comment. A video
  grows to the comment's full width when it plays. While its controls show, a "<" button shrinks it to 200×200 and a
  ">" button enlarges it again, and a full screen button shows it over the whole screen, turned sideways when it's wider
  than high. Back or the button closes the full screen, and the video plays on in the comment.
- A bare YouTube link shows the channel and the video's title, such as "@e2ekitchen - Cooking pasta at home". A bare X
  or Bluesky link shows the post: its author, date, text and picture. A link written with its own words keeps them.
- In a post's text, images start at full width. Image, GIF and video posts show their text under the media.

**Settings** (BaconReader → Settings → Patches, under "Images and videos"):
- **Show images** (on by default): shows GIFs, image links and Imgur albums as images. Emotes show either way.
- **Full width by default** (off by default): images in comments start at full width instead of up to 200×200.
- **Long press to download** (on by default): a long press on an image saves it to Downloads/BaconReader.
- **Load images only on Wi-Fi** (off by default): on mobile data, images and video previews wait for a tap.
- **Load images only when tapped** (off by default): images and video previews wait for a tap on every network, with
  "Tap to load image".
- **Play videos in comments** (on by default): plays videos uploaded in comments and video links in the comment.

**Settings** (BaconReader → Settings → Patches, under "Links"):
- **Show YouTube video titles** (on by default): bare YouTube links show the channel and the video's title.
- **Show YouTube thumbnails** (off by default): shows a preview under each YouTube link.
- **Show X posts** (on by default): bare X (Twitter) links show the post.
- **Show Bluesky posts** (on by default): bare Bluesky links show the post.
