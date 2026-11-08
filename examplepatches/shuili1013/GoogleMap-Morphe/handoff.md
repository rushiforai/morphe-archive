# Handoff — Google Maps Android Auto 機車路線 Morphe Patch

> 給桌面版 Codex 的交接文件。請直接在本機開發，不要把這份計畫誤認為已完成的 Patch。
> 建立日期：2026-11-07；狀態：**已取得原始 APKM，尚未定位 bytecode hook、尚未編譯/實測 Patch**。

## 0. 請 Codex 直接執行的工作

請以資深 Android reverse engineering / Kotlin / Morphe patch developer 身分，將本文件當成實作規格：

1. 先盤點本機環境與原始檔，解析 APKM 的 `info.json`、`base.apk`、split APK，確認可用的反編譯與 Morphe 建置工具。
2. 查證 Morphe **目前版本**的官方 patches template / DSL / build 命令；不要根據過時範例猜 API。
3. 研究 Google Maps **Android Auto 路線模式**與手機版 `TWO_WHEELER` 模式的控制流程，優先尋找交通模式被 AA 覆寫成 `DRIVE` 的切入點；也分析偏離路線重算。
4. 實作可編譯、**對特定 Maps 版本有精確 fingerprint** 的 Morphe `BytecodePatch`。無可靠 hook 就不要任意改 enum、字串或二進位常數。
5. 盡可能產出 `.mpp`、建置步驟、測試程式，以及 `findings.md`（證據、方法、修改位置、限制、風險）。若逆向仍卡住，交付可重現的研究成果和下一步，不要虛報成功。
6. 若使用者提供的版本無法直接使用既有 Android Auto patch，請明確比較「採用現有支援的版本作 PoC」與「移植到現有版本」兩條路線，並優先採可驗證且工作量較低的途徑。

**核心目標：** 讓 **Polaroid/Pernis MS700CL** 機車 CarPlay/Android Auto 螢幕透過 **Android Auto** 顯示正常 Google Maps 導航 UI，但**路線請求和偏航重算均使用台灣機車（two-wheeler）規劃**，而不是汽車規劃。保留一般手機版導航與其他模式的正常行為。

## 1. 使用者環境

| 項目 | 已知資料 |
|---|---|
| 手機 | Samsung Galaxy S25 |
| 系統 | One UI 8.5、Android 16 |
| Morphe | Morphe 2.4.0（使用者回報；需確認是 Manager 版本還是其他元件） |
| 車輛 | 2024 KYMCO 光陽大地名流 2.0，125cc |
| Android Auto 螢幕 | Pernis/Polaroid MS700CL，準備安裝／使用 |
| 開發電腦 | Windows（預期以桌面版 Codex 開發）；實際 JDK / ADB / Python / Gradle 安裝情形待探測 |
| Root | 未宣稱有 Root；**不要假設 Root 可用** |
| 使用地區 | 台灣；機車路線不得等同「汽車避開高速公路」 |

## 2. 使用者已提供的輸入檔（重要）

請讓使用者在 Codex 的本機工作資料夾中，放入下列原始 APKM（或由 Codex 從使用者指定的路徑複製）。**ChatGPT 沙盒路徑 `/mnt/data` 不會自動出現在使用者的 Windows 電腦。**

```text
com.google.android.apps.maps_26.44.06.1006895251-1068856906_1arch_3dpi_24lang_a4b6151e97dd2c87b0abd2bf3417c169_apkmirror.com.apkm
```

### 已經實際檢查過的事實

- APKM 是有效 ZIP 格式的 **split APK** 容器；並非單一 `.apk`。
- `info.json` 標示：
  - package：`com.google.android.apps.maps`
  - versionName：`26.44.06.1006895251`
  - versionCode：`1068856906`
  - arm64-v8a、240–640dpi、Android 10+，24 種語言（來源：APKM `info.json`）
- 容器大小：**66,775,532 bytes**。
- SHA-256：`9beffe7bc0581ad677477b164c6b11a9c5d9434b56620954776eddbb89b83e57`
- 含 `base.apk`（解壓後約 78 MB）、`split_config.arm64_v8a.apk`、多個語言及 dpi splits。
- **`base.apk` 有 10 個 `classes*.dex`**，可進行 JADX/Smali 分析；但只有 `base.apk` 未必能獨立正常安裝。分析和實際安裝需區分。
- **尚未進行 Dex 反編譯、修改或編譯 Patch**。不能把「APKM 已讀取」當成「找到導航 API」。

用 PowerShell 可先確認雜湊：

```powershell
Get-FileHash ".\com.google.android.apps.maps_26.44.06.1006895251-1068856906_1arch_3dpi_24lang_a4b6151e97dd2c87b0abd2bf3417c169_apkmirror.com.apkm" -Algorithm SHA256
```

可用 7-Zip 等工具解出 `base.apk` 與 splits；如果用 Python：

```python
import zipfile
with zipfile.ZipFile('your-maps-file.apkm') as archive:
    print(archive.namelist())
    archive.extractall('input_apkm_extracted')
```

> 注意：目前 Dutch App Patches 官方文件要求其 Google Maps AA patch 使用**指定版本的完整單 APK**；**不能假設拿上面的 26.44 APKM 就能直接套**。先檢查版本、格式與可用 patch 的相容性；必要時請使用者另提供對應版本的官方原始安裝包。不要散發 Google 私有 APK。

## 3. 已核實的上游技術資料

1. **Google Maps Android Intents** 官方 `google.navigation` Intent：`mode=l` 對應 two-wheeler；`mode=d` 對應 driving。這證明手機端有機車模式，**不代表 Android Auto 端會保留**。  
   https://developer.android.com/guide/components/google-maps-intents
2. **Dutch App Patches — Google Maps**：Google Maps `26.43.05.1002020710` / build `1068844719` 的 *Native navigation for Gearslip and Android Auto* patch，會使用 Google Maps 原生 **car** 導航 UI，可使用另名 package；**該專案不是機車路線 Patch**。  
   https://johninnl.codeberg.page/nl-morphe-patches/en/apps/google-maps/
3. **Dutch Android Auto 安裝指南**：完整 Android Auto App、安裝器/簽章限制；另名 Maps 及 native AA bridge 需依指南設定。  
   https://johninnl.codeberg.page/nl-morphe-patches/en/guides/android-auto/
4. **Morphe Patch fundamentals**：`BytecodePatch`/`ResourcePatch`/`RawResourcePatch`；以當前 API 實作，勿直接複製過期或偽代碼。  
   https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_patches_intro.md
5. **Morphe 官方開發設定**，提供 patches template、`buildAndroid`、Desktop CLI 的做法（實際命令請先核對目前 upstream）：  
   https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/1_setup.md
6. 官方 patches template：  
   https://github.com/morpheapp/morphe-patches-template

### 關鍵版本不匹配

**使用者版本：`26.44.06.1006895251`（APKM）。**  
**現成 Dutch Maps AA Patch 版本：`26.43.05.1002020710`（單 APK）。**

因此不要先聲稱「已有 Patch 可在這包直接用」。可把已支援版本當 AA bridge 參考基線，或先做 26.44 的 bytecode 研究並規劃向新版移植。

## 4. 待研究的假說（非已證實事實）

可能路徑：

```text
Android Auto 發起導航請求
  -> Maps 導航入口 / projection service / state
  -> 交通模式選擇 / route request builder
  -> Google Maps 私有後端
  -> 導航結果 / turn-by-turn UI
  -> 重新規劃（可能走不同路徑）
```

目標是攔截 Android Auto 車載入口的 mode 選擇或 request builder，將**本應為 DRIVE 的路線請求**切到 Maps 內部既有的 two-wheeler 路由模式，並使 reroute 繼承相同 mode。**這只是研究假說，需用反編譯和執行觀察證實。**

- 公開 Google Routes API `TWO_WHEELER` **不是** Google Maps App 私有導航 API 的保證相同 wire format。
- 不要把字串 `DRIVE` 強行全域替換成 `TWO_WHEELER`。
- 不要只調整 UI 圖示、Intent `mode=l` 或 `avoid=highways` 就宣稱已解決 AA 路線。
- 改變封包/伺服器請求可能有簽章、完整性或平台限制，應從最小本機 bytecode 修改開始，不要求繞過帳號安全機制。
- 修飾後另名安裝與 Android Auto 車機可發現性，不是理所當然；需要實證。

## 5. 建議的實作階段與產物

### Phase A — 基線與工具

- [ ] 建立 `findings.md`，記錄環境、版本、Git commit、來源和可重現指令。
- [ ] 安裝/確認 Android platform-tools `adb`、JDK、Gradle、JADX、apktool、Kotlin 所需工具；不要直接修改手機系統 App。
- [ ] 解開 APKM，保存原始檔及 SHA-256，建立 `analysis/`（不要把數十 MB 的專有 APK 提交公開 Git）。
- [ ] `jadx -d analysis/jadx input_apkm_extracted/base.apk`，搭配 smali/Bytecode 確認候選符號；應注意混淆程式碼與 Dex 規模。
- [ ] 查詢 Morphe 2.4.0 與可用 `.mpp` 編譯/載入的真正相容版本。
- [ ] 優先核對 Dutch Maps AA bridge 的**原始碼、license、相容性**。若來源碼無法取得，記錄限制並獨立研究。

### Phase B — 定位確切 hook

- [ ] 在手機上測試官方 `google.navigation:q=...&mode=l` Intent 是否真的選取機車模式（手機單獨、靜止測試）。
- [ ] 使用 AA Desktop Head Unit (DHU) 或靜止車機，對照 Android Auto 模式的相同行程；觀察 `mode=l` 是否被覆寫。
- [ ] 分析導航啟動、route preview、重新規劃三處路徑。尋找 enum / proto / mode 映射及 AA 條件判斷。
- [ ] 使用 logcat 或只讀動態檢測輔助確認，但不要印出 OAuth token、帳號、家庭/工作地址等敏感資訊。
- [ ] 在 `findings.md` 明確列出每一候選 hook 的 Dex/class/method 指紋和支持證據，不要單憑搜尋關鍵字就編輯。

### Phase C — 最小 Morphe Patch

- [ ] 建立獨立的 `ForceTwoWheelerRouting` `BytecodePatch`，釘住相容 Google Maps 版本，fingerprint 不匹配時 fail closed。
- [ ] 優先僅影響 AA 路線請求，不更動騎車/步行/單車/手機導航模式。
- [ ] 覆蓋 start / preview / reroute，若技術上不可行則明示哪些路徑仍可能回到汽車模式。
- [ ] 嘗試編譯 `.mpp`，產出可檢查的 build log；若 patch 堆疊需要 Dutch native AA patch，需明確設定依賴。
- [ ] 給出安裝/移除及回滾方法，保留原版 Maps 和替代導航；不要直接覆蓋系統 App。

### Phase D — 驗收（先桌上測試）

- [ ] 一般 Google Maps 和 Android Auto 仍可啟動、搜尋、預覽、語音導航。
- [ ] 同起訖點，手機版 two-wheeler 與 AA 結果的道路選擇相符合（不能只比 ETA）。
- [ ] 偏航、改目的地、增加途經點後，仍維持 two-wheeler（或明示失敗）。
- [ ] 確認沒有把台灣 125cc 普通重機導往**禁止進入的道路**；導航結果需依交通標誌另行核對。
- [ ] 實測 Galaxy S25 / One UI 8.5 / Android 16 / Morphe 2.4.0 的安裝、AA discoverability 與重連；若車機未到手先用 DHU。
- [ ] 維持可快速停用／解除安裝、回到未修改版本。

**安全要求：** 這是實驗性導航，**只能停車或桌面環境測試**。對台灣 125cc 的禁行國道/部分快速道路問題要額外核對，不能因為 App 顯示了路線就認定合法或安全。

## 6. 優先交付給使用者的檔案

```text
project/
  handoff.md                     # 本文
  findings.md                    # 查證與反編譯發現、阻塞、支援版本
  README.md                      # 如何建置、安裝、回滾
  patch/                         # Morphe patch 專案（如果找到可靠 hook）
  dist/*.mpp                     # 只有確實成功編譯才提供
  tests/                         # 基線 ADB / DHU / logcat 可重現步驟
  analysis/                       # 本機分析輸出，勿公開原始 APK
```

若做不到 `.mpp`，請仍交付 `findings.md`、候選 hook 的定位結果及可重現分析指令，說明缺的是哪一個輸入/實驗；不要用 placeholder 假裝是可用的 Patch。

## 7. 和使用者的已知討論重點

- 使用者不想換掉 Google Maps，也不想改車機 UI；要 **Google Maps 在 Android Auto 跑真正機車路線**。
- 他提出的核心想法是「在 AA 汽車模式下，強制把 route request 轉為機車 mode」，這是本專案要驗證的主線。
- 使用者已提供 Google Maps APKM、手機與 Morphe 版本，**不要再次詢問**；只有在需要特定 AA 實測截圖、adb 輸出或另一個版本 APK 時才再請他提供。
- 本次在 ChatGPT 只確認了 APKM 容器與版本資訊，**沒有完成 APK decompile、沒有跑在 S25、沒有任何可用的 Patch**。

## 8. Codex 第一則回覆建議

請先直接讀取工作資料夾內 APKM、檢查環境和 upstream；不要先要求使用者重新敘述目標。第一個里程碑回報至少包含：

1. APKM 被正確識別、雜湊吻合；
2. Morphe 2.4.0/patch 編譯流程是否可用；
3. 26.44 原始 APKM 和 26.43 Dutch Patch 的相容性判斷；
4. 目前已找到的 AA/two-wheeler code candidates，附 evidence；
5. 下一個能在本機實際驗證的步驟。
