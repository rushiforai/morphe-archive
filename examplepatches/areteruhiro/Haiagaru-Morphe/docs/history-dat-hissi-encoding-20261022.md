# 履歴のDAT落ち非表示再確認／hissi.org文字化け

2026-10-22。未公開。版名と公開先は変更していない。

## 履歴DAT落ち

- 対象は191 dev。実際のChMate HOME履歴に表示対象のDAT落ちスレがなく、添付画像と同じ実データ状態は再現できなかった。
- 実HOME履歴adapterへ検証用のDAT落ち／通常行と時間見出しを一時挿入。設定をOFF→ON→OFF→ONと変更し、ONでは2行・DAT0、OFFでは6行・DAT2へ切替。native行と元リスト、設定は試験後復元。
- nativeのDAT落ちフラグに依存する表示filterがEdgeのBoardIDでも動作することを追加fixtureで確認。Edge試験は合成native行であり、実際のDAT落ちEdgeスレから採取した行ではない。
- 追加提供の5ch 2件もURLで実ページを確認。PHPスレはHTTP200で1000レス超過の停止表示、三笘スレはHTTP200で「過去ログ倉庫」表示。実native DBの行は端末にないため、同じスレID／板IDをnative DROPフラグ付きfixtureにして履歴表示filterへ通し、ON時2件とも除外／OFF時2件とも復帰を確認した。DBへスレを登録・変更していない。
- ログ `build/history-recheck191-v3.txt`（履歴fixture 8項目）、`build/history-recheck191-visible.txt`（実adapterでON/OFF4往復）、`build/history-recheck191-full.txt`（191 native履歴回帰56項目）。

## hissi.org文字化け

- 紹介されたDesperate checker Androidアプリのソースでは、hissi.orgの取得バイト列を `SJIS` で文字列へ変換していた。
- 現在のhissi.orgはHTTPヘッダー `charset=UTF-8` とHTML内の旧 `charset=Shift_JIS` が矛盾する。実バイトの判定を優先し、UTF-8 BOM／厳密なUTF-8、HTML meta、それ以外のShift_JISの順で復号する。
- 専用ビューアへのGET HTML応答を一度復号し、古いmetaとContent-TypeをUTF-8に正規化してWebViewへ渡す。HTML以外の資源、POST、hissi.org以外のホストには適用しない。CookieはWebView CookieManagerへ引き継ぐ。
- `VerifyHissiEncoding.java` 8項目成功。実際の専用ビューアWebViewでdocument.characterSet=UTF-8、タイトル「必死チェッカーもどき」と本文「トップページ」の日本語DOM判定成功。試験後checker設定を復元。
- build `build/hissi-encoding-normalized-build.log` 成功（2分43秒、既知Lint3工程除外）。MPP `build/hissi-encoding-normalized.mpp` SHA256 `30C33D19A8CAB190EEE11A70EFA54EEC4B596476EC2104063825B6571857E596`。191 APK `build/hissi-encoding-normalized191.apk` SHA256 `17A8017A711C5BA77F28365DD9A19FFBECA201609AAD92806E813ED364D23B5B`。証明書照合install-r成功、serial `emulator-5554`、既存settingsfix191を更新。端末lastUpdateTime 2026-10-22 05:43:33 UTC（14:43:33 JST）。
- 新規アプリクラッシュはcrash bufferに見当たらない。既存Oct21 libc crash recordのみ。実機への導入とリリースは未実施。
