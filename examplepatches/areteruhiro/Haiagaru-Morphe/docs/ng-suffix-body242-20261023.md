# 242 本文長押しから下4桁NG登録が開かない

## 原因

- 191／226のMenuItemリスナーや旧ポップアップと異なり、242の本文メニューはResMenuDialogFragment.cのCompose用dispatchからResponseArchive.handleを呼ぶ。
- その共通dispatchには上4桁NG・保存・強調などが接続されていたが、下4桁NG（ID 76）が欠けていた。WacchoiLongPressMenu.dispatchSuffixNgItemにはリスナーを呼ぶ処理があるが、これは旧ポップアップの経路であり242の本文メニューからは通らなかった。
- 初期調査では既存メニュー項目の早期returnも疑ったが、242はappendDialog242でprepareして再バインドしており、今回の修正理由は早期returnではなく上記dispatchの欠落。

## 修正

- ID 76の既存リスナー呼出しをhandleSuffixNgへ分離し、ResponseArchive.handleから接続。旧ポップアップも同じ共通dispatchへ委譲する。
- ID 76以外の本体操作は従来へ返す。リスナーのない項目は消費しない。登録内容・対象板・上4桁NG・長押しコピーの仕様は変更しない。新たなバイトコードフックやレジスター変更はない。

## 確認

- 修正前の242検証用アプリで、実際のnative MenuItemに登録されたクリックリスナーを用いて再現。ResponseArchive.handleはfalse／callback 0回、既存popup経路ではtrue／callback 1回だった（build/ng242-body-before.log）。UIAutomatorでNGName追加、対象板、入力値-m/EI、キャンセル／OKを確認。保存せず戻った。
- VerifyWacchoiNgPopupで実ソースの共通dispatch接続、両入口で1回のみの呼出し、継承フィールド、他ID・null・リスナーなしのfallbackに成功。
- 通常Lint込みAndroid build成功（build/ng-suffix242-dispatch-build.log、6分26秒）。生成242 APKのsuffix gesture hooks（rows=1／compose=1）と既存native tab factoryのregister・operand・分岐・stock constructor保持検査成功。
- 修正版では同じnative itemでResponseArchive.handle=true／callback 1回（build/ng242-body-after3.log）。UIAutomatorでNGName追加・対象板・-m/EIを確認。
- その後Fridaを終了し、実Part3スレの本文をADB長押しして「ﾜｯﾁｮｲ下4桁をNG登録」をタップ。NGName追加・対象板・選択したレスの-m/EI・OK／キャンセルが表示されることをXMLと画像で確認。保存せずキャンセルした（端末ng242-real-menu-after.xml／ng242-real-dialog-after.xml、build/ng242-real-dialog-after.png）。実操作中の新規crash／ANR記録増加なし。
- 修正版の初回起動後に応答待ちダイアログが残っており、最初の追試2回はFocused host requiredで中断した。保存したANRは11:09:56の起動未完了（VungleProvider.onCreate／ActivityThread.installContentProviders）で、NG操作より前の記録。起動完了後に待機を選んで正常画面へ戻り、上記を追試。原因をNG修正と同一と断定しないが、公開判断では未解決記録として保持する（build/ng242-anr-110956.txt）。dumpsys lastanrは記録なしと返す一方、/data/anrには記録があったため、後者も確認した。

## 候補導入（未公開）

- emulator-5554、ChMate 0.8.10.242 dev、表示名Haiagaru 検証 242、package jp.co.airfront.android.a2chMate.haiagaru.resumefix242。同一署名照合install-r成功、既存データ保持。
- ルート C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/ 。
- build/ng-suffix242-dispatch.apk SHA-256: 3910B7C7E27B1218F61B959F11A8D6AEA967C765F6EB934B7F6C4759D8270156。
- build/ng-suffix242-dispatch.mpp SHA-256: 1AEB6FCD3AA1C41CE5EC0F6EE2374FA342CE8D725D799489131A95CD947D4B8A。
- 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA-256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- 先行作業のスレ側タブ移動（main Handlerへの遅延呼出しを含む）も保持。そちらの検証は完了していない。191／226は今回の実機再導入なし。公開dev.12とは異なる未公開候補。
