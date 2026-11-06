# 本家（upstream）への追従方法

このリポジトリは本家に一切影響を与えずに、本家の更新を取り込めるように設計されています。

## 参照する本家

| 本家 | 参照するもの | 方法 |
|---|---|---|
| [MorpheApp/morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template) | このリポジトリの土台 | テンプレート生成で作成。以後のテンプレート変更は手動で差分を確認して取り込む |
| [MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches) | 拡張・パッチの実装手法 | 読み取り専用クローン／raw 取得のみ |
| MorpheApp/registry（GitHub Packages） | `app.morphe:morphe-patcher` 等の依存 | Gradle が取得。バージョンは `gradle/libs.versions.toml` で管理し Dependabot が更新 PR を出す |

## ルール（Equicord JA / piko-newx-ja と同じ家訓）

- 本家リポジトリへの **PR・Issue・マージ・コメントは一切しない**。upstream は fetch / 読み取り専用。
- 本家のコードをコピーする場合は GPL-3.0 とクレジット（NOTICE）を守る。原則として、このリポジトリは本家コードをコピーせず、本家の公開するパッチャー API と対応バージョン表だけを参照する。
- 本家の対応バージョンが変わったら、こちらの `Constants.kt` のターゲットとフィンガープリントを新しいバージョンで検証し直してから更新する。
