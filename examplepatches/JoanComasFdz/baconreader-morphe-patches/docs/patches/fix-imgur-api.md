<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: FixImgurApiTests -->

# Fix Imgur API

Imgur albums and galleries open again, and images you attach to comments and posts upload again.

- Imgur albums and gallery posts load again. BaconReader asked Imgur through a service that now refuses every request;
  the patch asks Imgur itself.
- In an album, still images show as images and videos play as videos. BaconReader took each still image Imgur sends
  for a video it couldn't play.
- Images you attach or draw in a comment or a post upload to Imgur again: Imgur refused them as BaconReader sent them.

No settings.
