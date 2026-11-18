# Eye modes

The Overlay buttons tweak shares one presentation between the standard player
and Shorts. The active iOS `YTAGOverlayVisibilityPolicy.h` and coordinator define
four modes: native controls, pinned Afterglow controls, timed Afterglow controls,
and the eye alone. The timed row hides after three seconds; a fresh native show
reveals it again. Eye opacity is 1, .85, .65 while timed controls show, .16 after
timeout, and .10 in eye-only mode.

The mode belongs to the app process. Rebuilding a host, changing videos or
rotating does not reset it or extend its timer. A fresh process starts at the
default. Disabling the eye preference controls the button; it does not rewrite
the session presentation. The iOS Reset Player Overlay action belongs to Control
Center. The native reset entry point exists, but that action remains unported
until its actual screen is implemented.

On YouTube 21.43.523, `Lolx.Z` retains native requested visibility, including its
use by Pause on overlay. Presentation is masked at the native visibility context,
the immediate and delayed animation enum emitter, and direct controls/seekbar
visibility commands. Restoring uses the guarded native show and refresh commands.
The utility row remains outside the native lock layer and consumes only its own
buttons' hit targets.

Shorts uses the original `Lmpo.S/o` visibility calculation before composing the
eye mask with the independent Hide built-in player layer mask. Its utility row
is a separate child of the native player host, with Settings and the eye at the
iOS 84dp top inset. Mute and Lock remain standard-player actions.

Build103 completes the default-ON advanced Clean overlay button under the
independent Overlay buttons tweak. One process-wide mode cycles through native
controls, pinned Afterglow controls, timed controls and the eye alone on standard
watch and Shorts. Timed controls hide after three seconds and a fresh native show
reveals them again. Native requested visibility remains intact for Pause on overlay.

55 session-policy and 445 settings checks pass. Strict standalone, GmsCore,
streaming and independent selections pass 29/30/31/1/3; all 264 production input
hashes and bundle integrity match. 46 full and 34 independent observations are
visually reviewed (3 limited). Watch/Shorts cycle, timeout, reveal, restoration,
surface continuity, fullscreen lock and timed rotation pass. Native mixer gain
changes from 0dB to -inf and back while pinned and locked. Live and cold OFF,
independent ownership, page/full reset, Shorts player-layer composition and
Pause on overlay pass. The page reset preserves session mode; a fresh process
starts at default. Defaults and the exact full APK are restored and stopped.
Final app, extension, crash and ANR logs are clean.

Development101 failed strict matching before installation because its fingerprint
checks had the wrong instruction order. Development102 passed initial runtime
scenarios but failed Pause on overlay in a fresh pinned player. Packaged DEX
proved its visibility mask skipped native lazy controls initialization. Showing
normal controls once made pause/resume work, confirming the missing controller.
Build103 preserves initialization before masking visibility; the fresh-process
pause regression now passes. Native requested visibility remains unmodified.
Development102's navigation, stale media-session and scroll-test corrections
remain documented with their original failures. Native clock and decoded-frame
checks verify warm playback after Shorts without trusting that stale status.
Build103 also retains an initial ADB-server connection failure before app launch;
the recovered baseline passed without a production change.

Independent testing retained three observations with black video captures between
decoded frames. The emulator later disappeared during a cold-launch preroll.
Its configured swiftshader_indirect mode was unsupported by emulator37.2.12 and
fell back to the host GPU, whose log contains graphics memory-import errors.
The exact cause of the process exit and individual black frames is unestablished.
The same AVD and hash-verified APK resumed with supported SwiftShader; cold OFF,
remaining reset checks and a separate five-state Shorts motion follow-up pass.
Both log periods and the interrupted phase are retained in the release audit.

Physical devices, casting and alternate player architecture runtime are untested.
The emulator has audio output disabled; mixer gain is checked, audible output is
not. Reset Player Overlay belongs to the unported Control Center: its internal
reset entry point exists, but the action remains pending and hidden. Evidence:
execution-103.json, eye-modes-audit-103.json and delivery-103.json under
port-completion-20261113. See docs/overlay-eye-modes.md. Continue the remaining
native mappings and full port, now 129 done / 4 n/a / 66 todo.
