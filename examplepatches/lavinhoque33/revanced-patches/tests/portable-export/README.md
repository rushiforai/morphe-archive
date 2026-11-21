# Portable export

- **YouTube single file:** enable **Built-in downloader** and **Replace Downloads page**. Open the fork's library from **You → Downloads**, then long-press a saved audio or video row and choose **Export file**. Export is available only for published MediaStore downloads (Android 10+); old app-specific files and stock offline downloads are not offered.
- **YouTube playlist:** open the same library's toolbar overflow → **Export playlist** and choose a previously confirmed playlist download. New playlist download confirmations keep the playlist's order, so this works offline. Use **Find playlist by link** for older downloads that predate this metadata: an internet connection is needed only for playlist order, never to fetch the files again.
- **YouTube Music single file or playlist:** use **ReVanced settings → Miscellaneous → Downloads → Export device files**, then choose **Export file** or **Export playlist**. The chooser includes only RVX-published Device files and saved native Device files playlists/albums such as the derived loose-track collection, regardless of the current Download method. It does not list unrelated device audio or private stream copies. This action is not installed on forced Music versions below 7.25.

Choose a writable folder in the Android file picker, or explicitly select **Use previous folder** when its persisted grant is still available. Each export is a copy. A playlist creates a uniquely named folder containing media and an ordered UTF-8 M3U8 with relative paths. Entries that repeat refer to the same copied file. Existing files are never replaced. A cancelled or failed copy removes its incomplete output when the provider allows it and leaves completed copies in place. If the provider prevents cleanup, the dialog reports it. If a destination becomes read-only, unavailable or revoked, choose a folder again; this starts a new copy rather than modifying or deleting the previous output.

Keep the app open for long exports. The serial copy runs off the UI thread without a separate service or activity. It does not resume after force-stop or process death.

## Host regression commands

From the patch worktree:

```sh
./gradlew :extensions:shared:testDebugUnitTest \
  --tests 'app.morphe.extension.shared.downloads.PortableExportTest' \
  --tests 'app.morphe.extension.youtube.patches.general.offline.OfflinePlaylist*Test'
./gradlew :patches:buildAndroid --no-daemon
```

The fixture covers duplicate names and repeated exports, missing-source results and ordered M3U8 output, and failure/cancellation that removes only the new partial file. It rejects any seekable read/write mode on destination files.

## Device checks

Use patched test builds with YouTube's built-in downloader and Music's Downloads patch included. On the rooted Moto, route installation and device automation through the designated device agent. Use two distinct test files with the same display title, at least one long file, a native playlist/album and a scratch SAF folder.

1. Export one item and one playlist from each app using the routes above. Check the original still plays, compare copied bytes, and open the playlist in an M3U8-capable player to confirm relative paths and order. Repeat into the same folder and confirm the first exports are intact. Switch the Music download method and confirm the same Device files remain exportable while stream-only copies are not listed.
2. Restart the app and use **Use previous folder**; then revoke the test grant or unmount a disposable destination and confirm the action offers a new folder, not false success. Try a document provider that streams writes via a pipe (or a removable SAF volume); verify completion after receiving the full bytes.
3. Cancel during the second item of a playlist. Verify the first item remains, the incomplete second item is removed, no completed M3U8 is claimed, and the originals and an older export remain untouched. Remove a source after selecting a playlist or fail the destination mid-copy and verify the appropriate partial status and cleanup.
4. In YouTube confirm a recorded playlist exports while offline and an older link-based lookup needs connectivity only for its order. On a forced Music 6.20 patch run confirm the existing unsupported-version warning and no Export device files action.
