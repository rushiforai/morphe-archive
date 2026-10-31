# Research notes: ads, video and stories in Facebook Lite 530.0.0.8.106

English notes from the debug-log rounds of October 2026. The older Vietnamese [HANDOFF.md](HANDOFF.md) covers fonts and the first
sponsored-post work. Everything here is for `530.0.0.8.106`; obfuscated names change with every build. A new chat should read this
file first, then ask for a fresh debug log ([DEBUG_LOG.md](DEBUG_LOG.md)).

## 1. How the app builds screens

- Every screen is a server-driven **component tree** (`X.0gp` nodes, `X.0gw` containers, `X.0hT`/`X.0hW` text, children from
  `X.0gn.AF0()`). The root is `0h5#30005`, its list container is `0gw#30001`. Feed, Reels and Marketplace all use these ids.
- A list on screen is an `X.0zb` (a RecyclerView). `A05` is its layout, `A05.A0E` the item list (class `X.0yV`, **no `toArray`**, read by
  index), `A05.A03` the current index, `A07.A02` the snap mode (0 = feed, 1 = Reels), `A08` the snap handler (`A04(index)` scrolls).
- An item (`X.0z8`) holds its component tree at `A0B.A03`. In the Home feed each item **is** one child of container 30001, so hiding a
  post means flagging that child hidden (`A2c`) and giving it height 0 (`A0i`).
- Component fields used: `A1b` id, `A0v` group, `A0i` height, `A29` width, `A2c` hidden, `A18` parent, `A2X`/`A2k` markers, `A32` flag on
  text, `A1V` a `HashMap` some nodes hold. Text is read with `AIW()`; it has style markup (a backslash plus one character) and control
  characters, which `FeedItems.clean` strips.
- Videos are native `com.facebook.lite.widget.video.FbVideoView` (obfuscated subclass `X.1Kt`), children of the list view.
- The app has very few Views. Home feed list is `1080x1991`, Reels list `1080x2093` (snap mode 1), Marketplace list `1080x1989`.
- Lists change while read: never iterate them live (`ConcurrentModificationException`), never call `toArray` on them.

## 2. Reels

- The Reels list holds, besides reels (`X.0gw`, 50 to 60 nodes with creator, Follow, caption), **placeholder items** of 1 node
  (`X.0hT`, `X.0hW`, `X.0nH`) that are not snappable. A swipe jumps over them, so the current index moves by 2 to 3 without any patch
  involved. Not every `JUMP` in the log is a bug.
- Layout of the Reels list seen in the 2026-10-22 logs, e.g. 32 items: reels (`X.0gw`, snappable), then a **pair of non-snappable
  1-node items** (`X.0hT`, `X.0hW` with one flagged text) every 4 to 5 reels, more reels, one 29-node unbound `X.0gw`, then
  **loading shells** at the end (`X.0hT` and `X.0nH`, 1 node, snappable). The list grows by 8 items per load, and a load usually
  comes right after a swipe. Every `JUMP +3` in the logs (2->5, 6->9, 9->12, ...) is the app's own snap logic stepping over such a
  pair; no patch is involved. The pairs may be ad slots that stay empty until an ad is available (unverified: no ad was seen).
- Items are rebound by the server's index updates: the tree at an index can change while the item object stays.
- Some reel-sized trees have 29 nodes and no text at all (seen at indices 5, 20, 25, 30, 35 of one session). They may be unbound reels or
  sponsored reels; unknown. The old rule cached "organic" for any tree it saw first, so a placeholder that later held an ad was never
  re-checked. Fixed: an organic verdict is kept only for trees of 40+ nodes.
- User observation (unverified): sponsored reels seem to be inserted right after the reel being watched, while watching.
- No sponsored reel appeared in the logs of 2026-10-22, so the text rule (two flagged text nodes) is untested in this build. The ad
  video mark in section 4 is the planned certain signal.

## 3. Video sources and quality

- `FbVideoView.A0F` is the props (`X.0t0`): `A0Y` the **DASH manifest XML** (all quality steps), `A0c` the progressive SD file (360p,
  tag `xpv_progressive...sve_sd`), `A0b` the video id, `A0a` a tracking JSON. `A0F.A03` (`X.0y5`) repeats them (`A07` manifest, `A09` JSON,
  `A0A` id, `A0B` SD url). The full-screen player has the same in its command object (`A05`).
- Manifests list 144p to 1080p, but the video is almost always **AV1** (`av01...`), sometimes VP9, with **xHE-AAC** audio
  (`mp4a.40.42`). Only a few videos also have H.264 (`dash_baseline`). The old joiner only accepted H.264 + AAC, hence "only 360p".
- `MediaMuxer` cannot write AV1/VP9/xHE-AAC into MP4 before Android 14. `Mp4Remux` reads plain or fragmented MP4 tracks and writes one
  MP4 by copying samples (sample tables rebuilt, `stsd` copied). Tested with ffmpeg-made AV1, VP9 and H.264 (B-frames, plain and
  fragmented): every packet identical, decodes clean. H.264 + AAC still uses `MediaMuxer`.
- Codec mix over about 100 videos in the logs: AV1 about 65, VP9 about 25, H.264 only 2 (720p High 2540 kbps + 360p). Facebook's own
  quality menu may offer a 720p that is not AV1; if so it is not in `A0Y`. `ObjectScan` now also pulls addresses out of the video's
  settings JSON (`props.A03.A07`), and the probe logs that JSON's keys, to find an H.264 or HD progressive file there.
- Facebook Lite's data for this device (27 more videos in the 2026-10-22 17:2x log): 20 AV1-only, 7 VP9-only, **no H.264 DASH at all**;
  progressive files are 360p only (`sve_sd`, `progressive_h264-basic-gen2_360p`). The settings JSON (`props.A03.A07`) has a key
  `is_progressive_hd_url` whose value is not yet known (the probe now logs short JSON values). So a non-AV1 720p is not offered here.
- xHE-AAC (the only sound with AV1/VP9) did not play or sounded broken in MX Player and another player. The SD file carries the same sound as
  plain AAC, so for xHE-AAC the SD file is downloaded too and its sound track (checked with `Mp4Remux.audioObjectType`: 2, 5 or 29) is
  joined with the HD picture. If the SD sound is not AAC the xHE-AAC track stays.
- The quality sheet shows `Owner · Type`; a card at the top of the screen (and a notification when allowed) shows the file name and
  progress of the download (`DownloadProgress`).
- File names: `Owner-Type-d MMM_yyyy.mp4`. Owner is the first name-like text of the item tree (Reels: the current item; others: the item
  whose tree refers to the video's props). Type is Reel (video in a snapping list), Story (video fills the window outside a list), else Video.

## 3a. The reel list's "current index" is not reliable (found in the 2026-10-23 log)

- `A05.A03` (the layout's current index) is **not updated when the server reorders the list while a reel is watched**. Example: viewer on
  "Roshni Dahal" at index 18; a list update (33 to 42 items) put an ad ("Aarong Dairy", flaggedText=2) at index 18 and moved Roshni to
  16, while `A03` stayed 18. The skip then scrolled from 18 to 19, over two real reels. This is the "auto scroll when an ad loads while
  I am watching" and "1-2 real reels skipped" the user reported. Same cause for a wrong owner name taken from `A03` after a list update.
- Reliable index of what is on screen: the adapter position of the most visible child view of the list
  (`RecyclerView.getChildAdapterPosition`). `SponsoredReels.shownIndex` and `AutoNextReel` (position of the video's own item view) use it;
  `DESYNC` lines in the log show when the two differ. File names read the owner from the item of the video's own view, with a search by
  props as a fallback, and log the owner the old way for comparison.
- With "Hide sponsored reels" on, the hide (tree height 0) made the pager jump (`JUMP 19 -> 17`, "Unhid a reel", `HIDE reel 18` again,
  repeating), because items move between indices while their trees stay. Keep it off.
- Reel ad seen in this log: tree `X.0gw` ~49 nodes, **two flagged texts**, an advertiser name text without "Follow" (organic reels
  have name, "Follow" or "Subscribe", caption). So the old text rule does match this ad.

## 3b. Reel skipping rules (after the 2026-10-22 reports)

- Reported: the pager sometimes scrolled by itself when a sponsored reel loaded while another was watched, and 1 to 2 real reels
  were skipped. The skip now waits until, for 1.1 s, the current index, the tree at that index and the list size have not changed and
  the pager is idle (`getScrollState() == 0`), moves exactly one reel in the direction the user came from, and refuses when that
  reel is itself sponsored or not snappable. Auto next reel ignores videos not on screen and targets more than two reels away.
  Whether this is enough is unknown; look at the `reels` lines (`SKIP`, `JUMP`, `ON SCREEN`) of the next log.

## 3c. File names in the opened player and in stories (2026-10-23 logs)

- The player opened from a post (header "Reels" with a back arrow, a 5 to 10 item list, comment bar at the bottom) lists the item's texts as
  `Add a comment... | Mr Barishal Bd | (icon) | Follow | caption`. The Reels tab lists `Mr Barishal Bd | • | Follow | (icon) | caption`.
  The old "first name-like text" rule therefore named files `Add a comment...-Reel-...`. `getChildAdapterPosition` returned -1 in most
  of these lists, so the search by the video's props was what found the tree. Rule now: the name-like text just before "Follow" (or
  "Subscribe", "Join"), else the first name-like text; placeholders ("Add a comment", "Send message", ...) and age texts (`4h`) are never names.
- A story has no list. Its screen is recognised by `com.facebook.lite.widget.ProgressBarView` (a 4 px bar at the top; absent from the feed, Reels
  and the full screen player in these logs). The header is small app views (`X.1Hi`): the name (about 54 px high) above a second line
  (about 41 px high: the age `4h`, or `Sponsored`, which is 151 px wide in the ad). `Stories` reads their texts by value (component texts through
  `AIW`, string fields, depth 3, no parent link) and logs every header view and the texts found (`story` tag, "Header:" lines). Whether the
  texts are reachable from those views is **not verified**: if the file name is still `Facebook-Story-...`, read the "Header:" lines.
- Sponsored story seen: one progress segment (1030 px), header `Vibe: Magnetic Men's Society` / `Sponsored`, a photo (no video), caption,
  `Shop now`, round prev/next arrows (63x74 views at mid height on both edges). The download button was shown on it. Now: the header label (or
  `{"adid"` in a story video's tracking text) hides the button and taps the next arrow (setting "Skip sponsored stories", on by default).

## 4. Ads

- **Ad video mark**: the tracking JSON of an ad video starts `{"adid":"1202...","qid":...`; organic videos start `{"qid":...,"mf_story_key":...`.
  Seen on a Marketplace video (a booking.com ad; tapping it opened `FBLiteBrowserLiteInMainProcessActivity`, WebView `X.1qB`). This is
  language independent. `AdVideos` checks every FbVideoView child of every list, finds the item whose tree refers to the props (or to
  its JSON or id), and hides the card (non-paging lists) or marks the reel sponsored (Reels).
- **Marketplace layout** (log of 2026-10-22 17:2x, confirmed by screenshot): the Marketplace list is an `X.0zb` whose children are
  **views**, not direct videos: listing rows are `X.2oP` containers of 536x616 cards (`X.0j6`); an **ad block** is a separate list item
  (`X.2oP 1080x737`, tree `X.0gw` with 66 nodes) holding two advertiser header cells (name + "**Ad**" label + menu) and two ad cards (one a
  nested carousel `X.0zb 538x538`, one a `FbVideoView 536x536`). The label is the text **"Ad"** (in the feed it is "Sponsored"). The
  item tree's texts read: `Booking.com | Ad | ... | TOPPER Kitchen... | Ad`. Because the video sits inside a card view, a scan of the
  list's direct children never saw it. Fix: label rule at decode time (`SponsoredPosts.hide`: any child of container 30001 with a
  sponsored label text and a height under 1800 px is flagged hidden with height 0, like feed posts), and `AdVideos` now looks at
  video views at any depth and maps the item with `getChildAdapterPosition`. Not verified on a device yet.
- Text is stored with markup, e.g. `\\<SOH><ENQ>Ad\\1`; compare only after `clean()` (this is why `sponsoredLabel` was always false before).
- Ad tracking JSON (`props.A0a`) of the ad video: keys start `adid, qid, mf_story_key, is_sponsored, ...`; organic ones lack `adid` and
  `is_sponsored`.
- Feed rule (older, kept): a group header with `A2X && A2k` and references (`A0M`), hides the group. The log lines `FEED HIDDEN by rule,
  but no label found` (nodes=2) show it also hides small non-labelled groups; check for false positives.
- Text fallback: a "Sponsored" label in about 30 languages is logged (`SPONSORED-TEXT`) but not used to hide anything.

## 5. Stories

- A story video is a fullscreen `FbVideoView 1080x2211` directly under a FrameLayout, with a small `X.0zb 1080x121` beside it (not the
  Reels list). A story photo shows **no** video and only that small list among the interesting views. Where the photo address lives is
  unknown. `StoryPhotos` searches the large views by value for CDN picture addresses and logs every candidate (`story` tag); `ads IMAGE`
  lines list picture addresses found in stand-alone component trees. Next step: read those lines.

## 6. Download button

- Offered only for Reels (video in the snapping list), the full screen player (`FBFullScreenVideoView`) and stories (video of at least 75% of
  the window height outside a list). Not for videos playing inline while the feed scrolls. Bug found on 2026-10-23: `FeedItems.isPager`
  returned false until the list class had been resolved by something else, so `StoryPhotos` did not see the Home feed list and showed the button
  on feed photos. Fixed, and the photo size floor raised to 600x1000.
- Second bug of 2026-10-23: `FeedItems.resolve` was given the class loader of whatever view was asked about; framework views have a null loader,
  so the lookup of the list class failed once and stayed failed: every video then counted as a Story with no owner. It now always uses the extension's own
  loader.
- Owner names for inline feed videos were wrong (`Go to Reels` was the first text of the item tree); only Reels have been verified.

- Positioned on the video's own bounds by translation, updated every frame (`postOnAnimation`). The old version used the clipped visible
  rectangle, so the button slid down from the top while a Reel slid in.
- A story photo uses the same button, downloading to `Pictures/Facebook Lite`.

## 7. Debugging method

- Debug logging switch in Morphe settings; `Save log to Downloads`. `adb` and `logcat` are not needed (ColorOS hides app logs).
- Compile check without Gradle: JDK 21 with `java -m jdk.compiler/com.sun.tools.javac.Main -cp android.jar ...` (android.jar from the
  Sable/android-platforms repo), extensions compile on their own; stubs for `X.*` are in `extensions/hideads/stub`.
- `Mp4Remux` tests: ffmpeg (pip `imageio-ffmpeg`) makes AV1/VP9/H.264 + AAC test tracks; compare `ffmpeg -c copy -f framecrc` of the inputs and the output.

## 8. Open questions

1. Does hiding by `A2c` and `A0i = 0` after layout (not at decode time) really close the gap in Marketplace and in Reels (hide mode)?
   Look for `AD VIDEO hiding` and `HIDE reel` lines, then ask the user what they saw.
2. Reel ads: do they carry `adid` in the video props, and when does the next reel's video view attach (before it becomes current)?
3. Where is a story photo's address? Does `Stories` read the owner name from the header views (see 3c)?
4. What are the 29-node empty reel trees?
5. Do AV1 + xHE-AAC files play in the user's players?

## 9. Sponsored reels removed at decode time (after the 2026-10-26 report)

- Report: swiping or auto next sometimes lands 2 to 3 reels ahead instead of going over one sponsored reel. Cause: the old skip worked on
  items already in the pager (unsnappable flag set up to 500 ms late, then a programmatic scroll), so a stale flag or a late scroll moved
  over real reels. Hushfacebook (full Facebook) avoids this by filtering a page before the list holds it.
- Lite cannot delete a child (the server updates by index), so `ReelAds` collapses the reel instead (A2c hidden, A0i 0, A2z false) right after
  the props of the reel are decoded (`SponsoredPosts.afterDecode` -> `ReelAds.afterDecode`). The Reels list container is learned from the pager
  scan (`ReelAds.learn`: parent of the items' trees), so the feed and Marketplace are never touched. Rule unchanged: 2+ flagged text nodes (A32),
  not next to another detection, not more than 35% of a list. Re-evaluated at every decode event of the reel and undone when it is not sponsored.
- `SponsoredReels` no longer caches verdicts per tree (items are rebound) and no longer has a hide mode; it stays as the fallback.
- Log lines to read: `REELS LIST learned`, `DECODE-REMOVE`, `DECODE-RESTORE`, `DECODE detection ... ignored`.
- Open: does the tree of a reel have the Reels container as its direct parent (the `learned` line shows the container id and class)?
  Stories: Hushfacebook neuters the ad bucket sources of full Facebook's story viewer; the Lite story data path is not known yet.

### 9a. First log of the decode-time removal (2026-10-26 01:00-01:45)

- `REELS LIST learned: container id 30001, tree X.0hT/X.0hW`: the item trees' parent is the Reels list container, as assumed.
- The ad reels at 29 and 37 were collapsed (`treeHeight=0 treeHidden=true snappable=false`) and passed natively: `JUMP 28 -> 32` is the ad
  plus two empty ready-made items (the app's own non-snappable pairs, 1 node, height 0), not real reels. No SKIP line was needed.
- The `JUMP n -> n+3` lines with no `S` in the list are the same empty pairs, not skipped reels.
- Ad at 6: the viewer had already landed on an empty ready-made item (items at the end of the list are snappable shells) 125 ms before
  the server filled it with the ad, so it was current and blank until SKIP (1.1 s settle + up to 500 ms tick = 1.5 s). Now: `SponsoredReels.nudge()`
  scans 40 ms and 330 ms after a collapse, and a collapsed reel settles after 250 ms.
- `DECODE-RESTORE` then `DECODE-REMOVE` 1 ms apart (a reel decoded in place with fewer than 2 marked texts for a moment): a reel is only
  restored once it has at least 40 nodes, or when its detection was refused.
- Stories: the log (exported 01:54:39) has no sponsored story (all `sponsored=false`); the screenshot (01:55:22) shows one, with the download
  button already visible, so the "Sponsored" label is bound a little after the picture. Scan interval on a story screen 500 -> 100 ms,
  skip cooldown 1500 -> 1000 ms, the skip line logs how long the header was on screen. To find a data-layer hook for stories, export the
  log right after a sponsored story (Debug logging on): look for `ads DECODE chain` lines with `sponsoredLabel=true`.

## 10. Story ads without a progress bar, and reel skips from a stale index (log 2026-10-27 17:2x and earlier the same day)

- Sponsored story not skipped: none of the story screens in the log has a `ProgressBarView` (the 15:04 one had a 121x4 view), so `Stories.read`
  returned null and neither the skip nor the hidden download button ran, although the header view `X.1Hi 151x41` ("Sponsored") was on screen
  (`ads TREE` at 17:21:16 and 17:21:31). A story screen is now also recognised by its two full-height tap zones (views 40% and 60% of the window
  width, 432x2211 and 648x2211 on 1080 wide). The header band without a bar is the top 20% of the window. `story Header:` lines show `via=bar` or `via=tap zones`.
- Reel scrolled "2 videos ahead" while watching: every `SKIP` in the log came right after a list update (`LIST changed`, items 42 -> 46, 16 -> 26) that put an ad
  at the index the app still called current (`A05.A03` is stale after a reorder, see 3a). `shownIndex` was -1 or stale then, so the skip used the app index and
  moved the pager from the reel being watched over the ad to the next reel (`SKIP 21 -> 22`, viewer was on 20; `SKIP 9 -> 10`, viewer was on 7). Now a skip needs
  `shownIndex >= 0` and `shownIndex == A03`, and 1.1 s without any list size change. Look for `SKIP refused: reel on screen not verified`.
- Auto next reel never fired in that log (no `Reel ended` line).
