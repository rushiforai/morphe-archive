# TikTok 46.7.3: dev.22 profile and drawer corrections

Baseline feature: `d925835a58d6d71bb95ebb4b565f45e2847914cb`, published as
`1.2.0-dev.22`. The September 10 recording and diagnostic report show the profile
moving with the drawer, an opaque drawer, and the horizontal profile header.
The user confirms that the FYP bottom navigation now works.

## Drawer registration was bypassed

Diagnostics register the exact profile root (`role=1`, `X.0C0w`) but never register
a sidebar (`role=2`). In the acceptance APK, the normal path through
`ProfileSidebarPageFragment.onCreateView` jumps from byte offset `0x009c` to the
`return-object v2` at `0x00a2`. Inserting a hook before that return creates a new
smali MethodLocation; the existing jump label stays attached to the return and
skips the hook. The already implemented transparency and profile compensation
therefore never see the drawer.

Native root hooks now replace the instruction at the original return location
with the registration call, then append the original return. Branch and exception
labels consequently enter the hook. A patch-time contract checks every return's
register and hook, plus all branch, switch-case and exception-handler targets.
Acceptance also runs bytecode regression fixtures that reject the old insertion
and accept replacement for those entry paths.

The existing drawer transparency, clipping and pre-draw compensation remain in
place. Navigation and the central TUX/Compose color paths are unchanged.

## Restore the complete native centered header

The horizontal layout is a native TikTok experiment. In this APK,
`profile_left_align` initializes the boolean in `X.0C0Y`. The cached accessor
`X.0BzY.LJIIL()` gates the merged avatar/info header and both
`profile_left_align_avatar_opt` and `profile_left_align_avatar_at_right_opt`.
`ProfileHeaderComponent` selects its original avatar and information components
when that master flag is false; the V2 basic-info component otherwise creates the
horizontal row.

The Theme engine patch option `classicProfileLayout` defaults to true and disables
that master flag before its dependent caches initialize. This uses TikTok's
existing centered layout; no view reordering, padding or geometry detection is
added. The selection is independent of the color preset. Disabling the patch
option retains TikTok's native experiment selection.

Discovery uses the exact experiment string and initializer/boolean-field/write
contracts, not the obfuscated class or field name. It requires one match and
records the original method in the shared hook report for future update probes.

All APK evidence refers to SHA-256
`b9e96e64e94ac0f9ea229dd0ba743f1930121a8b6941cf9fd87191604da0129e`.
CI validates patchability and regressions; the appearance and animation still
need confirmation with the new build on the affected device.
