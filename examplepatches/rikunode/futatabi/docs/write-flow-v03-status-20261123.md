> **2026-11-23 UPDATE: All local-fixture E2E paths PASS.** PKCE callback/credential exchange, Aimoge thread/reply/presign-PUT, Animanch three-stage posting, and extension-UI reply were verified. Earlier PARTIAL below is historical. See [final E2E results](write-flow-v03-e2e-observation-20261123.md) and [sanitized evidence](gate-evidence/write-flow-v03-final-e2e-20261123.json). No real-service login or posting; no Release.

# futatabi 書き込みフロー v0.3.0（開発中）— 実装・検証状況（2026-11-23）

**判定：段階2〜4の実装・コンパイルは完了。フィクスチャE2Eは一部PASS、投稿・PKCE code交換・添付PUTの成功経路は未検証。MUSEの検収前にReleaseしない。**

## 段階ごとのコミット

| 段階 | Commit | 実装 |
| --- | --- | --- |
| 段階1の訂正 | `52afa10` | MUSEのpresign契約（`sha256/mime/sizeBytes`、`attachmentId/uploadUrl/reused`、PUT）とPKCE HTTP201を追記。僕の前回の実測も201であり、401という記述は実測と異なる |
| 2 Bridge | `bc83241` | `/ext/status`、`/ext/threads?board=...`、`/ext/aimoge/post`、PKCE開始・状態付きcallback・credential交換・logout、保護トークン、投稿履歴・削除キーのアプリ専用保存、presign→PUT。通常`/aimoge/`は閲覧専用のまま |
| 3 UI | `77f5c06` | 別のランチャーActivity、ホーム、スレ選択、投稿フォーム、削除キー、添付、PKCEブラウザ導線、投稿履歴（通常のFlutter Activityと独立） |
| 4 あにまん | `4c861f3` | 独自HTMLパーサ、カタログ／スレ／JPEG、13桁ID、既存の板自動登録、投稿前チェック→投稿→画像multipartの3段階処理、Bridge内PHPSESSID保持。参考は公式公開HTMLと`main.js` |

**めぶき：** 今回のスコープ外（v0.4.0予定）。実サービスへのPOST、OAuthログイン、承認、本人トークン発行は実行していない。

## エミュレータの確認

対象：`emulator-5554`／Android API 36／照合済みふたったー3.1.1 XAPKマージ済みAPK／3パッチ同時適用／デバッグ署名のクローン`com.Nanasaki.ftutter.morphe`。**Releaseのバージョン・タグは変更していない。**

| 検証項目 | 結果・証拠 |
| --- | --- |
| Gradle拡張Java／Kotlinコンパイルと.mpp生成 | **PASS**（BUILD SUCCESSFUL） |
| Morphe 3パッチ同時適用／クローンパッケージ名／Provider・新ActivityのManifest登録 | **PASS** |
| デバッグ署名APKのv1/v2/v3検証 | **PASS** |
| 拡張Activityのエミュレータ起動 | **PASS**（一度system_server ANRが発生したが、テストAVD再起動で復旧。Activity起動・画面表示を確認） |
| Bridgeの127.0.0.1:18765待受 | **PASS** |
| GET `/ext/status`（トークンなし） | **403 PASS** |
| GET `/ext/status`（誤トークン） | **403 PASS** |
| GET `/ext/status`（アプリ内部の正しいトークン） | **200 PASS**、JSONフィールド`aimoge/animanch/mebuki` |
| 未ログインの`POST /ext/aimoge/post` | **401 PASS**（上流へ送信しない） |
| 無効なあにまん新規投稿リクエスト | **400 PASS**（必須title/category/image不足、上流へ送信しない） |
| 不正PKCE stateのコールバック | **403 PASS**（認証開始・code交換なし） |
| テスト専用接続先の模擬カタログ `/aimoge/futaba.php?mode=cat` | **200 PASS**、`cattable`あり |
| 模擬カタログ `/animanch/futaba.php?mode=cat` | **200 PASS**、`cattable`あり |
| 模擬あにまんスレ `/animanch/res/{13桁}.htm` | **200 PASS**、合成スレ本文の存在を確認 |
| **模擬PKCE正常callback→模擬資格情報** | **未実施**（資格情報を伴う一括試験の操作が安全性チェックで拒否。迂回実行しない） |
| **模擬あいもげ投稿成功／presign→PUT** | **未実施**（同上） |
| **模擬あにまんpreCheck→投稿→upload成功** | **未実施**（同上） |
| **拡張UIからの投稿操作全経路** | **未実施**（書き込みE2E未完） |

模擬APIは`tests/write_flow_fixture.py`として追加。テスト実行時に限って3つのJavaソースのホストを`http://127.0.0.1:18766`へ差し替え、Androidの`adb reverse`を使用した。**実サイトへPOSTが飛ぶ構成ではない。** 検証後、元ソースへ戻して`git diff`に差分がないことを確認し、公式ホストを使用する本番コードを再ビルド。**本番.mppはテスト専用.mppとはSHA-256が異なる**ことも確認した。

テスト専用.mpp：SHA-256 `b019a30951bdeae1d5b30965157fe41d879f63cac12762368c70ddc6dcf5e861`。

本番ソース再ビルド.mpp：SHA-256 `9dddb30c63cb4eef89c8f17da3ac1bcbe02dd3e66853155f931bf706ccdfb5f9`（739,379 bytes）。**これは開発中の成果物で、Releaseされた配布物ではない。**

## 未解決の実装・受入れ条件

- **本人認証を使った実API動作は未検証。** PKCEループバックredirectUriの受付HTTP201は前段階で実証済みだが、今回のcallbackとcode交換は未実測。
- **あいもげ添付の実際のpresigned PUT URLのホスト／必要ヘッダー／成功条件は未実測。** コードは安全な許可済みホストへのHTTPS PUTのみを試みる。URLが別ホストだった場合に推測で許可を広げない。
- **あにまんの実投稿3段階も未実測。** 公開JavaScriptの形式に沿って実装したが、Cookieの実際の必須性、サーバ成功・失敗応答との一致、画像アップロードの最終的な成功判定はMUSE検収対象。
- あにまんカタログは公開トップの先頭50件までの限定表示で、無制限にページをたどる処理は入れていない。カテゴリはUIでIDの入力が必要。
- 投稿履歴と削除キーのローカル保存は実装したが、削除を実サイトに送るUIは未実装。実投稿成功を確認できていない段階で削除可能とは表示しない。
- **成功を偽装しない。** HTTP成功・必要JSONフィールドを確認できない場合は失敗として扱う。実サイトへ勝手に試験投稿しない。

**MUSEへの停止報告**：段階2〜4の静的実装はコミット済みだが、指定された投稿成功までのフィクスチャE2Eは通過していない。ビルド・起動・読取・拒否条件のPASSを、投稿機能の全面PASSに拡大解釈しない。次の実装・公開は監督判断待ち。
