# フォントの解析

## 対象

- LINE 26.16.0
- versionCode 261600106
- package `jp.naver.line.android`
- arm64-v8a

難読化されたクラス名（`j7.e` など）は 26.16.0 での名前で、版ごとに変わる。fingerprint には使わない。

## 結論

LINE の公式フォント設定（`com.linecorp.line.premiumfont`、LYP プレミアム向け）は、選んだフォントを LINE 自身の ContentProvider から downloadable font として読み込む。androidx の FontProvider は、provider を持つアプリの署名を `@array/fonts_certs` の公式証明書と比べる。再署名版では一致しないため、フォントを適用できない（issue #30）。

- 照合は androidx の FontProvider（`j7.e.b`）で行われ、OS 側の `android.provider.FontsContract` は通らない。DEX の書き換えで直せる
- 契約の判定は LYP の契約状態とサーバーのトークンで行われ、署名とは関係ない。照合だけを直せば、契約者は再署名版でも公式どおりに使える
- 全 Activity に当てるテーマと Compose の既定フォントは、どちらも同じ provider に「選択中のフォント」（query `-1`）を問い合わせる。provider が返すファイルを差し替えれば、手持ちのフォントを View と Compose の両方に当てられる

## 適用の仕組み

1. 起動時の初期化タスク `RegisterPremiumFontThemeApplierTask`（文字列で一意。26.16.0 では `fo8.q`）が、`fx4.p.a(Continuation)` の結果で分岐する
   - 実装 `premiumfont.data.usecase.d.a` は、契約がなければ選択を既定（`"Default"`）へ戻して `false` を返す
   - 契約があれば、フォントのメタ情報を同期し、ファイルの有無を確かめた結果を返す
2. 結果が `true` のときだけ、`Application.registerActivityLifecycleCallbacks(ax4.t)` を呼ぶ
3. `ax4.t.onActivityCreated` は `Activity.setTheme(R.style.premium_font)` だけを呼ぶ
4. `style/premium_font` の中身は AppCompat の属性 `fontFamily`（`0x7f0402de`）=`@font/premium_font` だけ。framework の `android:fontFamily` ではない
5. `res/font/premium_font.xml` は downloadable font

| 属性 | 値 |
| --- | --- |
| `fontProviderAuthority` | `jp.naver.line.android.premiumfont` |
| `fontProviderPackage` | `jp.naver.line.android` |
| `fontProviderQuery` | `-1` |
| `fontProviderCerts` | `@array/fonts_certs` |

Compose 側は `c92.c.b(Context)` が同じ authority・package・query・証明書で DownloadableFont（`c92.a`）を作り、LINE の Compose テーマへ渡す。こちらは契約の判定を通らない。選択がないときは provider がファイルを返さず、既定のフォントに戻る。

選択を変えると「再起動して変更」になり、`vx4.c.a` が全 AppTask を閉じて `SplashActivity` を起動し直す。

## 取得経路

androidx 相当の対応（26.16.0）:

| 難読化名 | 相当 |
| --- | --- |
| `j7.f` | `FontRequest` |
| `j7.l` | `FontsContractCompat` |
| `j7.k` | `FontRequestWorker` |
| `j7.e` | `FontProvider` |

1. `j7.l.a` → `j7.k` → `j7.e.a` → `j7.e.b`（provider の照合）→ `j7.e.c`（問い合わせ）
2. `PremiumFontProvider.query` は `MatrixCursor(_id, font_weight)` を返す。行は `[query, 400]` と `[query, 700]` の 2 行
3. `PremiumFontProvider.openFile` は coroutine `PremiumFontProvider$a$a.invokeSuspend` で処理する
   - 要求 URI の scheme と authority が provider 自身のものと一致するか確かめる
   - `kx4.c.a(Uri, Continuation)` が `File` を返す。URI の末尾が `-1` なら選択中の ID を読み、`1<id>` は full、`2<id>` は subset を表す
   - `ParcelFileDescriptor.open(file, MODE_READ_ONLY)` で返す。`File` が null なら null を返す（既定のフォントに戻る）

フォントファイルは `filesDir/premium_font/<fontId>/<font|font_subset>_<hash>.ttf` に置かれる。`font` は CDN から ZIP で落とし、先頭のエントリを展開する。設定の「全フォント削除」は `premium_font/` を丸ごと消す。

別系統の `DownloadableFontProvider`（authority `jp.naver.line.android.fonts`）は、ホーム用のダウンロードフォントを扱う。同じ `fonts_certs` で照合するので、再署名の影響も同じ。

## 証明書の照合

`j7.e.b(PackageManager, FontRequest, Resources) → ProviderInfo`:

1. `ProviderInfo` のキャッシュにあれば、それを返す
2. `resolveContentProvider(authority, 0)`。null なら `NameNotFoundException("No package found for authority: ")`
3. `providerInfo.packageName` が要求の package と違えば `NameNotFoundException("Found content provider …, but package was not …")`
4. `getPackageInfo(packageName, GET_SIGNATURES).signatures` の DER バイト列を並べ替え、`fonts_certs` の証明書セットと 1 件ずつ比べる。サイズと全要素が一致したセットがあれば `ProviderInfo` を返す
5. どれとも一致しなければ null。結果は status 1（WRONG_CERTIFICATES）、失敗コード -2 になる

`fonts_certs` は 3 セットで、各 1 証明書を持つ。

| array | 発行先 | SHA-256 の先頭 |
| --- | --- | --- |
| `fonts_cert_debug` | CN=Android Debug（公開されている debug 鍵） | `d31cd833` |
| `fonts_cert_release_2011` | NaverJapan | `e682fe0b` |
| `fonts_cert_release_2022` | LINE Corp、CN=LINE Android | `e6e8036e` |

Morphe で再署名した APK の署名は `CN=Morphe`（SHA-256 `24b512b8…`）で、どれとも一致しない。

失敗したときの見え方:

- 公式のフォント設定でフォントを選ぶと、検証（`dx4.f.j` が `FontsContractCompat` で Typeface を取得する）が失敗する。「フォントを適用できませんでした」のトースト（`line_fontsettings_toast_temporaryerror`）が出て、選択は保存されない
- Compose の既定フォントの読み込みは、選択がなくても毎回失敗している。`IllegalStateException("Failed to load DownloadableFont(...) (reason=-2, ...)")` で coroutine を cancel する。それでもアプリは既定のフォントで動いている

## 契約の判定

- 設定メニューの表示は feature flag `function.premium.common.font` と `ax4.i.c()` で決まる
- 契約は `be3.k.j(se3.b.FONT)` が判定する。未契約・期限切れ・ファイル欠損では、起動時の検証（`usecase.d`、`fx4.k0`、`fx4.d0`）が選択を `"Default"` へ書き戻す
- ダウンロードには、サーバー（`/EXT/talk/asset-meta-server/thrift/fontService` の `getAccessToken`）が出すトークンが要る

どれも署名には依存しない。照合を直しても、未契約の利用者がプレミアムフォントを使えるようにはならない。

## 書き換え

### 公式フォントの照合

`j7.e.b` の package 一致の確認（手順 3）の直後に hook を入れる。provider が LINE 自身のもので、次の条件をすべて満たすときだけ、`ProviderInfo` をそのまま返す。

- `providerInfo.packageName` が自アプリの package 名と一致する
- `providerInfo.applicationInfo.uid` が自プロセスの uid と一致する
- authority が `<package>.premiumfont` または `<package>.fonts`
- provider が exported ではない

それ以外の provider（Google のフォントなど）は元の照合のままにする。provider は LINE 自身で外部へ公開されていないので、照合が防いでいる「同じ authority を名乗る別アプリの provider から読み込む」危険は変わらない。判断の経緯は [ADR 0005](../adr/0005-own-font-provider-certificate.md) に残す。

fingerprint: 同じメソッドに文字列 `"No package found for authority: "`、`"Found content provider "`、`"FontProvider.getProvider"` があること。`"No package found for authority: "` だけでは別のクラスにも当たる。シグネチャは `(PackageManager, <FontRequest>, Resources) → ProviderInfo`。

### 手持ちのフォント

Linimal の設定が ON で、取り込んだファイルがあるときに、次の 2 か所を変える。

1. 起動時タスクの分岐: `fx4.p.a` の結果（`Boolean.booleanValue()` の戻り値）を hook に通し、`true` にしてテーマの適用を登録させる。契約の判定と選択の書き戻しは、その前に元のとおり走る
2. `PremiumFontProvider.openFile(Uri, String)` の先頭: authority が `<package>.premiumfont` で、URI の末尾が `-1`（選択中のフォント）のときだけ、取り込んだファイルの `ParcelFileDescriptor` を返す。hook が null を返したら元の処理へ進む。`1<id>` や `2<id>` の要求（公式の設定画面の検証やプレビュー）は変えない
   - `openFile` は registers 4・ins 3 で、先頭では `v0` が使われていない。hook の結果は `v0` に受ける
   - coroutine `PremiumFontProvider$a$a.invokeSuspend` の `check-cast File`（`006e`）には入れない。coroutine の再開経路（`0010` から `goto 006e`）では、Uri を持つ `v4` に int の 1 が入っているため、そこで `v4` を使うと ART の verifier で落ちる

公式の選択値（`premium.appfont.fontid`）は書き換えない。外から書くと、起動時の検証が契約や期限に応じて書き戻してしまうためである。取り込んだファイルは `premium_font/` の外に置き、公式の「全フォント削除」で消えないようにする。

fingerprint:

- 起動時タスク: 文字列 `"RegisterPremiumFontThemeApplierTask"` を持つクラスの coroutine。`Boolean.booleanValue()` の直後の `if-eqz` と、その分岐の先の `Application.registerActivityLifecycleCallbacks`
- provider: 難読化されていない `com.linecorp.line.premiumfont.provider.PremiumFontProvider` の `openFile(Uri, String) → ParcelFileDescriptor`

## 適用範囲

- View: テーマの `fontFamily` は AppCompat の属性なので、AppCompat の TextView（AppCompat の inflater が作る TextView を含む）に当たる。framework の TextView をそのまま使う画面、Dialog、Activity の外で作る View には当たらない可能性がある
- Compose: LINE の Compose テーマ（`b92.v`）に渡る。Typography のどこまでに反映されるかは未確認
- WebView: 当たらない
- 数字用の `res/font/roboto_medium_numbers.ttf` は media3 のプレーヤーだけが使い、このフォント設定とは関係ない
- 絵文字: 未確認

## 未確認

- 実機（XIG07）での失敗コード -2 とトーストの確認。2026-11-21 に確かめた検証用アカウントは LYP プレミアムを契約しておらず、フォント設定では「基本フォント」以外を選べない。そのため設定画面から照合を通す操作ができない。起動時の Compose の失敗は coroutine の cancel で処理され、logcat には出ない
- 契約者のアカウントでの公式フォントの復旧。照合の hook が実際に通ることは、手持ちのフォント（同じ照合を通る）で確かめる

2026-11-21 に XIG07 で確かめたこと（照合の hook を入れた build）:

- patch-status は `linimal.patch.font-provider-own-certificate` が OK（1/1）
- `j7.e.b` の `0042` に hook が入り、元の `iget-object v2, v7, packageName` は `004c` に移る
- 起動して VerifyError、verifier の拒否、クラッシュは出ない
- 既存のインストールでも、設定「LINE のフォント設定を使えるようにする」は既定 ON で表示される

2026-11-21 に XIG07 で確かめたこと（手持ちのフォントを入れた build）:

- patch-status は `custom-font-theme`、`custom-font-file`、`custom-font-provider-certificate` がいずれも OK（1/1）
- 端末内蔵の DancingScript（OFL）を Download から取り込み、設定を ON にして再起動すると、ホーム（Compose）とトーク一覧（View）の英数字が DancingScript になる。日本語は字がないため、端末の標準フォントで表示される
- provider から読み込めたので、照合の hook が LINE 自身の provider を通していることも確かめられた
- 起動から 10 秒以上たってから終了し、起動し直す操作を 2 回続けても、フォントは当たったまま（通常の起動を失敗と数えない）
- 設定を OFF にして再起動すると、元のフォントに戻る
- 起動直後に落ち続けたときに止める動作は、意図的に落とす手段がないため実機では確かめていない（単体テストのみ）
- テーマの適用より前に作られた View や、Fragment が作り直さない View への反映
