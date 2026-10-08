# Changelog

Changes in the source build, then released versions.

## 0.0.12 (2026-10-07)

* **Threads:** New Trust user-added certificates patch, not selected by default. Threads accepts certificates you've installed on your phone yourself, such as one a work network needs or a debugging proxy's, wherever it relies on Android's own certificate checks. Threads' network code checks Meta's certificates on its own as well and this patch doesn't change that, so a proxy still can't read most of Threads' traffic to Meta. HushThreads settings list it under Set when you patched.
* **Tooling:** A fixture test decodes the network security config of 450, 449 and 448 and checks that the user entry lands in its base trust anchors and nothing else in the file changes.
* **Threads:** New Remove share targets patch, not selected by default. Threads stops showing up in the share sheet other apps open, so it isn't offered when you share a link, a photo or a video from somewhere else. The patch takes Threads' share entries out of its manifest, and any direct share contacts Threads might list there go too. Sharing from Threads to other apps still works. HushThreads settings list it under Set when you patched.
* **Tooling:** A fixture test decodes the manifest of 450, 449 and 448 and checks that the share handler's two share filters are the only thing that goes, and that the entry Threads uses to share out to other apps stays.
* **Threads:** New Change version code patch, not selected by default. It raises the patched Threads' version code to the highest Android allows, so Google Play stops offering Meta's updates over it. Every build with the patch has that same code, so an older Threads patched with it installs over a newer one too. Threads' own checks of its version code, at start and in its job scheduler, still see the code Meta built. Going back to stock Threads afterwards means uninstalling first, which deletes Threads' data, and later HushThreads builds need the patch too.
* **Tooling:** A fixture test checks on 450, 449 and 448 that Threads' own reads of its version code go through HushThreads with their own registers, that the start-up and job scheduler checks are among them, that the two reads meant to see the raised code are left alone, and that the decoded manifest changes in its version code and nowhere else.
* **Threads:** Hide ads now also takes out the feed units Threads itself marks as ads by their unit type, even when the post inside doesn't carry the ad flag. That covers plain ads, ads for ads, the two kinds of ad pivot and the ads feedback prompts. Suggested accounts and other recommendation units stay, and so do ordinary posts. The Hide ads switch covers both checks.
* **Tooling:** A fixture test checks on 450, 449 and 448 that the unit type is read from the feed item's own field, the one its feedItemType getter reads, and that the field's enum names every ad kind. A unit test drops the ad unit types and keeps NETEGO and SUGGESTED units and ordinary posts.
* **Threads:** New Max image quality patch, off by default in Manager. Threads gets every photo in several sizes and normally loads the one closest to your screen's width. With this on it loads the largest size it has, so photos look sharper and each one is a bigger download. Square crops stay square and nothing changes size on screen. The switch is under Feed in HushThreads settings as Full size photos, and turning it off or pausing HushThreads gives Threads its own choice back.
* **Tooling:** A fixture test checks on 450, 449 and 448 that Threads' one photo size chooser asks the extension for its target width first thing, and that the answer lands in the register the chooser reads that width from. The patch refuses when the chooser isn't there exactly once or reads the width anywhere else.
* **Threads:** New Disable screenshot detection patch, off by default in Manager. Threads isn't told when you take a screenshot. It stops looking through your photos for new screenshots, and on Android 14 and newer it doesn't ask Android to report screenshots of the feed. Your screenshots are still saved. The switch sits in HushThreads' Privacy settings, and turning it off or pausing HushThreads gives Threads its own behavior back.
* **Tooling:** A fixture test checks on 450, 449 and 448 that the photo library observer and the screenshot folder report each ask the extension before anything else, with the register they borrow unused at that point, and that Threads' one request to Android goes through the extension with the same arguments.
* **Threads:** Restore screens on re-signed builds now also covers FBNS, the push service Meta's apps share. FBNS checks the app's own signing certificate before it hands it pushes, and on a re-signed build it now gets Threads' original certificate there too, the same way Threads' other security checks already did. Refs #6.
* **Tooling:** A fixture test checks on 450, 449 and 448 that FBNS's check hashes the certificate HushThreads answers, read straight after its own read with nothing else moved, and that a check read twice or into the wrong register stops the patch.
* **Threads:** New Save photos and videos patch, selected by default. A post's menu gets a Save row right under Copy link, with Threads' own download icon. It reads Save photo, Save video or Save all, depending on what the post holds, and posts without a photo or video don't get it. A tap saves to your gallery, photos to Pictures/Threads and videos to Movies/Threads with their sound, at the best size Threads has. A carousel saves every page in order, photos and videos alike, and its files carry the post's id so two posts never mix. The menu closes once the save starts, as it does after Copy link. A new Downloads page in HushThreads settings has the switch plus quality, folder and file name options, and it shows how the last carousel save went. Pause takes the row away too.
* **Tooling:** The save engine and its tests come from HushGram, with per-file provenance. A fixture test checks on 450, 449 and 448 that the Save row goes in only on Copy link's own path and is drawn with the calls Copy link uses. Every other branch in the menu still lands where it did, including 450's, where another row shares Copy link's drawing call. It refuses to patch when Copy link is checked twice, a branch jumps into its case, the menu's composer or own parameters get overwritten, or the menu closes some other way. Apart from the release check, the downloader is the only code that opens its own connection, and the hosts test now holds both to that.
* **Threads:** HushThreads now has its own row in Threads' settings, right above More settings, so you can open it from your profile's settings like any other page. It's drawn the way Threads draws its own rows. It grows with large text, and TalkBack reads it out and opens it with a double tap. The launcher shortcut and Additional settings on the App info page still work.
* **Tooling:** A fixture test checks on 449 and 448 that the row goes in only where Threads draws More settings, hands Threads its own composer and modifier, and refuses to patch when that entry moves, its composer gets overwritten or a branch jumps into it.
* **Threads:** HushThreads now patches Threads 450.0.0.51.78 (version code 512008342, the 240-480dpi build) as well as 449 and 448. Threads 450 rearranged the code behind three patches. Disable video autoplay now finds the flag PostVideo plays by from the check that sets the player going, Block background-return feed refresh follows the warm-start check's new branch and the second server setting 450 can read its time limit from, and Pure black dark mode also looks in the helper where 450 builds its dark colors.
* **Tooling:** The fixture tests run on 450, 449 and 448. On 450 they check the playback effect's new parameters, the warm-start check that jumps to its log and back, the time limit read from either of two keys and the dark colors built in a helper.
* **Tooling:** Disable video autoplay now also checks that the flag it finds turns a video on when true and off when false, so a Threads build wired the other way round is refused instead of getting a switch that works backwards.
* **Threads:** If Threads draws its settings before HushThreads has started, the HushThreads row is left out of that one draw and comes back on the next, instead of staying hidden until Threads restarts.
* **Threads:** On a Threads build whose settings screen has changed so the HushThreads row can't go in, the settings patch now leaves the row out and says why in the patch log, instead of failing and taking every other patch with it. HushThreads still opens from its launcher shortcut and App info.

## 0.0.11 (2026-10-05)

* **Threads:** New Pure black dark mode patch. In dark mode your feed, posts and profiles sit on pure black instead of Threads' #101010 dark gray, which looks deeper and saves power on an OLED screen. Menus and sheets keep their own grays. It isn't selected by default. Once you pick it, its switch is on and lives on a new Appearance page in HushThreads settings, and a change takes effect after Threads restarts. Pause and safe mode hand the gray back.
* **Tooling:** A fixture test checks on 449 and 448 that the patch finds every #101010 load in Threads' theme and the background slots of its dark color scheme, hooks only those, and refuses to patch when the gray moves, the scheme builder branches, or one scheme serves both modes.
* **Threads:** HushThreads now builds on Morphe patcher 1.15.1, so it needs Morphe Manager 1.34.0 or newer. Manager 1.33.0 asks for an update before it loads the bundle.
* **Tooling:** ARSCLib follows the patcher to 9b742c412d, with hashes checked against the cached files. smali stays at d856bad65f, which 1.15.1 still asks for. The fixture gates move to desktop CLI 1.18.1.
* **Threads:** The sign-in section of the README now suggests resetting your Instagram password when Threads turns down one you know is right. That's what fixed it for the person who reported it.
* **Threads:** Signing in now has a device check on Threads 448.0.0.54.85 too. A typed password reaches the feed with only the settings patch or with all 11, and repatching with more patches on the same key keeps you signed in with your switches as you left them. With HushGram on the same key, your Instagram account shows up as a tile that signs you in without a password.

## 0.0.10 (2026-10-03)

* **Threads:** HushThreads now builds on Morphe patcher 1.15.0, so it needs Morphe Manager 1.33.0 or newer. Manager 1.32.0 asks for an update before it loads the bundle.
* **Tooling:** smali now matches the commit patcher 1.15.0 asks for. The old pin was one commit behind it but sorted higher, so Gradle had been compiling and testing against the older dexlib2. The fixture gates move to desktop CLI 1.18.0.
* **Tooling:** The localization guard also catches a settings row built through a qualified `HushThreadsPreferenceFragment` call in another source file. Before, it only looked for the row helpers inside the fragment itself, so an untranslated title elsewhere passed.
* **Threads:** The README explains how safe mode and Threads' own crash protection fit together. Five quick crashes within four hours make Threads delete its data, and safe mode steps in after three, so it gets there first. It also says which crashes Pause can't stop and what to do about them.
* **Tooling:** A fixture test reads Threads' crash-loop thresholds out of each declared build and fails if safe mode would wait as long as Threads' data wipe, or if it counts fewer seconds after a start than Threads does.

## 0.0.9 (2026-10-03)

* **Threads:** A Galaxy S23 Ultra running Threads 449 with HushThreads 0.0.4 confirmed that Hide suggested users takes the live Suggested Users block out of the feed.
* **Threads:** The overview, About and support reports identify the exact packaged bundle, including its payload hash and clean, modified or unknown source state. Identical repacks keep the same identity. Missing or damaged current metadata remains unverified.
* **Threads:** The overview keeps the full payload hash with a compact source state. About and exports retain the complete source record. At large text sizes, Pause, Resume and Undo appear above the summary so build details can't push recovery off the screen.
* **Tooling:** Bundle and receipt checks verify the packaged identity before accepting source claims. Existing display tests expected version-only text and placed recovery below the summary, which could hide it behind the new build details. Assertions now cover the payload field and accessible action placement, alongside tampering, archive, loaded-bundle and export checks.

* **Threads:** The settings overview names any default patches omitted from a build. Diagnostic exports include the app's declared web domains and Android's current link selections, with an explicit unavailable state on older versions.
* **Tooling:** Shared fixes and the Turkish GitHub wording correction are ported with per-file provenance. Tests cover missing defaults, Unicode domains and both report exports. An older analytics test expected only one report line and missed the new default-selection disclosure. Its analytics assertions remain intact. Android 9 also exercises the saved-file report through its actual legacy destination.

* **Threads:** Diagnostic exports redact filesystem paths from buffered events and saved Java/native crashes, including quoted paths with spaces, escaped forms and file URLs. Stack-trace filenames, package names and current signing-certificate hashes remain useful.
* **Tooling:** Clipboard and saved-file tests cover every diagnostic section on Android 9, 11 and 16 with Debug logging on and off. The earlier tests only checked request addresses and credentials. Long quoted values now avoid regex stack overflow, and the Windows file-write fixture only uses the new-file field on Android versions that have it.

* **Tooling:** Package-specific advisory ratings now follow OSV's listed-version/range union with Maven version ordering. Introduced, fixed, last-affected and limit boundaries are checked across unsorted intervals. Known nonmatching ranges no longer cause a false hold, and unreadable range metadata requires review. Previous package tests covered listed versions but never excluded an unaffected range.

* **Tooling:** Advisory objects and rating fields are checked before reading them. Arrays in scalar fields and nested severity/affected arrays require review, including package metadata without optional severity. Query containers, IDs, aliases, summaries and page tokens keep their JSON types and UTF-8 values. Malformed withdrawals stop the check instead of discarding an advisory. Valid UTC timestamp strings work on PowerShell 7.5+ and Windows PowerShell 5.1. Supported HIGH/CRITICAL ratings remain visible. Earlier fixtures missed shapes PowerShell could coerce or silently skip.

* **Tooling:** Release checks include OSV's package-specific severity for the queried library, including ecosystem-wide ratings. Unrelated packages and entries listing only other versions are excluded. Malformed or unsupported ratings still require review. Previous tests used advisory-wide vectors and missed a package-specific HIGH rating hidden by a LOW database label.

* **Tooling:** The release-check deadline covers name resolution, TLS handshakes and request writes as well as response reads. A stalled resolver leaves bounded background work, and expired waiting requests are removed. Earlier transport tests checked body reads but missed slow connection phases. Thirteen transport checks pass on native Android 9 and 17, and both platforms read the live release endpoint with the shared cookie store unchanged.

* **Tooling:** Explicit null severity entries and malformed non-array severity fields require advisory review. A missing optional field or a valid empty array stays distinct. Existing tests covered unreadable vectors but missed null entries that the pipeline silently removed.

* **Threads:** Support reports label the HushThreads bundle explicitly and include bounded hashes of the installed app's current signing certificates and available installer details. Android 9 uses the legacy installer API. Missing facts and query failures remain explicit. No certificate contents, signing keys or other apps' details are exported. Add your Manager version and install method when you send one.
* **Tooling:** Support-report tests now exercise Android 9 and newer install-source APIs, current versus past certificates, missing or excessive signer data and unsafe source names through the exports. The previous version assertion accepted the misleading morphe label and didn't check these installation facts. The reporting guide also clarifies Android 9's saved-file location.

* **Tooling:** The release advisory gate holds unsupported or malformed severity data for review even beside a lower label or score. CVSS 4 findings can no longer pass under LOW/MODERATE labels. Supported HIGH/CRITICAL ratings remain visible. CVSS 3 vectors with duplicate metrics or invalid optional values are refused as unreadable instead of receiving a score.

* **Threads:** Release checks use a separate TLS connection that sends no cookies and leaves Threads' shared cookie handler and store untouched. Response cookies are discarded. GitHub host checks, opt-in behavior, Pause, redirect limits and bounded responses still apply.
* **Tooling:** Release transport tests capture the transmitted request, including changing and header-dependent cookie handlers. The old preflight test required deleting shared GitHub cookies, which contradicted preserving the store. Nine wire tests pass on native Android 9 and 17, and both platforms read the live release endpoint with their normal TLS trust and hostname checks.

## 0.0.8 (2026-10-03)

* **Threads:** If you patch Instagram with HushGram using the same Morphe Manager signing key, Threads now shows your Instagram account as a tile on its login screen, and tapping it signs you in without a password. Restore screens on re-signed builds checks the exact package, that it's a separate app and its installed certificate first, so apps signed with other keys still get Threads' usual answer. Checked on Android 17 with Threads 449 and HushGram 0.0.4.

## 0.0.7 (2026-10-03)

* **Threads:** The bug report form includes Shizuku installs. The sign-in guide corrects the Android 17 report's install method and records successful settings-only and full-bundle password checks with Shizuku's installer identity and session options.

## 0.0.6 (2026-10-03)

* **Tooling:** The build's source guard parses Kotlin and Java import declarations to catch direct Guava imports with legal whitespace, comments, aliases or static imports. Examples in strings and comments, similar package names and an infix function named import remain allowed. The parsers are test dependencies and aren't included in the patch bundle.

## 0.0.5 (2026-10-02)

* **Threads:** Hide ads and Hide suggested users diagnostics count successfully checked feed pages and items, even when Threads sends nothing to remove. Disabled, paused and failed checks don't count. Removal counts still record only items taken out of a completed page.

## 0.0.4 (2026-10-02)

* **Threads:** New patch, Disable video autoplay, which you pick yourself. With its switch on, the video a post in your feed, a profile or a thread would start as you scroll stays on its cover frame. Tap it and Threads' full-screen viewer plays it with its usual controls. On an Android 16 emulator with Threads 449, feed videos stayed still with the switch on and played with it off, and a tapped video played full screen.
* **Tooling:** Fixture checks for Disable video autoplay run on 448 and 449. Their test builds include a PostVideo that plays by another flag or sets its play argument from a computed value, a feed post that reads the flag again after the call, a missing carousel call and a second PostVideo.
* **Threads:** New patch, Open links in browser. A web link you tap in Threads now opens in your default browser, or in the app Android picks for that site, instead of Threads' own browser. HushThreads asks first thing in the launcher Threads opens most links through, which covers the browser screen, the sheet over the feed and the full-screen browser. A link whose scheme is written in capitals goes out in lower case, since a browser only answers the lower-case form. A link wrapped in Threads' click tracker (`l.threads.com`, `l.instagram.com` or a `/linkshim` page) goes out as its real address, with `fbclid` and the other tracking tags removed. Threads, Instagram, Facebook, Messenger and Meta pages stay in Threads, because sign-in and Accounts Center need its session, and so does any link nothing on the phone can open. It has its own switch under Privacy and is selected by default.
* **Tooling:** The final APK check covers the browser hook. Its test builds include a missing hook, a link read from the wrong parameter, a branch that skips the launcher and a result written over a parameter.
* **Threads:** Sanitize sharing links swaps a short share link for the post's own link. Threads handed out `threads.com/share/<code>/`, a code made fresh for every share that opens the post with that share's xmt token. HushThreads now builds `threads.com/@name/post/code` from the post's author and code, and leaves the short link alone when either is missing. That covers Copy link, More and the rows that share into another app or an Instagram post. Send, WhatsApp status, Instagram story and WhatsApp quick sends let go of the post while they wait for its link, so HushThreads keeps the post for each of those shares until its link comes back.
* **Tooling:** The final APK check covers the short-link hook after both of the share sheet's link reads and in every step that holds a post and reads its link. Its test builds include a missing hook, a swapped register, a wrong post field and a check that skips the call. More cover a step with no hook, a post read through another register and a post field from another class. Two break only that step's own copy of the hook, so the check of the share sheet's copy can't stand in for it.
* **Tooling:** The final APK check covers Send, WhatsApp status, Instagram story and WhatsApp quick sends too. It looks for the post going in before the wait and coming back out for the short-link hook after each read. Its test builds break that in a use case and in a coroutine body, with a missing or miswired keep, a recall from the wrong register, a cast to the wrong type and a check that skips the call. Fixture checks on 448 and 449 refuse a continuation register that's written over or copied from the post, a quick sends body with no post cast and one that writes over this. The check also lets the nop that aligns a switch's data come or go when the code above it grows, which it did in quick sends on 449.
* **Threads:** Block background-return feed refresh now hooks For you's swap only where it asks the same MobileConfig getter for the same key the feed's reload check compares with, holds the time away first and branches on that comparison. On Threads 448, where both checks share one method, any 64-bit number in that method used to count as the threshold.
* **Tooling:** The injected-register device suite keeps another run's marker in the rolled-over log, so a check that took any marker for its own fails. Its scan for scripts that clear a phone's log now reads the parsed script, which catches a clear spread over several lines or written inside one quoted command.
* **Threads:** Safe mode and the ways into settings were checked on a Galaxy S22 with Android 16 and Threads 449. Three crashes in a row within a minute of starting paused HushThreads on the next start, a force-stop before them didn't count toward it, and the report showed every hook taking Threads' own path with the saved switches kept. Resume and a restart brought every hook back, and the account stayed signed in. The launcher shortcut and Configure in Threads on the App info page both opened settings, every page went Back to the one it came from, and every control had a name TalkBack can read.
* **Threads:** The Pause, Resume and Undo button beside HushThreads' status is at least 48 dp tall now. It took its height from the two lines of text next to it, which left it 39.5 dp tall on a Galaxy S22.
* **Tooling:** The injected-register device check doesn't clear the phone's log anymore. It writes a marker of its own before dex2oat runs and counts only the verifier lines that follow it. If the log has rolled past that marker by the time it's read, the check stops with an error instead of guessing.
* **Tooling:** The settings file test resets the release check it turns on, so the release check tests start from a phone that never checked in any suite order.

* **Tooling:** Localization file-picker tests wait for queued work with a finite completion fence, so recurring animations can't keep the suite running indefinitely. Every existing language and toast assertion remains.

* **Threads:** Hide suggested users has its own feed switch for verified server cards that suggest accounts to follow. Ads and suggestions share one page filter with separate removal counts. Unknown card types, ordinary posts and reposts stay visible. A failed check keeps the whole original page. Both supported builds pass its fixture checks.

* **Tooling:** A patch that finds more than one match now lists the candidates when it stops, so a changed Threads build can be checked before anyone installs it.

* **Threads:** Block background-return feed refresh keeps your place in the feed when you come back to Threads within ten minutes, or after any time away with No time limit on. Threads' background refresh of For you, its reset to the main feed, the feed's own reload and its swap to posts fetched while you were away all get one answer per return. Pull to refresh and a fresh launch still load new posts. It isn't selected by default. Checked on a Galaxy S22 with Threads 449.

* **Tooling:** `scripts/upstream-drift.ps1` lists the files ported from Hushfacebook that changed there after the commit their rule records, and exits 1 when any did. A ported file with no upstream counterpart, or an upstream it can't read, exits 2 so neither passes for a clean answer.

* **Tooling:** The shared-link guide says which tracking tags Sanitize sharing links removes, and a source comment no longer credits a Threads rule to ClearURLs.

* **Tooling:** Local APK builds align native ZIP entries before signing and check the final signature and alignment with the existing key. Release receipts now record ELF segment alignment, ZIP alignment and native payload preservation separately from vendor incompatibilities.

* **Tooling:** Settings and recovery tests now cover Android 9 and Android 16, including large RTL text, entry and Back actions, content-URI imports with rollback, release-check consent and persisted crash recovery. Existing Android 11 coverage remains.

* **Tooling:** The build classpath uses Guava 33.7.2, which fixes the serialized-collection allocation advisory. Manager still supplies its own copy. The patch-source import guard now scans from the repository root and rejects static imports, missing sources and empty source directories.

* **Threads:** Disable analytics was checked switched on, switched off and paused on Android 16 with Threads 449. In every session Threads' background workers settled down instead of retrying the uploads it blocks.

* **Tooling:** The source ledger now records HushThreads in all five discovery indexes, groups verified forks and mirrors under their origins, and distinguishes candidates from catalogs. Build, reporting and source guidance now lives in README. Licensing and mirror checks work without local guides.

* **Threads:** Threads 448.0.0.54.85 for arm64 is supported alongside 449.0.0.54.82. All 10 patches apply to both without forcing, and a same-key update kept a signed-in session through settings and live-feed checks.

* **Threads:** Diagnostics count each removed ad post and each shared link that actually changes, separately from hook calls. Disabled, paused and failed operations add no outcome. Counts remain bounded and survive clear/undo without overflowing.

* **Tooling:** Concurrent builds now isolate split-bundle inputs before merging. Device builds use the same merge path, preserve the original archive and clean temporary inputs after success or failure.

* **Tooling:** APK verification checks selected feed, link, analytics and signature mutations against the stock build. It preserves called stock methods and ordered exception handling, including valid splits of long protected ranges. Missing hooks, discarded ad results and changed stock dependencies fail cleanly. Empty selections don't require omitted payloads.

* **Threads:** Link cleaning now rejects an unrelated constructor or a wide write that overwrites the response name. Casts keep tracking the same response object, including a cast through Object.

* **Tooling:** Device install and verifier scripts now check and renew an owned lease and verify the selected phone or emulator profile. The lease file stays exclusively open while each command runs. Signing conflicts preserve installed apps. Replacement uninstall requests are refused before building.
* **Threads:** Privacy settings and exported reports now list the matched and missing analytics address kinds. Partial coverage stays visible when the switch is off or HushThreads is paused. The guide describes the address paths it covers.
* **Tooling:** Settings tests initialize their context before accessing patch switches, so their order doesn't affect the result.

## 0.0.3 (2026-10-01)

* **Threads:** This release keeps the same 6 patches for Threads 449.0.0.54.82. Hide ads and Sanitize sharing links are stricter about where they patch, and the check that lets a same-key Instagram call into Threads no longer stops when Android can't answer a lookup.
* **Threads:** Hide ads now requires one distinct item getter with a matching cast and method declaration. Link cleaning follows the named response object's registers and requires one owned string store. Competing targets stop patching with candidate details.
* **Threads:** A failed Android package or Binder lookup keeps the framework's signer result instead of interrupting a family-caller check.
* **Threads:** Password sign-in reached a feed for one account with the published 0.0.2 bundle and six 0.0.3 patch configurations beside signed-in stock Instagram on Threads 449. Both full bundles also passed with Instagram absent. The guide records the two save-login prompts. Continue as wasn't offered, and the reported password failure remains unresolved.

## 0.0.2 (2026-09-29)

The first release, with 6 patches for Threads 449.0.0.54.82.

* **Threads:** Hide ads takes sponsored posts out of each page of the feed before Threads caches or shows it. Whether a post is an ad is Threads' own answer, read from the "injected" block the server puts on sponsored posts.
* **Threads:** Sanitize sharing links takes `xmt`, `slof`, `igsh`, `igshid`, `igsi` and `fbclid` off the links Threads hands out for a post, at the one place every Copy link and share gets its link from.
* **Threads:** Disable analytics points Threads' event log uploads at a port on the phone that nothing listens on, from all three places the app builds that address.
* **Threads:** Remove the advertising ID takes the advertising ID permission out of the manifest, so Google Play services gives Threads zeros.
* **Threads:** Restore screens on re-signed builds answers Threads' own signer check with Meta's certificate, and trusts an Instagram signed with the same key.
* **Threads:** HushThreads settings opens from a launcher shortcut or from Additional settings in the app on Threads' App info page, with pause, safe mode, settings backups, diagnostics and the licences.
* **Threads:** Sign in with your Instagram username and password. Continue as the Instagram account already on your phone doesn't work on a patched Threads yet.
* **Tooling:** The README has the HushThreads logo and a banner in the Hush family's blue and navy look.
