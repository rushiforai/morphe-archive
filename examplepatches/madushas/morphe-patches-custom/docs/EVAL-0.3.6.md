# PDB Morphe patch — evaluation 0.3.6

- Date: 2026-10-20
- Build: `pdb_patched.apk` v0.3.6 (app 2.134.6), pdb-test signature
- Device: `emulator-5554` (x86_64 host, arm64-v8a app via ARM translation)
- Account: signed in (id `6398658`)

## Works as intended

### Patch plumbing

- Settings shows **Pdb Extras — settings, tools & unlocks · v0.3.6**.
- Extras header: `Pdb Extras v0.3.6` and
  `Patch v0.3.6 · Pro + ads unlocked · Paused OFF · pdb.app_preferences · MMKV ok`.
- Extras opens from Settings with `android:exported="false"`; `adb shell am start`
  is denied (release hardening).
- Status-bar insets: rows stop below the status bar after scrolling.
- Hidden-screens popup: opaque background and all 12 entries open.

### Unlocks

- Native **Tweaks** screen (app's own debug UI):
  - `Mock you as pro user` = **ON**
  - `Disable IRL Mark Read` = **ON** (read receipts off)
  - `Ignore IRL see more` = **ON**
  - `Remember Google Login Auth` = **ON**
  - `debug AD` = **OFF**
- Home bottom `adContainer` is empty/collapsed (height 6 px), consistent with ads
  removed; no banner on Home.

### Preferences

- `Force English` ON persists (`english=true`) across force-stop; OFF persists
  (`english=false`).
- Text override `Feed country = US` persists (`country='US'`), clear resets to `-`.
- `Randomize device id` writes `XDeviceId` (new UUID) and the value survives.
- Defaults-true switches mirror the app defaults after 0.3.2.

### Storage / diagnostics

- `Dump MMKV store`: lists `pdb` with **41 keys** when signed in, including
  `XDeviceId`, `access_token`, `FirebaseFCMToken`, `MainTabID`; per-account
  `pdb_<uid>` stores are enumerated too. (R8 stripped public `allKeys()`; the
  patch calls the surviving JNI `allKeys(long, boolean)`.)
- `Database stats`: `pdb_app_go.db` (944 KiB)
  - `android_metadata: 1`
  - `channel_info: 0`
  - `metric: 0`
  - `profile_feed: 46`
  - `profile_view_record: 2`
- `Browse table` with `profile_feed` prints real rows (id, target_user_id,
  user_id, source_json, missed_timestamp, created_at).
- `Profile feed (local cache)` renders formatted rows with timestamps and target
  ids (46 cached entries).
- `Profile view log (raw)` / `Visitor digest (grouped)` read
  `profile_view_record`; digest showed the signed-in user with 2 views.
- `Browse table` / `Recent chats` / `Chat statistics` / `Streak radar` /
  `Unsent drafts` return clean empty-state messages when `channel_info` has no
  rows (the SQL still validates every column).

## Known limitations / app behaviour

- `channel_info` is **empty** on this account (no 1:1 chats yet), so streak,
  draft and recent-chat tools were only exercised against an empty table. The
  queries run and return the empty state; row formatting is untested.
- `Open profile of entered id` with the **signed-in user's own id** opens
  `ProfileDetailActivity` and shows Pdb's "Oops! Something went wrong". Own
  profile is normally `UserCenterActivity`; this looks like an app limitation,
  not a patch bug.
- Visitor digest includes the user's own profile views (local
  `profile_view_record` rows), so self-visits appear as a visitor.
- Google sign-in cannot work on the re-signed APK (OAuth client SHA-1 mismatch).
  Email verification login works; registering the pdb-test SHA-1
  `F9:34:99:C7:1F:DD:BC:4C:CB:64:BF:BE:8D:03:5D:B0:68:2B:1E:52` in Google
  Cloud would restore Google login.

## Not exercised

- A real conversation with a second account (read receipts / see-more peer
  behaviour, `channel_info` rows, streak/draft formatting).
- Premium gating that needs a second user (visitor "Who?" reveal with a real
  visitor, gated likes).
- Fake-logout flag, deep-link launcher, icon switch, presets (low risk; same
  preference plumbing).
- Push notifications / FCM delivery.
