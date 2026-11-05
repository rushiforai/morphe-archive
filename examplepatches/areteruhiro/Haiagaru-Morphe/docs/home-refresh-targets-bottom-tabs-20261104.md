# HOME対象スレ・履歴下部タブ

履歴のタブ行をcontentより後へ配置し、選択中だけテーマaccentの文字色・3dp下線・太字を表示します。native4タブのobservableと対象一覧・起動経路は既存処理を維持。

HOMEのカタログへ対象スレID109を追加。★スレ108と同じ既存sorter hooksでモードを記録し、native102の全スレsnapshotから登録キー（native BoardIDとcreated）で抽出。191はg/h、226はb/g、242はe/bの固定フィールド。★なしでも登録済みなら表示し、未登録の★付きスレを対象へ混ぜません。登録集合は既存manualRefreshTargetsを共用、履歴・バックアップとの二重管理なし。HOME対象の更新は選択Workだけを依頼して標準の全体巡回へ落としません。設定カタログとアイコン一覧へappendし既存保存indexを保持、初期非表示・nativeの表示/順番設定で追加。最低限構成で隠す対象にも含めます。

191のList型カタログ追加はboot class loader経由でnativeクラスを解決できないため、Contextのアプリloaderへ修正。他版のmodel loaderは維持。全クラス走査追加なし。

## 検証

最終通常Lint付き :patches:build / :patches:buildAndroid 成功32秒・64tasks。3版適用・署名/既知旧APK hash照合install-r成功、最終実APK hash一致。MPP d610036968d25704192c74f64a3b9a2d8abc34b194d800d299b26e7f7e0e2bc0。HOMEのnative命令/branch/register全保持（19143/22651/24266メソッド）。変更外本文/画像/GIF/動画の広い再試験は既存利用者指定により省略。

- 履歴は各33項目。実native popup、下部の計測位置、5タブの選択強調、元4タブのobservable、対象一覧と標準スレ画面への起動境界。URL復元も5ch形式/したらば各確認。DBロードは先行dev.2の確認を保持し、今回はメモリ内一覧を表示するためDB書込/削除なし。
- HOMEは191/226各16、24214項目。カタログの109/108各1、登録だけの抽出、★判定独立、元snapshot保持、nativeモード/見出し、未登録empty、native選択ID、対象のみの更新。3版とも一覧入力をメモリ内で一時置換し、実UI XMLで対象=fixture0,1のみ、★=fixture1,2のみと確認。
- 試験後登録・queuedAt・native snapshot・選択モードを復元、投稿なし/通信OFF。新規対象app crashなし。AVDのBluetooth hardware errorとSystem UI ANRは別件。通知案内を隔離アプリで閉じて表示を再確認。AVDはサイズとWiFiを戻しデータ保持で停止。

初期AVD/署名JVMはPC仮想メモリ不足で停止。データ保持のcold boot/softwareGPUで再開し、署名ツールheapを制限。以前のsnapshotとcold bootの導入APKが異なったため、両方の既知台帳hashを照合。Frida試験は言語、親クラスmethodのoverload、LiveDataのpostValueとsetValue、入力と結果のstateを区別して修正。242で最初に結果Bへfixtureを入れて未登録が表示されたのを製品原因と誤認し、一時p2へ変更したが、nativeログからp1がID/p2がsortIndexと確認。最終sourceは正しいp1に戻し、入力Dに置いて対象と★の実表示を再確認。誤説明は利用者へ訂正、未検証候補は公開していません。

追加のDB fixture作成/削除による試験は自動承認レビューがblocked by policy（詳細なし）と拒否し未実行。迂回せず、保存データを書き換えないメモリ内入力試験に変更。これを理由とする未完了はありません。先行242タイトル操作欄の実画面未確認は別の制限として維持。

試験 scripts/history-bottom-tabs-memory-runtime.js、home-refresh-targets-runtime.js、VerifyHomeTargetNativePreservation.java。原本 build/local-development-records/history-bottom-tabs-installations.json。ログ build/history-bottom-tabs-*-{popup,home}-final.log、home-target-correct-final-summary.log。

## プレ版公開

[1.23.0-dev.3](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.0-dev.3)を既存Semantic Release CI41757579447で公開、Attest success。実装6dbc55f/CI生成1c9bf55。公開MPP SHA256 `046cbc53a39e7b768ee0d78dc406b536a386d5747ebdcda2d4d8f033f239064f`、配布6assetのdigest/size/SHA256/CRCと対象クラス同梱を確認。dev両feedは1.23.0-dev.3、master/main両feedは正式1.22.1のまま。証跡build/release-1.23.0-dev.3-verify/verification.json。
