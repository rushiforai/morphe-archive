# 初回の共有NG評価負荷を減らす

利用者から、正常regex非一致を再利用する実機候補に「かなり早くなりました」と報告があり、その後に初回も速くしたいと要望。再利用設定は件数・文字数とも999999999を維持する指示を継続する。

## 初回にも適用する処理削減

- native共有NGのHTML判定で、対象scopeが無ければ変換しない。IDの完全一致だけでNGが確定すれば名前・本文とも変換せず、名前等のliteral条件で確定した場合も本文のHTML変換を省く。未確定の場合は従来の本文条件・regex条件へ進む。
- regexをコンパイルする時に、安全に解析できる書式だけ「一致するには必ず含まれる文字列」を取り出す。入力にその文字列が無ければ正規表現エンジンを呼ばずfalseを返す。含まれる場合は既存の正規表現・2ms deadlineで最終判定する。タイムアウト等の非一致を再利用しない仕様は維持する。
- 対応は大小文字区別のliteral連結、dot/wildcard、先頭末尾anchor、quoted literal、単純な正の先読みの連結と外側のDOTALL scope。case folding、OR、文字クラス、後方参照、未知のescape、量指定、入れ子group等は解析を諦め従来の評価へ戻す。正規表現を別条件へ置換したり無効にしたりしない。必要文字列は2文字以上に限定する。
- 新規設定・追加のレスcache・バックグラウンド判定は導入しない。初回でも適用できるが、全条件・全レスで速くなる保証はしない。ChMate標準NG/連鎖や本文描画の動作は変更しない。

## 確認

ホストでguard必要条件・Java Pattern比較371723項目、初回HTML変換省略と再利用3024、index10306、regex17、除外263成功。実機730eae72/XIG05のapp_processで同じ371723項目も成功（実アプリへのFrida hookなし）。テストDEXは/data/local/tmp/haiagaru-ng-first-open-test.dex、設定・本文・NG条件を変更しない。

端末cacheをread-onlyで受信条件集計し、votes/minVotes/revokedを適用したregex254件中231件でguardを構築できた。条件内容は出力・公開しない。種類設定・個別除外・板scope適用後の件数とは区別し、231件すべてが実際の本文で省略されるとはしない。

合成ベンチは200本文×251 regexをキャッシュなしで評価し、guardの使える式と同等の非キャプチャgroupで包んだ従来経路を比較する。実機のスレ表示時間・速度倍率の測定ではない。

最初のbuildはホストJVMのnative allocation約1.1MB失敗で停止（hs_err_pid49484.log）。768MB heap/worker1/ActiveProcessorCount2/Kotlin in-processで再試行中。端末クラッシュとは区別する。最終build/MPP/APK/導入結果は完了後追記する。公式公開なし。

追記: 必要文字列parserの最終修正（dot区切り対応）は先行buildのJava compile後だったため、そのbuildのR8を当該daemon PIDだけ停止し、最終sourceから再ビルドしている（build/shared-ng-first-open-final-build.log）。他のJavaプロセスは停止しない。最終条件は1536MB heap/worker1/ActiveProcessorCount4/Kotlin in-process。合成のDOTALL・正の先読み連結形式200本文×251条件は従来fallback1806.689ms、guard7.030ms、両方一致10件（PC上の測定、実機表示の倍率ではない）。

最終build/buildAndroidは3m12sで成功（build/shared-ng-first-open-final-build.log）。最終sourceの既存テスト3024/10306/17/263も再実行し成功。MPP build/haiagaru-shared-ng-first-open.mpp SHA256 67c00d58af8938fbdfb36bba49a6e20ce432a044473646e2d70c71371096bf71、CRC正常。実機用APK生成中。
