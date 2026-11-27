# Compatibility & Implementation Notes

Declared target: `jp.naver.line.android` / `26.19.0` / `261900178` (`isExperimental = false`). Even if Morphe Manager's version check is bypassed, `verifiedLineVersionPatch` re-validates package name, version name, and version code internally.

Recent message lookup (`NativeLine.RECENT_MESSAGES_SQL`) selects the latest unread messages up to the configured limit (`1–25`, default `25`, columns `server_id, created_time, from_mid, content, attachement_type, parameter, location_name, location_address, id, attachement_local_uri`) ordered by `created_time DESC, CAST(server_id AS INTEGER) DESC`. Real Official Account batch tests (`0.1.8-dev`) showed that `server_id` order can differ from creation timestamp order within batched pushes; the read boundary comparison still follows LINE's native `server_id` boundary. When `content` is empty, `NotificationPolicy.attachmentPlaceholderKey`/`Fallback` maps `attachement_type` (`IMAGE`/`EXTIMAGE`, `VIDEO`, `STICKER`, `AUDIO`, `PDF`/`FILE`, `LOCATION`, `CONTACT`, `CALL`, `GIFT`, `MUSIC`, default `[Attachment]`), and `attachmentDetail` appends sanitized `FILE_NAME` (from tab-delimited `parameter`) or `location_name` / `location_address` metadata. When opt-in `Alert on @mentions` or `Alert on keywords` is enabled, `NativeLine.MESSAGE_METADATA_SQL` checks `parameter` (`MENTION` JSON `"MENTIONEES"` for direct `@you` or `@All` `"A":"1"`) and up to 50 NFC case-insensitive keywords across `content`, `FILE_NAME`, `location_name`, and `location_address` so matching messages in quiet chats deliver on LINE's original audible channel (with channel escalation if persisted slightly after the initial post), while completely hidden chats stay suppressed.

Because Android notification posting is asynchronous, a save/post event can complete before the final child notification finishes registering. When `More Chat Info` observes an uncommitted incoming message push (`PreviewState.NATIVE`), `Notifications.postInternal` briefly holds that room's notification (`HOLD_PENDING`, max `1200ms` safety timeout) and flushes immediately inside `Notifications.onMessageStored` so initial heads-up/Brief popups (`tickerText` and `contentText` updated by `ConversationPreview.apply`) already carry the resolved `[File]`/`[Location]` label and channel. `Notifications.deferRefresh` then coalesces each room's burst into one trailing refresh after `400ms` on `REFRESH_WORKER`. When `More Chat Info` is enabled, `u52.i.<init>` also resolves typed attachment previews for the LINE chat list via a bounded 256-entry LRU cache over `NativeLine.LATEST_CHAT_MESSAGE_SQL` (`OPEN_READONLY`). None of these paths poll, write native DBs, create absent notifications, or make network requests.

## Inspected APKM inputs

| Variant | ABIs | Densities | Min SDK |
| --- | --- | --- | --- |
| `1arch_2dpi` (arm64) | `arm64-v8a` | `480`, `640` dpi | API 30 (Android 11) |
| `2arch_6dpi` (universal alias) | `arm64-v8a`, `armeabi-v7a` | 6 densities (`120`–`480` dpi) | API 32 (Android 12L) |

All **14 DEX files are identical** between the two APKMs; only split resources and native libraries differ. (`universal` is a local working alias, not all-ABI support.)

| Input | SHA-256 |
| --- | --- |
| arm64 APKM | `854c7c98b4880d30ff7a363210016f0d2fed70bccbe32d8a188a8df3d8fbd040` |
| arm64 `base.apk` | `04c4e969baa75d4f72efdd953aea850c7d3ecb3527a2044aee3ac0aff4189d99` |
| universal APKM | `ce7be5ca770739731ec44665cdd94e4e0d601149144e416aef1c0b904a3701e2` |
| universal `base.apk` | `5234750455cf0757edcc9de5c1d4e05ed7c5ee1a82405225fae99455e2adefe6` |

Both original `base.apk` files passed APK signature verification: lineage-root certificate SHA-256 `e682fe0bcd60907dfed515e0b8a4de03aa1c281d111a07833986602b6098afd2` (SHA-1 `89396DC419292473972813922867E6973D6F5C50`), rotated certificate SHA-256 `e6e8036e01234e919fbe9cf9ea5d210435cfc0542328641aa70a018f52f63cf8` (SHA-1 `6A2927D945AEA6571E1DA5566802F25045D367BD`).

## LINE `26.19.0` DEX bindings

| Role | Verified location |
| --- | --- |
| Initialization | `LineApplication.onCreate` |
| Settings entry row | `un5.s1.<clinit>` / `un5.s1.a` identified via `AboutLine` / `MORETAB_SETTINGS_ABOUTLINE`; constructs 13-param `ti5.a0.<init>` (using dead scratch `v1` + `move-object/from16` for `v16` > `v15`), inserted below Profile |
| Patch settings UI | Reuses LINE's `Header` (`setUpButtonVisibility$common_libs`), `line_user_settings_switch_item_view`, `line_user_settings_text_item_view` (`setDuplicateParentStateEnabled(false)`); uses `setDecorFitsSystemWindows(false)` + `OnApplyWindowInsetsListener` (`systemBars() \| displayCutout()`, `WindowInsets.CONSUMED`) for API 30–36 |
| Silent-room notification gates | Single `ke8.z.z` call in `k34.i.b` and regular-chat `ke8.z.z` call in `yi8.a.d` |
| Pre-post child + summary suppression | `h34.f.b` (9 regs, `p4 = v7:Lyi8/e;`, extras field `p`) |
| Notification publish transform | Framework `NotificationManager.notify` call inside `androidx.core.app.r.a` |
| Post-save active notification refresh | Immediately after synchronous `iq8.g.a` non-null result in `kk8.c3.f` → `Notifications.onMessageStored(chat)` |
| Active account | `bd0.f.a(context, dw3.b.M1)` → `dw3.b.getProfile()` → `gw3.a.b` |
| Room name, read boundary, total unread | `ke8.o1.a` → `ke8.z.t()` → `yl3.e.y1` → `ln3.k` (`b`, `m`, `n.b`) |
| Message preview setting | `ch8.i.c` |
| Per-room notification flag | `bd0.f.a(context, ch8.c$a.c)` → `ch8.c.a` → `eh8.e.b` (`!b`) |
| Chat-menu Mute/Unmute toggle | `i60.w1.invoke` immediately after native callback creation → `Settings.interceptToggle` |
| Chat-menu presentation state | UI Parcelable `i60.a4` constructor (17 params, 18 regs) field `l` (`v12`) → `Settings.menuNotifiable` |
| Chat-list long-press Mute/Unmute toggle | `t72.c.E5` regular-chat (`u52.j`) branch → `Settings.interceptChatListToggle` (OpenChat `u52.z` & ServiceChat `u52.w` untouched) |
| Chat-list icon/label state & UI refresh | UI model `u52.i` constructor fields `f` (`Settings.menuNotifiable`) and `h` (`Settings.chatListLastMessage`); live refresh via `com.linecorp.rxeventbus.d.b(n88.b.CHAT_LIST)` |
| Native room notification setter | `yl3.e.t(chat, enabled, continuation)` with `sm8.c`-based continuation bridge |
| Complete-hide chat menu row | Single `yb8.f.n(Collection)` call in `ChatHistoryMenuFragment.onViewCreated`, native `m60.y` row |
| Notification action service | Non-exported `LineAccessServiceForNotification.onStartCommand` (`MUTE_CURRENT_CHAT_ACTION`, private `MARK_CHAT_AS_READ`, private `SNOOZE_CHAT_1H` local 1-hour snooze; custom action presets via `Settings.actionLayout`; native builders `yi8.n.b`/`c` returning `androidx.core.app.h` with `0x7f152a17`/`0x7f152a18`) |
| Native chat-list read updater | `bd0.f.a(context, x30.d.a)` → `x30.d.b()` → `yl3.s0.a` → `tn3.e.e(chatId)` |
| Post-read room notification cleanup | `q08.b` completion callback (`onComplete()` / `b(r08.b)` `onSubscribe`) → `j34.h.c(...)` with `j34.l.a(chat)` and `j34.l.c(chat)` |
| Push registration (default on) | FIS `sz.c.c` `X-Android-Cert` / `URLConnection.addRequestProperty` (`fs.a.a` / `fs.g.b` untouched) |
| Expanded notification sender avatars | 1:1 reuses original `largeIcon`/`sender_person`; group reads `contacts.picture_path` + LINE Glide local cache only (`x55.e`, `o.j()`, `n.W()`, `n.X(Integer.MIN_VALUE, Integer.MIN_VALUE)` → `to.c`, `to.a.r(true)`=`onlyRetrieveFromCache(true)`, `co.l.b`, `to.a.d()`) |
| Inline notification media previews (opt-in) | Checks local message files (`q41.a` `a`/`j`, `attachement_local_uri`) and local sticker files (`f16.d` `p`/`k`/`o`) first, then loads uncached thumbnails via LINE's Glide loader (`DiskCacheStrategy.AUTOMATIC` = `co.l.d`, `p80.e` with `PREVIEW_URL`/`OBS_POP`/E2EE `fi1.a$c`, `line.sticker.url`, `f16.p.o(n16.e)`, `n.X(Integer.MIN_VALUE, Integer.MIN_VALUE)`) within a bounded budget; stages non-PII SHA-256 resized thumbnails (max 16 files, wiped on disable) under `cache/external_share/line_notify_previews` and wraps via `LineCommonFileProvider.g.d` for `MessagingStyle.Message.setData` |
| Localized UI & attachment strings (`0.1.12+` / `0.1.14+`) | `NotificationStrings.kt` writes 77 `line_notify_*` keys into LINE's `res/values/strings.xml` and 6 locale directories (`values-ko`, `values-ja`, `values-zh-rTW`, `values-zh-rCN`, `values-th`, `values-in`); the extension resolves them via `Strings.get(...)` using `getIdentifier`, falling back to English literals. Canonical patch names (`Not Too Much Silent`, `More Chat Info`, `No reply`, `Mark as read`) stay in English. |

## Architecture highlights

* **No direct DB writes or custom server APIs**: Local SQLite reads (`naver_line`, `contact`) use `OPEN_READONLY`. User-triggered `Mark as read` and room notification toggles delegate to LINE's native objects (`tn3.e`, `yl3.e.t`), inheriting LINE's normal sync and offline retry handling.
* **Not Too Much Silent (`0.1.3+`, chat list in `0.1.9+`)**: Intercepts regular-chat mute/unmute buttons in the chat menu, chat-list long-press menu, and notification shade to store local quiet state while keeping native push subscriptions active. `i60.a4.l` and `u52.i.f` affect UI presentation only. **Hide notifications completely** calls LINE's native mute setter and suppresses locally; unhiding restores previous quiet or normal state. Existing natively muted rooms are not bulk-migrated.
* **More Chat Info (`0.1.7+`, avatars in `0.1.11+`, count in `0.1.14+`)**: Uses public Android `Notification.MessagingStyle` with a configurable limit (`1–25` recent unread messages, default `25`) and `Room Name  [N]` total unread count. Unused legacy custom-view resources (`NotificationBadgeResources.kt`) were removed in `0.1.10-dev`. Preview lookup exceptions are isolated so transient SQLite errors fall back to the native (silent/normal + action-updated) notification rather than dropping non-hidden messages.
* **Mark as read (`0.1.6+`)**: Marks the entire regular chat read using the exact same cached updater (`tn3.e`) as LINE's chat-list "Mark as read" menu ([LINE Help](https://help.line.me/line/smartphone?contentId=20021705&lang=en)), holds the button until local save completes, works independently of `More Chat Info` and message preview settings, and never attaches to multi-room summaries, OpenChat, call, or ongoing notifications. Completion callbacks represent local completion, not server acknowledgment.
* **Debug logging**: `LineNotifyPatch` logs are disabled unless explicitly enabled via ADB (`setprop log.tag.LineNotifyPatch DEBUG`) and record only fixed stage strings—never account IDs, chat IDs, message content, or exception text.
