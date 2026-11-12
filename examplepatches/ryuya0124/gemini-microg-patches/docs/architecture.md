# パッチの構成と修正理由

## パッケージ

| 役割 | 元パッケージ | 使用パッケージ |
| --- | --- | --- |
| Google本体 | `com.google.android.googlequicksearchbox` | `com.google.android.googlequicksearchbox.morphe` |
| Geminiランチャー | `com.google.android.apps.bard` | `com.google.android.apps.bard.morphe` |
| microG | — | `app.revanced.android.gms` |

v0.3.2から `Automatic Clone Setup` を標準選択に含め、パッケージ・権限宣言・ProviderをMPP内でクローン化する。権限参照は `ClonePermissionSupport` がManifest/DEXを更新する。公式Clone appの追加や手動オプションは不要。分割版Google本体のxxhdpi splitも同じパッケージ名に変更し、既存と同じキーで署名する。nodpi単体APKではresource splitを追加しない。

Patcher1.12は公開パッチ名順で実行し、逆順でfinalizeする。`Automatic Clone Setup` は任意の外部 `Clone app` より先に原本を記録し、最後に固定名前空間へ整える。これにより従来のClone appを追加した既定false/false・旧true/true設定でも二重変換を防ぐ。標準選択を維持し、任意パッケージ名は使用しない。既定選択と旧設定の実APK検証は `scripts/emulator/test-issue8-options.py`。

## microGログイン

`microg/GmsCoreSupportPatch.kt` はprovider authority、アカウント種別、権限、アカウント選択UI actionをmicroG向けに変更する。Binder service actionはサービス側の互換名を維持する。

GMSメタデータに使用する元Google署名はSHA-1 `38918a453d07199354f8b19af05ec6562ced5788`。ここをSHA-256と取り違えない。

`MicrogRuntimePermissionsPatch.kt` がMainActivity.onCreateから初回権限の説明を呼ぶ。必要な権限は `android.permission.GET_ACCOUNTS` と `app.revanced.gms.EXTENDED_ACCESS`。READ_CONTACTSは追加しない。

v0.3.4ではJavaランタイム `extensions/src/main/java/app/geminipatch/extension/MicrogPermissions.java` をD8でコンパイルし、MPP内の `extensions/microg-permissions.bin` からPatcherのextendWithで対象APKへ統合する。Android/Java標準APIだけを使用し、KotlinやPatcherのランタイムをGoogle内で要求しない。標準DialogFragmentで説明し、Continue後に不足している権限だけを要求する。後回し・Back・OS側拒否後の自動再要求を抑え、プロファイルごとのSharedPreferencesへ選択を保存する。microG無効/未導入時は要求せず、有効化後に再試行できる。許可済みの既存環境には説明を出さない。

Androidの「unknown action」はmicroG側のEXTENDED_ACCESSにdescriptionがないための標準表示。Google側からその宣言を上書きしない。事前説明でアカウントアクセス用と明示し、システムの許可/拒否は維持する。`VerifyPermissionSetup.kt` が実APKへの統合・Activity別名・レジスタ・READ_CONTACTSを要求しないことを検証する。

Activityレジスタが生きている最後の `MainActivity.o:Z` への書き込み直後に挿入する。onCreateのreturn直前ではp0が別の値に使い回されている。ラベル付き命令挿入には `addInstructionsWithLabels` を使い、DEX検証で分岐先が命令境界に一致することを確認する。

## プロセス名とアカウント同期

クローン化でプロセス名に `.morphe` が追加されると、コンパイル済みDaggerのプロセス名switchに一致しない。`ProcessNameSanitizePatch.kt` がプロセス名プロバイダを正規化する。

v0.3.3以降は3レジスタを明示したprivate static補助メソッドで正規化し、元プロバイダのレジスタ数を変えない。各returnの命令そのものを補助メソッド呼び出しに置換し、キャッシュ分岐のラベルも呼び出しへ向ける。Patcher内部のprivate `registerCount`をreflectionで書き換えてはいけない。Android ManagerのPatcher 2.3.0では実装がサブクラスに包まれ、旧方式はフィールドを見つけられず不正DEXを生成した。[検証](testing/issue-8-manager-registers.md)。

ただしアカウントストアのmain-process判定ではContext.packageNameと比較するため、実際のプロセス名が必要。この判定だけ `Application.getProcessName()` を使う。これによりsearchプロセスがローカルアカウントストアを選び、AccountSyncServiceへの自己接続ループを防ぐ。

以前の固定AccountId、ロック省略、Binder成功偽装の3パッチは `account/AccountSyncPatches.kt` に履歴として残すがdefault=false。正常な同期を壊すため有効化しない。

## Secure Folder

異なる2つの判定に対応する。

1. `WorkProfileBypassPatch.kt`: Webへのトランポリンを回避する既存パッチ。
2. `WorkProfileEligibilityPatch.kt`: `WORK_PROFILE_NOT_SUPPORTED(19)` につながる利用資格判定。`appk.k` の `appk.x:Z` 読み取りを同じ幅の `const/16 ... 1` に置き換え、既存の「Work profile is allowed」分岐を選択する。

後者はログ文字列2つとクラス・メソッド・フィールド、変更箇所数1を確認する。他のアカウント条件やAndroidのプロファイル分離は維持する。

## 検証

- `VerifyDexBranches.kt`: 権限要求を追加したMainActivity.onCreateの分岐先を確認。
- `VerifyWorkProfile.kt`: 元APKと変更後を比較し、プロファイル許可フラグの1命令置換、レジスタ一致、命令幅と分岐オフセットの維持を確認。
- `config/inputs.sha256`: 難読化構造が検証済みの入力APKに限定。
- `apksigner verify`: 署名後のAPKを検証。

これらはバイナリ破損や対象の取り違えを検出する。ログインとチャット応答は実機確認が必要。

## バージョンごとの定義

難読化名・探索アンカー・レジスタ条件はcommon/versions配下の版別Kotlinファイルに集約。VersionHookRegistryはversionName/versionCodeの完全一致を要求する。閲覧用JSONと追加手順は[バージョン別記録](versions/README.md)を参照。パッチのアルゴリズムと共通GMS定数は各パッチに保持する。
