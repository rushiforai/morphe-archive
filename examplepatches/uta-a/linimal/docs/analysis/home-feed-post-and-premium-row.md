# Home 投稿カードと Premium 設定行の解析

## 対象

- LINE 26.11.0
- versionCode 261100124
- package `jp.naver.line.android`
- arm64-v8a
- reference APKM SHA-256 `be1147ccd3a20c61ac1e9bed93ce918fcc1cb0c5966af3ca4d504ea9da6bf2e6`

## 目的

実機レビューで残った2件を独立設定として抑制する。

| Linimal設定 | featureId | 設定ページ | 既定値 |
| --- | --- | --- | --- |
| 投稿カード | `linimal.home-feed-post-cards` | 表示を消す / ホーム | OFF |
| Premium 設定行の抑制 | `linimal.premium-settings-row` | 一般 | OFF |

どちらも presentation 層だけを対象とする。既存の Home おすすめ、Home 話題、Premium 誘導の抑制とは別 feature とする。

## Home 投稿カード

### UIと症状

Home 下部に VOOM の投稿カードが並ぶ。カードはアカウント名と友だち追加の見出し行、本文、画像または動画で構成される。

このカードは resource-id を持たない。UI dump 上は content-desc が `...の動画. ... ダブルタップして詳細ページに移動` で、`友だち追加` と `メニューを開く` を伴う。Compose 実装である。

Home ページの既存トグル3件、上部広告とおすすめと話題をすべて ON にしてもカードは残る。したがって `HOME_TOP_AD`、`HOME_RECOMMENDATIONS`、`HOME_TRENDING` のいずれとも別枠である。

### 根拠

card を描く module controller は3件ある。source metadata で特定する。

```text
GcsHomeFeedPostModuleController
GcsHomeFeedUnitSingleModuleController
GcsHomeFeedUnitBigVisualModuleController
```

R8 後も coroutine continuation の DebugMetadata annotation に上記の class 名と source file 名が残る。難読化された class 名や method 名は fingerprint の主要条件にしない。

continuation の直接の enclosing type を module owner とし、その owner に限定して restartable composable を探す。continuation が0件または複数件のときは owner を確定できないため一切注入しない。

実機では Post module だけを抑制してもカードは残った。Home 下部に並ぶ動画カードは Unit Single と Unit BigVisual が描いている。設定を ON と OFF で切り替えて実機のフィードを比較し、3件すべてを対象にする必要があることを確認した。

error module は対象にしない。Matome module は Home 話題の feature が扱う。

### Suppression

composable が本体を実行するかどうかの判定結果だけを書き換え、LINE 自身の skip 経路へ倒す。

```text
invoke-virtual { composer, mask, force }, Composer->shouldExecute(I, Z)Z
move-result vN
if-eqz vN, :skip
```

3件の module controller はいずれもこの並びを持ち、`:skip` 側は `skipToGroupEnd` と `endRestartGroup` へ抜ける。これは再 composition で本体を省くときに LINE 自身が通る経路である。

注入は `if-eqz` の直前へ次の形で行う。

```text
if-eqz vN, :linimalKeep
invoke-static { }, HomeFeedPostCardHooks->shouldSuppress()Z
move-result vN
if-eqz vN, :linimalRestore
const/4 vN, 0x0
goto :linimalKeep
:linimalRestore
const/4 vN, 0x1
:linimalKeep
nop
```

元の判定が false のときは hook を読まない。true のときだけ hook を読み、抑制時は 0、非抑制時は `shouldExecute` が返すのと同じ 1 に戻す。`shouldExecute` の return type は `Z` なので元の値は 0 か 1 に限られ、1 へ戻しても情報は失われない。

新しい control flow を作らないため、composer の group 整合は変わらない。カードの見出し行と本文と media は同じ composable の中にあるため、カードごと表示されない。

`const/4` は 4bit register しか取れないため、判定結果の register が v16 以降であれば注入しない。既存の分岐が `if-eqz` を指す場合も、注入した gate を飛び越えるため注入しない。try block を持つ実装も対象外にする。

ON へ変更した瞬間に attach 済みの UI を強制的に remove しない。次の recomposition から card が出なくなる。

### 変更しないもの

- VOOM の feed request と response
- 投稿の取得、既読、いいね、フォロー状態
- 友だち追加の実処理
- Home の他 module の順序と object identity
- 下部タブの VOOM 設定

Tabs の VOOM 設定は下部タブ item の除去であり、この feature とは独立している。

## Premium 設定行

### UIと症状

LINE 設定の一覧に `プレミアム 未登録` の行が出る。地域により LYP プレミアムと LINE プレミアムの2 variant がある。

行は list item として構築されるため、非表示にすると行ごと消えて下の行が上へ詰まる。

### 根拠

item layout の resource literal で model を特定する。

```text
layout/line_user_settings_premium_item
0x7f0e0570
```

title resource は次の2件である。

```text
line_settings_category_lyppfornonsubscriber  0x7f151df5
line_settings_category_linepfornonsubscriber 0x7f151df4
```

参照経路は次のとおり。

```text
premium item model <init>          layout literal で一意
→ Main Settings catalog <clinit>   title resource 2件 + item constructor で一意
→ 各 variant の visibility predicate
```

catalog の `<clinit>` 内で `new-instance` から `invoke-direct/range` までを1 item の構築区間とみなす。区間内の title resource が1件であること、最終引数が local に確保された lambda であることを条件に、variant と predicate type を対応付ける。

variant が2件そろわない場合、title resource の集合が LYP と LINE の2件と一致しない場合、predicate type が重複する場合は一切注入しない。片方だけが消える状態を作らない。

### Suppression

行を list へ採用するかどうかを決める asynchronous な visibility predicate の戻り値だけを調整する。

predicate の `invokeSuspend` は次の shape を要求する。

```text
invoke-static { vN }, Boolean->valueOf(Z)Ljava/lang/Boolean;
move-result-object vN
return-object vN
```

条件は次のとおり。

- parameter が `Ljava/lang/Object;` 1件
- `return-object` が唯一
- try block と switch を持たない
- 使用 register が `v0` から `v15` の範囲

注入は唯一の `return-object` の直前へ置く。全分岐が合流した後の位置であり、分岐先アドレスがこの位置と一致しないことを検証する。第1弾の `AgentISettingsPatch` で発生した、`goto` が hook を飛び越える不具合と同じ形を避けるためである。

```text
Boolean->booleanValue()Z
→ PremiumSettingsRowHooks->adjustVisibility(Z)Z
→ Boolean->valueOf(Z)
```

元の product 判定は先に実行させる。ON では結果を false へ落とす。OFF、未初期化、設定読取失敗では元の判定値をそのまま返す fail-open とする。

### 変更しないもの

- 購読 API と決済通信
- Premium 設定行から遷移する画面そのもの
- 既存の Premium 誘導の抑制が対象とする送信取消時の案内

Premium 誘導の抑制は送信取消時のダイアログ案内を対象とし、この feature は LINE 設定の行を対象とする。両者は別 feature として独立に切り替える。

## Expected cardinality

| target | expected |
| --- | --- |
| Home Feed module controller ごとの continuation | 各 1 |
| Home Feed module controller ごとの restartable composable | 各 1 |
| Home Feed module controller | 3 |
| premium item model constructor | 1 |
| Main Settings catalog `<clinit>` | 1 |
| premium visibility predicate | 2 |

いずれかが期待数と異なる場合は同 surface へ一切注入せず、Patch Status へ記録する。

Patch Status は次の PatchId で記録する。

```text
linimal.patch.home-feed-post-cards
linimal.patch.premium-settings-row
```

featureId は `linimal.home-feed-post-cards` と `linimal.premium-settings-row` である。必須 PatchId が欠落または余分な場合、runtime は該当 feature を `ERROR` とし設定行を操作不能にする。

## 不採用

- 難読化された class 名や field 名を fingerprint の主要条件にする方式
- content-desc や表示文字列を runtime で判定して view を消す方式
- Home の container ごと非表示にする方式
- render 後の `removeView` だけで消す方式
- VOOM feed の request と response を遮断する方式
- Premium 行を1 variant だけ抑制する方式

## 実機確認

Home 投稿カードは ON で次を確認する。

- Home 初回表示でカードがない
- 見出し行と友だち追加の行も残らない
- 空白、divider、margin が残らない
- pull-to-refresh、Home 再選択、タブ往復、画面回転、background 復帰、process recreation で戻らない

Premium 設定行は ON で次を確認する。

- LINE 設定にプレミアム行がない
- 行の高さぶん下が詰まる
- 設定を開き直しても戻らない

OFF では両方とも公式の表示へ戻ることを確認する。

## 未検証事項

- 実機での ON 反映タイミングと既存 recomposition の挙動
- LYP プレミアムと LINE プレミアムの地域差分の実機確認
- Home Feed の A/B test 差分
