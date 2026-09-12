# 駅すぱあと本体が更新されたときの手順

公式アプリ（`jp.co.val.expert.android.aio`）がバージョンアップしたときに、このパッチを追従させる手順です。パッチはクラス名・型・ライブラリ呼び出しだけでフック位置を特定しているので、多くの更新では **コードを変えずにバージョン表記を上げるだけ**で済みます。フィンガープリントが外れた場合の直し方も後半に書きます。

## 全体の流れ

1. 新しい APK を用意する
2. 今のパッチをそのまま当ててみる（`-f`）
3. 動作を確認する（logcat）
4. 対応バージョンを更新してリリースする
5. 当たらなかった場合はフィンガープリントを直す

## 1. 新しい APK を用意する

### 端末から抜く（Morphe CLI を使う場合）

端末で駅すぱあとを更新したあと、split APK を取り出して 1 つにマージします。

```bash
adb shell pm path jp.co.val.expert.android.aio
# package:/data/app/.../base.apk
# package:/data/app/.../split_config.arm64_v8a.apk
# package:/data/app/.../split_config.ja.apk ...

mkdir ekispert-splits
adb pull /data/app/.../base.apk ekispert-splits/
adb pull /data/app/.../split_config.arm64_v8a.apk ekispert-splits/
# 出てきた split をすべて pull する

java -jar APKEditor-1.4.9.jar m -i ekispert-splits -o ekispert-merged.apk
```

マージ後の APK は元の署名が無効になっていますが、パッチ適用時に署名し直すので問題ありません。

すでにパッチ版が入っている端末からは元の APK は取れません。その場合は別の端末か、APKMirror などから同じバージョンの APKM を入手します。

### APKM を使う（Morphe Manager を使う場合）

Manager は APKM をそのまま入力にできます。マージは不要です。

## 2. 今のパッチをそのまま当ててみる

```bash
java -jar morphe-desktop-<version>-all.jar patch \
  -p patches-<version>.mpp \
  --keystore ekispert-wear.keystore \
  -f \
  -o ekispert-patched.apk \
  ekispert-merged.apk
```

- `-f` は「パッチの対応バージョン一覧に無いバージョンでも適用する」指定です。
- ログに `Applied: Response tap` と出れば、6 つのフィンガープリントがすべて一致しています。
- 失敗した場合は、外れたフィンガープリント名（例: `DetailCourseSelectedFingerprint`）が例外メッセージに出ます。→ [5. フィンガープリントを直す](#5-フィンガープリントを直す)

Manager の場合は、パッチ一覧の警告（対応バージョン外）を承知の上で適用します。

### 署名について

- パッチ済み APK は `--keystore` で渡した鍵で署名されます。**前回と同じ鍵**なら `adb install -r` で上書きでき、ログインや保存データは残ります。
- 鍵を変えると（CLI ↔ Manager の切り替えも含む）署名が変わり、一度アンインストールが必要になります。
- 鍵ファイルはリポジトリに入れません。各自で保管してください。

## 3. 動作を確認する

```bash
adb install -r ekispert-patched.apk
adb logcat -s EkispertTap
```

確認する順番:

| 操作 | 期待するログ | 対応するフック |
|---|---|---|
| アプリ起動 | `application context captured` | `AioApplication.onCreate()` |
| 〃 | `ResponseTapInterceptor installed` | `AbsDownloader.d()` |
| 経路検索 | `broadcast http_response chars=... gzip=...B` | OkHttp Interceptor |
| 経路を開く | `broadcast detail_opened` | `AbsDISRxSearchResultDetailParentFragmentUseCase.f()` |
| 〃 | `broadcast selected_course index=0 presenter=DISRxDia...` | `Presenter.bc(int, boolean)` |
| 詳細でスワイプ | `broadcast selected_course index=1 ...` | 〃 |
| 乗換アラーム登録 | `broadcast transfer_alarm_course chars=...` | `TransferAlarmCourseDAO.b()` |
| My クリップから開く | `broadcast myclip_course chars=...` | `SearchRouteMyClipEntity.g()` |

コンパニオン側も併せて見ます。

```bash
adb logcat -s EkispertWear
```

`route search: 8 courses` → `selected course #1 ...` → `data item put wear://.../ekispert/course` と流れれば、ウォッチまで届いています。パッチは当たるのにコンパニオンで `parse failed` が出る場合は、サーバー応答の形式が変わっています（→ [6. 応答形式が変わった場合](#6-応答形式が変わった場合)）。

## 4. 対応バージョンを更新してリリースする

`patches/src/main/kotlin/dev/sfehhrths/ekispert/patches/shared/Constants.kt`:

```kotlin
targets = listOf(
    AppTarget(version = "3.54.0"),   // 新しいバージョンを先頭に
    AppTarget(version = "3.53.0"),
),
```

確認できたバージョンを新しい順に並べます。動かなくなった古いバージョンは消します。

コミットして `main` に push すると GitHub Actions がリリースを作ります。コミットメッセージの種類でリリース種別が決まります。

| 変更内容 | コミットメッセージの例 | リリース |
|---|---|---|
| 対応バージョン追加のみ | `bump: 駅すぱあと 3.54.0 に対応` | パッチ版（1.0.x） |
| フィンガープリント修正 | `fix: 3.54.0 で SearchRouteMyClipEntity のフィンガープリントが外れるのを修正` | パッチ版 |
| 新機能 | `feat: ...` | マイナー版 |
| ドキュメントのみ | `docs: ...` | リリースされない |

Release が作られると `patches-bundle.json` と README のパッチ一覧が自動更新され、Manager 側にも新しい版が出ます。

任意のバージョンに（警告付きで）当てられるようにしたい場合は、`AppTarget(version = null, isExperimental = true)` を `targets` に足します。

## 5. フィンガープリントを直す

失敗したフィンガープリント名から、どこを見るかが決まります。新しい APK を jadx（`jadx-gui`）で開いて対象クラスを探してください。R8 はクラス名・パッケージ名を保持し、メソッド名・フィールド名だけを `a`, `b`, `d()` のように潰します。そのためフィンガープリントではメソッド名を使わず、次の要素で特定しています。

| フィンガープリント | 対象 | 特定に使っているもの |
|---|---|---|
| `OkHttpClientBuildFingerprint` | `AbsDownloader` の `OkHttpClient` を作るメソッド | クラス名末尾 `/AbsDownloader;`、戻り値 `Lokhttp3/OkHttpClient;`、引数なし、`OkHttpClient$Builder.<init>` 呼び出し |
| `AioApplicationOnCreateFingerprint` | `AioApplication.onCreate()` | クラス名（Manifest 固定）、メソッド名 `onCreate`、`Application.onCreate` の `invoke-super` |
| `DetailCourseSelectedFingerprint` | 詳細画面のページ選択（`bc(int, boolean)`） | クラス名末尾 `/AbsDISRxSearchResultDetailParentFragmentPresenter;`、引数 `(I, Z)`、`HistorySelectRouteUseCase.g(AioCourse, long)` の呼び出し |
| `DetailOpenFingerprint` | 詳細画面の初期状態を作るメソッド `f(args)` | クラス名末尾 `/AbsDISRxSearchResultDetailParentFragmentUseCase;`、戻り値 `...ViewModelInstanceState;`、引数 `...ParentFragmentArguments;` |
| `MyClipCourseLoadFingerprint` | `SearchRouteMyClipEntity` の XML → `AioCourseList` 変換 | クラス名末尾 `/SearchRouteMyClipEntity;`、戻り値 `...AioCourseList;`、`IOUtils.toInputStream(String)` 呼び出し |
| `TransferAlarmCourseSaveFingerprint` | `TransferAlarmCourseDAO` の保存ヘルパー | クラス名末尾 `/TransferAlarmCourseDAO;`、戻り値 `J`、引数 `(Class, L, String, J, J, L)`、`CompressUtils.a(String)` 呼び出し |

直し方の目安:

- **クラスが改名・移動された**: jadx で旧クラスの役割（例: OkHttpClient を生成する抽象クラス）を持つクラスを探し、`definingClass` を新しい名前にします。`definingClass = "/AbsDownloader;"` のように `/` から書くと「末尾一致」になり、パッケージ移動には耐えます。
- **引数や戻り値が変わった**: `parameters` / `returnType` を新しい型に合わせます。難読化された型は `"L"` とだけ書けば任意のオブジェクト型に一致します。
- **フィルタの呼び出し先が変わった**: たとえば `CompressUtils.a` が別クラスに移った場合は `methodCall(smali = ...)` を新しいシグネチャにします。一意に絞れれば、別の目印（文字列定数など）でも構いません。
- **メソッド自体が無くなった**: 同じ情報を持つ別の場所を探します。詳細画面の選択なら `HistorySelectRouteUseCase.g(AioCourse, long)` の呼び出し元、アラームなら `TransferAlarmCourseEntity` に XML を入れている場所、のように「取りたいデータが渡っている地点」を追うのが早いです。

挿入位置のレジスタは `ResponseTapPatch.kt` が一致した命令から自動で決めています（`registerC` や引数レジスタの計算）。挿入位置の考え方を変えない限り、こちらは触らずに済みます。

smali を直接見たいときは APKEditor で展開できます。

```bash
java -jar APKEditor-1.4.9.jar d -i ekispert-merged.apk -o ekispert-smali
```

修正後はローカルでビルドして当て直し、[3.](#3-動作を確認する) の表をすべて確認してから `fix:` でコミットします。

```bash
./gradlew buildAndroid
```

## 6. 応答形式が変わった場合

パッチは応答本文をそのまま送るだけなので、解析はコンパニオン（[ekispert-wear](https://github.com/Sfehhrths/ekispert-wear) の `companion/.../parser/`）が担当しています。次の点が変わるとコンパニオン側の修正になります。

- 経路検索 API のパス（現在 `/v1/xml/closed/search/course/extreme`）や XML の構造（`ResultSet/Course/Route/{Point,Line}`、`Line/InsideInformation/Stop`、番線は `DepartureState@no`）
- 運行情報（`operationLine/service/rescuenow/information`）、mixway `realtime/trip` の形式
- Broadcast の中身を変えた場合は、extension の `CompanionBridge` とコンパニオンの `TapContract` を同時に更新する

対象ホストが増減した場合は extension の `ResponseTapInterceptor.TARGET_HOSTS` を直します。

## チェックリスト

- [ ] 新しい APK（マージ済み or APKM）を用意した
- [ ] `-f` で当てて `Applied: Response tap` が出た
- [ ] logcat で 8 種類のログ（表）を確認した
- [ ] コンパニオンで `data item put` まで出た
- [ ] `Constants.kt` の `targets` を更新した
- [ ] `bump:` または `fix:` で push し、Release と `patches-bundle.json` が更新された
