# nicoid Re v2.1.2-dev.7 — verified-candidate change log

Development-only candidate; **do not publish as a stable release**. Inherits approved v2.1.1 behavior and every change through v2.1.2-dev.4.

## Defects addressed

- App resume: the dev.2 early-exit blocked real background returns while a retained service was still preparing. Capture the session present at foreground entry, allow a pending `DirectBackground235.State` to finish preparing, and refuse a newly started/replaced service. Register app lifecycle tracking from the tab host, not only from a back/switch policy.
- Settings: classify the independent popup-return setting by key in `SettingsCategories241` and move it beside background-return after categories are installed. Keep the existing key and persisted legacy value, and preserve the separate values for background and popup returns. Retain Japanese, English, and Traditional Chinese labels, entries, and summaries.
- Mini-player: recheck both `MiniSession225` and `DirectBackground235` when closing a shared video. Close a second owner only if its actual video object is identical to the closed owner's, and scan the Activity that released the panel plus registered playback-panel hosts to remove orphaned views. Do not remove an active, unrelated video.
- Ambient: during tab transitions, redraw/rewrap visible menu and comment cards even when the page object and child count remain unchanged. Protect a cached valid glow from a transient 100ms cleanup by expanding the animation grace window, and keep a reduced 90ms background check when stationary.

## Verification strategy

- Static and JVM runtime regression checks for original session identity and no-hijack behavior
- Real ambient compositor test against Canvas/Android test doubles, including 1,000 unchanged samples
- Backward compatibility tests for paused playback, popups, seeking, settings migration and all supported languages
- Verify final assembled Smali/DEX call sites in the staged MPP: app resume capture/identity, settings categorization, lifecycle registration, mini-panel release, and ambient update
- Keep existing source/MPP integrity and all other untouched bytecode contracts

## Known limitation

No local Android device is connected. The tests cover source code, executable JVM unit behavior, Android compilation in CI, and final DEX wiring. Device behavior requires user validation; do not claim that all real-world issues are resolved before it.

## Specific dev.6 regressions addressed

- **Menu ambient**: ThemeChoice.background can replace a live ambient Card via setBackgroundColor after a ViewPager tab is re-themed. Route this recolor through AmbientCard217.themedColor to update the original base while retaining its gradient wrapper and avoiding a one-frame dark menu
- **Popup app switch**: for explicit popup policy on the normal video Activity only, shorten the reviewed 500ms switch debounce to 180ms, so handoff begins before Android's onStop pause; leave the 500ms debounce unchanged for other modes and activities
- Keep dev.5 background/popup return separation, mini player close cleanup, pause preservation and translation unchanged
- Preserve the original pause/resume intent and do not force play; popup switch timing remains subject to real Android lifecycle scheduling
- Verify new Smali call sites in the **assembled** helpers.dex, not just in source tests

Android-device validation remains necessary, especially tab swaps across menu/comments and popup handoff audio/video continuity.

## dev.7 validation candidate

- Keep all confirmed dev.6 popup handoff improvements (500ms normal / 180ms popup), pause-state preservation, background and popup return controls, mini cleanup, and Japanese/English/Traditional Chinese settings intact
- Ambient menu: rescan newly attached row views after ViewPager changes (48/180/450/900ms), even without a subsequent onPreDraw, and cancel pending scans when the page owner detaches
- Player: distinguish an explicit user Pause from a Media3 stalled-buffering episode. Record the immediate Pause call origin; a currently requested Play that stays buffering beyond 4.8s is eligible for at most one `prepare()` retry, never an automatic `play()`
- Protect paused intent, replaced media items, changed player owners, background/popup handoffs and released sessions from stale timer callbacks
- The user-supplied dev.6 log has repeated MediaSession PLAYING/PAUSED with a stationary published position, followed by an OS-level TCP socket abort. These logs do not prove that Media3 itself was paused automatically; live-device verification is required
- Tests: run the production ambient component against fake ViewPager children and an independent Java model of Media3 stalled play, and assert actual assembled DEX hook call sites
