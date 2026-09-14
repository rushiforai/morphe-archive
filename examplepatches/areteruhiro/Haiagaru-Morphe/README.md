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

アプリデータを残したまま以前のChMateをアンインストールすると、再インストール時に既存のパッケージとの競合が表示される場合があります。

1. ChMateの設定や必要なデータをバックアップします。
2. 以前のChMateを、アプリデータも含めて完全にアンインストールします。
3. パッチ済みAPKをインストールします。
4. 必要に応じて、手順1のバックアップからデータを復元します。
情報提供: あかまつさん

アプリデータを削除すると、バックアップしていない設定や履歴は失われます。必ずアンインストール前にバックアップを確認してください。

パッケージ名変更版には、Shizukuを利用して旧ChMateの共有データをコピーする補助機能がありますが、chmate本来のバックアップ/復元を推奨しています。

初期状態で有効なパッチ `Change ChMate package name` では、別アプリとしてインストールするための
パッケージ名に加えて、アプリ名、PNG/WebPアイコン、versionCodeを設定できます。
アイコン・versionCodeを未指定にした項目は元の値を保持します。
新Shizuku APIを含むため、このパッチを有効にしたAPKはAndroid 7.0（API 24）以降が必要です。

備考: パッケージ名の変更により予期せぬエラーが発生する可能性がありますが、
既存のChMateとは別アプリとして扱われるため、インストール時の競合エラーを抑えられます。

任意パッチ `Save ChMate crash logs` を有効にすると、未処理例外でクラッシュした際に
`Download/Haiagaru/` へログを保存します。投稿本文、Cookieなどのアプリデータは記録しません。



## URV Managerへの追加と更新

パッチソースには次のURLを登録してください。

```text
https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/master/patches-bundle.json
```

プレリリースを検証する場合のみ、次の `dev` ソースを登録してください。

```text
https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/dev/patches-bundle.json
```

パッチ本体のバージョンは `1.2.2` です。同じバージョン内で修正版を配布する場合は、
URV Managerが更新を検出できるようにJSON上の配布リビジョン（例: `1.2.2-r3`）だけを更新します。
更新が表示されない場合は、パッチソース画面から手動で更新を実行してください。

## 更新履歴

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
