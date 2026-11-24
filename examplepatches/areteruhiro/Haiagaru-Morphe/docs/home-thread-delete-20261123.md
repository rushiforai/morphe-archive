# HOMEのスレ削除直後の表示更新

削除完了の共通callback `BrowsingHistory.nativeThreadDeleted` は履歴用コピーを除外していたが、★一覧等の保持元は削除行を残していた。アーカイブ完了時に使う短時間の除外記録を、スレ削除完了時にも設定してからHOMEを再描画する。旧版の保持fragmentだけが残っている場合も全HOMEモードを更新する。

`removeDeletedHistoryThread` 自体の対象は広げず、履歴のみ削除する操作の意味は維持する。板IDとスレIDで照合し、別板の同番号は除外しない。後から新しい閲覧日時で開き直した行は再表示する。

ビルド `:patches:buildAndroid` は3分26秒で成功。ADB `d5497008` の検証用242 `jp.co.airfront.android.a2chMate.haiagaru.reporter242` へ署名照合後install-r成功。APKは `build/home-native-drag/home-delete-install/test242.apk`。詳細は導入台帳。

Fridaで実ChMateの行クラス・板IDを生成し、native削除完了callbackを実行。HOMEモード100/101/102/103/108/109で保持していた表示用コピーから削除行が即時除去されること、再変換でも戻らないこと、別板の同番号が残ること、新しい閲覧日時の再表示を確認（7項目）。実DBへのスレ削除・実お気に入りの変更は行っていない。191／226も同じ共通処理へ適用されるが、今回の候補の実機導入・検証は242のみ。

証跡: `build/home-native-drag/check-home-delete.js` / `.py`。
