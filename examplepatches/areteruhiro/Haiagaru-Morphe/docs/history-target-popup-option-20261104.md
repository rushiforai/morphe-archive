# 履歴ポップアップの対象表示設定

「表示・操作」に「履歴ポップアップに『対象』タブを表示」を追加。キーshowRefreshTargetsInHistoryPopup、初期trueでdev.3の表示を維持。既存の設定ファイル用boolean catalogへ追加。HOMEの対象表示と登録集合は変更しません。

popup再表示のrestoreで対象cell全体をGONE/VISIBLEにし、4/5タブのweight配置・下線・ラベルをまとめて反映。非表示時の選択1は0へ戻し、元のnativeスレ履歴を表示。既存のtab indexは保持するため板・書き込み・画像のdispatchがずれません。選択のguardをselectにも置き、隠れた対象を誤選択しません。

通常Lint付き :patches:build / :patches:buildAndroid 成功2m37s、64 tasks。3版へ適用/署名と既知台帳hash照合install-r成功、最終APK hash一致。MPP SHA256 31d6e305258f3e4b11a2109269fe7ae2a57bbd1db720613f37654f5b3766323b。

emulator-5580/Android16のbindings191/226/242で各47項目成功。設定DISPLAYの実SwitchをperformClickしてOFF保存→popup再表示→対象cellの余白/下線ごと非表示→選択中対象からスレへ戻る→残4タブdispatch→登録集合保持→ON保存→同じpopupの対象復帰と選択を確認。既存履歴下部/強調と標準起動も検証。データベース試験書込/削除なし、一覧はメモリ内、設定は復元、投稿なし・外部通信OFF。HOME本体/ソーター19143/22651/24266メソッドのnative命令/branch/register全保持を比較。変更外本文/画像/GIF/動画の広い反復試験は既存利用者指定により省略。新規対象app crashなし。先行242タイトル操作の実画面未確認はそのまま残す。

導入原本 build/local-development-records/history-target-option-installations.json、公開台帳docs/android-installations.md。試験scripts/history-target-option-runtime.js、ログbuild/history-target-option-*-runtime.log。AVDはwm size reset/WiFi ON/mobile OFFへ戻し、データ保持で停止。実機/GAS/投稿/正式Release変更なし。

## プレ版公開

[1.23.0-dev.4](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.0-dev.4)を既存Semantic Release CI41760677393で公開、Attest success。実装0b0704c。公開MPP SHA256 `d1751efa4f065ae64060b422356e09a55dd584bc6198cac86aacd3211f67f904`。配布6assetのsize/SHA256/digest・CRC・設定キー同梱を確認。dev両feedは1.23.0-dev.4、master/main両feedは正式1.22.1のまま。証跡build/release-1.23.0-dev.4-verify/verification.json。
