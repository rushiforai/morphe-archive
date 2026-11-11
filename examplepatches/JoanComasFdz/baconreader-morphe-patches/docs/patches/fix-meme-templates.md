<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: FixMemeTemplatesTests -->

# Fix meme templates

The drawing screen's meme templates load again, with Imgflip's 100 most used ones.

- In the drawing screen ("Attach media" → "Draw", then "Camera" → "Memes"), the template grid shows Imgflip's 100 most
  used meme templates. BaconReader's own templates were on its server, which no longer has them.
- A tapped template is downloaded at full size, up to 1440 pixels wide, while "Loading template…" shows, and becomes
  the drawing's background.
- When a template can't be downloaded, "Could not load the full template" shows and the grid stays open.

No settings.
