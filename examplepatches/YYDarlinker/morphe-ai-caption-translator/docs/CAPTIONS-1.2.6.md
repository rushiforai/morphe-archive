# 1.2.6 — correct video ownership, restore AI and caption memory

## What failed, and why the previous tests passed

The user's `source-phrase-125` logs show `NATIVE_APPLIED_OWNER_REJECTED` with
`event_track_mismatch` for selected tracks, and `foreground=false;off=true` for
null selections. This is a regression introduced in 1.2.5, not an API failure.

On the verified YouTube 21.07.247 host:

- `anws.k` (manual selection) and `anws.h` (automatic model initialization) both
  construct `amof` and dispatch through `anws.l`. Keeping that shared hook fixes
  the original missing automatic path from 1.2.4.
- The event string `amof.a` comes from `anws.c()` → `aoeg.ap()`.
  Host `answ` explicitly appends that value after **`;cpn=`**. It is a playback
  nonce, not the video ID. Matching a unique String field did not prove its meaning.
- 1.2.5 compared that CPN against the caption URL's `v` parameter. Every ordinary
  mismatch returned before storing the track, updating the user's language memory,
  or starting AI. For Off it used the CPN as the video key instead, misclassifying
  the event as background. Removing the old manual hook made manual recovery fail too.
- Previous JVM tests passed the expected video ID directly into the callback. The
  ART probe constructed `amof(..., videoId)` rather than `amof(..., CPN)`. Executing
  the real dispatcher did not compensate for this incorrect input fixture. The DEX
  audit checked hook placement, but not the identity field's semantic provenance.

## Corrected implementation

- Keep the shared automatic/manual committed-track hook and branch-safe injection.
- Resolve the native builder setter through its **`Null videoId`** contract, then
  trace the caption model String field feeding that setter. On this host the chain
  is `anyi.d` → `anyf.m(String)`, populated from the video model via `agzh.L()`.
- Add a typed public getter inside the host model (the backing field stays private).
  The bridge reads the **installed caption model's video ID**, not event CPN.
  Unknown or ambiguous structures fail patching; playback adds no reflection.
- Keep real model/track mismatch rejection and foreground isolation. Do not simply
  disable the guard or substitute the visible video as an unverified owner.
- Model reset returns an empty owner: the host clears the caption model before its
  reset event, whereas other player fields may still describe the departed video.
  This reset does not become explicit Off or erase its prior snapshot.
- Preserve explicit Off (including forced-caption fallback), independent memory
  with AI disabled, bounded weak-reference snapshots, direct AI activation and
  same-video native reselection. Original mode remains zero translation API.
- No extra translation request, retry allowance, segmentation pass or wider prefetch.
- Diagnostics: **`Anchored / source-phrase-126`**. Accepted applications include
  `owner=caption_model`. Rejected model/track mismatches report only owner-match
  booleans, never signed URLs, CPNs or API keys.

## Verification scope

The corrected host-method regression uses **CPN ≠ model video ID = track URL video ID**.
The old 1.2.5 APK fails on the first automatic event; the rebuilt APK passes twenty
successive videos. CPN comes from the real host producer; captions use the native
protobuf parser, model factory and track builder. The patched native default selector
restores each next video from fresh model tracks and restores explicit Off as Off. Tests also retain
true cross-video mismatch rejection, background isolation, explicit Off and model reset.
The generated DEX audit now verifies the owner getter's path to the named videoId
setter, in addition to automatic/manual dispatch, branch coverage and public access.

The 221 JVM/Robolectric tests pass (no failures or skips), including twenty automatic
source sessions with both toggle directions, paid I/O forbidden, and memory-only with
no AI foreground hook. The all-feature APK is rebuilt against original YouTube
21.07.247 plus official Morphe 1.43.0 defaults. A separate memory-only APK is also
fully rebuilt without selecting any official or AI patch. Its actual Android dispatcher
and patched default selector pass twenty source-language/Off restoration cycles with
no foreground video hook. The AI-only composition is structurally checked, not separately
rebuilt. Both rebuilt APKs pass the shared ownership/dispatcher DEX audit; the same
ownership audit rejects the old 1.2.5 APK. Menu/bridge ART invocation also passes.

Build and fixture checks are not real-phone playback. No phone is attached and no
paid model is called. Device/network/model latency and actual visual switching are
not certified by constructor-free host-method probes.

## Upgrade and acceptance

Refresh this source in Morphe, **repatch the original compatible YouTube APK**, and
install the result. Updating the source alone does not update an installed app.
Confirm `source-phrase-126`, then:

1. AI disabled: select an original language, play multiple regular videos and Shorts,
   and verify remembered language plus native rendering.
2. Toggle AI on/off in each without reselecting a track. Repeat starting with AI on.
3. Repeat with an Auto-translate target. Only this mode uses the translation API.
4. Test explicit CC Off, rapid swipes, revisiting videos and rotation/fullscreen.
5. If a failure remains, preserve `NATIVE_TRACK_APPLIED`,
   `NATIVE_APPLIED_OWNER_REJECTED`, `ENGINE_MODE_SAVED`, `CONTEXTUAL_CORE_STARTED`
   and `FIRST_AI_READY`, along with YouTube version and selected patches. Do not
   send API keys or signed subtitle URLs.

Immediate switching means mode/renderer handoff in the toggle operation when a
usable selected track exists, not zero-time source/model/network loading. Explicit
CC Off remains Off. Videos without a usable subtitle track cannot gain one from this
patch. Original subtitle mode is not translation; select an Auto-translate target.
