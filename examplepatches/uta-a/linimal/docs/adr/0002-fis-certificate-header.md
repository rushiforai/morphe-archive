# ADR 0002: push 通知の登録で公式証明書の SHA-1 を送る

- 状態: 採用
- 日付: 2026-09-21
- 関連: [ADR 0001](0001-reference-and-signing-policy.md) 決定 4、[互換性](../compatibility/line-26.16.0-arm64-v8a.md)

## 背景

再署名した LINE では、アプリを閉じている間に push 通知が届かない。LINE に同梱された Firebase Installations (FIS) SDK は、アプリ自身の署名から SHA-1 を計算して `X-Android-Cert` ヘッダーに載せる。Google 側の API key は公式 LINE の証明書にしか許可されていないため、FIS の登録が `BAD CONFIG` で拒否され、FCM token を取得できない。

ADR 0001 は「再署名は公式署名または integrity 検査を回避する目的ではない」とし、互換性文書は署名検査が主要機能を妨げた場合に「回避を暗黙に追加せず go/no-go とする」としている。通知は主要機能であり、この問題はその go/no-go の判断に当たる。

検討した選択肢:

| 方式 | 評価 |
| --- | --- |
| LSPatch の signature bypass | アプリのプロセス内だけを偽装する。LSPatch を使う LINE 向けモジュールでも、アプリを閉じていると通知が届かない問題が未解決のまま報告されている。見込みが低い |
| MicroG-RE（GmsCore support） | GMS への参照をすべて MicroG-RE へ向け、元のパッケージ名と署名を meta-data で申告する。利用者に別アプリの導入と Google アカウントの追加を求め、MicroG-RE 側が任意のアプリに対応しているかも確認できていない。Linimal だけでは完結しない |
| root の Mount install | 署名が変わらないため問題自体が起きない。root が前提で、Linimal の配布形態とは別物 |
| FIS の `X-Android-Cert` だけを置き換える | 変更は LINE 内の 1 メソッドの 1 引数で済み、端末本体の Google Play services だけで動く。第三者の Morphe パッチ集が同じ方式を採っている |

## 決定

1. 再署名で失われた push 通知の登録を戻す目的に限り、FIS が送る `X-Android-Cert` の値を公式 LINE の証明書 SHA-1 に置き換えることを認める。ADR 0001 決定 4 の例外として扱う。
2. 対象は FIS の接続生成メソッドにある `addRequestProperty("X-Android-Cert", value)` の value だけとする。GMS、`PackageManager` の署名情報、Remote Config など FIS 以外の Firebase client、LINE の認証・LEGY・その他の通信は変更しない。
3. 送る値は公開鍵の識別子である証明書 SHA-1 に限る。元の署名鍵は取得・保存・利用しない（ADR 0001 決定 4 のとおり）。
4. 値は patch 側の定数 `Constants.LINE_ORIGINAL_CERTIFICATE_SHA1` の 1 か所で管理し、reference APKM に対する `apksigner verify --print-certs` の出力から写す。定数が空、または形式が不正なら patch は LINE を変更せず、patch status に `DISABLED` を記録する。
5. runtime 設定「アプリを閉じていても通知を受け取る」で切り替え、既定値は ON とする。Firebase は ContentProvider から LINE の Application 初期化より前に動き出すため、hook は設定が未初期化ならその場で初期化してから判定する（2026-09-22 改訂）。OFF、初期化できない、例外時は hook が実際の値をそのまま返す。
6. 次のいずれかに当たる場合は変更せず、ERROR / TARGET_NOT_FOUND を記録する: fingerprint が一意に定まらない、キーの register が `X-Android-Cert` のまま呼び出しに渡ることを確認できない、値の register が接続やキーと同じ、キーの `const-string` の直後から呼び出しまでに分岐先か例外 handler の先頭がある。値の出どころは問わない。元の呼び出しが値を String として受け取るため、verifier が呼び出しの時点で String か null であることを保証する。LINE 26.11.0 では値が SHA-1・null・例外時の null の 3 経路からキーの `const-string` で合流するため、当初の「値が String を返す呼び出しの結果であること」「キーと値を作ってからの区間に合流点がないこと」という条件では適用できなかった（2026-09-22 改訂）。

## 結果

- 再署名版でも、アプリを閉じている間の通知を公式版と同じ経路（端末本体の Google Play services と FCM）で受け取れる。SDK 36 の端末で確認した（下記）。
- アプリの身元の申告を Google の API key 制限に対して偽ることになる。Firebase や LINE の利用規約に抵触する可能性があり、Google が検証を強めれば効かなくなる。README にその旨を明記する。
- 公式証明書は v3 の鍵ローテーションで 2 つある（SDK 24–32 と SDK 33 以上）。まず lineage の root を送る。SDK 33 以上の端末で登録が拒否される場合は、端末の SDK で値を選ぶよう見直す。

## 実機検証（2026-09-22）

SDK 36 の端末（Google Play services あり）で、Linimal を当てた LINE 26.11.0 を確認した。

- 当初の実装は、安全確認が LINE 26.11.0 の命令の形に合わず、`FisCertificateHeaderShapeMismatch` で書き換えていなかった。決定 6 を改訂して適用できるようにした。
- 一時的な診断ログで、起動時に hook が呼ばれ、設定 ON で値を公式証明書の SHA-1（v3 lineage の root）に置き換えたことを確認した。
- 最近のアプリ一覧からスワイプして LINE のプロセスを終了させ、別のアカウントからメッセージを送ると、端末本体の Google Play services が LINE 宛ての FCM メッセージを受け取り、`FirebaseInstanceIdReceiver` で LINE のプロセスが起動した。通知が表示され、タップでトークが開いた。修正前の APK では、LINE 宛ての配信は 1 件もなかった。
- SDK 33 以上の端末でも、lineage の root の SHA-1 で登録が通った。
- 新規インストールの直後など、FIS の登録が Linimal の設定の初期化より先に走ると、hook は元の値を送り、登録が拒否されていた（診断ログで `health=ERROR` を 3 回確認）。同じプロセス内での再試行はなかった。決定 5 を改訂し、hook がその場で設定を初期化するようにした。ただし改訂後の実機確認では、Linimal の通常の初期化が先に終わっており、その場での初期化が働く場面そのものはまだ観測していない。
- SDK 33 以上の signer の SHA-1（`6A2927D9…67BD`）でも、FIS の登録と通知は通った。ただし同じ値で MicroG-RE 経由のトークの復元が失敗した（ADR 0003）ため、定数は lineage の root のままとする。

## 未確認事項

- hook がその場で設定を初期化する経路の実機での動作（単体テストのみ）。
- ログイン状態の長期的な維持と、公式版との差がないこと。
- SDK 32 以下の端末。
