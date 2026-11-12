# 板一覧の更新通知と追加クラッシュログ（2026-11-08）

対象ログは2026-11-08 17:49:27と、追加提供の2026-11-07の5件。

| ログ | 種別 | 現行コードの対応 |
| --- | --- | --- |
| 11/08 17:49:27、11/07 22:39:05 | 191板一覧 `o.m6dExternalSyntheticLambda0` / ListView件数不一致 | 今回修正 |
| 11/07 01:03:50、01:05:17 | `Preference` → `BbsPreference` のClassCastException | 既存のカテゴリ外配置修正を再確認 |
| 11/07 03:22:47、03:23:59 | DecorView / FrameLayout.layoutChildrenのnull child | 既存のVideoThumbnailRetry取り外し延期を再確認。ログ単独で他の発生経路は断定できない |

## 今回の原因と変更

原本191の板一覧adapterは、`BaseAdapter.notifyDataSetChanged()`の後でflatten済み一覧のdirtyフラグ`j`を立てていた。AndroidのDataSetObserverは通知の中で同期的にgetCountを呼ぶため、古い件数をListViewに記録した後、次のgetCountで新しい一覧へ変わる。UIスレッドだけでも発生する。226の`o.getNextStreamIdokhttp`にも同じ順序（dirtyフラグ`g`）を確認。

両版の固定クラスの4命令メソッドを形状・フィールド・レジスター検査し、`const` / `iput-boolean` / `invoke-super` / `return`の順へ変更。元の命令とレジスター数を維持する。例外の握りつぶしやListViewの全体置換は行わない。パッチ時の全クラス走査は追加しない。242には今回のフックを追加しない。

## 検証

- `BoardAdapterNotificationInstrumentation`で既存191・226とも再現：空一覧から120件へ更新しても同期observerは0件を受け取る（AssertionError）。UIスレッド実行、DB・外部通信なし。
- 回帰試験は実native adapter、同期observer、直接接続したListView、描画用adapterを介した実ListViewのmeasure/layout/scrollを使用。1/2/4列、増加・減少・空一覧・再追加を確認する。描画用の行は合成TextViewであり、本番板一覧の実画面操作とは区別する。
- `VerifyBoardAdapterNotifications original.apk candidate.apk 191|226 previous-patched.apk`で比較。通知は原本とも同一であったことを検証し、全メソッドは直前候補との比較で今回の3命令の並べ替え以外の命令・レジスター保持を確認。191の10メソッド・226の11メソッドとも成功。
- 初回の検査は全メソッドを未パッチ原本と比べ、既存getViewフックで不一致となった。今回の変更以外を正しく区別するため直前候補との比較へ修正した。226の最初の検査コマンドは追加した比較引数が不足し失敗、引数を指定して再実行成功。いずれもAPK実行時の障害ではない。
- 通常Lint/R8を含む `:patches:build :patches:buildAndroid` 成功（5分9秒、91 tasks）。

追加2種類の既存対策は `docs/video-error-layout-crash-20261106.md` と `docs/integration-status.md` の11/07掲示板設定修正記録を参照。今回のログにはHaiagaru版・適用MPPがなく、報告元端末にどの修正が入っているかは特定できない。

今回の実機アプリ置換・アンインストール・データ消去・リリースは行わない。検証結果・候補ハッシュは完了後に追記する。

## 完了結果

- emulator-5580で191/226の既存検証用reporterを署名一致install-r（データ保持）。各141項目成功。
- 同じ候補のnative gateway/本文/画像/composer/設定等191=641、226=647項目成功、公開投稿0。
- 初回191 gateway試験のclipboard確認失敗は、SystemUI ANRダイアログが前面（UI dumpとdumpsys確認）。閉じて再実行し両版成功。失敗記録もbuild/board-adapter-test/gateway191.logに保持。
- 製品VideoThumbnailRetryを利用したレイアウト回帰34項目成功（128件×8回、再bind、detach）。
- 再起動後のcrash bufferは空。実機報告元の適用MPP/実操作での確認は未実施。
- MPP build/board-adapter-test/fixed.mpp SHA256 7f7c7775db895dc2834192b52bb4693e6ad479896b5db462535f9b4a1c9f205a。
- 導入APKと署名の詳細はdocs/android-installations.md。
