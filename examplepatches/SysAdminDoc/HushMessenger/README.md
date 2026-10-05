![HushMessenger. Keep the conversation. Cut the friction.](assets/readme-hero.png)

<p align="center">
  <a href="https://github.com/SysAdminDoc/HushMessenger"><img src="https://img.shields.io/badge/development-0.20.1-0084FF" alt="Development 0.20.1"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL--3.0-blue" alt="License GPL-3.0"></a>
  <img src="https://img.shields.io/badge/platform-Android%209%2B%20arm64-3DDC84" alt="Platform Android 9 or newer, arm64">
  <img src="https://img.shields.io/badge/Messenger-580%20and%20581-0084FF" alt="Messenger 580.0.0.49.91 and 581.0.0.49.91">
  <img src="https://img.shields.io/badge/status-preview-8A2BE2" alt="Preview release">
</p>

# HushMessenger

HushMessenger is a Morphe patch source for Facebook Messenger. It offers 33 patches. 30 of them are optional controls with searchable settings and long-press shortcuts, and the other three help a re-signed build install, open and reach those settings. You bring the original Messenger APK. This repository provides the patch code and a `.mpp` bundle.

The source builds development v0.20.1. The public download and Morphe source serve v0.14.0. Development adds Messenger 581.0.0.49.91, every arm64 build APKMirror lists under that name. Settings give each control's full row one accessible touch target. Development also extends AI sticker hiding to Generate buttons and screenshot access to view-once media and Quicksnap. Hide joined community chats now removes joined channels and announcements from the main Chats display. It starts off and keeps the original list for Off or Pause. Changes apply on the next inbox render.

v0.14.0 adds **Native Bubbles** to **Allow chat bubbles** ([#19](https://github.com/SysAdminDoc/HushMessenger/issues/19)) and **Slide chats in and out**, an optional slide for chats you open from the chat list or search ([#28](https://github.com/SysAdminDoc/HushMessenger/issues/28)). Settings now open from Messenger's side menu as well as its Menu tab ([#26](https://github.com/SysAdminDoc/HushMessenger/issues/26)), and **Use system emoji** draws your phone's own emoji on Android 12 and newer ([#25](https://github.com/SysAdminDoc/HushMessenger/issues/25)). On Root Mount installs, HushMessenger adds the **Patch controls** and **Restart Messenger** shortcuts itself, because Android never reads the patched ones there ([#27](https://github.com/SysAdminDoc/HushMessenger/issues/27)). The [changelog](CHANGELOG.md) has the rest.

**[Add HushMessenger to Morphe Manager](https://morphe.software/add-source?github=SysAdminDoc%2FHushMessenger)**

> [!WARNING]
> **Preview release.** Signed-in Samsung installations take in-place updates with their existing Morphe keys. Calls, notifications and chats have passed hardware checks. A signed-in Facebook SSO read passed on 2026-09-29. Fresh password sign-in had succeeded by 2026-10-03. **Continue as** and encrypted-history recovery still need separate checks. Keep your signing key and recovery material. See [Morphe's backup and keystore guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/backup-and-keystore.md).

## Get the preview

1. **Check the APK.** This patch targets arm64 Messenger 580.0.0.49.91, and all 21 arm64 builds APKMirror lists under that name work. The version name alone isn't enough, though, because the 32-bit builds share it and aren't supported. Check the version code on the download page against the [supported builds](#supported-messenger-builds) before you patch. [Build 346013440](https://www.apkmirror.com/apk/facebook-2/messenger/facebook-messenger-580-0-0-49-91-release/facebook-messenger-580-0-0-49-91-5-android-apk-download/) and [build 346013387](https://www.apkmirror.com/apk/facebook-2/messenger/facebook-messenger-580-0-0-49-91-release/facebook-messenger-580-0-0-49-91-11-android-apk-download/) are direct links. Build 346013370 is what Morphe's download link handed two people who reported it, and build 346013442 also comes from APKPure.
2. **Add the source.** Open the link above on Android with Morphe Manager installed. You can also open **Sources**, tap **+**, choose **Remote**, and enter `github.com/SysAdminDoc/HushMessenger`.
3. **Check the source.** The HushMessenger card should show **32 patches**. Open **Patches** to browse the catalog. **Material You theme** starts unselected when patching. Use **Choose patches** to include it or leave other controls out. Tap the card's refresh button if it stays on an old version.
4. **Choose one source.** Use the remote or local HushMessenger source. Adding both creates two cards with the same name, which can point to different versions. If other sources offer Messenger patches, choose the one you intend. Mixing independent patches can cause conflicts.

For a local source, download [`patches-0.14.0.mpp`](https://github.com/SysAdminDoc/HushMessenger/releases/tag/v0.14.0) and add it through **Sources > + > Local**. A local source won't update itself. The `.mpp` file is a patch bundle, not an installable Messenger APK. These source steps follow [Morphe's source guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md). Morphe Desktop can load the same source URL, and the command below lists its 32 entries. Source refreshes download patches. They don't modify an installed Messenger app. Test phones have taken patched updates in place with their sign-in kept.

### If something doesn't work

The **HushMessenger settings** icon belongs to the same installed app as Messenger. Uninstalling either icon removes Messenger and its local data. Use **App > Hide app drawer icon** to hide only the settings entry. Refs [#26](https://github.com/SysAdminDoc/HushMessenger/issues/26).

- **Can't find the settings:** Long-press Messenger's icon on your home screen (not the Messenger title inside the app) and tap **Patch controls**. Bundles with a settings launcher alias also offer **HushMessenger settings** in the app drawer. The Menu tab or side menu has a **HushMessenger** row when that patch is included. **Hide app drawer icon** appears in App only when both the alias and Menu route are available. Root Mount has no separate icon. App explains missing routes, and searching for "drawer icon" links to that explanation or toggle. If none of the entry routes appear, refresh the source and patch Messenger again.
- **Switches have no effect:** The settings must be embedded in the patched Messenger APK. A separate settings preview cannot change stock Messenger. Both test phones run patched builds with the embedded controls. Refreshing a Morphe source only downloads patches. Use **Restart Messenger** after changing inbox options or the Meta AI tab, which only changes on a restart, even when you pause.
- **Patch missing:** Refresh the HushMessenger source, check that it shows v0.14.0 and open its **Patches** list. This public release doesn't require the pre-release switch.
- **APK rejected:** Use an unmodified arm64 Messenger 580.0.0.49.91 APK. Every arm64 variant APKMirror has for that version works, and the version codes are listed under [Supported Messenger builds](#supported-messenger-builds). If a permission or instruction check fails, the error names the tested builds.
- **Android rejects installation over stock Messenger:** A re-signed APK can't replace Meta's signed copy. Keep your local data intact while you plan a backup. Future updates of your patched copy must reuse your key. See [Morphe's keystore guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/backup-and-keystore.md).
- **Local source still old:** Download the latest `.mpp` and replace the local source yourself.
- **"INSTALL_FAILED_VERSION_DOWNGRADE ... older than current 2147483647":** Another patch set may have raised Messenger's version code to Android's maximum. Android can retain that code even after an installation was removed with its data kept. Preserve the retained data and signing key. An in-place update needs the same key and a code at least as high as the retained one, with a supported Messenger build underneath. HushMessenger doesn't provide a migration for this case yet. Don't uninstall or clear data to make the installation check pass.
- **Patching stalls with Material You selected (#18):** Bundles through v0.7.0 can exhaust a 1024 MB heap. Refresh the source to v0.8.0 or newer, which passed all 21 supported builds at that limit. If you need to stay on an older bundle, deselect **Material You theme** and patch again. See [issue #18](https://github.com/SysAdminDoc/HushMessenger/issues/18).
- **Install blocked on a Galaxy phone:** Samsung's Auto Blocker only lets apps in from Galaxy Store and Google Play, and it also blocks commands sent over USB, so both Morphe Manager and `adb install` fail while it's on. Turn it off in **Settings > Security and privacy > Auto Blocker**, install the patched Messenger, then turn it back on. Google's Advanced Protection blocks installs from anywhere but the Play Store too. On a Galaxy phone it's under **Settings > Google > All services > Privacy & security > Advanced Protection**, and searching Settings for it works as well. Switch **Device protection** off for the install and back on afterwards. Both paths are from a Galaxy S22 on One UI 8.

A Galaxy S22's stock Messenger 580 has a **Hide suggestions** action in the `People you may know` menu. Its **Open links in external browser** switch under **Me > Photos & media** works for the HTTP and HTTPS links we tested in an encrypted chat. Off opened Messenger's browser, and on opened Chrome. The original setting was restored afterward. Suggestion persistence and internal links still need separate checks. Static tracing of ordinary message links in build 346013440 shows its external branch launches before Messenger's native browser warning. Keep the external preference off to use Messenger's in-app warning flow. Live malicious-link warnings remain unverified.

### Check a signed APK before installation

The repository includes a read-only installation check. It uses Android's `apksigner` to verify the candidate and installed APKs, compares the complete signer sets for the phone's Android version, and checks who owns the candidate's declared permissions. It checks every Android user for an existing installation. Source-stamp certificates aren't treated as app signers. It also catches version downgrades and checks the APK's arm64 libraries against the phone's memory page size. If Android retained Messenger's data after removal, the check reads its retained version code. A code of 2147483647 points to the data-preserving guidance under **If something doesn't work**.

Use Python 3.11 or newer, JDK 21, Android SDK Build Tools (tested with 36.1.0), and an authorized ADB connection. Run this from the repository with the phone's exact serial from `adb devices`:

```powershell
python scripts/check_install.py --apk .\messenger-signed.apk --stock-apk .\messenger-stock.apk --serial YOUR_PHONE_SERIAL --build-tools "$env:LOCALAPPDATA\Android\Sdk\build-tools\36.1.0" --java "$env:JAVA_HOME\bin\java.exe"
```

The optional `--stock-apk` argument compares native library names and decompressed bytes against the exact stock hash listed below. Without it, the check reports that preservation hasn't been checked. Compressed libraries are allowed when Android extracts them. Libraries loaded directly from the APK must also have aligned ZIP entries.

Exit `0` means the certificate, downgrade and native-library checks passed. Exit `1` reports a signer or downgrade conflict, and exit `2` means a required check couldn't pass or finish. Different current certificates aren't approved through a possible rotation lineage. The check reads installed base APKs into a temporary directory, then deletes those local copies. It doesn't install, uninstall, clear data or change phone settings.

A successful check doesn't establish cross-app login, provider access or Messenger startup. Run it before planning an installation, and keep the installed app's data intact when it reports a conflict. See [Android's signing tool reference](https://developer.android.com/tools/apksigner).

## Find the settings

After three crashes near startup, safe mode pauses the controls and keeps your choices. Open settings and tap **Resume** to use those choices again. If **Pause all changes** is on, tap **Clear safe mode** first, then turn Pause off when you're ready. Crash-record saves verify the replacement before committing it and retain the previous record on an interrupted write. Android 9 and 10 also check that the backup succeeded before writing. If saving the recovery state fails, settings report the failure and keep changes paused so you can try again. A successful recovery restores the saved theme immediately. Invalid preference types keep startup disabled. The records and preferences are separate saves.

After installing Messenger with any optional HushMessenger control, **long-press Messenger's icon on your home screen**. Choose **Patch controls** to open settings, or **Restart Messenger** to apply changes that need a fresh process. Both shortcuts work with Messenger's alternate icons. Your launcher may show fewer contact shortcuts when these actions are present.

If the launcher alias is installed, **app drawer > HushMessenger settings** opens the same screen. The Menu tab also has a **HushMessenger** row when its patch is included. **App > Hide app drawer icon** appears only when both routes are installed. A disabled alias still counts as installed, so you can turn the icon back on. If a later patch leaves the Menu row out, the icon returns. Search for **drawer icon** in Controls to reach the toggle or the explanation of your available routes.

On a Morphe Manager **Root Mount** install, Android keeps stock Messenger's list of screens, so there's no drawer icon to open or hide. Android doesn't read the patched long-press shortcuts there either, so HushMessenger adds **Patch controls** and **Restart Messenger** to the icon's long-press menu itself once Messenger has started. Messenger's recent-chat shortcuts can push them out, and the next start puts them back. The Menu tab and side menu rows work too. If you picked one of Messenger's alternate app icons, its long-press menu won't have the two shortcuts, so use the Menu tab or side menu row there. Settings open inside one of Messenger's own screens, and the switches read the controls you patched from the app itself, so they work the same as on a normal install. The patch checks both of those stock screens and stops with an error if a build changes either one. Inside settings, **App > Restart Messenger** provides the same restart action. It saves the latest choices before restarting the main app process. If saving fails, you'll see an error and Messenger stays open. Restarting doesn't clear app data.

The **Controls** tab has **All**, **Inbox**, **Chats** and **More** filters. Use **Find a control** to search within the selected category. The setup panel shows how many controls are enabled and whether changes are paused. Only features selected when patching appear here. Each switch starts off, and **Pause all changes** restores stock behavior without forgetting your choices. A switch that's on shows when Messenger last checked it since starting, which happens each time the screen or event it covers comes up, whether or not there was anything to change. **Nothing to change yet** only means that screen or event hasn't come up yet, like a link you haven't tapped or a business chat you haven't opened. If a switch's code fails inside Messenger, its line says **Stopped with an error** instead, until the next time it works. Paused choices say **Changes paused**. These labels refresh when you return to settings, and TalkBack reads the status with the switch. Use **Restart Messenger** after changing inbox options or the Meta AI tab, which only changes on a restart, even when you pause.

| Patch / switch | What it changes |
| --- | --- |
| Hide inbox ads | Filters Messenger's typed inbox ad cards. Meta stopped selling Messenger inbox ads in November 2025, so it's a guard in case they come back. |
| Hide joined community chats | Development only. Hides joined channels and announcements from the main Chats list (the All chip) on its next render. Other chips such as Channels, search, community folders and the original unread counts keep every row. |
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
| Hide AI sticker tools | Hides the generated-sticker tab and AI sticker suggestions. The development source also hides the Generate buttons in the sticker keyboard. |
| Hide avatar stickers | Hides the avatar tab in the sticker keyboard, including Messenger's newer keyboard. |
| Hide chat promotions | Hides quick-promotion banners inside conversations. |
| Hide business reply suggestions | Hides suggested replies in business chats. |
| Hide business typing suggestions | Hides business suggestions as you type. |
| Hide event prompts | Hides event quick-promotion prompts inside chats. |
| Hide typing indicator | Stops others from seeing that you're typing, including in end-to-end encrypted chats. |
| Hide read receipts | Stops sending read receipts. Opened encrypted chats can stay unread on this phone. Replying or switching this off may notify the sender. Group coverage isn't verified. |
| View stories anonymously | Opens other people's stories without adding you to their viewer list. Stories you open this way still show as seen on the People tab and in the story viewer, so new ones stay easy to spot. The ring in your chat list still shows them as new. |
| Save any story | Adds **Save** to the **More options** menu on other people's stories, the same item Messenger only shows on your own. The photo or video downloads to your phone the way your own stories do. A saved video lands in Movies/Messenger. |
| Keep unsent messages | Keeps messages on verified legacy unsend routes and marks them "[unsent]". End-to-end encrypted chats aren't supported, and group coverage isn't verified. Your own unsend may be limited while it's on. |
| Allow screenshots | Lets you screenshot photos, media and video that Messenger protects in a chat, and stops screenshot notices. The development source also covers view-once media and Quicksnap. |
| Use system emoji | Draws emoji with your phone's own emoji set instead of Messenger's on Android 12 and newer. Android 9 to 11 get Android's standard emoji. Messenger's set stays if the phone has no emoji font. |
| Send photos at original quality | With HD on, a JPEG photo goes out with its own image data instead of Messenger's smaller re-encoded copy. Its metadata, such as location and camera details, is left out, as it is from Messenger's copy. Only the tag that turns a sideways photo upright stays. Photos over 20 MB and videos still get Messenger's compression. |
| Open web links externally | Uses the stock external-browser branch for HTTP and HTTPS. |
| Slide chats in and out | Slides a chat in from the side when you open it from the chat list or search, and back out when you go back, while the screen underneath holds still. Right-to-left languages slide from the left. Chat heads and bubbles keep their own animations, and Android's **Remove animations** setting turns this off too. |
| Allow chat bubbles | Settings offer Stock, Chat Heads and Native Bubbles on Android 11 or newer when the host routes are verified. Native mode uses Messenger's conversation notifications and keeps its account eligibility check. Android permissions still apply. |
| Material You theme | In dark mode on Android 12 and newer, Messenger's blue takes the accent color Android picks from your wallpaper and its grays get a matching tint, with the same contrast as before. Android 11 gets a fixed blue palette. Black backgrounds and chat themes stay as they are, and so does light mode. Turn on dark mode in Messenger first. |

**Keep unsent activity:** **No unsend activity observed since restart** means that no legacy unsend with a message identifier has been intercepted in this process. The switch stays on across restarts. Reading an ordinary message or an older retained message doesn't advance the counter. A use timestamp records an interception, not proof that an encrypted or group chat is supported. Restarting alone does not generate an unsend event.

The local unsent-marker list holds up to 4,096 message IDs. Recording another ID at the limit drops an existing marker. This doesn't delete any message content.

**Local unread state:** **Hide read receipts** also leaves opened encrypted chats unread on this phone. It doesn't offer a separate local **Mark as read** action. Replying or turning the control off follows Messenger's receipt path and may notify the sender. Group coverage is unverified. See [issue #20](https://github.com/SysAdminDoc/HushMessenger/issues/20).

**App > Check for updates** is off by default. Enabling it checks GitHub and keeps only the validated release details locally. Settings and **Check now** reuse a result for an hour. A later request includes its ETag so an unchanged response can reuse those same details. If GitHub delays a check, settings show when you can try **Check now** again. Checks stop before that time. GitHub's quota reset only delays checks when that quota is exhausted. This follows [GitHub's retry guidance](https://docs.github.com/en/rest/using-the-rest-api/best-practices-for-using-the-rest-api#handle-rate-limit-errors-appropriately). The release page must match the reported tag. A development build ahead of the public release shows both versions. Turning the switch off or closing settings cancels pending replies and cache writes. A write already in progress can finish in the background without holding up the screen or replacing a newer result. GitHub receives your IP address and connection metadata, but the check uploads no account or chat content. Requests are unauthenticated, so an unchanged response doesn't promise a rate-limit exemption.

<p>
  <img src="assets/settings-dark.png" width="300" alt="Controls tab in the dark theme, with search and category filters">
  <img src="assets/settings-light.png" width="300" alt="Controls tab in the light theme, with search and category filters">
</p>

These screenshots were captured from v0.10.0 embedded settings on 2026-10-02. Both tabs and themes were also checked at 200% text size. The separate developer preview has no app-drawer entry and cannot change Messenger.

Settings use stable page and category IDs, so changing the language keeps navigation and saved choices intact. English is the fallback. The `en-XA` and `ar-XB` test languages expand or mirror the actual text, including accessible labels and count messages. Multi-digit numbers retain their reading order. The settings screen doesn't depend on Messenger's UI resource IDs. The launcher shortcuts add two string resources and preserve the existing resource values.

The settings screen is English only for now, and translations are welcome. A language is one Java table of text pairs, registered with one line in `SettingsTranslations.java` under `extensions/messenger`. It goes by Messenger's language, and a table for `pt` covers every region while `pt-BR` covers only Brazil. The table needs every text id from `SettingsText.java` plus each control's title and description, and it has to keep each `%s` or `%d` in place. You can move one around with `%1$s` and `%2$s`. A plain percent sign in a text id is written `%%`, while a control's title and description are shown as typed. `SettingsTranslationTest` fails the build if anything is missing or a placeholder changed, so you'll know before sending a pull request. Search still finds a control by its English name too.

The **App** tab starts with quick access and a restart button. Appearance and setup details follow. **Copy setup** copies the extension and host versions, Android version, pause state and each control's installed, selected and active flags. It includes each control's scope description and last recorded use. Recorded use means the control ran. It doesn't verify a visible effect or privacy protection. A control whose code failed gets one more line with the error's type, where in HushMessenger it happened and when, but never the error's message, since that could quote a chat. It excludes account details, chats, device identifiers and recovery material. Nothing is sent. You choose where to paste it. **Open** in the header returns to Messenger. Refreshing the source in Morphe downloads the patch bundle, but new controls only reach Messenger once you rebuild and install its APK.

<p>
  <img src="assets/settings-app-dark.png" width="300" alt="App tab in the dark theme with quick access, Restart Messenger and Hide app drawer icon">
  <img src="assets/settings-app-light.png" width="300" alt="App tab in the light theme">
</p>

The new inbox ad filter checks a current list-processing path instead of the absent old loader. It removes only `InboxAdsItem` objects and preserves other rows, including ordinary business conversations. Meta stopped selling ads in the Messenger inbox on November 11, 2025 and in Messenger Stories on August 27, 2026, which is likely why no test account has ever shown one. So there's nothing live to check it against, and the filter stays in case they return. It doesn't remove story ads. Messages from businesses you've subscribed to are ordinary chats and stay.

### Back up your choices

File operations show progress and a **Cancel file operation** action. An active save continues if you rotate the phone or close settings, then reports whether it finished. Closing settings cancels a restore. The original 30-second deadline still applies to both operations, including a save finishing in the background. If you cancel a save, save again before you rely on that file. If earlier operations haven't stopped, a message asks you to wait for the storage app. A restore won't replace choices you changed while the file was loading. Restore the file again if you want to apply it. A picker result that points at a private file is rejected. Saves also reject media entries owned by Messenger or whose ownership Android can't verify. Choose a new document in your storage app if that happens.

On the **App** tab, copy choices through the clipboard or use **Save choices to a file** and **Restore choices from a file**. Files use Android's picker and need no storage-wide permission. Both paths use UTF-8 with the exact `hushmessenger:choices:v1` header and a 16 KiB limit. The original `hushmessenger:choices` header is still accepted. A document's declared slice keeps its absolute start even if the storage app supplies an already positioned file. Invalid headers, duplicate keys, invalid booleans and oversized input leave everything unchanged. Omitted choices and choices absent from the installed bundle keep their saved values; unknown keys are reported separately. The backup contains installed control choices and Pause, with no chats, accounts, crash records or signing material. If settings reopen while the picker is active, choose the file again.

### Alerts from only some chats

Messenger and Android already handle this, so there's no HushMessenger switch for it. Do it in this order:

1. Open Messenger's app info, go to **Notifications**, and set **Chats** to **Silent**.
2. In each chat you still want alerts from, tap the chat's name, then **Notifications & sounds > Customize notifications**, and pick **Alert** (or **Priority**). The page will show **Silent** at this point, which is expected.

A chat only keeps its own setting once you change it, so doing step 1 first matters. Chats you haven't changed follow **Chats** and arrive quietly. On a Galaxy S25, a chat set to **Alert** still alerted after **Chats** was silenced. Each chat's **Notifications & sounds** page also has separate switches for messages, reactions, chat heads and calls. On Samsung phones, Do not disturb's contact exceptions don't reliably match Messenger senders, so use the chat settings instead.

### Chat heads, photo quality and updates

Messenger already has chat heads. Settings can also select its native Android bubble route. Photo quality has one switch on top of Messenger's own.

**Bubble modes.** **Stock** leaves Messenger's routing alone. **Chat Heads** selects its overlay route. Turn on Messenger's **Settings > Chat heads** and grant **Appear on top** if prompted. The checked Samsung Android 16 installation needed **Unrestricted** battery use for chat heads to arrive in the background. Other phones may differ.

**Native Bubbles** selects Messenger's existing conversation-notification route on Android 11 or newer. Your account must still qualify, and Android must allow Messenger's bubbles. Use **Android bubble settings** below the mode buttons. The general notification page on some Samsung phones doesn't expose that option. Settings also offer guarded links to the notification and conversation pages, with recovery guidance if the phone has no matching page. An incoming owned-message test passed on Samsung Android 16 using the native-route prototype. The v0.9.0 embedded build also opened that conversation as a bubble, collapsed to the home screen and restored stock routing while paused. Restart Messenger after switching modes. Turning the control off or pausing restores stock routing without forgetting the saved choice. Hosts without validated notification, shortcut and embedded-activity routes keep stock behavior. Custom-ROM and low-memory-phone behavior remain unverified. Android's touch protections are unchanged. See [Android's bubble requirements](https://developer.android.com/develop/ui/views/notifications/bubbles) and [issue #19](https://github.com/SysAdminDoc/HushMessenger/issues/19). v0.8.0 and earlier have the older eligibility control.

**Photo quality.** The gallery picker has an **HD** switch above your photos, and Messenger remembers it between sends. A 4032x3024 photo sent with HD off arrived at 2048x1536. With HD on it arrived at the full 4032x3024, but Messenger still re-encoded it on the phone first, so a 6.4 MB photo went out as about 1.8 MB.

Turn on **Send photos at original quality** and an HD photo goes out with its own image data instead. Sent that way between two accounts in an end-to-end encrypted chat, a 6.4 MB test photo arrived at full size, byte for byte the file on the phone (it had no metadata to leave out). The switch only takes JPEG photos up to 20 MB. Like Messenger's own copy, what it sends leaves out the photo's metadata: location, camera details, capture time, the embedded thumbnail and a motion photo's video clip. The color profile stays. Many phones save a portrait shot sideways with a tag that says which way is up, and that one tag stays too, so the photo still shows upright. Messenger's own copy turns the pixels instead. A sideways 4 MB test photo sent that way arrived upright and at full size in Messenger for Android, in the chat and in the saved file. Videos aren't affected.

The 20 MB limit also applies while reading, copying and handing off the prepared photo. A source that grows or is replaced can't slip through an earlier size check. If preparation fails, Messenger keeps its normal photo route. If a queued prepared copy becomes too large, its callback reports failure. Cleanup removes only that new copy and leaves the source and earlier copies alone.

**Store updates.** The checked Samsung installation didn't show an **App updates** row or a store update offer, including with Facebook App Manager enabled. A Meta-signed APK can't replace a Morphe-signed installation because its key differs. Update your patched copy with a supported build and the same signing key.

The closed [issue #22](https://github.com/SysAdminDoc/HushMessenger/issues/22) concerned **Update Messenger to see this message** placeholders in past voice and video call logs. Reporters confirmed normal display after a fresh installation. That report doesn't establish a store update offer or a general repair for encrypted history. HushMessenger doesn't bypass encryption or history recovery to reveal content.

## What the patches change

The [patch catalog](patches-list.json) lists all 33 development patches with their categories, default selections, dependency identities and supported-build details. It's generated locally from the built bundle and retains dependencies of hidden dependencies. Settings switches still start off, even when a patch is selected by default in Morphe.

### Independent optional controls

Each control is a separate patch. They share one settings extension, and manifest metadata records which controls were installed. Selecting one control only edits its hooks, and omitted controls have no active switches. Saved preferences remain available if you select the feature again later.

The development source checks 100 hook methods in each supported APK; public v0.14.0 checks 95. Plugin gates must retain their expected enable/disable branch and return constants. The tab, browser, ad-filter, keyboard and typing edits check their specific instruction sites. Each control validates every target before editing its first method, and its settings entry is recorded only after success. A missing or ambiguous target stops that control. Changed media-viewer or community code leaves unrelated controls available. The settings provider is private, and its launcher accepts no external commands to change preferences. Since v0.5.0, Restart Messenger is private too, so only Messenger and its own launcher shortcuts can start it. v0.4.2 and earlier let other apps start it.

### Install beside Meta apps

The patch renames Messenger's two shared Meta signature permissions in declarations, requests, guarded components and six DEX string loads. It requires the original signature protection level and checks DEX sites before changing the manifest. It stops if those sites differ from the tested APK. Messenger's other cross-app signer checks, Facebook login and account switching still need separate verification.

Morphe groups these builds under one version name, so it may list the patch for another 580 APK. The patch checks the version code before changing anything and rejects any build that isn't listed under [Supported Messenger builds](#supported-messenger-builds).

If you patch both Messenger and [Hushfacebook](https://github.com/SysAdminDoc/Hushfacebook), sign them with the **same key**. Android grants shared signature permissions only when the apps are signed alike.

### Restore screens on re-signed builds

Always on. Messenger compares its own signing certificate with Meta's, and a re-signed build used to fail that check quietly and open to a blank screen. This patch answers Messenger's lookup of its own certificate with Meta's original one. On a Galaxy S25, a fully patched build opens straight to the signed-in chat list.

It makes one more exception. When a Facebook signed with your same key calls into Messenger, for example to read Messenger's shared message keys, Messenger checks it as if it were Meta's own Facebook. That only happens while Facebook is the app on the other end of the call, its uid holds nothing but Facebook, and its current signing key matches Messenger's exactly. Meta's own rules still decide what it may read. Every other app, and a Facebook signed with a different key, gets the real answer. The App tab's **Copy setup** counts each outcome.

### Open settings from menu

Always on. It adds a **HushMessenger** row right under Settings in Messenger's **Menu** tab, and Settings still opens Messenger's own settings. Accounts that get Messenger's folder grid instead of the list use a separate path that no test account has shown yet.

## Supported Messenger builds

| Field | Value |
| --- | --- |
| Package | `com.facebook.orca` |
| Version | `580.0.0.49.91`, plus `581.0.0.49.91` in development builds |
| Version codes | `346013354`, `346013355`, `346013356`, `346013357`, `346013358`, `346013359`, `346013370`, `346013372`, `346013374`, `346013375`, `346013387`, `346013391`, `346013394`, `346013423`, `346013427`, `346013440`, `346013441`, `346013442`, `346013443`, `346013444`, `346013445` |
| 581 version codes | `346213494`, `346213498`, `346213510`, `346213514`, `346213528`, `346213531`, `346213532`, `346213564`, `346213567`, `346213568`, `346213580`, `346213581`, `346213582`, `346213583`, `346213584`, `346213585` |
| Architecture | `arm64-v8a` |
| Minimum Android version | Android 9 (API 28) |
| APKMirror downloads | [All variants of 580.0.0.49.91](https://www.apkmirror.com/apk/facebook-2/messenger/facebook-messenger-580-0-0-49-91-release/). Every arm64 one works. [All variants of 581.0.0.49.91](https://www.apkmirror.com/apk/facebook-2/messenger/facebook-messenger-581-0-0-49-91-release/). Every arm64 one works with development builds. |

APKMirror's 580.0.0.49.91 release has 25 variants, and all 21 arm64 ones are supported. Six are "nodpi" builds: `346013354` (a bundle), `346013370`, `346013387`, `346013394`, `346013423` and `346013440`. The other 15 are each made for one screen density, and `346013442` is also on APKPure. The four 32-bit (armeabi-v7a) variants aren't supported. Meta's build tooling gives the same code different internal names from one build to the next, so the patch keeps a checked list per naming. One list covers eight builds, and four more cover the other 13. A build that isn't listed here is rejected before anything changes. Builds `346013354` ([issue 3](https://github.com/SysAdminDoc/HushMessenger/issues/3)) and `346013370` ([issue 1](https://github.com/SysAdminDoc/HushMessenger/issues/1), [issue 8](https://github.com/SysAdminDoc/HushMessenger/issues/8)) were the first ones people ran into.

Development v0.20.1 adds Messenger 581.0.0.49.91. APKMirror lists 19 variants of it, and all 16 arm64 ones are supported, including `346213583`, which it labels a bundle. All 16 share one internal naming. The public v0.14.0 download patches 580 builds, so pair it with a 580 APK until a release carries 581.

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

And for 581.0.0.49.91:

```text
346213494  8c1dfe7313236ca7c257298f50d6603912e0048389fc4903caedb88b87d94045
346213498  2aef7ef8a078916966440cf26576a8075a7411681478b9f9018b0e60d40ba976
346213510  ebac6d63d47a2e41046245d7cf5a00cd8786c746fb5ea8ec1146a834f58bd2e3
346213514  1730d25ca482aab14a52819e3c0fad7da12672794447ecd0c7052a2ea605eae6
346213528  a4f5aaa3f236c1c8d9b3bec140dadc1fe8d9beb593dcc7f94c5328f6d3ee9066
346213531  8c3a90ca89321fbc6618244df3f6bc81856dd47d17097ae3786dd0885234100a
346213532  49df7d88c1b063b3abf21b49652a4d2c6d03225f348ae8c9f57be22aa5574e19
346213564  a37d615b71b82bbc296c6f3641fa13941fcc1637e41b6ec5123b7d931de72d1a
346213567  df5f8e4a85fd5ce697129ec7b4aa2aba36402d26218861d6399ff1452aa4b7f9
346213568  8d73cfd218f5ff4d71b586edb61c650d95574f8da661d357af1acc53433e6f7c
346213580  92c7c68d3495aeb60722310e42dc3074fcded8358f0a8bf97741ac729e3c138e
346213581  261f5baea4e5e8cb97ebe77b9ebe89fad531022c816f126354ba7fdad9da7fed
346213582  e471f45825c2e981e2c070271504ffb4caeab63bfe4333a6ba3288eb56e71cc2
346213583  cd9325e63bbafac6a40dd694988ce22f7b2f9318f3a8cde6981599d61d0cd329
346213584  46fb373a50587f681e1e28a676740cf7c7f5b9f3c4e8d752ffae9469253aeb8c
346213585  95095ea4207743e3c92fe39b05d033a504dee73b90651a8f10147d8852f40ac2
```

On Windows, compare your file with `Get-FileHash -Algorithm SHA256 .\messenger.apk`. Meta can publish different APKs under one version name. If the hash differs, don't assume the off-device result applies to your file. The patch also checks its permission layout and instruction sites.

## Verification and build

The Galaxy S25 took each update in place with the same signing key as its installed Messenger and Facebook apps, keeping its original install date, its sign-in and 19 enabled controls. With the v0.5.0 patch code it passed voice calls, one-to-one notifications, silence for muted chats, facebook.com links opening the Facebook app, and a same-key update and rollback that kept all data. Turning switches on and off showed the expected change for Facebook shortcuts, stories and notes, the Meta AI button, the "Ask Meta AI" search button, People You May Know on the Notifications tab, external links, system emoji and the avatar sticker tab. A two-phone check in an end-to-end encrypted chat showed no typing indicator with the switch on and the usual one while paused, and messages still arrived. Restart Messenger refuses requests from other apps, while the long-press shortcut and the App tab button still restart into the signed-in chat list. At Android's largest font size the chat list, chats and settings stayed usable. The Galaxy S22 now runs a patched build as well.

Development 0.20.1 passed all 181 Kotlin and 676 Android unit cases on 2026-10-04, with no failures or skips. The Kotlin run includes native-media and joined-community replays against all 37 exact APKs, the 21 from 580 and the 16 from 581. All 67 Python checks passed. Morphe Desktop 1.18.0 applied all 33 patches, Material You included, from the final bundle to 581 build `346213494`. The rebuilt APK passed manifest, resource and DEX parsing, and its recorded profile matched the committed stock record. Coverage includes partial patch selection, changed control flow, safe-mode recovery, file ownership and cancellation, and release-cache policy. Release builds run locally. Android lint reports no errors, ten warnings and one hint, including two package-visibility notices for queries restricted to this app. The earlier 0.20.0 memory check passed 581 build `346213583` at 1024 MB. The remaining 581 memory checks and device acceptance are still open.

For v0.14.0, Morphe Desktop 1.18.0 applied all 32 patches, Material You included, to private copies of all 21 supported builds with a 1024 MB Java heap, and `scripts/verify_patch_heap.py` passed every output. One build from each of the five naming groups (`346013440`, `346013372`, `346013423`, `346013357` and `346013374`) was also patched and signed, and Android verified each v3 signature. Two clean release builds, one of them from a fresh checkout, produced the same bundle checksum. The three rebuilt v0.5.0 APKs kept their 13 compressed arm64 libraries byte for byte, with 16KB minimum ELF load alignment. A changed permission fixture stopped before output, and continued exports left failed People methods and permission declarations untouched. The earlier v0.2.0 single-control Galaxy S25 build selected only **Hide People You May Know**. It changed exactly the two expected host methods, added settings once and recorded only that feature. The original signature-permission patch wasn't selected or applied in that check. On 2026-09-30, builds `346013394` and `346013423` took all 27 patches in Desktop 1.17.0 too, and both outputs passed Android's v3 signature check and 16KB alignment. Later that day the 14 single-density builds did the same. Every one of the 21 builds has a committed hook record from `scripts/CompatReport.java`, and a test fails the build if a record and the patch code disagree.

The v0.10.0 development bundle also applied all 31 patches to all 21 supported builds at 1024 MB. Each compiled output had its native-route capability checked, so falling back to unsupported couldn't count as native validation. The stock APK checksums stayed unchanged.

The Patcher 1.15.0 migration passed all 21 supported inputs at 1024 MB and reproduced its bundle from two fresh checkouts. Development v0.17.0 and v0.17.1 also passed the complete local suite, all 21 inputs at 1024 MB and signed patching for all five naming groups. Those outputs retained every stock class and all 13 native libraries, with no duplicate classes. Exact native-media replay passed every input too. A fresh checkout produced the same Android-ready v0.17.0 bundle bytes. Manager 1.33.0 loaded the v0.16.0 local source and applied all 32 patches at its default 640 MB, with Material You selected. Its output passed signature and archive checks, included the settings screen and retained all 13 native libraries unchanged. Peak heap use was 290 MB. The original Manager data, signing key and temporary permissions were restored afterward.

The v0.17.0 development build also updated an existing Galaxy S25 installation in place with its original signing key. The original install date, signed-in inbox and known encrypted-chat history remained.

The v0.19.2 frozen development bundle has SHA-256 `e7c978962d3ace5d52915ad1059f421df1a95119bd900de1b3400a221f8a1897`. It rebuilds the same patch code that passed all 21 supported builds at 1024 MB in v0.19.1 with all 33 patches selected. All three builds that had failed earlier discovery pass, and one build from each of the five mapping groups patched and signed with v3 signatures, kept every native library unchanged and had no duplicate classes. Its checksum file is signed and verifies with the release key. The public release stays at v0.14.0.

Focused dependency checks compile five partial selections, including deliberate sibling failures and a following selection with different controls. They check finalized capabilities and single settings and extension injection. These synthetic fixtures don't prove every switch combination or native UI behavior.

The current screenshots show v0.10.0 inside patched Messenger on a Galaxy S22. Both pages and themes were checked there at 200% text, including the bubble mode buttons. The v0.15.0 standalone UI preview passed live TalkBack title/description exploration and single double-tap activation on Android 16. An emulated external keyboard also exercised Tab, directional focus, scrolling and Space/Enter activation in both themes at normal and 200% text. A physical keyboard still needs a check. Preview checks don't verify Messenger's menu routes or inbox speech. Earlier preview checks preserved multi-digit counts in the mirrored test language. Automated settings and recovery tests cover API 28, 29, 30 and 36, short windows at 200% text, state restoration and accessible actions. Crash-recovery fixtures also cover API 37. Offscreen v0.19.0 captures on 2026-10-03 checked file cancellation, recovery messages, screenshot scope and update retry feedback in both themes at normal and 200% text. They don't establish native Messenger acceptance.

Before patching, the stock apps on a Galaxy S22 and S25 exchanged messages between two owned accounts in an end-to-end encrypted chat, and both phones showed the messages and read receipts. HTTP and HTTPS link tests on the Galaxy S22 confirmed the stock external-browser switch works.

The supported tool baseline is [Morphe Manager 1.33.0](https://github.com/MorpheApp/morphe-manager/releases/tag/v1.33.0) or [Morphe Desktop 1.18.0](https://github.com/MorpheApp/morphe-desktop/releases/tag/v1.18.0). Desktop needs JDK 21 or newer. The local build is tested with JDK 21. To inspect the source:

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar morphe-desktop-1.18.0-all.jar list-patches --patches https://github.com/SysAdminDoc/HushMessenger --filter-package-name com.facebook.orca
```

This command lists patches. Source updates and Messenger installation are separate steps.

To build the bundle on Windows, use JDK 21, Android SDK 36 and the Gradle wrapper. The build pins Morphe Patcher 1.15.0 and `com.github.MorpheApp:ARSCLib:88d5e0811f`. Android tooling uses AGP 9.4.1 and Android Test Engine for device tests. Those host tools aren't bundled into Messenger. Set `ANDROID_HOME` to your SDK directory. The Morphe Gradle plugin needs GitHub Packages credentials:

```powershell
$env:GITHUB_ACTOR = gh api user --jq .login
$env:GITHUB_TOKEN = gh auth token
.\gradlew.bat :patches:clean :extensions:messenger:clean :patches:test :patches:check :extensions:messenger:testDebugUnitTest :extensions:messenger:lintRelease :patches:buildAndroid --no-daemon
python -m unittest discover -s scripts/tests -v
```

The native-media and joined-community replay tests use private APK inputs. Set `HUSH_NATIVE_FIXTURES` to the folder of exact stock APKs for every supported build before running `:patches:check`, with the file names described below. The full check fails without them and verifies every supported code and checksum. For unit-only work, `:patches:test` still runs without the private inputs and reports the two replay tests as skipped. Fixture paths, APK bytes and profile records are tracked as test inputs. Finish the tests before the final `:patches:buildAndroid` invocation. A later Gradle task can replace the intermediate archive with a Java-only bundle.

While the public source is held, validate development separately and freeze its Android-ready bytes in a new folder outside Gradle's outputs. Record the feed hash before making changes. The command below reloads the actual bundle, checks its exact catalog and control definitions, and walks both DEX files. It checks DEX checksums and section bounds, then reads and rebuilds the class data in memory. This is a structural check. Running inside Android remains a separate check.

```powershell
$heldHash = (Get-FileHash .\patches-bundle.json -Algorithm SHA256).Hash.ToLowerInvariant()
$freeze = Join-Path $env:TEMP "hushmessenger-0.20.1"
.\gradlew.bat :patches:buildAndroid --no-daemon
python scripts/check_release.py --development --held-index-sha256 $heldHash --freeze $freeze
$bundle = Join-Path $freeze "patches-0.20.1.mpp"
$bundleHash = (Get-FileHash $bundle -Algorithm SHA256).Hash.ToLowerInvariant()
```

The destination must be new. It contains the bundle, exact catalog evidence and `SHA256SUMS.txt`. Later Gradle tasks can't rewrite that snapshot. Sign that checksum file with the existing release key, then recheck the frozen input with `--development --held-index-sha256 $heldHash --bundle $bundle --bundle-sha256 $bundleHash --checksums "$freeze\SHA256SUMS.txt" --verify-signature`. The default release mode still requires the public source, release links and changelog to agree with the built version. Development validation doesn't publish anything.

Validation parses the mapped data in both DEX files and checks section counts against their bounds. References must point to the start of the item they use. Cached catalog checks preserve JSON types, so a number can't stand in for a switch default.

To repeat the whole-APK memory check, keep the unmodified supported APKs in a private folder, with each file named `messenger-<major version>-<version code>.apk`, for example `messenger-581-346213494.apk`. Run this with Desktop 1.18.0 and the smali dexlib2, Guava and failureaccess JARs selected by the locked dependency graph:

```powershell
python scripts/verify_patch_heap.py --stock-dir .\private-apks --bundle $bundle --bundle-sha256 $bundleHash --held-index-sha256 $heldHash --desktop-jar .\morphe-desktop-1.18.0-all.jar --compat-classpath "<dexlib2.jar>;<guava.jar>;<failureaccess.jar>" --java "$env:JAVA_HOME\bin\java.exe"
```

The check runs at most two builds at once. Each Java process has a 1024 MB heap and uses two processors. Each build runs in its own temporary folder with all patches selected. The check rechecks the frozen bundle's checksum, verifies the stock checksum before and after patching, inspects the output APK and compares the theme's class, surface and color-call counts with `CompatReport.java`. Failures include the subprocess exit code. It removes its temporary APKs and leaves the stock files unchanged. Use `--codes 346013440` to check one build.

The output from main is `patches/build/libs/patches-0.20.1.mpp`. Dependency locks and SHA-256 checks are committed. Review both when changing a dependency. Clean builds from the same source produce the same bundle checksum.

Recording a compatibility profile requires a real patch run. Run `:patches:test` first to compile the local validation tool. With Python 3.11 or newer on PATH and Android Build Tools available, run `CompatReport <apk> --save <profiles directory> <desktop.jar> <bundle.mpp>`. The reporter first checks discovery, then uses Desktop to apply every patch, including Material You, and rebuild a temporary unsigned APK at a 1024 MB heap. It parses the rebuilt manifest and resource table with `aapt2` and structurally validates every DEX. Failed or incomplete results leave the profile directory unchanged. A discovery-only PASS doesn't prove that the patcher can apply the bundle. For a new mapping, use the printed Kotlin to update the source and build the candidate bundle before recording it.

After changing patch metadata, run `:patches:generatePatchCatalog` and review `patches-list.json`. The normal `:patches:check` task checks the committed catalog against the built bundle and checks all 30 control keys against the extension and manifest. It fails on drift instead of rewriting the catalog.

Before publishing, synchronize the release version, source index, changelog and README checksum, then run `:patches:verifyReleaseMetadata`. This loads fresh bundle metadata and checks its checksum against the release files. To check a proposed tag and checksum asset too, run `python scripts/check_release.py --release-tag v0.20.1 --checksums SHA256SUMS.txt` after the Gradle check. Catalog evidence is bound to the exact bundle hash. Then sign the checksum file with `ssh-keygen -Y sign -f <release key> -n hushmessenger-release SHA256SUMS.txt`, attach `SHA256SUMS.txt.sig` next to it, and run the same command with `--verify-signature` added. That checks the signature against `scripts/release_signers`.

### Check the bundle

The [v0.14.0 release](https://github.com/SysAdminDoc/HushMessenger/releases/tag/v0.14.0) includes a `SHA256SUMS.txt` file. Compare its `.mpp` hash with your download. You can also build the tagged source locally and compare the output. Bundles up to v0.4.2 copied LICENSE and NOTICE with the line endings of the checkout they were built from, so a fresh clone of those tags can differ in those two files. Newer source normalizes them. The checksum and bundle are hosted under the same GitHub account, so this check cannot independently rule out an account compromise.

```text
6e67bf58dad6ca26a94f2b024f4f229e65acfc84ddf593371bf3acaa2414b2ad  patches-0.14.0.mpp
```

Morphe Manager 1.33.0 and Desktop 1.18.0 don't verify detached patch-bundle signatures on import. Manager downloads the bundle directly, and Desktop's source model drops the signature URL. An `.asc` link in the source index doesn't add automatic protection. See the [Manager download path](https://github.com/MorpheApp/morphe-manager/blob/v1.33.0/app/src/main/java/app/morphe/manager/domain/bundles/RemotePatchBundle.kt) and [Desktop source model](https://github.com/MorpheApp/morphe-desktop/blob/v1.18.0/src/main/kotlin/app/morphe/engine/model/PatchesBundle.kt). Verify the signed checksum manually before importing.

Starting with v0.7.0, `SHA256SUMS.txt` comes with `SHA256SUMS.txt.sig`, an SSH signature made with the project's release key. The key's fingerprint is `SHA256:Z+UfHy7IUbtgNRO/wHkIr68+u4I+SIKPY9avfx/VAPU` and its public half is in [`scripts/release_signers`](scripts/release_signers). Manager and Desktop don't check this signature, so checking it is up to you. You need OpenSSH 8.1 or newer, which Windows 10 and later already include, as do macOS and most Linux systems. Download both files and `scripts/release_signers` from the same tag, then run this in a terminal (in PowerShell, wrap it in `cmd /c "..."`, since PowerShell has no `<`):

```text
ssh-keygen -Y verify -f release_signers -I SysAdminDoc -n hushmessenger-release -s SHA256SUMS.txt.sig < SHA256SUMS.txt
```

An untouched file prints `Good "hushmessenger-release" signature for SysAdminDoc` and the key's fingerprint. Compare that fingerprint with one you got earlier, like from a clone you already had. The private key lives only on the maintainer's PC and never on GitHub, so a matching signature still means something if the GitHub account is ever taken over. If the key ever changes, the CHANGELOG will say so and why.

## Research and credits

The [research snapshot](https://github.com/SysAdminDoc/HushMessenger/blob/015654380957d775f95b9f1c7871e91452d6216a/RESEARCH.md) compares Messenger patches in Morphe, ReVanced, De-Vanced and other projects. The remaining checks are summarized below. [Hushfeed](https://github.com/SysAdminDoc/hushfeed) is another Hush patch project.

HushMessenger starts from the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). Messenger hook definitions come from [De-Vanced](https://github.com/RookieEnough/De-Vanced), including its ReVanced contributions, and [Doom's patches](https://github.com/rushiranpise/morphe-patches). The typed ad-filter approach follows [Messenger Cleaner](https://github.com/N01-r0/messenger-cleaner-lsposed), with its MIT notice retained. The bubble eligibility anchor originated in [ChatHeadEnabler](https://github.com/NeonOrbit/ChatHeadEnabler). The permission approach is adapted from [Hushfacebook's shared-permission patch](https://github.com/SysAdminDoc/Hushfacebook/blob/15b8e9ed9315464a3e2d1a821b4e26ad47bbc28c/patches/src/main/kotlin/app/morphe/patches/facebook/coexist/SharedPermissions.kt). Source is under [GPL-3.0](LICENSE), and [NOTICE](NOTICE) has the details. HushMessenger is independent of Meta and Morphe.

## Remaining checks

- By 2026-10-03, fresh sign-in had succeeded in a separate test profile while the original account's data stayed intact. Encrypted-history recovery still needs the existing secure-storage PIN. Signed-in Samsung installations pass in-place updates and restarts with their existing keys.
- The signed-in Facebook SSO read passed on 2026-09-29. Fresh **Continue as** sign-in remains unverified and requires an interactive account login. That read doesn't establish recovery of encrypted history.
- Builds `346013354`, `346013370`, `346013394` and `346013423` patch cleanly with every patch, but neither test phone could install them, because both run newer Messenger builds. They haven't been tried on a phone yet.
- Inbox tabs, low-memory bubbles, group notifications and encrypted-group typing still need eligible account or device checks. Live screenshot notices need an owned protected-media fixture and a hardware capture.
- The development Generate-button, protected-viewer and joined-community additions pass native discovery checks. Their live layout, playback, cleanup and inbox checks inside a signed-in account remain open. Settings preview speech passed, but Messenger inbox speech and a physical keyboard still need separate checks.
- Keep unsent messages can't cover end-to-end encrypted chats. Messenger removes those messages below the part of the app HushMessenger can change.

<p align="center">
  <a href="https://ko-fi.com/X8K126YVER"><img height="42" src="https://storage.ko-fi.com/cdn/kofi2.png?v=3" alt="Buy me a coffee on Ko-fi"></a>
</p>
