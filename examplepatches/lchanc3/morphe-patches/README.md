# 🧩 lchanc3's patches

個人用的 [Morphe](https://github.com/MorpheApp) patch bundle。

## ❓ About

想自己編或加新的 patch，看 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 🩹 Patches

<!-- PATCHES_START -->
> **[v1.2.7](https://github.com/lchanc3/morphe-patches/releases/tag/v1.2.7)**&nbsp;&nbsp;•&nbsp;&nbsp;11 patches&nbsp;&nbsp;•&nbsp;&nbsp;1 app

<details open>
<summary>📦 JPTT&nbsp;&nbsp;•&nbsp;&nbsp;11 patches</summary>

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
| **Wrap recent searches** | Lays the recent search keywords out over several lines instead of one line you have to scroll sideways. |  |

**要注意的：**

- **Disable Play license check 一定要勾。** JPTT 用 Google 的 PairIP 保護，重簽過的 build
  一定驗不過，會跳「Something went wrong / Check that Google Play is enabled」，只有 Close
  可按，按下去就關掉 app。這跟有沒有用 Clone app 無關，所有 patch 過的版本都會遇到。
  這個 patch 擋的是 `LicenseClient.initializeLicenseCheck()` —— 所有路線的交會點：3.8.4 是
  `LicenseContentProvider.onCreate()` 直接叫它，3.8.5 多了一層 `checkLicense(Context)`，
  而且從 **`com.pairip.application.Application.attachBaseContext()`**（比 app 自己的任何
  程式碼都早）也叫一次。順便把失敗後會做的事也清掉（錯誤對話框、付費牆、關閉 app、
  週期性重驗），所以就算哪天 PairIP 從別的路線觸發，最糟也只是什麼都沒發生。
  **它不是只在啟動時驗一次**：`scheduleRepeatedLicenseCheck()` 會排程重驗，所以擋不乾淨的
  症狀是「用到一半才跳」。

- **搭配 Morphe 的 Clone app patch 時，它自己那兩個選項都要開**，否則裝不起來：
  *Update providers* 不開會撞 `INSTALL_FAILED_CONFLICTING_PROVIDER`（JPTT 有六個 provider
  authority 還叫 `com.joshua.jptt.*`）；*Update permissions* 不開會撞
  `INSTALL_FAILED_DUPLICATE_PERMISSION`（`DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION` 的
  protectionLevel 是 signature）。開了 Update providers 之後「上傳圖片 → 拍照」會壞掉，
  那正是 **Fix photo upload in clones** 要修的。

- **文章列表卡在 載入中、畫面欄位歪掉，是 JPTT 的 escape 解析器只做半套。**
  `JSocketSimple.startConnection()` 只對 `A B C D H J K m` 這幾個結束字元有 case，
  其他一律往 32 字的 buffer 塞，序列永遠不結束，就一路吃掉後面的畫面內容。PTT 從
  2026/09/20 起陸續加了 DEC2026 同步輸出（`ESC[?2026h` / `ESC[?2026l`）、SGR Mouse、
  SGR 66 一字雙色、Cursor Position Report（`ESC[6n`），並在 PttCurrent 板請各家 client
  乾脆把 ECMA-48 的 CSI 讀完整：`\x1B\[[0-?]*[ -/]*[@-~]`，讀完丟掉也行。
  **JPTT 3.8.5 只補了「`?` 開頭再收到 `h` / `l`」那一種**，所以 DEC2026 和 SGR Mouse
  沒事，但 `ESC[6n`（PTT1 9/27 上線，登入時用來偵測終端機編碼）的結束字元是 `n`，一樣
  會中。**Fix article list loading 在 3.8.5 上要繼續勾**，它做的就是 PTT 建議的那件事：
  整段 CSI 讀完，emulator 沒實作的就丟掉。想自己看的話：關於JPTT → 長按 JPTT 圖示 →
  終端機內容。

- **PTT 的介面改版會打到 JPTT，而且沒有 patch 擋得住。** PTT1 10/04 換標題列與主選單
  狀態列，10/18 換各列表的左下標籤：`　選擇看板　` → `　看板列表　`／`　我的最愛　`，
  `　文章選讀　` → `　文章列表　`／`　系列文章　`／`　文摘列表　`，`　鴻雁往返　` →
  `　信件列表　`。JPTT 的狀態機是 `lineNContains(23, 1, 9, "文章選讀")` 這樣寫死比對的，
  3.8.5 的 dex 裡還是只有舊字串。到時候進看板、收信、我的最愛都會卡住，要等官方更新，
  或是等這裡生一個改字串比對的 patch。

- **Fix image links 只換預覽圖要抓的網址，內文的連結不動。** imgur 的 `.mp4` / `.gifv`
  會換成同一個 id 的 `.jpg`，那是 imgur 自己產的靜止畫格 —— 是「看得到圖」，不是能播的影片，
  要看動的還是點進去用瀏覽器。相簿（`imgur.com/a/...`、`/gallery/...`）會去讀那頁的
  `og:image` 再拿直連網址，每個連結只查一次並記起來；**多張圖的相簿只會出第一張**，
  查不到 `og:image`（例如 id 根本不是相簿）就原樣不動。meee 是照原始副檔名存的（`.png` 和 `.jpg` 都有），
  頁面上又沒有 `og:image` 可以讀，所以是依序試 `.png` → `.jpg` → `.gif` → `.webp`，每個 id 只試一次
  並記住結果。

- **切到別的 app 就斷線，不是 patch 壞了，也不是 PTT 或網路的問題，是手機的省電策略。**
  實測（Xiaomi HyperOS，螢幕全程亮著、Wi-Fi）：app 離開前景約 5～8 秒後，Android 把它的 uid
  踢出背景連網允許名單（netpolicy 的 `10516-background-default`），netd 接著直接砍掉既有
  socket —— 規則變更到 `WebSocket failed` + `SocketException: Software caused connection abort`
  中間只隔 **7 毫秒**。把同一個 app 加進 doze 白名單再測一次，同樣的操作連線兩分鐘都不掉。
  對照組另外驗過：PTT 的 ws 伺服器閒置七分鐘不踢人（而且它自己不送 ping，只回 pong），
  同一台路由器底下的閒置連線七分鐘也不會被 NAT 收掉。
  **解法是設定，不是 patch**：應用設定 → 該 app → 省電策略 → 無限制（電池最佳化一起關）。
  注意 clone 和官方版是兩個不同的 app，要各設各的。**Reconnect on return** 只是讓你切回來時
  立刻重連、不用等那個最長 8 秒的倒數，治不了根因。

- **Patch settings 那個分頁在「設定」的最後一頁（叫 lchanc3）。** 上面的 patch 選項就是
  Morphe Manager 打包時那幾個，差別是現在 Manager 那邊填的只是**預設值**，裝好之後在 app 裡
  還能改，不用重打包；欄位留空就回到預設值。圖片快取上限改完要重開 app 才生效（Fresco 的
  快取是啟動時設定的），其他即時生效。**匯出不含帳號密碼** —— 那些存在另一個檔案
  （`com.joshua.jptt.logininfo`），這個 patch 不碰。匯入後同樣要重開 app，因為 JPTT 很多設定
  是啟動時讀進靜態欄位的。

- **Remove ads 擋的是四個地方**，而且是**不發出請求**而不是把結果藏起來：`Util` 裡那個所有
  橫幅共用的工廠（照樣建出 AdView 但不 `loadAd`，並設成 GONE，所以版面不會留洞）、文章與精華
  列表裡的原生廣告列（`NativeAdItem.loadAd()` 直接 return，那個列自己就會縮成 0 高度）、
  JPTT 在「偵測到 AdMob 被擋」時改用的自家廣告與 TAMedia 橫幅、以及 `JpttApplication` 啟動時
  的 AdMob 與 Aotter Trek 兩個 SDK 初始化。
  順帶一提，JPTT 判斷「AdMob 被擋」的方法是**開機時讀 `/etc/hosts` 找 `admob` 和 `vpon` 字串**，
  所以走 DNS 過濾（Pi-hole、私人 DNS）不會被它偵測到 —— 你只會看到空白版位，它不會改走自家廣告。

- 修改過的 APK 會用新的簽章，**不能**直接蓋掉官方版本安裝。要嘛先移除原本的 JPTT
  （先記下帳號設定），要嘛用 Clone app 改 package name 另裝一份。

</details>

<!-- PATCHES_END -->
