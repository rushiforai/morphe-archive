# AMOLED テーマの解析

## 対象

- LINE 26.16.0
- versionCode 261600106
- package `jp.naver.line.android`
- arm64-v8a

## 結論

LINE のダークモードは、既定の着せかえでは Android の夜間リソース（`values-night`）で描かれる。画面全体の地は意味づけされた色（`primaryBackground` など）で、夜間はパレット色 `linegray900`（`#111111`）を参照する。Linimal は LINE の DEX もリソースも書き換えず、**起動時に「夜間設定の値だけを持つ resources.arsc」を実行時に組み立て、`ResourcesLoader` で重ねる**。

- 昼間の設定には entry を持たないため、端末がライトモードのときは何も変わらない
- AssetManager2 は設定の一致度が同じとき loader の値を優先する。対象の色は既定と `night` の 2 設定だけで、ロケールや密度つきの夜間定義（`ja-night` など）は持たない
- 設定 OFF・未初期化・適用不可・例外のときは loader を追加しない（公式の配色）
- 変更は再起動後に反映する

## 黒にする対象

| resource | 夜間の元の値 | 用途 |
| --- | --- | --- |
| `color/primaryBackground` | `@color/linegray900`（`#111111`） | 画面の地 |
| `color/primarySurface` | 同上 | 画面の地 |
| `color/secondaryAltBackground` | 同上 | 画面の地 |
| `color/tertiaryAltBackground` | 同上 | 画面の地 |
| `color/splashBackground` | 同上 | 起動画面 |
| `color/statusbarBackground` | 同上 | ステータスバーの地（`chathistory_status_bar_bg` も参照） |
| `color/chatBackground` | `@color/linegray870`（`#1a1a1a`） | トークルームの地（壁紙がないとき） |
| `color/linegray900` | 夜間定義なし（`#111111`） | パレット色。下部のナビゲーションバーの地に直接使われる |
| `drawable/navi_bottom_bg_dark` | xxhdpi の WebP（1080×225） | 下部タブの背景画像 |

カード、ポップアップ、区切り線、吹き出しなど、一段明るい面（`#1f1f1f`、`#2a2a2a` など）は背景と見分けられるよう元のままにした。

`linegray900` は昼間には文字色として使われるが、上書きは夜間設定だけである。夜間設定で `linegray900` を参照する意味づけの色は、背景か背景と同じ色の面（`primaryAltNeutralFill` など）だけだった。コードが直接 `R.color.linegray900` を使う箇所は 38 ファイルあるが、`#111111` と `#000000` の差は文字色としてもほぼ見分けられない。

### 下部ナビゲーションバー

`MainActivity` の `main_navigation_bar_background`（ジェスチャーバーの下地）は、26.16.0 では `mg8.u.a()` が次のように塗る。

- 既定の着せかえかつダークモード: `getColor(R.color.linegray900)`
- それ以外: 着せかえの色、なければ `primaryBackground`

そのため `linegray900` を対象に含めた。SDK 35 以降は `Window.setNavigationBarColor` が効かず、この View が実際の色を決める。

### 下部タブの背景

下部タブの背景は `bnb_background_image`（`ImageView`、高さ `wrap_content`）で、`ng8.p.b()` が着せかえとダークモードに応じて `navi_bottom_bg_dark` か `navi_bottom_bg` を背景に設定する。

- 単色（`ColorDrawable`）に差し替えると固有の高さがなく、View の高さが 0 になって後ろの View が見えた（実機で白い帯として確認）
- そこで、元の画像を同じ density・同じ寸法のまま読み、不透明な画素だけを黒にした PNG を実行時に作り、loader の `AssetsProvider` から返す。table 側では夜間かつ元の画像と同じ density の設定に置く
- 上部の半透明の影は元のまま残し、内容との境目を保つ
- `navi_bottom_bg`（昼間用で、着せかえが色を付ける）は対象外。着せかえを使っている場合に下部タブを黒くしないため

## 実装

- runtime: `features/theme/AmoledThemeHooks`（loader の生成と各 Activity への追加）、`AmoledThemeColors`（対象一覧と表の組み立て、画像の塗り替え）、`NightResourceTable`（Android に依存しない arsc encoder）
- Application の Resources と、`onActivityPreCreated` で各 Activity の Resources に同じ loader を足す。`Resources.addLoaders` は既存の Theme を新しい実装へ rebase する。`createConfigurationContext` で作られる Context は元の Resources の loader を引き継ぐ
- arsc と PNG は process ごとの一時ファイルに書き、開いた直後に削除する。provider は descriptor を複製して読むので、ファイル名を process 間で共有しない
- resource ID は build 時に固定せず、実行時に `getIdentifier` で名前から解決する。type 名の表は `getResourceTypeName` で埋める
- patch: `AmoledThemeResourcePatch` は APK を変更しない確認用の resource patch。対象の色のダークモードでの値が上表のとおりであること、`navi_bottom_bg_dark` の画像が `drawable*` にあることを確かめ、patch status `linimal.patch.amoled-theme-colors` を記録する。名前が欠けたら PARTIAL / TARGET_NOT_FOUND、値が違えば ERROR になり、runtime はこの機能を無効にする
- runtime と patch の対象一覧は `AmoledThemeResourcePatchTest` が Java ソースを読んで一致を検証する

## 着せかえ

LINE は着せかえを使っている場合、端末のダークモードで「ブラック」系の着せかえに自動で切り替える設定（`THEME_AUTO_DARK_MODE`、`UseBlackThemesInDarkMode`）を持つ。着せかえが色を決める部分（`gh6.m` 経由で View に適用される色や画像）は resource を経由しないため、この機能では変わらない。
