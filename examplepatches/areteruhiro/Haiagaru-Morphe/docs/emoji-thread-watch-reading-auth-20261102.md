# 検索入力・新着通知・エッヂ閲覧認証

対象は191/226/242。公式配布物・GASは変更していない。

## 実装

- 絵文字の定期走査ではEditTextのEditableを置換せず、自前の字体spanだけを更新する。入力内容・選択・IME composing状態を保持。242等のnative setText境界にも対象Viewを渡し、EditTextのテキスト加工を除外する。既存の5chドメイン文字列処理は維持。static setText命令は対象外。
- スレタイトルの標準メニューに通知登録・解除を追加。標準スレツールバーにも選択可能な「このスレの新着通知」を追加。初期未登録、最大100件。
- JobScheduler/JobServiceで端末内の定期取得を行う。初期15分。11/03の追加指定で「確認間隔を変更」から日・時間・分で合計1分〜7日を指定できるよう拡張。全登録スレに共通。15分未満は終了後に単発Jobを再予約し、それ以上は定期Jobを使用。Jobは永続化し、間隔変更時は登録し直す。最後の解除で取り消す。詳細はthread-watch-short-intervals-20261103.md。
- 板ごとにsubject.txtをまとめて取得する。初回は基準レス数のみ保存し、増加だけ通知。レス数減少・消失・HTML認証ページ・通信失敗で基準を消費しない。登録tokenを照合し、解除→再登録の古い通信結果を反映しない。通知拒否時は未通知分の基準を進めない。
- 即時のサーバープッシュではない。Androidの省電力・通信制約により指定間隔より遅れることがある。
- エッヂのタイトルメニューに「エッヂの閲覧認証」。投稿認証のauth-codeとは別に、正規のスレページをWebViewで開く。サイト上の操作後、cf_clearanceがある場合だけ閲覧連携を有効化。閲覧GET/HEADの同一hostに限りブラウザUAを正確に使用し、cf_clearanceだけをnative Cookieへ追加。SessionID等のブラウザ側投稿IDを追加しない。連携解除も用意。
- WebView側の認証を自動突破する処理はない。UAとCookieを合わせてもサイト側のTLS/IP条件でnative取得が拒否され得る。実VPNと実際のCloudflare challengeの成功は未確認。画面内での閲覧経路を保持する。

## 検証

- 通常Lint/R8ビルド成功。最終メニュー配置の再ビルドも成功（`build/emoji-watch-auth-footer-build.log`）。
- `ThreadWatchRulesTest` 20項目。URL・subject・不正/HTML応答・初回/増分/減少を確認。
- interval版の実APKを隔離packageへ署名一致で導入。191/226/242各53項目：間隔17/30/60/1440/10080分、永続ジョブ、板ごとのまとめ取得、初回非通知、増分通知、重複抑止、減少/HTML/中止/再登録、解除、all/missingのEditable同一性・選択・composing span、タイトルの元View保持。
- 242の実スレ内検索欄 `o.zzbfy` でnative InputConnectionからASCII・日本語・絵文字を入力し、各800ms後の検索処理と絵文字再走査後も末尾カーソルを維持（4項目）。APKパッチ時emojiMode=all。
- 背面状態でJobSchedulerを強制実行：合成20件では非通知、22件で1通知。workerはmain以外。実際に15分待った試験とはしない。fixture設定・ジョブ・通知は終了時に解除。
- 初期のruntime失敗は、JobSchedulerの同時実行、FridaのEditText overload/CharSequence文字列化、PackageInfoフィールドの取得方法によるハーネス側の問題を修正して再試験。失敗を成功扱いしない。
- 242 native142個の絵文字境界について元のテキストconsumerとreceiver/引数/結果registerを検査。191/226にはこのsetText bridge自体がないため、絵文字走査とタイトルhookを検査する。native counterは既存MediaViewerNavigation.setNativeCounter wrapperをconsumerとして確認。
- 実タイトルUIで初期の追加ボタンがfull-window Composeシートの外へ出ることを発見。単体wrap試験だけで見た目の成功とは扱わず、native contentを上、追加操作を下へ変更。最終APKでの再確認は追記する。

隔離packageは `jp.co.airfront.android.a2chMate.haiagaru.migration191242`、ADBはemulator-5580。実機・通常package・投稿・NG送信は変更しない。導入パス・hashはandroid-installations.mdへ記録する。

## 2026-11-03 再開後の最終確認

中断前のmodal版3APKが全てCLI成功していたことを再確認。同AVDをデータ保持で起動して署名一致のinstall-rを実施。最新のソースブランチには別作業のランダムUA実験が入っているため、ここではその実験を含まない中断前のmodal候補を検証した。ブランチや実験設定は変更していない。

- 最終MPP `build/emoji-watch-auth-modal.mpp` SHA256 `379925b38ff3d1a1cb789d3ad194707b40a992f14ecd4ed08a9bef608fadfccb`。通常ビルド `build/emoji-watch-auth-modal-build.log` 成功5m56s。
- 最終APKで191は53、226/242は各54項目成功。新しい別windowの装飾も検査。テストの偽FragmentがJavaへ返すActivity/View/BundleをFridaが解放する問題は、検証用参照のretainとDialog生成順序を修正。実装の不具合や成功項目に混同しない。
- 242/226の実タイトルメニューで「このスレの新着通知」が同じ操作可能なwindowの下部に現れることを確認（watch-modal-menu.xml / watch-modal226-menu.xml）。最初のfooter版は別windowの背面に隠れていたため、成功版として扱わない。
- 242で実メニューボタン→通知画面→確認間隔を変更→17分を入力→保存を操作し、保存値17を確認。最後に初期値へ復元。`build/watch-ui-interval-save.log`。
- エッヂの正規スレURLから閲覧認証Activityの表示・HTTPSホスト表示・閲覧専用説明と解除ボタンを確認（watch-edge-auth-ready.xml）。反映ボタンの操作による実Cloudflare認証成功、VPN経由でのnative DAT取得成功は未確認。
- Cookie/UA連携は合成cf_clearanceで6項目成功。閲覧GETの正確なUA、他host/POSTの除外、native識別Cookie保持、解除を検査。隔離アプリの合成Cookieは削除。外部接続を用いたCookie試験ではない。
- native DEX検査は191/226/242のタイトルhook各1、Dialog onStart追加0/2/1、242のテキスト境界142。super呼出し・元のreturn・receiver/引数/結果registerを確認。JobServiceのBIND_JOB_SERVICE/非公開指定・起動後維持の権限もAPKで確認。
- 冷起動時にbootanimationのSIGABRTとSystem UIの応答停止があった。対象アプリのクラッシュとは区別し、System UIのWait後に操作を再開。null rootのdumpを画面確認成功として数えない。

公式Release、feed、GASは更新していない。端末の検証アプリへ導入済みであることと公開済みであることは区別する。1.12と1.18.3の実スレ速度の根因は未確定のまま保持する。

実機導入の追加依頼により、Mi Note 10/Android11の既存検証用242へ同じmodal候補を適用。署名・実APK hash・PID起動を確認。導入台帳に記録。実機向け作成時のメモリ確保のため検証AVDを停止した際、残っていた旧コマンドが再開し、同名の242 runtimeログをdevice-not-foundで上書きした。54項目成功は停止前のRPC戻り値で確認済みであり、停止後の再実行失敗を成功とは扱わない。実UI・17分保存・他版のruntimeログも別途保持している。
