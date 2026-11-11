# v1.10.7-dev.10 — playback return, ranking chooser and drawer gestures

Development-only candidate built on v1.10.7-dev.9. No stable release, tag, or issue-state changes.

- Serialize legacy PlaybackReturn and the direct-background PopupReturn path so a notification-to-normal playback return cannot independently launch two VideoViews.
- Keep the original retained VideoView through ordinary app switches, including the previous metadata and foreground keeper safeguards.
- In Add Tab, place Ranking immediately under Search. Selecting it opens the native ranking genre/period chooser; choosing a ranking opens the usual list, allowing the existing tab manager to capture the specific genre/period.
- Add fourteen opt-in gesture assignments for the native left drawer: ranking, Shorts, video ID dialog, device history, device playlists, cache, My Page, account history, mylists, Watch Later, following, Nico Reports, settings and restart.
- Keep the original gesture mappings, installed tab labels, menu dispatch handlers and tab cap unchanged.

CI checks source mapping, smali hooks, helper DEX and packaged MPP identity. The supplied Android 16 reproduction additionally requires device verification; a green CI is not evidence the video surface bug is resolved.
