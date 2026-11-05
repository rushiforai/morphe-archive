# 共有NGのチェック直接操作と履歴初期オフ

履歴のshowRefreshTargetsInHistoryPopupは読込側/設定表示とも初期falseへ変更。既存の明示true/falseは移行・上書きしない。HOME対象と登録集合は維持。

ModelUiのListView choice描画は従来CheckboxのonCheckedChangeがnullで、条件の親SurfaceだけがperformItemClickしていました。チェック部分にも直接callbackを持たせ、native performItemClickへ1回委譲。手動でsetItemCheckedを重ねず、ListViewのcheck stateとSharedNgExceptionsのdisabled集合を一致させる。enabledもadapter/viewの条件に従う。既存ListViewの描画経路なので通常の行タップは維持。

## 調査・検証

旧候補191/242では実showResponseExclusions経路で文字部分のタップ/保存は成功し、報告の操作不能すべては再現していません。チェック部分の独立したcheckable semanticsは旧UIに存在せず、直接操作の試験ではcheckable targetが0件でした。独立した操作を追加し最終候補でtarget1件を確認。版とタップ箇所を利用者へ質問済み、回答未受領時点。原因をユーザー環境で断定したものではありません。

通常Lint付きbuild/buildAndroid成功2m20s、64tasks。最終MPP SHA256 d3bc222fab6e1faca1e210fd379145ecad9ed6d378ff9ec5fc49e544cf34fc25。3版へ適用・既知旧APK hash/署名照合install-r成功、最終実APK hash一致。

191/226/242各版でshowResponseExclusionsの本番dialog経路を使い、合成RuleとInputをメモリへ一時設定、実Android tapでチェック部分と文字部分それぞれOFF→ON→OFF、再度ONから保存callbackのexceptions永続化を確認。kind/board/exceptionの設定とstatic fieldsを復元。DB fixture作成/削除なし、GAS/通信/投稿なし。検索・非表示チェック保持各9項目成功。履歴は初期false・明示true保持と標準切替を各48成功。新規対象app crashなし、AVDをsize reset/WiFi ON/mobile OFFへ戻してデータ保持停止。利用者実機未確認。変更外本文/画像/GIF/動画再試験は既存利用者指定で省略。先行242タイトル欄の未確認は残す。

試験scripts/shared-ng-response-choice-touch-runtime.js / history-target-default-off-runtime.js、既存shared-ng-exceptions-search-runtime.js。ログbuild/shared-ng-toggle-defaultoff-*、原本build/local-development-records/shared-ng-toggle-defaultoff-installations.json。

## プレ版公開

[1.23.0-dev.5](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.0-dev.5)を既存Semantic Release CI41763130598で公開、Attest success。実装10e18d9/生成96fc798。公開MPP SHA256 `3cd96dd81c3b92e442d727a1dcb5e3f38ec9377e22d44f7bdb2e0af40ce37f9a`。公開6assetのsize/digest/SHA256・CRC、設定キー/関連クラス同梱を確認。dev両feedは1.23.0-dev.5、master/main両feedは正式1.22.1のまま。証跡build/release-1.23.0-dev.5-verify/verification.json。
