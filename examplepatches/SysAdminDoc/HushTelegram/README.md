![HushTelegram. Keep the chat. Cut the noise.](assets/readme-hero.png)

<p align="center">
  <img src="https://img.shields.io/badge/version-0.0.5-2AABEE" alt="Version 0.0.5">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL--3.0-blue" alt="License GPL-3.0"></a>
  <img src="https://img.shields.io/badge/platform-Android%209%2B-3DDC84" alt="Platform Android 9+">
  <img src="https://img.shields.io/badge/Telegram-12.10.6-2AABEE" alt="Telegram 12.10.6">
  <img src="https://img.shields.io/badge/for-Morphe%20Manager%201.32.0%2B-8A2BE2" alt="For Morphe Manager 1.32.0 or newer">
</p>

# <img src="assets/icon.png" width="36" alt=""> HushTelegram

HushTelegram is a Morphe patch bundle for Android that takes the sponsored messages out of Telegram and keeps a few things on your phone that Telegram would otherwise send home.

The latest release is [v0.0.4](https://github.com/SysAdminDoc/HushTelegram/releases/tag/v0.0.4), with 4 patches. It's the first one. Every patch has been applied to Telegram 12.10.6 and exercised on a signed-in phone, where Hide ads took a live search ad off the screen. See [the before and after](#hide-ads-before-and-after).

Source version 0.0.5 is prepared for the next release. It hasn't been published; Morphe Manager still downloads v0.0.4.

[Add to Morphe](https://morphe.software/add-source?github=SysAdminDoc%2FHushTelegram) | [Download a release](https://github.com/SysAdminDoc/HushTelegram/releases/latest) | [Browse the patches](#patches)

## Why use it

- **Channels and search without sponsored posts.** Telegram never asks for them, so none are drawn, counted as seen or reported as clicked. That covers the sponsored accounts pinned above search results and the ads in its video player too.
- **Your habits stay your business.** When Telegram's server asks for a device statistics report, the patched app doesn't read your storage folders to build one. It also keeps to itself how long you looked at each post in a channel.
- **No update offers that can't work.** telegram.org's build offers its own updates, and those can't install over a patched app. That offer is switched off, so you update through Morphe Manager instead.
- **Controls that recover.** Every feature has a switch, and there's a pause, settings backups and privacy-filtered diagnostics for when Telegram changes.

HushTelegram is the Telegram member of a small family of patch bundles. Its settings screen, diagnostics and release checks come from its Threads sibling, [HushThreads](https://github.com/SysAdminDoc/HushThreads). The Telegram patches are written here. See [Where the patches come from](#where-the-patches-come-from).

This project has no connection to Telegram or to the Morphe project. Neither endorses it, and neither wrote it.

## Which Telegram

HushTelegram patches the Telegram you download from [telegram.org](https://telegram.org/android), package `org.telegram.messenger.web`, version 12.10.6 (version code 71129). That APK carries every phone architecture, and it's the build each patch is checked against. Morphe Manager warns about other builds.

The other Telegram, `org.telegram.messenger`, shares nearly all its code with this one. Support for it is planned once it has its own checked build.

The patched app requires Android 9 or newer. A build that loses one ad or usage-report hook names the missing coverage in its settings and diagnostic report.

## Install

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager) 1.32.0 or newer.
2. Add HushTelegram as a patch source: https://morphe.software/add-source?github=SysAdminDoc%2FHushTelegram
3. Download Telegram 12.10.6 from telegram.org.
4. In Morphe Manager, pick that file, keep the default patch selection or change it, and patch.

A patched Telegram can't install over the stock one, because Android only accepts an update signed with the same key. Uninstall the stock Telegram first. Your chats live on Telegram's servers, so signing in again brings them back. Secret chats don't come back, since they only ever lived on that phone.

## Keep your signing key

Morphe Manager signs the patched Telegram with a key it makes on your phone. Android installs an update over your patched Telegram only when the update carries that same key.

- **Back it up right after your first patch.** In Morphe Manager, open Settings, then System, then Import & export, then Signing key, and tap Export. Keep the `Morphe.keystore` file somewhere private, because anyone who has it can sign an APK your phone will accept as an update.
- **On a new phone, import it before you patch anything.** Without your exported copy, nothing you patched earlier can be updated in place.

## Patches

The current source has 7 patches, all selected by default. Published v0.0.4 contains the four original patches. Stories, recommendations and call-diagnostic controls are prepared for the next release. The new call controls still need a live call and audio check.

| Patch | What it does |
|---|---|
| `Disable analytics` | Stops Telegram sending your storage folders to its server as a device statistics report, and how long you spent on each channel post. Everything the app needs to work is left alone. |
| `Disable update checks` | Stops telegram.org's Telegram offering its own updates, which can't install over a patched build. Patch the new version in Morphe Manager instead. |
| `Disable call debug upload` | Stops automatic call debug reports and log-file uploads requested by Telegram's server. |
| `Hide ads` | Hides the sponsored messages in channels, the sponsored accounts in search and the ads in Telegram's video player. Telegram never asks for them, so none are counted as seen. |
| `HushTelegram settings` | Adds HushTelegram settings to Telegram. Long-press Telegram's launcher icon, or open Additional settings in the app on Telegram's App info page, to turn features on or off, pause HushTelegram, save your switches to a file or load them, and export diagnostics. The licenses are there too. |
| `Hide Stories` | Hides the chat-list story bar, avatar story rings and Post Story button, and stops fetching the story list. Profile stories and archives remain available. |
| `Hide recommendations` | Hides similar channels and bots, including cached recommendations. Telegram doesn't ask for new recommendations while the switch is on. |

### Hide ads, before and after

The same search on the same phone, first with Hide ads off, then on. Telegram pins a sponsored account above the results for a lot of searches. With the switch on it never asks for one, so there's nothing to show and nothing to count as seen.

<p><img src="assets/search-ads-off.png" width="320" alt="Search results for games with Hide ads off. An account marked Ad sits at the top."><img src="assets/search-ads-on.png" width="320" alt="The same search with Hide ads on. The Ad row is gone and the list starts with the first real result."></p>

## Settings

Long-press the Telegram icon and tap HushTelegram. You can also open Telegram's App info page and tap Additional settings in the app, which Samsung phones call Configure in Telegram.

<p><img src="assets/settings-overview.png" width="320" alt="HushTelegram settings with search, Pause and the Chats and Privacy pages"><img src="assets/settings-chats.png" width="320" alt="The Chats page with the Hide ads switch turned on"></p>

## Notifications on a patched Telegram

This is the main thing to know before you switch. Telegram's push notifications go through Google's Firebase, and Google only hands them to an app signed with Telegram's own key. A patched Telegram is signed with yours, so Firebase turns it away and push doesn't arrive.

Telegram has its own fallback for phones without Google's services. Under Settings, Notifications and Sounds, turn on Keep-Alive Service and Background Connection, and Telegram keeps its own connection open instead. That costs some battery, and it hasn't been tried on a patched build with an account yet. A patch that lets Firebase accept the patched app is the next thing being worked on.

The map in the location picker stays blank for the same reason. Google's Maps key only answers an app with Telegram's own signature.

## Your Telegram account

**Can Telegram tell?** Assume it can. A patched Telegram is signed with your key rather than Telegram's, and Telegram's app reports a fingerprint of that key to its servers when it connects.

**What stays the same?** Your chats, contacts and calls work through Telegram's servers exactly as before. HushTelegram doesn't send, read, forward or delete messages on your behalf, and it doesn't change how you sign in.

**Could my account be limited?** Nobody can promise it won't be, and this project is young. If you'd rather not risk the account you care about, try HushTelegram with a second account first.

## What it won't do

Some patches other people publish for Telegram unlock Premium features, get past a channel's forward and save protection, or open content Telegram hides for age or legal reasons. HushTelegram won't ship any of those. They take away something someone else controls, and the first two take something people pay for.

## Privacy

HushTelegram doesn't collect anything and has no server. The patched app goes online on HushTelegram's behalf for one thing only: the release check, and it's off until you turn it on. Once it's on, HushTelegram asks `api.github.com` for its latest release at most once a day, when Telegram starts, and again whenever you tap Check now. That's a plain HTTPS request with `HushTelegram/<version>` as its User-Agent, and it carries no cookies and nothing about you or your phone. GitHub sees your IP address, as any site you visit does.

The About and Licenses screens link to `github.com`, `gitlab.com` and `www.gnu.org`. Those open in your browser, and only when you tap one.

## Where the patches come from

| Source | What came from it |
|---|---|
| [SysAdminDoc/HushThreads](https://github.com/SysAdminDoc/HushThreads) at `b141524` | The Gradle build, the shared extension library with its settings screen, diagnostics and pause, the bytecode helpers and the checks that apply every patch to real builds before a release. Most of that came to HushThreads from [Hushfacebook](https://github.com/SysAdminDoc/Hushfacebook), and some of it from [Hushfeed](https://github.com/SysAdminDoc/hushfeed), [Andrew Liang's patches](https://github.com/andrewliang25/morphe-patches) and [FroggoMorphePatches](https://github.com/SapitoSucio/FroggoMorphePatches). |
| [Morphe](https://github.com/MorpheApp) and [ReVanced](https://gitlab.com/ReVanced/revanced-patches) | The patcher and the patch template. Everything above grew from their code. |

The Telegram patches were written for this project by reading Telegram 12.10.6 itself. Every source file says where it came from in its header, and [provenance.json](provenance.json) maps each file to the project and commit it came from, with its license. The [source ledger](sources/telegram-sources.json) records the other Telegram references, their reviewed commits and adoption decisions. A listed feature is a research candidate, not an approved addition or a dependency.

## Building from source

You need JDK 21 and the Android SDK. The Morphe patcher comes from GitHub Packages, so you also need a GitHub token with `read:packages`.

```bash
export GITHUB_ACTOR=<your GitHub user>
export GITHUB_TOKEN=<a token with read:packages>
./gradlew :patches:generatePatchesList
./gradlew :patches:buildAndroid
```

The bundle lands in `patches/build/release/patches-<version>.mpp`, beside its SHA-256 and a CycloneDX SBOM of every library that goes into it. Run `generatePatchesList` before `buildAndroid`, or the bundle loses its Android payload.

Tests: `./gradlew :patches:test :extensions:telegram:test`. Set `HUSHTELEGRAM_FIXTURE_DIR` to the directory containing every APK named in `AppCompatibilities.kt` before pushing a patch change. The push check rejects missing fixtures.

Build dependencies have a separate advisory check. Run `./gradlew :patches:buildDependencyReport`, then `pwsh -NoProfile -File scripts/build-advisories.ps1`. The report is in `patches/build/dependency-reports/`; the shipped SBOM continues to describe only libraries carried by the bundle. High, critical or unrated findings and failed queries stop a push. Lower-severity findings are reported.

`pwsh -NoProfile -File scripts/test-bouncycastle-test-graph.ps1` checks the real dependency review in both task orders and verifies that unreviewed unit-test requests still fail.

## License

[GPL-3.0](LICENSE), with the Morphe section 7 notices carried in [NOTICE](NOTICE). Telegram is a trademark of Telegram FZ-LLC.
