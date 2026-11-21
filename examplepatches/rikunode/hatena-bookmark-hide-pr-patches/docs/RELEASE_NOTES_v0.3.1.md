# v0.3.1 (HOTFIX) — correct weekly ranking announcement code-size guard

## Incident in v0.3.0

The new **Hide weekly bookmark ranking announcement** patch in v0.3.0 **failed to apply in Morphe Manager on an actual Android device**. The failure was `PatchException: Unexpected Hatena 5.80 showAnnouncement code size`.

The original guard incorrectly expected **128 DEX code units** because the number of instruction bytes had been mistaken for 16-bit code units. The verified original `TopFragment.showAnnouncement(Announcement)` method contains **64 code units** (`insns_size = 64`), with seven registers. The Windows-side pre-build verification independently read this value from the original Hatena Bookmark 5.80 DEX `code_item` header.

## Fix

Only the `HideWeeklyRankingPatch.kt` code-size `require` and its accompanying comment change from **128 to 64**. The hook, matching phrase `ブクマ数ランキング`, `hideWeeklyRanking` boolean option (default true), and control flow are unchanged. Other announcements continue to the original method.

Includes the original three patches; the existing native PR filter and side-by-side clone remain unchanged. Compatible **only with Hatena Bookmark 5.80 / versionCode 58000**; 5.84 is unsupported.

## Verification status

**v0.3.0 is known-broken for ranking-announcement suppression on a real device and should not be used for that feature.** Use v0.3.1 instead. The corrected v0.3.1 patch has **not yet been verified to apply successfully on an actual device**; successful compilation, bundle validation, and automated tests are not substitutes for device testing. The prior user-confirmed real-device PR-ad removal in v0.2.1 remains documented separately.

The release distributes only the Morphe `.mpp` bundle, not an APK. The historical third-party Hatena 5.80 APK has security and compatibility risks; do not disable Play Protect or uninstall a working original installation.
