# 常時下部フィルター: 191の初回復元位置（未公開・確認継続）

## 報告と修正候補

ユーザーから191 devと確認。「本文(dat)もダウンロード」OFFで新着境界へ進まない、ONでも最後のレスが隠れる、未更新スレの開き直しで「おわり／次へ」が隠れる。

191のnative `onAdExpired.Tj_` は `getMeasuredHeight()` に基づいて保存位置を復元する。キャッシュ経路は `qhf.setOnMeasureRunnable` から初回measure中に復元し得る。従来のglobal-layout後の予約では遅いため、`ExtraQuickFilters.PinnedPanel` に初期化/再attach時の同期的な領域予約を追加。予約変更時はpre-drawを一度見送り、予約前のフレームを露出させない。設定・DAT・既読数・通信条件は変更しない。

これは原因候補に基づく修正であり、報告条件全体の再現・解消確認ではない。

## ビルド・導入

ローカル作業root: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current`。以下はこのrootを基準とする。

- 通常Lintを含む `:patches:buildAndroid` 成功。`build/pinned-first-layout-verified-build.log`。
- MPP絶対パス: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/pinned-first-layout-final.mpp`。
- MPP SHA256: `97583FA308B647E64F1C732BA8C3D57631588011DB8622FDF4315CC6DCD73D7E`。
- 2026-10-24 JST、`emulator-5554`、191=`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`（Haiagaru 検証191）、242=`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`へ `InstallVerifiedApk.ps1` で署名照合・データ保持更新。両方Success。
- 191 APK絶対パス: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/pinned-first-layout191.apk`。SHA256 `B48A091366BAA84FFB89A2E30D7C47E6EF5DCE5A8245FF414BB0666061B8CC45`。
- 242 APK絶対パス: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/pinned-first-layout242.apk`。SHA256 `073D00117DCF434283FD51CB137F5F1418BC0B393F4D7488BA82AE96A331032A`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 226は今回未導入。実機・公開版・バージョン名は変更なし。候補には別チャットの認証関連/先行バックアップ変更も含まれるため公開物と同一ではない。

## 成功した確認

- 191: `build/pinned-first-layout191-regression.log`、固定パネル23項目成功。
- 191: `build/pinned-initial-reservation191-recheck.log`、同期予約・detach時の解放・再attach前の予約・viewport・余白非累積・native末尾到達/非重複の10項目成功。元設定と表示位置を復元。
- 242: `build/pinned-first-layout242-navigation.log`、nativeレス移動と末尾の7項目成功。
- 242: `build/pinned-initial-reservation242-recheck.log`、同期予約/再attach/viewport等8項目成功。最初の固定1.2秒待ち試験は「再attach後の可視bounds」で失敗。その後、対象をresumed/attached/実可視fragmentに限定し、最大9秒のbounded可視待ちと診断ログを入れた追試で成功。最初の失敗を消していない。
- 上記attach試験は、実fragmentに対してbindingのattach/detach callbackを呼ぶ検査である。ユーザー操作によるnativeスレ閉鎖/再作成と同一ではない。

## 未完了・異常

- `build/pinned-native-restore191-test.log` はnative保存位置復元で既存レス表示まで3項目成功後、試験側のViewキャスト不足で失敗・設定復元。キャスト修正後の `build/pinned-native-restore191-recheck.log` は1項目後に進まなくなり、完了扱いしない。
- 04:30:44 UTCに191 FocusEvent ANR。`/data/anr/anr_2026-10-24-04-30-44-681` のmainはnative ListViewのmeasure/layout中。原因は未断定。
- 04:38 UTCにも191とSystemUI/Launcherの入力ANR。`anr_2026-10-24-04-38-34-830` はedge-swipe、`anr_2026-10-24-04-38-56-749` はTaskbar。エミュレータの空きメモリ約116MB、swap使用約1.16GBも観測したが、負荷/Fridaを原因と断定しない。
- 追加試験は中断。中断した試験が残した191の固定パネル設定trueを、開始前のfalseへ同期commitして戻した（`build/pinned191-interrupted-test-cleanup.log`）。191/242を通常force-stop後191を再起動。アンインストール・データ消去・DAT削除なし。
- crash bufferの03:27:20 UTCは242/SharedNg.bのART MonitorExit native SIGSEGV。今回候補導入前の記録。今回の固定パネル修正との因果を示すものではないが、無視して全体の無クラッシュ確認ともしない。
- 新着実到着→close/reopen、DATダウンロードON/OFF、未更新スレ再openの組合せは未再現・未確認。成功したgeometry検査でこれらを代用しない。

ANR原因切り分けと上記通し確認が残るため、公開可能/修正完了とは扱わない。
