# 交接：修補版 Google Maps 無法在實體車機（Pernis MS700CL）上顯示

> 狀態：**已解決（2026-11-14）**。解法是改用 **KingInstaller Classic** 安裝修補完成的單一 APK，
> 讓 initiatingPackageName 與 installerPackageName 同時符合 Android Auto 的要求（見 §7.1 之後的補充與
> [README.zh-TW.md](README.zh-TW.md) 的安裝步驟）。搭配本機 1.0.3 bundle（含 `Android Auto template-only app`）
> 在 Galaxy S25 + Pernis MS700CL + 無線 Android Auto 18 上實測可用。
>
> 以下內容保留當時的除錯過程、log 證據與已排除的方向，供日後查閱；文中「未解決」「不保證成功」等敘述
> 反映的是發現解法**之前**的狀態。

## 1. 目標

讓 Morphe 修補過的 Google Maps（機車路線 + Android Auto 原生導航）能在實體 Android Auto 車機上顯示並導航。
專案本體與既有成果見 [README.zh-TW.md](README.zh-TW.md) 與 [findings.md](findings.md)。

## 2. 環境

| 項目 | 值 |
|---|---|
| 手機 | Samsung Galaxy S25（serial `RFGL40DP03K`），Android 16，**未 root** |
| 修補版 App | `org.ungoogled.android.apps.maps.microg`，Google Maps `26.44.06.1006895251`（versionCode `1068856906`） |
| 車機 | Pernis MS700CL，**無線** Android Auto（Wi-Fi SSID `Pernis-5093`，BT `18:9E:AD:04:4C:04`） |
| Android Auto | 測試期間：`18.0.664274` → 手動降 `17.0.662204` → 連車機時被要求更新，變成 `18.0.664264` |
| 原廠 Google Maps | `com.google.android.apps.maps`，目前被停用（`enabled=3`） |

## 3. 現象

| 環境 | 結果 |
|---|---|
| headunit 桌面模擬器（USB） | **正常**。原生地圖、機車/汽車路線都可用。連開發人員模式都不需要開 |
| Pernis MS700CL（無線） | **失敗**。車機 App 清單中的 Maps 圖示點下去，顯示 `No new messages during this drive`（訊息介面），不是地圖 |

一次例外：Android Auto 本身當掉（crash buffer，`11-14 08:50:11`）

```
java.lang.IllegalArgumentException: No matching component for intent:
  Intent { cmp=org.ungoogled.android.apps.maps.microg/com.google.android.maps.MapsActivity (has extras) }
    at rrx.a(SourceFile:34)  ...  at non.onClick(SourceFile:184)
```

當掉的是 gearhead 程序（pid 18248），不是 Maps。代表 Android Auto 嘗試用「一般 App / 訊息 App」的方式開啟它。

## 4. 根本原因（已由 log 確認）

Android Auto 的套件驗證器直接拒絕這個 package：

```
11-14 10:46:23.127 I/Finsky  ( 4983): [1568] PlayGearheadService org.ungoogled.android.apps.maps.microg, app owners empty
11-14 10:46:23.128 W/CAR.VALIDATOR( 1906): Package DENIED; failed all other checks [org.ungoogled.android.apps.maps.microg]
```

* `Finsky` = Google Play 商店。Android Auto 透過 `PlayGearheadService` 問 Play「這個 package 的 app owners 是誰」，Play 回 **empty**（Play 的清單裡沒有這個 App）。
* 緊接著驗證器輸出 `DENIED; failed all other checks`。
* 被拒之後，Android Auto 不載入它的 CAL 導航服務（`patches.maps.gearslip.NativeCarService`），改用通知/訊息介面，於是出現「No new messages」。

對照組：同一次驗證中，其他 App 的拒絕理由都很具體（`package is disabled`、`Uses for MEDIA not defined`、`Uses for TEMPLATE not defined`），只有我們這個是 `failed all other checks`。

手機上**所有**其他有 `androidx.car.app.CarAppService` 的 App 都是 Play 安裝的：

```
com.google.android.apps.messaging / tachyon / youtube.music / googlequicksearchbox /
projection.gearhead / com.kingwaytek.naviking.telemetrics / com.spotify.music /
com.ubercab.driver / com.whatsapp / io.homeassistant.companion.android
  → installerPackageName=com.android.vending
org.ungoogled.android.apps.maps.microg
  → installerPackageName=app.morphe.manager（後改為 com.android.vending，見下）
```

**所以目前沒有任何「非 Play 安裝的車機 App 在這台車機上能用」的對照案例**，這是最大的資訊缺口（見 §7）。

## 5. 已嘗試且**無效**的方向

### 5.1 Android Auto 開發人員設定 → Unknown sources

已開啟（使用者截圖確認打勾）。驗證器仍然 `DENIED`。
開發人員模式本身是開著的（使用者表示 MS700CL 要開開發人員模式，Maps 才會出現在清單上；但出現的是訊息介面）。

### 5.2 把安裝來源偽裝成 Play

```
adb install -r -i com.android.vending <apk>
→ installerPackageName=com.android.vending, packageSource=1
```

兩種組合都測過，**都無效**：

| 時間 | App 宣告 | 安裝來源 | 結果 |
|---|---|---|---|
| 10:02 裝 / 10:05 測 | projection + notification + template | `com.android.vending` | `DENIED; failed all other checks` |
| 10:43 裝 / 10:46 測 | **只有 template** | `com.android.vending` | `DENIED; failed all other checks` |

原因很清楚：Android Auto 問的是 **Play 服務本身**（app owners），不是讀本機的 installer 標記。

### 5.3 Android Auto 降版到 17

降到 `17.0.662204`（APKMirror）後，一連上 MS700CL 就跳「Android Auto 需要更新」，使用者按了更新，結果變回 18。
**→ 17 版實際上沒有測到**，這個方向仍然是開放的（見 §7）。

## 6. 已做且**應該保留**的修改（但不足以解決）

新增 patch：`patch/patches/src/main/kotlin/tw/maps/HideLegacyProjectionEntry.kt`
patch 名稱 **`Android Auto template-only app`**，`dependsOn(nativeCarNavigationPatch)`。

**原本**的車機能力宣告（`res/xml/automotive_description`，資源 id `0x7f170002`，檔名 `res/sSS.xml`）：

```xml
<automotiveApp>
  <uses name="projection"/>    <!-- Google 私有投影介面，只服務 Google 簽名的 App -->
  <uses name="notification"/>  <!-- 訊息/通知介面 -->
  <uses name="template"/>      <!-- CAL 導航介面，由 Dutch 的 native navigation patch 加入 -->
</automotiveApp>
```

**修改後**只留 `template`，並移除所有 service 上帶有
`com.google.android.gms.car.category.CATEGORY_PROJECTION*` 的 intent-filter
（`GmmCarProjectionService`、`LimitedGmmCarProjectionService`、
`WidescreenWidgetLimitedGmmCarProjectionService`、`GmmCarAuxiliaryProjectionService`）。

**效果**：通過了 descriptor 的類別檢查，也不會再 fallback 到訊息介面的宣告，
但 `DENIED` 的理由完全沒變 → Play 那關才是卡點。

**驗證方式**（確認 patch 有生效）：

```bash
adb pull $(adb shell pm path org.ungoogled.android.apps.maps.microg | cut -d: -f2) cur.apk
aapt2 dump xmltree --file res/sSS.xml cur.apk
# 期望輸出只有一個 uses，name="template"
```

版本已 bump 到 `1.0.3`，**尚未發布**，也尚未 commit（repo 有未提交的變更）。

## 7. 給下一棒的建議（依優先序）

### 7.1 建立對照組 — 最重要，先做這個

目前無法分辨是「**我們的 App 有問題**」還是「**這台車機 / AA 18 根本不吃不明來源**」。

做法：側載任何一個開源、有 `androidx.car.app.CarAppService` 的導航 App（例如從
F-Droid 或 GitHub 下載 OsmAnd），連上 MS700CL 看它會不會出現。

* **也被 `DENIED`** → 是 Android Auto / 車機的政策問題，不是我們 patch 的問題。
  這條路（實體車機 + 未 root 手機 + 非 Play 來源）基本上走不通，應該收斂到
  「只支援 headunit 模擬器」或改走 §7.2。
* **正常出現** → 問題在我們的 App 身上，繼續比對兩者的 manifest / descriptor 差異。

注意：不要用手機上現有的 `io.homeassistant.companion.android` 來測，它是 Play 裝的，
覆蓋安裝會破壞對照條件也可能掉資料。

### 7.2 認真測試 Android Auto 17

降版後要**想辦法不要被更新**：

1. Play 商店 → Android Auto → ⋮ → 取消「啟用自動更新」。
2. 連車機時出現的「Android Auto 需要更新」畫面，**不要按 Download**，看有沒有辦法略過
   （按返回 / Exit）。如果強制要求更新才能連線，這條路就死了。

如果 17 版能過 `CAR.VALIDATOR`，就能確定是 18 版收緊了政策，
README 就要註明「Android Auto 必須停在 17.x」。

### 7.3 釐清 `PlayGearheadService` 的判斷邏輯

一個值得注意的反例：同一次驗證中

```
10:46:23.182 I/Finsky: [1568] PlayGearheadService app.morphe.messenger.orca, app owners empty
```

`app.morphe.messenger.orca`（同樣是 Morphe 修補、非 Play 安裝）也得到 `app owners empty`，
但**後面沒有跟著 DENIED**。

可能的解釋：訊息類 App 走通知管道、不經過啟動器驗證，所以沒有這一關。
但也可能代表 `app owners empty` 本身不是致命條件，真正的拒絕理由另有其他。
值得反組譯 Gearhead 的 `CAR.VALIDATOR`，把 `failed all other checks` 之前
實際檢查了哪些條件搞清楚。

### 7.4 已知但不建議的方向

* 偽造 Play 對 `PlayGearheadService` 的回應 — 這是去竄改另一個 App 的安全判斷，
  未 root 的手機也做不到，不要往這裡走。

## 8. 檔案與工具位置

| 項目 | 路徑 |
|---|---|
| 新 patch 原始碼 | `patch/patches/src/main/kotlin/tw/maps/HideLegacyProjectionEntry.kt` |
| 本專案其他 patch | `patch/patches/src/main/kotlin/tw/maps/` |
| 收錄的 Dutch patch | `patch/patches/src/main/kotlin/dutch/`、`patch/extensions/`、`patch/support/` |
| 建置產物 | `patch/patches/build/libs/patches-1.0.3.mpp` |
| 手機上的測試 bundle | `/sdcard/Download/patches-1.0.3-test.mpp` |
| 手機端 log 錄製 | `/sdcard/Download/aalog.txt`、`.1`、`.2`、`.3`（logcat `-r 40000 -n 3`，拔 USB 也會繼續錄） |
| adb | `C:\Users\shuili\AppData\Local\Android\Sdk\platform-tools\adb.exe` |
| aapt2 | `C:\Users\shuili\AppData\Local\Android\Sdk\build-tools\36.0.0\aapt2.exe` |

常用指令：

```bash
# 重新開始錄 log（拔掉 USB 也會繼續）
adb shell "rm -f /sdcard/Download/aalog.txt*; nohup logcat -v time -f /sdcard/Download/aalog.txt -r 40000 -n 3 >/dev/null 2>&1 &"

# 取回並過濾
adb pull /sdcard/Download/aalog.txt
grep -E "CAR\.VALIDATOR|Finsky.*Gearhead|GH\.NavClient|Messaging app start" aalog.txt
```

> 手機的記憶體 log buffer 只有 5 MB，幾分鐘就會被洗掉，**一定要用上面的檔案錄製方式**，
> 不要只靠 `adb logcat -d`。

## Codex review update (2026-11-14)

### 後續補充：實際症狀與可試的 bypass

使用者補充：目前 template-only 版連 Android Auto App 清單都不顯示；之前會顯示 Maps，但開啟後進訊息畫面；另曾出現一次「Maps 遇到了未預期的錯誤」。不能把移除通知入口描述成導航已能啟動。

Google 官方文件明確指出 Unknown sources **不適用於 Car App Library App**，而適用於媒體、訊息通知及停車 App。這能解釋 Orca 的反例，以及移除 notification 後 Maps 入口完全消失；不需要先假定 Maps 的導航程式碼有問題。來源：https://developer.android.com/training/cars/testing

新的優先測試方向是 KingInstaller 的 **Classic method**，而不是重複 `adb install -i`。KingInstaller 原始專案說明：AA 可能同時檢查 initiatingPackageName（發起者／Requested by）和 installerPackageName（安裝者／Installed by）；shell 直接安裝即使填入 vending，發起者仍可能是 shell。專案目前特別建議 Samsung Android 16 使用 Classic，而非 Shizuku。這是未在本機 AA 18／S25 驗證的候選方法，不保證成功。來源：https://github.com/fcaronte/KingInstaller

前置條件：使用修補完成的**單一完整 APK**，不要拿原始 APKM 或只有 base 的不完整包來試。KingInstaller 專案說明 split 安裝雖可支援，但無法透過同樣途徑取得 AA 所需來源紀錄。用其 App checker 同時看 Requested by 和 Installed by；不能只看 vending 就宣稱條件已滿足。先嘗試同簽章覆蓋安裝；不要為了重設安裝紀錄直接刪 App，避免遺失資料。

若 Classic 失敗，另一候選是接收端的開發主機身分（DHU／部分 AAWireless 開發模式）。Fermata 專案的 AA 17.7 逆向報告觀察到此路徑，但並未在 MS700CL／AA 18 證實，不能保證購買轉接器有效。來源：https://github.com/AndreyPavlenko/Fermata/issues/846

直接修改驗證器或 phenotype override 屬於 root 路線；一般未 root App 無法直接修改另一個 App 的私有設定或替換系統 AA。若要改用自簽 AA，也需檢查 Maps bridge 的 HostPolicy：目前它只信任 Google 簽署的 AA；直接重簽 AA 會增加另一層拒絕。

因此先前 §5.2「adb -i 失敗代表 installer 路線完全無效」的推論應撤回。Play 擁有權與簽章驗證是一路，但不表示所有替代允許條件都已測完。

The log confirms that Android Auto's `CAR.VALIDATOR` denied `org.ungoogled.android.apps.maps.microg` and that the CAL navigation service was not loaded. A PlayGearheadService lookup for Maps returned `app owners empty` immediately beforehand. That is a strong correlation, but not yet a confirmed cause: `app.morphe.messenger.orca` also returned `app owners empty` without a following denial. The current evidence therefore confirms the validator denial, not which internal check in `failed all other checks` failed.

The `template-only` patch removes the messaging fallback symptom. It does not fix the validator denial, including in the tested build, so it must not be described as a workaround that makes sideloaded navigation apps acceptable. The local patch comment and description were corrected to reflect this distinction.

### Control app suitability

OsmAnd~ from F-Droid is not a valid sideload control for this question: OsmAnd's own documentation says Android Auto support is only available in the Google Play distribution. A F-Droid build failing to appear or being rejected would therefore not show whether Android Auto accepts sideloaded CAL navigation apps generally. See [OsmAnd Android Auto requirements](https://osmand.net/docs/user/navigation/auto-car/) and [OsmAnd Android purchase/distribution notes](https://www.osmand.net/docs/user/purchases/android/).

Vela is a more promising open-source navigation candidate: its project describes it as navigation without Google Play Services and labels Android Auto support. Before using it as the control, confirm the exact release APK includes `androidx.car.app.CarAppService` and a navigation template descriptor, then install that official release outside Play and capture the same `CAR.VALIDATOR` and PlayGearheadService logs. Until those checks and a device test are done, Vela remains a candidate, not a proven valid control.

The current desktop environment cannot execute ADB because adb fails while creating `.android` with `Permission denied`; no phone install or MS700CL test was performed by Codex in this session.

### Root-cause status

- Confirmed: the patched Maps package is denied by Android Auto's package validator; consequently CAL navigation is not loaded and the launcher falls back to messaging.
- Confirmed ineffective on this device/build: Unknown sources, spoofing the local installer as Play, and removing projection/notification declarations.
- Not confirmed: that `app owners empty` by itself triggers denial, that Android Auto 18 rejects all non-Play navigation apps, or the specific hidden check represented by `failed all other checks`.
- Best next discriminator: test an eligible non-Play Android Auto navigation release whose manifest/service support is verified, then compare the complete validator trace. The Orca counterexample should be compared by service category and validation path rather than treating the Play lookup line as a sufficient explanation.
