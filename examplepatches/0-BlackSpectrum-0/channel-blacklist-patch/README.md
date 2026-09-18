# Channel Blacklist Patch

A Morphe patch to filter and hide videos from blacklisted channels across YouTube feeds, search results, subscriptions, and comments.

---

> [!CAUTION]
> ### ⚠️ Disclaimer
> This patch was generated with AI assistance. It may be incomplete, unstable, or break on future app versions. **Use at your own risk.** Always keep a backup of your original APK. Not affiliated with, endorsed by, or supported by the Morphe or ReVanced teams, and modifying an app may violate that app's Terms of Service — use responsibly and for personal use.

---

## 🌟 Features

- **Multi-surface filtering**: Automatically hide videos from channels you blacklist on:
  - **Home Feed**
  - **Subscriptions Feed**
  - **Search Results**
  - **Comments**
- **Per-surface toggles**: Individually toggle filtering on or off for each surface in Morphe Settings.
- **Direct 3-dot menu action**: Easily blacklist or unblacklist any channel directly from a video card's 3-dot overflow menu with instant toast confirmation.
- **Local newline-separated storage**: Channels are saved locally on your device as a newline-separated list in Morphe Settings → Feed → Channel blacklist.
- **Settings Import & Export**: Blacklisted channels are automatically included in Morphe's global settings backup and restore.
- **Detailed statistics**: View live counters of hidden videos for the last 24 hours and all-time, broken down by surface, with one-tap reset options.
- **Smart buffer matching**: Scans video component protocol buffers in real time via Trie search, supporting case-insensitive variations and word-boundary safety.

---

## 📱 Compatibility

| Target App | Package Name | Compatible App Versions |
| :--- | :--- | :--- |
| **YouTube** | `com.google.android.youtube` | `21.37.42`, `21.36.45`, `21.35.442`, `21.28.208`, `21.13.164`, `21.07.247`, `20.31.42`, `20.21.37` |

---

## 🩹 Patches List

<!-- PATCHES_START -->
> **[v1.3.3](https://github.com/0-BlackSpectrum-0/channel-blacklist-patch/releases/tag/v1.3.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;21.37.42 | 🧪&nbsp;21.36.45 | 🧪&nbsp;21.28.208 | 21.13.164 | 21.07.247 | 20.31.42 | 20.21.37 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Channel blacklist](#channel-blacklist) | Filter and hide videos from blacklisted channels across YouTube feeds, search results, subscriptions, and comments. |  |

</details>

<!-- PATCHES_END -->

---

## 🚀 Installation

### Morphe Manager (Android)

1. Install Morphe Manager from **[morphe.software](https://morphe.software)** (or from [MorpheApp/morphe-manager releases](https://github.com/MorpheApp/morphe-manager/releases)).
2. Open Morphe Manager → **Patches / Repositories** → **Add source**.
3. Enter this repo's URL: `https://github.com/0-BlackSpectrum-0/channel-blacklist-patch` (or the raw `patches-bundle.json` link from the latest GitHub release).
4. Leave the official `MorpheApp/morphe-patches` source enabled — do **not** remove it; multiple patch sources can be active at once.
5. Select the target app (e.g. YouTube) → switch from **Simple mode** to **Expert mode** (full control over individual patch selection).
6. In the Expert Mode patch list you'll now see patches from **both** sources. Enable the official Morphe patches you normally use, plus **Channel Blacklist** from this repo, then open its options and set your blacklisted channel names/IDs.
7. Provide the original APK when prompted, tap **Patch**, then install the result.

### Morphe Desktop

1. Download the latest `morphe-desktop-*-all.jar` from [MorpheApp/morphe-desktop releases](https://github.com/MorpheApp/morphe-desktop/releases).
2. Download the official patches bundle (`.rvp`/`.mpp`) from `MorpheApp/morphe-patches` **and** this repo's release bundle.
3. GUI: launch the jar, switch out of Quick mode into the **Expert** patching screen, load both patch bundles, select the official patches you want plus **Channel Blacklist**, configure its options, choose your APK, and patch.
4. CLI equivalent (pass both bundles):
   ```bash
   java -jar morphe-desktop-*-all.jar patch \
     -p morphe-patches-*.mpp \
     -p channel-blacklist-patch-*.mpp \
     your_app.apk
   ```

---

## 🛠️ Building from Source

### Prerequisites
- JDK 21 or higher (e.g., Eclipse Adoptium Temurin)
- Android SDK configured (via Android Studio or `local.properties` with `sdk.dir=<path>`)
- GitHub Packages credentials in `~/.gradle/gradle.properties` (with `gpr.user` and `gpr.key`) to resolve upstream Morphe dependencies

### Build Steps
```bash
git clone https://github.com/0-BlackSpectrum-0/channel-blacklist-patch.git
cd channel-blacklist-patch

# Build the patches
./gradlew build
```

---

## 📄 License

This project is licensed under the **GNU General Public License v3.0** — see the [LICENSE](LICENSE) file for details.

### Upstream Notice & Restrictions
In accordance with GPLv3 Section 7 terms inherited from the Morphe upstream project:
- Derivative works must include the [NOTICE](NOTICE) file.
- Misrepresenting the origin of the program is prohibited (Section 7c).
- No rights are granted under trademark law to use the name "Morphe" or any associated logos/trade names for derivative applications or services (Section 7e).

---

> [!WARNING]
> **Use at your own risk.** This patch is an independent project created with AI assistance and is not affiliated with Google, YouTube, Morphe, or ReVanced.