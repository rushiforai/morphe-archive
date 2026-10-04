# YouTube Thread Ripper：BTR 原碼移植版

這次直接以 Bilibili-thread-ripper 原始碼為基底，沿用設定面板、CSS、通知、設定儲存、IDM Range 下載器、自動執行緒，以及原生 fetch/XHR 輸送程式。已替換 0.1.0 自製面板與自製 Range 排程。保留原生 YouTube 播放器；效果仍需真實播放比較。

## 安裝／更新

成品 `dist/youtube-thread-ripper.user.js`，腳本版本 `2026.10.1.1`（專案版本 0.2.0）。名稱與 namespace 保留前版身份。

已安裝前版時，在 Tampermonkey 編輯該腳本，以成品的全部內容取代並儲存，再重新整理 YouTube。第一次安裝可新增腳本貼入全部內容，或用控制台的檔案匯入。避免同時啟用兩份 YouTube 腳本。

在 Tampermonkey 選單選「线程撕裂者设置」，會開啟 BTR 原版面板。預設隱藏懸浮入口；勾選「悬浮按钮」可啟用原版可拖曳入口。點「关闭」、面板外側或 Esc 關閉設定視窗。Debug 分類、通知卡片、設定滑桿、開關、自動執行緒與診斷複製都使用原版程式。

## 沿用與適配

來源：[Bilibili-thread-ripper](https://github.com/MrTangLuyao/Bilibili-thread-ripper)，固定 commit `e64553b1ea911946387a1cf14992ac3fc008e07d`。11 個未修改原檔（含 LICENSE）在 `vendor/btr/`，manifest 記錄 LF 正規化後的 SHA256。

- `settings-panel.js`：CSS 全文沿用，保留 modal/shadow DOM、滑桿、開關、拖曳與關閉行為；只改 YouTube 所需的標誌、模式名稱和不適用選項。
- `notification-view.js`、`idm-downloader.js`：原始碼直接納入成品，沒有改寫樣式或下載排程。
- `range-core.js`、`cdn-resolver.js`、`bridge.js`、loader／storage shim：沿用原版；調整主機識別、URL 來源、預設值及獨立儲存／事件命名。
- `native-range-transport.js`：直接取用原版通用 fetch/XHR 區段；把 B 站播放器／画質介面替換為 YouTube 媒體 URL 規則。
- `src/site-adapter.js`／`src/runtime.js`：YouTube 接入與統計串接。`src/core.js` 僅保留 BTR 沒有的 SABR protobuf 修改。

`scripts/adapt-btr.cjs` 的每項適配都有固定來源錨點，來源改動導致錨點不符時會中止建置，避免默默產生錯版。原版 MIT 授權與署名保留於 `NOTICE`、`vendor/btr/LICENSE` 與成品。

## YouTube 上的實際行為

| 路徑 | 行為 |
| --- | --- |
| 普通 MP4/WebM GET，fetch 或非同步 arraybuffer XHR，固定起訖 range | 使用 BTR IDM downloader 的分塊、併行池、自動執行緒、進度、重試／續傳；驗證與合併後交還原生消費者 |
| SABR POST，fetch 或非同步 XHR | 預設原樣通過；可選擇依實際倍速或額外需求回報，回應由原生播放器處理 |
| 同步 XHR、非 arraybuffer XHR、UMP、直播、簽名包含 range 的 URL、無足夠媒體資訊 | 原生通過 |

Range 只接管 HTTPS googlevideo `/videoplayback`，不更換簽名 URL 主機。B 站的多 CDN 清單不適用，這裡沿用伺服器給的原始 URL 與 BTR 節點測量政策。Header Range 需真實 206／Content-Range。Query range 需已知 `clen`，把 CDN 的 200 慣例適配成 BTR 可驗證的格式；檢查可見 Content-Range、Content-Length，再限制讀取 bytes 並核對總長。若 CDN 不公開原始 Content-Range，長度正確本身不能獨立證明 offset。

單個原始 Range 超過 16 MiB 原生通過，以限制合併記憶體。取消／seek／停用會取消 BTR 子下載。fetch 的下載失敗回退一次原始 GET，取消不回退；XHR 保留 BTR 的 error／abort／timeout 與復用語義，讓原生播放器恢復。SABR POST 不做失敗重送。

面板的三個模式沿用原版三段式選擇器：

- **原生调度（預設）**：SABR 不修改，普通 Range 仍由 BTR 下載器處理。
- **实际倍速**：SABR 回報不低於實際播放速度；若原生已正確回報則不改。
- **额外预取**：把需求回報乘 2；例如實際 3 倍，回報 6。保留 player time、buffered ranges、格式與會話欄位，不改實際播放倍速。這只是實驗，不代表伺服器必然提早供應。

沒有完整 YouTube MediaSource/SABR 接管器，也沒有額外 SABR 請求／UMP 快取。「全接管」「直播加速」保留原版所在位置，明確標示未接入並停用；目前使用兼容模式。面板與通用下載體驗沿用 BTR，不宣稱跨站播放效果必然相同。

執行緒滑桿 4／8／16／32／64／128、自動 8–32、首字節／停滯超時、重試與續傳規則直接來自 BTR。預設 8 且開啟自動執行緒。YouTube buffer 餵給自動控制器時按实际倍速換算成實際可播放秒數。

## 驗證與開發

不需要 npm 套件依賴：

```powershell
npm test
npm run build
npm run check
node scripts/serve.cjs
```

最後一個命令啟動僅綁定 127.0.0.1 的合成瀏覽器案例，終端印出網址；Ctrl+C 結束。改 source 或適配邏輯後先 build 再重新整理。來源追蹤與檢查結果見 [驗證紀錄](docs/verification.md)，面板實際畫面見 [截圖](docs/btr-settings.png)。

測試核對原版檔案雜湊、CSS 原文相同、未改下載／通知模組、SABR 完整 bytes、真正 BTR 下載器的 fetch/XHR 輸送、取消和原生通過。合成測試不包含 Tampermonkey/CSP、真實 CDN／YouTube Worker 或播放效能 A/B。

同一影片、相同 4K 與固定倍速，交錯比較停用／原生調度／額外預取；每輪重新整理。用 YouTube 詳細統計資料比較 buffer、等待與掉幀。診斷資料可看到 Range 交付與 SABR 修改計數；請求成功不等於已加速。

## 手機

仍保留 [ReVanced／Morphe 移植文件](docs/android-port.md)。這次用 BTR 的既有核心作為後續來源依據；Android 要依指定 APK／framework 做 Kotlin/Java 接入，不能直接執行 `.user.js`。目前沒有 Android bundle 或 APK。
