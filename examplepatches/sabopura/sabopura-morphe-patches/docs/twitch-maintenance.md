# Twitch の互換性保守

対応済みとして表示するのは **30.7.2 / 3007026**、**31.9.0 / 3109006（minSdk 32）**、**32.0.0 / 3200006（minSdk 32）** です。対応版は最新版と 1 つ前、それに Android 12 以下の端末用の 30.7.2 にしぼります。31.5.2 / 3105026 は対応版から外しましたが、`LayoutProbe` などの検査が使う難読化名がこの版のものなので、検査用の入力として残し、`--force` で当てて確認します。照合を改善したことは、
未検証の将来版がそのまま動くという意味ではありません。

## 今回の照合方式

| 機能 | 手掛かり・検証 | 上流実装からの改善 |
| --- | --- | --- |
| ポイント | モデル説明からclaim・ID・statusを復元。状態型・戻り型・Enabled生成で表示処理を特定し、インターフェースの型で受取メソッドを特定 | 固定された難読化名と、R8で消える引数チェック文字列への依存を除去。元の表示処理をprivate helperへ保存し、戻り値を受けたwrapperから一度だけ呼ぶ。元処理がp0を再利用しても受信元を保持 |
| チャット | モデル型、TextViewへの呼出し、行IDのメソッドを組み合わせて特定。ユーザーID・チャンネルIDはStringまたはTuidに限定 | 31.5.2のTuidを文字列へ変換。nullableなユーザーIDも扱う。チャンネルはgetterから保存済みIDを取得。コールバック引数の上書きは検出して停止 |
| 横幅 | LandscapeChatConfigurationとRelativeLayout.LayoutParamsを持つ所有者から静的幅ヘルパーへ到達 | `(View, int)` とR8が並べ替えた `(int, View)` の実引数に合わせてフックを生成。符号化できない位置は拒否 |
| Following | 見出しのsectionフィールドと、セクションから行番号を作るループを照合 | 旧版のsubmit入口と新版のインライン化された処理に対応。見出し位置マップと差分計算の両方より前でリストを絞る |
| 通知 | Firebase 接続生成をSDKのヘッダー名と型で限定。実際のヘッダーキー引数をレジスター間で追跡 | 「文字列の後の最初のヘッダー呼出し」という仮定を除去。jumbo・move・invoke-range を扱い、分岐合流で不明な値は使わない。元の値のレジスターを上書きせず呼出しだけ差し替え |
| ログイン | setup begin/success/failure の3つの文字列、単一引数、Object戻り値、対象メソッドが実際に読むKotlin Unit参照を照合 | 複数のKotlin同梱コピーがあっても元のUnitを特定する。一意性と処理の形を検証し、nullではなく元のUnitを返す。パッチは `default=false` |
| フォロー解除のハート | プレイヤー下のボタン一覧は toString `Visible(buttons=` と `, onNotificationSettingSelected=` の状態クラス。項目は toString（`UnfollowIconButton`）で見分ける | コンストラクタの先頭で一覧を拡張に渡し、ハートだけを除く。横画面のチャット上部（もう1つの `Visible(buttons=`）は、Twitch がフォロー中のチャンネルに `FollowButton` を入れない（`!isFollowing && canFollow` のときだけ）ので手を加えない。`DeclutterProbe` がこの前提も確認する |
| ハイライトの種類 | `AddHighlightRequested(highlightId=` を作り `AddCommunityHighlight(model=` を判定する合成ラムダの、イベントを型変換して `Boolean.valueOf` を返す case | case の先頭で拡張に問い合わせ、止めるときだけ FALSE を返す。分岐先のラベルはフックへ移す。追加だけを止め、削除は必ず通す |
| 動画のあとの自動再生 | 次の動画を出す状態は toString `RecommendationShown(recommendation=` のクラス。それを `new-instance` する `invoke` はアプリ全体で 1 つ（VOD・クリップ・ピクチャーインピクチャーの終了が、どれもここを通る） | 状態を作る直前で拡張に問い合わせ、止めるときは、状態を受け取る呼び出しの直後へ飛ぶ（状態を作らないので、次の動画もカウントダウンも出ない）。飛び越す区間が一直線で、そこで書かれたレジスターを後ろが読まないことをパッチ時に確かめる。Twitch の設定の「ビデオ自動再生」（`autoplay_setting_title`）はホームのフィード用で、この経路からは読まれない |
| 戻るで閉じる | プレイヤー画面のまとめ役は文字列 `dismiss_gesture` を持つクラス。その縮小メソッドは `(発生元の列挙)Z` で、列挙には `BACK_PRESS` がある。戻るの処理は、`BACK_PRESS` を読んだ直後にこのメソッドを呼ぶただ 1 つの箇所。閉じる呼び出しは、縮小メソッド自身がキャスト中に行う `ルーター.閉じる(アクティビティ, 計測)`（3 つともまとめ役のフィールド） | 縮小は Twitch にそのまま行わせ、戻り値を空きレジスターに受けて拡張に渡す。設定がオンで縮小できたときだけ、ミニプレイヤーの閉じるボタンと同じ呼び出しで閉じる（画面の向きとキーボードは Twitch の縮小処理が戻す）。最小化ボタンとスワイプ、他の画面が出るときの縮小には触れない |
| ピクチャーインピクチャー中に開いたリンク | 縮小の入口は `TheatreModeFragment` の引数なしで `Z` を返すメソッドのうち、`BUTTON_TAP` を読んでプレイヤー画面のまとめ役の縮小 `(発生元の列挙)Z` を呼ぶもの（31.9.0 以降は `shrinkPlayer`、30.7.2 は難読化名）。PiP の受け手は、まとめ役の内側のプレイヤーに `onPictureInPictureModeChanged(Z)` を渡すただ 1 つの箇所 | リンクで開くチャンネル画面は、次のフレームでプレイヤー画面に縮小を頼む。VOD のプレイヤーはモードが `PICTURE_IN_PICTURE` の間は縮小を断り（何もしない）、Android はリンク（`onNewIntent`）を PiP 終了の通知より先に渡すことがある。そのとき縮小が失われて VOD が全画面に戻り、続いて開く配信が表示されなかった（実機で約半数。縮小された回は毎回配信に切り替わっている。置き換えが起きない直接の理由はコードからは特定できていない）。PiP 中に頼まれた縮小を覚えておき、PiP の受け手がまとめ役に終了を渡した直後に、Twitch 自身の縮小（`BUTTON_TAP`）でやり直す。PiP の終了が先に届く回は何もしない。ライブのプレイヤーは PiP 中の縮小を受け付けるので、もとから起きにくい |
| 新しいホームの欄 | React Native の画面が受け取る応答は、すべて `BlobModule` のフィールド `networkingResponseHandler`（名前が残る）の型にある、`([B)WritableMap` のメソッド 1 つを通る。`DiscoveryFeedRNFragment$NavResolver` がない版（30.7.2）では何もしない | 新しいホームは JavaScript が描くので、画面ではなくデータを変える。メソッドの先頭で本体を拡張に渡し、隠す欄のリストを空にした JSON を返す（何も隠さないときは同じ配列を返す）。空のリストは「その欄に何もないアカウント」と同じ応答なので、Twitch 自身の経路で見出しごと出なくなる。フォロー中のカテゴリと視聴の続きは、ライブ中の一覧 `followedLiveUsers` と一緒に届く応答（フォロー中のタブの問い合わせ）だけを対象にする。オフラインは `follows.edges` のうち配信のないチャンネルを外し、`hasNextPage` を false にする（続きのページを取りに行かせない）。広告なしプランのボタンは、操作名 `TurboUpsellButton` の応答の `offers` を空にする（加入済みかどうかの値 `self.benefit` は、Twitch が広告の判断に使うので触らない）。ログインした実機でしか確かめられない（未ログインやタブレットは従来のホームになる）。配信カードの大きさは JavaScript の描き方なので変えられない |
| リキャップ | フィード：`FeedItem$RecapsItem`（名前が残る）を作る唯一のメソッドで、toString `OnFeedRecap(id=` の型のフィールドを読み、null か調べ、直後に項目を作る並び。チャンネルページ：文字列 `streamRecapsShelfKey` の直後の `(String, List, …)` の呼び出し。フィードの棚：文字列 `Android-Stream-Recaps-Native-Feed-Shelf` を持つクラスの `<clinit>` で、名前と既定値（OFF であること）を渡すコンストラクタ | フィードは応答の項目を null にし、Twitch 自身の「知らない種類は足さない」経路に乗せる。チャンネルは節の項目を空にする（Twitch は項目のない節を描かない）。フィードの棚のスイッチは 3 か所で読まれ、ストーリーの棚を出すかも決めるので、名前を Twitch の実験設定にない名前へ変えて既定値のままにする。視聴者向けのスイッチ `Android-Stream-Recaps-Viewer` は切らない（新しいホームの棚がリキャップを開くときのデータの読み込みに使う）。`FeedItem$StreamRecapsShelfItem` がない版（30.7.2）はフィードだけ |

`BytecodeContracts.kt` に共通の一意性判定とヘッダー追跡を分離しています。
候補が0件でも複数でも、パッチ名・条件を含むエラーで失敗させます。
既存の `dataClassFields` はR8が抽出した StringBuilder ヘルパーも追跡します。

ポイントの実行処理は `ClaimDispatcher` と `ClaimGate` に分け、表示更新をまとめます。
ネイティブの状態判定を通った出力を受け取り、メインスレッドの次の処理で最新状態を再確認します。
ログアウト・BAN・無効化された状態に切り替わった場合は、保留中の回収を実行しません。
同じ宝箱の要求を30秒以上空け、保持期間内は最大3回に制限します。

通知の証明書SHA-1は対応する公式APKで確認した公開値です。
証明書更新時は、正規の署名を確認して `Constants.kt` の許可署名と
`FirebaseHeaders` のSHA-1を一緒に見直してください。
PackageManager の署名取得、Twitchログイン、他ドメインの通信は書き換えません。

## 新しい版を追加する手順

1. 公式入力のパッケージ・版・versionCode・署名・SDK・ABIを検証する。
2. 既存版の互換性定義を保持し、新しい候補版で照合を実施する。生成ログで候補が一意か、
   フィールド・受取インターフェース・HTTP呼出し・Unitの対応を確認する。
3. クラス名の変更、似た別メソッド、レジスター再利用、分岐、invoke-rangeなどの
   回帰テストを実行する。未知の構造を推測で許容せず、必要な照合条件を追加する。
4. ログイン修正OFFの通常構成と、ONの構成を**それぞれ公式入力から**生成する。
   両方のDEXと署名を確認し、専用AVDでART検証と起動を確認する。
   ネイティブのチャット行を実際にbind・描画し、投稿者IDあり／nullを両方通す。
   `LayoutProbe.java`の手順は`tests/twitch-compatibility/README.md`を参照。
   クラス列挙や起動だけでは、初回メソッド呼び出し時のVerifyErrorを検出できない。
   ART検証は、APKを端末かAVDに置いて `dex2oat64 --compiler-filter=verify` を実行し、
   logcatの `Rejecting class`・`Verification error` が0件であることを確かめる（約1秒で全クラスを検証できる）。
   `/apex/com.android.art/bin/dex2oat64 --dex-file=<apk> --dex-location=<apk> --oat-file=/data/local/tmp/v.odex --compiler-filter=verify --instruction-set=<arm64|x86_64> '--class-loader-context=PCL[]'`
   1.19.0の準備中に、未ログインの起動では読み込まれないクラス（ログイン後の起動画面）で、これを見落とした。
   差し込むsmaliの決まり：`v0`などの作業用レジスターは、使う数だけ空きを確かめる（`requireLocal(what, count)`）。
   空きのない拡張側の空メソッドは、作業用の引数を足す（`AutoDrops.tapClaim`）。
   差し込むコードの中に `:label` があるときは、`addInstructions` ではなく `addInstructionsWithLabels` を使う。
   `tests/twitch-compatibility/live-smoke.sh` で、実際のライブ配信を未ログインで開き、
   再生中に固まらないこと（on / off / full）と、プレイヤーの端のスワイプを確かめる。
   部品を組み立てる検証だけでは、配信画面の下にある画面や、実際のイベントの流れが抜ける。
   旧版でも回帰確認を行う。ポイントの元処理は命令・分岐先・例外範囲を原本と比較する。
   チャットの戻り箇所数は固定せず原本との一致で検証する。
5. ログイン後に、宝箱の出現・1回だけの受取・チャンネル移動・失敗時の挙動、
   Firebase登録と実プッシュ通知、ログインの成功を確認する。
6. 適用・組込み・起動の証拠が揃ってから対応版リストを広げる。実認証など未確認の範囲は
   検証記録に明記する。未検証のversionCodeや別Android向けvariantは自動で追加しない。
   APK・ログ・署名鍵はコミットしない。

```powershell
.\gradlew.bat :patches:test :extensions:twitch:testDebugUnitTest :patches:generatePatchesList --no-daemon
.\gradlew.bat :patches:buildAndroid --no-daemon
```

検証では、全パッチの構成に加えて、パッチを 1 個ずつ外した構成も適用できることを確かめます（`softHook` の `OPTIONAL HOOK FAILED` がログに出たら不合格です）。

新しい版に対応したら、ログインした実機で配信・VOD・チャット・設定画面をひととおり開き、`adb logcat -s SabopuraTwitch` と、設定の「このパッチについて › 診断」を確かめます。
パッチは Twitch を落とさないよう失敗を受け止めるので、Twitch 側の名前や形が変わって働かなくなった箇所は、画面には何も出ません。
その代わり、場所ごとに 1 回だけ、場所の名前（`player.vod-channel` など）・例外・パッチ側の行がログと診断に残ります。対応している版の正常な実行では何も出ないので、出たらその場所の前提（反射で読む名前、差し込み先の引数など）を新しい版と突き合わせます。
差し込み口や Twitch のクラスへの反射を新しく書くときも、失敗を捨てずに `Diagnostics.note("<場所>", e)` で記録します（入力の解析や後片付けのように、失敗しても困らないものは除きます）。

MPPは最後の `buildAndroid` で確定します。通常構成は `Fix login` を選ばず、
ログイン修正ONの検証時だけ `--enable="Fix login"` を追加します。
今回の検証では、実アカウントの宝箱受取・プッシュ到着・ログイン成功は未確認です。

## 広告ブロック（`Ads:` の 5 パッチ）

31.5.2 の解析にもとづく（31.6.0・31.7.0・31.8.0・31.9.0・32.0.0 も同じ目印で当たり、同じ検証に合格。対応版は 31.9.0・32.0.0。32.0.0 では `AdMetadataCueRouter.route` に、下の処理へそのまま渡すだけの真偽値の引数が加わったので、`route(String)` と `route(String, boolean)` の両方を受け付ける）。照合は難読化名ではなく、次の目印で行う。どれか 1 つでも見つからなければパッチ全体を失敗させる。

| 層 | 目印 | 動作 |
| --- | --- | --- |
| ① 広告要求のまとめ役 | 文字列 `ad request already active` のクラス。`StateMachine` を作る、boolean 引数 1 つのコンストラクタ | boolean を false にし、Twitch 自身の「広告なし」状態で開始 |
| ② 広告サーバー API | Retrofit `create`（文字列 `API declarations must be interfaces.`）の `Proxy.newProxyInstance` の結果。`AdEdgeApi`（名前が残る） | 通信せずに失敗の `Result` を返す。`Single.just` は `AdEdgeApi` の戻り型の `item is null` を持つ静的メソッド |
| ② 応答の解析 | 文字列 `failed to parse display ad response: ` と `(Result, Z)` の引数 | 先頭で「広告なし」のシングルトンを返す |
| ③ React Native | `NetworkingModule.sendRequestInternalReal`、`AdMetadataCueRouter.route`（名前が残る） | `edge.ads.twitch.tv` に 204 で応答、MAF と PbyP のキューを捨てる |
| ④ 埋め込み広告 | `com.amazonaws.ivs.net.HttpClientFactory.create`（SDK の公開クラス）。`ReadCallback`/`StreamConsumer` を public にする。拡張が使う IVS のメソッド・型・インターフェースがこの版の Twitch にそろっているかをパッチ時に確かめ、足りなければパッチを失敗させる | 広告入りの再生リストを、匿名の別トークン（`mobile_feed` → 配信プロキシ（設定した場合）→ `autoplay`）の再生リストに差し替え。`autoplay` だけは画質が下がる |
| ⑤ PbyP | 文字列 `processStateChange(Ltv/twitch/android/feature/pbyp/PbypPresenter$State;…` のクラスの `()Z` | false |
| ⑥ 広告イベント | `OnSurestreamAdStarted(` などの toString を持つイベントと、その根の型だけを引数に取るメソッド（IVS と ExoPlayer の 2 つ） | 差し替えられなかった広告を黒い画面と消音で隠す |

ライブの再生リストでは `EXT-X-MEDIA-SEQUENCE` と `EXT-X-TWITCH-LIVE-SEQUENCE` が一致する。番号を後者にそろえることで、2 つのセッションを継ぎ目なく切り替えられる。広告のない間は、視聴中の配信で予備のセッションを 1 度開く以外の通信をしない。

`HttpClientFactory.create` は何度も呼ばれ、そのたびに別のクライアントができる。31.9.0 以降のログイン後のホーム（React Native）から配信を開くと、マスター再生リストは先読み用のクライアントが取り、メディア再生リストは再生用の別のクライアントが取る。このため、配信ごとの情報（セッション）はクライアントごとではなく、包んだクライアント全体で共有している（`AdFreeHttpClient` の static な `sessions`）。クライアントごとに持つと、広告に出会う側のクライアントには「知らない配信」になり、ログに `No session for an ad playlist` が出て、差し替えずに隠すだけになる（未ログインのホームでは 1 つのクライアントが両方を取るので、エミュレーターでは再現しない。ログインした実機で確かめること）。正しく働いているときは、配信を開いた直後に `Live session for <login>`、広告が入ると `Ad replaced for <login> from <予備の名前>`、広告が終わると `Back to the original session of <login>` が出る。

検証：

1. `VerifyAdsDex.java` で、書き換え箇所の数と `Single.just` の橋渡しを確認する。
   `java -cp <morphe-desktop-all.jar> tests/twitch-compatibility/VerifyAdsDex.java <patched.apk>`
2. `device-probe/` の計測用 APK を、パッチ済みアプリと同じ鍵で署名して入れ、Twitch のプロセス内で実行する。
   `adb shell am instrument -w io.github.sabopura.deviceprobe/io.github.sabopura.deviceprobe.AdsProbe`
   実際の配信の再生前広告が差し替わること（Web の `site` トークンで約半数のチャンネルに入る）、
   広告サーバー API が通信しないこと、広告イベントの処理を確認する。`RESULT failed=0` を確認する。
3. ログインした実機で、配信と VOD を開き、`adb logcat -s SabopuraTwitch` で各層のログを確認する（エミュレーターでは未確認）。
