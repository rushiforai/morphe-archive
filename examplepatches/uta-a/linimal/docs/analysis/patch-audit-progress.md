# パッチ実装・注入位置の調査進捗

## 現在の状態

調査・検証・結果整理は完了。推奨順の 1〜5 は完了。修正後の APK を実機で確認した（「実機確認」を参照）。
修正内容と検証結果は「修正の実施状況」を参照。以降の節は修正前の調査結果をそのまま残している。

対象は LINE 26.16.0、versionCode 261600106、arm64-v8a。
全54パッチ定義を対象に注入処理を中心に確認した。サブエージェントで分担し、上限で終了した範囲は再分割した。最後に残った Premium・メニュー・外部リンクの6ファイルは親エージェントが直接確認した。

大半のパッチは現行位置の維持が妥当。全面的な移設よりも、限定的な位置改善と安全性検証の強化を優先する。

機能コードや端末設定は変更していない。このファイルは調査の引き継ぎ用であり、修正済みの記録ではない。

## 完了した検証

| 項目 | 結果 |
| --- | --- |
| パッチ側 JVM テスト | 374件成功 |
| runtime 側 JVM テスト | 364件成功 |
| preflight 回帰テスト | 6件成功 |
| 対象 APKM のハッシュ・署名を含む preflight | 成功 |
| 現行コードの bundle ビルド | 成功 |
| Morphe Desktop CLI 1.14.0 による対象 APKM への適用 | 成功。未署名の一時 APK を生成 |
| 埋め込み patch-status | 72件すべて OK。expected と actual が一致 |
| 生成された全15 DEX の dexdump・d8 検査 | 成功 |

Gradle は Java 17、`--no-daemon`、`--offline` で実行した。テストは `--rerun-tasks` を付けて再実行した。
一時 APK・抽出 DEX・今回の DEX 調査結果は検証後に削除した。実機へのインストールや今回の ART 検証は行っていない。

以上は適用・静的検査の結果であり、全経路の意味的な正しさや最適な注入位置まで保証するものではない。

## 確認済みの不具合

### 既読なし閲覧の終了猶予が設定 OFF 後も残る

対象ファイル:

`extensions/linimal/src/main/java/dev/utaa/linimal/extension/features/readwithoutreceipt/ReadWithoutReceiptHooks.java`

- `shouldBlockMarkAsRead` は設定確認より先に終了猶予を判定する。
- `clearDisabledSuppression` は閲覧セッションを消すが、終了猶予は消さない。
- 終了猶予は入口種別を保持せず、終了後2秒間に適用される。

終了猶予を作った後に両入口を無効化する JVM 検証で、猶予が残り、既読抑制の判定が true になることを再現した。実機での再現確認は未実施。

修正候補は注入位置の移動ではなく、終了猶予にも通知・メニューの入口別設定を適用し、OFF・適用不可になった入口の猶予を破棄すること。

## より良い注入位置の候補

| 対象 | 改善方向 | 残る確認 |
| --- | --- | --- |
| Google ログイン | プロセス共通の60秒間の待機状態ではなく、要求と client の取得・接続を直接対応付ける | 現行 DEX の `g8/m.g` 内で client 取得境界を確認。ただし wrapper と接続 client の対応、接続の共有範囲、キャッシュの分離が未確認 |
| Smart Channel | UI state 処理全体を飛ばす方式から、公式 cleanup・完了処理を残して表示・生成・bind だけを抑制する方式へ絞る | 正確な分岐先と lifecycle を追加解析する。空白を防ぐ枠 gate は残す |
| ホーム読み込み表示 | renderer が他画面と共有されている場合だけ、GCS 側の呼出箇所や局所 wrapper へ限定する | 全 caller を確認する。共有がなければ現位置を維持する |

Google ログインの要求と接続の競合は ADR 0004 に記載済みの制約。今回初めて発覚した実機障害ではない。client に印を付けるだけで接続共有まで解決するとは断定できない。

## 位置を維持して強化したい箇所

以下のパスは `patches/src/main/kotlin/dev/utaa/linimal/patches/` を基準とする。

| 対象 | 改善内容 |
| --- | --- |
| `features/ads/SmartChannelAdsPatch.kt` | 3対象すべての注入計画を検証してから変更する。現在は後続検証に失敗しても先行注入が残る。runtime の必須 ID 判定により機能は無効になるため、部分抑制が有効になると断定しない |
| `features/readreceipts/MainChatReadReceiptPatch.kt` | queue 初期化の固定名 `a` を使わず、元命令から導出した MethodReference を保持して使う。現行 DEX の初期化名は `a` で成立している |
| `features/navigation/MainTabsPatch.kt` | 同一メソッド内の編集を実 index の降順にする。現在は wallet と button の位置関係を暗黙に仮定している |
| 広告・一部 Agent i／LINE AI | 注入位置への既存分岐・handler 流入の検査を揃える |
| Home 系・Agent i Composer | 既存 skip／null 分岐が目的の終了・引数供給へ到達することと、receiver の対応を制御フローで確認する |
| local 既読 block・bootstrap 等 | 1引数の呼出しを range 化するか、高位レジスタを明示的に拒否する。現行 DEX で不正レジスタを確認した指摘ではない |
| `features/ads/HomeTopAdPatch.kt` | catalog が複数一致した場合も0件として記録する診断を修正する |
| `features/chat/ChatListHeaderButtonsPatch.kt` | List を取る確定処理の戻り型も、List またはその派生型であることを検証する余地がある。現行 DEX は List の派生型を返す |

これらの多くは形状検証や診断の不足。現行26.16.0で誤動作を再現したものとは区別する。

## 現行位置を維持したい対象

| 対象 | 維持する理由 |
| --- | --- |
| FIS | `X-Android-Cert` 設定直前で1ヘッダーだけを変更できる。共通 HTTP・署名取得層へ広げない |
| 既読なし閲覧 | ローカル未読更新前と実 RPC 入口の二重防御が必要 |
| 手動既読 | 共通 executor ではなく明示的操作の caller で識別できる |
| プレビュースクロール | 購読判定を変更せず、描画用 boolean の consumer だけを補正する |
| 設定の Agent i・Premium | 元判定後の単一 boxed return 直前なら合流点への注入を避けられる |
| ホームのおすすめ枠 | cleanup・removeAllViews 後なので既存表示や tracker を残しにくい |
| 外部ブラウザ | 現行 DEX の対象 preset の静的参照元は本文リンク経路に限定されていた。汎用 URI 処理への拡張は不要 |
| Premium 案内・各メニュー・AMOLED | 今回の確認では移設を勧める根拠なし |

Google アカウント選択の return 直前への注入には分岐先検証を追加する余地がある。ただし現行26.16.0の対象メソッドには return への該当分岐がないことを DEX で確認したため、現行不具合には数えない。

## 未実施・限界

- 修正コードと回帰テストの追加。
- 全パッチの全経路に対する制御フロー・型・レジスタ生存解析。
- Google client・接続共有の詳細解析。
- Smart Channel が飛ばす lifecycle 処理の全確認。
- Home 読み込み renderer の全 caller 確認。
- Compose の changed mask・remember・restart と初回 composition の追加確認。
- 一部生成メニュー以外も含む runtime・テスト本文の全件精読。
- 今回生成した APK の実機動作と ART verifier の確認。

既存資料には26.11.0の解析や、実機成功の追記前の記述も残る。現行26.16.0で独立確認した結果と旧版由来の情報を混同しないこと。

## 修正の実施状況

### 実施した修正

| 対象 | 内容 |
| --- | --- |
| 既読なし閲覧の終了猶予 | 猶予に入口種別を持たせた。`shouldBlockMarkAsRead` は入口別設定を読んでから猶予を判定し、OFF・適用不可の入口の猶予は破棄する。`clearDisabledSuppression` も同じ猶予を消す。破棄した猶予は再度 ON にしても復活しない |
| Smart Channel | 3 対象をすべて検証してから注入する（`applyAllOrNone`）。1 件でも形が違えば何も書き換えない。3 注入位置に分岐先・handler 先頭の検査も追加 |
| 通常チャットの既読 queue clear | queue 初期化の固定名 `a()V` をやめ、元の monitor-enter 直後の invoke-virtual から導いた MethodReference を使う |
| 下部タブ | wallet tooltip と button 位置の注入を、実際の index の降順で適用する（`applyEditsFromLast`）。同じ index なら適用しない |
| 単一引数の hook 呼出し | 全パッチの `invoke-static { vX }` / `{ pX }` を `invoke-static/range { vX .. vX }` に統一。レジスタ番号によらず有効 |
| 分岐・handler 流入の検査 | 共通の `isSafeInjectionIndex` を追加し、未検査だった Agent i（Composer・トーク一覧検索・ウォレット）、LINE AI（入口・ギャラリー・長押し）、外部ブラウザ、設定入口、ローカル未読 clear、Google（アカウント選択の return 直前・診断・Sign-In 分岐）に適用 |
| Home 系 5 パッチ | `composeSkipReachesGroupEnd` を追加。`shouldExecute` の false 側が、同じ composer（move-object の写しを含む）の `skipToGroupEnd` → `endRestartGroup` へ一本道で進むことを確かめる |
| Agent i Composer | null 側の分岐先から一本道で `const/4 argument, 0` に着くこと、holder constructor の receiver が生成した holder（写しを含む）であることを確かめる |
| Home 上部広告 | catalog の複数一致を実際の一致数で記録し、ERROR にする（以前は 0 件扱い） |
| トーク一覧上部ボタン | 一覧を確定する呼出しの戻り型が List かその実装型であることを、アプリ内のクラス階層と既知の JDK List 型で確かめる（`isListType`） |

### 修正後の検証

| 項目 | 結果 |
| --- | --- |
| パッチ側 JVM テスト | 386件成功（+12） |
| runtime 側 JVM テスト | 367件成功（+3） |
| preflight 回帰テスト・対象 APKM の preflight | 成功 |
| bundle ビルドと Morphe Desktop CLI 1.14.0 による対象 APKM への適用 | 成功。未署名の一時 APK |
| 埋め込み patch-status | 72件すべて OK。新しい検査で PARTIAL・ERROR になった対象はない |
| 全15 DEX の dexdump・d8 検査 | 成功 |

### 実機確認（2026-11-11）

XIG07（arm64-v8a、SDK 36）の LINE 26.16.0 patched へ、同じ署名でデータを残して上書き install した。

| 項目 | 結果 |
| --- | --- |
| install、ART 全 DEX verify、cold start | 成功。確認の間を通して FATAL EXCEPTION と VerifyError は 0 件 |
| ホーム | プロフィール、サービス、友だちリストだけになり、特集・動画カード・広告などは表示されない |
| 下部タブ | ホームとトークだけ |
| トーク一覧 | 上部ボタンは追加ボタンだけ。検索バーの AI ボタンと Smart Channel は表示されない |
| トーク画面 | 入力欄に Agent i のチップバーが表示されない |
| Linimal 設定 | すべての区分が表示される |
| 既読をつけずに読む | 読んで閉じても相手側に既読がつかない。設定を OFF にして開くと既読がつく（利用者が確認） |
| Google ログイン | ログアウト後の再ログインで Credential Manager から MicroG-RE の `AssistedSignInActivity` が開き、ログインに成功した |

終了猶予（閉じてから 2 秒）の間に設定を OFF にする操作は手では間に合わないため、猶予の破棄は JVM テストでだけ確認した。
Google ログインの時間窓の懸念（接続済みの状態でのログイン）は、今回の手順では起きない状況のため未確認。

### Google ログインの接続境界（推奨順 5）

`docs/analysis/google-sign-in-auth.md` の「要求と接続の対応」に解析を記録した。Sign-In client の options（`uq/v`）は
すべて等価で、同じプロセスの wrapper は 1 つの接続（`ds/n`）を共有する。`ds/n` は options も wrapper も受け取らないため、
要求に印を付けても bind 先の判定から読めない。直接対応付けるには ApiKey を分ける変更が要り、影響が現行より広いので
移設しない。ADR 0004 の決定は変えない。時間窓に残る懸念（接続済みのときに準備が消費されず残ること、MicroG-RE への
接続が切れるまで共有されること）は実機で確かめる。

## 次の作業の推奨順

1〜5 と実機確認は完了した。残りは次のとおり。

1. Google ログインの時間窓の懸念（接続済みの状態でのログイン、準備が残る場合の影響）を確かめる方法を検討する。
   問題があれば、要求の完了・失敗時に準備を破棄するなど、時間窓のまま狭める方向で対処する。
