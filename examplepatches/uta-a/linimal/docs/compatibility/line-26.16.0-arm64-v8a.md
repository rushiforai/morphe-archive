# LINE 26.16.0 arm64-v8a 互換性契約

## 許可する入力

Linimal v1 は次だけを許可します。

- `jp.naver.line.android`
- versionName `26.16.0`、versionCode `261600106`
- minSdk 32、targetSdk 36
- SHA-256 が `reference/line-26.16.0-arm64-v8a.json` と完全一致する APKM

base APK、`split_config.arm64_v8a.apk`、および 6 種すべての density split は必須です。base manifest の `requiredSplitTypes` は `base__abi,base__density` でなければなりません。APKM の全 split（armeabi-v7a を含む）は原本契約の SHA-256 で検証します。arm64-v8a 以外をパッチ対象として許可するものではありません。

## 成立性ゲート

preflight の成功は入力同一性と元署名を確認するだけであり、変更後アプリの成立を意味しません。no-op/probe patch の後、arm64 実機で同一鍵による split 一式の再署名・install・起動を確認し、少なくともログイン、session restore、送受信、通知、deep link、音声/ビデオ通話、native library load、process death と再起動を公式版と比較します。

署名または integrity 検査が主要機能を妨げた場合、回避を暗黙に追加せず go/no-go とします。別 versionCode、`version = null`、armeabi-v7a のみの入力、将来版は v1 で拒否します。

## 26.11.0 からの主な変更点

- Kotlin 標準ライブラリと Compose runtime も難読化された（Unit は `Lvs8/i0;`）。同じ短いクラス名は別物の可能性が高く、名前の一致を根拠にしない。
- density split から `xxxhdpi` がなくなり 6 種になった。base は 14 DEX、arm64 split は 73 native library。証明書 lineage と Source Stamp は同じ。
- 設定項目モデルの constructor は 14 引数になった。
- 公式の手動既読 executor はメッセージ送信やリアクションとも共用になったため、「既読にする」ボタンの呼び出しだけを手動経路として扱う。
- 入力欄の Agent i は Compose の chip bar に統合され、画像メッセージ横に LINE AI のボタンが増えた。
- チャット画面は `adjustNothing` の edge-to-edge で、LINE が IME の高さを自前で処理する。一覧の追従は最終 item が可視のときだけ行われる。

## 未対応の入口と既知の制限

- 入力中の `@` 候補に出る Agent i は抑制しない。
- GlobalHome の最近の履歴と MatomeCarousel は対象外。
- 未解析の経路: `wk8/a0` の read_up 系更新、OpenChat と AI キャラクターの既読。
- 途中のメッセージまでの既読は提供しない。`lastMessageId` に途中の位置を送っても、相手の公式 Web 版 LINE では全行に既読が付いた。
- 全体既読の実行中に回転が重なると、まれに結果のトーストが出ない。既読の状態は正しく終了する。
