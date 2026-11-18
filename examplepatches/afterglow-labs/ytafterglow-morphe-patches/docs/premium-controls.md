# Premium controls

The Overlay buttons owner exposes Afterglow's Premium controls sheet when
`controlsSheetButton` is enabled (its existing default is on). The presentation
follows `UI/YTAGPremiumControls.m`: title and channel, a five-action transport
row, then two rows of three circular utility tiles.

- Transport: restart, back ten seconds, play/pause, forward ten seconds, Next.
- Utilities: Download, playback speed, Stable volume, Mute, Lite, Lock.
- Speed offers the same fifteen rates from 0.25x to 5x as the iOS sheet.
- Download opens the Afterglow download sheet when its owner is installed.
- Lite is available only when the Lite Mode owner is installed. An omitted
  owner leaves the tile disabled and off without changing its saved preference.
- The native stream determines Stable volume availability and current state.
  An unsupported stream leaves the tile disabled.
- Lock enters native fullscreen, then applies native lock. Closing the sheet
  releases a lock the sheet acquired. A lock already active before opening is
  preserved unless the user explicitly unlocks it.

`PremiumControls.open(Activity)` is the public entry point. Its session belongs
to the current native player director, video and main activity. Every action
also checks the focused sheet window. A video or director change closes the
presentation and cancels pending lock work. Global native owner references are
weak; a presentation retains its resolved Stable-volume command until closing.

## Native boundaries in 21.43.523

`premiumControlsHookPatch` depends on the existing Afterglow Player overlay and
Overlay buttons hooks and the original Morphe Video information helper. These
dependencies provide capabilities without marking their feature owners as
installed.

- Play/pause uses the existing `PauseOnOverlay.Controller` bridge on `Lolx`.
  Its `Lokb`/`Larrt` readiness and native playing/paused branches are preserved.
  The label and toggle direction now read the same `Lolx.h → Lokb.i → Larrs.a`
  button state, rather than the separately cached global playback observer.
  The transport registers at root creation (`Lolx.F`), before the lazy control
  binder (`Lolx.E`). Explicitly opening the sheet runs that existing binder once
  for the verified current root/activity/video. Its native initialized-view guard
  remains intact; no play, pause, speed or volume action is used to initialize it.
- Next uses the actual `player_control_next_button` view (`Loir.y`), including
  its existing click listener and enabled state. Its native action is retained.
  The transport facade supplies the video ID so an old attached root cannot act
  on the current session.
- Seek uses `VideoState`; mute and lock use the current
  `OverlayActionController`; Lite changes the existing preference.
- Speed uses `Laske.T(F)`, the exact native `Lqqo.onItemClick` selection command,
  through the already bound transport facade. It preserves modern command
  dispatch and the legacy director path, and requires no prior opening of the
  native speed menu. The selected bundle's original user-selection observers
  are forwarded in their installed order; optional remembered-speed behavior
  is included only when that original feature installed its observer.
  Premium does not reapply a saved speed on new videos.
- Title, channel and identity come from original Morphe Video information
  getters, with an identity check before displaying metadata.
- Stable volume captures the typed `Lkzs(Context, Laske, Lovi, Laktm, int)` owner.
  This command is lazy: native More renders state through `Ljxc`/`Ljxd` without
  constructing it. The exact `Liep.i` factory branch is also captured, deriving
  discriminator 1573 from its switch target. First sheet use obtains the native
  command only from a provider whose `Lifh.qK` is the current transport's exact
  `Laske` facade. The session retains it across refreshes; no toggle occurs
  until the user presses the tile. No native menu needs to be opened first.
  A private copy of its native DRC command bypasses only protobuf-envelope
  dispatch. All 266 original instructions and branch targets are retained,
  including format support, both audio architectures, state publication and
  the native failure message. The original command is not modified.
  The state getter uses that same support predicate and `Lalcu.P()` state.

## Validation

`python3 tools/check_premium_controls.py` runs 74 checks against the production
session with controlled native owners, covering transport readiness, stale
owners, playback changes, absent or disabled controls, focus, errors, and lock
request completion/cancellation/ownership. The speed regression models native
resume restoring the selected rate, and confirms a paused choice uses the
selection command before Play. Lazy-command checks cover first use, unchanged
audio before an explicit toggle, retention across repeated refreshes, and
rejection of a foreign provider before invoking its factory.
The first-open regression also covers an uninitialized or stale global playback
state while the exact native button is already playing or paused.
Cold-open checks confirm preparation precedes presentation, performs no playback
action, and cannot initialize a foreign owner.
The candidate133 owner-gate regression covers omitted Lite Mode with saved OFF
and ON values, refusal to write either value, and restoration of the saved state
when the owner becomes available. Installed-owner toggling remains available.

Focused Java and Kotlin compilation passed. A separate native-DEX audit passed
54 checks, including every original instruction and branch target in the DRC
copy, all 98 reachable DRC instructions, rejection of changed native register
layouts, the actual Next binding, and native speed selection. Default and all
feature build122 APKs supplied their actual one/three installed speed observers;
both were preserved in order. Evidence is in
`~/.cache/ytafterglow-android/afterglow-vault-20261116/premium-controls/`.

Build122 runtime confirmed the sheet layout, native play/pause, ten-second
seek and mute/unmute. It also found that the former direct director speed
setter changed a paused video's rate temporarily but Play restored 1x. The
native selection-command correction passed build124: paused 2x remained 2x
after Play, and the native clock advanced 181 to 195 seconds over 7.02 seconds.
Build124 also verified restart to 0:00, Next selecting a different playing
video, cleanup of a sheet-created lock, and preservation of a pre-existing
native lock. Evidence is in `bundle-124-qa/native-runtime`.

That run found a remaining Stable-volume adapter gap: native More showed its
enabled ON switch while this sheet reported unavailable, including after the
native menu was opened. Build125 included the provider capture and still reported
unavailable on a cold first open, while native More showed enabled ON. It also
exposed the stale global Play label corrected above. Those failed checkpoints
are retained separately from the later passing results. Deduplicated Premium diagnostics distinguish
missing transport/facade, captured and matching provider counts, and current
native support state. Negative native states identify missing player (-1),
response (-2), formats (-3), stream (-4), native policy disabled (-5), or
unsupported format (-6); the public UI treats all as unavailable. No identity,
title or URL is included in these diagnostics. Native OFF/ON agreement and the
cold label correction were checked in subsequent builds. Build126 isolated the first
failure to **no current transport**: the overlay root existed before the lazy
controls binder registered its owner. Once native controls were opened, the
same build passed Afterglow OFF → native More OFF and Afterglow ON → native More
ON checks. This validates the native DRC command and support predicate; the
earlier root registration and explicit binder initialization above passed the
build127 cold-open checkpoint: before any native control interaction, the sheet
showed Pause and enabled Stable volume ON. Pressing its Pause action changed the
sheet to Play, and closing it revealed the native Play control at the paused
time. Evidence: `bundle-127-qa/native-runtime/001`–`004`. Physical-device
validation is untested.

Build133's final default-APK smoke toggles the installed Lite control ON and OFF,
restores OFF, and preserves native playback and the download sheet. Its installed
hash matches the signed candidate and the crash buffer is empty. Omitted-owner
behavior is covered by the 74 actual-session checks, not a claimed separate
Android install with Lite Mode omitted.
