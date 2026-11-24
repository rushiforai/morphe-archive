# ビルド依存

`scripts/setup-tools.sh` が `config/tools.lock.json` に固定された公式配布物を取得し、SHA-256を検証します。

- Morphe Desktop 2.3.0（Morphe Patcher 2.5.0を同梱。Android版Manager 2.7.1と同じPatcher）
- Morphe patches 2.3.0（公式パッチと同時に読み込んだ場合の比較用。通常のパッチ生成には不要）
- Kotlin compiler 2.4.10

JDK 21とPython 3は別途用意します。署名にはAndroid SDK Build Tools 36.0.0が必要です。バイナリはGit対象外です。

- R8/D8 9.4.17（MPP用、Kotlin 2.4対応）

MPP生成にはSDK platform android-36も必要。公式Gradleプラグインと同じ構造でJVMクラスにAndroid DEXを追加する。
