# Linimal

**English** | [日本語](README.ja.md) | [繁體中文](README.zh-TW.md) | [ภาษาไทย](README.th.md) | [Bahasa Indonesia](README.id.md)

Linimal is a Morphe patch bundle for the official LINE Android client (GPL-3.0). It hides ads and features you don't use, and lets you control when read receipts are sent. Every feature can be turned on or off individually from LINE's settings screen, and when a feature is off, LINE behaves exactly like the official app.

![Linimal promo video (32 seconds, no audio)](docs/media/linimal-promo.webp)

The names and chat content shown in the promo video are fictional.

Linimal is an independent project and is not an official project of LINE or Morphe.

## Features

- **Hide ads**: the Smart Channel in the chat list, ads on Home, and ads in OpenChat.
- **Hide Agent i and LINE AI entry points**: in 9 places, including Home, Wallet, the chat list search bar, chats, the chat + menu, the photo and video viewer, and Settings.
- **Hide things you don't use**: bottom tabs, icons at the top of the chat list, the chat + menu, and sections on Home.
- **Read without receipt**: read chats opened from the long-press menu or from notifications while keeping them unread. When you're done, use "Mark all as read" to mark them as read.
- **See who read a message in groups**: show the number of readers and their icons next to "Read" or on others' messages, and open a list of members who have and haven't read it by tapping "Read" or from the long-press menu.
- **Pure black dark mode**: makes the background and bottom tabs black (`#000000`) for OLED screens.
- **Other**: hide LINE Premium prompts, disable chat previews or make them scrollable, open links in an external browser, and support for notifications and Google login and backup.

Ads, Premium, and Agent i / LINE AI are only hidden. Ad delivery, billing, and LINE's network traffic are not changed.

## Supported version

| Item | Value |
| --- | --- |
| App | LINE (`jp.naver.line.android`) |
| Version | 26.16.0 (versionCode 261600106) |
| Architecture | arm64-v8a |
| Input format | APKM |

Other versions are not supported. Pass the APKM to Morphe as is. Applying with `--force` is not supported.

## Installation

### Morphe Manager (Android)

Open the following link on your Android device to add Linimal to Morphe Manager as a patch source. Morphe detects new releases automatically.

[**➕ Add Linimal to Morphe**](https://morphe.software/add-source?github=uta-a/linimal)

To add it from an `.mpp` file instead, tap `+` on the patch sources screen, choose `Local`, and select `patches-*.mpp` from the [releases](https://github.com/uta-a/linimal/releases). This method does not update automatically.

Select the LINE APKM and apply `Linimal`.

### Morphe Desktop (CLI)

Requires Java 21 or later.

```sh
java -jar morphe-desktop-*-all.jar patch \
  --patches patches-*.mpp \
  --out line-linimal.apk \
  <LINE APKM>
```

### Migrating from the official LINE app

The patched LINE has a different signature from the official app, so it cannot be installed over it. Migrate in this order:

1. Complete the [MicroG-RE setup](#use-microg-re-for-google-login-and-backup).
2. In the official LINE app, back up your chats to Google Drive.
3. Uninstall the official LINE app and install the LINE patched with Linimal.
4. Log in and restore from Google Drive.

## Usage

`Linimal` is added at the bottom of LINE's settings screen. Its settings are split into 7 pages: `Ads`, `Agent i & LINE AI`, `Hide items`, `Read receipts`, `Readers`, `Theme`, and `General`.

Linimal's settings screen, messages, and notifications follow LINE's display language and are shown in Japanese, English, Traditional Chinese, Thai, or Indonesian. Other languages fall back to English.

The defaults below apply to new installs. Your settings are kept when you update. If a feature can't find its target (for example, because LINE changed), it is disabled automatically and can't be changed on the settings screen.

Display settings that hide parts of the screen take effect after the app restarts. When you change one, Linimal asks whether to restart.

## Settings

| Page | Setting | Default | Description |
| --- | --- | --- | --- |
| Ads | Hide Smart Channel ads | ON | Hides the Smart Channel at the top of the chat list. |
| Ads | Hide ads on Home | ON | Hides ad slots on Home and ad cards in the feed. |
| Ads | Hide OpenChat ads | ON | Hides ads in OpenChat chats, threads, and notes. |
| Agent i & LINE AI | Hide Agent i at the top of Home | ON | |
| Agent i & LINE AI | Hide Agent i at the top of Wallet | ON | |
| Agent i & LINE AI | Hide Agent i in the chat list search bar | ON | The search bar widens to fill the space. |
| Agent i & LINE AI | Hide Agent i in chat info | ON | |
| Agent i & LINE AI | Hide Agent i in the message box | ON | Hides Agent i and AI reply suggestions in the message box. |
| Agent i & LINE AI | Hide Agent i in the + menu | ON | Hides the "Show Agent i in chat" toggle at the top of the chat + menu. |
| Agent i & LINE AI | Hide LINE AI in the message long-press menu | ON | Also removes the LINE AI button next to image messages. |
| Agent i & LINE AI | Hide LINE AI in the photo and video viewer | ON | |
| Agent i & LINE AI | Hide Agent i in Settings | ON | |
| Hide items | Hide Shopping / News / Wallet / Apps | OFF | Removes them from the bottom tabs. VOOM is always removed regardless of settings because the service has ended. |
| Hide items | Hide AI Friends / Calendar / OpenChat | OFF | Hides the icons at the top of the chat list. |
| Hide items | Hide Calendar / LINE Gift / LINE Pay | OFF | Removes them from the chat + menu. |
| Hide items | Hide recommendations / trending / post cards on Home / live streams / featured collections / recent history | OFF | Hides each section on Home. |
| Read receipts | Add "Read without receipt" to the menu | OFF | Chats opened from the long-press menu (or from the preview's menu when scroll previews are shown) stay unread. Shows a manual read button for each received message and a button to mark the whole chat as read. By default, sending a message marks the chat as read. |
| Read receipts | Open from notifications without read receipt | OFF | Applies the same unread handling and manual read buttons to regular chats opened from notifications. By default, sending a message marks the chat as read. Independent of the menu setting. |
| Read receipts | Keep unread after sending | OFF | In chats opened without read receipts, receipts stay off even after you send a message. What you actually read and reply to won't match what the other person sees, which may cause misunderstandings or trouble. |
| Read receipts | Stop automatic read receipts in chats | OFF | In regular chats, only manual read actions are sent. While reading without receipts, if "Keep unread after sending" is off, a read receipt is allowed once when you send a message. OpenChat and similar chats are not covered. |
| Readers | Show icons next to the read mark | OFF | In groups and multi-person chats, shows icons of up to 4 members who read your message next to "Read". |
| Readers | Show read count on others' messages | OFF | Shows "Read N" above the time on others' messages, counting readers other than the sender and you. |
| Readers | Show reader icons on others' messages | OFF | Shows the icons of members who read it above the time on others' messages. When both this and the read count are on, the icons appear outside the read count (farther from the bubble). |
| Readers | Tap the read mark to open the list | OFF | Tapping "Read" on your messages, or the read count or icons on others' messages, opens a list of members who have and haven't read it. |
| Readers | Add "Readers" to the long-press menu | OFF | Opens the same list from the message long-press menu. Also works on others' messages. |
| Readers | Sync with the server when opening the list | OFF | See below. |
| Theme | Pure black background in dark mode | OFF | When the device is in dark mode, makes the screen background, bottom tabs, and navigation bar pure black (`#000000`). Cards and bubbles keep their original colors. Parts colored by themes don't change. Takes effect after a restart. |
| General | Hide Premium prompts | OFF | Hides the LINE Premium prompt shown when you unsend a message. |
| General | Hide Premium in Settings | OFF | Hides the Premium row on LINE's settings screen. |
| General | Disable chat previews | OFF | Long-pressing a chat in the chat list opens the classic long-press menu instead of the preview. While on, the two preview settings below can't be changed (their saved values are kept). LINE Labs and your Premium subscription don't change. Takes effect after a restart. |
| General | Hide Premium prompts in previews | OFF | Hides the LINE Premium prompt and menu row in the scroll preview. The "You can scroll the screen" message stays. |
| General | Make previews scrollable | OFF | Lets you scroll the chat preview opened by a long press. Does not change when previews are offered. Takes effect after a restart. |
| General | Open links in an external browser | OFF | Opens http / https links in chat text, rich messages, rich menus, and cards in your device's browser. LINE login and payment links open as before. |
| General | Get notifications while the app is closed | ON | See below. |
| General | Use MicroG-RE for Google login and backup | ON | See below. |

## Read without receipt

Read receipts and clearing the local unread state are paused only for the reading session of a regular chat opened from the long-press menu.

### Opening a chat

In LINE 26.16.0, on accounts that have scroll previews, long-pressing a chat opens a preview screen instead of the menu. In that case, Linimal adds the same row at the top of the menu at the bottom of the preview. If you turn on "Disable chat previews" under General and restart, a long press opens the classic menu again, and the same row appears in that menu. Tapping it closes the preview and opens the chat without sending a read receipt. By default, whether the preview can be scrolled follows LINE's own logic. Turn on "Make previews scrollable" under General and restart to make it scrollable. This does not add previews to accounts that don't have them, and billing and network traffic are not changed. Read receipts stay paused when the app briefly goes to the background, the screen locks, you view photos or videos, or you keep reading for a long time. When the screen is recreated because of a configuration change, the session continues only if its saved marker matches.

### What you see while reading and "Mark all as read"

While read receipts are off, "Read receipts are off. Sending a message will mark this chat as read" stays visible right below the chat name header. The header itself doesn't move. The message reappears when you return from the background or the lock screen, and disappears when sending turns read receipts back on or when you leave the chat. It isn't shown in chats opened normally.

"Mark all as read" floats above the message box.
Space matching the button's height is added at the bottom of the list so the latest message isn't hidden behind the button.

Tapping it runs LINE's own read and unread-clearing logic, and on success ends the reading session and returns to normal LINE behavior.
If it is interrupted before sending, the session continues. If the network fails, LINE's own read logic keeps the request and retries it, so Linimal returns to normal behavior.
This works even when "Keep unread after sending" or "Stop automatic read receipts in chats" is on.

There is no way to mark messages as read only up to a certain point. Sending only the tapped position still marked every message as read in the other person's official LINE for web, as confirmed on a real device, so this was removed.

### When you send a message

By default, sending a message while reading ends the pause, and LINE's existing logic applies the local unread state and the read receipt at that moment. This covers text, stickers, images, and other sends queued from verified parts of the chat UI. Canceling input or failing before the message is queued does not end the pause. Linimal doesn't wait for the network send to finish. Even when "Stop automatic read receipts in chats" is on, this one read receipt is allowed once, after which your existing settings apply.

"Keep unread after sending" is off by default. When on, chats opened without read receipts from the menu or notifications stay paused and keep their unread badge even after you send, and the banner changes to "Read receipts are off. Sending a message won't mark this chat as read". Read receipts in chats opened normally are not changed. Existing settings are kept, and updates never turn this setting on by themselves.

**Caution: even if you read and reply, the other person still sees your messages as unread. What actually happens won't match the read status, which may cause misunderstandings or trouble, so only turn this on when you need it.**

### When reading ends

The pause ends when you close the chat, switch to another chat, or turn off the read-without-receipt setting you used to open it. Reopening the same chat normally doesn't bring the pause back. If you turn off only "Keep unread after sending", the read receipt is applied on your next send. Only a pending reservation for a chat screen that was never confirmed to open is discarded after 30 minutes on a monotonic clock. If Linimal can't confirm the owner or observe the end of the session, it falls back to LINE's own read logic.

### Opening from notifications

When "Open from notifications without read receipt" is on, the same reading session pause applies to regular chats opened from message notifications. Merely receiving a notification doesn't start a pause. Chats opened normally, such as from the chat list, and the reply and mark-as-read actions in notifications are not covered. Other paths, such as OpenChat, are not covered either. Turning off the notification setting ends only sessions started from notifications.

## Readers

The list is built from the read records LINE saves on this device to show "Read N", so the count matches "Read N". Linimal never records read status on its own or sends read receipts.

- Groups and multi-person chats are supported. Nothing is shown in one-on-one chats or OpenChat.
- Members who haven't read it are the current members minus those who have. You and the sender are not included in the list.
- Display names prefer the names you set. Icons are fetched as thumbnails from the same public CDN LINE uses (`profile.line-scdn.net`) and kept only in memory.
- When `Sync with the server when opening the list` is on, each time you open the list Linimal runs the same read sync LINE runs periodically, for that chat only, and then refreshes the list. When off, only the records on the device are used and nothing is sent for syncing.

## Notifications and Google integration

### Get notifications while the app is closed

Because the patched LINE has a different signature, it doesn't receive notifications while the app is closed as is. This setting replaces the signature info sent to Google when registering for notifications with that of the official LINE app. No extra setup is needed.

### Use MicroG-RE for Google login and backup

As is, the patched LINE can't log in with a Google account or back up to and restore from Google Drive. This setting performs only that authorization through [MicroG-RE](https://github.com/MorpheApp/MicroG-RE). To use it, you need to:

1. Install an [official MicroG-RE release](https://github.com/MorpheApp/MicroG-RE/releases). Anything other than an official release (another fork or your own build) is not used.
2. Add the Google account you use for LINE login and backup to MicroG-RE. For backups, only accounts added to MicroG-RE appear as choices. If you previously set up automatic backup with a different account, choose the account again in the backup settings.

If you try to log in with a Google account, back up, or restore without MicroG-RE, a message and a notification explain how to install it. The message is shown even right after a fresh install when notifications aren't allowed yet.

If a backup or restore fails with "Can't access LINE", a "Google Drive authorization failed" notification shows either a failure to connect to MicroG-RE or the error MicroG-RE returned (such as `NetworkError`). The notification also includes the MicroG-RE, LINE, and Android versions (but not your email address). Please include its content when reporting a problem. If it fails without a notification, first check that LINE notifications are allowed (including the "Linimal: Backup authorization errors" category). If notifications are allowed and none appears, the failure may be somewhere other than getting the token, such as communicating with Google Drive.

> [!WARNING]
> The notification and Google integration features misreport the app's signature to Google as the official one. This may violate Google's or LINE's terms of service, and effects on your Google account can't be ruled out. They may also stop working due to changes on Google's side or in MicroG-RE.

## Development

Building requires Java 17 and credentials to read Morphe's GitHub Packages. Set `gpr.user` and `gpr.key` in `~/.gradle/gradle.properties`, or pass them with the `GITHUB_ACTOR` and `GITHUB_TOKEN` environment variables. Don't put credentials in the repository.

```sh
./gradlew test buildAndroid
```

The patch bundle is written to `patches/build/libs/patches-*.mpp`. APKs, APKMs, signing keys, and decompiled output are not committed. Design decisions are in [docs/adr](docs/adr) and analyses in [docs/analysis](docs/analysis) (both in Japanese).

## License

Licensed under the [GNU General Public License v3.0](LICENSE). See [NOTICE](NOTICE) for additional terms regarding the Morphe name and trademarks.
