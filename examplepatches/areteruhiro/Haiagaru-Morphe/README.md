
◆8LNH56sLs6 
# Haiagaru for Morphe

ChMate `0.8.10.191 dev` / `0.8.10.226 dev` / `0.8.10.242 dev` 対応のMorpheパッチです。 <br>

**0.8.10.241／0.8.10.243 devは対応対象外です。** 191 dev／226 dev／242 devをご利用ください。

ChMateに追加設定・閲覧・メディア・バックアップ機能を組み込むパッチです。
従来の機能紹介は [Haiagaru](https://github.com/areteruhiro/Haiagaru) も参照してください。

最新正式版: [1.11.2](https://github.com/areteruhiro/Haiagaru-Morphe/releases/latest) ／ [変更内容・更新手順・確認範囲](docs/release-1.11.2.md)

次期プレ版の公開前検証中: [初回最低限構成・.haiagaru設定共有・履歴から走査再開](docs/settings-sharing-history-resume.md)、
[検索・フィルター改善](docs/search-filter-2026-10-20.md)、
[過去ログ文字倍率・折りたたみ端末判定](docs/archive-scale-fold-fix.md)。
ローカル実装の案内であり、公開済みを意味しません。

更新前にバックアップしてください。**[正式版1.7.1からの変更](docs/release-1.9.0-from-1.7.1.md)** ／ **[プレ版1.8.15からの差分・操作案内](docs/release-1.9.0.md)**。versionCode最大化が初期有効です。

更新履歴: [CHANGELOG.md](CHANGELOG.md)  
操作案内: [使い方.md](使い方.md)

## よくある質問・困ったとき

**[よくある質問（FAQ）はこちら](docs/faq.md)**

Cookieエラー、ワッチョイ検索、画像一覧、高度なNGなどを案内しています。
導入時の問題は[インストールできない場合](#インストールできない場合)、不具合の報告・相談は[サポート](#サポート)をご覧ください。

## 主な機能

* Remove ads (including margins)
* 画像キャッシュサイズを最大256GBまで選択（4／8／16／32／64／128／256GBを追加、現在の設定は維持）。[詳細](docs/image-cache-size.md)
* 画像を含むHTTP通信のHTTPS切り替え（Haiagaru設定でON/OFF、初期値OFF）
* Remove MonaKey
* GitHubから更新できるDAT落ちスレ用検索プリセット
* 自動DAT取得経路の並べ替えと任意HTTPS経路の追加
* SS速報VIPの過去ログdat取得と、DAT経路変数の部分取り出し（`{$key:0:4}` など）。191／226／242 dev対応。[設定・書式](docs/dat-routes.md)
* 自動DAT取得のON/OFF切り替え
* 古いDAT・過去ログの改行保持と`.io` URL直接起動時の自動DAT取得
* Talkの現行・旧形式板URLからの板一覧／スレ取得と書き込み互換処理
* モバイル回線固定時の投稿で失効したNetwork IDを再利用しない接続更新（Haiagaru設定でON/OFF、初期値ON）
* ChMate `0.8.10.191 dev`／`0.8.10.226 dev` のスレ内広告行の非表示
* 5ch.io板が外部板扱いと5ch扱いで重複した場合の内部板一覧一括整理
* パッケージ名・アプリ名・アイコン・versionCodeの変更
* クラッシュログ保存（Morpheで無効化可能、初期値ON）
* レス本文の直接選択・コピー: 本文長押しで一部を選択し、Android標準メニューからコピーできます。Haiagaru設定、またはスレ内ツールバー設定に追加した「長押しコピー」でオン／オフ可能（初期オフ）。191／226／242 dev対応。[使い方](docs/direct-body-selection.md)
* 画像／動画のアップロード先切り替え: Imgur、画像専用imgbox（10MB）、imgpile（API不要100MB／API方式97MB）、動画専用Sendvidを選択可能。標準添付の成功結果を本文へ挿入し標準履歴へ記録します。imgbox／imgpileの保存済み管理情報から選択・確認付きの一括削除も追加。権限・画像単位のフォーム・成功応答を確認できない場合は停止します。手動Web画面は別操作です（開発中・実送信／実削除成功は未確認）。[使い方・制限](docs/upload-hosts.md)
* 専用ビュワーの追加　<オフに出来ないとの報告があります>
* 動画専用ビューアの左右上下スワイプ（明るさ／音量）・左右ダブルタップの相対シーク設定、およびYouTube公式プレーヤーのアプリ内表示。[操作と制限](docs/video-viewer-controls.md)
* エッヂ過去ログビューアーで開けない場合はエラーコードを表示し、`Download/Haiagaru` に診断ログを保存
* ChMate `0.8.10.191 dev`／`0.8.10.226 dev` のChMate+互換設定
  * 単発ID表示を省略
  * [コピペ省略2](docs/chmate-plus-compat.md)（変更後に再起動して反映。標準の判定条件を使用）
  * 荒らし省略
* エッヂ板でスレタイ末尾に記者IDを表示（初期値ON、Haiagaru設定から切り替え）
* 端末内JavaScriptで複雑なNG条件を作れる「高度なNGルール」
* [5chのIDなしレスを非表示](docs/hidden-id-ng.md)（初期オフ、ID付きレスのあるスレ内のみ。191／226／242 dev）
* NGワード・NG ID・NG名前などの登録上限をHaiagaru設定から変更（0で無制限、191 dev／226 dev／242 dev共通）

## 最近の追加機能

[最近の追加機能・版別の説明](docs/recent-features.md)にまとめています。最新の操作方法は[使い方](使い方.md)、全変更履歴は[CHANGELOG](CHANGELOG.md)をご覧ください。

## 機能別ドキュメント

- [ID検索と専用ビュワー](docs/id-search-viewer.md)
- [エッヂの記者ID表示](docs/edge-reporter-id.md)
- [HTTP通信のHTTPS切り替え](docs/https-switching.md)
- [MEGAバックアップ](docs/mega-backup.md)
- [ChMate+互換機能](docs/chmate-plus-compat.md)
- [高度なNGルール](docs/advanced-ng.md)
- [本文の文字列置換（外部TXT）](docs/replace-str.md)
- [Haiagaru設定のカテゴリ・検索](docs/settings-organization.md)
- [巡回時の画像自動保存・フィルタリング](docs/patrol-images.md)
- [自作テーマの取り込み](docs/custom-theme-import.md)
- [画像キャッシュサイズ](docs/image-cache-size.md)
- [標準画像アップロード履歴・一括削除](docs/native-upload-history.md)
- [動画ビューアの操作](docs/video-viewer-controls.md)
- [X／Twitter本文プレビュー](docs/x-post-preview.md)
- [スレ立てコマンド](docs/thread-commands.md)
- [ワッチョイ下4桁検索](docs/wacchoi-suffix-search.md)
- [非表示NGメニューの表示設定](docs/hidden-ng-menu.md)
- [エッヂ過去ログ検索の表示調整](docs/edge-archive-display.md)
- [レス単位アーカイブ](docs/response-archive.md)
- [191 devの通信改善・検証範囲](docs/chmate191-update-performance.md)
- [外部板の認証ページ](docs/external-board-auth.md)
- [登録した外部板の名前・URL編集](docs/external-board-editor.md)
- Cookieエラー、ワッチョイ検索、画像一覧、高度なNGワードについては [よくある質問](docs/faq.md) を参照してください。


### DAT落ちスレの自動取得

DAT落ちスレ用プリセットは、通常閲覧時ではなく設定画面の更新ボタンを押した時だけ、
[`presets/chmate-dat-fallen-search-urls.txt`](presets/chmate-dat-fallen-search-urls.txt) を取得します。
GitHubへ接続できない場合は、基本3経路を収録した内蔵プリセットを使用します。
2ch.scの板一覧参照先は [`https://menu.2ch.sc/bbsmenu.html`](https://menu.2ch.sc/bbsmenu.html) です。

Haiagaru設定の「自動DAT取得経路」は、上の行から順に試行します。
初期状態では、元スレと同じサーバーの `5ch.io` DAT、`kako.5ch.io`、
`itest.5ch.io`、同じサーバーの `2ch.sc` DATの順です。
行を並べ替えると優先順を変更でき、1行追加すると任意のHTTPS経路も追加できます。

各行は `auto|`、`dat|`、`kako|`、`itest|` のいずれかにURLを続けます。
URLでは `{$server}`、`{$bbs}`、`{$key}`、`{$rand}` を使用できます。
空行と `#` で始まる行は無視され、無効な設定しかない場合は初期経路へ戻ります。

## 既知の不具合


### スレ内の検索長押しで「URLを開けるアプリがありません」と表示される場合

Androidの「標準アプリとして設定」から、以下の項目をOFFにしてください。

- `itest.5ch.io`
- `*.5ch.io`

この設定をOFFにすると、書き込みボタンを長押しした際に外部ブラウザで開けるようになります。

設定例: https://i.imgur.com/lmYxXZD.jpeg

なお、「標準アプリとして設定」内の項目をOFFにしても、Haiagaru内で `*.5ch.io` のURLを開いた場合は、Haiagaru内で正常に開かれます。

情報提供: (ﾜｯﾁｮｲ 0de3-uUZJ)

## インストールできない場合

### パッチ適用時にエラーが発生して適用できない

Morpheでパッチを適用しようとした際にエラーが発生する場合は、Morphe右下の設定から以下のように変更してください。

`Morphe右下 → 別プロセスで実行 → 1024MB`

設定変更後、もう一度パッチ適用をお試しください。

以前のChMateをアプリデータを残してアンインストールした場合など、既存のパッケージとの競合が表示されることがあります。まずパッケージ名・署名の違いを確認してください。データを消す操作は最終手段です（過去の241での報告。現在241は対応対象外）。

1. ChMateの設定や必要なデータをバックアップします。
2. 以前のChMateを、アプリデータも含めて完全にアンインストールします。
3. パッチ済みAPKをインストールします。
4. 必要に応じて、手順1のバックアップからデータを復元します。

アプリデータを削除すると、バックアップしていない設定や履歴は失われます。必ずアンインストール前にバックアップを確認してください。

初期状態で有効なパッチ `Change ChMate package name` では、別アプリとしてインストールするための
パッケージ名に加えて、アプリ名、PNG/WebPアイコン、versionCodeを設定できます。
アイコン・versionCodeを未指定にした項目は元の値を保持します。

標準設定ではShizukuを組み込みません。旧ChMateの共有データをShizukuでコピーする場合だけ、
任意パッチ `Migrate ChMate data with Shizuku` を追加で有効にしてください。
この任意パッチを有効にしたAPKはAndroid 7.0（API 24）以降が必要です。
データ移行にはchmate本来のバックアップ/復元を推奨しています。

備考: パッケージ名の変更により予期せぬエラーが発生する可能性がありますが、
既存のChMateとは別アプリとして扱われるため、インストール時の競合エラーを抑えられます。

任意パッチ `Save ChMate crash logs` を有効にすると、未処理例外でクラッシュした際に
`Download/Haiagaru/` へログを保存します。投稿本文、Cookieなどのアプリデータは記録しません。

情報提供: あかまつさん

## URV Manager / Morphe Managerへの追加と更新

### Morpheへリポジトリとして追加

Morpheのパッチソースには、次のGitHubリポジトリURLをそのまま登録できます。

```text
https://github.com/areteruhiro/Haiagaru-Morphe/
```

[MorpheへHaiagaruを追加](https://morphe.software/add-source?github=areteruhiro/Haiagaru-Morphe&name=Haiagaru)

通常版は`master/patches-bundle.json`、プレリリースは`dev/patches-bundle.json`から取得します。
配布物はAndroid拡張を内包したMPPです。リリースと生成メタデータはMorphe公式テンプレート準拠のSemantic Release CIで更新します。

正式版を取得するパッチソースです。

```text
https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/master/patches-bundle.json
```

プレリリースを有効にしたリポジトリソースは、`dev`ブランチのメタデータを取得します。

```text
https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/dev/patches-bundle.json
```

正式版は`master`、プレリリースは`dev`のSemantic Releaseが更新します。生成されるJSONやCHANGELOGを手作業で編集・公開しないでください。更新が表示されない場合はパッチソース画面から再読み込みしてください。GitHubの配信キャッシュにより反映に数分かかる場合があります。
変更履歴で「このリリースは空です」と出る場合は、Morphe Managerも最新版へ更新してください。

## 更新履歴

各バージョンの変更内容は [CHANGELOG.md](CHANGELOG.md) を参照してください。

## 対象

- パッケージ: `jp.co.airfront.android.a2chMate`
- バージョン: `0.8.10.191 dev`（versionCode 459、minSdk 21）
- バージョン: `0.8.10.226 dev`（versionCode 494、minSdk 23）
- バージョン: `0.8.10.242 dev`（versionCode 512、minSdk 23）
- 元APKの署名 SHA-256:
  `7dd84d97df4666fbc8188b8d6167ce59314636997f0edae82d685fffda4059d2`

## ビルド

```powershell
.\gradlew.bat :patches:buildAndroid --no-daemon --max-workers=1
```

生成物:

```text
patches\build\libs\patches-1.8.9.mpp
```

公開には`:patches:buildAndroid`で生成したMPPを使用し、`classes.dex`が含まれることを確認してください。

191 devの自動NG画像判定でTFLiteがクラッシュする場合は、パッチ適用時の
「191の自動NG画像判定クラッシュを修正」（`imageNgTfliteFix`）を有効にしてください。
既定では有効です。`false`を指定すると元APKのTFLiteライブラリを維持します。
このオプションは191 dev以外には影響しません。

Morphe Desktopでは `Haiagaru` を有効にして対象APKへ適用します。
APKは再署名されるため、Play版など署名が異なるChMateとはそのまま上書きできません。

## サポート
何かあればGitHubのIssueか
以下のサーバーで対応させていただきます。
お気軽にご質問等お願いします。
~~＊開発者自身がchmateを開かないため~~

[Haiagaru サポートチャンネル](https://discord.gg/ypTzS4VWaz)

## 寄付

開発の継続を応援していただける場合は、よろしければGitHubのStarだけでもお願いします。励みになります。
さらにご支援いただける場合は、以下から寄付を受け付けています。

- [Amazon Gift Card](https://www.amazon.co.jp/gp/product/B004N3APGO) Send to (areteruhiro@gmail.com)
- [PayPay](https://qr.paypay.ne.jp/p2p01_FSEj08sDQx0enogO)

### 謝辞
yujirox 様 <br>
ﾜｯﾁｮｲ 8f01-uDul 様 <br>
toya0717 様<br>
MUMEI 様<br>
タケヨシキ様<br>
無名 様<br>
ご支援ありがとうございます。

皆様からのご報告・検証・ご支援が開発の励みになっています。

## 構成

- `patches/src/main/kotlin/app/morphe/patches/chmate/HaiagaruPatch.kt`
  - 対象メソッドの特定とバイトコードパッチ
- `extensions/chmate/`
  - ChMate内で動く設定UIと移植機能

ベースのビルドシステムとパッチ形式は
[Morphe patches](https://github.com/MorpheApp/morphe-patches) を使用しています。


## Credit

Original Tsubonofuta is developed by AioiLight. \
https://github.com/AioiLight/Tsubonofuta

Forked from Tsubonofuta (Modify), developed by nonnonstop. \
https://github.com/nonnonstop/Tsubonofuta

Forked from Binnosoko
https://github.com/Chipppppppppp/Binnosoko

Contribution <br>

LEINs Contribution<br>
LEINsに対して寄付/ご購入してくださった皆様

<br>
フォークされる方へ
<br>
必須ではありませんが、このリポジトリのURLを貼ってくれると嬉しいです
