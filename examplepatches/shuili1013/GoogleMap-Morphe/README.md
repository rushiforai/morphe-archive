# Google Maps Android Auto 機車路線研究

本專案已有可編譯、通過離線測試的 bytecode 修改核心，以及待建置驗證的 Morphe 接口；**沒有可安裝的 patch 或 `.mpp`**。進度、精確候選位置與限制見 [findings.md](findings.md)。目標與使用者環境見 [handoff.md](handoff.md)。

## 執行離線原型

```powershell
.\scripts\test-core.ps1
```

核心會在研究用 DEX 副本中，對投影 CAR 的模式選擇器及路線建立器加入機車分支。已通過 64 個條件案例、87,384 個方法的序列化後比對，以及變異／重複套用拒絕檢查。這些不等同手機或偏航實測。原始碼與建置限制見 [patch/README.md](patch/README.md)。

## 重現本機分析

將原始 26.44 APKM 保留在根目錄；使用 PowerShell、Python 3.12 及已安裝的 Android SDK build-tools：

```powershell
python scripts/inspect_apkm.py
python scripts/disassemble.py
python scripts/find_methods.py 'TWO_WHEELER|two_wheeler|CarNavigation|CarRoute|requestedTravelMode|NavLogTravelMode' --name modes
python scripts/find_methods.py 'Lqyf;\.[fg]:|Lqvv;\.b:' --name projected-mode --dump classes4.txt
python scripts/find_methods.py 'btxk\.h:' --name projection-selector --dump classes2.txt
python scripts/find_methods.py 'plq\.<clinit>:' --name projection-types --dump classes.txt
python scripts/find_methods.py 'trq\.h:' --name mode-guards --dump classes4.txt
python scripts/find_methods.py 'GmmCarProjectionService\.|nativeHandleRerouteResponse|nativeOnRerouteRequested' --name car-flow
python scripts/extract_classes.py 'Lpkr;' 'Lbwbm;' 'Lckbl;' --implementors
```

若 SDK 不在預設路徑，為 `disassemble.py` 傳入 `--dexdump '完整路徑\dexdump.exe'`。所有產物都寫入 `analysis/`，完整反組譯約 1.58 GB，另需原始 APK／DEX 解壓空間。原始 APKM SHA-256 不吻合時，盤點腳本會停止。

`find_methods.py` 支援 regex，輸出完整方法、DEX code offset、來源行號與證據文字 SHA-256。這是研究索引，**不是可套用 patch 的語意 fingerprint**。請避免在 PowerShell regex 參數中嵌入雙引號。

## 建置、安裝與回滾

上游建置 task 為 `buildAndroid`，本地專案在 `patch/`。實際離線建置失敗於缺少 `app.morphe.patches:2.1.0` 外掛，紀錄在 `analysis/morphe-build.log`；Kotlin 接口尚未編譯。需先補齊 Gradle 9.8.2 與 Morphe 依賴，才能繼續驗證 `.mpp`。

目前不提供安裝命令：`base.apk` 只是 split 安裝包的一部分，不能將它當成完整可安裝 APK，也不能用重新簽名的同包名檔案覆蓋原廠 Maps。

日後 PoC 應在驗證 bridge 與簽章／安裝方式後，使用獨立 package 與原版並存。回滾則解除安裝該實驗副本，並在 AA 選回原版 Maps；不移除原版、不清除其資料。本次未安裝任何東西，因此目前無須回滾。

測試僅限停車／桌面環境，見 [測試矩陣](tests/manual-validation.md)。原始 APK、splits、DEX 及分析輸出均由 `.gitignore` 排除，不公開散發。
