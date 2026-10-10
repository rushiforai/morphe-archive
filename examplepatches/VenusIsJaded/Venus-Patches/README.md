# Venus Patches

Extra features and privacy options for Discord on Android, built into the app with **[Morphe](https://morphe.software)**. Everything works offline. Nothing is downloaded from the internet to run, and nothing is tracked.

[**Add to Morphe**](https://morphe.software/add-source?github=VenusIsJaded/Venus-Patches&name=Venus%20Patches) · [Downloads](https://github.com/VenusIsJaded/Venus-Patches/releases) · [What's new](CHANGELOG.md) · [Report a problem](https://github.com/VenusIsJaded/Venus-Patches/issues)

**Works with:** Discord **348.10 - Stable** (the original APKM).

## Install

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager/releases).
2. Tap **[Add to Morphe](https://morphe.software/add-source?github=VenusIsJaded/Venus-Patches&name=Venus%20Patches)**. You can also add `https://github.com/VenusIsJaded/Venus-Patches` as a source.
3. Choose the **original** Discord 348.10 APKM. Don't pick an APK you've already patched.
4. Every patch is selected for you, under **Plugins** and **Privacy**. Leave **Venus settings** on, then patch and install.

You can also download `patches-<version>.mpp` from [Releases](https://github.com/VenusIsJaded/Venus-Patches/releases) and import it under **Sources → + → Local**.

> **Heads up:** the patched app is signed with your key, not Discord's, so you may need to uninstall official Discord first. Uninstalling deletes Discord's local data. Keep the same Morphe signing key so later updates install over the top.

## Features

To turn plugins on or off at any time, open **Discord Settings → Venus → Plugins**. The **Starts** column shows whether a plugin is on the first time you open Discord.

| Feature | What it does | Starts |
| --- | --- | --- |
| **CopyBios** | Lets you select and copy profile bios | On |
| **Custom voice messages** | Sends an audio file as a real voice message, waveform included | Off |
| **Dashless** | Shows spaces instead of dashes in channel names | On |
| **FavouriteAnything** | Lets you favourite any image or video | On |
| **File size on picker** | Shows file sizes on photos and videos when you attach them | On |
| **FreeNitro** | Sends emojis and stickers you can't use as links | On |
| **Hidden Channels** | Shows channels you can't open, with a lock | Off |
| **JumpToTop** | Adds a button to jump to the first message | On |
| **No typing** | Hides that you're typing | On |
| **NoDelete** | Keeps deleted messages visible, outlined in red | Off |
| **Pastelize** | Gives names and mentions soft pastel colors | On |
| **PlatformIndicators** | Shows whether people are on desktop, mobile, web, console or VR | On |
| **QuickDelete** | Skips the "are you sure?" when deleting | Off |
| **Read All** | Adds a Read all button to the server list for servers, DMs or both | On |
| **Quest Completer** | Completes video, Play and Activity Quests in the background, with no screen or tap | On |
| **ReviewDB** | Read and write reviews of users and servers | Off |

### Privacy options

These are listed under **Privacy** in Morphe and are all selected. They work once you patch, with nothing to turn on in Discord. To change them, patch again.

| Option | What it stops |
| --- | --- |
| **Disable analytics** | Discord's usage tracking |
| **Disable crash reporting** | Crash reports and logs sent to Sentry |
| **Disable telemetry and touch logging** | Performance tracking and records of what you tap |
| **Disable advertising identifiers** | Reading your Google advertising ID |
| **Disable install attribution** | Tracking of how you installed the app (AppsFlyer) |

Discord can still see what any client needs to work, like your messages, calls and activity on its servers.

## Good to know

- **Voice messages** need Android 10 or newer. Most audio files work. If a file can't be converted, it's sent as a normal attachment.
- **NoDelete** keeps messages until Discord restarts. To keep them for good, turn on **Save permanently** in its settings. Delete a kept message again to hide it.
- **Hidden Channels** only shows a channel's name and dates. It can't show messages or let you join locked voice channels.
- **ReviewDB** loads reviews from the community ReviewDB service at `manti.vendicated.dev`. To post or report reviews, sign in from its settings page. Signing in never uses your Discord token.
- **FreeNitro** sends links, not real Nitro emojis or stickers.
- **Quest Completer** checks for new Quests when Discord opens and every 30 minutes after. It accepts and completes video, Play and Activity Quests one at a time. Play and Activity Quests count time without installing or starting anything. That time is reported the way Discord's Windows app reports it, because Discord only counts play time from desktop. Stream Quests need a real stream, so they're skipped. You still claim rewards yourself. Discord may pause Quests on accounts that complete them automatically.
- **Read All** uses Discord's own "Mark as read". It clears servers by default. Switch it to DMs or both in its settings, or hold the button for a one-time choice.

## For developers

```bash
python3 scripts/build.py    # builds and tests patches/build/libs/*.mpp
```

## License

[GPL-3.0](LICENSE). Notices are in [NOTICE](NOTICE).
