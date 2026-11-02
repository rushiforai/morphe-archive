# 公式Release候補の検証（2026-11-01）

## 変更

- 下部フィルター：上端つまみ、保存高さ、つまみ表示切替。88dp以上・画面可視領域内へ制限。ScrollViewで全項目へアクセス、常時表示は本文viewportを確保。
- 必死専用ビューア：実行時設定とパッチavailabilityの両方を確認。通常ChMateへfallback、エッヂ過去ログは独立。
- 共有NG：Java正規表現を受信・cache・適用。2ms単位の評価期限、不正式skip。GASの種類別履歴・自動承認は既存version13へ反映済み。
- 191：各board/thread GETのpoolを個別化、idle最大0、Connection closeを併用。共有client/TLS/認証/投稿/画像は維持。TCP候補開始250ms→50ms、global budget8を維持。全体上限は新規初期60秒、既存0/30/60/120秒は保持。
- 前スレ：5ch read.cgiリンクは90日未満も自動取得の判定へ。HTTP→HTTPS、net→io、レス番号/query/fragment保持。既存DATは再取得せず、live DATがあれば標準処理へ。外板を5chミラーへ送らない。アーカイブGETで308/307等の転送、loop/サイズ/時間制限。

## 検証

- Gradle通常Lint/R8成功：build/release118-final-build.log（2m46s）。MPP SHA256 d32d05f38927879d4b9813846d3d47ea4cb2a081098875022f28b3ab58720910。
- 3版ON APK署名照合・導入・起動成功。初期OFF APKも3版各18項目で標準viewerへの戻りを確認。ON実APK各4項目成功。availabilityをmockする古い試験は使用しない。
- 各版：共有NG18（改行/Java DOTALL、不正式だけskip、cache再読込、OFF/除外、日付なし/親掲示板）、下部フィルター28（ドラッグ/保存/非表示/取消/viewport/scroll/popup）、native reader18/18/20、album7、検索38、Web検索6。
- 既読スレを上に：設定入口/保存OFFとの同期/再生成3項目、前スレURLの新旧/selector/設定OFF/外板除外6項目を3版確認。
- 191 pool分離8項目、旧プールに接続を残したlocal serverで4回561/316/595/580ms、各requestOnSocket=1。old pool・共有clientを変更せず、画像とPOST除外、OFF/上限0保持。
- 191 stream：1026→4進捗通知、2秒の短い既存上限で連続受信を2003msで中断、次の取得成功。17項目。
- host TCP20（代替開始112ms計測）、archive URL18、HTTP転送8、共有NG rules96/index10003/regex17、GAS53/74/148等。
- native命令継続：前回検証済みversion-parity-final APKと最終APKの対象reader/patrol/update 22/6/6メソッドで全命令/register/branch保持。191 configure橋の15execute sites、8regs、p0保持も検査。native未patch APKとの単純比較は既存変更も含めて失敗したため、今回追加差分の継続検査として区別。

- 最終メディア：191/226各8項目、242は14項目成功。標準image/GIFと専用GIF/動画を実際に表示し、native終了/設定済み戻る/左右移動を確認。最終crash buffer空。

## 限界・試験の修正

- 実回線での巡回一巡・報告された実前スレは未再現。DNSのOS処理等は即中断できない場合がある。取得先にログがない場合の取得保証なし。
- 前スレimporterメソッドをFridaでmockした初期試験はR8の内部呼出しに適用されず不成立。最終試験は自動取得OFFでURL正規化と判定/settingを確認。自動取得ONでのnative全経路はsource/native entryと同梱検査で補完し、実取得成功と同一視しない。
- testのInput.text、JSONArray overload、Activity cast、画面準備・前面アプリ状態を修正。旧期限/細板の期待値を現在仕様へ合わせた。これらの失敗を成功に数えない。
- PC仮想メモリ不足で追加ビルドとエミュレータADBが停止した試験あり。エミュレータは同AVD・同dataで再起動。消去/アンインストールなし。公開CIのコンパイル成功とartifact照合を最終条件とする。
- 全機能を全版へ機械的移植したとはしない。版条件の残るUI機能と理由はversion-parity-20261101.mdに記録。
