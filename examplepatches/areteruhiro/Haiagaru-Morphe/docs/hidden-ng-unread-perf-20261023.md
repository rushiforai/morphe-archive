# 非表示NGの未読補正・ホーム設定の余白

## 追加報告

「非表示NGのレスを未読件数に含めない」をオンにすると強くカクつく。Haiagaruホーム設定の上部余白も狭くしてほしい、との依頼。

## 変更

- 未読が0件、またはNG判定済みキャッシュがまだない場合は、そのまま本体の件数を使いURL解決を省略。
- HOME行からスレを特定するキーを最大1024件・弱参照で再利用する。キーは板・スレID・明示Intent URLが変われば再計算し、判定データの再取得時と設定切替時にも破棄。ネイティブ行のhashCodeに依存しない。
- 同じnativeフィールドを毎回探さず、反射Fieldを型ごとに再利用。
- 191／226のNG監視は、隠れたレスがない状態の通常レスに対する番号反射を省略。
- 242はまずNGマップの非表示候補を調べ、候補がなければ全レスの反射走査をしない。元のNGマップ・レス一覧は書き換えず、候補がある場合は取得済みレスとの積集合を使う。
- NG membershipが変わらなければソート済みキャッシュを破棄しない。既存の二分探索による件数計算を維持。
- ホーム設定のLargeTopAppBarを通常のTopAppBarへ変更。リストの上余白を16dpから8dpへ減らした。ステータスバーの安全領域やボタンのタップ領域は残す。

## 検証と制限

- 通常Lint込み`:patches:buildAndroid --offline --no-daemon`成功（`build/unread-home-compact-final-build.log`、3分15秒）。
- MPP SHA256 `3702459BA8D96AC4C747B02C87EA86FC5B1A80542D80A7C3CF912D011CBB0AA1`。導入APK等はandroid-installations.md。
- Frida計測下の191合成native行1000回では、URL解決呼出し総数1005回→3回。集計ループ7824ms→205ms、全ハーネス7981ms→271ms（`build/unread-perf-before191.log`、`build/unread-perf-after191.log`、前値のloop時間はlogcatのUNREAD_REPEAT行）。Fridaのメソッドフック自体の負荷も含まれるため、通常のスクロールがこの倍率で速くなるという測定ではない。
- 226では同じ修正版試験でURL解決3回、1000回集計153ms（`build/unread-perf-after226.log`）。
- 242もURL解決3回・1000回660ms。NG値の15項目（範囲外レス除外、同一判定でsorted再利用、全NG解除でmembership更新を含む）に成功（`build/unread-perf-after242.log`）。
- 未読件数ON/OFF、別のread位置、同じ行を別スレへ使い回した場合、native read／totalを書き換えないことを検査。
- 最終APKの未読フックは191の4箇所、226の6箇所、242の8箇所で、元のレジスター・引数・減算を保持。
- 191の実設定画面で検索ラベルの上端256px→160pxへ移動し、96px分上部を詰めた。同じ画面構成・向きでXMLを比較（`build/settings-home-before.xml`、`build/settings-home-after.xml`）。`build/settings-home-after.png`も視認し、見出し・検索・カードが重ならないことを確認。
- 最終候補242をFridaなしでコールド起動し、Part3本文・スクロール・画像表示を確認（`build/unread-home-normal-image.png`）。起動直後の最初のUI dumpはnull rootで失敗し、画面生成後の再dumpは成功。画像内の別アプリ画面はスレに添付された画像であり、端末のそのアプリを操作したものではない。新規crash時刻・ANR時刻の増加なし。計測前から残っている03:12 UTCのARTクラッシュ／02:47 UTCのANRは未消去。

実NGが大量にあるユーザーデータでの長時間スクロール／開閉時間の比較は未完了。処理回数の削減と合成native行の正しさを、自然発生のカクつきの完全解消とは区別する。
