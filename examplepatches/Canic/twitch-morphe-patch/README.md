# 🟣 Twitch Morphe Patches

A Twitch-focused [Morphe](https://morphe.software) patch bundle maintained by [Canic](https://github.com/Canic).

## 🙏 Credits

This project is based on [Hooman's Morphe Patches](https://github.com/arandomhooman/hoomans-morphe-patches). Many of the original patch implementations, project structure, and release tooling come from that project.

Additional credit goes to [ReVanced](https://github.com/ReVanced) for the earlier patching work and to [Morphe](https://github.com/MorpheApp) for the patcher, Manager, and development libraries.

## 🙏 Requesting Patches

Please use this repository's [issues](https://github.com/Canic/twitch-morphe-patch/issues) for bugs and feature requests.

## 🩹 Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.44.3](https://github.com/Canic/twitch-morphe-patch/releases/tag/v1.44.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 Twitch&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 30.5.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [7TV emotes](#7tv-emotes) | Adds global, channel and personal 7TV emotes to chat, Twitch's picker and autocomplete, including zero-width overlays. |  |
| [Auto claim channel points](#auto-claim-channel-points) | Claims the channel points bonus chest for you automatically. Whenever Twitch makes a bonus available, the claim fires on its own so you don't have to tap the chest. |  |
| [Hide display ads](#hide-display-ads) | Hides the banner, overlay, and in-feed display ads Twitch shows around the app. This doesn't touch the video ads in the stream itself. |  |
| [Show deleted messages](#show-deleted-messages) | Keeps deleted or moderated chat messages readable instead of replacing them with "<message deleted>". The message turns into a tappable spoiler: tap it to reveal the original text. Normally only moderators can do this; the patch grants that access to everyone. |  |
| [Show stream latency](#show-stream-latency) | Shows the current live-stream latency in the player. Tap the badge to seek back to the live edge. |  |

</details>

<!-- PATCHES_END -->

## 📥 How to install

The patches apply to the official Twitch app, which you supply yourself; this repo doesn't host or redistribute the app.

1. **Add the patch source** to Morphe Manager once: `https://github.com/Canic/twitch-morphe-patch`, or use the [deeplink](https://morphe.software/add-source?github=Canic/twitch-morphe-patch).
2. **Get Twitch's APK** at the exact version in the table above: export it from the Play Store, or download it from APKMirror / APKCombo. Split bundles (`.apks` / `.xapk`) are fine; Morphe Manager merges them automatically (or merge with APKEditor first).
3. **Patch and install** Twitch in Morphe Manager with the patch(es) you want.

> Patching re-signs the app, so Google sign-in stops working on patched builds; log in with your Twitch username instead.

## 🛠️ Building

```bash
./gradlew buildAndroid
```

Produces a `.mpp` patch bundle under `patches/build/libs/`.

## 📋 License

[GPLv3](LICENSE).
