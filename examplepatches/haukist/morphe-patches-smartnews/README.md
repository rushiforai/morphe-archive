# 🧩 SmartNews Morphe Patches (`morphe-patches-smartnews`)

SmartNews Android 版（`jp.gocro.smartnews.android`）向けの [Morphe Patcher 2.0](https://github.com/MorpheApp/morphe-patcher) パッチ集リポジトリです。  
広告やトラッカー SDK の完全遮断、記事共有時のオリジナル URL 直接共有・高速化、ポップアップメニュー化、およびスタンドアロン APK への自動統合と Google Maps 雨雲レーダー修復を提供します。

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=haukist/morphe-patches-smartnews

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/haukist/morphe-patches-smartnews/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 SmartNews&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `jp.gocro.smartnews.android`

**🎯 Supported versions:**

| 26.10.30 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Direct article share URL](#direct-article-share-url) | Shares and copies the original article URL directly instead of SmartNews tracking redirect links (l.smartnews.com). |  |
| [Disable ads and trackers](#disable-ads-and-trackers) | Disables first-party and third-party advertisements, analytics, and tracking SDKs in SmartNews. |  |
| [Popup share menu](#popup-share-menu) | Restores the legacy popup share menu when tapping the top-right share button, replacing the default system share sheet (identical to the menu used in web mode). |  |

</details>

<!-- PATCHES_END -->

---

## ❓ 主な機能とパッチ詳細 (Features)

### 1. 広告および全 15 種類トラッカーの完全無効化 (`Disable ads and trackers`)
SmartNews 内部のファーストパーティ広告制御、および同梱されているサードパーティ製 SDK（計 15 種類）をバイトコード（Smali/DEX）レベルで無力化します。

* **SmartNews ファーストパーティ広告 & 統合フィード広告**:
  - `isAdsInsertionEnabled` / `Delivery.isAdEnabled()` 等のフラグを強制 `false` 化
  - 統合フィード（`BlockItem`）内のインライン広告プレースホルダおよび広告生成ファクトリ（`AdImpl$Companion` 等）を根元から遮断し、`*.smartnews-ads.com` へのメディア読込・通信を完全阻止
  - SmartView（記事画面）の広告挿入および `<link rel="preconnect">` リストの無力化
  - 天気画面の広告設定（`AdsInWeatherConfig`）の無効化
  - フィード・スマートビュー・インタースティシャル・プレミアム広告の割当・プリフェッチ・ビーコン送信を早期リターン（No-Op 化）
* **外部 SDK の完全遮断（計 15 種）**:
  - **Adjust**: 初期化・トラッキング・広告収益送信を無力化、`isEnabled = false`
  - **Amazon Ad (TAM / APS)**: 初期化・バナー/動画リクエストを No-Op 化
  - **Facebook Ads (Audience Network)**: 初期化・広告ロード無効化
  - **Facebook SDK & AppEvents**: 初期化・イベント送信・ロギングを無力化
  - **Google AdMob / Google Ad Manager (GAM)**: 初期化・AdLoader・バナー/インタースティシャル/リワード広告ロードを無力化
  - **Google Crashlytics**: クラッシュレポート・例外送信を遮断、`isEnabled = false`
  - **Google Firebase Analytics & AppMeasurement / sGTM**: `logEvent`・`setUserProperty`、クライアント実行キュー、バッチアップロード（`app-measurement.com` / Server-Side GTM `sGTM`）、`TagManagerService` 連携を完全遮断
  - **NTTドコモ OpenID Connect SDK (GA4 Measurement Protocol)**: 内蔵 GA4 MP クライアント（`www.google-analytics.com/mp/collect` へのテレメトリ直接送信）を完全遮断
  - **IAB Open Measurement (OMSDK)**: 全 8 社のバンドル OMSDK セッション開始・アクティブ判定を無効化
  - **InMobi**: 初期化・バナー・インタースティシャル・ネイティブ広告ロードを無効化
  - **OpenTelemetry (OTel)**: 初期化を SmartNews 内蔵の No-Op プロバイダへ差し替え
  - **Pangle (ByteDance OpenAdSDK)**: 初期化・各広告フォーマットロードを無効化
  - **Prebid Mobile**: 初期化・デマンド取得およびリモート設定パーサーを無力化
  - **Confiant & AppHarbr**: 広告検証・トラッキング SDK を無力化
  - **Vungle / Liftoff Monetize & AdsByNimbus**: 初期化・広告ロード・リモート設定パーサーを完全無力化

* **WebView 内の Sentry 通信遮断**:
  - ホームの Morning Package と記事用 SmartView の両方で、`sentry.io` / `sentry-cdn.com` およびそのサブドメイン宛ての HTTP(S) 要求を端末内の空レスポンス（HTTP 204）で処理
  - ホスト名を正規化して判定し、通常の記事 URL のパスや query に `sentry` が含まれるだけでは遮断しない
  - Morning Package 本体のページ・機能は維持。SmartNews 26.10.30 / Pixel 8 でホーム・記事表示、POST/OPTIONS/GET の遮断と新規 Sentry 接続更新 0 件を確認
  - [実装・検証結果と今後の調査手順](docs/sentry-blocking.md)

---

### 2. 記事共有時のオリジナル URL 直接共有・高速化 (`Direct article share URL`)
* 公式仕様では共有時に短縮・トラッキング URL（`http://l.smartnews.com/*`）が生成されていましたが、アプリ内部のフォールバック処理を常時有効化。
* **元の記事のオリジナル URL が直接コピー・共有**されます。

---

### 3. 以前のポップアップ共有メニューを復元 (`Popup share menu`)
* 右上の共有ボタンをタップ時に、以前のバージョンにあったポップアップ共有メニューを呼び出すように変更します。現在の「オリジナルサイト閲覧時右下にある共有メニュー」と同じです。

---

### 4. Split APK のスタンドアロン APK 統合 (`ApkMerger`)
* 公式配布の分割 APK (`base.apk` + `split_config.arm64_v8a.apk` + `split_config.xxhdpi.apk`) を 1 つのスタンドアロン APK へ自動マージ。
* `AndroidManifest.xml` 内のスプリット必須宣言（`isSplitRequired="true"` 等）を自動サニタイズし、通常の `adb install` や OS 標準のインストーラーで直接インストール可能。

---

### 5. Google Maps 雨雲レーダー修復 (独自の API キー注入)
* APK 再署名に伴い公式 Google Maps API キーのパッケージ/証明書制限で雨雲レーダーの地図背景が空白（`403 Forbidden`）になる問題を、ユーザー独自の API キー注入機能により解決。
* `android:extractNativeLibs="false"` によるネイティブライブラリ（`.so`）の非圧縮および **4096 バイト（4KB）ページアライメント**を維持するため、`RandomAccessFile` によるバイナリ直接インプレース置換を採用。

---

## 📱 対応バージョン (Compatibility)

| 項目 | 設定内容 |
|---|---|
| **対象アプリ** | SmartNews (`jp.gocro.smartnews.android`) |
| **検証済みバージョン** | `26.10.30` (VersionCode: `2610300`) |
| **対象アーキテクチャ** | `arm64-v8a` |

---

## 🚀 ビルド・パッチ適用手順 (How to Build & Patch)

### 1. 前提条件
- **JDK**: Adoptium JDK 17, 21, または 25
- **Gradle**: 付属の Gradle Wrapper (`gradlew.bat` / `./gradlew`)
- **対象 APKS**: `SmartNews_26.10.30.apks`（作業ディレクトリ直下またはリポジトリ親ディレクトリに配置）
- **(任意) Google Maps API キー**:
  - 雨雲レーダーの地図背景を表示する場合、Google Cloud Console で「Google Maps SDK for Android」を有効化した API キーを取得。
  - プロジェクトルート（または親ディレクトリ）の `.env` に記載：
    ```env
    GOOGLE_MAPS_API_KEY=AIzaSy...
    ```

### 2. パッチ・ビルドの全自動実行
以下のテストコマンドを実行するだけで、APK マージ、パッチ適用、インプレース API キー置換、署名、アライメント検証、スタンドアロン APK 生成が全自動で完了します：

```powershell
# Windows (PowerShell)
.\gradlew.bat :patches:test --tests "app.template.patches.smartnews.ads.DisableAdsAndTrackersPatchTest" --rerun
```

```bash
# Linux / macOS
./gradlew :patches:test --tests "app.template.patches.smartnews.ads.DisableAdsAndTrackersPatchTest" --rerun
```

生成成果物:
- `SmartNews-26.10.30-standalone-patched.apk` (スタンドアロン APK / 推奨)
- `SmartNews-26.10.30-patched.apks` (全スプリット再署名済み APKS)

Sentry のホスト判定テストと、standalone / split base の両方の DEX フック検証を含めて実行する場合：

```powershell
.\gradlew.bat :extensions:extension:testDebugUnitTest :patches:test --tests "app.template.patches.smartnews.ads.DisableAdsAndTrackersPatchTest" --rerun-tasks
```

WebView 診断は通常ビルドでは無効です。調査用の `-PsentryDiagnostics=true`、実クライアントの確認方法、通常版へ戻す手順は [Sentry 調査手順](docs/sentry-blocking.md#調査を再開する手順) を参照してください。

### 3. Morphe パッチバンドル (`.mpp`) のビルド
Morphe Manager や Morphe Desktop で利用可能なパッチバンドルをビルドする場合：

```bash
./gradlew buildAndroid
```
生成物: `patches/build/libs/patches-*.mpp`

---

## 📲 端末へのインストール

同じ署名鍵で作成したパッチ版からの更新は、`adb install -r` でデータを保持できます。更新のためにアンインストールする必要はありません。

公式版 SmartNews がすでにインストールされている場合は署名競合が発生するため、事前にアンインストールしてください。

```bash
# 既存の公式版をアンインストール
adb uninstall jp.gocro.smartnews.android

# パッチ適用済みスタンドアロン APK をインストール
adb install -r SmartNews-26.10.30-standalone-patched.apk
```

---

## 🧑‍💻 開発 & リリース運用 (Dev Usage)

Morphe Patches テンプレートの設計規約に従います：

- **すべての開発・コミットは `dev` ブランチで行います。**
- コミットには [Conventional Commits](https://www.conventionalcommits.org/) を使用します：
  - `feat: ...`（新機能追加 → 自動プレリリース作成）
  - `fix: ...`（バグ修正 → 自動プレリリース作成）
  - `chore: ...`（リリースを作成しない作業）
- `dev` ブランチへのプッシュにより GitHub Actions（`release.yml`）がプレリリース版を自動公開します。
- 安定版をリリースする準備ができたら、`dev` ブランチを `main` へマージします（マージコミットのみ、squash 不可）。
- `patches-list.json` や `CHANGELOG.md` などの生成ファイルは CI が自動更新するため、手動コミットしないでください。

---

## 🔄 新バージョン追従手順

今後 SmartNews の新バージョン（例: `26.11.x` 等）に対応する場合の手順：

1. **新バージョンの `.apks` を配置**:
   - `SmartNews_<new_version>.apks` を配置。
2. **`Constants.kt` のバージョン更新**:
   - `patches/src/main/kotlin/app/template/patches/shared/Constants.kt` の `AppTarget` に新バージョンを追加。
3. **ビルドテストの実行**:
   - `./gradlew :patches:test ...` を実行。
   - 難読化によってメソッドシグネチャが変わったフィンガープリントがあれば、テストログに「Fingerprint resolution failed」として表示されます。
   - 対象のフィンガープリントのみ `Fingerprints.kt` でオペコードや参照文字列を調整します。

---

## 📜 ライセンス (License)

本プロジェクトは [GNU General Public License v3.0](LICENSE) の下で公開されています。
