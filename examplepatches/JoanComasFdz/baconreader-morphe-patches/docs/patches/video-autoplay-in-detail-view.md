<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: VideoAutoplayInDetailViewTests -->

# Video autoplay in detail view

A setting to stop videos from loading and playing by themselves when you open a post.

- With the setting off, a video post's detail view shows the post's preview image with a play button, and doesn't
  download the video. Tap it to play the video.
- GIFs play as before, and so do videos in the full-screen viewer and the browser.

**Settings** (BaconReader → Settings → Patches, under "Images and videos"):
- **Autoplay videos in Detail View** (on by default): videos, such as v.redd.it videos, start playing when the post
  opens. Off, the post shows its preview with a play button.

**Limits**:
- BaconReader shows a post's media in its detail view only with its own "Show large image" on (Settings → Detail
  View).
- A post without a preview image shows a black page with the play button.
