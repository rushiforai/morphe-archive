# Hide up-next panel

`noRelatedWatchNexts` is the default-OFF **Hide up-next panel** switch under
Player > Playback. It belongs to the independently selectable Watch page tweak
and does not require Advanced mode. Existing translations and Lite Mode behavior
are retained. The iOS reference limits `YTWatchNextResultsViewController` to its
information section through `setVisibleSections:1`.

Android's `watch_list` RecyclerView contains both video information and
recommendations. Hiding the view itself would also remove channel actions and
comments. The watch and Home feeds also share Litho recommendation identifiers,
so a global component filter would affect Home.

`WatchNextSectionsPatch` instead filters the main watch-list presentation in
`Lrea.r/s`, leaving the original `Lalck` response available to native metadata,
playlist and playback owners. `Lrgp.a(List)` supplies YouTube's own information
boundary: through the comments entry point, with its native metadata fallback.
Unknown boundaries retain the complete native model.

The bridge clones the original `Lblva` protobuf, keeps its information prefix
and clears the copied list's top-level continuations. Other fields remain intact.
It then passes that model through the original `Lrea.o` architecture split. The
separate elevated metapanel still receives the original response; its own
`Lqrj.p` uses the same information boundary.

`WatchNextSections` retains native owners weakly on the main thread. Preference
notifications post a refresh after the callback returns. Attached owners replace
only their main list through the native `Lauor.aF` path. Turning the switch OFF
restores the original model and continuations without replaying playback or full
watch-response callbacks. The saved model is cleared when native `Lrea.j` clears
the current watch state, including on a change to an unavailable video.

Native list replacement resets pending continuation bookkeeping through
`Lauqb.aW/nZ`. Both success (`Lackk`) and failure (`Llgk`) callbacks require their
entry to remain in the pending-request map before delivering a response. This
avoids adding a global callback hook for requests invalidated by list replacement.

## Validation

Build105 completes the default-OFF Hide up-next panel switch under Player >
Playback, owned by the independent Watch page tweak. It uses YouTube's own
information/comments boundary and filters a copy of the main watch-list model.
The original response, metadata, comments, playlist and playback owners remain
intact. Live OFF restores the original list and its continuations. Unknown
information boundaries retain native content.

459 settings checks and strict standalone/GmsCore/streaming/Watch-page-only/
independent selections pass 29/30/31/1/3. All 269 production inputs, signed DEX,
installed APK hashes and bundle integrity match. 36 full and
34 independent observations are visually reviewed (5 limited).
Live hide/restore, cold persistence, native description/comments/Share panels,
fullscreen, repeated scrolling and page/full resets pass. The full build also
preserves children's-video information/actions, Home, playlist entries/minibar
and decoded Shorts playback. The independent install verifies behavior with
native ads present and organic recommendations below them. Defaults and the
exact full APK are restored, hash-verified and stopped.

Two ON description attempts terminated the Windows qemu emulator process with
access violation 0xc0000005. OFF opened, and the identical APK subsequently passed
ON description/comments/Share after restarting with the swangle option. Startup
still reported SwiftShader; the exact host crash cause is unestablished. These
failed runs, Windows events and the successful continuations are retained. The
available app logs have no target-app crash, ANR or Afterglow exception.

QA corrections cover a timed Pause tap, an absent Description accessibility
label, controls covered by the native playlist panel, an ad occupying the first
recommendation viewport, a native pause-ad panel covering information, and
incomplete swipe arguments. Collapsing the pause-ad panel restores the intact
information/comments section with recommendations still hidden. The original scrolled
frame mislabeled as restored information is retained with limited scope; a fresh
OFF baseline verifies the actual information section after a return gesture
entered native fullscreen. Three independent screenshots were black despite
populated UI hierarchies; they remain limited evidence. The affected comments
dismissal, portrait return and scroll transitions pass separate visual follow-ups.
The exact cause of the black captures is unestablished. The DEX reader now
escapes modified UTF-8 bytes. No application source changed during validation.

Physical devices and the separate elevated metapanel architecture remain runtime
untested. Lite/import rules have unit/source proof. Native continuation
cancellation has source proof and hidden-list scroll checks; no forced in-flight
network race is claimed. Evidence: execution-105.json, next-audit-105.json,
next-development-105.json and delivery-105.json under port-completion-20261113.
See docs/watch-next.md. Full port remains incomplete: 131 done / 4 n/a / 64 todo.
