# 共有NGの固定ラベル誤検知・端末内編集（2026-11-07）

配信feedのread-only GETに成功し、条件ハッシュ66c2e2e0d0209c2ea0db45839ca8ed0ecc00200f7fa0b85ec2e6f413aecb2ed6の実条件を確認した。

`(^|\n)\p{Extended_Pictographic}{6}|ゴミ|死期|ワッチョイ|ﾜｯﾁｮｲ|老害|信者|無能|ガイジ|コロコロ`

提示文「ﾜｯﾁｮｲやIPのNGも「()」「-」や「ﾜｯﾁｮｲ」を対象外にしないと同じ事をされると思う」は、この条件の独立したﾜｯﾁｮｲ分岐に一致する。最初のユーザー記載式のままではAndroidでも一致しないことを独立したapp_process probeで確認後、実配信条件を特定した。feed全体はbuild/ng-reported-probe/feed.json、probe出力はandroid.log。サーバー更新・条件削除は行っていない。

NgRegexSafetyを拡張。共有keyword正規表現の単純なリテラル分岐にも既存の共有用5文字以上/英字のみ不可の基準を適用し、短い単語をORで連結して見かけの長さを増やす条件全体を自動適用から外す。既存の散在単一文字カウント判定は維持。Javaの\\Q引用内にある縦棒は分岐として扱わない。一般の正規表現の意味解析ではなく、複雑な構文に対する網羅的検知を保証しない。

共有NGのID/ワッチョイ/名前等のregex実一致部分が括弧・ハイフン・IP区切り・固定のﾜｯﾁｮｲ/ワッチョイ/IPラベルだけなら、識別子の根拠にしない。名前のリテラル条件も同じ基準。本文regexにも固定ラベル・句読点・空白だけの一致を無視するが、絵文字は有効な内容として保持。元の対象文字列は変更せず、先の記号だけの一致を飛ばして後続の実際の識別値を引き続き探す。標準ローカルNGには介入しない。

SharedNgLocalEditsを追加。元の配信条件/キャッシュ/送信データは変更せず、元ハッシュをキーに条件文とregex指定だけをprefsのlocalEditsV1へ保存（1000件/各2000文字まで）。適用時はレポーター除外→ローカル編集→既存の報告数/掲示板/種類/個別除外/配信停止の順に判定する。最新feedの票数・配信停止・contributorsを保持し、同じhashの同期や再起動後も編集を適用。hashが変わった別条件へ編集を自動継承しない。編集した条件は明示的なユーザー指定として、ダウンロードルールへの広すぎる式のガードとは独立して適用する。元の条件へ戻す操作は対象hashの編集だけを消す。

UI: 「受信した条件・端末内編集・個別解除」から「条件をこの端末で編集」、または行の長押し。編集してもチェックによる個別除外の選択は変えない。保存時に型/regexを検証し、不正な式はエラーを出してダイアログを維持。キャンセルは保存しない。配信条件に戻すボタンあり。

ホスト検証: 誤検知57、既存ルール96、索引等価10306、regex17、除外263項目成功。最初の製品ビルドはLint/R8含め3m30s成功。句読点のみの本文一致と絵文字保持の最終調整を加え、再ビルド・Android試験中。計測PCの仮想メモリ余裕が少ないためemulator-5580を正常終了してビルド、データ消去なし。

Android試験の前段242では、実配信式の再現と固定ラベル対策、実IP値の保持、local編集の保存/復元/同期/票数/配信停止/個別除外/invalid時の保持/選択編集だけresetなど44項目まで成功。アクセシビリティ経由のdialog取得で失敗し、成功扱いせず試験を修正。最終UIにScrollViewを追加し、originalRule検索はlocal編集済みの行だけに限定して一覧の全件検索反復を避けた。編集dialogを返すようにし、同じ実ボタン/入力欄の検査へ切替。native回帰/最終3版試験は継続中。



最終UIビルドshared-ng-local-edits-ui-build.logは通常Lint/R8含め4m32s成功。242の先行UI試験は49項目まで成功、キャンセル直後のisShowing確認がAndroidの非同期dismiss前だったためwaitForIdleSyncを挟んで再検証する。226のAPK生成はPC側JVM native memory不足で失敗、端末アプリのOOMとは区別する。エミュレータを正常停止し、single thread/Xmx640mで226再生成成功。これらの失敗を製品試験成功に含めない。



最終ビルドshared-ng-local-edits-ui-build.log成功4m32s。全3版APK生成/固定hook保持PASS。242は最終試験51項目PASS（shared-ng-local-edits-ui242-final-runtime.log）。ユーザーが『一つのバージョンで確認できたらプレリリースしていい』と明示したため確認範囲を公開ノートに記載して先行配布する。226/191の最終画面検証は継続し、未完了を成功として数えない。エミュレータRAM4096で226導入中に応答不能、当該AVD/portのプロセスのみ停止して3072でcold boot、データ消去なし。



追加確認完了: 最終MPPから生成した242=51項目（shared-ng-local-edits-ui242-final-runtime.log）、226=51/191=48項目（shared-ng-local-edits-ui<版>-final-runtime-retry.log）成功。3072MiBでの再起動後は226/191も署名照合install-r Success。同期/再読込/元へ戻す/不正regex拒否/編集dialogの実ボタン/キャンセルとチェック保持を検査。試験用SharedPreferencesの専用namespaceで正常save/resetを確認し、実ユーザー設定の編集保存は行わない。UIのvalid saveの状態遷移はストア/overlay/indexの試験と、実dialogのinvalid/cancel試験に分けて確認。画像取得のscreenshotは0bytesで視覚確認に利用できず、スクショ目視成功とは扱わない。



最終MPPの通常native回帰も全3版成功: 191=276、226=285、242=282項目（shared-ng-local-edits-ui<版>-reader.log）。標準本文/画像/模擬投稿dialogの成功終了/拒否時入力保持、HTTPS ONを確認。公開POST0。RAM3072で開始時刻以降のcrash buffer0行（shared-ng-local-edits-final-crash.log）。今回もCI配布物自身の再導入ではなく同一製品ソースのローカル最終MPPで確認。



1.25.0-dev.7検証用公開完了: CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42372305439 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.7 / 2026-11-07 21:29:21 JST。APIでprerelease=true/draft=false、配布MPP/bundle JSON2個/任意ZIP3個を確認。MPPを実ダウンロードし7003901bytes / SHA256 b07953c30763e9024d9a1a303c5e53b43cda50c50933e689cdea964174c73870。pre JSONのversion/download_url一致。ソース6ea80066、CI生成860c596aをff-only取得、生成ファイル手編集なし。公開開始時点の1版先行配布の説明は保守的なまま維持したが、公開待ち中に全3版の専用試験/通常native回帰を完了。配布MPP自体の再パッチ/導入は未実施。

