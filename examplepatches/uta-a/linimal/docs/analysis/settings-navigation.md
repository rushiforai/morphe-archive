# Linimal 設定階層の実装

## 対象

- LINE 26.11.0
- versionCode 261100124
- package `jp.naver.line.android`
- Linimal Settings Activity `dev.utaa.linimal.extension.settings.LinimalSettingsActivity`

## 目的

初期の設定画面は全機能とPatch Statusを一枚に並べていた。機能追加により項目が増えたため、子ページへ分ける。

Patch Statusページはその後削除した。適用状況の確認は開発時の診断用であり、通常の利用では参照しない情報だからである。patch statusの仕組み自体は残し、必須patchが揃わない機能を無効へ倒す判定と、statusを読めない場合の案内に引き続き使う。

分け方は目的別とする。最初の分割では `Tabs` / `Home` / `Chat` という場所別のページと `Agent i` という種類別のページが混在し、ある項目をどちらの手掛かりで探せばよいかが一貫していなかった。そこで「広告を消す」「AIの入口を消す」「表示を消す」「既読を制御する」というユーザーの目的でページを分け、場所はページ内の小見出しへ落とした。これにより、ページの選択は目的だけで決まり、場所はページを開いた後の絞り込みになる。

一つのActivity内でページスタックを管理する。新しいActivity、Fragment、Service、Providerは追加しない。

## ページ構成

```text
Linimal
├─ 広告
│   ├─ 広告
│   └─ Premium の案内
├─ AI 機能
│   ├─ 画面の上部
│   ├─ トーク
│   └─ 設定
├─ 表示項目
│   ├─ 下部タブ
│   ├─ トーク一覧
│   ├─ ＋メニュー
│   └─ ホーム
├─ プライバシー
├─ 既読者
│   ├─ 自分のメッセージ
│   ├─ 相手のメッセージ
│   ├─ 一覧の開き方
│   └─ 同期
├─ トーク
│   ├─ プレビュー
│   └─ リンク
├─ 外観
└─ 通知とログイン
```

階層は Root と子ページの二段のままとする。小見出しは子ページの中の見出しであり、page IDを持たない。

カテゴリ名は一般的なアプリの設定に合わせた短い名詞にする（外観、プライバシー、通知とログイン など）。項目名は「〜を非表示」「〜を表示」のように、ON にしたときの結果が分かる短い形にする。小見出しで場所が分かるときは、項目名から場所の前置きを省く。

内部のpage IDは次のとおり。表示名を変えても、保存済みのpage IDとの互換は考えない（解決できないIDは ROOT に戻す）。以前の版の `CHAT` は別の意味で使っていたため、トークのページは `TALK` とする。

```text
ROOT
ADS
AGENT_I
HIDE
READ_RECEIPT
READ_RECEIPT_READERS
TALK
THEME
NOTIFICATIONS
```

小見出しのIDは `SettingsSection` が持つ。

```text
ADS_ADS
ADS_PREMIUM
AGENT_I_SCREEN_HEADERS
AGENT_I_CHAT
AGENT_I_SETTINGS
HIDE_BOTTOM_TABS
HIDE_CHAT_LIST_HEADER
HIDE_CHAT_PLUS_MENU
HIDE_HOME
READ_RECEIPT_READERS_OWN
READ_RECEIPT_READERS_OTHERS
READ_RECEIPT_READERS_OPEN
READ_RECEIPT_READERS_DATA
CHAT_PREVIEW
CHAT_LINKS
```

## Root page

RootにはSwitchを直接置かない。各categoryのsummaryと右向きchevronを持つrowを置く。

| Category | summary | 内容 |
| --- | --- | --- |
| 広告 | 広告と Premium の案内を非表示にします。 | トーク一覧・ホーム・オープンチャットの広告、送信取消時と設定の Premium の案内 |
| AI 機能 | Agent i と LINE AI の入口を非表示にします。 | 確認済みの Agent i・LINE AI の入口を場所別の小見出しで表示 |
| 表示項目 | タブやメニューの項目を非表示にします。 | 下部タブ、トーク一覧の上部、＋メニュー、ホーム |
| プライバシー | 既読をつけずにトークを読めます。 | 既読をつけずに読む、通知から開く、送信後も既読をつけない、自動で既読をつけない |
| 既読者 | グループで誰が読んだかを表示します。 | 既読者のアイコン、既読数、一覧の開き方、同期 |
| トーク | プレビューとリンクの開き方を設定します。 | プレビューの無効化・スクロール・Premium の案内、外部ブラウザ |
| 外観 | 配色とフォントを設定します。 | ダークモードの黒、フォント |
| 通知とログイン | 通知と Google ログインを設定します。 | 閉じている間の通知、MicroG-RE での Google ログイン |

順序は目的の近さで並べる。表示を減らすページ（広告、AI 機能、表示項目）を先に置き、次に既読に関わるページ、次にトークの動作と外観、最後に再署名で失われる機能の復旧を置く。

Category rowの高さは最低56dpとする。左側にtitleとsummaryを置く。右側にchevronを置く。

## 子ページ

各子ページは共通の構造を使う。

```text
56dp header
→ ScrollView
→ vertical content
→ 24dp bottom padding
```

Headerは左に48dpのBack領域を持つ。titleは現在のpage名を表示する。

contentはLINE風のsection headerとrowを使う。既存palette、dark mode、LINE green、ripple、16sp title、13sp summaryを再利用する。

小見出しを持つページでは、rowの並びを小見出し単位のGroupへまとめて描く。小見出しは13spのtextとして、上に余白を取って描く。

小見出しは、その中に表示できる項目が一つも残らなかった場合は描画しない。対応patchが適用できず項目がすべて消えたときに、見出しだけが残ることを防ぐ。ページ内に表示できる項目が一つもない場合は、代わりに利用できる機能がない旨を表示する。

Status reportを読めない場合は、子ページのcontentへ機能設定を変更できない旨のメッセージだけを描く。Switch rowは一件も描かない。

## 機能の所属

各ページ内のrow順は `FeatureCatalog` のentry定義順とする。項目名と説明文は `FeatureCatalog` を正とし、ここには並びの考え方だけを残す。

- 広告：広告は場所ではなく「消したい」という目的で引くため、Smart Channel がトーク一覧の上部にあってもこのページへ置く。LINE Premium の案内も同じ目的のため、小見出し「Premium の案内」で同じページに置く
- AI 機能：確認済み入口一件につき独立Switchを置く。候補だけのbackend codeや表示不能surfaceは置かない
- 表示項目：トーク一覧の上部のカレンダーと＋メニューのカレンダーは別featureのため、別の小見出しの別rowにする。同名のrowが並んでも所属する小見出しで区別できる
- プライバシー：`FeatureCatalog` のentryの後に、「送信後も既読をつけない」と「自動で既読をつけない」を描く。自動既読の停止はboolean featureではなく `ReadReceiptMode` を使う
- 既読者：自分のメッセージと相手のメッセージで同じ項目名（既読者のアイコンを表示）があり、小見出しで区別する
- トーク：「プレビューを使わない」が ON の間は、同じ小見出しのスクロールと Premium の案内を操作できない
- 外観：`FeatureCatalog` のentryの後に「フォントファイルを選択」の行を描く

## FeatureCatalog

各entryに所属pageと、ページ内の小見出しを持たせる。小見出しを持たないページのentryはsectionをnullにする。

```text
LinimalFeature
featureId
SettingsPage
SettingsSection
title
summary
```

`installedEntriesForPage` はpatch status reportのfeature IDに存在し、かつそのpageに属するentryだけをcatalogの定義順で返す。`installedGroupsForPage` はその結果を連続する同一sectionごとのGroupへまとめる。

```text
installedEntriesForPage
installedGroupsForPage
```

Groupは表示できるentryが1件以上あるときだけ作る。そのため、パッチが適用できずsection内のentryがすべて消えた場合は、小見出しがGroupごと現れない。同じsectionのentryはcatalog上で連続して並べる。

Root categoryはそのpageに表示可能なentryがなくても固定で表示する案を基本とする。対象patchが未適用でもページ自体は開き、利用できる機能がない旨を表示する。

機能rowは対応featureの必須PatchId集合が完全に存在し、全件 `OK` の場合だけ操作可能にする。runtime側の `PatchStatusRequirements` がFeatureIdごとの必須集合を保持する。1件でも欠落または余分なrecordがあればFeature Statusを `ERROR` とする。feature IDがreportにない場合はrowを表示しない。

## Navigation state

pure Javaの `SettingsNavigation` がpage pathを持つ。

主な操作は次のとおり。

```text
current
push
pop
canPop
serialize
restore
```

規則は次のとおり。

- 初期pageはROOT
- ROOT以外をpushできる
- 現在pageと同じpageは重複pushしない
- popは一段だけ戻す
- ROOTでpopを要求した場合はActivityを終了する
- 不正page IDはROOTへ戻す
- 空pathはROOTへ戻す
- ROOTで始まらないpathはROOTへ戻す
- pathが過剰に深い場合はROOTへ戻す

現在の階層は一段だけだがpath形式で保存する。今後の孫page追加でもstate形式を変えずに済む。

## Back動作

| 状態 | Header Back | system Back |
| --- | --- | --- |
| ROOT | Activity終了 | Activity終了 |
| 子ページ | 一段pop | 一段pop |

子ページからpopした後はRootを再renderする。

AndroidのBack dispatchは対象APIと現在のActivity基盤に合わせる。最低限 `onBackPressed` から同じnavigation処理へ集約する。

## State保存

`onSaveInstanceState` にpage pathを保存する。

```text
linimal.settings.page_path
```

`onCreate` では次の順序で復元する。

1. Config bootstrap
2. palette作成
3. Patch Status読取
4. page path復元
5. current page render

復元値はtrusted dataとして扱わずstrictに検証する。不正値ではROOTへfail-safe復元する。

Switch変更中の一時状態は保存しない。保存後のConfigを再読込してrenderする。

## Render設計

Activityのroot viewはpage変更ごとに再構築できるようにする。

```text
renderPage
→ createHeader
→ createContent
→ setContentView
→ renderRuntimeConfig
```

page変更前に古いrow referenceをclearする。

```text
featureRows.clear
readReceiptSummary = null
readReceiptToggle = null
readReceiptPatchStatus = null
```

古いViewとlistenerをfieldから保持しない。

Patch StatusはActivity作成時に一度読む。runtimeでpatch内容は変わらないためである。Config healthは各render時に読み直す。

## UI helper

Activity内のprivate helperへ次を分離した。

- header
- category row
- Switch row
- status row
- unavailable message
- layout parameter
- ripple
- Switch tint

NavigationとFeatureCatalogのdecision logicはpure Java型へ分離した。Android View層は描画とevent接続だけを担う。

右向きchevronはprogrammatic `ChevronDrawable` として追加した。既存 `BackArrowDrawable` と同じstroke、density、paletteを使う。

## Security境界

Settings Activityは引き続き非公開とする。

```text
android:exported="false"
android:excludeFromRecents="true"
intent-filterなし
```

追加しないものは次のとおり。

- exported component
- deep link
- custom permission
- network endpoint
- telemetry
- dynamic code loading
- file chooser
- WebView
- credential input

Configへの書込みは `LinimalConfig` を通す。ActivityからSharedPreferencesを直接操作しない。

Patch Status JSONのstrict parserとsize上限を維持する。StatusのreasonをHTMLとしてrenderしない。

## Accessibility

- Backとchevronにcontent descriptionを付ける
- row全体を押してSwitchを変更できる
- disabled rowは誤ってtoggleしない
- textを固定heightへ閉じ込めない
- summaryは複数行を許可する
- ScrollViewを全子pageで使う
- dark modeでcontrastを維持する
- 大きな文字でもtitleとSwitchが重ならないことを実機確認する

## Test

### SettingsNavigation

- 初期pageがROOT
- pushでcurrentが変わる
- 同一pageの重複pushを拒否
- 子pageからpopでROOT
- ROOTのpopが終了要求を返す
- serializeとrestoreが一致
- unknown pageでROOT
- ROOTを欠くpathでROOT
- 過剰な深さでROOT

### FeatureCatalog

- 全entryが一つのpageへ所属
- ShoppingとWalletが別entry
- Home topとSmart Channelが別entry
- Agent i入口が場所別entry
- installed featureだけを返す
- page filterが他pageを混ぜない
- entry順序を維持する
- 各pageのGroupがsectionと順序どおり
- 同一sectionのentryがcatalog上で連続
- 表示できるentryがないsectionはGroupを作らない

### Activity

pure Javaで分けられないView動作は実機で確認する。

- 全pageが開く
- 全pageがスクロールする
- Header Backとsystem Backが一致
- 回転後に同じpageへ戻る
- process recreation後に同じpageへ戻る
- lightとdark
- 大きな文字
- unavailable featureが操作不能
- Status読取失敗時も各pageが開き、変更できない旨を表示する

## 不採用

- categoryごとにActivityを増やす方式
- Fragment dependencyを追加する方式
- Compose dependencyを追加する方式
- rootへ全Switchを残す方式
- SharedPreferencesへpage stateを永続化する方式
- exported Activityへ変更する方式
- Patch Statusを読めないとActivity全体を閉じる方式
- 適用状況の一覧pageを利用者向けに残す方式

## 未検証事項

- Android targetで使う最終Back API
- 大きな文字での最小row height
- category summaryの最終文言
- empty categoryを表示する最終条件
- screen readerでのSwitch row読み上げ順
