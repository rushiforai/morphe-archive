# 利用者提供の設定比較

対象はローカル Downloads の `Haiagaru1.12.0-dev.1設定.haiagaru`（2267 bytes、SHA256 `45b7ee2fdb1cb1fc51f7f52fae31d37978a0cced2d4ed09ae2975f51d2296ded`）と `Haiagaru1.18.3設定.haiagaru`（4875 bytes、SHA256 `82c0ec04540cf9c7179e8e1b78b3dd9e5fe8b0e54925f090b7d04b5640984789`）。JSONのHaiagaru設定エクスポートであり、ZIPバックアップではない。原本は変更していない。全文やUAなどの文字列設定はGitへ保存しない。

利用者回答では、同じAPKで設定だけを比較した結果ではなく、本体もそれぞれのバージョンで比較している。本体の回帰と設定差を分離できていない。

旧66項目、新138項目、共通65項目。共通項目のうち値が違うのは以下の5つ。

| 設定 | 1.12.0-dev.1側 | 1.18.3側 | スレ取得との関係 |
| --- | --- | --- | --- |
| X投稿プレビュー | OFF | ON | Xリンクのあるレスで追加の取得・描画が有効になる |
| X投稿プレビュー全文 | OFF | ON | 前項のプレビューの行高・描画量に影響する |
| 動画サムネイル4分割 | OFF | ON | 動画リンクで取得・デコード量が増える。専用workerの処理でありUIでの直接待機とは区別する |
| 動画ビューア | OFF | ON | 主に動画を開いたときの経路の違い |
| サイトカードの画像 | OFF | ON | サイトカード自体は両方OFFなので、この差だけでは通常の初回取得負荷の根拠にならない |

`update191TimeoutSeconds=0`、`fast191UpdateConnect=true`、`hideAd=true` は両方同じ。新側に `fresh191UpdateConnection=true`、`skipConditionalThreadRefreshValidators=true`、`readingPositionRecovery=true`、絵文字フォールバック等の73項目が追加されているが、旧ファイルにないことをOFFと解釈しない。設定の読み込みは記載項目をマージし、未記載項目をリセットしない（SettingsProfiles.apply）。従って、既存1.18.3へ旧ファイルを読み込むだけで旧版の状態を完全に再現できるわけではない。

削除された1項目は旧 `replaceUserAgent=true`。旧1.12.0-dev.1のソースではこのキーでUA変更を制御していた。新側は `viewingBrowserUserAgentEnabled=false` で、キー名・実装も変更されている。これも通信条件をそろえる際の確認対象であり、旧キーを現在の設定へ機械的にコピーして同等になるとは扱わない。

切り分け用の `build/settings-delay-isolation.haiagaru` は新ファイルから `xPostPreviewEnabled` と `videoPreviewFour` だけをfalseへ変更したもの。自動適用していない。この2項目が原因と確定したファイルではない。

前回の広告クラス反復検索の最適化（f2b2b45）は別途検証済みだが、実スレ全体の遅延の解消や1.12との同条件比較成功を意味しない。通信・キャッシュ・本文・端末負荷を固定した本体と設定の組み合わせ比較は未完。設定ファイル提供だけで根因や改善率を断定しない。
