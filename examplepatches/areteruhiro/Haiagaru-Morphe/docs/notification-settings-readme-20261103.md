# 通知内容・設定入口・READMEの更新

## 実装

登録スレの通知をスレ名＋新着件数＋新着本文最大3件（各300コードポイント）へ変更。subject.txtの同板共用を維持し、新着があるスレだけDATを取得する。4MiBの既存上限、worker実行、取消しと登録token照合を維持。本文が取得できないときも件数通知を行う。HTMLタグ除去と改行/制御文字の整理、絵文字を壊さない省略。画像・動画は通知のためには取得しない。通知のsmall iconはインストール先のApplicationInfo.icon、large iconは同アイコンのBitmap。カスタムアイコンのある別packageではそのアイコンになる。

ChMate標準SettingActivityの既存onResumeフックを維持し、浮動PopupWindowを廃止。android.R.id.contentのFrameLayoutへ最上部の入口を追加し、既存childのmarginで領域を確保。native/Compose viewはdetach・再parentしない。system bar insetsへ対応、初回後のonResumeはタグで重複防止。標準画面のスクロール状態と設定値を保持し、既存のHaiagaru設定ルーティングを使う。nativeパッチ・レジスターへの追加変更なし。

README全体を現行仕様と照合。固定の1.11.2最新版案内、公開済み機能の古い公開前表記、固定1.8.9成果物名、一律1024MB指定、競合時の一般的な全消去手順を除去。導入・更新/署名条件/追加ファイル/9カテゴリ/機能案内/通知/DAT/開発中表記/配布元/ビルドを整理。寄付・謝辞・Creditは維持。リンク先の使い方・設定ナビ・カテゴリ・Compose説明・機能スイッチを現在の名称へ合わせ、通知のユーザー向け文書を追加。ローカル参照57件に欠落なし。

## 最終候補の検証

通常Lint/R8 build `build/notification-settings-top-final-build.log` 成功3m52s。前段の下部配置から上部配置へ利用者指定で変更、最終候補は上部配置のbuild。MPP `build/notification-inline-final-fix.mpp` SHA256 `60a554a4384e7611f3bfcafe5f8bdf03509f70e2524f9d5ea8dd012c02e0d2d0`。

hostのThreadWatchRulesTest30項目成功。emulator-5580 / Android16の既存隔離bindings191/226/242へ署名一致install-r。各通知17項目（初回非通知、新着本文/件数/title HTML除去、旧レス除外、3件制限、同板共用・新着のない回のDAT非取得、アイコン、PendingIntent存在、本文失敗fallback、取消し、絵文字省略）成功。各設定入口15項目（最上部、標準content保持、重なりなし、重複なし、遷移・戻り）成功。

242はHome背面でJobSchedulerを2回強制実行し、合成20→22レスで初回非通知→本文21/22付き通知1件、workerがmain以外、終了後に次回単発Jobを再予約することを確認。実HTTP0、実投稿0。Android NotificationManagerに登録された通知の内容・icon resource・large iconを検査した。スクリーンショットの通知shade展開はHOMEのままで通知カードを写せなかったため、通知カードの実レンダリング確認には使わない。標準設定の実画面191/226/242はXML/PNGで確認。

初期のエミュレータSystem UI/Pixel Launcher ANR中の画面確認、FridaのViewParent/Object参照の型不足、pause/resume間のActivity nullを考慮しないテスト、起動済みFrida daemonの二重起動によるハーネス失敗は成功扱いしない。ANR表示終了後、型と待機判定を直して最終候補を再確認。191/226の戻り操作では初回案内の取消しを含む2/3回、242は1回。共有NGに同意・送信する操作はしない。

利用者の「今回本文・画像・GIF・動画には触れていない」との指定を受け、これらの広い再検証は省略。試験中のメディア確認はANR中の開始失敗があり、成功の証拠には含めない。前ターンで検証済みのDAT二重取得修正はその記録を参照。今回の新機能の通知/設定入口を重点検証した。

最終実APKのhash一致・各PIDの新規fatalなし・テスト登録0を確認。通知・登録・確認間隔を試験後に復元。台帳docs/android-installations.md、詳細 `build/notification-settings-final-summary.json`、`thread-watch-content-background-result.json`。実機の既存登録は変更なし（730eae72の実通知/Job履歴のread-only確認と利用者指定による同Job強制実行1回は別記録。観測98→100、強制実行後100。新規増分通知の発火を実機でその場で観測したとはしない）。

## 公開

利用者の公式Release指示あり。既存Semantic Release CIで公開し、配布MPP/両feed/README反映を確認して結果を追記する。手動タグ・Release・assetsアップロードなし。


2026-11-03公開追記: 公式[1.20.0](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.20.0)へ収録済み。既存Semantic Release/Build CI成功、公開MPP SHA256 `fe849e75858486f27a7afeb722286955a90fe56000fb34358dfb6435cf79e669`、配布asset digest/CRC/更新feed6件/README一致を確認。詳細は`build/official1200-public/verification.json`とintegration-statusの公開記録。
