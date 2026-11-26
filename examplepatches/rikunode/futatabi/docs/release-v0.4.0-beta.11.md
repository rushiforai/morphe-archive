# futatabi v0.4.0-beta.11 — あいもげ公式ブラウザ認可

正式リリースではありません。

- beta.10 のあいもげWebViewでは公式SPAは描画されたが、POST /tokens がHTTP 401を繰り返した。公式OpenAPIは401をCloudflare Pre-clearanceのcf_clearance Cookie不在と定義。Cookieが存在するのに送信を拒否されたという証拠はなく、Cookie制限・UA・TLS・認証チェックを変更する方法は採用していません。
- あいもげの標準ログイン入口をGoogle Chrome Custom Tabsに置換しました。ChromeのCustomTabsServiceが利用できない場合、通常のChrome、続いてAndroidの通常ブラウザ起動へフォールバックし、画面で案内します。WebView導線は廃止し、標準入口は1つです。外部ブラウザのCookieをアプリへコピーする処理はありません。
- 公式HTTPS認可ページを改変せず表示し、本人が内容を確認して承認します。戻り先は従来の http://127.0.0.1:18765/ext/login/aimoge/callback 。PKCE、state検証、送信前DNS失敗時の再開、資格情報のアプリ専用ストレージ保存はbeta.9のまま。承認後はブラウザの成功表示を確認してタブを閉じ、ホームに戻ると保存済み状態を再取得します。タブ終了のみではログイン成功と扱いません。
- めぶきの既存ログイン方式、他パッチの実装・既定値は変更なし。

## 検証
- 隔離AVD emulator-5580 のGoogle Chrome 133.0.6943.137（CustomTabsServiceあり）で匿名の公式認可開始HTTP 201。通常Chromeの初回起動後、公式SPAの安全確認完了表示と許可ボタン有効化を確認。実承認は押していません。
- 全7パッチを適用したbeta.11出力APKからPKCEを開始。実際に com.android.chrome/org.chromium.chrome.browser.customtabs.CustomTabActivity が起動し、公式安全確認完了表示と許可ボタン有効化を確認。通常ChromeとCustom Tabsは同じ検証用ブラウザプロファイルです。
- タブを閉じるとホームへ戻り、未承認のため未ログイン状態の表示を確認。架空のstate/codeによるChromeから既存ローカルコールバックへのGETは到達し、Invalid or expired stateで拒否。実承認後のコールバック・交換・保存は所有者確認待ち。既存のbeta.9/10合成PKCE検証は今回の変更で改変していません。
- 通常ブラウザへの自動フォールバック分岐は実装済みですが、Chrome不在端末での実行は未検証。beta.10のWebView専用Instrumentationテストは対象画面の廃止に伴い現行ツリーから削除（beta.10タグに保存）。
- 全7パッチ適用、aapt表示名とアイコン、DEX内Custom Tabs定数、既存AOTハッシュ、パッチ定義一致を確認。隔離AVDは停止済み。共有emulator-5554は操作していません。

## 従来の注意点
- 所有者端末でのCloudflare安全確認完了と実承認、資格情報交換、ホーム状態更新は最終確認待ち。Firefox Nightlyの描画停止の厳密な原因、beta.9以前の端末DNS障害、電磁気総合スレのHTTP errorは未確定。
- めぶきのX入口はエミュレータで不安定、HTTPエラー表示は未確認。Google対象外。未ログインのおためしカタログ対応のみで、ログイン後も認証済みスレ本文変換は未実装。新規スレ・画像添付は未対応。
- あいもげ／あにまんの投稿はローカルフィクスチャ検証済み、実サイト最終検収は未実施。beta.7画像・カタログ修正、beta.8板別ログインボタン、確定アイコン、既定ダークモード、beta.9あにまん本文修正の独立した実機検収は所有者確認待ち。
- 実認証、実承認、実投稿なし。認証チェックの迂回、Cookie注入、TLS無効化なし。
