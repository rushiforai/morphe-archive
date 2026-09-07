# バージョン別フック記録

パッチが実際に読む定義は `src/main/kotlin/app/morphe/patches/google/common/versions/` のKotlinファイルです。このディレクトリのJSONはその定義から生成した閲覧・比較用の記録です。JSONを手で編集せず、定義を変更して再生成します。

| アプリ | 実行用定義 | 閲覧用記録 |
| --- | --- | --- |
| Google 17.54.18.ve.arm64 / 301800642 | [Google_17_54_18.kt](../../src/main/kotlin/app/morphe/patches/google/common/versions/Google_17_54_18.kt) | [JSON](com.google.android.googlequicksearchbox/17.54.18.ve.arm64.json) |
| Gemini 1.0.958859967 / 332 | [Gemini_1_0_958859967.kt](../../src/main/kotlin/app/morphe/patches/google/common/versions/Gemini_1_0_958859967.kt) | [JSON](com.google.android.apps.bard/1.0.958859967.json) |

## 記録する内容

- packageName、versionName、versionCode、元APKとsplitのSHA-256
- クラス、メソッド、DEXシグネチャ、フィールド名・型
- 探索に使う文字列、期待する変更箇所数、レジスタ条件
- 確認した端末・プロファイル・結果、既知の制約
- 採用しなかったパッチはenabled=falseと理由を記録

`observedRegisters` は観測値、`minRegisters` / `maxRegisters` はパッチが要求する範囲です。処理そのものの定数（true、権限要求コードなど）や共通のGMS置換表はパッチ側に残します。

## 新バージョンを追加する

1. 既存ファイルを残したまま、新バージョン用Kotlinファイルを追加する。
2. versionNameとversionCodeを完全一致で記録し、APKハッシュを計算する。
3. DEXを確認してクラス・メソッド・フィールド・アンカー・変更数を更新する。旧難読化名をそのままコピーして対応済みとしない。
4. `VersionHookRegistry.profiles` に追加する。広い正規表現や汎用フォールバックは使わない。
5. その版をローカルビルドの入力にする場合は `inputs/` と `config/inputs.sha256` を更新する。以前の版の定義・ハッシュ記録は削除しない。
6. コンパイルし、閲覧用JSONを生成する。

```sh
scripts/compile-patches.sh
scripts/check-hook-profiles.sh --write
scripts/check-hook-profiles.sh
scripts/build-all.sh
scripts/build-mpp.sh
```

7. パッチ適用と検証だけでなく実機ログイン・チャットも確認し、validationとHANDOFFを更新する。JSONを再生成してコミットする。

登録していないversionNameや異なるversionCodeでは適用を停止します。APKの厳密な内容一致はローカルビルドのハッシュ検証で行います。バージョン名が同じでも改変されたAPKをMorpheに手渡した場合、ハッシュ検証の代替にはなりません。

## この整理で修正した古い記録

- トランポリンの旧記録 `Lauby;.a` は検証済みAPKと不一致。実際は `Laiwk;.f(Lfnbp;Lgtij;)Ljava/lang/Object;`。
- `17.54.*`、`1.0.*`、全バージョン用フォールバックを廃止し、検証した版だけを登録。
- Web転送回避の2つのfingerprintは同じメソッドを指す。今回は動作を変えず既存の2命令挿入を保持し、その事実を記録。
- エラー19、権限要求、プロセス判定の検証コードも共通定義を参照し、難読化名の二重管理を解消。

CIは未登録版・異なるversionCodeの拒否、入力ハッシュと定義の整合性、生成JSONとの差分を検証します。検証コードは `scripts/kotlin/VerifyVersionProfiles.kt`。

## フックが見つからない場合

[フック解析ガイド](../hook-analysis.md) に文字列から候補を探す手順と今回の失敗例を記録しています。[調査テンプレート](../templates/hook-investigation.md) を版ごとに残してください。
