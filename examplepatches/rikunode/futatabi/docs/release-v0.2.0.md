# futatabi v0.2.0 — あいもげ Bridge搭載

**対象：ふたったー3.1.1（versionCode 65）のみ。** 配布内容はMorphe用パッチバンドル（.mpp）であり、改変済み第三者APKは配布しません。

## 変更点

- **Local board bridge（新規・既定ON）**：非公開ContentProviderを使ってアプリ内の `127.0.0.1:18765` で読み取り専用HTTPサーバーを起動。bind失敗時はBridgeだけ停止して元アプリを起動可能にする設計
- Flutter SharedPreferencesの`flutter.itaList`に**あいもげ**を自動追加。既定板や既存登録は維持し、再起動時の重複を防止
- `api.nijiurachan.net` の公開API（`X-Api-Version: 2026-11-11`）からカタログ・スレ・添付画像を取得し、ふたば形式のShift_JIS HTMLへ安全に変換。長い数字の仮想IDとJPEGサムネイルに対応
- 元画像が動画のときは公式サムネイルを静止画として表示。画像の取得先を制限し、キャッシュ・取得間隔・最大レスポンスサイズを設定
- POSTはHTTP 403、掲示板への投稿や認証処理は実装しない
- **Block banner ads** と **Clone app** は引き続き既定ON。クローンの初期パッケージ名は `com.Nanasaki.ftutter.morphe`

**あにまん対応は次版以降へ延期。** 今回は未実装のため新規ユーザーに自動登録しません。めぶきも無効の受け口のみです。

## 適用方法と注意

- 正確なふたったー3.1.1 XAPKを**必要なスプリット込みの単一APKへマージしてから**Morpheでパッチを適用してください。ベースAPK単体への適用では正常に起動できません。
- クローンが不要ならMorpheのパッチ一覧で **Clone app** をOFFにしてください（CLI: `--disable="Clone app"`）。
- パッケージ名変更や署名鍵の変更により、既存APKへ上書きインストールできない場合があります。アプリ削除時にはそのアプリのデータが消えるため、必要なデータを事前にバックアップしてください。
- 公開されている `SHA256SUMS` とダウンロードした `.mpp` のSHA-256を照合してください。

## 検証

[Androidエミュレータ統合試験の実測報告](https://github.com/rikunode/futatabi/blob/main/docs/bridge-v0.2.0-emulator-gate-20261122.md)

**PASS：** 照合済みXAPKのマージ、3パッチ同時適用・再ビルド、開発署名APKの署名検証（v1/v2/v3）、クローンと元アプリ共存、Providerと18765番待受、板自動登録と永続化・冪等性、あいもげの実APIカタログ・スレ本文・JPEG画像表示、動画添付の静止画プレビュー、POST 403。

**未検証：** 所有者実機でのインストール、バナー非表示の視覚確認、リワード広告による24時間非表示の導線。エミュレータのPASSを実機確認済みとは表現しません。

本ソースはGPL-3.0。Clone app由来の[Morphe公式実装](https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/all/misc/clone/CloneAppPatch.kt)の著作権・ReVanced由来・GPL第7条の追加表示は保持しています。
