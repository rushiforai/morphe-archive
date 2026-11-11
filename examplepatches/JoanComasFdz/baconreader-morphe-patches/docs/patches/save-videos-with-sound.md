<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->
<!-- scenarios: SaveVideosWithSoundTests -->

# Save videos with sound

Reddit videos saved with "Save to device" keep their sound.

- Reddit keeps a video's sound in a separate file, and BaconReader saved only the picture. After the save, the patch
  downloads the sound and puts it in the saved file, without changing the picture's quality.
- A video without sound is saved as it is.

No settings.

**Limits**:
- Only Reddit's own videos (v.redd.it). GIFs and videos from other sites are saved as before.
