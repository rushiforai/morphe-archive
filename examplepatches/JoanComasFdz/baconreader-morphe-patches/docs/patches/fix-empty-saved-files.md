<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: FixEmptySavedFilesTests -->

# Fix empty saved files

Saving a post's media to the device no longer leaves an empty file next to the saved one.

- "Save to device" saves only the media's own file, such as "dancing.gif". BaconReader first made an empty file named
  after the post with ".jpg", then saved the media in a second file, and left the empty one behind for every media
  that isn't a JPEG.

No settings.
