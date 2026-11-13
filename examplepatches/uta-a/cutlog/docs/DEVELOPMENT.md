# cutlog 開発メモ

パッチの仕組み、検証の手順、実機で確認したことの記録。利用者向けの説明は [README](../README.md)、設計は [DESIGN.md](DESIGN.md) にある。

## 開発の流れ

Phase 0 の静的調査は完了。Phase 1 のローカルインストール元チェックと録画完了時の動画差し替え PoC は実装済み。差し替えた動画を dev グループへ投稿し、別端末で再生できることはユーザー確認済みで、Phase 1 は Go。途中のロック問題は受信側の鍵再生成で解消した。Phase 2 の投稿前編集（F1〜F3）と Phase 3 のファイルから投稿（F4）は実装済みで、実機で編集・書き出し・本体の送信先画面への受け渡しまで確認した。編集済み動画と取り込み動画を dev グループへ投稿し、別端末で再生できることも確認した。Phase 4 の編集画面の作り込み（ツールバーとタイムライン、文字・スタンプ・効果・フレーム・反転・ズーム・速度・逆再生）は実装済みで、速さを変えて長さの変わった動画も投稿・別端末での再生を確認した。Phase 5 で設定画面（F6）を足し、F5（過去の時間帯に投稿）は実装しないことに決めた。バンドルは GitHub（`uta-a/cutlog`）で v0.1.0 として公開した。

## ドキュメント

- [DESIGN.md](DESIGN.md) — 設計書（要件・アーキテクチャ・マイルストーン）
- [analysis/phase0-recording-upload.md](analysis/phase0-recording-upload.md) — 録画完了点とアップロード経路の静的解析
- [analysis/phase0-output-profile.md](analysis/phase0-output-profile.md) — 公式撮影分の出力仕様（OutputProfile の基準値）
- [compatibility/pairip-integrity.md](compatibility/pairip-integrity.md) — PairIP / 改ざん検知・整合性保護の調査

## Phase 0 の到達点

- 対象: `com.newchat.setlog` v1.3 / versionCode 76 / arm64-v8a（Google Play 版）
- フレームワーク: ネイティブ Android（CameraX + Camera2 フォールバック）。Flutter / React Native ではない
- フック点: 録画完了の単一 choke point `vb0.G0(oc0)`（難読化後の名前）
- アップロード: 署名付き URL への HTTP PUT。メディアは暗号化される
- 投稿時刻: クライアント送信値（body の `timestamp`）
- 整合性保護: 署名検証・Play Integrity は無し。PairIP licensecheck（起動時 Play ライセンス確認）のみ
- 動画仕様: HEVC Main / 短辺720・長辺1280 / 約30fps / AAC-LC 48kHz モノラル / 2.065978 秒固定（「保存」経路の値）
- 残件: UI フロー実機確認、投稿経路の動画仕様の確認（Phase 1）

## インストール元チェックのパッチ

- 対象: setlog v1.3 / versionCode 76 / arm64-v8a の APKM
- `インストール元チェック` パッチ（v0.1.0 より前の名前は `cutlog`）は `LicenseClient.performLocalInstallerCheck(): boolean` の本体を `return true` に置換する
- fingerprint は宣言クラス・メソッド名・signature・インストール元 API 呼び出し・判定文字列で照合。一致が一件でなければ適用を中止する
- PackageManager API 全体や Firebase のインストール元収集は変更しない。Play ライセンス通信・応答検証・ペイウォールも残るため、起動成功を保証するものではない

ビルドには Morphe の GitHub Packages 認証（環境変数 `GITHUB_ACTOR` / `GITHUB_TOKEN`、または `~/.gradle/gradle.properties` の `gpr.user` / `gpr.key`）が必要。

```sh
./gradlew :patches:build :patches:buildAndroid
java -jar <morphe-desktop-all.jar> patch \
  --patches patches/build/libs/patches-<version>.mpp \
  --out scratch/setlog-installer-check.apk \
  --keystore scratch/cutlog-dev.keystore \
  setlog-apk/setlog-1.3-76.apkm
```

検証済み: バンドルのビルド、実 APKM への適用・既存開発鍵での署名、`apksigner verify`、生成 APK の jadx 再解析で `return true` を確認。署名済み検証 APK は `scratch/setlog-installer-check.apk`。Android 13 の実機（23043RP34G）へ `adb install -r` で上書きし、コールド起動でログイン画面への到達、40 秒後も同一プロセスが生存することを確認。観測中に「安全設定を完了」画面へ進んだ。暗号鍵の移行・新規作成と、過去動画へのアクセス・投稿は未確認。

## MicroG-RE 経由の Google ログイン

`MicroG-RE Google ログイン` パッチは、通常の「Google でログイン」で取得する Google ID token の提供元だけを MicroG-RE に向ける。setlog の `auth/loginWithGoogle`、nonce、プロフィール登録、暗号鍵の準備・保存は本体の処理をそのまま使う。トークンやログイン成功を偽造するパッチではない。

- [MorpheApp/MicroG-RE](https://github.com/MorpheApp/MicroG-RE)（`app.revanced.android.gms`）を導入し、MicroG-RE 側に Google アカウントを登録してから、setlog の通常の Google ログインボタンを押す。別のログインボタンや設定は追加しない
- 公式リリースの署名証明書（SHA-256 `0b6c9515afb195fac59601696ba0a7907a0b217ccf720b43148427ccf64343e7`）を検証する。未導入・署名不一致・確認失敗時は元の Google Play services 経路を使う
- Google ID token だけの要求では Android 本体の Credential Manager ではなく同梱の Play services provider を使い、その中でも nonce 対応の Identity Sign-In `getSignInIntent` を選ぶ。パスワード・パスキー・認証情報のクリア要求は変更しない
- Sign-In client の生成時に接続先を固定し、action・package・dynamic lookup を揃える。時間制限付きのグローバルフラグは使わない。FCM・Maps・その他の GMS service は向け替えない
- manifest に MicroG-RE の package visibility と、元 APK の署名 SHA-1 を伝える `app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE` を追加する。APK 自体は開発鍵で署名されるため、公式版へのデータを保持した上書きはできない
- 既存のログイン状態や暗号鍵は消去しない。本体のキャンセル・タイムアウト・エラー処理も残す

検証用 APK: `scratch/setlog-microg.apk`。編集・取り込み・撮影秒数の既存パッチも含む。バンドルのビルド、元 APKM への全 5 パッチの適用、署名検証、実行時の Google 要求限定・署名検証失敗時の元経路維持・service の分離を確認した。

Android 16 の XIG07 にインストールして起動を確認した。さらに、インストール済み APK の実クラスを Android 上で読み込み、MicroG-RE 7.3.0 の署名、Google option の認識、provider factory の選択、nonce 対応 controller の選択、connection config の MicroG package、他 service の元 package 維持、元証明書 metadata を検証した。このスモークは token を要求せず、ログイン状態・保存データ・暗号鍵を変更しない。端末はログイン済みで編集中だったため、Google アカウントでのログインやり直しと backend の応答までは確認していない。

## 投稿前編集のパッチ

`投稿前編集` パッチは、録画完了時（`vb0.G0`）に録画結果を預かり、全画面の編集画面を出す。見た目は setlog の送信先選択画面に合わせている。

- 画面は上から、プレビュー、再生の行（再生・一時停止、再生位置、「そのまま投稿」）、タイムライン（動画のサムネイルと、文字・スタンプの表示区間のバー。ドラッグで再生位置を動かし、バーの両端で表示区間を変える）、選んだツールのパネル、ツールバー（トリム・フィルター・調整・効果・フレーム・反転・ズーム・速度・文字・スタンプ・動き。横にずらして選ぶ）
- プレビュー左上の ✕: 確認のうえ録画を破棄し、本体のキャンセル処理（`vb0.F0`）で撮影画面を閉じる
- プレビュー右上のピンクの ↑: 編集内容を焼き込んで書き出し、本体の送信先選択画面へ進む
- 「そのまま投稿」: 編集せずに本体の送信先選択画面へ進む
- フィルター: なし／モノクロ／セピア／ウォーム／クール／フェード。最後に使ったフィルターを次回の初期値にする
- 調整: 明るさ・コントラスト・彩度
- 効果: RGB（色相が回る）・VHS・グリッチ・ぼかし・ビネット・粒子ノイズ・揺れ。それぞれ強さを変えられる
- フレーム: 集中線・枠・フィルム・録画・シネマ
- 反転・ズーム: 左右・上下の反転、拡大（最大 3 倍）と表示位置
- 速度: 0.5x〜2x。書き出す動画の長さと、文字・スタンプの表示区間も同じ比率で変わる。書き出す長さが 1〜15 秒に収まる速さだけ選べる
- 逆再生: 速度パネルの「⟲ 逆再生」。逆向きの中間ファイル（音声も逆向き）を作り、以降のプレビューと書き出しの入力にする。作っている間は進み具合を出し、やめられる
- 文字: 複数追加でき、フォント（同梱の日本語 4 書体と端末のフォント）・色（RGB を含む）・スタイル（縁取り・影・背景帯・ネオン）・大きさ・角度を変えられる。プレビュー上でドラッグして移動し、2 本指で拡大・回転する。入力中は入力欄がキーボードの上に上がる
- スタンプ: 絵文字と端末の画像（写真選択画面で選ぶ）。文字と同じく移動・拡大・回転できる
- 動き: 文字・スタンプの入り・出のアニメーション（フェード・スライド・拡大・タイプライター）

書き出しは同梱の Media3 Transformer で HEVC にエンコードする。解像度・音声（AAC）は録画を引き継ぐ。長さは速さを変えたときだけ変わる。HEVC 以外にフォールバックした場合は失敗として扱い、元の動画で進むかを選ばせる。編集画面を開けない場合（Activity が無い等）は何もせず本体の処理を続ける。

## ファイルから投稿のパッチ

`ファイルから投稿` パッチは、撮影画面のシャッターの右（フラッシュと左右対称の位置）に「ファイルから」ボタンを足す。押すと写真選択画面（動画のみ）が開き、選んだ動画を編集画面で扱う。

- 取り込み用の編集画面には「トリム」ツールが加わり、公式と同じ 2.066 秒の区間を選ぶ。動画が短い場合は全体を使う
- 書き出しは必ず公式撮影分の仕様へ揃える: HEVC、縦 720x1280 / 横 1280x720（はみ出しは切り落とし）、30fps 以下、AAC-LC 48kHz モノラル（音声が無ければ無音トラック）、HDR は SDR へ変換
- 「そのまま投稿」は出さない。✕ は撮影画面へ戻るだけ
- 書き出した動画は本体の録画と同じ `cacheDir/camera/collection_camera_<時刻>.mp4` に置き、本体の撮影開始処理（`vb0.j1`）で撮影時刻・UTC オフセット・国コードを作ってから `CollectionCameraResult` を組み立てて渡す。レンズ向きは背面として扱う

実機で確認したこと（Android 13）: ボタンの表示位置、写真選択画面からの選択、トリム、縦 1080x1920・60fps・H.264・ステレオ 44.1kHz・6 秒の動画を 720x1280・約 30fps・HEVC Main・AAC-LC 48kHz モノラル・約 2.08 秒へ変換して本体の送信先選択画面へ渡すところまで（本体の「保存」で書き出したファイルを ffprobe）。dev グループへの投稿と別端末での再生も確認済み。未確認: 横向き・回転付き・音声なし・HDR の動画、写真選択画面から戻る間に撮影画面が作り直された場合。

## 撮影秒数の選択のパッチ

`撮影秒数の選択` パッチは、撮影画面のフラッシュの左に長さのボタン（「2秒」）を足す。押すたびに 2 → 3 → 5 → 10 → 15 秒と切り替わり、公式と違う長さの間はピンクの縁取りが付く。選んだ長さは保存され、次回も使う。「ファイルから投稿」の切り出しの長さもこれに合わせる（2 秒なら公式の 2.066 秒）。

本体は録画設定 `CollectionCameraConfig.recordDurationMs`（公式 2000ms）を「最低これだけ録る長さ」として使い、シャッターを押すとすぐ停止を要求してこの長さに達したところで止める。パッチはこの値を読む箇所すべて（録画開始・メタデータ取得・進捗表示など）の直後で選んだ長さに置き換え、停止要求から強制停止までの予備のタイマー（CameraX・Camera2 の各バックエンドで 2000ms 固定）を選んだ長さ＋1 秒まで延ばす。タイムラプスの設定は変えない。

実機で確認したこと（Android 13）: 5 秒で 5064ms、30 秒（当時の選択肢）で 30048ms、2 秒に戻して 2065ms の録画になること。選択肢は最大 15 秒に絞った（以前 30 秒を選んで保存していた場合は 2 秒に戻る）。撮影中の進捗表示も選んだ長さで進む。5 秒・10 秒の動画は dev グループへ投稿・別端末で再生できることを確認済み（差し替え動画で検証）。15 秒の投稿は未確認。

### 同梱する media3

setlog 本体の media3 は R8 で難読化されているため流用できない。一方で `ExoPlayer` など一部は元の名前で残っているため、そのまま同梱するとクラス名が衝突する。そこで `extensions/cutlog/build.gradle.kts` で media3 1.11.1 と依存（Guava・Kotlin・kotlinx 等）を `dev.utaa.cutlog.shaded.*` へ付け替えてから extension に入れる。AAR の keep 規則も付け替えて R8 に渡す。

media3-effect はシェーダーを `R.raw` から読むが、extension は resource を持ち込めない。パッチがシェーダーを `res/raw/cutlog_media3_*.glsl` として APK に追加し、extension 側の `R` クラスが実行時に ID を引く。シェーダーは `patches/src/main/resources/cutlog/media3-shaders/`（media3 1.11.1 の AAR から取得。Apache License 2.0）。media3 を更新するときは、シェーダーと `R` のフィールドも合わせて更新する。

### 検証用の差し替え動画

次のファイルを置くと、録画をこの動画に置き換えてから編集画面を開く（Phase 1 の差し替え PoC を引き継いだもの）。置いている間はすべての撮影が置き換わるので、検証が済んだら必ず消す。

`/sdcard/Android/data/com.newchat.setlog/files/cutlog/replacement.mp4`

```sh
adb push scratch/replacement.mp4 /sdcard/Android/data/com.newchat.setlog/files/cutlog/replacement.mp4
adb logcat -s cutlog   # "Replaced capture: ..." / "Export completed: ..." / "Delivering edited capture: ..."
adb shell rm /sdcard/Android/data/com.newchat.setlog/files/cutlog/replacement.mp4
```

検証用の動画は OutputProfile に合わせて ffmpeg で作る（`scratch/replacement.mp4`、HEVC Main 1280x720 30fps、AAC-LC 48kHz モノラル、約 2.07 秒）。

### 実機で確認したこと（Android 13、23043RP34G）

- 撮影直後に編集画面が開き、プレビューがループ再生される
- フィルター（セピア・ウォームの LUT を含む）がプレビューに反映される
- テキストの追加・色変更・ドラッグがプレビューと書き出し結果で一致する
- ↑ で約 0.35 秒で書き出し（`OMX.qcom.video.encoder.hevc`、1280x720、HEVC）、編集済み動画が本体の送信先選択画面に表示される
- 「そのまま投稿」で元の動画が、✕ →「破棄する」で撮影画面が閉じてログ画面に戻る
- 編集済み動画を dev グループへ投稿し、別端末で再生できることを確認した
- 未確認: 縦向き撮影、カメラ映像（差し替え動画以外）の編集、プロセス終了時の挙動

### Phase 4 で実機確認したこと（Android 16、XIG07）

- 効果 7 種・フレーム 5 種がプレビューに出て、組み合わせて書き出せる。録画のフレームは時刻表示が進む
- 反転・ズームの書き出しがプレビューと一致する
- 速度: 0.5x で 4126ms・62 フレーム、2x で 1033ms・31 フレーム（30fps へ間引く）。文字・スタンプは書き出し後の時間で表示される。速さを変えた動画の投稿と別端末での再生も確認した
- 逆再生: 2 秒の動画で約 2 秒、キーフレームが先頭だけの 15 秒・450 フレームの動画で約 10 秒で中間ファイルができ、書き出しも正しい向き・長さになる
- 未確認: 2 本指の操作、端末の画像のスタンプ、取り込み（トリム）の流れ、タイプライター・拡大のアニメーション

同梱フォント（M PLUS Rounded 1c・Dela Gothic One・Yusei Magic・DotGothic16）は SIL Open Font License 1.1。ライセンス文は `patches/src/main/resources/cutlog/fonts/LICENSE.txt` にあり、APK にも `res/raw/cutlog_fonts_license.txt` として入れる。

## 設定画面（F6）

`投稿前編集` パッチは、撮影画面の `SetlogCameraFragment#setupUi` の先頭で `CaptureInterceptor.onCameraSetup` を呼び、シャッターの並びの右端（長さのボタンと左右対称の slot 2）に歯車ボタンを足す。押すと設定のダイアログを開く（録画中は開かない）。

- 切り替えられるのは「投稿前の編集」「ファイルから投稿」「撮影する長さ」。初期値はすべて ON。値は cutlog 専用の SharedPreferences（`cutlog`）に `feature_<key>` で保存する
- 当てていないパッチの機能は出さない。各パッチのフックが撮影画面を作るたびに `Feature.markAvailable()` を呼び、ダイアログはそれを見る
- 投稿前の編集が OFF: `onCaptured` が false を返し、本体の送信先選択画面へそのまま進む。「ファイルから投稿」の取り込みは仕様への変換に編集画面を使うため、この設定に関係なく編集画面を開く
- ファイルから投稿が OFF: 「ファイルから」ボタンを隠す
- 撮影する長さが OFF: 長さのボタンを隠し、`RecordDuration.selectedMs()` が公式の 2000ms を返す。選んでいた長さは残り、ON に戻すと使われる
- ボタンは OFF でも撮影画面に追加しておき、`CameraChrome` のレイアウト時に表示だけを切り替える。ダイアログを閉じると並びを合わせ直す
- cutlog のボタンはフラッシュボタンが GONE のときだけ一緒に隠す。setlog 1.3 はフラッシュを GONE にしない（カメラの権限が無いときは INVISIBLE、フラッシュが使えないときは半透明）ため、歯車ボタンは常に出る

実機で確認したこと（Android 16、XIG07）: 歯車ボタンの位置、ダイアログの表示、「ファイルから」と長さのボタンが閉じた直後に消えること、撮影画面を開き直しても設定が残ること。撮影する長さを 5 秒にしたまま OFF にすると 2067ms で録画されること。投稿前の編集を OFF にすると撮影後に本体の送信先選択画面が開くこと（投稿はせずに閉じた）。

## 第三者のライセンス

同梱するライブラリ（付け替えた media3 と依存）とフォントの一覧・著作権表示・ライセンス本文は `patches/src/main/resources/cutlog/THIRD_PARTY_NOTICES.txt` にある。`.mpp` に入り、`投稿前編集` パッチが APK にも `res/raw/cutlog_third_party_notices.txt` として追加する。media3 や依存を更新したら `./gradlew :extensions:cutlog:dependencies --configuration media3Shade` で一覧を取り直し、このファイルとリポジトリ直下の NOTICE を合わせる。

## リリース

`gradle.properties` の `version`、`patches-bundle.json`（説明・`download_url`・`version`）、`./gradlew :patches:generatePatchesList` で作り直した `patches-list.json` を 1 コミット（`chore: リリース vX.Y.Z`）で更新する。`patches-list.json` は手で編集しない。GitHub のリリース `vX.Y.Z` に `patches/build/libs/patches-X.Y.Z.mpp` を添付する。Morphe Manager は `patches-bundle.json` を見て新しいリリースを見つける。

## 注意

- APK・逆コンパイル結果・署名鍵はコミットしない（`.gitignore` 済み。`setlog-apk/` はローカル専用の読み取り入力）
- 検証はサブアカウントで行う。利用規約・アカウント停止のリスクがある
