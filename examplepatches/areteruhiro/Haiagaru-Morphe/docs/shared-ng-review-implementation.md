# 共有NGの審査・配信（開発中）

未公開の実装です。公開GASは2026-10-30に既存URLのままv3（v2受付・直接配信）へ更新済み。実ユーザーNGは送信していません。

## 開発中の現行仕様（2026-10-30）

オンライン共有NGは初期オフ。同意画面を保存して初めて個人NGの送信を有効にする。既存のNGID/NGName/NGWordを対象種類ごとにまとめて送り、その後はネイティブNG保存の通知で追加・変更・削除を約1秒後に収集する。定期pollは廃止。起動時1回の回復照合と失敗15分後の単発再試行、1要求20件の分割送信は維持する。

有効期間やandroid等の個別板名は送らず、5ch・エッヂ・PINK・したらば等の親掲示板で区別する。未知の外部掲示板はホスト名で区別する。判別できない掲示板や正規表現・特殊一致モードは配信対象にしない。ID・ワッチョイ全文/上4桁/下4桁に対応。受信条件は個人NGストアへ登録せず、再送ループを防ぐ。

NGワードはNFKC正規化と空白除去後に5文字以上、英字のみは対象外。ローカルの通常NG登録、ID/ワッチョイ等には最小文字数制限を追加しない。旧キューの不適格upsertは除外し、以前の報告のdelete取消は維持。GASでもineligible_keywordとして却下し、手動承認でも配信しない。

受信にはGAS直接配信のみを利用する。必要な報告数は1以上の任意整数、掲示板・種類・個別除外を設定可能。「フィルターの強さ」はUIと適用判定から廃止。送信同意は取消可能で、送信対象の内容プレビューを用意する。送信先は説明画面へ表示しない。

以下のGAS実装・過去検証記録に残る日付・強さ・定期確認の記述は履歴であり、現在のアプリ仕様は本節とintegration-status.mdを参照する。

## GAS

既存Code.gsとappsscript.jsonに加え、Moderation.gs、PersonalInbox.gs、Publish.gsを同じプロジェクトへ配置します。初期化後 `ngInboxSetup_` でInbox/ReviewPolicyを用意します。既存Pendingは書込ジャーナルなので用途を変更しません。

旧version1報告APIは初期状態で停止し、移行検証でALLOW_LEGACY_REPORTS=trueを明示した場合だけ利用できます。新Androidはversion2のみ使います。

新しい個人NGはversion2/action=personalのPOSTでInboxへ保存し、直ちに配信しません。送信元はランダムなインストールIDのハッシュで、サーバー側でも秘密値と合わせて再ハッシュします。本人確認ではありません。

`reviewPersonalNg` が最新の追加/取消を送信元ごとに整理して重複票を除外し、自動判定します。辞書にないもの、期間不明のID、正規表現、一般的な名前、仕様不明の外部板IDは保留。外字という語は初期辞書に含めません。通常ワードの辞書判定は5ch以外の板にも適用できます。

ReviewPolicyシートのA列キー/B列JSON値で `words`、`exceptions`、`identityVotes`、`wordVotes`、`boards`、`policyVersion` を指定できます。

- words: `[{"term":"死ね","level":2,"match":"contains"}]`
- identityVotes / wordVotes: 旧互換キー。現在は判定票数へ影響しません。
- exceptions: `["死ねと言うな"]`
- boards: 板別の辞書・例外などの審査設定。票数はアプリ側で指定します。

管理メニューでInbox行の採用/保留/却下を上書きできます。Inboxの選択行から集計条件の配信停止・再開も可能です。期間不明IDや正規表現は手動でも配信できません。配信停止IDはScript PropertiesのREVIEW_REVOKED_IDS（JSON配列）で指定します。

## GAS直接配信（標準）と任意のGitHub配信

`exportReviewedSharedNg` は採用済みだけの全件JSONを生成します。個人NG値のうち保留/却下・送信元ID・管理秘密値は出力しません。票不足や取消で外れた条件は次の全件更新で削除されます。

標準ではGASの `action=reviewed` から審査済み全件JSONを直接取得します。GitHubトークンは不要です。応答を最大5分キャッシュし、保留・却下・送信元情報を含めません。AndroidのGitHub受信切替・URL入力は利用者指示で削除し、GAS直接受信へ統一しました。旧GitHub設定があれば更新番号をリセットし、旧配信元のキャッシュを適用しません。取得失敗時は同じ配信元の最後の正常キャッシュを保持します。

任意の `publishReviewedSharedNg` はGitHub Contents APIで `rules/shared-ng.json` を更新します。GitHubのfine-grained tokenをGASのGITHUB_FEED_TOKENへ設定します。実tokenをコードやシートへ書かないでください。出力先はGITHUB_FEED_REPO/BRANCH/PATHで変更可能です。既定はareteruhiro/Haiagaru-Morphe/dev/rules/shared-ng.json。

`installSharedNgReviewTrigger` は毎時の審査だけを設定し、GitHubトークン不要で動作します。`installSharedNgPublishTrigger` はGitHubトークン設定後に毎時配信を設定します。設定時は同じ関数の重複トリガーだけ整理し、他のトリガーを維持します。GitHub配信の未設定はGAS直接配信に影響しません。GitHub配信を利用する場合はGASの外部通信権限の承認が必要です。

通常LintVital付きビルドは成功（5分27秒、build/shared-ng-identity-build.log）。

個人NGの実収集メソッドを使ったホスト検証19項目で、同意なし・既存収集・再送同一操作ID・種類OFF・削除・送信先分離・同意変更中の応答・不正ACKを確認。テストは合成NGとメモリ内通信だけです。設定変更は旧条件の取消→新条件の追加の順で送り、最終状態が取消に化けないようにします。NG表示方式（連鎖/透明）の違いは票を分割せず、同じ送信元は1票として集計します。個人の正規表現IDもInboxでは受け取り、実行・公開せず保留します。regex値だけでなくnative正規表現フラグでも保留とし、数値等の特殊一致モードも部分一致へ変換しません。辞書と例外は本文と同じNFKC/空白正規化を行い、空の辞書項目は採用しません。

## 残る検証

ローカルテスト: SharedNgRulesTest 45項目、GAS既存API 41項目、自動審査43項目、Inbox/ID・上下4桁の閾値/取消/GitHub配信モック114項目が成功。実データは送信していません。ID・全文は既定5票/レベル3、上下4桁は10票/レベル4。5chの上下4桁は木曜始まりの週を必須とし、板・期間不明は保留。審査と全件出力は同じロック内で処理します。送信種類をオフにすると、その種類の待機データも送信を止めます。

3版のnative保存フック検査と、ART上の収集9項目・受信13項目は成功。受信は高度NGとの合成入口evaluateBodiesを実行し、ID日付/下4桁週/板/種類/強度/個別例外/OFF、全件sync・不正feed旧条件保持・cache reload・空feed解除を確認。実ネットワークを合成応答へ置換し、設定/cacheを復元しています。191/226/242のDEXでnative batch/typed map hookも検査成功。

226は実DATのIDから共有条件を作成しnative NGWordフラグ付与と受信OFF解除を確認済み。実レス上の非表示UIと解除の最終目視、GAS直接配信とアプリ取得の通し確認が必要です。任意のGitHub配信は未検証です。実ユーザーのNGはテスト送信しません。

2026-10-30 実機で5→7保存→画面再表示で7保持を確認し、元5へ復元。送信先URLが同意画面に出ないことと未送信表示を確認。実NG送信は行わずキャンセル。共有スイッチから初回同意へ遷移する処理はhost6項目成功、実機では既存ON状態のため初回分岐を未操作。

GAS実配備: reviewPersonalNg/exportReviewedSharedNgの実行完了、毎時reviewPersonalNgトリガー1件確認。公開POSTで合成候補受付1・再送0・取消1、旧API停止確認。利用者の選択によりGitHub専用tokenは不要とし、GAS直接配信へ移行。

2026-10-30 GAS v3を既存デプロイへ配備。公開GETの審査済み全件形式、revision、空のrules、個人メタデータ非公開を確認（build/shared-ng-gas-direct-live.json）。合成試験の取消済み候補しかないため0件は正常。GASサービス41・審査43・Inbox/配信123項目成功。アプリ側最終ビルド・直接受信の端末検証は別途記録する。

2026-10-30 GAS直接配信最終確認: 通常LintVital付きbuild成功7m15s、固定MPPから242生成、Mi Note10既存検証packageへ署名照合install-r Success/cold起動Status ok。Android実製品sync(true)で既定GAS route/lastSync更新/failures0/同期0条件を確認（build/shared-ng-gas-direct242-runtime.log）。個人NG送信なし。191/226は前候補のまま、アプリRelease未公開。

2026-10-30 直接受信3版確認完了: 固定GAS直接MPPを191/226へ適用しMi Note10既存検証packageに署名一致install-r Success、cold起動成功。191/226/242すべてで実GAS syncと合成受信13項目（ID日付/下4桁週/板/種類/強度/個別例外/OFF/全件sync/不正feed保持/cache reload/空feed解除）成功。実個人NG送信なし。実機cache操作はsu必須のため検証runnerを修正、同じ端末内でcp -p保存/mv復元。初回242検証は13項目成功後のshell rmが権限失敗、修正後に全項目と復元成功を確認し実GAS再同期。3版新規アプリcrashは未検出。残る: 実レス非表示UIの目視/復帰、初回同意の端末操作、実GAS承認候補から適用までの通し確認、実配備GASとローカルソースの再現性整理。アプリRelease未公開。

2026-10-30 初回同意端末確認: Mi Note10検証226の実HaiagaruDialogとSwitch/保存・キャンセルボタンを操作し5項目成功。初期送信トグルON/保存前両OFF/キャンセル両OFF/保存で送受信ON/受信OFF保存を確認。実NG送信を避けcollect/changedのみ一時無効化し、元prefs全件と受信状態をfinally復元してからRPC完了（build/shared-ng-gas-direct226-consent.log）。初回runnerは復元完了前にresolveしていたため修正・再試験、consent prefs空を確認。後続crash buffer監査で初回終了時刻11:04:19に226 SIGBUS/BUS_ADRALNを検出。検証attach/detachとの関連を含め原因未確定、通常操作の無事故と混同しない。修正版再試験後の追加crashは未検出。242は本体履歴からPart3本文を開きscreencap表示成功（build/shared-ng-242-body-now.png）、UIAutomatorは古いHome treeを返したため現在本文判定には使用しない。URL付きam startは自動承認review拒否のため実行せず、UIから開いた。共有NG実レス非表示/復帰の最終目視は残る。

2026-10-30 crash監査補足: build/shared-ng-consent-crash-audit.logに226 pid10881/main SIGBUS 11:04:19、libcrashlytics-common経由・unknown frameを保存。初回同意runner終了近辺、原因未確定。公開判断には通常操作での再現切分けが必要。

2026-10-30 GitHub受信UI削除: アプリのraw feed経路/切替/URL入力を削除しGAS固定化、同期ボタン名を共有NGを同期へ変更。サーバーの任意GitHub出力関数は標準動作に不要。送信はプロセス起動20秒後から60秒周期、native保存後1秒debounce、同意/種類ONのみ。1回20件まで、成功/失敗後15分待機、プロセス終了中のbackground jobは未実装。consent6/votes9成功、最終ビルド中。

2026-10-30 定期確認を任意設定化: 利用者の最終指定で初期ON・60秒。個人NG送信同意画面に定期確認トグルと60〜86400秒の間隔入力を追加。送信同意がある場合のみ実schedulerを登録、OFF/同意解除/間隔変更は旧ScheduledFuture.cancel(false)して再設定。OFFでもnative保存時1秒debounceと起動20秒後の照合は維持、送信後/失敗後15分待機と20件batch維持。端末内照合と通信条件・短間隔負荷を説明。production scheduler/境界19・collector19・consent6成功。直前gas-only buildは変更混入防止のため中断（exit1）、最新build/shared-ng-periodic-build.logで再build中。端末はまだ旧gas-direct版。

2026-10-30 継続検証: Mi Note10検証226の表示中実DATでnative ID→NGWord flag付与と受信OFF解除の2項目を再確認（build/shared-ng-native226-review.log）、設定/rules復元。直近通常UI操作とcold起動後、新規crash時刻増加は未検出、過去11:04:19 SIGBUSの原因確定はまだ。periodic最終MPPはR8進行中。

2026-10-30 実GAS送信確認: 利用者依頼でMi Note10最終periodic226の製品PersonalNgSubmissions.collect→SharedNg.request→公開GAS v2受付を実行し7項目成功（build/shared-ng-live-submission226.log）。native entries読取だけを検証用合成1件へ置換、未知板の無害な一意ワードで公開対象外。accepted1、同operation再送accepted0、ACK後queue空、変更なし通信なし、取消accepted1/queue空を確認。実個人NG送信/native登録変更なし。元prefsとschedulerをfinally復元。初回テストは明示replayをsent配列件数に含むため期待件数誤りで中断し取消回復を実施、期待値修正後に再試験全成功。通常LintVital build成功6m41s。periodic UI testは初期60表示の読取期待で失敗、設定とscheduler復元済み・原因調査中。送信成功とUI全検証完了は区別する。

2026-10-30 実個人NG送信: 利用者が明示的に実機NG送信を指示。Mi Note10 d5497008の現在使用中検証226（periodic版）native NGID1件/NGName1件/NGWord0件を実収集し実GASへPOST。submitted2/accepted2/ack2、kind id/suffix、remaining0を確認（build/shared-ng-real-send226.log）。合成置換なし、native store変更なし、実NG値はログ/文書へ出力せず。consentと3種類送信をON保存、既存periodic状態を復元しscheduler再設定。今回の2候補は取消せず審査対象として維持。API受付と審査採用・公開を混同しない。他packageのNGは今回送信していない。

2026-10-30 必要報告数をアプリへ統一: ngPolicy_のidentity/word最低票数を1へ固定し旧identityVotes/wordVotesを無視、配信minVotesも1（旧manual override含む）。板/期間/regex/辞書審査とminLevelは維持。Moderation/Publishをローカル全量と同一内容でGAS保存しclipboard再読一致確認、既存deploymentをv4へ更新完了11:50。cache key v2へ更新。公開GET ok/full/revision1/rules0（scope/期間不明などは依然保留）を確認、空feedだけで票数動作を実証したとは扱わない。local moderation48/Inbox123/Android policy55成功、実機226のevaluateBodiesで1票条件→app1適用/app2除外と従来受信13項目を合計15項目成功、prefs/rules/cache復元（build/shared-ng-threshold226-runtime.log）。証跡build/shared-ng-gas-v4-deployed.png/proof.png。アプリ説明文の変更はソースのみ、現インストールの票数判定自体は対応済み。

2026-10-30 実審査確認: GAS管理用auditReviewedSharedNgをPublish.gsへ追加（APIには未接続、web deployment v4維持）。同lock内で現審査/公開feedの票数・件数/未解決scope排除/private metadata非公開を監査。実行11:57:52〜11:57:56完了、totalInboxRows2/latestReporterConditions2/states pending2/reasons unresolved_board2/published0/exportMatchesReviewed true/policyProbes5成功。実送信ID1・suffix1はどちらもboardResolved false/periodKnown falseで保留。審査稼働は確認したが、native scope→板URLとidentity期間の情報不足により、この実2件が自動公開可能とは確認していない。具体的なNG値/送信元はログ出力しない。証跡build/shared-ng-live-review-audit.txt/png/proof.png。local Inbox/audit125成功。

2026-10-30 最新仕様変更（未配備）: 利用者が有効期間なし・個別板ではなく親掲示板単位を指定。5ch/all・edge/all・pink/all、その他は独立host/all（したらば/open2ch/2ch.sc/Talk alias統合）。外部名称は既知service名、不明は実host名、その他一括にはしない。native bare scopeは端末内のboards name/server読取のみで親へ解決（5分cache）、同名別serviceの曖昧scopeは保留。sourceScopeと期間は送信から除外、旧queue/取消もsanitize。期間なし受信/親scope matching/サーバー正規化・表示名出力を実装。app policy66/collector19/server130/moderation48成功。build/shared-ng-parent-scope-build.log進行中。GAS公開は従来v4（期間必須・細分scope）のまま、空期間/親scope非対応の旧端末への配信回帰を避け、対応APKを先に検証してから切替予定。今回コードをライブへは未貼付。

2026-10-30 監査改善（未配備）: 利用者提示auditReviewedSharedNgを最新の親掲示板/期間なし仕様へ変更。再審査・export副作用を除去したread-only監査、最新reporter-condition状態だけ集計、取消・重複票・不整合審査・不正承認・配信cache差異検出。raw値/送信元/任意state/reason本文をログへ出さず既知codeと集計のみ、構成/保存エラーも一般code化。cache5分差異はwarningsとして区別し正常な一時差異を自動修正しない。server133成功（監査で行・revisionが変化しない、審査不整合を検出し勝手に直さない、不正行をraw出力せず検出）。GAS実sourceは従来版のまま、対応アプリ確認後まとめて適用予定。parent scope build通常LintVital成功6m10s、226APK適用成功・実機導入中。

2026-10-30 親掲示板/監査 実反映完了: parent-scope固定MPPから191/226/242へ適用しMi Note10既存検証package署名一致更新・cold起動・各17項目成功。226定期確認UI/実scheduler12項目成功（EditableのFrida文字列化、EditText setText overload、Delayed interface計測を修正した最終runner。途中失敗は製品不具合と区別）。GAS Moderation/PersonalInbox/Publishを保存、Inbox/Publishはclipboard全文でローカル一致確認、既存deployment v5へ12:24更新。公開GET revision2/2条件、5ch/all・表示名5ch・ID/suffix各1票・period空を確認、値はログ非表示。実226 syncで2条件成功。実送信2件は親scopeへ再解決され採用、旧unknown2件は取消済み。新read-only audit実行12:26:15〜19: totalInboxRows6/latest4/active2/withdrawn2/approved2/waitingReview0/cachedPublished2/issues空/warnings空/probes8、ok true。証拠shared-ng-parent-gas-live.json、shared-ng-parent-audit.txt/png/proof.png、shared-ng-parent-scope226-live-sync.log。server133/Android policy66/collector19/moderation48成功。アプリRelease操作なし。残る全体検証は実レス非表示・復帰の目視と最終差分監査、native SIGBUSの既存切分け記録参照。

2026-10-30 エッヂscope修正・外部板共通対応: 利用者実機226のnative NGID scopeがbbs.eddibb.cc%2Fliveedge、boards tableにeddi/liveedge行0件を確認（NG値非出力）。native外部scopeのhost/pathを一度だけURL decodeし、明示host付きの形式から親serviceを直接解決する共通nativeBoardを追加。5ch/PINK/したらば旧新host/open2ch/Talk/2ch.sc/ぷにぷに/custom port/encoded URLをテスト。裸androidは引き続き登録済みboards照合、userinfo/二重decode/悪意のsuffixhostは誤判定しない。policy96/collector19成功。build/shared-ng-native-scope-build.logで通常build中、実機は未更新、GAS v5変更不要。

2026-10-30 外部scope実機修正完了: native-scope226をMi Note10へ署名一致更新、実保存Edge key bbs.eddibb.cc%2Fliveedge→edge/all/名称エッヂ成功。ART15項目、host96/collector19成功。実個人NGの旧unknown取消→Edge upsertの2操作submitted/accepted/ack2、queue0（shared-ng-edge-real-send226.log）。配信GETでUnexpected end of JSON inputを検出、実read-only auditでInbox9行のうちINVALID_INBOX_ROW4確認。どの経緯で不正行が生じたかは未特定。ngParsedInboxCondition_/ngEmptyInboxRow_を追加し、不正行のraw値は残してrejected/invalid_inbox_rowへ隔離、正常行審査/exportは継続・完全空行は無視。監査は隔離行をwarningで可視化。不正行1件で正常feedが止まらずraw保持をserver136項目で検証。Inbox/Publish全文保存一致をclipboard確認し既存GASをv6へ12:49更新。公開GET revision3/3件（5ch ID・suffix、Edge ID各1票）成功、実226sync3件成功。証拠shared-ng-native-scope-gas-live.json、shared-ng-native-scope226-live-sync.log、shared-ng-gas-v6-deployed.png。新GAS監査の再実行は中断のため未実施、API復旧は実応答確認済み。191/242は外部encoding修正APK未適用。アプリRelease未公開。
