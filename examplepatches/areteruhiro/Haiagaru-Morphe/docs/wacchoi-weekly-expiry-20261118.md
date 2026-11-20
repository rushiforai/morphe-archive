# ワッチョイ関連NGの週次期限

エッヂの指定スレは現在の掲示板から `410 Gone`（dat落ち）で本文を取得できなかった。アーカイブされた同内容のスレ本文を確認したところ、ワッチョイ生成に使う seed は Unix epoch からの経過週数で、毎週木曜日に変わるという説明だった。これは [該当スレのアーカイブ](https://logisoku.com/160147) に記載されている。

エッヂの公開ソース [edginer/eddiner `bbs_cgi.rs`](https://github.com/edginer/eddiner/blob/main/src/routes/bbs_cgi.rs) では、`generate_date_seed` が Unix timestamp を `60 * 60 * 24 * 7` で割って seed を作り、その seed がワッチョイの `XX` と `YY` の計算に渡される。したがって実際の更新境界は Unix epoch 起点の7日ごと（木曜日00:00 UTC、JSTでは木曜日09:00）。

登録ごとの「一週間のみNGにする」は既定OFF。5ch／BBSPINKではユーザー申告の更新日に合わせて次の日曜日00:00 JST、エッヂでは上記 Unix 週境界にNGを自動解除する。既存の複合正規表現NGへ追記すると他の条件まで消すおそれがあるため、期限設定は新規の単独ルールだけに適用する。
