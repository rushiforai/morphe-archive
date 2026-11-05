# 検索バーの戻る操作・サムネイル再生マーク（2026-11-05）

## 修正

191のpa.A、242のResListFragment.qは検索入力用の親クラスのBack callback updaterを呼ばず、検索入力だけを表示した状態では親callbackが無効のままだった。親のupdaterをinvoke-superで先に実行し、従来のポップアップ/検索結果ナビゲーション用callbackの更新も保持する。新たなキー横取りやリスナーは追加せず、IMEはAndroid標準の優先順位を使用する。226の入力updaterはprivateで、入力状態observerから直接呼ばれるため、この欠落がなく変更しない。

3版の通常行bindで、GIFのデコード完了時に付いた再生マークをsetOverlayDrawable(null)が消していた。1.23.0の同URL画像保持により、再デコードでマークが戻るとは限らなくなった。取得済みbitmapとnative GIFマークがある場合だけ通常bindの消去を省く。URLが変わる場合は旧GIFマークを消し、別の静止画へ持ち越さない。動画専用のnativeマーク、初期読み込み、手動再取得、完了エラーは従来処理を保持する。固定クラス指定で、全クラス走査は追加していない。

## 確認結果

- 通常Lint/R8ビルド成功、3分37秒・91 tasks。`build/search-back-overlay-build.log`。
- 191/226/242の原本APKへパッチ適用・署名成功。`VerifySearchBackPlaybackHooks`で1.23.0候補と比較し、追加したsuper呼出し・行bindの1呼出し置換・URL入口の1命令以外のnative画像命令とレジスターを保持していることを確認。
- API36 / emulator-5580、既存の隔離reporter191/226/242を同署名install-r更新。アンインストール・データ消去・実機操作なし。
- 更新前の1.23.0候補で、191/242の入力callbackが有効にならないこと、3版のGIFマークが通常の消去呼出しで消えることを合成native試験で確認（191 3項目・226 1項目・242 5項目）。
- 更新後の標準Instrumentationは191 123項目・226 121項目・242 121項目成功。検索callbackの有効化/解除（191/242）、nativeの入力状態を閉じる処理（242）、GIFマークの反復保持、別URL時の消去、動画マーク保持、bitmap未保持時の消去、自動読み込み100回の画素保持、手動再取得・初期読み込み・URL変更・完了エラーを含む。`build/search-overlay-runtime{191,226,242}.log`。
- 新規crash bufferは空。AVDはデータを保持して停止。
- 指定スレをam startで開くコマンドが自動承認レビューで拒否された（blocked by policy、詳細理由なし）。その操作は実行せず、上記の合成データ試験へ限定。実機や実スレでのキーボード→戻る→検索終了の連続操作、自然発生のメディア再表示は未確認。

MPP: `build/search-back-overlay.mpp`、SHA256 `2a508401850fb4f5ea5c06359637a53cc5c668cc9fe1fbe4986d7217ba1443af`。ローカル候補であり、Release公開・feed更新は行っていない。
