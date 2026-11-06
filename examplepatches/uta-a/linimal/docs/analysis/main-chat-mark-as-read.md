# 通常トークの「既読にする」経路と未読バッジ

対象: LINE 26.11.0 (versionCode 261100124) arm64-v8a

## 要点

メイン 1:1 / グループの「既読にする」は 1 つのメソッドに集約されている。難読化名では
`Lq33/e;->d(J, Ljava/lang/String;, Z)V`。このメソッドの中で、ローカルの未読状態の更新と、
相手へ既読を伝える RPC の送信が、この順に実行される。

```
off=0000  if-eqz p4, +0c                          p4(Z) が false なら次を飛ばす
off=0004  invoke-interface Lu13/l;->Y(chatId)V    ローカル未読のクリア
off=0058  invoke-interface Lu13/l;->Q0(J, chatId)V 既読位置 read_up の前進
off=0067  invoke-interface TalkServiceClient->j1(I, String, String)V  sendChatChecked
以降       Lq33/f; の再送キュー (SharedPreferences, PROCESSING / FAILED / SUCCEEDED)
```

registers=10 / ins=5。レジスタ割り当ては `v5=this`, `v6:v7=J`(既読位置のメッセージ ID),
`v8=chatId`, `v9=Z`。

**ローカル更新がサーバ送信より先に、同じメソッドの中で走る。** これが「既読をつけずに読む」で
未読バッジが消えていた原因だった。従来 Linimal が止めていたのは `j1` だけで、その手前の
`Y` / `Q0` は素通りしていた。

## 各呼び出しの中身

| 呼び出し | 実体 | 効果 |
| --- | --- | --- |
| `Lu13/l;->Y(String)V` | `MainChatDataModule.clearUnreadCountBlocking` | 未読件数を消す |
| `Lu13/l;->Q0(J, String)V` | `Lu13/o;->Q0` → `Lw13/i0;->j` | `UPDATE chat SET read_up=? WHERE chat_id=? AND (read_up IS NULL OR read_up='' OR (CAST(read_up AS INTEGER)\|\|''=read_up AND CAST(read_up AS INTEGER) < ?))` |
| `TalkServiceClient->j1(I, String, String)V` | Thrift RPC `sendChatChecked` | 相手へ既読を伝える |

未読は mainchatdata の SQLite `chat` テーブルで表現される。列名レジストリは enum `Lc23/d;` で、
`i=chat_id`, `l=message_count`, `m=read_message_count`, `u=read_up`,
`z=unread_type_and_count`。`unread_count` という列は現行スキーマには無い（同名の列を持つ
`Lda1/c$c;` は旧スキーマの enum、`square_unread_count` は OpenChat、
`notification_center_unread_count` は別機能で、いずれも通常トークのバッジとは無関係）。

## 同定の根拠

難読化名には依存していない。

- `Lu13/l;->Y` の中で組み立てられる continuation クラスの `@DebugMetadata`（難読化後 `Llb8/e;`）に
  `c = "com.linecorp.line.mainchatdata.MainChatDataModule$clearUnreadCountBlocking$1"`,
  `f = "MainChatDataModule.kt"` が残っている。
- `Lq33/e;->d` は、Linimal の「自動既読の停止」が使う `outboundGateFingerprint` が対象にしている
  メソッドそのもの。`returnType = V`, `parameters = (J, String, Z)` に加え、
  `Y(String)V` → `run()V` → `HashMap.get` → `HashMap.put` → `Q0(J, String)V` → `j1` →
  `SharedPreferences$Editor.remove` → `putLong` という参照の順序で識別する。

## 呼び出し元

`Lq33/e;->d` へ到達するのは 2 つの Runnable。

- `Lq33/c;->run()` … `Lq33/e;->e(String)Lip7/w;`（RxJava Single）が生成する。
  `Lq33/e;->a(chatId)J` で既読位置を取り、0 でなければ `d(id, chatId, true)` を呼ぶ。
- `Lq33/e$d;->run()` … `Lq33/e;->b(String, String)` が生成する。ロック画面の未読表示経路。

`Lq33/e;->e(String)` の呼び出し元には次がある（`@DebugMetadata` の `c` で復元）。

- `com.linecorp.line.chat.ui.bridge.data.message.readreceipt.MainChatMarkAsReadExecutor`
  （難読化後 `Lv11/a;->a(String, Continuation)`）。ChatHistory の DI モジュール `Ld11/e;->A(Z)`
  が生成する。トーク画面側の経路で、Linimal の `ReadReceiptHooks` がすでに注入されている。
- `com.linecorp.line.chatlist.viewmodel.ChatListContextMenuDialogModel$markAsReadMainChat`
  （トーク一覧の長押し「既読にする」）
- `com.linecorp.line.chattab.chatsubtab.ChatSubTabActionRequestProcessor`（一括既読）
- `jp.naver.line.android.access.remote.LineAccessServiceForNotification`（通知）
- `com.linecorp.line.search.external.SearchExternalChatUpdaterImpl$markAsReadChat`（検索）

## ServiceChat / Square と混同しないこと

DEX の文字列表にある `markAsReadToLocal-tqTIUe0` や `markAsRead-ZOqLxn8` は
`@DebugMetadata` の `m` フィールド由来で、いずれも
`com.linecorp.line.servicechat.impl.*`（公式アカウント、gRPC）に属する。こちらは remote → local
の順で、通常トークとは分岐の向きが逆。`markAsReadRemote-pTD61uY` は `SquareChatMarkAsReadBoImpl`
で OpenChat 用。通常トークの未読バッジとは無関係。

## Linimal の注入

- `readReceiptOutboundGatePatch`（自動既読の停止）… 同メソッドの命令 index 6、`Y` と chat-list
  Runnable の合流点の直後へ注入する。ローカル更新は元どおり実行したうえで RPC だけを止める。
- `readWithoutReceiptLocalReadBlockPatch`（既読をつけずに読む）… 同メソッドの命令 0 へ注入し、
  対象トークだけ本体を実行せず return void する。ローカル更新と RPC がまとめて止まる。

2 つは同じ `outboundGateFingerprint` を共有し、`dependsOn` のチェーン上で
`readReceiptOutboundGatePatch` が先に走る。あちらは素の命令列を前提に index を数えるため、
順序を入れ替えてはならない。

## 「既読をつけずに読む」の閲覧セッション境界

### 対象APKで確認した入室経路

- `ChatHistoryActivityLaunchActivity` は Intent の Parcelable `chatHistoryRequest` を引き継ぎ、
  `Llv7/n;->a(Intent, Z)V` が `ChatHistoryActivity` を起動する。
- この起動の flags は `67108864`（`FLAG_ACTIVITY_CLEAR_TOP`）だけ。トーク画面の manifest は
  `launchMode` を指定していない（standard）。`ChatHistoryActivity` と直近の基底
  `Lbv7/b;` / `Lo38/c;` は `onNewIntent` を override しない。
  standard と CLEAR_TOP の組合せでは、既存のトーク画面への通常再入室も新しい `onCreate` を通る。
- `ChatHistoryActivity.onCreate(Bundle)V` は registers=16、`p0=v14`、`p1=v15`。
  命令0は `invoke-super/range {p0 .. p1}`、命令1は `Build.VERSION.SDK_INT` の `sget`。
  `chatDataComponentProvider`、`Activity.getIntent()`、`Intent.getExtras()`、
  `chatUiComponentProvider` の順に参照が現れる。
- Parcelable `Lcom/linecorp/line/chat/request/ChatHistoryRequest;` の公開
  `getChatId()String` は `iget-object v0, v0, chatId:String` → `return-object v0`。
  runtime はこの公開 getter を反射で呼び、LINE 型を extension のコンパイル依存に持ち込まない。

`readWithoutReceiptSessionPatch` は onCreate と getter の両方を一意・安全と確認してから、
super 直後に `ReadWithoutReceiptHooks.onChatCreated(Activity, Bundle)` を注入する。
scratch register は使わず、`invoke-static/range {p0 .. p1}` で既存 parameter をそのまま渡す。
挿入位置が分岐・switch・例外 handler の入口なら変更しない。必須 PatchId は
`linimal.patch.read-without-receipt-session`、expected target count は2（画面入口と getter）。

### 状態の寿命

- メニュー操作または通知からの起動で作る予約だけを `SystemClock.elapsedRealtime()` に基づく30分の期限で管理する。
- 検証済みのトーク生成と lifecycle callback 登録に成功した予約は、Activity 所有の確定セッションにする。
  前面 Activity を既読 worker から推測する旧方式は使わない。
- pause/resume、終了ではない stop、別 Activity の画像表示は解除条件ではない。
  確定セッションには時間経過による期限を適用しない。
- 所有者の finishing stop または構成変更以外の destroy で解除する。
  別のトーク画面の新規生成は、同じ chatId でも以前の確定セッションを終了する。
- save callback が Linimal 専用 token を Bundle に保存し、構成変更の destroy で所有者を外す。
  新画面は token・chatId・移管待ち状態が一致する場合だけ所有者を引き継ぐ。
- snapshot/CAS と再利用しない token で、古い終了・期限切れ・復元通知が新しい状態を消さないようにする。
  設定 OFF・適用不可・設定読取り/書込み失敗は予約と確定状態を破棄し、再有効化しても復活させない。

Android の実際の lifecycle 配送と相手側の既読、ローカル未読バッジの成立性は実機確認が必要。
JVM の状態遷移や DEX の静的検証だけで実機確認済みとは扱わない。

## 通知タップからの既読なし入室（2026-10-12）

対象APKの `ChatHistoryMessageNotificationContentIntentReceiver$a` は、メッセージ通知用
PendingIntent の作成時にトーク request の `BackNavigationArgs.isFromNotification` を true にする。
通知の tap は通常 `PendingIntent.getActivity` で `ChatHistoryActivityLaunchActivity` を開く。
別の broadcast 経路でも receiver は内包 Intent を取り出して Activity を起動するだけで、
通知の返信・既読処理を行う `LineAccessServiceForNotification` とは入口が異なる。

起動 dispatcher `Llv7/n;->a(Intent, Z)V` は `shouldLaunchMainActivity`、
`shouldLaunchChatHistoryActivityOnly`、`ShouldRequestCatHistoryActivityLaunch`、
`CHAT_LIST_MOVE_ALL_TAB` の組合せで一意に同定する。対象APKでは registers=10、p1=v8。
先頭は p1 の `Object.getClass()`。入口に `invoke-static/range {p1 .. p1}` で
`NotificationReadWithoutReceiptHooks.onChatLaunch(Intent)` を注入し、
MainActivity 経由・直接起動の分岐に入る前に予約する。元の dispatch は変更しない。

通知 marker の反射契約は以下をすべて検証してから注入する。

- 公開 `ChatHistoryRequest.getBackNavigation()` が this.backNavigation をそのまま返す。
- `BackNavigationArgs(isFromNotification=` を持つ model が Object を直接継承し、
  公開・非 static の boolean field が1つだけである。
- `ChatHistoryRequest.writeToParcel` の `isFromNotification` キー直後でその field を読み、
  `BaseBundle.putBoolean(String, Z)` の value 引数として保存している。

難読化された field 名を runtime に固定しない。取得した field は cache し、
marker が一意でなければ元の処理を続ける。PendingIntent 作成時には予約しない。
通知の設定はメニュー設定から独立した初期 OFF の boolean。
通知専用 feature に entry・送信抑制・ローカル抑制・閲覧セッションの4つの status を記録し、
どれかが未適用なら機能を無効にする。後ろ3つは既存の安全な注入を共有する。

セッションは通知/メニューの入口を保持し、対応する設定だけで有効性を判定する。
片方を OFF にしてももう片方のセッションは解除しないが、OFF にした入口の状態は破棄する。
通常入室、終了、構成変更、未確定予約の失効は既存のセッション境界を使用する。
Square/OpenChat 等の別既読経路はこの機能の対象外。
実機の通知配送・相手側既読・未読バッジは未確認。

## 既読なし閲覧中のメッセージ送信と入室案内（2026-10-13）

### 送信を観測する境界

対象 APK の `Lb81/d;` はチャット UI の送信 adapter。テキスト、スタンプ、画像、
動画、音声、ファイル、位置情報などを `Ld98/b1;` の派生 request に変換し、
`Ld98/w0;->a(Ld98/b1;Lb81/o;)V` に渡す13箇所を持つ。
その先は既存 executor に `Ld98/m1;` を投入する。ここは送信キューへの投入であり、
サーバの送信成功を意味しない。ネットワーク、送信 payload、再送処理は変更しない。

`readWithoutReceiptSendPatch` は `Text(text=`、`, targetChatId=`、
`, chatMessageSendSilentMode=` で request model を一意に特定する。
model の superclass にある唯一の抽象 `()String` getter と、text model の単純な
field getter を確認する。adapter は text request の生成と `TO_BE_SENT_SILENTLY`
field の参照を組み合わせて同定する。難読化されたクラス・メソッド名は条件にしない。

13箇所すべてで、戻り値なしの投入呼び出しの直後が `return-void` であり、
分岐・switch・例外 handler の入口ではないことを確認してから注入する。
元の request register を range invoke で渡し、scratch register や payload は変更しない。
generated static bridge が request の対象 chatId を取得して runtime hook に渡す。
入力の取り消し、無効な送信要求、投入呼び出しの例外はこの hook を通らない。

### 実際の既読反映

`outboundGateFingerprint` が同定した `d(J, String, Z)` の先頭、
ローカル未読維持 gate より前で `recordReadAttempt(Object, J, String)` を呼ぶ。
this・既読位置の wide pair・chatId の連続する4 registerを range invoke でそのまま渡す。
runtime は、抑制中の確定セッションに executor と正の既読位置を保存する。
既読位置は後退させず、executor はセッションの終了とともに解放する。
新しい executor の生成や接続 listener の追加、DB の再検索はしない。

LINE 側には公開 instance bridge `linimalMarkReadAfterSend(J, String)` を生成し、
保存した既読位置で既存の `d(J, String, true)` を呼ぶ。
ローカル未読解除・既読位置更新・RPC と LINE の再送経路を再利用する。

最初の実装では `(String)Rx Single` factory での登録に限定していた。
実機では `d` の既読処理が到達しても factory 由来の reader がないことを
一時診断ログで確認した。送信時に executor がないため処理が終了していた。
この factory 依存と、送信後に `(String)J` で DB を再検索する旧 bridge は削除した。

runtime は送信投入と既読観測の両方が揃った確定セッションだけを、一度だけ worker に渡す。
送信が最初の既読観測より早い場合も、後続の既読観測から反映を開始する。
worker で設定の有効性と token/CAS を再確認して抑制を終了し、bridge を反射で呼ぶ。
別トーク、未確定予約、新しい token への古い通知、二重送信は状態を消さない。
構成変更で token が同じなら、既読観測と送信状態を引き継ぐ。
「通常チャットの自動既読を停止」も ON の場合は、この既読反映に限って同じ worker 上で
一回だけ許可する。worker 終了時は許可を必ず破棄し、その後の既読は既存設定に従う。
「送信しても既読を有効にしない」は初期 OFF の共通オプション。
ON の送信は `SendState` の送信済み・実行予約状態を進めないため、
後続の既読観測でも抑制を解除しない。OFF に戻した後の次の送信は保存した既読位置を反映できる。
送信操作時点の設定を使い、通常入室には作用しない。

保存キーは `linimal.chat.keep_unread_after_send`、schema は4。
v3→v4 は既存キーを変更せず、新キーが未設定の場合だけ false を保存する。
既に有効な boolean 値があれば保持し、不正な型・保存失敗では fail-open にする。
このオプションは既存のメニュー／通知 feature のどちらかが完全適用なら利用可能で、
独立の FeatureId / PatchId は追加しない。設定画面には既読表示と閲覧・返信の不一致によるリスクを明記する。

メニュー／通知の両 feature に必須 `send` PatchId を追加した。
expected target count は15（UI 投入13箇所、request 契約、実際の既読入口）。
同定や命令形状の検証に失敗したときは DEX を変更せず、両 feature を適用不可にする。

### 入室案内

確定セッションの既読が無効な間、decor の上部に
「現在、既読は無効です。メッセージを送信すると既読になります」と表示し続ける。
新設定 ON の場合は「現在、既読は無効です。送信しても既読はつきません」に切り替える。
描画前にも現在の設定に合わせて文言を更新する。
ステータスバー／cutout inset と既存の配色、アクセシビリティ live region を使う。
時間による消去と表示済み token の抑制は廃止した。
pause/destroy では view を取り除き、同じ token の復帰や構成変更後も既読無効なら再表示する。
送信によるセッション解除後の描画では取り除き、通常入室・未確定予約には表示しない。

修正版の対象 APKM 統合適用は `send` 両方が15/15・OK、全59 status が OK。
実機のログイン維持・案内の表示と消去・受信中の既読抑制・返信前の未読数1を確認した。
ユーザーが初版の送信後も既読が付かないと報告したため、上記の登録入口を修正し、
同一署名で更新して ART verify と既読なし入室を確認した。
修正版では、テキスト返信後の相手側既読をユーザーが確認した。
対象トークの未読バッジも消え、別トークの未読1は維持された。
通知入室・他の送信形式との組合せは個別には実機確認していない。

## 既読なし閲覧中の手動既読操作（2026-10-22）

### 個別既読の廃止（2026-11-03）

行ごとの「既読にする」と、それに伴う境界線・部分既読後のバッジ調整は廃止した。実装は git 履歴（`e00d3f2` 以前）にある。

`sendChatChecked` の引数は次の4つだけで（`ts8/bo.java`）、既読範囲を指定できるのは `lastMessageId` の1つのみ。

| ID | 名前 | 型 | 値 |
| --- | --- | --- | --- |
| 1 | `seq` | i32 | 要求番号 |
| 2 | `chatMid` | string | トーク ID |
| 3 | `lastMessageId` | string | 既読にする位置の server ID |
| 4 | `sessionId` | byte | 常に 0 |

XIG07 の計測版で `LegacyTalkServiceClientImpl.c1` を記録した結果は次のとおり。

- 押した行の位置（最新より古い）だけを、bridge 経由で1回送信し、RPC は成功した
- 閉じた後を含め、他の呼び出し元から `c1` は呼ばれなかった
- それでも、相手の公式 Web 版 LINE では全行に既読が付いた

Android 公式の受信処理（`uq8/z1`、`sp8/b`）は `NOTIFIED_READ_MESSAGE` の param3 を位置として保存するため、
プロトコル上は途中の位置を表現できる。ただし、Web 版の表示とサーバーのどちらが全行にしているかは切り分けておらず、
公式スマホ版を受信側にした実機確認もしていない。クライアントから変更できる項目が他にないため廃止した。

### 既読処理とセッション

`readWithoutReceiptManualReadPatch` は既存 outbound と同じ executor に
`linimalMarkReadManually(J, String)J` を生成する。

全体操作は公式の `(String)J` getter と保存済みの位置の大きい方を使い、
`d(point, chatId, true)` でトークの未読件数も解除する。
getter は `read_up`、profile ID、chat ID を既存検索へ渡す。
対象 APK の `h38.x$t.c()` は created_time DESC、local ID DESC で並べ、
既読位置以降の最大500行から未読の受信メッセージを抽出して先頭1件を返す。
公式のトーク一覧一括既読と同じ検索であり、SQL や通信 payload は追加・変更しない。
getter が0でも、個別既読後に保存済み位置で未読件数を解除できる。

明示的な操作だけを同一 worker・chatId・session token に限定して local/RPC gate へ通す。
自動既読停止の許可も同じ worker で準備し、例外を含めて finally で破棄する。
途中で別セッションへ移った worker は gate を通れず、その観測を新しいセッションへ保存しない。
操作後もセッションは終了せず、後続の自動既読を抑制する。
既読位置・処理中状態は構成変更で引き継ぎ、通常再入室では破棄する。
worker の完了時に現在の所有 Activity の描画を要求し、操作済み行のボタンと処理中表示を更新する。

上部案内は `chat_ui_history_main.xml` のヘッダー直下の本文 RelativeLayout（`0x7f0b0772`）にある、
先頭の縦 LinearLayout に通常の子として挿入する。重み付きのメッセージ領域が案内の高さ分だけ縮む。
`android.R.id.content` の padding は変更しない。Window 全体に上余白を足す方式では、
案内の上に加えて公式ヘッダーまで押し下げることを実機の画面で確認した。
pause・抑制終了時には挿入した本文内の案内を親から取り除く。
全体操作「すべて既読にする」は別のフローティング表示にし、
実際の入力欄 `chat_ui_message`（`0x7f0b077b`）の上端から8dp離す。
入力欄の拡大、IME、system bar・cutout の安全領域を考慮し、入力欄が特定できない場合や
表示領域が不足する場合は推測した位置に出さない。
背景にも LinimalPalette を適用し、ホストの Button theme と端末のダークモードの不一致を避ける。

フローティング表示中は `chathistory_message_list`（`0x7f0b096a`）だけに下余白を確保する。
一覧の下端から全体既読ボタンの上端までの距離に8dpを足し、元の下余白より小さくならない値を使う。
末尾までスクロールした際に最新メッセージの「既読にする」がボタンの上に出るようにする。
入力欄拡大やボタンの高さ変更時にも再計算し、ボタン非表示時とpause・抑制終了時は元に戻す。
復元時には現在の値が自分の適用値と一致することを確かめ、公式側が変更した余白を上書きしない。

通常・通知の各 feature に `manual-read` と `message-controls` の必須 PatchId を追加した。
それぞれ expected target count は2。対象不一致や不安全な形の場合は注入せず、
既読なし feature 全体を利用不可にする。設定キー・schema・既存値は変更しない。

## LINE 26.16.0 での変更点

DEX（全 14 個）を判定関数で直接走査し、下記の一意性と形状を確認した。実機は未確認。

### 既読送信の経路

- `Lqg3/e;->d(J, String, Z)V` が既読処理の唯一の入口で、命令列と register は 26.11.0 と同型。
  `TalkServiceClient` の `(I, String, String)V`（`c1`）を呼ぶのはこのメソッドだけ。
- `sendChatChecked` の引数書き出しは `LegacyTalkServiceClientImpl$e` のみ（`toString` を除く）。

### 手動既読の executor が共用になった

`Li91/a;`（26.11.0 の `MainChatMarkAsReadExecutor` 相当）は metadata が消え、呼び出し元が増えた。

| 呼び出し元 | 契機 |
| --- | --- |
| `Lns1/d;`（`UnreadMarkViewController$bindMarkAsReadButton$1$1`） | 公式の「既読にする」ボタン |
| `Ltq8/l1;`（`SendMessageReadPointUpdaterImpl`。`tq8/v1` が `Always` で呼ぶ） | メッセージ送信 |
| `Lce8/a;` / `Lmc8/c;` | リアクション送信 |
| `message/list/edit/a`（`MessageDeleteActionHandler` 周辺） | メッセージ削除 |

executor へ印を付けると、送信・リアクション・削除も「手動」扱いになり、自動既読を停止していても
相手へ既読が届く。そのため `readReceiptManualCallerPatch` は executor ではなくボタンの coroutine の
executor 呼び出しだけを囲む。26.11.0 と同じく明示的なボタン操作だけが手動で、他は gate で止まる。

26.16.0 には公式の手動既読設定（`ManualReadReceiptSettingsCategory`）も追加された。
公式の説明では返信・リアクション・「既読にする」で既読が付く。Linimal の設定とは独立している。

### 長押しメニュー

固定 4 行ではなく、`Lb71/e;->k`（トーク項目の分岐）が行一覧の composable `La71/f;->a` を呼び、
その中で一覧から行を描く。行は `a` を呼ぶ直前へ 1 行だけ差し込み、行 composable とラベルの複製元は
`a` の中から取り出す。同じ `a` を使うトークプレビューには行を足さない。
スクロールプレビュー画面のメニューは別の composable が描くため、別のパッチで行を足す（`chat-scroll-preview.md`）。

### 送信の観測

投入 API は `Ltq8/z0;->d(Ltq8/m1;Lqf1/k;Z)V` の 3 引数に変わった。`Lqf1/d;` の 13 箇所すべてが
投入直後に `return-void` する形で、受理数は 13 のまま。`ChatMessageCommonViewData` の field 数は 29。


## 明示操作とロック画面系の未読クリア（26.16.0）

送信メソッドは `Lqg3/e;->d(JLString;Z)V`。`sendChatChecked` の Java 側の呼び出し元はここだけで、
呼び出し元は `e.c`（一括）、`Lqg3/c;->run`（`e.e` の supplier）、`e$d.run`（`e.b` と再送）の 3 つ。

| 経路 | 入口（DebugMetadata など） | 停止中の扱い |
| --- | --- | --- |
| すべて既読（タブ + メニュー） | `ChatTabViewModel$markAllAsReadForNormalChat$2` → `e.c` | 送る |
| すべて既読（More） | `ChatListHeaderViewModel$markAllAsReadForNormalChat$2` → `e.c` | 送る |
| 長押し「既読にする」 | `ChatListContextMenuDialogModel$markAsReadMainChat$1` → `e.e` | 送る |
| チャットサブタブの行アクションとメニュー | `ChatSubTabActionRequestProcessor$markMainChatAsRead$2`（`w42/i`）→ `e.e` | 送る |
| 通知「既読」 | `LineAccessServiceForNotification.onStartCommand` の `MARK_AS_READ_ACTION` → `e.e` | 送る |
| 既読ボタン | `UnreadMarkViewController$bindMarkAsReadButton$1$1` → executor → `e.e` | 送る（既存） |
| 開いているトーク | `ld8/s0` → `e.b` | 止める |
| 再送 | 起動時 `io8/l0` とネットワーク復帰 → `e$c` → `e$d` | 止める |
| 送信後、リアクション、削除 | `tq8/l1`、`ce8/a`、`mc8/c` など → `i91/a` → `e.e` | 止める |
| 通知の返信成功、検索、Google Assistant | `LineAccessServiceForNotification$b.g`、`g55/x`、`us0/h$a.g` → `e.e` | 止める |
| talk operation の処理 | `uq8/y3.f`（`SEND_MESSAGE`）→ `e.e` | 止める |
| メッセージリクエスト | `d42/j` → `d42/d.u7`、`w42/j`、`z42/m` → `e.e` | 止める |

`d42/d.u7` は `markAsReadMessageRequests` が呼ぶメッセージリクエスト一括既読で、起点は長押しメニューの
`f22.s` なので操作自体は明示的。ただしメッセージリクエストは許可の対象外としている。

`w42/i` を作るのは `w42/z$f` の `z61/v1$e` 分岐だけで、`v1$e` の生成元は次の 2 つだけである。

- `b71/z0.invoke`: `b71/c1` の行アクション。`u2.f.READ` を記録する。
- `y61/a.d`: `pi1/c$e` の変換。`a71/i` のメニュー項目を `a71/f` が描画し、その選択結果か、
  `extra_preview_menu_callback` で返るプレビューの選択結果（`u42/j`）から届く。

どちらもユーザー操作が起点で、自動経路から届く形跡は無い。

### 許可の受け渡し

- `e.e` の入口は、factory の呼び出しを `beginManualInvocation` と `clearManualInvocation` で囲む。
  `w42/i` は try の handler が `CancellationException` と `Exception` だけなので、それ以外の Throwable 用の
  handler を足す。
  印は supplier の登録で消費され、worker の `prepareSupplier` が chatId 単位の一回限りの許可へ変換する。
- `e.c` は同じ thread で `d` を順に呼ぶ。`d` の直前で対象トークだけ `prepareExplicitRead` し、直後と
  例外 handler で `clearPreparedSupplier` する。呼び出し元が上の 2 coroutine だけと確認できない版では注入しない。
- 既読なし閲覧中のトークは `d` の先頭で return するので gate が許可を消費しない。直後の破棄が次のトークへの
  漏れを防ぐ。local block と RPC block は変えていないので、すべて既読でもそのトークだけ未読が残る。
- 送信に失敗すると公式どおり FAILED queue へ入るが、再送の `d` は自動扱いなので停止中は送らず queue を消す。

### 送信メソッドを通らない未読クリア

`Lqg3/e$a;->f` は `e.b` の read point が 0 以下の分岐だけが使い、`e0` と chat-list Runnable を実行する。
read point の前進と RPC は無い。`readWithoutReceiptLocalReadBlockPatch` が check-cast の直後へ
`shouldBlockMarkAsRead` を注入し、既読なし閲覧中のトークだけ本体を飛ばして元の戻り値を返す。自動既読の停止では
`d` の `e0` と揃えて未読を消す。read point が 0 以下のイベントが実際に届くかは未確認。

いずれも静的解析と JVM テストの結論で、実機の相手側既読は未確認。
