# Haiagaru for Morphe

ChMate `0.8.10.191 dev` / `0.8.10.226 dev` / `0.8.10.241` / `0.8.10.243 dev` 対応のMorpheパッチです。 <br>
機能は以下を参照
https://github.com/areteruhiro/Haiagaru

最新版: [Latest](https://github.com/areteruhiro/Haiagaru-Morphe/releases/latest)

## Features

* Remove ads (including margins)
* Modify User-Agent
* Remove MonaKey
* GitHubから更新できるDAT落ちスレ用検索プリセット
* 自動DAT取得経路の並べ替えと任意HTTPS経路の追加
* 自動DAT取得のON/OFF切り替え
* 古いDAT・過去ログの改行保持と`.io` URL直接起動時の自動DAT取得
* 5ch.io板が外部板扱いと5ch扱いで重複した場合の内部板一覧一括整理
* パッケージ名・アプリ名・アイコン・versionCodeの変更
* Morpheで任意に有効化できるクラッシュログ保存
* ChMate `0.8.10.191 dev`／`0.8.10.226 dev` のChMate+互換設定
  * 単発ID表示を省略
  * コピペ省略2
  * 荒らし省略

DAT落ちスレ用プリセットは、通常閲覧時ではなく設定画面の更新ボタンを押した時だけ、
[`presets/chmate-dat-fallen-search-urls.txt`](presets/chmate-dat-fallen-search-urls.txt) を取得します。
GitHubへ接続できない場合は、基本3経路を収録した内蔵プリセットを使用します。
2ch.scの板一覧参照先は [`https://menu.2ch.sc/bbsmenu.html`](https://menu.2ch.sc/bbsmenu.html) です。

Haiagaru設定の「自動DAT取得経路」は、上の行から順に試行します。
初期状態では、元スレと同じサーバーの `5ch.io` DAT、`kako.5ch.io`、
`itest.5ch.io`、同じサーバーの `2ch.sc` DATの順です。
行を並べ替えると優先順を変更でき、1行追加すると任意のHTTPS経路も追加できます。

各行は `auto|`、`dat|`、`kako|`、`itest|` のいずれかにURLを続けます。
URLでは `{$server}`、`{$bbs}`、`{$key}`、`{$rand}` を使用できます。
空行と `#` で始まる行は無視され、無効な設定しかない場合は初期経路へ戻ります。

## インストールできない場合

ChMate `0.8.10.241`では、アプリデータを残したまま以前のChMateをアンインストールすると、再インストール時に既存のパッケージとの競合が表示される場合があります。

1. ChMateの設定や必要なデータをバックアップします。
2. 以前のChMateを、アプリデータも含めて完全にアンインストールします。
3. パッチ済みAPKをインストールします。
4. 必要に応じて、手順1のバックアップからデータを復元します。

アプリデータを削除すると、バックアップしていない設定や履歴は失われます。必ずアンインストール前にバックアップを確認してください。

初期状態で有効なパッチ `Change ChMate package name` では、別アプリとしてインストールするための
パッケージ名に加えて、アプリ名、PNG/WebPアイコン、versionCodeを設定できます。
アイコン・versionCodeを未指定にした項目は元の値を保持します。

標準設定ではShizukuを組み込みません。旧ChMateの共有データをShizukuでコピーする場合だけ、
任意パッチ `Migrate ChMate data with Shizuku` を追加で有効にしてください。
この任意パッチを有効にしたAPKはAndroid 7.0（API 24）以降が必要です。
データ移行にはchmate本来のバックアップ/復元を推奨しています。

備考: パッケージ名の変更により予期せぬエラーが発生する可能性がありますが、
既存のChMateとは別アプリとして扱われるため、インストール時の競合エラーを抑えられます。

任意パッチ `Save ChMate crash logs` を有効にすると、未処理例外でクラッシュした際に
`Download/Haiagaru/` へログを保存します。投稿本文、Cookieなどのアプリデータは記録しません。

情報提供: あかまつさん

## URV Manager / Morphe Managerへの追加と更新

現在の公式版（1.2.3）を取得するパッチソースは次のURLです。

```text
https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/refs/heads/master/patches-bundle.json
```

プレリリース版（1.2.3.r3）を取得するパッチソースは次のURLです。正式版より新しい検証中の変更を含みます。

```text
https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/refs/heads/master/patches-bundle-pre.json
```

開発中のパッチ本体のバージョンは `1.2.3.r3` です。同じバージョン内で修正版を配布する場合は、
URV Manager / Morphe Managerが更新を検出できるようにJSON上の配布リビジョンを更新します。
更新が表示されない場合は、パッチソース画面から手動で更新を実行してください。

## 更新履歴

### 1.2.3.r3（プレリリース）

- ChMate `0.8.10.191 dev`／`0.8.10.243 dev` で、Talkの現行スレを開くと `divide by zero` またはDAT落ちになる問題を修正
- Talk APIのレスをChMateのDATキャッシュへ変換し、署名変更後に不安定になるTalk専用取得処理より先に読み込むように変更
- TalkのURL、板情報、書き込み処理はChMate本来の経路を維持

### 1.2.3.r2（プレリリース）

- ChMate `0.8.10.226 dev` の設定画面復元時に `o.setImageAssetsFolder.<init>` の署名依存デコイで `divide by zero` が発生する問題を修正
- 226実機で起動後に `SettingActivity` を開き、同クラッシュが再発しないことを確認
- 広告View非表示処理で、View復元中の例外がChMate本体のクラッシュへ波及しないように保護

### 1.2.3.r1（プレリリース）

- 1.2.2-r15で検証した変更を、1.2.3系の最初の検証版として再公開
- Haiagaru設定ボタンが反応せず設定画面を開けない端末への互換処理を収録
- ChMate+互換設定のチェック状態だけが変わり、実機能が有効にならない問題を修正

### 1.2.3（正式版）

- Android 16を含む一部端末でHaiagaru設定ボタンを押しても設定画面が開かない問題を修正
- Haiagaru設定からChMate+互換機能を有効にしても、実際の動作へ反映されない問題を修正
- ChMate 0.8.10.191 devの単一ID省略設定に残っていた有効化判定を補正
- ChMate 0.8.10.191 dev、0.8.10.226 dev、0.8.10.241、0.8.10.243 devに対応

### 1.2.2-r15（プレリリース）

- `master` / `main` のパッチバンドル混在を解消するため、配布対象を `master` に統一
- ChMate `0.8.10.191 dev`／`0.8.10.226 dev` のChMate+互換設定で、チェックはONになるが実際の機能が有効にならない問題を修正
- `コピペ省略2` をONにした場合はChMate本体側の親設定 `copipeNg` もONにするように変更
- `荒らし省略` をONにした場合はChMate本体側の親設定 `copipeNgAR` もONにするように変更
- ChMate `0.8.10.191 dev` の `単発ID表示を省略` で、保存済み設定がONのときに追加の有効化ゲートで無効化されないように修正

### 1.2.2-r14（正式版）

- Haiagaru設定ボタンをアプリ内のポップアップ表示へ変更し、Android 16 / Samsung系端末でボタンが表示されても設定画面が開けない問題を修正
- ChMate+設定、DAT経路、プリセット更新、Shizuku移行、重複板整理の各設定セクションを個別に保護し、追加機能側の失敗で基本設定画面全体が開けなくなる問題を回避
- 診断用に追加していた設定ボタンのログ保存処理を正式版から削除
- ChMate `0.8.10.191 dev`／`0.8.10.226 dev` のHaiagaru設定画面にChMate+互換設定を追加
- DAT取得、URL自動補正、投稿、板整理、パッケージ名・アプリ名・アイコン・versionCode変更機能を維持

### 1.2.2-r13（正式版）

- URV Managerが解釈できるタイムゾーンなしの`LocalDateTime`形式へ`created_at`を修正
- 対応バージョン一覧とパッチバンドルの配布情報を更新

### 1.2.2-r11（正式版）

- 対応対象にChMate `0.8.10.226 dev`（versionCode 494）を追加
- Haiagaru設定画面から、自動DAT取得をON/OFF可能に変更
- `.io` URLを直接開いた古いスレッドも自動DAT取得の対象に修正
- 自動DAT取得開始時の「過去ログを取得しています」表示を抑制し、既存DATがある場合はChMate本来の処理へ移行
- kako HTMLとitest JSONの本文変換で、`<br>`・段落タグ・元改行を保持
- ChMate内部の`roidon.sqlite`を直接編集し、外部板扱い／5ch扱いの5ch.io板を選択して一括削除できる機能を追加
- 削除後はChMateの再起動で板一覧を更新

### 開発版

- ChMate `0.8.10.191 dev` のAndroid「URLをアプリで開く」対象へ、`*.5ch.io` と `itest.5ch.io` を追加

### 1.2.2-r10（プレリリース）

- 自動DAT取得で現役サーバーのDATを最初に確認する経路を追加
- `kako`、`itest`、`2ch.sc` を含む取得経路を1行単位で並べ替え可能に変更
- DAT・kako HTML・itest JSONの形式指定と、任意HTTPS URLテンプレートの追加に対応
- GitHub配布プリセットへ、`.net`／`.io`対応の板別 `2ch.sc` 14経路を追加

### 1.2.2-r9（正式版）

- ChMate `0.8.10.191 dev`／`0.8.10.226 dev`／`0.8.10.241`／`0.8.10.243 dev` の全対応版でURL自動補正を有効化
- `kako.5ch.io`、`itest.5ch.io`、`2ch.sc` の自動DAT取得経路をスレッドURL起動時にも適用
- 191 devは `ResListActivity`、241／243 devは `Hilt_ResListActivity` の構造差に合わせて注入

### 1.2.2-r8（プレリリース）

- ChMate `0.8.10.243 dev` で画像添付時に発生していたメモリ不足、0除算、null関連のクラッシュを修正
- DAT落ちスレを `kako.5ch.io`、`itest.5ch.io`、`2ch.sc` から取得するプリセットを更新
- パッケージ名変更を初期状態で有効化し、アプリ名、PNG/WebPアイコン、versionCodeの変更に対応
- パッケージ名変更後のバックアップ復元に含まれる旧パッケージ参照を補正
- Shizukuを使った旧ChMate共有データのコピー補助を追加
- 広告非表示時に広告SDKと計測SDKの初期化を抑制
- 任意パッチ `Save ChMate crash logs` を追加。クラッシュ時に `Download/Haiagaru/` へログを保存
- 対応対象から ChMate `0.8.10.242 dev` を削除

### 1.2.2-r7（プレリリース）

- ChMate `0.8.10.191 dev` の添付解析用テキストから `sssp://`、HTTP(S)、制御文字形式のBEアイコントークンを入力段階で除去
- 本文側のBEアイコン描画は原文を使用するため維持

### 1.2.2-r6（プレリリース）

- ChMate `0.8.10.191 dev` のレス単体、スレ全体、表示変換の全添付経路からBEアイコンURLを除外
- `img.5ch.io/ico/marara_tya.gif` と `img.5ch.io/ico/kuma.gif` を含む `img.5ch.io/ico/` / `img.5ch.net/ico/` を対象化

### 1.2.2-r5（プレリリース）

- ChMate `0.8.10.191 dev` の添付抽出結果からBEアイコンURLを直接除外

### 1.2.2-r4（プレリリース）

- ChMate `0.8.10.191 dev` のBEアイコンを通常の添付ファイル一覧から除外

### 1.2.2

- ChMate `0.8.10.191 dev` のBEアイコン分類と表示を修正
- URV Managerが1.2.2内の修正版を検出できる配布リビジョンを追加

### 1.2.1

- Android版Morphe Managerで読み込めるDEX形式のパッチバンドルへ修正

### 1.2.0

- ChMate `0.8.10.191 dev` の画像アップロード時クラッシュを修正

### 1.1.0

- ChMate `0.8.10.191 dev` 対応
- `5ch.io` の表示・検索・書き込みに対応

## 対象

- パッケージ: `jp.co.airfront.android.a2chMate`
- バージョン: `0.8.10.191 dev`（versionCode 459、minSdk 21）
- バージョン: `0.8.10.226 dev`（versionCode 494、minSdk 23）
- バージョン: `0.8.10.241`（versionCode 511、minSdk 23）
- バージョン: `0.8.10.243 dev`（versionCode 513、minSdk 24）
- 元APKの署名 SHA-256:
  `7dd84d97df4666fbc8188b8d6167ce59314636997f0edae82d685fffda4059d2`

## ビルド

```powershell
.\gradlew.bat :patches:buildAndroid --no-daemon --max-workers=1
```

生成物:

```text
patches\build\libs\patches-1.2.2.mpp
```

Morphe Desktopでは `Haiagaru` を有効にして対象APKへ適用します。
APKは再署名されるため、Play版など署名が異なるChMateとはそのまま上書きできません。

### ChMate+互換機能

191／226／243 devでは、Haiagaru設定から「単発ID表示を省略」「コピペ省略2」
「荒らし省略」を切り替えられます。設定を保存するとアプリが再起動します。
191では荒らし・コピペ2の判定処理にも有効化の修正を適用し、各設定がOFFの場合は
判定処理を登録しません。243は元の判定処理と設定条件を使用します。

191／243の元APKと生成APKに対するバイトコード検査は、
`scripts/VerifyChMatePlus.java` で実行できます。

```powershell
java -cp <morphe-desktop-all.jar> scripts/VerifyChMatePlus.java <元191.apk> <生成191.apk> <元243.apk> <生成243.apk>
```

この検査は191の2箇所の登録制限の除去、設定OFFの分岐の維持、
243の判定処理の維持を確認します。実際のレスの省略表示は別途実機で確認してください。

## サポート
何かあればGitHubのIssueか
以下のサーバーで対応させていただきます。
お気軽にご質問等お願いします。
＊開発者自身がchmateを開かないため

[Haiagaru サポートチャンネル](https://discord.com/channels/1392057820316303362/1547235153347092572)

## 寄付

- [Amazon Gift Card](https://www.amazon.co.jp/gp/product/B004N3APGO) Send to (areteruhiro@gmail.com)
- [PayPay](https://qr.paypay.ne.jp/p2p01_RsY3yQavNdvx74da)

## 構成

- `patches/src/main/kotlin/app/morphe/patches/chmate/HaiagaruPatch.kt`
  - 対象メソッドの特定とバイトコードパッチ
- `extensions/chmate/`
  - ChMate内で動く設定UIと移植機能

ベースのビルドシステムとパッチ形式は
[Morphe patches](https://github.com/MorpheApp/morphe-patches) を使用しています。

## Credit

Original Tsubonofuta is developed by AioiLight. \
https://github.com/AioiLight/Tsubonofuta

Forked from Tsubonofuta (Modify), developed by nonnonstop. \
https://github.com/nonnonstop/Tsubonofuta

Forked from Binnosoko
https://github.com/Chipppppppppp/Binnosoko

Contribution <br>
LEINsに対して寄付/ご購入してくださった皆様

<br>
フォークされる方へ
<br>
必須ではありませんが、このリポジトリのURLを貼ってくれると嬉しいです
