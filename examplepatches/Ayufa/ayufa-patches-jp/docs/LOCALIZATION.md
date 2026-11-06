# 日本語化の方針と範囲（ayufa-patches-jp）

いずれも「本家をクローンし、言語だけを日本語にする」方式で、翻訳済みソースのコピーを保持します（X 側: `sources/piko/`、Twitch 側: `sources/twitch/`、LINE 側: `sources/line/`、KakaoTalk 側: `sources/kakao/`）。

**恒久ルール: パッチ名（タイトル）は絶対に翻訳しません。** Morphe のパッチャーはパッチを名前の文字列順に実行するため、名前を変えると実行順序が本家と入れ替わり、本家で成功する構成でも失敗します（X 12.39.0-prod.01 で実証済み。詳細は `docs/UPSTREAM.md` の「既知の問題」）。4アプリとも、パッチ宣言の `name` は本家の英語名のまま保持し、日本語化するのは `description` とアプリ内 UI 文字列だけです。本家が新しいパッチを追加した場合も同じです。

## X 側（Piko / NewX）: ソース直接翻訳方式

本家 `crimera/piko` の `x-lite` ブランチには、Piko 設定 UI の文字列
`patches/src/main/resources/addresources/values/newx/strings.xml`（486件）の
日本語訳が存在しません（Crowdin の対象にも含まれていません）。
v1.1.x まではこの日本語訳をオーバーレイとして保持していましたが、
v1.2.0 からは Twitch 側と同じくソースのコピーを保持する方式に統一し、
翻訳はすべてコピー（`sources/piko/`）の中で完結します。

翻訳するもの:

- Piko 設定 UI の表示文字列 全486件: `sources/piko/patches/src/main/resources/addresources/values-ja-rJP/newx/strings.xml` に実ファイルとして保持します（本家に無い日本語リソースの追加）。
- Morphe のパッチ一覧に表示される説明: パッチ宣言（Kotlin ソース）の `description` 全52件を日本語に書き換えています。設定 UI 側に同じ機能の訳がある場合は、そちらに合わせます。`name` は本家の英語名のままです（上記の恒久ルール）。
- 未訳のキーは Android のフォールバックで英語表示になります（壊れることはありません）。

翻訳しないもの:

- 拡張機能コード内に直書きされた一部のトースト文字列（英語のまま）。
- パッチのオプション（`stringOption` 等）のラベル・説明（英語のまま）。
- 設定キーなどの内部識別子、ブランド名・プロバイダー名、内部エラーやログの文字列。
- 共有文字列（`values/shared`）は本家に既存の日本語訳を利用します。

### X 側の更新手順（本家に新しい文字列が増えたら）

1. 本家 `values/newx/strings.xml` のキーと、`sources/piko/` の日本語ファイルのキーを比べます（ビルド時に未訳キーは "untranslated string(s)" としてログに出ます）。
2. 増えたキーを翻訳して日本語ファイルに追加します。**プレースホルダ（`%1$s`、`%2$d`、`%%` など）は英語版と完全一致**させてください。
3. 本家がパッチ宣言の説明を変えたり、新しいパッチを足したりしたら、説明だけを日本語に訳してコピーへ反映し、`scripts/verify_bundle.py` の `EXPECTED_PATCHES` を更新します。名前は本家の英語名をそのまま使います（新しいパッチも同様。絶対に翻訳しない）。

### X 側の用語の統一

- post → ポスト、timeline → タイムライン、For You → おすすめ、Following → フォロー中
- Repost → リポスト、Like → いいね、Bookmark → ブックマーク、Share → 共有
- Piko / NewX / Grok などの固有名詞は英語のまま
- `translatable="false"` の文字列は英語版をそのまま保持

## Twitch 側: ソース直接翻訳方式

本家 `ryykitty/twitch-patched` のパッチには Android の文字列リソース
（strings.xml）の仕組みが無く、表示文字列はすべてソースコード内に直接
書かれています。そのためオーバーレイはできず、**コピー側リポジトリ
（`sources/twitch/`）で文字列を直接翻訳する** 方式を取ります。
本家の更新を取り込むたびに、翻訳行で競合が起きる可能性があります
（対処は `docs/UPSTREAM.md`）。

翻訳するもの（ユーザーに見える表示文字列のみ）:

- パッチ設定画面（拡張機能の Java コード）: 設定項目名と説明、セクション名10件、検索まわり、ツールバー、お気に入りの追加・削除ラベル、削除済みメッセージのラベル「（削除済み）」など。
- Morphe のパッチ選択画面（パッチ定義の Kotlin コード）: 全13パッチの説明、対応バージョンの説明、Twitch 本体の設定一覧に出る入口名「パッチ設定」。パッチ名は本家の英語名のままです（上記の恒久ルール）。
- React Native 側の表示文字列: お気に入り、再読み込みのトーストとラベル、エモート種別ラベル、UI 設定への入口。

翻訳しないもの:

- 設定キー、SharedPreferences のキー、URL スキームなどの内部識別子（互換性のため絶対に変えない）
- ブランド名・サービス名・プロバイダー名: Twitch、BTTV、7TV、FrankerFaceZ、Twitch Turbo など（ハイプトレイン等、カタカナ表記が自然なものは訳す）
- 例外メッセージ、ログ、内部エラー文字列（診断用で、コード側で参照される場合もあるため）
- テストコード内のダミー文字列

翻訳済み文字列を検証するテスト（`UiFeatureRegistryTest`、`SettingsSearchTest`、`scripts/tests/` の React Native 系）は、期待値を日本語に合わせて更新しています。対象ファイルの詳細な対応表は `sources/twitch/docs/LOCALIZATION.md` に保持しています。

### Ayufa 独自パッチ（Twitch 側のみ）

Twitch 側には、本家に無い Ayufa の独自パッチ「Ayufa: Startup tab」（v1.3.0 追加）が1件だけ含まれます。日本語化ではなく新機能（起動時に開くタブの選択）なので、文字列は最初から日本語で書き、パッチ名だけは恒久ルールに従って英語のままにします。初期状態は未選択（おすすめに含めない）です。詳細は `docs/UPSTREAM.md` の Twitch 側の例外注記を参照してください。

## LINE 側: ソース直接翻訳方式

本家 `andrewliang25/morphe-patches` のパッチにも文字列リソースの仕組みが無く、
表示文字列はソースコード内に直接書かれています。そのため Twitch 側と同じく、
**コピー側リポジトリ（`sources/line/`）で文字列を直接翻訳する** 方式を取ります。
本家の更新を取り込むたびに、翻訳行で競合が起きる可能性があります
（対処は `docs/UPSTREAM.md`）。

収録範囲は LINE 向けパッチだけです。コピーは本家のツリー全体
（Facebook 向けパッチを含む）を保持しますが、Facebook 側は翻訳もしませんし、
バンドルにも入りません（ビルドへの注入時に除外。詳細は `docs/UPSTREAM.md`）。

翻訳するもの（ユーザーに見える表示文字列のみ）:

- Morphe のパッチ選択画面（パッチ定義の Kotlin コード）: LINE 全32パッチの説明。パッチ名は本家の英語名のままです（上記の恒久ルール）。
- LINE の設定画面に追加される「Andrew's Patch Setting」の UI 文字列（拡張機能の Java コード `LineSettingsScreen.java`）: セクション名、スイッチのラベルと説明、再起動・終了の行、注記、クレジットまわり、ライセンスダイアログのボタン類。

翻訳しないもの:

- 画面・メニューのタイトル「Andrew's Patch Setting」とプロジェクト名「Andrew's Patches」（固有名詞のため英語のまま）。LINE の設定一覧に追加される行のタイトルも同じ文字列で、本家のパッチコードがそのまま追加します。
- GPL のライセンス告知文（`LICENSE_NOTICE`。法務文のため原文のまま）。
- 設定キー、SharedPreferences のキー、機能ID（`hideWalletTab` など）、インテントやリソース名などの内部識別子（互換性のため絶対に変えない）。
- LINE アプリ本体の文言と照合される文字列（「CHECK」のヒントなど、アプリ側の表示を指す語句はそのまま引用）。
- ブランド名・サービス名: LINE、LINE Pay、VOOM、MicroG、OpenFreeMap など。
- 例外メッセージ、ログ、内部エラー文字列。
- Facebook 向けの拡張ファイル（`FacebookSettings.java` など。収録対象外のため手つかず）。

### LINE 側の更新手順（本家に新しい文字列が増えたら）

1. 本家が LINE パッチの説明を変えたり、新しい LINE パッチを足したりしたら、説明だけを日本語に訳してコピーへ反映し、`scripts/verify_bundle.py` の `EXPECTED_PATCHES`（`jp.naver.line.android`）を更新します。名前は本家の英語名をそのまま使います（新しいパッチも同様。絶対に翻訳しない）。
2. 本家が「Andrew's Patch Setting」画面に表示文字列を足したら、`LineSettingsScreen.java` の該当文字列を翻訳します。設定キーや機能IDは変えません。

## KakaoTalk 側: X 側と同じ addresources 方式

本家 `AmpleReVanced/revanced-patches` の KakaoTalk パッチには、X 側と同じ
addresources の仕組みがあります。設定 UI の文字列
`patches/src/main/resources/addresources/values/kakaotalk/strings.xml`（全187件）には
本家に韓国語訳（`values-ko-rKR`）だけがあり、日本語訳は存在しません。
そのため X 側と同じく、コピー側に日本語リソースを実ファイルとして追加します。
収録範囲は KakaoTalk 向けパッチだけです。コピーは本家のツリー全体
（他アプリ向けパッチを含む）を保持しますが、他アプリ分は翻訳もしませんし、
バンドルにも入りません（ビルドへの注入時に除外。詳細は `docs/UPSTREAM.md`）。

翻訳するもの:

- KakaoTalk 設定 UI の表示文字列 全187件: `sources/kakao/patches/src/main/resources/addresources/values-ja-rJP/kakaotalk/strings.xml` に実ファイルとして保持します（本家に無い日本語リソースの追加）。英語版ファイル冒頭のコメントにある raw 文字列の引用ルール（改行を含む文字列は引用符で囲み、改行をエンコードしない）に従います。なお `values/kakaotalk/arrays.xml` は本家でも空のため、日本語版は作りません。
- Morphe のパッチ一覧に表示される説明: パッチ宣言（Kotlin ソース）の `description` 全76件を日本語に書き換えています。共有の依存パッチ「Disable Sentry telemetry」（対象アプリを指定しない共通パッチ。KakaoTalk の「Disable Sentry」が依存）の説明も併せて日本語化しています。`name` は本家の英語名のままです（上記の恒久ルール）。

翻訳しないもの:

- 拡張機能コード内の文字列。KakaoTalk 拡張の表示文字列はすべて addresources の文字列リソース経由で、`resString()` の英語フォールバックや設定キー（`kakaotalk_*`）などの内部識別子は英語のままにします。
- パッチのオプション（`stringOption` 等）のラベル・説明（英語のまま。X 側と同じ方針）。
- 名前の無い土台パッチ（`baseChangePackageNamePatch` など）の説明。Morphe の一覧には出ません。
- ブランド名・サービス名: KakaoTalk、KakaoPay、Kakao Now、AdFit、BizBoard、Sentry、GitHub、Telegram など。
- 例外メッセージ、ログ、内部エラー文字列。

### KakaoTalk 側の更新手順（本家に新しい文字列が増えたら）

1. 本家 `values/kakaotalk/strings.xml` のキーと、`sources/kakao/` の日本語ファイルのキーを比べます。
2. 増えたキーを翻訳して日本語ファイルに追加します。**プレースホルダ（`%1$s`、`%1$d`、`%2$d` など）は英語版と完全一致**させてください。件数表示は「{全体}件中{一部}件」のように日本語の語順に入れ替えます（プレースホルダの番号自体は英語版と対応させます）。
3. 本家がパッチ宣言の説明を変えたり、新しい KakaoTalk パッチを足したりしたら、説明だけを日本語に訳してコピーへ反映し、`scripts/verify_bundle.py` の `EXPECTED_PATCHES`（`com.kakao.talk`）を更新します。名前は本家の英語名をそのまま使います（新しいパッチも同様。絶対に翻訳しない）。

## 表記の方針

- 設定名は簡潔に（Twitch 本家の「簡潔なラベル」方針に合わせる）。
- 説明文は元の文末ピリオドに合わせて「。」で終える。
- 件数表示は「{全体}件中{一部}件を非表示中です。」のように、日本語の語順に入れ替える（コード側の文字列連結の順序も合わせて変更している）。
