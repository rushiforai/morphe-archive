# めぶき：OAuth・セッション・読み書きAPIの公開技術調査（2026-11-22）

**判定：GO（所有者申告の管理人許可を前提とした設計調査続行）。実サイト投稿・ログインは未実施。**

## 前提の変更

所有者から「めぶきの管理人から許可取得済み。所有者自身も管理者として発起に関与」と申告された。これをMUSEの監督判断に従い反映し、規約による従来のNO-GOを解除した。**実際の許可文面・対象エンドポイント・運用条件は本調査で独立確認していない**ため、API書き込みの運用開始前にMUSEが範囲を確定する必要がある。公開規約の第3条15号には一般利用者による提供UIを介さないAPI直接アクセスの禁止が引き続き記載されている。

## 1. OAuth2ログインの実装と完了経路

公式FAQは **X（Twitter）・Google・Discord** の3種類を案内する。

2026-11-22に実際に配信されていた以下の公開JavaScriptをGET・保存・照合した。

- `https://mebuki.moe/assets/_index-BcCyGkio.js`：`provider: "twitter" | "google" | "discord"` の選択肢。ログイン実装は`signIn.social({provider, callbackURL:"/auth/callback", errorCallbackURL:"/?error=failed"})`。
- `https://mebuki.moe/assets/auth.client-CYPTXNct.js`：Better Authクライアント互換の既定パス`/api/auth`、認証付きfetchで`credentials:"include"`となる構成。
- `https://mebuki.moe/assets/manifest-1310c429.js`：React Routerの`api/auth/*`（loader/action）と`auth/callback`（loader）を確認。

公開コードからの**処理の対応**：サイトのログインボタン → Better Authの`signIn.social` → 外部OAuth提供者の同意 → サイトの認証callback → `/auth/callback`のログイン後復帰（エラー時`/?error=failed`）。**実際の外部提供者への認可URLとサーバ側callbackの詳細・状態検証・Cookie発行タイミングは、実ログインなしでは確認できない。** 公式ネイティブアプリではなくサイトのブラウザ側フロー。スマホPWAでのブラウザ・WebViewの分岐は未実測。

認証なしで`GET https://mebuki.moe/api/auth/get-session`を実測：HTTP 200、`application/json`、本文`null`、`Set-Cookie`なし。`GET /api/auth/ok`もHTTP 200、本文`{"ok":true}`。`/api/auth/get-session`は現時点でログイン済み利用者情報を返さないことを確認できた。

**セッションのCookie名、Secure/HttpOnly/SameSite/Domain/Path属性、有効期間は未確定。** Better Authの標準的なCookie名を、めぶきの本番設定として推測で転記しない。実ログインは所有者本人の操作が必要なので、ここで停止。

## 2. 読み書きのAPI表面

公開React Routerマニフェスト（130ルート）と公開クライアントJSを分析。以下は**コード存在と公開GET実測の区別**をつけたもの。

| 機能 | 経路 | 方法と証拠 | 確度・制限 |
|---|---|---|---|
| おためしカタログ | `/api/trial/catalog` | **GET実測200**、React Router形式のシリアライズされた公開スレデータ | 匿名利用可能 |
| おためし人気一覧 | `/api/trial/trending` | **GET実測200**、JSONの公開スレデータ | 匿名利用可能 |
| カテゴリ | `/api/thread/categories` | **GET実測200**、JSONのカテゴリ一覧 | 匿名利用可能 |
| 通常カタログ | `/api/catalog` | マニフェストにloader、GET実測200 | **匿名GETはHTMLを返した**。ログイン後のデータ契約未確認 |
| スレ・レス読み込み | `/api/thread/:tslug/messages` | マニフェストにloader。公開フック`use-thread-messages`にGETが実装 | ログイン後のレスポンス形式・権限は未認証で未実証 |
| スレ立て | `/new` | 画面ルートにaction。公開JSに**POST multipart/form-data**の`FormData`送信 | 認証・Turnstile・バリデーション必要。実POST未送信 |
| レス投稿 | `/t/:tslug` | 画面ルートにaction。公開JSに**POST multipart/form-data**、`replyToId`、`showUsername`、`showThreadOwner` | 追加フォームフィールドの全件・サーバ検証は未確認 |
| 添付 | `/api/attachment/:id` | マニフェストにaction | Method/ペイロード未検証。スレ／レス画面のmultipart入力も添付経路 |
| 添付関連の要求 | `/api/attachment/request/:id` | 公開スレJSに**PUT FormData**、`spoiler`、`nsfw`、`gore`、`other` | 添付本体の新規アップロード契約と同一とは限らない |
| レス削除 | `/api/message/:id` | 公開スレJSに**DELETE FormData**、`report`／`category`／`reason` | 認可・成功条件未検証 |
| スレ削除 | `/api/thread/:id` | 公開スレJSに**DELETE** | 権限・成功条件未検証 |

**スレ投稿画面のクライアントコードにはCloudflare Turnstileが組み込まれている。** 自動実行を前提とせず、運用時に必要な本人操作・許可・セッション管理はMUSEの判断対象。無断リクエストやTurnstileの回避は行っていない。

ソースがサーバ側actionであるため、公開JSだけでは入力項目の完全なスキーマ、内部API呼び出し先、画像の保存方式、実際の成功／失敗レスポンスを復元できない。今回の仕様はあくまで**公開クライアントの実際の送信先とルート構造**に限定している。

## 3. おためしモードとログイン状態の違い

公式FAQと公開おためし画面で以下を確認。

| 機能 | おためし（未ログイン） | ログイン後 |
|---|---|---|
| カタログ | 閲覧可能、**5分遅延** | 通常カタログ |
| スレ本文・レス | 不可 | 利用可能 |
| スレ立て・レス投稿 | 不可 | 利用可能（投稿前制限あり） |
| 既読管理・通知 | 不可 | 利用可能 |
| 添付画像投稿 | 不可 | 投稿フォームにmultipart添付（公式FAQ上限あり） |

公式FAQ記載の投稿制約：レス最大5,000文字／100行、添付最大4件・各8MB、スレ題名最大100文字、スレ作成時画像1件、タグ必須（1～10件）。本調査ではログイン後の実投稿による数値検証までは行っていない。

## 4. 確認済み証拠・未解決事項

- **証拠**：[公開HTML・JS・React Routerマニフェストの照合値とルート一覧](gate-evidence/mebuki-public-auth-api-20261122.json)。元配布バンドルはPCのGit管理外`apk-inspection/mebuki-research/`に保持。所有者のCookie・認証データは保存・公開していない。
- 公式資料：[FAQ](https://mebuki.moe/faq)、[おためしカタログ](https://mebuki.moe/trial)、[利用規約](https://mebuki.moe/terms)。
- **未確認**：Cookie名と属性・有効期限、OAuthのプロバイダーから実際に戻るサーバcallback詳細、ログイン後の通常カタログAPI契約、スレ／レス／添付のサーバ側正規リクエストと認可、投稿の成功・失敗レスポンス。
- **MUSE判断待ち**：所有者申告の許可範囲とAPI利用条件、本人によるOAuth認証を実施する段階での取り扱い、Bridge内部で資格情報を保持する場合の保管方式、既存ふたったーUIとの投稿変換設計。

本調査は**公開GETと公開JS静的解析だけ**で完結した。実OAuthログイン、実投稿、既存パッチやBridgeの改修、Release操作は行わない。
