# 高度なNGルール

[READMEへ戻る](../README.md)

ChMate設定 → Haiagaru →「高度なNGルール（条件・スクリプト）」から設定します。
初期状態はOFFで、既存のChMate NG設定には変更を加えません。

「NG条件を追加」には、スレタイ／レス本文のキーワード、正規表現、エッヂの記者ID、
自由記述JavaScriptのひな形があります。対象を全板または指定した板URLに限定でき、
直近に読み込んだデータで保存前に判定件数をテストできます。

判定関数は `function (text, options) { return true または false; }` の形で記述します。
`text` はスレタイまたはレス本文です。`options` には板URL、スレッド番号、レス数、勢い、
記者ID、レス番号、レスIDなど、取得できた項目だけが入ります。

スクリプトはJava/Android APIへアクセスできない制限付きインタプリタで実行し、
1ルール250ms、1回の一覧判定500ms、ルール32件などの上限を設けています。
エラーや上限超過時はその判定をNGにせず、設定画面へ理由を表示します。
設定と判定対象は外部へ送信しません。

スレ一覧とレス本文の判定は `0.8.10.191 dev`／`0.8.10.226 dev`／`0.8.10.241`／
`0.8.10.243 dev` に対応します。レス本文の一致結果は各バージョンの標準NGWordフラグへ統合します。

この機能はGPLv3の派生リポジトリ
[`testuser0123-web/Haiagaru-Morphe`](https://github.com/testuser0123-web/Haiagaru-Morphe)
の設計を参考に、現行コード構成と複数バージョン向け共通フックへ書き直したものです。
参考実装の作者アカウント: [`testuser0123-web`](https://github.com/testuser0123-web)
詳細な著作権・ライセンス表示は [`LICENSE`](../LICENSE) と [`NOTICE`](../NOTICE) を参照してください。
