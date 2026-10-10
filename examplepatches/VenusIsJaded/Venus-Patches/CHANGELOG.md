# What's new

Every release works with **Discord 348.10 - Stable**. Always patch the original APKM. Releases up to 1.3.6 were for Discord 347.12.

## 1.4.4 — Bug fixes and less work

- **Read All no longer brings back an older server list.** The button's list was remembered by the list's data alone, so a later render could get an earlier render's list settings back. Each render now keeps its own, and the button's row is still shared, so the list doesn't redraw.
- **Quest Completer names the game again after a dropped connection.** If looking up which of a game's files to report failed once, that game went unnamed until Discord restarted. Only Discord's real answer is remembered now.
- **A dropped connection no longer parks a Quest for 6 hours.** If accepting a Quest failed because you were offline, it was left alone as if Discord had refused it. It's now tried again after about 5 minutes. A real refusal or captcha still waits hours.
- **Quest Completer stops on a Quest Discord has stopped counting.** It used to send a heartbeat every minute for as long as Discord stayed open. After 5 heartbeats with no new time, it stops and tries again later.
- **The ReviewDB review menu closes properly.** Its close button closed nothing, because it didn't say which sheet to close.
- **Opening Discord doesn't rewrite your saved deleted messages.** With **Save permanently** on, the whole file was written again on every start, even when nothing had changed. It's only written now when something did change.
- **The Quest Completer page doesn't redraw every 5 seconds.** It updates when a Quest starts, finishes or fails, including the moment one finishes.

## 1.4.3 — Play Quests count again

- **Play Quests finish now.** In 1.4.2 they were accepted, then stopped with "Couldn't finish …: HTTP 401", and Discord showed "Waiting for you to launch … on desktop or connected console". Discord only counts play time that comes from its desktop app or a linked console, so Quest Completer now reports it the way Discord for Windows does.
- **Activity Quests finish too.** Quests you'd normally play inside Discord, like VALORANT Aces, were refused the same way. They're now reported like desktop does, naming the Activity instead of a call. Activity Quests made for phones still come from your phone.
- **Only those reports change.** Accepting Quests and watching videos still come from your phone, as before, because Discord allows that.
- **Paced like the desktop app.** Play time is reported once a minute, not every 20 seconds, and it stops as soon as the Quest is done, the same as desktop. A 15-minute Quest still takes about 15 minutes.
- **It names the game properly.** Each report says which game it's for, and which of the game's files is running, using Discord's own list for that game. Test builds and launchers are never picked.
- **Everything else is still your phone.** Messages, calls and the rest of Discord aren't touched.
- Stream Quests still need a real stream, so they're skipped. You still claim rewards yourself, and Discord may pause Quests on accounts that complete them automatically.

## 1.4.2 — Quest Completer does Play Quests

- **Play Quests work.** Quests like "Play VALORANT for 15 minutes" or "Play AION 2 with your Discord client open" used to be skipped, so they were never accepted or completed. Quest Completer now accepts them and completes them in the background, like video Quests.
- **No game needed.** Discord counts time for the Quest's game without it being installed or started. It takes as long as the Quest asks, usually 15 minutes.
- **It works with new and older Quests.** Discord moved where a Quest says which game it's for. Both places are read.
- **Turn it off on its own** in **Venus → Plugins → Quest Completer → Play Quests**. Turning it off stops a Play Quest that's running.
- **Video Quests still go first** when a Quest offers both a video and a game.
- Stream Quests still need a real stream, so they're skipped. You still claim rewards yourself, and Discord may pause Quests on accounts that complete them automatically.

## 1.4.1 — Quest Completer

- **New plugin: Quest Completer.** When you open Discord, it checks for Quests you haven't finished and completes them in the background. No screen opens and nothing needs a tap.
- **It accepts new Quests for you,** one at a time, then completes them. To only finish Quests you accepted yourself, turn off **Accept new Quests** in its settings.
- **Video and Activity Quests are supported.** Videos are reported as watched at normal speed, and Activity time is counted without starting the Activity. Play and stream Quests need a computer, so they're skipped.
- **It keeps checking while Discord is open.** New Quests are picked up every 30 minutes, the one ending soonest goes first, and Discord's own Quest screens show the progress.
- **Nothing pops up.** If Discord asks for a captcha or says to slow down, that Quest is skipped quietly and tried again later.
- **Choose what it does** in **Venus → Plugins → Quest Completer**: video Quests, Activity Quests and accepting new Quests can each be turned off, and a status line shows what it has completed.
- You still claim rewards yourself. Discord may pause Quests on accounts that complete them automatically, so use it at your own risk.

## 1.4.0 — Original names and icons are back, plus fixes

This release was first published as 1.3.10. Only the number changed.

- **Every feature has its 1.3.8 name again,** in Morphe and in Venus settings: CopyBios, Dashless, FavouriteAnything, File size on picker, FreeNitro, Hidden Channels, JumpToTop, No typing, NoDelete, Pastelize, PlatformIndicators, QuickDelete and ReviewDB. Your settings carry over, so nothing turns on or off.
- **PlatformIndicators has its original icons back.**
- **Everything else from 1.3.9 stays,** including the removed size cap and the clearer [NOTICE](NOTICE).
- **Lowering NoDelete's maximum is instant.** Going from 5000 to 1 used to send up to 4,999 separate deletes. Each chat now gets one.
- **ReviewDB's refresh works properly.** Refreshing a profile's reviews could push a different profile out of the cache. A failed older request could also wipe newer reviews.
- **Hidden Channels shows locked channels more reliably** when Discord's permission value comes in a different number type.
- **Smoother chats with NoDelete or Pastelize on.** Rows in chats with no kept messages skip the deleted-message check, and sorting kept messages does less work.
- **Opening a server with Hidden Channels on does less work.** Each locked channel's name is looked up once, not twice, and channel names are remembered without extra copies or account lookups.
- Without NoDelete patched in, Discord no longer schedules a saved-message restore every time it connects.

## 1.3.9 — New names, new icons and no size cap

- **Every feature is named after what it does.** Your settings carry over, so nothing turns on or off.

  | Before | Now |
  | --- | --- |
  | CopyBios | **Selectable bios** |
  | Dashless | **Spaced channel names** |
  | FavouriteAnything | **Favourite any media** |
  | File size on picker | **Attachment sizes** |
  | FreeNitro | **Emoji and sticker links** |
  | Hidden Channels | **Locked channels** |
  | JumpToTop | **Jump to first message** |
  | No typing | **Silent typing** |
  | NoDelete | **Keep deleted messages** |
  | Pastelize | **Pastel names** |
  | PlatformIndicators | **Device badges** |
  | QuickDelete | **Instant delete** |
  | ReviewDB | **Reviews** |

- **Device badges has new icons.** Desktop, web, mobile, console and VR are drawn by Venus, and are still tinted by status.
- **No more size cap.** Venus had a 119,000-character limit on its built-in code. It was a safety margin, not a real limit, so it's gone. New features won't have to squeeze in.
- **Clearer credits.** [NOTICE](NOTICE) now says where ideas came from, and that Venus doesn't include code from other client mods.

## 1.3.8 — Bug fixes and a smoother Discord

- **NoDelete keeps your saved messages.** With **Save permanently** on, turning NoDelete off used to erase every saved message. They're now kept, and come back when you turn NoDelete on again.
- **Read All clears every DM.** One DM with no messages could stop the rest from being marked as read. Lots of unread DMs are also sent in smaller batches, like Discord does.
- **JumpToTop's menu stays put.** Holding a channel or thread no longer rebuilds the whole menu every time it updates.
- **Hidden Channels does half the permission checks,** and works more reliably for channels Discord has only partly loaded.
- **Smoother chats and lists.** PlatformIndicators, ReviewDB and Hidden Channels do much less work when people come online, type or change status.
- **Less work when messages are deleted.** NoDelete only makes a saved copy when **Save permanently** is on, and turning it off clears a chat in one step.
- Leaving NoDelete's maximum box without changing it no longer re-saves your settings.

## 1.3.7 — Discord 348.10

- **Works with Discord 348.10.** Patch the original **348.10 - Stable** APKM. Discord 347.12 is no longer supported, so update Discord before you patch again.
- **Every plugin and privacy option was checked against 348.10.** All 21 patches apply, and the patched app passes the same checks as before.
- **Crash reporting is blocked properly.** One of Discord's two crash-report senders was blocked in a way that could break, so reports could still get through. It's now turned off cleanly.
- **JumpToTop works on threads.** Holding a thread now shows **Jump to top**, like channels and forum posts.
- **PlatformIndicators shows in the voice panel again,** next to people in the call.
- **ReviewDB's Copy Text and review cards work again.** Discord moved them in 348.10.
- **Smoother lists with PlatformIndicators on.** Icons only update when that person's status changes, not every time anyone's does.

## 1.3.6 — Read All button and a Pastelize fix

- **New plugin: Read All.** A **Read all** button sits in the server list, under the Direct Messages button and above the line before your servers. One tap marks everything as read.
- **Choose what it clears** in **Venus → Plugins → Read All**: **Servers**, **Direct messages**, or **Servers and DMs**. Hold the button to pick a one-time choice without changing the setting.
- **Pastelize's "Color message text" works.** Messages show in the person's pastel color, instead of turning blue and showing *usernameOnClick* when tapped.

## 1.3.5 — Clearer patches and tidier settings

- **Patches are easier to read in Morphe.** They're grouped under **Plugins** and **Privacy**, and every description says what the patch does in plain words.
- **Venus settings are tidier.** Plugins are listed A to Z, Pastelize has its own page, and the wording is clearer throughout.
- **Settings update right away.** Changing a PlatformIndicators, ReviewDB or Pastelize option no longer needs you to leave and reopen the page or chat.
- **File sizes read correctly.** A file just under 1 MB no longer shows as *1024 KB*, and sizes use KB and MB.
- **NoDelete's maximum is safer to edit.** Clearing the box keeps your number instead of resetting it to 512, and the hint follows your theme.
- The ReviewDB send button only lights up when there's something to send.
- **Less background work.** NoDelete no longer rewrites its file for every deleted message when saving is off, logging out no longer rewrites your settings, and Hidden Channels does less work per channel.
- **Patching is a little faster,** especially on phones.

## 1.3.4 — Morphe source fix and less background work

- **Adding Venus Patches to Morphe works again.** Morphe showed *"The patch bundle could not be downloaded"* when you added this repository as a source. Importing the `.mpp` file manually wasn't affected.
- **Less work while you chat.** With Pastelize or NoDelete on, name colors and the red outline are reused instead of being worked out again for every message.
- **Less work when you open a server** with Hidden Channels on, because the channel list is read once instead of twice.
- **Fewer checks on every Discord event** and every setting lookup.
- **Patching uses less memory,** which helps when patching on phones with little RAM.

## 1.3.3 — Discord's own voice-message waveform

- **Converted voice messages look like ones recorded in Discord.** They use Discord's own waveform, so quiet audio looks quiet, loud audio looks loud, and the number of bars follows the clip's length.
- **More audio files work,** including A-law and µ-law WAVs, RF64 and streamed WAVs, and WAVs using ADPCM, GSM or MP3.
- **More files are recognised as audio,** including `.m4a`, `.opus` and `.3ga` files that some apps label as video.
- Recordings that were cut off or only partly downloaded now convert up to where they stop.
- Some AAC, Opus and Vorbis files no longer fail with *Audio format changed during decoding*.

## 1.3.2 — Server reviews in the server menu

- Hold a server and tap **Reviews** to open its reviews right inside the same menu. Tap again to close them.
- Reviews now show **Loading**, **No reviews yet**, or an error with **Retry**, so a failed load is no longer silent.

## 1.3.1 — PlatformIndicators crash fix

- Fixed the *Rendered fewer/more hooks* errors when you opened or switched chats with PlatformIndicators on.
- Server and user-menu reviews open more reliably, and give feedback when they can't open.

## 1.3.0 — PlatformIndicators in DMs and instant NoDelete outline

- PlatformIndicators icons now show in the DM list and on the DM top bar.
- The red NoDelete outline appears right away, instead of only after you reopen the chat.

## 1.2.9 — NoDelete settings and original PlatformIndicators icons

- NoDelete keeps your own deleted messages again, and has a settings page. You can choose **Save permanently** and the **maximum saved messages** (1–5000).
- PlatformIndicators uses the original plugin's icons and settings, and shows icons in more places, including VR.
- Server **Reviews** now opens when you tap it.

## 1.2.8 — Stronger privacy options

- The privacy options can't be bypassed by a cached Discord update anymore.
- Added **Disable advertising identifiers**.
- Blocks more crash-report, system-log and metrics paths.

## 1.2.7 — Privacy options

- Added **Disable analytics**, **Disable crash reporting**, **Disable telemetry and touch logging** and **Disable install attribution**. You choose them in Morphe, and they're on by default.

## 1.2.6 — ReviewDB sign-in and NoDelete fixes

- ReviewDB sign-in works and stays signed in. Reviews look and behave like the original plugin.
- NoDelete keeps messages in the right order and no longer causes errors after deleting.

## 1.2.5 — ReviewDB redesign

- Reviews use Discord's own look and follow your theme.
- Delete and report now ask before they act, and permissions match Vencord.

## 1.2.4 — New Hidden Channels popup

- Tapping a locked channel opens a native Discord dialog showing when it was created and last used.
- Fixed duplicate popups.

## 1.2.3 and earlier

- **1.2.3:** ReviewDB settings moved to their own page, and Hidden Channels shows more real names.
- **1.2.2:** ReviewDB, Hidden Channels, PlatformIndicators and NoDelete look more like the originals.
- **1.2.1:** Fixed Pastelize, ReviewDB, Hidden Channels, PlatformIndicators and NoDelete.
- **1.2.0:** Added Pastelize, PlatformIndicators and ReviewDB.
- **1.1.1:** Faster voice conversion and fewer re-renders.
- **1.1.0:** Added No typing, QuickDelete, NoDelete, JumpToTop and Hidden Channels.
- **1.0.0:** Added the **Settings → Venus** section, CopyBios, Dashless, FavouriteAnything and FreeNitro.
- **1.0.0-dev:** First previews, with picker file sizes and voice messages.
