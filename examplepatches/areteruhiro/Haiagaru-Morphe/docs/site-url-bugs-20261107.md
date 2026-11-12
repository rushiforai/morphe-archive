# 外部板の報告URL・文字化け・元URL連携（2026-11-07）

## 元URLの特定

保存済みregistryのSHA-256先頭16バイトをキーとする板対応を確認。userの127.0.0.1 URLは端末ローカルgatewayのURLであり、当PCへそのURLのHTTPアクセスはしない。

- haa4ad6b44fb539b9e4eadf2131037d0a7 = あにまん実況 category21、9247288634は元スレ https://bbs.animanch.com/board/7288634/ （今更Switch版ダブルクロス買った5）。今回の実GET HTTP200、308レス、欠番なし。
- ha97f9feb0ae67d6d3f05bafa27e9d8b0c = category6、9247427435は https://bbs.animanch.com/board/7427435/。HTTP200、82レス。タイトルの星はU+2B50+U+FE0E。
- hb35655ffe182cad8747fd80fa4b0a7f5f = 佐賀 https://bakusai.com/thr_tl/acode=10/ctgid=148/bid=1560/。長崎bid1561、大分bid1563。いずれも取得時にacode20へ同一host転送。
- hf271c094a4c3c9e3eb7b0412f02e176b4 = ニュース表 https://zip.2chan.net/6/。
- hfc7aefa2b6e04e4becbbe236cf732d7dd = 配布 https://www.2chan.net/script/。これは掲示板ではなくスクリプト配布ページであり、futaba.php?mode=catは404。

## 修正

爆サイの板identityはctgid/bidを維持しacodeだけ異なる同一板を許容。別bid/ctgid/hostを混同せず、対象スレのページ分割リンクも地域番号の転送に対応。スレ一覧に紛れる別の事件ニュースリンクは引き続き除外。実保存HTMLで佐賀/長崎/大分それぞれ10スレ、長崎30返信/大分18返信の全ページ集約を確認した。

ニュース表ではcatの最初のfontが括弧付き(24)、後のfontが24という構造。数字だけのfontを選択し60スレ取得。配布は新規menuから除外、既存登録は消さずにスレ一覧がない理由を表示する。自動データ削除なし。

SiteNativeData.wireでcanEncodeだけでなく符号化→復号の完全一致を検証。Android API36ではwindows-31j encoder.canEncode(U+FE0E/U+FE0F)がtrueなのに、実bytesはFCFCへ置換され、復号するとU+FFFD。これをapp_processの独立probeで再現した。roundtripできない文字はNCRで保持する。星を削除したりVSを除去する回避ではない。

通常URLの受け渡し: SiteNativeBoards.parseとOpenUrlActivityから既存gatewayのlocalUrlへ変換。ネットワーク取得や自動追加/自動ONなし、登録済みかつ使用ONの板だけ。あにまんはカテゴリからスレの所属をURLだけでは特定できないため、ONの登録済みカテゴリ/rootから安定したキーを選ぶ。同じboard URLがあれば優先する。あにまんレスanchorはresNを保持。manifestに専用URLハンドラーを追加（爆サイthr_res/thr_tl、あにまんboard/category、ふたばres）。

コピー: 既存ClipboardHistory.setPrimaryClipフックで、明示的にコピーされる単一plain-text中の登録済みgatewayのURLだけを元URLへ置換。履歴機能OFFでも働く。現在のport/既知alias/許容pathだけを変換、他のloopback service/不正URL/URI item/Intent/HTML clipは保持。タイトル+URL形式にも対応。元のnative内部URL生成や通信URLは変更しない。あにまんのレス位置は保持し、板全体でレス番号を持つふたばなどは不確実なanchorを作らない。

## 検証と未解決範囲

ホスト: 新規20、既存報告形式16、mobile pagination98、menu/desktop分割1288項目成功。menu試験の一度目はfixture directory指定を誤りNoSuchFileException、正しいbuild/board-support-researchで再実行し成功。通常Lint/R8製品buildはsite-url-bugs-build.logで4m23s成功。

あにまん実況の元の取得失敗は今回のホストで再現していない。実データは308レス正常に解析できた。利用者へHTTP等のエラー詳細と爆サイの具体的な失敗スレURLを照会中。元サイトの認証制限や削除を回避する処理は追加しない。未再現の失敗を解決済みとは扱わない。

実サイトのPOSTは行わない。最新のユーザー依頼は修正/機能追加であり、この変更の公開指示はまだない。前のdev.7の公開とは区別し、無断でdevへpushしてRelease CIを起動しない。

最終Android検証: emulator-5580の3072MiBで191=307、226=316、242=313項目PASS（site-url-bugs<版>-runtime.log）。実配信された2件のHTMLをfixtureとして読み、元URLからOpenUrlActivity経由で標準本文画面を起動し308/82レス表示を確認。Java/Androidの文字参照を含むtitle roundtrip、元URL→既存登録identityの変換、元URLのコピー用文字列（タイトル＋URL形式含む）、manifestハンドラー、OFF時の有効化なし、既存画像/模擬投稿dialog/HTTPS ON/停止時解除も成功。公開POST0、実サイトの投稿受理は未確認。試験終了時刻まで新規crash buffer0行（site-url-bugs-crash.log）。

固定hook verifierの最初の実行は既存4番目引数の不足で失敗し、dev.7の既存wrapper/fallbackと比較するよう検査を調整。242の検査のみホストXmx192mではDEX3組保持でOOMになったため384mで再実行してPASS。製品APK生成/実行のOOMではない。全3版でnative parser fallbackとregistry/settingsのレジスター・元命令保持を確認。APK/MPP/署名はandroid-installations.md。製品ソースの最終ビルド後に変更したのは試験/文書だけ。

公開は行っていない。あにまんの過去の取得失敗は未再現、爆サイの全失敗を網羅したとは扱わず、具体的な失敗URL/エラー詳細を照会中。今回修正した地域転送・ニュース表・Unicode・元URL連携の検証完了とは区別する。



1.25.0-dev.8検証用公開完了: Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42375411673 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.8 / 2026-11-07 22:11:26 JST。APIでprerelease=true/draft=false、MPP/bundle JSON2個/任意ZIP3個を確認。配布MPPを実ダウンロードし7005493bytes / SHA256 0378c0d146ef9c5c96d2ef741c0956bac320108c6ca6536680b4a10049c4806b。pre JSONのversion/download_url一致。製品ソースb040af13、公開ノートd23e32ec、CI生成ab2cc9f0をff-only取得、生成ファイル手編集なし。配布MPP自体の再パッチ/導入は未実施、同一製品ソースの最終ローカルMPPで前記3版を検証。あにまん未再現の取得失敗/爆サイ全失敗未特定/実サイト投稿未確認をRelease本文に記載。

