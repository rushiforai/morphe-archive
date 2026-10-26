# 2026-10-24 サムネイル・常時下部フィルター・下4桁NG（未公開）

追記: 正式版1.12.1で公開済み。以下の「未公開」「公開なし」は作業時点の記録。

## 公開結果

- 7da6ae7をdevへpush、a28fe67でmasterへ通常merge。別作業の外部認証3ファイルは未コミットのまま保持し公開せず。主開発先はdev、CI生成b9f3117までFF取得。
- 既存Semantic Release CI39983601471は全体success、Release/Attestともsuccess。https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.1 はdraft=false/prerelease=false/latest。
- build/release-1.12.1-verifyへ公開6資材を取得、GitHub digest全件一致、Android MPPのclasses.dex確認。MPP SHA256=a78dade2ca167e4ddfc991c8e14338aa5d9b7d345fdfd3d5cca0298196d012ae。
- 公開説明に差分・ライブラリZIP案内・確認範囲・ｵｲｺﾗﾐﾈｵ 様/Red Frame X 様の謝辞。UA変更や機種名を含めず、専用の公開説明MDは追加していない。
- master/mainのJSON各2本とdev preは1.12.1、created_at=2026-10-23T16:05:49（Z/offsetなし）。dev stable raw初回はCDN旧1.12.0だったが、その後のmanager fresh logcatでmain/dev取得とversionHash1.12.1を確認。emulator-5554の登録先main・プレONを維持しカード/詳細とも1.12.1。
- 公開MPPからのAPK再生成・再導入は未実施。端末検証は直前候補であり、報告された実新着到着条件は未再現のまま、Release本文にも明記。

## 修正

- 242の通常setImageLinksからsetImageLinks2へ渡すrequery=trueを専用bridgeでfalseへ変更。nativeは再bind時にsetImageUrl(null)を行っており、その消去を通常表示から分離する。明示的な再取得用setImageLinks2自体は変更しない。全画像のダウンロード禁止やキャッシュ消去はしない。
- 常時下部フィルターは本文のbottom padding追加からbottom marginによる実viewport予約へ変更。getHeight()に基づくnative位置計算が固定パネルを含めないようにする。パネル配置には予約前のペイン下端を使い、margin累積を防止。MarginLayoutParamsがない場合のみ従来paddingへfallback。popupの重なりpadding処理は保持。
- ワッチョイ長押しの下4桁NG用wacchoiLongPressSuffixNgを復活・独立。本文側responseVisibility.76と旧visibility.76を保持し、長押し側未設定時は本文の表示設定に依存しない。191旧Menuに既存ID76がある場合もOFFで取り除く。226/242sheetも同じnameMenuVisible(76)経由。

## 確認

- 最終通常Lint付きAndroid build成功（3分41秒）。build/thumbnail-viewport-menu-final-build.log。
- 最終242 APKのnative DEX検査成功。setImageLinks内1箇所のdelegateだけ変更、元operand/分岐保持、明示retryの全命令保持、5register bridgeの引数確認。scripts/VerifyThumbnailRebind242.java。
- emulator-5554の既存resumefix242へ同一署名照合install-r Success。設定・データ保持、実機未変更。
- 最終242: scripts/frida-suffix-ng-menu-separation-test.jsの17項目成功。両メニューON/OFF組合せ、旧本文設定保持、設定Switch、既存native Menu項目のOFF除去とON追加。NG登録保存なし、検証設定復元。
- 最終242: 常時下部フィルター23項目成功。viewport高の縮小とpadding不変、ペイン境界、上部併用、AA切替、繰返し予約なし、OFFで元viewport復元、従来popup。build/persistent-viewport242-final.log。
- 最終242: 本体のcached response150へのnative移動・末尾移動7項目成功、フィルターで隠れず、位置/設定復元。build/pinned-navigation242-final.log。
- 最終242: 実response2のサムネイルをnative adapterで5回再bindし、同一pixels/URL/Viewを確認。build/thumbnail-pixels242-final.log。初期fixtureはViewParentのequalsをJava.castせず失敗、修正版fixtureで成功。
- Fridaのinlined呼出し観測では通常delegateを捕捉できず、retryだけ捕捉したため、その実験を成功扱いにしない。最終の確認根拠はDEX命令保持検査と実画素比較。試行ログはbuildへ保持。
- 新規crash bufferなし（最新は既存10/23 08:45 Frida SIGSEGV）、lastanrなし。/data/anr最新は既存10/23 11:09:56由来。長時間利用は未確認。

## 残る確認

- 報告されたエッヂの新着スレを閉じて開く一連の操作は未再現。native viewport/移動先/末尾の検証をその代わりの完全再現とは扱わない。実際の新着到着条件での追加確認が必要。
- 191/226は共通Java変更で、今回の端末導入・操作は省略。191旧Menu経路は242上の実Menu＋合成responseで確認したもので、191アプリ本体の操作ではない。
- popup余白処理は保持したが、新margin方式での全native popup種類は未確認。
- 公開・バージョン変更なし。

## 正式公開前の追試

ユーザーから正式Releaseと謝辞追加の指示を受け、1.12.0との差分を確認。別作業中のBoardAuthRules/ExternalBoardAuth/VerifyBoardAuthRulesは公開対象外とし、変更は作業ツリーに保持する。.releasercの既存release-notes headerを今回の差分・ライブラリZIP案内・確認範囲・ｵｲｺﾗﾐﾈｵ 様/Red Frame X 様の謝辞へ更新。公開向けの追加MDは作らない。

242最終候補をFridaなしでforce-stop後cold起動し、Part3本文、スクロール、レスpopup、サムネイルから167KB/820x1800画像の実表示を再確認（build/official-fix242-image-final.png）。crash buffer最新は既存Frida記録のまま、lastanrなし、/data/anr最新も既存のまま。native DEX保持検査も再実行成功。実際の新着到着条件の未再現はRelease本文に明記し、完全修正と断定しない。

## 導入記録

絶対root: C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/

- 最終APK build/thumbnail-viewport-menu242.apk SHA256=6DAD5A637F152C2D9C149136047F8FED215E850B71132285F54B3EB20416DA27。
- 最終MPP build/thumbnail-viewport-menu-final.mpp SHA256=DB98FAFCF7E7F9CE3D6DD0D008348989D6C0755547054C1A934D291A3B0B5311。
- package jp.co.airfront.android.a2chMate.haiagaru.resumefix242、Haiagaru 検証 242、0.8.10.242 dev、emulator-5554、2026-10-24 00:59頃JST導入、Success。
- 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256=0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- 途中候補 build/thumbnail-viewport242.apk SHA256=E681E529AC9587AC505BD8021F13D7B2C5EEECEBDD7463B67871CCDFE9119F05、MPP build/thumbnail-viewport-final.mpp SHA256=17F542263B60C5447455BF872D846483147B26655979117D29FFC7AEE1085991。同一package/署名で更新後、最終候補へ上書き。旧Menuの既存ID76除去は途中候補には未収録。
