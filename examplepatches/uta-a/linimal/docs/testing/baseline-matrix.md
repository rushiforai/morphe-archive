# ベースラインテストマトリクス

## ローカル決定論的チェック

| チェック | 期待結果 | コマンド |
| --- | --- | --- |
| Preflight の完全一致入力 | APKM、全 split、manifest、DEX/native library、正式署名が一致 | `python3 scripts/preflight_reference.py --apksigner /path/to/apksigner` |
| Preflight 回帰テスト | zip slip、重複/想定外 entry、サイズ/展開率制限、descriptor/signature parser を拒否/検証 | `python3 -m unittest tests/test_preflight_reference.py` |
| 不正な入力 | 任意の hash、entry、package、version、SDK、split、署名不一致で非 0 | CI fixture またはローカル隔離コピー |

本物の APKM は Git とテスト fixture に含めない。preflight は読み取り専用入力を使い、展開物を残さない。

## 2026-09-01から2026-09-02の統合検証

exact LINE 26.11.0 arm64-v8a APKMへMorphe Desktop CLI 1.14.0でLinimalを適用した。

| チェック | 結果 |
| --- | --- |
| `./gradlew --no-daemon test buildAndroid` | Pass |
| exact APKM preflight | Pass |
| Morphe patch、rebuild、sign | Pass |
| embedded Patch Status 33件 | 全件 `OK` かつ expectedとactualが一致 |
| Shopping、Home Performance Ad、Agent iとLINE AIの追加9 PatchId | 全件 `OK` |
| patched DEX本数 | 14本 |
| 全DEXの `dexdump -f` | Pass |
| 全DEXの `d8 --min-api 32` | Pass |
| extension DEX内の非Linimal class | 0件 |
| extension DEX内のKotlin class | 0件 |
| `LinimalSettingsActivity` | manifest登録済みで `android:exported=false` |

Home headerの最初の統合適用では、高位parameter register `v26` を非range invokeへ渡したためMorpheがinvalid registerを報告した。hook呼出しを `invoke-static/range { p1 .. p1 }` へ修正した。再適用では警告が消え、Home headerを含む全Patch Statusが `OK` になった。

最初の実機起動ではSmart Channel rebindの注入がmodel参照 `v0` をboolean結果で上書きし、`rb0.c.invoke()` のoffset `0xBA` でART `VerifyError`になった。rebind hookをrenderer objectの同型変換へ変更した。OFFまたはcleanup失敗時は元rendererを返し、抑制成功時だけnullを返す。これによりmodel registerを変更しない。

修正後のpatched DEXでは次のflowを確認した。

```text
rendererForBinding(Object): Object
move-result-object renderer
if-eqz renderer, afterBind
invoke-interface renderer, model
```

XIG07、arm64-v8a、Android SDK 36へ上書きinstallした。cold startは成功し、processを維持した。`cmd package compile -f -m verify`も成功し、logcatのVerifier errorは0件だった。

その後Walletタブを初めて表示した際、`WalletV3GrandDesignHeaderView.o()` のoffset `0x1F`でART `VerifyError`が発生した。Agent i stateを`Object`戻り値のhookへ通した直後に具体型が失われ、`setAgentIButtonState`が要求する`WalletV3GrandDesignHeaderView$a`と一致しなかったことが原因である。hookの`move-result-object`直後へ専用state型の`check-cast`を追加した。

修正版ではpatched DEXが次の順序であることを確認した。

```text
adjustButtonState(Object): Object
move-result-object state
check-cast state, WalletV3GrandDesignHeaderView$a
setAgentIButtonState(state)
```

修正版も全33 Patch Statusが`OK`でexpectedとactualが一致した。全14 DEXの`dexdump -f`と`d8 --min-api 32`が成功した。同じ署名鍵でXIG07へ上書きinstallした後、ミニアプリタブを選択してWallet headerを実際にinflateしてもprocessは維持された。logcatのWallet `VerifyError`と`FATAL EXCEPTION`は0件であり、`cmd package compile -f -m verify`も成功した。

patched APKと抽出DEXは一時ディレクトリだけに置く。Gitへ追加しない。

## 2026-09-02 第1弾バグ修正の実機検証

実機レビューで受けた8件のうち、バグ修正6件を第1弾として実装し XIG07 へ上書き install した。

| チェック | 結果 |
| --- | --- |
| `./gradlew --no-daemon test buildAndroid` | Pass |
| exact APKM preflight | Pass |
| embedded Patch Status 34件 | 全件 `OK` かつ expectedとactualが一致 |
| patched DEX本数 | 14本 |
| 全DEXの `dexdump -f` | Pass |
| 全DEXの `d8 --min-api 32` | Pass |
| 新規DEXのclass構成 | 114件。Linimal 82件とstripされたLINE本体 32件。Kotlin class 0件 |
| 上書きinstall | Pass |
| ART全DEX verify | Pass |
| cold start | Pass。`FATAL EXCEPTION` と `VerifyError` は0件 |

preflight はbuild-tools 37.0.0のapksignerでのみ成功する。36.1.0と36.0.0は base.apk のv3.2署名を報告せず失敗する。

`--verify-with-sdk` を付けるとMorpheのcross-DEX検証が19件を報告して停止する。すべてLINE本体に元からあるWear SDKとSentryのoptional依存であり、元APKの全DEXにも定義がない。Linimalの変更とは無関係のため、当該オプションを外して適用し、dexdumpとd8を手動で実行した。

### 指摘6件の実測

| 指摘 | 結果 | 実測 |
| --- | --- | --- |
| 1 Smart Channel の空白 | 解消 | `smart_ch_content_view` が消え、`banner_container` は `[0,438][1220,458]` の20pxのみ。トーク一覧の先頭が y=803 から y=458 へ 345px 上へ詰まった |
| 2 設定ラベルの重なり | 解消 | inset 修正後にヘッダーが `[0,138][1220,320]` へ収まり、戻るボタン `[0,151][156,307]` のタップで Chat から Root へ戻る |
| 3 chip bar | 解消 | `chat_ui_ai_talk_suggestion_chip_bar` が消え、入力欄が `[404,2370]` から `[404,2514]` へ 144px 下がった |
| 4 検索欄右の Agent i | 解消 | ボタンのノードが消え、検索ボックスの右端が 1036 から 1167 へ広がった |
| 7 設定の Agent i 行 | 解消 | 個人情報が 年齢確認 で終わり、バックアップ・引き継ぎ が上に詰まった |
| 8 システムバック | 解消 | Chat ページから Root ページへ戻る |

指摘2は最初の適用では部分解消だった。ActionBarなしテーマにしたことでedge-to-edgeになり、window insetがcontentへ適用されずヘッダーがstatus barと重なって戻るボタンを押せなかった。rootへ `WindowInsets.Type.systemBars()` と `displayCutout()` のinsetをpaddingとして入れて解消した。

再適用後の確認では、Patch Status 34件すべて `OK`、install と cold start 成功、Chatからsystem backでRoot、Rootからsystem backでLINE設定への遷移、ヘッダー戻るボタンでのChatからRootへの遷移をいずれも確認した。

指摘7が実機で効かなかった真因は注入位置だった。dexlib2の `addInstruction(index, insn)` は新しい `MethodLocation` を挿入し、既存locationが `Label` を保持したまま後ろへずれる。boxingの合流点へ注入したため `goto` がhookを飛び越え、true経路がそのまま `Boolean.TRUE` を返していた。注入位置を唯一の `return-object` 直前へ移し、分岐先アドレスと一致しないことをshape検証へ追加した。

### 設定OFFでの復元確認

利用者の許可を得て、主要featureを一時的にOFFへ切り替え、公式の表示へ戻ることを確認した後にONへ戻した。

| Feature | OFFでの実測 |
| --- | --- |
| Smart Channel | `banner_container_root` が `[0,438][1220,803]`、`smart_ch_content_view` が `[0,438][1220,783]` へ復元 |
| トーク一覧の Agent i | 検索欄が `[52,298][1036,438]` へ戻り、Agent i ボタン `[1034,299][1190,438]` が復元 |
| 設定の Agent i | `Agent i` 行 `[166,2108][343,2182]` が復元し、`バックアップ・引き継ぎ` が `[0,2231][1220,2400]` へ下がる |
| チャット入力欄の Agent i | `chat_ui_ai_talk_suggestion_chip_bar` が復元 |

## 2026-09-02 Home Feed広告の追加修正

Home下部に残っていた `GcsAdModuleController` の動画広告を、既存の「ホーム内の広告を表示しない」設定へ統合した。

| チェック | 結果 |
| --- | --- |
| `./gradlew --no-daemon test buildAndroid` | Pass |
| exact APKM preflight、Morphe適用 | Pass |
| embedded Patch Status 38件 | 全件 `OK` かつ expectedとactualが一致。新規GCS Ad gateは `1/1` |
| 全14 DEXの `dexdump -f` / `d8 --min-api 32` | Pass |
| 上書きinstall、ART全DEX verify、cold start | Pass。`FATAL EXCEPTION` と `VerifyError` は0件 |
| Home初回表示 | `ad_view`、`ad_header`、`sponsor`、`gcs_video_view`、`video_view` は0件 |
| タブ往復、pull-to-refresh後 | 同じ広告ノードは0件 |

広告request、database、expiration、trackerは変更せず、専用controllerが表示用に生成したsingleton item listだけをON時に空にする。

## 2026-09-02 第2弾新機能とHome広告拡張の実機検証

第2弾の2機能とHome広告の拡張を含む最終ビルドを XIG07、arm64-v8a、Android SDK 36 へ上書き install し、LINE 26.11.0 patched として確認した。

| Linimal設定 | featureId | 設定ページ |
| --- | --- | --- |
| ホーム投稿カード | `linimal.home-feed-post-cards` | Home |
| プレミアム設定行 | `linimal.premium-settings-row` | General |

| チェック | 結果 |
| --- | --- |
| 端末上のAPKから直接読んだ embedded Patch Status 38件 | 全件 `OK` かつ expectedとactualが一致 |
| 全14 DEXの `dexdump -f` | Pass |
| 全14 DEXの `d8 --min-api 32` | Pass |
| 上書きinstall、ART全DEX verify、cold start | Pass。`FATAL EXCEPTION` と `VerifyError` は0件 |

### 対象別の成立数

| 対象 | 結果 |
| --- | --- |
| ホーム投稿カード | `OK` 3/3 |
| プレミアム設定行 | `OK` 2/2 |
| Home広告 module-gate | `OK` 1/1 |
| Home広告 catalog-gate | `OK` 2/2 |
| Home広告 gcs-ad-module-gate | `OK` 1/1 |

### 実機での実測

| 対象 | 実測 |
| --- | --- |
| ホーム投稿カード | ホーム下部の動画カードと `友だち追加` の見出し行が消えた |
| Home広告 | 4画面ぶんスクロールしても広告ノードは0件 |
| プレミアム設定行 | LINE設定から `LYPプレミアム` 行が消え、以降の行が上に詰まった |

### 設定OFFでの復元確認

利用者の許可を得て、2機能を一時的にOFFへ切り替え、公式の表示へ戻ることを確認した後にONへ戻した。

| Feature | OFFでの実測 |
| --- | --- |
| ホーム投稿カード | ホーム下部の動画カードと見出し行が元の表示へ復元 |
| プレミアム設定行 | LINE設定の `LYPプレミアム` 行が元の位置へ復元 |

プレミアム設定行は実機で LYP variant のみ表示されるため、LINE variant は未確認である。

## 2026-10-10 「既読をつけずに読む」の閲覧セッション修正

一時 pause と30分経過で解除していた抑制を、検証済みトーク Activity の閲覧セッションへ移した。
対象APKで `chatHistoryRequest`、公開 `getChatId`、standard / CLEAR_TOP の起動経路を確認した。

| チェック | 結果 |
| --- | --- |
| Gradle 全テスト・`buildAndroid` | Pass。キャッシュ済み依存を使った `--offline --no-daemon` 実行 |
| JVM smoke: pause / resume、確定後30分超 | Pass。どちらも `shouldBlock=true` |
| JVM smoke: token による構成変更移管、古い destroy | Pass。新しい所有者の抑制を維持 |
| JVM smoke: 終了後の通常再入室、未確認予約の期限、OFF→ON | Pass。どれも `shouldBlock=false` |
| exact APKM への Morphe Desktop CLI 1.14.0 適用・rebuild | Pass。署名せず一時APKとして生成 |
| embedded Patch Status | 53件すべて `OK`、expected と actual が一致。session patch は `2/2` |
| トーク画面の生成DEX | `super.onCreate` → `onChatCreated` → `SDK_INT` の順。registers=16、hook は range で `v14 .. v15` を渡す |
| 全14 DEX の `dexdump -f` / `d8 --min-api 32` | Pass |
| 実機の相手側既読・ローカル未読バッジ・Android lifecycle 配送 | 未実施。ADB 接続端末なし |

最初の統合適用は新session patchだけ `ERROR` だった。Fingerprint の filters が命令順に評価されるのに、
`chatUiComponentProvider` を `getIntent` / `getExtras` より先に並べたことが原因だった。
対象DEXで確認した順序へ修正し、再適用で `OK 2/2` と実際の hook 注入を確認した。
Morphe の「Applied」ログだけでは成功扱いせず、embedded status と生成DEXも確認した。

APK・抽出DEX・解析用コードは一時ディレクトリだけに置き、検証後に削除した。

## 2026-10-12 通知から既読をつけずに開く

独立した初期 OFF の設定を既読ページへ追加した。
通知 request の marker を起動 dispatch 時に確認し、メニュー設定 OFF でも既読なしセッションを開始する。

| 確認項目 | 結果 |
| --- | --- |
| Java17 / offline の `test buildAndroid :patches:generatePatchesList` | Pass |
| 通知のみ ON、通常入室、30分超の閲覧、構成変更、OFF→ON、終了の JVM smoke | Pass |
| 対象26.11.0 APKM の unsigned Morphe 統合適用 | Pass |
| embedded patch-status | 57件すべて OK。通知 entry 4/4、送信1/1、ローカル1/1、session2/2 |
| 全14 DEX の `dexdump -f` / `d8 --min-api 32` | Pass |
| 実機の設定表示・独立ON/OFF・再入場時の保存 | Pass。XIG07 / Android16（SDK36）、通知のみONを確認 |
| 同一署名での上書きinstall・ログイン状態維持・ART verify | Pass。データ消去なし、`cmd package compile -f -m verify` 成功 |
| 実際のメッセージ通知tap・一時背景移行後の復帰 | Pass。対象トークのメッセージ表示、同一process維持 |
| 通知から閲覧して閉じた後のローカル未読 | Pass。トーク一覧の対象行に未読数1を確認 |
| 通知から閲覧したときの相手側既読・通知バッジ | Pass。ユーザーが送信側の既読なし・通知バッジ正常を確認 |
| 閉じた後の通常再入室での解除 | Pass。対象行の未読数が消え、送信側にも既読が付いたことをユーザーが確認 |

Gradle の実行JDK26では Android JdkImageTransform が失敗したため、repository 指定のJava17で実行した。
既読ページの1行だけという旧カタログテストは表示内容の固定なので削除し、
設定の独立保存・必須patch不足・入口別失効・通常再入室などの動作を検証した。
一時APK・DEX・逆コンパイル結果・smoke scriptは検証後に削除した。

実機確認後は既存設定（メニューON、通知OFF、自動既読停止OFF）へ戻した。
同一processのログ上で `FATAL EXCEPTION` / `VerifyError` は0件。

## 2026-10-13 既読なし閲覧中の送信と入室案内

設定を増やさず、メニュー／通知から既読なしで開いたトークでも、
チャット UI がメッセージを送信キューへ投入したときに抑制を終了して既読を反映する。
入室時はチャット上部に一時的な案内を重ねる。

| 確認項目 | 結果 |
| --- | --- |
| Java17 の `--no-daemon test buildAndroid` | Pass |
| メニュー／通知セッションの送信後解除、別トーク・予約・古い snapshot の拒否 | JVM regression Pass |
| 自動既読停止との一回限りの許可・対象 chatId の一致・終了時の破棄 | JVM regression Pass |
| キュー投入を迂回する分岐への誤注入拒否・request register 維持 | patch regression Pass |
| 対象26.11.0 APKM の Morphe 統合適用 | Pass。初版は両 `send` が16/16、実機修正版は15/15・全59件OK |
| Android エミュレーター上の全14 DEX の `dex2oat64 --compiler-filter=verify` | Pass |
| 一時 Activity 上の入室案内 | Pass。上部表示、通常入室では非表示、約5秒後の消去をスクリーンショット確認 |
| 一時 Activity 上の送信時 runtime 動作 | Pass。抑制解除・worker 上の bridge 呼び出し・案内消去を確認 |
| XIG07 / Android16 への同一署名上書き更新 | Pass。署名 SHA-256 一致、`adb install -r` 成功。データ消去なし |
| 実機の ART 全DEX verify | Pass。`cmd package compile -f -m verify` 成功 |
| 実機のログイン状態・既読なし入室時の案内 | Pass。トーク一覧へ復帰し、「Linimal」トークの長押し入室でダーク配色の上部案内を確認 |
| 実機の案内消去・トーク画面維持 | Pass。案内の自動消去後もトークを表示。LINE process 維持、crash buffer の LINE 例外0件 |
| 実機で閲覧中に受信したメッセージの既読抑制 | Pass。受信 `hi` の表示を確認し、送信側に既読なしとユーザーが確認 |
| 返信前のローカル未読維持 | Pass。退室後も対象トークの未読数1を確認。既読なしで再入室した |
| 実機の送信後の既読・未読解除 | 修正版 Pass。テキスト返信後の相手側既読をユーザーが確認。対象トークの未読バッジ消去と、下部タブの未読数2→1（別トークの1のみ残る）も確認 |
| 既読観測と送信の順序、既読位置の後退防止、構成変更時の引継ぎ | 修正版の JVM regression Pass |
| wide 既読位置と高位 parameter register の維持 | 修正版の patch regression Pass |

一時 Activity の送信 bridge は観測用の代替であり、LINE の通信成功を検証したものではない。
自動既読停止との優先関係を確認するため、その smoke の asset に限って patch-status を
完全適用 fixture にした。実際の統合 APK は変更していない。
Morphe CLI 1.18.1 の unsigned APK では `read-receipts-main-chat-manual-caller` が
`ReadReceiptManualCallerStateMachineMismatch` の ERROR を記録した。
一方、従来の実機更新に使用していた CLI 1.14.0 で同じバンドルから生成した署名付き APK は、
全59件が OK・expected/actual 一致となった。この APK を既存署名鍵で実機へ更新した。
既存の manual-caller パッチ本体は今回変更していない。

初版の実機では、抑制する既読入口へ到達しても factory 由来の reader がないことを
一時診断ログ `read-attempt factory-reader=false` で確認した。
Rx supplier の作成時にしか executor を登録していなかったため、送信時に既読処理を起動できなかった。
修正版は、実際に抑制する `d(J, String, Z)` の入口で executor と既読位置をセッションへ保存する。
送信が既読観測より早い場合も後続の観測から一回だけ反映し、送信後の DB 再検索はしない。
一時診断 hook とログは削除済み。全テスト・ビルド・signed APK 生成・実機 ART verify は Pass。
修正版の実機テキスト返信後、ユーザーが送信側の既読反映を確認した。
トーク一覧では対象トークの未読バッジが消え、別トークの未読1だけが維持された。
同一 process が継続し、crash buffer の LINE 例外は0件。
今回の実機送信確認はテキストと長押し入室の組合せであり、
スタンプ・画像・通知入室との組合せは個別の実機確認を行っていない。

## 2026-10-13 既読無効の案内を常時表示

約5秒の消去 timer と表示済み token の判定を廃止し、
抑制が有効な閲覧セッションの間は案内を表示し続ける。

| 確認項目 | 結果 |
| --- | --- |
| `--no-daemon buildAndroid`・同一署名更新・実機 ART verify | Pass。全59 patch-status OK |
| 実機で8秒以上経過後の上部案内 | Pass。以前の消去時間を越えて表示が維持される |
| 別アプリから同じトークへ復帰 | Pass。既読無効セッションを維持し、案内を再表示 |
| 案内下の戻るボタン・退室時の消去 | Pass。タッチ操作を遮らず、トーク一覧では非表示 |
| 通常操作による再入室 | Pass。既読無効セッションではないため案内を表示しない |

## 2026-10-13 送信後も既読を無効にする設定

既読ページに「送信しても既読を有効にしない」を追加した。初期値は OFF。
メニュー・通知からの既読なし閲覧に共通で作用し、通常入室は変更しない。
設定画面には、閲覧・返信しても相手側が未読表示のままとなり、
誤解やトラブルにつながる可能性と未読バッジが残ることを明記した。

| 確認項目 | 結果 |
| --- | --- |
| `--no-daemon test buildAndroid :patches:generatePatchesList` | Pass |
| 新規インストールの OFF・v3→v4 の既存設定維持・保存と再読込 | JVM regression Pass |
| 新キーの不正型・書込み失敗・既読なし feature が未適用の fail-open | JVM regression Pass |
| ON の送信では既読反映を予約しない・OFF 後の次の送信で反映 | JVM regression Pass |
| 対象 APKM への署名付き統合適用 | Pass。リリース v0.6.0 のバンドルでも Morphe Desktop 1.14.0 で全59 patch-status OK、expected / actual 一致を確認 |
| エミュレーター上の実際の Linimal 設定画面 | Pass。初期 OFF とリスク説明をスクリーンショット確認 |
| Android 上の ON→設定再入場→OFF の保持と runtime hook | Pass。ON は抑制維持、OFF は worker で既読 bridge を呼び抑制解除 |
| 上部案内の設定連動 | Pass。ON は「送信しても既読はつきません」を維持し、OFF の送信で案内を消去 |
| 新設定の実機上書き更新・ART verify | 2026-10-14 Pass。XIG07 に同一署名 APK を `install -r` で適用し、`cmd package compile -f -m verify` 成功 |
| 実機の初期 OFF・リスク説明・既存設定維持 | 2026-10-14 Pass。実際の既読ページでスクリーンショット確認。既存のメニュー・通知設定は ON のまま、新設定だけ OFF |
| 実機の設定再入場による ON/OFF 保存確認 | 2026-10-14 Pass。ON と OFF の両方を再入場後に確認し、終了時は OFF に戻した |
| 新設定 ON の実際の LINE 送信と相手側既読 | 未確認。確認のための外部メッセージは送信していない |

Android runtime の送信 bridge は一時 Activity の観測用代替であり、
この新設定 ON/OFF について LINE のネットワーク送信を実機検証したものではない。
新規 FeatureId / PatchId は追加せず、既存のメニュー／通知 feature の適用状況で操作可否を決める。
schema4 の移行は新キーが未設定の場合だけ false を書き、他の値を変更しない。

## 2026-10-22 メッセージ単位と現在のトーク全体の手動既読

既読なしで開いた通常トークに、受信メッセージの「ここまで既読にする」と、
上部案内の「このトークをすべて既読にする」を追加した。
個別操作は指定位置以前の累積既読、全体操作は公式の位置検索と未読解除を使う。
どちらも閲覧セッションを終了せず、後続の自動既読は抑制したままにする。

| 確認項目 | 結果 |
| --- | --- |
| Java17 / `--no-daemon --offline test buildAndroid` | Pass。キャッシュ済み依存を使用 |
| 累積既読・非正位置拒否・処理中の重複拒否・失敗後の再操作 | JVM regression Pass |
| 構成変更時の進捗保持・再入室時の破棄・chat/thread/token 限定・例外時の許可破棄 | JVM regression Pass |
| 生成 bridge の wide register・range invoke・全体位置の最大値選択・catchall | patch regression Pass |
| 必須 patch 欠落／PARTIAL 時の利用不可と依存鎖 | JVM / patch regression Pass |
| 対象26.11.0 APKM の Morphe Desktop 1.14.0 unsigned 統合適用 | Pass。全63 patch-status OK。manual-read / message-controls は通常・通知とも2/2 |
| XIG07 / Android16 の `dex2oat64 --compiler-filter=verify` | Pass。初回は統合 APK を一時領域で検証 |
| 独立した一時 Activity のメッセージ別ボタン・全体ボタン | Pass。実 runtime の Button を操作し、選択位置101と全体位置150を worker に渡すことを確認 |
| 操作後の抑制維持・進捗更新・後続位置の未読維持 | Activity smoke Pass |
| 完了した行のボタン除去・通常モードのボタン／案内除去・追加上余白の復元 | Activity smoke / screenshot Pass |
| 別 chatId への行再利用・送信行への非表示 | Activity smoke Pass |
| 配色・案内とメッセージの非重複 | screenshot Pass。端末ダークモードとホストの明色 Button theme の組合せも確認 |
| XIG07 への同一署名上書き更新・ART verify・起動 | Pass。既存署名 SHA-256 と一致、署名付き APK も全63 status OK。`adb install --no-incremental -r` と `cmd package compile -f -m verify` が成功。MainActivity の起動と process 維持、当該 process の AndroidRuntime error 0件を確認。データ消去なし |
| 実際の LINE の新ボタン表示・相手側の既読・部分既読後の未読件数 | 未確認。上書き後は MainActivity の起動確認まで。外部メッセージの送信や手動既読ボタンの実操作は行っていない |

一時 Activity は共通行と同じ FrameLayout → 縦 LinearLayout を用い、
統合 APK からそのまま取り出した patch-status と実 runtime を使用した。
reader の bridge だけは呼び出しを観測する代替であり、LINE の RPC 成功を検証したものではない。

初回の実表示では、ホストの明色 Button 背景にダーク配色の文字を重ねたためコントラストが不足した。
背景にも LinimalPalette を適用して再確認した。
また、worker の進捗更新だけでは次の描画が発生せず、全体既読後のボタンが残ることを確認した。
現在の所有 Activity へ再描画を要求するように修正し、完了後のボタン除去を
Activity 内の assertion とスクリーンショットの両方で確認した。

新規の設定キー・migration・release version の変更はない。
検証用アプリは端末から削除し、一時 APK・DEX・署名鍵・逆コンパイル結果・smoke script も削除した。

## 手動既読 UI の A案

個別操作を時刻の下の小さな文字リンク「既読にする」に変更した。
各メッセージの水平線と塗りつぶしボタンは使わず、「ここまで既読」の境界線だけを残す。
初期位置は adapter の入室時 read_up を採用し、既読済み行に操作を付けない。
全体操作は入力欄の上に「すべて既読にする」をフローティング表示する。

| 確認項目 | 結果 |
| --- | --- |
| Java17 / `--no-daemon --offline test buildAndroid` | Pass |
| 最終バンドルの対象26.11.0 APKMへの統合適用 | Morphe Desktop 1.14.0でPass。署名付きAPKの全63 patch-statusがOK。通常・通知のmessage-controlsはいずれも2/2 |
| 署名 | `apksigner verify --print-certs` Pass。以前の上書き用と同じSHA-256 `24b512b8b166fc38b9bb4bebaafcdac3eda4d989ddd01bb2eea23bc7ec717fe6` |
| 未読だけの文字リンク・時刻との位置合わせ・個別の水平線なし | Pixel_10 AVDの一時Activityでassertionとスクリーンショットを確認 |
| 初期既読2件・未読3件・送信1件 | 未読の受信3件だけに操作。初期境界は1本 |
| 位置102の個別操作 | 101・102の操作を除去し、120の操作を維持。境界を102の後ろへ移動。抑制を維持 |
| 全体操作 | 残る個別操作を除去し、最終受信位置120の後ろに境界を1本表示。抑制を維持 |
| フローティングと入力欄拡大 | 64dp・120dpの入力欄で、上端から8dp以上離して表示 |
| 操作領域・文字拡大・横画面 | 最低48dp四方を確認。通常縦画面・fontScale 2の専用Activity・横画面Activityで上記操作のsmokeがPass。各画面を撮影確認 |
| 実機への今回の上書き・実際のLINE内の表示・相手側の既読 | 未実施。実機はADB未接続。エミュレーターには独立した検証用アプリだけを導入 |

一時Activityは実runtimeと統合APKのpatch-statusを使用する。
メッセージ・時刻・入力欄は検証用のViewであり、reader bridgeは呼び出し位置を観測する代替。
実際のLINEのRPC成功や全メッセージ形式の表示を確認したものではない。
今回の署名付きAPKはリポジトリ外の `/Users/uta_a/morphe/line-linimal.apk` に生成した。
設定schema・既存値・release versionは変更していない。

## 上部案内によるヘッダー移動と最新の個別操作の重なり

実機の現在画面で、案内が公式ヘッダーより上に置かれて画面全体を押し下げることと、
全体既読ボタンが最新メッセージの個別操作を覆うことを確認した。
案内は本文の縦コンテナへ挿入し、フローティングの高さ分はメッセージ一覧の下余白で確保する方式に変更した。

参照APKの「ヘッダー／本文内の縦レイアウト／重み付き一覧／入力欄」を再現した一時Activityで、
変更前後のruntimeを切り替えて同じ画面を操作した。既読ボタンは押していない。

| 確認項目 | 変更前 | 変更後 |
| --- | --- | --- |
| 案内表示後のヘッダー移動量 | 下へ362px | 0px |
| 一覧末尾の個別操作と全体既読ボタン | 操作領域が重なる | 個別操作の下端から全体ボタン上端まで21px（8dp）確保 |
| 入力欄を64dpから120dpへ拡大 | — | ヘッダー固定・個別操作の非重複をassertionと撮影で確認 |
| 案内を閉じた後 | — | 一覧の元の下余白9dpを復元。Window全体の上余白は不変。本文から案内を除去 |

- Java17の `--no-daemon --offline test buildAndroid` はPass。
- Morphe Desktop 1.14.0で対象26.11.0 APKMへ再適用し、署名付きAPKの全63 patch-statusがOK。
- `apksigner verify --print-certs` はPass。上書き用の既存署名と同じ証明書。
- 一時Activityの検証端末はPixel_10 AVD。一覧はScrollViewによる検証用Viewであり、実際のLINEのRecyclerViewではない。
- 実機再接続後、XIG07へ `adb install --no-incremental -r` で同一署名の上書き、ART verify、MainActivity起動が成功。データ消去なし。
- 実際のLINEの長押しメニューから「既読をつけずに読む」を選び、ヘッダーの下に案内があることと、最新の個別操作が全体ボタンに隠れないことを撮影・UI階層の座標で確認。既読操作は押していない。
- 実機の個別操作の下端と全体ボタン上端の間隔は26px。入力欄の座標は修正前後で不変。当該processのAndroidRuntime errorは0件。
- 修正版APKはリポジトリ外の `/Users/uta_a/morphe/line-linimal.apk` に生成した。

## 2026-11-02 LINE 26.16.0 移行の実機確認

XIG07（Android SDK 36）へ `~/morphe/linimal.keystore` で署名した APK を上書き install した。データ消去なし。
実アカウントのため、トークルーム内の確認は利用者が手で行った。

| 確認項目 | 結果 |
| --- | --- |
| Patch Status | 全 64 件 OK |
| ART verify、cold start、ログイン維持 | Pass。`FATAL EXCEPTION` と `VerifyError` は 0 件 |
| Linimal 設定の表示 | 5 ページの全スイッチが操作可能 |
| 下部タブ、ホーム上部、トーク一覧上部の抑制 | Pass（ホームは確認した範囲でのキーワード照合） |
| 既読なし閲覧中のキーボード追従 | 利用者が修正を確認（`c6c21a1`） |

既読なし閲覧と全体既読（相手側の既読を含む）、自動既読の停止中の送信とリアクション、通知、通話、deep link、入力欄の chip bar、LINE AI の各入口、＋ メニューは、利用者の手動確認で問題なしと報告を受けた（項目ごとの記録なし）。

## 実機成立性ゲート

| ケース | 公式版リファレンス | Linimal統合APK | 結果 |
| --- | --- | --- | --- |
| install / cold launch | Pass | Pass | XIG07へ上書きinstallし、RegistrationActivityまで起動。process維持と重大crash 0件を確認 |
| ART全DEX verify | 未実施 | Pass | `cmd package compile -f -m verify` 成功。Verifier error 0件 |
| login / session restore | Pass | Pending | 端末が未登録状態のため、隔離テストアカウントでの確認が必要 |
| Linimal設定画面と各ON/OFF | 対象外 | Pass | 2026-09-02の第1弾実機検証で全ページの遷移、戻る動作、主要featureのON/OFF切替と復元を確認 |
| text/image/file の送受信 | Pass | Pending | 双方向で確認 |
| foreground/background notification と tap | Pass | Pending | 通知permissionを含む |
| deep link | Pass | Pending | fallbackも確認 |
| audio/video call | Pass | Pending | 実端末間で確認 |
| native library load / restart / process death | Pass | Pending | cold launchはPass。main UI到達後のrestartとprocess deathは未確認 |

`Pending` は未成立を意味し、成功扱いにしない。主要機能に失敗した場合は feature hook の実装へ進まない。

## 個別既読の廃止（2026-11-03）

LINE 26.16.0 の XIG07 で、既読なしで開いたトークの真ん中の行から「既読にする」を実行した。

| 確認 | 結果 |
| --- | --- |
| `c1` の呼び出し | bridge 経由の1回のみ。トークを閉じた後の呼び出しなし |
| 送信位置 | 押した行の位置。最新の受信位置より古い |
| 相手側（公式 Web 版 LINE） | 全行に既読 |

公式スマホ版を受信側にした確認は行っていない。この結果を受け、行ごとの操作は廃止した。

## Google ログインとバックアップのアカウント選択の MicroG-RE 化（2026-11-03）

XIG07（SDK 36）、LINE 26.16.0、MicroG-RE 7.3.0。ブランチ `feat/google-sign-in-microg`（`cc5404f`）を上書きインストールした。

| 確認 | 結果 |
| --- | --- |
| install / ART verify / 起動 | 成功。crash と VerifyError は 0 件 |
| patch-status | 68 件すべて OK |
| 「Google でログイン」 | 成功。`HiddenActivity` → MicroG-RE の `AssistedSignInActivity` → `AuthSignInActivity` → `MainActivity` |
| ログイン後の復元のアカウント選択 | MicroG-RE の `AccountPickerActivity` から本体の選択画面が開き、種別 `app.revanced` のアカウントを選択 |
| Drive の token | MicroG-RE が署名を `89396dc4…5c50` として申告し、`drive.appdata` の token を発行 |

復元とバックアップの完了そのものは、この時点では確認していない。


## 表示系の設定変更後の再起動（2026-11-04）

XIG07（SDK 36、HyperOS）、LINE 26.16.0。同じプロセスから `startActivity` してからプロセスを終了する方式では、開き直した画面も一緒に消えてホーム画面に戻った（遅延 500 ms・即時終了のどちらも同じ）。別プロセス `:linimal_restart` の中継 Activity が元のプロセスを終了してから LINE を起動する方式に変え、次を確認した。

| 確認 | 結果 |
| --- | --- |
| install / ART verify / 起動 | 成功。crash は 0 件 |
| patch-status | 68 件すべて OK |
| 表示系の設定を切り替えて「再起動」 | LINE が自動で開き直り、設定が反映された |

## MicroG-RE の認証エラーの通知（2026-11-04）

XIG07（SDK 36）、LINE 26.16.0、MicroG-RE 7.3.0。v0.10.0 に診断の patch を加えた bundle で生成し、`~/morphe/linimal.keystore` で上書き install した。データ消去なし。

| 確認 | 結果 |
| --- | --- |
| install / ART verify / 起動 | 成功。crash と VerifyError は 0 件 |
| patch-status | 69 件すべて OK（`linimal.patch.google-auth-failure-diagnostics` を含む） |
| 注入位置（生成 APK の `sq/h`） | `Error` を読んだ直後に `onTokenError`、`Could not bind to service.` の直後に `onAuthServiceBindFailed`（差し替え後の ComponentName を渡す） |
| バックアップ設定でのアカウントの選び直し | 成功。MicroG-RE が `drive.appdata` の token を発行し、通知は出ない |
| 「今すぐバックアップ」 | 成功。通知は出ない |
| MicroG-RE を `pm suspend` した状態の「今すぐバックアップ」 | bind は失敗せず、MicroG-RE が保存済みの token を返して成功した。bind の失敗は再現できていない |
| MicroG-RE の token の期限切れ後に、MicroG-RE の通信だけを遮断してアカウントを選び直す | LINE は「LINEにアクセスできません。インターネット接続を確認してください。」を表示し、同時に通知「Google ドライブの認証に失敗しました」が出た。本文は「MicroG-RE がエラー「NetworkError」を返しました。…」と `MicroG-RE 7.3.0 / LINE 26.16.0 / Android 16 (SDK 36)`。メールアドレスと token は含まない |

通信の遮断には `cmd connectivity set-chain3-enabled true` と `set-package-networking-enabled false app.revanced.android.gms` を使い、確認後に両方を戻した。chain を有効にしないと遮断は効かず、MicroG-RE は token を取り直して成功する。MicroG-RE は期限内の token を保存して返すため、期限（発行から 1 時間）が切れるまでは失敗を再現できない。この確認を受けて、`NetworkError` の説明に「MicroG-RE が Google に接続できなかった」場合を加えた。

最初の build では、`getString` が `BaseBundle` のメソッドとして参照されていたことと、bind 先を差し替える hook が同じ register に結果を置くことから、fail-safe により注入されず ERROR になった。どちらも判定を直した。

## 認証エラーの通知の見直し（2026-11-05）

sol のレビューの指摘を受けて、注入の判定（wide 命令による register の上書き、getString のキー）と、通知に載せる値（英字と `_` だけのエラーコードに限る）、重複の抑止（失敗の内容ごと）を直した。XIG07（SDK 36）、LINE 26.16.0、MicroG-RE 7.3.0 に上書き install した。データ消去なし。

| 確認 | 結果 |
| --- | --- |
| install / ART verify / 起動 | 成功。crash と VerifyError は 0 件 |
| patch-status | 69 件すべて OK。診断の patch は `GoogleAuthDiagnosticsGuarded` で、新しい判定でも注入される |
| token の期限切れ後に MicroG-RE の通信だけを遮断してアカウントを選び直す | LINE のダイアログと同時に通知が出た。本文は修正後の `NetworkError` の説明と `MicroG-RE 7.3.0 / LINE 26.16.0 / Android 16 (SDK 36)` |

確認後に MicroG-RE の通信と chain3 を戻した。

## プレビューのスクロール有効化（2026-11-05）

「一般」に初期 OFF の「プレビューをスクロール可能にする」を追加。LINE 26.16.0 のプレビュー描画へ渡す boolean だけを変更し、プレビュー自体の提供条件・課金・通信は変更しない。

| 確認 | 結果 |
| --- | --- |
| Java 17 の全テスト、`buildAndroid`、`generatePatchesList` | Pass。パッチの分岐・handler・register 検査、設定保存・再起動・独立性・設定エラー時の公式挙動を含む |
| exact APKM preflight、Morphe Desktop 1.14.0 適用、署名検証 | Pass |
| embedded patch-status | 全 72 件 OK。`linimal.patch.preview-scroll` は `PreviewScrollGuarded`、1/1 |
| 全 15 DEX の `dexdump -f` と `d8 --min-api 32` | Pass |
| 生成 DEX の注入位置 | `fk3/w0.invoke()` の公式判定結果 `v9` を hook に通して同じ register へ戻すことを確認 |
| JVM smoke | 実 APK の status を読み、初期 OFF、再起動待ち、ON による false→true、元の true の維持、OFF 復帰、status 不在時の保存値無効化を確認 |
| XIG07（SDK 36）の独立検証アプリ | 実 runtime と生成 APK の status で設定画面を表示。スイッチの初期 OFF・操作可能・ON/OFF 保存・再起動案内を UI 階層と撮影で確認。プロセス再起動後の hook は false→true→false、元の true は常に維持 |
| XIG07 の LINE への上書き | Pass。同一署名・同一 versionCode でデータを保持したまま上書き。ログイン維持、cold start 成功、起動後とプレビュー操作後の FATAL EXCEPTION と VerifyError は 0件 |
| LINE 内のプレビュー（設定 ON・再起動後） | Pass。利用者が実アカウントで操作し、問題なくスクロールできることを確認。adb からトークは操作していない |

生成 APK はリポジトリ外の `/Users/uta_a/morphe/line-linimal-preview-scroll.apk`。独立検証アプリは LINE 本体とは別 package・別保存先であり、LINE 内の確認は上の 2 行で別に行った。

## AMOLED テーマ（2026-11-10）

「テーマ」ページを新設し、初期 OFF の「ダークモードの背景を黒にする」を追加。LINE の DEX とリソースは変更せず、夜間設定だけの resource table を `ResourcesLoader` で重ねる（`docs/analysis/amoled-theme.md`）。

| 確認 | 結果 |
| --- | --- |
| Java 17 の全テスト、`buildAndroid` | Pass。arsc encoder の構造、対象の解決・欠落時の縮退・ID 不整合時の無効化、画素の塗り替え、patch の値検証、runtime と patch の対象一覧の一致、設定の保存・再起動反映・status 不在時の無効化を含む |
| encoder の出力を aapt2 で読む | Pass。`aapt2 dump resources` / `dump chunks` で night 設定の color entry として解釈される |
| Morphe Desktop 1.14.0 適用、署名 | Pass。端末の LINE と同じ証明書（SHA-256 `24b512b8…`） |
| embedded patch-status | 全件 OK。`linimal.patch.amoled-theme-colors` は `AmoledThemeColorsVerified`、9/9 |
| XIG07（SDK 36）への上書き | Pass。同一署名でデータを保持。cold start と各画面の操作後の FATAL EXCEPTION と VerifyError は 0 件 |
| 設定 ON・再起動後（ダークモード） | ホーム・トーク一覧で画面の約 96% が `#000000`。下部タブは元の高さ（244px）のまま黒、ナビゲーションバーも黒。トーク「Linimal」はヘッダーと入力欄が黒で壁紙はそのまま。LINE の設定画面、Linimal の設定画面も黒 |
| 設定 OFF・再起動後 | 公式どおり `#111111`（約 96%） |
| 設定 ON でライトモード | 公式どおり白。確認後に端末をダークモードへ戻した |
| 「テーマ」ページ | ルートの「既読」と「一般」の間に表示。項目は「テーマ」にだけあり、「一般」にはない |

途中の版で下部タブを単色（`ColorDrawable`）にしたところ、背景の `ImageView` の高さが 0 になり白い帯が出た。元画像と同寸の PNG に差し替える方式に改めて解消した。

## 設定画面などの多言語化（2026-11-10）

Linimal の設定画面、再起動の確認、既読なし閲覧の案内とメニュー、MicroG-RE の通知を、LINE の表示言語に合わせて日本語・英語・繁体字中国語・タイ語・インドネシア語で表示する。言語は LINE の Application の Resources のロケール（アプリ別の言語設定を含む）から決め、表を持たない言語は英語にする。

| 確認 | 結果 |
| --- | --- |
| Java 17 の全テスト、`buildAndroid` | Pass。ロケールから言語への対応、訳の引き方と英語・原文への戻し方、書式、読み上げ用の区切り、ソース中の日本語の文言 125 件が 4 言語すべての表にあること、使われない訳がないこと、書式指定子と改行の数の一致 |
| XIG07 で LINE のアプリ別言語を en-US に変更 | 設定画面のルート・既読ページ、トーク一覧の長押しプレビューの「Read without receipt」、既読なしで開いた「Linimal」の案内と「Mark all as read」が英語 |
| th-TH、zh-TW、in-ID | 設定画面のルートの各行と読み上げ用の説明がそれぞれの言語 |
| 端末既定（日本語） | 従来どおり日本語。FATAL EXCEPTION と VerifyError は 0 件 |

確認後に LINE のアプリ別言語を未設定（端末の言語に従う）へ戻した。
