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

## MicroG-RE 側

- `IdentitySignInService` を action `app.revanced.android.gms.auth.api.identity.service.signin.START` で公開する
  （manifest の `${basePackageName}` は `app.revanced`）。
- `getSignInIntent` と `beginSignIn` は server client ID が空なら CANCELED を返し、それ以外は ID token を要求する
  `GoogleSignInOptions` で自分の Sign-In 画面を開く。署名は `AuthManager` を通るため、`GetToken` と同じく
  manifest の `SPOOFED_PACKAGE_SIGNATURE` が使われる想定。実機では未確認。

## 実機で見えたこと（2026-11-03）

- 再署名版で「Google でログイン」を押すと、本体の Google Play services の
  `auth.api.credentials.assistedsignin.ui.GoogleSignInActivity` が開き、`identitycredentials.ui.CredentialChooserActivity` を経てすぐに閉じた。
