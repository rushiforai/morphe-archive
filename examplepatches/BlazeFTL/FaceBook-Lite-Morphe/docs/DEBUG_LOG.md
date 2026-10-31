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
| `probe` / `video` | Where each video's sources are, DASH manifest tracks, the options offered on download. |

What the findings so far mean is in [RESEARCH.md](RESEARCH.md).
