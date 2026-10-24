# 検索・設定UIと認証の改善（開発中）

## 検索と設定

エッヂ過去ログの「表示」に、検索欄・操作ボタンの間隔（50〜100%）を追加。文字倍率とは独立し、コンパクト時は入力欄の内側余白、ボタンの余白、フォームの行間を詰める。タップ領域は最低48dpを維持する。結果の文字倍率70〜150%、結果上下余白0〜32dpも保存する。

設定カードは「機能名・トグル → 区切り線 → 説明」の順。同じカード内のまとまりを保持する。専用ビューア・フィルター内の使い方案内は設定へ移し、検索条件、エラー、安全性・認証上の注意は残す。

参考としてAndroid公式の[Switch](https://developer.android.com/develop/ui/compose/components/switch)と[Material 3 ListItemのソース](https://github.com/androidx/androidx/blob/androidx-main/compose/material3/material3/src/commonMain/kotlin/androidx/compose/material3/ListItem.kt)を確認。今回利用可能なスキルにAndroid設定UI専用のものはなく、新しいスキルや依存ライブラリは追加していない。

## フィルターから画像を開いた後の透明ウィンドウ

2026-10-22追補: 最新候補を実機へ導入後も画像長押しで停止する報告あり。内部onItemLongClickの直接呼出しでは成功していたが、エミュレータでADBの実タッチ長押しを行うと再現した。診断ログはdismiss-enterだけで終了し、dismiss-exitと画像一覧への遷移が実行されない。SIGQUITの主スレッドは通常のMessageQueue待機で、ANRや長時間の通信待ちではなかった。Composeの長押しdispatch中に自身のViewを同期detachすることによるコールバック中断が疑われる。

dismissForNavigationで「閉じる」自体もmain Handlerの次の処理へ移し、その後nativeの画像一覧コールバックを実行する候補へ修正。Fridaで同じ変更を一時適用したエミュレータでは、実タッチ長押しでdismiss完走、isShowing=false／attached=false、ImageListActivity表示、戻る後の透明窓なし。build/longpress-defer-prototype242.txt。APKによる最終確認は別途記録する。実機の停止報告を、前回の合成試験成功で否定しない。

242のエミュレータで、戻った後に高さ0のComposeダイアログが本文の上へ残留している状態を確認。Window callbackはHaiagaruDialog、isShowingはfalseだがdecorはattached=trueだった（build/filter-grey-diagnostic6.txt）。ANR記録はなかった。

画像一覧のネイティブ処理はフィルターを閉じた後のmainキューへ分離。ダイアログのdismissでComposeを破棄し、そのダイアログ自身のdecorがなお付いている場合のみ除去する。他のウィンドウを一括で閉じない。実際の往復検証が完了するまで修正完了とは扱わない。

## CAPTCHAとex0ch

[PrefKarafuto/ex0ch](https://github.com/PrefKarafuto/ex0ch)のtest/bbs.cgi、test/module/post_service.pl、test/datas/form-captcha.jsを参照した。

- reCAPTCHA v2（g-recaptcha）、hCaptcha、Cloudflare Turnstileのサーバー検証を実装している。
- CAPTCHAページは本文等のhiddenフォームと各サービスのresponseをbbs.cgiへPOSTする。CookieだけでそのPOSTを代替できるわけではない。
- BBS_CAPTCHA=checkedでは、通常のブラウザからメール／コマンド欄に!authを指定し、人がCAPTCHA認証すると6桁の認証コードを発行する。専用ブラウザで!auth:コードを使用する方式がある。
- コードを使用すると発行元のSIDへ切り替える処理がある。別ブラウザで別SIDを作ってからコードを流用するのではなく、既存Cookieを引き継いだ同じセッションでの認証を前提とする。
- BBS_CAPTCHA=forceでは通常のブラウザでの投稿を要求する。サイトの制限を迂回しない。

汎用の認証要求検出にCAPTCHA・画像認証等を追加。認証画面では必要な場合だけ、警告に同意してサードパーティCookieを許可できる。既定は不許可。自動認証、自動投稿、トークンの取得・ログ保存はしない。ex0ch実サイトでの認証完了・OTP連携・投稿はまだ未検証で、全面対応完了とはしない。

XIG05での例は、ThreadListActivity上の「subject-metadent.txtへのアクセスには確認が必要です」という本体のアクセス確認画面だった。書き込みエラーやex0chのCAPTCHAそのものと同一視しない。既存画面ではチャレンジ部分が空白で、認証成功は未確認。

## SessionIDの保持

ex0chのLoadSessionIDはcountsessionとsecuritykeyを使用する。認証開始前に対象originの既存ChMate CookieをWebViewへコピーし、完了してから認証ページを読み込む。Cookie jarが未初期化、読取失敗、WebViewへの設定失敗時には別SessionIDで開始せず停止する。

WebView Cookieをネイティブへ重ねるとき、既存のcountsessionまたはsecuritykeyがあれば両方をWebView側の値で置換しない。サイトからの正規のSet-Cookie更新や失効は止めない。IDの生成・偽装・ローテーション、Cookie削除・初期化は行わず、値をログへ出さない。サーバー側の期限切れ・IP結び付け等での変更まで保証するものではない。
