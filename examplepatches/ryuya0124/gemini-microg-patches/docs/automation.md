# 自動化

## 通常CI

`ci.yml` はmainへのpush、PR、手動実行で動く。JDK 21とハッシュ固定のKotlin/Morpheを使用して、シェル検査・管理対象ファイルの検査・パッチと検証ツールのコンパイル、配布用MPPのDEX・Manifest検証とDesktop読み込みを行う。

元APK・署名キー・実機接続は不要。成果物 `gemini-patches-<commit>` は14日保存される。通常CIの成功はAPK適用や実機ログインを保証しない。

## GitHub上でAPKを作る

`Build APKs (manual)` は入力を自分で用意した場合に利用できる。Repository settings → Secrets and variables → Actionsに、検証済み元APKを取得できるHTTPS URLを登録する。

| Secret | 対応ファイル |
| --- | --- |
| `GOOGLE_BASE_APK_URL` | `inputs/google-base.apk` |
| `GOOGLE_SPLIT_APK_URL` | `inputs/google-xxhdpi.apk` |
| `GEMINI_BASE_APK_URL` | `inputs/gemini-base.apk` |

URLはダウンロード可能なものを使う。期限付きURLなら実行前に更新する。元APKのハッシュが異なる場合、ビルド前に停止する。設定前に手動実行すると不足するSecret名を表示して停止する。

Actions画面から実行すると、未署名APK3つ、パッチJAR、パッチ結果JSONを7日間保存する。Artifactを展開してファイルをローカルの `build/` に配置し、`scripts/sign-apks.sh` を実行する。署名キーはローカルに保持する。

## リリース

バージョンメタデータとリリースノートを準備し、MPPを検証してコミットする。そのコミットにバージョンタグをpushするとReleaseが公開される。

```sh
python3 scripts/prepare-release.py 0.2.0
# docs/releases/v0.2.0.md を作成
scripts/build-mpp.sh
git add patches-bundle.json docs/releases/v0.2.0.md
git commit -m "chore: prepare v0.2.0"
git push origin main
git tag v0.2.0
git push origin v0.2.0
```

Releaseには `gemini-microg-patches-<version>.mpp`、`patches-bundle.json`、`SHA256SUMS` を添付する。タグとメタデータのバージョンが違う場合は停止する。APKや中間JARは添付しない。既存タグの再実行時は既存Releaseを確認すること。

## 依存更新

GitHub Actionsはcommit SHAに固定し、Dependabotが月次で更新PRを作る。Morphe/Kotlinは `config/tools.lock.json` のURL・バージョン・公式配布物のSHA-256を一緒に更新する。

ツールや元APKを更新した場合はコンパイルだけでなく `scripts/build-all.sh` と実機ログイン・チャットを確認し、[HANDOFF.md](../HANDOFF.md)に結果を残す。

## 2026-09-06の実行確認

当初は課金問題によるアカウントロックでジョブが開始されなかったが、ユーザー依頼による再実行でCIが成功した。こちらでは課金設定を変更していない。

[成功した実行](https://github.com/ryuya0124/gemini-microg-patches/actions/runs/34036990773)では、スクリプト検査、固定ツールの取得、パッチのコンパイル、APK検証ツールのコンパイル、パッチJARのArtifact保存まで確認済み。

Macでは全APKビルド・DEX検証・署名も成功済み。通常CIは元APKを使用しないため、全APKビルドや実機ログインの代替にはならない。

再実行はActions → CI → Run workflow、または以下のコマンドを使用する。

```sh
gh workflow run ci.yml --repo ryuya0124/gemini-microg-patches
```
