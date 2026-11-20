# nicoid Re v2.1.2-dev.5 — verified-candidate change log

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
