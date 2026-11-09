# Maps-AA-AnyMode-Morphe:Android Auto 上的 Google Maps 機車導航

[English](README.md) | **中文**

讓 **Google Maps 在 Android Auto 車機上用原生介面導航,並可使用機車(two-wheeler)路線**。適合裝在機車上的 Android Auto 螢幕:原廠 Google Maps 在 Android Auto 上只允許開車路線,會擋下機車導航。

用 [Morphe](https://morphe.software) 修補,修補後的 Maps 以另一個 package 安裝,**與原廠 Google Maps 並存**:原廠的照常拿來開車,修補版拿來騎機車。

> 實驗性專案。只在 Galaxy S25(Android 16)+ headunit 模擬車機(USB 有線)上驗證過。上路前請先停車測試;路線是否合法(例如 125cc 禁行國道、快速道路)請依現地標誌判斷,不能只看 App。

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
| **該版本的 MicroG-RE**(必須用這版) | [shuili1013/MicroG-RE releases](https://github.com/shuili1013/MicroG-RE/releases/tag/v7.3.0-maps-fix) → `microg-re-maps-fix-7.3.0.apk` |
| 本專案的 patch bundle | 在 Morphe 加入 remote source `github.com/shuili1013/Maps-AA-AnyMode-Morphe`(或從 [Releases](https://github.com/shuili1013/Maps-AA-AnyMode-Morphe/releases) 下載 `patches-1.0.1.mpp`,用 Local 方式加入) |

這個 bundle 已經包含所需的 Dutch App Patches 功能,**不用再另外加入 Dutch App Patches**。

### 為什麼一定要用該版本的 MicroG-RE

官方 MicroG-RE 對修補過的 Google Maps 有兩個問題,該版本的 MicroG-RE 已修正:

1. **無法登入、地圖/搜尋失敗**:MicroG-RE 只對白名單內的 Google App 提供帳號存取,白名單裡沒有 Google Maps(log:`GmsAuthProvider: Not granting extended access`)。
2. **無法定位**:Maps 用原始的 `com.google.android.location.internal.GoogleLocationManagerService.START` 連定位服務,官方版只接受 `app.revanced` 前綴的名稱(log:`Unable to start service ... not found`)。

已經裝了官方 MicroG-RE 的話,要**先解除安裝**再裝該版本的 MicroG-RE(簽章不同,不能直接覆蓋)。裝好後打開 MicroG 設定跑一次 Self-Check。

## 安裝步驟

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

   不要再從其他 source 勾 Maps 的 patch(例如官方 Morphe Patches 的 `Clone app`)。
5. **安裝**。修補版會以 `org.ungoogled.android.apps.maps.microg` 安裝,名稱是 **Ungoogled Maps**。
6. **Android Auto 開啟不明來源**:手機的 Android Auto 設定 → 連點「版本」約 10 次開啟開發人員模式 → 右上選單「開發人員設定」→ 開啟「**不明來源**」。
7. 連上車機,選 **Ungoogled Maps**(車機上會有兩個 Maps 圖示,原廠那個無法隱藏,別選錯)。

## 已知限制

- Android Auto 側欄的「下一個轉彎」資訊不會顯示;車機主畫面的地圖與轉彎卡片正常。
- 實體車機、無線 Android Auto、偏航重算、長程實際道路尚未完整驗證。
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
