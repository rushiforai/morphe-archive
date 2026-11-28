# v0.4.0-beta.40 — 画像表示の修正のみ

対象：ふたったー3.1.1 / ARM64 / versionCode 65。beta.39のA2は所有者実機で成功確認済み。今回の機能変更はめぶきの純正スレッド画面の画像表示寸法のみ。

## 根本原因と証拠
- beta.39の MebukiAdapter.route は認証済み /mebuki/res/ で MebukiThreadData.nativeHtml を呼び、filePath を original=true として登録する。/thumb/ と /src/ は originalResponse で元バイト列・実MIMEを返す。A1の原画像経路と12,000,000 bytes・各辺16000・40,000,000画素の制限は既に存在する。
- 一方、nativeHtml の img タグには width=50 height=50 が固定されていた。純正APKのAOT SureProvider は OPの body > div.thre > a > img の height (0x721038–0x72103c) と width (0x72106c–0x721074)、返信の a > img の height (0x721c88–0x721c8c) と width (0x721cbc–0x721cc4) を取得し double.parse する。ResuImg.build (0x89ba88) は画像寸法と既存の表示上限を使い制約・比率を計算する。従って原画像を配信していても固定50の属性が小さい表示の原因となる。
- 公式 utils-BJPiTKUD.js の添付スキーマは width/height を nullable number と定義、message-content-Byuwwrz1.js は filePath と同じ添付オブジェクトの width/height を表示比率に使用。2026-11-27の匿名読み取り /api/trial/catalog はHTTP 200、780460 bytes、width/heightの隣接ペア807件。例：1280×720、728×1000、400×399。個別投稿や画像URLは記録しない。所有者の認証済み添付データ自体は取得していない。

## 修正
MebukiThreadData.convert で原画像として選択した添付の width/height を保持し、nativeHtml の img 属性にその数値を出力する。正の整数、各辺16000以下、40000000画素以下のみ採用。欠損/null/不正/制限超過の場合は従来の50×50を維持し、追加の通信や推測寸法は使わない。この場合は小さい表示が残る。純正の表示上限・端末画面幅・ユーザー設定は維持するため、物理画面上で常に原画像の全ピクセルを等倍表示するという意味ではない。拡大用画像とインラインの原本バイト列、非表示フラグ、カタログの小画像、A2、他板・他機能・設定は変更しない。通常の版数自動更新のみ。

## 検証
- MebukiPrivateReadTest 72 assertions PASS。横長・縦長・OPと返信の個別寸法、欠損と不正値のフォールバック、原本URL、非表示フラグを含む。合成データであり認証済み実データではない。
- 対象APKへの全9パッチ併用適用 PASS。生成DEXを再逆コンパイルし width/height の取得・上限・HTML出力を確認。beta.39との libapp.so 比較で統計の自動版数文字列以外は完全一致（A2の命令も不変）。既存の対象ハッシュ／命令ガードも維持。
- 実投稿・実ログイン・実機・エミュレータ操作なし。純正画面の最終表示は所有者の実機確認待ち。
