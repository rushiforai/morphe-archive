# Foxxo Patches

Custom Morphe Patches repository by [FoxxoOwO](https://github.com/FoxxoOwO).

### How to use these patches in Morphe

Click here to add this repository as a patch source in Morphe:  
**[Add to Morphe](https://morphe.software/add-source?github=FoxxoOwO/foxxo-patches)**

Or add manually in Morphe Manager:
- **Source:** `FoxxoOwO/foxxo-patches`

---

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.10.1](https://github.com/FoxxoOwO/foxxo-patches/releases/tag/v1.10.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>Instagram&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Supported versions:**

| 447.0.0.55.81 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Chat only](#chat-only) | Turns Instagram into a chat-only messenger: opens Direct instead of the feed and removes the home feed, Reels, Explore, ads and suggestions, while the Stories tray stays visible. Long-press any bottom tab (or the Direct title) to open the Feurstagram settings. |  |
| [Clone](#clone) | Renames the package and app label so the patched build installs alongside a stock Instagram instead of replacing it. | • Package name<br>• App name |
| [Debug bridge](#debug-bridge) | Development only: exposes the Feurstagram settings over ADB broadcasts so they can be driven from a shell instead of the on-screen panel. |  |

</details>

<details open>
<summary>Vampire Survivors&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Supported versions:**

| 1.16.111 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Unlock all DLC](#unlock-all-dlc) | Unlocks every expansion. The purchase lookup returns the game's own list of all DLC, so no store session or receipt is involved. Only the arm64 build is patched. |  |

</details>

<details open>
<summary>Ascent&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Supported versions:**

| 5.0.2 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Unlock premium](#unlock-premium) | Unlocks Ascent Premium. The subscription status the app reports to its UI is always "premium" (server answer, cached state and first-launch mapping), and the Play license check is disabled so the re-signed build does not shut itself down. |  |

</details>

<!-- PATCHES_END -->

---

## Instagram Direct / Chat-Only (`com.instagram.android`)

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

## Ascent Premium (`com.ascent`)

### What the patch does
Makes Ascent treat the account as having an active Premium subscription:
- **Server answer:** every response of the subscription endpoint is mapped to the premium status object, so the cached state and the status flow never drop back to "free" after a refresh.
- **First launch:** the status mapper returns premium immediately instead of waiting for the server, so the UI does not briefly render the free state.
- **PairIP license check:** disabled, because a re-signed build fails the Play licensing check and the app would otherwise kill its own process after 30 seconds.

The premium-feature settings themselves are left alone, as is anything the backend gates server-side.

The patch matches the obfuscated class names of Ascent 5.0.2, so it is only declared compatible with that build and has to be re-verified for newer releases.

---

## Vampire Survivors DLC (`com.poncle.vampiresurvivors`)

### What the patch does
Unlocks every expansion by rewriting a single function in the IL2CPP binary:
- **Purchase lookup:** `PurchasingController.GetOwnedDlcTypes()` is replaced by a branch into the game's own "all DLC" list (`DlcSorting.SortedDlcTypes`), so the license manager hands every DLC to the content gates.
- **No store involved:** the original method needs a live Play Billing session and cached receipts, which a re-signed build cannot have, so the whole store code path is skipped instead of faked.

Only the arm64 `libil2cpp.so` is patched; 32-bit devices keep the stock behaviour. The offsets are absolute file offsets in the 1.16.111 binary, so the patch is declared compatible with that build only and has to be re-verified for newer releases.

The patch does not bundle expansion content: if a DLC asset pack is not already on the device, the game still has to fetch it from the store, which may fail on a re-signed build.

---

## License
[GPLv3](LICENSE)
