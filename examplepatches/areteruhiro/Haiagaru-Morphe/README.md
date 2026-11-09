掲示板での問い合わせは以下のみです。

◆2ofgBR.b9E <br>
ChMate用Morpheパッチ「Haiagaru」 Part 1
https://jbbs.shitaraba.net/computer/45040/ <br> 

# Haiagaru for Morphe

ChMateに設定・閲覧・検索・NG・バックアップ機能を追加するMorpheパッチです。
対応する元APKは **0.8.10.191 dev／0.8.10.226 dev／0.8.10.242 dev** です。0.8.10.241と0.8.10.243 devは対応対象外です。

**[最新の正式リリースと配布ファイル](https://github.com/areteruhiro/Haiagaru-Morphe/releases/latest)** ／ [変更履歴](CHANGELOG.md) ／ [使い方](使い方.md) ／ [FAQ](docs/faq.md)

このREADMEは現在のソースに対応します。公開済みの内容は上のリリース説明で確認してください。開発ブランチの変更が公開前の場合もあります。従来の機能紹介は[Haiagaru](https://github.com/areteruhiro/Haiagaru)も参照できます。

## 導入と更新

1. 更新前にChMateの設定・必要なログをバックアップします。`.haiagaru`の設定共有ファイルだけでは、スレ本文や全履歴のバックアップにはなりません。
2. Morpheへ[Haiagaruのパッチソースを追加](https://morphe.software/add-source?github=areteruhiro/Haiagaru-Morphe&name=Haiagaru)します。
3. 対応する元APKを選び、`Haiagaru`を適用します。動画専用ビューア、MEGA、パッケージ名変更などの任意パッチは用途に合わせて選択します。
4. 作成したAPKをインストールします。上書き更新では、既存アプリと**パッケージ名・署名鍵をそろえてください**。
5. ChMateの設定を開き、**「セーフモード」の直前にある「Haiagaru設定」**から追加機能を設定します。旧版で表示されていた浮動ボタンは、設定画面内の入口へ置き換わります。

パッチ適用後に選べる機能と、Haiagaru設定でオン／オフする機能は異なります。機能を有効にする際は、各項目の説明と初期値を確認してください。

### 任意の追加ファイル

通常のHaiagaru利用に、以下の追加ファイルは必須ではありません。対象機能を使う場合だけ[ReleaseのAssets](https://github.com/areteruhiro/Haiagaru-Morphe/releases/latest)から保存し、ZIPを展開せずMorpheのファイル選択で指定します。

| 機能 | 指定するファイル | 補足 |
|---|---|---|
| 191の自動NG画像判定の修正 | `haiagaru-image-ng.zip` | 191のみ。修正オプションがONでも、ファイル未選択なら元ライブラリを維持します。226／242には不要です。 |
| 画像取得専用VPN | `haiagaru-image-vpn-v2.zip` | 実験用の任意パッチです。Image NG用ZIPとは別です。 |
| 絵文字フォント | `NotoColorEmoji.ttf`などの対応フォント | パッチオプションで指定します。未選択なら端末標準を使用します。 |

[追加ファイルの導入案内](docs/optional-assets.md)

## Haiagaru設定

設定は次の9カテゴリに整理しています。検索欄から項目名・説明を探して変更でき、設定は自動保存されます。再表示や再起動が必要な項目は画面の説明に従ってください。

| カテゴリ | 主な内容 |
|---|---|
| スレッド | 本文・一覧の表示、投稿者の強調、コピー、X投稿プレビュー |
| 探す・過去ログ | IDチェッカー、取得済みスレ検索、DAT取得経路、アーカイブ |
| 書き込む | 入力欄、BE、スレ立てコマンド、添付・アップロード |
| 画像・動画 | サムネイル、GIF／動画ビューア、保存、ジェスチャー |
| NG・ミュート | 通常NGの補助、自動NG、連鎖あぼーん、高度なNG |
| 履歴・コピーした記事 | 閲覧履歴、コピー履歴、巡回エラー履歴 |
| バックアップ・機種変更 | ローカル・自動バックアップ、任意のMEGA同期 |
| アプリ・通信 | テーマ、追加タブ、通信・認証 |
| エキスパート設定 | 個別の動作や互換設定の細かな切り替え |

ツールバー項目の表示・並び順はChMate標準のツールバー設定で変更します。
[設定画面の使い方](docs/settings-navigation.md) ／ [カテゴリ一覧](docs/settings-organization.md)

## 主な機能

- 広告と余白の非表示、MonaKey削除、ChMate+互換設定（単発ID・コピペ・荒らしの省略）。[ChMate+互換機能](docs/chmate-plus-compat.md)
- 画像キャッシュ上限の拡張（最大256GB）、任意のHTTP→HTTPS切り替え。[キャッシュ](docs/image-cache-size.md) ／ [HTTPS](docs/https-switching.md)
- 必死チェッカー、ワッチョイ検索、取得済みスレ検索、外部検索。必死チェッカー専用ビューアを使わない場合は、パッチオプション`dedicatedCheckerViewer=false`を指定します。[専用ビューア](docs/id-search-viewer.md)
- DAT落ちスレの取得、任意のHTTPS取得経路、SS速報VIPの過去ログ、保存レス・保存用スレ。[DAT経路](docs/dat-routes.md) ／ [レスアーカイブ](docs/response-archive.md)
- レス本文の直接選択・コピー、投稿者の強調、X投稿の本文プレビュー。[直接選択](docs/direct-body-selection.md) ／ [投稿者の強調](docs/poster-highlight.md) ／ [Xプレビュー](docs/x-post-preview.md)
- 画像・GIF・動画の閲覧、スレ全体のメディアへの移動、動画の相対シーク・再生速度・保存。専用動画ビューアは任意パッチです。[動画操作](docs/video-viewer-controls.md)
- 通常NGの登録上限の変更（0で無制限）、IDなしレスの非表示、自動NGと除外ID、JavaScriptによる高度なNG。[IDなしNG](docs/hidden-id-ng.md) ／ [高度なNG](docs/advanced-ng.md)
- **連鎖あぼーんを常に非表示**（初期OFF）。元のNG対象レスや保存済みルールを変えず、連鎖されたレスの行を隠します。「NGWord-IDへの返信も非表示」とは独立した設定です。
- 登録スレの新着通知、巡回時の画像保存、巡回エラーのURL表示。[巡回画像](docs/patrol-images.md) ／ [新着通知](docs/thread-notifications.md)
- エッヂの記者ID表示、過去ログ検索、外部板の認証と登録板の編集。[記者ID](docs/edge-reporter-id.md) ／ [認証](docs/external-board-auth.md) ／ [外部板編集](docs/external-board-editor.md)
- 標準添付のアップロード先切り替え、アップロード履歴管理。[対応先・制限](docs/upload-hosts.md) ／ [標準履歴](docs/native-upload-history.md)
- ローカルバックアップ・自動バックアップ、任意のMEGA同期、設定の`.haiagaru`共有。[自動バックアップ](docs/local-auto-backup.md) ／ [MEGA](docs/mega-backup.md) ／ [設定共有](docs/settings-sharing-history-resume.md)
- 通常ChMateのアーカイブをフォルダ／ZIPから選択して上書き復元。任意のShizukuパッチで共有データのフォルダ別移行にも対応。[移行手順](docs/native-archive-migration.md)
- 自作テーマ、アプリ名・パッケージ名・アイコン・versionCodeの変更、クラッシュログ保存。[テーマ](docs/custom-theme-import.md)

機能ごとの追加時点は[最近の追加機能](docs/recent-features.md)、全変更は[CHANGELOG](CHANGELOG.md)を参照してください。過去のリリース文書には当時の設定名や未確認事項が含まれます。


## インストールできない場合

### パッケージの競合・証明書の違い

パッチ済みAPKは再署名されます。同じパッケージ名でも、既存アプリと署名鍵が違うAPKは上書きできません。**パッチ適用・署名処理の成功と、既存アプリへの上書き可否は別です。** Morpheの再インストール・別環境での作成・署名鍵の切り替えにも注意してください。

まずパッケージ名・署名証明書SHA-256・versionCodeと、インストール時のログを比較します。同じ署名鍵を使ったAPKへそろえるか、`Change ChMate package name`で別アプリとして導入できます。既存データを保つため、競合画面からすぐアンインストールせず、バックアップと復元方法を確認してください。

`Change ChMate package name`は初期有効で、標準のパッケージ名は`jp.co.airfront.android.a2chMate.haiagaru`、表示名は`Haiagaru`です。versionCodeは32ビット符号付き整数の上限`2147483647`が初期値です（APKを直接インストールする場合の値で、Google Playの配布上限とは異なります）。通常はそれより小さいAPKへ上書きできません。パッケージ名・署名鍵が一致する場合の対応版間の更新に使えますが、非対応版への対応を追加する機能ではありません。パッチ自体を無効にするとversionCodeも変更しません。アイコン未指定なら元アイコンを維持します。

### パッチ作成が失敗する

Morpheのログにある`ERROR`／例外と末尾を確認してください。Haiagaruの適用内容が`[WARN] [STDIO]`で表示されるだけでは失敗を意味しません。

実行環境やメモリ不足による失敗では、Morphe設定の実行環境・別プロセス・メモリ上限を端末の空きRAMに合わせて見直します。項目名はMorpheの版で異なります。全端末に共通するメモリ値はありません。

### バックアップ・クラッシュログ

ChMate標準のバックアップ／復元、またはHaiagaruのローカルバックアップを使用してください。MEGAは任意パッチです。

`Save ChMate crash logs`を有効にすると、未処理例外のログを`Download/Haiagaru/`へ保存します。報告時にはアプリ・Haiagaruの版、再現手順、エラー末尾を添えてください。Cookieやトークン、認証情報入りバックアップは公開しないでください。

## 既知の制約とFAQ

外部板やサービス側の変更、Cloudflare認証、Androidのバックグラウンド制限によって利用できない経路があります。特定端末だけの症状は、その端末で確認済みとは限りません。各機能文書と[FAQ](docs/faq.md)の確認範囲も参照してください。

スレ内の検索長押しなどで「URLを開けるアプリがありません」と表示される場合は、Androidの「標準アプリとして設定」で`itest.5ch.io`や`*.5ch.io`の扱いを確認してください。外部ブラウザで開く設定との競合が報告されています。[設定例](https://i.imgur.com/lmYxXZD.jpeg)（情報提供: ﾜｯﾁｮｲ 0de3-uUZJ）

## Morpheのパッチソース

通常はGitHubリポジトリURLを登録します。

```text
https://github.com/areteruhiro/Haiagaru-Morphe/
```

直接メタデータを指定する場合のURLは次のとおりです。

- 正式版：[`master/patches-bundle.json`](https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/master/patches-bundle.json)
- プレリリース：[`dev/patches-bundle.json`](https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/dev/patches-bundle.json)

プレリリースを有効にしていても、その時点で正式版と同じ版が配信される場合があります。表示が古い場合はパッチソースを再読み込みしてください。GitHubのキャッシュにより反映が遅れることがあります。

## 対応する元APKとビルド

| ChMate | 元versionCode | 元minSdk |
|---|---:|---:|
| 0.8.10.191 dev | 459 | 21 |
| 0.8.10.226 dev | 494 | 23 |
| 0.8.10.242 dev | 512 | 23 |

元パッケージは`jp.co.airfront.android.a2chMate`です。元APKの署名SHA-256は`7dd84d97df4666fbc8188b8d6167ce59314636997f0edae82d685fffda4059d2`です。これはパッチ後のAPKの署名とは異なります。

ローカルの主開発先は[AGENTS.md](AGENTS.md)に従ってください。

```powershell
.\gradlew.bat :patches:buildAndroid --no-daemon --max-workers=1
```

生成物は`patches/build/libs/patches-<version>.mpp`です。Android拡張を内包したMPPを使用します。正式版は`dev`から`master`へ統合し、既存のSemantic Release CIで公開します。生成されるバージョン・CHANGELOG・配布JSONは手作業で編集しません。

## サポート
何かあればGitHubのIssueか
以下のサーバーで対応させていただきます。
お気軽にご質問等お願いします。

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
