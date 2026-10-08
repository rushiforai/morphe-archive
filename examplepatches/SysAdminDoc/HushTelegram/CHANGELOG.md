# Changelog

Every HushTelegram release, newest first.

## Unreleased

Working version 0.0.11.

* **Telegram:** A new Hide contacts on Telegram switch, off by default, takes the Your contacts on Telegram list off a short chat list, along with its heading and the loading rows shown while contacts sync. Chats, folders, contact sync and search don't change. With no chats at all, you get the welcome screen Telegram shows when none of your contacts use it. Turning it off or pausing HushTelegram brings the same rows back. A change shows up the next time Telegram rebuilds the chat list, and a restart always does.

* **Telegram:** A new Hide greeting stickers switch, off by default, takes away the sticker an empty private chat offers to send as a greeting, so a stray tap can't send it. The empty chat's text stays, and business introductions keep their sticker. Premium and paid-message notices, the sticker picker and sending don't change.

* **Telegram:** A new Use system font switch, off by default, draws Telegram's bold and italic text in your phone's own font instead of the Roboto files the app carries, so headings match the rest of the text on a phone with a custom font. Code blocks take the phone's monospace font. Some number displays and Instant View pages keep Telegram's fonts. A change takes effect after Telegram restarts.

* **Telegram:** A new AMOLED black switch, off by default, turns the screens of Telegram's Night and Dark themes pure black, which looks deeper on an OLED screen. A patterned chat background shows its pattern over black. Message bubbles and pop-up menus keep the theme's colors, and a theme you've installed from a file stays as it is. A change takes effect after Telegram restarts.

* **Telegram:** A new Hide translate bar switch, off by default, takes the translate bar off the top of chats in another language. Translate is still in the chat's menu, and a chat you're translating keeps its bar so the original is one tap away.

* **Telegram:** A new Exact numbers switch, off by default, shows member, subscriber, view, reply and reaction counts in full, so a channel reads 12,345 subscribers instead of 12.3K.

* **Telegram:** A new Reveal spoilers switch, off by default, shows spoiler text, photos and videos without making you tap them. View-once media and sensitive content keep their blur, and login codes from Telegram stay covered.

* **Telegram:** A new Hide keyboard on scroll switch, off by default, closes the keyboard as soon as you start scrolling through a chat.

* **Telegram:** A new Keep videos muted on volume keys switch, off by default, stops the volume keys from playing the video on screen with sound in a chat. They just change the volume.

* **Telegram:** A new Swipe back on profiles switch, off by default, lets a swipe to the right on a profile's photos or media tabs go back instead of flipping to the previous photo or tab.

* **Telegram:** A new Hide phone number switch, off by default, shows your own number as dots in the side menu, Settings, your profile and everywhere else Telegram displays it. Handy for screenshots. Other people's numbers stay visible.

* **Telegram:** A new Message times with seconds switch, off by default, adds seconds to the time on each message, like 9:41:27 PM.

* **Telegram:** A new Allow chat blur on slower phones switch, off by default, lets phones Telegram rates as slow turn on its blurred chat header and panels under Power saving.

* **Telegram:** A new Play voice messages one at a time switch, off by default, stops Telegram playing the next voice or video message in a chat when one ends.

* **Telegram:** A new Turn off haptic feedback switch, off by default, stops the vibration Telegram adds to taps, long presses, swipes and wrong entries. Incoming calls and notifications still vibrate.

* **Telegram:** A new Turn off reaction effects switch, off by default, stops the fly-in and burst Telegram plays over the screen when you or someone else reacts. The reaction still lands on the message.

* **Telegram:** A new Hide folder tab counters switch, off by default, takes the unread counts off the folder tabs above the chat list. Chats stay unread.

* **Telegram:** A new Hide sender names when forwarding switch, off by default, starts each forward with Telegram's Hide sender's name option on. You can still turn it off before sending, and an article forward from an account without Premium keeps the sender, as Telegram requires.

* **Telegram:** A new Voice messages in the music player switch, off by default, opens Telegram's full music player when you tap the bar above a chat while a voice message plays, so you get the big seek bar and speed controls. Without it the tap jumps to the message, as before. View-once voice messages never open the player.

* **Telegram:** A new Silence people outside your contacts switch, off by default, lets a private message from someone who isn't in your contacts arrive quietly. You still get the notification, it just doesn't ring or buzz. Bots, reminders and Telegram's login codes keep their sound.

* **Telegram:** A new Disable pull to archive switch, off by default, keeps a hidden archive out of the chat list so pulling down doesn't bring it up. The chat list's menu gets an Archived chats entry, and a pinned archive stays where it is.

* **Telegram:** A new Start the camera on the rear lens switch, off by default, opens the attachment menu's camera on the rear lens each time instead of the lens you used last.

* **Telegram:** A new Hide gallery camera tile switch, off by default, takes the live camera tile out of the attachment menu's photo grid so it starts with your photos.

* **Telegram:** A new Hide time on stickers switch, off by default, takes the little time bubble off stickers and big animated emoji, read checks included. Every other message keeps its time.

* **Telegram:** A new Ignore mentions in muted chats switch, off by default, keeps a mention or a reply to you quiet in a group or channel you've muted. Telegram normally lets those through the mute. Chats you haven't muted notify as before.

* **Telegram:** A new Hide blocked users in groups switch, off by default, leaves messages from people you've blocked out of the groups and supergroups you open. Private chats and channel posts aren't touched, and nothing is deleted, so turning it off and reopening the chat brings them back.

* **Telegram:** A new Hide Telegram Features and Invite Friends switch, off by default, takes the Telegram Features row out of Settings and Invite Friends out of Contacts. If you have no contacts yet, the invite list Contacts shows in their place goes too.

* **Telegram:** A new Add Repeat to the message menu switch, off by default, puts Repeat under Forward in a message's long-press menu. It sends the message again to the same chat as a new message from you, through Telegram's own forward, so slow mode and paid messages work as they always do. It doesn't show in protected or secret chats, or for polls and paid media. Two more switches go with it. Add Copy photo to the message menu copies a downloaded photo to the clipboard so you can paste it into another app, and it isn't offered in protected or secret chats either. Add Message details to the message menu adds an item that shows the message's IDs, when it was sent and edited to the second, where it was forwarded from and the file's data center and size, with a Copy button.

* **Telegram:** Show user and chat IDs has a second switch, Show profile data center, off by default. It adds a row to a profile's menu with the data center, 1 to 5, that holds the profile's photo, read from the copy Telegram already has. A profile without a photo shows no row. Either switch works without the other.

* **Telegram:** Disable pull to next channel has a second switch, Stop pull to next topic, off by default. With it on, pulling up at the bottom of a forum topic only scrolls instead of opening the next topic. Each switch covers only its own pull, and a switch flipped mid-drag counts when you let go.

* **Telegram:** The beta target is now telegram.org's current 12.10.7 build, version code 71239, which replaced build 71179. Every patch applies and passes its fixture tests on it.

## 0.0.9 (2026-10-05)

The fourth release, with 25 patches for telegram.org's Telegram 12.10.6 and the official Telegram beta 12.10.7.

* **Tooling:** Builds use Morphe patcher 1.15.1, which brings faster fingerprint matching and signing, and stricter DEX path checks. Morphe Manager 1.34.0 is the first stable Manager that carries it, so the README now asks for 1.34.0 or newer. Fixture checks use the desktop CLI 1.18.1.

* **Telegram:** Repair Firebase push registration now works on slower phones. Firebase starts its first Installations request while Telegram is still starting, and on a slow phone that request could get there before HushTelegram's settings were ready. It then went out with the re-signed certificate, Firebase refused it, and no push token was saved. The request now waits for the settings, up to 10 seconds, on Firebase's own background thread. The diagnostic report counts requests that waited and any that still went out early.

* **Telegram:** The beta target is now telegram.org's current 12.10.7 build, version code 71179, which replaced build 71159. Every patch applies and passes its fixture tests on it.

* **Telegram:** The README says every way into HushTelegram settings (Telegram's own Settings, a long-press on the Telegram icon, or App info), and walks through the my.telegram.org form for your own API ID, including what causes "Incorrect app name!".

* **Telegram:** Three independent switches add plain-text paste, copyable local user and chat IDs, and a way to stop double-tap reactions. They start off. Pause restores the stock behavior, and the existing clipboard and explicit reaction actions stay available.

* **Telegram:** Pause, Settings backup and Diagnostics now have separate pages with shorter headings. Search still reaches every control, and all five translations include the new page names.

* **Telegram:** New Year look all year now puts Telegram's Santa hat over the chat list logo. It follows the logo's bounds and color so it stays visible in light and dark themes. Other titles keep their original drawing path. Changed title geometry getters refuse before patching. The switch remains off by default, and Pause restores Telegram's seasonal behavior.

* **Tooling:** The source-ledger paragraph now identifies v0.0.8 as the published bundle and distinguishes newer source changes.

* **Telegram:** External links now recognize browser aliases that Android enables at runtime, even when their manifest default is disabled. Disabled or private components stay excluded, and the browser chooser keeps its existing order.

* **Telegram:** HushTelegram settings now opens from a row in Telegram's own Settings. Repeated taps share one screen, and the launcher and Android App-info entries remain available. Partial patch selections show only their installed controls. Changed incoming item registers or callback casts refuse before any hook is edited.

* **Telegram:** Changing the registered API ID now refreshes the native connection identity for every valid ID. IDs that differ by 128 no longer share a marker. Updates also stay distinct from the previous marker scheme, without changing saved account keys or the app version. Changed native argument shapes refuse before either credential is edited.

* **Tooling:** A bounded selection matrix checks both declared Telegram builds 41 ways each, from the defaults and the full catalog down to single patches and bad credential options. It checks each build's dependencies, minimum Android version, preserved resources, native libraries and settings switches. Configured credentials must change only their own values and the native connection version marker. Mutation controls reject missing, duplicated or altered markers.

## 0.0.8 (2026-10-03)

The third release, with 22 patches for telegram.org's Telegram 12.10.6 and the official Telegram beta 12.10.7.

* **Telegram:** Use registered Telegram API credentials now works as an update over a build that used Telegram's own API ID. On its first start the patched app introduces itself to Telegram again with your ID, so login codes no longer fail with API_ID_INVALID.
* **Telegram:** The Notifications page shows a read-only local status: whether notifications are allowed, whether a push token is saved, and how many signed-in accounts Telegram has confirmed for push. It reads what's already loaded, never asks for a new registration, and the diagnostic report gets the same counts without the token.
* **Tooling:** Cached tests survive equivalent text line endings in temporary checkouts. Source changes still rerun the affected checks, and fixture bytes keep their exact comparisons. Isolated controls exercise cache reuse and invalidation through both real test tasks.
* **Tooling:** The README's install steps point to the Download Telegram button on telegram.org/android and say the file saves as plain `Telegram.apk`, since nothing in its name says it's the 12.10.6 web build.
* **Tooling:** The directory ledger records four confirmed HushTelegram listings. Only the Awesome Morphe request remains pending.

* **Telegram:** Diagnostics match credential names encoded with JSON Unicode escapes. Backup imports reject invalid string escapes before changing preferences. Fixed-seed grammar checks cover preservation and idempotence. The expanded synthetic corpus also passes on Samsung's Android 16 runtime.

* **Tooling:** Fixture tests reuse bounded query facts keyed by the exact APK content. Mutable test copies remain isolated, and changed fixtures invalidate retained facts. Both required targets pass the full suite, including collision and changed-content controls.

* **Tooling:** First installations accept both genuine package-absence exit forms after exact-device and signer preflight. Ambiguous package-manager results still fail. Updates retain their signing and permission checks.

* **Tooling:** Independent pushes and manual checks use separate commit snapshots and output directories. Every pushed commit keeps its required checks, and cleanup removes only its own temporary files.

* **Tooling:** Native test fixtures now contain genuine stored ZIP entries on both supported PowerShell versions. Independent header and byte checks preserve the compression and alignment refusal tests.

* **Tooling:** The settings and Android test result-listener graphs use reviewed Commons Lang 3.20.0 and HttpClient 4.5.14. Unrelated runtime requests and the shipped dependency inventory stay unchanged.

* **Telegram:** Diagnostics remove named API identity values from multiline and reordered JSON, including escaped quotes. Counters and unrelated hashes stay intact.
* **Tooling:** The current bundle uses Morphe Patcher 1.15.0, desktop CLI 1.18.0 and Manager 1.33.0. The settings and label compatibility checks cover the pinned internals, and both official Telegram targets remain supported. Manager 1.33 imported the bundle and applied all 22 patches on a phone.

* **Tooling:** Native receipts reject ELF values outside their binary field widths and overflowing LOAD ranges, even when both library records agree. Exact boundary values and historical receipts remain valid on both supported PowerShell versions.

* **Tooling:** Public summaries refuse destinations that reach a private report through a directory alias. Separate exports and hard links keep the private report intact. The checks pass on PowerShell 7 and Windows PowerShell 5.1.

* **Telegram:** Diagnostics remove named API IDs and hashes, including quoted and escaped aliases, from events, crash sections, clipboard exports and files. Versions, counters and unrelated hashes remain readable. Synthetic canaries pass on the desktop runtime and Samsung's Android runtime.

* **Tooling:** Fixture verification and receipt schema 4 require native-library preservation, relevant 64-bit ELF LOAD alignment and a successful 16 KB ZIP alignment check. Receipts record library hashes and compression with the checker and tool identities. Historical receipts retain their original schema rules. Changed or missing libraries and damaged alignment fail validation. Valid compressed libraries remain supported.

* **Tooling:** Desktop patching scripts write a separate public summary with supported targets, catalog patch names and fixed failure codes. Raw CLI reports and configured APKs stay private. Credential canaries in options, names, targets and error fields are excluded, and bug instructions now request the safe summary.

* **Tooling:** Device updates require an owned, unexpired lease and the expected device identity. Installed signing certificates and version codes are checked before installation, and updates preserve data and existing permissions. The script refuses the old uninstall option. Isolated checks cover refusal and command ordering, and a retained-key Samsung update kept its first-install identity and every permission grant and flag.

* **Telegram:** Settings navigation and backups were checked on Samsung Android 16 at normal and 200% text. Matching imports, damaged-file recovery and Pause restart/resume kept saved choices intact. TalkBack reached all settings pages and exposed each switch's state.

* **Telegram:** Two optional patch-time controls accept your own registered Telegram API ID/hash and Android Maps key. Unset options retain the original credentials. Incomplete API pairs and ambiguous Maps metadata are refused before editing.
* **Telegram:** The restart notice now stays visible when it follows an informational row in settings.
* **Tooling:** Source checks accept an explicit working version under Unreleased while published-release checks still require a dated entry.
* **Telegram:** The official beta 12.10.7 joins the web 12.10.6 target. Each package has its own pinned fixture, version code and verified vendor signer. Build and release checks require both targets.

* **Telegram:** A separate default-on switch stops the bottom pull gesture from opening the next unread broadcast channel. Ordinary scrolling and topic pulls keep their usual behavior.
* **Telegram:** Repair Firebase push registration changes only the certificate header on the web and beta apps' Firebase Installations requests. Its switch and Pause restore the original header.

## 0.0.6 (2026-10-02)

The second release, with 18 patches for telegram.org's Telegram 12.10.6. It also brings everything listed under 0.0.5.

* **Telegram:** No previews before sending is a new Privacy switch, off by default. While it's on, Telegram doesn't ask its server for a link preview of a message you haven't sent yet, in chats, the share sheet, polls, story links and messages a mini app shares. Sent messages still get their preview. After you turn the switch off or use Pause, the next change to a draft fetches its preview again.
* **Telegram:** Camera only on tap is a new Privacy switch, off by default. While it's on, opening the attachment gallery doesn't start the camera or ask for camera access, so the camera light stays off while you pick a photo. Tap the camera tile and the camera starts, asking for access first if Telegram doesn't have it yet, and opens once it's ready. Each new open of the attach menu starts with the camera off again, whichever tab it opens on, and a tap made while the menu is still opening holds. Pause and a switched-off setting bring Telegram's own behavior back.
* **Telegram:** Hide popular apps is a new Chats switch, on by default. Search's Apps tab no longer shows Telegram's Popular apps list, its heading or its loading rows, and Telegram doesn't fetch the list or read its cached copy. Apps you've opened and other search results stay. Turn the switch off or use Pause and the list comes back.
* **Telegram:** No swipe actions on chats is a new Chats switch, off by default. While it's on, a sideways swipe on a chat in the chat list no longer archives, mutes, pins, deletes or marks it read, and the swipe that hides the Archive row stops too. A swipe set to change folders still changes them. Long-press still has every action, and dragging a pinned chat to reorder it works as before.
* **Telegram:** Quiet contacts prompts is a new Chats switch, on by default. Once you've turned down a contacts prompt, either Telegram's own "Not now" or Android's permission dialog, the Contacts tab stops asking again every time you open it and the warning badge on its icon goes away. Telegram still asks the first time, the tab's own buttons still ask, and contact sync is unchanged. Pause and a switched-off setting bring the prompt and the badge back.
* **Telegram:** New Year look all year is a new Chats switch, off by default. While it's on, Telegram's New Year snow falls every day over the chat list's top bar and, when Telegram's animated chat backgrounds are on, over chat backgrounds. Turn it off or use Pause and Telegram's own holiday dates apply again the next time the chat list draws.
* **Telegram:** The Chats and Privacy rows on the settings home name what those pages hold in your build. With every patch in, they read "Ads in channels and search, and more" and "Usage reports and call diagnostics, and more". A build that left a patch out or lacks an ad hook gets a shorter line.
* **Telegram:** HushTelegram settings say that every switch applies to all the accounts in the app. About has an Accounts row, Export and Import settings say a settings file covers every account, and searching for accounts in any of the six languages finds all three.
* **Tooling:** Sponsored-proxy patching rejects empty runtime hooks and methods with too few parameter registers before changing the APK.
* **Tooling:** Open links externally and Strip link tracking refuse an empty, payload-only or undersized link runtime method before they edit Telegram or switch anything on.
* **Tooling:** The README's sign-in help explains Telegram's `API_ID_PUBLISHED_FLOOD` refusal and the need for registered API credentials.
* **Tooling:** The README's settings screenshots show the new home summaries and the Chats page with Hide ads and Hide Stories, captured from the current build.
* **Tooling:** Putting a hook in front of a switch now stops with a clear error before the method changes. It used to fail halfway, with a copy of the switch already in. A hook aimed at the data a switch or array reads stops the same way.
* **Tooling:** Seeded tests build a thousand small methods each run, with branches, switches, loops, try blocks and long values. Each one a patch could hook gets a hook the way the patches add theirs, and every input that reaches it must behave as it did before. Shrunk failures are kept as regression cases, and `scripts/test-injection-corpus-device.ps1` runs a set of them on a phone's own runtime, where all 632 runs matched on Android 16.
* **Tooling:** A hook that can jump past code is checked before it goes in. ART verifies a whole method when its class loads, and a jump that skips the line setting a register makes every run of that class fail with VerifyError, whatever the switch says. The patcher now works out what each register holds on every path the way ART does, and if the jump would leave one unusable where it's read, it stops and names the register and the instruction. On a Galaxy S22 running Android 16, ART refused all 60 seeded hooks the check turns down and loaded every one it lets through.
* **Tooling:** The jump check refuses code put in front of a call's result or a caught exception, and a hook with a switch table of its own, before the method changes. It also lines up a method with a nop of its own in front of a switch table.
* **Tooling:** The jump check lines a hook up with the method correctly when the hook's length moves the padding in front of a switch table. It used to read every instruction after the hook against the one next to it and turn down a sound hook.
* **Tooling:** The device register check no longer clears a shared phone's log. It marks where its run starts and counts only the lines after that mark. If a busy log has already dropped the mark, it stops and says so.
* **Tooling:** The pre-push check of the source ledger works on a push made while other changes are still uncommitted. It used to stop there, because it read a local page that a clean copy of the commit never has. The check now copies that page into the clean copy, so the page is held to the ledger either way. Only a checkout that never had the page, like a fresh clone, skips it.
* **Tooling:** The patches stay on Morphe patcher 1.14.1. A 1.15.0 build passed every test, rebuilt byte for byte and patched Telegram the same way on desktop 1.18.0, but Morphe Manager 1.32.0 refuses its bundle and nothing here needs the newer patcher.

* **Tooling:** Premium report patching now refuses any path that changes the verified payload or request before editing.

* **Telegram:** Usage-report suppression now covers Premium screen views, feature taps, accepts and purchase failures. Billing cleanup, push-token diagnostics and dual-camera support reports keep their usual behavior.

* **Tooling:** Sponsored-proxy patching rejects changed instance fields, inaccessible runtime hooks and invalid build flags before editing native code or scope stubs.

* **Telegram:** Added external-browser routing and optional local tracking removal for opened links and Share Link choosers. Telegram, login and payment routes stay as they are.

* **Tooling:** Source-mirror checks now locate clean checkouts through the tracked provenance file.

* **Telegram:** Usage-report help now describes the storage-type boolean Telegram reports, rather than claiming it uploads folder paths. Settings, translations and the patch description agree with the pinned payload.

* **Telegram:** Hide sponsored proxy channel removes the unjoined proxy channel from the chat list and folders. Proxy settings, joined channels and shared account-suggestion updates retain their original behavior. Turning the switch off or using Pause restores the original presentation.

* **Telegram:** Hide promotional banners filters seven Premium, birthday and low Stars balance prompts from the chat list. Account security notices and unknown suggestions remain. Disabling it or using Pause restores the original presentation without dismissing anything.

* **Tooling:** Sales patching refuses changed labels, missing Gift icons and cached tab IDs that lose their boxed source before editing. The bug form lists the sales patch as a separate selection.

* **Telegram:** Hide Premium, gifts and Stars removes the five Settings sales rows, profile Gifts tabs and the channel Gift button. Turning the switch off or using Pause restores those entry points. Account, purchase and ordinary channel controls retain their original paths.

* **Telegram:** Undo keeps scrolled settings pages in place when a pending Pause is cancelled, including pages with restart notices. Leaving the page restores its normal spacing.

* **Tooling:** Stories patching refuses changed visibility merges, overwritten peer-state registers and state-store paths that bypass the guard before editing the APK.

* **Telegram:** Stop call diagnostics suppresses automatic debug reports and requested log-file uploads. Call cleanup remains unchanged, and disabling the switch or using Pause restores the original diagnostic paths.

* **Telegram:** Hide recommendations removes similar channels and bots, including cached search sections. Disabling the switch or using Pause restores the original cache and request paths. Resume and Undo retain the settings page's scroll position when their status text changes height.
* **Telegram:** Hide Stories removes the chat-list story bar, its camera button and avatar story interactions. Profile stories and archives remain available, and the switch or Pause restores Telegram's behavior.

## 0.0.5 (2026-10-01)

These changes ship in the 0.0.6 release.

* **Telegram:** Patched APKs require Android 9 or Telegram's higher minimum. Settings and diagnostic reports name any ad or usage-report hook missing from a partially supported build.
* **Tooling:** Patch-changing pushes require every declared Telegram fixture. Release receipts record and verify the binary Android installation floor while retaining checks for published older receipts.
* **Tooling:** The Java directory check works when a suitable runtime is already first on PATH.
* **Telegram:** Diagnostic exports remove named chat, dialog, peer and channel IDs, access hashes, phone values and short Telegram deep links. Version, timestamp and counter fields stay readable.
* **Telegram:** Usage-report counters distinguish reports Telegram requested from calls that were not requested or were already handled. A state lookup failure keeps Telegram's own behavior and appears in diagnostics.
* **Tooling:** Targeted settings tests now cover Android 9, 13 and 16 for backups, cancellation, busy-state recovery, navigation, accessibility and large-text recovery screens.
* **Tooling:** The source ledger distinguishes Rush's package-specific patch counts, KillergramNeo's camera and UI candidates, and NagramX's archived reference status. Census refreshes preserve reviewed commits and historical verification dates.
* **Tooling:** Push checks scan resolved build, test and provided dependencies separately from the shipped SBOM. Build-only Netty, jose4j and JDOM pins address the findings that scan exposed while preserving checksum verification.
* **Tooling:** The unit-test dependency review keeps AGP host requests in their own scope when the full build report runs. Unreviewed unit-test versions and versionless modules still fail.

## 0.0.4 (2026-10-01)

The first release, with 4 patches for telegram.org's Telegram 12.10.6.

* **Telegram:** Hide ads stops the two requests Telegram makes for sponsored messages, a channel's and the video player's, before they go out. A channel answers as one with no sponsored messages and the player as one with no ad, so nothing is drawn, marked as seen or reported as clicked.
* **Telegram:** Hide ads also keeps sponsored accounts out of global search. Telegram puts one above the results for many searches, "news" or "music" for example, and reports it as seen. Search now skips that request the same way it does for Premium users who turned ads off.
* **Telegram:** Disable analytics returns from the device statistics report before it reads anything. That's the `help.saveAppLog` event Telegram sends with your storage folders when its server asks for one.
* **Telegram:** Disable analytics also stops the read-time report. As you scroll a channel, Telegram times how long each post stays on screen and sends the batch to its server. The batch is now dropped instead. View counts aren't touched.
* **Telegram:** The Privacy switch is called Stop usage reports now, since it covers more than device statistics.
* **Telegram:** Disable update checks returns from telegram.org's own update check before it reaches the server, because the APK it offers is signed with Telegram's key and can't install over a patched build.
* **Telegram:** HushTelegram settings opens from a launcher shortcut or from Additional settings in the app on Telegram's App info page, with pause, settings backups, diagnostics and the licenses.
* **Telegram:** Check now says "No HushTelegram release is out yet." when GitHub has none to show, instead of asking you to try again later.
* **Telegram:** The card at the top of HushTelegram settings says whether your controls are active or pause at the next start. The version line that crowded it out lives on the About page.
* **Telegram:** The update switches read more plainly, and the Chats summary on the settings home fits on one line.
* **Telegram:** Every row on the Chats, Updates and Links pages has an icon now, so the text starts at the same edge on every page, and Chats has a chat bubble.
* **Telegram:** With large text on a Samsung phone, switch rows show their icon at full size and line up with the rows around them.
* **Telegram:** A row that opens another page has a gray icon on More settings too, as it already did on the settings home, so blue marks only the rows that do something where they are.
* **Telegram:** The Licenses page shows the notice's headings in bold instead of under rows of = and - signs.
* **Tooling:** The README has a HushTelegram logo and a matching banner in the Hush family style.
* **Tooling:** The README shows a search before and after, with Hide ads off and then on, taken on a signed-in phone.
* **Tooling:** The build, extension library, settings screen and diagnostics start from HushThreads at b141524, renamed to `app.hushtelegram.extension` so they can't collide with another Morphe source's classes.
* **Tooling:** The verification and release scripts know Telegram. `verify-all-patches.ps1` takes telegram.org's single APK, and the manifest allowlist approves only the settings alias, the one manifest change the patches make.
* **Tooling:** `sources/telegram-sources.json` records every Telegram patch source, Xposed module and fork found, with the commit each was read at, its license and what HushTelegram may take from it. `docs/sources.md` is the readable version.
