# ツールバー画像の複製サイズ・送信本文の文字化け記号

2026-11-09。公開dev.18の後のローカル修正。

## ツールバー画像

報告は191 dev/Haiagaru dev.18、アプリ内の画像設定から変更した場合。Morpheのパッチ時ファイル選択とは区別する。アプリの取り込み画像は元の縦横比を保つ256×256 PNGになるが、表示用BitmapDrawableの匿名subclassで24dpのintrinsic寸法だけを上書きしていた。AndroidのConstantState.newDrawableは通常のBitmapDrawableを作り、このoverrideを失って256pxへ戻る。

未修正191のnative rendererで2048×512の合成画像を取り込み、元drawableは63×63px（24dp）、ConstantState複製後は256×256pxになることを再現した。報告元の実画像・実機そのものは未取得で、元画面の白い領域全体を実機再現したとの主張ではない。baseline191.logに失敗と実寸法を保存。

表示用bitmap自体を24dp相当の実画素数へ縮小し、画面密度を設定した通常のBitmapDrawableを使う。複製・テーマ・別密度でも大きさが保たれる。正規化済みの保存ファイルは保持し、表示用の縮小bitmapを別にキャッシュ。画像を変更・初期化した際に両cacheを無効化する。古いdrawableが使っているbitmapはrecycleしない。色・透過・アスペクト比・項目順・保存キーは維持する。推奨256×256透過PNGと最大16MiBをヘルプへ追記。Morphe側の任意画像オプションは今回変更しない。

アイコンだけの先行候補は通常Lint/R8 build5m成功。191のnative ConstantState/別密度/色/透過/実ImageView/隣接widget配置42項目、本文・画像等のgateway641項目成功。226の先行APKも生成したが、後続の本文除去依頼を統合するため導入せず、先行結果と最終候補を分離する。証跡build/toolbar-icon-size-20261109。

## 送信前のU+FFFD除去

入力中の下書き・名前・タイトル・DATは変更せず、既存の送信用本文の変換経路でU+FFFDと、そのdecimal/hex NCR表記を除去する。通常の空白・改行・正常な文字、ZWJ/漢字IVSを保持する。「� 」の空白部分は削除しない。表示用文字置換や異体字セレクタのON/OFFとは独立して適用する。新規設定・native hookは追加しない。

純粋文字処理12項目成功。5ch・エッヂ・したらば・kenmoの本文変換、191の隣接constructor-field bridge、226/242の実native postdataコピーで本文以外を保持する試験を追加。実掲示板へ送信する試験は行わない。証跡build/post-replacement-20261109。

## 最終候補

通常Lint/R8を含むbuild3m50s成功、以後の製品ソース変更なし。MPP SHA256 4fece41a4b0a1cad5f50d1bc84567fcb7cea823b32aaa2dc5ab757075ad2b1b0。emulator-5580の既存reporter3版へ署名一致更新。各版nativeアイコン42項目、本文変換/送信データ/音声等191=27・226/242各30項目成功。native本文・画像・書き込み画面等191=641/226=647/242=644成功、最終crash buffer空。新規native hook・レジスター変更なし。投稿は隔離Transportへだけ送り、公開投稿0。実機・報告画像そのもの・長時間利用は未確認。

191の最終候補の初回と再試行は、ふたば板一覧の日時表示を確認する箇所で古いloopback接続先80/443のエラー画面になり停止した。診断時の左ペインには77タブが保存され、以前の試験の未登録loopback板タブも残っていた。前のcleanupがthread URLだけを対象にし、板のbid/_dataタブを対象にしていなかったため、FixtureTabSandboxで未登録loopback板タブを試験中だけ分離する。5つの対象キーをAtomicFileへ退避し、finallyで試験開始時の値へ復元。実登録は保持し、試験で増えた板タブも残さない。コールド起動とこの分離後、同じ製品APKで191の641項目成功。226/242も同じsandboxで成功した。原因を製品変更と断定せず、初回失敗は成功件数へ含めない。

導入APK/MPP/署名/試験APKの記録はandroid-installations.md。実機変更・アンインストール・データ消去なし。ユーザーのプレリリース指示に従い、既存Semantic Release CIで公開する。

公開追記: 1.25.0-dev.19を既存Semantic Release CI42625301021で公開済み。配布6assetの実download/size/SHA256/digest/ZIP CRCと公開更新フィードを確認。配布MPPの再導入はしておらず、上記端末検証は同じ製品ソースの最終ローカル候補によるもの。公開・配布検証の詳細はintegration-status.mdを参照。
