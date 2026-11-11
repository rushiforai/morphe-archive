# DexKitによるホスト側のフック探索

DexKit 2.3.0（commit `c9cd12a14b75409bebd2f73e4dfc5ff575df3eb8`）を固定して、難読化されたメソッド候補を探索します。MPPや端末アプリには含めません。Morpheが行うパッチ適用の前に、保守者が実行する解析ツールです。

## 準備

macOS / Linux、Git、JDK 17、CMake、Ninjaが必要です。通常のパッチビルドには従来のJDK 21を使用します。`JAVA_HOME`はDexKitの準備コマンド内だけ変更します。

```sh
scripts/setup-tools.sh
scripts/setup-dexkit.sh
scripts/discover-hooks.sh inputs/google-base.apk
```

初回は固定コミットのDexKitを `tools/dexkit-src` に取得し、JVM用JARとホスト用native libraryをビルドします。Gradleは `--configure-on-demand` でDexKitモジュールだけを構築します。Androidプロジェクト全体を構築すると不要なNDKの取得が始まるため避けます。FlatBuffers 23.5.26は取得時にSHA-256を照合します。

## 自動化する範囲

`config/hook-discovery.tsv` に探索対象を記録しています。タブ区切りの4列で、ID、戻り値型、引数数、完全一致の文字列（複数は `|` 区切り）です。型・引数数の `*` は任意です。複数文字列はすべて同じメソッドに含まれることが条件になります。

出力は `build/discovery/<hash>.json`。候補の完全記述子、参照フィールド、呼出先、呼出元、候補数、APK/ルールのSHA-256、DexKitコミットを保存します。

- 0件は `missing`、1件は `unique_candidate`、複数件は `ambiguous`。
- `unique_candidate` でも安全なフックだと証明されたわけではありません。
- クラス探索用ルールの結果は「文字列があるメソッド」。実際の変更対象が同じクラスの別メソッドである場合があります。
- プロセス名文字列のルールは通常複数件です。参照先と既存の版別定義を照合して候補を絞ります。
- 対応バージョンの自動登録、Kotlin定義の自動書換え、未知版へのパッチ適用はしません。

```sh
scripts/discover-hooks.sh local/old-google.apk
scripts/discover-hooks.sh local/new-google.apk
python3 scripts/compare-discovery.py build/discovery/OLD.json build/discovery/NEW.json
scripts/inspect-hooks.sh local/new-google.apk dump 'Lcandidate;->method(Args)Return'
```

比較で候補の変更を把握し、DEX命令・フィールド型・分岐先・レジスタの生存値を確認してから `src/main/kotlin/.../versions/` に別の定義を追加します。

## 探索は初回・更新時のみ

APK、ルール、探索コード、DexKitコミット、native library、DexKit JARが同じなら保存済みJSONを使い、DexKitのロード・コンパイル・探索を行いません。ファイル名ではなく内容のハッシュで識別するため、同じファイル名で更新したAPKも再探索されます。これはホスト側の解析キャッシュです。端末の通常起動時に探索する仕組みは追加していません。

## 今回の検証

2026-11-10、Google 17.70.11と17.72.17で9ルールの探索を実行。8ルールは各1候補、プロセス名文字列は複数候補。同一APKでの再実行はキャッシュ使用を確認しました。

新版はtrampolineのログに最も近いIF_EQZが別のnullable Boolean判定になっています。候補メソッドを見つけるだけでは不十分で、AND_INT_2ADDR直後の本来のプロファイル条件を選ぶ必要があります。詳細は `docs/hook-analysis.md` を参照してください。

依存元: [DexKit](https://github.com/LuckyPray/DexKit/tree/c9cd12a14b75409bebd2f73e4dfc5ff575df3eb8)、[公式デスクトップ手順](https://github.com/LuckyPray/DexKit/blob/c9cd12a14b75409bebd2f73e4dfc5ff575df3eb8/doc-source/src/en/guide/run-on-desktop.md)。上流のライセンスは上流ソースを参照してください。
