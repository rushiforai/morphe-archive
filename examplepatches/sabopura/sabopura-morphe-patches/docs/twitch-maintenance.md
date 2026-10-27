# Twitch の互換性保守

対応済みとして表示するのは **30.7.2 / 3007026**、**31.6.0 / 3106006（minSdk 32）**、**31.7.0 / 3107006（minSdk 32）** です。対応版は最新版と 1 つ前、それに Android 12 以下の端末用の 30.7.2 にしぼります。31.5.2 / 3105026 は対応版から外しましたが、`LayoutProbe` などの検査が使う難読化名がこの版のものなので、検査用の入力として残し、`--force` で当てて確認します。照合を改善したことは、
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

MPPは最後の `buildAndroid` で確定します。通常構成は `Fix login` を選ばず、
ログイン修正ONの検証時だけ `--enable="Fix login"` を追加します。
今回の検証では、実アカウントの宝箱受取・プッシュ到着・ログイン成功は未確認です。

## 広告ブロック（Block ads）

31.5.2 の解析にもとづく（31.6.0・31.7.0 も同じ目印で当たり、同じ検証に合格。対応版は 31.6.0・31.7.0）。照合は難読化名ではなく、次の目印で行う。どれか 1 つでも見つからなければパッチ全体を失敗させる。

| 層 | 目印 | 動作 |
| --- | --- | --- |
| ① 広告要求のまとめ役 | 文字列 `ad request already active` のクラス。`StateMachine` を作る、boolean 引数 1 つのコンストラクタ | boolean を false にし、Twitch 自身の「広告なし」状態で開始 |
| ② 広告サーバー API | Retrofit `create`（文字列 `API declarations must be interfaces.`）の `Proxy.newProxyInstance` の結果。`AdEdgeApi`（名前が残る） | 通信せずに失敗の `Result` を返す。`Single.just` は `io.reactivex.u` の `item is null` を持つ静的メソッド |
| ② 応答の解析 | 文字列 `failed to parse display ad response: ` と `(Result, Z)` の引数 | 先頭で「広告なし」のシングルトンを返す |
| ③ React Native | `NetworkingModule.sendRequestInternalReal`、`AdMetadataCueRouter.route`（名前が残る） | `edge.ads.twitch.tv` に 204 で応答、MAF と PbyP のキューを捨てる |
| ④ 埋め込み広告 | `com.amazonaws.ivs.net.HttpClientFactory.create`（SDK の公開クラス）。`ReadCallback`/`StreamConsumer` を public にする | 広告入りの再生リストを、匿名の別トークン（`mobile_feed` → 配信プロキシ（設定した場合）→ `autoplay`）の再生リストに差し替え。`autoplay` だけは画質が下がる |
| ⑤ PbyP | 文字列 `processStateChange(Ltv/twitch/android/feature/pbyp/PbypPresenter$State;…` のクラスの `()Z` | false |
| ⑥ 広告イベント | `OnSurestreamAdStarted(` などの toString を持つイベントと、その根の型だけを引数に取るメソッド（IVS と ExoPlayer の 2 つ） | 差し替えられなかった広告を黒い画面と消音で隠す |

ライブの再生リストでは `EXT-X-MEDIA-SEQUENCE` と `EXT-X-TWITCH-LIVE-SEQUENCE` が一致する。番号を後者にそろえることで、2 つのセッションを継ぎ目なく切り替えられる。広告のない間は追加の通信をしない。

検証：

1. `VerifyAdsDex.java` で、書き換え箇所の数と `Single.just` の橋渡しを確認する。
   `java -cp <morphe-desktop-all.jar> tests/twitch-compatibility/VerifyAdsDex.java <patched.apk>`
2. `device-probe/` の計測用 APK を、パッチ済みアプリと同じ鍵で署名して入れ、Twitch のプロセス内で実行する。
   `adb shell am instrument -w io.github.sabopura.deviceprobe/io.github.sabopura.deviceprobe.AdsProbe`
   実際の配信の再生前広告が差し替わること（Web の `site` トークンで約半数のチャンネルに入る）、
   広告サーバー API が通信しないこと、広告イベントの処理を確認する。`RESULT failed=0` を確認する。
3. ログインした実機で、配信と VOD を開き、`adb logcat -s SabopuraTwitch` で各層のログを確認する（エミュレーターでは未確認）。
