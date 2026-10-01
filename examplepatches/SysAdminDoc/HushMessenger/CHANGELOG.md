# Changelog

## Unreleased

### Changed and fixed

- `scripts/CompatReport.java` checks **Material You theme** now, so its report covers all 31 patches. That switch finds its methods when it patches instead of from a build record, and the release checks for v0.7.0 caught it failing on 13 of the 21 builds before it shipped. The report lists what it found on each build and fails one where the theme's color methods are missing or ambiguous, so a new build can't be recorded until the theme fits it. A test fails if the report and the patch disagree on the colors and calls they look for.

## 0.7.0 (2026-09-30)

This release supports all 21 arm64 builds of Messenger 580.0.0.49.91 and has 31 patches, 28 of them switches you can turn on in settings.

### New

- Messenger 580 builds `346013394` and `346013423` are supported now. They were the last two arm64 "nodpi" builds on APKMirror that the patch turned away, so all six of those work. All 27 patches apply to both in Morphe Desktop 1.17.0. Build `346013423` checks the Notifications tab's suggestions setting one step earlier than the others, so that check now finds its spot instead of counting on a fixed position.
- The 14 Messenger 580 builds made for one screen density each are supported too: `346013355`, `346013356`, `346013357`, `346013358`, `346013359`, `346013372`, `346013374`, `346013375`, `346013391`, `346013427`, `346013441`, `346013443`, `346013444` and `346013445`. That covers all 21 arm64 variants APKMirror has for 580.0.0.49.91, so grabbing "the APK for my screen" no longer ends in "version code ... is not supported". All 27 patches apply to each of them in Morphe Desktop 1.17.0. Seven of them share one new set of internal names and two share another. The other five reuse ones the patch already had.
- Adding a Messenger build now starts with running `scripts/CompatReport.java <apk> --save` (dexlib2 and Guava on the classpath). It records the build under `scripts/profiles/` and prints the Kotlin to paste. If a control doesn't resolve or any other check fails, it lists what failed and writes nothing. The install checker and the changed-APK check read those records, so each build is listed in one place, and a Gradle test fails if a record and the Kotlin tables disagree.
- A switch whose code fails inside Messenger now says so. Its usage line reads "Stopped with an error" and how long ago, until the next time it works. **Copy setup** adds a line for each control that failed, with the error's type, the spot in HushMessenger's code where it happened and the time. The error's message is left out because it could quote a chat. The last failure is kept across restarts, so it's still there to copy after Messenger comes back up. The sticker keyboard, system emoji and Menu tab row are covered today. Before this, those failures only reached the system log.
- Releases now come with `SHA256SUMS.txt.sig`, an SSH signature over the checksum file, starting with this one. The release key's fingerprint is `SHA256:Z+UfHy7IUbtgNRO/wHkIr68+u4I+SIKPY9avfx/VAPU` and its public key is committed as `scripts/release_signers`. The README shows how to check it with `ssh-keygen`, since Morphe Manager and Desktop don't. `check_release.py --verify-signature` checks it before a release goes out and fails if the checksum file was edited or signed by any other key. The source index still leaves `signature_download_url` empty, because no manager verifies it yet.
- The settings screen can be translated now. A language is one table of text in the extension, and the screen follows Messenger's language when a table matches it, falling back to English otherwise. A test fails the build when a table leaves out any text, changes a `%s` or `%d`, or has a stray `%` that wouldn't format. If one slips through anyway, that line shows in English instead of closing the screen. The "Used 5m ago" units can be translated too. No translations ship yet, the English text is unchanged, and saved choices don't depend on the language. The README says how to add one.
- A new **Send photos at original quality** switch sits with the other conversation controls. Even with HD on, Messenger re-encodes a photo on your phone before encrypting and sending it, so a 6.4 MB photo went out as about 1.8 MB. With the switch on, an HD JPEG goes out with its own image data instead. Its metadata stays behind, the same as with Messenger's copy: location, camera details, capture time, the embedded thumbnail and a motion photo's video clip. In a test between two accounts the received photo was byte for byte the file that was sent. A photo saved sideways with a rotation tag, the way many phones save portrait shots, keeps just that tag, so it still shows upright. Photos over 20 MB and videos still go through Messenger's compression, and a photo just over the limit still sends as Messenger's copy.
- README's troubleshooting list covers Samsung's Auto Blocker and Google's Advanced Protection. Either one stops the patched Messenger from installing on a Galaxy phone, and the note gives the settings path to turn each off for the install and back on afterwards.
- A new **Material You theme** switch brings your wallpaper's colors into Messenger's dark mode on Android 12 and newer. Messenger's blue takes the accent color Android picks from your wallpaper, on the selected tab and on links. Its grays get a matching tint too, like the search bar and the message box. Every color keeps the contrast it had against the dark background. With a blue wallpaper the grays hardly change, because Messenger's own grays already lean blue. Black backgrounds stay black and each chat keeps its own theme. Light mode doesn't change, and neither does anything with the switch off. Android 11 gets a fixed blue palette. Turn on dark mode in Messenger first, then use **Restart Messenger**.
- A new **View stories anonymously** switch opens other people's stories without adding you to their viewer list (#7). Stories you open this way still show as seen on the People tab and in the story viewer, so a new story from the same person stands out. That holds after Messenger restarts too, and each account on the phone keeps its own list. One spot doesn't follow along yet. The ring around that person's picture in your chat list keeps showing the story as new until it expires, because Messenger only clears that ring when it tells the poster you looked.
- A new **Save any story** switch adds **Save** to the **More options** menu on other people's stories (#4). Messenger only offered it on your own. It's the same item, so the photo or video downloads the way your own stories do. A saved video lands in Movies/Messenger as an ordinary MP4. Your own story's menu doesn't change, and with the switch off nobody else's story gets the item.

### Changed and fixed

- **Hide growth prompts** now hides two more kinds of nudge that got past it. Notes stop popping up their tip sheets, so **Make my notes public** and **Add lyrics to your music note** don't appear while the switch is on. The first of those is one tap away from changing who sees your notes. The **Share your own story** card at the end of someone else's stories is gone too. With the switch off, Messenger shows them as before.
- Hide People You May Know now clears suggestions from the People tab, the search screen and the story viewer as well. The People tab kept its own "People you may know" list, tapping the search bar showed another one with Add friend buttons, and the story viewer could slip a page of suggested people in between stories. Each of those sits right where a stray tap sends a friend request. With the switch on, the People tab's suggestion filters (All, Current city, Hometown and the rest) come up empty, search shows only its usual Suggested row of people you already talk to, and the story viewer never asks for its suggestions page. It applies after **Restart Messenger**, like the other inbox switches. Chats, the end of the chat list and the Notifications tab work as before.
- Settings open on installs made with Morphe Manager's Root Mount now (#12). Those installs leave Android with stock Messenger's list of screens, so **Patch controls**, **Restart Messenger** and the Menu tab row pointed at screens Android didn't know, and every switch stayed off because the list of patched controls was never read. Both shortcuts and the row now open settings inside one of Messenger's own screens, and the patched app carries its own list of controls. A normal install opens the same screens as before. There's no app drawer icon on a mount install, and Messenger's alternate app icons don't get the long-press shortcuts there, so use the Menu tab row with those. Safe mode still works when settings are the first thing you open. The patch checks both stock screens it uses and fails while patching if a build changes either of them.
- Hide Meta AI now removes the Meta AI tab too (#13). Some accounts get it in the bottom bar between People and Notifications, and the switch used to leave it there. With the switch on, Messenger builds the bar without it, the same way it does for accounts that never get the tab, so the other tabs keep their places. It takes effect after **Restart Messenger**, and so does pausing.
- Hide Facebook shortcuts now says that it also removes the "Also from Meta" section in the Menu tab (#14), with Muse, Subscriptions, Facebook Reels and whatever else Meta lists there. It already did that, header and all, but the description only mentioned toolbar, profile and sharing shortcuts, so you had no way to know.
- The build now uses the Kotlin Gradle plugin 2.4.20 instead of 2.4.10, which had an unsafe deserialization flaw in its build cache (CVE-2026-53914). Bouncy Castle, which the build uses for signing, is now 1.86 everywhere. The 1.77 and 1.79 copies it replaces predate fixes for several published advisories. This only changes how the bundle is built. All 27 patches still apply in Morphe Desktop.
- The update check now compares release numbers as numbers. It used to compare them as text, so a future 0.10.0 would have looked older than 0.9.0 and you'd have been told you were up to date. It also only offers a button for this project's own release pages, and it always closes its connection. Tests now cover a newer release, the same release, GitHub's rate limit, a reply with no version in it and a server that never answers.
- Hide inbox ads now says what it's for. Meta stopped selling ads in the Messenger inbox on November 11, 2025 and in Messenger Stories on August 27, 2026, so there's nothing live for it to remove today. The switch works the same way and stays as a guard in case those ads come back.
- `check_install.py` now finds Messenger data left behind by an uninstall that kept the data, which is what caused the "INSTALL_FAILED_VERSION_DOWNGRADE ... 2147483647" error in #9. It used to look only at installed apps, so it passed and the install failed anyway. A version code of 2147483647, installed or left behind, is now called out as another patch set's spoofed version, with a pointer to the README fix. A normal downgrade reads the same as before.
- The settings screen now also makes room for a camera cutout when Android reports it apart from the status and navigation bars. On a Galaxy S22 with Android 16 it already kept clear of the camera in both landscape directions, and its layout there is unchanged.
- The README now covers chat heads, photo quality and update prompts. None of these needed a patch. Chat heads still work on Android 16, but on Android 12 and newer they need Messenger's battery use set to Unrestricted. The gallery's HD switch already sends photos at full resolution. Play's in-app update prompt doesn't run on a patched Messenger.

## 0.6.0 (2026-09-29)

### New

- A new **Hide app drawer icon** switch in the App tab removes the separate "HushMessenger settings" icon from your app list. Settings still open from the long-press **Patch controls** shortcut and the Menu tab row, and turning the switch off brings the icon back. The switch is only offered when the Menu tab row applied, so a launcher without app shortcuts can't leave you locked out, and Messenger restores the icon at startup if a later patch drops that row. Checked on the S25.
- Support for build 346013370, the arm64 nodpi APK that Morphe Manager's download link gave two people who reported it. Before, patching stopped with "version code 346013370 is not supported". It's the same app with its internals under different names, so it has its own checked list, and all 27 patches apply to it. Hide avatar stickers finds that build's sticker keyboard too, which fills its tab list in a different way. Neither test phone can install it (both run newer builds), so it hasn't been tried on a phone yet.
- Support for build 346013354, APKMirror's arm64 nodpi bundle of Messenger 580.0.0.49.91. It's the same app as the builds already supported, and all 27 patches apply to it. Before, patching stopped with "version code 346013354 is not supported".

### Changed and fixed

- The line under each switch no longer reads "Not active since restart", which looked like the switch was broken. It only appears while the switch is on, says "Nothing to change yet since restart" until Messenger reaches that screen or event, and then "Used ... ago".
- A Facebook patched with the same key as Messenger, such as Hushfacebook, is no longer turned away when it asks Messenger for its shared message keys. Messenger used to refuse it because its certificate wasn't Meta's. Now, while that Facebook is the app calling Messenger and its current signing key is exactly the one Messenger carries, Messenger checks it the way it checks Meta's own Facebook, so Meta's rules still decide what it may read. Any other app, a Facebook signed with a different key, and a Messenger that still carries Meta's key all get the old answer. Copy setup counts each outcome. Tests cover each case, and on the test phone a Hushfacebook build's two reads of Messenger's shared message keys were both answered.
- Allow screenshots now also covers Android 14 and newer, where Messenger learns about a screenshot from Android itself rather than by watching your photos, and the photo and media viewers that lock their window in a protected chat. Before, it only stopped the older screenshot check and the block on protected video. Its description no longer mentions vanish mode, which encrypted chats don't have. View-once media stays protected. Neither the notice nor the viewer lock turned on for the test account, so this is checked with tests and on all three supported builds rather than with a live notice.
- The README explains how to get alerts from only the chats you choose, using Messenger's own chat settings and Android's per-conversation notifications. Stock Messenger already offers everything needed, so there's no new switch. The order matters: silence Chats first, then set the chats you want to Alert, because a chat only keeps its own setting once you change it. Checked on the S25 with a live message.
- The App tab's Quick access card now mentions the HushMessenger row in Messenger's Menu tab, on builds that have it. The text stays whole at twice the normal text size in both themes.
- Pass 247 local tests. All five supported APKs apply all 27 patches, and clean builds from two separate checkouts produce the same bundle.

## 0.5.0 (2026-09-28)

### New

- Restore screens on re-signed builds, always on. Messenger checks its own signing certificate against Meta's, and a re-signed build used to fail that check quietly and open to a blank screen. The patch answers that one check with Meta's original certificate for Messenger itself. Every other app still gets the real answer. On the S25 a fully patched build now opens straight to the signed-in chat list.
- A HushMessenger row in the Menu tab, always on. It sits right under Messenger's own Settings row and opens the HushMessenger settings screen, while Settings still opens Messenger's settings. Accounts that get Messenger's folder grid instead of the list use a separate path that no test account has shown yet.
- Three privacy switches, all off by default: Allow screenshots, Hide read receipts and Keep unsent messages. A kept message shows "[unsent]" before its text and stays after a restart. Hide read receipts also works in end-to-end encrypted chats, which Messenger uses for most one-to-one chats. There, Messenger marks a chat read and sends the receipt in one step, so chats you open stay unread until you reply or turn the switch off. Keep unsent messages doesn't work in end-to-end encrypted chats: Messenger removes those messages below the part of the app HushMessenger can change.
- Use system emoji, off by default. Emoji are drawn with your phone's own font instead of Messenger's. If the phone has no emoji font, Messenger's set stays.
- Each switch shows when it last took effect since Messenger started, and Copy setup includes that. A switch that's on but never active usually means Messenger uses a different screen on your account.
- Export and Import in the App tab copy your switch choices to and from the clipboard. Only known switches with on or off values are accepted. It helps after a reinstall with a different signing key wipes Messenger's data.
- Crash-loop safe mode. If Messenger closes unexpectedly three times within a minute of starting, every switch turns off and your choices stay saved. The settings screen says why, and Resume turns them back on.
- An update check in the App tab, off by default. When it's on, opening settings looks for a newer release on GitHub. Nothing is sent while it's off.
- Support for the arm64 build 346013442 (213-240dpi) from APKPure. Build 346013445 is organized differently inside and isn't supported.
- For developers, `scripts/CompatReport.java` checks a Messenger APK without changing it. It prints the package, version code, ABI and signer, then pass or fail for each of the 27 patches.

### Changed and fixed

- Hide avatar stickers now also removes the Avatar stickers tab from Messenger's newer sticker keyboard. Pausing brings it back.
- Hide typing indicator now also works in end-to-end encrypted chats, which Messenger uses for most one-to-one chats. Before, the other person still saw "is typing" there. In a two-phone check the indicator stayed hidden with the switch on and came back while paused, and messages still went through.
- Hide Meta AI also removes the "Ask Meta AI" button that appears in the search bar once you type, and turns off the AI agent behind search. People, messages and group results still show, and pausing brings the button back. The search field's "Ask Meta AI or search" hint doesn't change.
- Other apps can no longer restart Messenger. Restart Messenger used to accept a request from any app on the phone, which could close Messenger at any moment, even during a call. The long-press shortcut and the App tab button still work.
- The long-press shortcuts are found wherever a build keeps them, so build 346013442 gets them too.
- The search field now reads back what you typed with a screen reader. The selected filter keeps a visible focus ring, and switches that can't work on your Android version look unavailable.
- Quick toggles, including the theme switch, no longer stack up old messages. Pause now says "Changes paused" or "Changes resumed".
- The selected filter in the light theme is filled like it is in the dark theme. On Android 10 and newer the search cursor uses the app's blue, and the restart screen and its system bars follow your theme. The header now lines up with the cards.
- The title stays on one line at large text sizes on older Android versions, and very long pasted searches are trimmed.
- In the right-to-left test language, headings and descriptions now line up on the right instead of running into their counts.
- The README links the two APKMirror builds that work, since six look alike on that page. The Install beside Meta apps description no longer says signed builds don't open chats.
- Checked Messenger at Android's largest font size (2x) on the S25. The chat list, chats, composer and HushMessenger settings all scale and stay usable, so there's no font patch. Long labels shorten with an ellipsis the way they do in stock Messenger.
- Checked the README's "Add HushMessenger to Morphe Manager" link on a phone. It opens the morphe.software page, and its Open in Morphe button brings up Morphe Manager's Add source dialog with this repository filled in.
- Building the same source now gives the same bundle from any checkout. The license files used to carry whichever line endings Git wrote, so a fresh clone couldn't reproduce the published checksum.
- Release checks compare every README link to this project's own releases, and the permission failure check says when Morphe Desktop never started.
- The README screenshots show this release's settings, with all 24 controls.
- Pass 204 local tests. All three supported APKs apply all 27 patches, and clean builds from two separate checkouts produce the same bundle.

## 0.4.2 (2026-09-28)

- Hide People You May Know now also clears the suggestions on Messenger's Notifications tab and the block after the last chat. It takes the same path as Messenger's own Hide option, even on accounts where Meta turns that option off from its servers, and it never changes Messenger's settings. Pausing HushMessenger or turning the switch off brings the suggestions back. Checked on the S25: the Notifications tab lost its suggestions, they returned while paused, and chats and notifications still showed. The end-of-list block and the server override didn't apply to that account, so they're covered by build checks only.
- Pass 157 local tests. Both supported APKs apply all 21 patches, and two clean builds produce the same bundle.
- Explain where to find the settings after patching: long-press Messenger for Patch controls, or open HushMessenger settings from the app drawer.
## 0.4.1 (2026-09-27)

- Long-press Messenger for Patch controls or Restart Messenger. Keep the app-drawer settings entry and cover Messenger's alternate icons.
- Add Quick access and a restart button at the top of the App tab. Explain when inbox changes need a restart.
- Save pending choices before restarting the main process. A failed save leaves Messenger running and shows an error. Restarting doesn't clear app data.
- Preserve Messenger's direct-share target, all original resource values and existing hook behavior. Rebuild both supported APKs with all 21 patches and verify their signatures.
- Pass 153 local tests. Exercise the long-press menu and fresh-process restart in a temporary S25 test app, retain saved choices, and recapture both settings pages and themes. Remove the test app afterward.

Update the already patched S25 in place with its matching Morphe key. Both real launcher actions and the settings restart button pass, the signed-in chat screen returns in a fresh process, and 19 enabled controls survive. S22 remains stock. Fresh-install sign-in and encrypted-history recovery still need testing.

## 0.4.0 (2026-09-27)

- Pass 133 local tests and rebuild both exact APKs with all 21 patches. Verify all 57 runtime hook calls and preserve every stock class and native library. Both installed phone APKs remain stock; their account data is unchanged.
- Verify the published bundle checksum and all 21 entries through Morphe's remote lookup. Refresh the S25 source to v0.4.0. Source updates do not install a patched Messenger APK.

- Keep multi-digit counts and version numbers in their normal reading order in the right-to-left test language.
- Distinguish named and hidden dependencies in the generated catalog, including their transitive dependency graph.
- Clearly mark the standalone settings app as a UI preview and remove its app-drawer entry. Preview setup reports never claim active Messenger controls. Remove leftover previews from both test phones after confirming their Messenger APKs remain stock.

- Keep page and category state independent of translated labels. Add an English text catalog with expanded and right-to-left test languages, whole plural messages and locale-aware numbers. Honor Android app languages even when the host resource table falls back to English.

- Publish a catalog generated from the built patch bundle. Local checks reject changed control keys, metadata, release versions and checksums before publication.
- Add Copy setup to the App tab. It copies app versions and control states only when tapped, excludes account and chat data, and distinguishes saved choices from active controls while paused or unavailable.

## 0.3.1 (2026-09-27)

- Require both shared permissions to retain signature protection. Check their DEX sites before renaming the manifest permissions.
- Validate every method in a control before editing it, then publish its settings capability only after success. Reject changed browser parameters and plugin return constants.
- Keep both supported build codes visible in Morphe's compatibility description.
- Keep controls reachable in short windows with large text by moving the branding and reminder into the scroll area. Let navigation scroll when the keyboard leaves very little room. Preserve the normal portrait layout.
- Restore search selection and each page's scroll position, refresh switches when returning to settings, and keep focus on visible controls.
- Explain bubble availability on Android 9 and 10 without discarding the saved choice. Add accessible page names, correct right-to-left spacing and explain that choices apply to every account in the installation.
- Reject incomplete or conflicting certificate, permission and package records during the installation check. Include apps installed in other Android profiles.
- Check arm64 libraries, ELF page alignment and Android's native extraction rules. The optional `--stock-apk` argument verifies that a rebuild preserves the tested stock libraries.
- Return clear errors for missing inputs, tool timeouts, corrupt compressed native libraries and malformed changed-APK reports. Read wrapped dependency errors and keep temporary APK cleanup on failure.

- Pass 103 local tests. Android lint reports no errors and the same eight warnings as the baseline.
- Rebuild both supported APKs with all 21 patches, verify their v3 signatures and preserve every native library. Two clean bundle builds produce the same checksum.
- Exercise both settings pages and themes on an isolated S22 display. Check small windows, 200% text and keyboard-visible search on a headless Android 16 emulator.

## 0.3.0 (2026-09-27)

- Redesign settings with separate Controls and App tabs, compact grouped rows and category filters.
- Add a live enabled count and a clear paused state. Keep all patch selections and saved preferences.
- Match the new dark and light layouts with shared colors, rectangular switches and readable section headings.
- Keep appearance, version details and setup help together in the App tab.
- Preserve the selected tab, category, search and scroll position when changing themes. Keep 48 dp touch targets and adapt the header to narrow screens or larger text.
- Pass all 57 local tests and Android lint. Rebuild both supported APKs with all 21 patches and verify their v3 signatures. Compare both settings pages against the design references on an isolated S22 display.
- Verify the public download matches both clean builds and that Morphe Desktop fetches v0.3.0 with all 21 entries. Phone source refreshes remain queued while the S25 is disconnected and the S22's Manager session is active.

## 0.2.0 (2026-09-27)

- Replace the two-entry catalog with 21 selectable patches. Each feature applies independently and shares one settings extension.
- Add 13 optional controls: inbox ad filtering, People You May Know, friend request cards, growth prompts, Chat Moments, AI sticker tools, avatar stickers, inbox promotions, chat promotions, business reply suggestions, business typing suggestions, event prompts and the Reels badge.
- Extend the existing Meta AI control to the inbox toolbar button.
- Add settings search and show only installed controls. Saved choices survive removing and later adding a patch.
- Preserve stock behavior while switches are off or changes are paused. Check exact hook sets and the new plugin gates' disabled branches before patching.
- Add regression tests for separate selection, capability metadata, search and ad-filter return branches. Existing tests remain intact.
- Pass 26 Kotlin, 15 Android and 11 Python tests, Android lint, both full APK rebuilds and a separate single-control rebuild. Exercise settings search, persistence and themes on an isolated S25 display.
- Refresh the remote source on S22 and S25 and verify all 21 entries in each phone's catalog. Keep their installed Messenger apps intact.
- Keep the ad filter experimental. No affected-account ad row was available for a live removal check. Original-package startup remains unresolved.

## 0.1.0 (2026-09-27)

- Add seven optional controls adapted from existing Messenger patches: stories and notes, inbox tabs, Facebook shortcuts, Meta AI buttons, external web links, typing signals and bubble eligibility. All switches start off.
- Add a HushMessenger settings launcher entry with saved switches, a pause control and a light theme. Inbox changes take effect after reopening Messenger.
- Check the complete hook set on both supported 580 APKs. Changed hooks stop patching rather than silently skipping a feature.
- Verify the settings screen, light theme, pause and Messenger launch on an isolated S25 diagnostic copy. Stories, the Facebook toolbar shortcut and the Meta AI floating button passed before/after checks. The original-package startup failure remains unresolved.
- Pass 20 patch, nine Android settings and 11 certificate tests. Both exact APKs patch and sign successfully.
- Verify the v0.1.0 remote source and both patch entries on S22 and S25. Their stock Messenger installations and sign-ins stayed intact.
- Correct the remote index timestamp for Manager's local date-time parser. The bundle download and checksum are unchanged.
- Add bytecode and Android settings tests. Keep ad blocking and media transcoding unavailable until their current paths can be verified.

## 0.0.9 (2026-09-27)

- Add a read-only installation check that verifies APK certificates and reports installed-app or permission-owner conflicts before any device changes. It checks the phone's current signer set, including API-specific rotation and multiple signers, and refuses uncertain results.
- Cover the check with eleven Python tests and exercise it against the S25's installed apps, including a deliberately mismatched signing fixture.
- Confirm stock encrypted message delivery between two owned accounts on S22 and S25. The S22's stock browser switch passed HTTP and HTTPS comparisons; its original setting was restored. Re-signed Messenger still needs a working startup path.

## 0.0.8 (2026-09-27)

- Record the S25 test: a same-key patched Messenger installed, but its first-run screen stayed blank. An unchanged APK rebuilt and signed through the same tool did the same.
- Clarify the phone-data warning after reinstalling the original stock APK required a fresh sign-in. Chats, calls and notifications remain unverified.

## 0.0.7 (2026-09-27)

- Record the S22 stock Messenger controls for inbox suggestions, external links, notifications, chat heads and accessibility without changing account settings.
- Refine patch plans around the controls Messenger already provides, including checks that would justify a separate browser or suggestions patch.
- Rebuild the preview bundle and repeat the S22 off-device patch, signature and changed-APK checks.

## 0.0.6 (2026-09-27)

- Add the S25's Messenger 580 arm64 build to the exact compatibility list after comparing its APK with the S22 fixture.
- Verified that altered permission bytecode in either APK stops patching before an output is written.
- Left both phones' installed Messenger apps and local chat data untouched.

## 0.0.5 (2026-09-27)

- Add a repeatable changed-APK check that confirms Morphe stops before rebuilding when permission bytecode differs from the tested Messenger build.
- Ignore local signing keys and Python cache files so they cannot be staged by accident.
- Explain that Manager and Desktop currently load patch bundles without verifying the source index's detached-signature URL.
- Keep device-dependent patch work in a blocked tracker until an isolated signed-in arm64 session can verify it.

## 0.0.4 (2026-09-27)

- Put the tested APK and phone-data warning before the preview setup steps.
- Make the README easier to use on a phone, including a copyable stock APK checksum and recovery help.
- Move the support link below the setup and verification details.
- Give patch failures the exact Messenger build needed to retry with an unmodified APK.
- Shorten the patch and source descriptions and cover the recovery message in ten unit tests.
- Check both Manager 1.32.0 source methods and the published source in Morphe Desktop 1.17.0.

## 0.0.3 (2026-09-27)

- Reject Messenger builds whose shared-permission manifest counts, component owners or active DEX instruction sites differ from the checked 580 APK.
- Add regression tests for missing or reassigned guards, duplicate declarations and changed DEX sites.
- Use the smali revision requested by Morphe Patcher 1.14.1.
- Give the patch bundle a fixed release timestamp so clean builds have the same checksum.
- Lock build dependencies and verify their artifact hashes, including the Morphe build plugin.
- Explain how to load a preview source in Morphe Manager and Desktop.

## 0.0.2 (2026-09-27)

- Published the Messenger patch source with a README hero, icon and social preview in the Hush project style.
- Added a Morphe source index and a preview bundle for the exact Messenger 580 arm64 target.
- Rebuilt the bundle locally, applied it to a stock APK copy and verified the signed output off-device.
- Documented the signing-key requirement and the remaining phone checks.

## 0.0.1 (2026-09-27)

- Started a separate local Morphe patch source for Messenger `580.0.0.49.91` (arm64, version code `346013387`).
- Added a shared-permission rename patch for installation beside Meta apps.
- Added the project research, roadmap, build notes and GPL attribution.
