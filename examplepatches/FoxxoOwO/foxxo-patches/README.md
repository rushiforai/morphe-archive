# 🦊 Foxxo Patches

Custom Morphe Patches repository by [FoxxoOwO](https://github.com/FoxxoOwO).

### 📲 How to use these patches in Morphe

Click here to add this repository as a patch source in Morphe:  
👉 **[Add to Morphe](https://morphe.software/add-source?github=FoxxoOwO/foxxo-patches)**

Or add manually in Morphe Manager:
- **Source:** `FoxxoOwO/foxxo-patches`

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.8.1](https://github.com/FoxxoOwO/foxxo-patches/releases/tag/v1.8.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Instagram&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 447.0.0.55.81 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Chat only](#chat-only) | Turns Instagram into a chat-only messenger: opens Direct instead of the feed and removes the home feed, Reels, Explore, ads and suggestions, while the Stories tray stays visible. Long-press any bottom tab (or the Direct title) to open the Feurstagram settings. |  |
| [Clone](#clone) | Renames the package and app label so the patched build installs alongside a stock Instagram instead of replacing it. | • Package name<br>• App name |
| [Debug bridge](#debug-bridge) | Development only: exposes the Feurstagram settings over ADB broadcasts so they can be driven from a shell instead of the on-screen panel. |  |

</details>

<!-- PATCHES_END -->

---

## 📸 Instagram Direct / Chat-Only (`com.instagram.android`)

### What the patch does
Transforms Instagram into a distraction-free, dedicated messenger (Messenger for Instagram):
- **Direct launch into DMs:** The app automatically launches directly into Direct Messages (inbox) upon startup.
- **Feed and distraction removal:** Blocks the main home feed, Explore/search, and the recommended Reels feed. The Stories tray stays visible (toggle it under Stories in the settings).
- **Clean bottom navigation:** Hides Home, Explore, Reels, and Creation tabs from the bottom bar, leaving only Direct and Profile.
- **Messenger-like back navigation:** Pressing Back in the main Direct inbox moves the app to the background / home screen instead of returning to an empty feed.
- **In-chat media playback:** Posts and Reels shared in direct messages remain fully viewable and playable (via signature check bypass).
- **Stories tab:** an optional Stories tab takes Home's place (stories ring icon, no feed), so stories stay reachable without bringing the timeline back - switch on "Stories tab (replaces Home)" in the settings.
- **Settings:** Long-press any bottom tab (Direct, Profile, ...) or the Direct inbox title bar to open Feurstagram settings - the gesture works with Home hidden, so the toggles (Stories, ads, popups, ...) are reachable without a debug build.

---

## 📜 License
[GPLv3](LICENSE)
