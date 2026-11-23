# Device & Cross-Environment Test Matrix

## `0.1.12-dev` Multi-language (i18n) verification — 2026-11-23

All user-facing strings (settings entry/page, hidden-chat page, dialogs, toasts, notification channel names, redacted lock-screen text, `Mark as read` / `No reply` button labels and placeholders) now come from standard Android string resources in 7 locales (`values` English default, `ko`, `ja`, `zh-rTW`, `zh-rCN`, `th`, `in`), resolved through the Activity context so LINE's in-app language override is respected. The four canonical patch names stay in English.

* **Automated checks**: 86 `NotificationPolicy` assertions, 18 Python unit tests (including `test_i18n_resources.py`: 7 qualifiers × 39 `line_notify_*` keys, no empty/raw-quote values, zero hardcoded Hangul outside `NotificationStrings.kt`), 1,179 static APK contracts (ARM64), 1,179 (Universal), 1,139 (`Mark as read`-only).
* **Compiled resource check** (`aapt2 dump resources`, ARM64 and Universal validation APKs): 39 `string/line_notify_*` keys, no key missing in any of the 7 locales.
* **SHA-256**: bundle `061d3091dce1aa0c53610272e13bbd911434a282a9ebbeef0e3f210e9d28a54c`, unsigned ARM64 APK `f0ce42afe9dec4310d6f1f554afe75cb1f2e4bc9b2e28e0f87520d35c3005a25`, signed test APK `34fe48ece6295442dcc1074152fc3a19a76a2818cc467c686403199cf3202528`.

### Physical S10e (`SM-G970N`, Android 12 / API 31 / One UI 4.1) — All 7/7 locales verified
| Check / Locale | Result |
| --- | --- |
| Same-key update | `adb install -r` succeeded with data preserved; installed `base.apk` SHA-256 matched `34fe48ec…` |
| `ko` (device default) | Settings row `알림 패치 설정`; page (`알림 표시`, `완전히 숨긴 채팅방`, `알림 버튼`, `적용 범위`), descriptions, 4 switches ON, and hidden-chats subpage verified |
| `en` (`English`) | Settings row `Notification patch settings` (`[153..759]`); page (`Notification display`, `Completely hidden chats`, `Notification actions`, `Scope`), descriptions, 4 switches ON, subpage verified |
| `ja` (`日本語`) | Settings row `通知パッチ設定` (`[153..495]`); page (`通知の表示`, `完全に非表示のトーク`, `通知ボタン`, `適用範囲`), descriptions, 4 switches ON, subpage verified |
| `zh-rTW` (`中文 (台灣)`) | Settings row `通知修補設定` (`[153..471]`); page (`通知顯示`, `完全隱藏的聊天室`, `通知按鈕`, `適用範圍`), descriptions, 4 switches ON, subpage verified |
| `zh-rCN` (`中文 (中国)`) | Settings row `通知补丁设置` (`[153..471]`); page (`通知显示`, `完全隐藏的聊天室`, `通知按钮`, `适用范围`), descriptions, 4 switches ON, subpage verified |
| `th` (`ไทย`) | Settings row `การตั้งค่าแพตช์การแจ้งเตือน` (`[153..815]`); page (`การแสดงการแจ้งเตือน`, `แชตที่ซ่อนทั้งหมด`, `ปุ่มการแจ้งเตือน`, `ขอบเขตการใช้งาน`), descriptions, 4 switches ON, subpage verified |
| `in` (`Indonesia`) | Settings row `Pengaturan patch notifikasi` (`[153..781]`); page (`Tampilan notifikasi`, `Obrolan tersembunyi sepenuhnya`, `Tombol notifikasi`, `Cakupan`), descriptions, 4 switches ON, subpage verified |
| Restore & stability | Restored to `Auto (Default)` (`알림 패치 설정` confirmed returned); 0 `AndroidRuntime`/`FATAL` errors in logcat; no chat was opened during testing |

## `0.1.11-dev` Expanded notification sender avatars (local cache only) — 2026-11-20

Added sender profile `Icon` support to `ConversationPreview` (`Notification.MessagingStyle`): 1:1 chats reuse LINE's original `largeIcon`/`sender_person` icon, while multi-sender group chats read `contacts.picture_path` and LINE's local Glide cache exclusively (`onlyRetrieveFromCache(true)`, `DiskCacheStrategy.DATA`, `circleCrop()`, max 8 distinct senders, `64–128px`, 150ms timeout) with zero network requests. Moved trailing 400ms active-notification refreshes (`deferRefresh`) onto a background worker thread.

* **Automated checks**: 86 `NotificationPolicy` assertions, 15 Python unit tests, 1,075 static APK contracts (ARM64), 1,075 static APK contracts (Universal), 1,035 static contracts (`Mark as read`-only), including 11 pinned Glide cache-only bindings.
* **Physical S10e (`SM-G970N`, Android 12 / API 31)**: Installed signed same-key APK (`8316d127e41f5e1a449717e464c42e00c6742833efe406cfaccd9b9b8ebed6fb`); user confirmed real-message expanded notifications display sender profile photos properly.

## `0.1.10-dev` Android 15/16 Edge-to-Edge fix & stability hardening — 2026-11-20

Fixed `SettingsPage` edge-to-edge overlap (`setDecorFitsSystemWindows(false)` + `OnApplyWindowInsetsListener` returning `WindowInsets.CONSUMED`), isolated `More Chat Info` preview/DB exceptions from hidden-room fail-closed suppression, added `server_id` non-numeric and `extras != null` guards, removed unused `NotificationBadgeResources.kt`, and added `/HANDOFF.md` to `.gitignore`.

* **Automated checks**: 86 policy assertions, 15 Python unit tests, 1,011 ARM64 contracts, 1,011 Universal contracts, 971 `Mark as read`-only contracts.
* **Bundle SHA-256**: `126d6d972ecf75f4dd439197c78c472b5739f23cad21f5fcf9af2351c3219453`. **APK SHA-256**: `f00228785e7857a3d525bb85acf19636c5cb4f1bd71904d59769e268fbe30bff`.

### Physical S10e (`SM-G970N`, Android 12 / API 31 / One UI 4.1) regression
| Check | Result |
| --- | --- |
| Same-key update | Installed cleanly, `base.apk` SHA-256 matched (`f0022878…`), login & all 4 switches preserved ON |
| `SettingsPage` insets & layout (API 31) | `header_root` at `[0,117][1080,279]` directly below status bar `[0,0][1080,117]` (zero overlap, zero double-padding; matches LINE's native settings header bottom `279`), `ScrollView` `[0,279][1080,2164]` cleanly above navigation bar, 0 crashes |

### Android 16 (API 36) cross-environment verification (Emulator + Galaxy S22 Ultra One UI 8.0 diagnostic)

Tested on an **Android 16 AOSP emulator** (`pixel_api36`, API 36, `x86_64` + `arm64-v8a` translation) and a **physical Galaxy S22 Ultra** (`SM-S908N`, Android 16 / API 36 / One UI 8.0, `1440×3088 @ 600dpi`) using a standalone diagnostic app (`targetSdk=36`, running production `ConversationPreview` + `NotificationPolicy` + `LineNotificationSettingsWindow` dialog theme) and unauthenticated APK boot. Official LINE `26.18.2` on S22 Ultra was untouched, and the temporary diagnostic app was uninstalled immediately after testing.

| Android 16 (API 36) check | Environment | Result |
| --- | --- | --- |
| `SettingsPage` edge-to-edge bug repro (`targetSdk=36`) | AOSP Emulator (API 36) & S22 Ultra One UI 8.0 (API 36) | Confirmed `setDecorFitsSystemWindows(true)` is ignored on API 35+: header rendered at `y=0` underneath status bar/cutout (`statusTop=128` emu / `100` S22U, `overlapTop=true`) |
| `SettingsPage` edge-to-edge fix | AOSP Emulator (API 36) & S22 Ultra One UI 8.0 (API 36) | Portrait (`headerTop=128` emu / `100` S22U) and landscape cutout (`headerLeft=128`, `headerTop=63`) all reported `overlapTop=false`, `overlapLeft=false`, with crisp dark status-bar icons on light background |
| Stock AOSP & One UI 8.0 `MessagingStyle` rendering | AOSP Emulator (API 36) & S22 Ultra One UI 8.0 (API 36) | Group `[32]` (25 messages retained, consecutive sender grouping, long wrapping, explicit `\n`), 1:1 `[1]`, `읽음`/`답장` actions (`actions=2`), `No reply` (`mAllowSystemGeneratedContextualActions=false`, 0 smart-reply chips), silent channel (`line_notification_patches.silent.v1`, `mImportance=LOW`, `isNoisy=false`, `mIsInterruptive=false`) verified |
| Lock-screen `VISIBILITY_PRIVATE` redaction | AOSP Emulator (API 36) | With PIN set and `lock_screen_allow_private_notifications=0`: `PLAINTEXT_LEAKED: []`, `publicVersion` = `LINE / 새 메시지가 있습니다` |
| Patched LINE `0.1.9-dev` ARM64 boot (unauthenticated) | AOSP Emulator (API 36) | Installed `arm64-v8a` and launched `RegistrationActivity` cleanly (0 `FATAL`/`VerifyError`/`NoSuchMethodError`/`SecurityException`; no account login performed) |

*(Note: Android 16 tests cover diagnostic rendering and unauthenticated boot; live LINE account FCM push and read sync were tested on physical S10e Android 12.)*

## `0.1.9-dev` Chat-list long-press mute & offline read verification — 2026-11-20

Extended `Not Too Much Silent` to the chat-list long-press menu (`d42.d.u3`) and chat-list bell icon/menu label (`f22.i.f`), and fixed Morphe Manager `2.6.0` remote metadata (`created_at`). Passed 86 policy assertions, 15 Python tests, 1,007 ARM64 / Universal contracts, and 967 read-only contracts. Tested on physical S10e (`SM-G970N`, API 31) targeting only the user's Official Account test room.

| `0.1.9-dev` S10e test | Result |
| --- | --- |
| Same-key update | Installed cleanly, `base.apk` SHA-256 matched (`d7d2f083598cca6fa397e3fb8791c71781ab1cfd28467cdd23db6e62c8b5e393`), login & settings preserved |
| Chat-list long-press round-trip & live icon | Quiet (`icon=True`, menu `알림 켜기`) → tap (`toggle: chat-list menu intercepted`, `setting: normal requested`, `native delivery already matches`, immediate `icon=False`, menu `알림 끄기`) → tap again (`setting: quiet requested`, immediate `icon=True`, menu `알림 켜기`) |
| Long-press mute → silent background push | Received on `line_notification_patches.silent.v1` (`importance=2`, `[1]`, cleared via `읽음`) |
| Long-press unmute → normal background push | Received on `jp.naver.line.android.notification.NewMessages` (`importance=4`, `[1]`, cleared via `읽음`), then restored to quiet |
| Offline `Mark as read` + Wi-Fi reconnect | Received 2 (`[2]`) → disabled Wi-Fi (`mobile_data=0`, `Active default network: none`) → tapped `읽음` (`read: native updater submitted` → `read: native completion and room cleanup`, local notification cleared immediately) → reconnected Wi-Fi (`Active default network: 102`) → sent 1 new message → reset cleanly to `[1]` with only the new message |

Bundle SHA-256: `7d34bdd0f028b728f315919692e8a2eb9dc5c6c4197f7c338b23dd874bf2d401`. APK SHA-256: `d7d2f083598cca6fa397e3fb8791c71781ab1cfd28467cdd23db6e62c8b5e393`.

## `0.1.8-dev` Automated Official Account test-bot matrix — 2026-11-18 & 2026-11-20

Tested on S10e (API 31) against the user's own Official Account test chat only (86 policy assertions, 4 SQL regression tests, 954 ARM64 / Universal contracts, 928 read-only contracts). Bundle SHA-256: `9fcb3100f2e09933c8ac48226d7fb88ebf42cf8b13cbc15d786c9cf3ef39a168`; APK SHA-256: `ca4f596a3b446e5dcdad3beefc3e958a91538eb2e40ae8966422db80489ebe37`.

| `0.1.8-dev` S10e test | Result |
| --- | --- |
| 26 mixed messages in 5-message batches | Summary & individual notifications both showed `[26]` with exact messages #2–#26 in timestamp order (long wrapping & explicit newlines verified), silent channel, 0 smart-reply choices |
| Whole-chat `Mark as read` → new message | Cleared 26 unread & removed notification; subsequent 1 message showed `[1]` with only the new body |
| Swipe-dismiss preserves unread | Swiping notification away produced no read log; next message accumulated to `[2]` with both messages |
| Process-dead (`am kill`) `Mark as read` | Killed background LINE process → tapped `읽음` on `[2]` → process started, native read completed, notification cleared, next message reset to `[1]` |
| Multi-room coexistence & summary | Marking test room read kept other room's notification intact; multi-room summary stayed plain (`number=0`, no read action) |
| `More Chat Info` OFF + `Mark as read` standalone | Native title/preview preserved without `[N]`; `읽음` and `답장` buttons worked cleanly |
| LINE `Show message preview` OFF | Displayed `LINE / 새 메시지가 있습니다` (`number=0`, no message body or sender exposed) |
| Normal + silent channel coexistence | Switching test room to normal delivered on `NewMessages` (`importance=4`) alongside silent rooms |
| Complete hide & unhide restoration | Completely hidden room suppressed both individual and summary notifications; unhiding in settings restored quiet-channel delivery (`importance=2`) |

## Earlier version history (`0.1.7-dev` – `0.1.0`, S10e Android 12)

* **`0.1.7-dev`** (bundle `05c554e9…`, APK `6337d28c…`): Switched `More Chat Info` to Android `MessagingStyle` (25 retained, `[N]` total). Verified on S10e in real background group chat (`[32]` total, 25 retained, sender grouping, line wrapping, silent channel, `읽음`/`답장` actions) and synthetic S10e rendering (1:1 & group `[83]`).
* **`0.1.6-dev`** (bundle `80a54a5a…`, APK `4e91d0fb…`): Added `Mark as read` via native chat-list updater (`qg3.e`). Verified group 3 unread → read & clear → new 1 → read & clear, process-dead read, live switch toggle (`읽음`/`답장` ↔ `알림 끄기`/`답장`), inline reply input dialog opening, and 914 / 888 static contracts.
* **`0.1.5-dev`** (bundle `fe135199…`, APK `9a5cb5f3…`): Added post-save notification refresh (`uq8.z2.f`), verified 1 → 2 background updates on S10e (743 static contracts).
* **`0.1.3-dev`** (bundle `befc670f…`, APK `91fe1d2e…`): Converted chat-menu Mute to local quiet mode keeping push delivery active; verified background silent delivery and complete hide/unhide on S10e (689 static contracts).
* **`0.1.0` – `0.1.2`**: Initial settings screen, non-floating full-page dialog theme, and silent channel prototyping on S10e.

## Remaining unverified scenarios

* Real-account live FCM push & read sync on Android 13–16 / non-Samsung OEMs (Android 16 testing above was diagnostic + unauthenticated boot)
* Actual inline direct-reply message sending (input field opening verified; sending not executed)
* Real multi-account switching on the same device
* Native `ue3.k.p` failure rollback under live server error
