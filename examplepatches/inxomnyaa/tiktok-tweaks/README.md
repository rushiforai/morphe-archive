# TikTok Tweaks

Patches for TikTok (`com.zhiliaoapp.musically`) **47.7.1**, built for the [Morphe](https://morphe.software) patcher. They remove ads, Shop and Tako AI, and add a few quality-of-life options, all controlled from a settings page inside the app.

This is an independent project, not affiliated with TikTok, Morphe or ReVanced.

## What it does

Everything except remembered speed, remembered clear display and the seekbar has a toggle.

| Option | Default |
|---|---|
| Remove feed ads | On |
| No Shop: Shop videos, the Shop tab and the top bar entry | On |
| Hide livestreams | On |
| Hide stories | On |
| Hide image videos | Off |
| Disable offline videos | On |
| Hide Tako AI: feed button, home top bar icon and inbox entries | On |
| Hide comment sticker suggestions | On |
| Re-mute button, for use with TikTok's Start on mute | On |
| Open Activity on Comments | On |
| Remove download watermark | Off |
| Extra smaller stops on TikTok's own text size slider | On |
| UI size slider, 60 to 100% | 100% |
| Custom download folder | `DCIM/TikTok` |

Always on: remembered playback speed, remembered clear display, and the progress bar on all videos. Download restrictions are also removed.

To change the options, open **Settings and privacy** in TikTok and tap the pink **Tweaks** button at the top right. Restart TikTok afterwards.

## Patching

You need your own original TikTok **47.7.1** APK. It has to be a single APK, not a split bundle, and include your phone's CPU type. Other versions will not work, because the patches use TikTok's obfuscated names, which change between releases.

### In the Morphe app

1. Install [Morphe Manager](https://morphe.software) on your phone.
2. Add this repo as a patch source, using either way:
   - Open **[this link](https://morphe.software/add-source?github=inxomnyaa/tiktok-tweaks)** on your phone and confirm.
   - Or open **Sources** in the bottom bar, tap **+**, stay on **Remote**, paste `github.com/inxomnyaa/tiktok-tweaks` and tap **Add**.
3. Patch TikTok with your 47.7.1 APK, with **TikTok Tweaks** selected.
4. Uninstall any TikTok already on your phone, then install the patched app and log in. Uninstalling deletes your drafts.

Added this way, Morphe Manager picks up new releases by itself.

### With the desktop tool

Needs Java 17 or newer.

1. Download `tiktok-tweaks.mpp` from the [latest release](../../releases/latest).
2. Download the [Morphe desktop tool](https://github.com/MorpheApp/morphe-desktop/releases).
3. Patch the APK:

   ```sh
   java -jar morphe-desktop-2.1.1-all.jar patch --exclusive \
     -p tiktok-tweaks.mpp -e 'TikTok Tweaks' \
     -o tiktok-patched.apk tiktok-47.7.1.apk
   ```

4. Uninstall any TikTok already on your phone, then install `tiktok-patched.apk` and log in. Uninstalling deletes your drafts.

Morphe creates a keystore next to the input APK. Keep it: you need the same key to update without uninstalling again.

## Building from source

Needs bash, curl, unzip and a JDK 17 or newer:

```sh
./build.sh
```

The script downloads the Morphe tool, R8 and `android.jar`, checks their hashes, and writes `dist/tiktok-tweaks.mpp`.

Pushing a change under `extension/`, `patches/` or `stubs/` to `main` builds the bundle and publishes it as a new release automatically.

## Status

Tested on one phone (Redmi Note 10 Pro), patched with the desktop tool. Patching inside the Morphe app has not been tested yet.

- **Confirmed working:** ad removal, feed filters, UI size.
- **Known issue:** the double-tap heart animation does not show, although the like still registers. The cause is unknown.
- **Newest and least tested:** Shop and Tako top bar removal, the re-mute button, the extra text size stops, and Open Activity on Comments.

## Credits

Ad and Shop detection and the feed hooks are based on [niposch/revanced-tiktok-patches](https://github.com/niposch/revanced-tiktok-patches) (GPL-3.0).

## License

[GPL-3.0](LICENSE), inherited from the project above.
