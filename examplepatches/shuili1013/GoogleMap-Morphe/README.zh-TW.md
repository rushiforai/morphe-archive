# Maps-AA-AnyMode-Morphe:Android Auto 上的 Google Maps 機車導航

[English](README.md) | **中文**

讓 **Google Maps 在 Android Auto 車機上用原生介面導航,並可使用機車(two-wheeler)路線**。適合裝在機車上的 Android Auto 螢幕:原廠 Google Maps 在 Android Auto 上只允許開車路線,會擋下機車導航。

用 [Morphe](https://morphe.software) 修補,修補後的 Maps 以另一個 package 安裝,**與原廠 Google Maps 並存**:原廠的照常拿來開車,修補版拿來騎機車。

> 實驗性專案。2026-11-14 使用者確認：**Galaxy S25（Android 16）＋ Pernis MS700CL，透過無線 Android Auto 18 可使用修補版 Maps**；關鍵是使用 **KingInstaller Classic** 安裝修補完成的 APK。成功案例使用 1.0.3 bundle（含 template-only patch）。先前也已在 headunit 模擬車機（USB）驗證。其他手機與車機尚不能保證相容，上路前請先停車測試，並依現地交通標誌行駛。

## 功能

- 車機上顯示 Google Maps 原生地圖與轉彎卡片
- 選**機車**走機車路線、選**汽車**走汽車路線,車機不會再跳「To navigate on Android Auto, switch to ... directions」
- 可在車機上搜尋目的地,也可連續導航多個目的地
- 可登入 Google 帳號(透過 MicroG-RE)、定位正常

## 支援版本

**只支援 Google Maps `26.44.06.1006895251`(versionCode `1068856906`,arm64-v8a)**。所有修改都綁定這個版本的混淆名稱,其他版本會直接 patch 失敗(不會裝出壞掉的 App)。修補版裝好後**不要更新**。

本專案不提供 Google Maps 安裝檔,請自行從 APKMirror 等處取得上述版本的原始 APKM。

## 需要的東西

| 項目 | 下載 |
|---|---|
| Morphe Manager | <https://morphe.software> |
| KingInstaller（本次 Samsung 實體車機成功案例使用的安裝工具） | [官方專案與下載](https://github.com/fcaronte/KingInstaller) |
| **該版本的 MicroG-RE**(必須用這版) | [shuili1013/MicroG-RE releases](https://github.com/shuili1013/MicroG-RE/releases/tag/v7.3.0-maps-fix) → `microg-re-maps-fix-7.3.0.apk` |
| 本專案的 patch bundle | 在 Morphe 加入 remote source `github.com/shuili1013/Maps-AA-AnyMode-Morphe`(或從 [Releases](https://github.com/shuili1013/Maps-AA-AnyMode-Morphe/releases) 下載 `patches-1.0.3.mpp`,用 Local 方式加入) |

這個 bundle 已經包含所需的 Dutch App Patches 功能,**不用再另外加入 Dutch App Patches**。

### 為什麼一定要用該版本的 MicroG-RE

官方 MicroG-RE 對修補過的 Google Maps 有兩個問題,該版本的 MicroG-RE 已修正:

1. **無法登入、地圖/搜尋失敗**:MicroG-RE 只對白名單內的 Google App 提供帳號存取,白名單裡沒有 Google Maps(log:`GmsAuthProvider: Not granting extended access`)。
2. **無法定位**:Maps 用原始的 `com.google.android.location.internal.GoogleLocationManagerService.START` 連定位服務,官方版只接受 `app.revanced` 前綴的名稱(log:`Unable to start service ... not found`)。

已經裝了官方 MicroG-RE 的話,要**先解除安裝**再裝該版本的 MicroG-RE(簽章不同,不能直接覆蓋)。裝好後打開 MicroG 設定跑一次 Self-Check。

## 安裝步驟

### 1. 準備 MicroG-RE 與修補 Maps

1. **安裝 MicroG-RE**(上表連結),打開它跑 Self-Check。
2. **Morphe 設定 → Patching → 開啟 Expert mode**。
3. **Sources → + → Remote →** 輸入 `github.com/shuili1013/Maps-AA-AnyMode-Morphe`。之前如果為了 Maps 加過 Dutch App Patches,請先停用。
4. **Patch Google Maps**(選 26.44 的 APKM),在 **Maps-AA-AnyMode-Morphe** 這個 source 勾選以下 patch(預設都是勾選的):
   - `Change package name`
   - `Bypass Play Services checks`
   - `Add microG-RE support`
   - `Native navigation for Gearslip and Android Auto`
   - `Allow any travel mode on Android Auto`
   - `Always two-wheeler on Android Auto`
   - `Skip private Android Auto car connection`
   - `Android Auto template-only app`

   不要再從其他 source 勾 Maps 的 patch(例如官方 Morphe Patches 的 `Clone app`)。

   `Android Auto template-only app` 會移除舊 projection 與通知入口，只保留 CAL 導航入口。它**不能**單獨讓車機接受修補版，安裝來源驗證仍然要靠下一節的 KingInstaller。**這個 patch 從 1.0.3 開始提供**，更舊的 bundle 沒有。

5. 修補完成後，使用 Morphe 的儲存／匯出功能，保留**修補完成且已簽名的完整單一 APK**。原始輸入是 APKM，但交給 KingInstaller 的必須是成品 APK；不要選原始 APKM，也不要只抽出缺少 splits 的 base APK 安裝。

### 2. 用 KingInstaller Classic 安裝成品 APK

1. 從上表的官方專案下載並安裝 KingInstaller，打開它。
2. **Root、Shizuku 兩個開關都不要開。**這就是 Classic 模式，也是本次 S25 成功的方法，無須 root 或啟動 Shizuku。
3. 選取剛才從 Morphe 匯出的成品 APK，按安裝按鈕（部分版本顯示 `Install as king`）。若 Android 要求允許 KingInstaller 安裝不明應用程式，依提示開啟。
4. 在手機跳出的**系統套件安裝畫面**確認安裝。若已裝過相同簽章的修補版，先嘗試覆蓋更新。不要為了重設來源紀錄直接刪 App；若遇簽章衝突，先確認簽章或備份資料，再處理解除安裝。
5. 回 KingInstaller 主畫面，按選 APK 按鈕下方、**AA** 按鈕旁的 **Check and Reinstall App**。
6. 搜尋 `maps`，點修補版 **`org.ungoogled.android.apps.maps.microg`**。名稱可能顯示 Maps 或 Ungoogled Maps，請用 package 確認，別選到原廠 Maps。
7. 同時檢查兩個欄位。本次成功的 S25 顯示：

   | 欄位 | 成功案例的值 |
   |---|---|
   | Initiating Installer（安裝發起者） | Package installer（`com.google.android.packageinstaller`） |
   | Installing Installer（安裝者） | Google Play Store（`com.android.vending`） |

   下方顯示綠色 **This app should work in Android Auto**。這是工具根據來源紀錄做的判斷，是否真的可用仍要接車機確認。

8. 在手機打開修補版 Maps，授予導航／定位所需權限，確認地圖與定位正常；需要帳號功能時再透過 MicroG-RE 登入。

**往後更新成品 APK，也請再次經由 KingInstaller Classic 安裝並檢查這兩欄。**改用 Morphe 或 ADB 更新可能改掉來源紀錄。KingInstaller 雖支援安裝 split APK，但其文件說明 split 安裝不具相同的 AA 來源繞過效果，因此本流程使用完整單一 APK。詳見 [KingInstaller 說明](https://github.com/fcaronte/KingInstaller)。

### 3. 連接實體車機

1. 打開手機的 Android Auto 設定。需要開發人員模式時，連點版本資訊約 10 次，再從右上選單開啟開發人員設定。原先測試環境有開啟**不明來源**，可保留，但它**不足以放行 CAL 導航 App**；Google 官方明確說此例外不適用於 Car App Library（[官方測試文件](https://developer.android.com/training/cars/testing)）。
2. 中斷 Android Auto，再重新連接 MS700CL。必要時在手機 Android Auto 的「自訂啟動器／Customize launcher」檢查修補版 Maps，若有列出但未勾選則勾選。
3. 在車機選修補版 Maps，搜尋目的地並選機車導航。原廠 Maps 也可能出現在清單中，請確認開啟的是修補版。
4. 停車確認車機能顯示地圖與轉彎卡片。本次使用者在完成 KingInstaller Classic 安裝後，已確認實體 MS700CL 可以使用。

### 常見問題與排查

- **App 清單完全沒有 Maps：**先檢查上述兩個安裝來源欄位。手機能成功安裝，不代表 Android Auto 已接受它。
- **開啟後顯示 `No new messages during this drive`：**舊的通知入口可能在 CAL 導航入口被拒後仍然顯示。template-only patch 會移除這個誤導入口，但不能單靠它解決來源驗證。
- **不明來源開著仍不顯示：**這個設定不適用於 CAL App，請重新確認 KingInstaller 的安裝流程與來源欄位。
- **`adb install -i com.android.vending` 沒用：**本次已測過無效。這種安裝可能只改安裝者，發起者仍是 shell；本次 Classic 安裝取得了上表兩個不同的值，並成功在實體車機運作。
- **「Maps 遇到了未預期的錯誤」：**單靠這個訊息不能確定原因，請保留同次連線的 `CAR.VALIDATOR`、`PlayGearheadService` log 再判斷。

先前除錯把 Play 的 `app owners empty` 視為完整原因；這次 Classic 成功證明，在本次環境還有其他可接受安裝來源的路徑。KingInstaller 並沒有恢復 Google 原始簽章，也不會讓 Play 真正擁有修補版 package。

## 已知限制

- Android Auto 側欄的「下一個轉彎」資訊不會顯示;車機主畫面的地圖與轉彎卡片正常。
- 上述組合的實體 MS700CL／無線 Android Auto 已由使用者確認可用；偏航重算、長程實際道路及其他硬體仍未完整驗證。
- 從手機上開始導航再交給車機,比在車機上搜尋開始的情況測試得少。

## Bundle 內的 patch

| Patch | 來源 | 說明 |
|---|---|---|
| `Change package name` | Dutch App Patches | 以另一個 package 名稱安裝,與原廠 Google Maps 並存。 |
| `Bypass Play Services checks` | Dutch App Patches | 讓重新簽名的 Maps 能載入地圖、搜尋與路線。 |
| `Add microG-RE support` | Dutch App Patches | 透過 MicroG-RE 登入 Google 帳號。 |
| `Native navigation for Gearslip and Android Auto` | Dutch App Patches,本專案修正為支援 26.44 | 在 Android Auto 上執行 Maps 原生的車機地圖與導航介面。 |
| `Skip private Android Auto car connection` | 本專案 | Maps 的 `CarConnectionHandler.onCarConnected` 會呼叫 Android Auto 私有服務,重新簽名的 App 一律被拒(`Wrong signature - go/gearhead-retail-device`)並閃退。改為直接略過。 |
| `Always two-wheeler on Android Auto` | 本專案 | Android Auto 的「支援模式」改為機車,讓在車機上搜尋的目的地預設走機車路線。 |
| `Allow any travel mode on Android Auto` | 本專案 | 移除「模式不符就擋下/結束車機導航」的兩道檢查。 |
| `Android Auto template-only app`(1.0.3 起) | 本專案 | 保留 CAL 導航能力，移除舊 projection／通知入口；仍須通過安裝來源驗證。 |

原始碼在 `patch/`。本專案的 patch 在 `patch/patches/src/main/kotlin/tw/maps/`;收錄的 Dutch App Patches 程式碼在 `patch/patches/src/main/kotlin/dutch/`、`patch/extensions/`、`patch/support/`(改了哪些地方見 [NOTICE](NOTICE))。完整除錯過程、logcat 證據與 26.44 的名稱對應見 [findings.md](findings.md)。

## 原始來源與致謝

本專案建立在以下專案之上:

- **[Morphe](https://github.com/MorpheApp)**:patcher、Manager 與 [patches template](https://github.com/MorpheApp/morphe-patches-template)。
- **[Dutch App Patches](https://codeberg.org/JohninNL/nl-morphe-patches)**(JohninNL,GPLv3;[GitLab 鏡像](https://gitlab.com/johninnld/nl-morphe-patches)):Android Auto 原生導航轉接器、`Change package name`、`Bypass Play Services checks`、`Add microG-RE support` 收錄自 v1.53.9。轉接器的 26.44 修正另以 patch 形式記錄在 [`third_party/dutch-app-patches/`](third_party/dutch-app-patches/)。
- **[bearinmind patches](https://github.com/bearinmindcat/morphe-patches)**(bearinmindcat):Dutch App Patches 中 Maps 功能的原始來源。
- **[MicroG-RE](https://github.com/MorpheApp/MicroG-RE)**(MorpheApp)與 **[microG](https://github.com/microg/GmsCore)**(microG Project,Apache-2.0):該版本的 MicroG-RE([shuili1013/MicroG-RE](https://github.com/shuili1013/MicroG-RE))以此為基礎。

## 授權

- 本 repo(含 patch bundle):**GPLv3**,見 [LICENSE](LICENSE) 與 [NOTICE](NOTICE)。
- 該版本的 MicroG-RE:Apache-2.0,同上游。
- 本專案不散布任何 Google 的 APK。

## 研究紀錄

最初的逆向研究(DEX 反組譯腳本、離線測試、交接文件)保留在 [handoff.md](handoff.md)、[findings.md](findings.md)、`scripts/`、`tests/` 與 [patch/README.md](patch/README.md)。
