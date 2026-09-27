# 🧩 lchanc3's patches

給 [Morphe](https://github.com/MorpheApp) 用的 patch，目前支援 JPTT（PTT 的 Android app）和
[Local Dream](https://github.com/xororz/local-dream)（手機上跑的 Stable Diffusion）。

## 📥 使用方式

1. 在 Morphe Manager 新增 patch 來源，網址填：

   ```
   https://raw.githubusercontent.com/lchanc3/morphe-patches/main/patches-bundle.json
   ```

2. 選擇要 patch 的 app，照預設勾選打包安裝。安裝前請先看那個 app 的使用說明：
   [JPTT](docs/JPTT.md)、[Local Dream](docs/Local%20Dream.md)。
3. 之後的新版，Manager 會從這個來源抓。每一版改了什麼，在 Manager 的「檢視變更紀錄」或
   [Releases](https://github.com/lchanc3/morphe-patches/releases) 都看得到。

想自己編譯或寫新的 patch，請看 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 🩹 Patches

<!-- PATCHES_START -->
> **[v1.3.1](https://github.com/lchanc3/morphe-patches/releases/tag/v1.3.1)**&nbsp;&nbsp;•&nbsp;&nbsp;15 patches&nbsp;&nbsp;•&nbsp;&nbsp;2 apps

<details open>
<summary>📦 JPTT&nbsp;&nbsp;•&nbsp;&nbsp;14 patches</summary>

**Supported versions:**

| 3.8.4 | 3.8.5 | 🧪&nbsp;any |
| :---: | :---: | :---: |

| Patch | Description | Options |
|---|---|---|
| **Disable Play license check** | Disables the Play Store license check, which a patched app always fails and which closes the app on launch. Needed by every patched build. |  |
| **Fix article list loading** | Drops the ANSI escape sequences JPTT's terminal emulator cannot parse, which otherwise swallow the screen content that follows them. Fixes the article list being stuck at 載入中, and keeps the next sequence PTT adds from breaking the app again. |  |
| **Fix image links** | Shows the picture for links an image host answers with a web page: an imgur album or .mp4, an address missing the i. subdomain, a meee.com.tw page. Only the preview and the full size image change, not the article text. |  |
| **Fix photo upload in clones** | Fixes taking a photo to upload when the Clone app patch has renamed the package. Changes nothing on a normal install. |  |
| **Increase image cache size** | Keeps the images of the article you are reading in memory, so they are not read again when you scroll back, and gives the memory back once the app has been in the background for a while. A disk cache behind it covers coming back after that. | `memoryCacheSizeMb`<br>`releaseAfterMinutes`<br>`cacheSizeMb` |
| **More recent searches** | Shows more of your recent search keywords in the article search dialog. | `boardKeywordCount`<br>`allKeywordCount` |
| **Patch settings** | Adds a tab to JPTT's own settings where the options these patches add can be changed without patching the app again, and where every setting can be exported to a file and read back. |  |
| **Play GIFs** | Plays animated GIFs and WebPs in articles, which the app shows as their first frame. Needs Android 9 or later; the full size viewer still shows the first frame. |  |
| **Preload article images** | Downloads an article's images as soon as you open it instead of when you scroll to each one. Respects the app's own image loading settings. | `preloadLimit`<br>`concurrency` |
| **Reconnect on return** | Reconnects the moment you come back to the app, instead of leaving you on a countdown that grows to eight seconds. While an article is open it waits until you leave it or do something that needs PTT, so opening links does not log you in again every time. |  |
| **Remove ads** | Stops the banner, the rows inside articles and lists, and the ad the app falls back to when it thinks AdMob is blocked. No ad is requested at all, so nothing is downloaded and nothing is reported. |  |
| **Search history actions** | Long press a recent search keyword in the article search dialog to delete it, clear the history, or add a home screen shortcut that opens the board with that search. Shortcuts made from the 最近搜尋 tab open the search too. |  |
| **Stop on login ban** | Shows PTT's message and stops when it temporarily bans the account from logging in, instead of sitting at 連線中 until the app is closed. |  |
| **Wrap recent searches** | Lays the recent search keywords out over several lines instead of one line you have to scroll sideways. |  |

📖 安裝前必讀、常見問題與功能說明：[JPTT 使用說明](docs/JPTT.md)

</details>

<details open>
<summary>📦 Local Dream&nbsp;&nbsp;•&nbsp;&nbsp;1 patches</summary>

**Supported versions:**

| 3.0.0-alpha.3 |
| :---: |

| Patch | Description | Options |
|---|---|---|
| **Batch upscale** | Lets the image upscale screen take several pictures at once. Picking one works as before; picking more opens a screen that upscales them one after another with the upscaler and scale chosen there, where each result can be zoomed, compared with its original, and saved on its own or all together. |  |

📖 安裝前必讀、常見問題與功能說明：[Local Dream 使用說明](docs/Local%20Dream.md)

</details>

<!-- PATCHES_END -->
