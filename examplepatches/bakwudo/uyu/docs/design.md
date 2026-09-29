# uyu 設計書

- 最終更新: 2026-09-28
- 状態: 段階 3（広告ブロック）まで完了し、v1.2.0 をリリースした。プロキシでの再生だけ未確認（進捗は TODO.md）

Android 版 Twitch アプリ向けの Morphe パッチバンドル「uyu」の設計をまとめる。本文（1〜11 章）は合意済みの仕様、付録は実装時の手がかりとなる調査メモ（主に Twitch 30.x 時点の情報で、31.3.1 では要再確認）。

---

## 1. 概要

| 機能 | 概要 |
|---|---|
| チャンネルポイント自動取得 | 視聴中チャンネルのボーナスを自動で受け取る。設定でオン/オフ |
| 弾幕コメント | チャットをニコニコ動画のように動画上へ流す。設定とプレイヤー上のボタンでオン/オフ、フォントや見た目を細かく設定可能 |
| 広告ブロック | ブロックできる広告をすべてブロックする。設定でオン/オフ |
| 表示の整理 | サブスク・ビッツのボタンの段、ギフトのランキング、サブスクを促すバナーなどを隠す。項目ごとに設定でオン/オフ |
| ログイン・通知の修正 | 再署名したアプリでログインと通知を使えるようにする（上記機能の前提） |
| 別アプリとしてインストール | 公式の Twitch を置き換えず、別名の別アプリ「uyu」として入れる |

## 2. 全体方針

### 配布・ライセンス
- 単独で動くパッチバンドルとして、GitHub `bakwudo/uyu`（公開）で配布する。Morphe Manager に外部ソース（`github.com/bakwudo/uyu`）として追加できる形にする。
  - 2026-09-28 にユーザーの依頼でリポジトリを作り直し、それまでのコミット、PR、リリースを消した。同時に、Kotlin のパッケージと、別アプリとして入れるときのパッケージ名を `io.github.bakwudo.uyu` に変えた（v2.0.0）。パッケージ名を変えると、インストール済みの uyu とは別のアプリになり、ログインと設定が引き継がれない。
- バンドル名は `uyu`。
- ライセンスは GPLv3。Morphe テンプレートの NOTICE と、流用したソースの著作権ヘッダーは保持する。プロジェクト名に「Morphe」は使わない。
- README に書くこと:
  - クレジット: hooman（Fix login / Fix notifications の参考）、ReVanced（設定画面の差し込み・自動取得の参考）、niconico-yt-morphe-patches（弾幕の設計の参考）、ajstrick81（広告ブロック手法の参考）
  - Twitch の利用規約に反する改造であることの注意書き
  - メンテナンスはベストエフォートであること

### 対象バージョンと追従
- 対象は **Twitch 31.3.1** のみ（versionCode 3103016、APKMirror では分割 APK = APKM のみ配布）。
- パッチの 1 リリースが対応する Twitch のバージョンは 1 つだけ。
- 追従は不定期・手動。壊れたとき以外にも新しいバージョンへ上げるが、定期的な追従は約束しない。
- 追従しやすくするための設計:
  - フィンガープリントは難読化後のクラス名・メソッド名に頼らず、文字列・引数と戻り値の型・命令パターンで特定する。
  - フィンガープリントは機能ごとに 1 ファイルへ集約する。
  - 新しい APK に対し、どのフィンガープリントが一致しなかったかを一覧表示する検証スクリプトを用意する。
  - `docs/updating.md` にバージョンを上げる手順を書く。

### 命名・言語
- UI は当面英語のみ。
- Kotlin パッケージは `io.github.bakwudo.uyu`。
- 拡張コードの名前空間は `io.github.bakwudo.uyu.extension`。R8 の repackage 先もここにし、他のバンドル（hooman は `app.morphe.extension.twitch`）とクラス名が衝突しないようにする。
- パッチ名は他のバンドルと重ならないようにする。

### ビルド・リリース
- `MorpheApp/morphe-patches-template` をもとにする。
- JDK 21 で `./gradlew buildAndroid` を実行し、`patches/build/libs/patches-<ver>.mpp` を生成する。
- GitHub Packages（`https://maven.pkg.github.com/MorpheApp/registry`）の認証:
  - ローカルではビルドスクリプトが `gh auth token` を実行してトークンを取得する（平文ファイルには保存しない）。
  - CI では `GITHUB_TOKEN` を使う。
- リリースはテンプレートの semantic-release を使い、`main` を安定版、`dev` をプレリリースとする。
- バージョンの上げ方（2026-09-28 にユーザーと決定）: 機能を追加したときは 2 桁目（`feat:` のコミット）、バグを直したときは 3 桁目（`fix:` のコミット）を上げる。semantic-release がコミットの種類から決める（`.releaserc`）。
- リポジトリ設定「Allow GitHub Actions to create and approve pull requests」を有効にする必要がある。

## 3. パッチ一覧

| パッチ（仮名） | 内容 | 切り替え | 初期状態 |
|---|---|---|---|
| Settings（非表示・依存パッチ） | Twitch の設定メニューに「uyu」を追加し、独自の設定画面を開く | ― | 常に適用 |
| Native theatre（非表示・依存パッチ） | 配信を常に従来のネイティブの視聴画面で開く（React Native 版の視聴画面を使わない）。自動取得・弾幕・広告ブロックが依存する | ― | 常に適用 |
| Fix login | Play Integrity による認証処理を止め、再署名したアプリでもログインできるようにする | パッチ選択時のみ | オン |
| Fix notifications | Firebase Installations の `X-Android-Cert` と `X-Android-Package` ヘッダーを元の署名とパッケージ名の値に書き換え、プッシュ通知を受け取れるようにする | パッチ選択時のみ | オン |
| Install as a separate app | パッケージ名とアプリ名を変え、公式の Twitch とは別のアプリとして入れる（下の「別アプリとしてのインストール」） | パッチ選択時のみ | オン |
| Auto claim channel points | ボーナスを自動で受け取る | 設定画面 | オン |
| Danmaku comments | 弾幕コメントを流す | 設定画面とプレイヤーのボタン | オン |
| Hide promotions | サブスク・ビッツのボタンの段などを隠す（下の「表示の整理」） | 設定画面（項目ごと） | オン（すべて隠す） |
| Block ads | 広告をブロックする | 設定画面（単一のトグル） | オン |

再署名するため、Google アカウントでのログインは使えなくなる。ユーザー名とパスワードでログインする。

### 別アプリとしてのインストール（2026-09-27 に決定）
- 公式の Twitch を置き換えず、YouTube Morphe と同じく、別のパッケージ名と別のアプリ名で入れる。公式の Twitch と同じ端末に共存できる。
  - アプリ名は「uyu」（ランチャーと最近使ったアプリに出る名前）。Twitch の画面の中の「Twitch」という文言とアイコンはそのまま。
  - パッケージ名は `io.github.bakwudo.uyu`。
- 公式の Twitch と同じ名前では共存できないもの（独自のパーミッション、ContentProvider の authority、Login with Amazon のリダイレクト先）も、パッケージ名に合わせて名前を変える。Twitch とライブラリは実行時にパッケージ名からこれらの名前を組み立てるので、同じ規則で変える（付録 A.12）。
- 通知のため、Firebase Installations に送るパッケージ名は元の `tv.twitch.android.app` にする（Fix notifications）。
- root のマウント方式では、インストール済みの Twitch を置き換えるので使えない。Morphe Manager では選べなくする。
- 以前のパッチ済みアプリ（パッケージ名 `tv.twitch.android.app`）とは別のアプリになるので、ログインと uyu の設定は引き継がれない。古い方は利用者がアンインストールする。

### 表示の整理（2026-09-27 に決定）
設定画面の「Appearance」で、次のものを項目ごとに隠せる。初期値はすべて「隠す」。

| 項目 | 隠すもの |
|---|---|
| Hide the subscribe and Bits buttons | チャットの上の段にあるビッツ、サブスクを贈る、サブスクライブのボタン。ほかに何も表示されていなければ段ごと隠す |
| Hide the Bits button in the chat box | チャットの入力欄にあるビッツのボタン |
| Hide the gift leaderboard | チャットの上のギフトとビッツのランキング、ランキングを開くボタン |
| Hide subscription promotions | プレイヤーの上に出る、サブスクやサブスクギフトの割引、SUBtember などの宣伝のバナー。チャットの上に出る「SUBtemberを満喫しましょう！」とサブスクギフトの割引のハイライト（2026-09-27 にユーザーの依頼で追加）。Turbo の宣伝のバナー |

- 隠すのをやめた項目は、次に配信を開いたときに表示される。
- 実装は付録 A.13。
- ネイティブの視聴画面を前提にする（3 章「視聴画面」）。
- 対象外（2026-09-27 時点）: 横画面でプレイヤーの操作ボタンを出したときの配信情報にある、フォロー・通知・サブスクを贈る・サブスクライブのボタンの列（フォローと通知のボタンと一緒になっているため）。

### 視聴画面（2026-09-27 に決定）
- 31.3.1 の配信の視聴画面には、新しい React Native 版（Twitch の実験機能「Ultralight」）と、従来のネイティブ版がある。React Native 版ではチャットやチャンネルポイントの処理が JS 側にあり、uyu のフックが効かない。
- uyu は視聴画面の振り分けを常に「ネイティブ」にする（Native theatre パッチ）。ホームのフィードは React Native のままで、配信をタップするとネイティブの視聴画面が開く。Twitch 自身が、実験機能がオフの利用者に使っている経路である。
- 5 章（弾幕）と 6 章（広告ブロック）も、ネイティブの視聴画面を前提にする。
- Twitch がネイティブの視聴画面を廃止したら、各機能を React Native 版向けに作り直す必要がある（11 章）。

## 4. チャンネルポイント自動取得

- 対象は、視聴中のチャンネルに出るボーナス（宝箱）だけ。フォローしている他チャンネルでのバックグラウンド取得や、その他の報酬は対象外。
- 方式: チャンネルポイントのデータプロバイダ（ポイント情報の更新を受け取る層）にフックし、更新に受け取れるボーナスが含まれていれば、プロバイダ自身の受け取り処理を呼び出す。
  - UI の表示状態に関係なく取得できる（フルスクリーンで視聴中でも、公式チャットをオフにしていても取りこぼさない）。
  - 当初はボタンの状態更新処理（CommunityPointsButtonStateProvider）にフックする予定だった。31.3.1 では、ボタンの表示状態を作る処理はチャットの画面が有効な間しか動かないため、その下のデータ層に変えた（付録 A.3）。
  - 認証や整合性ヘッダーはアプリ自身に任せ、独自の API 呼び出しは行わない。
  - 同じボーナスには 1 回だけ受け取りを要求する。受け取れないまま 30 秒たったら、次の更新で再び要求する。
- ネイティブの視聴画面でだけ働く（3 章「視聴画面」）。React Native 版の視聴画面では、このデータプロバイダが動かない。
- 取得時に独自の通知は出さない（Twitch 自身のアニメーションに任せる）。

## 5. 弾幕コメント

### 表示する条件
- ライブ配信を見ているときだけ表示する。VOD とクリップでは表示しない。
- 横画面のフルスクリーンでは常に表示する。縦画面、Twitch のミニプレイヤー（アプリ内で動画を下にスワイプしたときの小窓）、ピクチャーインピクチャーでは、それぞれの設定（初期値はどれもオン）がオンのときに表示する（2026-09-28 にユーザーの依頼で追加。それまではどれでも表示しなかった）。
  - 描画の決め方（動画の領域に流し、その高さを行数で割る）はどの状態でも同じ。小窓では文字も小さくなる。
  - 31.3.1 での見分け方は付録 A.11。
- 公式の横画面チャット（オーバーレイ / 横並び / オフ）には、初期状態では手を加えない。弾幕を使う人は公式チャットを自分でオフにする。
- 設定「Hide the chat in landscape」（初期値はオフ、2026-09-27 に追加）をオンにすると、横画面のチャットを常に「オフ」にし、プレイヤーの「チャット」ボタン（チャットの表示方法を切り替えるボタン）を横画面で隠す。
  - Twitch が保存しているチャットの表示方法は書き換えず、読み出す値だけを「オフ」にする。設定をオフに戻すと、利用者が前に選んでいた表示方法に戻る。
  - 表示方法の設定のほかにも、チャットのオーバーレイ、チャットのトレイ、コミュニティのハイライトの展開、拡張機能、チャットの入力で、Twitch は横画面のチャットを横並びで開く。設定がオンの間は、これらでもチャットを開かない（2026-09-27、最初の実装では横並びやオーバーレイになることがあったため追加）。
  - Twitch は、オーバーレイを紹介するために、横画面のチャットが「オフ」の利用者を一度だけオーバーレイに切り替え、それを利用者の選択として保存する。設定がオンの間は、紹介を表示済みとして扱い、この切り替えを起こさない。
  - 31.3.1 では、Twitch の設定クラスの値を読む処理、視聴画面のチャットの状態（ViewModel）、下部の操作ボタンの描画にフックする（付録 A.11）。

### コメントの取得
- アプリのチャット受信処理（データ層）にフックする。RecyclerView のバインド処理は表示中の行にしか走らないため使わない。
  - 31.3.1 では、チャットの接続が受信したメッセージのまとまりごとに作るイベント（`MessagesReceivedEvent`）のコンストラクタにフックする（付録 A.5）。
  - 接続前の履歴（`fromHistory`）は流さない。チャンネルに入り直したときに接続が同じメッセージを送り直すので、メッセージ ID で重複を除く。
  - 受信したチャンネルでは絞り込まない。ネイティブの視聴画面がつなぐチャットは視聴中のチャンネルだけのため。チャンネルを切り替えた直後は、前のチャンネルのメッセージが少し混じることがある。
- 公式チャットを「オフ」にしている間も受信が続くかは実機で確認する。止まる場合は、匿名 IRC 接続（付録 A.5）への切り替えを相談する。

### 表示する内容
- 表示するのは本文のテキストと Twitch 公式エモート（画像）だけ。エモートは 1 行の高さに合わせて表示する。
- ユーザー名、名前の色、サードパーティのエモート（BTTV / FFZ / 7TV）、システムメッセージ（Bits、サブスク、レイドなど）は表示しない。
- フィルタ（NG ワード、コマンド、bot の除外）は今回は実装しない。

### 描画
- 自前の Canvas ベースの View で描画する（既存の弾幕ライブラリは使わず、YouTube 用ニコニコパッチのコードも流用しない）。
- 描画範囲は動画が表示されている領域。チャットを横並びにするモードで動画が縮んだ場合は、その縮んだ範囲に流す。
- 重なり順は動画より上、プレイヤーの操作ボタンより下。
- 31.3.1 では、プレイヤーの View（`player_view_delegate`）の中で動画の枠の直後に置き、動画の枠とプレイヤーが重なる範囲に合わせる。エラー表示、広告、字幕、操作ボタンはその上になる（付録 A.11）。
- エモートの画像は `static-cdn.jtvnw.net/emoticons/v1/<id>/<scale>` から取得する（アニメーションするエモートも静止画になる）。

### 流れ方
- ニコニコ方式: どのコメントも、右端に現れてから左端に消えるまでの時間を同じにする。長いコメントほど速く動く。
- 段の割り当て: 上から順に、先に流れているコメントに追いつかない最初の段を選ぶ。
- 空いている段がないときは、ランダムな段に重ねて表示する（弾幕状態）。
- 描画負荷を抑えるため、同時に表示するコメントの数に上限を設け（設定項目「上限数」）、超えた分は流さない。当初は「行数 × 3」件としていたが、2026-09-27 に設定できるようにした。
- 一時停止中は新しいコメントを流さず、流れているコメントも止める。
- 流れている途中でモデレーターに削除されたコメントは、そのまま最後まで流す。
- 映像とのずれは補正しない（視聴者の反応は自分の映像とほぼ同じタイミングで届くため）。
- 自分のコメントを目立たせる表示はしない。

### 設定項目

| 項目 | 初期値 | 範囲・選び方 |
|---|---|---|
| 弾幕のオン/オフ | オン | プレイヤーのボタンと同じ値 |
| 縦画面で流す | オン | オン/オフ。上の「表示する条件」を参照 |
| ミニプレイヤーで流す | オン | オン/オフ。同上 |
| ピクチャーインピクチャーで流す | オン | オン/オフ。同上 |
| 横画面のチャットを隠す | オフ | オン/オフ。上の「表示する条件」を参照 |
| 行数 | 13 | 5〜30。描画範囲の高さを N で割った値を 1 行の高さ（縁取りと行間を含む）とし、1 行を 1 段として使う。文字サイズはここから逆算する |
| 表示範囲 | 100% | 10〜100%（5% 刻み）。画面の上から何 % までに流すかを指定する。使える段数は「行数 × 表示範囲」 |
| 表示秒数 | 4 秒 | 2〜10 秒（0.5 秒刻み） |
| 上限数 | 40 件 | 10〜200 件（10 件刻み）。同時に表示するコメントの数 |
| フォント | システムの標準フォント | システムフォント（標準 / サンセリフ / セリフ / 等幅と、端末にあるフォントファイルのうち欧文と日中韓のもの。日本語のものを先に並べる）、またはファイルピッカーで取り込んだ TTF / OTF（アプリ内にコピーして使う）。フォントは同梱しない |
| 文字の太さ | 700 | 100〜900 の 9 段階。太さを持たないフォントでは、最も近い太さか疑似太字で描く |
| 文字色 | `#FFFFFFFF`（白） | 用意した色（白・赤・ピンク・オレンジ・黄・緑・シアン・青・紫・黒など）から選ぶか、ARGB の HEX で指定 |
| 縁取りの色 | `#66000000`（黒、不透明度 40%） | 文字色と同じ |
| 縁取りの太さ | 文字サイズの 10% | 0〜30%。0 は縁取りなし |
| 不透明度 | 100% | 0〜100%。弾幕全体に 1 つの値をかける（ARGB の α とは別） |

- 設定画面の上部に、サンプルのコメントを実際に流すライブプレビューを置く。
  - 一覧をスクロールしても上部に残し、どの項目を変えている間も見えるようにする。
  - サンプルのコメントは、消えるより少し速い割合（上限数 ÷ 表示秒数の 1.25 倍）で追加し、常に上限数まで流れているようにする。上限数の違いが見て分かる（2026-09-27 にユーザーの依頼で変更）。
  - 縦横比は端末を横にしたときの画面と同じにする（フルスクリーンの縮小表示）。
  - スライダーは動かしている間も値を保存するので、プレビューがすぐに変わる。

### プレイヤー上のボタン
- コメントを流す状態（上の「表示する条件」）のとき、右上に並んでいる既存の操作ボタンの列に追加する。表示・非表示はほかの操作ボタンと連動する。縦画面でも横画面と同じ位置に出る。ミニプレイヤーとピクチャーインピクチャーでは Twitch の操作ボタンが出ないので、ボタンも出ない。
  - 31.3.1 の右上のボタンは ConstraintLayout の鎖で、ConstraintLayout のクラスが難読化されているため、鎖の中には入れない。操作ボタンの入れ物（FrameLayout）に重ねて置き、表示中のボタンのうちいちばん左のものの、さらに左に並べる（付録 A.11）。
  - 操作ボタンの表示中は戻るボタンが必ず表示されるので、その表示状態に合わせる。
- アイコンは吹き出し。オフのときは斜線を入れる。コードで描くので、リソースは追加しない。
- タップで弾幕のオン/オフを切り替える。状態は設定画面の値と同じもので、アプリを再起動しても保たれる。
- 長押しで設定画面を開く機能は付けない。
- 正確な配置は Twitch のプレイヤーのレイアウトに合わせて、実装時に調整する。

## 6. 広告ブロック

- 設定は「Block ads」のオン/オフ 1 つだけ（初期値はオン）。ブロックできる広告はすべてブロックする。
- 設定を変えると、次に配信を開いたときから効く（流れている広告を黒で隠す処理と、プレイヤーのイベントを止める処理はすぐに効く）。
- 実装は付録 A.14。

### 端末内だけでブロックする方式（既定）
次の処理を組み合わせる。
- 配信のアクセストークンを要求するとき、プレイヤーの種類を `embed` にする。ライブと VOD の両方。
- アプリが自分で広告を要求しないようにする（2026-09-28、実装時に変更し、ユーザーが採用した）。
  - 当初は「アプリの広告判定の応答を「広告なし（AdContextUnavailable 相当）」に固定する」予定だった。31.3.1 では、広告判定（GrandDads）の応答が AdContextUnavailable のとき、アプリは「判定できなかったので広告を要求する」として扱う（付録 A.14）。そのため、この方法は使わない。
  - 代わりに、広告の要求をまとめる処理を、Twitch 自身がクリップなどで使う「広告を出さない」状態にし、広告判定の結果（広告を要求するか）も「要求しない」に固定する。
- 配信に埋め込まれた広告（`twitch-stitched-ad`）を検知する処理を止める。
- アプリが別に再生する広告（ライブのクライアント側広告、PbyP の途中広告、VOD の広告、音声のみモードの広告）を止める。配信が求める広告（`twitch-maf-ad`、音声のみモードの広告を含む）と PbyP の準備のイベントは、プレイヤーが送る前に止める。
- 表示広告（バナー、フィード内広告など）を隠す。
  - ネイティブの画面: 表示広告の応答を「広告なし」にする。ブラウズの上部の広告は Turbo の利用者と同じ扱いにして出さない。
  - React Native のホームのフィード: JS が自分で広告サーバー（`edge.ads.twitch.tv`）に要求するので、その要求を失敗させる。フィード内の動画広告にはプレイヤーを作らない。
  - スポンサー配信の表示（`SponsoredStreamPubSubEvent`）は広告枠ではなく配信者による告知なので、対象外（2026-09-28 時点）。

### ブロックしきれなかった広告
- 再生前の広告など、配信の映像そのものに組み込まれていて外せない広告が流れている間は、映像を黒で隠して音を消し、「Ad blocked」と残り秒数を表示する。広告が終わると自動で元に戻る。
  - 始まり: 埋め込み広告の開始のイベント。残り秒数は、最初の広告では広告の区切り全体の長さ、続く広告ではその広告の長さから計算する。
  - 終わり: 配信が再びライブの映像を流すというイベント（`X-TV-TWITCH-STREAM-SOURCE="live"`）、または予定の長さを 5 秒過ぎたときの早い方。
  - 黒い画面は動画のすぐ上に置く。プレイヤーの操作ボタンと弾幕コメントはその上に出る。
  - 音は Twitch 自身の消音の処理で消す。プレイヤーの画面が見つからないとき（音声だけ再生している間など）も、消音と終わりの判定は働く。
- 別の配信に切り替えて見せる方式（Xtra の video swap）は採用しない。

### プロキシ（任意）
- 設定画面に「Proxy URL」を置く。初期値は空欄で、利用者が入力した場合だけ使う。プリセットは用意しない。
  - URL に `{channel}` があればチャンネル名に置き換える。なければ、末尾にチャンネル名と `?allow_source=true&allow_audio_only=true&fast_bread=true` を付ける。
  - ライブ配信のプレイリストだけをプロキシから取得する。VOD は対象外。
- プロキシでの取得に失敗したら、自動で端末内だけの方式に戻し、「Proxy failed」とトーストで知らせる。次に配信を開いたときは、またプロキシを試す。
- 説明欄に次の注意を書く:
  - サブスクや Turbo の「広告なし」特典が効かなくなる。
  - 見ているチャンネルなどの情報がプロキシの運営者に伝わる。

### 31.3.1 での検証
- 上記の各手法が 31.3.1 で効くかは実装時に確認する。効かないものは報告して相談する。
- 2026-09-28 に実機で確認したこと（Claude が adb で確認）:
  - ライブと VOD のアクセストークンを `embed` で要求しても再生できる。ライブ 6 チャンネルを開いて、再生前の広告は一度も出なかった。
  - ホームのフィードの広告の要求が止まり、フィードの表示に問題がない。
  - 広告の要求をまとめる処理が、配信と VOD の視聴画面で「広告を出さない」状態になる。
  - 黒い画面: 埋め込み広告は来なかったので、テスト用に広告の開始を模したビルドで、表示の位置、残り秒数、予定の長さ + 5 秒で消えることを確かめた。
  - プロキシ: つながらない URL（`https://127.0.0.1:1/live/`）で、「Proxy failed」が出て Twitch から再生されることを確かめた。
- 2026-09-28 にユーザーが実機で確認したこと: 実際の埋め込み広告で黒い画面になり、音が消えること。視聴画面の表示広告（バナー）が出ないこと。
- 未確認: 実際のプロキシでの再生。

## 7. 設定画面

- 入口は Twitch の設定メニューに追加する「uyu」項目だけ。
- 構成（2026-09-27 にセクションごとの画面に分けた）: uyu の最初の画面にセクションの一覧を置き、タップするとそのセクションの画面を重ねて開く。ツールバーのタイトルは、最初の画面が「uyu」、セクションの画面がセクション名。戻る操作で一つ前の画面に戻る。
  - **General**: Auto claim channel points（スイッチ）
  - **Appearance**: 3 章「表示の整理」の 4 項目（スイッチ）
  - **Danmaku**: プレビュー、オン/オフ、縦画面で流す、ミニプレイヤーで流す、ピクチャーインピクチャーで流す、横画面のチャットを隠す、行数、表示範囲、表示秒数、上限数、フォント（一覧とファイルの取り込み）、太さ、文字色、縁取りの色、縁取りの太さ、不透明度
  - **Ads**（段階 3 で追加）: Block ads（スイッチ）、Proxy URL（テキスト入力のダイアログ。`TextPreference`）、使い方と注意書き
- 弾幕のプレビューは Danmaku の画面にだけ置く。横画面では、設定の一覧が見えるように、プレビューの高さを画面の 40% までにする（縦横比は保つ）。
- セクションは、適用されたパッチの設定があるものだけを一覧に出す。
- 設定の基盤は自前で作る（段階 1 で決定）。
  - 画面は Android 標準の `android.preference`（PreferenceFragment）をコードで組み立てる。リソースを追加しないので、リソースのパッチ（APK のデコード）が要らない。
  - 値は独自の SharedPreferences ファイル `uyu_settings` に保存する。
  - 画面には、適用されたパッチの設定だけを表示する（拡張コードの `PatchStatus` を各パッチが書き換える）。
  - morphe-patches の共有フレームワークは見送った。`morphe-extensions-library` の Setting 群と、リソースで定義する設定画面に依存しており、移植すると依存とリソースのパッチが大きくなる。`app.morphe.extension.shared` の名前空間を持ち込むと、他のバンドルと組み合わせたときにクラス名が衝突する問題もある。
  - 弾幕の設定で必要になるスライダー、色、フォントの項目は、同じ方式の独自の Preference として作った（`SliderPreference`、`ColorPreference`、`FontPreference`）。ダイアログは、Twitch の明暗に合わせたプラットフォームのテーマで出す。
- 入口の差し込み方（31.3.1）: プロフィールの歯車で開く Twitch の設定画面の先頭に「uyu」の行を置く（Twitch 自身の `settings_menu_item` レイアウトを使う）。タップすると、同じ `SettingsActivity` の中に uyu の設定画面を重ねて表示し、戻る操作で閉じる。ReVanced のように enum に定数を足す方式は使わない（付録 A.4）。

## 8. 実装の順番とリリース

| 段階 | 内容 | リリース |
|---|---|---|
| 1 | 土台（テンプレート、Settings、Fix login、Fix notifications、フィンガープリント検証スクリプト、`docs/updating.md`）と自動取得 | `dev` のプレリリース |
| 2 | 弾幕コメント。あわせて、別アプリとしてのインストール、設定画面のセクション分け、表示の整理（2026-09-27 に追加） | `dev` のプレリリース。段階 1 と 2 がそろったら `main` から **v1.0.0** |
| 2 の追加 | 弾幕を縦画面、ミニプレイヤー、ピクチャーインピクチャーでも流す設定（2026-09-28 に追加） | `dev` を経て **v1.1.0** |
| 3 | 広告ブロック | `dev` を経て **v1.2.0**（2026-09-28）。当初は v1.1.0 の予定だった |

段階 1 で、設定画面の差し込み・フィンガープリントの特定・ビルド・パッチ適用・エミュレーターでのテストという一連の流れを先に確立する。

## 9. 開発とテストの進め方

- 分担: 解析と実装は Claude、エミュレーターでの動作確認はユーザー。
- エミュレーター: Android Studio の AVD で、当初のシステムイメージは Google APIs x86_64（API 35）。
  - Google Play 開発者サービスがあるので、通知（FCM）をテストできる。
  - Play ストアがないので、Play Integrity が走らない。
  - `adb root` が使える。
  - ただしエミュレーターでは、Google APIs と Google Play のどちらのイメージでも、パッチなしの Twitch でログインできなかった（11 章）。
- 実機: 2026-09-27 にユーザーと決め、ログインが必要な確認は Android の実機で行うことにした。USB デバッグで PC につなぎ、adb でインストールと確認をする。
  - 別アプリとしてのインストール（3 章）を入れた APK は `io.github.bakwudo.uyu` として入り、公式の Twitch と共存できる。入れたあとは、ログインをやり直す必要がある。
  - このパッチを外した APK（Morphe Desktop の `-d "Install as a separate app"`）は `tv.twitch.android.app` として入る。署名が違うため公式の Twitch とは共存できないが、以前のパッチ済みアプリに上書きすればログインが保たれるので、ログインせずに確認したいときに使える。
- パッチの適用: PC 上の Morphe Desktop で行う。スマホ版 Manager の「Optimize for device architecture」は x86_64 のライブラリを削ることがあるので使わない。
  ```bash
  java -jar morphe-desktop-1.17.0-all.jar patch --patches patches-<ver>.mpp apk/<twitch-31.3.1>.apkm
  ```
  署名の鍵は `--keystore C:\Software\morphe-data\morphe.keystore` で指定する。実機に入っている uyu はこの鍵で署名したもので、同じ鍵なら上書きインストールでログインが保たれる（指定しないと、入力した APK と同じフォルダに新しい鍵を作る）。
  Morphe Desktop は OpenJDK 系の Java で動かす（Android Studio 同梱の `C:\Program Files\Android\Android Studio\jbr\bin\java.exe` など）。Oracle JDK では、署名のときに同梱の BouncyCastle が拒否されて失敗する（`JCE cannot authenticate the provider BC`）。`--unsigned` を付ける `check-patches.ps1` は Oracle JDK でも動く。
  パッチ後は `lib/x86_64` が残っていることを確認してから `adb install` する。
- Twitch へのログイン（パスワードの入力、メールで届く確認コードの入力）はユーザーが行う。Claude は資格情報を入力しない。
- Claude は adb を使って、logcat の確認、スクリーンショット、画面操作で動作を確かめる。
- 初回はブロック系のパッチを外して起動と再生を確認し、エミュレーター由来の問題とパッチ由来の問題を切り分ける。

## 10. 準備チェックリスト（2026-09-27 時点）

| # | 作業 | 担当 | 状態 |
|---|---|---|---|
| 1 | Android Studio をインストールする | ユーザー | 済 |
| 2 | Android Studio の初回セットアップを行う（SDK の platform-tools / build-tools / emulator、Google APIs x86_64 API 35 のイメージ、AVD 1 台の作成） | ユーザー | 済: SDK（platform-tools、build-tools 36.0.0、emulator、platforms は android-37.0 のみ）は `%LOCALAPPDATA%\Android\Sdk`。拡張モジュールはこれに合わせて compileSdk 37 でビルドする（Morphe の既定は 36）。AVD は `Medium_Phone`（Google APIs x86_64 API 35、1080x2400、420dpi、RAM 2GB） |
| 3 | Windows の機能で「Windows ハイパーバイザー プラットフォーム」を有効にして再起動する | ユーザー | 済（`emulator -accel-check` で WHPX が使えることを確認） |
| 4 | `gh auth refresh -h github.com -s read:packages` を実行する | ユーザー | 済 |
| 5 | Morphe Desktop（`morphe-desktop-1.17.0-all.jar`。GUI と CLI を兼ねる jar が 1 つだけ配布されている）と jadx（`jadx-1.5.6.zip`。CLI の `bin/jadx` と GUI の `bin/jadx-gui` を両方含む）を任意のフォルダに入れ、場所を Claude に伝える（apktool は任意） | ユーザー | 済: `C:\Software\morphe-desktop-1.17.0-all.jar`、`C:\Software\jadx-1.5.6\bin\jadx.bat` |
| 6 | APKMirror から Twitch 31.3.1 の APKM を `apk/` に置く（Git の管理外）。バリアントは x86_64 を含む「arm64-v8a + x86 + x86_64」を選ぶ | ユーザー | 済: `apk/tv.twitch.android.app_31.3.1-3103016_3arch_1dpi_…_apkmirror.com.apkm` |
| 7 | GitHub リポジトリの作成と初回 push、Actions の設定変更 | Claude（実行直前にユーザーへ確認） | 済: https://github.com/bakwudo/uyu （公開）。「Allow GitHub Actions to create and approve pull requests」を有効化。2026-09-27 に `dev` から v1.0.0-dev.1 をプレリリース、`main` から v1.0.0 をリリース |

既存の環境: JDK 21.0.2（Oracle、`C:\Program Files\Java\jdk-21`、JAVA_HOME 未設定）、git 2.45.2、gh（uyu の作業は `bakwudo` のアカウントで行う。gh がほかのアカウントになっているときは、作業の前に `gh auth switch -u bakwudo` を実行する。このリポジトリの Git は、コミットの作者を `bakwudo` にし、push の認証を gh から取るようにローカルで設定してある）、Python 3.14、IntelliJ IDEA 2024.3。

## 11. 未確認事項とリスク

- 31.3.1 は難読化されたクラス名がすべて変わっているため、付録 A の手がかりをもとにすべて探し直す必要がある（段階 1 の分は済。結果は付録 A.3、A.4）。
- 公式チャットがオフのときもチャットの受信が続くか（弾幕の取得方式に影響する）。受信のフックはチャットの画面ではなく接続の層にある。実機で、公式チャットを「オフ」にしても流れ続けることを確認した（2026-09-27）。
- 実機（AQUOS SH-52E、Android 14）で、パッチ済みの 31.3.1 でログインでき、設定画面の「uyu」の行と uyu の設定画面が動くことを確認した（2026-09-27）。自動取得は、React Native の視聴画面では働かず、Native theatre パッチでネイティブの視聴画面にしたところ、ボーナスを受け取って残高が増えた。横画面のフルスクリーンで公式チャットを「オフ」にした状態でも、ボーナスが出てから約 0.3 秒で受け取られた。通知は、2026-09-28 にユーザーが広告ブロックより前のバージョンで、届くことを確認した。
- 広告ブロックの各手法が 31.3.1 で効くか。Twitch は対策を続けており（player type の検証、`hasAdblock` フィールドなど）、効果は不安定になりうる。2026-09-28 時点の確認結果と未確認の項目は 6 章「31.3.1 での検証」。
  - ホームのフィード（React Native）の広告は、広告サーバーへの要求を失敗させて止めている。JS 側がこの失敗をどう扱うかは、フィードの表示に問題がないことしか確かめていない。
  - 黒い画面の終わりは、配信の「ライブの映像に戻った」というイベントに頼っている。Amazon IVS のプレイヤーは、このイベントを再生位置に合わせて送る（ExoPlayer のプレイヤーは、メタデータを受け取るたびにその時点のプレイリスト全体を調べて送るので、少し早く終わることがある。31.3.1 のライブは IVS のプレイヤーで再生される）。
- エミュレーターで Twitch の映像が再生できるか（報告例なし、推測の段階）。
- エミュレーター（`Medium_Phone`、Google APIs x86_64 API 35）では、パッチを当てていない 31.3.1 でもログインできない（2026-09-27 に確認）。「This app version/OS is not currently supported」と表示される。
  - 文言はアプリにも React Native のバンドルにもなく、passport（`/protected_login`）の応答をそのまま表示している。ログイン画面は React Native で、passport への要求は Kasada（ボット対策）で保護されている。
  - このイメージの `com.android.vending` は本物の Play ストアではなくスタブ（LicenseChecker）なので、Play Integrity は使えない。ビルドは `userdebug` / `dev-keys`。
  - Google Play 付きのイメージ（AVD `Play_phone`、API 35、`user` / `release-keys`、本物の Play ストア入り）でも、パッチ済み・パッチなしのどちらも同じエラーでログインできなかった。Play Integrity の有無ではなく、エミュレーターであること自体が弾かれていると判断した。
  - 31.3.1 はログインしないと先へ進めないので、この環境ではログイン後の機能を何も確認できない。
- Fix login: 将来 Twitch がサーバー側で認証を必須にすると使えなくなる。
- 別アプリとしてのインストール（3 章）:
  - Morphe の汎用パッチ「Clone app」は、Twitch を「パッチとインストールはできるが起動時にクラッシュする」として対象外にしている。Clone app は既定では独自のパーミッションの名前を変えないので、Twitch（AndroidX）が実行時にパッケージ名から組み立てる `<パッケージ名>.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION` が宣言されておらず、クラッシュすると推測した。uyu ではこの名前も変え、実機で起動してログイン画面まで進むことを確認した（2026-09-27）。
  - パッケージ名が変わってもログインできるかは、ユーザーが実機で確認する。
  - 通知: Firebase Installations には元のパッケージ名と署名を送るが、FCM への登録（Google Play 開発者サービスは実際のパッケージ名で登録する）と配信が通るかは未確認。
  - Google Play の課金（サブスクやビッツの購入）と Amazon のアカウント連携（Prime）は、別パッケージでは動かない可能性がある。uyu では対応しない。
- プレイヤーの右上にボタンを差し込めるか（レイアウト次第）。31.3.1 では鎖の外に重ねて置いた（5 章）。実機で、ほかのボタンの左に出て、一緒に表示・非表示になることを確認した（2026-09-27）。
- Twitch がネイティブの視聴画面を廃止すると、自動取得・弾幕・広告ブロックが動かなくなる。31.3.1 では React Native 版が実験機能（Ultralight）の扱いで、ネイティブ版は実験がオフの利用者向けに残っている。
- 利用規約: 改造そのものが利用規約違反にあたる。広告ブロックや自動取得だけを理由にした BAN の報告は見つかっていないが、リスクがゼロではない。

---

## 付録 A. 実装の手がかり（調査メモ）

特記がない限り、hooman の Twitch 30.7.2 向け実装、または ReVanced の旧バージョン向け実装から得た情報。31.3.1 では必ず再確認すること。

### A.1 Fix login
- 文字列 `play_integrity_setup_begin` を含むクラスに、StandardIntegrity トークンを要求して `/api/v1/android/attestation` に POST する suspend 関数がある。
- その関数の先頭に `const/4 v0, 0x0` と `return-object v0` を挿入して処理を無効にする（Google Play のない端末と同じ扱いになり、ログインが通る）。
- これがないと「This app version/OS is not currently supported」と表示されてログインできない（hooman discussion #190）。
- 31.3.1 でもこの方法のまま当たる（2026-09-27 に確認）。

### A.2 Fix notifications
- Firebase Installations の接続を作る処理を、文字列 `X-Android-Cert` と `x-goog-api-key`、シグネチャ `(URL, String) -> HttpURLConnection` で特定する。
- ヘッダーの値を Twitch の元の署名の SHA-1 `8C68C13822723A2B1FA844BED340031BEB1F9463` に書き換える。
- これがないと `API_KEY_ANDROID_APP_BLOCKED` になり、プッシュ通知の登録に失敗する（hooman issue #226）。
- 31.3.1 でもこの方法のまま当たる（2026-09-27 に確認）。
- 別アプリとしてのインストール（3 章）に合わせ、同じ処理の `X-Android-Package`（`context.getPackageName()` の値）も `tv.twitch.android.app` に書き換える（2026-09-27）。API キーはパッケージ名と署名の組で制限されているため。どちらも、ヘッダーの名前の文字列の後にある最初の `addRequestProperty` の値のレジスタを、呼び出しの直前で定数に置き換える。

### A.3 自動取得

**31.3.1 での実装（段階 1）**
- データプロバイダ: `ld9` インターフェース（受け取り処理 `G(String claimId, ChatModeMetadata)`）の実装は 3 つある。そのうち、最新の `CommunityPointsModel` を可変フィールド（`d`）に持つ `pd9` が本体で、残り 2 つは `pd9` に委譲するだけ。
- `pd9` はコンストラクタで更新の購読を始め、ラムダ（`md9` の一部のケース）で `pd9.d = model` と保存する。この購読は `pd9` がある間ずっと続き、UI の状態に左右されない。
- `CommunityPointsModel`（難読化されない）の `getClaim()` が受け取れるボーナス（`ActiveClaimModel`、toString は `ActiveClaimModel(id=`）を返す。id はその唯一の String フィールド。
- パッチは `pd9` に静的メソッド `uyuAutoClaim(provider, model)` を追加し、`pd9.d` への代入の直後から呼ぶ。ボーナスがあり、拡張コードの `shouldClaim(id)` が true なら `G(id, null)` を呼ぶ。第 2 引数の null は、成功時の分析イベントで null として扱われる。
- ボタン側の `CommunityPointsButtonStateProvider`（31.3.1 では `da9`、文字列 `CommunityPointsButtonStateProvider$State` で特定できる）の `D2(state)` は hooman の方式のフック先だが、呼び出し元がチャットのプレゼンターの `DisposeOn.INACTIVE` の購読なので、チャットが非アクティブな間は動かない。
- 拡張コードは、更新のたびに残高とボーナスの有無が変わったらログ（タグ `uyu`）に出す。`adb logcat -s uyu` で確認できる。
- 実機で、ネイティブの視聴画面を開いた直後と、横画面のフルスクリーンで公式チャットを「オフ」にした状態の両方で、ボーナスを受け取り、残高が 50 増えることを確認した（2026-09-27）。React Native の視聴画面では、この `pd9` の購読が一度も動かなかった（A.10）。

**以前のバージョンの情報**
- 30.7.2: 文字列 `CommunityPointsButtonStateProvider$State` でクラスを特定する。状態を更新するメソッド（30.7.2 では `V2(state)`）の先頭で、`state` の activeClaim が null でなければ data provider の受け取りメソッド（`H(claimId, ChatModeMetadata)`、第 2 引数は null）を呼ぶ。
- 旧方式（ReVanced、〜25.3.0）: `CommunityPointsButtonViewDelegate.showClaimAvailable` の最後で `buttonLayout.callOnClick()` を呼ぶ。
- 参考: GQL の `ClaimCommunityPoints`（persisted query の sha256 `46aaeebe02c99afdf4fc97c7c0cba964124bf6b0af229395f1f6d1feed05b3d0`、`{"input":{"claimID","channelID"}}`）。今回の方式では使わない。

### A.4 設定画面の差し込み

**31.3.1 での実装（段階 1）**
- プロフィールの歯車は `tv.twitch.android.settings.SettingsActivity` を開き、`fragment_container` に `tv.twitch.android.settings.main.MainSettingsFragmentV2` を表示する。どちらも難読化されない。画面は Jetpack Compose（`onCreateView` が ComposeView を 1 つ返す）なので、一覧の中には差し込めない。
- パッチは `MainSettingsFragmentV2.onCreateView` の戻り値を拡張コードに渡し、縦の LinearLayout で包んで先頭に「uyu」の行を置く。行は `settings_menu_item`（`icon`、`menu_item_title`）、アイコンは `ic_settings`。
- `SettingsActivity` は `launchMode="singleTop"` なので、設定画面から同じ Activity を開き直しても新しい画面にならない（`onNewIntent` に届く）。そこで、uyu の設定画面（プラットフォームの `android.app.Fragment` の PreferenceFragment）を同じ Activity の `fragment_container` に add し、プラットフォームの back stack に積む。ツールバーの戻る矢印は `onBackPressed()` を呼ぶだけなので、戻る操作で閉じる。背景は Twitch の `background_body` で塗り、下の画面に触れないようにしている。
- `SettingsActivity` は `configChanges` で回転を自分で処理するので、画面の作り直しは起きにくい。作り直されても、プラットフォームの FragmentManager がフラグメントを復元する。
- AndroidX の `Toolbar` などのメソッドは難読化されている場合があるので（`setSupportActionBar` は `z` になっている）、拡張コードからはプラットフォームの API だけを使う。ツールバーのタイトルは子の TextView を書き換え、閉じるときに元に戻す。
- 設定メニューの ViewDelegate（`SettingsMenuViewDelegate`、31.3.1 では `hbz`。`SettingsMenuItem.toInfoMenuViewDelegate` で行を作る）もあるが、プロフィールの歯車からは使われていなかった。

**ReVanced の方式（16.9.1）**
1. `SettingsMenuItem` の enum に定数を追加する（`(String, int, int, int)` コンストラクタ、タイトルのリソース、アイコン `ic_settings`）。
2. `SettingsMenuPresenter$Event$MenuGroupsUpdated.<init>` で、最後の `SettingsMenuGroup` に項目を追加する。
3. `SettingsMenuViewDelegate` の render 系メソッドで、追加した項目のクリックを検知し、extra を付けて `SettingsActivity` を起動し、`SettingsMenuViewDelegate$Event$OnDismissClicked` を送る。
4. `SettingsActivity.onCreate` で `fragment_container` を独自の PreferenceFragment（`android.preference` ベース）に置き換える。

31.x ではクラス名が難読化されているため、文字列やシグネチャで探し直す。

### A.5 チャット（弾幕の取得元）

**31.3.1 での実装（段階 2）**
- 31.3.1 のチャットは Kotlin で書かれた IRC クライアントで、`PRIVMSG` を解析して `ChatMessageInfo`（toString は `ChatMessageInfo(userInfo=`）を作る。本文は `tokens` のリストで、要素は次のトークンのいずれか。どれも toString で見分けられ、共通の親クラスを持つ。
  - `TextToken(text=`、`EmoteToken(text=, id=`、`MentionToken(text=`、`UrlToken(url=`、`BitsToken(prefix=, numBits=`、`GifToken(text=`
  - 同じ toString の文字列は、表示層の別のトークン（`MessageToken$*` など）にもある。`EmoteToken(text=` だけが一意なので、その親クラスを基準にほかのトークンを探す。
- 1 件のメッセージは `ChatLiveMessage(messageId=, messageInfo=)`。受信したまとまりは `ChatChannelMessagesReceived` から `ChannelMessagesReceived(channelId=` に形を変えて EventDispatcher を通る。チャット接続の管理クラス（文字列 `onChannelEventReceived` を持つ）がそれを受け取り、`MessagesReceivedEvent(channelId=, messages=, fromHistory=)` を作って流す。この購読は管理クラスがある間ずっと続き、チャットの画面の状態に左右されない。
  - 管理クラスは、チャンネルに入り直したときに、保存している直近 100 件を `fromHistory=false` のまま送り直す。
  - 接続前の履歴は `fromHistory=true` で作られる。
  - `USERNOTICE`（サブスク、レイドなど）は別のイベントになり、このイベントには入らない。
  - 自分の発言は、送信時に IRC 形式の行を作って同じ解析処理に通し、ローカルに表示している。サーバーからのエコーは `client-nonce` で除かれる（弾幕に出るかは実機で確認する）。
- パッチは `MessagesReceivedEvent` の `<init>(String, List, boolean)` の先頭から、拡張コードの `onMessagesReceived` を呼ぶ。拡張コードの `ChatMessages` にあるスタブの中身を、見つけたクラスとフィールドを読むコードに置き換える。フィールドは toString が読む順番で特定する。

**以前のバージョンの情報**
- 難読化されないクラス:
  - `tv.twitch.android.shared.chat.pub.messages.data.ChannelChatConnectionKey(String, String)`（コンストラクタで配信者 ID を受け取る）
  - `…pub.messages.data.MessageToken$TextToken` / `$EmoticonToken` / `$GifToken`
- `MessageRecyclerItem` は、toString の文字列 `"MessageRecyclerItem(messageId="` と `", sourceChannelId="` で特定できる（表示層）。
- 旧バージョンのデータ層（PurpleTV / bttv-android、2025 年）:
  - `tv.twitch.chat.library.IrcEventParser`
  - `tv.twitch.android.shared.chat.observables.ChatConnectionController` の `PublishSubject<MessagesReceivedEvent> messagesSubject`
  - `ChatMessageV2Parser` が `ChatMessage$LiveChatMessage`（`ChatMessageUser`、`MessageTokenV2$EmoteToken`）を組み立てる
- 代替手段の匿名 IRC:
  - `wss://irc-ws.chat.twitch.tv:443` に接続し、`CAP REQ :twitch.tv/tags twitch.tv/commands` を送ってから `NICK justinfan<4桁>` でログインする（Xtra が 2026 年 9 月時点で使用中。公式には保証されていない）。
  - タグ `emotes=<id>:<start>-<end>` の位置の単位（コードポイントか UTF-16 か）は情報が割れているので、絵文字を含むメッセージで検証する。
  - エモート画像は `https://static-cdn.jtvnw.net/emoticons/v2/<id>/default/dark/1.0` など。

### A.6 プレイヤーと配信の仕組み
- ライブの m3u8 はネイティブの Amazon IVS メディアソースが解析して ExoPlayer に渡すため、プレイリストの本文を書き換える Java 側の入口はない。
- 埋め込み広告は `#EXT-X-DATERANGE ... CLASS="twitch-stitched-ad"` と `X-TV-TWITCH-AD-*` 属性（`ROLL-TYPE=PREROLL/MIDROLL` など）で示される。広告セグメントの `#EXTINF` のタイトルは `,live` 以外になる。
- 30.2.2 では、プレイヤーコア（`tv/twitch/android/shared/player/core/b` の onMetadata）が `"twitch-stitched-ad".equals(...)` で広告を判定している。ここを「黒画面・ミュート・残り秒数表示」のきっかけにも使える見込み。

### A.7 広告ブロック

31.3.1 での実装は A.14。以下は実装前の調査メモ（主に 30.x の情報）。

- **プロキシへの書き換え（hooman）**
  - 文字列 `usher.ttvnw.net` と `fast_bread` を含むクラスの `invoke(Object, Object)Object`（usher の URL を組み立てる lambda）を置き換える。
  - 置き換え後の URL は `proxyUrl + チャンネル名 + "?allow_source=true&allow_audio_only=true&fast_bread=true&type=any&player=twitchweb"`。
  - hooman の実装には、失敗したときの戻り先がない。
- **embed への切り替え（ajstrick81、30.2.2 で実機確認済み）**
  - `PlaybackAccessTokenParams` のコンストラクタ（フィールド: `disableHTTPS`、`hasAdblock`、`playerBackend`、`playerType`、`maid`）で `playerType="embed"` を強制する。
  - あわせて、GrandDads の応答を AdContextUnavailable に固定し、stitched-ad の判定を false にする。
  - 結果: 途中の広告は消えたが、約 15 秒の再生前広告が残った。
- **表示広告**
  - 文字列 `"failed to parse display ad response: "` と `"could not parse content type: "` を含むパーサーのメソッドが、NoAd シングルトンを返すようにする。
- **クライアント側の広告（ReVanced、難読化前の名前。31.x で探すときのキーワードとして使う）**
  - `AdsManagerImpl.playAds`（Amazon の広告 SDK）
  - `VideoAdManager.requestAd*`
  - `AdsPlayerPresenter.requestMidroll`
  - `AdsVodPlayerPresenter`
  - `AdEdgeAllocationPresenter`
  - `AdEligibilityFetcher.shouldRequestAd`（`Single.just(false)` を返す）
  - `StreamDisplayAdsPresenter.getReadyToShowAdOrAbort`（`AdFormatDeclined` を返す）
  - `ContentConfigData.getShowAds`（false を返す）
  - `AudioAdsPlayerPresenter.playAd`（何もしないようにする）
  - 関連する文字列: `ClientVideoAdPlayer`、`edge.ads.twitch.tv/2018-01-01/ads`、`vod-ads`、`AudioAd`、`AudioAdsPod`、`DisplayAdContainer`
- **プロキシの稼働状況（2026-09-26 の調査時点）**
  - 応答あり: `eu.luminous.dev` / `eu2.luminous.dev` / `as.luminous.dev` / `lb-as.cdn-perfprod.com`
  - 停止または制限: `lb-eu` / `lb-na` / `lb-sa`、ttv.lol、jupter.ga
  - プロキシを通るのはマスタープレイリストだけで、映像のセグメントは Twitch の CDN から直接取得される。
  - プロキシはトークンを自前で取得するため、サブスクや Turbo の特典は失われる。

### A.8 Morphe の仕様
- パッチの DSL:
  - `bytecodePatch(name, description, default) { compatibleWith(Compatibility(...)); dependsOn(...); extendWith("extensions/<n>.mpe"); execute { } }`
  - name を付けないパッチは利用者に表示されない内部パッチになる。
- フィンガープリント: `object X : Fingerprint(definingClass, name, accessFlags, returnType, parameters, filters, strings, custom)`。フィルタには `fieldAccess`、`string`、`methodCall`、`opcode`、`literal` がある。古い `fingerprint { }` の DSL は非推奨。
  - `strings` は部分一致（命令の文字列が指定した文字列を含めば一致）。`accessFlags` は完全一致。
  - 最初に一致したメソッドを返し、一意かどうかは確かめない。条件は一意になるまで絞る。
- 命令の挿入: `addInstructions(index, …)` は、`index` の命令に付いた分岐先のラベルを移さない。分岐先に挿入すると、分岐してきた経路は挿入したコードを飛ばす。分岐先に入れるときは `util/BytecodeUtils.kt` の `addInstructionsAtControlFlowLabel` を使う。
- 拡張コード: Android アプリケーションモジュールとして作る（Gradle プラグインの既定は compileSdk 36、minSdk 23、Java 17、R8 有効）。`extensions/<名前>/build.gradle.kts` を置けば自動で取り込まれ、`.mpe` として APK に統合される。
  - 拡張は、`extendWith` したパッチの execute の前に統合される。uyu では内部パッチ `sharedExtensionPatch` だけが `extendWith` し、他のパッチはそれに依存する。
  - パッチから中身を書き換えるメソッド（`PatchStatus` など）が R8 に畳み込まれないよう、`extensions/proguard-rules.pro` で最適化と名前の変更を止めている。
  - 同じ名前のクラスが既にあると、先に統合された方が勝ち、後から来たメソッドの中身は警告なしに捨てられる。
  - パッチはパッチ名の順（依存するパッチが先）に実行される。
- `finalize { }` はすべてのパッチの `execute` の後に実行される。`availability { installer, arch -> PatchAvailability }` で、インストール方法（`STANDARD` / `MOUNT` / `SHIZUKU`）ごとに選べるかを決められる（morphe-patcher 1.14.1 で確認）。
- リソースパッチでマニフェストの `package` を変えると、パッチャーがリソーステーブルのパッケージ名も同じ名前に変える（`PackageRenamingProcessor`）。そのため、`getIdentifier(名前, 型, context.getPackageName())` でリソースを探すコード（Twitch 自身、React Native、拡張コードの `Utils.getResourceId`）は、パッケージ名を変えてもそのまま動く。
- `Compatibility(name, packageName, apkFileType, appIconColor, targets = listOf(AppTarget(version, versionCodes, isExperimental)))`。hooman は `apkFileType = null`（分割 APK も警告なしで受け付ける）。
- Morphe Manager:
  - 複数のソースのパッチを 1 回で当てるには、エキスパートモードで互換性の警告を承認する必要がある（シンプルモードではソースを 1 つ選ぶ）。
  - ディープリンク: `https://morphe.software/add-source?github=bakwudo/uyu&name=uyu`
- Morphe Desktop: `-p/--patches` を繰り返し指定できる。既定ではすべての ABI を残す（削るのは `--striplibs` を付けたとき）。`-i/--install` で adb 経由のインストールもできる。
- ReVanced から移植するときの注意:
  - `app.revanced.patcher` を `app.morphe.patcher` に置き換える。
  - ファイル形式は `.rve` → `.mpe`、`.rvp` → `.mpp`。
  - ReVanced の Patcher v22 以降の書き方（`apply {}` など）は Morphe にないので、それより前のリビジョンを参考にする。

### A.9 エミュレーター
- Windows 11 Home で Hyper-V / VBS / WSL2 が動いている環境では WHPX（Windows ハイパーバイザー プラットフォーム）が必須。AEHD は 2026-12-31 でサポートが終わり、WSL2 と共存できない。
- 有効にしたら `emulator -accel-check` で確認する。
- Twitch 30.7.2 は arm64-v8a / armeabi-v7a / x86 / x86_64 を含むユニバーサルな分割 APK だった。
- 31.3.1 は APKMirror に 3 つのバリアントがあり、いずれも BUNDLE で versionCode 3103016（2026-09-27 に確認）。
  - arm64-v8a + x86 + x86_64（Android 8.0 以上、480dpi）: エミュレーターでのテストに使う
  - arm64-v8a + armeabi-v7a（Android 9.0 以上、480〜640dpi）
  - arm64-v8a（Android 10 以上、480〜640dpi）
- arm64-v8a だけのバリアントも x86_64 イメージの ARM 変換で動く可能性はあるが、遅く、ネイティブの再生処理での実績がないので避ける。
- バリアントはどれも versionCode が同じなので、`Compatibility` に `versionCodes` を書く必要はない。

### A.10 視聴画面の振り分け（31.3.1）
- `tv.twitch.android.feature.discovery.feed.rn.theatre.RNTheatreRouteDecisionKt.rnTheatreRouteDecision(...)` が、配信を React Native の視聴画面（`TwitchRNTheatreFragment`）で開くかを決める。`Route` 以外（`RefuseUltralightOff` など）を返すと、ネイティブの視聴画面が使われる。クラス名もメソッド名も難読化されない。
  - ネイティブのランチャー（`TwitchRNTheatreLauncher.launchIfEnabled`）と、React Native のフィード（`TwitchRNHostNavigationModule.openChannelInternal`。`Route` 以外なら `handOffFeedTapToNativeTheatre` でネイティブに渡す）の両方がこれを呼ぶ。
  - 条件は、ライブであること、チャンネル名があること、Fragment のホストがあること、縦長配信の実験、DRM の実験、そして実験機能 Ultralight（`bg50.c()`）がオンであること。VOD は常にネイティブ。
- Native theatre パッチは、このメソッドの先頭で `RefuseUltralightOff` を返す。
- React Native の視聴画面の中身（記録のため）:
  - 画面は `ReactSurfaceView`。props に `tv.twitch.android.rn.theatre.*`（`classicStageRequested` など）が渡される。
  - JS は PubSub を Hermes（`wss://hermes.twitch.tv/v1`）で受け取り（`community-points-user-v1`、`claim-available`）、GQL の `ClaimCommunityPoints` で受け取る。チャットは `wss://irc-ws.chat.twitch.tv`。
  - WebSocket の受信は Java 側の `com.facebook.react.modules.websocket.WebSocketModule` のリスナー（31.3.1 では `hb90.q(WebSocket, String)`、文字列 `websocketMessage`）を通る。React Native 版に対応するなら、ここが手がかりになる。
  - 専用のネイティブモジュールは `TwitchRNIntegrity`（GQL 用の Client-Integrity トークンを JS に渡す）など。PubSub や GQL の専用モジュールはない。

### A.11 ネイティブの視聴画面のプレイヤー（31.3.1、弾幕）
- ライブの視聴画面の View は、ViewDelegate のコンストラクタが組み立てる。このクラスは `RxViewDelegate` を継承した難読化クラスで、Kotlin のプロパティ情報の文字列 `getPlayerModeAnimationsControlObserver()` で特定できる。ルートは `theatre_coordinator` の ConstraintLayout（`BaseViewDelegate` の View フィールド）。
  - `player_pane`（FrameLayout）に `player_view_delegate`（FrameLayout）を入れる。中身は順に `playback_view_container`（動画）、`error_frame`、`overlay_frame`、`ad_container`、`cc_tv`。動画の枠は縦横比に合わせた大きさで中央に置かれ、切り抜くときはプレイヤーより大きくなる。
  - 操作ボタンは `player_control_overlay`（ConstraintLayout）で、`player_overlay_container`（FrameLayout）に入る。右上のボタンは、右から `audio_and_subtitles`（常に非表示）、`settings_button`、`share_button`、`cast_button`、`create_clip_text_button`、`info`（常に非表示）と `End_toStartOf` でつながる鎖。
  - 操作ボタンを隠すときは、上のボタンを 1 つずつ GONE にする。表示するときは `back_button` を必ず VISIBLE にする。直前に 300 ms の遅延トランジションを始めるので、同じフレームで表示を変えればフェードがそろう。
  - 横画面で公式チャットを横並びにすると、`player_pane` の右端がガイドライン（0.7 など）になり、動画も操作ボタンの入れ物も縮む。
  - この ViewDelegate はライブの視聴画面だけが使う。VOD やクリップは別の画面。
- 画面の向きは `Configuration.orientation` をそのまま使っている。スマホでは横画面がフルスクリーン。視聴画面の Activity（`ViewerLandingActivity`）は回転で作り直されない。
  - 操作ボタンのレイアウト（`player_control_overlay`）は向きで分かれておらず、縦画面でも右上のボタンと戻るボタンの出し方は横画面と同じ。
- ミニプレイヤー: 視聴画面は `TheatreModeFragment` が作る `theatre_container_layout` の中にあり、`draggable_container`（`ConstraintTheatreContainerView`）> `draggable_layout` > `video_presenter_container` の順に入る。ミニプレイヤーにするときは `draggable_layout` の LayoutParams の幅と高さを小窓の大きさにし、元に戻すときは MATCH_PARENT にする（小窓はピンチで大きさを変えられる）。小窓では操作ボタンの代わりに `minimized_overlay` が出る。
  - 拡張コードは、プレイヤーの祖先の `draggable_layout` の幅が MATCH_PARENT でなければミニプレイヤーとみなす。
- 弾幕を流すかは、ピクチャーインピクチャー（`Activity.isInPictureInPictureMode()`）、ミニプレイヤー、画面の向きの順に調べて決める。どれもプレイヤーの大きさが変わるので、レイアウトの変化のたびに調べ直す。
- 再生状態: プレイヤーのプレゼンターは、文字列 `getPlayerStateAndEventDisposable()` で特定できる抽象クラス。プレイヤーの状態が変わるたびに、表示用の状態を更新するメソッド（文字列 `widevine` を持つ）を呼ぶ。
  - プレイヤーは、`getState()` を持つインターフェース型のフィールドにある。
  - 状態は enum（`STOPPED`、`PAUSED`、`PLAYING`、`PREPARING` など。名前は難読化されない）。
- パッチ:
  - ViewDelegate のコンストラクタの最後で `onTheatreCreated(this)` を呼ぶ。拡張コードは `player_view_delegate` の 2 番目に弾幕の View を、`player_overlay_container` にボタンを足す。
  - 再生状態を更新するメソッドの先頭で、追加した静的メソッドから `onPlayerStateChanged(プレイヤーの ViewDelegate, 状態)` を呼ぶ。拡張コードは、その ViewDelegate の View の中に自分の弾幕の View があるときだけ、一時停止を反映する（広告など別のプレイヤーは無視する）。
- 横画面のチャットの表示方法（`Hidden` / `Column` / `OneChat` の enum。名前は難読化されない）:
  - 値は文字列で `pref_landscape_chat_mode` に保存される。Twitch の設定クラス（コンストラクタが `Application` を受け取り、この文字列を持つ）が、直接読む処理と、変更を通知する Flowable の両方で、親クラスの文字列を読むメソッド `(String, String) -> String` を通す。
  - パッチは親クラスの文字列を読むメソッド（`SharedPreferences.getString` を呼ぶもの）をすべて包み、先に拡張コードの `overridePreference(key)` を呼ぶ。元のメソッドは空きレジスタがないので、`uyuOriginal_<名前>` に移してから呼ぶ。
- 視聴画面のチャットの状態は ViewModel（toString は `TheatreChatViewModel(landscapeChatModePreference=`）にある。表示方法（enum）と、チャットを横並びで開くフラグ（`isChatOverlayVisible`、`isForcingColumnChatForOneChatMessageInput`、`isChatTrayVisible`、`isCommunityHighlightExpanded`、`isExtensionsVisible`）を持ち、コンストラクタがフラグをまとめたフィールドを作る。実際の表示方法は「まとめたフラグが立っていれば Column、そうでなければ表示方法の値」。
  - パッチはコンストラクタの最後で、拡張コードの `isLandscapeChatHidden()` が true なら、表示方法を `Hidden` に、フラグとまとめたフィールドを false にする。フラグは名前ではなく、まとめたフィールドを計算するときにコンストラクタが調べる引数として特定する。
  - 視聴画面の状態遷移は、横画面にしたときに表示方法が `Hidden` で、設定 `pref_onechat_education_dialog_shown` が false なら、`OneChat` に切り替えて保存し、紹介（`ShowOneChatCallout`）を出す。パッチは真偽値の設定を読む処理も包み、拡張コードの `overrideBooleanPreference(key, value)` を通す。
- 「チャット」ボタンは下部の操作ボタン（`bottom_player_overlay_controls` の `chat_mode_button`）にある。その ViewDelegate の描画メソッドは、状態クラス（toString に `, nextLandscapeChatMode=` を持つ）を受け取り、ボタンの表示を決める。描画メソッドの最後で `onBottomControlsRendered(this)` を呼び、拡張コードがボタンを GONE にする。
  - 描画メソッドは、基底クラスから呼ばれるブリッジメソッド（引数は `ViewDelegateState`）と、別のクラスからの直接の呼び出しの両方で呼ばれる。最初はブリッジメソッドにフックしたが、直接の呼び出しで描画されたときにボタンが消えなかった（2026-09-27）。
  - 描画メソッドは `this` を最初に別のレジスタへ移すだけで、p0 を書き換えない。パッチは p0 が書き換えられないことを確かめてから使う（書き換えられていればパッチを失敗させる）。
- 注意: AndroidX の ConstraintLayout のクラス（LayoutParams、ConstraintSet、Group など）は難読化されているので、拡張コードからは使えない。

### A.12 別アプリとしてのインストール（31.3.1）
- リソースパッチの `finalize` でマニフェストを書き換える。ほかのパッチがマニフェストの元のパッケージ名を読めるように、最後に行う。
  - `manifest` の `package` を `io.github.bakwudo.uyu` にする。
  - 名前の一部（`.` で区切られた部分）が `tv.twitch.android.app` のものを、新しいパッケージ名に置き換える。対象は、`permission` / `uses-permission` の名前、`provider` の authority、スキーム `amzn` の `data` の host。
    - パーミッション: `tv.twitch.android.app.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION`。AndroidX の `ContextCompat.registerReceiver` が `<パッケージ名>.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION` を組み立てて使う。
    - authority: `firebaseinitprovider`、`provider`（FileProvider）、`androidx-startup`、`fileprovider`（React Native の WebView）、Sentry の 3 つ、`backgrounddetector`（IVS）、`com.amazon.identity.auth.device.MapInfoProvider.<パッケージ名>`（Amazon MAP）。コードはどれも `getPackageName()` から名前を組み立てている（jadx で確認）。
    - `amzn://tv.twitch.android.app`: Login with Amazon のリダイレクト先。
  - `@string/app_name` を指す `android:label`（`application`、`ViewerLandingActivity`、`GameBroadcastService`）を文字列「uyu」にする。リソースの `app_name` は変えないので、アプリの中の文言は変わらない。
- コードに埋め込まれた `"tv.twitch.android.app"` は、広告の要求と分析のアプリ ID としてだけ使われている（`requestAd` など）。書き換えない。
- `res/xml` など、ほかのリソースには元のパッケージ名がない（`res/raw` の広告のサンプルだけ）。
- ショートカット、アカウント（AccountManager の認証サービス）、同期アダプターの宣言はない。

### A.13 表示の整理（31.3.1）
- 隠す View は、リソース名で探す。難読化されたコードより、リソース名の方がバージョンをまたいで変わりにくい。
  | リソース名 | 場所 |
  |---|---|
  | `chat_header_buttons_container` | チャットの上の段（`chat_header`）の ComposeView。ビッツ、サブスクを贈る、サブスクライブのボタン |
  | `chat_header_container` | `chat_view_delegate` で上の段を入れる FrameLayout |
  | `bit_picker` | チャットの入力欄のビッツのボタン |
  | `leaderboards_container`、`leaderboards_icon` | ランキング（`chat_view_delegate`）と、上の段にあるランキングを開くボタン |
  | `promo_banner_container` | 視聴画面（`theatre_coordinator`）の上端の ComposeView。中身は `PromoBannerContent`（種類は `TARGETED_CHANNEL_SUB`、`TARGETED_GIFT_DISCOUNT`、`CREATOR_LED`、`SITEWIDE_GIFT`、`SUBTEMBER_GIFT_MATCH`、`SUBTEMBER_SUB`）と、キャンペーン（`Visible(campaign=`） |
  | `turbo_upsell_container` | 視聴画面の Turbo の宣伝（「Twitch 全体で広告なしで視聴」） |
- ボタンだけを隠すと、Twitch はボタンがあるものとして上の段を表示し続けるので、空の段が残る。そこで uyu は、ボタンを隠す設定がオンで、段のほかの項目（`chat_name`、`leaderboards_icon`、`extension_button_container`）がどれも表示されていなければ、`chat_header_container` を隠す。Twitch はこの入れ物の表示を変えないので、条件が変われば uyu が表示に戻す。
- パッチは `BaseViewDelegate` の `(Context, View)` コンストラクタの最後で、拡張コードの `onViewCreated(View)` を呼ぶ。Twitch のネイティブの画面の部品（視聴画面、チャット、入力欄など）はどれも ViewDelegate で、ルートの View がここを通る。クラス名は難読化されない。
- 拡張コードは、ルートの下から対象の View を探し、描画の直前（`ViewTreeObserver.OnPreDrawListener`）に毎回、表示されていれば GONE にする。Twitch はそれぞれの View の表示をいろいろな場所から変えるので、それらにフックする代わりにこうする。表示を変えたフレームは描画を取りやめる（`onPreDraw` で false を返す）ので、一瞬表示されることもない。リスナーは View がウィンドウにつながっている間だけ登録する。
- 設定をオフにしても、隠した View を uyu からは表示に戻さない（上の段を除く）。Twitch が次に表示を更新したとき、または配信を開き直したときに表示される。
- チャットの上のハイライト（コミュニティハイライト）は、予想、ハイプトレイン、ピン留めのメッセージなどと同じ View（`community_highlight_container`）に出るので、View ごとは隠せない。宣伝のハイライトだけを、追加される前に取り除く。
  - ハイライトの種類は、共通の親クラス（文字列の ID と真偽値を持つ）を継承したシングルトン。SUBtember は ID `subtember`（タイトル「SUBtemberを満喫しましょう！」）、サブスクギフトの割引は ID `gift_promotion`（「サブスクギフトバンドルが大幅割引！」）。
  - ハイライトの追加・削除・展開・折りたたみのイベントは、どれもハイライトのプレゼンター（`CommunityHighlightPresenter`。Kotlin のメソッドのシグネチャの文字列 `CommunityHighlightPresenter$UpdateEvent` で特定できる）の、イベントの親クラスを受け取るメソッドを通る。ハイライトを表示に追加する状態の更新（toString が `AddHighlight(model=`）を作るのはこのメソッドだけ。
  - パッチはこのメソッドの先頭で、拡張コードの `hideCommunityHighlight(event)` を呼び、true なら何もせずに戻る。拡張コードは、追加のイベント（toString が `AddCommunityHighlight(model=`）なら、ハイライト → 種類 → ID の順にフィールドを読み（パッチがスタブ `highlightType` の中身を置き換える）、宣伝の ID で設定がオンなら true を返す。取り除いたときはログ（タグ `uyu`）に `Hid community highlight <ID>` と出す。
  - 種類の親クラスは、`<clinit>` に文字列 `subtember` を持ち、自分の型の静的フィールドを持つクラス（SUBtember の種類）の親クラスとして特定する。

### A.14 広告ブロック（31.3.1）
- 調べた範囲では、`okhttp3` などネットワークの層は難読化されていて、広告サーバーへの要求をまとめて止める入口はない（React Native の `NetworkingModule` を除く）。そこで、次の場所に個別にフックする。フィンガープリントは `ads/Fingerprints.kt`。
- アクセストークン: `PlaybackAccessTokenParams`（toString が `PlaybackAccessTokenParams(device=`）のコンストラクタで、唯一の String の引数（playerType。`mobile_player` や `android_pip`）を拡張コードの `overridePlayerType` の戻り値にする。ライブ（`StreamAccessTokenQuery`）と VOD（`VodAccessTokenQuery`）の両方がこのクラスを使う。
- プレイヤーのイベント: 2 つのプレイヤー（Amazon IVS の `MediaPlayer` を使うものと ExoPlayer を使うもの）は、プレイリストの `#EXT-X-DATERANGE` を読んで、次のイベントを作る。どれも共通の親クラス（プレイヤーのイベントの基底クラス）を持ち、toString で見分けられる。
  | toString | 元の CLASS など | uyu の扱い |
  |---|---|---|
  | `OnSurestreamAdStarted(adMetadata=` | `twitch-stitched-ad` | 止めて、黒い画面を出す |
  | `OnSurestreamAdQuartile(` | `twitch-ad-quartile` | 止める |
  | `OnSurestreamAdEnded` | `X-TV-TWITCH-STREAM-SOURCE="live"` | そのまま送り、黒い画面を終える |
  | `OnMultiformatAdRequested(` | `twitch-maf-ad`（配信が求めるクライアント側の広告。表示広告、動画広告、音声広告） | 止める |
  | `OnPbypPreflightMessage(` | `pbyp-preflight` | 止める |
  - 広告のメタデータ（toString が `SureStreamAdMetadata(duration=`）は、toString が読む順に、広告の長さ、広告の区切り全体の長さ（どちらも秒の float）を持つ。
  - イベントの基底クラスだけを引数に取るインスタンスメソッドは、2 つのプレイヤーそれぞれのイベントの送出（EventDispatcher に渡す）だけ。パッチはすべてのクラスからこの形のメソッドを探し、先頭で追加した静的メソッド `uyuOnPlayerEvent` を呼び、true なら送らずに戻る。追加したメソッドは、プレイヤーが描画する View（`getView()` を持つインターフェースのフィールド）を拡張コードに渡す。拡張コードはその祖先の `player_view_delegate` に黒い画面を置く。
  - 消音: プレイヤーのプレゼンター（文字列 `getPlayerStateAndEventDisposable()`、A.11）の `setMuted(Z)` は、プレイヤーのインターフェースの消音のメソッドと解除のメソッドを呼ぶ。パッチはこの 2 つの呼び出しを読み、拡張コードの `PlayerEvents.setMuted` の中身にする。IVS のプレイヤーでは `MediaPlayer.setVolume(0)` になる。
- クライアント側の動画広告:
  - 再生前、途中、VOD の途中の広告と、配信が求める動画広告は、どれも広告の要求をまとめるプレゼンター（文字列 `ad request already active`）を通る。コンストラクタの唯一の boolean の引数（Dagger の `shouldShowAds`。Twitch はクリップやダッシュボードの VOD で false を渡す）が false だと、状態が最初から「無効」になり、すべての要求を捨てる。パッチはこの引数を拡張コードの `overrideShowAds` の戻り値にする。
  - その後ろの広告判定（GrandDads の GQL、Turbo やサブスクの判定）の結果は、`Boolean` を受け取って広告を要求するメソッド（`EligibilityCheckCompleted(shouldRequestAd=` のイベントを作る）に届く。パッチは先頭で引数を `overrideShouldRequestAd` の戻り値（`Boolean.FALSE`）にする。
  - GrandDads の応答（`query GrandDads`）を AdContextUnavailable（31.3.1 では toString を持たないシングルトン）にすると、判定の処理は「No ad context」とログに出して `true`（広告を要求する）を返す。そのため、当初の予定（A.7）の方法は使わない。
  - PbyP: PbyP のプレゼンター（`processStateChange(Ltv/twitch/android/feature/pbyp/PbypPresenter$State;` の文字列）の、機能が有効かを返す `()Z` のメソッドを false にする。PubSub の `midroll_request` の購読と準備の処理が始まらない。
  - Amazon の広告 SDK（`AdsManagerImpl` など）は 31.3.1 にはない。広告の再生は Twitch 自身の処理。
- 表示広告:
  - 表示広告の応答のパーサー（文字列 `failed to parse display ad response: `）は、「広告なし」のシングルトン（戻り値の型の子クラスで、自分の型の静的フィールドを持つ）を返すようにする。視聴画面の横や下のバナー、配信が求める表示広告、ネイティブの一覧の広告がこれを通る。
  - ブラウズの上部の広告は、状態クラス（toString が `State(isTurbo=`）の `isTurbo` を true にする。
  - React Native のホームのフィードは、JS が `edge.ads.twitch.tv`（`/ads/feeds`、`/ads/format`、`/ads`）に要求する。`NetworkingModule.sendRequestInternalReal` の先頭で、このホストへの URL を `https://127.0.0.1:1/` に変え、接続の失敗にする。フィード内の動画広告は `TwitchRNVideoAdProvider.makePlayer` が null を返すようにする。どちらもクラス名とメソッド名は難読化されない。
- プロキシ:
  - usher の URL（`api/channel/hls/<チャンネル名>.m3u8` または `api/v2/channel/hls/…`）を作るメソッド（引数が `(String, AccessTokenResponse, …, boolean)`、戻り値が `Uri`）の戻り値を `overrideStreamUri` に通す。チャンネル名は URL の最後の部分から取る（引数のレジスタは戻る時点で上書きされているため）。
  - ライブのプレイリストは、IVS の `MediaPlayer.preload(Uri, Source.Listener)` で読み込まれる。パッチはアプリの中のこの呼び出しをすべて拡張コードの `preload` に置き換える。拡張コードは、プロキシの URL のときだけ、`Source.Listener` を `java.lang.reflect.Proxy` で包む。`onError` が来たら「Proxy failed」を出し、元の usher の URL と元のリスナーで読み込み直す。
- ログ（タグ `uyu`）: `Requesting the stream as the embed player instead of …`、`Video ads the app plays itself are off for this player`、`Blocked an ad request of the home feed`、`Ad blocked: <秒> s ad, <秒> s break`、`Ad break ended`、`Proxy failed: …` など。

## 付録 B. ニコニコの描画パラメータ（niconicomments の互換実装より）

- 流れるコメントの表示時間は約 4 秒（表示タイミングの 1 秒前に現れ、3 秒後に消える）。
- 速さは `(1530 + 0.95 × コメントの幅) / 4 秒`（基準は 1920×1080）。長いコメントほど速い。
- 表示領域は 512×384（16:9 では幅 683）を 1920×1080 に拡大したもの。
- HTML5 版のフォントサイズは small 18 / medium 27 / big 39。画面の高さにそれぞれ約 21 / 13.1 / 8.4 行入る。
- 縁取りは黒・幅 2.8px・不透明度 0.4（文字が黒のときは白）。
- 段の割り当ては上から空いている最初の段を選び、左右に 5px の余白をとって衝突を判定する。入る段がなければランダムな高さに重ねる。
- 上下の固定コメントは中央に 3 秒間表示する（今回は実装しない）。

## 付録 C. 参考リンク

- Morphe
  - https://github.com/MorpheApp/morphe-patches-template
  - https://github.com/MorpheApp/morphe-patcher/tree/main/docs
  - https://github.com/MorpheApp/morphe-patches
  - https://github.com/MorpheApp/morphe-manager/tree/main/docs
  - https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md
  - https://github.com/MorpheApp/morphe-documentation
- Twitch 向けの既存パッチ
  - https://github.com/arandomhooman/hoomans-morphe-patches （30.7.2）
  - https://github.com/Canic/twitch-morphe-patch （30.5.0）
  - https://gitlab.com/ReVanced/revanced-patches （`patches/.../twitch`、`extensions/twitch`。GitHub 版は DMCA により 451）
  - https://github.com/ajstrick81/morphe-androidtv-patches （`docs/twitch-ad-delivery-map.md`、`docs/TWITCH_AD_SUPPRESSION_BLUEPRINT.md`）
  - https://github.com/NyanArchive/PurpleTV
- 弾幕
  - https://github.com/david419kr/niconico-yt-morphe-patches
  - https://github.com/xpadev-net/niconicomments
  - https://github.com/wheatup/TwitchChatDanmaku
- Twitch クライアントと広告ブロック
  - https://github.com/crackededed/Xtra （IRC / Hermes / 広告の video swap）
  - https://github.com/pixeltris/TwitchAdSolutions （2026-03 にアーカイブ）
  - https://wiki.cdn-perfprod.com/v1/must-read/proxies
- Twitch 公式
  - https://dev.twitch.tv/docs/chat/irc
  - https://dev.twitch.tv/docs/chat/irc-migration/
  - https://legal.twitch.com/en/legal/terms-of-service/
- Android
  - https://developer.android.com/studio/run/emulator-acceleration
  - https://www.apkmirror.com/apk/twitch-interactive-inc/twitch/
