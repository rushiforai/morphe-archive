[English](README.md) | [한국어](README_KR.md) | [日本語](README_JP.md)

# Niconico YT Comments

A Morphe patch that displays YouTube live chat and chat replay as Niconico-style scrolling comments over the Android YouTube player.

## Features

- Public live chat and chat replay comments
- YouTube custom emojis, membership comments, and Super Chat colors
- A `弾` player button to turn comments on or off
- Font size and opacity settings by long-pressing the `弾` button

※Private, members-only, age-restricted, and other chats that require a signed-in account are not supported.

<img width="480" height="412" alt="image" src="https://github.com/user-attachments/assets/aebf4f85-b6c4-40d0-8df0-3e2a75655b4f" />
<img width="480" height="412" alt="image" src="https://github.com/user-attachments/assets/1e6fcc4c-1a60-499c-9c9b-deaced660d17" />

https://github.com/user-attachments/assets/f29e2231-e159-43ad-8999-8451dfaef7f3

## Requirements

- Morphe
- Android 9 or later (API 28+)
- An unmodified YouTube `21.20.405` APK (`21.04.223` remains supported)
- Expert mode enabled in Morphe

Bundle `1.3.3` fixes `VideoTimeReferenceFingerprint` matching with Morphe Patcher 2, while retaining the playback-speed compatibility fix. Patching and APK rebuilding were verified on `21.20.405` with Morphe Patches `1.48.0`: all 105 selected patches succeeded. Device playback and the older APK were not retested in this update.

## Installation

### 1. Enable Expert mode

This patch is not selected automatically in Simple mode. In Morphe, open:

```text
Settings → Advanced → Expert settings → Expert mode
```

Enable it and accept the confirmation message.

### 2. Add the patch source

#### Remote source (recommended)

In Morphe, open:

```text
Sources → ＋ → Remote
```

Enter this repository URL and tap **Add**:

```text
https://github.com/david419kr/niconico-yt-morphe-patches
```

You can also use [Open in Morphe](https://morphe.software/add-source?github=david419kr%2Fniconico-yt-morphe-patches&name=Niconico%20YT%20Comments) on your Android device.

#### Local `.mpp` source

1. Download `patches-1.3.3.mpp` from [the latest GitHub Release](https://github.com/david419kr/niconico-yt-morphe-patches/releases/latest).
2. Open `Sources → ＋ → Local` in Morphe.
3. Select the downloaded `.mpp` file and tap **Add**.

Do not rename or repackage the file. You can also open the `.mpp` directly from an Android file manager and choose Morphe.

### 3. Patch YouTube

1. Select **YouTube** on the Morphe home screen.
2. Select version `21.20.405` and provide the unmodified `.apk` file. If staying on `21.04.223`, use official patches that support that version.
3. Open the **Morphe Patches** tab and enable the recommended patches.
4. Open the **Niconico YT Comments Patches** tab and enable:

   ```text
   Niconico-style live/replay comments (Experimental)
   ```

5. Tap **Proceed to patching**.
6. Confirm the multiple patch sources warning. Using the official Morphe patches and this patch together is intentional.
7. Install the patched APK. If Android asks for permission to install unknown apps, allow Morphe to install it.

Using the official Morphe recommended patches together with this patch is recommended for non-root devices. They provide the usual package-name and sign-in support that this comment-only patch does not include.

## Updating

- **Remote source:** Open `Sources`, select **Niconico YT Comments Patches**, and tap **Update**. Confirm version `1.3.3`, then patch the unmodified YouTube APK again. The repository URL above always points to the current published bundle.
- **Local source:** Remove the existing source, download the new `.mpp`, and add it again.
