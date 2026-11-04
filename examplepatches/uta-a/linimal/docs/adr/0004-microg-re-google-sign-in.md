# ADR 0004: Google アカウントでのログインを MicroG-RE へ向ける

- 状態: 採用（2026-11-03、利用者の指示による。同日に実機でログイン成功を確認）
- 日付: 2026-11-03
- 関連: [ADR 0003](0003-microg-re-google-auth.md)、[解析](../analysis/google-sign-in-auth.md)

## 背景

LINE 26.16.0 の「Google でログイン」は、androidx.credentials の Credential Manager で
Sign in with Google の option（`GetSignInWithGoogleOption`）を要求し、Google ID token を受け取る。
再署名した LINE では、端末本体の Google Play services が実際の署名で OAuth client を照合するため、ログインできない。
XIG07（SDK 36）では Google Play services の `assistedsignin.ui.GoogleSignInActivity` が開いてすぐに閉じた。

ADR 0003 は「バックアップは Google Sign-In を使わないため、Sign-In の経路は変更しない」と決めていた。
ログインできないと LINE 自体を使い始められないため、範囲を広げる。

SDK 34 以上では androidx.credentials は Android 本体の Credential Manager を使う。本体は呼び出し元の実際の署名を
provider に渡すので、manifest の meta-data では申告できない。LINE は Play services 版の provider
（`CredentialProviderPlayServicesImpl`）も同梱しており、こちらは Identity API の Sign-In client を LINE のプロセスで使う。

## 決定

1. option がすべて Google ID token の要求だけ、Credential Manager の provider 選択で Play services 版を選ばせる。
   パスキー・パスワードを含む要求は変えない。判定は request の option が持つ type
   `com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL` で行う。Play services 版を作れなければ元の選択を続ける。
   Play services 版は、Google Play services が 252400000 以上だと Identity Credentials API を先に使うため、
   同じ要求ではその判定を false にして Identity API の Sign-In client（`getSignInIntent`）を使わせる。
2. Identity API の Sign-In client（action `com.google.android.gms.auth.api.identity.service.signin.START`）だけについて、
   bind 先パッケージを MicroG-RE、action を MicroG-RE が公開する `app.revanced.android.gms.auth.api.identity.service.signin.START`
   に替え、Google Play services の dynamic lookup を使わない。dynamic lookup はパッケージ名を無視して本体の service を返すためである。
   GMS client 共通の getter や他の client は変更しない。向け替えは、1 の判定から 60 秒以内の、次の 1 回の接続だけとし、
   1 回の接続では最初に読む bind 先パッケージの判定を action と dynamic lookup にも使う。
3. 切り替えは ADR 0003 と同じ runtime 設定とし、表示名を「MicroG-RE で Google ログインとバックアップを行う」に改める。
   設定キーは変えないので既存の値を引き継ぐ。ログインは設定画面を開く前に行うため、既定値 ON がそのまま効く。
4. MicroG-RE の判定（パッケージ名と公式リリースの証明書）、導入の案内、fail-open は ADR 0003 と同じとする。
5. 元の override は `this` の register に定数を上書きして返す形のため、同じ名前・access flag・定数で register を 2 つ持つ
   method に置き換える。対象の形が想定と違えば変更せず ERROR を記録する。

## 結果

- MicroG-RE に Google アカウントを追加した利用者は、再署名版でも Google アカウントでログインできる見込みがある。
  MicroG-RE の `IdentitySignInService` が ID token を発行するかは、実機で確認していない。
- LINE のログインという認証そのものの入口で、アプリの身元を Google に偽ることになる。ADR 0003 より影響が大きく、
  Google や LINE の利用規約に抵触する可能性と、Google アカウント・LINE アカウントへの影響を否定できない。
- MicroG-RE が返した ID token をそのまま LINE のサーバーへ渡す。MicroG-RE と、そこに追加したアカウントを信頼する範囲が
  バックアップからログインへ広がる。

- 準備と接続を要求ごとに対応付ける手段がないため、次の場合は旧 provider 経路（Google Play services が 252400000 未満、
  または Identity Credentials API の失敗後）のパスキー要求も MicroG-RE へ向く。
  - Google ログインの準備から接続までの間に、そのパスキー要求の接続が先に行われた場合
  - MicroG-RE へ向けた Sign-In client の接続が保持されている間に、パスキー要求が同じ接続を使った場合

## 実機の結果（2026-11-03）

XIG07（SDK 36）、LINE 26.16.0、MicroG-RE 7.3.0 で「Google でログイン」を実行し、ログインが完了した。
LINE の `HiddenActivity`（Play services 版 provider）から MicroG-RE の `AssistedSignInActivity` と `AuthSignInActivity` が開き、
端末本体の Google Play services の Sign-In 画面は使われなかった。

## 未確認事項

- 端末本体の Google Play services を使う他の Identity API（パスワードの保存など）との両立。
- SDK 33 以下の端末。
