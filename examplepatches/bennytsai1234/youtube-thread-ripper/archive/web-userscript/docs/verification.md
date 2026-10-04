# BTR 原碼移植版驗證

日期：2026-10-01。腳本版本 `2026.10.1.1`，專案版本 0.2.0。

已取代 0.1.0 的自製介面與自製 Range 排程。BTR 原始來源固定於 `e64553b1ea911946387a1cf14992ac3fc008e07d`，11 個原檔在 vendor/btr，SHA256 可核對。原版 settings panel CSS、通知元件、IDM downloader 原文沿用。

- Node 測試：20 項通過，0 失敗；覆蓋來源雜湊／CSS 真值、SABR bytes、真正 BTR fetch/XHR 下載、query 200 適配與過長／不足／錯位拒絕、XHR events／復用、下載中 seek 取消且不重送，以及原生通過。
- 建置與成品語法檢查成功。
- Chrome 合成整合頁：8 / 8 通過，包括原版 BTR 排程並行與原生 XMLHttpRequest arraybuffer 逐位元組相同。
- 手動操作原版面板：模式切換、自動執行緒開關／滑桿停用、懸浮入口顯示／重開、隱藏與關閉，均確認有效。面板截圖在 btr-settings.png。

這些是程式與合成瀏覽器驗證；未在本次操作中更新使用者的 Tampermonkey，未做真實 YouTube A/B，也未產出 Android APK。來源樣式相同不能推出跨站播放效能相同。全接管與直播尚未適配，UI 明確停用。
