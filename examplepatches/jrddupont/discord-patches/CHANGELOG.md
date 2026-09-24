# Changelog

## v1.5.0

- Self-locating patches: the QuestBar gate and gift-bar flag are now
  discovered in the bundle at patch time (string co-occurrence + head
  shape + flag write/test validation) instead of baked-in byte anchors,
  and compat is a NULL version (any com.discord build). New Discord
  versions need no patch update as long as discovery holds; anything
  unrecognized fails loudly with the update point named. Only the
  attach-sheet push keeps legacy anchors (frozen facts about old
  bundles) with skip-or-fail reasoning. Proven: discovery reproduces
  every v1.4.0 site exactly on all five known bundles, CLI bytes
  identical.

## v1.4.0

- New support: 346.13 Stable (all three patches). QuestBar gate
  grew eligibility hooks and a CreateFunctionEnvironment in its head
  (fn 62203, own 17-byte anchor; same 6-byte return-null edit over
  GPE + CFE); gift-bar flag in ChatInputRightActions (fn 56000, own
  anchor); the attach-sheet still has no gift entry in 346 (actions
  row fn 55293, only dead NITRO_GIFT renderer refs), so the sheet-push
  site is skipped there as in 344. Anchor spec extended to 11 checks,
  ALL OK; patch simulation shows exact diffs, no strays.
  Pin-to-builtin-bundle needs no change (DCDReactNativeHost.
  getJSBundleFile() still present in 346).

## v1.3.0

- New support: 344.13 Stable (all three patches). QuestBar gate
  re-cut with shifted registers (fn 60429, own anchor); gift-bar flag
  in ChatInputRightActions (fn 53139, own anchor); the attach-sheet no
  longer has a gift entry in 344, so the sheet-push site is skipped
  there (bar flag alone hides the gift). Anchor spec extended to 9
  checks, ALL OK; patch simulation shows exact diffs, no strays.
  Pin-to-builtin-bundle needs no change (DCDReactNativeHost.
  getJSBundleFile() still present in 344).

## v1.2.0

- New patch: Pin app to built-in bundle — forces Discord to always run
  the APK's Hermes bundle and ignore downloaded (OTA) updates. Without
  it, an OTA silently undoes all Hermes patches (observed on device:
  banner returned, composer gift never left). Official JS updates stop
  arriving until the APK itself is updated.

## v1.1.1

- Fix: Hide gift button missed the visible composer gift (v1.1.0 only
  neutered the attach-sheet actions push). Now also forces the
  shouldShowGiftButton load to false in ChatInputRightActions, which
  renders the visible [gift?, emoji] row — gift skipped, emoji kept.
  All three stables, decoder-verified single write + single test.

## v1.1.0

- New patch: Hide gift button — removes the gift button from the chat
  message composer (343.12 / 342.16 / 341.13 Stable). Skips the gift
  action's push in the Hermes bundle; the thread-button fallback and all
  other composer buttons are untouched.
- Hide quest promo banner now also supports 341.13 Stable (its gate is a
  hook-style variant, fn 58782 — same checks, different codegen, so it
  gets its own anchor).

## v1.0.2

- Stable-only: dropped the 345.2 Alpha target and its Hermes anchor. The
  Hide quest promo banner patch now supports 343.12 and 342.16 Stable.
- Repo cleanup: rewrote the README, renamed the Gradle project, fixed
  issue-template links, bundle contact/website metadata.
- Retired the broken v1.0.0 release (shipped without classes.dex, loaded
  zero patches); v1.0.1+ are the good builds.

## v1.0.1

- Fixed empty bundle: v1.0.0 shipped without dex entries so Manager
  loaded zero patches.
- Hides the Discord quest promo banner (343.12 / 342.16 Stable, 345.2
  Alpha).
