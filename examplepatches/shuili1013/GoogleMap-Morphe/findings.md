# Google Maps Android Auto 機車路線研究

更新：2026-11-07（第二階段）。狀態：已實作並編譯兩處 bytecode 修改核心、完成離線測試及 DEX 重寫；Morphe Kotlin 接口已建立，但建置缺外掛而失敗。**尚無可安裝 patch／`.mpp`，未在手機或 DHU 實測**。

## 第二階段：已實作的離線原型

原始碼：`patch/core/src/main/java/tw/maps/TwoWheelerCore.java`；Morphe 接口：`patch/patches/src/main/kotlin/tw/maps/ForceTwoWheelerRouting.kt`。這是實際會修改 DEX 的程式，不是 placeholder，但仍屬實驗原型。

- 修改 `btxk.h()` 與 `qxa.b(...)`。僅當 vehicle provider 是投影資訊類別 `tql` 且車種為 `plq.b`（CAR），新增分支選取 `ckbl.f`／`qvv.b`。其餘情況回到完整原始程式。
- 沒有修改 enum、車種 getter、全域設定或 GPS／權限限制。原本 MOTORCYCLE、UNKNOWN、TRUCK 的邏輯保留。
- 兩個修改方法及五個支援方法（車種 enum、模式 enum、wrapper enum、投影 getter/reset）皆釘住完整方法 SHA-256。檢查涵蓋 signature、access flags、暫存器、指令運算元、引用、跳轉與例外範圍。Morphe 接口另檢查 package、versionName、versionCode，並在修改前驗證所有目標。
- `btxk.h` 增加一個暫存器，入口保存原始 this 暫存器位置；輸出重讀後已核對跳轉與參數。未改動的指令路徑保留。
- 離線結果在 `analysis/experiment/`，僅包含兩個研究用 DEX 與 `verification.txt`，不是安裝包。

已執行驗證：

1. 使用本機 JDK、Android Studio 內真實 dexlib2 3.0.9，以 `javac --release 11` 編譯核心。
2. 原始 classes2/classes4 SHA-256 必須吻合，才開始重寫。
3. 重讀輸出，比對兩個 DEX 的 **87,384 個方法 body**，僅預定兩處有修改；不將此宣稱為所有 APK 資源／執行行為的比較。
4. 解譯輸出 DEX 的 selector 與 builder 前段，完成 **64 個 mock-host 案例**：是否為投影 provider × 車種 × 原有 flag，builder 再含三種傳入 mode。這不是 Android／ART 模擬器。
5. 加入額外 NOP 的原始方法、重複套用、五個支援方法逐一缺失，都會被拒絕。
6. AOSP dexdump 對兩個輸出 DEX 的 checksum 檢查及完整反組譯通過。尚未做 ART verifier 或裝置執行驗證。

實際 Morphe build：用本機 cached Gradle 9.5.1 執行 `-p patch --offline --no-daemon buildAndroid`，在 settings plugin resolution 階段失敗，缺少 `app.morphe.patches:2.1.0`；完整紀錄為 `analysis/morphe-build.log`。沒有進入 Kotlin 編譯，也沒有產生 `.mpp`。官方 template 的 Gradle 已是 9.8.2，本機亦缺該版本。

原型限制：head unit 必須回報 CAR；selector 提早查詢 provider 的初始化／生命週期尚未實測；`qxa.b` 沿用既有 `ybr` 時未強改原 request，手機先啟動汽車導航再連 AA 的情境仍可能失敗。此原型不包含另名安裝與 AA bridge。

### 第二階段路線與重算證據

- `yff.d -> yff.h -> yff.p`：classes.dex `yff.p(Lcqlj;Lckbl;IIZ)V`，code offset `0x60f61c`，指令 `0x002d..0x0034` 把 `ckbl.k` 寫入 `cjfo.c` 並設定 presence bit。證據：`analysis/request-proto/classes_0x60f61c.txt`。因此不是只改圖示／文案。
- classes7.dex `bmcb.o(Lajeb;Lwah;ZZZ)V`，`0x42d228`，有 reroute 診斷訊息；在 `0x0127..0x012b` 讀取目前路線 `ycj.O`（request）與 `ycj.g`（mode），傳給 `carw.ak`。證據：`analysis/reroute-detail/classes7_0x42d228.txt`。
- `carw.ak(Lcqjz;Lckbl;)Lyet;`，classes3.dex `0x57d67c`，把收到的 request/mode 傳給 `yet` 建構子。證據：`analysis/reroute-adapter/classes3_0x57d67c.txt`。
- `bmdx.g(...)Lyed;`，classes7.dex `0x433410`，在 `0x001c..0x002e` 從 request 的 `cjfo.c` 還原 mode，再交給 `carw.ak`。證據：`analysis/request-chain/classes7_0x433410.txt`。
- 以上支持「Java 重算建立器沿用目前路線 mode」的靜態推論；**尚不足以證明伺服器回覆、native/offline reroute 或所有替代路線分支均正確**。
- `tqj.a()` 呼叫 `tql.t()` 清除投影車種，再發布 Boolean.FALSE；`plh.b()` 僅在 `CONNECTED_AND_DISPLAY_ACTIVE` 為真。生命週期證據已保存，但未宣稱所有重連競態皆已處理。

以下第一階段紀錄仍保留作為研究基線；有進展的項目以上述第二階段為準。

## 原始檔與環境

- 原始 APKM 保留於根目錄，大小 66,775,532 bytes。
- SHA-256：`9beffe7bc0581ad677477b164c6b11a9c5d9434b56620954776eddbb89b83e57`，與 handoff 相符；ZIP CRC 檢查通過。
- `info.json` 與 `aapt2 dump badging` 均確認 package `com.google.android.apps.maps`、版本 `26.44.06.1006895251`、versionCode `1068856906`。
- 29 個 APK（base 加 28 個 splits）；base 含 10 個 DEX。完整清單及逐檔雜湊：`analysis/inventory.json`。
- Python 3.12.10、Oracle JDK 25.0.4 可執行；另找到本機 JDK 21、Gradle 9.5.0/9.5.1 快取。
- Android SDK 位於 `C:\Users\shuili\AppData\Local\Android\Sdk`；使用 build-tools 36.0.0 的 `dexdump.exe`、`aapt2.exe`。
- 找到 platform-tools 的 ADB，但此受限環境執行 `adb version` 即因 `Cannot mkdir '\.android': Permission denied` 失敗。尚未確認手機連線。
- JADX/apktool 未在 PATH 或此次搜尋的常用工具位置找到。改以 SDK dexdump 完成全部 10 個 DEX 的指令反組譯；不是 Java 原始碼反編譯。
- `analysis/dexdump` 約 1.58 GB。Windows 版 dexdump 的 `-o` 失敗，因此腳本使用 Python 將 stdout 直接寫成檔案。
- 命令列下載 GitHub 資源實測遭 `WinError 10013` 網路限制。可透過網頁工具查官方文件，但無法據此完成工具／建置依賴下載。未要求提升權限。
- 目錄不是 Git repository；沒有可回報的本地 commit。

## 主要發現：已有投影機車模式分支

以下是**這個 APK 的靜態證據**，不代表 MS700CL 回報 MOTORCYCLE，也不代表啟用條件在使用者手機為真。

```text
tql.u(CarInfo, besz)
  CarInfo.r -> plq.a(int) -> tql.i
tql.d() -> 車種 enum（plq.d = MOTORCYCLE）

btxk.h()
  bwbm.l() && pkr.d() == MOTORCYCLE
    ? ckbl.f (TWO_WHEELER)
    : ckbl.a (DRIVE)

qxa.b(...)
  同樣檢查車種和 bwbm.l()
  成立時選 qvv.b -> qvv.d = ckbl.f
  新建路線物件路徑呼叫 yff.d(ckbl, 2)

trq.h(ckbl)
  比較傳入模式和 btxk.h() 是否不一致
trq.f()
  視不一致與其他條件加入投影模式限制原因
```

`bwbm.l()` 讀取設定物件 `cqob.g` 並要求 `bwbm.k()` 為真；`k()` 是 `cqob.b || bwbm.a`。尚未釐清設定欄位的服務端名稱、來源與本機預設值，不應把整個共用方法直接改為 true。

## 可重現的候選位置

以下 offset 是各自 DEX 中的 code_item 位址，不是 APK 位移或可跨版本使用的地址。完整方法及來源行號可由 `analysis/*/index.json` 查回。

| DEX | 方法／位置 | 已確認的作用 | 證據檔 |
|---|---|---|---|
| classes.dex | `plq.<clinit>()V`, `0x37ce0c` | `plq.b = CAR`；`plq.d = MOTORCYCLE` | `analysis/projection-types/classes_0x37ce0c.txt` |
| classes.dex | `tql.u(CarInfo,besz)V`, `0x5ed184` | 讀取 `CarInfo.r`，經 `plq.a(I)` 存入 `tql.i` | `analysis/classes/Ltql_.txt` |
| classes.dex | `tql.d()Lplq;`, `0x37fda8` | 回傳投影車種欄位 `tql.i`；同類別含 `ProjectedCarInfo:` dump | `analysis/classes/Ltql_.txt` |
| classes2.dex | `btxk.h()Lckbl;`, `0x6db9d8` | 依功能條件與 MOTORCYCLE 車種選 DRIVE / TWO_WHEELER | `analysis/projection-selector/classes2_0x6db9d8.txt` |
| classes3.dex | `bwbm.l()Z`, `0x528348`；`k()Z`, `0x1e55a8` | 讀取上述設定與條件 | `analysis/classes/Lbwbm_.txt` |
| classes3.dex | `ckbl.<clinit>()V`, `0x26c304` | DRIVE 為 `ckbl.a`；TWO_WHEELER 為 `ckbl.f`，後者建構參數 ordinal=5、另一本地數值=9 | `analysis/modes/classes3_0x26c304.txt` |
| classes4.dex | `qvv.<clinit>()V`, `0x4e6750` | 導航模式 wrapper：DRIVE / TWO_WHEELER / WALK 各映射到 ckbl | `analysis/projected-mode/classes4_0x4e6750.txt` |
| classes4.dex | `qxa.b(Lybr;Lyef;Lqvw;Lqvv;ZZ)Lcqjz;`, `0x4ec144` | MOTORCYCLE 與功能條件成立時改選 `qvv.b`；新建路徑將 ckbl 交給 `yff.d` | `analysis/projected-mode/classes4_0x4ec144.txt` |
| classes4.dex | `qwy.d(ImmutableList,ajeb,ybr)Lqvs;`, `0x4eb5b8` | 現有模式映射到 qvv，再呼叫 qxa.b | `analysis/projected-mode/classes4_0x4eb5b8.txt` |
| classes4.dex | `trq.h(Lckbl;)Z`, `0x6076a0`；`trq.f()V`, `0x607a40` | 檢查模式不符；使用 `PROJECTED_ONLY_DRIVING_SUPPORTED`／`PROJECTED_ONLY_TWO_WHEELER_SUPPORTED` 原因 | `analysis/mode-guards/`、`analysis/projected-mode/` |
| classes4.dex | `GmmCarProjectionService.b()Ljava/lang/Class;`, `0x472f48` | 回傳投影類別 `tqd` | `analysis/car-flow/classes4_0x472f48.txt` |
| classes6.dex | `bmgn.toString()String`, `0x6db634` | `requestedTravelMode` 對應欄位 `bmgn.g:Lckbl;` | `analysis/modes/classes6_0x6db634.txt` |

重要區別：`ckbl` 的機車建構數值 9，與 `bdgm` 的 5、`cbqh` 的 4 不同。這些 enum 用途不同，**不能全域將某個數字改成「機車數字」**。`ados.U` 的 `two_wheeler` 則是 URL `travelmode` 參數，不是已證實的 AA 後端請求 hook。

### 偏航重算的證據與缺口

- 找到 `ajgz.st(I)V`（classes.dex，`0x6ab250`）呼叫 `SnappingTracerJni.nativeOnRerouteRequested(JZJ)V`，完整證據在 `analysis/car-flow/classes_0x6ab250.txt`。
- 找到 `ActiveRouteMonitorJni.i(Lcgmi;)V`（classes7.dex，`0x430a00`）呼叫 `nativeOnRerouteRequested(J[B[B)[B`，再交給 `m([B)`。證據在 `analysis/car-flow/classes7_0x430a00.txt`。第一階段曾誤記為 `nativeHandleRerouteResponse`，已依實際指令更正。
- `qxa.b` 在有現有 `ybr` 時會取 `ybr.i()`；不能由「新建分支使用機車模式」推出所有重算／沿用路線分支也正確。
- 尚未連起 native reroute、原路線 mode、實際序列化請求三者，也未分析 native `.so`。目前不可聲稱偏航重算已解決。

## Morphe 與既有 AA bridge

查核日期：2026-11-07；以下上游 main 會變動，尚未取得並固定 commit。

- [官方 setup](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/1_setup.md) 使用 template 的 `gradlew buildAndroid`，再以 Morphe Desktop CLI 套用 `.mpp`。
- [template versions](https://github.com/MorpheApp/morphe-patches-template/blob/main/gradle/libs.versions.toml) 當次讀取為 patcher `2.2.0`；[settings](https://github.com/MorpheApp/morphe-patches-template/blob/main/settings.gradle.kts) 的 `app.morphe.patches` plugin 為 `2.1.0`。
- [patcher 說明](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_patches_intro.md) 與實際 source/template 用詞不完全一致；第二階段查核 [官方 example](https://github.com/MorpheApp/morphe-patches-template/blob/main/patches/src/main/kotlin/app/template/patches/example/ExamplePatch.kt) 及 source，確認仍有 `bytecodePatch`／`BytecodePatch`，因此接口採 `bytecodePatch`。不依文件標題推斷 API 已移除。
- [Manager v2.4.0 release](https://github.com/MorpheApp/morphe-manager/releases/tag/v2.4.0) 存在，發布日期 2026-11-04、release commit 顯示 `55b1f79`。尚未確認使用者手機安裝的 app 身分，以及該 tag 內建 patcher 的精確版本；不能只憑 Manager 版號保證 template 相容。
- 搜尋本機 Gradle module 快取未找到 Morphe 依賴。第二階段已建立 patch 專案並實際嘗試建置，失敗點及紀錄見上方。
- [Dutch Maps 文件](https://johninnl.codeberg.page/nl-morphe-patches/en/apps/google-maps/) 指定 `26.43.05.1002020710` / `1068844719` 完整單 APK，提供另名安裝後的原生 AA 導航 bridge。文件不宣稱機車路線支援。
- Codeberg repository、研究報告與 LICENSE 在本次工具讀取失敗。**未取得／審查原始碼或確認 license**，沒有複製其實作。

| 路線 | 優點 | 尚缺 |
|---|---|---|
| 指定 26.43 單 APK + Dutch bridge 作安裝／AA PoC | bridge 已有上游的桌面驗證記錄，減少先處理另名與車機介面的工作 | 對應原始 APK、原始碼與 license、重新定位該版本的機車 hook；它本身仍不是機車 patch |
| 移植到現有 26.44 APKM | 已有原始檔與本次精確靜態證據；包含投影 MOTORCYCLE 分支 | split 封裝與簽章、bridge 移植、建置依賴、完整路線／重算驗證 |

建議先用 26.43 支援版本驗證安裝與 bridge，並保留 26.44 作為機車模式研究基線。不要把 26.43 patch 強套在 26.44，亦不要以改版本標籤跳過 fingerprint。

## 下一步

1. 取得可用的 Morphe/JADX 工具和依賴，固定上游 commit；取得 Dutch bridge source 與 license。這是建置與 bridge 工作的外部缺口。
2. 在 26.44 繼續追 `btxk.h` 的 caller、`pkr` 的注入／生命週期、`qxa.b -> yff.d` 的 mode 序列化，以及 native reroute 繼承路徑。
3. 最小候選方向是僅對 AA session 的車種／模式選擇做一致調整；目前證據不支持直接改共用 enum、共用功能旗標或只改 `trq` 限制訊息。
4. 透過靜止車機或 DHU 記錄實際車種及功能條件，再比較同起訖點的手機機車／AA 路線。測試矩陣見 `tests/manual-validation.md`。
5. 只有在 start / preview / reroute 的範圍釐清、fingerprint 唯一且建置成功後，才產出標明實驗狀態的 `.mpp`。

原始 APKM／APK 未修改。第二階段僅在 `analysis/experiment` 輸出修改後的 DEX 副本；未簽章、安裝 app、變更手機系統或公開上傳 Google 私有檔案。
