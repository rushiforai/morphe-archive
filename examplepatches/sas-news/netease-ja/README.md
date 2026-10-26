# NeteaseJA Patches（個人利用・非公式）

網易雲音楽（`com.netease.cloudmusic`）Android 版向けの Morphe パッチ集。個人利用専用の非公式パッチであり、網易雲音楽公式・Morphe 公式とは関係ありません。再配布は想定していません。

## パッチ

<!-- PATCHES_START EXPANDED -->
> **[v1.1.2](https://github.com/sas-news/netease-ja/releases/tag/v1.1.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 网易云音乐&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 9.6.13 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [コメント翻訳 (Comment translate)](#comment-translate) | コメント画面や紹介画面に「訳」ボタンを追加し、表示中の中国語テキストを翻訳します。無料の匿名翻訳APIを使用するため文面が外部送信されます。 |  |
| [日本語化 (Japanese UI)](#japanese-ui) | 主要なUI文字列を日本語（一部英語）で表示します。レイアウト崩れ防止のため短文中心の部分的翻訳です。 |  |

</details>

<!-- PATCHES_END -->

以下は概要です（詳細な一覧はリリース時に自動生成されます）。

- **日本語化 (Japanese UI)**：`res/values-ja/strings.xml` を追加し、主要UI文字列だけを日本語（一部英語）表示にします。レイアウト崩れ防止のため短文中心の部分的翻訳で、未訳部分は自動的に既定（中国語）表示になります。
- **コメント翻訳 (Comment translate)**：コメント画面・折りたたみ表示・アーティスト紹介・アルバム紹介・プレイリスト紹介にフローティングの「訳」ボタンを追加します。開いて約1秒で表示中の中国語テキスト（12文字以上）を自動翻訳し、タップで原文／訳文を切り替えます。無料の匿名翻訳APIを使うため文面が外部送信されます。既定OFF（オプトイン）。

## 使い方

- スマホの Morphe Manager：`https://morphe.software/add-source?github=sas-news/netease-ja` を開いてソース追加
- PC の Morphe Desktop：[Releases](../../releases) から最新の `.mpp` と対象 APK（公式配布：`https://music.163.com/api/android/download/latest2`）を用意してパッチ

## 開発（ビルドと更新）

push するだけで Release が自動作成されます（`feat:`／`fix:` 付きコミットが対象）。初回のみ Settings → Secrets に `REGISTRY_PAT`（classic PAT、`read:packages`）を登録してください。以降の手作業は不要です。

手元で確認ビルドする場合：

```sh
# tools/ で翻訳XMLを生成（初回・翻訳更新時）
python3 tools/build_values_ja.py analysis/ja_chunk*.json \
  -o patches/src/main/resources/translations/values-ja-strings.xml
# パッチバンドルをビルド
./gradlew buildAndroid
# → patches/build/libs/*.mpp を Morphe Desktop / Manager に読み込ませる
```

`settings.gradle.kts` は GitHub Packages（`maven.pkg.github.com/MorpheApp/registry`）を参照します。`GITHUB_ACTOR` / `GITHUB_TOKEN` 環境変数か `gradle.properties` の `gpr.user` / `gpr.key` に PAT を設定してください。

## バージョン更新時の手順

1. 公式から新しい APK を取得する
2. 事前チェックを実行する（翻訳名・プレースホルダ・対象Activity・バージョン固定の検証）

```sh
python3 tools/check_patch.py <new.apk>
```

3. 翻訳を移行する（名前が変わった文字列は値一致で再割当＋要レビュー）

```sh
python3 tools/migrate_translations.py <new.apk> \
  analysis/ja_all.json analysis/defaults_9.6.13.json \
  -o analysis/ja_next.json --report analysis/migrate_report.json \
  --defaults-out analysis/defaults_next.json
```

3. レポートの `changed` / `new_names` だけ追加翻訳し、`build_values_ja.py` で再生成して `./gradlew buildAndroid`

パッチ側は `AppTarget(version = null, isExperimental = true)` も宣言しているため、未対応バージョンでも適用を試みられます（文字列は実行時に名前解決されるので、無くなった名前は無視されます）。

## 注意

- 曲名・コメント・広告・H5 画面などのサーバー文言は翻訳対象外です
- コメント翻訳は通常のコメント画面・折りたたみ表示・アーティスト紹介・アルバム紹介・プレイリスト紹介に対応です。対象外の画面や、スクロールで後から表示された分は「訳」ボタンをもう一度押してください
- 本リポジトリの Gradle ビルド自体は未実施です（Morphe の Gradle プラグイン取得に GitHub PAT が必要）。ただし使用 API は morphe-patcher v2.0.0 のソースと突合済みで、拡張 Java は `javac` でコンパイル確認済みです。手元の `./gradlew buildAndroid` でビルドして確認してください
