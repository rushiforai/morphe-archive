# Changelog

Every HushTelegram release, newest first.

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
