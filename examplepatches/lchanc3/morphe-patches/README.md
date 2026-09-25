# 🧩 lchanc3's patches

給 [Morphe](https://github.com/MorpheApp) 用的 patch，目前支援 JPTT（PTT 的 Android app）。

## 📥 使用方式

1. 在 Morphe Manager 新增 patch 來源，網址填：

   ```
   https://raw.githubusercontent.com/lchanc3/morphe-patches/main/patches-bundle.json
   ```

2. 選擇 JPTT，照預設勾選打包安裝。安裝前請先看 [JPTT 使用說明](docs/JPTT.md)。
3. 之後的新版，Manager 會從這個來源抓。每一版改了什麼，在 Manager 的「檢視變更紀錄」或
   [Releases](https://github.com/lchanc3/morphe-patches/releases) 都看得到。

想自己編譯或寫新的 patch，請看 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 🩹 Patches

<!-- PATCHES_START -->
> **[v1.2.8](https://github.com/lchanc3/morphe-patches/releases/tag/v1.2.8)**&nbsp;&nbsp;•&nbsp;&nbsp;12 patches&nbsp;&nbsp;•&nbsp;&nbsp;1 app

<details open>
<summary>📦 JPTT&nbsp;&nbsp;•&nbsp;&nbsp;12 patches</summary>

**Supported versions:**

| 3.8.4 | 3.8.5 | 🧪&nbsp;any |
| :---: | :---: | :---: |

| Patch | Description | Options |
|---|---|---|
| **Disable Play license check** | Disables the Play Store license check, which a patched app always fails and which closes the app on launch. Needed by every patched build. |  |
| **Fix article list loading** | Drops the ANSI escape sequences JPTT's terminal emulator cannot parse, which otherwise swallow the screen content that follows them. Fixes the article list being stuck at 載入中, and keeps the next sequence PTT adds from breaking the app again. |  |
| **Fix image links** | Shows the picture for links an image host answers with a web page: an imgur album or .mp4, an address missing the i. subdomain, a meee.com.tw page. Only the preview and the full size image change, not the article text. |  |
| **Fix photo upload in clones** | Fixes taking a photo to upload when the Clone app patch has renamed the package. Changes nothing on a normal install. |  |
| **Increase image cache size** | Raises the image cache limit so images you have already seen are not downloaded again when you scroll back. | `cacheSizeMb` |
| **More recent searches** | Shows more of your recent search keywords in the article search dialog. | `boardKeywordCount`<br>`allKeywordCount` |
| **Patch settings** | Adds a tab to JPTT's own settings where the options these patches add can be changed without patching the app again, and where every setting can be exported to a file and read back. |  |
| **Preload article images** | Downloads an article's images as soon as you open it instead of when you scroll to each one. Respects the app's own image loading settings. | `preloadLimit`<br>`concurrency` |
| **Reconnect on return** | Reconnects the moment you come back to the app, instead of leaving you on a countdown that grows to eight seconds and does not even run while the app is in the background. |  |
| **Remove ads** | Stops the banner, the rows inside articles and lists, and the ad the app falls back to when it thinks AdMob is blocked. No ad is requested at all, so nothing is downloaded and nothing is reported. |  |
| **Search history actions** | Long press a recent search keyword in the article search dialog to delete it, clear the history, or add a home screen shortcut that opens the board with that search. Shortcuts made from the 最近搜尋 tab open the search too. |  |
| **Wrap recent searches** | Lays the recent search keywords out over several lines instead of one line you have to scroll sideways. |  |

📖 安裝前必讀、常見問題與功能說明：[JPTT 使用說明](docs/JPTT.md)

</details>

<!-- PATCHES_END -->
