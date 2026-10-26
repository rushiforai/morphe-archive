# 242サムネイル再表示の調査（未公開）

対象: https://medaka.5ch.io/test/read.cgi/pc/1770543333/ 。利用者の動画 `C:/Users/narum/Downloads/8ZpMjWG.mp4`（8.33秒）を確認。画像フィルターで126/245/297レス等を表示。「サイズが不明なファイルを自動ダウンロードしない」OFFとの関連は報告者の推測であり未確定。

## 確認したこと

- emulator-5554をデータ保持してウィンドウ付きでcold起動。242の表示で自然発生の連続点滅は未再現。利用者も再現できなかったと確認。
- native設定キーは `stopDownloadUnknownFileSize`、既定true。この設定は今回変更していない。
- 取得済み・同一URLのサムネイルにnative自動requery `zzbes.d(false)` を一度呼ぶと、`loaded=true → false → true` を確認。`build/thumbnail-requery242-nativefields.log`。これは制御された試験で、自然発生の報告条件を再現したものではない。
- 第一消去は `d(boolean)` の `c(ComponentActivity)`。これだけを抑える試作では画像はまだ消える。
- 第二消去はqueued decode開始 `f(zzbes)` の一時loading状態。スタック `build/thumbnail-requery242-prototype-stack.log`。
- 両方を限定的に抑えたFrida試作では `BEFORE/AFTER/SETTLED loaded=true`。`build/thumbnail-requery242-two-guards.log`。試作は切断済み、永続設定変更なし。
- 以前の観測スクリプトはjadxによるfield改名と生field名の混同でloaded条件が不適切だった。後半の試験は型 `o.VN22` による反射で確認し直した。最初の「消去0」を再現しない根拠に用いない。
- 中間試作のFrida state型キャスト不足は修正。例外付き試験を成功扱いしない。

## 修正候補

`ThumbnailRebindPatch.kt` に、242の上記2呼出しだけを専用guardへ振り向ける処理を追加。手動再取得またはdecoded bitmap未保持の場合は従来の状態更新を実行。URL変更・エラー・NG更新・デコード完了のnative処理は変更しない。通常bindの既存requery=false修正も維持。

通常Lint付き `:patches:buildAndroid` 成功（4m19s）、`build/thumbnail-requery-two-guards-build.log`。同時作業の設定/タブ/認証/バックアップ等も作業ツリーにあるので、作成MPPは今回だけの配布物ではない。MPP `build/thumbnail-requery-two-guards.mpp` SHA256 `59F8E8AFB03501494BB2D58C835878C2DCD8129168317C30E0ED8C326AA0E41D`。

242 APKへの初回適用はguardのnative命令検査で停止。`SGET_OBJECT` とstate呼出しの間に `CHECK_CAST` が入ることを実DEX dumpで確認し、型変換を許容しつつ直前2命令・引数レジスター・field所有者を照合する形に修正。失敗を無視した適用はしていない。後続ビルドは `build/thumbnail-requery-operand-build.log`。

242 APKへの適用・DEX命令保持検査・最終APKでの再取得中の表示/手動再取得/URL変更/エラー/NGの回帰確認は継続中。利用者環境の自然発生点滅と設定ON/OFFの因果は未確認。リリースなし、修正完了扱いにしない。

追記: 命令検査修正後の最終ビルドはKotlin daemon失敗→fallbackの後、`:extensions:chmate:compileReleaseJavaWithJavac FAILED` を記録。これを成功扱いせず、最終候補APKは未導入。先行の正常ビルドMPPは命令検査修正前なので代用しない。Fridaセッションは全て終了、検証中の永続設定変更なし。
