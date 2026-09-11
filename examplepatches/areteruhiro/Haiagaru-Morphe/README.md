# Haiagaru for Morphe

ChMate `0.8.10.191 dev` / `0.8.10.241` / `0.8.10.242 dev` / `0.8.10.243 dev` 対応のMorpheパッチです。 <br>
機能は以下を参照
https://github.com/areteruhiro/Haiagaru

## Features

* Remove ads (including margins)
* Modify User-Agent
* Remove MonaKey

## 更新履歴

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
- バージョン: `0.8.10.242 dev`（versionCode 512、minSdk 23）
- バージョン: `0.8.10.243 dev`（versionCode 513、minSdk 24）
- 元APKの署名 SHA-256:
  `7dd84d97df4666fbc8188b8d6167ce59314636997f0edae82d685fffda4059d2`

## ビルド

```powershell
.\gradlew.bat :patches:buildAndroid --no-daemon --max-workers=1
```

生成物:

```text
patches\build\libs\patches-1.2.1.mpp
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
