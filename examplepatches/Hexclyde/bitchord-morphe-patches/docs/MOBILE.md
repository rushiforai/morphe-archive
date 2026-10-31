# Install with Morphe

You can do all of this on your phone. No computer or root access is needed.

## 1. Download Morphe and BitChord

Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager/releases). Then download the original **BitChord 1.8.1** APK from [BitChord's release page](https://github.com/kushagrasinghx/BitChord/releases/tag/v1.8.1).

Choose the APK for your phone:

| Device | APK |
| --- | --- |
| Most current Android phones | `BitChord-v1.8.1_arm64-v8a.apk` |
| Older 32-bit ARM phones running Android 8+ | `BitChord-v1.8.1_armeabi-v7a.apk` |
| x86-64 Android devices or emulators | `BitChord-v1.8.1_x86_64.apk` |

I've only tested the patch on an arm64-v8a phone so far. If you're on armeabi-v7a or x86_64, it should work the same way, but please [report any problems](https://github.com/Hexclyde/bitchord-morphe-patches/issues/new/choose) and mention your architecture.

Use the normal Android APK. TV, Wear OS, split APK packages and already patched APKs are not suitable inputs. Keep the original APK in Downloads; you will select it in Morphe.

## 2. Add the patch source

Open this link on your phone:

[Add BitChord Morphe Patches to Morphe](https://morphe.software/add-source?github=Hexclyde/bitchord-morphe-patches&name=BitChord%20Morphe%20Patches&app=com.music.bitchord)

Accept Morphe's prompt. You can also add it manually under **Sources → + → Remote** with:

```text
https://github.com/Hexclyde/bitchord-morphe-patches
```

Expand the source card and:

1. Check that the latest version has loaded (see the [releases page](https://github.com/Hexclyde/bitchord-morphe-patches/releases)).
2. Turn on **Pre-release patches**.
3. Turn on **Experimental app versions**.
4. Open the source's **Apps** list and keep **BitChord** selected.

If you see **Update Morphe**, update Morphe Manager before continuing.

### If the source link does not work

1. Open the [releases page](https://github.com/Hexclyde/bitchord-morphe-patches/releases) and pick the newest release.
2. Under **Assets**, download the `bitchord-patches-<version>.mpp` file.
3. In Morphe, choose **Sources → + → Local** and select that file.
4. Enable **Experimental app versions** if shown.

GitHub's **Source code** downloads are not patch bundles; select the `.mpp` file.

See [source download problems](TROUBLESHOOTING.md#the-source-shows-unnamed-or-metadata-na) if Morphe can't load the source.

## 3. Select the APK and patches

1. In Morphe, open **Apps**, choose BitChord and select the original **1.8.1** APK from Downloads when asked. If you need to select a local APK manually, enable **Expert mode** in **Settings → Advanced → Expert settings**.
2. Choose this project's source and keep both patches selected:

   - **Unofficial Telegram music**
   - **Install as Bitchord+**

3. Leave **Telegram application API ID** at **0** and **Telegram application API hash** empty. Enter your personal details in BitChord after installation.
4. Open **Install as Bitchord+ → Installation name** to choose an app name. Leave it empty for **Bitchord+**. Names can contain up to 80 characters and must fit on one line. A name containing Telegram must include **Unofficial Telegram**.
5. Start patching and wait for Morphe to finish. Use only this source for the first installation.

If the patches are missing, make sure the source loaded and both experimental switches are on.

## 4. Install and connect Telegram

Tap **Install** when patching completes. If Android asks, allow Morphe to install apps.

Open **Bitchord+**, or the name you chose. Your original BitChord app stays installed with its own settings. Telegram setup is inside the app under **Settings → Account & integrations → Unofficial Telegram**.

Continue with [Telegram setup](SETUP.md) to enter your API credentials, sign in and select your music channels.

## Updating later

Keep your Morphe signing key. Android needs the same key to install an update over your existing app. Morphe explains how to back it up in its [keystore guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/backup-and-keystore.md).

When a new patch version is available:

1. Update this source in Morphe. For a Local source, download the new `.mpp`, tap **Update** on its card and select the file.
2. Stop playback and patch the supported original BitChord APK again, using both patches and your existing signing key.
3. Install the result over Bitchord+.

Installing an update with the same package and key keeps the app's existing data. Uninstalling removes its private settings and session. Read each release's notes for changes to the supported BitChord version or setup.
