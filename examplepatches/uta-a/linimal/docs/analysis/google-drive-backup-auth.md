# Google ドライブ連携（トークのバックアップ）の認証経路の解析

## 対象

- LINE 26.11.0
- versionCode 261100124
- package `jp.naver.line.android`
- arm64-v8a
- MicroG-RE 7.1.1（`app.revanced.android.gms`、MorpheApp/MicroG-RE のリリース APK）

## 結論

トークのバックアップと復元は Google Sign-In を使わない。アカウントを選んだあと、`GoogleAuthUtil.getToken` 相当の処理で
`oauth2: https://www.googleapis.com/auth/drive.appdata` の token を取り、Drive REST に渡す。

再署名版で失敗するのは、この token の要求を受けた端末本体の Google Play services が、LINE の実際の署名で OAuth client を
照合するためである。`GetToken` の bind 先を MicroG-RE に向け、manifest の meta-data で公式証明書の SHA-1 を申告すると、
MicroG-RE がその値を `client_sig` として Google に送り、token が発行される（実機で確認、下記）。

## 経路

```text
バックアップ画面（BackupRestoreRepository$createDriveService$2 など）
→ GoogleAccountCredential 相当（scope drive.appdata、アカウント名だけを渡す）
→ GoogleAuthUtil.getToken 相当
   ├ 高速経路: GoogleAuthServiceClient（action com.google.android.gms.auth.account.authapi.START）
   │   使うかどうかは static boolean (Context) の判定で決まる（GMS version 17895000 以上、除外リストに自分がない）
   └ 旧経路: ComponentName("com.google.android.gms", "com.google.android.gms.auth.GetToken") を bind
       → IAuthManagerService.getTokenWithAccount
```

- 高速経路の bind 先パッケージは GMS client 共通の基底クラスが決めるため、ここだけを差し替えられない。
  判定を false にして旧経路へ回す。
- 旧経路の bind は `static Object (Context, ComponentName, callback)` が行う。ログ文字列 `GoogleAuthUtil` と
  `Could not bind to service.` を持つ。bind 先の署名を検査する処理はない。
- アカウント選択は `com.google.android.gms.common.account.CHOOSE_ACCOUNT` で端末本体の Google Play services が行う
  （2026-11-03 以降、Linimal は MicroG-RE の選択画面へ向ける。下記の 26.16.0 の節）。
  LINE は `Account(name, "com.google")` を作るが、MicroG-RE はアカウント名だけで自分のアカウント（type `app.revanced`）を探す。
  このため、MicroG-RE に同じ Google アカウントが追加されている必要がある。
- `SignInHubActivity`（`GOOGLE_SIGN_IN`）と `signin.service.START` 系の client は同梱されているが、バックアップでは使わない。

## LINE 26.16.0 での確認（2026-11-03）

- バックアップの経路は 26.11.0 と同じ。選択画面の Intent は `xb5/v.b`、資格情報は `bw/a`（`c(String)` がアカウント名から
  `getAccountsByType("com.google")` で Account を探す）、自動バックアップは `dj8/d`（`AutomaticChatBackupWorker`）。
- `xb5/v.b` は register が 5 つで、Context の引数 register を途中で再利用する。Intent を返す箇所の hook は
  プロセスの Application から Context を得る。
- MicroG-RE の `AccountPickerActivity` は extras をそのまま Android 本体の `ChooseTypeAndAccountActivity` に渡す。
  `allowableAccountTypes` を `app.revanced` にすると MicroG-RE のアカウントだけが出る。
- MicroG-RE は token の要求を受けると、アカウント名で自分のアカウントを探し、無ければ `NetworkError` を返す。
  端末本体で選んだアカウントが MicroG-RE に無い場合の失敗はこれで説明できる。

## MicroG-RE 側

- `PackageSpoofUtils` は、呼び出し元の manifest の meta-data `app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE` の値を、
  呼び出し元の署名 SHA-1 の代わりに使う。値は検証しない。
- `GetToken` は `app.revanced.android.gms/com.google.android.gms.auth.GetToken` として公開されている。
- Android 11 以上で MicroG-RE を見つけるため、LINE の manifest に `<queries><package android:name="app.revanced.android.gms"/></queries>` が要る。

## PoC の実機検証（2026-09-22）

実験用パッチ（現在の `GoogleAuthTokenRoutingPatch.kt` の前身）を当てた LINE 26.11.0 を、SDK 36 の端末に入れて確認した。

- ログイン後の復元と、その後の Google ドライブへのバックアップがどちらも完了した。
- logcat で、MicroG-RE の `GmsAuthManagerSvc` が LINE から `drive.appdata` の token 要求を受けたこと、`SpoofUtils` が署名を
  `89396dc4…5c50`（v3 lineage の root）に置き換えたこと、Google の auth endpoint への `client_sig=89396dc4…` の要求に対して
  `drive.appdata` を含む scope の token が発行されたことを確認した。以後の要求は保存済みの token で応答している。
- 検証前の公式 LINE（26.14.0）で作ったバックアップを、26.11.0 の PoC 版で復元できた。

## 未確認事項

- 認証だけを MicroG-RE へ向けた状態での、他の GMS 機能（通知など）との長期的な両立。
- token の期限切れ後の自動更新（期限は 3599 秒）と、MicroG-RE がアクセス許可を求める場合（`NeedPermission`）の表示。
- MicroG-RE が未導入の端末で、元の経路（失敗）に戻ること。
- SDK 32 以下の端末。
