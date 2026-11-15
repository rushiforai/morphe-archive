# 2026-11-14 利用者依頼の統合確認表

最後にまとめて実機確認する（利用者の最新指示）。確認・公開済みとは区別する。OneDrive外のcanonical repoで作業。

|依頼|現在の状況|完了条件|
|---|---|---|
|リンクカード除外URL編集・Imgur初期除外|実装・39host/25実機成功、未公開|最終統合回帰|
|226/242 NG Threads 記者だけ・前半4桁・後半4桁・過去スレ検索|242旧owner参照を修正、242 native48成功、191 board field/bare rule修正追加|最終3版実機|
|191にあり242にない機能の監査|native→extension呼出96/92/99クラスを索引化、関連機能をレビュー中|差分判断と回帰、全機能実機網羅と混同しない|
|191画像viewer下の重複︙・226の上︙|ActionBar検出/補助︙上配置を実装|実native viewer表示|
|242 Imgur動画albumサムネが一瞬で消える|cached URLの分岐が補完hookを飛ぶ箇所を修正|報告albumと合成fixtureの保持|
|常に通常版ChMateで書き込む|初期OFF、標準write action2の共通dispatcher連携、設定共有追加|3版起動Intentを遮断し経路検証|
|ツールバーアイコン画像の区切り|機能ごとSettingsSectionに再構成|スクリーン/設定row境界|
|スレタイトル長押し3項目の個別非表示|初期ON、更新対象/新着通知/閲覧認証を個別選択|OFF時余白なし/ON動作|
|レス長押しコピー重複ANR|listener重複/再入防止実装、XIG05実ANR採取|原因切分け・再現/回帰、軽減と修復を区別|
|外部板名前URL編集ANR|XIG05 native ScrollView計測stack実測、誤native surface判定修正、一覧遅延描画化・二重dialog防止|大量板/開閉/検索/編集cancel実機、data保持|
|赤いIDレス|設定名のみ「あぼーん表示」へ変更。利用者訂正に従い動作変更を撤回|従来の0x1008・除外/OFF/他NG動作維持と設定名確認|
|uguu.se upload先追加|API/upload確認、128MiB・3時間、送信先に追加|API/保存期間/上限確認・送信先UI/レス限定/容量エラー/fixture|
|ふたば勢いランキング|全板/may/img・アプリで開く実装、futapo.futakuro.com/ranking/index.html|解析・アプリで開く・一覧/通信検証|
|may/imgのタイトル無念|無念→本文先頭fallback実装、1.30.5報告|catalog/API本文先頭fallback・通常title保持|
|HOMEスレ上下移動・ピン留め|︙並び替える・一覧長押し・永続保存を実装中|3版・再起動・標準復元・区切り保持|
|公式Releaseに謝辞/寄付欄|既存1.27.3をwriter footerへ継承、generatorテスト成功|公式note/assets/両feed確認|

1.34.0候補CI43572625908は利用者の追加依頼で取消、Release未公開。生成commit/tag f3631669/1.34.0だけ進行。次回は既存Semantic Release CIの新versionへ正常マージする。タグ/生成ファイルの手編集はしない。

端末は途中でMi Note10 d5497008→XIG05 730eae72に変更。普段使いpackage jp.co.airfrt.android.chMate.haiagartuはread-only診断のみ。最新ANR17:34 ResList MOVE timeout、17:43 ExternalBoardEditorActivity native TextView/ScrollView measure。詳細診断はbuild/user-image-report-20261114の非公開bugreportに保持しGitへ入れない。

利用者から検証に必要な同意ボタン操作を許可。通常版/Haiagaru本体の上書き許可とは別。HOME並び替え依頼追加、標準区切りを維持する表示コピーのみで実装。

追加依頼: スプレッドシートの過去スレID完全一致で記者IDを補完し、NG登録はユーザーが選ぶ。自動NGは行わない。ReporterSearch.lookup host46項目成功。タイトル長押し画面で欠落を実測（XIG05）。公開CSVをworkerで取得・6時間cache・衝突拒否、未取得なら再度メニューを開いた時に反映する実装中。
追加依頼: Kyodemo必死チェッカーに「作成したスレ」タブ。現在取得された結果に1レス目があるスレだけ、その1レス目と見出しを表示。未取得ページを作成スレなしと断定しない。実機/fixture検証待ち。
HOME手動順では板/日付見出しを外し、区切りをまたぐ上下移動を可能に修正。タブ別順とpin先頭を保存。長押し操作は︙並び替える内の一覧。
18:18端末接続がMiNote10からXIG05 730eae72に変更。MiNote10向け試験APK更新はdevice not foundで停止、成功扱いしない。通常アプリを上書きせずread-onlyスクリーン取得のみ。

追加依頼: 設定の「ﾜｯﾁｮｲ長押し操作」をSettingsSectionで初期折りたたみ。子の7トグルと保存キーを維持。最終ビルド/画面確認待ち。

追加分の確認状況: ReporterSearch.lookupを含む46host、Kyodemo実際の注入JSをDOMで実行した9項目成功。全件完了の指示を再確認。先行build-home-final-retryはR8実行中（最新の追加3件はそのビルドに未収録なので、完了後もう一度最終ビルド必須）。最新Java単体検査は依存classpath不足の2エラーで未完了、製品エラーと混同しない。

HOMEの長押しは並び替えダイアログに加え、ネイティブのスレタイトル長押し内にも「HOMEでの位置を変更」を追加。既存HOME行のboard/thread完全一致に限定して上下移動・pinを保存。最終ビルド待ち。

追加依頼: 書き込み︙に「設定リンクを作成」。初期OFFのshowPostingSettingLinksトグルと共有対応、既存SettingLinkActivityへ接続、191 activity-owned menuを含む共通posting overflow hook。最終ビルド/3版実機未検証。
18:35新ANR: PopupWindow:caffcc3 input DOWN timeout、PID19417。DropBoxはdebuggerd registration失敗でアプリmain Java stackを欠く。waiting channelはbinder_wait_for_work。根因確定せず、bugreport1835を採取中。旧17:43のScrollView計測とは同一扱いしない。
ローカルR8 build-all-finalはPC nativeメモリ不足で失敗（hs_err_pid49752）。未公開。最新の製品Javaは単独javac成功、全体ビルド/実機は未完了。

18:54継続: build-complete-candidate.log/session79701で最新の設定リンクmenuも含む統合ビルド進行（仮想空き約4GBへ回復）。重い別Java処理は並行しない。bugreport1835/session79112はまだ完了せず。最新lastanrも18:35の同一記録。
次の必須作業: 統合build成功→candidate.mppコピー→patch-final.pyの3版適用→署名照合/別package導入台帳→reporter/menu/thumbnail/integrated/実UI/ANR→未検証項目是正→通常dev/master CI公開。古いfinal APKを最新として導入しない。

追加依頼: ANRをクラッシュログと同じDownloads/Haiagaruへ記録。AnrLogsでAndroid11+ ApplicationExitInfo.REASON_ANRを次回起動時worker取得、chmate-anr-時刻-PID.txt、trace最大1MiB、欠落を明記、重複防止。アプリ終了しなかったANR/Android10以前はこのOS履歴APIの対象外。最終ビルド/合成終了情報fixture/実ANR取り込み未検証。

18:56端末はMi Note10 d5497008に切替。共通検証はこのserialで継続可能、reporter検証packageを使用。XIG05 bugreportは生成成功/PC転送失敗。端末側/data/user_de/0/com.android.shell/files/bugreports/bugreport-XIG05_jp_kdi-AQ3A.240912.001-2026-11-14-18-52-12.zip、再接続後adb pull必要。単なるスタック欠落を根因推定で修正扱いしない。最新AnrLogs追加は実行中ビルドのJavaコンパイル後の編集のため、もう一度build必須。

18:58 XIG05再接続、bugreport52,841,779bytes回収成功。FS/data/anr/temp_anr_3661936118934892529.txtのPID19417 mainはBinderProxy.transact→IJobCallback.jobFinished→JobServiceEngine.JobHandler。18:35はnative binderでsystem job完了応答待ち。外部板ScrollViewとは別。system_server側対応thread/lockの確認が次の調査。証跡anr1835-main.txt。

利用者の最新指示: 実機検証は利用者が実施する。エージェントは差分を説明し、実機検証を追加で繰り返さない。ユーザー確認前の公式公開を完了扱いしない。build-complete-candidateはANRログの追加前コンパイルのため、最新全体のビルド成功とは扱わない。

## 2026-11-14 1.35.0-dev.1 利用者検証用プレリリース

利用者の明示指示で最新統合版の実機機能検証は利用者側へ移管し、devのみへ公開。製品4a953de9、masterの既存生成1.34.0を通常merge15b7c8dcで取り込み、既存Semantic Release CI43583611555 Release/Attest成功。19:09:56 JST公開、prerelease=true/draft=false。正式安定版へはマージしていない。

公開差分はHOME順/pin、記者IDメニュー/過去補完、Kyodemo作成スレ、設定折りたたみ/区切り、通常版書込、設定リンクmenu、画像補完、uguu、ふたば、外部板描画/長押し再入対策、ANRログ。公開文へ初期値・未確認範囲・ANR未解決とログ制限・謝辞/寄付を明記。公開MPP SHA256 28f8715ac7a6e4c94c648fe684670b9fd5899b7dda85257f4777c7b890d5b092。全5assetのGitHub digest一致、MPP CRC/追加classと設定キー同梱、devのpre feed1.35.0-dev.1を確認。証跡build/prerelease1350dev1-public/verification.json、reporter-parity-20261114/prerelease-ci.log。Python URL取得はローカル証明書エラーのためghで取得して検証。最新統合版の実機確認/公開送信は行っていない。18:35ANRはsystem job callback待ち、根因未確定。

https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.35.0-dev.1

1.35.0-dev.1利用者報告の修正: HOME「並び替える」をMenuItemリスナーに加えて既存HOMEの操作ID dispatcherへ接続。依頼どおりスレタイトル長押しの「HOMEでの位置を変更」をコードごと削除。191 NGエディタonViewCreated末尾はnative b==falseがRETURN_VOIDへ直接分岐し、直前挿入した記者ボタンhookをスキップする実コードを確認。returnターゲット自体をhookへ置換しreturnを後置。runtimeのc/f field読取もNativeFieldsへ統一。226/242の発生条件は利用者へ質問中。ビルド/機能確認は未完了。

191報告と利用者回答で一致。追加報告Kyodemo「作成したスレ」なし: JS guardがbs=hi必須で、実サイトのhi=等の検索URLを除外していた。ホストと/sdemo/b/、実際の#blist post構造で判定。ページ読み込み後の遅延挿入に最大5秒再試行し、別URLへ移動後の古いcallbackを破棄。修正用CI43585407045はこの追加前の差分なので、次CIにも含める。

追加仕様確定: HOME並び替えはダイアログ内の一覧で上下へドラッグ。HOME本体を直接ドラッグする案は撤回。専用HomeOrderListで右つまみをドラッグしdraft順を変更、保存で確定/キャンセルで破棄。pin群を優先し群をまたぐドラッグは抑制。「標準の並び替えに戻す」で現在タブのorder/pinを消す。最新指示は完成後公式Release。実機機能検証は利用者担当という指示を維持。

利用者追加: 保存済みのHOME並び替え順/pinをローカル/MEGAバックアップへ含める。共通HaiagaruSyncSnapshot.EXTRA_SETTINGSへHomeThreadOrder.PREFSを登録。既存typed string/string-set形式で通常復元/不足分merge、古いbackupで項目がない場合はローカル保持。バックアップ分類「設定」がONの場合が対象。draft中の未保存順は含めない。

## 2026-11-14 1.35.0公式公開

利用者の完成後公式Release指示に従いdev→master通常merge d821fc28。Release CI43586841910/Build43586841938 success、draft=false/prerelease=false、19:51:50 JST公開。191 NG末尾分岐hook修正、HOME menu dispatcher修正、不要なHOME位置変更ボタン削除、Kyodemo検索URL/遅延表示、ダイアログ内ドラッグ/標準復元、並び順とpinの共通ローカル/MEGA設定backupを含む。Kotlin/Java compile1m3s成功、Kyodemo DOM11項目成功。利用者による実機確認指示に従い、最新版の実機操作/backup実復元は開発側未実施。成功扱いせず公開本文に制限を明記。

公開MPP SHA256 b2b050f8346698542cf0fc9b550364d3b7407b6c85ce03dc5409a323aa83cd9e。全5assets GitHub digest一致、ZIP CRC/追加class/不要表示文字列の除去、master/dev両JSON計4feed1.35.0とdownloadURL一致を確認。謝辞/寄付欄と最新仕様を公開文へ明記。証跡build/official1350-public/verification.json、ci.log。開発版dev.2/dev.3の先行CIも成功。ANR根因/解消は未確定。

https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.35.0

1.35.0並び替えピン即時反映の報告: HomeOrderListの引数は同じView/DragOrder/callbackのためCompose skip対象となり、MutableなJava list/pinを行内で読むだけでは変更が観測されなかった。ModelUiのrevisionを明示伝搬し、ローカル操作でlocalRevision更新、label/pinのimmutable snapshotを作ってLazyColumnへ渡す。ピン変更/ドラッグ/アクセシビリティ移動が同じ更新経路。保存/キャンセル/backupキーは変更せず。Kotlin/Javaコンパイル進行中、実機検証は利用者担当の指示を維持。公式Release指示あり。

## 2026-11-14 1.35.1公式公開（並び替えピン即時反映）

6f04b64fをdev→master通常merge dc32a7aa。Release CI43589406178/Build43589406170 success、20:23:00 JST公開、draft=false/prerelease=false。HomeOrderListへrevisionを渡し、操作でlocalRevisionを更新、immutableなlabel/pinの行snapshotをLazyColumnへ渡して、同一View参照でComposeが再描画を省略する経路を修正。保存/キャンセル/標準順復元/backup形式は維持。Kotlin/Java compile58s成功。実機操作は利用者側で確認する指示に従い未実施、公開文でも区別。

公開MPP SHA256 708f83173a219a3c1e55f859d40b839f2541935a0869b00d8ff37c846a3ff1a6。全5assets GitHub digest一致、MPP CRC/追加HomeOrderRow同梱、master/dev両JSON計4feedのversion/downloadURL一致、修正説明/謝辞/寄付欄を確認。初回の検証scriptはR8で消えるローカル変数名localRevisionの文字列を要求して失敗したため、その不適切な検査を除き、配布クラス/CRC/digestを検証した。製品エラーとは扱わない。証跡build/official1351-public/verification.json、ci.log。

https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.35.1

人気レスtap popup性能の再報告: 総レス数が多いほど遅い、1.9.3ではなし。利用者回答により次修正版で既存popularReplyDirectを一度OFF（popularReplyDirectOffV1移行marker）、以後の手動ONは維持。popup設定とは独立し、未設定値のpopup ON継承を廃止。NativeRows capture gateも共通directForへ統一。端末未接続、変更はまだ未配布。PopularModesAndroidTestへ一度OFF/手動ON維持/popup独立のfixtureを追加。

性能調査の具体的経路: PopularNativeRows.saveは小さい返信popupを処理するたび、Snapshot構築後に既存の全スレresponsesを線形走査して所属を判定。全レス数依存の処理であり、capture有効時に通る。SnapshotにIdentityHashMapベースの所属集合を一度構築し、popupは初レスのidentityでsnapshot構築前に判定。二重確認も同じ集合を使用、表示/NG/閾値/キャッシュ所有判定の意味は維持。実機での効果は未確認。
