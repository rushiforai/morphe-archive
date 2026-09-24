# 1.2.5 — automatic video-to-video caption handoff

> Superseded by [1.2.6](CAPTIONS-1.2.6.md). The shared hook addressed a genuine missing
> lifecycle path, but this version incorrectly treated the event CPN as a video ID.
> Its fixtures supplied identical values and missed the resulting rejection of real
> selections. The switching claims below are historical intent, not device-proven behavior.

## Confirmed defect

The 1.2.4 native bridge was injected into the user-facing `setSubtitleTrack` method.
On the verified YouTube 21.07.247 host, that is `anws.k(track, origin, reason)`.
The automatic model-ready/default-selection path (`anws.h`) does **not** call it:
it constructs a caption event and calls the shared dispatcher `anws.l(event)` directly.
The previous tests supplied a manual-selection callback even for successive videos,
so they could not detect the missing host hook. Merely counting one capture hook was insufficient.

Consequences: after switching video, a current-video selection descriptor could remain
missing and `CaptionChoice` unknown. Translated TimedText was then intentionally blocked
by the paid-API permission gate. Toggling the engine had no current native manager/track
to reselect and reported `DEFERRED`. The native path remained usable with AI off.
This is a verified defect consistent with the reported behavior, not a claim that every
possible missing-caption cause has been exhausted.

## Fix

- Resolve the shared dispatcher from the structurally identified manual selector.
  Require a separate two-argument automatic initializer to call that same dispatcher.
- Capture the final native selected track after native Off/automatic-caption/forced-track
  filtering, immediately before the native renderer update. Replace the labeled instruction
  itself so branch targets cannot jump past the hook. Remove the menu-only hook.
- Bind typed host accessors at patch time; unknown/ambiguous host structures fail patching.
  No reflection is added to the playback runtime.
- Retain the requested Off intent even if the host supplies a forced-caption fallback.
  A manager reset with no event video is not a user Off action on its old video.
- Preserve the six-video bounded snapshots, weak native references, foreground-owner gate,
  source-only zero-API mode, explicit Off, and existing same-video direct takeover/reselection.
  Prefetch and late departed-video events do not replace foreground intent.
- Diagnostic revision: `source-phrase-125`. `NATIVE_TRACK_APPLIED` reports owner match,
  Off/translation flags and reason without signed URLs or credentials.

## Switching guarantee and limits

When a usable selected track has been applied for the foreground video, AI on starts the
correct source/translation session in the same toggle operation; AI off hides the overlay,
releases native draw suppression, and directly reselects that video's current native track.
This works independently of having manually opened that video's caption menu.

“Immediate switch” means immediate mode/renderer handoff, **not zero-latency translation**:
uncached captions still need source/network/model time, and native reselection can need a
network load. Videos without a usable source track cannot gain subtitles from this addon.
An original-language selection remains original-language text with zero translation API;
choose an Auto-translate target for translated captions. Explicit caption Off remains Off.
No extra model pass, wider translation retry budget, or background horizon is introduced.

## Verification

- The new generated-DEX call-graph regression fails on the actual 1.2.4 APK: automatic
  restoration bypasses addon capture.
- 201 Robolectric/JVM tests pass, including twenty automatic source-video transitions using
  real controller sessions and a fixture source transport, both directions of engine switching,
  twenty automatic translation-selection transitions, prefetch/late-event isolation,
  ownerless reset, mismatched owner and explicit Off versus forced-track fallback.
  Translation-mode tests use activation spies, not paid model output.
- Official Morphe 1.43.0 default compatible patches plus all three addon roots are rebuilt
  against the original YouTube 21.07.247 APK. Generated DEX audit checks the shared automatic
  path, final selected field, before-renderer ordering, branch entry and typed native bridges.
- AI-only and memory-only compositions are structurally checked separately.
- Android API 35 x86_64 host-method probe executes the real dispatcher (constructor-free
  fixtures, stopping at the renderer boundary). The old APK misses the first automatic
  event; the corrected APK captures twenty successive events with bounded snapshots.
- These are build, host-method and fixture checks, **not real-phone video playback**.
  No phone is attached; model latency, real subtitle appearance and on-device switching
  still require the checklist below.

## Phone acceptance

1. Update the Morphe custom source, repatch the original compatible APK, and install the new
   patched app. Refreshing the MPP source alone does not update an already installed APK.
2. Confirm diagnostics say `source-phrase-125`.
3. Start with AI off. Play three regular videos and several Shorts without touching their
   native caption menus; toggle AI on/off in each and verify both renderers work.
4. Start with AI on and an Auto-translate language selected. Repeat the sequence; include
   fast swipes and returning to a prior video. Check no stale text or permanent blank state.
5. Repeat explicit caption Off, original-language selection, rotation/fullscreen transitions.
6. If failure persists, retain `NATIVE_TRACK_APPLIED`, `ENGINE_MODE_SAVED`, `CONTEXTUAL_CORE_STARTED`
   and `FIRST_AI_READY`; report YouTube version and selected patches. Do not share API keys
   or signed subtitle URLs.
