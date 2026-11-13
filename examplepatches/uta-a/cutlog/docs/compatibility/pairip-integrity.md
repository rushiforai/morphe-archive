# Phase 0 互換性: PairIP / 改ざん検知・整合性保護

対象: setlog `com.newchat.setlog` v1.3 / versionCode 76（Google Play 版）
手段: 元 APK の `jadx` 静的解析 + `unzip -l`。末尾に Morphe パッチの実装・適用検証を記録する。

## 結論

PairIP は **licensecheck（Google Play ライセンス確認）止まり**。コード仮想化（VMRunner）やネイティブ整合性保護は無く、APK 自身の署名ハッシュを検証する処理も見当たらない。再署名した改変 APK の起動・ログイン可否は、アプリ内チェックではなく **Play ライセンス応答がどう返るか**にほぼ依存する。

以下の解析は未改変の公式 APK が対象。現在の `インストール元チェック` パッチ（旧名 `cutlog`）はローカルインストール元判定だけを変更する（末尾参照）。APK 署名検査や Play の応答検証には介入しない。

## 1. PairIP の構成

- Manifest の `application android:name` = `com.pairip.application.Application`（AndroidManifest.xml:46）
- `pairip/application/Application.java:8-13` は `SetlogApp` を継承し `attachBaseContext` で `LicenseClient.checkLicense(context)` を呼ぶだけ。実体の Application は `com.newchat.setlog.SetlogApp`（Firebase 等を初期化する通常実装、ネイティブロード無し）
- `LicenseContentProvider` は Manifest 未登録（クラスは存在するが未使用）。登録は `LicenseActivity`（AndroidManifest.xml:369-370, exported=false）のみ
- ネイティブ `.so` は APK 内に 1 つも無い（`lib/` 空、`extractNativeLibs=false`）。dex は `classes.dex` 単一。暗号化された追加 dex/assets 無し（assets は `dexopt/baseline.prof`/`baseline.profm` のみ）
- `libpairipcore.so`・VMRunner・バイトコード仮想化の痕跡なし（find/grep ヒット 0）

→ PairIP の「ライセンスチェックのみ」軽量バリアント。アクティブなコード改ざん検知の中核（ネイティブ VM）は無い。

## 2. 署名・整合性チェック

- **アプリ自身の APK 署名検証は無し。** `com/newchat` 配下に `getPackageInfo`/`signatures`/`GET_SIGNING_CERTIFICATES`/`signingInfo` の使用なし
- `defpackage/df2.java`（署名 API ヒット）は GMS の `GoogleSignatureVerifier`。対象は `com.android.vending`/`com.google.android.gms` の署名で GMS 内部 IPC 相手確認。setlog 自身の署名検証ではない
- **Play Integrity / StandardIntegrityManager / SafetyNet は未使用**（grep ヒットは Room のスキーマハッシュや WebAuthn/FIDO2 の誤検出）
- PairIP ライセンス検証（`LicenseResponseHelper.java`）: Play licensing service が返す JWS を、ハードコードされた RSA 公開鍵（`LicenseClient.licensePubKey`）で RS256 署名検証し、payload の `packageName` が `com.newchat.setlog` と一致するか確認（`LicenseResponseHelper.java:27-44`）。これはライセンス応答の検証であって APK 署名の検証ではない
- 失敗時の挙動（`LicenseClient.java`）:
  - `handleError` → `FULL_CHECK_OK` でもローカル合格でもなければ `startErrorDialogActivity`
  - `LicenseActivity` が「Something went wrong …」ダイアログを出し、`eventualShutdownEnabled` により 30 秒後 `System.exit(0)`（`LicenseActivity.java:103-114`）
  - 応答コード 2（NOT_LICENSED）は Play ペイウォール Intent 起動後アプリ終了
  - `performLocalInstallerCheck`（`LicenseClient.java:259-295`）は installer が `com.android.vending` かを確認。**Play 以外からのインストール（サイドロード）ではローカルチェック不合格 → Play へのフルライセンスチェックが必須になる**

## 3. その他の環境検知

- root / su / RootBeer / Magisk 検知: なし
- デバッガ / Frida / Xposed 検知: なし
- エミュレータ: `defpackage/lm6.java:19-23` が goldfish/ranchu 等を判定するが、GMS/datatransport(Firelog) のテレメトリ用でセキュリティゲートではない

## 4. 総合評価（確度付き）

- コード仮想化・ネイティブ整合性保護は無い — 高確度
- APK 署名ハッシュの検証は無い — 高確度
- 起動/ログイン可否は Play ライセンス応答次第 — 中確度。起動時（attachBaseContext）に Play licensing service へ問い合わせる。サイドロードした再署名 APK は installer が Play でないためローカルチェックを通らずフルチェックに依存する。使用する Google アカウントがこのアプリを Play 上で「入手済み」なら LICENSED が返り起動可能。未入手・Play 無効環境では NOT_LICENSED/バインド失敗 → エラーダイアログ + 30 秒 exit で起動できない可能性。端末・アカウント・ネットワーク依存で静的には確定不能

## Phase 1 の起動確認とパッチ

当初の起動確認用パッチは何も変更せず再署名するものだった。現在は次の限定パッチへ切り替えている。

- 実装: `patches/src/main/kotlin/dev/utaa/cutlog/patches/CutlogPatch.kt`
- 対象: `LicenseClient.performLocalInstallerCheck()Z` 一件。宣言クラス・メソッド名・private / 引数なし / boolean の signature、`getInstallSourceInfo` → `getInstallingPackageName` → `com.android.vending` → 判定失敗ログの命令列を fingerprint にする。一致数が一件でなければ適用エラーにする
- 書き換え: 本体を `const/4 v0, 0x1; return v0` に置換。旧命令・例外ハンドラ・デバッグ情報は残さず、メソッドの signature・修飾子・annotation は保持する
- 影響: 通常の初回チェックでは `LOCAL_CHECK_OK` に進み、背景ライセンスサービスを使用する。背景接続のリトライ上限到達や `handleError` はローカル合格状態を考慮する
- 非対象: PackageManager API 全体、Firebase のインストール元収集、`checkLicense` 呼び出し、Play ライセンス通信、JWS 検証、NOT_LICENSED 応答時のペイウォール、trial / repeated-check の処理。ローカル判定合格と、すべての起動拒否経路の無効化は同義ではない

検証:

- `:patches:build` / `:patches:buildAndroid` 成功
- Morphe Desktop 1.14.0 で v1.3 / versionCode 76 の実 APKM に適用成功（`cutlog` 一件、失敗パッチなし）
- `scratch/cutlog-dev.keystore` で署名した `scratch/setlog-installer-check.apk` を生成し、Android SDK 37.0.0 の `apksigner verify` で v3 署名の検証成功
- 生成 APK の `LicenseClient` を jadx 1.5.6 で再解析し、対象が `return true` のみになることを確認。元 APK との Java 差分は、対象本体・不要 import・メソッド順・DEX 所属コメントのみ
- 先頭に return を挿入するだけの案は、残った到達不能コードと例外ハンドラで jadx の BlockProcessor が失敗したため採用しない
- Android 13 / API 33 の実機（23043RP34G、pipa）へ `adb install -r` でデータを消去せず上書き成功。`am start -W` は `Status: ok` / `LaunchState: COLD`。ログイン画面への到達を目視確認
- 起動時の `LicenseClient` ログは背景ライセンスサービスへの接続成功 → `Request to licensing reporting service sent.`。40 秒後も同じ PID が生存し、その PID の LicenseClient / AndroidRuntime ログにライセンスエラー・クラッシュはない
- 観測中に「安全設定を完了」（暗号鍵の移行または新規作成）画面へ進んだ。最終スクリーンショットは `scratch/setlog-installer-startup.png`。暗号鍵の選択肢は操作していない。鍵移行・新規作成、過去動画へのアクセス・投稿は未確認

## 未検証

- Play licensing service が特定アカウント・端末で実際に返すコードは動的要素で静的判定不能
- `defpackage` は R8 難読化済みで全クラス未精査。整合性保護関連キーワードの横断 grep では PairIP と GMS 以外のヒット無し
