# HTTP通信のHTTPS切り替え

[READMEへ戻る](../README.md)

ChMate設定 → Haiagaru →「HTTP通信をHTTPSへ切り替える（画像を含む）」をONにして保存します。
設定変更後は既存の設定と同様にアプリが再起動します。初期値はOFFです。

対応済みの191 dev・226 dev・241・243 devで、OkHttpのURL生成とJava標準の
`URL.openConnection` / `URL.openStream`を通るHTTP通信をHTTPSへ切り替えます。
掲示板だけでなく、画像取得や固定URLも対象です。`chtoio`とは独立した設定です。
ホスト、パス、クエリを保持し、ポート80はHTTPSの標準ポートへ切り替えます。
80以外の明示ポートは保持します。既にHTTPSのURLは変更しません。

証明書・ホスト名の検証は無効にせず、HTTPS失敗時にHTTPへ戻す再試行も追加しません。
HTTPS非対応の接続先が読み込めない場合は、この設定をOFFにしてください。
WebView内部のサブリソースやネイティブライブラリ独自の通信を含む、
全ソケットのHTTP遮断を保証する機能ではありません。
242 devは現在のHaiagaru対応一覧に含まれず、この変更で対応版を追加していません。
