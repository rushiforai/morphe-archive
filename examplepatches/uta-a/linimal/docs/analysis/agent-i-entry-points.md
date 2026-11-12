# Agent i 入口の解析

## 対象

- LINE 26.11.0
- versionCode 261100124
- package `jp.naver.line.android`
- arm64-v8a
- reference APKM SHA-256 `be1147ccd3a20c61ac1e9bed93ce918fcc1cb0c5966af3ca4d504ea9da6bf2e6`

## 目的

Agent i と LINE AI のUI入口を全DEXとresourceから調べる。実際に利用者が到達できる入口だけを場所別の設定にする。

backend client、repository、実験コード、非表示の開発機能、遷移先だけが存在するcodeは設定項目にしない。

## 確認済み入口

### チャット情報メニュー

状態は確認済み。

チャット情報画面のmenu model constructorがLINE AI itemのvisibilityを受け取る。

解析上のmodelは次のとおり。

```text
Ld00/l;
superclass Lj00/f;
```

constructor shapeは次のとおり。

```text
parameters Z, Lvb8/a;
return V
```

resource tupleは次のとおり。

| 種類 | resource | ID |
| --- | --- | --- |
| layout | `chathistory_menu_text_with_icon_item` | `0x7f0e0245` |
| icon | `chatmenu_ic_list_line_ai` | `0x7f0807d0` |
| label | `lineai_assistant_title_lineai` | `0x7f151f03` |

親constructor shapeは次のとおり。

```text
I, I, I, Z, Z
```

child constructorのboolean visibilityが親へ二回渡される。Linimalはこの値だけを調整する。

現在のruntime hookは次のとおり。

```text
LineAiHooks.adjustVisibility
```

場所別設定へ移行後は次の意味に具体化する。

```text
linimal.agent_i.chat_information
linimal.agent-i-chat-information
linimal.patch.agent-i-chat-information-entry
```

旧 `linimal.feature.line_ai` の値はschema v2 migrationでこの設定へコピーする。

## Inventory判定基準

入口を確認済みとするには次を満たす必要がある。

1. 利用者が操作できるUI要素である
2. label、icon、layout、menu model、Compose childのいずれかをresourceとcodeの両方で対応づけられる
3. click actionまたはnavigation destinationまで追跡できる
4. feature flagが有効な通常利用経路から生成される
5. backendのみの参照ではない
6. exact APKM上で抑制targetのcardinalityを決められる

状態は次の三つに分ける。

- 確認済み
- 候補
- internal only

候補とinternal onlyは設定画面へ出さない。

## 抑制方式

surfaceごとにpresentation層だけを変更する。

### Constructor visibility

元visibilityをruntime hookへ渡す。

- ONではfalse
- OFFでは元値
- hook例外では元値

### List item

adapterへ渡す直前に対象itemだけを除外する。

- 元listを変更しない
- OFFでは元instance
- 残すitemの順序とidentityを維持

### Compose

対象child invokeだけをskipする。composer group終了は必ず残す。

### ViewStub

専用stubのinflate前にgateする。必要な場合だけ専用slotをcollapseする。汎用containerは変更しない。

## 独立設定

各確認済みsurfaceは次を一セットとして持つ。

```text
LinimalFeature.AGENT_I_<SURFACE>
FeatureId.AGENT_I_<SURFACE>
PatchId.AGENT_I_<SURFACE>_<TARGET>
LinimalConfig semantic getter
surface専用runtime hook
Agent i pageのSwitch
```

一つのsurfaceが非OKでも他surfaceのSwitchは利用可能にする。FeatureIdとPatchIdを場所間で共有しない。

## 変更しないもの

- Agent i backend
- model API
- authentication
- conversation data
- promptとresponse
- deeplink dispatcher全体
- common network stack
- TLS
- telemetry
- remote experiment value

## 現在の fingerprint

チャット情報メニューは次を複合する。

- public constructor
- parameters `Z`, `Lvb8/a;`
- superclass `Lj00/f;`
- layout literal `0x7f0e0245`
- icon literal `0x7f0807d0`
- label literal `0x7f151f03`
- parent constructor parameters `I`, `I`, `I`, `Z`, `Z`
- method先頭のnull guard shape

難読化owner `Ld00/l;` は解析根拠にだけ使いfingerprintの主要条件にしない。

## Expected cardinality

チャット情報メニューは次のとおり。

- model constructor 1件
- visibility injection 1件

他surfaceはinventory完了後に個別記録する。

## 自動検証

各surfaceで次を検証する。

- OFFで元visibilityまたは元list identity
- ONで対象surfaceだけを抑制
- 他surface設定との独立性
- null input
- hook例外時のfail-open
- 0件でTARGET_NOT_FOUND
- 複数一致でERROR
- instruction shape不一致で変更しない
- featureごとのPatch Status分離

## 実機確認

- 対象場所から入口だけが消える
- 同じ画面の他menu itemが残る
- 他のAgent i入口は独立設定に従う
- OFFで入口が戻る
- 入口を消しても通常チャットが使える
- Agent i backendと会話dataを変更しない
- 回転、再bind、タブ往復、process recreation後も設定が反映される
- regionとremote experimentの差分を確認する

## Inventory結果

base APKに存在するDEXは13本だった。`classes.dex` から `classes13.dex` までをresource tableと照合した。config splitにDEXはない。

確認済みの到達可能なUI入口は7種類ある。

| Surface | 表示 | 状態 | 独立設定 |
| --- | --- | --- | --- |
| Home上部ナビゲーション | Agent i | 確認済み | 必要 |
| Chat information menu | Manage account | 確認済み | 必要 |
| Wallet mini-tab header | Agent i | 確認済み | 必要 |
| Main Settings list | Agent i または LINE AI services | 確認済み | 必要 |
| Chat composer | Agent i in chat または AI Talk Suggestions | 確認済み | 必要 |
| Message context menu | AI Edit | 確認済み | 必要 |
| Chat gallery viewer | LINE AI image edit | 確認済み | 必要 |

Chat listの独立rowは確認できなかった。Commerce、Search、Home AI Matomeは候補に留める。

## Home上部ナビゲーション

### UIとresource

Home headerの先頭に最大一つ表示されるCompose itemである。

| 種類 | resource | ID |
| --- | --- | --- |
| icon | `home26_navi_top_agent` | `0x7f080b83` |
| accessibility | `access_agenti` | `0x7f15006b` |

### 根拠

```text
classes9.dex
Lgg2/p;->b(Lgg2/r;ZZZZLgg2/j;Lgg2/i;Lgg2/i;Lgg2/i;Lgg2/i;Lh3/t;I)V
Lgg2/k;->i(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
```

Agent i、サービス、通知、設定の4iconを同じheaderで組み立てる。Agent iだけ独立booleanで描画される。

config key `function.ai.agenti.enabled` は `isSupportAgentI` としてparseされる。呼出元はこの値をAgent i用booleanへ渡す。

### Navigation

```text
line://lineai/thread?entry=hometab_v4_header
```

Home callbackはこのURIを生成してLINE内部navigatorへ渡す。

### Suppression

Agent i item rendererへ渡す専用booleanだけをfalse化する。Home header全体やサービス、通知、設定のcallbackを変更しない。

対象supplierでは最初のboolean parameterがabsolute register `v26` になる。通常の `invoke-static` は `v0` から `v15` までしか指定できないため、runtime hookはmethod先頭で `invoke-static/range { p1 .. p1 }` として呼び出す。constructorへ渡るcopy provenanceも検証し、Agent i用の最初のbooleanであることを確認してから注入する。

fingerprint anchorは次のとおり。

- `0x7f080b83`
- `0x7f15006b`
- `line://lineai/thread`
- `entry`
- `hometab_v4_header`
- Compose item rendererのboolean branch

expected targetは1件。exact APKMへの統合適用では次を確認した。

```text
linimal.patch.agent-i-home-header
OK
expected 1
actual 1
AgentIHomeHeaderVisibilitySupplied
```

## Chat information menu

既存 `LineAiEntryPatch` の対象である。詳細は前節の確認済み入口を参照する。

表示resource `lineai_assistant_title_lineai` の英語値は `Manage account` である。画面上の文言だけではLINE AI入口と判別しにくい。

menu modelは `ChatHistoryMenuFragment.onViewCreated` のlistへ追加される。click callbackの最終destinationは巨大なmenu構築methodに閉じており完全復元できなかった。タップ可能なUI modelであることは確認済みだがdestinationは断定しない。

expected targetは1件。

## Wallet mini-tab header

### UIとresource

| 種類 | resource | ID |
| --- | --- | --- |
| icon | `wallet_agent_i_navigate_icon` | `0x7f0821c0` |
| accessibility | `access_minitab_agenti` | `0x7f150343` |

### 根拠

```text
classes2.dex
Lcom/linecorp/line/wallet/impl/v3/view/WalletV3GrandDesignHeaderView;
o()V
Ltt6/d;->E4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
```

Wallet header rendererはcampaign、search、Agent iのstateを別々に受け取る。Agent i stateがnullならbuttonを描画しない。

### Navigation

click callbackは `entry = minitab_header` を持つIntentを生成して起動する。`line.wallet.click` telemetryも送信する。

### Suppression

Agent i button stateだけをnullにする。Wallet header、campaign、search、共通Intent factory、telemetry実装を変更しない。

fingerprint anchorは次のとおり。

- `0x7f0821c0`
- `0x7f150343`
- `minitab_header`
- Wallet headerのAgent i state slot
- campaign、search、Agent iの三つのstateを別引数で描画するshape

state setup methodとhost callは各1件。

## Main Settings list

### UI variant

runtime variantにより次のどちらかが表示される。

1. `Agent i`
2. `LINE AI services`

通常runtimeで同時表示する構造ではない。両static entryを同じ場所設定で抑制する。

| Variant | icon | title | title ID |
| --- | --- | --- | --- |
| Agent i | `line_user_settings_ic_agent_service` | `line_settings_title_agenti` | `0x7f151e38` |
| LINE AI services | `line_user_settings_ic_ai_service` | `line_settings_title_lineaiservices` | `0x7f151e3b` |

関連page titleは次のとおり。

| resource | ID |
| --- | --- |
| `line_agenti_title_agenti` | `0x7f151583` |
| `line_lineaiservices_title_lineaiservices` | `0x7f151bb2` |

### 根拠

```text
classes13.dex
Lj25/u2;-><clinit>()V
Lp15/e;->f(Landroid/content/Context;Llb8/c;)Ljava/io/Serializable;
Lj25/v;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
Lj25/t;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
Llx4/m0;->TARGET_LINE_AI_SERVICE
```

設定画面のsource metadataは次のとおり。

```text
AiSubscriptionSettingsScreen.kt
LineUserAiAssistantSettingsCategory.kt
```

### Navigation

Main Settings rowは `CATEGORY / TARGET_LINE_AI_SERVICE` のnavigation requestを渡す。destinationでは復元、privacy、service informationなどの設定を表示する。

### Suppression

Main Settings catalogの両variantのvisible predicateだけをfalse化する。billing、restore action、settings navigator、destinationを変更しない。

static catalog targetは2件。runtime表示は最大1件。

## Chat composer

### UIとresource

| 種類 | resource | ID |
| --- | --- | --- |
| composer button | `chat_ui_input_ai_talk_suggestion_button` | `0x7f0b0760` |
| AI input layout | `chat_ui_ai_talk_suggestion_input` | `0x7f0e0134` |
| Compose child | `chat_ui_ai_talk_suggestion_entry_screen` | `0x7f0b067a` |
| attach control | `chat_ui_attach_menu_ai_talk_chip_switch` | `0x7f0b06ce` |
| Agent i tab label | `chat_agentiinchat_button_agenti` | `0x7f150a77` |
| settings title | `chat_agentiinchat_title_agentiinchat` | `0x7f150a82` |
| AI Search label | `chat_ainext_button_asklineai` | `0x7f150a87` |
| tab icon | `chat_ui_ai_talk_suggestion_tab_ic_line_ai` | `0x7f08059e` |

### 根拠

```text
classes9.dex
Lgs1/i0;->a(Landroid/view/View;)Lgs1/i0;
Lcom/linecorp/line/chat/ui/impl/message/input/aitalksuggestion/a;
Laf1/d3;
MessageInputViewControllerImpl.kt
Luf1/g$a$a;
```

AI input controllerはViewStubへlayout `0x7f0e0134` を設定してinflateする。その中でTabLayout、ViewPager、Compose childを構成する。

settings activityはmanifest上で非公開である。

```text
com.linecorp.line.chat.aitalksuggestion.settings.chat.AiTalkSuggestionsChatSettingActivity
android:exported=false
```

### Suppression

実装対象はcomposer buttonの表示stateと、入力欄下のchip barの供給である。visibility observerがbuttonへ渡すbooleanをfalse化し、chip barのComposeViewをcontroller構築の直前でnullへ差し替える。

ViewStub、既に開いているAI input panel、attach chip、内部Compose childは変更しない。text input、gallery、camera、attach menu全体も変更しない。

exact APKMでcomposer binding、source metadata、binding-to-controller wiring、inflation controller、visibility observerはすべて1件だった。runtime tab数はconfigで変わるためfingerprint条件にしない。

runtime gateはvisibility observerのboolean field読出し直後へ入れる。

chip barは `chat_ui_ai_talk_suggestion_chip_bar` (0x7f0b0676) であり、全DEX中で `Lgs1/i0;->a(Landroid/view/View;)Lgs1/i0;` の1箇所にだけ現れる。bindの結果はfield `b` のComposeViewへ入り、その読出しは引数なしComposeView返却のaccessor 1件のみである。controller構築側では accessor 呼出し、`move-result-object`、`if-eqz`、chip bar presenter の `new-instance` と `<init>`、controller constructor 引数への `move` という6命令のshapeがメソッド内で1件のときだけ注入する。hookがnullを返すと、LINE自身がchip bar無効構成で通る `if-eqz` の分岐へ入り、presenterが生成されないためsetContentもsetVisibilityも実行されない。

Patch Statusは次のとおり。

```text
linimal.patch.agent-i-chat-composer
expected 2
actual 2
AgentIChatComposerVisibilityAndChipBarGuarded
```

## Message context menu

### UIとresource

| 種類 | resource | ID |
| --- | --- | --- |
| icon | `chat_ui_context_line_ai` | `0x7f08064a` |
| label | `line_chat_button_lineai` | `0x7f151848` |

英語表示は `AI Edit`。

### 根拠

```text
classes9.dex
Lne1/x0;.LINE_AI
Lne1/g;->d(Lj51/c;)Lne1/x0;
Lne1/h0;
Lrq1/a;.CONTEXT_MENU
```

`j51.c.LINE_AI` を通常のcontext-menu model `ne1.x0.LINE_AI` へ変換する。click時はselected mediaとentry source `CONTEXT_MENU` をimage edit flowへ渡す。

### Suppression

context menu item listへLINE_AI modelを加える位置で対象itemだけを除外する。global image edit starterやcontext menu全体を止めない。

static model、mapping、callback、entry source、actual supplierはすべてexpected 1、actual 1だった。context menu instanceあたり最大1件。

runtime gateはactual supplierがLINE_AI itemを返す直前のavailability branchへ入れる。

```text
linimal.patch.line-ai-message-context-menu
OK
expected 1
actual 1
LineAiLongPressContextSupplierGuarded
```

## Chat gallery viewer

### UIとresource

| 種類 | resource | ID |
| --- | --- | --- |
| button view | `chat_gallery_line_ai_button` | `0x7f0b0628` |
| raw icon | `viewer_ic_line_ai` | `0x7f1400ac` |
| tooltip | `chat_gallery_line_ai_edit_image_tooltip` | `0x7f0b0629` |

### 根拠

```text
classes2.dex
Lhu7/e1;->invoke(Ljava/lang/Boolean;)Lkotlin/Unit;
Lhu7/u0;
Lrq1/a;.IMAGE_VIEWER
```

binderはbuttonをfindした後にbooleanでVISIBLEまたはGONEを設定する。visible時だけiconとclick listenerを設定する。

### Suppression

binderへ渡すbooleanだけをfalse化する。gallery、media、shared image edit starterを変更しない。

tooltip action、click callback、entry source、binder、page-rebind registrationはすべてexpected 1、actual 1だった。viewer header内のbuttonは最大1件。

runtime gateは `Boolean.booleanValue` のresult直後へ入れる。

```text
linimal.patch.line-ai-gallery-viewer
OK
expected 1
actual 1
LineAiGalleryViewerBinderGuarded
```

## Surface間の独立性

各surfaceは別FeatureId、PatchId、Config keyを持つ。

推奨設定keyは次のとおり。

```text
linimal.agent_i.home_header
linimal.agent_i.chat_information
linimal.agent_i.wallet_header
linimal.agent_i.settings
linimal.agent_i.chat_composer
linimal.agent_i.message_context_menu
linimal.agent_i.gallery_viewer
```

image editの二入口はAgent i hubと機能が異なる。設定画面では場所が分かるtitleとsummaryにする。将来まとめる場合も保存keyとPatch Statusは分けたままにする。

## Candidate

### Commerce top navigation

確認したresourceとconfigは次のとおり。

| 種類 | resource | ID |
| --- | --- | --- |
| icon | `commercetab_header_agent_i` | `0x7f080849` |
| accessibility | `commerce_access_shopping_agent_i` | `0x7f150e81` |
| config | `function.commercetab.topnavi.agenti.url` | なし |

visual rendererは1件ある。URL consumerと同一click callbackまで結べなかった。QuickMenu coupon stateと近接しており独立入口と断定しない。実装対象外。

### Search

`function.search.line_ai_entry.enabled` とsearch metadataは確認した。resource、adapter binder、click callback、deeplinkを連結できなかった。実装対象外。

### Home AI Matome

manifestに非公開activityがある。

```text
com.linecorp.line.home26.matome.agentmodal.Home26AiMatomeAgentBottomSheetActivity
android:exported=false
```

Agent i product entryとしてのresourceとclick pathは確認できなかった。実装対象外。

## Internal only

次は遷移先または内部実装であり一次suppression targetにしない。

- LineAiActivity
- ImageEditBottomSheetActivity
- ImageViewerActivity
- AiSubscriptionActivity
- AiSubscriptionSettingsActivity
- AiTalkSuggestionsChatSettingActivity
- AiCharacterChatroomActivity
- Agent i remote config consumers
- billing、restore
- Room database
- network、terms、policy URL
- `SERVICE_TYPE_AGENT_I`
- `SERVICE_TYPE_LINE_AI`
- `TARGET_LINE_AI_SERVICE`

全activityはmanifest上で非公開である。入口を消すためにactivity本体や共通navigatorを止めない。

## Rebindと再入場

- Home headerはCompose stateとremote config更新で再描画される
- Wallet headerはtab inflateとresumeでstateを再生成する
- Main Settings listは再入場とvariant変更でlistを再構築する
- Chat composerはchatroom開閉、orientation、keyboard、resumeでcontrollerを更新する
- Context menuはlong pressごとにmodelを再構築する
- Gallery buttonはpage bindとobserver再発火でvisibilityを再設定する

一回限りのView hideでは不十分である。各presentation stateの供給位置へgateを入れる。

## Chat ＋ menu toggle（2026-11-11）

トークの ＋ メニュー（`chat_ui_attach_menu`）の格子の上に、ComposeView
`chat_ui_attach_menu_ai_talk_chip_switch`（`0x7f0b068d`）の「トークルームのAgent iを表示」
（`chat_agentiinchat_toggle_hideagentiinchat`）が出る。＋ メニューの項目 enum（`sn1/c$b`）には含まれず、
既存の ＋ メニュー patch と入力欄 patch のどちらの対象でもなかった。

表示可否は `sm1/f1.invoke` の 1 か所で決まる。Agent i in chat が使える構成（`cn1/a.a()`）で、
`mz1/a.a()` が true でないときに `v3 = 1` になり、`setVisibility(v3 ? VISIBLE : GONE)` と、
同じ `v3` で中身の `setContent` を組み立てるかを決める。

```smali
:goto_7c                                       # v3 が決まる合流点
iget-object v7, v0, Lsn1/f;->b:Landroid/view/View;
const v8, 0x7f0b068d
invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;
move-result-object v7
check-cast v7, Landroidx/compose/ui/platform/ComposeView;
invoke-static {v3}, ...AgentIChatPlusMenuHooks;->adjustToggleVisibility(Z)Z   # 注入
move-result v3                                                                  # 注入
if-nez v7, :cond_8a
...
invoke-virtual {v7, v6}, Landroid/view/View;->setVisibility(I)V
if-eqz v3, :cond_b0                            # 同じ v3 で setContent を省く
```

label 名は注入前のもの（注入後は baksmali が `:cond_8e` などへ振り直す）。
`:goto_7c` の命令の前に入れると、label が元の命令に残るため true 側の `goto :goto_7c` が注入を飛び越す。
そのため label のない check-cast の直後へ入れる。抑制時は LINE 自身の「使えない構成」と同じく GONE で中身を作らない。
Agent i in chat の設定値・通信は変更しない。feature は `linimal.agent-i-chat-plus-menu`、patch は
`linimal.patch.agent-i-chat-plus-menu`（expected 1）。

## 実機で確認する事項

- remote configにより各入口が実際に表示されるaccount
- region、年齢ごとの差分
- surfaceごとのruntime cardinality
- Home headerのrecomposition
- Walletのtab往復とresume
- Main SettingsのAgent i variantとLINE AI services variant
- Chat composerのViewStub再inflate
- Context menuのmessage type差分
- Galleryのimageとvideo差分
- OFFで各入口が個別に戻ること
- 他surfaceとbackendが維持されること

## 未検証事項

- Commerce visual assetとclick URLの接続
- Search entryの実UIとnavigation
- Chat information callbackの最終destination
- remote configの受信値
- A/B experiment切替時の挙動
