# futatabi

**ふたったー 3.1.1（`com.Nanasaki.ftutter`、versionCode 65）専用のMorpheパッチセット。** GPL-3.0。

**v0.3.0：書き込み機能を追加。** あいもげのPKCEログイン／新規スレ／返信／画像添付／削除キー管理、あにまんの読み取りと3段階投稿、ランチャーから起動する拡張ホーム画面に対応。**投稿・ログイン・画像送信はローカルフィクスチャE2Eで検証済み。実機・実サイトでの最終確認は未実施。** [実測報告](docs/write-flow-v03-e2e-observation-20261123.md)。めぶきは未対応（v0.4.0予定）。あにまんは[公開HTMLとmain.js](https://bbs.animanch.com/main.js)を参考に独自実装し、他パッチのコードは流用していない。

## v0.3.0 の追加機能

- あいもげ：拡張ホーム画面からPKCEログイン、新規スレ立て、返信、画像添付（presign→PUT）、削除キーと投稿履歴を管理
- あにまん：カタログ・スレの読み取りアダプタと、preCheck→comment.php→upload/の書き込み対応
- 拡張ホーム画面：独立したランチャーアイコンから起動し、板ごとの投稿とログイン導線を提供
- めぶき：未対応。v0.4.0での対応を予定

## v0.2.0 から継続する機能

| パッチ | 既定 | 内容 |
| --- | --- | --- |
| Block banner ads | ON | マージ済み ARM64 APK の `libapp.so` を照合し、上部バナーとその余白を除去。リワード広告の経路には手を加えない |
| Clone app | ON | 既定ではパッケージ名に `.morphe` を追加し、元アプリと共存可能にする |
| Local board bridge | ON | アプリ内ContentProviderから読み取り専用HTTPサーバーを起動し、**あいもげ**を既存の板一覧に自動追加 |

### あいもげ

- `http://127.0.0.1:18765/aimoge/` をFlutter SharedPreferences（`flutter.itaList`）へ冪等に追加。登録済みの板、既定の「ねこ」、ユーザーが追加した板は保持する
- 127.0.0.1のHTTP Bridgeから `https://api.nijiurachan.net` の公開APIを呼び出す。API版 `2026-11-11`、板slug `aimg`、`X-Board-Key` と `/client-policy` の検証を使用
- 取得はGETのみ。カタログ／スレ／JPEG変換サムネイルを、素のふたったーのカタログ／スレUIへ表示。Shift_JIS非対応文字は数値参照に変換し、HTMLをエスケープする。元サイトのJS、フォーム、投稿経路は引き継がない
- POSTを含むGET以外の要求は **HTTP 403**。元サイトへ投稿・認証情報を中継しない
- カタログ90秒、スレ30秒、画像10分のメモリキャッシュ。API取得を最低1.5秒間隔に制限し、画像レスポンスのサイズと配信元ドメインを制限する
- 仮想スレ・画像IDは安定した**13桁**。画像は `{id}s.jpg` と `{id}.jpg` のふたば形式へ対応。動画のJPEG経路には動画本体を流さず公式サムネイルの静止画を使用
- bind失敗時はBridgeのみ停止して、元アプリの起動を妨げない設計

**今回の未対応範囲:** あにまんはアダプタ未実装なので**新規ユーザーには自動登録しない**。めぶきも無効の受け口のみ。あにまんやめぶきへのGETは503、POSTは403。既存のユーザーが登録した板は削除しない。

## 導入

1. **ふたったー3.1.1** のスプリットXAPKを、すべての必要なスプリットを含む単一APKへマージする（分割されたベースAPKだけでは起動できない）。
2. [Releases](https://github.com/rikunode/futatabi/releases) から `futatabi-patches-v0.3.0.mpp` と `SHA256SUMS` を取得し、ハッシュを照合。
3. Morphe Managerへfutatabiのパッチソースを追加し、マージ済みAPKへ適用。パッチ3件はすべて既定ON。適用後のAPKは自分の端末用に署名・インストールする。
4. ふたったーを起動し、利用規約に同意後、板一覧の「あいもげ」を開く。

**クローンを使わない場合:** パッチ選択画面で **Clone app** をOFFにする。Morphe Desktopでは `--disable="Clone app"`。クローンの既定パッケージ名は `com.Nanasaki.ftutter.morphe` で、元の `com.Nanasaki.ftutter` とアプリデータを共有しない。

**再インストールの注意:** パッケージ名や署名鍵が変わると、Android側で上書きインストールできないことがある。アプリを削除すると、そのパッケージのデータも失われる。重要な板・お気に入りなどは事前にバックアップすること。元アプリは不用意に削除しない。

## 検証状況

2026-11-22、照合済みXAPKからAPKをマージし、3パッチ同時適用→開発署名（APK Signature Scheme v1/v2/v3照合）→Android API 36エミュレータへクローンをインストールした。

**エミュレータ実測PASS:** 元アプリとクローンの共存、Bridgeの127.0.0.1:18765待受、既存板を保持したあいもげ自動登録、再起動後の登録維持と重複防止、実APIのカタログ・スレ本文・レス番号・JPEG画像表示、動画サムネイル代替、POST 403。詳細は[統合試験記録](docs/bridge-v0.2.0-emulator-gate-20261122.md)。

**未検証:** 所有者実機でのインストールと広告非表示の視覚確認、リワード広告（視聴による24時間非表示）導線。これらは所有者の実機確認項目として残る。エミュレータの検証を実機検証済みとは表現しない。

## 対象ファイルの照合情報

| 入力 | SHA-256 |
| --- | --- |
| ふたったー3.1.1 XAPK（68,916,938 bytes） | `11dae3fa2c2882f1223cacbdc14b62bcf2d6ed04bc4436d9fc988e98d6ea53dc` |
| ベースAPK（46,218,824 bytes） | `f8093dd9cae64a48b0e74831800782a747045902e2171855a672195ef5690486` |

APK、XAPK、デコンパイル済みソース、個人用署名鍵はこのリポジトリ／Releaseには含めない。配布するのはパッチセット（.mpp）のみ。

## 先行する実証・出典・ライセンス

- [板リスト直接書き込み実証](docs/gate4-storage-direct-write-20261122.md)
- [実物mayカタログ／スレの描画差分実証](docs/gate4-may-real-html-parser-20261122.md)
- [公式あいもげAPI仕様](https://api.nijiurachan.net/ui)／[API利用ガイド](https://wiki.nijiurachan.net/運営公式/API利用ガイド)
- Clone appは[Morphe公式CloneAppPatch.kt](https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/all/misc/clone/CloneAppPatch.kt)からのGPL-3.0派生。著作権、ReVanced由来、GPL-3.0 第7条の追加表示をソースに保持
- [Haiagaru-Morphe（GPL-3.0）](https://github.com/areteruhiro/Haiagaru-Morphe)は将来のあにまん対応における参考候補。今回は実装コードを流用していない
