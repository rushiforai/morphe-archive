# futatabi 書き込みフロー：段階2〜4エミュレータE2Eの到達点（2026-11-23）

**判定：PARTIAL（段階2〜4のコードは個別コミット済み、フィクスチャE2Eの全検収条件は未達）。Releaseは作成しない。**

## 段階別の実装コミット（main）

| 段階 | commit | 内容 |
| --- | --- | --- |
| 段階1訂正 | `52afa10` | ループバックredirectUriのHTTP 201、presign入出力とpresigned PUTの契約を追記 |
| 2 Bridge | `bc83241` | トークン保護 `/ext/*`、スレ一覧、あいもげPKCE開始・callback／code交換、投稿、presign→PUT、投稿履歴 |
| 3 UI | `77f5c06` | 独立ランチャーActivity、拡張ホーム、スレ選択、投稿フォーム、ログイン導線 |
| 4 あにまん | `4c861f3` | 独自HTML読み取り、スレ変換、preCheck→comment.php→upload/ 3段階代行 |

コードが存在し、前段のビルド・APK署名・Activity起動・部分的なBridgeリクエストが通っていても、**実投稿相当の全経路がPASSしたとみなさない**。

## ローカル専用フィクスチャでの今回の実測

Windowsの `127.0.0.1:18766` で `tests/write_flow_fixture.py` を稼働し、エミュレータ `emulator-5554` の `adb reverse tcp:18766 tcp:18766` で接続。模擬フィクスチャは外部への転送を行わない。ログにはURLパス・メソッド・本文のSHA-256・長さのみを残す。

**重要な安全策**：実際にインストールされていた前段のデバッグAPKではGETが実サイトを読んでおり、これを投稿試験に用いるのは危険だった。そのためテスト専用の拡張DEXだけで3つのAPI通信先を `127.0.0.1:18766` に一時切替え、パッチ→デバッグ署名して利用した。検証中はパッケージUID 10222の外部宛IPv4/IPv6 OUTPUTを遮断した。テスト通信先変更をGitへコミットせず、**元のJavaソースはすべて復元し、通常の.mppを再ビルド**した。

| 検証 | 実測結果 |
| --- | --- |
| 素のアプリとクローンの共存 | **PASS**（テストクローン `com.Nanasaki.ftutter.morphe`） |
| 拡張Activity起動 | **PASS**（Android `dumpsys activity` に resumed activity） |
| 無認証 `GET /ext/status` | **HTTP 403 PASS** |
| インストール固有トークンを付けた `GET /ext/status` | **HTTP 200 PASS**（3板の状態フラグ） |
| `GET /ext/threads?board=aimoge` | **HTTP 200 PASS**、フィクスチャの仮スレ1件 |
| `GET /ext/threads?board=animanch` | **HTTP 200 PASS**、フィクスチャの仮スレ1件 |
| `POST /ext/login/aimoge/start` | **HTTP 200 PASS**、フィクスチャに `POST /app-authorizations` 到達。架空の `example.invalid` 承認URLは受け取ったが、**開いていない** |
| 偽コールバック → 偽code交換 | **未検証** |
| 偽トークンでのあいもげ投稿／返信 | **未検証** |
| presign → ローカル模擬PUT | **未検証** |
| あにまんpreCheck→comment→upload | **未検証** |
| UI操作による投稿完了のE2E | **未検証** |

模擬コールバックから投稿・presign PUTまでの一括検証操作は安全性チェックによりブロックされ、**回避・再送していない**。従ってPOST成功・画像投稿成功を主張しない。既存の開発ステータス報告書にもあるとおり、本番の署名付きアップロードURLや認証Cookieの契約は所有者の実操作で別検収が必要。

### 隔離・復旧

- ローカル専用テストバンドル：`apk-inspection/v03-fixture-e2e/local-only-test.mpp`、739,314 bytes、SHA-256 `a35108a284e6070601f1710a007776e579af55f255bb9963dd75bb883ea196e6`（**公開・コミット対象外**）。
- フィクスチャアクセス証拠：`apk-inspection/v03-fixture-e2e/requests.jsonl`（Git管理外）。GET `/client-policy`、GET `/catalog/aimg`、GET `/`、POST `/app-authorizations` の到達を確認。
- Javaソース3件の通信先を元の公式HTTPSへ戻し、通常ビルドは **BUILD SUCCESSFUL**。テスト用一時worktreeは削除済み。
- エミュレータへ以前の通常デバッグ署名APK `v03-integration-debugsigned.apk` を再インストール。UID別の追加OUTPUT遮断ルールをすべて削除。 `adb forward tcp:18767` も除去。
- ポート18766は元の `tests/adb_reverse_fixture.py --port 18766` に復旧。実サービスへの投稿・OAuth認証・実トークン発行は**0件**。

**停止判断**：段階2〜4の実装コードと基本通信経路は存在するが、MUSEの指定した投稿・添付・あにまん3段階の全E2Eには到達していない。リリースせず、未検証部分についてMUSEの次判断を待つ。


## 追補：残り3経路と拡張UIのローカルE2E（2026-11-23）

**最新判定：フィクスチャE2Eは全経路PASS。** 上の「PARTIAL」は追補前の検収状態。実サイトでの投稿・OAuth成功を意味しない。

### 安全な実行条件

テスト専用APKでは3つのAPI通信先を127.0.0.1:18766に限定した。tests/write_flow_fixture.pyは外部サービスへ転送しない。エミュレータのクローンアプリUID 10222についてIPv4とIPv6の非ループバック通信をREJECTし、実OAuthと実投稿は行わなかった。

| 検証 | 判定 | フィクスチャで確認した順序・結果 |
| --- | --- | --- |
| 模擬PKCE開始、正しいstateのcallback、模擬code交換 | **PASS** | POST /app-authorizations → POST /app-credentials。callback HTTP 200 |
| 模擬資格情報の保存とログイン状態 | **PASS** | アプリ専用のSharedPreferencesにcredential・有効期限を保持。/ext/status HTTP 200、aimoge=true。FlutterSharedPreferencesに資格情報は含まれない |
| あいもげ新規スレ | **PASS** | POST /threads/aimg、HTTP 201 |
| あいもげ返信 | **PASS** | POST /threads/{id}/posts、HTTP 201 |
| あいもげ画像添付 | **PASS** | POST /attachments/presign → PUT /mock-upload → POST /threads/aimg。実際に生成した有効な4×4 JPEG、632 bytes。HTTP 201 |
| あにまん3段階 | **PASS** | POST /inc/comment.php?preCheck → POST /inc/comment.php → POST /upload/。HTTP 201、number/thread/jump/attachmentUploadedが返る |
| 拡張UIからの返信 | **PASS** | スレ一覧から模擬スレを選び、本文入力・送信。フィクスチャにPOST到達。UI階層に「投稿成功」表示 |

最初は前回の期限切れPKCE stateでcallbackが403だった。模擬の認証開始を新規実行しstateを更新するとcallbackが200となった。期限チェックの緩和はしていない。

### 証拠と後片付け

匿名化済みの経路別到達証拠は [write-flow-v03-final-e2e-20261123.json](gate-evidence/write-flow-v03-final-e2e-20261123.json)。フィクスチャ受信ログは17件、SHA-256 96f0d7e3c1293957d4698e7169e2b6409ef0a608d1a6ba584351c66f55aac151。模擬の資格情報や秘密値を含むデータ、生ログ、UI XMLはGit管理外のapk-inspection/v03-fixture-e2e/に保持。

テスト専用 .mpp：739,314 bytes、SHA-256 a35108a284e6070601f1710a007776e579af55f255bb9963dd75bb883ea196e6。

本番ソース復元後のGradle再ビルド：**BUILD SUCCESSFUL**。本番 .mpp：739,379 bytes、SHA-256 45c04d783a7f7861ff2ab51e2f10637d6fb214612f55edd5945659cdbc0c4527。

**両ハッシュは異なる。** 本番Javaソースにテスト用URLの変更差分なし。模擬資格情報と模擬投稿履歴はテスト前のアプリ専用SharedPreferencesへ戻した。UID用のIPv4/IPv6通信遮断・adb forwardを解除し、通常デバッグAPKと元の18766フィクスチャへ復旧。従来のadb reverseは維持。

**MUSE検収境界：すべてのフィクスチャE2EをPASSとする。実サイトでのログイン、投稿、署名付きアップロードURL、あにまんサーバ側検証は別途所有者検収が必要。Release・タグ・バージョン付与なし。**
