# Android parity and imported Morphe functionality

Updated for published build133 on 2026-11-16. `tools/parity.json` contains 199 entries:
**195 done, 4 not applicable and 0 TODO**. This records functional Android
implementation, including supported platform adaptations. It does not claim
runtime coverage for every physical device, account, server layout or setting
combination. [Build133 is published](release-build133.md); its public feed and
anonymous bundle download checksum are verified.

The bundle has **127 public patches and 104 defaults**: 41 Afterglow/compatibility
patches and 86 original Morphe features. The reuse boundary is the pinned Morphe
2.0.0 source/runtime in [`vendor/morphe`](../vendor/morphe/README.md), with selection
recorded in [`morphe-catalog.json`](../tools/morphe-catalog.json). Original code
remains in its own packages and its settings are available through **Additional
features**. The download interface is the user's explicit exception: Afterglow
owns the sheet, queue and Vault. Its resolver may reuse compatible stream
transport; the original Morphe Downloads patch is excluded. Theme Studio and
its native theme adapters also remain Afterglow-owned.

## Overlap and final ownership

| Afterglow key | Reused functionality | Afterglow scope and evidence |
| --- | --- | --- |
| `copyVideoInfo` | Original **Copy text** remains selected and supplies title/comment copying; build118 verifies title copying. | The separate native Description-header action copies the complete title or raw description. Build131 verifies both in another app, including a 61-line description with complete URLs, OFF/ON, scroll dismissal and native Close. Build132 verifies icon density and placement. |
| `commentManager` | Original **Copy text** and **Search comments** remain integrated. | The exact mounted comment owns the Afterglow action sheet. Build132 copies native body text, saves a visually checked 1080×503 rendered row and supplies identical PNG bytes through a cross-app clipboard grant. Selecting a different comment copies its distinct text. |
| `postManager` | Original **Download post images** retains its save/GIF implementation; **Translate posts** retains its translation behavior. | Build132 verifies Unicode text copying, a 1080×1428 rendered-post Save/Copy pair with identical bytes, and selected-image clipboard copies following two carousel selections through Morphe's resolver. Build131 separately verifies the original menu saving two decodable 1122×1402 JPEGs. The native image viewer/Close remains available. |
| `saveProfilePhoto` | The imported post-image feature excludes avatars; it does not supply avatar save/copy. | Exact native image source/ready/unmount ownership is implemented. Build129 verifies the hold sheet, correct 1024×1024 saved PNG, identical cross-app clipboard PNG and preserved ordinary native channel tap. |
| `nativeShare` | Afterglow adapts the original ShareEntity/ShareEndpoint implementation; the duplicate original export is hidden. | Build109/110 verifies native panel → Android chooser → native panel, the exact watch URL, dismissal and reopening. Other entity types remain coverage, not a missing chooser implementation. |
| `fixAlbums` | Afterglow reuses the original image-URL boundary, limited to the two exact iOS `yt3` → `yt4` hosts. | Policy tests and image-render smoke pass. A genuinely region-blocked network fixture remains untested; no second image rewrite is needed. |
| `copyWithTimestamp` | Original **Copy video link** supplies explicit overlay buttons. | Afterglow's distinct native Pause callback copies the current URL/time; build109/110 verifies that interaction. Both policies remain available. |
| `miniplayer` | Optional original **Miniplayer** supplies layout/gesture controls. | Afterglow's complementary made-for-kids playback adapter is implemented and runtime verified. A layout patch does not replace that behavior. |
| `playlistOldMinibar` | The Android native alternate layout is retained. | The coherent 18-read gate, early preference bootstrap and guarded process latch are implemented. Restart/playback pass. The observed OFF baseline already used the original resource layout, so no floating-to-old visual transition is claimed. |

The excluded build109 title-copy experiment is historical. Its failed interaction
is not evidence against the original Morphe **Copy text** implementation or the
completed native Description-header action. They have separate owners and proof.

Two similarly named controls also remain distinct: Afterglow
`hideShortsSubscriptions` controls the subscription carousel **inside the paused
Shorts player**. Morphe's `morphe_hide_shorts_subscriptions` controls Shorts shelves
**in the Subscriptions feed**. Afterglow now has the exact native source32 command
and mounted-component adapter; it does not hide an arbitrary paused host. Actual
visibility still requires an account/session supplying that carousel.

## Reconciliation of the former 64 TODO entries

The earlier build123 audit grouped 64 stale or incomplete ledger entries. All
now describe implemented Android behavior, with runtime limits kept separately.

| Former group / entries | Current implementation and evidence | Remaining coverage |
| --- | --- | --- |
| Four long-press keys (4) | Description, comment, post and avatar actions have the build129/131/132 results above. Original Morphe text and post-image behavior remains integrated. | Alternate layouts, interrupted ownership changes and physical devices. |
| `hideShortsSubscriptions` (1) | Exact paused-player command ownership and mounted native binding; parser, policy, DEX and strict application checks pass. | The signed-out fixture has no subscription carousel. |
| `miniplayer`, `nativeShare`, `copyWithTimestamp`, `fixAlbums`, `playlistOldMinibar` (5) | Existing implemented owners and build109/110 runtime proof retained with the specific limits above. | Additional entities, blocked-region and alternate-layout fixtures. |
| Eleven `theme_glow*` keys and `destination.glowLab` (12) | Shared glow policy and native tab/player/scrubber/track adapters are implemented. Android16 preview, tabs, portrait/fullscreen controls and resets were exercised. | Additional Shorts/live/promo surfaces; exact Apple blur rasterization is not an Android implementation gate. |
| Typography and tab-label keys (5) | Native TextView/layout/span/font-registry adapters, 43 pinned font assets and non-compounding size/weight/style policy are implemented. Settings, tabs, player, feed and comment text were exercised. | Additional text surfaces; Android family substitutes are intentional. Optional original **Custom font** remains separate. |
| Animated/gradient/red progress and scrubber size (4) | Native track/scrubber drawing, image/motion/size and reset controls are implemented; portrait/fullscreen playback and seeking were exercised. | Additional server-driven player surfaces. |
| `destination.themeStudio` (1) | Presets, private drafts, saved library, transfer, contrast helpers and native gradients remain implemented. Build125 verifies buffered color, ordinary/live scrubber switching and restoration on returning to VOD. | Additional roles/device/layout combinations; no absent editor or buffered/live implementation. |
| Download preferences/routing and Vault (12) | Afterglow owns explicit format/audio/caption selection, resolver, durable queue, bounded HTTPS transfer, assembly, imports and library/file operations. Media exports decode; a large transfer resumes across restart/upgrade and completes in the background. | Account availability and the full format/language/network matrix. Preserve this explicit exception to Morphe reuse. |
| Lite Mode and tab layout/anchors (5) | Native commands, two rows, centered anchors and temporary Lite Mode profile are implemented. Build124 proves Posts navigation, Home return and preserved row height after mini-player dismissal; later checks cover startup and preference restoration. | Other accounts and unsupported native destinations remain unavailable. |
| Startup animation, older UI and text direction (3) | Verified startup gates, original Morphe supported-version policy and native LTR text adapters are implemented without changing navigation locale. | Startup-reason comparisons, mixed-direction text and server layout variants. |
| `controlsSheetButton` (1) | Premium controls transport, seek, persistent speed, mute, restart, Next and lock are implemented. Builds126/127 verify stable-volume agreement and correct cold first-open state. Build133 adds the missing optional Lite-owner gate; 74 actual session checks preserve saved ON/OFF values when the owner is absent. | Unsupported streams and physical devices. Build133 verifies the installed Lite control toggles ON/OFF and restores OFF. |
| `commentsHeaderMode` (1) | Default/Hidden/Pinned modes implemented. Build125 proves sort chips stay visible while actual comment body content scrolls; native close remains intact. | Additional comment layouts. |
| Overlay reset, Control Center, AB Lab and AI Home (4) | Real destinations, reset, queue/library summaries, typed native experiment overrides/profiles/recovery and prompt persistence are implemented. Native AI dispatch uses only the current Home style26 custom-feed command. | AI feed execution requires the server-provided command; the prompt library is verified independently. Additional experiment lifecycles remain QA. |
| Diagnostic categories (6) | Existing logger, player/PiP events and Firehose remain; download/extractor/Premium events and their category routing are implemented. The routing regression has 101 passing checks. | Native-network Firehose, PiP activation and other event fixtures. |

The group counts total 64. The four not-applicable entries are the iOS-only
floating keyboard and stock volume HUD, plus the floating-tab-bar and Shorts-logo
surfaces absent from Android YouTube21.43. These are not unimplemented controls.

## Frozen source, package and runtime boundary

Build133 records 1,806 source/provenance input hashes. Strict application and APK
assembly pass for default104, independent8, all127 and longpress-only3. Its
434 dependency objects are acyclic and six selectable options retain the original
Option objects. Settings ownership/default/reset checks pass 540/540. The
integrated source, resources and accessible license notices retain attribution.

Only `PremiumControls.java` and `PremiumControlsSheet.java` differ from build132;
the other 1,804 inputs are unchanged. The Lite Mode control is disabled and its
action refuses preference writes when the optional owner is absent. Both saved
ON/OFF cases are included in 74 actual Premium-session checks. Fresh 51 watch DEX
checks and 540 settings checks also pass. Final smoke on the exact133 APK passes
playback, dislikes, installed Lite ON/OFF and the resolved six-action download
sheet, with matching installed APK hash and an empty crash buffer. The
build129/131/132 runtime evidence below keeps its original labels.

Exact-root hardware rendering fixes the former software-canvas/hardware-bitmap
failure. A tall post in build132 yields a 1080×1618 PNG from roughly 734 visible
pixels: its mounted author, body and full image extend beyond the viewport in the
output. Unmounted native footer controls remain blank. This is mounted-content
capture, not reconstruction of absent native content. The ordinary rendered
comment/post Save and Copy pairs include their tested full rows.

Physical devices, account login, casting and every optional runtime combination
remain unverified. Host GLES passes Description copying on the unchanged APK;
the emulator software renderer terminated the Windows qemu process with an
access violation, without an Android app fatal exception or ANR in the streamed
logs. The comparison does not prove the emulator failure's root cause. Image
clipboard tests isolate the emulator from Windows host synchronization, which
otherwise replaces URI-only clips with empty `host clipboard` text. Cross-app
PNG reads pass with that QA bridge disabled and no production workaround.

## Evidence

- [Port validation](afterglow-port-validation.md) records the current runtime matrix.
- [Downloads and Vault](afterglow-downloads.md), [long-press capture](long-press-tools.md),
  [avatar/selected-image copying](avatar-photos.md), [Description actions](description-header.md),
  [seekbar colors](seekbar-theme-completion.md), [native tabs](native-tabs.md) and
  [Premium controls](premium-controls.md) retain implementation and test details.
- `~/.cache/ytafterglow-android/afterglow-vault-20261116/` contains source133,
  strict133 reports, focused-check input hashes and the individual build119–132
  runtime/media evidence. `bundle-131-qa/native-runtime/result.json` records
  Description and original JPEG downloading; build132's corresponding report
  records comment/post/selected-image captures and the explicit tall-row limit.
- [Build110](release-build110.md) and [build118](release-build118.md) are historical
  runtime/release evidence. Older `complete:false` observation collections are
  cited only for reviewed individual flows, never as blanket acceptance.
- The read-only `ios-reference` snapshot in the same cache supplies the behavior
  spec. Generated preference descriptions alone were not treated as proof.

The shared ledger/catalog remain owned by the release coordinator. This audit
reconciles implementation and evidence without claiming publication or replacing
an existing Morphe feature with a duplicate port.
