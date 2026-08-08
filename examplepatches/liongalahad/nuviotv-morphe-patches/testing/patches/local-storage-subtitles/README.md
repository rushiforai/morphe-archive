# Allow Importing Subs from Local Storage

Patch ID: `local-storage-subtitles`. Target: official NuvioTV `0.8.2-beta`.

This ExoPlayer/Media3-only patch appears in `Morphe > Subtitles` as `Allow Importing Subs from Local Storage`. It adds `Local Storage` immediately after `None` in the playback subtitle language rail. Its subtitle list begins with the non-selectable `Choose subtitle file` action, which opens Android's system document picker while leaving the subtitle overlay underneath. Imported rows show the detected language as their main label and the exact source filename as the muted secondary label.

The importer accepts SRT, VTT/WebVTT, ASS/SSA, TTML, and DFXP documents up to 10 MB. It uses the document picker instead of requesting broad storage access, copies the selected document into private app storage, and never modifies the original. After the picker closes, the menu immediately redraws in `Local Storage` with the new file row selected, then hands it to ExoPlayer once playback has regained focus. The file row owns the tick, and `Choose subtitle file` can never remain selected.

The selected file is stored against the current movie or exact season/episode and restored when that playback is reopened. Each selection or restoration refreshes its last-used time. Imports that have not been used for seven days are deleted from private storage during a later app start, together with their patch-private selection record. Nothing is sent to Nuvio sync.

Language detection prioritizes metadata declared inside TTML or ASS-family files and then conservative filename language tokens. Accessibility tokens such as `SDH` are not treated as language codes; for example, `(SDH)` does not become Southern Kurdish, while `(eng-hi)` resolves to English. Files without reliable evidence display `Unknown language`. Imported files remain normal Media3 subtitle sources, so Nuvio's subtitle delay and style controls continue to apply. If installed and enabled, `Remove SDH Annotations` transforms their emitted Media3 cues, and `Mark SDH Subtitles` uses explicit accessibility metadata for any language or bounded content sampling for English files.

The patch deliberately omits MPV: `Local Storage` is hidden while MPV is active and local files are never handed to the MPV path. Imported choices are excluded from Nuvio's own addon-subtitle preference and use only the patch's private device state.
