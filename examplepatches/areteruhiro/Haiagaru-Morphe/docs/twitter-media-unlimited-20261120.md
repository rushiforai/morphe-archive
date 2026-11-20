# Twitter画像取得の件数上限撤廃

`XMediaAttachments.fromJson()`でmediaDetailsを16件までに切っていた固定上限を削除。受信した配列の全項目を順に処理し、URL重複排除と既存の画像・動画URL検証は維持する。

## 確認

- `:patches:buildAndroid`成功。
- 191／226／242の隔離reporter APKへ適用し、署名証明書一致を確認してMi Note 10（Android 11、ADB `d5497008`）に更新導入。
- Frida 17.18.0で各版の`fromJson()`に64件の合成画像メタデータを渡し、64URLすべて（末尾画像を含む）が返ることを確認。外部通信・Xアカウント操作なし。
- 実際のX投稿が返す画像数やX側の応答内容は確認していない。固定のアプリ内件数上限を外し、取得応答に含まれる配列要素すべてを処理する変更。

MPP SHA-256 `0e20ccaf3c4459d1830545bb333d2e28bf1bc59a71bc5aa43624b4981cd4a2ca`。

確認スクリプト: `scripts/frida-twitter-image-limit.js`。
