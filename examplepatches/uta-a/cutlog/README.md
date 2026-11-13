# cutlog

cutlog は、setlog Android アプリ（`com.newchat.setlog`）向けの Morphe パッチバンドルです（GPL-3.0）。撮った動画を投稿前に編集したり、端末内の動画を今のログとして投稿したりできるようにします。

cutlog は非公式のプロジェクトで、setlog の開発元および Morphe とは関係ありません。パッチを当てたアプリの利用は setlog の利用規約に反するおそれがあり、アカウントが停止される可能性もあります。自己責任で使ってください。

[**➕ cutlog を Morphe に追加**](https://morphe.software/add-source?github=uta-a/cutlog)（Android 端末で開くと、Morphe Manager にパッチソースとして追加されます。詳しくは[導入](#導入)）

## できること

- **投稿前に編集する**: 撮影のあとに編集画面を開き、トリム、フィルター、明るさなどの調整、効果（VHS・グリッチ・ぼかしなど）、フレーム、反転・ズーム、速度変更（0.5x〜2x）、逆再生、文字、スタンプ、文字やスタンプの動きを付けてから投稿できます。「そのまま投稿」も選べます。
- **ファイルから投稿する**: 撮影画面の「ファイルから」ボタンで端末内の動画を選び、切り出して今のログとして投稿できます。動画は公式の撮影と同じ形式（HEVC・720x1280・30fps 以下）に変換します。
- **撮影する長さを選ぶ**: 撮影画面の「2秒」ボタンを押すたびに 2 → 3 → 5 → 10 → 15 秒と切り替わります。
- **機能ごとに ON / OFF**: 撮影画面の歯車ボタンから、上の 3 つを個別に切り替えられます。OFF の機能は公式と同じ動作になります。

編集と書き出しは端末の中だけで行い、cutlog は外部と通信しません。投稿は setlog 本体の処理をそのまま使います。投稿時刻の変更（過去の時間帯への投稿）には対応しません。

## 対象

| 項目 | 値 |
| --- | --- |
| アプリ | setlog（`com.newchat.setlog`） |
| バージョン | 1.3（versionCode 76） |
| アーキテクチャ | arm64-v8a |
| 入力形式 | APKM |
| Android | 12L（API 32）以上 |

上記以外のバージョンには対応していません。

## パッチ

| パッチ | 内容 |
| --- | --- |
| 投稿前編集 | 撮影後に編集画面を開きます。撮影画面に設定の歯車ボタンを追加します。ほかの機能のパッチはこれに依存します |
| ファイルから投稿 | 撮影画面に「ファイルから」ボタンを追加します |
| 撮影秒数の選択 | 撮影画面に撮影する長さのボタンを追加します |
| インストール元チェック | Google Play 以外からインストールした setlog が、起動時のインストール元チェックで止まらないようにします。Play ライセンスの確認は変更しません |
| MicroG-RE Google ログイン | Google ログインの Google ID token の取得だけを [MicroG-RE](https://github.com/MorpheApp/MicroG-RE) 経由にします。MicroG-RE が入っていなければ元の経路を使います |

## 導入

### Morphe Manager（Android）

Android 端末で次のリンクを開くと、Morphe Manager に cutlog がパッチソースとして追加されます。新しいリリースは Morphe が自動で見つけます。

[**➕ cutlog を Morphe に追加**](https://morphe.software/add-source?github=uta-a/cutlog)

`.mpp` ファイルから追加する場合は、パッチソース画面の `+` から `Local` を選び、[リリース](https://github.com/uta-a/cutlog/releases)の `patches-*.mpp` を指定します。この方法では自動更新されません。

setlog の APKM を選び、cutlog のパッチを適用します。

### Morphe Desktop（CLI）

Java 21 以上が必要です。

```sh
java -jar morphe-desktop-*-all.jar patch \
  --patches patches-*.mpp \
  --out setlog-cutlog.apk \
  <setlog の APKM>
```

### 公式アプリからの移行

パッチを当てたアプリは公式版と署名が違うため、公式アプリに上書きインストールできません。公式アプリをアンインストールしてから入れ直すことになります。

setlog の投稿は端末の暗号鍵で暗号化されます。アンインストールする前に、公式アプリのアカウント画面で鍵のバックアップが「backed up」になっていることを確かめてください。パッチ版での鍵の復元は十分に確認できていません。まずはサブアカウントで試すことをおすすめします。

Google でログインする場合は、[MicroG-RE の公式リリース](https://github.com/MorpheApp/MicroG-RE/releases)を入れて Google アカウントを登録してから、setlog のログイン画面で「Continue with Google」を押してください。

## 使い方

- 撮影すると編集画面が開きます。右上のピンクの ↑ で編集した動画を、「そのまま投稿」で元の動画を、本体の送信先選択画面へ渡します。左上の ✕ は撮影をやめます。
- 下のツールバーを横にずらして、ツールを選びます。文字とスタンプはプレビュー上でドラッグして動かし、2 本指で拡大・回転できます。タイムラインのバーの両端で表示する区間を変えられます。
- 撮影画面の歯車ボタンで、機能ごとの ON / OFF を切り替えます。

## 既知の制限

- setlog は起動時に Google Play のライセンスを確認します。cutlog はこの確認を変更しないため、Play で setlog を入手していないアカウントの端末では起動できないことがあります。
- 編集画面を開いたままアプリが終了すると、撮影した動画は失われます。
- 速度を変えると投稿する動画の長さが変わります（1〜15 秒に収まる速さだけ選べます）。15 秒の動画の投稿は確認していません。
- 横向き・回転情報付き・音声なし・HDR の動画の取り込みは、実機で確認していません。

## 開発

ビルドには Morphe の GitHub Packages の認証（環境変数 `GITHUB_ACTOR` / `GITHUB_TOKEN`）と JDK 17 以上が必要です。

```sh
./gradlew build
```

`patches/build/libs/patches-<version>.mpp` ができます。パッチの仕組みと検証の記録は [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md)、設計は [docs/DESIGN.md](docs/DESIGN.md) にあります。

## ライセンス

[GPL-3.0](LICENSE)。同梱するライブラリとフォントのライセンスは [NOTICE](NOTICE) を参照してください。
