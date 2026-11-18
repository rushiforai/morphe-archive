# Long-press tools

Owner: `long-press-tools` / **Long-press tools**, from `tools/tweaks.json`.
All five iOS preferences default to `false`. The timestamp action is implemented
and has recorded emulator proof. Original Morphe **Copy text** is now imported
separately; its title-copy action passed the build118 clipboard check. It also
owns native comment text copying. The failed build109 experiment below is a
different, excluded adaptation and does not describe the imported original.

The comment and post action sheets have build132 emulator proof for exact text
copying, full-image saving and cross-app PNG copying. A second comment copies its
full body despite a collapsed native preview, and the post's current-image action
follows the carousel selection. Broader interaction coverage remains pending.
Description-header and avatar actions have separate implementations and
validation. The [parity audit](morphe-parity-audit.md) separates Android
implementation coverage from the remaining runtime matrix.

## Timestamped links

Despite its feature-group name, iOS `YTAfterglow.x:2358` implements an ordinary
Pause-button press, after the original `didPressPause:`. It copies
`https://www.youtube.com/watch?v=<video ID>&t=<whole elapsed seconds>s` and does
not add a toast. This Android implementation follows that interaction and URL
format. Android may show its own system clipboard feedback.

The stock YouTube 21.43.523 binding is:

- `Lokb.<init>` installs `Loka` with discriminator 2 as the native
  `player_control_play_pause_replay_button` click listener.
- `Loka.onClick` reads `Lokb.i:Larrs` / `Larrs.a:Larrr`.
  `Larrr.b` is PLAYING, and that branch calls `Larrt.a()` at code offset
  `0x028e`, immediately followed by return. The PAUSED branch uses `Larrt.b()`.
- `Larrt.a()` checks its native `c:Z` readiness field, then calls the native
  pause command `Lassj.c()`.
- The patch inserts the extension callback immediately after that single UI
  pause call. It does not hook the common pause command, playback-state updates,
  automatic pauses, the Play branch, or the Replay branch.

`LongPressTools.pauseClicked` checks the installed owner and current setting on
every call. It also checks native readiness, foreground watch ownership, ad and
Shorts state, a valid video ID and known native time. It reads the ID and time
from the existing current-director `VideoState` bridge, rather than keeping a
second playback cache. Missing inputs preserve the existing clipboard. Clipboard
service failures are logged through `Afterglow.error` and do not propagate into
the native click handler.

Integration: the named tweak depends on
`app.afterglow.patches.menus.longPressToolsHookPatch`, which depends on
`videoStatePatch` only. The named tweak must mark `long-press-tools` installed.
`copyWithTimestamp` is the validated key in this group. The experimental
`longPressTextHookPatch` must not be registered as a dependency until its native
interaction works and passes runtime validation.

## Comment capture sheet

`longPressCaptureHookPatch` adds the unique iOS comment sheet: hold the comment
for 300 ms, then choose **Copy comment text**, **Save comment as image**, or
**Copy comment as image**. It checks the installed `long-press-tools` owner and
live `commentManager` value, whose default remains OFF. Existing native and
original Morphe click/long-click listeners are never reassigned. Short taps,
scrolls, ambiguous roots and disabled preferences retain native dispatch. An
exact, enabled avatar binding takes priority over a comment/post capture hold.

One stock 21.43.523 renderer supplies an explicit root lifecycle: `Lwuv.b(View)` constructs a
new `WeakReference` in `Lwuv.A`; `Lwuw.b` retains that exact token, and `Lwuw.a()`
returns its native view. A real `Larar` factory passes the created `Lhit` root to
this setter, and `Lhit` extends `ComponentHost`. Build128 proves that this root
is optional in the active Comments renderer. The mounted-text bridge described
under Validation instead uses the exact source component and native bind
generation; the root-token route remains available where the native root exists.
The original Morphe semantic text hooks
supply legacy and cached modern text. The first `Lvuq.k` result in `Lvuz.L`
supplies fresh modern body text, before the separate auxiliary text branch.
The observer returns the original text unchanged; it never forces a renderer
flag or replaces the native text and spans.

Capture requires one observed comment body in the root and exactly one current
mounted text occurrence. Build124 logs confirm that different comments share
the same template hash; it is never treated as a per-comment ID. Multiple body
values in one binding, repeated mounted bodies, mixed surfaces, stale bindings,
recycled text, and unmarked shared-prefix matches are rejected. Ordinary
author/date/like-count metadata within the comment tree remains valid. Explicit ellipsis
recovery requires a sufficiently long prefix and a separated optional label.
The delayed hold rechecks the exact binding, entry object, text, attachment,
focus and screen position. A successful sheet cancels the native child gesture
before its ordinary long-click timeout. The image is drawn from this exact root
against its native background, with bounded dimensions and pixel count.
When native hardware-backed images reject a software canvas, Android 29+ uses
an owned `RenderNode` and `HardwareRenderer` to render the complete mounted root
into an `ImageReader`. Readback produces an independent ARGB_8888 bitmap before
the hardware image/buffer are released. This supports a tall mounted item whose
full bounds extend beyond the visible viewport, without changing native layout,
scroll position, layers or mount policies. It cannot reconstruct unmounted
content and rejects external `SurfaceView`, `TextureView` and `WebView` trees.

If offscreen rendering is unavailable, `PixelCopy` may copy only the complete,
fully visible root from its exact activity window. The fallback checks the
window/decor/token and unchanged bounds, native bind generation and mounted
text before accepting the asynchronous result. New touches, cancellation,
movement, recycling, live OFF or loss of focus invalidate it. A canceled
destination is recycled after PixelCopy finishes writing. Partially visible
roots never become falsely labeled full-item window crops.

Both paths enforce 8192 pixels per side and an 8-megapixel total. Hardware
render/readback is synchronous and has no cancellable platform deadline;
sanitized elapsed-time diagnostics support runtime latency review. Only newly
owned rendering resources are destroyed. If no safe image is available, verified
text and independently proven current-image actions remain usable, while the
whole-item image rows are disabled with an explicit explanation.

`LongPressImageProvider` performs PNG encoding off the main thread. Copying uses
a read-only, nonexported provider with temporary URI grants; saving publishes a
completed image to `Pictures/Afterglow` through MediaStore on Android 10+.
Failed writes remove partial output and report failure. The provider rejects
foreign authorities, path traversal, symlink escape, write modes and mutation.
It does not expose general filesystem paths. The same provider is available to
the separately implemented avatar actions.

The root integration dependency for both comment and post sheets is
`longPressMountedTextHookPatch` in the existing Long-press-tools wrapper; it depends
on `longPressPostHookPatch`, then `longPressCaptureHookPatch`. The latter depends on the root-owned
`longPressCaptureResourcesPatch`, which registers the provider. Build132 verifies
both distinct comment bodies, the sheet and both PNG actions for the pinned
comment, as recorded below. Remaining runtime checks include recycling, toggle
OFF, scrolling, expanded replies and a tapped avatar as separate surfaces.
Physical devices remain untested.

## Post capture sheet

`postManager`, default OFF, enables a 300 ms hold on one exact native post root.
Its sheet provides **Copy post text**, **Save post as image**, and **Copy post as
image**. **Copy current image** appears only when the separately installed and
enabled original Morphe post-image implementation proves exactly one selected,
shown image. That action revalidates the original post key, root and selected
URL on use. Original image/GIF saving remains available through its original
controls; the new sheet does not activate that optional feature implicitly.

Build124's real Posts feed supplies `images_post_root_slim.eml-fe` roots and
`post_text.eml-fe → ContainerType → ExpandableTextType` body paths. The policy
also accepts the native text/options/poll/videos post root variants, but those
variants still need their own runtime checkpoint. Exact ownership requires one
body per root binding and one matching mounted occurrence, as for comments.

Native `Lvnn.aD` creates the body and its measurement variant through
`Lutn.u(Lwds, boolean) → Lwhb`; its Read-more label uses a separate direct model
builder. The patch marks only the former model identities, then checks the
exact `Lvuw.z` or `Lvuz.A` model and that component's `Lwuw` context at the text
observer. Equal but distinct model objects cannot reuse this marker. No
dependency on the optional **Translate posts** patch is added, and its selected
default or translation controls remain untouched.

Post observers are installed during finalization, after all original text-hook
clients have finished using their positional insertion counters. They borrow
and restore the same context register from preserved native `p0`; no register
count changes or unrelated native instructions are introduced. The additional
fresh-text observer lies after the original cached insertion point, preserving
that shared counter. Source checks cover default and all-feature native APK
methods. Build132 verifies post text, rendered PNGs, the selected-image action
and the preserved native image viewer on an image-carousel post, as recorded
below. Other post variants still need device verification.

## Unshipped title and description experiment

Build109 included this experiment during validation. With **Copy video details**
enabled and a cold watch page, holding the title opened YouTube's native
Description panel instead of copying; pasting still returned the previous
timestamp URL. Holding the expanded description produced native selection
handles and the Android **Copy / Share / Select all / Web search** toolbar,
visible in the screenshot but absent from the XML assertions. It did not show
the experimental Afterglow copy dialog; this is not evidence that native text
copying itself is broken, and that native selection must be preserved.
Evidence is in `bundle-109-qa/text-and-images` and
`bundle-109-qa/description-copy` under the build evidence directory
`/mnt/c/Users/Corey/ytag-scratch/android/port-completion-20261113`.

The native routing has a concrete gap: modern text uses `Lvuk`, an
`AppCompatTextView`, while the experiment attaches its long-click listener to a
`ComponentHost` or its ancestor. `Lvuk.onTouchEvent` calls the native superclass
and can call `performClick()` itself. `Lcci.S` does expose mounted `TextView`
contents to the host, but that alone does not establish gesture ownership.
The current fade-only title is also intentionally rejected by the conservative
text-identity policy. Existing runtime logs do not isolate which of matching,
native listener preservation or child dispatch rejected each attempt. No
production diagnostic hook or speculative listener replacement was added.

The remaining description of this experiment documents its intended behavior
and native mappings, not working release functionality.

The user authorized integrating matching Morphe implementations until the exact
Afterglow versions are ready. The adapted source is pinned to Morphe commit
`44031c561ea048c8f196877f30a49c13bfd6afb6`, [Copy text PR 3592](https://github.com/MorpheApp/morphe-patches/pull/3592),
specifically [CopyTextPatch.java](https://github.com/MorpheApp/morphe-patches/blob/44031c561ea048c8f196877f30a49c13bfd6afb6/extensions/youtube/src/main/java/app/morphe/extension/youtube/patches/CopyTextPatch.java)
and [TextComponentPatch.kt](https://github.com/MorpheApp/morphe-patches/blob/44031c561ea048c8f196877f30a49c13bfd6afb6/patches/src/main/kotlin/app/morphe/patches/shared/misc/textcomponent/TextComponentPatch.kt).

The intended interaction with **Copy video details** ON is:

- Long press the watch-page title to copy the displayed title.
- Long press a description text segment to open a dialog with selectable text.
  **Copy** copies that whole observed segment; Android's selection actions can
  copy a selected part. **Cancel** dismisses it.
- The same description-text recognition includes the native Shorts description
  element. This requires its own runtime check.

The native description is a list of text segments and attachments. This fallback
does not reconstruct a raw description or combine text across embedded channel
cards. It does not add the iOS Copy icon or its two-action header sheet. The
preference remains hidden; any future exposed subtitle must identify the
temporary behavior, and the iOS parity record must retain the incomplete
header/raw-description scope.

Verified stock 21.43.523 hook locations:

- `Lvuw.aC(Lhfs;)Lhfn;`: native creation and cached lookup converge at `0x00b5`.
  `v4` still holds `Lvuw.c:Lwuw`, and `v3` is the full text subsequently written
  to `Lhsl.y:CharSequence`. Register-lifetime checks guard the insertion.
- `Lvuz.L(Lhfs;Object;Lhhw;)V`: the cached text is observed before its native
  `SpannableString` constructor at `0x0069`. The fresh text is observed after the
  first `Lvuq.k` result at `0x00df`, while its conversion context is still live.
  The native renderer's creation flag, text and style spans remain unchanged.
- `ComponentHost.dispatchTouchEvent(MotionEvent)`: observation occurs before
  normal native dispatch. `ComponentHost.getTextContent().getTextItems()` supplies
  the text actually drawn by that touched host, through an added typed bridge.

Semantic recognition is restricted to Morphe's `video_metadata.e` title path,
`description_rich_text_list.e` and `cell_description_body.e`. Comments and posts
are not registered. Text caches are bounded; normalized matching retains source
line breaks inside copied text. Ambiguous truncated descriptions are rejected.
Prefix expansion requires an explicit ellipsis, with a separated optional native
label. A shared introduction or fade-only title does not establish text identity.

The original Morphe routing is adjusted for live settings and ownership. Native
text is observed while the owner is installed even when the setting is OFF, so
an already mounted view can work after enabling it. Touches and delayed long
presses both check the current preference. Each gesture captures its own text,
and rechecks the host before acting. A typed native listener bridge tracks every
`setOnLongClickListener` call, allowing cleanup to remove only Afterglow's own
listener while preserving a newer native listener on recycled hosts. Native
long-click handlers are not replaced, including retained handlers whose
`longClickable` flag is temporarily disabled by Litho.

The pinned upstream NOTICE is 994 bytes with SHA-256
`640950d68b69f45e1f05b58d796a0b11e818ee1cca69d56b103d6503d2c7047d`.
It is staged as investigation evidence at
`/home/corey/.cache/ytafterglow-android/team-106/long-press/Morphe-NOTICE-44031c561ea048c8f196877f30a49c13bfd6afb6.txt`.
Integration must preserve it in repository/package notices and user-visible
attribution alongside the existing notices.

## Remaining native routing

iOS `copyVideoInfo` does not use the long press described by its preference
subtitle. `YTAfterglow.x:4840` adds a copy icon to the Description panel header
identified by `video-description-ep-identifier`. That button presents exactly
**Copy title** and **Copy description**, using the player response's title and
raw short description. Both actions show the localized **Copied** feedback.

The stock Android native header class `Lakjr` retains its panel identifier in
`O:Ljava/lang/String;`, assigned by `A(String)`. Its `c(Context)` binds a native
title-header `LinearLayout`. The parent `Lakhj` passes the panel's identifier to
that setter; `Lakhh.M()` provides the owning panel identity from `Lbfgs`.
However, the reviewed build105 Description hierarchy uses a Litho header and
body. A `Lakjr` hook alone would not establish coverage of that current screen.

The Android player response `Lalfm` / `Lbhad.g:Lbhah` exposes video ID, title,
author and channel ID, but no verified short-description field. Its string
getters must not be relabeled as a description. `Lnhl.k:Lbfph` *is* explicitly
named `description` in its own `toString`, and `Lnrn` renders it through
`Lasze.n` into `Spanned` for a Description panel, but `Lnhl` identifies itself
as `MainDownloadedVideo`: this is offline metadata, not live-watch proof.
No offline-only or guessed raw-description hook is installed. The unshipped
Morphe experiment observes native semantic text as described above.

The iOS remaining actions provide the behavior contract for the next mapping:

- Profile image: long press 0.3 seconds, load the selected avatar at size 1024,
  then **Save profile picture** and **Copy profile picture**.
- Post: long press 0.3 seconds, **Copy post text**, optional selected-image
  save/copy, and save/copy the post as an image.
- Comment: long press 0.3 seconds, **Copy comment text**, **Save comment as
  image**, and **Copy comment as image**.

The comment/post root mapping above is now verified against stock DEX; its live
interaction still needs validation. Avatar ownership is implemented separately.
No accessibility-text scraping is used. The old experimental
title/description observer and touch hooks remain excluded from the patch graph.

## Validation

`python3 tools/check_long_press_capture.py` runs 32 ownership-policy checks and
86 checks against the production gesture code with observable native-facing
objects. Separate focused stock/patched-DEX tests pass 43 root/token/register,
body-model and default/all-feature text-hook composition checks;
the production image provider passes 18 access-control checks. These establish
source boundaries, not Android gesture or rendered-image proof.

Build127 did not open the comment sheet when holding the fully visible first
comment body. The earlier `mounted texts=0` records came from the tap before
the Comments panel loaded, so they do not establish the held body's failure
boundary. Its accessibility node became long-clickable after the hold, while
Afterglow did not arm; a child drawing host versus registered element-root
mismatch was not established by those logs. The following diagnostic candidate logged
sampled native root classes and observer token/state checks, plus direct and
ancestor registration, mounted-text counts and readiness on touch. These logs
are limited to 12 host records per physical touch and 160 diagnostic records
per process and contain no comment text, semantic paths, buffers or URLs.
Build128 established the failure: the active renderer supplies no root in
`Lwuw.b` for the observed comment bodies, and none of the held hosts has a
registered ancestor. The optional context-root path therefore does not cover
that screen.

The mounted implementation uses the actual native text bind lifecycle instead.
Each final text observer records an immutable snapshot on the exact source
component. A legacy `Lvuw` links its returned `Lhsl` text model to that source;
the native shallow clone preserves this field. Modern `Lvuz` is already the
source model. Successful `Lhiy.w` binds supply the actual host, native item,
model and content, while `Lhiy.r` invalidates the old model before unbinding.
This includes native same-item updates. All retained native objects are weakly
referenced by the extension registry.

Capture requires exactly one current body mount, a compatible semantic surface
and one matching currently mounted text. It rechecks the same bind generation
after the hold delay. A new bind invalidates the old item across hosts; a late
old-model unbind cannot invalidate a newer model. Nested dispatch retains the
outermost proven single-entity host for capture. Native text, spans and listeners
are unchanged. The Description adapter shares this native bind provenance.
Twenty-nine production lifecycle checks cover the rootless-context failure and
recycling boundaries; 40 native checks validate register, clone and default/all
composition against build128 default and build127 all. Build132 provides the
live comment and post capture proof below.

Build131 armed the real comment hold on its native bound item. Its following
failure was confirmed as `hik > IllegalArgumentException` during software draw,
with the fixed Android hardware-bitmap incompatibility signal. The hardware
capture correction has 62 asynchronous window/gesture checks and 25 offscreen
render/readback/resource-lifetime checks, including full tall-root output and
same-text rebind rejection. These run production Java against observable
platform boundaries. The API route is documented by
[Android HardwareRenderer](https://developer.android.com/reference/android/graphics/HardwareRenderer)
and [PixelCopy](https://developer.android.com/reference/android/view/PixelCopy).

Build132 emulator QA confirmed the owned comment sheet (`004`), exact copying of
the 81-character comment into a separate app (`006`), and a full hardware capture
in 20 ms. Visual inspection of `comment-saved.png` confirmed the selected pinned
comment's avatar, author, body, controls and reply count. The PNG is 1080 × 503,
62,052 bytes, with SHA-256
`b1f4ebf840285246c00b8fd9fc410c7714f616e58d14feafbf1316110a2d68ad`.
The receiving-app check (`013`) obtained `image/png` through a temporary read
grant and read identical bytes. Evidence is under
`afterglow-vault-20261116/bundle-132-qa/native-runtime/`.
An immediate hold during the transition back from the receiving app was ignored;
the settled repeated hold worked. No production change was made for that
transition.

The second-comment check (`016`) copied the correct, different 754-character body,
starting “Several weeks ago I commented”, despite the collapsed native preview.
This verifies full observed body text rather than a copy of the visible preview.

The post sheet opened in `023`, and `025` copied the exact Unicode post body.
Visual inspection of `post-saved.png` confirmed the whole selected post's author,
body, carousel and controls. The PNG is 1080 × 1428, 1,001,592 bytes, with SHA-256
`a1c260b4925383ac1dcc4e3cad07ed3ad49211cada2e76471c768f67483b3788`.
The cross-app PNG check (`030`) read identical bytes. **Copy current image**
produced the selected 960 × 1008 image in `033`; swiping the carousel then copying
again produced the different selected image in `037`. The image hashes and
original Morphe resolver validation are recorded in [Avatar and post-image
actions](avatar-photos.md). A tap outside the body-manager action still opened
the native image viewer, and its **Close** control worked (`042`).

A second, tall post opened its sheet in `044`, with a 22 ms hardware capture.
The cross-app result (`046`) was 1080 × 1618, 771,304 bytes, with SHA-256
`800377d4a7fb6e07f5968477783dfe40eb344f72cb476b88bb9d86d7767da2d7`.
Visual inspection confirmed the author, body and full image extending below the
734-pixel visible viewport. The native footer controls were unmounted, however,
and their bottom area was blank in the PNG. This verifies capture of the complete
mounted content beyond the viewport; it does not reconstruct unseen, unmounted
parts of a native row. The fully visible first post includes all controls.
Physical-device behavior and the lifecycle cases listed above remain unverified.

Build132 passed strict application and APK assembly for all four integration
selections: default, all patches, the isolated eight-patch selection, and
Long-press tools with GmsCore support and Spoof video streams. These integration
results are separate from the runtime cases above.

`python3 tools/check_long_press_tools.py` runs the production URL policy and
clipboard hook against an observable clipboard and native readiness command.
It checks exact canonical URLs, subsecond truncation, wide times, invalid
identities, default OFF, absent owner, live OFF/reset, missing readiness,
foreground/ad/Shorts exclusions, navigation freshness and logged clipboard
failures. It also checks native title/description path recognition, title-marker
handling, collapsed text, whitespace/format normalization, multilingual text,
ambiguous matches, bounded eviction and excluded comment/post text. These are
host tests; they do not prove Android runtime behavior.

Build109 passed full 35-patch and independent six-patch strict application and
APK assembly. The Android 16 emulator recorded normal decoded playback advancing
and a native Pause at 9 seconds; pasting returned exactly
`https://www.youtube.com/watch?v=rfscVS0vtbw&t=9s`. Evidence is in
`bundle-109-qa/core-followup` and `bundle-109-qa/timestamp`. Build132 repeated the
strict integration checks with the experimental text hooks excluded.

Further timestamp QA still needs to verify:

1. In normal portrait and fullscreen watch playback, Pause copies the current
   video ID and integer time; Play and Replay leave a sentinel clipboard intact.
2. Pause-on-overlay, app backgrounding and other automatic pause paths preserve
   the sentinel clipboard.
3. Default OFF, live OFF, cold persistence, page reset and full reset work.
4. A second video copies its own ID/time; unavailable playback and an ad do not
   copy a previous content ID. Shorts keep their native interaction.
5. Native pause/play still controls decoded playback. Physical devices and
   casting remain unverified until separately tested.
The unshipped text experiment additionally requires:

1. With `copyVideoInfo` ON, a long press copies the watch title and opens a
   selectable description segment. Copy, selected-text copy and Cancel preserve
   the original native links, expand/collapse and ordinary taps.
2. Text actions work after live ON, stop after live OFF/reset, persist cold, and
   reject recycled/detached text and conflicting native long presses. A new video
   must not copy the old title/description. Include Shorts-description testing.

Stock extraction evidence and investigation notes are under
`/home/corey/.cache/ytafterglow-android/team-106/long-press/`.
