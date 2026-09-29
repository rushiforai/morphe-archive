# Changelog

## Unreleased

None of this is in a release yet. It'll ship together in the next one.

### Changed and fixed

- A Facebook patched with the same key as Messenger, such as Hushfacebook, is no longer turned away when it asks Messenger for its shared message keys. Messenger used to refuse it because its certificate wasn't Meta's. Now, while that Facebook is the app calling Messenger and its current signing key is exactly the one Messenger carries, Messenger checks it the way it checks Meta's own Facebook, so Meta's rules still decide what it may read. Any other app, a Facebook signed with a different key, and a Messenger that still carries Meta's key all get the old answer. Copy setup counts each outcome. Tests cover each case. Facebook hasn't made that call on the test phone since the change, so it hasn't been seen working there yet.
- The App tab's Quick access card now mentions the HushMessenger row in Messenger's Menu tab, on builds that have it. The text stays whole at twice the normal text size in both themes.

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
