# 爆サイ地域メニューからスレ本文までの取得検証（2026-11-08）

15地域のメニューをHTTP 200で取得し、各メニューに記載された板URLからスレ一覧を取得、実際のスレURLを選んで製品のSiteBoardProtocol/BakusaiPaginationで本文を解析した。公開投稿は0件。メニューの成功だけを本文取得成功とは数えない。

確認範囲: 都道府県の雑談総合47板、各地域の運輸・交通15板、既報の災害4板・サッカー国内1板、計67板の各1スレ。66スレは実本文・レスを欠番なく取得。山梨雑談総合の1スレは元HTMLに#6がなく、全件取得としては不合格。ローカル修正では取得済みのOPと7レスを維持し、#6に理由付き未取得枠を表示する。全板・全スレの網羅検証ではなく、各地域からの代表例である。

通信は正規クライアント名Haiagaru、サーバー発行Cookie、HTTPSのみの転送、取得間隔2秒以上。元サイトがHTTP 200で返すアクセスエラーも失敗として記録した。初回の大量確認ではそのエラーが増えたが、間隔とCookie保持で再確認し46/47件に到達。UA偽装・接続元変更は行っていない。

## 地域ごとの別カテゴリと既報板

| メニュー | 板 | スレ | 取得行数（OP含む） | 未取得 |
| --- | --- | --- | ---: | ---: |
| [hokkaido](https://bbs-menu.pages.dev/bakusai_bbsmenu/hokkaido_bbsmenu.json) | [北海道運輸・交通](https://bakusai.com/thr_tl/acode=1/ctgid=120/bid=3482/) | [ホッコウ物流旭川](https://bakusai.com/thr_res/acode=1/ctgid=120/bid=3482/tid=13143694/) | 2 | 0 |
| [hokubukyusyu](https://bbs-menu.pages.dev/bakusai_bbsmenu/hokubukyusyu_bbsmenu.json) | [福岡運輸・交通](https://bakusai.com/thr_tl/acode=10/ctgid=120/bid=3472/) | [ジェットライン福岡](https://bakusai.com/thr_res/acode=10/ctgid=120/bid=3472/tid=10762479/) | 29 | 0 |
| [hokuriku](https://bbs-menu.pages.dev/bakusai_bbsmenu/hokuriku_bbsmenu.json) | [富山運輸・交通](https://bakusai.com/thr_tl/acode=6/ctgid=120/bid=3484/) | [神出鬼没!頭文字Ｈ](https://bakusai.com/thr_res/acode=6/ctgid=120/bid=3484/tid=13603873/) | 8 | 0 |
| [kansai](https://bbs-menu.pages.dev/bakusai_bbsmenu/kansai_bbsmenu.json) | [大阪運輸・交通](https://bakusai.com/thr_tl/acode=7/ctgid=120/bid=3460/) | [フェラされたいトラック運転手](https://bakusai.com/thr_res/acode=7/ctgid=120/bid=3460/tid=12490906/) | 38 | 0 |
| [kitakanto](https://bbs-menu.pages.dev/bakusai_bbsmenu/kitakanto_bbsmenu.json) | [栃木運輸・交通](https://bakusai.com/thr_tl/acode=15/ctgid=120/bid=3452/) | [アクティチャレンジ](https://bakusai.com/thr_res/acode=15/ctgid=120/bid=3452/tid=12167020/) | 31 | 0 |
| [kitatohoku](https://bbs-menu.pages.dev/bakusai_bbsmenu/kitatohoku_bbsmenu.json) | [青森運輸・交通](https://bakusai.com/thr_tl/acode=14/ctgid=120/bid=3466/) | [田舎館 陸奥ライン](https://bakusai.com/thr_res/acode=14/ctgid=120/bid=3466/tid=12947331/) | 33 | 0 |
| [koshinetstu](https://bbs-menu.pages.dev/bakusai_bbsmenu/koshinetstu_bbsmenu.json) | [山梨運輸・交通](https://bakusai.com/thr_tl/acode=4/ctgid=120/bid=3479/) | [大成物流](https://bakusai.com/thr_res/acode=4/ctgid=120/bid=3479/tid=13607310/) | 2 | 0 |
| [minamikanto](https://bbs-menu.pages.dev/bakusai_bbsmenu/minamikanto_bbsmenu.json) | [神奈川運輸・交通](https://bakusai.com/thr_tl/acode=3/ctgid=120/bid=3448/) | [246で煽られた💢](https://bakusai.com/thr_res/acode=17/ctgid=120/bid=3448/tid=10333390/) | 18 | 0 |
| [minamitohoku](https://bbs-menu.pages.dev/bakusai_bbsmenu/minamitohoku_bbsmenu.json) | [宮城運輸・交通](https://bakusai.com/thr_tl/acode=2/ctgid=120/bid=3469/) | [何でトラックドライバーってオッサンしかいないの？](https://bakusai.com/thr_res/acode=2/ctgid=120/bid=3469/tid=13214177/) | 14 | 0 |
| [nanbukyusyu](https://bbs-menu.pages.dev/bakusai_bbsmenu/nanbukyusyu_bbsmenu.json) | [熊本運輸・交通](https://bakusai.com/thr_tl/acode=16/ctgid=120/bid=3475/) | [違法な白ナンバーダンプ](https://bakusai.com/thr_res/acode=16/ctgid=120/bid=3475/tid=13060399/) | 41 | 0 |
| [okinawa](https://bbs-menu.pages.dev/bakusai_bbsmenu/okinawa_bbsmenu.json) | [沖縄運輸・交通](https://bakusai.com/thr_tl/acode=11/ctgid=120/bid=3500/) | [運輸関係のお兄さん誰でもしゃぶります](https://bakusai.com/thr_res/acode=11/ctgid=120/bid=3500/tid=13175419/) | 11 | 0 |
| [sanin](https://bbs-menu.pages.dev/bakusai_bbsmenu/sanin_bbsmenu.json) | [鳥取運輸・交通](https://bakusai.com/thr_tl/acode=12/ctgid=120/bid=3494/) | [スバリストのトラック運転手](https://bakusai.com/thr_res/acode=12/ctgid=120/bid=3494/tid=12916460/) | 45 | 0 |
| [sanyo](https://bbs-menu.pages.dev/bakusai_bbsmenu/sanyo_bbsmenu.json) | [岡山運輸・交通](https://bakusai.com/thr_tl/acode=8/ctgid=120/bid=3491/) | [地球温暖化対策 コスト大幅削減 ソーラーEVトラックは可能か？](https://bakusai.com/thr_res/acode=8/ctgid=120/bid=3491/tid=13443351/) | 3 | 0 |
| [shikoku](https://bbs-menu.pages.dev/bakusai_bbsmenu/shikoku_bbsmenu.json) | [徳島運輸・交通](https://bakusai.com/thr_tl/acode=9/ctgid=120/bid=3496/) | [社長に言いたいこと](https://bakusai.com/thr_res/acode=9/ctgid=120/bid=3496/tid=13259155/) | 41 | 0 |
| [tokai](https://bbs-menu.pages.dev/bakusai_bbsmenu/tokai_bbsmenu.json) | [愛知運輸・交通](https://bakusai.com/thr_tl/acode=5/ctgid=120/bid=3487/) | [名豊興運株式会社](https://bakusai.com/thr_res/acode=5/ctgid=120/bid=3487/tid=6947748/) | 25 | 0 |
| [hokubukyusyu](https://bbs-menu.pages.dev/bakusai_bbsmenu/hokubukyusyu_bbsmenu.json) | [佐賀災害](https://bakusai.com/thr_tl/acode=10/ctgid=148/bid=1560/) | [台風がやってきた](https://bakusai.com/thr_res/acode=20/ctgid=148/bid=1560/tid=2875978/) | 33 | 0 |
| [hokubukyusyu](https://bbs-menu.pages.dev/bakusai_bbsmenu/hokubukyusyu_bbsmenu.json) | [長崎災害](https://bakusai.com/thr_tl/acode=10/ctgid=148/bid=1561/) | [緊急 阿蘇山大噴火に備えろ](https://bakusai.com/thr_res/acode=20/ctgid=148/bid=1561/tid=4675988/) | 31 | 0 |
| [hokubukyusyu](https://bbs-menu.pages.dev/bakusai_bbsmenu/hokubukyusyu_bbsmenu.json) | [大分災害](https://bakusai.com/thr_tl/acode=10/ctgid=148/bid=1563/) | [集中豪雨](https://bakusai.com/thr_res/acode=20/ctgid=148/bid=1563/tid=4808121/) | 19 | 0 |
| [kitakanto](https://bbs-menu.pages.dev/bakusai_bbsmenu/kitakanto_bbsmenu.json) | [栃木災害](https://bakusai.com/thr_tl/acode=15/ctgid=148/bid=1532/) | [人災](https://bakusai.com/thr_res/acode=15/ctgid=148/bid=1532/tid=6835208/) | 20 | 0 |
| [hokkaido](https://bbs-menu.pages.dev/bakusai_bbsmenu/hokkaido_bbsmenu.json) | [サッカー国内](https://bakusai.com/thr_tl/acode=1/ctgid=123/bid=1122/) | [テゲバジャ一ロ宮崎](https://bakusai.com/thr_res/acode=1/ctgid=123/bid=1122/tid=13031645/) | 20 | 0 |

## 47都道府県の代表板

| 都道府県 | メニュー | 板 | スレ | 結果 |
| --- | --- | --- | --- | --- |
| 北海道 | hokkaido | [板](https://bakusai.com/thr_tl/acode=1/ctgid=104/bid=440/) | [スレ](https://bakusai.com/thr_res/acode=1/ctgid=104/bid=440/tid=13435446/) | 27行・未取得0 |
| 青森 | kitatohoku | [板](https://bakusai.com/thr_tl/acode=14/ctgid=104/bid=372/) | [スレ](https://bakusai.com/thr_res/acode=14/ctgid=104/bid=372/tid=13236333/) | 17行・未取得0 |
| 岩手 | kitatohoku | [板](https://bakusai.com/thr_tl/acode=14/ctgid=104/bid=346/) | [スレ](https://bakusai.com/thr_res/acode=14/ctgid=104/bid=346/tid=13600974/) | 9行・未取得0 |
| 宮城 | minamitohoku | [板](https://bakusai.com/thr_tl/acode=2/ctgid=104/bid=333/) | [スレ](https://bakusai.com/thr_res/acode=2/ctgid=104/bid=333/tid=8555205/) | 16行・未取得0 |
| 秋田 | kitatohoku | [板](https://bakusai.com/thr_tl/acode=14/ctgid=104/bid=347/) | [スレ](https://bakusai.com/thr_res/acode=14/ctgid=104/bid=347/tid=7703614/) | 21行・未取得0 |
| 山形 | minamitohoku | [板](https://bakusai.com/thr_tl/acode=2/ctgid=104/bid=331/) | [スレ](https://bakusai.com/thr_res/acode=2/ctgid=104/bid=331/tid=13611124/) | 14行・未取得0 |
| 福島 | minamitohoku | [板](https://bakusai.com/thr_tl/acode=2/ctgid=104/bid=432/) | [スレ](https://bakusai.com/thr_res/acode=2/ctgid=104/bid=432/tid=13560575/) | 49行・未取得0 |
| 茨城 | kitakanto | [板](https://bakusai.com/thr_tl/acode=15/ctgid=104/bid=423/) | [スレ](https://bakusai.com/thr_res/acode=15/ctgid=104/bid=423/tid=8920965/) | 30行・未取得0 |
| 栃木 | kitakanto | [板](https://bakusai.com/thr_tl/acode=15/ctgid=104/bid=426/) | [スレ](https://bakusai.com/thr_res/acode=15/ctgid=104/bid=426/tid=12548839/) | 38行・未取得0 |
| 群馬 | kitakanto | [板](https://bakusai.com/thr_tl/acode=15/ctgid=104/bid=420/) | [スレ](https://bakusai.com/thr_res/acode=15/ctgid=104/bid=420/tid=6860786/) | 27行・未取得0 |
| 埼玉 | minamikanto | [板](https://bakusai.com/thr_tl/acode=3/ctgid=104/bid=414/) | [スレ](https://bakusai.com/thr_res/acode=3/ctgid=104/bid=414/tid=13510901/) | 30行・未取得0 |
| 千葉 | minamikanto | [板](https://bakusai.com/thr_tl/acode=3/ctgid=104/bid=429/) | [スレ](https://bakusai.com/thr_res/acode=3/ctgid=104/bid=429/tid=12890884/) | 36行・未取得0 |
| 東京 | minamikanto | [板](https://bakusai.com/thr_tl/acode=3/ctgid=104/bid=411/) | [スレ](https://bakusai.com/thr_res/acode=3/ctgid=104/bid=411/tid=4615639/) | 38行・未取得0 |
| 神奈川 | minamikanto | [板](https://bakusai.com/thr_tl/acode=3/ctgid=104/bid=453/) | [スレ](https://bakusai.com/thr_res/acode=3/ctgid=104/bid=453/tid=11403461/) | 19行・未取得0 |
| 新潟 | koshinetstu | [板](https://bakusai.com/thr_tl/acode=4/ctgid=104/bid=330/) | [スレ](https://bakusai.com/thr_res/acode=4/ctgid=104/bid=330/tid=13063277/) | 32行・未取得0 |
| 富山 | hokuriku | [板](https://bakusai.com/thr_tl/acode=6/ctgid=104/bid=456/) | [スレ](https://bakusai.com/thr_res/acode=6/ctgid=104/bid=456/tid=13612049/) | 37行・未取得0 |
| 石川 | hokuriku | [板](https://bakusai.com/thr_tl/acode=6/ctgid=104/bid=343/) | [スレ](https://bakusai.com/thr_res/acode=6/ctgid=104/bid=343/tid=13503996/) | 9行・未取得0 |
| 福井 | hokuriku | [板](https://bakusai.com/thr_tl/acode=6/ctgid=104/bid=272/) | [スレ](https://bakusai.com/thr_res/acode=6/ctgid=104/bid=272/tid=10722540/) | 40行・未取得0 |
| 山梨 | koshinetstu | [板](https://bakusai.com/thr_tl/acode=4/ctgid=104/bid=268/) | [スレ](https://bakusai.com/thr_res/acode=4/ctgid=104/bid=268/tid=5829751/) | 欠番#6・全件取得不合格 |
| 長野 | koshinetstu | [板](https://bakusai.com/thr_tl/acode=4/ctgid=104/bid=262/) | [スレ](https://bakusai.com/thr_res/acode=4/ctgid=104/bid=262/tid=10945687/) | 25行・未取得0 |
| 岐阜 | tokai | [板](https://bakusai.com/thr_tl/acode=5/ctgid=104/bid=476/) | [スレ](https://bakusai.com/thr_res/acode=5/ctgid=104/bid=476/tid=13605901/) | 19行・未取得0 |
| 静岡 | tokai | [板](https://bakusai.com/thr_tl/acode=5/ctgid=104/bid=350/) | [スレ](https://bakusai.com/thr_res/acode=5/ctgid=104/bid=350/tid=13526805/) | 3行・未取得0 |
| 愛知 | tokai | [板](https://bakusai.com/thr_tl/acode=5/ctgid=104/bid=471/) | [スレ](https://bakusai.com/thr_res/acode=5/ctgid=104/bid=471/tid=13606747/) | 4行・未取得0 |
| 三重 | tokai | [板](https://bakusai.com/thr_tl/acode=5/ctgid=104/bid=351/) | [スレ](https://bakusai.com/thr_res/acode=5/ctgid=104/bid=351/tid=13345877/) | 17行・未取得0 |
| 滋賀 | kansai | [板](https://bakusai.com/thr_tl/acode=7/ctgid=104/bid=238/) | [スレ](https://bakusai.com/thr_res/acode=7/ctgid=104/bid=238/tid=13415720/) | 14行・未取得0 |
| 京都 | kansai | [板](https://bakusai.com/thr_tl/acode=7/ctgid=104/bid=417/) | [スレ](https://bakusai.com/thr_res/acode=7/ctgid=104/bid=417/tid=13610756/) | 3行・未取得0 |
| 大阪 | kansai | [板](https://bakusai.com/thr_tl/acode=7/ctgid=104/bid=349/) | [スレ](https://bakusai.com/thr_res/acode=7/ctgid=104/bid=349/tid=13534979/) | 45行・未取得0 |
| 兵庫 | kansai | [板](https://bakusai.com/thr_tl/acode=7/ctgid=104/bid=435/) | [スレ](https://bakusai.com/thr_res/acode=7/ctgid=104/bid=435/tid=13542057/) | 20行・未取得0 |
| 奈良 | kansai | [板](https://bakusai.com/thr_tl/acode=7/ctgid=104/bid=232/) | [スレ](https://bakusai.com/thr_res/acode=7/ctgid=104/bid=232/tid=13575012/) | 11行・未取得0 |
| 和歌山 | kansai | [板](https://bakusai.com/thr_tl/acode=7/ctgid=104/bid=226/) | [スレ](https://bakusai.com/thr_res/acode=7/ctgid=104/bid=226/tid=13603123/) | 15行・未取得0 |
| 鳥取 | sanin | [板](https://bakusai.com/thr_tl/acode=12/ctgid=104/bid=131/) | [スレ](https://bakusai.com/thr_res/acode=12/ctgid=104/bid=131/tid=13605431/) | 29行・未取得0 |
| 島根 | sanin | [板](https://bakusai.com/thr_tl/acode=12/ctgid=104/bid=125/) | [スレ](https://bakusai.com/thr_res/acode=12/ctgid=104/bid=125/tid=13599232/) | 9行・未取得0 |
| 岡山 | sanyo | [板](https://bakusai.com/thr_tl/acode=8/ctgid=104/bid=449/) | [スレ](https://bakusai.com/thr_res/acode=8/ctgid=104/bid=449/tid=2868250/) | 50行・未取得0 |
| 広島 | sanyo | [板](https://bakusai.com/thr_tl/acode=8/ctgid=104/bid=460/) | [スレ](https://bakusai.com/thr_res/acode=8/ctgid=104/bid=460/tid=11161368/) | 13行・未取得0 |
| 山口 | sanyo | [板](https://bakusai.com/thr_tl/acode=8/ctgid=104/bid=119/) | [スレ](https://bakusai.com/thr_res/acode=8/ctgid=104/bid=119/tid=13608985/) | 4行・未取得0 |
| 徳島 | shikoku | [板](https://bakusai.com/thr_tl/acode=9/ctgid=104/bid=72/) | [スレ](https://bakusai.com/thr_res/acode=9/ctgid=104/bid=72/tid=13606750/) | 13行・未取得0 |
| 香川 | shikoku | [板](https://bakusai.com/thr_tl/acode=9/ctgid=104/bid=83/) | [スレ](https://bakusai.com/thr_res/acode=9/ctgid=104/bid=83/tid=13612142/) | 3行・未取得0 |
| 愛媛 | shikoku | [板](https://bakusai.com/thr_tl/acode=9/ctgid=104/bid=78/) | [スレ](https://bakusai.com/thr_res/acode=9/ctgid=104/bid=78/tid=3764724/) | 44行・未取得0 |
| 高知 | shikoku | [板](https://bakusai.com/thr_tl/acode=9/ctgid=104/bid=66/) | [スレ](https://bakusai.com/thr_res/acode=9/ctgid=104/bid=66/tid=13605636/) | 35行・未取得0 |
| 福岡 | hokubukyusyu | [板](https://bakusai.com/thr_tl/acode=10/ctgid=104/bid=446/) | [スレ](https://bakusai.com/thr_res/acode=10/ctgid=104/bid=446/tid=10808020/) | 35行・未取得0 |
| 佐賀 | hokubukyusyu | [板](https://bakusai.com/thr_tl/acode=10/ctgid=104/bid=394/) | [スレ](https://bakusai.com/thr_res/acode=10/ctgid=104/bid=394/tid=12952312/) | 42行・未取得0 |
| 長崎 | hokubukyusyu | [板](https://bakusai.com/thr_tl/acode=10/ctgid=104/bid=389/) | [スレ](https://bakusai.com/thr_res/acode=10/ctgid=104/bid=389/tid=13058762/) | 28行・未取得0 |
| 熊本 | nanbukyusyu | [板](https://bakusai.com/thr_tl/acode=16/ctgid=104/bid=404/) | [スレ](https://bakusai.com/thr_res/acode=16/ctgid=104/bid=404/tid=13602470/) | 34行・未取得0 |
| 大分 | hokubukyusyu | [板](https://bakusai.com/thr_tl/acode=10/ctgid=104/bid=398/) | [スレ](https://bakusai.com/thr_res/acode=10/ctgid=104/bid=398/tid=13532519/) | 50行・未取得0 |
| 宮崎 | nanbukyusyu | [板](https://bakusai.com/thr_tl/acode=16/ctgid=104/bid=463/) | [スレ](https://bakusai.com/thr_res/acode=16/ctgid=104/bid=463/tid=13459044/) | 2行・未取得0 |
| 鹿児島 | nanbukyusyu | [板](https://bakusai.com/thr_tl/acode=16/ctgid=104/bid=469/) | [スレ](https://bakusai.com/thr_res/acode=16/ctgid=104/bid=469/tid=11094894/) | 29行・未取得0 |
| 沖縄 | okinawa | [板](https://bakusai.com/thr_tl/acode=11/ctgid=104/bid=385/) | [スレ](https://bakusai.com/thr_res/acode=11/ctgid=104/bid=385/tid=13232173/) | 23行・未取得0 |

生データとJSONはbuild/external-board-dates/regions、prefectures、menu-threads-verified。Cookieファイルは非公開・Git対象外。再現用scripts/VerifyBakusaiMenuThreads.javaは板ごとの結果、転送先、採取日時、実URL、本文・返信の有無、未取得枠数を保存する。最初の追加20板の試験は試験ツール側のCRLFステータス判定誤りで停止したため、結果には数えず修正後の全20板再実行を採用した。

追補: 最終候補の191/226/242でそれぞれ615/621/618項目が成功し、検証中の新規crash bufferは0行。栃木運輸・交通12167020は191の実HTTP200/199481bytes/実DAT31行/標準画面31件、サッカー国内13031645も実HTTP200/183618bytes/実DAT20行/標準画面20件で成功。実通信ログはlive-tochigi.log、live-football.log。全67件のAndroid画面確認をしたという意味ではない。詳細はsite-thread-dates-20261108.md。公開は既存dev CI経路で行う。

公開済み: [1.25.0-dev.12](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.12)。配布MPP/JSON/公開devメタデータの整合性を確認。
