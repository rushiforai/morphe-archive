# 登録スレ新着通知の実機確認

2026-11-03 JST、ADB serial `730eae72` / XIG05、ChMate 0.8.10.191 dev、package `jp.co.airfrt.android.chMate.haiagartu` をread-onlyで確認。Haiagaruの正確なビルド版は今回未照合。

登録1件・確認間隔1分。対象スレの `haiagaru_thread_updates` 通知（ID1214840881、対象URL tag）がAndroid NotificationManager内に存在。POST_NOTIFICATIONS許可済み、当該channel importance=3で非ブロック。登録の保存済み高水位98件。JobScheduler履歴にThreadWatchServiceの実行開始・app called jobFinishedでの完了があり、同Jobが次回分として永続単発・minimum latency60秒で予約されている。合成通知/強制Job/投稿なしで既存の実通知が届いていることを確認した。

ただし観測時はstandby bucket RARE、未充足条件CONNECTIVITYおよびWITHIN_QUOTAで、設定時刻を過ぎても待機。従って「1分ごとに確実に届く」とは判定しない。Android側の通信条件とバックグラウンドJob実行枠により遅れる。画面消灯後・再起動後・アプリプロセス消失後の長時間連続試験、新たな投稿を待っての新規通知発火、通知タップは今回未実施。既存通知の初回発火時刻/通知本文は取得していない。

登録/既読高水位/間隔/通知権限/電池設定/standby bucket/既存通知は変更なし。通常アプリの導入/削除・Frida hookなし。証跡 `build/thread-watch-real-device-verification-20261103.json` と対象Job抜粋 `build/thread-watch-phone-target-job.txt`。APKとコードの変更なし。
