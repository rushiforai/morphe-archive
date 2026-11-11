# Google アカウントでのログインの認証経路の解析

## 対象

- LINE 26.16.0（versionCode 261600106）、arm64-v8a
- MicroG-RE 7.3.0（ソース c370569）
- XIG07、SDK 36

## LINE 側

- ログインは `com.linecorp.line.authentication.eap.GoogleAccount`（`ws0/i`）。`GetCredentialRequest`（`t7/y0`）に
  Sign in with Google の option（`cu/b`、server client ID `4586549225-quhf8ev7pclr5nv13jqs4kma9uua9m06`）を 1 つ入れて要求し、
  結果の `GoogleIdTokenCredential`（`cu/d`）から ID token を取り出す。
- provider の選択は `t7/a0.a(a0, Object)`。SDK 34 以上は Android 本体の Credential Manager（`t7/q0`）、
  33 以下は manifest の `androidx.credentials.CREDENTIAL_PROVIDER_KEY` から作る Play services 版（`t7/a0.b()`）。
- Play services 版の `onGetCredential` は、Google Play services が `PRE_U_MIN_GMS_APK_VERSION`（252400000）以上なら
  Identity Credentials API（`k8/e`、`zr/e`、action `com.google.android.gms.identitycredentials.service.START`）を使う。
  それ未満なら、Sign in with Google の option を `g8/m` で処理し、Identity API の Sign-In client（`ds/n`）の
  `getSignInIntent` を使う。パスキーなどは `d8/m` で、同じ `ds/n` を使う。

## GMS client の接続先

- `ds/n` は `hr/j` → `hr/e`（BaseGmsClient）を継承する。`hr/e.E()` が bind 先パッケージ `"com.google.android.gms"`、
  `ds/n.D()` が action、`ds/n.F()` が dynamic lookup の有無（true）を返す。
- 接続処理は `new q1(E(), D(), F())` を作って bind する。dynamic lookup が true だと、本体の Google Play services に
  service を問い合わせるため、パッケージ名を替えても MicroG-RE には届かない。
- `ds/n.D()` と `F()` は register が 1 つで、`this` の register に定数を置いて返す。

## 要求と接続の対応（2026-11-11、静的解析）

ADR 0004 の「判定から 60 秒以内の次の 1 回の接続」を、要求と client の直接の対応付けへ置き換えられるかを、
元の 26.16.0 DEX で調べた。結論は「現行の位置のままでは対応付けられない」。

- `g8/m.g` は `uq/d.a(Context)` で Sign-In client の wrapper（`ds/m`、`er/g` = GoogleApi を継承）を毎回新しく作り、
  `ds/m.l`（乱数の session id、`ds/p.a()`）を要求 `uq/c` に入れて `ds/m.k(1, …)` で送る。session id は wrapper と要求に
  だけあり、接続には渡らない。
- wrapper の options は `new uq/v()`。`uq/v` は field を持たず、`equals` は `instance-of uq/v` だけ、`hashCode` は
  `Arrays.hashCode(uq/v.class)` の定数。
- `er/g.<init>` は ApiKey `fr/b(api, options, attributionTag)` を作り、`fr/b.equals` はこの 3 つを比べる。したがって、
  同じプロセスの Sign-In client の wrapper はすべて同じ ApiKey になり、GoogleApiManager が持つ 1 つの接続（`ds/n`）を共有する。
- `ds/n` を作るのは builder `ds/f.c(Context, Looper, hr/g, Object options, fr/e, fr/m)` だけで、`ds/n.<init>` は options を
  受け取らない。`ds/n` から wrapper・options・session id へはたどれない。
- 同じ Sign-In client（`uq/d.a`）を使うのは `g8/m.g`（Google ID）、`g8/m$a`（結果の読み取り）、`d8/m.g` と `d8/m$a`
  （パスキー・パスワード）、`CredentialProviderPlayServicesImpl.runFallbackClearCredFlow`（ログアウト時の clear）。
  接続はこれらと共有される。

このため、wrapper や要求に印を付けても、bind 先を決める `ds/n` の `E()`・`D()`・`F()` からはその印を読めない。
直接対応付けるには、向け替える要求だけ別の ApiKey にする（`uq/v` の等価性を変えるか、印付きの options を作る）ことと、
`ds/f.c` で options の印を新しい `ds/n` へ移すことの 2 つが要る。GMS 共通の接続共有の前提を変える変更で、
影響範囲が現行の時間窓より広い。

現行の時間窓に残る懸念（いずれも実機では未確認）:

- 判定の時点で Sign-In client がすでに接続済みだと、`E()` は呼ばれず、要求はそのままの接続先へ送られる。
  準備は消費されずに残り、60 秒以内に切断して再接続した別の要求（`d8/m` のパスキーなど）を MicroG-RE へ向け得る。
- MicroG-RE へ接続した後、切断されるまでは、同じ接続を使う別の要求も MicroG-RE へ送られる。
  GoogleApiManager が接続を切るまでの時間は確かめていない。
- どちらも、Play services 版 provider を使う要求（向け替え対象の Google ID 要求、または SDK 33 以下）でだけ起きる。

## MicroG-RE 側

- `IdentitySignInService` を action `app.revanced.android.gms.auth.api.identity.service.signin.START` で公開する
  （manifest の `${basePackageName}` は `app.revanced`）。
- `getSignInIntent` と `beginSignIn` は server client ID が空なら CANCELED を返し、それ以外は ID token を要求する
  `GoogleSignInOptions` で自分の Sign-In 画面を開く。署名は `AuthManager` を通るため、`GetToken` と同じく
  manifest の `SPOOFED_PACKAGE_SIGNATURE` が使われる想定。実機では未確認。

## 実機で見えたこと（2026-11-03）

- 再署名版で「Google でログイン」を押すと、本体の Google Play services の
  `auth.api.credentials.assistedsignin.ui.GoogleSignInActivity` が開き、`identitycredentials.ui.CredentialChooserActivity` を経てすぐに閉じた。
