> **?????v0.4.4?:** ???????????????OFF???????????????????v0.4.4??`preserveArticleWebStorage`?**??ON**??????????????????????????????

# NHK ONE 利用確認・用途／地域ポップアップ再表示 調査と修正設計

**状態:** 調査・設計のみ。実装・APK変更・公開・設定データ書換えなし。2026-11-21 JST。

## 結論

NHK ONEのCookie消失を引き起こし得る**元はてなアプリ側の削除処理を2箇所、実DEXで確認**した。広告フィルター原因説より証拠が強い。ただしNHKのCookieが本機で実際に消えたこと、およびどのCookie属性・ドメインが条件になるかは未測定。まず保存前後の**名前・存在・ドメイン・有効期限のみ**を比較し、値は読まず収集しない。

## 1. NHK側の一次情報と再現報告

- NHK公式（プレスリリース）：サービス利用時「ご利用にあたって」確認を案内。用途（世帯・事業・学校）／地域選択の導線あり。
  - https://prtimes.jp/main/html/rd/p/000000008.000160617.html
  - https://av.watch.impress.co.jp/docs/news/2025164.html
- NHK公式「ご利用情報の初期化」：https://portal.web.nhk/settings-reset 。初期化すると利用確認・用途・選択地域等が再設定対象とされる。検索経由で確認、サイト本体はrobots制限で直接取得できなかった。
- Chrome Cookieを比較した第三者検証：`consentToUse` と `z_at` が失われると未利用開始の状態に戻るとの観測。`area_permanent`、`authz_type` 等も記録。ただし名称の解釈は推定を含み、NHK公式による実装仕様開示ではない。
  - https://blog.curio-shiki.com/support/nhkone-cookie
- 公開プロジェクトのNHK API連携調査にも `consentToUse`、`z_at`、`area_permanent` などのCookieが登場する。ただし権利や認証状態を偽装する手法は採用せず、**Cookieの名称に関する補助的な先行調査**としてのみ扱う。
  - https://github.com/kongleiwork-art/japanese-news-reading-pwa/blob/main/docs/nhk-easy-api-integration-notes.md
- **未確定:** Cookieの正確なDomain/Path/Expires/SameSite/Secure属性、`www.web.nhk`・`news.web.nhk`・`portal.web.nhk` 間の実送受信経路、localStorage/IndexedDBへの用途・地域保存の有無、サーバー側の再表示条件。承諾ボタンを自動操作して調査しない。

## 2. はてなブックマーク 5.80 元APKの実測（DEX）

手元のオリジナルDEXダンプ `apk-inspection/hatena580-dexdump-all.txt` をクラス別に解析。

### A. 記事WebViewを閉じた際にCookieを全削除 — **確定**

```text
WebViewActivity.onDestroy()
  -> WebViewViewModel.clearWebViewCookie()
     -> ClearWebViewCookie.execute()
        -> CookieManager.getInstance()
        -> removeAllCookies(null)
        -> flush()
```

これは特定のNHK Cookieだけでなく、**アプリのWebView Cookie全体を削除する**。ユーザーが記事を閉じるたびにCookieが失われる説明として最有力。Android公式: https://developer.android.com/reference/android/webkit/CookieManager

### B. アプリプロセス起動時にHTML5ストレージ全削除 — **確定**

```text
BookmarkApplication.onCreate()
  -> new Thread(com.hatena.android.bookmark.b).start()
     -> BookmarkApplication.b()
        -> BookmarkApplication.onCreate$lambda$1()
           -> WebStorage.getInstance().deleteAllData()
```

削除はバックグラウンドスレッドで起動される。ページ読込とのレースを発生させる可能性がある。ただし、`deleteAllData()` はCookie削除APIではなくJSストレージ削除APIであり、**Cookieとは別原因**として測る。Android公式: https://developer.android.com/reference/android/webkit/WebStorage
OWASPの再現・解析: https://mas.owasp.org/MASTG/demos/android/MASVS-PLATFORM/MASTG-DEMO-0082/MASTG-DEMO-0082/

### C. 保存そのものを無効化してはいない — **確定**

- `WebViewExtensionsKt.setupView` は `setDomStorageEnabled(true)` を呼び出す。
- `WebViewActivity.onCreate` は `setAcceptThirdPartyCookies(webView, true)` を呼び出す。
- `WebViewActivity.onDestroy` に `clearCache(true)` もあるが、これはCookie/DOMストレージ削除と混同しない。
- 原アプリには `LoadWebViewCookie`（外部から受け取ったCookieを設定しflushする処理）も存在。NHKの保存問題を解くために、この処理を改造・上書きしない。

### D. 既存広告ブロックの影響 — **主原因を示す証拠なし**

- `AdBlockHelper.intercept` は**メインフレーム以外**のリクエストだけを対象に、ホスト名と例外リストを比較する。対象の場合は空応答にする。CookieManagerやWebStorageへの書込み・削除処理はない。
- `injectCss` は `onPageFinished` から<style>を追加するのみ（状態保存には触れない）。
- 2026-11-20 10:00:58Z生成の公開スナップショット（45,095ホスト）に`web.nhk`・`nhk.or.jp`・`news.web.nhk`・`portal.web.nhk`の遮断／例外はなし。`nhk`の文字列を含む14のランダムドメインはNHK運営とは無関係。
- 現行上流EasyList 78,748行にはNHK名に一致する公式ルール・例外なし（無関係な文字列14件のみ）、AdGuard Japanese Filter 13,522行もNHK一致0件。これは**取得時点のテキスト一致調査**であり、リダイレクト／別名のサードパーティ依存通信まで否定しない。
- ただし初回HTMLから必要なNHK認証関連APIや第三者リソースが別ドメインで呼ばれるなら、他の既存ホスト遮断が間接的に影響する可能性はゼロではない。実際のリクエストURLとタイミングを比較してから判断する。

## 3. 先行事例・一般知見

- Android CookieManager: `setAcceptCookie` の通常初期値はtrue、`setAcceptThirdPartyCookies` はWebView単位、`flush()` は現在アクセス可能なCookieを永続ストレージへ書き出すAPI。**flushだけでは意図的なremoveAllCookiesを防げない**。
  - https://developer.android.com/reference/android/webkit/CookieManager
- WebStorage.deleteAllData はJSストレージの明示的な消去処理。初期化時に呼ばれればサイトの保存データ持続を妨げる。
  - https://developer.android.com/reference/android/webkit/WebStorage
- OWASP WebView研究・デモはWebViewのCookie/HTML5ストレージの削除と保存確認手順を解説。
  - https://mas.owasp.org/MASTG/knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0018/
  - https://mas.owasp.org/MASTG/demos/android/MASVS-PLATFORM/MASTG-DEMO-0082/MASTG-DEMO-0082/
- GitHubのLightning Browserでは、`WebStorage.deleteAllData()` を明示的な `clearWebStorage()` に用いる実装例。
  - https://github.com/anthonycr/Lightning-Browser/blob/1a558208f696bb2823dd40a78055ea687d6ac7c0/app/src/main/java/acr/browser/lightning/utils/WebUtils.kt
- Apache Cordovaの実装例は第三者Cookie許可と `CookieManager.flush` を明示的に扱う。
  - https://github.com/apache/cordova-android/blob/9ceacf524003d2b89bff0e9514aaa9e88f6c23b0/framework/src/org/apache/cordova/engine/SystemCookieManager.java
- Reddit（androiddev／一般）MCPではストレージ永続化に関する検索結果を安定取得できず、取得範囲は部分的。BBSとHatena公開ブックマーク検索もNHKのこの症状を裏付ける具体例は見つからなかった。
- **Morphe/ReVancedの「NHK ONEの初回ダイアログ再表示」を直接直した公開パッチ・userscriptは見つからなかった。** 他サイトの自動同意・Cookie偽造を行うコードは目的外で、転用しない。

## 4. 原因の優先順位

| 順位 | 仮説 | 証拠の強さ／未確認点 |
|---|---|---|
| **1** | 記事WebView終了時の `removeAllCookies(null)` がNHK利用開始Cookieを消す | **削除動作自体はDEXで確定**。同じ端末で`consentToUse`等が消えるか未測定 |
| **2** | アプリ起動時の `WebStorage.deleteAllData()` がNHKの地域・用途などのクライアント保存値を消す | **削除動作自体は確定**。NHKがlocalStorage等を条件にしているか不明 |
| 3 | Cookieの属性、別オリジン、時限切れやNHKサーバーの判定により再確認 | 実際のCookie属性・リダイレクト時挙動は未測定 |
| 4 | 既存のホスト遮断でNHKサイトに必要な第三者リクエストを拒否 | **現状根拠弱い**。実通信の遮断ログ未収集 |
| 5 | CookieManager設定やDOMストレージ無効が原因 | 設定は明示的に有効。**現行コードとの整合性が低い** |

## 5. 修正候補の比較

| 案 | 変更内容／場所 | 利点 | リスク・検証 |
|---|---|---|---|
| **A. 保存データ維持（推奨・同意選択式）** | `WebViewActivity.onDestroy` の `clearWebViewCookie()` 呼び出しと、`BookmarkApplication.onCreate` の `deleteAllData()` 起動を、**利用者が許可した場合だけ抑止**する。既存の`clearCache(true)`は保持 | 原因に直接対応。CookieもJSストレージも自動消去せず利用者選択がそのまま残る | **他サイトのログイン・追跡データも残り得る**。全サイト共用の永続ストアなので、NHK限定の安全な例外化は容易でない。明示オプション既定OFFを推奨 |
| B. NHKに限って設定保持 | NHKサイトの状態のみ退避・復元する仕組み | 他サイトへの影響を縮小し得る | Cookie/資格情報の複製やデータ管理を増やす。復元時の認証・権限・セキュリティ懸念が大きい。**採用しない**（自動生成・偽造・復元禁止と衝突し得る） |
| C. NHK記事を外部ブラウザで開く | WebViewActivityのNHKリンクを既存ブラウザへ渡す | アプリのサイトデータ消去から分離できる | 内蔵ブラウザの操作性を失い、アプリ外の既存状態に依存する。アプリ内表示を望む場合には不適 |
| D. CookieManager.flush追加のみ | `onPageFinished`等でflush | 変更小 | 明示的な `removeAllCookies` の後では効果なし。**採用しない** |
| E. NHKの通信例外・CSS除外 | `AdBlockHelper`にサイト別例外 | 実際に遮断されている場合は有効 | 現時点でNHKサイト固有の遮断は未検出。不要な例外を追加しない |

**推奨はA。ただし、検証でCookie削除→再表示の因果が確認できた場合に限って実装**。プライバシー上、保存データ維持は**既定OFF**、既存の明示的なログアウト／データ消去操作は残す。グローバルな削除処理の変更なので「NHKだけ保存」と誤表記しない。

## 6. 実装する場合の最小変更設計

- `patches/src/main/kotlin/dev/rikunode/hatenabookmark/` の新規パッチ、または記事WebView関連既存パッチに**独立したboolオプション** `preserveArticleWebStorage`（既定false）を設ける。
- まず `WebViewActivity.onDestroy` 内の `WebViewViewModel.clearWebViewCookie()` 呼び出しを、オプションON時のみスキップ。DEXメソッド名・呼び出し位置・レジスタ整合性を厳格にガードし、違うAPKではパッチ適用自体を拒否する。
- 次に `BookmarkApplication.onCreate` のバックグラウンド `WebStorage.deleteAllData()` 起動箇所を、オプションON時のみスキップ。**他の初期化ロジックは保持**。元のアプリ側で必要な手動クリア機構は維持する。
- `CookieManager.setAcceptCookie(true)`、`setAcceptThirdPartyCookies(true)`、`setDomStorageEnabled(true)` は既に状態が適合するため追加・変更しない。
- `AdBlockHelper`、フィルター変換器、スナップショット形式、CSS、document-startやシムには触れない。
- 実際に変更するには、まず`clearWebViewCookie()`呼び出し以外の削除契機やログアウト条件を再確認。全サイトのデータ維持という影響を明示する。
- 小規模実装の概算: バイトコードパッチ約40–100行、独立オプションとメタデータ数十行、重点テスト約50–100行。詳細位置ガード次第で変動。

## 7. 検証計画（エミュレータと実機）

**前提:** ユーザーがNHKの案内を自分で確認・選択し、必要な法的・サービス上の条件を満たした状態に限る。自動入力・送信、同意状態の生成・改変、Cookie値のコピー・復元、権限の迂回を行わない。

1. **ベースライン、読み取りのみ:** 既存MorpheにてNHK ONEニュース記事を開き、利用者が通常の画面操作で設定する。WebViewデバッグ（テスト専用）でCookieの**名前・ドメイン・有効期限・属性と有無**だけを確認し、値は取得・保存しない。localStorage/IndexedDBも**存在するキー名と件数**に限定（個人データを読まない）。
2. 同じページ内の再読み込み→記事画面を閉じる→別記事を開く→アプリのプロセス終了・再起動→再訪、の順で、ポップアップ有無とCookieの**存在差分**を観察。NHKドメインをまたぐリダイレクトの有無も記録。
3. WebViewを閉じた直後に `consentToUse` / `z_at` 等の存在が消える場合は、`onDestroy`の削除処理との因果を支持。アプリ再起動後にlocalStorageのキーが消えるなら`deleteAllData`と整合。正常なChrome等の外部ブラウザでも同URLを比較し、サイト固有の自然な失効と切り分ける。
4. **テストAPK（分離worktree）**でオプションOFF/ONを比較。対象記事を繰り返し開閉・アプリ再起動し、利用者が実際に選択した設定が保持され再表示しないか確認。ニュース本文・リンク・戻る操作、他サイトの保存挙動、ログアウト時の消去挙動を重点的に検証。
5. 通信原因が疑われる場合だけ、広告遮断ON/OFFの**リクエスト先ホストと遮断結果**を比較。ホストの例外追加は証拠が得られるまで行わない。
6. **合格条件:** ONの時、初回手動設定後に通常の再読込・記事閉鎖・アプリ再起動を経ても、再確認の不要な再表示が生じない。OFFでは従来動作に変化なし。手動のサイトデータ消去が妨害されない。他サイト表示・安全性回帰PASS。
7. 署名・ビルド・インストールを伴う作業は別途承認後に限定。実機の既存アプリデータを消去しない。検証に使う分離アプリのデータにも破壊的操作を行う前に影響を明示する。

## 8. 未解決事項と承認境界

- NHKがどのホスト・Cookie属性・ストレージへ何を保存しているかは**はてなWebView実測前は未確定**。
- `onDestroy` Cookie全消去と起動時WebStorage削除は実装目的（プライバシー保護など）があり得る。**これらを停止すればNHK以外のサイト情報も持続する**ことをオーナーが承認する必要がある。
- 修正対象がNHKだけの例外ではなく、内蔵WebView全体の保存ポリシー変更になる点に注意。
- 実装は設計検収とオーナーの明示承認があるまで行わない。

**最終推奨:** 第1段階は対象Cookieの存在・消失の観測。因果を確認した場合だけ、記事終了時のCookie全消去とアプリ起動時のWebStorage全消去を独立既定OFFオプションで抑止する最小パッチを承認対象とする。
