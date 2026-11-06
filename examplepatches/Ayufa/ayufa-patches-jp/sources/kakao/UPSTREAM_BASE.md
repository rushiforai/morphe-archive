# 取り込み元（ベース）の記録

この `sources/kakao/` は、本家 [AmpleReVanced/revanced-patches](https://github.com/AmpleReVanced/revanced-patches)
のソースツリーをコピーし、表示文字列を日本語化したものです
（方式はリポジトリの `docs/UPSTREAM.md` / `docs/LOCALIZATION.md` を参照）。
本家へは読み取り専用の一方向のみで、書き込みは一切しません。

- repository: https://github.com/AmpleReVanced/revanced-patches
- version: v1.5.0
- commit: a37261b029dc8d9ca54a9c8bf48a36ffa48e55be
- recorded: 2026-11-06

対象アプリは KakaoTalk（`com.kakao.talk`、対応バージョン 26.9.0）のみです。
コピーは本家のツリー全体（DC Inside、AfreecaTV/SOOP、Naver ゲームコミュニティ、
Onyx Note、Flexcil、Naver Map、Samsung Keyboard、Chzzk、StarNote 向けパッチを含む）を
そのまま保持しますが、他のアプリ分は取り込み時のマージ忠実度のためだけに残すもので、
翻訳もせず、ビルドへも注入しません。ビルドへの注入時に KakaoTalk 分だけを取り出します:

- 注入するもの: `patches/src/main/kotlin/app/revanced/patches/kakaotalk/`（全76件）、
  `patches/src/main/kotlin/app/revanced/util/`（ヘルパーのみ。パッチ宣言なし）、
  KakaoTalk が import する共有ファイル3件
  （`patches/shared/misc/packagename/ChangePackageNamePatch.kt`、
  `patches/shared/misc/string/ReplaceStringPatch.kt`、
  `patches/shared/misc/privacy/DisableSentryTelemetry.kt`）と
  共通ファイル3件（`patches/all/misc/build/BaseSpoofBuildInfoPatch.kt`、
  `patches/all/misc/versioncode/ChangeVersionCodePatch.kt`、
  `patches/all/misc/transformation/TransformInstructionsPatch.kt`。
  いずれも名前なしの土台パッチ／ファクトリで、KakaoTalk 側から使われるものだけ）、
  リソース `patches/src/main/resources/kakaotalk/` と `settings/`（KakaoTalk 用ファイルのみ）、
  `addresources` の `values/kakaotalk/`・`values-ko-rKR/kakaotalk/`・`values-ja-rJP/kakaotalk/`、
  `extensions/kakaotalk/`（ネストした `stub/` を含む）
- 注入しないもの: 他のアプリ向けパッチ一式（`patches/dcinside/`、`soop/`、`chzzk/`、
  `flexcil/`、`navermap/`、`samsungkeyboard/`、`starnote/` と `patches/all/`・`shared/` の
  残り）、他のアプリの `addresources` と拡張モジュール、本家が同梱する
  `app/morphe/patches/**` のライブラリソース（ホスト側の Morphe ライブラリで代替する）

翻訳範囲は、KakaoTalk 全76パッチの `description` と、共有の依存パッチ
「Disable Sentry telemetry」の `description`、および
`addresources/values-ja-rJP/kakaotalk/strings.xml`（新規追加、全189キー）のみです。
パッチ名（`name`）は恒久ルールどおり本家の英語名のままです。
拡張モジュール内の表示文字列はすべて `addresources` の文字列リソース経由のため、
拡張コード自体は翻訳しません。

本家の更新を取り込んだら、このファイルの commit を更新してください。
