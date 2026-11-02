# MySpoti patches for Morphe

Community-maintained patches for the MySpoti Android app, built with the [Morphe patching framework](https://github.com/MorpheApp). This repository combines the Spotify branding resource patch with export, storage, local-first playback, playlist/album, lyrics, and reinstall-restore patches for MySpoti stable 2.3.0.

## Add this repository to Morphe

[**➕ Add MySpoti patches to Morphe**](https://morphe.software/add-source?github=amit-0i/myspoti-morphe-patches)

You can also add the repository manually in Morphe using:
`https://github.com/amit-0i/myspoti-morphe-patches`

## Available patches

<!-- PATCHES_START EXPANDED -->
> **[v1.3.1](https://github.com/amit-0i/myspoti-morphe-patches/releases/tag/v1.3.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 MySpoti&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 2.3.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [MySpoti Export & Storage](#myspoti-export-storage) | Adds Export & storage to Settings > Downloads in MySpoti 2.3.0 in both Classic and Immersive looks, matching MySpoti's Immersive glass, grouped surfaces and selected accent; includes local-first playback for downloaded tracks, tagged audio exports, offline lyrics resolution/cache, portable LRC and JSON lyrics, embedded lyrics, playlist/album M3U8 manifests, reinstall restoration into native Downloads and lyrics caches, shared track files and offline storage migration. |  |
| [Spotify branding](#spotify-branding) | Renames MySpoti to Spotify and replaces every launcher, themed, supporter-preview, splash, widget, and notification mark with Spotify branding. |  |

</details>

<details open>
<summary>📦 MySpoti&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Spotify branding](#spotify-branding) | Renames MySpoti to Spotify and replaces every launcher, themed, supporter-preview, splash, widget, and notification mark with Spotify branding. |  |

</details>

<!-- PATCHES_END -->

## Spotify branding

The resource-only branding patch renames MySpoti to Spotify and applies consistent Spotify mark geometry to launcher icon variants, themed/monochrome icons, in-app previews, splash art, widget art, and notification artwork. It does not change the app package name, sign-in, playback, or download behavior.

Supported package variants:

- `app.myspoti`
- `app.myspoti.stable`

## MySpoti Export & Storage

The export/storage bytecode and resource patch adds **Settings → Downloads → Export & storage** to MySpoti APK in both Classic and Immersive looks. It also makes downloaded-track selection local-first, and depends on the bundled Android extension.

Features:

- **Local-first playback:** Selecting a track that is already downloaded plays from the encrypted file on device, even while online and even when the rest of its playlist is not downloaded. The local queue contains the downloaded songs from that list in its existing order; selecting a song without a local copy keeps the normal online/audio-source path.

- **Offline audio export:** Decrypt MySpoti's offline audio and export playable MP3, FLAC, or M4A without re-encoding.
- **Metadata and artwork:** Preserve title, artist, album, duration, and embedded cover art.
- **Lyrics:** Reuse MySpoti's lyrics resolver; cache supported lyrics for offline playback and export full JSON plus `.lrc` files in `Lyrics/JSON/` and `Lyrics/LRC/`, with embedded lyric tags where supported.
- **Export sync:** Maintain a portable index keyed by full stable track IDs, skip existing files, and repair missing exports. The Auto-sync songs, playlists & albums switch is **off by default**; when enabled, native download and collection-index updates trigger background syncs as each song finishes downloading or a playlist/album is created or changed.
- **Deletion sync:** A separate **off-by-default** option can remove exported song files and lyrics sidecars when those downloads are removed from MySpoti. With this option off, exported songs are retained even when they are removed from MySpoti.
- **Playlist and album export:** Write M3U8 manifests for downloaded collections while storing one physical audio file per track.
- **Native Downloads restore:** After reinstall, reconnect the same export folder and restore previously exported songs into MySpoti's native Downloads library using the new installation's encryption key.
- **Storage migration:** Move the app's offline store between Android-supported app-managed internal/external storage locations.
- **Look-aware UI:** In Classic, keep the existing dark tools screen and green action. In Immersive, show an iOS-style glass action in the Downloads top bar and use MySpoti's own black canvas, raised grouped surfaces, fine separators, white/secondary typography, and the selected Immersive accent (default pink) throughout the export, restore, and storage screens.

### Backup and reinstall notes

The progress dialog's **Run in background** action dismisses the dialog while the current app-process worker continues The **Stop sync** action takes effect after the current song finishes backingup.

The export folder and portable index live outside MySpoti's private app data. Android revokes Storage Access Framework permissions on uninstall, so select the same user-visible folder again after reinstall. Only songs successfully exported before uninstall can be restored. The archive does not restore songs that were never exported.

The live MySpoti offline playback root must be a normal filesystem path. The storage-location selector therefore uses Android-supported app-managed volumes; arbitrary SAF folders are supported as export/backup destinations, not as the active playback root.

Lyrics availability depends on MySpoti's resolver returning a complete result. LRC files preserve line timing; word-level timing remains in the native cache and portable JSON. Third-party players must support LRC files in a separate folder or embedded lyric metadata to display lyrics.

## Credits, trademarks, and disclaimer

- **Morphe** — patching framework and build tooling.
- **Morphe Patches Template** — initial project structure.
- **MySpoti** — original Android application and offline/lyrics implementation; source: <https://github.com/kota-zo/myspoti>.

Spotify and its logo are trademarks of their respective owner and are used only to describe this independent branding customization. This project is not affiliated with, endorsed by, or officially associated with Spotify, MySpoti, or Morphe. See `LICENSE` and `NOTICE` for license details.
