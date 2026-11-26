# モバイルメディア判定の負荷対策（2026-11-25）

## 変更

- Android 7.0（API 24）以降は `registerDefaultNetworkCallback` で既定ネットワークの変更を受け取り、Wi-Fi状態と対象 `Network` をプロセス内に保持するようにしました。画像・Web/Xカード・一覧画像の各行からの取得可否判定ではキャッシュだけを読みます。
- 初回だけ従来どおりネットワーク状態を取得します。Android 6以前、またはcallback登録に失敗した場合は1秒キャッシュで問い合わせを抑えます。
- 動画の分割サムネイル判定 `VideoFrameThumbnail.fourAllowed()` も共通キャッシュを使用します。分割プレビュー用接続はAPI 23以降でキャッシュ済みの既定Wi-Fi `Network` を使い、`getAllNetworks()` と `getNetworkInfo()` の列挙を避けます。API 21–22は既存の接続方法を維持します。
- 通信量記録OFF時は入力ストリームを計数ラッパーで包まず、1バイト／チャンクごとのカウント処理を行いません。OFFへの切替時は定期サンプラーもcancelします。

## 実機Frida確認

端末 `d5497008`（Mi Note 10 / Android 11 / API 30）の隔離reporter 191／226／242で確認しました。通常版ChMateのパッケージやユーザーデータは変更していません。

各版で画像のWi-Fi限定判定を50,000回、動画分割プレビューのWi-Fi判定を50,000回、合計100,000回実行。判定中の次の呼び出しはすべて0回でした。

- `getActiveNetwork()`
- `getNetworkCapabilities()`
- `getActiveNetworkInfo()`
- `getAllNetworks()`
- `getNetworkInfo()`

計測時間は191が4,404ms、226が4,486ms、242が4,384ms。Wi-Fi限定の分割プレビュー判定は実機Wi-Fi接続中に有効を確認しました。

通信量記録のFrida確認では、3版すべてで初期OFF、OFF時の計数ラッパー迂回、OFFに切替後の定期サンプラー停止を確認し、設定を元に戻しました。

## 候補成果物

- MPP SHA-256: `d70d8b5b9effb00df11e15074585b0bdfb7f3b1d703666e9af54c5ffff27d21f`
- 191 APK SHA-256: `796ec4d00a0cb3c9341ad4a88ed53acc379797f28e294241595ef152c22fdbd9`
- 226 APK SHA-256: `01bfddb7243245b9780c38b038dfd66eb15da889ec0e7bc3eec1504b76f04542`
- 242 APK SHA-256: `53344185f26728d486a05cd0185d861231a6c58039ff338d483fab9f448d363b`
- 証明書SHA-256（全版）: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
- APK・MPP・Fridaログ: `C:/Users/narum/.codex/worktrees/945d/haiagaru-official-20261123/build/mobile-policy-cache-20261125/candidates/`

## 残るネットワーク照会箇所

- `PostingIpWarning` は投稿前の回線確認時に一度問い合わせます。
- `VideoViewerSettings` は設定画面のWi-Fi状態を表示するときに問い合わせます。
- API 21–22では動画のWi-Fi接続選択に、接続を開くごとの `getAllNetworks()`／`getNetworkInfo()` を残しています。読み込み中に繰り返す行別判定ではありません。
