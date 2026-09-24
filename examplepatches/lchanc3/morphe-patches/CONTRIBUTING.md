# 編譯與開發

## 需要

- JDK 17+（已確認 Temurin 25 可用）
- Android SDK（路徑寫在 `local.properties`，該檔不進版控）
- 一組能讀 GitHub Packages 的憑證 —— Morphe 的 Gradle plugin 放在
  `maven.pkg.github.com`，需要 `read:packages` scope。

## 設定 GitHub 憑證

到 <https://github.com/settings/tokens/new?scopes=read:packages&description=Morphe> 產生
classic token，寫進 `~/.gradle/gradle.properties`：

```properties
gpr.user = 你的GitHub帳號
gpr.key  = ghp_xxxxxxxxxxxxxxxxxxxx
```

或者用環境變數 `GITHUB_ACTOR` / `GITHUB_TOKEN`（CI 走的就是這條）。`gh` 已經登入的話
一行搞定：

```bash
{ echo "gpr.user = $(gh api user --jq .login)"; echo "gpr.key  = $(gh auth token)"; } >> ~/.gradle/gradle.properties
```

> **只有這四個名字有用。** Morphe 的 settings plugin 套用時會自己再加一次同一個 repo，
> 而它只讀 `providers.gradleProperty("gpr.user").orElse(System.getenv("GITHUB_ACTOR")).get()`，
> 沒有別的 fallback。所以光跑 `gh auth refresh -s read:packages` 不夠 ——
> 那只夠 `settings.gradle.kts` 自己解析到 plugin。
>
> 在 `settings.gradle.kts` 裡用 `System.setProperty("org.gradle.project.gpr.user", …)`
> 補也來不及：Gradle 在跑 settings script 之前就把 settings scope 的 properties
> 讀完快照了（`-Dorg.gradle.project.gpr.user=…` 從指令列傳則有效）。
>
> 所以那裡改成缺憑證就直接停下來講清楚，而不是讓 plugin 丟一個沒有訊息的
> `IllegalArgumentException`。

## 建置

```bash
./gradlew buildAndroid
```

產出在 `patches/build/libs/patches-*.mpp`。

## 驗證

`buildAndroid` 只證明 patch 編得過，不證明它對目標 App 還有效 —— fingerprint 對不上的話
build 照樣綠燈，你要到 Morphe Manager 套用時才會發現。

```bash
./gradlew verifyAgainstApk
```

這個 task 會像 Manager 一樣把編出來的 bundle 實際套到 APK 上，每個 patch 印 ok / FAILED，
再把 patched dex 寫到 `patches/build/verify/` 讓你反組譯檢查注入的位置。不簽章也不安裝。
`build/libs` 裡有多個 bundle 時取最新的那個，並印出忽略了哪些。

套用成功之後它還會做一次**引用檢查**：把 extension 打進 app 的每個呼叫、以及 patch 注入的
smali 指向 extension 的每個呼叫，都拿去對 patched dex 裡真正定義的方法比對。這是因為
extension 是對著完整的函式庫編譯的，而 app 裡那份已經被 R8 剃過 —— 這種呼叫編得過、patch
也套得上，要等執行到那一行才炸。`androidx.preference` 就少了 `setKey()`、
`createPreferenceScreen()`、`PreferenceManager.getContext()` 等等。

APK 依序找：`-Papk=<path>` → 環境變數 `JPTT_APK` → 專案根目錄下任何一個 `.apk`。
找不到就只有這個 task 失敗，不影響一般編譯。

## 那份 APK

`*.apk` 有 gitignore，repo 裡不會有。需要的時候從手機上撈回來就好 —— 手機上
JPTT 3.8.4 的 `base.apk` 跟這些 patch 當初對著寫的那份**位元組完全相同**
（`sha256 7b65298d00d8219d49b8d4dfac739f2bf63b6187a00f7697e3c67861fcf2d605`）：

```bash
adb pull "$(adb shell pm path com.joshua.jptt | grep base.apk | sed 's/package://' | tr -d '\r')" JPTT_3.8.4.apk
```

（JPTT 在 Play 上是 split APK，但 `base.apk` 以外那三個只有 arm64 native、xxhdpi
資源和 zh 語系，patch 都不碰。）

要注意的是這招只在手機還留著 3.8.4 的時候有效。JPTT 一更新那份就沒了，所以如果你想
釘住這個版本，把檔案另外收在 repo 外面，再用 `JPTT_APK` 指過去。

## 版面配置

```
patches/src/main/kotlin/app/lchanc3/patches/<app>/…   patch 本體
extensions/<app>/src/main/java/app/lchanc3/extension/<app>/…   注入 APK 的程式碼
extensions/<app>/stub/…   只給編譯用的 APK 既有類別簽章
```

加一個新的 App 就是並排開一組同名資料夾：`patches/…/patches/<app>/`、
`extensions/<app>/`（`settings.gradle.kts` 會自己掃到新的 extension 模組）。
跨 App 共用的東西放 `app.lchanc3.patches.shared`。

## 發佈

GitHub 上這個 repo 的 **Actions** → **Release** → **Run workflow**，填版本號。
Workflow 會編譯、更新 `patches-bundle.json` / `patches-list.json`、重寫 README 的
patch 清單、建立 release。CI 用 Actions 自動發的 `GITHUB_TOKEN`，不用另外準備 PAT。

README 裡 `<!-- PATCHES_START -->` 到 `<!-- PATCHES_END -->` 之間的內容是
`.github/scripts/generate_patches_readme.py` 從 `patches-list.json` 產生的，不要手改。

## 🧱 注入 smali 時不要假設有暫存器可借

R8 會把短方法編到只剩參數暫存器。這種方法裡 `.locals 0`，而 **`v0` 就是 `p0`** —— 在
index 0 插一行 `iget-object v0, p0, ...` 等於把 `this` 蓋掉，patch 照樣套用成功、
`verifyAgainstApk` 也全綠，然後在那個 class 第一次被載入時被 runtime verifier 擋下來：

```
java.lang.VerifyError: Verifier rejected class ...:
  [0x4] 'this' argument 'Reference: X' not instance of 'Reference: Y'
```

同一個方法在 3.8.4 有 local、在 3.8.5 沒有，所以「上一版能動」不算證據。兩種安全寫法：

- **重用現有指令的暫存器**（例如把某個 `const` 或 `iput` 的來源暫存器拿來放回傳值）。
- **把邏輯放進自己新增的方法**，用 `ImmutableMethod(...)` 指定 `registerCount`，呼叫點
  只留一行 `invoke-direct { p0 }`。`Reconnect on return` 和 `Preload article images`
  都是這樣做的。

真的要借 `v0`，先呼叫 `requireFreeLocals(method, n)`，讓它在編譯期就失敗而不是在使用者手機上。

每個 App 的 patch 表格下面那段「要注意的」是手寫的，放在
`.github/notes/<App 名稱>.md`，檔名要跟 patch 的 `Compatibility.name` 一樣（例如
`JPTT.md`）。沒有這個檔就不會有那一段。patch 自己說得清楚的事寫在 patch 的
`description` 就好，那裡會自動進表格；notes 只放表格看不出來、又會害人卡住的事。

## JPTT 的 patch 是怎麼找出來的

JPTT 沒有混淆，類別與方法名稱都是原樣，所以 fingerprint 直接用
`definingClass` + `name` 就夠精準。相關位置：

- `com.joshua.jptt.ArticleFragment` — `getAllPicUrl()`、`notifyDataSetChanged()`、
  `showListPartial()`、`PicItem`
- `com.joshua.jptt.BoardFragment` — `showSearchDialog()` 裡兩次
  `DBHelper.getBoardHistory(ctx, site, true, board, N)`（N 是 5 和 15）、
  `addSearchHistoryListToLayout()`
- `com.facebook.cache.disk.DiskCacheConfig$Builder#<init>` — `mMaxCacheSize = 41943040L`
- `com.joshua.jptt.JSocketSimple#in`、`startConnection()` 裡那個 Runnable 的 CSI 解析，
  以及 `JSocket#getToBoard()`

要自己重新分析的話，`.work/`（已 gitignore）裡有 jadx 反編譯結果與 apktool 的 smali。
那個目錄跟 APK 一樣是可拋棄的：APK 撈回來重跑一次 jadx / apktool 就有了。
