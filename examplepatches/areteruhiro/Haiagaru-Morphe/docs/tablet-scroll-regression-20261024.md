# 242 dev タブレット縦スクロールの残像感（未公開）

## 報告

新規インストール比較で1.9.3は正常、1.11.1で残像感。1.10.0/1.11.0はスレ起動クラッシュのため比較不可。利用者は通常120fps→60fps程度に感じるとのこと。追加回答は242 dev、おそらく縦スクロール。実fps測定値ではない。

## 差分調査

- `git log 1.9.3..1.11.1 -- ReadingPosition.java` で52c0f2eの新規導入を確認。
- この処理は常時有効で各スレfragmentのViewTreeObserverにpre-drawを登録。各描画でanchor()を呼び、adapter/レス探索、PackageManager.getPackageInfo、URL正規化/正規表現/反射を実行後に既確認keyか判断していた。
- タブレットで保持されたfragmentにもwindowの描画通知が及ぶため、不要な繰り返しになり得る。発生時期と一致する有力な候補だが、報告端末の実測/因果確定ではない。
- ソース検索上、スレ画面にsetFrameRate/preferredRefreshRate/preferredDisplayModeId等で60Hzを固定する処理は見つからない。GifViewer専用Canvasのsoftware layer指定は別画面であり、これを原因とはしない。

## 修正候補

- セッション作成時にversionName/lastUpdateTimeを一度取得し、フレームごとのPackageManager呼び出しを除去。
- pre-drawからのanchor検査を250ms間隔へ制限。最初の検査と復元直後の処理は維持。通常のnative描画はreturn trueで継続し、120Hz→60Hz指定などは行わない。
- 「更新・画面切替時の読書位置を補助保存する」(`readingPositionRecovery`、初期true)を「スレを読む」へ追加。expert経由でも同じ項目。OFF＋再起動で追加observerの登録を止め、nativeの位置保存を残す。ログ/既読位置は削除しない。モード切替はSettingsEffectsから再起動確認。
- スクロール停止後の400ms遅延保存と既存位置復元は維持。

## 検証・残件

`build/tablet-swipe-position-build.log` は通常Lint含め `:patches:buildAndroid` 成功（3分29秒）。git diff --checkエラーなし。新APK導入・nativeフレーム計測は未実施。前タスクの候補242適用を阻むThumbnailRebindPatchの検査エラーも未解消であり、今回候補を配布可能とは扱わない。

emulator-5554の実表示モードは60Hzのみで、120Hz維持の確認には使えない。接続実機730eae72は120Hz対応だが、この報告の発生機種と同じかは不明、他アプリ操作中の画面だったため切替/設定変更はしていない。停止中のdisplayで60Hzと出たことを今回の症状の再現とは扱わない。

再起動後ON/OFFでの同一スレ縦スクロールの比較、1.9.3との同条件frameタイム比較、位置復元回帰確認が必要。サムネイル再問い合わせ/リンクカード再レイアウトも別候補として残る。原因特定/完全修正/公開済みとは報告しない。
