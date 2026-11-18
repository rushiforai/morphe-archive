# Keep DM scroll position

This is a Piko add-on for the official `com.instagram.android`, not Instagram Lite.
Select this patch and Piko **Add settings** in the same Morphe patching run.
The preference appears under **Piko Settings > Direct Messages** and defaults to on (existing saved choices are preserved).
Patching without Piko settings fails explicitly. Compile-only Piko API stubs are not packaged into the app.

## Why the thread jumps

The text-send path invokes a send-completed callback with the replied-to Direct item.
The callback constructs a `Runnable` and schedules it with `View.postDelayed`.
The runnable checks that the fragment is resumed, then calls the Direct scroll controller,
which scrolls the thread's RecyclerView to adapter position 0 (the newest item).

The patch guards only that scheduling call. With the preference on, a non-null reply
item and Instagram's own at-latest predicate returning false, the forced scroll is
not scheduled. All remaining send-completion work still runs.

### Small movement after sending

The original fix stopped the explicit scroll but left viewport resizing untouched.
Later in the same callback (`X/03NH.APW`, `0x00b2` onward), Instagram hides composer
UI and performs composer cleanup. The reverse-layout branch of
`LinearLayoutManager.onLayoutChildren` chooses an end anchor and adds the orientation
helper's total-space change to its coordinate. Growing the viewport can therefore
move existing rows down even when no scroll-to-position runnable was scheduled.
This is a separate layout path, not another global scroll call to block.

The user reported a remaining 1-2 cm movement with v1.27.1. That implementation
removed its listener on the very first pre-draw, including when no resize had
happened yet. It also rejected padding changes outright. Host regression tests
reproduce the first limitation with unchanged frames followed by a resize. This
establishes a gap in our correction, not a device trace of the user's remaining hop.
A second regression reproduces a reverse hop when the row's layout position moves
but `translationY` temporarily masks that move. Compensating `getTop()` alone in that
case creates a visible error that then settles with the item animation.

Further DEX inspection found a second native scroll path in
`DirectMessageListLinearLayoutManager.onLayoutChildren`: the traced section
`DirectThreadScrollBottomIntoViewportLayoutHelper.afterLayoutChildren`. It examines
a tagged first visible item, computes its bottom overflow and calls
`scrollVerticallyBy` for a small overflow. In the analysis APK its helper `X/04Xe`
constructs a 50 dp threshold; the scroll call is at original byte offset `0x0236`.
This is independent of the delayed send-to-latest runnable and can bypass a
resize-only correction. It is concrete native behavior; identifying it does not
replace a device trace of the user's particular hop.

The new `DirectViewportLayoutFingerprint` locates the traced method and validates
its first-visible/missing-item gate, tagged-item checks, bottom padding calculation,
scroll call and trace-cleanup exit. It reuses the register immediately overwritten
by `const -1`, and takes the same exit used when no first item exists. The native
weak RecyclerView reference is matched against the active old-reply snapshot.
Only that list during a valid reply transition skips the bottom nudge. Other
threads, the latest-message case, ordinary sends, expired state and manual scrolling
retain the native helper. The top-anchoring helper and explicit navigation calls
are unchanged. No obfuscated field or method name is hardcoded.

The reply-only guard now snapshots the top visible child (and a second when
available), their screen-space offsets, dimensions and the usable bottom edge of
the list. For at most 1000 ms after that send callback it compares each pre-draw:

- Unchanged rows: retain the anchor and update the bottom-edge baseline. Instagram
  may already have preserved the top anchor itself.
- Layout positions moving uniformly by exactly the change in the usable bottom edge:
  compensate the primary row's rendered displacement with native `scrollBy` before
  drawing. This covers deferred/multi-frame resizing, bottom-padding changes and
  movement of the list within its window.
- A move animation masking that observed resize: include `translationY` in the primary
  visual anchor. Allow its translation to settle towards the pre-send value. The
  initial animation offset must oppose, and not exceed, the measured resize. Unrelated
  animations are rejected. The second row corroborates layout movement; it can animate
  differently from the primary row.
- Any independent row movement, dragging/flinging, changed anchor dimensions,
  detached/replaced anchor views, width change or loss of focus: discard the snapshot
  permanently. If native scrolling is clamped, stop instead of chasing the anchor.

The observation window is a safety budget, not a hardcoded Instagram animation
length. Its callback only removes listeners; it never performs a delayed jump.
Detachment and an uptime deadline also clean up, including when drawing stops or
timer delivery is delayed. Only the original reply send path creates this state. A weak pointer connects it
to the native Direct bottom-nudge guard; every subsequent send retires the previous
snapshot, including ordinary messages and replies at latest.
Nothing intercepts global RecyclerView scrolling. A large Reel with one visible
child remains supported, and no message contents or IDs are read or retained.
Dataset insert anchoring remains Instagram's responsibility. Unrelated movement
and resizes after the observation window are deliberately untouched. Phone feedback
is still needed to establish whether the remaining hop uses this delayed/inset path.

Settings use Piko `IgStr.str` and Android `values`/`values-pl` resources. English is
the fallback. Both patch selection and the preference default are enabled, while
an explicitly saved false preference remains false.

## Fingerprints and scope

- `DirectTextSendFingerprint`: the `DirectThreadFragment.sendTextMessage` and
  `DirectSendHelperImpl.sendSideChatContextualQuery` strings, with boolean return type.
- `DirectSendCompletedFingerprint`: a callback contract obtained from the text sender,
  four parameters ending in an integer, and a `View.postDelayed(Runnable, long)` call.
  Its declaring class must implement the sender's callback interface with the same
  method name, return type and parameter types. Exactly one match is required.
  Business-share logging strings are not required: Instagram 447 removed them.
- Additional checks connect this callback to the sender's interface; resolve the
  runnable's controller constructor parameter; verify its resumed-fragment check;
  identify the immediate/smooth RecyclerView scroll paths; and resolve the
  controller's first-visible/first-completely-visible at-latest predicate.
- `DirectViewportLayoutFingerprint`: the Direct layout and bottom-viewport-helper
  trace strings, a void method with two parameters, and the validated helper control
  flow described above. The extra hook only skips its native bottom-nudge section.
- Reuse only the two temporary registers immediately overwritten by the original
  `int-to-long`. Reject changed instruction shapes instead of guessing registers.
- Piko settings are connected during patch finalization, after bundles have merged
  their extensions. Its preference widget and shared preference storage are reused.

Obfuscated names below are audit evidence only, never matching criteria in the patch.

## Analysis input

- Piko upstream: `50744aa07bb41c4e1f942a06614ef4e6f2e3610c`, release `v3.9.0`.
- Upstream target: Instagram `439.0.0.37.89`, ARM64, version code `384510827`, APKM.
- Available analysis input: APKPure `439.0.0.37.89`, ARM64, code `384510833`, XAPK.
- Base APK SHA-256: `37501d681e64fb20a378aad94668668db323f0e55f3086bbd5ca73321f534376`.

These are different variants. Analysis of `384510833` is not verification of `384510827`.
The latter remains the compatibility target to match Piko. Exact-variant verification
and physical-device behavior must be confirmed before treating this as a stable release.

Observed chain in the analysis input:

1. `X/03Yg.A08(...)Z`: resolves the reply item through the reply context and invokes
   `X/0Hkp.APW(..., DirectItem, int)` after sending.
2. `X/03NH.APW(...)V`: at byte offsets `0x005a` through `0x0066`, constructs
   `X/0EkJ` with `X/03NF` and calls `View.postDelayed`.
3. `X/0EkJ.run()`: checks `Fragment.isResumed()` and calls `X/03NF.A01(false)`.
4. `X/03NF.A01(boolean)`: selects the immediate/smooth scroll-to-position-0 path.
5. `X/03NF.A02()Z`: checks first completely visible position, falling back to first
   visible position; position 0 means at latest.

Other callers of the scroll controller include click handlers, thread opening and
dataset updates. They are not modified. The normal update path in `X/04Wv.A00`
already captures the at-latest predicate before updating the dataset.

## Phone test

### Instagram 447 compatibility update

The uploaded APKMirror variant is Instagram `447.0.0.55.81`, ARM64, version code
`385311895`, APKM (480 dpi). It is added alongside the existing 439 target and stays
experimental until physical-device confirmation. The runtime hook and preference
are unchanged; the fix replaces only the callback identification.

In this input the sender is `X/5y9.A07`, invoking `X/GuM.ARG` with the reply item as
the third argument. `X/5Zd.ARG` implements that callback and posts `X/JDN` at original
byte offset `0x0062`. `X/5Zb.A01(boolean)` and `X/5Zb.A02()` are the same scroll and
at-latest roles as before. These names are audit evidence, not matching criteria.

`scripts/VerifyInstagramDmFingerprints.java` exercises the production predicate with
log-free callback fixtures and rejects unrelated interfaces, callback methods,
reply types and callbacks without delayed work. An optional clean base-APK argument
checks uniqueness of the production predicate against actual DEX classes.

Local validation uses the unchanged v1.34.0 extension/resources with the updated
Instagram patch classes, Morphe Desktop `1.17.0`, and Piko `3.10.0` **Add settings**.
Full release bundle compilation is separately checked by GitHub Actions. This is
patching/DEX validation, not a physical-device scroll/rendering test.

### Verification history

- Full `:patches:buildAndroid` build in GitHub Actions: passed (Kotlin, Java and extension DEX).
- `python3 scripts/test_instagram_dm_hook.py`: passed. Tests the production Java hook
  with small Android/Piko fakes: default on, eight combinations of reply/location/toggle,
  unavailable preferences, null/duplicate settings UI, Piko localization lookup, pixel
  offset restoration for positive/negative/one-pixel resizes, delayed and animated resizes,
  bottom insets, screen coordinates, fractional/unequal item animations, one visible Reel, excluded navigation/scroll/layout
  cases, rapid replies, timeout cleanup with no draws and delayed timer delivery.
  The delayed-resize regression fails against v1.27.1 and passes with the updated hook.
  These are host tests, not device rendering tests.
- APK integration verified for v1.27.1 with Morphe Desktop `1.16.0`, Piko `3.9.0`, analyzed XAPK `384510833`: both **Add settings**
  and **Keep DM scroll position** applied successfully; full DEX and resource rebuild passed.
  This developer test used `--force` because the input variant differs from Piko's target.
- Applying the add-on without Piko: rejected at finalization with the explicit missing
  **Add settings** message; no output APK produced.
- Decoded output confirms the conditional skips only the send callback's `postDelayed`.
  The Direct scroll controller and delayed runnable are instruction-for-instruction
  unchanged. Compile-only Piko and AndroidX stubs must not be packaged in the extension.
- The follow-up adds a guarded native viewport-helper fingerprint and extends the
  runtime layout observer. Resource integration and compatibility are unchanged.
  Host tests also cover native guard scope, expired/missing references and thread
  replacement. No new physical-device test or ART runtime verification has been performed.

### On a phone

Use a build from this branch's successful **Verify Instagram add-on** Actions run.
Extract the `dudeks-patches-instagram` artifact ZIP and import its `.mpp` into Morphe.
Keep the original app's signing-key requirements in mind when replacing a previous patched installation.

1. Choose a clean supported Instagram APKM. Select this patch and Piko **Add settings**
   together (multiple sources may require Morphe expert mode).
2. Check **Keep scroll position when replying** under Piko's Direct Messages settings.
   It is on by default for a new preference; an existing saved off value stays off.
   In Polish, look for **Zachowuj pozycję przewijania podczas odpowiadania**.
   If Piko asks to restart, restart the app.
3. Scroll roughly 100 messages up, reply to an old Reel, and send. Check that the
   Reel remains around the same visible position after sending and after delivery.
4. Repeat for text, photo and shared-post replies; send several replies in sequence.
   Include a multiline answer and wait a second after each send. Compare the Reel's
   position immediately after sending and after the reply panel finishes closing.
5. At the bottom, send a plain message and a reply. Both should follow new messages normally.
6. Scroll manually during delivery, tap jump-to-latest, open a search result, switch
   conversations, leave/reopen the app, and receive a new message while reading history.
   Explicit navigation must still work. No other conversation should inherit state.
7. Turn the preference off and repeat the old-Reel case to compare stock behavior.

Automated metadata is generated by the existing release workflow. Do not edit
`patches-list.json`, the release index or `PATCHES.md` by hand.
