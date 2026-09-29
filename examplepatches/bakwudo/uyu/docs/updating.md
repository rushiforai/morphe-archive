# 対応する Twitch のバージョンを上げる手順

uyu のリリース 1 つが対応する Twitch のバージョンは 1 つだけ。新しいバージョンに上げるときは、対応バージョンを追加するのではなく置き換える。

## 手順

1. **APK を用意する**
   APKMirror から新しいバージョンの APKM（分割 APK）をダウンロードし、`apk/` に置く。エミュレーター（x86_64）でテストするので、アーキテクチャに x86_64 を含むバリアント（例：「arm64-v8a + x86 + x86_64」）を選ぶ。`apk/` の中身は Git の管理外。古いファイルは別の場所へ移しておく（`check-patches.ps1` は `apk/` の中で最も新しいファイルを使う）。

2. **対象バージョンを書き換える**
   `patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/shared/Constants.kt` の `TWITCH_VERSION` を新しいバージョンにする。

3. **どのパッチが壊れたかを調べる**
   ```
   ./scripts/check-patches.ps1 -Build -MorpheDesktop <morphe-desktop-*-all.jar のパス>
   ```
   適用できたパッチ（OK）と、失敗したパッチ（FAIL）とその理由が一覧で表示される。理由にはフィンガープリントの名前が含まれる。環境変数 `UYU_MORPHE_DESKTOP` に jar のパスを入れておけば `-MorpheDesktop` は省略できる。

4. **壊れたフィンガープリントを直す**
   jadx で新しい APK を開き、失敗したフィンガープリントが指していたコードを探し直す。各機能のフィンガープリントは、その機能のフォルダの `Fingerprints.kt` にまとめてある。直すときは下の「フィンガープリントの書き方」に従う。手順 3 を繰り返し、FAIL がなくなるまで続ける。

5. **エミュレーターで動作を確認する**
   パッチを当てた APK を `adb install` して、下のチェックリストを確認する。

6. **コミットしてリリースする**
   `dev` ブランチに `bump: Support Twitch <バージョン>` の形でコミットして push する。semantic-release が `dev` のプレリリースを作る。問題がなければ `dev` を `main` にマージ（squash しない）して安定版にする。`main` に直接コミットがあると `dev` → `main` の PR がコンフリクトするので、そのときは先に `main` を `dev` にマージして解消する。README の「Patches list」の部分はリリースのたびに `.github/scripts/generate_patches_readme.py` が作り直すので、書き換えるときはスクリプトを直す。

## フィンガープリントの書き方

Twitch は R8 で難読化されており、クラス名やメソッド名（`zn8`、`V2` など）はビルドごとに変わる。追従の手間を小さくするため、次の順で手がかりを選ぶ。

1. アプリに埋め込まれた文字列（ログのイベント名、URL、ヘッダー名、`toString` の書式など）
2. 難読化されないクラスの名前（`java.*`、`android.*`、Kotlin の標準ライブラリ、`tv.twitch...` の中で難読化されずに残っているもの）
3. 引数と戻り値の型の形（難読化された型は `L` とだけ書く）
4. 命令の並び（`opcode`、`methodCall`、`fieldAccess` のフィルター）

難読化された名前をパッチのコードに直接書かない。必要な型やメソッドは、フィンガープリントで見つけたメソッドの命令や引数から取り出して使う。

## 動作確認のチェックリスト

- [ ] 公式の Twitch とは別に「uyu」という名前のアプリとして入り、起動する（Install as a separate app）
- [ ] ユーザー名とパスワードでログインできる（Fix login）
- [ ] プッシュ通知を受け取れる（Fix notifications）
- [ ] Twitch の設定メニューに「uyu」があり、設定画面とそのセクション（General、Appearance、Danmaku、Ads）が開ける
- [ ] 視聴中のチャンネルでボーナスが自動で受け取られる（Auto claim channel points）
- [ ] 横画面フルスクリーン、縦画面、ミニプレイヤー、ピクチャーインピクチャーでコメントが流れ、プレイヤーのボタンでオン/オフできる。縦画面、ミニプレイヤー、ピクチャーインピクチャーは、設定をオフにすると流れない（Danmaku comments）
- [ ] 縦画面の視聴画面で、チャットの上のサブスク・ビッツのボタンの段、入力欄のビッツのボタン、ギフトのランキングが出ない。宣伝のバナーやハイライトが出ない（Hide promotions）
- [ ] ライブ・VOD の広告と表示広告が出ない、または黒画面になり音が消える。ホームのフィードに広告が出ない。Proxy URL を入れるとプロキシから再生され、つながらないと「Proxy failed」が出て Twitch から再生される（Block ads）。`adb logcat -s uyu` に `Requesting the stream as the embed player` と `Video ads the app plays itself are off for this player` が出る

「表示の整理」は View をリソース名で探す。新しいバージョンでリソース名が変わると、パッチは当たるが隠れなくなる。そのときは logcat（`adb logcat -s uyu`）に `View <名前> not found` と出る。
