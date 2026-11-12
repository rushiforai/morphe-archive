# 返信ポップアップ・自動再生OFFの音声・絵文字セレクタ（2026-11-08）

この変更は1.25.0-dev.15の公開後に作業した未公開候補。

## 返信先ポップアップの重なり

利用者提供画像 `https://i.imgur.com/hfSIJuj.jpeg` では、背面一覧の失敗サムネイルに付けた再取得/再生操作が返信先ポップアップの本文・正常画像へ重なっていた。操作はActivityルートへ追加されるため、native popupより後に描画されていた。

VideoThumbnailRetryの位置更新時に、元サムネイルからルートまでの経路上にある後続siblingとの可視矩形の交差を確認する。native popupが覆う位置の操作は非表示にし、閉じると復帰する。自身/他の失敗サムネイル用操作はこの遮蔽判定から除く。レイアウト中の取り外し延期は維持。別ウィンドウ列挙やnativeクラス走査は追加しない。

実Android FrameLayoutの128件×8回切替・detach/close・popup遮蔽/終了/非交差/透明sibling39項目成功。初回試験は128画像すべて同じ位置で最初の画像を調べ、他の127画像でも覆われるfixtureだった。最後の画像を調べてnative popupとの関係を分離した試験が成功。

透明な全画面toolbarコンテナ自体は遮蔽と扱わず、描画する子の実際の位置で判定する。透明コンテナとその中のpopupの2項目を加えて41項目成功。

## 自動再生OFFで他アプリの音声が止まる

Haiagaru専用VideoViewerActivityのVideoViewは、再生開始前のprepareでもAndroid標準のaudio focusを要求する。API26以降はVideoViewの自動要求をAUDIOFOCUS_NONEにし、実際のstart()で要求する。pause/完了/error/破棄では解放し、他アプリへfocusが移ると停止する。設定OFFで開いただけでは要求しない。

専用プレイヤーか標準プレイヤーかの利用者確認を依頼中。今回変更したのはHaiagaru専用プレイヤー。YouTubeアプリ自体を操作しての確認とは区別し、Android音声focusの独立listenerと実ローカルMP4で検証する。

## 異体字セレクタと文字化け記号

- 「本文の文字列置換」に初期ONの独立2設定を追加。既存のTXT選択は不要。
- 投稿用コピー・表示する本文からFE0E/FE0Fのみを除く。literal、数値文字参照のdecimal/hexを対象にする。ZWJ・結合キーキャップ・漢字のIVSは保持する。
- 表示時のU+FFFD削除は `<ex2>�<TAB><TAB>msg` と同じ処理。投稿のU+FFFDは消さない。保存DAT・編集中の下書きは変更しない。各設定はOFFにできる。
- 既存の投稿フックを利用し、5chを含む送信用コピーへ適用。外部板のZWJ用NCR変換は引き続き保持する。
- selector/NCR/ZWJ/keycap/IVS/OFFのhost12項目成功。設定はActivity resume時に読み込み、描画ごとにpreferences I/Oしない。

通常Lint/R8を含むbuild/buildAndroid成功（7分48秒、91tasks）。ビルド開始時のローカル版番号はdev.14、その間に前件のCI生成dev.15をff-only取得した。候補のコード差分と番号を公開済みdev.15と混同しない。候補MPPはbuild/emoji-cleanup-tests/candidate.mpp。

Android候補の文字処理/音声focus/基本画面検証と導入台帳は完了後追記。今回追加3点の実機導入・公開は未実施。

## 先行候補の確認と追加修正

- 191の製品prepareBody/renderと実VideoViewerActivity/ローカルMP4/独立音声focus listenerで12項目成功。autoplay OFFでprepareしても背景のlistenerはfocusを失わず、手動再生で初めて失う。pause・終了後はfocusと設定を復元する。YouTubeアプリ自体を動かした試験ではない。
- 初回の試験は製品がdirect media扱いしない内部URL用127.0.0.1を使い、viewerが早期終了したためprepareを確認できなかった。誤った試験で成功扱いにしなかった。別のloopback fixtureを用い通常direct-file経路を通す最終試験で成功。
- 226はnative PostDataの送信用コピー/全constructor値保持/元の編集用データ保持も含む15項目成功。
- 242の実nativeコピー試験で、既存ExternalEmojiPostのフィールド対応が242の原本constructorと一致していないことを検出。native n/f/a/c/g/d/i/j/b/e/hの順で読み出す242専用の型確認を追加。lazy cacheのfieldはconstructor値比較から除き、実constructorのString/primitiveだけを比較する。最終242試験は再build後に実施。
- 191の既存gateway/native本文・画像・composer等641項目成功、crash buffer空。
- 透明コンテナ改善を含む最終buildは、PC JVMのnativeメモリ不足（malloc約1.5MB失敗）で一度停止。製品のAndroidクラッシュではなく、エミュレータをデータ保持で停止して再buildした。

## 最終確認完了（未公開）

通常Lint/R8込みの再buildは3分46秒・91tasks成功（build-final-retry.log）。final.mpp SHA256 a586f64df94ee690dbccfd8ecf54e96857b174b95e05677b2c072a2b90f97e45。透明コンテナ改善と242投稿フィールド修正を含む最終APKをreporter242へ署名一致更新。

最終242の実native投稿コピー・文字処理・独立音声focus/実MP4試験15項目成功（final-runtime242-retry.log）。初回は冷起動後のSystemUI ANRが前面に出てforeground検査に失敗し、実UI/dumpsysで確認して閉じた後に再検査した。本文/画像/composer/URL等の回帰644項目成功（gateway242-final.log、隔離POST16/公開投稿0）、crash-final.logは0bytes。

191=12項目/回帰641、226=15項目は先行候補で確認。最終の透明コンテナ改善は独立Androidレイアウト試験41項目、242固有投稿修正は最終242で確認。最終MPPを191/226へ再導入したとは扱わない。YouTubeアプリそのもの・ChMate標準プレイヤー・API25以前・実機・長時間利用は今回未確認。今回3点の公開は未実施。
