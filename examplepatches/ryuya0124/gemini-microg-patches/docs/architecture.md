# パッチの構成と修正理由

## パッケージ

| 役割 | 元パッケージ | 使用パッケージ |
| --- | --- | --- |
| Google本体 | `com.google.android.googlequicksearchbox` | `com.google.android.googlequicksearchbox.morphe` |
| Geminiランチャー | `com.google.android.apps.bard` | `com.google.android.apps.bard.morphe` |
| microG | — | `app.revanced.android.gms` |

MorpheのClone appパッチと独自パッチを組み合わせる。Google本体のxxhdpi splitも同じパッケージ名に変更し、全APKを同じキーで署名する。

## microGログイン

`microg/GmsCoreSupportPatch.kt` はprovider authority、アカウント種別、権限、アカウント選択UI actionをmicroG向けに変更する。Binder service actionはサービス側の互換名を維持する。

GMSメタデータに使用する元Google署名はSHA-1 `38918a453d07199354f8b19af05ec6562ced5788`。ここをSHA-256と取り違えない。

`MicrogRuntimePermissionsPatch.kt` がMainActivity.onCreateに初回権限要求を追加する。必要な権限は `android.permission.GET_ACCOUNTS` と `app.revanced.gms.EXTENDED_ACCESS`。READ_CONTACTSは追加しない。

Activityレジスタが生きている最後の `MainActivity.o:Z` への書き込み直後に挿入する。onCreateのreturn直前ではp0が別の値に使い回されている。ラベル付き命令挿入には `addInstructionsWithLabels` を使い、DEX検証で分岐先が命令境界に一致することを確認する。

## プロセス名とアカウント同期

クローン化でプロセス名に `.morphe` が追加されると、コンパイル済みDaggerのプロセス名switchに一致しない。`ProcessNameSanitizePatch.kt` がプロセス名プロバイダを正規化する。

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
