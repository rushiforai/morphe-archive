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
├─ Agent i・LINE AI
│   ├─ 各画面の上部
│   ├─ トーク
│   └─ 設定
├─ 表示を消す
│   ├─ 下部タブ
│   ├─ トーク一覧の上部
│   ├─ トークの ＋ メニュー
│   └─ ホーム
├─ 既読
└─ 一般
```

階層は Root と子ページの二段のままとする。小見出しは子ページの中の見出しであり、page IDを持たない。

内部のpage IDは次のとおり。

```text
ROOT
ADS
AGENT_I
HIDE
READ_RECEIPT
GENERAL
```

小見出しのIDは `SettingsSection` が持つ。

```text
AGENT_I_SCREEN_HEADERS
AGENT_I_CHAT
AGENT_I_SETTINGS
HIDE_BOTTOM_TABS
HIDE_CHAT_LIST_HEADER
HIDE_CHAT_PLUS_MENU
HIDE_HOME
```

## Root page

RootにはSwitchを直接置かない。各categoryのsummaryと右向きchevronを持つrowを置く。

| Category | summary | 内容 |
| --- | --- | --- |
| 広告 | 広告の表示を止めます。 | Smart Channel の広告、ホーム内の広告 |
| Agent i・LINE AI | Agent i と LINE AI の入口を場所ごとに設定します。 | 確認済みのAgent i・LINE AI入口を場所別の小見出しで表示 |
| 表示を消す | 画面ごとに表示する項目を選びます。 | 下部タブ、トーク一覧の上部、トークの ＋ メニュー、ホーム |
| 既読 | 既読の送信と、既読をつけずに読む機能を設定します。 | 既読をつけずに読む、通常チャットの自動既読停止 |
| 一般 | Premium の案内とリンクの開き方を設定します。 | Premium の案内、設定のプレミアム行、外部ブラウザ |

順序は目的の近さで並べる。広告とAgent i・LINE AIを先に置き、次に表示の取捨選択、次に挙動を変える既読、最後にその他をまとめた一般を置く。

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

各ページ内のrow順は `FeatureCatalog` のentry定義順とする。

### 広告

小見出しなし。

- Smart Channel の広告を表示しない
- ホーム内の広告を表示しない

Smart Channelの広告とホーム内の広告は別rowにする。広告は場所ではなく「広告を消す」という目的で引くため、Smart Channelがトーク一覧上部にあってもこのページへ置く。

### Agent i・LINE AI

各画面の上部

- ホーム上部の Agent i を表示しない
- ウォレット上部の Agent i を表示しない
- トーク一覧の検索欄の Agent i を表示しない

トーク

- チャット情報の Agent i を表示しない
- チャット入力欄の Agent i を表示しない
- メッセージ長押しメニューの LINE AI を表示しない
- 写真・動画表示画面の LINE AI を表示しない

設定

- 設定画面の Agent i を表示しない

候補だけのbackend codeや表示不能surfaceは置かない。確認済み入口一件につき独立Switchを置く。Commerce、Search、Home AI Matomeは候補のため表示しない。

### 表示を消す

下部タブ

- ショッピングを表示しない
- ニュースを表示しない
- ウォレットを表示しない
- アプリを表示しない

トーク一覧の上部

- AI Friends を表示しない
- カレンダーを表示しない
- オープンチャットを表示しない

トークの ＋ メニュー

- カレンダーを表示しない
- LINE ギフトを表示しない
- LINE Pay を表示しない

ホーム

- おすすめを表示しない
- 話題を表示しない
- ホームの投稿カードを表示しない
- 特集枠を表示しない
- 最近の履歴を表示しない

ShoppingとWalletは別rowにする。トーク一覧の上部のカレンダーとトークの ＋ メニューのカレンダーは別featureのため、別の小見出しの別rowにする。同名のrowが並んでも所属する小見出しで区別できる。

### 既読

小見出しなし。

- 既読をつけずに読むをメニューに追加
- 通常チャットの自動既読を停止

自動既読の停止はboolean featureではなく `ReadReceiptMode` を使う。UI上は他と同じSwitch rowとして、`FeatureCatalog` のentryの後に描く。

### 一般

小見出しなし。

- Premium の案内を表示しない
- 設定のプレミアムを表示しない
- リンクを外部ブラウザで開く

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
