# Afterglow download and destination port validation

This is the published [build133 checkpoint](release-build133.md). Build133
has 1,806 hashed production/provenance inputs and a functional Android ledger of
195 done / 4 not applicable / 0 TODO. The release manifest and public source feed
identify which snapshot has been published. A successful patch application
establishes compatibility with the stock APK; the runtime results below come
from an Android 16 emulator running YouTube 21.43.523.

## Implementations

Afterglow owns the six-action download sheet, durable queue, Vault, Control
Center, Theme Studio, experiment profiles and recovery, AI Home prompt library,
native tab layout, and Premium controls. Original Morphe Return YouTube Dislike,
DeArrow, Copy text, post-image/GIF downloading, GmsCore and stream compatibility
remain integrated. The original Morphe Downloads interface is replaced by
Afterglow's owner. See [the catalog](morphe-catalog.md) for the complete mapping.

The combined catalog has 127 public patches and 104 defaults: 41 Afterglow
patches and 86 original Morphe features. Selecting a patch installs its feature;
individual runtime preferences retain their own defaults.

## Verified runtime flows

| Area | Observed result |
| --- | --- |
| Download entry | Both the native watch Download action and Afterglow player button open Video, Audio, Captions, Thumbnail, Details and Open In. |
| Saved video and audio | An adaptive H.264/AAC video and AAC audio download, assemble, open in the owned player and export. Both exported files pass full decode checks. |
| Long download | A four-hour 720p video retains paused partial data across restart and APK upgrade, resumes, finishes in the background and exports a 428,436,160-byte MP4. A complete decode of the export succeeds. |
| Other media | English WebVTT and a 320×180 thumbnail download and export. Caption language/translation and multiple audio-language choices are exposed by the current resolver. |
| Vault | Search, combined filters, favorites, collections, owned audio/video/caption viewers, generic-MIME caption import, rename, sharing and scan/repair work. |
| Native tabs | Posts opens the actual native feed; Home returns correctly. Two-row containers retain their height after the mini-player closes. Centered anchors and Afterglow's Control Center destination work. |
| Lite Mode and startup | Lite Mode cold-starts with Home, Subscriptions, You and Afterglow. External video links still open their video. Turning Lite Mode off restores the saved startup destination. |
| Premium controls | Cold first-open correctly reports playback and stable-volume state. Pause/play, restart, next, mute, seek, speed and lock behavior are exercised. A selected 2× rate survives pause/play, and the native clock confirms the rate. Stable-volume OFF/ON agrees with YouTube's native menu. |
| Theme Studio | Imported theme colors render on the played/buffered timeline and ordinary scrubber. An actual live stream uses the live scrubber color; returning to a VOD restores the ordinary color. Reset restores YouTube colors. Existing editor, preset and transfer checkpoints remain documented separately. |
| Comments header | Pinned mode keeps Top/Topics/Newest visible while the comment body scrolls. Native panel close behavior remains available. |
| AB Lab | Typed native experiment collection, profiles, export and crash-safe recovery are exercised. A cold settings launch completes the pending revision verification after its observation interval. |
| AI Home Studio | A named prompt is saved, favorited, exported, deleted, imported and retained across restart with its exact text and favorite state. |
| Profile photos | Holding the watch avatar opens Save/Copy actions. Saving produces the correct 1024×1024 PNG; another app reads the copied image URI and obtains the identical PNG. An ordinary tap still opens the native channel. |
| Description copying | Build131's separate Copy button copies the complete native title and full raw description into another app. The tested description has 61 lines and retains complete URLs where the native panel shortens them. OFF removes the button; ON restores exactly one. Scrolling hides it and native Close still works. Build132 verifies the corrected icon density and placement beside Close. |
| Rendered comments | Build132 opens the exact comment sheet, copies the native text and saves a visually checked 1080×503 PNG containing avatar, author, pinned label, complete body and native controls. Another app reads identical PNG bytes from the clipboard URI. Selecting a different comment copies that comment's distinct text. |
| Rendered posts | Build132 copies exact Unicode post text and saves a visually checked 1080×1428 PNG with author/avatar, body, current photo/carousel edge and native controls. Cross-app clipboard bytes match the saved PNG. |
| Selected post image | Build132 copies the current carousel image through the original Morphe resolver. After a native horizontal swipe it copies the newly selected image; both 960×1008 PNGs decode and visually match their respective selections, with distinct hashes. The native image viewer and Close remain available outside the post-body manager. |
| Original post downloads | Build131's original Morphe native post menu downloads both images from a carousel. Both saved 1122×1402 JPEGs decode successfully. The original feature remains enabled and owns this download action. |

The Bonus tabs switch follows the iOS editor's existing behavior: turning it off
trims the saved order to the ordinary six-tab limit. Turning it back on increases
the limit; it does not restore discarded overflow entries. Lite Mode separately
preserves the saved tab configuration.

## Source and package checks

Candidate133 is a complete frozen workspace snapshot with 1,806 hashed inputs.
Strict patching and APK assembly pass with the 104 default patches, independent8,
all 127 patches, and an independent three-patch selection containing Long-press
tools, GmsCore and stream spoofing. The actual bundle graph has 434 acyclic
dependency objects and six original Option instances forwarded to the selectable
wrappers. The original upstream resources and notices are retained. Settings
ownership, visibility, defaults and reset checks pass 540/540.

The only production changes from build132 are `PremiumControls.java` and
`PremiumControlsSheet.java`; the other 1,804 inputs are unchanged. The Premium
sheet disables its Lite control when the optional Lite Mode patch is absent,
and the action leaves either saved ON or OFF preference intact. The actual
Premium-session suite passes 74 checks, including both missing-owner cases;
51 actual watch DEX checks and a fresh 540-setting run also pass. The runtime
rows retain their original build129/131/132 labels. The exact build133 APK passes
playback (native clock 5 to 13 seconds), dislike display, installed Lite ON/OFF
and the resolved six-action download sheet. Its installed hash matches the signed
candidate and the crash buffer is empty. Earlier runs are not relabeled as
whole-build133 runtime acceptance.

Focused checks cover queue/index recovery, bounded ranged transfers, stream
identity, media formats, download progress controls, native tab commands,
startup policies, theme colors, experiment/prompt persistence, diagnostics,
text direction, comment headers and Shorts subscription commands. Regressions
also exercise the actual download manager's temporary-file ownership and verify
that generated watch-action bridges contain real DEX catch handlers. Input
hashes tie each retained result to its tested source.

## Published-source consumer check

The public feed points to build133, and an anonymous bundle download matches its
recorded SHA-256. Manager 2.6 refreshes the existing Afterglow source to 127 patches
and successfully applies the 104 defaults to the same hash-verified stock APK.
Its saved 239,549,401-byte output passes ZIP integrity and Android v2 signature
verification. The privately signed runtime-tested APK and its Vault data remain
installed; the Manager-signed output is retained locally as a separate artifact.

## Remaining coverage limits

Physical devices, account login, casting and every optional setting combination
are unverified. AI Home execution requires YouTube to supply its native custom
feed command; the signed-out fixture supplies no such command. The local prompt
library is verified, but a generated native AI feed is not. The paused Shorts
subscription carousel also needs an account/session that actually supplies it;
its parser and exact native command bindings have source/DEX tests.

Build132 corrects the earlier software-canvas/hardware-bitmap capture failure
with bounded exact-root hardware rendering before the exact-window fallback.
The tall-post fixture produces a 1080×1618 PNG from roughly 734 visible pixels of
the post: the mounted author, body and full photo extend beyond the viewport in
the result. Native footer controls were unmounted and remain blank. This is
verified mounted-content capture, not a complete reconstruction of an unseen
logical row. Hardware capture took 22 ms for that fixture; this is one observed
latency, not a guaranteed timeout or performance result for every device.
Alternate comment/post layouts and interrupted capture remain additional QA.

Description-header runtime checks pass on the unchanged candidate131 APK with
the emulator's host GLES renderer. Its software renderer repeatedly terminated
the Windows qemu process with an access violation when Copy was pressed; turning
off Vulkan alone did not resolve it. Streamed logs contain no Android app fatal
exception or ANR for that failure. The renderer comparison establishes the
successful test configuration, not a proven root cause inside the emulator.

Image clipboard validation isolates the Android emulator from its Windows host
clipboard synchronization. The initial receiving app saw an empty text clip with
the emulator's `host clipboard` label. With that test-environment bridge disabled,
the same unmodified APK supplies `image/png`, a working temporary URI grant, and
the exact saved image bytes. This setup also verifies the comment, rendered-post
and selected-image clipboard paths. No production clipboard workaround was added.

Evidence is retained under
`~/.cache/ytafterglow-android/afterglow-vault-20261116/`, including the frozen
source manifests, strict verification directories, focused-check input hashes,
individual runtime captures, media probe results and full decode logs. Some
runtime `result.json` files are observation collections with `complete:false`;
only the specific reviewed flows above are reported as passing.
