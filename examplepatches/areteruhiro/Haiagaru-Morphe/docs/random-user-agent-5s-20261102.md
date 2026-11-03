# 5秒ごとのランダムUA（実験ブランチ）

利用者指定でdevのf2b2b45と進行中の変更を引き継いで `codex/random-user-agent-5s` を作成。既存の検索入力・通知・閲覧認証の作業を破棄していない。

Haiagaru設定 → **通信・詳しい設定** → **閲覧・書き込みのUAを5秒ごとにランダム変更（実験用）** を追加。初期OFF。固定UA設定とは独立してONにでき、ONのときは固定UAや閲覧セッションのUA選択より優先する。設定エクスポート・インポートの対象にも登録。

端末のelapsedRealtimeを5000msの区間に分け、プロセス内では同じ区間に同じUAを使用。次の観測区間では直前と異なるUAを5種類からランダム選択する。Android 14/15/16のDalvik、Chrome Mobile、Firefox Mobile。通信のない時間にタイマー・スレッド・通信・スリープ解除を発生させない。準備済みのリクエストと認証WebViewを途中から書き換えない。ChMateが付けるクライアント名・版番号は既存のUAブリッジどおり保持する。

閲覧だけでなくPOSTの書き込みにも適用するという追加指示を反映。Cookie・送信先・HTTPメソッド・本文を変更する機能ではない。認証CookieとUAが結び付いている場合、ランダム切替によって認証が維持できなくなることはあり得る。VPNやCloudflare認証が成功することを検証した機能ではない。

## 検証・導入

- `RandomUserAgentRotationTest` 2500項目成功。同一5秒区間の安定、区間変更後の非反復、有効なUA、5種類すべての選択を確認。
- 通常Lint/R8ビルド `build/random-ua-5s-build.log` 成功4分20秒。191へのCLIパッチ・署名成功。
- 実機XIG05（Android15、serial `730eae72`）へ別package `jp.co.airfront.android.a2chMate.haiagaru.randomua191`、表示名 `Haiagaru UA切替191` としてinstall Success。既存packageを置換・削除していない。
- 実際に導入したAPKをapp_processのクラスパスに載せ、メモリ内の検証用SharedPreferencesで12項目成功（`RandomUserAgentAndroidTest` / `build/random-ua-191-android-runtime.log`）。191 native requestのPOSTヘッダー、java.netのPOSTヘッダー、GET/POSTの同一区間共有、5秒後の変更、準備済みリクエスト保持、Cookie/Content-Type/URL/メソッド維持、OFF復帰。実際の接続・投稿は0件。端末のアプリ設定を書き換える試験ではなく、利用者は設定でONにする必要がある。
- 使用した検証DEXは `/data/local/tmp/haiagaru-random-ua-test.dex` だけで、終了後に削除。root・Fridaを使わず検証。導入済みAPKのSHA256と生成APKの一致を確認。対象アプリPIDのcrash buffer空。
- テストソース初回のProxy型の曖昧さを完全修飾名に修正して再コンパイル。初回のテストコンパイル失敗を成功として数えない。

APK `build/random-ua-5s-191.apk` SHA256 `ba85f59794a9a7ef6acd5d0cba58abd476ec92ad7a6261cf6cd078723fe4063b`。
MPP `build/random-ua-5s.mpp` SHA256 `67a5c1856f26abc3acca572eb339bfce93ed5745810e9e20a41e9b6a888cd8f9`。
署名・鍵・導入情報は `docs/android-installations.md` と `build/random-ua-191-install.json`。
公式Release・配布feed・GASは変更していない。
