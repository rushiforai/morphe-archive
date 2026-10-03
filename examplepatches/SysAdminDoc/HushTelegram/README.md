![HushTelegram. Keep the chat. Cut the noise.](assets/readme-hero.png)

<p align="center">
  <img src="https://img.shields.io/badge/version-0.0.6-2AABEE" alt="Version 0.0.6">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL--3.0-blue" alt="License GPL-3.0"></a>
  <img src="https://img.shields.io/badge/platform-Android%209%2B-3DDC84" alt="Platform Android 9+">
  <img src="https://img.shields.io/badge/Telegram-12.10.6-2AABEE" alt="Telegram 12.10.6">
  <img src="https://img.shields.io/badge/for-Morphe%20Manager%201.32.0%2B-8A2BE2" alt="For Morphe Manager 1.32.0 or newer">
</p>

# <img src="assets/icon.png" width="36" alt=""> HushTelegram

HushTelegram is a Morphe patch bundle for Android that takes the sponsored messages out of Telegram and keeps a few things on your phone that Telegram would otherwise send home.

The latest release is [v0.0.6](https://github.com/SysAdminDoc/HushTelegram/releases/tag/v0.0.6), with 18 patches. They're built for Telegram 12.10.6, and on a signed-in phone Hide ads took a live search ad off the screen. See [the before and after](#hide-ads-before-and-after).

[Add to Morphe](https://morphe.software/add-source?github=SysAdminDoc%2FHushTelegram) | [Download a release](https://github.com/SysAdminDoc/HushTelegram/releases/latest) | [Browse the patches](#patches)

## Why use it

- **Channels and search without sponsored posts.** Telegram never asks for them, so none are drawn, counted as seen or reported as clicked. That covers the sponsored accounts pinned above search results and the ads in its video player too.
- **Usage reports stay on your phone.** When Telegram's server requests its storage-type statistic, the patch stops that report. It also stops channel read-time reports and Premium interaction telemetry. Billing callbacks and operational reports keep their usual behavior.
- **No update offers that can't work.** telegram.org's build offers its own updates, and those can't install over a patched app. That offer is switched off, so you update through Morphe Manager instead.
- **Controls that recover.** Every feature has a switch, and there's a pause, settings backups and privacy-filtered diagnostics for when Telegram changes.

HushTelegram is the Telegram member of a small family of patch bundles. Its settings screen, diagnostics and release checks come from its Threads sibling, [HushThreads](https://github.com/SysAdminDoc/HushThreads). The Telegram patches are written here. See [Where the patches come from](#where-the-patches-come-from).

This project has no connection to Telegram or to the Morphe project. Neither endorses it, and neither wrote it.

## Which Telegram

HushTelegram patches the Telegram you download from [telegram.org](https://telegram.org/android), package `org.telegram.messenger.web`, version 12.10.6 (version code 71129). That APK carries every phone architecture, and it's the build each patch is checked against. Morphe Manager warns about other builds.

The other Telegram, `org.telegram.messenger`, shares nearly all its code with this one. Support for it is planned once it has its own checked build.

The patched app requires Android 9 or newer. A build that loses one ad or usage-report hook names the missing coverage in its settings and diagnostic report.

Changed Premium report builders are refused before the patch changes any code.

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

There are 18 patches, all selected by default. A few of their switches stay off until you turn them on in settings, like tracking cleaning and draft link previews.

| Patch | What it does |
|---|---|
| `Disable analytics` | Stops Telegram sending its storage-type statistic and how long you spent on each channel post to its server. Also stops reports about Premium screen views, feature taps, accepts and purchase failures. Messages and calls work as before. |
| `Disable update checks` | Stops telegram.org's Telegram offering its own updates, which can't install over a patched build. Patch the new version in Morphe Manager instead. |
| `Disable call debug upload` | Stops automatic call debug reports and log-file uploads requested by Telegram's server. |
| `Disable draft link previews` | Adds a switch, off by default, that stops Telegram fetching link previews for messages you haven't sent yet, in chats, the share sheet, polls, story links and bot shares. Sent messages still get their preview. |
| `Gallery camera on tap` | Adds a switch, off by default, that keeps the attachment gallery from starting the camera or asking for camera access when it opens. Tapping the camera tile starts it. |
| `Hide ads` | Hides the sponsored messages in channels, the sponsored accounts in search and the ads in Telegram's video player. Telegram never asks for them, so none are counted as seen. |
| `HushTelegram settings` | Adds HushTelegram settings to Telegram. Long-press Telegram's launcher icon, or open Additional settings in the app on Telegram's App info page, to turn features on or off, pause HushTelegram, save your switches to a file or load them, and export diagnostics. The licenses are there too. |
| `Hide Stories` | Hides the chat-list story bar, avatar story rings and Post Story button, and stops fetching the story list. Profile stories and archives remain available. |
| `Hide recommendations` | Hides similar channels and bots, including cached recommendations. Telegram doesn't ask for new recommendations while the switch is on. |
| `Hide Premium, gifts and Stars` | Hides Premium, Stars, My Grams, Business and Send a Gift in Settings, profile Gifts tabs and the channel Gift button. Purchases and account controls keep their usual behavior. |
| `Hide promotional banners` | Hides Premium, birthday and low Stars balance banners in the chat list. Account security notices and other suggestions remain. Nothing is dismissed for you. |
| `Hide sponsored proxy channel` | Hides a proxy's sponsored channel from the chat list and folders. Leaves proxy settings and shared promo-data updates alone. |
| `Hide popular apps` | Hides the Popular apps list in search's Apps tab and stops Telegram from asking its server for it. Apps you've opened and other search results stay. |
| `Disable chat swipe actions` | Adds a switch, off by default, that stops a sideways swipe on a chat in the chat list from archiving, muting, pinning, deleting or marking it read. A swipe set to change folders still does. Long-press keeps every action. |
| `Quiet contacts nag` | Keeps the Contacts tab from asking for contacts access again, and clears its warning badge, once you've said no. The first request, the tab's own buttons and contact sync stay as they are. |
| `Holiday look all year` | Adds a switch, off by default, that keeps Telegram's New Year snow falling all year over the chat list's top bar and chat backgrounds. Telegram's own holiday dates apply while it's off. |
| `Open links externally` | Opens ordinary HTTP(S) links in your browser. Telegram links, login, payment and authenticated routes keep their existing behavior. |
| `Strip link tracking` | Optional local cleaning at link-open and Share Link chooser sites. Removes only utm_source, utm_medium, utm_campaign, utm_term, utm_content, gclid and fbclid. Any unknown query key preserves the entire URL. Off by default in settings. |

### Hide ads, before and after

The same search on the same phone, first with Hide ads off, then on. Telegram pins a sponsored account above the results for a lot of searches. With the switch on it never asks for one, so there's nothing to show and nothing to count as seen.

<p><img src="assets/search-ads-off.png" width="320" alt="Search results for games with Hide ads off. An account marked Ad sits at the top."><img src="assets/search-ads-on.png" width="320" alt="The same search with Hide ads on. The Ad row is gone and the list starts with the first real result."></p>

## Settings

Long-press the Telegram icon and tap HushTelegram. You can also open Telegram's App info page and tap Additional settings in the app, which Samsung phones call Configure in Telegram.

<p><img src="assets/settings-overview.png" width="320" alt="HushTelegram settings with search, Pause, and rows for Chats, Privacy and More settings that say what each page holds"><img src="assets/settings-chats.png" width="320" alt="The Chats page with Hide ads and Hide Stories turned on"></p>

## Notifications on a patched Telegram

This is the main thing to know before you switch. Telegram's push notifications go through Google's Firebase, and Google only hands them to an app signed with Telegram's own key. A patched Telegram is signed with yours, so Firebase turns it away and push doesn't arrive.

Telegram has its own fallback for phones without Google's services. Under Settings, Notifications and Sounds, turn on Keep-Alive Service and Background Connection, and Telegram keeps its own connection open instead. That costs some battery, and it hasn't been tried on a patched build with an account yet. A patch that lets Firebase accept the patched app is the next thing being worked on.

The map in the location picker stays blank for the same reason. Google's Maps key only answers an app with Telegram's own signature.

## Your Telegram account

Sign-in can fail with `API_ID_PUBLISHED_FLOOD`, which means Telegram rejected the API ID bundled with the app. Getting past it needs [registered API credentials](https://core.telegram.org/api/obtaining_api_id), and the current patches don't replace them. Keep any existing signed-in installation.

**Can Telegram tell?** Assume it can. A patched Telegram is signed with your key rather than Telegram's, and Telegram's app reports a fingerprint of that key to its servers when it connects.

**What stays the same?** Your chats, contacts and calls work through Telegram's servers exactly as before. HushTelegram doesn't send, read, forward or delete messages on your behalf, and it doesn't change how you sign in.

**More than one account?** HushTelegram's switches belong to the app, not to an account. Every one of them applies to all the accounts you've added, and a settings file you export or import covers them all.

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
