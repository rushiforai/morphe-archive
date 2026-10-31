# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=ratatabananana-bit/gaming-hub-morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/ratatabananana-bit/gaming-hub-morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 Gaming Hub&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**🎯 Supported versions:**

| 8.0.05.8 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide Events button](#hide-events-button) | Removes the gift icon in the top right of the home screen that opens the Events page. |  |
| [Hide Instant Plays history](#hide-instant-plays-history) | Removes the Instant Plays history section from the top of My games. |  |
| [Hide Popular Instant Plays categories](#hide-popular-instant-plays-categories) | Removes the "Popular Instant Plays categories" row from the home screen. |  |
| [Hide Recommended for you](#hide-recommended-for-you) | Removes the "Recommended for you" row from the home screen. | • Row titles |
| [Hide Top instant plays](#hide-top-instant-plays) | Removes the "Top instant plays" row from the home screen. | • Row titles |
| [Local play history](#local-play-history) | Experimental. Shows your play history in the gamer profile, computed on the device from Android's usage data instead of Samsung's server, and stops account-only requests to Samsung's server that fail without a Samsung account. Requires usage data access for Gaming Hub in Android settings. |  |
| [Skip mandatory sign-in](#skip-mandatory-sign-in) | Experimental. Opens Gaming Hub without the mandatory Samsung account sign-in. Required for any patched Gaming Hub, because Samsung account sign-in only works with the original Samsung signature. Features that need an account will not work. |  |
| [Use Android game list](#use-android-game-list) | Fills My games with installed apps that Android marks as games. Required for any patched Gaming Hub, because Samsung's game service refuses apps that are not signed by Samsung. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Ratbanana Gaming Hub Patches are licensed under the [GNU General Public License v3.0](LICENSE)
