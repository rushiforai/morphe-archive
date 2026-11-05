# 242サムネイルの3回目の読み込み通知による消去修正（2026-11-05）

指定スレ・動画は既存の2026-10-24報告と同じ。ビューア全画面ではなく本文サムネイルのちらつきとして調査した。

`zzbes.d(false)`と`zzbes.f(zzbes)`の一時状態は既に保護していたが、`zzbes$_init_lambda1.e()`（非同期onPreExecute）で`zzbes.e(view, loadingState)`が再び呼ばれ、nativeのstate setterがbitmapをnullへ更新する経路が残っていた。この1呼出しを既存haiagaruResetForRequeryへ変更。クラス名は固定、全体走査なし。mDownloadByUser=true・bitmap未保持なら従来setterへ渡し、完了エラー・NG・URL変更のnative setterは変更しない。

## 検証

- 通常Lint/R8 build/thumbnail-third-loading-build.log成功3分。242原本への適用成功。
- VerifyThumbnailRebind242成功。元bindの引数/分岐・明示再取得を保持。
- VerifyThumbnailRequery242成功。3呼出しのレジスター/引数/分岐保持、完了callbackは前候補APKと命令一致。原本との完了callback比較は既存stale-result修正の差で失敗したため、前候補との比較へ分離した。
- emulator-5580/API36の隔離reporter242で標準Instrumentation。前候補でbitmapが消えることを1項目で確認。修正後106項目成功、100回のloading通知・bitmap画素保持・手動再取得・初期loading・エラー・URL変更を検査。Frida不使用、実投稿/共有NG送信なし。
- 初回Instrumentationはmanifest class名不一致で起動失敗しpackageを修正。最初の修正後試験はnativeが手動消去で正しくrecycleしたbitmapを最後に読んだため試験側例外。画素検査を手動消去より前へ移して再実行成功。ビルド用javacは一度ホストnativeメモリ不足を記録したため、128MiB/SerialGCで再compile成功。失敗は成功扱いしない。
- native crash bufferは空。エミュレータSystem UI ANRを観測。追加のtap＋スレ起動コマンドは自動承認レビューでblocked by policy、具体理由なしで未実行。最終画面の目視確認・報告動画と同条件の自然連続発生・実機は未確認。公開説明にも明記。
- 変更は242のみに適用。191/226に新フックを追加しない。
