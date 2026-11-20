# 191画像戻る・HOME/返信負荷・共有NG送信待ち（作業中）

比較対象はStable 1.45.0と1.46.0-dev.3。通常の板・履歴表示に対し、191の内部g/i/j一覧が同じ入力を参照していても変換・並び替えを繰り返す経路を削減し、group時の重複GlobalSearchHome/HomeThreadOrder適用を除去。

共有NGがID/名前/ワッチョイのみの場合、本文HTMLの変換と本文を含む判定cacheキーを省く。SharedNgIndexTestは最新SharedNgRules等をソースから再コンパイルして11309項目成功。1000レスの本文変換0回、keyword条件ありでは変換・一致を確認。旧classを誤って参照した最初の試験は成功扱いにしない。

最適化ON時の遅延件数集計は、実際のフィルターUIが表示されているadapterのみ実行。起動時の重複初期化抑止はSharedPreferences読み直しより前へ移動（設定変更は次回起動から、OFF時の従来経路を維持）。

191/226の静止画だけの通常ギャラリーは混在メディアのpagingによるnative CANCELを避ける。最初の候補では191の戻る閉じる試験が失敗（image191.txt）。戻る専用recognizerを独立して通す追加修正を実施し、検証fixtureのgesture有効化/復元も追加。最終候補の191実機試験25項目成功（image191-final.txt）。複数画像・custom OFFでnative Backによる終了成功、custom方向切替も成功。

過去ログ検索のnative画面に1dpの区切り線、元サイト表示にthreadContainer上端borderを追加。「選んだ投稿から共有NGを報告」の設定画面ボタンを削除。

送信待ちbatchがある場合、personal送信自体のinline device bindingを使用。ACKなし・失敗時はキューを保持し、受領確認済みのみ削除する。standalone identity登録の失敗でbatch全体を停止しない。サーバーpersonal.test.cjs148項目成功（サーバー公開/実投稿なし）。

報告動画はHTTP403で取得不能。OPPO/Android16報告端末の実時間改善は未確認。画像閉じる試験が通るまで公開しない。

最終通常Lint/R8 build成功（build-candidate.log、3m51s）。新規fatalなし。生成MPPと各APKはbuild/performance-gallery-20261118/final-apks、導入は隔離reporter packageのみ。追加の最適化トグルは増やさず既存の起動/フィルターON/OFFを維持。

最終実機結果: Mi Note 10 Android11 / d5497008、191=25、226=18、242=18項目成功。3版の署名照合・隔離package導入、履歴DEX検査成功。新規fatalなし。OPPO Android16の実時間・共有NGの実送信/外部サーバー到達は未確認。

追加修正: 下部フィルター透過は未保存初期OFF。初回起動にbottomFilterOpaqueMigrationV1で保存済みも一度だけOFFへ移行し、その後の選択は維持。226の全レス画像収集が旧index a(int)を参照していたため、live index b(int,int)へ変更。synthetic mapでNG flags/default読出し実機成功（index226-runtime.log）。
