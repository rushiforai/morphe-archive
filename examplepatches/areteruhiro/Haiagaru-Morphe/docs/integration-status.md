# 主開発先と統合状況

2026-11-13 設定整理・過去ログ調整を実機191へ更新（未公開）: GENERAL/DISPLAY/SOCIALを用途別に整理、子項目の折りたたみと親OFF時の無効化。タブの追加先選択は全体ON/OFFではないためラベル明確化。重複フィルター設定を入口へ集約し関連語検索/旧リンクを保持。内側丸カードを廃止、背景統一。過去ログは一覧URL非表示、検索欄3〜70%つまみ・高さ固定・元サイトで開く設定、元サイトの不要な外側ヘッダー省略。最終Lint/R8 build3分28秒、191適用成功。検索49+12/高さ19/既存スレURL検査成功。XIG05/730eae72の既存Haiagaru（jp.co.airfrt.android.chMate.haiagartu）へ利用者指定install-r Success、23:20:19 JST、初回導入日時保持、端末APK SHA一致。設定cold起動/検索入口1件/背景とカードの最終画面確認。新規fatalなし。詳細docs/settings-organization-archive-20261113.md、台帳docs/android-installations.md。

2026-11-13 人気レス絞り込み負荷の削減（未公開）: 191/OPPO CPH2797/Android16で1.9.3にないカクつき報告。直接返信判定OFF、切替/スクロール双方で発生。追加フィルターの表示が初期ONだと、未選択でも全レスのAA/自分/返信集計を行う経路を修正。件数OFF/追加選択なしの標準判定はnative表示をそのまま返し、追加選択時も必要な情報のみ集計。直接返信判定では同一再構築/同一一覧の本文解析だけ共有し、更新や別一覧へ持越さない。最終通常Lint/R8 build2分55秒成功。実Java+Android/native模擬部品の1000レス83項目、直接返信/本文/一覧変更8項目、既存ルール7例成功。新規native hookなし。報告端末での再現/スクロール改善は未確認、APK導入/公開なし。詳細docs/popular-filter-performance-20261113.md。

2026-11-13 Haiagaru 1.27.5公式Release公開完了: 更新履歴の設定を上・詳細を下へ配置し、関連版への設定表示と状態同期を修正。「追加された機能をすべて見る」を設定トップ／更新履歴へ追加し、目的別の設定・短い説明・追加20項目の詳しい説明を表示。版ごとの履歴は過去の累積差分の繰り返しを省く。公開文は利用者指定の「最適化」のみ。最終ローカルLint/R8 build3m26s、公開後ソースの版別232／履歴22項目成功。Release CI43369176724のRelease／AttestとBuild43369176758成功、公開6assetのSHA256がGitHub digestと一致。master/mainの両JSON計4経路の全項目一致と本文「最適化」のみを確認。draft=false／prerelease=false、2026-11-13 14:05:23 JST公開、生成d1e801f7。端末操作は省略指示に従い実施せず。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.27.5

2026-11-13 追加機能一覧・説明文・更新履歴改善（公式Release候補）: Haiagaru設定トップと更新履歴へ「追加された機能をすべて見る」を追加。既存22コントロールの目的別設定・短い説明と、過去の累積ソースにある追加20項目の説明を別画面で表示。各版は設定が上、詳しい更新内容が下となり、過去版の全差分の繰り返しを省く。公開文「最適化」とアプリ内の詳細を分離。版別・説明188／履歴・一覧22項目成功。先行の通常Lint/R8 build3m54s成功、追加画面を含む最終ビルドへ進む。端末操作は省略指示に従う。

2026-11-13 更新履歴の機能設定表示（公式Release候補）: 各版の開閉内を機能スイッチ／設定ボタン→更新内容の順に変更。変更版にも対応する既存設定を表示し、最新の修正対象の22コントロールも表示。複数版の同じ設定はattach時のSharedPreferences監視で同期し、detachで解除、同期による再保存・副作用は抑制。公開説明の「最適化」は維持し、アプリ内の詳細説明を別に用意。版別144／履歴19項目成功、新規native hookなし。端末操作は省略指示に従う。

2026-11-13 Haiagaru 1.27.4公式Release公開完了: 利用者指定に従い、GitHub Release／Morphe JSONの更新内容は「最適化」のみ。最終ソースのRelease CI43366452480（Release／Attest）とBuild43366452389成功。公開6assetのSHA256がGitHub digestに一致、master/mainの両JSONフィード計4経路の全プロパティ一致を確認。draft=false／prerelease=false、2026-11-13 13:38:50 JST公開、生成7684fb80。端末操作は省略指示により実施せず。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.27.4

2026-11-13 最適化（公式Release候補）: サムネイル取得の既存経路を最適化。公開時の説明は利用者指定で「最適化」のみとし、既存release-notes-generatorの日本語headerから生成することをダミーコミットで確認。ホスト36項目・既存画像抽出46項目成功、初回の通常Lint/R8 build3m38s成功。書式と文字コードの最終調整もホスト確認済み、最終ソース全体はmaster Release CIで再コンパイルする。新規native hook／保存データ変更なし、端末操作は検証省略指示により実施せず。ローカル証跡build/opening-post-build.log、build/edge-first-post/bounded-live-check.json。

2026-11-13 Haiagaru 1.27.3公式Release公開完了: 更新履歴をHaiagaru設定トップの共有・読み込みより上へ配置し、一括オンオフ欄を廃止。22コントロールを版ごとの開閉内へ移し、既存設定リンクの入口を保持。エッヂ・オルグ板のHTTP正規化URLを標準providerで分類し、爆サイ等と同じサイト別項目に表示。過去37種類の英語コミット説明を日本語化し、今後の公開文は既存generatorの日本語headerのみから生成。版別231／履歴19／分類49項目成功、公開文generatorの英語ダミー除外試験成功。初回Lint/R8 build4m2s成功、最終ソースのRelease CI43363586596のRelease／Attest成功。生成f41000e5、正式版draft=false／prerelease=false、公開6assetのSHA256一致、master/main両JSONの全項目一致と追加20／変更修正35項目を確認。端末操作は省略指示に従い実施せず。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.27.3

2026-11-13 更新履歴の配置・版別設定と標準サイト分類（公式Release候補）: 更新履歴をHaiagaru設定トップの共有・読み込みより上へ移し、旧一括オンオフ欄を撤去。既存22コントロールを追加・拡充版の開閉内に配置し、安定版／devの重複を防止。エッヂ・オルグ板はnative BoardIDのHTTP正規化にprovider条件を合わせ、爆サイ等と同じ標準分類へ。取得HTTPS／保存ID／任意グループ設定は維持。版別231・履歴10・分類49項目成功、新規native hookなし。実機操作は検証省略指示により行わず。詳細docs/history-options-site-groups-20261113.md。

2026-11-13 Haiagaru 1.27.1公式Release公開完了: エッヂの無題カテゴリ補正・オルグ板への表示名変更・共有NG初期報告数2と既存1の一度だけの移行を公開。移行49／条件判定98項目成功、通常Lint/R8 build3m10s成功。新規native hookなし、端末操作は利用者指示により省略。dev Release43357246418／master Release43357840013とBuild43357840058成功。正式版draft=false／prerelease=false、配布6assetのSHA256がGitHub digestと一致、Morphe JSONの追加20／変更修正32項目とmaster/main両JSONフィード全項目一致を確認。生成a8b9fa5d、https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.27.1

2026-11-13 共有NGの必要な報告数（公式Release候補）: 初期値2へ変更し、既存1／不正値は一度だけ2へ移行。2以上・有効状態・例外を保持し、移行後の手動1設定も維持。移行49項目成功。既存native hook／サーバーの票数は変更せず、端末検証は利用者指示により省略。エッヂ・オルグ板修正と同時公開予定。

2026-11-13 エッヂ無題フォルダ・オルグ板（公式Release候補）: BBSMENU変換が見出しとリンクを同一行へ出し、nativeのリンク優先パーサーでカテゴリが欠ける経路を修正。既存の空／無題カテゴリは表示データでエッヂへ補正し、板ID・保存ログを保持。kenmo.org／00c.orgのprovider・サイト別グループをオルグ板に統一。旧名／ドメイン検索・設定リンクも維持。BBSMENU57・検索49・設定リンク66項目成功、Lint/R8 build3m10s成功。新規native hookなし。詳細docs/edge-folder-org-20261113.md。

2026-11-13 Haiagaru 1.27.0公式Release公開完了: devのCI43351733875とmasterのCI43352522562がRelease／Attest成功。追加20項目の下に変更・修正29項目を置いた、1.24.1以降の安定版全差分をMorphe用descriptionへ反映。公開JSON2個の全49項目・バージョン見出し・配布URL・GitHub digestと、master/mainの両フィード4経路の1.27.0を確認。main rawの初回キャッシュは再取得で解消。正式版prerelease=false／draft=false。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.27.0

2026-11-13 設定検索・ﾜｯﾁｮｲ検索・更新履歴（公式Release候補）: 設定名を変えず、本体／Haiagaru検索へ別表記を適用。ネイティブのOR検索で共通のﾜｯﾁｮｲ見出しだけに一致する不具合を、識別文字列を含むAND条件で修正。設定トップのバックアップ直後にHaiagaru更新履歴を追加し、版別開閉・安定版／dev切替・GitHub取得へ対応。Morphe用には.releaserc生成元へ安定版1.24.1からの全差分を日本語で記載。別表記37・検索305・履歴10＋新文面10項目成功、3版の設定検索モデルと元レジスター形式を照合。詳細docs/settings-search-history-20261113.md。

2026-11-13 Haiagaru 1.26.0公式Release公開完了: 更新履歴内のMarkdownを版／節／箇条書き／リンクとして表示し、機能設定をアプリ・表示・画像／動画・NG・履歴／投稿に分類。同じ設定値を各Haiagaruカテゴリへ置き、設定履歴側の保存先も機能本来のSharedPreferencesへ統一。未設定のエッヂ・けんも板・爆サイ・ふたば・あにまんを初期ON、既存のサイト別OFFは保持。エッヂ板一覧は公開ページを直接BBSMENUとして読み、けんも板はkenmo.org/00c.orgのBBSMENUを標準providerへ追加。動作確認・実機導入は利用者指示により省略。既存Semantic Release CI 43280808286がRelease／Attest成功。1.26.0: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.26.0

2026-11-13 外部板のスレ情報ポップアップ日時・無効サイトの一覧除外（公式Release候補）: スレ一覧の板スコープ外で呼ばれるChMate標準日時formatterにも作成日時を渡すフックを追加。キャッシュ上に同一スレIDの板が複数あり作成日時が異なる場合は、誤った値を割り当てず元の値を維持。標準掲示板providerから「使用する」がOFFのサイトを除外。Edgeは現行 `SiteBoardMenuProtocol.KINDS` と標準メニュー経路に含まれる。通常Lint/R8を含む `:patches:buildAndroid` 成功（2分40秒）、作成日時21項目、191/226/242のパッチ適用とnative hook/register保持検査成功。Mi Note 10/Android 11 (`d5497008`) の `reporter242` へ既存署名一致で `install -r` 成功。端末からpullしたAPKのSHA256は候補と一致、`firstInstallTime`保持、HomeActivity表示、新規crash bufferに該当fatalなし。詳細は `docs/android-installations.md`。

2026-11-11 プレ候補追加検証: ローカル dev 差分で :patches:buildAndroid の Lint/R8/MPP ビルドが成功。ホストは画像抽出30、あにまん234、外部板51項目PASS。実サイトのあにまん category32/category9・ふたば img/may レスおよびエッヂ1レス目画像を検証。Mi Note 10 実機の隔離191 APKで Frida read-only 計測を実施し、img/may の画像取得・実描画、エッヂの画像URL取得21件の試行とサムネイル装飾10件を確認。画像のないスレは通常表示。あにまん例示レス、監視通知DAT／遷移、サイズバー実操作、226/242の最終差分は未検証。エミュレータ未使用。ログ・画面はローカルの build/thumbnail-diagnostics/ に保存。

2026-11-11 検証用プレ候補: あにまんのYouTube／XカードURL・arc画像・URL／履歴経由板判定、ふたば／爆サイ件数・「ねこ」板、記者ID／スレ名の期間検索とNG、監視通知DAT／対象レス・2／3時間／任意期限、191書込後更新、板別のスレ一覧画像表示（実験）と24〜96dpバーを統合。Lint／R8 buildAndroid、191／226／242パッチ・命令保持検査、検索32／画像ルール15件の試験成功。候補MPP SHA256 f8709515e3d5e5e978fe4978e1d165f2f9330485a65f1dab68552117a356f0a3。Mi Note 10実機（d5497008）で3隔離APK導入Success、191設定画面／切替、226／242 launcher起動、crashログ空。実レス画像、サイズバー実操作、通知DATと対象レス遷移、全経路の通し操作は未確認。即時プレ公開要望に従い未確認範囲を公開文へ明記。既存アプリ／データは維持。配布は既存Semantic Release CIで行う。詳細 docs/android-installations.md と非公開 build/local-development-records/thumbnail-20261111-installations.json。


2026-11-04 共有NG再利用/SAF候補を実機191更新: 利用者の導入指定、730eae72/XIG05の既存jp.co.airfrt.android.chMate.haiagartuへ同一署名install-r Success（22:02:24 JST）。台帳と端末旧APK署名一致、native NG hook検査PASS、導入後APK hash一致、HomeActivity cold起動ok、新規対象fatalなし。APK SHA256 11a058d42ef655e4f21a1977db8b45c8de7b8b70478867562172538f08fefe2b、MPP d4428ce794f1b1ef457038ba9f52b13417ce4cbd070cec26de2e636b38729000。firstInstallTime保持/アンインストール・データ消去なし。SAF実選択/共有NG表示・速度未確認、公開なし。台帳とdocs/incremental-shared-ng-saf-20261104.md。

2026-11-04 再表示共有NGの入力/判定再利用・SAF保存先再選択（未公開）: 利用者の新着だけ判定と任意フォルダ変更要望。shared-only経路で191/226/242 raw入力をimmutable index専用のcontent cacheへ、同条件/同内容のHTML/Input作成を省略。最大4096件/キー400万文字、条件/除外更新でindex置換、本文変更/追加分は再評価、regex非一致はtimeout可能性のため再評価。標準/プログラムNG連鎖は維持し必要時preview準備。host追加3017/index10306/regex17/除外263成功、通常Lint最終build3m4s、MPP CRC/cache/SAF extra同梱成功。自動backupは固定先なし、前回URIを渡さない再選択ボタン・無効grantのhint除外・primary直下ラベル・tree確認を追加。候補build/haiagaru-incremental-ng-saf.mpp。Android判定/SAF保存取消/速度未確認、APK生成/導入/公開なし。docs/incremental-shared-ng-saf-20261104.md。

2026-11-04 検証用プレ1.23.0-dev.12公開・配布検証完了: 実装d6c5f61、Semantic Release CI41827274812のRelease/Attest success、生成5cdb378をdevへFF。2026-11-04 21:19:47 JST、name=1.23.0-dev.12（検証用）/draft=false/prerelease=true。公開6asset size/digest/SHA256・MPP/ZIP CRC・NgPlainTextCacheSettings/容量key/前版検索・URL・AA同梱、作業環境パス不在確認。MPP SHA256 9946d955a96b9e77d8bceef0def998f8e73c6d73988df37cc4a1cfe833b3f6d6。dev両feedはdev.12、master/main両feedは正式1.22.1維持。任意3ZIPはdev.9と同一。静的/検証用方針で端末の基本動作・設定操作・速度未確認を公開冒頭明記。公開MPP再適用/端末導入/GAS変更なし。build/release-1.23.0-dev.12-verify/verification.json、docs/shared-ng-input-preparation-20261104.md参照。

2026-11-04 共有NGテキスト再利用の上限設定（未公開）: 利用者の任意指定要望でオンライン共有NGへ再利用設定を追加。件数/容量（入力+変換結果のUTF16文字数）を0〜最大int、初期512/1000000。どちらか0で無効、保存で即configure/LRU縮小・初期値入力復帰・キャンセル無変更。programmable-ng prefsで既存backup設定カテゴリ対象、呼出しごとのprefs読込なし。host5020成功（上限0/再有効化/縮小/最大int/変換中無効）。Android設定操作/backup往復/速度は未検証。docs/shared-ng-input-preparation-20261104.md参照。

2026-11-04 共有NG有効時のHTML入力準備を追加最適化（未公開）: 利用者のgreta.5ch.io/poverty/1793682328でdev.11でも重い報告。全レスのHTML→plainを最大512件/入出力合計100万UTF16文字の内容キーcacheへ（変換中lockなし、NG判定結果は保存しない）。226はflag確認時responseDataで本文/名前再変換していたため既存l番号だけ取得へ変更、hookの型確認済み。共通変換は191/226/242。cache5014・index10306・regex17・除外263成功。通常Lint build2m21s、MPP CRC/cache同梱成功。候補build/haiagaru-shared-ng-input-preparation.mpp。端末Html/実スレ/起動描画/速度・改善未確認、APK生成/導入/公開/GAS変更なし。docs/shared-ng-input-preparation-20261104.md。

2026-11-04 検証用プレ1.23.0-dev.11公開・配布検証完了: 共有NG大量文字列検索f28f244とURL遷移432052bを既存Semantic Release CI41823578007で公開、Release/Attest success、生成01ce123をdevへFF。前回タグpushのGitHub障害から回復し、API name=1.23.0-dev.11（検証用）/draft=false/prerelease=true、2026-11-04 20:51:17 JST公開。公開6asset size/digest/SHA256・MPP/ZIP CRC・NgLiteralMatcher/URL経路helper/AA class&hook同梱・作業環境パス不在を確認。MPP SHA256 8a4a7201b4647f8c0a0cb3b3ad40b8619fed33370ace207b84225e6542e3d472。dev両feedはdev.11、master/main両feedは正式1.22.1維持。任意3ZIPはdev.9と同一。静的/検証用指定に従い端末の基本動作/クラッシュ/実速度未確認を公開冒頭明記。公開MPP再適用/端末導入/GAS変更なし。build/release-1.23.0-dev.11-verify/verification.json参照。

2026-11-04 NG多数スレの共有通常文字列検索を最適化（未公開）: NGWord数だけ全文contains走査する経路へNgLiteralMatcherを追加。8語以上はUTF16 Aho-Corasick、少数/200000文字超は従来検索。名前/tripも共通適用。board/票/除外/失効/正規表現/標準NG/連鎖の意味は保持、191/226/242共通extensionのみ。literal等価95552・index10306・regex17・個別除外263成功。ホスト合成2000条件/非一致5500UTF16/1000回は2225.991→19.9041ms（Androidや遷移時間ではない）。通常Lint build2m21s、MPP CRC/matcher同梱成功。候補build/haiagaru-shared-ng-many-rules.mpp。端末動作/実速度/標準NG多数の主因は未確認、導入/公開/GAS変更なし。docs/shared-ng-many-rules-20261104.md。

2026-11-04 スレURL修正プレ公開はGitHub障害で未完了: 実装432052bをdevへpushし既存Release CI41818640185実行、Semantic Releaseのgit push --tagsでGitHub Internal Server Errorによりdev.11タグ作成失敗。生成branch commit3e96489は取得済み。再実行attempt2は古いheadからpublishなしでcompile検証中、最新devからworkflow_dispatchしたCI41820222878でも11:23:39 UTCに同じタグpushのInternal Server Errorで失敗。生成98861c4をFF取得。dev.11 Release/APIとtagは404、asset検証未実施。CI生成feed/versionはdev.11を指すため配布可能と判断しない。生成ファイル/タグを手動編集せず保持。ログbuild/thread-navigation-release-failure.log・thread-navigation-release-dispatch-failure.log。コードbuild成功/host87と公開失敗は別。GitHub復旧後に最新devから既存release.ymlを再実行し、release/assets/feedを検証する必要がある。

2026-11-04 本文中スレURL遷移の90日判定を修正（未公開）: 191報告URL egg.5ch.io/android/1784210927 は約110日前で、残っていた90日超の遷移前DAT取得/itest書換え条件に一致。現行hostは年齢で前置取得せずnative画面先行へ、既存DAT workerのarchive fallback保持。閉鎖旧サーバー/2ch.net・Talk/VIPの復旧は維持。191/226/242共通extensionのみ、新規hookなし。host87成功、通常Lint build2m30s、MPP CRC/helper同梱成功。候補build/haiagaru-thread-link-navigation.mpp SHA256 3c7236f905ad3d770f7e4054dc2eac09a801719d2a860ebb8a3065cd25c50edd。APK生成/端末導入/リンクタップ実時間/公開/GAS変更なし、実端末での主因確定・改善は未確認。docs/thread-link-navigation-20261104.md参照。

2026-11-04 検証用プレ1.23.0-dev.10公開・配布検証完了: 実装2cfe5d3、Semantic Release CI41813804375のRelease/Attest success、生成347c58bをdevへFF。API name=1.23.0-dev.10（検証用）、draft=false/prerelease=true。公開6asset size/digest/SHA256・ZIP/MPP CRC・AA最適化class/hook同梱確認、作業環境パス残存なし。MPP SHA256 8b4b57e1af16e4d0c1549a4b4ecb8c6b9b24bede2da6a0dd41f007a7a6903a29。dev両feedはdev.10、master/main両feedは正式1.22.1維持。任意3ZIPは公開dev.9と同一。静的/検証用公開指定に従い、端末起動/本文/画像/設定切替/速度未確認・遅延主因未特定を公開冒頭明記。公開MPP再適用/実機導入/GAS変更なし。詳細docs/unread-initial-display-work-20261104.md・build/release-1.23.0-dev.10-verify/verification.json。

2026-11-04 未読最適化226/242追加確認（未公開）: 両版の未パッチ本体AA判定も191と同一文字範囲/比率と確認し、固定ownerへ同じ最適化を追加。3版ともnullのみ保持したnativeへ委譲。通常Lint build1m11s、最終3版適用/署名/元命令・register/null分岐検査成功。原本bytecode限定評価は各70326件一致、Java参照296911+null再成功。最終MPP 7f33fe3d952958748119cc22f565afe695f878ec31cb75e9d0037d149b6914df、CRC正常。追加症状は「初期設定は開くまで、最低限構成は開いた後」「本文待ち/操作のどちらかは不明」であり主因未特定。端末導入・実描画/速度・公開なし。docs/unread-initial-display-work-20261104.md参照。

2026-11-04 未読多数スレの本文表示前処理を静的最適化（未公開候補）: 利用者がfilter拡張OFFでも遅いと補足し本体最適化を許可。原因断定せず、countsOFFで全レスURL分類/件数用HTML変換、件数/人気popup/directすべてOFFでnative人気snapshotコピーを省略。modern snapshotに無効時raw通過、ONで再構築・遅延集計。191本体AA判定へ同一結果の早期確定、元命令保持。人気host7/AA等価296911+null成功、通常Lint build2m14s、191最終適用/署名/元命令・wrapper register検査成功。候補MPP 930c13adaba1462d7bdc06424391474d17dd7f8d48bb6409cf7e8e39e47e3b77。226/242最終適用・端末の速度/描画/切替/導入・公開は未実施。詳細docs/unread-initial-display-work-20261104.md。

2026-11-04 検証用プレ1.23.0-dev.9公開・配布検証完了。実装966f66e、Semantic Release CI41801477930/Attest success、生成c2a78ebをdevへFF。API name=1.23.0-dev.9（検証用）、draft=false/prerelease=true。公開6asset size/digest/SHA256・CRCと除外tag/本文cache修復ラベル同梱確認。MPP SHA256 9ca0276515379f619be52ae67042c7d57e6fa937f4229cf7400149f83757bf82。dev両feedはdev.9、master/main両feedは正式1.22.1維持。ユーザーの静的/検証用指定に従い、最終端末導入・実ZIP往復・板移行/常設filter/cache修復/速度未検証を冒頭明記。先行共有NG3版操作試験とは区別。実機/GAS/投稿変更なし。詳細docs/pinned-filter-board-backup-20261104.md・build/release-1.23.0-dev.9-verify/verification.json。

2026-11-04 常設filter/既復元cache手動修復/板お気に入り/native設定backup（未公開候補）: 表示復帰/overlay detachedを描画前に検出し250ms制限で復旧、必要時のみbringToFront。設定に本文cache整合修復（履歴退避・worker・再起動後巡回、本文自動取得なし）。snapshotにboards追加/通常復元で既存flag/orderのみ/不足分同期既存優先。標準prefs許可リスト固定の3版ownerを特定、package変更に一致する保存名へ定数1個置換。共有NG先行修正保持。通常Lint最終build3m14s/CRC正常、最終MPP build/haiagaru-backup-filter-fixes.mpp SHA256 d921a3e5d964c15c01812322c7ba7ed4533fa703d4935100f378d535e76b5388。先行candidate3版適用・native設定名定数以外命令/register/offset保持成功、最終候補APK導入/ZIP復元/症状解消未確認。詳細docs/pinned-filter-board-backup-20261104.md。

2026-11-04 共有NG除外の標準一覧へ変更（未公開候補）: dev.8でもcheck不可の追加報告。2入口をnative AlertDialog/ListView/CheckedTextViewへ、ID基準選択/bind checked/clear再構築でCompose変換を回避。通常Lint build2m21s・3版適用/署名照合更新。親検証menu実タップ→本番handle/dialog、チェック右端/文字の実表示/保存、12条件検索/隠れ保持/再表示成功。検索15/UA21各版、新規app crashなし。設定/static/network復元・AVDデータ保持停止。実スレ長押し起点とは区別。UAは14/15/16を本番設定で再確認、4.0.3は移行判定のみ。実機未接続、利用版/画面質問中。詳細docs/shared-ng-native-choice-20261104.md・導入台帳。

2026-11-04 検証用プレ1.23.0-dev.8公開・配布検証完了。実装7c78146、Semantic Release CI41787507505/Attest success、生成2edac33をdevへFF。API release name=1.23.0-dev.8（検証用）、draft=false/prerelease=true。利用者の静的修正・検証用公開指定に基づき、build/host97成功と実DB/表示/crash/速度未検証を冒頭へ明記。公開6asset size/digest/SHA256・CRC・RestoredThreadCache同梱確認。MPP SHA256 c2daef1db7bf4d69733daebbeb7af05972664d0e833440a2b6bbc5e2998426a6。dev両feedはdev.8、master/main両feedは正式1.22.1を維持。公開MPP再適用・端末導入なし。詳細docs/thread-open-restore-static-20261104.md・build/release-1.23.0-dev.8-verify/verification.json。

2026-11-04 静的修正候補を検証用プレ公開へ: 利用者が「プレリリースして（検証用）として」と明示。端末検証省略の静的修正指定は維持。公開title/headerへ検証用、host97/build成功と実DB/表示/crash/速度未検証を明記。.releaserc既存github pluginのreleaseNameTemplateで今回dev.8だけ検証用suffix。既存Semantic Release CIで公開し、正式1.22.1維持。詳細docs/thread-open-restore-static-20261104.md。

2026-11-04 スレ取得遅延の静的修正候補（未公開）: 利用者が静的に一回修正を指定。提供ZIP組合せ45 DAT欠落/正res_count、39件が191 native巡回省略の数値条件に一致。復元完了後に対象行のDAT欠落/空のみres_count=0へ整合、既読/サーバー数/マーク保持。ZIPはDAT展開後に遅延実施、JSON/不足分同期も対応。URL正規表現の再コンパイル/同一ループの設定再読込を削減。host97成功、通常Lint build2m13s/MPP CRC成功、ローカル候補build/haiagaru-thread-open-static.mpp SHA256 0d28771daeab8b3fec9a0471bdadbdfd4e8600f6499f6524d5fcad3178fe1847。修正後の端末計測/導入/公開はしない。詳細docs/thread-open-restore-static-20261104.md。

2026-11-04 プレ版1.23.0-dev.7公開・配布検証完了。実装ca057c7、Semantic Release CI41782635101/Attest success、生成bf6a23bをdevへFF。draft=false/prerelease=true。公開6asset size/digest/SHA256・CRCと標準Android14 UA文字列同梱を確認。MPP SHA256 96c066a6bd73f78a207cc653374b8740977febbdbb753de0a6906600f68cba5a。dev両feedは1.23.0-dev.7、master/main両feedは正式1.22.1を維持。旧出荷4.0.3のみ移行、15/16/独自UA/ON-OFF保持。3版各21項目/host19成功、新規app crashなし。設定/ネットワーク復元・AVDデータ保持停止。実機/GAS/投稿なし。詳細docs/ua-android14-20261104.md・build/release-1.23.0-dev.7-verify/verification.json。

2026-11-04 標準テンプレート更新（プレ公開準備）: BrowserUaTemplatesの4.0.3を14へ、旧出荷文字列だけresolve移行。15/16/独自UA/ON-OFF保持。新規bytecodeフックなし。通常Lint build2m19s/host nativeidentity19、3版適用・署名照合更新と各21項目成功。起動/設定menu/移行/HTTPヘッダー保持、新規app crashなし。設定/ネットワーク復元・AVDデータ保持停止。詳細docs/ua-android14-20261104.md、導入台帳。次に既存Semantic Releaseでdevプレ公開。

2026-11-04 プレ版1.23.0-dev.6公開・配布検証完了。実装2560d34、Semantic Release CI41780370219/Attest success、生成47d9882をdevへFF。draft=false/prerelease=true、公開6asset size/digest/SHA256・CRC、ChoiceList/ThreadWatchManagement/期限フィールド同梱を確認。MPP SHA256 96db5182d471879b2b994c81b5c6004cbef862ec111aeadff157587007625f28。dev両feedは1.23.0-dev.6、master/main両feedは正式1.22.1を維持。VPN任意ZIPは1.21.1と同一。3版で実checkbox/文字チェック表示・保存、検索15/履歴48、通知22/設定9/返信11/backup40/native order10、監視一覧実タップ10操作成功。元命令保持・host115、新規app crashなし。設定/権限/表示/ネットワーク復元・AVDデータ保持停止。実機/GAS/投稿は変更なし。長押し通し試験は自動承認拒否のため未実施、直接本番dialogで検証。詳細docs/shared-ng-redraw-watch-management-20261104.md・build/release-1.23.0-dev.6-verify/verification.json。

2026-11-04 共有NG再描画・通知監視管理・ツールバー保存順（プレ公開準備）: 内部true/実表示falseを191で再現、Dialog revisionを子描画へ伝達しChoiceListを条件ID基準へ。個別通知優先/監視一覧/新規初期7日期限/保守的dat落ち停止/期限backup追加、共有IDなしでも保存順適用。通常Lint build2m27s・3版署名照合更新。各版通知22/設定9/返信11/backup40/native order10・監視実タップ10操作成功。共有NGcheckbox/文字の実表示と保存・検索15/履歴48成功、native元命令保持、host115、新規app crashなし。権限/設定/ネットワーク復元・AVDデータ保持停止。詳細docs/shared-ng-redraw-watch-management-20261104.md。長押し通し起動は自動承認拒否のため未確認、直接本番dialogで検証。次に既存Semantic Releaseでdevプレ公開。

2026-11-04 プレ版1.23.0-dev.5公開・配布検証完了。実装10e18d9、Semantic Release CI41763130598/Attest success、生成96fc798をdevへFF。draft=false/prerelease=true、6asset size/SHA256/digest・CRC・設定キーと対象クラス同梱確認。MPP SHA256 3cd96dd81c3b92e442d727a1dcb5e3f38ec9377e22d44f7bdb2e0af40ce37f9a。dev両feedは1.23.0-dev.5、master/main両feedは正式1.22.1を維持。VPN任意ZIPは1.21.1と同一。証跡build/release-1.23.0-dev.5-verify/verification.json。3版の共有NG実タップcheckbox/文字各切替保存成功、検索9/履歴48成功。実機症状全体の再現は未確認と区別。AVD設定復元/データ保持停止、GAS/投稿/正式Release変更なし。

2026-11-04 履歴対象初期OFF・共有NGチェック直接操作（プレ公開準備）: defaultfalse読込/設定へ統一し保存済み選択保持。Compose ListViewチェック自体へperformItemClick callback追加、行タップとの二重反転なし。旧191/242は文字タップ成功・checkbox semanticsなし、ユーザー症状の全体再現とは区別。最終3版で実response dialogのcheckbox/文字タップ各OFF→ON→OFF/本番保存成功、検索9/履歴48各成功、新規app crashなし。通常Lint build2m20s/3版署名照合更新。docs/shared-ng-direct-checkbox-default-off-20261104.md・導入台帳。AVDデータ保持停止。次に既存CIでプレ公開。

2026-11-04 プレ版1.23.0-dev.4公開・検証完了。実装0b0704c、Semantic Release CI41760677393/Attest success、生成履歴をdevへFF。draft=false/prerelease=true。公開6asset size/digest/SHA256・CRC、showRefreshTargetsInHistoryPopup設定キー/既存対象クラスの同梱を確認。MPP SHA256 d1751efa4f065ae64060b422356e09a55dd584bc6198cac86aacd3211f67f904。dev両feedは1.23.0-dev.4、master/main両feedは正式1.22.1を維持。VPN任意ZIPは既存1.21.1と同一。証跡build/release-1.23.0-dev.4-verify/verification.json。各版47項目成功・AVDデータ保持停止。実機/GAS/投稿/正式Release変更なし。

2026-11-04 履歴対象タブ表示のオプション（プレ公開準備）: showRefreshTargetsInHistoryPopup初期trueを表示・操作と設定profileへ追加。OFFで対象cell全体をGONE、選択中ならスレへ復帰、ONで再表示。登録/更新/HOME対象は維持。通常Lint build2m37s、3版署名照合更新・各47成功、nativeHOME43/51/66メソッド全保持、新規app crashなし。原本build/local-development-records/history-target-option-installations.json、詳細docs/history-target-popup-option-20261104.md。AVD設定を戻しデータ保持停止、次に既存Semantic Releaseでプレ公開。

2026-11-04 プレ版1.23.0-dev.3公開・配布検証完了。実装6dbc55f、Semantic Release CI41757579447/Attest success、生成1c9bf55をdevへFF。draft=false/prerelease=true。公開6asset size/digest/SHA256・CRC、HomeRefreshTargets/Tabs/対象ラベル/更新enqueue同梱・廃止Shizuku不在を確認。公開MPP SHA256 046cbc53a39e7b768ee0d78dc406b536a386d5747ebdcda2d4d8f033f239064f。VPN任意ZIPは既存1.21.1と同一。dev両feedは1.23.0-dev.3、master/main両feedは正式1.22.1を維持。証跡build/release-1.23.0-dev.3-verify/verification.json。HOME対象/★実表示比較3版と履歴各33項目成功、AVDデータ保持で停止済み。実機/GAS/投稿/正式Releaseは変更なし。

2026-11-04 HOME対象スレ/履歴下部・選択表示 検証完了・プレ公開準備。HOME109を既存★108と同じsorterで抽出、登録集合共用。履歴下部のaccent下線/太字/文字色。191catalogアプリloader修正。最終Lint付きbuild32s・3版適用導入、履歴各33/HOME191/226各16・24214＋実表示XMLの対象/★独立比較成功、native43/51/66メソッド命令/branch/register保持、新規app crashなし。DB fixture試験は自動承認拒否で未実行、メモリ入力で完了。242は試験の結果stateへの直接入力を取り違えた一時p2候補を破棄し、正しいp1/native codeのまま再検証。詳細docs/home-refresh-targets-bottom-tabs-20261104.mdと導入台帳。次に既存Semantic Releaseでプレ公開。

2026-11-04 履歴下部配置・選択表示・HOME対象スレ（作業中、未公開）: 利用者追加指示により履歴の5タブを下部へ、選択中はテーマ色の下線/文字色/太字。HOMEの★スレと同じカタログへ対象スレ109を追加、既存FavoriteThreadsフックを共用し102 snapshotから同じ登録集合で抽出、★表示は独立。HOME対象タブの更新は登録だけの本文取得。通常パッチbuild2m23s成功、3版へ適用済み、build/history-bottom-tabs.mppとhistory-bottom-tabs-{191,226,242}.apk。実行時検証はこれから。PC仮想メモリ不足でAVD/署名検査JVMが停止し、AVDをデータ保持・低メモリ・softwareGPUで再起動中。未検証のまま公開しない。scripts/home-refresh-targets-runtime.js（in-memory native row試験）と更新した履歴41項目の試験を準備。現在の公開版はプレ1.23.0-dev.2/正式1.22.1。

2026-11-04 プレ版1.23.0-dev.2公開・配布検証完了。実装a0624fc、Semantic Release CI41745383637/Attest success、CI生成e0e9dddをdevへFF。Release draft=false/prerelease=true。配布6assetのsize/SHA256/digest・MPP/ZIP CRCと新Tabsクラス／enqueueフック／5ラベル同梱、廃止Shizuku不在、VPN任意ZIPが既存1.21.1と同一を確認。MPP SHA256 7599f447cf1c5e73bbfc8f4db35484690644735752f0c17a7f881ee3e258cc16。dev両feedは1.23.0-dev.2、master/main両feedは正式1.22.1を維持。証跡build/release-1.23.0-dev.2-verify/verification.json。検証AVDはWiFi ON/mobile OFFへ戻し、データ保持で停止。今回の実機/GAS/投稿/正式Release変更なし。

2026-11-04 更新対象操作連動・履歴対象タブ（次プレ版候補）: 191具体dispatcherの入口と3版のnative更新ID、標準one-shot巡回schedulerへ連動。選択コピーへの再帰なし・3秒/KEEP重複抑制を保持。履歴はスレ／対象／板／書き込み／画像で同popup内の対象一覧へ。配布用通常Lint付きbuild38s成功、3版適用・署名照合更新。各版popup34・更新11・worker5成功、元命令/register保持、対象app新規crashなし。初期PCメモリ不足/root debug lint失敗、Frida型/enum/nonnullと監視位置の失敗は修正・再検証して区別。先行242タイトル欄の実画面未確認は残す。詳細docs/refresh-target-triggers-tabs-20261104.md、導入台帳。次に既存Semantic Release CIでプレ公開・asset/feed検証を行う。

2026-11-04 プレ版1.23.0-dev.1公開・配布検証完了。Semantic Release CI41673167082 success、生成d44616aをdevへFF。Releaseはdraft=false/prerelease=true、配布6assetのsize/SHA256/digest・MPP/ZIP CRC・DEX・廃止Shizuku不在を確認。VPN任意ZIPは既存1.21.1と同一。dev両feedは1.23.0-dev.1、master/main両feedは正式1.22.1のまま。証跡build/release-1.23.0-dev.1-verify/verification.json。追加利用者要望（スワイプ・ジェスチャー更新対象連動、履歴の対象タブ）を次プレ版へ実装・検証中。

2026-11-04 検索結果日時除外・更新対象履歴（プレ公開準備）: native検索結果タスクの独自日時判定を既存投影へ接続。旧191で本文非一致まで火検索に出る症状を再現、最終191／226／242各48項目成功。実履歴ポップアップの更新対象一覧・native URL復元・選択起動各21項目成功。4m6s通常Lint build成功、3版隔離更新。242タイトル操作のチェックを不透明パネルへまとめたが、報告画面の再確認は未完了（添付429、単独native sheet表示不可、追加診断表示試験が自動承認審査blocked by policy／詳細なしで拒否）。プレ版の残確認として明記。docs/search-results-refresh-history-20261104.md・台帳参照。

2026-11-04 正式版1.22.1公開完了: 修正38dd511をdevからmasterへ通常merge e0bca27。既存Release CI41659758330のRelease／Attest成功、生成コミットをdevへFF取得。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.22.1 、draft=false／prerelease=false。公開6資材のGitHub SHA256 digest／サイズ全一致、ZIP／MPP CRC正常。MPP SHA256 eff72e08ac3789471e5828133d0ccf163f0f8abf10e0b022bfd86f2e6b5101c2、classes.dexあり、Shizuku資材なし。追加VPN ZIP2本は1.21.1とバイト一致。master／main／devの通常・pre JSON計6本は1.22.1・同一MPP URL。最終候補3版のカタログ等各12＋検索9と実タップ／本番保存成功。実機191は原因診断と一時表示補正6欄成功、最終APK実機更新／公式MPPからの再適用は未実施。build/release-1.22.1-verify/verification.json参照。

2026-11-03 共有NG条件確認・除外チェック・したらばトリップ（公開準備完了）: 短い名称とnativeツールバーカタログ／表示・順番設定へ接続。チェック二重反転を修正。実機191のnative名前末尾U+0001がトリップへ混入する原因を確認、表示Identity一時補正で6欄強調成功、保存設定／DAT変更なし。77単体、最終3版各12項目＋実ComposeタップOFF→ON→OFF／本番保存成功、元命令／レジスター保持、crash空、通常Lint build4m27s。最終候補の実機更新なし。docs/shared-ng-toolbar-trip-controls-20261103.md・台帳参照。

2026-11-03 正式版1.22.0公開完了: devからmasterへ通常merge39c10b0、既存Release CI41653052226のRelease／Attest成功。生成1be9ecfをdevへFF取得。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.22.0 、draft=false／prerelease=false。公開6資材SHA256／サイズ一致・CRC正常、MPP 0a52610aff5e1e772d6a8ac967cf2b840d23ab733265bab753be5b945b74af0e。VPN ZIP2本は1.21.1とバイト一致、MPP内Shizuku資材なし。master／main／devの通常・pre更新JSON計6本は1.22.0と同じMPP URL。完成候補各125項目＋例外試験成功、実機導入なし。build/release-1.22.0-verify/verification.json参照。

2026-11-03 板横断更新・返信通知・242タブレット設定（公式公開準備完了）: 191／226／242で各125項目＋例外finally試験成功。実WorkManager、標準通知helper経由の先着優先、同一返信先への別レス、停止／再開、保存／キャンセル／バックアップを確認。通常Lint build3m16s成功、元命令／レジスター保持、crash空。242タブレット設定とセーフモードの実画面確認成功。外部実投稿／実新着／今回の実機導入なし。未変更本文等の再確認は利用者指示で省略。docs/cross-board-refresh-notifications-20261103.md、導入台帳参照。

2026-11-03 読書位置・トリップ・検索強調・Shizuku削除（未公開）: 読書位置のAtomicFile同期を単一背景writerへ移動、直近128件のメモリ保存とスクロール／非表示抑制・定常1秒調査・adapter accessor再利用。191実ListViewで500描画→1調査、scroll100／hidden50→0調査、連続2保存とも非UIスレッド・最終位置保持を確認。トリップ周囲Unicode空白／方向制御文字を除去し、69単体＋191 native model／Android背景色spanで指定コードの全板強調を確認。ただし報告端末の無強調原因の断定／FPS実測／実機再確認は未実施。指定スレをエミュレータで開く操作は自動承認審査拒否（詳細理由なし）のためネットワークなしfixtureへ切替。

実機191の「03」検索画面で日付の黄色強調を確認。絞り込み用header除外とは別の本体色付けへ2呼出し置換を追加し、191／226／242のnative各15項目・単体233項目成功。本文日付は維持。Shizuku任意patch／設定入口／extension／AIDL／provider権限／依存／README案内を削除。最初のAPK適用で古い拡張R8クラス名を使う既存bindingが停止したためMedia3 HTTP source／OkHttp builderの名前を保持し固定ownerへ更新（全クラス走査追加なし）。通常Lint付き最終build2m45s成功、3版適用署名／隔離更新／検索helperの元reg・他命令保持／移行クラス・権限不在を確認。MPP b1616f6c6c8440a11adf162931235d113df8624eb1cc5ad284f10145805c4284。新規app crash buffer空。実機は読み取り専用の画面・APK照合のみ、導入・公開なし。各詳細文書と導入台帳参照。

2026-11-03 共有NG検索・レスから除外 実機導入（未公開）: 利用者の実機導入指示。初回buildはPC nativeメモリ不足で停止、低メモリ再試行で通常Lint付きbuildAndroid成功3m9s、242適用／署名成功。XIG05/730eae72の標準ChMate246を保護し、別package resumefix242 / Haiagaru 検証 242を新規install-r Success。cold起動Status ok、導入後APK全バイト一致、対象新規crashなし。NG除外の実画面操作は未確認、公開なし。導入台帳参照。

2026-11-03 レスから共有NGを個別除外（未公開）: 共有NG有効時のレス長押しへ「このレスに一致する共有NGを除外」を追加。191／226／242通常メニューと242本文シートの既存ResponseArchive経路に接続。選択レス1件を既存sharedReportInputsへ渡し、板・報告数・種類・個別除外・配信停止を含む本番indexで一致する条件だけを背景検索。検索付き選択画面から端末の除外IDへ保存、既存除外保持、キャンセル無変更、スレ再表示案内。一致なしは個人／連鎖NG確認案内。個人NG／DAT／サーバー条件の変更・ネットワーク送信なし。新規263＋既存10,003判定試験成功、Java／Kotlin releaseコンパイル成功。実画面／APK適用／端末導入／公開は未実施。docs/shared-ng-response-exclusion.md参照。

2026-11-03 共有NG個別除外の検索（未公開）: 「チェックした条件を適用しない」に条件／板／種類の検索欄、表示件数・該当なしを追加。条件IDによる編集中の除外集合と表示行を分離し、絞り込みで隠れたチェックと未受信の既存除外IDを保存時にも維持。「戻る」は未保存。ListView／adapterと既存Compose表示で可視行だけ生成。Java／Kotlin releaseコンパイル50s成功、diff検査成功。今回の実画面再検証・APK適用・導入・公開は未実施。docs/shared-ng-exceptions-search.md参照。

2026-11-03 正式版1.21.1公開完了: 未登録NGボタンの条件付き追加をdevからmasterへ通常merge（6b82b73）。既存Semantic Release CI41623476039のRelease／Attest success、生成4db11baをdevへFF取得。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.21.1 、draft=false／prerelease=false。公開6資材SHA256／サイズ全一致・CRC正常、MPP SHA256 b7785af03b77cb8bb057bb2044dfa474dbe50b147b18a97623ffa958028b8132。VPN4ABIは検証済みAARと一致、MPPの作業環境パス残存なし。master／main／devの更新JSON計6本は全て1.21.1と同一MPP URL。候補191／226／242の変更画面各17項目成功、未変更本文／画像／GIF／動画は既存指示で再検証省略。公開CI版MPPからの再適用・実機導入は未実施。検証AVDのネットワークを戻しデータ保持終了。build/release-1.21.1-verify/verification.json参照。

2026-11-03 未登録NGボタンの公開前確認: 通常Lint付きbuild／buildAndroid成功3m57s。191／226／242の別packageへ署名一致更新し各17項目の実UI／元モデル確認成功。入力を未登録・空欄へ変更するとボタンのView自体が0件、登録済みへ戻すと1件、繰り返しても重複しない。既存の削除・確認キャンセル・有効／無効・編集画面終了も成功。新規app crash buffer空。元編集命令保持／既存onResume hookは3版で再照合成功。初回のSystem UI ANRは終了し再試験、試験スクリプトのEditText overload指定を修正。製品コードの追加変更なし。本文／画像／GIF／動画の再確認は既存利用者指定で省略。公式Release指示あり、既存CIへ進める。詳細はdocs/existing-ng-actions.md・導入台帳、build/conditional-ng-*。

2026-11-03 未登録NGの操作ボタン（未公開）: 利用者の追加指定により、ワッチョイ上下4桁の追加画面では登録済み対象がある場合だけ操作ボタンを生成・追加するよう変更。未登録時はボタンを追加せず、入力・一致方式・対象板変更で一致がなくなるとViewを除去。標準画面は既存のtarget未検出時returnを維持。Java／Kotlin releaseコンパイル成功1m7s、diff検査成功。今回の実画面再検証・APK適用・導入・追加Releaseは未実施。

2026-11-03 正式版1.21.0公開完了: 登録済みNGの削除・有効／無効、通知／バックアップ設定復元、通常復元時の残留画面設定、versionCode最大値、同梱ライブラリのビルド情報整理をdevからmasterへ通常merge（8aceb98）。既存Semantic Release CI41606969441はRelease／Attestともsuccess、生成9f9f971をdevへFF取得。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.21.0 、draft=false／prerelease=false。公開6資材のGitHub SHA256 digestとサイズが全一致、ZIP／MPPのCRC正常。MPP SHA256 f9c88871cc3faa3879a9ac1af607845f3e76a08d6210b460b9e04d4bff90f99b、登録済みNGの新runtimeを確認、作業環境の絶対パス残存なし。VPN v2の4ABIは検証済みAARとバイト一致。master／main／devの更新JSON計6本は全て1.21.0と同一MPP URL。最終候補の191／226／242で保存各102＋実UI各13成功、未変更の本文／画像／GIF／動画再検査は利用者指定で省略。公式CI生成MPPからのAPK再適用・実機導入は今回未実施。検証AVDのネットワークを元に戻しデータ保持終了。公開ファイル検証はbuild/release-1.21.0-verify/verification.json、導入台帳参照。

2026-11-03 登録済みNG操作（1.21.0公開済み）: 標準NG編集画面とワッチョイ上下4桁追加画面へ削除・有効／無効を追加。削除確認、条件／板／日時／他フラグ保持、操作後の編集画面終了、変更済み対象の拒否に対応。追加画面の操作ボタンは対象板の直下。固定3クラスへのonResume追加のみで全クラス検出なし。通常Lint付きAndroid build2m50s成功、191／226／242の最終候補で各102保存試験＋13実UIタップ成功。元編集メソッド命令は前候補と全一致、追加hookは各1レジスター3命令。新規crash buffer空。試験条件・送信設定を保護。変更していない本文／画像／GIF／動画の再検査は利用者指定で省略。通知・バックアップ設定／復元残留設定／versionCode最大値の既存dev修正も含め公式公開の指示あり。docs/existing-ng-actions.md・導入台帳参照。

2026-10-26 最新CAPTCHA/計算＋ジェスチャー統合242導入（未公開）: ユーザーが認証側の最新差分も含めた実機導入を指定。主開発先の全差分を通常Lint付きbuild成功5m19s（build/combined-gestures-captcha-c1-build.log）。元確認ページ42/投稿結果と下書き保護27/ジェスチャー36のhost検査、3版native空タブAPI検査成功。242適用/署名/完成APKのタブfactory命令とnative下書きwriter wrapper検査成功。XIG05/730eae72の既存resumefix242へ署名一致install-r Success・データ保持・cold起動Status ok（23:17頃JST、PID3607）。HOME/スレの実native空タブ作成/追加先反転/復元19項目成功。XIG05切断後ADBがMi Note10へ切り替わり、実WebView履歴/新しい3操作の実スワイプ/実認証投稿/最終crash再取得は未確認、他端末は未操作。MPP build/combined-gestures-captcha.mpp SHA256 6A734DA86369A0AC9ED53279B7320A029F76CA6CD089C673A8B86BF389B26742。詳細docs/tool-tab-chmate-gestures-20261026.md・導入台帳、公開なし。

2026-10-26 PR #93操作拡張（未公開）: ユーザーが前回候補を「良さそうです」と確認後、戻る/進む/新しいタブ追加を依頼。同じnativeToolTabChMateGesturesスイッチへ接続。表示中WebView履歴、戻る根で本体タブ終了、設定カテゴリ→一覧、進む根はno-op。新しいタブは実所属HOME/スレペインで本体のtype3空タブ作成APIへ委譲し、本体履歴リンクも保持。36の本番Java/fake Android試験・3版元APKのnative空タブAPI意味検査成功。Java Androidコンパイル成功、配布AndroidビルドはPCネイティブメモリ不足で停止し低メモリ再試行中。前回導入APKは今回拡張を含まない。新規コード/設定説明/試験を主開発先へ保存、PRへpush/merge/公開なし。詳細docs/tool-tab-chmate-gestures-20261026.md。

2026-10-26 PR #93のジェスチャー改善（未公開）: 「追加画面のタブでChMateのジェスチャーを使う」をGENERALに初期OFF/再起動不要で追加、設定共有/初期化/エキスパート/広告だけのプリセットへ接続。本体の閉じる・左/右タブ割り当てを使い、HOME/スレ実所属を解決。各タッチ専用認識器とUP保留/非同期通知後の子CANCEL→本体APIで、古い通知とWebView破棄中の操作を防ぐ。ON中は旧固定/履歴スワイプを停止、戻る/進むをタブ移動へ読み替えない。他の操作は今回未対応。fake Android/認識器による本番Java26ケース、3版の認識器/本体終了API照合成功。並行認証変更で全体build初回失敗のためHEAD df758a3+自分の5ソースを主開発先build配下に分離し、通常Lint Android build5m28s成功。242適用/署名一致データ保持更新/起動と設定ON/OFF保存成功、完成APKのnative factory命令/レジスター検査成功。XIG05通知パネル前面でタブViewが生成されず実スワイプ未確認、試験設定復元/空fixture2タブ除去。新規Javaクラッシュは検出せず、attach前の終了はLOW_MEMORY。191/226実操作/タブロック/本文画像通し再確認は未実施、公開不可のまま。詳細docs/tool-tab-chmate-gestures-20261026.md、導入台帳。PRへpush/mergeなし。

2026-10-26 プレリリース1.13.0-dev.1公開完了: ユーザーの「再検査を省略して公開する」により本文/画像通し再検査の省略を明記、devの5f0d55eを既存Semantic Release CI40247335981で公開。Release https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.13.0-dev.1 、draft=false/prerelease=true、CIとAttest成功、生成4a4e01eをdevへFF取得。配布6資材のGitHub SHA256 digestが全一致、MPP d9ce9dfbb8326c80cc82762718c4112d2175157c0fb891c94fb01ba3de122e18。公開/ローカルdevの更新JSON2本も1.13.0-dev.1と同一download URLで一致。最新正式版は1.12.2を保持。net→io/元確認フォーム再表示/共有記憶順/NGWord-ID任意オプション、謝辞と寄付を本文へ収録。実サイト認証・投稿成功は未確認でその旨明記、公開MPPでの再適用/導入とMorphe端末側カード更新確認は未実施。

2026-10-26 公開前検査省略承認: ユーザーが「再検査を省略して公開する」と明示。今回候補の実スレ本文・画像表示の通し再検査は191/226/242で省略し、既存の基本表示検査と今回の起動/URL変換/オフライン認証画面検査を利用する。241/243端末操作・実krsw/rid認証/投稿成功は引き続き未確認、Release本文へ記載。通常のSemantic Release CIでdevプレリリースを開始する。

2026-10-26 08:40頃 プレリリース準備: ユーザー公開許可、origin/devのdev.2を通常merge ce1670d。通常Lint最終build4m33s成功。軽量191/226/242の完成APK/署名照合更新/起動と各10項目、軽量runtime非混入、226/242新規crash空を確認。公開説明をnet→io/元認証フォーム再表示/NGWord-ID任意設定/記憶共有順へ更新、謝辞/寄付保持、PayPay公開URL HTTP200。実スレ本文・画像の通し再検査は自動審査blocked by policyで拒否されたため、AGENTSの重複省略規定に基づき省略指示を確認中。実認証/投稿も未確認、未push・未公開。

2026-10-26 投稿確認フォーム/軽量版io互換（未公開）: krsw計算認証/CAPTCHAの元HTMLを一時保存して同一HTTPS origin/文字コードで表示する導線追加。送信初期OFF・ユーザー操作・native同一origin Cookie引継ぎ。サイトの「ブラウザ変ですよん/フォーム情報が正しく読めない」はCookie許可後web.reloadがbbs.cgiへフォームなしGETする経路を特定し、元確認フォームの再表示へ修正。操作欄最大55%・説明/Cookie開閉式も追加。通常Lint build3m42s/191適用署名/別検証packageへ署名一致更新・起動成功。Mi Note10 d5497008でオフライン12チェック成功、host39+70成功。実krsw/rid投稿指示あり、指定スレ起動が自動承認審査blocked by policyで拒否されユーザーの手動起動待ち。実認証/投稿成功未確認。軽量版にはnet→io常時ON/保存メニュー移行/初期ioメニュー追加、191完成APKの軽量31クラス/299参照/端末10項目成功。他版今回候補適用なし。詳細docs/board-challenge-lightweight-io-20261026.md・導入台帳。

2026-10-26 外部板認証CSS誤認修正・XIG05検証版更新（未公開）: ユーザー指示でスクショ取得、実アプリjp.co.airfront.android.a2chMate.haiagaru/191の認証先に043044.xyz/test/datas/design.cssが保存されていることをURL pathだけ確認。認証候補/明示入力からリソースと投稿endpointを除外し、保存済み誤URLを再利用せず再設定を促す。設定に通常ブラウザで板を開く入口追加。69判定テスト、通常Lint付きAndroid build4m1s、191APK適用/再構築/署名成功。ユーザー実機導入指示によりXIG05/730eae72の別package.settingsfix191を署名一致install-r Success、データ保持、Home→TabletHome起動PID7461・スレ本文スクショ確認・対象crash空。MPP build/auth-css-fixed.mpp SHA256 0b6302ec22612ff7213a12b7e25a4f5659fa7bba8b799e889f06c141dd992d42、共有順修正/NGWord-ID返信非表示オプションも含む。元の.haiagaruは更新していない。正しい認証フォームURL/認証完了/投稿成功は未確認、認証や自動投稿の実行なし。docs/auth-css-url-20261025.md、台帳参照。

2026-10-25 共有（記憶）の並び順補修（未公開）: 版/具体条件不明の報告に対し、191/226/242の独自Menuがorderを使わず末尾へ追加する経路を確認。記憶共有が設定済み/実menuに存在する場合、既存wrapperの全追加処理後に保存buttons順を実項目リストへ適用。項目/Intent/callback/表示状態を保持、設定書換なし。通常Lint付きAndroid build、114モデルケース、191/226実native各29ケース、完成191APK29ケース成功。242app_processはKilledで原因未特定・実動作未確認。3版APK適用/再構築/署名と元delegate命令/レジスター/分岐保持を検査成功。端末UI操作/実共有送信/導入/公開なし。MPP build/share-order-fixed.mpp SHA256 bbc9ad669d0d95c69ce27ed5b2a0a6b9337c1f552ec8508edbb301b1320cd6bd。docs/remembered-share-order-20261025.md。

2026-10-25 NGWord-ID返信の非表示オプション（未公開）: ユーザーの追加オプション指定に従い「NG・ワッチョイ」に「NGWord-IDへの返信も非表示」を初期OFFで追加。同一NGWordの連鎖/非表示/投稿者IDもNGが有効な場合だけ、同一IDの別レスとその返信/孫返信をnative透明NGマップへ追加。既存の表示用連鎖キャッシュと区別し、参照数計算/一覧除外より前に接続。設定共有/初期化対応、DAT/登録NG書換なし。既存130+追加84ケース、191/226/242の本番フック・元命令/レジスター・分岐到達・実map/アンカー型の検査成功。通常Lint付きAndroid build成功、3版APK適用/再構築/署名成功、完成APK各2分岐が追加hookへ到達することと設定ラベル確認。端末UI未確認/未導入、公開なし。MPP build/poster-hidden-option.mpp SHA256 0aee90ccdff9a65561493aa42f71027ddc9554c5550f2ec8e98c76ed2da29f6a。UA分離ブランチには未統合。詳細docs/poster-id-chain-ng.md。

2026-10-25 追加タブ復帰時の黒画面対策候補（未公開・実機未確認）: 242で選択中のNativeToolFragmentのViewがGONEのまま残る状態を記録済みスクリーンショット/View階層で確認。ネイティブの選択ページ同期後にも選択Viewが隠れている場合、選択ViewをVISIBLEへ戻すフォールバックを追加。通常Lintを含む`:patches:buildAndroid`成功（89タスク、4分52秒）。`patches-1.12.1.mpp` SHA256 `0B1721BDAE126B9B3E8613247166BAEFF4273E14B8BBFEADE593A4093F6B84BE`を242元APKへ適用し、`resumefix242` APK生成・署名検証成功（SHA256 `51B9406EC93F060247B5AFB85B8E2411D0EFB5C6800FD4E5B06AECA4FA1E4B5E`）。XIG05は未接続で候補未導入、実機で修正後のスクリーンショット/復帰確認なし。現在ADBに見えるd5497008はAndroid 11の別端末のため未操作。00:46のnative SIGSEGVはFrida visibility診断中に発生しPC=0/未知1フレーム、因果未確定。00:57/01:04の終了はOS `LOW_MEMORY`（PSS 321/197MB）で、製品コード由来の例外と確認できていない。公開しない。

2026-10-25 Hissi全文ワッチョイの直リンク調査: 過去のHissi切替コミットは日別一覧を走査する経路。既存のHissi URL形式へ全文ワッチョイを入れた公開ページ取得は404となり、ID用直リンクを全文ワッチョイ検索として流用しない。Hissiテンプレート走査経路を維持し、直接検索の追加は未実装。

2026-10-24 必死チェッカー表示と走査間隔（未公開）: 結果画面を「レス／スレ／名前」のタブへ整理し、投稿・一覧の余白と区切り線を独自CSSで調整。必死チェッカー設定にHissi/Kyodemo別の走査間隔（1〜3600秒、初期3秒/10秒）を追加し、実行中の変更と同一ホスト並列走査へ適用。Android通常Lint build成功1分29秒。ホスト検査30項目はSharedPreferencesをstub化したモデル検査で、実UI操作・ネットワーク走査・端末画面確認は未実施。ダイジェスト・APK導入・公開なし。詳細docs/checker-ui-pacing-20261024.md。

2026-10-24 ページ端/下部位置/設定感度（未公開）: 過去ログに最初/最後（総件数不明は最後無効）、下部フィルターrequired位置保持、242 MyLinearLayoutManagerの親クラスk探索、設定専用感度50〜200%を実装。最終通常Lint build成功4分52秒、242署名照合更新Success。ページ/距離モデル10・anchor純Java9成功。実一覧7項目は並行作業cached-wacchoi-toggle242.apk（実baseとSHA一致）でレス752/-492px維持を確認し直前候補と区別。先行試験失敗・プロセス更新あり、全条件完了とはしない。最終照合時点では5554予約のため操作停止。その後のユーザー指示で共有NG予約を解除し、下4桁検索トグルの最終UI確認に使用。docs/pages-filter-gestures-20261024.md。公開なし。

2026-10-24 最新のユーザー指示: 共有NGの調査は後回しにし、「取得済みのスレから検索」の下4桁検索トグルを優先する。共有NG用のemulator-5554予約はこの指示により解除し、下4桁トグルの最終表示/切替検証に使用する。以前の共有NG優先承認・ANR/高負荷の記録はdocs/shared-ng-implementation.mdに保持。共有NGを修正済み/完了とは扱わず、他チャットの実際の停止を強制したとも扱わない。

2026-10-24 エッヂ検索欄/次スレ起動（未公開）: hideSearchFormを直接切替/復帰する画面ボタン追加。次スレ候補の自package implicit掲示板URLをnative ResListActivityへ明示しRelatedThreadsも同様に変更。最終通常Lint build成功3分24秒、242適用/署名照合データ保持更新Success。端末内Intent解決6・検索欄モデル7成功、設定復元、crash空/ANRなし。報告端末実クリック/Compose実表示面積は未確認。191/226共通重複導入未実施。詳細eddi-next-thread-form-20261024.md。公開なし。

2026-10-24 242サムネイル再表示の追加調査（未公開）: FRONTIER114と添付動画で報告、自然発生は未再現。取得済み同URLへのnative d(false)制御試験ではloaded true→false→trueを確認。requery開始とqueued decode開始の二段階の一時状態を抑えるFrida試作で画像保持成功。242限定の同2呼出しguardをパッチ化し通常Lint build成功、APK適用/最終回帰は継続中。stopDownloadUnknownFileSize OFFとの因果は未確定。詳細thumbnail-requery242-20261024.md。191固定フィルター・バックアップ残件を完了扱いにしていない。

2026-10-24 242 devタブレット縦スクロール残像感（未公開）: ユーザー比較1.9.3正常→1.11.1発生。間に追加されたReadingPositionの各pre-drawでanchor反射/PackageManager/URL解析する経路を候補として、version取得のsession cacheと250ms inspection間隔、readingPositionRecovery初期true/再起動確認付きOFF設定を実装。通常Lint build成功3分29秒、端末fps/ON-OFF比較は未実施。60Hz固定コードは検索で見つからず、60Hz専用エミュレータで120fps回復を断言しない。別途242サムネイルpatch適用検査エラーが残り導入・公開なし。詳細tablet-scroll-regression-20261024.md。

2026-10-24 エキスパート設定（未公開・途中）: 独立カテゴリと初期OFFのモード、既存設定リスナー/保存先を共有するカテゴリ選択式UIを追加。通常Activityと本体設定タブに入口、モード値の設定共有、通常カテゴリへ戻る際のView再生成を実装。全機能のruntime任意化は未完了であり既存設定集約と区別する。ThreadRefreshCachePatch等の常時バイトコード変更の監査・切替実装が残る。最終通常Lint build成功3分18秒、MPP B602D02C2A392B32274506E744570654D4CE873C3EF69B4B5A7199D0237C6373。ただし242適用は同時変更のThumbnailRebindPatchのautomatic requery reset検査で失敗、導入/新画面表示/モード副作用検査は未実施。公開/版名変更なし。docs/expert-settings-20261024.md。

2026-10-24 固定下部フィルター再修正候補（未公開）: 報告版191を確認。native保存位置復元が初回measureで一覧高を参照するため、領域予約をglobal-layout後から初期化/再attach時へ前倒し。通常Lint build/署名照合データ保持導入191/242成功。191固定パネル23+初期予約10、242 native移動7+初期予約追試8成功。ただし新着実到着・DAT ON/OFFを含むnative開閉通し確認は未完了。追加native復元試験中に191/SystemUI/Launcher ANRがあり原因未断定、成功扱いせず試験設定を復元して191通常再起動。公開/版名変更なし。詳細pinned-first-layout-191-20261024.md。

2026-10-24 ローカル自動バックアップ（未公開）: ON→OFF/保存先未選択の報告は原因未特定。同期保存・同一treeの別URI表記で管理記録保持・世代整理の重複/消失記録対応・削除失敗警告を追加。純Java24,016、通常Lint build成功、191検証アプリへ署名照合データ保持更新し上書き前後の設定保持/同tree保持5項目成功、元設定復元。実バックアップは作成/削除せず、利用者の設定消失/実providerでの超過は未再現。詳細local-auto-backup-check-20261024.md。続報の固定フィルター初回位置問題は別途調査中。

2026-10-24 正式版1.12.1公開完了: 今回の修正7da6ae7のみをdevへcommit/pushし、masterへ通常merge a28fe67。並行作業のBoardAuthRules/ExternalBoardAuth/VerifyBoardAuthRulesは未コミットのまま保持して公開対象外。既存Release CI39983601471はRelease/Attest含めsuccess、生成b9f3117をdevへFF取得。Release https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.1 、draft=false/prerelease=false/latest。公開6資材digest全一致、MPP a78dade2ca167e4ddfc991c8e14338aa5d9b7d345fdfd3d5cca0298196d012ae、classes.dex確認。master/mainとdev pre JSONは1.12.1、dev stableのraw CDN初回旧値はmanager fresh取得でversionHash1.12.1。main/dev取得URLをfresh logcat確認、MorpheのプレON/登録先を保持しカード/詳細1.12.1を確認。created_at=2026-10-23T16:05:49（offset/Zなし）。謝辞ｵｲｺﾗﾐﾈｵ 様/Red Frame X 様、差分とライブラリ案内、実新着到着条件の未再現はRelease本文へ直接記載。公開MPPでの再適用は未実施、端末検証は直前候補。詳細thumbnail-pinned-menu-20261024.md。

2026-10-24 未公開修正: 242の通常サムネイルbindから強制requeryを分離し、常時下部フィルターを実viewport予約へ変更。長押し下4桁NGの独立設定復活と191旧MenuのOFF除去も追加。通常Lint build成功、最終242へ同一署名データ保持更新、native DEX保持検査・NG設定17・固定パネル23・native移動7・実サムネイル5回同一画素確認成功。報告の実際の新着到着→開き直し条件は未再現で、viewport検査を完全解決確認とは扱わない。191/226導入・全popup回帰・長時間は未確認。公開なし。詳細thumbnail-pinned-menu-20261024.md。

同日の追記: ユーザー希望によりブラウザ必須経路へ既存XPostPreviewTouchと同じ標準Custom Tabs session extraを付与し、対応ブラウザではアプリ内風画面・非対応では通常ブラウザにする。認証画面のWebView化や制限回避ではなくブラウザ自身が実行する方式。native Cookie/SessionIDは送らず別管理を明示。54項目host試験成功。Android buildはJava/R8/Lint処理後のpackageReleaseでmerged_java_res/.../base.jar欠落により失敗（並行作業のbuild変更あり、原因を断定しない）。最新Custom Tabs追記を含む最終build・端末UI検証・導入・公開は未実施で、成功扱いしない。

2026-10-24 外部板のブラウザ必須投稿確認（未公開）: 実機730eae72の書き込みエラーを画面取得し、「計算による投稿確認」「専用ブラウザからは投稿出来ません」「通常のブラウザを使ってください」を確認。https://043044.xyz/krsw/ の公開ページにもJavaScript必須の記載あり。投稿POST・認証計算・Cookie/SessionID変更はしていない。BoardAuthRulesに計算確認の検出と明示的なブラウザ必須判定、クエリ/fragment除去・POST endpoint除外の遷移URLを追加。ExternalBoardAuthはこの場合のみ通常ブラウザの選択導線へ分岐し、従来のCookie連携認証とは区別する。下書き/認証tokenを送信せずnative identityも変更しない。host policy54項目成功、Android最終build進行中（build/board-browser-final-build.log）。新導線の端末UI確認・実際の認証/投稿・APK導入・公開は未実施。先行の242サムネイル/固定フィルターと下4桁NG分離の未コミット変更を保護している。

2026-10-23 正式版1.12.0公開・更新確認完了: 44eb352のGIF/固定フィルターpopup修正と既存dev改善をmasterへ通常merge（1bb85c4）。既存Semantic Release CI39969080861でbuild/6資材upload/Release公開/CI生成ab1bb96/devへの反映まで完了。公開 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0 、draft=false/prerelease=false/latest。公開6資材をbuild/release-1.12.0-verifyへ取得しGitHub digest全件一致、Android MPP SHA256=e255784273e09f541798bad9c514c51c13e7c295edb1a17d9c60ceb16e1c6a49、classes.dex確認。日本語説明・任意ライブラリ案内・確認範囲・謝辞はRelease本文へ直接収録し、専用説明MDは追加していない。

同CIの公開後backmergeがmainの既存merge履歴に対するrebase/non-fast-forwardで失敗、Attestは未実行。配布物のbuild/公開失敗とは区別する。mainへmasterを通常mergeし更新情報を反映（8cef24d）、既存.releasercのbackmergeStrategyをmergeへ変更（eefbb1c）しdev/master/mainへforceなしで同期。workflow_dispatchによる既存Release CI39970344986はRelease/no-new-releaseとVerify project compilesがsuccess、全体success。追加版や手動Release/タグ/asset/生成JSONは作っていない。これを元Releaseのprovenance発行済みとは扱わない。

最終master/main/devのpatches-bundle.json/patches-bundle-pre.json全6URLは1.12.0、created_at=2026-10-23T14:23:59（Z/offsetなし）、同じ公開MPP参照。main2本のCDN旧値は待機後に解消。emulator-5554のMorpheプレON/登録先を維持しfresh logcatでmain/dev実取得、Haiagaru versionHash1.12.0、ソースカードと詳細1.12.0を確認。別ソースMorphe Patches1.48.0はManager内patcher1.15.1に対する2.0.0要件エラーが出ており、Haiagaruとは区別して変更せず。登録先置換・データ消去なし。端末検証は直前の同ソース候補、公開CI版MPPからのAPK再適用と実機導入は未実施。canonicalはdevへ戻した。

2026-10-23 正式公開前監査: origin/devの履歴が整理されており、手元HEADとのtree差分0を確認してローカル旧devを作業ブランチ（dev-before-remote-rewrite-20261023）へ退避、新devをorigin/devから作成し未コミット修正を保持。fetch設定がdevのみだったためmaster/mainの追跡refも現行リモートへ更新。最新正式版998436e（1.11.3）との差分と既存検証記録を照合し、追加ライブラリ案内/確認範囲/謝辞を含む説明を.releasercへ直接作成。新たな公開説明MDは作らない。最終候補226をFridaなしでcold起動し実Part3本文・scroll・サムネイル→167KB/820x1800画像の表示を確認（build/official-image226-final.png）。旧Frida crash/旧Vungle startup ANR以降の新規記録なし。共通Javaの191/242重複操作は省略、全条件の完全解消は断言しない。既存Semantic Releaseでdevからmasterへの正式公開準備。

2026-10-23 GIF自動取得・常時下部フィルターのpopup末尾（未公開）: GIF専用4モードと共有を追加、bounded workerで静止フレーム生成、通常画像/動画と分離。固定フィルターの本文余白だけではnative popup末尾が隠れることを226で再現（重なり126px/padding0）、補助レス一覧にも重なり余白を追加。最終通常Lint build成功、226署名照合データ保持更新、GIF policy27/Android19/実GIF decode・JPEG配信/実native popup9項目成功。popup末尾の実画面も確認。191/242共通重複操作は省略。実機と公開Releaseは変更なし。詳細gif-autofetch-pinned-popup-20261023.md。

2026-10-23 226正式1.11.3リロード位置ずれ報告の確認: AdGuardレス458のカード行が一時測定で欠落する原因を特定。旧gate相当で109px/実表示432pxの差、native復元463/-100→459/-46を再現。既存dev.13のwarm bindで463/-100を保持。公開MPPを226へ署名照合データ保持更新し、最終6項目成功、新規crash/ANRなし。本番追加変更や追加Releaseはせず既存プレ修正の検証として記録。実機固有条件は未確認。詳細reload-card-position226-20261023.md。

2026-10-23 プレリリース1.12.0-dev.13公開完了: 40b8d29をdevへ通常pushし既存Release CI39953713564成功、CI生成9acce8cをFF取得。Release draft=false/prerelease=true、https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.13 。公開6資材のGitHub digest全件一致、Android MPP SHA256=201eab2203b44551c1577609ded749e4648d106f0c0daa8da74d4b0e7f48e2ba、classes.dex確認。dev JSON2本はdev.13、created_at=2026-10-23T12:31:11（Zなし）、公開MPPを参照。mainと最新正式版1.11.3は維持。emulator-5554のMorpheプレONを保持しfresh logcatでmain/dev実取得URLを確認したが、2回更新後もカード1.11.3のままで端末表示反映は未確認。登録先変更・データ消去・生成JSON手修正はしない。公開MPPからの再パッチ導入は未実施、端末検証は直前同ソース候補。公開6資材はbuild/release-dev13-verifyへ保存。

2026-10-23 常時下部フィルター公開前確認完了: persistentBottomQuickFilters（初期false）を追加。191/242各23項目、リモートcb7c7ab統合後の最終242でも23項目成功。本文長押しの下4桁NG画面と内部画像の実表示を再確認。スレ側専用タブ移動は実Activityへのtouchで6画面145項目成功し、旧fixtureの非表示/0サイズViewへの操作を是正。最終242のFridaなし再起動・UI dump成功、crash bufferと/data/anrに新規記録なし。旧候補のVungleProvider起動ANRは原因解決と断定せず履歴保持、最終候補では再発を確認していない。通常Lint build成功。226の共通操作はユーザー許可により重複省略。既存CIによるプレ公開準備。詳細persistent-bottom-filters-20261023.md。

2026-10-23 dev.12公開後・242本文メニューの下4桁NG（未公開）: 本文Compose経路のResponseArchive.handleにID76が未接続だった。handleSuffixNgへ既存リスナー呼出しを分離し、旧popupと共通化。実native itemで修正前false/callback0→修正後true/callback1、実Part3の本文長押し→項目タップ→NGName追加／対象板／-m/EIをFridaなしで確認し保存せずキャンセル。通常Lint build、単体fallback／一回のみdispatch、242既存hook保持検査成功。同一署名照合してemulator-5554のresumefix242へデータ保持更新。起動初回にVungleProvider.onCreate中のstartup timeout記録あり、NG操作前のものだが公開判断では未解決として保持。詳細ng-suffix-body242-20261023.md。先行のスレ側専用画面の左右タブ移動も作業ツリー／候補に保持し、そちらは検証中。191／226・実機再導入、次版公開なし。

同日dev.12公開確認: 既存CI39932756756で生成commit d5cca1c、Release draft=false/prerelease=true。6資材のdigest一致と公開MPP classes.dex、dev raw JSON2本のdev.12／created_at=2026-10-23T09:35:09を確認。MorpheのプレONを維持してfresh logcat取得、main/devの実取得URLとカード／詳細のdev.12を確認。mainの正式版は1.11.2を維持。checker-swipe-tablet-20261023.mdに記録。先行キャンセルCIはタグを作成しておらず、その記述を訂正。

2026-10-23 メニュー分離・高度なNG説明の公開前確認完了: name長押し設定がresponse visibilityも書いていた結合を廃止。本文側はresponseVisibilityへ独立、旧結合値はnative toolbar選択を強制上書きしない。191のname hookはappendLegacyForNameへ分離し、元register/選択レス保持検査成功。226/242 name sheetはnameMenuVisibleを使用。NGの長文説明をfloating labelから分離し、ModelChildrenもsettingsRowsと同じparagraph判定を共用、radio/spinner長文をweightで折返す。最終通常Lint build成功、MPPF4424814...を191/242へデータ保持更新。各32+16のmenu検査成功、242360dpNG画面を保存せず視認、191Part3本文/scroll/内部画像表示/戻り確認。新規crash/ANRなし、226共通重複操作は省略。先行未コミット改善も保持し、既存.releasercに今回の日本語説明を記載。まだpush/公開前。導入台帳参照。

2026-10-23 フローティングフィルター画像（未公開）: ToolbarIcons既存0〜6を移動せずslot7に「フローティングのフィルター」を追加。通常filter画像とは独立、標準は既存filter vectorとlabelを使用。import/resetのinvalidateからmainへ反映し、再起動不要。通常toolbar画像の再起動確認は維持。FloatingFilterButtonは24dp compound iconとlabel/長押しdragを維持。通常Lint build成功、MPP E08AAF84...を242既存検証アプリへ署名照合データ保持更新。合成画像のimport/live/reset12項目と既存floating tap/drag/位置/ONOFF9項目成功、通常filterファイル不変、検証画像削除・設定復元。191/226は共通実装で重複端末操作省略。先行未コミット変更を保持し公開なし。導入台帳参照。

2026-10-23 親OFFで通常入口もスレタブへ（未公開）: ユーザーが「長押し等の通常入口もOFF時に本体スレと同じタブ列へ」を確認。NativeToolTabs.openで専用ビューアの親設定ゲートを撤去。個別画面OFFの別画面指定と、Haiagaru設定の親設定条件は維持し、設定の説明も更新。手動追加/人気レスpopup分離/NG軽量化の未コミット変更は保持。通常Lint build成功、MPP24E2E7FC...で242を署名照合してデータ保持更新。nativefactory静的検査成功、親OFFで上下4桁/全文/IDの4通常入口から実タブ表示・検索語/板・×終了を確認、個別OFFも別途検査。191/226は同じ共通ルートのため今回の重複端末操作を省略し従来候補のまま。導入台帳参照。公開なし。

同日追試完了: 最終191も別設定Activity起点・自動/個別OFFの手動追加9項目成功し、設定復元とテストタブ終了を確認。191/242とも各9項目完了。最終crash時刻は既存03:12 UTCから増加なし、lastanrは起動後記録なし。まだ未公開。

2026-10-23 手動タブ追加・人気レスpopup混同（未公開）: 新規手動経路openManualを自動設定から分離。自動/個別OFFでも全6画面を選べ、同task TabletHomeを追跡し設定からresume後追加。PopularNativeRowsの任意共有レス一致を先頭identity一致へ変更し、既知fullに含まれる短いpopupを保存しない。レス1popupのmode変更・連続popupのfull追い出しも防ぎ、集計はcapture時のdepth/返信数に固定。242実データ再現で修正前161→0、最終修正後161→161。最終build成功MPP E8D7E229...を191/242既存検証アプリへデータ保持更新。nativehook検査成功、人気回帰191/242=30/29項目、242実抽出で標準161がnative一致・直接返信2/本文2一致。最終242別設定Activity起点・自動/個別OFFの手動追加9項目成功。191の手動追加を追試中、226共通重複操作は省略。先行未コミットのNG未読軽量化/ビューア調整も保持。詳細manual-tabs-popular-popup-20261023.mdと導入台帳。公開なし。

2026-10-23 NG未読補正の開閉時追加軽量化（未公開）: HiddenNgUnreadで毎レスのSharedPreferences取得を再利用しbooleanはlive読取。スレ再計算/DAT関連付けで全HOME行のキーキャッシュを消さず、既存の再利用検証を維持。242の取得済みレスとのNG積集合は候補位置を実番号で検証するRandomAccess fast pathへ変更し、欠番/並び替え/LinkedListは厳密走査へ戻す。最終Android build成功、MPP94660408...、191/242をデータ保持更新。nativehook4/8箇所、再計算各8、native未読各7、値191/242=10/15項目成功。226は共通変更で重複端末操作省略。NGなし実profileでは報告ラグを再現せず、合成計測の修正前は並行buildがあったため一般利用速度倍率を断定しない。191のURL渡し起動が環境側に拒否され実スレ開閉通し試験は未完了、迂回なし。先行未コミットの専用タブ/調整ボタン変更を保持。詳細hidden-ng-unread-rebuild-20261023.mdと導入台帳。未公開。

2026-10-23 専用ビューアの調整ボタン・本体タブ見出し（未公開）: 上部ボタン選択に「調整」を追加。旧9bit保存値を変更せず独立boolean初期trueで従来表示を維持し、resumeでON/OFF反映。本体タブの共通NativeToolFragmentへ見出し・×バー高さ32〜64dp（初期48dp）を追加し、全専用画面/設定タブで共用、開いているViewもpreference listenerで即時反映・破棄時解除。背景はComposeと同じnative window/list合成で不透明化し、本体テーマに追従。設定共有にも追加。Android build成功、242既存検証アプリを署名照合してデータ保持更新、native factory静的検査とFrida24項目成功。191/226共通重複操作・全自作テーマは未確認。導入台帳参照。ユーザーの追加質問に対し「新しいタブに追加」は手動追加操作だが現在master ONを要求し、TabletHomeActivity起点を追跡できない設定経路ではトーストになることをコード確認。こちらの既存経路/意味はまだ変更していない。公開なし。

2026-10-23 プレリリース1.12.0-dev.10公開完了: 追加安価修正267150eをdevへpushし、既存Semantic Release CI39900790356がsuccess。CI生成commit272945d、draft=false／prerelease=true、公開 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.10 。配布物6点をbuild/release-dev10-verifyへ取得し全件GitHub digest一致、公開Android MPP72172D57A1EE7C1722E26002175049DFE237B14B199B0D51F8D64D4ED7EC097Eのclasses.dexを確認。公開直後のraw dev JSONはCDNに未公開dev.9が残っていたが、GitHub contents APIと公開assetはdev.10で一致し、待機後に同じraw URLのdev2本がdev.10へ更新された。created_at=2026-10-23T04:32:50（Z／offsetなし）、公開MPPを参照。emulator-5554のMorpheでプレリリースONを維持して更新し、fresh logcatでmain/devの取得URL、ソースカードと詳細の1.12.0-dev.10を確認。登録先変更・キャッシュデータ消去なし。停止したdev.9のタグは履歴として残し、未公開のまま。main/masterの安定版メタデータとlatest正式版は1.11.2を維持。今回CI公開MPPからのAPK再生成・端末再導入は未実施で、端末検証は直前の同ソース候補による。自然発生の表示遅延と長時間再発の完全解消は未確認と案内した。

2026-10-23 安価の多い本文の追加報告対応: 先行Release CI39898097732は停止し、7ca9672／tag1.12.0-dev.9／メタデータ更新のみ残ってRelease未公開。7ca9672をFFで取り込み、生成物・タグを手編集せず次の既存CI公開で整合性を回復する。PosterHighlightの本文装飾を編集不要なSpannableStringへ変更しNoCopySpanの元View情報は継承しない。191／242を最終MPP5BD55CCC...でデータ保持更新し、各16の本文・リンクspan・強調ON/OFF・NoCopySpan保持方針を検査。242の500安価25回処理は修正前746ms→最終再試験233ms。ただし初回最終試験2725msと大きなばらつきがあり一般利用倍率は断定しない。実Part3の>>5から5レスのポップアップを確認、新規crash／ANR時刻増加なし。純粋強調ルール63項目成功。226は同じJava実装でnativehook未変更のため今回の重複導入・操作は許可に基づき省略。実環境の遅延原因全体は未特定。詳細dense-anchor-render-20261023.md、導入台帳。次プレ公開前。

2026-10-23 dev.8以降の公開前最終候補: 人気レスの古い空レイアウト置換を制御再現し、標準抽出を本体出力へ戻した。遅いSnapshot到着でも0件を再集計、直接返信方式を件数表示OFFから独立。242で修正前432→0件、修正後438→438件の保持、0→157件の再集計、本体標準157件一致・直接返信2件を確認。191／226各25・24224の合成人気レス項目成功。追加依頼の非表示NG未読補正はキー／Field再利用、NGなし走査省略、変化なしsorted維持を追加。Frida計測下191の1000回集計でURL解決1005→3回・loop7824→205ms、226153ms・242660ms（通常利用の速度倍率ではない）、native未読不変・行の別スレ再利用チェック成功。242追加NG値15項目成功。設定ホームを通常TopAppBarへ縮小し実画面の検索欄256→160px、重なりなし。

同じ最終MPP3702459B...を191／226／242へ適用し署名照合install-r成功。最終未読hook4／6／8箇所の元命令／レジスター検査成功。通常Lint込みAndroid build成功（3分15秒）。前作業のタブ×（透明背景＋二重縁＋独立48dpヘッダー）、長押し／ID検索の本体タブ経路、長押し個別OFF優先、エッヂ結果pull更新、Hissi HTTP例外、絵文字フォント非同期も保持。タブ入口は3版各25項目、メニューOFF28項目、HTTPS50項目、実pullで表示中条件／ページ維持と重複送信なし、遅いfontがmainを待たせないことを別途検証済み。242最終候補のFridaなしコールド起動・実本文・スクロール・画像を確認し、既存の03:12 UTC ART SIGSEGV／02:47 UTC ANR以降の新規記録なし。長時間・実NG大量データの開閉速度・全自然発生条件は未確認。詳細popular-stale-layout-20261023.md、hidden-ng-unread-perf-20261023.mdと導入台帳。既存.releasercの日本語案内を更新し、次プレは既存Semantic Release CIで公開する。まだpush／公開前。

2026-10-23 プレリリース1.12.0-dev.8公開完了: 全差分コミット0259df7をdevへpushし、既存Semantic Release CI39885815088がsuccess。CI生成コミットb4fb77d、draft=false/prerelease=true。公開先 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.8 。6配布物をbuild/release-dev8-verifyへ取得し全件GitHub digest一致、Android MPPのclasses.dexあり。公開MPP SHA256 9CB9610C1F8E442C31F2CF539CBDFF527D74F51887E4EAAEDCABB47E62E1069E。devのJSON2本は1.12.0-dev.8、raw created_at=2026-10-23T01:47:18（Z/offsetなし）、公開MPPを参照。PowerShellの自動DateTime変換で初回の文字列検査が失敗したが、raw JSONそのものの再検査は正常。emulator-5554のMorpheでプレリリースONを維持し更新操作、main/patches-bundle.jsonとdev/patches-bundle.jsonへのGETをfresh logcatで確認し、ソースカードと詳細に1.12.0-dev.8が表示。更新途中の一時的metadata unavailable表示は再更新で解消。mainの安定版とlatest正式版は1.11.2を維持。ソース登録の置換や公式版への昇格なし。公開CIバンドルでの端末再パッチ/インストールは未実施、公開前候補による検証範囲・残件はrelease-readiness記録と公開説明に記載。

2026-10-23 プレリリース公開準備完了: 最終MPP1734F184...の242で実本文・フィルター高さ/枠・画像長押し→画像一覧→画像表示→戻る→スクロールを確認。Hissiのnativeタブで専用ビューアの見出し・集計削除・表示調整3項目の保存/反映とタブ終了に成功。MEGAの3空入力とhint分離をモデル・Compose画面で確認、認証通信なし。MEGAの初回testはEditableをJS String化して`[object Object]`となるfixture誤判定、CharSequence.lengthへ修正後成功。Hissiの初回testも未マウントのモデルroot.isShownを要求するfixture誤判定で、実際のテストFragmentのcontrollerを直接取得して全項目成功。テスト用空ダイアログ/タブを閉じ設定を復元。最終crash bufferは空、lastanrは起動後記録なし。各3版native hook元命令/レジスタ/分岐保持検査も成功。共通画面の191/226重複操作は許可に基づいて省略。実MEGA認証・NG実削除・全自作テーマ・動画バー実色・長時間・ロック/復元は未確認。`.releaserc`既存headerPartialへ今回の日本語変更案内とライブラリ説明を追加し、既存CIで次プレを公開する。未デプロイshared-ngは配布アプリ機能と案内しない。UA変更の公開記載なし。

2026-10-23 最終候補導入・人気レス追試（未公開）: 最新MPP1734F184...を191／226／242へ適用し、emulator-5554のsettingsfix191／resumefix226／resumefix242を署名照合して導入。全3版の最終APKテーマbridge静的検査成功。人気レス合成native行は191／226各21項目、242は20項目成功。242の実Part3では標準149件と追加集計149件が一致、直接返信ON・ポップアップOFFでも2レスが実際のsnapshotに残り、failure=null。断続的な表示欠落の完全解消は断定しない。件数初期falseの未設定／保存true／保存falseを設定Switchと実効値で検査。191では人気レス合成試験との同時実行が同じ一時設定を更新し初回Switch検査が失敗したため、個別スクリプトに分離して再試験。最終crash bufferは空、lastanrは起動後記録なし。途中にSystem UI待機画面があったがChMateのANR記録はない。画像・変更画面の通し確認と長時間再発確認は残り、公開保留。導入詳細はandroid-installations.md。

2026-10-23 フィルター件数の初期表示をオフへ変更（未公開）: QuickFilterOptionsの実行時既定値と設定Switchの既定値を両方falseへ統一。保存済み値は書き換えず、明示オン／オフを維持する。専用Frida回帰スクリプトscripts/frida-filter-count-default.jsは未設定・true・falseの実効値と設定Switchを検査後、元の設定へ戻す。追加タブ×は191／226／242各11項目のART・実ボタン開閉検査に成功。透明なdialog色を黒扱いして×の背景が読めなくなる経路もwindow/list色へフォールバック。最新Androidビルド成功（89タスク、2分39秒）。MPP SHA256 1734F184CE885639C09DB8B41010C3AF8DA011488FDCDB4A375095BA023E3C6F。最終APK再生成・件数初期値の端末検査を実施中、未push・未公開。

2026-10-23 全差分候補のタブ×を再修正（公開保留）: 191のnative ViewPagerにgetAdapter/getCurrentItemがなく、226/242のnativeページアダプターも旧判定型と異なる不備を検出。画面全体から選択タブを探索する処理を撤去し、押したNativeToolFragmentを渡して191 Activity.e(Fragment,false)、226 ViewModel.a(Fragment,false)、242 ViewModel.b(Fragment)→d(page,false)へ接続。本体のペイン特定・終了・選択更新・ロック確認を使用する。scripts/VerifyNativeToolTabClose.javaで3版元APKのlazy field/getter・終了API・本体ペイン削除への委譲を検査し成功。×の色も本体テーマを使用。全差分MPP再ビルド成功（89タスク、2分20秒）、SHA256 DB057C2458E17273CA0621C1363A183AB6385516BBAF21E33A42D12F56BC487E。直前のテーマ単独段階の82E5...候補を更新。生成名はpatches-1.12.0-dev.7.mppだが公開dev.7とは異なるローカル候補。APK適用・ART実行・複数ペイン/ロック/隣接選択の実操作、191 ANR再発確認、テーマ実表示は未完了。ADB接続端末なし、C空き約433MiB。旧AVD復旧バックアップの承認済み削除は実行環境の自動承認審査で拒否（blocked by policy）され未実施。公開・push・版名変更なし。

2026-10-23 Haiagaru Compose UIのChMateテーマ追従を再修正（未公開）: 先のAndroidテーマ属性方式は、独自Activity/ダイアログの固定Materialテーマを読み込むため不十分だった。NativeThemeColorsのstubだけをパッチ時に置換し、191/226/241/242の本体テーマgetterからwindow/text/primary/dialog/progress/progress-background/listの7色を取得する。各フィールドをテーマJSONキーとの対応で検証し、不一致ならパッチ適用を失敗させる。本体メソッド・命令・レジスターは変更しない。Composeのカード等の全surfaceContainerとtonal色、動画シークバーもnative色へ接続。未対応版は従来のsystem/dynamic色へ戻す。Java/Kotlinコンパイル、4版元APKの意味的アンカー検査（scripts/VerifyNativeThemeColors.java --source）、Android MPPビルド（89タスク、2分32秒）、git diff --check成功。MPP patches/build/libs/patches-1.12.0-dev.7.mpp SHA256 82E5EC1BA9BB854BBB652DD068A840BC6B9CBFC37A84D98D6F851D35B43B7FCB。ローカル候補でありdev.7公開物とは異なる。最終APKへの適用・--patched検査・ART実行と昼夜/独自テーマ/動画バーの実画面は未確認。server/shared-ngの13項目も成功したが、Android未接続・未デプロイのprototypeである。

2026-10-23 人気レス選択時の上部フィルター行消失を修正（未公開）: 人気レス抽出の再構築時、レス番号を持たない構造行も抽出結果に保持するよう変更。フィルター行を含む構造行を落として上部フィルターが消える経路を修正し、適合レスの重複排除と他フィルターとの積集合は維持。回帰ケースへフィルター構造行＋105レスの合成リストを追加し、抽出後も行が残り、適合する103レスだけを保持することを検査する形にした。設定のテーマ一覧・削除ボタンを重複していた「スレを読む」カテゴリから除き、取り込み画面内に統合。取り込みボタン表記を取り込み・削除に更新。上部フィルターボタンは52dpの固定高さと上下余白を設定し、AAのみ高さが異なる／下枠が欠ける表示を防止。`:patches:buildAndroid`成功、回帰テストソースのjavacコンパイル・`git diff --check`成功。実機・エミュレータの画面通し確認、適用APK導入は未実施。公開・版名変更なし。

2026-10-22 必死チェッカーの見出しをスリム化: 専用ビューアの「必死チェッカー · ChMateビュー」ラベルを矢印だけにし、戻るタップ領域を保ったままヘッダーを56dpから36dpへ縮小。Kyodemo・Edge archive・全文検索の見出しは維持。`:patches:buildAndroid`成功、`git diff --check`成功。実機への反映・画面確認は未実施。

2026-10-22 必死チェッカービューア内から表示を調整可能に: ビューア上部に「調整」を追加し、文字サイズ（100〜130%・1%刻み）、レス上下余白（0〜20dp）、上部操作バー高さ（32〜56dp）を変更・即時適用・保存できるようにした。標準値への復帰も追加。Haiagaru設定内の文字サイズ選択も5%刻みに拡張し、設定共有で3値を保持。既存の専用設定画面にも同じ余白・高さ項目を残す。` :patches:buildAndroid` 成功（89タスク）、`git diff --check` 成功。実機操作確認と今回変更を含むAPK導入は未実施。

2026-10-22 ツールバー画像に「★スレのみ巡回」を追加。既存カスタム画像のファイル番号を維持するためToolbarIconsのアクションIDを明示配列化し、FavoriteThreads.TABへ対応。必死チェッカー専用ビュワーでは「スレ立て件数」表示とDOM監視による集計を削除。設定からレス上下余白（0〜20dp）と上部ツールバー高さ（32〜56dp）を調整可能にし、設定共有にも含めた。`:patches:buildAndroid`成功（89タスク）、`git diff --check`成功。エミュレータ／実機の画面確認とプレリリースは未実施。

2026-10-22 プレリリース1.12.0-dev.7公開: `fix: reduce hidden NG unread count overhead`（`533ebb2`）を`dev`へpushし、既存Semantic Release CI run `39789862059`がsuccess。tag `1.12.0-dev.7`、`draft=false`／`prerelease=true`。MPP `patches-1.12.0-dev.7.mpp` SHA-256 `B5621615BDFA427864B23FDD0D63C3EE674E9F3EBA9E6188BD8B3D72D833CE52` はダウンロード後ハッシュと一致。`patches-bundle-pre.json`はversion `1.12.0-dev.7`、created_at末尾に`Z`なし。正式版は未変更。公開先: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.7 。確認上の制限とFridaテスト後の単発SIGSEGVについては直前の追試記録・release-next-prerelease.mdを参照。

2026-10-22 フィルター共存・未読NG集計軽量化の最終追試: `emulator-5554`に最新候補を191／226／242それぞれ適用し、既存検証パッケージを`install -r`更新。全版で起動、純粋計算10項目・合成native row ON/OFF 5項目が成功。242は保存済みスレ一覧を表示。226のFrida native row試験はPASS後に一度SIGSEGV（13:38:21 UTC、RIP 0x320）を記録した。Fridaを切り離した後の通常起動・前面表示は60秒以上再発なし。instrumentationとの因果は未確定であり、完全な無クラッシュ確認とは扱わない。設定UIの同時表示・必死チェッカー新トグルの実操作、開閉時間の実測は未確認。ローカル最終MPP再ビルド成功（`patches-1.12.0-dev.6.mpp` SHA-256 `B9E76E38355F8514B42DD9551431B3CC8E69C978C2BA866ADA9520C8E798B6E1`）。適用APKハッシュと端末情報は`docs/android-installations.md`。未公開。

2026-10-22 フィルター共存・NG未読集計軽量化（未公開）: 下部クイックフィルター表示が上部フィルター行を暗黙に折りたたんでいた条件を削除し、「上部フィルタを表示しない」設定だけで上部行を制御するよう分離。未読件数から非表示NGレスを除く処理は、スレごとのNGレス行番号をソートして保持し、read位置ごとの全件走査を二分探索2回へ変更。NG membership更新時のみ対象のソート配列を破棄。必死チェッカー設定に「上部タイトルを省略して表示領域を広げる」を追加し、設定共有にも含めた。回帰テストへ境界・read位置変更・membership更新時のキャッシュ破棄を追加。`:patches:buildAndroid`成功（89タスク）。MPP `patches-1.12.0-dev.6.mpp` SHA-256 `2A71F4673F0F0B5EDB7EB836EB36323E21480122DF9EECE59F3FEB7A2BE85BA1`。Android回帰テストソースのjavacコンパイル・`git diff --check`成功。実機／エミュレータでの開閉時間計測とUI切替・WebView表示の実操作、APK生成・導入は未実施。未公開・版名変更なし。

2026-10-22 履歴のDAT落ち非表示と人気レス件数の再修正（未公開）: HOME履歴モードIDが191／226では100、242では103である版差を反映し、242の100（お気に入り等）を履歴扱いしない。191／226では人気レスnative Snapshotが先行生成されない場合に、既存`legacyRows`フックで完全な行レイアウトを再捕捉してから件数を集計する。既存の完全Snapshotを短いnative抽出行で上書きしない。Android MPPビルド成功。ローカルMPP `patches-1.12.0-dev.6.mpp` SHA-256 `FDD3CF4AD969A6B9BBB99F9DEBADEE0323A59F9C768ECD792E917E9C4B000E2C`。DAT履歴テスト191／226／242各11項目、人気レス回帰テスト191／226各19項目・242 18項目成功。242実スレ（保存済み361レス）は標準方式126件でnative標準件数と一致、直接返信方式1件。ポップアップON/OFFを含む4組合せで「—」・負数なし。修正版APKを`emulator-5554`の既存検証パッケージへ署名一致を確認して`install -r`し、端末内APKのSHA-256一致を再確認。Fridaの初回履歴テストでテストハーネスの反射呼出し中にSIGSEGVが一度あったため、そのメソッドをスタブ化した回帰テストで再確認済み。公開・版名変更なし。導入記録は`docs/android-installations.md`。

2026-10-22 19:38 JST 検証用下書き1.12.0-dev.6作成: commit `cadf2f1`から既存Semantic Release CI（run `39763985598`）で生成。Android MPP `patches-1.12.0-dev.6.mpp` は6,298,900 bytes、GitHub digest／取得した下書き資産のSHA-256は`2CF570706FD1F7CC7FA157F1C012D430F563754FFE1A0DFED5BDE8AFA1047346`。CIビルドとprovenance attestation成功。GitHub APIで`draft=true`／`prerelease=true`を確認。検証用のためMorphe公開bundle JSON生成をこのCI実行だけ無効化し、公開dev feedが1.12.0-dev.5のままであることをRaw URLから確認。下書きには前版のbundle JSONも添付されるため、検証にはMPPを選ぶ。release設定は`ebffd23`で復元し、`origin/dev`へ反映済み。人気レスは標準方式126件／直接返信方式1件、4設定組合せで失敗・負数なしを確認。「自分」は別の既存検証アプリで実データ1件を確認。更新対策は3版へのパッチ適用・起動を確認したが、新着がある状態の更新通し確認は未実施。公開・プレfeed切替、Morpheからの更新、今回のCI版MPPでの実機適用は行っていない。下書きURL: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/untagged-a515ef2020a970410c63

2026-10-22 dev.5同期後の実機能再確認（未公開）: `origin/dev`の1.12.0-dev.5（`f1a2ccb`）を取り込み、既存の未コミット変更は保持した。作業ツリーから生成したMPP `patches/build/libs/patches-1.12.0-dev.5.mpp` SHA-256 `70FA88D38054CC7CEEC8BCBDFEEBEAD2795DF22F35D66B2CAF7A337C25E26FA9`、242候補APK `build/popular-refresh-dev5-242.apk` SHA-256 `56A6E1617ACF050AB14D5C9D3FE0383AAD7992A1DB01858AB3F3D96EDECF32E8`。`emulator-5554`上の既存`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`のinstalled `base.apk`をpullし候補APKとSHA一致を確認。Part3ではなく同候補に取得済みの実スレで、人気レス4組合せをFrida確認。標準295件、直接返信25件で、ポップアップON/OFFによる件数差なし、全モードで非負・失敗`null`。「—」は再現せず、試験後に設定復元。自分フィルターは、Part3実データ（取得済みレス361件）を保持する別の既存242検証パッケージ`popularfix242`で確認。自分件数1、レス353のみ抽出、解除後に元の369行へ復帰（内訳に構造行を含む）。したがって自分フィルターの実レス確認は別検証パッケージであり、dev.5候補の`resumefix242`上でPart3データを使った再確認ではない。版名・公開状態は変更していない。導入とダイジェストの詳細は`docs/android-installations.md`。

2026-10-22 人気レス「—」・自分フィルターと更新なし再確認（未公開）: 主開発先の最新ソースで`:patches:buildAndroid`成功（MPP `patches/build/libs/patches-1.12.0-dev.1.mpp`、SHA-256 `62214E1C0C7AD2731433FF7C2B11D6AD0F9F562BE4C6264E07C9051537A3640E`）。191／226／242それぞれの元APKへ適用・署名し、`emulator-5554`の既存の別パッケージを`install -r`で更新。すべてHomeActivityまたは既存スレ画面の起動に成功、新規crash bufferなし。242のPart3実スレ（取得済み361レス）ではFridaで人気レス4通り（直接返信判定ON/OFF×ポップアップON/OFF）を切替え、標準方式126件／直接返信方式1件、全モード非負・失敗null、「自分」1件を確認。標準方式をOFFにしたときの「—」は再現せず、以前の負数センチネル修正がこの候補でも有効。更新ボタンも押したが、その時点で新着がなく正常な「更新なし」表示だったため、報告条件の「新着が残っているのに更新なし」は再現していない。

ChMate自体の更新なし対策として、191／226／242のDAT取得時だけ`If-None-Match`と`If-Modified-Since`の条件付きヘッダー設定をNOP化し、Range要求・他の取得処理は保持する版別パッチを追加。226の元APKでは取得処理が合成`([Object])Object`メソッドにあり、BBSUrlInfo引数条件では見つからないことを実適用で検出。対象探索を版別クラス内の単一`If-None-Match`要求へ修正後、3版すべてのMPP適用・再構築・署名成功。242では端末の既存データで361件までの表示後に更新操作を確認したが、上記のとおり新着あり状態での因果確認は未完了。191は起動済み、226は初回画面（同意画面）までの起動で、3版それぞれのスレ更新通し試験は未実施。リリース・版名更新はしていない。以前の記録にある「人気レス再回帰修正の実APK未確認」はこの記録で更新し、なお新着が残る再現ケースを用いた更新確認は今後の残件。

2026-10-22 人気レスの再回帰修正（未公開）: 標準方式の件数をnative行キャッシュ生成前に集計して「—」のままになる経路に、生成後の再集計を追加。直接返信方式・ポップアップOFFのスレ内抽出では、nativeフィルター後の短い行リストが完全な行キャッシュを上書きしないようにした。主作業ツリーと公開dev.5からの隔離ツリーでAndroid MPPビルド成功。短い行による上書きを検出する合成テストも追加したが、新APKへの適用・実スレ操作は未確認。手元の191元名APKは利用判定分岐が既にNOPへ変更された加工品で、パッチ適用はそこで停止。未加工APKでの端末確認が済むまでプレリリースしない。

2026-10-22 15:24 JST プレリリース1.12.0-dev.4公開、続けて1.12.0-dev.5でVPN v2のダウンロード先を修正。dev.4は通常のSemantic Release CI 39732146391成功、draft=false/prerelease=true。Hissi日本語文字コード補正と人気レス判定／表示の分離を収録。事前に別々の最終候補でHissi実ページDOM、242実スレの標準295件／直接返信25件を確認し、今回統合スナップショットのAndroidビルドも成功。公開MPPのdigest 89D7D7AFB72D233B980B6911706CCE61566499AACC8FFE29324A63A25DA080A4。VPN v2 ZIPは4 ABI・ライセンス・VERSION.txtを含み、ハッシュ65D7109356267DFF680A9B36209189136121C4CAF2E4F385AA7FCB596326C9E6。高度なNGサンプルはリリース案内ページに記載し、Release assetから除外。公開後、`releases/latest` が安定版1.11.2を指しv2 URLが404になることを検出し、dev.5のMPP URLをdev.4の公開資産へ固定。dev.5のCI 39733229355成功、draft=false/prerelease=true。最終MPP digest 9E0944145CADB59D3F9A950FFB4203B5916406A88DA553A9F94379D998F2C499、v2 ZIP digestは同一。配布されたMPPから固定URLを抽出し、HTTP 200を確認。従来名ZIPは旧パッチ互換のため維持。両版のJSONはversionとcreated_at（Zなし）を確認、正式版1.11.2は変更なし。公開 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.5 。DAT履歴は191でON/OFF再確認。実データ行は端末になくnative fixtureによる追加スレ検証である制限をrelease案内に明記。Morphe経由のMPP再適用と実機試験は未実施。

2026-10-22 履歴のDAT落ち非表示再確認／hissi.org文字化け修正（191で確認、未公開）: 191 native履歴変換fixture56項目、実表示adapterへDAT行＋時間見出しを差し込むON/OFF往復4回（ON2行/DAT0、OFF6行/DAT2、元リスト・設定復元）成功。追加の5ch 2 URLは実ページを確認し、1000超スレと倉庫格納スレのnative DROP行fixtureでON時に両方除外、OFF時に両方復帰。Edge BoardID fixtureも成功。端末DBに該当する履歴行がなく、ユーザーの実履歴状態自体は再現していない。hissi.orgはHTTPヘッダーUTF-8と旧meta Shift_JISの不一致を確認。紹介アプリのSJIS読み取りに合わせ本文判定後に一度復号しmeta/responseをUTF-8へ正規化するGET HTML経路を追加。POSTや他ホスト対象外。実hissi.org受信とWebView DOM日本語判定合格。最終build成功2分43秒、MPP30C33D19A8CAB190EEE11A70EFA54EEC4B596476EC2104063825B6571857E596。191既存検証パッケージへ署名照合install-r更新成功。新規対象アプリcrashなし。公開版／版名は変更していない。詳細docs/history-dat-hissi-encoding-20261022.md。

2026-10-22 人気レスの判定／ポップアップ分離（検証済み範囲あり・未公開）: popularReplyDirectを追加し旧combined設定を移行、標準の通常／ツリー方式と直接返信方式、表示先を分離。最終build/popularity-display-mode-build.log成功（2分21秒、既知ローカルLint3工程除外）。MPP B6FAE9F87F56AF8479368C24FFDB6C0FCDA7E608253DF542DC158D7AE2348722。242を署名照合install-r更新し、合成17項目とnative hook検査成功。実スレで標準ツリー295件＝native295件、選択後もTree維持、直接返信25件＝inline25行、popup独立・即時再集計・設定復元を確認。191/226は共通処理の合成各16項目とhook検査成功、最後の修正が242の実モード引数取得のみのため重複端末試験省略。指定Part3の実画面103件は未確認（合成Tree103／Normal1と区別）。新規対象アプリcrashなし、lastANRは別アプリMorpheの既存記録。旧ScopeUtil候補は配布不可。既存dev.3公開版・版名は変更しない。docs/popular-reply-modes.md参照。

1.12.0-dev.3配布確認の追補: Morpheの更新前から開始した短いlive logcatで、実際に要求したURLはmain/patches-bundle.jsonとdev/patches-bundle.jsonと確認できた（後段の「要求URLを断定しない」は初回ログ取得時点の記録）。devは1.12.0-dev.3、mainの正式版は1.11.2で配布先を維持。端末のプレリリース設定はONのまま変更せず、カードと詳細Versionが両方1.12.0-dev.3へ更新された。

2026-10-22 12:45 JST プレリリース1.12.0-dev.3公開完了: ユーザー指示によりUA変更をユーザー向け説明から除外し、履歴DAT・GIF操作・任意フローティング・Kyodemo代替検索・VPN説明を公開。実スレの浮動ボタン→下部パネル、本文と画像ビューア表示を公開前に追加確認。source7d8720a6b65a26e8a8f421e22aa968ddb0c2f801をdevへ通常push、既存Release CI39718087390成功、生成コミットb4a8ebb。draft=false/prerelease=true、配布物6件を再取得しGitHub digest全件一致。Android MPP CF76DA3D1E2D9BBE9CF87D83A2B7F14E0FE659FAC4DFCFB009CDD984E16723AE、classes.dexあり。devのJSON2本はversion1.12.0-dev.3、created_at2026-10-22T03:41:39（Zなし）、公開MPP参照。masterは1.11.2維持。Morpheのプレリリース設定ONを変更せず更新し、Haiagaruカード／Versionの1.12.0-dev.3と8パッチ表示を確認。ログに要求URLが出なかったため実際の登録URLは断定しない。CI版MPPの端末再適用は未実施。公開 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.3 。prototypeブランチ／元index／server/を保持しAndroid関連のみ一時indexで統合した。ローカルの同じ未コミット差分は既に公開sourceへ収録済みのため、次回はorigin/devと照合する。

2026-10-22 履歴DAT・GIF操作・任意フローティングフィルター（検証済み範囲あり／未公開）: 履歴の1行のURL解決失敗が全体除外を取り消す不具合を修正前191で再現し、行単位の隔離とnative DROP正判定の共有を実装。191/226/242でnative合成履歴各5項目成功。GIF代替再生にもcontrollerを接続、TextureView前面化、戻る／進むを既存秒数に統一し変更監視。初期OFFのフローティングボタンをフィルター設定へ追加し、長押しドラッグ・正規化位置保存・owner detach時の解除を実装。最終build/floating-filter-controls-final-build.log成功（2分52秒、既知ローカルLint3工程除外）、MPP2FC10BC780FC8B8889E7A1B01558B4734AD7BCF75CBAF772B37CA8ED74DEE123。最終242をemulator-5554へ署名照合install-r更新し履歴5／ボタン9項目、GIF実再生3430ms・操作・メニュー復帰、30秒ラベル実画面確認。設定復元、新規アプリcrashなし、起動後ANRなし。実スレownerから浮動ボタン→パネルの通し操作と実機の報告履歴自体は未確認。191/226の浮動・動画重複端末確認は共通処理につきユーザー指定で省略（両版は浮動追加前候補を導入済み）。実機・公開・生成版名は変更なし。詳細docs/history-gif-controls-20261022.md、導入台帳docs/android-installations.md。

2026-10-22 閲覧UAの最終候補検証完了（未公開）: build/viewing-user-agent-verified-build.log成功（3分1秒、既知ローカルLint3工程除外）、MPP BD93052B2CC01C3DF2DB0FE5D628A5EF8124D7CB3815FDC5ABF57F61B2BF06DC。同一MPPの191/226/242を署名照合install -r更新し、Native Request＋模擬java.net各11項目成功。閲覧UA反映・POST／アップロード／認証のUA維持・OFF・元Headers保持・http.agent無変更を確認。native構築命令／引数／分岐の保持検査は191=1/226=3/242=3コンストラクター、接続境界161/296/283箇所で成功。実通信・実書き込み・実アップロードは行っていない。191で右下ボタン非生成ON/OFFとVPN説明の全文実画面を確認。新規アプリクラッシュなし、起動後ANRなし。Imgur対応の取り消しを最終APKでも反映（試作helper不在）。実機・公開版・生成版名は変更なし。docs/viewing-ua-verification-20261022.md、導入台帳docs/android-installations.md。

2026-10-22 閲覧UA・浮動ボタン・VPN説明（検証中／未公開）: 最新指示は「書き込みUAは変更しない」。書き込み用の項目は追加せず、既存replaceUserAgent/userAgentを閲覧リクエストに限定しhttp.agentのプロセス共通上書きを撤去。39項目のホスト試験と191 native/java.netの11項目成功。226/242のRequest URLフィールドが異なるため、226=h/zzgb、242=f/zzcvlへ修正し最終再ビルド中。旧候補を全版検証成功とは扱わない。右下の独立「フィルター ▴」生成・監視を撤去しツールバー経路は維持。ON/OFFでView自体がないこととVPN説明の全文表示を191実画面で確認（build/haiagaru-vpn-help-final.png）。VPN説明は入力欄の前にあるTextViewが長大なラベルになるため、入力欄後の本文へ変更。ユーザーがImgur対応を取り消したため、試作したエラー変換・helper・テストはソースから撤去済み。初期APKの試験と現在のソース状態を区別し、公開・実機変更なし。UAの二分化というリリース説明は追加しない。

2026-10-22 Kyodemoをエッヂ過去ログの代替検索先へ追加（未公開）: 検索先を利用者が選択、既存検索は維持。KyodemoのShift_JIS条件・日付・50件単位offset・元スレURL変換・次ページ検出・状態復元を追加。未対応の詳細条件は非表示、全件数を捏造せず当ページ件数を表示。切替で旧結果と進行中応答を無効化し、自動フェイルオーバー／巡回はしない。ホスト21項目成功、最終build/kyodemo-archive-final-build.log成功（2分36秒、既知ローカルLint3工程除外）。MPP8F6EE1698A27F87CB3A8298151EAB45925E76C8E89A5E3BF47F41BD3B5AC13CB。191を署名照合更新し実検索50行・日本語・View再生成時キャッシュ復元・切替13項目成功、native hook検査成功、新規アプリクラッシュ／ANRなし。226/242は共通処理につき今回の重複通信試験を省略。実機・公開リリース・版名は変更なし。docs/edge-archive-providers.md、導入台帳docs/android-installations.md。

2026-10-22 08:23 JST プレリリース1.12.0-dev.2公開完了: 検証スナップショットd85251fをdevへ通常pushし、既存Release CI39692529791が成功。CI生成コミット6860ff8、draft=false/prerelease=true。6配布物をbuild/release-1.12.0-dev.2-verifyへ再取得しGitHub digest全件一致。Android MPP SHA2566d78c33c819071d85be7a79f326172c1083d4aa025266578c52ba08013d8135b、classes.dex確認。devのJSON2本はversion1.12.0-dev.2、created_at=2026-10-21T23:19:52（Zなし）、公開MPP参照。masterの公式メタデータは1.11.2維持、公開タグの日本語説明HTTP200。Morphe端末の更新カード表示とCI版MPPの端末再適用は未確認。公開 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.2 。作業中の作業ブランチ（shared-ng-prototype）ブランチ／index／server/は変更せず、ローカルの同じ未コミットAndroid差分は既にd85251fへ収録済み。今後の統合時は重複公開せずorigin/devと照合する。

2026-10-22 タブ・Dialog最終候補の検証完了／プレ公開準備: build/tool-tabs-safe-candidate-build.log成功（既知ローカルLint3工程除外）。MPP0746F173D4395FD5ECCCF964BB9CFFD12BF733FDDE1931F499CD79E62985EF50から191/226/242を生成し署名照合更新。native hook全3版、設定242=16・検索タブ242=16・追加入口242=8・旧版タブ各12項目成功。画像長押しから一覧／実画像表示と復帰、242 GIFの実再生進行・ループ、タブ設定のカード実画面確認。新規アプリクラッシュなし、起動後ANRなし。プロセス終了後の結果復元、大量データ、実CAPTCHA、短スレ位置比較は継続確認。既存CIでプレリリースのみ公開予定、公式1.11.2は維持。並行作業の作業ブランチ（shared-ng-prototype）ブランチとserver/は保持し、Android関連のスナップショットだけdevへ公開する。詳細docs/tool-tabs-settings-20261022.md。

2026-10-22 タブ追加入口・検索タブ（開発中）: 独立した新規タブ上のボタンを撤去し基本設定へ統合。投稿を探す／投稿検索・結果／ﾜｯﾁｮｲ全文検索の個別タブ選択とController分離を追加中。下部フィルターの取り外し後View.postとDialogの同期終了も修正。初期242候補はDialog11項目成功だがタブ内設定でisolated LifecycleOwner不在を検出し、独自Owner接続を追加。後続全体ビルドは並行する通信側の新APIと旧AARの不整合で失敗し、既存手順によるAAR再生成中。初期失敗候補は配布せず、エミュレータを確認済み長押し修正版へ署名照合更新で戻した。実機変更なし。詳細docs/tool-tabs-settings-20261022.md。未公開。

2026-10-22 画像長押しの実タッチ停止修正（未公開）: 実機の最新検証版でも停止する報告を受け、エミュレータで実タッチ長押しにより再現。内部リスナー直接呼出し試験では発見できなかった。dismiss-enterから先へ進まず主スレッドはMessageQueue待機、ANR記録なし。長押しdispatch中のCompose detachによる中断が疑われ、dismissForNavigationのdismiss自体もmainの次キューへ移動。Frida試作で実タッチ成功後、本体へ組込み。build/longpress-dispatch-fix-build.log成功（2分32秒）、MPP67E0C5706D1CBD97AFF4715F9AE3F3B6ABB8423D185F374C73B97E52E718CFA7、242生成・元命令保持検査成功。emulator-5554へ更新し実タッチ長押し→画像一覧→戻る2回、本文スクロール、透明窓なし、PID8058crashなしを確認。XIG05の同パッケージへ署名照合install -r更新成功しHomeを起動。実機での再操作は未確認。台帳docs/android-installations.md。旧検証で不十分だった点を記録し、他の公開前残件は引き続き保留。

2026-10-22 再attach防止候補と実機導入（未公開）: 設定カードの機能名→説明順を実画面確認、カテゴリ移動も正常。前候補の設定復帰等で別の高さ0透明窓が再発したため修正完了とは扱わず、dismiss時にattachの有無を問わず暗転／入力遮断を解除し、終了済みの再attachを除去するガードと既定OFFのプロセス内診断ログを追加。設定画面の明るい背景でステータスバーの白アイコンが読めない点も調整。build/dialog-reattach-guard-build.log成功（2分48秒）、MPP FF90074B6B4A5D60E8148519039FE2105E146A1C45757B750236075C8405205C、242生成・emulator-5554へ同署名更新成功。ユーザー追加指示でXIG05（730eae72）へ同APKを新規別アプリとして導入成功。別アプリの既存SessionID自動移行はない旨を案内し、実機認証・投稿はしない。メンテナンス中につきex0ch実サイト認証検証は保留、監視や定期アクセスは行わない。最新候補の反復操作、検索密度の実画面比較、旧GIF最終確認等は残るため未公開。導入台帳docs/android-installations.md。現在の表示名はHaiagaru 復帰修正 242。

2026-10-22 検索密度・認証セッション最終候補追補（未公開）: build/compact-session-verified-build.log成功（4分5秒）、MPP FA5C02FEBE0789C1B413EE798EB7C6FD4BCBA30D925A67B224AECE34C3DA37D8。191/226/242生成・nativeタブhook検査成功、242だけ同署名データ保持更新。表示12・ID保持5・認証前seed1が最終候補でも成功。画像長押しからImageListActivityへの遷移と戻りを2回確認し、最終本文スクロール成立、透明窓なし、PID6434のcrash buffer空。直前候補はフィルターとは別の透明窓が残ったため成功に数えず、入力・暗転フラグ解除と正確なdecor除去を追加した最終候補で改善を確認。実CAPTCHA認証・OTP投稿、設定カードの実画面通し操作、検索密度の実画面比較、旧GIF最終再確認等は残る。設定画面操作後にランチャーへ戻ったため原因未確定として記録し、公開しない。ユーザー指示で修正版242のResListActivityを前面化。導入詳細はdocs/android-installations.md。未コミット・未push・未公開。

2026-10-22 検索密度・設定順序・CAPTCHA／SessionID（開発中）: 結果上下余白0〜32dpと文字倍率の独立保存、操作欄の間隔50〜100%とコンパクト入力、専用ビューア案内の設定側集約、カードの機能名→説明順を追加。242で高さ0・isShowing=false・attached=trueのHaiagaruDialog残留を実確認。先に閉じてから画像一覧へ遷移し、自身の残留decorだけを除去する候補を実装。ex0ch公開ソースから3種のCAPTCHA、!authのOTPとSID切替、force制限を確認。認証前のnative Cookie引継ぎとcountsession/securitykey保護を追加中。XIG05の例は本体のsubject-metadentアクセス確認の空白画面で、実CAPTCHA完了は未確認。compact-auth-dialog-build成功（3分27秒）はSessionID保護・最終dismiss修正前。現在auth-session-identity-build中だがビルド開始後の追加修正があるため最終再ビルドが必要。45項目の認証ルール試験成功。未公開・未push、旧検証失敗を成功扱いしない。詳細docs/compact-search-auth-20261022.md。

2026-10-21 エッヂ結果の横線区切り（未公開）: ユーザー指定により検索結果の左右枠・角丸背景を撤去し、先頭上線＋各行下線の共有境界へ変更。native本体タブとCompose別画面の両方を変更。左右12dp／上下16dp、結果間余白0、明暗別の控えめな線色。設定画面の枠は保持。build/eddi-horizontal-rules-build.log成功（6分53秒）、固定MPP build/eddi-horizontal-rules.mpp SHA2561C99560D9D04E83DD830B1CC665D9C5F0BCC26DCF0EB8C86E482134C264C9781。242のAPK生成中で今回横線の端末実画面は未確認。詳細docs/eddi-result-separators.md。GIF TextureView候補は別のMPPで242へ署名照合更新成功だが再生fixture結果待ち、191 lifecycle修正も実画面離脱未確認。公式公開保留・版名変更なし。

2026-10-21 アンカー348・カードwarm・GIF追補（未公開）: 242の実画面で指定スレ1792587764/348の>>14をタップし14本文と画像リンクのポップアップ表示確認。Frida付きtouch UP dispatch697ms、補助処理profileでapplyToRow16ms、因果切り分けと改善前後比較は未完了。最新同一ソースbuild/anchor-card-gif-final-build.log成功（2分41秒）、MPP AF9856A4A37068A11B1A06144CC445BAD390F881E7A2CB0A13CC1A36EDC5F724、242署名照合更新成功。カードwarm fixture5項目成功（anchor-card-warm242-runtime-final.txt）、実更新位置は未確認。GIF fallbackは初期化に失敗し実再生未成立、失敗時にVideoView再表示で再試行する経路も確認。UIリソース依存をなくすTextureView化、一度だけ試行制限・エラーログを追加。さらに191 PID22796の旧ANR直前にNativeToolFragmentのonViewCreatedがListView不在でNullPointerExceptionとなったログを確認、独自ツールのonViewCreatedだけAndroidX基底へ接続する修正と検査を追加。現在build/gif-surface-native-lifecycle-build.logで再ビルド中。最新修正版の導入・再生・191画面離脱未確認、公開保留。

2026-10-21 公式公開前の会話残件監査: docs/release-readiness-20261021.mdへ直近依頼と検証記録を照合。191 ANR、GIF実再生、短スレのリンクカード更新位置、実アンカー遅延比較、タブ復元・新規入口旧版、テーマ削除実画面、最新同一MPPの回帰確認が残るため「途中がなければ公式公開」の条件未達。公式公開しない。アンカー補助処理の分割候補は242へデータ保持更新しfixture7項目成功。最新Media3 GIF fallback／カードwarm候補はbuild/anchor-card-gif-fallback-build.logで8分5秒ビルド成功、今回最新の端末再生未確認。ビルド中のソース変更を含むため最終ソース・配布MPPの同一性再確認も必要。旧ログの上4桁NG保存未確認は各版7項目成功で更新可能。版名・生成CHANGELOG・公開状態は変更しない。

2026-10-21 新しいタブ入口・個別画面選択（未公開）: 191本体タブ入口のFragment基底照合不一致を修正し実表示／ON-OFF11項目成功、226も11項目成功。続いて本体の新規タブViewを保持して追加画面選択ボタンを追加、Haiagaru設定／エッヂ検索を個別選択可能に。全体初期OFF、画面選択初期ON、選択外は従来別画面、共有設定にも収録。「過去レスを見る」を「保存済みレスを見る」へ通常メニュー・242シート・設定候補で改称しID／保存データ維持。build/native-new-tab-build.log成功（4分46秒）、MPP8DC5C933F9CDA5AD98D27D2942B6D7606606EF807DC9D47D77BE37A168772907。3版APK生成・元命令保持／新規タブhook／保存レス名称検査成功。242へ同署名更新し実新規タブの入口・選択メニュー等8項目成功、試験設定復元。191/226の追加入口実画面とプロセス復元は未確認。191 PID22796でフォーカス喪失時ANRを追加確認したため安定性解決とはしない。GIF MP4再生も未解決、公開保留。詳細docs/native-tool-tabs.md、導入台帳docs/android-installations.md。未コミット・未push・版名変更なし。

2026-10-21 本体タブ統合の任意設定（未公開）: 「アプリ・通信 → 基本設定」に「タブレットで追加画面を本体のスレタブで開く」を初期OFFで追加。ON時はHaiagaru設定・エッヂ過去ログ検索を本体type4ページへ追加、OFFは従来別画面、既存タブは自動削除しない。191/226/242のnative Fragment基底・factoryへ接続し、通常Webタブと元命令・レジスター・分岐を保持する検査に成功。最終ビルドbuild/native-tool-tabs-verified-build.log成功、固定MPP FE1C5CDF1A8C6A12EAD9D02FF54636F752A64315F507B085DB2E9586E4C7C3B2。242へ署名照合・データ保持更新し、本体同列タブ実画面と実スイッチON→OFFなど16項目成功。fixtureと設定は終了時復元、PID22114のcrash出力なし。191/226の実画面、プロセス終了後復元、実サイト検索は未確認。GIF再生・既存191 ANRは別途未解決で公開保留。詳細docs/native-tool-tabs.md、導入台帳docs/android-installations.md。未コミット・未push・版名更新なし。

2026-10-21 自作テーマ管理候補の検証追補: theme-management226のinstall -r Successを確認。HOME履歴のnative型DAT除外試験は191で56項目、226で55項目成功（build/theme-management-history191-runtime.txt、build/theme-management-history226-runtime.txt）。テーマ一覧／削除の実画面操作やGIF再生成功を意味しない。

2026-10-21 自作テーマ管理ビルド追補: IOException宣言を修正後、build/theme-management-final-build.logでAndroid用MPP生成成功（5分11秒、既知ローカルLint3工程のみ除外）。MPP SHA256 740CE67809F80FB5CE47138C04D8C15041D86B92A9A3F7B323B1DE83B8E6E6CE。ホストテスト43項目成功、git diff --check成功。今回候補のAPK生成・端末導入・実画面操作は未実施。ユーザーの追加依頼により、続いてGIF再生エラー、本体タブ統合、191/226へのDAT非表示等の適用確認を行う。未公開・版名更新なし。

2026-10-21 自作テーマ一覧・削除（未公開）: 取り込み画面とHaiagaru設定の同じカテゴリへ「取り込み済みテーマ一覧・削除」を追加。保存先の対応テーマをファイル単位で列挙し、確認後に対象1ファイルのみ削除。標準テーマ・別の昼夜テーマ・画像素材・取り込み元は削除しない。取り込みと共通ロック、パス検証、更新された対象の削除拒否、非同期IOと一覧再読込を追加。ホスト上の取り込み方針31項目・一覧／削除12項目に成功。初回AndroidビルドはthemeRootのIOException宣言不足で失敗し修正、最終ビルド結果は追記する。端末への導入・実画面での操作確認・公開は未実施。操作説明docs/custom-theme-import.md、テストscripts/VerifyImportedThemes.java。既存の未コミット変更と公開保留状態を保持。

2026-10-21 HOME履歴・レスメニュー・枠線・GIF（未公開）: HOME履歴のDAT除外後に空の時刻見出しを除去、242選択レス参照と全終了経路のメニュー接続、任意の追加ツール、共通カード枠・検索結果区切りを実装。公開X GIFのembed token・root video解析を修正。build/history-menu-gif-ui-final-build.log成功、固定MPP16B5920A3721F86D7965DF10CC9BE3BB27DA1ADF95326127869B783DE7F3C569、242へ署名照合・データ保持更新成功。242 native型DAT20、メニュー／選択レス7、公開GIFメタデータ等5項目成功。実画面で検索結果枠・区切り・縦スクロール確認。GIF内部再生はsource has no trackで失敗、本体スレタブ同列統合は構造調査のみで未実装。191既存ANRダイアログの残留は確認したがlastanrは旧09:13:01 UTCのまま。191 ANR未解決・GIF再生未完了につき公開保留。226通常行の見出し誤認を除く追加ビルドも成功したが、その差分は未導入。詳細docs/history-menu-gif-tablet-20261021.md、導入台帳docs/android-installations.md。未コミット・未push・未公開、CI生成物未変更。

2026-10-21 最終候補追補（未公開）: 使い回しのツールバーViewに長押しリスナーを追加する方式を撤去し、既存ネイティブonLongClickディスパッチへ接続。191は解除値を先に一括設定して通知1回、解除中の追加件数解析を省略。build/ng-filter-reset-verified-build.log成功（4分3秒）。最終MPP build/ng-filter-verified.mpp SHA256 64C044216ADE619626A14E3165B7CC625C995E0948EF1CE6AC9D17FE80F2C37D、3版適用・署名・署名照合install -r成功。191本体長押しコールバックで通常4＋追加3項目の解除29msと元選択復元、191本体型合成行の未読ON/OFF5項目、3版NG実保存／復元各7項目、生成APKの未読フック元レジスター／引数／減算保持4/6/8箇所を確認。NG保存検査の初回削除コードがnullを本体リストへ入れて診断時クラッシュを起こしたが、テスト項目だけを除去して復旧し、replace方式へ修正後成功。09:13:01 UTC（18:13:01 JST）に最新191の画面復帰で新規ANR、mainはChromium WebView onServiceConnected内。原因切り分け未完了のため公開保留。フィルター解除成功とANR未解決を区別する。新規公開・バージョン更新なし。詳細docs/ng-filter-settings-20261021.md、導入台帳docs/android-installations.md。

2026-10-21 上4桁NG・個別フィルター・設定整理（未公開）: 上4桁NG、AA/自分/返信の個別表示、下部パネルのツールバー設定、フィルター長押しリセット、チェッカー案内削除と高さ10〜60%、設定説明カード統合とカテゴリ幅統一を実装。非表示NGの表示未読件数補正を初期オフで追加（取得・NG判定済みのみ、既読位置は不変、未閲覧全スレ判定ではない）。191/226/242の未読計算4/6/8箇所へ接続。191の追加ANRで高度なNG無効時の全レスHTML変換、投稿者強調のHTML変換を確認し、省略・上限付きキャッシュを追加。最終ビルドbuild/ng-filter-anr-final-build.log成功（3分56秒、既知Lint3工程のみ除外）。MPP build/ng-filter-final.mpp SHA256 F16D16EAEF20DBE681F17BE4F2F83A5A0CC596C6BA51099F6762D6ABA5F462A5、3版の適用・署名・データ保持更新成功。最新191の値検査13項目と本文・開き直し・上下スクロールで新規ANR時刻増加なし、PID18376の新規crashなし。フィルターリセット実操作、上4桁NGの実保存、未読タブ判定全体、226/242の変更画面通し確認は未完了。今回の変更は未コミット・未push・未公開。詳細docs/ng-filter-settings-20261021.md。

2026-10-21 プレリリース1.12.0-dev.1公開完了: fd9def0をdevへpushし、既存Release CI39538883242が成功。CI生成コミット9c458b1、draft=false/prerelease=true。6配布物をbuild/release-1.12.0-dev.1-verifyへ再取得して全件GitHub digestと一致。MPP SHA256 72d730b88df985772756654f3c1fe7b5f207b9d3db4de52f4fa49a2934c4b9e8、classes.dexあり。devのJSON2本は1.12.0-dev.1・Zなし・公開MPP参照。master/mainの安定版JSONとlatestは1.11.2を維持。変更案内はタグ固定docs/release-next-prerelease.md。191最終候補で画像ビューア表示と戻るも追加確認、PID14797の新規crashなし・lastanr旧時刻。長時間ANR再発・物理fold・実走査は未確認と明記。公開CIのMPPによる端末再パッチ・Morphe更新表示の実端末確認は未実施。公開URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.1 。

2026-10-21 191待機ANR対策候補（未公開）: 本体スクロールバー描画内の日時計算を上限付きキャッシュへ接続し、元計算の全命令・レジスタを保持。最終MPP build/anr-date-cache-final.mpp SHA256 C04A8EB21C41416043F01EDF9C18F6F4B7E673BD4302560C18D44C10FFF7EE2B、191 APK build/anr-date-cache-final191.apk SHA256 A57A2CD916213CC5A45DD2445A32458C26090E0F51D83F4554D7FDCC32A46E68。同署名settingsfix191へデータ保持更新。ローカル10009項目・実日時1000件一致・元命令保持検査成功。フックなしの同じスレ開き直し／上下6往復／サムネイル表示で新規ANR・crashなし。ただし限定時間の確認で原因完全特定・解消とはしない。226/242の日時処理変更なし。詳細docs/native-draw-date-anr.md。未コミット・未push・未公開。

2026-10-21 最終ユーザー操作後の確認: settingsfix191 PID12748のResListActivityで新規ANRを確認。端末時刻01:44:28 UTC（10:44:28 JST）、入力DOWNを5006ms処理できず。build/final-check191.xmlにisn't responding、build/final191-anr.txtへ/data/anr/anr_2026-10-21-01-44-28-535を保存。mainは本体o.ra.draw→o.r8lambda4fIVmDse184MJavTVTXSBZQF_UA.b→Calendar.getTimeInMillis/computeTime内。Imgur補完の別スレで通信失敗もあるが因果関係は未確定。追加のメソッドdumpはbuild/final191-anr-methods.txt。検証アプリのみforce-stopしてフックなしでHomeを起動し、画面にある保存スレ行をタップして同じスレの本文表示・縦スクロールを確認（PID13777、build/final191-thread.xml、final191-image-row.xml）。同PIDのcrash bufferは空、lastanrは旧時刻のまま。ただし画像表示は確認できず、ANR原因と解消を証明できていないため公開保留を維持。既存アプリのアンインストール・データ消去なし。

2026-10-21 設定共有・走査履歴再開・NG対象板（公開前）: Manifest既存Android属性の名前空間重複を除去する更新helper、永続SearchCursor、履歴から別ジョブへの再開と結果重複防止、初回オプトイン最低限構成、秘密情報を除外した.haiagaru共有／インポート／read-only providerを追加。191のHOMEリストの一部がnullでも表示リストのDAT絞り込みを続行。追加依頼のNG対象板を登録画面先頭へ移し、共通フォームの二重スクロール・選択欄ラベル・ラジオsemantics／48dpタップ領域・文字長押しを改善。既存の前2依頼の未コミット変更は保持。
Androidビルド成功 build/ng-accessibility-build.log（4分33秒、既知のLint FIR問題で3工程のみ除外）。最終候補build/settings-accessibility-final.mpp SHA256 22AB2F5920C648ABF19439D3B3D2CFA3417281A1225217A80BD2362441CF1236。191推奨3パッチ、226/242任意動画・MEGA・Imgur込みで元APKへの適用・署名成功。各版の起動・設定確認、設定形式／型／最小構成／cursor各27、NG対象板各7、191設定ファイル通し13・最小構成適用10・DAT53、226ディスク履歴再開8・Webスクロール6、191/226復帰各9に合格。3版のフック元レジスタ・命令・分岐保持検査合格（build/settings-hooks-verified.txt）。191の旧fixtureは合成BoardIDにサーバー情報がなくhttps://nullを生成し失敗、正規URL／表示リストを分離して再確認。補完判定は正の確認キャッシュによるオフライン検証。診断FridaのART SIGSEGVを記録したため、通常操作の新規クラッシュと区別し、フックなしスレ／画像の最終確認を公開条件に残す。公開URL付きADB起動は実行環境がblocked by policyで拒否。ユーザーに191検証アプリでスレ／画像を開く操作を依頼済み。未コミット・未push・未公開、CI生成物未編集。詳細docs/settings-sharing-history-resume.md、docs/release-next-prerelease.md。

2026-10-21 エッヂ過去ログ倍率・折りたたみ判定（未公開）: native TextViewの倍率がComposeに渡らず表示不変だったため、rootタグから検索欄と結果欄それぞれのLocalDensity.fontScaleへ接続し、タグ変更も再描画監視へ追加。FoldLayoutの600dp判定と起動時の幅による設定書換えを廃止し、Jetpack WindowManager 1.3.0のFoldingFeature監視へ変更。折り目未検出・取得不能・初回閉状態・分割画面の不明状態は手動／現在モード維持。検出済み記録はモデルとOSビルドに結び付け、Activity停止・設定オフ時に監視解除。既存の表示切替・編集中保留・読書位置の接続は維持。
Java/KotlinとAndroid MPPビルド成功（build/archive-scale-fold-build.log、3分40秒、既知のローカルLint FIR問題でLint3工程のみ除外）。倍率66項目＋Compose接続、折りたたみポリシー8項目、実WindowLayoutInfo受信・非fold手動維持・解除を確認。API36 emulator-5554の226で実Compose文字領域70%37px→150%83px、検索欄70%／結果150%で37px／83pxを確認。固定MPP build/archive-scale-fold-candidate.mpp SHA256 5F7A0619CD29784A1B2038BEE29DB0F3E0BBE5CD994896A19310E2133E1366C1、226 APK SHA256 D5DE2462C6A89B4CCFEBCE7CB09642C28B2765D87C754E08B17571E9E24B6FEB。既存resumefix226へ署名照合・データ保持更新成功。物理フォルダブルでの開閉と191/242の今回の端末操作は未確認。詳細docs/archive-scale-fold-fix.md。前回未コミット変更を保持し、未コミット・未push・未公開。版名・CI生成物は変更していない。

2026-10-20 投稿検索・フィルター改善（未公開）: ツールバーと長押しから元スレの板・ホストを引き継ぎ、5chでは前回エッヂ選択よりHissiを優先。バックグラウンド同時3件・走査一覧・個別停止再開・開始位置指定、ホスト別の共通10秒間隔、AtomicFileによる並行キャッシュ保護を追加。検索設定を全画面化。Kyodemo／外部板認証とWebダイアログでブラウザを外側の縦スクロールから分離。数字と追加フィルターの独立設定・標準行復元・横タッチの親ジェスチャー抑制・任意の下部パネルを追加。X／サイトカードの位置補正は初回描画・操作中・本体移動には介入しないよう変更し、既存読書位置の復元条件は維持。
最終Androidビルド成功（build/search-filter-verified-build.log、8分58秒。既知のローカルLint FIR問題でLint3工程のみ除外）。固定MPP build/search-filter-candidate.mpp SHA256 228ED68056452ADF0F487AA639F6718B9A06E3A22D6A1E72C8CD5B332ABBD3BC。226元APKへの適用・署名とemulator-5554のresumefix226へのデータ保持更新に成功。並列IO7・サービス13・検索元とフォーム8・WebViewタッチ6・実ListView位置6の合計40項目に合格。検索設定の全画面カード表示も目視確認。外部サイトへの走査・送信は行わずfixtureを使用。実スレのフィルター・下部パネル・横ジェスチャーとX／カード更新、191／242の今回の適用・端末確認、ZZZSearchのタッチ操作は未確認。旧検証プロセスで取得したANRや無効な疑似adapter fixtureの失敗を、修正済み／成功とは扱わない。詳細と残件はdocs/search-filter-2026-10-20.md、APK台帳はdocs/android-installations.md。未コミット・未push・未公開で、CI生成バージョン等は変更していない。

2026-10-20 15:08 JST 正式版1.11.2公開完了: 修正8eabe51をmasterへ通常マージea548fbし、既存Release CI39378219468とBuild CI39378219443が成功。CI生成コミット8a6cff0、draft=false/prerelease=false。6配布物をbuild/release-1.11.2-verifyへ再取得し全件GitHub digestと一致。MPP SHA256 d56025ffd9f8a30f452b8698b2bf68ebe1c317e0f7e0e57015b345fdb8717100。新VPN ZIPは13,208,614 bytes、SHA256 3bae5651a4f1e381131edce14995942e61ceb0bea42ae08508779a1bb67a8ffd（ローカル版とはライセンスの改行等が異なる）。公開ZIPの4 ABI/libgojni.soは本番検証ハッシュ全件一致。既存Image NG ZIPのSHA256は66a7eaa6ef0fd05f036fc7c8232cfa4821d1b98ce969002e8919c4a8dac4debaで変更なし。JSON2本version1.11.2、created_at=2026-10-20T06:04:56（Zなし）、公開MPP参照。公開URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.11.2 。ユーザー指定どおりコマンドで検証し、修正後実機Morphe操作は未実施。

2026-10-20 VPN追加ファイルの選択改善: XIG05 730eae72 / Morphe 1.35.0 / Haiagaru1.11.1 / 191で、画像取得VPNのリソース適用時にarm64-v8a/libgojni.so不足エラーが出ている画面を確認。Image NGは別のTensorFlowライブラリ。公開AARを再取得しローカルとSHA256一致（99556F8EF1B2D8F9E5C44D00C9FC5159E9EE896E4CB446B87CDC725830D5E203）、4 ABIも正常。VPN用ZIPをGradle生成し既存Semantic Release添付へ追加、ZIP/AAR選択と誤ファイルエラーを改善。ZIP SHA256 C8CF637979A2F0293B4E9615BBA7854F4922406D6B86FF3E1789365B966328BD（13,208,725 bytes）。通常Lint込み最終ビルド成功（build/optional-vpn-zip-final-build.log、4分41秒）。VerifyOptionalLibrariesでZIP/AAR各4 ABI、Image NG、両方向誤選択、ハッシュ不一致拒否を確認。191へ7パッチ適用・署名成功しAPK内の両4 ABIと導入マーカー、元レス描画保持検査成功。固定MPP build/optional-vpn-zip-verified.mpp SHA256 891A764868A7C6C3CBBAFE02ABC58F89F76E2533D3C78DE68BA15F5CF2DFC33A。拡張DEX3本は公開1.11.1と同一ハッシュ。実機は調査後切断し、ユーザー指定で以後はコマンド検証。端末への導入・指定URL起動を含むコマンドは実行環境に拒否されたため再試行せず、生成APKとライブラリの非破壊検査へ限定。修正後実機Morphe操作と新規端末導入は未実施。

2026-10-20 14:22 JST 正式版1.11.1公開完了: 修正ad7d50cをmasterへ通常マージ17e9a21し、既存Semantic Release CI 39374142232・Build Haiagaru CI 39374142315が成功。CI生成公開コミット9898539、draft=false・prerelease=false。master/main/devは同コミットへバックマージ済み。配布物5点をbuild/release-1.11.1-verifyへ再取得し、全件GitHub digestと一致。MPP SHA256 ca5ef23f7785a838d1148baac2da6a65e5f9cfef1b365651569b5bcb2421e888。JSON2本はversion=1.11.1、created_at=2026-10-20T05:19:11（Zなし）、公開MPP参照。Releaseからリンクするdocs/release-1.11.1.mdをHTTP200で取得し、修正文言とお詫びの反映を確認。スレへの投稿はユーザー指定で実施なし。公開URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.11.1 。公開CI版MPPそのものによる端末再パッチ・実機導入は未実施（公開前の同ソースローカルMPPによる検証記録と区別）。

2026-10-20 エッヂ検索スクロール修正: 226の検索画面へ実パーサーを通した50件を表示し、縦スワイプでも先頭に留まる旧挙動を再現。結果へ残り高さを配分する専用Composeレイアウトと、結果カードのクリック引継ぎを追加。修正後50行目到達、詳細開閉、結果→658レス→戻る際の位置保持を確認。横画面で結果欄が潰れる問題も修正。最終226の縦スワイプ、横画面の有限viewport描画、元レス描画保持検査成功。検索サイトは接続タイムアウトのため通信成功とは扱わない。実機未接続、共通画面191/242の重複操作確認はユーザー指示で省略。通常Lint込みbuild/eddi-scroll-final-build.log成功（5分54秒）。最終MPP build/eddi-scroll-final.mpp SHA256 57AF2E943F434FCE3FE4505E5FF60FBEE0C5B30E7D11C52036F4A87EB46E5E3B。Part2の768レスを確認し追加報告をdocs/part2-bug-triage-20261020.mdへ整理。AGENTS.mdへ公開前回帰確認ルールを追加。お詫びはRelease説明のみでスレへの投稿なし。公開結果は別途記録。

2026-10-20 他バージョン追加確認: 191/226と同じ最終MPP（C48D7EA3D9960820BAB00C5BD449CB13701E18D6563A78D823352C2089AEFCA5）を242 devへ適用・署名・emulator-5554へ同署名更新成功。指定Haiagaru Part2の本文表示、3レスの画像取得・標準ビューア表示、同じフィルターダイアログ内でチェックオン／オフを実画面確認。初回画像取得時はサーバー未検出表示となったが再取得で画像表示成功。元の復帰処理保持検査成功、最終crash buffer 0 bytes。241/243は配布対象外で、NGフックの単独適用・レジスタ・DEX生成検査は既存記録で成功、今回の実画面通し確認には含まない。APKハッシュと鍵はandroid-installations.md。

2026-10-20 1.11.0緊急修正（ローカル検証完了）: emulator-5554の191でスレを開く際のgetView VerifyError、226で画像を開く際のImagesViewer2Activity.onCreate VerifyErrorを実操作で再現。広告フックの元レス描画メソッド誤認と、GIF振り分けによる生存レジスタ破壊を修正し、同じ公開スレの本文／画像表示を確認。フィルターチェック遅延は固定長ArrayAdapterのclear例外、Composeの非監視BooleanArray、非同期選択値の古い読取を修正。最終226でダイアログを閉じずに画像チェックのオフ→オンを実画面確認。通常Lint込みのbuildAndroid成功（build/filter-immediate-hotfix-build.log）。最終MPP build/crash-filter-immediate-final.mpp SHA256 C48D7EA3D9960820BAB00C5BD449CB13701E18D6563A78D823352C2089AEFCA5。191/226を既存検証パッケージへ同署名更新。両最終APKの元レス描画保持検査合格、最終crash buffer 0 bytes。投稿者ID連鎖NGに関する並行変更は保持。実機導入・Release公開・バージョン更新は未実施。詳細: docs/crash-1.11.0-hotfix.md、導入ハッシュ: docs/android-installations.md。

更新日: 2026-10-18（日本時間）

主開発先は `<workspace>`。
今後は他チャットもここで作業・ビルドする。親フォルダ、`StudioProjects/Haiagaru-release-1.8.9`、`StudioProjects/Haiagaru-Morphe` は参照用の旧作業先。

## 1.11.0クラッシュ追補（2026-10-20、ローカル修正）

241から242 devへバックアップ復元後に落ちるというOPPO/API36ログの `o.zzaW.c(KeJ11,boolean)` / `0x101` / `v13 Integer → Object` VerifyErrorを、修正前242の実メソッド呼出しでも再現。投稿者ID連鎖フックが、ネイティブで投稿引数をレス番号・祖先探索引数をキャッシュへ再利用した後に引数を上書きしていた。241/242/243はレス番号ロード直前に直接3引数で呼ぶよう変更し、元のキャッシュ参照を保持。5版の元APKへの本番フック適用・引数／ロード順検査・DEX生成に成功。修正版242をemulator-5554へ同署名で上書きし、ART上の割当と実メソッド実行に成功。ユーザーZIP・OPPO実機による復元通し確認は未実施。詳細は [242復元後のクラッシュ](hotfix-1.11.0-242-restore.md)。

191のレス描画広告フック、226のGIFリダイレクト、フィルターダイアログのComposeチェック状態修正も統合した最終Androidビルドは `build/crash-hotfix-final-build.log`（4分20秒、既知のLint3工程をローカルコマンドで除外）で成功。固定MPP `build/crash-hotfix-final.mpp` SHA256 `0373C18C620AEF08AC2EF1C51C45C2DA966F8BAD023E6F1589BB3D1016B9D36D`。191/226/242のAPK生成とemulator-5554への上書き成功、191のART割当・レス描画、226の実画像表示、242の旧VerifyError消失を確認。226実プロセスでComposeチェックの初期状態・オン／オフ・外部モデル反映の5項目に成功（`build/crash-hotfix-dialog226-runtime.log`）。公開・バージョン更新は未実施。共用エミュレータの実画面操作が別検証と競合するため、続きの画面確認は既存16GiB AVDをread-onlyで起動したemulator-5556を使用する。

追加画面確認: API36 / emulator-5556で初回案内→板一覧→Android板→Haiagaru Part2（701レス）まで実操作し、242の本文を正常表示。実際のフィルターダイアログでも画像チェックが閉じ直さずに変わり、背面のレス一覧が即座に絞り込まれることを確認。チェックを戻して終了し、新規crash bufferは0 bytes。画像はbuild/crash-hotfix-242-thread5556.png、crash-hotfix-filter242-before.png／after.png／off.png。検証用AVDは既存16GiB AVDのread-only実行で、保存済みAVDデータへ変更を残さない。

## 今回の統合

1.8.15公開元と同じコミット `31422922a24e06e1bdb3b4b2c90c553cf8f108f4` を基準に、旧releaseフォルダの未コミット実装差分と追加ソースを統合。主開発先にあったメニュー順序・閲覧履歴修正も維持した。

- Xプレビュー軽量化、カード表示、返信・リポスト・いいね・リンクコピー。
- 動画の速度切替、長押し中だけ2倍速。
- エッヂの関連・次スレ候補。
- スレッドアーカイブ日時順。
- 既読スレ削除ジェスチャーの画面探索修正。
- 書き込みメニューの個別表示。
- 投稿者強調のスクロール位置補正、復元DAT行の補完に関する旧作業先の実装。
- メニュー追加項目の順序・242表示設定、全期間の閲覧履歴に時刻不明行を含める補正。
- 親フォルダのワッチョイ上／下4桁検索画面と検索ロジック。標準ツールバー設定に検索2項目を登録し、既存の下4桁検索経路にも接続。板チェック・折り畳み・カレンダー・全対応板選択・再開・ZZZSearchを維持。
- 旧Haiagaru-MorpheフォルダのKyodemoテーマ属性補正。

配布物は単一のMPPバンドルにまとめる。動画ビューア等の既存のパッチ選択は維持する。開発時の内部識別は `1.8.16-dev.1`、配布候補は `1.8.16`。今回、正式・プレ両方の取得先を同じ1.8.16へ更新する。公開完了はGitHubのRelease・配布物・各メタデータを再取得して別途確認する。

## 検証の扱い

1.8.16配布候補: `:patches:build :patches:buildAndroid` 成功、Android用classes.dex入りMPPを確認。履歴内検索13ケース、人気レス7ケース、アーカイブ並び20ケース、関連スレ15ケースが成功。191／226／242元APKへの適用成功と初期versionCode=2100000000、226／242で動画／MEGA／Imgur任意パッチ込みの適用成功を確認。端末未接続のため実画面での通し確認・Morphe更新表示は未確認。

配布候補MPPのSHA-256: `DCA6ADEB29B122FCB2FB56500B898C5A0E7172BD09D24EB096DE058FB2651DA4`。

追加: 4桁検索の履歴・キャッシュ保持制限を任意指定（0は無制限）。MEGA／ローカル共通ZIPへ履歴・保存結果／ページキャッシュの個別カテゴリを追加（初期オフ）。MPPビルドとdiffチェック成功。専用Androidテスト `scripts/VerifyWacchoiStorage.java` はコンパイル・DEX化済みだが、実行直前にADB端末接続が切れたため実機実行・ZIP復元は未確認。アプリへのインストール・公開は行っていない。

追加: ワッチョイ上／下4桁検索履歴・条件・結果をファイルへ保存し、保存結果表示と再検索を分離。履歴保存切替・履歴／ページキャッシュ個別削除を追加。ページキャッシュをファイル領域へ移行。MPPビルド成功。Androidテストでキャッシュ利用による検索・結果保存と、別プロセスで履歴を再読込できることを確認。アプリ画面での履歴選択・削除は未確認、追加版の実機インストールは未実施。

追加: 上／下4桁の検索をActivity非依存ワーカーと通知付きフォアグラウンドサービスへ接続（設定初期オフ）。上4桁のワッチョイ長押し項目・個別表示設定を追加。Android app_process上のキャッシュ専用テストで、画面なしの検索完了、投稿者・スレ名・本文の保持、リスナー切断後の結果保持を確認。通知許可・サービス起動・画面再接続を含む実通信の通し確認は未実施。操作・制約は [バックグラウンド検索](wacchoi-background-search.md) を参照。

追加: 人気レスを直接返信数で判定するポップアップを実装（初期オフ、独立閾値初期3）。判定7ケースとMPPビルドを確認。191／242元APKへのパッチ適用を確認し、226はブリッジのObjectシグネチャへ補正後にフック適用を確認。実画面の位置・既読数維持は未確認。操作は [人気レス](popular-replies.md) を参照。

追加: Haiagaru設定ダイアログ内でChMate標準のジェスチャー設定を使えるよう接続。戻る／閉じる／先頭／末尾を設定画面の動作に割り当て、タップや通常スクロールを残す。1.8.16 MPPビルド・191元APKへの適用・XIG05上の同一署名更新・起動を確認。ジェスチャー操作自体の実機通し確認は未実施。

追加: ZZZSearchに「スレ名だけ」「書き込み内容だけ」の検索ボタンを追加し、どちらも4文字なしで実行できるようにした。条件の組み合わせも可能。Hissi日付／板検索とエッヂDAT検索は4桁を使うため、上4桁（ハイフン前）／下4桁（ハイフン後）の指定は維持。MPPビルド・191元APKへの適用・XIG05への更新・起動を確認。検索サービス上の結果は未確認。

追加: エッヂ現行スレのワッチョイ検索元をeddibb.ccのsubject/DATからKyodemoのエッヂ板・スレHTMLへ変更。板ページ送り、投稿内の `wc` 情報、50レス単位の続きページを巡回する。4桁検索時に残っていた任意の不正値エラー表示もZZZSearch開始時に消去する。`:patches:build :patches:buildAndroid` 成功、191元APK適用成功、XIG05（730eae72）の `jp.co.airfront.android.a2chMate.haiagaru` を同一署名で上書き・起動確認。検索結果を含む画面上の通し確認は未実施。

統合版の `:patches:build` と `:extensions:chmate:assembleRelease` が成功。
関連スレ判定15件、アーカイブ並び替え20件、DAT補正6件（実機由来ログで360→361行、バイト数不変）、コンパイル済み削除ジェスチャーAPI探索4件、書き込みメニュー表示切替、上／下4桁・板全選択・ページ継続・公開インデックス照合を確認した。

生成物: `patches/build/libs/patches-1.8.16-dev.1.mpp`

初回統合MPPのSHA-256: `6A625AB10F0CA217ADD5F56BCE2CF1CD330B266F9219B42CE83BD3F143C3EE1D`（その後の追加実装を含む再ビルドとは異なる）。

初回統合版191をXIG05の `jp.co.airfront.android.a2chMate.haiagaru.xpreviewfix191` へ同じ署名で上書きし、起動を確認。全機能の通し確認は未実施。公開操作も行っていない。

その後、ZZZSearchのアプリ内表示を追加。検索文字列を引き継ぎ、戻る・外部表示へ対応。JavaScript描画を維持するWebView方式で、追加版の端末確認・インストールは未実施。詳細は [ZZZSearch](zzzsearch-internal.md) を参照。

ビルド成功と、パッチの191／226／242への適用成功、端末上での動作確認を区別する。過去チャットでの個別検証を、統合APKの通し確認済みとは報告しない。

次の報告は引き続き調査中で、今回の統合だけで解決済みにしない。

- あぼーん／レス番号アンカーのタップが反応しない。
- Talkスレへ「進む」で戻る最初の操作が効かない。

旧作業先のCookie・キー・端末データ・APK・ビルドキャッシュは統合しない。元の未コミット変更は保全する。

2026-10-18 追加実装: 四文字固定・必須チェックを解除。Hissiはワッチョイ部分一致、エッヂはKyodemoの投稿ID（`ID:/GNQXmAUz` の `/` を保持）・スレ名・各レス本文をAND照合し、IDなしの本文単独検索にも対応。エッヂ開始ではZZZSearchへ切り替えない。現行／過去ログを選択でき、板ページ送り・50レスごとの続き・走査上限からの再開を通常／バックグラウンド両方に実装。検索条件を履歴へ保存する。ZZZSearch関連／エッヂ関連の個別表示スイッチを追加（初期オン、検索画面を開き直して反映）。本文抽出の入れ子、投稿者名・フッター除外、ID先頭スラッシュ、任意ID、複数語ANDのローカル確認が成功。最新版ビルドと実機更新の結果は以下に追記する。
最新版の :patches:build :patches:buildAndroid と191元APKへの適用が成功。Kyodemoの実際の続きページから50レスの本文・次ページリンクを読めることを確認。XIG05（730eae72）の既存Haiagaruへ同一パッケージ・同一署名で上書きインストール成功、プロセス起動確認（24559）。実機の検索画面で入力から結果表示・表示スイッチ切替までの通し確認は未実施。
2026-10-18 404修正: Kyodemo過去ログ一覧の先頭2件（1792331885、1792331852）が404 / Dat not found、3件目（1792331851）が200となることを再現。通常／バックグラウンドの両検索で、スレ本文・続きページの404を未収録として数え、次スレへ継続するよう修正。板一覧の404や403・429・サーバーエラーの停止は維持。
404修正版のMPPビルド・191元APKへの適用が成功。同一署名を照合してXIG05（730eae72）の既存Haiagaruへ上書きインストールし、起動プロセス（12367）を確認。検索画面からの通し確認は未実施。
2026-10-19 走査上限緩和: 検索画面の初期値を20から100へ、入力可能な最大値を1,000から10,000へ変更。Hissiは一覧ページ数、エッヂはスレ件数。通常／バックグラウンドの両方でエッヂの板一覧を1ページずつ取得・走査するよう変更し、大きな上限でも全一覧の先読み待ちを避ける。停止・続きから再開を維持。
走査上限緩和版のMPPビルド・191元APKへの適用が成功。同一署名でXIG05（730eae72）へ上書きインストール・起動を確認（22766）。10,000スレ／ページ全件の実機通し走査は未実施。
2026-10-19: ユーザー指示で1.9.0公開を保留。先にエッヂ検索の走査上限0＝無制限、正の整数の10,000件制限撤廃を追加。スレ名入力時はKyodemoのbs/kt/fr/to/k付き板検索URLから一覧を取得し、サイトの検索語付き次ページリンクを追う。Shift_JIS（Windows-31J）で日本語・特殊文字をエンコード。指定test URLのHTTP200と検索語付き次ページを確認、URL生成・日本語／特殊文字・現行／過去・空スレ名のローカル確認に成功。
無制限・スレ名検索URL版のMPPビルドと191元APKへの適用が成功。同一署名でXIG05（730eae72）へ上書きインストール成功。1.9.0のRelease作成・公開・配布メタデータ更新は行っていない。全件走査の実機通し確認は未実施。
2026-10-19: ユーザー指定でエッヂも1〜10,000スレへ戻し、0＝無制限を廃止。初期値100、スレ名のKyodemo一覧検索と検索語付きページ送りは維持。バックグラウンド起動引数も1〜10,000へ制限。1.9.0公開は引き続き保留。

2026-10-19 1.9.0候補: 通信回数上限を追加（開始／再開ごとのページ取得試行、0＝無制限、キャッシュ再利用を除外）。履歴へ保存、通常／バックグラウンド両対応。エッヂのレス続きページ位置も保持。境界・超過防止・再開リセット・無制限の単体確認に成功。ユーザー指示により公開手続きを再開し、1.7.1／1.8.15からの比較案内を新規作成。バージョンを1.9.0へ更新し、Android用classes.dex入りMPPビルド成功。候補SHA-256: 84D0B334F7EBB82E5266A932F99127D0A16B747D7C70E7FC8683AF63DAE9B587。

1.9.0最終候補確認: 191元APKの標準パッチ、226／242元APKの動画・MEGA・Imgurログイン任意パッチ込みの適用が成功。3版のパッケージ名・versionCode=2100000000を照合。通信上限／検索URLと人気レス7・関連スレ15・直接動画URL21・HOMEキーワード保持19の確認が成功。XIG05の既存191へ同一署名で1.9.0候補を上書き・起動。全機能・実画面の通し確認とは区別。
2026-10-19 1.9.0公開完了: タグ1.9.0（ソースdcb8a0e）、GitHub Releaseはdraft=false・prerelease=false・Latest=1.9.0。Android MPP同一内容の2名称、JSON3点、SHA256SUMSの計6配布物を登録。GitHubの6配布物digestをローカルと照合し、公開MPP再ダウンロードのSHA-256も84D0B334F7EBB82E5266A932F99127D0A16B747D7C70E7FC8683AF63DAE9B587と一致。master/main/devの正式・プレJSON計6取得先が1.9.0であることをGitHub APIから再確認。masterの利用者別案内2点とRelease本文リンクを確認。191候補をXIG05へ上書き・起動済み（20727）。Morphe端末UIでの更新表示と全機能の通し確認は未実施。公開URL: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.9.0

2026-10-19 1.9.1候補: エッヂの照合対象を投稿ID／ワッチョイ上4桁／下4桁から選択できるよう追加。Kyodemo投稿ヘッダーのwcから抽出し、本文引用を除外。IDとワッチョイを結果に併記し、通常／バックグラウンド・履歴／再開へモードを引き継ぐ。合成ケースと実際の50レスを合わせた64項目の解析確認は成功。通知から検索画面へ戻るIntentへ検索条件を保持し、Activity再接続・再作成時に復元。画面再作成では編集中の条件を優先し、復元後の板選択も保持。通知からの復元操作を含む実画面の通し確認は未実施。ユーザー指示で今回の実機検証・インストールを省略して公開へ進む。

1.9.1公開候補のAndroid用MPPビルド成功。created_atは3配布JSONすべてタイムゾーンなしのYYYY-MM-DDTHH:mm:ss形式（Zなし）。MPP SHA-256: B03F58C96174CDE8090D290F55E96F441D37FB9290A9B715A53DB15381436517。

2026-10-19 Morpheメタデータ修正: 公開JSONのcreated_atに`Z`が付いた版があり、Morphe側のタイムゾーンなし日時形式と不一致だった。master/main/devの正式・プレ・版別JSONを確認・修正し、Raw URLを再取得。現在の正式／プレは1.9.2・created_atにZなし、参照MPPはHTTP 200を確認。Raw配信の最大キャッシュ時間は300秒で、更新直後に旧本文を返すことも確認。Morpheアプリ内の更新表示はADB未接続のため未確認。

2026-10-19 リリース手順: Morphe patches template由来のSemantic Release CIを導入。`master`を正式、`dev`をプレリリースとして設定し、既存のタグ・MPP名に合わせて`.releaserc`のtag／download URLを構成。READMEに生成用PATCHESマーカーがないためテンプレートのREADME自動生成ステップは含めず、既存の手書き案内を維持。手動メタデータ公開スクリプトを廃止し、今後の生成JSON／CHANGELOG／バージョン更新／ReleaseはCIへ一本化。Morpheアプリからの更新確認とGitHub Actionsの実行は未実施。

2026-10-19 1.9.1公開完了: タグ1.9.1のソース3755909、GitHub Releaseはdraft=false・prerelease=false・Latest=1.9.1。Android MPP2名称・JSON3点・SHA256SUMSの6配布物を登録し、全配布物のGitHub digestをローカルと照合。公開MPPを再ダウンロードしてSHA-256 B03F58C96174CDE8090D290F55E96F441D37FB9290A9B715A53DB15381436517と一致。最終MPPの191／226／242元APKへのパッチ適用成功。master/main/devの正式・プレJSON計6取得先を公開raw URLから再取得し、version=1.9.1・download_url・created_at=2026-10-18T16:01:28（Zなし）を確認。公開操作案内も取得成功。並行して行われた1.9.0の日時修正をdevへマージし、master/mainでも保持。1.8.16のversioned JSONをmaster/main/devとRelease添付から取得し、全4点が既に2026-10-18T20:00:00（Zなし）であることを確認、追加変更は不要。ユーザー指示により今回の実機検証・インストール・Morphe端末表示確認を省略。公開URL: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.9.1

2026-10-19 1.9.2候補: DAT落ち非表示はnative DROPフラグのみを参照し、設定変更時も板一覧向け再描画しか行っていなかった。未更新フラグを公式5chの過去ログ格納済みバナーで非同期補完し、HOME表示コピーと191／226の元リスト復元を更新。404・現行一覧不掲載・通信エラーだけでは非表示にしない。報告スレ1792155688はDAT404・現行一覧不掲載・公式HTML過去ログ表示を確認。実HTMLを含む判定21項目、API36エミュレータで191／226各51・242で17項目のネイティブ接続確認に成功。3版で報告スレのフラグ0からの確認、オフ復元、元モデル・flags不変、191／226の36回切替、242のAdapterData更新を確認。Android用MPPビルドと3版への適用成功、DEX接続・ポップアップ非接続も確認。署名SHA256は既存と一致。実機と実ユーザーの大量履歴を含む全画面確認は未実施。候補MPP SHA256: 9358D67880D2D07538DA27C714DFE0E8E205DDC02C3190C502B6B1EAA9D53129。created_atは3JSONともZなし。

2026-10-19 1.9.2公開完了: タグ1.9.2（ソース0897ff8）、Latest=1.9.2・draft=false・prerelease=false。Android MPP2名称・JSON3点・SHA256SUMSの6配布物を登録し、GitHub digestとローカルを全件照合。公開MPPを再取得し、Android classes.dex入りでSHA-256 9358D67880D2D07538DA27C714DFE0E8E205DDC02C3190C502B6B1EAA9D53129と一致。master/main/devの正式・プレ取得先計6URLを、クエリなしの実URLから再取得してversion=1.9.2・created_at=2026-10-18T16:55:56（Zなし）を確認。更新後のmain/devの正式JSONは一時旧版のRawキャッシュを返したが、切替後の全6URLを確認済み。操作案内も公開取得成功。公開スクリプトはPowerShellのISO日時自動変換で正常な文字列を誤拒否する問題をConvertFrom-Json -DateKind Stringで修正し、Zなし受理／Z付き拒否を確認（dff1f51）。API36エミュレータで191／226各51・242で17のネイティブテストを再確認、3版プロセスの起動を確認後に検証用エミュレータを終了。設定はテスト前の値へ復元、DAT／IDX／履歴DBは変更していない。実機と実ユーザーの大量履歴・全画面の通し確認は未実施。公開URL: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.9.2

2026-10-19 1.9.3修正: 追加ツールバー項目のコンストラクターでnative選択フラグを上書きしていた接続を廃止し、191 setButtons／226・242 setToolbarStateの描画時だけ全体表示設定を適用する。標準のチェック・コピー・設定保存はnativeのまま。ローカル自動バックアップは保存先設定を同期保存し、開いたダイアログへ通知、URIの日本語表示と同じフォルダ再選択時の管理情報保持を修正。ローカル復元はバックアップ内のcategoriesを初期選択し、注意事項から戻る際も選択を保持。Android向け1.9.3候補ビルドと191／226／242元APKへの適用成功。今回の端末での操作確認・追加テストは未実施。並行作業のSemantic Release導入を保持して公開へ接続し、既存master/main/dev取得先への生成JSONミラーをCIに追加。Morphe公式bundle生成器のcreated_atがZなしになることと、Gradle publishの依存にbuildAndroidが含まれることを確認済み。

2026-10-19 コピペ省略2: nativeフィルタがスレ読込時に組み立てられるため、設定切替を再起動確認へ接続し、標準SharedPreferencesの保存完了確認も追加。191の標準判定（先行レス番号と本文照合）・OFF分岐は維持。端末の省略表示は未確認。公開処理は独自ミラーを廃止し、テンプレート既存設定で正式・プレJSONを生成、masterからdev/mainへ戻す構成へ変更。初回の別履歴統合のみ過去featの再昇格を抑止し、公開後に通常のminor判定へ戻す。

2026-10-19 1.9.3公開完了: Semantic Release CI 39195451170成功。公式Latest=1.9.3、draft=false/prerelease=false。公開MPPを再取得してGitHub digestとSHA-256 630268B4FB3512C6D17A0C3740286B4352296E4E0E7A951862CE1E81DC5168A8の一致、Android classes.dex入りを確認。master/main/devの正式・プレJSON計6公開URLすべて1.9.3、created_at=2026-10-19T03:37:30（Zなし）、参照MPPの公開取得成功を確認。コピペ反映修正版のローカルAndroidビルド・191適用成功。今回の端末操作は未確認。初回履歴統合用のfeat抑止は解除し、以後は通常のminor昇格へ復帰。公開URL: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.9.3

2026-10-19 Compose設定・投稿検索UI: 設定一覧と全8カテゴリの項目、ワッチョイ／エッヂ検索、日付選択、保持上限、アイコン画像編集をCompose＋Material 3 Expressiveへ変更。元の保存キー・検証・再起動確認を既存リスナーで維持し、AndroidViewは使用しない。読む／探す・過去ログ／書き込む／画像・動画／NG／履歴／バックアップ／アプリ・通信へ再分類。全体の追加機能一覧、ツールバー表示の二重指定、エッヂ検索の本体ショートカット、長押しコピーの重複オンオフを廃止。ツールバーは標準選択フラグだけを使い、旧グローバル非表示・強制表示指定を参照しない。検索の有効化・通知・履歴保存・検索先表示・保持上限は検索画面内へ集約。検索オフでも入口を残し、停止を要求、保存データは保持。検索先の明示選択、条件／検索先復元、全板条件復元時の一覧準備、入力エラー表示と詳細欄展開に対応。
UI用0x7dリソース専用APKを整列して同梱し、API30以上のResourcesLoader／API21-29の独立AssetManagerへ接続。AndroidXライセンス・NOTICE同梱。最終 :patches:assemble :patches:buildAndroid 成功（build/compose-release-candidate.log）。最終MPP SHA256 D34A50A4A0439E6ED1707BE0E74A23A99093E07A4FC86E20412F5B5982BAE3C6。191標準、226/242動画・MEGA・Imgur任意パッチ込み適用が全て成功（build/compose-ui/final/）。3 APK内のUIリソース521258 bytes・SHA256 D7E466842A37321063F3F913500231E2A21927F957139B2BD1C3264C2704F527が元資材と一致。MPEは単一DEX・63636 method references／11053 classes。追加テスト・実機／エミュレータ操作・インストールは未実施。今回の変更はローカルdevのみで、push・公式Release・CI生成バージョン／メタデータ更新は行っていない。公開済み1.9.3とは別の開発候補。操作案内: docs/compose-settings.md。

2026-10-19 設定検索からのオン／オフ: 検索結果の設定行へnativeのチェック状態と有効状態のスナップショットを渡し、既存の保存リスナーを通した変更をComposeの再描画へ反映。検索結果に安定した行キーを付け、同じ検索語の設定変更時は200msの入力待ちと検索中表示への切替を省略。検索結果から直接変更・自動保存できる案内を追加。ツールバー等の専用画面へ移した設定は重複追加しない。:patches:assemble :patches:buildAndroid 成功（build/settings-search-toggle-build.log）。ローカルMPP SHA256: 5BDEF34B06EEFA5D390C3A2E6CE7605D07ECED0B946F4991D07832A78D72A0D1。今回の追加テスト・APK適用・実機／エミュレータ操作・インストール・push・公開は未実施。

2026-10-19 5chの「ﾜｯﾁｮｲで検索」からHissi切替: full-SLIP起動時にhissiTargetをnullへ固定しており、「hissi.orgで開く」で未対応板のToastになっていた。Hissiを選ぶ場合は既存の日別投稿者一覧検索へ元の板と上下両方のSLIPを渡す処理を追加。検索先Hissi固定、両方表示で前回Hissi選択の場合にも対応。以前使ったエッヂ／ZZZSearchの選択や初期android板への置換を防ぎ、実行中バックグラウンド検索の条件で初期入力を上書きしない。開始操作までは走査しない。:patches:assemble :patches:buildAndroid 成功（build/hissi-full-wacchoi-build.log）。ローカルMPP SHA256: 3D0AE5455FB9A688880CB12F9E144CA26554915E13F38BE496EDF7D230B6051F。追加テスト・APK適用・端末操作・インストール・push・公開は未実施。

2026-10-19 BEログインメニューへの画像投稿項目混入: 242 dev／Haiagaru 1.9.2での報告に対応。native ResEditFragment.d(Menu)はBE専用XML（0x7f0d0001）にも呼ばれる一方、従来フックはメニューを区別せず追加していた。191／226／241／242元APKの通常・ダイアログ両方のメニューXMLからversion／画像アップロード履歴のIDを確認し、両項目を持つメニューだけを拡張する共通判定を追加。Imgur投稿一覧とpreparePostingMenu経由のアップロード先・コピー履歴・外部板認証がBE側へ混入しないようにした。native BE項目は変更しない。:patches:assemble :patches:buildAndroid 成功（build/be-menu-upload-fix-build.log）。ローカルMPP SHA256: 532F40B235B246860423BC0AC0E6F680369436CBAABA157F9FF892DB04680355。追加テスト・APK適用・端末操作・インストール・push・公開は未実施。

2026-10-19 プレリリース1.10.0-dev.1公開完了: ユーザー指示によりdevへCompose UIと設定検索・Hissi切替・BEメニュー修正をpushし、既存Semantic Release CI 39239787523が成功。CI生成タグ／コミット545cd31、draft=false・prerelease=true。公開MPPとJSON2点を再ダウンロードし、GitHub digestとの全件一致を確認。MPP SHA256: 1C9AAFA3FDEA0DB9894D23E9FEF23179D4D245BD2A5FA5458E48AE6CD2415511。MPP本体のclasses.dex、Compose用リソースAPK（521258 bytes）、extensions/chmate.mpe（DEX magic 035）を確認。devの正式名／プレ名JSON両方の公開URLが1.10.0-dev.1・created_at=2026-10-19T10:47:24（Zなし）・公開MPP参照であることを確認。master/mainの正式JSONと公式Latestは1.9.3を維持。タグ内の操作案内も公開取得成功。今回の実機／エミュレータ操作・インストール・端末Morpheの更新表示は未確認。公開URL: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.10.0-dev.1

2026-10-19 設定起動クラッシュ修正: XIG05（730eae72）の元HaiagaruからMain dispatcher未検出を確認。MPEにMETA-INF/servicesがない一方、Coroutines consumer rulesがFastServiceLoaderを無効化していたため、Android直接読み込みを維持しfactory名文字列も難読化へ追従させた。この段階の別191でEmptySemanticsElementのNoSuchMethodErrorを確認。R8のkeepで名前が残るAndroidX／Kotlinクラス533個を、MPEマージ前に専用名前空間へ移す型・クラス名文字列の書換えを追加。native側の同名クラスは変更しない。
最終 :patches:assemble :patches:buildAndroid 成功（build/compose-isolation-fix.log）。修正版ローカルMPP SHA256: 47D258E5765E0A3B2CB581ACA50E6749D8A75EEE3E168D3996D1DB32DCAD6FBC。191標準、226／242は動画・MEGA・Imgur任意パッチ込み適用成功。ユーザー指示で最初に191別アプリ（jp.co.airfront.android.a2chMate.haiagaru.composefix191、表示名Haiagaru 設定修正版）をインストールし、設定一覧の描画とforegroundを確認。その後226／242を別パッケージcomposefix226／composefix242へ導入、226の一覧・スレを読む、242の設定・バックアップ画面を確認。最終PID191=16815／226=13432／242=1957のcrash bufferはいずれも空。最後に191の設定一覧へ戻し、再表示成功。UI階層の証跡はbuild/compose-fix191-final-ui.xml、compose-fix226-category.xml、compose-fix242-ui.xml。全機能の通し確認・Morphe端末内でのパッチ適用は未確認。
注意: 現行バンドルの互換対象は191／226／242のみ。241生成時に全パッチが非対応でスキップされたことをインストール前に見落とし、標準パッケージjp.co.airfront.android.a2chMateを241へ更新してしまった（lastUpdateTime=2026-10-19 20:45:11 JST）。データ消去は実施していない。ユーザーへ説明済み。元Haiagaruの別パッケージは変更していない。241は検証成功に数えない。以後226／242はaapt2の実パッケージ名を確認してから導入した。

2026-10-19 長押しワッチョイ検索・DAT設定説明: 「探す・過去ログ」に検索メニュー表示スイッチを追加。明示変更時はID75の表示を優先し、既存のnative非表示設定からも戻せる。上／下4桁と他項目の標準チェックは維持。長いTextView説明を入力欄ラベルへ押し込めず、短いラベル＋選択可能な全文説明へ分離し、経路入力を最低6行表示。設定検索でも説明を対象にする。:patches:assemble :patches:buildAndroid 成功（build/settings-wacchoi-help-fix.log）。ビルドには進行中の読み位置保持変更も含まれ、今回の変更後のAPK適用・端末確認・公開は未実施。

2026-10-19 最新設定修正版の実機導入: ユーザー指示でXIG05（730eae72）の191別アプリHaiagaru 設定修正版（jp.co.airfront.android.a2chMate.haiagaru.composefix191）へ、settings-wacchoi-help191.apkをinstall -rで更新。生成APKの実パッケージと前回検証APKの署名SHA256一致を確認して導入、Success。元Haiagaruの別パッケージは変更・消去していない。最新ローカルMPP patches-1.10.0-dev.2.mppにはワッチョイ長押し検索表示スイッチ・DAT説明全文表示と進行中の読み位置保持変更を含む。設定Activityを起動してforeground（PID2063）を確認し、同PIDのcrash bufferは空。長押し操作と各設定変更の通し確認は未実施。

2026-10-19 ワッチョイ全文検索の両検索先切替（451d6f4）: 5chの全文検索で、IDチェッカーの検索先固定設定にかかわらずKyodemo／Hissiの切替を表示。Kyodemoの直接結果表示とHissiの日別一覧走査を区別して案内し、検索条件・元の板・ﾜｯﾁｮｲW等の元表記を引き継ぐ。HissiからKyodemoへ戻る操作を追加し、日付・通信上限等のHissi入力条件を再切替時に復元。Compose画面名・検索ボタン・全文入力欄を整理し、全文モードの上側／下側選択を非表示。実行中は切替を無効化。最終 :patches:assemble :patches:buildAndroid 成功（build/full-wacchoi-provider-ui-final.log、7m8s）。ローカルMPPはpatches/build/libs/patches-1.10.0-dev.2.mpp（公開済みdev.2と内容は異なる）。ビルドには並行作業中の読み位置・バックアップ等の変更も含まれる。今回のAPK適用・実機操作確認・インストール・公開は未実施。

2026-10-19 投稿検索の設定トグル即時反映: SearchOptionsSheet内でSharedPreferencesを直接読むだけではComposeが変更を追跡できず、親画面のみ再描画され、設定シートのチェック表示が閉じ直すまで古い状態で残っていた。検索利用・バックグラウンド・履歴保存・エッヂ表示・ZZZSearch表示の5設定を共通のCompose状態スナップショットへ変更し、保存変更リスナーで更新。設定シートに同じスナップショットを渡し、各トグル行に設定キーを付与。設定シートのチェックと検索先表示が同じ値を参照する。:extensions:chmate:compileReleaseKotlin 成功（build/search-options-immediate-compile.log、56s）。今回のMPP再生成・実機操作確認・インストール・公開は未実施。

2026-10-19 全文ワッチョイ検索の両方向切替: Kyodemo結果画面とHissi検索画面に現在の検索先と切替を表示。元の板・全文・ﾜｯﾁｮｲW等の表記、Hissiの日付・通信上限等のフォームを引き継ぐ。全文モードでは上側／下側選択を非表示にし、Hissiは日別一覧の全文照合で検索する。固定のIDチェッカー設定でも全文画面の切替は表示。最終ビルド `build/full-wacchoi-provider-ui-final.log` 成功（7m8s）。端末での切替操作・インストール・公開は未実施。

2026-10-19 GIF専用再生を追加: 動画専用ビューアの任意パッチにGifViewerActivityと、ImagesViewer2Activityで最初に選択したGIFの入口を追加。外部ACTION_VIEWの直接GIF URLにも対応。Android標準Movieによるアニメーション、再生／一時停止、バックグラウンド停止、再読み込み、回転、URLコピー、外部表示、DownloadManagerでのGIF形式保存を実装。動画URL判定や動画サムネイル抽出にはGIFを混ぜない。URL UyaGPfQ.gifはHTTP200・image/gif・4,370,061bytesを確認。`:patches:assemble :patches:buildAndroid` 成功（build/gif-viewer-support.log、3m38s）。生成MPPは開発中の他の未コミット変更も含む。端末再生・APK適用・インストール・公開は未実施。

2026-10-19 バックアップ・新ダイアログ（公開前）: ローカル／MEGAの入口を別のCompose画面へ分離し、保存対象の設定も分離（旧選択を初回継承）。MEGA復元の初期選択をバックアップのcategoriesへ変更し、注意事項から戻った場合の選択保持も修正。履歴DBの既存行へ復元するときもnativeのflag（BBSThread.rating）とbookmark_orderを反映する。既読・表示位置・新しいタイトルは端末側を維持し、双方向同期では端末側の★を残す。191標準復元にHaiagaru形式ZIPが渡った場合はsnapshot.jsonを検証して専用復元へ振り分け、空のDBは作らない。報告された実バックアップ自体は未取得で、互換性の確認は専用データによる。
ローカル手動／自動の保存は書き込み、通常ファイルのfsync、ストリーム終了、保存先のSHA-256読み直し照合まで行ってから完了にする。進行中・完了・失敗の通知、未許可時の通知許可ボタン、MEGA操作通知を追加。クラウド提供元のサーバー転送完了を保証するものではない。長い案内はGitHubへ接続。
HaiagaruDialogをCompose／Material 3 Expressiveで追加。バックアップの復元項目・確認・エラー・進行表示、MEGAログイン、自動バックアップ、設定の再起動確認、IDなしNG、投稿者強調、アーカイブ元URLを移行。既存の入力検証、ボタン差し替え、dismiss/cancel、表示中の保存先・状態更新を維持。描画関数名ContentがComposeView.Contentと衝突して再帰する不具合をAPI36エミュレータで検出し、DialogContentへ変更して修正。再ビルド成功（build/expressive-dialog-recursion-fix-build.log）。固定候補build/expressive-dialog-fixed.mpp SHA256 F84C4BB81E8EB9D970D3E37CA274A43FBA7FD598B288A45CAD5330F10DAA5769。
検証: 旧実機730eae72の別アプリで★復元、既読維持、双方向の★維持、categories、CookieのみZIP、従来JSON、保存先読み直しの7項目成功。API36の専用Java fixtureでは保存不一致の失敗判定とnative ZIP振り分けも含め9項目成功（build/backup-final-emulator-fixture.log）。新実機d5497008（Mi Note 10／Android 11）にcomposefix191を別パッケージで導入し画面起動確認。新ダイアログの再帰修正前の版を先に入れたため、その後の修正版更新と表示結果を追記する。既存haiagaru／haiagarutestは変更していない。公開操作は未実施。

2026-10-19 ダイアログ修正版の導入: 固定候補F84C4BB81E8EB9D970D3E37CA274A43FBA7FD598B288A45CAD5330F10DAA5769から191／226／242すべてのパッチ適用成功（build/expressive-fixed{191,226,242}-patch.log）。191の実パッケージjp.co.airfront.android.a2chMate.haiagaru.composefix191をaapt2で照合し、d5497008へ上書き成功・バックアップ画面起動成功。API36エミュレータでも同じAPKを導入し、新自動バックアップダイアログの描画成功をスクリーンショットとUI階層で確認（build/fixed-auto.png、build/fixed-auto.xml）。プロセス10097のクラッシュバッファは空。バックアップの9項目fixtureは成功済み。全ダイアログの操作確認、実ユーザーの1.8.15バックアップの読込、226／242の修正版画面確認、公開は未実施。旧実機730eae72に入れた版は新ダイアログ移行前で、現在は切断されている。

2026-10-19 折り畳み端末の自動表示切替を現在のHaiagaruへ統合: 旧作業フォルダBinnosoko.javaとbuild/verification/fold-layout/verification.md、probe/test-fold-layout.pyを参照。旧記録には191／226／242の411dp⇔686dp模擬幅変更の実行結果があり、単純recreateでは191が切り替わらず新しいHomeActivityが必要なことを確認。今回FoldLayout.javaを新設し、Application起動・構成変更・Activityのサイズ変更／復帰を監視。画面幅600dp以上でenableTabletHome2=true、未満でfalseへ変更し、新しい本体HOMEから表示中スレ／取得できた板URLを再表示。ReadingPositionに切替専用の論理レス番号・オフセット引継ぎと構成変更直前のアンカー保持を追加。投稿・設定・メディア画面、閲覧画面上のダイアログ／入力中は切替を保留。連続サイズ変更は350ms待ち、同じ表示区分では切替しない。設定は「スレを読む→画面と操作→画面幅でスマホ／タブレット表示を自動切替」、初期オフ。オフ後は現在の本体手動モードを維持し、自動変更しない。操作・仕様・旧解析の範囲はdocs/fold-layout.mdへ記載。
最終 :patches:assemble :patches:buildAndroid 成功（build/fold-layout-final.log、4m34s）。MPPはpatches/build/libs/patches-1.10.0-dev.2.mppで、公開済みdev.2と内容は異なり、他チャットの未コミット作業も含む。旧解析の模擬切替結果は新APKの確認結果ではない。今回の追加テスト・APK適用・実機／エミュレータの開閉・タブ／読み位置の実行確認・インストール・公開は未実施。

2026-10-19 Imgur投稿一覧: Haiagaru設定の書き込む／画像・動画の投稿に「メニューに Imgur投稿一覧 を表示」を追加。haiagaru_imgur_web/showUploadsMenu、初期true。書き込みメニュー生成とクリック処理が同じ設定を参照し、OFFなら既存の追加項目も除去する。任意Imgurパッチ導入条件を維持し、設定内・ログイン画面の入口は残す。ImgurUploadsActivityをJava/native ViewからKotlin/Compose/Material 3 Expressiveへ移行。カード、サムネイル・日付・画像/動画/処理中表示、URLコピー、元スレリンク、ページ送り、全選択、選択件数と削除アクションの下部表示、確認と結果ダイアログ、読込中・空・失敗・再読込を実装。既存uploadPage/deleteUploadsを使用し、アカウント確認・削除対象検証・無自動再試行を維持。サムネイルは既存のサイズ制限／Cookieなし・リダイレクトなしローダーへCompose用コールバックを追加。:extensions:chmate:compileReleaseKotlin :extensions:chmate:compileReleaseJavaWithJavac 成功（build/imgur-uploads-compose-compile2.log、51s）。今回のテスト実行・MPP再生成・端末インストール・実画面確認・公開は未実施。

2026-10-19 ★スレの初期表示: ツールバー項目追加時のFavoriteThreads.TABの初期選択をtrueからfalseへ変更。191の旧モデルと226／242のToolbarButtonSpecの両経路で未チェックにする。保存済みの本体ツールバー選択は書き換えない。この変更時点ではビルド・テスト・端末更新・公開は未実施（後述の全UI移行MPPビルドに含む）。

2026-10-20 全UI移行（公開前）: 独自画面・ダイアログを49ファイルの一覧で整理（docs/compose-ui-migration.md）。NG管理、コピー／検索履歴、レス保存、外部板編集・認証、アップロード管理、置換／テーマ、巡回画像、メディア操作をCompose／Material 3 Expressiveへ移行。既存Viewは保存・検証のモデルとして残し、表示はComposeの入力・選択・一覧へ変換。共通ダイアログに複数選択、長押し、フッター、独自ボタン処理、adapter更新通知を接続。エッヂ過去ログの表示位置をComposeスクロールへ引継ぎ、非表示WebViewの後片付けをmain Handlerへ変更。WebView／VideoView等の描画、OS画面、本体へ注入する入口は既存部品を使用。Javaソースの標準ダイアログ生成と直接setContentViewは残存なし。全画面の動作保証を意味しない。
拡張がDEX参照上限を超えたためsyncExtensionでR8の全DEXに別名を付け、chmate.mpe／chmate-2.mpe以降として保持。Patcher extendWithAllと全DEX共通のAndroidX／Kotlin隔離表を使用し、分割間の型・文字列参照も同じ名前へ変更。重複除外によるコード欠落を回避。
Kotlin／JavaコンパイルとAndroid MPP生成成功（build/ui-migration-package-build.log、4分3秒）。通常LintはKotlin FIRの内部例外でModelUi.kt／HaiagaruUi.kt解析に失敗し、成功した生成コマンドではlintVitalAnalyzeRelease／lintVitalReportRelease／lintVitalReleaseを除外。恒久的なLint無効化設定は追加していない。固定成果物build/ui-migration-compose.mpp SHA256 F614F6A9CC3B93376C1A68B28F89368AD9E391B6BB7741E4472D26857C80B75D。Android classes.dex、拡張DEX2本とComposeリソースAPKの同梱を確認。Imgur一覧／表示設定と★スレ初期未選択、他チャットの未コミット変更も含む。公開済みdev.2とローカルMPPの内容は異なる。今回の追加テスト実行・APK適用・全画面操作確認・実機インストール・公開は未実施。

2026-10-20 HOMEのDAT落ち非表示修正（公開前）: 191のHOMEアダプターは実表示リスト`j`を使う一方、従来処理は`g`／`i`だけを絞り込んでいた。さらにnativeの再構築と検索結果公開が実表示リストを後から置換していたため、未読・履歴・スレへDAT落ちが再表示されていた。191の`g`／`i`／`j`、226の`g`／`d`、242の既存AdapterData経路へ対応し、native通知直前にも現在の順序と検索結果を保った表示専用フィルターを適用。元リスト、DROPフラグ、DAT、履歴DBは変更しない。XIG05の191実データでは40行中9行のDAT落ちを確認し、修正版の実表示31行・遅い再公開後も0行、検索順序・元データ維持・「既読スレを上に」と同じチェック欄書式を含む確認に成功。修正版APKの実機インストールは未実施。

同じ表示専用処理をHOMEの「下書き／送信済み」へ拡張し、「DAT落ちスレの下書きを非表示」と「DAT落ちスレの送信済み・書き込み先を非表示」を独立設定として追加。初期値は両方オフ。本文や送信履歴を削除せず、オフに戻すと再表示する。新規作成中やDAT落ちを確認できない行は残す。API36エミュレータの191実プロセスへnative型を接続したfixtureで、4通りの設定、下書き／送信済み／書き込み先の選別、オフ復元、元データ維持の14項目に成功。226／242の投稿行を含む実画面操作は未確認。

2026-10-20 投稿者IDからの連鎖NG: PosterIdChainNg／PosterIdChainNgPatchを追加。標準NGWordの同じルールで連鎖(8)と投稿者IDもNG(256)が有効な場合に、同一IDの別レスもネイティブ連鎖状態表へ登録。高度なNGの有効化は不要。191／226の再構築時はキャッシュを破棄し、241／242／243はNGエンジン単位で分離。130件の判定テスト、5版APKへの本番フック単体適用・レジスター／モデル／NGWord一覧検査・NGクラスDEX出力、Java／Kotlinコンパイル、:patches:buildAndroid成功。実機表示は未確認。現行バンドルの配布対象191／226／242は維持し、241／243は今回のフック単体互換性のみ確認。

2026-10-20 任意資材によるMPP軽量化（公開前）: 追加資材を選択した場合だけ生成APKへ格納するよう変更。Noto Color Emoji（TTF）、191 dev画像判定修正（4 ABIのZIP／対応APK）、画像VPN（AAR）をMorpheのファイル選択で指定し、SHA-256を検証してから組み込む。未選択時は端末標準絵文字・本体の画像判定を使い、VPN任意パッチはチェックを外す。3資材のGitHub直接URLをMorpheのオプション説明へ掲載。画像判定ライブラリはGitHub Rawから取得できる `optional-assets/haiagaru-image-ng.zip` として生成し、Semantic ReleaseのAssetsにも添付する設定。初回ユーザー向け手順とGitHub配布元・ソース・ライセンスをdocs/optional-assets.mdへ記載。:patches:buildAndroid成功（2026-10-20、初回3分48秒・リンク更新後39秒）。別配布ZIPは7,196,692 bytes（SHA-256 66A7EAA6EF0FD05F036FC7C8232CFA4821D1B98CE969002E8919C4A8DAC4DEBA）。同日生成MPPは5,090,395 bytesで、NotoColorEmoji.ttfと4 ABIのTFLite .so、VPN JNI .soが含まれないことを確認。ZIPを含む変更はローカルのみで、GitHub公開・Morphe適用・APK生成・実機確認は未実施。

2026-10-20 最新191フル版を別パッケージで実機導入: Downloads/chamate/chmate191の未改変191 APKへ最新MPP（SHA256 af1753a667cae3a86f45ce4f9be680821d0b18ba257a62c5cb640210755c7c3b）から7パッチ適用・再構築・署名成功。汎用サイトカード・GIF・MEGA・Imgur・VPN・絵文字フォント・画像判定修正を同梱。XIG05 730eae72へjp.co.airfront.android.a2chMate.haiagaru.full191として導入成功、HomeActivityのforegroundを確認。全機能の操作確認は未実施。署名鍵と証明書、APKハッシュをdocs/android-installations.mdへ保存し、今後は別パッケージを標準にするルールをAGENTS.mdへ追加。

2026-10-20 dev.2以降の統合確認: 別チャットのレビュー3件を現在ソースでも確認し、ZZZSearchでCompose更新コールバックを解除しない修正、動画サムネイル生成スイッチの再配置、小数入力のKeyboardType.Decimal引継ぎを追加。Kotlin/Java・R8・Android MPP生成成功（build/pre-release-integration-build.log、3分21秒）。Lintの既知のFIR内部例外のためローカル最終ビルドではLint3工程を除外。今回導入した191フル版はこの3件追加前の固定MPPによるもの。公開差分・操作・未確認範囲はdocs/release-1.10.0-dev.3.mdへ整理。

2026-10-20 02:14 JST 1.10.0-dev.3プレリリース公開: 統合コミット52c0f2eから公式テンプレート由来Semantic Release CI（run 39291750955）が成功し、1.10.0-dev.3を公開。MPP 5,477,765 bytes / SHA256 b799ad2745d407e748b048c2700fc0808bd6e6c7c6872ff2b4911c7714c1468c、画像判定ZIP 7,196,692 bytes / SHA256 66a7eaa6ef0fd05f036fc7c8232cfa4821d1b98ce969002e8919c4a8dac4deba、bundle JSON2本の添付とprovenance成功を確認。ローカル版からレビュー修正3件込みの191フルAPKも生成・署名成功したが、XIG05切断により再更新は未実施。APKと使用鍵の照合結果・固定MPPをdocs/android-installations.mdへ記録。

2026-10-20 スレ表示時クラッシュ修正・正式版準備: 実機XIG05のfull191からo.pa.onResumeのVerifyError（0x107、v0 Boolean→Object）を取得。API36 emulator-5554の修正前191でもFragment生成で同一例外を再現。再読込抑制を独立したstaticメソッドへ移し、呼出元レジスタを一切上書きしない方式へ変更。191の初回空リスト読込d(ZZ)から自動復帰e(I,Object)への接続へ修正。226のd(I,Object)、242のe(I,Object)も同じ方式へ揃え、226の設定入口を追加。元APK／生成APKの3版比較でレジスタ数・引数・分岐・他のnative命令・初回読込の保持に合格（scripts/VerifyResumeReloadHooks.java、build/verify-resume-hooks.txt、verify-resume226-hooks.txt）。
最終ビルド成功（build/crash-resume-final-build.log、3分32秒。既知のLint FIR問題のためローカルではLint3工程を除外）。固定MPP build/resume-crash-verified-candidate.mpp SHA256 ABC2A8DF3D18B80487E430984192263AFFA4938C2EE8C2B61BB4718AF19F3A4B。191は全7パッチ・任意資材込み、226／242はMEGA・Imgur・動画を含め、3版の適用・再構築・署名に成功。エミュレータのfull191／resumefix226／resumefix242でnative Fragmentの生成と復帰ポリシー各9項目、計27項目に合格（scripts/frida-resume-reload-regression.js、build/emulator-resume{191,226,242}-regression.txt）。初回・同一Activity内の復帰・Activity自体の復帰・無効化・スマホActivityをfixtureで確認。設定値は各fixtureの最後に復元。対象アプリの新規crash bufferなし。実機への修正版導入、公開スレの本文表示・タブ切替による通信回数計測は未実施。ユーザー指定の5ch／jpnknのHTMLは読取取得したが、ADBから公開URLを起動する操作が自動承認でblocked by policyとなったため、その通し確認に成功したとは扱わない。
標準NGWordの投稿者ID連鎖は統合済み実装を維持。高度なNG APIは単一レスのみを入力にするため、動かない自動連鎖JavaScriptは配布せず、同じNGWordの連鎖＋投稿者ID設定で実現する登録例と5レスの判定表をdocs/ngword-poster-chain-example.mdへ追加。docs/advanced-ng.mdから案内。正式版docs/release-1.10.0.md、README、使い方、復帰時再読込の案内を更新。公開は既存release.yml/.releasercによるSemantic Releaseを使用し、CI生成メタデータを手編集しない。

2026-10-20 正式版1.10.0公開完了: devの修正8aeb382をmasterへ通常マージ（82209b9）し、既存Semantic Release CI 39296681929が成功。Build Haiagaru CI 39296681923も成功。CI生成タグ／コミット57dca7c、Latest=1.10.0、draft=false・prerelease=false。master/main/devの公開取得先はいずれも57dca7cへ戻されていることをls-remoteで確認。CI生成のMPP・JSON2点・任意画像判定ZIPの4配布物を再取得し、全件GitHub digestとSHA-256一致。MPP=0C14E3592F671F9153A051E2CD13685E3BE36115E271688023868BA10B5B7FC0、JSON2点=C68BF6242BED3DAFE22E0B79B09C8B5DCC99E9E47711073A1B143296B2BCE7D4、ZIP=66A7EAA6EF0FD05F036FC7C8232CFA4821D1B98CE969002E8919C4A8DAC4DEBA。公開MPPのAndroid classes.dex、chmate.mpe／chmate-2.mpeのDEX magic、ComposeリソースAPKを確認。Shizuku用DEXは別資材として存在。JSON両方はversion=1.10.0、created_at=2026-10-19T17:45:54（Zなし）、公開MPP参照。タグ内のrelease-1.10.0.mdとngword-poster-chain-example.mdをHTTP取得できることを確認。公開URL: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.10.0

2026-10-20 高度なNG API v2・正式版1.11.0準備: Boolean互換を維持し、{match,samePoster,chainReplies}の判定オブジェクトを追加。本文条件の起点から同一投稿者の取得済み別レスと返信・孫返信をスレ内で展開。返信者の無関係な別レスへIDで広げない。空／システムID、循環・重複・範囲参照、時間／参照上限を処理。標準NGWord登録語句の自動参照ではなく、高度なNG内の条件を使用。設定ひな形、配布JS、API仕様、登録手順、README・使い方・リリース説明を更新。既存Semantic Releaseの配布資材へJSを追加。
追加レビューで226の単一レス判定と古いキャッシュを全元一覧の再判定へ変更。242の元NGマップを変更せず重ねたコピーを返し、無効化時の残留を防止。DAT結果から正確な板を接続。191は任意title欠落時も本文を判定。設定再読込と古い結果公開の競合を抑制し、API21/23非対応のMapデフォルトメソッドを使わない。
最終 build/advanced-ng-final-build.log 成功（3分4秒。既知のローカルLint FIR内部例外によりLint3工程を除外、恒久設定変更なし）。固定MPP build/advanced-ng-v2-verified.mpp SHA256 0E0CA6D419345D393FD59499F6945B8F6C5FD00037BE6280AC3DCE6B14FFDA92。563単体チェック合格。最終APK3版の適用・署名・emulator-5554への更新成功。実コントローラー59項目、ZZZSearchのabout:blank開閉／動画設定／小数入力9項目、復帰処理27項目に合格。226の復帰fixtureは一度Frida接続がタイムアウトし、検証用アプリ再起動後に9項目合格。実Compose入力欄のIME inputType=0x2002を確認。両APK検証スクリプトで3版のNGフックと復帰時の元命令保持に合格。新規アプリクラッシュ記録なし。実機導入と指定公開スレの通し確認は未実施。APK／署名記録はandroid-installations.md。公開結果は後記。

2026-10-23 必死チェッカーのタブ表示見出し: 専用ビュワータブでは汎用の「戻る／投稿検索・結果」上部バーを出さず、ビュワー自身の「‹ 必死チェッカー · ChMateビュー」見出しを表示。hissi.org／Kyodemoの切替後も見出しが欠落しないよう統一。191版のビルド成功。実画面の見た目確認は未実施。XIG05（serial 730eae72）の既存「Haiagaru191 設定検証」へ同一パッケージ・同一署名で上書き導入し、データを保持。導入後base.apkと候補APKのSHA-256一致。

2026-10-24 タブ見出し縮小候補（未公開）: 専用タブ見出し・×バーを既定16dp、範囲16〜20dpへ縮小し、エキスパート設定から通常カテゴリと重複するカテゴリ再掲を除去。通常Android build成功。XIG05 (`730eae72`) の242検証パッケージへ既存署名一致後にinstall -rでデータ保持更新、導入後pull APK SHA-256が候補と一致しTabletHomeActivity起動。実画面の縮小結果スクリーンショットは未確認。docs/android-installations.mdに詳細。

2026-10-25 チェッカーバーの追加作業: XIG05へ23:59候補を署名照合install-r導入し、実ページで操作バーのドラッグ20/80dpと再起動後の高さ保持を確認。レス/スレ/名前バーも独立20〜80dp、つまみ非表示時は保存高固定を追加し、通常設定/ビューア調整/ドラッグの保存先を共通化してビルド中。ユーザーは広告・広告枠だけの超軽量構成をアプリ内プリセットとパッチ時構成の両方へ追加することも希望。エキスパートでクラッシュ防止以外の追加機能・修正を選べるようにする依頼は未完了であり、UI修正の導入成功とは区別して継続する。

2026-10-25 続報・公開保留: Hissi/Kyodemoの操作バーとレス/スレ/名前バーの独立20〜80dp、つまみ表示OFFで高さ固定の242候補checker-bars-lock242.apkは署名照合install-r Success（APK SHA256 65D9A37BA1A9BAD98B87D76BE88C2DB3806B9F0163B8CC6845739587D5F2CDCC）。検索先切替バーも同仕様で追加実装し現在ビルド中。ユーザーは超軽量構成を次回プレへ延期し、今回は既存Release CIでプレ公開を希望。ただし他アプリから戻った追加タブの黒画面をbuild/tool-return-black-before.pngとtool-return-settings-settled.pngで確認し、未解決のため公開しない。Frida framework visibility hook中にSIGSEGVがあり、製品自然クラッシュと区別する。実機のライブ調査はユーザー操作と競合していたため、ユーザー回答「今は操作中なので後で」に従い00:52以降は実機操作を停止。修正完了/検証成功とは扱わない。

Hissi過去履歴: 809245b（2026-10-19、5ch全文ワッチョイからHissiへ切替）と451d6f4（全文検索先切替とUI改善）をgit showで確認。両コミットは日別一覧走査へ遷移する実装で、現在コードにも残る。参照アプリの公開HissiAdapter/CheckerQuery/HissiRecentSearchでは、板/日付/IDからBase64で投稿者URLを作る方式を確認し、ワッチョイ全文専用の直接検索は見つからなかった。コード流用なし。ID検索への置換をワッチョイ全文検索の代替として黙って実装しない。直接全文検索経路の調査は継続。

2026-10-25 公開前追試: 通常Lint付き最終build/prerelease-final-build.log成功（4m21s）。Mi Note10をユーザー許可で使用、専用242検証パッケージへデータ保持導入。検索タブ/複数タブの他アプリ復帰とプロセス終了後の復元、Part3本文と画像表示、新アプリcrashなしを確認。242 nativeタブfactoryレジスター/分岐/Fragment再基底化、cached検索wrapper、サムネイル2箇所のguard operandsを最終APKで検査。初回Verifierは他の既存setTextフックまで全クラス同一を要求して失敗したため、検査対象を今回のrequery2メソッドへ明示限定し成功。認証ポリシー54、保存件数24016、全文SLIP回帰も成功。黒画面は242のselected-page visibility再同期を追加しMi Note10で未再発、XIG05の固有状態/長時間利用は未確認。調査中SIGSEGVはframework全体Frida hookとの関連が疑われ、製品の自然クラッシュを修正したとは断言しない。広範なexpert/超軽量は次回、既存2項目のexpert UIのみ保持。共有NG別作業の9コミットは今回公開から除外する。

2026-10-25 1.12.2-dev.1プレ公開完了: 既存Semantic Release CI 40152656554 success。公開Releaseはdraft=false/prerelease=true、タグ1.12.2-dev.1。MPP再取得SHA256 E59F2FCC0B0FD57D3769109E539F9E85AFC1E9DB61C4CADC72773129EC362376がGitHub digestと一致。JSON2点も再取得、created_at=2026-10-25T01:59:40（Zなし）。dev raw正式名/プレ名両方version1.12.2-dev.1。公式Latest1.12.1を維持。公開元42cfd45、CI生成75a0812。共有NG別作業9コミットを含めずdev上で再build成功（build/prerelease-dev-confirm.log、1m3s）。191元APKへの適用/署名成功、nativeタブとcached検索hook命令保持検査成功。端末UIは242共通確認を採用し191の重複操作省略。公開URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.2-dev.1 。

次回の超軽量構成に着手。アプリ内プリセットは保存済み設定の復元を用意し、広告・枠除去以外の追加機能/常駐監視を停止する。パッチ時構成は単に全設定falseではなく、広告除去・再署名導入に必要な互換処理・クラッシュ回避だけを選別して組み込む。既存haiagaruBytecodePatchは機能hookと起動/署名対策が一体化しているため、冒頭の早期returnだけではクラッシュする。依存分離と対応版の起動確認が必要。今回のプレには未収録。次回公開も自動実施せず、実装/適用/端末検証後に扱う。

2026-10-25 テンプレート板選択の追修正（未公開）: SearchComposeUiの板コード直接入力を独立Compose選択画面へ置換。Hissi板一覧取得/更新、名前・コード検索、複数Checkbox、全解除、保存/キャンセル。検索フォームのselectedBoardsとは別の下書きSetを使い、保存時のみテンプレートprefsを変更。取得連打の重複リクエストをboardListLoadingで抑止。全文検索先は自動/hissi.org/Kyodemo/両方に変更、両方は板別前回選択を使い画面上で切替（postsOnlyにも切替表示）。外部板の全文検索は5ch.io名前空間へ正規化、エッヂは従来Kyodemoを維持。対応するHissi板が存在しない場合の検索結果は保証しない。旧値3（毎回選択）は両方へ意味変更。通常Lint付きbuild/template-board-picker-build.log成功6m25s、再build確認中。端末への新候補適用・実UI確認・公開は未実施。ユーザーの先行の軽量構成/カード位置対策等の未コミット変更は保持。
追記: 最終再build/template-board-picker-confirm.logも通常Lint付きBUILD SUCCESSFUL（39秒）。Java UP-TO-DATE、Kotlin再確認、最終MPP生成成功。端末未導入・未公開は変わらず。

2026-10-25 広告だけの超軽量構成の準備（未公開）: パッチ時構成をextensions/chmate-ads-onlyへ分離し、通常拡張DEXではなく21,360 bytesの専用DEXを同じMPPへ同梱。広告除去と再署名/パッケージ変更の互換処理のみ接続。31クラス追加、検索/Compose/動画/表示位置監視などの混入を禁止するAPK検査を191/226/242で成功（許可された呼出238/268/266）。通常Haiagaruおよび依存する任意パッチとの併用はmarkerで拒否。専用構成のImage NG/VPN追加データは不要。242専用APK43,648,076 bytes、通常候補66,710,614 bytes（任意パッチ/フォント条件も異なるため純粋なランタイム性能比較ではない）。

アプリ内プリセットに文字列置換、別保存先のワッチョイ長押し/レス操作、保存済み追加ツールバー項目のOFFを補完。退避情報は再適用で上書きせず、後から増えた対象キーだけ初回変更前に追加退避。元のキー不在も復元。絵文字補完を新しいexpertスイッチへ接続し、OFFで起動時のフォント読込/表示監視/行走査を停止（再起動反映）。既存の位置補完/カード保持/条件付き取得切替もプリセットでOFF。広範な非クラッシュ修正の全任意化は未完了。アプリ内プリセットは既存の全フックを除去する構成とは区別。

通常Lint付きbuild/ads-only-isolated-runtime-build2.log成功3m43s、その後の最終再buildはPCコミットメモリ不足でdaemon停止。使用メモリを抑えて直列再build/ads-only-final-retry-build.log成功4m33s。最終MPP build/ads-only-final.mpp SHA256 0D5F46F7CD17DDD3B5321FD44C1ACA8DF85560F0A2B8A0098CBE5AB9E5FD556C。191/226専用候補と通常242設定確認候補はこのMPP。専用242は直前の専用runtime同一候補MPP（台帳参照）。

Mi Note10に広告専用191/226/242をそれぞれ別パッケージで追加し起動プロセスを確認、242の初回案内/Home表示スクリーンショット確認。既存通常242は署名一致でデータ保持更新。広告プリセット適用/再適用/キー不在復元/追加キー退避/追加ツールバーOFFと正確な復元13項目合格、検証後は全保存先を元へ復元（build/ads-only-preset242-frida.log）。226専用runtimeで広告collapse/Activity content保護/空popup host保護/通常レス維持/null Intentの6項目合格（build/ads-only226-runtime-frida.log）。新規アプリFATALなし。本文/画像の通し操作・長時間利用・性能測定は未完了。URL付き起動コマンドは実行環境のポリシーで拒否され、成功扱いにしていない。公開操作なし。案内docs/ads-only-configuration.md。

同時作業の242取得済み検索は通常242候補に含まれ、実native画面で下4桁チェックの表示位置、ON/OFF、手入力維持、Activity再作成後の状態/元query復帰の16項目合格（build/cached-wacchoi242-final-frida.log）。全文検索先routing検証はfixture側のConsumer実装/経路捕捉に問題があり未合格、検索先実動作の解決済みとは扱わない。

2026-10-25 ローカル自動バックアップ保持件数の再調査（未公開）: 既存削除判定は作成済みファイルURIへgetTreeDocumentIdを要求し、plain /document/idを返す保存先では例外をUNVERIFIEDとして削除しない経路があった。LocalBackupDocumentsを追加し、選択フォルダの直接子一覧のdocument ID/名前と管理記録を照合、削除用URIは選択treeから組み直す。別authority/別フォルダ/手動ZIP/未管理ZIPは削除しない。記録内のplain/tree別名をcanonical化し、同一ファイルを複数件として最新世代まで消すことを防止。既に管理記録が失われたZIPの自動削除はしない。

scripts/TestLocalBackupProvider.ps1によるAndroid documents API代替fixtureで13項目成功（8件から最新5件、削除URIのtree権限、異なるauthority/移動済み/手動/未管理の保護、権限拒否、削除失敗、URI別名）、既存保持ポリシー24016項目成功。build/local-backup-provider-tests.log。実際の利用者保存先の調査/ファイル削除は未実施。初回buildはPCコミットメモリ不足でdaemon停止、低メモリ設定で再build中（build/local-backup-retention-retry-build.log）。接続Mi Note10は途中切断、XIG05接続復帰。端末更新/公開は行っていない。

2026-10-25 外部チェッカー連携（作業中/未公開）: ユーザーからIssue7の許可提示、APIで所有者の許可を確認。送信側main e5dd048のThreadOpener/ExternalThreadAppsを参照（流用なし）。Edge2hostのcanonical/short URL受信filterをOpenUrlActivityへ追加、短縮リンクのレス番号/範囲/query/fragment保持正規化、Hissi明示OpenUrl入口を追加。専用viewerパッチ設定OFF時にもHissi受信filterを残す。外部送信側「他のアプリ」からの動的URL検出向け、固定パッケージ宛の専用Haiagaru選択は受信側のみで解決できない。送信側変更/PRは未実施。ExternalCheckerLinksTest 20ケース成功。checker-handoff-compile.logでKotlin/Android Javaコンパイル確認中。前件backup保持はprovider13+policy24016成功だが最終Android build2回ともPCコミットメモリ不足でdaemon停止、端末導入/実データ削除なし。
追記: build/checker-handoff-compile.log BUILD SUCCESSFUL（2m2s）、patches KotlinとAndroid Javaのコンパイル成功。LocalBackupDocuments/ExternalCheckerLinksの最終class生成確認。最終MPP生成・端末導入・外部送信側からの通し操作は未実施。

2026-10-25 XIG05導入: checker-handoff-install-buildはLint中メモリ不足停止、生成済み最適化結果を再利用しchecker-handoff-install-retry.log通常Lint付きBUILD SUCCESSFUL 2m40s。最終MPPから通常242APK適用成功、署名照合データ保持更新Success。カスタムパッケージでEdge短縮URL/Hissi URLのVIEW解決を確認、PID12850起動。端末から実検索/バックアップ整理の通し確認は未完了、公開なし。詳細台帳参照。

2026-10-25 1.12.2-dev.2プレ公開完了: ユーザー明示指示により軽量構成を先行公開。Semantic Release CI40166087786 success、source210fd3d/CI26ee2a1、draft=false/prerelease=true。公開MPP再取得SHA256 F852A6F96234DAD501485AE1148A8A2FD14EDD66D0F90C27AA8D303ECDF956C4がGitHub digestと一致、classes.dex/専用21,360byte MPE入り確認。公開JSON version1.12.2-dev.2、created_at2026-10-25T05:36:55（Zなし）、dev rawプレJSON確認。公式Latest1.12.1維持。未確認範囲はRelease説明へ明記。URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.2-dev.2 。

2026-10-25 公式昇格指示: 今回追加したチェッカーツールバー右端×のみ未コミット差分から除去、dev.2と同じコードへ復帰、XIG05も署名一致データ保持で戻した。ユーザーより完了後の公式Releaseを明示依頼。既存CIでmasterへ昇格する。軽量構成は検証用任意パッチとして残し、dev.2記載の未確認範囲を公式説明でも維持する。

2026-10-25 エッヂ検索の戻る・上部操作の修正（公開前）: XIG05スクリーンショットで、native eddiタブ内に重複したタイトル/×ヘッダーとCompose検索画面を確認。検索の戻る/先頭ページからのスワイプをActivity.onBackPressedから元の×と同じcloseCurrentTabへ変更。eddiだけ重複ヘッダーを隠し、検索欄の開閉を上部バーの「戻る・エッヂ過去ログ検索・検索折/開・表示」へ移動。端末戻るキーも表示中eddiのcloseCurrentTabへ接続、API33以降の戻るcallbackは表示中のみ登録/破棄時解除。単独Activity側も同じcloseへBackHandlerで接続。ビルド・端末確認中。リモートmasterはb9f3117でdevの祖先、旧ローカルmaster ea548fbだけが別履歴。旧masterを保存したうえでorigin/masterから正式ブランチを作り直せば通常マージ可能。

2026-10-25 動画長押し・復帰広告枠（公開前）: 動画上長押しの2倍速とnativeジェスチャーの競合を抑止し、離す/キャンセル/背景移行で元の速度へ復帰。速度ボタン長押しを1倍速リセットへ変更。停止中の速度変更で勝手に再生しないようMediaPlayerの再生状態を保持し、一時速度は画面再作成に保存しない。通常広告除去に識別済み広告のみのattach連動PreDraw監視と復帰時の既知広告再確認を追加。復帰後にSDKがview/空wrapperの可視性や高さを戻した際に描画前に再非表示、変更フレームだけキャンセル。screen host保護とhideAd設定を尊重し、毎フレームの全画面走査を行わない。SC-56F/Android16実端末では未再現。古い800MB/1CPUビルドは追加依頼後の旧ソースを最適化中だったため、そのビルドのdaemon PID39724だけ終了。1500MB/2CPUで追加分込みの通常Lint最終ビルドsearch-video-ad-final-build.logへ再実行。

2026-10-25 動画追加操作と設定初期化（確認中）: ミュートはMediaPlayer/ExoPlayer個別の音量0/1で端末音量を変えず、画面再作成で状態保持。videoAutoplay初期trueを操作設定へ追加、OFFは初回の読み込み後も停止。コントロールバーの座標をsurface長押し/タップ/ネイティブgestureの検出対象から除外。「言語・基本設定」に初期設定へ戻すボタンと確認ダイアログを追加。既知の表示/操作設定キーと検索欄の表示設定、レス追加操作の設定を消してコード内初期値へ戻す。認証・履歴・登録NG規則・バックアップ保存先・ChMate標準設定を削除せず、反映には再起動確認を表示。通常Lint付きvideo-options-reset-final-build.log BUILD SUCCESSFUL 3m7s、MPPをbuild/search-video-ad-final.mppへ固定。

2026-10-25 端末検証: 広告再表示fixture9項目、隔離設定領域での初期値リセット7項目、ローカルMP4実MediaPlayerでの動画12項目（自動再生OFF、ミュート切替、コントロール領域、長押し2倍速/解除、1倍リセット、停止維持、一時速度の保存抑制）合格。外部サンプルは準備タイムアウトのためローカルfixtureへ変更。実設定は復元済み。初回のeddiタブ起動でNativeToolTabSwipeLayout.dispatchKeyEventがandroid.app.Fragment.getArgumentsを参照してVerifyError（build/archive-back-initial-verifier-crash.log）。placeholder superclassを書換える対象外のクラスからの呼出が原因。既存の反射経路arguments(Object)へ統一し、直接getArgumentsを呼ばないisArchiveFragmentへ変更、通常Lint付きarchive-back-verifier-fix-build.logを実行中。これを直すまで未公開。

2026-10-25 上部余白/戻る追修正（未公開）: XIG05でeddiタブ実画面の重複ヘッダー除去/折開切替を確認、初回VerifyErrorは解消。上余白はタブ内でもstandalone用insetsを適用していたためToolScreenUi.archiveへembedded=trueを渡し、TopAppBarのinsetsも0に変更。見出しは18sp/1行へ。旧候補はキーBACKが非フォーカスのpaneへ届かずアプリから出るため、TabletHomeActivity.dispatchKeyEventを独立3レジスタwrapperへ置換し、表示中eddiだけcloseCurrentTabへ。元メソッドはdelegateへ命令/レジスタをそのまま保持（継承時はsuperへ委譲）。新候補はarchive-final-back-build.logで通常Lint付きビルド中。

2026-10-25 最終ビルド状況: 上部insets修正のみはarchive-top-insets-final-build.logで通常Lint付きBUILD SUCCESSFUL 3m30s。Activity BACK wrapper追加後の通常Lintビルドはarchive-final-back-build/retry-buildでdaemon消失、再試行時PC空きコミット約994MB。恒久Lint無効化はせずローカル生成だけLint3工程を除外、archive-final-local-lowmemory-build.log BUILD SUCCESSFUL 1m、111 tasks。固定MPP build/archive-top-back-final.mpp。通常Lintは公開前のCIで成功を要求する。

2026-10-25 最終242確認: archive-top-back-final242署名一致データ保持更新Success。XIG05で上部空白除去、1行の「戻る・エッヂ過去ログ検索・検索折/開・表示」をスクリーンショット確認。画面内戻るで検索タブを閉じスレ本文へ戻ることをXML確認。PID28641新規crash bufferなし。VerifyArchiveBackHooksで242Activity wrapperが3レジスタ/元実装保持/元super委譲を確認。端末戻るキー試行中は端末の手動操作も入り、単独の通し操作の判定は保留。最終Frida再接続はptrace I/O errorで失敗、成功扱いにしない。通常Lint付きCI確認後に正式昇格する。

2026-10-25 Release説明更新: ユーザー指示により1.12.1タグからの107ファイル/3実装修正コミットを確認し、dev.1の操作バー高さ/走査テンプレート/間隔/ページ端/フィルター/外部板ブラウザ案内も正式説明に追加。READMEの最新master d08b69a（API blob573bc4c）でPayPayがp2p01_lf6ELD8pvzLJGHxrへ更新されていることを確認、HTTP HEAD200。origin.fetchがdevのみだったためmasterを明示refspecで更新し、README更新を通常マージで保持。READMEの支援者6名と寄付案内、今回の報告者4名を既存.releaserc headerへ反映。CHANGELOG/メタデータは手編集なし。最終MPPから191/226のパッチ適用・署名にも成功、3版VerifyArchiveBackHooksで独立レジスタ/元実装保持を確認。191/226の今回最終候補の再インストール・端末通し確認は未実施。

2026-10-25 公式1.12.2完了: source4d931f1/CI1128f9e。Release CI40172281344/Build40172281343 success、draft=false/prerelease=false/Latest1.12.2。公開6資材の全digest一致、MPP classes.dexあり、JSON2点version1.12.2/created_at2026-10-25T07:20:10（Zなし）。README謝辞/寄付/最新PayPayリンク/1.12.1全差分リンクがRelease本文に存在。公開MPP build/stable-1.12.2-publicへ保存。

2026-10-25 次プレ候補: 191の既存addQuickFilterToolbarChoiceカタログへ未選択のID0x7e000009/必死チェッカーDroid＋で開くを追加。既存クリック入口で明示HomeActivityへ起動、未導入/権限失敗を表示。ID/本文の自動送信なし。既存icon配列へ末尾追加。新バイトコードフックなし。接続中XIG05でcom.chikuwadon.hissidroidplus/.HomeActivityとResultActivityのVIEW/SEND受口を調査、実導入後の通し操作前に端末切断。プレReleaseはユーザー明示依頼、最終Androidビルドは既存CIで実施。別依頼のUA復元は作業ブランチ（ua-with-posting-20261025）/専用ローカルworktreeへ隔離し、このプレへ含めない。

2026-10-25 1.12.3-dev.1プレ公開完了: source84db386/CI f78a9f8、Semantic Release40173750692 success、draft=false/prerelease=true、Latest正式版1.12.2を維持。公開MPP再取得sha256 b106c1d84e5ac35e88d476b212c6ab5adf2d947d4c2b96a20e0d16145360da45がGitHub digest一致、classes.dexあり。公開MPPから191元APKへのパッチ/再構築/署名成功build/droid-toolbar-public191.apk、Droid＋追加drawable/登録名/明示HomeActivity文字列をAPKから確認。端末切断のため最終候補の実ツールバー編集/アプリ往復は未確認、Release説明に明記。UA復元版はローカル別ブランチ作業ブランチ（ua-with-posting-20261025） commit4e6a80cに隔離し、このプレには未収録。

2026-10-27 UA検出・Cookie割当検索（未公開）: 有効化後のテンプレートで不正ブラウザと表示される報告を受領。Chromium Dashの公式Stable APIを照会しWindows157.0.8103.15/Android156.0.8078.48を取得、テンプレートを完全なバージョン文字列へ更新。保存済みの旧156.0.0.0テンプレートも対応する新値へ移行し、設定インポート直後もUA選択時に旧値を解決。独自UAと有効/無効は保持、初期OFFとAndroid/Windows選択肢を維持（直前の既定ON変更は取り消した）。共通Cookieの割当候補一覧へ板名/URLのインクリメンタル検索を追加。実サーバーでの受理は未確認、公開なし。UA変更のリリース説明は追加しない。

2026-10-27 上記の確認: compileReleaseJavaWithJavac成功1m3s（build/ua-cookie-search-compile.log）。本番UAクラスと模擬SharedPreferences/HttpURLConnectionの18項目で旧テンプレート移行、設定インポート直後の解決、閲覧/投稿/認証のUA一致、OFF/未設定/独自UA維持、Cookieと元Headers保持を確認（build/ua-template-refresh-tests/result.log）。XIG05/730eae72のresumefix242画面に5ch投稿エラー「不正なブラウザを検出しました」を確認。読み取り時点のUA設定はOFF、保存値は旧Android Chrome156.0.0.0。失敗した送信時の実ヘッダーは未取得、UAの世代だけが原因とは断定しない。実機設定変更/投稿再送/更新インストールは行っていない。

2026-10-27 Dalvikテンプレートへ置換（最新指示・未公開）: 利用者がAndroid/Windows両Chromeテンプレートで投稿拒否を確認し、Chrome/Windows選択肢の削除と旧Dalvik形式のAndroid版別テンプレートを指定。上記Chrome更新案を置換し、Android4.0.3/5.1.1/6.0.1/7.1.2/8.1.0/9/10/11/12/13/14/15/16/17の14種を追加。Android版部分以外は提示されたDalvik2.1.0/HT-01/Build値を厳密に共通化。既定UAは旧4.0.3、保存済み組込Chrome4種のみ旧Dalvikへ移行し独自UAとON/OFFを保持。191/226/242は共通テンプレート経路で、新規バイトコードフック変更なし。compileReleaseJavaWithJavac成功1m1s（build/dalvik-templates-compile.log）、実クラスと模擬設定/java.netによる85項目成功（build/ua-template-refresh-tests/dalvik-result.log）。実機への導入・実投稿の受理は未確認。投稿再送やCookie/SessionID変更なし、公開説明にはUA変更を記載しない。

2026-10-27 Dalvik選択肢を3種へ整理（未公開）: 利用者の指定で14種からAndroid4.0.3（従来）/15/16へ縮小。共通UA形式と既存移行処理は維持。本番Javaクラスの再コンパイルと既存模擬試験30項目成功（build/ua-template-refresh-tests/dalvik-three-result.log）。APK再生成・導入・実サイト投稿は未実施。

2026-10-27 Dalvik3種版をXIG05へ導入（未公開）: serial730eae72/resumefix242へ署名一致install-r Success・データ保持、HomeActivity cold起動Status ok/PID20622、既存本文・画像・下書き画面と新規crash buffer空を確認。APK D6C558773191C9E02146D73FA6D3028010E3EA5A95FE73CC90C6982A34D9D71C、MPP E4C9604FC59CC01C49B6B28E2A2BB0F9C40F5CFDF9B9B842C8BA6C43C5EE5B2B。:patches:build成功26s、root buildの軽量版lintDebug/追加通常版lintReleaseは既存箇所を含むエラーで失敗（記録保持、恒久チェック無効化なし）。端末メニューの自動検査はFrida RPC/再attach失敗で未完了、ホスト30項目を超える成功とは報告しない。ユーザーの書き込み画面を維持し投稿操作なし、実サーバーのUA受理は未確認。詳細導入台帳参照。

2026-10-27 次プレ最終確認: X/URLカードの期限切れ再取得時に取得済みDataを保持し、X展開状態を表示行とnative復元測定行で共有。Android上でdev.2の高さ縮小6件を再現、修正版13項目と1000回bind/layoutの性能12項目・一時失敗再試行に成功（build/preview-layout-final-runtime.log）。ホスト回帰187項目、タブgesture36項目成功。Expert最上位は詳細項目の表示切替であることを明記、UAテンプレート選択を直下へ移動。実投稿は自動送信せず、利用者から投稿成功の報告あり。
191巡回停滞は226と比較調査中。両版のnative共通clientは接続/読込/書込の設定が各15秒で同じ。レスポンスclose命令も両版に存在。PatrolImagesの同期待機は画像自動保存ON時のみで設定初期OFF、報告時設定と停滞中スタックは未取得。原因断定や未検証のprotocol変更は行わない。今回の位置ずれ修正で巡回停滞も治ったとは扱わない。

2026-10-27 次プレ公開前検証完了: origin/devのdev.2を通常merge（e1b99b0）し、動画長押し倍速とGIF URI正規化を両方保持。統合後の通常:patches:build（LintVital含む）成功3m17s、build/prerelease-merged-final-build.log。固定MPP SHA25670FC681DDF1D801C446CE614686582362D54B676EFD5ECED18795E76F8C58552。191/226/242適用・署名成功、3版のUA request constructor元命令/レジスタ/分岐とnativeタブfactory/Fragment基底化・新タブ生成・下書き保存wrapperを検査。242 text binding142箇所/dispatch7箇所/write再入guardも成功。
Mi Note10 d5497008へ3版の既存署名照合install-r成功・データ保持、3版HomeActivity起動成功/対象PID新規crash空。242で既存履歴からPart3本文とサムネイル/画像全体表示を確認（build/prerelease242-thread-settled.png、prerelease242-image.png）。191/226の共通UI重複操作は利用者指示で省略。実View Expert ON/OFF・機能値保持・個別プレビュー位置保持ON/OFFと実処理参照・UA直下のテンプレート配置の9項目成功、設定はfinallyで元値へ復元（build/prerelease-expert-final.log）。初回fixtureはActivity基底クラスのheap検索で対象なしだったため、実HomeActivityを検索して修正・完走。製品不具合とは扱わない。
指定URLをADB intentで起動するコマンドは自動承認審査blocked by policyで実行されず、この方法は再試行していない。端末に既存の閲覧履歴から通常UIで本文/画像を確認した。191巡回停滞/報告Android16環境の長期再現、全サイト認証・実アカウント復元は未確認。追加全体lintReleaseの既存債務と必須通常ビルドの成功を区別し、チェックは無効化していない。公開は既存Semantic Release CIのみで進める。

2026-10-27 1.13.0-dev.3プレ公開完了: source b081e55、CI生成ef3e4c8、既存Semantic Release CI40369800386のRelease/Attestともsuccess。draft=false/prerelease=true、正式Latest1.12.2を維持。公開6資材を再取得し全件GitHub digestとSHA256一致。MPP6,504,251bytes/SHA2566FEA59B2582E57BAF8AFB4A0E2C90B1D48C074DF20514BDE9467EE8A572C3334。全ZIPエントリーを64KiB streamでCRC検証、classes.dexのmagic確認。初回検証はWindows cp932出力とPC仮想メモリ不足で中断し、UTF-8とstream方式へ変更して全件成功（配布物破損ではない）。公開JSON2点とdev raw通常名はversion1.13.0-dev.3/created_at2026-10-26T17:35:25（Zなし）、master/main rawは正式1.12.2を保持。UA変更記載なし、謝辞と追加ZIP案内あり。端末Morpheの登録先/表示版は変更・再検査しておらず、リモート公開確認と区別。公開先 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.13.0-dev.3 。191巡回停滞は原因未確定・調査継続、解消したとは報告しない。

2026-10-27 Cookie板判定・旧Cookieフォールバック修正: 利用者は5chとエッヂの認証を分け、5ch側削除によるエッヂへの影響を避けたい旨を明示し、不明時は従来Cookie利用を指定。191のRequestBodyはcontentLengthがbへ難読化されており、旧コードのメソッド名による足切りでbbsを読めなかった。3版のnative request/bodyフィールド・FormBodyのキー/値の役割・byte bodyのoffset/countを元APK命令で確認し、BoardCookieRequestへ読み取りを分離。本文にbbs/boardがある場合の逆向き誤判定、配列の未送信範囲の誤採用も修正。対象不明/未対応形式/読取失敗はscopeを外しnative cookie jarへ委譲、呼出後はfinallyで元scope復元。従来/板別Cookieの自動削除なし。設定説明と既存.releasercの次プレ説明を更新。nativeバイトコードフックは追加・変更なし。
通常:patches:build（LintVital含む）成功3m48s、固定MPP359775463E6416DD2E9BF4F3E4A9CCC7C10D22CA493123064A73477B030B5F47。3版適用/署名/署名照合install-r/TabletHomeActivity起動成功。Android上のnativeフォーム/byte body/Android板判定/不明時旧Cookieのload-save/OFF/ネストscope復元各20=60項目、Cookie分離・削除・復元21項目、host policy24+request19項目成功（合計124）。本番のHTTP送信とCookie削除なし、fixtureは合成データのみ。fixture初回はFrida server未起動、Androidのwritable dex拒否、hook返却wrapper再利用で中断したが、テスト環境/fixture修正後に3版完走。エミュレータ起動時のSystemUI ANR表示はWaitで復帰、ChMate3PIDの新規crash/ANR記録なし。242本文/サムネイル/画像全体表示とスクロール確認、191/226共通UI重複確認は利用者指示により省略。実機は接続が切れたためエミュレータへ切替、実サイトへの投稿再送はしていない。公開はユーザー指定により既存CIで次プレへ進める。

2026-10-27 1.13.0-dev.4プレ公開確認: source2e7952f/CI08f21af、Semantic Release40419763680再実行成功・Attest成功。draft=false/prerelease=true、正式Latest1.12.2維持。公開6資材を再取得し全SHA256とGitHub digest一致。MPP SHA256b1d90c66509fb7ab658d9ca472089360ed4fea398edcff6426f15df96e18b630。JSON2点version1.13.0-dev.4/created_at2026-10-26T23:30:30（Zなし）。初回GitHub push HTTP500は再実行で解消。build/prerelease-dev4-public-verification.log。公開先 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.13.0-dev.4 。

2026-10-27 次プレ最終確認: 同レスの画像/GIF/直接動画の左右移動、5操作の個別ON/OFF（スワイプ/長押し2倍速/タップバー/ChMateジェスチャー/GIF自動再生）、GIF URL単位の取得ロックと応答待ちキャンセル・壊れたcache無効化を実装。Native画像pagerへ静止画だけを渡し、隣接GIF先読みとの二重取得を解消。短縮URLSpanの元href/レス内順序を維持。191の既存dispatchTouchEventは別名へ元命令を保って退避しwrapperから委譲。242実動作24項目（build/media-gallery-ready242-runtime4.log）、191最終候補24項目（build/prerelease-media-network191-runtime.log、cancel318ms、各GIF1回）成功。host gallery19/cache19成功。
191巡回停止は過去の会話/解析docsを参照して継続。旧接続が2回目以降無応答になるローカル条件を再現し、native再利用で15013ms失敗、Connection: closeで527/80/60ms成功。191 reader15execute限定にRequest copy方式で設定追加、ユーザー指定により初期ON・明示OFF尊重。投稿/media除外・既存Range/Cookie/他headers保持。初期ON/明示OFFとnativeスコープ/Request不変性16項目、実設定Switch保存/復元成功。host headers14と既存TCP race20も成功。実回線の長期停止原因の断定はせず、HTTPエンジン/TLS/DNS/共有poolの全破棄は変更していない。詳細docs/chmate191-update-performance.md。
最終通常LintVital付き:patches:build成功（build/network191-fresh-verified-build.log）。固定MPP build/prerelease-media-network-final.mpp SHA256B30B9D14A2527343330329A847A43726D866CFD00E26A25327C2286FFFBC3196、3版パッチ適用/署名/既存署名照合install-r/TabletHomeActivity起動成功。3版image wrapper元命令/レジスタ/分岐、191immutable request constructor/fieldと15executeブリッジ検査成功。新規crash空、191本文とnative静止画表示確認済み。226共通UI重複はユーザー指定で省略。実機は未接続。Release本文は既存.releasercへ反映し、UA/機種名は追加しない。既存Semantic Release CIでプレ公開へ進める。

2026-10-27 1.13.0-dev.5プレ公開完了: source73cb2e6/CI89608f7、既存Semantic Release40432068865のRelease/Attestともsuccess。draft=false/prerelease=true、正式Latest1.12.2を維持。公開6資材を再取得し全SHA256とGitHub digest一致、MPP435D793D3A36E46A6A36C8325408449D2ADC82D872C4EDD90650044A32B2652F（6,513,712bytes）、全ZIP CRC/DEX magic確認。公開JSON2点とdev rawはversion1.13.0-dev.5/created_at2026-10-27T01:23:02（Zなし）、master/mainは正式1.12.2維持。本文に191の接続再利用対策初期ON/戻し方・未断定の範囲、メディア横断移動/5操作設定/GIF読み込み改善、追加ZIP案内・謝辞を確認、UA/機種名記載なし。build/prerelease-dev5-public-verification.log。CI生成コミットへFFし生成物の手編集なし。公開先 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.13.0-dev.5 。

2026-10-27 GIF/動画の標準動作とスレ全体ギャラリー（実装中・未公開）: 利用者は外部アプリ強制ではなくHaiagaru専用ビューアだけを使わずChMate標準へ戻す方式を選択。gifUseNativeViewer/videoUseNativeViewerの独立トグルとmediaSwipeWholeThreadを画像・GIF・動画ビューアの操作設定へ追加、いずれも初期OFF、設定共有/バックアップの型・既定値登録。GIF/動画のnative redirectと暗黙VIEW Intentの上書きを個別に止める。YouTubeは動画の標準動作設定を優先。専用ビューアと標準GIFの混在移動にも対応。
サムネイルのnative Intent factoryを3版で解析。191=ImagesViewer2Activity.RM_(Context,ArrayList,int)、226=ImagesViewer2Activity$read.d(Context,ArrayList,int)、242=ImagesViewer2Activity$RemoteActionCompatParcelizer.e(Context,List,int,List)。元bodyをhaiagaruNativeMediaIntentへ保持し、元引数すべてを渡す小さなwrapperでsource Contextと返却Intentへ追加一覧を添付。original links/index/sharedElementsを保持。登録済みfragmentのうちsource Activity一致/表示/WindowFocus/clip内のスレを対象に読み込み済みfullListを一度だけ走査。native flagsのNGを除外、URL順序と重複排除、別スレにしかないURL/複数候補の曖昧さはnative scopeへ戻す。native画像一覧からの起動も対応。スレ全体scopeでは4096件/96000文字/10000レスまでに制限しIntent肥大化を抑制、同レスscopeの既存128件上限とは分離。追加の取得走査・DAT読み書きなし。
通常LintVital付きmedia-thread-native-final-build.log成功2m44s、3版適用/署名、3版native Intent factory元命令/レジスタ/分岐と引数・source Context、既存画像touch保持検査成功。242既存署名照合install-r成功・データ保持。native factoryで2レスの画像/GIF/動画を順に収集・重複除去、OFF/他スレ/非表示NG除外、181件と選択位置保持、独立GIF/動画routing16条件、標準GIFへの切替とループ無し/標準GIF→専用動画、操作8実Switch保存/復元を含む29項目成功（build/media-thread-native242-runtime4.log）。既存同レスgallery/hold/tap/pinch/cancelも成功、HTTP待ちcancel331ms。初回Frida未起動とSystemUI ANRは環境側、Waitで復帰。fixture初版は既存のimmutable response bodyを書き換えてnativeキャッシュと不整合になったため中断。新しいnative responseを構築してmain thread内で一時一覧に差し替え、finallyで原一覧/設定を復元する方式へ修正し成功、実DATの変更なし。host MediaGallery24項目成功。
大きなthread scopeのURL正規化がタップDOWNのたびに繰り返されないようIntent単位・弱参照の不変snapshot cacheを追加。最終再build/media-thread-cache-final-build.logと最終242再適用・100回lookup/スレ全体移動を確認中。191/226は同じ追加Java cacheのUI重複を利用者の許可に基づき省略予定、nativeフックは3版で同一の検査を通している。公開操作なし。
最終確認完了（未公開）: build/media-thread-final-build.log通常LintVital込み成功2m34s、MPP build/media-thread-final.mpp SHA2564074906DB0D074EF37687BFDDBA92A0C9FDD675098A8F36B19B4793FEE9D647C。最終242へ署名照合データ保持更新、native Intent factory/touch元命令・引数・分岐再検査成功。実動作32項目成功（build/media-thread-final242-runtime.log）。全体scopeの選択位置保持/別レスへスワイプ/同レスswipe OFFとの独立動作/100回lookup同snapshot/旧sharedElements除去を追加確認、最終HTTP cancel329ms、新規crash空。191/226は同一factory/touch hookを前候補で検査済み、最終追加は共通Java cache/transition処理のため共通UI再検証をユーザー指定で省略。追加3設定は初期OFF・既定値と共有/backup登録済み。次の公開はまだ実施せず、.releaserc/生成metadata/公開版は変更していない。


2026-10-27 公式昇格準備: ユーザーがプレ依頼を公式Releaseへ変更し、Amazon Gift Card送付先areteruhiro@gmail.comとPayPay p2p01_FSEj08sDQx0enogOの掲載を指定。正式1.12.2以降の差分を確認して既存.releasercへユーザー向け説明を集約、UAと機種名の記載は追加せず、追加NG/VPN ZIPのダウンロードと非展開指定を明記。新規ビューア設定3項目は初期OFFのまま。masterのDependabot更新（Gradle9.8.1/Conventional changelog10.4.1）を通常mergeで保持。実装ソースが32項目確認済み5a83cceから変わっていないことをdiffで確認。Gradle更新後の通常LintVital付き:patches:build成功7m13s（build/stable-1.13.0-final-build.log、105実行/8cache）、チェック無効化なし。公開は既存Semantic Releaseのみ。mainは1128f9e正式1.12.2と同一treeの兼用mirrorであることを確認し、公式生成commitの正常mergeで同期する。


2026-10-27 公式CIのノート生成互換修正: 初回Release40440025717はgenerateNotesで停止、正式1.13.0のtag/Release公開前。並行Build40440026091はsuccess。master既存Dependabotがconventional-changelog-conventionalcommitsを9.3.1→10.4.1へ更新していたが、現在のrelease-notes-generator14.1.1はwriter^8で、preset10はwriter9以上を要求してMissing helperになった。既存package.jsonの互換依存を^9.3.1へ戻す1行修正。release.ymlや公開手順の再実装なし、Gradle9.8.1/README新PayPayは保持。実generator14.1.1+preset9.3.1を隔離buildディレクトリへ導入し、既存.releasercと実40コミットからgenerateNotes成功。画像/動画/Cookie/設定説明、NG/VPN追加DL、謝辞、Amazon送付先と新PayPay、非公開指定話題が出ないことをassert（build/stable-1.13.0-notes-compat-test.log）。確認コードは読み取り専用の検査でtag/metadata/Release操作なし。アプリ本体の変更なし、通常Android build7m13s成功と32UI項目の結果を維持。


2026-10-27 公式1.13.0公開完了: source d827954/CI生成4c957be、既存Semantic Release40440931196のRelease/Attestと並行Build40440931183すべてsuccess。draft=false/prerelease=false、GitHub Latest1.13.0。初回40440025717はpreset10/writer8互換エラーでgenerateNotes停止・未公開、既存依存を互換9へ戻して実40コミットのノート生成検査成功後に再公開。正式1.12.2以降のユーザー向け変更、GIF/動画標準設定・スレ全体移動の初期OFF、追加NG/VPN ZIPのDLと非展開指定、謝辞、Amazon送付先areteruhiro@gmail.com、新PayPay p2p01_FSEj08sDQx0enogOをRelease本文へ直接掲載。指定によりUA/機種名は記載せず。README同時更新a72e3e5も通常mergeで保持。
公開6資材を再取得し全SHA256とGitHub digest一致、MPP8E62C3C276556BC0262487889DCA50E309F0597F1C9C0436062BC44E054A75AA（6,515,292bytes）、全ZIP CRCとAndroid classes.dex magic確認。JSON2資材のversion1.13.0/created_at2026-10-27T02:53:34（Zなし）。既存backmerge pluginがdevを4c957be、mainをc677d58へ自動同期し、main/masterのtree一致を確認。master/main/devそれぞれ通常名/pre名の全6raw JSONでversion/created_at/download_url/signature_download_urlが公開資材と一致。メタデータの手編集や手動tag/Release/asset uploadはなし。端末Morpheの登録・カード表示は変更しておらずリモート公開確認と区別。記録build/stable-1.13.0-public-verification.log / stable-1.13.0-channel-verification.log / stable-1.13.0-release-retry-ci.log。主開発先devをorigin/devの公式生成commitへFFして整合。公開先 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.13.0 。

2026-10-27 取得済みスレ検索の作成日時順（未公開・検証中）: 利用者の画像gY6Hze2.pngはnative「取得済みのスレから検索」でアーカイブも検索する結果一覧。アーカイブ一覧とは別に検索画面へSpinnerを埋め込み、標準/作成日時新しい順/古い順を選択・即反映・独立保存。レス投稿日時ではなくnativeクリックURLのスレIDから日時を読み、同日時は安定順、不明は末尾。cachedSearchCreatedOrderの初期0/0..2検証・設定共有/backup登録。元検索条件/取得処理/結果件数を変更しない。
191のnative adapter m8.cはcallback SearchFragment$1.cで結果更新→notifyするため、そのnotify直前に元順のsnapshotを取り表示順だけ変更。切替時は元snapshotから再計算し表示行/クリック対象を同じリストで維持。226/242はnative Compose結果状態の描画入口へprojectを追加し、native状態と検索の元Listを変更せず、query/count/結果row identityを保持した新しい表示状態へ射影。状態はすべて結果表示のみで、検索条件/途中の検索処理/ファイル書換えなし。
通常LintVital付き:patches:build成功3m54s（build/cached-search-order-build.log）。host実クラス試験2011項目成功（同日時安定/不明末尾/1000件新旧順/元list不変/Edge URL/レス番号除外）。固定MPP build/cached-search-order-final.mpp。242/191適用・署名とスコープ/元命令/レジスタ保持検査成功、226生成中。検査呼出の初回はversion引数不足でfixtureのみ停止し、修正後2版成功。端末操作前にメモリ不足を避け検証用AVDを停止、適用後起動してnative検索画面の実UI/状態/legacyクリック一致を確認予定。公開はユーザーが実装後のプレを明示指定。専用リリース.mdは作成せず既存.releasercへ今回の変更・既存謝辞・最新Amazon/PayPay・追加ZIP案内を記載。
最終検証完了: 3版適用/署名/既存署名照合install-r/TabletHomeActivity起動成功、3版フック範囲・native body/register保持成功。242実検索UIとnative結果state20項目、191native adapterとクリック一致4項目、host2011項目成功。設定はfinally復元し検索native stateとファイルに変更なし。初回fixtureのfocus競合と191background attach SIGSEGVは計測経路として分離し、独立foreground新processで完走・新規crash空。226共通UI操作は利用者許可で省略。MPP SHA25620A34BC15C557B6E3A6F1DB1518F4C85A344C60E22D48CCCFE19B97120D6D96E、台帳記載。プレ公開は明示許可済み、既存Semantic Releaseのみで進める。


2026-10-27 1.14.0-dev.1プレ公開完了: source4dc452b/CI284a12a、既存Semantic Release40459460378のRelease/Attestともsuccess。draft=false/prerelease=true、正式Latest1.13.0維持。公開6資材を再取得し全SHA256がGitHub digest一致。MPP4A38650BA3EAEADB5786560AC7866C8D92166F87B27043447D24A19DD7489D8A（6,519,095bytes）、全ZIP CRCとAndroid classes.dex magic確認。公開JSON2点とdev raw通常/pre名version1.14.0-dev.1/created_at2026-10-27T06:11:20（Zなし）。master/main通常/pre名の4rawは正式1.13.0維持。Release本文の検索画面の新旧作成日時順・標準初期値・独立保存・件数やクリック対象保持・設定共有、追加ZIP案内、謝辞、最新Amazon/PayPayを確認。UA記載なし。検証build/cached-search-order-public-verification.log / cached-search-order-prerelease-ci.log。CI生成commitへFF、生成metadata/CHANGELOG/版表記の手編集なし。公開先 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.14.0-dev.1 。端末Morpheの登録/カード表示変更は行わず、リモート確認と区別。


2026-10-27 公式候補（未公開）: 最軽量191/226/242へ再署名後の投稿/画像UP/UPLIFTクラッシュ対策追加。191generated authのみ既存wrapper、session変更は導入せず。226生成認証/投稿・画像cache正規化、242Talk9calls/scoped primitive/画像/UPLIFT比較。32class/全extension参照解決成功、full runtime混入なし。241/243は現公開サポート対象外につき未適用、未検証分岐を今回追加から除外。Talk242/243既存算術fixture成功（242100003値）。
メディアnative Intent sourceがApplicationの経路にも対応、191f/226oの現page、242screen-local model登録からSavedStateHandle f.dを参照。DOWN時の選択を保持しnative途中移動後も元画像へ戻らない。3版factory/touch元命令/register/分岐と242model ctor保持検査成功。実操作36項目成功build/media-final-gallery242-runtime.log。
X/Siteカード有効のcold process復元を追加、初期native復元1.5秒/新着/明示レス/ユーザーtouch優先、復元中save抑制。実停止起動で103/-17px復元build/media-final-restart242.log。
全板検索は既存ff5ch TSV/native parser維持、登録済external+PINK subject補完を独立初期OFF設定、板名/URL検索・複数選択・保存/全対象/全解除。最大同時2/30秒/2MiB subject/3分cache/5000結果、失敗部分表示/新query cancel、Cookieを読まず送信なし。3版native URL/parser hook保持と各6runtime成功、1018host、選択UI6、実HOME入力→混在結果→スレ本文、PINK312行取得成功。
Hissi検索board catalogは独立single-flight worker/cache、選択変更はrestoreAllBoardsを解消、Compose lazy scopeへ新snapshotを渡し即反映。host9+242実UIチェック/件数/遅延catalog保持成功。最終通常LintVital付きbuild/hissi-board-selection-final-build.log成功3m34s。最終MPP 0DB6E20F198576394934632941D15A94FCCFD4AEF0A486BB489F1283D155AE84。台帳参照。最終共通UI差分の191/226重複はユーザー指定で省略。公式Releaseは明示許可済み、既存Semantic Releaseのみ。

2026-10-27 公式1.14.0公開完了: source d9a5b74（実装修正557cc6c）/CI生成3fbbbef。既存Semantic Release40485322757のRelease/AttestおよびBuild40485322581すべてsuccess。GitHub Latest1.14.0/draft=false/prerelease=false。公開6資材を再取得し全SHA256とGitHub digest一致、MPP4CE75438B2664C3CE835987F4CF6215A10D679D3B8E1F04B9B8E20E3080F5F03（6,538,382bytes）、全ZIP CRC/Android DEX確認。公開JSON2点とmaster/main/devの通常/pre全6rawでversion1.14.0/created_at2026-10-27T10:03:30（Zなし）/download/signature URL一致。Release本文に外部板検索の対象選択と初期OFF、板選択即反映修正、メディア左右移動/優先、process位置保持、最軽量クラッシュ対策、取得済検索並び順、追加ZIP案内・謝辞・Amazon/PayPay掲載確認。UA/機種名記載なし。公開後のMorphe端末登録/カード表示は変更せずリモート確認と区別。build/stable-1.14.0-public-verification.log / stable-1.14.0-channel-verification.log。CI生成ファイルの手編集なし。devはorigin/devの生成commitへFF済み。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.14.0


2026-10-27 メディア件数修正候補: 標準viewer native listは静止画/標準GIFのみで、左右swipe用のEXTRA galleryより小さいため1/1・1/2を表示していた。native counter setText一箇所だけをsetNativeCounterへ委譲（191d(I)/226a(I)/242VN10.e(IZ)）。native callbackはActivity index更新前にラベルを作るので、そのラベルのindex→native links URL→full gallery indexへ射影し正しい番号/総数を表示。取得・pager一覧・移動順は変更しない。3版パッチ適用/署名/フック元命令/register/branch保持成功。242実UI5項目とsingleton/異種gallery/fallback確認成功、通常ビルド3m19s。台帳参照。公式Release明示許可済み。

2026-10-27 公式1.14.1公開完了: source0d0c5cd（実装2723f20）/CI生成73e3342。既存Release40488386592/Build40488386487 success、draft=false/prerelease=false/Latest1.14.1。公開6資材すべて再取得digest一致、MPP09118B37C8598209BECDAA94A037ED98B9570790AE174E48D8F37B4523C9B189（6,539,904bytes）、全ZIP CRC/DEX確認。公開JSON2点とmaster/main/dev通常/pre全6rawがversion1.14.1/created_at2026-10-27T10:27:42（Zなし）/DL先一致。件数表示1/1・1/2修正、スレ全体galleryの番号/総数、設定名と読み込み済みscope、追加ZIP案内・謝辞・寄付をRelease説明へ記載。UA/機種名記載なし。build/stable-1.14.1-public-verification.log / stable-1.14.1-channel-verification.log。生成ファイル手編集なし、devをCI生成へFF。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.14.1


2026-10-27 サムネイル入口・動画操作プレ候補: 191の実レスサムネイルはRM_ factoryを通らずd(Activity,View,ArrayList,II)がIntentを生成するため、元launch直前にsource Activity/IntentをprepareNativeIntentへ渡す。元launch/reference/全registerを保持。226は既存factory呼出をDEX確認、242は既存model/factoryを維持。191実サムネイルから4/147→5/147→6/147→7/147→別レス動画8/147を確認（build/media-thumbnail191-fixed-click2.log）。3版適用・署名とフック元命令保持検査済み。通常LintVital付きbuild成功4m42s（build/media-thumbnail-controls-build.log）。
動画ミュート/再生速度をシークバー下へ移動、既存click/longClickを保持。videoLetterboxTouch初期trueを設定・共有/バックアップへ登録、ON時はmediaFrame内の余白までタッチ判定、OFFで従来surface。設定/コントロールは共通実装。226実サムネイル/指定横長動画の操作検証は未完。191成功後のエミュレータ停止はWHPX MMIO/qemu assertionで、アプリのクラッシュとは区別。再起動後ADB offlineで226 install失敗、消去/アンインストールなし。利用者が手元で動作確認するため先にプレ公開を明示したので、未確認範囲をRelease本文へ記載して既存Semantic Releaseから公開する。重大なアプリ回帰の再現は確認されていない。


2026-10-27 1.14.2-dev.1プレ公開完了: source f0398be/CI生成41d6265、Release40493362119 success。公開6資材digest一致・MPP CRC/DEX・JSON Zなしとdev raw確認、master/main正式1.14.1維持。MPP1e18533ce2ed644fc3728005104072566c6317b2ab3d3e39bacebbce4f5dccd0。build/media-controls-prerelease-public-verification.log。公開先 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.14.2-dev.1 。利用者より226スレ全画像移動も成功の報告。

2026-10-27 公式候補追加: 動画/GIFの戻ると︙はViewerCornerControls実Viewで右上/左上/右下/左下を個別指定、同位置は64dp離し、動画下隅は表示中controller高さを避ける。設定共有/backup登録、初期戻る左上/︙右上。動画model→Composeでspacerが失われる問題を実Viewへ置換。GIFも戻る追加/︙を別overlayへ移動。191/226回転は初期メニュー・OFFで元ボタン、元の有効/無効維持。native onPrepareOptionsMenuの先頭void呼出だけ追加、両版原命令/register/引数保持検査成功。
226のWacchoiLongPressMenu上4桁はapplication Context起動でNEW_TASK欠如。検索callbackを共通launchSearchへ統一し、ContextWrapper Activity→resumed Activityでtab優先、hostなし時のみcopy IntentへNEW_TASK。元Intent/query不変。実application Context→上側abcd検索タブ描画を確認（build/media-final-search.png/xml）、新規crash buffer空。試験用startActivityフックは実native tab経路が成功して呼ばれず失敗したため成功扱いせず、実起動表示へ切替。
ChMate戻るジェスチャーをmedia galleryより優先。native recognizerを使い戻るコード判定、Handlerで遅延通知されるためgallery切替をmain queueへpostして戻る完了/finish確認後のみ実行。他方向の画像移動を維持、pinch/toolbar除外。通常LintVital付きbuild/media-back-post-final-build.log成功2m41s、226最終適用/署名照合install-r/起動成功。Android実行で回転menu/screen/off3条件、GIFと動画各16corner配置、両viewerの非同期native Back完了を確認（build/media-corners226-final-runtime.log）。初回Back試験は向きのcode仮定が違い失敗、native field/逆コンパイルで実code4を確認して成功、製品を方向固定に変更せず。
指定横長MP4の実体をローカルHTTPで配信、portrait画面で余白tap/長押し2x/release/OFF無効/余白swipe/シーク下位置/実mute-speed tap8項目成功（build/media-letterbox226-final-runtime.log、build/video-bottom-controls.png）。エミュレータの一時wm sizeを元1920x1200へ復元。191/242の共通追加UI再検証は利用者許可で省略、191/226新menu hookは両版検査済み。全サイト検索/ネットワーク走査を開始せず、fixture設定はfinally復元。公式Releaseは利用者明示許可済み、既存Semantic Release CIのみ。

2026-10-27 公式CI40499852564は上下移動追加依頼でcancelled、tag/Release生成なし。スレ全体galleryのみthreadStepで上下移動を追加、上=次/下=前、同レス通常scopeは従来左右のみ。native Back優先を維持。MediaGalleryTest30項目、通常LintVital build/media-vertical-final-build.log成功2m46s。226最終適用/署名照合install-r/起動成功、GIF→上swipe動画→上swipe次GIF→下swipe前動画の3実操作成功（build/media-vertical226-runtime.log）、crash buffer空。共通Java処理の191/242重複は利用者指示で省略。元の公式許可に加え再度公開許可あり。

2026-10-27 公式1.14.2公開完了: source f9705b6/CI生成54e46ca、Release40500841546/Build40500841702 success。draft=false/prerelease=false/Latest1.14.2。6公開資材digest一致、MPP760b01c766182eb05015aebba2427f1ef704b7c6ee8f0e276b545d5c47aa402a（6,544,362bytes）全CRC/DEX確認。公開JSONとmaster/main/dev通常/pre全6情報version1.14.2/created_at2026-10-27T12:05:29（Zなし）。raw main初回1.14.1はCDN stale、GitHub branch main0f85905とcontents API全6件で最新確認。既存backmergeによる正常同期、metadata手編集なし。UA/機種名記載なし、ZIP案内・謝辞・寄付維持。build/stable-1.14.2-public-verification.log / stable-1.14.2-channel-verification.log。devを生成commitへFF、作業ツリー整合。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.14.2

2026-10-27 回転overflow修正: 利用者より︙回転不動報告。旧226のPopupMenu.performIdentifierAction直接試験は90度成功しており、全経路で再現とは断定しない。非表示button.performClick依存を除去し、root tagの共通RotationClickListenerを直接実行、191/226 native onOptionsItemSelectedへ対象ID限定handleMenuを追加。既存メニューはfalse分岐で元命令へ委譲。通常LintVital build/rotation-menu-final-build.log成功1m33s（前build3m9sは編集中hook更新取りこぼしをDEX検査で発見し、固定ソースで再build）。3版共通処理のうち今回適用191/226のみ。両版適用/署名照合install-r/起動/画像成功。Android上でnative onOptionsItemSelected経由90度、4回360度復元、画面button mode、rotation OFF不動を両版確認（build/rotation191-final-runtime.log、rotation226-final-runtime.log）。VerifyRotationSelectionHookで両版元body/register/operand/native fallback branch保持成功、新規crash空。SystemUI ANRはWaitで復帰、191再attach timeoutはforeground cold再起動で成功、製品不具合と混同せず。設定はfinally復元、画像fixtureローカルHTTP、Cookie/投稿なし。公式再公開を明示依頼済み、既存Semantic Release CIへ進める。

2026-10-27 公式1.14.3公開完了: source d246d5b/CI生成f542613、Release40507166406/Build40507166407 success。Latest1.14.3/draft=false/prerelease=false。公開6資材digest一致、MPP00fd7015b78e7f530a1c6c2b2c18bea4c58b1c11870c3e825c06179470ed3850（6,545,432bytes）全CRC/DEX確認。公開JSONとmaster/main/dev通常/pre全6件version1.14.3/created_at2026-10-27T12:53:22（Zなし）。回転修正、既存謝辞/追加ZIP案内/寄付を直接Release本文へ掲載、UA/機種名なし。build/stable-1.14.3-public-verification.log / stable-1.14.3-channel-verification.log。devを自動生成commitへFF済み。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.14.3

2026-10-27 GIF自動再生追加（未公開）: 利用者がX投稿1989826585013424339を指定。公開syndication metadataでanimated_gif/tweet_video/G51IpxIXsAAZGU0.mp4確認、HEAD200/video/mp4。X MP4 GIF専用xMp4GifAutoplay初期true、通常gifAutoplay・動画videoAutoplayから独立。native VideoViewエラー時にplayWhenReadyをfalseへ落としてからMedia3へ渡していたため、代替失敗時だけfalseへ変更。指定実MP4で自動再生ON（通常動画/GIF OFF）・OFF（通常動画/GIF ON）の実状態/再生位置進行成功（build/x-gif-autoplay-final-runtime.log）。
スレ内再生inlineGifAutoplay初期false、対応3版native body bind共通入口から通常GIF/公開X投稿GIF/direct tweet_videoを対象、レスあたり最初の1件。通常GIFはbounded GifMediaLoader・縮小ImageDecoder、X MP4は無音loop Media3 TextureView overlay。最大同時数inlineGifLimit1..8初期2、通常GIF取得上限inlineGifMaxMb1..64MiB初期8、共有/backup登録。画面外/非focus/脱着/再bind/OFF停止・解放、設定引下げで超過active停止。旧standard MediaPlayerで指定X GIFは失敗したため、専用viewerと同じMedia3へ変更。
最終通常LintVital付きbuild/inline-limits-final-build.log成功2m36s。226適用/署名照合install-r成功、実native本文に一時fixtureを表示して通常GIF再生・非表示停止、指定X投稿MP4再生・非表示停止、OFF解放、設定最小/初期/最大値成功（build/inline-limits-final-runtime.log）。fixture本文と設定はfinally復元、DAT変更/投稿なし。初回のIP URL抽出除外/静止GIF fixture/非表示body選択/Frida難読化API計測を修正、SystemUI ANRはWait復帰。新native hook追加なし、191/242共通UI重複は従来許可で省略。ビルド・限定runtime検証済み、長時間/多数同時再生の端末性能とscroll overlay位置は追加確認余地あり。公開は今回依頼されていないため未実施。

2026-10-27 公式1.15.0公開完了: 利用者の明示公開依頼後、既存.releasercへ独立X/GIF再生設定・inline初期OFF・1..8同時/1..64MiB・最初の1件・性能/表示位置の改善余地を説明。source8f0f0be/CI生成5a297f4、Release40522732808/Build40522732845 success。Latest1.15.0/draft=false/prerelease=false。公開6資材SHA256/digest一致、MPP41249a24c7a7f068416e6bd286ddf5becf4abe955d3f84261a2f9c20c0d98780（6,552,442bytes）全CRC/DEX確認。master/main/dev通常/pre全6JSONをGitHub contents APIでversion1.15.0/Zなし確認（raw devは一時CDN stale）。既存謝辞/NG・VPN追加ZIP案内/Amazon・PayPay維持、UA/機種名記載なし。build/stable-1.15.0-public-verification.log / stable-1.15.0-channel-verification.log。devを生成commitへFF、生成metadata手編集なし。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.15.0

2026-10-28 次版候補（未公開）: inline GIF/MP4を本文親のoverlayへ配置・可視本文領域clip/fit-center縦横比、Wi-Fi限定option追加。動画操作statusをframe内overlayへ移し高さ変動を抑制。サイトカードを本文View限定、ID内ドメイン部分一致を除外。エッヂ検索結果長押しコピー4種、Hissi時間帯別件数/当日順位表示を実装。スレ内検索本文+名前+ID+SLIPと空白/AND対応native hook（191/226/242）を追加、226はoverloadを引数型でも選択。Hissi専用ビューアのID/ﾜｯﾁｮｲ検索に日付範囲とHissi/Kyodemoを追加、エッヂ検索はID:を保持したKyodemo結果へ直接遷移、開始日/終了日カレンダー対応。既存投稿検索フォームにもID:条件対応。既存未コミット差分を保持して統合。
通常LintVital付きbuild/device-review-edge-direct-build.log成功5m14s、MPP build/device-review-edge-direct.mpp SHA256 EDAAE583C569C0A80337AA47FE211B95A8FE4CAFF732F24D89B56D6AF99DF157。host Kyodemoルーティング（ID:G5TW0FSD0維持を含む）/URL37項目/検索33項目成功。inlineの限定runtimeはbuild/inline-aspect-wifi-runtime.log参照、実Wi-Fi切替とスクロール見た目は未確認。グラフ実サイト/ID期間の実検索/コピー長押し/動画操作の最終UIは未確認。ユーザー自身で検証するため191/226導入を依頼、XIG05切断後にユーザーからエミュレータ使用へ変更指示。公開操作なし。

2026-10-28 追加HOME操作バー（未公開）: 242限定homeSelectionBarBottom初期OFF、通常設定/Expert投影/共有backup登録。onViewCreatedにvoid helperのみ追加し元命令保持、native binding n.dの選択バーをtranslateして元のボタン/クリック処理を維持。enclosing list frameへバー実高のbottom paddingとclip設定、終了/OFF/脱着で復元。通常LintVital build/home-selection-bottom-build.log成功5m18s、242適用/署名照合更新/cold起動成功、新規crash空。実HOME複数選択→設定ONで全5操作表示を下部へ移動、barY1048/height120、contentY232/height936/paddingBottom120、content下端1048でbarと重複なし。全選択/全解除タップ（表示中は板見出しのみ、実スレ選択件数/削除実行は未検証）。終了時padding0復元。build/selectbottom.xml、home-selection-bottom242-hook.txt参照。191のカレンダー開始日を20261026にしてEdge検索、結果IntentがKyodemo e_e_liveedge/k=ID%3AG5TW0FSD0/fr=2026-10-26/to=2026-10-27、query ID:G5TW0FSD0/forceKyodemo trueを確認。検索結果実データ一致は未確認。

2026-10-28 プレ公開統合: origin/devの1802872(ID期間検索)/5ed4b92(作成日時順)/CI a371712を通常mergeし双方を保持。Kyodemo ID期間検索のID:付与と重複検索ボタンを補正。通常LintVital build/poster-media-integrated-build.log成功3m49s、最終MPP build/poster-media-integrated.mpp SHA25629DFA200B1480A3FCF630FDBF942AAAA7377AA301D447B7895F7C902D2532F35。242適用/署名照合更新/cold起動/Part3本文表示、新規crashなし。検索hookの元分岐/response register保持DEX確認。host検索33/URL37/Kyodemoルーティング成功。動画操作status変更前後frame1920x1104不変を実確認(build/poster-media-video-bounds-final.log)。検査用Fridaはfield名/overload/View cast補正が必要で中間失敗を成功扱いせず。media回帰前半12項目（native factory/gallery/GIF→動画/hold/tap）成功、旧toolbarSwipe fixtureは現在非表示のtoolbar座標を使うためurl未取得で中断・全suite成功とは扱わない。余白テストも横長画面のgap12で中断、設定変更/製品クラッシュと区別。これら既存共通ジェスチャーの重複全確認は未完、本文/各media表示と変更位置は別確認。グラフ実サイト/ID検索結果/実Wi-Fi切替/長時間inlineは未確認として公開本文に記載。公開は既存Semantic Release CIのみ。

2026-10-28 1.16.0-dev.3プレ公開完了: source7c2955b/CI生成2c6d808、既存Release40606984462 success。draft=false/prerelease=true、正式Latest1.15.0維持。公開6資材をghで再取得して全SHA256/digestとZIP CRC一致、MPP ff52fa638526baded5bcde8a607a675c8d938de47a420f4d6add5f3e8d453228（6,562,895bytes）。dev通常/pre双方1.16.0-dev.3、master通常/pre1.15.0をcontents API確認。build/poster-prerelease-public-verification.log参照。公開説明は.releasercへ直接、今回全変更/未確認範囲/謝辞/追加ZIP/寄付維持。最終統合242で本文・標準画像・GIF・動画表示成功（poster-media-image-gif-final.log）と新規crash空。公開先 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.16.0-dev.3 。

2026-10-28 ひらがな長文対策（未公開・検証中）: 利用者がUA変更時の69〜71 https://krsw.5ch.io/test/read.cgi/gamesm/1792975494/69-71 を例示、送信防止と受信NG両方を指定し、送信防止は解除不可を明示。GET取得本文（各1959文字）で判定成功、UAヘッダー変更と本文生成の因果は確認されず。KanaFloodRulesは空白除外1200文字以上/ひらがな98%以上/空白を挟んで600文字以上連続という構造判定。意味推定なし。送信guardはnative preflight先頭で実行しbypassPostPreflightより優先、解除キーを一切持たず本文変更/送信なし。ブロック時EditTextエラーとToast、下書き維持。受信は初期OFF hideKanaFloodPosts（NG設定・共有backup登録）で既存191/226 NG overlayと242 mapへ透過NGを合成、DAT/元NG map不変、本文の判定はresponse弱参照cache。host12検査成功（報告3投稿/境界/日本語/句読点/URL等）、scripts/KanaFloodTest.java。初回buildは直接AndroidX Fragment参照がcompile依存に無く失敗、既存native binding内Viewを調べる方式に変更して再build中。未導入・未公開。

2026-10-28 仕様変更: 先のKanaFlood送信防止/専用NGコードをすべてHEADへ復元、未追跡KanaFlood2クラスとtestを削除。投稿patch/Haiagaru/HiddenIdNg/SettingsProfilesは元treeと一致。高度なNG「どの条件を作りますか？」にF9スクリプト対策template追加（body、編集/無効化可）。漢字偏重・文字多様性・句読点有無と長いひらがな羅列のheuristicで、F9本人/意味判定ではない。新指定poverty1792647495の2〜22/24計22例＋旧3例＋通常7例=32項目を実Rhino1.8.0 sandboxで成功。初版char loopは250ms上限に達しnative regexp優先へ改善、通常住所誤検知も除外。
自動更新F9NgUpdates: 利用者は最終的にGitHub配信を選択。rules/f9.json（format1/version1/script）を追加、既定URLはraw GitHub dev/rules/f9.json。自動更新初期OFF・アプリ初期化時24h間隔、手動更新/URL指定、HTTPS/5回転送/15秒timeout/128KiB制限、syntax・sandbox検証、版増加のみ反映、オンオフ/板scope/編集済みscript維持、既存未編集の同scriptだけ置換。NG自動有効化/条件自動追加なし。更新失敗時旧設定維持、Cookie空指定、投稿や履歴の送信なし。Google SheetsはFC-NG/CSV200空を読み取り確認のみ、変更なし、CSV連携コードは最終GitHub選択で削除。配信JSONを実Rhino実行して内蔵script完全一致成功。初期Windows CRLF生成で不一致を検出しfeedをLF保存へ修正。builderのJava既定heap不足はSerialGC/小heapで回避、製品ビルド最終確認中。配信JSONは未pushでURL未公開。

2026-10-28 テスト配信ファイル公開: 利用者がGitHub配信ファイルのみ公開を明示。rules/f9.jsonのみを88ccbea chore[skip ci]でdevへpush、アプリ変更は未commitのまま保持。公開raw URLをcurlで再取得しformat1/version1・ローカル内容一致、実Rhino1.8.0で公開scriptと内蔵scriptの一致/通常文非一致/F9例一致を確認。https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/dev/rules/f9.json 。アプリRelease/tag/metadata変更なし。

2026-10-28 共有NG再検討: Morphe化して作成(19)の履歴と80abf16までの未統合9コミットを参照。利用者は個人NGをサーバーへ送り運営側でfilter、初回同意後に既存NGも一括送信を選択。docs/shared-ng-personal-submissions-plan.mdへ設計を保存。GAS受付/専用Inbox審査/GitHub承認済み配信、元Pendingは書込journalとして保持。送信と受信を分離、期間不明NGIDの推測なし、共有由来再送なし。設計のみ、個人NGの実送信・公開GAS変更・共有機能の統合なし。F9最終build成功8m54sは別作業、端末未確認。

2026-10-28 共有NG実装進行: 未統合80abf16までのSharedNg/Rules/ProgrammableNgController/ExtraQuickFiltersを現devへ3way適用しF9追加を保持。個人NG初回同意・既存収集・native保存voidhook・60秒の差分照合・送信先別永続キュー/ランダムID・追加/削除・NG種類選択、GAS Inbox v2受付/辞書と票数による審査/レベル1..5/板別override/管理審査/承認済みGitHub JSON出力とpublish関数を追加。下4桁/上4桁/全文/IDを分離。外部板ワード可、ID期間不明・未知板・エッヂSLIP寿命不明は保留。共有受信cacheを個人NGへ書込せず再送なし。サーバー40旧/11Inbox/33審査、Java26matchingテスト成功。ビルド初回namesローカル重複を修正、現在shared-ng-personal-final-build.logで確認中。公開GAS/管理sheet/実報告/配信token/trigger設定は未変更。docs/shared-ng-review-implementation.md参照。

2026-10-28 共有NG ID/上下4桁の確認: Java matching31/GAS審査33/Inbox・GitHub publication mock84/旧API40項目成功。5ch ID・全文5票、上/下4桁10票とlevel3/4を分離。週の木曜検証、未知scopeのキー分離、手動審査で未知寿命の配信防止、審査/出力同一lock、送信対象OFFのpending除外、feed変更とcache保存のgeneration保護を補強。前buildの242適用/署名は成功（shared-ng-personal242-retry-patch.log）、追加Java修正後の通常buildはshared-ng-identity-build.log。公開GAS/実個人NG/共有配信は未変更。

2026-10-28 共有NG ID対応の最終通常LintVital付きbuild成功5m27s（build/shared-ng-identity-build.log）。Java31、GAS審査37、Inbox/配信mock84、旧API40項目成功。新GASの公開差替え・実ユーザー送信・最終版端末検証は未実施。

2026-10-30 共有NG続行: TestPersonalNgSubmissions.pyで製品collect/conditionをそのままメモリ内prefs/native store/HTTPへ接続し18項目成功（同意なし、既存、再送、種類OFF、削除、送信先分離、同意変更、不正ACK）。初回設定に送信先・対象件数/内容preview追加、連続save通知1秒debounce、ACKを送信batch限定。GAS連鎖/透明flags差を同一票へ正規化し91Inbox/配信mock検証成功。regex ID受付は私的審査のみ・実行/公開なし。242既生成APKでVerifyPersonalNgSaveHookが元命令/全register/return前voidhook保持を検査成功。preview追加初回buildはlambda名衝突を修正、shared-ng-consent-final-build.logで再build中。ADB接続端末なし、実NG送信/公開GAS変更なし。

2026-10-30 エミュレータ検証: ユーザー指示でHaiagaru_Root_API36/emulator-5558起動、消去なし。通常build成功7m59s、242適用/署名一致更新成功。最終APKでsave元命令/registerと全return前voidhook保持。共有設定/同意/0件preview表示、既存スレ本文表示。製品collectをART上で実行し合成native Entry/HTTP置換9項目成功、実送信なし/native NG未変更/prefs finally復元。scripts/shared-ng-runtime.{py,js}, build/shared-ng-consent242-runtime.log。SystemUI ANR Wait復帰、アプリcrash空。191/226最終hook・表示と実GAS/GitHub往復は残る。

2026-10-30 191/226検証続行: shared-ng-consent.mppを両版へ適用/署名一致install-r/起動成功。VerifyPersonalNgSaveHookで前patchedAPKから元save命令/register維持と全return前void通知を両版検査成功。scripts/shared-ng-runtime.py引数で版/JS指定対応、191/226も製品collect ART9項目成功（242と共通）。個人NG/prefs復元、実送信なし。受信match用追加scripts/shared-ng-receive-runtime.jsはFrida overload/型修正後agent native SIGSEGVで中断、成功扱いせず。191/242検証prefsをforce-stop後初期状態へ復元。配信条件照合はhost31成功のみ、native receive非表示/解除の最終通しは残る。サーバー新GAS実配備/GitHub配信は未実施。

2026-10-30 共有受信ART確認: 先のFrida native SIGSEGVはboolean[]を直接bridgeで受ける計測経路。Java reflection invoke+Array.getBooleanに変更し191/226/242で13項目成功（evaluateBodies実入口、ID day/下4桁week/板/個別例外/種類/level/OFF/full sync/invalid feed保持/cache reload/空feed解除）。prefs/rules/nextSync/cache復元、実HTTPは置換し送信なし。起動直後242初回はinitialize競合で失敗、初期化後に全項目再成功。VerifyProgrammableNgHooksも3最終APKのbatch/typed map/native argument成功。build/shared-ng-receive{191,226,242}-runtime.log。実レス非表示の目視とGAS配備/GitHub実配信は未完。

2026-10-30 共有NG取消順序を補正: サーバーで連鎖/透明flagsを同一票とした結果、clientのupsert→delete順だと変更後もwithdrawnになる問題を検出。旧delete→新upsertへ修正、製品collect host19/サーバー98（publish全通信lock含む）成功。審査からGitHub PUTまで同一lockとして古いsnapshotの後着上書きを防止。通常build shared-ng-replacement-build.log実行中。226実DATのIDを短時間の共有fixtureへ変換しprepareModernResponses→mergeModernResponseFlagsでnative NGWord0x10付与とOFF解除成功（build/shared-ng-native226-runtime.log）、rules/prefs復元、native NG/DAT変更なし。191追加計測時にemulator-5558とqemu processが消失、アプリ失敗と断定せず端末検証中断。再起動前にビルド完了を待つ。

2026-10-30 最終取消順build成功6m21s。実機利用許可後Mi Note10 d5497008を確認、最終MPPから242生成、save元命令/register保持再検査と署名一致install-r成功。既存検証resumefix242のデータ保持、HOME履歴/Part3本文実表示をscreencap確認。build/shared-ng-phone-body.png、shared-ng-replacement242-phone-install.log。アプリ新規crashなし（bufferに既存init SIGABRTのみ）。個人NG未送信。最終順序修正の191/226再生成/端末適用、shared実表示目視/GAS実配備/GitHub実配信は残る。

2026-10-30 審査一致方式の補強: native0x20がregex:falseで渡った場合もregexとして扱い保留。0x70の特殊modeは通常substringへ変換せず保留、手動approvedでも配信抑止。辞書/例外を本文と同じNFKC/空白正規化し空termを除外。GAS審査43/Inbox102/旧service40成功。Java製品変更なし（replacement MPP維持）。191最終取消順APKはshared-ng-replacement191-patch.logで生成中。

2026-10-30 利用者追加指定: 送信先URLを説明/同意画面から削除し、GAS送信先編集欄も共有設定から除去（受信GitHub配信欄は維持）。共有受信ON時に送信未同意なら送信ONの同意画面へ、保存同意後だけ受信ON、キャンセル時は送信/受信OFF。既存同意済みは直ちにON。showSettings共通化、個別送信設定は残す。host collect19項目成功、通常build shared-ng-linked-consent-build.log進行中。票数/禁止levelの質問へ違いを回答、表記を必要報告数/フィルター強さへ整理予定。

2026-10-30 任意票数: 利用者指定で4択spinnerを数字入力+保存へ変更、表示「必要な報告数（判定レベル）」、強度は「フィルターの強さ（禁止レベル）」へ整理。threshold reloadの1/3/5/10限定を撤廃、1..2147483647を保持し0/負数/小数/overflowはエラー。旧保存値維持、server minVotesとのmax適用は維持。SharedNgRulesTest45/製品collect19/同意switch6項目成功。linked-consent通常build成功7m46s（URL非表示/同意連動）、今回数値UIの通常buildはshared-ng-custom-votes-build.log進行中。未導入。

2026-10-30 任意票数通常LintVital付きbuild成功6m41s、MPP build/shared-ng-custom-votes.mpp。SharedNgRules45/collect19/consent6/votes save9成功。242検証APK生成中（build/shared-ng-custom-votes242-patch.log）。送信先非表示・同意連動を含む。

2026-10-30 任意票数242生成/実機更新: shared-ng-custom-votes242.apkをMi Note10 d5497008既存resumefix242へ署名一致install-r Success、データ保持・起動コマンド成功。host save9項目とpolicy45成功、数値UI/同意連動の端末操作は未完。公開なし。

2026-10-30 任意報告数実機UI: Mi Note10 d5497008の最終custom-votes242で通常設定→Haiagaru→NG・ミュート→共有NGへ実操作。5→7入力/保存→閉じて再表示で7保持をscreencap確認（shared-ng-ui-seven-reopened.png）、元5へ保存復元。同意画面の送信先URLなしを実画面確認（shared-ng-ui-consent-final.png）、未送信表示。実送信を避け保存せずキャンセル。既存共有受信はON表示、今回ON/OFF状態は変更せず。UIAutomatorがCompose画面null rootのためscreencapで確認。

2026-10-30 管理運用補完: Inbox選択条件の配信停止/再開メニューとlock付き失効ID管理を追加。毎時審査triggerをGitHub配信から分離しtokenなしでも審査可能、配信triggerはtoken必須で別関数。同関数重複のみ削除し他trigger維持。GAS Inbox/admin/trigger112と旧service40成功。Apps Script homeを読取確認、共有NGと名付けたbound projectはmyFunctionのみで既定送信先とは別と判断し未変更。公開配備・権限変更・個人NG実送信なし。

2026-10-30 公開readiness: 既定GAS GETはHTTP200/ok/revision2/1条件の旧feed、GitHub承認feedは404（build/shared-ng-public-readiness.json）。旧version1直書きAPIをALLOW_LEGACY_REPORTS=true明示時だけに制限し、既定で審査迂回を止める。service41/Inbox114成功。利用者から管理編集URLを受領、Chrome current accountでDrive404へ遷移したため未変更、編集可能accountで開くよう依頼。custom-votes226 APK生成中。

2026-10-30 GAS v2実配備: ChatGPT内Share-NG（ユーザー指定project）へModeration/PersonalInbox/Publishを追加、既存コードはUI clipboardで取得しv2分岐/legacy guard/menuのみ差込。保存後cloud_doneとreload保持確認。PersonalInbox貼付のregex escape破損は保存前エラー検出し[0-9]/[/]へ同値修正。reviewPersonalNgとexportReviewedSharedNgが実行完了。既存deploymentをversion2へ更新、URL/実行者/公開範囲維持。公開POST合成1件accepted1→再送0→取消1、legacy blocked成功（build/shared-ng-gas-v2-live-test.json）、実個人NGなし。installSharedNgReviewTrigger実行完了、トリガー表にreviewPersonalNg1件を確認。GitHub用専用token未設定のためチャット非送付でGITHUB_FEED_TOKEN property設定を依頼。共有feed公開/Android往復は残る。証拠shared-ng-gas-v2-deployed.png、shared-ng-gas-review-trigger.png。

2026-10-30 共有NG継続: custom-votes226最終APKのsave元命令/register維持検査成功、Mi Note10 d5497008署名照合install-r Success/起動command成功、個人NG未送信。191最終APK生成中。GAS mockのInbox書込失敗→未ack/部分行なし→同operation再送accepted1→重複0、21件oversize原子的拒否を追加し119項目成功。製品server変更なし、実配備v2維持。GitHub専用token設定のユーザー回答待ち。

2026-10-30 GAS直接配信へ変更: 利用者の明示選択で標準feedをGAS action=reviewedへ変更、GitHub受信は任意の初期OFF。既存GAS deploymentをv3へ更新済み、公開GETのok/full/revision/rules0件とprivate metadata非公開成功（build/shared-ng-gas-direct-live.json）。GitHub token不要、毎時審査trigger維持。service41/moderation43/Inbox・direct123成功。Android通常LintVitalビルド進行中、端末更新・アプリReleaseは未実施。

2026-10-30 GAS直接配信最終確認: 通常LintVital付きbuild成功7m15s、固定MPPから242生成、Mi Note10既存検証packageへ署名照合install-r Success/cold起動Status ok。Android実製品sync(true)で既定GAS route/lastSync更新/failures0/同期0条件を確認（build/shared-ng-gas-direct242-runtime.log）。個人NG送信なし。191/226は前候補のまま、アプリRelease未公開。

2026-10-30 直接受信3版確認完了: 固定GAS直接MPPを191/226へ適用しMi Note10既存検証packageに署名一致install-r Success、cold起動成功。191/226/242すべてで実GAS syncと合成受信13項目（ID日付/下4桁週/板/種類/強度/個別例外/OFF/全件sync/不正feed保持/cache reload/空feed解除）成功。実個人NG送信なし。実機cache操作はsu必須のため検証runnerを修正、同じ端末内でcp -p保存/mv復元。初回242検証は13項目成功後のshell rmが権限失敗、修正後に全項目と復元成功を確認し実GAS再同期。3版新規アプリcrashは未検出。残る: 実レス非表示UIの目視/復帰、初回同意の端末操作、実GAS承認候補から適用までの通し確認、実配備GASとローカルソースの再現性整理。アプリRelease未公開。

2026-10-30 初回同意端末確認: Mi Note10検証226の実HaiagaruDialogとSwitch/保存・キャンセルボタンを操作し5項目成功。初期送信トグルON/保存前両OFF/キャンセル両OFF/保存で送受信ON/受信OFF保存を確認。実NG送信を避けcollect/changedのみ一時無効化し、元prefs全件と受信状態をfinally復元してからRPC完了（build/shared-ng-gas-direct226-consent.log）。初回runnerは復元完了前にresolveしていたため修正・再試験、consent prefs空を確認。後続crash buffer監査で初回終了時刻11:04:19に226 SIGBUS/BUS_ADRALNを検出。検証attach/detachとの関連を含め原因未確定、通常操作の無事故と混同しない。修正版再試験後の追加crashは未検出。242は本体履歴からPart3本文を開きscreencap表示成功（build/shared-ng-242-body-now.png）、UIAutomatorは古いHome treeを返したため現在本文判定には使用しない。URL付きam startは自動承認review拒否のため実行せず、UIから開いた。共有NG実レス非表示/復帰の最終目視は残る。

2026-10-30 crash監査補足: build/shared-ng-consent-crash-audit.logに226 pid10881/main SIGBUS 11:04:19、libcrashlytics-common経由・unknown frameを保存。初回同意runner終了近辺、原因未確定。公開判断には通常操作での再現切分けが必要。

2026-10-30 利用者指示でGitHub受信設定とraw URL入力を削除、GAS直接受信のみへ変更。旧githubFeed/feedEndpointを初期化時削除しcursor0、source不一致cacheを無視。consent6/votes9成功、通常LintVital build/shared-ng-gas-only-build.log進行中。現端末は削除前のgas-direct版。

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

2026-10-30 パッチ適用エラー追加情報: 利用者がMorphe設定の『パッチャー→内蔵の実行環境を使用する』をOFFにしたところ191への適用に成功と報告。ローカルでも公開1.15.0 MPP→元191 APKのパッチ・署名完了（build/official115-repro191.log）。内蔵実行環境との相違が関係する可能性はあるが、失敗末尾の例外/OOMなど未提示のため原因確定・パッチコード修正済みとは扱わない。引き続きメディア/NG/日付の実装検証を継続。

2026-10-30 メディア/赤いID作業継続: 初期candidate media-ng-calendar MPPは通常LintVital付きbuild成功8m39s、191/226/242 APK生成・Mi Note10 d5497008既存検証package署名一致install-r成功。source/patchのnative poster renderer/menu接続、画像Viewer元dispatch命令・レジスタ・分岐保持を3版で検査成功。GIF自動取得BEアイコン除外34項目、動画seek42項目成功。報告MP4を取得しAndroid MediaPlayerで実decode/precise5秒/連続20秒target成功（video-seek242-runtime.log）。旧native seekのgetCurrentPositionも5000だったため、この検査だけで報告症状の目視再現・解消とは断定しない。
初期案NGID登録は3版の実native storageに合成fixtureを使い登録・重複・OFFキャンセルを確認。最初の191の検証用削除にNativeNgStore.update(before,null)を使ったテスト側の誤りで13:47:33 NPEクラッシュを発生させた。replace(snapshot, retained)で合成ID除去、191 native ID一覧0/consent false/autoNg falseへ復旧後、正常runnerでsnapshot復元成功。利用者の最新指定により通常NGID登録案を廃止し、native ID groupのスレ内投稿数と191/226/242共通8段階palette最終levelを使う0x1008表示overlayへ変更。除外IDはID:正規化/完全一致/最大500件、host18項目成功。メディア等先行APKは旧方式のため最終扱いしない。最新build/media-red-id-overlay-build.log進行中、Release未実施。

2026-10-30 実機監査追記: 191の制御UI/zoom fixture実行・detach近辺14:20:35にSIGBUS/BUS_ADRALNを検出（media-review-crash-audit.log）。11:04の226と同様のtagged address/libcrashlytics系、原因未確定。通常操作の新規クラッシュとは同一視せず、今後も未解決記録を保持。UIへ人工的なnative rendererを追加するfixtureは繰り返さず、通常操作の確認とデータモデルoverlay検証を優先。通常NGID登録を廃止した最新MPPはbuild成功7m4s。複数CLIの同時実行で同じ一時directory patching-1793338101801を共有して3版APK作成が失敗したため、順次再生成へ変更。この競合はローカル生成手順由来で、ユーザー報告のMorphe内蔵実行環境問題とは別。

2026-10-30 最終候補導入完了: build/media-red-id-overlay.mpp（SHA-256 c4b5bb83651bf2b7744a855f41b443fb1860f07b6d37fb01a74870070e278109）を191→226→242へ順次適用・署名照合install-r成功・既存データ保持。最新RedIdAutoNgはnative NGWordへのwriteなし、native ID groupのそのスレ内の投稿数が8以上の場合だけ0x1008のcopy/return overlay。191 g.e、226 h.e、242 m.b、3版のnative paletteが8段階で最終色にclampすることをDEXで確認。除外リスト（ID:可・完全一致・500件上限）、OFF、同ID別スレ低投稿数、通常NGID snapshot不変をARTで191/226各8、242追加map copy/OFF検査込み11項目成功。全prefsはfinallyで復元。exclusion host18/seek42/GIF URL34成功。3版native poster renderer/menu接続とgallery dispatch元命令・register保持の検査成功。
242動画frame生成はlocalhostへのfixture routeをテスト2URLだけへ適用、失敗cooldown→再試行→報告MP4のframe publication4項目成功（video-thumbnail242-runtime.log）。テストサーバーとADB reverse18763は終了・解除。226通常UIでPart4本文と報告MP4サムネイル表示を確認（overlay226-body.png）。191 date controlの未指定表示/復元値のボタン反映/解除/選択action登録4項目成功、カレンダー本体の目視はこのfixtureでは未検証（archive-date-control191-runtime.log）。191 zoomはnative C/B判定を追加済み、元dispatch保持検査成功。人工的native viewをWindowへ追加する旧fixtureはSIGBUS切分けを妨げるため削除し、テストはdate-controlだけに整理。実際の拡大パン連続操作の最終UI確認は未実施。最終導入・data-only試験後、14:20:35より新しいcrash記録は未検出。既存の計測attach/detach近辺SIGBUS原因は未確定のまま保持。アプリRelease操作なし。

2026-10-30 最適化完了候補: optimization-final.mpp SHA-256 6768fd29cda57d64798b2da069fae331dbb51db8f08179f0e8f8d89b357f8385。通常LintVital/R8付きbuild成功8m28s。共有NGは不変のSharedNgIndexでboard/kindごとに索引化、settings/feed変更で再作成、候補に必要な加工だけ実行。不要な日付/週計算・レスごとの候補listを除去、同一一覧のboardURL解析を共有、syncQueuedで二重投入を抑制。GIFは32msで完成URLをまとめ関連modelのみ無効化、設定変更は全体更新。poster逆引きSet/LRU512とmodelごとの旧poster管理、MediaAttemptGateで成功枠解放/失敗60秒/実行中重複排除/期限回収。NativeFieldsでClass/名前のFieldとallFields metadataを再利用、赤いIDのprefs object/regex再利用・242一括ON/OFF参照。個人NG collectorは変更なし時のsnapshot再保存を省略・hex生成軽量化。過去ログ検索のresultsはrender/appearance revisionを使い200ms指紋計算で本文の再帰走査を省く。入力監視や既存Span copyは維持。詳細docs/optimization-audit-2026-10-30.md。
Host: 新旧共有NGの結果比較10001、gate1135、shared policy96、collector20、periodic19、consent6、votesUI9、NativeFields継承/instance分離成功。191→226→242のAPKはCLI temp競合防止のため順次作成、Mi Note10 d5497008既存検証packageへ署名照合install-r/起動成功。3版poster renderer/menuとnative image dispatch元register/命令保持の検査成功。
ART: scripts/optimization-shared-runtime.js（索引再利用・kind/board/threshold/feed変更9項目）、optimization-runtime.js（GIF対象のみ無効化・無関係model維持・posterOFF・128件expired受付8項目）、optimization-model-runtime.js（通常入力/結果revision/childcount/visibility5項目）、red-id-ng-runtime.js（191/226各8、242はmap copyを含む11項目）が3版成功。実NG save・合成報告のHTTP送信なし、全prefsとrulesをfinally復元。226最終ログはgate128受付を各項目として出力する旧表記、191/242は集計表記だが判定は同じ。
検証途中の問題: 226更新完了前のattachはscript destroyedで失敗、install完了後に再試験。boolean[]直接Frida変換がclass booleanを探すためReflection経由へ修正。GIF fixtureがstatic final CharSequence[]まで書き換え誤判定したためnative static初期値が空String[]であることをDEX確認後、検証226をforce-stop/再起動してnative初期値へ復旧、fixtureを非staticのみに修正。製品側は最初からstatic除外していた。cold起動直後のGAS同期と合成rule差し替えが競合した試行は起動安定後に再実行し成功。この途中の失敗を製品成功に数えない。242通常UIで本文表示/縦スクロール/戻るを確認（optimization242-body.png）。最終試験時のcrash bufferは14:20:35の既存SIGBUSより新しいアプリcrashなし。既存の計測detach近辺SIGBUSの原因未確定は継続記録。FPS/速度削減率は未計測、Release未実施。

2026-10-30 共有NGイベント送信/強さ廃止/keyword最小長: NGWord既存save hookを使う1秒debounceイベント送信へ変更、定期poll/設定を廃止、起動1回回復と失敗15分単発retry・20件batchは維持。成功後15分制限を除去、受領ACK空はキュー維持。filterLevel UI/適用gateを廃止、旧キー除去、minLevelはwire互換性のみ。新指定のkeywordはNFKC+空白除去後5コードポイント以上、英字だけを除外。個人収集/プレビュー/手動報告/旧送信待ちへ適用、以前の送信済み対象外条件はdelete取消可能。ローカルNG/ID/ワッチョイ等は影響なし。
Android collector43/events14/migration8/consent6/votesUI9、GAS moderation61/Inbox141/legacy service41成功。直前イベント+強さ廃止だけのビルドは6m52s成功していたが、今回keyword制限を含まないため最終品にしない。新build/shared-ng-keyword-policy-build.logで通常LintVital/R8付きビルド中。
GAS Moderation/PersonalInbox/Publishをローカルと全文照合して保存、既存URLのdeploymentをv7（16:04）へ更新。GASは不適格keywordをInbox審査でrejected/ineligible_keywordへ、手動overrideでも配信禁止、古い条件の取消は許容。cacheキーv6で旧判定を除外。実公開reviewed GET ok true/revision5/ID1件、read-only audit 16:05:28 ok true/issues空/warnings空/probes8/approved1・pending1を確認（build/shared-ng-keyword-policy-live.json、-audit.txt/png）。初回GETは旧v1ルートを誤参照してrevision2/0件、action=reviewed付きの正規経路で再確認済み。実個人NGの追加送信なし。端末APK更新・アプリRelease操作なし。

2026-10-30 keyword最終ビルド完了: 通常LintVital/R8付きbuild成功7m12s。build/shared-ng-keyword-policy.mppへ固定。SharedNgRules既存96/索引結果比較・旧強さ無視10003も追加成功。端末インストール・Releaseは今回未実施。

2026-10-30 利用者指定: オンライン共有NGとF9対策は開発中の機能として扱う。設定入口/画面タイトル/F9ひな形選択へ「（開発中）」を明記。既存条件の保存名・ON/OFF・送受信処理は変更しない。差分説明でも完成済みの機能と分けて説明する。表示文言のみの変更、既存MPP/導入APKには未反映。

2026-10-30 利用者追加報告: 191標準ZIP復元の-journal拒否を調査。NativeRestoreFilesは元/先の非空sidecarを一律拒否しており、PERSISTの正常journalも対象。cold startupのinstallDatabaseでnative singleton o.nh.bが未openであることを検査し、NativeRestoreDatabaseでSQLite自身にhot journal回復/WAL checkpoint/journal_mode DELETE/排他transaction+quick_checkを行わせ、全handleを閉じて既存verified streaming installへ渡す。削除による回避は行わず、default corruption handlerによるDB削除も禁止。エラーは復元元/復元先を区別する。元ZIP/旧DB退避・失敗時の復元一時データ保持は継続。初回fixture生成はSQL変更なしでjournalを生成しなかったため修正。XIG05切断後にMi Note10 d5497008が接続されたため、shell専用fixture directoryで製品コードのapp_process試験67項目成功（source/target PERSIST・hot rollback・WAL committed保持、旧guard拒否再現、copy/退避DB回復、破損source削除なし）。MIUIのテーマ設定ファイル欠落がshell process起動時に出力されるが、全SQLite試験はPASS終了。既存ユーザーDBへの復元なし。最終製品ビルド/191 ZIP通し確認を継続。

2026-10-30 191標準ZIP復元エラー修正候補
`NativeRestore191.installDatabase()`が191本体の`o.nh.a`ロックを保持し、DBが未openであることを確認してから、復元元と復元先の非空`-journal`/`-wal`/`-shm`をAndroid SQLiteで回復・checkpoint・DELETE journal化し、quick_check後に閉じて既存の検証済みコピー処理へ渡す。sidecar削除で回避しない。source/targetと区別した失敗理由を表示する。
Android SQLite helperをMi Note10 `d5497008`・`emulator-5580`で67ケース検証し、PERSIST journal/hot rollback/WAL commit/退避/破損source保持を確認。191通常配布候補APKとrestoretest APKのDEX hook検査成功。最終通常LintVital/R8付きビルドは`build/prerelease-dev4-restore-final-build.log`で6分44秒成功、MPP `build/prerelease-dev4-final.mpp` SHA-256 `1FC9E30FA2B506BD54CE9E7F1B4A8F410D0645F9F9A907D33397144999355AF5`。191 APK SHA-256 `750AD4F5CAE0A25EDD6C00EAE85F4C854C0FBCAFF4B3F465DFD461F0194F2895`。
restoretest191は`emulator-5580`へ署名一致で更新・起動し、使用許諾画面まで到達、新規app crashなし。許諾同意はしておらず、バックアップUI通し復元は未実施。利用者提供ZIPはworkspaceになく、実ZIPでの確認も未実施。現状Release前。
2026-10-30 17時台 プレリリース最終確認: 利用者が使用許諾同意を許可。emulator-5580の隔離restoretest191でChMate標準BackupActivityからZIPを作成→選択→復元→process restart→HOMEまで成功。ZIP内roidon.sqliteと復元後DBのSHA-256が一致（3cac65411ff7b7c0bd86645837fdfc1c188b1f29f11b13da0dbee062674d60a0）、旧DBのbefore-restore退避あり。生成ZIPはsidecarなしの初期状態DBで、利用者の実ZIPは未入手。journal異常状態は別途Android SQLite 67ケースで確認。通常restore streaming試験、GIF34/seek42/gate1135/shared policy96/index10003、191 restore hook、3版poster hook、191 NG save元命令保持を再確認成功。Gallery比較は最初にpatched APKを比較元へ指定してregister不一致となったが、Downloads内の元APKを比較元にした191/226/242検査で全成功。
Mi Note10 d5497008の既存settingsfix191/resumefix226/resumefix242へ最終candidateを同証明書照合install-r成功（17:04:26/17:04:56/17:05:28 JST）、3版プロセス起動、242既存スレ本文/スクロール/既存過去ログ画面表示を確認。直前の最適化候補で確認済みの画像/メディア処理は同一ソース、最終candidateで画像表示を全3版再実施したとは扱わない。17時台の新規crashはなし、旧計測近辺SIGBUS記録は既存のまま。最終MPP/通常LintVital buildは先の記録と同じ。公開説明に共有NG/F9開発中を維持。
2026-10-30 17:29 JST 1.16.0-dev.4 プレリリース公開: 実装commit edc217b、Semantic Release CI 41026208424 success、生成commit35dc66e。GitHub Releaseはprerelease=true/draft=false。公開MPP SHA-256 `8a50c13f354fa3ae2836b7db267c88ae341378dd3aa58cb8f8c07875a26a18a3`、公開patches-bundle/pre双方version 1.16.0-dev.4、JSON SHA-256 `59761a4806ddc96f1aac3ac1ec9942315a04c002035ea9c3ee81ca8bd4c6b48e`。公開asset digest一致/ZIP CRC/extension MPE内DEX magic/NativeRestoreDatabase同梱/dev raw prerelease feed一致を確認。初回の配布検査は拡張を.dex拡張子と誤仮定して失敗、実形式.mpeのDEX magicで再確認成功。既存タグにローカル差異があるためfetch --tagsは一部拒否、強制変更せず新タグとdev更新のみ取得。共有NG/F9は開発中表示を公開説明・設定双方で維持。
追加の通常UI: Mi Note10最終191でPart3の本文、226でPart4の本文/動画サムネイル/標準画像ビューアの表示を確認。191の最初のURL起動は取得待ちだったが後に本文表示を確認。最終242のPart3本文確認は前記のとおり。ユーザー提供ZIPは未確認、報告されたjournal状態の発生場所も元/先のどちらかは未確定。修正は両方を処理する。公開URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.16.0-dev.4
2026-10-30 軽量版専用パッチ廃止: 利用者指示で専用patch定義・extensions/chmate-ads-onlyの追跡ソース・専用APK/runtime検証scriptを削除。通常版の設定プリセットは維持し、廃止構成への誘導文と専用runtime marker分岐も除去。build/remove-ads-only-build.logは通常LintVital/R8付きbuild成功4m40s、MPP内に専用MPEがないことを確認。marker整理後の最終buildはbuild/remove-ads-only-final-build.log。軽量版投稿/画像アップロード修正は利用者指示で中止。公開操作なし。

2026-10-30 18:39 JST GAS v8実配備: 利用者依頼でCode/Moderation/PersonalInbox/Publishを既存projectに保存、全文をclipboardで取得して行末/空行を除くfingerprintをローカルと照合成功。掲示板不明の過去NGを全板へ正規化し、全板identityの審査保留を解除、Edge記者IDの受理/審査/配信を追加。旧clientへreporter/全板identityを配らない能力指定付きfeed、cache v7。既存deployment URLと実行者/公開範囲を維持してversion8へ更新完了。exportReviewedSharedNg実行18:37:06〜09成功、read-only audit18:37:43〜46: Inbox15/approved12/pending3/waitingReview0/issues空/warnings空/probes8成功。公開GET revision8/新client12条件（全板identity9）/旧client3条件（全板identity0）/private metadata0を確認。実reporter候補は0件のため実個人記者ID送受信は未実施。ローカルmoderation61/personal148/service41成功。アプリMPPの新規Releaseなし。

2026-10-30 18:40 GAS公開後監査: cachedPublished12/approvedConditions12/waitingReview0/issues空/warnings空/probes8成功。build/shared-ng-v8-audit.png、shared-ng-v8-source-check.json、shared-ng-v8-verification.jsonへ証跡保存。marker整理後のAndroid最終buildはLint段階でホストnative memory不足によりJVM終了（hs_err_pid53672.log）。R8は終了済み、heap768m・worker1でbuild/remove-ads-only-final-retry.logへ再試行。

2026-10-30 追加プレリリース準備: 利用者依頼でHaiagaru設定の初回openに共有NG同意画面を追加。表示/取消だけでは送受信を有効にせず、保存時だけ両方ON。既存consentキーまたは初回表示済みmarkerがあれば自動表示を繰り返さず、通常の送信設定から再表示可能。dismiss後に従来MinimalSetupを案内しdialog重複を避ける。activity終了後callbackは抑制。host consent6+初回lifecycle10、collector47、event14/migration8、policy96/index10003/reporter54/votesUI9、server250成功。記者ID共有は通常NGThreadの記者suffixだけのliteral登録も追加収集し、普通のtitle/正規表現/無効登録/他掲示板は除外。高度NGの同じIDとは重複送信しない。既存同意ユーザーへの記者ID送信カテゴリ追加は初期OFFを維持。

2026-10-30 19時台 dev5最終検証: build/prerelease-dev5-memory-build.log通常LintVital/R8付きbuild4m23s成功、MPP SHA-256 49e501025b33b1e9021c39735afef58447054d54484a49fb8106365af374a1f8。専用軽量MPE/patch getterなし・通常MPEあり・CRC成功。3版適用/署名照合更新/cold起動、各初回同意6項目/ART index7項目成功、本文/画像サムネイル目視成功。NG保存hookはdev4との差分で命令/register保持・3版記者hook成功。元APKとの厳密比較は既存NG登録数上限のCONST→getNgRegistrationLimit変更を検出したため比較元をdev4へ変更し成功。
受信通しの旧Frida試験を191/226で実行するとJNI LocalReferenceTable/DeleteLocalRef〜frida-agent内でSIGSEGV。初期JSONArray呼出overload誤りも確認、製品操作では再現せず。設定を書き換えないindex検証へ変更し明示String overloadで3版成功。失敗試験は公開確認成功に含めない。初回同意の初期試験は起動待ち不足/同時の別app前面化でdialog取得失敗し、4秒待機・順次実行で成功。cache復元runnerはemulatorのsu構文非対応、実cacheは試験前同様synthetic条件なし。検証用191/226の受信設定は旧fixtureによる変更が残った可能性があるため利用者データのない隔離検証packageだけを対象として記録。

2026-10-30 19:16 JST 1.16.0-dev.5公開完了: 実装088d645、Semantic Release CI41039003020 success、生成commit eae1fd8。prerelease=true/draft=false、公開MPP SHA-256 125f54fc7533c31ba98ce5421b54f21472c4b772a40a4b7b23ccfe86d8894b6b。公開MPPと更新JSONのasset digest一致、CRC正常、通常MPE・offerOnSettingsOpen・SharedNgReporter同梱、軽量専用MPE/patch getter不在、dev raw両feed version1.16.0-dev.5、開発中表示を確認。公開URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.16.0-dev.5 。証拠 build/prerelease116dev5-verification.json / prerelease-dev5-first-consent.png / shared-ng-v8-audit.png。初回公開検査はWindows既定cp932でJSONを読んで失敗、UTF-8指定で全項目成功。ダウンロード先の旧1.13.0-dev.5証跡との衝突は別フォルダprerelease-dev5-verified-publicで回避し、旧ファイルを上書きしない。

2026-10-30 メディア/自動NG/JST修正作業: 利用者報告スレ1793113633の8/19/27はPNG、39はJPEG。旧242の実runtimeで4件ともhaiagaruPatrolAttachmentsが空配列と確認。ExtraQuickFilters.threadMediaの添付取得を本文の直接メディアURLで補完するThreadMediaUrlsを追加。BEアイコンは除外し、本文は変更しない。IDメニューへ自動NG除外ID登録を追加（191は既存native Menuへの追加、226/242は既存native ID sheetの元実装をdelegateで保持）。通常NGIDは変更せず、上限500/完全一致/重複無視。自動NGの説明を全スレ共通ON・投稿数はスレごとに判定・別スレへ赤ID判定を持ち越さないと明記。X日時を表示時にJSTへ変換し旧cacheにも適用。host ThreadMediaUrls14/MediaGallery30/XPostTime16/RedIdExclusions18成功。Android最終buildと端末確認は継続中、未公開。

2026-10-30 設定トップ・全メディア・自動NG除外・JST 最終確認
添付画像に合わせ、設定トップを丸い検索欄、区切り線付き共有/読込/最低限構成メニュー、丸い線画アイコン付き9カテゴリカードへ変更。カテゴリ本文の既存設定writer/検索/保存は保持、ChMateの色と文字設定に追従。191のGIF検索結果、226/242のカテゴリ移動、3版のトップ表示を確認。
本文由来のURL補完で191/242のPNG抜けを修正。242の静止画サムネイルはnative画像Fragmentへ直接渡されActivity factoryを通らないため、全スレ移動ONで対象スレを一意に特定できる場合だけ通常ビューアへ渡す。生成posterは元動画へ逆引きし重複抑制。エミュレータemulator-5580で報告スレ1793113633の83静止画サムネを実タップし、191/242ともVideoViewerActivity/16件一覧→スワイプで他レス画像へ移動を確認。242は画像から元動画への戻りも確認。既存の戻るジェスチャー優先は維持。
最終3版ART: 報告PNG4件それぞれ16件gallery、動画poster逆引き、本文タッチなし動画Intent、OFF維持、自動NG除外追加/既存値保持/重複無視/通常NG非変更に成功。226は初回Part3表示のままPart4専用fixtureを実行して不足となったが、UIからPart4を開き直し再試験成功。native ID menu(226/242)、media dispatch(3版)、242サムネwrapperの元命令/register/分岐先保持を検査成功。サムネ検査の初期失敗は追加命令で変わるbranch offsetを直比較した検証側の誤りで、分岐先命令番号へ正規化して元target一致を確認。新規crash buffer空。
host ThreadMediaUrls14/MediaGallery30/XPostTime16/RedIdExclusions18/production poster-source5成功。通常LintVital/R8付きbuild/settings-home-gallery-build.log BUILD SUCCESSFUL 5m10s。MPP <workspace>\build\gallery-id-jst-final.mpp SHA256 e2eb7fad35b516f6a995de6e5ed8b602996948c81a16aa0934f122fa50d0da72。設定画面証跡build/settings-home-final242.png, settings-home-final226.png, settings-home-search191.xml。最終APKはgallery-id-jst-191/226/242.apk。共有NG/F9は開発中維持。公開はCI完了後に別記。

最終後片付け追記: 検証後のbackground191/242へFrida再attachした際、attach timeout後に両プロセスのSIGSEGV(pc0x320/unknown、11:46:53/11:47:02 UTC)を記録。通常UI試験中のcrashとは区別しbuild/settings-gallery-cleanup-instrumentation-crash.logへ保存。cold processへの同じcleanup scriptは成功、191/242の一時mediaSwipeWholeThreadを元のキーなしへ復元。解析ツールなしでcold再起動後の本文スクロール/タブ操作は正常、11:47:49 UTC以後のcrash記録なし。原因を製品修正済みとは扱わず、再attach依存の検証環境事象として保持。

2026-10-30 20:54 JST 1.16.0-dev.6公開完了: 実装e5341b3、Semantic Release CI41050768103 success、prerelease=true/draft=false。公開MPP SHA256 e22f361382e2931776ec31e9e400b5de1ebc2f0507e30946ca3401f8863099b2、両更新JSON SHA256 b477853ef49c461a28322527c6f0590b74545952f273c6b137b2f010967adc41。GitHub asset digest一致・MPP CRC正常・XPostTime/ThreadMediaUrls/SettingsHomeCard/openThreadThumbnail/appendIdSheet同梱・専用軽量MPEなし・dev raw両feed version一致・共有NG/F9開発中表示維持を確認。証拠build/settings-home-dev6-public/verification.json。公開URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.16.0-dev.6

2026-10-30 191サムネイル121/122ジェスチャー再修正
利用者が191と回答。旧candidateで121の332x176画像はnative minimum B=1/current C=5.7831326/fitted aa=5.7831326となり、C>Bだけの判定で初期の自動拡大まで手動zoomと誤認し移動を抑止することを再現。native d()はaaへ初期fitし、小画像ではBだけ1へclampすることを元DEXで確認。191に限り基準をmax(B,aa)へ変更するImageZoomStateを追加。226/242の分岐/ネイティブフック/戻る優先/一覧末端の挙動は変更しない。
host native fit/zoom9項目成功。最終通常LintVital/R8 build/gallery-fit-zoom-final-build.log BUILD SUCCESSFUL 3m6s、MPP <workspace>\build\gallery-fit-zoom-final.mpp SHA256 266710f6d697794fd8be6b12338960ba0a3c6e706b38ccada9276712352a76b2。191APK適用/署名一致install-r/cold起動成功。native media wrapper元命令/register/branch検査成功。
emulator-5580実UI: 121の1枚目をサムネから開きB1/C=aa5.7831326でinitialZoomBlocked false、native setPositionで手動zoom相当のscaleへ変更した際true/元scale復元。実左swipeで121の2枚目へ、B1/C=aa1.875でも同検査成功、実左swipeで122の画像へ（全16件）。122から実下swipeで121へ戻り成功。121の2枚目で実doubletapによりC2>aa1.875へ拡大、実左swipeでURL/index13が変わらずpan優先を確認。122のサムネから直接openする経路でもC=B=aa0.7653061/全16件/実下swipeで121へ移動成功。122は一覧最後のため左/上方向に次画像はないことを区別。
検証中の初回zoom fixtureはdecode前のB=C=aa1で実行したため証拠から除外し、decode完了後に報告3画像で再確認成功。戻ると既存checkerタブが選ばれるため、以後はHOMEの既存Part4を選択し直して操作した。最終121/121second/122のruntime logはbuild/gallery-fit-final121-runtime.log等。検証用threadMedia preferenceは元のキーなしへ復元。13:09 UTC以降の新crash記録なし。修正範囲は191のみ、226/242のAPKは今回再生成せず前回確認と区別。公開前。

2026-10-30 22:21 JST 1.16.0-dev.7公開完了: 実装bb0ca0d、Semantic Release CI41061841675 success、prerelease=true/draft=false。公開MPP SHA256 71249b496249be08b3575af857b94d21dc0dadc3f22d92abdab79282b9cafe8a、更新JSON両方SHA256 b84c5bb4f1bcc463b1d1c11f895b0151c2285b061b28505b1e8224135b58cf8c。GitHub asset digest一致・MPP CRC正常・ImageZoomState同梱・両raw feed version1.16.0-dev.7一致・共有NG/F9開発中維持を確認。証拠build/gallery-fit-dev7-public/verification.json。191の自動fit誤判定を修正、122は一覧末尾のため下swipeで前画像へ移動を確認した。公開URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.16.0-dev.7

2026-10-30 パッチ適用時間計測と最適化
利用者の計測依頼と、改善できた場合のプレ更新指示。公開dev7→元191を同じPC/CLI1.16.0/Java21/C1/SerialGC/2CPU/1GB heap/JFRで順方向・逆方向各2回比較。packageのみ25.96秒、Haiagaru+package77.34秒、MEGA/video/crashlogを含む構成74.70秒。0除算/整合性走査と関連upload/settings/authの直接挿入処理はJava agentで合計466.633ms、crash logger挿入0.425ms。共通DEX再書き出しの寄与をこの値へ含めず、全クラッシュ予防の合計とはしない。
CachedExtensionDexで拡張shardのstring/type sectionをpatch実行中だけmemoize。HiddenNgUnreadの全参照toString照合をFieldReferenceのowner/name/type照合に変更。生extension2 shardと移設後2 shardは旧新でbyte一致。69,552 entryの値/offset/再読identityとoptional/不正index検証成功。scopeはextension読込のみ、元アプリ全体へのglobal cacheなし。通常LintVital/R8 buildは初回pack段階CodeCache64MiB枯渇、host CodeCache192MiBの再試行で成功30s（build/patch-timing-optimization-final-build.log）。
同一構成の最適化後2回58.148/58.010秒、平均58.079秒。従来full平均74.6975秒から16.6185秒/22.25%短縮。詳細docs/patch-performance-191-2026-10-30.md。Android Morphe内蔵runtimeの実秒数ではない。0除算・クラッシュ対策は削除も無効化もしていない。
最終MPP <workspace>\build\patch-performance-final.mpp / SHA256 32d22ab4702ed263b75b83bb0e1e130c777b79493061ac866cb7d1848cf6300e。191(optimized/02-full.apk)・226/242(追加生成APK)をemulator-5580へ署名一致install-r成功、既存data保持。3版cold起動/Part4本文/サムネと画像/設定トップ表示を目視確認、新crash buffer空。native unread hookは1914/2266/2428、元register/total/read/subtraction検査成功。旧新hook methodの全命令/参照/offset一致25/26/28件。初回226/242検査は191の期待値4を流用した試験側誤りで失敗、実期待値6/8へ修正して成功。同等性比較は最初から成功。source/bundleへのprofiling agent混入なし。公開前。

2026-10-30 23:48 JST 1.16.0-dev.8公開完了: 最適化実装94fe1be、Semantic Release CI41074079690 success、prerelease=true/draft=false。公開MPP SHA256 4ae591fefbed8d62daf40ed7a9616deb295883a8293ab6723907333603707bb3、両更新JSON SHA256 31c345313f948e722db25b466f75b3e4edf85bf43ffeb5d7df8319b88c5c93e5。asset digest一致/CRC正常/CachedExtensionDex同梱/計測agent・JFR非同梱/両raw feed version1.16.0-dev.8一致/共有NG・F9開発中維持を確認。証拠build/patch-performance-dev8-public/verification.json。公開URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.16.0-dev.8


2026-10-31 画像終了クラッシュ・動画フィルター・自動NG除外ツールバー
242の画像Fragment終了animation callback（VN10.G）がdetach後にgetParentFragmentManagerを呼ぶ問題を修正。nullable getFragmentManagerで未所属時のみ終了し、所属中は別名delegateへ保存した元命令・register・branchを全て保持。元APKの未attach fixtureはIllegalStateException、最終APKでは例外なし。標準画像を開き上スワイプで本文へ戻れることも確認。
191では動画サムネイル取得を無効にするとnative URL getterから動画URLも欠落した（報告スレ83で2→1件、本文内direct videoは残る）。最初の判定関数だけの候補では絞込み試験が失敗したため、filter loop専用に本文direct video URLを補完。元URL一覧とYouTube等のnative matcherを維持し、動画判定と件数表示を取得モードから切り離した。本文や取得設定を変更しない。最終候補でmode0/3とも83のMP4が残り、動画件数1・表示行4を確認。検証時変更した取得モード・filter選択は元へ復元。
自動NG除外ID編集を既存設定画面と共有し、191/226/242のresponse toolbarカスタマイズ候補に追加。既存アイコン番号0〜8を保持し末尾9へ追加、標準NGIDは変更しない。3版のnative toolbar catalog内の存在・drawable読込・click dispatch・editor表示・取消で既存除外値保持に成功。取得済みスレ検索の既存日時ソートは全板をまとめる処理と確認したため、選択肢を「全板混合：スレ作成日時の新しい順／古い順」と明確化。5ch内の複数板・pink・エッヂを混ぜたhost2014件/ART各13件で全体日時順・元行/クリック先同一性・標準順復帰を確認。3版native search hook元命令/register検査成功。
通常LintVital/R8付き最終buildはbuild/viewer-filter-toolbar-final-build.log、BUILD SUCCESSFUL in 4m。MPPはbuild/viewer-filter-toolbar-v2.mpp、SHA256 5e9a2116396e65ff148173e589705a13ffb5099170c60c80f77045e080594f88。3版順次patch成功、emulator-5580へ署名照合install-r成功。最終ART共通検査191/226各21・242は23件成功、画像終了/動画filter hook register/元処理保持検査成功。3版起動/Part4本文/画像表示、242実上swipe終了、新規crash buffer記録なし。初期runtime試験のnative matcherは必ずnullになるという仮定、191のrows field=Nという仮定、191 toolbar modelをListとして読まなかった検証側誤りは修正して再確認。初回の画像確認は更新後の本文位置/描画待ち不足で画像を開けなかったため成功扱いせず、最後に実画像表示を確認し直した。証拠build/viewer-filter-toolbar-verification.json、build/video-filter191-v2-runtime.log、build/viewer-filter-toolbar-v2-*-runtime.log、画像は*-image-confirmed.png（191/242）と*-226-image.png。Release未公開。


2026-10-31 正式公開追加要望: 「連鎖あぼーんを常に非表示」をNG設定に追加（hideChainedAbone、初期OFF、設定共有/復元対応）。#91とは独立し、既存PosterIdChainNg.applyHiddenの先頭から別クラスへ委譲。native SE_/d/cの判定結果にchain(0x1000)があり、native通常あぼーん理由mask0x54a38がないレスだけを、再構築時の透明NG mapへ投影する。元NG親の表示・保存NG・DAT・本文・履歴は変更しない。標準Show hidden NGはnative既存のmap適用分岐へ委ねる。OFF復帰はnative map再構築で反映。native chain cacheを利用し、各レスの祖先を独自に再帰解析しない。
通常LintVital/R8 build成功4m11s、build/chain-abone-build.log。MPP SHA256 aa70995b3fe8038b914459036d2bfe13ac02b293110c55670385c65e6d2c0f22。3版順次適用/署名一致install-r成功。既存#91 host130+84、通常NG理由との組合せ524288件成功。最終ART191/226各15・242は13成功（親保持、子/孫非表示、無関係保持、OFF再構築、NG無効、設定初期OFF/保存）。191/226 native row builderで行自体の除去とShow hidden NG復帰成功。242はnative chain engine/legacy rebuildに加え、emptyToNullとNG flow全methodの命令/register/reference/branchが直前確認済みviewer-filter-toolbar-v2候補と同一と検証。新規hook挿入はない。fixtureはnativeengineの複製・合成レス・proxy matcherのみ、保存NG登録しない。crash buffer新記録なし。実メニュー操作での242 Show hidden NGは今回実施せずnative分岐同一性で確認した。UI画像と上スワイプ終了は直前候補での記録と区別する。利用者依頼の正式公開へ含めるため.releasercの説明だけ更新、生成metadata/CHANGELOG/versionの手編集なし。公開前。


2026-10-31 正式版1.16.0公開完了: 利用者の正式Release指示に基づき、連鎖あぼーん独立非表示追加（09cc04a）と画像終了/動画filter/除外toolbar修正（e3ecc93）を含むdevをmasterへ通常merge（825160a）。READMEの運営側更新2commitは先にdevへ統合して保護。Semantic Release CI 41186777256 success、tag生成commit `721e973fa6e00e3eadece2c44a90290feac13986`、prerelease=false/draft=false/latest=true。公開URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.16.0 。
公開asset `patches-1.16.0.mpp` SHA256 `3278585f3d2804b00d8334f427e696429ad8ca1c295ea0cb5f1baec90a95fb38`、GitHub asset digestと一致。
公開asset `patches-bundle.json` SHA256 `3134c30d15a83551af42fba8614b288ba1c90d1aec3d24f0588f626cfd01ea13`、GitHub asset digestと一致。
公開asset `patches-bundle-pre.json` SHA256 `3134c30d15a83551af42fba8614b288ba1c90d1aec3d24f0588f626cfd01ea13`、GitHub asset digestと一致。
MPP CRC正常、ChainAboneVisibility/hideChainedAbone/videoFilterUrls/自動NG除外toolbar/NativeImageClosePatch同梱、軽量専用MPE不在を確認。master/devのpatches-bundle.json・patches-bundle-pre.json全4feedがversion1.16.0、download URLが正式MPPを指すことを確認。共有NG/F9の開発中表記維持。CI生成のversion/CHANGELOG/bundle JSONは手編集せず、CI backmerge済みdevをff同期。公開物検査証拠build/official116-41186777256/verification.json。端末検証範囲とnative Show hidden NGの版別確認方法は直前の連鎖NG検証記録を参照。


2026-11-01 01:08 JST エッヂ認証日/公開レベルNG・スレ内検索対象ON/OFF
利用者指定スレ1793457978と共有同意者全員の条件で実装。詳細docs/edge-level-auto-ng-plan.mdとthread-search-options.md。レベル実測/推定/認証記録は初期OFF、閾値個別・除外ID・スレ再表示で反映。通常NG/DATは変更しない。公開値優先、IDはedge板/投稿日単位。認証日共有は専用同意・接続先再同意・公開自身の直近レス照合・生Cookie等は送らない。認証日自体は自己申告、矛盾は配信しない。参考23時間推定は初期OFF、実レベル保証なし。
GAS新設EdgeLevels.gsと既存Codeの分岐のみ追加。指定スレがkakoへ302転送された原因を特定し同じホスト/板/スレの正確な過去ログパスだけ追従。30分trigger1件、配信取得でクロールしない、7日/10000件、GET/POST31テスト成功。既存service40/personal148/moderation61維持。GAS既存deploymentをversion9へ更新00:59 JST、実行者/全員公開/URL維持、ソースfingerprint b5d2993eを照合。公開GETで観測1/最新L3/認証日0、既存共有NG revision16/273件ok、非公開項目なし。build/edge-gas-v9-verification.jsonとedge-gas-v9-audit.png。
スレ内検索はDISPLAYへID/ワッチョイ/名前の各ON/OFF（初期全ON）、本文常時対象。名前とワッチョイ分離・ID抜出でOFFのメタデータ混入を防ぎ、AND/regex/本文引用/元データを維持。プロファイル保存/復元へ追加。host198項目、native各37項目成功。
通常LintVital/R8の最終build3m35s成功、MPP SHA256 5eff488a6de7a8bb7927f6c4813eca0b1ad8cf374759ab98c6b5f0a3736899ac。emulator-5580の191/226/242既存隔離packageへ署名照合更新成功、各native表示11/検索37/模擬認証9項目成功。191は実GASレベル受信1件成功。最終crash buffer空。SystemUI ANRはWait復帰、初期native engine未生成とInt64試験側比較ミスは修正して再試験。実エッヂ認証→自身投稿→共有の通し確認は未完了。アプリRelease/タグ/配布feedは変更していない。


2026-11-01 01:28 JST 取得済みスレ検索の全レス混合順（未公開）
利用者画像と追加回答により「スレ作成日時で全板混合」ではなく「全スレのレスを投稿日時で混合」が希望と確認。CachedResponseOrderを追加、既存CachedSearchOrder mode3/4と選択欄・profile0〜4対応。既存0〜2の意味は保持。本文に引用された日付を除いてnativeレスヘッダーの日時をJST/millisで比較、日時不明は末尾・同日時はstable。スレ名headerを必要な箇所に再配置し、レス行/本文span/URL/flagsの元objectを保持。通常検索処理・件数・query・DATは変更しない。nativeパッチhook追加変更なし。
host新4027/旧2014成功、通常LintVital/R8 build3m11s成功。MPP SHA256 c24741235e7fc0035ef14cda83783eae3fe9399d51dd16fbc88cf5eff9213d3d。emulator-5580へ191/226/242を既存署名照合install-r成功。各native32/36/36項目で混合順・identity・クリック先・元state件数/query保持・標準復帰成功。242実UIで合成レス2022 A→2021 B→2020 Aの交差表示を目視、fixture解除・設定復元済み。初期試験のconstructor差異は試験側のみ修正し再成功。最終crash buffer空。docs/cached-search-response-order.mdとandroid-installations.mdに詳細。アプリRelease/配布feed更新なし。


2026-11-01 01:39 JST 自動NGの除外IDに追加：標準ツールバー設定対応（未公開）
利用者報告の常時表示は、RedIdAutoNgが表示判定を参照せず追加し、native toolbarカタログIDSにも未登録だったことが原因。0x7e484b02をResponseMenuSettings.IDS/NAMES/iconと配布string index8へ追加し、標準表示設定・並び順・個別override・placeholder除去の既存経路を適用。appendMenuとappendIdSheetの両方に同じ表示gateを追加。初期表示は従来同様ON、最低限構成ではOFF。既存の除外リスト編集toolbarボタンとは別の、選択ID追加の操作として保持。native hook追加変更なし。
通常LintVital/R8 build3m33s成功、MPP SHA256 dfe432433206e8a6e327e7ae0b70f4771d9c9892e7864818078cde91930cdad7。emulator-5580の191/226/242既存隔離packageへ署名照合install-r成功・cold起動成功。nativeカタログ1件/タイトルresource有効/重複なし/共有5先保持/標準ONOFF/独立性/順序/override/IDシートgateの各17項目成功。合成レスのみ、NG/除外ID登録なし、試験preferences復元。最終crash buffer空。docs/response-menu-settings.mdとandroid-installations.mdへ記録。アプリRelease/配布feed変更なし。


2026-11-01 01:56 JST IDがサイトカードになる誤検知の追加対策（未公開）
利用者の指定URLエッヂ1793443391/101を公開DATで確認、ID:eRNd.ru1fで本文URLなし。版は利用者回答「不明」。変更前現行PreviewUrlsで指定ID単体/ID付きは候補0件、当時の症状そのものを再現したとは扱わない。一方ID:後の空白/タブや全角コロン付きID: Abcd.efgh/ID：Abcd.efghは変更前1件と再現。ID名前空間範囲を明示し、その範囲内の裸ドメイン推測を除外。明示/省略scheme URL・後続URL・普通の裸URLは保持。元本文/ID/native spanを変更せず抽出と候補だけを制限。
host URL/GIF56項目成功、通常LintVital/R8 build2m57s成功。MPP SHA256 558cd04a602a56ada46c6a021068dd7ee4136d843eea46e3086ea8da36e8ee9e。emulator-5580へ3版署名一致install-r・cold起動成功、実SiteCards.urlsとPreviewUrls.extract各27項目成功（指定ID候補0、spaced/fullwidth ID候補0、通常リンク維持）。metadata要求/設定/NG/DAT変更なし、最終crash buffer空。docs/site-link-cards.mdとandroid-installations.mdに記録。公開なし。


2026-11-01 02:20 JST 公式Release前の最終確認（未公開）
利用者の追加指示によりエッヂ認証日の記録/同意/送信/推定をアプリから削除、GASも受付と配信を削除。公開スレで確認したレベルNGのみ初期OFFで残す。GAS既存deployment version10へ02:05 JST更新、既存URL/実行者/全員公開維持。公開GET observed1、authDays不在、旧認証API拒否、共有NG305件正常。build/gas-v10-verification.json、gas-v10-auth-removed.png。
投稿メール欄のautofill/メール分類/IME候補抑止を既存投稿hookへ追加。191の実layoutではhint E-mailを使って特定。名前/本文/タイトル/他ログイン欄、sage/文字列/選択/key listenerを保持。通常LintVital/R8 build2m57s成功、MPP SHA256 c03a67b63f250d1c0ec9ba3b62dd280bf3fa25be70c9cef99497aab683e8e634。
最終emulator-5580更新3版でメール45/検索37/除外ID17/カード27/公開レベル11、混合順32/36/36成功。native hook命令/register保持成功。3版起動/Part4本文/通常画像表示を確認、crash buffer空。初期fixtureのJava型比較と未接続Fragment生成問題を修正し再成功。runtime suiteに加えメール45最終結果を採用。host検証URL56/検索198/レス混合4027/旧ソート2014/公開レベル17/サーバー19、既存共有NG40/148/61成功。既存NG/DAT変更や実投稿なし。公開はCI完了後に別記。


2026-11-01 02:27 JST 1.17.0公式公開完了: 最終実装5b8363c、master統合4e67bac、Semantic Release CI41224071485 success、生成commit f01897e。prerelease=false/draft=false/latest確認。公開MPP SHA256 e99a9fe28e13d8afcc2a3257bba5c0ddb517b0b07933b3a472137b2d43b6e708、更新JSON両方SHA256 61b1ca37eb1472e62e35116002e6ecec1fd550f75ca48a0bef40e8ab1a444be3。asset digest一致・CRC正常・PostMailInput/CachedResponseOrder/ThreadSearchOptions/公開レベルNG同梱、認証記録/共有/推定キーとAPI不在、master/dev両feed1.17.0一致、開発中表示を確認。証拠build/official117-public/verification.json。公開URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.17.0 。旧ローカルタグとremoteの不一致は上書きせず、必要なbranchを--no-tagsで取得しCI backmergeをdevへff反映。


2026-11-01 投稿者強調の色見本修正（未公開）
Compose設定描画がTextView.backgroundColorを無視し、色見本を通常の説明として扱ったため消えていた。PosterHighlight専用色タグを設定モデルのfingerprintとBoundSettingの比較へ反映し、タグ付き見本だけ背景色/太字を描画。登録画面を復旧、共通設定と登録ごとの一覧にも見本を追加。継承中だけ共通色変更へ追従。色の保存形式/表示span/既存NG/DATは変更しない。native bytecode hook追加変更なし。
通常LintVital/R8付きbuild/highlight-preview-build.log成功3m42s。191/226/242へ生成・署名一致install-r/cold起動成功。各18項目と実画面の見本を確認、最終crash buffer空。初回191のruntime RPCが理由なしで失敗したため成功に数えず、診断を改善した再実行と登録画面を含む最終18項目で再確認成功。試験prefsはfinally復元。証跡build/highlight-preview-{191,226,242}-runtime.log、highlight-preview-after191/226/242.png。MPP SHA256 ea1def0406e55f0ae4c03e1df532c6fd0d7f453f9228b4e1a3ac018264974a97。公開/配布feedは変更していない。


2026-11-01 242の標準メディア終了ジェスチャー競合修正（未公開）
242/1.17.0相当で設定OFFなら上下スワイプで閉じ、ONなら上が次メディアへ移動、一覧先頭の下はイベントを消費するだけで閉じないことを再現。設定済みgestureBackを認識器単体で確認した旧試験では、標準Fragmentの上下ドラッグ終了を保護できていなかった。242のImagesViewer2Activityだけ縦移動をnativeへ渡し、左右の全スレ移動/保存済み戻る優先を維持。191/226には同じnative上下終了がないため適用せず、専用ビューアとともに従来の上下移動を保持。版判定はプロセスで一度取得し、gesture DOWNでsnapshot。native hook追加変更なし。
最終通常LintVital/R8 build2m57s成功。MPP SHA256 a6e1785561872598e0fbf6f23551890619d63aa3625281fac7388bb407736ba6。3版へ署名照合更新/起動成功。242は14項目、191/226は各8項目成功。新crash buffer空。native GIFの極小1px fixture/中心タッチで戻る試験が失敗したため、標準controlsを避けた位置と320x240 animationに調整し、最終trialを再実行。旧失敗を成功に数えない。元preferencesは復元、NG/DAT/投稿変更なし。build/media-native-back-final-{191,226,242}-runtime.logとmedia-native-back-*-result.json。公開/配布feedは未変更。


2026-11-01 18:19 JST 設定UI・スクロール復帰・検索・メディア順序・native一覧/投稿menu修正（未公開）
設定一覧/検索/カテゴリのLazyListStateを分離し、カテゴリから戻ると先頭になる症状を修正。修正前191で実再現、最終3版でカテゴリ内スクロールと再訪問後もhome bounds完全一致。設定UIをコンパクト化、共有/読込を横並びへ。スレ内検索ID/名前/ワッチョイは新規初期OFF、保存済み選択保持、ヘッダー曜日は対象外。Imgur album遅延完了のサムネを本文URL位置へ挿入。native cached subjectのHTTP504が成功の空一覧になる経路を3版でnullへ戻し再読込へ渡す。226/242投稿popupはIMEを避ける測定modeへ。242純正巡回イベントへ失敗板URL/例外種類を追加。
最終通常LintVital/R8 build2m21s成功、MPP SHA256 6a5ed6b65425d9befc2555fcf3b395b3a3b065be12097b35a547bb7024ad3465。emulator-5580の3版既存隔離packageへ署名一致install-r成功。各スクロール実往復2回、検索38/album7/native191と226は11、242は15項目成功。元native命令/register/分岐先保持確認、crash buffer空。242実投稿popupでGboard表示中の標準︙表示確認、実投稿なし。11タブ往復/最大Gboard/実巡回からイベント画面までの通し試験は未完了、巡回URLは242のみ。docs/reader-ui-fixes-20261101.mdと導入台帳に証跡/未確認範囲。公開なし。


2026-11-01 18:54 JST 191/226/242対応差の整理と共通化（未公開）
191/226へ巡回板取得のエラー捕捉を追加し、242も含めた端末内100件の共通エラー履歴を履歴カテゴリへ追加。242純正イベント追記は保持。共通Intent境界でACTION_WEB_SEARCHへNEW_TASKを付け、191専用の対策を全版へ適用。版固有のnative構造に対する修正は維持、docs/version-parity-20261101.mdに判断表。
通常LintVital/R8 build2m31s成功、MPP SHA256 a7fca9a480f08b0339fd37136c165bdff6a6de2579c9ad8282663d895c420dda。emulator-5580の3版既存隔離packageへ署名一致更新。native各18/18/20、各album7/search38/Web検索6、共通ログ実UI表示成功、host609成功。worker元命令/引数/register/分岐先と例外同一性の検査成功、crash buffer空。実通信の巡回全体・実検索アプリへの遷移は未試験。XIG05はADB接続消失で更新失敗、先のreader-ui-scroll版維持。公開なし。


2026-11-01 19:49 JST 既存機能全体の版間対応調査へ拡張（進行中・未公開）
利用者回答により直近修正だけでなく既存機能全体が対象。56ファイル/125関数・スコープ/397参照の自動索引docs/version-parity-source-index.mdを作成。索引は手動レビュー済みを意味しない。既読スレを上にのHaiagaru設定入口が226限定だったため、191/242等にも既存キー・scope選択・再描画を共用して追加。通常LintVital/R8 build2m20s成功、build/full-parity-settings.mpp SHA256 f261fa50e2711f0c4de1838c76068b4988687309bfa8b4a6e5dfa349c118a5db。今回追加のAPK適用/端末検証は未実施、インストール済みは前回version-parity-final版のまま。全既存機能の同等化完了とはしない。残確認はdocs/version-parity-20261101.md先頭へ記録。公開なし。


2026-11-01 20:53 JST 共有NGの審査・種類別履歴保存をGAS本番へ反映（アプリ未公開）
利用者指示で禁止語辞書ゲートを廃止、基本形式を満たす条件は正規表現を含め1報告から承認。NGワード5文字以上・英字のみ不可は維持。Java/GASの正規表現構文差により、構文検査はAndroidのPatternに委ね、invalid条件だけ受信時skip。旧appへregexを配信しないcapabilityを追加。Inboxは未審査キュー、NG_ID/NG_Word/NG_Wacchoi/NG_Name/NG_Reporter/NG_Otherへ審査済みの元履歴・理由を移動、退避journalで途中失敗を復旧。ID24h/ワッチョイ7日の期限削除は利用者の最新指示で撤回、永久削除なし。
GASのcloud 4ファイルをHEAD基準と照合（Moderationは空行1つのみの差）、ローカルと全文hash一致を確認して保存。既存URL/owner/全員アクセスを維持して最終version13へ更新。初回配信試験のlock timeoutを受け、100KB制限で従来cacheされなかった大きなJSONを20,000文字ごとに分割cacheし、全片hash検証・manifest後置・審査時無効化を追加。旧app通常条件のflags18は0x70だけを見て保持。最終公開GET旧816件/新996件うちregex180件、private metadataなし、応答navigation2489ms/1605ms。読取専用監査は履歴2168/approved2168/配信996、issues/warnings空。Inbox見出しのみもUI確認。証跡build/shared-ng-v13-verification.jsonとbuild/shared-ng-v13-audit.jpg。
Node moderation53/lifecycle74/personal148/service40+legacy41/edge19、Java rules96/index10003/regex17成功。Android通常Lint/R8ビルドはホスト仮想メモリ不足で失敗、in-process再試行もR8中にPowerShell OutOfMemoryで中断。最終成功MPP更新・APK導入・アプリ公開なし。必死viewer=false検証/フィルター高さ/全機能版間確認は未完のまま保持。


2026-11-01 公式Release候補（公開前）
下部フィルター高さつまみを共通実装、popup/pinnedとも高さ保存・非表示保持・ScrollView・本文viewport予約を確認。必死viewerパッチfalseを専用UI生成/新タブ両経路へ適用。共有NGのJava正規表現decode/cache/match対応、GASの種類別履歴・辞書不要自動承認・期限削除撤回は前記v13へ配備済み。
追加報告により191 GETの接続非再利用をpool分離/zero idleへ強化、50ms TCP候補開始、通信全体新規初期60秒（既存0保持）。前スレリンクの90日未満判定・HTTP HTTPS化・archive GET308等対応。通常投稿/メディア/外板へ5chミラー適用を拡げない。
通常Lint/R8 build/release118-final-build.log 2m46s成功。最終MPP SHA256 d32d05f38927879d4b9813846d3d47ea4cb2a081098875022f28b3ab58720910。3版最終APK署名一致install-r/起動、共有NG18/検索38/album7/Web検索6/高さ28、必死ON各4、OFF実APK各18、既読設定3/前スレURL6成功。native reader/patrol/update命令継続22/6/6と191橋15sites検査成功。191新pool8、local接続561/316/595/580ms、連続受信2003ms timeout後の次取得成功、stream17成功。メディアは226各8/242各14最終成功、191結果は後記。追加の再ビルドはホストnative memory不足で失敗、成功済みMPPは維持。エミュレータADB停止は同AVDのdataを保持して再起動し、242試験をやり直して成功。公開CI成功を最終条件とする。詳細docs/release-118-verification.md、台帳docs/android-installations.md。
版別全機能の機械的移植は行わず、HOMEの下部選択バー等の版専用UIは適用範囲を維持。全既存機能の全版移植完了とは報告しない。公開はSemantic Release CI経由。

最終メディア191/226各8・242は14項目成功。242はエミュレータ再起動後のrelease118-media242-final.logを採用。最終crash buffer空。実回線の巡回一巡は未再現のため、接続対策の改善と検証範囲をRelease説明へ明記。再ビルド時のnative allocation失敗はホストhs_errで確認、成功済みMPPと最終APKのSHA照合を維持。


2026-11-01 公式1.18.0公開完了
最終実装968d107、検証記録9bda440、master統合a681009、Semantic Release CI41308643478 success、生成commit33c5da2。prerelease=false/draft=false/latest=1.18.0を確認。公開MPP SHA256 71edb0db481229fc5e78b82fee0ead0f81ce771a0268da4600dc923b052d233a、GitHub asset digest一致・CRC正常。高さ設定2キー/191pool分離/timeout/archive308を公開MPP内で確認。master/dev両feed1.18.0・同downloadURL、添付feed2つSHA256 de129ed07e2c3a67985974448daea919832f04cff46e255e155ef3f0c4e7a031一致。公開CIのコンパイルでローカル再ビルド時の環境メモリ不足とは区別して成功確認。証跡build/official118-public/verification.jsonとci.log。URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.18.0 。canonicalはdevへ戻しCI backmergeをff取り込み済み。


2026-11-02 スレ全メディア移動の191/226/242共通化（未公開）
利用者指定により242標準ビューアだけの上下終了優先を撤回。全スレ移動ONでは191/226/242共通で上下左右に移動し、保存済みの戻るジェスチャーは優先。242のサムネ直通も191/226と同じprepareNativeIntentを通し、最初のnativeページと全スレsnapshotを分離保持、GIF/動画は共通redirectNativeで選択。戻る認識器がある場合もnative canvasへCANCELを渡して242のnative終了が先取りしないようにした。拡大/複数指/操作部品の除外は維持。native bytecode hook追加変更なし。
通常Lint/R8 build/gallery-parity-final-build.log成功2m58s、MPP build/gallery-parity.mpp SHA256 cf2505c955105e59e44145b26d9be42b124f1bf65df44a77070d31a7cb27387f。3版既存隔離packageを署名照合install-r/起動成功。host MediaGallery41項目成功。media191/226各18・242は20項目成功、標準画像/標準GIF/専用GIF/専用動画間の上下左右・戻る優先/非戻る方向の移動・242設定OFFの上下終了を確認。191/226では先頭下方向の非wrapと右方向復帰も確認。各版のnative factoryとサムネ直通/開いたviewerの実Intent確認は11項目、全スレsnapshot/クリック位置/ContextWrapper/OFF維持を確認。hook元命令/register/分岐を3版、242 thumbnail wrapperを別途検査成功。最終crash buffer空。
初期試験は純正gesture方向codeを誤って1/2/3と仮定したため失敗、native認識器を調べ左4/左上84/左下24で試験を修正。captureしたstartActivityのhookに依存する試験を、実際に開いたviewerの確認へ置換。旧失敗を成功に数えない。全てのfixture変更設定をfinally復元、NG/DAT改変・投稿なし。URL指定のActivity起動は自動審査で拒否されたため保存済みスレ一覧から開いて検証。docs/image-gallery-media-compatibility.mdと導入台帳へ記録。Release/feed更新なし。
追加191拡大判定確認: native renderer B=1/C=aa=6.7080746、初期fitは非拡大、手動1.5倍は拡大扱いとなり移動を抑止する判定を確認、元位置へ復元。build/gallery-parity-zoom191.log。


2026-11-02 操作を基準にした版間差の共通化（公式公開候補）
利用者指示で便利な動作へ統一、HOME複数選択の下部表示は242専用のまま維持。57ファイル412参照行の索引を更新し、native互換binding・純正の初期値継承と、利用者の操作差を区別。全ての既存機能を全実画面で再試験したとは扱わない。
NativeThreadContextへ現在のFragmentのboard/flow/URL取得を集約し、検索toolbar・ReadingPosition・共有NG送信元選択で共用。226のlazy getterのaccessibilityも統一。選択中以外のtab/過去のboardをfallbackに使わない。226/242の画像canvasはFrameLayoutのため旧ImageView判定が効かず、手動拡大でもfalseになることを旧APKで再現。191/226/242のscale/min/fit bindingを共通ImageZoomStateへ接続し、fitは移動可・手動拡大はpanを優先。
242のReadingPosition.SESSIONSが0の不具合を試験で発見、visible後の手動registerならanchorが得られることを診断。onViewCreated時は一覧非表示のためFilterPosition.findListが除外していた。findListForBindingだけ非表示一覧へ対応し、既存の表示中findList/anchor可視性は維持。最終実APKでは手動registerなしで3版のobserver/anchor取得を確認。
通常Lint/R8最終build/parity-usability-final-build.log成功2m23s。最終MPP build/parity-usability-final.mpp SHA256 52daa4e5c3af282cd48fe3309a4bff998b1940cea04811845bc0406311b4fc48。3版署名照合install-r/起動成功。host context58/MediaGallery41成功。Android各context16（板/toolbar上下/observer/anchor/共有元/非表示binding）・thumbnail11・zoom8成功。最終メディア191/226各18、242は22項目、最終191結果は後記。元native touch命令/引数/register/分岐3版、242 thumbnail wrapper検査成功。詳細logs build/parity-usability-final-*、台帳android-installations.md。
初回242の連続メディア試験は動画prepareが25秒以内に完了せず失敗、同packageをforce-stop/cold起動して全項目再実行し成功。native data-source content-resolver警告は過去の成功時も存在するため根因と断定しない。旧失敗を成功扱いしない。191UI dump一時nullはcontext/thumbnailの実Fragment取得と成功結果で確認。新規NG登録/投稿/送信なし、GAS変更なし。保存済みprefはfixture finallyで復元。最終crash確認と公開結果は後記。
最終メディア191/226各18・242は22項目成功、3版context16/thumbnail11/zoom8成功を全ログJSONで再確認。最終crash buffer空、build/parity-usability-final-crash.log。UI設定の新規項目やキーの変更なし。公式公開は既存Semantic Release CI成功・配布asset/両feed検証を条件とする。

2026-11-02 1.18.1公式公開確認完了。実装1eb6181/2ce2680、master統合5276a06、CI41326392528 success。公開MPP SHA256 e48f2570dc79fd0cd2ed879b4e3a0017292e61c44e66e8517b0b1908d3c1d161、CRC/asset digest/新共通処理同梱正常。両feed SHA256 17d78e41c2f7aa9bbe4d2d44f24e3ba76d39c797cfe77cf39514b187bf80a3d9、master/dev両feed1.18.1一致、draft=false/prerelease=false/latest確認。build/official1181-public/verification.json/ci.log。devへCI backmergeをff取込済み。URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.18.1 。追加報告の復元/更新時不具合は次の調査対象として扱う。


2026-11-02 Haiagaru ZIPの書き込みマーク保存・自動バックアップ設定補完（公式公開候補）
追加報告: 191で手動/自動復元後の一部自分マーク欠落、自動バックアップ設定初期化、191→242同一アプリ更新後の返信通知/未読区切り。復元形式は利用者回答「おそらくHaiagaru」、対象URL/通知だけか通常読込でもかは不明。
確定した実装漏れ: POST_HISTORYはpostDataList.jsonだけで、マークを持つdat/*.idxはDAT選択時だけ保存されていた。DAT rootをPOST_HISTORYとも関連付け、DAT未選択時は.idxだけを保存・検査・復元するよう補完。DAT入りZIPのPOST_HISTORYだけ復元でも本文を変えない。既存旧ZIPは読めるが、索引がない旧バックアップのマークは今回の変更だけでは取り戻せない。保存項目名を更新。
自動バックアップ専用prefがSETTINGSの収集対象外だったため、間隔/保持件数/保存対象だけを明示的に保存・復元。フォルダ/ON/OFF/最終成功/所有ZIP一覧を他の環境から持ち込まない。設定が未選択(0)の状態も許可し、mergeは既存値を維持。
同一隔離package migration191242で公式1.18.1の191→242を上書き更新し、enabled/hours/keep/categories/folderの保持を確認。通知許可なし初回試験はPendingIntentを保持しなかったため採用せず、許可を与えNotificationManagerが保持する合成通知で再試験し、更新後の同じPendingIntentを送信して対象スレの応答45を表示できた。初回の同意画面は191側の新規fixtureで未同意だった条件を含み、ユーザー症状の根因と断定しない。合成read_count40/全80の通常読込では区切りが上端に表示された。通知/未読/ON・保存先初期化を修正済みに含めない。build/migration-permitted-notification-send.json、migration-permitted-notification.xml、migration-unread242-current.xml。
最終通常Lint/R8 build/backup-marks-settings-final-build.log成功2m55s（低めの1536MiB heap/worker1）、MPP build/backup-marks-settings-final.mpp SHA256 7b7fcc383130ef5ab43bba2d54cea8409a6bdb8a30aba62ebc0222d0a58771e6。3版既存専用package署名照合install-r/起動、各ZIP/settings15項目成功、各native画像/GIF/拡大/移動8項目成功。native index readerで復元したレス3の自己投稿bit1を認識。最終crash buffer空。台帳android-installations.md、scripts/backup-marks-settings-runtime.js。テストContextの引数付きoverride不足とFile返却fixtureエラーを修正して再試験。失敗を成功扱いしない。
242用CLI初回はhost heap領域確保不足で停止。既存AVDをdata保持で停止し、ホストでAPKを作成してから同AVDを再起動、最終全版試験成功。実機/通常packageの変更なし、投稿/NG送信/GAS変更なし。公式公開は既存Semantic Release CI経由、結果を別記。

2026-11-02 1.18.2公式公開・配布確認完了
実装67579dd、master統合75c06c0、Semantic Release CI41359172723 success、生成commit c445e23。公開MPP SHA256 4d00bcc3868bf963137854eb791fd05a050d3ee92da4b73f73e29a2e54c8dba7、asset digest/CRC/新実装同梱を確認。両feed SHA256 745b43ff0f5d9c8d7d2b86c998b8e9b0aafbb77b21abe77178daf169d81535c3、master/dev両feed1.18.2一致、draft=false/prerelease=false/latest確認。証跡build/official1182-public/verification.jsonとci.log。devへCI backmergeをff取込済み。URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.18.2 。
追加通知試験では191で通知許可後、NotificationManagerに44411が保持されたことを確認。242へのinstall-r後は通知自体が消えたため、その通知を直接タップできたとは扱わない。同じ更新前PendingIntentが保持されていることをNO_CREATEで確認し、再生成せず通知へ再表示、その通知を実タップして対象レス45を表示できた。証跡build/migration-final-tap2-notifications-before.txt、migration-repost-existing.json、migration-reposted-shade.xml、migration-final-real-tap242.xml。通知の再表示を挟んだ限定試験であり、実際の返信通知全経路を再現したとはしない。通常未読での上端表示は前記試験、通知からは指定レスが見える位置を確認。ユーザー回答でも未読不具合の発生条件は不明。通知/未読表示/ON・保存先初期化は未再現として継続調査、修正済みに含めない。
最終専用fixtureの自動バックアップをOFF、通知44411を取消し、crash buffer空を確認。build/backup-migration-cleanup.json、backup-marks-settings-postrelease-crash.log。実機/通常package/投稿/NG送信/GAS変更なし。

2026-11-02 アーカイブ詳細遷移・バックアップチェック表示の改善（未公開）
追加報告は226/OPPO/Android12/1.18.1の下方アーカイブが開かず上へ戻る症状と、上書き後の自動バックアップOFF。利用者は当初Haiagaruレス保存と回答、その後ChMate標準かもしれないと補足。発生する一覧段階・保存先/間隔消失の有無は不明、Frida調査の許可あり。
修正前226で、保存先未選択のONをnative listenerが拒否して保存値falseでも、ModelUiの独立Compose状態だけtrueとなる症状を再現。BoundSettingRowへ統一し、確定したnative値を描画・ラベル全体を操作対象にした。保存済みtrueが上書きでfalseになる現象は未再現、画面だけONになる不具合と区別する。保存レス詳細も非同期dismissより先に新dialogを開いていたため、既存dismissForNavigationで入力処理を抜けて一覧を閉じてから詳細を開くよう統一。
通常Lint/R8最終build/archive-toggle-final-build.log成功2m52s、MPP SHA256 48b562db1f8f36324a37f24da57e9e0fa3ef9a81804aa560524dfd03018674dc。emulator-5580の同一隔離migration191242へ署名照合191→226→242更新。各ON更新保持/拒否OFF表示と保存/許可ON表示と保存/再起動保持/40件一覧下方のスレと保存レスの一致が成功、191/242各11・226はFrida順序を加え13項目。修正前detail→show→dismissNow、修正後dismissForNavigation→dismissNow→detail→showを確認。各標準画像/GIF/拡大8項目成功、新crash buffer空。初回画像試験の入力パス誤りは成功に数えず、正しいfixtureで再実施。
標準50件の37件目も含め、修正前から一覧下方の表示は成功し、報告の「上に戻るだけ」そのものは未再現。Android12実機未検証、ChMate本体由来の可能性を残す。docs/archive-backup-controls-20261102.mdと台帳に記録。検証後は専用packageの作成ID/パス/ファイル名を照合し40保存用スレ・50標準fixtureを削除、自動バックアップをOFFへ。実機/通常package/投稿/NG送信/GAS変更なし。公式Release/配布feedは変更していない。

2026-11-02 アーカイブ選択の標準リスト化・バックアップ一括設定保護（公式候補）
追加指示で修正・完了後の公式Release。最低限構成/広告だけのプリセットがbackup.enabledをfalseへ書く経路を修正前実APKで再現。両プリセットの変更対象からローカル自動バックアップを外し、旧退避snapshotの復元でも同namespaceをスキップ。ON/OFF/保存先/間隔/保持数/対象/所有記録等の全値を維持する。既にOFFになった状態を推測してONには戻さない。Haiagaruの保存用スレ選択と従来保存レス選択はAndroid標準AlertDialog/ListViewへ切替。ChMate純正のアーカイブ選択は未変更。報告の「上に戻るだけ」そのもの・APK更新のみでの設定消失・OPPO Android12実機での解消は未再現/未確認としてRelease説明に明記。
最終通常Lint/R8 build/archive-preset-final-build.log成功3m、MPP SHA256 375b01f1056663269ac389d790e0d5fa2d61530fbe293705e31f710977226100。emulator-5580の隔離migration191242を署名一致更新、UI191/242各15・226各17成功、各プリセット保持15/画像GIF拡大8成功。各版のキャッシュ済み通常スレ本文レス45を最終同APKで確認、自動再読込OFF・投稿なし。新crash buffer空。native hookコード・レジスター・元命令に変更なし。テストハーネスのKotlin再配置/最適化を調整して再実施、旧失敗は成功に含めない。40保存用スレ・40従来レスのfixtureをID/URL/パス照合後削除し、自動バックアップOFF。実機/通常package/実投稿/NG送信/GAS変更なし。docs/archive-backup-controls-20261102.md、android-installations.mdに詳細。
前回703d5cdのdev CI41370725214が1.18.3-dev.1を生成し成功、6041509をff取込。今回の追加修正は公式CIへまとめて反映し、公開後にassetと更新feedを検証する。バージョン表記だけを公開成功とは扱わない。

2026-11-02 1.18.3公式公開・Morphe表示確認完了
追加実装f20d8d7、master統合a1d5f83、Semantic Release CI41372800284 success、Build Haiagaru CI41372800348 success、生成commit ae33dd1。公開MPP SHA256 23c4e3c10c5765a9e2c4ee9a4d7c698a239a9204f6aeb30942d16a795b7e07ee、asset digest/CRC/Android extension DEX・新旧必須処理の同梱正常。公開feedはstable SHA256 fc7d205123c82dd6c64cc88ff29014416ec01e8419304f83200b44e7e1e6ae01、pre SHA256 88f0d165a5069978e64a2872297b08081fa299e82ae7d19ff6a6e8e43ca33279。master/dev/mainの両feed計6件が1.18.3・同MPP URL、created_atのタイムゾーン無しISO形式と署名URL空を確認。draft=false/prerelease=false/latest確認。build/official1183-public/verification.json、ci.log。
emulator-5580の既存app.morphe.managerでHaiagaru配布元を確認。事前表示1.18.3-dev.1、プレリリース受信ON。更新時のlive logcatからmain/patches-bundle.jsonとdev/patches-bundle.jsonへの実要求を取得（公開URLのみ記録）、登録先・受信設定を変えずに再更新して1.18.3・8パッチの表示を確認。初回更新後は旧表示だったため成功扱いせず、最終UIを採用。build/official1183-manager-final.xml、official1183-public/manager-verification.json。追加のManager APK更新やソース再登録は行っていない。
公式URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.18.3 。canonicalのmaster/devをCI生成commitまでff取込し、devへ戻した。修正・公開・配布確認を完了。報告されたChMate標準側のアーカイブ症状/更新だけでの設定消失/Android12実機は未再現・未検証として公開説明に保持。

2026-11-02 191の未取得5chスレ速度調査・広告走査最適化（未公開）
利用者報告は1.18.2より1.18.3が遅い、段階/URL不明。実機未接続、利用者指定でエミュレータ確認。公開MPPから同選択/署名/packageの191を作り同データで比較。初回の最初のレス確認6.843s対8.692s、native HTTPヘッダー466/469msだったが、A再測定11.192s、B再測定9.422s、本文投稿数増加・System UI応答停止・PCビルドのnativeメモリ不足等もあり、版固有回帰や全体改善率は断定しない。通信処理の直接差分なし。mainサンプルの既存defaultAdClass/classExistsで、異版の未存在クラスを各ビューで反復検索していることを確認。既定選択をprocess内lazy holderへ、走査中は設定一度読込へ変更。任意設定は次の走査で反映、画面保護・折り畳み処理は維持。
201ビュー単体の修正前248〜489ms→修正後191/226/242は0.30〜0.58ms。スレ起動全体の倍率ではない。通常Lint/R8最終build/thread-open-ad-cache-final-build.log成功2m43s、MPP SHA256 7f39bcc7e0ab49dc6e4e11f97854c20198fd2c0652fb94e6719f599d75c70711。emulator-5580の隔離migration191242へ署名一致更新、各広告10/画像GIF拡大8、native通常本文を確認。最終crash buffer空、native hook命令/register変更なし。System UI応答停止中の画像失敗・242 null dumpは再試験成功を採用。タスク所有の公開スレDAT/idx/bookmark/論理位置/markerは照合して削除、実機/通常package/投稿/NG送信/GAS変更なし。docs/thread-open-performance-20261102.mdに測定条件・生データ・残確認、台帳にAPK署名を記録。公式Release/更新feedは変更しない。


2026-11-02 検索入力・通知・エッヂ閲覧認証の作業引継ぎ（未公開）
emojiMode=allのEditTextをEditable置換なしに修正。191/226/242のinterval/footer版で各53項目、242 native検索欄で入力後800msを待つ4項目を確認。通知は初期15分、15〜10080分の任意整数、JobSchedulerの永続化・背景合成20→22件で通知を確認。閲覧認証のCookie/UA連携6項目を3版で確認したが、実VPNのCloudflare成功は未確認。実タイトルUIでCompose別windowのため追加ボタンが外へ出る問題を発見し、native Dialog onStartで実windowを装飾する変更を実装、通常ビルドと3版CLI生成は成功。modal版の実メニュー表示確認は途中で利用者の新ブランチ要求へ移ったため未完。公式公開の成功扱いにしない。docs/emoji-thread-watch-reading-auth-20261102.mdに詳細。利用者提供の旧/新.haiagaru設定比較はdocs/settings-delay-comparison-20261102.md、原本は変更なし。

2026-11-02 22:21 JST 5秒ランダムUAの実験ブランチ・191実機導入
利用者指示によりdev/f2b2b45と進行中の変更から作業ブランチ（random-user-agent-5s）を作成。閲覧・書き込み両方のUAを5秒区間ごとに5種類から変更、同一区間固定・次区間非反復。通信のない時間のタイマーなし、既存Cookie/本文/メソッド/送信先/通信中のUAを変更しない。通信・詳しい設定に独立ON/OFF（初期OFF）、設定ファイル対応。
ホスト2500項目、通常Lint/R8 build/random-ua-5s-build.log成功4m20s。MPP SHA256 67a5c1856f26abc3acca572eb339bfce93ed5745810e9e20a41e9b6a888cd8f9。XIG05/Android15/730eae72へ別package jp.co.airfront.android.a2chMate.haiagaru.randomua191、Haiagaru UA切替191として導入成功、実APK hash一致。導入APKのnative191 POSTとjava.net GET/POSTの準備12項目をapp_process＋メモリ内設定で検証（実接続/投稿0件）、対象PID crash空。初回テストcompileのProxy曖昧参照を修正し再試験成功。端末の本設定は初期OFF、利用者が設定でONにする。docs/random-user-agent-5s-20261102.mdと導入台帳。公式Release/feed/GAS変更なし。

2026-11-03 通知・閲覧認証modal版の確認とMi Note 10導入（未公開）
中断前のmodal候補MPP 379925b38ff3d1a1cb789d3ad194707b40a992f14ecd4ed08a9bef608fadfccbを使用。191/226/242へ署名一致更新し、各53/54/54項目成功。226/242実タイトルメニューの同一window内に通知ボタンを確認。242で実UIから17分を保存・確認後に初期値へ復元。エッヂ閲覧認証Activityと対象HTTPSホスト・閲覧専用説明を確認。実VPNでのCloudflare成功は未確認。191/226/242 title hook各1、Dialog onStart追加0/2/1、242テキスト境界142を検査。Frida偽Fragmentの返却参照はretainしてハーネスを修正、旧失敗を成功扱いしない。
利用者の追加指示でMi Note 10/Android11/d5497008の既存検証用242へinstall-r Success。package jp.co.airfront.android.a2chMate.haiagaru.resumefix242、表示名Haiagaru 検証 242、APK build/watch-minote242.apk SHA256 fdb4881be27138e1b3b842c15ac26c84f72c653548f04031ed60c7893eb2022e。実APK hash・署名一致、PID18973・対象PID fatalなし。通常アプリの削除・データ消去なし。メモリ不足対策で検証AVDのみデータ保持で停止。別作業のランダムUA実験を含まない候補APKであり、ソースの実験ブランチは維持。docs/emoji-thread-watch-reading-auth-20261102.mdとandroid-installations.mdへ証跡・限界を記録。公式Release/feed/GAS更新なし。

2026-11-03 通知間隔・固定UA復帰・エッヂ閲覧認証・パッチ対象の固定クラス一覧化（公式公開候補）
通知は1分〜7日、日/時間/分の入力へ変更。1〜14分は永続単発Jobを終了後に再予約、15分以上は周期Jobを維持。初期15分・OS省電力遅延をUIへ記載。ランダムUA実験はコード/設定UI/profileを削除し旧キーを除去、固定テンプレート/カスタムを保持。エッヂ純正確認画面でテキストURL/通信用UAを使って空白になる経路を、HTML板ページ/標準WebView UA/DOM storageへ修正。失敗・challenge・空文書の間は古いCookieだけで閉じず、状態表示/再読込を追加。Mi Note 10/d5497008の検証242へ署名一致更新、VPN設定を変えずCloudflare表示→native板一覧→本文新着1→2件取得を確認。投稿側の別警告が出たことはdocsへ記録、投稿対応完了とは扱わない。
認証3版は明示クラス名指定、さらに利用者要望でChMateパッチのclassDefForEach39か所を版別固定一覧へ置換。クラス型によるfallback探索なし。既存構造検査を残す。3版で旧走査版と全定義が一致（191 36,944/226 58,564/242 67,768クラス）。同梱DEXの衝突隔離とpatcherの必須DEX処理は維持。
通常build/class-bindings-fixed3-build.log成功29s、MPP bdda80841ecabd3c1ea36be572045739587b208b80502b5ea8f6f38d2df76b1b。隔離emulator-5580のbindings191/226/242へ署名照合導入、各73項目とnative本文表示、新fatalなし。所有fixture削除/通知0/設定復元。初回BE worker一覧漏れ・比較ツールAPI指定・System UI応答停止中の画像失敗・242Compose反映待ち不足は修正/再試験して成功を確認、旧失敗を成功扱いしない。docs/full-class-scan-inventory-20261103.md、reading-native-challenge-20261103.md、thread-watch-short-intervals-20261103.md、android-installations.mdに証跡。利用者の公式Release指示あり。CI公開と配布asset/feed確認を次に行う。GAS変更なし。

2026-11-03 1.19.0公式公開・配布検証完了
実装25d533f、公開説明3e66d05、master統合e2368cb、CI生成f259458。Semantic Release CI41500539430とBuild Haiagaru CI41500539348がsuccess。公開説明の旧版テンプレートを検出した最初のCI41500202016は公開前にcancelled、1.19.0未作成を確認して.releasercのheaderPartialだけを今回の仕様/検証範囲へ更新した。手動タグ/Release/配布物の作成なし。
公開MPP SHA256 c046889f72970d31cb39171dcffcdc6c3ac65135db037d1df6cc976e4367d40e。GitHub asset digest一致、CRC正常、3版の固定クラス一覧が検証済みsourceと一致、記録用ClassBindingTraceと廃止したRandomUserAgentRotationが不在、閲覧認証/通知/固定UA同梱を確認。stable/pre両feed SHA256 2bb062139c2cd68c28b03c73f89c25768fcf85182da1a3539337225404ad73ca。master/dev/mainの両feed計6件が1.19.0・同MPP URLで一致、日時形式・署名URL空・今回の公開説明を検査。draft=false/prerelease=false/latest=true。build/official1190-public/verification.json、release.json、ci.log。公開後のCI生成履歴をdevへff取込、検証AVDのみデータ保持で停止。通常アプリ/投稿/GAS変更なし。
公式URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.19.0 。

2026-11-03 共有NG GAS v14: 特定reporterを非公開IGNORED_REPORTERSで除外。有効報告へ正常応答/ACKし保存しない。既存履歴を保持し配信票から除外、他reporterは継続。local330チェック成功、GAS3ファイル保存再取得一致/同URL v14更新/UI設定一致/公開GET ok revision113・1704条件・private metadataなしを確認。追加editor exportはlock timeout、実POST未実施。アプリ変更・Releaseなし。詳細docs/shared-ng-review-implementation.md。


2026-11-03 未取得5chスレの遷移前取得・二重ダウンロードを修正（未公開）
利用者の191/1.12→1.19 GIFとコード差分から、968d107で通常の最近の5ch URLまでimporterを呼び、live DATの全取得後に破棄してnativeへ再ナビゲーションする経路を特定。600msの制御応答で一覧遷移を620ms待つことを再現。通常の最近の5chはnative画面を先に開き、既存DAT worker bridgeで初回取得DATを消費するよう変更。cache更新/IDX/設定OFF/外部板/Talk/VIP/旧過去ログ経路を保持。3版各18項目とnative初回1取得・本文レス45表示成功。通常build4m16s成功、MPP SHA256 9a6fe7f97a0924bb563ab508309de03c7fbc834427f7024e5bb52c1cafd5b7f3。nativeフックの追加・register変更なし。詳細docs/thread-open-prefetch-regression-20261103.md、台帳。Samsung17実時間/同一板一覧の実タップ比較は未確認、1.18.2/1.18.3間の全差を説明したとはしない。通常アプリ/実機/投稿/GAS/公式Release変更なし。


2026-11-03 通知登録スレの実機確認: 730eae72/XIG05の利用者package jp.co.airfrt.android.chMate.haiagartu（191 dev）で既存1登録・1分設定をread-only確認。対象URL tagの実通知がNotificationManagerに存在、通知許可/channel有効、Job実行完了履歴と次回永続単発予約あり。ただし現在RARE・CONNECTIVITY/WITHIN_QUOTA未充足で実行待機、毎分実行を保証しない。新規投稿待ち/タップ/長時間消灯試験は未実施。設定/通知/実行枠変更・強制Job・投稿・APK導入なし。docs/thread-watch-real-device-20261103.md。


2026-11-03 通知本文・ChMateアイコン・設定入口最上部・README全面整理（公式公開候補）
利用者指定でスレ名/新着本文最大3件/件数/ChMateアイコンを通知へ追加。新着時だけDAT追加取得、取得不可時はtitle/count通知。浮動PopupWindowを廃止し既存SettingActivity onResumeから同じcontentの最上部へ入口を追加、native/Compose viewはdetachしない。191/226/242各通知17・入口15項目成功、242背景Job合成20→22で本文付き通知1・次回予約成功。host30。最終通常build3m52s成功、MPP SHA256 60a554a4384e7611f3bfcafe5f8bdf03509f70e2524f9d5ea8dd012c02e0d2d0。登録/設定復元・新規fatalなし・実APKhash一致。利用者指定で変更外の本文/画像/GIF/動画の再検証省略、初期ANR/ハーネス失敗は除外。READMEとリンク先を現行9カテゴリ/署名条件/配布・操作へ更新し参照57件正常。台帳・詳細docs/notification-settings-readme-20261103.md。既存CIで正式公開し配布物/README/feed検証を次に行う。


2026-11-03 1.20.0公式公開・配布・README確認完了
実装767e693（通知本文/ChMateアイコン/最上部設定入口/README全面整理）、既存のDAT二重取得修正2fe4952をmasterへ統合e008610。Semantic Release CI41576859604とBuild CI41576859617がsuccess、生成commit525a2a5・tag1.20.0。手動タグ/Release/assets作成なし。
公開MPP SHA256 fe849e75858486f27a7afeb722286955a90fe56000fb34358dfb6435cf79e669、GitHub asset digest一致・CRC正常。新入口/通知/初回DAT再利用を同梱、旧Popupボタンと廃止UA実験が不在。stable/pre両feed SHA256 e3b69047ff16464629228580903b161c46df903599cfd55fbccb722699e5f37f、master/dev/mainの両feed計6件が1.20.0・同MPP URL・今回説明で一致。draft=false/prerelease=false/latest確認。README masterのblob SHA355f44b885701f451472d52bdc77994b7529b24fが検証済みローカルと一致。build/official1200-public/verification.jsonとrelease.json、official1200-release-ci.log/build-ci.log。
ユーザー指定で今回変更外の本文/画像/GIF/動画再検証を省略し、公開説明に明記。各通知17/設定入口15、背景Job→本文付き通知と次回予約、ソース/文書参照57件の検証は前記記録。検証AVDはデータ保持で停止済み、実機の導入/削除・投稿・GAS変更なし。CI生成履歴をmaster/devへff取込み、devへ戻した。
公式URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.20.0 。


2026-11-03 5ch通知本文・標準設定一覧の修正（公式候補）


最終通常Lint/R8 build `build/native-settings-row-navigation-final-build.log` 成功3m30s、MPP SHA256 `3a2bbf4579eaf9b42ad06d69092f8d4ef8916795bd7e5212d7746c57a64a9033`。3版の設定追加フック計5メソッドは元の全命令・register数保持を検査（`build/native-settings-row-hook-verification.json`）。emulator-5580の署名一致隔離3packageで通知各17・native内容保持191/226各6、242は8・UI設定191/226各12、242は18項目成功。242背景Jobの本文通知と次回予約成功、テスト登録/通知/間隔を復元、実APK SHA一致、新規fatalなし。詳細`build/native-settings-release-final-summary.json`、`native-settings-row-result-{191,226,242}.json`、`thread-watch-content-background-result.json`、導入台帳。公開は既存Semantic Release CIで行う。
実機d5497008で実5ch DATの旧先頭判定による誤除外を確認、純粋パーサー修正後に109件中最終本文180文字を取得。本文/IDはログに出さない。native設定入口をセーフモード直前へ移し説明文削除、242で戻るとSafe modeへ遷移する初期候補を修正し一覧復帰/標準Safe mode遷移確認。利用者指定で変更外本文/画像/GIF/動画の広い再検証省略。通常アプリ/投稿/共有NG/GAS変更なし。


最終242: 通知17/設定UI18/内容保持8/S2M画面3回起動成功、最終実APK hash一致。Fridaの通信hook背景試験はART native SIGSEGVで中断し成功扱いせず、フック無しの実通信へ検証を変更。実5ch Jobで前回件数0のfixtureから117件取得→本文付き通知→次回予約成功、新規fatalなし。テスト登録と通知を除去、確認間隔初期15分へ。実際の新着117投稿を観測した試験ではない。build/notification-real5ch-uninstrumented-result.json、s2m242-final-runtime.json。Frida試験の追加コマンドは自動承認レビューでblocked by policy（具体理由なし）となり未実行、代わりにフック無し試験を完了。Pixel 10a/Android17実機未検証。


2026-11-03 1.20.2公式公開・配布検証
実装60a18db、最初のmaster統合df69825。公開直前に利用者指定でPixel 10a/Android17未検証の一文を公開説明から削除。CI41585563555をGitHub Release作成前にcancelled（prepare段階で1.20.1のtag/生成commit a8b6a14は作られたがReleaseは未作成）。手動タグ削除・Release/assets作成なし。説明変更1e2bfd6とCI生成履歴を統合dd2de5aし既存CIを再実行、正式1.20.2を公開。Release CI41585872880/Build CI41585872879がsuccess、生成commit45a2f13。旧Build CI41585563461もsuccess。
公開MPP SHA256 `a676f8f38b33b22171386265361ecbf2202a97d512966b25b470b2e8737864e0`、GitHub digest一致・CRC正常。公開DEXでThreadWatchRules.bodiesに先頭startsWith除外が無くDAT項目区切りを解析すること、S2Mの値0パッチ/新native入口同梱を検査。stable/pre両feed SHA256 `ab4b3cd422f0f5497d7498fdbde519033e17981855789918a039c6ae3905ba40`。master/dev/mainのrefs/heads URLの両feed計6件が1.20.2・同MPP・最新説明で一致、GitHub main/master feed blobも一致。短縮raw URLは5件が1.20.2、main/patches-bundle.jsonだけCDN HITで1.20.0残存を観測（JSON本体は変更しない）。README master blobと検証済みsource一致、latest=true/draft=false/prerelease=false。公開Release本文に削除指示の一文が無いことを確認。build/official1202-public/verification.jsonとrelease.json、official1202-release-ci.log/build-ci.log。
CI生成履歴をmaster/devへff取込、devへ戻した。検証AVDはデータ保持で停止、通常アプリ/実投稿/GAS変更なし。
公式URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.20.2 。


2026-11-03 versionCode最大化の初期値/入力上限をInt.MAX_VALUEへ（未公開）
利用者の既存2147483647に対し生成APK512で上書き拒否の画像を受領。Change ChMate package nameの初期値と入力上限を2100000000→2147483647へ変更。null指定の元コード維持・利用者の明示オプションを保持。パッチ無効時に元APK512が残る点と、元packageを維持する設定方法/保存済みMorphe値の変更をREADME/FAQへ明記。通常Lint/R8 build/version-code-intmax-build.log成功3m52s、242へ初期値未指定で適用成功、aaptで2147483647・表示versionName維持確認、署名検証成功。nativeコード/拡張処理の変更なし、共通resourceオプションのため191/226の重複APK生成と端末導入は未実施。build/version-code-intmax-verification.json、導入台帳へ生成情報記録。公式Release/feed変更なし。


2026-11-03 191の連続復元後の設定残存を修正（未公開）
提供ZIP2件CRC正常、191/異なるZIP順次復元/再起動後も遅い/特にスレ開き。最後にどちらか不明。認証等を除外し通信OFFの専用restoreperf191で、Bの追加設定がA復元後もONで残ることを再現。通常復元のHaiagaru UI設定だけ、snapshotにない安全キーを初期値へ。初回案内・除外秘密キー・標準設定・ローカル自動バックアップ・不足分同期の既存保持を維持。通常build2m55s成功、合成48項目、提供ZIP全体A→A→B→B→AでUI47/66復帰/207 DAT関連/160履歴で増殖なし。cached本文可視6レス、待機2.453/2.218/2.079秒で大幅遅延自体は未再現。初期PCメモリ不足・System UI ANR中の画面試験は成功扱いせず再確認。MPP478e0d383753745aff2593c4f53043c822348c1a427e4753e7af7aebc14ef2cb。実APKhash一致/対象PID fatalなし。docs/restore-repeat-settings-20261103.mdと台帳。公式公開/feed/GAS/利用者実機は変更なし。


2026-11-03 通知・保存設定の移行、公開メタデータ整理（未公開）
通知登録/間隔/確認済み件数を設定バックアップへ追加、通常復元/旧ZIP保持/双方向同期/Job再予約に対応。ローカル保存選択、自動バックアップON/保存先候補も保存、SAF権限待ちは書込停止・UI説明・再選択初期URI。191/242各通知40・設定23、242本文17とUI確認成功。通常build3m3s、MPPa740c9107937c79e7e916620a4c8154a66d86f113999510c22e192e0c62538d1。VPN JNIの作業パス・module置換メタデータを除去して再ビルド、Goテスト/API17class同一/ELF16KiB/JNI起動成功、公開文書20件を一般化しローカル指示は公開対象外。過去履歴/既存Releaseは改変しない。docs/portable-backup-settings-20261103.md、public-build-metadata-20261103.md、導入台帳。NG登録済み操作の新要望は調査を別途継続。公式Release/feed変更なし。

2026-11-04 実機スレ表示遅延の調査継続（未公開）
730eae72/XIG05/191の起動前FridaはART SIGSEGVで中断、停止後に通常起動へ復帰。標準method profilerはnot profileable、2回のatraceは上書きがあり速度値の根拠にしない。GC/major faultを観測したが主因未特定。利用者指定によりplainTextCacheEntries/Characters各999999999を維持。共有NGの正常regex非一致まで再判定される箇所を修正し、実timeoutのみ再試行。host3020/index10306/regex17/exclusion263成功、低メモリbuild56秒成功。詳細docs/thread-open-live-profiling-20261104.md。実機速度改善・ANR解消は未確認、公開なし。

上記regex再利用候補を22:40:29 JSTに実機の同一署名packageへinstall-r更新成功。実APK SHA一致、native hook検査PASS、起動ok、新PID crash buffer空。利用者から「かなり早くなりました」と改善報告あり。設定維持、定量速度/初回と再表示の内訳/226・242実速度は未測定。APK/MPP/certはandroid-installations.mdに記録。公開なし。


2026-11-05 通常プレリリース公開候補
共有NG初回の必要文字列guard/HTML準備省略と正常regex非一致の再利用、レポーター単位の現在・将来の報告除外/解除/設定backup、報告数初期1（保存済み維持）、けんも板18コマンド、191最小構成の接続再利用抑止/高速IPfallback/進捗集約ON。ユーザー向け公開説明に識別子生成方式の変更は記載しない指示を維持。最終通常Lint/R8 build/shared-ng-minimal-191-final-build.log成功3m52s、MPP f4e8a11834fed916e604b5865ef4e3c6cf9961114fa0702c61176db1fee86136。host判定371723/再利用3024/index10306/regex17/条件除外263/レポーター20/けんも候補成功、server473成功。GAS v15の新旧capability互換GET成功。前候補の3版NG native hook検査と226実機12操作確認成功。Frida計測クラッシュは隔離して成功扱いせず標準Instrumentationへ切替。エミュレータはAPI36をデータ保持で起動後、PCメモリのため停止。利用者がエミュレータ設定変更の検証省略と先行配布を明示したため、最終191/226/242の起動/本文/画像・設定UIの再検証を省略し公開説明に確認範囲を記す。重大な通常操作の新規クラッシュは確認されていない。したらばのDNS一時エラーは利用者が解消を報告、追加修正なし。Semantic Releaseのdev pushで通常プレリリースを作成する。タグ/配布物の手動作成なし。


2026-11-05 保存用スレの二重切替を廃止（プレリリース候補）
保存用スレ選択ダイアログの「レス保存機能：オン／オフ」とその書込処理を削除。ResponseMenuSettings.visibleと保存確認・確定処理で旧responseArchiveEnabledを参照しないようにし、既存のOFF値が残る端末でもツールバーの各トグルに従う。既存の保存データ・設定値は削除せず、3版共通Javaのみ変更しnative hookは変更なし。通常一覧と保存先選択の作成/管理/次100件のindex分岐を静的確認。利用者が実機確認不要を明示したため今回の端末操作確認は省略。ビルドと公開配布物の検証後に公開結果を追記する。

通常Lint/R8 build/response-archive-toolbar-final-build.log成功2m50s。MPP 83bb4c5b12bd341f9b16fe46abe370d8eab74cbc0764bcb4d8a591b5adef9388。ZIP CRC正常、配布DEXから旧ダイアログラベル消失・保存用スレ処理同梱を確認。引数のPowerShell解釈による初回build失敗は引用を修正後に再実行して成功。git diff --check成功。

2026-11-05 通常プレリリース1.23.0-dev.14公開完了
Semantic Release CI41857102039 success。実装5e2787e1、統合7fec8f15、生成043e78b9。中断された前CIのdev.13生成履歴をmerge保持し、タグ/Releaseの手動作成なし。公開MPP SHA256 5452b3be1eeefa6363f1d26dbd6a174d99127c148af1e1fca9f354b20d24baf3、GitHub digest一致・CRC正常・旧レス保存機能ラベル不在・新規共有NG関連クラス同梱・dev両feedのversion/asset一致。prerelease=true/draft=false/通常タイトル、公開説明に識別子生成方式の記載なし。URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.0-dev.14 。

けんも板の通知追加要望を調査。既存の汎用test/read.cgi対象判定・スレタイボタン・subject/DAT取得がkenmo.orgにも適用され追加実装不要。指定1793798226でlive GETのsubject/DAT各200・Shift_JIS、既存parserで237件/タイトル/直近3件を読み取り成功（新着実通知の端末試験ではない）。Dalvik/Java/Monazilla各UAも200。Python標準UAは403のため対応UAへ変更。指定URL正規化・fromParts・subject/DAT/板root除外を回帰テストへ追加しThreadWatchRules66成功。利用者指定により端末操作確認省略。


2026-11-05 242サムネイルの開始callback消去を修正（プレリリース候補）
詳細thumbnail-third-loading242-20261105.md。既存2guard後のAsyncTask onPreExecuteから3回目のbitmap消去が残存。固定クラスの1invokeのみguardへ変更、register/元完了命令保持検査成功。Lint/R8 build3分成功。emulator-5580で修正前消去1項目、修正後106項目成功。元動画と同じ自然連続点滅/最終目視/実機は未確認。System UI ANRと試験側の初期失敗、追加画面操作の自動承認拒否（具体理由なし）を詳細へ記録。MPP 4aa26499fb00f76e6ea9928ea8127e6dc9a250f08c496e2c5bab238f0cd9eb2f、APK b0519ab3c229d587f9fe409c6422ad443eea2fabf3ec29befaaa77726b1d4a36。

2026-11-05 公開処理待機
修正commit0f6e2140をorigin/devへpush済み。Semantic Release CI41864064857はqueued、GitHub公式statusでActions degraded_performance / Incident with Actions and Pages investigatingを確認。公開成功/版番号は未確定。ジョブ開始後はCIが公開を実施するため、手動タグ/Release/assets作成なしで継続可能。次回は同runの結果を確認し、成功後に実Release assetのdigest/CRC/3番目のcallback保護同梱/feedを検証する。今回ローカルの重大な未解決クラッシュはなく、エミュレータのSystem UI ANRと広い画面試験未確認は前記の通り。AVDはデータ保持で停止済み。

2026-11-05 通常プレリリース1.23.0-dev.15公開確認
上記queued表示は実際の処理状況と不一致。git fetchで生成commit c3bfda0f/tag1.23.0-dev.15、GitHub Releaseと配布assetの作成を確認。APIはなおqueuedを返すためCI successと断言せず、公開実体を検証。公開MPP SHA256 d2df76115f763ddb99c7b3c86ac317a3e22b69317da5af5d3627aeb36cb619ab、GitHub digest一致・CRC正常・3番目callback用検査文字列同梱・dev両feedのversion/URL一致。prerelease=true/draft=false/通常タイトル。URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.0-dev.15 。前記の実機/自然発生/最終目視の未確認は維持。


2026-11-05 正式版候補: 全版サムネイル保持・アーカイブ選択復元・Shizuku復元
利用者が242/dev.15で解消を報告。191/226でも自動再取得と通常同URLbindの先行消去を特定し固定クラスへ限定guard/bridgeを追加、各39メソッドの元命令/レジスター保持・242の3guard/完了callback検査成功。標準Instrumentationで191/226各110・242106項目成功。詳細thumbnail-all-versions-20261105.md。
ローカルbackup/アーカイブ設定へフォルダ/ZIP取り込み追加。DAT/IDXと構造を保持し対象個別/全選択、確認して同名ファイルを上書き。全読込/CRC検査後に反映しIOException時は旧内容をrollback。元/未選択を保持。末尾ZIP階層/コロン付きタイトルの処理はhost36項目で確認。
任意Shizukuパッチを旧版から復元・minSDK24/API13以上。移行元package選択、共有files/2chMateのroot項目を個別/全選択、AtomicFile上書き。読み取り専用source・canonical境界検査、targetのUID修復も現在アプリ領域に限定。通常構成には含めない。
API36/emulator-5580、226でShizuku選択APKの起動・合成SAFとZIPの復元8・合成AIDLサービスの選択上書き9項目成功。実Shizuku認証/別アプリ実データ全移行は未確認。191の最初の未初期化theme、226のabstract theme生成失敗は試験側修正後に再成功。過去bootanimation PID570のnative abortをcrash bufferで観測したが、今回ChMateの新規fatalはなし。AVDはデータ保持で停止、実機操作/実ユーザーデータ移行なし。
利用者がクラッシュ等の最低限確認後の公開を明示したため広い再試験を省略。最終2つの純粋ZIPパス処理と、破棄Activityへの完了Dialog抑止は36host項目/ソース/最終MPP文字列で追加検証し、APK3版の重複再生成を省略。公開説明には実Shizuku未確認を明記。
最終通常Lint/R8 build/official-migration-release-build.log成功2m57s、91tasks。MPP 21910c46ebd2953347d472b3bc72c2bd9a1fd515098984bc725c3684d772ee5a、CRC/新機能/任意Shizuku/完了guard同梱確認。端末試験MPP 38c864bb5955a1b9569a6c70671feddc7e471a3276bae81506bcab52b00691f8 と区別。既存Semantic Releaseでdev→master正式公開へ進む。

2026-11-05 1.23.0正式公開・配布検証完了
実装a91d8816、master統合6cb72386、Semantic Release CI41941761473 success、生成ef83352c・tag1.23.0。手動tag/Release/assets操作なし。公開MPP SHA256 f5cfd046acb7bf11b6b3a6652f13802313f965124cb1a014549c024b1c76a5e4、GitHub digest一致・CRC正常。新アーカイブ移行3class、任意Shizuku/API setter/完了guard、191/226/242サムネイルフック同梱を検査。draft=false/prerelease=false/latest1.23.0、通常title。bodyに利用者指示の識別子生成方式の記載なし。
既存backmergeでmaster→dev/mainを確認。GitHub contents APIで3branch×両feed計6件が正式1.23.0と同MPP URLを参照。build/official1230-public/release.json・verification.json・feeds.json。CI生成履歴をff取込、devへ復帰。実機インストールなし、AVDはデータ保持停止。
正式URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.0 。

2026-11-05 検索Backとサムネイル再生マークを修正（未公開）
191/242の検索入力用Back callback更新を、スレ画面overrideから親へdelegateする1命令を追加。226はprivate updaterのため変更なし。3版の通常bindで保持bitmapのnative GIFマークを消さず、URL変更時は旧GIFマークを消去して別画像へ持ち越さない。動画用nativeマーク・元完了/手動再取得は保持。Lint/R8 build3m37s成功、3版適用/元命令・register保持検査成功。API36/emulator-5580の標準Instrumentationで旧版の欠落を確認後、191123/226121/242121項目成功、crash buffer空。実スレ起動コマンドは自動承認レビューで拒否（詳細理由なし）、合成試験へ限定し実機・キーボード連続操作の目視未確認。詳細search-back-playback-overlay-20261105.md、導入台帳。MPP2a508401850fb4f5ea5c06359637a53cc5c668cc9fe1fbe4986d7217ba1443af。Release/feed変更なし。AVDはデータ保持停止。

2026-11-05 外部板の認証メニューを初期ON（未公開）
showExternalBoardAuthMenuの未設定時既定値を、投稿設定のSwitchとpreparePostingMenuの両方でtrueへ変更。他のメニュー設定の初期値と保存済みON/OFFは保持。:extensions:chmate:compileReleaseJavaWithJavac成功55秒、git diff --check成功。既存共通Javaの既定値のみ変更しnative hook/端末データ変更なし。MPP再生成・端末導入・公開なし。なお先の検索/再生マークの利用者報告は発生版不明・実症状未確認との補足あり。合成試験で確認した経路と報告症状の因果は未確定として扱う。

2026-11-05 1.23.1公式公開候補
利用者が公式公開を明示。検索Back/サムネイルマーク修正と外部板認証メニュー初期ONを含め、既存.releasercの公開説明を今回の差分・確認範囲へ更新。最終通常Lint/R8 :patches:build/:patches:buildAndroid成功2m36s・91 tasks、MPP CRCと新native helper/設定key同梱検査成功。検索/サムネイルは直前の3版native命令・register保持/標準Instrumentation365項目/新規crash空の確認を使用。最後の初期値2行はJavaコンパイルと今回最終buildで検査し端末再導入は省略。実機・実スレでの連続操作と利用者症状との因果は未確認として公開説明に記載。公式CIでdev→master、手動tag/Release/assets/feed編集なし。

2026-11-05 1.23.1正式公開・検証完了
実装5801a072/1776df81、公開説明f378f146、master統合007e2c0f、Semantic Release CI41965467361 success、生成/tag9637b924/1.23.1。draft=false/prerelease=false/latest1.23.1。公開MPP SHA256 c7ae9f5e948cfed9aa7ccff5702b98bf79dd023a48ae9320ea62ba3a8fe98b5e、GitHub digest一致・CRC正常、検索Back class/再生マークhelpers/認証表示設定同梱と今回公開説明を確認。master/dev/main各両feed計6件が1.23.1と正しいMPP URLを参照。既存CIのbackmergeをff取込しdevへ復帰。詳細build/official1231-public/{release.json,verification.json,feeds.json}。実機導入なし。ユーザー報告の発生版/症状と修正原因の同一性、実機・実スレ連続操作未確認は公開説明に記載済み。URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.1 。

2026-11-05 NG追加ダイアログ廃止・UA選択表示・開いているタブ一括更新（未公開）
登録済みNGの自動表示onResumeフックと追加操作ダイアログを削除し、標準NG編集を直接使用。ワッチョイ追加の操作ボタンも削除し重複時は入力欄へ案内、条件自体は変更/削除なし。UAは選択名・ON/OFF・全文と選択中ラジオ表示、カスタムを識別。LiveSettings保存/設定profile登録を維持。
タブレット両paneのnative pagesを選択変更なしでsnapshot、スレDATと板subjectを分けた一回限りのnative WorkManager request。登録対象/favoritesを変更せず休止page/履歴なしの合成候補にも対応、同一板スレ重複除去・Dataサイズ検査・3秒抑制。ツールバー/Gesture設定/カスタムアイコン候補を追加。通常巡回は元命令/registerを保持、board-onlyは画像巡回ONでもDAT禁止、subjectが追加した別スレのDATも除外。固定版別クラス/APIを使用し全クラス走査なし。docs/open-tabs-refresh.md。
最終Lint/R8 build/open-tabs-ua-ng-parsefix-build.log成功3m13s・91 tasks、3版原本適用成功。VerifyOpenTabsHooks全版成功、NativeUserAgentIdentityTest19成功。API36/emulator-5580の隔離reporter各packageへ同署名更新し標準Instrumentation各30、計90成功（open-tabs-core-runtime{191,226,242}.log）、最終crash buffer空。タブsnapshot/重複/subject統合/ネイティブbid/WorkManager Data保持/未履歴row/通常巡回不変/DAT対象限定/UA選択/NG hook除去/toolbar resourceを確認。実通信は発行せず、実際の一括取得・タブレット画面での連続操作・実機は未確認。公開なし。
初回検証でHttpUrl parserをBBSUrlInfoとして使っていた誤りを発見し版別native BBS parserへ修正、最終90項目成功に旧失敗を含めない。追加Tablet UI試験はActivityが終了状態となりguard拒否、再試験中にADB応答停止。エミュレータプロセス停止/データ保持再起動後にcore-only再成功。任意-e tablet true試験を残すが成功扱いしない。試験packageでタブレット設定を一時変更、失敗時復元処理あり（中断された226の復元完了は未確認）。実機設定・実ユーザーデータ変更なし。先の並行build時ホストJVMメモリ不足はemulator停止/順次生成で解消。MPP91ecd109f05e40c6029953dad0246fae123fd2d52fb2b59ae2e776ef2bf8ce9b、CRC/新helper同梱/旧NG dialog class・label消失確認。導入台帳参照。


2026-11-05 1.24.0公式公開候補・追加タブレット検証完了
追加試験のActivity終了はテストpackageの初回StartActivity未完了が原因。初期設定を完了し、試験側の同期Activity待機を非同期起動/現在Activity取得へ修正。製品コード変更なし。API36/emulator-5580で191/226/242各33（core30+live tablet3）計99項目成功、実通信0。build/official1240-tablet191-final.log、official1240-tablet226-final.log、official1240-tablet242-async.log。最終official1240-final-crash.log空。AVDはデータ保持で正常停止。前記の失敗を成功件数に含めない。UAホスト19/native hook全版検査/最終ビルドは既記録を使用。実通信一括更新・実機連続操作未確認を公開説明に明記。既存Semantic Release CIからdev→masterの公式公開へ進む。


2026-11-05 1.24.0公式公開・配布検証完了
実装7e27850c、公開準備4c03d348、master統合fdc3f506、生成/tag1e6983db/1.24.0。Semantic Release CI42000783380は初回Gradle配布サーバーHTTP504で失敗、同CI再実行success。手動tag/Release/assets作成なし。draft=false/prerelease=false/latest1.24.0。公開MPP SHA256 20b0ad76118fce3b1b52d1aff7bc98e7cf5c170babbafd71d139a5a3298152fd、GitHub digest一致、CRC正常、新OpenTabsRefresh/UA helper/toolbar resource同梱、旧NG自動popup patchとタイトル不在。master/dev/main各両feed計6件が正式1.24.0と同MPP URLを参照。build/official1240-public/{release.json,verification.json,feeds.json}。最初の配信検査は端末文字コードcp932への説明全文printで停止したため、不要なprintを除き全検査を再実行して成功。既存backmergeをff取得しdevへ復帰、実機インストールなし。公開説明に実通信一括取得/実機連続操作の未確認範囲を記載済み。
URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.24.0 。


2026-11-05 確認間隔Cancelの親画面保持・開タブ一括更新のUI反映（公式公開候補）
ThreadWatchの確認間隔ボタンを非終了操作へ変更し親Dialogを維持。Cancel/Backで元画面へ戻り未保存チェック/期限を保持、間隔保存後は個別監視の間隔説明を更新。OpenTabsRefreshは作成済み/attach済みFragmentへ各版固定の標準action5を直接dispatchしUI更新、成功分をWorkManager対象から除外。直接dispatch中のRefreshTargets.refreshを抑制して追加巡回を防止。未作成/未接続/未受付ページは従来のscope取得へfallback、背景スレのみsubject統合。native method自体は変更せず新bridgeのreceiver/action/sourceとregister4を検査、全クラス走査なし。
最終Lint/R8 build/interval-live-tabs-final-build.log成功2m43s・91tasks。3版適用成功、VerifyLiveTabsHooks/VerifyOpenTabsHooks各全版成功。API36/emulator-5580でcore各33計99成功（interval-live-tabs{191,226,242}-runtime.log）。242実UIは自動監視/個別通知→確認間隔→Cancelの親復帰・未保存チェック維持・保存値不変の6項目成功（interval-navigation242-runtime-retry.log）。初回UI試験はエミュレータSystem UI ANRダイアログが遮り失敗、Wait後の再試験成功で区別。final-crash.log空。実通信一括取得と実機連続操作は未確認として公開説明に記載。AVDデータ保持正常停止、実機導入なし。
MPP ba7d5e58004cb6f225d3bd674e2734dceb6665c320ee2ccb65d5ccd55055d55e、CRC正常。既存Semantic Releaseから公式公開する。


2026-11-05 1.24.1公式公開・配布検証完了
実装c051d156、master統合5990f810、生成/tagcb9de0fd/1.24.1。CI42019751152は全体status cancelledだがRelease/Attest/Post各step success、公開実体でdraft=false/prerelease=falseを確認。全体successとは表現しない。MPP SHA256 1d264114e626c419f1de5a6e8c06d37b8953daa4ef7d92a630f03efe8ec7476d、GitHub digest一致・CRC正常・nativeRefresh/keepParentForInterval同梱。master/dev/main×両feed6件が1.24.1と同assetを参照。build/official1241-public/{release.json,verification.json,feeds.json}。既存CI生成履歴をff取込しdevへ復帰。fetch設定がdevのみのためmaster/mainも明示refspecで更新。URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.24.1 。


2026-11-06 外部板・設定リンク・動画サムネイル修正版プレリリース候補
191のBBSMENUへのscript混入を入力限定sanitize/単一板補正で修正。3版の外部板サイト別表示は初期OFF、表示モデルだけを補正し板ID/履歴/ログを保持。226の板名メニューに標準検索項目を追加しnative prepare-menu/dispatchを保持。日本語の設定リンクはタップ後に確認し実control経由で適用、候補一覧のPopularReplies移行書込みを起動側へ移し、ヘッダーの>>を含む名前にも対応。日本語一覧はdocs/settings-links-list.md/CSV。
動画サムネイルは容量超過X MP4の範囲取得、失敗理由PNG、再取得/再生の独立ボタンを追加。解析専用プロセスのメモリkillをexit-infoで識別、一時停止の1分待機/明示再試行、BIND_IMPORTANTを使用。原動画のnative再生経路を維持。3版の全レス連続表示は元Viewを保持（191実機NPEの原因を除去）、元Viewなしでは拡張しない。191は単純Viewのため操作をrootへ重ね、detach中の親children変更をHandlerへ延期。毎フレームのbringToFrontを除去し複数失敗画像の再描画ループを防止。0byte error PNGを再生成しatomicに保存。
最終通常Lint/R8 retry-detach-final-build.log成功3m44s/91tasks。3版適用/VerifyBbsMenuHooks/VerifyMediaSelectionHooks全成功。エミュレータ245項目成功、crash空、詳細は導入台帳。合成48MiB超MP4は266158bytes/2rangesでAndroidフレーム/JPEG生成、停止フラグの待機後復帰も確認。ホストBBS30、設定リンク64、範囲取得8206、失敗分類49、同時再取得抑制1142。途中失敗は上記修正後に再成功。
実スレ本文の追加スモーク起動は自動承認レビューに拒否されたため未実施。実機LOW_MEMORY/NPEはログで特定、報告実動画の表示改善は未確認。Mi Note 10は3版install-r成功・RUNNING_LOCKEDでUI未確認。ユーザーは睡眠中の追加確認なしのプレ公開を明示。最終確認範囲/未確認を既存.releasercに記載し、既存Semantic Releaseのdevからプレ公開する。手動tag/Release/assets/feed変更なし。

2026-11-06 1.25.0-dev.1プレリリース公開・配布検証完了
実装a2bcc531、生成8ee8f22c/tag1.25.0-dev.1。初回CI42061425404はGitHubのcommit_refs_rulesエラーでtag push失敗、同run再実行はremoteより古いSHAのため公開をスキップ。最新devで既存release.ymlをworkflow_dispatchしたCI42062417480がRelease/Attest含めsuccess。手動tag/Release/assets/feed編集なし。draft=false/prerelease=true、6assets公開確認。
公開MPP SHA256 69472f25fea804847dc58c3902dc858ab3ae36bef2d101bfcf5a71e73a2a7bde、GitHub digest一致・ZIP CRC正常。VideoThumbnailRetry/VideoThumbnailFailure/BoundedVideoDataSource/SettingLinkActivity/ExternalBoardGroups同梱を検査。dev両feedと添付両feedが1.25.0-dev.1/同MPP URLを参照し、master両feedは正式1.24.1を維持。build/prerelease1250dev1-public/{release.json,verification.json,feeds.json}。照合時のPython証明書ストアエラーはTLS検証を無効にせずghの取得へ変更し、全検査を再実行して成功。生成履歴はff取込済み。
端末検証245項目と未確認範囲は前記の通り。Mi Note 10へ最終候補3版導入済み、XIG05切断後の最終候補導入は未実施。報告実動画での改善・実機連続操作・実スレ追加スモーク未確認は公開説明に記載済み。
URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.1

2026-11-06 旧版共有NGの送信受付停止（本番未反映）
Code.gsのPOST入口にdeviceKey必須gate追加。v1/v2の未対応送信は更新エラー、ACK/lock/シート操作なし。現行送信とGET受信は維持、REQUIRE_DEVICE_KEY=falseのみ管理用rollback。詳細shared-ng-review-implementation.md。lifecycle116/personal148/service41/moderation53=358項目成功。ブラウザー操作が無効とのtool応答によりGAS保存/再配備は未実施、アプリ変更・公開なし。個別レポーター除外も本番未保存。サーバー変更はローカル参照領域のため新アプリReleaseへ混ぜない。

2026-11-06 利用者によるGAS v16デプロイ後の公開応答検証
先の本番未反映状態は解消。既存URLへ空reportsの旧v1/v2(deviceKeyなし)を送信し、両方client_update_required/ok=false/ACKなしを確認。GET受信ok/full/revision255/3090条件、NG_IDヘッダーエラー再現なし。現行有効報告の本番書込み試験は行わず、ローカル358項目と区別。詳細shared-ng-review-implementation.mdとbuild/shared-ng-v16-live-verification.json。個別レポーターBANは別件で未保存。

2026-11-06 動画失敗多数時のクラッシュ・226検索追加候補
共通VideoThumbnailRetry.closeのroot.removeView即時実行を全経路でMAIN延期し、closed/tag検査・poll取消・後片付け一回化。API36の実FrameLayoutで旧コードの同じnull-child例外を再現3項目、新コード128件×8回等34項目成功。詳細video-error-layout-crash-20261106.md。226の板/HOME/ResListの固定3classにSearch追加、標準のprepare-menu（下部toolbar項目の可視性反映）/dispatchを保持。全クラス走査なし。通常Lint/R8 build4m29s/91tasks成功。VerifyTitleSearchHooksで元inflater/register保持、既存候補から他メソッド・native prepare/dispatch変更なし確認。MPP af48610699b3a9e8bfab374f29c33210ed0789b5ac909835455bc2ef000fdec2、公開なし。226端末メニュー検証準備中。
爆サイ/ふたば/あにまん標準画面の閲覧+書込要望はnative-sites-investigation.mdへ仕様調査を記録。参考repoのREADME/ファイル一覧だけ確認しソース未読・未複製。あにまんトップ/指定7591383ともHTTP403、ブラウザーtool無効で本文/投稿form未確認。3サイトの実装・製品対応は未完了、対応済みと報告しない。今回公開投稿なし。

2026-11-06 226最終実行検証完了・候補未公開
上記候補をemulator-5580の既存reporter226へ署名一致でinstall-r成功、データ消去なし。初回のAPK読出しが59%で切断しhelperが安全停止、再接続後に全APK読出し/証明書照合/更新成功。署名0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
実際の3画面menu inflater/検索native label/icon/重複防止13項目と、native prepare-menuに隔離したtoolbarモデルを渡して下部Search OFF→ON→OFFで上部visible→hidden→visibleの3項目、合計16成功（layout-search226-native-final-runtime.log）。追加試験は最初resumed Activity待ち不足で失敗したため試験側待機を追加し再成功、製品変更なし。実native thumbnailの失敗PNG/再取得/原URL再生/通常画像への回復/detach12項目成功（layout-search226-video-runtime.log）。共通layout34項目と合わせ62成功、final-crash.log空。実機/利用者の実スレでの最終目視と新外部サイト対応は未実施。
ビルドMPPとAPKのCRC/新code markers同梱確認。build/layout-search226-verification.json。AVDは一時size/densityをreset後データ保持正常停止。今回ユーザー向けRelease/CI pushはしていない。

2026-11-06 あにまんの利用者提供HTMLを解析
保存スレcanonical7589284の79レス/34画像、トップ一覧360スレを解析。サイト公開JSから返信のpreCheck→comment.phpとupload別段階の仕様を確認し転載/実行/投稿なし。独自AnimanchProtocol（HTML→中間データ/一覧/返信データ生成/成功応答照合）追加、jsoup1.21.2 MIT依存・全文license/NOTICE追加。host224項目成功。まだnative board/DAT/画像/投稿transportへの接続はなく、あにまんを含む3サイト対応は未完成。既存クラッシュ/226検証済み候補af486...にはこの新クラス/依存は未収録。新しいMPP/端末導入/公開なし。詳細native-sites-investigation.md。

## 2026-11-07 標準の掲示板設定への統合候補（未公開）

利用者指定のChMate標準「設定→掲示板設定」の既存updateBbsMenuを含むXMLへ追加掲示板の入口を追加。SiteBoardSettingsActivityに初期OFFの「使用する」、URL登録、標準画面を開く、サイト別認証、ふたば削除キーを実装。認証Cookieの利用は本人の選択後のみ。参照repoの実装ソースは未読・未利用。

SiteBoardProtocol/SiteNativeData/SitePostProtocol/SiteBoardGatewayを追加。独自のHTML解析からsubject/DATへ変換し、opt-inのアプリ内loopback接続で標準reader/postへ渡す設計。サイト元番号とスレ内番号の変換、投稿前確認、重複送信抑止、結果不明時の再送禁止、OFF時停止を含む。ホスト試験はあにまん224、3サイト解析25、DAT/投稿データ/成功判定136成功。公開掲示板への投稿は0。

最終通常Lint/R8 build/site-boards-standard-latest-build.log成功42秒/91tasks、191/226/242すべてのパッチ適用成功。MPP build/site-boards-standard.mpp SHA256 7899cbc41a7cd41219614d23c672fe751f7a6e12853dc58abd35b49150d88dcb。実行試験SiteBoardGatewayInstrumentationはコンパイル成功のみ。エミュレータ起動と試験APK作成の複合操作が自動承認レビューでblocked by policy（詳細理由なし）となり、試験実行・native URL parser/標準画面/トグルの動作確認は未完了。ビルド成功を利用可能の確認と扱わない。

制限: 現時点は既存スレへのテキスト返信のみを実装対象とし、新規スレ・添付画像・爆サイのページ分割は未対応。提供された15地域のBBSMENU取込みとふたばトップからの板選択は未実装。あにまんライブ403、実投稿成功テンプレート、差分/キャッシュ/画像形式/標準投稿の結合も要確認。対応完了・配布済みとはしない。push/Releaseなし。

## 2026-11-07 追加掲示板設定候補の実機導入
利用者が実機インストールを明示。XIG05 / serial 730eae72 / ChMate191 / 表示名 Haiagaru NG確認 191 / package jp.co.airfront.android.a2chMate.haiagaru.reporter191 を既存APKの証明書pull照合後install-r成功。普段使用する別packageの変更・アンインストール・データ消去なし。
APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-standard191.apk / SHA256 26144079c03fcabbb08d8c45ccf5302b31839620dc49a8f52e369108b028677c。
MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-standard.mpp / SHA256 7899cbc41a7cd41219614d23c672fe751f7a6e12853dc58abd35b49150d88dcb。
署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
導入ログ build/site-boards-standard191-device-install.log。HomeActivityへam start受付成功。crash bufferには11/05の旧ログあり、新規クラッシュと混同しない。今回の標準設定スイッチ/サイト本文/投稿の結合動作は未確認。226/242候補APKは生成済みだが今回実機へ未導入。公開なし。

## 2026-11-07 掲示板設定カテゴリ内への移動・実機191更新
利用者指定「設定→掲示板→掲示板設定」の欄内へ追加掲示板を移動。updateBbsMenuを含む標準XMLのルート末尾から、key=bbsのPreferenceCategory直下へ移す。カテゴリが一意でない場合はパッチを失敗させる。初回は非namespace-aware DOMの既存属性取得差で191適用guard失敗し、android:key/namespace両方に対応して修正。既存検証アプリへ失敗APKの導入はなし。
最終通常Lint/R8 build/site-boards-category-final-build.log成功1m18s/91tasks。191完成APKのaapt2 xmltreeでカテゴリ内配置とrename後intentを確認。動作試験scriptにもカテゴリ内配置のassertを追加したがInstrumentation実行は未確認。
実機XIG05 / serial730eae72 / 表示名Haiagaru NG確認191 / ChMate0.8.10.191dev / package jp.co.airfront.android.a2chMate.haiagaru.reporter191 を既存証明書照合後install-r成功、HomeActivity start受付成功。アンインストール/データ消去なし。
APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-category191.apk / SHA256 c643ba4f03379c12d2788df664af90ad7abf580b99cf9d0f43816aa39fc32891。
MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-category.mpp / SHA256 4fbb43afc69a1d2daa6bf5644f68e378d12da530d9274a3838be22b080ce9ae8。
署名key C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。ログbuild/site-boards-category191-install.log。今回配置変更のみで追加サイトの標準画面/投稿の結合未確認・未公開は維持。

226/242も最終APKのパッチ適用とaapt2検査成功。3版でkey=bbsカテゴリ内配置・改名後intentの一致を確認（build/site-boards-category{191,226,242}-board-xml.txt）。226/242実機未導入、191プロセス起動確認。crash bufferは11/05の旧記録で今回新規と扱わない。

## 2026-11-07 掲示板設定カテゴリ内配置の実機クラッシュ（修正中）
利用者報告により前記「カテゴリ内配置」候補に重大な回帰が判明。XIG05/730eae72で11/07 01:03:50および01:05:17、reporter191のClassCastException: androidx.preference.Preference cannot be cast to ...bbs.BbsPreference、Lo/pja.c→Wj_→onCreateを確認。build/site-boards-castfix-before-crash.log。起動のみ・静的XML検査では設定画面の安全性を確認できていなかった。
原本native Lo/pja.c(Preference)を調査すると、key=bbsカテゴリの子を位置で再利用して全件BbsPreferenceへcastし、余剰項目も削除する。したがってgeneric Preferenceをその子に置けない。固定native処理の改変はせず、追加行をbbsカテゴリ直後/BBSMENUカテゴリ直前のroot siblingに移す。視覚上の掲示板設定の並びを維持し、型付き子リストには混ぜない。Instrumentation側の構造検査も誤ったカテゴリ内assertから、安全なsibling配置へ修正。
通常Lint/R8 build/site-boards-castfix-build.log成功1m22s/91tasks。3版候補再生成・実機設定画面検証を続行。既存候補は公開禁止、push/Releaseなし。

## 2026-11-07 設定クラッシュ修正版の実機反映
3版castfix APK生成とaapt2で安全なroot sibling配置/intentを確認。実機XIG05/730eae72のreporter191を同署名install-r成功。SettingActivity起動後に設定UI階層を取得し、追加設定画面（使用する/登録ボタン）と、標準bbspink.comのURL/板の数/使用するダイアログを観測。設定画面操作に伴う新規ClassCastExceptionなし（crash bufferには修正前01:03/01:05が残存）。追加画面の使用するは利用者設定でONだったため変更していない。操作中に画面変化があり、以降の座標操作はせずread-only確認。build/site-boards-castfix-{settings,board-ui,board-final-ui}.xml、before/after-crash.log。
APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-castfix191.apk / SHA256 7ba7c5cf132b37e08ea22f101064cdf7db2a43f4ffb52372d0b602940af71499。
MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-castfix.mpp / SHA256 2c8ecc76573f1ea6b4d27a7007e29df3e74c288f35b6a9b1365e1e2a537128c7。
表示名Haiagaru NG確認191 / ChMate0.8.10.191dev / package jp.co.airfront.android.a2chMate.haiagaru.reporter191 / key C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。導入時刻はbuild/site-boards-castfix191-install.logのmtime。データ消去/アンインストールなし。226/242は未導入。

## 2026-11-07 板ごとの設定・指定BBSMENU・ページ分割・投稿拡張候補
利用者はサイト単位ではなく登録した個々の板のURL/板の数/使用するを指定。SiteBoardSettingsActivityの各登録行から個別Dialogを開き、URL/板の数1/使用する/開く/認証を表示。新規登録はOFF、既存登録の使用状態保持。個別ON/OFFはGatewayのsubject/DAT/画像/投稿すべてで検査し、最後の板OFFでlistener停止。OFF時は待機画像/確認も破棄。host16項目成功。
利用者指定の爆サイ15地域JSONは全てHTTP200、対応する個別板延べ7946件。ふたば https://www.2chan.net/bbsmenu.html はHTTP200/Shift_JIS、98板。あにまん指定 https://bbs-menu.pages.dev/animanch_bbsmenu/bbsmenu.json はHTTP200/31カテゴリ。SiteBoardMenuProtocolと「板一覧から追加」の検索/選択UIを実装。あにまんカテゴリ別URLとスレURLを分離。HTMLトップ取得403でもメニューJSONを利用できる。
BakusaiPaginationは同じ板・スレのページリンクのみ収集し、最新50レスから過去ページを結合。レス番号連続・重複内容一致・全体件数を検証後にDAT出力。破損/途中欠落では保存用DATを返さない。実取得の13548303は4ページ/181レス+OP=182件の統合成功。メニュー/分割host1290項目成功（site-menu-pagination-tests.log）。保存データはbuild配下のみ、投稿全文をGitへ含めない。
投稿拡張: 標準スレ作成のsubjectと本文を各サイトの現行フォームへ変換。ふたばはtextonly/form上限サイズ、あにまんはカテゴリと必須画像/preCheck→本文→upload、爆サイはthr_tc1の後の確認フォームを内容一致時だけ一回限りtokenへ保持し標準確認応答で利用者確認を要求。確認/成功テンプレートの実投稿検証は未実施。画像は標準composerの固定既存ThreadCommands bindingで追加ボタンを挿入し、SAFでJPEG/PNG/GIF(最大8MiB・板の上限優先)を選択、元の板・スレ/新規へ10分間だけメモリ保持。選択だけでは送信せずnative送信時に添付する。実装元の表現・構造の流用なし。
新規スレ/画像/確認33、既存DAT/投稿136、あにまん224、既存3サイト解析25のhost試験成功。実機191(個別設定候補)でnative URL parser/subject/DAT/隔離投稿/重複抑止等144項目成功、公開POST0（site-gateway191-runtime.log）。個別Dialog試験は初回startActivitySync待ちで停止し試験packageのみforce-stop、次はbackground起動制限で時間切れ。前面Homeからの有界起動へ試験を修正し、実機14項目成功（site-boards-individual191-ui-foreground-runtime.log）。初回失敗を製品クラッシュや成功項目に含めない。実サイトへの公開投稿は行っていない。

## 2026-11-07 指定メニュー・投稿拡張の最終候補を実機191へ導入
利用者の再度の実機インストール指示で、XIG05/730eae72の既存「Haiagaru NG確認191」(ChMate0.8.10.191dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191)を同署名install-r成功。データ消去/アンインストールなし。
APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-menu-post191.apk / SHA256 1c2226af2377fb55b94471a0dd1f4c40a7e6938c9b71ea7926636b67f444b199。
MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-menu-post.mpp / SHA256 eff9e9de1d990808556795dd5b98e8aaab29c11171417da1077399882a163886。
鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。導入日時はbuild/site-boards-menu-post191-install.logのmtime。
通常Lint/R8最終 build/site-boards-menu-post-save-state-build.log成功4m12s/91tasks。画像選択Activityの回転時状態保持を含む。更新後実機で隔離Gateway/標準URL parser/subject/DAT/返信/重複抑止144項目と個別Dialog14項目成功。公開投稿0、実掲示板への送信は未検証。background activity start制限に対し、試験の起動のみ前面Home経由へ変更（OS設定の変更なし）。試験後Homeを通常起動。
試験APK build/site-boards-inst/tests191.apk(app.haiagaru.tests.sitegateway191) / build/site-dialog-inst/tests.apk(app.haiagaru.tests.sitedialog191) は同Morphe署名、隔離prefs使用。前段個別設定候補はAPK build/site-boards-individual191.apk SHA256 a484cd2df3b810dd66ef42c3d2f7976a8d183814a183c9b1ea67134884d164e8 / MPP build/site-boards-individual.mpp SHA256 261648c6ae6d9ff3d7dd29f885a5c7ed430ddb57cee89affbcc9063478d2d551、同端末/packageで今回更新済み。
実際の新規スレ/画像/爆サイ確認画面のサイト成功応答、3版の標準スレ画面での連続操作は未確認。試験対応として未公開、push/Releaseなし。

## 2026-11-07 標準サイト3項目・BBSMENUカテゴリ取込み候補

最新の利用者指定に従い、個別板ごとのnative descriptor方式を、爆サイ・ふたば・あにまんの3つのnative descriptorへ変更。標準BbsPreference/標準ダイアログ/標準BBSMENU取込み/標準板グループを利用する。generic Preferenceはkey=bbsの型付き子リストへ入れず、その直後の認証・手動登録補助入口のみを維持する。3サイトとも初期OFF。

BBSMENUはアプリ内loopbackで標準HTMLへ変換。爆サイは15地域を最大4並列で取得し地域／カテゴリ、ふたばとあにまんはカテゴリのB見出しを保持。通常reader/postへはsubject/DAT/bbs.cgiを渡し、WebViewによるスレ閲覧にはしない。サイトの認証が必要なときのみ別の認証入口を利用する。

新版aliasはサイト種別付きhb/hf/ha+32hex、旧h+32hexも受理。ネイティブ「使用する」とsite単位のgateway停止を連動。他サイトON中もOFFのサイトは読取・投稿不可。既存手動登録名/aliasを保持し、一部地域取得失敗で保存済み一覧を上書きしない。板取込みは索引を一度作り一括保存し、8千件の個別設定行や設定キーを増殖させない。

最新ソースのhost再検証: SiteBoardCatalogTest 24,345項目（8,075板）、SiteBoardEnableTest 18項目、SiteMenuPaginationTest 1,290項目、SiteNativePostTest 136項目、SiteNewThreadImageTest 33項目成功。試験へのファイル引数を誤った初回実行は失敗し、正しいcanonical380363のふたば保存レスとあにまんのトップ保存フォームへ指定し直して成功。製品パーサーの変更による通過ではない。公開掲示板への投稿は0。最新ビルドと3版native結合検証は続行中。

### エミュレータで判明した結合不具合（修正・再検証中）

利用者がエミュレータを明示指定。Haiagaru_Root_API36 / emulator-5580 をデータ保持で起動。ネイティブ結合検証で、Android SharedPreferencesの背景commit通知がmainへ遅延配信され、register内の旧板flag更新をUI操作と誤認して他サイトをONにする問題を検出。visibleな3つのsite flagだけをactivation eventとして扱うよう変更。旧個別flagは保存データとしてのみ保持する。遅延通知を再現するhost検証を追加し、使用状態21項目、全カタログ24,345項目成功。

native HTML parserは1行ずつlinkを先に判定するため、一行HTMLではB見出しを受け取らない。出力を見出し・各リンクごとの改行へ変更。最初の修正buildは局所変数kind重複によるコンパイル失敗後に訂正し、site-native-roots-final-build.logで通常Lint/R8成功5m11s。

実reader試験は、HomeActivityへACTION_VIEWを渡すだけではスレが開かず、ResListActivityへ直送してもURLがスレ扱いされないことを検出。標準BBSUrlInfoはgetHostでportを落とし、通常スレIDを9〜10桁に限定する。追加サイトの正しい短いID（爆サイ8桁、ふたば6桁、あにまん7桁）をboard扱いしていた。既存URL parserを完全保持するfallback wrapperを固定BBSUrlInfoの版別1メソッドだけへ追加し、当アプリで登録したloopback/保存port/aliasに限定してnative infoを生成する修正を進行中。手動openも標準ThreadListActivity/ResListActivityを使う。3サイトの標準画面が動作済みとはまだ報告しない。

試験失敗はtest assertionであり新規製品crashとして扱わない。エミュレータにはSystem UI ANRと起動時Bluetooth native crashがあり、アプリのcrashとは区別する。公開POST0、push/Releaseなし。

## 2026-11-07 標準reader/editor結合の版差分

191はsite-native-padding191候補で、3サイトの実標準readerの17/4/79レス、標準ResEditActivityと各投稿先に結び付いた画像添付ボタン、padded DAT/返信、重複送信抑止を含む166項目成功（site-native-padding191-ui-runtime.log）。実公開POST0、保存した公開応答/isolated transportを使用。

226はstatic BBSUrlInfo.cだけでは実tablet routingが直接呼ぶKotlin companionに届かない。Uri overloadだけを補正した最初のtablet候補でも、R8がString overloadに複製したgetHost/ID解析が残存し失敗。固定companionのString entryも、元本体を保持した限定wrapperで補正。site-native-final226候補でnative core19、tablet Context+String parser/port保持と実reader/editor/画像添付ボタン/isolated返信の172項目成功。検査のbaselineは原本に加え既存Haiagaru castfix候補を使用し、先行する外部板修正の意図した差分と区別した。

242もcore19/固定フック命令保持は通過したが、native URL producerがunknown-compatible-boardをHTTPSへ昇格し、HTTP loopbackにTLS接続して本文0件となる差分を検出。SiteNativeBoards.rewriteInfoUrlを追加し、ExternalBoardEditor既存URL wrapper経由で、infoのhost/pathとgatewayに登録済みalias/portが一致したloopback HTTPSだけをHTTPへ戻す修正を実装・ビルド中。通常サイト/未登録localhostは変更しない。242を含む全対応完了とはまだしない。

検証プログラムも修正: 226/242のenabledはnativeでinline化されno-arg accessorがないため実key generator/保存prefs/default fieldで検証。BoardID.toStringのportは%3A encodingを復号して比較。ResEdit画面中の標準BBSMENU更新が未登録だったfake transportのAssertionErrorで一度試験processを終了させたため、最小の隔離menu応答を追加し再成功（実HTTP実装の製品例外ではない）。foreground検出はInstrumentation lifecycleで捕捉する方式に改善。失敗を成功項目へ数えない。

## 2026-11-07 標準追加掲示板の実装・最終検証完了（未公開）

上記の242未完了状態は解消。登録済みloopback infoのhost/path/portだけを照合してHTTPS URLをHTTPへ戻す補正を既存ExternalBoardEditor URL wrapperへ統合。native String/URI/context entryの各本体とレジスターを保持する検査を191/226/242すべてで通過。最新通常Lint/R8はsite-native-durable-media-build.logでBUILD SUCCESSFUL 4m48s、91tasks。

あにまん画像は一時hash→メモリmap依存から、登録aliasと元のthread/image座標を含むloopback URLへ変更。gatewayを停止・新規構築しても保存DATの画像URLを解決できる。許可先は固定の元サイトだけ、OFFの板の画像要求は403。画像取得と再構築後の取得をPNG fixtureで検証。

最終MPP build/site-native-verified.mpp / SHA256 0ae3492a530a9095d979abb6388d4c0b3b932f5a5829f5eafb6738562a87083e。各版の既存reporter検証用アプリをemulator-5580へ証明書照合後更新、実機変更なし。導入APK/署名/ハッシュ/日時はandroid-installations.md、機械可読結果はbuild/site-native-verified-summary.json。

最終結果: 各版native registry/parser/folder/site-root/BbsPreference 19項目。標準readerで3サイト17/4/79レスの実表示、標準ResEdit画面と投稿先に結び付いた画像添付ボタン、短いID/10桁ゼロ埋め/port/HTTP保持、DAT/画像GET、画像URLのgateway再構築後の取得とOFF拒否、返信の模擬成功・重複抑止を191=191項目、226=200項目、242=197項目成功。native dialogの実表示/URL/板数/使用するON→OFF→ONは191で29項目成功済み。hostは全カタログ24,345、遅延通知を含む使用状態21、メニュー/分割1290、DAT/投稿136、新規スレ/画像33、あにまん224、3サイト解析25を成功記録。

242最終試験の一度目は旧試験で残した一時aliasのタブが新しいisolated registryに存在せず、標準reslist復元でID=nullとなるクラッシュを検出。tabletHome2の退避XMLで対象が過去の3fixtureであることを特定。試験用に作成した未登録loopback alias＋既知3fixture IDのタブだけを整理し、実登録/他タブを保持する前後処理をInstrumentationへ追加。試験Activityを終了・idle待ちしてからsingleton/prefsを戻す。3版すべてこの後処理込みで再成功、コードや全データ消去で隠していない。UI試験はnative cacheにfixtureを作成するため、core試験のDB writes=0と区別する。

通常のcold Home起動も3版Complete（起動ログsite-native-verified<版>-startup.log）。新規crashログの最終確認は別ファイルへ記録。公開掲示板へのPOSTは0。実サイトの認証を含む送信成功、新規スレ/画像のサイト側実受理は未確認。実装元repoのソース未利用は維持。今回commit/push/Releaseは行っていない。

最終3版の通常cold Home後の新規reporterクラッシュなしを、UTC cutoff 2026-11-07 01:19:08.594以降のcrash buffer取得成功（exit0）で確認。build/site-native-verified-new-crash.log。時刻引数の初回取得失敗は再取得で解消し、検証JSONへ確認結果を記録した。

## 2026-11-07 「板の数0」の実取得確認

利用者指摘でemulator-5580 / reporter242の標準設定を確認し、使用するONでも追加3サイトの板数0・private registry未取得を観測。標準ダイアログから更新したWorkManagerの失敗出力は「ネットワークに接続していないか、ネットワークの対象外です」。dumpsys connectivityはActive default network:none、cmd wifi statusはWifi is disabled。元から5ch.ioなど他サイトの板数も0であった。

エミュレータのみWi-Fiを有効化しAndroidWifi接続後、各サイトの標準「板一覧を取得/更新」を実行。実ネットワークの元BBSMENU→gateway→標準WorkerのDB保存→標準dialog表示で、爆サイ7946・ふたば98・あにまん31を確認。設定画面を開き直すと各標準BbsPreferenceの件数にも同じ数が反映。取得前0の状態を製品の件数バグとはしない。コード/MPP/APK変更・実機操作・Releaseなし。公開POST0。

証跡 build/site-count-final.xml / site-count-final.png、各site-count-<site>-after.xml、site-count-connectivity.txt、site-count-androidx.work.workdb（読取コピー）。エミュレータはオンラインのままとし、実取得した8075板は検証アプリへ保持。初回のUI dump空rootや時刻の異なる旧crashログを新規クラッシュと扱わず、画面再取得で確認した。

## 2026-11-07 実取得のモバイルHTMLと標準書き込み画面（再検証中）

板数の実取得後もスレ一覧が空との報告を受け、Android UAの実応答を採取。爆サイは保存済みdesktop fixtureとは異なるモバイルカード形式（.thr_list/.imgbody .title）を返しており、従来の#threadListField限定解析が原因だった。閲覧数とレス数を区別し、.thrimg_comment_spaceに対応する値からnative件数を生成する。モバイル本文は#res0_whole/#res0_bodyと#res_list直下のres_blockを対象とし、一覧外の隠しポップアップを除外する。

投稿は標準ResEditActivityを維持。モバイル返信form#ajax_directForm、新規スレform[name=thrAdd]に対応し、送信直前のフォームから投稿先・板・スレ番号・hidden値を照合する。記事出典など標準画面に入力欄がない必須項目は送らず、制限をnativeエラー画面へ表示する。フォーム内の時刻トークンに依存せず入力内容で重複送信を抑止する。

host再検証はモバイル実一覧8、実モバイル本文/返信/画像/新規スレ28、既存native DAT/投稿136、新規スレ/画像33、メニュー/ページ分割1290項目成功。公開投稿0。実標準画面の「書き込む」から送信する試験を追加して検証中。初回は送信先に本文が届かず失敗したため、従前の「画面が開く」確認を投稿成功とは扱わない。最新APKのビルド/導入/実取得およびnative送信結合はこの段階では未確認。push/Releaseなし。

追補: 通常Lint/R8最終ビルド site-mobile-post-final-build.log は7m21s/91tasksで成功。242の最新APKはnative reader/本文入力/標準「書き込む」/3サイトの模擬送信/再送抑止を含む216項目成功。爆サイ実通信の読取probeはHTTP200、一覧10件・本文8レコードを成功。実URL付きam startによる画面遷移は自動承認審査がblocked by policyで拒否したため実施せず、許可された読取probe結果とnative fixture UI試験を区別する。
初期のnative送信試験の不達は、試験がmultiline属性だけで名前欄を本文と誤選択したことが原因。本文欄選択の修正後に242成功。191も3サイトのnative送信まで通過した後、Host拒否試験の「全GET総数が増えない」というassertにnative背景更新が混入して失敗。Host拒否403は通過しており、拒否対象専用の未使用スレURLがtransportへ渡らないことを検査するよう試験を修正し再実行する。これらを製品修正/公開投稿成功とは扱わない。

### 最終確認

最新候補build/site-mobile-post-final.mpp（SHA256 57120f067d838f528786093712f9f9633de62b469b90418ee40dfa5af1565cfd）を3版の既存reporter検証アプリへemulator-5580で同署名更新。最終native reader/本文入力/標準「書き込む」/模擬transportへ本文受渡し/再送抑止/画像GET/OFF制御は191=210、226=219、242=216項目成功。フォームのloaded_atをGETごとに変える試験で再送抑止も通過。失敗した旧試験ログは残し、最終成功と区別する。固定フックのレジスター/元命令/native settings保持検査も3版成功。

3版の通常cold Home起動はComplete。UTC 2026-11-07 04:40以降のcrash buffer行は0（site-mobile-post-new-crash.log、crash buffer取得成功）。インストール台帳に各APK/MPP/署名/日時を追記。機械可読結果 build/site-mobile-post-summary.json。公開掲示板へのPOSTは0、実認証と実サイトの書き込み受理は未検証。専用項目が必要な板の新規スレ作成には制限を表示。実URLの画面遷移は前述の審査拒否で未実施、実通信の取得解析とnative mock UI表示を区別する。commit/push/Releaseなし。

## 2026-11-07 本文空白の追加再現・モバイル分割ページの修正中

利用者が「スレ内容が表示されません」と訂正。emulator-5580 / reporter242の実登録「新型コロナニュース」から最近閉じた実スレ13539922をUIで開き、本文空白とAdditional board request failed / 爆サイのスレ本文を取得できませんを再現。従来の単一ページprobe（レス数が少ないニュース8件）とnative fixture成功だけでは、この経路の安全性を確認できていなかった。

実モバイル応答を採取すると、71返信が11ページに分かれ、初期ページはOPと65〜71、次は58〜64を返す。継続ページはOPの#res0_bodyとレス総数カウンターを省略する。従来は各ページにOPと総数を必須にしていたため途中で中断した。初期ページだけでOPと総数を必須確認し、継続ページは同じスレ番号/タイトルを確認して返信を集約する。全件連番の検証は維持。実モバイル全11ページから72 native DAT行を確認する新規SiteMobilePaginationTest 81項目と既存desktop分割1290項目成功。少数レスのモバイル返信/新規スレ28項目も成功。修正版のビルド/実UI確認は続行中。旧候補を実表示完了とは扱わない。公開POST0、Releaseなし。

追補: SiteMobilePaginationTestへページをまたぐ引用番号変換を加え82項目成功。通常Lint/R8はsite-mobile-pagination-final-build.logで5m26s/91tasks成功。3版APKを生成したが、242を同署名で更新して同じ実タブをUIから開くと、まだ本文空白が再現したため成功扱いしない。loopback読取probeのtransportを一時的に読取専用proxyへ差し替えて各実応答を採取すると、1〜9ページはスレHTML、10ページ目はHTTP200のエラーHTML（ERROR_CODE:thr_res:778）。hostで採取したpage10/11は本文が存在する。取得間隔による差を切り分け中。診断proxyはfinallyで元へ戻す。公開POST0、Releaseなし。

### 元サイトの部分エラーで全本文を失わない修正

400msずつ取得を空けても、端末の10ページ目は同じthr_res:778のエラーHTML。単純な高速連続取得とは断定しない。途中ページがこの既知のエラーHTML（titleとerror_code_textを厳密照合）を返した場合、取得できたページとOPを保持し、未取得のレス番号には「未取得」/元サイトのエラーコードを明示する。OPにも一部未取得と表示。空白を成功扱いしたりレス番号を詰めたりしない。最初のページの失敗、別スレ、任意HTML、通信例外は従来どおり失敗。公式フォームのpage selectorを同じthreadとtp=1のactionに限定して追跡し、エラーページの先も読めるようにする。実deviceのエラーページを使う部分取得テストを追加し、93項目成功。既存desktop分割1290も成功。最終ビルド/実UI確認中。

ビルド経過: 最初のpartial-buildはTaskProvenanceUtil/cache記録失敗、cacheを分けた再試行はhs_err_pid22516.logでnative malloc不足（仮想メモリ残約1.3GiB）。製品ソースのコンパイルエラーと扱わない。emulator-5580のスナップショットhaiagaru-before-partial-buildを保存成功後、emu killで一時停止。データ消去なし。仮想メモリ約10GiBを確保し、低メモリ/単一worker/SerialGC/Tier1で通常Lint/R8ビルドを再実行中。検証終了前にエミュレータを再開する。

### 実表示の確認と投稿エラーの切り分け

site-mobile-partial242候補を証明書照合後emulator-5580へinstall-rし、同じ実タブ13539922のnative更新ボタンから72レスが表示された。site-partial-refreshed.xml / site-partial-displayed.png。単にHTML解析成功とは区別して、実native本文表示を確認。その後画面が書き込みエラーへ変化したためこちらのタップを停止。利用者は「書き込み出来るようにして」と追加指示。

採取した実HTMLの.over1000 .caution_bodyに「スレが立ってから30日を過ぎるとレス投稿が出来なくなります。」とあり、当該スレに投稿フォームなし。サイトの受付終了が原因であり、アプリから受付を復活させられるものではない。SitePostProtocol.replyでこの既知文言を識別し、投稿受付終了と新しいスレを選ぶ案内を標準エラーへ表示。Gatewayはまず投稿フォームを検査し、引用番号変換がある場合だけ全ページを取得する。通常の本文は不要な過去ページ取得をせず投稿Planへ進める。catch時の例外もHaiagaru logへ記録。公開POSTをこちらから送信・再送していない。

追加でOPのDOMが壊れたニュース記事ではfallback #res0_bodyが後続レス/操作画像も含むことを実UIで発見。記事本体#div_boxを優先する修正と、OPには記事画像2件のみ/レス本文の混入なしの検証を追加。実モバイル分割/未取得表示/投稿終了/引用番号のhost検証96項目、投稿可能な実モバイルフォーム28項目成功。通常Lint/R8のOP限定候補site-mobile-body-final-build.logは成功5m20s。投稿終了理由/不要ページ取得削減を含む最終ビルドはsite-body-post-final-build.logで進行中。未公開。

### 最終候補の再検証と追加エラーコード

site-body-post-final-build.log成功3m55s、MPP build/site-body-post-final.mpp / SHA256 662ad6b4e635789815203cf27cd68472f5c49ab6b9c974cb6759d741a1fed89e。各reporter検証アプリをemulator-5580へ同署名更新し、標準reader/本文入力/標準送信ボタン/隔離POST/期限切れの送信前拒否/再送抑止/OFFの191=212、226=221、242=218項目成功。固定フックの元命令保持も3版成功。実POSTはこちらから0。

ただし最終live probeで元サイト11ページ目がHTTP200の別エラーthr_res:759を返し、778限定の部分取得処理では503になることが判明。そこでエラーページtitle＋error_code_textの形式と3桁コードを厳密照合して、元サイトの各コードを表示しながら取得済み本文を保持する修正へ拡張。初期ページの失敗/任意HTML/別スレ/通信例外は成功扱いしない。実端末の778と759を併用するhost検証98項目と旧desktop分割1290成功。最新版はsite-body-post-errors-final-build.logでビルド中。前記live probeの503を取得成功と扱わない。

### 最終の実通信読取成功

site-body-post-errors-final-build.log は通常Lint/R8成功3m36s。拡張したエラー形式を含む実モバイル分割テスト98項目、desktop分割1290項目成功。build/site-body-errors242.apkを同署名更新し、同じ実スレ13539922の元サイト全11ページを読取proxyでGET（POSTは拒否）して、実GatewayからnativeDatRows=72を取得成功。ログbuild/site-body-errors-live-dat.log。前段503とは異なり、今回はHTTP200のnative DATを確認。サイトエラーページの内容をレス本文として扱わず、未取得の番号に実コードを明示する。最初のページが取れない場合は失敗のままとする。

実native画面の本文72レス表示は前段site-partial-refreshed.xmlで確認済み。記事本体限定（本文にレスや操作画像を重複させない）と投稿受付終了案内を加えた直前候補のnative UI/模擬送信は191=212/226=221/242=218成功。最後の差分は既知サイトエラーの番号判定と表示だけの共通Java処理で、hostの実レス/実エラーHTMLの組合せで98項目を検証し、3版の固定フックは再検査、最新版242は実Gateway経路でも確認。公開POST0、サイト側の書き込み受理は未検証。実掲示板の投稿受付終了をアプリで解除したとは報告しない。Release/pushなし。

最終3版のsite-body-errors候補は全て証明書照合後install-r Success、通常Home起動Complete。固定native hook/register/元命令保持の検査3版PASS。UTC 2026-11-07 06:32以降のcrash buffer行0（site-body-errors-new-crash.log）。最新の実Gateway DAT取得は72行成功。反映APK/MPP/署名/日時はandroid-installations.md、機械可読結果site-body-errors-summary.json。
最終UIの読取では利用者側で別の実スレ（新型コロナニュース13558784）と本文testを含む標準composerが開かれていることを観測。こちらから公開投稿ボタンを操作していない。13539922の投稿期限終了の事実を別スレへ一般化しない。最新候補の実サイトへの投稿受理は未検証のまま。画面の同時操作があるため以降のタップをしない。公開/pushなし。

## 2026-11-07 あにまんの実エラー・日付表示の追加調査

利用者が「書き込みできません」→「あにまんでエラー」と指定。エミュレータ191の実画面で「ERROR投稿前の確認で拒否されました。認証・内容を確認してください」を観測（site-user-current.xml）。同アプリの現在スレはあにまん7527272、Cookie利用flagは未設定。ホストから公開クライアントと同じOrigin/Referer/X-Requested-Withを付け、preCheckだけPOST（最終POSTはしない）した結果HTTP403のCloudflare Just a moment...を受信（animanch-precheck-only-response.html）。ヘッダー追加だけで認証なしに送れると判断しない。通常の認証が必要。

あにまんのX-Requested-With:XMLHttpRequestを公開JSの通常API仕様に合わせ、preCheck/最終応答のHTTP状態と明示error本文を表示する修正を追加。書き込み画面に「あにまんの認証」ボタンを追加し、既存の追加掲示板認証WebViewを開く。認証を利用者が完了し「認証情報を利用」で当該host Cookie/同じWebView UAを保存する既存経路を使う。Cloudflare challengeのトークンを生成・回避しない。送信画面はChMate標準のまま。元サイトの認証完了/実投稿受理は未確認。

利用者が実投稿の検証を明示許可したが、投稿先と本文の取り違えを防ぐため3サイトの投稿可URL/本文を照会し回答待ち。こちらから公開投稿の最終POSTは0。現在のdraft/他者のレス内容をテスト本文へ流用しない。

さらに「スレ一覧の日付/日時がおかしい」と報告。subject.txtのサイト連番をChMateがUNIX秒として解釈するのが原因。242のThreadListRecyclerAdapterは非日時ID（9240000000以上）では作成日時を表示しない。原本の標準判定は191 BBSThread.c(J)Z、226 BBSThread.d(J)Z、242 TopLayoutDislike2.b(J)Zで同じ定数と確認。追加板のスレIDだけを標準の非日時namespaceへ写し、DAT/投稿/添付/リンクで元番号へ戻すSiteThreadIdsを追加。元一覧に日時がない場合は架空の日時を出さず標準の非日時表示とする。通常5chへの変更なし。既存の短い/ゼロ埋めURLも受理。対応source範囲は正数かつ9240000000未満。新native IDでもソース側の投稿先番号は変更しない。

host: ID互換31、あにまん解析/本文/エラー文228、既存DAT/投稿136、モバイル分割98、desktop分割1290成功。日付候補site-dates-post-build.logは通常Lint/R8成功5m42s、認証入口を含む最新版site-dates-auth-final-build.logで再ビルド中。native testは非日時判定・native DATキーの復号とreader/composer/POST先保持を追加して検証予定。公開/Releaseなし。

追加: あにまんの実Cloudflare HTMLを含むhost試験は230項目成功。標準composerに認証入口が存在し、HTTP403の実challengeを模擬transportで返した場合に案内を表示し最終送信しない検証を追加した。日時markerの先行242候補はnative reader/旧URL/非日時判定/新DAT ID/標準送信/元スレ番号保持で227項目成功（site-dates-first242-runtime.log）。
端末からpreCheckだけを再確認するInstrumentationの実行は自動承認審査にblocked by policyで拒否された。詳細理由は提示なし。これを別の方法で実行し直さず、既に採取したHTTP403のCloudflare応答と利用者の実画面、模擬応答検証を用いる。対象スレ7527272の実送信受理や認証完了を成功とはしない。

### 日付/認証の結合結果と最終調整

認証入口と非日時IDを含む先行候補site-dates-auth-final.mppは通常Lint/R8成功5m28s。emulator-5580で191=223、226=232、242=229のnative reader/composer/元投稿先ID/非日時判定/旧短縮URLとゼロ埋め/新DATキー/Cloudflare拒否理由表示/最終送信阻止が成功。各版3サイトを対象に上記を確認し、模擬transport以外の最終POSTは送信していない。

認証WebViewの既存ナビゲーション制限がCloudflare子フレームを妨げる可能性を解消するため、利用者が操作する認証ダイアログに限り、HTTPSの同サイトとchallenges.cloudflare.comの子フレームだけを許可するSiteAuthenticationPolicyを追加。main frameでの外部ホスト、userinfo/非標準port/HTTP/任意schemeは許可しない。11項目成功。challengeを自動解答/トークン生成しない。

また元サイトからの番号と内部native番号を厳密に区別し、元サイト側が対応範囲外の値を返した場合に別スレへ解釈しないよう、SiteThreadIds.nativeId（source専用）とnativeInput（旧/内部URL受理）を分けた。32項目成功。source範囲は1〜9239999999、内部範囲はBASE+source。この最終調整を含むsite-final-auth-date-build.logでビルド中。前段frameビルドは重複作業を避けるため自分のビルドdaemonのみ停止し、成功とは扱っていない。

### 最終候補の反映・認証画面確認（未公開）

site-final-auth-date-build.log 通常Lint/R8 BUILD SUCCESSFUL in 4m / 91tasks。build/site-final-auth-date.mppから191/226/242の既存reporter packageをemulator-5580へ同署名更新。native reader/composer/非日時判定/新DAT ID/旧短縮ID/元投稿先ID/認証ボタン/Cloudflare拒否案内/送信停止は191=223、226=232、242=229項目成功。3版の元hook/register保持PASS、cold Home起動Complete。UTC07:17以降の新規crash buffer行0（site-final-auth-new-crash.log）。Source-ID32/認証navigation11/あにまん230/モバイル分割98/desktop分割1290等も成功。

191の標準composerの「あにまんの認証」ボタンを実UIで押して、bbs.animanch.comの認証ダイアログと実ページ表示を観測（site-auth-web-ui.xml / site-auth-web.png）。その「認証情報を利用」を押し、cookies:bbs.animanch.com=trueを確認（site-auth-enabled191.xml）。Cookie値をログ/文書へ出さない。初回ADBによる非exported Activity直起動はSecurityExceptionで拒否されたため、Activityをexportせず通常のcomposerボタンで開いた。認証トークンを自動生成/抽出/回避していない。これを投稿APIのCloudflare認証成功とは扱わない。該当APIへの再checkOnlyは自動承認審査でblocked by policyのため未実施、実公開投稿の受理は未確認。

利用者は実投稿検証を許可しているが、投稿してよい3サイトのURL/本文を照会後未回答。現在のdraftをこちらから送らず、agentが行ったネットワークはpreCheckのみ/通常GETのみ、公開最終POST0。実投稿成功を対応完了とは報告しない。Release/pushなし。

## 2026-11-07 投稿成功時のダイアログ終了・検証用公開準備

利用者が公開投稿の本文test/任意スレを許可した後、成功時の投稿ダイアログ非表示と検証用プレリリースを追加依頼。従来の「未回答」はその時点の記録で、現在は本文/宛先の許可を得ている。ただし最終公開POSTはこちらから0のまま。実投稿受理は未確認で公開説明にも明記する。

標準ResEditFragmentの成功分岐は本文消去/標準保存処理/setResult(RESULT_OK)/finishを実行する。Gatewayが元サイトの明示成功を確認した場合だけ返す2ch_X:trueで、その標準分岐へ到達することを確認。成功前のActivity強制終了や追加の汎用finishフックは不要で、製品Java/MPPは直前最終候補から変更なし。

SiteBoardGatewayInstrumentationを実際のResEditActivity$Dialogへ変更。各サイトで403拒否時にダイアログと入力本文が残ることを確認し、別本文の成功後は試験側のcleanup前にActivityが終了することを確認。emulator-5580で191=255、226=264、242=261項目成功（build/site-close-final191.log / 226.log / 242.log）。外向きPOSTを隔離した試験であり、公開投稿成功とは扱わない。通常のResEditActivityでも先行242=232項目で終了確認成功。3版の新規crash buffer行0（UTC07:50以降、build/site-close-crash.log）。共有NGの変更済みserver試験3ファイルも全て成功。

検証に用いたMPPはbuild/site-final-auth-date.mpp、SHA256 06dbd33bd88e46d01b2b3d74f9ad9898f376de19b549d76b731a91d1b935660a。製品ビルド/3版フック/起動/本文/画像/導入記録は前節の最終候補と同じ。最新差分は試験・文書・公開ノートのみ。.releasercの検証用説明を今回の追加掲示板対応・226検索・動画エラー修正と実サイト投稿未確認の範囲に更新。既存Semantic Releaseのdev経路で公開する。

### 検証用プレリリース公開済み

既存Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42353763218 がsuccess。Semantic Releaseで1.25.0-dev.2を2026-11-07 08:07:57 UTCに公開。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.2 。draft=false、prerelease=trueをAPIで確認。配布MPP/標準とpreのbundle JSON/任意ZIP3個を確認。MPPを実ダウンロードし6990165bytes、SHA256 416e2546e68f11db3b0a62c724f1d83d4be0b91299c6731beeed991c105f053d。pre JSONのversion/download_url一致を確認。生成されたversion/CHANGELOG/bundle JSONはCIコミットfadfc39aをff-onlyで取得し、手動編集なし。

ソースコミット4e2bc633。公開前の端末試験は前記ローカル最終候補の同一製品ソースに対して実施し、CIでバージョン更新/再ビルドされた配布MPP自体の再パッチ/再導入はしていない。実サイトへの最終POST0、投稿受理未確認の制限をRelease本文にも掲載。関係しない未追跡scripts/frida-thread-open-timing191.jsとscripts/shared-ng-reporter-blocks-runtime.jsは保護しコミットしなかった。

## 2026-11-07 HTTPS強制ONでの追加掲示板TLSエラー修正中

利用者報告: Unable to parse TLS packet header (http://127.0.0.1:41093/haiagaru-menu-bakusai/)。HttpsTransportのHTTP→HTTPS変更は、既存thumbnail/VPN/hissiだけを例外にしており、新規SiteBoardGatewayのHTTP待受portを登録していなかった。forceHttps=trueで標準クライアントのOkHttp URL builder/java.net接続がloopbackへTLSを開始し、HTTP応答をTLSヘッダとして解釈する。

修正: Gatewayのbind/prefs保存/worker作成が成功した後で、実際に待受しているportをHttpsTransportへ登録。stopでsocketの実portを解除。厳密な127.0.0.1と登録portの組だけを既存HTTP例外/ローカル直接接続へ追加し、外部host/他port/起動前/停止後のloopbackは例外にしない。複数の独立gateway試験を妨げないようport集合を使う。ネイティブフックやTLS検証には変更なし。

ホストのVerifyHttpsTransportを拡張。forceHttps=trueで3サイトmenuのHTTP取得、明示的な外部proxyを使わずlocal取得、外部host/類似host/停止後の例外なし、既存動画thumbnail/hissi等を含む62項目成功。通信はloopbackだけ。

初回Gradle/R8とD8試験準備がPC仮想メモリ不足で失敗。製品コンパイル不良とはしない。emulator-5580が応答しなくなりsnapshot保存/emu killも応答しないため、正確なAVD名/port/PIDを照合したqemuだけ停止。データ消去/アンインストールなし。cold boot時のRAMを2048MiBに抑えて再開。通常Lint/R8再ビルドとHTTPS ONのnative再現/修正検証中。

利用者が『先にプレリリースして』と指示。通常Lint/R8ビルド4m17s成功、3版APK生成成功、host62項目成功、191/226の既存固定フック保持成功。修正後の3版native画面再検証の完了前に先行配布する旨を公開説明に明記し、dev Semantic Releaseを進める。公開処理中にもnative検証を継続する。旧候補での起動直後試験はbg ANRで終了しており、成功に含めない。


追補: 利用者の先行公開指示により05dee0d3をdevへpushしRelease CI 42355963730を開始。そのCI待機中に、修正候補の全3版固定hook検査/署名照合/同署名更新を完了。HTTPS ONで191=269、226=278、242=275項目成功（build/site-https-final<版>.log）。3サイトのmenuを製品HttpsTransport経由で実HTTP取得し、同設定で標準本文/画像/投稿dialogの成功終了と拒否時本文保持、停止時のHTTP例外解除/再起動時の再登録を検査。外向きPOSTは隔離、公開POST0。UTC08:30以降のcrash buffer0行（site-https-final-crash.log）。ユーザー設定forceHttpsの元値を各試験finallyで復元。RAM2048MiBでcold boot直後の旧候補試験はbg ANRだったが、4096MiBで最終3版は全て成功した。今回の修正候補を既存アプリへ更新した日時/絶対path/SHA/署名はandroid-installations.mdへ記録。


公開完了: Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42355963730 success。1.25.0-dev.3 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.3 を2026-11-07 17:38:41 JSTに検証用公開。APIでprerelease=true/draft=false、MPP+bundle JSON2個+任意ZIP3個を確認。MPPを実ダウンロードし6990788bytes / SHA256 996c222845292876cefbe12a906e49d34472e881611f1cc31d6a909961599afd。pre JSONのversion/download_url一致も確認。CI生成コミット677b9472をff-onlyで取得、生成ファイル手編集なし。公開MPP自身の再パッチ/端末再導入は未実施。同じ製品ソースから生成したローカル候補で前記native 3版の確認が完了した。公開ノートは先行配布開始時点の未完了範囲を保守的に記載したまま。

## 2026-11-07 履歴OOM・アップロード済み画像プレビュー・初見過去ログUnicode

実装と経過はdocs/history-memory-preview-archive-20261107.md。EdgeReporterHistoryの行読込ごとのSharedPreferences.applyを除き、ReporterMetadataWritesへ重複排除/4096保留上限/単一commitワーカー/低ヒープ時退避/補助保存OOM時の停止を追加。既存のNG・履歴やユーザー指定キャッシュ設定は消去/変更しない。242の通常画像プレビューをnative pagerへ委ね、191/226の旧方式とGIF/動画/全レス移動は維持。過去ログはNCR出力、UTF-8 HTML判別、現行div形式fallback、旧sectionがないHTMLでの旧正規表現試行抑止を追加。

ホストはメタデータ14、履歴27、低ヒープ32MiBで5、メディア47、文字コード11、実コンバーター21（旧/現行・UTF-8・報告元実レス・1000レス）成功、既存Talk文字コード試験も成功。元URLをGETしてHTTP200/Shift_JIS/&#120143;を確認。公開投稿は行わない。

191/226/242の前段最終候補で各34項目成功。12,000並列履歴読込/alias保存/NG解決/旧板の隔離、AndroidのHTML/NCR・itest・報告実レス変換、同サイズの生成PNG2枚をnative previewで3往復。242は同じActivityを保ち、191/226は旧方式を維持する。191の既存Back優先と混ざる試験はBackを一時0へ変更し、最後に元値へ復元して再検証した。hook/register/元dispatchの保持も3版成功。途中の失敗は経過文書に残し成功へ含めない。

最後の旧形式解析スキップだけを加えたhistory-release-build.logも通常Lint/R8成功3m49s。その出力build/history-release.mppから最終APKを生成/検査中。共通の最終制御分岐はhost21で出力不変と1000レスを確認済み。機能の前段3版native確認と区別し、Semantic Release CIの実行中にも最終MPPからの追加native確認を継続する。Sony SOG02/Android12実機の再現確認は未実施。既存の文字欠落DATを自動修復する変更ではない。


最終バンドル検証: build/history-release.mpp SHA256 58c154e128026a9113bc7a0c780b4f53cc6d1957ff18234d36f71b329507b98b（history-release-build.log成功3m49s）。最終APK history-release191/226/242.apkを署名照合後emulator-5580へ更新し、各34項目PASS/3版cold Home Completeを再確認。hook/register/元dispatch保持も全3版PASS。各APK/MPPの絶対path/hash/署名はandroid-installations.md。Commit e93a25ffから既存Release CI 42361272985を開始し、同時に最終native検査を完了、通常のnative本文/画像/標準投稿ダイアログ回帰を確認中。前段候補の成功で代用せず最終バンドルでも34項目を再実行済み。


1.25.0-dev.4検証用公開完了。CI42361272985 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.4 / prerelease=true,draft=false確認。MPPダウンロードSHA256 03048ffbf65b2248921d52768a2b1680ae274a5e7e06fca041cd602bfe842c59。最終MPPで191/226/242の各34項目とcold Home Completeに加え、通常native本文/画像/投稿dialogの既存回帰269/278/275項目成功。開始時刻以降crash buffer0行。CI配布MPP自体の再導入は未実施。CI生成commit2417d12fをff-only取得、生成ファイル手編集なし。新たな3サイト取得不具合の報告は次の修正として調査する。

## 2026-11-07 報告板の追加取得不具合（調査・修正中）

利用者の具体例から実URLを登録済み8075板のregistryで特定。爆サイ「栃木災害」は /thr_tl/acode=15/ctgid=148/bid=1532/、事件・事故は /thr_tl/acode=2/ctgid=137/bid=1098/。通常の文字一覧は.ttTitle .title/.thrlis_comment_space、画像付き一覧は.imgbody .title/.thrimg_comment_spaceという違いがあり、前者を追加。本文mobile判定が#threadBodyの存在だけでもdesktop扱いになり、#title_thrがない通常mobileを誤認していた。titleがなければmobileを選ぶよう修正。

実通信のGET/解析で事件・事故13611011は133行/15GET、栃木災害9332038は13行/2GETに成功。通常のDalvik/Android UAで検証。Chrome Mobile UAでは本文先頭/総数が省略された別HTMLになることも観測し、取得成功とは扱わない。認証回避やUA偽装で認証制限を突破する実装は追加していない。

ふたば「ねこ」https://may.2chan.net/27/ のカタログには本文なし、「昭和」https://dec.2chan.net/76/ のカタログは4文字省略ラベルであることを実HTML確認。FutabaCatalogueで通常indexのOPタイトル/本文を取得してカタログの順序/件数を保ったまま置換。読み取りは同一boardの数値.htm/futaba.htmのみ、GET formのページ移動も受理、POST/他hostへ進まない。最大10ページ、タイトルは120文字まで、LRU2048件で次回の追加取得を避ける。未取得タイトルは元カタログ表記を維持する。実通信の各50スレ/6GETを確認。昭和先頭は「ロマンポルノやピンク映画の裏話」、ねこ先頭は実際のOP「本文無し」。HTTP403を認証エラーとして表示し、内部解析エラーも短い既知の診断だけを503本文へ出す。upstream HTMLやCookieは表示しない。

ホスト回帰: 報告形式16、既存の板/list/thread25、15地域menu/desktop分割1290、mobile分割98、あにまん保存HTML228項目成功。最初のbuildはserve内の既存catalogue matcherと新ローカル変数の名前重複で失敗、listingへ修正して再build中。製品ビルド成功とはまだ扱わない。

あにまんの実況カテゴリ /category21/ は調査ホストから403。スレタイトル検索も該当URLは特定できず、ユーザーへ「今更Switch版ダブルクロス買った5」の実URLを照会中。削除/欠番/認証等を推測で修正せず、未解決として区別する。公開済み1.25.0-dev.4にはこの追加修正は含まれていない。


追補: 通常Lint/R8の再試行site-reported-layouts-build-retry.logは4m30s成功。修正MPP build/site-reported-layouts.mppから全3版APKを生成し固定hook/register/元命令保持成功。242は276項目、191は274項目/cold Home Complete、226初回は試験のupstreamが投げたAssertionError（本文照合）でプロセス終了。製品由来の自然なクラッシュとは区別し、公開を止めて試験を調整。expectedEditorBodyを複数回volatileで読み直さずローカルsnapshotで照合し、fixture不一致をサーバーworkerからthrowせず試験結果へ保持、本文到達と全POST不一致なしを両方assertするよう修正した。226の先行再試行は279項目PASS。最終試験を3版へ再適用して実行中。


最終確認: 最終試験は191=276（site-reported191-final-retry-runtime.log）、226=285、242=282（各site-reported<版>-final-runtime.log）成功。191の一度目は終盤のgateway停止/即再開でEADDRINUSE、直前の191先行274項目は成功済み。新プロセスで同じ最終試験を再実行すると276項目成功した。機能失敗や未取得を成功へ数えず、全試験を再実行した結果を記録。全3版のcold Home Complete、UTC10:39以降新規crash buffer0行。あにまん実実況URL未回答/未解決を公開ノートへ明記して今回の2サイト修正を検証用配布する。MPP 044e173bbd15600aad2f8628666c058e993322e48c20073d95e9b0ff97bcd5a6 と各APK/hash/署名/導入先は導入台帳参照。


1.25.0-dev.5検証用公開済み: CI42365241233 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.5 / 2026-11-07 19:50:08 JST。APIでprerelease=true/draft=false、配布MPP/bundle JSON2個/任意ZIP3個を確認。MPPを実ダウンロードしSHA256 dbed441369e5f27d5f4787a955aeb8150e46d2ee21f68a89900b5d3a6572c839、pre JSONのversionとdownload_urlも一致。CI生成ファイルはff-onlyで取得し手編集なし。あにまんの一部実況/安価スレの本文失敗は該当URL未回答で未解決、公開ノートに明記。配布MPP自体の再導入は未実施、同一製品ソースのローカル候補で全3版確認した。

## 2026-11-07 標準バックアップXML共通化・共有NGの散在文字反復による誤検知

詳細 docs/backup-canonical-shared-ng-20261107.md。元の jp.co.airfront.android.a2chMate_preferences.xml をnativeバックアップの共通名とし、実ストア名はパッケージ固有のまま固定I/Oフックで橋渡し。共通名優先/同一パッケージ旧XML名fallback。ユーザー提示の 左のネ|([チョンパヨ].*){5} が「パッケージ名」反復を隠すことを再現し、この種の広すぎるオンラインkeywordルールを自動適用から除外、確認画面へ理由表示。配信側変更なし。

通常Lint/R8成功4m33s、ホスト25/19/96/10306、全3版固定hook命令/レジスター/分岐保持PASS。emulator-5580で署名照合後install-r、専用試験191=10/226=13/242=13成功（226/242は隔離した実native XML復元、191は全restore worker実行なし）。native回帰を再確認し、ユーザーのプレリリース公開指示によりdev Semantic Releaseで配布する。MPP/各APKの絶対path/hash/署名/導入先はandroid-installations.md。


最終native回帰: 191=276（canonical-backup191-reader-retry.log）、226=285、242=282項目成功（canonical-backup<版>-reader.log）。標準本文/画像/模擬投稿dialogを確認、公開POST0、試験finallyで設定復元。3版Home Complete。開始UTC11:17以降crash buffer0行。初回191は試験起動順のforeground待ち失敗だったため開始後Home起動で全項目を再実行し成功。最終MPPの専用復元/NG試験と区別して両方確認済み。



1.25.0-dev.6 検証用公開完了。Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42367834199 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.6 / 2026-11-07 20:25:01 JST。APIでprerelease=true/draft=false、MPP/bundle JSON2個/任意ZIP3個を確認。配布MPPを実ダウンロードし7001425bytes / SHA256 858ab81a6042227f84c09a592f9603f9f36328c1c570b2bd819eb185a613af5c。pre JSONのversion/download_url一致。ソースa7c22449、CI生成eef240a9はff-only取得、生成ファイル手編集なし。配布MPP自体の再パッチ/導入は未実施、同一製品ソースのローカル最終候補で全3版試験済み。



## 2026-11-07 共有NG固定ラベル誤検知・端末内編集（作業中）

詳細 docs/shared-ng-local-edits-20261107.md。配信済み条件の実式に独立したﾜｯﾁｮｲ等の短いOR分岐を確認、受信側に対策。共有NGの条件文/正規表現指定を端末内だけ編集、同期保持、配信条件へ戻すUIを追加。配信停止/票数/報告者除外維持、サーバー変更なし。ホスト57/96/10306/17/263成功。Lint/R8製品ビルド2回成功、UI最終調整の再build/Android試験中。公開や実機導入は行わない。



最終ビルドshared-ng-local-edits-ui-build.log成功4m32s。全3版APK生成/固定hook保持PASS。242は最終試験51項目PASS（shared-ng-local-edits-ui242-final-runtime.log）。ユーザーが『一つのバージョンで確認できたらプレリリースしていい』と明示したため確認範囲を公開ノートに記載して先行配布する。226/191の最終画面検証は継続し、未完了を成功として数えない。エミュレータRAM4096で226導入中に応答不能、当該AVD/portのプロセスのみ停止して3072でcold boot、データ消去なし。



追加確認完了: 最終MPPから生成した242=51項目（shared-ng-local-edits-ui242-final-runtime.log）、226=51/191=48項目（shared-ng-local-edits-ui<版>-final-runtime-retry.log）成功。3072MiBでの再起動後は226/191も署名照合install-r Success。同期/再読込/元へ戻す/不正regex拒否/編集dialogの実ボタン/キャンセルとチェック保持を検査。試験用SharedPreferencesの専用namespaceで正常save/resetを確認し、実ユーザー設定の編集保存は行わない。UIのvalid saveの状態遷移はストア/overlay/indexの試験と、実dialogのinvalid/cancel試験に分けて確認。画像取得のscreenshotは0bytesで視覚確認に利用できず、スクショ目視成功とは扱わない。



最終MPPの通常native回帰も全3版成功: 191=276、226=285、242=282項目（shared-ng-local-edits-ui<版>-reader.log）。標準本文/画像/模擬投稿dialogの成功終了/拒否時入力保持、HTTPS ONを確認。公開POST0。RAM3072で開始時刻以降のcrash buffer0行（shared-ng-local-edits-final-crash.log）。今回もCI配布物自身の再導入ではなく同一製品ソースのローカル最終MPPで確認。



1.25.0-dev.7検証用公開完了: CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42372305439 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.7 / 2026-11-07 21:29:21 JST。APIでprerelease=true/draft=false、配布MPP/bundle JSON2個/任意ZIP3個を確認。MPPを実ダウンロードし7003901bytes / SHA256 b07953c30763e9024d9a1a303c5e53b43cda50c50933e689cdea964174c73870。pre JSONのversion/download_url一致。ソース6ea80066、CI生成860c596aをff-only取得、生成ファイル手編集なし。公開開始時点の1版先行配布の説明は保守的なまま維持したが、公開待ち中に全3版の専用試験/通常native回帰を完了。配布MPP自体の再パッチ/導入は未実施。



## 2026-11-07 外部板の報告URLと元URL連携（ローカル候補・未公開）

詳細 docs/site-url-bugs-20261107.md。爆サイ佐賀/長崎/大分のacode10→20転送に対応し、ctgid/bidの板identityを保持して一覧/ページ分割リンクを解析。ふたばニュース表の括弧付きfontと数字fontに対応、配布は非掲示板のため新menu対象外/既存には理由表示。あにまんの星+VS文字化けはAndroid charset.canEncodeのfalse-positiveが原因で再現、roundtrip検査+NCR保持に修正。登録済みでONの板の元URLを標準URLルートで開き、コピー時は元URLへ戻す。サーバー変更/公開POSTなし。通常Lint/R8成功4m23s、ホスト20/16/98/1288項目成功。


最終Android検証: emulator-5580の3072MiBで191=307、226=316、242=313項目PASS（site-url-bugs<版>-runtime.log）。実配信された2件のHTMLをfixtureとして読み、元URLからOpenUrlActivity経由で標準本文画面を起動し308/82レス表示を確認。Java/Androidの文字参照を含むtitle roundtrip、元URL→既存登録identityの変換、元URLのコピー用文字列（タイトル＋URL形式含む）、manifestハンドラー、OFF時の有効化なし、既存画像/模擬投稿dialog/HTTPS ON/停止時解除も成功。公開POST0、実サイトの投稿受理は未確認。試験終了時刻まで新規crash buffer0行（site-url-bugs-crash.log）。

固定hook verifierの最初の実行は既存4番目引数の不足で失敗し、dev.7の既存wrapper/fallbackと比較するよう検査を調整。242の検査のみホストXmx192mではDEX3組保持でOOMになったため384mで再実行してPASS。製品APK生成/実行のOOMではない。全3版でnative parser fallbackとregistry/settingsのレジスター・元命令保持を確認。APK/MPP/署名はandroid-installations.md。製品ソースの最終ビルド後に変更したのは試験/文書だけ。

公開は行っていない。あにまんの過去の取得失敗は未再現、爆サイの全失敗を網羅したとは扱わず、具体的な失敗URL/エラー詳細を照会中。今回修正した地域転送・ニュース表・Unicode・元URL連携の検証完了とは区別する。



公開指示追補: ユーザーが『プレリリースして』と指示。前記の最終3版検証結果を確認し、未再現/未解決の範囲を公開ノートへ明記したうえで、b040af13の製品変更を既存dev Semantic Release経路で検証用公開する。生成ファイルの手編集なし。



1.25.0-dev.8検証用公開完了: Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42375411673 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.8 / 2026-11-07 22:11:26 JST。APIでprerelease=true/draft=false、MPP/bundle JSON2個/任意ZIP3個を確認。配布MPPを実ダウンロードし7005493bytes / SHA256 0378c0d146ef9c5c96d2ef741c0956bac320108c6ca6536680b4a10049c4806b。pre JSONのversion/download_url一致。製品ソースb040af13、公開ノートd23e32ec、CI生成ab2cc9f0をff-only取得、生成ファイル手編集なし。配布MPP自体の再パッチ/導入は未実施、同一製品ソースの最終ローカルMPPで前記3版を検証。あにまん未再現の取得失敗/爆サイ全失敗未特定/実サイト投稿未確認をRelease本文に記載。



## 2026-11-07 あにまん7596018の503（修正・検証中）

詳細 docs/animanch-mobile-pagination-20261107.md。Android実通信でOP+最新200だけ返るモバイル分割を確認し、同一スレのpaginationリンクをたどって連番を復元する処理を追加。ホストは新規295/既存228/報告20項目成功。191での最終本文表示/実通信確認中。公開なし。



## 最終確認と公開指示（2026-11-08）

最終製品ビルドreadability-build.logは通常Lint/R8を含め4m38s成功。build/animanch-7596018/readability.mpp SHA256 7369b41dc79a2ba492d906509c2cb2ecd7b851037cb4039da122100e3aef75ea。191の既存固定hook/native fallbackのレジスター・元命令保持PASS。同署名更新した最終APKでfinal-reader191.logの585項目PASS。ソースの最終ビルド後に変更したのは試験/文書だけ。226/242の最終APK生成/端末試験は未実施、共通extensionの修正を含めて配布するが確認済みとは記載しない。

実copyhelper→ClipboardHistory→ClipboardManager経路で元URLの格納を確認。ポートなし/HTML/URI/複数item/無関係なportの維持も成功。まどドラ82レスは標準rendererのnative本文と元DATを全行照合し、全内容/改行/引用/画像URL/番号/Unicode保持を確認。表示上の横方向スペース連続・行頭末スペースだけを揃えて比較し、改行は比較対象のまま維持した。NG用sharedReportInputsはHtml.fromHtmlでネイティブplain本文の改行を再正規化するため、これを表示本文として比較していた初期試験は不適切であった。native rowの本文そのものへ修正し、空白整形の差を除いて全件一致を検査。先行の失敗は成功へ数えない。

分割あにまん275レス/爆サイ1001行は隔離した実HTML+合成継続ページによる標準本文表示成功。爆サイの全1000レスを実通信取得したという意味ではない。実通信のあにまん報告URL7596018は、最終候補で初期ページ/1ページ目をHTTP200取得し、gatewayからnativeDatRows=329で成功（final-live.log）。初期のレス重複・欠落による503は解消を確認。採取時刻でレス数は増加している。

通常の本文/画像/模擬投稿dialog/HTTPS ONも成功。公開POST0。readability-test-start以降のcrash buffer0行（final-crash.log）。実機変更/アンインストール/データ消去なし。ユーザーが『終わったらプレリリースして』と明示したため、確認範囲を記載してdev Semantic Releaseで公開する。



1.25.0-dev.9検証用公開完了: Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42388373374 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.9 / 2026-11-08 00:56:19 JST。APIでprerelease=true/draft=false、MPP/bundle JSON2個/任意ZIP3個を確認。配布MPPを実ダウンロードし7007273bytes / SHA256 ec737c477b5bcd27d1367277310be7896468c021bd767642d22e8d5c8401d04d。pre JSONのversion/download_url一致。ソースbea511d3、CI生成9335c79eをff-only取得、生成ファイル手編集なし。配布MPP自体の再パッチ/導入は未実施、同一製品ソースの最終候補で191の585項目と実通信329行確認済み。226/242の今回の最終候補未検証と、爆サイ1000返信は合成継続ページによる試験である点をRelease本文に記載。



## 2026-11-08 外部板の投稿結果/爆サイ空画面（ローカル修正中・未公開）

詳細 docs/site-post-bugs-20261108.md。ふたばoe934731は実フォームのjs=offのままで投稿成功することを確認。初回Cookie拒否とタイトルなしmeta refresh成功に対応し、HTTPセッションCookieをメモリ内で保持、厳密な非投稿拒否時だけ手動再送を許可。公開test投稿1件（以前のユーザー許可範囲）、他の拒否応答は送信成功扱いしない。あにまんはthread/number受領証で成功を判断し、未使用のjumpに依存しない。実送信はpreCheck403により未確認。

爆サイ13585881はモバイル初回OPなし/selectedなしで再現、p=1だけでは実通信503が残ることを確認。空モバイル画面に限り同一URLのPC表示を1回試す。PC版は記事を返すがレス数2に対し一覧は空。明示的な空一覧を確認した場合は記事と番号維持した未取得枠を返し、理由を表示する。取得できない内容を復元済みと扱わない。先行候補191は594項目PASS、最終PCfallback/未取得表示を追加した版は再ビルド/検証中。ユーザーの新しい公開指示はまだなく、push/Releaseは行わない。


最終確認完了: build-final.log通常Lint/R8を含め4m13s成功。191固定hook保持PASS、同署名更新、native191-final.logの595項目PASS。live-bakusai191-final.logで報告URLのHTTP200/166657bytes、nativeDatRows=3成功。実応答は記事1/実レス0/空一覧notice1で、DAT3行は記事1+理由付き未取得枠2。レス2件まで取得済みと扱わない。crash191-final.log0行。MPP/署名/APKハッシュはandroid-installations.md。あにまん実送信と226/242最終画面は未確認。未公開、ローカル修正のみ。


公開指示追補: ユーザーが「プレリリースして」と明示。上記の最終検証結果と未確認範囲を公開ノートに記載し、既存dev Semantic Release経路で検証用公開を進める。生成ファイルの手編集なし。


1.25.0-dev.10検証用公開完了: Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42392811838 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.10 / 2026-11-08 01:49:36 JST。APIでprerelease=true/draft=false、MPP/bundle JSON2個/任意ZIP3個を確認。配布MPPを実ダウンロードし7008320bytes / SHA256 5cadd6acd57aec061ca6ca2c0f3b7853d3c71baec466b3238c115e9a78ff23d9。pre JSONのversion/download_url一致、公開ノートの内容と未確認範囲を確認。最初の公開JSON対ローカルのbyte比較はLF/CRLF差で失敗したため、実際の改行数を確認し、JSONの全内容一致で成功を確認。製品ソースddb95e01、公開ノート96bfaf4e、CI生成fd2f4eeeをff-only取得。生成ファイル手編集なし。配布MPP自体の再パッチ/導入は未実施、同一製品ソースの最終ローカル候補で191の595項目と実爆サイ記事1+未取得枠2を確認済み。あにまん実投稿と226/242最終画面未確認、爆サイの元サイトが返さない2レスは未取得であることをRelease本文に記載。


## 2026-11-08 爆サイ3099994の503（修正・検証中）

詳細 docs/bakusai-reader-identity-20261108.md。実191/host WebView UAで全件取得失敗を再現、p=1/p=3でもselected2/レス2〜8だけ返り本文/レス1/9〜15が欠落。クライアント名Haiagaruの応答は本文+15レス全16件。通常爆サイへの他サイトbrowserUaの流用を止め、当該サイトの認証利用ON時のみブラウザUAを維持。ホスト39/16項目PASS、製品ビルドと191最終検証中。新規公開なし。


最終確認完了: build.log通常Lint/R8を含め4m1s成功。191固定hook保持PASS/同署名更新/native191-final.log598項目PASS。after-live.logで実HTTP200/184505bytes、16 DAT行/標準スレ画面16件表示成功。gateway-source.rawにOP+res1〜res15の実在を確認、未取得枠ではない。既報ニュースURLもHTTP200/3行、crash191.log0行。最初のnative試験は追加fixture板の期待数未更新による試験側の失敗で、期待を5件へ更新後、同じ製品APKで全件成功。226/242/実機最終画面/実投稿/認証利用ON実通信は未確認。ユーザーが完了後プレリリースを明示したため既存CIで公開する。


1.25.0-dev.11検証用公開完了: Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42431357383 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.11 / 2026-11-08 09:52:55 JST。APIでprerelease=true/draft=false、MPP/bundle JSON2個/任意ZIP3個を確認。配布MPPを実ダウンロードし7008656bytes / SHA256 627e169012156f08195051055003982e81da0fe04da34944216e18dfde98fdd5、GitHub asset digestも一致。pre JSONのversion/download_urlとローカルJSON内容一致。ソース5db4526a、CI生成ea455787をff-only取得、生成ファイル手編集なし。配布MPP自体の再パッチ/導入は未実施、同一製品ソースの最終ローカル候補で191の598項目と報告URLの実HTTP200/本文+15レス/標準画面16件を確認済み。226/242/実機/認証Cookie利用ON実通信/実投稿の今回の未確認範囲をRelease本文に記載。

## 2026-11-08 外部板のスレ日時・勢い／地域別本文取得

詳細 docs/site-thread-dates-20261108.md、docs/bakusai-menu-thread-audit-20261108.md。固定191/226/242の表示・計算読み出しへ真のOP日時を接続し、仮想ID/URL/履歴は保持。最大同時2、待機200、RAM2000、SQLite20000のメタデータキャッシュ。日時不明をIDから推測しない。勢いによるソート順序は今回未変更・未検証。

既報の15メニュー全てから実板・実スレを確認。47都道府県雑談+15地域運輸+災害4+サッカー1の計67板各1スレで、66スレ全件取得。山梨の1スレは元HTMLに#6がなく、取得できたOP+7レスと理由付き未取得枠を表示する修正を追加。全板/全スレの網羅とは区別。初回は元サイト200エラーが多く、Cookie保持と2秒以上の間隔で再検証。BBS新形式#thrListInnerも対応。

製品最終build-release.logは通常Lint/R8込み3m28s成功。MPP build/external-board-dates/release.mpp SHA256 70f692c5331f16379ba2b77bfae30e699f0f8bb389758f797a551169c8e4c1f3。以後の製品ソース変更なし。3版とも固定hooksとwideレジスター/元命令保持PASS。同署名更新、最終191615/226621/242618項目PASS、3サイトの日時表示と標準本文/画像/模擬投稿/元URL/HTTPS ON成功。191最初の不合格はタブレット別ペインを検査していた試験側の不備で、板キー/ホスト/ポート一致へ修正後、同じ製品APKで全件再成功。

191実通信の栃木運輸・交通12167020はHTTP200/199481bytes、31 DAT行/標準画面31件。サッカー国内13031645はHTTP200/183618bytes、20 DAT行/標準画面20件。公開投稿0、crash-final.log0行、実機変更/アンインストール/データ消去なし。実機・長時間利用・今回の実投稿・認証Cookie利用ONの実通信は未確認。APK/署名/MPPはandroid-installations.md。

共有NGの保存・同期・管理者復元処理も更新。GASは既存URLのversion17へ反映済み。サーバーの隔離モック65項目と既存スイート全件、Androidの永続状態17項目、3版での隔離Senderによる送信待ち/再試行/ACK/取消を確認。試験票は本番へ送信していない。運用基準はユーザー指示によりRelease説明へ記載しない。管理者向け手順・デプロイ画像・書換前バックアップはbuild/shared-ng-feedback-live内に保存。

ユーザーの完了後プレリリース指示に従い、確認範囲を既存.releasercのheaderPartialへ記載してdev Semantic Releaseで公開する。生成ファイルは手編集しない。

1.25.0-dev.12検証用公開完了: Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42437817930 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.12 / 公開2026-11-08 11:21:17 JST。APIでprerelease=true/draft=false、MPP/JSON2個/任意ZIP3個を確認。配布MPPを実ダウンロードし7023433bytes / SHA256 ecbbe4a14469c63e1aede7eabb7f05ca02ee12c69f5b58eb29face64d415164a、GitHub asset digestと一致。pre JSONのversion/download_url、両公開JSONとローカル全内容、公開devメタデータのversion/download_url一致。公開説明に非公開の運用条件・内部管理仕様が含まれていないことも確認。

製品ソース9872beef/b624f64d、CI生成0822ab33をff-only取得。生成ファイル手編集なし。配布MPP自体の再パッチ/導入は未実施。同じ製品ソースの最終ローカルMPPで前記3版の615/621/618項目と実通信2件を確認した。代表スレ検証であり、全スレ網羅・長時間使用・今回の実掲示板投稿・勢いソートは確認済み扱いにしない。

## 2026-11-08 爆サイ求人一覧（ローカル修正済み・未公開）

詳細 docs/bakusai-recruitment-20261108.md。福岡829の#thr_list3直下リンク+日時+(n件)形式を共通パーサーへ追加。タイトル/他行/広告/他板の数字を拾わず、0返信もOPを含む。通常スレのない求人一覧では注意喚起リンク/外部求人掲載情報であることを表示。新規のクラス走査/ネイティブhookなし。47都道府県×求人3カテゴリ=141板の1ページ目を実通信検査し、通常スレがあった54板（お水46、風俗8）は各1スレの本文・返信全件取得成功。残87板は通常スレなし。2ページ目以降の全件確認ではない。

ホスト13/既存25/既報16項目成功。通常Lint/R8込み3m55sビルド成功、191固定hook保持PASS、最終候補のエミュレータ615項目成功。実福岡一覧25行、代表5262240は2DAT行/標準画面2件、新規crash0行。MPP SHA256 40ea375157908c8a37f25585cda387410995fbec14cfbdc6b4220b5cfccb6b10、APK/署名はandroid-installations.md。226/242の今回の最終画面は未確認。公開投稿0、実機変更/アンインストール/データ消去なし。今回の追加修正は未公開、dev.12配布物には含まれない。

公開指示追補: ユーザーが『プレリリースして、テストしたURLを教えて』と明示。前記の検証済み候補を既存dev Semantic Release経路で公開する。既存.releasercの公開説明を求人板対応と確認範囲へ更新し、全141板/54スレの検証記録へのURLを掲載。生成ファイル手編集なし。

1.25.0-dev.13検証用公開完了: Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42441644813 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.13 / 2026-11-08 12:15:41 JST。APIでprerelease=true/draft=false、MPP/JSON2個/任意ZIP3個を確認。配布MPP実ダウンロード7023639bytes / SHA256 2044fe17e9eac79357958c897770ef673090b7719af4022ab3ad1891cf7f7a53、GitHub asset digest一致。pre JSONのversion/download_url、公開JSON2個とローカル内容一致。検証URL一覧と226/242の今回未確認範囲がRelease本文に掲載されていることも確認。製品ソースb24e2de5、CI生成ff2f47b4をff-only取得。生成ファイル手編集なし。配布MPP自体の再パッチ/導入は未実施、同一製品ソースの最終ローカルMPPで前記191615項目・実一覧25/本文2件を確認済み。

## 2026-11-08 闇バイト関連ニュース（検証済み・公開準備）

詳細 docs/bakusai-yamibaito-news-20261108.md。静的HTMLにない関連ニュースAPI（newsFlg=true,key=YamiNewsTidList）の実59スレを標準一覧へ接続。北海道一般求人等の注意喚起リンクしかない一覧も同じ実ニュースへ接続し、自動ブラウザ起動案は撤回。元スレの正式URLをスレID/板ID一致で検証し、本文/コピー/返信先に使用。APIに件数がないので明示した経路に限り未確認0件、本文取得後は実件数へ。通常板の件数チェックは維持。対応情報上限256、一覧時まとめて保存。

ホスト71/求人18/旧URL等25/既報レイアウト16項目成功。初回の製品subject変換が0を拒否した503を修正して再ビルド。最終count-build.log5m7s成功、以後の製品ソース変更なし。reader.mpp SHA2569b7339bcdc50e3c4cf41b3ddced83e17cb130e7a37b094506144ebf591178940。全3版固定hook保持PASS、641/647/644項目成功。ニュース一覧59件/代表本文3件、元URL/設定無効/元板なしの新規作成拒否、通常本文/画像/模擬投稿/HTTPS ONを検査。試験の画面外日時・古いActivity参照・操作順の不備は試験側を直して同じ製品APKで再検査、初回不合格は成功へ数えない。191実通信でニュースAPI200/subject59行と代表13607621実HTTP200/163435bytes/DAT3行/標準画面3件。公開投稿0、crash0、実機変更/データ消去なし。全59スレ本文網羅/実機/長時間/実投稿は未確認。ユーザーのプレリリース指示に従い既存CIで公開する。

1.25.0-dev.14検証用公開完了: Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42451791021 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.14 / 公開2026-11-08 14:45:53 JST。APIでprerelease=true/draft=false、MPP/JSON2個/任意ZIP3個を確認。配布MPP実ダウンロード7026001bytes / SHA256 2c401a4c3506408a91065a064fb07c333670bdac76ad5eee75d1a2800e0ba5bc、GitHub asset digest一致。pre JSONのversion/download_url、公開JSON2個とローカル内容一致。公開説明の静的HTML見落とし訂正・59スレの一覧・代表本文/3版検証・未確認範囲も確認。製品ソース1917d920、CI生成7c06ad88をff-only取得。生成ファイル手編集なし。配布MPP自体の再パッチ/導入は未実施、同一製品ソースの最終ローカルMPPで前記3版641/647/644項目・191実一覧59/本文3件を確認済み。

## 2026-11-08 板一覧更新通知のクラッシュ修正（未公開）
利用者の11/08 17:49:27と追加11/07 22:39:05は191の同じadapter/ListView件数不一致。原本notifyDataSetChangedがsuper通知の後にdirtyフラグを立て、UI同期observerへ古い件数が渡ることを191/226でexpected120/observed0として再現。固定2classのconst/iputを通知より前へ移動、元命令とレジスター保持。全クラス走査・例外抑制なし、242の新規hookなし。
通常Lint/R8 build5m9s/91tasks成功。原本通知＋直前候補比較で191全10/226全11メソッド保持成功。emulator-5580の既存reporter191/226を同署名install-r、各141項目のnative observer/直接ListView件数/実measure-layout-scroll試験成功。gateway/native reader・画像・composer等641/647項目成功、公開投稿0、新規crash buffer空。初回gateway191はSystemUI ANRダイアログにfocusを奪われclipboard確認失敗。実UI dump/dumpsysで原因確認しダイアログを閉じて再実行、製品の失敗とは混同しない。
追加ログ01:03/01:05のBbsPreference castは現行のroot sibling配置対策済み（回帰試験でも確認）。03:22/03:23のFrameLayout null childは既存VideoThumbnailRetry延期対策を再確認し、製品ソースを使った128件×8回等34項目成功。ただしログのみで別経路/報告元の適用MPPは断定しない。
MPP build/board-adapter-test/fixed.mpp SHA256 7f7c7775db895dc2834192b52bb4693e6ad479896b5db462535f9b4a1c9f205a。APK/署名/導入時刻はandroid-installations.md、詳細board-list-notification-crash-20261108.md。実機変更・データ消去・リリースなし。

## 2026-11-08 共有NG容量削除・爆サイの汎用ページ取得・HOME位置保持（未公開）
受信済み共有NGキャッシュ削除を設定へ追加。確認と容量表示、専用AtomicFile/gzip/.bak/.newだけ削除して受信OFF、ルール/MatchPlan解放、世代更新で古い同期/読込の再公開防止。削除中オン/同期抑止、個人NG・除外・端末内編集・報告キュー保持。実ファイル/容量/設定/再取得停止＋全文エラーdialog22項目成功。
爆サイ8520877はunpaged HTTP200/thr_res:759→明示的p1取得、途中の#threadBody内#thr_pagerだけの枠をOP誤認していたのを共通parserで分離。初回が旧ページの場合も最新番号不足からp1取得。実native HttpTransportでGET12/552行/うち51未取得（元サイト759/778）、本文+500レスを確認。残51件を成功/削除扱いにしない。新規568/1000レス1435/mobile99/旧反復39/個別欠落13/parser25成功。BKS-759の短い先頭メッセージ＋再アクセス案内、元番号を全文dialogにも表示。詳細shared-ng-cache-bakusai-pages-20261108.md。
HOME191の更新完了e(me)はevent.d=true/e=b=0の時n_で先頭へ移動。実native fixtureで130行目→0行目を再現4項目。固定38命令/register7の1命令だけNOP、元43メソッド比較成功。最終候補で4回更新の可視行/offset保持・手動先頭移動12項目成功。build1m37s。最終191 gateway/本文/画像/composer/設定641、板一覧141、共有NG容量/エラー全文22成功、crash buffer空。226は共通修正候補647成功。詳細home-refresh-scroll-20261108.md。
最終MPP build/home-refresh-scroll/final.mpp SHA256 29992532c912383f529804538e7e02740065f942b518f1a38371177c58d2666d、191APK final191.apk SHA256 e065e8da5659025283131c799ed6fa906bde23d5d55117f14338ac34c9f3a901。emulator-5580/reporter191署名一致更新、台帳記載。試験fixture/アクセス権/反射修正での失敗はdocsに記録し成功と区別。ADB VIEW起動を含むコマンド1件automatic approval review拒否（blocked by policy）後は許可される隔離native試験を使用。実機変更・データ消去・push/Releaseなし。

公開前242追加検証: 同じ最終MPPを242へ適用し署名一致install-r、gateway/native本文/画像/composer/設定644項目成功、公開POST0、crash buffer空。191=641/226=647/242=644、共通削除/エラー全文22・HOME191位置12・板一覧191/226各141は前記通過。利用者のプレ公開指示で既存Semantic Release CIへ進む。

## 2026-11-08 1.25.0-dev.15プレリリース公開完了
利用者のプレ公開指示でd883b393をpush。初回CI42473158784/再実行はGradle9.8.1配布zipの10秒timeoutで失敗、未公開。既存release.ymlだけでCI作業コピーのwrapper download待機120秒/retries2へ調整（21ab7b48）、Semantic Release CI42477370058 success。公開 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.15 / 2026-11-08 20:54:40 JST / draft=false/prerelease=true。CI生成2f48147eをff-only取得。配布6assetの実download/size/SHA256/GitHub digest/ZIP CRC、JSON2個のversion/download_url/生成ファイルとの意味一致、公開説明のHOME/容量削除/爆サイ未取得51件を確認。Windowsの改行差で初回JSON byte比較だけ不一致、parsed JSON一致で確認。MPP7031545bytes SHA256 a51f9c812d812a500f0602cfd7cbc2b0fc1ebc735960bd498d20fb1ce9f30d8b。build/release-1.25.0-dev.15-verify/verification.json参照。masterの正式版1.24.1は変更なし。配布MPP再適用/実機更新なし。
その後のサムネイル重なり/音声focus/異体字selector初期ONは未公開の作業中差分であり、このdev.15には含まれない。

## 2026-11-08 サムネイル重なり・音声focus・異体字セレクタ（修正・検証済み、未公開）

詳細 docs/thumbnail-focus-emoji-20261108.md。失敗サムネイルの操作がnative返信popupへ重ならないよう祖先経路の後続描画を検査、透明toolbarコンテナは子の描画位置で判断。実Androidレイアウト41項目成功。Haiagaru専用プレイヤーはAPI26以降でprepare時のfocus要求を停止し、実再生時だけ要求。投稿コピー/表示のFE0E/FE0F除去と表示U+FFFD除去を初期ONの独立設定に追加、TXT選択不要。ZWJ/漢字IVS/保存DAT/下書き保持。242の実constructorコピー検証で既存の投稿bodyフィールド対応誤りも検出し修正。

ホスト文字処理12、先行191実文字処理/focus12・画面回帰641、226実nativeコピー/focus15成功。最終buildはPCメモリ不足からエミュレータを停止して再試行し通常Lint/R8込み3m46s成功。最終MPP a586f64df94ee690dbccfd8ecf54e96857b174b95e05677b2c072a2b90f97e45で242を同署名更新しnativeコピー/focus15・画面回帰644成功。公開投稿0、crash-final.log空。最終MPPの191/226再導入、YouTubeアプリそのもの、標準プレイヤー、API25以前、実機、長時間利用は未確認。実機変更・新規リリースなし。公開dev.15にこの3点は含まれない。

## 2026-11-08 1.25.0-dev.16プレリリース公開完了

利用者の公開指示で19b984ddをdevへpush、既存Semantic Release CI42483021247 success。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.16 / 2026-11-08 22:07:48 JST / prerelease=true,draft=false。CI生成143a7704をff-only取得。6asset実download/size/SHA256/GitHub digest、ZIP/MPP CRCとJSON2個のversion/download_url/ローカル生成ファイルとの意味一致を確認。MPP7034834bytes SHA2567b2bc4e33b168247dd198ce8aedb996e616e5d20ba09365e3bef5e18b4bd5e9d、build/release-1.25.0-dev.16-verify/verification.json参照。公開説明に3点修正/242投稿コピー/確認範囲/未確認範囲あり。配布MPPの再導入/実機変更なし。次のIP表示スレ回線別警告は本リリースに未包含。

## 2026-11-09 Morphe ManagerのCHANGELOG見出し日付（公開反映済み）
利用者がCHANGELOGの直接修正を明示したため、日付なし見出しを公開日付きへ修正。dev104/master87/main87箇所、本文/既存日付は保持。GitHub公開日を優先し、公開記録がない19箇所は既存リリースタグのcommit日付（UTC）で補完。今後の.releaserc headerPartialは「# Haiagaru {{version}} ({{date}})」。JSON/MPP/バージョン/Releaseは変更せず、docs [skip ci]でdev e32dd51b/master614a350d/main11052a7eへ反映。master/mainは別indexで最新remote親から2ファイルだけのcommitを作り、他作業のソース差分を含めない。初回atomic pushは古いremote追跡refにより拒否され、3branchとも未更新。明示fetchで最新README等を保持して再作成後、atomic push成功。公開raw3branchのCHANGELOG/.releasercが準備ファイルと完全一致、見出し・本文保持・将来テンプレートを確認。証跡build/changelog-manager-20261109。実機はADB接続0件のためManager内再表示は未確認。

継続差分: IP投稿警告/参考IP確認/設定リンク対応はローカルのみ。build/ip-post-warning/build-verified.logは通常Lint/R8込み5m10s成功。まだ候補APK適用・エミュレータ試験・設定リンク一覧の再取得は未完了で、実装済みと端末確認済みを区別。利用者の次の優先依頼はkenmo.orgのスレ一覧「記者だけをNG」と爆サイ8520877再取得後のDAT/本文更新。実機接続待ちでもコード/隔離試験は進める。

## 2026-11-09 kenmo記者ID・エッヂ板名・IP警告（検証完了、プレ公開指示あり）

詳細kenmo-edge-bakusai-20261109.mdとip-post-warning-20261108.md。kenmoの記者IDをsubjectから保存しDAT読了後に復元、板ごとに分離して「記者だけをNG」を利用可能にする。エッヂ現行トップページのスレリンクを板名へ誤解析する経路を単一正規板メニューへ変換。実ページを含むホスト履歴44/表示42/板一覧40/IP判定34項目成功。

最終通常Lint/R8 build5m2s成功。MPP7eb16e33d30ebbf4adb539f5f1ccb52881fb72ecef2a7a37dd5325205af3f09a。全3版で固定submit元命令/register/try保持と表示hooks確認、各版IP68/板一覧21/reporter-preview38成功、native gateway191583/226647/242644成功。191最初のIP画面試験3回はLauncher ANR/Bluetoothエラーダイアログに遮られ失敗、保存UIを確認してシステムダイアログを閉じ、製品を変えず再成功。公開投稿0/実IPサービス問合せ0、最終crash buffer空。設定リンク実取得を統合し190設定400操作、曖昧名なし/全command clickable。

爆サイ実機8520877は保存DATとgateway新規DATが一致、552行うち51は元サイト759/778。隔離same-count本文A→B試験は実スレID確認後の通常更新でnative表示変更成功。旧試験のcomposer画面取り違えを修正し、無根拠な製品DAT削除・更新hookは追加しない。51件取得成功とはしない。

実機730eae72の既存reporter191へ署名一致install-r成功、ResListActivity focus/起動と導入後crash空を確認。日常用アプリ変更/データ消去なし。実機の各機能通し操作/長時間/実回線切替/実投稿は未確認。導入詳細はandroid-installations.md。利用者がプレ公開を指示したため既存Semantic Release CIへ進む。無関係な未追跡frida-thread-open-timing191.js/shared-ng-reporter-blocks-runtime.jsは保持し公開commitへ含めない。

## 2026-11-09 1.25.0-dev.17プレリリース公開完了

ソースd73afd86をdevへpush、既存Semantic Release CI42502027935 success。公開 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.17 / prerelease=true,draft=false。CI生成7774bdaaをff-only取得。生成ファイル手編集なし。配布6assetを実downloadしsize/SHA256/GitHub digest/ZIP・MPP CRC、JSON2個のversion/download_url/ローカル生成内容と公開devフィードの意味一致を確認。日付付き見出しと今回の修正内容・確認範囲・未取得51件が公開本文へ含まれることも検査。配布MPP7040706bytes / SHA2568fb8e0ed01f62d60aea38c8287142969b551647fb075c2fab45e0da20d6655ce。証跡build/release-1.25.0-dev.17-verify/verification.json。

配布MPP自体の再パッチ/再導入は未実施。同じ製品ソースのローカル候補を前記3版で検証し、実機191へ導入済み。正式master版1.24.1は変更なし。

## 2026-11-09 閲覧済みレスの再通知・ミュート中フォーカス（修正・検証済み、未公開）

詳細thread-watch-read-mute-20261109.md。未修正242で監視count12/native read_count20/subject20の再通知を再現。標準既読数を監視前と本文取得後に読み取り、確認済みより前の本文候補を除外。巡回取得数は既読判定へ使わず、初回無通知・真の未読通知・返信限定・重複排除を維持。標準DBへ製品処理で書き込まず、新規native hookなし。

専用VideoViewのPlaybackAudioFocusへミュート状態を接続。ミュート中の要求停止/保持済みの解放、再生中の解除時だけ再取得、停止中解除は要求なし、遅延喪失で無音再生を止めない。VideoView側の自動要求が無効なAndroid8以降が対象。Android7以前/標準プレーヤー/YouTubeアプリそのものは未確認・対象保証外。

最終通常Lint/R8 build4m1s、MPP06c27e804edcc04e5dee39d54090c44e387a4d0635fa6e67744b0ef787f3082b。3版で通知各40・音声等19120/22623/24223、基本画面gateway191641/226647/242644成功、公開POST0・最終crash空。191初回通知試験失敗後、診断追加のみで同じ製品が成功し、試験の非同期反映待ちを追加後3版再確認。226gatewayは一度port EADDRINUSE、同じ製品の再試行で成功。失敗の詳細と未断定の点も詳細docへ記録。

emulator-5580の既存reporter3版へ署名一致install-r。試験用通知権限を元の3版OFFへ復元、fixture行・登録・通知を削除。実機は未接続で今回変更なし。コード・検証記録はローカルのみ、commit/push/Releaseなし、公開dev.17に含まれない。無関係な未追跡2スクリプトは保持。

## 2026-11-09 1.25.0-dev.18プレリリース公開完了

利用者のプレ公開指示でソース128de6afをdevへpush、既存Semantic Release CI42609141906 success。公開 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.18 / prerelease=true,draft=false。CI生成86754f73をff-only取得、生成ファイル手編集なし。配布6assetを実downloadしsize/SHA256/GitHub digest/ZIP・MPP CRCを確認。JSON2個のversion/download_url/ローカル生成内容と公開devフィードの意味一致、日付付き見出し・既読再通知とミュートの説明・Android8以降の対象範囲・実機等の未確認範囲も確認。配布MPP7041382bytes / SHA256fe5a3b7666bf9ed9f49a6f6a7a15edd651b8ac06795b0c17e263b67942572271。証跡build/release-1.25.0-dev.18-verify/verification.json。

配布MPP自体の再パッチ/再導入は未実施。同じ製品ソースのローカル候補で前記3版の通知/音声/基本画面回帰を確認済み。今回の実機導入・正式master版の変更なし。無関係な未追跡2スクリプトは公開commitへ含めない。

## 2026-11-09 カスタムアイコンの拡大・投稿前U+FFFD除去（検証済み、プレ公開指示あり）

詳細toolbar-icons-post-cleanup-20261109.md。アプリ内画像設定の191でBitmapDrawable subclassの24dp上書きがConstantState複製に引き継がれず、63px→256pxとなることを再現。表示用bitmapの実サイズ/密度を24dpへ固定して別cacheとし、保存画像256PNG・色・透明・配置・キーは保持。推奨256×256透過PNG/最大16MiBを案内。Morpheパッチ時画像オプションは未変更。

送信用本文だけからU+FFFDとdecimal/hex NCRを除去。空白・改行・名前・タイトル・入力中の下書き・保存DATは保持。既存の191body bridge/226/242送信copy経路へ接続、表示設定とは独立・追加設定なし・native hook変更なし。純粋文字処理12項目成功。

先行アイコンのみ19142/641成功。最終通常Lint/R8 build3m50s、MPP4fece41a4b0a1cad5f50d1bc84567fcb7cea823b32aaa2dc5ab757075ad2b1b0、3版でnative画像各42/投稿前等19127・226/242各30/native基本画面191641・226647・242644成功、crash空、公開投稿0。

191の最終基本画面試験2回はローカル80/443接続エラーで停止。左ペイン77タブに古い未登録loopback板タブが残ることを確認し、コールド起動とFixtureTabSandboxによる一時分離（原本5キー退避・finally復元）後、製品を変えず成功。226/242も同じsandboxで成功。失敗を成功扱いにしない。実機・報告画像そのもの・長時間は未確認。導入詳細はandroid-installations.md。利用者がプレ公開を指示したため既存CIへ進む。無関係な未追跡2スクリプトは保持し公開対象外。

## 2026-11-09 1.25.0-dev.19プレリリース公開完了

ソース45ba85f3をdevへpush、既存Semantic Release CI42625301021 success。公開 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.19 / prerelease=true,draft=false。CI生成79098f90をff-only取得、生成ファイル手編集なし。配布6assetを実downloadしsize/SHA256/GitHub digest/ZIP・MPP CRCを確認。JSON2個のversion/download_url/ローカル生成内容と公開devフィードの意味一致、日付付き見出し・画像とU+FFFDの説明・推奨サイズ・実機等の未確認範囲も確認。配布MPP7041439bytes / SHA2568448c29e32df3070a5aa0f6ac231200132e4554bdb59bf176e87cd8c6aac221c。証跡build/release-1.25.0-dev.19-verify/verification.json。

配布MPP自体の再パッチ/再導入は未実施。同じ製品ソースの最終ローカル候補で前記3版のアイコン/投稿前処理/基本画面回帰を確認済み。実機導入・正式master版の変更なし。無関係な未追跡2スクリプトは公開commitへ含めない。

## 2026-11-10 設定文字列・投稿本文・検索・あにまん表示・保存操作（検証完了、プレ公開指示あり）

詳細settings-links-191-post-cleanup-20261109.md / thread-search-animanch-save-20261110.md。191の本文bindingへ設定リンクを接続、3版の固定送信用getterでU+FFFD/NCRを除去。元命令・レジスター・分岐を保持。導入時edgeArchiveToolbarIconPathを削除し内蔵24dpを使用、アプリ内画像設定は維持。ﾜｯﾁｮｲの閉じ括弧検索、あにまんのリンクカード/元画像URL/段落/被返信ナビゲーションを修正。元画像の表示ラベルと標準添付経路を両立。専用動画/GIF保存で通信容量確認を省略、権限・保存処理は継続。

11月7日191のmetadataTitle OOMは既存e93a25ffの対象。現行60項目（低heap5含む）再確認、最終3APKで履歴3入口に同期applyが残らないことを検査。新たな無条件履歴削除なし。

最終通常Lint/R8 build3m37s、3APK適用成功、MPP b25c84455b84da61f49f3d55cd4f806a03650f350ac553d7f7bda771e4e7c161。emulator-5580で標準画面/本文/画像/隔離送信191678・226684・242681、設定リンク各30、投稿前/再生等28/31/31成功。CSV対応文字列392/383/383が実出力と集合一致し全件リンク化。cleanup/tabRestoreエラーなし・公開投稿0・最終crash空。検索host266、あにまん新整形14/保存実ページ228成功。報告7585502は調査環境HTTP403、実機/公開POST/公開動画の保存完了/長時間は未確認。失敗候補と検証環境の不具合は詳細docへ記録、成功と混同しない。

既存reporter191/226/242へ署名一致install-r、実機変更/アンインストール/データ消去なし。導入台帳更新済み。利用者の指示で既存Semantic Release CIからプレ公開へ進む。無関係な未追跡frida-thread-open-timing191.js/shared-ng-reporter-blocks-runtime.jsは保持し公開対象外。

## 2026-11-10 1.25.0-dev.20プレリリース公開完了

ソース7d4e866fをdevへpush、既存Semantic Release CI42791081698 success（5m40s）。公開 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.20 / prerelease=true,draft=false。CI生成8f99b2d3をff-only取得、生成ファイル手編集なし。配布6assetを実downloadしsize/SHA256/GitHub digest/ZIP・MPP CRCを確認。JSON2個のversion/download_url/ローカル生成内容と公開devフィードの意味一致、CHANGELOGと公開本文の日付付き見出し・今回修正・確認範囲・HTTP403制限も確認。配布MPP 7042831 bytes / SHA256 c0441c570384f52357a75eda541676f62bfc8b1f710b3cf8a9c5069df6a1f1a1。証跡build/release-1.25.0-dev.20-verify/verification.json。

配布MPP自体の再パッチ/再導入は未実施。同じ製品ソースのローカル候補を前記3版で検証済み。今回の実機導入・正式master版の変更なし。検証エミュレータは終了。無関係な未追跡2スクリプトは保持し公開commitへ含めない。

## 2026-11-10 共有NGタイムアウト対策（検証済み、プレ公開指示あり）

詳細shared-ng-timeout-20261110.md。旧接続10秒/応答15秒に対しGASのロック待機自体が最大15秒、応答は約1.7MB。SharedNgHttpへ共通通信を分離し接続15秒/応答60秒、90秒の共通予算を確認、SocketTimeoutのGETのみ1回再試行。POSTは転送後を含め再送せず、既存queue/operationId維持。許可ホスト/HTTPS/転送制限/4MiB上限維持、タイムアウト案内を日本語化。審査・条件適用・GASソース/デプロイは変更なし。ネイティブフック変更なし。

実際の16秒遅延応答で旧設定失敗/修正後成功、host39項目成功。通常Lint/R8 build4m18s、3APK適用成功、MPP a15d940aa3c55ae6facc2cbad537dec9da9103c0ee84603996f306fb745ada74。emulator-5580の3版で実GAS3,853条件を1915962ms/2264805ms/2426219msで受信・解析、同期/保存/タイムアウトと不正JSON時の保持/POST再送禁止が各15項目成功。基本画面/本文/画像/URL648/653/651成功、公開POST0・最終crash空、復元エラーなし。実機/長時間/報告端末での同一症状は未確認。途中のDNS/ok-full判定失敗・試験診断追加の経緯は詳細docへ記録し、成功扱いしない。

既存reporter3版へ署名一致更新、導入台帳更新済み。実機変更/アンインストール/データ消去なし。利用者から明示的なプレ公開指示あり。無関係な未追跡frida-thread-open-timing191.js/shared-ng-reporter-blocks-runtime.jsは保護し公開対象外。

## 2026-11-10 1.25.0-dev.21プレリリース公開完了

ソース5f133c4bをdevへpush、既存Semantic Release CI42805025284 success（4m36s）。公開 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.21 / prerelease=true,draft=false。CI生成e13f8b53をff-only取得、生成ファイル手編集なし。配布6assetのsize/SHA256/GitHub digest/ZIP・MPP CRC、JSON2個のversion/download_urlと公開devフィードの意味一致、CHANGELOG/公開本文の日付付き見出し・共有NGの待機/GET再試行/POST再送禁止・検証と未再現範囲を確認。配布MPP 7043887 bytes / SHA256 e65dd1506b42b727fec607c7df2641da4eedef7e0e00468efa06aaa0f0ac0ccd。証跡build/release-1.25.0-dev.21-verify/verification.json。

配布MPP自体の再パッチ/再導入は未実施。同じ製品ソースのローカル候補を前記3版で検証済み。実機・GASデプロイ・正式master版の変更なし。検証エミュレータは終了済み。無関係な未追跡2スクリプトは公開commitへ含めない。

## 2026-11-10 GASのロック競合対策（サーバー反映済み）

詳細shared-ng-lock-20261110.md。HTTP待機延長では直らないロックタイムアウトを受け、配信キャッシュ生成をdouble-check付き単一ロック化、分割キャッシュRPCを集約。毎分の審査が数十秒〜数分ロックを占有する実行履歴を確認し、重複起動を短時間でスキップし、審査完了後に同じ行から配信キャッシュを更新。キャッシュのハッシュ・完全性・審査/票数/除外の回帰を含むNode516項目成功。

修正前のサーバーソースとの一致を確認後にPublish.gs/PersonalInbox.gsだけを保存、既存URL/権限を維持しGAS v19（2026-11-10 22:21 JST）へ更新。最初のv18とv19直後のGETは更新中エラー、既存実行の終了後の確認でHTTP200/ok=true/revision422/3,873条件/7.515秒を確認。失敗を成功扱いせず証跡と経緯を詳細docへ記録。GASだけの修正でMPPリリース不要。利用者の指示でエミュレータは実施しない。

引き続き191の投稿後自動リロードと、記者ID直接NG/上下4桁NG/期間限定の記者ID・スレ名検索を実装する。未追跡2スクリプトは保護。

## 2026-11-12 登録画像NGのSAF専用フォルダ対応（ローカル実装・未公開）

透明あぼーん用の登録画像をSAFで複数選択し、ユーザーが選んだ親フォルダに `Haiagaru-画像NG` を作成してコピーする方式を実装。親フォルダの読み書き権限を永続保持し、作成済みの専用フォルダ内の画像一覧を読む。ファイル管理アプリから後で追加した画像も手動「再スキャン」またはスレ表示時の周期チェックで対象にする。既存のアプリ内登録画像を新しいフォルダへコピーし、コピーに失敗した場合は保存先を切り替えず元画像を残す。画像プレビュー・個別削除・URLからの登録も同じ保存先を使用。画像あたり8MiB、判定対象は最大80枚、閾値1〜10枚・判定レベル4段階・初期OFFは維持。

ローカルGradle `:patches:buildAndroid` は最終ビルド成功。`RegisteredImageHashTest` 成功。実機でのSAFプロバイダー選択・再起動後の権限保持・画像NGの実描画は未検証。ORB/AKAZE・RANSACの照合は現行実装には未搭載。別パッケージへのAPK導入・コミット・push・Releaseなし。他チャットの既存未コミット変更は維持。

## 2026-11-12 履歴ポップアップ・追加機能一覧・登録画像NG画面の修正（ローカル）

履歴ポップアップはネイティブの選択状態を描画前に読み、ジェスチャー切替時の文字色・インジケーターを同期。対象一覧にはmax(res_count, server_res_count)-read_count（下限0）の新着件数を表示。登録画像NG画面はsystem window insetsを余白へ反映し、URL登録はSAF未設定でもアプリ内保存を使用。共通Composeダイアログは全体の最大高と本文のweightを設定し、多数の候補や長い説明があっても操作ボタン用の高さを確保。

基本設定に「1.24.1以降の追加機能（オン・オフ）」を追加。既存の各機能の設定値を共有し、設定リンク・記者ID検索・動画横画面表示にも切替入口を追加。Catbox画像のUA変更ではブラウザ形式のUAを使用し、ネイティブ識別子の付加を画像ホストに適用しない。

最終 :patches:buildAndroid 成功（build/followups-20261112/final-build.log）。UAルール45件・ネイティブidentity19件、setter/prepare/prepareRequestの3経路回帰、対象一覧のSQL新着件数を確認。指定Catbox画像はブラウザUAでHTTP200/image/jpeg/322263 bytes。実機は未接続、画面・タップ・ジェスチャーの実操作は未検証。公開・APK導入なし。先行ビルドのpackageRelease失敗後、最終ビルド成功を確認。

## 2026-11-13 ローカル保存画像・ﾜｯﾁｮｲコピー・1.27.5再発調査（開発中）

作業先はこのローカルフォルダ、dev。OneDriveは未使用。ローカル画像復元は通常キャッシュの読み取りだけを観測し、URLハッシュ→画像内容SHA-256を記録。自動保存先と2つのSAF検索先（既定の補助指定・追加1フォルダ）をバックグラウンドで索引化し、改名後は内容一致で復元。導入前に対応不明の画像にはACTION_OPEN_DOCUMENTによる手動関連付けを追加。画像ファイルは変更しない。OFF・フォルダ解除・移動失効時の再索引、32MiB/2万ファイル/深さ8上限、ローカル専用relay、元URLのコピー/保存名維持に対応。設定は画像・動画と追加機能一覧から開く。

ﾜｯﾁｮｲ長押しの上4桁/下4桁コピーを191のMenu経路と226/242の名前sheet経路へ追加。4文字そのまま（区切りなし・大小/記号保持）。個別表示スイッチと追加機能一覧の切替を共有。設定トップとNativeToolTabsの重複する「追加された機能をすべて見る」を削除し、更新履歴内の入口は保持。新機能の履歴割り当ては次のminor用1.28.0とし、過去1.27.5の修正項目へ新機能を遡って追加しない。

あにまんarc/imgは通常img優先、失敗時に元arcへfallback。本文中の拡張子なし画像URLも256件以内で補完し、既存配列の順序/重複を保持。未分類のあにまんスレURLはネット取得なしで専用ルート板へ変換し、明示OFFを尊重。242のタイトル情報popupは共通日時formatterを使わずIDを直接1000倍していたため、読込済み1レス目の日付を直前に適用する固定フックを追加。

検証: 通常Lint/R8ビルド成功（followups-build.log）。242原本適用成功。191/226も適用成功、新規cache stream wrapperの元命令/レジスター保持を全3版で検査成功。242 popupも原本APKと照合して元命令/レジスター保持成功。host画像URL8項目・日時18項目・ﾜｯﾁｮｲ並び順・履歴割当240項目成功。Mi Note 10/Android11/d5497008の隔離sitefix242で最終機能試験33項目成功（result9.log）：追加SAF形状provider、改名後内容一致、URL手動関連付け・索引reset後保持、OFF/フォルダ解除、native URL parser、読込済み日時、通常/タブレット設定ON時の直接起動editor、実clipboard上下4桁、画像設定画面のinsets/トグル状態保存。試験の最後にclipboardを復元。新しいユーザー本体アプリの置換/データ消去/公開投稿/EULA同意なし。端末導入はandroid-installations.md。

試験途中: 検証専用DocumentsProviderのMANAGE_DOCUMENTS不足を修正してSAF形状のread-only ContentProviderへ置換。ロック中のclipboard拒否はロック解除処理の反映後に再試験。前回の手動関連付けfixtureが残りフォルダ解除試験が失敗したため、隔離試験DB/fixtureだけを初期化。Switch.performClickのbooleanがfalseでもCompoundButtonは切り替わるため、実状態/保存値の検査に修正。いずれも失敗を成功扱いせず最終再試験で確認。

未解決: 利用者のPixel11の書き込み欄非表示は未再現。タブレット表示ONも直接起動では内部viewが生成されるが、実TabletHomeActivityからの操作/Pixel11の画面は未確認。原本242と候補の浮動editor root Lo/zzbgcは命令一致。1.27.0→1.27.5のThreadCommands差分はオルグ表記のみで、書き込みlayoutへの直接変更はない。書き込み画面の表示方法（自動/ダイアログ/全画面）を質問中。原因特定や修正完了とは報告しない。例示のあにまん実ページは環境のCloudflare HTTP403で実内容を取得できず、実ページ画像成功も未確認。ローカル修正・未公開、Release/tag/生成metadataは変更していない。

最終source buildは `build/site-regressions-1275/final-build.log` で通常Lint/R8成功（3m5s）。追加機能一覧の新項目/過去版への誤配置防止も反映。この最終MPP自体のAPK再生成・再導入は未実施で、端末33項目は直前のfollowups候補に対する結果（機能実装は同じ、差は追加機能一覧の項目接続のみ）。最終の公開・push・tag操作なし。

## 2026-11-13 242ダイアログの画面外配置・対象タブ・外部板OFF/検索方式（ローカル）

利用者の表示方法は「ダイアログ」、242へのパッチ適用時に発生と確認。従来の判定は任意のEditTextのisShownを見ていたため本文の実可視性を保証しなかった。新しいEditorDialogInstrumentationは本文のID2131296421とgetGlobalVisibleRectを検査。修正前候補で縦表示は成功、横表示は本文Rect(502,-553..1838,-438)、パネルtop=-788となり非表示を再現した。PostEditorDialogLayout.fitを242のLo/zzbgc.onLayout末尾へ追加し、既存パネルを表示領域内で再計測・配置する。本文や送信処理は変更しない。修正候補で縦・横・実TabletHomeActivityのnative書き込みコマンドからの8項目成功。VerifyPostEditorDialogHooksで元レジスター・全命令保持を確認。Pixel11実機の同一症状を確認した結果とは扱わない。

原本との実行比較のためパッケージ名のみ変えたnativeeditor242も作ったが、native providerの改変検知divide-by-zeroで画面起動前に停止した。原本UIの比較ができたとは扱わない。利用者の「パッチ適用時」報告と、候補の画面外配置の再現に基づく限定修正。詳細・導入台帳はandroid-installations.md。

対象履歴は242のnative RecyclerView ItemAnimatorを対象タブのbinding中だけnullにし、通常タブへ戻る際に元オブジェクトへ戻す。新規adapterの初回diffを並べ替えとして毎回表示させない。外部板の登録済みレコードがprovider OFF後にその他へ残るため、ExternalBoardGroupsの表示モデルでOFFサイトを除外。synthetic loopback alias・direct edge/org/bakusai/animanch/futabaに対応。DBの板・ログは削除しない。同じ判定を全板検索候補にも使う。

スレ検索はユーザー指定により2方式を実装。高速（初期値）は保存済みsubjectのみを端末内で検索し、追加通信なし。最新は従来の2並列・30秒予算で取得、未完了時は取得範囲を通知。8,000件のFutureを先行生成せず、常時2件以内の取得を順次進める。subjectをGZIP/SQLiteへ保存（圧縮64MiB・1万板目安・原文1板2MiB上限）、通常の追加掲示板の板表示からも索引を更新。高速追加処理の上限8秒・取得済み板数を表示。クエリの正規化/検索語分解はJobにつき1回。管理対象のloopback板URLをHTTPSで作っていた経路はHTTPへ修正し、保存索引のキーは実サイトの板URLにしてport変更を吸収。無効サイトを検索前に除外、設定共有はMODEの整数0/1を検証。詳細docs/global-title-search.md。

途中候補で8,000板ON/OFF、板レコード保持、再ON、HTTP URL、ItemAnimator除外/復元、最新modeのloopback取得、高速modeの追加通信0/永続snapshot読込、OFF時のキャッシュ結果除外の16項目成功。公開POSTなし・模擬上流2回。host検索1018項目成功。最終の圧縮索引ガード/共有MODE/encoded aliasを含むrelease-candidate-build.logで通常Lint/R8ビルド成功（3m31s）。最終APKの再適用と機能試験を継続。まだ公開/push/tag作成なし。

最終APK再適用・隔離端末更新後も、ダイアログ8＋板/履歴/検索16＋保存画像33項目成功。高速検索の測定は試験用の永続一覧1板、8,000件の登録板DBから対象を絞った状態で35ms、検索中の追加上流0。8,000板すべての実一覧を索引化した実負荷の測定ではない。無効8,000板の除外・sourceレコード保持/再ON、native ItemAnimatorの対象時だけnull/復元を確認。最終静的検査は242 onLayoutフックと全板検索フックとcache/popupフックで原本レジスター/命令保持が成功。ホスト検索ルール1018項目成功。

最終版の最初の追加試験はSettingsProfiles.RULESをcatalog初期化前に読み（加えてprivate RuleをPredicateと誤認）、共有設定のassertionで停止した。製品のRule登録はcatalog(Activity)にあり、共有/読み込み側がcatalogを呼ぶことをソースで確認。未初期化mapの不適切なassertionを除去し、16項目の実機能試験を再実行して成功。共有ファイルの実書き出し/読み込みそのものをこの16項目で実行したとは扱わない。MODEの登録はnumberKey(0,1)/default0。

詳細docs/global-title-search.md、最終のAPK/MPP fingerprint・導入結果はandroid-installations.md。公開/コミット/push/tag作成はまだ行っていない。その他の未追跡実験スクリプトとGradle daemon設定を維持。

利用者から公式Releaseを指示。公開説明の『最適化のみ』制約は明示的に解除されたため、既存.releasercのnotes writerを日本語のcommit本文を掲載する形式へ変更。実際のgeneratorで1.28.0の追加・改善/修正/57項目の確認説明をpreview成功。README・機能説明も現行機能へ更新。公開は既存Semantic Release CIとdev→master通常マージを使用する。


## 2026-11-14 履歴標準タブ・191通知位置（公開指示あり）

詳細history-native-notification-20261114.md。191/226/242のnativeタブモデルへ更新対象を追加し、OFFはpopup加工なし。191通知の初期移動直後に追跡を破棄せず、既存40秒以内で更新後の対象位置を維持し手動操作で解除。最終Lint/R8 build成功、3版適用・native popup各18、通知位置8、サムネイル123/121/121、既存命令/レジスター保持3版検査成功。新規crash空。隔離emulator-5580のみ、実機本体の変更・公開POSTなし。利用者から公式Release指示、既存CIでdev→master通常マージへ進む。


## 2026-11-14 通常版書込連携・容量エラー・レス限定送信先・226/242通知位置

通常版連携の完成純差分を統合し、成功/戻る結果のrelay、確認省略、鉛筆長押しの任意切替、ツールバー起動を追加。容量超過はFridaでHTTP413を実測し、容量エラーと送信先設定への案内に変更。Imgurログインを送信先設定へ集約し、利用者の修正指示に従って1ファイル限定案を「このレスでだけ」に変更。191だけだった更新後の対象維持を226/242の実リストにも適用。

主開発先のreply-build.logは通常Lint/R8成功、3版適用成功。Mi Note 10の隔離reporter191/226/242へインストールし、通知位置/容量ダイアログ/レス限定経路を各16、ネイティブ画像110/110/106、通常版relayの模擬結果15、ホスト送信71項目成功。新規対象crashなし。実際の公開投稿・テスト用画像送信なし。利用者から実機確認済み・公式Release許可あり。既存アプリ/通常版/無関係な未追跡ファイルは保持。詳細upload-navigation-20261114.md、stock-chmate-posting.md、android-installations.md。既存Semantic Release CIでdev→master通常マージして公開する。

利用者の追加指示でstockPostingShowMenuを追加（初期ON）。書き込み︙の通常版連携項目だけを切り替え、長押し/ツールバーは独立。最初の公式CI43558484230は公開前にcancel完了、1.31.0 Release未作成を確認し、追加をまとめて再実行する。

さらに利用者指示でthreadPostingNamesを追加（初期OFF）、未保存スレは空欄を利用者が選択。専用のネイティブ名前欄を既存ThreadCommandsから登録し、スレ別の私有設定へ保存。新規スレ立て/不明URLは標準のまま。最終thread-name-build.logは通常Lint/R8成功2分16秒。

最終候補は3版適用・ネイティブ名前欄接続成功。Mi Note 10へ署名一致で更新し、スレ別名前15項目ずつ、191の通常版relay/確認省略/メニュー初期ON・OFF/復帰/長押し・ツールバー独立動作19項目成功。公開投稿なし。証跡thread-names/result{191,226,242}.log、stock-return/final-result.log。
