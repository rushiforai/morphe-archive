# がうがう RePatch

## 開発中であり、現在では動作しません。


漫画アプリ「がうがう」v1.46.0向けのコミュニティパッチソースです。Morphe Managerからパッチを適用します。

## Morphe Managerにソースを追加

Android端末で次のリンクを開き、Morphe Managerに追加してください。

**[がうがう RePatchをMorphe Managerに追加](https://morphe.software/add-source?github=Kdroidwin%2Fgaugau-morphe&name=%E3%81%8C%E3%81%86%E3%81%8C%E3%81%86%20RePatch)**

リンクが開けない場合は、Morphe Managerの **Sources（ソース）→ ＋** から次のGitHubリポジトリを入力します。

```text
https://github.com/Kdroidwin/gaugau-morphe
```

追加後、対象アプリのパッチを選び、手元の「がうがう」APKに適用します。対象APKのパッケージ名は `jp.futabanet.gaugau.app` です。

> **配布状況:** リリース `v0.1.11` はMorphe Manager 2.xが読み込めるDEX形式のMPPです。PairIPが埋める値に依存するPiano Analyticsの起動処理、Play Billing接続、MainActivityの反射型ライフサイクル呼び出しも調整しています。Morphe Managerで既にソースを追加済みの場合は、Sourcesから更新してください。

## パッチ内容

- Google Playサービスが利用できない端末でも起動できるよう、アプリ内のPlay Integrity／PairIP関連チェックを調整します。
- AppsFlyer、Firebase Analytics、Pianoなどの広告・利用状況計測を抑制します。
- Android IDの代わりにアプリ内IDを使い、設定からIDを確認・変更できます。
- お気に入り漫画をJSONファイルにエクスポート／インポートできます。
- Play Billing接続を無効化するため、アプリ内購入は利用できません。

計測処理や通信の抑制は、パッチ対象として確認できたアプリ内の処理に対するものです。アプリやサーバー側の変更により、対象範囲や挙動が変わることがあります。

## 対象バージョン

| アプリ | パッケージ名 | 対象バージョン |
| --- | --- | --- |
| がうがう | `jp.futabanet.gaugau.app` | `1.46.0` |

別バージョンではパッチが適用できない、または正常に動作しない場合があります。

## お気に入りの移行

アプリ内の設定からJSONファイルに書き出し、別の端末へファイルを移してから設定で読み込みます。読み込み時はログインしておいてください。すでにお気に入りに登録されている漫画は重複して追加しません。

## ビルド

JDK 17、Android SDK、Gradleを用意し、プロジェクトのルートで実行します。

```sh
./gradlew :patches:buildAndroid
```

Morphe Gradleプラグインの取得にはGitHub Packagesの認証が必要です。`GITHUB_ACTOR` と `GITHUB_TOKEN`、またはGradleプロパティ `gpr.user` と `gpr.key` をローカル環境で設定してください。トークンなどの認証情報はリポジトリに登録しないでください。

## ライセンスと注意

このリポジトリはMorphe Manager向けの非公式コミュニティパッチです。がうがうの運営元およびMorpheプロジェクトとは別のものです。パッチ適用後のアプリは公式配布版と異なるため、利用は各自の判断で行ってください。
