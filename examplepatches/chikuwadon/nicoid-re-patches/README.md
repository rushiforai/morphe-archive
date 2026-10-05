<a id="nicoid-re"></a>

# nicoid Re — ニコニコ動画アプリnicoid向けMorpheパッチ

**nicoid Re**は、Android向けニコニコ動画プレイヤー「nicoid（ニコイド）」を、現在のニコニコ動画の仕様に対応させるMorpheパッチです。ダークモード、Material You、Android 16、ニコニコショートに対応し、バックグラウンド再生やポップアップ再生などの機能を改善・追加しています。

nicoid 6.49の元APKにMorphe Managerでパッチを適用すると、「nicoid Re」として利用できます。

[最新版のnicoid Reパッチをダウンロード](https://github.com/chikuwadon/nicoid-re-patches/releases/latest) · [Morphe Managerにnicoid Reを追加](https://morphe.software/add-source?github=chikuwadon%2Fnicoid-re-patches&name=nicoid%20Re)

- 対象アプリ：`com.sauzask.nicoid`（バージョン`6.49`）
- 適用後のアプリ名：**nicoid Re**
- 適用後のパッケージ名：`com.sauzask.nicoid.hls`
- 正式版：`v1.6.2`
- 開発版：`dev`ブランチで管理

パッチ適用には次の元APKを使用してください。

SHA-256：`17fc6b46228af184437ade7e6f5573915bc655b86996307ff3270fdf35279cce`

## パッチ配布

<!-- PATCHES_START EXPANDED -->
> **[v1.6.2](https://github.com/chikuwadon/nicoid-re-patches/releases/tag/v1.6.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`ブランチ&nbsp;&nbsp;•&nbsp;&nbsp;パッチ1件
<details open>
<summary>📦 nicoid&nbsp;&nbsp;•&nbsp;&nbsp;パッチ1件</summary>
<br>

**🎯 対応バージョン：**

| 6.49 |
| :---: |

| 💊 パッチ | 📜 説明 | ⚙️ 設定 |
|----------|----------------|-----------|
| [nicoid Re](#nicoid-re) | nicoid向けのMorpheパッチ。現在のニコニコ動画の仕様に対応。ダークモードとAndroid 16に対応。その他、各種機能の改善・追加。 | なし |

</details>

<!-- PATCHES_END -->

## Morphe Managerへの追加と更新

### Morpheへリポジトリを追加する

Morphe ManagerをインストールしたAndroid端末で、次のリンクを開きます。Morpheの確認画面でソース名とURLを確認し、「追加」をタップしてください。

[Morpheへnicoid Reを追加](https://morphe.software/add-source?github=chikuwadon%2Fnicoid-re-patches&name=nicoid%20Re)

リンクを開けない場合は、Morphe Managerで次の手順を行います。

1. ホーム画面下部の「Sources」をタップします。
2. 「＋」をタップし、「Remote」を選びます。
3. 次のURLを入力して「Add」をタップします。

```
https://github.com/chikuwadon/nicoid-re-patches
```

### パッチを更新する

リポジトリを追加すると、Morphe Managerが新しいパッチを定期的に確認します。すぐに確認する場合は、「Sources」を開き、nicoid Reのソースカードにある更新ボタン（↻）をタップします。

新しいパッチを適用するには、ホーム画面でnicoid Reのカードに「Update」が表示されたときにカードを開き、画面の案内に沿って再パッチしてください。ソースの更新と、アプリへのパッチ適用は別の操作です。

## 機能・変更点

- Android 16に対応。
- 現在のニコニコ動画の再生形式に対応。
- ダークモードとMaterial Youテーマに対応。
- 通常再生・ポップアップ再生時に、再生速度と画質を変更できるように。
- 再生速度を0.1〜3.0倍、0.05倍刻みのスライダーで調整できるように。
- デフォルトの再生速度も同じ範囲・刻みのスライダーで設定できるように。
- 上下スワイプによる音量・輝度調整を追加。
- アプリ切替時の動作を設定できるように。
- 再生中に「戻る」を押した際の動作を設定できるように。
- 再生位置を保存する設定を追加。
- イヤホン切断時に再生を一時停止し、自動再開を抑止。
- 関連動画の選択メニューに、ポップアップ再生・バックグラウンド再生・キャッシュ取得を追加。
- ポップアップ画面でピンチイン・アウトできるように。
- 再生速度を変えても、流れるコメントの速度を等倍に維持。
- コメントサイズ（60%、80%、100%、120%、140%）を設定できるように。
- キャッシュの保存先をフォルダー選択で指定できるように。
- ショート動画機能を追加。
- 検索結果の先頭でスワイプして更新できるように。
- 一覧の有料動画にラベルを表示するように。
- 動画タイトルのキーワードや投稿者・チャンネル名で一覧を非表示にするコンテンツフィルターを追加。
- Cookieを手動入力してログインできるように。
- 設定からログアウトできるように。
- Google Cast関連機能を設定に移動し、現在の動画配信方式に対応。
- メニューに「アプリを再起動」を追加。
- 設定に「デバッグログを共有」を追加。
- 英語・繁體中文の翻訳を追加。
- 広告バナーと広告リクエストを削除。
- 安定性とパフォーマンスを改善。

## Cookieを手動入力してログインする

WebViewでログインできない端末では、設定のログインから「Cookie手動入力」を選択します。

別の端末・PCでニコニコにログインし、ブラウザの開発者ツールでニコニコのCookieを確認してください。`user_session`の値をコピーし、nicoid Reの入力欄に貼り付けて保存します。`user_session=値`の形式や、`user_session`を含むCookieヘッダーも入力できます。

保存後は動画再生やアカウントのマイリストなどで動作を確認してください。Cookieの保存だけではサイト側の認証成功は確認していません。期限切れやログアウトで利用できなくなった場合は、ログインし直してCookieを再取得してください。Cookieはログイン情報のため、他の人に渡したり、Issueやログに貼り付けたりしないでください。

## ビルド方法

リポジトリのルートで次のコマンドを実行します。

```sh
./gradlew :patches:buildAndroid --no-daemon
```

生成されるパッチファイルは`patches/build/libs/*.mpp`です。ローカルでビルドする場合は、MorpheのGitHub Packagesを読み取るための認証が必要です。

## ライセンス

テンプレート由来のコードは[GPLv3](LICENSE)および[NOTICE](NOTICE)に従います。

## クレジット

- nicoid：© sauza-sk
