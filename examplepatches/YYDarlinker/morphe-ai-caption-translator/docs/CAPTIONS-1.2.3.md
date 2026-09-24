# Shorts engine-switch recovery (1.2.3)

## Reproduced failure paths

The previous bridge kept one global last manager/track/origin slot. A callback for a prefetched or departed Short could overwrite the visible video's snapshot and CaptionChoice. The toggle's can-reselect gate and stale-video exception then rejected the global preference change or rolled it back, including when the user was trying to turn AI off from the settings screen. Weak references and a failed intermediate null/reselect could also leave the slot unusable.

Two targeted regression tests were first run against 1.2.2: background selection changed the visible language, and a stale video prevented the settings preference from turning off. Both failed as expected before the fix.

## Corrected responsibilities

- The enabled preference is user intent, not a transaction dependent on temporary native player objects. Disabling persists OFF and refreshes/cancels the active AI session before best-effort native reselection. A native-refresh failure never turns AI back on. Enabling still requires a configured API key.
- Native selection snapshots are bounded to six video-keyed entries with weak manager/track references. The visible video ID selects the relevant entry. Background-video callbacks do not mutate current caption choice or independent language memory.
- Foreground changes clear the old current-video choice and may adopt a validated snapshot of that same video. Unknown foreground identity never permits replay of the last background callback.
- Fresh tracks must match the snapshot's video, language, source/translation mode and ASR flavor. A changed model, reused manager, collected reference or missing language defers refresh instead of replaying an old-video URL/object.
- Internal null/reselect callbacks are ignored before they can mutate the snapshot or memory; the origin and reason belong to the same immutable snapshot. A mid-reselect video change prevents restoring the old track.
- Native OFF remains OFF when changing engines. A later actual native ON callback can recover from a temporary default null selection. These observations do not overwrite independent user language memory unless the callback is explicit and belongs to the visible video.
- When immediate refresh is unavailable, localized feedback distinguishes saved ON awaiting captions from AI already OFF awaiting native-caption restoration. These two new messages cover all 14 existing UI languages (90 keys per locale).

The translator, timing anchors, segmentation, prompts and three optional-patch boundaries are unchanged. The native list accessors also use separate typed null/non-null returns, preserving the ART safety rule introduced in 1.2.2.

## Validation boundaries

Regression coverage includes a simulated 20-Short sequence with prefetch and both switch directions, delayed old-video callbacks, weak-reference expiry, fresh-track recovery, reused managers, unknown foreground identity, settings-page OFF, partial native-selector failure, preserved CC OFF and a video change during reselection. A real controller Session (without starting a network task) verifies that OFF cancels the session and pending source task even without a native manager.

Generated APK checks and the emulator ART probe cover the actual injected menu and native-bridge classes, including caption-off and deferred-state entry paths. The older 1.2.1 VerifyError regression remains a separate retained check. Simulated state scenarios and ART class execution are not a claim of live YouTube Shorts swipe/tap-through or user-phone playback acceptance. No paid translation API is used by these tests.

Publication remains a normal main push followed by the repository's existing semantic-release workflow. There is no manual tag, release or asset replacement.
