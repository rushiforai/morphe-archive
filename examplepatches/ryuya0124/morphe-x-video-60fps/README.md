# X Video Upload 60 FPS

Android版Xの従来の動画エンコーダーで、入力のフレームレートを最大60fpsまで維持するMorphe用パッチです。入力が24fpsや30fpsなら、そのフレームレートで処理します。

[Morphe Managerに追加](https://morphe.software/add-source?github=ryuya0124/morphe-x-video-60fps&name=X%20Video%20Upload%2060%20FPS&app=com.twitter.android) · [GitHub Releasesから .mpp をダウンロード](https://github.com/ryuya0124/morphe-x-video-60fps/releases/latest)

## Morphe ManagerでPikoと併用

1. 上のリンクで追加するか、**Sources → ＋ → Remote** に `https://github.com/ryuya0124/morphe-x-video-60fps` を入力します。ダウンロード済みの `.mpp` は **Local** から追加できます。
2. **Expert mode** を有効にして、対象バージョンのオリジナルAPKまたはAPKバンドルを選びます。
3. 表の **Piko** と追加ソースを選び、**X Video Upload 60 FPS** のタブで **X video upload up to 60 FPS** を有効にします。
4. **Patch** を実行し、通常のAPKインストールで入れます。既存のPiko版に上書きする場合は、同じMorpheキーストアとパッケージ名を使います。

[Morpheのパッチソースの説明](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md) · [Expert modeの説明](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patching-expert-mode.md)

| X | 元APKのバージョンコード | 併用を確認したPiko | 追加ソース |
|---|---:|---|---|
| `11.0.0-release.0` | `311000000` | [`3.0.0`](https://github.com/crimera/piko/releases/tag/v3.0.0) | — |
| `11.10.0-release.0` | `311100000` | [`3.0.0`](https://github.com/crimera/piko/releases/tag/v3.0.0) | — |
| `11.20.0-release.0` | `311200000` | [`3.0.0`](https://github.com/crimera/piko/releases/tag/v3.0.0) | — |
| `11.30.0-release.0` | `311300000` | [`3.0.0`](https://github.com/crimera/piko/releases/tag/v3.0.0) | — |
| `11.40.0-release.0` | `311400000` | [`3.0.0`](https://github.com/crimera/piko/releases/tag/v3.0.0) | — |
| `11.69.0-release.0` | `311690000` | [`3.2.0`](https://github.com/crimera/piko/releases/tag/v3.2.0) | — |
| `11.70.0-release.0` | `311700000` | [`3.2.0`](https://github.com/crimera/piko/releases/tag/v3.2.0) | — |
| `11.77.0-release.0` | `311770000` | [`3.2.0`](https://github.com/crimera/piko/releases/tag/v3.2.0) | — |
| `11.81.0-release.0` | `311810000` | [`3.7.0`](https://github.com/crimera/piko/releases/tag/v3.7.0) | — |
| `11.99.0-release.1` | `311990001` | [`3.6.0`](https://github.com/crimera/piko/releases/tag/v3.6.0) | X Shim 1.7.0 |
| `12.2.0-release.0` | `312020000` | [`3.7.0`](https://github.com/crimera/piko/releases/tag/v3.7.0) | X Shim 1.7.0 |
| `12.7.1-release.0` | `312071000` | [`3.8.0`](https://github.com/crimera/piko/releases/tag/v3.8.0) | — |
| `12.11.0-release.0` | `312110000` | [`3.9.0-dev.1`](https://github.com/crimera/piko/releases/tag/v3.9.0-dev.1) | — |
| `12.17.0-release.0` | `312170000` | [`3.9.0-dev.8`](https://github.com/crimera/piko/releases/tag/v3.9.0-dev.8) | — |
| `12.19.1-release.0` | `312191000` | [`3.11.1`](https://github.com/crimera/piko/releases/tag/v3.11.1) | — |

旧版Pikoは表のリリースから `.mpp` を取得し、**Sources → ＋ → Local** で追加できます。`11.99.0-release.1` と `12.2.0-release.0` では、検証時に [X Shim 1.7.0](https://gitlab.com/inotia00/x-shim/-/releases/v1.7.0) も同時に適用しました。

## 実装と検証

パッケージ名・バージョン名・バージョンコードが表と一致する元APKに適用します。Morpheの `--force` を使っても対象外の版では中止します。追加前に、その版でPikoとの同時適用、通常インストール、再エンコードの実測を行います。

従来のエンコーダーが対象フレームレートの既定値30fpsを読み出す箇所を目印に、エンコーダーとフレーム間引きの上限を60fpsにします。入力fpsのメタデータを取得できない場合は従来の設定値を使います。対象の命令列を一意に照合できなければ適用を中止します。

表の各組み合わせをMorphe Desktop 2.2.0で適用し、Android 16のARM64エミュレーターに通常インストールしました。各版で3秒のHEVC素材をH.264に再エンコードし、24fpsは72フレーム、30fpsは90フレーム、60fpsは180フレームを維持しました。X `12.19.1-release.0` では、Pikoのみの場合に60fps素材が30fps・90フレームになることも確認しました。

新UI版で調べたAPKには、入力に応じて最大60fpsを選ぶ別のエンコード経路があります。検証範囲は端末内の再エンコードまでです。実機での動作、ログイン、投稿後に配信される動画のfpsは未測定です。

## ビルド

JDK 21、Kotlin CLI 2.4.21、Android Build Tools 36.0.0、Morphe Desktop 2.2.0のall JARでビルドできます。

```sh
./scripts/build.sh /path/to/morphe-desktop-2.2.0-all.jar /path/to/android/build-tools/36.0.0
```

ビルド結果は `dist/` に出力されます。GitHub Actionsでも同じスクリプトを使い、配布ファイルのSHA-256は各リリースの `SHA256SUMS` で確認できます。

ライセンスは [GPL-3.0-only](LICENSE) です。
