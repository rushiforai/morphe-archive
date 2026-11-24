# futatabi 書き込みフロー：実装段階1の契約検証（2026-11-23）

## 結論

- **PKCE redirectUri：PASS（承認要求作成の受付のみ）**。`POST https://api.nijiurachan.net/app-authorizations` に指定の `http://127.0.0.1:18765/ext/login/aimoge/callback` を設定して **HTTP 201 Created** を確認。
- **presign：OpenAPI契約確認のみ。実呼び出し・アップロード方式の実測は未実施（要本人資格情報）**。
- 認証URLへのアクセス、OAuth/PKCE承認、`POST /app-credentials`、資格情報発行、実サイト投稿、Bridge・UI実装は**一切実施していない**。

## PKCEの検証内容

実行日：2026-11-23 JST。呼び出しは **1回だけ**。

| 項目 | 実測内容 |
| --- | --- |
| エンドポイント | `POST https://api.nijiurachan.net/app-authorizations` |
| 必須ヘッダー | `X-Board-Key: aimg`、`X-Api-Version: 2026-11-11`、`Content-Type: application/json` |
| redirectUri | `http://127.0.0.1:18765/ext/login/aimoge/callback` |
| 本文 | 一時生成したUUID `installationId`、ランダム `state`、PKCE `codeChallenge`、`codeChallengeMethod: S256` とredirectUri。すべてOpenAPIの形式に適合 |
| 応答ステータス | **201 Created** |
| 応答フィールド | `id`、`expiresAt`、`authorizationUrl` の存在・型を確認 |
| 承認・資格情報発行 | **実施せず**（authorizationUrlは開かず、code交換もしない） |

実際の `authorizationUrl`、`id`、一時的なPKCE検証値や状態値は記録・公開しない。**201はredirectUriが承認要求の作成段階で受理されたことだけを示す**。ブラウザからループバックへ戻れるか、コールバックをBridgeが受けられるか、code交換が成功するかは未検証。別方式への切り替えは不要だが、フロー全体の成功を意味しない。

## MUSE検収に基づく訂正・補足（2026-11-23）

MUSEも実APIで `X-Board-Key: aimg` とOpenAPIに適合するPKCE各項目を指定し、同じloopback `redirectUri` の `POST /app-authorizations` に対して **HTTP 201** と `authorizationUrl` を確認した。僕の先行試行も201であり、報告上「僕の401」とする記述は実測記録と一致しない。201が示すのは承認要求作成時の受付のみで、承認・code交換は未実施。

MUSE確認のpresign契約は、**リクエスト必須 `sha256`（小文字hex）・`mime`・`sizeBytes`、任意 `fileName`**、必須ヘッダー `x-aimg-token`・`X-Board-Key`。**レスポンス `attachmentId`・`uploadUrl`（presigned PUT URL、重複時null）・`reused`**。アップロードは返却URLへの **PUT**。`filename` / `contentType` / `size` や `uploadMethod` / `uploadHeaders` / `expiresAt` を本APIのフィールドと扱わない（本ファイルの初回報告にもこれらの誤フィールドは書かれていない）。認証済み実呼出しは未実施、要本人資格情報。

## presignの仕様確認

参照：`https://api.nijiurachan.net/openapi.json`（`info.version=2026-11-11`）、`POST /attachments/presign`。

- **認証条件**：`security: [{aimgToken: []}]`。必須ヘッダーは `x-aimg-token`（本人資格情報）および `x-board-key`。認証のない実呼び出しはしない。
- **本文**：`application/json`、`PresignBody`。必須 `sha256`（小文字16進64桁）、`mime`、`sizeBytes`（0より大きい整数）。任意 `fileName`、`source`（`file` / `paste` / `oekaki`）、`storageFallback`、`storageFallbackFromAttachmentId`。
- **正常応答**：HTTP 200 `PresignResult`。必須 `attachmentId`（UUID）、`uploadUrl`（URI または null）、`reused`（boolean）。`uploadUrl`はAPIの説明上 **presigned PUT URL**。`reused=true`の場合などアップロード不要なら `uploadUrl=null` となり得る。
- **異常系（仕様）**：400、401、403、404、422。OpenAPIにある契約であり、現物の投稿成功・画像転送成功を示さない。
- **未実証**：実際のアップロードURLのホスト・有効期間・リクエストヘッダー、アップロード本文形式、成功時ステータス、画像添付後の投稿との一連の動作。これらは**要本人資格情報**。本フェーズでは推測で埋めず、添付の実装へ進まない。

## 停止地点

[確定設計](write-flow-design-20261123.md)の**「実装の段階」1番のみ**に対応。段階2以降のBridge `/ext/*`、拡張ホーム・ログインUI、あにまんアダプタ、APKビルド、Releaseは未着手。MUSEの検収・次指示を待つ。
