# 共有NGのチェック再描画・通知監視の管理・ツールバー保存順

## 共有NGの原因と修正

ChMate191の本番showResponseExclusionsダイアログにメモリ内の合成条件を渡し、チェック部分を実タップすると、ListView.isItemCheckedとselectionはtrueなのにUIAutomatorのチェック表示はfalseのままになる症状を再現した。build/shared-ng-rule-choice-191-visual-isolated.log参照。dev.5までの試験は内部状態と保存結果に偏り、表示の成功を保証できていなかった。

HaiagaruDialogのrefreshで増えるrevisionがModelContentへ渡らず、構造fingerprintが同じViewの再描画をComposeが省略していた。revisionを子の描画引数へ加算して選択変更を再描画へ伝える。SharedNgExceptionsの選択はChoiceListで条件IDの集合を基準にし、native clearChoices・検索再構築・choiceMode変更で選択が消えないようにした。無効行・不正位置を無視し、行とcheckboxは同じ切替を1回だけ実行する。

先行のredraw候補では3版の実checkbox表示がOFF→ON→OFFへ変わり保存も成功。242検索試験は試験終了前にエミュレータを停止して中断したため、最終候補で全版をやり直す。過去の試験中断を製品不具合と混同しない。

## 通知

ThreadWatch.confirmedは従来、書き込み後の自動監視の設定で既存スレの返信限定・返信後停止を上書きしていた。今後は既存スレの個別設定を優先し、新規登録時だけ初期設定を適用する。画面のラベルと説明も明示。停止中の登録は投稿確認後に再開し、個別期限を更新する。

ThreadWatchManagementを追加し、一覧にタイトルまたはURL・監視中／停止理由・期限を表示。個別設定、停止、再開、解除を選択できる。期限は1h/6h/1d/3d/7d/30d/無期限。新規初期7日、既存／旧バックアップは無期限を維持。期限切れではチェック対象から除外し、全対象停止ならJobSchedulerも解除。期限と期間・理由・タイトルをバックアップへ保存し、復元では絶対期限を延長しない。

従来はsubjectから消えたスレを無期限で保持していた。正常で空でないsubjectから3回以上消え、初回欠落から30分以上経過し、DATも404/410なら停止する。403/5xx/timeout/HTMLや空subjectは停止根拠にしない。登録tokenの再照合とLOCKにより、確認中の解除・再登録・期限変更の結果を上書きしない。停止登録を削除せず一覧から再開できる。

## ツールバー

ResponseMenuOrderは保存済み共有ID70〜74がないと並び替えを終了していた。保存rankがあれば標準項目と追加項目を同じ安定sortで並べる。項目・Intent・callback・unknown項目順を保持する。フックは追加せず既存の最後のfinishResponseMenuを使う。

## 検証

通常Lint付きbuild/buildAndroid成功2m27s、64tasks。3版の元APKへ適用・同一署名の既存隔離パッケージへinstall-r成功。元の実機アプリの更新・削除・データ消去は行わない。ADB emulator-5580。最終原本はbuild/local-development-records/shared-ng-rule-choice-model-installations.json。

通知は各版lifecycle22項目、設定画面9項目、返信限定・停止11項目、バックアップ40項目、native Menuの保存順10項目成功。監視一覧の実Androidタップで停止表示・期限選択・保存再開・解除の10操作を各版成功。build/watch-final-summary.logとwatch-final-<version>-*.log。

ResponseMenuOrderTestは115項目成功。3版のVerifyResponseShareOrderHooksで既存delegateの元命令・分岐・register数の保持と最後のfinalization1箇所を確認。

初回の通知試験は隔離アプリのPOST_NOTIFICATIONSが未許可で通知が出ず失敗。権限を一時許可し再検証した。メニュー試験のFrida MenuItem interface wrapperにequalsがなく失敗した箇所は、identityHashCodeへ修正して再検証した。製品例外とは区別する。

通知の通信は合成subject/DAT・HTTP応答。外部通信OFF、実投稿・共有NG送信なし。標準通知との二重通知フックは変更していない。今回、DB fixtureの作成・削除はしない。利用者の実機は未操作。

検証用スレを開く通し操作は自動承認レビューにblocked by policy（詳細理由なし）で拒否されたため再試行しない。本番の共有NG条件確認dialogを直接開いて検証する。完全な長押し起動経路、242の更新対象タイトル重なりの報告画面再確認は未実施。変更外の本文/画像/GIF/動画の広範な再検証は既存利用者指定で省略。

## 最終確認・公開

最終候補の191／226／242すべてで、checkboxと文字部分の実タップ後の画面上checked=true／falseと保存を確認した。検索15・履歴48も各版成功。新規対象app crashなし。設定・通知権限・wm size・WiFi ON/mobile OFFを復元し、AVDをデータ保持停止。集約build/shared-ng-watch-final-verification.json。公開asset/feed確認は完了後に追記する。正式版1.22.1は維持し、既存Semantic Release CIからdevプレ版として公開する。


## プレ版公開完了

[1.23.0-dev.6](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.0-dev.6)を既存Semantic Release CI41780370219で公開、Release/Attest成功。実装2560d34、生成47d9882をdevへFF取得。draft=false/prerelease=true。公開6assetのsize/digest/SHA256・MPP/ZIP CRC、ThreadWatchManagement/ChoiceList/期限関連フィールド/既存対象クラスの同梱、廃止Shizuku不在を確認。公開MPP SHA256 `96db5182d471879b2b994c81b5c6004cbef862ec111aeadff157587007625f28`。dev両feedは1.23.0-dev.6、master/main両feedは正式1.22.1。VPN任意ZIP2本は1.21.1と同一。証跡build/release-1.23.0-dev.6-verify/verification.json。公開MPPからのAPK再生成・実機導入は今回行わず、実行試験は同じ実装の公開前最終候補。
