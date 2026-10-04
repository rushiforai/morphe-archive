# Download (TikTok 47.1.4)

How the app decides whether a download is allowed and whether the file is watermarked, and what this
patch does about it.

## The app decides with one object

`com.ss.android.ugc.aweme.feed.model.ACLCommonShare` carries the whole decision:

| Getter | Carries |
|---|---|
| `getCode()` | the restriction on downloading |
| `getShowType()` | how the download entry is offered |
| `getTranscode()` | whether the file is watermarked on its way out |

All three are real-named on a real-named class, which makes them the cheapest anchors this bundle
has. Answering them is the whole patch: the app then offers its own row and downloads the file
itself, with its own progress and filename, for every kind of content.

## Where the approach comes from

It is the one ReVanced's TikTok download patch uses (patch `tiktok/interaction/downloads` at
https://gitlab.com/ReVanced/revanced-patches, GPLv3): `getCode()` answered 0, `getShowType()` answered
2, and `getTranscode()` answered 1. That patch targets 36.5.4; all three getters are still present,
still real-named, and still two instructions each on 47.1.4, which was checked before adopting it.

See **Credits** below for the full attribution.

## Anchors

| Anchor | Matched on |
|---|---|
| `ACLCommonShare#getCode()` | real-named getter, `() -> int` |
| `ACLCommonShare#getShowType()` | real-named getter, `() -> int` |
| `ACLCommonShare#getTranscode()` | real-named getter, `() -> int` |
| `Video#getDownloadAddr()` | real-named getter on the real-named model |

## What the patch does

1. **`getCode()`** answers 0 while the feature is on, which lifts the download restriction.
2. **`getShowType()`** answers 2, which is the unrestricted way the entry is offered.
3. **`getTranscode()`** answers 1 while the no-watermark part is on, which is the flag the app reads
   as "leave the file alone".
4. **`Video#getDownloadAddr()`** is redirected to the highest quality playback variant the item
   carries, so the file the app fetches is the best one it has rather than the watermarked address.

The first three are the reference approach; the fourth is this bundle's addition, and its log line
(`download: N variant(s), best X bps`) says whether the item carried variants at all.

Both the fourth and this section were written before the feature was ever run on a device. **Read
[Measured on a device](#measured-on-a-device-build-b38-4714-and-what-it-changed) before trusting either**:
the measurements contradict what is written above, and the fourth hook is now believed to be replacing
the app's own better address with a lower one.

## Two approaches that were tried first, and lost

Recorded because both looked reasonable and both were wrong.

**Hooking the share sheet's download handler.** The row is contributed by
`AwemePhotoDownloadShareAbilityHandler`, and a video never gets it. Widening that handler's
availability gate and advertised content types produced nothing: the log showed the gate was never
asked, because a sheet is built from a `ShareConfiguration` chosen per package and a video's
configuration has no download in it at all. The photo post's configuration
(`AwemePhotoDownloadShareConfiguration`) is the one that overrides the protocols carrying the row.

**Borrowing the photo configuration's protocols in the video's configuration.** This did put a row on
screen, and the extension then fetched the file itself. It failed on three counts: the fetch could
not tell which of the app's addresses were watermarked, so the saved file still had one; the bitrate
variants were not where they were expected, so the file was ordinary quality; and the handler's
action is a Kotlin suspend function the sheet also uses while it assembles itself, so returning early
from it left the panel with a third of its rows.

The lesson is the one the reference implementation already embodied: do not rebuild the app's
download, and do not answer a question the app answers elsewhere.

## Measured on a device (build b38, 47.1.4), and what it changed

The version of this document written before a device was involved said two things that the measurements
did not support, and both are corrected here rather than quietly replaced.

**`downloadNoWatermarkAddr` is above the feed's ceiling, not on it.** The app prefers this address for a
save (`X.19k8#LIZ` reads it first and tags the result `tag_no_water`), and it wins the weighing every
time. The files it produced:

| Saved file | Dimensions | Bitrate |
|---|---|---|
| `f3b87ede….mp4` | **1080×1080** | 30.0 Mbps |
| `3f13c54d….mp4` | 1024×576 | 0.50 Mbps |

So the source of quality in this feature is not the bitrate variants at all. It is the address the app
was already reaching for and the patch was overwriting. This is why the Tweaks row speaks of "the
variants this feed carries": that is still true of what the patch picks from, but the app's own
unwatermarked address is the one that decides the result.

**Files come out at half the source's frame rate.** Three items, compared against the same items fetched
by a third-party downloader:

| | Patched | Original |
|---|---|---|
| 1 | 1350×1080 @30fps | 1350×1080 **@60fps** |
| 2 | 768×576 @30fps | 1440×1080 **@60fps** |
| 3 | 1080×1400 @30fps | 2169×2800 **@60fps** |

Every file was 30fps where the source was 60fps, and item 3 also came out at a different resolution and
aspect ratio. Halving the frame rate while also rescaling is what a transcode looks like, not a wrong
address: a wrong address would still carry its own frame rate, and it would be one of the sizes already
in the list below. This is **not fixed** and it is **not diagnosed**.

The suspect is `ACLCommonShare#getTranscode()`, which this patch answers `1`, the value ReVanced uses,
read there as "leave the file alone". In this app's own download path (`X.0Vyf`) the value 1 leads into
the branch that does file processing, so it may mean the opposite of what it means elsewhere. A switch
answering 2 instead was built and measured against this; the test did not settle it before the change
was reverted, so the question is left open rather than answered. It is the first thing to try.

**Also corrected:** the raw-bitrate log once read `rawBitRate/-1` for every variant. `BitRate` carries no
dimension of its own, and `qualityOf()` was falling through to the playback address's `UrlModel`, whose
`width` the app leaves unset. Read literally, an unset width became the class −1, so no playback variant
could ever win. The current build does not have this fix; it is noted here because the log line quoted
in **Still open** below is from the build that did.

## Still open

- **The frame rate is halved and item 3 is also rescaled** (see above). Cause unknown, most likely
  `getTranscode()`. Until it is resolved, a saved file is a transcode of the source rather than the source.
- Best quality picks the highest quality class by the gear name (`original_*` first, then the class),
  not by the bitrate field, which is not trustworthy: an original variant of one item reported
  87 Mbps, and a variant with the field unset would have been skipped. The log prints every variant
  it saw, so the item's ceiling is visible (`download: 9 variant(s), best adapt_lower_720_1/720 of
  [...]`).
- `downloadNoWatermarkAddr` is weighed against `downloadAddr` and the bitrate variants, and wins on
  these items. `miscDownloadAddrs`, a JSON map the server sends, read per share platform, whose
  `suffix_scene` entry the app falls back to (`X.19k8#LIZIZ` ops 75-82), is still unread.
- Some items carry no variants at all (`no bitrate variants on the video`), and the app's own address
  is used for those.
- The download feature as a whole has **not** been verified as correct on a device: the entries above
  were measured, the behaviour they contradict was not.

## Credits

The three ACL hooks this patch is built on are adapted from **ReVanced Patches** (GPLv3),
<https://gitlab.com/ReVanced/revanced-patches>, patch `tiktok/interaction/downloads`. The values it
answers them with are that project's; this bundle adds the `Video#getDownloadAddr()` redirect to the
highest quality variant, the settings switches, and the hooks that lift the restriction per surface.
This bundle is GPLv3, the same licence, so the reuse is permitted and the credit above is a courtesy
rather than a licence condition.
