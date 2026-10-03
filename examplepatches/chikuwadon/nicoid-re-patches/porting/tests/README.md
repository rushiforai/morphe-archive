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
