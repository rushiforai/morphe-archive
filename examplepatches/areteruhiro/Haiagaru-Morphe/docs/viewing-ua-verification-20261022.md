# 閲覧UAと設定表示の開発記録（未公開）

最新の指示は、書き込み用の設定を新設することではなく、書き込みUAを変更しないこと。既存のreplaceUserAgent/userAgentを維持し、プロセス共通のhttp.agent上書きをやめた。閲覧対象のGET/HEADだけにリクエスト単位で適用し、POST・画像送信・認証ページ・外部Web一般は変更しない。UAを二分化したという利用者向けの更新説明は追加しない。

## 実装

- 対象はsubject.txt、SETTING.TXT、DAT/kako、read.cgi/rawmode.cgi、BBSMENUの一般的な取得経路。すべての独自APIや追加Web画面のUA変更を保証するものではない。
- ChMate本体Requestの構築完了時にHeadersを複製してUAだけ差し替える。共有された元Headers、Cookie等は変更しない。
- 191=f、226=h、242=fのネイティブURLフィールドを使用。226/242には別のnullable URLもあり、型が似ているだけで参照先を決めない。
- java.netの元setterの引数・例外を維持し、接続直前の取得でも補正。doOutputが有効な要求は除外。元の命令・レジスターを保持し、分岐先が補正を飛ばさないように置換してから元呼出しを続ける。
- 既存設定のオン／オフと文字列はそのまま使う。書き込み用の新しい設定キーは作らない。

## 確認

- ホスト39項目成功。対象URI／POST除外／認証・送信除外／ヘッダー改行拒否／元配列・Cookie保持。build/viewing-user-agent-host-tests.txt。
- 初期191は11項目成功。226/242の初回検査ではURL解析fixtureと参照フィールドの不一致が判明し、実装・fixtureを修正。旧候補を成功扱いしない。
- 最終ビルドbuild/viewing-user-agent-verified-build.log成功（3分1秒、既知ローカルLint3工程除外）。固定MPP build/viewing-user-agent-verified.mpp SHA256 `BD93052B2CC01C3DF2DB0FE5D628A5EF8124D7CB3815FDC5ABF57F61B2BF06DC`。
- 191/226/242の生成APKでnative構築命令・引数・分岐先を検査。端末上ではNative Requestと模擬HttpURLConnectionを構築し、閲覧・書き込み・アップロード・認証・OFF・http.agent保持の各11項目を検査する。実通信・実投稿・実アップロードは一切行わない。最終結果はintegration-statusを参照。

最終のviewing-user-agent-verified191/226/242-runtime.txtは各11項目成功、設定は終了時復元。VerifyViewingUserAgentHooksも各版成功。新規アプリクラッシュなし、起動後ANRなし。未公開であり、今回の範囲だけで全画面・実サーバー通信の公開前回帰確認が完了したとは扱わない。

## 同時に残しているUI修正

右下の独立した「フィルター ▴」Viewの生成とglobal layout watcherを撤去。ツールバーの入口・下部パネルを開く処理は変更しない。191でON/OFFともhidden Viewを含めて生成されないことを確認。ただし今回、実スレ本文からツールバーをタップして開く通し確認は未実施（URL起動コマンドが環境側で拒否されたため）。

VPN対象ドメインの説明は入力欄の前にあると長大なfloating labelに取り込まれるため、入力後の独立した本文へ変更。191の実ダイアログで全文表示を確認。build/haiagaru-vpn-help-final.png、build/vpn-help-no-floating191-visual.txt。ドメインの保存・対象サイトへのアクセス・VPN接続は行わない。

Imgur中継先はGETでHTTP522を確認したが、その後ユーザーが今回の対応を取り消した。試作のエラー変換helperと呼出し変更は撤去済み。配布物の検査でもImgurUploadErrorsがないことを確認し、アップロード機能を修正済みとは表記しない。
