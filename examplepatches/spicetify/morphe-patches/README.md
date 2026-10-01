# Spicetify Android patches

Spotify Android customizations for use with [Morphe](https://morphe.software/).
This repository publishes patch source and bundles, not Spotify APKs.

<!-- prettier-ignore -->
> [!NOTE]
> These patches target Spotify 9.1.80.2221, ARM64. Other Spotify versions are
> not supported.

[**➕ Add Spicetify to Morphe**](https://morphe.software/add-source?github=spicetify/morphe-patches/tree/main)

Open this link on Android with Morphe Manager installed to add the stable
source. Pre-releases are published from the `dev` branch.

## Patches

Clean sharing is enabled by default; the other patches are optional. Choose
theme colors, Home pins, ad and Premium-tab hiding, and server files in
Spotify's Spicetify settings after installation.

Server files stream from an HTTPS WebDAV folder or a Jellyfin library. They
also add server albums and artists to Your Library, after
Spotify's own items, with a filter chip named after the provider (for example
**Jellyfin**) that shows only server items. Tapping a server album opens it and
plays it in order through Spotify's player; tapping an artist opens the artist.
Playback needs Spotify's **Local audio files** setting (Settings → Apps and
devices). The last completed scan is saved on the device, so server items are
available as soon as Spotify starts while a fresh scan runs. This was tested on a
Pixel 8 with a 35,000-track Jellyfin library.

| Patch | Default | Behavior |
| --- | --- | --- |
| Clean sharing links | Enabled | Removes `si`, `pi`, and known `utm_*` parameters from `open.spotify.com` links. Preserves timestamps, context, other parameters, and fragments. |
| Theme colors | Disabled | Choose a theme such as OLED, Midnight, or Nord in Spicetify settings, or pick background, surface, and accent colors yourself, then restart Spotify. Hardcoded colors and some screens keep Spotify's colors; Android 10 and earlier change fewer screens. |
| Pin shortcuts on Home | Disabled | Moves selected native Home shortcuts first. Configure pins in Spotify's Spicetify settings, then restart Spotify. |
| Local files from a server | Disabled | Streams an HTTPS WebDAV folder or Jellyfin library into Local Files and Your Library, with its own filter chip. Requires Android 8 or later, byte-range support, and Spotify's Local audio files setting; configure the server in Spotify's Spicetify settings. |

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/spicetify/morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
<details open>
<summary>📦 Spotify&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;9.1.80.2221 |
| :---: |
| Experimental Android customization patches; runtime compatibility is still being verified. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Clean sharing links](#clean-sharing-links) | Removes sharing identifiers and marketing parameters from open.spotify.com links. Keeps playback timestamps, context, and other parameters. |  |
| [Hide Home and Browse ads](#hide-home-and-browse-ads) | Hides image and video brand-ad sections on Home and Browse. Does not suppress audio ads, player ads, or upgrade prompts. Experimental. |  |
| [Hide Premium tab](#hide-premium-tab) | Hides the Premium navigation tab. Change this in Spicetify settings, then restart Spotify. Does not change your subscription or remove other ads. |  |
| [Hide player ad cards](#hide-player-ad-cards) | Hides image brand-ad cards and embedded ad pages in Now Playing. Does not suppress audio ads or other player overlays. Experimental. |  |
| [Local files from a server](#local-files-from-a-server) | Streams audio from an HTTPS WebDAV folder or Jellyfin music library into Local Files and Your Library. Configure the server in Spicetify settings; playback needs Spotify's Local audio files setting. Experimental; requires byte-range support. |  |
| [Pin shortcuts on Home](#pin-shortcuts-on-home) | Choose which of Spotify's Home shortcuts appear first in Spicetify settings. Pins are saved on this device. Restart Spotify after changing pins. |  |
| [Theme colors](#theme-colors) | Choose a theme, such as OLED, or your own colors in Spicetify settings. Restart Spotify after changing it. Some screens and hardcoded colors keep Spotify's colors. |  |

</details>

<!-- PATCHES_END -->

## Install

Releases are listed on the [releases page](https://github.com/spicetify/morphe-patches/releases).
Version 1.0.0 was patched with Morphe Manager and tested on a Pixel 8.

A patched APK uses a different signing certificate from stock Spotify. Installing it with
the same package name requires removing stock Spotify first, which removes
its local app data and downloads. Keep Manager's signing key for future
updates; a different key requires another uninstall.

Use the **Add Spicetify to Morphe** link above, then confirm the source in
Manager. If you already added this repository manually, keep that source
instead of adding it again. To add it manually and patch Spotify:

1. Open **Sources**, select **Add**, and choose **Remote**.
2. Paste the following source URL, then select **Add**.

   ```text
   https://raw.githubusercontent.com/spicetify/morphe-patches/refs/heads/main/patches-bundle.json
   ```

   For pre-releases, use the same URL with `dev` in place of `main`.

3. Expand **Spicetify Android patches** and enable **Experimental app versions**.
4. Return to the app list. Spotify appears with the target version
   `9.1.80.2221`, ARM64 build `145767611`.
5. Optional: To add theme colors, Home pins, or server files, open
   **Settings > Advanced** and enable
   **Expert mode** before selecting Spotify. The default flow applies only
   **Clean sharing links**.
6. Select **Spotify**, choose **No, I already have an APK**, and select your
   original APK or split-APK archive. To use Android's system picker without
   granting **All files access**, turn off **Settings > System > Custom file
   picker** in Manager first.
7. Read the experimental-support notice and select **Proceed anyway** if you
   want to test this build. In Expert mode, select the optional patches you
   want, then select **Proceed to patching**.
8. Wait for **Patching complete**, then select **Install**. If Manager reports
   a certificate conflict, uninstall the existing app only after accepting
   the data loss described above. Confirm installation in Android's dialog.
9. Open Spotify from Android's app launcher. Sign in if needed.

Keep your own stock APK or split-APK archive for patching; the repository does
not distribute Spotify.

## Change settings in Spotify

Patched Spotify has a **Spicetify** row in its settings.

1. Open your profile menu, then **Settings and privacy**.
2. Scroll down and select **Spicetify**, just above **Log out**.
3. Turn **Clean sharing links** on or off. The next share uses your choice
   immediately. The setting survives restarting Spotify.

Only installed patches appear here, grouped by category. With **Theme colors**
installed, **Appearance** lists themes, including OLED, and a **Custom** option
for picking background, surface, and accent colors. Settings that Spotify
reads at startup, such as themes, offer to restart Spotify for you. Home pins and server files have their own
controls here when installed.

For server files, enter an HTTPS WebDAV folder URL and credentials in
**Spicetify**, turn on **Use server files**, then select **Save and scan**.
After **Tracks ready** appears, return to **Settings and privacy > Apps and
devices**, enable **Local audio files**, then open **Local Files** in your
library. The server must support byte-range requests.

To update an existing Manager-signed installation, update **Spicetify Android
patches** in **Sources**, open Spotify's entry in Manager, and select **Patch**.
Install the resulting APK with the same Manager signing key to preserve app
data. If Android reports a certificate conflict, stop and check the signing
key before considering an uninstall.

## Return to stock Spotify

Uninstall the patched Spotify app, then reinstall the official Spotify app
from Google Play and sign in again. Uninstalling removes local app data and
downloaded music. Stock Spotify uses a different signing certificate, so it
cannot replace a Manager-signed installation through a normal app update.

## Try a local build

Build the bundle using the [development instructions](CONTRIBUTING.md), then
load `patches/build/libs/patches-*.mpp` in
[Morphe Desktop](https://github.com/MorpheApp/morphe-desktop). Select your own
stock Spotify APK or split-APK archive matching the declared target.

Keep the patcher's signing key if you use Desktop for later updates. A
Desktop-signed APK and a Manager-signed APK can use different keys.

## Development

Read [CONTRIBUTING.md](CONTRIBUTING.md) for setup, tests, and release steps.

This project is independent of Spotify and the Morphe project. Its repository
slug is `morphe-patches`; its display name is Spicetify Android patches.

## License

The patch code is licensed under [GPL-3.0](LICENSE), with the upstream
[NOTICE](NOTICE) retained. See [third-party sources](THIRD_PARTY_NOTICES.md)
for the template and historical implementations used during development.
