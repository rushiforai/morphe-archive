# 取り込み元（ベース）の記録

この `sources/line/` は、本家 [andrewliang25/morphe-patches](https://github.com/andrewliang25/morphe-patches)
のソースツリーをコピーし、表示文字列を日本語化したものです
（方式はリポジトリの `docs/UPSTREAM.md` / `docs/LOCALIZATION.md` を参照）。
本家へは読み取り専用の一方向のみで、書き込みは一切しません。

- repository: https://github.com/andrewliang25/morphe-patches
- version: v3.11.0
- commit: ac7ecae7c3df423c92d3495481f9ce647981531d
- recorded: 2026-11-05
- updated: 2026-11-08（日次同期で v3.10.0 → v3.11.0 を取り込み。LINE 側は「Restore biometric login」の既定をオンに変更のみで、説明・設定 UI 文字列の変更なし。残りは Facebook 側と文書）

コピーは本家のツリー全体（Facebook 向けパッチや `util/` のリリース用ツールを含む）を
そのまま保持します。ビルドへの注入時に LINE 分だけを取り出します:

- 注入するもの: `patches/src/main/kotlin/app/andrewliang/patches/line/` と
  `.../patches/shared/`（LINE の互換定義とリソースID解決）、
  `extensions/extension/`（`.mpe` 名は `extensions/extension.mpe`）
- 注入しないもの: `patches/.../patches/facebook/`（Facebook パッチは収録対象外）、
  `patches/src/main/kotlin/util/`（本家のリリース用ツール。本家自身の
  `generatePatchesList` タスク用で、このリポジトリのビルドでは使わない）

本家の更新を取り込んだら、このファイルの commit を更新してください。
