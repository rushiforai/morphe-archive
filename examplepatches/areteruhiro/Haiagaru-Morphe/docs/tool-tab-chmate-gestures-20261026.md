# 追加画面タブのChMateジェスチャー（PR #93の改善）

主開発先 `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current` で実装。未公開。

## 続けて追加した操作（2026-10-26）

ユーザーが先の3操作について「良さそうです」と確認し、続いて戻る/進む/新しいタブも依頼したため、同じ初期OFFのスイッチへ追加した。

- 戻る/進む: 対象ツールの表示中WebViewの履歴を移動。進む履歴がなければ何もしない。戻る履歴がなければそのツールを本体のタブ終了APIで閉じる。設定カテゴリ内の戻るはカテゴリ一覧へ戻る。隣接タブ移動には読み替えない。
- 新しいタブ: 実所属ペインを解決し、ChMate本体の空タブ作成APIへ委譲。191の `TabletHomeActivity.d(read,write)`、226の `b(QWA,fWG)`、242の `b(getRemoteCreator,zzfc)` はいずれもtype=3の空タブを構築して前後の履歴リンクを保持して追加する。現在のツールの複製/検索再実行はしない。現在のHOME追加先設定を変えても既存タブの実所属を使う。
- 同期/非同期認識通知、子CANCEL後の操作、設定オフによる取り消しは前回と同じ経路。

`test-tool-tab-gestures.py` を本番の履歴探索クラスも含む36項目へ拡張して成功。実装JavaのAndroidコンパイル成功。`VerifyNativeBlankTab.java` で191/226/242の呼出先がtype=3/履歴リンク/挿入を持つことを検査して成功。設定説明も更新。今回拡張後の配布MPP生成はPCのネイティブメモリ不足で2回失敗し、低メモリ設定で再試行中。前回の導入APKは更新していない。`frida-tool-tab-new-blank242.js` は実ペイン/空タブ/追加先反転/後始末の検査用として追加したが、実行成功扱いにしない。

以下の「今回未対応」「26項目」は最初の3操作だけの候補時点の記録。

## CAPTCHA・計算認証との統合候補

ユーザーがXIG05への導入と、別チャットの最新CAPTCHA/計算修正も含めることを明示。分離ビルドはこのチャットのPID34060（Xmx750m/ActiveProcessorCount1）だけを照合して停止し、主開発先の全変更から通常Lint付き統合ビルドへ切り替えた。他のJavaプロセスは停止していない。

統合対象は今回のジェスチャー6操作に加え、BoardChallengeSession/ExternalBoardAuth/ExternalBoardAuthActivity/CaptchaDialogContent/BoardPostResult/ThreadCommandsと既存認証パッチの未コミット変更。元サイトの計算/CAPTCHAフォームを保持したダイアログ表示、両許可、背景調整、明示的な投稿成功後の画面終了/元本文のみの下書き処理を含む。実サイトの投稿完了は未確認。ホスト検査は元確認ページ42項目、投稿結果/下書き保護27項目成功。

ログ `build/combined-gestures-captcha-build.log`、ビルド中の対象ソース照合用 `build/combined-gestures-captcha-source-hashes.json`。APK生成/導入は完了後に追記する。

### 統合候補の導入結果

通常の統合buildもC2 CompilerThread0のnative malloc失敗で停止。メモリ約5GiBを使うCodexの読み取り専用git statusプロセス40604を、コマンドがstatus --ignored/--untracked-files=allであることを確認して停止し、他のビルドは停止せず空きを確保。`TieredStopAtLevel=1`を付けた通常Lint付き統合ビルドは成功（5m19s、`build/combined-gestures-captcha-c1-build.log`）。このJava実行オプションは開発PCのビルド時だけで、Androidアプリには持ち込まない。対象15ソースのハッシュがビルド前後で同一であることも確認。

242元APKへ適用/再構築/署名成功。完成APKでnativeタブfactoryの元レジスター/オペランド/分岐先/Fragment rebasingと、投稿後の下書き保存wrapperが本体onPauseと同じwriterへ正しいowner/forceレジスターで委譲することを検査して成功。

2026-10-26 23:17頃JST、XIG05/730eae72の既存resumefix242を署名一致install-r Success、データ保持。TabletHomeActivity cold起動Status ok、PID3607。今回のAPKは最新CAPTCHA/計算ダイアログ/投稿成功後処理とジェスチャー6操作を両方含む。

`frida-tool-tab-new-blank242.js`は実機で19項目成功。HOME/スレ両ペインにfixtureツールを作り、追加先設定を逆にしても実所属ペインへ本体type3空タブを追加すること、fixture削除後の元タブ数復帰を確認。テスト設定を復元し、fixtureタブを除去。以後XIG05が切断され、ADBがMi Note10/d5497008へ切り替わったため、閲覧履歴の実WebView試験は実行できず、別端末を操作していない。スワイプ3操作のユーザー確認「良さそうです」と、今回の本体API試験を区別する。今回追加した戻る/進む/新しいタブの実スワイプ、実サイトの認証/投稿成功、最終のcrash log取得は未確認。配布公開はしていない。APK/MPP/署名の全情報は導入台帳。

## 設定と対応範囲

Haiagaru設定の「言語・基本設定」に「追加画面のタブでChMateのジェスチャーを使う」を追加。保存キー `nativeToolTabChMateGestures`、初期false、次のタッチから反映、再起動不要。設定共有・初期化・エキスパートの共通カタログ・広告だけの設定プリセットにも接続。

- オン: ChMateの `gesture` / `gestureLength` / 保存済み軌跡を使う。最初の対応操作は「タブを閉じる」「左のタブ」「右のタブ」。左右は操作したFragmentの実所属ペインで処理し、現在のHOME/スレ追加先設定に依存しない。ロック解除確認は本体APIへ委譲。
- オンの間は固定方向のタブ移動とHissi WebView独自履歴スワイプを止める。ChMate全体のジェスチャーオフも尊重する。認識器の解決に失敗した場合も、勝手に固定方向操作へ切り替えない。
- オフ: 従来の固定スワイプ経路を使う。
- 「戻る/進む」を左右タブへ読み替えない。「新しいタブ」や更新・先頭/末尾・その他アクションは今回未対応。PR #93の全体をマージ/完成させたものとは扱わない。

## 認識と画面破棄

[PR #93](https://github.com/areteruhiro/Haiagaru-Morphe/pull/93) の本体認識器を再利用する提案を活かし、終了時の通知受付とタッチ配送を改めた。

191の元認識器はUPで完了通知RunnableをHandlerへpostする。各DOWNに専用の認識器/リスナーを持たせ、UPで認識完了となった場合だけUPのコピーを保持し、ネイティブ通知の後にfinalizerをpostする。対応割り当てが確定した場合は子へCANCEL、未割り当て/未対応なら元UPを配送する。その配送が戻ってから本体タブAPIを呼ぶ。

次のDOWN、複数指、CANCEL、長押し、フォーカス喪失、detach、設定オフ/Activity終了では古いセッションを無効にする。古いリスナーの通知が新しいタッチに作用することを防ぐ。ChMateの他の割り当てとの重複がある場合は、勝手にタブ終了へ読み替えない。

## 確認

- `python scripts/test-tool-tab-gestures.py`: 本番JavaクラスをAndroid APIと認識器のfakeでコンパイルし26項目成功。同期/非同期通知、子CANCEL後の終了、未対応時UP保持、設定オフ、次タッチへの古い通知、左右別割り当て、長押し/複数指、detach/フォーカス喪失、失敗後の復帰など。Androidの実認識精度を証明するテストではない。
- `VerifyVideoGestureProfile.java`: 191/226/242の元APKで認識器コンストラクター・touch・distanceの一意性を確認。
- `VerifyNativeToolTabClose.java`: 同3版のFragment指定本体終了経路を確認。UI試験ではない。
- 通常ビルドの最初の試行は、並行作業中のExternalBoardAuthがPage.captchaを参照し、Page側がまだ未更新のため失敗。他作業のファイルは変更しなかった。
- HEAD `df758a3` を `build/tool-tab-gestures-project` へ展開し、今回の5つのJavaファイルだけを重ねた分離ビルドは、通常Lint込み`:patches:buildAndroid`成功（5m28s）。このスナップショットは主開発先配下の検査用で、別の開発先ではない。他チャットの認証画面の未コミット変更を含まない。
- ローカル候補 `build/tool-tab-gestures.mpp` は生成名1.13.0-dev.1だが、公開1.13.0-dev.1とは異なる。公開版の置換なし。

## 242導入・端末検査

2026-10-26 21:59頃JST、XIG05/serial `730eae72` の既存検証package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` へ署名一致install-r Success、データ保持。TabletHomeActivityのcold起動Status ok。完成APKのnativeタブfactoryについて元レジスター/命令オペランド/分岐先/Fragment rebasing検査成功。

実機のGENERAL設定Viewで追加スイッチの初期OFF・ON保存・OFF保存を確認。実スワイプ検査は未完了。最初のattach前の終了はexit-infoに21:59:27 LOW_MEMORYとして記録されており、製品Java例外とは確認されていない。再起動後は設定の4項目まで成功したが、タブViewが生成されずfixtureが中断。端末のwindow focusを確認するとNotificationShadeが前面だった。UIツリーの再表示待機・開始前のフォーカス検査・fixture Intentへの識別マーカーを試験側に追加したが、タブ操作成功としては数えない。

試験で変更したChMateジェスチャー値とHaiagaruの2キーは元の有無/値へ復元。通知パネルの開閉は行わなかった。初期のマーカーなし試験で残った空Intent（`intent:`）付きのローカルアドレスフォーム2タブは、tool/ペイン/request URI/空launchを照合して本体削除APIで除去。検索結果・実スレタブは対象外。新しい試験では識別マーカー付きの自作タブを記録して後始末する。

191/226の実操作・242の実スワイプ/タブロック・通常スレ本文/画像の通し再検査は未実施。今回の変更の公開/PRへのpushなし。
