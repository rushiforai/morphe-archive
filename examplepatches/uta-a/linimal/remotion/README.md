# Linimal 紹介動画

## デザイン案（Hallmark で作り直したもの）

最初の版（`LinimalPromo`）にあった AI スロップの典型（CSS で描いたスマホの枠、全シーンの小見出し、全要素の浮き上がり、左端だけ太い線のカード、暗い背景での発光、毎回同じ配置、中央揃え）をなくした 2 案です。内容は共通で、尺は実務的版が 49 秒、編集的版が 72 秒です。

| composition | 出力 | 方向 | 主な特徴 |
| --- | --- | --- | --- |
| `LinimalUtility` | `out/linimal-utility.mp4` | 実務的 | 緑みのある黒、Hiragino Sans ＋ Menlo、罫線の表、画面下に全体の進行表示、カットでつなぐ。49 秒。画面の操作とテキストの出現は 1.5 倍速（`src/utility/Video.tsx` の `SPEED`） |
| `LinimalEditorial` | `out/linimal-editorial.mp4` | 編集的 | 紙色、明朝の見出し、番号付きの図版とキャプション、図版を左右交互に配置、ゆっくりしたフェード |

```sh
npm run render:utility
npm run render:editorial
```

- 配色とフォントは各案の `src/<utility|editorial>/tokens.ts` にまとめてあります（先頭に Hallmark の記録コメントあり）。
- 画面のモック演出は `src/shared/screens.tsx` を両案で共有しています。Before 画面で消える箇所を囲む枠の座標も、ここにある `MARKS` です。
- 最初の版は `LinimalPromo`（`src/Video.tsx`）として残してあります。

## 動画の作り方

```sh
cd remotion
npm install
npm run studio   # プレビュー（Remotion Studio）
npm run render   # out/linimal-promo.mp4 を書き出す（1920×1080、30fps、約 72 秒）
```

シーンの並びと長さは `src/Video.tsx`、各シーンは `src/scenes/index.tsx`、スマホ枠や見出しなどの部品は `src/components.tsx` にあります。

| # | シーン | 長さ | 使う素材 |
| --- | --- | --- | --- |
| 1 | オープニング | 5 秒 | ワードマーク、実機画面 3 枚 |
| 2 | トーク一覧 Before / After | 8 秒 | `line-talk-list-before.png` → `line-talk-list.png` のワイプ |
| 3 | ホーム Before / After | 7.5 秒 | `line-home-before.png` → `line-home.png` |
| 4 | 章タイトル「既読をつけずに読む」 | 2.5 秒 | — |
| 5 | スクロールプレビュー | 8 秒 | `talk-list-unread-kept.png` を長押し → `scroll-preview-mock.png`、カード内で `chat-mock-messages-tall-preview.png` をスクロール |
| 6 | 既読をつけずに開く | 5.6 秒 | `scroll-preview-mock.png` のメニューをタップ → `room-read-disabled-mock.png` がスライドイン |
| 7 | 未読のまま残る | 4.5 秒 | `talk-list-unread-kept.png`（Linimal 行を強調） |
| 8 | すべて既読にする | 5.5 秒 | `room-read-disabled-mock.png` → `room-read-enabled-mock.png`、トーストは React で描画 |
| 9 | 通知から開く | 5.5 秒 | `notification-shade-mock.png` をタップ → `room-read-disabled-mock.png` |
| 10 | 設定 | 8 秒 | `linimal-page-hide-full.png` をスクロール |
| 11 | 設計の方針 | 6 秒 | — |
| 12 | エンディング | 6 秒 | ワードマーク、URL、注意書き |

音声は入れていません。

動画にはテスト配信の中身（「f」「l」「test」など）を映さない方針です。実機の操作は、実画面の UI に合わせたモック画像を `src/scenes/mock.tsx` で動かして再現しています（タップの表示は `Touch`）。`recordings/` の実機動画と、名前が `-mock` で終わらない `screenshots/chat/` の実画面は、紹介動画では使っていません。

---

# 素材

Remotion から `staticFile()` で読めるよう、素材はすべて `public/` 以下に置いています。

## コミットしていない素材

テスト配信の中身（「f」「l」「test」など）や Linimal 公式アカウントの名前・アイコンが写った実画面と実機動画は、`.gitignore` で除外してローカルにだけ置いています。下の表で「（ローカルのみ）」と書いたファイルです。紹介動画はモックだけを使うので、これらがなくても書き出せます。

## 収集日と前提

- 収集日: 2026-11-06（Linimal v0.11.0、LINE 26.16.0）
- 実機: XIG07（1220×2712、ダークモード）
- 実機画像のうち、名前・アイコン・トーク本文が写る画面は架空のモックに置き換え済み。置換前の画像は保存していません。

## screenshots/（1220×2712 PNG）

| ファイル | 内容 | 加工 |
| --- | --- | --- |
| `line-talk-list.png` | トーク一覧。Smart Channel 広告と検索欄の Agent i がない状態 | トーク名・アイコン・本文・時刻をモックに置換 |
| `line-home.png` | ホーム。広告・Agent i・フィードを消した状態 | 自分のアイコンと名前、友だち・グループの一覧をモックに置換 |
| `line-settings-top.png` | LINE の設定画面の上部（Agent i の行がない） | プロフィール画像をモックに置換 |
| `line-settings-linimal-entry.png` | LINE の設定画面の最下部にある `Linimal` の入口 | なし |
| `linimal-settings-top.png` | Linimal 設定のトップ（5 ページ） | なし |
| `linimal-page-ads.png` | 広告ページ | なし |
| `linimal-page-agent-i-1.png` / `-2.png` / `-full.png` | Agent i・LINE AI ページ（`-full` は縦長に結合、1220×3209） | なし |
| `linimal-page-hide-1.png` / `-2.png` / `-full.png` | 表示を消すページ（`-full` は 1220×4642） | なし |
| `linimal-page-read.png` | 既読ページ | なし |
| `linimal-page-general-1.png` / `-2.png` / `-full.png` | 一般ページ（`-full` は 1220×2885） | なし |

縦長の `-full.png` は、縦スクロールのアニメーション用です。

### Before / After 比較用

Before は、広告・Agent i・表示を消すの 26 スイッチを一時的に OFF にして LINE を再起動し、公式 LINE に近い状態で撮影したものです（撮影後に設定は元へ戻しています）。

| Before | After | 見どころ |
| --- | --- | --- |
| `line-talk-list-before.png` | `line-talk-list.png` | 上部の AI Friends・カレンダー・オープンチャット、検索欄横の Agent i、下部タブ 5 個 → 2 個 |
| `line-home-before.png` | `line-home.png` | Agent i、投稿カード、話題、下部タブが消える |
| `line-settings-top-before.png` | `line-settings-top.png` | 設定画面の Agent i の行が消える |

- トーク一覧の Before / After は同じモックデータで描き直しているので、そのまま重ねてワイプできます。ステータスバーの時刻だけ異なります（4:14 と 3:58）。
- `line-home-before.png` の投稿カードは、第三者の写真・動画が写っていたため強いぼかしに置き換え、投稿元と話題の文言もモックにしています。

### screenshots/chat/（スクロールプレビューと既読をつけずに読む）

開いたトークは、テスト配信だけに使っている「Linimal」だけです（Linimal の公式アカウントなので、ヘッダーに「担当者が返信します」と出ます）。実画面には「f」「l」「test」などのテスト文が写っています。名前が `-mock` で終わるファイルは、実画面の UI をそのまま使い、メッセージだけを実際の運用に近いモックの会話（Linimal のリリースのお知らせ）に描き直したものです。

| ファイル | 内容 | 加工 |
| --- | --- | --- |
| `scroll-preview-1.png` / `-2` / `-3`（実画面はローカルのみ） | トークの長押しで開くスクロールプレビュー。メニューの先頭に「既読をつけずに読む」がある。`-2`・`-3` はスクロール後 | 背後に透けていたトーク一覧を、暗くしたモック一覧に差し替え |
| `scroll-preview-mock.png` / `-mock-scrolled.png` | 上のモック版（会話の最新部分／上へスクロールした状態） | 同上に加えてメッセージを描き直し |
| `room-read-disabled.png` / `-mock.png`（実画面はローカルのみ） | 「既読をつけずに読む」で開いたトーク。「現在、既読は無効です」の案内と「すべて既読にする」ボタン | `-mock` はメッセージを描き直し |
| `room-read-enabled.png` / `-mock.png`（実画面はローカルのみ） | 「すべて既読にする」を押した後。案内とボタンが消える | 同上 |
| `talk-list-unread-kept.png` | 既読をつけずに読んで一覧へ戻った状態。未読バッジ「1」が残っている | Linimal 以外の行はモック |
| `talk-list-after-mark-all-read.png` | 「すべて既読にする」の後。未読バッジが消えている | 同上 |
| `notification-shade.png` / `-mock.png`（実画面はローカルのみ） | Linimal のメッセージ通知（通知シェード） | 他アプリの通知は消して背景をぼかし、Linimal の通知だけを上へ移動。`-mock` は本文をモックの最新メッセージに置換 |
| `room-read-disabled-from-notification.png`（ローカルのみ） | 通知から開いたトーク。通知からでも「現在、既読は無効です」の案内と「すべて既読にする」が出る | なし |
| `room-message-menu.png`（ローカルのみ） | メッセージの長押しメニュー（LINE AI の項目なし） | なし |
| `room-attach-menu.png`（ローカルのみ） | トークの＋メニュー（公式アカウントとのトークなので 3 項目だけ） | なし |
| `chat-mock-messages-tall-preview.png` | 上の画像をプレビューのカード内の座標で描き直したもの（日付の表示がカードの中央に来る） | — |
| `chat-mock-messages-tall.png` | モックの会話全体を縦長 1 枚にしたもの（1220×2155）。スクロールのアニメーション用 | — |
| `part-*.png` | 合成用に切り出した部品（ボタン、入力欄、プレビューのメニュー）。案内・ヘッダー・アイコンの部品はローカルのみ | — |

トーク一覧の 2 枚は同じモックデータで描いているので、「未読のまま → 既読」を差し替えるだけで見せられます。

## recordings/

| ファイル | 内容 |
| --- | --- |
| `linimal-settings-tour.mp4` | Linimal 設定の各ページを開いてスクロールする操作（約 39 秒、1220×2712、30fps、音声なし）。個人情報が写る画面は含みません |
| `scroll-preview.mp4`（ローカルのみ） | プレビュー内のスクロール（10.9 秒）。背後のトーク一覧は全フレームで暗くしたモックに差し替え |
| `read-without-receipt-open.mp4`（ローカルのみ） | プレビューで「既読をつけずに読む」を押す → 案内付きでトークが開く（5.7 秒）。遷移中の約 0.6 秒は実際のトーク一覧が映っていたため切り取り、クロスフェードでつないでいる |
| `notification-open.mp4`（ローカルのみ） | 通知シェード（静止画）→ 通知をタップして既読なしでトークが開く（9.1 秒）。通知シェードの開閉と、ホーム画面が映る遷移は切り取り、0.5 秒のクロスフェードでつないでいる |
| `mark-all-as-read.mp4`（ローカルのみ） | 「すべて既読にする」を押す → 案内とボタンが消え、「既読処理を実行しました」のトーストが出る（7.9 秒） |

## diagrams/（1920 幅、SVG と PNG）

| ファイル | 内容 |
| --- | --- |
| `patch-flow` | APKM → Morphe → Linimal 版 LINE のパッチ適用の流れ |
| `architecture` | build-time（patches/、Kotlin）と runtime（extensions/、Java）の構成 |
| `fail-open` | パッチ・設定・例外の判定で、迷ったら公式 LINE の動作に戻る仕組み |
| `read-without-receipt` | 既読をつけずに読む機能の流れ |
| `migration-steps` | 公式 LINE からの移行 4 手順 |

SVG の各ボックスには `id`（例: `q1`、`s2`、`step3`）を付けてあるので、Remotion で要素ごとに出現アニメーションを付けられます。

## brand/

- `wordmark-*.svg/png`、`icon.svg/png`: 動画用に作った仮のワードマーク。Linimal の公式ロゴは存在しません。LINE・Morphe のロゴは商標のため含めていません。
- `palette.json`: 図版の配色と、実機画面の背景色（LINE ダークモード `#111111`、Linimal 設定 `#1B1B1B`）。

## data/

| ファイル | 内容 |
| --- | --- |
| `project.json` | 概要文、対象バージョン、導入・移行手順、設計方針、規模の数値（コミット数、リリース数、スイッチ数など） |
| `features.json` | README の機能表 25 行（ページ、設定名、初期値、説明） |
| `chat-ui-spec.json` | 実機で計測したトーク画面・スクロールプレビュー・トーク一覧の色、位置、文字サイズ。React コンポーネントで作り直すとき用 |
| `releases.json` | GitHub Releases 18 件（タグ、公開日時、リリースノート全文） |

## 動画で使うときの注意

- Linimal は LINE・Morphe の公式プロジェクトではないことを動画内でも明記する（`project.json` の `disclaimer`）。
- 「送信しても既読を有効にしない」と、Google 連携で署名を公式版と申告する点には README に警告があります。紹介する場合は注意書きを添える。
