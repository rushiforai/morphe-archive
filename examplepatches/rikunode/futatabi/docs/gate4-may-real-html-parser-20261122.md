# futatabi — may実物カタログ／スレ描画の差分検証（2026-11-22 JST）

**結果：カタログ描画 PASS、合成HTMLの最小成功構造を確認、スレ本文・レス番号・JPEG画像表示 PASS。** 工程5以降のBridge／アダプタは未実装。

## 前提・実物取得

対象は照合済みの **素のふたったー3.1.1**（`com.Nanasaki.ftutter`）、Android API 36 エミュレータ `emulator-5554`。前段階で `flutter.itaList` に直接追加済みの `http://127.0.0.1:18766/aimoge/` を使用。ADB reverse は `tcp:18766 tcp:18766`。

2026-11-22 JSTに `https://may.2chan.net/b/futaba.php?mode=cat` から本物のレスポンスをヘッダと本文のバイト列として取得した。ローカルの **Git無視対象 `apk-inspection/may-replay/`** に原本を保存。第三者の全文HTML・Set-Cookie値・JPEGバイナリはリポジトリには入れていない。

| 取得物 | HTTP | 本文バイト数 | SHA-256 | 主要レスポンスヘッダ |
| --- | --- | ---: | --- | --- |
| mayカタログ | 200 | 28,459 | `d0def5a9d0d664d8635cf8010e81a994bd00eeaef760018f32e633ebdf0e6b3b` | `Content-Type: text/html; charset=Shift_JIS`, `Transfer-Encoding: chunked`, `Server: Apache/2.4.63 (Rocky Linux)`, `Set-Cookie` 2件 |
| mayスレ `res/1449110872.htm` | 200 | 45,167 | `803d595647dee5e5ba469b1b04a8e7ba4a47a2a35c23a917b4b7ba68bc236ac0` | `Content-Type: text/html; charset=Shift_JIS`, `Content-Length: 45167`, `ETag` と `Last-Modified` |

追加した研究用 `tests/may_exact_replay_server.py` はローカル原本を読み込み、カタログとスレを各々 **本文バイト無変更・取得ヘッダそのまま**で返す。カタログの転送は元ヘッダ `Transfer-Encoding: chunked` と整合するよう再チャンク化した。**元HTTPのchunk境界自体は取得しておらず、そのバイト単位の一致は主張しない。** ローカルHTTPクライアントによる再取得後の本文SHA照合はカタログ・スレとも一致した。

## 1. 本物カタログを完全再生

- **PASS**：本物の28,459 bytesを返した際、既存カタログUIに多数のセル、タイトル、レス数が出現し、以前の `Null check operator used on a null value` は発生しなかった。
- Ftutterの `GET /aimoge/futaba.php?mode=cat` に続いて画像サムネイル要求が多数発生。元のHTMLに存在するリンクのパースも確認できた。
- HTMLを本物の最初の `<td>` 1件だけに縮小しても、タイトルとレス数46が表示された。

## 2. カタログの必要要素の差分

最終的に次の **合成・単一セルHTML** で、タイトル `futatabi test`、レス数 `1` の双方が既存UIに表示された。これは「**実測で表示できる最小化構造**」であり、残った各タグがすべて不可欠と個別証明したものではない。

```html
<!DOCTYPE html>
<html>
<head><meta charset=Shift_JIS></head>
<body>
<table id='cattable'><tr><td>
<a href='res/1001.htm'><img src='/aimoge/thumb/1795265158529s.jpg'></a>
<small>futatabi test</small><font size=2>1</font>
</td></tr></table>
</body></html>
```

| 差分（他条件維持） | UI描画 |
| --- | --- |
| 実物1セルのみ | **PASS** |
| タイトル・レス数を合成値に変更 | **PASS** |
| リンクを `res/1001.htm` に短縮 | **PASS** |
| `target='_blank'` 削除 | **PASS** |
| `img width`・`height` 削除 | **PASS** |
| 2個の `<br>` 削除 | **PASS** |
| 上記装飾的属性・改行タグをまとめて除去した最小合成HTML | **PASS** |
| 画像を `/aimoge/thumb/1.png` に変更 | **FAIL**、nullエラー |
| 画像を `/b/cat/1s.jpg` に変更 | **FAIL**、nullエラー |
| 画像を `/aimoge/thumb/1795265158529s.jpg` に変更 | **PASS** |
| 画像を `/aimoge/cat/1795265158529s.jpg` に変更 | **PASS** |

**判定**：このバージョンのカタログパーサは、画像URLの **長い数字＋`s.jpg` 形式**に依存している可能性が強く、`1.png` 等はnullエラーの再現要因となった。13桁の数字列は**成功する十分条件**だが、必要な正確な桁数・正規表現・内部例外箇所までは未解析。画像の寸法、`target`、`<br>` は今回の成功例では必須ではない。

## 3. 本物スレHTMLと画像

- 実物45,167 bytesを `/aimoge/res/1449110872.htm` に再生し、**Ftutter自身がGET**。
- **PASS**：既存スレ画面でスレ本文、投稿番号 `No.1449110872`、返信番号 `No.1449112008` を確認。nullエラーなし。
- その後、アプリから `/aimoge/src/1795265158529.jpg`、`/aimoge/thumb/1795265449925s.jpg` など画像取得要求が来た。
- 対応するJPEGを本物のmay板から取得し、テストサーバーから **HTTP 200 / image/jpeg** で返した。サイズはそれぞれ **35,167 bytes** と **10,918 bytes**。スクリーンショットで本文内の画像表示を確認し **PASS**。そのほかの画像全件の表示成功を確認したわけではない。

## 検証証拠

- [本物と合成のレスポンスのSHA・表示判定](gate-evidence/may-replay-verified-summary.json)
- [全カタログ・単一セル・最小合成・スレのUI階層判定](gate-evidence/may-replay-ui-verification.json)（本物カタログはUI node 116件、レス数46を確認）
- [アプリ自身のアクセスログ抜粋](gate-evidence/may-replay-request-excerpts.log)
- [最小合成HTMLのUI階層](gate-evidence/catalog-synthetic-minimal-ui.xml) と [画面](gate-evidence/catalog-synthetic-minimal.jpg)
- [不正な画像ファイル名でnullエラーになるUI階層](gate-evidence/catalog-invalid-image-ui.xml)
- [実物スレ表示の画面（第三者の画像をモザイク加工）](gate-evidence/thread-image-redacted.jpg)

元HTML・ヘッダ全文・JPEGは公開しない。現行コードは**実証専用サーバー**であり、Morpheパッチや製品内Bridgeを実装していない。

## MUSE判断材料

1. 前回の直接書き込みによる板一覧登録・GET到達・永続化は既にPASS。
2. 今回、**既存カタログUIとスレUIでレス・画像が描画できることを実証**。先行nullエラーは、テスト用HTMLの画像URLがパーサの期待形と異なるために起こったと強く支持される。
3. 将来のアダプタは実測成功した `cattable` 単一セル構造と `<数字列>s.jpg` に対応する画像URLを生成し、スレ本文はふたばの構造に合わせる方向が成立候補。

**ここで停止。** 正規の板追加UIからのlocalhost登録は依然未達で、製品Bridge・各サイトアダプタ・新リリースの実装／公開は行っていない。
