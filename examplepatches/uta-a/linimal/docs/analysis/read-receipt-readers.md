# グループの既読者の解析

## 対象

- LINE 26.16.0
- versionCode 261600106
- package `jp.naver.line.android`
- arm64-v8a

## 結論

LINE は「既読 N」を出すために、メンバーごとの既読範囲をすでに端末へ保存している。Linimal は独自に記録を取らず、
この記録を読み取り専用で参照して「誰が読んだか」を表示する。

1. データは `read_notification` DB の `read_message_range`。LINE 自身の既読数と同じ条件で数えるため、
   一覧の人数は「既読 N」と一致する
2. 表示の入口は、既読ラベルの bind 直後と、メッセージ長押しメニューの組み立て直後の 2 か所に注入する
3. サーバーからの取り直しは、LINE の `ReadCountManager` が全トークに行う同期と同じメソッドを、1 トークだけ呼ぶ

設定は次の 6 つで、いずれも初期値 OFF。再起動なしで次の bind・長押しから反映する。

| 設定 | 内容 |
| --- | --- |
| 既読マークの横にアイコンを並べる | 自分のメッセージの「既読」の左に、読んだメンバーのアイコンを最大 4 人分重ねて描く |
| 他人のメッセージに既読数を表示 | 他人のメッセージの時刻の上に「既読 N」を描く（送信者と自分を除く） |
| 他人のメッセージに既読者のアイコンを表示 | 他人のメッセージの時刻の上にアイコンを描く。既読数と両方 ON なら既読数の外側にアイコンを並べる |
| 既読マークのタップで一覧を開く | 自分のメッセージの「既読」、他人のメッセージに描いた表示を押すと一覧（モーダル）を開く |
| 長押しメニューに「既読者」を追加 | 長押しメニューの格子に 1 マス足す。相手のメッセージでも開ける |
| 一覧を開くときにサーバーと同期する | 一覧を開いたとき、そのトークの既読範囲を LINE の同期処理で取り直す |

## 既読範囲の記録

### 受信と保存

| 経路 | 26.16.0 | 内容 |
| --- | --- | --- |
| operation 受信 | `uq8/z1` | `NOTIFIED_READ_MESSAGE`(55) の param1=chat ID、param2=読んだメンバー、param3=位置 |
| 全量同期 | `sp8/e.b(SQLiteDatabase, Set, sp8.c$a)` | `TalkService.getMessageReadRange(chatIds, syncReason)`（`W0`）の結果を保存 |
| 書き込み | `sp8/b.d()` | `read_message_range` へ範囲を追加・延長する |
| 集計 | `vp8/b.a(J)` | 「既読 N」の N。`from_msg_id < M` の数 − `to_msg_id < M` の数 |

`read_message_range` の列は `chat_id`、`member_id`、`history_id`、`next_history_id`、`from_msg_id`、`to_msg_id`、
`operation_created_time`。DB は `en8.f.READ_COUNT`（ファイル名 `read_notification`、通常の Android SQLite）。

メッセージ M を読んだメンバーは次の条件で求まる。LINE の集計（`vp8/b`）と同じ条件で、同じ範囲を数える。

```sql
SELECT DISTINCT member_id FROM read_message_range
 WHERE chat_id = ? AND from_msg_id < ? AND to_msg_id >= ?
```

`operation_created_time` は範囲を最後に延長した時刻で、M を読んだ時刻ではない。誤解を招くため、一覧に既読時刻は出さない。

### 同期の頻度

`ReadCountManager`（`sp8/c`、DebugMetadata `jp.naver.line.android.readcount.ReadCountManager$syncAllNonOpenChatReadCounts$2`）が
全トークを定期的に同期し、`chat_read_count_meta_data` に同期時刻を残す。トークを開いたときも未同期なら `sp8/e.a()` が同期する。
そのため端末内の記録はほぼ最新で、サーバーとの同期は任意の補完に留める。

## メンバーと表示名

| 用途 | DB | table |
| --- | --- | --- |
| グループのメンバー | `naver_line` | `membership`（`id`=chat ID、`m_id`、`is_accepted=1`） |
| 複数人トークのメンバー | `naver_line` | `chat_member`（`chat_id`、`mid`） |
| 表示名・画像 | `contact`（Room） | `contacts`（`mid`、`overridden_name`、`profile_name`、`picture_path`） |

- 表示名は `overridden_name`（利用者が付けた名前）を優先し、なければ `profile_name`
- 未読者は現在のメンバーから既読者を除いたもの。退会したメンバーも既読の記録が残っていれば既読者に数える
- 自分の mid は Profile が暗号化保存されているため DB からは読まない。LINE 自身が使う `(Context)String` の
  static helper（`np6/a.a` など、`ap3.b.getProfile()` の `dp3/a.b`＝mid をそのまま返すもの）を呼ぶ
  `myMid(Context)` を bridge に生成する。helper は複数の module に重複するため、形を検証して名前順の先頭を使う。
  mid の field は `Profile(authTokenV1=` の toString で `, mid=` の直後の引数として特定する
- 生成できない場合に備え、既読ラベルが表示される行（自分の送信メッセージ）の送信者 mid も覚えて代わりに使う。
  ただし実機では自分の送信メッセージの送信者 mid が取れず、この代用だけでは未読者に自分が残った
- 自分と送信者は、既読者・未読者のどちらの一覧からも除く
- chat ID の先頭は `c` がグループ、`r` が複数人トーク（`ir8/a.f`）。それ以外（1 対 1・オープンチャット）は対象外

### プロフィール画像

LINE は `CDN_PROFILE`（既定 `https://profile.line-scdn.net`）+ `picture_path` + `/preview` で縮小版を取得する（`mp8/b.k`）。
Linimal も同じ公開 URL を取得し、プロセス内のメモリにだけ保持する。認証情報・Cookie は送らない。
`picture_path` は `/` から始まる英数字と `-_./` だけを受け付け、`//`・`..` を拒否してホストを変えられないようにする。
取得できない場合は名前の頭文字の丸で代替する。

## 既読ラベルの bind

`chat_ui_row_read_count`（`0x7f0b082c`）は送信側の行（`chat_ui_row_send_edited_and_read_count`）にだけある TextView で、
文言は `cm1/e.onBindViewHolder` が `sp8.a.a(serverMessageId)` から作り、`lq1/i.K0` が設定する。

```smali
iget-object v6, v6, Ldr1/m;->a:Landroid/widget/TextView;
invoke-virtual {v2}, Lhe1/h;->d()Lhe1/w;
move-result-object v8
invoke-virtual {v8}, Lhe1/w;->isReadCountRequired()Z     # 非難読化の名前
...
invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
const/4 v8, 0x0
invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V    # 表示
invoke-static {v6, v2}, ...Bridge;->onReadCountBound(...)          # 注入（表示経路）
goto :goto_313
:goto_310
invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V    # 非表示
invoke-static {v6, v2}, ...Bridge;->onReadCountBound(...)          # 注入（非表示経路）
:cond_313
:goto_313
```

非表示経路の注入位置は合流点の label を持つ命令の前だが、dexlib2 の挿入では label が元の命令に残るため、
`goto :goto_313` と `if-eqz v6, :cond_313`（label の View が無い行）は注入を通らない。非表示経路の fall-through だけが通る。
これは意図した挙動で、shape 判定は「goto の飛び先 = 非表示の `setVisibility` の直後」を確かめる。

行は RecyclerView で再利用されるため、extension は label ごとに加えた変更（compound drawable・click listener・
content description）と変更前の値を覚え、対象外の行として bind されたら必ず戻す。

### メッセージの共通 view data

`he1/c`（`ChatMessageCommonViewData`）の `toString()` の marker から field を特定する。

| field | 26.16.0 | 特定方法 |
| --- | --- | --- |
| chatId | `a:String` | `ChatMessageCommonViewData(chatId=` の後で最初に読む String |
| serverMessageId | `c:J` | `, serverMessageId=` の後で最初に読む long |
| senderMid | `e:String` | `, senderMid=` を渡す呼び出しで、その文字列の直後の引数（直前の `d` は validServerMessageId） |

`he1/h.b()` が `he1/c` を返す getter で、bind の中で既に呼ばれているものを使う。

## 他人のメッセージ

LINE は他人のメッセージに既読表示を持たない（`chat_ui_row_read_count` は送信側の layout にだけある）。
View を足すと横並び（`chat_ui_row_layout_receive_horizontal_metadata` の縦 LinearLayout）と縦並び
（スタンプなど、`chat_ui_row_layout_receive_vertical` の ConstraintLayout）で別々の対応が要るため、
時刻 `chat_ui_row_timestamp`（`0x7f0b0864`）の上側 compound drawable に描く。LINE は時刻の compound drawable を使っていない。

- 「既読 N」と「重ねたアイコン」の 1 行で、有効な要素だけを描く（間は 3dp、高さは高い方にそろえて上下中央）。
  既読数を時刻と同じ端に置き、アイコンを吹き出しから遠い外側に置く（左端にそろえる行は「既読 N・アイコン」、
  右端にそろえる行は「アイコン・既読 N」）。当初は縦 2 段にしたが、利用者の希望で横並びにした
- 行は時刻の文字と同じ端にそろえる。横並びの行（時刻の親が縦の LinearLayout）は左端、スタンプなど
  縦並びの行（親が ConstraintLayout で吹き出しの右端に右寄せ）は右端。それ以外の構造では gravity を変えず左端。TextView は top drawable を
  `compoundPaddingLeft + (hspace - drawableWidth) / 2` に、文字を `layout.getLineLeft(0)` に置くため、
  描画のたびにこの差から文字の端を求める
- 行が時刻より広いと TextView が広がる。縦並びの行では時刻の gravity を RIGHT にして（自分が設定した値のままなら解除時に戻す）、
  時刻が吹き出しの右端から離れないようにする
  文字は時刻と同じ Paint を複製し、描画のたびに時刻の現在の文字色を使う
- 「既読 N」の文言は LINE の `chathistory_message_read_count_format` を名前から引き、LINE の表示言語に合わせる
- 誰も読んでいなければ描かない（LINE の自分のメッセージと同じ）
- LINE は他人のメッセージの行を既読の更新で bind し直さないため、結果を 30 秒ごとに読み直し、bind 中に差し替える

### bind の入口

`lq1/i.K0` は送受信どちらの行でも呼ばれるが、既読ラベルの注入は送信行（`dr1.m` がある行）でしか通らない。
入口に次を入れる。`p0`〜`p3` は `this`・`zd1/c`・`sg1/a`・`he1/h` で、どれも参照型のため range でそのまま渡せる。

```smali
invoke-static/range {p0 .. p3}, ...Bridge;->onMessageBound(Llq1/i;Lzd1/c;Lsg1/a;Lhe1/h;)V
```

bridge は `he1/h.b()` から chat ID・server ID・送信者・`isOtherUserMessage`（`he1/c.m`、`, isOtherUserMessage=` の後で最初に読む boolean）を、
`lq1/i.M0()`（K0 内で `invoke-virtual/range {p0 .. p0}` で呼ばれる）→ `dr1/g.z:dr1/h` → `dr1/h.a:TextView` から時刻を読む。
`dr1/g.z` は、`dr1/g` の constructor で `0x7f0b0864` の View を `dr1/h` に包んで入れる field として特定する
（同じ ID を使う `ct1/f` は holder を作らないため外れる）。自分のメッセージでは extension が何もしない。

## 長押しメニュー

`kk1/n.s(n.c, View, wc1.d, xc1.a, xb1.b, fc1.f)` が `chat_ui_message_context_menu_content`（`0x7f0e0154`）に、
`_row`（`0x7f0e0156`）と `_item`（`0x7f0e0155`）を inflate して格子を作る。項目は `xc1.c` の enum で、
最後の行の余りのマスにも `_item` を inflate し、中身を空のまま置く。

```smali
invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
move-object/from16 v3, p4                                        # 注入
invoke-static {v8, v3, v1}, ...Bridge;->onContextMenuBuilt(...)  # 注入
sget-object v3, Lwy1/f;->a:Ljava/util/Set;
invoke-interface {v2, v8, v3, v11}, Lgh6/m;->r(Landroid/view/View;Ljava/util/Set;Lgh6/e;)Z   # 配色
```

- `v8` は格子の container（`chat_ui_message_context_menu_action_content_container`）
- `v1` はメソッド冒頭で作る `fm1/o1`（`DialogInterface` を実装するメニュー本体）。注入後に `iget-object _, v1, Lfm1/o1;->d` で
  読まれることを shape 判定で確かめる
- `p4` は `xc1/a`（`ContextMenuDialogParams`）。`xc1/a.b:xc1/b` → `xc1/b.b:he1/c` からメッセージの共通 view data に届く
- 一時 register の `v3` は直後の `sget-object` で上書きされるため、注入で使っても値を壊さない

enum に値を足すと mapper・switch map・UTS ログなど多くの箇所に波及するため、enum には触れない。extension は
空きマスがあればそこへ、なければ同じ layout で行を 1 つ足し、title・icon・click listener を入れる。注入位置は
LINE が配色（`gh6.m.r`）を当てる直前なので、追加したマスにも LINE と同じ配色が当たる。layout と ID は名前から引き、
1 つでも見つからなければ何もしない。押すとメニュー本体を `dismiss()` してから一覧を開く。

## サーバーとの同期

`sp8/d.invokeSuspend` の末尾から参照を読み、同じ呼び出しを 1 トーク分だけ行う static method を extension の器
（`ReadReceiptReadersBridge.syncReadRange(Context, String)Z`）へ生成する。

```smali
sget-object v0, Ln30/d;->a:Ln30/d$a;                       # DataManagerHolder の key
invoke-static {p0, v0}, Lsc0/f;->a(Landroid/content/Context;Lsc0/a;)Ljava/lang/Object;
check-cast v0, Ln30/d;
invoke-interface {v0}, Ln30/d;->d()Lsp8/c;                 # ReadCountManager
iget-object v1, v0, Lsp8/c;->e:Lsp8/e;
iget-object v2, v0, Lsp8/c;->c:Landroid/database/sqlite/SQLiteDatabase;
invoke-static {p1}, Ljava/util/Collections;->singleton(...)
sget-object v4, Lsp8/c$a;->FULL_SYNC:Lsp8/c$a;
invoke-virtual {v1, v2, v3, v4}, Lsp8/e;->b(...)Lorg/apache/thrift/l;   # 例外を戻り値で返す
```

- `n30/d$a.a(Context)` は `jp.naver.line.android.DataManagerHolderFactory` の文字列で特定する。generic のため戻り値は
  `Object` に消去されており、holder は「key を static field に持つ interface」として走査で特定する
- `sc0/f.a(Context, sc0.a)` は、holder の key を読んだ直後に呼ばれる static method として特定する
- 送る内容は LINE 自身の定期同期と同じ `getMessageReadRange` の 1 トーク分で、結果の保存も LINE 自身の処理が行う
- 通信を伴うため main thread からは呼ばない。同じトークは 30 秒以内に再同期しない
- 設定 OFF のときは呼ばない。extension は reflection で生成メソッドを探し、見つからなければ同期せずに端末内の記録だけを表示する

## 未確認事項

- 他人のメッセージの時刻が出ない行（LINE が時刻を隠す行）では、既読の表示も出ない

- 実機での表示・操作（アイコンの見た目、長押しメニューの空きマス・行の追加、一覧の配色、同期の成否）
- `membership` に自分が含まれるか。含まれても自分の mid を学習した後は除外される
- 大人数のグループでのアイコン描画・DB 参照の負荷
