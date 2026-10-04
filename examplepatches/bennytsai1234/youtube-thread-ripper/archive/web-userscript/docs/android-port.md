# Android：ReVanced／Morphe 移植考量

目標是讓同一下載／調度實驗將來能在 Android YouTube 的原生播放器運作。這次交付網頁使用者腳本與移植依據，不包含可以安裝到手機的補丁或 APK；沒有假定使用者的 APK 版本、root 狀態或既有 patch 設定。

## 已查到的實際程式

研究日期：2026-10-01。Morphe source snapshot `92dd0ef86d12e1806152b454486269983b8db139`，當時公開 bundle v1.44.0。以下均為原始碼證據，不等於我們已驗證媒體注入點。

- [Morphe Patches](https://github.com/MorpheApp/morphe-patches)：`patches/` 以 Kotlin 建立 bytecode patches；`extensions/` 提供 Java／Kotlin 的執行期輔助邏輯。此結構可以承載下載邏輯與設定。
- [BaseNetworkProxyPatch.kt](https://github.com/MorpheApp/morphe-patches/blob/92dd0ef86d12e1806152b454486269983b8db139/patches/src/main/kotlin/app/morphe/patches/shared/misc/proxy/BaseNetworkProxyPatch.kt)：對 Cronet builder 與 engine 方法注入 helper，證實能掛接網路層，但這個 proxy hook 並未提供 SABR upload body 的修改能力。
- [字幕 Fingerprints.kt](https://github.com/MorpheApp/morphe-patches/blob/92dd0ef86d12e1806152b454486269983b8db139/patches/src/main/kotlin/app/morphe/patches/youtube/layout/captions/Fingerprints.kt)：有 `CronetEngine.newUrlRequestBuilder` 與 `UploadDataProviders.create(ByteBuffer)` 的 fingerprint。它是字幕流程的線索，不能直接當作 video playback 的證據。
- [SpoofVideoStreamsPatch.kt](https://github.com/MorpheApp/morphe-patches/blob/92dd0ef86d12e1806152b454486269983b8db139/patches/src/main/kotlin/app/morphe/patches/shared/misc/spoof/SpoofVideoStreamsPatch.kt)：約 386 行開始明確有「Disable SABR playback」區塊，依 helper 的決定改動串流選擇。因此手機端不一定仍走 SABR，須和既有 Spoof video streams 設定共存。
- [ReVanced 官方 patches template](https://github.com/ReVanced/revanced-patches-template)：提供建立自訂 patch repository 的路徑、Android build task 與自訂補丁組合。模板可用不代表其 API／bundle 能和 Morphe 互換；實作時要按目標 framework 版本編譯。
- [Morphe Manager](https://github.com/MorpheApp/morphe-manager)：支援加入相容 patch source。Android 補丁做完後，才有 bundle／自訂 source 可以交給 manager patch APK。

## 可以沿用的部分

`vendor/btr/` 的 Range 下載核心、`src/site-adapter.js` 的 YouTube 接入條件，以及 `src/core.js` 的 SABR wire patch 規格與 fixture 都不依賴 YouTube 的網頁內部物件。Android 需要以 Kotlin／Java 實作對應邏輯，用相同 hex 與 media truth 測試驗證；不為了共用幾個函式引入 JavaScript 執行引擎。

SABR patch 只動 root field 1（ClientAbrState）中的 float32 field 35（playback_rate），其餘 serialized fields 原樣保留。二進位 fixture 包含未知欄位、格式選擇、buffered ranges、streamer context。手機 port 需遵守相同 bytes 保留要求與 malformed passthrough，並支援 ByteBuffer 的 position／limit、read-only 與 direct buffer，不能假設 `array()` 一定可用。

一般 Range 的並行結果只能在原始順序與位元組完整性確認後交給原生消費者。取消／seek 要傳到子下載；不能在 seek 後把舊資料繼續送入新的播放工作。Web 第一版的全範圍合併本身也不一定是手機最合適的交付方式，Android port 需依原始 DataSource／Cronet consumer 的介面設計。

## 原生 Android 必須補上的部分

1. 選定實際 YouTube APK 版本與 Morphe／ReVanced framework 版本，找出媒體 POST body 的序列化／upload 注入點、取得實際播放倍速的注入點。Cronet 或 upload 字串本身不足以判定正確位置。
2. 按既有串流 spoofing 設定辨識目前是 SABR、DASH 或 HLS。若 SABR 停用，SABR 調度模式應明確顯示不適用，不能強迫改回另一個 client 或默默關掉既有 patch。
3. 先做 SABR body helper 與設定注入。第一版可以沿用網頁實驗的兩種速率回報；若真正原因是客戶端不發出新請求，單改回報仍不會建立新的預取調度器。
4. 若改做真正的 SABR 預取，必須管理會話 context／cookie 更新、格式與分段身份、UMP 解析、消費順序、seek／取消和快取。不能把同一 POST 任意複製成數條並行下載。
5. 將實驗開關、模式、辨識／修改／回退計數放進既有 patch 設定頁。預設不增加播放器浮動 UI。
6. 在指定 APK 做 patch/build/launch，再以同影片、同畫質、同倍速和既有 spoofing 設定做可比測試，記錄等待、buffer、掉幀與資料傳輸；記憶體、電量與行動資料消耗也要一起看。最後才交付可用 bundle 與對應相容版本。

## 部署路徑判斷

| 目標 | 這次成品能否直接用 | 後續工作 |
| --- | --- | --- |
| 桌面 Chrome + Tampermonkey | 可匯入使用者腳本，仍需真實播放測試 | 已產出網頁第一版 |
| Android 的 YouTube 網頁 | 取決於手機瀏覽器及使用者腳本管理器是否支援頁面世界的 fetch/XHR hooks | `m.youtube.com` 已包含 match；尚未實機驗證，不承諾特定瀏覽器 |
| Android YouTube + Morphe | 不可直接用 `.user.js` | 開發 Kotlin patch + Java/Kotlin helper，按 Morphe framework 編譯 bundle |
| Android YouTube + ReVanced | 不可直接用 `.user.js` | 使用對應 patches template/API 做另一個 framework adapter |

目前研究足以判斷「有可探索的手機接入路徑」，不足以宣告「已能在手機部署」。優先用網頁版檢驗 SABR 需求回報的假設；若無效，先校正核心策略，再投入 APK fingerprint 與補丁相容性工作。這是工程順序，不是要求先證明使用者的卡頓原因。
