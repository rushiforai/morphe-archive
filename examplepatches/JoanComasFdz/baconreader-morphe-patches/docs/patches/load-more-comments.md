<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: LoadMoreCommentsTests -->

# Load more comments

Posts open with up to 500 comments, and fewer "load more comments" to tap.

- BaconReader got Reddit's default of about 200 comments, and the rest hid behind "load more comments", often for one
  or two replies.
- A post now asks for up to 500 comments, and the "load more comments" with few replies load on their own, right
  after the post's comments.

**Settings** (BaconReader → Settings → Patches, under "Comments"):
- **Comments to load** (500 by default): how many comments a post asks for when it opens, from 200 to 500. Fewer load
  faster on slow connections.
- **Auto-load "load more comments"** (Up to 2 replies by default): loads the "load more comments" with up to this many
  replies on their own: "Off", "1 reply", or "Up to 2 replies" to "Up to 5 replies".
