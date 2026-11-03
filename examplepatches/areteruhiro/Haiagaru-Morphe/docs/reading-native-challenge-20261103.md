# エッヂ閲覧の純正確認画面

実機Mi Note 10 / Android11 / d5497008 / 検証242のVPN接続中画面を撮影。`https://bbs.eddibb.cc/liveedge/subject-metadent.txt へのアクセスには確認が必要です` と表示される純正Cloudflareダイアログ内が空白。追加したタイトル長押しの閲覧認証Activityとは異なる経路だった。WebViewはcom.google.android.webview 156.0.8078.47が有効。

純正242の `o.getTopDisLike.onViewCreated` はChallengeParamの通信用UAをWebViewに設定し、テキスト配信URLをそのままloadUrlする。JavaScriptは有効、DOM storageは有効化していない。専用WebViewClientのonPageFinishedはcf_clearanceを検出してnative ViewModelへ完了通知する。

変更はChMateのCloudflareDialogViewModelを参照する純正ダイアログとそのWebViewClientだけを対象にする。エッヂHTTPSの閲覧リクエストに限り、同ホストのHTML板ページへ移し、WebView標準ブラウザUA・JavaScript・DOM storage・Cookieを有効化する。native callbackの先頭でclearanceがある場合に実際のブラウザUAを保存し、元のnative callback命令・分岐を残す。nativeリクエストで同じUAを使う対象にsubject-metadent.txtを加える。投稿・別ホスト・一般WebViewに対するフックは追加しない。手動閲覧認証Activityも同じHTMLページ・標準UAに合わせる。

利用者指示により5秒ランダムUA実験のコード・設定UI・設定profile項目を削除。旧キーは初期化時に除去し、固定UAテンプレートとカスタム設定は維持。認証済み閲覧のUAはCookieと対になるため、その対象の閲覧時に優先する。

ホスト検査: ReadingAuthRules 35、native UA identity 19、ViewingUserAgentRules 39項目成功。最初の一括javacはBrowserUaTemplatesの入力不足で失敗し、依存を含めて再コンパイル後に成功。実機認証成功はまだ未確認。公開・GAS更新なし。

## 中間版の実機確認と追加修正

最初の候補MPP `5b7a62491f966bebb7bf5c227955cf69be9267fb9769cb43637fa691174bfcb5` を実機の既存検証242へ署名一致install-r。APK `build/reading-challenge-minote242.apk` SHA256 `9ce537d0cf6e4e5f2968e1c1a28372c75f7732128d69236a51d01903c003d3d8`。native callback全命令・分岐・register保持の検査成功。画面から板を開くとnative確認画面が出て閉じるが、板一覧は空であり成功とは扱わない。純正イベント画面に02:25:05/02:25:56のliveedge HTTP403を確認。VPN設定を変更せず、追加投稿なし。URL指定のADB起動コマンドは実行ポリシーにより拒否され、画面上の「エッヂ板を開く」から確認した。

226の初回生成ではnative ViewModel自体が難読化されており、完全修飾名を使った検出が0件となった。最初の検査失敗を成功扱いせず、ChallengeParam型のフィールドを持つViewModelを検出する方式に変更。191/226/242の全てでload/client/callbackが各1件でなければパッチを失敗させる。対象外版の変更はしない。

さらにCookieがあるだけでnative callbackを呼ばないよう、元のWebViewClientを保持した限定wrapperを追加。メインフレームのHTTPエラー・通信エラー・証明書エラー、challengeページ、空文書では完了通知せず、正常なHTMLとclearanceを確認してから元のcallbackへ渡す。DOMの確認結果だけを利用し、ページ本文やCookie値を追加ログへ出さない。遷移世代・現在URL・view attachを確認して古い非同期callbackを捨てる。nativeのLinearLayoutへ状態表示を追加し、タップで再読み込みできる。Cookieや他サイトのセッションを削除しない。ホスト検査はchallengeタイトル6ケースを加えてReadingAuthRules 41（合計99）項目成功。最終実機検査は後記。

## 実機242の成功確認

`build/reading-challenge-final-build.log` 通常Lint/R8成功3m8s。MPP `build/reading-challenge-final.mpp` SHA256 `383311e2d2ded9656ee6b134d5f7fa7c4a6944843c8685fbb932b8afecaed0a9`。3版APKのnativeフック検査でcallback全命令・register・分岐保持、load/client呼出しの引数保持とランダムUA実験class削除を確認。

実機242に署名一致更新し、VPNマークを維持したまま画面操作でエッヂを開いた。`reading-challenge-final-auth.png` で「セキュリティ検証の実行」が描画され、続いて `reading-challenge-final-auth-later.png` でnativeの板一覧が表示された。新しいスレ本文を開いた際に別の「書き込みエラー・板の認証」モーダルが出たため閉じ、本文表示後の再読み込みで1件→2件の新着レス取得を `reading-challenge-final-thread-refresh.xml` で確認。投稿操作はしていない。板認証・閲覧取得の成功と、投稿側の警告表示は区別する。VPN設定変更・データ消去なし。

## クラス名の直接指定への変更

利用者の追加指定で全クラス検出を廃止し、次の固定bindingに変更。構造検査は指定先の妥当性確認だけに使用し、別クラスへの自動fallbackは行わない。

| ChMate | 認証画面 | WebViewClient | ViewModel |
|---|---|---|---|
|191|`o.addSegment`|`o.addSegment$5`|`o.MaxSegmentCollectionImpla`|
|226|`o.isOpenJSSEPreferred`|`o.isOpenJSSEPreferred$write`|`o.isConscryptPreferred`|
|242|`o.getTopDisLike`|`o.getTopDisLike$IconCompatParcelizer`|`jp.syoboi.a2chMate.client.cloudflare.CloudflareDialogViewModel`|

実行時Java処理の変更なし。直接指定版のビルド・パッチ・検査結果は後記。

直接指定版は191/226/242への適用とnative callback/register検査が成功。その後に全クラス走査廃止版へ統合し、3版の全クラス定義一致と起動・本文・画像・設定・Cookie/UA連携を確認した。詳細は `full-class-scan-inventory-20261103.md`。実VPNのCloudflare確認画面・板一覧・本文新着取得はMi Note 10の242で確認済み。191/226で実VPNの認証成功を確認したという意味ではない。
