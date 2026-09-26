# 開發說明

## 環境

- JDK 17 以上（CI 用 Temurin 21）
- Android SDK，路徑寫在 `local.properties`（不進版控）
- 一組能讀 GitHub Packages 的憑證：Morphe 的 Gradle plugin 放在 `maven.pkg.github.com`，
  需要 `read:packages` 權限

### 設定 GitHub 憑證

`gh` 已經登入的話，一行就好：

```bash
{ echo "gpr.user = $(gh api user --jq .login)"; echo "gpr.key  = $(gh auth token)"; } >> ~/.gradle/gradle.properties
```

沒有 `gh` 的話，到 <https://github.com/settings/tokens/new?scopes=read:packages&description=Morphe>
建一個 classic token，自己寫進 `~/.gradle/gradle.properties` 的 `gpr.user`、`gpr.key`。
也可以改用環境變數 `GITHUB_ACTOR`、`GITHUB_TOKEN`（CI 就是這樣）。

只認這四個名字。Morphe 的 plugin 自己也會去讀這個 repo，而它只看 `gpr.user` / `gpr.key`
和那兩個環境變數，所以別的設定方式（例如只跑 `gh auth refresh -s read:packages`）不夠。
缺憑證時 `settings.gradle.kts` 會直接停下來，並告訴你該怎麼設。

## 建置

```bash
./gradlew buildAndroid
```

產出在 `patches/build/libs/patches-*.mpp`。

## 驗證

`buildAndroid` 只證明編得過。fingerprint 對不上的話照樣綠燈，要到 Manager 套用時才會發現，
所以改完一定要跑：

```bash
./gradlew verifyAgainstApk -Papk=JPTT_3.8.5.apk
```

它會像 Manager 一樣把 bundle 套到 APK 上（不簽章、不安裝），每個 patch 印 ok 或 FAILED，
接著檢查 extension 和 app 之間的每一個方法呼叫都真的存在。這一步很重要：extension 是對著
完整的函式庫編譯的，但 app 裡那份被 R8 剃過，少了方法也編得過、套得上，要到執行時才當掉。
最後把 patch 過的 dex 寫到 `patches/build/verify/`。

沒給 `-Papk` 時，依序找環境變數 `JPTT_APK`、專案根目錄下檔名排序第一個 `.apk`。支援的
每個版本都要各跑一次。

**它檢查不到的：** 暫存器用錯、欄位讀錯。這類錯誤要等 Android 載入那個 class 時才會被擋下來
（`VerifyError`）。動到暫存器的 patch，請把 patch 後的 class 反組譯出來，確認每個值都從對的
地方來：

```bash
.work/tools/jadx/bin/jadx -m fallback --single-class 'com.joshua.jptt.BoardFragment' \
  --single-class-output out patches/build/verify/classes*.dex
```

## 取得 APK

APK 不進版控（`*.apk` 已被 ignore）。從裝了 JPTT 的手機撈：

```bash
adb pull "$(adb shell pm path com.joshua.jptt | grep base.apk | sed 's/package://' | tr -d '\r')" JPTT_3.8.5.apk
```

只需要 `base.apk`，其他 split 只有 native library、圖片資源和語系，patch 用不到。
手機上的 JPTT 一更新，舊版就撈不回來了，想留著的版本請另外收好，用 `JPTT_APK` 指過去。

## 目錄

```
patches/src/main/kotlin/app/lchanc3/patches/<app>/        patch 本體
extensions/<app>/src/main/java/app/lchanc3/extension/<app>/  注入 app 的程式碼
extensions/<app>/stub/                                     app 裡既有 class 的空殼，只給編譯用
docs/<App>.md                                              那個 app 的使用說明（README 會連過去）
```

要支援新的 app，就並排開一組同名資料夾；`settings.gradle.kts` 會自己找到新的 extension 模組。

## 寫 patch 要注意的

### 找方法

JPTT 沒有混淆，fingerprint 用 `definingClass` + `name` 就夠。匿名類別（`$4` 這種）的編號
可能隨版本變，改用方法裡的字串比對，再用 `custom` 限定在哪個類別底下。

### 不要假設有暫存器可借

R8 常把方法編到只剩剛好夠用的暫存器，同一個方法在 3.8.4 和 3.8.5 還可能不一樣：

- 有的方法 `.locals 0`，`v0` 就是 `p0`（`this`）。在開頭寫 `v0` 等於把 `this` 蓋掉。
- 3.8.5 有的地方會把 `this` 所在的暫存器拿去放別的值，所以方法中段的 `p0` 不一定還是 `this`。

這些錯誤 `verifyAgainstApk` 都抓不到。安全的寫法：

- **重用原本指令的暫存器**，例如把呼叫的參數換成另一個已經在暫存器裡的值。
- **把邏輯放進自己新增的方法**（`ImmutableMethod(...)` 自訂 `registerCount`），原地只留一行
  呼叫。Reconnect on return 和 Preload article images 都是這樣做的。新增的方法用 `newMethod(...)`
  建：直接 `"...".toInstructions()` 的話，不管有幾個暫存器 `p0` 都會被編成 `v1`。
- 真的要借暫存器，先呼叫 `requireFreeLocals(method, n)`，讓它在打包時就失敗。

### extension 要呼叫 app 的東西

- app 自己的 class：在 `extensions/<app>/stub/` 放一個只有用得到的簽章的空殼。
- app 內建的函式庫（androidx 等）：在 `extensions/<app>/build.gradle.kts` 用 `compileOnly`
  加上同版本的函式庫。

兩者都不會被打包進去。app 裡的函式庫被 R8 剃過，缺什麼 `verifyAgainstApk` 會告訴你。

### 畫面上的文字

用繁體中文。設定頁、選單這類標籤和說明不加句號；要跟 JPTT 原本的畫面一致時，沿用 JPTT 的用字。

## 文件

- README 裡 `<!-- PATCHES_START -->` 到 `<!-- PATCHES_END -->` 之間是發版時由
  `.github/scripts/generate_patches_readme.py` 產生的，不要手改。
- 表格裡的說明來自每個 patch 的 `description`，patch 自己的事寫在那裡就好。
- 每個 app 的使用說明寫在 `docs/<App>.md`，README 在那個 app 的表格下面放一個
  連結過去。檔名要跟 patch 的 `Compatibility.name` 一樣（例如 `JPTT.md`），沒有這個檔就
  沒有連結。只寫從表格看不出來、又會害人卡住的事，README 本身只放 patch 清單。

## 發版

到 GitHub 的 **Actions → Release → Run workflow**，填版本號。Workflow 會：

1. 編譯 bundle，更新 `patches-bundle.json`、`patches-list.json` 和 README 的 patch 清單
2. 把自上一版以來的 commit 整理成更新說明（`.github/scripts/release_notes.py`），寫進
   Release，也加到 `CHANGELOG.md` 最前面
3. 建立 Release，附上 `.mpp`

**更新說明直接取自 commit 標題**，所以標題要寫給使用者看：

| 開頭 | 放在 |
|---|---|
| `feat:` | 新功能 |
| `fix:` | 修正 |
| `docs:`、`refactor:`、`perf:` 等 | 其他 |
| `chore:`、`ci:`、`build:`、`test:`、`style:` | 不列出 |

`feat:` 和 `fix:` 在 `CHANGELOG.md` 裡會標上 app 名稱，Manager 靠這個在那個 app 上標示有更新。
預設是 JPTT；支援別的 app 之後，在 commit 寫上範圍，例如 `fix(YouTube): ...`。

`CHANGELOG.md` 是給 Morphe Manager 的「檢視變更紀錄」讀的（它不讀 Release），格式是 Manager
規定的，**不要手改**。發完之後想補充說明，改 GitHub 上的 Release 就好。

## 反組譯資料

`.work/`（已被 ignore）放 jadx 的反編譯結果、apktool 的 smali、工具和參考用的 repo。隨時可以刪，
APK 撈回來重跑 jadx、apktool 就有了。
