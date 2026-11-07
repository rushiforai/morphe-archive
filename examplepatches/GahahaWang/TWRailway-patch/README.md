# 🚆 TWRailway Patches

給「火車時刻表」App（[com.tsumii.trainschedule](https://play.google.com/store/apps/details?id=com.tsumii.trainschedule)）使用的 [Morphe](https://morphe.software) patch。

## ❓ About

目前提供的 patch：

- **Hide ads**：讓 App 不再載入任何廣告（橫幅、插頁、原生、開啟應用程式廣告），並移除底部預留給橫幅廣告的空白欄位。
- **Hide review prompt**：不再跳出「App好用嗎？」請你評分的彈窗。
- **Fix recent apps title**：最近使用的 App 畫面中，標題顯示「火車時刻表」而不是 `app.titleTra`。

已用 **5.3.4**（version code 74）實際套用並驗證；其他版本標示為實驗性支援。

### How it works

火車時刻表是 Flutter App，廣告是 Dart 端透過 [google_mobile_ads](https://pub.dev/packages/google_mobile_ads) 外掛，
經由 `plugins.flutter.io/google_mobile_ads` method channel 交給原生的 Google Mobile Ads（Next-Gen）SDK 載入。
原生 SDK 整個被混淆，因此 patch 改為攔截外掛的 `onMethodCall`：
所有 `load*` 呼叫（`loadBannerAd`、`loadInterstitialAd`、`loadNativeAd`、`loadAppOpenAd` 等）都不載入廣告，
而是送出 `onAdFailedToLoad`（no fill）事件再回傳 `result.success(null)`。
App 會像處理沒有廣告可填的請求一樣處理，廣告不會顯示，底部預留給橫幅的空間也會收起。
外掛類別是以 method channel 字串比對找到的，不依賴混淆後的類別名稱。

「App好用嗎？」彈窗是否顯示，是 Dart 端用 shared_preferences（`SharedPreferencesAsync.getBool`）
讀取 `shouldShowReviewKey-*`（App 自己的評分彈窗）與 `rateMyApp_doNotOpenAgain`（rate_my_app 套件）決定的。
**Hide review prompt** 攔截原生端的 `getBool`，讓這兩個值永遠讀成「不要顯示」。

最近使用的 App 畫面顯示的標題不是 manifest 的 App 名稱，而是 Flutter `MaterialApp.title`
經由 `SystemChrome.setApplicationSwitcherDescription` 傳給 `Activity.setTaskDescription` 的字串。
App 在翻譯（GetX）載入前就取 `app.titleTra` 的翻譯，結果把翻譯鍵本身當成標題。
**Fix recent apps title** 攔截 Flutter embedding 的這個呼叫：標題若是未翻譯的鍵（`word.word…` 形式），
改用 App 本身的名稱「火車時刻表」。

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
> **[v1.3.0](https://github.com/GahahaWang/TWRailway-patch/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 火車時刻表&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.tsumii.trainschedule`

**🎯 Supported versions:**

| 5.3.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix recent apps title](#fix-recent-apps-title) | Shows the app name instead of "app.titleTra" as the app's title in the recent apps screen. |  |
| [Hide ads](#hide-ads) | Stops the app from loading banner, interstitial, native and app open ads, and removes the empty space reserved for the banner. |  |
| [Hide review prompt](#hide-review-prompt) | Stops the "App好用嗎？" dialog asking to rate the app from showing. |  |

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
