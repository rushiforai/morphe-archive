# Gemini microG patches

microGを使い、通常領域とSamsungセキュアフォルダでGeminiを動かすためのMorpheパッチ集です。GoogleアプリとGeminiランチャーを別パッケージとして構築します。

**最新の実機確認:** Google `17.72.17.ve.arm64`、Gemini `1.0.995038376`、パッチ `v0.3.2`。2026-11-12にSM-S948Q／Android17のセキュアフォルダuser150へ既存署名・データを保持して更新し、ユーザーがログイン状態の維持とチャット返答を確認。microGは既存環境を維持。通常領域は新版で未再検証。

## Setup / installation (English)

**Use v0.3.2 or newer and keep the default patch selection.** `Automatic Clone Setup` handles package, permission and provider isolation; official Clone app, Expert mode and custom options are unnecessary. Read [Supported setup](docs/setup-en.md) for the input variants. Do not select the three historical account experiments.

Issue #8 reproduction and the verified fix are recorded in [the emulator regression report](docs/testing/issue-8-emulator.md).

## Morpheに追加

[最新リリース](https://github.com/ryuya0124/gemini-microg-patches/releases/latest)から `.mpp` をダウンロードしてSources → Localで追加できます。

[Morpheにソースを追加](https://morphe.software/add-source?github=ryuya0124/gemini-microg-patches)、またはSources → RemoteにこのリポジトリのURLを入力してください。更新情報はルートの `patches-bundle.json` で配信します。

v0.3.2からは、このソースの**標準選択のまま**パッチしてください。`Automatic Clone Setup` が `.morphe` へのクローン化と権限・Providerの競合回避を行うため、公式Clone appやExpert modeでの手動設定は不要です。Googleはリソース入りのnodpi単体APKが扱いやすく、分割版では適合するresource splitも必要です。対応バリアントは[セットアップ手順](docs/setup-en.md)を参照してください。

## できること

- Geminiからクローン版Googleアプリを起動
- microGのアカウント同期・ログインと初回権限要求
- プロセス名の不一致によるクラッシュとアカウント同期ループの修正
- 仕事用プロファイルからのWeb転送と利用不可エラー `(19)` の回避

Googleアプリの特定バージョンを対象にしています。元APKの一致とパッチの適用箇所を検証し、対応しない入力ではビルドを停止します。

## クイックスタート

macOS / Linux、JDK 21、Python 3、Bashを用意します。署名にはAndroid SDK Build Tools `36.0.0`、端末への更新にはplatform-toolsが必要です。

```sh
git clone https://github.com/ryuya0124/gemini-microg-patches.git
cd gemini-microg-patches
scripts/setup-tools.sh
```

[inputs/README.md](inputs/README.md)に従って元APKを3つ配置します。

```sh
scripts/check-inputs.sh
scripts/build-all.sh
```

これで `build/` に未署名APKが生成され、DEXの分岐と仕事用プロファイルの変更箇所が検証されます。

## 署名とインストール

```sh
cp .env.example .env
# .envに署名キーパス、alias、パスワードを設定する
scripts/create-keystore.sh  # 初回のみ。既存キーがあれば実行不要
scripts/sign-apks.sh
ADB_SERIAL=端末のIP:ポート scripts/install-device.sh
```

既存インストールを更新するときは**同じ署名キー**を使用します。Macの作業環境には既存キーと `.env` を配置済みです。パスワードはローカル専用の `local/SIGNING.md` にあります。新しいキーで既存キーを置き換えないでください。

インストールする3ファイルは `dist/google-login.apk`、`dist/split_config.xxhdpi.apk`、`dist/gemini-login.apk` です。署名検証に成功したものだけを `dist/` に出力し、`SHA256SUMS` を生成します。

インストール先は既定でAndroid user 0です。セキュアフォルダなど別ユーザーへ更新する場合は、`ANDROID_USER=150 ADB_SERIAL=端末のIP:ポート scripts/install-device.sh` のように明示します。

利用するプロファイル内にmicroG (`app.revanced.android.gms`) とアカウントを用意し、Gemini (Morphe)を開いて初回のアカウント権限とmicroG拡張権限を許可します。SamsungではADBからセキュアフォルダ内のActivityを起動できないため、フォルダ内で手動で開きます。

## Googleアプリの依存関係

Geminiランチャーとは別に、**パッチ済みGoogleアプリとmicroGを同じプロファイルにインストール**してください。元の未改造Googleアプリを参照する設計ではありません。`Gemini Standalone Support` はsplit APKなしでインストールできるという意味で、Google本体を不要にする機能ではありません。v0.3.0からGeminiのManifestにもGoogleクローンのパッケージ可視性を明示します。

## バージョン別フック情報

[バージョン別記録](docs/versions/README.md)に、クラス・メソッド・フィールド・探索文字列・APKハッシュ・検証結果をまとめています。パッチ本体とDEX検証コードは同じ定義を参照します。新バージョンは別ファイルで追加し、未登録版への汎用適用は行いません。

## 開発コマンド

| コマンド | 用途 |
| --- | --- |
| `scripts/setup-tools.sh` | 固定バージョンの依存ツール取得・SHA-256検証 |
| `scripts/check-repo.sh` | Bash・ShellCheck・管理対象ファイルの検査 |
| `scripts/compile-patches.sh` | Desktop向け中間JARをコンパイル |
| `scripts/build-mpp.sh` | JVMクラス・Android DEX・Manifest入りの配布用MPPを生成・検証 |
| `scripts/check-hook-profiles.sh` | バージョン定義・入力ハッシュ・生成JSONの整合性を検証 |
| `scripts/build-google.sh` | Google本体のパッチ適用とDEX検証 |
| `scripts/build-all.sh` | Google・Geminiランチャー・splitを元APKから生成 |
| `scripts/verify-apks.sh` | Google本体のDEX検証を再実行 |
| `scripts/sign-apks.sh` | 3つのAPKを同じキーで署名・検証 |
| `scripts/install-device.sh` | 明示したADB接続先へデータを保持して更新 |

MPPの生成にはAndroid SDKの `platforms;android-36` も必要です。R8/D8 9.4.17はsetup-tools.shがハッシュ検証して取得します。

Javaは `JAVA`、Kotlinは `KOTLINC`、SDKは `ANDROID_HOME`、署名ツールは `APKSIGNER`、ADBは `ADB` で上書きできます。通常領域を自動起動する場合は `LAUNCH=1 ANDROID_USER=0` を追加します。

## GitHub Actions

- **CI**: push / PRでスクリプト検査とKotlinコンパイル。配布用MPPとメタデータ・チェックサムをArtifactに保存。
- **Build APKs (manual)**: 手動実行で元APKを取得し、3つの未署名APKを生成・検証。入力URLのSecrets設定が必要です。
- **Release patch bundle**: `v*` タグでMPP・ソースメタデータ・チェックサムを含むReleaseを公開。

**GitHub CI確認済み:** スクリプト検査、パッチと検証ツールのコンパイル、Artifact保存まで成功しました。[実行結果](https://github.com/ryuya0124/gemini-microg-patches/actions/runs/34036990773)

設定手順と通常CIが検証する範囲は [docs/automation.md](docs/automation.md) を参照してください。署名キーはMac内で管理し、ActionsのAPK成果物はローカルで署名します。

## ディレクトリ

```text
src/main/kotlin/  パッチ本体
scripts/         ビルド・検証・署名・インストール
config/          ツールの固定バージョンと元APKのハッシュ
docs/            設計・自動化・トラブルシューティング
analysis/legacy/ 過去の調査用Kotlinスクリプト
inputs/          元APK（Git対象外）
tools/           ダウンロードした依存ツール（Git対象外）
build/           再生成できる中間成果物（Git対象外）
dist/            署名・検証済み成果物（Git対象外）
local/           署名キー・個人用メモ・旧作業資料（Git対象外）
```

次の作業者は [HANDOFF.md](HANDOFF.md) から確認してください。技術的な修正理由は [docs/architecture.md](docs/architecture.md)、既知の制約は [docs/troubleshooting.md](docs/troubleshooting.md) にまとめています。

## 利用しているプロジェクト

[Morphe Desktop](https://github.com/MorpheApp/morphe-desktop)、[Morphe patches](https://github.com/MorpheApp/morphe-patches)、[microG](https://github.com/microg/GmsCore)を利用しています。このリポジトリにはGoogleの元APK、署名キー、実機の生ログを含めません。

更新時の探索方法・症状別の手掛かり・失敗例は [フック解析ガイド](docs/hook-analysis.md) を参照してください。`scripts/inspect-hooks.sh` で未知版のDEXも読み取り専用で検索できます。

新版の解析には [DexKit探索ツール](analysis/dexkit/README.md) を利用できます。`scripts/setup-dexkit.sh` の後、`scripts/discover-hooks.sh APK` で候補を抽出し、同じ入力の再探索はキャッシュで省略します。

クローンの出力検証には `scripts/verify-clone-contract.sh 元APK 生成APK` を使用できます。標準ビルド・署名・インストールの各段階でも実行します。Manager自体にこのCLI検証が組み込まれるわけではありません。
