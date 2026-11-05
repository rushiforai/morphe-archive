# NGが多いスレの検索処理の静的最適化

利用者はF5スクリプト荒らし等でNG/共有NGが多いスレを開くまで遅いと報告。今回は共有NGの通常文字列判定で、各本文をNGWord数だけString.contains検索する経路を確認した。標準NG/連鎖判定・正規表現・入力モデル生成も負荷候補として残り、実端末の主因は未特定。

SharedNgIndexの板別bucketに不変NgLiteralMatcherを追加。8種類以上の通常ワード/名前/トリップはUTF-16のAho-Corasick検索でまとめて検索し、同じ本文を条件数だけ走査する処理を削減。8種類未満はString.containsを継続し、重複条件は集約。入力文字合計が200,000を超えるmatcherは追加trieメモリを抑えるため従来走査へ戻す。条件や入力の正規化は既存のまま、板・全板・票数・除外・種類・失効のフィルタは検索器生成前の既存処理を使用。件数ではなく一致の真偽だけを返す既存契約を維持する。本文の正規表現は元入力を使い時間制限付きの既存処理を継続し、標準NG/連鎖の意味・保存データは変更しない。191/226/242共通extension修正、新規bytecodeフックなし。

検証: NgLiteralMatcherTestの95,552比較が成功（全UTF-16文字、重なる語/接尾語/空/乱数/巨大集合fallback/非一致/末尾一致）。SharedNgIndexTestは10,306項目成功（追加で大量word/name/tripの板/全板/閾値/除外）、正規表現17・個別除外263成功。PC上の合成検索試験は2,000通常文字列/5,500 UTF-16文字/非一致1,000回で旧linear2225.991ms対indexed19.9041ms。1回のホスト測定で、Android・スレ遷移の改善率ではない。一致が早い条件や少数条件は異なる性能になり得る。

通常Lint付きbuild/buildAndroidは2m21s成功（build/shared-ng-many-rules-build.log）。ローカル候補build/haiagaru-shared-ng-many-rules.mppのCRCとNgLiteralMatcher同梱を確認。内部dev.11表記はローカル候補で、公開済みを意味しない。

端末でのNG多数スレの起動/本文/画像/スクロール・正規表現多数・標準NG多数の所要時間、実機での症状改善は未確認。先行の静的修正方針を維持し、端末導入/GAS変更/公開はしない。前のURL遷移修正と、dev.11公開のGitHubタグ障害記録は保持する。

利用者が結果報告後に「プレリリースして」と指定。先行の静的/検証用指定を維持し、今回の端末基本動作・クラッシュ・実速度を未確認として公開冒頭に明記する。前回未配布のURL遷移修正と合わせ、既存Semantic Release CIで公開へ。生成version/feedがdev.11でも前のタグ送信失敗によりReleaseは未作成だったため、次番号はCIの判定に委ねる。手動タグ/Release/asset/生成ファイル編集は行わない。

公開完了: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.0-dev.11 、2026-11-04 20:51:17 JST。実装f28f244、CI41823578007のRelease/Attest成功、生成01ce123をdevへFF取得。name=1.23.0-dev.11（検証用）、draft=false/prerelease=true。公開6assetのsize/digest/SHA256・MPP/ZIP CRC・NgLiteralMatcher/URL helper/AA最適化同梱、作業環境パス不在を確認。MPP SHA256 `8a4a7201b4647f8c0a0cb3b3ad40b8619fed33370ace207b84225e6542e3d472`。dev両feedはdev.11、master/mainは正式1.22.1保持。任意3ZIPはdev.9と同一。証跡build/release-1.23.0-dev.11-verify/verification.json。公開CI版MPPからのAPK再生成/端末導入は実施していない。
