<div align="center">

# Nich87 Patches

<details>
  <summary><b>他の言語で読む / Read this in other languages</b></summary>
  <br>
  <a href="README.md">English</a>&nbsp;&nbsp;•&nbsp;&nbsp;<a href="README.ja.md">日本語</a>
</details>

<br>

<p align="center">
  <a href="https://github.com/Nich87/nich87-patches/releases/latest"><img src="https://img.shields.io/github/v/release/Nich87/nich87-patches?style=flat-square&color=blue" alt="GitHub Release"></a>
  <a href="https://github.com/Nich87/nich87-patches/releases"><img src="https://img.shields.io/github/v/release/Nich87/nich87-patches?include_prereleases&sort=semver&style=flat-square&label=pre-release&color=orange" alt="GitHub Pre-release"></a>
  <a href="https://github.com/Nich87/nich87-patches/actions"><img src="https://img.shields.io/github/actions/workflow/status/Nich87/nich87-patches/release.yml?branch=main&style=flat-square&label=CI" alt="CI"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/Nich87/nich87-patches?style=flat-square" alt="License"></a>
  <a href="https://morphe.software"><img src="https://img.shields.io/badge/Morphe-compatible-00D26A?style=flat-square" alt="Morphe Compatibility"></a>
  <a href="https://play.google.com/store/apps/details?id=com.apple.android.music"><img src="https://img.shields.io/badge/Apple%20Music-v7.0.0-FA243C?logo=apple-music&logoColor=white&style=flat-square" alt="Apple Music 7.0.0"></a>
</p>

<p align="center">
  <strong><a href="https://morphe.software">Morphe</a> 向けの Nich87 によるカスタムパッチ集</strong><br>
  本プロジェクトは <a href="https://github.com/MorpheApp/morphe-patches-template">Morphe patches template</a> をベースにした独立したプロジェクトです。<br>
  Android版 Apple Music 向けに、Liquid Glass UI、ライブラリのバックアップ／復元／一括ダウンロード、日本語メタデータ修復機能を提供します。各パッチは個別に選択可能です。
</p>

</div>

---

## パッチの利用方法

Morphe Manager に以下のソースURLを追加してください：  
<https://github.com/Nich87/nich87-patches>

<a href="https://morphe.software/add-source?github=Nich87/nich87-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

> [!NOTE]
> `dev` ブランチの最新開発ビルドを利用する場合は、Morphe Managerの設定でプレリリースを有効にしてください。

## 提供パッチ一覧

> **[v1.1.0](https://github.com/Nich87/nich87-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;計 3 パッチ

<details open>
<summary>📦 Apple Music&nbsp;&nbsp;•&nbsp;&nbsp;3 パッチ</summary>
<br>

**パッケージ名:** `com.apple.android.music`

**🎯 対応バージョン:**

| 7.0.0 |
| :---: |

| 💊&nbsp;パッチ名 | 📜&nbsp;概要 | ⚙️&nbsp;オプション |
|----------|----------------|-----------|
| [ライブラリのエクスポート・インポート・ダウンロード](#ライブラリのエクスポートインポートダウンロード-library-import-export-and-downloads) | ライブラリとプレイリストのJSONバックアップ、差分インポート、およびライブラリ全体の一括ダウンロード機能を追加します。 | なし |
| [リキッドグラス・ボトムバー](#リキッドグラスボトムバー-liquid-glass-bottom-bar) | Apple Musicのミニプレイヤーやボトムタブに屈折グラス効果、バー全体のタッチフィードバック、ドラッグ視差効果、アニメーション付き選択レンズを追加します。 | なし |
| [日本語ライブラリメタデータの修復](#日本語ライブラリメタデータの修復-repair-japanese-library-metadata) | ローマ字化されたライブラリの曲情報を検出し、日本のカタログデータを使用して選択した楽曲の表記を日本語に修復します。ライブラリ登録を維持したままアカウントと同期します。 | なし |

</details>

### 各パッチの機能詳細

#### リキッドグラス・ボトムバー (`Liquid Glass bottom bar`)
- **リアルタイム屈折ガラス効果**: ミニプレイヤーおよびボトムナビゲーションバーに、背景がリアルタイムに屈折して透けるリキッドグラスを適用。
- **フルバー・タッチフィードバック**: バー全体のタップ・タッチに滑らかなインタラクションを付与。
- **ドラッグ視差効果（パララックス）**: スワイプやドラッグ操作に応じた立体的な視差エフェクト。
- **アニメーション選択レンズ**: 選択中のタブに滑らかに追従・変形するレンズエフェクト。
- ※ リアルタイム屈折シェーダー効果には **Android 13 (API 33) 以降** が必要です。

#### ライブラリのエクスポート・インポート・ダウンロード (`Library import, export and downloads`)
- **ライブラリとプレイリストの書き出し**: 楽曲一覧、再生回数などの情報、プレイリスト構成をJSON形式で外部ファイルにバックアップ。
- **プレイリストのみの書き出し**: プレイリスト構造のみを軽量にバックアップ。
- **バックアップの読み込み**: バックアップから未登録の楽曲や新しいプレイリストを差分インポート（既存の同一楽曲・プレイリストは自動スキップ）。
- **ライブラリの一括ダウンロード**: ライブラリ内の利用可能な楽曲を一括してバックグラウンドダウンロードリクエスト。

#### 日本語ライブラリメタデータの修復 (`Repair Japanese library metadata`)
- **ローマ字表記の自動検出**: 日本語楽曲でありながらローマ字表記（ヘボン式など）になってしまっているメタデータをスキャン。
- **日本カタログとの高精度照合**: Apple Musicの日本公式カタログと照合し、本来の日本語表記（漢字・ひらがな・カタカナ）候補を提示。
- **変更内容のプレビューと選択**: 曲名、アーティスト名、アルバム名、アルバムアーティスト名、作曲者名の修復前後の差分を確認して、楽曲ごとに個別または一括選択。
- **登録・履歴を維持した同期**: 楽曲を一度ライブラリから削除して再登録するのではなく、クラウドライブラリのメタデータのみを更新するため、ライブラリ追加日、プレイリストの配置、再生履歴を保持したまま同一Apple IDの全端末に同期。

## 開発とビルド

ビルドには **JDK 21** および **Android SDK Platform 36** が必要です。  
GitHub CLI (`gh`) で `read:packages` スコープを認証し、`dev` ブランチでビルドします：

```sh
gh auth refresh --hostname github.com --scopes read:packages
./scripts/gradle.sh buildAndroid
```

Android向けパッチバンドルは `patches/build/libs/patches-*.mpp` に出力されます。  
ローカルビルドランチャーは GitHub CLI から認証情報を取得し、独立した一時的な Gradle キャッシュを使用します（リポジトリ内にトークンは保存されません）。

セットアップ、検証手順、リリース規約についての詳細は [DEVELOPMENT.md](DEVELOPMENT.md) を、コントリビューションについては [CONTRIBUTING.md](CONTRIBUTING.md) を参照してください。コーディングエージェントは [AGENTS.md](AGENTS.md) および開発用スキルも確認してください。

## ライセンス

[GPLv3](LICENSE) の下でライセンスされています（[NOTICE](NOTICE) に記載されている名称制限事項を含みます）。

