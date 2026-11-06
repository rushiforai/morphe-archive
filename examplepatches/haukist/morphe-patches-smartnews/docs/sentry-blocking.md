# Sentry 遮断の実装と調査手順

## 対象と結果

2026-11-06 に SmartNews **26.10.30**（検証 APK の versionCode 1147）、Pixel 8 で確認した記録です。将来の別 APK の動作保証は含みません。

ホームの Morning Package と記事用 SmartView の Sentry 要求をアプリ側で遮断し、通常版 APK をデータ保持で実機へ適用しました。ホームのカルーセル・ニュース一覧・記事本文の表示を確認しています。

## 記事側の対策だけでは止まらなかった理由

| 項目 | 記事用 SmartView | ホームの Morning Package |
|---|---|---|
| Sentry の所在 | 記事テンプレートの外部 Loader | `mp.smartnews.com/carousel/` の Next.js バンドルに組み込み |
| プロジェクト ID | 1412497 | 5822397 |
| 主な送信先 | `o127165.ingest.us.sentry.io` | `o127165.ingest.sentry.io` |
| 実クライアント（検証 APK） | `d1j` | `ki2` |

Morning Package では、実機の読み込み済みスクリプトと実行中 Sentry SDK 8.55.2 のクライアント設定から送信先を確認しました。APK 内に送信先文字列が見つからなくても、サーバーから配信される JavaScript の動作は除外できません。

旧 WidgetLinkCell の `ck1` は別のクライアントでした。候補へのパッチはビルドテストを通っても Morning Package の通信を止められず、実機でホストと実クライアントを対応付けたことで対象を確定できました。最終パッチにはこの旧候補への変更を含めていません。

`SmartView.Parameters.preconnects` の生成元も追跡しましたが、この APK では SmartNews の静的アセット用ホストのみで、Sentry の発生源ではありませんでした。

## パッチの動作

- `SentryRequestBlocker` が Android `Uri` から HTTP(S) のホストを取り出し、ROOT ロケールの小文字化・末尾ドット除去後にドメイン境界で判定します。
- `sentry.io` / `sentry-cdn.com` とそのサブドメインだけを対象にします。`notsentry.io`、`sentry.io.example.com`、通常 URL のパス・query にある単語 `sentry` は対象になりません。
- 遮断時は本文 0 バイトの HTTP 204 を返します。CORS の origin・method・header 応答も含め、OPTIONS と POST を端末内で処理します。
- 共有ページクライアントの WebResourceRequest 版と、記事クライアントの WebResourceRequest / String 両版の先頭で判定し、非 Sentry 要求は元の処理へ戻します。
- 共有ページクライアントは framework callback と `getOriginalUrl` / `isForMainFrame` 参照等から構造的に照合します。パッチのセレクターに難読化名 `ki2` は使いません。
- 不正な `https://about:blank#...` を作っていた HTML 文字列置換は廃止しました。
- 既存の広告フィルターは型・フィールドをメタデータから解決し、ART が直列化するクラス初期化内で一度だけ作成します。その後の設定更新は維持し、要求ごとの初期化競合を避けます。
- 未知の APK でレジスターや初期化構造が前提と異なる場合は、適用時に停止します。引数レジスターを無条件に拡張して動作を推測する設計にはしていません。

実装ファイル：

- [遮断ヘルパー](../extensions/extension/src/main/java/app/template/extension/smartnews/SentryRequestBlocker.java)
- [パッチ](../patches/src/main/kotlin/app/template/patches/smartnews/ads/DisableAdsAndTrackersPatch.kt)
- [対象クライアントの照合](../patches/src/main/kotlin/app/template/patches/smartnews/ads/Fingerprints.kt)

## 検証結果

### 自動テスト・レビュー

- ホスト境界・正規化・トルコ語ロケール：3 テスト成功、失敗・スキップ 0。
- APK E2E：1 テスト成功、失敗・スキップ 0。standalone と split base の両方で、拡張の梱包、実クライアントの先頭フック、元の fallback、記事側の両 overload、フィルター初期化を検査しました。
- E2E 内の難読化名は、固定入力 26.10.30 に対する独立した期待値です。版を更新する際は実行経路も再確認します。
- Gemini 3.8 Flash Medium で差分をレビューし、Git diff に含まれない新規 Java ファイルも別途レビューしました。指摘は実コード・DEX と照合し、確認できた不正 URI・初期化競合・CORS 応答不足を修正しました。

### 実機

Morning Package から、Cookie・Referer・実イベント本文を付けない検証要求を出しました。Chrome 全体の URL ブロックや別の CDP インターセプトは使っていません。

| 検証要求 | 結果 |
|---|---|
| ingest の空 POST（カスタムヘッダー付き） | 204、本文 0 バイト |
| その CORS OPTIONS | 204 |
| Sentry CDN の GET | 204、本文 0 バイト |
| 大文字・末尾ドット付き ingest ホスト | 204、本文 0 バイト |

18:21 JST 以降の修正済み診断版と、18:26 JST 以降の通常版で、SDK 自身の ingest 要求および記事側 CDN 要求のアプリ内ブロックログも確認しました。18:29 JST の TrackerControl DB 検査では、修正済み版の検証開始後に新しい Sentry 接続記録の更新は **0 件**でした。VPN サービスは稼働中で、過去の履歴は消去していません。

今回実機へ適用した通常 APK の SHA-256：

```text
f215dde16914e0a79c50dfa7116a3250453a600c0c2d6e0660da5d45a93eb699
```

インストール済み APK と配布用ファイルのハッシュ一致、通常版に WebView 診断呼び出しがないことを確認しました。これは今回の成果物のハッシュで、再ビルド時の再現一致を保証する値ではありません。

## 調査を再開する手順

1. **基準を保存する。** APK のハッシュ・署名・版・接続時刻を記録し、既存の未コミット変更を保持します。TrackerControl の過去履歴と新規更新を分けます。
2. **実行中のページを先に特定する。** ホーム・記事等の WebView URL と実クライアントを対応付けます。静的解析で見つけた候補だけでパッチを作り始めないでください。
3. **必要なら明示的に診断ビルドを作る。** 通常ビルドでは無効です。

   ```powershell
   .\gradlew.bat :patches:test --tests "app.template.patches.smartnews.ads.DisableAdsAndTrackersPatchTest" -PsentryDiagnostics=true --rerun-tasks
   ```

   このコマンドも通常と同じ成果物名を使います。既存の通常 APK/APKS を保管し、診断成果物は別名で管理してください。同じ署名の診断版は `adb install -r` でデータを保持して更新できます。

   起動後に通常の記事を一つ開くと、記事 WebView の初期化時にデバッグを有効化し、`SmartNewsWebViewDiag` に `host=... client=...` を記録します。URL の query や本文はログに出しません。ホームだけの起動では、この診断初期化点を通らない場合があります。
4. **実際に読み込まれたコードを追う。** 対象アプリのローカル WebView CDP から、ページ・読み込み済みスクリプト・SDK 設定を確認します。静的な文字列検索の不検出を、遠隔配信コードの不在と混同しないでください。REA が Android WebView の CDP 応答を扱えない場合も、対象を変えずにローカル CDP で観測します。
5. **実クライアントを起点に静的解析する。** その callback、親クラス、元の fallback を確認してフックを選びます。APK 生成テストは正しい実行経路への到達を単独では証明しません。
6. **端末内応答と接続記録を突き合わせる。** 実データを使わない POST/OPTIONS/GET、ブロックログ、同じ時刻窓の TrackerControl 記録を確認します。DNS の共有 IP 表示、SNI の確認、イベント本文の到達は別の証拠です。
7. **通常版へ戻す。** `-PsentryDiagnostics=true` を付けずに通常ビルドを再生成し、同じ署名で更新します。ローカル転送と一時ログ設定を解除し、通常 APK のハッシュと画面を確認します。

ブロックログだけを一時的に確認する場合：

```powershell
adb shell setprop log.tag.SmartNewsSentryBlock DEBUG
adb logcat -s SmartNewsSentryBlock:D
# 元の設定が空だった場合の復元
adb shell "setprop log.tag.SmartNewsSentryBlock ''"
```

## 特定に時間がかかった理由と改善点

最大の要因は、実行中の WebViewClient の直接確認を後回しにし、静的候補を追いすぎたことです。記事用とホーム用に別の Sentry があり、ホーム用のコードは APK の外から届いていました。さらに、旧 WidgetLinkCell と実際の共有ページクライアントを取り違えていました。

JAVA_HOME の不整合や Android WebView の CDP 応答への対応も時間を使いましたが、調査順序の問題とは分けて考えます。次回は **実ページとクライアントの対応付け → 読み込み済み SDK 設定 → 静的な callback 追跡 → パッチ → 実機の同じ要求で再検証** の順に進めます。
