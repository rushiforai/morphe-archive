# Popup pinch host regression checks

Playback policy checks (no Android runtime required):

```sh
javac -d /tmp/nicoid-playback-tests extensions/extension/src/main/java/e/e/a/PlaybackRules.java porting/tests/PlaybackRulesTest.java
java -cp /tmp/nicoid-playback-tests PlaybackRulesTest
```

The 38 checks cover all nine speeds, invalid preference fallback, metadata-version formats,
completion/reset behavior and preserving an explicit seek or cross-mode transfer.

From the repository root (JDK required):

```sh
javac -d /tmp/nicoid-pinch-tests $(find porting/tests/stubs -name '*.java') \
  extensions/extension/src/main/java/e/e/a/PopupPinchGeometry.java \
  extensions/extension/src/main/java/e/e/a/PopupPinchLayout.java \
  porting/tests/PopupPinchGeometryTest.java porting/tests/PopupPinchLayoutTest.java
java -cp /tmp/nicoid-pinch-tests PopupPinchGeometryTest
java -cp /tmp/nicoid-pinch-tests PopupPinchLayoutTest
```

These test stubs must never be packaged in the Android extension. They check calculations
and event routing, not Android's real ViewGroup dispatch or WindowManager implementation.
On a device verify pinching over video/buttons/seek bar, corner drag, single-finger movement,
tap after release, size restoration on reopening, portrait/landscape, and popup-to-normal transfer.

## ショートの操作確認

```sh
javac -d /tmp/nicoid-shorts-tests extensions/extension/src/main/java/e/e/a/ShortsRules.java porting/tests/ShortsRulesTest.java
java -cp /tmp/nicoid-shorts-tests ShortsRulesTest
```

短い移動、斜め移動、複数指、画面密度によるしきい値、通常動画とショートURLの認識を確認します。実機では上下スワイプ、ボタンとシークバーからの操作、一覧取得の失敗と再試行、連続切替時の音声重複、戻る操作、サイドバー表示設定、Material Youの明暗を確認してください。

## Cookie手動入力

```sh
javac -d /tmp/nicoid-cookie-tests extensions/extension/src/main/java/e/e/a/ManualCookie.java porting/tests/ManualCookieTest.java
java -cp /tmp/nicoid-cookie-tests e.e.a.ManualCookieTest
```

値のみ・Cookieヘッダー・末尾区切り、認証Cookieの限定、重複・改行・不正文字・過大入力の拒否を確認します。実機ではWebViewが使えない端末からの入力、保存後の再起動と認証、既存Cookieの置換、無効Cookieでのサイト側の認証失敗、キャンセル時の情報保持、通常ログイン、Material Youのオン・オフと明暗、英語・繁體中文を確認してください。

## アカウント視聴履歴

```sh
javac -cp /tmp/nicoid-json.jar -d /tmp/nicoid-account-history-tests \
  $(find porting/tests/paid-stubs -name '*.java' ! -path '*/e/e/a/HistorySupport.java') \
  $(find porting/tests/history-stubs -name '*.java') \
  extensions/extension/src/main/java/e/e/a/{HistorySupport,HistoryRules,VideoCountRules,PaidVideos,UiStrings}.java \
  porting/tests/AccountHistoryTest.java
java -cp /tmp/nicoid-account-history-tests:/tmp/nicoid-json.jar e.e.a.AccountHistoryTest
```

実際の履歴バインダーを使い、アダプターの履歴種別（e=4）、統計の共有アイコン描画への受け渡し、視聴日時・投稿日時の保持、行の再利用、本体履歴を変更しないことを日本語・英語・繁體中文で確認します。アイコン描画自体は記録用スタブに置き換えるため、実機での描画確認も必要です。

動画情報の統計表示: `VideoInfoCountsTest` は公式順序、全桁表示、取得できない項目の省略、実際の0、64bitの数値を確認します。`VideoInfoDexTest patched.apk` は単独・再生画面内の共通情報パネルからアイコン描画への接続と、既存メタデータ応答の統計取得フックを確認します。動画情報の数値は通常の太さで表示し、統計行の上下に2dpずつ余白を追加します。

`InfoStatisticsPayload.java` は変更前の method-delta.dex と6.49の元APKを入力として、上記2フックを追加した今回のpayloadを生成する再現用ツールです（既にフックを含むpayloadへの再適用は不要）。

## Background playback switching

```sh
javac -d /tmp/nicoid-routing-tests extensions/extension/src/main/java/e/e/a/PlaybackRouting.java porting/tests/PlaybackRoutingTest.java
java -cp /tmp/nicoid-routing-tests e.e.a.PlaybackRoutingTest
```

Checks distinguish background sessions from popup routing and reject stale media bindings after a player or video changes, including recreation of the same video. On a device, switch background video A to background video B and verify B's title, duration, play/pause and seeking. Open B normally while A plays in the background and confirm B stays in the normal player; also verify popup-to-popup switching.
