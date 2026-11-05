# サムネイルの取得済み表示保持（2026-11-05）

242/1.23.0-dev.15は利用者からちらつき解消の報告あり。191・226も原本DEXを調査し、通常再取得でbitmap・モザイクキャッシュ・matrixを先に消す処理と、通常bindでsetImageUrl(null)してから同じURLを戻す経路を確認した。

- 191はqaf.b(boolean)、226はTTRewardExpressVideoActivity.d(boolean)の既存停止処理後に3命令のguardを追加。byUser=falseかつdecoded bitmap保持時だけ消去区間を飛ばし、nativeの再取得予約は実行する。手動=true・未取得は元の消去処理。
- 191の通常bindは元privateリンクループをコピーし、setImageUrl(null)の1呼出しだけNOP化してそのコピーを使用。元の明示reloadループは保持。
- 226の通常bindはrequery=falseを渡す専用bridgeを使用。元setImageLinks2は維持。
- 191・226のデコード開始callbackは242と異なりbitmapを消さないので変更しない。完了・エラー・URL変更・NGとモザイク描画はnative処理を保持。
- クラス名は版別固定で、パッチ適用時の対象探索の全クラス走査を追加しない。調査用原本DEXの検索と区別する。

## 確認

元の各39メソッドと比較し、レジスター・元命令・分岐保持を検査。242は既存の3guardと完了callback保持検査も再成功。API36/emulator-5580の署名一致隔離3packageで標準Instrumentation（Fridaなし）。191・226各110項目、242106項目成功。自動再取得100回のbitmap/画素/実onDraw保持、手動再取得、初期loading、URL変更、エラー完了、同URLのnativeリンクbind、明示リンク再取得を含む。

初期191試験はHomeActivityの未設定themeを直接渡したためqaf constructorが失敗。application contextを使うContextThemeWrapperへ試験を修正。226の追加bind試験はabstract themeのUnsafe生成がnullとなり失敗し、native画像の実themeを使用して再実行。これらは試験側失敗で、最終成功に混ぜていない。最終APKで110/110/106再成功。実機の191/226自然発生点滅の再現・定量速度比較は行っていない。
