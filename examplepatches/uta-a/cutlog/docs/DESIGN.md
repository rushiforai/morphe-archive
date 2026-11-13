# cutlog 設計書（setlog 用 Morphe パッチ）

Nov 3, 2026 · @uta_a

## 概要

cutlog は、setlog（Android 版）を Morphe でパッチし、「撮った動画を投稿前に編集する」「任意の動画をその時間のログとして投稿する」を追加する。方針は、撮影完了で得られる動画ファイルを Java/Kotlin 層で横取りし、自作の編集画面を通してから元の投稿処理に返すこと。

- 対象: setlog（New Chat Inc.）、パッケージ名 `com.newchat.setlog`（Phase 0 で確定）
- 公式仕様: 投稿はアプリ内カメラでその場で撮った2秒前後の動画のみ。カメラロールからの投稿・フィルター・テキストは無い
- 配布形態: linimal と同じく Morphe パッチバンドル（patches + extension）
- スコープ外: iOS 版、サーバー API の直接操作、他ユーザーの投稿の改変

## 要件

機能要件は F1〜F6。F1（編集画面を挟む）が他の土台になる。

| ID | 要件 | 優先度 |
| --- | --- | --- |
| F1 | 撮影完了後、投稿前に編集画面を表示し、「そのまま投稿」「編集して投稿」「キャンセル」を選べる | 必須 |
| F2 | フィルター（モノクロ、セピア、彩度・明るさ・コントラスト、LUT）をかけられる | 必須 |
| F3 | テキストを位置・色・サイズ指定で焼き込める（複数可） | 必須 |
| F4 | 撮影の代わりに端末内の任意の動画を選び、トリムして「今の時間」のログとして投稿できる | 必須 |
| F5 | 過去の時間帯に投稿できる | 実装しない（Phase 5 で決定） |
| F6 | 機能ごとの ON/OFF を設定画面から切り替えられる | 任意 |

非機能要件:

- 出力動画は公式撮影分と同じ解像度・コーデック・音声有無に揃える（サーバー側の検証と再生結合を壊さないため）。長さは撮影秒数の選択と速度変更で 1〜15 秒の範囲で変わる（実機で投稿・再生を確かめる）
- 編集・書き出しは端末内で完結し、外部通信をしない
- 書き出しは公式の固定長（約 2.07 秒）のクリップで数秒以内
- パッチが当たらない版では何もしない（公式の撮影フローを壊さない）
- アプリ更新への追従が楽なよう、編集フック点は fingerprint で探し、難読化クラス名直書きを避ける。起動確認用のインストール元パッチは、非難読化の PairIP クラス・メソッド名と命令列を併用して対象を限定する

## アーキテクチャ

公式の撮影画面と投稿処理はそのまま使い、その間の「録画完了」の1点だけをフックする。編集も任意動画も、この1点に別のファイルを渡すだけで成立する。

フック点は Phase 0 で特定した `vb0.G0(oc0)`（録画完了の単一 choke point）。詳細は [analysis/phase0-recording-upload.md](analysis/phase0-recording-upload.md)。

## モジュール設計

パッチ側は「フックを差し込むだけ」に留め、ロジックはすべて extension に置く。linimal と同じ構成。extension の言語は、Kotlin stdlib が本体と衝突するのを避けるため Java を基本とする（linimal の方針を踏襲。Phase 1 で本体の Kotlin 同梱状況を確認して確定）。

```
cutlog/
├─ patches/src/main/kotlin/.../cutlog/patches/
│   ├─ CutlogPatch.kt                  # PairIP のローカルインストール元判定（Phase 1）
│   ├─ capture/CaptureEditorPatch.kt   # 録画結果の横取り・本体への返却・シェーダー resource の追加（F1〜F3）
│   ├─ auth/GoogleSignInPatch.kt       # Google ID token の取得だけを MicroG-RE へ向ける
│   ├─ capture/RecordDurationPatch.kt  # 撮影する長さの選択（録画設定と予備タイマーの置き換え）
│   └─ picker/ImportVideoPatch.kt      # 「ファイルから」ボタン・動画選択結果の受け取り・取り込み動画の返却（F4）
├─ patches/src/main/resources/cutlog/media3-shaders/  # media3-effect のシェーダー
└─ extensions/cutlog/src/main/java/dev/utaa/cutlog/
    ├─ extension/hook/CaptureInterceptor.java  # パッチから呼ばれる入口、Activity の保持
    ├─ extension/auth/GoogleAuth.java         # Google 要求の限定・MicroG-RE の署名検証
    ├─ extension/hook/CaptureHost.java         # パッチが録画画面に実装させる interface
    ├─ extension/hook/EditSession.java         # 編集画面が扱う 1 件分の入力と返し先
    ├─ extension/hook/CaptureSession.java      # 撮影した動画 1 件（完了・キャンセルを一度だけ返す）
    ├─ extension/hook/ImportSession.java       # 端末内から選んだ動画 1 件（F4）
    ├─ extension/editor/CameraChrome.java      # 撮影画面のシャッターの並びにボタンを置く
    ├─ extension/editor/ImportButton.java      # 撮影画面の「ファイルから」ボタン
    ├─ extension/editor/DurationButton.java    # 撮影画面の長さボタン
    ├─ extension/record/RecordDuration.java    # 選んだ撮影の長さを本体の録画設定へ渡す
    ├─ extension/editor/EditorDialog.java      # プレビュー＋編集 UI（全画面 Dialog）
    ├─ extension/editor/EditSpec.java          # フィルター・調整・テキストの設定値
    ├─ extension/editor/TextPainter.java       # テキスト描画（プレビューと書き出しで共通）
    ├─ extension/render/EffectsFactory.java    # EditSpec → Media3 Effect
    ├─ extension/render/Renderer.java          # Media3 Transformer で書き出し
    ├─ extension/render/OutputProfile.java     # 公式撮影分に合わせる出力仕様
    ├─ extension/editor/SettingsButton.java    # 撮影画面の歯車ボタン（F6）
    ├─ extension/editor/SettingsDialog.java    # 機能ごとの ON/OFF（F6）
    ├─ extension/pref/Feature.java             # ON/OFF できる機能と、パッチが当たっているか
    ├─ extension/pref/Prefs.java               # 最後に使ったフィルター・撮影の長さ・機能の ON/OFF
    └─ shaded/androidx/media3/effect/R.java    # 付け替えた media3 が読む R.raw（実行時に ID を引く）
```

主なインターフェース:

- `CaptureInterceptor.onCaptured(host, result, uri)`：パッチが `vb0.G0(oc0)` の入口（二重呼び出し防止の判定の後）で呼ぶ。true を返したら本体はそこで止まり、編集画面の操作後に `CaptureHost.cutlogDeliver(result, replacement)` で `G0` を呼び直す。キャンセルは `CaptureHost.cutlogCancel()` が本体の `F0` を呼ぶ
- パッチは `oc0` に `cutlogWithReplacement(oc0, CaptureReplacement)` を足し、録画ファイルの Uri・撮影時刻・UTC オフセット・国コード・レンズ向きは保ったまま、長さ・解像度・音声有無だけを書き出し結果の値に差し替える
- 編集画面を重ねる Activity は `MainActivity.onResume` のフックで受け取る（setlog は単一 Activity）
- `Renderer.start(...)`：Media3 Transformer は Looper スレッドの非同期 API なので、完了コールバックで編集済みファイルを渡す。書き出し先は録画と同じディレクトリで、完了後に rename で録画ファイルを置き換える
- 編集画面は全画面 Dialog。マニフェスト登録が不要で、カメラ画面の状態を保ったまま本体へ戻せる。プロセスが終了すると預かった録画結果は失われる（本体の撮影からやり直しになる）
- media3 1.11.1 は本体のものを流用できないため、依存ごと `dev.utaa.cutlog.shaded.*` へ付け替えて同梱する（DEVELOPMENT.md 参照）

### Google ログインの提供元

再署名によって通常の Google ログインが使えない場合に備え、`MicroG-RE Google ログイン` パッチを追加した。Google ID token だけの要求について同梱の CredentialProviderPlayServicesImpl を選び、新しい Identity Credentials API ではなく既存の nonce 対応 `getSignInIntent` controller を使う。

Sign-In service の action を fingerprint で特定し、client の生成時に MicroG-RE の公式署名を検証して boolean field に接続先を固定する。MicroG-RE へ向ける client だけ action の接頭辞を変え、dynamic lookup を無効にする。この APK の R8 は GMS package getter を connection config の constructor に畳み込んでいるため、その config で MicroG-RE Sign-In action のときだけ package を変更する。action は constructor の引数 register ではなく、保存済みの field から読む。R8 が引数 register を上書きするため。

manifest には package visibility と元 APK 署名の SHA-1 を申告する metadata を追加する。runtime は難読化名ではなく Google の credential type で要求を限定し、信頼できる MicroG-RE が無ければ元の経路を維持する。パスワード・パスキーや FCM・Maps 等の service は対象外。nonce、ID token の解析、setlog の `auth/loginWithGoogle`、onboarding、暗号鍵の生成と保存、キャンセル・タイムアウトは変更しない。

## 編集エンジン

書き出しは AndroidX Media3 Transformer、プレビューは ExoPlayer に同じ色の Effect を渡して作る。テキストはプレビューでは View で重ね、書き出しでは同じ描画コード（`TextPainter`）で作った全面の Bitmap を `BitmapOverlay` で焼き込む。編集内容は `EditSpec` だけで表し、プレビューと書き出しで共通にする。

| 機能 | 実装 |
| --- | --- |
| モノクロ / セピア | `RgbFilter.createGrayscaleFilter()`、`RgbMatrix` で色行列 |
| 明るさ・コントラスト・彩度 | `Brightness`、`Contrast`、`HslAdjustment` |
| LUT プリセット | `SingleColorLut.createFromCube()`。ウォーム／クール／フェードの 17^3 キューブをコードで生成（assets は持ち込めないため） |
| テキスト | `OverlayEffect` ＋ `BitmapOverlay`（`TextPainter` で描いた動画と同サイズの Bitmap） |
| スタンプ・画像 | `BitmapOverlay`（将来拡張） |
| トリム | `MediaItem.ClippingConfiguration` |
| リサイズ・クロップ | `Presentation.createForWidthAndHeight()`、縦横比は公式撮影分に合わせる |
| 音声 | 公式は音声あり（AAC-LC 48kHz モノラル）のため無音化せず、形式を揃える |

注: 本体の media3 は R8 で難読化されていて上記 API を名前で呼べないため、media3 1.11.1 を付け替えて extension に同梱した。

編集 UI:

- 見た目は setlog の送信先選択画面に合わせる（黒背景、`#1C1C1E` の面、アクセントはピンク `#FE75F5`）
- 上に角丸のループ再生プレビュー。左上の ✕ がキャンセル、右上のピンクの ↑ が「編集して投稿」
- 下にタブ（フィルター / 調整 / テキスト）と「そのまま投稿」の行。トリムは Phase 3
- テキストはプレビュー上でドラッグして位置決め。位置は動画に対する 0〜1 の比率（左上が原点）、サイズは短辺に対する比率で `EditSpec` に持つ
- ↑ で書き出し → 完了したら `CaptureHost.cutlogDeliver` で本体へ返す。失敗時は元ファイルで続行するか選ばせる
- 最後に使ったフィルターを Prefs に保存し、次回の初期値にする

出力仕様（`OutputProfile`）は Phase 0 で `ffprobe` した公式撮影分の値を既定値にし、入力に関わらずそこへ揃える。

## 任意動画の投稿と時刻の扱い

任意動画（F4）は「録画の代わりにファイルを渡す」だけで実現し、投稿処理は公式のまま使う。過去の時間帯（F5）は Phase 0 で「投稿時刻はクライアント送信値」と判明したため技術的には書き換え可能だが、サーバーへ送る値を偽ることになるため、Phase 5 で実装しないと決めた。取り込んだ動画も撮影時刻は「今」として送る。

任意動画の流れ（Phase 3 で実装）:

1. 撮影画面のシャッターの右（フラッシュと左右対称）に「ファイルから」ボタンを足す。撮影画面の `onViewCreated`（`vb0.g0`）でシャッターを探して追加し、レイアウトのたびにフラッシュの位置から合わせる
2. Photo Picker（`MediaStore.ACTION_PICK_IMAGES`、`video/*`）で動画を選ぶ。ストレージ権限は不要。結果は MainActivity に足した `onActivityResult` で受け取る
3. 編集画面で開始位置を選び、公式と同じ秒数にトリム＋フィルター＋テキスト
4. `OutputProfile` に揃えて書き出し、本体の撮影開始処理 `vb0.j1()` で CaptureContext を作ってから `CollectionCameraResult` を組み立て、`vb0.G0` に渡す
5. 以降は公式の投稿フロー（グループ選択・アップロード）をそのまま通す

時刻の扱い（Phase 0 で判明。詳細は analysis 参照）:

- 投稿時刻はクライアントが body の `timestamp` として送る（録画開始時の `System.currentTimeMillis()`）。サーバー受信時刻依存ではない
- したがって F5 は timestamp 書き換えで技術的には可能だが、サーバー検証で弾かれるか未検証
- `captureUTCOffsetSeconds`・`captureCountryCode` も同時にクライアントから送られる

## 編集画面の作り込み（Phase 4）

Phase 2〜3 の編集画面（タブ 3〜4 枚）を、ツールバーとタイムラインを持つ専用の編集画面に作り替える。

### 画面構成

```
┌──────────────────┐
│ ✕              ↑ │  ✕ キャンセル / ↑ 書き出して投稿（今と同じ）
│    プレビュー    │  文字・スタンプはドラッグで移動、2 本指で拡大・回転
└──────────────────┘
 ▶ 0.8 / 2.0秒         再生・一時停止と再生位置
 │▓▓▓▓▓▓▓▓▓▓▓▓│ 動画    タイムライン。ドラッグで再生位置を動かす
 │  [こんにちは]  │ 文字    文字・スタンプは表示区間をバーで持ち、両端で伸び縮みさせる
 │    [😀]       │ スタンプ
 フィルター 効果 文字 スタンプ フレーム 速度 反転 ズーム（トリム）
```

- 最下段のツールを選ぶと、その操作パネルがタイムラインの下に出る。文字・スタンプを選んでいる間は、その要素用のパネル（スタイル・アニメーション・削除）に切り替わる
- 「そのまま投稿」は撮影した動画のときだけ出す（今と同じ）
- 器は今と同じく撮影画面の Activity に重ねる全画面 Dialog のままにする。Activity を増やすとカメラの解放・復帰と manifest の変更が要るため。`EditorDialog` は画面の骨組みだけにし、タイムライン・ツールごとのパネル・プレビューを別クラスへ分ける

### 機能

| 区分 | 機能 |
| --- | --- |
| 撮影画面の修正 | 秒数ボタンが画面の端からはみ出す表示崩れを直す |
| 文字 | 同梱の日本語フォント（Google Fonts の OFL 書体から 3〜4 書体）と端末のフォント。回転。大きさ・角度はスライダーと 2 本指の操作の両方で変える |
| 文字のスタイル | 縁取り、影、背景帯、ネオン風の光、RGB（色相が時間とともに回る） |
| 文字・スタンプのアニメーション | 表示区間の指定。入り・出のアニメーション（フェード、スライド、拡大、タイプライター） |
| スタンプ | 絵文字、端末の画像（Photo Picker で選ぶ）。文字と同じく移動・拡大・回転・表示区間・アニメーション |
| 効果（動画全体） | RGB（色相が回る）、VHS、グリッチ、ぼかし、ビネット、粒子ノイズ、画面の揺れ。それぞれ強さを変えられる |
| フレーム | 集中線ほか数種（枠、フィルム、ビデオカメラの録画表示など） |
| 速度 | 0.5x〜2x。動画の長さも変わる |
| 反転・ズーム | 左右・上下の反転。拡大と表示位置 |
| 逆再生 | 動画を逆向きに再生する |

### 実装方針

- 編集内容: `EditSpec` を広げる。動画全体（フィルター・調整・効果・フレーム・反転・ズーム・速度・逆再生）と、文字・スタンプのレイヤーの一覧（位置・大きさ・角度・表示区間・入り／出のアニメーション・スタイル）。時刻はすべて書き出し後の動画の時間で持つ
- 時間で変わる描画: レイヤーとフレームの「ある時刻での見た目」を 1 つの関数で求め、プレビュー（再生位置に合わせて毎フレーム View に描く）と書き出し（`OverlayEffect` に時刻ごとに描く overlay を渡す）の両方で使う。プレビューと書き出しの見た目のずれを防ぐ
- 効果: VHS・グリッチ・ぼかし・ビネット・粒子ノイズ・RGB は自作のシェーダー（`GlEffect`）、揺れ・反転・ズームは時刻で変わる変換行列。プレビューは今と同じく ExoPlayer の video effect（変更のたびに少し待ってプレイヤーを作り直す）
- 速度: 書き出しは Media3 の速度変更（映像・音声）、プレビューは `setPlaybackParameters`。使える API は media3 1.11.1 で確かめる
- 逆再生: Media3 に機能が無い。逆再生を選んだときに逆向きの中間ファイルを作り、以降のプレビューと書き出しはそれを入力にする。音声も逆向きにする。全フレームはメモリに載せない。後ろから復号すると直前のキーフレームから復号し直すことになり、キーフレームの少ない動画では長さの 2 乗で遅くなる。そこで先に Transformer で区間を切り出し、向き・大きさを揃えて全フレームをキーフレームにした下ごしらえを作り、そこから 16 枚ずつ YUV のまま復号して逆順にエンコードする。音声は PCM に戻して逆順にし、AAC にし直す（`Reverser`）。XIG07 で、キーフレームが先頭だけの 15 秒の動画が約 10 秒で終わる
- フォント: シェーダーと同じく、パッチが APK の res に追加し、extension が実行時に ID を引く。ライセンス文も同梱する
- 長さ: 速度を変えた動画は 1〜15 秒の範囲で長さが変わってよい。速さを変えて長さの変わった動画の投稿と、別の端末での再生はユーザー確認済み

### 進め方

1 項目ずつ実装・実機確認・コミットする。1〜11 は済み。

1. 撮影画面の秒数ボタンのはみ出しを直す
2. 画面の骨組み（ツールバー・タイムライン・レイヤー）を作り、今の機能（トリム・フィルター・調整・文字）を移す。この時点で今と同じことができる
3. 文字: フォント、回転、2 本指の操作、スタイル
4. 表示区間とアニメーション（プレビューと書き出し）
5. スタンプ（絵文字・端末の画像）
6. 効果（RGB・VHS・グリッチ・ぼかし・ビネット・粒子ノイズ・揺れ）
7. フレーム（集中線ほか）
8. 反転・ズーム
9. 速度
10. 逆再生
11. 長さを変えた動画の投稿・別端末での再生を確かめる

## リスクと対策

最大のリスクはアカウントの BAN と、サーバー側の動画検証。どちらもサブアカウントで先に試して潰す。

| リスク | 影響 | 対策 |
| --- | --- | --- |
| 利用規約違反としてアカウント停止 | 大 | 検証はサブアカウントで行う。README の冒頭で明示した |
| サーバーが長さ・解像度・メタデータを検証して弾く | 大 | `OutputProfile` で公式と同じ仕様に揃える。メディアは暗号化されるため差し替えは G0 より前で行う |
| PairIP licensecheck で起動不可 | 大 | APK 署名検証・Play Integrity は見当たらないが、起動時 Play ライセンスチェックあり。ローカルインストール元判定を通すパッチは実装・適用済み。Android 13 実機で40秒後も生存し、安全設定画面への到達を確認。Play 通信は残る。詳細は [compatibility/pairip-integrity.md](compatibility/pairip-integrity.md) |
| アプリ更新でフック点が変わる | 中 | fingerprint は文字列・命令パターン基準。対応バージョンを `compatibleWith` で固定 |
| 編集 Activity 遷移でカメラ解放・resume 無効化 | 中 | Phase 1 で遷移後の resume 成否を検証。だめなら Dialog 方式 |
| Media3 の依存衝突・ APK サイズ増 | 小 | 本体同梱分を再利用、足りなければ shadow でリネーム |
| 端末によって GPU エフェクトやエンコーダが失敗 | 小 | 失敗時は元ファイルで続行を選べるようにする |

## マイルストーンと未決事項

Phase 1 の「無編集で差し替えた動画が普通に投稿できる」が通れば、残りは編集機能を積むだけになる。

1. Phase 0 調査（完了）: フレームワーク判定、録画完了点と投稿 API の特定、PairIP 確認、公式動画の `ffprobe`。残りは UI フロー実機確認（Phase 1 へ持ち越し）
2. Phase 1 差し替え PoC:
   - (a) インストール元チェックの限定パッチを適用した再署名 APK が起動・ログインできるか（PairIP 関門、Go/No-Go その1。Android 13 実機でログイン画面 → 安全設定画面への到達、40秒後も生存を確認。暗号鍵の移行・作成、過去動画へのアクセスは未確認）
   - (b) `vb0.G0` 直前で固定の動画ファイルに差し替え、サブアカウントで投稿が通るか（Go/No-Go その2: Go。差し替えた動画の dev グループへの投稿・別端末での再生はユーザー確認済み。途中の「ロックされた投稿です」は受信側の鍵再生成で解消したとの報告あり。送信側の一時診断では相手用鍵の付与・鍵 ID の一致・投稿用暗号鍵の一致を確認済み）
3. Phase 2 編集画面: EditorDialog ＋ Renderer、フィルターとテキスト（F1〜F3）。実装済み。実機で編集・書き出し・本体への受け渡しと、dev グループへの投稿・別端末での再生を確認
4. Phase 3 任意動画: 「ファイルから」ボタンとトリム（F4）。実装済み。実機で取り込み・トリム・仕様への変換・本体への受け渡しと、dev グループへの投稿・別端末での再生を確認
5. Phase 4 編集画面の作り込み: ツールバーとタイムラインを持つ専用の編集画面に作り替え、文字・スタンプ・効果・フレーム・速度・反転・ズーム・逆再生を足す。実装済み。実機でプレビューと書き出し、速さを変えた動画の投稿・別端末での再生を確認。2 本指の操作、端末の画像のスタンプ、取り込み（トリム）の流れ、タイプライター・拡大のアニメーションは実機で未確認。詳細は「編集画面の作り込み（Phase 4）」
6. Phase 5 仕上げ: 設定画面（F6）は撮影画面の歯車ボタンから開くダイアログとして実装し、実機で ON/OFF の反映を確認した。F5 は実装しない。バンドルは GitHub（`uta-a/cutlog`）で公開し、Morphe Manager から追加できるようにする。詳細は [DEVELOPMENT.md](DEVELOPMENT.md)

未決事項:

- [x] パッケージ名は `com.newchat.setlog` → 確定（v1.3 / versionCode 76）
- [x] フレームワークはネイティブ / RN / Flutter → ネイティブ（CameraX + Camera2）
- [x] 公式動画の秒数・解像度・コーデック・音声の有無 → HEVC Main / 短辺720長辺1280 / ~30fps / AAC-LC 48k mono / 約2.07秒。詳細は [analysis/phase0-output-profile.md](analysis/phase0-output-profile.md)（保存経路の値。投稿経路との差は Phase 1 で検証）
- [x] 投稿時刻はサーバー決定かクライアント送信か → クライアント送信（body の timestamp）
- [x] 署名チェック・ Play Integrity の有無 → 署名検証・Play Integrity は無し。PairIP licensecheck（起動時 Play ライセンス確認）のみ
- [x] linimal と同じリポジトリか別か → 別リポジトリ（cutlog 単独）
- [x] 本体同梱の media3 を再利用できるか → できない（難読化済みで、一部は元の名前で残るため衝突もする）。media3 1.11.1 を `dev.utaa.cutlog.shaded.*` へ付け替えて同梱し、シェーダーは resource パッチで追加する
- [x] 編集 Activity 方式か Dialog 方式か → 全画面 Dialog。マニフェスト登録が不要で、カメラ画面の状態を保ったまま本体の処理へ戻せる
