# futatabi v0.3.0 — 書き込み・ログイン対応

**対象：ふたったー 3.1.1（versionCode 65）のみ。** Morphe向けパッチバンドル（.mpp）を配布します。改変済み第三者APKは配布しません。

## 新機能

- **あいもげ書き込み対応**：公式PKCEアプリ承認によるログイン導線、新規スレ立て・返信、画像添付（presignで取得したURLへのPUT）、投稿ごとの削除キーと投稿履歴の管理。資格情報・削除キーは端末内のアプリ専用領域へ保存し、Flutterの `kakikomiData` には入れません。期限切れ時の再認証には利用者の操作が必要です。
- **あにまん読み取り＋書き込み対応**：独自の読み取りアダプタと、投稿前チェック `comment.php?preCheck` → 本投稿 `comment.php` → 画像添付 `upload/` の3段階処理に対応。公開HTMLと `main.js` を参考に独自実装しています。
- **拡張ホーム画面**：ランチャーアイコンから独立して起動できます。板別の投稿画面、返信先スレ選択、ログイン・ログアウト導線、投稿履歴を追加しました。
- **めぶきは未対応**。次期 **v0.4.0** での対応を予定しています。

既存の **Block banner ads**、**Clone app**、**Local board bridge** は引き続き既定ONです。素のふたったーの通常のふたば板への投稿処理は変更しません。

## 検証の範囲

**ローカルフィクスチャでのエミュレータE2EはPASS済み**です。認証トークン保護、模擬PKCE開始・callback・code交換、あいもげ新規スレ／返信／画像のpresign→PUT、あにまんの投稿3段階、拡張UIからの返信成功表示を確認しました。使用したコード・トークン・画像投稿先はすべてローカルの模擬環境です。

**実サイトでのログイン・投稿・画像アップロード、および所有者の実機での最終確認は未実施です。** リリースは実サイトでの成功を保証しません。検証結果は [E2E実測報告書](https://github.com/rikunode/futatabi/blob/main/docs/write-flow-v03-e2e-observation-20261123.md) に記録しています。

## インストール上の注意

- **ふたったー3.1.1 XAPKの必要なスプリットを単一APKへマージ**し、そのAPKにMorpheでパッチを適用してください。ベースAPK単体には適用しないでください。
- クローン不要なら適用時に **Clone app** をOFFにできます。クローンの既定パッケージ名は `com.Nanasaki.ftutter.morphe` です。
- 署名やパッケージ名が異なるAPKへの入れ替え・アンインストールにより、既存データが消える場合があります。必要なデータは事前にバックアップしてください。
- 添付した `SHA256SUMS` と配布 `.mpp` のSHA-256を照合してください。

本リポジトリはGPL-3.0。Clone appのMorphe公式由来コードに関する著作権表記・ReVanced由来表記・GPL第7条の追加表示は維持しています。

## 今後のリリース手順（Morphe Managerのソース認識）

新バージョンのReleaseを公開する際は、必ずリポジトリ直下の `patches-bundle.json` の `version` と `download_url` を新リリースのバージョンおよび公開 `.mpp` の実URLに更新する。`created_at` はそのReleaseの公開時刻（JST、`YYYY-MM-DDTHH:mm:ss` 形式）を設定し、`description` も変更内容に合わせて更新する。`signature_download_url` は署名ファイルがない場合は空文字列とする。公開後、`patches-list.json` と `patches-bundle.json` の両方がraw URLで取得可能なこと、および `download_url` が実際のReleaseアセットを指すことを確認する。
