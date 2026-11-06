# トーク一覧の長押しプレビュー（スクロールプレビュー、LINE 26.16.0）

LINE 26.16.0 の APK を JADX と dexdump で読んだ結果をまとめる。難読化名は 26.16.0 時点のもので、パッチは名前ではなく下記の目印で特定している。

## 長押し時の分岐

- `com.linecorp.line.chattab.ChatScrollPreviewAvailability`（`u42/f`）の `resolvePlan` がプラン `pi1/d` を決める。
  - サーバー設定 `ChatScrollPreviewConfig`（`ya5/w`、mode = OFF / LABS / LYP）が OFF なら null。
  - LABS なら LINE ラボの切り替え（`chat.scrollpreview.enabled`）に従って `LABS`。
  - LYP なら `se3.b.SCROLL_PREVIEW` の結果に応じて `LYP_MEMBER` / `LYP_LITE` / `LYP_NON_MEMBER` を決める。
- プランが null なら従来の長押しメニュー（Compose のダイアログ）を開く。それ以外は `ChatHistoryPreviewActivity` を開き、Intent に `extra_preview_item`（`pi1/b`）と `extra_preview_plan` を渡す。
- `readWithoutReceiptComposeMenuPatch` が行を足すダイアログは、プレビューが開く場合には表示されない。v0.10.3 まで「既読をつけずに読む」の行が消えていたのはこのためである。

## プレビュー画面

`ChatHistoryPreviewActivity` はプランから `nx1/z0` の実装を選ぶ（`nx1/e`）。

| プラン | 実装 | スクロール `a()` | バナー | 誘導先 `d()` |
| --- | --- | --- | --- | --- |
| LABS | `nx1/c0` | true | 「画面をスクロールできます」（NEW） | NONE |
| LYP_MEMBER | `nx1/e0` | true | 「画面をスクロールできます」 | NONE |
| LYP_LITE | `nx1/d0` | false | 「未読のまま過去のトークを確認可能」 | LYP_BENEFIT_STATUS |
| LYP_NON_MEMBER | `nx1/f0` | false | 「未読のまま過去のトークを確認可能」（premium_check_banner） | LYP_BENEFIT_HOME |

- `a()` は公式のスクロール可否を返す。Linimal の「プレビューをスクロール可能にする」が OFF のときはこの結果を維持し、ON のときだけ画面へ渡す boolean を true にする。元の model の選択自体は変更しない。
- 結果の受け取りは `ChatTabComposeFragment` の `u42/j`。結果 1（`extra_preview_open_full_chat_id`）で通常どおりトークを開き、結果 2（`extra_preview_menu_callback`、`pi1/c`）でメニューの選択を処理する。

### Compose の構造

- `rx1/c0.e(j, pi1/b, nx1/r0 バナー, rx1/i 誘導行, …, Composer, int)` が画面全体を描く。呼び出し元は `nx1/r.invoke` だけである。
- バナー `nx1/r0`（toString `PreviewBanner(`）の `chipDestination` が NONE 以外だと、タップで `openLypPremiumFromChip` に進み Premium 画面を開く。
- 誘導行 `rx1/i`（toString `ChatPreviewPromotionMenuItem(withGreenDot=`）は `d() != NONE` のときだけ作られる。ラベルは「スクロールプレビュー」で、押すと `openLypPremiumFromMenu` に進む。
- メニューは `rx1/c0.f(pi1/b, rx1/i, callback, Function0, Modifier, Composer, int)` が Column を開いて `rx1/h.a(rx1/a, rx1/i, Function0, callback, Composer, int)` を呼ぶ。
  - `rx1/a`（toString `ChatPreviewMenuItems(items=`）の中身は `a71/f.b(pi1/b)` で、長押しメニューと同じ行一覧である。
  - `h.a` は誘導行があれば先に描き、続いて一覧の各行を `h.b(Function0, ComposableLambda, Composer, 0x30)` で描く。ラベル lambda（`rx1/d`）は `h.c(String, Composer, 0)` を呼ぶ。
  - group は Composer 実体型 `j3/d1` の `q(I)V` と `X(Z)V`（false）で開閉する。

## Linimal の対応

### 既読をつけずに読む（`readWithoutReceiptPreviewMenuPatch`）

- `c0.f` の `h.a` 呼び出しの直前（Column の中で LINE の行より前）へ、extension の `ReadWithoutReceiptPreviewMenuRow.render(pi1/b, j3/d1)` の呼び出しを 1 命令だけ挿入する。
- `render` は `pi1/b` の唯一の String field（chatId）を読む。表示する場合も表示しない場合も、`q` / `X` で別 key の group を発行する。行の描画は `h.b`、ラベルは `h.c` の複製で、文字列は `ChatListMenuHooks.menuLabel()` から取る。
- 注入の条件は次のとおり。
  - トーク model の register が、どの経路でも第 1 引数から move した値であること（分岐を辿る解析で確認）。
  - Composer の register は、分岐より前で startRestartGroup の結果を受けた後、書き換えられていないこと。
  - 注入位置は分岐先ではないこと。
- 押すと `ReadWithoutReceiptAction` が動く。`ReadWithoutReceiptPreviewDismiss` が、Application の lifecycle callback で覚えておいたプレビュー画面を finish し、長押しメニューと同じく `line://nv/openChatroom` でトークを開く。

### プレビューの Premium の案内を表示しない（`premiumPreviewPromotionPatch`）

- `c0.e` の入口で、バナーと誘導行の引数を hook に通す。設定 ON のとき、`chipDestination != NONE` のバナーと誘導行を null に差し替える。どちらの引数も元から nullable である。
- タップ先のない「画面をスクロールできます」の案内は残す。スクロール可否・課金・通信は変更しない。

### プレビューをスクロール可能にする（`previewScrollPatch`）

- 初期 OFF の独立設定 `linimal.preview.scroll`。Premium 案内の非表示とは独立し、変更は再起動後に反映する。
- 全 15 DEX で `nx1/z0.a()Z` の呼び出しは `fk3/w0.invoke()` の 1 件だけ。結果 `v9` はプレビュー画面 model `nx1/h1` の唯一の boolean 引数へ渡される。
- `nx1/h1.d` の読み取り先は `rx1/d0(Context, RecyclerView, Z, ...)` で、同じ scrollEnabled field が `onScroll` と `onFling` の両方を制御する。これがプレビューの nested gesture を制御する UI 境界である。
- `openFullChat()V` と `countVerticalScroll()V` の文字列で候補を特定し、Activity callback 型を含む model のコンストラクタ、判定の型・register、途中の上書き、分岐先・例外 handler を検査する。一意に安全確認できた場合だけ `move-result v9` の直後へ `PreviewScrollHooks.allowScroll(Z)Z` を挿入する。
- hook は元の結果または設定 ON なら true を返す。設定 OFF・未初期化・適用不可・設定エラー・例外では元の結果を維持する。元から true の結果を false にはしない。
- プレビュー画面の提供条件、LINE ラボ、課金・購読 API、通信、既読の経路は変更しない。この設定だけで Premium の案内は消えない。

## 確認状況

- 全 DEX を判定関数で直接走査し、上記の一意性と形状を確認した。
- スクロール有効化の追加後、Java 17 の全テスト・`buildAndroid`・一覧再生成、exact APKM の preflight と Morphe 適用が成功。embedded status 72 件すべて OK、スクロールは 1/1、全 15 DEX の dexdump と d8 を確認した。
- 生成 APK の命令列で、公式判定の `move-result v9` → `allowScroll(Z)Z` → `move-result v9` の注入を確認した。生成 APK の status を読み、実 runtime の設定保存・再起動・ON/OFF・適用不可を JVM smoke で確認した。
- XIG07 上の独立検証アプリに実 runtime と生成 APK の status を入れ、実設定画面の独立スイッチ、初期 OFF、再起動案内、ON/OFF の保存とプロセス再起動後の hook の false→true→false を確認した。
- XIG07 の LINE へデータを保持したまま上書きし、設定 ON・再起動後にプレビューが問題なくスクロールできることを利用者が実アカウントで確認した。起動後と操作後の FATAL EXCEPTION と VerifyError は 0件。
