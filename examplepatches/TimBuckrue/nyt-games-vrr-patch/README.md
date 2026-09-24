# 🧩 NYT Games — Unlock High / Variable Refresh Rate

[Morphe](https://morphe.software) patches for the **New York Times Games** Android app
(`com.nytimes.crossword`). One patch today: **Unlock high refresh rate**, which lets the
app render above 60 fps on 90/120 Hz and variable-refresh-rate (VRR) displays.

Maintained by **Tim_Buckrue**. Independent and unofficial — **not affiliated with or
endorsed by The New York Times or the Morphe project**; the name only describes
compatibility with Morphe.

## ❓ Why

NYT Games never opts into a high refresh rate — its code contains no `setFrameRate`,
`preferredRefreshRate`, or `preferredDisplayModeId` call anywhere. On a 90/120 Hz or VRR
panel, Android's power-saving frame-rate override then pins the app to 60 Hz, which is the
source of the scrolling and animation judder. This patch installs a lightweight hook that
asks each Activity window for the display's top refresh rate — a soft, seamless hint that
lifts the 60 Hz cap while letting the system's Adaptive Refresh Rate keep scrolling smooth
(it deliberately avoids pinning a fixed display mode, which fights ARR and causes stutter).

## 🩹 Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/TimBuckrue/nyt-games-vrr-patch/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 NYT Games&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 6.34.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Optimize home screen (disable animated cards)](#optimize-home-screen-disable-animated-cards) | Forces the NYT Games home screen to use its lightweight static-icon card layout instead of the animated Rive cards. The Rive cards are embedded in the Compose list via AndroidView interop, whose per-item churn plus Rive TextureView compositing is the dominant UI-thread cost while scrolling — the reason busy home screens can't hold 120 fps. Cards stay fully functional; they just don't animate. |  |
| [Unlock high refresh rate](#unlock-high-refresh-rate) | Let NYT Games render above 60 fps on 90/120 Hz and variable-refresh-rate displays. The app never opts into high refresh, so Android's power-saving frame-rate override pins it to 60 Hz; this makes each Activity window request the display's top refresh rate (a seamless, adaptive-refresh-friendly hint), lifting that cap. |  |

</details>

<!-- PATCHES_END -->

## 📲 Install & use

1. Install **Morphe Manager** on your Android device.
2. Add this repo as a patch source — tap **[Add to Morphe](https://morphe.software/add-source?github=TimBuckrue/nyt-games-vrr-patch)**, or add the URL manually in Morphe Manager: `https://github.com/TimBuckrue/nyt-games-vrr-patch`.
3. Select **NYT Games**, enable **Unlock high refresh rate**, and patch your installed app or the NYT Games `.xapk` (let Morphe handle the split APKs).
4. Install the result. It's re-signed with a new key, so **uninstall the Play Store version first** — and sync your progress to your NYT account beforehand, since local progress won't carry over.

## ✅ Verify

Enable **Developer options → Show refresh rate**. With the patched app open, the overlay should hold at your panel's maximum (e.g. 120) during play and scrolling instead of dropping to 60.

## 🛠️ Building

Releases are built automatically by GitHub Actions (`release.yml`): a `fix:` or `feat:` commit to `dev` cuts a pre-release, and to `main` cuts a stable release. For local builds you need a JDK and a GitHub token for the Morphe Gradle plugin (hosted on GitHub Packages); see the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## 📜 License

Tim_Buckrue Patches are licensed under the [GNU General Public License v3.0](LICENSE). Not affiliated with The New York Times or the Morphe project; see the [NOTICE](NOTICE).
