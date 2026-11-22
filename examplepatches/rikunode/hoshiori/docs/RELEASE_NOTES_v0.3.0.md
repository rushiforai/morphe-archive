# v0.3.0 (EXPERIMENTAL) — hide weekly bookmark ranking announcement

## New patch

**Hide weekly bookmark ranking announcement** is a Morphe bytecode patch for Hatena Bookmark **5.80 / versionCode 58000 only**. It hooks `TopFragment.showAnnouncement(Announcement)` and skips display only when the announcement text contains `ブクマ数ランキング`. Null text and all other announcements continue through the original display logic.

The `hideWeeklyRanking` boolean option defaults to **true**. Setting it to false leaves `showAnnouncement` unchanged. The patch includes strict DEX-layout guards (seven registers, 128 code units and an initial `Announcement.getId()` call) and rejects an unexpected layout.

## Included patches

1. Hide native PR entries from article feeds (unchanged).
2. Clone Hatena Bookmark for safe side-by-side testing (unchanged).
3. Hide weekly bookmark ranking announcement (new, default on).

## Verification status

Existing v0.2.1 PR filtering has prior user-confirmed real-device ad removal, as documented in the repository README. The new **ranking announcement patch has NOT been verified on a real device**. Static build, generated DEX, and metadata validation do not establish real-device behavior. Confirm that the weekly ranking announcement is hidden and unrelated announcements still appear before claiming runtime success.

The release distributes a Morphe `.mpp` patch bundle, not an APK. **Hatena 5.84 is not supported**; the older 5.84 patch attempt failed Pairip license verification. The historic third-party 5.80 APK carries security and compatibility risks. Do not disable Play Protect or remove a working original installation.
