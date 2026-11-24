# futatabi — 書き込み・ログイン機構の実証調査（2026-11-22）

**工程：調査のみ。パッチ実装・改変、実サービスへの書き込み、OAuthログイン、Release作成はいずれも未実施。**

## 検収の結論

| 板 | 書き込みの判定 | 根拠 | 保留事項 |
|---|---|---|---|
| **あいもげ** | **条件付きGO** | OpenAPI 2026-11-11に投稿・返信・削除・添付presign・トークン発行・アプリ承認PKCEが存在 | ふたったーからの実POST未捕捉。資格情報、ALTCHA、画像実体アップロードのUI設計が必要 |
| **あにまん** | **条件付きGO** | 公開HTMLフォームと公開main.jsで、投稿前検証・本投稿・画像アップロードの3段階を確認 | Cookie、サーバ側bot対策、ログイン、規約、送信結果の互換性は未実証。公開API契約は未確認 |
| **めぶき** | **GO（所有者申告の管理人許可を前提とする設計調査）** | 所有者が管理人の許可取得と運営への関与を申告し、MUSEが2026-11-22に従来のNO-GOを解除。OAuthと公開API経路を[追加調査](mebuki-auth-api-research-20261122.md) | 許可の具体的範囲は未検証。実ログイン後のCookie・サーバ側投稿契約は未確認。実投稿はしない |

このGOは技術検討を続行できるという意味であり、**実際の投稿成功・許可範囲の独立確認・安全な認証まで成立したという意味ではない**。めぶきのGOは2026-11-22の監督判断による追記であり、以下の旧調査記述の当時の状態と区別する。

## 1. ふたったー純正UIからの投稿をローカルで観測

**環境**：`emulator-5554`／素の`com.Nanasaki.ftutter` 3.1.1／既存保存リストへ直接追加済みの`http://127.0.0.1:18766/aimoge/`。ADB reverseは`tcp:18766 → tcp:18766`。18766は本リポジトリ内フィクスチャを研究用HTTPキャプチャへ一時切替。終了時に元の`tests/adb_reverse_fixture.py --port 18766`へ復旧。実サイトへ投稿する経路は使っていない。

**実施・実物証拠**：

- カタログとスレの`GET /aimoge/futaba.php?mode=cat`、`GET /aimoge/res/1449110872.htm`がアプリUA `Ftutter/3.1.1` で到達。実際のアプリからローカルへの取得経路は稼働。
- 純正スレの鉛筆ボタンで投稿モーダルを表示。**題名／おなまえ／E-mail／コメント**の4入力欄、画像選択、書き込むボタンをUI階層とスクリーンショットで確認。
- レス投稿（本文テスト入力）を**2回**、新規スレ立て（題名＋本文テスト入力）を**1回**、キャプチャサーバーに向けて送信操作した。しかし**`POST`は0件**。各操作後にモーダルが閉じたことは確認したが、サーバーへの送信成功を意味しない。
- 画像添付ボタンからAndroidのファイルピッカーまでは到達。画像候補をタップするとAndroidの「Open with」画面に遷移し、投稿フォームの添付済み状態と`multipart`の実パートは取得できなかった。
- 捕捉サーバーはPOSTを受けた場合に入力フィールドの名前・型・長さを記録し、`403`、`200`、`302`を切替可能な研究用モードを用意していた。**POST到達0件なので、どの応答もアプリへ返せていない**。よってアプリの成功／失敗判定に必要なHTTPステータス、リダイレクト、本文パターンは**未確定**。
- 削除依頼のUI・実HTTPも**未観測**。削除パスやフォーム名を実物と称して推測しない。

[アプリ投稿観測結果（機密情報のない集計）](gate-evidence/write-research-post-probe-summary.json)／[純正投稿フォームの切り抜き画像](gate-evidence/write-research-ftutter-compose-cropped.jpg)（背景の第三者投稿を除外）

### kakikomiDataの意味（新しい実証）

元の板エントリJSONでは`kakikomiData: null`だったが、ローカルで投稿フォームを操作した**後**に、`flutter.itaList`内の同一板の`kakikomiData`が次のオブジェクトに変化した。

```json
{
  "title": "local_thread_probe_2026",
  "name": "",
  "mail": "",
  "comment": "local_body_probe_2026",
  "upFile": ""
}
```

いずれも調査用のテスト文字列。**画面で入力した題名・本文が保存されている**。一方、対象板の`suretateCount=0`、`resuCount=0`で、ローカルPOSTも0件。この組み合わせは**投稿フォームの下書き／再入力状態の保持**という用途を強く示唆し、**投稿履歴・認証トークン保存欄**とみなす根拠はない。画像添付の実パス保存ルールは未確認。

## 2. あいもげ — OpenAPIと書き込み契約

実際の `https://api.nijiurachan.net/openapi.json` （`info.version=2026-11-11`）を読み、公開仕様に存在する**全22件の状態変更メソッド**を洗い出した。すべてのパス・method・ヘッダー・ペイロード型・成功コードを [機械可読な根拠ファイル](gate-evidence/write-research-aimoge-openapi-summary.json) に保存した。APIへPOST/PUT/DELETEは送っていない。

**スレ／レス／削除／添付**：

| 操作 | API | 形式・主要フィールド |
|---|---|---|
| スレ立て | `POST /threads/{slug}`（slug=`aimg`） | JSONの`body`、`deleteKey`が必須。任意`requestId`、`altcha`、`attachmentId`／`attachmentIds`、`sage`、`duration`など。成功HTTP 201 |
| レス投稿 | `POST /threads/{threadId}/posts` | JSONの`body`、`deleteKey`が必須。任意`requestId`、`altcha`、`attachmentIds`（最大3）、`sage`など。成功HTTP 201 |
| 投稿削除 | `DELETE /posts/{postId}` | JSONの任意`deleteKey`、`x-aimg-token`。成功HTTP 200 |
| 添付アップロード準備 | `POST /attachments/presign` | `sha256`、`mime`、`sizeBytes`必須。任意`fileName`、`source`。返答`attachmentId`、`uploadUrl`、`reused`。成功HTTP 200 |
| スレ終了 | `POST /threads/{threadId}/close` | 任意`deleteKey`。成功HTTP 200 |
| リレー停止・通報 | `POST /threads/{threadId}/relay/stop`、`POST /threads/{threadId}/report` | 認証・管理判断・レート制限あり |

**他のPOST/PUT/DELETE**：`POST /app-authorizations`、`POST /app-authorizations/{id}/decision`、`POST /app-credentials`、`DELETE /app-credentials`、`DELETE /app-credentials/current`、`POST /tokens`、`PUT /online-users/heartbeat`、`PUT /posts/{postId}/reactions/super`、`PUT /posts/{postId}/reactions/{type}`、`PUT /posts/{postId}/poll/vote`、`POST /private-hello`、`POST /supporter/logout`、`POST /events`、`PUT /events/{eventId}/interest`、`POST /events/{eventId}/cancel`（計22）。各APIの意味により認可条件は異なる。

**認証**：OpenAPIの認証定義はヘッダー`x-aimg-token`（`aimgToken`）と、支援者向け`__Host-supporter_session` Cookie（`supporterSession`）。`X-Board-Key: aimg`は対象板を示す指定であって、秘密のログイン資格情報と混同しない。スレ立て・レスなど主要更新APIは`aimgToken`を要求する。

さらに**アプリ承認（PKCE S256）**の契約がある：

1. `POST /app-authorizations`で`redirectUri`、`installationId`、`state`、`codeChallenge`、`codeChallengeMethod=S256`を送って`authorizationUrl`を得る
2. ブラウザ側承認フロー（仕様上`/app-authorizations/{id}/decision`、CSRFトークン等）を経る
3. `POST /app-credentials`に`redirectUri`、`code`、`codeVerifier`を渡して`credential`、`credentialId`、`expiresAt`を受け取る

201応答の説明ではアプリ資格情報の**固定21日有効・refresh token不発行**。実認証・発行の試験はしていない。通常`POST /tokens`やALTCHAを含む別の認証／検証経路もAPIに存在し、どれを採るかはMUSE判断。

**書き込みの運用上限**：公式`GET /client-policy`で`X-Board-Key: aimg`指定時にHTTP 200、`maxBodyLength=4000`、`maxFileSizeBytes=20,971,520`（20MiB）、`maxDeleteKeyLength=64`、`threadsPerHour=60`、`threadCreationCooldownSeconds=60`、`replyCreationCooldownSeconds=10`、`threadReplyCreationCooldownSeconds=5`を実取得。許可MIMEにはJPEG/PNG/GIF/WebP/HEIC、MP4/QuickTime/WebMが含まれる。サーバ側には追加の規制／検閲判定・HTTP 429等があり、これらを単なる表示上限とみなさない。画像アップロード実体は`presign`レスポンスの`uploadUrl`に依存し、**リクエスト本文・HTTPメソッド／必要ヘッダーは未観測**（presign POST自体未実施）。勝手に固定化しない。

## 3. あにまん — 公式公開HTML／main.jsの読み取り

2026-11-22に以下を**GETのみ**で読み取った。

- カテゴリ実物：`https://www.animanch.com/category50000000000/`。`<base href="https://bbs.animanch.com/">`。投稿側の入力要素として`title`、`category`、`name`、`text`、画像`file1`、画像対応用の隠し`upname`・`thread`を確認。画像フォーム`#upform`にはHTMLの`method`・`action`指定なし。JSが別送信する。
- 投稿処理：`https://bbs.animanch.com/main.js?1667032701` の`#respost`クリック処理。先に`POST https://bbs.animanch.com/inc/comment.php?preCheck`、次に`POST https://bbs.animanch.com/inc/comment.php`を`postdata`で送信（jQuery既定のURL-encodedデータ）。成功時にJSONを`$.parseJSON`、`number`・`thread`・`jump`を使用。エラー時は`responseText`をモーダル表示。
- 画像付きは投稿成功後に`POST https://bbs.animanch.com/upload/`を`FormData`（multipart）で送信。通常の`#upform`では`file1`、`upname`、`thread`、複数画像専用分岐では`files[]`、`upname`、`thread`。JavaScriptに**新規スレでは画像必須**の分岐あり。
- `https://bbs.animanch.com/board/1/`を未ログインでGETし、`Set-Cookie`ヘッダの**Cookie名`PHPSESSID`**を確認。Cookie値は保持しない。**投稿時のCookie必須性は未確認**。
- 調査したHTML・main.jsにはreCAPTCHA／Turnstileの明示的な処理文字列は検出されなかった。しかしCloudflare等のサーバ側対策が存在しないことは**証明できない**。ログイン専用UI／OAuthフローも、この公開サンプルからは確認できなかった。「ログイン不要」と断定しない。

[送信経路とフィールドの実物読取記録](gate-evidence/write-research-animanch-public-flow.json)

## 4. めぶき — OAuth・おためしモード・規約

公式FAQ：`https://mebuki.moe/faq`、トップ：`https://mebuki.moe/`、おためし：`https://mebuki.moe/trial`、規約：`https://mebuki.moe/terms`。

- **ログイン**：公式が**X、Google、DiscordのOAuth2**を案内。Webサイトでログインする形式（公式スマホネイティブアプリはなし）。外部ブラウザ／WebViewのいずれでコールバックが完結するか、内部セッションCookie名・SameSite・HttpOnly・有効期限は未認証の観測では**未確定**。未ログイントップGETで`Set-Cookie`は観測されず、これだけでログイン後の保存方式は判定できない。
- **おためしモード**：公開カタログ閲覧のみ、更新は**5分間隔**。公式FAQによるとスレ詳細・レスなどは使えない。ログイン後はスレ閲覧、スレ立て、レス、既読管理等を利用可能。公式FAQではレス本文5,000文字・100行、添付4件・各8MB、スレ立てタイトル100文字・スレ画像1件・タグ必須（1～10件）。
- **規約と2026-11-22の更新**：18歳以上・国内在住・国内利用が対象。一般規約第3条15号の直接APIアクセス禁止は引き続き記載されている。ただし所有者から管理人の許可取得と運営への関与が申告され、MUSEの判断で**めぶきはGO（設計調査可能）**へ変更した。許可範囲の独立確認・本人のログイン・実API書き込みは未実施。公開コードの技術調査は[別報告](mebuki-auth-api-research-20261122.md)。

## 5. ふたったー → 各サイトへ変換する場合の暫定マッピング

**前提**：純正アプリのHTTP POST本体は**未捕捉**。下表のふたったー側はUI項目と`kakikomiData`実測値に基づく暫定案。ふたばPHPの歴史的な`mode=regist`、`resto`、`com`等は公開スクリプト等の**参考**であり、ふたったー3.1.1で送られると実証したものではない（例：`https://www.2chan.net/script/`）。

| 純正UI・保存値 | あいもげ仕様への候補 | あにまん仕様への候補 | めぶき |
|---|---|---|---|
| `title` | スレ作成APIにタイトルの独立フィールドなし。本文との統合／専用UIは設計判断 | `title`（スレ作成） | `/new`のmultipartスレ作成フォーム（フィールドの完全契約未確認） |
| `name` | 公開CreateThreadBody/CreateReplyBodyに対応欄なし | `name` | 対応欄未確認 |
| `mail` | `sage`等への条件変換の可否要検討。生文字列は対応欄なし | 対応欄未確認 | 同左 |
| `comment` | `body` | `text` | `/t/:tslug`のmultipartレスフォーム（本文フィールド名未確定） |
| `upFile` | ファイル`sha256/mime/sizeBytes`→`presign`→`attachmentId(s)` | 本投稿後`upload/`へ`file1`または`files[]` | 同左 |
| スレ／レス種別 | `POST /threads/aimg`または`POST /threads/{uuid}/posts` | `comment.php?preCheck`→`comment.php`（`thread`紐付け） | 同左 |
| 削除 | `DELETE /posts/{postId}`＋トークン・deleteKey等 | 投稿削除フォーム未検証 | 同左 |
| 送信成功判定 | API 201 + JSON契約（OpenAPI）。元アプリへ返す互換レスポンスは未設計 | 投稿成功JSONの`jump/number/thread`。元アプリ向け返答変換は未設計 | 同左 |

## 6. MUSEが設計判断する必要のある論点（実装案は決めない）

1. **純正投稿UIを維持するか、新UIを用意するか**：現状localhostでPOST 0件。純正アプリの送信前チェック・投稿URL生成を解析せず、Bridge側の対応だけで進めるのは危険。MUSEのUI判断待ち。
2. **資格情報の保管主体・場所**：`x-aimg-token`、アプリ承認資格情報、投稿削除キー、認可用`state`／PKCE`codeVerifier`等の用途別分離、端末バックアップ・クローン・アンインストール・ログ出力時の扱い。Flutter `kakikomiData`を秘密情報用の保存先とみなさない。
3. **認証画面とリダイレクト**：あいもげPKCE承認をどのブラウザ経由で提示し、発行資格情報をどう戻すか、固定21日更新／再認証時の利用者操作。OAuth等の本人許可を省略しない。
4. **人間の投稿意思・対策**：ALTCHA／CSRF／レート制限の処理、画像の安全性・NSFW規則、公開前の利用者確認、投稿重複防止`requestId`、HTTP 429時の停止・表示。
5. **添付送信の責務**：アップロード先・Content-Type・サイズ・複数枚の扱い、元サイトの署名済みアップロードURLを第三者へ漏らさないこと。動画をJPEG化する閲覧機能と投稿の元ファイルは別。
6. **成功・失敗の表現**：HTTPステータス、本文、リダイレクト、アプリUIが成功と判定する仕組みを追加実測するまで、実サイトへ送信しない。実際のレス番号への対応、失敗時の下書き保持・再送を要設計。
7. **あにまん／めぶきの運用制限**：Cookieによる投稿資格の有無、bot対策への適切な対応、各運営の規約・許可。めぶきは管理人の許可取得について所有者申告があり、MUSEの監督判断によりGOへ変更。許可の具体的な範囲、OAuthセッションの管理、Turnstileの正規処理は別途決定する。
8. **リリース・テスト境界**：ローカルフィクスチャでのエミュレータE2Eのあと、所有者の明示操作による実サイトでの正規送信を別段階の検収とすること。無断投稿・資格情報収集はしない。

## 今回の停止条件と未確定事項

- ふたったーの**新規スレ／レス／画像投稿の実POSTパケットは未取得**。削除形式・成功／失敗レスポンス判定も未確定。キャプチャサーバーが受信しなかった以上、これらをPASSと記述しない。
- あいもげはAPI仕様・公開読み取りまで、あにまんは公開HTML/JSの読み取りまで、めぶきは公式案内／規約まで。実サービスへの書き込み試験ゼロ。
- **パッチ、Bridge、APK、Release v0.2.0は変更していない。** 次の実装フェーズへは進まずMUSEの設計判断待ち。
