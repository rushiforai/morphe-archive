# オープンチャットの広告

LINE 26.16.0 (versionCode 261600106) arm64-v8a の exact APKM で確認した、オープンチャット（Square）の広告の経路と、Linimal の「オープンチャットの広告を表示しない」が書き換える箇所をまとめる。

## 広告を出すモジュール

オープンチャットの広告はすべて `LINE_Android.lib_square-ad-impl` から出る。Smart Channel（`admolin`）やホームの Performance Ad とは別のモジュールで、既存の広告パッチは影響しない。

入口は `sc0.a` の component lookup で、次の 4 つの Factory（クラス名は難読化されない）が実装を作る。

| Factory | interface | 実装 | 場所 |
| --- | --- | --- | --- |
| `SquareBaseChatAdInitializerFactory` | `k06/a` | `xz5/c` | オープンチャットのトーク |
| `SquareThreadChatAdInitializerFactory` | `k06/c` | `xz5/j` | スレッドのトーク |
| `SquareThreadHomeAdInitializerFactory` | `k06/d` | `xz5/l` | スレッドホームのタブ上部 |
| `SquareNoteAdInitializerFactory` | `k06/b` | `xz5/h` | ノート一覧・お知らせ一覧・ノート詳細 |

場所の enum は `z56/b`（`BASE_CHAT`、`THREAD_CHAT`、`THREAD_HOME`、`NOTE_LIST`、`NOTE_END`）。

## 上部の広告

- トーク上部は `SquareBaseChatHeaderAdFloatingViewManagerImpl`（`sy1/a`）が `k06.a.c(...)` を呼び、返った view を上部に重ねる。null なら何もしない。
- `xz5/c.c` は表示位置（`z56/c`：`HEADER` / `EMBEDDED`）が `HEADER` のときだけ、広告の種類を `s16.c.c(場所, chatId, Continuation)` に問い合わせる。
- `s16.c.c` は `t16/f.a` へ委譲し、`z56/a`（`LAD` / `GOOGLE` / `NONE`）を返す。判定は端末内の Square の情報と、場所ごとの広告設定（`q16/b`）による。
- `LAD` なら LAD のバナー（`i06/c`）、`GOOGLE` なら Google のバナー（`h06/e`、`chat_ui_header_google_banner_ad_root`、ログタグ `SQ.AD.ChatroomHeaderGoogleBannerAdView`）を作る。`NONE` なら null（スレッドホームは `Unit`）を返し、広告枠を作らない。
- `xz5/j.a`、`xz5/l.a`、`xz5/h.c` も同じく `s16.c.c` を 1 回呼び、`NONE` なら広告枠を作らずに終わる。`s16.c.c` を呼ぶ箇所は全 15 DEX でこの 4 か所だけ。

## 埋め込み広告

- オープンチャットのトークのメッセージ一覧の行（`lq1/x`）が `chat_ui_ad_container_viewstub` を渡して `k06.a.a(...)`（`xz5/c.a`、戻り値なし）を呼ぶ。
- `xz5/c.a` は表示位置が `EMBEDDED` のときだけ `f06/b` の ViewModel と `e06/e` の view を作る。`s16.c.c` は通らない。

## 書き換え

| PatchId | 対象 | 設定 ON | 設定 OFF・読み取り失敗 |
| --- | --- | --- | --- |
| `linimal.patch.square-ads-type-gate` | `s16.c.c`（registers=8、ins=4） | `z56/a.NONE` を返す | 元の先頭命令 `new-instance v0, Lt16/f;` へ分岐 |
| `linimal.patch.square-ads-embedded-gate` | `xz5/c.a`（registers=23、ins=8） | `return-void` | 元の先頭命令 `move-object/from16 v0, v16` へ分岐 |

- hook は `SquareAdsHooks.shouldSuppressAds()`。設定の健全性が OK でないときや例外時は false を返す。
- hook の結果は v0 に置く。入口では引数以外の register は未初期化で、元の命令列は書き込む前に読めないため、先頭が分岐先や例外 handler でなければ壊れない（`isSafeInjectionIndex` で確認）。
- 対象特定は難読化名に頼らない。Factory の `createComponent`（bridge でない方）の `new-instance` から実装を辿り、`xz5/c` の中の「`Enum` を返す 3 引数の invoke-virtual」1 件を `s16.c.c` とする。その結果を `check-cast` する型が、enum 定数がちょうど `LAD`・`GOOGLE`・`NONE` の enum であることを確かめる。4 実装がそれぞれ 1 回ずつ呼ぶことも確かめ、満たさなければどちらも書き換えない。
- 広告枠を作る前で止めるため、その枠の広告の読み込みは始まらない。ホーム広告と同じく通信の遮断ではない。表示位置の取得（`s16.c.a`、`i81/f` からの先読み）は変更しない。

## 不採用

- `sy1/a` など呼び出し側での抑制：場所ごとに呼び出し側が異なり、4 か所＋埋め込みを個別に塞ぐ必要がある。
- 表示位置（`s16.c.a`）の書き換え：戻り値が `r66.a` に包まれた結果型で、失敗を表す値と区別が必要になる。
- 作られた view を隠す実装：広告の読み込みや表示の計測が走ったあとに隠すことになる。
