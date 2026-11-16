# 取り込み元（ベース）の記録

この `sources/line/` は、本家 [andrewliang25/morphe-patches](https://github.com/andrewliang25/morphe-patches)
のソースツリーをコピーし、表示文字列を日本語化したものです
（方式はリポジトリの `docs/UPSTREAM.md` / `docs/LOCALIZATION.md` を参照）。
本家へは読み取り専用の一方向のみで、書き込みは一切しません。

- repository: https://github.com/andrewliang25/morphe-patches
- version: v3.12.0
- commit: 159c883f625b5d38ca28758ad14647399ca38b12
- recorded: 2026-11-05
- updated: 2026-11-16（日次同期で c00bb2d → 159c883（v3.12.0）を取り込み。LINE パッチ7件追加（通話録音4件＝自動録音／無通知録音／録音時間制限の解除／端末への保存、いずれも 26.16.0 のみ・Googleログイン復旧（MicroG-RE）・サブ端末のテーマ有効化・LINE AI画像編集の非表示）で LINE 32件→39件、「Hide Agent i buttons」の説明と対象範囲を更新（ウォレット／設定／+メニューへ拡大、設定スイッチ追加）。新規説明7件と変更1件、設定画面の新規文字列（「通話」セクション4件＋ボタン2件）を翻訳。対応 LINE バージョンは 26.14.0／26.15.1／26.16.0 のまま（通話録音4件は 26.16.0 のみ）

コピーは本家のツリー全体（Facebook 向けパッチや `util/` のリリース用ツールを含む）を
そのまま保持します。ビルドへの注入時に LINE 分だけを取り出します:

- 注入するもの: `patches/src/main/kotlin/app/andrewliang/patches/line/` と
  `.../patches/shared/`（LINE の互換定義とリソースID解決）、
  `extensions/extension/`（`.mpe` 名は `extensions/extension.mpe`）
- 注入しないもの: `patches/.../patches/facebook/`（Facebook パッチは収録対象外）、
  `patches/src/main/kotlin/util/`（本家のリリース用ツール。本家自身の
  `generatePatchesList` タスク用で、このリポジトリのビルドでは使わない）

本家の更新を取り込んだら、このファイルの commit を更新してください。
