# 開発ガイド / Development

利用者向けのインストール手順は [README](../README.md) を参照してください。

## ビルド

macOS / Linux、JDK 21、Bash、`jq`、`curl`、`zip`、`unzip`、`shasum` を用意します。配布用MPPには Android SDK の `platforms;android-36`、署名には Build Tools `36.0.0`、端末へのインストールには platform-tools が必要です。`setup-tools.sh` は設定ファイルに記載された R8/D8 などを取得し、ハッシュを検証します。[依存ツールのバージョン](../config/tools.lock.json)

`scripts/emulator/test-issue8*.mjs` の回帰試験には Node.js 22 以降を使います。ビルド、署名、GitHub Actionsの実行はBashとコマンドラインツールだけで行えます。

```sh
git clone https://github.com/ryuya0124/gemini-microg-patches.git
cd gemini-microg-patches
scripts/setup-tools.sh
```

[入力APKの手順](../inputs/README.md)に従って元APKを配置します。

```sh
scripts/check-inputs.sh
scripts/build-all.sh
```

未署名APKは `build/` に出力されます。単体APKや古いAndroid向けのバリアントは [Android 12の検証手順](testing/issue-8-android12.md) を参照してください。

## 署名と実機へのインストール

```sh
cp .env.example .env
# .env に署名キーのパス、エイリアス、パスワードを設定
scripts/create-keystore.sh  # 新規セットアップ時のみ
scripts/sign-apks.sh
ADB_SERIAL=your_device_serial scripts/install-device.sh
```

既存のインストールを更新するときは、同じ署名キーを使用します。既定の分割APK構成では `dist/google-login.apk`、`dist/split_config.xxhdpi.apk`、`dist/gemini-login.apk` と `SHA256SUMS` が生成されます。

インストール先は既定で Android user 0 です。Secure Folderなどでは端末で対象ユーザーIDを確認して、`ANDROID_USER` を明示します。通常領域でインストール後に起動するときは `LAUNCH=1 ANDROID_USER=0` を追加します。Secure Folderではフォルダ内から手動で起動します。[トラブルシューティング](troubleshooting.md)

`JAVA`、`KOTLINC`、`ANDROID_HOME`、`APKSIGNER`、`ADB` でツールの場所を指定できます。

## 開発コマンド

| コマンド | 用途 |
| --- | --- |
| `scripts/setup-tools.sh` | 固定バージョンの依存ツール取得とSHA-256検証 |
| `scripts/check-repo.sh` | Bash、ShellCheck、管理対象ファイルの検査 |
| `scripts/compile-patches.sh` | Desktop向け中間JARのコンパイル |
| `scripts/build-mpp.sh` | JVMクラス、Android DEX、Manifest入りの配布用MPPを生成・検証 |
| `scripts/check-hook-profiles.sh` | バージョン定義、入力ハッシュ、生成JSONの整合性を検証 |
| `scripts/build-google.sh` | Google本体のパッチ適用とDEX検証 |
| `scripts/build-all.sh` | Google、Geminiランチャー、必要なsplitを元APKから生成 |
| `scripts/verify-apks.sh` | Google本体のDEX検証を再実行 |
| `scripts/sign-apks.sh` | APKを同じキーで署名・検証 |
| `scripts/install-device.sh` | 指定したADB接続先のアプリをデータを保持して更新 |

### Managerで生成したAPKの検証

インストール前にAPKをエクスポートし、元APKと照合します。

```sh
scripts/setup-tools.sh
scripts/compile-patches.sh
scripts/verify-clone-contract.sh original-google-base.apk manager-google-output.apk
scripts/verify-clone-contract.sh original-gemini-base.apk manager-gemini-output.apk
```

パッケージ名、マニフェストとDEXの権限参照、権限の保護レベル、Providerの衝突を検証します。リポジトリのビルド・署名・インストールでも同じ検証を実行します。

## 新しいアプリ版への対応と検証

パッチとDEX検証は同じバージョン別定義を参照します。新しいアプリ版を追加するときは、クラス・メソッド・フィールド、探索文字列、APKのハッシュ、検証結果を版ごとに記録します。[対応版の記録](versions/README.md) · [フック解析ガイド](hook-analysis.md)

`scripts/inspect-hooks.sh` はDEXを読み取り専用で調べます。`scripts/setup-dexkit.sh` のあとに `scripts/discover-hooks.sh APK` を実行すると、候補を抽出します。同じ入力の探索結果はキャッシュから再利用します。[DexKit探索ツール](../analysis/dexkit/README.md)

Geminiランチャーはパッチ済みGoogle本体を同じAndroidプロファイルから起動します。Gemini Standalone SupportはリソースsplitなしのGemini APKに対応します。[設計](architecture.md) · [Issue #8のエミュレータ回帰検証](testing/issue-8-emulator.md)

Android版Managerでの起動回帰、初回権限、Playストア更新停止の検証は個別に記録しています。[Managerで生成したAPK](testing/issue-8-manager-registers.md) · [初回権限](testing/issue-8-permission-ui.md) · [Playストア更新停止](testing/issue-8-play-store.md)

Secure Folderで既存署名とデータを保持してログイン・チャットを確認した記録、および現行バンドルのPatcher移行・メモリ調査も参照できます。[実機の確認記録](testing/default-clone.md#physical-update) · [Patcher 2.5移行](testing/issue-9-patcher-2.5.md)

## CIとリリース

- **CI** はpush・PRでスクリプト検査とKotlinコンパイルを実行し、配布用MPP・メタデータ・チェックサムをArtifactに保存します。
- **Build APKs (manual)** は設定済みの入力URLから元APKを取得し、未署名APKを生成・検証します。
- **Release patch bundle** は `v*` タグに対応するMPP・ソースメタデータ・チェックサムを公開します。

署名はローカルで行います。[ワークフローの設定と検証範囲](automation.md) · [CIの実行履歴](https://github.com/ryuya0124/gemini-microg-patches/actions)

## ディレクトリ

| パス | 内容 |
| --- | --- |
| `src/main/kotlin/` | パッチ本体 |
| `scripts/` | ビルド・検証・署名・インストール |
| `config/` | ツールの固定バージョンと元APKのハッシュ |
| `docs/` | 設計・自動化・検証記録 |
| `analysis/legacy/` | 過去の調査用Kotlinスクリプト |
| `inputs/`、`tools/` | 元APKと依存ツール（Git対象外） |
| `build/`、`dist/` | 中間成果物と署名・検証済みAPK（Git対象外） |
| `local/` | 署名キー・個人用メモ・旧作業資料（Git対象外） |

作業の引き継ぎは [HANDOFF.md](../HANDOFF.md) を参照してください。
