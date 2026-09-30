# Where the Threads patches come from

HushThreads started on 2026-09-29. Before writing a patch we went through every public patch source we could find for Threads (`com.instagram.barcelona`), plus the Instagram projects next door, since Threads is built from a lot of Instagram's code. This page is what we found and what we took from each.

The short version: the Threads pool is small. Five repositories patch Threads at all, most of them pinned to builds months old, and the one anchor worth keeping came from a single repository. Morphe's official bundle ships nothing for Threads.

This page is the readable version. The one the scripts hold us to is [sources/threads-sources.json](../sources/threads-sources.json), which records every source with its branches and the commits we last read them at, its licence and a hash of the licence text, the Threads builds it declares, its features, and what we're allowed to take from it.

## How a source gets in

Each source in the ledger gets one of four answers:

- **adopted** means HushThreads ships code from it. No Threads source is adopted today.
- **candidate** means its licence lets us port code, and we might, once the checks below pass.
- **behavior-only** means we never port its code. We can read what it does and find the same thing in Threads' own code, and that's all.
- **rejected** means it's licensed but there's nothing there to take.

A source with no licence, or one whose licence can't be combined with GPL-3.0, is behavior-only. So is a source whose Threads code came from one of those. Before code from a source can ship, the ledger needs the commit it came from, a compatible licence with its URL and hash, the source's name in [NOTICE](../NOTICE), a rule in [provenance.json](../provenance.json) naming that repository and commit, and a release receipt showing the patches applied to the Threads builds the bundle declares.

HushThreads' own code starts from [Hushfacebook](https://github.com/SysAdminDoc/Hushfacebook) at commit c15d4f79, the Facebook sibling in the same family. The settings screen, the diagnostics, the pause switch, the release check and the patch-time safety checks all come from there, and every file that did says so in its header. That's family code, not a Threads source, so it's recorded in provenance.json and NOTICE rather than here.

## The Threads sources

**[zeldrisho/morphe-patches](https://github.com/zeldrisho/morphe-patches)** (GPL-3.0) has four Threads patches: Hide ads, Remove ad ID, Change app name and Change package name, for Threads 434 and 445. It found where to take ads out. Every page of the feed, For You and Following alike, goes through one merge method of the feed's cache before anything is drawn, and zeldrisho finds that method by its shape and by the Kotlin lambda it builds. On Threads 449 that anchor still picks out exactly one method, and HushThreads hooks the same place. We didn't take its code, though. Its extension reads Threads' obfuscated method names written down for each build (`DED`, `DGK`, `A05` and more), and those change every release. HushThreads finds what it needs when you patch instead.

**[durgesh0505/chiggi_morphe_patches](https://github.com/durgesh0505/chiggi_morphe_patches)** (GPL-3.0) is where that line of Threads patches starts, in June 2026, with the same four patch names for Threads 434. Its ad filter leans on a boolean method of `BarcelonaSpoolFeedCacheHandler` that 449 doesn't have anymore, and its own tracker (issues 5 and 16) says the filter is broken.

**[ReVanced](https://gitlab.com/ReVanced/revanced-patches)** (GPL-3.0) had the first Threads patch: Hide ads, pinned to 382. It uses the same fingerprint as ReVanced's Instagram Hide ads, which is the clearest sign the two apps share their ad code. Its anchor string, `SponsoredContentController.insertItem`, is gone from 449. The [GitHub home](https://github.com/ReVanced/revanced-patches) has been blocked by a DMCA notice since March, so GitLab holds it for now.

**[MrxSiN/ThreadsHideAds](https://github.com/MrxSiN/ThreadsHideAds)** (GPL-3.0) is an LSPosed module from late September, tested on Threads 448. It finds the ad hooks by their shape with DexKit and writes up what it found in `HOOK_NOTES.md`. It's a second opinion worth reading the next time a build moves the ad code.

**[kareemlukitomo/morphe-patches](https://github.com/kareemlukitomo/morphe-patches)** (GPL-3.0) changes the domain of shared Threads links, for Threads 426. The class it hooks still exists on 449, but the string that tells its method apart now sits in five places, so it would need a new anchor. HushThreads cleans links at a different place anyway: where the app reads the server's answer for a post's link, before anything stores it.

**[chirag127/morphe-patches](https://github.com/chirag127/morphe-patches)** has two Threads patches that are names without working bodies. It's rejected for Threads.

## Instagram, next door

Threads and Instagram share a lot of code, and HushThreads leans on that. We ran all 299 fingerprints of [crimera/piko](https://github.com/crimera/piko), the biggest Instagram patch source, against Threads 449: 65 pick out exactly one method, 8 match more than one and the rest find nothing. ReVanced's Instagram anchors for analytics, opening links outside the app and the share link parsers turn up in Threads too, which is how Disable analytics and Sanitize sharing links found their places. piko and the other Instagram-only projects (ReVanced-derived sets, InstaEclipse, Instafel and PawGram) are recorded as out of scope here. The sibling project for Instagram keeps its own ledger for them.

## Where HushThreads is listed

Nowhere yet. The repository went public with the first release on 2026-09-29, and none of the Morphe indexes (the community directory, Awesome Morphe, the Morphe Patch Tracker, Jman's bundle index and the Morphe Archive) had picked it up by then.

## What's next

- Hiding suggested threads is the most asked-for feature after ads, and it doesn't have a clean anchor yet.
- Following as the default feed is the other one people ask for, but Threads 449 already has it: the feeds menu can set the feed Threads opens on. A patch would only get in its way.
- When Threads moves its ad code again, MrxSiN's notes and zeldrisho's newest pins are the first two places to look.
- A custom share domain would start from kareemlukitomo's patch, with a new anchor.
