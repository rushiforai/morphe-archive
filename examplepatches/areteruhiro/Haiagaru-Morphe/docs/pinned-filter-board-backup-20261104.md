# 常設フィルター・復元済み本文キャッシュ・板お気に入りと標準設定のバックアップ

対象の報告:191/dev.8で常設フィルターが不定期に消える。操作契機不明。本文初回取得後に毎回取得するかは未確認。追加報告:242/dev.5でHaiagaruローカルバックアップの板お気に入りが移行されず、標準バックアップの元package_preferences.xmlが欠落。

## 下部フィルター

PinnedPanelはglobal layoutを契機にだけ再配置していた。表示復帰後やhostからoverlayが外れた場合に、描画前の軽い状態確認から再配置を予約する。再試行は250msに制限し、表示中の正常パネルで重い走査を毎フレーム行わない。hostに付いていないpanelも作り直す。再配置時に必要な場合だけ前面へ戻し、毎回bringToFrontによるlayoutループを避ける。利用者の不定期症状を端末で自然再現したわけではなく、静的修正候補。

## すでに復元済みの本文欠落

dev.8は復元完了後だけres_countを補正し、更新導入だけでは過去に復元した行を直さない。バックアップ設定へ「本文キャッシュの整合性を修復」を追加。利用者操作後、専用workerで現在の履歴をAtomicFileのJSONへ退避し、同じRestoredThreadCacheのDAT欠落/空のみres_count=0補正を適用。既読・server count・marks・IDX・非空DATを保持する実装。自動全件ダウンロードや起動時の全履歴走査はしない。終了後再起動・通常巡回で本文取得へ進める。DATを含まないバックアップから本文そのものは復活できず、ネットワーク取得待ち自体を解消したとは主張しない。実DB動作は未検証。

## 板お気に入り

従来BOOKMARKSはbookmarksテーブルのみでboardsを含まず、板お気に入りは保存されていなかった。新規snapshotへboards配列を追加し、主キー_id以外のデータを取得する。復元時はbookmarksより先にboardsを復元し、未登録板は追加、既存板は通常復元でflag/board_orderだけ反映して接続先や取得状態を保持する。不足分同期は既存板を保持。boardsがない古いbackupは互換扱いで無変更となり、保存されていなかった板のお気に入りを後から再現することはできない。スキーマ番号を変えず任意の追加フィールドとする。

## ChMate標準設定XML

元APKの文字列参照をdexlibで確認。191はLo/showFullscreenAd$RemoteActionCompatParcelizer;、226はLo/CloseGuard$read;、242はLo/setBackupListener;のclinitに元packageの_preferences保存名が固定されている。Change package patchはpackage単体の文字列だけ置換するため、この許可リストが実際のgetDefaultSharedPreferencesの保存名と不一致になっていた。

ChangeChMatePackageNamePatchで上記3ownerのclinitの対象文字列1個だけを、選択したpackage名_preferencesへ変更する。クラス全走査なし。新規invoke/レジスター追加なし。package名を変更している場合、出力XML名も変更後package_preferences.xmlとなる。元packageを使う場合は元のjp.co.airfront.android.a2chMate_preferences.xml。元packageへ戻す際のアーカイブ名変換まで新規対応したとは扱わない。

## 状態

共有NG標準一覧の先行未公開修正を保持した候補に統合。今回の静的修正方針を維持し、端末導入/ZIP生成復元の実行は未実施。ビルド・APK適用検査は完了後に追記する。今回の変更は未公開であり、公開版dev.8に含まれない。


## ビルド・適用確認

通常Lint付き最終build/buildAndroid成功3m14s・64tasks。最終MPP build/haiagaru-backup-filter-fixes.mpp SHA256 d921a3e5d964c15c01812322c7ba7ed4533fa703d4935100f378d535e76b5388、CRC正常。タグ/公開版と異なるローカルdev.8ラベル候補。前段candidate build2m17sと3版パッチ適用成功、VerifyNativeBackupPrefsで設定名変更1箇所と元命令/register/offset保持成功（build/native-backup-prefs-verification.log）。最終差分はbringToFrontを必要時だけに絞ったUI側の条件で、最終MPPからAPKの再適用/導入はしていない。今回の最終端末試験・実ZIP往復・速度確認は未実施。公開/GAS変更なし。共有NGの先行修正はdocs/shared-ng-native-choice-20261104.mdの候補試験と区別。


2026-11-04 利用者が「検証用としてプレスリリースして」と指示。既存の静的修正方針を維持し、未確認項目を冒頭へ明記して既存Semantic Release CIからプレ公開へ進む。最終端末導入・ZIP往復・速度試験は追加実施せず、先行共有NG候補の試験結果とは区別する。


## 検証用プレ公開完了

[1.23.0-dev.9（検証用）](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.0-dev.9)を既存Semantic Release CI41801477930で公開、Release/Attest success。実装966f66e/生成c2a78ebをdevへFF。draft=false/prerelease=true、release nameにも検証用を確認。公開6asset size/digest/SHA256・MPP/ZIP CRC、RestoredThreadCache/標準除外tag/修復ラベルと既存管理class同梱確認。公開MPP SHA256 `9ca0276515379f619be52ae67042c7d57e6fa937f4229cf7400149f83757bf82`。dev両feedは1.23.0-dev.9、master/main両feedは正式1.22.1を維持。VPN任意ZIPは1.21.1と同一。証跡build/release-1.23.0-dev.9-verify/verification.json。利用者指定の静的・検証用公開で、最終端末導入・実ZIP往復・フィルター症状解消・本文修復/速度は未確認と冒頭へ記載。公開後の追加端末試験は実施せず、先行共有NG候補の操作試験と区別。
