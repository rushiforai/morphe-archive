# X省略判定・新着NG件数

## X投稿の省略判定

- 詳細判定は日本語・絵文字を2ポイント、通常文字を1ポイント、本文URLを23ポイントとして数える。280ポイントちょうどは表示可能、280を超えると警告する。
- 返信メタデータがあり、本文先頭に独立してある返信先`@handle`を詳細／簡易の両判定から除外する。報告された誤警告は返信先の`@handle`を数えていたことが原因で、引用URLや画像URLは原因ではなかった。
- 簡易判定は420 UTF-8バイト。`@handle`とメディア範囲を除外して数える。
- X投稿の全文表示は初期OFF。本文とリンクカード内の通常URLにタップ可能なURL spanを付ける。
- Xプレビュー本文の通常URLも既存の通常リンクカード抽出へ渡し、X投稿カードの下にリンクカードを表示できるようにする。

## クラッシュ／ANRログ

従来のChMateバージョン／versionCodeを維持し、CrashとANRの両方に`ChMate version`と生成時の`Haiagaru version`を追加する。スプレッドシート用の既存`Version:`項目名は変更しない。

## スレ更新後の新着件数

設定「スレ更新後の『新着件数』から非表示NGのレスを除く」をChMate 0.8.10.191／226／242向けに追加。初期OFF。HOME／スレ一覧の未読件数や既読位置には適用しない。

各版の「新着 %d」文字列を表示する更新完了コールバック1か所ずつに、共通の`HiddenNgUnread.newArrivalCount(previous,current)`を接続。191／226／242で文言リソースIDと表示用数値のデータフローを確認した。新着範囲内で、native描画から透明あぼーんと確認できたレス番号だけを除外する。未取得または未判定のレスを推測して除外しない。

## 検証

- `:patches:buildAndroid` successful. 242のパッチログで既存未読計算8か所と新着件数formatter1か所を確認。
- 191／226／242の元APK DEXとリソースを既存解析フォルダ`build/ng-unread-tests-56e4612faf414ef59f2e24f6ffc8d63b`で比較。表示文言「新着 %d」から更新コールバックと計算レジスタを特定し、版ごとに1つの正確なformatterをフックする。
- Frida 17.18.0 / reporter242：新着数の範囲計算5項目成功（範囲内除外、範囲外、空更新、既知NGなし、負数防止）。合成データのみ、通信・投稿なし。
- Frida 17.18.0 / reporter242：X判定・リンクカード7項目成功（420バイト返信、返信先除外、280/281境界、リンクspan、Xプレビュー本文から通常カード用URL抽出、全文初期OFF）。合成データのみ。
- Frida 17.18.0 / reporter242：Crash／ANR共通ログ版フィールドでChMate版とHaiagaru版の両方を確認。
- reporter242は署名照合後、既存データを消さずに更新導入し起動。導入後に新たなクラッシュ記録を確認していない。
- スレ更新を実行する一連の操作と新着toastの画面表示はまだ実機確認していない。投稿や外部サイト接続もしていない。

## 最終再ビルド（2026-11-20）

- `:patches:buildAndroid` successful。最終242確認APKを署名照合し、Mi Note 10へ`adb install -r`で更新導入。
- MPP SHA-256 `34f6a654f8af3a555c71d33a3209a27c5986e3784e735f430e2f7744e307f4ee`、APK SHA-256 `b996dfc79f58c267c0e380e745399a2859c0ba1484a4eac5abf69ce2569258b9`。
- 最終APKでFrida 17.18.0のX回帰7項目、新着件数5項目、Crash／ANR版表示確認に再度成功。ChMate `0.8.10.242 dev`、Haiagaru `1.46.0-dev.9`。
- `git diff --check`成功。新着toastの実画面確認は未実施。

## 2026-11-21 242新着数表示の修正

- 1.46.0-dev.9の生成DEXを調べ、242の新着数formatterは`HiddenNgUnread.newArrivalCount(previous,current)`を呼ぶだけで、その戻り値を次の表示処理へ渡す`move-result`が欠けていたことを確認。補正関数を実行しても元のスレ総数を表示していた。
- `NewArrivalNgCountPatch.kt`を修正し、結果レジスタへの`move-result`挿入を必須化。生成後のパッチ命令でも呼出しと戻り値保存を検査する。
- `:patches:buildAndroid`成功。現行MPP SHA-256 `c7114f620456d6de084d9c47abf451f55c690fa6d8fb40dfb3233639d9e01cdc`。242 reporter APK SHA-256 `582baf9ed1049d3ea118a550589421dd79f348751d3f5bd268a97c34f48c591a`、Morphe署名照合後にMi Note 10の隔離reporter242へ`adb install -r`で更新。
- 修正済みAPKのDEXで`newArrivalCount(previous,current)`直後の`move-result`が表示用レジスタへ保存され、その値が`Integer.valueOf`と書式文字列へ渡ることを確認。
- Frida 17.18.0 / reporter242で6項目成功：NGレスを更新範囲内だけ除外、空更新、部分範囲、既知NGなし、負数防止、オプションOFF時の生の増分。設定値はテスト後に復元。ネットワーク・投稿なし。
- 242の実スレを開き更新操作も試したが、更新範囲に新しいレスがなく、新着件数formatterの実画面表示までは確認できなかった。従ってロジックと実生成DEXの修正は確認済み、実データで新着件数が増えた際のトーストは未確認。

## 2026-11-21 191／226／242の共通化と他の共通機能確認

- `NewArrivalNgCountPatch.kt`を191／226／242のそれぞれの新着表示formatterへ適用。元APKの表示文字列・数値データフローを版ごとに解析し、各版で対象値1つだけを共通`HiddenNgUnread.newArrivalCount(previous,current)`へ接続した。226では未読数と新着数が同じ配列スロットを再利用するため、後続の値で上書きされた未読数側を誤変更しない確認も追加。
- 3版への全パッチ適用が成功。適用ログは既存解析フォルダ`build/ng-unread-tests-56e4612faf414ef59f2e24f6ffc8d63b/apks/patch191.log`、`patch226.log`、`patch242.log`。X投稿リンク／バインディングのnative hookもそれぞれ10／209、8／167、7／142箇所で検出。Xリンクカードの全実サイト描画を検証したものではない。
- Mi Note 10 Android 11上の隔離reporter191／226／242それぞれでFrida 17.18.0の20項目が成功。新着範囲のNG除外計算6項目、カード表示に応じた読書位置既定と手動上書き・追加フィルターON/OFFの12項目、XプレビューURLを通常カード抽出器が受理する2項目。合成データのみ、ネットワーク／投稿なし。テスト用設定は復元し、一時設定は削除。
- アプリの新着更新を試した時点では新レスがなく、実際の新着toastは未確認。ボタン操作を含む各設定の画面確認も今回のFrida合成確認とは区別する。APK・署名・MPPと導入時刻は`docs/android-installations.md`および解析フォルダ内`apks/installations.json`に記録。
