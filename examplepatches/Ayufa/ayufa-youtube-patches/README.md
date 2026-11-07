<p align="center">
  <a href="https://morphe.software/add-source?github=Ayufa/ayufa-youtube-patches">
    <img src=".github/assets/add-to-morphe.svg" alt="Morphe に追加" height="48">
  </a>
</p>

# 🧩 Ayufa YouTube パッチ

<p align="center">

![GitHub Release](https://img.shields.io/github/v/release/Ayufa/ayufa-youtube-patches?include_prereleases&style=for-the-badge)
![License](https://img.shields.io/github/license/Ayufa/ayufa-youtube-patches?style=for-the-badge)
![GitHub Stars](https://img.shields.io/github/stars/Ayufa/ayufa-youtube-patches?style=for-the-badge)
![GitHub Forks](https://img.shields.io/github/forks/Ayufa/ayufa-youtube-patches?style=for-the-badge)
![GitHub Issues](https://img.shields.io/github/issues/Ayufa/ayufa-youtube-patches?style=for-the-badge)

</p>

日本語 | [English](README.en.md)

> [!NOTE]
>
> 個人的に作っている、Morphe 用の独自パッチです。公式の Morphe パッチではありません。
>
> 本家のパッチと一緒に使う想定です。

## Contents

- [このリポジトリについて](#-このリポジトリについて)
- [使い方](#使い方)
- [パッチの詳細](#パッチの詳細)
- [パッチ一覧](#-パッチ一覧)
- [不具合の報告](#不具合の報告)
- [FAQ](#faq)
- [本家との関係](#本家との関係)
- [自分でビルドする場合](#️-自分でビルドする場合)
- [ライセンス](#-ライセンス)

## ❓ このリポジトリについて

<details>
<summary>概要</summary>

本家のパッチ（[MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches)）で満足できなかったところや、自分が欲しい機能だけを少し足す、という位置づけのパッチ集です。

| 対象アプリ | 対象バージョン | パッチ数 |
|---|---|---|
| YouTube | 21.30.216 / 20.26.46 | 2 |

</details>

## ⚠️ 免責

個人の趣味で作っているものです。動作は自分の環境で確認していますが、すべての環境での動作は保証できません。大事な端末で使う前に、よく確認してください。

## 使い方

上のボタンから、このリポジトリを Morphe のパッチソースに追加して、使いたいパッチを選んで適用します（本家のパッチと一緒に選んでください）。

⚠️ **対象バージョンは厳密に合わせてください**（バージョンごとに動作を確認しているため、対象以外には当てられません）。

- YouTube「ライブチャットの余計な表示を隠す」→ **21.30.216**
- YouTube「ライブ遅延キーパー」→ **20.26.46**

## パッチの詳細

### 📺 YouTube

<details>
<summary>ライブ遅延キーパー</summary>

| 項目 | 内容 |
|---|---|
| 対象 | YouTube **20.26.46**（Android 8.0 で動く最後の YouTube）のみ |
| 何をするか | ライブ配信を長時間つけっぱなしにしていると、再生位置が配信の先端から少しずつ遅れていきます。このパッチは、一定の間隔ごとに、再生を瞬間的に停止→再生します。ライブ配信は停止→再生すると最新の位置に戻るため、遅れが何秒たまっていても常に最新に合わせ直せます（遅れの秒数を測って少しずつ進める方式ではありません） |
| 調整 | 適用後は Morphe 設定の「Ayufaパッチ設定」で、再パッチなしに変更できます。「ライブ配信を最新の状態に保つ」でオン/オフ、「先端に合わせる間隔（分）」で合わせ直す間隔を **0〜120分で自由に入力** できます（0分で自動更新オフ、どちらもその場で反映）。パッチ適用時にも、間隔の初期値を変更できます（初期値は10分） |

使う場面の例：Android 8.0 の古い端末（SOV34 など）をライブ配信のつけっぱなし用にしていて、気づいたら数分遅れている、という場合の対策です。

</details>

<details>
<summary>ライブチャットの余計な表示を隠す</summary>

| 項目 | 内容 |
|---|---|
| 対象 | YouTube **21.30.216**（本家が推奨している最新の安定版。最新の Android 向け） |
| 何をするか | ライブチャットに出てくる固定コメント（ピン留めされたメッセージ）やアンケート（投票カード）など、チャットを読むときに邪魔な表示を隠します |
| 調整 | パッチ適用時に、項目を個別に選べます。さらに、適用後は Morphe 設定に専用の「Ayufaパッチ設定」画面ができ、その中の「固定メッセージ（バナー）を隠す」「アンケートを隠す」で、再パッチなしに切り替えられます（次にチャットを開いたときから反映） |

</details>

## 🩹 パッチ一覧

<!-- PATCHES_START -->
> **[v1.1.0](https://github.com/Ayufa/ayufa-youtube-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.google.android.youtube`

**🎯 Supported versions:**

| 21.30.216 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide live chat clutter](#hide-live-chat-clutter) | Hides the pinned message banner and poll cards in live chat. Each can be toggled in Morphe settings (Ayufa patch settings) without re-patching. For YouTube 21.30.216. | • Hide pinned message banner<br>• Hide live chat polls |
| [Live latency keeper](#live-latency-keeper) | At a fixed interval, momentarily pauses and resumes live stream playback so it snaps back to the live edge (the newest position), no matter how far behind it has fallen. The interval (any value from 0 to 120 minutes, typed in directly) and the on/off switch can be changed in Morphe settings (Ayufa patch settings) without re-patching. For YouTube 20.26.46 (Android 8.0) only. Requires the official Morphe patches to be applied as well. | • Default sync interval (minutes) |

</details>

<!-- PATCHES_END -->

## 不具合の報告

このリポジトリの Issue に報告してください。その際、次の情報を添えてもらえると助かります。

- アプリのバージョン
- 使ったパッチソースのリリース（例：`v1.0.0`）
- APK の入手元と形式（例：APKMirror の単一APK、XAPK など）
- 可能ならログ

本家のパッチ自体の不具合は、ここでは直せません。

## FAQ

<details>
<summary>対象バージョン以外には当てられますか？</summary>

当てられません。バージョンごとに動作を確認しているため、対象バージョンの APK を用意してください。

</details>

<details>
<summary>本家のパッチと一緒に使うのですか？</summary>

はい。本家のパッチと一緒に使う想定です。

</details>

## 本家との関係

- 本家のリポジトリには、プルリクエスト・Issue・コメントなどを一切しません。見るだけ（読み取り専用）で使わせてもらっています
- ライセンスやクレジットは本家に従います（GPL-3.0）

### 本家の更新についていく仕組み

- 本家のパッチャーなどの依存更新は、Dependabot が定期的に知らせてくれます
- 本家の対応 YouTube バージョンが変わったら、GitHub Actions（upstream-watch）が検知して、このリポジトリの中にだけ Issue を立てます。本家側には何も書き込みません
- 詳しくは [本家への追従方法](docs/UPSTREAM.md) に書いてあります
- リリースの署名はしていません（署名鍵は未設定です）

## 🛠️ 自分でビルドする場合

- `./gradlew buildAndroid` を実行すると、`patches/build/libs/` に `.mpp` ファイルができます
- できたファイルは Morphe Desktop などから、他のパッチバンドルと同じように使えます
- 開発は `dev` ブランチで行い、`main` にマージすると安定版のリリースが作られます

## ❤️ 寄付

寄付は完全に任意です。使ってくれること、不具合を報告してくれることが一番の支援です。

もし開発の支援をしたい場合は、GitHub Sponsors からお願いします。

- [GitHub Sponsors](https://github.com/sponsors/Ayufa)

## ❤️ クレジット

- [Morphe](https://github.com/MorpheApp/)
- 土台は本家の [Morphe Patches テンプレート](https://github.com/MorpheApp/morphe-patches-template)です

## 📜 ライセンス

GPL-3.0（[LICENSE](LICENSE)）。[NOTICE](NOTICE) もあわせてご覧ください。
