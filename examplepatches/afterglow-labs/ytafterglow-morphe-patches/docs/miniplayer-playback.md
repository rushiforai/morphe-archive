# Mini-player playback

`miniplayer` is the existing default-OFF **Enable mini player** switch under
Player > Playback. Its owner is the independently selectable **Mini player**
tweak. The registry, translations and settings row are the iOS-derived entries;
this implementation adds no styling or separate preference.

The iOS specification is `YTAfterglow.x` at the 21.43 hook-repair checkpoint:
`YTWatchMiniBarViewController` and `YTWatchFloatingMiniplayerViewController` skip
`updateMiniBarPlayerStateFromRenderer` when enabled, and the floating controller
answers false from `isMiniplayerRendererPlaybackModePauseOnly`. This lets
made-for-kids videos keep playing while minimized.

## Native mapping in YouTube 21.43.523

| Boundary | Stock evidence | Change |
|---|---|---|
| Minimized state | `Ljkj;.<clinit>` assigns `WATCH_WHILE_MINIMIZED` to `Ljkj;.c`. | No change. The patch requires this enum mapping. |
| Renderer mode | `Lbjhy;.c:I`, decoded by `Laxgy;.bP(I)I`. The native decoder maps raw 4 to decoded 5. | No change to the renderer or decoder. |
| Pause-only enforcement | `Lrku;.g(ILjkj;Lbjhy;)V`: after reset bookkeeping, mode 5 + playing state 2 + `Ljkj;.c` invokes `Laske;.aK(false, 19)` or the existing `Lrsx;.q()` path. | At the local mode read only, enabled mode 5 becomes 0. The existing zero-mode branch skips the restriction. |
| Native resume eligibility | `Lizo;.h()Z`: feature 45770945, the same renderer mode 5, and the same minimized state contribute a restriction to the native eligibility result. | The same local mode override removes only that restriction. All other eligibility checks remain native. |

These are the only two reads of `Lbjhy;.c:I` in the stock DEX. The other call
to its decoder is the generated protobuf enum verifier. Neither the protobuf
verifier nor the shared decoder is patched.

`MiniPlayerPlaybackPatch.kt` checks the exact method signatures, minimized enum,
decoder opcode/literal sequence, both mode-read consumers, and the local
mode/constant comparison registers before editing either method. Unsupported
mappings fail patch application. The injection reuses the temporary result
register and calls `MiniPlayerPlayback.playbackMode(I)I`; it adds no reflection,
renderer writes, observers or cached policy state.

Only decoded mode 5 can change. OFF, missing tweak ownership, other modes,
unknown values and failed preference reads preserve native behavior. Native
manual pause/play, the caller's state stores and restriction-message reset
bookkeeping remain in their original methods. Enabling the preference does not
issue Play; subsequent native decisions read the current value. Lite Mode uses
the existing iOS rules and does not force this preference.

## Integration and overlap

The unnamed entry point is
`app.afterglow.patches.playback.miniPlayerPlaybackHookPatch`. It depends only on
`afterglowExtensionPatch`, and belongs in the **Mini player** named patch together
with its settings dependency and `markTweakInstalled("miniplayer")`. The separate
`playlistOldMinibar` implementation shares this tweak owner, but its preference
does not enable the playback override.

The existing `BackgroundPlaybackPatch.kt` also early-returns `Lrku;.g` when
`backgroundPlayback` is enabled. Although its fingerprint is named
`KidsBackgroundPlaybackPolicyControllerFingerprint`, the verified stock method
is gated on `WATCH_WHILE_MINIMIZED`. Its entry guard and this patch's later mode
read preserve each other's fingerprint pattern, so either mutation order works.
Mini player does not depend on or install Background playback. A full-build
test with default background playback ON cannot independently prove the new
enforcement hook.

## Validation and runtime checklist

`python3 -B -I tools/check_miniplayer_playback.py` passes 36 JVM checks using the
production preference registry, installed-tweak set and Lite Mode policy. It
covers default OFF, unselected/imported ownership, unrelated background and
playlist settings, all current mode values plus unknown values, live ON/OFF,
Lite Mode, preference reset/type fallback, and a failed preference read.
Only Android application startup/logging is stubbed. An initial test compilation
called the private default accessor; the test now checks the public registry
descriptor. Production code did not change for that correction.

Source evidence and isolated compile logs are under
`/home/corey/.cache/ytafterglow-android/team-106/mini-player/`. This worker has not
patched, signed, installed or exercised an APK; bundle and runtime results must
be recorded by the integration run.

Required runtime cases:

- Select Mini player independently (with required settings and GmsCore plumbing)
  and verify that only its implemented settings appear.
- In the full build, turn Background playback OFF to expose the native policy.
  On a verified made-for-kids fixture, OFF must pause on minimize and ON must
  retain decoded playback. Confirm the fixture's paused restriction before
  treating continued playback as a pass.
- Verify mini-player manual Pause/Play, expand/minimize, replay after completion,
  native media controls and transitions to a different video while ON. A manual
  pause must remain paused until a user/native resume action.
- Toggle OFF live and minimize again; verify restored native restriction. Cold
  restart with ON, page/full resets, and malformed/imported settings must retain
  their specified preference behavior.
- Check regular-video mini playback, normal watch/fullscreen controls, playlists,
  Shorts and actual background behavior for regressions. The native resume
  predicate has further feature/state gates; source proof alone does not prove
  every resume path ran on the device.
- Re-enable Background playback and verify the existing behavior composes.
  Restore defaults and the agreed full APK after independent testing.

## Emulator checkpoint: build109, retained in build110

On Android 16, with Background playback OFF, the made-for-kids fixture
`XqZsoesa55w` pauses at 18 seconds when minimized with this switch OFF. ON advances
13→20 seconds while minimized. Manual Pause stays at 22 seconds; resume advances
23→30 seconds. Saved frames show decoded motion, the native OFF restriction
message, and the expected Play/Pause controls. Build110 retains this exact hook;
its production change gates the unrelated experimental text-copy feature.
These cases do not establish every video/account/device or alternate player path.
