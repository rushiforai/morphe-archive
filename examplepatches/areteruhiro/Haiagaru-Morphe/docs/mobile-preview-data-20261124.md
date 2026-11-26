# モバイル通信と保存データの調査

添付画面は保存容量ではなく2026年10月27日〜11月24日の通信量（合計9.99 GB、フォアグラウンド9.95 GB）です。この端末の通信内訳は未計測なので原因の断定はできません。

開発実機 reporter242 の読み取り調査（データ削除なし）：内部61,982 KiB、外部62,578 KiB、計121.64 MiB（約127.55 MB）。外部media61,052 KiB、うちfull56,928 KiB／thumb4,120 KiB。内部WebView34,964 KiB、検証用CSV10,960 KiB、データベース4,688 KiB、no_backup4,759 KiB、設定2,520 KiB、動画フレーム2,516 KiB。画像キャッシュとWebViewが大きく、開発用ログも含みます。保存量から通信量は算定できません。

追加設定 mobilePreviewPolicy（通常0／手動1／表示しない2、初期0）は従量制回線または携帯回線でHaiagaruの追加画像取得・動画/GIF取得・一覧画像・X/Webカードを停止します。手動は元URLをタップして閲覧します。表示しない場合も元レスのURLは消しません。明示操作の閲覧・保存、ChMate標準の画像取得設定は別です。Wi-Fiでも従量制は対象。開始済み通信のキャンセルや既存キャッシュの削除は行いません。

動画・GIFのサムネイル生成が本体を取得する可能性と、使用中の通信量の注意を設定に記載。

## 1ファイルの上限と検証

previewFileLimitMb は0（既存上限）または1〜1024 MiB。対象は一覧画像の通常HTTP、WebカードのHTML／画像、Imgurプレビュー、動画フレーム取得。ChMate標準取得、手動保存、VPNライブラリ内部取得は対象外。Content-Lengthと受信中の既存チェックを共通上限へ接続。受信バッファやHTTPヘッダーにより実際の回線通信量と完全には一致しません。

Javaリリースコンパイル成功。Fridaに新クラスのDEXを読み込ませ、実機242で携帯／非従量制Wi-Fi／従量制Wi-Fiの判定と上限値計24条件を検証。APK全体の導入検証とは別で、既存APKは変更していません。検証前の設定はfinallyで復元。結果 build/mobile-policy-frida.log。試験 scripts/frida-mobile-preview-policy.js（build/mobile-policy-dex/classes.dexを/data/local/tmp/haiagaru-mobile-policy.dexに配置して実行）。
