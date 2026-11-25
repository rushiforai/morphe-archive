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
  <a href="https://play.google.com/store/apps/details?id=com.apple.android.music"><img src="https://img.shields.io/badge/Apple%20Music-v7.0.0--7.0.3-FA243C?logo=apple-music&logoColor=white&style=flat-square" alt="Apple Music 7.0.0-7.0.3"></a>
  <a href="https://play.google.com/store/apps/details?id=com.twitter.android"><img src="https://img.shields.io/badge/X-v12.19.1-000000?logo=x&logoColor=white&style=flat-square" alt="X (Twitter) 12.19.1-release.0"></a>
</p>

<p align="center">
  <strong><a href="https://morphe.software">Morphe</a> 向けの Nich87 によるカスタムパッチ集</strong><br>
  本プロジェクトは <a href="https://github.com/MorpheApp/morphe-patches-template">Morphe patches template</a> をベースにした独立したプロジェクトです。<br>
  Android 版 Apple Music 向けの各種拡張パッチ（Liquid Glass UI、カスタムフォント、LRCLIB 歌詞・オンデバイス読み仮名生成／歌詞編集、オンデバイス・ボーカル分離、ライブラリ管理、日本語メタデータ修復）および Twitter / X 向けのスペース・ローカルミュートを提供します。各パッチは個別に選択可能です。
</p>

</div>

---

## パッチの利用方法

Morphe Manager に以下のソース URL を追加してください：  
<https://github.com/Nich87/nich87-patches>

<a href="https://morphe.software/add-source?github=Nich87/nich87-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

> [!NOTE]
> `dev` ブランチの最新開発ビルドを利用する場合は、Morphe Manager の設定でプレリリースを有効にしてください。  
> Apple Music 向けパッチは arm64 スプリットを統合した APK（APKM / XAPK は事前に統合）、Twitter / X 向けパッチは APKM に対応しています。

## 提供パッチ一覧

> **[最新リリースを確認](https://github.com/Nich87/nich87-patches/releases)**&nbsp;&nbsp;•&nbsp;&nbsp;計 7 パッチ（Apple Music 6 パッチ・Twitter / X 1 パッチ）

<details open>
<summary>📦 Apple Music&nbsp;&nbsp;•&nbsp;&nbsp;6 パッチ</summary>
<br>

**パッケージ名:** `com.apple.android.music`

**🎯 対応バージョン:**

| 7.0.0 | 7.0.1 | 7.0.2 | 7.0.3 |
| :---: | :---: | :---: | :---: |

| 💊&nbsp;パッチ名 | 📜&nbsp;概要 | ⚙️&nbsp;オプション |
|----------|----------------|-----------|
| [カスタムフォント](#カスタムフォント-custom-font) | インポートした `.ttf`/`.otf`/`.ttc` またはシステムフォントで、ビュー・Compose 画面・歌詞のフォントを置き換えます（SF Pro 欧文保持や適用箇所別の設定に対応）。 | なし |
| [LRCLIB 歌詞・読み仮名生成・歌詞編集](#lrclib-歌詞読み仮名生成歌詞編集-lrclib-lyrics) | 公式歌詞や同期歌詞がない楽曲を LRCLIB から自動取得し、曲ごとの上書き検索・タイミング調整・ソース表示に加え、オンデバイスでの読み仮名生成と歌詞行の長押し編集を提供します。 | なし |
| [ライブラリのエクスポート・インポート・ダウンロード](#ライブラリのエクスポートインポートダウンロード-library-import-export-and-downloads) | ライブラリとプレイリストの JSON バックアップ、差分インポート、およびライブラリ全体の一括ダウンロード機能を追加します。 | なし |
| [リキッドグラス・ボトムバー](#リキッドグラスボトムバー-liquid-glass-bottom-bar) | Apple Music のミニプレイヤーやボトムタブにリアルタイム屈折グラス効果、アニメーション付き選択レンズ、ミニプレイヤーと Now Playing 間のグラス遷移を追加します。 | なし |
| [オンデバイス・ボーカル分離](#オンデバイスボーカル分離-on-device-vocal-separation) | 歌詞画面にボーカル／伴奏のミックススライダーを追加します。初回モデルダウンロード後、ステレオおよび Dolby Atmos（マルチチャンネル PCM）再生に対応します（デフォルト無効・任意選択）。 | なし |
| [日本語ライブラリメタデータの修復](#日本語ライブラリメタデータの修復-repair-japanese-library-metadata) | ローマ字化されたライブラリの曲情報を検出し、日本のカタログデータを使用して選択した楽曲の表記を日本語に修復します。ライブラリ登録を維持したままアカウントと同期します。 | なし |

</details>

<details open>
<summary>📦 Twitter / X&nbsp;&nbsp;•&nbsp;&nbsp;1 パッチ</summary>
<br>

**パッケージ名:** `com.twitter.android`

**🎯 対応バージョン:**

| 12.19.1-release.0 |
| :---: |

| 💊&nbsp;パッチ名 | 📜&nbsp;概要 | ⚙️&nbsp;オプション |
|----------|----------------|-----------|
| [スペース・ローカルミュート](#スペースローカルミュート-spaces-local-mute) | Twitter / X スペースのライブ配信および録音リプレイにおいて、他のリスナーに影響を与えずに特定のスピーカーのみを自分側でローカルミュートできます。単独または Piko との併用に対応します。 | なし |

</details>

### 各パッチの機能詳細

#### カスタムフォント (`Custom font`)
- **多様なフォントソース**: 端末内の `.ttf` / `.otf` / `.ttc` フォントファイルのインポートおよびシステムフォント選択に対応。
- **幅広い適用範囲**: 通常ビュー、Jetpack Compose 画面、歌詞表示まで一貫してフォントを差し替え。
- **細かなカスタマイズ**: 欧文（英数字）のみ SF Pro を維持するオプションや、UI・歌詞など適用スコープごとの個別設定が可能。

#### LRCLIB 歌詞・読み仮名生成・歌詞編集 (`LRCLIB lyrics`)
- **LRCLIB 歌詞補完**: 公式歌詞や時間同期歌詞が存在しない楽曲について、LRCLIB から自動で歌詞を取得・表示。
- **曲ごとの調整とソース表示**: 曲単位での手動検索・上書き、ミリ秒単位のタイミングオフセット調整、および `Official` / `LRCLIB` のソース表示に対応。
- **オンデバイス読み仮名生成**: 公式歌詞・カスタム歌詞・LRCLIB 歌詞（同期／非同期・単語同期カラオケ行を含む）に対して、既存の公式発音ガイドを優先しつつ欠落している読み仮名を端末上で自動生成。日本語漢字は LRCLIB 設定から Kuromoji IPADIC 辞書（約 13.3 MB・SHA-256 検証済み）を一度だけダウンロードすることでオフライン動作し、対応する他言語は Android ICU を利用。
- **歌詞行の長押し編集**: 任意の歌詞行を長押しして歌詞テキストや読み仮名をローカル編集・保存可能（元の歌詞に戻す機能付き）。単語同期歌詞でも他行のタイミングを維持します。

#### オンデバイス・ボーカル分離 (`On-device vocal separation`)
- **端末内リアルタイム分離**: 歌詞画面のマイクボタンから UVR-MDX-NET 3 モデル（約 30 MB・SHA-256 検証済み）を初回ダウンロード後、縦スライダーで伴奏のみ〜原曲〜ボーカル抽出をシームレスに調整可能。
- **ステレオ & Dolby Atmos / マルチチャンネル対応**: モノラル・ステレオに加え、Dolby Atmos（`audio/eac3-joc`）や Dolby Audio（`audio/eac3` / `audio/ac3` / `audio/ac4`）を含む最大 24ch（5.1 / 7.1 / 5.1.4 / 7.1.4 / 22.2 等）のデコード済み PCM に対応。ステレオダウンミックス 1 パス推論と Wiener スペクトルマスク（無音チャンネルスキップ付き）により、空間配置と LFE 低音を保ちながら低負荷で分離。
- **システム負荷・安定性の最適化**: 共有 GPU（`SurfaceFlinger`）との競合を避けるため、リアルタイム条件を満たす端末では低優先度（`nice +6`）の低負荷 CPU 推論を優先し、CPU のみで不足する端末のみ NNAPI / WebGPU へフォールバック。出力フレームペーシングによる先読みパイプライン、原曲位置でのアイドルバイパス、モデル準備中のコントロール表示維持を備えます。

#### リキッドグラス・ボトムバー (`Liquid Glass bottom bar`)
- **リアルタイム屈折ガラス効果**: ミニプレイヤーおよびボトムナビゲーションバーに、背景がリアルタイムに屈折して透けるリキッドグラスを適用。
- **選択レンズと遷移演出**: 選択タブに追従・変形するアニメーション付きレンズと、ミニプレイヤー〜Now Playing 間のグラス遷移・ドラッグインタラクションを追加。
- ※ リアルタイム屈折シェーダー効果には **Android 13 (API 33) 以降** が必要です（Android 12 以下は標準ブラーを維持）。

#### ライブラリのエクスポート・インポート・ダウンロード (`Library import, export and downloads`)
- **ライブラリとプレイリストの書き出し**: 楽曲一覧・再生回数などの情報やプレイリスト構成を JSON 形式で外部ファイルにバックアップ。
- **差分インポート**: バックアップから未登録の楽曲や新しいプレイリストを追記インポート（登録済み項目は自動スキップ）。
- **ライブラリの一括ダウンロード**: ライブラリ内の利用可能な楽曲をまとめてバックグラウンドダウンロード。

#### 日本語ライブラリメタデータの修復 (`Repair Japanese library metadata`)
- **ローマ字表記の自動検出**: 日本語楽曲でありながらローマ字表記になっているメタデータをスキャン。
- **日本カタログとの高精度照合**: Apple Music の日本公式カタログと照合し、本来の日本語表記候補を提示。
- **変更プレビューと履歴維持同期**: 修復前後の差分を確認して個別・一括選択でき、クラウドライブラリのメタデータのみを更新するため追加日・プレイリスト配置・再生履歴を維持したまま同一 Apple ID の全端末に同期。

#### スペース・ローカルミュート (`Spaces local mute`)
- **リスナー側ローカルミュート**: 他のリスナーやホストに影響を与えずに、特定のスピーカーだけを自分の端末上でミュート（WebRTC ライブ配信・HLS リスナー・録音リプレイすべてに対応）。
- **2 か所から素早く操作**: スペース内のユーザープロフィールポップアップに 1 タップ切替行を追加するほか、ライブ／リプレイのヘッダーに発話中インジケーター・Smart / Strict モード・一括解除付きのミュートシートを追加。
- **高い互換性**: リソース改変を行わない純バイトコードパッチのため、単独適用はもちろん `crimera/piko` との併用にも対応します。

## 開発とビルド

ビルドには **JDK 21** および **Android SDK Platform 36** が必要です。  
GitHub CLI (`gh`) で `read:packages` スコープを認証し、`dev` ブランチでビルドします：

```sh
gh auth refresh --hostname github.com --scopes read:packages
./scripts/gradle.sh buildAndroid
```

Android 向けパッチバンドルは `patches/build/libs/patches-*.mpp` に出力されます。  
ローカルビルドランチャーは GitHub CLI から認証情報を取得し、独立した一時的な Gradle キャッシュを使用します（リポジトリ内にトークンは保存されません）。

セットアップ、検証手順、リリース規約についての詳細は [DEVELOPMENT.md](DEVELOPMENT.md) を、コントリビューションについては [CONTRIBUTING.md](CONTRIBUTING.md) を参照してください。コーディングエージェントは [AGENTS.md](AGENTS.md) および開発用スキルも確認してください。

## ライセンス

[GPLv3](LICENSE) の下でライセンスされています（[NOTICE](NOTICE) に記載されている名称制限事項を含みます）。
