# Haiagaru for Morphe

ChMate `0.8.10.191 dev` / `0.8.10.241` / `0.8.10.243 dev` 対応のMorpheパッチです。 <br>
機能は以下を参照
https://github.com/areteruhiro/Haiagaru

最新版: [Latest](https://github.com/areteruhiro/Haiagaru-Morphe/releases/latest)

## Features

* Remove ads (including margins)
* Modify User-Agent
* Remove MonaKey
* `5ch.net` 表示・検索・書き込みの `5ch.io` 対応
* ChMate設定画面内のHaiagaru設定UI
* DAT落ちスレのURL自動補正と自動DAT取得
* `kako.5ch.io`、`itest.5ch.io`、`2ch.sc` のDAT取得プリセット
* パッケージ名、アプリ名、アイコン、versionCodeの変更
* パッケージ名変更後のバックアップ復元補助
* 任意で有効化できるクラッシュログ保存

設定値はChMate内のHaiagaru設定画面に保存されます。パッチはMorphe上で個別に有効化・無効化できます。

## DAT落ちスレ用プリセット

Haiagaruの設定画面から、次のプリセットを取得できます。

```text
https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/refs/heads/master/presets/chmate-dat-fallen-search-urls.txt
```

`kako.5ch.io`、`itest.5ch.io`、`2ch.sc` の3経路を収録しています。
2ch.scの板一覧参照先は https://menu.2ch.sc/bbsmenu.html です。

対応版では、`anago.5ch.net` など過去サーバーのスレッドURLを起動時に自動補正し、
`kako.5ch.io`、`itest.5ch.io`、`2ch.sc` の順にDAT取得を試行します。

## インストールできない場合

アプリデータを残したまま以前のChMateをアンインストールすると、再インストール時に既存のパッケージとの競合が表示される場合があります。

1. ChMateの設定や必要なデータをバックアップします。
2. 以前のChMateを、アプリデータも含めて完全にアンインストールします。
3. パッチ済みAPKをインストールします。
4. 必要に応じて、手順1のバックアップからデータを復元します。
情報提供: あかまつさん

アプリデータを削除すると、バックアップしていない設定や履歴は失われます。必ずアンインストール前にバックアップを確認してください。

`Change ChMate package name` は初期状態で有効です。パッケージ名を変更すると、
元のChMateとは別アプリとして扱われるため、アプリデータを残したアンインストール後に発生する
「既存のパッケージとの競合」対策になります。パッケージ名変更により予期せぬエラーが発生する可能性があるため、
必要なデータをバックアップしてから利用してください。アプリ名、アイコン、versionCodeも同時に変更できます。

パッケージ名変更版にはShizukuを使った共有データコピー補助がありますが、ChMate本来のバックアップ／復元を推奨します。



## URV Managerへの追加と更新

パッチソースには次のURLを登録してください。

```text
https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/master/patches-bundle.json
```

プレリリース版を利用する場合は、安定版とは別に次のURLを登録してください。

```text
https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/master/patches-bundle-pre.json
```

パッチ本体のバージョンは `1.2.2` です。同じバージョン内で修正版を配布する場合は、
URV Managerが更新を検出できるようにJSON上の配布リビジョン（例: `1.2.2-r3`）だけを更新します。
更新が表示されない場合は、パッチソース画面から手動で更新を実行してください。

## 更新履歴

### 1.2.2-r9

- `0.8.10.191 dev`／`0.8.10.241`／`0.8.10.243 dev` でURL自動補正と自動DAT取得を有効化
- `ResListActivity`／`Hilt_ResListActivity` の構造差に合わせて注入

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
