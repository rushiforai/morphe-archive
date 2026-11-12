# 追加掲示板のネイティブ対応調査（2026-11-06）

利用者の指定範囲は、191/226/242のChMate標準の板・スレ・投稿画面で爆サイ、ふたば、あにまんを利用すること。Web画面を開くだけの対応では完了としない。現状は未実装。既存の5ch系URL/subject/DAT処理へURLを追加するだけでは取得・書込を行えない。

## 独自実装の方針

指定された参考リポジトリではREADMEとファイル名だけを確認し、実装コードは読込・コピーしていない。名前変更や逐語的な書換えは行わず、下記の各サイトの公開HTTP応答から仕様を整理する。参考実装の表現・設計を流用しない。ライセンスを除去する目的の変換はしない。

## 確認済みの通信形式

- 爆サイ: 利用者指定の北海道BBSMENU JSONはHTTP200。`menu_list[].category_content[]`に`board_name`/`url`等がある。URLは`/thr_tl/acode=1/ctgid=137/bid=5071/`型で、通常の1階層5ch board URLではない。一部`img_nl`型も混在し、全行を同じ一覧parserへ入れない。
- 爆サイの上記板とスレ`/thr_res/acode=1/ctgid=137/bid=5071/tid=13601530/`はHTTP200。レスは`div.article.res_list_article#resN`、日時`commentTime`、本文`resbody`、名前`dd.name`。削除レスでは日時などが欠落するが番号は保持。画像は`data-original`に実画像URLがありダミーGIFを採用しない。ページに埋め込まれたアンカープレビューを実レスとして重複収集しない。
- 爆サイ投稿formは`/thr_cp/usp=.../`へのmultipart。`bid/tid/ctgid/acode/tp/prof_flg/ctrid/loaded_at`等のhiddenと`body/name/mailaddr/image_post`があり、確認・規約・認証状態を調べずに固定値POSTしない。今回POSTは一切行っていない。
- ふたば: `https://www.2chan.net/bbsmenu.html`と`https://may.2chan.net/b/futaba.php?mode=json`はHTTP200。JSONは`res`のキーが投稿番号、各値は`now/name/email/sub/com/ext/tim/src/thumb/rsc`等。板全体の通し投稿番号とChMateのスレ内レス番号の区別が必要。引用・元番号との対応表を保持する設計が必要。
- ふたばの旧番号への`res=...` JSONはHTTP200でも`res`を含まない。実際のスレHTMLも404を返す例があり、HTTP200だけで空の正常スレとして保存しない。消滅/期限/過去レス/アンカー変換を検証する必要がある。今回取得できたカタログだけでスレ全文・書込み対応済みとは判断しない。
- あにまん: トップ`https://bbs.animanch.com/`、利用者指定`https://bbs.animanch.com/board/7591383/`とも調査環境でHTTP403。本文と投稿formを取得できていない。通常ブラウザーによる確認もCUAが`Local browser use is disabled in Work settings`を返し未実施。認証の回避や、取得できていないform仕様を推測した投稿処理は作成しない。

取得した公開応答はbuild/board-support-research/にローカル保管。応答のユーザー投稿全文はGitへ含めない。GETだけを実行し、掲示板への書込みやアカウント操作は行っていない。

## 接続・検証の未完了事項

各サイトのレスとネイティブDATの番号・削除・引用・画像を変換し、標準の更新・キャッシュ・未読を保持する。標準投稿画面の入力を、サイトが提供する投稿処理へ安全に接続する。認証・規約同意・確認が要求される場合は利用者に実画面を提示し、自動で解決/同意しない。投稿失敗や確認画面を成功として書込み履歴へ追加しない。

3版の板登録、一覧、本文、画像、差分更新、再起動、投稿画面と取消、投稿結果判定を検証する。実際の公開投稿試験は今回未実施。これらが通るまで利用者向けに「対応済み」と表示せず、配布にも含めない。

## 2026-11-06 利用者提供HTMLによるあにまん形式の確認・解析基盤

利用者提供の保存ファイル（Downloads/ダウンロード.htm、思い出の駄菓子ってある？｜あにまん掲示板.html、その_files）を読み取った。スレのcanonicalは7589284で、先に指定された7591383とは異なる。本文#resList直下li#resNは79件、画像a.thumbは34件、一覧cardは重複除去後360スレ。保存時に書き換えられたローカル_files画像ではなく、リンクの元https://bbs.animanch.com/img/<thread>/<number>を抽出する。
サイト提供main.jsを通信仕様の確認として読取り（実行・転載なし）。名前はmaxlength15。返信はname/text/threadのフォームデータで/inc/comment.php?preCheck成功後に/inc/comment.php、成功JSONのnumber/thread/jumpを使う。画像uploadは別段階/upload/。スレ新規作成では画像が必須の分岐がある。これはAPI呼出し仕様の記録であり、投稿の実施や認証突破ではない。

AnimanchProtocol.javaを独自実装。サイトのHTMLをjsoup1.21.2(MIT)で解析し、本文/名前/日時/返信番号/元画像URLの中間データへ変換、一覧の重複除去・同じ数字で終わるタイトル保持、スレcanonical一致/レス連番の検査、実行タグ/イベント属性/ローカル画像排除、外部リンクを自スレアンカーへ誤変換しない処理を含む。返信formの文字列化・改行正規化・長さ/空本文検査、成功JSONのスレ/レス/移動先照合を追加。通信とネイティブ保存への副作用はない。

hostテスト224項目成功（実保存HTML79レス/34画像/一覧360スレ、認証ページ/スレ違い/欠落/重複を拒否、URL境界、フォームencode、数値/文字列の成功応答、HTMLエラー・異なる移動先拒否）。build/animanch-protocol-tests.log。第三者の投稿全文や保存JSはGitへ追加しない。jsoupのMIT全文をpatch resourcesへ同梱、NOTICEへ明記。

**未接続**: このクラスは解析基盤だけで、標準の板登録/一覧取得/DAT/未読・画像ルーティング/投稿/認証セッションへまだ接続していない。特に元画像URLは拡張子を持たないためnative画像判定への接続検証が必要。ライブ取得の403、実投稿、新規スレ・画像アップロード未検証は維持。利用者向けに「対応済み」とはしない。追加依存による新候補のMPP作成/端末導入/公開もまだ行っていない。

## 2026-11-07 標準の掲示板設定への統合候補（未公開）

利用者指定のChMate標準「設定→掲示板設定」の既存updateBbsMenuを含むXMLへ追加掲示板の入口を追加。SiteBoardSettingsActivityに初期OFFの「使用する」、URL登録、標準画面を開く、サイト別認証、ふたば削除キーを実装。認証Cookieの利用は本人の選択後のみ。参照repoの実装ソースは未読・未利用。

SiteBoardProtocol/SiteNativeData/SitePostProtocol/SiteBoardGatewayを追加。独自のHTML解析からsubject/DATへ変換し、opt-inのアプリ内loopback接続で標準reader/postへ渡す設計。サイト元番号とスレ内番号の変換、投稿前確認、重複送信抑止、結果不明時の再送禁止、OFF時停止を含む。ホスト試験はあにまん224、3サイト解析25、DAT/投稿データ/成功判定136成功。公開掲示板への投稿は0。

最終通常Lint/R8 build/site-boards-standard-latest-build.log成功42秒/91tasks、191/226/242すべてのパッチ適用成功。MPP build/site-boards-standard.mpp SHA256 7899cbc41a7cd41219614d23c672fe751f7a6e12853dc58abd35b49150d88dcb。実行試験SiteBoardGatewayInstrumentationはコンパイル成功のみ。エミュレータ起動と試験APK作成の複合操作が自動承認レビューでblocked by policy（詳細理由なし）となり、試験実行・native URL parser/標準画面/トグルの動作確認は未完了。ビルド成功を利用可能の確認と扱わない。

制限: 現時点は既存スレへのテキスト返信のみを実装対象とし、新規スレ・添付画像・爆サイのページ分割は未対応。提供された15地域のBBSMENU取込みとふたばトップからの板選択は未実装。あにまんライブ403、実投稿成功テンプレート、差分/キャッシュ/画像形式/標準投稿の結合も要確認。対応完了・配布済みとはしない。push/Releaseなし。

## 2026-11-07 板ごとの設定・指定BBSMENU・ページ分割・投稿拡張候補
利用者はサイト単位ではなく登録した個々の板のURL/板の数/使用するを指定。SiteBoardSettingsActivityの各登録行から個別Dialogを開き、URL/板の数1/使用する/開く/認証を表示。新規登録はOFF、既存登録の使用状態保持。個別ON/OFFはGatewayのsubject/DAT/画像/投稿すべてで検査し、最後の板OFFでlistener停止。OFF時は待機画像/確認も破棄。host16項目成功。
利用者指定の爆サイ15地域JSONは全てHTTP200、対応する個別板延べ7946件。ふたば https://www.2chan.net/bbsmenu.html はHTTP200/Shift_JIS、98板。あにまん指定 https://bbs-menu.pages.dev/animanch_bbsmenu/bbsmenu.json はHTTP200/31カテゴリ。SiteBoardMenuProtocolと「板一覧から追加」の検索/選択UIを実装。あにまんカテゴリ別URLとスレURLを分離。HTMLトップ取得403でもメニューJSONを利用できる。
BakusaiPaginationは同じ板・スレのページリンクのみ収集し、最新50レスから過去ページを結合。レス番号連続・重複内容一致・全体件数を検証後にDAT出力。破損/途中欠落では保存用DATを返さない。実取得の13548303は4ページ/181レス+OP=182件の統合成功。メニュー/分割host1290項目成功（site-menu-pagination-tests.log）。保存データはbuild配下のみ、投稿全文をGitへ含めない。
投稿拡張: 標準スレ作成のsubjectと本文を各サイトの現行フォームへ変換。ふたばはtextonly/form上限サイズ、あにまんはカテゴリと必須画像/preCheck→本文→upload、爆サイはthr_tc1の後の確認フォームを内容一致時だけ一回限りtokenへ保持し標準確認応答で利用者確認を要求。確認/成功テンプレートの実投稿検証は未実施。画像は標準composerの固定既存ThreadCommands bindingで追加ボタンを挿入し、SAFでJPEG/PNG/GIF(最大8MiB・板の上限優先)を選択、元の板・スレ/新規へ10分間だけメモリ保持。選択だけでは送信せずnative送信時に添付する。実装元の表現・構造の流用なし。
新規スレ/画像/確認33、既存DAT/投稿136、あにまん224、既存3サイト解析25のhost試験成功。実機191(個別設定候補)でnative URL parser/subject/DAT/隔離投稿/重複抑止等144項目成功、公開POST0（site-gateway191-runtime.log）。個別Dialog試験は初回startActivitySync待ちで停止し試験packageのみforce-stop、次はbackground起動制限で時間切れ。前面Homeからの有界起動へ試験を修正し、実機14項目成功（site-boards-individual191-ui-foreground-runtime.log）。初回失敗を製品クラッシュや成功項目に含めない。実サイトへの公開投稿は行っていない。

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
