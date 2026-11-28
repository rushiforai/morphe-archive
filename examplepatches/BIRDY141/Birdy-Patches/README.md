<p align="center">
  <img src="branding/preview-banner.png" alt="BirdyTV" width="480">
</p>

# Birdy Patches

Unofficial patches for **YouTube on Android TV** (`com.google.android.youtube.tv`), compatible with [Morphe](https://morphe.software).

Built upon **Faro Patches** (`FaroTV`) with additional features, UI overhaul, and customizations.  
*Birdy Patches is an independent community project and is not affiliated with Google, YouTube, or the Morphe project.*

Tested and confirmed working on **YouTube TV 8.02.300 (armeabi-v7a)** and **7.32.300**.

## 📦 How to Use in Morphe Manager

1. Install [MicroG-RE](https://github.com/MorpheApp/MicroG-RE/releases) on your Android TV.
2. Add this repository as a patch source in Morphe Manager:
   `https://github.com/BIRDY141/Birdy-Patches`

   <a href="https://morphe.software/add-source?github=BIRDY141/Birdy-Patches">
     <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="36">
   </a>

3. Select **YouTube for Android TV** (`com.google.android.youtube.tv`) and patch!

This repository does **not** distribute YouTube APKs, neither original nor modified.

## ⚙️ BirdyTV Settings

All in-app features are configured from the **BirdyTV** section inside YouTube TV's native Settings menu:

- **UI Tweaks**
  - **Hide topic tabs** — Hide or show individual topic tabs in the sidebar (Gaming, Music, News, Sports, Podcasts, Movies & TV, Live).
  - **Hide Shorts** — Remove Shorts shelves from Home and subscriptions.
  - **Hide YouTube Playables** — Hide Playables shelves from feeds.
  - **Hide channel watermarks** — Remove branding watermarks overlaid on videos.
  - **Return YouTube Dislike** — Restore dislike counts in the video details panel.
  - **Hide Premium promotions** — Hide YouTube Premium upsell banners and pop-ups.
  - **Hide video ads** — Block video advertisements and sponsored items on Home.
  - **Hide in-video overlays** — Hide end-screen cards, info cards, and interactive overlays.
  - **Enable Watch Next** — Control Watch Next recommendations on the Android TV home screen.

- **Video**
  - **Default video quality** — Force a preferred resolution for regular videos (Auto up to 4K 2160p).
  - **Default Shorts quality** — Force a preferred resolution for Shorts.
  - **Default playback speed** — Force a default playback speed on every video (0.25x – 4x).
  - **Custom speed menu** — Unlock 0.25x–4x options inside the player's Video speed menu (per-video).
  - **Picture-in-Picture (PiP)** — Enter Picture-in-Picture when pressing Home during playback.
  - **Original title** — Show original video titles instead of auto-translated ones.
  - **Original audio track** — Prefer the original audio track instead of auto-dubbed tracks.
  - **Caption language** — Automatically select your preferred subtitle/caption language.
  - **Auto-translate captions** — Automatically translate captions when your preferred language is unavailable.

- **Player**
  - **Hide Join button** — Hide the channel membership Join button.
  - **Hide Subscribe button** — Hide the Subscribe button in the player.
  - **Hide Like / Dislike / Comments / Save / Share / Clip / Report / Thanks / Ask / More** — Individual toggles to hide each action button in the player.

- **SponsorBlock**
  - **Enable SponsorBlock** — Master toggle for SponsorBlock segment handling.
  - **Prompt on all categories** — Show an on-screen `[OK]` skip prompt instead of auto-skipping.
  - **Per-category mode (Skip / Prompt / Off)** — Configure Sponsor, Self-Promotion, Interaction Reminder, Intro, Outro, Preview/Recap, Non-Music Section, and Filler Tangent individually.
  - **Show segments on seekbar** — Highlight SponsorBlock segments on the player progress bar.
  - **Show skip notice** — Display a brief toast when a segment is skipped.

- **DeArrow**
  - **Replace clickbait titles** — Replace sensationalized titles with community-submitted DeArrow titles.
  - **Replace thumbnails** — Replace clickbait thumbnails with clean video frames.
  - **Show original on focus** — Temporarily reveal the original title/thumbnail when a video is focused.

- **About**
  - **Language** — Switch the BirdyTV interface language (`Default (System)`, English, Español, العربية).
  - **Version & Credits** — Displays the current BirdyTV extension version and acknowledgments.

## 🩹 Patches

<!-- PATCHES_START EXPANDED -->
> **[v2.0.9](https://github.com/BIRDY141/Birdy-Patches/releases/tag/v2.0.9)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 YouTube for Android TV&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**Package name:** `com.google.android.youtube.tv`

**🎯 Supported versions:**

| 7.32.300 | 8.02.300 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [BirdyTV settings and scripts](#birdytv-settings-and-scripts) | Adds a "BirdyTV" settings menu to YouTube TV. |  |
| [Custom branding](#custom-branding) | Changes the app name, icon, TV banner and the logo inside the app to BirdyTV's (or another name). | • App name |
| [Disable start on boot](#disable-start-on-boot) | Keeps the app (and MicroG-RE) from starting in the background when the TV is switched on. |  |
| [Fix volume keys](#fix-volume-keys) | Lets Android handle short presses and held volume keys instead of sending them to the web input method. |  |
| [GmsCore support](#gmscore-support) | Redirects the app's Google Play Services calls to GmsCore (MicroG-RE). Requires MicroG-RE to be installed. Without it, YouTube for Android TV crashes because Google Play Services rejects DroidGuard for the new package name. |  |
| [Run without Google Play Services](#run-without-google-play-services) | Changes the package name so the patched app installs next to the original one, and keeps it running when Google Play Services rejects the new package name. Sign in with an activation code (yt.be/activate). |  |
| [Spoof device](#spoof-device) | Reports another TV model to YouTube, so it runs on TVs it calls "not compatible". Default: Google Chromecast. | • Brand<br>• Model<br>• Manufacturer<br>• Chipset |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Clone app](#clone-app) | Changes the app package name to allow installing the same app multiple times. By default ".morphe" is appended to the package name. Each cloned install must use a unique package name. Cloning does not work with all apps and using this patch may cause app crashes or other unexpected behavior. | • Package name<br>• Update permissions<br>• Update providers |

</details>

<!-- PATCHES_END -->
