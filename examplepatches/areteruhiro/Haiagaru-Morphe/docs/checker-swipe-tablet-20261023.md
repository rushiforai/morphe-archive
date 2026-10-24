# 必死チェッカー・タブ内左右スワイプ

## 報告と公開停止

- 公開済み1.12.0-dev.11の191で、左ペインの必死チェッカーを右スワイプすると落ちるとの報告。「専用ビュワーの左右スワイプ：無効」以外で発生。画像①②を直接取得・目視確認。
- 公開作業中のCI 39925498541をキャンセル。実装5ed5283と生成コミットf931cbaまでは作成済みだったが、タグ1.12.0-dev.12・GitHub Release・配布資材は未作成だった。後続の既存Semantic Release CIで公開する。生成JSONは手編集しない。

## 後続の公開確認

- CI 39932756756が成功し、生成コミットd5cca1c・タグ1.12.0-dev.12を作成。Releaseはdraft=false／prerelease=true。6配布物すべてのSHA-256がGitHub digestと一致し、公開MPPにclasses.dexがある。
- 公開MPP SHA-256: 6FC6D59324CEB372F74EC88E465E74CADF4E17AE48863537808E99284A55CA7C。
- devのJSON2本は1.12.0-dev.12、created_atは2026-10-23T09:35:09（Z／offsetなし）。mainの正式版は1.11.2を維持。
- emulator-5554でプレリリースONを確認。更新前からfresh logcatを採取してmain/devの実取得URLとPatchBundleEntityのdev.12を確認。更新後のソースカード・詳細もdev.12。登録先やデータは変更していない（build/morphe-dev12-refresh.log、端末morphe-dev12-after.xml）。
- 続けて依頼されたスレ側の隣接タブへの左右ジェスチャーは、この公開後の追加作業でありdev.12には未収録。

## 変更

- WebViewのOnTouchListenerがACTION_UP内で直接goBack/goForward/finishを呼んでいた。UPを消費するときはWebViewへACTION_CANCELを通知し、履歴移動をpostしてタッチdispatchの後に実行する。
- ToolScreenController.finishもpostで実行し、同じ画面からの重複終了を抑止。既に破棄した画面の終了を実行しない。
- タブ内の投稿検索／必死チェッカーの戻り先はActivity.onBackPressedではなく、元のNativeToolFragmentを引数にしたnative close。左ペインでも右ペインの選択や本体全体の戻るに依存しない。アドレス入力フォームも同じ経路。単独Activityの戻り先は元のコールバックを維持。

## 確認と限界

- Android buildは通常Lint込み成功、build/checker-swipe-safe-build.log（4分35秒）。バイトコードフック／レジスター接続は変更していない。
- 修正前の191で、左ペインの実WebViewへADBの右スワイプを行い、OnTouchListener→ToolScreenController.finishが同一dispatchTouchEventスタック上にあることを記録（build/checker-swipe191-active.log）。利用者のクラッシュと完全に同一の例外は取得できていない。
- 診断中にnative crash2件（PID17648、19298）が発生。後者のバックトレースはfrida-agent-64.soであり、ユーザー報告のJava/Chromiumクラッシュと同一原因と断定しない。ログをクリアせず保存。前者も診断接続がタイムアウトした旧プロセスであり、原因未確定。
- frida-checker-swipe-regression.jsは実タブ・実ActivityのMotionEvent dispatchを使用。外部サイトへは送らずローカルHTMLを表示し、履歴有無と履歴移動先は制御する。左右ペイン×無効/方向1/方向2×左右スワイプ＋履歴あり、計20ケース。191は149項目成功（build/checker-swipe-safe191-regression.log）。設定復元、タッチ中には終了しない、履歴移動がdispatch後、自タブのみ終了、本体生存を検査。
- 初回191/242のFrida起動はinstall/start直後のPID取得が早すぎて失敗。install完了／PID確認後に実行し直した。未実行を成功に含めない。
- 226は共有Java処理・native close経路は変更なしのため重複端末操作を省略。

## 導入

- 242も20ケース149項目に成功（build/checker-swipe-safe242-regression.log）。191ではその後、診断／履歴フックなしで実Hissi WebViewを左ペインに表示し、ADB右スワイプで自タブだけが閉じ、同じPID19624と右ペインのスレが残ることを確認。前後XMLはbuild/checker-before-real191.xml / checker-after-real191.xml。新規crash timestamp・ANRなし。セットアップ前に存在しなかった191のnativeToolTabs / hissiViewerSwipeHistoryキーは最後にremoveして復元（build/checker-swipe191-original-prefs.log）。

- 対象emulator-5554、191表示名Haiagaru 検証 191 / package=jp.co.airfront.android.a2chMate.haiagaru.settingsfix191、242表示名Haiagaru 検証 242 / package=jp.co.airfront.android.a2chMate.haiagaru.resumefix242。元APKから再適用し、既存署名照合install-r成功。アンインストール・データ消去なし。
- APKルート絶対パス: C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/
- checker-swipe-safe191.apk SHA256=66049EDF4D0D580C630A135867C890957A0C384C6DFE032FD73FC491219FB013
- checker-swipe-safe242.apk SHA256=B251F66E4B0B9258B78B27D3BEEDF30A6F111D81294D6869D36F1688841AA204
- 使用MPP: C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/checker-swipe-safe.mpp SHA256=C6CEFD9F51DC7D4EC591B758527F967F56DD4E8C787C8FA3B87882AC7B9D69A3
- 鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias=Morphe、証明書SHA256=0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。検証APKは未公開候補であり、ローカル1.12.0-dev.12表記は公開済みを意味しない。
