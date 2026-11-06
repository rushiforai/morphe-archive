# Dyskal YouTube Music Discord RPC

A [Morphe](https://morphe.software) add-on that shares what you're listening to on YouTube Music as your Discord activity.

## Features

- Song title, artist, album name, and cover art.
- Click the title to open the song, the artist to open their page, or the cover to open the album.
- Playback progress at normal speed.
- Choose the artist or **YouTube Music** as your profile headline.
- Clears your activity when playback pauses or stops, and reconnects automatically when you listen again.

## Install

1. [Add this patch source to Morphe](https://morphe.software/add-source?github=Dyskal/morphe-yt-music-discord-rpc).
2. Apply it alongside **official Morphe Patches 2.0.0 or later**, including the **Settings** patch.
3. Select **Discord rich presence**, patch a supported YouTube Music APK, and install it.

To receive development builds, enable prereleases in the patch-source settings.

## Connect to Discord

1. Open YouTube Music → **Settings → Morphe → Misc → Discord rich presence**.
2. Tap **Connect with Discord** and authorize in the Discord app, or in a browser tab if Discord isn't available.
3. Enable activity sharing in Discord and play some music.

The default Discord application is ready to use; no application ID or developer account is required.

### Settings

- **Share currently playing music:** turn sharing on or off without signing out.
- **Profile headline:** show the artist name or **YouTube Music**.
- **Reconnect:** reconnect using your saved sign-in.
- **Disconnect and forget account:** sign out and remove saved credentials.
- **Discord application ID:** optionally use your own application; see [custom application setup](CONTRIBUTING.md#custom-discord-application).

Changes take effect without repatching. Sign-in credentials are encrypted on your device.

## Troubleshooting

Check **Connection status** on the Discord settings page if sharing or artwork stops working. Confirm Discord's activity sharing is enabled, then try **Reconnect**. If asked to sign in again, disconnect and reconnect your account.

Activity changes can take a few seconds to appear, and link behavior can vary between Discord clients.

## 🩹 Patches list

<!-- PATCHES_START -->
> **[v1.0.0](https://github.com/Dyskal/morphe-yt-music-discord-rpc/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 YouTube Music&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.google.android.apps.youtube.music`

**🎯 Supported versions:**

| 🧪&nbsp;9.43.51 | 🧪&nbsp;9.42.52 | 🧪&nbsp;9.41.52 | 9.30.53 | 9.20.53 | 9.15.51 |
| :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Discord rich presence](#discord-rich-presence) | Adds Discord rich presence, cover art, and clickable music links. Configure it under Morphe → Misc → Discord rich presence. Requires official Morphe Settings (2.0.0+). |  |

</details>

<!-- PATCHES_END -->

## Development

See [CONTRIBUTING.md](CONTRIBUTING.md) for build instructions, diagnostics, and the release workflow.

## License and attribution

[GPLv3](LICENSE), with the additional terms in [NOTICE](NOTICE). Based on the [official Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). Upstream fingerprints retain their [copyright and notice](UPSTREAM-NOTICE). Dependencies and source references are documented in [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md).
