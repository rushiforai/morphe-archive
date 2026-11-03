# 通知間隔の1分対応と日・時間・分の入力

利用者の追加指定により、通知間隔を1分〜7日に拡張。初期値は15分のまま。日・時間・分の3欄で合計時間を指定でき、使わない欄は0または空欄にできる。例：1日2時間、30分。既存の整数分の保存形式を維持し、1440分は1日0時間0分へ、24時間の入力は保存後に1日へ正規化して表示する。説明・保存完了メッセージも「1日」「2日3時間4分」等で表示する。

## 予約方式

- 1〜14分：永続化した単発Jobにminimum latencyを設定し、確認終了後に次のJobを予約する。処理中の重複起動を作らない。
- 15分以上：従来の永続化した定期Job。終了時に新しい定期Jobを作り直さない。
- 設定値と方式をJobのextrasへ記録し、間隔・方式の変更時だけ置換。同じ設定での通常のscheduleは重複登録しない。最後の登録解除後は再予約しない。
- Job終了の通知と次回予約はmain handlerへ返し、onStopJob/onDestroyや新しい実行で無効になった古いworkerからは再予約しない。
- Androidの省電力・Job実行回数制限・通信条件に従う。1分に設定できることと、閉じている間に正確に60秒ごとに動作することは別。画面にも遅延の可能性を表示し、特に15分未満は設定どおりの頻度を保証しない。

Foreground service、exact alarm、常駐通知の追加はない。ネイティブpatch hook・manifestは今回変更していない。

## 検証

- 通常Lint/R8ビルド `build/thread-watch-units-completion-build.log` 成功3m18s。
- 最終MPP `build/thread-watch-units-final.mpp` SHA256 `7c7b2a4817566995a113bb06c79ccb9ff7ef5fab0a0c8f98f3dce0b1849c946a`。
- 242 APKをemulator-5580の隔離package `jp.co.airfront.android.a2chMate.haiagaru.migration191242` へ署名一致更新。APK SHA256 `e17bda3f32f90e499eab5f278ba6896ac6ba15207b74078c426a6205a619db16`。共通Java処理を242で検証し、今回の新処理の191/226実画面試験は未実施。
- `thread-watch-one-minute-runtime.js` 33項目成功。実JobSchedulerに対し、1/2/14分の単発Job、15/30/10080分の定期Job、永続化、重複抑止、短いJobのみ再予約、解除後の再作成防止、初期値15分を確認。合成fixtureで外部接続なし。
- `thread-watch-units-ui-runtime.js` 18項目成功。1分、1日、2日3時間4分、24時間、7日の保存と正規化した再表示。0分、7日超、整数オーバーフローの拒否と既存設定保持。テスト後は元の設定へ復元。
- 背面状態で合成20件→22件をJobSchedulerから強制実行。初回非通知→1通知、workerはmain以外、schedule呼出しは初期1回→終了後2回→次の終了後3回で次回予約を確認。これは実際に1分待った実頻度試験ではない。`build/thread-watch-short-background.log`。
- 実レンダリングされたUIで日・時間・分の3入力と1/0/0の表示を確認。`build/watch-units-final-ui.xml` / `.png`。Composeのvirtual EditTextをnative View走査で取得できない最初のハーネス失敗は、元のbound model参照とCompose反映待ちへ修正し再実施。旧失敗を成功に含めない。
- 検証用登録・Job・通知は終了時に解除、間隔は元へ復元。対象PID3503のcrash bufferに新規fatalなし。投稿・共有NG送信なし。

現在の `codex/random-user-agent-5s` ブランチ上で作業したため、生成MPPには既存のランダムUA実験（初期OFF）が含まれる。実験コードや設定値は今回変更していない。公式Release/feed/GAS更新なし。

後続の利用者指定でランダムUA実験を削除し、固定テンプレートへ戻した。固定クラス一覧版MPP（`class-bindings-fixed3.mpp`）で191/226/242の通知Job各33・日時間分UI各18項目を再確認済み。前記の「実験を含む」は中間候補の記録であり、最終公開候補には含まれない。242のUI検証ではComposeへの反映待ちを150msから600msへ延ばしたハーネスで成功を確認。OSの省電力による実行遅延の制約は同じ。
