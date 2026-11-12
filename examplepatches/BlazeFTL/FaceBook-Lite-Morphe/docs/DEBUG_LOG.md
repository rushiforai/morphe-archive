# Debug log

Morphe settings (long-press the app icon) > **Debug logging** on. Use the app for a minute: scroll the feed, Reels
and Marketplace, play a few videos, tap download on one. Then **Save log to Downloads** and send the file.

The log is `Android/data/com.facebook.lite/files/morphe-debug.log` (older part: `morphe-debug.1.log`). It holds
on-screen text of feed items and video file addresses without their signatures. Check it before sharing.

| Tag | What it shows |
| --- | --- |
| `activity` / `ads ACTIVITY` | Which screen is in front. Marketplace may be another activity. |
| `ads DECODE` | Each new chain of server container ids, with sponsored-label hits. Finds Marketplace's container. |
| `ads FEED` | Feed post groups hidden by the rule, and `MISSED` groups that have a label but were not hidden. |
| `ads PAGER` | Every list on screen, one line per item, plus `SPONSORED-TEXT` paths and `DEEP` field dumps. |
| `ads TREE` / `WEBVIEW` | View hierarchy of the front screen; web page address and sponsored labels. |
| `reels` | Current reel changes (`JUMP` = more than one at a time), `ON SCREEN` tree of the current reel, classification, `SKIP`, `HIDE`. |
| `ads AD VIDEO` | Ad videos (props JSON has `adid`), the item they belong to, and what was hidden. |
| `story` / `ads IMAGE` | Story photo search: large views and picture addresses found. |
| `cover` | Download button or short video controls hidden or allowed again because a large list that is not the video's (the comment sheet) is drawn over them, `Outside layer ... not treated as cover` (what was on top that did not count), and the window's top layers whenever they change (`LAYERS changed`). |
| `doubletap` | Double tap to seek: zones on for which video, off, covered or uncovered. |
| `controls` | Seek bar and 10 s buttons for short videos: which of the app's own controls were found (`Native controls: back=... play=... forward=... seek=...`), `Corner views` (every small view in the bottom right of the reel, at lookup and again when paused, with id name, clickable, showing: finds the speaker and the 3 dot button), shown for which video, hidden, covered or uncovered. |
| `listcheck` | Small container 30001 lists (empty screens such as "No reels yet") and any list where the patch hid something: children, texts, hidden flags. Tells a server-empty list from one emptied by the patch. |
| `profile` | "Skip creator's Reels page" and "Open profile when no reels": the empty Reels page found, where the 3 dot button was tapped (a view, or the fallback position), whether the "View main profile" sheet was seen, the row tap, and 2.5 s later every list on screen with its texts (to find the profile's Reels tab). Then the profile's Reels tab tap (`Profile open, tapping its Reels tab`) or `No Reels tab row found`. |
| `probe` / `video` | Where each video's sources are, DASH manifest tracks, the options offered on download. |

What the findings so far mean is in [RESEARCH.md](RESEARCH.md).
