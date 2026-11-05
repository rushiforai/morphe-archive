# ADR 0003: Google ドライブ連携の認証を MicroG-RE へ向ける

- 状態: 採用（2026-09-22、PoC の実機検証を経て）
- 日付: 2026-09-22
- 関連: [ADR 0001](0001-reference-and-signing-policy.md) 決定 4、[ADR 0002](0002-fis-certificate-header.md)、[解析](../analysis/google-drive-backup-auth.md)

## 背景

再署名した LINE では、トークのバックアップで Google アカウントを選ぶ段階で失敗する。LINE は旧 Google Sign-In（`com.google.android.gms.auth.GOOGLE_SIGN_IN`）と、`com.google.android.gms.auth.GetToken` による `oauth2:` token の要求で Google ドライブの `drive.appdata` scope を得る。端末本体の Google Play services は、自分のプロセスで LINE の実際の署名を読み、公式証明書で登録された OAuth client と照合する。

ADR 0002 の FIS と違い、検査に使う値を LINE 自身が計算しないため、LINE 内の書き換えでは直せない。LSPatch の signature bypass もプロセス内の偽装なので届かない。

MicroG-RE（`app.revanced.android.gms`、microG GmsCore の fork）は、呼び出し元アプリの manifest にある meta-data `app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE` の値を、Google に送る署名 SHA-1 として使う（`PackageSpoofUtils.kt`）。Sign-In も token の要求も同じ処理を通る。

検討した選択肢:

| 方式 | 評価 |
| --- | --- |
| LINE 内の書き換え / LSPatch | 検査が Google Play services のプロセスで行われるため届かない |
| MicroG-RE へ GMS 全体を向ける | ReVanced 版 YouTube と同じ方式で前例があるが、通知・位置情報まで MicroG-RE に依存し、変更範囲が大きい |
| MicroG-RE へ認証だけを向ける | 変更は認証の呼び出し箇所と meta-data に限られる。端末本体の Google Play services と併用して動くかは未確認 |
| root の Mount install | 署名が変わらないため問題自体が起きない。Linimal の配布形態とは別物 |
| 非対応とする | 変更はないが、再署名版ではバックアップできない |

## 決定

1. 再署名で失われた Google ドライブ連携を戻す目的に限り、`GoogleAuthUtil` の token 要求だけを MicroG-RE へ向ける。ADR 0001 決定 4 と、認証を変更しないという制約の例外として扱う。バックアップは Google Sign-In を使わないため、Sign-In の経路は変更しない。
2. LINE の manifest に `app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE` と、MicroG-RE の `<queries>` を追加する。値は `Constants.LINE_ORIGINAL_CERTIFICATE_SHA1`（ADR 0002 と共有）を小文字にしたものとする。パッケージ名は変えないので `SPOOFED_PACKAGE_NAME` は追加しない。
3. `"com.google.android.gms"` は GMS client 全体の共有定数なので一括置換しない。GoogleAuthServiceClient を使うかの判定を false にして `GetToken` の経路へ回し、`GetToken` の bind 先だけを MicroG-RE に差し替える。FCM、FIS、位置情報など他の GMS、LINE の認証・LEGY、Drive REST の通信内容は変更しない。
4. runtime 設定「MicroG-RE でトークをバックアップする」で切り替え、既定値は ON とする（利用者の判断）。MicroG-RE が未導入なら ON でも元の経路を使うため、既定で ON にしても MicroG-RE を入れない利用者の通信経路は変わらない（導入案内の通知だけが増える）。OFF、未初期化、例外時は hook が元の値を返す。
5. MicroG-RE は、パッケージ名に加えて MorpheApp/MicroG-RE の公式リリースの署名証明書（SHA-256）で確かめる。同じパッケージ名の別アプリに token の要求やバックアップを渡さないためである。証明書が一致しなければ未導入と同じに扱う。
6. 設定 ON で MicroG-RE が未導入のまま token が要求されたら、導入の案内を 10 分に 1 回まで出す。案内は通知とトーストの両方とする。新規インストール直後の復元では通知が許可されていないことが多いためである。通知のタップ先は MicroG-RE のリリースページ（固定 URL）とする。GoogleAuthServiceClient の判定は別のフラグとの `&&` の後ろにあり呼ばれないことがあるため、案内は判定と `GetToken` の bind の両方の hook から出す。
7. fingerprint が一意に定まらない、差し替える register を確認できない、manifest の形が想定と違う場合は変更せず、ERROR / TARGET_NOT_FOUND を記録する。定数が未設定なら DISABLED を記録する。

### 変更（2026-11-03）

アカウントの選択も MicroG-RE で行う。決定 3 の「`GetToken` の bind 先だけ」を改め、`CHOOSE_ACCOUNT` の選択画面を
MicroG-RE（action `app.revanced.android.gms.common.account.CHOOSE_ACCOUNT`、アカウント種別 `app.revanced`）に向け、
選んだ名前からは端末本体のアカウントを探さずに `Account(name, "com.google")` を作る。
MicroG-RE に実在するかは確かめない。アカウントの可視性はアカウントごとに決まり、LINE から見える一覧では判定できないためである。
以前に端末本体のアカウントで設定した自動バックアップなど、MicroG-RE に無い名前は NetworkError で失敗し、選び直しが要る。

MicroG-RE は token を要求されたアカウントを名前だけで探し、見つからなければ `NetworkError` を返す
（`AuthManagerServiceImpl.getTokenWithAccount`）。端末本体の Google Play services で選んだアカウントが MicroG-RE に無いと、
LINE ではネットワークエラーのように見えて失敗する。Issue #12 の報告を受けた変更で、
`andrewliang25/morphe-patches` も同じく選択画面を MicroG-RE へ向けている。端末本体に Google アカウントが無い端末でも選べる。

### 変更（2026-11-04）

MicroG-RE へ向けた token 要求が失敗したとき、失敗の種類を通知する。LINE は bind の失敗、MicroG-RE が返したエラー、
`GoogleAuthException` のどれも `IOException` にまとめ、「LINEにアクセスできません」の 1 種類の表示にするため、
利用者からの報告（Issue #12）では原因を切り分けられなかった。

- `GoogleAuthUtil` が応答から `Error` を読んだ直後と、`Could not bind to service.` で例外を投げる直前に hook を呼ぶ。
  値と処理の流れは変えない。MicroG-RE へ向けているときだけ通知する。
- 通知に載せるのは、エラー文字列（英数字と一部の記号、80 文字まで）と MicroG-RE・LINE・Android の version だけとし、
  メールアドレスと token は載せない。
- アクセス許可の確認（`NeedPermission` など）は LINE が MicroG-RE の画面を開いて解決するので通知しない。
- 同じ内容は 1 分に 1 回まで、通知は 1 つを置き換える。
- 診断用の hook も `linimal.google-drive-backup` の必須 patch に加える。注入できなければ、他の MicroG-RE 関連の patch と同じく機能全体を無効にする。

## 結果

- MicroG-RE を導入し、MicroG-RE に Google アカウントを追加した利用者は、再署名版でも Google ドライブへのバックアップと復元ができる（下記の PoC で確認）。
- アプリの身元を Google の OAuth client の照合に対して偽ることになる。ADR 0002 より踏み込んだ偽装で、Google や LINE の利用規約に抵触する可能性があり、Google アカウントへの影響も否定できない。README にその旨を明記する。
- MicroG-RE は申告された署名を検証しない。meta-data を書けるのはパッチ適用者だけ、という前提が信頼境界になる。
- 利用者は Linimal 以外の第三者アプリ（MicroG-RE）を信頼して導入する必要がある。

## PoC の結果（2026-09-22）

実験用パッチ（現在の `patches/.../features/googleauth/GoogleAuthTokenRoutingPatch.kt` の前身）で、SDK 36 の端末で次を確認した。詳細は[解析](../analysis/google-drive-backup-auth.md)。

- バックアップは Google Sign-In を使わず、`GoogleAuthUtil` の token 要求だけを使う。差し替えたのは、GoogleAuthServiceClient を使うかの判定（MicroG-RE があれば false）と、`GetToken` の bind 先の 2 か所。
- 復元とバックアップがどちらも完了した。MicroG-RE は v3 lineage の root の SHA-1 で申告し、Google は `drive.appdata` の token を発行した。
- bind 先の署名検査はなかった。MicroG-RE は上書きについて利用者の確認を求めなかった。
- 公式 LINE 26.14.0 で作ったバックアップを PoC 版で復元できた。
- MicroG-RE の証明書を誤った値にした版で、MicroG-RE がない状態を再現し、バックアップ時にトーストと通知の両方が出ることを確かめた。最初の実装は判定の hook からしか案内を出しておらず、判定が呼ばれずに案内が出なかった。
- 申告する値を SDK 33 以上の signer の SHA-1（`6A2927D9…67BD`）にすると、token は発行され、バックアップの作成もできたが、復元は「インターネットに接続できません」で失敗した。lineage の root の SHA-1 に戻すと復元できた。申告する値は lineage の root とする。

## 未確認事項

- 認証だけを MicroG-RE へ向け、他を端末本体の Google Play services のままにした状態の長期的な両立。
- token の更新と、MicroG-RE がアクセス許可を求める場合の表示。
- Google 側の検証の変更で効かなくなる可能性。
- 再署名版で作ったバックアップを公式 LINE で復元できるか。
- SDK 32 以下の端末。
- `GoogleAuthUtil` を呼ぶのがバックアップ・復元の経路だけかどうか。他の経路があれば、そこでも token の要求が MicroG-RE へ向き、導入案内の通知が出る。
- MicroG-RE が署名鍵を変えた場合。lineage でローテーションすれば照合は通るが、鍵を作り直すと未導入扱いになる。
