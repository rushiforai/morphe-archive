# 本家への追従方法（ayufa-patches-jp）

このリポジトリは、次の4つの本家プロジェクトのパッチを1つの `.mpp` バンドルにまとめた日本語化プロジェクトです。

- X 側: [crimera/piko](https://github.com/crimera/piko) の `x-lite` ブランチ（NewX）。ビルダーの系譜は [crimera/piko-newx](https://github.com/crimera/piko-newx)。
- Twitch 側: [ryykitty/twitch-patched](https://github.com/ryykitty/twitch-patched)（ベースは v1.5.0）。
- LINE 側: [andrewliang25/morphe-patches](https://github.com/andrewliang25/morphe-patches)（ベースは v3.10.0）。収録するのは LINE 向けパッチだけで、同じ本家の Facebook 向けパッチは収録しません。
- KakaoTalk 側: [AmpleReVanced/revanced-patches](https://github.com/AmpleReVanced/revanced-patches)（ベースは v1.5.0、GPL-3.0）。収録するのは KakaoTalk 向けパッチだけで、同じ本家の他アプリ向けパッチは収録しません。

いずれも「本家をクローンし、言語だけを日本語にする」方式です。翻訳済みソースのコピーをこのリポジトリに保持し、ビルドはそのコピーをそのままビルドするだけです（v1.2.0 で統一。経緯は後述）。本家には迷惑をかけないため、次のルールを絶対とします。

## 絶対ルール

- 本家リポジトリへのプルリクエスト、Issue、コメント、マージなど、書き込みは一切しない。
- 本家の参照は読み取り専用のみ。git リモートとして登録する場合は push URL を `DISABLED-NO-PUSH-TO-UPSTREAM` に設定して誤 push を防ぐ。
- 変更の流れは一方向のみ: 本家 → このリポジトリ。
- **パッチ名（パッチ宣言の `name`）は絶対に翻訳しない。** Morphe のパッチャーはパッチを名前順に実行するため、名前を変えると実行順序が本家と変わり、本家で成功する構成でも失敗する（下記「既知の問題」で実証済み）。両側とも `name` は本家の英語名のまま保持し、日本語化は `description` とアプリ内 UI 文字列だけにする。本家が追加する新しいパッチも同様。

## 共通: 翻訳済みソースのコピーを保持

- 本家のソースツリーをコピーし、表示文字列を日本語化した状態で保持します（X 側は `sources/piko/`、Twitch 側は `sources/twitch/`、LINE 側は `sources/line/`、KakaoTalk 側は `sources/kakao/`）。コピー元の本家コミットは各コピーの記録ファイル（X 側: `sources/piko/UPSTREAM_BASE.md`、Twitch 側: `sources/twitch/CHANGELOG.md` の先頭、LINE 側: `sources/line/UPSTREAM_BASE.md`、KakaoTalk 側: `sources/kakao/UPSTREAM_BASE.md`）に残します。
- ビルド（`build_combined.py`）は、X 側のコピー（Piko ツリー）をビルドホストとして使い捨てディレクトリへコピーし、Twitch 側・LINE 側・KakaoTalk 側のコピーを注入して1つの `.mpp` をビルドします。ビルド時に本家をクローンすることはありません。また、パッチの追加・統合・改名などの「仕掛け」は一切しません。本家のパッチがそのまま、機能ごとに Morphe の一覧へ出ます。
- 本家のバージョンタグはこのリポジトリには取り込みません。このリポジトリのバージョニングは独立です（後述）。

## X 側（Piko / NewX）: sources/piko/

- 本家 `crimera/piko` の `x-lite` ブランチのツリーから、NewX 以外（Instagram／旧 Twitter 向けパッチと拡張）を取り除いたコピーを保持します（取り除いた範囲は `sources/piko/UPSTREAM_BASE.md` に記載）。
- 日本語化はコピーの中で完結します。
  - Piko 設定 UI の文字列: 本家には日本語リソースが無いため、`sources/piko/patches/src/main/resources/addresources/values-ja-rJP/newx/strings.xml`（全486件）を実ファイルとして保持します。
  - Morphe の一覧に表示されるパッチ説明: パッチ宣言（Kotlin ソース）の中の `description` を日本語に書き換えています（全52件）。`name` は本家の英語名のままです（絶対ルール。v1.2.0 では名前も日本語化していましたが、実行順序が変わって実機で失敗したため v1.2.1 で英語名に戻しました）。方針は `docs/LOCALIZATION.md`。
- 取り込み手順（本家 `x-lite` のみが対象）:
  1. 本家を読み取り専用で取得する（浅いクローン、または push URL を無効化したリモートからの fetch）。
  2. 本家の変更を `sources/piko/` へ反映する（差分適用／手作業マージ）。取り除いた範囲（Instagram／旧 Twitter 向け）は引き続き含めません。
  3. 日本語化はソース内の文字列を直接書き換えているため、本家が同じ行を変更すると競合します。競合したら本家の新しい英語文字列を確認し、日本語訳を付け直して解消します。翻訳行以外で解釈に迷う競合が出たら、取り込みを中止してユーザーに報告します。
  4. 本家に新しい表示文字列が増えたら翻訳して追加します（設定 UI の文字列は英語版 `values/newx/strings.xml` のキーと比較。パッチ説明は宣言を確認）。未訳のキーはビルドログに表示され、実行時は英語にフォールバックします。
  5. 本家がパッチを追加・削除・改名したら、`scripts/verify_bundle.py` の `EXPECTED_PATCHES`（アプリごとの本家英語名の一覧と、X の公開順 `EXPECTED_X_ORDER`）も合わせて更新します。新しいパッチは、名前は本家の英語名のまま、説明にのみ日本語訳を付けます（名前は絶対に翻訳しない）。
  6. `sources/piko/UPSTREAM_BASE.md` のベースコミットを更新します。コミットは規約型 `i18n` を使います。

## Twitch 側: sources/twitch/

- 本家には文字列リソースの仕組みが無くオーバーレイができないため、`sources/twitch/` に本家のソースツリー（パッチ定義・拡張機能・共有 API・スクリプト・設定）をコピーし、表示文字列を直接翻訳した状態で保持します（方式の詳細は `docs/LOCALIZATION.md` と `sources/twitch/docs/LOCALIZATION.md`）。
- 取り込み手順（本家 `main` のみが対象。本家の `dev` は参照だけにとどめ、こちらには作りません）:
  1. 本家を読み取り専用で取得する（例: `git remote add upstream-twitch https://github.com/ryykitty/twitch-patched.git` とし、push URL は無効化して `git fetch upstream-twitch`）。
  2. 本家の変更を `sources/twitch/` へ反映する（サブツリーへの差分適用／手作業マージ）。
  3. 日本語化はソース内の文字列を直接書き換えているため、本家が同じ行を変更すると競合します。競合したら本家の新しい英語文字列を確認し、日本語訳を付け直して解消します。翻訳行以外で解釈に迷う競合が出たら、取り込みを中止してユーザーに報告します。
  4. 翻訳済み文字列を検証するテスト（`sources/twitch/` 内の `UiFeatureRegistryTest`、`SettingsSearchTest`、`scripts/tests/`）の期待値も、日本語化に合わせて更新します。
  5. 本家がパッチを追加・削除・改名したら、`scripts/verify_bundle.py` の `EXPECTED_PATCHES` も合わせて更新します。新しいパッチは、名前は本家の英語名のまま、説明にのみ日本語訳を付けます（名前は絶対に翻訳しない）。
  6. 取り込みコミットには規約型 `i18n` を使います。
- 例外: Ayufa 独自パッチ「Ayufa: Startup tab」（v1.3.0 で追加）は本家に無い、こちら側のオリジナルです。実体は `sources/twitch/patches/.../twitch/startup/` と `sources/twitch/extensions/.../extension/startup/`、設定セクション `SettingSection.AYUFA`。本家の取り込みで削除したり、本家の流儀に寄せて改名したりしないでください。`EXPECTED_PATCHES` の Twitch 側に本家に無い名前が1件あるのは正常です。名前は恒久ルールどおり英語のまま（実行順序は名前で決まるため）、説明と UI は日本語、初期状態は未選択（default = false）です。
- このパッチのフックは、文字列 `default_home_page` を読んで既定のホームページ（フォロー／ライブ／クリップ）を返すメソッド（31.8.0 では難読化名 tnk.b）の戻り値です。起動時の遷移は常にこのメソッドからページを明示的に渡すため、v1.3.0 の方式（画面の引数が無い場合の既定値を差し替え）は実フローで発火せず、v1.3.1 で現行方式に改めました。本家の実験（default_home_page）が終了・変更されるとこのフックは合わなくなる可能性があります。その場合はパッチ側だけが適用失敗になるので、本家取り込みとは切り分けて報告してください。

## LINE 側: sources/line/

- 本家 [andrewliang25/morphe-patches](https://github.com/andrewliang25/morphe-patches) のソースツリー全体のコピーを保持します（ベースは v3.10.0、コミットは `sources/line/UPSTREAM_BASE.md` に記録）。本家には LINE 向けパッチ（32件）と Facebook 向けパッチ（20件）が同居していますが、**収録するのは LINE 向けだけ**です。Facebook 向けパッチはコピーには残し、ビルドへの注入時に除外します（注入範囲は `sources/line/UPSTREAM_BASE.md` に明記）。
- 本家にも文字列リソースの仕組みが無いため、Twitch 側と同じくコピー側で表示文字列を直接翻訳します。翻訳範囲は、パッチ宣言の `description`（LINE 全32件）と、拡張機能内の LINE 設定画面「Andrew's Patch Setting」の表示文字列（`extensions/extension/` の `LineSettingsScreen.java`）です。`name` は本家の英語名のまま（絶対ルール）。設定キーや機能IDなどの内部識別子は翻訳しません。詳細は `docs/LOCALIZATION.md`。
- 取り込み手順（本家のリリースタグ／`main` のみが対象）:
  1. 本家を読み取り専用で取得する（浅いクローン、または push URL を無効化したリモートからの fetch）。本家のバージョンタグはこのリポジトリには取り込みません。
  2. 本家の変更を `sources/line/` へ反映する（差分適用／手作業マージ）。コピーは本家のツリー全体を保持するので、Facebook 側の変更もコピーへは反映します（バンドルには入りません）。
  3. 日本語化はソース内の文字列を直接書き換えているため、本家が同じ行を変更すると競合します。競合したら本家の新しい英語文字列を確認し、日本語訳を付け直して解消します。翻訳行以外で解釈に迷う競合が出たら、取り込みを中止してユーザーに報告します。
  4. 本家に新しい表示文字列が増えたら翻訳して追加します（パッチ宣言の説明と、LINE 設定画面の表示文字列）。
  5. 本家が LINE パッチを追加・削除・改名したら、`scripts/verify_bundle.py` の `EXPECTED_PATCHES`（`jp.naver.line.android` の本家英語名一覧）も合わせて更新します。新しいパッチは、名前は本家の英語名のまま、説明にのみ日本語訳を付けます（名前は絶対に翻訳しない）。Facebook パッチの増減は `EXPECTED_PATCHES` に影響しません。
  6. `sources/line/UPSTREAM_BASE.md` のベースコミットを更新します。コミットは規約型 `i18n` を使います。
- 本家が LINE パッチの説明や設定 UI の公式な日本語訳を提供し始めたら、その時点でユーザーに知らせ、LINE 側の追従は停止します（「本家が公式に日本語対応した場合」参照）。

## KakaoTalk 側: sources/kakao/

- 本家 [AmpleReVanced/revanced-patches](https://github.com/AmpleReVanced/revanced-patches) のソースツリー全体のコピーを保持します（ベースは v1.5.0、コミットは `sources/kakao/UPSTREAM_BASE.md` に記録）。本家には KakaoTalk 向けパッチ（76件）のほかに DC Inside、AfreecaTV/SOOP、Naver ゲームコミュニティ、Onyx Note、Flexcil、Naver Map、Samsung Keyboard、Chzzk、StarNote 向けパッチが同居していますが、**収録するのは KakaoTalk 向けだけ**です。他アプリ向けパッチはコピーには残し、ビルドへの注入時に除外します（注入範囲は `sources/kakao/UPSTREAM_BASE.md` に明記）。
- 日本語化は X 側と同じ addresources 方式です。パッチ宣言の `description`（KakaoTalk 全76件）をコピー側で直接翻訳し、設定 UI の文字列は `sources/kakao/patches/src/main/resources/addresources/values-ja-rJP/kakaotalk/strings.xml`（全187件）を実ファイルとして追加します（本家には韓国語訳 `values-ko-rKR` のみ存在）。`name` は本家の英語名のまま（絶対ルール）。拡張モジュール内の表示文字列はすべて addresources 経由のため、拡張コード自体は翻訳しません。詳細は `docs/LOCALIZATION.md`。
- KakaoTalk パッチが依存する共有パッチ「Disable Sentry telemetry」（本家の `patches/shared/`、対象アプリを指定しない共通パッチで、KakaoTalk の「Disable Sentry」が依存）は、コンパイルに必要なため併せて注入します。本家の公開一覧にも含まれるパッチで、説明も日本語化しています。`scripts/verify_bundle.py` では `EXPECTED_UNIVERSAL_PATCHES` として区別して数えます。
- 取り込み手順（本家のリリースタグ／`main` のみが対象）:
  1. 本家を読み取り専用で取得する（浅いクローン、または push URL を無効化したリモートからの fetch）。本家のバージョンタグはこのリポジトリには取り込みません。
  2. 本家の変更を `sources/kakao/` へ反映する（差分適用／手作業マージ）。コピーは本家のツリー全体を保持するので、他アプリ側の変更もコピーへは反映します（バンドルには入りません）。
  3. 日本語化はソース内の文字列を直接書き換えているため、本家が同じ行を変更すると競合します。競合したら本家の新しい英語文字列を確認し、日本語訳を付け直して解消します。翻訳行以外で解釈に迷う競合が出たら、取り込みを中止してユーザーに報告します。
  4. 本家に新しい表示文字列が増えたら翻訳して追加します（パッチ宣言の説明と、英語版 `values/kakaotalk/strings.xml` のキーと比較した設定 UI の文字列）。
  5. 本家が KakaoTalk パッチを追加・削除・改名したら、`scripts/verify_bundle.py` の `EXPECTED_PATCHES`（`com.kakao.talk` の本家英語名一覧）も合わせて更新します。新しいパッチは、名前は本家の英語名のまま、説明にのみ日本語訳を付けます（名前は絶対に翻訳しない）。他アプリ向けパッチや、`patches/all/`・`patches/shared/` の増減のうち KakaoTalk が import していないものは `EXPECTED_PATCHES` に影響しません。KakaoTalk が新しく import するようになった共有ファイルがあれば、`build_combined.py` の `_KAKAO_SHARED_FILES` も合わせて更新します。
  6. `sources/kakao/UPSTREAM_BASE.md` のベースコミットを更新します。コミットは規約型 `i18n` を使います。
- 本家が KakaoTalk パッチの説明や設定 UI の公式な日本語訳を提供し始めたら、その時点でユーザーに知らせ、KakaoTalk 側の追従は停止します（「本家が公式に日本語対応した場合」参照）。

## v1.1.x の傘パッチ構成について（v1.2.0 で廃止）

v1.1.0〜v1.1.1 では、Morphe の一覧を「アプリごとに1パッチ」にするために、ビルド時に全機能パッチの名前を取り除いて依存専用化し、傘パッチ（旧 `umbrella/`）から一括で引く構成にしていました。しかしこの構成では、機能パッチが1つでも失敗すると傘全体が失敗し、残りの機能もろとも適用されませんでした。実際に、X 12.39.0-prod.01 で CanonicalUrls（正規URLを開く機能）が失敗し、NewX の全49機能が適用できない事態になりました。当初は本家側の未検証が原因と判断しましたが、後に本家の公式バンドルが同一端末・同一ビルドで成功することと、実行順序の違いが原因であることが判明しました（詳細は下記「既知の問題」）。

このため 2026-11-05 に本人が「クローン＋翻訳のみに戻す」と判断し、v1.2.0 で現在の方式（本家のパッチをそのまま個別収録）に戻しました。個別収録では、壊れたパッチはそのパッチだけが失敗し、Morphe で個別に外すこともできます。副作用として、v1.1.x の傘に含めていなかった4機能（NewX: クローン／Twitterブランディングに戻す／HLS音声レンディションのログ、Twitch: 再生の診断）は、通常の任意選択パッチ（本家の初期状態のまま）として戻っています。

なお CanonicalUrls の失敗は構成（実行順序）に起因するもので、本家のコード自体の非互換ではありませんでした。詳細は次の「既知の問題」を参照してください。

## 既知の問題: パッチ名の日本語化による実行順序の変化（X 12.39.0-prod.01 で観測）

2026-11-05 の実機確認（Galaxy SCG37 / Android 17、Morphe Manager 2.4.0）で判明した、こちら側の構成に起因する問題です。当初「本家側の未検証による非互換」と判断しましたが、その結論は誤りでした。以下が検証済みの事実です。

- 本家公式バンドル（crimera/piko-newx v3.73.0）は同一端末・同一ビルド（X 12.39.0-prod.01）で成功します（本人が実機確認）。そのリリースの `patches-bundle.json` には `piko_commit: 340dd024aa889a5e116550039eafceeb45a85107` と記録されており、私たちの `sources/piko/` のベースと完全一致します。つまりパッチのコードは本家と同一で、差分は「名前の日本語化」「values-ja リソース」「ビルド構成」だけです。
- Morphe パッチャー 2.2.0 は、トップレベルのパッチを **パッチ名（name）の文字列順** に実行します（`Patcher.kt:162`: `context.executablePatches.sortedBy { it.name }`。依存パッチは各パッチの直前に宣言順で再帰実行）。パッチ名を英語（`NewX: ...`）から日本語に変えると、Unicode のコードポイント順になるため、実行順序が本家と完全に入れ替わります。

実証できた失敗機構（「メディアタブのデフォルト」、v1.2.0 で観測、`found 2`）:

- 「プロフィールのポストのデフォルト並び順」（DefaultProfilePostSortingPatch）と「メディアタブのデフォルト」（DefaultMediaTabPatch）は、**同じ**組み合わせプロフィールタイムライン・コンポーネント（`Lcom/x/profile/timeline/` 実装クラス）のコンストラクタを対象にします。
- 並び順パッチは、`Boolean.FALSE` の直後に続く Flow 種（並び順の状態）の直前に invoke + move-result の2命令を挿入します。
- メディアタブ側の種の判別（`isInitialSubTabSeed`）は「直前の命令が `Boolean.FALSE` の sget でない Flow 種」という条件です。並び順パッチが先に実行されると、並び順の種の直前が挿入命令に変わり、判別をすり抜けて候補が2件になり、`requireExactlyOne`（DefaultMediaTabPatch.kt:184）が失敗します。
- 本家の英語名順では "Set default media tab"（m）が "Set default profile post sorting"（p）より前に来るため安全です。日本語名順では「プロフィールの…」（プ、U+30D7）が「メディアタブの…」（メ、U+30E1）より前に来て逆転します。

もう1件（「正規URLを直接開く」の `URL picker capability shape, found 0`）は、廃止済みの v1.1.x 傘構成（dependsOn 台帳順＝本家とも日本語名順とも異なる順序）でのみ観測され、英語名順（本家）でも日本語名順（v1.2.0）でも成功しています。傘構成で先行した3パッチは対象クラスに触れておらず、コードレベルの機構は特定できていません。ただし「本家の順序から外れた構成でのみ失敗した」という事実関係は上記と整合します。

リスク範囲（実行順序が本家と異なる場合に限る）: 一覧52件中35件が自ファイル内で `requireExactlyOne` / `requireAtMostOne`（候補がちょうど1件でなければ失敗する本家の共通ヘルパー）を呼び、6件が共有 resolver 経由で依存します。これらは「本家の順序で実行される限り本家と同じく成功する」もので、順序が変わると上記のような相互作用で失敗し得ます。`.single()` のみを使う5件（カスタムフォント等）も同種です。Twitch 側は同ヘルパーを使用していません。

修正（v1.2.1 で実施済み）: 本人の指示で、両アプリともパッチ名を本家の英語名に戻し、説明文のみ日本語を維持しました。これで実行順序が本家と完全一致し、本家で成功する構成をそのまま再現できます。日本語名の維持は順序の再現と両立しないため、パッチ名を翻訳しないことは恒久ルールになりました（「絶対ルール」参照）。Twitch 側は厳密照合ヘルパーを使っていませんが、同じ理由で名前は英語名に統一しています。

## ビルド時の適応（使い捨てツリー内のみ）

統合ビルドでは、本家 Piko のビルドツリー（Morphe Gradle プラグイン 1.3.4 系）へ Twitch 側を注入するため、次の小さな適応をビルドのたびに使い捨てツリー内で行います。保持しているソース自体は変更しません。

- ビルドツリーへコピーした X 側の `patches-list.json`（本家自身の古いもの）を削除する（このビルドで生成した一覧だけを成果物にするため）。
- 生成された `patches-list.json` の X 分の並びを、本家 piko-newx の公開リストの順序に並べ替える（Morphe Gradle プラグインは名前順で出力するため、そのままだと公開アセットの並びが本家と異なる。パッチャーは実行時に名前順でソートするので動作には無関係で、見た目を本家に合わせるだけの適応。並べ替えは `build_combined.py` の `reorder_patches_list`）。
- `extensions/twitch/build.gradle.kts` から、プラグイン 2.0.0 系の `extension { name = ... }` ブロックを取り除く（1.3.4 系はモジュールパスから同じ名前 `extensions/twitch.mpe` を導出するため）。
- LINE 側も同様に、`extensions/extension/build.gradle.kts` から `extension { name = ... }` ブロックを取り除く（モジュールパスから同じ名前 `extensions/extension.mpe` を導出するため）。LINE 側で注入するのは `patches/.../patches/line/` と `.../patches/shared/` と `extensions/extension/` だけで、Facebook パッチ（`patches/.../patches/facebook/`）と本家のリリース用ツール（`patches/src/main/kotlin/util/`、本家自身の `generatePatchesList` 用）は注入しません。
- `extensions/proguard-rules.pro` に `-keep class dev.twitchpatches.**` と `-keep class app.andrewliang.**` を追加する（本家の keep 対象は `app.morphe.**` 等のみで、Twitch 拡張と LINE 拡張のクラス名参照を守るため）。KakaoTalk 拡張（`app.revanced.extension.kakaotalk.**`）は本家の keep 対象 `app.revanced.**` に含まれるため追加は不要。
- KakaoTalk 側の注入に伴う適応（いずれもビルドツリー内のみ。詳細は `build_combined.py` の `inject_kakao_sources` と各適応関数のコメント）:
  - KakaoTalk パッチが import する `patches/shared/`・`patches/all/` のファイル6件だけを注入する（`_KAKAO_SHARED_FILES`）。本家が同梱する `app/morphe/patches/**` のライブラリソースは注入せず、ホスト側の Morphe ライブラリで代替する（X 側と同じ解決方法）。
  - `kakaotalk/shared/Resources.kt` のロケール一覧に `AppLocale("ja-rJP", "ja")` を追加する。本家は対象ロケールを既定＋韓国語に絞っているため、そのままだと日本語リソースがアプリへマージされない。
  - `extensions/kakaotalk/build.gradle.kts` に namespace（`app.revanced.extension.kakaotalk`）を明記し、`compileOnly(libs.morphe.extensions.library)` を追加する（本家では共有ライブラリの `api` 公開で見えていたものが、ホストの共有ライブラリでは `implementation` のため）。
  - 本家の共有ライブラリがソースで持つ Morphe 設定 UI クラス（`app.morphe.extension.shared.settings.preference.*`、11ファイル）を、ビルドツリーの `extensions/shared/library` の同じパッケージへ追加する（ホストの共有ライブラリには無く、KakaoTalk 拡張のコンパイルに必要。本家と同じく `extensions/shared.mpe` に dex される）。
  - ビルドツリーの `gradle/libs.versions.toml` に、KakaoTalk 拡張が必要なカタログ別名（okhttp、retrofit、netty-all、hiddenapibypass、exifinterface）を本家のバージョン・座標で追加する。
  - `settings` リソースルートからは DC Inside 用の2ファイルを除く（KakaoTalk のパッチは参照しない）。
- `patches/build.gradle.kts` の `about` ブロック（バンドル名・説明・配布元・作者・ライセンス）を、このプロジェクトの値に書き換える。
- バージョンは `gradle.properties` の `version` を、このリポジトリのリリースバージョンに設定する。

## リリースとバージョニング

- バージョニングは **このバンドル独自のセマンティックバージョニング**（`vX.Y.Z`）で、上流のバージョンとは連動しません。初回は v1.0.0 です。
  - 上流のどちらかの更新取り込みや翻訳の追加・修正: 内容に応じて patch / minor を上げます。
  - 収録パッチの大きな追加・削除や対応アプリの変更: minor（互換性が壊れる場合は major）を上げます。
- リリース手順:
  1. バージョンを決め、`main` の対象コミットにタグ `vX.Y.Z` を付けて push します（または Actions の Release ワークフローを手動実行し、`publish_release` を有効にします）。
  2. CI が `build_combined.py` で単一バンドルをビルドし、`scripts/verify_bundle.py` で4パッチセットの収録と日本語化を検証してから、GitHub Release に `patches-<X.Y.Z>.mpp` と `patches-list.json` を公開します。`patches-list.json` が生成されなかった場合は CI が失敗し、リリースされません。
  3. CI が `patches-bundle.json`（最新リリースのメタデータ）を `main` にコミットします。
- リリースノートには今回の変更内容（特に不具合修正と、上流取り込み・翻訳の追加分）を記載します。

## 本家が公式に日本語対応した場合

- どちらかの本家が対象部分の公式な日本語訳を提供し始めたら、その側の日本語化は役目を終えます。その時点でユーザーに知らせ、その側の追従方法の見直し（コピーの廃止）を検討します。
