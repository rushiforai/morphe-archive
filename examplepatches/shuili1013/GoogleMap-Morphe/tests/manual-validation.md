# 桌面／靜止驗證矩陣

狀態：以下尚未執行。沒有 `.mpp`，不把這份測試計畫列為通過結果。

## 原版基線

1. 確認 ADB 在使用者的一般終端機可執行、S25 已授權；先讀取版本與連線資訊，不安裝或移除 app。
2. 準備兩個公開地標，避開家／公司位置。在手機 Maps 明確選機車模式，記錄主要道路、路線形狀與模式，再記錄汽車模式作對照。
3. 可自行將下列 `LAT,LON` 換成公開地標座標，分別測 `l`／`d`。此命令會啟動原版 Maps；腳本未自動執行。

```powershell
adb shell am start -a android.intent.action.VIEW -d '"google.navigation:q=LAT,LON&mode=l"' -p com.google.android.apps.maps
```

4. 接上靜止車機或依官方文件啟動 DHU，以相同位置和目的地重做，觀察 AA 是否換回汽車模式。若車機未到，DHU 的測試位置／模擬軌跡須一致。

`mode=l` 的官方語意來源：[Google Maps intents](https://developer.android.com/guide/components/google-maps-intents)。手機 Intent 成功不代表 AA 保留相同模式。

## 候選 patch 可用後

| 情境 | 需觀察的證據 | 結果 |
|---|---|---|
| 冷啟動 AA 搜尋、預覽、開始導航 | 模式與道路選擇符合手機機車基線，語音／介面正常 | 未測 |
| 手機先開始導航，再連 AA | 原路線是否保留或重建，mode 是否一致 | 未測 |
| DHU 模擬偏離路線 | 重算後仍為機車道路選擇；如能取得本地 mode 證據一併記錄 | 未測 |
| 更換目的地、加途經點 | 所有重新建立路線入口均正確 | 未測 |
| AA 斷線、重連、app 重啟 | session 車種與模式沒有殘留／回落 | 未測 |
| 離開 AA 後手機的汽車、步行、單車模式 | 不被強制機車模式影響 | 未測 |
| 原版與實驗副本並存 | AA 開啟的是選定副本，原版資料及啟動正常 | 未測 |

研究診斷應只記錄 package/version、session 是否投影、車種 enum、路線 mode 和候選方法是否執行。不直接蒐集完整 logcat、token、帳號或精確個人位置。`ProjectedCarInfo` 完整 dump 可能含 vehicle ID，分享前須刪除識別資訊。

如果只有 UI 圖示或 ETA 改變，沒有模式與道路選擇證據，判定為未驗證。任一偏航／途經點案例回到汽車模式，均不得宣稱達成完整目標。只做靜止或模擬測試，不以實際騎乘驗證未經確認的導航。
