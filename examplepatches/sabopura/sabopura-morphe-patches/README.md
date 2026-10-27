# Sabopura Morphe Patches

[Morphe](https://github.com/MorpheApp/morphe-manager) で使うパッチ集です。YouTube と Twitch の動画に弾幕コメントを流したり、各アプリの広告や追跡を止めたりします。

<p align="center">
  <a href="https://morphe.software/add-source?github=sabopura/sabopura-morphe-patches">
    <img src="docs/images/add-to-morphe.svg" alt="➕ Morphe に追加" width="340">
  </a>
</p>

<p align="center">
  <b>Morphe Manager を入れたスマホで、上のボタンをタップするだけで追加できます。</b><br>
  開いたページで「Open in Morphe」をタップし、Morphe Manager で追加を確定すれば完了です。<br>
  パソコンで開いた場合は QR コードが表示されるので、スマホで読み取ってください。
</p>

<p align="center">
  <img src="docs/images/twitch-menu.gif" alt="Twitch のプレイヤーメニューと設定画面" width="320">
</p>

> ⚠️ 個人用に作ったものを公開しています。動作確認は限られた環境のみで、不具合があっても対応できない場合があります。自己責任でお使いください。

## できること

### YouTube

- **Danmaku comments**：通常のコメント、ライブチャット、チャットのリプレイを、ニコニコ動画のように動画の上に流します。API キーは使いません。NG ワード、文字サイズ、速さなどは YouTube の設定画面から変えられます。
- **Ambient light**：動画の周りの黒い帯を、映像の色でやわらかく照らします（PC 版の拡張機能「Ambient light for YouTube」と同じ考え方です）。

### Twitch

- **Danmaku chat**：ライブチャットを配信の上に流します。エモートも画像で表示します。
- **Chat enhancements**：7TV / BetterTTV / FrankerFaceZ のエモート、追加バッジ、代名詞、NG ワード、非表示ユーザー、ハイライト、送信時刻、文字サイズ、過去チャットの取得、表示したメッセージの検索。
- **Player enhancements**：再生速度、シーク幅、スリープタイマー、再生統計、VOD のチャット同期とチャプター、明るさ・音量のジェスチャー、横画面のチャット幅、ミニプレイヤーの大きさ、ホーム画面の整理など。
- **Show deleted messages**：削除されたメッセージを読めるまま残します。
- **Block ads**：広告をまとめて止めます（31.6.0・31.7.0）。再生前・途中・VOD の動画広告、音声広告、PbyP、バナーやフィードの表示広告を止め、配信に埋め込まれた広告は、広告が入ったときだけ Twitch から広告のない再生リストを取り直して差し替えます。外部のサーバーは使いません（配信プロキシを設定した場合は予備として使います）。差し替えられなかった広告は黒い画面で隠して消音します。
- **Auto claim channel points**：受け取れるボーナスを自動で受け取ります。
- **Fix notifications** / **Fix login**：再署名したアプリで通知やログインがうまくいかないときの対策です（Fix login は必要なときだけ選んでください）。

プレイヤーの右上（共有ボタンの左）に追加される吹き出しのボタンを**タップ**するとメニューが、**長押し**すると弾幕のオン/オフができます。設定はすべて 1 つの画面にまとめていて、メニューの「⚙ 設定」や、**Twitch の設定画面（プロフィールの歯車）の一番上の「パッチの設定」**からも開けます。詳しくは [Twitch の使い方](docs/twitch.md) を見てください。

### そのほかのアプリ

| アプリ | できること |
| --- | --- |
| Reddit | 投稿とコメントを自動で翻訳します（初期設定は日本語） |
| SmartNews | 広告を取り除きます。マイミッションの達成済みの報酬を、ポイントタブを開かなくても裏で自動で受け取り、抽選も自動で引きます。受け取ったポイントは画面下に小さく表示します。アプリ内ブラウザーで開いていたウェブページを、端末に入っているほかのブラウザー（そのブラウザーの Custom Tabs、またはブラウザーアプリ）で開けます（Open in external browser。初期設定はオフ） |
| Pinterest | 宣伝ピンの扱いを止め、Bugsnag と各種計測を止めます |
| pixiv | 広告を隠し、広告 SDK の初期化を止めます（プレミアム機能は解放しません） |
| Google News | 記事をブラウザーの Custom Tabs で開きます。MicroG（GmsCore）で使えるようにします |
| Sankaku | 有料プランの宣伝ポップアップと、アプリ内容の自動更新（OTA）を止めます |

## 導入方法

1. [Morphe Manager](https://github.com/MorpheApp/morphe-manager/releases/latest) をインストールします。
2. スマホでこのボタンをタップして、パッチを追加します。

   [![➕ Morphe に追加](docs/images/add-to-morphe.svg)](https://morphe.software/add-source?github=sabopura/sabopura-morphe-patches)

   新しい版が出たときは、Morphe Manager が自動で更新します。
   <details>
   <summary>ボタンが使えないとき</summary>

   Morphe Manager の **ソース → ＋ → リモート** に、このリポジトリの URL を入力します。
   ```
   https://github.com/sabopura/sabopura-morphe-patches
   ```
   [Releases](../../releases) から `.mpp` ファイルをダウンロードして、**ローカル** として追加することもできます（この場合は自動更新されません）。
   </details>
3. 下の表の対応バージョンの**公式 APK** を用意し、Morphe Manager でパッチを選んで適用します。

パッチを当てた APK はここでは配布していません。元の APK はご自身で用意してください。YouTube は、Morphe 公式のパッチ（MicroG 対応など）と一緒に使うことを想定しています。

## 対応バージョン

| アプリ | パッケージ名 | 対応バージョン |
| --- | --- | --- |
| YouTube | `com.google.android.youtube` | 21.20.405, 21.42.241, 21.42.243 |
| Twitch | `tv.twitch.android.app` | 30.7.2, 31.6.0, 31.7.0（Block ads は 31.6.0・31.7.0。30.7.2 は Android 12 以下の端末用） |
| Reddit | `com.reddit.frontpage` | 2026.24.0, 2026.42.0 |
| SmartNews | `jp.gocro.smartnews.android` | 26.10.20, 26.10.30（どちらも Google Play 版の APKM も可） |
| Pinterest | `com.pinterest` | 14.40.0, 14.41.0 |
| pixiv | `jp.pxv.android` | 6.200.0, 6.201.0 |
| Google News | `com.google.android.apps.magazines` | 5.168.0.982359681, 5.170.0.999208975 |
| Sankaku | `com.sankakucomplex.channel.black` | 4.27, 4.28 |

対応バージョンは、各アプリの最新版と 1 つ前の版にしぼっています。YouTube と Reddit は、Morphe 公式のパッチが対応している版（安定版と最新版）とストアの最新版に対応し、公式のパッチと一緒に当てられるようにしています。新しいバージョンには確認が済んだものから順に対応し、古いバージョンは対応から外します。表にないバージョンでは動かないことがあるので、表のバージョンの APK を使ってください。

## 確認済みの環境

- Android 16（API 36）のエミュレーターで、各アプリへのパッチ適用、起動、主な操作を確認しています。
  - YouTube：公開動画で弾幕が取得・表示されること
  - SmartNews：広告のないフィードが表示され、スクロールできること。記事を読んだあとにアプリを開き直すと、ミッションの報酬を裏で受け取ること（ログインした状態でのポイント加算は実機で確認）。Open in external browser は Android 17（API 37）のエミュレーターで、記事や記事内のリンクがほかのブラウザー（Chrome、Firefox）で開き、戻るボタンで SmartNews に戻ること（作者の端末でも確認）
  - Twitch：プレイヤーのボタン・メニュー・設定画面、チャット、弾幕、ジェスチャー、再生速度、広告ブロック。ログインせずに実際のライブ配信も再生して確認
- ログインが必要な画面（ログインした状態での Twitch の視聴、Reddit・Pinterest のフィードなど）は、エミュレーターでは確認できていません。Google News は記事の読み込み中にエミュレーター自体が終了するため、起動までの確認です。

各パッチの詳しい動作と制限は [アプリ別の説明（英語）](docs/apps.md) にまとめています。

## ソースからビルドする

JDK 21 と Android SDK が必要です。Morphe の依存関係は GitHub Packages から取得するため、`read:packages` 権限のある GitHub トークンを環境変数 `GITHUB_ACTOR` と `GITHUB_TOKEN` に設定してください。

```sh
./gradlew :patches:buildAndroid :patches:generatePatchesList
```

`patches/build/libs/patches-<バージョン>.mpp` ができます。

## ライセンス

[GPLv3](LICENSE)（無保証）。他の方のコードを元にした部分の出典は [NOTICE](NOTICE) にあります。
「Morphe」は互換性を説明するための表記で、このリポジトリは Morphe の公式プロジェクトではありません。
