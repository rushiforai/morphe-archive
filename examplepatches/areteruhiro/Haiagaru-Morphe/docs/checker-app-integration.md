# 外部必死チェッカーとのURL連携

連携許可: https://github.com/chikuwadon/hissi-checker-droid-plus/issues/7#issuecomment-6393675913
参照した送信側main: e5dd048252a4ae4f481014d0bc5a6322d8e50527（2026-10-25）。コード流用なし。

Haiagaruのパッケージ名に依存しないHTTP/HTTPSのVIEW + DEFAULT/BROWSABLEの受信経路を使用する。

- bbs.eddibb.cc、v1ch.ccの /test/read.cgi/ と /liveedge/ をOpenUrlActivityで受ける。
- /liveedge/スレ番号/レス番号・範囲 を /test/read.cgi/liveedge/... へ変換する。query/fragmentは原文を保持する。
- hissi.org/read.php/ は既存専用ビューアへ接続。専用ビューアパッチ設定OFFでもOpenUrlActivityに受口を残し、コントローラーから標準WebViewへ渡す。
- 起動先はContextの実パッケージで指定し、jp.co.airfront.android.a2chMate.haiagaru等を固定しない。

送信側ExternalThreadApps.findはURLのqueryIntentActivitiesでアプリを検出するため、この経路の「他のアプリで開く」でカスタム名インストールを検出できる設計。
送信側ThreadOpenerの専用「Haiagaruで開く」は既定パッケージ固定のまま。その宛先を受信側で横取り/転送することはできない。
専用選択肢で任意パッケージを列挙・保存するには送信側の改修が必要。送信側リポジトリ変更・PR送信は今回行っていない。

URL正規化20ケースはローカルテスト成功。最終MPP/Manifestでの解決・外部アプリからの通し操作は別途必要。
