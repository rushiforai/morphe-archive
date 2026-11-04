# Conduit Patches

Extra features and privacy options for Discord on Android, patched in with **[Morphe](https://morphe.software)**. No tracking, and everything works offline except ReviewDB, Translate messages, Fix link previews and Bring back Tenor GIFs.

[**Add to Morphe**](https://morphe.software/add-source?github=lildanlid1/Cordly&name=Conduit) · [Downloads](https://github.com/lildanlid1/Cordly/releases) · [What's new](CHANGELOG.md) · [Report a problem](https://github.com/lildanlid1/Cordly/issues)

**Works with:** Discord **351.11 - Stable** (the original APKM).

## Install

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager/releases).
2. Tap **[Add to Morphe](https://morphe.software/add-source?github=lildanlid1/Cordly&name=Conduit)**, or add `https://github.com/lildanlid1/Cordly` as a source.
3. Pick the **original** Discord 351.11 APKM, not an already patched one.
4. Keep the default selection (everything except **Custom branding**), then patch and install.
5. Open **Discord Settings → Conduit → Features** and turn on what you want. Everything starts off.

You can also import `patches-<version>.mpp` from [Releases](https://github.com/lildanlid1/Cordly/releases) under **Sources → + → Local**.

> The patched app is signed with your key, so you may need to uninstall official Discord first (which deletes its local data), unless you use [Custom branding](#custom-branding). Keep the same signing key so updates install over the top.

## Features

| Group | Feature | What it does |
| --- | --- | --- |
| **Messages** | Keep deleted messages | Deleted messages and edit history stay in chat, with a searchable message log |
| | Bulk delete messages | Select and delete many messages at once, even across chats |
| | Hide blocked or ignored messages | Removes blocked and ignored message rows (based on RemoveBlockedUsers) |
| | Message highlights | Custom colors and bar width for replies and mentions |
| | Translate messages | Translate a whole chat or a single message, automatically or on request |
| | Double-tap to reply | Double-tap to reply or edit your own message; optional triple-tap to delete |
| | Load full-quality images | Loads original images instead of compressed copies (based on Uncompressed Discord Images by Knewest and HighResProfileImages by Kawtious) |
| | Skip delete confirmation | No "Are you sure?" when deleting messages |
| | Skip pin confirmation | No "Are you sure?" when pinning (based on NoConfirmPin by Skamt) |
| | Download voice messages | A download button under every voice message (based on VoiceDownload by puv) |
| | Keep media playing | Audio keeps playing in the background, videos pop out into a small window |
| | Banners in Do Not Disturb | Silent in-app message banners while on Do Not Disturb |
| | Always trust links and files | No link or download warnings (based on AlwaysTrust by zt and Trwy) |
| | Jump to first message | Go straight to the start of a chat |
| | Favourite any image or video | Save any image or video to your GIF favourites |
| **Sending** | Send Nitro stickers and emojis as links | Sends Nitro emojis and stickers as image links |
| | Bring back Tenor GIFs | Tenor GIFs in Discord's GIF picker |
| | Fix link previews | Working embeds for X, Instagram, TikTok, Reddit and more, with tracking removed |
| | Send audio as voice messages | Audio files are sent as voice messages |
| | Send long messages | Messages over the limit are sent in parts |
| | Hide typing indicator | Others won't see you typing |
| | Show file sizes when attaching | File sizes in the media picker |
| | Anonymous file names | Sent files get random names (based on Anonymous File Names by k1ng_op) |
| | Tap mentions to open profiles | Tap a typed @mention to open that profile (based on ClickableMentions by mwittrien) |
| | Expand the message bar | A button that makes the message bar taller |
| | Compress big files | Shrinks photos, videos and audio to fit the upload limit |
| | Reply without pinging | Replies start with the ping off |
| | View raw data | See the raw JSON of messages, channels, servers, people and roles |
| | Edit without "(edited)" | Edits your latest message without the tag by resending it |
| | Delete without a trace | Blanks a message before deleting it, so loggers keep nothing |
| | Edit messages on this phone | Change how any message reads, only on your phone |
| **People** | Pastel name colors | Soft colors for names without a role color |
| | Show device indicators | Device icons next to names |
| | Show owner and mod tags | Owner, Admin and Mod tags in chat (based on StaffTag by mwittrien) |
| | Alert when you're removed | Know when you're unfriended, kicked or banned (based on RemovedConnectionAlerts by iyu46) |
| | Fix unknown mentions | Shows names instead of @unknown-user |
| | Copy profile bios | Select and copy profile bios |
| | Leave group DMs silently | Leave without the "left the group" message (based on SilentLeave by coder.gg) |
| | Show timeout duration | Shows how long someone is timed out (based on ShowTimeoutDuration by Ven) |
| | User and server reviews | Reviews from ReviewDB |
| | User activity notifications | Notices and a log when chosen people change status, type or message |
| | Account switcher | Switch between up to 50 accounts, with notifications from all of them |
| | Listen along | Listen along to a friend's Spotify (needs Premium; by maayan080) |
| | HypeSquad house | Join or leave a HypeSquad house |
| | Custom idle time | Choose when you go Idle, or never |
| | Mutual group DMs | Group DMs you share with someone, on their profile |
| | Platform spoof | Show as desktop, web or console. **Against Discord's rules, may risk your account** |
| **Servers** | Read all button | Mark everything as read in one tap |
| | Show hidden channels | Shows channels you can't open, with a lock |
| | Server info | Live server details from its icon |
| | Edit servers locally | Your own server names and icons, only on your phone (based on EditServers by mwittrien) |
| | Clone emojis and stickers | Add any emoji or sticker to your own server (based on ExpressionCloner by Ven) |
| | Clean channel names | Strips emoji, symbols and fancy fonts from channel names |
| | Preview servers without joining | Browse servers that allow previews without joining (based on GuildLurk by fshin) |
| | Pause invites | Pause a server's invites until you resume them (needs Manage Server) |
| | Fast delete channels | Delete channels without confirmation. **No undo** |
| **Appearance** | Use your phone's font | Your phone's font everywhere |
| | Use your phone's emojis | Your phone's emojis, or an imported emoji font |
| | Remove anything | Hide almost any button or menu row in Discord |
| | Conduit button on profile bar | A shortcut to Conduit settings |
| | Unlock app icons | Any app icon without Nitro |
| | Unlock Nitro themes | Gradient themes without Nitro, only on your phone |
| | Full-screen chat in landscape | Chat fills the screen sideways |
| | Material You colors | Colors from your wallpaper or a color you pick |
| | Custom themes | Revenge and Vendetta themes |
| | Icon packs | Replace Discord's icons with an icon pack |
| **Quests** | Complete Quests automatically | Finishes video, Play and timed Activity Quests (not achievement Quests) |
| | Complete badges automatically | **Risky, experimental.** Earns game-time badges in the background |
| **Advanced** | Unlock Discord experiments | Dev Tools and Experiments in Settings (based on Experiments by maisy) |
| | Keep Bluetooth audio clear in calls | Keeps headphones in music quality during calls |
| | Voice channel options | Join volume, audio output, join chimes and a goodbye sound |
| | Fake deafen | Look deafened while still hearing the call (by maayan080) |

Conduit settings also have **Language** (30 languages), **Backup and restore**, and **About** with debug logs and a crash screen.

### Custom branding

Select **Custom branding** in Morphe to install Conduit next to Discord. Options: **App name**, **Package name** (`com.discord.venus` by default), **Icon color** and **Icon picture**. The copy is a separate app with its own sign-in and settings; keep the same package name so updates install over the top.

### Privacy options

Selected by default in Morphe; nothing to turn on. Patch again to change them.

| Option | What it stops |
| --- | --- |
| **Disable analytics** | Discord's usage tracking |
| **Disable crash reporting** | Crash reports sent to Sentry |
| **Disable telemetry and touch logging** | Performance tracking and tap logging |
| **Disable advertising identifiers** | Reading your Google advertising ID |
| **Disable install attribution** | AppsFlyer install tracking |

## For developers

```bash
python3 scripts/build.py    # builds and tests patches/build/libs/*.mpp
```

## License

[GPL-3.0](LICENSE). Notices are in [NOTICE](NOTICE).

## Conduit additions

[![Add Conduit to Morphe](.github/assets/add-to-morphe.svg)](https://morphe.software/add-source?github=lildanlid1/Cordly)

Conduit 1.25.0 incorporates Venus Patches 1.21.1 for Discord **351.11 Stable**. Original authorship and GPL-3.0 credits remain in NOTICE. The Android app keeps the Discord name and package.

Server info shows server emojis directly. Tap artwork or an emoji to preview it; hold the image to open Save. Show all opens the searchable gallery with selection and ZIP export. Server layout exports and the bot importer remain available. The upstream **View raw data** tool replaces Inspect message JSON and covers more object types; its previous enabled setting migrates.

**Rich Presence** publishes through Discord's local activity pipeline. Enter your Discord application ID, activity name, details, state, type and image URLs. Enable elapsed time to count from Start/update. Start explicitly after reopening; Stop removes only Conduit's custom activity. Visibility follows Discord's activity-sharing and privacy settings; other users do not need Conduit. Publishing still needs an on-device, second-account check.

For device images, choose an upload channel ID and press Upload large/small image. This posts an attachment in that channel and uses its CDN URL. Anyone able to read the channel can see that message. URLs must be publicly accessible HTTPS images. Uploads are limited to 8 MiB.

Unlock experiments waits until the signed-in connection has initialized and never loads UserStore from a startup staff check. Existing experiment overrides are not cleared automatically.
