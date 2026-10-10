# Changelog

## Unreleased

- **Turn off the swipe up for disappearing messages** is a new switch under Conversations that starts off ([#36](https://github.com/SysAdminDoc/HushMessenger/issues/36)). With it on, swiping up at the bottom of a chat no longer turns on disappearing messages, so a scroll can't set the timer by accident. Scrolling works as usual, and you can still turn disappearing messages on from the chat's settings. It takes effect right away, with no restart.
- With **Hide People You May Know** on, HushMessenger asks Messenger for your chat list again about half a second after it starts instead of after 2.5 seconds, to shorten the loading circle that could still sit under your chats for a few seconds. It tries up to three more times in the first 8 seconds and stops as soon as your chats show up ([#30](https://github.com/SysAdminDoc/HushMessenger/issues/30)).
- **Stop analytics uploads** now also covers the way Google Play can hand Messenger's Google Play upload service a task directly, without starting it the usual way. With the switch on, that task is reported back as done right away, so Google Play doesn't retry it, and Messenger's other scheduled tasks on the same worker run as before.
- **Keep a message log** now deletes messages older than 30 days from the saved file itself, a little after Messenger starts and every six hours, instead of only hiding them until the next message arrives. That happens with the switch off too. Off stops saving new messages and keeps the old ones until they expire or you clear the log, and the log's screen now says so. Each message keeps up to 8,000 characters and the whole log stays under 2 MB, dropping the oldest first. If the saved file can't be opened any more (say the phone's key store lost its key), it's moved aside and the log starts fresh instead of failing on every message. A save that fails partway leaves the old log as it was, and **Clear log** also drops messages that arrived a moment before but weren't saved yet, so they can't show up again afterward.
- Releases now run from `scripts/release/release.ps1` in five stages that refuse to run out of order. Each Messenger build family gets patched once per release, and the release checks can wait for a free build slot instead of piling onto other builds. Nothing changes in the patches.
- Extended the app audit with actual Messenger packet observations, background job and CPU measurements, and physically unplugged battery readings. Revision 2 includes aggregate data, a charge-counter chart and a repeatable procedure. It distinguishes shared encrypted hosts from specific tracking operations and documents the limits of short observations on a paused installation. No patch behavior changed.

- Added a detailed Messenger internals audit with ad and tracking paths, native settings screenshots, the boundaries of all 37 controls, and patch candidates with acceptance criteria. A reusable 581 DEX query batch accompanies the report. The audit identifies a conditional analytics Binder entry outside the existing guards and documents message-log isolation and retention limits. No patch behavior changed.

- The README now points to the patch code, in-app settings, build profiles and catalog checks. It also walks through adding a control or a supported Messenger version.
- **Material You theme** is now in Morphe Manager's default selection, so every control is there without Expert mode. Its switch is under Theme on the Controls page and starts off, so a build patched with the defaults looks like Messenger until you turn it on. **Clone install under another package name**, **Spoof package version** and **Custom new-message sound** still need Expert mode, because they change the package or need a file you pick.
- Every patch description in Morphe Manager now says in plain words what the patch changes and why you might want it. It ends with where to turn it on, or says it works as soon as you patch it in.
- Every switch in HushMessenger settings now explains in plain words what it does and what you'll notice. The pages, the setup panel and the bubble and app icon help text got the same plain wording.
- Messages in HushMessenger settings are clearer. Saving and restoring your choices, update checks, the camera notice and the setup help now say what happened and what to do next.
- The options you fill in when patching are easier to read. Clone install, Custom new-message sound and Spoof package version now explain what to type, and the version code option is called Version number.

## 0.22.0 (2026-10-08)

- **Keep emoji search on emoji** is a new switch under Stickers that starts off. With it on, typing while the emoji keyboard is open no longer flips it over to sticker search, so you stay on emoji. It takes effect right away, with no restart.
- **Use the phone's camera app** is a new switch under Conversations that starts off. With it on, the camera button in a chat opens your phone's own camera app instead of Messenger's camera. The photo comes back into Messenger's photo editor for that chat, the same way a photo picked from another app does, and you send it from there. It's photos only. HushMessenger has the camera app save the photo to Messenger's cache, not your gallery. Checks cover the chat camera button in all 37 supported builds.
- **Pure black dark mode** is a new switch under Appearance in settings, shown when Material You theme is patched in, and it starts off. With both on, Messenger's darkest dark mode backgrounds turn pure black. Lighter surfaces keep their wallpaper tint, and light mode doesn't change. You can flip it without patching again.
- **Send videos without re-encoding** is a new switch under Conversations that starts off. Messenger already skips the re-encode for a video that's close to its target size. With the switch on, a video up to 25 MB takes that same passthrough instead of being re-encoded. Bigger videos still get Messenger's compression, and so do trimmed or edited ones and formats Messenger won't pass through. Checks cover the video transcoder in all 37 supported builds.
- **Clone install under another package name** is a new patch, unselected by default. It installs a second Messenger beside the first under its own package name and app name, `com.facebook.orca.hush` and **Messenger Clone** unless you choose others in Morphe. Messenger's own permissions, provider authorities, task affinities and push categories move to the new name, and the patch stops before changing anything if one of them would still clash. The encrypted chat backup lookup that crashes under a renamed package keeps working, with a fix adapted from rushiranpise's Change package name patch. The broadcasts Messenger sends to itself, like the ones that refresh message requests and inbox filters, reach the clone's own package instead of the original app. Links it opens inside itself, from a notification or a story for example, stay in the clone too. HushMessenger's settings, launcher shortcuts and **Restore screens on re-signed builds** follow the new name. The README covers what stays tied to Messenger's original name.
- **Copy setup** now shows whether Android knows HushMessenger's settings provider under the package name Messenger runs as.
- **Unlock app icons** is a new switch under Theme that starts off ([#33](https://github.com/SysAdminDoc/HushMessenger/issues/33)). With it on, every icon in Messenger's App icon setting can be picked without a subscription, and Messenger changes the home screen icon with its own code, the same way it applies a free icon. The icons already ship inside the Messenger APK, so nothing gets downloaded. Messenger still decides whether the App icon setting shows on an account, and with the switch off it may put its default icon back the next time it closes. Checks cover the icon code in all 37 supported builds.
- With **Hide People You May Know** on, the chat list no longer keeps a loading circle under your chats after Messenger restarts ([#30](https://github.com/SysAdminDoc/HushMessenger/issues/30)).
- With **View stories anonymously** on, a story you've opened no longer keeps its new-story ring in your chat list, after a restart too ([#35](https://github.com/SysAdminDoc/HushMessenger/issues/35)).
- With **Use system emoji** on, a Like in the chat list shows Messenger's thumbs-up again instead of an empty box ([#34](https://github.com/SysAdminDoc/HushMessenger/issues/34)). The phone's emoji font doesn't have Messenger's own Like character, so on Android 10 and newer that character now comes from Messenger's emoji font while every other emoji keeps the phone's look. It also shows on the first start after an update, when Messenger draws the chat list before its own emoji font has loaded.
- **Spoof package version** is a new patch that starts unselected. It sets Messenger's version code to a number you choose, 2147483647 by default, so the Play Store stops offering Meta's updates over a patched build. Messenger may report that number to Meta. Later builds need the same number or higher to install over it. The patch catalog now lists each patch's options.
- **Custom new-message sound** is a new patch that starts unselected ([#32](https://github.com/SysAdminDoc/HushMessenger/issues/32)). Pick an .ogg, .mp3, .m4a or .wav file of 1 MB or less when you patch, and it replaces Messenger's `new_message` sound, the one its message notifications use by default. With no file picked it changes nothing. A missing, empty, oversized or mislabeled file stops the patch with the reason.
- **Restore old emoji drawer** is a new switch that starts off. It turns off Meta's redesigned emoji drawer, so the emoji keyboard keeps its earlier layout. Changes apply after **Restart Messenger**, and accounts Meta never moved to the redesign see no difference.
- **Stop analytics uploads** is a new switch that starts off. It stops the background services Messenger's analytics logger uploads through. Messenger still records those events on your phone, and they can upload after you turn it off.
- **Keep a message log** is a new switch that starts off. It copies each message as its notification arrives, so an unsend can't take it back, and it's the only switch that reaches end-to-end encrypted chats. The log holds only messages that raised a notification. It stays on your phone and is encrypted with a key kept in the Android keystore, so the copy never leaves the device. A new viewer in settings lists it newest first, and **Clear log** deletes the file and throws the key away. Nothing is stored while the switch is off or Pause or safe mode is on.

## 0.21.0 (2026-10-05)

This release has 33 patches, 30 of them switches, for all 37 arm64 builds of Messenger 580.0.0.49.91 and 581.0.0.49.91. It adds Messenger 581 and a new switch, Hide joined community chats. Hide AI sticker tools now covers the Generate buttons in the sticker keyboard, and Allow screenshots covers view-once media and Quicksnap.

### New

- HushMessenger now patches Messenger **581.0.0.49.91** as well as 580.0.0.49.91 ([#29](https://github.com/SysAdminDoc/HushMessenger/issues/29)). All 16 arm64 builds APKMirror lists for 581 pass the compatibility checks, and Morphe Desktop 1.18.1 applied all 33 patches to each of them with a 1 GB heap. On a Galaxy S22, v0.14.0 on Messenger 580 updated in place to this release on 581 and kept its sign-in and chats. Meta renumbered two server flags and moved several screens around in 581, so People You May Know, joined community chats, inbox ads, the AI sticker Generate buttons, screenshots in view-once media, Native Bubbles and the HushMessenger menu row now follow the new layout. On 581 the HushMessenger row sits right under Settings, above the new QR code row. The 580 builds patch exactly as before.
- Hide joined community chats is a new control that starts off. It filters subscribed channels and announcements from the main Chats list (the All chip) while keeping conversation data, delivery and unread state intact. Displayed row counts follow the filtered list. Off or Pause restores the original list on the next render. Other chips such as Channels and Unread, search and community folders keep their rows. Folder and membership checks cover all 21 supported builds.
- **Hide AI sticker tools** also hides the Generate buttons in Messenger's newer sticker keyboard. The guard matches the verified AI label and leaves other cells alone. **Allow screenshots** also covers the secure-window calls in view-once media and Quicksnap. It preserves unrelated flags, lifecycle code and the original calls while off or paused. All 21 supported builds have records for these routes.
- Settings expose each control's full row as one accessible switch. The title, description and activity label share a touch target, and the switch keeps its keyboard focus. Unavailable controls can be read but can't be toggled. Live TalkBack checks on an isolated Android 16 preview read the title and description as one control and changed the saved choice once per double-tap. The enabled-count summary stays readable without announcing after every toggle. Regression checks cover Android 9 and 16.

### Changed and fixed

- Patch builds now use Morphe Patcher 1.15.1 and the maintained MorpheApp ARSCLib fork. The tested tools are Morphe Manager 1.34.0 and Morphe Desktop 1.18.1. Migration checks applied all 32 patches to all 21 supported APKs at a 1024 MB heap, verified signatures for the five naming groups and retained their native libraries. Two fresh checkouts produced the same bundle bytes. Kotlin and Bouncy Castle security pins remain in place.
- The install check reads signer details from Android Build Tools 37 as well as 36.1. Build Tools 37 labels each signer with its signature scheme, and the check used to stop with "Cannot establish the complete current signer set" when it saw that format.
- The early v0.0.2 to v0.0.8 previews are no longer marked as pre-releases on GitHub. Catalogs that follow pre-releases kept offering v0.0.8 from them, and that stops on their next refresh.
- Inbox switches such as Hide People You May Know, friend requests and growth prompts now give one steady answer to each chat list Messenger builds. Messenger asks the same question when it lists a section, when it starts the section's loading and when it stops it, and a switch flipped in between now waits for the next chat list instead of splitting those steps. **Restart Messenger** applies a change everywhere at once.
- The full compatibility check now requires the exact stock APKs. Community fixtures use recorded stock identities, and media replay goes through shared discovery. Tests track fixture changes and reject duplicate builds that would leave another build untested.
- File tests now share Android's atomic-replace semantics on Windows, check post-commit read failures, and cover nonseekable restores on Android 16. Community discovery also reuses its constructor identifier in both scans.
- Retained unsent markers are capped at 4,096 IDs and no longer share the settings monitor. This only prunes markers, never message content.
- Choices saves check media-row ownership before opening the destination for writing. A picker can't use a Messenger-owned MediaStore row to overwrite its content.
- An original-photo success callback that throws no longer receives a second failure callback or loses the copy it was handed.
- Theme return hooks keep incoming branches attached to the color helper. Menu binding rejects reused holder registers before making changes, and the story Save helper is retained even when the patcher has already cached direct methods.
- Community filtering preserves the native list type and checks backward and switch branches before reusing temporary values. Screenshot support now stays unavailable if any matching viewer method changes, even when the original methods still exist. Other controls remain available.
- Profile recording now parses the rebuilt manifest, resource table and every DEX. A successful Desktop report and valid ZIP are no longer enough to accept malformed APK contents.
- Changed media-viewer or community code now leaves those controls unavailable while other patches can still apply. Community discovery runs once during setup and reuses fixed method identifiers while checking the APK. Manager 1.33.0 applied all 33 patches to Messenger 581 at its unchanged 640 MB limit, with a 288 MB peak.
- Closing settings or canceling an update check no longer waits for a slow cache write. Pending writes from canceled checks are discarded, and an older write cannot replace a newer result.
- Saving choices continues through rotation or closing settings, with the same 30-second limit and a completion or failure message. Closing the screen no longer cancels a save after its destination may have been emptied. Restores still cancel when settings close.
- Compatibility profiles now require Desktop to apply every patch and rebuild the APK before the record is written. Discovery alone could previously accept a changed menu or drawer that the patcher rejected. The check rejects incomplete results and changing input files.
- **Open** in settings and **Restart Messenger** now find Messenger when you've switched to one of its alternate app icons. They used to report that no launcher was available, because they read each icon's built-in default instead of whether Messenger had turned it on.
- Safe mode keeps counting startup crashes even when its saved count can't be read, so a crash loop still pauses the controls after three tries.
- Update checks recover on their own if GitHub's reply no longer matches the saved release details. A retry time from GitHub never holds checks back for more than a day, and it never shortens the normal wait between failed checks.
- Development release checks compare the held public feed with the one published under its release tag, and the development version must be newer. Catalog validation runs the Gradle wrapper directly and stops the whole process tree if it times out. The compatibility report keeps going when the community route changes on a new build, and the memory gate reports a damaged output APK without dropping the other results.
- The memory gate now checks every build of every supported Messenger version. It used to expect exactly 21 and would have refused to start once 581 was added.
- The memory gate runs at most two builds at once, with two processors per Java process. Compatibility and patching failures include their subprocess exit codes. Regression tests check that all inputs run without exceeding the concurrency limit.
- Focused dependency tests run five partial patch selections through compilation. A failed sibling keeps the successful patch, advertises no failed control and leaves its own native target unchanged. A later selection starts with no stale keys. Each run checks a single settings and extension injection.
- Opted-in update checks reuse validated release details for an hour and send their ETag on later checks. GitHub retry times are shown in settings and respected. Quota reset times apply only to an exhausted quota, so secondary limits keep their own retry wait. Release links must match their tags, and development builds ahead of the public release show both versions. Late replies can't save cache data after cancellation.
- Copy setup includes the control descriptions shown in settings and explains what recorded activity proves. Receipt wording keeps the local unread and reply limits explicit. Sign-in and past-call-log documentation now reflect the observed results.
- Original-quality photos enforce the 20 MB limit throughout preparation and delivery. Files that grow during a read or while a callback waits are rejected. Cleanup keeps the source and earlier copies intact. Existing scan bytes, color profiles and orientation handling are preserved.
- Crash records verify replacement contents before committing them. Android 9 and 10 check the backup rename before a write can overwrite the old record, and a completed save won't trigger a rollback. Recovery checks preference saves too. If a save fails, settings keep the controls paused and show a retry message. A successful recovery restores the saved theme immediately. Invalid preference types keep host startup disabled. Existing records remain readable.
- Development bundles can be validated while the public feed remains held. Validation checks both DEX files, including mapped section counts, bounds and referenced item starts, and the exact loaded catalog. Cached catalog comparisons preserve JSON types. Validation freezes the bundle with its checksum outside the build folder. The memory gate uses that snapshot and checks that its bytes stay unchanged. Release validation keeps its publication checks separate.
- File saves and restores can be canceled. Settings stop waiting after 30 seconds and release the screen when it closes. Late results can't change choices, and a storage app that ignores cancellation can't start unlimited background work. File slices retain their absolute boundaries, including files supplied with a different initial position. If you cancel a save, save again before you rely on that file.
- Repository links now use the HushMessenger artwork as their social preview.
- Manager 1.33.0 applied all 32 patches at its existing 640 MB process limit, with a peak heap of 290 MB. The signed result passed archive checks and kept every native library unchanged. Fresh-checkout reproduction and non-English setup diagnostics also passed. A development build updated an existing signed-in installation without replacing its key or losing its chat history.

## 0.14.0 (2026-10-02)

This release has 32 patches, 29 of them switches, for all 21 arm64 builds of Messenger 580.0.0.49.91. It adds Native Bubbles and an optional slide animation for chats. Settings now open from Messenger's side menu too, and Use system emoji draws your phone's own emoji instead of Google's. Root Mount installs also get their long-press shortcuts back.

### New

- **Allow chat bubbles** offers **Stock**, **Chat Heads** and **Native Bubbles** when Messenger's native routes are verified. Native mode uses its conversation notifications, long-lived shortcuts and embedded chat screen on Android 11 or newer. Account eligibility and Android's permissions still apply. Notification and conversation settings links include recovery guidance when a phone omits either page. Pause or Stock restores the original routing. Refs #19.
- **Slide chats in and out** slides a chat in from the side when you open it and back out when you go back, while the screen underneath holds still. It works for chats opened from the chat list and from search, and right-to-left languages slide from the left. Chat heads and bubbles keep their own animations, as do chats Messenger restores. The switch starts off, and Pause or Android's **Remove animations** setting keeps Messenger's own. A phone on Android 16 showed it from the chat list and from search in both themes, and turning the switch off brought back the stock transitions. Opening a chat from a notification hasn't been checked on a phone yet. Refs #28.

### Changed and fixed

- The settings-entry patch adds Messenger 580's side menu alongside its Menu tab. It builds a separate native folder row without changing existing folders, badges or snippets. Changed constructors, unallocatable models and a folder click path that can reach the row without passing the settings hook stop patching before any menu changes. An Android launch failure keeps the added row from falling into Messenger's own click handler and shows recovery guidance. On a test phone, the side-menu row and the Menu tab row both opened settings, and the side menu kept exactly one row through a cold start. Root Mount installs haven't been checked yet. Refs #26.

- **Use system emoji** now draws the phone's own emoji set on Android 12 and newer. It used to load Android's standard Noto font every time, so Samsung phones, other phones with their own emoji and emoji modules got Google's emoji instead of their own. HushMessenger now asks Android which font it draws emoji with and uses that. Android 9 to 11 keep the standard font. On a Samsung test phone, the composer and Messenger's emoji picker went from Google's emoji to the phone's own set. Refs #25.

- Directions to the settings now say **Long-press Messenger's home screen icon > Patch controls** in Manager's patch descriptions, the settings help text and the recovery message. "Long-press Messenger" was read as the Messenger title inside the app, where a long-press does nothing. Refs #27.

- On a Root Mount install, Android never reads the patched long-press shortcuts, so **Patch controls** and **Restart Messenger** were missing from Messenger's icon. HushMessenger now adds both itself when Messenger starts there, and puts them back if Messenger's recent-chat shortcuts push them out. The missing shortcuts were reproduced on a rooted test emulator with a mounted build. A real Root Mount phone hasn't been checked yet. Refs #27.

- Local Android builds use AGP 9.4.1 and Android Test Engine in place of the older UTP/Netty device-test transport. The build and all 21 supported patch inputs pass. A separate settings-preview test passed on Android 16 and verifies that host test libraries aren't bundled into the extension. SDK/lint tooling still contains advisory-matched HttpClient and Commons Lang versions. This update doesn't claim to fix those matches.

- Choice files accept content-provider documents outside Messenger's own UID, so a picker cannot read or overwrite its private files through a file path or an app-owned provider. Provider failures leave choices alone and omit private exception details from logs.
- Choice-file checks normalize Android user prefixes before checking provider ownership, so alternate addresses can't reach Messenger's private providers. Android 16 hardware checks rejected all six private-provider read/write addresses before access. External file export and restore preserved every choice, and the compiled theme, startup and recovery checks passed.
- File backups show progress and prevent overlapping file work. A delayed restore leaves newer switch changes or clipboard restores alone and explains how to retry.
- Bubble hooks initialize saved choices when they are the first control called on a Root Mount startup. Unsupported Android versions and secondary processes keep stock behavior.
- Pause, switching Material You off and clearing safe mode refresh the cached dark surfaces. Palette listeners start after crash recovery is known, without holding the startup lock.
- A hook that keeps failing refreshes its saved diagnostic timestamp once a minute. Repeated failures keep the latest time in memory without writing preferences on every draw.
- Original-quality photos remove RGB thumbnails embedded in JFIF headers. Both send paths keep the main image data, density fields and color profiles, and leave the source file untouched.
- Settings and the install guide explain that uninstalling the settings icon also removes Messenger. Hide app drawer icon removes only the launcher entry. Refs #26.
- Native Bubbles has a direct Android bubble settings link. Samsung's app notification page can omit that option, so the general notification link alone couldn't finish setup. Missing settings screens leave choices unchanged and show recovery guidance.

- Both settings tabs have fresh screenshots from the embedded v0.10.0 build. Install guidance separates message-content prompts from store updates, explains drawer access and unsent/read-receipt limits, and preserves account data when an installation conflicts. Manager 1.33.0 and Desktop 1.18.0 are the documented baseline, with manual signed-checksum verification.
- Native capability checks follow the values connecting Messenger's shortcut, notification metadata and embedded activity. Null, disconnected and ambiguous routes keep stock behavior.

## 0.8.0 (2026-10-01)

This release keeps the same 31 patches, 28 of them switches, for all 21 arm64 builds of Messenger 580.0.0.49.91. Patching with Material You theme fits in a 1 GB heap now, and you can save your choices to a file. Most of the other work makes the settings screen say plainly what each switch is doing.

### New

- **Save choices to a file** and **Restore choices from a file** use Android's file picker. They share the clipboard backup format and need no storage permission. Cancelled, unreadable or corrupt documents leave choices alone, and a result from before settings reopened is ignored.

### Changed and fixed

- Crash recovery is verified against API 30, 36 and 37 exit records, including low memory, user stops, package updates and MemoryLimiter:AnonSwap. Duplicate or stale records don't advance the same failure twice. A controlled test on an owned phone activated safe mode after three preview-process crashes and kept the selected choice when Resume cleared it.

- Delayed update failures now have the same opt-out, destruction and supersession regression checks as delayed successes.

- Update checks show progress when enabled and offer **Check now** to retry. Responses are capped at 256 KiB and checked as strict UTF-8 JSON with a valid release tag and a link to this repository. Opt-out, a newer request or closing settings cancels the connection and prevents stale results. The help explains GitHub's connection metadata.

- App explains why the drawer-icon switch is absent on Root Mount, bundles without a launcher alias, or installations without the Menu row. Search links to the relevant App setting. A disabled but installed alias remains configurable, and shortcuts alone cannot hide the only reliable icon. Refs #6.

- The heap verifier and its regression tests now pass the pinned formatter. Their syntax trees and assertions are unchanged.

- Keep unsent activity now advances only when a legacy unsend with an identifier is intercepted. Reading ordinary or previously retained messages leaves the timestamp alone. Status checks also sample pixels from the rendered screen and inspect Android's accessibility node in both themes.

- Retained-unsend identifiers are added under one lock, so concurrent events no longer overwrite each other. Duplicate events avoid another write. Calls while the control is off, paused, unavailable or in safe mode add nothing. Tests preserve 100 concurrent identifiers and existing entries through a fresh read from disk.

- Keep unsent describes its verified legacy routes, unsupported encrypted chats and unverified group coverage beside the switch. **No unsend activity observed since restart** describes hook activity without implying chat support. Tests cover retained-message labels, stock behavior while off or paused, and choices retained after settings reinitializes. Refs #23.

- Control activity labels refresh when settings resumes, keeping the same switches, scroll position and focus. Paused choices say **Changes paused**. Labels have full contrast in both themes, and the switch reads the current status once without exposing exception details.

- Repeated taps cannot open overlapping choices pickers. Cancel lets the next request proceed. Tests also check malformed UTF-8 and require all five menu mapping groups explicitly.

- Choice backups now use an exact versioned header and a 16 KiB limit. Legacy exports still restore. The entire backup is checked before one preference update. Malformed lines, duplicate keys and invalid booleans change nothing. Unknown and unavailable controls are reported separately, and omitted choices retain their saved values.

- The settings menu patch validates its builder, binder, drawer setter and click route before editing any of them. Tests corrupt each target and its register contract across all five naming groups, checking that failures leave the host code and capability flags untouched. Branches to normal exits still run the settings hook.

- The memory check now rejects incomplete APKs, missing extension code, changed input files and reduced catalogs. It compares edited class counts as well as color counts. Material You validates and wraps range-form color calls too.

- **Open** skips the settings launcher alias, extension screens and disabled launcher entries, so it opens Messenger instead of reopening settings. Missing or rejected launchers show the existing recovery message. Restart applies the same disabled-entry guard.

- Safe mode now offers **Resume** directly. If **Pause all changes** was already on, the action reads **Clear safe mode** and leaves Pause on. Both actions clear the crash streak and keep every saved choice.

- Material You now finds and validates its edits before making any host class mutable. This avoids rebuilding unrelated classes and leaves the theme untouched if a required route is missing. All 31 patches apply to each of the 21 supported APKs with a 1024 MB Java heap. New tests check unchanged classes and late failures, and `scripts/verify_patch_heap.py` repeats the whole-APK check against the recorded input hashes and independently discovered color counts. Refs #18.

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
- Allow screenshots, Hide read receipts and Keep unsent messages all start off. A kept message shows "[unsent]" before its text and stays after a restart. Hide read receipts also works in end-to-end encrypted chats, which Messenger uses for most one-to-one chats. There, Messenger marks a chat read and sends the receipt in one step, so chats you open stay unread until you reply or turn the switch off. Keep unsent messages doesn't work in end-to-end encrypted chats. Messenger removes those messages below the part of the app HushMessenger can change.
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

- Pass 133 local tests and rebuild both exact APKs with all 21 patches. Verify all 57 runtime hook calls and preserve every stock class and native library. Both installed phone APKs remain stock. Their account data is unchanged.
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
- Confirm stock encrypted message delivery between two owned accounts on S22 and S25. The S22's stock browser switch passed HTTP and HTTPS comparisons. Its original setting was restored. Re-signed Messenger still needs a working startup path.

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
