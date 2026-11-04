# 共有NG条件確認としたらばトリップ強調

「このレスに一致する共有NGを除外」を「共有NG条件確認」に短縮。既存の安定IDを保持して標準レスツールバーカタログへ追加し、191／226／242で表示・非表示、順番、個別設定へ接続。共有NGが無効なら表示しません。他の追加レス操作は既存カタログに登録済みです。

共有NG除外画面の実タップでは、Compose側のsetItemCheckedとListView.performItemClickが二重に反転し、選択が元へ戻っていました。標準performItemClickだけに任せ、既存listenerへ正しいチェック状態を渡します。検索による非表示行や未受信の除外IDは引き続き保持します。

XIG05（serial 730eae72）、実アプリの191／Haiagaru1.22.0で、指定トリップの全板・スレ内ルールが有効でも非強調になる状態を調査。実際のnative名前欄は `areteruhiro\u0002 ◆2ofgBR.b9E\u0001`。従来の抽出結果にU+0001が残っていました。制御文字を区切りとして扱い、読み込み済みルールの境界も正規化します。実機で表示上のIdentityだけの末尾区切りを除く試験では、6欄に実BackgroundColorSpanが付きました。設定・DAT・保存ルールは変更せず、製品APK更新による実機再確認とは区別します。

単体77項目成功。実タップの旧候補試験はOFFのままで報告症状を再現。検証スクリプトのFrida overload指定・Spannedインターフェース指定を修正し、最初のエミュレータSystem UI待機ダイアログから復帰して試験。本文／画像／GIF／動画の広範な再検証は利用者指示で省略。

通常Lint build／buildAndroid 4分27秒成功。191／226／242の最終APKで、nativeカタログ等各12項目成功。実際のCompose画面をADB入力でタップしてOFF→ON→OFFを確認し、さらにONにして本番の保存callbackによる除外IDの永続化を各版確認。検索選択の既存fixtureは後述ログ。元native命令／レジスター検査は各版成功、新規crash buffer空。最終候補の実機への導入は行っていません。

検証資材: `build/shared-ng-toolbar-trip-choice-*`、実機診断は `build/trip-device-inspect.json` と `build/trip-device-proof.json`。実機Frida診断は対象packageだけに接続し、その他アプリやデータを変更していません。

追加の検索選択保持試験は各版9項目成功。最初の191／226への背景attachはFrida timeoutとなり、そのプロセスの復帰時にnative SIGSEGV（PC0x320／未知frame）が発生。試験の全体deoptimizeと再attachを併用したプロセスに限った事象で、製品Java例外はありません。未解決の製品回帰と同一視せず、計測プロセスを終了して新規起動・検索試験を再実行し成功。以後のFridaなし起動／画面切替を別途確認します。ログは `build/shared-ng-toolbar-trip-choice-instrumentation-crash.log` に保持。

Fridaなしの新規起動（各COLD）と3版間の復帰（各HOT）成功。新規起動以降のcrashログは空。実機調査の区切り文字補正だけで表示6欄の強調が確認できたため、本修正に沿って公開する。
