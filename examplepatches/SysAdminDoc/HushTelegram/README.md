![HushTelegram. Keep the chat. Cut the noise.](assets/readme-hero.png)

<p align="center">
  <img src="https://img.shields.io/badge/version-0.0.12-2AABEE" alt="Version 0.0.12">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL--3.0-blue" alt="License GPL-3.0"></a>
  <img src="https://img.shields.io/badge/platform-Android%209%2B-3DDC84" alt="Platform Android 9+">
  <img src="https://img.shields.io/badge/Telegram-12.10.6-2AABEE" alt="Telegram 12.10.6">
  <img src="https://img.shields.io/badge/for-Morphe%20Manager%201.34.0%2B-8A2BE2" alt="For Morphe Manager 1.34.0 or newer">
</p>

<p align="center">
  <a href="https://ko-fi.com/X8K126YVER">
    <img height="42" src="https://storage.ko-fi.com/cdn/kofi2.png?v=3" alt="Buy me a coffee on Ko-fi" />
  </a>
</p>

<p align="center">
  <sub><em>If HushTelegram makes Telegram better for you, a coffee helps me keep testing patches and maintaining them as Telegram changes.</em></sub>
</p>

# <img src="assets/icon.png" width="36" alt=""> HushTelegram

HushTelegram is a Morphe patch bundle for Android that takes the sponsored messages out of Telegram and keeps a few things on your phone that Telegram would otherwise send home.

The latest release is [v0.0.12](https://github.com/SysAdminDoc/HushTelegram/releases/tag/v0.0.12), with 56 patches. They're built for Telegram 12.10.6 and the official beta 12.10.7, and on a signed-in phone Hide ads took a live search ad off the screen. See [the before and after](#hide-ads-before-and-after).

v0.0.12 is mostly about reading easier. Every patch description in Morphe Manager, every row in HushTelegram settings and every message the app shows is rewritten in plain English, and Expert mode groups the patches the way you'd look for them. Keep deleted messages now marks a message the moment it's deleted while the chat is open, and a new row clears what it kept. On the beta, Disable analytics also stops Firebase's crash and session reports, and the new Turn off beta debug logs switch (off by default) stops the beta from writing debug logs all the time. Two optional patches take your own registered Telegram API credentials and Google Maps key when you patch.


[Add to Morphe](https://morphe.software/add-source?github=SysAdminDoc%2FHushTelegram) | [Download a release](https://github.com/SysAdminDoc/HushTelegram/releases/latest) | [Browse the patches](#patches)

## Why use it

- **Channels and search without sponsored posts.** Telegram never asks for them, so none are drawn, counted as seen or reported as clicked. That covers the sponsored accounts pinned above search results and the ads in its video player too.
- **Usage reports stay on your phone.** When Telegram's server requests its storage-type statistic, the patch stops that report. It also stops channel read-time reports and Premium interaction telemetry. On Telegram Beta, Firebase's crash and session reports stop as well, from the next start, while push notifications keep working. Billing callbacks and operational reports keep their usual behavior.
- **No update offers that can't work.** telegram.org's build offers its own updates, and those can't install over a patched app. That offer is switched off, so you update through Morphe Manager instead.
- **Controls that recover.** Every feature has a switch, and there's a pause, settings backups and privacy-filtered diagnostics for when Telegram changes.

HushTelegram is the Telegram member of a small family of patch bundles. Its settings screen, diagnostics and release checks come from its Threads sibling, [HushThreads](https://github.com/SysAdminDoc/HushThreads). The Telegram patches are written here. See [Where the patches come from](#where-the-patches-come-from).

This project has no connection to Telegram or to the Morphe project. Neither endorses it, and neither wrote it.

## Which Telegram

HushTelegram patches telegram.org's own Telegram build, package `org.telegram.messenger.web`, version 12.10.6 (version code 71129). telegram.org's download has moved on to 13.0.0, so get 12.10.6 from [APKMirror's Telegram (Web version) page](https://www.apkmirror.com/apk/telegram-fz-llc/telegram-web-version/telegram-web-version-12-10-6-release/). That APK carries every phone architecture, and it's the build each patch is checked against. Morphe Manager warns about other builds.

Since v0.0.8 it also targets the [official beta](https://telegram.org/dl/android/apk-public-beta), package `org.telegram.messenger.beta`, version 12.10.7 (version code 71239). Its vendor signer and native patch targets are checked on their own.

The other Telegram, `org.telegram.messenger`, shares nearly all its code with this one. Support for it is planned once it has its own checked build.

The patched app requires Android 9 or newer. A build that loses one ad or usage-report hook names the missing coverage in its settings and diagnostic report.

Changed Premium report builders are refused before the patch changes any code.

## Install

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager) 1.34.0 or newer.
2. Add HushTelegram as a patch source: https://morphe.software/add-source?github=SysAdminDoc%2FHushTelegram
3. Get Telegram 12.10.6, version code 71129, from [APKMirror's Telegram (Web version) page](https://www.apkmirror.com/apk/telegram-fz-llc/telegram-web-version/telegram-web-version-12-10-6-release/) and pick the universal APK. telegram.org's own Download button now gives you 13.0.0. Skip the Google Play version too, since it's a different package.
4. In Morphe Manager, pick that file, keep the default patch selection and patch. It holds every feature, so you don't need Expert mode.
5. Only the two credential patches are left out. If you have your own Telegram API ID and hash or a Google Maps key, turn on **Settings → Advanced → Expert mode** in Morphe Manager, pick Use registered Telegram API credentials or Use registered Maps API key, and fill in its options before you patch.

Android accepts an update only when it carries the installed app's signing key. Use your retained Morphe key to update an existing patched Telegram in place. Its data and permission choices stay intact.

Moving from stock Telegram needs a deliberate migration because the signing keys differ. Keep a signed-in fallback on another device and save any important local files before removing stock Telegram yourself. Removing it permanently deletes this phone's local secret chats. Cloud chats return after a successful sign-in, but secret chats can't be recovered that way. Verify that you can sign in before giving up your only working installation.

## Keep your signing key

Morphe Manager signs the patched Telegram with a key it makes on your phone. Android installs an update over your patched Telegram only when the update carries that same key.

- **Back it up right after your first patch.** In Morphe Manager, open Settings, then System, then Import & export, then Signing key, and tap Export. Keep the `Morphe.keystore` file somewhere private, because anyone who has it can sign an APK your phone will accept as an update.
- **On a new phone, import it before you patch anything.** Without your exported copy, nothing you patched earlier can be updated in place.

The developer installation script requires the exact device serial, expected model (and AVD profile for an emulator), shared lease directory, owned lease token and chat identity. Supply `-LeaseDirectory`, `-LeaseToken` and `-ChatIdentity`, or their `HUSHTELEGRAM_DEVICE_LEASE_DIR`, `HUSHTELEGRAM_DEVICE_LEASE_TOKEN` and `HUSHTELEGRAM_DEVICE_CHAT` environment variables. It checks ownership before every device command and verifies the installed signer and version before updating. It never uninstalls the app, grants permissions or permits a downgrade. The old `-Replace` option is refused. A first install also verifies an unambiguous package absence before changing the device.

## Patches

v0.0.12 has 56 patches, with 54 selected by default. Turn off beta debug logs is new in v0.0.12. Every patch but the two credential patches is selected by default, so you don't need Expert mode to find a feature. Each description below says which page of HushTelegram settings holds its switch and whether it starts on or off. The credential patches need your own values, which Morphe Manager only asks for in Expert mode. Expert mode groups the patches the way you'd look for them: Chats for the chat list, Conversations for what happens inside a chat, then Playback, Notifications, Theme, Interface and a few smaller groups.

| Patch | What it does |
|---|---|
| `Disable analytics` | Stops Telegram from reporting how you use the app, like how long you read channel posts and what you tap on Premium screens. On Telegram Beta it also turns off Firebase's crash and session reports from the next start. Messages, calls and notifications work as before. On by default. Turn it off in HushTelegram settings > Privacy. |
| `Disable update checks` | Stops Telegram from offering its own updates from telegram.org, which can't install over a patched app. Patch each new version in Morphe Manager instead. On by default. Turn it off in HushTelegram settings > More settings > Updates. |
| `Disable call debug upload` | Stops your phone from sending call problem reports and log files to Telegram when its server asks for them. On by default. Turn it off in HushTelegram settings > Privacy. |
| `Disable draft link previews` | Keeps Telegram from looking up a link's preview before you send the message. Sent messages still get a preview. Starts off. Turn it on in HushTelegram settings > Privacy. |
| `Gallery camera on tap` | Keeps the attachment gallery from starting the camera or asking for camera access when it opens. The camera starts when you tap its tile. Starts off. Turn it on in HushTelegram settings > Privacy. |
| `Hide ads` | Removes sponsored messages in channels, sponsored accounts in search and ads in Telegram's video player, so you see fewer ads. On by default. Turn it off in HushTelegram settings > Chats. |
| `HushTelegram settings` | Adds a HushTelegram row to Telegram's Settings, where you turn features on or off, pause HushTelegram, save your choices and export a report. You can also press and hold Telegram's app icon. Works as soon as you patch it in, with no switch. |
| `Hide Stories` | Removes the story bar above your chats, the rings around profile pictures and the Post Story button. Profile stories and archives stay. On by default. Turn it off in HushTelegram settings > Chats. |
| `Hide recommendations` | Hides suggested similar channels and bots, and stops Telegram from loading new suggestions. On by default. Turn it off in HushTelegram settings > Chats. |
| `Hide Premium, gifts and Stars` | Removes Premium, Stars, My Grams, Business and Send a Gift from Settings, Gifts tabs on profiles, and the Gift button in channels, for a less cluttered app. On by default. Turn it off in HushTelegram settings > Chats. |
| `Hide promotional banners` | Hides Premium, birthday and low Stars balance banners above your chat list. Account security notices still show. On by default. Turn it off in HushTelegram settings > Chats. |
| `Hide sponsored proxy channel` | Hides the sponsored channel a proxy adds to your chat list and folders. Your proxy settings aren't touched. On by default. Turn it off in HushTelegram settings > Chats. |
| `Hide popular apps` | Hides the Popular apps list on the Apps tab of search and stops Telegram from loading it. On by default. Turn it off in HushTelegram settings > Chats. |
| `Hide contacts on Telegram` | Hides the Your contacts on Telegram list that shows under a short chat list. Chats, folders and search stay. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Hide greeting stickers` | Hides the sticker that an empty private chat offers to send as a greeting. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Disable chat swipe actions` | Stops a sideways swipe on a chat from archiving, muting, pinning, deleting or marking it read, so a slip can't change a chat. Press and hold still has every action. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Disable pull to next channel` | Stops pulling up at the bottom of a channel from jumping to the next channel. A second switch does the same for forum topics. The channel switch starts on and the topic switch starts off. Find them in HushTelegram settings > Chats. |
| `Use normal paste` | Pastes text exactly as you copied it, without Telegram adding formatting, tables or code styling. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Show user and chat IDs` | Adds a copyable ID number for a user or chat to the profile menu. A second switch also shows where the profile photo is stored. Both start off. Turn them on in HushTelegram settings > Chats. |
| `Disable double-tap reactions` | Stops a double tap on a message from adding a reaction, handy if you keep reacting by accident. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Repair Firebase push registration` | Tries to help a patched Telegram sign up for push notifications, by giving Google's Firebase service Telegram's original certificate. On by default. Turn it off in HushTelegram settings > More settings > Notifications. |
| `Use registered Telegram API credentials` | Signs in to Telegram with the API ID and hash you registered at my.telegram.org. Fill in both options, or leave both empty to keep the originals. It has no switch and isn't selected by default. Use Expert mode in Morphe Manager. |
| `Use registered Maps API key` | Lets maps in your patched Telegram use a Google Maps key you registered. Leave the option empty to keep Telegram's key. It has no switch and isn't selected by default. Turn on Expert mode in Morphe Manager to pick it and enter your key. |
| `Quiet contacts nag` | Once you've said no, stops the Contacts tab from asking for contacts access again and clears its warning badge. On by default. Turn it off in HushTelegram settings > Chats. |
| `Holiday look all year` | Shows Telegram's Santa hat and New Year snow all year, not just around New Year. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Use system font` | Draws Telegram's bold, italic and code text in your phone's font instead of the one built into the app. Starts off. Turn it on in HushTelegram settings > Chats, then restart Telegram. |
| `AMOLED black` | Gives Telegram's Night and Dark themes pure black screens for a darker look. Message bubbles and menus keep their colors. Starts off. Turn it on in HushTelegram settings > Chats, then restart Telegram. |
| `Hide translate bar` | Hides the translate bar at the top of chats in another language. Translate moves to the chat's menu. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Exact numbers` | Shows member, subscriber, view, reply and reaction counts in full, like 12,345 instead of 12.3K. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Reveal spoilers` | Shows spoiler text, photos and videos without the cover, so you don't have to tap. View-once media, sensitive content and login codes stay covered. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Hide keyboard on scroll` | Closes the on-screen keyboard when you start scrolling a chat, so you can read more. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Keep videos muted on volume keys` | Makes the volume keys only change the volume in a chat, instead of playing the video on screen with sound. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Swipe back on profiles` | Makes a swipe right on a profile's photos or media tabs go back, like the rest of the profile. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Hide phone number` | Covers your own phone number with dots in the side menu, Settings and your profile, which helps when you share your screen. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Message times with seconds` | Shows seconds in each message's time, like 9:41:27 PM, so messages sent close together are easy to tell apart. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Allow chat blur on slower phones` | Lets slower phones show the blurred chat header and panels that Telegram keeps for fast phones. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Play voice messages one at a time` | Stops the next voice or video message from playing by itself when one ends. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Turn off haptic feedback` | Stops Telegram from vibrating for taps, long presses, swipes and wrong entries. Calls and notifications still vibrate. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Turn off reaction effects` | Stops the emoji burst and fly-in when someone reacts. The reaction still shows on the message. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Hide folder tab counters` | Hides the unread count on each folder tab above the chat list, for a calmer look. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Hide sender names when forwarding` | Turns on Telegram's Hide sender's name option each time you forward, so copies arrive without the original author. You can turn it off before sending. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Voice messages in the music player` | Makes tapping the bar above a chat, while a voice message plays, open Telegram's full music player with a seek bar. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Silence people outside your contacts` | Shows notifications from people who aren't in your contacts without sound or vibration. Bots, reminders and login codes keep their sound. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Disable pull to archive` | Stops pulling down the chat list from opening the hidden archive. Open it from Archived chats in the chat list's menu instead. Starts off. Turn it on in HushTelegram settings > Chats, then restart Telegram. |
| `Start the camera on the rear lens` | Opens the attachment menu's camera on the rear lens every time, not the lens you used last. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Hide gallery camera tile` | Removes the live camera tile from the attachment menu's photo grid, so the grid starts with your photos. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Hide time on stickers` | Removes the time and read checks from stickers and big animated emoji in chats. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Ignore mentions in muted chats` | Stops mentions and replies in groups or channels you've muted from notifying you. Chats you haven't muted notify as before. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Hide blocked users in groups` | Leaves messages from people you've blocked out of groups and supergroups you open. Nothing is deleted. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Hide Telegram Features and Invite Friends` | Removes the Telegram Features row from Settings and the Invite Friends rows from Contacts. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Add Repeat to the message menu` | Adds Repeat, Copy photo, Message details and Quick forward to a message's press-and-hold menu, for resending, copying and forwarding faster. All four start off. Turn them on in HushTelegram settings > Chats. |
| `Keep deleted messages` | Keeps a message on your phone when someone else deletes it, and marks it deleted next to the time. Your own deletes still work normally. Starts off. Turn it on in HushTelegram settings > Chats. |
| `Ask before sending a sticker` | Asks you to confirm before a sticker, GIF, voice or video message, or call goes out, so a stray tap doesn't send it. All four start off. Turn them on in HushTelegram settings > Chats. |
| `Turn off beta debug logs` | Telegram Beta always writes debug logs to your phone, its connection log included, and its own debug menu can't stop that. This stops them, so the beta only logs when you turn logs on in its debug menu. The regular telegram.org build doesn't force them, so nothing changes there. Starts off. Turn it on in HushTelegram settings > Chats, then restart Telegram. |
| `Open links externally` | Opens ordinary web links in your browser instead of inside Telegram. Telegram links, sign-in and payment pages work as before. On by default. Turn it off in HushTelegram settings > More settings > Links. |
| `Strip link tracking` | Removes tracking tags like utm_source, gclid and fbclid from links you open or share. Links with any other extra part stay unchanged. Starts off. Turn it on in HushTelegram settings > More settings > Links. |

### Hide ads, before and after

The same search on the same phone, first with Hide ads off, then on. Telegram pins a sponsored account above the results for a lot of searches. With the switch on it never asks for one, so there's nothing to show and nothing to count as seen.

<p><img src="assets/search-ads-off.png" width="320" alt="Search results for games with Hide ads off. An account marked Ad sits at the top."><img src="assets/search-ads-on.png" width="320" alt="The same search with Hide ads on. The Ad row is gone and the list starts with the first real result."></p>

## Settings

Open Telegram's Settings and tap HushTelegram settings. You can also long-press the Telegram icon on your home screen or app drawer and tap HushTelegram, or open Telegram's App info page and tap Additional settings in the app, which Samsung phones call Configure in Telegram. Those two stay available too, so there's a way in even when the Settings row isn't there.

On v0.0.8 there's no row in Telegram's Settings, so use the long-press or App info.

More settings has separate pages for Pause, Settings backup and Diagnostics. Search finds each control by its name or page. Your saved switches and backup files work as before.

<p><img src="assets/settings-overview.png" width="320" alt="HushTelegram settings with search, Pause, and rows for Chats, Privacy and More settings that say what each page holds"><img src="assets/settings-chats.png" width="320" alt="The Chats page with Hide ads and Hide Stories turned on"></p>

v0.0.8 added a Notifications page and the channel-pull switch. Both are shown below.

<p><img src="assets/settings-notifications.png" width="320" alt="Notifications settings with the local notification status and the Firebase push registration repair switch"><img src="assets/settings-channel-pull.png" width="320" alt="Chats settings with Stop pull to next channel turned on, and Stop pull to next topic and Hide greeting stickers off by default"></p>

## Notifications on a patched Telegram

Telegram's push notifications go through Google's Firebase. Its Android API key checks the package and certificate header, so a re-signed build can get `API_KEY_ANDROID_APP_BLOCKED` before it receives a push token. Repair Firebase push registration fixes only that header on Firebase Installations requests from the declared web and beta packages. It preserves Android's package signatures and TLS checks. Firebase starts its first request while Telegram is still starting up, so on slower phones that request now waits for HushTelegram's settings (up to 10 seconds) instead of going out with the re-signed header.

The Notifications page also shows what this phone knows about push. It says whether notifications are allowed and whether Telegram has saved a push token, then counts your signed-in accounts and how many of them Telegram has confirmed for push. It only reads what's already on the phone. It doesn't send anything, and it can't tell you whether a notification will actually arrive. The diagnostic report carries the same facts, without the token itself.

Push delivery also depends on Telegram's server holding push credentials for the app's Firebase project, which [Telegram documents separately](https://core.telegram.org/api/push-updates). A new API ID and hash don't set that up on their own. Telegram has its own fallback for this. Under Settings, Notifications and Sounds, turn on Keep-Alive Service and Background Connection to keep its connection open. That costs some battery.

The location picker uses a separate Google Maps credential, restricted to the installed package and signer. Select Use registered Maps API key and supply `apiKey` from a Google Cloud project with the Maps SDK for Android enabled. Its Android restriction must allow the selected web or beta package and your retained signing key's SHA-1. Follow [Google's setup instructions](https://developers.google.com/maps/documentation/android-sdk/get-api-key).

## Your Telegram account

Sign-in can fail with `API_ID_PUBLISHED_FLOOD`, which means Telegram rejected the API ID bundled with the app. Register your own app at [Telegram's developer portal](https://my.telegram.org/apps), then select Use registered Telegram API credentials and supply both `apiId` and `apiHash` when patching. This changes the shared app credentials used by native initialization, phone and passkey login. You can install the result as an update over your current HushTelegram build. On its first start it introduces itself to Telegram with your ID, so login codes are requested under your app instead of the bundled one. Changing from one registered API ID to another also refreshes that connection identity, while keeping saved account keys and the app version intact. Telegram still decides which login methods are available. Keep any existing signed-in installation.

Filling in the form at my.telegram.org/apps:

1. Sign in with your phone number. The code for the portal arrives as a message in Telegram, not by SMS.
2. **App title:** plain words, for example `My HushTelegram`.
3. **Short name:** 5 to 32 letters and numbers only, for example `myhushtg1`. Spaces, underscores, dashes and other symbols here are what usually cause "Incorrect app name!".
4. **Platform:** Android. URL and Description can stay empty.
5. Tap Create application, then copy `App api_id` and `App api_hash` into the patch's `apiId` and `apiHash` options.

If the page shows a bare "ERROR" instead, turn off any VPN or ad blocker and try again in a private browser window. When the patched app asks for a login code, it usually shows up as a message in Telegram on another phone or app where you're already signed in, so keep that one signed in until the patched app finishes.

Credential options are compiled into the APK and recorded in the patching result report. Keep both private. These two patches have no runtime switch, and Pause doesn't change their credentials. Updating with the retained signing key preserves the installed app's data.

For a patching bug, attach the separate public summary. `patch-for-device.ps1` writes `public-summary.json`, and `verify-all-patches.ps1` writes `verify-all-public-summary-*.json`. They contain only supported package and bundle versions, catalog patch names and counts, and fixed failure codes. They omit credentials, options and private error text, even when patching fails. Keep the original result report and configured APK private. `-ShowPatchLog` prints the private CLI log locally, so don't copy that output into a report without reviewing it.

Fixture verification and new release receipts check native-library names, bytes and compression against the original APK. They also check relevant 64-bit ELF LOAD alignment and run `zipalign -c -P 16 -v 4`. Compressed native libraries remain valid. Receipt schema 4 records this evidence and the checker and tool hashes. Older receipts use the schema pinned by their own commit. These packaging checks don't establish that Telegram has booted on a device with 16 KB memory pages. Native regression fixtures check their ZIP headers and bytes independently on PowerShell 7 and Windows PowerShell 5.1.

**Can Telegram tell?** Assume it can. A patched Telegram is signed with your key rather than Telegram's, and Telegram's app reports a fingerprint of that key to its servers when it connects.

**What stays the same?** Your chats, contacts and calls use Telegram's servers and native account flow. HushTelegram doesn't send, read, forward or delete messages on your behalf.

**More than one account?** HushTelegram's switches belong to the app, not to an account. Every one of them applies to all the accounts you've added, and a settings file you export or import covers them all.

**Could my account be limited?** Nobody can promise it won't be, and this project is young. If you'd rather not risk the account you care about, try HushTelegram with a second account first.

## What it won't do

Some other Telegram patches enable paid Premium features without a subscription, bypass channel forwarding and saving restrictions, or expose content Telegram limits for age or legal reasons. HushTelegram won't ship those changes. They override controls set by someone else, and the Premium bypass takes away a paid feature.

## Privacy

HushTelegram doesn't collect anything and has no server. The patched app goes online on HushTelegram's behalf for one thing only: the release check, and it's off until you turn it on. Once it's on, HushTelegram asks `api.github.com` for its latest release at most once a day, when Telegram starts, and again whenever you tap Check now. That's a plain HTTPS request with `HushTelegram/<version>` as its User-Agent, and it carries no cookies and nothing about you or your phone. GitHub sees your IP address, as any site you visit does.

The About and Licenses screens link to `github.com`, `gitlab.com` and `www.gnu.org`. Those open in your browser, and only when you tap one.

Diagnostics omit named Telegram API IDs and hashes from buffered events, crash sections and exported reports. Versions, counters and unrelated hashes stay readable. Review a report before sharing it.

The patched app still connects to Telegram for messaging and Telegram's own service data. The [factory app reference](docs/telegram-app-reference.md) records the APK and first-run flow. The [code audit](docs/telegram-audit-12.10.6.md) maps ad delivery and telemetry, while the [stock phone audit](docs/telegram-runtime-audit-12.10.7.md) adds a live search ad, native settings and measured network/background activity.

## Where the patches come from

| Source | What came from it |
|---|---|
| [SysAdminDoc/HushThreads](https://github.com/SysAdminDoc/HushThreads) at `b141524` | The Gradle build, the shared extension library with its settings screen, diagnostics and pause, the bytecode helpers and the checks that apply every patch to real builds before a release. Most of that came to HushThreads from [Hushfacebook](https://github.com/SysAdminDoc/Hushfacebook), and some of it from [Hushfeed](https://github.com/SysAdminDoc/hushfeed), [Andrew Liang's patches](https://github.com/andrewliang25/morphe-patches) and [FroggoMorphePatches](https://github.com/SapitoSucio/FroggoMorphePatches). |
| [Morphe](https://github.com/MorpheApp) and [ReVanced](https://gitlab.com/ReVanced/revanced-patches) | The patcher and the patch template. Everything above grew from their code. |

The Telegram patches were written for this project by reading Telegram 12.10.6 itself. Every source file says where it came from in its header, and [provenance.json](provenance.json) maps each file to the project and commit it came from, with its license. The [source ledger](sources/telegram-sources.json) records the other Telegram references, their reviewed commits and adoption decisions. A listed feature is a research candidate, not an approved addition or a dependency. The ledger also records four confirmed directory listings. The published bundle is v0.0.11. Changes under Unreleased in the changelog are newer source work.

## Building from source

You need JDK 21 and the Android SDK. The Morphe patcher comes from GitHub Packages, so you also need a GitHub token with `read:packages`.

```bash
export GITHUB_ACTOR=<your GitHub user>
export GITHUB_TOKEN=<a token with read:packages>
./gradlew :patches:generatePatchesList
./gradlew :patches:buildAndroid
```

The bundle lands in `patches/build/release/patches-<version>.mpp`, beside its SHA-256 and a CycloneDX SBOM of every library that goes into it. Run `generatePatchesList` before `buildAndroid`, or the bundle loses its Android payload. Independent push checks use separate snapshots of the commits being pushed and separate outputs, with every required check retained. Fixture tests retain bounded content-keyed query facts and isolate mutable copies.

Tests: `./gradlew :patches:test :extensions:telegram:test`. Set `HUSHTELEGRAM_FIXTURE_DIR` to the directory containing every APK named in `AppCompatibilities.kt` before pushing a patch change. The push check rejects missing fixtures.

Text input fingerprints ignore LF/CRLF differences, so validated tests can be reused in a temporary checkout. Source changes still invalidate the results, and APK fixture bytes remain exact. `pwsh -NoProfile -File scripts/test-gradle-test-cache.ps1` exercises both test tasks in isolated copies, checks cache reuse and changes source and binary inputs to verify invalidation.

`pwsh -NoProfile -File scripts/verify-patch-selections.ps1 -Apk <declared APK> -WorkDir <private folder>` patches one declared Telegram build 75 ways. That covers the defaults, the full catalog, settings alone, each runtime patch by itself, the link and preview/camera pairs, and the two credential patches unset, configured and fed bad values. Every build is checked for its dependency closure, minimum Android version, preserved resources and native libraries, and the switches its settings screen offers. Configured credentials must change exactly their two literals and the native version marker that refreshes the connection identity. The Maps option changes only its metadata value.

Malformed options and rejected credential values must stop the build without echoing them. Ignored optional values must preserve stock behavior. The console prints only case names and fixed result codes. Keep the work folder private, since it holds the raw patcher reports. Combine both runs' `matrix-private.json` arrays into one file and set `HUSHTELEGRAM_SELECTION_FACTS` to it when running `CompiledSelectionUiTest`. The test task tracks that file's contents, so source-only results can't satisfy the compiled UI check.

Build dependencies have a separate advisory check. Run `./gradlew :patches:buildDependencyReport`, then `pwsh -NoProfile -File scripts/build-advisories.ps1`. The report is in `patches/build/dependency-reports/`. The shipped SBOM continues to describe only libraries carried by the bundle. High, critical or unrated findings and failed queries stop a push. Lower-severity findings are reported.

`pwsh -NoProfile -File scripts/test-bouncycastle-test-graph.ps1` checks the real dependency review in both task orders and verifies that unreviewed unit-test requests still fail. `pwsh -NoProfile -File scripts/test-host-advisory-alignment.ps1` checks the settings and Android result-listener graphs while proving unrelated runtime requests keep their original versions.

## License

[GPL-3.0](LICENSE), with the Morphe section 7 notices carried in [NOTICE](NOTICE). Telegram is a trademark of Telegram FZ-LLC.
