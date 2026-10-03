![HushThreads. Keep the thread. Cut the noise.](assets/readme-hero.png)

<p align="center">
  <a href="https://github.com/SysAdminDoc/HushThreads/releases"><img src="https://img.shields.io/badge/version-0.0.4-000000" alt="Version 0.0.4"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL--3.0-blue" alt="License GPL-3.0"></a>
  <img src="https://img.shields.io/badge/platform-Android%209%2B-3DDC84" alt="Platform Android 9+">
  <img src="https://img.shields.io/badge/Threads-449.0.0.54.82-000000" alt="Threads 449.0.0.54.82">
  <img src="https://img.shields.io/badge/for-Morphe%20Manager%201.32.0%2B-8A2BE2" alt="For Morphe Manager 1.32.0 or newer">
</p>

# <img src="assets/icon.png" width="36" alt=""> HushThreads

HushThreads is a Morphe patch bundle for Android that takes the ads out of Threads, cleans the links you share and cuts down what the app reports back to Meta.

The latest release is [v0.0.4](https://github.com/SysAdminDoc/HushThreads/releases/tag/v0.0.4), with 10 patches.

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

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager) 1.32.0 or newer.
2. Add HushThreads as a patch source: https://morphe.software/add-source?github=SysAdminDoc%2FHushThreads
3. Get Threads 449.0.0.54.82 (`com.instagram.barcelona`) for arm64-v8a, version code 511908382 (120-640dpi, Android 9+). That's the build these patches are checked against. Morphe Manager warns about other builds of the same version.
4. In Morphe Manager, pick that file, keep the default patch selection or change it, and patch.

HushThreads v0.0.4 works with both of these arm64-v8a variants.

| Threads version | Version code | Android floor |
|---|---|---|
| 449.0.0.54.82 | 511908382 | Android 9 |
| 448.0.0.54.85 | 511808302 | Android 9 |

<p><img src="assets/patch-selection.png" width="300" alt="Morphe Manager with the six HushThreads patches selected and Morphe's own patches left off"></p>

Threads releases a new version about once a week, and each one renames most of its code. Every patch here finds what it changes by names Threads keeps (its post model, the feed cache, JSON parser names, strings and manifest components) rather than by the names that change. When one can't find what it needs, patching stops with a message naming it, instead of producing an app that quietly does nothing. Disable analytics checks three address kinds: PIGEON (the logger's URL builder), DEFAULT (direct event-log URL returns) and MQTT (the analytics endpoint setting). It stops when none match. The patch log, Privacy settings and exported diagnostics identify matched and missing kinds. Both declared builds match all three. This doesn't establish that every telemetry path is covered.

Hide ads, Hide suggested users and Sanitize sharing links also stop on competing inner targets. The failure lists the candidates so a changed build can be checked before installing it.

## Keep your signing key

Morphe Manager signs the patched Threads with a key it makes on your phone. Android installs an update over your patched Threads only when the update carries that same key, so the key is what lets you update without losing Threads' data.

- **Back it up right after your first patch.** In Morphe Manager, open Settings, then System, then Import & export, then Signing key, and tap Export. Keep the `Morphe.keystore` file somewhere private, because anyone who has it can sign an APK your phone will accept as an update.
- **On a new phone, import it before you patch anything.** Reinstalling Morphe Manager or clearing its storage makes a new key, and without your exported copy nothing you patched earlier can be updated in place.
- **A different key means starting over.** Android refuses an update signed with another key, so the only way forward is to uninstall the patched Threads and sign in again.

The same goes for the Threads you have now. A patched Threads can't install over the stock app, so uninstall the stock Threads first.

## Patches

HushThreads v0.0.4 has 10 patches. All but Block background-return feed refresh and Disable video autoplay are selected by default.

| Patch | What it does |
|---|---|
| `Block background-return feed refresh` | Keeps your place in the feed when you come back to Threads within ten minutes, or after any time away with No time limit on. Pull to refresh and a fresh launch still load new posts. |
| `Disable analytics` | Redirects matched Pigeon, default event-log and MQTT analytics addresses. Settings show which address kinds were patched. Other telemetry may remain. |
| `Disable video autoplay` | Videos in feed posts don't play by themselves as you scroll. Tap one to watch it full screen. |
| `Hide ads` | Takes sponsored posts out of your Threads feed before they're shown. |
| `Hide suggested users` | Removes verified server cards suggesting accounts to follow. Ordinary posts, reposts and unknown card types stay. |
| `HushThreads settings` | Adds HushThreads settings to Threads. Long-press Threads' launcher icon, or open Additional settings in the app on Threads' App info page, to turn features on or off, pause HushThreads, save your switches to a file or load them, and export diagnostics. The licenses are there too. |
| `Open links in browser` | Opens the web links you tap in your default browser instead of Threads' own, without Threads' click tracker. Threads, Instagram and other Meta pages still open in Threads. |
| `Remove the advertising ID` | Stops Threads getting your phone's advertising ID from Google Play services. Threads gets a string of zeros in its place. |
| `Restore screens on re-signed builds` | Lets Threads trust itself again on a re-signed build, the way it trusts its Meta-signed self, and lets an Instagram you patch with this build's own key call into it the same as the real Instagram would. A Root Mount install doesn't need this patch. |
| `Sanitize sharing links` | Takes Threads' tracking tags, such as xmt, off the links you share or copy, and turns a short share link into the post's own link. The post a link opens stays the same. |

The feed controls share one page filter. Each selected rule has its own switch and removal count. Pause restores the original page, and a failed card check keeps the whole page. Hide suggested users passes fixture checks on both source-supported builds. It hasn't been seen taking a real card out of a live feed yet, because the test account wasn't shown any.

Block background-return feed refresh answers the four checks Threads makes as it comes back: the background refresh of For you, the reset to the main feed after a long absence, the feed's own reload and scroll to the top, and the swap to posts it fetched while you were away. The first check after you come back decides, and every other check within ten seconds gets the same answer. Its hooks pass fixture checks on both source-supported builds. On a Galaxy S22 with Threads 449, five minutes away kept the same posts on screen, while the same trip with the switch off reloaded the feed. Pull to refresh still loaded new posts, and eleven minutes away let Threads refresh as usual. The 448 build has only been checked against its code so far.

Disable video autoplay holds the video that a post in your feed, a profile or a thread would start as you scroll. It stays on its cover frame until you tap it, and the full-screen viewer that opens plays it with its usual controls. Ad cards and trend previews still play as Threads decides, and so do Instagram videos shown inside a post. Threads may still load a video ahead of time. Its hook passes fixture checks on both source-supported builds. On an Android 16 emulator with Threads 449, feed videos stayed still with the switch on and played as usual with it off, and a tapped video played in the viewer. It hasn't been tried on a phone or on 448 yet.

## Settings

Long-press the Threads icon and tap HushThreads. You can also open Threads' App info page and tap Additional settings in the app, which Samsung phones call Configure in Threads.

<p><img src="assets/settings-overview.png" width="320" alt="HushThreads settings with search, Pause and the Feed and Privacy pages"><img src="assets/settings-privacy.png" width="320" alt="Privacy preview with clean shared links, analytics uploads and all three address kinds matched"></p>
<p><img src="assets/launcher-shortcut.png" width="320" alt="The HushThreads shortcut on Threads' launcher icon"></p>

If Threads crashes within a minute of starting three times in a row, HushThreads pauses itself from the next start and says why at the top of its settings. Your switches stay saved. Tap Resume and restart Threads to turn it back on. A force-stop doesn't count as a crash. On Android 9 and 10 only ordinary crashes count. Android 11 and later also count crashes in Threads' native code and freezes that Android reports as not responding. This was checked on a Galaxy S22 with Threads 449.

Diagnostics list hook calls separately from removed feed items, shared links that changed and links sent to your browser. Unchanged, disabled, paused or failed operations add no removal or change count. Reports keep these totals without saving the posts or URLs.

## Signing in

Tap Log in with Instagram and enter your Instagram username and password. On 2026-10-01, this reached a live feed for one account on Threads 449.0.0.54.82 with the published 0.0.2 bundle and all six tested source 0.0.3 configurations. The source checks covered settings plus Restore screens, each privacy patch added separately, and the full bundle. These checks ran on Android 16 beside signed-in stock Instagram 449.0.0.52.84.

Stock Threads and the full 0.0.2 and source 0.0.3 bundles also reached the feed through manual sign-in with Instagram absent.

On 2026-10-02, source builds declared both 448.0.0.54.85 and 449.0.0.54.82. Same-key updates between them preserved the signed-in account and switches on Android 16. Settings and live feeds passed on both. This checks a retained session; fresh password entry on 448 wasn't tested.

Threads can show Save your login info twice. Tap Not now on each prompt if you don't want to save it.

Stock Threads recovered that Instagram session automatically after its data was cleared. The patched builds offered the manual form, with no Continue as option. The same-key patched Instagram check on 2026-09-29 also offered only the manual form.

With a Root Mount install you can sign in on stock Threads first. The mounted build uses stock Threads' data, so it keeps that session. On 2026-10-02, on Android 16, a mounted build with only HushThreads settings kept a stock session, and signing out and back in on it reached the feed too.

[The password-login failure reported on 2026-10-01](https://github.com/SysAdminDoc/HushThreads/discussions/2) and [the one on Android 17 with Root Mount](https://github.com/SysAdminDoc/HushThreads/issues/3) remain unresolved. These successful checks haven't identified their cause or established login for every account.

## Your Threads account

**Can Meta tell?** Assume it can. A patched Threads is signed with your key rather than Meta's, and Threads' own code checks that signature in places, which is why `Restore screens on re-signed builds` exists. `Disable analytics` prevents uploads through matched address paths, and Meta could notice those missing events too.

**What stays the same?** Your feed still comes from Meta's servers, ads included, and HushThreads takes the ads out on your phone after they arrive. It doesn't post, like, follow or message on your behalf, and it doesn't change how you sign in.

**Could my account be suspended?** Nobody can promise it won't be. Meta's terms ask for its permission before anyone modifies its apps. We haven't heard of an account suspended over a patched Threads, but this is a young project, so that doesn't prove much. If you'd rather not risk the account you care about, try HushThreads with a test account first.

## Privacy

HushThreads doesn't collect anything and has no server. The patched app goes online on HushThreads' behalf for one thing only: the release check, and it's off until you turn it on. Once it's on, HushThreads asks `api.github.com` for its latest release at most once a day, when Threads starts, and again whenever you tap Check now. That's a plain HTTPS request with `HushThreads/<version>` as its User-Agent, and it carries no cookies and nothing about you or your phone. It only follows a redirect that stays on api.github.com, and it reads at most 256 KB of the answer. GitHub sees your IP address, as any site you visit does. From the answer, HushThreads keeps the version number and, if the notes name one, the Threads version the release targets. Nothing else is kept.

The About and Licenses screens link to `github.com`, `gitlab.com` and `www.gnu.org`. Those open in your browser, and only when you tap one.

`Open links in browser` hands a tapped web link to Android as an ordinary link, the way any app does, so your default browser or the site's own app opens it. When Threads wrapped the link in its click tracker (`l.threads.com`, `l.instagram.com`, or a `/linkshim` page), HushThreads reads the real address out of it on the phone and sends only that, with tracking tags such as `fbclid` removed. Links to Threads, Instagram, Facebook, Messenger and Meta stay in Threads' own browser, because sign-in, security checks and Accounts Center need its session. If nothing on the phone can open a web link, the link stays in Threads too. A few places open Threads' browser without the step HushThreads answers, so their links still open in Threads: the photo and video viewer, a link followed inside Threads' full-screen browser, an ad's button and an ad's sign-up form.

`Disable analytics` replaces matched Pigeon, default event-log and MQTT analytics addresses with `127.0.0.1`, on a port nothing listens on. Those uploads fail locally. Missing address kinds and other telemetry aren't covered by this claim. Turning the switch off, Pause or safe mode restores the original addresses.

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
| [yt-revanced-icon](https://github.com/kairusds/yt-revanced-icon) and [rvmm-config-gen](https://github.com/user2user1/rvmm-config-gen) | Catalogs recorded as behavior-only. The former lacks a license; the latter uses AGPL-3.0, outside the ledger's accepted license list. |

The census remains dated 2026-09-29. Repository entries and all five discovery indexes were checked on 2026-10-02. All five list HushThreads. GitLab code search wasn't run.

Keep copyright, author, license and source notices when editing or moving files. Remove a notice only when its covered code is gone. Carry the GPL section 7 notices in NOTICE and make them available to users. Keep blocked original source URLs in notices, with a working GitLab mirror beside them.

Copied code keeps its headers and gets a `Forked from` line naming the repository and commit. Every shipped file needs one applicable provenance rule, its license and matching header links. A file rule takes precedence over a folder rule. Code written here must not claim an upstream origin. `ProvenanceTest` checks these requirements.

Before external code ships, mark its source adopted with the exact commit, compatible license URL/hash, NOTICE entry and provenance rule. A release receipt must prove patching on at least two real Threads fixtures and every declared build. Missing or incompatible licenses, and code derived from them, remain behavior-only. Mirrors inherit the original's disposition. Use the original repository URL and commit in notices and provenance.

## Building and checking

Use JDK 21, the Android SDK and PowerShell. Set `JAVA_HOME` and `ANDROID_HOME`, or configure the SDK in `local.properties`. GitHub Packages requires `GITHUB_ACTOR` and `GITHUB_TOKEN` with `read:packages`.

Declared arm64 builds: 449.0.0.54.82 / 511908382 and 448.0.0.54.85 / 511808302.

```powershell
$env:HUSHTHREADS_FIXTURE_DIR = '<fixture folder>'
$env:HUSHTHREADS_DESKTOP_JAR = '<Morphe desktop JAR>'
./gradlew.bat :patches:generatePatchesList
./gradlew.bat :patches:buildAndroid
./gradlew.bat :patches:test :extensions:threads:testDebugUnitTest
./gradlew.bat :extensions:threads:lintRelease :extensions:shared:library:lintRelease
./scripts/verify-all-patches.ps1 -Apk '<Threads bundle>' -DesktopJar '<Morphe desktop JAR>' -WorkDir '<scratch folder>'
```

Generate the patch list before building. The bundle, SHA-256 and CycloneDX SBOM land in `patches/build/release`. Tests rebuild the jar in `patches/build/libs`. Keep private fixtures outside tracked files. Without `HUSHTHREADS_FIXTURE_DIR`, real-build tests skip.

Run verification on every retained build. It checks every selected patch, approved manifest changes, merged stock resources and injected DEX structure and feature contracts. Split merges use private input directories. Concurrent runs need separate outputs. Plain APKs are used directly.

Run `scripts/build-release-receipt.ps1` and `scripts/validate-release-facts.ps1` after the tests, lints and fixture verification. OSV checks every bundled library. HIGH/CRITICAL labels, CVSS 3 scores of 7.0 or higher, and unrated advisories stop release. Exceptions in `scripts/advisory-exceptions.txt` need a package, advisory, reason and expiry within 90 days. Expired or unmatched exceptions fail.

Run `scripts/audit-threads-sources.ps1` when sources change. It stamps a clean census. Releases require a census no more than 14 days old. `scripts/test-threads-sources.ps1` checks the ledger and source documentation.

`scripts/install-hooks.ps1` installs the push checks. `HUSHTHREADS_WORKDIR` or `build/morphe-tools` can locate the desktop JAR. `HUSHTHREADS_BUILD_WRAPPER` optionally runs Gradle as `<wrapper> -ProjectDir <repository> -Tasks <task>...`.

Device scripts require `HUSHTHREADS_DEVICE_SERIAL` and an exclusive lease. Set `HUSHTHREADS_DEVICE_LEASE_DIR`, `HUSHTHREADS_DEVICE_LEASE_TOKEN` and `HUSHTHREADS_DEVICE_IDENTITY`. Release the lease after testing. Signing conflicts require the installed key. Replacement installs are refused to preserve apps and accounts.

Local APK verification inspects every ELF's load segments and checks uncompressed native ZIP entries with the SDK's 16 KB alignment check. ZIP alignment determines load compatibility when Android loads libraries directly from the APK; extracted libraries still have their ZIP verdict recorded. Builds remove stale ZIP alignment declarations, align the unsigned APK, then sign and check the final APK. No native payload is rewritten. Receipts separate unchanged vendor ELF incompatibilities from packaging defects. These static checks don't establish runtime support on a 16 KB-page device.

`scripts/patch-for-device.ps1` reads existing BKS, JKS and PKCS12 keys without converting them. `HUSHTHREADS_SIDELOAD_KEYSTORE_PASSWORD` supplies the store password; an explicitly empty value in PowerShell 7 selects an unprotected store. Set `HUSHTHREADS_SIDELOAD_KEY_PASSWORD` when the private entry uses a different password. Both travel through the process environment. The documented local test-key fallback applies only when the store password variable is unset.

## Reporting a problem

Use [Issues](https://github.com/SysAdminDoc/HushThreads/issues) for bugs and [Discussions](https://github.com/SysAdminDoc/HushThreads/discussions) for questions. Include the Threads version, version code and ABI, Morphe Manager and HushThreads versions, selected patches, reproduction steps and expected/actual behavior. Attach diagnostics or relevant screenshots after removing private messages and account details. Reports stay open until you or another user confirms the fix works.

## When Threads updates

Retain the new stable arm64 bundle and verify its identity and publisher signatures. Explore an undeclared build with:

```powershell
./scripts/verify-all-patches.ps1 -Apk '<new bundle>' -Force -DesktopJar '<Morphe desktop JAR>' -WorkDir '<scratch folder>'
./scripts/fingerprint-candidates.ps1 -OldApk '<old bundle>' -Method '<method descriptor>' -NewApk '<new bundle>'
```

Candidate ranking suggests methods to inspect. It changes nothing. Fix anchors and inner-target guards against the new and declared builds. Use kept names, strings, Pando fields or method shapes. `ObfuscatedIdentityTest` rejects hardcoded obfuscated identities.

Before declaring support, check every selected patch, settings, login and live feeds on the new and declared builds. Record the exact version name and arm64 version code in `AppCompatibilities.kt`, regenerate, rebuild and rerun the real-fixture checks and verification without `-Force` on every retained build.

## License

[GPL-3.0](LICENSE), with the Morphe section 7 notices carried in [NOTICE](NOTICE). Threads, Instagram and Meta are trademarks of Meta Platforms, Inc.
