![HushThreads. Keep the thread. Cut the noise.](assets/readme-hero.png)

<p align="center">
  <a href="https://github.com/SysAdminDoc/HushThreads"><img src="https://img.shields.io/badge/version-0.0.13-000000" alt="Version 0.0.13"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL--3.0-blue" alt="License GPL-3.0"></a>
  <img src="https://img.shields.io/badge/platform-Android%209%2B-3DDC84" alt="Platform Android 9+">
  <img src="https://img.shields.io/badge/Threads-450.0.0.51.78-000000" alt="Threads 450.0.0.51.78">
  <img src="https://img.shields.io/badge/for-Morphe%20Manager%201.34.0%2B-8A2BE2" alt="For Morphe Manager 1.34.0 or newer">
</p>

<p align="center">
  <a href="https://ko-fi.com/X8K126YVER">
    <img height="42" src="https://storage.ko-fi.com/cdn/kofi2.png?v=3" alt="Buy me a coffee on Ko-fi" />
  </a>
</p>

<p align="center">
  <sub><em>If HushThreads makes Threads better for you, a coffee helps me keep testing patches and maintaining them as Threads changes.</em></sub>
</p>

# <img src="assets/icon.png" width="36" alt=""> HushThreads

HushThreads is a Morphe patch bundle for Android that takes the ads out of Threads, cleans the links you share and cuts down what the app reports back to Meta.

The latest release is [v0.0.13](https://github.com/SysAdminDoc/HushThreads/releases/tag/v0.0.13), with 18 patches.

[Add to Morphe](https://morphe.software/add-source?github=SysAdminDoc%2FHushThreads) | [Download a release](https://github.com/SysAdminDoc/HushThreads/releases/latest) | [Browse the patches](#patches)

## Why use it

- **A feed without ads.** Sponsored posts come out of each page of the feed as it arrives, before Threads saves or shows it.
- **Shared links with fewer tags.** Tracking parameters such as xmt come off shared post links. A short `/share/` link is made fresh for every share and stands for that share's xmt token, so HushThreads hands out the post's own link (`threads.com/@name/post/code`) in its place wherever Threads hands one out. That's Copy link, More and another app's button in the share sheet, and also sending a post in a chat, to a WhatsApp status or quick send, or to an Instagram story.
- **Links open in your browser.** A web link you tap in a post opens in your default browser, or in the app Android picks for that site, instead of Threads' own browser. When Threads wraps the link in its click tracker (`l.threads.com`), the real address is read out of it on the phone, so the tracker isn't asked. Threads, Instagram and other Meta pages still open in Threads, and so do links in the photo viewer and in ads.
- **Less sent home.** Matched analytics upload addresses go nowhere, and Threads gets zeros instead of your phone's advertising ID. Other telemetry may remain.
- **Controls that recover.** Every runtime feature has a switch, and a pause, an automatic safe mode, settings backups and privacy-filtered diagnostics help when Threads changes.

HushThreads is the Threads member of a small family of patch bundles. Its settings screen, diagnostics and release checks come from its Facebook sibling, [Hushfacebook](https://github.com/SysAdminDoc/Hushfacebook). The Threads patches are written here. See [Where the patches come from](#where-the-patches-come-from).

This project has no connection to Meta or to the Morphe project. Neither endorses it, and neither wrote it.

## Install

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager) 1.34.0 or newer.
2. Add HushThreads as a patch source: https://morphe.software/add-source?github=SysAdminDoc%2FHushThreads
3. Get Threads 450.0.0.51.78 (`com.instagram.barcelona`) for arm64-v8a, version code 512008342 (240-480dpi, Android 9+). That's the build the patches are checked against. If you're on an older Threads, update it to 450 before you patch.
4. In Morphe Manager, pick that file and patch. Manager's default selection holds every patch but the three the [Patches](#patches) section names, so you don't need Expert mode. The patches that used to be opt-in, such as `Disable video autoplay` and `Pure black dark mode`, start with their switches off until you turn them on in [HushThreads settings](#settings).
5. To change the selection, or to add `Change version code`, `Remove share targets` or `Trust user-added certificates`, turn on **Settings → Advanced → Expert mode** in Manager before you pick the file. If you saved a selection of your own in Expert mode before, Manager may keep using it, so look over the HushThreads list once for the patches that joined the default selection.

HushThreads v0.0.13 patches Threads 450 only. Each release moves to the newest stable Threads and drops the one before. If you're staying on 449.0.0.54.82 or 448.0.0.54.85 for now, v0.0.12 is the last release that patches them.

| Threads version | Version code | Android floor |
|---|---|---|
| 450.0.0.51.78 | 512008342 (240-480dpi) | Android 9 |

<p><img src="assets/patch-selection.png" width="300" alt="Morphe Manager with the six HushThreads patches selected and Morphe's own patches left off"></p>

Threads releases a new version about once a week, and each one renames most of its code. Every patch here finds what it changes by names Threads keeps (its post model, the feed cache, JSON parser names, strings and manifest components) rather than by the names that change. When one can't find what it needs, patching stops with a message naming it, instead of producing an app that quietly does nothing. Disable analytics checks three address kinds: PIGEON (the logger's URL builder), DEFAULT (direct event-log URL returns) and MQTT (the analytics endpoint setting). It stops when none match. The patch log, Privacy settings and exported diagnostics identify matched and missing kinds. Every declared build matches all three. This doesn't establish that every telemetry path is covered.

Hide ads, Hide suggested users and Sanitize sharing links also stop on competing inner targets. The failure lists the candidates so a changed build can be checked before installing it.

## Keep your signing key

Morphe Manager signs the patched Threads with a key it makes on your phone. Standard and Shizuku installs use that re-signed APK. Android installs an update over your patched Threads only when the update carries that same key, so the key is what lets you update without losing Threads' data.

- **Back it up right after your first patch.** In Morphe Manager, open Settings, then System, then Import & export, then Signing key, and tap Export. Keep the `Morphe.keystore` file somewhere private, because anyone who has it can sign an APK your phone will accept as an update.
- **On a new phone, import it before you patch anything.** Reinstalling Morphe Manager or clearing its storage makes a new key, and without your exported copy nothing you patched earlier can be updated in place.
- **A different key means starting over.** Android refuses an update signed with another key, so the only way forward is to uninstall the patched Threads and sign in again.

The same goes for the Threads you have now. A patched Threads can't install over the stock app, so uninstall the stock Threads first.

## Patches

HushThreads v0.0.13 has 18 patches. Morphe Manager's default selection has every patch but three: `Change version code`, `Remove share targets` and `Trust user-added certificates`. Change version code changes the version Android sees, so going back to stock Threads means uninstalling. The other two change Threads when you patch and have no switch to undo it. Turn on Expert mode in Manager to pick them.

Nothing else needs Expert mode. `Block background-return feed refresh`, `Disable screenshot detection`, `Disable video autoplay`, `Max image quality` and `Pure black dark mode` used to be opt-in. They're in every build now with their switches off, so a fresh patch looks like the Threads you know until you turn them on in HushThreads settings. Each row below says where a patch's switch is and how it starts. In Expert mode the patches sit in groups named for what they touch, like Feed, Privacy and Downloads.

Updating from v0.0.12 or older? If you'd picked one of those five before and never changed its switch, the switch now starts off, so turn it back on in HushThreads settings after you update. The [changelog](CHANGELOG.md) names each one.

| Patch | What it does |
|---|---|
| `Block background-return feed refresh` | Keeps your place in your feed when you leave Threads and come back within ten minutes. Pulling down to refresh still loads new posts. Good if you hate losing the post you were reading. Starts off. Turn it on in HushThreads settings > Feed. |
| `Change version code` | Raises the version number as high as Android allows, so Google Play won't offer Meta's updates over it. Going back to stock Threads means uninstalling, which deletes its data. It isn't selected by default. Works as soon as you patch it in, with no switch. |
| `Disable analytics` | Stops Threads from sending most of its usage reports to Meta. A few may still get through. Good if you'd rather share less about how you use the app. On by default. Turn it off in HushThreads settings > Privacy. |
| `Disable screenshot detection` | Threads isn't told when you take a screenshot. It stops watching your photos for new screenshots. Good if you want to screenshot without Threads noticing. Starts off. Turn it on in HushThreads settings > Privacy. |
| `Disable video autoplay` | Videos in your feed wait for a tap instead of playing as you scroll. Good for a calmer feed and less data use. Starts off. Turn it on in HushThreads settings > Feed. |
| `Hide ads` | Removes sponsored posts from your feed before Threads shows them, so they leave no gap. Good for a cleaner feed. On by default. Turn it off in HushThreads settings > Feed. |
| `Hide suggested users` | Removes the cards that suggest accounts to follow, in your feed and on profiles. Normal posts and reposts stay, and so does the rest of a profile. Good if you only want posts in your feed. On by default. Turn it off in HushThreads settings > Feed. |
| `Hide the Instagram button` | Takes the Instagram button off the top of profiles, yours and other people's. The other buttons stay. Good for a tidier profile. Starts off. Turn it on in HushThreads settings > More settings > Appearance. |
| `HushThreads settings` | Adds a HushThreads page to Threads where you turn features on or off, pause HushThreads, back up your settings and read the licenses. Open it from Threads' own settings. Works as soon as you patch it in, with no switch. |
| `Max image quality` | Loads photos at the largest size Threads has, instead of one picked for your screen. Photos look sharper but use more data. Starts off. Turn it on in HushThreads settings > Feed. |
| `Open links in browser` | Opens links you tap in your regular browser instead of inside Threads, and skips Threads' link tracking. Threads, Instagram and other Meta pages still open in Threads. On by default. Turn it off in HushThreads settings > Privacy. |
| `Pure black dark mode` | Makes Threads' dark mode truly black instead of dark gray behind your feed and posts. It looks deeper and can save battery on OLED screens. Starts off. Turn it on in HushThreads settings > More settings > Appearance. |
| `Remove share targets` | Takes Threads out of the share menu in other apps, so it isn't offered when you share a link, photo or video. Sharing from Threads still works. It isn't selected by default. Works as soon as you patch it in, with no switch. |
| `Remove the advertising ID` | Stops Threads from reading your phone's advertising ID. It gets a string of zeros instead. Good for making your phone harder to track across apps. Works as soon as you patch it in, with no switch. |
| `Restore screens on re-signed builds` | Fixes Threads screens that fail on a patched app because they check who signed it. Also lets Threads share sign-in with an Instagram signed with this build's key. Works as soon as you patch it in, with no switch. |
| `Sanitize sharing links` | Removes tracking tags from links you copy or share from Threads, and turns short share links into the post's own link. The link still opens the same post. On by default. Turn it off in HushThreads settings > Privacy. |
| `Save photos and videos` | Adds Save to a post's menu, below Copy link. It saves the photo or video to your gallery, every page of a carousel too. Good for keeping posts you like. On by default. Turn it off in HushThreads settings > Downloads. |
| `Trust user-added certificates` | Lets Threads accept security certificates you installed yourself, such as for a work network or a debugging proxy. Meta's own checks stay, so a proxy can't read most traffic. It isn't selected by default. Works as soon as you patch it in, with no switch. |

The feed controls share one page filter. Each selected rule has its own switch and removal count. Diagnostics also count the pages and items each enabled rule finished checking, including pages without matches. Disabled, paused and failed checks don't add to those counts. These are page checks, so checking the same page again adds another check. Pause restores the original page, and a failed card check keeps the whole page. Hide suggested users passes fixture checks on Threads 450. A Galaxy S23 Ultra report confirmed the Suggested Users block no longer appeared in Threads 449 with HushThreads 0.0.4.

Block background-return feed refresh answers the four checks Threads makes as it comes back: the background refresh of For you, the reset to the main feed after a long absence, the feed's own reload and scroll to the top, and the swap to posts it fetched while you were away. The first check after you come back decides, and every other check within ten seconds gets the same answer. Its hooks pass fixture checks on Threads 450. On a Galaxy S22 with Threads 449, five minutes away kept the same posts on screen, while the same trip with the switch off reloaded the feed. Pull to refresh still loaded new posts, and eleven minutes away let Threads refresh as usual.

Disable video autoplay holds the video that a post in your feed, a profile or a thread would start as you scroll. It stays on its cover frame until you tap it, and the full-screen viewer that opens plays it with its usual controls. Ad cards and trend previews still play as Threads decides, and so do Instagram videos shown inside a post. Threads may still load a video ahead of time. Its hook passes fixture checks on Threads 450. On an Android 16 emulator with Threads 449, feed videos stayed still with the switch on and played as usual with it off, and a tapped video played in the viewer. It hasn't been tried on a phone yet.

Pure black dark mode changes the #101010 gray that Threads' theme uses for the feed, posts and profiles to #000000. Raised surfaces such as cards, menus and sheets keep their own grays, so they still stand out. You'll only see it with dark mode on. The switch is on the Appearance page under More settings and starts off, and a change takes effect the next time Threads starts. Pause and safe mode give Threads its gray back. Its hooks pass fixture checks on Threads 450. On a Galaxy S22 with Threads 449, the feed drew on #000000 with the switch on, and on #101010 after turning it off and restarting. An Android 16 emulator showed the same for a post and a profile, and with HushThreads paused.

Trust user-added certificates edits the network security config Threads names, fb_network_security_config on 450. Your own certificates join the system ones in its base settings, and they're let past the pins that file sets for Meta's domains, since those pins would turn them away otherwise. Debug overrides, which only a debuggable build reads, stay as they are. The edit passes fixture checks on 450 and hasn't been tried on a device yet.

Here's what that reaches, from reading Threads 450's code. Anything that uses Android's standard certificate check honors the edited file. Threads sends its own traffic through Meta's network stack, which runs that standard check first, so your certificate gets past it. Then, for the connections the stack pins, it also wants one of 18 Meta keys built into the app somewhere in the chain, a rule written to stay on until about September 30, 2027. A chain from your own certificate doesn't have one, so it's turned away there. Which connections the native side pins hasn't been traced yet. The stack can fall back to your certificates, but only when Meta's internal debug setting for that is on, and public builds have no way to turn it on. This patch leaves that alone. The stack's fallback Java client pins instagram.com addresses with a list of its own, and crash report uploads check the same 18 keys.

## Settings

In Threads, open your profile, tap the settings button at the top and tap HushThreads, just above More settings. You can also long-press the Threads icon and tap HushThreads, or open Threads' App info page and tap Additional settings in the app, which Samsung phones call Configure in Threads.

The row in Threads' settings grows with large text, and TalkBack reads it out and opens it with a double tap. That was checked on Threads 449 and 448 on Android 16.

<p><img src="assets/settings-overview.png" width="320" alt="HushThreads settings with search, Pause and the Feed and Privacy pages"><img src="assets/settings-privacy.png" width="320" alt="Privacy preview with clean shared links, analytics uploads and all three address kinds matched"></p>
<p><img src="assets/launcher-shortcut.png" width="320" alt="The HushThreads shortcut on Threads' launcher icon"></p>

If Threads crashes within a minute of starting three times in a row, HushThreads pauses itself from the next start and says why at the top of its settings. Your switches stay saved. Tap Resume and restart Threads to turn it back on. A force-stop doesn't count as a crash. On Android 9 and 10 only ordinary crashes count. Android 11 and later also count crashes in Threads' native code and freezes that Android reports as not responding. This was checked on a Galaxy S22 with Threads 449.

Threads has crash protection of its own. Five crashes within 45 seconds of starting, inside four hours, make it delete its data, which signs you out and clears HushThreads' settings. Safe mode steps in after three crashes in a row, so it gets there first whenever a switch can stop the crash. It can't help when the crash comes from Remove the advertising ID, Remove share targets, Restore screens on re-signed builds, Trust user-added certificates or Change version code, because those are set when you patch, and it doesn't see crashes spread out between starts that work. If Threads keeps crashing, patch again without them.

Diagnostics list hook calls separately from removed feed items, shared links that changed and links sent to your browser. Unchanged, disabled, paused or failed operations add no removal or change count. Reports keep these totals without saving the posts or URLs.

Reports name the HushThreads bundle and include the installed app's current certificate SHA-256 hashes. They distinguish known Meta Threads certificates, other current certificates and multiple signers. Available installer, initiator and originating package names help compare installations. Android 9 provides only the installer name. Missing or unreadable facts say unknown. These names don't prove Shizuku, Root Mount or a work profile, so include your Manager version and installation method when reporting a problem. No certificate contents, signing keys or other apps' details are exported.

## Signing in

Tap Log in with Instagram and enter your Instagram username and password. That reached a live feed on Threads 449.0.0.54.82 with every patch combination tested, on Android 16 next to a signed-in stock Instagram and on Android 17 with no Instagram installed. The Android 17 checks used the same install settings Morphe Manager's Shizuku mode uses. On Threads 448.0.0.54.85 it reached the feed on Android 16 with no Instagram installed, both with only the settings patch and with all 11.

Threads can show Save your login info twice. Tap Not now on each prompt if you don't want to save it.

If you also patch Instagram with [HushGram](https://github.com/SysAdminDoc/HushGram), use the same Morphe Manager signing key for both. Threads then shows your Instagram account as a tile on its login screen, and tapping it signs you in without typing your password. That was checked on Android 17 with Threads 449 and HushGram 0.0.4, and on Android 16 with Threads 448 and HushGram 0.0.5.

With a Root Mount install you can sign in on stock Threads first. The mounted build uses stock Threads' data, so it keeps that session, and signing out and back in on it works too.

Updating between Threads 448.0.0.54.85 and 449.0.0.54.82 with the same signing key keeps you signed in, and your switches stay as you set them. The same goes for repatching one version with more patches selected.

If Threads says your password is wrong when you know it's right, reset your Instagram password and sign in with the new one. That fixed it for the person who reported it in [issue #3](https://github.com/SysAdminDoc/HushThreads/issues/3). If it still fails, [open an issue](https://github.com/SysAdminDoc/HushThreads/issues/new/choose) with a diagnostic report from HushThreads' settings, your phone and Android version, and how you installed it.

## Your Threads account

**Can Meta tell?** Assume it can. A patched Threads is signed with your key rather than Meta's, and Threads' own code checks that signature in places, which is why `Restore screens on re-signed builds` exists. `Disable analytics` prevents uploads through matched address paths, and Meta could notice those missing events too.

**What stays the same?** Your feed still comes from Meta's servers, ads included, and HushThreads takes the ads out on your phone after they arrive. It doesn't post, like, follow or message on your behalf, and it doesn't change how you sign in.

**Could my account be suspended?** Nobody can promise it won't be. Meta's terms ask for its permission before anyone modifies its apps. We haven't heard of an account suspended over a patched Threads, but this is a young project, so that doesn't prove much. If you'd rather not risk the account you care about, try HushThreads with a test account first.

## Privacy

HushThreads doesn't collect anything and has no server. The patched app goes online on HushThreads' behalf for two things only. One is a save you ask for: tap Save in a post's menu and HushThreads fetches that post's photos or videos over HTTPS from Meta's media servers (`cdninstagram.com`, `fbcdn.net` and `fbsbx.com`), where Threads loads them from too. Every address is checked before anything is fetched, and an address anywhere else is refused. The other is the release check, and it's off until you turn it on. Once it's on, HushThreads asks `api.github.com` for its latest release at most once a day, when Threads starts, and again whenever you tap Check now. That's an HTTPS request with `HushThreads/<version>` as its User-Agent, and it carries no cookies and nothing about you or your phone. Its separate connection leaves Threads' shared cookies untouched and discards any response cookies. Wire checks on native Android 9 and 17 verified those headers and preserved the shared store through successful and failed requests. It only follows a redirect that stays on api.github.com, and it reads at most 256 KB of the answer. The whole check has a 20-second deadline, including name resolution and the TLS handshake. GitHub sees your IP address, as any site you visit does. From the answer, HushThreads keeps the version number and, if the notes name one, the Threads version the release targets. Nothing else is kept.

The About and Licenses screens link to `github.com`, `gitlab.com` and `www.gnu.org`. Those open in your browser, and only when you tap one.

`Open links in browser` hands a tapped web link to Android as an ordinary link, the way any app does, so your default browser or the site's own app opens it. When Threads wrapped the link in its click tracker (`l.threads.com`, `l.instagram.com`, or a `/linkshim` page), HushThreads reads the real address out of it on the phone and sends only that, with tracking tags such as `fbclid` removed. Links to Threads, Instagram, Facebook, Messenger and Meta stay in Threads' own browser, because sign-in, security checks and Accounts Center need its session. If nothing on the phone can open a web link, the link stays in Threads too. A few places open Threads' browser without the step HushThreads answers, so their links still open in Threads: the photo and video viewer, a link followed inside Threads' full-screen browser, an ad's button and an ad's sign-up form.

`Disable analytics` replaces matched Pigeon, default event-log and MQTT analytics addresses with `127.0.0.1`, on a port nothing listens on. Those uploads fail locally. Missing address kinds and other telemetry aren't covered by this claim. Turning the switch off, Pause or safe mode restores the original addresses.

`Disable screenshot detection` keeps Threads from noticing your screenshots. Threads watches your photo library for new pictures named like screenshots (or, on some phones, the screenshot folders themselves), and on Android 14 and newer it also asks Android to tell it about screenshots of the feed. With the switch on, both watchers stop before they look at the picture and Threads' request to Android isn't made. Your screenshots are saved as usual. Turning the switch off or pausing HushThreads brings back Threads' own behavior. The in-app browser's screenshot report, used only for ads, isn't changed.

On 2026-10-02, repeated enabled, off and paused feed sessions on Android 16 and Threads 449 showed failed local connections only when blocking was enabled. Short worker traces found no sustained analytics CPU retry storm. This doesn't establish long-term battery cost or queue behavior, so the interception stays unchanged.

## Where the patches come from

HushThreads' build, settings, diagnostics and safety checks came from [Hushfacebook](https://github.com/SysAdminDoc/Hushfacebook) at `c15d4f79`. That code carries the notices from [Hushfeed](https://github.com/SysAdminDoc/hushfeed), [Andrew Liang's patches](https://github.com/andrewliang25/morphe-patches), [FroggoMorphePatches](https://github.com/SapitoSucio/FroggoMorphePatches) and the Morphe/ReVanced chain recorded in [NOTICE](NOTICE) and [provenance.json](provenance.json).

`scripts/upstream-drift.ps1` lists the ported files Hushfacebook has changed since that commit. It reads only the upstream's file tree and exits 1 when something changed. Each change still gets reviewed before any of it is brought over.

[sources/threads-sources.json](sources/threads-sources.json) records 12 external sources across seven lineages, with forks and file mirrors grouped under their origins. Branch pins follow commits touching watched paths; separate head fields record inspected branch tips. No external Threads code is adopted. Hide ads uses the feed-cache merge location identified by zeldrisho, with an implementation written here.

| Source | What we found |
|---|---|
| [ReVanced](https://gitlab.com/ReVanced/revanced-patches) and [Aunali321/ReVancedExperiments](https://github.com/Aunali321/ReVancedExperiments) | GPL candidates for ad filtering. |
| [chiggi_morphe_patches](https://github.com/durgesh0505/chiggi_morphe_patches) and [zeldrisho/morphe-patches](https://github.com/zeldrisho/morphe-patches) | GPL candidates with ad filtering, AD_ID permission removal and app/package renaming. |
| [MrxSiN/ThreadsHideAds](https://github.com/MrxSiN/ThreadsHideAds) | GPL candidate using modern Xposed, DexKit and a compiled filtering policy. |
| [NexAlloy](https://github.com/NexAlloy/NexAlloy) and [joel122002/ReVancedXposed](https://github.com/joel122002/ReVancedXposed) | GPL candidates for Xposed ad filtering. |
| [kareemlukitomo/morphe-patches](https://github.com/kareemlukitomo/morphe-patches) | GPL candidate that changes the Threads share domain. |
| [chirag127/morphe-patches](https://github.com/chirag127/morphe-patches) | Rejected. Its Threads patches are stubs. |
| [revanced-troubleshooting-guide](https://github.com/SodaWithoutSparkles/revanced-troubleshooting-guide) | Rejected. It stores catalogs without an independent patch body. |
| [yt-revanced-icon](https://github.com/kairusds/yt-revanced-icon) and [rvmm-config-gen](https://github.com/user2user1/rvmm-config-gen) | Catalogs recorded as behavior-only. The former lacks a license. The latter uses AGPL-3.0, outside the ledger's accepted license list. |

The census is dated 2026-10-07. Every repository entry and all five discovery indexes were checked that day, and all five list HushThreads. GitLab code search wasn't run, though the GitLab sources in the ledger were read.

Keep copyright, author, license and source notices when editing or moving files. Remove a notice only when its covered code is gone. Carry the GPL section 7 notices in NOTICE and make them available to users. Keep blocked original source URLs in notices, with a working GitLab mirror beside them.

Copied code keeps its headers and gets a `Forked from` line naming the repository and commit. Every shipped file needs one applicable provenance rule, its license and matching header links. A file rule takes precedence over a folder rule. Code written here must not claim an upstream origin. `ProvenanceTest` checks these requirements.

Before external code ships, mark its source adopted with the exact commit, compatible license URL/hash, NOTICE entry and provenance rule. A release receipt must prove patching on at least two real Threads fixtures and every declared build. Missing or incompatible licenses, and code derived from them, remain behavior-only. Mirrors inherit the original's disposition. Use the original repository URL and commit in notices and provenance.

## Building and checking

Use JDK 21, the Android SDK and PowerShell 7.5 or newer (Windows PowerShell 5.1 also works). Set `JAVA_HOME` and `ANDROID_HOME`, or configure the SDK in `local.properties`. GitHub Packages requires `GITHUB_ACTOR` and `GITHUB_TOKEN` with `read:packages`.

Declared arm64 build: 450.0.0.51.78 / 512008342. Only the newest stable Threads is declared.

For app internals and stable patch anchors, see [Threads app reference](docs/threads-app-reference.md). The [runtime audit](docs/threads-runtime-audit.md) records stock screens, network observations, and measurement limits. For the patch workflow, see [Patch authoring guide](docs/patch-authoring.md).

```powershell
$env:HUSHTHREADS_FIXTURE_DIR = '<fixture folder>'
$env:HUSHTHREADS_DESKTOP_JAR = '<Morphe desktop JAR>'
./gradlew.bat prepareAdvisoryTool
./gradlew.bat :patches:generatePatchesList
./gradlew.bat :patches:buildAndroid
./gradlew.bat :patches:test :extensions:threads:testDebugUnitTest
./gradlew.bat :extensions:threads:lintRelease :extensions:shared:library:lintRelease
./scripts/verify-all-patches.ps1 -Apk '<Threads bundle>' -DesktopJar '<Morphe desktop JAR>' -WorkDir '<scratch folder>'
```

Generate the patch list before building. The bundle, SHA-256 and CycloneDX SBOM land in `patches/build/release`. Tests rebuild the jar in `patches/build/libs`. Keep private fixtures outside tracked files. Without `HUSHTHREADS_FIXTURE_DIR`, real-build tests skip. Those tests are the ones whose source calls `Fixtures` or `FixtureDex`, and they run in their own task, `:patches:fixtureTest`, which `:patches:test` runs first. Add `-x :patches:fixtureTest -x :patches:verifyPatchTestSelection` for a quick pass without them.

Run verification on every retained build. It checks every selected patch, approved manifest changes, merged stock resources and injected DEX structure and feature contracts. Split merges use private input directories. Concurrent runs need separate outputs. Plain APKs are used directly.

Run `scripts/build-release-receipt.ps1` and `scripts/validate-release-facts.ps1` after the tests, lints and fixture verification. To patch each fixture once rather than twice, give `verify-all-patches.ps1` `-KeepIn patches/build/fixture-apply/<fixture file>` and the receipt script `-AppliedDir patches/build/fixture-apply`. A kept run carries a stamp naming the bundle, APK, patch list and CLI it used, and the receipt reads it only when all four still match. OSV checks every bundled library. HIGH/CRITICAL labels, CVSS 3 scores of 7.0 or higher, and unrated advisories stop release. Both advisory-wide vectors and ratings for the queried package and version count. Listed versions and ECOSYSTEM ranges form a union, with Maven ordering for range boundaries. Unrelated packages and known nonmatching versions don't contribute ratings.

Unsupported or malformed data stays held for review. That includes invalid field types, unreadable ranges and CVSS 4 vectors beside a lower supported rating. The gate doesn't score CVSS 4 as CVSS 3. Exceptions in `scripts/advisory-exceptions.txt` need a package, advisory, reason and expiry within 90 days. Expired or unmatched exceptions fail.

Query responses must contain readable advisory IDs, aliases and page tokens. Withdrawals require valid UTC timestamps. Malformed withdrawals stop the check instead of discarding the advisory. UTF-8 text and timestamp-shaped strings keep their original values during parsing.

`prepareAdvisoryTool` resolves a pinned, hash-verified Maven comparator for these checks. The bundle build and push hook also prepare it. It's a build tool and isn't carried in the bundle or its SBOM.

Run `scripts/audit-threads-sources.ps1` when sources change. It stamps a clean census. Releases require a census no more than 14 days old. `scripts/test-threads-sources.ps1` checks the ledger and source documentation.

`scripts/install-hooks.ps1` installs the push checks. When a push changes code, the hook runs Gradle twice. A quick pass without the fixture tests goes first, so a slip there stops the push in minutes, and the full run follows. `HUSHTHREADS_WORKDIR` or `build/morphe-tools` can locate the desktop JAR. `HUSHTHREADS_BUILD_WRAPPER` optionally runs Gradle as `<wrapper> -ProjectDir <repository> -Tasks <task>...`.

A release runs in five stages, one command each, from a clean checkout of main:

```powershell
./scripts/release/release.ps1 -Stage prepare -Version <version>
./scripts/release/release.ps1 -Stage preflight -Version <version>
./scripts/release/release.ps1 -Stage build -Version <version>
./scripts/release/release.ps1 -Stage publish -Version <version> -Intro <intro file> -Update <update steps file>
./scripts/release/release.ps1 -Stage index -Version <version> -Summary <summary file>
```

`prepare` dates the CHANGELOG's Unreleased section, moves the version strings, regenerates the patch list and rewrites the README's latest-release line. Review that diff, fix any prose that still names the previous release, and commit it yourself. `preflight` runs the quick checks on that commit in about five minutes, then pushes it, so the push gate runs everything on it. `build` reruns the tests from the pushed commit and builds the bundle. It patches each declared Threads build in `HUSHTHREADS_FIXTURE_DIR` once, writes the receipt from those runs and leaves the four release assets with their checksums in `build/release-assets/<version>`. The tag comes last, so a failed build never leaves one behind. `publish` creates the GitHub release with every CHANGELOG bullet in its notes and downloads each asset back to compare it. Only then does it update the repository description. `index` points `patches-bundle.json` and the bug report form at the new release, checks the release facts against the published assets, and commits and pushes that.

Each stage won't start until the one before it has finished. A stage that stopped part way can be run again once the problem is fixed, and it checks what it already did rather than doing it twice. The text edits live in `scripts/release/release_text.py`, with its tests beside it. Set `HUSHTHREADS_PYTHON` when `py` or `python` isn't the Python 3 to use.

Device scripts require `HUSHTHREADS_DEVICE_SERIAL` and an exclusive lease. Set `HUSHTHREADS_DEVICE_LEASE_DIR`, `HUSHTHREADS_DEVICE_LEASE_TOKEN` and `HUSHTHREADS_DEVICE_IDENTITY`. Release the lease after testing. Signing conflicts require the installed key. Replacement installs are refused to preserve apps and accounts.

Local APK verification inspects every ELF's load segments and checks uncompressed native ZIP entries with the SDK's 16 KB alignment check. ZIP alignment determines load compatibility when Android loads libraries directly from the APK. Extracted libraries still have their ZIP verdict recorded. Builds remove stale ZIP alignment declarations, align the unsigned APK, then sign and check the final APK. No native payload is rewritten. Receipts separate unchanged vendor ELF incompatibilities from packaging defects. These static checks don't establish runtime support on a 16 KB-page device.

`scripts/patch-for-device.ps1` reads existing BKS, JKS and PKCS12 keys without converting them. `HUSHTHREADS_SIDELOAD_KEYSTORE_PASSWORD` supplies the store password. An explicitly empty value in PowerShell 7 selects an unprotected store. Set `HUSHTHREADS_SIDELOAD_KEY_PASSWORD` when the private entry uses a different password. Both travel through the process environment. The documented local test-key fallback applies only when the store password variable is unset.

## Reporting a problem

Use [Issues](https://github.com/SysAdminDoc/HushThreads/issues) for bugs and [Discussions](https://github.com/SysAdminDoc/HushThreads/discussions) for questions. Include the Threads version, version code and ABI, Morphe Manager and HushThreads versions, selected patches, reproduction steps and expected/actual behavior. Attach diagnostics or relevant screenshots after removing private messages and account details. Reports stay open until you or another user confirms the fix works.

HushThreads redacts filesystem paths from exported events and saved crashes, including paths with spaces and escaped forms. Stack-trace filenames and current signing-certificate hashes remain available for troubleshooting. Review an export before sharing it.

The settings overview shows which default patches were left out of your build. Reports also include Android's selections for the app's declared web domains. Android 9 through 11 explicitly report that this platform detail isn't available.

HushThreads shows the bundle's payload hash and source state in the overview. About and both report exports include the full source record. The identity covers the packaged code and extension bytes. Repacking identical contents keeps it stable. Changed or damaged contents can't retain the old identity. Source metadata distinguishes a clean commit, modified inputs and an archive with unknown source. This checks consistency, not the publisher's signature.

## When Threads updates

Retain the new stable arm64 bundle and verify its identity and publisher signatures. Explore an undeclared build with:

```powershell
./scripts/verify-all-patches.ps1 -Apk '<new bundle>' -Force -DesktopJar '<Morphe desktop JAR>' -WorkDir '<scratch folder>'
./scripts/fingerprint-candidates.ps1 -OldApk '<old bundle>' -Method '<method descriptor>' -NewApk '<new bundle>'
```

Candidate ranking suggests methods to inspect. It changes nothing. Fix anchors and inner-target guards against the new and declared builds. Use kept names, strings, Pando fields or method shapes. `ObfuscatedIdentityTest` rejects hardcoded obfuscated identities.

Before declaring support, check every selected patch, settings, login and live feeds on the new and declared builds. Record the exact version name and arm64 version code in `AppCompatibilities.kt` in place of the build before it, since only the newest stable Threads is declared, then regenerate, rebuild and rerun the real-fixture checks and verification without `-Force` on every retained build.

## License

[GPL-3.0](LICENSE), with the Morphe section 7 notices carried in [NOTICE](NOTICE). Threads, Instagram and Meta are trademarks of Meta Platforms, Inc.
