# 226 リロード時のリンクカード行の位置ずれ

報告: 0.8.10.226 dev / Haiagaru 1.11.3。AdGuard Part104（1791637567）レス458、画像Eus57Of/yya50m8。画像をブラウザで確認し、GitHubカード2枚を含む途中位置から前のレスへ戻る状態を確認。

## 原因と既存修正

1.11.3のSiteCards.onBoundは非表示Viewを処理しない。226のMessageInflaterKt.a(ListView,int)は位置復元時にadapter.getView(index,null,list)で非表示の一時行を作って測定し、保存した下端オフセットから上端を算出する。この行からキャッシュ済みカードが欠落すると表示中の行と高さが違い、位置がずれる。

現在のdev.13には既にwarmカードの非表示bindと、初回/更新中に非同期位置補正を開始しない修正がある。今回は本番ソースに追加変更せず、既存修正を報告レスで検証した。

- 旧226候補で1.11.3の非表示gate相当を再現: native adapterのレス458が109px、warmカードあり432px（差323px）。実native capture/restoreを高さ300pxの一時ListViewで実行し、first=463/top=-100から459/-46へ移動。warmでは463/-100を保持。9項目成功、build/site-card-native-restore226.log。
- 公開MPPを未加工226へ適用し同一署名データ保持更新。公開最適化版ではメソッドhookによる旧gate模擬が成立しないため旧症状再現成功とは扱わず、実処理のみ検査。カード2枚、重複なし、測定432pxの安定、native復元463/-100の一致を6項目確認。build/site-card-native-restore226-dev13.log。
- 最初のfixture失敗はBaseAdapter型でgetViewを解決できない/再起動後に別スレを選択/最適化後の旧gate模擬不成立。これらを成功集計に含めない。最終fixtureの設定とキャッシュは復元、Dialogを終了。投稿やNG登録はしていない。
- 実画面でのリロード追跡も実施したが末尾付近の新着移動が混じるため、それだけで元報告を完全再現したとは扱わない。狭い一時ListViewで報告レスのnative位置復元を検査した。実機固有のフォント/幅/テーマでの再確認は未実施。
- 最終テスト後のcrash bufferと/data/anrは従来の記録から増加なし。

## 公開MPPでの導入

ルート C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/ 。

- serial emulator-5554、Haiagaru 検証 226、0.8.10.226 dev、package jp.co.airfront.android.a2chMate.haiagaru.resumefix226。
- APK build/reload-position-dev13-226.apk、SHA256 29BEEB0D6098B94777FE8655AF5041DF208CE1D3CA9FE7689AE434466B8C20F9。
- 公開MPP build/release-dev13-verify/patches-1.12.0-dev.13.mpp、SHA256 201eab2203b44551c1577609ded749e4648d106f0c0daa8da74d4b0e7f48e2ba。
- 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- InstallVerifiedApk.ps1で署名一致後install-r Success。データ消去なし。公開APKの167 text bindings/8 touch dispatchers/write reentry guard、native tab factoryの元register/operand/分岐保持検査成功。実機は変更せず、追加Releaseなし。
