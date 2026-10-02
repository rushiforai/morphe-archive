# Where the Instagram patches come from

Before writing HushGram's first patch, we went through every public patch source we could find that touches Instagram (`com.instagram.android`): Morphe and ReVanced bundles, LSPosed and Xposed modules, standalone patchers and the copies around all of them. This page is what we found, what we took and what we didn't.

The short version: piko is the biggest Instagram source by a wide margin, but its current build doesn't apply to current Instagram. ReVanced's Instagram patches are the base most other bundles copy. Morphe's official bundle ships nothing for Instagram. HushGram 0.0.1 copies code from exactly two places, both of them Facebook bundles, and takes nothing but ideas from everything else.

This page is the readable version. The one the scripts hold us to is [sources/instagram-sources.json](../sources/instagram-sources.json), which records every source with its branches and the commits we last read them at, its licence and a hash of the licence text, the Instagram builds it declares, its features, and what we're allowed to take from it. The census was last run on 2026-09-29.

## How a source gets in

Each source in the ledger gets one of four answers:

- **adopted** means HushGram ships code from it.
- **candidate** means its licence lets us port code, and we might, once the checks below pass.
- **behavior-only** means we never port its code. We can read what it does and find the same thing in Instagram's own code, and that's all.
- **rejected** means it's licensed but there's nothing there to take.

A source with no licence, or one whose licence can't be combined with GPL-3.0, is behavior-only. So is a source whose Instagram code came from one of those, whatever its own licence says. Before code from a source can ship, the ledger needs the commit it came from, a compatible licence with its URL and hash, the source's name in [NOTICE](../NOTICE), a rule in [provenance.json](../provenance.json) naming that repository and commit, and the Instagram builds the patches were checked on. Those have to include every build the catalog declares, which is 449.0.0.52.84 right now. `scripts/test-instagram-sources.ps1` refuses a ledger that breaks any of this.

The ledger is about Instagram, with one exception. HushGram's shared code came from two Facebook bundles, and provenance.json may only port from a source the ledger adopts, so those two sit in the ledger as adopted sources for Facebook. Nothing else in it is allowed to name another app.

`scripts/audit-instagram-sources.ps1` keeps the ledger current. It reads the official Morphe bundle, the Morphe community directory, Awesome Morphe, the Morphe Patch Tracker, Jman's bundle index and the Morphe Archive, searches GitHub (and GitLab, given a token) for code naming Instagram's package, and then walks every source's branches, forks and licence. A repository whose files are byte for byte files the ledger already holds counts as a copy of that source, not as a new one. Anything else that moved (a new source, a licence that disappeared, a branch whose Instagram code changed, a fork we haven't seen) stops the audit until it's settled in the ledger.

The audit never downloads anyone's code. It reads what the forges' APIs say about a repository and hashes licence text in memory. The only files it writes are its report and the ledger's dates.

## What HushGram took

Only two sources are adopted, and neither of them patches Instagram.

**[SysAdminDoc/Hushfacebook](https://github.com/SysAdminDoc/Hushfacebook)** (GPL-3.0-only, with Morphe's section 7 notices) is HushGram's sibling for Facebook and the bundle HushGram was scaffolded from. The shared extension, the settings screen, the share-link cleaner and the re-signed build fix were copied from its commit c15d4f79 and renamed for Instagram. All six of HushGram's 0.0.1 patches applied unforced to Instagram 449.0.0.52.84.

**[andrewliang25/morphe-patches](https://github.com/andrewliang25/morphe-patches)** (GPL-3.0) is where the re-signed build fix started. HushGram's copy came through Hushfacebook, from Andrew Liang's commit 5db2e57e.

The file headers and [provenance.json](../provenance.json) say which files came from where. Everything else HushGram 0.0.1 ships was written here, against Instagram's own code.

## piko

**[crimera/piko](https://github.com/crimera/piko)** (GPL-3.0) patches Twitter and Instagram, and its Instagram half has more patches than any other source: ghost mode, downloads, saved deleted messages, feed and story filters, developer options, about sixty patches in all. It's a candidate in the ledger. Its licence would allow a port, but HushGram 0.0.1 took nothing but behavior from it: we read what its patches do and which parts of Instagram they touch, and wrote our own. No piko code is in HushGram.

piko ships a NOTICE file with an extra term under section 7(b) of the GPL. Here it is, word for word:

```
7b. Attribution Requirement
---------------------------

This NOTICE file must be preserved and retained in all distributions
of the Source Code and any Derivative Works.
```

If a patch is ever ported from piko, that NOTICE goes into HushGram's distributions with it.

Why HushGram exists at all comes down to what happened when we ran piko against current Instagram. piko 3.10.0-dev.9, run through the Morphe CLI 1.17.0 with every Instagram patch selected:

- On 439.0.0.37.89, the build piko pins, all 60 patches applied.
- On 449.0.0.52.84, only 5 of 60 applied. The first failure is piko's Add settings patch, whose `NativeSwitchInitializer` fingerprint no longer matches on 449. The rest depend on Add settings, and they didn't apply either.
- Probe builds that got past that fingerprint hit two more stops in the settings chain: "Expected home action name null guard", then an `IndexOutOfBoundsException` (index -1) inside a dependency. We stopped there.

So piko needs at least three fixes before its patches apply to 449, and there may be more past the third. That shaped HushGram's patches. None of them depends on anything but the settings patch, so one missed anchor can't take the rest down with it.

Two more repositories carry piko's code. [ahmedyarub/morphe-patches](https://github.com/ahmedyarub/morphe-patches) (GPL-3.0) keeps piko's Instagram package next to patches of its own and a test that checks fingerprints. [zalfafa/piko](https://github.com/zalfafa/piko) is a copy of piko that isn't a GitHub fork. [chirag127/morphe-patches](https://github.com/chirag127/morphe-patches) keeps copies of piko's and brosssh's bundles in a folder, and its only Instagram patch of its own is a stub that does nothing.

## ReVanced and the bundles built on it

**[ReVanced/revanced-patches](https://gitlab.com/ReVanced/revanced-patches)** (GPL-3.0) has the oldest Instagram patches in the ReVanced and Morphe world: hide ads, anonymous story viewing, share link cleaning, the Reels scrolling switches, the build-expired popup and a signature check fix. Its GitHub home has been blocked by a DMCA notice since March 2026, so GitLab holds it now, and several of its Instagram fixes live only on contributor branches there. It's a candidate.

About twenty GitHub repositories hold copies of ReVanced's Instagram files, from byte-for-byte current ones to 2023 snapshots in ReVanced's old layout. The ledger records each as a copy of ReVanced rather than a source of its own.

Built on ReVanced's work, or next to it:

- [bluecxt/instagram-revanced-patches](https://github.com/bluecxt/instagram-revanced-patches) (GPL-3.0) adds media download, swipe navigation, screenshot and navigation button patches of its own to ReVanced's set, and Jman's index lists it.
- [Aunali321/ReVancedExperiments](https://github.com/Aunali321/ReVancedExperiments) (GPL-3.0) has a media quality patch and a selectable bio patch nobody else has. [sam-reza/RevExp](https://github.com/sam-reza/RevExp) is a copy.
- [daboynb/revanced-instagram-viewonce](https://github.com/daboynb/revanced-instagram-viewonce) (GPL-3.0) is one patch that keeps view-once media, and [Kydaix/Patches](https://github.com/Kydaix/Patches) (GPL-3.0) is one patch for the Instants gallery.
- [wb1016/instagram-revanced-patches](https://github.com/wb1016/instagram-revanced-patches) renders HDR posts at normal brightness. It has no licence, so it's behavior-only.

## Other Morphe bundles

**[brosssh/morphe-patches](https://github.com/brosssh/morphe-patches)** (GPL-3.0) is the second biggest Instagram bundle, built around a distraction-free Instagram: 18 patches for Reels, stories, Explore and the feed, and three branches with more on the way.

[jean-voila/FeurStagram](https://github.com/jean-voila/FeurStagram) (GPL-3.0) strips Reels and the main feed out of Instagram, ads along with them, by filtering feed items and blocking content at the network layer instead of hiding views. [FoxxoOwO/foxxo-patches](https://github.com/FoxxoOwO/foxxo-patches) republishes the same patches as a bundle the indexes list on its own.

Four multi-app bundles have one Instagram patch each, all GPL-3.0: a system font switch in [ch3thanhs/stylus](https://github.com/ch3thanhs/stylus), DM scroll position in [dawidd612/dudeks-morphe-patches](https://github.com/dawidd612/dudeks-morphe-patches), notification grouping in [giaaaacomo/nifty-patches-selection](https://github.com/giaaaacomo/nifty-patches-selection) and a share domain switch in [kareemlukitomo/morphe-patches](https://github.com/kareemlukitomo/morphe-patches). [lordbagel42/lobotagram](https://github.com/lordbagel42/lobotagram) is an early Reels-removal bundle with no licence, so it's behavior-only.

## Outside Morphe

A lot of Instagram modding happens outside Morphe, in LSPosed modules and standalone patchers.

- [ReSo7200/InstaEclipse](https://github.com/ReSo7200/InstaEclipse) (Apache-2.0) is the most complete maintained module: ghost mode, downloads, a distraction-free layout, developer options and more. Apache-2.0 code can go into a GPL-3.0 project as long as its notices come along. Its hooks run while the app runs, though, so any port means rewriting each one as a patch. It replaced [xHookman/IGexperiments](https://github.com/xHookman/IGexperiments) (Apache-2.0), which its authors retired, so that one is rejected.
- [NexAlloy/NexAlloy](https://github.com/NexAlloy/NexAlloy) (GPL-3.0) covers many apps, and its Meta hook turns off Instagram's and Threads' ad injector.
- [mamiiblt/instafel](https://github.com/mamiiblt/instafel) (MIT) patches Instagram Alpha builds with a patch engine of its own. It's a candidate, though its patches would have to be rewritten for Morphe.
- [arnav-exe/dfinsta-redux](https://github.com/arnav-exe/dfinsta-redux) carries DFInsta's distraction-free edits to each new Instagram release, and [uuu38/instaX](https://github.com/uuu38/instaX) is a current module built against 440.1.0.46.86. Neither has a licence, so both are behavior-only.
- [V-E-O/biliSpeed](https://github.com/V-E-O/biliSpeed) (GPL-3.0) is a playback speed module that hooks Instagram too.

The older download and ad modules, [iHelp101/XInsta](https://github.com/iHelp101/XInsta) and [TremendoX/UnclutterIG](https://github.com/TremendoX/UnclutterIG) among them, have no licence and target Instagram builds years old. The ledger keeps them as behavior-only. [pawjects/PawGram](https://github.com/pawjects/PawGram) is MIT, but it distributes prebuilt Instagram APKs rather than patch code, so there's nothing to take.

## Threads

Threads (`com.instagram.barcelona`) shares a lot of code with Instagram, and a few of the sources above touch both. HushGram doesn't patch Threads, and this census doesn't count Threads sources.

## Where HushGram is listed

Nowhere yet. On 2026-09-29, none of the [Morphe community directory](https://morphe-patches.software), [Awesome Morphe](https://github.com/nvbangg/awesome-morphe), the [Morphe Patch Tracker](https://drnx64.github.io/morphe-track-patches/), [Jman's ReVanced Patch Bundles](https://github.com/Jman-Github/ReVanced-Patch-Bundles) or the [Morphe Archive](https://rushiforai.github.io/morphe-archive/) listed it. The audit notices when that changes.

## What we left out

- Meta Plus unlocks. Those get around a paywall.
- Certificate pinning bypasses. They're tools for inspecting traffic, not something you'd want on your phone every day.
- Translation that sends your posts and comments to an outside service.
- Prebuilt patched APKs. HushGram publishes patches only, never Meta's app.

## What's next

The features people ask for most are media downloads and ghost mode, with limits on Reels close behind, and piko and InstaEclipse have them all. Where a source is a candidate, a new patch can start from its code once the ledger's checks pass, with its licence and notices kept. Where it's behavior-only, the patch starts from Instagram's own code instead.

If you know of an Instagram patch source we missed, open an issue with a link.
