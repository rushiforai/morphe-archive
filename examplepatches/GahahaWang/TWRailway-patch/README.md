# 🚆 TWRailway Patches

給「火車時刻表」App（[com.tsumii.trainschedule](https://play.google.com/store/apps/details?id=com.tsumii.trainschedule)）使用的 [Morphe](https://morphe.software) patch。

## ❓ About

目前提供的 patch：

- **Hide ads**：讓 App 不再載入任何廣告（橫幅、插頁、原生、開啟應用程式廣告），並移除底部預留給橫幅廣告的空白欄位。
- **Hide review prompt**：不再跳出「喜歡這個App嗎？」請你評分的彈窗。
- **Hide upgrade button**：台鐵與高鐵搜尋頁不再顯示「付費移除廣告，免開app 直接查」之類的訂閱按鈕（只隱藏按鈕，不會解鎖付費功能）。
- **Hide promotions**：不再跳出免費版才有的訂閱推廣彈窗（訂閱優惠、節日特價、「解鎖新功能：桌面小工具」），介面和付費版一樣乾淨（只隱藏推廣，不會解鎖付費功能）。
- **Fix recent apps title**：最近使用的 App 畫面中，標題顯示「火車時刻表」而不是 `app.titleTra`。
- **Expand search history**：搜尋頁的「最近搜尋」最多顯示 20 筆，而不是預設的 3 筆（筆數可在修補設定調整）。
- **Fix search history count**：「搜尋歷史」旁的計數顯示實際的顯示筆數，例如 `(5/20)`，而不是 `(3/3) 升級`，並移除「升級」字樣。
- **Patch settings**：新增「修補設定」頁面，在 App 執行中開關上面每個 patch、調整搜尋歷史顯示筆數。

### 修補設定

側邊欄「設定」區塊中原本的「廣告設定」會變成「修補設定」，點進去開啟修補設定頁面；
也可以長按桌面上的 App 圖示，選「修補設定」捷徑。

| 設定 | 生效時機 |
| --- | --- |
| 隱藏廣告 | 立即（已載入的廣告重新啟動後消失） |
| 隱藏評分彈窗 | 重新啟動 App 後 |
| 隱藏付費推廣按鈕 | 重新啟動 App 後 |
| 隱藏付費推廣彈窗 | 重新啟動 App 後 |
| 修正最近使用的 App 標題 | 立即（下次更新標題時） |
| 展開搜尋歷史／顯示筆數（1–20） | 重新啟動 App 後（頁面下方有「重新啟動 App」按鈕） |
| 修正搜尋歷史計數 | 重新啟動 App 後 |

修補時沒有勾選的 patch 會在頁面上標示為未套用。

已用 **5.3.4**（version code 74）實際套用並驗證；其他版本標示為實驗性支援。

### How it works

火車時刻表是 Flutter App，廣告是 Dart 端透過 [google_mobile_ads](https://pub.dev/packages/google_mobile_ads) 外掛，
經由 `plugins.flutter.io/google_mobile_ads` method channel 交給原生的 Google Mobile Ads（Next-Gen）SDK 載入。
原生 SDK 整個被混淆，因此 patch 改為攔截外掛的 `onMethodCall`：
所有 `load*` 呼叫（`loadBannerAd`、`loadInterstitialAd`、`loadNativeAd`、`loadAppOpenAd` 等）都不載入廣告，
而是送出 `onAdFailedToLoad`（no fill）事件再回傳 `result.success(null)`。
App 會像處理沒有廣告可填的請求一樣處理，廣告不會顯示，底部預留給橫幅的空間也會收起。
外掛類別是以 method channel 字串比對找到的，不依賴混淆後的類別名稱。

「喜歡這個App嗎？」評分彈窗（App 自己的 `AppReviewView`）是搜尋後由 Dart 的 `AppController.canShowReview` 決定是否顯示：
成功搜尋次數是 5 的倍數、`shouldShowReviewKey-<版本>` 為 true，且已過了「下次」提醒時間（`remindReviewKey`）。
這些值存在 get_storage（純 Dart 的檔案），原生端攔截不到，所以 **Hide review prompt** 直接改 arm64 `libapp.so`：
把 `canShowReview` 第一個判斷（`cbnz x2`，次數不是 5 的倍數就回傳 false）換成無條件的 `b`，讓它永遠回傳 false。
另外 rate_my_app 套件的彈窗（以及舊版 App 的評分彈窗）是用 shared_preferences（`SharedPreferencesAsync.getBool`）
讀取 `rateMyApp_doNotOpenAgain`、`shouldShowReviewKey-*`，patch 也攔截原生端的 `getBool`，讓這兩個值永遠讀成「不要顯示」。
在修補設定關閉時，和搜尋歷史筆數一樣改載入一份把判斷還原的 `libapp.so` 副本，所以要重新啟動才會生效。

最近使用的 App 畫面顯示的標題不是 manifest 的 App 名稱，而是 Flutter `MaterialApp.title`
經由 `SystemChrome.setApplicationSwitcherDescription` 傳給 `Activity.setTaskDescription` 的字串。
App 在翻譯（GetX）載入前就取 `app.titleTra` 的翻譯，結果把翻譯鍵本身當成標題。
**Fix recent apps title** 攔截 Flutter embedding 的這個呼叫：標題若是未翻譯的鍵（`word.word…` 形式），
改用 App 本身的名稱「火車時刻表」。

搜尋歷史本來就會保存最近 20 筆，但搜尋頁只顯示其中 3 筆，訂閱後才顯示 20 筆。
這段邏輯在 Dart 的 `SearchHistoryManager.getVisibleItems`（`items.take(isPremium ? 20 : 3)`），
AOT 編譯在 `libapp.so` 裡，無法用 smali 修改。**Expand search history** 直接改 arm64 `libapp.so`
的這段指令：把 `csetm x0, eq` 換成 `mov x0, #0x22`，讓上限永遠是 20。
patch 以指令的位元組序列比對，找不到或不只一處時會直接失敗，不會改錯地方；
目前只支援 arm64-v8a。
筆數寫死在編譯後的程式碼裡，無法直接讀設定；修補設定改成 20 以外的筆數時，
extension 會在 App 的內部儲存空間寫一份改好筆數的 `libapp.so` 副本，App 啟動時用
Flutter 的 `--aot-shared-library-name` 參數優先載入副本（Flutter 只接受內部儲存空間的路徑），
所以要重新啟動才會生效。App 更新或重新修補後副本會自動重建。

免費版在「搜尋歷史」旁有一個 `(3/3) 升級` 徽章（`HistoryUpgradeBadge`），點了會開訂閱頁。
搜尋頁傳給它的上限寫死為 3，徽章裡也把計數夾在 3 以內，文字是 `"($count/$limit) ${"search.upgradeBadge".tr}"`。
**Fix search history count** 把 arm64 `libapp.so` 中這兩個 3 改成 20，讓計數和展開後的筆數一致；
再把 `") "` 換成物件池中已有的 `")"`，並把翻譯鍵 `search.upgradeBadge` 換成空字串
（GetX 找不到翻譯時原樣回傳鍵，所以結果是空字串），「升級」就不會出現，徽章變成 `(5/20)`。
這個 patch 依賴 **Expand search history**；修補設定中可以關閉，計數也會跟著「顯示筆數」設定，
同樣透過 `libapp.so` 副本實作，所以要重新啟動才會生效。

搜尋頁上的訂閱按鈕（文字由 Firebase Remote Config 的 `cta_subscribe_text` 下發）
是 Dart 的 `_buildUpgradeButton`：`isPurchased` 為 true 時回傳空的 `SizedBox`，否則建立按鈕。
**Hide upgrade button** 把 arm64 `libapp.so` 中台鐵、高鐵兩個搜尋頁的這個判斷分支（`tbnz w0, #4`）
換成 `nop`，讓它永遠回傳空的 `SizedBox`；訂閱狀態本身不受影響。在修補設定關閉時，
和搜尋歷史筆數一樣改載入一份把分支還原的 `libapp.so` 副本，所以要重新啟動才會生效。

免費版會看到幾種付費版不會出現的訂閱推廣彈窗：訂閱優惠（`PromoController`，限時特價／專屬優惠）、
節日特價，以及「解鎖新功能：桌面小工具」（`WidgetIntroPopup`）。它們是否出現，由 Firebase Remote Config 的
`promo_enabled`、`holiday_active`／`holiday_show_popup`、`widget_intro_enabled` 參數決定。
**Hide promotions** 攔截 firebase_remote_config 外掛把參數交給 Dart 的地方（`getAll` 與啟動時的 plugin constants），
把這幾個參數改成 `false`，彈窗就不會出現；訂閱狀態與付費功能都不受影響。

側邊欄是 Dart 程式碼（AOT 編譯在 `libapp.so`），無法插入新的按鈕。**Patch settings** 改為：
把側邊欄「廣告設定」的翻譯字串原地改成同樣長度的「修補設定」，
並攔截 Flutter 經 `flutter/navigation` channel 回報給原生端的路由（GetX 的 `/AdSettingsPage`），
一打開廣告設定頁就把它關掉，改顯示原生的修補設定頁面（extension 中的全螢幕 Dialog，不需改 manifest）。
既然廣告已被隱藏，這個入口原本的功能也用不到。設定存在 App 的 `twrailway_patches` SharedPreferences。

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/GahahaWang/TWRailway-patch

<a href="https://morphe.software/add-source?github=GahahaWang/TWRailway-patch">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

也可以用 Morphe CLI（XAPK / APKM / APKS 會自動合併）：

```sh
java -jar morphe-desktop-*-all.jar patch -p patches.mpp "$PWD/火車時刻表.xapk"
```

> 輸入檔請用絕對路徑，CLI 合併分割 APK 時以 symlink 暫存輸入檔，相對路徑會失敗。

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.8.1](https://github.com/GahahaWang/TWRailway-patch/releases/tag/v1.8.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 火車時刻表&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**Package name:** `com.tsumii.trainschedule`

**🎯 Supported versions:**

| 5.3.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Expand search history](#expand-search-history) | Shows up to 20 recent searches instead of 3. The number can be changed in the patch settings. |  |
| [Fix recent apps title](#fix-recent-apps-title) | Shows the app name instead of "app.titleTra" as the app's title in the recent apps screen. |  |
| [Fix search history count](#fix-search-history-count) | Shows the expanded limit (such as "(5/20)") in the count next to 搜尋歷史, and removes the "升級" text. It can be turned off in the patch settings. |  |
| [Hide ads](#hide-ads) | Stops the app from loading banner, interstitial, native and app open ads, and removes the empty space reserved for the banner. |  |
| [Hide promotions](#hide-promotions) | Stops the subscription promotion popups (discount, holiday sale and widget intro) that only free users see. Paid features are not unlocked. |  |
| [Hide review prompt](#hide-review-prompt) | Stops the "喜歡這個App嗎？" dialog asking to rate the app from showing. |  |
| [Hide upgrade button](#hide-upgrade-button) | Hides the subscribe button (such as "付費移除廣告，免開app 直接查") of the search pages. It can be shown again in the patch settings. |  |
| [Patch settings](#patch-settings) | Adds a "修補設定" page to turn the other patches on or off and adjust them while the app runs. It replaces the "廣告設定" item in the drawer's 設定 section, and is also a shortcut on the app icon. |  |

</details>

<!-- PATCHES_END -->

## ✅ Verification

[Verify patches](.github/workflows/verify.yml) workflow 會在推送時（或手動執行）：

1. 建置 patch bundle（`.mpp`）
2. 下載 Morphe CLI 最新版與測試用 APK（手動執行時的 `apk_url` 輸入、`TEST_APK_URL` repo 變數，或 workflow 內的預設網址）
3. 套用 patch，並用 [verify_patches.py](.github/scripts/verify_patches.py) 反編譯確認每個 patch 的程式碼都已注入
4. 將打好 patch 的 APK 直接以 `patched.apk` artifact 上傳（不壓縮成 zip）

### 🛠️ Building locally

- Run `./gradlew buildAndroid`（需要可讀取 GitHub Packages 的 GitHub PAT，見 [Morphe 開發環境設定](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment)）
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe Desktop](https://github.com/MorpheApp/morphe-cli) like any other patch bundle.

### 🧑‍💻 Releasing

- 使用 [Semantic commit](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index)：`feat:`、`fix:` 會產生新版本，`chore:` 不會。
- 推送到 `dev` 產生 pre-release，合併到 `main` 產生正式版，一律由 `release.yml` 處理，不要手動建立 release。
- 不要手動修改 `patches-list.json`、`patches-bundle.json`、`CHANGELOG.md` 等自動產生的檔案。

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

TWRailway Patches are licensed under the [GNU General Public License v3.0](LICENSE)
