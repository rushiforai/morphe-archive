> `<workspace>`はリポジトリのルートです。公開記録ではローカル作業パスを省略しています。絶対パスを含む台帳原本は公開対象外のローカル記録に保持します。

# Android導入・署名台帳

## 2026-11-11 スレ一覧画像表示（実験）ほか・実機隔離APK

Mi Note 10 Android 11、serial d5497008、既存アプリとは別の検証用APKを署名一致で導入（install Success）。

- 191 / Haiagaru thumbnail test 191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.thumbnailtest191 / <workspace>/build/thread-list-thumbnail-smoke/test191.apk / SHA256 1a3965ced05e7872f11e79edbc5a68a72ac754016cbb23a133fb9d63ce13ef90 / 更新 2026-11-11 12:53:13 JST。
- 226 / Haiagaru thumbnail test 226 / ChMate 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.thumbnailtest226 / <workspace>/build/thread-list-thumbnail-smoke/test226.apk / SHA256 8641addaa0aee63bee01dfda92ce306e98f2c6e99f242a7af03ca1b3ac24dbb / 更新 2026-11-11 12:53:21 JST。
- 242 / Haiagaru thumbnail test 242 / ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.thumbnailtest242 / <workspace>/build/thread-list-thumbnail-smoke/test242.apk / SHA256 7a42431c5f0bd609a3fc5c31ce98ae6f687c52933f47c25c62d5a74145c57c56 / 更新 2026-11-11 12:53:29 JST。

MPP <workspace>/build/thread-list-thumbnail-smoke/candidate.mpp / SHA256 f8709515e3d5e5e978fe4978e1d165f2f9330485a65f1dab68552117a356f0a3。証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed、署名alias Morphe。鍵のローカル絶対パス・APK絶対パス・導入結果は非公開台帳 build/local-development-records/thumbnail-20261111-installations.json。191設定表示と切替、226／242の起動を確認。実レス画像・サイズバー・通知遷移は未検証。


## 2026-11-04 検索結果・更新対象履歴・タイトル操作背景（プレ版候補）

serial `emulator-5580`、版別隔離packageへ署名一致install-r Success、既存データ保持。実機未更新。

- 191 / `jp.co.airfront.android.a2chMate.haiagaru.bindings191` / `Haiagaru binding 191` / 2026-11-04T01:02:16.947953+09:00。APK `<workspace>/build/search-history-final-191.apk`、SHA256 `8e9291fefd8a214eb5b16d90d334286b37b8af971ae8e985e293d753352de001`。
- 226 / `jp.co.airfront.android.a2chMate.haiagaru.bindings226` / `Haiagaru binding 226` / 2026-11-04T01:03:04.380037+09:00。APK `<workspace>/build/search-history-final-226.apk`、SHA256 `c613ebcf5ec81bca48b54c8950725fed149768fd16a49a10e8abd5b401b9c7fb`。
- 242 / `jp.co.airfront.android.a2chMate.haiagaru.bindings242` / `Haiagaru binding 242` / 2026-11-04T01:05:42.737689+09:00。APK `<workspace>/build/search-history-final-242.apk`、SHA256 `7bd8adb6695aba9eef0cb234f17523b2e87fb350b6124562b66b5155ea3913da`。

MPP `<workspace>/build/search-history-final.mpp`、SHA256 `3c2788b8cd2ab13bebac1bc9211760ce4cffc165498dd758bf28900e787e6739`。証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、alias `Morphe`。絶対パス・鍵所在・検証結果は非公開台帳 `build/local-development-records/search-history-final-installations.json`。

## 2026-11-03 共有NGツールバー・実チェック・トリップ制御文字 最終候補

serial `emulator-5580`。ChMate版別隔離packageを署名照合install-r（191は候補から更新、226／242はこのAVDへ新規導入）、既存実機未更新。

- 191 / `jp.co.airfront.android.a2chMate.haiagaru.bindings191` / `Haiagaru binding 191` / 2026-11-03T23:55:29.676082+09:00。APK `<workspace>/build/shared-ng-toolbar-trip-choice-191.apk`、SHA256 `bdc0398c4ef4389970c0cb5fd6e70e7331378edc2346959ce98582f3eed58b96`。
- 226 / `jp.co.airfront.android.a2chMate.haiagaru.bindings226` / `Haiagaru binding 226` / 2026-11-03T23:57:07.664247+09:00。APK `<workspace>/build/shared-ng-toolbar-trip-choice-226.apk`、SHA256 `44f6129040067e71382afd5469f2c32e1a0fae8d3ec240ae819ec052d495ea10`。
- 242 / `jp.co.airfront.android.a2chMate.haiagaru.bindings242` / `Haiagaru binding 242` / 2026-11-03T23:58:21.902466+09:00。APK `<workspace>/build/shared-ng-toolbar-trip-choice-242.apk`、SHA256 `d2e6234d44d9049ad2db018969edbd6a1a965eb38618523848b2eb1b6b825cee`。

MPP `<workspace>/build/shared-ng-toolbar-trip-choice.mpp`、SHA256 `b6fe23cdb8928b15fc7de277f1ef3342b31d208737259f18b4f569ab467244ec`。証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、alias `Morphe`。絶対パス・鍵所在は非公開台帳 `build/local-development-records/shared-ng-toolbar-trip-choice-installations.json`。各版native catalog等12項目＋実タップのチェック／保存成功、crash空、元命令／レジスター保持。

## 2026-11-03 板横断更新・返信通知 最終候補（エミュレータ）

serial `emulator-5580`。既存の版別隔離packageへ署名一致install-r Success、データ保持。実機への導入なし。

- 191 / `jp.co.airfront.android.a2chMate.haiagaru.bindings191` / 表示名 `Haiagaru binding 191` / 2026-11-03T23:05:30+09:00。APK `<workspace>/build/refresh-watch-official-candidate-191.apk`、SHA256 `0792d59432056e2d958b32441b67ac0fb277fa017dd74a4a73f0b4e1df6b5332`。
- 226 / `jp.co.airfront.android.a2chMate.haiagaru.bindings226` / 表示名 `Haiagaru binding 226` / 2026-11-03T23:07:31+09:00。APK `<workspace>/build/refresh-watch-official-candidate-226.apk`、SHA256 `a4fdd017b1f4b34f11b2f129d8a832ae5b0b2153b8b5afd9c07ab7887d5bcb42`。
- 242 / `jp.co.airfront.android.a2chMate.haiagaru.bindings242` / 表示名 `Haiagaru binding 242` / 2026-11-03T23:08:11+09:00。APK `<workspace>/build/refresh-watch-official-candidate-242.apk`、SHA256 `acfb954605472e2ae4a5bf1b11aadb6205bdab59cfed25eb1069e9b5b428b324`。

MPP `<workspace>/build/refresh-watch-official-candidate.mpp`、SHA256 `b327ef8b6a23af5d3c4eba35aaa0b7e7993019661ee8faf8375a9d3f99d5bdf0`。証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、alias `Morphe`。絶対パス・署名鍵ファイルの所在は非公開台帳 `build/local-development-records/refresh-watch-official-candidate-installations.json` に記録。各版125項目とnative例外試験成功、詳細は `docs/cross-board-refresh-notifications-20261103.md`。

## 2026-11-02 22:21 JST 5秒ランダムUA・191実機用（実験ブランチ、未公開）

利用者指定の `作業ブランチ（random-user-agent-5s）`。XIG05/Android15、serial `730eae72`。表示名 `Haiagaru UA切替191`、ChMate `0.8.10.191 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.randomua191`。導入前に同packageが存在しないことを確認、別packageとしてinstall Success。既存アプリの削除・データ消去なし。

- APK `<workspace>/build/random-ua-5s-191.apk`、SHA256 `ba85f59794a9a7ef6acd5d0cba58abd476ec92ad7a6261cf6cd078723fe4063b`。導入後の実APKのsha256sum一致。
- MPP `<workspace>/build/random-ua-5s.mpp`、SHA256 `67a5c1856f26abc3acca572eb339bfce93ed5745810e9e20a41e9b6a888cd8f9`。
- cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- 起動成功。導入APKから191 native POST/java.net GET・POST等のヘッダー準備12項目成功。実通信・投稿を行わない検証。アプリ本体のランダムUA設定は初期OFFのまま。対象PIDのcrash buffer空。検証DEXは削除済み。詳細 `docs/random-user-agent-5s-20261102.md`、`build/random-ua-191-install.json`。

## 2026-10-26 CAPTCHA/計算＋ジェスチャー6操作の統合242（未公開）

ユーザーの実機導入/最新認証変更も含める指示による。XIG05/Android15、serial `730eae72`、ChMate `0.8.10.242 dev`、表示名 `Haiagaru 検証 242`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。23:17頃JST、`InstallVerifiedApk.ps1`で既存署名と一致を確認してinstall-r Success、データ保持。TabletHomeActivity cold起動Status ok、PID3607。

- APK `<workspace>/build/combined-gestures-captcha242.apk`、SHA256 `333F17F6AD6FD47A7AE9BE989C9A68F45A446DE730C538621B310F7F3F8CAAB4`。
- MPP `<workspace>/build/combined-gestures-captcha.mpp`、SHA256 `6A734DA86369A0AC9ED53279B7320A029F76CA6CD089C673A8B86BF389B26742`。生成版名1.13.0-dev.1は公開版と異なるローカル候補。
- 元APK `C:/Users/narum/Downloads/chamate/242/chmate-0-8-10-242-dev.apk`。
- 鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

通常Lint付きbuild5m19s成功、APK適用/署名成功、完成APKのタブfactory/元命令/レジスターとnative下書き保存writer wrapperを検査成功。最新認証ダイアログ/計算/投稿成功後処理と、ジェスチャー6操作を含む。ログ `build/combined-gestures-captcha-c1-build.log` / `build/combined-gestures-captcha242-patch.log` / `build/combined-gestures-captcha242-install.log`。

実機ではHOME/スレ両ペインのnative空タブ追加・追加先設定反転・fixture除去/設定復元19項目成功。その後XIG05が切断、ADBはMi Note10/d5497008へ切替。実WebView履歴fixtureは未実行、別端末未操作。今回新しい3操作の実スワイプ/実サイト認証投稿成功/終了時crash log再取得は未確認。詳細 [tool-tab-chmate-gestures-20261026.md](tool-tab-chmate-gestures-20261026.md)。

## 2026-10-26 PR #93ジェスチャー改善候補242（未公開）

XIG05/Android15/serial `730eae72`、ChMate `0.8.10.242 dev`、表示名 `Haiagaru 検証 242`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。21:59頃JST、`scripts/InstallVerifiedApk.ps1` で既存署名一致を確認しinstall-r Success、データ保持。TabletHomeActivity cold起動Status ok。

- APK `<workspace>/build/tool-tab-gestures242.apk`、SHA256 `0AE196B772467805E44CB76AD86CDB5D48CE21D8863DB5835A74C9D961B724EE`。
- MPP `<workspace>/build/tool-tab-gestures.mpp`、SHA256 `44986460A48FC4C6CA7EFA397BEA0087AF77F85FDC40100E3358D1C4CEF0E924`。生成名1.13.0-dev.1だが公開版とは異なる候補。
- 元APK `C:/Users/narum/Downloads/chamate/242/chmate-0-8-10-242-dev.apk`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

ログ `build/tool-tab-gestures-isolated-build.log` / `build/tool-tab-gestures242-patch.log` / `build/tool-tab-gestures242-install.log`。HEAD df758a3+今回の5ソースだけの分離ビルド候補で、並行作業中の認証画面変更は含まない。設定スイッチの初期OFF/ON保存/OFF保存を実機確認、実スワイプ/タブロックは未確認。試験中は通知パネル前面でタブView生成待ちが失敗し、検査設定は復元、空fixture2タブも除去した。attach前の21:59:27終了はLOW_MEMORY。詳細 [tool-tab-chmate-gestures-20261026.md](tool-tab-chmate-gestures-20261026.md)。

## 2026-10-24 取得済みスレの下4桁検索トグル242（未公開）

emulator-5554/resumefix242へ初回候補を署名照合install-r更新Success、データ保持。APK/MPP絶対root・SHA256・鍵・途中のステータスバー重複と追試は[cached-wacchoi-suffix-search-20261024.md](cached-wacchoi-suffix-search-20261024.md)。初回の内部ON/OFF確認を可視位置までの完成確認と区別する。実機/公開は未変更。

## 2026-10-24 過去ログページ端・下部フィルター位置・設定感度242（未公開）

emulator-5554/resumefix242へ初回・継承修正APKを署名照合install-r更新Success。絶対パス/全SHA256/署名鍵・結果は[pages-filter-gestures-20261024.md](pages-filter-gestures-20261024.md)。最終の位置保持7項目は並行作業のcached-wacchoi-toggle242.apkに更新された後の実base.apkで成功しており、当方の直前候補と区別して記録。実機/公開は未変更。5554予約確認後は操作停止。

## 2026-10-24 エッヂ検索欄切替・次スレ候補起動242（未公開）

emulator-5554のresumefix242へ署名照合データ保持更新Success。APK/MPP絶対パス・SHA256・鍵・検証範囲は[eddi-next-thread-form-20261024.md](eddi-next-thread-form-20261024.md)。実機/公開Releaseは未変更。

## 2026-10-24 固定フィルター初回measure前予約（191/242・未公開）

emulator-5554のsettingsfix191/resumefix242へ署名照合install-r Success、データ保持。APK/MPP絶対パス・SHA256・署名鍵・検証結果と未解決ANRは[pinned-first-layout-191-20261024.md](pinned-first-layout-191-20261024.md)。実機/公開版は未変更。新着到着条件の完全解決確認ではない。

## 2026-10-24 ローカル自動バックアップ検証191（未公開）

emulator-5554 / settingsfix191へ署名照合install-r Success、データ保持。中間/最終APK・MPP絶対root/SHA256・鍵と検証設定の復元結果は[local-auto-backup-check-20261024.md](local-auto-backup-check-20261024.md)。実機変更・公開なし。

## 2026-10-24 サムネイル・常時下部フィルター・下4桁NG候補

emulator-5554のHaiagaru 検証 242（resumefix242）へ同一署名照合install-r Success、設定・データ保持。APK/MPP絶対root・SHA256・鍵・途中候補を含む記録は[thumbnail-pinned-menu-20261024.md](thumbnail-pinned-menu-20261024.md)。実機と公開Releaseは変更なし。

## 2026-10-23 GIF取得選択・固定フィルターとポップアップ修正候補

emulator-5554のHaiagaru 検証 226（resumefix226）を署名照合install-rでデータ保持更新。APK/MPP絶対ルート・SHA256・鍵・検証結果は[gif-autofetch-pinned-popup-20261023.md](gif-autofetch-pinned-popup-20261023.md)参照。公開dev.13と異なる未公開候補、実機は変更していない。

## 2026-10-23 公開dev.13を226へ適用・リロード位置検証

emulator-5554のresumefix226へ同一署名照合install-r Success。公開MPPを使用し設定・データ保持。APK/MPP絶対ルート・ハッシュ・鍵・native検査と最終6項目成功は[reload-card-position226-20261023.md](reload-card-position226-20261023.md)参照。実機は変更していない。

## 2026-10-23 下部フィルター常時表示・公開前統合候補

emulator-5554の191／242を同一署名照合してデータ保持更新。各23項目成功、242は最新origin/dev取り込み後の統合版へ再更新済み。package・版・表示名・APK/MPP絶対ルート・SHA256・鍵・結果は[persistent-bottom-filters-20261023.md](persistent-bottom-filters-20261023.md)参照。191は統合前の同一フィルター処理で検証し、226共通重複操作を省略。実機は変更していない。

## 2026-10-23 242 本文メニューの下4桁NG登録修正候補（未公開）

emulator-5554の242を同一署名照合install-rで更新、データ保持。package・表示名・APK/MPP絶対ルートとSHA-256・鍵・結果は[ng-suffix-body242-20261023.md](ng-suffix-body242-20261023.md)参照。先行タブ移動の変更も含む。191／226・実機への再導入と公開は未実施。

## 2026-10-23 スレ側の隣接タブ移動候補191/242（未公開）

emulator-5554の既存検証用191/242を同一署名照合install-rで更新。表示名・版・package・APK/MPP絶対ルートとSHA-256・鍵・結果は[thread-tool-tab-swipe-20261023.md](thread-tool-tab-swipe-20261023.md)参照。実機の変更、データ消去は行っていない。操作検証中。

## 2026-10-23 日付入力・設定表示を含む最終候補191/242

emulator-5554で署名照合install-r成功。最終はprerelease-final-ui191.apk / prerelease-final-ui242.apk。表示名、package、APK/MPP絶対ルートとSHA-256、署名鍵は[archive-date-input-20261023.md](archive-date-input-20261023.md)参照。実機への導入は行っていない。

## 2026-10-23 左ペインのチェッカースワイプ対策（未公開）

emulator-5554の既存191/242検証版を署名照合してinstall-r成功。APK/MPP絶対パス、SHA-256、鍵、packageと検証範囲は[checker-swipe-tablet-20261023.md](checker-swipe-tablet-20261023.md)に記録。実機への導入は行っていない。

## 2026-10-23 タブ追加先・GIF・NG軽量化・チェッカー高さ（未公開）

emulator-5554へ既存署名を照合して更新。各版のpackage、APK/MPP絶対パスの共通ルートとSHA-256、署名鍵、導入結果は[pane-gif-checker-ng-20261023.md](pane-gif-checker-ng-20261023.md)の導入記録を参照。最新は191=gif-ng-pane191.apk、226=pane-choice226.apk、242=checker-dialog-final242.apk。実機への導入・Release更新は行っていない。

## 2026-10-23 プレ公開前：メニュー分離・NG編集説明

- Serial `emulator-5554`、191/242を既存証明書照合後にinstall-r Success、データ保持。191 `Haiagaru 検証 191` / `0.8.10.191 dev` / package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。242 `Haiagaru 検証 242` / `0.8.10.242 dev` / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。
- 191 APK `<workspace>/build/menu-ng-final191.apk`、SHA256 `7EE9B42661040595A48B389308BC2B97E100DE43FA6954681A30F87AD91317D9`。
- 242 APK `<workspace>/build/menu-ng-final242.apk`、SHA256 `EF5FC72F3BB321B45C6DDF96A0AE82CB06CAFC16F8740CE329A02DEDAA0F47EB`。
- ローカルMPP `<workspace>/patches/build/libs/patches-1.12.0-dev.10.mpp`、SHA256 `F44248142B8678E343A1EA08DC3352E584FB56A04DD5249D4EDE4109A3CFF735`。公開dev.10とは異なる未公開候補。
- 署名証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- 通常Lint込み最終build成功（2分22秒）。191のname hookは別入口へ変更し、`VerifyLegacyWacchoiMenuSplit`で元register数、native popup register、owner/menu/選択レス引数が不変であることを確認。242nativeタブfactoryと191人気hookも静的検査成功。
- 191/242それぞれ設定スイッチ/旧結合値の分離32項目、実Menu生成16項目成功。旧name ON/visibility=1でも本文側native非表示を維持、name/bodyの逆ONOFF、上/下4桁/上4桁NG、追加ツールも検査。設定はfinallyで復元。従来の`frida-response-menu-off-smoke.js`は旧結合仕様の履歴テストで、今回の仕様は`frida-response-menu-separate-smoke.js`と`frida-wacchoi-menu-isolation.js`で検査。
- 242の未保存NGテンプレートを360dp幅で開き、説明段落が短い「判定式」labelから分離していることをモデル・UI XML・画像`build/ng-editor242.png`で確認。説明はdialog内横幅に折り返され、入力枠と重ならない。保存せずdismiss。新規ルールを永続化していない。
- 191はUIの板一覧→5ch→家電製品→Android→Part3から実本文を表示・scrollし、画像サムネイルから`ImagesViewer2Activity`で167KB/820×1800画像の表示を視認、戻る成功。最初のURL文字列タップはChromeのImgurページへ開いたため内部viewer成功扱いにせず、Chromeを閉じてサムネイルから再確認した。242実本文はNG画面の背後でも確認。画像の242重複操作・226共通UI/ルーティング重複適用はユーザー許可に基づき省略。226のname builderには別helperを適用、nativehookは変更していない。
- 最終crash時刻は既存03:12 UTCから増加なし、lastanrは起動後記録なし。初回Frida接続の1回はinstall完了と起動の競合でpid空、再起動後に再接続して成功。新たなクラッシュとして扱っていない。
- 長時間・全自作テーマ・実認証や投稿/MEGA操作は未確認。公開前候補の先行タブ/人気/NG軽量化/アイコン/調整設定も保持。公開は既存Semantic Release CIのみ使用。

## 2026-10-23 フローティングフィルターのアイコン画像（未公開）

- Serial `emulator-5554`、表示名 `Haiagaru 検証 242`、ChMate `0.8.10.242 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。既存証明書一致後、`InstallVerifiedApk.ps1` でinstall-r Success、データ保持。
- APK `<workspace>/build/floating-filter-icon242.apk`、SHA256 `5A22A5241D3F5DF7B98C7973E73A394B5FD6CFBD809C45D16BAA189CD27676A0`。
- ローカルMPP `<workspace>/patches/build/libs/patches-1.12.0-dev.10.mpp`、SHA256 `E08AAF8472DA84280644E2BCA2E9FAF316F2D0E67FDB0E48CFDD967F6A2B53F6`。公開dev.10とは別候補。
- 署名証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- Android build通常Lint込み成功（2分40秒）。`FloatingFilterIconAndroidTest`で12項目成功（新slot7、専用設定名、標準glyph、長押し説明、実mounted buttonへの合成画像import即時反映、色/縦横比、label/余白、通常filter画像不変、reset即時反映、detach cleanup）。既存FloatingFilterAndroidTestも9項目成功しtap/long-drag/位置保存復元/ONOFFを維持。ログ `build/floating-filter-icon242-test.log`。
- テストは新slotに既存ファイルがないことを確認してから小さな合成PNGのみ生成し、最後に検証用画像を削除・設定を復元。個人画像・既存アイコンは上書きしていない。通常の画像pickerの実手動操作は未実施。
- 191/226は共通Java変更・nativehook未変更のため重複適用/導入/端末操作を省略し、従来候補を維持。先行NG未読/人気popup/親OFFタブ/見出し変更も候補に保持。未公開。

## 2026-10-23 14:55 JST 親設定OFF時の通常ビューア経路（未公開）

- ユーザー確認により、手動追加だけでなく長押し等の通常入口も親スイッチOFF時に専用ビューアをスレと同じタブ列へ開く。個別画面OFFとHaiagaru設定の親スイッチは維持。
- Serial `emulator-5554`、ChMate `0.8.10.242 dev`、表示名 `Haiagaru 検証 242`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。既存署名一致後に `InstallVerifiedApk.ps1` でinstall-r、Success。データ消去なし。
- APK `<workspace>/build/viewer-tabs-master-off242.apk`、SHA256 `F699015E563B9CC5AAC2D593620CDBDDAFB6B39A8A70C6ED5CABFD271D784C98`。
- ローカルMPP `<workspace>/patches/build/libs/patches-1.12.0-dev.10.mpp`、SHA256 `24E2E7FC4791B23C37DB364F9E2AEE56C8ADD2D8AB751662A82A9D48B2D5921D`。公開dev.10とは別候補。
- 署名証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- 通常Lint込みAndroid build成功（2分38秒）。nativefactory元命令/レジスター/分岐/Fragment rebasing検査成功。`frida-longpress-tab-entry-smoke.js`を親OFFのままで走らせ、上下4桁/全文/IDの4入口、検索語/板引継ぎ、実タブ表示、×の透明背景/重なりなし/実クリック終了、個別OFFの別画面経路、親OFFの別設定画面、設定復元を検査。ログ `build/viewer-tabs-master-off242-test.log`。
- 変更は共通Javaのルーティング条件と設定説明のみ。191/226の重複適用/導入/端末操作はユーザー許可に従い省略し、両版は直前候補を維持。未公開・版名更新なし。

## 2026-10-23 手動タブ・人気レスポップアップ分離 最終候補（未公開）

- Serial `emulator-5554`、191/242とも既存証明書一致を確認して `InstallVerifiedApk.ps1` のinstall-rでSuccess。設定/データ消去なし。
- 191 `Haiagaru 検証 191` / `0.8.10.191 dev` / `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。APK `<workspace>/build/manual-popular-final191.apk`、SHA256 `D6B0670AC8EB7D31E99657A5967116FAF4E7993C31F048D01A15A1B0ED363386`。
- 242 `Haiagaru 検証 242` / `0.8.10.242 dev` / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。APK `<workspace>/build/manual-popular-final242.apk`、SHA256 `AA27F1694B1780F58CCB90781B4AF8BA80749062D2112B9D69334DD4208CC5DB`。
- 最終MPP `<workspace>/patches/build/libs/patches-1.12.0-dev.10.mpp`、SHA256 `E8D7E229A850EBE6D5F7A57E85F0C1585730E7F5896A333ADF31F5648509EB38`。公開dev.10とは異なる候補。
- 署名証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- 先行242経路試験では同じpackage/証明書へ `<workspace>/build/manual-popular242.apk`（SHA256 `BCA9C4079E789C2095E978DCC6A2698DF9A2ED0227FE01750AD18C0C2E71B426`）をデータ保持導入。先行MPP SHA256 `5D60E2FAE27ED85CDB286A7A3F2A78784322EBFAF0E7CD8327C0FEE8767E01A2`。上記最終版で置換済み。先行191 APKは生成だけで導入していない。
- 最終191/242 nativehook静的検査成功、人気レス回帰30/29項目。242の実スレcapture再現161→161、native標準161/直接2と本文2一致、手動設定経路9項目成功。詳細 `manual-tabs-popular-popup-20261023.md`。226の共通重複操作は省略、未公開。

## 2026-10-23 14:24 JST NG未読・開閉時再計算候補（未公開）

- `emulator-5554`、既存191/242検証パッケージを証明書照合後install-rし、両方Success。データ消去なし。
- 191表示名 `Haiagaru 検証 191`、ChMate `0.8.10.191 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。APK `<workspace>/build/unread-rebuild191.apk`、SHA256 `81EE2E10F9979574151F533B2DF85D28E051265CEB2B0A760F064F67B3891491`。
- 242表示名 `Haiagaru 検証 242`、ChMate `0.8.10.242 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。APK `<workspace>/build/unread-rebuild242.apk`、SHA256 `E13FF4191CD6BB2F8111C368DB1727C987774D0B8A8CC437E0A9AD963A905168`。
- 共通ローカルMPP `<workspace>/patches/build/libs/patches-1.12.0-dev.10.mpp`、SHA256 `94660408F13C392433489CF48A48C1FAD86D38A09B19091B83DD3F28463DBF21`。公開dev.10とは別物。先行未コミットのビューア調整/タブ見出し設定も保持した候補。
- 署名証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- native hook検査191/242=4/8箇所、合成再計算各8、native未読各7、未読値191/242=10/15項目成功。テスト用設定・合成membershipを復元。226の重複導入/操作は共通Java変更のため省略、従来候補のまま。詳細 `hidden-ng-unread-rebuild-20261023.md`。実開閉の体感ラグの完全解消は未確認、公開なし。

## 2026-10-23 専用タブ見出し高さ・調整ボタン候補（未公開）

- 対象 `emulator-5554`、ChMate 242、表示名 `Haiagaru 検証 242`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。既存証明書一致後に `InstallVerifiedApk.ps1` で `install -r` Success。データ保持。
- APK `<workspace>/build/tool-header242.apk`、SHA256 `2F343F166CDAC94B7D8AA5F9ADD3BC5F7EB35B9490DBD7D2499C526C2BAE26C4`。
- ローカルMPP `<workspace>/patches/build/libs/patches-1.12.0-dev.10.mpp`、SHA256 `518E3393818AC2CB8FC0DA952D9115524E0EDE5DE23F289928BD703A3B2B5DFD`。公開済みdev.10のMPPとは異なる未公開候補。
- 署名証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- 通常Lint込みAndroidビルド成功。242 native factory元命令・レジスター・分岐・Fragment rebasing検査成功。Frida `frida-tool-header-settings.js` は24項目成功。調整ボタン初期値/ON/OFF/resume、共有値検証、実タブの32/48/64dp即時変更、背景本体色一致、重なりなし、透明×と実クリック終了、設定復元を確認。
- 初回テストは最適化済みテーマ関数のFrida置換が反映されないfixture、およびConsumer登録にdefault method実装が必要なfixtureで中断。テーマ置換をやめ実テーマ比較へ、未使用callbackをnullへ変更後に全項目成功。透過/全自作テーマの実画面検証は未実施。共通実装の191/226重複導入は省略、両版は従来候補のまま。公開なし。

## 2026-10-23 公開配布物1.12.0-dev.10

- 公開URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.10 。CI39900790356 success、生成commit272945d、draft=false／prerelease=true、公開日時2026-10-23T04:35:28Z。
- 公開MPP `build/release-dev10-verify/patches-1.12.0-dev.10.mpp`、SHA256 `72172D57A1EE7C1722E26002175049DFE237B14B199B0D51F8D64D4ED7EC097E`。6配布物のGitHub digest一致、Android classes.dex確認。
- devのメタデータ2本はcreated_at `2026-10-23T04:32:50`（タイムゾーンなし）。初回rawの古いdev.9 CDNキャッシュは時間経過後にdev.10へ切り替わった。MorpheはプレONのまま既存ソースを更新し、main/devメタデータの実GETとdev.10カード／詳細表示を確認。安定版は1.11.2のまま。
- この公開CI版MPPそのものによるAPK再生成・端末更新は未実施。エミュレータの191／242は下記NoCopySpan保護込みローカル候補、226は共通処理の重複検証省略で下記未読NG候補を保持。公開版とローカル候補のMPPハッシュを混同しない。

## 2026-10-23 安価が多い本文の装飾候補・NoCopySpan保護

- Serial `emulator-5554`。191／242を証明書一致確認後に`install -r`更新しSuccess。データ消去なし。226は直前の未読NG軽量化候補を維持し、今回の共通Java変更の重複端末試験は省略。
- 最終MPP `<workspace>/patches/build/libs/patches-1.12.0-dev.9.mpp`、SHA256 `5BD55CCCC56D65362882337C20570ECF5B8390FE27306BB3B17A1F7360356AF0`。未公開候補であり、停止CIのdev.9配布物ではない。
- APKディレクトリ `<workspace>/build/`。
- 191: `dense-anchor-safe191.apk`、SHA256 `B098FAB3E3E607B6046901F65FBB1C743B6625AFD5F1C3BBDA7180A8D1F65DDF`、package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`、表示名`Haiagaru 検証 191`、ChMate `0.8.10.191 dev`。
- 242: `dense-anchor-safe242.apk`、SHA256 `273547F1AE85BD295DA76DB463EBA5598091AE7F78CCFEE51B0948A7006A980A`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名`Haiagaru 検証 242`、ChMate `0.8.10.242 dev`。
- 中間候補MPP59600D47...からも同パッケージへ導入した（NoCopySpan保護前）。`dense-anchor191.apk` SHA256 `F8ADB42AFDC333CD91C792A4DCA6169B2D1D67C759BCB5351E41A5367AF999BF`、`dense-anchor242.apk` SHA256 `8AEEFEAFA302758BC8724C1E23EB36D73388A8FA2A359CEA5E649D3033D64877`。最終版へ更新済み。
- 全署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 191／242各16の本文・span保持試験、強調ルール63項目、nativeフックの検査、242実安価ポップアップ表示を確認。詳細dense-anchor-render-20261023.md。

## 2026-10-23 未読NG軽量化・設定上部余白の最終候補

- Serial `emulator-5554`。署名照合後に191／226／242すべてを`install -r`更新しSuccess。既存データを保持。
- 共通MPP: `<workspace>/patches/build/libs/patches-1.12.0-dev.8.mpp`、SHA256 `3702459BA8D96AC4C747B02C87EA86FC5B1A80542D80A7C3CF912D011CBB0AA1`。下記の人気レス候補も含む、公開dev.8とは別のローカル候補。
- APKディレクトリ: `<workspace>/build/`。
- 191: `unread-home191.apk`、SHA256 `C7B7AE17B4FD671C879F4FD4EC5A265411266302A9BF8F615E2E84CBAC4FB77A`、package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`、表示名`Haiagaru 検証 191`、ChMate `0.8.10.191 dev`。
- 226: `unread-home226.apk`、SHA256 `9BDD639638C3A87D541863BF3717383641C898830416C9E4113B33C929626AE4`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix226`、表示名`Haiagaru 検証 226`、ChMate `0.8.10.226 dev`。
- 242: `unread-home242.apk`、SHA256 `D3401DE20D104FDC1A7432D9248D97C1AE1C25D4EC9D62825398FAAA7ADCC9FA`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名`Haiagaru 検証 242`、ChMate `0.8.10.242 dev`。
- 共通署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 各installログは`build/unread-home<版>-install.log`。性能確認と制限はhidden-ng-unread-perf-20261023.md。

## 2026-10-23 人気レス断続欠落・タブ入口等の候補（未公開）

- Serial `emulator-5554`。既存の191／226／242検証パッケージを証明書一致の確認後に`install -r`更新し、全件Success。アンインストール・データ消去なし。
- MPP絶対パス `<workspace>/patches/build/libs/patches-1.12.0-dev.8.mpp`、SHA256 `4ED3294444E82FCFD1D954AB4949775A7E97C0BCC4F85E911177ADE2930B0437`。公開dev.8とは異なるローカル候補。
- 全APKのディレクトリは `<workspace>/build/`。
- 191: `popular-intermittent191.apk`、SHA256 `90F44929E543EDD87918AEEE5A674E14FB51EA34475DAB2690590B3ECB5314E8`、package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`、表示名`Haiagaru 検証 191`、ChMate `0.8.10.191 dev`。
- 226: `popular-intermittent226.apk`、SHA256 `0E499BD578C089EDECCB3B72A007D6F506A8AA819D366813918D20F454483E42`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix226`、表示名`Haiagaru 検証 226`、ChMate `0.8.10.226 dev`。
- 242: `popular-intermittent242.apk`、SHA256 `77ADA0536827363BCC70BACC7044AF3B1F03B4342387429049D3E5C46A0C6628`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名`Haiagaru 検証 242`、ChMate `0.8.10.242 dev`。
- 署名鍵は `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。全APK証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 直前のタブ／HTTPS／メニューOFF候補MPP `B489445C3865F606A93B67A1B5F3B92A52DEB01BEFF6B155602C4C4BC37EA111`も同パッケージへ導入済みだった。今回候補はそのソースを保持し人気レスを追加修正して更新。検証結果はpopular-stale-layout-20261023.mdと各buildログを参照。

## 2026-10-23 プレリリース配布物1.12.0-dev.8

- URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.8 。CI run39885815088成功、draft=false/prerelease=true。公開日時2026-10-23 10:50 JST。
- 公開MPP `patches-1.12.0-dev.8.mpp` SHA256 `9CB9610C1F8E442C31F2CF539CBDFF527D74F51887E4EAAEDCABB47E62E1069E`。`build/release-dev8-verify`へ配布物6点をダウンロードして全件digest一致、MPP内classes.dex確認。
- devのJSON2本は1.12.0-dev.8、created_at `2026-10-23T01:47:18`（タイムゾーンなし）。emulator-5554のMorpheソースでプレリリースONのまま更新し、fresh logcatでmain/devのメタデータ取得、ソース画面と詳細の1.12.0-dev.8表示を確認。登録先は変更していない。正式版1.11.2は維持。
- 端末の検証アプリは下記のローカル候補MPP適用版。今回CI公開MPPからのAPK再生成・端末更新は未実施。

## 2026-10-23 全差分候補・フィルター件数初期オフ

- Serial `emulator-5554`。191は既存composefix191との署名不一致を検出して更新を中止し、未導入のsettingsfix191へ別アプリとして追加。226／242は既存署名一致を検証して更新。その後、件数初期オフ・×背景フォールバックを含む以下の最終APKへ全3パッケージを`install -r`更新。既存アプリの削除・データ消去なし。
- 共通MPP: `<workspace>/patches/build/libs/patches-1.12.0-dev.7.mpp`、SHA256 `1734F184CE885639C09DB8B41010C3AF8DA011488FDCDB4A375095BA023E3C6F`。公開dev.7と異なる未公開のローカル候補。
- 191: `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`、表示名`Haiagaru 検証 191`、versionName `0.8.10.191 dev`。APK `<workspace>/build/final-default-191.apk`、SHA256 `343A925E2912B4F51152FD743342D004FF80046BC7A57B61661785C0CB18306D`。
- 226: `jp.co.airfront.android.a2chMate.haiagaru.resumefix226`、表示名`Haiagaru 検証 226`、versionName `0.8.10.226 dev`。APK `<workspace>/build/final-default-226.apk`、SHA256 `F22227F95A76B66F7365468750A2C4099CDA382FEBA3BF689E9797186AA05F29`。
- 242: `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名`Haiagaru 検証 242`、versionName `0.8.10.242 dev`。APK `<workspace>/build/final-default-242.apk`、SHA256 `CC945A51F36BFB293E81F7C6F76D7F65535EE97CC5DEC2050301FD78A368C8C4`。
- 全APK versionCode `2100000000`、署名鍵`C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 最終APKの7色native bridge検査は全3版成功。人気レス合成native行検査は191／226各21項目、242は20項目成功。242の実Part3で標準149件と追加集計149件が一致、直接返信・ポップアップOFFで2レスを表示。基準ログと最終crash bufferに新規クラッシュなし、lastanrは起動後記録なし。途中のスクリーンショットにSystem UIの待機ダイアログがあり、アプリANRと同一とは扱わない。長時間再発、画像・各変更画面の通し操作は未完了。未公開。

## 2026-10-23 必死チェッカー見出し候補191を実機更新

- 対象serial: `730eae72`（XIG05）。既存の`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`（「Haiagaru191 設定検証」）を更新。アンインストール・データ消去なし。
- APK: `build/hissi-header191-final.apk`、SHA-256 `111112A34A7DED35138B4A24287FC20C0CDBA22F9193A1B17A57374B9904332E`。端末から取得した`base.apk`とSHA-256一致。
- MPP: `patches/build/libs/patches-1.12.0-dev.7.mpp`、SHA-256 `B76A6D95A5699AA0DA843828B8DDCD3F3D709A764042A52D588F750C03E1DD1C`。元APKは`C:/Users/narum/Downloads/chamate/chmate191/chmate-0-8-10-191-dev.apk`。
- 署名証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。導入後versionName `0.8.10.191 dev`、lastUpdateTime `2026-10-23 01:00:19`。アプリ内での操作確認は未実施。

## 2026-10-22 実機XIG05へツールバー画像／必死チェッカー調整版191を追加

- 対象シリアル: `730eae72`（XIG05）。対象ChMateは`0.8.10.191 dev`。
- 既存の実機パッケージはそのまま残し、検証用の別パッケージ`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`（表示名「Haiagaru191 設定検証」）を新規追加した。インストール前に当該パッケージが未導入であることを確認。アンインストール・データ消去・既存アプリ更新なし。
- APK: `<workspace>/build/toolbar-hissi191-device.apk`、SHA-256 `B0D660CE6533EB15467248443125B6E9F80592D84A0524C6613DE38AD397F620`。実機からpullした`base.apk`も同じSHA-256。
- 使用MPP: `<workspace>/patches/build/libs/patches-1.12.0-dev.7.mpp`、SHA-256 `553B5A5A651C0681313B452466CF65771800F43DE060085A86331D56788D67DC`。元APK: `C:/Users/narum/Downloads/chamate/chmate191/chmate-0-8-10-191-dev.apk`。
- 署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`（BKS）、alias `Morphe`。署名証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- `adb -s 730eae72 install -r`成功、versionName確認、HomeActivity起動を確認。確認時の直近AndroidRuntimeログにクラッシュ記録なし。画面内での設定・画像変更操作は未確認。

### 同端末パッケージをビューア調整追加版へ更新

- 2026-10-22、serial `730eae72`で上記と同じ`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`を署名証明書照合後に`adb install -r`で更新。既存設定・データを保持。
- APK: `<workspace>/build/toolbar-hissi191-viewer-settings.apk`、SHA-256 `305EC623AFB2636F70CD8E1E40C1EB5F227B9FDE98F12AB51E57BA1BABA799E3`。実機からpullしたAPKも同じSHA-256。
- MPP: `<workspace>/patches/build/libs/patches-1.12.0-dev.7.mpp`、SHA-256 `B874558A2BFD0F15F43CD3B30464D1717FC51AE17069F4CFB8BE6EB9244C20C1`。証明書は上記と同じ`0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 更新成功、versionName `0.8.10.191 dev`、lastUpdateTime `2026-10-22 23:42:18`。起動後は既存のHissiMenuActivityが前面。確認時点の直近AndroidRuntimeエラー出力はなし。ビューアの「調整」操作自体は実画面で未確認。

## 2026-10-22 プレリリース配布物1.12.0-dev.7

- GitHub Release: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.7 （`draft=false`、`prerelease=true`）。既存Semantic Release CI run `39789862059` success。
- CI配布MPP `patches-1.12.0-dev.7.mpp` SHA-256 `B5621615BDFA427864B23FDD0D63C3EE674E9F3EBA9E6188BD8B3D72D833CE52`。配布資産を取得してGitHub digestと照合。
- 更新feed `patches-bundle-pre.json`はversion `1.12.0-dev.7`、`created_at`は`2026-10-22T13:48:11`（末尾`Z`なし）。

## 2026-10-22 フィルター共存・未読NG集計軽量化 最終候補

- 対象serial: `emulator-5554`。191／226／242それぞれ未加工APKにMPPを適用し、各既存の検証用パッケージへ`adb install -r`で更新。標準パッケージの置換・アンインストール・データ消去なし。
- 使用MPP: `<workspace>/patches/build/libs/patches-1.12.0-dev.6.mpp`、適用時SHA-256 `2A71F4673F0F0B5EDB7EB836EB36323E21480122DF9EECE59F3FEB7A2BE85BA1`。
- 署名証明書SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は記録しない。

| ChMate／表示名 | パッケージ | APK絶対パス／SHA-256 | 結果 |
| --- | --- | --- | --- |
| 191 dev／Haiagaru191 設定検証 | `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` | `<workspace>/build/prerelease-final191.apk`／`B04A0F9362768F33019451EF81B882FB4621CB40EE68E3A8C6477684776038CB` | install-r・起動・未読テスト15項目成功 |
| 226 dev／Haiagaru 復帰修正 226 | `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` | `<workspace>/build/prerelease-final226.apk`／`C339135E86721FDAE90CAF14B5543CB307BD1CA7358AD38A5038D0DA7FCA2020` | install-r・起動・未読テスト15項目成功 |
| 242 dev／Haiagaru 復帰修正 242 | `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` | `<workspace>/build/prerelease-final242.apk`／`C915A253A6A57783C04032B79150CE2B3C51D6B788A64862F0EC4DF838B1F938` | install-r・起動・未読テスト15項目成功 |

- 全版の未読件数計算テスト10項目と合成ネイティブ行ON／OFFテスト5項目は合格。242では既存の取得済みスレ一覧表示も確認。画面上で上・下フィルター共存を切り替える操作、必死チェッカー設定を実際に開く操作、開閉時間計測は未完了。
- 226のFrida合成ネイティブ行テストではPASS後にSIGSEGVが1回記録された（2026-10-22 13:38:21 UTC）。その後の通常起動では画面が開いた。Instrumentation終了後の単発事象で原因を特定できず、このテストをクラッシュなしの根拠には含めない。公開後もクラッシュ報告を注意して確認する。
- これはプレリリース用の候補確認であり、実機試験は未実施。

## 2026-10-22 履歴DAT落ち非表示・人気レス件数修正版（未公開）

- 対象端末: `emulator-5554`。191／226／242の既存検証パッケージに`adb install -r`で導入。アンインストール・データ消去なし。端末上の`base.apk`をSHA-256照合し、生成APKと一致することを確認。
- MPP: `<workspace>/patches/build/libs/patches-1.12.0-dev.6.mpp`、SHA-256 `FDD3CF4AD969A6B9BBB99F9DEBADEE0323A59F9C768ECD792E917E9C4B000E2C`。
- 署名証明書SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵は`C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は記録しない。

| ChMate | パッケージ | APK・SHA-256 | 端末導入確認 |
| --- | --- | --- | --- |
| 191 dev | `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` | `build/dat-popular-fix191.apk` — `A0D0062223C6F47AE4D14A31D24EF89BA7113345D7410F9A7101A297197E6C70` | `0.8.10.191 dev`。導入済みAPKと一致 |
| 226 dev | `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` | `build/dat-popular-fix226.apk` — `9484DDED1ECD1CA57689A684F121074CE81EFBBABA0B98AEA8D29E2D3343A19B` | `0.8.10.226 dev`。導入済みAPKと一致 |
| 242 dev | `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` | `build/dat-popular-fix242.apk` — `EF8FBA9D48D0490B416E8ADF59846B934419E144FCCB28CBE2CCB72A6F389EB9` | `0.8.10.242 dev`。導入済みAPKと一致 |
| 242 dev・実スレ人気レス比較用 | `jp.co.airfront.android.a2chMate.haiagaru.popularfix242` | `build/dat-popular-fix-popular242.apk` — `046DF92149E96F0DB19BDD2DEBC0A2AF1A4A85BDA55FDB5DD28B132D9AAF1821` | `0.8.10.242 dev`。導入済みAPKと一致 |

- DAT履歴テストは各版11項目、人気レステストは191／226各19項目・242 18項目合格。191／226の履歴mode `100`と242の履歴mode `103`を個別確認し、242のmode `100`を誤って履歴扱いしないことも確認した。
- 242の保存済み実スレ（361レス）で標準方式126件（native標準件数と一致）、直接返信方式1件。直接返信判定とポップアップ表示のON/OFF全4組合せで件数表示が「—」または負数にならないことを確認。ユーザーが以前示した「103件」の再現データは今回の端末スレでは確認しておらず、126件を103件として扱わない。
- 初回Frida履歴試験では検証ハーネスの反射呼び出し中にSIGSEGVを一度記録。該当呼び出しをスタブ化した再試験は3版とも合格し、その後の通常起動・人気レス確認で新たなクラッシュはなし。この初回記録は削除していない。
- これはローカル未公開候補。プレリリース／正式リリース、版名更新、実機導入は行っていない。

## 2026-10-22 dev.5同期後の人気レス再確認（未公開候補）

- 対象serial `emulator-5554`。既存の242検証パッケージ `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名「Haiagaru 復帰修正 242」、ChMate `0.8.10.242 dev`。端末のinstalled `base.apk`をpullし、候補APKとSHA-256一致を確認（再インストール・データ消去なし）。`lastUpdateTime` は端末記録 `2026-10-22 09:57:42 UTC`。
- MPP `<workspace>/patches/build/libs/patches-1.12.0-dev.5.mpp` SHA-256 `70FA88D38054CC7CEEC8BCBDFEEBEAD2795DF22F35D66B2CAF7A337C25E26FA9`。
- 候補／installed APK `<workspace>/build/popular-refresh-dev5-242.apk` SHA-256 `56A6E1617ACF050AB14D5C9D3FE0383AAD7992A1DB01858AB3F3D96EDECF32E8`。候補署名証明書 SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- スレ「【緊急】PSP死亡　国が警告 ★8」の実データで、直接返信判定OFF=295、ON=25。ポップアップ表示ON/OFFで件数は変わらず、4組合せすべて`failure=null`かつ非負。「—」は再現しなかった。設定は試験後に復元。
- 「自分」フィルターのPart3実レス試験は、取得済みデータを持つ別の既存242検証パッケージ `jp.co.airfront.android.a2chMate.haiagaru.popularfix242` で実施した。自分件数1、レス353のみを抽出し、解除後は369行へ復帰。dev.5候補の`resumefix242`にはPart3の取得済みデータがなかったため、その候補上でのPart3自分フィルター再確認ではない。
- どちらもエミュレータのみ。版名更新・公開・実機変更なし。

## 2026-10-22 人気レス／DAT更新確認（未公開）

- 対象 `emulator-5554`。既存の別パッケージを同じ署名で`adb install -r`更新（アンインストール・データ消去なし）。
- 共通MPP: `<workspace>/patches/build/libs/patches-1.12.0-dev.1.mpp`、SHA-256 `62214E1C0C7AD2731433FF7C2B11D6AD0F9F562BE4C6264E07C9051537A3640E`。
- 191: 表示名「Haiagaru 人気レス検証 191」、ChMate `0.8.10.191 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.popularfix191`。APK `<workspace>/build/popular-refresh/haiagaru191.apk`、SHA-256 `0547B283BD3266255AF1F40B864E8B115BBE734C97C5C7379E787545A95AF0E4`。元APKへの適用・署名成功、install-r成功、HomeActivity起動。
- 226: 表示名「Haiagaru 人気レス検証 226」、ChMate `0.8.10.226 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.popularfix226`。APK `<workspace>/build/popular-refresh/haiagaru226.apk`、SHA-256 `BE25ABECD3A157DD6F6D954CFE199113F7AB650E8A9F14A803935F2D24012F51`。元APKへの適用・署名成功、install-r成功、初回画面起動。スレ表示／更新操作は未確認。
- 242: 表示名「Haiagaru 人気レス検証 242」、ChMate `0.8.10.242 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.popularfix242`。APK `<workspace>/build/popular-refresh/haiagaru242.apk`、SHA-256 `4B03BEB9E8056D7FB77763E24DC6541272F0182DB3558B1629047E30AD13779E`。元APKへの適用・署名成功、install-r成功、Part3の取得済みスレを表示。人気レス4モード、非負カウント、自分1件をFridaで確認。更新操作は正常な「更新なし」だったが、新着ありの再現ではない。
- 3 APKの署名証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`（BKS）、alias `Morphe`。パスワードは記録しない。

## 2026-10-22 hissi.org文字コード修正（未公開）

- 対象serial `emulator-5554`。既存191パッケージの証明書を照合し `install -r` 成功。実機・他版への導入なし。
- 191／ChMate0.8.10.191 dev「Haiagaru191 設定検証」／`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。端末導入時刻 2026-10-22 14:43:33 JST。
- MPP `<workspace>/build/hissi-encoding-normalized.mpp` SHA256 `30C33D19A8CAB190EEE11A70EFA54EEC4B596476EC2104063825B6571857E596`。
- APK `<workspace>/build/hissi-encoding-normalized191.apk` SHA256 `17A8017A711C5BA77F28365DD9A19FFBECA201609AAD92806E813ED364D23B5B`。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- hissi.orgの実レスポンスとWebView日本語DOM、DAT落ち履歴の実adapter／Edge合成回帰を検証。詳細 `docs/history-dat-hissi-encoding-20261022.md`。

## 2026-10-22 人気レス方式分離（未公開）

- 対象は全て `emulator-5554`、既存署名を照合してinstall -r成功。データ消去・アンインストール・実機変更なし。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- 以下のファイルは全て `<workspace>/build/` 配下（表のファイル名をこの絶対パスへ結合）。
- 191: ChMate0.8.10.191 dev「Haiagaru191 設定検証」、`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。226: ChMate0.8.10.226 dev「Haiagaru 復帰修正 226」、`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`。242: ChMate0.8.10.242 dev「Haiagaru 復帰修正 242」、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。

| 使用MPPとSHA256 | APKとSHA256 | 導入日時・結果 |
| --- | --- | --- |
| popularity-modes.mpp `2E3C86CE2890F2F438AF993E0C0A70288DC1E96797228435EA45BE470687552C` | popularity-modes191.apk `252688CF83F5D8878BE307B660279BB05BD45D08A30E673B42335E983F1D414E` | 10/22 初期候補、更新成功、後続へ置換 |
| 同上 | popularity-modes226.apk `D6ECEF88CB036A412F41E1A4AAA25548905C70E27CE12FFEA89C88A9054E91ED` | 10/22 初期候補、更新成功、後続へ置換 |
| 同上 | popularity-modes242.apk `8165E276CA7AEA197F55259EC90416578F76A9162F3CEE4306CC643B845CB0BD` | 10/22 初期候補、更新成功、後続へ置換 |
| popularity-modes-final.mpp `0E7516E46ECE46C067C4A1CF7141E6CEB5E13F531964E0643425637552A5BE4A` | popularity-modes-final191.apk `00B9B99F7C748D6FA3812905D384B76412AD5B8D107774A98986562E94CBA12E` | 10/22 14:00:27 JST、更新成功、合成16項目成功 |
| 同上 | popularity-modes-final226.apk `D673786A4FB7C94987085895E47DAEE263C98B53AC575A38065E7E7A6013E022` | 10/22 14:01:57 JST、更新成功、合成16項目成功 |
| 同上 | popularity-modes-final242.apk `B6B54BAC169049F3B7411378AC116155D7B91CCE1D72E8E49D53A0EB0C4269B5` | 10/22 13:47:28 JST、更新成功、後続へ置換 |
| popularity-modes-verified.mpp `38DF040DBE7FCE744DD6EC8601C8192AAAED06B64761A1AD33AD553143BE1138` | popularity-modes-verified242.apk `30D276C5E76639309F99CC015DDD6B610235A976ECB738E01CD3613FB1D5E253` | 10/22 14:05:40 JST、更新成功、後続へ置換 |
| popularity-display-mode.mpp `B6FAE9F87F56AF8479368C24FFDB6C0FCDA7E608253DF542DC158D7AE2348722` | popularity-display-mode242.apk `013B3927C2464C100EE62DAFB1B3A7885AEFDD22BE0B050DDFC57199AAEC56DE` | 10/22 14:16:39 JST（端末lastUpdateTime 05:16:39 UTC）、更新成功、合成17項目／native hook／実スレ比較成功 |

- 旧候補は242の表示方式取り違えのため配布不可。最後の242固有修正に対する191/226の再導入は行っていない。詳細 `docs/popular-reply-modes.md`。

## 2026-10-22 履歴DAT・GIF操作・任意フローティングフィルター（未公開）

- 対象serialはすべて `emulator-5554`。InstallVerifiedApk.ps1で既存パッケージと証明書を照合して `install -r` 成功。アンインストール・データ消去・実機更新なし。
- 最終MPP `<workspace>/build/floating-filter-controls-final.mpp` SHA256 `2FC10BC780FC8B8889E7A1B01558B4734AD7BCF75CBAF772B37CA8ED74DEE123`。
- 242／ChMate0.8.10.242 dev「Haiagaru 復帰修正 242」／`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。2026-10-22 12:21 JST、最終APK `<workspace>/build/floating-filter-controls-final242.apk` SHA256 `5D75BD66FF761FB999F49A7E6DFB4DE486124148A8CF090D1E19AD4AB1343151`。履歴5項目、任意フローティングの9項目成功。GIF最終試験はdocs/history-gif-controls-20261022.mdへ記録。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- フローティング追加前の履歴／GIF候補MPP `<workspace>/build/history-gif-controls.mpp` SHA256 `0B6FC98FDEE4DED9C3C57DCEFD298B4EC9640FC81BF3E345A86F19DE500098BC`。以下3版へ同署名更新、native履歴の回帰各5項目成功。これらの191／226には今回のフローティング追加はまだ導入していない。
  - 191「Haiagaru191 設定検証」／`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`／11:44 JST。APK `<workspace>/build/history-gif-controls191.apk` SHA256 `D26FE0EBC09B5D645340684124DEAF340A5661F3B6747C94A277AB33132F8C0C`。
  - 226「Haiagaru 復帰修正 226」／`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`／12:09 JST。APK `<workspace>/build/history-gif-controls226.apk` SHA256 `6A9727044965EE100572C07DDCF9CBBD69E2B9B6F386620831F5134AA7B2110A`。
  - 242「Haiagaru 復帰修正 242」／同resumefix242／11:46 JST。APK `<workspace>/build/history-gif-controls242.apk` SHA256 `DDCCDC02DAA4FC7022A4CEA5AEB6DD080D9B5A12A4D18DA1317B62477F9DC954`。上記最終候補へ置換済み。
- 中間フローティング候補MPP `build/floating-filter-controls.mpp` SHA256 `AC88186DDAEFC16FCE51F299BF57D1E027E04AA747832362870A03410156BB9C`、APK `build/floating-filter-controls242.apk` SHA256 `82927FAFBEC2C9FBB01534B9F1019E10D1C2EF95E47A77D882B92AAC854BE19B` も同serial／同resumefix242へ導入後、最終候補へ置換。上記と同じcanonical絶対パスのbuild配下。JS製の擬似ownerのコールバック試験失敗は成功扱いにせず、通常Java製のOwnerと実MotionEventで9項目を再検証。

## 2026-10-22 閲覧UA・右下ボタン・VPN説明 最終候補

- serial `emulator-5554`。全3版とも既存パッケージへInstallVerifiedApk.ps1で署名照合install -r成功。データ消去・実機への導入なし。
- 共通MPP `<workspace>/build/viewing-user-agent-verified.mpp` SHA256 `BD93052B2CC01C3DF2DB0FE5D628A5EF8124D7CB3815FDC5ABF57F61B2BF06DC`。
- 191／ChMate0.8.10.191 dev「Haiagaru191 設定検証」／`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。2026-10-22 11:27:38 JST、APK `<workspace>/build/viewing-user-agent-verified191.apk` SHA256 `64E978A30C998D24B1B9717679508D162E9BBD59291CCA7D615C8EA173ADF8BC`。
- 226／ChMate0.8.10.226 dev「Haiagaru 復帰修正 226」／`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`。2026-10-22 11:24:06 JST、APK `<workspace>/build/viewing-user-agent-verified226.apk` SHA256 `004C09365A2420C7D31242182D026F5777884EB056AE0206AA1C600B403AD484`。
- 242／ChMate0.8.10.242 dev「Haiagaru 復帰修正 242」／`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。2026-10-22 11:26:04 JST、APK `<workspace>/build/viewing-user-agent-verified242.apk` SHA256 `39084A94A9B418624E6EABD2DD34468A0769C99EF8CC28F23960906ACD1FD74F`。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- ログbuild/viewing-user-agent-verified{191,226,242}-install.txt、同-runtime.txt。各11項目成功、命令保持検査成功、設定復元済み。実送信・投稿なし。191での説明表示画像build/haiagaru-vpn-help-final.png。詳細docs/viewing-ua-verification-20261022.md。
- 中間候補は以下。すべて同一serial・同一版別パッケージ・同証明書のinstall -rであり、現在は上記最終候補へ置換済み。未公開。試作のImgurエラー処理はユーザー指示で取り消し、現行ソース／最終APKには収録しない。

| 中間MPP（build/以下）とSHA256 | 導入APK（build/以下）とSHA256 | 検証上の位置付け |
| --- | --- | --- |
| bottom-filter-no-floating.mpp `EB80EDC818877C873889BB8E24BD02F03B53FB9CCA665419A15F4F2C4415D621` | bottom-filter-no-floating191.apk `6202A4F4498E9756C0175E50745B1A1158D4C13A48BA7B679C953DACFAF3F7CC` | 右下ボタン撤去の初期候補 |
| filter-help-upload-error.mpp `F3B071F8151A2461562EA0E56E28B2B37573F07678E0E960E1D2A1E098BF17CA` | filter-help-upload-error191.apk `9ED02455C353A189D035BBD708302E6D87C6AE15850AE3669D476D2136BC4A43` | 説明表示は未改善、Imgur試作は後に取消。-finalビルドは中断し未導入 |
| viewing-user-agent.mpp `F5566FDF7DC88A77537E1EDD4A213F529D75F794B288FC87814A2580AE90AF39` | viewing-user-agent191.apk `B28205F7018F41ABBAA5C84A128425788692DDC5DFE86235E244BF1F7B831340` | 191初期11項目成功。226/242は生成のみ |
| viewing-user-agent-final.mpp `DC125A1A74C32CDB6D696E257A951F41FD8C9EFABA52FEDAFB0C7357FDC06A3D` | viewing-user-agent-final191.apk `954C07587DDC4F2A60BA44A547352F1A07D0D5F872B275B7DFC28EBD85F9770D`、226.apk `761CBEC631E25CD7CC72F56E33BDD29C85F1207C51EA36461DE618F40D959478`、242.apk `79033AF8D3E4D4D4E439D93E640AF90393BF47168A96AAAF394B616047B9C7DC` | native命令検査成功だが226/242のURL参照不一致で実行試験失敗。最終検証成功版は-verified |

中間導入ログは対応するbuild/*-install.txt。上記表の省略した226.apk／242.apkの接頭辞はviewing-user-agent-final。ローカル基底パスはいずれも `<workspace>`。

## 2026-10-22 09:13:04 JST Kyodemo代替検索先 最終候補

- 対象serial `emulator-5554`、ChMate0.8.10.191 dev「Haiagaru191 設定検証」、`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。InstallVerifiedApk.ps1の署名照合後install -r成功。既存データ消去・実機変更なし。
- APK `<workspace>/build/kyodemo-archive-final191.apk` SHA256 `014BF6E43532945605A9128A10E1CDE27CD3750F01C7404870A4257BC941DF2C`。
- MPP `<workspace>/build/kyodemo-archive-final.mpp` SHA256 `8F6EE1698A27F87CB3A8298151EAB45925E76C8E89A5E3BF47F41BD3B5AC13CB`。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- ログbuild/kyodemo-archive-final191-install.txt、build/kyodemo-archive-final191-runtime.txt。実検索・結果復元・切替13項目、native hook検査成功。画像build/kyodemo-archive-final191.png。新規アプリクラッシュなし、起動後ANRなし。試験前の検索保存状態を終了時に復元。
- 初期候補build/kyodemo-archive191.apkも同日署名照合更新・13項目成功。最終候補は日付区切り・重複見出しを改善した同一ソースの再ビルド。未公開、公開済み1.12.0-dev.2には今回の追加は含まれない。

## 2026-10-22 タブ・Dialog最終候補（ローカル検証）

- 対象serial `emulator-5554`。同一MPP `<workspace>/build/tool-tabs-safe-candidate.mpp`、SHA256 `0746F173D4395FD5ECCCF964BB9CFFD12BF733FDDE1931F499CD79E62985EF50`。実機は未接続のため今回更新なし。
- 191「Haiagaru191 設定検証」／ChMate0.8.10.191 dev／`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。APK `<workspace>/build/tool-tabs-safe-candidate191.apk`、SHA256 `A7FA2C48E2D4D0A5ADC42FD3DB8F4B176169BD5700AF63CD54B4D019BE947B18`。
- 226「Haiagaru 復帰修正 226」／ChMate0.8.10.226 dev／`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`。APK `<workspace>/build/tool-tabs-safe-candidate226.apk`、SHA256 `A3FC2D61B1014F3988646E3A851A76647D1982B97F4FD11267C72B0E48D52CB1`。
- 242「Haiagaru 復帰修正 242」／ChMate0.8.10.242 dev／`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。APK `<workspace>/build/tool-tabs-safe-candidate242.apk`、SHA256 `7062216876E92BE9C864093BEA972F5ED218BC0460EB13A01E9FA9E47B39E70E`。
- 各版ともInstallVerifiedApk.ps1で既存署名と照合しinstall -r成功。導入時刻・結果ログはbuild/tool-tabs-safe-candidate191-install.txt、226-install.txt、242-install.txt。設定・Cookie・既存データを消去しない。
- 最終導入ログの更新日時（JST）: 191=2026-10-22 08:03:27、226=08:04:27、242=03:01:21。端末確認はその後も実施。公開CI版は08:23公開であり、この導入物は公開前のローカル候補。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- 3版の本文・画像とnativeタブ、242の設定カード・検索タブ・追加入口・下部フィルター実タッチ復帰・GIF再生を確認。詳細docs/tool-tabs-settings-20261022.md。公開CI版MPPそのものを端末へ再適用した検証とは区別する。

## 2026-10-22 02:33 JSTまで タブUI初期候補の検証と復旧

- emulator-5554（Haiagaru_Test_API36_16GiB）の「Haiagaru 復帰修正 242」／ChMate0.8.10.242 dev／`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`へ初期候補を署名照合install -rで更新成功。APK `<workspace>/build/dialog-tab-review-fix242.apk` SHA256 `7719ECEB8B15BA8D8EE2BDF480390DBCE5B0BEC62D1D15769D111831AC1B99DF`、MPP `<workspace>/build/dialog-tab-review-fix.mpp` SHA256 `E1FBC061FE646FB0532E018B2227466FF977B0493C8E01C1ECD9443DEE8717D3`。
- 同候補でダイアログ11項目成功、タブ設定のLifecycleOwner不在を検出。この候補は配布しない。後続ソースで修正中。
- エミュレータ切断で一度復旧導入に失敗（build/dialog-tab-review-rollback242-install.txt）。同AVDをデータ消去なしで起動し、既知の確認済みAPKへ同署名install -rで復旧成功（build/dialog-tab-review-rollback242-install-retry.txt）。復旧APK `<workspace>/build/longpress-dispatch-fix242.apk` SHA256 `89D743AF11864731B79010578091DCDC9CD6A88E9C9ADD0B447F8192E34F7B2A`、MPP `<workspace>/build/longpress-dispatch-fix.mpp` SHA256 `67E0C5706D1CBD97AFF4715F9AE3F3B6ABB8423D185F374C73B97E52E718CFA7`。
- 両候補の証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。既存データ・Cookieの消去なし、実機への導入なし。

## 2026-10-22 01:39 JST XIG05の242長押し修正版を更新

- XIG05（730eae72）の「Haiagaru 復帰修正 242」／ChMate0.8.10.242 dev／`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`を署名照合install -rで更新成功。build/xig05-longpress-dispatch-fix242-install.txt。設定・履歴・Cookieの消去なし。更新後HomeActivity起動を要求。
- APK `<workspace>/build/longpress-dispatch-fix242.apk` SHA256 `89D743AF11864731B79010578091DCDC9CD6A88E9C9ADD0B447F8192E34F7B2A`。
- MPP `<workspace>/build/longpress-dispatch-fix.mpp` SHA256 `67E0C5706D1CBD97AFF4715F9AE3F3B6ABB8423D185F374C73B97E52E718CFA7`。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- 同APKをemulator-5554にも署名照合更新成功。内部callback直接呼出しではなく、実タッチ長押し（ADB input swipe同座標900ms）から画像一覧へ移動・戻るを2回確認。dismiss-enter→exit完走、showing=false／attached=false。戻った本文スクロール、透明窓なし、PID8058新規crashなし、lastanrなし。入口を開く準備のみFridaを使用し、修正版のdismiss／遷移はFridaで置換していない。
- 実機で同じ長押し操作の再検証は未実施。実機認証・投稿なし。公開・pushは行っていない。

## 2026-10-22 01:24 JST XIG05へ242を別アプリで導入

- ユーザーの実機導入指示により、XIG05（730eae72）へ新規パッケージとしてinstall成功。既存版を置換・削除していない。ログbuild/xig05-dialog-reattach-guard242-install.txt、pm pathで導入確認。
- 表示名「Haiagaru 復帰修正 242」、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。
- APK `<workspace>/build/dialog-reattach-guard242.apk` SHA256 `C8129EBA71A653E704095C228C0AEFCEEA6097ACF6093FCDC6AC032C4173C1A8`。
- MPP `<workspace>/build/dialog-reattach-guard.mpp` SHA256 `FF90074B6B4A5D60E8148519039FE2105E146A1C45757B750236075C8405205C`。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。パスワードは記録しない。
- 同じAPKをemulator-5554の同パッケージへ署名照合install -r成功（build/dialog-reattach-guard242-install.txt）。この候補は終了済みダイアログの再attach防止と設定画面のシステムバー配色を追加したもの。実機での起動・認証・投稿、最新候補のダイアログ反復検証は未実施。
- 別アプリなので既存版のCookie・忍法帖・SessionIDは自動移行しない。既存IDを使う場合は認証・投稿前のバックアップ復元が必要とユーザーへ案内。アプリ間のCookie複製、ログイン、認証や投稿は実施していない。

## 2026-10-22 検索密度・認証セッション候補（未公開）

- 後続の最終候補242もemulator-5554へ署名照合install -r Success（build/compact-session-verified242-install.txt）。表示名・パッケージ・署名鍵は下記と同一。
- 最新APK `<workspace>/build/compact-session-verified242.apk` SHA256 `F9A25E631421CAF6A290D302C75435E3E264D7E3C3F01E54F65AA7505D08BEDF`、MPP `<workspace>/build/compact-session-verified.mpp` SHA256 `FA5C02FEBE0789C1B413EE798EB7C6FD4BCBA30D925A67B224AECE34C3DA37D8`。
- 最新候補で表示12・ID保護5・認証前seed1成功（build/compact-verified-model-tests242.txt）。フィルター画像長押し→ImageListActivity→戻るを2回確認し、閉じたフィルターはisShowing=false／attached=false。最後にResListActivityへ戻り本文スクロール成立、993xwrapの透明窓なし。PID6434のcrash buffer空。特定のカスタムジェスチャー割当・別のフルスクリーン画像Activity・実サイトCAPTCHA完了は未確認。
- 同一MPPの191／226 APK生成・本体タブフック検査は成功。191/226はこの最新候補の導入未実施。共通の表示・認証処理の重複端末検証はユーザーの省略可指示に従い242を優先。
- ユーザーの「修正版242を開いて」に従い、2026-10-22に上記242のタスクを前面化し、ResListActivityを確認。

- emulator-5554、Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。署名照合install -r Success（build/compact-session-final242-install.txt）、設定・履歴保持。
- APK `<workspace>/build/compact-session-final242.apk` SHA256 `53788C8568FA871C4BA198AB9C2217258683363CE89A77BA5E85AFDE8B8F5A5D`。
- MPP `<workspace>/build/compact-session-final.mpp` SHA256 `AB975B8AFF6CA6F6978E1C9BB88852C1CA4CBDE213AD0504DECA4C7C5EF74E02`。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。パスワードは記録しない。
- この候補で表示モデル12、ダミーCookieのID保護5、認証前seedの実コールバック成功。透明ウィンドウは別途再発しており未解決。最新の余白連続調整・結果行専用描画・dismiss時の入力遮断解除は後続compact-session-verified候補で確認する。
- XIG05（730eae72）は認証例の画面読取のみ。今回の実機更新・認証操作・投稿・Cookie削除は行っていない。

## 2026-10-21 GIF映像面・native lifecycle候補（未公開）

- emulator-5554、Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。署名照合install -r Success（build/gif-surface-native-lifecycle242-install.txt）、データ保持。
- APK `<workspace>/build/gif-surface-native-lifecycle242.apk` SHA256 `9053A7B680E25F66FFD262F3F6ECB42A8E10DB4A6A9DA50530D6320FBAD2D0C7`。
- MPP `<workspace>/build/gif-surface-native-lifecycle.mpp` SHA256 `DBDD48C7C325D74FBC18727A54860A297C2FF14D0BB0F25992038D317C18AB0D`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 起動PID24761。実GIF再生は検証結果待ち、191画面離脱は未確認。エッヂ横線UIはこの候補には未収録。

## 2026-10-21 カードwarm・GIF最初のfallback候補（未公開）

- emulator-5554、Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。InstallVerifiedApk.ps1で証明書照合・install -r Success（build/anchor-card-gif-final242-install.txt）。データ消去なし。
- APK `<workspace>/build/anchor-card-gif-final242.apk` SHA256 `CC10BDDF89BA1517C8CB388D31E9BCDF46F6A0C468A5FB895479EF15E33A47BA`。
- MPP `<workspace>/build/anchor-card-gif-final.mpp` SHA256 `AF9856A4A37068A11B1A06144CC445BAD390F881E7A2CB0A13CC1A36EDC5F724`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- PID24013でカードwarm5項目成功。GIF実再生失敗。TextureView化・再試行制限・191 lifecycle修正は本APKには未収録。旧PID23456は同時期のFrida-agent SIGSEGVログがあり、通常操作の安定性とは区別。

## 2026-10-21 アンカー表示補助のフレーム分割候補（未公開）

- emulator-5554、Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。InstallVerifiedApk.ps1の署名照合・install -r Success（build/anchor-layout-budget242-install.txt）。データ保持、アンインストールなし。
- APK `<workspace>/build/anchor-layout-budget242.apk` SHA256 `46A0767B881C0B6C2D7A19DFFFFAA4677E70F15CF690CF24E913D834FAC71980`。
- MPP `<workspace>/build/anchor-layout-budget.mpp` SHA256 `ABD187CBFF5A4EFE5017E72C132703FAB28935C196500F8EFAFD6B4DB5D46782`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- fixture7項目成功、試験View除去。実アンカー遅延の改善比較は未確認。最新カードwarm／Media3 fallbackは未収録。

## 2026-10-21 新しいタブ入口・画面個別設定候補（未公開）

- emulator-5554、Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。InstallVerifiedApk.ps1の署名照合・install -r Success（`build/native-new-tab242-install.txt`）。アンインストール・データ消去なし。
- APK `<workspace>/build/native-new-tab242.apk`、SHA256 `5A378B37CEBA4CCAD78B4B23518985F825D5A18CFD747016F7FB08965923520D`。
- MPP `<workspace>/build/native-new-tab.mpp`、SHA256 `8DC5C933F9CDA5AD98D27D2942B6D7606606EF807DC9D47D77BE37A168772907`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 同MPPで生成した191（Haiagaru191 設定検証、`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`）候補 `<workspace>/build/native-new-tab191.apk`、SHA256 `04C3DDBF1D8BB6293405266AC1819D227D83F8D0CC79BA352017A1C039FADB70`。同鍵・生成検査のみ、今回追加分は未導入。
- 226（Haiagaru 復帰修正 226、`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`）候補 `<workspace>/build/native-new-tab226.apk`、SHA256 `AC47FE39FEFD58DD95F48CAD1AFF108A0F90734D5C06852565E30614BD23A544`。同鍵・生成検査のみ、今回追加分は未導入。
- 242実画面8項目成功、詳細docs/native-tool-tabs.md。191 ANRとGIF再生未解決のため未公開。

## 2026-10-21 本体タブ旧版確認・191接続先修正（未公開）

- 191/226の前節native-tool-tabs候補をそれぞれ同じパッケージ・同証明書へInstallVerifiedApk.ps1でinstall -r Success。設定・データを保持。226の実表示と切替11項目成功。
- 191はON時の入口照合不一致を発見したため修正し、再度同署名更新成功（`build/native-tool-tabs-legacy-fix191-install.txt`）。Haiagaru191 設定検証、ChMate 0.8.10.191 dev、emulator-5554、`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。
- 修正版APK `<workspace>/build/native-tool-tabs-legacy-fix191.apk`、SHA256 `AB2CD7ED3FB09124B9F563D7E03316B911285ABE3DEC190CEA8EC6E7E5D46B1D`。
- MPP `<workspace>/build/native-tool-tabs-legacy-fix.mpp`、SHA256 `03CE527DF2AFE1C2FD0E58F71F9D3BB66FB3C0F09E95225BA895D4E4E85AD6CC`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 修正後191の実表示・スイッチ切替11項目成功。試験設定は復元、開いた追加画面タブは保持している。新しいタブ入口／画面個別選択・保存レス名称変更はこの候補には未収録。

## 2026-10-21 本体タブ統合候補（未公開）

- emulator-5554、Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。InstallVerifiedApk.ps1で既存証明書照合後install -r Success（`build/native-tool-tabs242-install.txt`）。アンインストール・データ消去なし。
- APK `<workspace>/build/native-tool-tabs242.apk`、SHA256 `119839F0BDF92A67A82AFBFE6CC3B59CB97B696CD1290EC00335C89338DFD66B`。
- MPP `<workspace>/build/native-tool-tabs.mpp`、SHA256 `FE1C5CDF1A8C6A12EAD9D02FF54636F752A64315F507B085DB2E9586E4C7C3B2`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 同MPPの191候補 `<workspace>/build/native-tool-tabs191.apk`、SHA256 `51E95AF7DC34157E9D80387B6850F1C369F0FE33AEE51B6D33551E8BED9BEE14`、package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`、同署名。生成・フック検査済み、今回候補は未導入。
- 同MPPの226候補 `<workspace>/build/native-tool-tabs226.apk`、SHA256 `C66EBBA78A30C6D360A29F8B9A54A20E8FBF985B71894B32A82DB313FFED8C79`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix226`、同署名。生成・フック検査済み、今回候補は未導入。
- 242の本体タブ統合とオン／オフの実プロセス16項目成功。詳細docs/native-tool-tabs.md。

追補: 下記theme-management226のインストールは`build/theme-management226-install.txt`のSuccessを確認済み。191/226のnative型DAT除外試験もそれぞれ56／55項目成功。中断時点の未確認記述を本追補で更新する。

## 2026-10-21 自作テーマ管理・旧版への共通修正候補（未公開）

- MPP `<workspace>/build/theme-management.mpp`、SHA256 `740CE67809F80FB5CE47138C04D8C15041D86B92A9A3F7B323B1DE83B8E6E6CE`。テーマ一覧／確認付きファイル単位削除と、今回までの共通修正を含む。GIF再生・本体タブ統合の完了版ではない。
- emulator-5554、Haiagaru191 設定検証、`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`：InstallVerifiedApk.ps1の証明書照合・install -r Successをログで確認。APK `<workspace>/build/theme-management191.apk`、SHA256 `1B6120410FD53CA103B58A41D7D767C5049FC717BE0988A484068BE6EF027EF7`。今回候補の実画面とnative型DAT fixtureは未確認。
- emulator-5554、Haiagaru 復帰修正 226、`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`：APK生成成功・既存証明書照合成功、インストールの最終Successは中断時点で未確認。ログ`build/theme-management226-install.txt`を再確認してから導入済みと扱う。APK `<workspace>/build/theme-management226.apk`、SHA256 `8B034C26DF73F855E84632A303AA29BA0D7E51966C0B32BD556E9E081D1D1377`。
- 両版の署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。アンインストール・データ消去は実施していない。

## 2026-10-21 19時台 HOME履歴・レスメニュー・GIF候補（未公開）

- emulator-5554、Haiagaru 復帰修正 242、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。InstallVerifiedApk.ps1で既存証明書を照合しinstall -r成功。データ消去・アンインストールなし。
- APK `<workspace>/build/history-menu-gif-ui242.apk`、SHA256 `784F69BFB150311AB2BEF961EDA4E0322B4E987E51B79155BCCE9160D9A7478F`。
- MPP `<workspace>/build/history-menu-gif-ui.mpp`、SHA256 `16B5920A3721F86D7965DF10CC9BE3BB27DA1ADF95326127869B783DE7F3C569`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 242 native型HOME履歴・対象レス・追加ツール・公開GIFメタデータのfixture成功。内部GIF再生はMediaPlayerエラーのため失敗。本体タブ統合は未実装。詳細`docs/history-menu-gif-tablet-20261021.md`。
- その後の226見出し判定1行修正を含むビルドは成功したが、このAPKへの再適用はしていない。191/226には今回候補を導入していない。

## 2026-10-21 18時台 最終NG・フィルター候補（未公開）

- emulator-5554。3版ともInstallVerifiedApk.ps1で既存APK証明書を照合しinstall -r成功。アンインストール・データ消去なし。
- MPP <workspace>/build/ng-filter-verified.mpp、SHA256 64C044216ADE619626A14E3165B7CC625C995E0948EF1CE6AC9D17FE80F2C37D。
- 191 dev: Haiagaru191 設定検証、jp.co.airfront.android.a2chMate.haiagaru.settingsfix191、APK <workspace>/build/ng-filter-verified191.apk、SHA256 CCE8F5BA97CB62421BA55EF9A351D58F36503A241F1801357DDA2E6BD611E938。
- 226 dev: Haiagaru 復帰修正 226、jp.co.airfront.android.a2chMate.haiagaru.resumefix226、APK <workspace>/build/ng-filter-verified226.apk、SHA256 04B78E2C9B1B0B0260D1F44323037647EE8AB41DB11765DCCDFD940904FA51C0。
- 242 dev: Haiagaru 復帰修正 242、jp.co.airfront.android.a2chMate.haiagaru.resumefix242、APK <workspace>/build/ng-filter-verified242.apk、SHA256 9451940F9578A19C3DB1AF159B5507D77461088AC9CC5B39CC0FD3C41F6367E8。
- 共通署名鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- 191 PID20399で新規WebView ANRがあり公開保留。検証・診断コードの失敗と修復を含む記録はdocs/ng-filter-settings-20261021.md。

## 2026-10-21 16時台〜17時台 ワッチョイNG・フィルター候補（未公開）

- ADB対象emulator-5554。以下3版はInstallVerifiedApk.ps1で既存署名を照合しinstall -r成功。データ消去なし。
- MPP <workspace>/build/ng-filter-final.mpp、SHA256 F16D16EAEF20DBE681F17BE4F2F83A5A0CC596C6BA51099F6762D6ABA5F462A5。
- 191 dev: Haiagaru191 設定検証、jp.co.airfront.android.a2chMate.haiagaru.settingsfix191、APK <workspace>/build/ng-filter-final191.apk、SHA256 143F4774229931A9B234F29097C9A6493D94BF6D03C774308FB3874102661385。
- 226 dev: Haiagaru 復帰修正 226、jp.co.airfront.android.a2chMate.haiagaru.resumefix226、APK <workspace>/build/ng-filter-final226.apk、SHA256 EF990E695C148528190B6E74759D5612A793B41ACD3FB3F5CC4E4FB06F2672E9。
- 242 dev: Haiagaru 復帰修正 242、jp.co.airfront.android.a2chMate.haiagaru.resumefix242、APK <workspace>/build/ng-filter-final242.apk、SHA256 EF81A6B6BCEF5C80B21CEE51E0AF7BB8D06AA275BADB56D1E31B9F124D8CA067。
- 署名鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- 確認範囲・未確認項目はdocs/ng-filter-settings-20261021.md。公開・バージョン更新なし。

## 2026-10-21 191待機ANR対策候補（未公開）

- emulator-5554、表示名Haiagaru191 設定検証、jp.co.airfront.android.a2chMate.haiagaru.settingsfix191。同署名install -r成功、データ消去なし。
- APK <workspace>/build/anr-date-cache-final191.apk、SHA256 A57A2CD916213CC5A45DD2445A32458C26090E0F51D83F4554D7FDCC32A46E68。
- MPP <workspace>/build/anr-date-cache-final.mpp、SHA256 C04A8EB21C41416043F01EDF9C18F6F4B7E673BD4302560C18D44C10FFF7EE2B。
- 署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。照合結果build/anr-date-cache-final191-install.log。確認範囲docs/native-draw-date-anr.md。

## 2026-10-21 設定・履歴再開・NG対象板の最終候補（未公開）

- ADB対象は全て emulator-5554（API36 x86_64）。191の旧archivemenu191は証明書85e29bfe...で不一致のため更新拒否、削除せず保持。ユーザーの別パッケージ方針に従いsettingsfix191を新規導入。その後以下3版を署名照合付きinstall -rで更新成功。データ消去なし。
- 共通MPP絶対パス <workspace>/build/settings-accessibility-final.mpp、SHA256 22AB2F5920C648ABF19439D3B3D2CFA3417281A1225217A80BD2362441CF1236。
- 191: 表示名Haiagaru191 設定検証、jp.co.airfront.android.a2chMate.haiagaru.settingsfix191、APK <workspace>/build/settings-accessibility191.apk、SHA256 578870B3190204D4706B4CB0F7FF5667B29E6042D51F7C5471D6B262FBDC9F73。
- 226: 表示名Haiagaru 復帰修正 226、jp.co.airfront.android.a2chMate.haiagaru.resumefix226、APK <workspace>/build/settings-accessibility226.apk、SHA256 E52B807F7B7E076F895CFA94C82B27191EE696125021118ECD6D958BF8014FC6。
- 242: 表示名Haiagaru 復帰修正 242、jp.co.airfront.android.a2chMate.haiagaru.resumefix242、APK <workspace>/build/settings-accessibility242.apk、SHA256 DE7BCD7C924603F68D6B3ED5263A1E22D1B8B7E6095734E83B74FEDE76248B1D。
- 共通署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。実APKの照合・Success・hashはbuild/settings-accessibility{191,226,242}-install.log。導入時刻は2026-10-21 JST、191約09:10、226/242約09:11〜09:14。
- 191/226/242設定・NG対象板操作等は確認済み。診断用フック中のART SIGSEGVを記録、フックなしの公開スレ／画像表示は実行環境制限でユーザー操作待ち。公開済みとは扱わない。

## VPN用ZIP・Image NG用ZIP同時指定191（2026-10-20、生成のみ）

- APK `<workspace>/build/optional-vpn-zip191.apk`。ChMate191、表示名Haiagaru 191 フル版、パッケージ `jp.co.airfront.android.a2chMate.haiagaru.full191`。SHA256 `694333243CCF29529B5DE9902557AF000EF66727C2FAEB70CF352A0B4ADD09F6`。
- MPP `<workspace>/build/optional-vpn-zip-verified.mpp`、SHA256 `891A764868A7C6C3CBBAFE02ABC58F89F76E2533D3C78DE68BA15F5CF2DFC33A`。
- CLI共通署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`（BKS、alias Morphe、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`）。7パッチ適用・再構築・署名成功。
- APK内の両4 ABIライブラリとVPN導入マーカー、元レス描画保持検査成功。実機730eae72は切断。emulator-5554への導入・URL起動を含むコマンドは実行環境が拒否し、今回の新規インストールは未実施。

## エッヂ検索スクロール最終修正版226（2026-10-20 14:07 JST）

- API36 x86_64 / emulator-5554。表示名 Haiagaru 復帰修正 226、ChMate 0.8.10.226 dev、パッケージ `jp.co.airfront.android.a2chMate.haiagaru.resumefix226`。`adb install -r`成功、既存データの削除なし。
- APK: `<workspace>/build/eddi-scroll-final226.apk`。SHA256 `92B693AA4D6B557D74194B6B928BBADE2943C2DD9205E70784EDF314965E4DA5`。
- MPP: `<workspace>/build/eddi-scroll-final.mpp`。SHA256 `57AF2E943F434FCE3FE4505E5FF60FBEE0C5B30E7D11C52036F4A87EB46E5E3B`。
- 共通署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、BKS、alias `Morphe`。同署名更新成功。証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 最終版226で検索画面の縦スワイプと横画面結果欄を確認。前段版で50行目・詳細条件・スレを開いて戻る位置保持、658の画像表示を確認。実機への導入なし。

## 同じ最終MPPによる242追加検証（2026-10-20 JST）

- 端末 `emulator-5554`、パッケージ `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名 Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev。
- APK絶対パス `<workspace>/build/crash-filter-immediate242.apk`、SHA-256 `4F6CEF523ED609A9FBF058E08DC029FF3D92D4242E0F1E19240BBAD49BDC43E6`。
- 入力MPP `<workspace>/build/crash-filter-immediate-final.mpp`、SHA-256 `C48D7EA3D9960820BAB00C5BD449CB13701E18D6563A78D823352C2089AEFCA5`。
- 鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、BKS、エイリアス Morphe、証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。既存同署名へ上書き成功。
- 実操作で指定Haiagaru Part2スレ本文、3レスの画像サムネイル取得・画像ビューア表示、フィルターダイアログ内のチェックオン／オフを確認。復帰処理の元命令保持検査成功、最終crash buffer 0 bytes。フィルター解除済み。公開・実機導入なし。

## 1.11.0クラッシュ・フィルター即時反映の最終検証版（2026-10-20 JST）

- 対象: `emulator-5554` API36 x86_64。191/226とも既存検証パッケージへ `adb install -r` 成功。
- 固定MPP絶対パス: `<workspace>/build/crash-filter-immediate-final.mpp`。
- MPP SHA-256: `C48D7EA3D9960820BAB00C5BD449CB13701E18D6563A78D823352C2089AEFCA5`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、BKS、エイリアス `Morphe`。既存同署名への更新成功。証明書SHA-256は既存検証版と同じ `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 191: `jp.co.airfront.android.a2chMate.haiagaru.full191` / Haiagaru 191 フル版。APK絶対パス `<workspace>/build/crash-filter-immediate191.apk`、SHA-256 `3A397E0FCA39233EA5FEA7C912BEFE9F1F5950595A6D2404DB3FB88D38923504`。
- 226: `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / Haiagaru 復帰修正 226。APK絶対パス `<workspace>/build/crash-filter-immediate226.apk`、SHA-256 `609F966F27FE324F52758219CB476BCDF84AB19B7FD7021DCA1EA1A0A194296C`。
- 同じ修正系列で191の指定公開スレ本文表示、226の画像サムネイルから標準画像ビューア起動を確認。最終226でフィルターを閉じずにチェックのオフ→オンを確認。最終2 APKの元レス描画保持検査に合格し、最終検証後のcrash bufferは0 bytes。
- 検証時の画像フィルターは最後に解除。実機導入・公開は未実施。内部バージョン表記は1.11.0のまま。

他チャットは導入前にこの台帳と実APKを照合する。秘密鍵・パスワードは記載しない。開発版は別パッケージへの導入を標準とする。

## 既存191版の照合（2026-10-20）

- 端末: XIG05 / `730eae72`
- パッケージ: `jp.co.airfront.android.a2chMate.haiagaru`
- ChMate: `0.8.10.191 dev` / versionCode `2100000000`
- 署名証明書SHA-256: `bc78368b1426256afede71c43e87582e1481a56fe2ee45021d2ccc0fe9b6e7d5`
- 使用鍵: 未照合。`build/morphe-data-xig05/imported.keystore` は候補であり、一致は未確認。
- 保存APK: `<workspace>/build/xig05-installed-191-before-update.apk`
- APK SHA-256: `E0958D0E1D54C0E80240F8DEF784AD8CFDCC8B78D53E96B3055761F567BEF3B8`
- 元APKは端末から取得。署名証明書は `apksigner verify --min-sdk-version 24 --print-certs` で照合。今回このパッケージは更新していない。

## 最新191フル版（2026-10-20 導入成功）

- パッケージ: `jp.co.airfront.android.a2chMate.haiagaru.full191`
- 表示名: Haiagaru 191 フル版
- 対象端末: XIG05 / `730eae72`
- 署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`
- エイリアス: `Morphe`
- 署名形式: BKS。BCプロバイダーを指定したkeytoolで上記鍵の証明書とAPKの一致を確認済み。
- 署名証明書SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
- APK: `<workspace>/build/latest-full191-separate.apk`
- APK SHA-256: `d1e3ab42f45d130bbc6c17da4e2a661e74fbb0ff160d3a6855b39276df017794`（58,188,230 bytes）
- 使用MPPの固定保存先: `<workspace>/build/latest-full191-installed-input.mpp`（ビルド出力からコピー。再ビルドによる上書きを避けて保持）
- MPP SHA-256: `af1753a667cae3a86f45ce4f9be680821d0b18ba257a62c5cb640210755c7c3b`（5,477,981 bytes）。公開済み1.10.0-dev.2とは内容が異なるローカル開発ビルド。
- 結果: 7パッチ適用・再構築・署名成功。XIG05 `730eae72`へ `adb install -r` 成功。起動後に同パッケージのHomeActivityがforegroundとなることを確認。
- APK内のSiteCards／SiteCardMetadata／GifViewerActivity、絵文字フォント、4 ABIのVPNとTFLiteライブラリを確認。サイトカード表示・タブ切替・全機能の実機操作は未確認。
- オプション: MEGA、Imgur、動画・GIF、VPN、絵文字フォント、191画像判定修正。汎用サイトカードは本体拡張に同梱。

## レビュー修正3件を含む191フル版（2026-10-20 生成済み・導入待ち）

- パッケージ・表示名・鍵・エイリアス・証明書SHA-256は上記full191と同一。鍵をCLIの `--keystore` で明示し、証明書一致を照合済み。
- APK: `<workspace>/build/release-full191.apk`
- APK SHA-256: `532d3dfe48663cc384cd98221367c63990a844aba41b927c8df77cf316f3088a`（58,188,230 bytes）
- 使用MPP固定保存先: `<workspace>/build/release-full191-input.mpp`
- MPP SHA-256: `2eeb7792c92c59bfc589309d30494e8d6cbc28c87a1cb52d28b933acf31e7d93`。dev.3公開元52c0f2eのローカルビルドで、CI生成物のバイト列とは異なる。
- 結果: 全7パッチ適用・再構築・署名成功。追加修正はZZZSearchの画面更新、小数キーボード、動画サムネイル生成設定の復元。XIG05が切断されたため、このAPKの実機更新は未実施。実機導入済みは上記の `latest-full191-separate.apk`。

## 復帰時クラッシュ修正版のエミュレータ導入（2026-10-20 JST、全て成功）

- 端末: API36 x86_64エミュレータ / `emulator-5554`。実機への導入は実施していない。
- 共通MPP: `<workspace>/build/resume-crash-verified-candidate.mpp`
- MPP SHA-256: `ABC2A8DF3D18B80487E430984192263AFFA4938C2EE8C2B61BB4718AF19F3A4B`
- 共通署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、BKS、エイリアス `Morphe`。
- 証明書SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。191生成APKをapksignerで照合し、同じCLI署名設定で3版を生成。

| ChMate | パッケージ／表示名 | APK（主開発フォルダからの相対パス） | APK SHA-256 |
| --- | --- | --- | --- |
| 191 dev | `jp.co.airfront.android.a2chMate.haiagaru.full191` / Haiagaru 191 フル版 | `build/resume-verified191.apk` | `10DAF29866DE3BA1EAAC511683BB7A157F1EB3D4C0966BCE9D2FEFCA31E2E210` |
| 226 dev | `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / Haiagaru 復帰修正 226 | `build/resume-verified226.apk` | `33B264719E1C231F822587B2FC131F829892E824A463CE014EB5C22058B91463` |
| 242 dev | `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / Haiagaru 復帰修正 242 | `build/resume-verified242.apk` | `E5078E6BA9F73AF575832764E9C9E58DD1D78E7B417782EB714F38C2D013CFC7` |

絶対APKパスの共通先頭は `<workspace>/`。既存の標準パッケージは変更せず、191はエミュレータ上の同署名full191を更新、226／242は新しい検証用パッケージへ導入。各プロセスで復帰判定9項目に合格し、新しいクラッシュ記録なし。端末の全UI・通信経路の通し確認は含まない。

## 高度なNG API v2最終候補のエミュレータ導入（2026-10-20 JST）

- 端末: API36 x86_64 / emulator-5554。3版とも同署名の既存検証パッケージへ adb install -r 成功。
- 使用MPP: <workspace>/build/advanced-ng-v2-verified.mpp
- MPP SHA-256: 0E0CA6D419345D393FD59499F6945B8F6C5FD00037BE6280AC3DCE6B14FFDA92
- 署名鍵: C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore（BKS）、エイリアス Morphe。既存の同署名検証APKの更新に成功。
- 証明書SHA-256: 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed

| ChMate | パッケージ／表示名 | APK絶対パス | APK SHA-256 |
| --- | --- | --- | --- |
| 191 dev | jp.co.airfront.android.a2chMate.haiagaru.full191 / Haiagaru 191 フル版 | <workspace>/build/advanced-ng-v2-191.apk | C6DF18C56439ADD5B18D4DBFD137C0F1D29B7C63A3EFF74B85B245877B9E20B4 |
| 226 dev | jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / Haiagaru 復帰修正 226 | <workspace>/build/advanced-ng-v2-226.apk | 940E597C85B6253CB3F86F646C9076FFC6159DFD688D1004BCDF098074D5580B |
| 242 dev | jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / Haiagaru 復帰修正 242 | <workspace>/build/advanced-ng-v2-242.apk | 7F39443BCF6BFAB41A17D4D710AEC52E1EF8277F32B607AB7D0801AEA3F41D13 |

高度なNG実コントローラーは191=22、226=22、242=15項目に合格。ZZZSearch／設定9項目に合格。実機更新と指定公開スレの通し確認は未実施。

## 1.11.0クラッシュ修正版の生成・エミュレータ導入（2026-10-20）

- 対象: API36 x86_64 / `emulator-5554`。既存検証パッケージへ `adb install -r` 成功。既存データは消去していない。共有エミュレータの191/226は並行検証でも更新されるため、次回は台帳だけでなく実APKのハッシュを再照合する。
- 共通鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`（BKS、エイリアス `Morphe`）。242をapksignerで照合した証明書SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。3版とも同じCLI署名設定。
- 以下のAPK絶対パスの先頭は `<workspace>/`。

| ChMate / 表示名 | パッケージ | APK / SHA-256 | 入力MPP |
| --- | --- | --- | --- |
| 191 dev / Haiagaru 191 フル版 | `jp.co.airfront.android.a2chMate.haiagaru.full191` | `build/crash-hotfix-191.apk` / `07D43E4EE4C00692DA81DFE6DA3FFF890B7CD3CC50C0410F1528F83058B9E30C` | `build/crash-hotfix-verified.mpp` |
| 226 dev / Haiagaru 復帰修正 226 | `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` | `build/crash-hotfix-226.apk` / `81B462A2B525D1CC8054C16A252BE5610C564B902531786F1601C7BED4B48708` | `build/crash-hotfix-final.mpp` |
| 242 dev / Haiagaru 復帰修正 242 | `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` | `build/crash-hotfix-242.apk` / `B0E92AA706563DF4E892F50CD293D5C5B87F67833F184FE17AABD23B157B09F4` | `build/crash-hotfix-verified.mpp` |

- `build/crash-hotfix-verified.mpp` SHA-256: `F33D900A064EDB6F3E180678596637EECB42B4DE28A626468164F2AFCD10E871`。
- 最終統合MPP `build/crash-hotfix-final.mpp` SHA-256: `0373C18C620AEF08AC2EF1C51C45C2DA966F8BAD023E6F1589BB3D1016B9D36D`。前者との差は226用のネイティブ描画メソッド判定を追加したパッチ生成側の変更。191/242の生成経路の動作は同一。
- 242は修正前APKで提供ログと同じ `o.zzaW.c` / `0x101` VerifyErrorを再現し、修正版は実メソッドの検証・実行に成功。詳細は `hotfix-1.11.0-242-restore.md`。実機導入とユーザーのバックアップZIPによる復元通し確認、公開は未実施。
- 追加確認: 上記と同じ226/242 APKを `emulator-5556`（API36、`Haiagaru_Test_API36_16GiB` のread-only起動）にも導入成功。242の公開スレ本文表示と実フィルターダイアログのチェック即時反映を確認し、新規crash bufferは0 bytes。このAVDは一時検証用で、終了時に導入状態を保存しない。常設の検証先は引き続きemulator-5554。

## 2026-10-20 投稿検索・フィルター改善候補226（未公開）

- 対象: `emulator-5554`、API36 x86_64。実機は更新していない。
- 表示名: `Haiagaru 復帰修正 226`、ChMate `0.8.10.226 dev`、パッケージ `jp.co.airfront.android.a2chMate.haiagaru.resumefix226`。
- APK: `<workspace>/build/search-filter226.apk`。
- APK SHA-256: `CF30CAF3B44F7771729F6835803023C22239BE32E365160FCC46803C93743EF4`。
- 固定MPP: `<workspace>/build/search-filter-candidate.mpp`。
- MPP SHA-256: `228ED68056452ADF0F487AA639F6718B9A06E3A22D6A1E72C8CD5B332ABBD3BC`。
- 署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、エイリアス `Morphe`。
- 証明書 SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。既存APKを取得して一致を確認した。
- `adb -s emulator-5554 install -r`で成功。アンインストール・データ消去なし。端末のlastUpdateTimeは`2026-10-20 14:16:52`（端末表示）、PC側JST換算で`2026-10-20 23:16:52`。
- パッチ適用・署名ログ: `build/search-filter226-patch.log`。検証範囲・残件: `docs/search-filter-2026-10-20.md`。公開済み1.11.2と同じ版名の開発候補であり、GitHubに公開したものではない。

## 2026-10-21 過去ログ倍率・折りたたみ判定候補226（未公開）

- `emulator-5554`（API36 x86_64）、ChMate `0.8.10.226 dev`、表示名`Haiagaru 復帰修正 226`、パッケージ`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`へ上書き成功。データ消去なし。
- APK絶対パス: `<workspace>/build/archive-scale-fold226.apk`。
- APK SHA-256: `D5DE2462C6A89B4CCFEBCE7CB09642C28B2765D87C754E08B17571E9E24B6FEB`。
- MPP絶対パス: `<workspace>/build/archive-scale-fold-candidate.mpp`。
- MPP SHA-256: `5F7A0619CD29784A1B2038BEE29DB0F3E0BBE5CD994896A19310E2133E1366C1`。
- 署名鍵`C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、エイリアス`Morphe`。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`で既存と一致。
- 端末のlastUpdateTimeは`2026-10-20 15:03:44`（端末表示）、JST換算`2026-10-21 00:03:44`。`adb -s emulator-5554 install -r`のSuccessとHomeActivity起動を確認。検証プロセスPID9565。
- 適用ログ`build/archive-scale-fold226-patch.log`、検証記録`docs/archive-scale-fold-fix.md`。191／242・実機は今回未導入、未公開。
# 2026-10-24 共有NGページ分割候補（242導入済み）

- 対象: emulator-5554 / ChMate242 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`（表示名 Haiagaru 検証 242）。
- APK: `<workspace>/build/shared-ng242.apk`
- APK SHA-256: `64810E24F5AF126D2393DB6263B0B4735D13177AD5BAE4E3F4476C5D4C8D0106`
- MPP: `<workspace>/build/shared-ng-paged.mpp`
- MPP SHA-256: `46936BC50C10EEFE0E0A8646711EC9A103957F0EB58EEE2F8ACD40CD493AEDA8`
- 署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- 証明書SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。既存と一致を確認。
- 11:22時点: InstallVerifiedApkのinstall-r処理中（session 43311）。まだ成功・起動確認済みとは扱わない。データ消去・アンインストールなし。
- 続報: 同じsession 43311がSuccessで正常終了。署名一致・データ保持更新成功。通常launcher起動でPID454、crash buffer最新は既存10-23 08:45:01のFrida履歴のまま。共有NGの端末判定試験は進行中、実サービス通信・公開は未確認。
- Android共有NGの一時条件9項目が成功（build/shared-ng242-android.log）。実スレの報告候補も取得。条件/ONOFFは復元済み、報告やHTTP通信なし。native実非表示・実サービス・191/226は未確認。

## 2026-10-24 共有NG報告キュー競合修正候補

- ChMate242、emulator-5554、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名 Haiagaru 検証 242。
- APK: `<workspace>/build/shared-ng-queue-race242.apk`、SHA-256 `9AB2B23EA8EB1403ABEBFC273A84E79202279265279B1620BB959F34E8038781`。
- MPP: `<workspace>/build/shared-ng-queue-race.mpp`、SHA-256 `D18FE6B5B4E8583F7F76BB2888CF882B4D93264EDB312F977939FDA671BCA516`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。署名証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- InstallVerifiedApkで署名照合後のデータ保持更新を開始。まだ成功/端末検証済みとは扱わない。
- 続報: session 91879がSuccessで終了し更新完了。launcherからTabletHomeActivity起動（PID1441）、crash buffer最新は既存10-23 08:45:01のまま。`build/shared-ng242-queue.log`で報告確認済み除去5項目成功。HTTP/永続キュー変更なし。GAS実通信と画面上の非表示は未確認。

## 2026-10-24 共有NG191候補

- ChMate191、emulator-5554、`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`（表示名は既存の191検証設定を使用）。
- APK: `<workspace>/build/shared-ng191.apk`、SHA-256 `1E3661A2DCED481D5FBA2A30AC09394CC3E2D66FF581C3E8C3380F4266DCAA7F`。
- MPP: `<workspace>/build/shared-ng-queue-race.mpp`、SHA-256 `D18FE6B5B4E8583F7F76BB2888CF882B4D93264EDB312F977939FDA671BCA516`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- session11811で既存署名一致・install-r Success、データ保持更新完了。起動・共有NGの191固有境界確認はこれから。
- launcher起動PID1813、表示名 Haiagaru 検証 191。build/shared-ng191-native.logの実レス境界5項目成功、共有状態を復元して再prepare。crash buffer新規なし。画面非表示・通信は未確認。

## 2026-10-24 共有NG226候補（導入中）

- ChMate226、emulator-5554、`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`（表示名 Haiagaru 検証 226）。
- APK: `<workspace>/build/shared-ng226.apk`、SHA-256 `8E480FD4586D68E8ABF7C0668547356BDBB0018F482725D4DDDE96E3FEDFD4B2`。
- MPP: `<workspace>/build/shared-ng-queue-race.mpp`、SHA-256 `D18FE6B5B4E8583F7F76BB2888CF882B4D93264EDB312F977939FDA671BCA516`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- session30872で既存署名一致を確認、install-r実行中。成功・起動・端末テストはまだ未確認。
- 続報: session30872がSuccessで終了し導入完了。launcher起動PID2196、native境界の検査中。3版の最終APKはVerifyProgrammableNgHooksのバッチprepare/型付きMap置換/引数register検査が成功。画面非表示・GAS通信は未確認。
- build/shared-ng226-native.logで実レスnative境界5項目成功。191と同じ試験でNGWordフラグ追加/元flag保持/OFF復元を確認。crash bufferは既存10-23のまま。画面非表示・GAS通信は引き続き未確認。

## 2026-10-24 接続先変更競合修正242候補（導入中）

- ChMate242 / emulator-5554 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / Haiagaru 検証 242。
- APK: `<workspace>/build/shared-ng-source-race242.apk`、SHA-256 `A01F7A54C51F0526A2F0F1752578445E0D91459EC100D2E8BAE9477EF346FD3C`。
- MPP: `<workspace>/build/shared-ng-source-race.mpp`、SHA-256 `353E382494984FA9AA37148A2EDD49222D1E303DA21A9F49724CB63878B6F1E6`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- session63236で既存署名一致を確認しinstall-r進行中。通常Lint buildはbuild/shared-ng-source-race-build.logで成功（2分17秒）。起動/競合/ページ同期テストは未実施。
- 続報: session63236がSuccessで終了、launcher起動PID2622。build/shared-ng242-source-race.logでA→B→A変更中の古い応答破棄など5項目成功、SOURCE_STATE_RESTORED。初回はFrida Long比較のfixture不備で停止、Number変換後に再成功。ページ同期fixtureを実行中、実サービス通信は未確認。

## 2026-10-24 標準共有NG接続先242候補（導入中）

- ChMate242 / emulator-5554 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / Haiagaru 検証 242。
- APK: `<workspace>/build/shared-ng-default242.apk`、SHA-256 `52F4B8692DC33ABFCCCB9F64317E27EC1D82EBBD5F6F4BBD8DAB765E60C5CAC3`。
- MPP: `<workspace>/build/shared-ng-default.mpp`、SHA-256 `95D4AA6A8AF85C35FD31151E40E7C87C48EC02D13B71583AEA23AAC420B01849`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 通常Lint build成功（2分31秒）。InstallVerifiedApkのsession3945でデータ保持更新中、まだ端末検証済みではない。
- session3945がSuccessで終了、launcher起動確認。build/shared-ng242-default.logで未設定/旧空欄の標準URL解決・独自URL維持・共有NG初期OFFの4項目成功。ENDPOINT_SETTING_RESTOREDを確認、HTTPや報告は送信していない。

## 2026-10-24 共有NG報告ANR/UI修正242候補（導入中）

- ChMate242 / emulator-5554 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / Haiagaru 検証 242。
- APK: `<workspace>/build/shared-ng-report-ui242.apk`、SHA-256 `113CDAD19A33CE5F4359A1BB0D1665EA4AFB8824D73D043D380F35D515660F71`。
- MPP: `<workspace>/build/shared-ng-report-ui.mpp`、SHA-256 `B09BD832EBF3BF6CDDB69100E20EEEE1A7B9BBBB3F6FA78D179457720B8D66D6`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 通常Lint build成功（3分8秒）。session69837で署名一致・データ保持更新中、成功/端末検証は未確認。直前ANR最新は226の2026-10-24 02:43:55。
- session69837はSuccess、launcher起動とVerifyProgrammableNgHooks成功。build/shared-ng242-report-worker.logで6秒遅延した候補作成がoffMain=true、UI呼出し238msで戻り、2回操作でもcalls=1、完了後busy=falseを確認。初回は起動直後focusなしで実行されず、focus確認後再試験成功。HTTP/報告/NG設定変更なし。ANR最新は直前と同じ226履歴。

## 2026-10-24 表示中スレ共有NG候補取得242（導入中）

### 同じMPPの191候補（導入中）

- ChMate191 / emulator-5554 / `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` / Haiagaru 検証 191。
- APK: `<workspace>/build/shared-ng-visible-source191.apk`、SHA-256 `2C6C4E28B5E6958CC08AD11548F8CFC227A148FDC06A60EDC4AA6AC92A564010`。
- MPP: `<workspace>/build/shared-ng-visible-source.mpp`、SHA-256 `4C2B829B8924CFE72760E346A27891659DA836187198D9BB3A7481FEBDDCD923`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- session21932で既存署名一致・データ保持更新中。成功/起動/候補captureは未確認。
- session21932がSuccessで終了し191更新完了。nativeフック検査成功。起動PID4826は確認したが、242のANRダイアログが画面を遮っており新captureは未実施。

### 同じMPPの226候補（導入済み、候補UIは未確認）

- ChMate226 / emulator-5554 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / Haiagaru 検証 226。
- APK: `<workspace>/build/shared-ng-visible-source226.apk`、SHA-256 `FD1A1D1C52A9DF9CAC790BC7AE46FC464EE2FD6ACA9DE9BBF4C7944F79EE65F2`。
- MPP: `<workspace>/build/shared-ng-visible-source.mpp`、SHA-256 `4C2B829B8924CFE72760E346A27891659DA836187198D9BB3A7481FEBDDCD923`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- session91247で既存署名一致・install-r Success。端末lastUpdateTime=2026-10-24 03:51:46。新capture/UI/画面非表示は未確認。

### 242の記録

- ChMate242 / emulator-5554 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / Haiagaru 検証 242。
- APK: `<workspace>/build/shared-ng-visible-source242.apk`、SHA-256 `8100F6A7247B2CDEAB8385B088D46D7B94718978DD6767C4C64AB0CDFBE02253`。
- MPP: `<workspace>/build/shared-ng-visible-source.mpp`、SHA-256 `4C2B829B8924CFE72760E346A27891659DA836187198D9BB3A7481FEBDDCD923`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 通常Lint build成功（3分46秒）。session3200で署名照合/データ保持更新を実行中。導入完了・表示中スレcapture・候補UIはまだ未確認。
- session3200がSuccess、起動PID4138とnativeフック検査成功。build/shared-ng242-visible-source.logでPart3の539件/正しい板URL/独立ArrayListを確認。build/shared-ng242-visible-report.pngで実候補一覧を視認、報告選択/送信なしでBack終了。新ANRなし（最新は226の02:43:55）、crash最新は先行フック試験03:27:22のまま。表示中source取得の191/226はまだ未確認。

## 2026-10-24 タブ見出し縮小候補（XIG05導入済み）

- 対象: Xiaomi XIG05、ADB serial `730eae72`、ChMate `0.8.10.242 dev`、表示名 `Haiagaru 検証 242`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。
- APK: `<workspace>/build/tablet-header-suffix-20261024-242-final.apk`。SHA-256 `B36EFE6FEF33CF4508540DDFD2A688E93CA350DBAF9E558E5526A8EFC2A3C7D2`。
- MPP: `<workspace>/patches/build/libs/patches-1.12.1.mpp`。SHA-256 `E83FAB4BD726F89E1CA4418307DDAF115403ACDE7CA0A046B54846CE8993B4B6`。
- 元APK: `C:/Users/narum/Downloads/chamate/242/chmate-0-8-10-242-dev.apk`。
- 署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。導入前既存APKと候補APK、導入後端末からpullしたAPKの署名一致を確認。
- 2026-10-24 23:29 JST、`adb -s 730eae72 install -r`でデータ保持更新。端末`lastUpdateTime=2026-10-24 23:29:25`。導入後pullしたAPKは候補とSHA-256一致。`TabletHomeActivity`が前面表示。
- 変更: 専用画面タブ見出しと×バーの既定16dp、設定範囲16〜20dp。通常カテゴリと重複する設定をエキスパート画面から除去。
- APK作成初回はJVMのnative memory allocationで失敗。Gradle daemonを停止し、JVM heap/parallelismを抑えて再実行後build成功。画面の見た目の最終スクリーンショット確認は未実施。

## 2026-10-24 23:59 XIG05 チェッカー操作バー調整候補（導入済み）

- Xiaomi XIG05 / serial `730eae72` / ChMate `0.8.10.242 dev` / 表示名 `Haiagaru 検証 242` / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。
- APK: `<workspace>/build/checker-toolbar-drag242.apk`、SHA-256 `CF63BE04F33E74F9EDB1E5A7B97FCD067B159FF07AABA034027423E06589380D`。
- MPP: `<workspace>/build/checker-toolbar-drag.mpp`、SHA-256 `2E580BCDF1DA1B5BCBE5B19084B59B9C0635BE2AEBE4C80D53B536254D250361`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- InstallVerifiedApk.ps1で既存パッケージと署名照合後、install -r Success。端末lastUpdateTime `2026-10-24 23:59:03`。設定・データ保持。
- タブレットのHissi/投稿検索結果の重複見出し・×を非表示にし、更新/URLなどの操作バーに高さ20〜80dpのドラッグつまみを移動。投稿を探すのタイトル18sp、×20sp、閉じる領域64dp幅、タイトル文字も閉じる操作対象。
- 実機の実Hissiページで操作バー20→80→20dpをADB swipeで操作。XMLつまみ位置はy452→632→452px（密度3、操作バー高さ60→240→60px）。アプリforce-stop/再起動後もy452pxで保存を確認。重複見出しなしをスクリーンショットで確認。
- Frida fixtureはattach失敗（remote frida-server closed）で実行されず、成功扱いにしない。投稿を探すのタイトル閉じる実タップ検査は端末が別画面になっており未確認。走査/投稿は実行していない。
- 続報依頼のレス/スレ/名前バーの別高さ、つまみ非表示・固定は、この導入版には未収録。次候補で実装・ビルド中。

## 2026-10-25 追加タブ復帰の黒画面対策候補（生成のみ・未導入）

- 対象ChMate: `0.8.10.242 dev`。出力パッケージ: `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名 `Haiagaru 検証 242`。
- 元APK: `C:/Users/narum/Downloads/chamate/242/chmate-0-8-10-242-dev.apk`。
- 生成APK: `<workspace>/build/tool-return-visibility242.apk`、SHA-256 `51B9406EC93F060247B5AFB85B8E2411D0EFB5C6800FD4E5B06AECA4FA1E4B5E`。
- MPP: `<workspace>/patches/build/libs/patches-1.12.1.mpp`、SHA-256 `0B1721BDAE126B9B3E8613247166BAEFF4273E14B8BBFEADE593A4093F6B84BE`。
- 署名証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵ファイル `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- APK生成・署名確認・242元APKへのパッチ適用は成功。端末serialなし、インストール未実施。XIG05 (`730eae72`) は未接続。ADBに見える `d5497008` はAndroid 11の別端末と確認したため操作していない。実機での復帰・スクリーンショット確認なし。

## 2026-10-25 Mi Note 10 最終候補

ユーザー許可によりMi Note 10（serial `d5497008`）へ別パッケージ `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / Haiagaru 検証242 / ChMate0.8.10.242 devを追加し、以後署名照合install-rで更新。既存アプリの削除・データ消去なし。

最終APK `<workspace>/build/prerelease-final242.apk` SHA256 `0BD6DD822EE771F9C4C3E949E74AFDD427A9FE10D5EBE1533264B9508B48138C`。MPP同root `build/prerelease-final.mpp` SHA256 `8D9DB23E9B75E0539E2B7BDDBA5ED6FDCB0721020A9CD3F6946594732B126DEE`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias Morphe / 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。2026-10-25 07時台JST導入Success（build/minote-prerelease-install.log）。

検索/過去ログ/チェッカー複数タブを作り、Android設定からの復帰、HOME移動後am killでプロセス終了→再起動でフォーム復元を画像確認。Part3本文表示、links付き標準画像ビューアでImgur画像表示を確認。通常Intent dataだけでは画像一覧に渡らず空画面になるので、これは画像表示の成功とは扱わずlinks経路で再確認した。crash bufferに新しいアプリのFATALなし。120Hz性能やXIG05での長時間再発確認、Hissi実走査は未実施。

## 2026-10-25 テンプレート・検索先優先・リンクカード位置対策（導入済み）

- XIG05 serial `730eae72` とMi Note10 serial `d5497008`、表示名Haiagaru 検証242、ChMate0.8.10.242 dev、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。
- APK `<workspace>/build/template-priority-position242.apk` SHA256 `14B02A1E4A4A783D56BB8C620FBD0D4860F45D35B0C509D06A6BD73268AB4106`。
- MPP同root `build/template-priority-position.mpp` SHA256 `FE775076966B4854CBC176864FB7B4701C4E8900D55302BA994B1704E4217A4C`。
- 鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 2026-10-25 JST、両端末ともInstallVerifiedApk.ps1で既存署名照合後install-r Success。既存データ保持、削除なし。ログbuild/template-priority-position242-install.log、build/template-priority-position242-xig05-install.log。通常Lint付きbuild成功4m32s、242元APK適用成功。テンプレート板保存/無効化/検索先優先とカード初期位置補正回避を収録。端末上での症状改善の通し検証は未完了。広告だけプリセット・独立軽量パッチ準備コードもMPPに含むが、導入APKは通常Haiagaruを選択しており独立軽量構成ではない。未公開。

## 2026-10-25 板一覧選択・全文検索先の修正版（導入済み）

- XIG05 `730eae72`、Mi Note10 `d5497008`のChMate0.8.10.242 dev、表示名 `Haiagaru 検証242`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` を更新。
- APK `<workspace>/build/template-board-picker242.apk` SHA256 `545D62F01339CA33BCCBC3A43F32710F35FE2C4720FBDDFDE96288FF59B971F9`。
- MPP `<workspace>/build/template-board-picker.mpp` SHA256 `4CA2D5CED6E6B30126C1DF2E821AA8EC73E9EAC225BD64B4C1C470AA01F180FD`。
- 鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 2026-10-25 JST、両端末ともInstallVerifiedApk.ps1で既存署名一致、データ保持install-r Success。起動PID XIG05=3624、Mi Note10=10366を確認。ログbuild/template-board-picker242-xig05-install.log、build/template-board-picker242-minote-install.log。アンインストール/データ消去なし。
- テンプレートの板一覧取得・検索・複数選択、全文検索先の自動/hissi.org/Kyodemo/両方、外部板を5ch側として扱う修正を収録。端末UIの通し動作確認と公開は未実施。通常Haiagaru構成であり、独立した広告だけ構成の導入ではない。

## 2026-10-25 広告だけ構成の初回検証（未公開）

Mi Note10 serial `d5497008`。以下は既存アプリの削除・データ消去なし。

- ChMate 0.8.10.242 dev / Haiagaru 広告のみ 242 / package `jp.co.airfront.android.a2chMate.haiagaru.adsonly242`。2026-10-25 13時台JST。別パッケージ追加、InstallVerifiedApk.ps1署名検査後Success。初回案内とHome表示、板一覧画面起動。スレ本文・画像の通し確認は未完了。
  APK `<workspace>/build/ads-only-isolated242.apk` SHA256 `3745A97C4B9E04B198B370F4E26348ECAB85CB3DEA5FCAD1D13B8E73A2AE3AA2`。
  MPP `<workspace>/build/ads-only-isolated-review.mpp` SHA256 `034E1FF98866C87CDEDF892301D82E00221552AE1C8C3CCAF2AB9D543048DCA8`。
- ChMate 0.8.10.242 dev / Haiagaru 検証 242 / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。2026-10-25 13時台JST。既存署名一致後install-r Success。TabletHomeActivity起動。広告プリセットの適用/復元11項目合格、検証終了時に元の設定を復元。
  APK `<workspace>/build/ads-only-preset-review242.apk` SHA256 `C8A553583205144A804253935EB188E9B337178770B22E7337610787A935711F`。
  MPP `<workspace>/build/ads-only-final.mpp` SHA256 `0D5F46F7CD17DDD3B5321FD44C1ACA8DF85560F0A2B8A0098CBE5AB9E5FD556C`。
署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。導入ログbuild/ads-only-isolated242-install.log、build/ads-only-preset242-install.log。端末のcrash bufferに新たなアプリFATALなし。性能・長時間利用の確認とは区別する。

広告専用191: Mi Note10 `d5497008`、表示名 `Haiagaru 広告のみ 191`、ChMate0.8.10.191 dev、package `jp.co.airfront.android.a2chMate.haiagaru.adsonly191`。2026-10-25 13時台JST、署名検査後の別パッケージ追加Success、HomeActivity起動後のプロセス生存を確認。本文/画像通し操作は未完了。APK `<workspace>/build/ads-only-isolated191.apk` SHA256 `5F01B3A6D427A0CE06CFF334873ABE501F1DB7B8DC30D8EA1D9375344C26D0F2`、MPP `<workspace>/build/ads-only-final.mpp` SHA256 `0D5F46F7CD17DDD3B5321FD44C1ACA8DF85560F0A2B8A0098CBE5AB9E5FD556C`。署名鍵/alias/証明書は上記と同一。導入ログbuild/ads-only-isolated191-install.log。

広告専用226: Mi Note10 `d5497008`、表示名 `Haiagaru 広告のみ 226`、ChMate0.8.10.226 dev、package `jp.co.airfront.android.a2chMate.haiagaru.adsonly226`。2026-10-25 13時台JST、署名検査後の別パッケージ追加Success、HomeActivity起動後のプロセス生存を確認。本文/画像通し操作は未完了。APK `<workspace>/build/ads-only-isolated226.apk` SHA256 `BF26757C231C46ED97758C4732EC6AC16BDA4569C7CCEAF85CBC72C9D09EAABF`、MPP `<workspace>/build/ads-only-final.mpp` SHA256 `0D5F46F7CD17DDD3B5321FD44C1ACA8DF85560F0A2B8A0098CBE5AB9E5FD556C`。署名鍵/alias/証明書は上記と同一。導入ログbuild/ads-only-isolated226-install.log。

## 2026-10-25 XIG05 外部チェッカーURL連携・バックアップ保持修正

serial `730eae72` / XIG05 / 表示名Haiagaru 検証 242 / ChMate0.8.10.242 dev / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。InstallVerifiedApk.ps1で既存署名一致後install-r Success、データ保持。TabletHomeActivity起動PID12850。

APK `<workspace>/build/checker-handoff-xig05242.apk` SHA256 `55CDB01C62D2A09354C95CC94A04831DBD455F0FE37B97C1C7CE5D10F4B64A77`。MPP `<workspace>/build/checker-handoff-xig05.mpp` SHA256 `DD5E9CA1303554A04DF9A3431A6EC1E7BFA011DCA45D61339A9AEF556F398B2D`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias Morphe / 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。ログbuild/checker-handoff-xig05242-install.log。

エッヂ短縮スレURLのBROWSABLE VIEWがOpenUrlActivity、Hissi/read.phpがHissiMenuActivityへ、このカスタムパッケージで解決することをcmd package resolve-activityで確認。送信側からの通し操作と実保存先のバックアップ削除は未確認。通常構成、広告専用パッチは非選択。未公開。

2026-10-25 追加×の取り消し: ユーザー指示により今回だけのHissiMenuController/ModelUiの未コミット差分を取り消し、XIG05 serial730eae72のresumefix242をbuild/checker-handoff-xig05242.apk（SHA256 55CDB01C62D2A09354C95CC94A04831DBD455F0FE37B97C1C7CE5D10F4B64A77）へ署名一致install-r更新Success。元のMPP build/checker-handoff-xig05.mpp/鍵/aliasは同台帳の直前記録どおり。PID12699起動。今回の新しい×は公開しない。既存の閉じる操作は保持。

## 2026-10-26 00:01〜00:02 JST 認証CSS誤認・共有順修正191

ユーザーの「実機にインストールして」により導入。XIG05/Android15、serial `730eae72`、ChMate0.8.10.191 dev、表示名`Haiagaru 検証 191`、package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。InstallVerifiedApk.ps1で既存APKと署名一致確認後、install-r Success。既存検証版のデータ保持、元の`jp.co.airfront.android.a2chMate.haiagaru`は更新/アンインストール/データ消去していない。

APK `<workspace>/build/auth-css-fixed191.apk` SHA256 `360d80992e93e6d1d0659e5940c55bcba6ad729184547b85ff49c6d8777d2ee6`。MPP `<workspace>/build/auth-css-fixed.mpp` SHA256 `0b6302ec22612ff7213a12b7e25a4f5659fa7bba8b799e889f06c141dd992d42`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

HomeActivityのam start -WはStatus ok、実Activity TabletHomeActivity、PID7461。既存スレ本文表示を`build/auth-css-fixed191-installed.png`で確認。対象PIDのcrash buffer空、後続pidofも7461。ログ`build/auth-css-fixed191-{install,launch,crash}.log`。認証設定画面の実操作・認証完了・投稿/共有送信は未確認。69ルールテスト/通常Lint build/完成APK共有順wrapper保持検査は成功。検証版更新のみ、公開なし。

## 2026-10-25 共有（記憶）並び順候補（APK生成のみ）

未導入・未公開。生成APKをapp_process隔離試験へ渡しただけで既存アプリを更新/起動していない。191完成APK29ケース成功、226は直前nativeメニュー＋変更済み補助クラス29ケース成功、完成APK試験前にd5497008が切断。242隔離試験はKilledで原因未特定。serial d5497008/Mi Note10上の試験はアプリprefs/ネットワーク/共有送信を使用しない。

MPP `<workspace>/build/share-order-fixed.mpp` SHA256 `bbc9ad669d0d95c69ce27ed5b2a0a6b9337c1f552ec8508edbb301b1320cd6bd`。全APK鍵`C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、署名検証成功。APK共通ディレクトリは`<workspace>/build/`。

| ChMate / 表示名 / package | APK絶対パス | SHA256 |
| --- | --- | --- |
| 0.8.10.191 dev / Haiagaru 検証 191 / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 | <workspace>/build/share-order-fixed191.apk | b22754b7ee6b074bceae6dcb0c2fbb4a3eeef714c1daa1c8908a8c29301bf0cb |
| 0.8.10.226 dev / Haiagaru 検証 226 / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 | <workspace>/build/share-order-fixed226.apk | 94b6989d0e5c6b2643607abc9ea8c1c1f64df44a0a34bf423eb7a624eeda07ee |
| 0.8.10.242 dev / Haiagaru 検証 242 / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 | <workspace>/build/share-order-fixed242.apk | 6dd14acd6465573a7259d8823a99d59e5bf757829c3eb24e5293a3dfd3346d11 |

## 2026-10-25 NGWord-ID返信非表示オプション候補（APK生成のみ）

生成日時2026-10-25 23:21〜23:24 JST。端末シリアルなし、実機へ未導入・未起動。端末の既存アプリやデータは変更していません。すべて元APKからの適用/再構築/署名検証成功、公開なし。

MPP `<workspace>/build/poster-hidden-option.mpp` SHA256 `0aee90ccdff9a65561493aa42f71027ddc9554c5550f2ec8e98c76ed2da29f6a`。全APKの鍵は`C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

| ChMate / 表示名 / package | APK絶対パス | APK SHA256 |
| --- | --- | --- |
| 0.8.10.191 dev / Haiagaru 検証 191 / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 | <workspace>/build/poster-hidden-option191.apk | 9636055f219b5a171e1e9438fb13ae4c2bea680d3da1946dddec7437f6f41eca |
| 0.8.10.226 dev / Haiagaru 検証 226 / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 | <workspace>/build/poster-hidden-option226.apk | 5ed75f45dacdf604d11d4a6366c75e61999c41fa82eda8611d8e6de6f6f26365 |
| 0.8.10.242 dev / Haiagaru 検証 242 / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 | <workspace>/build/poster-hidden-option242.apk | f8dd8009d2f9fd0ad51915a26a570ba1e79593e8cec5af1c2e918b5c3ea6e0e2 |

`build/poster-hidden-option{191,226,242}-patch.log`、`build/poster-hidden-final-apks.log`。3完成APKに追加設定/補助クラスとnative透明NGフックを確認、各2箇所の分岐がフックへ到達。端末のNG登録・表示確認は未実施。

## 2026-10-25 XIG05 検索余白・戻る・動画操作候補
serial730eae72 / XIG05 / ChMate0.8.10.242 dev / 表示名Haiagaru 検証 242 / package jp.co.airfront.android.a2chMate.haiagaru.resumefix242。
最終APK <workspace>/build/archive-top-back-final242.apk SHA256 F8FCAACA5CE89AB506B41D52623ABA1724B76012871EA231E2C7A8AB6ECCDB34。MPP <workspace>/build/archive-top-back-final.mpp SHA256 D76C4519B9702076486B8297D6DF2E9E5F55F04C78F75C2BFA75C437049FFAA3。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名一致install-r Success、既存データ保持。導入16:08JST、ログbuild/archive-top-back-final242-install.log。余白除去と1行見出しスクリーンショットbuild/xig05-search-final.png、戻る後の本文表示build/xig05-back-test.xml、PID28641新規crash bufferなし。広告9/初期値7/動画12チェックは同一該当コードの前候補66B0F5D3で実施、今回の変更は検索insets/Activity BACK境界。Samsung Android16報告の広告現象そのものは未再現。

## 2026-10-26 軽量版net→io検証

Mi Note 10 / Android11 / serial d5497008。ChMate0.8.10.191 dev、表示名 Haiagaru 広告のみ 191、package jp.co.airfront.android.a2chMate.haiagaru.adsonly191。2026-10-26 01:19頃JST、既存署名照合後install-r Success、データ保持。HomeActivity→o.m4 cold起動Status ok、PID12955。ローカルViewとURL変換10項目成功。実5ch通信/投稿は試験していない。

APK <workspace>/build/lightweight-io191.apk SHA256 11ED3950188F5A058EB2FB2B0F8B6581B0DE3D0CB7C3232780B10DBF3DD9D2EE。
MPP <workspace>/build/lightweight-io.mpp SHA256 B29AA4EE1AB13F5D0F6DE34CDBF77C310DF83E714AB52F4AFAFDF55AD45E6D0D。
鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。ログ build/lightweight-io191-{patch,install,runtime}.log。軽量runtime31クラスのみ・外部hook参照299の解決と許可集合・ioメニュー既定値を完成APKで確認。226/241/242/243への今回候補適用・実機試験は未実施。公開なし。

## 2026-10-26 投稿確認フォーム再読込修正版

2026-10-26 01:23頃JST、Mi Note 10 / Android11 / serial d5497008 / ChMate0.8.10.191 dev / 表示名Haiagaru 検証 191 / package jp.co.airfront.android.a2chMate.haiagaru.settingsfix191。既存署名一致を確認後install-r Success、データ保持。HomeActivity→o.m4 cold起動Status ok、PID14125。ユーザー指定のkrsw/ridでの投稿検証を継続中、認証・投稿成功として扱わない。

APK <workspace>/build/board-form-reload-final191.apk SHA256 81DF2CF1A5EF296CDAF21182EFABF076474CBE54DA570FA789DDAD55BBF784A8。
MPP <workspace>/build/board-form-reload-final.mpp SHA256 6B68F4B42B4E6DE07F77BA1BF212B9F49F12AFB098310FFD081F75BBDE4B617B。
鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。ログbuild/board-form-reload-final191-{patch,install,launch}.log。通常Lint付きbuild成功3m42s。完成APKで191共有順フックの元delegate/レジスター/分岐保持も成功。元の.haiagaruは置換していない。

先行候補の補記: 2026-10-26 00:56 JST、XIG05/serial730eae72の同じ検証packageへbuild/board-challenge-final191.apk（SHA256 4AE4E97FEDAD3DA0191F34FDE2E57E92B9E4697EA321F3F66094690CDFC122F0）、MPP build/board-challenge-final.mpp（25BB15278776FADE28710B4D898E78D0D53E4D40E5BE0D5A1FEB08158E9138A8）を同じ鍵/alias/証明書で署名一致install-r成功。絶対パスのrootは本項と同じローカル主開発フォルダ。01:09実画面にサイトの「ブラウザ変ですよん」エラー、フォームなしを確認。旧候補にはCookie許可後のGET再読込不備があり、今回修正。認証成功ではない。XIG05から別端末へユーザーが接続変更し、旧端末の今回修正候補導入はしていない。

投稿確認修正版の実機オフラインfixtureは全12チェック成功（build/board-form-reload-fixture.log）。Android11でActivity検出に失敗した試験コードをActivityClientRecord列挙へ変更後、元フォーム再表示/Worker手動実行/未許可POST停止/終了破棄まで成功。実投稿は含まない。指定krswの起動は自動審査blocked by policyで実行されず、実サイトの画面操作/認証/投稿は未完了。

## 2026-10-26 08:36〜08:39 JST 軽量版226/242 io互換の公開前検査

Mi Note10/Android11/serial d5497008。既存package/署名を照合後、両packageへinstall-r Success、データ保持。表示名Haiagaru 広告のみ 226 / 242、package jp.co.airfront.android.a2chMate.haiagaru.adsonly226 / adsonly242、ChMate0.8.10.226 dev / 0.8.10.242 dev。226 Home→StartActivity PID23248、242 HomeActivity PID23987の起動Status ok、各10項目のView/URL変換fixture成功、両PIDの新規crash buffer空。226初回規約へ同意後、データ収集許可は全OFFの画面を確認。実スレを開くADB am startは自動審査blocked by policyでコマンド全体が実行されず、実スレ/画像の通し再検査は未完了。

使用MPP <workspace>/build/board-form-reload-final.mpp SHA256 6B68F4B42B4E6DE07F77BA1BF212B9F49F12AFB098310FFD081F75BBDE4B617B。

- 226 APK <workspace>/build/lightweight-io226.apk SHA256 771BCE063A7903C4882B995CA032B895A8F897E2F033A171350CA522123CAC95。
- 242 APK <workspace>/build/lightweight-io242.apk SHA256 42895FFA8603DC66F7AE2643910B9BB239BB7F0DE875C9C557F220781F05D3C1。

鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。両完成APKで軽量runtime31クラスと許可された参照の解決（226=331/242=267）を確認、通常runtime混入なし。ログbuild/lightweight-io{226,242}-{patch,install,runtime,crash}.log。リモートdev.2のDroid＋変更は通常版のみの3行で、検査した軽量runtime/patchコードと同一。公開準備としてremoteを通常mergeし最終buildを別途実行。

## 2026-10-27 XIG05 Dalvikテンプレート3種・Cookie割当検索の検証版更新

導入記録日時: 2026-10-27 01:13:15 JST。XIG05 / ADB serial `730eae72` / ChMate `0.8.10.242 dev` / 表示名 `Haiagaru 検証 242` / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。既存APKと新APKのパッケージ・証明書一致を確認し、install -r Successでデータ保持更新。HomeActivity cold起動Status ok、PID20622。実機スクリーンショットで既存Part3本文/画像/書き込み下書き画面の表示を確認、当該PIDのcrash buffer空。ユーザーの投稿ボタン操作は行っていない。

- APK: `<workspace>/build/dalvik-three242.apk`
- APK SHA-256: `D6C558773191C9E02146D73FA6D3028010E3EA5A95FE73CC90C6982A34D9D71C`
- MPP: `<workspace>/build/dalvik-three-final.mpp`
- MPP SHA-256: `E4C9604FC59CC01C49B6B28E2A2BB0F9C40F5CFDF9B9B842C8BA6C43C5EE5B2B`
- 署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
- 証明書 SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`

`build/dalvik-three-bundle-build.log`の:patches:buildは成功26s、APKパッチ/署名成功。root buildは軽量版lintDebugの既存NewApiで失敗、追加の通常版lintReleaseも既存箇所を含む168 errors/365 warningsで失敗（build/dalvik-three-install-build.log、dalvik-three-release-build.log）。Lint設定の恒久無効化はしていない。ホスト30項目は成功。実機テンプレートメニューの自動確認はFrida RPC失敗、続く再attachがProcessNotRespondingで失敗したため未完了として扱う。実機画面は書き込み下書き表示中のため追加UI操作を停止。公開や5chへの自動投稿/再送はしていない。

導入ログ: `build/dalvik-three242-install.log`、起動ログ: `build/dalvik-three242-launch.log`、端末画面: `build/dalvik-three242-current.png`、クラッシュ確認: `build/dalvik-three242-crash.log`。実サーバーによるUA受理は未確認。

## 2026-10-27 native識別名保持UAの更新記録補完

前セッションでXIG05/serial730eae72の既存resumefix242へ同一署名install-r Success、データ保持。表示名Haiagaru 検証242、ChMate0.8.10.242 dev。APK `<workspace>/build/native-ua-identity242.apk` SHA256 `56D3C7E775F5F60AC54423CA7E1BA4B109069DDE090BF6B84D137E54E2BCA459`、MPP `<workspace>/build/native-ua-identity-final.mpp` SHA256 `5A4D5964FE9EE49D84E6C549AEA64FCD2C44CC761B1C077045837B048EAEC17F`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias Morphe / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。起動成功、crash空。利用者から投稿成功の報告。正確な導入時刻は以前のログに依存し、この追記時点では端末切断のため再取得していない。


## 2026-10-27 02:33:36 JST 次プレ最終候補の3版データ保持更新
Mi Note10 / Android11 / serial d5497008。以下を既存署名一致後install-r Success、データ保持更新。191/226/242 HomeActivity起動成功、PID12291/10149/11146、各PIDの新規crash buffer空。242は既存閲覧履歴からPart3本文/サムネイル/画像表示をスクリーンショットで確認。191/226本文・画像の重複確認は共通処理のため利用者指示により省略、191巡回長時間停滞は未再現。
MPP: <workspace>/build/prerelease-cards-final.mpp / SHA256 70FC681DDF1D801C446CE614686582362D54B676EFD5ECED18795E76F8C58552
鍵: C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed
- Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK <workspace>/build/prerelease-cards191.apk / SHA256 36B85B39577F5F59432C3F1FF3B9291CF4F39921A161501A0F9592F03F8A80E0
- Haiagaru 検証 226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>/build/prerelease-cards226.apk / SHA256 5E462EE46815462B1EDCBFE626AFA2FB975C78DF9B085B6F6E360A357E73C796
- Haiagaru 検証 242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>/build/prerelease-cards242.apk / SHA256 FBE30096027AAB2BD49E646A52903D2B85BEAD635B3AF117E31FA76AE6E1615F


## 2026-10-27 08:25:52 JST 板名不明時のCookieフォールバック検証
Android API36 / serial emulator-5554 / AVD Haiagaru_Root_API36。3版とも既存署名一致を確認しinstall-r Success・データ保持、TabletHomeActivity起動成功。191/226/242のnative FormBody/byte body・正確な送信slice・不明時従来Cookie load/save・ネストscope復元・OFFの各20項目、計60項目成功。191のCookie分離/削除/復元21項目も成功。実投稿/実Cookieの削除なし。242本文/サムネイル/画像全体の表示・スクロールを確認、共通処理の191/226重複操作は利用者指示で省略。3版PID4833/5775/5460のcrash buffer空。
MPP <workspace>/build/board-cookie-fallback-final.mpp / SHA256359775463E6416DD2E9BF4F3E4A9CCC7C10D22CA493123064A73477B030B5F47
鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA2560af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed
- Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK <workspace>/build/board-cookie-fallback191.apk / SHA256 13A530B04D286A8B8C53B64E7E349F959C8157E30577092A0FAA0310FB96C829
- Haiagaru 検証 226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>/build/board-cookie-fallback226.apk / SHA256 02930217EE8FE414B0E1A110EF41D88EEEF6746BA5FB569EB3A41A9BE51667DC
- Haiagaru 検証 242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>/build/board-cookie-fallback242.apk / SHA256 AB583B6477A1562E81E5D938193DE50DF81BE8AE0ED893CBD8117C9749BAB4EC

## 2026-10-27 メディア横断移動候補
AVD Haiagaru_Root_API36 / serial emulator-5554。既存署名照合install-r Success・データ保持。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。MPP <workspace>/build/media-gallery-ready.mpp SHA256 E1A03C136DF3EA6EBDF869288A709A29D52C197365A07D7C4A1B5059004BD8E2。
- Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK <workspace>/build/media-gallery-ready191.apk / SHA256 21C6DBEF3A7385047332CB9F0E45E8DAE850C246AC10D9DD385DEDB036AD5FAD
- Haiagaru 検証 242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>/build/media-gallery-ready242.apk / SHA256 1AA1A9237ED438449003E4BB7AD02AEA48227837E944D9D9A0375BB3AFEEA00B
242で同レス画像/GIF/動画移動、5操作設定、toolbar/縦操作/pinch除外、GIF自動再生、HTTP応答待ち325msキャンセル、GIF各1取得の24項目成功。build/media-gallery-ready242-runtime4.log。3版native画像touch wrapperの元命令・レジスタ・分岐保持検査成功。191候補起動後の同メディアUI通し確認は未実施。191でlocal HTTP再利用停止を再現し、アカウント/投稿操作なし。

## 2026-10-27 191の接続再利用対策候補
Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / serial emulator-5554 / AVD Haiagaru_Root_API36。既存署名照合install-r Success・データ保持、TabletHomeActivity起動とPart3本文表示確認（build/network191-final.png）。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA2560af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
APK <workspace>/build/network191-fresh-final191.apk SHA256 2574C30062D37F292B4E844D0E3F27A6B1ADAF5029CDD0C4E19605AD3A79A52C
MPP <workspace>/build/network191-fresh-final.mpp SHA256 55A3F7B013EF92C6C87DF5A1CBE17EAFC28CC4E4353BBD236F1A7A26283CDD03
初期ON/明示OFFとGET/POST/media除外・Request不変性16項目、設定実Switch保存/復元、再利用失敗15013ms→対策ON新規3接続527/80/60ms成功。build/network191-reuse-final-runtime.log / network191-reuse-settings.log。15箇所reader execute元命令・bridgeレジスタ保持検査成功。191でも混在メディアUI24項目成功（network191-media-final-runtime.log、HTTP待ちcancel312ms、GIF各1取得）。新規crash buffer空、外部投稿・Cookie削除なし。初回候補生成はsources.mppを誤選択し0patchになったため、未導入でnetwork191-zero-patches-not-for-install.apkへ隔離、通常MPPを明示して再生成・全適用検証後に上記のみ導入。

## 2026-10-27 プレ最終固定候補
serial emulator-5554 / AVD Haiagaru_Root_API36。191/226/242とも署名照合install-r Success・データ保持、HomeActivity→TabletHomeActivity cold起動Status ok。MPP <workspace>/build/prerelease-media-network-final.mpp SHA256 B30B9D14A2527343330329A847A43726D866CFD00E26A25327C2286FFFBC3196。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA2560af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK <workspace>/build/prerelease-media-network191.apk / SHA256 AF5B53B470C0BE8AB01C62D8741CE9F4B4F147D0CDCF1F2C70C00D999EC0A414
- Haiagaru 検証 226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>/build/prerelease-media-network226.apk / SHA256 44039A597E6352B8CF9070A4A505B8AB3ADE2CAB5B784F9C9A3629E37C99BC0C
- Haiagaru 検証 242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>/build/prerelease-media-network242.apk / SHA256 95D1AB6026900AADD3B5069E828D5FC63196F46ECF06C7E137294D017EED703A
3版native画像touch元命令/レジスタ/分岐保持、191のreader15executeとimmutable Request copy bridge検査成功。191初期ON/明示OFF/POSTとmedia除外/共有Request保護16項目、実設定Switch保存/復元成功。ログbuild/prerelease-media-network191-policy.log / prerelease-media-network191-settings.log。226の共通UI重複操作は利用者指示で省略。

## 2026-10-27 標準GIF/動画・スレ全体メディア候補
MPP <workspace>/build/media-thread-native-final.mpp / SHA256 4F7707A6C94442ED307F1750A542DE150093D6938769FF410454A1BCA22FC81C。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA2560af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。3版パッチ適用/署名、native thumbnail factoryと画像touchの元命令/引数/レジスタ/分岐保持を検査し成功。
- Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK <workspace>/build/media-thread-native191.apk / SHA256 76F9F9D09DA5F6946E94690F11AED25DAF357C46DD216F968D3096A85FC1D0AB / 生成のみ、未導入
- Haiagaru 検証 226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>/build/media-thread-native226.apk / SHA256 0F907991E445F244172983366145F6EB34A40EB6A80D4DDBDFACE92024D4912F / 生成のみ、未導入
- Haiagaru 検証 242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>/build/media-thread-native242.apk / SHA256 F002613F8844BFB2DD0013E2FD3DF42F34AEE6F54D40DE7A6F4CDF14EEF42672 / serial emulator-5554 / AVD Haiagaru_Root_API36へ既存署名照合install-r Success・データ保持
242実動作29項目成功（build/media-thread-native242-runtime4.log）。標準GIF/独立動画routing/スレ全体181媒体とNG除外・別スレ拒否/8実設定Switch保存復元/旧操作とcancel。fixtureの原レス・設定はfinallyで復元しDAT変更なし。SystemUI ANRはWaitで復帰、対象アプリの新規crash buffer空。この後、Intent単位snapshot再利用とページ移動時の古いsharedElements除去のみ共通Javaへ追加し最終再build・242再検証中。

## 2026-10-27 GIF標準動作・スレ全体ギャラリー最終候補（未公開）
Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / serial emulator-5554 / AVD Haiagaru_Root_API36。署名照合install-r Success・データ保持、TabletHomeActivity起動成功。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA2560af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
APK <workspace>/build/media-thread-final242.apk SHA256 86326B0EAB74B881FBF159CED09237BA618D4F2480FF782E0DC42958C3FF49F9
MPP <workspace>/build/media-thread-final.mpp SHA256 4074906DB0D074EF37687BFDDBA92A0C9FDD675098A8F36B19B4793FEE9D647C
通常LintVital付きbuild/media-thread-final-build.log成功2m34s。native factoryとtouchの元命令・引数・分岐保持再検査成功。32実動作項目成功（build/media-thread-final242-runtime.log）。標準GIFへの切替・16条件の独立routing・181件のスレ全体収集/NGと別スレ除外・8実Switch保存復元・旧操作回帰に加え、nativeサムネイルの選択を全体scope index1で維持、100回lookupで同じsnapshot参照、同レスswipe OFF/全スレswipe ONで別レス動画へ移動を確認。別ページへ旧sharedElementsを持ち越さず初回native factoryの元sharedElementsは保持。HTTP待ちcancel329ms、新規crash buffer空。nativeレスと設定はfinally復元しDAT変更なし。最終追加は共通Javaのsnapshot cache/transition extra除去のみ、191/226の同フック検査は上記3版候補で完了、共通JavaUIの重複は利用者指定で省略。公開操作なし。

## 2026-10-27 取得済みスレ検索の作成日時順
serial emulator-5554 / AVD Haiagaru_Root_API36。3版とも既存署名照合install-r Success・データ保持、HomeActivity→TabletHomeActivity起動Status ok。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA2560af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。MPP <workspace>/build/cached-search-order-final.mpp SHA256 20A34BC15C557B6E3A6F1DB1518F4C85A344C60E22D48CCCFE19B97120D6D96E。
- Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK <workspace>/build/cached-search-order191.apk SHA256 7878A63A1B702D74A6428A9FA095451A693D29AE96BFDC158E0F29FD3D8DEB0E
- Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>/build/cached-search-order226.apk SHA256 E1D60272A0DAFF0E26FD365EDAE762945379100481B0271122F2D014CA2857E6
- Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>/build/cached-search-order242.apk SHA256 7F1866A0CBC0D72FBF514D5DDFBCE39B1CBC8884F4C2E8E58B9A6CC34916312C
3版の検索描画フック範囲/元命令/レジスタ保持検査成功。242検索実画面のSpinner表示と保存/新旧順/不明末尾/元stateと結果list保護/countとrow identity維持など20項目成功（build/cached-search-order242-runtime2.log）。191 native adapterでクリック対象一致/新旧順/標準復元/新規検索結果へ更新4項目成功（build/cached-search-order191-runtime3.log）。host2011項目成功。226の共通UI重複はユーザー指定により省略、適用/署名/起動とhook検査は実施。起動直後のSystemUI ANRはWaitで復帰。最初の242試験は3版起動ループの226がfocusを取ったため中断、起動完了後の単独再試験成功。191背景processへのFrida attachはtimeout/SIGSEGVとなり、foreground新process4763へ切替後に成功。正常起動後の4763 crash buffer空、製品操作での再現ではなく計測時の失敗として分離。実DATや検索ファイル削除なし、設定はfinally復元。


## 2026-10-27 全板検索・板選択・メディア最終確認
serial emulator-5554 / AVD Haiagaru_Root_API36。データ保持、既存packageは署名照合install-r。署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。最終MPP <workspace>\build\release-final.mpp SHA256 0DB6E20F198576394934632941D15A94FCCFD4AEF0A486BB489F1283D155AE84。
- Haiagaru 検証242 / 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / <workspace>\build\release-final-full242.apk SHA256 5C259CD2214ED7F552C15461A37FFA253D579D7CD7E2C82C49984A4DEECF4719 / 導入・起動Success
- Haiagaru 検証191 / 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / <workspace>\build\global-final-full191.apk SHA256 4FA411BCAB4BFEEDECB3C289021ADADEE46B2B02B38CBAF27F69F7CD40A96C20 / 導入・起動Success
- Haiagaru 検証226 / 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / <workspace>\build\global-final-full226.apk SHA256 1BC8DD6E899DD2AB5AD55D46A25894FD614BD2F6A20BC9DCB83EA67F15E86B3B / 導入・起動Success
- Haiagaru 広告のみ242 / 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.adsonly242 / <workspace>\build\media-supported-ads242.apk SHA256 81B60CBDCDB09CE78D99631FEDFDE3D61352E4C3B9E36E6A2173855BA254C25E / 導入・起動Success
191/226はglobal-title-final.mpp候補、最終差分は共通Java/Kotlinの板一覧worker/cache/Compose再描画のみ、native hook同一。191/226の検索parser実検証各6項目成功、最終共通UI重複は利用者許可により省略。242最終は板一覧取得19ms（走査executorを人工待機）、可視チェック状態と閉じた件数の即反映、全解除後の遅延catalog反映を確認。全板検索OFF/対象なし/選択対象/レス数103/重複/選択検証を3版確認。242選択画面6操作・HOME検索入力→標準とPINK fixture結果混在→スレ本文確認。PINK実板のsubjectを312行/12398文字取得。メディア36項目、実process停止→起動で103レス/-17px復元確認。最軽量32class/全extension参照解決、242Runtime10項目成功。実投稿/アップロード/UPLIFTログインは送信せず算術fixture・native hook確認に留める。新規crash空。SystemUI冷起動ANRはWaitで復帰。最初のhost build/226署名はPCコミット不足で停止、AVD停止後にbuild/適用成功。署名検査Java初期heap不足はXmx256m再試行成功。


## 2026-10-27 メディア件数表示修正
serial emulator-5554 / Haiagaru_Root_API36 / Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242。既存署名照合install-r Success・データ保持・TabletHomeActivity cold起動Status ok/PID2602。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA2560af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
APK <workspace>\build\media-counter242.apk SHA256 E5CE57A5A7B3E3C6E9F74D188CCC221E837C2D6F0FC9F9A223639C3DF9960E97
MPP <workspace>\build\media-counter-final.mpp SHA256 4747989F62B081492840D76FB596B1DB972FE4787E35B97AB70551D407AD1403
通常LintVital付きmedia-counter-build.log成功3m19s、191/226/242適用・署名成功。3版とも旧候補APKとの差分検査でnative counterのsetTextだけを静的helperへ変更・レジスタ/元引数/他命令/分岐保持確認。242実UI5項目成功build/media-counter242-runtime2.log、静止画1/4→2/4→動画3/4・標準GIF3/4、1/2→2/4と2/2→4/4、単一画像1/1→4/4、範囲外/元標準の維持を確認。画像proofはbuild/media-counter-proof.png。初回のnative swipeはSystemUI冷起動ANRに阻まれ中断、Wait後の新fixture完走。crash bufferのBluetooth SIGABRTはcom.google.android.bluetoothでChMate PID2602の新規crashなし。共通Javaの191/226重複UIはユーザー指定で省略。公開はユーザー最新指示で公式Releaseへ進める。


## 2026-10-27 サムネイル・下部動画操作候補
MPP <workspace>\build\media-thumbnail-controls-final.mpp / SHA256 ef8249ba95aec3d88c1840cfaddffce4c75dae346cd5c7becd811574610ad6be
鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。ADB serial emulator-5554。
- Haiagaru 検証191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / <workspace>\build\media-thumbnail-controls191.apk / SHA256 7fad64ca07830649e4e2a826aba158be8c4dc3349a0e0e0042e4bcf36c38c949 / 署名照合install-r成功、cold起動・実スレ/画像/別レス動画移動成功
- Haiagaru 検証226 / ChMate 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / <workspace>\build\media-thumbnail-controls226.apk / SHA256 efc0ff46cf5ba24aeeed1394c2139e13e44c5d4d6f03d3bd486ff6e85f273262 / APK生成・署名成功。ADB起動未完でinstall失敗、導入完了とは扱わない
- Haiagaru 検証242 / ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / <workspace>\build\media-thumbnail-controls242.apk / SHA256 2e3f4b1f775262d2664ec524a7185bd05882565f14f5676a01ea4f0dc0e38c29 / APK生成・署名成功、今回導入なし


## 2026-10-27 公式メディア操作候補
serial emulator-5554 / 既存resumefix226へ署名照合install-r Success、データ保持。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- 回転menu hook候補 ChMate191 / <workspace>\build\media-corners-final191.apk SHA256 044fc2cdfaf2dc426648a38726b298e2c9b454601373b64880adaea1ada94fea / MPP <workspace>\build\media-corners-final.mpp SHA256 21e75400f3cc37e364d20f2eea5d6aeffdc00dba2822b8e032a7e4ae0ed82931 / settingsfix191、生成署名のみ
- 回転menu hook候補 ChMate226 / <workspace>\build\media-corners-final226.apk SHA256 3a707709d5f7b9ec73db7d23bed97f49d371650f44c911674c8eff7e72059b22 / MPP <workspace>\build\media-corners-final.mpp SHA256 21e75400f3cc37e364d20f2eea5d6aeffdc00dba2822b8e032a7e4ae0ed82931 / resumefix226、署名照合導入済み、後続へ更新
- 最終 Haiagaru 検証226 / 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / <workspace>\build\media-back-post-final226.apk SHA256 a8459d9addcac0e680e263a19c8dfbfd895216535d579f04a5d448c15e1f2c31 / MPP <workspace>\build\media-back-post-final.mpp SHA256 ef099d0c4bf7bba64459db7ea92ec73996c34262b04417465970ec3a7b8b9f58 / 導入起動・動画/GIF操作・検索タブ表示成功、新規crash空。

2026-10-27 上下移動最終候補: serial emulator-5554 / Haiagaru 検証226 / 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>\build\media-vertical-final226.apk SHA256 efe9b4d5b0c320971554d8f3014d4c76c3df1a60b0b6580b6fda5e626707c7bb / MPP <workspace>\build\media-vertical-final.mpp SHA256 ae447f6a771f3c8ca35aec7494a2507f85ddf9feacbdea90f9943111bec6416c / 同一Morphe鍵（C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed）照合install-r Success、データ保持、上下3遷移・新規crash空。


## 2026-10-27 回転メニュー修正版
serial emulator-5554 / MPP <workspace>\build\rotation-menu-final.mpp SHA256 01cb2fae89c98772dfe4f629871d0d28b5dae50fba1586b4b64a6ee1c097ea1f / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / <workspace>\build\rotation-menu-final191.apk SHA256 452d59c820edca0d166008d0cc820d0e71841b49990a42162ead4868f2d3258a / 署名照合install-r Success・データ保持・起動/画像/native menu回転90度4回/画面button/OFF確認、新規crash空。
- Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / <workspace>\build\rotation-menu-final226.apk SHA256 76729a7d708af932b38c84f80db25b6a0863af1ab3eeda66c0ae1f16194ac8ea / 署名照合install-r Success・データ保持・起動/画像/native menu回転90度4回/画面button/OFF確認、新規crash空。


## 2026-10-27 GIF自動再生・スレ内再生候補
serial emulator-5554 / Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>\build\inline-limits-final226.apk SHA256 a7ad89d602b47d69c5a8dc126edae3dad5cfaa627b8392440f3e6593bfb5ef1c / MPP <workspace>\build\inline-limits-final.mpp SHA256 8c3d63af8fa65ab3dc4ac8195ef8586048ec3387b7acea79953127bfcc212132 / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed / 署名照合install-r Success、データ保持、本文/通常GIF/X MP4 GIF再生と停止・制限値確認。中間x-inline-gif-final226/limits226/fallback-final226/inline-lifecycle226/inline-exo-final226も同package同鍵で更新し、現在は最終APK。

## 2026-10-28 ID日付範囲・メディア修正 検証候補（未公開）
serial emulator-5554 / MPP <workspace>/build/device-review-edge-direct.mpp SHA256 EDAAE583C569C0A80337AA47FE211B95A8FE4CAFF732F24D89B56D6AF99DF157 / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / <workspace>/build/device-review-edge-direct191.apk SHA256 11A56C9B3641D4CAC639C70089CDA162A823483A1B4F0BD27C89C7021E8237DA / 署名一致install-r Success、データ保持、HomeActivity→TabletHomeActivity cold起動Status ok、新規crash buffer空。ユーザー自身で実操作確認予定。
- Haiagaru 検証 226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / <workspace>/build/device-review-edge-direct226.apk SHA256 EE4FA746295935B086C0E8C8C6DF5CFA78B89C7F3DBC7E4F1066D551CEEE265F / 署名一致install-r Success、データ保持、HomeActivity→TabletHomeActivity cold起動Status ok、新規crash buffer空。ユーザー自身で実操作確認予定。
XIG05 serial730eae72には中間build/device-review-final191.apkのみ先に更新済み（SHA2568BECFF9E3D721D609E47CAD63C579C577907075DADB12C05FFD07E864BFA3EE3、MPP build/device-review-final.mpp）。切断後ユーザー指示でエミュレータへ切替。最終日付カレンダー/Edge直接検索はエミュレータ候補のみ。


## 2026-10-28 HOME複数選択バー下部表示候補（未公開）
Haiagaru 検証 242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / serial emulator-5554 / APK <workspace>/build/home-selection-bottom242.apk SHA256 F269A7D46E3D0CA85A694B5F5762BE9B1D2B868E6E3245C70D4BF59C72B11A3D / MPP <workspace>/build/home-selection-bottom.mpp SHA256 F5DEFD7018B82EE80ABD09EDC4E006227978D743B237B2464F9208AF0814A1CF / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名照合install-r Success・cold起動Status ok・新規crash空。HOMEバー下部表示をONに設定して検証、初期値はOFF。191/226は先のedge-direct候補のまま（242専用追加のみ差分）。

2026-10-28 統合最終候補 / serial emulator-5554 / Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>/build/poster-media-integrated242.apk SHA25654EEBB8137EE1F10DA3679106F99B8F9816769F51DB54E87730291490C04B238 / MPP build/poster-media-integrated.mpp SHA25629DFA200B1480A3FCF630FDBF942AAAA7377AA301D447B7895F7C902D2532F35 / 同上Morphe鍵・alias・証明書。署名照合install-r Success、cold起動/本文成功、新規crashなし。

2026-10-30 共有NG同意preview検証 / emulator-5558 / Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>/build/shared-ng-consent242.apk SHA256 50e958092737f6f48b8e139360a802e8668f9e6181947cf79d5381732460afbe / MPP <workspace>/build/shared-ng-consent.mpp SHA256 401764a855bcec4be08f22e96f0b19d595e96d7a96b358d632b93a74eea53d3c / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名一致install-r Success、既存本文表示・共有NG設定・同意画面・0件preview実表示。合成native Entry/HTTP置換で初回OFF・既存送信・重複抑制・削除取消・OFF停止成功（build/shared-ng-consent242-runtime.log）。prefsはfinally復元、native NG書換えなし、実外部送信なし。SystemUI ANRはWaitで復帰、アプリcrash buffer空。

2026-10-30 共有NG検証191 / emulator-5558 / Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK <workspace>/build/shared-ng-consent191.apk SHA256 c2f989e58e34fb2a4f9bfc409d7ab7c3ee302f8b5de96e05a8b69113d6c25277 / MPP <workspace>/build/shared-ng-consent.mpp SHA256 401764a855bcec4be08f22e96f0b19d595e96d7a96b358d632b93a74eea53d3c / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名一致install-r Success、起動成功、VerifyPersonalNgSaveHook元命令/register保持成功。製品collect ART実行の合成NG/HTTP置換9項目成功、実送信/native NG変更なし、prefs finally復元。build/shared-ng-consent191-runtime.log。受信matchの追加Frida計測は191/242でagent native SIGSEGVのため未成功、検証設定は停止後復元。通常操作時のクラッシュとは区別、受信UI/全機能通し検証は未完。

2026-10-30 共有NG検証226 / emulator-5558 / Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>/build/shared-ng-consent226.apk SHA256 c1ad349f37fd460dc93aac5d43ef3866edc1521cdc38b3c73ccf500e7cf3baa9 / MPP <workspace>/build/shared-ng-consent.mpp SHA256 401764a855bcec4be08f22e96f0b19d595e96d7a96b358d632b93a74eea53d3c / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名一致install-r Success、起動成功、VerifyPersonalNgSaveHook元命令/register保持成功。製品collect ART実行の合成NG/HTTP置換9項目成功、実送信/native NG変更なし、prefs finally復元。build/shared-ng-consent226-runtime.log。受信matchの追加Frida計測は191/242でagent native SIGSEGVのため未成功、検証設定は停止後復元。通常操作時のクラッシュとは区別、受信UI/全機能通し検証は未完。

2026-10-30 Mi Note 10実機 / serial d5497008 / Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>/build/shared-ng-replacement242.apk SHA256 284ded8f2dbd78476fe4f79dcaa8a74e5a2e2c84ed34c351f75c7234ad62c5f1 / MPP <workspace>/build/shared-ng-replacement.mpp SHA256 0dd4a2651f8b6a4bb9e3691912dba82989fe18b9aa5092a78cdec24e40476a51 / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。ユーザー実機使用許可後、既存パッケージ署名一致install-r Success、データ保持。取消→追加順補正版build成功6m21s、save元命令/register保持検査成功。HOME履歴→Part3本文の表示をscreencap確認（build/shared-ng-phone-body.png）。UIAutomator本文null rootはスクリーンショットへ切替、表示成功と確認。crash bufferは既存init(SIGABRT)のみ、今回アプリ新規crashなし。個人NG送信有効化・実NG送信なし。

2026-10-30 任意報告数/同意連動 / Mi Note10 serial d5497008 / Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>/build/shared-ng-custom-votes242.apk SHA256 2a897cc9aaa584433637b02c1791c64465ab793895b3e43edfae8411f83c04f7 / MPP <workspace>/build/shared-ng-custom-votes.mpp SHA256 c5ff256607c59036aa869681afec7dd8863fbc29a0e5e7e5e81870638ad78dfe / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名照合install-r Success、データ保持・起動コマンド成功。通常LintVital build成功6m41s、host rule45/collect19/consent6/votes save9成功。数値UIの端末操作確認と同意連動の端末実操作は未完、個人NG実送信なし。

2026-10-30 任意報告数226 / Mi Note10 serial d5497008 / Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>/build/shared-ng-custom-votes226.apk SHA256 af888f2011bb608d216de2fa203be87df2b5e0c5aea840acc863e5a6147fbadb / MPP <workspace>/build/shared-ng-custom-votes.mpp SHA256 c5ff256607c59036aa869681afec7dd8863fbc29a0e5e7e5e81870638ad78dfe / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。元save命令/register保持検査成功、署名照合install-r Success、データ保持/起動command成功。今回UI再操作未確認。

2026-10-30 GAS直接配信242 / Mi Note10 serial d5497008 / Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>\build\shared-ng-gas-direct242.apk SHA256 b941c364f54a0dc43553bc6ec79459fa145557ce65abec6beb34dd25ed07ad0e / MPP <workspace>\build\shared-ng-gas-direct.mpp SHA256 7f3959015f1d1fb9a81a92dc85be25fb0adb3858e76ab8c9e17ecc7990fc84c5 / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名照合install-r Success、データ保持、cold起動Status ok。実製品sync(true)からGAS直接受信成功、初期GitHub OFF・lastSync更新・failures0確認。個人NG送信呼出なし。build/shared-ng-gas-direct242-runtime.log。191/226は前のcustom-votes版のまま。

2026-10-30 任意報告数191 / Mi Note10 serial d5497008 / Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK <workspace>\build\shared-ng-custom-votes191.apk SHA256 5e80366185085fe702e07a1e7d996a83b226bf7070d3129e342aaa64fb9b9480 / MPP <workspace>\build\shared-ng-custom-votes.mpp SHA256 c5ff256607c59036aa869681afec7dd8863fbc29a0e5e7e5e81870638ad78dfe / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。先行導入ログshared-ng-custom-votes191-phone-install.logの署名照合/install-r Successを追記。

2026-10-30 GAS直接配信191 / Mi Note10 serial d5497008 / Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK <workspace>\build\shared-ng-gas-direct191.apk SHA256 d0b3491062f7cb10ede4686149ad3050dda84defdd6713111b175e9fb79459d9 / MPP <workspace>\build\shared-ng-gas-direct.mpp SHA256 7f3959015f1d1fb9a81a92dc85be25fb0adb3858e76ab8c9e17ecc7990fc84c5 / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名照合install-r Success/データ保持/cold起動Status ok。製品syncの既定GAS直接GET成功、受信13項目成功、prefs/rules/cache復元。実個人NG送信なし。build/shared-ng-gas-direct191-{install,runtime,receive}.log。

2026-10-30 GAS直接配信226 / Mi Note10 serial d5497008 / Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>\build\shared-ng-gas-direct226.apk SHA256 2ec976b01e8e241aeb063e8631225a45b6aed4e1f9efc5bcc2bc514f6af9f926 / MPP <workspace>\build\shared-ng-gas-direct.mpp SHA256 7f3959015f1d1fb9a81a92dc85be25fb0adb3858e76ab8c9e17ecc7990fc84c5 / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名照合install-r Success/データ保持/cold起動Status ok。製品syncの既定GAS直接GET成功、受信13項目成功、prefs/rules/cache復元。実個人NG送信なし。build/shared-ng-gas-direct226-{install,runtime,receive}.log。

2026-10-30 定期確認設定226 / Mi Note10 serial d5497008 / Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>\build\shared-ng-periodic226.apk SHA256 8abb42d127bb3263963f66ce2a2c4ae5c2927af53d9efe2d39e1c9761433d022 / MPP <workspace>\build\shared-ng-periodic.mpp SHA256 ce5048be6a429b0ef0ee69bd1ee18507bfd8afe172dbb8f8e4660675a046a715 / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名照合install-r Success/データ保持/cold起動Status ok。実GAS合成送信7項目成功、実個人NG送信なし。UI初期値計測は未完。191/242は以前のgas-direct版のまま。

2026-10-30 親掲示板/期間なし 191 / Mi Note10 serial d5497008 / Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK <workspace>\build\shared-ng-parent-scope191.apk SHA256 60d5aa798429fb9b2457af724b12e4d5a90ce07039b62f2e609fefde3d229996 / MPP <workspace>\build\shared-ng-parent-scope.mpp SHA256 73f8c49488f2a7d79838e316448c972ad825c7064d7adf7e83f68272d1389e3a / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名一致install-r Success・データ保持・cold起動Status ok、親scope受信17項目成功・設定/cache復元。226では定期確認UI/scheduler12項目と実GAS2条件sync成功。

2026-10-30 親掲示板/期間なし 226 / Mi Note10 serial d5497008 / Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>\build\shared-ng-parent-scope226.apk SHA256 c65c601a4f47cd8a36a337afd1f74de6169707cd5ef2e6a9206b7bdf92ba6a67 / MPP <workspace>\build\shared-ng-parent-scope.mpp SHA256 73f8c49488f2a7d79838e316448c972ad825c7064d7adf7e83f68272d1389e3a / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名一致install-r Success・データ保持・cold起動Status ok、親scope受信17項目成功・設定/cache復元。226では定期確認UI/scheduler12項目と実GAS2条件sync成功。

2026-10-30 親掲示板/期間なし 242 / Mi Note10 serial d5497008 / Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>\build\shared-ng-parent-scope242.apk SHA256 7ef485863208f39230dcd7f4049bb9f8ff0269a7f2bf34058d22586cc8ca3cef / MPP <workspace>\build\shared-ng-parent-scope.mpp SHA256 73f8c49488f2a7d79838e316448c972ad825c7064d7adf7e83f68272d1389e3a / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名一致install-r Success・データ保持・cold起動Status ok、親scope受信17項目成功・設定/cache復元。226では定期確認UI/scheduler12項目と実GAS2条件sync成功。

2026-10-30 外部NGscope修正226 / Mi Note10 serial d5497008 / Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>\build\shared-ng-native-scope226.apk SHA256 d8b0f54ef384663a80a5042ed1b8ff7e390aba556fb49feb2fbd6df14ba6f72d / MPP <workspace>\build\shared-ng-native-scope.mpp SHA256 7d60b4d9189394d2cfdbaefbf6364878458db7deb79fe6f83618c9f0be256fd0 / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore alias Morphe cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。通常LintVital build7m11s/適用成功/署名一致install-r Success/データ保持/cold起動成功。ART15項目（実NGエッヂ分類を含む）と実送信2操作ACK/残0、実GAS3条件sync成功。191/242は以前parent-scope版のまま。

### 2026-10-30 メディア・日付・赤いID 検証候補（後続の仕様変更により置換予定）
MPP: `<workspace>\build\media-ng-calendar.mpp` / SHA-256 `71e18e25234b02257fcd7cd4b39f9290196a3efa67e875f8c78a77d321f04b34`
署名: SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- Haiagaru 検証 191 / ChMate 191 / package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` / serial `d5497008` (Mi Note 10) / 2026-10-30 13:45:59 JST / installed-certificate一致、install-r Success。APK `<workspace>\build\media-ng-calendar191.apk` / SHA-256 `985d1b4ba5773cf3002b2c81679d3e458339ab72f2d2c2ed2d7dbd2549e45ac0`。MPPは上記。
- Haiagaru 検証 226 / ChMate 226 / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / serial `d5497008` (Mi Note 10) / 2026-10-30 13:46:13 JST / installed-certificate一致、install-r Success。APK `<workspace>\build\media-ng-calendar226.apk` / SHA-256 `d58d6977e5f37ef357a1e93f239ff613adeae176d606ccc1798b42f84c442437`。MPPは上記。
- Haiagaru 検証 242 / ChMate 242 / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / serial `d5497008` (Mi Note 10) / 2026-10-30 13:46:28 JST / installed-certificate一致、install-r Success。APK `<workspace>\build\media-ng-calendar242.apk` / SHA-256 `7c95c75ffcabf4b819bf06b5229d1745730a3851e59aaffb186fac52656e89e9`。MPPは上記。
この候補は通常NGIDへの自動登録を含む初期案。利用者の最新指定でスレ内だけの非表示＋除外リストへ変更中。このAPKを最終版・公開済みとして扱わない。

### 2026-10-30 最終候補：赤いIDをスレ内だけ非表示＋除外リスト
MPP: `<workspace>\build\media-red-id-overlay.mpp` / SHA-256 `c4b5bb83651bf2b7744a855f41b443fb1860f07b6d37fb01a74870070e278109`
署名: SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`。
- Haiagaru 検証 191 / ChMate 191 / package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` / serial `d5497008` (Mi Note 10) / 2026-10-30 14:32:00 JST / 既存署名一致、install-r Success。APK `<workspace>\build\media-red-id-overlay191.apk` / SHA-256 `49755f3d4fd808e33200f648ff22307371341b2aa5ccc4ea51679c143d0cc0b6`。MPPは上記。
- Haiagaru 検証 226 / ChMate 226 / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / serial `d5497008` (Mi Note 10) / 2026-10-30 14:33:58 JST / 既存署名一致、install-r Success。APK `<workspace>\build\media-red-id-overlay226.apk` / SHA-256 `0f9b0a1cdb47ba28c66f6ea9e823de3004278fc7cb3f5c045f78fbc0af727d91`。MPPは上記。
- Haiagaru 検証 242 / ChMate 242 / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / serial `d5497008` (Mi Note 10) / 2026-10-30 14:36:33 JST / 既存署名一致、install-r Success。APK `<workspace>\build\media-red-id-overlay242.apk` / SHA-256 `64bd315b4e2c0ced9c3446bad87551dd1e01cc9a8537238e09888be88767f331`。MPPは上記。
3版起動、NG overlayのOFF/8投稿境界/除外ID/別スレ低投稿数/通常NGID不変をARTで確認（191/226各8項目、242 map copy等を含む11項目）。226のPart4本文と報告動画サムネイルは通常UIで表示確認。旧native NGID登録案はこの候補に含まない。初期OFF。アプリRelease未実施。

### 2026-10-30 最適化候補（共有NG・GIF・描画参照）
MPP: `<workspace>\build\optimization-final.mpp` / SHA-256 `6768fd29cda57d64798b2da069fae331dbb51db8f08179f0e8f8d89b357f8385`
署名証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`。
- Haiagaru 検証 191 / ChMate 191 / package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` / serial `d5497008` (Mi Note 10) / 2026-10-30 15:33:35 JST / 既存署名一致、install-r Success、起動成功。APK `<workspace>\build\optimization-final191.apk` / SHA-256 `a55bf565f2e273561a01f6d48fbc51aa62dc8804a12c7f110cfa088bf0007ee5`。MPPは上記。
- Haiagaru 検証 226 / ChMate 226 / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / serial `d5497008` (Mi Note 10) / 2026-10-30 15:25:19 JST / 既存署名一致、install-r Success、起動成功。APK `<workspace>\build\optimization-final226.apk` / SHA-256 `c2012c910e1a155e35bd0a867d9e3981bc030a685762c4765ec0122fd734d08d`。MPPは上記。
- Haiagaru 検証 242 / ChMate 242 / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / serial `d5497008` (Mi Note 10) / 2026-10-30 15:30:43 JST / 既存署名一致、install-r Success、起動成功。APK `<workspace>\build\optimization-final242.apk` / SHA-256 `c1fc4e3d54fb3667b701f50f9d50f15b8fe67c23675ad34a5a2186e031ad0538`。MPPは上記。
3版のART上で共有NG索引の再利用/設定変更による破棄、GIFの対象別キャッシュ無効化/128件履歴の期限解放、過去ログ結果の更新番号、赤いID除外・通常NGID不変を検証。226/242の起動は通常UI、242はスレ本文表示/スクロール/戻るも確認。実際のFPSや改善率の計測は未実施。Release未実施。

### 2026-10-30 XIG05への最適化候補導入（利用者依頼）
serial `730eae72` / model XIG05。MPP `<workspace>\build\optimization-final.mpp` / SHA-256 `6768fd29cda57d64798b2da069fae331dbb51db8f08179f0e8f8d89b357f8385`。
署名証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`。
- 2026-10-30 15:36:55 JST / Haiagaru 検証 191 / ChMate 191 / `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` / 既存署名一致・データ保持install-r Success。APK `<workspace>\build\optimization-final191.apk` / SHA-256 `a55bf565f2e273561a01f6d48fbc51aa62dc8804a12c7f110cfa088bf0007ee5`。
- 2026-10-30 15:37:09 JST / Haiagaru 検証 226 / ChMate 226 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / 新規検証packageへ追加、install Success。APK `<workspace>\build\optimization-final226.apk` / SHA-256 `c2012c910e1a155e35bd0a867d9e3981bc030a685762c4765ec0122fd734d08d`。
- 2026-10-30 15:37:24 JST / Haiagaru 検証 242 / ChMate 242 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / 既存署名一致・データ保持install-r Success。APK `<workspace>\build\optimization-final242.apk` / SHA-256 `c1fc4e3d54fb3667b701f50f9d50f15b8fe67c23675ad34a5a2186e031ad0538`。

### 2026-10-30 191標準バックアップ復元修正の検証
MPP `<workspace>\build\prerelease-dev4-final.mpp` / SHA-256 `1FC9E30FA2B506BD54CE9E7F1B4A8F410D0645F9F9A907D33397144999355AF5`。署名証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`。
- 2026-10-30 16:48 JST / Haiagaru 復元検証191 / ChMate 0.8.10.191 dev / package `jp.co.airfront.android.a2chMate.haiagaru.restoretest191` / serial `emulator-5580` / 既存の隔離検証packageへ同じ署名で `adb install -r`、データ保持。APK `<workspace>\build\prerelease-dev4-restore191.apk` / SHA-256 `D2D94893736AA9A2B15618301054432A4DD5473CDE6A38F0897B785355B4800F`。
- アプリを初回起動してChMate使用許諾へ同意後、標準BackupActivityからChMate形式ZIPを作成し、同じ隔離アプリで復元してHOMEへ戻ることを確認。インストール後の`roidon.sqlite`はZIP内DBとSHA-256一致（`3cac65411ff7b7c0bd86645837fdfc1c188b1f29f11b13da0dbee062674d60a0`）、旧DBは`roidon.sqlite.before-restore-*`へ保持。ZIP内にsidecarはなく、報告された非空journal状態でのUI通し再現とは区別。ユーザー提供ZIP自体の復元、1.95 GiB/約18 GiB/20万ファイルの大容量、Samsung Android 16は未確認。

### 2026-10-30 プレリリース最終候補の実機更新
serial `d5497008` / Mi Note10。MPP `<workspace>/build/prerelease-dev4-final.mpp` SHA-256 `1FC9E30FA2B506BD54CE9E7F1B4A8F410D0645F9F9A907D33397144999355AF5`。署名証明書 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` alias `Morphe`。
- 17:04:26 JST / Haiagaru 検証191 / ChMate0.8.10.191 dev / `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` / APK `<workspace>/build/prerelease-dev4-191.apk` SHA-256 `750AD4F5CAE0A25EDD6C00EAE85F4C854C0FBCAFF4B3F465DFD461F0194F2895`。
- 17:04:56 JST / Haiagaru 検証226 / ChMate0.8.10.226 dev / `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / APK `<workspace>/build/prerelease-dev4-226.apk` SHA-256 `4BACCD26B9F0998105FE169554E33935338083DAF2FE6AE8F9D7062EEE04179A`。
- 17:05:28 JST / Haiagaru 検証242 / ChMate0.8.10.242 dev / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / APK `<workspace>/build/prerelease-dev4-242.apk` SHA-256 `37F366BDD33C38AA8AF742C5EEEF10EB1CD333EFD400E01DB9395E9615378F36`。
全て既存署名照合install-r Success・データ保持・起動プロセス生存。191更新後のhost確認コマンドでreadonly `$PID`への代入が失敗したため、226/242は修正したコマンドで続行（製品の起動失敗ではない）。242の既存スレ本文/スクロール/過去ログ画面を通常UIで確認、17時台の新規crashなし。最適化候補で確認済みの同一メディアソースについて画像表示の3版再検証は未実施。
### 2026-10-30 追加プレ候補：初回共有NG同意・軽量専用パッチ廃止
対象 emulator-5580。署名照合install-r成功・データ保持。MPP <workspace>\build\prerelease-dev5-final.mpp / SHA-256 49e501025b33b1e9021c39735afef58447054d54484a49fb8106365af374a1f8。署名証明書 SHA-256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed、鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe。
- Haiagaru 検証191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / <workspace>\build\prerelease-dev5-191.apk / SHA-256 d94daea3a862d477291cb7ff263e75fbba234b8bb1e1ab1b1fbabb7add0d3cd0。19:00〜19:05 JST導入、起動成功。
- Haiagaru 検証226 / ChMate 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / <workspace>\build\prerelease-dev5-226.apk / SHA-256 e5560f00cc6cd5ad16f245dda246689667053382ebd31e982fdf24796d8fb36d。19:00〜19:05 JST導入、起動成功。
- Haiagaru 検証242 / ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / <workspace>\build\prerelease-dev5-242.apk / SHA-256 ccccfadeee0b513780ed4381589484bfb2ff7875c7f85d6858023bb09bf44c63。19:00〜19:05 JST導入、起動成功。
3版とも設定Activityから初回共有NG同意表示/未保存時送受信OFF/キャンセル後OFF/再案内なし/明示保存後両ONの6項目成功。実個人NG送信とsyncは計測で無効化しprefs復元。3版ARTのglobal identity・記者title限定等7項目成功（設定変更なし）。191/226/242の既存Part3本文と画像サムネイル表示を通常UIで確認。NG保存hookは既存公開候補dev4との命令・register一致、3版記者IDhook検査成功。

2026-10-30 20:38〜20:42 JST 設定トップ/全メディア最終候補
対象 emulator-5580、既存検証packageへ署名照合install-r成功・データ保持。MPP <workspace>\build\gallery-id-jst-final.mpp / SHA256 e2eb7fad35b516f6a995de6e5ed8b602996948c81a16aa0934f122fa50d0da72。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK <workspace>\build\gallery-id-jst-191.apk / SHA256 27a515028d0f11439e853f498d4b799e18186dc4b94a03c7583f4b8f914b36da / 起動・本文・画像・設定基本操作確認。
- Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>\build\gallery-id-jst-226.apk / SHA256 3171bac8ecc764a0d7d8dcd76d15f99483dbd0355849ce9c12cbc2051bb8b258 / 起動・本文・画像・設定基本操作確認。
- Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>\build\gallery-id-jst-242.apk / SHA256 5c4ccc9715012fe7f2319869d6e8f1a324c42f01214a96c52fca2af8eca1f889 / 起動・本文・画像・設定基本操作確認。

2026-10-30 22:09 JST / Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / emulator-5580 / 既存署名照合install-r成功・データ保持・cold起動/本文/報告画像/スワイプ/pan確認。APK <workspace>\build\gallery-fit-zoom-191.apk / SHA256 2f00d565e020dac63ad840664e66c97e8807429c05dc6c922a27cc333ca1adea。MPP <workspace>\build\gallery-fit-zoom-final.mpp / SHA256 266710f6d697794fd8be6b12338960ba0a3c6e706b38ccada9276712352a76b2。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。

2026-10-30 23:32〜23:36 JST パッチ処理最適化候補 / emulator-5580 / MPP <workspace>\build\patch-performance-final.mpp / SHA256 32d22ab4702ed263b75b83bb0e1e130c777b79493061ac866cb7d1848cf6300e。全package同一証明書照合install-r成功・データ保持。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK <workspace>\build\patch-timing-191-dev7\optimized\02-full.apk / SHA256 36bb6adb8df9ccdb8a9a5b2f35d9f1efb04473b7d9b1d82eaf92b5f534bcc4f3 / cold起動・本文・画像・設定トップ確認。
- Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK <workspace>\build\patch-performance-226.apk / SHA256 8d4c9313a70369cc5d01ffb4d6908ce295fe977fc62f029ea31f3328a2ad1823 / cold起動・本文・画像・設定トップ確認。
- Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK <workspace>\build\patch-performance-242.apk / SHA256 33a241d67780d7742878bc62a37ae96c1bda6af89bebd4edc451f389d8d6a4ee / cold起動・本文・画像・設定トップ確認。


## 2026-10-31 17時台 画像終了・動画フィルター・自動NG除外ツールバー検証

対象はローカルの `emulator-5580`。全6回とも既存パッケージとAPKの証明書を照合し、`install -r`でデータを保持して更新した。アンインストール・データ消去なし。署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。中間候補は17:06〜17:16頃、最終候補は17:21〜17:26頃に導入。最終候補は未公開。

### 中間候補・最終候補で置換済み

MPP: `<workspace>/build/viewer-filter-toolbar-final.mpp` / SHA-256 `e53566ab379fbac950af658c1ad8b2af490f95b37f7e2223cf583db409f2e01a`。

|表示名・ChMate版|パッケージ|APK絶対パス|APK SHA-256|結果|
|---|---|---|---|---|
|Haiagaru 検証 191 / 0.8.10.191 dev|`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`|`<workspace>/build/viewer-filter-toolbar-191.apk`|`5aa037ef5ec03083829f17a8a3ffda220529fec18536dba2443e96b259a33b08`|署名一致 install -r 成功、データ保持|
|Haiagaru 検証 226 / 0.8.10.226 dev|`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`|`<workspace>/build/viewer-filter-toolbar-226.apk`|`075c19ae59cb43a95c2d7e5d38d7852dd18496117cda7d8cf39d2add47a8d921`|署名一致 install -r 成功、データ保持|
|Haiagaru 検証 242 / 0.8.10.242 dev|`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`|`<workspace>/build/viewer-filter-toolbar-242.apk`|`64222a67b157b73d837686d723257e5582d71d4b4d759e094dd5081d0daff25a`|署名一致 install -r 成功、データ保持|

### 最終候補

MPP: `<workspace>/build/viewer-filter-toolbar-v2.mpp` / SHA-256 `5e9a2116396e65ff148173e589705a13ffb5099170c60c80f77045e080594f88`。

|表示名・ChMate版|パッケージ|APK絶対パス|APK SHA-256|結果|
|---|---|---|---|---|
|Haiagaru 検証 191 / 0.8.10.191 dev|`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`|`<workspace>/build/viewer-filter-toolbar-v2-191.apk`|`981031575bc7df63dc4719178fc2a33ed0771ca44f7fce0979dbf75e88359acc`|署名一致 install -r 成功、データ保持|
|Haiagaru 検証 226 / 0.8.10.226 dev|`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`|`<workspace>/build/viewer-filter-toolbar-v2-226.apk`|`32e4150701abf6ba07a261b1428b98620b9f3bc794456c498359645ffb7db862`|署名一致 install -r 成功、データ保持|
|Haiagaru 検証 242 / 0.8.10.242 dev|`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`|`<workspace>/build/viewer-filter-toolbar-v2-242.apk`|`759800ce328c5652ba4c67906dd32941d268c48a2684cdbd87ddd25c0e4ea337`|署名一致 install -r 成功、データ保持|

最終候補で3版のcold起動・Part4本文・サムネイル・標準画像表示を確認。191動画絞込みは「取得しない」「画像のみ」で83のMP4レスが残り、動画件数1、表示行4（構造行含む）を確認。242は122のサムネイル→画像表示→上スワイプで本文へ正常復帰、未attach終了callbackも例外なし。新規crash buffer記録なし。runtime/画像証拠はbuild/viewer-filter-toolbar-verification.jsonとbuild/viewer-filter-toolbar-v2-*。


## 2026-10-31 17:49〜17:54 JST 連鎖あぼーん独立非表示の正式版候補

`emulator-5580`の既存3パッケージへ証明書照合済み`install -r`で更新成功、データ保持。MPP `<workspace>/build/chain-abone-final.mpp` / SHA256 `aa70995b3fe8038b914459036d2bfe13ac02b293110c55670385c65e6d2c0f22`。署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

|表示名・ChMate版|パッケージ|APK絶対パス|APK SHA256|結果|
|---|---|---|---|---|
|Haiagaru 検証 191 / 0.8.10.191 dev|`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`|`<workspace>/build/chain-abone-191.apk`|`3e84fc7568eda828320c87a9a3488d946b03e3f5996f4bf54a57920c5a7ac1af`|署名一致・更新/起動成功|
|Haiagaru 検証 226 / 0.8.10.226 dev|`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`|`<workspace>/build/chain-abone-226.apk`|`2a0f99fd85bcabd4f3bfd9e42257b802c35654bf2464fd6b6ffa744b1a7f0b62`|署名一致・更新/起動成功|
|Haiagaru 検証 242 / 0.8.10.242 dev|`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`|`<workspace>/build/chain-abone-242.apk`|`a3ec4dbf32b3edef0845fcd603dd457c125cc8cf06be9d01a69be24152575dce`|署名一致・更新/起動成功|

新機能は実行中エンジンを複製し、合成レスとメモリ内NGName matcherで確認。保存NG登録・DATは変更していない。191/226各15、242は13項目。親の通常NG表示を残し子/孫の連鎖だけが非表示mapへ入る、OFF再構築、NG無効、初期OFF/UI保存に成功。191/226はnative row builderで実際の行除去と標準Show hidden NGによる復帰も確認。242のShow hidden NGを含むnativeフィルター/flowは直前の確認済み候補と全命令/register/branch一致で確認し、実メニュー操作を同一の試験としては扱わない。全版cold起動・既存Part4本文、NG設定UI生成、crash bufferは10/30の旧記録のみ。画像表示・242上スワイプ終了は直前のviewer-filter-toolbar-v2候補で確認した範囲を維持。証拠build/chain-abone-verification.json、build/chain-abone-*-runtime.log。


## 2026-11-01 01:08 JST エッヂレベルNG・スレ内検索対象設定の最終候補

対象はローカルAVD Haiagaru_Test_API36_16GiB、serial emulator-5580。既存検証packageと署名を照合し、install-r成功・データ保持・起動成功。アンインストールやデータ消去なし。署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。MPP `<workspace>/build/edge-search-hardened.mpp` / SHA256 `5eff488a6de7a8bb7927f6c4813eca0b1ad8cf374759ab98c6b5f0a3736899ac`。最初のedge-search-final候補からCookie観測null保護・fingerprint同期・認証日送信失敗時も受信を継続する共通処理を追加したhardened候補へ再更新。

- Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK `<workspace>/build/edge-search-hardened-191.apk` / SHA256 `60e6e1490c5932d06ba8a1164adf19aefad6ec66a29a226b1b71c322e1400599` / 署名一致install-r・起動・nativeレベルNG11/検索37/模擬認証9項目成功。

- Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK `<workspace>/build/edge-search-hardened-226.apk` / SHA256 `99f612fdc3a080c77d5ef94a86b4654877576db68cedbd595493963bbfa5486b` / 署名一致install-r・起動・nativeレベルNG11/検索37/模擬認証9項目成功。

- Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK `<workspace>/build/edge-search-hardened-242.apk` / SHA256 `8468ca47ae6be2dd628cc5710663c2707f202f34cf6beb76370adf36f5a76daa` / 署名一致install-r・起動・nativeレベルNG11/検索37/模擬認証9項目成功。

191で共有同意OFFのままGAS公開レベル1件の受信まで成功。通常NG/DATの保存変更なし、試験用preferencesはfinallyで復元、公開認証日の送信なし。最終crash buffer空。起動時SystemUI ANRはWaitで復帰しアプリcrashとは区別。初期226/242のレベル試験はスレengine未生成で失敗し、その後191/242はclone・226は隔離native engine生成で再試験成功。模擬認証試験の初期失敗はJS Int64の参照比較による試験側誤りで、値比較へ変更して3版成功。アプリRelease未公開。


## 2026-11-01 01:28 JST 全スレのレスを投稿日時で混合表示する検証候補

emulator-5580（Haiagaru_Test_API36_16GiB）の既存隔離packageへ署名照合済みinstall-r成功・データ保持・起動成功。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。MPP `<workspace>/build/cached-response-final.mpp` / SHA256 `c24741235e7fc0035ef14cda83783eae3fe9399d51dd16fbc88cf5eff9213d3d`。

- Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK `<workspace>/build/cached-response-191.apk` / SHA256 `c031187fc7f7bd3f6a12330dce0b2eefab1adddbc5d53fea9f8831b37ca83f2e` / native混合順・元行identity・標準復帰 32項目成功。

- Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK `<workspace>/build/cached-response-226.apk` / SHA256 `95142ec677b91d0ecd2f5ac11fe2961cd8a85c32a939ebdb8e3b85d939337f7d` / native混合順・元行identity・標準復帰 36項目成功。

- Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK `<workspace>/build/cached-response-242.apk` / SHA256 `c19555615241d1a399752fc3ff246b9542492cea4db5a5eb4ed1e38c24fd3275` / native混合順・元行identity・標準復帰 36項目成功。

242の実native検索UIへ表示中だけ合成結果を渡し、2022年A→2021年B→2020年Aの表示と投稿日時順の選択欄を目視確認。表示fixtureはFrida detachで解除し、設定値を元に復元、SearchActivityを戻るで閉じた。DAT/アーカイブの追加削除なし。build/cached-response242.pngと同XML、runtime logを保存。最終crash buffer空。初期native試験では242のAnnotatedStringのString単引数constructorがないこと、226 stateの先頭constructorが1引数であることを検出したため、試験を実型のString/List・4引数constructorへ合わせて再試験成功。アプリコード修正の追加は不要だった。アプリRelease未公開。


## 2026-11-01 01:39 JST 自動NG除外ID追加のツールバー設定対応

emulator-5580 / Haiagaru_Test_API36_16GiB の既存検証packageへ署名照合install-r成功・データ保持・cold起動成功。署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。MPP `<workspace>/build/red-id-menu-settings.mpp` / SHA256 `dfe432433206e8a6e327e7ae0b70f4771d9c9892e7864818078cde91930cdad7`。

- Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK `<workspace>/build/red-id-menu-settings-191.apk` / SHA256 `00d49943279ffb48ccef5640c75416e4458baf589fc91ab1a69367f49b802cdb` / native catalog・表示設定17項目成功。

- Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK `<workspace>/build/red-id-menu-settings-226.apk` / SHA256 `a646b9a4d4fd41a95c2b6c5212fbdcbd97da06a92cb7e775249adc7e2312f3ff` / native catalog・表示設定17項目成功。

- Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK `<workspace>/build/red-id-menu-settings-242.apk` / SHA256 `b6491d9875acb457eb740a17129e02c53808875d869c0bc521f223ffb2781496` / native catalog・表示設定17項目成功。

native標準カタログに新IDと有効な文字列リソースが1件存在、重複登録なし、標準共有先5件保持、保存したツールバー設定のON/OFF、下4桁NGと独立、追加Menuの順序、placeholder除去、常に表示/非表示、IDシートへの反映を各版で確認。合成レスと隔離PopupMenu/シートを使用、通常NGや除外IDへ登録なし。preferencesはfinallyで元へ復元。最終crash buffer空。build/red-id-menu-settings191/226/242-runtime.log。アプリRelease未公開。


## 2026-11-01 01:56 JST IDリンクカード誤検知の追加対策

emulator-5580の既存隔離検証packageへ署名照合install-r成功、データ保持、cold起動成功。MPP `<workspace>/build/site-card-id-guard.mpp` / SHA256 `558cd04a602a56ada46c6a021068dd7ee4136d843eea46e3086ea8da36e8ee9e`。署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。

- Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK `<workspace>/build/site-card-id-guard-191.apk` / SHA256 `a2c7133a963f7ac1305d7397b18e183e57f563a557a8e819fbf961045dc93466` / URL抽出とSiteCards候補27項目成功。

- Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK `<workspace>/build/site-card-id-guard-226.apk` / SHA256 `d4ab7e302e6d5c7f4876169f0d0f340f9c056e0e84922d859977030e3b15e02a` / URL抽出とSiteCards候補27項目成功。

- Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK `<workspace>/build/site-card-id-guard-242.apk` / SHA256 `d70ecb9b35a2a08cd192b9918f5aece75603d6e2702160f1775872d993138bce` / URL抽出とSiteCards候補27項目成功。

指定IDと実レス相当ヘッダー、空白/全角コロン付きIDの候補0件、後続URL/省略URL保持を確認。private SiteCards.urlsまで実行しネットワークmetadata取得なし、DAT/prefs変更なし。最終crash buffer空。利用者の症状発生版は不明、指定ID自体は変更前現行版でも候補0件のため原報告の再現成功とは扱わない。アプリRelease未公開。


## 2026-11-01 02:20 JST 公式候補最終：メール自動入力抑止・認証日共有削除

emulator-5580へ既存署名照合install-r・cold起動成功。既存アプリデータ保持。MPP `<workspace>/build/official117-final.mpp` / SHA256 `c03a67b63f250d1c0ec9ba3b62dd280bf3fa25be70c9cef99497aab683e8e634`。署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias Morphe / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

- Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK `<workspace>/build/official117-191.apk` / SHA256 `a814d5379057f1f438b90d17e9307e3edaacaec1f73f58a7ffeb75bafb113a74`。

- Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK `<workspace>/build/official117-226.apk` / SHA256 `da1fdeb34aa5edd5df9b4ffe7f524e397804056b2b14670edefba4d5d4b084fa`。

- Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK `<workspace>/build/official117-242.apk` / SHA256 `cc44e86dea0b88d832e3356c196daab4da3b571368117444d9ab54c992bd5afa`。

各版：メール欄45・検索対象37・除外IDメニュー17・サイトカード27・公開レベル11項目成功。混合検索順191は32、226/242は36項目成功。既存native hook元命令/register保持検査成功。3版のPart4本文/通常画像表示を目視確認。Imgur候補は削除/429のため、実在するrepository main-screen.pngを通常画像viewerで表示（画像内容自体は旧投稿エラー画面のスクリーンショット）。最終crash buffer空、build/official117-final-crash.log。


## 2026-11-01 色見本修正の検証用導入

emulator-5580の既存隔離packageへ署名照合install-r成功・cold起動成功、データ保持。表示名 Haiagaru 検証191/226/242。MPP `<workspace>/build/highlight-preview.mpp` / SHA256 `ea1def0406e55f0ae4c03e1df532c6fd0d7f453f9228b4e1a3ac018264974a97`。署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias Morphe / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

- ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK `<workspace>/build/highlight-preview-191.apk` / SHA256 `ea97b750b6f3d5082617a72784e55ef8c92547795e1bc86fd62b06be5088595c` / 色見本18項目と実画面表示成功。

- ChMate 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK `<workspace>/build/highlight-preview-226.apk` / SHA256 `ecf722205ca54feb48dbc292f498f91df9af2d2367984beb4efa8e04b3d29a85` / 色見本18項目と実画面表示成功。

- ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK `<workspace>/build/highlight-preview-242.apk` / SHA256 `c610a5db5ad86f1259bd953bdc424f69f0d3b37f250b58730cf102be1f2bc091` / 色見本18項目と実画面表示成功。

初期共通色・個別色・継承の切替・共通色変更追従・行比較更新・説明文への統合除外・登録画面の色見本・未登録で保存しないことを確認。合成登録を検証中のみ使用し、元のrules/color/enabledはfinallyで復元。通常NG/DAT/実投稿へ変更なし。最終crash buffer空（build/highlight-preview-crash.log）。公開前。


## 2026-11-01 メディア移動と標準の戻る操作の競合修正・最終候補

emulator-5580、既存隔離packageへ署名一致install-r/cold起動成功、データ保持。MPP `<workspace>/build/media-native-back-final.mpp` / SHA256 `a6e1785561872598e0fbf6f23551890619d63aa3625281fac7388bb407736ba6`。署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias Morphe / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

- Haiagaru 検証191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK `<workspace>/build/media-native-back-final-191.apk` / SHA256 `e9bdbefcb0b3dd452584139e53d6f5133f855f1bbbd8842e858a7f9f97be221d` / 完了確認2026-11-01 17時台JST。

- Haiagaru 検証226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK `<workspace>/build/media-native-back-final-226.apk` / SHA256 `1fd7e08cef7d83656dcd098b5c7ad2453fb4cc8a3dab6b6b0c291f70e74eb504` / 完了確認2026-11-01 17時台JST。

- Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK `<workspace>/build/media-native-back-final-242.apk` / SHA256 `d68ed0c9389c8e92a2d70836e8caaa99ce135c27dc4b1f803528accefbddb414` / 完了確認2026-11-01 17時台JST。

最終runtimeは242:14項目、191/226:各8項目成功。242標準画像/標準GIFのON/OFF上下終了、左右移動、保存された戻る設定を実タッチdispatch経由で確認。191/226は標準の上下終了機能がないため従来の上下移動保持を確認。専用GIF/動画の上下移動も保持。検証用の設定はfinally復元、実投稿/NG/DAT変更なし。crash buffer空。未公開。


## 2026-11-01 18:19 JST 設定UI・一覧位置保持などの検証用導入

emulator-5580、既存隔離packageへ署名照合install-r成功。データ保持。MPP `<workspace>/build/reader-ui-scroll.mpp` / SHA256 `6a5ed6b65425d9befc2555fcf3b395b3a3b065be12097b35a547bb7024ad3465`。署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias Morphe / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

- Haiagaru 検証191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK `<workspace>/build/reader-ui-scroll-191.apk` / SHA256 `209ffb612064a6a669a99298714609ba6eaa03292992d6f37a87f13c15894e6b` / 設定一覧位置保持の実タップ往復2回、検索38項目、アルバム7項目、nativeキャッシュ失敗処理を確認。

- Haiagaru 検証226 / ChMate 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK `<workspace>/build/reader-ui-scroll-226.apk` / SHA256 `2a290c38023af94bcf669b38721e304c3bfb0c0ddea8fe22ac9dfdf2eb793656` / 設定一覧位置保持の実タップ往復2回、検索38項目、アルバム7項目、nativeキャッシュ失敗処理を確認。

- Haiagaru 検証242 / ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK `<workspace>/build/reader-ui-scroll-242.apk` / SHA256 `6a9c9af3e31f086472f703025daa7fdf1b3a340f896830ece6cf493fab5471f5` / 設定一覧位置保持の実タップ往復2回、検索38項目、アルバム7項目、nativeキャッシュ失敗処理を確認。

通常LintVital/R8 build成功2m21s、native元命令/register/分岐先保持を3版で確認。crash buffer空。詳細・未確認範囲はdocs/reader-ui-fixes-20261101.md。未公開。


## 2026-11-01 18:27 JST XIG05へ未公開修正版を導入

実機XIG05（ADB serial `730eae72`）へ別パッケージ3版を新規導入。既存ChMateとデータを保持。使用MPP `<workspace>/build/reader-ui-scroll.mpp` / SHA256 `6a5ed6b65425d9befc2555fcf3b395b3a3b065be12097b35a547bb7024ad3465`。署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias Morphe / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

- 表示名 Haiagaru 検証 191 / ChMate 0.8.10.191 dev / `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` / APK `<workspace>/build/reader-ui-scroll-191.apk` / SHA256 `209ffb612064a6a669a99298714609ba6eaa03292992d6f37a87f13c15894e6b` / install成功、起動プロセス確認。

- 表示名 Haiagaru 検証 226 / ChMate 0.8.10.226 dev / `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / APK `<workspace>/build/reader-ui-scroll-226.apk` / SHA256 `2a290c38023af94bcf669b38721e304c3bfb0c0ddea8fe22ac9dfdf2eb793656` / install成功、起動プロセス確認。

- 表示名 Haiagaru 検証 242 / ChMate 0.8.10.242 dev / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / APK `<workspace>/build/reader-ui-scroll-242.apk` / SHA256 `6a9c9af3e31f086472f703025daa7fdf1b3a340f896830ece6cf493fab5471f5` / install成功、起動プロセス確認。

アプリ初回設定・バックアップ復元・同意操作は未実施。191は背景移行後にプロセス終了していたため再起動しPID19093を確認、新規crash logは空。226 PID16994、242 PID18481。既存データ消去/アンインストール/投稿なし。公開なし。


## 2026-11-01 18:54 JST 版間の対応統一・検証版導入

emulator-5580の既存隔離3版へ署名照合install-r成功。MPP `<workspace>/build/version-parity-final.mpp` / SHA256 `a7fca9a480f08b0339fd37136c165bdff6a6de2579c9ad8282663d895c420dda`。署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias Morphe / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

- Haiagaru 検証 191 / ChMate0.8.10.191 dev / `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` / APK `<workspace>/build/version-parity-final-191.apk` / SHA256 `ae92afa46ffb44c59d7a978138e881ed2d492da8dbb8c467c437dfae1bb59cc6` / 導入・起動、巡回ログの保存と設定UI、Web検索フラグ6項目、検索38項目、album7項目成功。

- Haiagaru 検証 226 / ChMate0.8.10.226 dev / `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / APK `<workspace>/build/version-parity-final-226.apk` / SHA256 `7cf22da4c2fda40e287f085c668f005bde3ce31c6b495e4f87864e13fe46b9ea` / 導入・起動、巡回ログの保存と設定UI、Web検索フラグ6項目、検索38項目、album7項目成功。

- Haiagaru 検証 242 / ChMate0.8.10.242 dev / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / APK `<workspace>/build/version-parity-final-242.apk` / SHA256 `2397b7aa444994017f1b483197d08123a6fd277153b1632952b681463c81caef` / 導入・起動、巡回ログの保存と設定UI、Web検索フラグ6項目、検索38項目、album7項目成功。

native191/226各18、242は20項目成功。元worker命令/register/分岐先保持・例外再throw検査成功。crash buffer空。設定/ログfixtureは復元。詳細docs/version-parity-20261101.md。実機XIG05（730eae72）は接続消失により更新失敗、今回版は未導入、既存アプリ/データ保持。公開なし。


## 2026-11-01 公式Release候補の検証

対象はemulator-5580、署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。全更新で既存署名を照合、アンインストール・データ消去なし。

- Haiagaru 検証 191 / ChMate0.8.10.191 dev / `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` / emulator-5580 / APK `<workspace>\build\release118-final-191.apk` / SHA256 `2252cf94fe1a4e9ad8016cd292952cd5e9ebd1566d3c1d27daaee50770a96845` / MPP SHA256 `d32d05f38927879d4b9813846d3d47ea4cb2a081098875022f28b3ab58720910` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-01 JST install-r Success。

- Haiagaru 検証 226 / ChMate0.8.10.226 dev / `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / emulator-5580 / APK `<workspace>\build\release118-final-226.apk` / SHA256 `ae276f532717da1c1b5c40d9ca54359899c51485f2ebc9184218c00fb952a4d4` / MPP SHA256 `d32d05f38927879d4b9813846d3d47ea4cb2a081098875022f28b3ab58720910` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-01 JST install-r Success。

- Haiagaru 検証 242 / ChMate0.8.10.242 dev / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / emulator-5580 / APK `<workspace>\build\release118-final-242.apk` / SHA256 `d9a61f233825eb2862f8016163d3aeef4bbac55037bd1b0adbc0ac745a2ced3d` / MPP SHA256 `d32d05f38927879d4b9813846d3d47ea4cb2a081098875022f28b3ab58720910` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-01 JST install-r Success。

- Haiagaru 必死OFF 191 / ChMate0.8.10.191 dev / `jp.co.airfront.android.a2chMate.haiagaru.checkerflag191` / emulator-5580 / APK `<workspace>\build\release118-checker-off-191.apk` / SHA256 `04cfb4000057b7024c18eb764664ac8ee654bb5e24d24ead5351df22c36f54f7` / MPP SHA256 `3c9f127327e2e594ae14cc1f6c3139ea649b3e40dafbfd127600b31c99b3b20b` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-01 JST install-r Success。

- Haiagaru 必死OFF 226 / ChMate0.8.10.226 dev / `jp.co.airfront.android.a2chMate.haiagaru.checkerflag226` / emulator-5580 / APK `<workspace>\build\release118-checker-off-226.apk` / SHA256 `a77cc4e0092a117dcc07b0f718b7e12346d002916fe70fb0423f1e98ebf0658c` / MPP SHA256 `3c9f127327e2e594ae14cc1f6c3139ea649b3e40dafbfd127600b31c99b3b20b` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-01 JST install-r Success。

- Haiagaru 必死OFF 242 / ChMate0.8.10.242 dev / `jp.co.airfront.android.a2chMate.haiagaru.checkerflag242` / emulator-5580 / APK `<workspace>\build\release118-checker-off-242.apk` / SHA256 `e7ea883d50d4ed526316b954c06a4741858c67414e2d4086daa7603c4480e52f` / MPP SHA256 `3c9f127327e2e594ae14cc1f6c3139ea649b3e40dafbfd127600b31c99b3b20b` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-01 JST install-r Success。

通常ON版は最終MPP release118-final.mpp、OFF版は先行MPP release118-verified.mppで必死OFF分岐を各18項目確認。先行OFF版は追加通信/前スレ修正より前のものとして区別。最終ON版は各4項目、共有NG18、フィルター高さ28、native reader191/226各18・242は20、album7/search38/Web検索6。191のpool分離8、ローカル接続4回、通信上限17確認。前スレリンクのURL/設定OFF/外板除外6、既読を上にの設定入口3を各版確認。メディア試験の最終ログはintegration-statusを参照。


## 2026-11-02 スレ全メディア移動の191/226/242共通化（未公開）

- Haiagaru 検証 191 / ChMate 0.8.10.191 dev / 表示名 `Haiagaru 検証 191` / package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` / serial `emulator-5580` / APK `<workspace>\build\gallery-parity-191.apk` / SHA256 `ebfc07acfef8ea8521dd8aac16f350ab60eac0c300b99bc9d8e87095567d616c` / MPP `<workspace>\build\gallery-parity.mpp` / SHA256 `cf2505c955105e59e44145b26d9be42b124f1bf65df44a77070d31a7cb27387f` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST install-r Success。

- Haiagaru 検証 226 / ChMate 0.8.10.226 dev / 表示名 `Haiagaru 検証 226` / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / serial `emulator-5580` / APK `<workspace>\build\gallery-parity-226.apk` / SHA256 `2a1d7844fca580b1c3da1b234204799cc3278550bdcc0dd2a8dd026b83ab725d` / MPP `<workspace>\build\gallery-parity.mpp` / SHA256 `cf2505c955105e59e44145b26d9be42b124f1bf65df44a77070d31a7cb27387f` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST install-r Success。

- Haiagaru 検証 242 / ChMate 0.8.10.242 dev / 表示名 `Haiagaru 検証 242` / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / serial `emulator-5580` / APK `<workspace>\build\gallery-parity-242.apk` / SHA256 `dda5de295fff8f879400b7fd8a45a78cd584b1e5de7baa8abc93b91e05a1ef77` / MPP `<workspace>\build\gallery-parity.mpp` / SHA256 `cf2505c955105e59e44145b26d9be42b124f1bf65df44a77070d31a7cb27387f` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST install-r Success。

署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。各端末内の既存APKをpullして署名を照合したうえで更新。アンインストール・データ消去なし。公開バンドル/Releaseは更新していない。


## 2026-11-02 操作共通化・位置保存初期化 最終版（公開前）

- 表示名 `Haiagaru 検証 242` / ChMate 0.8.10.242 dev / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / serial `emulator-5580` / APK `<workspace>\build\parity-usability-final-242.apk` / SHA256 `56743112c1e14ab3c243a8da0f0cf6f454361b38390a059f8708823cc6c281eb` / MPP `<workspace>\build\parity-usability-final.mpp` / SHA256 `52daa4e5c3af282cd48fe3309a4bff998b1940cea04811845bc0406311b4fc48` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST install-r Success。

- 表示名 `Haiagaru 検証 226` / ChMate 0.8.10.226 dev / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / serial `emulator-5580` / APK `<workspace>\build\parity-usability-final-226.apk` / SHA256 `7bf1c96d97baf3a23f0b592537fc33883fca4f883b6f0883fdbc77e52918df28` / MPP `<workspace>\build\parity-usability-final.mpp` / SHA256 `52daa4e5c3af282cd48fe3309a4bff998b1940cea04811845bc0406311b4fc48` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST install-r Success。

署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。更新前に既存APKのpackage/署名を照合。データ消去・アンインストールなし。初期parity-usability.mppと区別し、公開候補はparity-usability-final.mpp。

- 表示名 `Haiagaru 検証 191` / ChMate 0.8.10.191 dev / package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` / serial `emulator-5580` / APK `<workspace>\build\parity-usability-final-191.apk` / SHA256 `6d85201c1f1b660c3dea8f8bc753887c0640cc6c64df2acc1370a0852d5bb2cc` / MPP SHA256 `52daa4e5c3af282cd48fe3309a4bff998b1940cea04811845bc0406311b4fc48` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST install-r Success。上記最終版と同じMPP/鍵/alias、既存署名照合済み。


## 2026-11-02 バックアップ索引・自動バックアップ設定の保存検証

- 表示名 `Haiagaru 更新移行検証` / ChMate 0.8.10.191 dev / package `jp.co.airfront.android.a2chMate.haiagaru.migration191242` / serial `emulator-5580` / APK `<workspace>\build\backup-marks-settings-final-191.apk` / SHA256 `18430118772ca5702c2d278f3c1b43714bb949fa1ebd8c419c052f2a50ebf606` / MPP `<workspace>\build\backup-marks-settings-final.mpp` / SHA256 `7b7fcc383130ef5ab43bba2d54cea8409a6bdb8a30aba62ebc0222d0a58771e6` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST install-r Success。

- 表示名 `Haiagaru 更新移行検証` / ChMate 0.8.10.226 dev / package `jp.co.airfront.android.a2chMate.haiagaru.migration191242` / serial `emulator-5580` / APK `<workspace>\build\backup-marks-settings-final-226.apk` / SHA256 `b335c46f298b359dbe76a1df07a26f425eff06149d19a86195abe6644ca85ba4` / MPP `<workspace>\build\backup-marks-settings-final.mpp` / SHA256 `7b7fcc383130ef5ab43bba2d54cea8409a6bdb8a30aba62ebc0222d0a58771e6` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST install-r Success。

- 表示名 `Haiagaru 更新移行検証` / ChMate 0.8.10.242 dev / package `jp.co.airfront.android.a2chMate.haiagaru.migration191242` / serial `emulator-5580` / APK `<workspace>\build\backup-marks-settings-final-242.apk` / SHA256 `c7a4d218b59e647df48f2a4ada227962ec9901ee9aef8b8cb8e24d4d8c0399f3` / MPP `<workspace>\build\backup-marks-settings-final.mpp` / SHA256 `7b7fcc383130ef5ab43bba2d54cea8409a6bdb8a30aba62ebc0222d0a58771e6` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST install-r Success。

同じ隔離パッケージで191→226→242を順に署名照合更新。実機・通常パッケージの変更なし。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。専用fixtureだけのファイル/設定を作り、テスト用cacheとbackup-fixture名前空間はfinallyで削除。実スレへの投稿・NG送信なし。


## 2026-11-02 アーカイブ遷移・チェック表示の検証（未公開）

- 表示名 `Haiagaru 更新移行検証` / ChMate 0.8.10.191 dev / package `jp.co.airfront.android.a2chMate.haiagaru.migration191242` / serial `emulator-5580` / APK `<workspace>\build\archive-toggle-final-191.apk` / SHA256 `bd0ceb0a456ca02671032aa98fa2a0927312732cc6192f6be9be96902820e8f0` / MPP `<workspace>\build\archive-toggle-final.mpp` / SHA256 `48b562db1f8f36324a37f24da57e9e0fa3ef9a81804aa560524dfd03018674dc` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST 署名一致install-r Success。

- 表示名 `Haiagaru 更新移行検証` / ChMate 0.8.10.226 dev / package `jp.co.airfront.android.a2chMate.haiagaru.migration191242` / serial `emulator-5580` / APK `<workspace>\build\archive-toggle-final-226.apk` / SHA256 `d8ad660205856651685ad0f9ffe2772c1cb82d573f8d1847fb4fa6dd9037865f` / MPP `<workspace>\build\archive-toggle-final.mpp` / SHA256 `48b562db1f8f36324a37f24da57e9e0fa3ef9a81804aa560524dfd03018674dc` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST 署名一致install-r Success。

- 表示名 `Haiagaru 更新移行検証` / ChMate 0.8.10.242 dev / package `jp.co.airfront.android.a2chMate.haiagaru.migration191242` / serial `emulator-5580` / APK `<workspace>\build\archive-toggle-final-242.apk` / SHA256 `5458ea6d4f602360a434fa74ed9084b9ff71a922b3bc2f1586296d747991afda` / MPP `<workspace>\build\archive-toggle-final.mpp` / SHA256 `48b562db1f8f36324a37f24da57e9e0fa3ef9a81804aa560524dfd03018674dc` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST 署名一致install-r Success。

鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。同じ隔離packageで順次更新。40件の保存用スレ・50件の標準アーカイブfixtureだけを検証後に削除、自動バックアップをOFFへ戻した。実機/通常packageの変更・実投稿・NG送信なし。詳細は `docs/archive-backup-controls-20261102.md`。


## 2026-11-02 アーカイブ標準リスト・バックアップの一括設定保護（公式候補）

- 表示名 `Haiagaru 更新移行検証` / ChMate 0.8.10.191 dev / package `jp.co.airfront.android.a2chMate.haiagaru.migration191242` / serial `emulator-5580` / APK `<workspace>\build\archive-preset-final-191.apk` / SHA256 `0d1630f60a9b08b5cf93e32b65ef9781847c80d96498fa57333373464afece15` / MPP `<workspace>\build\archive-preset-final.mpp` / SHA256 `375b01f1056663269ac389d790e0d5fa2d61530fbe293705e31f710977226100` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST 署名一致install-r Success。

- 表示名 `Haiagaru 更新移行検証` / ChMate 0.8.10.226 dev / package `jp.co.airfront.android.a2chMate.haiagaru.migration191242` / serial `emulator-5580` / APK `<workspace>\build\archive-preset-final-226.apk` / SHA256 `8dc0bdc6a877a7e8b4a308f8b6edb09893864ac78e08169d302603f423c89cce` / MPP `<workspace>\build\archive-preset-final.mpp` / SHA256 `375b01f1056663269ac389d790e0d5fa2d61530fbe293705e31f710977226100` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST 署名一致install-r Success。

- 表示名 `Haiagaru 更新移行検証` / ChMate 0.8.10.242 dev / package `jp.co.airfront.android.a2chMate.haiagaru.migration191242` / serial `emulator-5580` / APK `<workspace>\build\archive-preset-final-242.apk` / SHA256 `d4da4086e99256a0c1fe234f69729a6db720bd51da6b3b27614a897e3669cc3d` / MPP `<workspace>\build\archive-preset-final.mpp` / SHA256 `375b01f1056663269ac389d790e0d5fa2d61530fbe293705e31f710977226100` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST 署名一致install-r Success。

鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。同じ隔離packageを順次更新し、各版の設定/アーカイブ・画像/GIF・キャッシュ済みスレ本文を確認。検証用40保存用スレと40従来レスをID/URL/パス照合で削除。実機/通常package/投稿/NG送信変更なし。


## 2026-11-02 スレ初回表示・広告走査最適化（未公開）

- 表示名 `Haiagaru 更新移行検証` / ChMate 0.8.10.191 dev / package `jp.co.airfront.android.a2chMate.haiagaru.migration191242` / serial `emulator-5580` / APK `<workspace>\build\thread-open-ad-cache-191.apk` / SHA256 `0a51f65330065562a98667f6c1125780e440f1933550976186a15ae218bd0885` / MPP `<workspace>\build\thread-open-ad-cache.mpp` / SHA256 `7f39bcc7e0ab49dc6e4e11f97854c20198fd2c0652fb94e6719f599d75c70711` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST 署名一致install-r Success。

- 表示名 `Haiagaru 更新移行検証` / ChMate 0.8.10.226 dev / package `jp.co.airfront.android.a2chMate.haiagaru.migration191242` / serial `emulator-5580` / APK `<workspace>\build\thread-open-ad-cache-226.apk` / SHA256 `f04590791188a4694e7095d2e7343404dec016a943e24ff82610e6cea8ffe9d8` / MPP `<workspace>\build\thread-open-ad-cache.mpp` / SHA256 `7f39bcc7e0ab49dc6e4e11f97854c20198fd2c0652fb94e6719f599d75c70711` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST 署名一致install-r Success。

- 表示名 `Haiagaru 更新移行検証` / ChMate 0.8.10.242 dev / package `jp.co.airfront.android.a2chMate.haiagaru.migration191242` / serial `emulator-5580` / APK `<workspace>\build\thread-open-ad-cache-242.apk` / SHA256 `76f65b593d10dd9350668878f219773e3368d87858cc61096cb2b0510f9b6de8` / MPP `<workspace>\build\thread-open-ad-cache.mpp` / SHA256 `7f39bcc7e0ab49dc6e4e11f97854c20198fd2c0652fb94e6719f599d75c70711` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 2026-11-02 JST 署名一致install-r Success。

鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。最終アプリは191へ同一署名で再更新して通常本文を確認。広告10/画像GIF8を各版確認。AB比較用の公式1.18.2/1.18.3 APKは `build/thread-open-1.18.2-191.apk` と `build/thread-open-1.18.3-191.apk`、各SHA/使用MPP/certは `build/thread-open-install-1.18.2.json` / `thread-open-install-1.18.3.json`。実機/通常package/投稿/NG送信なし。

## 2026-11-03 検索入力・通知・閲覧認証の検証アプリ（中間版を含む）

全てローカル canonical workspace の build/ 配下。表示名 `Haiagaru 更新移行検証`、package `jp.co.airfront.android.a2chMate.haiagaru.migration191242`、ADB `emulator-5580`。既存packageの署名を照合してinstall-r Success。実機・通常packageの置換や消去はない。中間版のUI問題を最終成功としない。

| 導入記録 | APK | APK SHA256 | 使用MPP SHA256 |
| --- | --- | --- | --- |
| `emoji-watch-auth-install-191.json` | `<workspace>/build/emoji-watch-auth-191.apk` | `eb4055f885b2a109dbf29bba0f89de8207969a7fa40869020ced40555a472b5d` | `5266b54ac049aa00f28c7e8e1aa07924f67c6e10886f8c586504dfa1bdf5a2c4` |
| `emoji-watch-auth-interval-install-191.json` | `<workspace>/build/emoji-watch-auth-interval-191.apk` | `33d5d4e454e616d38b5e28203370f259c2c7db080fe73677f5bb4fd418b1f51e` | `ab4704726a386bec226185f7637e4c3fee2571537a39b7a1923c2d440b3bd353` |
| `emoji-watch-auth-interval-install-226.json` | `<workspace>/build/emoji-watch-auth-interval-226.apk` | `9162938af83ecb23e4df9166db48df4c0c6d88d903e1b617259d93d57d40a0a8` | `ab4704726a386bec226185f7637e4c3fee2571537a39b7a1923c2d440b3bd353` |
| `emoji-watch-auth-interval-install-242.json` | `<workspace>/build/emoji-watch-auth-interval-242.apk` | `a438777005c58db7bafc9dd0a8423a65c2b1f614f289027fbaa55c2e7ac17563` | `ab4704726a386bec226185f7637e4c3fee2571537a39b7a1923c2d440b3bd353` |
| `emoji-watch-auth-footer-install-191.json` | `<workspace>/build/emoji-watch-auth-footer-191.apk` | `d9239c080fcff2079536a7e05ab4bb46521c8ca48f480cc04170283d16703f9a` | `324c873f51bb436a6d18256742c4acb9be2279aea10f5f558f10a59496f629f2` |
| `emoji-watch-auth-footer-install-226.json` | `<workspace>/build/emoji-watch-auth-footer-226.apk` | `7789eaa9f02d37d66e2e412b24405d0485705f5148a1de5383863a8a3b9cf11c` | `324c873f51bb436a6d18256742c4acb9be2279aea10f5f558f10a59496f629f2` |
| `emoji-watch-auth-footer-install-242.json` | `<workspace>/build/emoji-watch-auth-footer-242.apk` | `3f93153ed6a72aae9427c2c75656479f63be24a074393aa0c43223a24c4964dc` | `324c873f51bb436a6d18256742c4acb9be2279aea10f5f558f10a59496f629f2` |
| `emoji-watch-auth-modal-install-191.json` | `<workspace>/build/emoji-watch-auth-modal-191.apk` | `fae1350c2eae7e9b929a9f02bd4d2912bb2a751f74bd32ada3214c66149879cb` | `379925b38ff3d1a1cb789d3ad194707b40a992f14ecd4ed08a9bef608fadfccb` |
| `emoji-watch-auth-modal-install-226.json` | `<workspace>/build/emoji-watch-auth-modal-226.apk` | `b7276137adaeb3ce7a23028e4f5f3f422e92278c04d359081f2167ae418b25e2` | `379925b38ff3d1a1cb789d3ad194707b40a992f14ecd4ed08a9bef608fadfccb` |
| `emoji-watch-auth-modal-install-242.json` | `<workspace>/build/emoji-watch-auth-modal-242.apk` | `42b19a93bacd433b26dec5f7d623aede8fed0c195a8546bde64d40ae1ce3b763` | `379925b38ff3d1a1cb789d3ad194707b40a992f14ecd4ed08a9bef608fadfccb` |

署名証明書SHA256は全て `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。鍵の秘密情報は記載しない。使用MPPは同じphase名の build/*.mpp。modalが最終候補で、各APK内の版はファイル末尾191/226/242に対応する。各install JSONはAPK/MPPの絶対パス・hash・署名照合結果の証跡。

## 2026-11-03 Mi Note 10へ通知・閲覧認証版242を導入

利用者の実機インストール指示。serial `d5497008` / Mi Note 10 / Android 11。表示名 `Haiagaru 検証 242`、ChMate `0.8.10.242 dev`、既存package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` を同一署名でinstall-r Success。アプリのデータ消去・アンインストールなし。

- APK `<workspace>/build/watch-minote242.apk` SHA256 `fdb4881be27138e1b3b842c15ac26c84f72c653548f04031ed60c7893eb2022e`。導入後の実APK hash一致。
- MPP `<workspace>/build/emoji-watch-auth-modal.mpp` SHA256 `379925b38ff3d1a1cb789d3ad194707b40a992f14ecd4ed08a9bef608fadfccb`。別ブランチのランダムUA実験は含まない。
- cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。既存APK・新APKで一致。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- 2026-11-03 01:24 JST、PID18973の起動を確認、対象PIDのFATAL EXCEPTIONなし。最初の即時PID取得は起動より先で失敗したため、再インストールせず後続のPID・warm start・実APK hashで確認。VPNの接続設定は変更していない。

証跡 `build/watch-minote242-install.json` / `watch-minote242-startup-crash.log` / `watch-minote242-patch.log`。ホストの最初のapksignerは仮想メモリ不足で失敗したため、検証AVDのみデータ保持で停止し、128MiB上限の署名検証で成功してからパッチ・導入。公式Release/feed/GAS更新なし。

### 2026-11-03 02:04 JST 通知の日・時間・分UIへ更新

同じMi Note 10 (`d5497008`)、同package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / 表示名Haiagaru 検証 242 / ChMate242を署名一致install-r。APK `<workspace>/build/thread-watch-units-minote242.apk` SHA256 `d463be51ed1e2a71b87381c4f36d038d3b9e36ee0171d2389ede14d4e860ecdb`、MPP `<workspace>/build/thread-watch-units-final.mpp` SHA256 `7c7b2a4817566995a113bb06c79ccb9ff7ef5fab0a0c8f98f3dce0b1849c946a`。
署名証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。導入後hash一致、PID14277・startup fatalなし。証跡 `build/thread-watch-units-minote242-install.json`。この時点ではランダムUA実験を含む（初期OFF）。後続の利用者指示で実験削除を作業中。

### 2026-11-03 02:25 / 02:40 JST エッヂ閲覧確認修正版

同端末serial `d5497008` / Mi Note 10 / Android11、同package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / Haiagaru 検証 242 / ChMate242を既存署名照合してinstall-r。署名証明書・鍵・aliasは上記と同じ。通常アプリの置換・データ消去なし。両版ともランダムUA実験を削除済み。

| 時刻 | APK絶対パス | APK SHA256 | MPP絶対パス | MPP SHA256 |
|---|---|---|---|---|
|02:25|`<workspace>/build/reading-challenge-minote242.apk`|`9ce537d0cf6e4e5f2968e1c1a28372c75f7732128d69236a51d01903c003d3d8`|`<workspace>/build/reading-challenge.mpp`|`5b7a62491f966bebb7bf5c227955cf69be9267fb9769cb43637fa691174bfcb5`|
|02:40|`<workspace>/build/reading-challenge-final-minote242.apk`|`8132e0fc65682cabb211efcaf3846c3f6002c79f55e4091f203ae7af7a157aa8`|`<workspace>/build/reading-challenge-final.mpp`|`383311e2d2ded9656ee6b134d5f7fa7c4a6944843c8685fbb932b8afecaed0a9`|

導入後hash一致、startup fatalなし。証跡 `build/reading-challenge-minote242-install.json` / `reading-challenge-final-minote242-install.json`。最終PID25887。最初の版は空一覧が残り成功扱いせず、最終版で認証表示・板一覧・本文の新着取得を確認。直接クラス指定への後続変更はこの導入に含まない。

## 2026-11-03 固定クラス一覧版の3版エミュレータ検証

serial `emulator-5580`、AVD `Haiagaru_Test_API36_16GiB`、Android16/SDK36。利用者の全クラス走査廃止・公式公開指示による隔離検証。通常アプリの削除・データ消去なし。次の検証packageへinstall-r Success、起動・導入後APK hash一致。

MPP `<workspace>/build/class-bindings-fixed3.mpp` SHA256 `bdda80841ecabd3c1ea36be572045739587b208b80502b5ea8f6f38d2df76b1b`。署名cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。

| ChMate | package / 表示名 | APK絶対パス | SHA256 |
|---|---|---|---|
|0.8.10.191 dev|`jp.co.airfront.android.a2chMate.haiagaru.bindings191` / Haiagaru binding 191|`<workspace>/build/class-bindings-fixed3-191.apk`|`fb6ba9a6a129c55213fd51f8e4423dd4922860f4ca8222de118b958783316a04`|
|0.8.10.226 dev|`jp.co.airfront.android.a2chMate.haiagaru.bindings226` / Haiagaru binding 226|`<workspace>/build/class-bindings-fixed3-226.apk`|`8114c0d1270a340c28a7e68b68a0c241a6b1d9837c4c91d3788aefd945de65e4`|
|0.8.10.242 dev|`jp.co.airfront.android.a2chMate.haiagaru.bindings242` / Haiagaru binding 242|`<workspace>/build/class-bindings-fixed3-242.apk`|`aaad23703484e030fcfd67f80527e9944fa70ea54ce32ac7e3dbc998009021a2`|

照合日時は2026-11-03 03:17 JST、詳細 `build/class-bindings-installations.json`。任意の動画専用ビューア・画像VPNを含めた適用比較用APKだが、VPN自体は有効化していない。検証用キャッシュfixtureと設定は検証後に復元・解除する。

最終確認で3版ともnative本文を再表示した後、所有marker/DAT内容/タイトルを照合してDAT・idx・bookmark・markerを削除。通知登録0、設定復元、新規fatalなし。`build/class-bindings-final-smoke.json` / `class-bindings-cleanup-{191,226,242}.log` / `class-bindings-crash-{191,226,242}.log`。この作業で起動したAVDはデータ保持で終了。公式1.19.0の公開MPPは別hashとなるため、上記の開発候補APKを公式配布MPPで生成したAPKとは扱わない。


## 2026-11-03 遷移前DAT取得修正版（未公開）

serial `emulator-5580` / AVD `Haiagaru_Test_API36_16GiB` / Android16。既存隔離packageと新APKの署名照合後install-r Success。既存通常アプリの置換・アンインストール・データ消去なし。署名cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。

MPP `<workspace>/build/thread-prefetch-fix.mpp` SHA256 `9a6fe7f97a0924bb563ab508309de03c7fbc834427f7024e5bb52c1cafd5b7f3`。

| ChMate / 表示名 | package | 導入時刻 JST | APK絶対パス | SHA256 |
|---|---|---|---|---|
|0.8.10.191 dev / Haiagaru binding 191|`jp.co.airfront.android.a2chMate.haiagaru.bindings191`|2026-11-03T11:41:20.449657|`<workspace>/build/thread-prefetch-fix-191.apk`|`44c3c6e2a4fbb5430be8abb4ed450d70609ad95a3065d5f477e724002f032822`|
|0.8.10.226 dev / Haiagaru binding 226|`jp.co.airfront.android.a2chMate.haiagaru.bindings226`|2026-11-03T11:43:56.656828|`<workspace>/build/thread-prefetch-fix-226.apk`|`76a8f0d66d7b4b5202b0f7ad0f47db12156e2cd809077cb03060dbdc7e49486b`|
|0.8.10.242 dev / Haiagaru binding 242|`jp.co.airfront.android.a2chMate.haiagaru.bindings242`|2026-11-03T11:44:56.463556|`<workspace>/build/thread-prefetch-fix-242.apk`|`6def48f1db60cad83c64be930918d393150bd9519e28ee214cb4c476e212ac57`|

導入後の実APKをpullしてhash一致、各対象PIDに新規fatalなし。各18項目・native未取得スレ本文レス45表示確認。証跡 `build/thread-prefetch-install-{191,226,242}.json` / `thread-prefetch-final-verification.json` / `thread-prefetch-native-{191,226,242}.xml`。試験設定復元・所有fixture削除済み。ユーザー実機への導入なし、公式配布物ではない。


## 2026-11-03 通知内容・最上部設定入口 最終候補

serial `emulator-5580`、AVD `Haiagaru_Test_API36_16GiB`、Android16。既存隔離package署名照合install-r Success。通常アプリ/実機への導入・アンインストール・データ消去なし。署名cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。MPP `<workspace>/build/notification-inline-final-fix.mpp` SHA256 `60a554a4384e7611f3bfcafe5f8bdf03509f70e2524f9d5ea8dd012c02e0d2d0`。

| ChMate / 表示名 | package | JST導入時刻 | APK絶対パス | SHA256 |
|---|---|---|---|---|
|0.8.10.191 dev / Haiagaru binding 191|`jp.co.airfront.android.a2chMate.haiagaru.bindings191`|2026-11-03T12:59:21.886860|`<workspace>/build/notification-inline-final-fix-191.apk`|`a90601d50f576486757a1f397d775c3e704e7fa13eca3f398c6abe0280c0c672`|
|0.8.10.226 dev / Haiagaru binding 226|`jp.co.airfront.android.a2chMate.haiagaru.bindings226`|2026-11-03T13:09:09.264926|`<workspace>/build/notification-inline-final-fix-226.apk`|`4543b86b39ab4e92d54f2a130f61598282a974e4f5aa5cb1da323692afcb0223`|
|0.8.10.242 dev / Haiagaru binding 242|`jp.co.airfront.android.a2chMate.haiagaru.bindings242`|2026-11-03T13:09:45.529550|`<workspace>/build/notification-inline-final-fix-242.apk`|`ddcbbf1fffcaae0bf53569bc7cddfa195cc8792ee0cd2bb302c0a1948cf203b1`|

導入済み実APKのSHA256一致。各通知17/設定入口15項目、242の背景Job→本文付き通知→次回予約を確認。初期ANR/ハーネス失敗は成功に含めず再確認。各PID新規fatalなし。全版テスト登録0・設定復元。利用者指定で今回の本文/画像/GIF/動画再検証を省略。詳細docs/notification-settings-readme-20261103.md、build/notification-settings-final-summary.json。


## 2026-11-03 5ch通知本文・native設定一覧 最終候補

serial `emulator-5580` / AVD `Haiagaru_Test_API36_16GiB` / Android16。既存隔離packageとの署名照合後install-r Success。署名cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。通常package/実機への導入・削除・データ消去なし。

MPP `<workspace>/build/native-settings-row-release.mpp` SHA256 `3a2bbf4579eaf9b42ad06d69092f8d4ef8916795bd7e5212d7746c57a64a9033`。

|版 / 表示名|package|導入日時 JST|APK絶対パス|SHA256|
|---|---|---|---|---|
|0.8.10.191 dev / Haiagaru binding 191|`jp.co.airfront.android.a2chMate.haiagaru.bindings191`|2026-11-03T14:35:40.257034|`<workspace>/build/native-settings-row-release-191.apk`|`01094dcab5359adf04df5be7877f8da30616ec0907054bb20152a1ba646944dc`|
|0.8.10.226 dev / Haiagaru binding 226|`jp.co.airfront.android.a2chMate.haiagaru.bindings226`|2026-11-03T14:36:20.204175|`<workspace>/build/native-settings-row-release-226.apk`|`f50ad36a1d27cb744d9a2c8d1c99d793a373acb4efbcaaf90cef823276783c15`|
|0.8.10.242 dev / Haiagaru binding 242|`jp.co.airfront.android.a2chMate.haiagaru.bindings242`|2026-11-03T14:34:40.603163|`<workspace>/build/native-settings-row-release-242.apk`|`b5045a75bfb16b246a40583f3856dd86d22ea451820a3f5f24b105cf3ff98107`|

各通知17、UI設定191/226各12・242は18、native内容保持191/226各6・242は8項目成功。対象実APK hash一致、新規fatalなし。242背景Job20→22件の本文通知/次回予約、実機の公開5ch DATでの純粋パーサーも確認。登録/通知/設定復元、実機一時DEX削除済み。詳細docs/notification-body-native-settings-20261103.md。


### 追加: 242 S2M起動対策の最終候補

同じ隔離package/署名/鍵/serialへ署名一致install-r Success。導入日時JST `2026-11-03T14:39:19.918795`、APK `<workspace>/build/notification-settings-s2m-final-242.apk` SHA256 `ae5144ac5d2076bcb35ced77060cdc880ccf28a4c2bcd1e6137e08eccb2aa96c`、MPP `<workspace>/build/notification-settings-s2m-final.mpp` SHA256 `87ac79db6fdca09f4bb480046b1ff7951a570ea641b0bbae56472f02fbd666b4`。実インストールAPK hash一致。191/226は前候補とextension MPE同一のため前段の検証を継続採用、242で再確認。

最終242で通知17/設定UI18/内容保持8、S2M画面3回の起動・再表示成功、新規fatalなし。Frida通信hook背景試験はART native異常終了のため無効とし、フック無し実5ch通信のJob試験へ変更。前回0件の試験基準→117件を取得して本文付き通知・次回Job確認、新規fatalなし、登録を削除・間隔を初期15分へ・通知0を確認。新規117投稿の観測ではない。利用者の通常アプリ/実機設定は変更なし。


## 2026-11-03 versionCode整数上限の生成確認（未導入）

ChMate242 dev、表示名Haiagaru binding 242、package `jp.co.airfront.android.a2chMate.haiagaru.bindings242`。APK `<workspace>/build/version-code-intmax-242.apk` SHA256 `94301c6657c7c4f46a9e4c65050f29202b5a7f32f517b66cf62d5c614ac25975`。MPP `<workspace>/build/version-code-intmax.mpp` SHA256 `0136e0a5eb45e3131fda79bc54a48cf07f80c0efdfc619cd3ca677a390bea07b`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。aaptでversionCode=2147483647/versionName=0.8.10.242 devを確認、署名検証成功。端末serialなし・インストール未実施。


## 2026-11-03 191連続復元調査（専用隔離package）

serial `emulator-5580` / AVD `Haiagaru_Test_API36_16GiB` / Android16。通常アプリ・利用者実機への導入/削除/データ消去なし。表示名 `Haiagaru restore test 191`、ChMate `0.8.10.191 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.restoreperf191`。初回新規導入、修正版は同署名を照合してinstall-r Success。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

|候補 / 導入記録時刻JST|APK絶対パス|APK SHA256|MPP絶対パス / SHA256|
|---|---|---|---|
|restore-perf-install191.json / 2026-11-03T15:25:36|`<workspace>/build/restore-perf-191.apk`|`00f73befd6b009ee8e42544332f1076cc3f53627734c8bb2ddda35a53f1b0b38`|`<workspace>/build/version-code-intmax.mpp` / `0136e0a5eb45e3131fda79bc54a48cf07f80c0efdfc619cd3ca677a390bea07b`|
|restore-ui-fixed-install191.json / 2026-11-03T15:40:43|`<workspace>/build/restore-ui-fixed-191.apk`|`8accedc087942da08ad6742d5451864263a9879145b175cd476df10c504b0451`|`<workspace>/build/restore-ui-snapshot.mpp` / `478e0d383753745aff2593c4f53043c822348c1a427e4753e7af7aebc14ef2cb`|

最終実APK hash一致、新規fatalなし。48項目、提供ZIPの認証等を除いた全体5回復元、cached本文可視6レスを確認。最初のSystem UI ANR中の画像/画面測定は無効にして終了後再確認。提供ZIP由来のデータはこの隔離appだけに読み込み、network OFFで試験、原本不変。試験後はappをデータ保持で強制停止、転送用tmp4ファイル削除、AVDの通信を戻して停止。docs/restore-repeat-settings-20261103.md。公式公開物ではない。


## 2026-11-03 通知・バックアップ設定移行と配布ライブラリ再生成（未公開）

serial `emulator-5580` / Android16 / AVD `Haiagaru_Test_API36_16GiB`。既存隔離bindings191/242との署名照合install-r Success。鍵は従来のローカル署名鍵、alias `Morphe`、cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。絶対パスを含む原本は公開対象外のローカル台帳に保持する。通常package/実機の更新・アンインストール・データ消去なし。

MPP `<workspace>/build/portable-backup-final.mpp` SHA256 `a740c9107937c79e7e916620a4c8154a66d86f113999510c22e192e0c62538d1`。

|ChMate / 表示名|package|導入時刻JST|APK（workspace基準）|SHA256|
|---|---|---|---|---|
|0.8.10.191 dev / Haiagaru binding 191|`jp.co.airfront.android.a2chMate.haiagaru.bindings191`|2026-11-03T16:50:32.345873|`build/portable-backup-final-191.apk`|`19aa735d22215b5e29ed22038c89b5ff4b4d3b17d93d26a486604a2361a7b051`|
|0.8.10.242 dev / Haiagaru binding 242|`jp.co.airfront.android.a2chMate.haiagaru.bindings242`|2026-11-03T16:43:54.077645|`build/portable-backup-final-242.apk`|`ad4699b24d4e12adfe64932471cabcd7f1bcf7a7755c0e804a153db2ea6c42fb`|

各通知バックアップ40/新規環境相当の設定復元23項目成功。242は既存通知17・JNI初期化/close/切断確認成功。全版実APKhash一致/対象PID新規fatalなし/試験通知登録0。UI242で復元ON/保存先/権限待ち/間隔6・保持数6表示を確認。詳細docs/portable-backup-settings-20261103.md。


## 2026-11-03 登録済みNG操作 最終確認

serial `emulator-5580` / Android16。既存隔離アプリと署名一致を確認してinstall-r成功、データ保持。実機・通常パッケージへの導入なし。各版でネイティブ保存処理102項目、実画面タップ13項目成功。試験NGを元の一覧へ復元、送信同意OFF、試験中のネットワークOFF。新規crash buffer空。
MPP `build/existing-ng-final.mpp` SHA256 `098e1a2a3aac52335ec5bf21f873d381b454a7aa1cb5a4306e95e76cda1bd98a`。cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、alias `Morphe`。絶対パス・鍵の場所を含む非公開台帳は `build/local-development-records/existing-ng-final-installations.json`。

|版 / 表示名|package|導入日時 JST|APK|SHA256|
|---|---|---|---|---|
|191 / Haiagaru binding 191|`jp.co.airfront.android.a2chMate.haiagaru.bindings191`|2026-11-03T17:49:02.134273|`build/existing-ng-final-191.apk`|`191401bfb5e529a751f9aeaa481e39218acda9d1aa84c6fdd0218d9772cfa53d`|
|226 / Haiagaru binding 226|`jp.co.airfront.android.a2chMate.haiagaru.bindings226`|2026-11-03T17:51:13.184141|`build/existing-ng-final-226.apk`|`53df50735036518b358603046bdfa03bc9b193e1e548e9e55b9efeddc30621e9`|
|242 / Haiagaru binding 242|`jp.co.airfront.android.a2chMate.haiagaru.bindings242`|2026-11-03T17:52:21.888653|`build/existing-ng-final-242.apk`|`c1a8c16c085694b0b8389f69f6b5d9de92022b105afc39d0c1231238b8f1372f`|


## 2026-11-03 未登録NGボタンの条件付き追加

serial `emulator-5580` / Android16。既存bindings191／226／242と署名照合後install-r成功、データ保持。各版の変更画面17項目成功。登録済み／未登録／空欄／再入力のボタン追加・除去と重複防止、削除確認・キャンセル・有効／無効を確認。初回起動時のSystem UI ANRを終了してから再試験し成功、今回のapp crash buffer空。試験NG一覧は復元し個人NG送信同意OFF。本文／画像／GIF／動画の未変更部分は利用者指定で重複検査を省略。

MPP `build/conditional-ng.mpp` SHA256 `39bd6943153ca78df74d3e131e084fd8fc9e0e3a75184c90c622c0c7ba44d0bf`。cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、alias `Morphe`。絶対パス・鍵の場所を含む原本: `build/local-development-records/conditional-ng-installations.json`。

|版 / 表示名|package|導入日時 JST|APK|SHA256|
|---|---|---|---|---|
|191 / Haiagaru binding 191|`jp.co.airfront.android.a2chMate.haiagaru.bindings191`|2026-11-03T19:52:09.849670|`build/conditional-ng-191.apk`|`30db689068d0e448e2bea699cbe111d7bbb566402730e049832f93226a3fb03a`|
|226 / Haiagaru binding 226|`jp.co.airfront.android.a2chMate.haiagaru.bindings226`|2026-11-03T19:53:29.752744|`build/conditional-ng-226.apk`|`8b6496752517224937dda2056b00f8a26fa18421ff43471b6ef44a01773b4c00`|
|242 / Haiagaru binding 242|`jp.co.airfront.android.a2chMate.haiagaru.bindings242`|2026-11-03T19:55:00.230190|`build/conditional-ng-242.apk`|`00e3b8ea0e15bcfe56d52c9e530c00fd17f299eb4baea4cba98b432f32268ea5`|


## 2026-11-03 共有NG検索・レスから除外の実機導入（未公開版）

serial `730eae72` / XIG05。接続時の標準ChMateは0.8.10.246。標準アプリを変更せず、ChMate0.8.10.242 dev / 表示名 `Haiagaru 検証 242` / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` を別アプリとして新規導入。署名照合／APK package検査／install-r Success／cold起動Status ok／導入後APK全バイト一致／新規対象crashなし。データ消去・アンインストールなし。記録時刻JST `2026-11-03T20:20:17.294094+09:00`。今回のNG除外画面操作は未確認。

APK `build/shared-ng-device-242.apk` SHA256 `4f5ac42050f3382b8ed73eff785a5d05eae6e4d5009b018a5b50fbf543078c50`、MPP `build/shared-ng-device.mpp` SHA256 `6f074172374f1a238d899840652a602b5d4bc8cbb9736238c443ab9419144b77`。cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、alias `Morphe`。絶対パス・署名鍵の場所を含む原本は `build/local-development-records/shared-ng-device-installation.json`。


## 2026-11-03 読書位置・トリップ・検索強調・移行削除 最終候補

serial `emulator-5580` / Android16。既存bindings191／226／242の署名照合後install-r成功、データ保持。各版本体の検索色付け処理15項目成功、191の読書位置・トリップの実Android16項目成功。新規app crash buffer空。実機は読み取り専用で検索画面・導入APKの検索フックを照合し、今回の更新・データ消去なし。未変更の本文／画像／GIF／動画は既存利用者指定で再検査省略。

MPP `build/shared-read-search-final.mpp` SHA256 `b1616f6c6c8440a11adf162931235d113df8624eb1cc5ad284f10145805c4284`。cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、alias `Morphe`。絶対パス・鍵の場所を含む原本は `build/local-development-records/shared-read-search-final-installations.json`。

|版 / 表示名|package|導入日時 JST|APK|SHA256|
|---|---|---|---|---|
|191 / Haiagaru binding 191|`jp.co.airfront.android.a2chMate.haiagaru.bindings191`|2026-11-03T21:06:36.456530|`build/shared-read-search-final-191.apk`|`3b352f5466fa340b8276e9925373ac6d65756b808c23e21005d0283a4c6be3fe`|
|226 / Haiagaru binding 226|`jp.co.airfront.android.a2chMate.haiagaru.bindings226`|2026-11-03T21:08:01.522533|`build/shared-read-search-final-226.apk`|`c9378f8e55139ccdff48e27eaa21f70d9bb527f48618ddffe9f5c0f9ec26b7fe`|
|242 / Haiagaru binding 242|`jp.co.airfront.android.a2chMate.haiagaru.bindings242`|2026-11-03T21:09:02.093717|`build/shared-read-search-final-242.apk`|`1826df7a96c44ea4d0d96f8a88c99ff5b1928c81168fd74674e8d89fbca00786`|


## 2026-11-04 更新対象の操作連動・履歴タブ

serial `emulator-5580` / Android16。既存bindings191／226／242の署名・旧実APK hashを台帳と照合しinstall-r成功、データ保持。各版で履歴34・更新トリガー11・native worker5項目成功、popup画像を目視確認。新規対象app crashなし。

MPP `build/refresh-history-tabs.mpp` SHA256 `f70eba83827f466ecbe35c8fa448d731dbfe63650deb77b855ab60ec8cd5d1c1`。cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、alias `Morphe`。絶対パス・鍵の場所を含む原本は `build/local-development-records/refresh-history-tabs-installations.json`。

|版 / 表示名|package|導入日時 JST|APK|SHA256|
|---|---|---|---|---|
|191 / Haiagaru binding 191|`jp.co.airfront.android.a2chMate.haiagaru.bindings191`|2026-11-04T09:00:38.206840+09:00|`build/refresh-history-tabs-191.apk`|`48cbee9f81fa15e4a2339e1f64c8ed9fbfbb71d88e5df441bcdb0485cb192c41`|
|226 / Haiagaru binding 226|`jp.co.airfront.android.a2chMate.haiagaru.bindings226`|2026-11-04T09:00:55.068145+09:00|`build/refresh-history-tabs-226.apk`|`0cbf80062107a1e2e1908a7631b22357017e8fefc75ea9f99a5d07069fb62e9b`|
|242 / Haiagaru binding 242|`jp.co.airfront.android.a2chMate.haiagaru.bindings242`|2026-11-04T09:01:19.569775+09:00|`build/refresh-history-tabs-242.apk`|`6a325824de1d2658bc2590cb0d4cc61fc8ef314642386d821814baae279850f4`|


## 2026-11-04 HOME対象スレ・履歴下部選択タブ 最終候補

emulator-5580 / Android16、bindings191／226／242の既知APK hashと署名を照合しinstall-r成功。データ保持。履歴各33項目、HOME191/226各16・242は14項目、対象と★の実表示XML比較を3版成功。新規対象app crashなし。MPP `build/history-bottom-tabs.mpp` SHA256 `d610036968d25704192c74f64a3b9a2d8abc34b194d800d299b26e7f7e0e2bc0`。署名cert `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、alias Morphe。絶対パス・署名鍵の場所を含む原本は `build/local-development-records/history-bottom-tabs-installations.json`。

|版 / 表示名|package|導入日時 JST|APK|SHA256|
|---|---|---|---|---|
|191 / Haiagaru binding 191|`jp.co.airfront.android.a2chMate.haiagaru.bindings191`|2026-11-04T10:54:54.082846+09:00|`build/history-bottom-tabs-191.apk`|`e5340d83814cffc5bfc608490a3f592d757fdbea622b953df7d1a0a60a879ae6`|
|226 / Haiagaru binding 226|`jp.co.airfront.android.a2chMate.haiagaru.bindings226`|2026-11-04T10:55:00.860066+09:00|`build/history-bottom-tabs-226.apk`|`6839f4b9049e87708fc22e22a2096f0ca0c4536e7c017295c82c292ae9d01e53`|
|242 / Haiagaru binding 242|`jp.co.airfront.android.a2chMate.haiagaru.bindings242`|2026-11-04T10:55:07.193073+09:00|`build/history-bottom-tabs-242.apk`|`ab9286b92b1ba26207a50ce1d43622d540c9c8fc9ec803215a8fa171745cf36d`|


## 2026-11-04 履歴対象タブ表示のオプション

emulator-5580 / Android16。bindings191／226／242の既知実APK hash・署名照合install-r成功、データ保持。各47項目成功、元HOMEの全命令・branch・register保持、新規対象app crashなし。MPP `build/history-target-option.mpp` SHA256 `31d6e305258f3e4b11a2109269fe7ae2a57bbd1db720613f37654f5b3766323b`。署名cert `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、alias Morphe。絶対パス・署名鍵の場所を含む原本は `build/local-development-records/history-target-option-installations.json`。

|版 / 表示名|package|導入日時 JST|APK|SHA256|
|---|---|---|---|---|
|191 / Haiagaru binding 191|`jp.co.airfront.android.a2chMate.haiagaru.bindings191`|2026-11-04T11:23:13.908021+09:00|`build/history-target-option-191.apk`|`662faa8ca27548fd5edb33db571cc34bc3109816d27927c1cd42207a0417beec`|
|226 / Haiagaru binding 226|`jp.co.airfront.android.a2chMate.haiagaru.bindings226`|2026-11-04T11:23:43.716830+09:00|`build/history-target-option-226.apk`|`38c492c15800723f376b88eef23fa71ffbaf66985c6bd02ced46905877fb05a3`|
|242 / Haiagaru binding 242|`jp.co.airfront.android.a2chMate.haiagaru.bindings242`|2026-11-04T11:24:02.697876+09:00|`build/history-target-option-242.apk`|`baab10bf1a10aea3a9a7cea4f3ce1b67be79b145740bf4573d706687de62c81f`|


## 2026-11-04 共有NGチェック直接操作・履歴初期オフ

emulator-5580 / Android16。bindings3版を既知実APK hashと署名照合後install-r成功、データ保持。共有NG本番dialogの合成条件でcheckbox/文字それぞれ実タップと保存、各版検索9/履歴48成功、新規対象app crashなし。MPP `build/shared-ng-toggle-defaultoff.mpp` SHA256 `d3bc222fab6e1faca1e210fd379145ecad9ed6d378ff9ec5fc49e544cf34fc25`。cert `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、alias Morphe。絶対パス・署名鍵の場所を含む原本 `build/local-development-records/shared-ng-toggle-defaultoff-installations.json`。

|版 / 表示名|package|導入日時 JST|APK|SHA256|
|---|---|---|---|---|
|191 / Haiagaru binding 191|`jp.co.airfront.android.a2chMate.haiagaru.bindings191`|2026-11-04T11:45:21.868147+09:00|`build/shared-ng-toggle-defaultoff-191.apk`|`115d89cb1116762e035859680babf4364e121b03f7a3e4985cd78bef53a048a8`|
|226 / Haiagaru binding 226|`jp.co.airfront.android.a2chMate.haiagaru.bindings226`|2026-11-04T11:45:29.913699+09:00|`build/shared-ng-toggle-defaultoff-226.apk`|`17bdced32197d9aea84fc6c5d9f83e77eac83d9a3f081ea21717460d7343ef1c`|
|242 / Haiagaru binding 242|`jp.co.airfront.android.a2chMate.haiagaru.bindings242`|2026-11-04T11:45:36.847503+09:00|`build/shared-ng-toggle-defaultoff-242.apk`|`6b282ff23600ed5f9160fc2b07dda3cb9b023ac1821f8aca547eeaa9a4030910`|


## 2026-11-04 共有NG再描画・通知監視管理の最終候補（エミュレータ）

- Haiagaru binding 191 / ChMate 191 dev / serial `emulator-5580` / package `jp.co.airfront.android.a2chMate.haiagaru.bindings191`
  - APK: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\shared-ng-rule-choice-model-191.apk`
  - APK SHA256: `be3294288b0a0f415bae965cfc80bf7669c289e23f683e6677f38f42ec2c753e`
  - MPP: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\shared-ng-rule-choice-model.mpp`
  - MPP SHA256: `2b6286a99b7c56df0a525e5c86a4a20bef20328e8c1f5092274ad6e437185a7d`
  - 署名証明書 SHA256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
  - 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
  - 導入: 2026-11-04T14:27:19.700470+09:00 / signature matched, install-r Success; existing isolated app data retained
- Haiagaru binding 226 / ChMate 226 dev / serial `emulator-5580` / package `jp.co.airfront.android.a2chMate.haiagaru.bindings226`
  - APK: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\shared-ng-rule-choice-model-226.apk`
  - APK SHA256: `471dfca4f8ba8d29079a78e002274ff9126e8b68b6e1afc1c8db04decf9c7db8`
  - MPP: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\shared-ng-rule-choice-model.mpp`
  - MPP SHA256: `2b6286a99b7c56df0a525e5c86a4a20bef20328e8c1f5092274ad6e437185a7d`
  - 署名証明書 SHA256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
  - 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
  - 導入: 2026-11-04T14:27:26.477963+09:00 / signature matched, install-r Success; existing isolated app data retained
- Haiagaru binding 242 / ChMate 242 dev / serial `emulator-5580` / package `jp.co.airfront.android.a2chMate.haiagaru.bindings242`
  - APK: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\shared-ng-rule-choice-model-242.apk`
  - APK SHA256: `1a73b1187e6ce98aaa03e2d2c54344fcf637dd4253ceeb535c3515afc9cf9f31`
  - MPP: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\shared-ng-rule-choice-model.mpp`
  - MPP SHA256: `2b6286a99b7c56df0a525e5c86a4a20bef20328e8c1f5092274ad6e437185a7d`
  - 署名証明書 SHA256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
  - 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
  - 導入: 2026-11-04T14:27:32.388415+09:00 / signature matched, install-r Success; existing isolated app data retained

各版: 通知22/設定9/返信11/backup40/native order10成功、監視管理実タップ10操作成功。共有NG checkbox/文字の実表示OFF→ON→OFFと保存成功、検索15/履歴48成功。元native delegate/register/branch保持、host order115成功。新規対象app crashなし。設定・通知権限・wm size・WiFi ON/mobile OFFを復元しAVDデータ保持停止。実機未操作。元台帳build/local-development-records/shared-ng-rule-choice-model-installations.json、集約build/shared-ng-watch-final-verification.json、詳細docs/shared-ng-redraw-watch-management-20261104.md。


## 2026-11-04 標準テンプレート更新の検証候補

- Haiagaru binding 191 / ChMate 191 dev / serial `emulator-5580` / package `jp.co.airfront.android.a2chMate.haiagaru.bindings191`
  - APK: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\ua-android14-191.apk`
  - APK SHA256: `f0e479fb6009c2b23d666233f3e89f8c19461d510288b5e1683c6a55c4b71a47`
  - MPP: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\ua-android14.mpp`
  - MPP SHA256: `b21af73820ae0de7adf77a3854bc46749c3ef91b87e121a3fb29fbbfc3c2b008`
  - 署名証明書 SHA256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
  - 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
  - 導入: 2026-11-04T14:57:01.619882+09:00 / signature matched, install-r Success; existing isolated app data retained
- Haiagaru binding 226 / ChMate 226 dev / serial `emulator-5580` / package `jp.co.airfront.android.a2chMate.haiagaru.bindings226`
  - APK: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\ua-android14-226.apk`
  - APK SHA256: `c46f3cfe7a46b12f23c5c3b07be934741504c4d93d27700648e1868eb92ffaf1`
  - MPP: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\ua-android14.mpp`
  - MPP SHA256: `b21af73820ae0de7adf77a3854bc46749c3ef91b87e121a3fb29fbbfc3c2b008`
  - 署名証明書 SHA256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
  - 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
  - 導入: 2026-11-04T14:57:09.042100+09:00 / signature matched, install-r Success; existing isolated app data retained
- Haiagaru binding 242 / ChMate 242 dev / serial `emulator-5580` / package `jp.co.airfront.android.a2chMate.haiagaru.bindings242`
  - APK: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\ua-android14-242.apk`
  - APK SHA256: `897010815da0f5b0b1f11ec390b39685c618868059fd16a2935e5b5d60dc3cad`
  - MPP: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\ua-android14.mpp`
  - MPP SHA256: `b21af73820ae0de7adf77a3854bc46749c3ef91b87e121a3fb29fbbfc3c2b008`
  - 署名証明書 SHA256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
  - 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
  - 導入: 2026-11-04T14:57:14.859178+09:00 / signature matched, install-r Success; existing isolated app data retained

各版起動・設定/テンプレート/移行/オフ/独自値/標準HTTPヘッダー保持21項目成功。通信/投稿なし、新規対象app crashなし。設定復元・wm size reset/WiFi ON/mobile OFF・AVDデータ保持停止。実機未操作。原本build/local-development-records/ua-android14-installations.json、詳細docs/ua-android14-20261104.md。


## 2026-11-04 共有NG除外・標準チェック一覧（未公開候補）

- Haiagaru binding 191 / ChMate 191 dev / serial `emulator-5580` / package `jp.co.airfront.android.a2chMate.haiagaru.bindings191`
  - APK: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\shared-ng-native-choice-191.apk`
  - APK SHA256: `143099a8d8dbb475b59b58772a50d4c21d0c89fe640689f87e145a0314e26254`
  - MPP: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\shared-ng-native-choice.mpp`
  - MPP SHA256: `06ae8093a08baf40ef23916c593b7466034e08967785be0f794604fb13a2e721`
  - 署名証明書 SHA256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
  - 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
  - 導入: 2026-11-04T16:26:03.460685+09:00 / signature matched, install-r Success; existing isolated app data retained
- Haiagaru binding 226 / ChMate 226 dev / serial `emulator-5580` / package `jp.co.airfront.android.a2chMate.haiagaru.bindings226`
  - APK: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\shared-ng-native-choice-226.apk`
  - APK SHA256: `8ce631b422580b3b5d667113b87762354734f088f990c2f81bf1e1b8a477f866`
  - MPP: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\shared-ng-native-choice.mpp`
  - MPP SHA256: `06ae8093a08baf40ef23916c593b7466034e08967785be0f794604fb13a2e721`
  - 署名証明書 SHA256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
  - 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
  - 導入: 2026-11-04T16:26:09.939249+09:00 / signature matched, install-r Success; existing isolated app data retained
- Haiagaru binding 242 / ChMate 242 dev / serial `emulator-5580` / package `jp.co.airfront.android.a2chMate.haiagaru.bindings242`
  - APK: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\shared-ng-native-choice-242.apk`
  - APK SHA256: `b218664ee15f15208ada8db92aeae2b193ce66419f9f18a1116c7949372601d2`
  - MPP: `C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\shared-ng-native-choice.mpp`
  - MPP SHA256: `06ae8093a08baf40ef23916c593b7466034e08967785be0f794604fb13a2e721`
  - 署名証明書 SHA256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
  - 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
  - 導入: 2026-11-04T16:26:16.229509+09:00 / signature matched, install-r Success; existing isolated app data retained

3版で親メニューの実タップ→SharedNgResponseExclusion.handle→本番showResponseExclusionsへ。チェック右端/文字実タップの表示OFF→ON→OFF/保存成功。12条件検索/隠れ選択保持/全条件画面へ再表示の実タップ成功。検索model15/UA21各版成功。新規対象app crashなし。合成条件はメモリ内のみ、設定/static復元、通信/投稿/GAS変更なし。親は検証用メニューで、実スレ長押し起点の通し試験とは区別する。AVD表示/network復元・データ保持停止。原本build/local-development-records/shared-ng-native-choice-installations.json。

## 2026-11-04 未読スレ表示の静的最適化候補（生成のみ）

- 表示名: Haiagaru binding 191 / ChMate 0.8.10.191 dev
- package: `jp.co.airfront.android.a2chMate.haiagaru.bindings191` / versionCode `2147483647`
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/unread-open-optimized-191.apk`
- APK SHA256: `2d74f4bfa29a45a8ec0c12076cf56b61105d810aa03fc01f8fa7c71902533ee9`
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/haiagaru-unread-open-optimized.mpp`
- MPP SHA256: `930c13adaba1462d7bdc06424391474d17dd7f8d48bb6409cf7e8e39e47e3b77`
- 署名証明書SHA256（生成APKで照合）: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
- 端末シリアル/導入日時: 該当なし。今回APK生成のみ、ADB導入なし。
- 結果: 適用・署名検証・191 AAの元命令/レジスター保持とwrapper検査成功。端末起動/画面/速度未確認。内部dev.9表記はローカル候補であり、公開dev.9とは異なる。


## 2026-11-04 226/242確認・3版AA最適化候補（生成のみ）

全APKは生成・署名検証のみ。端末シリアル・導入日時は該当なし、ADB導入なし。鍵は `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`。全証明書SHA256は `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。内部dev.9表記は未公開候補。

- Haiagaru binding 226 / ChMate 226 dev / package `jp.co.airfront.android.a2chMate.haiagaru.bindings226`
  - APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/unread-open-optimized-226.apk`
  - APK SHA256: `b5f78f7405216afeb81af79a99e65ffb55fc15d438451d49d85fa28f136e292a`
  - MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/haiagaru-unread-open-optimized.mpp`
  - MPP SHA256: `930c13adaba1462d7bdc06424391474d17dd7f8d48bb6409cf7e8e39e47e3b77`

- Haiagaru binding 242 / ChMate 242 dev / package `jp.co.airfront.android.a2chMate.haiagaru.bindings242`
  - APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/unread-open-optimized-242.apk`
  - APK SHA256: `cb794dcce6d200b01eec69f518b975b74f90b4888c1a068130de63bc83f6fcae`
  - MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/haiagaru-unread-open-optimized.mpp`
  - MPP SHA256: `930c13adaba1462d7bdc06424391474d17dd7f8d48bb6409cf7e8e39e47e3b77`

- Haiagaru binding 191 / ChMate 191 dev / package `jp.co.airfront.android.a2chMate.haiagaru.bindings191`
  - APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/unread-open-optimized-all-191.apk`
  - APK SHA256: `c9da59d3f355e791322148f15b54eee01c281867376e6193047f40e1589a3652`
  - MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/haiagaru-unread-open-optimized-all.mpp`
  - MPP SHA256: `7f33fe3d952958748119cc22f565afe695f878ec31cb75e9d0037d149b6914df`

- Haiagaru binding 226 / ChMate 226 dev / package `jp.co.airfront.android.a2chMate.haiagaru.bindings226`
  - APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/unread-open-optimized-all-226.apk`
  - APK SHA256: `df0a04579afb3400c2e38ec28ba5eb67b19b0bf3e3c3d2d47f49555638beadfa`
  - MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/haiagaru-unread-open-optimized-all.mpp`
  - MPP SHA256: `7f33fe3d952958748119cc22f565afe695f878ec31cb75e9d0037d149b6914df`

- Haiagaru binding 242 / ChMate 242 dev / package `jp.co.airfront.android.a2chMate.haiagaru.bindings242`
  - APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/unread-open-optimized-all-242.apk`
  - APK SHA256: `dca42a8cc3cbeb7f3f3022b647d6d59bdafb0a5271bdbc85d04023cf02ac8a2a`
  - MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/haiagaru-unread-open-optimized-all.mpp`
  - MPP SHA256: `7f33fe3d952958748119cc22f565afe695f878ec31cb75e9d0037d149b6914df`

先行226/242 APKは191だけAAフックの候補。最終all候補は3版AAフック・native null判定保持。最終3版の元命令/分岐/register・wrapper検査成功。端末起動/表示/速度未確認。証跡: `build/unread-open-optimized-all-verification.json`。

## 2026-11-04 実機191既存更新候補（署名相違で未導入）

- 対象: XIG05 / serial `730eae72` / ChMate 0.8.10.191 dev / 表示名 `Haiagaru`
- package: `jp.co.airfrt.android.chMate.haiagartu`（既存と同じ大文字M、利用者の更新指定）
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/haiagartu-device191.apk`
- APK SHA256: `e7bb78e0cd3f78fd0e2b178432b5d57de00f015d5874a64b8eaacb4b8132af06`
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/haiagaru-shared-ng-match-order.mpp`
- MPP SHA256: `b5ec9e11f10c6e18da1f36ace614732b29238ade4878274b1e095b4b85ed4246`
- 生成署名cert SHA256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
- 生成鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
- 既存cert SHA256: `bc78368b1426256afede71c43e87582e1481a56fe2ee45021d2ccc0fe9b6e7d5`（minSDK24でV2検証）
- 導入日時: 該当なし。生成・package/署名確認のみ。既存と署名が異なるためinstall未実行、データ保持。利用者がMorpheから既存鍵を書き出すと回答し保存先を確認中。
- 内部dev.12の未公開候補。通常Lint最終build2m28s成功。起動/本文/画像/実速度未検証。

## 2026-11-04 21:42 JST 既存haiagartu191へ更新成功

利用者の「一回インストールしてみて」に従い、上記候補をserial `730eae72`へ `adb install -r` で1回試行しSuccess。実package `jp.co.airfrt.android.chMate.haiagartu` / label Haiagaru / ChMate191 dev / versionCode2147483647。lastUpdateTime2026-11-04 21:42:18、firstInstallTime2026-10-31 23:28:05を維持。アンインストール/データ消去なし。取得した導入済base.apkと候補APKのSHA256は `e7bb78e0cd3f78fd0e2b178432b5d57de00f015d5874a64b8eaacb4b8132af06` で一致。

使用MPP SHA256 `b5ec9e11f10c6e18da1f36ace614732b29238ade4878274b1e095b4b85ed4246`、生成署名はPC鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias Morphe / cert `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。利用者提供Morphe.p12は開けず未使用、秘密値は記録しない。既存certと異なったが、この実機で更新は受理された。受理理由は未特定で、一般に署名相違で更新可能とは判断しない。

初回起動コマンドは存在しないMainActivity指定でError type3、manifest/resolve-activityでHomeActivityを確認して修正。HomeActivityのcold起動Status ok、TotalTime2233ms（スレ表示時間ではない）。crash bufferの取得範囲に導入後の対象package fatalなし（他appの古いログは対象外）。実スレ/本文/画像/共有NG速度/設定内容の実動作は未確認。

## 2026-11-04 22:02 JST 共有NG再利用・SAF再選択候補を実機更新

- 端末: XIG05 / serial `730eae72`
- 表示名 `Haiagaru` / ChMate 0.8.10.191 dev / versionCode `2147483647` / package `jp.co.airfrt.android.chMate.haiagartu`
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/haiagartu-incremental-ng-saf191.apk`
- APK SHA256: `11a058d42ef655e4f21a1977db8b45c8de7b8b70478867562172538f08fefe2b`
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/haiagaru-incremental-ng-saf.mpp`
- MPP SHA256: `d4428ce794f1b1ef457038ba9f52b13417ce4cbd070cec26de2e636b38729000`
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
- cert SHA256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`（端末旧base.apk/生成APKを両方検証し一致）
- 導入: lastUpdateTime `2026-11-04 22:02:24` JST / install-r Success。firstInstallTime `2026-10-31 23:28:05` 維持、アンインストール/データ消去なし。
- 導入後base.apk再取得SHA256は生成APKと一致。191 batch NG native hook検査PASS、HomeActivity cold起動Status ok（TotalTime2276msはスレ表示時間ではない）、取得crash bufferに対象appの新規fatalなし。
- 今回のSAF実選択/キャンセル・共有NG再表示の端末動作/実速度は未確認。内部dev.12の未公開候補で公開dev.12とは異なる。

## 2026-11-04 22:40 JST 正常な正規表現非一致の再利用を実機更新

- 端末: XIG05 / serial `730eae72`
- 表示名 `Haiagaru` / ChMate 0.8.10.191 dev / versionCode `2147483647` / package `jp.co.airfrt.android.chMate.haiagartu`
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/haiagartu-shared-ng-regex-stability191.apk`
- APK SHA256: `3827c3a64453cf128efd25f8e3b640a893c9e5a72e06f7053f352eb3de53823a`
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/haiagaru-shared-ng-regex-stability.mpp`
- MPP SHA256: `8b325a2c488bd79af2c51e16c99b5bc8bf03eff62d4efd913ef94d6381880dd9`
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
- cert SHA256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`（更新前実APKと候補APKを照合）
- 導入: `2026-11-04 22:40:29` JST / install-r Success。firstInstallTime `2026-10-31 23:28:05` 維持、アンインストール/データ消去なし。
- 端末base.apk SHA256一致。191 batch NG hook検査PASS、HomeActivity cold起動Status ok、PID20089の取得crash buffer空。TotalTime2462msはアプリ起動でありスレ表示の測定値ではない。
- 利用者の現在設定を維持。導入後に「かなり早くなりました」と実機の改善報告あり。改善幅の定量計測・全スレ/226/242での実速度検証は未実施。内部dev.12の未公開候補、公開Releaseなし。


## 2026-11-05 配布前のローカル候補記録
先行初回軽量化候補は実機730eae72へ2026-11-04 22:58:34 JSTに同一署名更新成功。package `jp.co.airfrt.android.chMate.haiagartu` / 表示名Haiagaru / ChMate191 / APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/haiagartu-shared-ng-first-open191.apk` / APK SHA256 `20d84182296ef2fe84bb5cb77558bbd03fc14aad68a7f1ec229246c9df699ee6` / MPP SHA256 `67c00d58af8938fbdfb36bba49a6e20ce432a044473646e2d70c71371096bf71`。端末base.apk SHA一致、起動ok、PID11255のcrash buffer空。再利用設定の件数・文字数とも999999999維持。
- 実機730eae72 / ChMate191 / 表示名Haiagaru NG確認 191 / package `jp.co.airfront.android.a2chMate.haiagaru.reporter191` / APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/reporter-blocks-191-isolated.apk` / SHA256 `92aabb2252a2900fe740e5bac93b570c318ec4e5b9d0d2e3acf9aa50963f678a` / MPP `45d33a0874c78529a294aa283639b98e57bc323c5bc5b924bc063d9cc62e8e13` / 導入 2026-11-04 23:44:24 JST、install-r Success。起動以外の設定操作は未確認。
- 実機730eae72 / ChMate226 / 表示名Haiagaru NG確認 226 / package `jp.co.airfront.android.a2chMate.haiagaru.reporter226` / APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/reporter-blocks-226.apk` / SHA256 `36b7c3750535d9aac0638ee6b96686be20c0b44e51c890f8e006544990f210b2` / MPP `45d33a0874c78529a294aa283639b98e57bc323c5bc5b924bc063d9cc62e8e13` / 導入 2026-11-04 23:25:16 JST、install-r Success。226はAndroid標準Instrumentationで12項目成功。
- 実機730eae72 / ChMate242 / 表示名Haiagaru NG確認 242 / package `jp.co.airfront.android.a2chMate.haiagaru.reporter242` / APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/reporter-blocks-242.apk` / SHA256 `a31bc3f83b05a1590250332f512fa5f700baf8660b182f4bf4fa215721c7eb5c` / MPP `45d33a0874c78529a294aa283639b98e57bc323c5bc5b924bc063d9cc62e8e13` / 導入 2026-11-04 23:25:32 JST、install-r Success。起動以外の設定操作は未確認。
上記候補の鍵は `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe` / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。3版のbatch NG hook検査成功。元アプリの削除・データ消去なし。最終の最低限構成差分は未導入で、これらを最終配布物そのものの実機検証とはしない。Instrumentationは同じ鍵で署名した `build/reporter-inst-226.apk` / package `app.haiagaru.tests.reporter226` / SHA256 `a724728a5bcef42543e3ef82b59cfa3673c4fd202270f3fb40be2bca42211b37`（現在ファイルは後続テスト追加版のため、実行した12項目版とは区別）。


2026-11-05 242サムネイル開始callback検証
端末emulator-5580/API36、package jp.co.airfront.android.a2chMate.haiagaru.reporter242、表示名Haiagaru NG確認 242、ChMate0.8.10.242 dev。既存鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\thumbnail-third-loading242.apk SHA256 b0519ab3c229d587f9fe409c6422ad443eea2fabf3ec29befaaa77726b1d4a36、MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\thumbnail-third-loading.mpp SHA256 4aa26499fb00f76e6ea9928ea8127e6dc9a250f08c496e2c5bab238f0cd9eb2f。install-r成功。前候補reporter-kenmo-final-242.apkから同署名更新、アンインストール/データ消去なし。署名一致のapp.haiagaru.tests.thumbnail242 instrumentationで旧1/新106成功。実機変更なし。


2026-11-05 正式版候補の最低限検証
対象API36/emulator-5580。すべて同既存署名（key C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed）のinstall-r更新、データ消去/アンインストールなし。使用MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\official1230-final.mpp SHA256 38c864bb5955a1b9569a6c70671feddc7e471a3276bae81506bcab52b00691f8。
- ChMate0.8.10.191 dev、package jp.co.airfront.android.a2chMate.haiagaru.reporter191、表示名Haiagaru NG確認 191、APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\official1230-final191.apk SHA256 5ab536dac7fcd73d00a29ad74784cfe22a7ad74b1c2e1ffe41213096da026aad、更新/起動成功。Shizukuは226のみ選択、191/242は未選択。native画像検査110成功。
- ChMate0.8.10.226 dev、package jp.co.airfront.android.a2chMate.haiagaru.reporter226、表示名Haiagaru NG確認 226、APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\official1230-final226.apk SHA256 5c6366e70c03bd2afd546542f8d91562573fe507566d5063613638108c30a76c、更新/起動成功。Shizukuは226のみ選択、191/242は未選択。native画像検査110成功。
- ChMate0.8.10.242 dev、package jp.co.airfront.android.a2chMate.haiagaru.reporter242、表示名Haiagaru NG確認 242、APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\official1230-final242.apk SHA256 56827c1948602b14bc97e9bb3fe75a7ffd2bddba80c3c4204ddb5cba00166a85、更新/起動成功。Shizukuは226のみ選択、191/242は未選択。native画像検査106成功。
226の同署名app.haiagaru.tests.archive226で、合成SAF/ZIP移行8と合成AIDLによるShizukuコピー9成功。test作業ファイルは所有fixture領域だけ削除。今回ユーザー実機へ導入していない。最後のZIPパス2点/完了Dialog guardを反映した公開用MPPは別SHAで、integration-status.md参照。

## 2026-11-05 検索Back・再生マーク修正の隔離試験
API36/emulator-5580、2026-11-05 12:23〜12:25 JST。既存reporter各packageと新APKの署名一致をInstallVerifiedApk.ps1で確認してinstall-r成功。既存データ保持、アンインストール/データ消去/実機変更なし。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
共通MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/search-back-overlay.mpp / SHA256 2a508401850fb4f5ea5c06359637a53cc5c668cc9fe1fbe4986d7217ba1443af。
- ChMate191 / 表示名Haiagaru NG確認 191 / package jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/search-back-overlay191.apk / SHA256 730e14d02cebb8543c477470806cf2ca7a15d65d2d20793c59c26f757cd17f8f / 更新・起動・native合成123項目成功。
- ChMate226 / 表示名Haiagaru NG確認 226 / package jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/search-back-overlay226.apk / SHA256 96430c41fb45707c06860d5c3426d520d225b7948b1eff93463c523c703bf729 / 更新・起動・native合成121項目成功。
- ChMate242 / 表示名Haiagaru NG確認 242 / package jp.co.airfront.android.a2chMate.haiagaru.reporter242 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/search-back-overlay242.apk / SHA256 90bb45659c888506ef0286354f5aa26b4726b429d458235de1b64f8fb012437b / 更新・起動・native合成121項目成功。
同署名のapp.haiagaru.tests.thumbnail191/226/242 instrumentationも更新。build/search-overlay-inst/test{191,226,242}.apk、元ソースscripts/ThumbnailLoadingInstrumentation.java。旧版比較は各3/1/5項目、新crash buffer空。実スレ操作は自動承認拒否で未実施。AVD停止、未公開候補。

## 2026-11-05 開いているタブ更新・UA・NGダイアログ候補
端末API36/emulator-5580、最終導入/検証2026-11-05 17:35〜17:45 JST。全版既存reporter packageの証明書をpullして照合しinstall-r、削除/データ消去なし。key C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
共通MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/open-tabs-ua-ng-parsefix.mpp / SHA256 91ecd109f05e40c6029953dad0246fae123fd2d52fb2b59ae2e776ef2bf8ce9b。
- ChMate191 / Haiagaru NG確認 191 / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/open-tabs-ua-ng-parsefix191.apk / SHA256 165c2173469b0a19edb9eb786bd835b41e085a5725e5df9fbe0aa143a4bca602 / install-r・起動・合成30項目成功。
- ChMate226 / Haiagaru NG確認 226 / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/open-tabs-ua-ng-parsefix226.apk / SHA256 00fd972e1d0403fa5ee9f73ca2fba81f388c815c46025e60af4c5339722a04ea / install-r・起動・合成30項目成功。
- ChMate242 / Haiagaru NG確認 242 / jp.co.airfront.android.a2chMate.haiagaru.reporter242 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/open-tabs-ua-ng-parsefix242.apk / SHA256 d6b6139f4c005e4576f9d6f0083a225dd5a06d157d75907f1d407965c2c80c45 / install-r・起動・合成30項目成功。
同署名試験APK build/open-tabs-inst/test{191,226,242}.apk、試験package app.haiagaru.tests.opentabs{191,226,242}、scripts/OpenTabsInstrumentation.java。最終open-tabs-core-runtime各30で通信requestをenqueueせず、最終crash buffer空。実Tablet activityの追加試験失敗とエミュレータ停止/再起動、失敗した226試験のnative tablet設定復元完了未確認はintegration-status参照。実機導入なし、未公開。


2026-11-05 1.24.0公式公開候補・追加タブレット検証完了
追加試験のActivity終了はテストpackageの初回StartActivity未完了が原因。初期設定を完了し、試験側の同期Activity待機を非同期起動/現在Activity取得へ修正。製品コード変更なし。API36/emulator-5580で191/226/242各33（core30+live tablet3）計99項目成功、実通信0。build/official1240-tablet191-final.log、official1240-tablet226-final.log、official1240-tablet242-async.log。最終official1240-final-crash.log空。AVDはデータ保持で正常停止。前記の失敗を成功件数に含めない。UAホスト19/native hook全版検査/最終ビルドは既記録を使用。実通信一括更新・実機連続操作未確認を公開説明に明記。既存Semantic Release CIからdev→masterの公式公開へ進む。


## 2026-11-05 確認間隔/開タブUI更新候補
API36/emulator-5580。既存reporter全版の証明書をpull照合後install-r、削除/データ消去なし。key C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/interval-live-tabs-final.mpp / SHA256 ba7d5e58004cb6f225d3bd674e2734dceb6665c320ee2ccb65d5ccd55055d55e。
- ChMate191 / Haiagaru NG確認 191 / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/interval-live-tabs191.apk / SHA256 d9d5e1ab793a3585c5be392acdd776dc30ff5e3f28e9888c0f2a71f4ff9675ad / install-r成功、core33成功。
- ChMate226 / Haiagaru NG確認 226 / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/interval-live-tabs226.apk / SHA256 74b9eca5642c432faa7a2871ccc48b86bdb71d01d6dfabcfe7f181cd4b09e035 / install-r成功、core33成功。
- ChMate242 / Haiagaru NG確認 242 / jp.co.airfront.android.a2chMate.haiagaru.reporter242 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/interval-live-tabs242.apk / SHA256 d32ee1c75d7fad3690b34c4d284e8ebb7e927141204d74824fbc0caf7b80c4d9 / install-r成功、core33成功。
試験APK build/open-tabs-inst/interval{191,226,242}.apk、app.haiagaru.tests.opentabs{191,226,242}、同署名更新。242追加NotificationNavigationInstrumentationの実UI6項目成功。初回SystemUI ANRによる失敗は再試験と区別（integration-status参照）。最終crash空、AVD正常停止、実機導入なし。

## 2026-11-05 23:44 実機の動画サムネイル操作候補
端末730eae72 / Xiaomi XIG05。利用者指定の既存検証用191を証明書pull照合後にinstall-r成功。削除/データ消去なし。使用中カスタムパッケージは更新なし。
表示名 Haiagaru NG確認 191 / ChMate 0.8.10.191 dev / package jp.co.airfront.android.a2chMate.haiagaru.reporter191。
APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/thumbnail-controls191.apk / SHA256 00f11175d1732e87657749532bf6a7e86d9554a478d7b22729387b73bbf1cee9。
MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/thumbnail-controls-final.mpp / SHA256 1a0aeaf6c76a792e07d8683fb4b8643fe7144cc8b02e1144c20d8e9c9e3fe357。
署名key C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
ビルド thumbnail-play-final-build.log 成功3m36s/91tasks、191適用成功、署名照合/上書き成功/pm pathの更新先を確認。起動操作後は別アプリが前面だったため、継続起動と報告動画の表示成功は未確認。crash bufferにこのpackageの新規AndroidRuntimeログは見られないが、起動成功とは扱わない。再取得/再生UIとプレリリース確認は継続中。バージョン文字列1.24.1は開発元の現行値であり、この候補は未公開。
先行候補の実機導入: build/boards-links-video191.apk / SHA256 0b2241d256681e98129bfc5e7685ff19cd217f8bcebcec8f7cc5d9be16022c93、MPP build/boards-links-video-candidate.mpp / SHA256 d42311ede5171091fb69be98da2d3e6a181bd92985dce453d33622bad9bf495f、同package/署名/端末install-r成功。今回候補で更新済み。

## 2026-11-06 動画サムネイル・設定リンク・外部板の最終検証候補
MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/prerelease-detach-final.mpp / SHA256 a7c36112329345557965631d2f2b6ed1c4fd6873ac2e4223fc9f753193f87609。署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
各版の既存署名をpull照合後install-r。アンインストール/データ消去なし。Mi Note 10（d5497008）への導入は利用者が明示許可、起動確認はRUNNING_LOCKEDのため未実施。元のXIG05（730eae72）はこの最終候補では未更新。
- ChMate191 / Haiagaru NG確認 191 / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/prerelease-detach191.apk / SHA256 516eaf92729faec0dbc2dfd91f6ebce28d46e8409dafa46ca7baac3eed13856b / emulator-5580とd5497008のinstall-r成功。エミュレータ起動・変更UI検証成功。
- ChMate226 / Haiagaru NG確認 226 / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/prerelease-detach226.apk / SHA256 b321f08f8d981d96452f9aea6a40e20868d7a33f3840736202371a5d742a4709 / emulator-5580とd5497008のinstall-r成功。エミュレータ起動・変更UI検証成功。
- ChMate242 / Haiagaru NG確認 242 / jp.co.airfront.android.a2chMate.haiagaru.reporter242 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/prerelease-detach242.apk / SHA256 0b6e84dc76259557885e9dd75bff485bb505fc057ea8e05fdace89e2a5e8696a / emulator-5580とd5497008のinstall-r成功。エミュレータ起動・変更UI検証成功。
試験APK build/open-tabs-inst/publish{191,226,242}.apk。API36/emulator-5580で各80項目（失敗画像/再取得/再生12、native連続表示9、設定リンク実UI30、外部板20、合成AVC/停止後復帰9）計240項目成功。226の検索メニュー5項目を加え計245。新規crash buffer空。設定リンクの日本語書き出し191=184/226=181/242=181項目、統合188設定/394操作、重複名0/リンク化不能0。詳細publish*.log、detach226*.log。
途中候補はSystem UI ANRや低メモリ・空PNG、試験側の起動待機/古いAccessibilityノードで失敗し、試験を修正した最終成功と区別。空PNGと画面閉じ時のView取り外しを製品側で修正。最終候補の実スレ本文追加起動は自動承認レビュー拒否（詳細理由なし）により未実施、報告実動画/実機連続操作の未確認範囲は公開説明に記載。AVDの一時解像度/densityをreset後、データ保持正常停止。

## 2026-11-06 動画レイアウト/226検索メニュー修正のエミュレータ検証

- serial emulator-5580 / API36 / ChMate226 / 表示名 Haiagaru NG確認 226 / package `jp.co.airfront.android.a2chMate.haiagaru.reporter226`。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/layout-search226.apk` / SHA256 `940c5568700130dcd72190f5546eb72ada71365af36c555f9eec37fbff2c7e04`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/layout-search226-final.mpp` / SHA256 `af48610699b3a9e8bfab374f29c33210ed0789b5ac909835455bc2ef000fdec2`。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed` / 鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`。
- 導入日 2026-11-06 JST（詳細時刻はbuild/layout-search226-install-retry.logのファイル時刻）、既存APKのpull完了・署名照合後install-r Success。初回はpull途中切断でhelper安全停止、再接続で完了。既存データ消去/アンインストールなし。
- 226標準Instrumentationメニュー16項目/動画操作12項目成功、crash buffer空。実機導入なし。共通production Retryを用いた隔離FrameLayout128件×8回テスト34項目成功、旧ソースで同じNPEの再現3項目成功。専用試験package `app.haiagaru.tests.layoutmutation` はAndroid標準debug署名（鍵C:/Users/narum/.android/debug.keystore / alias androiddebugkey）でChMateデータにアクセスしない。
- tests APK `build/layout-search-inst226/tests.apk` は同Morphe署名の隔離Instrumentation。実サイトへの投稿なし。AVDは一時解像度/densityを戻してデータ保持停止。配布/Releaseはまだ行っていない。

## 2026-11-07 追加掲示板設定候補の実機導入
利用者が実機インストールを明示。XIG05 / serial 730eae72 / ChMate191 / 表示名 Haiagaru NG確認 191 / package jp.co.airfront.android.a2chMate.haiagaru.reporter191 を既存APKの証明書pull照合後install-r成功。普段使用する別packageの変更・アンインストール・データ消去なし。
APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-standard191.apk / SHA256 26144079c03fcabbb08d8c45ccf5302b31839620dc49a8f52e369108b028677c。
MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-standard.mpp / SHA256 7899cbc41a7cd41219614d23c672fe751f7a6e12853dc58abd35b49150d88dcb。
署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
導入ログ build/site-boards-standard191-device-install.log。HomeActivityへam start受付成功。crash bufferには11/05の旧ログあり、新規クラッシュと混同しない。今回の標準設定スイッチ/サイト本文/投稿の結合動作は未確認。226/242候補APKは生成済みだが今回実機へ未導入。公開なし。

## 2026-11-07 掲示板設定カテゴリ内への移動・実機191更新
利用者指定「設定→掲示板→掲示板設定」の欄内へ追加掲示板を移動。updateBbsMenuを含む標準XMLのルート末尾から、key=bbsのPreferenceCategory直下へ移す。カテゴリが一意でない場合はパッチを失敗させる。初回は非namespace-aware DOMの既存属性取得差で191適用guard失敗し、android:key/namespace両方に対応して修正。既存検証アプリへ失敗APKの導入はなし。
最終通常Lint/R8 build/site-boards-category-final-build.log成功1m18s/91tasks。191完成APKのaapt2 xmltreeでカテゴリ内配置とrename後intentを確認。動作試験scriptにもカテゴリ内配置のassertを追加したがInstrumentation実行は未確認。
実機XIG05 / serial730eae72 / 表示名Haiagaru NG確認191 / ChMate0.8.10.191dev / package jp.co.airfront.android.a2chMate.haiagaru.reporter191 を既存証明書照合後install-r成功、HomeActivity start受付成功。アンインストール/データ消去なし。
APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-category191.apk / SHA256 c643ba4f03379c12d2788df664af90ad7abf580b99cf9d0f43816aa39fc32891。
MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-category.mpp / SHA256 4fbb43afc69a1d2daa6bf5644f68e378d12da530d9274a3838be22b080ce9ae8。
署名key C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。ログbuild/site-boards-category191-install.log。今回配置変更のみで追加サイトの標準画面/投稿の結合未確認・未公開は維持。

## 2026-11-07 設定クラッシュ修正版の実機反映
3版castfix APK生成とaapt2で安全なroot sibling配置/intentを確認。実機XIG05/730eae72のreporter191を同署名install-r成功。SettingActivity起動後に設定UI階層を取得し、追加設定画面（使用する/登録ボタン）と、標準bbspink.comのURL/板の数/使用するダイアログを観測。設定画面操作に伴う新規ClassCastExceptionなし（crash bufferには修正前01:03/01:05が残存）。追加画面の使用するは利用者設定でONだったため変更していない。操作中に画面変化があり、以降の座標操作はせずread-only確認。build/site-boards-castfix-{settings,board-ui,board-final-ui}.xml、before/after-crash.log。
APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-castfix191.apk / SHA256 7ba7c5cf132b37e08ea22f101064cdf7db2a43f4ffb52372d0b602940af71499。
MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-castfix.mpp / SHA256 2c8ecc76573f1ea6b4d27a7007e29df3e74c288f35b6a9b1365e1e2a537128c7。
表示名Haiagaru NG確認191 / ChMate0.8.10.191dev / package jp.co.airfront.android.a2chMate.haiagaru.reporter191 / key C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。導入時刻はbuild/site-boards-castfix191-install.logのmtime。データ消去/アンインストールなし。226/242は未導入。

## 2026-11-07 指定メニュー・投稿拡張の最終候補を実機191へ導入
利用者の再度の実機インストール指示で、XIG05/730eae72の既存「Haiagaru NG確認191」(ChMate0.8.10.191dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191)を同署名install-r成功。データ消去/アンインストールなし。
APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-menu-post191.apk / SHA256 1c2226af2377fb55b94471a0dd1f4c40a7e6938c9b71ea7926636b67f444b199。
MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-menu-post.mpp / SHA256 eff9e9de1d990808556795dd5b98e8aaab29c11171417da1077399882a163886。
鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。導入日時はbuild/site-boards-menu-post191-install.logのmtime。
通常Lint/R8最終 build/site-boards-menu-post-save-state-build.log成功4m12s/91tasks。画像選択Activityの回転時状態保持を含む。更新後実機で隔離Gateway/標準URL parser/subject/DAT/返信/重複抑止144項目と個別Dialog14項目成功。公開投稿0、実掲示板への送信は未検証。background activity start制限に対し、試験の起動のみ前面Home経由へ変更（OS設定の変更なし）。試験後Homeを通常起動。
試験APK build/site-boards-inst/tests191.apk(app.haiagaru.tests.sitegateway191) / build/site-dialog-inst/tests.apk(app.haiagaru.tests.sitedialog191) は同Morphe署名、隔離prefs使用。前段個別設定候補はAPK build/site-boards-individual191.apk SHA256 a484cd2df3b810dd66ef42c3d2f7976a8d183814a183c9b1ea67134884d164e8 / MPP build/site-boards-individual.mpp SHA256 261648c6ae6d9ff3d7dd29f885a5c7ed430ddb57cee89affbcc9063478d2d551、同端末/packageで今回更新済み。
実際の新規スレ/画像/爆サイ確認画面のサイト成功応答、3版の標準スレ画面での連続操作は未確認。試験対応として未公開、push/Releaseなし。

## 2026-11-07 標準サイト統合・エミュレータ191の中間候補

端末 Haiagaru_Root_API36 / emulator-5580。表示名 Haiagaru NG確認 191 / ChMate 0.8.10.191 dev / package jp.co.airfront.android.a2chMate.haiagaru.reporter191。既存証明書pull照合後install-r、データ消去なし。実機730eae72へは今回導入していない。

- 導入 2026-11-07 09:10:56 / 結果 Success。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-roots191.apk / SHA256 6c56fce8f21b4ad3f1ae7b0a44759279effe8789fd597e5c8dacdef88f630cb2。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-roots.mpp / SHA256 006680b03b9c4b5d6a859688c3002adb4dd93acdd184611d88ffaa6a3ccb4622。

- 導入 2026-11-07 09:23:29 / 結果 Success。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-folders191.apk / SHA256 1a097aa09a3521dcca025af29ade94be637f9803d8c285791ea72998bdb578ac。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-folders.mpp / SHA256 748088e129aeee9f6a6850e153a20220eed987fb7d20921f63852189da831ca8。

署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。roots候補は遅延通知/単行BBSMENU不具合を検出し、folders候補でnative registry/parser/group/preference19項目と実標準dialog/toggle操作を含む29項目成功。標準readerの短いID/port修正前の候補であり完成版とはしない。公開なし。

## 2026-11-07 ネイティブ接続の版別中間候補台帳

対象: emulator-5580 / Haiagaru_Root_API36、実機変更なし。各候補は既存reporterパッケージへ証明書照合後install-r、アンインストール・データ消去なし。表示名 Haiagaru NG確認 <版>、ChMate 0.8.10.<版> dev。

- 同署名更新 Success / 2026-11-07 09:29:11。package jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-reader191.apk / SHA256 d5a14a5fcb5e7f2d91f809d9865c1e01702b5d7ddaeeadb457248138e2b6d020。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-reader.mpp / SHA256 cc82ad5b614076eed42fff6cd5cd0719cb8ebf10a4bb4a1574ebe7f421ba0182。

- 同署名更新 Success / 2026-11-07 09:33:09。package jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-reader226.apk / SHA256 885f37e0178c90368c75795aa94d7391afbb56fc442bedf4678dc81171f6c647。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-reader.mpp / SHA256 cc82ad5b614076eed42fff6cd5cd0719cb8ebf10a4bb4a1574ebe7f421ba0182。

- 同署名更新 Success / 2026-11-07 09:35:51。package jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-reader242.apk / SHA256 54fd2c7a0697fb34a3b7fb0eb09c1cc7d38bab43d8aaa16ee11800d7feb4bb3b。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-reader.mpp / SHA256 cc82ad5b614076eed42fff6cd5cd0719cb8ebf10a4bb4a1574ebe7f421ba0182。

- 同署名更新 Success / 2026-11-07 09:38:33。package jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-padding191.apk / SHA256 ca0c4e7a98989719d0427411627b5bdbf9ca0f25acb00b026044f868aaa18abe。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-padding.mpp / SHA256 8e5d3d92d7101e3fbd6c9f9c7058e24f13d9b05bbd7c680b2e7dc7ae1e666063。

- 同署名更新 Success / 2026-11-07 09:41:47。package jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-padding226.apk / SHA256 68304dc3a40613250758d7e2bd29df569ece42c3f7072f13f48e993bf70556f6。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-padding.mpp / SHA256 8e5d3d92d7101e3fbd6c9f9c7058e24f13d9b05bbd7c680b2e7dc7ae1e666063。

- 生成済み・未導入。package jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-padding242.apk / SHA256 91218efa31ca6e2bbd458d9b86f1ca39ed90d67007b2350dbd0ee36c8a51ce65。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-padding.mpp / SHA256 8e5d3d92d7101e3fbd6c9f9c7058e24f13d9b05bbd7c680b2e7dc7ae1e666063。

- 同署名更新 Success / 2026-11-07 09:48:46。package jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-tablet226.apk / SHA256 3ded7cc4a19042c4c11fbf1c1c319da05611d35ff802cf9dd9bba253fed81313。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-tablet.mpp / SHA256 fa77dc53b36a5bf2de9de7313aace801bfd8a1eb2eb0a672ce553d1c0b73df3a。

- 生成済み・未導入。package jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-tablet242.apk / SHA256 dd90029fdaa907d30d6db9cc6efd2647a68fd481059bca8f6ef269ddf1d19ebe。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-tablet.mpp / SHA256 fa77dc53b36a5bf2de9de7313aace801bfd8a1eb2eb0a672ce553d1c0b73df3a。

- 同署名更新 Success / 2026-11-07 09:54:06。package jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-final226.apk / SHA256 26b542e2a23785a1f71b964004a96bf1a1fc39d4a4c544b62d2cc99128299345。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-final.mpp / SHA256 a353daab9681162eccd21e207b9039bbebf2f87f82ae25f06a10bf1b17e37622。

- 同署名更新 Success / 2026-11-07 09:55:42。package jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-final242.apk / SHA256 aa677869f558f7472cb2a35cb0328a1e11baca3ea280f1b4dfb22a53da91d2d4。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-final.mpp / SHA256 a353daab9681162eccd21e207b9039bbebf2f87f82ae25f06a10bf1b17e37622。

署名は全候補とも C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。191 paddingは実標準3サイトreader/editorを含む166、226 finalはtablet経路を含む172成功。242 finalはHTTPS昇格のため本文0件で未完了、修正中。Release/pushなし。

## 2026-11-07 標準追加掲示板の最終検証候補

全候補共通: C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-verified.mpp / SHA256 0ae3492a530a9095d979abb6388d4c0b3b932f5a5829f5eafb6738562a87083e。署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。対象 emulator-5580、実機変更なし。既存署名照合後のinstall-r Success、データ消去なし。

- 2026-11-07T10:09:20+09:00: Haiagaru NG確認 191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-verified191.apk / SHA256 437f6f54bf751d0c48cf196cef312ce2d4a5f4d025a43f9836b8fb79d6fada1e。core 19、実reader/editorとgateway 191項目成功。

- 2026-11-07T10:10:52+09:00: Haiagaru NG確認 226 / ChMate 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-verified226.apk / SHA256 ba14720da9edd8618674b6b1d7ab033018be1643ac39dd921201259a3a2fa4fe。core 19、実reader/editorとgateway 200項目成功。

- 2026-11-07T10:12:27+09:00: Haiagaru NG確認 242 / ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-verified242.apk / SHA256 0f656b5037a0b42c08c1cb6c39f0c300092709904f4917ea7e0ccef5d5bae549。core 19、実reader/editorとgateway 197項目成功。

3サイトの保存応答を使う隔離検証で、17/4/79レスの標準表示、標準投稿画面、画像添付ボタン、ゼロ埋め番号・loopback port/HTTP保持、画像URLのgateway再構築後の取得、OFF拒否、返信の模擬応答と重複抑止を確認。試験中に作った未登録の一時aliasタブだけをtabletHome2から除き、通常の登録/他のタブは保持する試験後処理を追加。242の修正前試験で残ったタブの復元時null-IDクラッシュを再現し、退避XML build/site-tablet242-before-cleanup.xmlを保存したうえで整理後再成功。実掲示板へのPOSTは0、Release/pushなし。

### 補足: 前段の実機候補と242通信修正中間候補

- 2026-11-07 02:21:34 / 730eae72 / XIG05 / Haiagaru NG確認 191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191。既存署名照合後install-r Success。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-dialog191.apk / SHA256 0dc3168b2e4c1430ae6084ee3a823fc590e0cbef06549d3809e27881dee4ecc1。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-dialog.mpp / SHA256 3f2298dcea728358e34eb2166e906023778fca636149a3e982302055de9c7a45。

- 2026-11-07 10:04:56 / emulator-5580 / Haiagaru NG確認 242 / ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242。既存署名照合後install-r Success。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-transport242.apk / SHA256 6fcc5da9728c4b36c52c75c0d1337dbb190b65208b2a0912050e6bb95757c180。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-native-transport.mpp / SHA256 dff70abd221c9fc59f4df48d90e4b3df56e5810dee27b60bc1fe6353195db366。

両候補の署名鍵は上記Morphe鍵・同alias/cert。dialog191はこのターン開始前の前段で実機へ導入した候補の記録追補で、現在の3サイトroot構成とは異なる。今回の実機変更はなし。transport242は最終verified候補へ更新済み。

最終3版の通常cold Home起動後、新規reporterクラッシュなしをbuild/site-native-verified-new-crash.logで確認（cutoff 2026-11-07 01:19:08.594 UTC）。最初の時刻取得コマンドは引用引数エラーで失敗したため成功扱いせず、起動ログ時刻からUTC cutoffを再取得しlogcat終了コード0で確認し直した。


## 2026-11-07 モバイル取得・標準投稿フォーム候補（エミュレータ）

MPP: C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-mobile-post-final.mpp / SHA256 57120f067d838f528786093712f9f9633de62b469b90418ee40dfa5af1565cfd.
導入先 emulator-5580 / Haiagaru_Root_API36。既存reporter検証packageを証明書照合後install-r。アンインストール/データ消去/実機変更なし。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。

- 2026-11-07T14:06:31.3072469+09:00 / Haiagaru NG確認 191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-mobile-post191.apk / SHA256 cadbade81bc25db6ca2c2be4cc7f9db8a3bea84488333f60dc019a9e932c8c8e。install-r Success。

- 2026-11-07T14:08:13.9966477+09:00 / Haiagaru NG確認 226 / ChMate 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-mobile-post226.apk / SHA256 8e089757a2c34b0ac94b814ed31ecb5dc983763d71cabdc6e5eb50a610cd4da5。install-r Success。

- 2026-11-07T14:04:52.4991718+09:00 / Haiagaru NG確認 242 / ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-mobile-post242.apk / SHA256 8f75d00ba23a208d16697f8ff890212a5a67de9038be1a8b46ae8b77fc22d0b9。install-r Success。


最終検証: 標準reader/editorからの模擬送信は191=210、226=219、242=216項目成功。通常cold Home起動3版Complete。UTC 2026-11-07 04:40以降のcrash buffer行0。公開POST0、実サイトの受理未検証。build/site-mobile-post-summary.json、各site-mobile-post<版>-startup.log、site-mobile-post-new-crash.log。

### 2026-11-07 モバイル分割OP省略対応の中間候補（実表示未解決）

emulator-5580 / Haiagaru NG確認242 / ChMate0.8.10.242dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242。既存証明書照合後install-r Success、アンインストール/データ消去なし。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-mobile-pagination242.apk / SHA256 fda601b28c17da853aaf4f586c36abf5481025980a0fde04cddc87a24226ed7a。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-mobile-pagination.mpp / SHA256 059f870eb828159bd84dce8ee38eebf4113f9a1d22c5e4fec628f498d6aa72aa。鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。日時はbuild/site-mobile-pagination242-install.logのmtime。実UIでは途中のサイト側エラーにより空白が残り未公開。191/226は同MPPでAPK生成済み（site-mobile-pagination191.apk / site-mobile-pagination226.apk）、未導入。


### 2026-11-07 本文保持候補242をエミュレータで確認

emulator-5580 / Haiagaru NG確認242 / ChMate0.8.10.242dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242。証明書照合後install-r Success。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-mobile-partial242.apk / SHA256 d2b277f02d9f0154da81015af97acca3fa9b3b6e3e51eb839b12508170663178。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-mobile-partial.mpp / SHA256 16873b1b593e85123f80d697b5350ef7412f5b13ab4ed74d3af4f5523206e7c9。署名鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。日時はbuild/site-mobile-partial242-install.logのmtime。実タブ13539922をnative更新して本文72レスの表示確認、OPのレス混入は後続修正中。データ消去/実機変更/公開なし。191/226は候補APK生成のみ、未導入。


### 2026-11-07 標準投稿・本文整理候補（追加エラー対応へ更新予定）

MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-body-post-final.mpp / SHA256 662ad6b4e635789815203cf27cd68472f5c49ab6b9c974cb6759d741a1fed89e。emulator-5580 / 既存reporter検証packageを証明書照合後install-r。鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。アンインストール/データ消去/実機変更なし。

- 2026-11-07T15:25:35.1854938+09:00 / Haiagaru NG確認191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-body-post191.apk / SHA256 8a82f2524f704a5438175dc3153445c63967cc6eca712e246faeff79613c4424 / install-r Success。

- 2026-11-07T15:26:50.9505188+09:00 / Haiagaru NG確認226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-body-post226.apk / SHA256 66c10eeae6a00f88f957cdbd6e2fbab99737dccc4717eac2b2afd9425ec4d110 / install-r Success。

- 2026-11-07T15:23:52.3239435+09:00 / Haiagaru NG確認242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-body-post242.apk / SHA256 095d014db1e3a0553a517d4c4173999bf0e64253f9ff834c0ef486ee47c8be87 / install-r Success。


### 2026-11-07 本文部分エラー・投稿終了案内の最新候補

MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-body-post-errors.mpp / SHA256 c7bc8cdc124eb4521f2157676499f78992cf8e8f94817ec019ccec8ae04e1388。emulator-5580 / 既存reporter検証packageを証明書照合後install-r、データ消去/実機変更なし。鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。

- 2026-11-07T15:35:15.2828023+09:00 / Haiagaru NG確認191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-body-errors191.apk / SHA256 c71671475afa4b0430cb5822f0fa2e40bc295719833fe64476dd721915860007 / install-r Success / Home起動Complete。

- 2026-11-07T15:36:18.7375771+09:00 / Haiagaru NG確認226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-body-errors226.apk / SHA256 b37afc2864f0f092f31de8c1b75eb7e467c9bf9d80805ca838fbfe3beb01dc1d / install-r Success / Home起動Complete。

- 2026-11-07T15:34:13.6504056+09:00 / Haiagaru NG確認242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-body-errors242.apk / SHA256 0d25ccc0266228988d6aa39ad8d03db57393fe9a9bd2d91a605e107fb197d4f1 / install-r Success / Home起動Complete。

## 2026-11-07 最終 非日時ID・あにまん通常認証候補

MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-final-auth-date.mpp / SHA256 06dbd33bd88e46d01b2b3d74f9ad9898f376de19b549d76b731a91d1b935660a。emulator-5580 / 既存reporter検証packageを証明書照合後install-r。鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。データ消去/実機変更なし。

- 2026-11-07T16:19:21.0766378+09:00 / Haiagaru NG確認191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-final-auth191.apk / SHA256 e527475e565642f2eabe7c65cc8bb321a3a473c0d876a7c722af7fb0b82b4019。install-r Success / native  / cold Home Complete。

- 2026-11-07T16:21:50.1103169+09:00 / Haiagaru NG確認226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-final-auth226.apk / SHA256 623fa39504874ac008e18ef5aa09efdcb75f2bab167601f1251882087edba22d。install-r Success / native  / cold Home Complete。

- 2026-11-07T16:20:34.4966335+09:00 / Haiagaru NG確認242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-final-auth242.apk / SHA256 7fb191a644adea7e7db23b71cfe5b6de0be0cf7ceef0ea40c31f6cbf870dd5b2。install-r Success / native  / cold Home Complete。


## 2026-11-07 HTTPS ONの追加掲示板TLS修正候補

MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-http-exemption.mpp / SHA256 c0ff81ade51fa6814bbefda9e8aca81d39006df1d804e81af8a80aafa53d09ad。emulator-5580 / 各既存reporter packageを証明書照合後install-r。同じ鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。データ消去/実機操作なし。

- Haiagaru NG確認191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-http-exemption191.apk / SHA256 81758a0ec2ad030c2876cbaba62147a2e65bbba9ad94162aa65e288476804851 / install-r Success。HTTPS ONでnative本文/投稿dialog/3サイトmenu取得/停止後解除を確認。INSTRUMENTATION_RESULT: result=PASS 269 gateway/native URL checks; upstream GET=55, isolated POST=14; public posts=0

- Haiagaru NG確認226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-http-exemption226.apk / SHA256 d88cb06ed1880ee7b06fa3a1c59704600cfd42deaa81a1d1d846b12a59a8350e / install-r Success。HTTPS ONでnative本文/投稿dialog/3サイトmenu取得/停止後解除を確認。INSTRUMENTATION_RESULT: result=PASS 278 gateway/native URL checks; upstream GET=55, isolated POST=14; public posts=0

- Haiagaru NG確認242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-http-exemption242.apk / SHA256 18088386cd9572d609a95221fccc0dfa52a83e0c81fdc5a3ed08b96b1834d80b / install-r Success。HTTPS ONでnative本文/投稿dialog/3サイトmenu取得/停止後解除を確認。INSTRUMENTATION_RESULT: result=PASS 275 gateway/native URL checks; upstream GET=55, isolated POST=14; public posts=0



## 2026-11-07 履歴OOM・画像プレビュー・過去ログUnicode 最終候補

MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/history-release.mpp / SHA256 58c154e128026a9113bc7a0c780b4f53cc6d1957ff18234d36f71b329507b98b。emulator-5580 / 各既存reporter packageを署名照合後install-r。鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。通常Lint/R8成功3m49s。実機操作/データ消去なし。

- Haiagaru NG確認 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/history-release191.apk / SHA256 58d5edc15283db8caa9dcc025be7dff2ad71a3afbb247cd5d60142bd4b9df24d。2026-11-07 18時台JST install-r Success / native回帰34項目成功 / cold Home Complete。

- Haiagaru NG確認 226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/history-release226.apk / SHA256 95d390c51e9ab225fffedf39dfa5249865240b033d1b23eaba19f3308bd608cb。2026-11-07 18時台JST install-r Success / native回帰34項目成功 / cold Home Complete。

- Haiagaru NG確認 242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/history-release242.apk / SHA256 65beedc53f670df26ab9d828acac71662c85131c75ac6f32907a9ad38dc5b7b1。2026-11-07 18時台JST install-r Success / native回帰34項目成功 / cold Home Complete。



## 2026-11-07 爆サイ文字一覧/通常本文・ふたばタイトル補完

MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-reported-layouts.mpp / SHA256 044e173bbd15600aad2f8628666c058e993322e48c20073d95e9b0ff97bcd5a6。emulator-5580 / 既存reporter3版を署名照合後install-r。鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。実機操作/データ消去なし。

- Haiagaru NG確認 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-reported191.apk / SHA256 5c017e7417431f554157ab3bb4260d16077860973f939d33cb4e0c5ea01dbfa2 / 2026-11-07 19時台JST install-r Success / hook保持PASS。

- Haiagaru NG確認 226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-reported226.apk / SHA256 7eab3e3693224b7654ee70920312b9de8cd3b3265b4141e65a0640e7b55d32e0 / 2026-11-07 19時台JST install-r Success / hook保持PASS。

- Haiagaru NG確認 242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-reported242.apk / SHA256 2969021a506c11655179dbb065dae5ee424cb50cdd528542d5bd68e722af86d9 / 2026-11-07 19時台JST install-r Success / hook保持PASS。



## 2026-11-07 標準バックアップXML共通化/共有NG誤検知

MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/canonical-backup-ng.mpp / SHA256 3121a87a2bca72fa56f78723d92b5470049d460b7a8d72f6f862806e43ad10be。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。emulator-5580の既存reporter packageへ署名照合後install-r、データ消去なし。2026-11-07 20時台JST。

- Haiagaru NG確認191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/canonical-backup191.apk / SHA256 c0e37e2de73b30745a23e3b0f5dc7d4189a9351de4d048eeed6bd7d1a35d8f05 / install-r Success / 固定hook保持PASS / 専用試験10項目成功。

- Haiagaru NG確認226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/canonical-backup226.apk / SHA256 d4f13121cc9cbbdb92df29443aa2983853a280319c785fd04e2e7da09f09f51d / install-r Success / 固定hook保持PASS / 専用試験13項目成功。

- Haiagaru NG確認242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/canonical-backup242.apk / SHA256 6474455bec9d5d7778ec83b05c8f588fbacde2574dae286669904cded5c2fbea / install-r Success / 固定hook保持PASS / 専用試験13項目成功。



## 2026-11-07 共有NG端末内編集/固定ラベル誤検知

MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/shared-ng-local-edits-ui.mpp / SHA256 174469e1419a6cdc345b14a9700a7058a7dcd0d8aac8e32e4ea81bbca9d3b0c3。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。対象emulator-5580、既存reporter packageを同署名install-r、実機変更/データ消去なし。2026-11-07 21時台JST。

- Haiagaru NG確認242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/shared-ng-local-edits-ui242.apk / SHA256 198ff728c8069fc5322e68277f07c5416e17da825b2fe7f40991407837ce583a。署名照合install-r Success、専用最終試験51項目PASS。

- Haiagaru NG確認226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/shared-ng-local-edits-ui226.apk / SHA256 6c8250192d5c3d9847469c185f3fa9a18ba98ebe3e38f91fe17dfb13c38c3b85。固定hook検査成功、インストール/試験は継続中（未成功扱い）。

- Haiagaru NG確認191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/shared-ng-local-edits-ui191.apk / SHA256 c42bc814e3a4fb428d50fa80f4008e98a16eaf948308c46738ed585e8fc18703。固定hook検査成功、インストール/試験は継続中（未成功扱い）。


追補: 226/191の最終候補も3072MiBのemulator-5580へ署名照合後install-r Success。242=51、226=51、191=48専用試験PASS。絶対APK path/MPP/署名は上記と同一。



## 2026-11-07 外部板報告URL/元URL連携/Unicode

MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-url-bugs.mpp / SHA256 072e884dd948cda807125702bbadfdef4de62d5639c0e5d377492633c376b614。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。対象emulator-5580、3072MiB、2026-11-07 22時台JST、既存reporter packageを署名照合後install-r。実機変更/データ消去なし。未公開ローカル候補。

- Haiagaru NG確認191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-url-bugs191.apk / SHA256 0767b682bb5a461afac7789a50ebd438e839953457eb29f0b2808fab3497e7d3 / install-r Success / 固定hook命令/レジスター保持PASS。INSTRUMENTATION_RESULT: result=PASS 307 gateway/native URL checks; upstream GET=61, isolated POST=14; public posts=0。

- Haiagaru NG確認226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-url-bugs226.apk / SHA256 137144427723343efdcbb0de22a3d4069d64aeece36a2858f8f2a70dc95f6f82 / install-r Success / 固定hook命令/レジスター保持PASS。INSTRUMENTATION_RESULT: result=PASS 316 gateway/native URL checks; upstream GET=60, isolated POST=14; public posts=0。

- Haiagaru NG確認242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/site-url-bugs242.apk / SHA256 4c48ef9324d1cb3f451eb31a5112b2b01a1a666b6ce7157a776d0d5df40402bb / install-r Success / 固定hook命令/レジスター保持PASS。INSTRUMENTATION_RESULT: result=PASS 313 gateway/native URL checks; upstream GET=62, isolated POST=14; public posts=0。



## 2026-11-07 モバイル分割/件数修正の先行候補（試験失敗・最終確認中）

2026-11-07 22:58頃JST / emulator-5580 / Haiagaru NG確認191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/animanch-7596018/fix191.apk / SHA256 c2575134ec7b935f127d5cb96bb96773b3d124c2be081c06a14e65c5326a32ab。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/animanch-7596018/combined-fix.mpp / SHA256 41596ed8085ea87223af1956d87787aee0739886463d73ad84a400464cf95dae。鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。既存APK署名照合後install-r Success。native試験は合成fixtureのorg.jsoup.Jsoup反射がR8名変更で失敗、1001行表示を成功扱いしない。実機変更/データ消去なし。ユーザーの追加copy要求を含む最終候補はまだ導入前。



## 2026-11-08 元URLコピー/分割取得/段落保持 最終候補

2026-11-08 00:42頃JST / emulator-5580 / RAM3072 / Haiagaru NG確認191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/animanch-7596018/readability191.apk / SHA256 8526d8e7bac32561da69ee8d39e8554308b5dc9a5a20ad2ff00f20c0c06c744d。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/animanch-7596018/readability.mpp / SHA256 7369b41dc79a2ba492d906509c2cb2ecd7b851037cb4039da122100e3aef75ea。鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名照合install-r Success。固定hook保持PASS、final-reader191.log 585項目PASS、final-live.logの実HTTP200/329 DAT行成功、crash buffer0行。226/242の今回の候補は導入していない。実機変更/データ消去なし。



## 2026-11-08 外部板投稿判定/空本文候補（未公開）

01:23頃JST / emulator-5580 / RAM3072 / 先行候補 / 表示名 Haiagaru NG確認 191 / ChMate0.8.10.191 dev / package jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-post-bugs-20261108\fix191.apk / SHA256 2f0e3dc56fb474b5d024fea5cb9bda2b5e3b0f6776970516b159195890fb38fc。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-post-bugs-20261108\fix.mpp / SHA256 d3835cbbcf2453452847b860ab0913c269111b5d1390bc612ebd25384fe116c5。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名一致install-r Success、native594項目PASS。ただし実爆サイ取得は503継続のため最終候補へ追加修正。 実機変更/アンインストール/データ消去なし。

01:38頃JST / emulator-5580 / RAM3072 / 最終候補 / 表示名 Haiagaru NG確認 191 / ChMate0.8.10.191 dev / package jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-post-bugs-20261108\final191.apk / SHA256 992b796606dabb934e2711a8dc28e6ebedc5400fa703329adcbf0c82623c5f9f。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-post-bugs-20261108\final.mpp / SHA256 d3ccd56556f1a8d639dc2238d6df0c91a59227d75a0442c257cb3d48cf53a0a7。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名一致install-r Success、固定hook保持PASS。native191-final.log595項目PASS、実爆サイHTTP200/記事1+理由付き未取得枠2のDAT3行成功、crash191-final.log0行。 実機変更/アンインストール/データ消去なし。

試験専用APKも同じ鍵/alias/certで署名。表示名 Haiagaru isolated site tests / version1.0 / package app.haiagaru.tests.sitegateway191、対象は上記検証用191。 01:23頃install-r Success: C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-post-bugs-20261108\tests-stored191.apk / SHA256 a80ce6f258434d8e8464e2fd793f36e16f41c9f36d863070d2d1421533131c85、署名処理に指定したMPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-post-bugs-20261108\fix.mpp / SHA256 d3835cbbcf2453452847b860ab0913c269111b5d1390bc612ebd25384fe116c5（exclusive、適用パッチ0件）。 01:38頃install-r Success: C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-post-bugs-20261108\test-final.apk / SHA256 ef4acc72d3c657c0e2e6fa62947d4c2d3ef3bb922a2a7f590c73fe348e446a1a、署名処理に指定したMPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-post-bugs-20261108\final.mpp / SHA256 d3ccd56556f1a8d639dc2238d6df0c91a59227d75a0442c257cb3d48cf53a0a7（exclusive、適用パッチ0件）。


## 2026-11-08 爆サイ3099994の取得UA修正（最終候補）

2026-11-08 09:42頃JST / emulator-5580 / RAM3072 / Haiagaru NG確認 191 / ChMate0.8.10.191 dev / package jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-3099994\final191.apk / SHA256 e976f5d553c3271c146e8923d8645be2e06206faa5590a8074fc2cc5283ed8bf。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-3099994\final.mpp / SHA256 6ce606737fa570dfc16134de534bb2df7e63123503e4b3d3faae974e4ad6e6ab。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。既存署名一致を確認してinstall-r Success、固定hook保持PASS（hooks191.log）。native191-final.log598項目PASS、after-live.logの実HTTP200/OP+15レス/標準画面16件成功、crash191.log0行。実機変更/アンインストール/データ消去なし。

同時導入の試験APK: Haiagaru isolated site tests / version1.0 / package app.haiagaru.tests.sitegateway191 / 対象上記191。C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-3099994\tests191.apk / SHA256 e6f305c6bf4f4851fee6bb170b5e8b4d0becf2d3557817cf9d37cfc5b3ace825。同じ鍵/alias/certで署名。署名処理は上記MPPを指定したexclusive適用0件、install-r Success。

試験期待数を更新した最終試験APK: C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-3099994\tests191-final.apk / SHA256 0b8870c214f34a68d2cfaeacdf0a3e240517c5da0887131004a7a9f0443be4cb。同じpackage/version/鍵/alias/cert、同じMPPのexclusive適用0件、09:44頃JSTにemulator-5580へinstall-r Success。製品APKは上記final191.apkから変更していない。

## 2026-11-08 外部板の日付・勢い／取得互換候補

11:04〜11:06 JST / emulator-5580 / RAM3072 / ChMate0.8.10.191 dev / 表示名 Haiagaru NG確認 191 / package jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\external-board-dates\release191.apk / SHA256 807bd8b674115c17ac09f59428343f2d32c39057f39177971ca6883cad524c89。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\external-board-dates\release.mpp / SHA256 70f692c5331f16379ba2b77bfae30e699f0f8bb389758f797a551169c8e4c1f3。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。既存実APKと署名一致を確認してinstall-r Success。アンインストール・データ消去・実機変更なし。試験APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-boards-inst\tests191.apk / SHA256 b481758dcb0fe01e5097c94516533d894f171b769d97c255f667b8c642382243 / package app.haiagaru.tests.sitegateway191 / 表示名 Haiagaru isolated site tests / version1.0 / 対象は同じ検証用191 / 同じ鍵・alias・証明書、更新成功。

11:04〜11:06 JST / emulator-5580 / RAM3072 / ChMate0.8.10.226 dev / 表示名 Haiagaru NG確認 226 / package jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\external-board-dates\release226.apk / SHA256 629c50ebad3d13445ea997b3d26d1123ce15db41978489fda532658c8a7716af。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\external-board-dates\release.mpp / SHA256 70f692c5331f16379ba2b77bfae30e699f0f8bb389758f797a551169c8e4c1f3。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。既存実APKと署名一致を確認してinstall-r Success。アンインストール・データ消去・実機変更なし。試験APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-boards-inst\tests226.apk / SHA256 7ef0be4ab83db2ad6f9c08664f9bafcdcc1c1172cd2e8875c5f8c7f59402e57d / package app.haiagaru.tests.sitegateway226 / 表示名 Haiagaru isolated site tests / version1.0 / 対象は同じ検証用226 / 同じ鍵・alias・証明書、更新成功。

11:04〜11:06 JST / emulator-5580 / RAM3072 / ChMate0.8.10.242 dev / 表示名 Haiagaru NG確認 242 / package jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\external-board-dates\release242.apk / SHA256 89063e6942fb2242c9dc27f03f43696b24900133ac01a2334c3ec997d59d5057。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\external-board-dates\release.mpp / SHA256 70f692c5331f16379ba2b77bfae30e699f0f8bb389758f797a551169c8e4c1f3。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。既存実APKと署名一致を確認してinstall-r Success。アンインストール・データ消去・実機変更なし。試験APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-boards-inst\tests242.apk / SHA256 f3ef224c1000388f11aa5a0388b6256b55c4621231b3ff1131ddda9dff95e6f3 / package app.haiagaru.tests.sitegateway242 / 表示名 Haiagaru isolated site tests / version1.0 / 対象は同じ検証用242 / 同じ鍵・alias・証明書、更新成功。

## 2026-11-08 爆サイ求人一覧候補（ローカル・未公開）

12:05〜12:06 JST / emulator-5580 / RAM3072 / Haiagaru NG確認 191 / ChMate0.8.10.191 dev / package jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-fukuoka829\fix191.apk / SHA256 d224e448613eb1065f1e16cc470f5ac44cd387a06fa0672e92d78f5c3d392a6d。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-fukuoka829\fix.mpp / SHA256 40ea375157908c8a37f25585cda387410995fbec14cfbdc6b4220b5cfccb6b10。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。台帳と既存実APKの署名一致を確認しinstall-r Success。固定hook保持PASS、615項目成功、福岡829実一覧25スレ・代表5262240実DAT2行/標準画面2件成功、crash191.log0行。実機変更/アンインストール/データ消去なし。試験APKは前回記録build/site-boards-inst/tests191.apkのまま。226/242の今回の最終候補パッチ生成・画面試験は未実施。

## 2026-11-08 闇バイト関連ニュース候補

14:02〜14:05 JSTの先行候補。署名一致install-r Success。191試験で件数0の変換拒否を検出したため未公開のまま修正。 emulator-5580 / RAM3072 / ChMate0.8.10.191 dev / Haiagaru NG確認 191 / package jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-warning-browser\final191.apk / SHA256 93297f724a7a6432670a647dcd408c6e10fe686e76738723f2cf95b9e7a3e132。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-warning-browser\final.mpp / SHA256 385859e1345ea7ea5b06e0e37f2379a149efee4a82931e5e80a0e8e1a9c963b2。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。実機変更/アンインストール/データ消去なし。

14:02〜14:05 JSTの先行候補。署名一致install-r Success。191試験で件数0の変換拒否を検出したため未公開のまま修正。 emulator-5580 / RAM3072 / ChMate0.8.10.226 dev / Haiagaru NG確認 226 / package jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-warning-browser\final226.apk / SHA256 7e4cd2409f75542a05b8416cee067b7fba704e992eee05ea746cf215441e825d。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-warning-browser\final.mpp / SHA256 385859e1345ea7ea5b06e0e37f2379a149efee4a82931e5e80a0e8e1a9c963b2。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。実機変更/アンインストール/データ消去なし。

14:02〜14:05 JSTの先行候補。署名一致install-r Success。191試験で件数0の変換拒否を検出したため未公開のまま修正。 emulator-5580 / RAM3072 / ChMate0.8.10.242 dev / Haiagaru NG確認 242 / package jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-warning-browser\final242.apk / SHA256 1b7d994d8dda7b616a1db42d579bb1681d86660c50d10e3fb7b0262d18e6f860。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-warning-browser\final.mpp / SHA256 385859e1345ea7ea5b06e0e37f2379a149efee4a82931e5e80a0e8e1a9c963b2。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。実機変更/アンインストール/データ消去なし。

14:18〜14:20 JSTの最終候補。署名一致install-r Success。641/647/644項目、実一覧59行/実本文3件確認。 emulator-5580 / RAM3072 / ChMate0.8.10.191 dev / Haiagaru NG確認 191 / package jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-warning-browser\reader191.apk / SHA256 fe78c19015dde8bec8b75a3c1c223a652054b8fb1d83843d7ed397e359159e9f。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-warning-browser\reader.mpp / SHA256 9b7339bcdc50e3c4cf41b3ddced83e17cb130e7a37b094506144ebf591178940。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。実機変更/アンインストール/データ消去なし。

14:18〜14:20 JSTの最終候補。署名一致install-r Success。641/647/644項目、実一覧59行/実本文3件確認。 emulator-5580 / RAM3072 / ChMate0.8.10.226 dev / Haiagaru NG確認 226 / package jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-warning-browser\reader226.apk / SHA256 93d603260d6e41ee7f0a588809b48e4a617d0db7706d4f645df0bcf59d27d27a。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-warning-browser\reader.mpp / SHA256 9b7339bcdc50e3c4cf41b3ddced83e17cb130e7a37b094506144ebf591178940。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。実機変更/アンインストール/データ消去なし。

14:18〜14:20 JSTの最終候補。署名一致install-r Success。641/647/644項目、実一覧59行/実本文3件確認。 emulator-5580 / RAM3072 / ChMate0.8.10.242 dev / Haiagaru NG確認 242 / package jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-warning-browser\reader242.apk / SHA256 e44f7354a47cfc16bf86823b5c414385aa2c3638b58797e2a8932162ccb998c6。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\bakusai-warning-browser\reader.mpp / SHA256 9b7339bcdc50e3c4cf41b3ddced83e17cb130e7a37b094506144ebf591178940。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。実機変更/アンインストール/データ消去なし。

試験APK最終: C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-boards-inst\tests191.apk / SHA256 ad284633ff5a15013b3715f33b022f70411a422c2b357f4ef9479bfddd66af45 / package app.haiagaru.tests.sitegateway191 / version1.0 / Haiagaru isolated site tests / 対象は上記reporter191 / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。install-r Success。試験側の画面対象/操作順の修正により複数回更新し、製品APK reader191.apkは変更していない。

試験APK最終: C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-boards-inst\tests226.apk / SHA256 2d31f514b93578e0d063af332044b93173c05972a0f0c95a31e421cbc145d53d / package app.haiagaru.tests.sitegateway226 / version1.0 / Haiagaru isolated site tests / 対象は上記reporter226 / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。install-r Success。試験側の画面対象/操作順の修正により複数回更新し、製品APK reader226.apkは変更していない。

試験APK最終: C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current\build\site-boards-inst\tests242.apk / SHA256 277e9f8235f7fa558a56a856559b564ca680f2ba8d3d795046cc5f4bca6ae0f4 / package app.haiagaru.tests.sitegateway242 / version1.0 / Haiagaru isolated site tests / 対象は上記reporter242 / 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。install-r Success。試験側の画面対象/操作順の修正により複数回更新し、製品APK reader242.apkは変更していない。

## 2026-11-08 板一覧更新通知クラッシュ修正候補（未公開）

導入先 emulator-5580 / Haiagaru_Root_API36 / Android 16 API36。実機の既存アプリは変更していない。InstallVerifiedApk.ps1でインストール済み署名と候補の一致を確認しinstall-r Success。データ保持、アンインストール・データ消去なし。

共通MPP: C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/board-adapter-test/fixed.mpp / SHA256 7f7c7775db895dc2834192b52bb4693e6ad479896b5db462535f9b4a1c9f205a。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。

- 18:07:47 JST、Haiagaru NG確認 191 / ChMate 0.8.10.191 dev / package jp.co.airfront.android.a2chMate.haiagaru.reporter191。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/board-adapter-test/fixed191.apk / SHA256 9802ade7a5a743329a65adf72796e8c0660acabd0360f2378fe8994ca3afa347。署名一致install-r Success、板一覧同期observer/件数/layout試験141項目成功。
- 18:08:22 JST、Haiagaru NG確認 226 / ChMate 0.8.10.226 dev / package jp.co.airfront.android.a2chMate.haiagaru.reporter226。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/board-adapter-test/fixed226.apk / SHA256 50bac8f493beb88adcda1b3b3a8446cfc18199f91cbaaba1e6f0b539e51b6b52。署名一致install-r Success、同試験141項目成功。

専用試験APKも上記Morphe鍵・同certでinstall-r Success、表示名 Board adapter regression tests、package app.haiagaru.tests.boardadapter191 / boardadapter226、targetは各reporter。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/board-adapter-test/tests191.apk / SHA256 e3b41296b9f82f1f0b99e42e7ae4e72a7c8b3dea017f5178882f2e4d3ec20567、tests226.apk（同ディレクトリ）/ SHA256 228a8504a59315fddec0cffb3d4fbc8dab1ee7985fe6a4fb9e1f91a234f4cf11。DB・公開通信なし。修正前の両reporterに対する初回試験はexpected120/observed0の不一致を再現。

18:08:37 JST、独立した動画レイアウト試験app.haiagaru.tests.layoutmutation、Android debug鍵 C:/Users/narum/.android/debug.keystore / alias androiddebugkey、ChMateデータアクセスなし。C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/thumbnail-layout-regression/test.apk / SHA256 708e21e81c5c6d179ee539f731c68b64524a4c8fd66cb4634b79cec6b464e5f1。install-r Success、製品VideoThumbnailRetryを利用した128件×8回など34項目成功。build/board-adapter-test/layout-regression.log参照。

上記layoutmutationの表示名 Haiagaru layout regression / cert SHA256 85e29bfe0ecf3e8553fd628c4731de911bc29f38f66beb37fefa3029c9fc50a3。最終候補のgateway/native画面回帰は191=641/226=647項目成功、公開投稿0、crash buffer空。初回clipboard確認はSystemUI ANRの前面dialogで失敗、閉じて再試験成功。


## 2026-11-08 共有NG容量削除・爆サイページ・HOME更新位置の最終候補（未公開）

対象はemulator-5580 / Haiagaru_Root_API36、実機置換なし。製品APKはInstallVerifiedApk.ps1で既存署名一致を検査してinstall-r Success。表示名 Haiagaru NG確認 191/226、ChMate 0.8.10.191 dev/226 dev、既存reporterパッケージのデータ保持。共通鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。

- 2026-11-08 18:42:19 JST / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/bakusai-8520877/final191.apk / SHA256 4acd63355d40753a06d29adb842ea8a372a8d1a63e8b37e42f5a1afd1c881fb3 / MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/bakusai-8520877/final.mpp / SHA256 fc8a74babb9035a2a3874a951c808ed266a5d745433c62483b5015f9f5772eab / install-r Success。
- 2026-11-08 18:42:48 JST / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/bakusai-8520877/final226.apk / SHA256 d339431933626e73e05627fd19721d3a94a57691561b858bf09c6bdb9055f953 / MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/bakusai-8520877/final.mpp / SHA256 fc8a74babb9035a2a3874a951c808ed266a5d745433c62483b5015f9f5772eab / install-r Success。
- 2026-11-08 18:55:56 JST / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/bakusai-8520877/verified191.apk / SHA256 776b7a7938cf47a6ef0e67034e1dec64f3c977b7e4b70efb9abd654170ee8a14 / MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/bakusai-8520877/verified.mpp / SHA256 795d5444f3411477c7078b70c0ac44d9cd7bd1c03700701360a50fda68dcb655 / install-r Success。
- 2026-11-08 18:56:08 JST / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/bakusai-8520877/verified226.apk / SHA256 dc0bc96329ab27f71ae2d1f19ed9689e8949c155e0dfa5849c7e0c8d73ce57a9 / MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/bakusai-8520877/verified.mpp / SHA256 795d5444f3411477c7078b70c0ac44d9cd7bd1c03700701360a50fda68dcb655 / install-r Success。
- 2026-11-08 19:08:44 JST / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/home-refresh-scroll/final191.apk / SHA256 e065e8da5659025283131c799ed6fa906bde23d5d55117f14338ac34c9f3a901 / MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/home-refresh-scroll/final.mpp / SHA256 29992532c912383f529804538e7e02740065f942b518f1a38371177c58d2666d / install-r Success。

追加試験APK（同じMorphe鍵/cert、表示名 Board adapter regression tests、エミュレータのみ）：

- app.haiagaru.tests.shareddataerror191 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-data-error-test/tests191.apk / SHA256 c138d5914ed419816396b75b9bf0a62dcfb853ddbee47142025c31244c26f67d / install-r Success / targetは各reporter。sitegatewayの表示名はHaiagaru isolated site tests。
- app.haiagaru.tests.bakusailive191 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/bakusai-live-test/tests191.apk / SHA256 08bd1a6413370332ae6c4ca4cf570849f78f9c0a6a4ede6f9627f707b22927b6 / install-r Success / targetは各reporter。sitegatewayの表示名はHaiagaru isolated site tests。
- app.haiagaru.tests.homerefreshscroll191 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/home-refresh-scroll/tests191.apk / SHA256 69ede7d13b9ca42298a138be7b63c01dde83a69734b02d90379d3374a489f025 / install-r Success / targetは各reporter。sitegatewayの表示名はHaiagaru isolated site tests。
- app.haiagaru.tests.sitegateway191 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-inst/tests191.apk / SHA256 b8c0b8b22bcab76aaf1d8563e1645db1684564e51e29dc659ca3f24968092518 / install-r Success / targetは各reporter。sitegatewayの表示名はHaiagaru isolated site tests。
- app.haiagaru.tests.sitegateway226 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-inst/tests226.apk / SHA256 9fc9714079621027948ff307e3c523bcf641840b853b5451092d96873add7cc4 / install-r Success / targetは各reporter。sitegatewayの表示名はHaiagaru isolated site tests。

最終191: HOME更新位置保持12項目、共有NG受信ファイル削除/容量/設定保持/エラー全文22項目、板一覧141項目、native gateway/本文/画像/composer641項目成功。226: gateway647項目成功。実ネットワークGETのlive probeは12ページ/552行/うち51未取得、投稿送信なし。HOME最終MPPの226への再適用はしていない（変更は191限定のKotlinフック）。アンインストール・データ消去・実機操作・公開なし。


## 2026-11-08 プレ公開前の242共通処理追加検証

2026-11-08 19:26:36 JST / emulator-5580 / Haiagaru NG確認 242 / ChMate 0.8.10.242 dev / package jp.co.airfront.android.a2chMate.haiagaru.reporter242。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/home-refresh-scroll/final242.apk / SHA256 21d38db2b1a4ba43f51e83b54f5c14ff7f720fc9aa3244d85d9807088da4663d。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/home-refresh-scroll/final.mpp / SHA256 29992532c912383f529804538e7e02740065f942b518f1a38371177c58d2666d。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。InstallVerifiedApk.ps1で既存署名一致/install-r Success。実機変更・データ消去なし。

同鍵で署名した試験APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-inst/tests242.apk / SHA256 34a68ecad42708b8a3134f9d93e5e738d9d01912c6b40354feb228aa18ef5dc1 / package app.haiagaru.tests.sitegateway242 / 表示名 Haiagaru isolated site tests / version1.0、targetは上記reporter242、install-r Success。回帰結果は公開記録へ追記。

## 2026-11-08 サムネイル遮蔽・音声focus・絵文字の未公開候補

対象 emulator-5580 / Haiagaru_Root_API36。全て既存reporterへInstallVerifiedApk.ps1で署名一致install-r Success。表示名 Haiagaru NG確認191/226/242、ChMate 0.8.10.191/226/242 dev。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。実機変更・アンインストール・データ消去なし。

- 2026-11-08 21:00:36 JST / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/emoji-cleanup-tests/candidate191.apk / SHA256 516c38a24ef9558a074fa21ad0ba81943a412d8f716c7fd3345c2bfa5338af59 / MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/emoji-cleanup-tests/candidate.mpp / SHA256 19d445a07e9b76274aecc352ad560b4587f154fa1839ea706784f4984f0410b7 / install-r Success。

- 2026-11-08 21:08:17 JST / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/emoji-cleanup-tests/candidate226.apk / SHA256 eee8f5990a6c7b0d3c79cb5ef8e3fe193e2bf5bf460866a0d357318267e016d6 / MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/emoji-cleanup-tests/candidate.mpp / SHA256 19d445a07e9b76274aecc352ad560b4587f154fa1839ea706784f4984f0410b7 / install-r Success。

- 2026-11-08 21:08:48 JST / jp.co.airfront.android.a2chMate.haiagaru.reporter242 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/emoji-cleanup-tests/candidate242.apk / SHA256 e7c2beed071f6a6f20ca4990d1e10199dd4c535d7fd11e7ddb99e9b97eb5da9e / MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/emoji-cleanup-tests/candidate.mpp / SHA256 19d445a07e9b76274aecc352ad560b4587f154fa1839ea706784f4984f0410b7 / install-r Success。

- 2026-11-08 21:16:29 JST / jp.co.airfront.android.a2chMate.haiagaru.reporter242 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/emoji-cleanup-tests/final242.apk / SHA256 561a02a443428e8974c8d466465800050220e01b5f6e08feb223fa6502458752 / MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/emoji-cleanup-tests/final.mpp / SHA256 a586f64df94ee690dbccfd8ecf54e96857b174b95e05677b2c072a2b90f97e45 / install-r Success。

先行候補はビルド開始時dev.14表記のローカル候補で、公開dev.15と区別する。最終242は透明コンテナ改善・242投稿フィールド修正を含む。検証の詳細/失敗経緯はthumbnail-focus-emoji-20261108.md。

追加instrumentationは同じMorphe鍵/cert、表示名 Board adapter regression tests、versionNameなし、targetは各reporter。インストール済みAPKを端末から取得して保全（手元で後に上書きした試験APKとは区別）。導入は2026-11-08、正確な時刻は未保存。最終実行ログと結果を併記。

- app.haiagaru.tests.mediacleanup191 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/emoji-cleanup-tests/installed-media191.apk / SHA256 2b1b00cc3cccc761150c344ee7c141cc14f6f06d9b8fd6765f54a9abc4ff9e0c / install-r Success / 191=12、226=15、最終242=15項目成功。

- app.haiagaru.tests.mediacleanup226 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/emoji-cleanup-tests/installed-media226.apk / SHA256 8a428a7b260ad959820c93e00804fcadd0685452c34d83d44d3df4e03ae34fea / install-r Success / 191=12、226=15、最終242=15項目成功。

- app.haiagaru.tests.mediacleanup242 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/emoji-cleanup-tests/installed-media242.apk / SHA256 0f6a500440ddb3835efa03eca68454b149363b47823d54aff04a04ddf8533dcf / install-r Success / 191=12、226=15、最終242=15項目成功。

2026-11-08 21:07頃 JST、app.haiagaru.tests.layoutmutation / Haiagaru layout regression / emulator-5580。独立テストでChMateデータアクセスなし。APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/thumbnail-layout-regression/test.apk / SHA256 c150b9c6814f4d2315814fb1d5b42bd1f073ddb19d2b33af75468defc35d7510。Android debug鍵 C:/Users/narum/.android/debug.keystore / alias androiddebugkey / cert SHA256 85e29bfe0ecf3e8553fd628c4731de911bc29f38f66beb37fefa3029c9fc50a3。install-r Success、layout-container.logで41項目成功。

## 2026-11-09 kenmo記者ID・板名・IP警告の候補

全製品APKはInstallVerifiedApk.ps1で既存署名一致を確認しinstall-r Success。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。アンインストール・データ消去なし。日常用パッケージは更新していない。時刻は導入ログの最終更新時刻（JST、処理終了の近似）。

MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/kenmo-reporter-20261109/candidate.mpp / SHA256 7eb16e33d30ebbf4adb539f5f1ccb52881fb72ecef2a7a37dd5325205af3f09a。ローカルdev.16表記の次版候補であり公開dev.16とは異なる。

- 2026-11-09T01:39:11+09:00 / emulator-5580 / Haiagaru NG確認 191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/kenmo-reporter-20261109/candidate191.apk / SHA256 c04445cdcee59f16c4ef7e015755a3c0069e09ea60f33a4d59203d4f57eba82a / install-r Success。

- 2026-11-09T01:45:03+09:00 / 730eae72 / Haiagaru NG確認 191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/kenmo-reporter-20261109/candidate191.apk / SHA256 c04445cdcee59f16c4ef7e015755a3c0069e09ea60f33a4d59203d4f57eba82a / install-r Success。

- 2026-11-09T01:45:45+09:00 / emulator-5580 / Haiagaru NG確認 226 / ChMate 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/kenmo-reporter-20261109/candidate226.apk / SHA256 a960b3a598ce19b5a435b8e27f4b4013df668d897db1accf6464fdb81c16263a / install-r Success。

- 2026-11-09T01:48:41+09:00 / emulator-5580 / Haiagaru NG確認 242 / ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/kenmo-reporter-20261109/candidate242.apk / SHA256 fc54b996022a165db723db00530351063d115a721dbc90aa8654ec5b17ef25ca / install-r Success。


実機730eae72の検証用191はam start -WのStatus:ok、当該パッケージのResListActivityがfocusを持つことを確認。スクリーンショットphysical-installed.png保存。導入後01:43以降のcrash bufferは空。全新機能の実機通し操作は未実施。


追加テストAPKは同じMorphe鍵/cert、表示名Board adapter regression tests、versionNameなし。次の3つをemulator-5580へinstall-r Success。各同番号reporterを対象とする。

- app.haiagaru.tests.ipwarning191 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ip-post-warning/inst/tests191.apk / SHA256 352e63235746c1e004abc9a452c54970f03e763707a5b9fae786814d82e74f14。

- app.haiagaru.tests.ipwarning226 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ip-post-warning/inst/tests226.apk / SHA256 a068ca91982ed10f2a3d30ae2a46f52fcbb26469d208be166a7fbd8307022844。

- app.haiagaru.tests.ipwarning242 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ip-post-warning/inst/tests242.apk / SHA256 0eded614f1a08e290ddf838a9ee20e4d092d5b0c9f0f33d90af58f80d3f6027e。


sitegateway191試験APKも同じ鍵/cert、表示名Haiagaru isolated site tests、version1.0。build/site-boards-inst/tests191.apk / SHA256 d846fafdfc37c56ae21c46545de7e2b7ad8c8499b77361a213867b9a2b5fc175 / emulator-5580へinstall-r Success、191のsame-count refetch試験を追加。226/242のsitegateway試験APKは既存導入済みを継続使用。

## 2026-11-09 既読後の再通知・ミュート中フォーカス修正候補

emulator-5580 / Haiagaru_Root_API36。製品は全て既存reporterをInstallVerifiedApk.ps1で署名一致確認後install-r Success。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。実機は未接続、実機変更・アンインストール・データ消去なし。

MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/thread-watch-read-20261109/candidate.mpp / SHA256 06c27e804edcc04e5dee39d54090c44e387a4d0635fa6e67744b0ef787f3082b。ローカルdev.17表記の次版候補であり公開dev.17には未包含。導入時刻はログ更新時刻（JST、終了の近似）。

- 2026-11-09T19:51:42+09:00 / Haiagaru NG確認 242 / ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/thread-watch-read-20261109/candidate242.apk / SHA256 3a0f0c4335f3ce04320e36d73c95665f43d4b2c4da568d5fb62b058fd808c53e / install-r Success。

- 2026-11-09T19:55:41+09:00 / Haiagaru NG確認 191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/thread-watch-read-20261109/candidate191.apk / SHA256 79c6cfa9fbeea1fe6a5a4f55a14eca8271337957e3ef2f9c98fbc0d4e6dd6d34 / install-r Success。

- 2026-11-09T20:02:45+09:00 / Haiagaru NG確認 226 / ChMate 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/thread-watch-read-20261109/candidate226.apk / SHA256 abbc86415482d488f9ccb460df299131270b65a72070c804b9c28fc78f3392f0 / install-r Success。


追加テストAPKは全て同じMorphe鍵/cert、表示名Board adapter regression tests、versionNameなし。最終試験APKは以下。各同番号reporterを対象に、emulator-5580へinstall-r Success。

- app.haiagaru.tests.watchread191 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/thread-watch-read-20261109/tests191.apk / SHA256 ff146b5a9fc5dd1db6e1996624a40fa66ea16a0794ec8d6a19b68956d752519f。

- app.haiagaru.tests.watchread226 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/thread-watch-read-20261109/tests226.apk / SHA256 3a2017e98bc2c1bbd2d174d8e717c111b8865705f0552ca7052edcbea8d123b5。

- app.haiagaru.tests.watchread242 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/thread-watch-read-20261109/tests242.apk / SHA256 7180aebb7819793f34b47b0f853245189cf33ff314146bbb32a23cede0cb029a。


修正前の再現時に導入したwatchread242の実APKを端末から取得して保全: C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/thread-watch-read-20261109/baseline-tests242.apk / SHA256 55639a4c23e773fa4a2e6fb32bb885357e02941683df9180c8dbb6d3c0b73c5b。先行191の同期待ちなし・診断追加のみの試験APKは後に上書きし、正確なハッシュを保全していないため、上記最終APKと同一扱いにしない。


試験のため3版のPOST_NOTIFICATIONSを一時許可し、元の全てOFFへ復元。架空板・架空スレのnative DB行を削除し、試験監視登録・通知を解除。製品の既読反映はDB読み取りのみであり、試験fixtureのDB書き込みとは区別する。既存sitegateway試験APKは前回導入済みを継続使用。結果と途中失敗はthread-watch-read-mute-20261109.md参照。

## 2026-11-09 ツールバー画像・投稿U+FFFD除去の候補

emulator-5580 / Haiagaru_Root_API36。製品は全てInstallVerifiedApk.ps1で既存証明書一致を確認してinstall-r Success。署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。実機未接続、実機変更・アンインストール・データ消去なし。

最終MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/post-replacement-20261109/candidate.mpp / SHA256 4fece41a4b0a1cad5f50d1bc84567fcb7cea823b32aaa2dc5ab757075ad2b1b0。ローカルdev.18表記の次版候補であり、公開dev.18とは異なる。時刻は導入ログ終了時刻の近似（JST）。

- 2026-11-09T22:01:39+09:00 / Haiagaru NG確認 191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/post-replacement-20261109/candidate191.apk / SHA256 6b1d7458db9c6a2f2f4c15552c524e5448c1188bff209c23582f56d7d0e4307a / install-r Success。

- 2026-11-09T22:19:14+09:00 / Haiagaru NG確認 226 / ChMate 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/post-replacement-20261109/candidate226.apk / SHA256 b0f0a255ef5e3f0ba62a183b07882e3b8eac0d90ddf46a5131caf32d8ba595b4 / install-r Success。

- 2026-11-09T22:20:37+09:00 / Haiagaru NG確認 242 / ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/post-replacement-20261109/candidate242.apk / SHA256 1e3456879647684552f61a435b9c39a8e07c85b766b89add4f5cd535fe5f8acf / install-r Success。


先行アイコンのみMPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/toolbar-icon-size-20261109/candidate.mpp / SHA256 478123a12d8ef04e1ba46b2c85c373702cc4b38c555368112f1d25f8295a812d。

- Haiagaru NG確認 191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/toolbar-icon-size-20261109/candidate191.apk / SHA256 84436eecde96291cc2333d73fa2595f36aab3f341bb4bd872da8bb6cacaff81b / 既存reporter191へ署名一致install-r Success、42/641項目成功。

- Haiagaru NG確認 226 / ChMate 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/toolbar-icon-size-20261109/candidate226.apk / SHA256 2292f60cb838c945f3515b769a8d0d26096dca50ab472d8f089d84d9301672aa / 生成のみ・導入なし。


試験APKは全て同じMorphe鍵/cert。最終postcleanupの表示名Haiagaru icon/post regressions、versionNameなし。sitegatewayは表示名Haiagaru isolated site tests、version1.0。全てemulator-5580へinstall-r Success、各同番号reporterが対象。

- app.haiagaru.tests.postcleanup191 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/post-replacement-20261109/tests191.apk / SHA256 0ae01820953bdbcf034760b00ad33d9161ca4b4befcdadca8332948884015b1b。

- app.haiagaru.tests.sitegateway191 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-inst/tests191.apk / SHA256 61a9b46082b5fbe0d84b5a47e874f2b9d05b7a2bc71ad11fb7cd6905e86cd710。

- app.haiagaru.tests.postcleanup226 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/post-replacement-20261109/tests226.apk / SHA256 582af114c48b5eef60a86d1f294e01111c26ceea49db76b7b7d93653bc14c9e7。

- app.haiagaru.tests.sitegateway226 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-inst/tests226.apk / SHA256 06a7f7b5420fa327e8af02b053f1bb809be38ba689b6d1867ee61ec4455e45ff。

- app.haiagaru.tests.postcleanup242 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/post-replacement-20261109/tests242.apk / SHA256 d8bd85f90544e82c163bfa62f3ebde468ed648037e78a6777b0bbbb6eb1227cd。

- app.haiagaru.tests.sitegateway242 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-inst/tests242.apk / SHA256 a37c7c8601b09d12fbb384b4eae3d0844de3497b95b3de730c6fe447f492b440。


未修正191の再現に用いたテストAPKを端末から保全: app.haiagaru.tests.toolbaricons191 / 表示名Board adapter regression tests / versionNameなし / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/toolbar-icon-size-20261109/baseline-tests191.apk / SHA256 bf1a3c514f5fd05885d3c4db98a1032e5ba1993afb654fb8bbc821dc57d58a3d。先行42項目のtoolbaricons191試験APKは C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/toolbar-icon-size-20261109/tests191.apk / SHA256 5eb5eb9dc63647e36530a5a1e90e7fb6a1e3a7c8f587111dab15ac3987d06c94 / 同じ鍵でinstall-r Success。


191回帰の初回・再試行は古いローカル接続先の画面エラーで停止。退避したtabletHome2の診断では左77タブ。コールド起動とFixtureTabSandboxによる未登録loopback板タブの一時分離後、同じ製品で641項目成功。sandboxは試験開始時の5キーを退避してfinallyで復元する。保存済みの実登録・画像・通常タブを削除しない。診断のためemulator-5580のadbdを一時rootへ変更してprefsを読み取り、製品設定のraw書き換えは行っていない。

## 2026-11-10 設定文字列・送信本文・検索・あにまん表示・保存操作の統合候補

emulator-5580 / Haiagaru_Root_API36 / Android API36。製品3版はInstallVerifiedApk.ps1で既存署名一致を確認しinstall-r Success。署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/nov10-followups/final.mpp / SHA256 b25c84455b84da61f49f3d55cd4f806a03650f350ac553d7f7bda771e4e7c161。ローカルdev.19表記の次版候補であり公開dev.19とは別。実機変更・アンインストール・データ消去なし。

- 2026-11-10T18:20:06+09:00 / Haiagaru NG確認 191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/nov10-followups/final191.apk / SHA256 bfde231b9a524697dc4d7db74254d8849cf6c595219de434f4b76ee6e10b99d9 / install-r Success。

  試験APK app.haiagaru.tests.sitegateway191 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-inst/tests191.apk / SHA256 4f761bce5bdbfdd718f4490d7fcb1982c55621c4d2cc15608f42593c0f8d9c86 / 同じMorphe鍵・署名でinstall-r Success、対象reporter191。

  試験APK app.haiagaru.tests.postcleanup191 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/nov10-followups/tests191.apk / SHA256 979015619230723b9b0a59480679c5dce9373dea8d2fdebeef5875ca7b71be60 / 同じMorphe鍵・署名でinstall-r Success、対象reporter191。

  試験APK app.haiagaru.tests.ipwarning191 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ip-post-warning/inst/tests191.apk / SHA256 6d38051cda7fd59064877bbc40ae0ac9ae5fa93ea8a5ec25d1851dd16053f4bb / 同じMorphe鍵・署名でinstall-r Success、対象reporter191。

  検証: {'gateway': 'PASS 678 gateway/native URL checks; upstream GET=292, isolated POST=16; public posts=0', 'links': 'PASS 30 settings link checks; ui=true', 'media': 'PASS 28 production emoji/post/render/autoplay/audio-focus checks; public network/posts=0', 'export': 'PASS exported 186 Japanese setting entries / 392 actions'} / CSV対象 392文字列の集合一致・全てclickable。

- 2026-11-10T18:20:46+09:00 / Haiagaru NG確認 226 / ChMate 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/nov10-followups/final226.apk / SHA256 c3528f0e7c8f6107d015105c1f781f0becf2f791d464a727eb4e132777966da6 / install-r Success。

  試験APK app.haiagaru.tests.sitegateway226 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-inst/tests226.apk / SHA256 1770397b0e1753839571190c2df8477191535f5cf043a159e5453ba821c30378 / 同じMorphe鍵・署名でinstall-r Success、対象reporter226。

  試験APK app.haiagaru.tests.postcleanup226 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/nov10-followups/tests226.apk / SHA256 33714aa70d29016a879ee00627a881708944fb0ade042d531e20e6da51cb183c / 同じMorphe鍵・署名でinstall-r Success、対象reporter226。

  試験APK app.haiagaru.tests.ipwarning226 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ip-post-warning/inst/tests226.apk / SHA256 5c6acb120140e5515ce5cd31a26f80c75dd44f41e767ca9910b8b0082642bafd / 同じMorphe鍵・署名でinstall-r Success、対象reporter226。

  検証: {'gateway': 'PASS 684 gateway/native URL checks; upstream GET=292, isolated POST=16; public posts=0', 'links': 'PASS 30 settings link checks; ui=true', 'media': 'PASS 31 production emoji/post/render/autoplay/audio-focus checks; public network/posts=0', 'export': 'PASS exported 183 Japanese setting entries / 383 actions'} / CSV対象 383文字列の集合一致・全てclickable。

- 2026-11-10T18:21:06+09:00 / Haiagaru NG確認 242 / ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/nov10-followups/final242.apk / SHA256 d69b4a67aea56f88eed38e4cad6bba1ce668014b6b1e16f44517cf6e1be75659 / install-r Success。

  試験APK app.haiagaru.tests.sitegateway242 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-boards-inst/tests242.apk / SHA256 d489792e115ca7fe94e5cdb1b0c55d11aa00a64ab0fd8337e344617e2ea46c61 / 同じMorphe鍵・署名でinstall-r Success、対象reporter242。

  試験APK app.haiagaru.tests.postcleanup242 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/nov10-followups/tests242.apk / SHA256 dba38e918f4a25f490d1612fdaf6c138eea6b37abb1643df3be02e6aeecefbe5 / 同じMorphe鍵・署名でinstall-r Success、対象reporter242。

  試験APK app.haiagaru.tests.ipwarning242 / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ip-post-warning/inst/tests242.apk / SHA256 fb9d8bcd29a98d1943d6c71593bd33bbe6505318f8c762fc6c0442b7f48d9518 / 同じMorphe鍵・署名でinstall-r Success、対象reporter242。

  検証: {'gateway': 'PASS 681 gateway/native URL checks; upstream GET=291, isolated POST=16; public posts=0', 'links': 'PASS 30 settings link checks; ui=true', 'media': 'PASS 31 production emoji/post/render/autoplay/audio-focus checks; public network/posts=0', 'export': 'PASS exported 183 Japanese setting entries / 383 actions'} / CSV対象 383文字列の集合一致・全てclickable。


起動直後のSystem UI応答停止はUI XMLでSystem UIのダイアログとWaitボタンを確認して復帰。製品のクラッシュとは区別。最終候補の通し確認はcleanup/tabRestoreエラーなし・公開投稿0・crash-final.log空。FixtureTabSandboxは元タブ5キーをfinallyで復元。先行候補の失敗と修正経過はsettings-links-191-post-cleanup-20261109.md / thread-search-animanch-save-20261110.md。実機・公開POST・実際の公開動画の保存完了・長時間は今回未確認。

## 2026-11-10 共有NGタイムアウト対策の検証

emulator-5580 / Haiagaru_Root_API36 / API36。署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-timeout-20261110/final.mpp / SHA256 a15d940aa3c55ae6facc2cbad537dec9da9103c0ee84603996f306fb745ada74。ローカルdev.20表記の次版候補であり公開dev.20とは別。既存reporter3版へ署名一致install-r成功。実機変更・アンインストール・データ消去なし。

- 2026-11-10T19:57:35+09:00 / Haiagaru NG確認 191 / ChMate 0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-timeout-20261110/final191.apk / SHA256 426cfa6239f56fd1ddfb15fce6ee26867a959372d6497fd18b9d6039f7ebdddd / install-r Success。

  試験APK app.haiagaru.tests.sharedsync191 / Shared NG synchronization tests / versionNameなし / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-timeout-20261110/tests191.apk / SHA256 c76ad7e08b2e519078c004849285cb257b29160f145b86479b2ad1317960a708 / 同じMorphe鍵で署名・導入、最終インストール済みAPKをpullしてSHA256一致を確認。

  結果 {'sync': 'PASS 15 live receive and isolated shared NG sync checks; public POSTs=0; user cache/settings unchanged', 'live': 'HTTP GET only; conditions=3853; elapsedMs=5962', 'gateway': 'PASS 648 gateway/native URL checks; upstream GET=287, isolated POST=16; public posts=0'}。既存sitegateway試験APKの版と署名は前項の台帳どおり、今回更新なし。

- 2026-11-10T19:57:53+09:00 / Haiagaru NG確認 226 / ChMate 0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-timeout-20261110/final226.apk / SHA256 ed6dd8941d0bf2d2d55a33a68e7b08bcbc07d3ca357a6b6aa1320f7aa35d08b6 / install-r Success。

  試験APK app.haiagaru.tests.sharedsync226 / Shared NG synchronization tests / versionNameなし / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-timeout-20261110/tests226.apk / SHA256 d188f1c8fb60c613d2937edbffa38db0625fc001c40beba09c0b67531c58083f / 同じMorphe鍵で署名・導入、最終インストール済みAPKをpullしてSHA256一致を確認。

  結果 {'sync': 'PASS 15 live receive and isolated shared NG sync checks; public POSTs=0; user cache/settings unchanged', 'live': 'HTTP GET only; conditions=3853; elapsedMs=4805', 'gateway': 'PASS 653 gateway/native URL checks; upstream GET=286, isolated POST=16; public posts=0'}。既存sitegateway試験APKの版と署名は前項の台帳どおり、今回更新なし。

- 2026-11-10T19:58:18+09:00 / Haiagaru NG確認 242 / ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.reporter242 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-timeout-20261110/final242.apk / SHA256 7a924372e16d2ea57c1e094111fa3cf53bebdbb53b4a1f59ffbd02bc610850d6 / install-r Success。

  試験APK app.haiagaru.tests.sharedsync242 / Shared NG synchronization tests / versionNameなし / C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-timeout-20261110/tests242.apk / SHA256 65be2fdba15a1032b9eb3bce88f4643331cd861ee2198716dc85b1699dd2c1b4 / 同じMorphe鍵で署名・導入、最終インストール済みAPKをpullしてSHA256一致を確認。

  結果 {'sync': 'PASS 15 live receive and isolated shared NG sync checks; public POSTs=0; user cache/settings unchanged', 'live': 'HTTP GET only; conditions=3853; elapsedMs=6219', 'gateway': 'PASS 651 gateway/native URL checks; upstream GET=288, isolated POST=16; public posts=0'}。既存sitegateway試験APKの版と署名は前項の台帳どおり、今回更新なし。


同期試験のHTTPS転送fixtureは試験プロセスだけに設定し、終了後に各reporterをforce-stopして解除。試験用prefs/ディレクトリは削除、製品の元context/rules/状態をfinally復元。公開POST0・最終crash空。初回のDNS/応答判定失敗と再確認はshared-ng-timeout-20261110.mdへ記録。

## 2026-11-12 DAT共有の検証用APK

- 19:12 JST / Haiagaru DAT検証 / ChMate 0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.datshare242 / Mi Note 10 (d5497008) に新規インストール成功。初回起動で使用許諾画面を確認。
- APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/dat-share-check/device242.apk / SHA256 b851090bed53355fa79c69322e55ce0beeaf782374bad6f63650581ac747be1d。
- MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.25.0-dev.24.mpp / SHA256 714a7eff81591eca5b874be535e8c02e726d888a4fc880f53f7b7671fabcf84f。ローカル作業ツリーのビルド。
- 署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。

## 2026-11-13 外部板日時・provider設定の検証APK

- 01:51 JST / Mi Note 10、Android 11、serial `d5497008`。既存 `jp.co.airfront.android.a2chMate.haiagaru.reporter242`（表示名「Haiagaru NG確認 242」、ChMate `0.8.10.242 dev`）へ同一パッケージ・同一署名で `adb install -r` 成功。アンインストール・データ消去なし。更新前の端末APK SHA256 `0B6E84DC76259557885E9DD75BFF485BB505FC057EA8E05FDACE89E2A5E8696A`、`firstInstallTime=2026-11-06 00:30:25`。更新後 `lastUpdateTime=2026-11-13 01:51:33`。
- 候補APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/site-date-device/reporter242.apk` / SHA256 `EFFEFC1F1F3D2CF3CBF6E5D002972DF90A4D7CA59B54F715DEAA6D272CC021B3`。端末からpullした導入APKも同じSHA256。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.25.0-dev.31.mpp` / SHA256 `5E4D2DAB01D35FF6C71D9D7E58FDC19F2B5374C3A5B65B510C362371F17DF2BE`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe` / 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。更新後のHomeActivity表示とcrash buffer確認まで実施。
