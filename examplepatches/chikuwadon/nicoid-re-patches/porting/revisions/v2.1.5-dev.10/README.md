# v2.1.5-dev.10 — 描画キャッシュA/B比較とFPS設定値の追加表示

基準: v2.1.5-dev.9 (950bc770a536e29084bbb4f2d8a295508204fd61)

## 変更
- 「描画フレームレート」設定の既存説明文を変更せず、選択中の設定値だけを先頭に追加
  - 例: `60fps：コメント描画の上限を選択します。実際のフレームレートは端末性能と画面の更新頻度に依存します。`
  - ListPreferenceの`%s`で選択変更に自動追随。値・初期値・選択肢・翻訳済み説明文は不変
- 開発版限定の「描画キャッシュ（検証用）」をコメント設定に追加
  - OFF（初期値）＝通常の直接文字描画（dev.8相当の経路）
  - ON＝dev.9の最大12MiB Bitmapキャッシュ
  - 次の描画から切替。変更時のキャッシュは破棄
  - 設定キー `nicoid_comment_raster_ab`
- ログ`nicoid-comment-perf`に`rasterMode=direct/bitmap`、`directDraws`を追加
- VSYNC、重なり防止ON/OFF、コメント速度・位置・寿命、Media3再生対策を保持

## 検証手順
同一dev.10・同一約23.5万件動画・1.25倍速・コメント取得無限・60fps・重なり防止OFFで実施
端末温度を揃え、**OFF→ON→OFF**の順で同じ動画内区間を約1分ずつ測定する
`rasterMode`が設定と一致することを確認し、`fps`、`glyphAvgMs`、`drawAvgMs`、
`nicoid-frame-total.drawWholeAvgMs`、`rasterHits/Rejected`、コメント表示数、端末温度を比較
設定値の表示だけが変わり、元の説明文に変更がないことも画面で確認する

このチェック項目はdev検証専用。正式リリース前に除去/採用を判断する
main変更および正式リリースは行わない
