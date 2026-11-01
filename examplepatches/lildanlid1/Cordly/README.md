# Cordly Patches

Extra features and privacy options for Discord on Android, built into the app with **[Morphe](https://morphe.software)**. Most features work offline; server media downloads, ReviewDB, translation, link previews and Tenor GIFs need internet access. Nothing is downloaded from the internet to run, and nothing is tracked.

**This is the source repository for the independent Cordly Morphe patch bundle, based on Venus Patches.** The original project and its authors remain credited in `NOTICE` and `LICENSE`.

**Works with:** Discord **350.8 - Stable** (the original APKM).

**Cordly 1.23.0 server tools:** Open Server info from the server icon menu to save individual artwork or export the icon, banner and splashes in one ZIP, copy a plain-text server summary, and browse server emojis/stickers. The browser offers search, A–Z/Z–A sorting, all/animated/static filters, Download matching, and copying selected media links (or Discord emoji markup). New: export server blueprints with channels, roles and permission overwrites, and inspect embed/Components V2 message JSON. The companion importer requires an authorized bot and explicit confirmation. The Android app remains Discord (`com.discord`).

## Install with Morphe Manager

[![Add Cordly to Morphe](.github/assets/add-to-morphe.svg)](https://morphe.software/add-source?github=lildanlid1/Cordly)

**Direct link:** https://morphe.software/add-source?github=lildanlid1/Cordly

This link adds **this repository as a remote source**, so Morphe can discover future published versions. It requires a successful GitHub release and generated `patches-bundle.json`; adding the source before the first release will not work. **The Android app keeps its original Discord name, icon, and `com.discord` package.**

### First-time repository publishing

1. Upload **all contents of this project folder**, including hidden `.github/`, to the **root** of [lildanlid1/Cordly](https://github.com/lildanlid1/Cordly) (not a nested `Cordly-Patches/` directory).
2. Enable GitHub Actions and set workflow permissions to **Read and write** in **Settings → Actions → General → Workflow permissions**. The build uses `GITHUB_TOKEN` to create the release and commit its source metadata. No Discord user tokens are needed.
3. Open **Actions → Build and publish Cordly → Run workflow** on `main`. A successful run creates a versioned `.mpp` release, `patches-bundle.json` and `patches-list.json`. Subsequent changes require bumping `version`, `releaseTag`, and `releaseAsset` in `gradle.properties` before publishing a new version.
4. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager/releases) on Android and tap the **Add Cordly to Morphe** link above. Alternatively open **Sources → + → Remote** and paste the GitHub repository URL.
5. Patch an **original Discord 350.8 Stable APKM**. Cordly changes the in-app mod settings, **not** the Android application name. To avoid certificate conflicts, back up your local Discord data and follow Morphe's install guidance.

The `.mpp` is compiled by GitHub Actions; **a source ZIP is not an installable patch**. See [INSTALL-CORDLY.md](INSTALL-CORDLY.md) for full instructions and local build instructions. The patch target and features must be verified on-device after a successful compile.

## Features

Open **Discord Settings → Cordly → Features** to turn things on or off at any time. Type in the search bar at the top to find a feature by its name, what it does or one of its options. The first time you open it, a **Start with the essentials** card at the top turns on eight popular features in one tap (Keep deleted messages, Nitro stickers and emojis as links, Device indicators, Read all, Jump to first message, Fix unknown mentions, Copy profile bios and file sizes). None of them needs a sign-in, an outside service or a restart. **Undo** switches back exactly those, and **Not now** hides the card for good. Rows with an arrow button have more options. Too many rows? Tap **Edit list** under the search bar and tap the eye on any feature you don't use to hide it; tap **Done** when you're finished. Hidden features move to one **features hidden** row at the bottom of the list, which opens to show them (they keep working while hidden, and search still finds them), and **Show all** brings every one back. Backups include what you've hidden, and Reset to defaults leaves it alone. Each feature has the same name in Cordly and in Morphe. **Everything starts off**, so Discord looks and works like normal until you turn on what you want. Your choices from an earlier version are kept.

| Group | Feature | What it does |
| --- | --- | --- |
| **Messages** | Keep deleted messages | Deleted messages stay in chat, outlined in red, and edits keep their history. Pick their color, brightness and how many to keep |
| | Inspect message JSON | Hold an embed or Components V2 message, then open its full cached JSON, embeds or components in a readable viewer. Copy or save JSON to a file |
| | Bulk delete messages | Select multiple messages in chat and delete them all at once |
| | Hide blocked or ignored messages | Removes the "blocked messages" and "ignored messages" rows from chat, and can hide replies to them too. Can also close your DM with someone as soon as you block them, so they leave the Messages list (no messages are deleted). Based on RemoveBlockedUsers |
| | Message highlights | Pick bar width, plus the color and brightness of replies and mentions |
| | Translate messages | Messages in other languages show in yours, automatically or only when you ask: a whole chat from a bar that appears when it has messages in another language, or one message from its menu. Translate into Discord's language, your phone's, or any of 70 others |
| | Double-tap to reply | Double-tap a message to reply, or your own to edit it |
| | Load full-quality images | Pictures in chat and full screen load the file that was uploaded instead of Discord's smaller, compressed copy. Choose chat, full screen or both, and whether GIFs load whole too. Profile pictures and banners load at a high resolution, so they stay sharp in profiles and full screen. Pictures over 16 megapixels stay as Discord sends them so the app doesn't run out of memory. Based on Uncompressed Discord Images by Knewest and HighResProfileImages by Kawtious |
| | Skip delete confirmation | Messages and link previews are removed with no "Are you sure?" |
| | Skip pin confirmation | Pinning and unpinning a message happen at once, with no "Are you sure?". Based on NoConfirmPin by Skamt |
| | Always trust links and files | No "Leaving Discord" before opening links, and no "potentially dangerous download" warning before opening files, each with its own switch. Links Discord knows are harmful stay blocked. Based on AlwaysTrust by zt and Trwy |
| | Jump to first message | A button to go straight to the start of a chat |
| | Favourite any image or video | Star any image or video to keep it in your GIF favourites |
| **Sending** | Send Nitro stickers and emojis as links | Sends Nitro emojis and stickers as links that show as the image |
| | Bring back Tenor GIFs | Tenor GIFs show in Discord's own GIF picker again: search, trending and categories. Mix them with Discord's GIFs or use only Tenor. If Tenor doesn't answer, Discord's own GIFs show |
| | Fix link previews | Links to X, Instagram, TikTok, Reddit, Bluesky, Threads, Tumblr, Facebook, PTT, Twitch clips, Bilibili, pixiv, DeviantArt, Fur Affinity, Imgur and Newgrounds show the post, with its picture or video. YouTube, Spotify, Mastodon and Pinterest can be turned on too. Pick the embed service per site (FxTwitter, vxTwitter or FixEmbed, and so on), translate X and Bluesky posts into Discord's, your phone's or any language, pick a post style (full post, media only, text only, or just the file), Tumblr posts can be drawn dark to match Discord, and share tracking like `?igsh=` is removed |
| | Send audio as voice messages | Audio files are sent as real voice messages, with a waveform |
| | Send long messages | Type past the character limit; long messages are sent in parts |
| | Hide typing indicator | Others won't see when you're typing |
| | Show file sizes when attaching | Photos and videos in the picker show their size |
| | Anonymous file names | Files you send get a random name like `k3Vq9TzL0b.jpg` instead of the one on your phone, so names like `IMG_20261027_142233.jpg` or `Bank statement March.pdf` never reach Discord. The file type stays, so previews and players still work. Spoilers stay spoilers. Based on Anonymous File Names by k1ng_op |
| | Tap mentions to open profiles | Tap an @mention you typed in the message bar to open that person's profile, to check you picked the right one. Typing never opens one. Based on ClickableMentions by mwittrien |
| **People** | Pastel name colors | Names without a role color get a soft pastel color |
| | Show device indicators | Desktop, mobile, web, console or VR icons next to names |
| | Show owner and mod tags | Shows an Owner, Admin, Manager or Mod tag next to people's names in chat, worked out from the roles you can see. Pick who gets one and whether owners get a crown. Based on StaffTag by mwittrien |
| | Alert when you're removed | Get a heads-up when a friend unfriends you, or a server kicks or bans you, and catch up on anything that happened while Discord was closed. Choose friends, servers or both, and whether to also get a phone notification. Things you remove or leave yourself never alert. Based on RemovedConnectionAlerts by iyu46. |
| | Fix unknown mentions | @unknown-user mentions show the person's name |
| | Copy profile bios | Hold a bio to select and copy it |
| | User and server reviews | Read and write reviews, from ReviewDB |
| | User activity notifications | Shows a notice when chosen friends or users change status, start typing or send a message. Nothing shows for the chat you have open, and typing is announced once a minute per person and chat |
| | Account switcher | Switch between up to 50 Discord accounts from the profile bar or Cordly settings. Create a new account from Discord's Add account screen or the Account switcher page, without logging out. Export your saved accounts to a file and import them on another phone or a fresh install, without signing in again |
| **Servers** | Read all button | Marks servers, DMs or both as read in one tap |
| | Show hidden channels | Channels you can't open appear with a lock. Only a tap opens their details menu, which you can turn off |
| | Server info | Export a blueprint (server name, description, categories, channels, roles, permission overwrites, artwork URLs) using the Android Save to Files picker or copy JSON. The optional bot CLI restores the layout to an existing server after a dry run. Hold a server icon to view live details and download its icon, banner, invite splash or discovery splash; copy icon/banner URLs; browse, search and select emojis or stickers; long-press to save one or export selected/all as ZIP. Supports animated GIF/APNG and original Lottie JSON sticker downloads |
| | Edit servers locally | Give any server your own name and icon, from a picture on your phone or a link. Hold a server's icon and tap **Edit locally**, or pick one on the Cordly page, which lists every server you've edited and resets them. Only this phone sees it: Discord's own server settings always show the real name and icon, so nothing is ever saved to the server. Backups keep names and icon links; pictures from your phone stay on it. Based on EditServers by mwittrien |
| | Clean channel names | Removes emoji, dividers and symbols (🎫┃, ✦, 「」) and fancy fonts (𝐂𝐎𝐌𝐌𝐔𝐍𝐈𝐓𝐘) from channel and category names, each with its own switch, and can show "general chat" instead of "general-chat". Only how names look changes: links, mentions and search still use the real name, and a name made only of emoji stays as it is |
| **Appearance** | Use your phone's font | Replaces Discord's font everywhere |
| | Use your phone's emojis | Your phone's emojis instead of Discord's, or the emojis from a color emoji font you import (like Twemoji or Noto Color Emoji) |
| | Remove anything | Turn on **removal mode** and go anywhere in Discord: every button you can remove gets a dashed outline and a red ✕. Tap the ✕, say yes, and it's gone right away, with Undo on the floating bar. Buttons keep working while removal mode is on (menus open, Block blocks); only the ✕ removes. What's left closes up: the Messages tab and channel list headers shrink when all their buttons are gone, a profile's tab bar goes when only Main is left, and the ⋯ button goes for anyone whose menu has nothing left in it. Covers the voice message, attach, Apps and gift buttons in the message bar; call, video call and search in DMs; search, message requests, Add Friends and new message on the Messages tab; Apps, Polls and Photos in the attach menu; the ⋯ button, server tag, badges, mutual servers, Add Friend, Message, Call, the Activity and Wishlist tabs, either Member Since date, Roles, Connections and the note on profiles; Search, Invite and Events above a server's channel list; the server menu's Community Server pill, Boost, Invite and Notifications, Mark as Read, Channels & Roles, Edit Per-server Profile, Show All Channels, Hide Muted Channels, Allow Direct Messages, Allow Message Requests, Report Server, Leave Server and Server Emoji; Quests, Shop, Nitro and the Quests banner on your profile; any item in a profile's ⋯ menu (Add Friend Nickname, Invite to Server, Copy Username, Apps, Ignore, Block, Report…); any row in Discord's Settings, Cordly rows included; and single switches on Cordly pages. Cordly → Remove anything lists what you removed, to bring each back, plus a switch for every button |
| | Cordly button on profile bar | A shortcut to Cordly, next to the notifications bell |
| | Unlock app icons | Use any Discord app icon in Settings without Nitro |
| | Unlock Nitro themes | Use Discord's gradient themes in Settings > Appearance without Nitro. Only this phone sees them |
| | Material You colors | Colors Discord to match your wallpaper, in light and dark, like Android 12+ apps. Or pick one of five colors or any color; choose how much the backgrounds take the tint. Wallpaper colors need Android 12 or newer |
| | Custom themes | Install Revenge and Vendetta color themes from a link, then pick one from a gallery that previews each in its own colors |
| | Icon packs | Replace Discord's icons across the app with built-in community icon packs (Rosiecord Plumpy, Rosiecord Iconsax, MD3, Solar, Deco, Material Two Tone, Iconsax Bulk) or a custom icon pack link |
| **Quests** | Complete Quests automatically | Finishes video, Play and timed Activity Quests in the background |
| | Complete badges automatically | **Risky, experimental:** the row is marked Risky and Experimental, and turning it on asks "Are you sure?" first. Plays real, detectable PC games in the background the way Discord for Windows reports them, toward your Hours Played and Unique Games Played badges, with each game's own art on your profile. Up to 3 games at once count up to 3 hours of game time every hour. Advanced Add hours now sends past sessions right away, behind a warning you confirm three times, because it can get an account suspended. Needs Discord's "Use data to personalize my Discord experience" on; progress can take a day or two to show |
| **Advanced** | Unlock Discord experiments | Adds Dev Tools to Discord's Settings, with its Experiments screen, so you can try features Discord is still testing (like server folders or favorites). Only on this phone, nothing is sent anywhere. Turning it off asks to reopen Discord. Based on Experiments by maisy |
| | Keep Bluetooth audio clear in calls | Bluetooth headphones stay in music quality (A2DP) when you join a call, voice channel or Stage, instead of switching to the muffled hands-free mode. Your phone's own microphone picks up your voice. Only while Bluetooth headphones are connected; applies from the next call |
| | Voice channel options | Settings for voice channels, each off until you turn it on. When you join: start every call at a volume you pick (0% joins with everyone muted), and play calls through the speaker, earpiece, Bluetooth or a wired headset if it's connected. Join and leave chimes: turn off the chime Discord plays as people join or leave your voice channel, or make it quieter; voices and other sounds stay the same. When you leave: a goodbye sound, one of your soundboard sounds that plays for everyone in the channel when you tap Disconnect. It needs Nitro, so nothing is sent without it. You can still change everything in the call. |

**In the background:** Play and Activity Quests keep going while Discord is in the background or the screen is off, like Discord for Windows running unfocused. Video Quests are reported at normal speed, and only while Discord is open, the same as Discord's own player. Leaving Discord pauses a video Quest, the background Quests go ahead in the meantime, and the video picks up where it stopped when you come back. New Quests are accepted while Discord is open.

**Double-tap to reply:** a double-tap replies, or opens the editor on your own message; with Triple-tap to delete, a third tap deletes it. It follows Discord's own rules: messages Discord won't let you delete (calls, group DM changes, a thread's first message) are never deleted, and where you can't reply (an announcement channel, a locked thread, a timeout) a double-tap adds your double-tap reaction as usual. Kept deleted messages ignore double-taps, and the screen reader's Add quick reaction action still reacts.

**Send long messages:** parts go out one at a time, a second apart (or after the slowmode wait), so they stay in order. Each part keeps code blocks closed, `@silent`, text-to-speech and Nitro emoji links. If a part fails to send, Cordly says so and lets you copy the parts that didn't go out. An edit replaces one message, so it can't be split: an edit over Discord's limit isn't sent, and you can copy it instead. Scheduled messages are never split.

**Activity Quest support:** automatic completion currently handles `PLAY_ACTIVITY` tasks, which count time. It does not handle `ACHIEVEMENT_IN_ACTIVITY` tasks, such as **VALORANT Aces Round 3**, which require an achievement event rather than elapsed time. Those quests are skipped, including automatic acceptance, and must currently be completed in the Activity through Discord's Launch button. A one-achievement target is not a one-second timer; sending time heartbeats does not implement achievement completion.

**Language** sets the language Cordly settings are shown in. It follows Discord's language until you pick another one. 30 languages are included, among them Russian, Ukrainian, German, Spanish, French, Portuguese, Polish, Turkish, Japanese, Korean and Chinese. Counts use each language's plural forms. Corrections are welcome on GitHub ([`patches/src/main/resources/venus/i18n`](patches/src/main/resources/cordly/i18n)).

**Backup and restore** keeps your Cordly setup safe when you patch again, reinstall or move to a new phone. **Save to a file** opens Android's Save to screen so you can keep the backup in Downloads, Drive or anywhere else, and **Copy to clipboard** lets you paste it into a note. **Restore from a file** or **Paste from clipboard** brings every feature, option, watched person and installed theme back after asking first. Backups are small JSON files and never include your ReviewDB sign-in, saved accounts or kept deleted messages. **Reset to defaults** turns every feature off again.

**About** shows your version, how many features are on (in total and per group), whether everything is working, and links to what's new and to report a problem. Cordly settings animate gently as you use them, and follow Android's **Remove animations** setting.

### App identity

The launcher icon, Android app name and package ID are **not modified** by Cordly. It adds a **Cordly** page inside Discord Settings. The former optional Custom branding patch has been removed to avoid renaming the actual app.

### Privacy options

These are listed under **Privacy** in Morphe and are all selected. They work once you patch, with nothing to turn on in Discord. To change them, patch again.

| Option | What it stops |
| --- | --- |
| **Disable analytics** | Discord's usage tracking |
| **Disable crash reporting** | Crash reports and logs sent to Sentry |
| **Disable telemetry and touch logging** | Performance tracking, per-screen smoothness (jank) stats and records of what you tap |
| **Disable advertising identifiers** | Reading your Google advertising ID, by Discord or by AppsFlyer |
| **Disable install attribution** | Tracking of how you installed the app (AppsFlyer) |

Discord can still see what any client needs to work, like your messages, calls and activity on its servers.

## For developers

```bash
python3 scripts/build.py    # builds and tests patches/build/libs/*.mpp
```

## License

[GPL-3.0](LICENSE). Notices are in [NOTICE](NOTICE).

## Cordly additions

The **Server info** feature contains a **Server media** section. Hold a server icon → **Server info** to save its icon, banner, invite splash and discovery splash (if available), or copy the icon/banner image URL. Choose **Browse and download emojis** or **Browse and download stickers**, use search and Animated only, tap to select or hold an item to save it individually. **Download selected** and **Download all** save ZIP files via Android's Save to screen. Animated emojis retain GIF, stickers retain PNG/APNG/GIF or original Lottie JSON. Maximum: 500 items and 32 MiB of media data per ZIP; failures are reported. The save bridge is source-checked but needs verification on a patched phone.

This archive contains modified *source*, not a finished `.apk` or `.mpp`. It retains the original code's required internal `venus` asset names and backup keys for backwards compatibility; those are implementation details, not the visible Cordly name.
