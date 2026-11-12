# 2026-11-08 外部板の投稿判定・爆サイ本文取得

## 対象と根拠

- 爆サイ `https://bakusai.com/thr_res/acode=1/ctgid=137/bid=5071/tid=13585881/`: Android実通信はHTTP200、122959bytes。タイトル/NOは正しいがOPもレスもない2ページ目で、ページ選択のselectedもない。1ページ目リンクは存在。従来は初回OP必須として即503にしていた。OPのない初回を継続ページとして解析して明示的なp=1を取得する。しかし修正後の実通信ではp=1でも空のモバイル画面となり、初期候補での実通信はまだ503だった（live-bakusai191.log）。通常のPC用UAなら記事本文は返るがレス一覧は空。記事とレスの完全取得を成功扱いしない。空モバイルの条件が一致する時だけ同じURLのPC表示を1回試し、元のUA設定は保存し直さない。正しいスレidentity/タイトルを確認し、レスはサイトの明示的な「レス一番乗り」表示と件数に食い違いがある時に限り未取得枠として表示する。記事/identityが無い時や、単に解析できないページを成功扱いしない。
- ふたば `https://jun.2chan.net/oe/res/934731.htm`: 保存した実フォームをそのまま利用し、js=off等の値を偽造せずに検査。初回POSTは「cookieを有効にしてもう一度送信してください」。HTTPセッションで発行Cookieを保持して4秒後に送るとHTTP200でタイトルのないmeta refreshと「スレッド934731に切り替えます」を返した。従来はCookie不保持とこの成功形式未対応。今回の公開投稿はユーザーが以前許可した本文testを1件、他の試行はCookie/間隔拒否（操作が早すぎます）で投稿されていない。サーバーの成功応答確認であり、最終Android版での実サイト投稿成功とは区別する。
- あにまん `https://bbs.animanch.com/board/7597656/`: ユーザーは実際に反映されるがHTTP200の結果確認エラーになると報告。サイトの公開JavaScriptはthread/numberを投稿完了として利用し、jumpは表示切替にのみ利用。アプリも一致する正のthread/numberを受領証として判定し、使わないjumpの形式に依存しない。実際の成功JSON自体は未採取。調査環境のpreCheckはHTTP403で、最終POSTは未送信。原因を実応答によって確定したとは記載しない。

## 変更

- ふたば用のHTTPセッションCookieをメモリ内で保持（最大128件/ヘッダー8192字、ホスト/パス/Secureを標準CookieManagerで制限）。ユーザーが明示的に利用するWebView認証Cookieとは別で、ディスクや共通CookieHandlerへ保存しない。
- 投稿済みか不明な結果の自動再送は行わない。ふたばの厳密に一致するCookie/間隔拒否ページに限り、本文が投稿されていない旨を表示し、手動再送を許可。添付選択も保持する。
- ふたばの成功画面は、同一板・同一スレのmeta refreshと完了文が一致する場合に許可。別スレ/外部サイト/認証画面は成功にしない。
- あにまんの一致するスレ番号/レス番号を標準の成功通知へ渡し、標準書き込み画面を閉じる既存経路を利用。レス番号が不正/違うスレ/エラー本文は成功にしない。jumpはアクセスしない。

## 検証（作業中）

- SitePostBugsTest: 30項目PASS（実Android爆サイ応答+実ホスト1ページ目を合成、実ふたば完了/拒否HTML、セッションCookie境界、あにまん受領証、実PC空レス一覧の未取得表示）。
- 既存: AnimanchProtocolTest230、SiteMobilePaginationTest98、AnimanchPaginationTest295、SiteUrlBugsTest20項目PASS。
- 製品Lint/R8ビルドは4m5s成功（build.log）。191の固定hook/レジスター/元命令保持検査PASS。最終native検証中。226/242の最終APK/画面は未確認。公開していない。
- 試験APK作成は既存jar更新後のZIP descriptor不整合で失敗。ZIPを再構築して署名、resources.arscは非圧縮のままzipalignして導入。製品APKの問題ではない。初回installはエミュレータboot完了前でpackage service未起動、boot完了後に既存署名一致を照合してinstall-r成功。初回native試験はSystemUIのANRダイアログでfocusがなくclipboard検査失敗。実際のSystemUIダイアログを閉じて同じ製品APKで再実行。これらの失敗は成功に数えない。

ログ/採取HTML: `build/site-post-bugs-20261108/`（ローカル検証資料。認証情報は公開文書やGitへ保存しない）。

## 先行候補のAndroid結果

native191-retry.logは594項目PASS、通常本文/画像/元URLコピー、ふたばのmeta refresh成功で標準composer終了、あにまんのjumpなし受領証でcomposer終了、拒否時入力保持、Cookie拒否後の手動再送/自動再送なし、Android標準CookieManagerの保持とホスト境界も成功。初期MPPの結果であり、PC表示fallbackと空一覧通知を加えた最終候補は再ビルド/再確認中。初期候補の実爆サイ503は成功に数えない。

## 最終候補の確認完了（未公開）

最終製品ビルドbuild-final.logは通常Lint/R8を含め4m13s成功。最終MPP final.mpp SHA256 d3ccd56556f1a8d639dc2238d6df0c91a59227d75a0442c257cb3d48cf53a0a7。191の固定hook/レジスター/元命令保持検査PASS（hook191-final.log）、既存署名一致を照合してfinal191.apkへinstall-r成功。native191-final.logの595項目PASS。標準本文/画像/元URLコピー、ふたばmeta refresh成功でcomposer終了、あにまんjumpなしの有効受領証でcomposer終了、拒否時本文保持、Cookie拒否後の手動再送、自動再送なし、AndroidのCookieホスト境界を確認。公開POSTはこのnative試験では0件。

live-bakusai191-final.log: 報告URLの実Android通信がHTTP200/166657bytes、gatewayからnativeDatRows=3。採取したbakusai-live-final.rawはPC形式の記事本文1件、実レス0件、元サイトの明示的な空一覧1件。3行は記事1+未取得枠2であり、2レスを実取得できたという意味ではない。先行候補の実通信503は解消し、元サイトの不整合を理由付きで表示する。最終試験開始以降のcrash191-final.logは0行。

226/242は同じ共通処理を使用するが今回の最終APK/画面は未確認。あにまん実成功JSONは未採取/実投稿未確認、ふたば実成功はホストHTTPセッションで1件確認、最終Androidでの実サイト投稿は実施していない。実機変更/アンインストール/データ消去なし。新しいRelease公開指示はなく、devへのpush/Release作成は行っていない。


公開指示追補: ユーザーが「プレリリースして」と明示。上記の最終検証結果と未確認範囲を公開ノートに記載し、既存dev Semantic Release経路で検証用公開を進める。生成ファイルの手編集なし。


1.25.0-dev.10検証用公開完了: Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42392811838 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.10 / 2026-11-08 01:49:36 JST。APIでprerelease=true/draft=false、MPP/bundle JSON2個/任意ZIP3個を確認。配布MPPを実ダウンロードし7008320bytes / SHA256 5cadd6acd57aec061ca6ca2c0f3b7853d3c71baec466b3238c115e9a78ff23d9。pre JSONのversion/download_url一致、公開ノートの内容と未確認範囲を確認。最初の公開JSON対ローカルのbyte比較はLF/CRLF差で失敗したため、実際の改行数を確認し、JSONの全内容一致で成功を確認。製品ソースddb95e01、公開ノート96bfaf4e、CI生成fd2f4eeeをff-only取得。生成ファイル手編集なし。配布MPP自体の再パッチ/導入は未実施、同一製品ソースの最終ローカル候補で191の595項目と実爆サイ記事1+未取得枠2を確認済み。あにまん実投稿と226/242最終画面未確認、爆サイの元サイトが返さない2レスは未取得であることをRelease本文に記載。
