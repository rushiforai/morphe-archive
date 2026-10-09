# よくある質問

[READMEへ戻る](../README.md)

## パッチ適用時にエラーが発生して適用できない

Morpheでパッチを適用しようとした際にエラーが発生する場合は、Morphe右下の設定から以下のように変更してください。

`Morphe右下 → 別プロセスで実行 → 1024MB`

設定変更後、もう一度パッチ適用をお試しください。

---

## `strings.xml: open failed: ENOENT` エラーが発生する

パッチ適用時に、以下のようなエラーが表示される場合があります。

```text
app.morphe.patcher.patch.PatchException: /data/user/0/app.morphe.manager/app_ephemeral/patcher/apk/resources/package_1/res/values-en/strings.xml: open failed: ENOENT (No such file or directory)
at app.morphe.patcher.Patcher$invoke$1.invokeSuspend$execute(SourceFile:102)
```

このエラーが発生する場合は、以下のページからChMateのAPKをダウンロードして、そのAPKへパッチを適用してください。

https://2chmate.jp.uptodown.com/android

---

## ChMate 0.8.10.191 dev / 0.8.10.226 dev で発生する可能性がある問題

### Cookieエラーが発生して書き込みできない

初回の書き込み、長文の投稿、トリップを付けた投稿などで、Cookieエラーが発生する場合があります。

その場合は、まず `test` などの短い文章を書き込んでから、もう一度お試しください。

---

### 「ワッチョイで検索」が表示されない

ChMateの以下の設定を有効にしてください。

`ChMate設定 → 掲示板 → 5ch.io → メニュー「必死チェッカーもどき」を表示する`

操作方法はChMateのバージョンによって異なります。

- **226 dev以外**  
  ワッチョイ／ID部分を長押ししてください。

- **226 dev**  
  書き込み（レス）自体を長押しすると「ワッチョイで検索」が表示されます。

> この機能では [Kyodemo](https://kyodemo.net/) 様のサービスを利用しています。

Kyodemo側で対象データが見つからない場合は、「IDが見つかりませんでした」と表示されます。

Kyodemo上ではデータを確認できるにもかかわらず、Haiagaruから正常に検索できない場合は、GitHub Issueからご報告ください。

なお、サービス提供元から要請があった場合、この機能を削除する可能性があります。

---

## スレ内フィルターから画像一覧を開きたい

スレ内上部フィルターの「画像」を長押ししたときに開く画像一覧画面は、ツールバー側からも開けます。

`ツールバー → フィルター → 「画像」を長押し`

---

## 高度なNGワードについて

高度なNGワード機能については、以下のドキュメントを参照してください。

[高度なNGルール](advanced-ng.md)

本機能の開発にご協力いただいた **testuser0123-web** 氏に感謝申し上げます。
