## [1.24.0](https://github.com/lildanlid1/Cordly/compare/v1.23.0...v1.24.0) (2026-11-01)

### ✨ New Features

* **Discord - Server info:** Preview artwork and emojis by tapping images, and hold items to start multiple selection

### 🐛 Bug Fixes

* **Discord - Server info:** Fixed discarding download errors that prevented identifying failed emoji exports

### 🔧 Improvements

* **Discord - Server info:** Move artwork downloads onto images, open galleries from counters, and colour boosts pink
* **Discord - Server info:** Validate archive entries and saved file sizes before reporting successful exports

## 1.23.0 (2026-10-31)

### ✨ New Features

* **Discord - Server info:** Save or copy server layout blueprints containing roles, categories, channels, permissions and artwork references
* **Discord - Inspect message JSON:** View, copy and save cached embed and Components V2 message payloads from the hold menu
* **Discord - Server blueprints:** Restore a layout into an authorized destination server with a bot-driven dry-run importer

### 🔧 Improvements

* **Discord - Cordly settings:** Keep original Discord package, launcher name and app icon without changing Android branding
* **Discord - Server blueprints:** Skip member overwrites and dangerous admin permissions by default; require explicit import approval

## 1.22.0 (2026-10-31)

### ✨ New Features

* **Discord - Server info:** Export all available server artwork to one ZIP instead of saving each image separately
* **Discord - Server info:** Copy a plain-text server summary with counts, boosts, dates, owner ID and invite link when available
* **Discord - Media browser:** Browse static or animated media separately, sort names A–Z or Z–A, and export filtered results
* **Discord - Media browser:** Copy selected emoji markup codes or direct CDN links for emojis and stickers

### 🔧 Improvements

* **Discord - Cordly settings:** Keep Discord's app name, launcher icon and package unchanged; all new controls stay inside Cordly

## 1.21.1 (2026-10-31)

### ✨ New Features

* **Discord - Server info:** Download PNG, APNG, GIF and Lottie stickers individually or as a selected/all ZIP archive
* **Discord - Server info:** Download invite splash and discovery splash separately from the server banner
* **Discord - Server info:** Copy server icon and banner image URLs

### 🔧 Improvements

* **Discord - Cordly settings:** Keep the Android launcher name, icon and package as Discord, without a Custom branding patch
* **Discord - Media browser:** Reuse the emoji selector for stickers and protect exports with archive size limits

## [1.21.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.20.0...v1.21.0) (2026-10-31)

### ✨ New Features

* **Discord - Server info:** Download a server icon or banner, browse emojis, save a single emoji or export selected/all emojis as ZIP
* **Discord - Server info:** Search emojis, filter animated ones, and multi-select from a responsive grid

### 🔧 Improvements

* **Discord - Cordly settings:** Rebrand settings and the optional companion app as Cordly

## [1.20.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.19.0...v1.20.0) (2026-10-30)

### ✨ New Features

* **Discord:** Add `Voice channel options` patch: start every call at a set volume and on the speaker, earpiece or headset you pick, thanks to @RedStar071 ([#103](https://github.com/VenusIsJaded/Venus-Patches/issues/103))
* **Discord - Voice channel options:** Turn off or quiet the join and leave chimes, and play a goodbye sound from your soundboard when you leave (needs Nitro), thanks to @RedStar071
* **Discord:** Add `Edit servers locally` patch: give any server your own name and icon, from your phone or a link, and only you see them ([#114](https://github.com/VenusIsJaded/Venus-Patches/issues/114))
* **Discord:** Add `Remove anything` patch: tap the red ✕ on buttons, menu items and Settings rows you never use, and bring them back any time ([#105](https://github.com/VenusIsJaded/Venus-Patches/issues/105))
* **Discord:** Add `Load full-quality images` patch: pictures, profile pictures and banners load as uploaded instead of Discord's compressed copy ([#108](https://github.com/VenusIsJaded/Venus-Patches/issues/108))
* **Discord:** Add `Show owner and mod tags` patch: an Owner, Admin, Manager or Mod tag next to names in chat ([#108](https://github.com/VenusIsJaded/Venus-Patches/issues/108))
* **Discord:** Add `Alert when you're removed` patch: a heads-up when a friend unfriends you or a server kicks or bans you ([#108](https://github.com/VenusIsJaded/Venus-Patches/issues/108))
* **Discord:** Add `Always trust links and files` patch: opens links and files without Discord's "Are you sure?" warnings ([#108](https://github.com/VenusIsJaded/Venus-Patches/issues/108))
* **Discord:** Add `Skip pin confirmation` patch: pin and unpin messages without being asked first ([#108](https://github.com/VenusIsJaded/Venus-Patches/issues/108))
* **Discord:** Add `Tap mentions to open profiles` patch: tap an @mention in the message bar to see who it is ([#108](https://github.com/VenusIsJaded/Venus-Patches/issues/108))
* **Discord:** Add `Anonymous file names` patch: files you send get a random name instead of the one on your phone ([#100](https://github.com/VenusIsJaded/Venus-Patches/issues/100))
* **Discord - Account switcher:** Export your saved accounts to a file and import them on another phone ([#111](https://github.com/VenusIsJaded/Venus-Patches/issues/111))
* **Discord - Fix link previews:** Translate X and Bluesky posts into your language, and pick a post style: full post, media, text or file
* **Discord - Fix link previews:** Fix Imgur, Newgrounds, redd.it, Instagram stories, Facebook group posts and nitter links too
* **Discord - Hide blocked or ignored messages:** Optionally close your DM with someone when you block them
* **Discord - Venus settings:** Hide features you don't use from the Features list; they keep working and search still finds them

### 🐛 Bug Fixes

* **Discord - Custom themes:** Fixed the server list, server bar and DMs going back to Discord's colors after restarting Discord ([#110](https://github.com/VenusIsJaded/Venus-Patches/issues/110))
* **Discord - User activity notifications:** Fixed each new phone notification replacing the one before, so only the latest showed ([#106](https://github.com/VenusIsJaded/Venus-Patches/issues/106))
* **Discord - User activity notifications:** Fixed notifications being dropped without a warning when Android blocked them for Discord ([#106](https://github.com/VenusIsJaded/Venus-Patches/issues/106))
* **Discord - User activity notifications:** Fixed people added by ID showing as "now Online" on every reconnect, and typing notices repeating every few seconds
* **Discord - Unlock Nitro themes:** Fixed a picked Nitro theme being reset after restarting Discord with Same as device on
* **Discord - Show hidden channels:** Fixed locked channels counting as unread, lighting up the server bar, and deleted ones staying listed
* **Discord - Show hidden channels:** Fixed tapping a locked voice or stage channel opening an empty voice panel instead of its details
* **Discord - Bulk delete messages:** Fixed an invisible character left in messages, kept deleted messages staying selected, and server errors not being retried
* **Discord - Complete Quests automatically:** Fixed Quest requests carrying your phone's IDs and other details that real Discord for Windows doesn't send

### 🔧 Improvements

* **Discord - Remove anything:** Replaces Hide the gift button, Hide the call button, Hide extra buttons and Hide the Quests banner; what you hid carries over
* **Discord - Clean channel names:** Spaces in channel names is now its Spaces instead of dashes option; your setting carries over
* **Discord - Venus settings:** UI changes across settings, including calmer Risky and Experimental warnings, a single About card and a clearer Voice channel options page

### ⚡ Performance Improvements

* **Discord - Show hidden channels:** Locked channels are worked out several times faster, and the channel list skips work when nothing changed

## [1.19.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.18.0...v1.19.0) (2026-10-26)

### ✨ New Features

* **Discord:** Add `Material You colors` patch: Discord takes your wallpaper's colors in light and dark, or a color you pick, native chat included ([#90](https://github.com/VenusIsJaded/Venus-Patches/issues/90))
* **Discord:** Add `Hide blocked or ignored messages` patch: removes the blocked and ignored messages rows from chat, and optionally replies to them ([#91](https://github.com/VenusIsJaded/Venus-Patches/issues/91))
* **Discord:** Add `Bulk delete messages` patch: select multiple messages in chat and delete them all at once ([#94](https://github.com/VenusIsJaded/Venus-Patches/issues/94))
* **Discord:** Add `Clean channel names` patch: removes emoji, symbols and fancy fonts from channel and category names ([#95](https://github.com/VenusIsJaded/Venus-Patches/issues/95))
* **Discord:** Add `Unlock Discord experiments` patch: adds Dev Tools to Settings, to try features Discord is still testing ([#96](https://github.com/VenusIsJaded/Venus-Patches/issues/96))
* **Discord:** Add `Keep Bluetooth audio clear in calls` patch: headphones stay in music quality in calls while your phone's mic picks up your voice ([#98](https://github.com/VenusIsJaded/Venus-Patches/issues/98))
* **Discord - Use your phone's font:** Import your own font file (TTF, OTF or TTC) and use it everywhere instead of your phone's
* **Discord - Use your phone's emojis:** Import an emoji font, like Twemoji or Noto Color Emoji, and use its emojis everywhere
* **Discord - Fix link previews:** Tumblr links show the whole post, drawn dark to match Discord ([#87](https://github.com/VenusIsJaded/Venus-Patches/issues/87))
* **Discord - Fix link previews:** Fix Twitch clips, DeviantArt, Fur Affinity and PTT links, and optionally YouTube, Spotify, Mastodon and Pinterest ([#87](https://github.com/VenusIsJaded/Venus-Patches/issues/87))
* **Discord - Fix link previews:** More services to pick from, like FixEmbed, vxInstagram, FixBluesky and FixThreads, plus nitter and b23.tv links

### 🐛 Bug Fixes

* **Discord - Disable telemetry and touch logging:** Fixed forum posts not sending and the screen turning black after tapping Post ([#93](https://github.com/VenusIsJaded/Venus-Patches/issues/93))
* **Discord - Disable analytics:** Fixed removing a poll vote and joining a stage from a notification doing nothing
* **Discord - Custom themes:** Fixed theme background images never showing behind chat, and Discord attachment wallpaper links failing to load ([#97](https://github.com/VenusIsJaded/Venus-Patches/issues/97))
* **Discord - Custom themes:** Fixed older themes like Pyontheme drawing chat and panels in the wrong, much darker colors
* **Discord - Custom themes:** Fixed cards and sheets blending into the page in themes that recolor Discord's old palette
* **Discord - Send long messages:** Fixed a long `@silent` message notifying everyone from its second part on
* **Discord - Send long messages:** Fixed the rest of a long message being posted from another account after switching accounts mid-send
* **Discord - Send long messages:** Fixed the end of a long message being dropped silently when one part failed to send; you can now copy what wasn't sent
* **Discord - Send long messages:** Fixed edits longer than Discord's limit failing and losing the new text; Venus now explains and lets you copy it
* **Discord - Send long messages:** Fixed Nitro emojis in long messages sometimes staying as :name: text instead of links
* **Discord - Send long messages:** Fixed parts ending in an empty code box or a stray line-break character
* **Discord - Double-tap to reply:** Fixed the screen reader's Add quick reaction replying, editing or deleting your message instead of reacting
* **Discord - Double-tap to reply:** Fixed the editor opening in a chat you'd just left after double-tapping your message
* **Discord - Double-tap to reply:** Fixed triple-tap trying to delete messages Discord doesn't allow deleting, like calls and group DM changes
* **Discord - Double-tap to reply:** Fixed double-tapping a kept deleted message replying to or editing a message that no longer exists
* **Discord - Double-tap to reply:** Fixed double-tap doing nothing where you can't reply; it adds your double-tap reaction instead
* **Discord - Read all button:** Fixed the hold menu showing no icons and long translated labels spilling out of the server bar
* **Discord - Read all button:** Fixed a failure on the servers side also leaving your DMs unread when marking both

### 🔧 Improvements

* **Discord - Venus settings:** Tons of UI changes across every settings page, including turned-off pages introducing the feature, custom values as a pill and a cleaner Server info sheet
* **Discord - Custom themes:** Messages, embeds and code blocks drawn by Discord's native views now follow the theme too
* **Discord - Custom themes:** More colors from themes made for newer Discord versions now apply
* **Discord - Fix link previews:** Also remove share tracking from Tumblr, YouTube, Spotify, Twitch, Pinterest and DeviantArt links

## [1.18.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.17.0...v1.18.0) (2026-10-24)

### 🚀 Updated App Support

* **Discord:** Add support for `350.8 - Stable`, now the only supported version

### ✨ New Features

* **Discord - Translate messages:** Translate into any of 70 languages, not just Discord's or your phone's ([#79](https://github.com/VenusIsJaded/Venus-Patches/issues/79))
* **Discord - Keep deleted messages:** Pick the color and brightness of kept messages, and type any limit next to the Keep up to presets
* **Discord - Message highlights:** Choose how bright replies and mentions are, from presets or any value from 0 to 100%
* **Discord:** Add `Bring back Tenor GIFs` patch: Tenor GIFs show in Discord's own GIF picker again, mixed with Discord's or on their own ([#83](https://github.com/VenusIsJaded/Venus-Patches/issues/83))
* **Discord:** Add `Fix link previews` patch: links to X, Instagram, TikTok, Reddit, Bluesky, Threads, Facebook, pixiv and Bilibili show the post, through a service you pick per site ([#83](https://github.com/VenusIsJaded/Venus-Patches/issues/83))
* **Discord:** Add `Complete badges automatically` patch: plays real detectable PC games in the background, up to 3 at once for up to 3x the game time, toward your Hours Played and Unique Games Played badges, with their real art on your profile. Its page explains when a game counts and when the badge updates, and an Advanced Add hours now option asks you to confirm three times. It's marked Risky and Experimental, and asks "Are you sure?" before it turns on ([#81](https://github.com/VenusIsJaded/Venus-Patches/issues/81))
* **Discord:** Add `Hide extra buttons` patch: hide the Quests, Shop and Nitro buttons on your profile and the Apps, Polls or Photos buttons in the attach menu, with the rest closing up neatly ([#85](https://github.com/VenusIsJaded/Venus-Patches/issues/85))
* **Discord - Translate messages:** Translate a whole chat from a bar that appears when it has messages in another language, kept until Discord restarts, and choose whether you ask from the bar, the message menu or both. The bar floats as a small pill under Discord's own banners, like the blue New messages bar, never on top of them ([#82](https://github.com/VenusIsJaded/Venus-Patches/issues/82))
* **Discord:** Add `Unlock Nitro themes` patch: use Discord's gradient themes without Nitro, on your phone
* **Discord - Account switcher:** Create a new account from Discord's Add account screen or the Account switcher page, without logging out ([#86](https://github.com/VenusIsJaded/Venus-Patches/issues/86))

### 🐛 Bug Fixes

* **Discord - Disable analytics:** Fixed blocking analytics also stopping Discord's session active state and time-spent session ID from being reported on the Gateway
* **Discord - Message highlights:** Fixed messages that mention one of your roles not getting your custom mention color
* **Discord - Translate messages:** Fixed Translate in the hold menu never saying a message was already in your language, and saying so for translations it dropped
* **Discord - Custom themes:** Fixed a theme's background image only showing right after installing it, and missing from chat after Discord restarted ([#84](https://github.com/VenusIsJaded/Venus-Patches/issues/84))

### 🔧 Improvements

* **Discord - Message highlights:** The deleted messages color moved to Keep deleted messages, next to its new brightness option
* **Discord - Translate messages:** The language list names each language in its own words and closes once you pick one
* **Discord - Venus settings:** Previews just play: the Watch / Try it switch is gone, and pages whose description already says it all have no preview

### ⚡ Performance Improvements

* **Discord - Translate messages:** Skip rows nobody asked to translate before any other work, 1.44x faster per chat row
* **Discord:** Discord starts faster: the startup bytecode prelude builds the Venus runtime in blocks instead of one oversized array, and the runtime is 28% smaller, and the code features only need later is no longer read at launch at all, making a cold boot about 1.2x faster than 1.17.0. Each feature's code is now set up the first time that feature runs, so getting Discord's screens ready after launch takes less work

## [1.17.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.16.1...v1.17.0) (2026-10-20)

### ✨ New Features

* **Discord:** Add `Server info` patch: hold a server's icon to see who's online, channels, roles, emojis, boosts, the owner and your friends there ([#77](https://github.com/VenusIsJaded/Venus-Patches/issues/77))
* **Discord:** Add `Icon packs` patch: replace Discord's icons with 10 built-in community icon packs or a custom pack link, with a live preview ([#61](https://github.com/VenusIsJaded/Venus-Patches/issues/61))
* **Discord:** Add `Custom branding` patch: install Venus next to normal Discord with your own app name, package name, icon color and icon picture ([#78](https://github.com/VenusIsJaded/Venus-Patches/issues/78))

### ⚡ Performance Improvements

* **Discord:** Shrink the startup runtime and register Discord's modules with less work, making the startup header 1.59x faster
* **Discord - Venus settings:** Look up which feature each setting belongs to from a cache, 7.8x faster across settings, backups and switches
* **Discord - Show hidden channels:** Skip rescanning unchanged server channel lists and check channel names with less work, up to 2.6x faster
* **Discord - Custom themes:** Parse theme colors 2x faster and compile themes into Discord's color tables 1.3x faster
* **Discord - Translate messages:** Skip escaping text that needs none when laying out translations, 1.7x faster
* **Discord - Fix unknown mentions:** Check loaded messages for mentions with less work, 1.3x faster
* **Discord - Show device indicators:** Read the current user once per presence update instead of once per indicator

## [1.16.1](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.16.0...v1.16.1) (2026-10-19)

### 🐛 Bug Fixes

* **Discord - Complete Quests automatically:** Fixed video Quests accepted earlier or resumed after restarting reporting progress about five times faster than real playback
* **Discord - Complete Quests automatically:** Fixed video Quests continuing to send progress reports while Discord was in the background instead of pausing like Discord's video player
* **Discord - Complete Quests automatically:** Fixed new Quests being automatically accepted while Discord was in the background instead of waiting until Discord is open
* **Discord - Complete Quests automatically:** Fixed Play and Activity Quests waiting a full minute instead of one second for the final confirmation heartbeat at the target

### 🔧 Improvements

* **Discord - Complete Quests automatically:** Keep Play and Activity Quests running in the background while a paused video Quest waits until you reopen Discord

### ⚡ Performance Improvements

* **Discord:** Defer compiling Venus feature hooks, stores and settings pages until first needed and parse constant tables as JSON, cutting startup runtime eval time by almost 7x
* **Discord:** Speed up startup Metro module wrapping and HBC98 bytecode prelude string decomposition when patching and launching Discord
* **Discord - Pastel name colors:** Cache pastel colors per tone by user ID and copy each message row once, speeding up color lookups by 5.8x and row coloring by 1.5x
* **Discord - Custom themes:** Sync and restore only touched experiment color slots when switching themes, making experiment slot updates 5.6x faster
* **Discord - Spaces in channel names:** Cache formatted channel names and mentions with direct 1/2-argument hook calls, speeding up channel label rendering by 2.8x
* **Discord - Translate messages:** Cache the target language code per locale and setting, speeding up per-row language resolution by 18x
* **Discord - Message highlights:** Cache custom highlight color pairs and key recent highlights by message ID, speeding up highlighted row rendering by 1.3x
* **Discord - Show hidden channels:** Filter ignored Flux events early, partition hidden directory channels in one pass, and add a 2-argument fast path for permission checks
* **Discord - Keep deleted messages:** Filter ignored Flux events early and add 1/2-argument fast paths for message lookups and chat row generation
* **Discord - User activity notifications:** Check watched-user membership before running ID validation or store lookups, speeding up gateway event checks by 7.8x
* **Discord - Complete Quests automatically:** Avoid duplicate task lookups, eager application checks and repeated expiry date parsing when scanning Quests

## [1.16.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.15.0...v1.16.0) (2026-10-18)

### 🚀 Updated App Support

* **Discord:** Support `349.9 - Stable`

### ✨ New Features

* **Discord - Venus settings:** Add Backup and restore to save every Venus setting to a file or the clipboard and bring it back after patching again ([#68](https://github.com/VenusIsJaded/Venus-Patches/issues/68))
* **Discord - Venus settings:** Add a search bar to the Features list that finds features by name, description or option ([#68](https://github.com/VenusIsJaded/Venus-Patches/issues/68))
* **Discord - Venus settings:** Add Start with the essentials, a one-tap setup on a fresh install that turns on eight popular offline features, with Undo

### 🐛 Bug Fixes

* **Discord - Account switcher:** Fixed saved accounts disappearing some time after adding one, when Android had closed Discord in the background ([#69](https://github.com/VenusIsJaded/Venus-Patches/issues/69))
* **Discord - Custom themes:** Fixed some theme colors being ignored: `#transparent`, colors wrapped over lines and keys with a stray space (LilyPichu, Silver Sliver, It's Ourple!! and Sõmnum)
* **Discord - Complete Quests automatically:** Fixed Activity and Play Quests being reported complete before Discord confirmed completion
* **Discord - Complete Quests automatically:** Fixed queued Activity requests and late replies continuing after switch-off, logout or account changes
* **Discord - Complete Quests automatically:** Fixed Activity heartbeats continuing after expiry, suspension, removal or completion on another client
* **Discord - Complete Quests automatically:** Fixed accepting Quests dropping sealed metadata by passing the Quest ID where Discord expects a decision ID
* **Discord - Venus settings:** Fixed six switches on the Quests and Deleted messages pages staying in English in every other language
* **Discord - User and server reviews:** Fixed tapping Cancel on Discord's authorize screen showing a "Couldn't sign in" error instead of just closing

### 🔧 Improvements

* **Discord - Venus settings:** Tons of UI changes across every settings page, including a theme gallery, livelier previews, slimmer Features rows and haptics
* **Discord - Venus settings:** Remove Catalan as a settings language; Venus settings now come in 30 languages

### ⚡ Performance Improvements

* **Discord - Custom themes:** Switching themes or turning them off is more than three times faster

## [1.15.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.14.0...v1.15.0) (2026-10-17)

### ✨ New Features

* **Discord - Venus settings:** Add Catalan (Català) as a settings language, bringing Venus settings to 31 languages

### 🔧 Improvements

* **Discord - Venus settings:** Hand-review and refine all 30 translated settings languages for more natural, idiomatic wording
* **Discord - Venus settings:** Tons of UI changes to the previews, which now look and work like the real Discord screens they change

## [1.14.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.13.0...v1.14.0) (2026-10-17)

### ✨ New Features

* **Discord - Show hidden channels:** Add an option to turn off the locked-channel menu, so tapping a locked channel does nothing ([#62](https://github.com/VenusIsJaded/Venus-Patches/issues/62))

### 🐛 Bug Fixes

* **Discord - Account switcher:** Fixed every added account disappearing after Discord was closed in the background for a while and reopened ([#63](https://github.com/VenusIsJaded/Venus-Patches/issues/63))
* **Discord - Show hidden channels:** Fixed scrolling past a locked channel showing its menu even though you never tapped it ([#62](https://github.com/VenusIsJaded/Venus-Patches/issues/62))
* **Discord - Show hidden channels:** Fixed opening a server or Discord showing the menu of a locked channel you had last tapped there
* **Discord - Show hidden channels:** Fixed a locked channel listed above the real ones being picked as the server's first channel
* **Discord - Show hidden channels:** Fixed locked channels in the channel list showing an extra large lock beside Discord's own lock icon

### 🔧 Improvements

* **Discord - Venus settings:** Tons of UI changes, including animations, a designed About page, watchable previews with Try it, and a Quest progress bar

## [1.13.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.12.0...v1.13.0) (2026-10-16)

### ✨ New Features

* **Discord:** Add `Message highlights` patch ([#60](https://github.com/VenusIsJaded/Venus-Patches/issues/60))
* **Discord - Message highlights:** Change the left bar width and highlight colors for replies, mentions and deleted messages, with a live chat preview and any-color picker ([#60](https://github.com/VenusIsJaded/Venus-Patches/issues/60))
* **Discord:** Add `Custom themes` patch ([#57](https://github.com/VenusIsJaded/Venus-Patches/issues/57))
* **Discord - Custom themes:** Install Revenge and Vendetta color themes from a link, switch between them and show their chat wallpaper ([#57](https://github.com/VenusIsJaded/Venus-Patches/issues/57))

### 🐛 Bug Fixes

* **Discord - Venus button on profile bar:** Fixed the first tap after restarting opening Account settings or a black screen instead of Venus settings ([#58](https://github.com/VenusIsJaded/Venus-Patches/issues/58))
* **Discord - Account switcher:** Fixed adding a sixth account removing one of your saved accounts instead of keeping up to 50 ([#59](https://github.com/VenusIsJaded/Venus-Patches/issues/59))
* **Discord - Spaces in channel names:** Fixed forum, media, directory and app channels and channel mentions still showing dashes instead of spaces
* **Discord - Double-tap to reply:** Fixed double-tapping replying in channels where you can't reply, and Discord still showing its double-tap to react tips
* **Discord - Send long messages:** Fixed turning it off not bringing back Discord's real 2000 or 4000 character limit until restart
* **Discord - Send long messages:** Fixed long messages losing text-to-speech and mention settings, and waiting out slowmode even when you can bypass it
* **Discord - Read all button:** Fixed servers you're previewing, guest servers, servers with unread events and DMs past the first 20 staying unread
* **Discord - User activity notifications:** Fixed no notice showing when a watched person came online for the first time since Discord opened
* **Discord - Send audio as voice messages:** Fixed audio sent in announcement channels or as a scheduled message not becoming a voice message

### 🔧 Improvements

* **Discord - Venus settings:** Tons of UI changes: every option page redesigned with a status card, Discord's row icons and live previews

### ⚡ Performance Improvements

* **Discord - Pastel name colors:** Skip copying a message on every scroll frame when its colors didn't change
* **Discord - Send audio as voice messages:** Convert audio with less memory and without waiting between decoder steps

## [1.12.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.11.0...v1.12.0) (2026-10-14)

### ✨ New Features

* **Discord:** Add `Unlock app icons` patch
* **Discord - Unlock app icons:** Use any Discord app icon in Settings without Nitro, and hide the Nitro upsell button
* **Discord:** Add `Account switcher` patch
* **Discord - Account switcher:** Switch between up to 50 Discord accounts from a profile bar button or Venus settings
* **Discord:** Add `User activity notifications` patch
* **Discord - User activity notifications:** Show a notice when chosen friends or user IDs change status, start typing or send a message, inside or outside Discord

### 🐛 Bug Fixes

* **Discord - Complete Quests automatically:** Fixed Quests stopping progress when you leave Discord by keeping the Gateway connection alive in the background
* **Discord - Disable analytics:** Fixed session heartbeats, search tracking, impression events, and network action logs still being recorded and sent
* **Discord - Disable telemetry and touch logging:** Fixed screen smoothness (jank) session threads, startup TTI markers, and React component span timers still running on every screen change
* **Discord - Disable crash reporting:** Fixed Sentry breadcrumbs, crash tags, crash persistence, and JS exception reports still being recorded

### 🔧 Improvements

* **Discord - Disable analytics:** Expand analytics blocking to 48 Hermes bytecode functions, including ad/Quest tracking and voice stats
* **Discord - Disable telemetry and touch logging:** Expand telemetry blocking to 40 Hermes bytecode functions and 46 native Android methods
* **Discord - Disable crash reporting:** Expand crash reporting blocking to 16 Hermes bytecode functions and 45 native Sentry and CrashReporting methods

### ⚡ Performance Improvements

* **Discord:** Skip background over-the-air bundle update checks and downloads on launch since Venus always runs the packaged bundle
* **Discord:** Build the startup bytecode prelude from multi-character strings and dense array ops, cutting startup prelude instructions by two-thirds
* **Discord - Show hidden channels:** Cache PermissionStore's original permission check once instead of looking it up on every channel check
* **Discord - Use your phone's font:** Skip parsing the settings JSON on startup when the font switch is off
* **Discord - Use your phone's emojis:** Skip parsing the settings JSON on startup when the emoji switch is off

## [1.11.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.10.0...v1.11.0) (2026-10-13)

### ✨ New Features

* **Discord - Venus settings:** Venus settings in 30 languages, including Russian ([#50](https://github.com/VenusIsJaded/Venus-Patches/issues/50))
* **Discord - Venus settings:** Pick the settings language in Language, or follow Discord's
* **Discord - Translate messages:** Translate only the messages you pick, from the hold menu ([#50](https://github.com/VenusIsJaded/Venus-Patches/issues/50))
* **Discord - Translate messages:** Hold a message to show its original, or translate your own

### 🐛 Bug Fixes

* **Discord - Translate messages:** Fixed replies showing the quoted message untranslated instead of translating it like chat messages ([#51](https://github.com/VenusIsJaded/Venus-Patches/issues/51))

### 🔧 Improvements

* **Discord - Translate messages:** "Translated from" names the language in the settings language

## [1.10.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.9.0...v1.10.0) (2026-10-13)

### ✨ New Features

* **Discord - Keep deleted messages:** Clear kept messages from its settings, with a count of what's kept
* **Discord - Translate messages:** Clear saved translations from its settings

### 🔧 Improvements

* **Discord - Venus settings:** Tons of UI changes: Settings is now Features in six groups, with Discord icons, clearer wording and an About page
* **Discord:** Patches are named by what they do, the same as in Venus
* **Discord - Send Nitro stickers and emojis as links:** Removed Always send links, which only replaced emojis you could already use
* **Discord - Skip delete confirmation:** One switch now covers both messages and link previews
* **Discord - Pastel name colors:** Webhooks always get their color from their name
* **Discord - User and server reviews:** The send button always uses the profile's colors

## [1.9.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.8.0...v1.9.0) (2026-10-13)

### ✨ New Features

* **Discord:** Add `ValidUser` patch
* **Discord - ValidUser:** Fix @unknown-user mentions automatically, with no extra taps
* **Discord:** Add `Profile bar settings button` patch
* **Discord - Profile bar settings button:** Open Venus settings from a button next to the notifications bell
* **Discord:** Add `Split Large Messages` patch
* **Discord - Split Large Messages:** Send messages over the limit as several, keeping code blocks closed
* **Discord:** Add `Translate messages` patch
* **Discord - Translate messages:** Show messages in other languages translated into your language, newest first
* **Discord - Translate messages:** Keep translations on your phone, so reopened chats show them at once

### 🐛 Bug Fixes

* **Discord - Pastelize:** Fixed Color message text leaving the quoted message in a reply uncolored instead of using that author's pastel color ([#45](https://github.com/VenusIsJaded/Venus-Patches/issues/45))

### 🔧 Improvements

* **Discord - Venus settings:** Every feature starts off, so nothing changes until you turn it on

## [1.8.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.7.0...v1.8.0) (2026-10-12)

### ✨ New Features

* **Discord - Disable telemetry and touch logging:** Also stop per-screen smoothness (jank) stats from being saved and sent

### 🐛 Bug Fixes

* **Discord - Disable advertising identifiers:** Fixed AppsFlyer still reading your Google advertising ID directly even with the patch enabled
* **Discord - QuickDelete:** Fixed link preview removals still skipping the confirmation prompt after QuickDelete was turned off
* **Discord - NoDelete:** Fixed typing 0 as the maximum saved messages immediately resetting the limit back to 512
* **Discord - NoDelete:** Fixed NoDelete writing a saved messages file too large to read back on the next startup
* **Discord - NoDelete:** Fixed kept messages and edit history from servers you left staying in memory and storage forever
* **Discord - Quest Completer:** Fixed Quest Completer not starting until a reconnect when Discord connected before saved settings finished loading
* **Discord - Force system emojis:** Fixed keycap emojis like 1️⃣ and #️⃣ still showing Discord's Twemoji images instead of your phone's emojis
* **Discord - Force system emojis:** Fixed React Native emojis not matching native chat emojis when the saved settings file couldn't be read
* **Discord - Force system emojis:** Fixed outdated cached emoji drawings continuing to show after a system or emoji font update
* **Discord - Force system font:** Fixed tapping Reopen now restarting Discord before the new font setting finished saving, or when saving failed
* **Discord - Read All:** Fixed Read All showing "Nothing unread" even when unread servers or DMs couldn't be cleared yet
* **Discord - Message tap gestures:** Fixed turning gestures off mid-tap still opening the message editor or starting a reply
* **Discord - Custom voice messages:** Fixed cancelling an audio upload while it was converting deleting the message instead of only stopping the conversion
* **Discord - FreeNitro:** Fixed sticker or emoji names containing `||`, `~~` or `#` turning the sent link label into a spoiler, strikethrough or heading

### 🔧 Improvements

* **Discord - Read All:** Say why unread items couldn't be cleared and which servers were marked as read
* **Discord - Force system emojis:** Old emoji drawings are removed from the cache in the background
* **Discord - Disable telemetry and touch logging:** Say that it also stops per-screen smoothness stats
* **Discord - Disable advertising identifiers:** Say that it stops both Discord and AppsFlyer reading the ID

### ⚡ Performance Improvements

* **Discord - Pastelize:** One copy of each chat row's message instead of up to four
* **Discord - Pastelize:** Mentions are copied only when something in them actually changes
* **Discord - Hide call button:** Look up the call icon once per profile instead of per element
* **Discord - Hidden Channels:** Reuse one renamed copy per locked channel instead of copying it every lookup
* **Discord - Hidden Channels:** No longer copy every channel of every server when Discord connects
* **Discord - NoDelete:** Edit history reuses the joined message content until something changes
* **Discord - Dashless:** Check channel types without building a list every time
* **Discord - Custom voice messages:** Check audio file types without building a list every time
* **Discord - PlatformIndicators:** Less work on every presence update
* **Discord - Venus settings:** Row switches and arrows are found once instead of on every render
* **Discord - File size on picker:** Known sizes show straight away on recycled photo tiles, never an old one
* **Discord - File size on picker:** Size badges share one style instead of making new ones per tile
* **Discord - Force system font:** Threads meeting a new font family share one cache slot

## [1.7.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.6.0...v1.7.0) (2026-10-11)

### ✨ New Features

* **Discord:** Add `Hide call button` patch, which removes Call from profiles so Message fills the row

### 🐛 Bug Fixes

* **Discord - Message tap gestures:** Fixed tapping your own message three times opening the message editor before the third tap arrived instead of deleting it
* **Discord - Venus settings:** Fixed sub-options on a feature's page staying interactive while the feature's main switch was turned off
* **Discord - NoDelete:** Fixed the maximum saved messages text box remaining editable while NoDelete was turned off

### 🔧 Improvements

* **Discord - Venus settings:** Clearer descriptions for every setting, including NoDelete, Pastelize and Message tap gestures

## [1.6.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.5.0...v1.6.0) (2026-10-11)

### ✨ New Features

* **Discord - Message tap gestures:** Double-tap a message to reply, or your own message to edit it
* **Discord - Message tap gestures:** Tap your own message three times to delete it
* **Discord - NoDelete:** Show what an edited message said before, faded and crossed out above it

### 🐛 Bug Fixes

* **Discord:** Fixed passkey and security key prompts failing with "RP ID cannot be validated" instead of explaining why Android blocks them in a re-signed APK ([#37](https://github.com/VenusIsJaded/Venus-Patches/issues/37))
* **Discord - NoDelete:** Fixed deleted messages permanently stopping from saving on disk if the saved archive file became corrupted
* **Discord - Venus settings:** Fixed the About page displaying an outdated Venus Patches version number
* **Discord - Read All:** Fixed error toasts starting with a redundant "Error:" prefix

### ⚡ Performance Improvements

* **Discord - NoDelete:** Saving a deleted message no longer rewrites every other saved message
* **Discord - NoDelete:** Chats with kept messages do fewer checks per message
* **Discord - Hidden Channels:** Do less work while turned off

## [1.5.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.4.4...v1.5.0) (2026-10-11)

### ✨ New Features

* **Discord:** Add `Force system font` patch
* **Discord:** Add `Force system emojis` patch
* **Discord:** Add `Hide gift button` patch
* **Discord:** Add `Hide Quests promotion` patch

### 🔧 Improvements

* **Discord - Venus settings:** Tons of UI changes: Plugins is now Settings, in groups, with plain switch names and arrows for more options
* **Discord - Quest Completer:** Starts off until you turn on Complete Quests automatically

## [1.4.4](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.4.3...v1.4.4) (2026-10-10)

### 🐛 Bug Fixes

* **Discord - Read All:** Fixed the server list reusing stale props from an older render when the guild list data had not changed
* **Discord - Quest Completer:** Fixed Play Quests leaving the game executable unnamed for the rest of the session if looking up the game failed once while offline
* **Discord - Quest Completer:** Fixed a temporary network error when enrolling in a Quest pausing retries for 6 hours instead of retrying after a few minutes
* **Discord - Quest Completer:** Fixed Quest Completer sending heartbeats forever when Discord stopped counting progress for a stuck Quest
* **Discord - ReviewDB:** Fixed the close button on the review overflow menu not closing the action sheet

### ⚡ Performance Improvements

* **Discord - NoDelete:** Opening Discord no longer rewrites saved deleted messages
* **Discord - Quest Completer:** The settings page no longer redraws every 5 seconds

## [1.4.3](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.4.2...v1.4.3) (2026-10-09)

### 🐛 Bug Fixes

* **Discord - Quest Completer:** Fixed Play Quests failing with "HTTP 401" and never finishing because Discord's native interceptor overwrote the desktop User-Agent
* **Discord - Quest Completer:** Fixed non-mobile Activity Quests being rejected with "HTTP 401" for the same reason

### 🔧 Improvements

* **Discord - Quest Completer:** Play time is reported once a minute, the way Discord for Windows does

## [1.4.2](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.4.1...v1.4.2) (2026-10-09)

### ✨ New Features

* **Discord - Quest Completer:** Complete Play Quests without installing or starting the game
* **Discord - Quest Completer:** Add a Play Quests switch

## [1.4.1](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.4.0...v1.4.1) (2026-10-09)

### ✨ New Features

* **Discord:** Add `Quest Completer` patch, which accepts and completes video and Activity Quests in the background

## [1.4.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.3.9...v1.4.0) (2026-10-09)

### 🐛 Bug Fixes

* **Discord - ReviewDB:** Fixed refreshing a profile's reviews evicting another open profile's cached reviews
* **Discord - Hidden Channels:** Fixed some locked channels missing from the server channel list when their category was collapsed or empty

### 🔧 Improvements

* **Discord:** Restore the 1.3.8 feature names in Morphe and Venus settings
* **Discord - PlatformIndicators:** Restore the original icons

### ⚡ Performance Improvements

* **Discord - NoDelete:** Lowering the maximum is instant
* **Discord - NoDelete:** Smoother chats with NoDelete or Pastelize on
* **Discord - Hidden Channels:** Opening a server does less work

## [1.3.9](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.3.8...v1.3.9) (2026-10-09)

### 🔧 Improvements

* **Discord:** Name every feature after what it does
* **Discord - PlatformIndicators:** New device icons
* **Discord:** Remove the size cap on Venus's built-in code

## [1.3.8](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.3.7...v1.3.8) (2026-10-09)

### 🐛 Bug Fixes

* **Discord - NoDelete:** Fixed turning NoDelete off wiping permanently saved deleted messages from disk
* **Discord - Read All:** Fixed a single DM channel without a last message stopping the rest of your DMs from being marked as read
* **Discord - JumpToTop:** Fixed the channel long-press action sheet remounting from scratch on every state update

### ⚡ Performance Improvements

* **Discord - Hidden Channels:** Half the permission checks
* **Discord - PlatformIndicators:** Less work when people come online, type or change status
* **Discord - NoDelete:** Less work when messages are deleted

## [1.3.7](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.3.6...v1.3.7) (2026-10-08)

### 🚀 Updated App Support

* **Discord:** Add support for `348.10 - Stable` and drop `347.12`

### 🐛 Bug Fixes

* **Discord - Disable crash reporting:** Fixed native Sentry and CrashReporting methods still sending crash reports because of a wrong DEX return-value opcode
* **Discord - JumpToTop:** Fixed the Jump to Top option not appearing in the long-press menu for threads and forum posts
* **Discord - PlatformIndicators:** Fixed device icons not showing next to members inside the voice channel panel

### ⚡ Performance Improvements

* **Discord - PlatformIndicators:** Icons only update when that person's status changes

## [1.3.6](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.3.5...v1.3.6) (2026-10-08)

### ✨ New Features

* **Discord:** Add `Read All` patch

### 🐛 Bug Fixes

* **Discord - Pastelize:** Fixed Color message text turning messages solid blue and printing literal "usernameOnClick" text in chat

## [1.3.5](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.3.4...v1.3.5) (2026-10-08)

### 🐛 Bug Fixes

* **Discord - File size on picker:** Fixed files just under 1 MB rounding up to "1024 KB" instead of "1 MB"
* **Discord - NoDelete:** Fixed backspacing the maximum saved messages input box immediately resetting it to 512 while typing

### 🔧 Improvements

* **Discord:** Group patches under Plugins and Privacy in Morphe, with plain descriptions
* **Discord - Venus settings:** Changing an option applies right away

### ⚡ Performance Improvements

* **Discord - NoDelete:** Less background work with saving off
* **Discord:** Patching is faster

## [1.3.4](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.3.3...v1.3.4) (2026-10-07)

### 🐛 Bug Fixes

* **Discord:** Fixed Morphe Manager failing to add Venus Patches as a source with "The patch bundle could not be downloaded"

### ⚡ Performance Improvements

* **Discord - Pastelize:** Name colors are reused instead of worked out for every message
* **Discord:** Patching uses less memory

## [1.3.3](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.3.2...v1.3.3) (2026-10-07)

### ✨ New Features

* **Discord - Custom voice messages:** Use Discord's own waveform
* **Discord - Custom voice messages:** Support more WAV types and more audio files

### 🐛 Bug Fixes

* **Discord - Custom voice messages:** Fixed audio files failing to convert into voice messages with "Audio format changed during decoding" when the decoder adjusted its output format

## [1.3.2](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.3.1...v1.3.2) (2026-10-06)

### ✨ New Features

* **Discord - ReviewDB:** Open server reviews inside the server menu

## [1.3.1](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.3.0...v1.3.1) (2026-10-06)

### 🐛 Bug Fixes

* **Discord - PlatformIndicators:** Fixed React crashing with "Rendered fewer hooks than expected" when switching between chats

## [1.3.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.2.9...v1.3.0) (2026-10-05)

### ✨ New Features

* **Discord - PlatformIndicators:** Show icons in the DM list and DM top bar

### 🐛 Bug Fixes

* **Discord - NoDelete:** Fixed the red outline on deleted messages only appearing after leaving and reopening the chat

## [1.2.9](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.2.8...v1.2.9) (2026-10-05)

### ✨ New Features

* **Discord - NoDelete:** Add Save permanently and a maximum number of saved messages

### 🐛 Bug Fixes

* **Discord - NoDelete:** Fixed your own deleted messages disappearing instead of being kept in chat
* **Discord - ReviewDB:** Fixed tapping Reviews in the server menu not opening the server's reviews sheet

## [1.2.8](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.2.7...v1.2.8) (2026-10-05)

### ✨ New Features

* **Discord:** Add `Disable advertising identifiers` patch

### 🐛 Bug Fixes

* **Discord:** Fixed a cached over-the-air Discord bundle update bypassing all Venus patches and privacy options

## [1.2.7](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.2.6...v1.2.7) (2026-10-05)

### ✨ New Features

* **Discord:** Add `Disable analytics`, `Disable crash reporting`, `Disable telemetry and touch logging` and `Disable install attribution` patches

## [1.2.6](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.2.5...v1.2.6) (2026-10-05)

### 🐛 Bug Fixes

* **Discord - ReviewDB:** Fixed OAuth sign-in discarding the authorization token because Discord dismissed the modal before invoking the callback
* **Discord - NoDelete:** Fixed kept deleted messages appearing out of chronological order in chat

## [1.2.5](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.2.4...v1.2.5) (2026-10-05)

### 🔧 Improvements

* **Discord - ReviewDB:** Use Discord's own look, and ask before deleting or reporting

## [1.2.4](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.2.3...v1.2.4) (2026-10-05)

### ✨ New Features

* **Discord - Hidden Channels:** Tapping a locked channel shows when it was created and last used

### 🐛 Bug Fixes

* **Discord - Hidden Channels:** Fixed tapping a locked channel opening two info popups one after another

## [1.2.3](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.2.2...v1.2.3) (2026-10-04)

### 🐛 Bug Fixes

* **Discord - Hidden Channels:** Fixed locked channels showing placeholder text instead of their real channel names when Discord redacted the store

## [1.2.2](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.2.1...v1.2.2) (2026-10-04)

### 🐛 Bug Fixes

* **Discord:** Fixed ReviewDB, Hidden Channels, PlatformIndicators and NoDelete missing UI elements and behavior from the original plugins

## [1.2.1](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.2.0...v1.2.1) (2026-10-04)

### 🐛 Bug Fixes

* **Discord:** Fixed Pastelize, ReviewDB, Hidden Channels, PlatformIndicators and NoDelete failing to activate on startup

## [1.2.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.1.1...v1.2.0) (2026-10-04)

### ✨ New Features

* **Discord:** Add `Pastelize`, `PlatformIndicators` and `ReviewDB` patches

## [1.1.1](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.1.0...v1.1.1) (2026-10-04)

### ⚡ Performance Improvements

* **Discord - Custom voice messages:** Faster conversion

## [1.1.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.0.0...v1.1.0) (2026-10-04)

### ✨ New Features

* **Discord:** Add `No typing`, `QuickDelete`, `NoDelete`, `JumpToTop` and `Hidden Channels` patches

## [1.0.0](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.0.0-dev.3...v1.0.0) (2026-10-04)

### ✨ New Features

* **Discord:** Add `Venus settings`, `CopyBios`, `Dashless`, `FavouriteAnything` and `FreeNitro` patches

## [1.0.0-dev.3](https://github.com/VenusIsJaded/Venus-Patches/compare/v1.0.0-dev.1...v1.0.0-dev.3) (2026-10-03)

### 🐛 Bug Fixes

* **Discord:** Fixed Discord crashing or freezing on startup after patching because the runtime was loaded as a second JS bundle in Bridgeless mode

## 1.0.0-dev.1 (2026-10-03)

### ✨ New Features

* **Discord:** Add `File size on picker` and `Custom voice messages` patches
