# zeta-morphe-patches

[Morphe](https://github.com/MorpheApp) パッチフレームワークを使用した、AIチャットアプリ **『zeta: AI Chat, Story, Play』** (`com.scatterlab.messenger`) 向けのカスタムパッチリポジトリです。

---

## 🌟 搭載パッチ一覧

<!-- PATCHES_START -->
> **[v1.4.1](https://github.com/kubobeem2/zeta-morphe-patches/releases/tag/v1.4.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Zeta: AI Chat, Story, Play&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**Package name:** `com.scatterlab.messenger`

**🎯 Supported versions:**

| 3.51.63 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block Ads](#block-ads) | Zeta アプリ内のバナー広告、インタースティシャル広告、リワード広告SDKのロードを遮断・無力化します。 |  |
| [Bypass PairIP License Paywall](#bypass-pairip-license-paywall) | PairIP のライセンスペイウォール（Google Play「このアプリを Play から入手」画面）を無効化し、再署名・サイドロードしたアプリでもそのまま使えるようにします。Java のライセンスチェックとネイティブの Play Integrity autoprotect 呼び出しの両方を止めます。 |  |
| [Clone Zeta (Change Package Name)](#clone-zeta-change-package-name) | パッケージ名を app.zeta.messenger に変更し、Google Playの監視や「Google Playから入手してください」の整合性チェックを回避します。 |  |
| [Hermes Persistent Memory](#hermes-persistent-memory) | キャラクター別・ユーザー別の永続記憶をローカル管理し、チャットメッセージにプロンプトとして自動注入します。画面上HUDからON/OFF切り替え可能です。 |  |
| [LLM Tokens Per Second Monitor](#llm-tokens-per-second-monitor) | チャット生成時の t/s (Tokens Per Second) をリアルタイム計測し、画面上部にフローティングHUDバッジで表示します。 |  |
| [Unlock Client Restrictions](#unlock-client-restrictions) | メッセージ入力文字数制限（maxLength）の緩和およびクライアント側の送信クールダウン待機時間を解除します。 |  |

</details>

<!-- PATCHES_END -->

---

## 🧠 Hermes Persistent Memory について

画面上に表示されるフローティングHUD（`⚡ 0.0 t/s | Mem: ON`）をタップすることで、設定ダイアログが表示されます：
- **Hermes Memory ON/OFF スイッチ**: 一時的に記憶注入を無効化したい場合にワンタップで切替可能
- **User Profile (USER.md)**: AIに覚えておいてほしいユーザー情報や口調の好みを直接編集・保存可能
- **キャラ別記憶**: アプリ内部ストレージ (`/data/data/com.scatterlab.messenger/files/hermes/`) に保存され、対話ごとに蓄積

---

## ⚡ LLM Tokens Per Second (t/s) モニター

チャットストリーミング受信時に、リアルタイムでトークン生成速度（t/s）を計算して画面上に表示します：
- 瞬間速度（Instant t/s）と平均速度（Avg t/s）
- 生成総トークン数（CJK / 英語のBPE推定）
- 生成所要時間（秒）

---

## 🚀 ビルドとリリース

本リポジトリは GitHub Actions (`.github/workflows/release.yml`) による自動セマンティックリリースに対応しています。
`kubobeem2/zeta-morphe-patches` として GitHub に push すると、CI 上でパッチバイナリ（`.mpp` および `.mpe`）が自動ビルドされ、GitHub Releases に公開されます。

### 手動ビルド
```bash
./gradlew build
```
MorpheApp の GitHub Packages へのアクセス権限を持つ `GITHUB_TOKEN` が設定されている環境でビルドを実行できます。
