# futatabi v0.4.0 — ③板リスト保持と④めぶきレス投稿（2026-11-24）

**判定：③ユーザー編集後の板リスト保持 E2E PASS、④めぶきレス投稿のローカル専用E2E PASS（実サイト契約・実投稿未確認）。** ①広告枠はCodex担当のため変更なし。v0.4.0のバージョン付与・Releaseは未実施。

## 1. 旧ログイン試験環境の保全と解放

- 18766番で稼働していた `v04_mebuki_trial_fixture.py`、外部IP遮断中のクローンAPK、WebViewの模擬セッションを確認。共有環境を変更する前に、現行のFlutter設定・移行フラグ・アプリ専用の秘密設定と、フィクスチャ受信ログを **Git管理外** `apk-inspection/v04-mebuki-gate/handoff-20261124/` に保全した。
- 3種の設定ファイルをテスト前のバックアップから復元し、通常の `v03-integration-debugsigned.apk` を再インストール。IPv4／IPv6の当該UID宛外部遮断ルールと一時的な `adb forward tcp:18767` を解除。18766番は元の `tests/adb_reverse_fixture.py` に戻し、従来の `adb reverse tcp:18766 tcp:18766` は維持。
- 3種のSharedPreferencesのSHA-256が復元元ファイルと一致することを確認。模擬Cookieは最終的に除去し、実ログイン・実投稿は0件。

## 2. ③ユーザー編集保持：エミュレータ再試験PASS

以前のXMLテストデータには不正な構文があったため、`apk-inspection/v04-image-gate/prefs-user-edited-valid.xml`（XML再パースPASS）を使用。

- 移行フラグ `futatabi.v04.default_boards_done=true` を設定した状態で、利用者が **imgを削除し、独自板 `https://example.invalid/custom/` を追加**した板リストを投入。
- エミュレータにv0.4開発テストAPKを適用し、拡張Activityを2回コールド起動。
- 投入直後、1回目、2回目に抽出した `flutter.itaList` の全板エントリが**完全一致**。`img` は再追加されず、独自板・may・既存Bridge2板が保持された。

ここでの検証はユーザー編集保持の動作確認であり、全ての実機移行パターンの証明ではない。

## 3. ④めぶきレス投稿実装：既知の契約のみ

既存の匿名閲覧 `MebukiAdapter`、所有者操作専用 `MebukiLoginActivity`、保護付き `/ext/*` を維持し、次だけ追加。

- 公開スレ画面のクライアントJS `app._main.t._tslug-CVcJPhqn.js` で確認した **`content`、`replyToId`（任意）、`showUsername`、`showThreadOwner`** のみをmultipartに設定。宛先は `POST https://mebuki.moe/t/{slug}`。
- `/ext/mebuki/reply` をインストール固有ローカルトークンで保護。スレIDは公開おためしカタログからBridgeが記録した13桁ID→実slugの対応以外受け付けない。
- WebViewのセッション確認後にアプリ専用SharedPreferencesへ保存したCookieのみ使用。Cookie値をFlutterSharedPreferences・ログ・証拠ファイルに記録しない。未ログインはHTTP 401。
- 本文は最大5,000文字／100行、添付・未検証フィールドは拒否。**新規スレのmultipartフィールド全件は未確定のため、新規スレ投稿ルートを実装しない。** Turnstileの迂回なし。
- サーバー応答形式・成功判定が未確定なので、2xx／3xx応答を**HTTP 202／`confirmed:false`** としてUIへ伝え、投稿成功を表示しない。実サイトの投稿が成立したとの主張はしない。

拡張ホームには「めぶき：本人操作ログイン」「一覧からレス投稿」を追加。おためしカタログは5分遅延であることと、新規スレ・添付が未対応であることを明示。

## 4. ④ローカルフィクスチャE2E

エミュレータの該当UID 10222に限りIPv4／IPv6外部宛てを拒否し、テスト専用APKの上流ホストを127.0.0.1:18766へ限定。フィクスチャは `tests/v04_mebuki_reply_fixture.py`。

| 操作 | 実測結果 |
| --- | --- |
| 偽Cookieなしでレス投稿 | **401**、外部送信なし |
| 模擬Cookie＋既知の4フィールドで返信 | **202**、上流フィクスチャ `POST /t/LOCALdemoA0` がHTTP 200応答 |
| 新規スレとして送信を試みる | **400**、上流送信なし |
| 未実証の添付を送信しようとする | **400**、上流送信なし |
| 拡張UIからスレ選択・本文入力・レス送信 | **PASS**。フィクスチャに2回目のPOST到達、画面に「送信応答を受信・成功未確定」表示 |

受信ログにはPOSTが**2件**。1件目は `content,replyToId,showUsername,showThreadOwner`、2件目は `content,showUsername,showThreadOwner`。いずれも**既知のフィールドのみ／偽Cookieあり**。本文・Cookie本体は記録しない。ログSHA-256：`644b34dafdf9f7a9fcbe0b74fe5fd4eb54e3514e2a3a782ec4c386ce33c7a797`。

**注意：** フィクスチャのHTTP 200は、ローカルでのmultipart通信の成立を示すだけで、実めぶきの保存成功・認証済みスレ読み取り・アップロードを保証しない。

## 5. ソース復元・ビルド・残件

- テスト専用パッチ `.mpp`：**748,503 bytes**、SHA-256 `e4c0c4c9d9cf0a1804194f039155124270775884098a0ce73decfae2c7631185`。
- 通常HTTPSに復元したソースからGradleビルド：**BUILD SUCCESSFUL**。本番向け開発 `.mpp`：**748,555 bytes**、SHA-256 `c4e49f4bce2f0479565fbab730a993a835ab495f2c75d81459b0ee082914a0ae`。**ハッシュ不一致を確認**。
- エミュレータの元APK・3設定・18766番通常フィクスチャへ復旧。遮断ルールとforward撤去、既存reverse保持を再確認。
- [機械可読な検収証拠](gate-evidence/v04-mebuki-reply-and-board-retention-20261124.json)。

**残件：** めぶきの認証済みスレ本文・添付の正式レスポンス、新規スレ作成multipartの全フィールド、実サーバーの投稿成功／失敗の応答、Cookie名・属性・有効期限は所有者の実ログイン／実サイト検収まで未確定。ローカル送信経路の実装と、実サービスへの対応完了を混同しない。

**リリース判断：** 未確定契約の捕捉が必要。バージョンは0.3.0のまま、`patches-list.json`／`patches-bundle.json`／GitHub Releaseは更新しない。
