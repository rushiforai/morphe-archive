# 爆サイ求人一覧への対応（2026-11-08）

福岡お水・ホスト求人829は、#thr_list3直下のリンクの後に日時と「(n件)」を置く形式だった。従来はli/table内の専用カウンターしか読まず、全スレを除外して503になっていた。同じ形式を共通パーサーへ追加した。直後の改行・次のリンク・ブロック要素で区切り、別行の票数やタイトル内の数字を拾わない。対象板の通常thr_resリンクだけを取り込み、recruit.bakusai.comの掲載情報や/yamibaito/の注意喚起リンクをスレとして生成しない。

## 他県の確認

既存15地域メニューから47都道府県の「お水・ホスト求人」「一般求人」「風俗求人」各47板、計141板の1ページ目を実通信で確認。2.2秒以上の間隔、正規クライアント名Haiagaru、サーバー発行Cookieを保持し、公開投稿0件。通常スレがあった54板から各1スレを選んで本文と返信の全件取得を確認した。

- お水・ホスト求人: 46/47板で一覧・本文成功。群馬の1ページ目は外部掲載情報のみ。
- 風俗求人: 岩手・高知・山形・滋賀・秋田・徳島・福島・和歌山の8板で一覧・本文成功。他39板の1ページ目は外部掲載情報のみ。
- 一般求人: 47板とも1ページ目のリンクが注意喚起ページへ向いており、通常のスレURLがなかった。

87板を取得成功とは扱わない。一般的な「認証・通信・対応形式」の説明を、実際の「注意喚起ページへのリンクのみ」「外部求人の掲載情報のみ」に変更する。2ページ目以降に通常スレがあるかは網羅していない。愛知風俗求人の2ページ目も外部掲載情報のみであることを別途確認した。外部求人ページを掲示板スレや返信可能な投稿として偽装しない。

| 県別板 | 一覧スレ数 | 代表スレ本文 | 備考 |
| --- | ---: | --- | --- |
| [愛知お水・ホスト求人](https://bakusai.com/thr_tl/acode=5/ctgid=135/bid=808/) | 26 | [本文2件](https://bakusai.com/thr_res/acode=5/ctgid=135/bid=808/tid=5662020/) | 未取得0 |
| [愛知一般求人](https://bakusai.com/thr_tl/acode=5/ctgid=106/bid=323/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [愛知風俗求人](https://bakusai.com/thr_tl/acode=5/ctgid=105/bid=370/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [愛媛お水・ホスト求人](https://bakusai.com/thr_tl/acode=9/ctgid=135/bid=827/) | 28 | [本文3件](https://bakusai.com/thr_res/acode=9/ctgid=135/bid=827/tid=5562211/) | 未取得0 |
| [愛媛一般求人](https://bakusai.com/thr_tl/acode=9/ctgid=106/bid=79/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [愛媛風俗求人](https://bakusai.com/thr_tl/acode=9/ctgid=105/bid=80/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [茨城お水・ホスト求人](https://bakusai.com/thr_tl/acode=15/ctgid=135/bid=802/) | 28 | [本文2件](https://bakusai.com/thr_res/acode=15/ctgid=135/bid=802/tid=6355609/) | 未取得0 |
| [茨城一般求人](https://bakusai.com/thr_tl/acode=15/ctgid=106/bid=379/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [茨城風俗求人](https://bakusai.com/thr_tl/acode=15/ctgid=105/bid=378/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [岡山お水・ホスト求人](https://bakusai.com/thr_tl/acode=8/ctgid=135/bid=821/) | 29 | [本文3件](https://bakusai.com/thr_res/acode=8/ctgid=135/bid=821/tid=2017459/) | 未取得0 |
| [岡山一般求人](https://bakusai.com/thr_tl/acode=8/ctgid=106/bid=316/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [岡山風俗求人](https://bakusai.com/thr_tl/acode=8/ctgid=105/bid=359/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [沖縄お水・ホスト求人](https://bakusai.com/thr_tl/acode=11/ctgid=135/bid=838/) | 18 | [本文2件](https://bakusai.com/thr_res/acode=11/ctgid=135/bid=838/tid=13014189/) | 未取得0 |
| [沖縄一般求人](https://bakusai.com/thr_tl/acode=11/ctgid=106/bid=308/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [沖縄風俗求人](https://bakusai.com/thr_tl/acode=11/ctgid=105/bid=382/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [岩手お水・ホスト求人](https://bakusai.com/thr_tl/acode=14/ctgid=135/bid=792/) | 29 | [本文9件](https://bakusai.com/thr_res/acode=14/ctgid=135/bid=792/tid=4313089/) | 未取得0 |
| [岩手一般求人](https://bakusai.com/thr_tl/acode=14/ctgid=106/bid=289/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [岩手風俗求人](https://bakusai.com/thr_tl/acode=14/ctgid=105/bid=290/) | 18 | [本文4件](https://bakusai.com/thr_res/acode=14/ctgid=105/bid=290/tid=6495227/) | 未取得0 |
| [岐阜お水・ホスト求人](https://bakusai.com/thr_tl/acode=5/ctgid=135/bid=807/) | 30 | [本文3件](https://bakusai.com/thr_res/acode=19/ctgid=135/bid=807/tid=46422/) | 未取得0 |
| [岐阜一般求人](https://bakusai.com/thr_tl/acode=5/ctgid=106/bid=322/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [岐阜風俗求人](https://bakusai.com/thr_tl/acode=5/ctgid=105/bid=371/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [宮崎お水・ホスト求人](https://bakusai.com/thr_tl/acode=16/ctgid=135/bid=834/) | 29 | [本文8件](https://bakusai.com/thr_res/acode=16/ctgid=135/bid=834/tid=7050085/) | 未取得0 |
| [宮崎一般求人](https://bakusai.com/thr_tl/acode=16/ctgid=106/bid=309/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [宮崎風俗求人](https://bakusai.com/thr_tl/acode=16/ctgid=105/bid=352/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [宮城お水・ホスト求人](https://bakusai.com/thr_tl/acode=2/ctgid=135/bid=793/) | 29 | [本文17件](https://bakusai.com/thr_res/acode=2/ctgid=135/bid=793/tid=6141603/) | 未取得0 |
| [宮城一般求人](https://bakusai.com/thr_tl/acode=2/ctgid=106/bid=284/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [宮城風俗求人](https://bakusai.com/thr_tl/acode=2/ctgid=105/bid=285/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [京都お水・ホスト求人](https://bakusai.com/thr_tl/acode=7/ctgid=135/bid=816/) | 30 | [本文4件](https://bakusai.com/thr_res/acode=18/ctgid=135/bid=816/tid=4326993/) | 未取得0 |
| [京都一般求人](https://bakusai.com/thr_tl/acode=7/ctgid=106/bid=318/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [京都風俗求人](https://bakusai.com/thr_tl/acode=7/ctgid=105/bid=361/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [熊本お水・ホスト求人](https://bakusai.com/thr_tl/acode=16/ctgid=135/bid=832/) | 28 | [本文6件](https://bakusai.com/thr_res/acode=16/ctgid=135/bid=832/tid=9633367/) | 未取得0 |
| [熊本一般求人](https://bakusai.com/thr_tl/acode=16/ctgid=106/bid=310/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [熊本風俗求人](https://bakusai.com/thr_tl/acode=16/ctgid=105/bid=353/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [群馬お水・ホスト求人](https://bakusai.com/thr_tl/acode=15/ctgid=135/bid=804/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [群馬一般求人](https://bakusai.com/thr_tl/acode=15/ctgid=106/bid=380/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [群馬風俗求人](https://bakusai.com/thr_tl/acode=15/ctgid=105/bid=381/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [広島お水・ホスト求人](https://bakusai.com/thr_tl/acode=8/ctgid=135/bid=820/) | 26 | [本文8件](https://bakusai.com/thr_res/acode=8/ctgid=135/bid=820/tid=8790576/) | 未取得0 |
| [広島一般求人](https://bakusai.com/thr_tl/acode=8/ctgid=106/bid=317/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [広島風俗求人](https://bakusai.com/thr_tl/acode=8/ctgid=105/bid=360/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [香川お水・ホスト求人](https://bakusai.com/thr_tl/acode=9/ctgid=135/bid=826/) | 30 | [本文12件](https://bakusai.com/thr_res/acode=9/ctgid=135/bid=826/tid=4081008/) | 未取得0 |
| [香川一般求人](https://bakusai.com/thr_tl/acode=9/ctgid=106/bid=84/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [香川風俗求人](https://bakusai.com/thr_tl/acode=9/ctgid=105/bid=85/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [高知お水・ホスト求人](https://bakusai.com/thr_tl/acode=9/ctgid=135/bid=828/) | 30 | [本文4件](https://bakusai.com/thr_res/acode=9/ctgid=135/bid=828/tid=4370644/) | 未取得0 |
| [高知一般求人](https://bakusai.com/thr_tl/acode=9/ctgid=106/bid=67/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [高知風俗求人](https://bakusai.com/thr_tl/acode=9/ctgid=105/bid=68/) | 11 | [本文2件](https://bakusai.com/thr_res/acode=9/ctgid=105/bid=68/tid=1439559/) | 未取得0 |
| [佐賀お水・ホスト求人](https://bakusai.com/thr_tl/acode=10/ctgid=135/bid=830/) | 30 | [本文3件](https://bakusai.com/thr_res/acode=20/ctgid=135/bid=830/tid=10845719/) | 未取得0 |
| [佐賀一般求人](https://bakusai.com/thr_tl/acode=10/ctgid=106/bid=313/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [佐賀風俗求人](https://bakusai.com/thr_tl/acode=10/ctgid=105/bid=356/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [埼玉お水・ホスト求人](https://bakusai.com/thr_tl/acode=3/ctgid=135/bid=798/) | 23 | [本文4件](https://bakusai.com/thr_res/acode=17/ctgid=135/bid=798/tid=1401618/) | 未取得0 |
| [埼玉一般求人](https://bakusai.com/thr_tl/acode=3/ctgid=106/bid=393/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [埼玉風俗求人](https://bakusai.com/thr_tl/acode=3/ctgid=105/bid=390/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [三重お水・ホスト求人](https://bakusai.com/thr_tl/acode=5/ctgid=135/bid=810/) | 25 | [本文6件](https://bakusai.com/thr_res/acode=19/ctgid=135/bid=810/tid=6913609/) | 未取得0 |
| [三重一般求人](https://bakusai.com/thr_tl/acode=5/ctgid=106/bid=307/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [三重風俗求人](https://bakusai.com/thr_tl/acode=5/ctgid=105/bid=335/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [山形お水・ホスト求人](https://bakusai.com/thr_tl/acode=2/ctgid=135/bid=794/) | 30 | [本文5件](https://bakusai.com/thr_res/acode=2/ctgid=135/bid=794/tid=6590530/) | 未取得0 |
| [山形一般求人](https://bakusai.com/thr_tl/acode=2/ctgid=106/bid=250/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [山形風俗求人](https://bakusai.com/thr_tl/acode=2/ctgid=105/bid=251/) | 22 | [本文9件](https://bakusai.com/thr_res/acode=2/ctgid=105/bid=251/tid=7049099/) | 未取得0 |
| [山口お水・ホスト求人](https://bakusai.com/thr_tl/acode=8/ctgid=135/bid=824/) | 29 | [本文8件](https://bakusai.com/thr_res/acode=8/ctgid=135/bid=824/tid=8010715/) | 未取得0 |
| [山口一般求人](https://bakusai.com/thr_tl/acode=8/ctgid=106/bid=117/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [山口風俗求人](https://bakusai.com/thr_tl/acode=8/ctgid=105/bid=118/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [山梨お水・ホスト求人](https://bakusai.com/thr_tl/acode=4/ctgid=135/bid=803/) | 30 | [本文8件](https://bakusai.com/thr_res/acode=4/ctgid=135/bid=803/tid=5598578/) | 未取得0 |
| [山梨一般求人](https://bakusai.com/thr_tl/acode=4/ctgid=106/bid=266/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [山梨風俗求人](https://bakusai.com/thr_tl/acode=4/ctgid=105/bid=267/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [滋賀お水・ホスト求人](https://bakusai.com/thr_tl/acode=7/ctgid=135/bid=819/) | 30 | [本文9件](https://bakusai.com/thr_res/acode=18/ctgid=135/bid=819/tid=6234115/) | 未取得0 |
| [滋賀一般求人](https://bakusai.com/thr_tl/acode=7/ctgid=106/bid=236/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [滋賀風俗求人](https://bakusai.com/thr_tl/acode=7/ctgid=105/bid=237/) | 1 | [本文2件](https://bakusai.com/thr_res/acode=18/ctgid=105/bid=237/tid=3464067/) | 未取得0 |
| [鹿児島お水・ホスト求人](https://bakusai.com/thr_tl/acode=16/ctgid=135/bid=837/) | 26 | [本文13件](https://bakusai.com/thr_res/acode=16/ctgid=135/bid=837/tid=5314810/) | 未取得0 |
| [鹿児島一般求人](https://bakusai.com/thr_tl/acode=16/ctgid=106/bid=315/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [鹿児島風俗求人](https://bakusai.com/thr_tl/acode=16/ctgid=105/bid=358/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [秋田お水・ホスト求人](https://bakusai.com/thr_tl/acode=14/ctgid=135/bid=791/) | 30 | [本文9件](https://bakusai.com/thr_res/acode=14/ctgid=135/bid=791/tid=2137452/) | 未取得0 |
| [秋田一般求人](https://bakusai.com/thr_tl/acode=14/ctgid=106/bid=294/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [秋田風俗求人](https://bakusai.com/thr_tl/acode=14/ctgid=105/bid=295/) | 19 | [本文2件](https://bakusai.com/thr_res/acode=14/ctgid=105/bid=295/tid=9411984/) | 未取得0 |
| [新潟お水・ホスト求人](https://bakusai.com/thr_tl/acode=4/ctgid=135/bid=806/) | 30 | [本文2件](https://bakusai.com/thr_res/acode=4/ctgid=135/bid=806/tid=12139031/) | 未取得0 |
| [新潟一般求人](https://bakusai.com/thr_tl/acode=4/ctgid=106/bid=255/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [新潟風俗求人](https://bakusai.com/thr_tl/acode=4/ctgid=105/bid=256/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [神奈川お水・ホスト求人](https://bakusai.com/thr_tl/acode=3/ctgid=135/bid=797/) | 28 | [本文3件](https://bakusai.com/thr_res/acode=17/ctgid=135/bid=797/tid=8993246/) | 未取得0 |
| [神奈川一般求人](https://bakusai.com/thr_tl/acode=3/ctgid=106/bid=328/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [神奈川風俗求人](https://bakusai.com/thr_tl/acode=3/ctgid=105/bid=367/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [青森お水・ホスト求人](https://bakusai.com/thr_tl/acode=14/ctgid=135/bid=790/) | 30 | [本文5件](https://bakusai.com/thr_res/acode=14/ctgid=135/bid=790/tid=11784850/) | 未取得0 |
| [青森一般求人](https://bakusai.com/thr_tl/acode=14/ctgid=106/bid=325/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [青森風俗求人](https://bakusai.com/thr_tl/acode=14/ctgid=105/bid=373/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [静岡お水・ホスト求人](https://bakusai.com/thr_tl/acode=5/ctgid=135/bid=809/) | 30 | [本文4件](https://bakusai.com/thr_res/acode=19/ctgid=135/bid=809/tid=6128674/) | 未取得0 |
| [静岡一般求人](https://bakusai.com/thr_tl/acode=5/ctgid=106/bid=306/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [静岡風俗求人](https://bakusai.com/thr_tl/acode=5/ctgid=105/bid=339/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [石川お水・ホスト求人](https://bakusai.com/thr_tl/acode=6/ctgid=135/bid=812/) | 29 | [本文9件](https://bakusai.com/thr_res/acode=6/ctgid=135/bid=812/tid=4430952/) | 未取得0 |
| [石川一般求人](https://bakusai.com/thr_tl/acode=6/ctgid=106/bid=278/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [石川風俗求人](https://bakusai.com/thr_tl/acode=6/ctgid=105/bid=279/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [千葉お水・ホスト求人](https://bakusai.com/thr_tl/acode=3/ctgid=135/bid=799/) | 29 | [本文8件](https://bakusai.com/thr_res/acode=17/ctgid=135/bid=799/tid=7591298/) | 未取得0 |
| [千葉一般求人](https://bakusai.com/thr_tl/acode=3/ctgid=106/bid=327/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [千葉風俗求人](https://bakusai.com/thr_tl/acode=3/ctgid=105/bid=366/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [大阪お水・ホスト求人](https://bakusai.com/thr_tl/acode=7/ctgid=135/bid=813/) | 25 | [本文3件](https://bakusai.com/thr_res/acode=7/ctgid=135/bid=813/tid=13425873/) | 未取得0 |
| [大阪一般求人](https://bakusai.com/thr_tl/acode=7/ctgid=106/bid=320/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [大阪風俗求人](https://bakusai.com/thr_tl/acode=7/ctgid=105/bid=363/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [大分お水・ホスト求人](https://bakusai.com/thr_tl/acode=10/ctgid=135/bid=833/) | 30 | [本文2件](https://bakusai.com/thr_res/acode=20/ctgid=135/bid=833/tid=5474230/) | 未取得0 |
| [大分一般求人](https://bakusai.com/thr_tl/acode=10/ctgid=106/bid=312/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [大分風俗求人](https://bakusai.com/thr_tl/acode=10/ctgid=105/bid=355/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [長崎お水・ホスト求人](https://bakusai.com/thr_tl/acode=10/ctgid=135/bid=831/) | 30 | [本文2件](https://bakusai.com/thr_res/acode=20/ctgid=135/bid=831/tid=7701067/) | 未取得0 |
| [長崎一般求人](https://bakusai.com/thr_tl/acode=10/ctgid=106/bid=311/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [長崎風俗求人](https://bakusai.com/thr_tl/acode=10/ctgid=105/bid=354/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [長野お水・ホスト求人](https://bakusai.com/thr_tl/acode=4/ctgid=135/bid=805/) | 27 | [本文2件](https://bakusai.com/thr_res/acode=4/ctgid=135/bid=805/tid=9565133/) | 未取得0 |
| [長野一般求人](https://bakusai.com/thr_tl/acode=4/ctgid=106/bid=260/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [長野風俗求人](https://bakusai.com/thr_tl/acode=4/ctgid=105/bid=261/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [鳥取お水・ホスト求人](https://bakusai.com/thr_tl/acode=12/ctgid=135/bid=823/) | 23 | [本文2件](https://bakusai.com/thr_res/acode=12/ctgid=135/bid=823/tid=11510033/) | 未取得0 |
| [鳥取一般求人](https://bakusai.com/thr_tl/acode=12/ctgid=106/bid=129/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [鳥取風俗求人](https://bakusai.com/thr_tl/acode=12/ctgid=105/bid=130/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [島根お水・ホスト求人](https://bakusai.com/thr_tl/acode=12/ctgid=135/bid=822/) | 27 | [本文5件](https://bakusai.com/thr_res/acode=12/ctgid=135/bid=822/tid=943734/) | 未取得0 |
| [島根一般求人](https://bakusai.com/thr_tl/acode=12/ctgid=106/bid=123/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [島根風俗求人](https://bakusai.com/thr_tl/acode=12/ctgid=105/bid=124/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [東京お水・ホスト求人](https://bakusai.com/thr_tl/acode=3/ctgid=135/bid=796/) | 19 | [本文2件](https://bakusai.com/thr_res/acode=3/ctgid=135/bid=796/tid=9965706/) | 未取得0 |
| [東京一般求人](https://bakusai.com/thr_tl/acode=3/ctgid=106/bid=329/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [東京風俗求人](https://bakusai.com/thr_tl/acode=3/ctgid=105/bid=365/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [徳島お水・ホスト求人](https://bakusai.com/thr_tl/acode=9/ctgid=135/bid=825/) | 29 | [本文3件](https://bakusai.com/thr_res/acode=9/ctgid=135/bid=825/tid=10011373/) | 未取得0 |
| [徳島一般求人](https://bakusai.com/thr_tl/acode=9/ctgid=106/bid=73/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [徳島風俗求人](https://bakusai.com/thr_tl/acode=9/ctgid=105/bid=74/) | 4 | [本文10件](https://bakusai.com/thr_res/acode=9/ctgid=105/bid=74/tid=13555770/) | 未取得0 |
| [栃木お水・ホスト求人](https://bakusai.com/thr_tl/acode=15/ctgid=135/bid=801/) | 28 | [本文24件](https://bakusai.com/thr_res/acode=15/ctgid=135/bid=801/tid=395148/) | 未取得0 |
| [栃木一般求人](https://bakusai.com/thr_tl/acode=15/ctgid=106/bid=391/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [栃木風俗求人](https://bakusai.com/thr_tl/acode=15/ctgid=105/bid=392/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [奈良お水・ホスト求人](https://bakusai.com/thr_tl/acode=7/ctgid=135/bid=817/) | 30 | [本文3件](https://bakusai.com/thr_res/acode=18/ctgid=135/bid=817/tid=4370610/) | 未取得0 |
| [奈良一般求人](https://bakusai.com/thr_tl/acode=7/ctgid=106/bid=230/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [奈良風俗求人](https://bakusai.com/thr_tl/acode=7/ctgid=105/bid=231/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [富山お水・ホスト求人](https://bakusai.com/thr_tl/acode=6/ctgid=135/bid=811/) | 21 | [本文33件](https://bakusai.com/thr_res/acode=6/ctgid=135/bid=811/tid=1671775/) | 未取得0 |
| [富山一般求人](https://bakusai.com/thr_tl/acode=6/ctgid=106/bid=321/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [富山風俗求人](https://bakusai.com/thr_tl/acode=6/ctgid=105/bid=364/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [福井お水・ホスト求人](https://bakusai.com/thr_tl/acode=6/ctgid=135/bid=814/) | 28 | [本文5件](https://bakusai.com/thr_res/acode=6/ctgid=135/bid=814/tid=7616094/) | 未取得0 |
| [福井一般求人](https://bakusai.com/thr_tl/acode=6/ctgid=106/bid=273/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [福井風俗求人](https://bakusai.com/thr_tl/acode=6/ctgid=105/bid=274/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [福岡お水・ホスト求人](https://bakusai.com/thr_tl/acode=10/ctgid=135/bid=829/) | 25 | [本文2件](https://bakusai.com/thr_res/acode=10/ctgid=135/bid=829/tid=5262240/) | 未取得0 |
| [福岡一般求人](https://bakusai.com/thr_tl/acode=10/ctgid=106/bid=314/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [福岡風俗求人](https://bakusai.com/thr_tl/acode=10/ctgid=105/bid=357/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [福島お水・ホスト求人](https://bakusai.com/thr_tl/acode=2/ctgid=135/bid=795/) | 30 | [本文11件](https://bakusai.com/thr_res/acode=2/ctgid=135/bid=795/tid=8163629/) | 未取得0 |
| [福島一般求人](https://bakusai.com/thr_tl/acode=2/ctgid=106/bid=324/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [福島風俗求人](https://bakusai.com/thr_tl/acode=2/ctgid=105/bid=368/) | 5 | [本文2件](https://bakusai.com/thr_res/acode=2/ctgid=105/bid=368/tid=8720499/) | 未取得0 |
| [兵庫お水・ホスト求人](https://bakusai.com/thr_tl/acode=7/ctgid=135/bid=815/) | 30 | [本文2件](https://bakusai.com/thr_res/acode=18/ctgid=135/bid=815/tid=10796711/) | 未取得0 |
| [兵庫一般求人](https://bakusai.com/thr_tl/acode=7/ctgid=106/bid=319/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [兵庫風俗求人](https://bakusai.com/thr_tl/acode=7/ctgid=105/bid=362/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [北海道お水・ホスト求人](https://bakusai.com/thr_tl/acode=1/ctgid=135/bid=786/) | 30 | [本文3件](https://bakusai.com/thr_res/acode=1/ctgid=135/bid=786/tid=9157883/) | 未取得0 |
| [北海道一般求人](https://bakusai.com/thr_tl/acode=1/ctgid=106/bid=326/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [北海道風俗求人](https://bakusai.com/thr_tl/acode=1/ctgid=105/bid=369/) | — | 対象スレなし | 元サイトの一覧は外部求人サイトの掲載情報です。閲覧できる掲示板スレのリンクがありません |
| [和歌山お水・ホスト求人](https://bakusai.com/thr_tl/acode=7/ctgid=135/bid=818/) | 30 | [本文16件](https://bakusai.com/thr_res/acode=18/ctgid=135/bid=818/tid=4917619/) | 未取得0 |
| [和歌山一般求人](https://bakusai.com/thr_tl/acode=7/ctgid=106/bid=224/) | — | 対象スレなし | 元サイトの一覧は注意喚起ページへのリンクです。閲覧できる掲示板スレのリンクがありません |
| [和歌山風俗求人](https://bakusai.com/thr_tl/acode=7/ctgid=105/bid=225/) | 27 | [本文2件](https://bakusai.com/thr_res/acode=18/ctgid=105/bid=225/tid=10843284/) | 未取得0 |

通信結果はbuild/bakusai-fukuoka829/prefectures/results.json、最終パーサーによる保存HTML再検査はlisting-replay.json。実通信の全141件はエラー文の追加前の同じ抽出処理で実行したため、スレなし板の診断文は最終パーサーで再検査している。

## ローカル検証

BakusaiRecruitmentTest13項目、既存アドレス/一覧/本文25項目、既報レイアウト16項目成功。福岡の実HTMLは25スレ（外部求人広告5件は除外）、0返信を含む件数・OP+返信2件・標準返信フォームの板/スレ一致を確認した。実POSTは送らない。製品ビルドは通常Lint/R8込み3m55s成功。変更は共通Javaパーサーのみで、新しいネイティブフックやクラス探索を追加していない。

191最終候補で615項目成功。実通信の福岡829はHTTP200/114587bytes、topics=25/nativeSubjectRows=25。代表スレ5262240はHTTP200/144614bytes、nativeDatRows=2/nativeRenderedRows=2。新規crash buffer0行。既存検証用191を同署名更新し、実機・データ消去なし。226/242は同じ共通パーサーの対象だが今回の最終APK画面は未確認。公開はまだ行っていない。

公開済み: [1.25.0-dev.13](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.13)。CI成功、配布MPPのダウンロード/ハッシュ、メタデータの一致を確認。上記の『未公開』は公開前の候補検証時点の記録。
