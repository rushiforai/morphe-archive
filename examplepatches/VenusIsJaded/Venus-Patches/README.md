# Venus Patches

Extra features and privacy options for Discord on Android, built into the app with **[Morphe](https://morphe.software)**. Everything works offline, except the few features that say they use a service (ReviewDB, Translate messages, Fix link previews, Bring back Tenor GIFs). Nothing is downloaded from the internet to run, and nothing is tracked.

[**Add to Morphe**](https://morphe.software/add-source?github=VenusIsJaded/Venus-Patches&name=Venus%20Patches) · [Downloads](https://github.com/VenusIsJaded/Venus-Patches/releases) · [What's new](CHANGELOG.md) · [Report a problem](https://github.com/VenusIsJaded/Venus-Patches/issues)

**Works with:** Discord **350.8 - Stable** (the original APKM).

## Install

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager/releases).
2. Tap **[Add to Morphe](https://morphe.software/add-source?github=VenusIsJaded/Venus-Patches&name=Venus%20Patches)**. You can also add `https://github.com/VenusIsJaded/Venus-Patches` as a source.
3. Choose the **original** Discord 350.8 APKM. Don't pick an APK you've already patched.
4. Every patch except **Custom branding** is selected for you, under **Features** and **Privacy**. Leave **Venus settings** on, then patch and install.
5. Open **Discord Settings → Venus → Features** and turn on the ones you want. They all start off.

You can also download `patches-<version>.mpp` from [Releases](https://github.com/VenusIsJaded/Venus-Patches/releases) and import it under **Sources → + → Local**.

> **Heads up:** the patched app is signed with your key, not Discord's, so you may need to uninstall official Discord first, unless you use [Custom branding](#custom-branding) to install it next to Discord. Uninstalling deletes Discord's local data. Keep the same Morphe signing key so later updates install over the top.

## Features

Open **Discord Settings → Venus → Features** to turn things on or off at any time. Type in the search bar at the top to find a feature by its name, what it does or one of its options. The first time you open it, a **Start with the essentials** card at the top turns on eight popular features in one tap (Keep deleted messages, Nitro stickers and emojis as links, Device indicators, Read all, Jump to first message, Fix unknown mentions, Copy profile bios and file sizes). None of them needs a sign-in, an outside service or a restart. **Undo** switches back exactly those, and **Not now** hides the card for good. Rows with an arrow button have more options. Each feature has the same name in Venus and in Morphe. **Everything starts off**, so Discord looks and works like normal until you turn on what you want. Your choices from an earlier version are kept.

| Group | Feature | What it does |
| --- | --- | --- |
| **Messages** | Keep deleted messages | Deleted messages stay in chat, outlined in red, and edits keep their history. Pick their color, brightness and how many to keep |
| | Bulk delete messages | Select multiple messages in chat and delete them all at once |
| | Hide blocked or ignored messages | Removes the "blocked messages" and "ignored messages" rows from chat, and can hide replies to them too |
| | Message highlights | Pick bar width, plus the color and brightness of replies and mentions |
| | Translate messages | Messages in other languages show in yours, automatically or only when you ask: a whole chat from a bar that appears when it has messages in another language, or one message from its menu. Translate into Discord's language, your phone's, or any of 70 others |
| | Double-tap to reply | Double-tap a message to reply, or your own to edit it |
| | Skip delete confirmation | Messages and link previews are removed with no "Are you sure?" |
| | Jump to first message | A button to go straight to the start of a chat |
| | Favourite any image or video | Star any image or video to keep it in your GIF favourites |
| **Sending** | Send Nitro stickers and emojis as links | Sends Nitro emojis and stickers as links that show as the image |
| | Bring back Tenor GIFs | Tenor GIFs show in Discord's own GIF picker again: search, trending and categories. Mix them with Discord's GIFs or use only Tenor. If Tenor doesn't answer, Discord's own GIFs show |
| | Fix link previews | Links to X, Instagram, TikTok, Reddit, Bluesky, Threads, Tumblr, Facebook, PTT, Twitch clips, Bilibili, pixiv, DeviantArt and Fur Affinity show the post, with its picture or video. YouTube, Spotify, Mastodon and Pinterest can be turned on too. Pick the embed service per site (FxTwitter, vxTwitter or FixEmbed, and so on), Tumblr posts can be drawn dark to match Discord, and share tracking like `?igsh=` is removed |
| | Send audio as voice messages | Audio files are sent as real voice messages, with a waveform |
| | Send long messages | Type past the character limit; long messages are sent in parts |
| | Hide typing indicator | Others won't see when you're typing |
| | Show file sizes when attaching | Photos and videos in the picker show their size |
| **People** | Pastel name colors | Names without a role color get a soft pastel color |
| | Show device indicators | Desktop, mobile, web, console or VR icons next to names |
| | Fix unknown mentions | @unknown-user mentions show the person's name |
| | Copy profile bios | Hold a bio to select and copy it |
| | User and server reviews | Read and write reviews, from ReviewDB |
| | User activity notifications | Shows a notice when chosen friends or users change status, start typing or send a message |
| | Account switcher | Switch between up to 50 Discord accounts from the profile bar or Venus settings. Create a new account from Discord's Add account screen or the Account switcher page, without logging out |
| **Servers** | Read all button | Marks servers, DMs or both as read in one tap |
| | Show hidden channels | Channels you can't open appear with a lock. Only a tap opens their details menu, which you can turn off |
| | Server info | Hold a server's icon to see live details: who's online, channels, roles, emojis, boost progress, the owner, your friends there, when it was made and when you joined |
| | Spaces in channel names | "general chat" instead of "general-chat" |
| | Clean channel names | Removes emoji, dividers and symbols (🎫┃, ✦, 「」) and fancy fonts (𝐂𝐎𝐌𝐌𝐔𝐍𝐈𝐓𝐘) from channel and category names, each with its own switch. Only how names look changes: links, mentions and search still use the real name, and a name made only of emoji stays as it is |
| **Appearance** | Use your phone's font | Replaces Discord's font everywhere |
| | Use your phone's emojis | Your phone's emojis instead of Discord's, or the emojis from a color emoji font you import (like Twemoji or Noto Color Emoji) |
| | Hide the gift button | Removes the Nitro gift button from the message bar |
| | Hide the call button | Removes Call from people's profiles |
| | Hide extra buttons | Removes the Quests, Shop and Nitro buttons from your profile and Apps from the attach menu; you can also pick Polls and Photos. The rest close up, so the pill and the menu shrink with no gaps |
| | Venus button on profile bar | A shortcut to Venus, next to the notifications bell |
| | Unlock app icons | Use any Discord app icon in Settings without Nitro |
| | Unlock Nitro themes | Use Discord's gradient themes in Settings > Appearance without Nitro. Only this phone sees them |
| | Material You colors | Colors Discord to match your wallpaper, in light and dark, like Android 12+ apps. Or pick one of five colors or any color; choose how much the backgrounds take the tint. Wallpaper colors need Android 12 or newer |
| | Custom themes | Install Revenge and Vendetta color themes from a link, then pick one from a gallery that previews each in its own colors |
| | Icon packs | Replace Discord's icons across the app with built-in community icon packs (Rosiecord Plumpy, Rosiecord Iconsax, MD3, Solar, Deco, Material Two Tone, Iconsax Bulk) or a custom icon pack link |
| **Quests** | Complete Quests automatically | Finishes video, Play and timed Activity Quests in the background |
| | Hide the Quests banner | Removes the Quest promotion above your profile bar |
| | Complete badges automatically | **Risky, experimental:** the row is marked Risky and Experimental, and turning it on asks "Are you sure?" first. Plays real, detectable PC games in the background the way Discord for Windows reports them, toward your Hours Played and Unique Games Played badges, with each game's own art on your profile. Up to 3 games at once count up to 3 hours of game time every hour. Advanced Add hours now sends past sessions right away, behind a warning you confirm three times, because it can get an account suspended. Needs Discord's "Use data to personalize my Discord experience" on; progress can take a day or two to show |
| **Advanced** | Unlock Discord experiments | Adds Dev Tools to Discord's Settings, with its Experiments screen, so you can try features Discord is still testing (like server folders or favorites). Only on this phone, nothing is sent anywhere. Turning it off asks to reopen Discord. Based on Experiments by maisy |
| | Keep Bluetooth audio clear in calls | Bluetooth headphones stay in music quality (A2DP) when you join a call, voice channel or Stage, instead of switching to the muffled hands-free mode. Your phone's own microphone picks up your voice. Only while Bluetooth headphones are connected; applies from the next call |

**In the background:** Play and Activity Quests keep going while Discord is in the background or the screen is off, like Discord for Windows running unfocused. Video Quests are reported at normal speed, and only while Discord is open, the same as Discord's own player. Leaving Discord pauses a video Quest, the background Quests go ahead in the meantime, and the video picks up where it stopped when you come back. New Quests are accepted while Discord is open.

**Double-tap to reply:** a double-tap replies, or opens the editor on your own message; with Triple-tap to delete, a third tap deletes it. It follows Discord's own rules: messages Discord won't let you delete (calls, group DM changes, a thread's first message) are never deleted, and where you can't reply (an announcement channel, a locked thread, a timeout) a double-tap adds your double-tap reaction as usual. Kept deleted messages ignore double-taps, and the screen reader's Add quick reaction action still reacts.

**Send long messages:** parts go out one at a time, a second apart (or after the slowmode wait), so they stay in order. Each part keeps code blocks closed, `@silent`, text-to-speech and Nitro emoji links. If a part fails to send, Venus says so and lets you copy the parts that didn't go out. An edit replaces one message, so it can't be split: an edit over Discord's limit isn't sent, and you can copy it instead. Scheduled messages are never split.

**Activity Quest support:** automatic completion currently handles `PLAY_ACTIVITY` tasks, which count time. It does not handle `ACHIEVEMENT_IN_ACTIVITY` tasks, such as **VALORANT Aces Round 3**, which require an achievement event rather than elapsed time. Those quests are skipped, including automatic acceptance, and must currently be completed in the Activity through Discord's Launch button. A one-achievement target is not a one-second timer; sending time heartbeats does not implement achievement completion.

**Language** sets the language Venus settings are shown in. It follows Discord's language until you pick another one. 30 languages are included, among them Russian, Ukrainian, German, Spanish, French, Portuguese, Polish, Turkish, Japanese, Korean and Chinese. Counts use each language's plural forms. Corrections are welcome on GitHub ([`patches/src/main/resources/venus/i18n`](patches/src/main/resources/venus/i18n)).

**Backup and restore** keeps your Venus setup safe when you patch again, reinstall or move to a new phone. **Save to a file** opens Android's Save to screen so you can keep the backup in Downloads, Drive or anywhere else, and **Copy to clipboard** lets you paste it into a note. **Restore from a file** or **Paste from clipboard** brings every feature, option, watched person and installed theme back after asking first. Backups are small JSON files and never include your ReviewDB sign-in, saved accounts or kept deleted messages. **Reset to defaults** turns every feature off again.

**About** shows your version, how many features are on (in total and per group), whether everything is working, and links to what's new and to report a problem. Venus settings animate gently as you use them, and follow Android's **Remove animations** setting.

### Custom branding

Want Venus next to the normal Discord app? Select **Custom branding** under **Features** in Morphe (it's the only patch that starts off) and tap its gear to choose:

| Option | What it does |
| --- | --- |
| **App name** | The name on your home screen. Type anything; **Venus** by default |
| **Package name** | Type any name of lowercase words joined by dots; `com.discord.venus` by default, so both apps install side by side. Type `com.discord` to replace Discord instead |
| **Icon color** | The color behind the logo: Discord's blurple, green, yellow, fuchsia, red or black, or any color you choose |
| **Icon picture** | Your own square PNG, JPG or WebP picture (512 × 512 is ideal) in place of Discord's logo. It fills the icon's shape, so keep the important part away from the corners |

**Icon color and Icon picture work together:** the color fills the icon's background and the picture sits on top, so the color only shows through transparent parts of the picture. With neither, the icon stays Discord's. With only a color, it's Discord's logo on your color.

A copy with a new package name is a separate app: it starts signed out and has its own settings. Notifications work in both apps: each one registers for push notifications under its own name, so signing in to the same account in both gets them in both, and the copy's notification sounds, pictures and **Notification settings** button all use its new name. Keep the same package name every time you patch so updates install over the top.

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
