![HushMessenger. Keep the conversation. Cut the friction.](assets/readme-hero.png)

<p align="center">
  <a href="https://github.com/SysAdminDoc/HushMessenger/releases/tag/v0.7.0"><img src="https://img.shields.io/badge/version-0.7.0-0084FF" alt="Version 0.7.0"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL--3.0-blue" alt="License GPL-3.0"></a>
  <img src="https://img.shields.io/badge/platform-Android%209%2B%20arm64-3DDC84" alt="Platform Android 9 or newer, arm64">
  <img src="https://img.shields.io/badge/Messenger-580.0.0.49.91-0084FF" alt="Messenger 580.0.0.49.91">
  <img src="https://img.shields.io/badge/status-preview-8A2BE2" alt="Preview release">
</p>

# HushMessenger

HushMessenger is a Morphe patch source for Facebook Messenger. It offers 31 patches. 28 of them are optional controls with searchable settings and long-press shortcuts, and the other three help a re-signed build install, open and reach those settings. You bring the original Messenger APK. This repository provides the patch code and a `.mpp` bundle.

**[Add HushMessenger to Morphe Manager](https://morphe.software/add-source?github=SysAdminDoc%2FHushMessenger)**

> [!WARNING]
> **Preview release.** A signed-in S25 takes in-place updates with its existing Morphe key, and calls, notifications and chats work there. Fresh sign-in and encrypted-history recovery still need testing, and a clean install hasn't been retried since the blank-screen fix. Keep your signing key and make sure you can recover your chats before replacing a stock installation. See [Morphe's backup and keystore guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/backup-and-keystore.md).

## Get the preview

1. **Check the APK.** This patch targets arm64 Messenger 580.0.0.49.91, and all 21 arm64 builds APKMirror lists under that name work. The version name alone isn't enough, though, because the 32-bit builds share it and aren't supported. Check the version code on the download page against the [supported builds](#supported-messenger-builds) before you patch. [Build 346013440](https://www.apkmirror.com/apk/facebook-2/messenger/facebook-messenger-580-0-0-49-91-release/facebook-messenger-580-0-0-49-91-5-android-apk-download/) and [build 346013387](https://www.apkmirror.com/apk/facebook-2/messenger/facebook-messenger-580-0-0-49-91-release/facebook-messenger-580-0-0-49-91-11-android-apk-download/) are direct links. Build 346013370 is what Morphe's download link handed two people who reported it, and build 346013442 also comes from APKPure.
2. **Add the source.** Open the link above on Android with Morphe Manager installed. You can also open **Sources**, tap **+**, choose **Remote**, and enter `github.com/SysAdminDoc/HushMessenger`.
3. **Check the source.** The HushMessenger card should show **31 patches**. Open **Patches** to browse the catalog. Every patch is selected by default, so use **Choose patches** when preparing Messenger if you want to leave some out. Tap the card's refresh button if it stays on an old version.
4. **Choose one source.** Use the remote or local HushMessenger source. Adding both creates two cards with the same name, which can point to different versions. If other sources offer Messenger patches, choose the one you intend. Mixing independent patches can cause conflicts.

For a local source, download [`patches-0.7.0.mpp`](https://github.com/SysAdminDoc/HushMessenger/releases/tag/v0.7.0) and add it through **Sources > + > Local**. A local source won't update itself. The `.mpp` file is a patch bundle, not an installable Messenger APK. These source steps follow [Morphe's source guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md). Morphe Desktop can load the same source URL, and the command below lists its 31 entries. Source refreshes download patches. They do not modify an installed Messenger app. S25 runs a patched build, updated in place with its existing sign-in preserved. S22 now runs a patched build too.

### If something doesn't work

- **Can't find the settings:** Long-press the Messenger icon and tap **Patch controls**, or open **HushMessenger settings** from the app drawer. If you hid the drawer icon, or installed with Root Mount, which has none, the **HushMessenger** row in the Menu tab still opens them. If none of these appear, refresh the source and patch Messenger again.
- **Switches have no effect:** The settings must be embedded in the patched Messenger APK. A separate settings preview cannot change stock Messenger. Both test phones run patched builds with the embedded controls. Refreshing a Morphe source only downloads patches. Use **Restart Messenger** after changing inbox options or the Meta AI tab, which only changes on a restart, even when you pause.
- **Patch missing:** Refresh the HushMessenger source, check that it shows v0.7.0 and open its **Patches** list. This public release doesn't require the pre-release switch.
- **APK rejected:** Use an unmodified arm64 Messenger 580.0.0.49.91 APK. Every arm64 variant APKMirror has for that version works, and the version codes are listed under [Supported Messenger builds](#supported-messenger-builds). If a permission or instruction check fails, the error names the tested builds.
- **Android rejects installation over stock Messenger:** A re-signed APK can't replace Meta's signed copy. Keep your local data intact while you plan a backup. Future updates of your patched copy must reuse your key. See [Morphe's keystore guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/backup-and-keystore.md).
- **Local source still old:** Download the latest `.mpp` and replace the local source yourself.
- **"INSTALL_FAILED_VERSION_DOWNGRADE ... older than current 2147483647":** An earlier Messenger build from another patch set raised its version number to the maximum, and it was uninstalled with its data kept, so Android refuses anything lower. Remove the leftover data first. With a computer, run `adb uninstall com.facebook.orca`. Without one, install that earlier build again and uninstall it without keeping its data. Both wipe that old copy's local data, so back up what you need first.
- **Install blocked on a Galaxy phone:** Samsung's Auto Blocker only lets apps in from Galaxy Store and Google Play, and it also blocks commands sent over USB, so both Morphe Manager and `adb install` fail while it's on. Turn it off in **Settings > Security and privacy > Auto Blocker**, install the patched Messenger, then turn it back on. Google's Advanced Protection blocks installs from anywhere but the Play Store too. On a Galaxy phone it's under **Settings > Google > All services > Privacy & security > Advanced Protection**, and searching Settings for it works as well. Switch **Device protection** off for the install and back on afterwards. Both paths are from a Galaxy S22 on One UI 8.

The S22's stock Messenger 580 has a **Hide suggestions** action in the `People you may know` menu. Its **Open links in external browser** switch under **Me > Photos & media** works for the HTTP and HTTPS links we tested in an encrypted chat. Off opened Messenger's browser, and on opened Chrome. The original setting was restored afterward. Suggestion persistence, internal links and malicious-link warnings still need separate checks.

### Check a signed APK before installation

The repository includes a read-only installation check. It uses Android's `apksigner` to verify the candidate and installed APKs, compares the complete signer sets for the phone's Android version, and checks who owns the candidate's declared permissions. It checks every Android user for an existing installation. Source-stamp certificates aren't treated as app signers. It also catches version downgrades and checks the APK's arm64 libraries against the phone's memory page size. If Messenger was uninstalled with its data kept, the check reads the version code Android kept for it. When that's 2147483647, it tells you it's likely a leftover from another patch set's "Spoof package version" and points to the fix under **If something doesn't work**.

Use Python 3.11 or newer, JDK 21, Android SDK Build Tools (tested with 36.1.0), and an authorized ADB connection. Run this from the repository with the phone's exact serial from `adb devices`:

```powershell
python scripts/check_install.py --apk .\messenger-signed.apk --stock-apk .\messenger-stock.apk --serial YOUR_PHONE_SERIAL --build-tools "$env:LOCALAPPDATA\Android\Sdk\build-tools\36.1.0" --java "$env:JAVA_HOME\bin\java.exe"
```

The optional `--stock-apk` argument compares native library names and decompressed bytes against the exact stock hash listed below. Without it, the check reports that preservation hasn't been checked. Compressed libraries are allowed when Android extracts them. Libraries loaded directly from the APK must also have aligned ZIP entries.

Exit `0` means the certificate, downgrade and native-library checks passed. Exit `1` reports a signer or downgrade conflict, and exit `2` means a required check couldn't pass or finish. Different current certificates aren't approved through a possible rotation lineage. The check reads installed base APKs into a temporary directory, then deletes those local copies. It doesn't install, uninstall, clear data or change phone settings.

A successful check doesn't establish cross-app login, provider access or Messenger startup. Run it before planning an installation, and keep the installed app's data intact when it reports a conflict. See [Android's signing tool reference](https://developer.android.com/tools/apksigner).

## Find the settings

After installing Messenger with any optional HushMessenger control, **long-press Messenger's icon**. Choose **Patch controls** to open settings, or **Restart Messenger** to apply changes that need a fresh process. Both shortcuts work with Messenger's alternate icons. Your launcher may show fewer contact shortcuts when these actions are present.

You can also open **app drawer > HushMessenger settings**, or tap the **HushMessenger** row right under Settings in Messenger's **Menu** tab. If you'd rather not have the extra icon, turn on **App > Hide app drawer icon**. The long-press shortcut and the Menu tab row keep working. The switch only appears when the Menu tab row is there, so there's always a way back in, and the icon returns by itself if a later patch leaves that row out.

On a Morphe Manager **Root Mount** install, Android keeps stock Messenger's list of screens, so there's no drawer icon to open or hide. Both long-press shortcuts and the Menu tab row still work. If you picked one of Messenger's alternate app icons, though, its long-press menu won't have them, because Android reads that icon's shortcuts from the stock list too. Use the Menu tab row there. Settings open inside one of Messenger's own screens, and the switches read the controls you patched from the app itself, so they work the same as on a normal install. The patch checks both of those stock screens and stops with an error if a build changes either one. Inside settings, **App > Restart Messenger** provides the same restart action. It saves the latest choices before restarting the main app process. If saving fails, you'll see an error and Messenger stays open. Restarting doesn't clear app data.

The **Controls** tab has **All**, **Inbox**, **Chats** and **More** filters. Use **Find a control** to search within the selected category. The setup panel shows how many controls are enabled and whether changes are paused. Only features selected when patching appear here. Each switch starts off, and **Pause all changes** restores stock behavior without forgetting your choices. A switch that's on shows when Messenger last checked it since starting, which happens each time the screen or event it covers comes up, whether or not there was anything to change. **Nothing to change yet** only means that screen or event hasn't come up yet, like a link you haven't tapped or a business chat you haven't opened. If a switch's code fails inside Messenger, its line says **Stopped with an error** instead, until the next time it works. Use **Restart Messenger** after changing inbox options or the Meta AI tab, which only changes on a restart, even when you pause.

| Patch / switch | What it changes |
| --- | --- |
| Hide inbox ads | Filters Messenger's typed inbox ad cards. Meta stopped selling Messenger inbox ads in November 2025, so it's a guard in case they come back. |
| Hide People You May Know | Removes suggested people from chats (the end of the chat list too), search and stories, and from the People and Notifications tabs. |
| Hide friend request cards | Hides inbox cards without accepting or rejecting requests. |
| Hide growth prompts | Removes the inbox's add-more-people promotion unit. It also hides the tip sheets notes pop up, like **Make my notes public** and **Add lyrics to your music note**, and the **Share your own story** card after someone else's stories. |
| Hide inbox promotions | Hides quick-promotion banners in the chat list. |
| Hide stories and notes | Hides the horizontal tray above chats. |
| Hide inbox tabs | Hides the Home and Channels subtabs. |
| Hide Facebook shortcuts | Removes Facebook toolbar, profile and sharing shortcuts, and the "Also from Meta" section in the Menu tab (Muse, Subscriptions, Facebook Reels and the rest). |
| Hide Meta AI | Hides the floating button, toolbar button, AI menu entries and the Meta AI tab some accounts get in the bottom bar, plus the "Ask Meta AI" button in search and the AI agent behind it. People, message and group results still show, and existing AI chats stay available. The tab changes after **Restart Messenger**. |
| Hide Chat Moments | Removes Chat Moments from the menu. |
| Hide Reels badge | Hides the Reels notification badge. |
| Hide AI sticker tools | Hides the generated-sticker tab and AI sticker suggestions. |
| Hide avatar stickers | Hides the avatar tab in the sticker keyboard, including Messenger's newer keyboard. |
| Hide chat promotions | Hides quick-promotion banners inside conversations. |
| Hide business reply suggestions | Hides suggested replies in business chats. |
| Hide business typing suggestions | Hides business suggestions as you type. |
| Hide event prompts | Hides event quick-promotion prompts inside chats. |
| Hide typing indicator | Stops others from seeing that you're typing, including in end-to-end encrypted chats. |
| Hide read receipts | Stops sending your read receipts. In end-to-end encrypted chats, a chat you open stays unread until you reply or turn the switch off. |
| View stories anonymously | Opens other people's stories without adding you to their viewer list. Stories you open this way still show as seen on the People tab and in the story viewer, so new ones stay easy to spot. The ring in your chat list still shows them as new. |
| Save any story | Adds **Save** to the **More options** menu on other people's stories, the same item Messenger only shows on your own. The photo or video downloads to your phone the way your own stories do. A saved video lands in Movies/Messenger. |
| Keep unsent messages | Keeps messages other people unsend and marks them "[unsent]". It doesn't work in end-to-end encrypted chats, and your own unsend may be limited while it's on. |
| Allow screenshots | Lets you screenshot photos, media and video that Messenger protects in a chat, and stops it telling the other person you took a screenshot. View-once media stays protected. |
| Use system emoji | Draws emoji with your phone's font instead of Messenger's. Messenger's set stays if the phone has no emoji font. |
| Send photos at original quality | With HD on, a JPEG photo goes out with its own image data instead of Messenger's smaller re-encoded copy. Its metadata, such as location and camera details, is left out, as it is from Messenger's copy. Only the tag that turns a sideways photo upright stays. Photos over 20 MB and videos still get Messenger's compression. |
| Open web links externally | Uses the stock external-browser branch for HTTP and HTTPS. |
| Allow chat bubbles | Removes the low-memory gate on Android 11 or newer. Android permissions still apply. |
| Material You theme | In dark mode on Android 12 and newer, Messenger's blue takes the accent color Android picks from your wallpaper and its grays get a matching tint, with the same contrast as before. Android 11 gets a fixed blue palette. Black backgrounds and chat themes stay as they are, and so does light mode. Turn on dark mode in Messenger first. |

<p>
  <img src="assets/settings-dark.png" width="300" alt="Controls tab in the dark theme, with search and category filters">
  <img src="assets/settings-light.png" width="300" alt="Controls tab in the light theme, with search and category filters">
</p>

These screenshots come from the embedded settings in the S25's patched Messenger. The separate developer preview has no app-drawer entry and cannot change Messenger.

Settings use stable page and category IDs, so changing the language keeps navigation and saved choices intact. English is the fallback. The `en-XA` and `ar-XB` test languages expand or mirror the actual text, including accessible labels and count messages. Multi-digit numbers retain their reading order. The settings screen doesn't depend on Messenger's UI resource IDs. The launcher shortcuts add two string resources and preserve the existing resource values.

The settings screen is English only for now, and translations are welcome. A language is one Java table of text pairs, registered with one line in `SettingsTranslations.java` under `extensions/messenger`. It goes by Messenger's language, and a table for `pt` covers every region while `pt-BR` covers only Brazil. The table needs every text id from `SettingsText.java` plus each control's title and description, and it has to keep each `%s` or `%d` in place. You can move one around with `%1$s` and `%2$s`. A plain percent sign in a text id is written `%%`, while a control's title and description are shown as typed. `SettingsTranslationTest` fails the build if anything is missing or a placeholder changed, so you'll know before sending a pull request. Search still finds a control by its English name too.

The **App** tab starts with quick access and a restart button. Appearance and setup details follow. **Copy setup** copies the extension and host versions, Android version, pause state and each control's installed, selected and active flags. A control whose code failed gets one more line with the error's type, where in HushMessenger it happened and when, but never the error's message, since that could quote a chat. It excludes account details, chats, device identifiers and recovery material. Nothing is sent. You choose where to paste it. **Open** in the header returns to Messenger. Refreshing the source in Morphe downloads the patch bundle, but new controls only reach Messenger once you rebuild and install its APK.

<p>
  <img src="assets/settings-app-dark.png" width="300" alt="App tab in the dark theme with quick access, Restart Messenger and Hide app drawer icon">
  <img src="assets/settings-app-light.png" width="300" alt="App tab in the light theme">
</p>

The new inbox ad filter checks a current list-processing path instead of the absent old loader. It removes only `InboxAdsItem` objects and preserves other rows, including ordinary business conversations. Meta stopped selling ads in the Messenger inbox on November 11, 2025 and in Messenger Stories on August 27, 2026, which is likely why no test account has ever shown one. So there's nothing live to check it against, and the filter stays in case they return. It doesn't remove story ads. Messages from businesses you've subscribed to are ordinary chats and stay.

### Alerts from only some chats

Messenger and Android already handle this, so there's no HushMessenger switch for it. Do it in this order:

1. Open Messenger's app info, go to **Notifications**, and set **Chats** to **Silent**.
2. In each chat you still want alerts from, tap the chat's name, then **Notifications & sounds > Customize notifications**, and pick **Alert** (or **Priority**). The page will show **Silent** at this point, which is expected.

A chat only keeps its own setting once you change it, so doing step 1 first matters. Chats you haven't changed follow **Chats** and arrive quietly. On the S25, a chat set to **Alert** still alerted after **Chats** was silenced. Each chat's **Notifications & sounds** page also has separate switches for messages, reactions, chat heads and calls. On Samsung phones, Do not disturb's contact exceptions don't reliably match Messenger senders, so use the chat settings instead.

### Chat heads, photo quality and updates

Chat heads and updates need no patch. Photo quality has one switch on top of Messenger's own.

**Chat heads.** Turn them on in Messenger's **Settings > Chat heads**. Messenger then sends you to Android's **Appear on top** list, where you switch Messenger on. On Android 12 and newer you also need to set Messenger's battery use to **Unrestricted** (app info > **Battery**). Without that, Android won't let the chat head start while Messenger is in the background, and a new message only shows up as a notification. On the S22 (Android 16), heads appeared as soon as battery use was Unrestricted.

**Photo quality.** The gallery picker has an **HD** switch above your photos, and Messenger remembers it between sends. A 4032x3024 photo sent with HD off arrived at 2048x1536. With HD on it arrived at the full 4032x3024, but Messenger still re-encoded it on the phone first, so a 6.4 MB photo went out as about 1.8 MB.

Turn on **Send photos at original quality** and an HD photo goes out with its own image data instead. Sent that way between two accounts in an end-to-end encrypted chat, a 6.4 MB test photo arrived at full size, byte for byte the file on the phone (it had no metadata to leave out). The switch only takes JPEG photos up to 20 MB. Like Messenger's own copy, what it sends leaves out the photo's metadata: location, camera details, capture time, the embedded thumbnail and a motion photo's video clip. The color profile stays. Many phones save a portrait shot sideways with a tag that says which way is up, and that one tag stays too, so the photo still shows upright. Messenger's own copy turns the pixels instead. A sideways 4 MB test photo sent that way arrived upright and at full size in Messenger for Android, in the chat and in the saved file. Videos aren't affected.

**Update prompts.** You won't see Google Play's "update available" prompt in a patched Messenger. That check fails for apps Play didn't install. Phones that ship with Facebook App Manager (many Samsung models do) don't offer one either. With App Manager turned on, a patched Messenger showed no **App updates** row in its settings and no update offer, and a stock update couldn't install over it anyway because the signatures differ. To update, patch a newer supported build with the same key.

## What the patches change

The [patch catalog](patches-list.json) lists all 31 patches with their categories, default selections, dependency identities and supported-build details. It's generated locally from the built bundle and retains dependencies of hidden dependencies. Settings switches still start off, even when a patch is selected by default in Morphe.

### Independent optional controls

Each control is a separate patch. They share one settings extension, and manifest metadata records which controls were installed. Selecting one control only edits its hooks, and omitted controls have no active switches. Saved preferences remain available if you select the feature again later.

The full set checks 89 hook methods in each supported APK. Plugin gates must retain their expected enable/disable branch and return constants. The tab, browser, ad-filter, keyboard and typing edits check their specific instruction sites. Each control validates every target before editing its first method, and its settings entry is recorded only after success. A missing or ambiguous target stops that control. The settings provider is private, and its launcher accepts no external commands to change preferences. Since v0.5.0, Restart Messenger is private too, so only Messenger and its own launcher shortcuts can start it. v0.4.2 and earlier let other apps start it.

### Install beside Meta apps

The patch renames Messenger's two shared Meta signature permissions in declarations, requests, guarded components and six DEX string loads. It requires the original signature protection level and checks DEX sites before changing the manifest. It stops if those sites differ from the tested APK. Messenger's other cross-app signer checks, Facebook login and account switching still need separate verification.

Morphe groups these builds under one version name, so it may list the patch for another 580 APK. The patch checks the version code before changing anything and rejects any build that isn't listed under [Supported Messenger builds](#supported-messenger-builds).

If you patch both Messenger and [Hushfacebook](https://github.com/SysAdminDoc/Hushfacebook), sign them with the **same key**. Android grants shared signature permissions only when the apps are signed alike.

### Restore screens on re-signed builds

Always on. Messenger compares its own signing certificate with Meta's, and a re-signed build used to fail that check quietly and open to a blank screen. This patch answers Messenger's lookup of its own certificate with Meta's original one. On the S25, a fully patched build opens straight to the signed-in chat list.

It makes one more exception. When a Facebook signed with your same key calls into Messenger, for example to read Messenger's shared message keys, Messenger checks it as if it were Meta's own Facebook. That only happens while Facebook is the app on the other end of the call, its uid holds nothing but Facebook, and its current signing key matches Messenger's exactly. Meta's own rules still decide what it may read. Every other app, and a Facebook signed with a different key, gets the real answer. The App tab's **Copy setup** counts each outcome.

### Open settings from menu

Always on. It adds a **HushMessenger** row right under Settings in Messenger's **Menu** tab, and Settings still opens Messenger's own settings. Accounts that get Messenger's folder grid instead of the list use a separate path that no test account has shown yet.

## Supported Messenger builds

| Field | Value |
| --- | --- |
| Package | `com.facebook.orca` |
| Version | `580.0.0.49.91` |
| Version codes | `346013354`, `346013355`, `346013356`, `346013357`, `346013358`, `346013359`, `346013370`, `346013372`, `346013374`, `346013375`, `346013387`, `346013391`, `346013394`, `346013423`, `346013427`, `346013440`, `346013441`, `346013442`, `346013443`, `346013444`, `346013445` |
| Architecture | `arm64-v8a` |
| Minimum Android version | Android 9 (API 28) |
| APKMirror downloads | [All variants of 580.0.0.49.91](https://www.apkmirror.com/apk/facebook-2/messenger/facebook-messenger-580-0-0-49-91-release/). Every arm64 one works. |

APKMirror's 580.0.0.49.91 release has 25 variants, and all 21 arm64 ones are supported. Six are "nodpi" builds: `346013354` (a bundle), `346013370`, `346013387`, `346013394`, `346013423` and `346013440`. The other 15 are each made for one screen density, and `346013442` is also on APKPure. The four 32-bit (armeabi-v7a) variants aren't supported. Meta's build tooling gives the same code different internal names from one build to the next, so the patch keeps a checked list per naming. One list covers eight builds, and four more cover the other 13. A build that isn't listed here is rejected before anything changes. Builds `346013354` ([issue 3](https://github.com/SysAdminDoc/HushMessenger/issues/3)) and `346013370` ([issue 1](https://github.com/SysAdminDoc/HushMessenger/issues/1), [issue 8](https://github.com/SysAdminDoc/HushMessenger/issues/8)) were the first ones people ran into.

SHA-256 of the stock base APKs used for the off-device checks:

```text
346013387  128ec75e836f24328d2b28777091c03b20abba0adc536e7ee911ee5fe52e70bc
346013440  e7d3c64227a7d9a26adda4e89321a87a49c85ee9e9f28f2fa7ed7fa79ae15cf6
346013442  55636f34a49173f5607011a6dfdf635597f435047a8c105cb7fe420665a38c24
346013354  4f061acd57cbeb640fb547cb7191b18f0fea36df77a0f9ee01e8267ab6264c9d
346013370  c115c3fef9ceec8529f3c405db86b7222f6e29a6ff95e691edabd63641646355
346013394  668e1d5e129d2fc039e99a5ddc8f1106be5e4c70c8087e6b63345ea571836b84
346013423  868bdc3abb221b72ca05bce77b9870df79b706d8f5fdcde42ac5ff2f391f3e95
346013355  024d7f6923c7a02ea9d89ee37262a6da8e3d8b7bca2f038e9a05824ba4ae84fb
346013356  af9e358d89d56cd85ed88d359603e795ce644feda52af8b602c220011715b400
346013357  bd7227b3231cc3fe5a6029923bacb6275083b67746df10ee7b878e7b62da3215
346013358  a2cdf18e7af34288376cfd1f88f10c77e605ad3573e00b491362529ce324f856
346013359  e2df0d8811755dd54c3f8e190e5e6b30ec9071f166eb1035f793cfd3558dbab3
346013372  c60104bae063960517299116b6995aa82643b40c01d9084b67d67b67d824c921
346013374  f1c602a3a1626b44b09cf0e1522e9a52fb941c0fe0e9bb2f97d74c6031060658
346013375  c21514940c7b51e41d0f0f78d7deb8951c1f72bdf62eab619ec12e9e24455864
346013391  ccd1505d49858ebb06e0d63bc434d16c32b448ca194b690cc61b3190dc366f56
346013427  fdfbdd7344cd8f000d58dfb6687abaf2e92de2bec516282cb3a622e34711fa28
346013441  c9da455895a2f3b13f8eea566697e85a7a55986e8a9afc03c23763debe72bd77
346013443  5b53b33818e7b5378047581d5fe4aa4c8d93643cc7e1856359eb7a6b7e63042b
346013444  1a154fb73e4a3e26313972f0e40a878d22073ce89ae814028ac401be8ebeacbf
346013445  927a238854c21a8e23106a725c72a24c5d068b9190a73aff1b86002e878279e7
```

On Windows, compare your file with `Get-FileHash -Algorithm SHA256 .\messenger.apk`. Meta can publish different APKs under one version name. If the hash differs, don't assume the off-device result applies to your file. The patch also checks its permission layout and instruction sites.

## Verification and build

The S25 took each update in place with the same signing key as its installed Messenger and Facebook apps, keeping its original install date, its sign-in and 19 enabled controls. With the v0.5.0 patch code it passed voice calls, one-to-one notifications, silence for muted chats, facebook.com links opening the Facebook app, and a same-key update and rollback that kept all data. Turning switches on and off showed the expected change for Facebook shortcuts, stories and notes, the Meta AI button, the "Ask Meta AI" search button, People You May Know on the Notifications tab, external links, system emoji and the avatar sticker tab. A two-phone check in an end-to-end encrypted chat showed no typing indicator with the switch on and the usual one while paused, and messages still arrived. Restart Messenger refuses requests from other apps, while the long-press shortcut and the App tab button still restart into the signed-in chat list. At Android's largest font size the chat list, chats and settings stayed usable. The S22 now runs a patched build as well.

The local suite has 115 Kotlin tests, 297 Android unit tests and 44 Python checks. It covers separate patch selection, changed targets, feature availability, pause, saved choices, search and typed ad filtering. Release builds run locally. Android lint reports no errors and 11 warnings, including two package-visibility notices for queries restricted to this app.

For v0.7.0, Morphe Desktop 1.18.0 applied all 31 patches, Material You included, to private copies of one build from each of the five naming groups (`346013440`, `346013372`, `346013423`, `346013357` and `346013374`), and Android verified their v3 signatures. Two clean release builds, one of them from a fresh checkout, produced the same bundle checksum. The three rebuilt v0.5.0 APKs kept their 13 compressed arm64 libraries byte for byte, with 16KB minimum ELF load alignment. A changed permission fixture stopped before output, and continued exports left failed People methods and permission declarations untouched. The earlier v0.2.0 single-control S25 build selected only **Hide People You May Know**: it changed exactly the two expected host methods, added settings once and recorded only that feature. The original signature-permission patch wasn't selected or applied in that check. On 2026-09-30, builds `346013394` and `346013423` took all 27 patches in Desktop 1.17.0 too, and both outputs passed Android's v3 signature check and 16KB alignment. Later that day the 14 single-density builds did the same. Every one of the 21 builds has a committed hook record from `scripts/CompatReport.java`, and a test fails the build if a record and the patch code disagree.

The settings screens now run inside the patched Messenger on the S25, where both pages and themes were checked. Earlier checks used a clearly marked standalone UI preview, removed after each run, and the mirrored test language preserved multi-digit counts there. Automated tests cover API 28 and 36, short windows at 200% text, state restoration and accessible actions. These checks verify settings behavior. Live TalkBack speech hasn't been tested yet.

Before patching, the stock apps on S22 and S25 exchanged messages between two owned accounts in an end-to-end encrypted chat, and both phones showed the messages and read receipts. HTTP and HTTPS link tests on S22 confirmed the stock external-browser switch works.

To inspect the source with Morphe Desktop 1.17.0, set `JAVA_HOME` to a JDK 21 or newer:

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar morphe-desktop-1.17.0-all.jar list-patches --patches https://github.com/SysAdminDoc/HushMessenger --filter-package-name com.facebook.orca
```

This command lists patches. Source updates and Messenger installation are separate steps.

To build the bundle on Windows, use JDK 21, Android SDK 36 and the Gradle wrapper. Set `ANDROID_HOME` to your SDK directory. The Morphe Gradle plugin needs GitHub Packages credentials:

```powershell
$env:GITHUB_ACTOR = gh api user --jq .login
$env:GITHUB_TOKEN = gh auth token
.\gradlew.bat :patches:clean :extensions:messenger:clean :patches:test :patches:check :extensions:messenger:testDebugUnitTest :extensions:messenger:lintRelease :patches:buildAndroid --no-daemon
python -m unittest discover -s scripts/tests -v
```

The output is `patches/build/libs/patches-0.7.0.mpp`. Dependency locks and SHA-256 checks are committed. Review both when changing a dependency. Clean builds from the same source produce the same bundle checksum.

After changing patch metadata, run `:patches:generatePatchCatalog` and review `patches-list.json`. The normal `:patches:check` task checks the committed catalog against the built bundle and checks all 28 control keys against the extension and manifest. It fails on drift instead of rewriting the catalog.

Before publishing, synchronize the release version, source index, changelog and README checksum, then run `:patches:verifyReleaseMetadata`. This loads fresh bundle metadata and checks its checksum against the release files. To check a proposed tag and checksum asset too, run `python scripts/check_release.py --release-tag v0.7.0 --checksums SHA256SUMS.txt` after the Gradle check. Catalog evidence is bound to the exact bundle hash. Then sign the checksum file with `ssh-keygen -Y sign -f <release key> -n hushmessenger-release SHA256SUMS.txt`, attach `SHA256SUMS.txt.sig` next to it, and run the same command with `--verify-signature` added. That checks the signature against `scripts/release_signers`.

### Check the bundle

The [v0.7.0 release](https://github.com/SysAdminDoc/HushMessenger/releases/tag/v0.7.0) includes a `SHA256SUMS.txt` file. Compare its `.mpp` hash with your download. You can also build the tagged source locally and compare the output. Bundles up to v0.4.2 copied LICENSE and NOTICE with the line endings of the checkout they were built from, so a fresh clone of those tags can differ in those two files. Newer source normalizes them. The checksum and bundle are hosted under the same GitHub account, so this check cannot independently rule out an account compromise.

```text
fd45437062e0892b34c84cbaeb34842d5dcb4818a5d43df53420e82d42be804d  patches-0.7.0.mpp
```

Morphe Manager 1.32.0 and Desktop 1.17.0 parse `signature_download_url` but do not verify a detached signature when importing patch bundles. An `.asc` link in the source index would not add automatic protection in those versions. Keep the source URL on the repository you trust, and review a new bundle before updating.

Starting with v0.7.0, `SHA256SUMS.txt` comes with `SHA256SUMS.txt.sig`, an SSH signature made with the project's release key. The key's fingerprint is `SHA256:Z+UfHy7IUbtgNRO/wHkIr68+u4I+SIKPY9avfx/VAPU` and its public half is in [`scripts/release_signers`](scripts/release_signers). Manager and Desktop don't check this signature, so checking it is up to you. You need OpenSSH 8.1 or newer, which Windows 10 and later already include, as do macOS and most Linux systems. Download both files and `scripts/release_signers` from the same tag, then run this in a terminal (in PowerShell, wrap it in `cmd /c "..."`, since PowerShell has no `<`):

```text
ssh-keygen -Y verify -f release_signers -I SysAdminDoc -n hushmessenger-release -s SHA256SUMS.txt.sig < SHA256SUMS.txt
```

An untouched file prints `Good "hushmessenger-release" signature for SysAdminDoc` and the key's fingerprint. Compare that fingerprint with one you got earlier, like from a clone you already had. The private key lives only on the maintainer's PC and never on GitHub, so a matching signature still means something if the GitHub account is ever taken over. If the key ever changes, the CHANGELOG will say so and why.

## Research and credits

The [research snapshot](https://github.com/SysAdminDoc/HushMessenger/blob/015654380957d775f95b9f1c7871e91452d6216a/RESEARCH.md) compares Messenger patches in Morphe, ReVanced, De-Vanced and other projects. The remaining checks are summarized below. [Hushfeed](https://github.com/SysAdminDoc/hushfeed) is another Hush patch project.

HushMessenger starts from the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). Messenger hook definitions come from [De-Vanced](https://github.com/RookieEnough/De-Vanced), including its ReVanced contributions, and [Doom's patches](https://github.com/rushiranpise/morphe-patches). The typed ad-filter approach follows [Messenger Cleaner](https://github.com/N01-r0/messenger-cleaner-lsposed), with its MIT notice retained. The bubble eligibility anchor originated in [ChatHeadEnabler](https://github.com/NeonOrbit/ChatHeadEnabler). The permission approach is adapted from [Hushfacebook's shared-permission patch](https://github.com/SysAdminDoc/Hushfacebook/blob/15b8e9ed9315464a3e2d1a821b4e26ad47bbc28c/patches/src/main/kotlin/app/morphe/patches/facebook/coexist/SharedPermissions.kt). Source is under [GPL-3.0](LICENSE), and [NOTICE](NOTICE) has the details. HushMessenger is independent of Meta and Morphe.

## Remaining checks

- Fresh-install startup and encrypted-history recovery still need dedicated checks. The existing signed-in S25 installation passes updates and restarts.
- Signing in to Messenger with **Continue as** through a patched Facebook app fails on the Facebook side. The fix belongs in [Hushfacebook](https://github.com/SysAdminDoc/Hushfacebook).
- Builds `346013354`, `346013370`, `346013394` and `346013423` patch cleanly with every patch, but neither test phone could install them, because both run newer Messenger builds. They haven't been tried on a phone yet.
- Inbox tabs, bubbles on a low-memory phone, group chat notifications, typing in encrypted group chats and a live screenshot notice haven't been checked on a phone yet. Structural APK checks don't establish those behaviors.
- Keep unsent messages can't cover end-to-end encrypted chats. Messenger removes those messages below the part of the app HushMessenger can change.

<p align="center">
  <a href="https://ko-fi.com/X8K126YVER"><img height="42" src="https://storage.ko-fi.com/cdn/kofi2.png?v=3" alt="Buy me a coffee on Ko-fi"></a>
</p>
