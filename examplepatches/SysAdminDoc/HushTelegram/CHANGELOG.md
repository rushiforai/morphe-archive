# Changelog

Every HushTelegram release, newest first.

## Unreleased

* **Tooling:** Stories patching refuses changed visibility merges, overwritten peer-state registers and state-store paths that bypass the guard before editing the APK.

* **Telegram:** Stop call diagnostics suppresses automatic debug reports and requested log-file uploads. Call cleanup remains unchanged, and disabling the switch or using Pause restores the original diagnostic paths.

* **Telegram:** Hide recommendations removes similar channels and bots, including cached search sections. Disabling the switch or using Pause restores the original cache and request paths. Resume and Undo retain the settings page's scroll position when their status text changes height.
* **Telegram:** Hide Stories removes the chat-list story bar, its camera button and avatar story interactions. Profile stories and archives remain available, and the switch or Pause restores Telegram's behavior.

## 0.0.5 (2026-10-01)

Prepared for the next release. The published version is still 0.0.4.

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
