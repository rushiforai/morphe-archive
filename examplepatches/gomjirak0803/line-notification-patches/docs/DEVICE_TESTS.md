# Device & Cross-Environment Test Matrix

## `0.1.19-dev` Cross-process slot epoch, READ/privacy/hide hardening & live PC read-sync — 2026-11-25

Added 64-bit non-zero `SLOT_EPOCH` + unified 256-cap `SLOT_LEDGER`, pre-SQL and strict numeric `isVerifiedReadAtOrBefore` READ-boundary checks, `QUIET`/`NORMAL` preservation across hide/unhide and crash recovery (`pending_hide`, `STATE_LOCK` `hideDisposition` without native I/O, worker-based `onHideCompletedAsync` & lock-verified `cancelConfirmedHiddenChats`, `RECONCILING_ACCOUNTS`/`RECONCILED_ACCOUNTS` retry), privacy-OFF redaction of active plaintext/summary/sticker/car/wearable/remote-input extras and rebuilt summary `publicVersion.shortcutId`, standalone `No reply` original contextual-action restoration (`ORIG_CONTEXTUAL_ACTIONS`), and `enqueuedSeq`-ordered shared-summary `PENDING_POSTS`.

* **Automated checks**: 224 `NotificationPolicy` assertions, 271 `ExtensionRuntimeTest` JVM behavioral checks (44 scenarios covering cross-process `SLOT_GEN` reset, NORMAL/QUIET crash-recovery channels, pre-SQL/post-avatar READ boundaries, null/non-numeric READ ID protection, ledger conflicts on bulk cancel & summary rebuild, IPC `notify()`/`getActiveNotifications()` failures, privacy-OFF active/summary/pending redaction, account switches, standalone `No reply` contextual restoration, and 256-cap ledger saturation), 27 Python unit tests, 5 APK static contract suites: 3,165 (ARM64 all), 3,165 (Universal all), 3,103 (`Mark as read`-only), 3,125 (`More Chat Info`-only), 3,143 (`Not Too Much Silent`-only); `morphe-desktop list-patches` verified `Enabled: true` on all 6 patches.
* **SHA-256**: local `0.1.19-dev` bundle `490bd01f14c70d4827d2c05f2f0c7de8e3cf9d289a19c05ef35bc3434e72ab8b`; final S10e-verified `0.1.19-dev` signed APK `e412972a26f0330ed2ce743b0b5d5f7b4bf30d943aa2309a77e4b804ca6e91b7` (full 7-smoke matrix also executed on immediate pre-bump build `4a76f64862cb77074388dbaab6ca264e5b4808b1e7c34c14649bf65111d7077a`).

### Physical S10e (`SM-G970N`, Android 12 / API 31 / One UI 4.1) verification
| Feature / Case | Result |
| --- | --- |
| Smoke 1A/1B: NORMAL & QUIET 2-msg bursts | `test` (`568452307`) on `NewMessages` and `shubul` (`2028475556`) on `line_notification_patches.silent.v1` (`importance=2`), `MessagingStyle` `[2]`, `slotEpoch` & `origContextual` stamped, trailing refresh clean |
| Smoke 2A/2B: `QUIET` & `NORMAL` hide → blocked → unhide | Hide canceled active child immediately and rebuilt `16880000` summary with `publicVersion.shortcut=null`; incoming messages blocked (`mute gate: fully hidden`); unhide restored `shubul` → `silent.v1` and `test` → `NewMessages` |
| Smoke 4: LINE preview privacy OFF (text + sticker) | Both text (`568452307`) and sticker (`2028475556`) redacted to `LINE` / `새 메시지가 있습니다` with `car`/`sticker`/`remoteInputHistory`/`native_wearable_actions` stripped |
| Smoke 5: `am kill` background kill & cold restart | Process killed (`24285` → fresh PID), hidden room remained blocked across kill, fresh 64-bit `slotEpoch` issued (`2174507099910982513` → `8511855671023453464`), unhide restored `silent.v1` |
| Smoke 6A/6B: Live PC LINE read-sync & post-read boundary | Reading `test` on PC LINE auto-cleared `568452307` on sync while keeping `shubul` (`2028475556`) & group summary intact; subsequent 2 messages showed `test  [2]` with zero leak of the 4 PC-read messages |
| Smoke 7: Standalone `No reply` ON → live OFF | ON set `mAllowSystemGeneratedContextualActions=false` & `origContextual="true"`; live OFF immediately restored `mAllowSystemGeneratedContextualActions=true` & cleared `origContextual=null` on live notifications |
| Final `0.1.19-dev` APK sanity & crash check | Installed `e412972a…` (`base.apk` SHA-256 verified), delivered & cleared test notification cleanly; 0 `AndroidRuntime:E` crashes across all runs *(Smoke 3 multi-account switching covered in JVM `ExtensionRuntimeTest`)* |

## `0.1.18-dev` Pending-slot preservation, post-avatar guards, verified account cancel & cache invalidation — 2026-11-24

Protected queued `PendingPost` slots (`hasPendingSlotLocked`) during trailing `refreshActive()` updates without evicting waiting pushes, tracked per-item monotonic `deadlineMillis` (`NotificationPolicy.remainingHoldMillis`) so unrelated same-room saves retain unready pushes until their 1.2s deadline, rechecked account/privacy/`snapshotConsistent`/`Settings.INFO`/`mediaPreviewAllowed` after `NativeLine.senderIcons()` in all paths, required `NotificationPolicy.sameAccount` in `cancelChatNotifications()` (with `!Settings.silentIncluded()` account stamping in `transform()`) and `Settings.pruneHiddenNotifications()`, moved "Hide completely" notification cancellation into `ChatNotifications.change` on `success`, and added generation-guarded `NativeLine.invalidateChatListPreviewCache()` called from `Notifications.onMessageStored()`.

* **Automated checks**: 224 `NotificationPolicy` assertions, 40 `ExtensionRuntimeTest` JVM behavioral checks (covering trailing refresh slot preservation, unrelated-save hold retention, post-avatar privacy/account/`INFO`/read-state suppression, `null`-account preservation in cancel/prune, deferred "Hide completely" failure rollback, and same-millisecond file cache invalidation), 26 Python unit tests (`test_bundle_metadata.py`, `test_i18n_resources.py`, `test_line_test_sender.py`, `test_message_history.py`), 2,244 static APK contracts (ARM64), 2,244 (Universal), 2,182 (`Mark as read`-only); `morphe-desktop list-patches` verified `Enabled: true` on all 6 patches.
* **SHA-256**: local `0.1.18-dev` bundle `66ef29a6e97b4c6125e02a425d72f38f982a0516f3fb3b034d1b15e6595582b2`; S10e-tested signed APK `3cdffc5fca1adb1982f6744827857db4217876117b543d96d3aecd8c31478548` *(built from identical DEX and patch code immediately prior to bumping `VERSION` from `0.1.17-dev` to `0.1.18-dev`)*.

### Physical S10e (`SM-G970N`, Android 12 / API 31 / One UI 4.1) verification
| Feature / Case | Result |
| --- | --- |
| Consecutive & concurrent overlapping bursts (Room A OA) | Sequential and concurrent 2-message bursts delivered cleanly; concurrent burst live-triggered the new post-avatar guard (`preview: state changed during image load`) on the stale in-flight message before flushing and updating active notification `2028475556` to `shubul  [4]` on `line_notification_patches.silent.v1` with `actions: custom layout applied` |
| Group burst & multi-room generic summary (Room B group) | Held pre-save (`post: held awaiting local save`), flushed on local commit (`post: flushed after local save`), delivered `test  [2]: shubul` on `NewMessages` (`actions=3`, `mAllowSystemGeneratedContextualActions=false`) alongside multi-room summary `16880000` (`LINE` / `새 메시지가 있습니다`); 0 `AndroidRuntime:E` crashes |

## `0.1.17-dev` Slot generation, generic summary routing, exact DB/timestamp guards & surrogate-safe truncation — 2026-11-24

Required verified matching child account stamps in `NotificationPolicy.resolveGroupSummary`, added per-`(tag, id)` slot generation tracking (`SLOT_GENERATIONS`) and cross-chat pending slot cleanup (`removePendingSlotLocked`), replaced `contentIntent` and cleared room extras on `KEEP_GENERIC` multi-room summaries (`GENERIC_SUMMARY` + launcher fallback), added post-load `snapshotConsistent` re-checks, enforced exact `sourceOrder == posted` / `NativeLine.messageStored` (`MESSAGE_EXISTS_SQL`) readiness and exact `rowTime == expectedTimeMillis` chat-list matching (`CHAT_LIST_CACHE` scoped by `nativeText`), passed `success` through `ChatNotifications.change`, and preserved UTF-16 surrogate pairs in `NotificationPolicy.cleanSingleLine`.

* **Automated checks**: 223 `NotificationPolicy` assertions, 26 Python unit tests (`test_bundle_metadata.py`, `test_i18n_resources.py`, `test_line_test_sender.py`, `test_message_history.py` including `test_message_exists_query_checks_room_id_and_sender`), 2,178 static APK contracts (ARM64), 2,178 (Universal), 2,116 (`Mark as read`-only); `morphe-desktop list-patches` verified `Enabled: true` on all 6 patches.
* **SHA-256**: local `0.1.17-dev` bundle `28498d47f29f80e8b3fc2bd6226639b8f3f7b05599e3365871fb794b478d0775`; S10e-tested signed APK `d000ff785780a2cc694b6083d847675267464b803383019d879213ee8b6ef76a` *(built from identical DEX and patch code immediately prior to bumping `VERSION` from `0.1.16-dev` to `0.1.17-dev`)*.

### Physical S10e (`SM-G970N`, Android 12 / API 31 / One UI 4.1) verification
| Feature / Case | Result |
| --- | --- |
| 1h snooze auto-expiry & `HOLD_PENDING` exact flush | Both Room A (1:1 OA) and Room B (group) returned cleanly to `NewMessages` after 1h; location push queued (`post: held awaiting local save`) and flushed after local commit (`post: flushed after local save`) |
| 80-char emoji boundary truncation | 79 ASCII `'a'` + `😀` truncated to `[위치] ` + 79 `'a'` + `…` with zero unpaired UTF-16 surrogates |
| Exact-timestamp chat-list preview | Inspected LINE's live Chats list via `uiautomator`: confirmed `[위치] 강남역 정확일치 확인` displayed (`HAS_PREFIXED_LOCATION=True`) under strict `rowTime == expectedTimeMillis` |
| Two-room `Quiet 1h` summary preservation & media staging | Tapped `1시간 조용히` on Room A (`ROOM_A_V17_TEST`): Room A (`2028475556`) canceled, Room B (`568452307`, 3 messages + sticker preview `m_02e34420551d2ca4.png`) preserved, and summary `16880000` (`summary: kept remaining room`) rewritten to Room B (`ccbc8644…`); 0 `AndroidRuntime:E` crashes |

## `0.1.16-dev` Pending account isolation, group summary preservation & CI test coverage — 2026-11-24

Isolated held pending notifications by `ChatKey(account, chat)` with pre-transform and pre-notify active-account checks, replaced global `clearSummaries()` with `Notifications.cancelChatNotifications` + `NotificationPolicy.resolveGroupSummary` (updating `shortcutId`, `line.chat.id`, `line.message.id`, title/text, and `publicVersion` after Android `recoverBuilder.build()`), added `mediaPreviewGeneration` under `PREVIEW_FILE_LOCK` with post-load re-checks, and gated both `scripts/build.py` and `.github/workflows/release.yml` on the full 25-test Python suite (`test_*.py`).

* **Automated checks**: 215 `NotificationPolicy` assertions, 25 Python unit tests (`test_bundle_metadata.py`, `test_i18n_resources.py`, `test_line_test_sender.py`, `test_message_history.py`), 2,078 static APK contracts (ARM64), 2,078 (Universal), 2,016 (`Mark as read`-only); `morphe-desktop list-patches` verified `Enabled: true` on all 6 patches.
* **SHA-256**: local `0.1.16-dev` bundle `3874871e12eee720b78fbf9d3c71b2eb063afff081327da68e314f70301485fa`; S10e-tested signed APK `c4fed6aae60fac9658a8a934720d8ee7be81687811711a1d9751eea8d8cc4c8c` *(built from identical DEX and patch code immediately prior to bumping `VERSION` from `0.1.15-dev` to `0.1.16-dev`)*.

### Physical S10e (`SM-G970N`, Android 12 / API 31 / One UI 4.1) verification
| Feature / Case | Result |
| --- | --- |
| Held pending local-save flush (`HOLD_PENDING`) | Location push queued (`post: held awaiting local save`) and flushed cleanly after DB commit (`post: flushed after local save`); 0 `AndroidRuntime:E` crashes |
| Two-room `Quiet 1h` summary preservation (Room A 1:1 + Room B group) | Snoozing Room B (`568452307`) canceled only Room B, kept snoozed Room A (`2028475556`) on `silent.v1`, and rewrote summary `16880000` (`summary: kept remaining room`) so `shortcut`, `line.chat.id`, `line.message.id`, title, and text matched Room A with 0 leftover Room B metadata |
| Last-room `Quiet 1h` summary cleanup | Snoozing remaining Room A cleared both child `2028475556` and group summary `16880000` (`0` active test/summary notifications remaining) |
| Snoozed room follow-up & media preview staging | Follow-up message to snoozed Room A routed silently to `line_notification_patches.silent.v1` (`silent: snoozed 1h`); Room B sticker preview staged via `LineCommonFileProvider` (`media: previews attached`) with lock/generation guard enabled |

## `0.1.15-dev` All 6 patches enabled by default — 2026-11-23

All 6 patches now ship with `default = true` (Morphe Manager no longer requires Expert mode to apply the full suite; every in-app switch in **Notification patch settings** still defaults to OFF), and English documentation and release notes were cleaned of legacy `in Korean` annotations. Runtime extension DEX behavior is unchanged from S10e-verified `0.1.14-dev`.

* **Automated checks**: 209 `NotificationPolicy` assertions, 24 Python unit tests, 1,940 static APK contracts (ARM64), 1,940 (Universal), 1,878 (`Mark as read`-only); `morphe-desktop list-patches` verified `Enabled: true` on all 6 patches (`Index 0..5`).
* **Local bundle SHA-256**: `a34d8102b3e08a415d79026dc167705c01df6f5f01b51e39151c699d54220c3a` (`line-notification-patches-0.1.15-dev.mpp`).

## `0.1.14-dev` Notification controls expansion — 2026-11-23

Added opt-in `@mention` (`@you`/`@All`) and keyword alert bypasses (up to 50 NFC case-insensitive keywords across text, `FILE_NAME`, and location metadata), detailed `[File] <filename>` & `[Location] <place>` labels across notifications/popups/chat list (`tickerText`, `HOLD_PENDING` pre-save buffer, `Lf22/i;`), configurable displayed message count (`1–25`), opt-in photo/video/sticker thumbnail previews via `LineCommonFileProvider` + `MessagingStyle.Message.setData`, and configurable notification button presets (`notification_action_layout`) with local 1-hour room snooze (`SnoozeActions`).

* **Automated checks**: 209 `NotificationPolicy` assertions, 24 Python unit tests (including 7 `test_message_history.py` SQL regression tests and `test_i18n_resources.py` covering 7 qualifiers × 77 `line_notify_*` keys), 1,940 static APK contracts (ARM64), 1,940 (Universal), 1,878 (`Mark as read`-only).
* **Compiled resource check** (`aapt2 dump resources`, ARM64 and Universal validation APKs): 77 `string/line_notify_*` keys, 0 missing locales across `default`, `ko`, `ja`, `zh-rTW`, `zh-rCN`, `th`, `in`.
* **SHA-256**: final release bundle `9238891cbaee2ca1a27045c1d73e115804ae539f73a3469fde2ee349d36441aa`, unsigned ARM64 APK `bebfa48c7a44646e843b2927ba421bd480b59641efcbc015421b2ba934898d95`, S10e-tested signed APK `89ca5772b6f41d82a1be78a7e4e2e375299c5021e7c87213ec4ef521b12fb92d` *(built from identical functional code `d84d04fda16a…` immediately prior to trimming the `PushPatch.kt` description string)*.

### Physical S10e (`SM-G970N`, Android 12 / API 31 / One UI 4.1) verification (`C1dbd577f70e05152968a4580746934b0` test room only)
| Feature / Case | Result |
| --- | --- |
| Same-key updates & stability | All incremental `adb install -r` updates succeeded with data preserved and device `base.apk` SHA-256 matching signed test APKs (`89ca5772…` final test build); 0 `AndroidRuntime:E` / `SecurityException` crashes |
| `@mention` bypass (`silent_mention_bypass`) | Quiet room baseline (`short` → `silent.v1`), direct `@mention` & `@All` → `jp.naver.line.android.notification.NewMessages` (`importance=4`), follow-up `short` → `silent.v1` |
| Detailed `[File]` / `[Location]` popup & chat list | Pre-save push held (`post: held awaiting local save` → 326ms → `post: flushed after local save`), initial popup & chat list showed `[위치] 강남역 팝업 확인`; visually confirmed on device |
| Keyword bypass (`silent_keyword_bypass`) | Non-matching → `silent.v1`; `긴급`, English case-insensitive `URGENT`, and post-save `[위치] 긴급 집합 장소` escalated to `NewMessages`; follow-up `short` → `silent.v1` |
| Displayed message count (`more_chat_info_max_messages`) | With `3개` selected and 5 unread sent, notification retained `test  [5]: shubul` title while showing newest 3 messages (`3/5`..`5/5`) |
| Inline photo & sticker previews (`more_chat_info_media_preview`) | Live sticker + image burst resolved `m_...png` (`image/png`) and `m_...jpg` (`image/jpeg`) via `LineCommonFileProvider` in `MessagingStyle` (`media: previews attached`), 0 permission errors |
| Configurable notification buttons & 1h snooze (`notification_action_layout`) | `읽음 · 1시간 조용히 · 답장` (`actions=3`) verified on `NewMessages` (`importance=4`); tapping `1시간 조용히` cleared active notifications (`0` remaining) and routed subsequent message to `silent.v1` (`importance=2`, `silent: snoozed 1h`) |

## `0.1.13-dev` Typed attachment placeholders in `More Chat Info` — 2026-11-23

Added `attachement_type` lookup to `NativeLine.RECENT_MESSAGES_SQL` and mapped LINE's `ContentType` ordinals in `NotificationPolicy.attachmentPlaceholderKey`/`Fallback` across all 7 supported locales (`[Photo]`, `[Video]`, `[Sticker]`, `[Voice message]`, `[File]`, `[Location]`, `[Contact]`, `[Call]`, `[Gift]`, `[Music]`, with `[Attachment]` fallback).

* **Automated checks**: 130 `NotificationPolicy` assertions, 19 Python unit tests (including `test_selects_attachment_type_including_null` and `test_i18n_resources.py` covering 7 qualifiers × 49 `line_notify_*` keys), 1,187 static APK contracts (ARM64), 1,187 (Universal), 1,147 (`Mark as read`-only).
* **Compiled resource check** (`aapt2 dump resources`, ARM64 and Universal validation APKs): 49 `string/line_notify_*` keys, 0 missing locales across `default`, `ko`, `ja`, `zh-rTW`, `zh-rCN`, `th`, `in`.
* **SHA-256**: bundle `6bd69dc56b516d282f394492848af2b4aac7ea8c32c5c23bc865978805eaeb7d`, unsigned ARM64 APK `224124051d3ea3e58078d7946fdd38e46ab4d9f843745a9f4e2abfdc8abd2b5c`, signed test APK `6da04e48ab131e34a7c646c8a90f91fab42b0a2bca9445b34b57cd24cd1bef5e`.
* **Physical S10e (`SM-G970N`, Android 12 / API 31 / One UI 4.1)**: Data-preserving `adb install -r` succeeded; installed `base.apk` SHA-256 matched `6da04e48…`; `알림 패치 설정` smoke check passed with all 4 switches ON and 0 logcat errors; user confirmed live incoming non-text notifications display distinct localized attachment labels.

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
