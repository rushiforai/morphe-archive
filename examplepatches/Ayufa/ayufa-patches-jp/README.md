# ayufa-patches-jp（Ayufa Patches JP）
  <a href="https://morphe.software/add-source?github=Ayufa/ayufa-patches-jp">
    <img src="assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
  </a>
</p>

# ayufa-patches-jp（Ayufa Patches JP）

X（旧Twitter）と Twitch、LINE、KakaoTalk の [Morphe](https://morphe.software/) パッチを **1つのパッチバンドル（`.mpp`）にまとめた、非公式の日本語化バンドル** です。

もとは別々に公開していた2つの日本語化プロジェクトを統合したもので、v1.4.0 で LINE を、v1.5.0 で KakaoTalk を追加しました。いずれも、本家プロジェクトをクローンして言語だけを日本語にした、翻訳済みソースのコピーを同梱しています。

| 対象アプリ | パッチの出どころ | 日本語化の方式 |
| --- | --- | --- |
| X（`com.twitter.android`） | [crimera/piko](https://github.com/crimera/piko) の `x-lite` ブランチ（NewX） | 翻訳済みソースのコピー（`sources/piko/`）。設定UIの日本語リソース追加＋パッチ説明の翻訳（パッチ名は本家の英語名のまま） |
| Twitch（`tv.twitch.android.app`） | [ryykitty/twitch-patched](https://github.com/ryykitty/twitch-patched) | 翻訳済みソースのコピー（`sources/twitch/`）。ソース内の表示文字列を直接翻訳（パッチ名は本家の英語名のまま） |
| LINE（`jp.naver.line.android`） | [andrewliang25/morphe-patches](https://github.com/andrewliang25/morphe-patches) | 翻訳済みソースのコピー（`sources/line/`）。ソース内の表示文字列を直接翻訳（パッチ名は本家の英語名のまま）。同じ本家の Facebook 向けパッチは収録しません |
| KakaoTalk（`com.kakao.talk`） | [AmpleReVanced/revanced-patches](https://github.com/AmpleReVanced/revanced-patches)（GPL-3.0） | 翻訳済みソースのコピー（`sources/kakao/`）。設定UIの日本語リソース追加＋パッチ説明の翻訳（パッチ名は本家の英語名のまま）。同じ本家の他アプリ向けパッチは収録しません |

パッチ本体の機能は各本家そのままです。本家へプルリクエストや Issue などの書き込みは一切しません（取り込みは読み取り専用の一方向のみ。詳しくは [docs/UPSTREAM.md](docs/UPSTREAM.md)）。

## 収録パッチ

Morphe のパッチ一覧には、本家のパッチが機能ごとに表示されます（X 52件・Twitch 13件＋Ayufa独自1件・LINE 32件・KakaoTalk 76件）。使いたい機能を選んで適用でき、適用後の細かいオン・オフはアプリ内設定画面（X は NewX 設定、Twitch は「パッチ設定」、LINE は「Andrew's Patch Setting」、KakaoTalk は「Morphe設定」）でも切り替えられます。

- **X（NewX）** — 広告除去、ダウンロード解放、タイムライン／プロフィールのカスタマイズなど、本家 x-lite のパッチ全52件。パッチの説明は日本語です（パッチ名は本家の英語名のまま。後述）。対応 X バージョンは本家 x-lite の指定どおりです。
- **Twitch** — BTTV、FFZ、7TVのエモート／お気に入りエモート／配信を再読み込み／削除されたメッセージを表示／UI設定／広告ブロック（配信中・クライアント要求・フィード）／Turboプロモーションとサブスク割引バナーの非表示／ボーナスチャンネルポイント自動受け取り／Twitch APKを検査など、本家のパッチ全13件。対応 Twitch は 31.8.0（安定版）と 31.9.0_BETA（実験的対応）です。
- **LINE** — タブやボタンの非表示、広告の非表示、送信取消しされたメッセージの保持、トークを未読のままにする、カスタムフォント、再署名ビルド向けの修正（プッシュ通知・地図・生体認証ログイン・トーク履歴バックアップ）など、本家 morphe-patches の LINE パッチ全32件。パッチの説明は日本語です（パッチ名は本家の英語名のまま。後述）。対応 LINE は 26.14.0 / 26.15.1 / 26.16.0 です。同じ本家の Facebook 向けパッチは収録していません。
- **KakaoTalk** — 広告の除去、タブの非表示、削除・非表示・編集されたメッセージの表示、既読確認の表示、ゴーストモード、各種の整合性チェック回避など、本家 revanced-patches の KakaoTalk パッチ全76件。パッチの説明と設定 UI は日本語です（パッチ名は本家の英語名のまま。後述）。対応 KakaoTalk は 26.9.0 です。同じ本家の他アプリ（DC Inside、SOOP など）向けパッチは収録していません。

Morphe Patcher 2.0.0 以上が必要です。再署名したアプリでは Google Play の課金は使えません。

## 使い方

1. 上のボタンから Morphe にこのリポジトリをパッチソースとして追加します。
2. 対応バージョンの X、Twitch、LINE または KakaoTalk 公式APKを選び、使いたいパッチを選択して適用・インストールします。

[Releases](https://github.com/Ayufa/ayufa-patches-jp/releases) に `.mpp` パッチバンドル（`patches-<バージョン>.mpp`）と `patches-list.json`（収録パッチ一覧）が含まれます。端末／アプリの言語が日本語の場合に、日本語化した部分が日本語で表示されます。

## 仕組み

ビルド（`build_combined.py`、GitHub Actions で実行）は次の流れです。本家をビルド時にクローンすることはなく、パッチを統合・改変する仕掛けもありません。

1. このリポジトリに保持する X 側の翻訳済みソース（`sources/piko/`、本家 Piko のツリーがビルドホストを兼ねます）を使い捨てのビルドツリーへコピーします。
2. Twitch 側の翻訳済みソース（`sources/twitch/`）を、パッチ定義・拡張機能・リソースごとビルドツリーへ注入します。
3. LINE 側の翻訳済みソース（`sources/line/`）から、LINE のパッチ定義と拡張機能だけをビルドツリーへ注入します（Facebook 向けパッチは注入しません）。
4. KakaoTalk 側の翻訳済みソース（`sources/kakao/`）から、KakaoTalk のパッチ定義・リソース・拡張機能だけをビルドツリーへ注入します（他アプリ向けパッチは注入しません）。
5. バンドル情報（名前・説明・配布元）をこのプロジェクトのものに書き換え、バージョンを設定して、1つの `.mpp` としてビルドします。

なお v1.1.x では、Morphe の一覧を「アプリごとに1パッチ」にまとめる傘パッチ構成を採用していましたが、内包する機能が1つでも失敗すると全体が適用されなくなる問題があったため、v1.2.0 でこの方式に戻しました。経緯は [docs/UPSTREAM.md](docs/UPSTREAM.md) にあります。

ビルド時の小さな適応（プラグイン世代差の吸収など）の内容は [docs/UPSTREAM.md](docs/UPSTREAM.md) に明記しています。

## 翻訳の範囲

- ✅ Piko設定UI（`values/newx/strings.xml` 全486件）
- ✅ Morphe の一覧に表示されるパッチの説明（X 全52件／Twitch 全13件／LINE 全32件／KakaoTalk 全76件とも日本語）
- ✅ Twitch のパッチ設定画面のUI文字列、React Native 側の表示文字列
- ✅ LINE の設定画面「Andrew's Patch Setting」のUI文字列
- ✅ KakaoTalk の設定UI（`values/kakaotalk/strings.xml` 全187件）
- ⬜ パッチ名（タイトル）: 本家の英語名のまま。Morphe のパッチャーはパッチを名前順に実行するため、名前を翻訳すると実行順序が本家と変わってしまいます。そのため名前は絶対に翻訳しません（恒久ルール。経緯は [docs/UPSTREAM.md](docs/UPSTREAM.md) の「既知の問題」）
- ⬜ X 側のパッチのオプション（パッチ定義に埋め込まれたラベル・説明。英語のまま）
- ⬜ 拡張機能コード内に直書きされた一部のトースト文字列（英語のまま）
- 英語のままにするもの: 設定キーなどの内部識別子、ブランド名・プロバイダー名、内部エラーやログの文字列

詳しくは [docs/LOCALIZATION.md](docs/LOCALIZATION.md) を参照してください。

## バージョン方針

このバンドルは **独自のセマンティックバージョニング**（タグ `vX.Y.Z`）で管理し、上流（Piko／twitch-patched／morphe-patches）のバージョンとは連動しません。初回は v1.0.0 です。上流の更新を取り込んだら内容に応じてバージョンを上げてリリースします。手順と方針は [docs/UPSTREAM.md](docs/UPSTREAM.md) にあります。

## 本家への配慮

- 本家リポジトリ（crimera/piko、crimera/piko-newx、ryykitty/twitch-patched、andrewliang25/morphe-patches、AmpleReVanced/revanced-patches）への書き込みは一切しません。本家は読み取り専用（fetch／clone のみ）で参照します。
- クレジットとライセンスは本家に従います（GPL-3.0。本家の NOTICE にある Morphe の名称制限もそのまま保持しています）。

## ライセンス

[GPL-3.0](LICENSE)。本家および上流プロジェクトの帰属表示は [NOTICE](NOTICE) と `sources/` 内の各ファイルに保持しています。このプロジェクトは X、Twitch、LINE、KakaoTalk、Morphe の各プロジェクトとは無関係です。

# Credits

- [crimera](https://github.com/crimera) - Piko / piko-newx 本家
- [ryykitty](https://github.com/ryykitty) - twitch-patched 本家
- [andrewliang25](https://github.com/andrewliang25) - morphe-patches（LINE パッチ）本家
- [AmpleReVanced](https://github.com/AmpleReVanced) - revanced-patches（KakaoTalk パッチ）本家
- [morphe](https://github.com/MorpheApp) - patcher
- [revanced](https://github.com/ReVanced) - previous patcher
