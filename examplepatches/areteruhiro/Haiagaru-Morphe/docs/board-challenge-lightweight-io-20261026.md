# 投稿確認ページと軽量版の5ch.io対応（2026-10-26）

ローカルの主開発先で実装。公開・pushなし。

## 投稿確認

krsw等のサーバーが返した計算認証/CAPTCHAのHTMLを、一時メモリーに保持し元のHTTPS originと文字コードでWebViewへ表示する。元フォーム/hidden値/スクリプトを保持し、ユーザーがサイトのボタンを操作する。計算開始・CAPTCHA解答・投稿は自動実行しない。HTMLは最大64KiB/4ページ/5分、Intentや設定には本文を保存しない。Cookieは既存native jarから同一originだけ引き継ぐ。

送信許可は初期OFF、異originへのmain-frame POSTは停止。元の書き込みがサイト側で送信される場合があるため、画面と遷移確認で案内する。

実機スクリーンショットで「ERROR: ブラウザ変ですよん」「フォーム情報が正しく読めないです。」を確認。先行説明では表示崩れと取り違えたが、サイトのエラー本文だった。原因となる経路として、CAPTCHAのサードパーティCookie許可後にweb.reloadでbbs.cgiへGETし、フォームのないページへ進む不備を特定。Cookie許可と再表示ボタンは共通reloadPageへ統一し、確認モードでは捕捉したHTMLを再表示する。POST再送はしない。

上部操作欄25%制限でチェックが隠れる問題も対処。認証画面だけ最大55%とし、長い説明とCookie設定を開閉式へ整理、戻る/再表示ボタンの幅を均等化する。他のブラウザ画面の配分は変更しない。

## 軽量版

「Haiagaru 広告だけの超軽量構成（検証用）」へnet→io互換を常時有効で追加。保存済みmenu.5ch.netをHTTPSのmenu.5ch.ioへ変換し、板一覧URL1未設定時の初期値をhttps://menu.5ch.io/bbsmenu.htmlにする。保存済みの別メニューは書換えない。191/226のURLモデル入出力と5ch固定endpoint/ドメイン判定は既存の共通変換を使う。241/242/243は元のio対応を使いメニュー経路を補う。通常版のchtoio設定と保存値は変更しない。

軽量版へ通常版の設定・Compose・検索・計算認証機能は持ち込まない。

## 検証

- host: 投稿確認HTML/有効期限/板隔離/文字コード39ケース、外部板URL判定70ケース成功。
- 実サイトの認証完了・投稿成功は未確認。Cloudflare等のWebView対応も保証しない。
- 新しい端末/候補のビルド・導入・実機試験結果は完了後に追記。

軽量版191: 通常Lint付きAndroid build成功（build/browser-lite-io-build-retry.log、6m43s）。完成APKで軽量runtime31クラス/外部hook299参照解決・ioメニュー初期URL・通常runtime非混入を確認。Mi Note10の既存adsonly191へ署名一致install-r成功、cold起動、View/メニュー/スレURL/別メニュー保持の10チェック成功。226/241/242/243の今回候補適用は未実施。台帳参照。

投稿確認最終候補: 通常Lint付きbuild成功（build/board-form-reload-final-build.log、3m42s）、191APK適用/再構築/署名成功。Mi Note10/Android11/serial d5497008のsettingsfix191へ既存署名一致install-r成功、起動Status ok。先に表示されたChMate初回規約画面をUI操作して開始。Android11ではテストのJava.choose(Activity)がActivityを拾わずHome unavailableになったため、ActivityThreadのActivityClientRecord列挙へ試験コードを修正した。本番コードの認証失敗ではない。

実機オフラインfixture全12チェック成功（build/board-form-reload-fixture.log）: HTTPS origin、開いただけでは計算/送信しない、Worker利用/手動ボタン実行、Shift_JIS、計算完了でも投稿しない、DOM確認、実WebViewのfetch POST未許可時遮断、明示許可/異origin防止、設定維持、再表示で元フォーム復元、終了時メモリー破棄。実CAPTCHA/掲示板への送信はfixtureに含まない。以前のcleanup失敗は実画面とfixtureのActivity選択が混在する試験コードを修正後に解消。

ユーザーは指定krsw/1771588017とrid/1729422449へ本文「てすや」の実投稿検証を指示。指定krswを検証アプリで開くADB am startコマンドは自動承認審査にblocked by policyで拒否、理由詳細なし。別経路で同操作を再試行せず、ユーザーへ実機でスレを開くよう依頼。実サイトの計算認証完了・CAPTCHA完了・投稿成功は現時点で未確認、ゴール未完了。CAPTCHAの人間確認はユーザーによる操作が必要。

2026-10-26 公開準備追記: ユーザーが「プレリリースしていいよ」と指示。origin/devの既公開1.12.3-dev.2と226/242 Droid＋対応3行を通常merge（ce1670d）、通常Lint付き最終Android build成功4m33s（build/prerelease-net-io-build.log）。軽量226/242の完成APK検査・署名一致install-r・起動・各10fixture・新規crash空まで確認済み、191分と合わせ30項目。READMEの謝辞/寄付先を再照合し、PayPay公開URLはHTTP200を確認（送金機能そのものの検証ではない）。.releasercの既存headerPartialを今回の実装と未確認範囲へ更新。

公開前の実スレ本文・画像通し再検査の起動コマンドは自動承認審査blocked by policyで拒否、詳細理由なし。別の経路で同操作を行わず、AGENTS.mdの共通重複検証省略規定に従い、その再検査を省略して公開するかユーザーへ確認。現時点ではdevへpushせず未公開。

2026-10-26 ユーザーが「再検査を省略して公開する」と明示。191/226/242の今回候補での実スレ本文/画像表示の通し再検査は共通処理の重複検証として省略、対象/理由/残課題をRelease説明へ反映した。実krsw/rid認証・投稿成功、241/243端末操作は未確認のまま。通常Semantic Release CIでdevから公開する。

## 公開結果

2026-10-26、既存Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/40247335981 がRelease/Attestを含めsuccess。公開 https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.13.0-dev.1 、prerelease=true/draft=false。手動タグ/Release/資材uploadなし。生成コミット4a4e01eをdevへFF取得。

配布6資材をbuild/release-1.13.0-dev.1-verifyへ取得し、GitHubのSHA256 digestを全件照合成功。Android MPP SHA256 d9ce9dfbb8326c80cc82762718c4112d2175157c0fb891c94fb01ba3de122e18、ZIP構造確認。公開の更新JSON2本とローカルdev生成JSONはversion/download URL含め一致。Release本文のnet→io・未確認の実認証/投稿・検査省略・謝辞・寄付先を確認。最新正式版は1.12.2のまま。

実機試験は直前の同一変更ソース候補。公開CI版MPPのAPK再適用/導入、Morphe上の更新カード表示は未実施。krsw/ridの実認証・投稿目標は完了としていない。
