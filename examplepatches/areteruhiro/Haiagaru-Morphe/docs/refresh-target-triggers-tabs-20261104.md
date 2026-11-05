# 更新対象のスワイプ・ジェスチャー連動と履歴の対象タブ

「更新対象に含む」が従来は共通ツールバーのaction 5だけを入口にしていたため、191の具体的なレス画面で処理される操作や、版ごとのresource IDを使うスレ末尾の更新、標準巡回の直接呼出しを拾えていませんでした。

## 実装

- RefreshTargets.refreshはaction 5に加え、その版の標準更新resource ID（191: 2131362342、226: 2131296861、242: 0x7f090244）だけを受け付けます。他版の同番号を別操作として誤実行しないよう版も照合します。
- 191のo.pa.e(int,Object)冒頭へ、元の命令・レジスターを保持して1つの呼出しを追加。標準の末尾UP確認は3版ともこの版別IDをdispatchします。
- 版別の標準one-shot巡回scheduler（mdExternalSyntheticLambda0／settings／TTRewardVideoActivity8）の元メソッドに、登録スレの本文取得依頼を追加。選択専用の複製を作った後に元だけへフックするため自己再予約しません。定期Work本体への追加フックはありません。
- Contextを受け取るenqueueへ依頼を共通化。既存の3秒抑制と固有Work名のKEEPを維持。本文取得・保存は既存の標準AutoCheckWorkと対象フィルターを使います。
- 履歴ポップアップを「スレ／対象／板／書き込み／画像」の5タブにします。対象は同じポップアップ内の一覧で、スレ名・板名・登録集合を背景で読取専用参照し、native URLで標準画面を開きます。空欄の案内と非同期世代チェックを用意。ほか4タブは元のnative observableと元の履歴表示を使い、元のタブ行との二重表示を避けます。
- 固定クラス・固定フィールドを使い、全クラス走査を追加しません。個人NG・通知登録・お気に入り・履歴・DATは登録一覧の表示操作で書き換えません。

## 検証

配布用 :patches:build / :patches:buildAndroid（Lintを無効化しない）成功38秒、64 tasks。初回はPCのnative memory不足でGradle JVM停止。並行AVDをデータ保持で停止して再実行しました。rootのbuildも実行してしまい、公開用ではない拡張単体debugの既存MissingPermission等226件で失敗したため、既存公開CIのパッチバンドル用taskへ合わせて検証しました。これらの失敗を成功扱いしていません。

最終MPP f70eba83827f466ecbe35c8fa448d731dbfe63650deb77b855ab60ec8cd5d1c1。隔離emulator-5580の既存bindings191／226／242を、旧実APK hashと署名を照合して更新。各版で次の50項目が成功しました。

- 履歴34項目: 実native popup、タブ順序、元4タブのobservable切替、二重追加なし、選択登録だけの一覧、5ch形式／したらばURL、実際のクリックからAndroid起動境界とtablet routingまで。
- 更新11項目: resumedした標準レスFragmentでaction 5と版別再取得ID、attachedしたnative PullToRefreshViewとUP確認callback、通常巡回／★のみ巡回の呼出しから選択schedulerへ到達、無関係操作・未登録時の除外、短時間抑制。選択schedulerの反射呼出し境界を捕捉し、標準one-shotの元UUIDを取得・直後に取消。物理的な指のスワイプや実掲示板の新着投稿を観測した試験ではありません。
- WorkManager5項目: 別試験で実選択schedulerを実行し、native bookmark query→登録だけのfilter→本文取得flagを確認。同名KEEPで二重依頼1回、native fetch境界で停止。

元scheduler／191 dispatcherの全命令とレジスター保持、選択コピーに自己enqueueがないことはDEXの構造比較で3版とも確認。変更外の本文・画像・GIF・動画の広い再試験は既存利用者指定により省略。先行プレ版の検索タスク各48項目は再実行せず、今回変更していません。

外部通信OFF、投稿なし。fixtureのDB行・登録集合・queuedAtを復元。初期通知許可案内は隔離226／242で「いいえ」を選び、重なりのないpopup画像を再確認。テスト初期のFrida generic Viewの型指定・obfuscated enum名・Kotlinのnonnull view指定・抽象WorkManagerの監視位置の誤りを直して再試験成功。全deoptimizeは行っていません。新しい対象app crashなし。エミュレータのBluetooth hardware errorは対象アプリの例外と分けています。

原本は公開対象外 build/local-development-records/refresh-history-tabs-installations.json、試験ログと画像はbuild/refresh-history-tabs-*。実機への導入はしていません。

242のタイトルチェック欄の重なりについて、先行プレ版で記録した実画面未再確認の制限は残っています。今回の履歴popup試験はその診断とは別画面です。過去の追加診断の自動承認審査拒否（blocked by policy、詳細なし）を迂回していません。

## プレ版公開

Semantic Release CI41745383637とAttest成功、[1.23.0-dev.2](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.0-dev.2)公開。実装a0624fc、生成e0e9ddd。公開MPP SHA256 `7599f447cf1c5e73bbfc8f4db35484690644735752f0c17a7f881ee3e258cc16`。配布6assetのsize/digest/SHA256・CRC・実装同梱を確認。dev両feedは1.23.0-dev.2、master/main両feedは正式1.22.1のまま。証跡build/release-1.23.0-dev.2-verify/verification.json。AVDはWiFi ON/mobile OFFへ戻し、データ保持で停止済み。
