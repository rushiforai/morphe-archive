# 設定内のタブ追加・検索画面の本体タブ対応

## 依頼と実装

- 下部フィルターの画像長押しは、取り外されるView.postを使わずmain Handlerで終了・遷移を実行する。
- HaiagaruDialogの通常項目・標準ボタン・カスタムリスナーのdismissを入力dispatch後へ移す。連打抑止、再表示前の古いdismiss要求の無効化を追加。
- タブ内設定は通常画面と同じsettingsRows／BoundSettingRow／Groupを使用する。機能名・スイッチの後に説明と区切り線を表示する。カテゴリの縦リストをScrollViewへ入れず、ペイン内の有限サイズに配置する。
- 本体AndroidXと拡張のisolated AndroidXのライフサイクル型は互換ではない。埋め込みComposeViewへ独自のLifecycleOwner／SavedStateRegistryOwnerを接続し、Activity停止・再開、カテゴリ除去時の破棄・監視解除を実施する。
- 新規タブの上へ独立した追加ボタンを置く処理・bytecodeフックを撤去。Haiagaru設定の基本設定に「画面を新しいタブに追加」を配置する。通常の設定画面からは「アプリ・通信」内の基本設定。
- 選択対象はHaiagaru設定、エッヂ過去ログ検索、投稿を探す、投稿検索・結果（必死チェッカー／Kyodemo）、ワッチョイ全文検索。全体スイッチは従来どおり初期OFF。画面別選択を追加し.haiagaru共有にも含める。
- HissiMenuActivity／HissiWacchoiSearchActivityはスタンドアロン用のライフサイクルアダプターとし、処理をContextWrapperベースのControllerへ分離。Activityを偽装してタブへ埋め込まない。各native Fragmentが独自のControllerを所有する。
- 検索条件・サービスのジョブID・スクロール位置をタブ別に保存。結果はcacheDir/haiagaru-tab-resultsへ非同期AtomicFile保存し、Activityの状態Bundleへ全件を詰め込まない。復元だけでは走査を開始せず、条件を編集済み／検索実行中なら古い結果を差し込まない。OSや利用者によるキャッシュ削除で一時結果は失われ得る。通常の検索履歴は別管理。
- 投稿検索・結果の新規タブでは必死チェッカー／Kyodemoの投稿者ページURLを入力できる。既存URLから開いた場合はその条件・ホスト・板を引き継ぐ。

## 検証を区別する

1. build/dialog-tab-review-fix-build.logで最初の候補のビルド成功（3分47秒、既知のLint FIR問題に伴う3工程除外）。MPP E1FBC061FE646FB0532E018B2227466FF977B0493C8E01C1ECD9443DEE8717D3。
2. 242生成・フック検査成功。エミュレータへ導入。build/dialog-deferred-actions242-runtime.txtの11項目成功。連打、通常callback前後の順序、再表示、古い終了要求、遷移前の窓除去を確認。
3. 同候補のタブ内設定試験でViewTreeLifecycleOwner不在を検出（build/dialog-tab-settings242-runtime.txt）。表示成功とは扱わず、上記Ownerの明示接続を追加した。**この初期候補を配布しない。**
4. 後続ビルドは別途進行中の通信処理が要求するSession.fetchPreview／Image.getURLが旧AARに存在せず停止。build/tool-tabs-search-final-compile.logでは対象Kotlin・patch Kotlinはコンパイル済みだが、全体Javaコンパイルは未成功。ほかの変更を取り消さず、既存BuildImageVpnStack.ps1でGoソースと生成AARを整合させている。
5. エミュレータ切断で一度復旧導入に失敗した後、同じ16GiB AVDをデータ消去なしで再起動し、署名照合install -rで確認済みlongpress-dispatch-fix242.apkへ戻した。実機は変更していない。

## 最終候補の確認（2026-10-22）

上記は初期候補の失敗記録。Ownerだけでは不十分だったため、埋め込み設定に専用Recomposerも接続し、detach時にComposition・CoroutineScope・Ownerを破棄する最終候補へ更新した。

- build/tool-tabs-safe-candidate-build.log: buildAndroid成功（2分46秒）。既知のローカルLint FIR問題に伴う3工程のみ除外。Lint全件成功とは扱わない。
- 固定MPP build/tool-tabs-safe-candidate.mpp SHA256 `0746F173D4395FD5ECCCF964BB9CFFD12BF733FDDE1931F499CD79E62985EF50`。
- 同一MPPで191/226/242を生成、元命令・native Fragment基底・新規タブ非改変の検査成功。既存検証アプリへ署名照合install -r更新。
- 242設定16項目、検索3タブ16項目、設定内の追加入口8項目、191/226本体タブ各12項目成功。設定カードの実画面も確認（build/haiagaru-settings-visible.png）。
- 共通Dialogのキュー順序11項目成功。固定待ち時間で失敗した旧fixtureは成功に含めず、main Handlerで処理順序を検査するfixtureへ改めた。
- 242下部フィルターの実タッチ画像長押し→画像一覧→戻る→本文スクロールを確認。191/226も実スレ本文→画像一覧→画像表示を確認。
- 242の公開X GIF動画でduration=3430ms、looping=true、position=913→1614msへの進行を確認（build/tool-tabs-safe-gif242-runtime.txt）。
- 242の独立した投稿検索ActivityもADBから開き、検索フォームのUI階層表示を確認。通信を伴う検索・投稿は実行しない。
- 最終crash bufferに新規アプリクラッシュなし、lastanrは起動後なし。古いlibc crash_dump helper失敗記録は今回のアプリクラッシュと区別。
- 並行する通信コードと旧AARの不整合は既存BuildImageVpnStack.ps1で解消。Go試験、4ABI/16KiB整列、追加ライブラリ選択検査とVPNホスト試験成功。任意VPNは初期OFF、実VPN接続は未確認。

プロセス終了を含む検索結果復元の通し確認、大量データ・長時間利用、実サイトCAPTCHA、短スレ更新位置の厳密比較は未完了。今回の公開はプレリリースのみとし、公式版は変更しない。公開状態はintegration-statusの後続記録を参照。

最終同一候補でDialog11項目を再実行し成功（build/tool-tabs-safe-dialog-final.txt）。追加のオフライン試験でキャッシュへの非同期AtomicFile保存と本文・条件の保持を確認し、検証用の1ファイルは削除した（build/tool-tabs-cache-roundtrip242.txt）。Fridaの配列／Consumer生成に失敗した初期fixtureはアプリの結果復元失敗とは区別する。この試験もプロセス終了後の復元通し確認の代わりにはしない。

## 公開結果

既存Semantic Release CI39692529791成功、[1.12.0-dev.2](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.2)としてプレ公開。公開MPP SHA256 `6d78c33c819071d85be7a79f326172c1083d4aa025266578c52ba08013d8135b`。6配布物のdigest一致、devメタデータ2本、Zなし時刻、正式版1.11.2維持を確認。公開MPPの端末再適用とMorpheカード更新表示は未確認。
