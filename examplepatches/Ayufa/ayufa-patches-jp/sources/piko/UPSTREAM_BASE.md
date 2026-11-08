# 取り込み元（ベース）の記録

この `sources/piko/` は、本家 [crimera/piko](https://github.com/crimera/piko) の
`x-lite` ブランチのソースツリーをコピーし、表示文字列を日本語化したものです
（方式はリポジトリの `docs/UPSTREAM.md` / `docs/LOCALIZATION.md` を参照）。
本家へは読み取り専用の一方向のみで、書き込みは一切しません。

- branch: x-lite
- commit: 86fb221bf9d901cf8d3f8d3dcd94fa498a9966fb
- commit-date: 2026-11-07
- recorded: 2026-11-05（v1.2.0 で「ビルド時クローン＋オーバーレイ」から
  「翻訳済みソースのコピーを保持」へ移行した時点のベース）
- updated: 2026-11-08（日次同期で 3a68f2c → 86fb221 を取り込み。X 12.41.0-prod.01 対応。パッチの追加・削除・改名なし、説明・設定 UI 文字列の変更なし）

コピー時に取り除いたもの（従来のビルド時 cleanup と同一）:

- `patches/src/main/kotlin/app/crimera/patches/instagram/` と `.../twitter/`、
  `patches/src/main/kotlin/app/revanced/`
- `extensions/instagram/` と `extensions/twitter/`
- `patches/src/main/resources/twitter/` のうち `bringbacktwitter` 以外
- `patches/src/main/resources/addresources/` 配下の `*/instagram` と `*/twitter`

本家の更新を取り込んだら、このファイルの commit を更新してください。
