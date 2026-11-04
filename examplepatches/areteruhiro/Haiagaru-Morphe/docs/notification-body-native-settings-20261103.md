# 5ch通知本文と標準設定一覧の修正

## 原因と変更

5chの正常なDATでも名前欄が`<b>`で始まる場合がある。ThreadWatchRules.bodiesの先頭`<`判定がDAT全体をHTMLエラーとみなし、本文プレビューを空にしていた。先頭文字の判定を除き、各レスの`<>`区切り5項目以上を確認する。名前欄が空でも解析する。subject.txtのHTML除外、本文取得上限、通知する件数、HTML除去、登録token照合は維持する。

実機d5497008の既存隔離242をFridaでread-only調査。公開5ch DATはHTTP200・先頭`<`・各行5項目。修正した純粋パーサーを別名の一時DEXとしてロードし、109レス中の最終1レスの本文180文字を取得。本文や投稿者IDは証跡へ出さず、件数・文字数だけ記録。アプリ設定・利用者登録を変更しない。一時DEXとADB forward27053は削除済み。証跡`build/notification-5ch-{real-transport,dat-shape,real-parser}.json`。

設定入口は画面上部の独立FrameLayoutから、native設定一覧の「セーフモード」直前の通常項目へ変更。説明文なし。191/226は固定のnative PreferenceScreen構築メソッドで通常Preferenceを追加しIntentで開く。242は固定catalogへ項目を追加し、通常リスト・検索結果の2つのクリックコールバックをキーで分岐して開く。nativeのheader/page/navigationを変更する前に完了するため、戻ってもセーフモードのサブページに入らない。標準項目は元の処理を継続する。

## 検証

ホストThreadWatchRulesTest32項目成功。タグ付き名前・空の名前の回帰例を含む。実アプリ通知fixtureもタグ付き名前に変更し、修正前ビルドでは本文検証が失敗することを確認、再ビルド後に191/226/242各17項目成功。242背景Job20→22件の本文通知と次回予約も確認する。試験は隔離packageのみ、登録・通知・間隔を終了時に復元。

最初のビルドはソース編集とコンパイルのタイミングが重なり旧パーサーだったため破棄。System UI ANR中のUI試験、Activity表示文字列の違い・待機不足のハーネス失敗も成功として数えない。242の初期候補で戻り後にセーフモードへ遷移する問題を再現、nativeの遷移全体を避けるクリック入口の分岐へ修正した。最終候補の結果と導入情報は検証後に追記する。

利用者指定で今回未変更のスレ本文表示・画像/GIF/動画の広い再検証は省略。通常アプリの削除・データ消去・実投稿・共有NG送信・GAS変更なし。


最終通常Lint/R8 build `build/native-settings-row-navigation-final-build.log` 成功3m30s、MPP SHA256 `3a2bbf4579eaf9b42ad06d69092f8d4ef8916795bd7e5212d7746c57a64a9033`。3版の設定追加フック計5メソッドは元の全命令・register数保持を検査（`build/native-settings-row-hook-verification.json`）。emulator-5580の署名一致隔離3packageで通知各17・native内容保持191/226各6、242は8・UI設定191/226各12、242は18項目成功。242背景Jobの本文通知と次回予約成功、テスト登録/通知/間隔を復元、実APK SHA一致、新規fatalなし。詳細`build/native-settings-release-final-summary.json`、`native-settings-row-result-{191,226,242}.json`、`thread-watch-content-background-result.json`、導入台帳。公開は既存Semantic Release CIで行う。


## 追加報告: 242 S2M設定の0除算

Pixel 10a / Android17 / 242 devの提供ログは`S2MSettingActivity.onCreate(:311)`でArithmeticException。元DEXのdebug lineと照合し、311行の唯一の可変除数`div-int/2addr v7,v2`を特定した。v7はメソッド先頭から0で、この除算まで再代入されない。直後の`Lo/zzbow;`コールバック生成に渡す通常の結果0を`const/4 v7,0`で直接与える。設定処理全体を例外で握りつぶさず、他の計算・標準初期化・callbackを維持する。191/226の処理へ変更なし。

修正前隔離エミュレータでは3回の起動でクラッシュ未再現。報告実機は未検証であり、ユーザー環境での再現・解消を断定しない。最終ビルドは`build/notification-settings-s2m-final-build.log`、通常Lint/R8成功1m5s。MPP SHA256 `87ac79db6fdca09f4bb480046b1ff7951a570ea641b0bbae56472f02fbd666b4`。前候補とextension MPEが全て同一で、191/226の共通実装も同一。242 onCreate全体の差分は当該1命令だけ、register数維持（`build/s2m242-final-hook-verification.json`）。最終242で通知17・設定UI18・native保持8項目を再確認し、背景Job/S2M画面起動も試験する。


最終242: 通知17/設定UI18/内容保持8/S2M画面3回起動成功、最終実APK hash一致。Fridaの通信hook背景試験はART native SIGSEGVで中断し成功扱いせず、フック無しの実通信へ検証を変更。実5ch Jobで前回件数0のfixtureから117件取得→本文付き通知→次回予約成功、新規fatalなし。テスト登録と通知を除去、確認間隔初期15分へ。実際の新着117投稿を観測した試験ではない。build/notification-real5ch-uninstrumented-result.json、s2m242-final-runtime.json。Frida試験の追加コマンドは自動承認レビューでblocked by policy（具体理由なし）となり未実行、代わりにフック無し試験を完了。Pixel 10a/Android17実機未検証。


公式[1.20.2](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.20.2)へ収録済み。既存Semantic Release/Build CI成功、配布MPP digest/CRC/本文解析DEX/新設定入口/S2M値0修正/READMEを確認。公開説明は利用者指定の一文を削除。準備段階で中止した1.20.1はRelease未作成。公開MPP SHA256 `a676f8f38b33b22171386265361ecbf2202a97d512966b25b470b2e8737864e0`。feed本体は全branch1.20.2、短縮main stable URLだけCDNキャッシュの旧表示を観測、詳細integration-statusとbuild/official1202-public/verification.json。
