# 爆サイ3099994の繰り返しページによる503

報告URL: https://bakusai.com/thr_res/acode=1/ctgid=132/bid=2434/tid=3099994/

## 再現と原因

1.25.0-dev.10と同じ製品ソースの既存191エミュレータでbefore-live.logの503を再現。WebViewのUAで初回・p=1・p=3を取得しても、selected=2、レス2〜8の7件で、OPもレス1/9〜15も無いページが返る。レスを全件取得する既存の検査が正しく欠落を検出してエラーになる。

通常のHaiagaruというクライアント識別情報では、同じURLからOP+レス1〜15の全16件を取得。前回のPCブラウザUAへの切替では、PC版の記事は返るがレス一覧が空になる場合があるため、このケースの根本対応にはならなかった。

接続処理は別の掲示板の認証画面で保存されたbrowserUaも、ホストのCookie利用がOFFである爆サイにまで送っていた。通常の爆サイ取得は実際のクライアント名Haiagaruを使い、爆サイ自身の認証Cookie利用がONの場合は認証時のUAを維持する。その他サイトのUAと、認証Cookieの扱いは変更しない。認証情報やブラウザ証明の偽造、欠落レスの捏造は行わない。

## 検証中

- BakusaiReaderIdentityTest39項目PASS。実際の繰り返しページで未取得エラーを再現し、Haiagaru応答では全16件が番号順でDATへ渡り、未取得枠ではないことを確認。
- SiteAuthenticationPolicyTest16項目PASS。通常爆サイと認証ONの識別情報の扱い、他ホスト維持と既存の認証画面ナビゲーション境界を確認。
- 通常Lint/R8製品ビルドと191最終runtime/実通信を確認中。未公開、実機変更なし。

採取HTML/ログはbuild/bakusai-3099994/。現時点で公開投稿は0。


ユーザーが「終わったらプレリリースして」と公開を明示。最終検証後、確認範囲をノートへ記載し既存dev Semantic Release経路で公開する。


最初のnative試験は、新規の釣り板fixtureを追加した後も復元registryの期待数が旧4件のままだったため失敗。実際は5件が正しく保持されていた。試験の期待数だけを5件へ更新し、同じ製品APKで再実行する。製品不具合として扱わず、最初の試験も成功に数えない。


## 最終確認

製品build.logは通常Lint/R8を含め4m1s成功。final.mpp SHA256 6ce606737fa570dfc16134de534bb2df7e63123503e4b3d3faae974e4ad6e6ab。191の固定hook/レジスター/元命令保持PASS、同署名で既存検証用へinstall-r成功。native191-final.logで598項目PASS、本文/画像/元URL/模擬投稿dialog成功終了/拒否時本文保持/HTTPS ON回帰を確認。試験中の公開POST0。

after-live.logはAndroid実通信で報告URLのHTTP200/184505bytes、nativeDatRows=16、nativeRenderedRows=16成功。実gatewayが利用したsourceをgateway-source.rawとして採取し、OPとres1〜res15の全15レスが実在することを確認。未取得枠で埋めた16行ではない。標準スレ画面の実行時adapterで16件表示まで確認。以前のニュースURL13585881もprevious-news-live.logでHTTP200/3 DAT行成功。crash191.logは最終試験開始以降0行。

226/242と実機での最終画面確認、実サイト投稿、認証Cookie利用ONでの実通信は未確認。認証ONのUA維持はホスト/Androidのポリシー試験で確認した。ユーザーの公開指示により既存dev Semantic Releaseでプレリリースを公開する。生成ファイルの手編集なし。


1.25.0-dev.11検証用公開完了: Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42431357383 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.11 / 2026-11-08 09:52:55 JST。APIでprerelease=true/draft=false、MPP/bundle JSON2個/任意ZIP3個を確認。配布MPPを実ダウンロードし7008656bytes / SHA256 627e169012156f08195051055003982e81da0fe04da34944216e18dfde98fdd5、GitHub asset digestも一致。pre JSONのversion/download_urlとローカルJSON内容一致。ソース5db4526a、CI生成ea455787をff-only取得、生成ファイル手編集なし。配布MPP自体の再パッチ/導入は未実施、同一製品ソースの最終ローカル候補で191の598項目と報告URLの実HTTP200/本文+15レス/標準画面16件を確認済み。226/242/実機/認証Cookie利用ON実通信/実投稿の今回の未確認範囲をRelease本文に記載。
