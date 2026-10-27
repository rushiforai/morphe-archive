# レス長押しの共有（記憶）の並び順

「共有（記憶）」を並び替えても表示に反映されない報告。報告版・具体的な移動先は不明。191/226/242を対象に、独自Menuがorderを使わず末尾追加することを元DEXで確認。表示直前に保存済みbuttons順を項目リストへ適用する補修を追加した。報告端末の実操作そのものは再現未確認。

- 記憶共有70〜74の保存設定があり、実メニューにも存在する場合のみ適用。配列順を使用し、position/orderがある設定形式も既存追加項目と同じ優先順位で扱う。
- 共有先のIntent・項目オブジェクト・クリック処理・表示/無効状態を作り直さない。未登録項目の相対順を維持し、項目を追加・削除しない。ユーザー設定は書き換えない。
- 191のm6fExternalSyntheticLambda0.c、226のgetStream.a、242のTTPlayableLandingPageActivity10.eを、Menu.getItemと同一の一覧であることを検査して更新する。既存レスメニューwrapperの全追加処理後に接続。
- 記憶済み共有先の取得や外部アプリ起動は本体の処理を維持する。

検証: 通常Lint付きAndroid build成功（最終Kotlin追加後21秒）。ResponseMenuOrderTestの114ケース成功。実Android/実native Menuクラスと変更済み補助クラスの隔離テストは191/226各29ケース成功。191は完成APK内の最適化済み処理でも29ケース成功。242のapp_processテストはSTART後Killedで原因未特定、成功扱いにしない。最初の191試行もKilled、ContextWrapperのgetApplicationContext補完後の再試験成功。アプリの設定変更・認証・ネットワーク・共有アプリ起動は実施していない。

MPPから191/226/242へ適用・再構築・署名検証成功。VerifyResponseShareOrderHooksで3版の元delegate命令/レジスター/分岐offset保持、既存wrapperのレジスター維持、すべての追加処理後に元menuをfinalizeして返すことを検査。端末UIのドラッグ・保存・再表示や共有先への実送信は未確認、未導入・未公開。

MPP `build/share-order-fixed.mpp` SHA256 `bbc9ad669d0d95c69ce27ed5b2a0a6b9337c1f552ec8508edbb301b1320cd6bd`。前件のNGWord-ID返信非表示オプションも収録、UA分離版には未統合。ログは`build/share-order-{model-tests,android-build,final-build,hooks191,hooks226,hooks242}.log`、`build/share-order-native{191,226,242}-test.log`、`build/share-order-final191-runtime.log`。
