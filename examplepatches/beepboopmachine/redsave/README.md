# Reddit Download Media Patch

A [Morphe](https://github.com/MorpheApp) patch for the official Reddit Android app (v2026.47.0).

It adds a native download button right into the Reddit feed and fixes Reddit's built-in download option, so you can save full-resolution images, galleries, GIFs, Reddit videos, and RedGifs with one tap—and no watermarks.

---

## What it does

- **Adds a Download button to your feed**: Places a clean download button between Repost and Share on posts (works across Classic, Plain, and Refresh feed layouts).
- **Downloads full-quality media without watermarks**:
  - **Images & Galleries**: Saves full-resolution JPEG/PNG files, including multi-image posts.
  - **GIFs**: Saves animated GIFs/MP4s properly.
  - **Reddit Videos (v.redd.it)**: Downloads the high-resolution video stream.
  - **RedGifs**: Automatically grabs the direct MP4 file.
- **Tap or Long-Press**:
  - **Single tap**: Downloads single-item posts immediately. For multi-item posts, opens the options menu by default until you check **"Remember my choice"**.
  - **Long press**: Opens a menu showing how many items are in the post, letting you pick "Download single" or "Download all", plus a checkbox to remember your choice.
- **Fixes the built-in download button**: Replaces Reddit's broken 3-dot menu download option with this one so it actually works.
- **Saves to your regular folders**:
  - Images go to `/sdcard/Pictures/Reddit/`
  - Videos go to `/sdcard/Movies/Reddit/`

---

## Requirements

| Property | Details |
| :--- | :--- |
| **App** | Reddit (`com.reddit.frontpage`) |
| **Version** | `v2026.47.0` |
| **Android** | Android 10 (API 29) or newer |

> [!NOTE]
> When patching Reddit v2026.47.0, use a full APKM bundle (or a merged APK). Using a standalone base APK without the extra resource splits will cause the app to crash when opening profiles or the share menu.

---

## How to install

### Using Morphe Manager (Recommended)
1. Open Morphe Manager on your phone.
2. Go to **Settings** > **Sources** and add this repository's GitHub URL: `https://github.com/beepboopmachine/redsave`.
3. Go back to the dashboard, select **Reddit** (`v2026.47.0`), enable **Download media**, and tap **Patch**.
4. Install the patched APK.

---

### Using Morphe CLI (PC)
1. Clone the repo and build the patch:
   ```bash
   git clone https://github.com/beepboopmachine/redsave.git
   cd redsave
   ./gradlew :patches:buildAndroid
   ```
   *(Requires JDK 17+, Android SDK 34/35, and GitHub Packages credentials via `gpr.user`/`gpr.key` or `GITHUB_ACTOR`/`GITHUB_TOKEN`)*

2. Patch your Reddit APKM file:
   ```bash
   java -jar morphe-cli.jar patch \
     --patches patches/build/libs/patches-1.0.0.mpp \
     --out reddit-patched.apk \
     reddit.apkm
   ```

3. Install it via ADB:
   ```bash
   adb install -r reddit-patched.apk
   ```

---

## Supported Versions

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/beepboopmachine/redsave/releases/tag/v1.0.1)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**1 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Reddit**](PATCHES.md#reddit-comredditfrontpage) | 1 | `2026.47.0` | [`com.reddit.frontpage`](https://play.google.com/store/apps/details?id=com.reddit.frontpage) |
<!-- PATCHES_END -->

---

## License

Licensed under the [GNU General Public License v3.0](LICENSE).
