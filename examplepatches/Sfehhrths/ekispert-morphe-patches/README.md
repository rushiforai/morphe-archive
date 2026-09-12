# Ekispert Wear patches

駅すぱあと for Android（`jp.co.val.expert.android.aio`）に [Morphe](https://github.com/MorpheApp) でパッチを当て、経路検索の結果を自作の Wear OS アプリへ流すためのパッチ集です。公式アプリの Wear OS 版が終了したため、個人利用の目的で作りました。

ウォッチ側・スマホ側のアプリは別リポジトリ [ekispert-wear](https://github.com/Sfehhrths/ekispert-wear) にあります。

> **注意**
> - 改変した APK は **個人利用に限り**、再配布しないでください。駅すぱあとの利用規約と著作権に従ってください。
> - このリポジトリにはパッチのソースコードのみが含まれます。駅すぱあと本体の APK やパッチ済み APK は含みません。
> - 動作確認は 駅すぱあと 3.53.0（versionCode 295）で行っています。

## Morphe に追加する

[**➕ Morphe に追加**](https://morphe.software/add-source?github=Sfehhrths/ekispert-morphe-patches)

Morphe Manager が入った端末で上のリンクを開くと、このリポジトリがパッチソースとして登録され、GitHub Releases の `.mpp` がそのまま使えます。手動で追加する場合は Manager の「Patch sources」に `https://github.com/Sfehhrths/ekispert-morphe-patches` を入力してください。

## パッチ一覧

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/Sfehhrths/ekispert-morphe-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 駅すぱあと&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.53.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Response tap](#response-tap) | Sends route search results, the course opened in the detail screen, MyClip courses and transfer-alarm courses to the Ekispert Wear companion app (dev.sfehhrths.ekispertwear) for display on a Wear OS watch. |  |

</details>

<!-- PATCHES_END -->

## 何をするパッチか

パッチは公式アプリに 6 箇所の `invoke-static` を挿入し、同梱の extension（Java）を呼び出します。extension は取得した情報を gzip した Broadcast でコンパニオンアプリ（`dev.sfehhrths.ekispertwear`）へ送るだけで、公式アプリの動作は変えません。

| フック位置 | 取れるもの | Broadcast の `kind` |
|---|---|---|
| `AbsDownloader.d()`（OkHttpClient 生成） | 対象ホストの HTTP 応答本文（経路検索 XML、運行情報 XML、mixway の realtime/trip JSON） | `http_response` |
| `AioApplication.onCreate()` | Application Context（送信に必要） | — |
| `AbsDISRxSearchResultDetailParentFragmentPresenter.bc(int, boolean)` | 詳細画面で開いた／スワイプした経路の index | `selected_course` |
| `AbsDISRxSearchResultDetailParentFragmentUseCase.f(args)` | 詳細画面を開いた印 | `detail_opened` |
| `SearchRouteMyClipEntity.g()` | My クリップから開いた経路の XML | `myclip_course` |
| `TransferAlarmCourseDAO.b(...)` | 乗換アラームに登録した経路の XML | `transfer_alarm_course` |

フィンガープリントはクラス名・戻り値型・ライブラリ呼び出しで組んであり、R8 で潰されるメンバ名には依存していません。公式アプリの更新でクラス名が変わらない限り、そのまま当たる想定です。

Broadcast の中身（extras）は `extensions/extension/.../CompanionBridge.java` を参照してください。送信時に `BroadcastOptions.setShareIdentityEnabled(true)` を付けており、コンパニオン側で送信元パッケージを検証できます。

## 構成

```
patches/      Kotlin  Morphe パッチ本体（フィンガープリントと挿入処理）
extensions/   Java    公式アプリに合成されるコード（OkHttp Interceptor、Broadcast 送信）
```

- `patches/src/main/kotlin/dev/sfehhrths/ekispert/patches/responsetap/Fingerprints.kt` — 6 フックのフィンガープリント
- `patches/src/main/kotlin/dev/sfehhrths/ekispert/patches/responsetap/ResponseTapPatch.kt` — 挿入処理
- `extensions/extension/src/main/java/dev/sfehhrths/ekispert/extension/` — `ResponseTapPatch`（入口）、`ResponseTapInterceptor`、`ResponseSink`、`CompanionBridge`、`ContextHolder`

## ビルド

必要なもの:

- JDK 21
- Android SDK（`local.properties` に `sdk.dir=...`）
- Morphe のライブラリは GitHub Packages にあるため、`read:packages` スコープ付きの GitHub トークン。`~/.gradle/gradle.properties` に `gpr.user` / `gpr.key` を置くか、環境変数 `GITHUB_ACTOR` / `GITHUB_TOKEN` で渡します。

```bash
./gradlew buildAndroid
```

`patches/build/libs/patches-*.mpp` ができます。

## 適用

[Morphe CLI](https://github.com/MorpheApp/morphe-cli)（`morphe-desktop-*-all.jar`）を使います。端末から抜いた split APK は APKEditor などで 1 つの APK にマージしておきます。

```bash
java -jar morphe-desktop-<version>-all.jar patch \
  -p patches/build/libs/patches-1.0.0.mpp \
  --keystore my.keystore \
  -o ekispert-patched.apk \
  ekispert-merged.apk
```

- 署名が変わるため、元の駅すぱあとは **アンインストール**してから入れます（ログイン状態や保存データは消えます）。
- `--keystore` で指定した鍵は保管してください。次回以降の更新はこの鍵で署名すれば `adb install -r` で上書きできます。
- コンパニオンアプリをインストールして一度起動しておかないと、Broadcast は届きません。

## 動作確認

```bash
adb logcat -s EkispertTap
```

起動時に `application context captured` と `ResponseTapInterceptor installed`、経路検索後に `broadcast http_response ...`、詳細画面を開くと `broadcast selected_course index=...` が出ます。

応答本文そのものを logcat に出したいときは `ResponseSink.LOG_FULL_BODY` を `true` にしてビルドし直してください（リリース版では `false`）。

## 公式アプリが更新されたとき

[docs/UPDATING.md](docs/UPDATING.md) を参照してください。新しい APK の用意、`-f` での適用、動作確認、対応バージョンの更新とリリース、フィンガープリントが外れたときの直し方をまとめています。

## ライセンス

[GPL-3.0](LICENSE)（[morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template) を元にしています）。
