# Devices sync through the book folder (Syncthing on home Wi-Fi); eppy only offers the other device's position

The user listens on a phone and a tablet and wants each to pick up where the other left off. SABP already keeps a book's playback position (`position.sabp.dat`), bookmarks and character notes as files in the book folder. So a folder-sync app that keeps the library folder the same on both devices (Syncthing-Fork, home Wi-Fi only, global discovery and relays off) carries all of it, along with the audio and the PC transcript files. eppy has no network code for this, and nothing about the user leaves the house.

SABP 11.7.8 reads `position.sabp.dat` only when a book is new to its library (`BookData` constructor from the library scan). For a book it already knows, it never reads the file again, and it overwrites the file with its own position on every pause and every 2 minutes during playback. Bookmarks are re-read from `bookmarks.sabp.xml` each time they're shown. So eppy's whole part is the **other device's position**: when a book is opened or eppy returns to the foreground, read `position.sabp.dat`. If the other device wrote it (its last-played stamp isn't the one this device last saved, which a hook on SABP's writer records) and the position is more than 30 s away, offer a jump to that file and time (only the place, not speed or equaliser). It never jumps without asking. It ships as a separate Morphe patch, so a device that doesn't sync doesn't get it.

## Considered Options

- **eppy uploads progress to a cloud (Google Drive API or similar).** Works away from home, but adds network code, a sign-in, and data held by a third party. That conflicts with the "nothing leaves" rule.
- **Self-hosted server (Audiobookshelf-style).** Far more to build and run than this needs.
- **Manual export/import of a progress file.** Not automatic, which the user asked for.
- **Syncthing over the internet (global discovery and relays).** Syncs away from home too, but device IDs and IP addresses reach public servers. The user switches devices at home, so home Wi-Fi is enough.
- **Sync only the small files and keep copying audio by hand.** Playback positions and transcripts are only valid against the same audio files, so syncing the audio too guarantees they match, and it ends the hand copying.
- **Jump automatically to the newer position.** A late sync could then move the listener without warning. An offer can't lose anything.

## Consequences

- Sync only happens while both devices are on home Wi-Fi with Syncthing running. Switching away from home shows the old position until they meet again.
- If both devices change the same book's bookmarks before a sync, the newer `bookmarks.sabp.xml` wins. The other one is kept as a Syncthing `.sync-conflict` file, and eppy doesn't merge them.
- SABP's listening statistics (`!Smart AudioBook Player Statistics/`) are written by both devices, so they're excluded with `.stignore` and stay per device.
- Reading `position.sabp.dat` depends on SABP's `BookDataBackup` class and its field names (`mFileName`, `mFilePosition`, `mLastPlaybackTime`). A new SABP version is checked for that like every other hook.
- Comparing last-played times doesn't work: SABP stamps a book's `mLastPlaybackTime` with "now" when it's opened (`BookData.P0` from `PlayerService.z0`) and while it plays, so this device always looks newer. Telling the writer by the saved stamp also ignores clock differences between the devices.
- Transcripts made on a device and the read-along settings stay on that device. Only files in the book folder travel.
- eppy's Sync screen (v0.16.2) reports what the book folder holds and whether Syncthing is installed (via the
  manifest's `<queries>`). With an API key the user pastes, it also reads paired devices and folder state from
  Syncthing's REST API on 127.0.0.1 only, pinning Syncthing's self-signed certificate on first use. Pairing itself
  stays in Syncthing's app.
