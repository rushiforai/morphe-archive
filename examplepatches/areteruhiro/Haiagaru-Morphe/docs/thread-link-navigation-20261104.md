# 本文中の古い5chスレURLを開くまでの待ち（静的修正候補）

報告: ChMate191で `https://egg.5ch.io/test/read.cgi/android/1784210927/` を本文からタップして遷移するまで遅い。URLのkeyは2026-07-16 23:08:47 JSTに相当し、報告日の2026-11-04では約110日前。

## コードから分かった経路

Haiagaruの `isArchivedThreadCandidate` は、現行のegg.5ch.ioでも作成から90日を超えればtrueにしていた。既定ONのchtoio/automaticDatではActivity/Tablet双方のURL入口でimportIfNeededを呼び、ローカルDATがなければworkerの取得完了までnative遷移を引き受ける。Activity側はfinish、Tablet側はtrueでnative側がreturnする。さらにrewriteLegacyThreadUrlも年齢判定でitestへ書き換えていたため、automaticDatがOFFでも現行サーバーURLが別経路になり得る。

1.20.0の先行修正は90日以内の通常URLをnativeナビゲーション先行へ変更したが、90日超/旧サーバーを残した（docs/thread-open-prefetch-regression-20261103.md）。今回URLはその残った条件に一致する。利用者端末でimportIfNeededが実行されたことや、通信/描画別の所要時間は未計測なので、全遅延の主因確定・解消済みとは扱わない。

## 修正

時刻/keyだけで遷移前取得・itest書換えを決める条件を削除。既存の閉鎖済みサーバー一覧/旧2ch.netだけをArchiveThreadLinks.requiresLegacyServerRecoveryへ抽出し、Activity/Tablet・URL書換えの両方で使う。報告URLはそのままnativeスレ画面を先に開く。

現行サーバーの初回本文取得は、従来からあるnative DAT worker bridge（loadLiveTalkDat→loadInitial5chDat）が担当し、live失敗時のarchive route fallback・設定OFF・cached DATのnative更新を保持する。このworkerとimporterの実装、DAT/IDX/既読/NG/履歴は変更しない。Talk/VIP/旧サーバー向けの前置復旧も維持。共通extension修正なので191/226/242へ共通適用するが、bytecodeフック追加/変更はない。

## 確認と未確認

ArchiveThreadLinksTestは報告URL/現行サーバー/大文字host/外部host境界/旧サーバー19種×3ドメイン/既存HTTPS化を含む87項目成功。通常Lint付き :patches:build :patches:buildAndroid は2m30sで成功（build/thread-link-navigation-build.log）。最終MPPのCRCとrequiresLegacyServerRecovery同梱を確認。

ローカル候補: `build/haiagaru-thread-link-navigation.mpp` SHA256 `3c7236f905ad3d770f7e4054dc2eac09a801719d2a860ebb8a3065cd25c50edd`。

端末へのインストール、実リンクタップ・DAT取得・本文表示・旧サーバー復旧の実動作、修正前後の実時間は未確認。新しいAPKは生成していない。利用者の静的修正方針を維持し、公開/実機/GAS/掲示板投稿は実施しない。ローカル候補の内部dev.10表記は公開済みdev.10とは異なる。

## 検証用プレ公開の指定

利用者が静的修正結果と端末未確認の報告後に「プレリリースして」と指示。今回も先行の静的/検証用方針を維持し、端末の基本動作試験を成功扱いせず、公開冒頭へリンクタップ/本文取得/表示/速度未確認と明記する。既存Semantic Release CIをdevへの通常pushで実行する。GASのBANは別途反映済みの設定であり、このアプリ配布にGAS変更や識別子を含めない。

公開試行は未完了。実装432052b、CI41818640185はタグpushのGitHub Internal Server Errorで失敗（2026-11-04 20:08:08 JST）。attempt2での再実行は公開なしのcompileへ。生成されたdev branch状態から既存release.ymlをworkflow_dispatchしたCI41820222878でも20:23:39 JSTに同じタグpush失敗。生成3e96489/98861c4を通常FF取得。dev.11のRelease/tag APIは404で配布物未作成。CI生成のfeed/gradle versionがdev.11でも公開済みではない。手動タグ/Release/assetや生成ファイルの修正は行わない。GitHub復旧後に既存CIを最新devから再実行し公開物を検証する。ローカルログはbuild/thread-navigation-release-failure.logとbuild/thread-navigation-release-dispatch-failure.log。

復旧追記: 共有NG大量文字列検索の追加f28f244を含めCI41823578007でdev.11公開完了（2026-11-04 20:51:17 JST）。Release/Attest success、生成01ce123をFF取得。公開assetのCRC/SHA256とrequiresLegacyServerRecovery同梱、dev feed反映、正式1.22.1保持を確認。前段の失敗記録は履歴として保持する。詳細docs/shared-ng-many-rules-20261104.mdとbuild/release-1.23.0-dev.11-verify/verification.json。
