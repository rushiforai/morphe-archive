# 取り込み元（ベース）の記録

この `sources/piko/` は、本家 [crimera/piko](https://github.com/crimera/piko) の
`x-lite` ブランチのソースツリーをコピーし、表示文字列を日本語化したものです
（方式はリポジトリの `docs/UPSTREAM.md` / `docs/LOCALIZATION.md` を参照）。
本家へは読み取り専用の一方向のみで、書き込みは一切しません。

- branch: x-lite
- commit: 25743f5205937a8f8892994958e02ec7eab83e00
- commit-date: 2026-11-14
- recorded: 2026-11-05（v1.2.0 で「ビルド時クローン＋オーバーレイ」から
  「翻訳済みソースのコピーを保持」へ移行した時点のベース）
- updated: 2026-11-08（日次同期で 3a68f2c → 86fb221 を取り込み。X 12.41.0-prod.01 対応。パッチの追加・削除・改名なし、説明・設定 UI 文字列の変更なし）
- updated: 2026-11-15（日次同期で 86fb221 → 25743f5 を取り込み。X 12.43.0-prod.01 対応（12.42 は本家でも未対応）、診断用パッチ「NewX: Log HLS audio renditions」が本家で削除され NewX は 51 件に。基盤は Morphe Patcher 2.3.0 / patches-library 2.2.0-dev.4 / piko-library 0.10.1-dev.5 / morphe-bytecode 0.1.5 へ更新。存続パッチの説明・設定 UI 文字列（values/newx 486 キー）の変更なし、翻訳の付け直しなし。crowdin.yml に newx が追加されたが日本語訳（values-ja-rJP/newx）はまだ本家に無く、公式日本語対応とはみなさない）

コピー時に取り除いたもの（従来のビルド時 cleanup と同一）:

- `patches/src/main/kotlin/app/crimera/patches/instagram/` と `.../twitter/`、
  `patches/src/main/kotlin/app/revanced/`
- `extensions/instagram/` と `extensions/twitter/`
- `patches/src/main/resources/twitter/` のうち `bringbacktwitter` 以外
- `patches/src/main/resources/addresources/` 配下の `*/instagram` と `*/twitter`
- `patches/src/main/kotlin/app/morphe/patches/all/misc/updates/DisablePlayStoreUpdates.kt`
  と `extensions/all/`（2026-11-15 追加。本家が MorpheApp から移植した共通パッチで、
  対象は旧 Twitter（12.19.1）と Instagram のみ・NewX 対象外。除いた Instagram／旧 Twitter
  側の Constants に依存するため、切り取ったツリーではビルドできない）

本家の更新を取り込んだら、このファイルの commit を更新してください。
