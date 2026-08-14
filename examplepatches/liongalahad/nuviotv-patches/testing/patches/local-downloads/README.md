# Local Downloads

Patch ID: `local-downloads`.

This optional Playback patch adds direct progressive movie and episode downloads through Nuvio's existing manual source picker. It is independent of `local-media`: either patch may be enabled alone. Both use the neutral `playback.local_storage.path` preference through generic storage-path infrastructure, so there is one shared location without either patch owning the setting.

Downloads and automatic local playback default off. `Maximum usable internal storage` defaults to 80% and uses the same native slider behavior as Nuvio's Layout controls. Its positions are 1%, then 5% increments through 100%. The row and every download-progress popup show internal storage as one-decimal used/total GB with the percentage full.

Playback shows `Local Downloads` before `Local Media`, followed by one unsectioned `Local storage path` row at the bottom. The path row is installed whenever either storage-consuming patch is installed and is greyed and unfocusable only while both feature toggles are off.

Completed files are indexed by exact catalogue content/video identity. Signed source URLs and headers are held only for the active foreground transfer and are never persisted. Partial files use a `.partial` suffix and are removed on cancellation or failure.

The final `Downloads` row opens a scrollable list of entries owned by this patch. Rows have TV-sized separation and a high-contrast focus outline. Pressing an entry plays it immediately; holding it opens one native two-button `Play local file` / `Delete local file` action card. Duplicate TV long-press callbacks are coalesced, so one Back press always dismisses the popup. Individual deletion removes the indexed video and its downloaded sidecars; `Delete all downloads` iterates only the index and never removes files copied manually by the user. The settings count and list reconcile against readable video files whenever they open or resume, so deletion through Library > Storage or an external file manager disappears immediately. An unreadable entry remains privately indexed so a temporarily disconnected USB drive can recover when reconnected.

Supported sources are direct HTTP(S) progressive files. Torrent, YouTube, HLS and DASH selections are deliberately rejected because copying those transports as one movie file would produce invalid or incomplete media.

Movie downloads use a sanitized title folder. Series episodes use `Title - Season n`, such as `Silo - Season 3`. Addon subtitles are retrieved after the video succeeds, filtered to Nuvio's preferred primary and secondary subtitle languages, and saved beside it as `<video-base>.<language>[.<n>].<extension>`. Subtitle failures do not discard a completed video.

Downloaded episodes carry a circular arrow-down badge in the top-right corner, mirrored against Nuvio's watched tick inset. Long-pressing a downloaded movie or episode replaces the download action with `Play local file` and `Delete local file`. Confirmed deletion removes the indexed video and downloaded subtitle sidecars, removes an empty download folder, and refreshes visible badges immediately. Download mode remains active across repeated source choices in one picker session and clears only after the picker is left.

When downloads are enabled, movie detail pages also place a native-sized arrow-down action immediately to the right of Watched. The undownloaded state uses Nuvio's dark action background and white icon; the downloaded state uses the same selected white background and dark icon as Watched. The native action control supplies the same D-pad focus enlargement as its neighbours. Pressing it opens a patch-owned TV popup: an undownloaded movie offers `Download to storage` and hands off to the existing source picker, while a downloaded movie offers `Play local file` and `Delete local file`. Movie detail lookup uses the stable catalogue content id instead of a source-specific video id, with a title fallback for older indexed movie downloads.

Episode transfer notifications and progress, failure, cancellation and completion popups identify the exact item as `Title · SnnEnn`, for example `House of the Dragon · S02E01`. Movie transfers continue to use the movie title alone.
