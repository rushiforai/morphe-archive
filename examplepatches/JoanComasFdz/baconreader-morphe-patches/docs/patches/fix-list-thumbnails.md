<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: FixListThumbnailsTests -->

# Fix list thumbnails

The post list shows its thumbnails again, finds the missing ones, and blurs NSFW and spoiler thumbnails.

- Thumbnails that stayed empty load again: Reddit's address for them reached Reddit garbled, and Reddit refused it. A
  thumbnail that fails to load is asked for again.
- Posts that had no thumbnail get one: a link post from its preview, its embed or its YouTube video, a RedGIFs post
  from RedGIFs, and a crosspost of a gallery from the gallery's first image.
- A crosspost of a gallery shows BaconReader's gallery indicator, in the list and in the post's header.
- In the Card View, a gallery and its crossposts show the gallery's first image in their cards.
- Spoiler thumbnails are blurred, and so are NSFW ones while BaconReader's "Show NSFW images" (Settings → Filters) is
  off.

No settings.

**Limits**:
- The blur needs Android 12 or later. On older versions, NSFW and spoiler posts keep BaconReader's own icon.
