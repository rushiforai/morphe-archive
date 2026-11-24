# Compatibility & Implementation Notes

Declared target: `jp.naver.line.android` / `26.16.0` / `261600106` (experimental). Even if Morphe Manager's version check is bypassed, `verifiedLineVersionPatch` re-validates package name, version name, and version code internally.

Recent message lookup (`NativeLine.RECENT_MESSAGES_SQL`) selects the latest unread messages up to the configured limit (`1–25`, default `25`, columns `server_id, created_time, from_mid, content, attachement_type, parameter, location_name, location_address, id, attachement_local_uri`) ordered by `created_time DESC, CAST(server_id AS INTEGER) DESC`. Real Official Account batch tests (`0.1.8-dev`) showed that `server_id` order can differ from creation timestamp order within batched pushes; the read boundary comparison still follows LINE's native `server_id` boundary. When `content` is empty, `NotificationPolicy.attachmentPlaceholderKey`/`Fallback` maps `attachement_type` (`IMAGE`/`EXTIMAGE`, `VIDEO`, `STICKER`, `AUDIO`, `PDF`/`FILE`, `LOCATION`, `CONTACT`, `CALL`, `GIFT`, `MUSIC`, default `[Attachment]`), and `attachmentDetail` appends sanitized `FILE_NAME` (from tab-delimited `parameter`) or `location_name` / `location_address` metadata. When opt-in `Alert on @mentions` or `Alert on keywords` is enabled, `NativeLine.MESSAGE_METADATA_SQL` checks `parameter` (`MENTION` JSON `"MENTIONEES"` for direct `@you` or `@All` `"A":"1"`) and up to 50 NFC case-insensitive keywords across `content`, `FILE_NAME`, `location_name`, and `location_address` so matching messages in quiet chats deliver on LINE's original audible channel (with channel escalation if persisted slightly after the initial post), while completely hidden chats stay suppressed.

Because Android notification posting is asynchronous, a save/post event can complete before the final child notification finishes registering. When `More Chat Info` observes an uncommitted incoming message push (`PreviewState.NATIVE`), `Notifications.postInternal` briefly holds that room's notification (`HOLD_PENDING`, max `1200ms` safety timeout) and flushes immediately inside `Notifications.onMessageStored` so initial heads-up/Brief popups (`tickerText` and `contentText` updated by `ConversationPreview.apply`) already carry the resolved `[File]`/`[Location]` label and channel. `Notifications.deferRefresh` then coalesces each room's burst into one trailing refresh after `400ms` on `REFRESH_WORKER`. When `More Chat Info` is enabled, `f22.i.<init>` also resolves typed attachment previews for the LINE chat list via a bounded 256-entry LRU cache over `NativeLine.LATEST_CHAT_MESSAGE_SQL` (`OPEN_READONLY`). None of these paths poll, write native DBs, create absent notifications, or make network requests.

## Inspected APKM inputs

| Variant | ABIs | Densities | Min SDK |
| --- | --- | --- | --- |
| `1arch_2dpi` (arm64) | `arm64-v8a` | `480`, `640` dpi | API 30 (Android 11) |
| `2arch_6dpi` (universal alias) | `arm64-v8a`, `armeabi-v7a` | 6 densities (`120`–`480` dpi) | API 32 (Android 12L) |

All **14 DEX files are identical** between the two APKMs; only split resources and native libraries differ. (`universal` is a local working alias, not all-ABI support.)

| Input | SHA-256 |
| --- | --- |
| arm64 APKM | `e059b2a35a0c5bcacb9fd0fe1512d099fbc18c2fcab16e0b47788455eff03338` |
| arm64 `base.apk` | `26331d398d421c0bc61d439c6df5fd9492519dd8940f342b5784df4676b96c42` |
| universal APKM | `4a82c3173a935c52dbe96b8768b73a2dda7284b860f37e4982d72b5672dbf1af` |
| universal `base.apk` | `a2a39613d1899d967cd016725e12e14268b6fc6d79386eee8ff821d3a9a90d16` |

Both original `base.apk` files passed APK signature verification: lineage-root certificate SHA-256 `e682fe0bcd60907dfed515e0b8a4de03aa1c281d111a07833986602b6098afd2`, rotated certificate SHA-256 `e6e8036e01234e919fbe9cf9ea5d210435cfc0542328641aa70a018f52f63cf8`.

## LINE `26.16.0` DEX bindings

| Role | Verified location |
| --- | --- |
| Initialization | `LineApplication.onCreate` |
| Settings entry row | Identified via `AboutLine` / `MORETAB_SETTINGS_ABOUTLINE`, inserted below Profile |
| Patch settings UI | Reuses LINE's `Header`, `line_user_settings_switch_item_view`, `line_user_settings_text_item_view`; uses `setDecorFitsSystemWindows(false)` + `OnApplyWindowInsetsListener` (`systemBars() \| displayCutout()`, `WindowInsets.CONSUMED`) for API 30–36 |
| Silent-room notification gates | Single `wk8.l0.x` call in `gw3.i.c` and regular-chat `wk8.l0.x` call in `ip8.c.d` |
| Pre-post child + summary suppression | `dw3.f.b` |
| Notification publish transform | Framework `NotificationManager.notify` call inside `androidx.core.app.k.a` |
| Post-save active notification refresh | Immediately after synchronous `rw8.h.a` non-null result in `uq8.z2.f` → `Notifications.onMessageStored(chat)` |
| Active account | `ap3.b.getProfile()` → `dp3.a.b` |
| Room name, read boundary, total unread | `ue3.k.u1` → `ig3.k` (`b`, `m`, `n.c`) |
| Message preview setting | `nn8.i.c` |
| Per-room notification flag | `nn8.c.a` → `pn8.c.c` |
| Chat-menu Mute/Unmute toggle | `z50.y0.invoke` immediately after native callback creation → `Settings.interceptToggle` |
| Chat-menu presentation state | UI Parcelable `z50.t2` constructor field `m` → `Settings.menuNotifiable` |
| Chat-list long-press Mute/Unmute toggle | `d42.d.u3` regular-chat (`f22.j`) branch → `Settings.interceptChatListToggle` (OpenChat `f22.z` & ServiceChat `f22.w` untouched) |
| Chat-list icon/label state & UI refresh | UI model `f22.i` constructor fields `f` (`Settings.menuNotifiable`) and `h`/`q` (`Settings.chatListLastMessage`); live refresh via `com.linecorp.rxeventbus.d.b(xe8.b.CHAT_LIST)` |
| Native room notification setter | `ue3.k.p(chat, enabled, continuation)` with `dt8.d`-based continuation bridge |
| Complete-hide chat menu row | Single `ji8.f.n(Collection)` call in `ChatHistoryMenuFragment.onViewCreated`, native `d60.z` row |
| Notification action service | Non-exported `LineAccessServiceForNotification.onStartCommand` (`MUTE_CURRENT_CHAT_ACTION`, private `MARK_CHAT_AS_READ`, private `SNOOZE_CHAT_1H` local 1-hour snooze; custom action presets via `Settings.actionLayout`) |
| Native chat-list read updater | `sc0.f.a(context, n30.d.a)` → `n30.d.b()` → `ue3.y0.a` → `qg3.e.e(chatId)` |
| Post-read room notification cleanup | `a78.b` completion callback → `fw3.h.c(...)` with `fw3.l.a(chat)` and `fw3.l.c(chat)` |
| Push registration (default on) | FIS `X-Android-Cert` / `URLConnection.addRequestProperty` |
| Expanded notification sender avatars | 1:1 reuses original `largeIcon`/`sender_person`; group reads `contacts.picture_path` + LINE Glide local cache only (`e80.l0`, `ao.a.s(true)`=`onlyRetrieveFromCache(true)`, `kn.l.b`, `ao.a.d()`) |
| Inline notification media previews (opt-in) | Checks local message files (`j31.a` `e`/`k`, `attachement_local_uri`) and local sticker files (`su5.d` `n`/`k`/`m`) first, then loads uncached thumbnails via LINE's Glide loader (`DiskCacheStrategy.AUTOMATIC` = `kn.l.d`, `e80.d` with `PREVIEW_URL`/`OBS_POP`/E2EE `lg1.a$c`, `line.sticker.url`, `su5.o.h(zu5.d)`) within a bounded budget; stages non-PII SHA-256 resized thumbnails (max 16 files, wiped on disable) under `cache/external_share/line_notify_previews` and wraps via `LineCommonFileProvider.g.d` for `MessagingStyle.Message.setData` |
| Localized UI & attachment strings (`0.1.12+` / `0.1.14+`) | `NotificationStrings.kt` writes 77 `line_notify_*` keys into LINE's `res/values/strings.xml` and 6 locale directories (`values-ko`, `values-ja`, `values-zh-rTW`, `values-zh-rCN`, `values-th`, `values-in`); the extension resolves them via `Strings.get(...)` using `getIdentifier`, falling back to English literals. Canonical patch names (`Not Too Much Silent`, `More Chat Info`, `No reply`, `Mark as read`) stay in English. |

## Architecture highlights

* **No direct DB writes or custom server APIs**: Local SQLite reads (`naver_line`, `contact`) use `OPEN_READONLY`. User-triggered `Mark as read` and room notification toggles delegate to LINE's native objects (`qg3.e`, `ue3.k.p`), inheriting LINE's normal sync and offline retry handling.
* **Not Too Much Silent (`0.1.3+`, chat list in `0.1.9+`)**: Intercepts regular-chat mute/unmute buttons in the chat menu, chat-list long-press menu, and notification shade to store local quiet state while keeping native push subscriptions active. `z50.t2.m` and `f22.i.f` affect UI presentation only. **Hide notifications completely** calls LINE's native mute setter and suppresses locally; unhiding restores previous quiet or normal state. Existing natively muted rooms are not bulk-migrated.
* **More Chat Info (`0.1.7+`, avatars in `0.1.11+`, count in `0.1.14+`)**: Uses public Android `Notification.MessagingStyle` with a configurable limit (`1–25` recent unread messages, default `25`) and `Room Name  [N]` total unread count. Unused legacy custom-view resources (`NotificationBadgeResources.kt`) were removed in `0.1.10-dev`. Preview lookup exceptions are isolated so transient SQLite errors fall back to the native (silent/normal + action-updated) notification rather than dropping non-hidden messages.
* **Mark as read (`0.1.6+`)**: Marks the entire regular chat read using the exact same cached updater (`qg3.e`) as LINE's chat-list "Mark as read" menu ([LINE Help](https://help.line.me/line/smartphone?contentId=20021705&lang=en)), holds the button until local save completes, works independently of `More Chat Info` and message preview settings, and never attaches to multi-room summaries, OpenChat, call, or ongoing notifications. Completion callbacks represent local completion, not server acknowledgment.
* **Debug logging**: `LineNotifyPatch` logs are disabled unless explicitly enabled via ADB (`setprop log.tag.LineNotifyPatch DEBUG`) and record only fixed stage strings—never account IDs, chat IDs, message content, or exception text.
