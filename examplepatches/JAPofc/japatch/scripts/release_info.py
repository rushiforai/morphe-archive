#!/usr/bin/env python3
"""The release notes for one version, in the section format Morphe Manager draws as cards.

    python3 scripts/release_info.py --check     # validates every entry below, fails on anything Morphe can't split up
    python3 scripts/release_info.py 1.0.1       # the GitHub release body for 1.0.1

Morphe Manager turns each "### " heading into a card (New, Fixes, Improvements, Performance) and each
"* **Scope:** text" bullet into a row. Keep that shape: a plain sentence shows as one grey block.
"""
import re
import sys

ROOT = __import__("pathlib").Path(__file__).resolve().parents[1]

# The headings Morphe Manager maps to its own icons and titles, in the order they're written. App support comes
# first, so the Discord version a release works with is the first thing you read.
SECTIONS = ["### 🚀 Updated App Support", "### ✨ New Features", "### 🐛 Bug Fixes", "### 🔧 Improvements",
            "### ⚡ Performance Improvements"]
HEADING = re.compile(r"^## \[(?P<version>[^\]\s]+)\] \((?P<date>\d{4}-\d{2}-\d{2})\)$")
BULLET = re.compile(r"^\* \*\*(?:Discord|JaPatch)(?: - [^*:]+)?:\*\* (?P<desc>\S.*[^.])$")
# Release-page leftovers that don't belong in notes.
BANNED = re.compile(r"good to know|sha-?256|^#+ install|wasn't published separately|checked by patching", re.I | re.M)
# "#139" reads like an issue or pull request, and every one of these ever written pointed at nothing: the numbers came
# from a private list. Vague again ("issue numbers") is fine; a bare number is not.
ISSUE_REF = re.compile(r"(?<![\w&])#\d+\b")

# Newest first. One "## [version] (date)" per release; the body is Morphe's section format.
RELEASES = r"""
## [1.0.29] (2026-11-28)

### ✨ New Features

* **Discord - Keep message edit history:** Edit history was already being stored, but only inside Keep deleted messages, so it could not be used by anyone who did not also want deleted messages kept. It is a switch of its own now, on by default, and older versions sit above the message struck through with Discord's own block quote, exactly as before. Turning off Keep deleted messages no longer throws the history away
* **Discord - Copy part of a message:** Long press a message and pick Copy text to open it in a box you can select with the phone's own handles, with a Copy button for all of it. Discord's own long press copies the whole message or nothing, which makes quoting one line out of a long post impossible on a phone

### 🔧 Improvements

* **JaPatch - The NOTICE no longer names authors that are not there:** The Who wrote this section listed two earlier commit names that the rewritten history does not contain. Every commit and every release in this repository is by JAPofc, and the section now says only that

## [1.0.28] (2026-11-28)

### 🐛 Bug Fixes

* **Discord - Four features that were never switched on:** Fixed Bookmark messages, Save profile pictures, Server time and Nicknames had a page, an icon and a hook, and were missing from the one list that marks their module before Discord loads it, so the row was never drawn and the hook never ran. The Features page is what made it invisible - a feature with no row takes its whole section with it, so the Messages section was simply not there. They are counted now: 81 in the app, in the README and on the badge, from one calculation instead of three
* **JaPatch - Lines that read the same three files:** Fixed the gap where a feature could have a row, an icon and a hook and still never run; a test now fails when a feature has a row and an icon but nothing selects its module, and when a case in the module switch can never be reached. That pair of checks is what would have caught this, and the count in the app, the README and the badge now comes from the same place instead of drifting apart as 77, 79 and 84

## [1.0.27] (2026-11-28)

### 🔧 Improvements

* **JaPatch - Credits:** JaPatch is a fork of Venus Patches, and NOTICE now says so with the proportions measured file by file - PrivacyPatches and PasskeyPatches unchanged, HbcPrelude, HbcPrivacy and BrandingPatches two lines each, DiscordPatches by 48, the runtime by about a tenth
* **JaPatch - Credits:** The 1.0.26 notes said the tooling was Venus and stopped there, which read as if the patches were not

## [1.0.26] (2026-11-27)

### ✨ New Features

* **Discord - Stay in calls when you are alone:** Discord leaves a voice channel by itself three minutes after you become the only person in it. The new switch in Settings stops that one timer, so you stay in the call until you press Disconnect yourself. Pressing Disconnect, closing the channel and the leave chime are untouched, because none of them goes through that timer
* **Discord - Stay in calls when you are alone:** A second switch hands the one channel people expect to be left in back to Discord: with Leave the server's AFK channel on, being alone in a server's own AFK channel still moves you the way Discord's own timeout does

## [1.0.25] (2026-11-26)

### ✨ New Features

* **Discord - Bookmark messages:** Hold a message and pick Bookmark to keep it on this phone, then find it again from Settings. Bookmarks are one list per Discord account, are never sent to Discord, and clearing them says it cannot be undone
* **Discord - Save profile pictures and banners:** Hold a profile and the menu gains Save profile picture and Save banner when that profile has the one you held it for. The picture goes through Android's own Save to screen, so the folder is yours, and nothing is fetched until you pick one
* **Discord - Show the time next to the server name:** A clock in the chat header, set to the time you choose for your servers, in 12 or 24 hours. A server has no timezone in Discord's data, so the page says that one time is used for every server instead of guessing one
* **Discord - Server nicknames for this phone:** Give people in a server a name only you see, from a message's own menu. It is saved in this phone's settings file, swapped into the message row on a copy, and never written back to Discord
* **Discord - Why something does not work:** One page that answers the questions that are not a patch away: passkeys need Discord's own signature, noise suppression is Discord's native audio, an upload can stall on the network, an icon pack can be missing a picture, and which two features ask Discord to accept something it does not offer

### 🐛 Bug Fixes

* **Discord - Uploads:** Fixed an upload that stops moving sitting on Sending forever. After 60 s without progress the app says so, with the file, its size and the network on screen, and Discord's own Cancel button under the file; nothing is cancelled for you
* **Discord - Compress big files:** Fixed compression re-encoding a file that already fits the channel's limit, which is left exactly as it is now

### 🔧 Improvements

* **Discord - Reviews, Translations and GIFs:** Every one of those requests now has a time limit and says what went wrong when it hits it, so a slow server reads as slow rather than as nothing happening

## [1.0.24] (2026-11-27)

### ✨ New Features

* **Discord - Reviews:** The Reviews page now checks the server address it is pointed at and says what came back. A server that answers but has no review route reads as "nothing stored" everywhere else, which is how reviews that are on the server looked empty; the page now says the server did not answer, or that it belongs to a different Discord app than the one this build signs in with
* **Discord - User notifications:** A notification now carries the picture of the person it is about, taken from the user Discord already has on the phone. It is sent as an extra field after the required ones, so a build that ignores it shows the same notification as before

### 🐛 Bug Fixes

* **Discord - Warning screens:** Fixed a title drawn twice at the top of the two warning screens, and the three warning lines under it, which were written as one block of text so every language showed them in English
* **Discord - Translations:** Fixed the language check missing whole screens: it now reads the strings that warning screens, confirmation dialogs and preset lists carry, not only the ones written inside a tr() call, and everything it finds is translated in all 34 languages, so a screen cannot ship half in English again

### 🔧 Improvements

* **Discord - Streaming hours tracker:** The feature is named for what it tracks. It follows the Go Live session you are already running and how far the Streaming badge really is; it never starts a stream or sends anything
* **Discord - Keep Bluetooth audio clear in calls:** The page and the feature's own description now say what people actually hit: with the headphones in music quality, calls use your phone's microphone, so you can sound muffled or distant. The switch that uses the headset's microphone instead is named right there, so the fix is one tap away

## [1.0.23] (2026-11-27)

### ✨ New Features

* **Discord - Complete Quests automatically:** The Quests page now says how many rewards are waiting, counted from the Quests Discord itself has marked finished. A row next to it takes them for you, one at a time, and leaves the reward alone if Discord asks for a captcha instead of trying again
* **Discord - Complete Quests automatically:** A second switch takes those rewards by itself once a Quest finishes. It is off until you turn it on, and turning it on means reading three points, ticking each one, and typing a word

### 🐛 Bug Fixes

* **Discord - Complete Quests automatically:** Fixed the Quests page still saying you claim rewards yourself. The line is gone, and the feature's own description says a Quest can now be paid out, so the README and the app cannot disagree about it

### 🔧 Improvements

* **Discord - Complete Quests automatically:** There is a Faster heartbeat option, and the page says plainly what it does and does not do: a Quest still takes the same time, because Discord counts the minutes on its own clock. It only asks Discord more often, three times as often as Discord's own app does, and the page says so before you turn it on

### ⚡ Performance Improvements

* **Discord - Complete Quests automatically:** A reward Discord already marked finished is claimed once. A refused claim is remembered for six hours rather than asked again on every scan, so a captcha cannot turn into a loop

## [1.0.22] (2026-11-27)

### ✨ New Features

* **Discord - Streaming badge:** Rewritten to read where Discord actually reports a stream instead of guessing a Discord module number. It listens for the Go Live events Discord already sends, and takes the session and the number of people watching from them, so a stream that is not yours is never counted and a paused stream stops
* **Discord - Streaming badge:** The page now shows the week: how long each of the last seven days ran, the average, and roughly how many days the next tier needs at that pace. It also says when a stream is paused, and when it is live with nobody watching
* **Discord - Streaming badge:** It sends nothing at all. The hours are counted by Discord's own media servers, so a report from the phone could not add to them; the page only reads what Discord already reports. The only thing saved on the phone is how many minutes each day was live

### 🐛 Bug Fixes

* **Discord - Streaming badge:** Fixed the feature 1.0.21 announced never actually being in the app. The patch asked for its key, but the list the build turns into the features table never carried it, so the row and its settings page were dropped without an error. It is in the table now, and the list is checked against every key the patches ask for, so the same thing cannot happen quietly again
* **Discord - Documentation:** Fixed the header claiming 29 languages while 34 ship, and 82 features while the manifest listed 83 patches. Both badge files and the table are read by the audit now, so they cannot drift again
* **Discord - Reviews:** Fixed both vote buttons on a review drawing a thumbs up. Discord has no thumbs down icon, and its icon modules export one picture each, so the No button asked a module for an icon that does not exist and fell back to the same thumb. It is the same thumb turned over now, and a new check matches every icon the runtime asks for against the module map, so a wrong one cannot sit there looking like a design choice

### 🔧 Improvements

* **Discord - Streaming badge:** Live time is kept per day, so the estimate is built from what actually happened rather than a fixed guess

## [1.0.21] (2026-11-27)

### ✨ New Features

* **Discord - Streaming badge:** A new feature that reports the Go Live session you are already running, so its hours count toward the Streaming badge. It reads the session, its id and its elapsed time from Discord itself, and reports nothing when you are not live
* **Discord - Streaming badge:** The page says what is actually happening right now: not live, live with nobody watching, or live with the time and how many people are watching. Streaming to an empty channel earns nothing, and the page says so instead of pretending otherwise
* **Discord - Complete badges automatically:** The badge card now shows your Streaming tier and how far the next one is, read from Discord like the other two rows

### 🐛 Bug Fixes

* **Discord - Streaming badge:** Fixed the feature being able to claim progress it cannot make. Discord counts stream hours on its own servers, so a report alone never adds a minute: the feature is marked risky, and its warning says plainly that it cannot create a session

### 🔧 Improvements

* **Discord - Every page:** A runtime test holds that promise: no report leaves the app without a live session, without a viewer, and never twice for the same minute

## [1.0.20] (2026-11-27)

### ✨ New Features

* **Discord - Settings:** **Account and session** is now a page, not a two-line row. It names the account you are signed in as, says how many saved accounts still hold a token, and flags a session that belongs to another account, the state that makes a switch fail with no explanation. Your tokens are never shown, only whether one exists
* **Discord - Settings:** The page also says where a running Quest is: on which account, or the reason it stopped. "It keeps going after I turned it off" is answerable now
* **Discord - Settings:** The whole page is translated: every one of the 34 languages names each row, including the five newest, which no longer ship with untranslated rows at all

### 🐛 Bug Fixes

* **Discord - Every page:** Fixed the README claiming 34 languages while listing 35 names, and three other places in it still saying 29. A script now reads the counts from the files the runtime uses, so the two cannot drift apart again
* **Discord - Every page:** Fixed the release notes check never running two of its own rules. The list of leftovers it was supposed to reject was written and then never called, which is how a forbidden line shipped twice

### 🔧 Improvements

* **Discord - Every page:** A new check compares every number the documents state against the files behind it: languages in the picker, files on disk, patch counts, and the notes for the version that is actually published. It runs in CI
* **Discord - Every page:** A runtime test reads the Account and session page against a fake phone and fails if it ever prints a token or miscounts saved accounts

## [1.0.19] (2026-11-27)

### 🐛 Bug Fixes

* **Discord - Every page:** Fixed What's new still drawing the old 1.0.17 entry, the one that was full of tracking numbers nobody outside the project could open. Removing them from the source was not enough: the notes ship inside the bundle, so 1.0.18 carried a copy of the text as it used to be. The page now shows the entry as rewritten

## [1.0.18] (2026-11-27)

### 🚀 Updated App Support

* **Discord - Every page:** Five more languages: Arabic, Bengali, Malay, Persian and Urdu. Arabic, Persian and Urdu read right to left, and JaPatch's own pages now lay themselves out that way instead of forcing a left-to-right flow on right-to-left text. The newest languages are still being completed, so a line that is not written yet falls back to English rather than showing a blank row

### ✨ New Features

* **Discord - About:** **What's new** opens inside the app. The release notes ship in the bundle, so the page works offline, lists the newest eight releases and needs no network or browser; the GitHub list is one tap further
* **Discord - About:** The update row now opens what changed before sending anyone to GitHub, so a newer version is explained where it is noticed
* **Discord - Backup and restore:** A restore says which features it flips, by name, before anything is replaced. "12 features will be on" said nothing about the two that were set up by hand

### 🐛 Bug Fixes

* **Discord - Complete Quests:** Fixed the feature switching on with no warning. It is now marked risky like Complete badges, because Discord can pause Quests on accounts that finish them from a phone, and repeated requests after a refusal are what get a sign-in revoked
* **Discord - Platform spoof:** Fixed the same gap: it turns on only after a confirmation that says Discord does not allow it and accounts have been actioned for it
* **Discord - Every page:** Fixed the README's feature table drifting from the patch list, and the version, release notes and translations being unchecked. All four checks now run in CI, so a release cannot ship a table, a note or a language file that no longer matches the code

### 🔧 Improvements

* **Discord - Every page:** A runtime test now fails when the settings runtime outgrows its line budget or one function swallows the file, so the single-file runtime cannot quietly rot

## [1.0.17] (2026-11-27)

### 🔧 Improvements

* **Discord - Every page:** The release notes and the code comments used to point at issue numbers. Those issues were never public: the numbers came from a private list, so for anyone reading the repository they pointed at nothing. They are gone, and each note now says what it means in words instead. Nothing in the app behaves differently

## [1.0.16] (2026-11-27)

### ✨ New Features

* **Discord - Keep deleted messages:** A **Don't keep these** list: paste a profile, server or channel link (or the ID on its own) and deleted messages from there are never kept. Before this, the only filters were "your own" and "bots"; muting one noisy channel meant turning the whole feature off
* **Discord - Show hidden channels:** A locked channel's details now say who can see it, worked out from the permission overwrites Discord already sent: whether `@everyone` is excluded, which roles are allowed or hidden by name, and how many people have their own exception. Nothing is guessed when Discord sent no overwrites

### 🐛 Bug Fixes

* **Discord - Quest completer:** Fixed the feature retrying for hours after Discord answered 401 or 403 to a Quest request. That answer means the session is no longer allowed to act, and asking again is what turns one refusal into a revoked sign-in. It now stops completely, says so on the Quests page, and stays stopped until Complete Quests is turned off and on again

## [1.0.15] (2026-11-27)

### ✨ New Features

* **Discord - Settings:** The About page now checks which release is newest and says so, with one tap to open it. It asks GitHub once when the page opens, never at launch and never on a timer, and it sends nothing about you; there is a **Check for updates** switch right under it for anyone who would rather it did not ask at all

### 🐛 Bug Fixes

* **Discord - User and server reviews:** Fixed the server address being saved exactly as typed, however wrong: a missing `https://`, a typo in it, a trailing note or a stray `@` became the address, and Reviews then stayed empty with nothing to act on. Saving now refuses it and says what to change, in a line under the field
* **Discord - User and server reviews:** Fixed plain `http://` being accepted for a server on the internet. Sign-in cannot come back to a plain address and a sign-in token over it can be read on the way, so it is now allowed for a server on your own network only

## [1.0.14] (2026-11-27)

### ✨ New Features

* **Discord - Translate messages:** The bar now appears for a reader whose language is Indonesian. It never could before: Indonesian was missing from the list of Latin-script languages the reader's own words are looked up in, so the check gave up before reading a single word — no chat, in any server or DM, could raise it. Malay shares the same missing entry and is fixed with it
* **Discord - Translate messages:** A chat in Spanish, French, German or English now raises the bar for an Indonesian reader. The last word check only ever ran for readers whose language was English, so a short line in another Latin-script language stayed silent unless it carried a `¿` or an accent
* **Discord - Translate messages:** English itself is recognised properly. Its word list had 20 entries, so an ordinary English sentence matched none of them and was never offered for translation; it now has its own real list
* **Discord - User and server reviews:** Reviews arrives pointed at the server JaPatch runs, https://japatch-reviewdb.fly.dev, so there is nothing to fill in before using it. It is still one editable line under Reviews -> Server: any ReviewDB-compatible server goes there instead, and clearing it turns Reviews off

### 🐛 Bug Fixes

* **Discord - Translate messages:** Fixed the bar being drawn in the same colour as the chat header, which made it look like part of the header rather than something to tap. It now sits on the lowest surface with a brand-coloured border, and floats when a chat has no header to sit under
* **Discord - Translate messages:** Fixed the bar being drawn only in manual mode. With Translate set to automatic, the bar is the only way to reach it, and it was the one the mode did not draw
* **Discord - Quest completer:** Fixed closing Discord while a quest is running leaving a request in flight to be killed by Android ("Request has been terminated"), which Discord then showed on its quest page as "Something went wrong", with a reminder that never came back. Quests now stop the moment the app leaves the screen and resume from the last report on the next launch

## [1.0.13] (2026-11-26)

### ✨ New Features

* **Discord - User and server reviews:** Reviews can be marked helpful or not, with a thumb each way and the count under the text. It is one vote per person per review and tapping the same thumb again takes it back; a server that has no votes simply does not show them
* **Discord - User and server reviews:** The server menu's Reviews row opens the same sheet a profile's menu opens. It used to expand inside the server sheet, which drew one row and swallowed the rest of the sheet

### 🔧 Improvements

* **Discord - User and server reviews:** The review box says "Tap to edit your review" once you have written one, because writing again replaces your words rather than adding a second review

## [1.0.12] (2026-11-26)

### 🐛 Bug Fixes

* **Discord - User and server reviews:** Fixed the page still saying "Signed in as" after the server address was changed. The sign-in belonged to the old server, so it showed a name for an address never signed in to; changing the address now signs out of the old one first
* **Discord - User and server reviews:** Fixed a sign-in made on one server being carried over to the next. A token is only good for the server that issued it, and the next address typed could have been anyone's

### 🔧 Improvements

* **Discord - User and server reviews:** The sign-in app row no longer keeps the previous server's app after the address changes, so it asks the new server which app it belongs to

## [1.0.11] (2026-11-26)

### ✨ New Features

* **Discord - User and server reviews:** The patch bundle is signed now, so an install can tell a bundle this source built from one someone else swapped in. Morphe Manager trusts the key the first signed bundle carries, so this release starts that trust

### 🔧 Improvements

* **Discord - User and server reviews:** The key behind the signature is published with the bundle, which is what lets Manager hold every later release to the same one

## [1.0.10] (2026-11-26)

### 🐛 Bug Fixes

* **Discord - User and server reviews:** Fixed the app asking where a server's reviews live: a server that answers its /health with "not found" (the community server does) was counted as broken, so a server of your own could be mixed up with it. Only an answer that names its own app is trusted now

## [1.0.9] (2026-11-26)

### ✨ New Features

* **Discord - User and server reviews:** Reviews can now run on a server of your own. Type its address on Reviews > ReviewDB server and the app asks the server which Discord application it signs in with, so the address alone is enough; the app being used is shown right under it
* **Discord - User and server reviews:** The address accepts a server that answers under /api/reviewdb as well as at its root, which is the shape ReviewDB's own addresses have

### 🔧 Improvements

* **Discord - User and server reviews:** The page now says which Discord app a sign-in will use, so a server that belongs to someone else is never mistaken for the community server

## [1.0.8] (2026-11-26)

### 🐛 Bug Fixes

* **Discord - Show names your way:** Fixed the name never changing in chat. The feature hooked the name Discord draws on a profile card, which the message list does not use, so the chat kept showing Discord's own choice; the chat row is rewritten now
* **Discord - Show names your way:** Fixed the other names never appearing: they were glued into brackets after the name, where they were easy to miss. They now sit on their own small line under the name

### 🔧 Improvements

* **Discord - Show names your way:** Each name under "Also show" now shows what a tap will do: a plus adds it, an X takes it away
* **Discord - Show names your way:** Changing the order or the extra names redraws the chat you have open instead of waiting for it to reload

## [1.0.7] (2026-11-26)

### 🐛 Bug Fixes

* **Discord - Replace text when sending:** Fixed Save, Cancel and the X doing nothing in the rules box. It is opened as a sheet but was closed as a modal, so only the swipe got rid of it
* **Discord - Show names your way:** Fixed the names under "Also show" that were not ticked refusing to be tapped at all. A row's own tick state was hiding the switch that decides whether rows can be tapped
* **Discord - Show names your way:** Fixed a name that was unticked staying unticked: once the last one was removed the list could not be filled again

### 🔧 Improvements

* **Discord - Show names your way:** The page now says that Nickname and Server nickname are the same name on Discord, so the two rows are no longer expected to differ

## [1.0.6] (2026-11-26)

### 🐛 Bug Fixes

* **Discord - Export chats:** Fixed picking a format never changing it: every setting was coerced to true or false on the way in, so the format stayed JSON and the tick never moved
* **Discord - Show names your way:** Fixed tapping a name in the order doing nothing, for the same reason; the choice setting now keeps its text
* **Discord - Show names your way and Export chats:** Fixed the format and the name order being refused outright: their settings resolved to themselves instead of to the feature that owns them
* **Discord - Replace text when sending:** Fixed the rules box not closing: Save, Cancel and the X now dismiss the sheet, and the swipe no longer leaves it half open
* **Discord - User and server reviews:** Fixed the server box not closing for the same reason
* **Discord - Translate messages:** Fixed a translation Google returned being thrown away when it dropped or merged one mention or emoji, which made the message look untranslated; the missing piece is put back at the end instead
* **Discord:** Fixed every setting having its value turned into true when written, which is how the above went unnoticed

### 🔧 Improvements

* **Discord:** A setting written by a page is now tested to keep what it was given: text, numbers and choices, not just switches
* **Discord:** A sheet's own close button is what dismisses it, the same way Discord's own sheets behave

## [1.0.5] (2026-11-26)

### ✨ New Features

* **Discord - Show names your way:** Pick which of someone's four names is shown (@username, display name, nickname or server nickname) and what follows in brackets; the name is replaced where Discord draws it, so it works on a phone with no hover
* **Discord - Export chats:** Export now also writes a page that looks like Discord and opens offline, a plain text transcript, or all three in one ZIP

### 🐛 Bug Fixes

* **Discord - Export chats:** Fixed the feature never appearing in the Features list, so it could be turned on from its page but the list still said "0 of 73" and had no row or switch for it
* **Discord - User and server reviews:** Fixed ReviewDB server closing Discord with "Cannot read property 'transitionState' of null"; the editor now opens as a sheet, the same way the rest of JaPatch opens, with a plain dialog if a sheet is unavailable
* **Discord - User and server reviews:** Fixed the page not redrawing when a switch changed, so "Show the be-respectful note" left its knob where it was instead of turning blue

### 🔧 Improvements

* **Discord:** A page that draws a switch is now checked in CI to redraw when that switch changes; Reviews was the only one that didn't

## [1.0.0] (2026-11-26)

### ✨ New Features

* **Discord:** First release: 70 features in one settings page inside Discord, with search, per-feature pages, 29 languages, backup and restore, debug logs and a crash screen
* **Discord - Messages:** Keep deleted messages, bulk delete, hide blocked and ignored rows, message highlights, translate, double-tap to reply, full-quality images, download voice messages, keep media playing, Do Not Disturb banners, jump to first message and favourite any image or video
* **Discord - Sending:** Nitro stickers and emojis as links, Tenor GIFs, working link previews, audio as voice messages, long messages in parts, file sizes in the picker, anonymous file names, tap-to-open mentions, a taller message bar, reply without pinging and compress big files
* **Discord - People:** Pastel name colors, device indicators, owner and mod tags, alerts when you're removed, timeout duration, account switcher with up to 50 accounts, listen along, HypeSquad, custom idle time and mutual group DMs
* **Discord - Servers:** Read all, hidden channels, server info, server edits that stay on your device, cloning emojis and stickers, clean channel names, previews without joining and pausing invites
* **Discord - Appearance:** Your phone's font and emojis, Remove anything, Material You colors, icon packs, Revenge and Vendetta themes, Nitro themes and app icons unlocked for this device, full-screen chat in landscape and a JaPatch button on the profile bar
* **Discord - Quests and advanced:** Quests and badges completed automatically, experiments unlocked, clear Bluetooth audio in calls, voice channel options and fake deafen
* **Discord:** Privacy patches on by default: analytics, crash reporting, telemetry, touch logging, advertising IDs and install attribution all switched off
* **Discord - Keep Bluetooth audio clear in calls:** Add `Use the headset microphone`, so a headset whose microphone is needed goes back to call quality instead of staying silent

### 🐛 Bug Fixes

* **Discord - Icon packs:** Fixed a pack picture that no longer exists closing Discord with "Discord has crashed" on startup; that icon stays Discord's own
* **Discord - Fast delete channels:** Fixed holding a channel or category closing the app with "Cannot read property 'color' of undefined"
* **Discord - Keep media playing:** Fixed Discord being closed with a foreground-service error when a sound kept playing in the background
* **Discord - Compress big files:** Fixed videos that already fit the upload limit being compressed anyway, by planning against the file type's limit and the account's own
* **Discord - Edit without "(edited)":** Fixed the resend-and-delete way running in DMs and group DMs, which have nothing to log against; they use the normal edit again
* **Discord - Complete badges automatically:** Fixed the rotation picking adult games, whose play time then stays on your profile
* **Discord - Complete badges automatically:** Fixed a started game winning over Quest Completer on every launch, so new Quests waited until the badge was switched off
* **Discord - Expand the message bar:** Fixed the button sitting on Send and on the close button: it moved to its own row above the text, so it can't overlap either
* **Discord - JaPatch button on profile bar:** Fixed the Settings button floating as a small card when it is the only button left, instead of filling the bar
* **Discord - Show device indicators:** Fixed the phone badge staying on avatars with `Hide the phone badge` on, when the avatar status arrives as a wrapped component

### 🔧 Improvements

* **Discord:** Icon packs and custom themes install from a link, with every pack picture falling back to Discord's own icon when it can't load
* **Discord:** Settings are kept per account, so switching accounts keeps every switch where you left it

## [1.0.1] (2026-11-26)

### ✨ New Features

* **Discord - User and server reviews:** Pick the ReviewDB server yourself under Reviews, Server; it starts empty, and with no server there Reviews stays off and nothing leaves your phone

### 🔧 Improvements

* **Discord - User and server reviews:** Reviews never calls a server you didn't type in yourself, including the sign-in exchange and the admins list

## [1.0.2] (2026-11-26)

### 🐛 Bug Fixes

* **Discord - User and server reviews:** Fixed the server field drawing in a shape Discord's action sheet doesn't expect, which could leave the sheet blank on some builds

## [1.0.3] (2026-11-26)

### 🐛 Bug Fixes

* **Discord - Fast delete channels and View raw data:** Fixed holding a channel or DM in the channel list closing Discord with "undefined is not a function"; the hold menu is now left exactly as Discord drew it unless one of those rows is on
* **Discord - Fast delete channels:** Fixed a hold menu that couldn't take the extra row replacing the whole sheet with nothing

## [1.0.4] (2026-11-26)

### ✨ New Features

* **Discord - Export chats:** Hold a chat or thread and pick Export chat as JSON to save the messages Discord has loaded, as a file you choose; nothing is uploaded
* **Discord - Replace text when sending:** Rewrite what you type before it goes out, one rule per line ("brb => be right back"), with a live preview on the page

### 🐛 Bug Fixes

* **Discord - Fast delete channels:** Fixed holding a channel or DM closing Discord with "undefined is not a function" or "Rendered more hooks than during the previous render"; the protection added in 1.0.3 was itself calling the wrong function
* **Discord:** Fixed the hold menu being rebuilt while Fast delete was on, which is what made the crash appear and vanish between launches

### 🔧 Improvements

* **Discord - Leaving group DMs:** The feature now has its own page, with an option to skip the "Leave group" question entirely; servers still ask
* **Discord:** README rewritten around JaPatch's own behaviour, plus a Privacy page listing every destination data can reach and how to check it yourself
"""


def entries():
    """(version, body) for every release, newest first."""
    found, current = [], None
    for line in RELEASES.strip().splitlines():
        match = HEADING.match(line)
        if match:
            current = [match.group("version"), []]
            found.append(current)
        elif line.startswith("## "):
            raise SystemExit(f"release_info.py: bad release heading: {line}")
        elif current is not None:
            current[1].append(line)
    return [(version, "\n".join(body).strip()) for version, body in found]


def check():
    seen = set()
    for version, body in entries():
        # A version may appear once. A note added by hand above an older one is how 1.0.20 lost its heading and had
        # its body read twice; nothing here noticed, because the body was still valid on its own.
        if version in seen:
            raise SystemExit(f"release_info.py: {version} appears more than once")
        seen.add(version)
        order, section, bullets = [], None, 0
        for line in body.splitlines():
            if not line.strip():
                continue
            if line.startswith("#"):
                if line not in SECTIONS:
                    raise SystemExit(f"release_info.py {version}: unknown section '{line}'. Use one of {SECTIONS}")
                if line in order:
                    raise SystemExit(f"release_info.py {version}: '{line}' appears twice")
                if order and SECTIONS.index(line) < SECTIONS.index(order[-1]):
                    raise SystemExit(f"release_info.py {version}: put sections in this order: {SECTIONS}")
                order.append(line)
                section = line
                continue
            if not section:
                raise SystemExit(f"release_info.py {version}: text outside a section: {line}")
            match = BULLET.match(line)
            if not match:
                raise SystemExit(f"release_info.py {version}: write '* **Discord - Patch name:** Short change' "
                                 f"on one line, without a full stop: {line}")
            if section == "### 🐛 Bug Fixes" and not match.group("desc").startswith("Fixed "):
                raise SystemExit(f"release_info.py {version}: every bug fix must start with 'Fixed ': {line}")
            # Both rules were only written down before, never run: release-page leftovers slipped into a note and the
            # #139-style numbers stayed in 1.0.17 long after every other copy of them was gone.
            if BANNED.search(line):
                raise SystemExit(f"release_info.py {version}: release-page leftover in a note: {line}")
            if ISSUE_REF.search(line):
                raise SystemExit(f"release_info.py {version}: no issue numbers, nothing there is public; say it in words: {line}")
            bullets += 1
        if not bullets:
            raise SystemExit(f"release_info.py {version}: no changes listed")
    print(f"release_info.py: {len(entries())} releases in Morphe's section format")


def notes(version):
    for found, body in entries():
        if found == version.lstrip("v"):
            return body + "\n"
    raise SystemExit(f"release_info.py has no {version}")


def runtime_notes(limit=8):
    """The newest releases as plain data for the in-app "What's new" page.

    Each release becomes a title and a list of lines, one per bullet, already stripped of the markdown the
    GitHub release page uses. Keeping it as data (not markdown) means the settings page needs no parser and
    no network: the notes ship inside the bundle.
    """
    import json
    import re
    out = []
    for version, body in entries()[:limit]:
        section = None
        lines = []
        for line in body.splitlines():
            line = line.strip()
            if not line:
                continue
            if line.startswith("#"):
                section = line.lstrip("#").strip()
                continue
            match = BULLET.match(line)
            if not match:
                continue
            # The bullet carries the patch name between the two asterisk pairs: "**Discord - Server info:** ..."
            names = re.findall(r"\*\*(.+?)\*\*", line)
            name = names[0] if names else ""
            desc = re.sub(r"[`*]", "", match.group("desc"))
            lines.append({"section": re.sub(r"^[^\w]+", "", section or ""), "name": name, "text": desc})
        if lines:
            out.append({"version": version, "lines": lines})
    return json.dumps({"releases": out}, ensure_ascii=False, separators=(",", ":"))


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit(__doc__)
    if sys.argv[1] == "--check":
        check()
    elif sys.argv[1] == "--runtime":
        sys.stdout.write(runtime_notes())
    else:
        sys.stdout.write(notes(sys.argv[1]))
