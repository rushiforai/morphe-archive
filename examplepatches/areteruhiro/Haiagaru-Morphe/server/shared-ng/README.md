# Online shared NG — in development

オンライン共有NGは開発中です。アプリの現行仕様と検証範囲は
[実装・検証記録](../../docs/shared-ng-review-implementation.md)を参照してください。

個人NGは同意後に収集し、保存イベントから変更分を送信します。GASはInboxで審査し、
承認済みの条件だけを直接配信します。細かな板名や有効期間は送らず、親掲示板の区分を利用します。
NGワードは空白を除いて5文字以上とし、英字だけの条件は除外します。
アプリ側では必要な報告数・掲示板・種類・個別除外を設定できます。

管理用GASソース・配備情報・実データは今回のアプリReleaseへ追加しません。
下記のCode.jsプロトタイプは過去の参照用で、現行の受付・審査・配信方式とは異なります。

---

# Online shared NG — isolated prototype

Not deployed. Android standard NG hooks and UI are NOT connected yet. No automatic
upload occurs. Existing dirty Android changes on this branch predate this feature.

## GAS setup (manual, limited trial only)

Copy Code.js to a new GAS V8 project. Set Script Properties:

- SPREADSHEET_ID: private spreadsheet ID.
- CLIENTS_JSON: `{"trial-001":{"tokenHash":"<SHA256 of a cryptographically random token>","disabled":false,"reviewOnly":true}}`
- RULES_JSON: `[{"term":"死ね","weight":2},{"term":"氏ね","weight":1},{"term":"消えろ","weight":1},{"term":"くたばれ","weight":2},{"term":"殺すぞ","weight":2},{"term":"黙れ","weight":1}]`

Generate tokens with a password manager / secure random generator. Never put actual
tokens in Git, URLs, logs, or the spreadsheet. Provision client IDs manually using
ASCII letters, numbers and hyphens. Keep new clients reviewOnly until reviewed.
Run setupSharedNg once. Deploy as owner only after a private test; sheet remains
private. POST is authenticated, GET intentionally publishes approved aggregate targets.
Android must follow GAS ContentService redirects and inspect JSON `ok`, not HTTP alone.

POST: `{version:1,action:"report",reporterId,token,reports:[{reportId,service,site,board,date,type,value,body?}]}`.
Use UUID report IDs. Persist retries with the same ID. `ack` acknowledges accepted or
duplicate reports. Max 20 reports / 64KiB per batch, 200 new targets per reporter UTC day.
Do not send body without explicit opt-in. Shared imports MUST NOT generate reports.

GET: `?service=edge&site=bbs.eddibb.cc&board=liveedge&revision=<previous>`.
Changed response is a full replacement for that exact scope, not an append delta.
Unchanged response omits entries. Cache locally; suggested polling 6h with jitter.
On error retain last valid snapshot. Expire entries locally even when offline.
MinLevel 1=minimal, 2=weak, 3=standard, 4=strong, 5=hard; apply entries where
minLevel <= chosen level. Keep personal allowlists and type toggles on the client.

## Word research and initial editorial seed (2026-10-22)

There is no verified official universal "5ch inappropriate word list". Above terms
are OUR provisional editorial candidates, not an official/legal classification.
Quoted warnings, fictional dialogue and discussions can match: words only add at
most two points, never promote one reporter beyond hard. This is not context-aware.
No list based on protected identity, political belief or diagnosis is included.

Neutral slang `草`, `w`, `www`, `乙`, `ワロタ`, `kwsk`, `今北産業`, `ROM` has zero
weight. Do not classify Internet slang itself as abuse. Broad ambiguous insults
are excluded from initial seed pending false-positive review.

Research references:
- https://www.saferinternet.or.jp/bullying/ (handling harmful posts / evidence)
- https://www.moj.go.jp/content/001448892.pdf (expression and online defamation)
- https://www.city.otsu.lg.jp/material/files/group/225/nettomanyuarunettoyougosyuu.pdf (Internet terminology; laughter-related slang)

These references guide caution; they do not endorse the chosen terms or weights.
The seed above is public. Actual operational rules may be changed in private GAS
properties and are never returned by API; secrecy cannot prevent inference.

## Limits / unfinished

- Node tests cover pure policy only, not GAS persistence, HTTP, authentication or devices.
- Every request scans sheet history: limited trial, not public-scale production.
- No historical body retention cleanup, token rotation UI, withdrawal, posting proof,
  diff journal, server cache, flood protection before GAS invocation, or admin UI yet.
- Disabling a client excludes past votes on next GET; already downloaded clients
  see the change on their next refresh. Not an instant remote deletion guarantee.
- ID expiry currently UTC date + 48h, all types alike: provisional, must align with
  board-specific identity lifetime/timezone before production. Host moves are not merged.
- Header/row schema should not be changed manually. Reject malformed input; body is
  stored inside JSON, not interpreted as a spreadsheet formula.
- No automatic deployment to the user-provided project or writes to their sheet.

Run local policy tests: `node server/shared-ng/Code.test.cjs`.
