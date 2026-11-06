# 本家（upstream）への追従方法

このリポジトリは本家に一切影響を与えずに、本家の更新を取り込めるように設計されています。

## 参照する本家

| 本家 | 参照するもの | 方法 |
|---|---|---|
| [MorpheApp/morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template) | このリポジトリの土台 | テンプレート生成で作成。以後のテンプレート変更は手動で差分を確認して取り込む |
| [MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches) | 対応 YouTube バージョン表（`patches/.../youtube/shared/Constants.kt` の `COMPATIBILITY_YOUTUBE`）と、拡張・パッチの実装手法 | 読み取り専用クローン／raw 取得のみ |
| MorpheApp/registry（GitHub Packages） | `app.morphe:morphe-patcher` 等の依存 | Gradle が取得。バージョンは `gradle/libs.versions.toml` で管理し Dependabot が更新 PR を出す |

## ルール（Equicord JA / piko-newx-ja と同じ家訓）

- 本家リポジトリへの **PR・Issue・マージ・コメントは一切しない**。upstream は fetch / 読み取り専用。
- 本家のコードをコピーする場合は GPL-3.0 とクレジット（NOTICE）を守る。原則として、このリポジトリは本家コードをコピーせず、本家の公開するパッチャー API と対応バージョン表だけを参照する。
- 本家の対応バージョンが変わったら、こちらの `Constants.kt` のターゲットとフィンガープリントを新しいバージョンで検証し直してから更新する。

## 自動検知（upstream-watch）

`.github/workflows/upstream-watch.yml` が毎日 10:30 JST に：

1. 本家 `morphe-patches` の `Constants.kt` と `gradle/libs.versions.toml` を raw で取得する（読み取りのみ）。
2. このリポジトリの `Constants.kt` に書かれた YouTube ターゲットバージョン一覧、および `morphe-patcher` のバージョンと比較する。
3. 差分があれば、このリポジトリ内に `upstream` ラベルの Issue を立てる（同じ内容の open Issue がある場合は立てない）。

Issue が立ったら、内容を確認して：

- Android 8.0 向け「最後のバージョン」が変わっていたら → ライブ遅延キーパーの対象バージョンとフィンガープリントを更新する。
- 最新の安定ターゲットが変わっていたら → ライブチャット パッチの対象バージョンとフィンガープリントを更新する。
- `morphe-patcher` の新版が出ていたら → Dependabot PR を確認してマージする。

## 手動で確認するとき

```bash
# 本家の対応バージョン表だけを見る（読み取り専用）
curl -s https://raw.githubusercontent.com/MorpheApp/morphe-patches/main/patches/src/main/kotlin/app/morphe/patches/youtube/shared/Constants.kt
```
