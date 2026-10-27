# 外部板の認証でCSSが表示される問題

XIG05 serial730eae72の`jp.co.airfront.android.a2chMate.haiagaru`（ChMate0.8.10.191 dev）で、外部板の認証画面にCSS本文が表示されていた。取得スクリーンショットは`build/xig05-auth-screen.png`。保存先URLのパスだけを確認した結果、043044.xyzの認証先に`https://043044.xyz/test/datas/design.css`が登録されていた。認証Cookie・下書き・コードは取得/変更していない。

原因候補は認証エラーの同一origin HTTPSリンクを先頭から拾うsuggested処理。HTMLのstylesheetが本来の認証リンクより前にあるとCSSを選べた。

修正:

- CSS/JS/画像/フォント等のリソースとbbs.cgi/write.cgi/subbbs.cgi投稿先を、自動候補と明示入力の認証ページから除外。
- 保存済みCSS URLをそのまま再利用せず、有効な候補/既知の認証先があれば使う。不明サイトの認証パスは推測せず再設定を促す。
- 設定画面に「板を通常のブラウザで開く」を追加。サイトがWebViewや専用ブラウザを許可するか、認証がCookieのみで成立するかは別問題。認証の自動実行・CAPTCHA代行・投稿の自動再送は追加していない。
- 古いIntent等でCSS URLが認証Activityへ渡された場合も停止して案内する。

VerifyBoardAuthRulesの69ケース成功（CSSが認証リンクより先にあるHTML、CSSだけのエラー、保存済みURL、encoded拡張子、正しい認証URL/クエリ保持、既知板、Cookie identity等）。通常Lint付きAndroid build成功4m1s。外部板公開ページはHTTP200 text/html、design.cssへのリンクあり。認証フォームの正しいURL/認証完了/投稿成功は未確認。認証や投稿は実行していない。

MPP `build/auth-css-fixed.mpp` SHA256 `0b6302ec22612ff7213a12b7e25a4f5659fa7bba8b799e889f06c141dd992d42`。前件の共有（記憶）並び順修正とNGWord-ID返信非表示オプションも含む。UA分離版には未統合。

2026-10-26 00:01〜00:02 JST、ユーザーの実機インストール指示により、元アプリと別の`Haiagaru 検証 191`へ署名一致・データ保持更新Success。XIG05 serial730eae72、package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。HomeActivityからTabletHomeActivity起動Status ok、PID7461、既存スレ本文のスクリーンショット確認、対象PIDのcrash buffer空。完成APKでも共有順hookと元delegate/レジスター/分岐保持を再検査成功。認証画面操作/認証完了/投稿・共有送信は未実施、未公開。導入詳細は`docs/android-installations.md`。ログ`build/auth-css-{rules-test,final-build}.log`、`build/auth-css-fixed191-{patch,install,launch,crash}.log`、画像`build/auth-css-fixed191-installed.png`。
