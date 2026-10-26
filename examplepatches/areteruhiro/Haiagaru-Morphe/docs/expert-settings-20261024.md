# エキスパート設定（作業中・未公開）

## 依頼

クラッシュ対策以外の全機能をオプション化し、専用のエキスパート設定画面を表示する。

## 今回の実装範囲

- Haiagaru設定のホームとタブ内のカテゴリに「エキスパート設定」を追加。
- 初期OFF。モード変更で既存の機能設定を一括変更しない。既存設定の値、保存先、リスナーを共有する。
- モードONでカテゴリ選択式の設定表示。大量の各機能Viewを同時に生成せず、選択したカテゴリだけ生成する。
- フィルターの個別スイッチもこの画面から表示。設定共有の許可リストにモード値を登録。
- 通常設定とexpert設定を行き来する際にViewキャッシュを再生成し、古いchecked状態を使わない。
- 必須のクラッシュ対策を無効化するスイッチは作らない。認証情報・履歴・NGルール・DATを削除しない。
- 通常設定に見当たらない動作を監査し、スレ更新時のETag／更新日時による条件付き取得を省く処理を「追加の動作切替」へ追加（初期ON）。オフでChMate標準の条件付き取得へ戻す。設定共有ファイルにも含める。

## 設定がなかった動作の監査

- 新たにオプション化: 191／226／242でスレ更新に使う`If-Modified-Since`と`If-None-Match`、241で`If-None-Match`を省いて古い更新情報による「更新なし」を避ける処理。設定キー`skipConditionalThreadRefreshValidators`は初期ONで、従来のHaiagaru動作を維持する。OFF時は元のChMateリクエストを通す。
- 既に設定済み: X／サイトカードの遅延表示時の位置保持、読書位置の保持、タブレットでの再読込抑制、常時下部フィルター、各種プレビュー・検索・保持上限など。重複トグルは追加しない。
- オプション化しない: クラッシュ回避・互換性に必要な修正、画像再バインド時の重複取得防止など、無効化すると誤表示・クラッシュの再発につながる修正。これらを機能選択のように見せるスイッチは設けない。

## 重要: 未完了

既存設定の集約は「全機能の任意化」と同義ではない。今回の更新ヘッダー切替を除き、常時バイトコード変更している非クラッシュ修正の全件監査は継続中。画像/通信の互換処理を一律のmaster falseで止めるとnativeへ正しく戻らないため、そのような見かけだけの一括スイッチは作っていない。

242サムネイル点滅と191固定下部フィルターの実新着位置確認も未完了のまま保持している。今回の設定画面追加でそれらを修正済みとは扱わない。公開しない。

## 検証

途中版は通常Lint付き `:patches:buildAndroid` 成功（build/expert-settings-build.log、build/expert-settings-final-build.log）。JavaからのprepareBindings追記がKotlin compile途中と重なったbuild/expert-settings-verified-build.logはcompile失敗。全追記後のbuild/expert-settings-verified-final-build.logは通常Lint含め3分18秒で成功。

生成候補 `build/expert-settings-preview.mpp` SHA256 `B602D02C2A392B32274506E744570654D4CE873C3EF69B4B5A7199D0237C6373`。242元APKへの適用は `242 automatic requery reset changed` で中断（build/expert-settings-preview242-patch.log）。同時変更のThumbnailRebindPatchで発生しており、このチャットのexpert実装の適用成功とは扱わない。APK導入なし。`scripts/frida-expert-settings-test.js` を用意したが未実行。

端末画面表示・切替保存・変更後のクラッシュログ確認は未実施。起動済みのemulator-5554の既存設定画面は旧APKであり、新画面のプレビューではない。追加実装・適用エラー解消・端末UI確認が残る。
