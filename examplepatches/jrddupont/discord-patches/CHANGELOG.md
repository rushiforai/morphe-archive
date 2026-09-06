# Changelog

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
