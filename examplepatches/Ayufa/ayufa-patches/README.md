<p align="center">
  <a href="https://morphe.software/add-source?github=Ayufa/youtube-custom-patches">
    <img src=".github/assets/add-to-morphe.svg" alt="Morphe に追加" height="48">
  </a>
</p>

# Ayufa の YouTube 独自パッチ

Morphe 用に個人的に作っている、YouTube 向けの独自パッチ集です。
公式の Morphe パッチではありません。Ayufa 個人のリポジトリで開発しています。

本家のパッチ（[MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches)）と一緒に使う想定です。
本家のパッチで満足できなかったところ、自分が欲しい機能だけを少し足す、という位置づけです。

## 入っているパッチ

### ライブ遅延キーパー

| 項目 | 内容 |
|---|---|
| 対象 | YouTube **20.26.46**（Android 8.0 で動く最後の YouTube）と **21.30.216**（最新の推奨版） |
| 何をするか | ライブ配信を長時間つけっぱなしにしていると、再生位置が配信の先端から少しずつ遅れていきます。このパッチは再生中に定期的に遅れ具合を確認し、設定した秒数以上遅れていたら自動で先端（最新状態）まで進めます |
| 調整 | パッチ適用時に、確認間隔と「何秒遅れたら進めるか」を変更できます。さらに、適用後は Morphe 設定の「Ayufaパッチ設定」にある「ライブ配信を最新の状態に保つ」で、再パッチなしにオン/オフできます（その場で反映） |

使う場面の例：Android 8.0 の古い端末（SOV34 など）をライブ配信のつけっぱなし用にしていて、気づいたら数分遅れている、という場合の対策です。

### ライブチャットの余計な表示を隠す

| 項目 | 内容 |
|---|---|
| 対象 | YouTube **21.30.216**（本家が推奨している最新の安定版。最新の Android 向け） |
| 何をするか | ライブチャットに出てくる固定コメント（ピン留めされたメッセージ）やアンケート（投票カード）など、チャットを読むときに邪魔な表示を隠します |
| 調整 | パッチ適用時に、隠す項目を個別に選べます。さらに、適用後は Morphe 設定に専用の「Ayufaパッチ設定」画面ができ、その中の「固定メッセージ（バナー）を隠す」「アンケートを隠す」で、再パッチなしに切り替えられます（次にチャットを開いたときから反映） |

## 使い方

1. 上のボタンから、このリポジトリを Morphe のパッチソースに追加します
2. いつもどおり本家のパッチと一緒に、使いたいパッチを選んで適用します

- ライブチャットのパッチは YouTube **21.30.216** の APK に、ライブ遅延キーパーは YouTube **20.26.46** と **21.30.216** の APK に当ててください
- 対象以外のバージョンには当てられません（バージョンごとに動作を確認しているためです）

## 本家との関係

- 本家のリポジトリには、プルリクエスト・Issue・コメントなどを一切しません。見るだけ（読み取り専用）で使わせてもらっています
- 本家のパッチ自体の不具合は、ここでは直せません。このリポジトリの Issue は、この独自パッチについてのものだけにしてください
- ライセンスやクレジットは本家に従います（GPL-3.0）

## 本家の更新についていく仕組み

- 本家のパッチャーなどの依存更新は、Dependabot が定期的に知らせてくれます
- 本家の対応 YouTube バージョンが変わったら、GitHub Actions（upstream-watch）が検知して、このリポジトリの中にだけ Issue を立てます。本家側には何も書き込みません
- 詳しくは [本家への追従方法](docs/UPSTREAM.md) に書いてあります
- リリースの署名はしていません（署名鍵は未設定です）

## 🩹 パッチ一覧

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/Ayufa/youtube-custom-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.google.android.youtube`

**🎯 Supported versions:**

| 21.30.216 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide live chat clutter](#hide-live-chat-clutter) | Hides the pinned message banner and poll cards in live chat. Each can be toggled in Morphe settings (Ayufa patch settings) without re-patching. For YouTube 21.30.216. | • Hide pinned message banner<br>• Hide live chat polls |
| [Live latency keeper](#live-latency-keeper) | Periodically checks live stream playback and automatically seeks to the live edge when playback has fallen behind. Can be toggled in Morphe settings (Ayufa patch settings) without re-patching. For YouTube 20.26.46 (Android 8.0) and 21.30.216. Requires the official Morphe patches to be applied as well. | • Check interval<br>• Catch-up threshold<br>• Live edge safety margin |

</details>

<!-- PATCHES_END -->

## 自分でビルドする場合

- `./gradlew buildAndroid` を実行すると、`patches/build/libs/` に `.mpp` ファイルができます
- できたファイルは Morphe Desktop などから、他のパッチバンドルと同じように使えます
- 開発は `dev` ブランチで行い、`main` にマージすると安定版のリリースが作られます

## ライセンス

GPL-3.0（[LICENSE](LICENSE)）。土台は本家の [Morphe Patches テンプレート](https://github.com/MorpheApp/morphe-patches-template)です。[NOTICE](NOTICE) もあわせてご覧ください。
