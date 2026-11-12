# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 概要

Linimal は公式 LINE Android クライアント向けの Morphe パッチバンドル（GPL-3.0）。対象は LINE 26.16.0 (versionCode 261600106) arm64-v8a の APKM のみ。すべての機能は Morphe のパッチ選択ではなく、LINE 設定画面の一番下に追加される Linimal 設定で runtime に切り替える。設定 OFF のときは公式 LINE の挙動を維持する。唯一の例外として、下部タブの VOOM はサービス終了に伴い設定なしで常に取り除く（`MainTabHooks`、`docs/analysis/main-tabs.md`）。

ドキュメント、コメント、コミットメッセージは日本語。

## コマンド

ビルドには Java 17 と、Morphe の GitHub Packages 認証情報（`~/.gradle/gradle.properties` の `gpr.user` / `gpr.key`、または環境変数 `GITHUB_ACTOR` / `GITHUB_TOKEN`）が必要。認証情報をリポジトリへ置かない。

```sh
./gradlew --no-daemon test buildAndroid          # 全テスト + パッチバンドルのビルド
./gradlew :patches:test --tests dev.utaa.linimal.patches.features.premium.PremiumUnsendPromotionPatchTest
./gradlew :extensions:linimal:test --tests dev.utaa.linimal.extension.config.LinimalConfigTest
./gradlew :patches:generatePatchesList            # patches-list.json を再生成（build に依存）
python3 -m unittest tests/test_preflight_reference.py
python3 scripts/preflight_reference.py --apksigner "$ANDROID_SDK_ROOT/build-tools/37.0.0/apksigner"
```

- 常駐 Gradle daemon が欠損した instrumented plugin JAR を参照して失敗したことがある。キャッシュは削除せず `--no-daemon` で回避する。
- 出力は `patches/build/libs/patches-*.mpp`。runtime extension は `extensions/linimal.mpe` としてこのバンドルに同梱される。
- 実機確認用の APK は Morphe Desktop CLI で生成する（Java 21 以上が必要。ビルド用の Java 17 とは別）。`java -jar morphe-desktop-*-all.jar patch --patches patches/build/libs/patches-<version>.mpp --out line-linimal.apk line-apk/<APKM>`
- `line-apk/` の APKM はローカル専用の読み取り入力。APK/APKM、逆コンパイル結果（`base/`、`jadx-out/` など）、署名鍵はコミットしない（`.gitignore` 済み）。

## アーキテクチャ

2 つの Gradle モジュールが build-time と runtime に分かれている。

- `patches/`（Kotlin）: Morphe の `bytecodePatch` / `resourcePatch` で LINE の DEX とリソースを書き換え、`extensions` の static hook を呼ぶ命令を注入する。
- `extensions/linimal/`（Java のみ）: LINE のプロセスに注入される runtime コード。Kotlin stdlib を持ち込むと LINE 本体のクラスと衝突するため Java で書く。`extensions/proguard-rules.pro` で `dev.utaa.linimal.extension.**` 以外を注入しないよう保つ。

### パッチ側

- ユーザーに見える選択肢は `LinimalPatch.kt` の `Linimal` と基盤パッチのみ。機能パッチは `dependsOn` による一本の鎖でつながっており、`LinimalPatchTest` がその鎖の順序を検証する。新しいパッチは鎖に挿入し、このテストも更新する。
- fingerprint は難読化されたクラス名を主要条件にしない。文字列、opcode パターン、安定した型で一意に特定する。
- 各パッチは `patchStatusCollector.record(...)` で expected / actual の target 数を記録する。誤一致や一意でない場合は書き換えずに `recordUnsafeFeatureStatus` で PARTIAL / TARGET_NOT_FOUND / ERROR を記録し、LINE を元のまま残す。
- `PatchStatusResourcePatch` が最後に `assets/linimal/patch-status.json` として status を APK に書き出す。
- `PatchStatus.kt` の `FeatureId`（runtime 設定単位）と `PatchId`（パッチ単位、feature に紐づく）がパッチ側の ID 定義。

### runtime 側

- `LinimalBootstrap` が LINE 起動時に初期化し、`LinimalConfig` が設定（SharedPreferences、`LinimalConfigStore` が独占アクセス）と patch-status を読む。
- `PatchStatusRequirements.java` は feature ごとに必須の patch ID 集合を持つ。patch-status 上の集合と完全一致した feature だけが有効になり、それ以外は設定画面で操作不能・hook も公式挙動になる。`PatchStatusRequirementsContractTest`（patches 側）が Java ソースを文字列で読んで `PatchId` と突き合わせる。
- `features/*Hooks.java` は必ず fail-open。設定 OFF・未初期化・例外時は LINE 本来の処理を続ける値を返す（例: `shouldSuppress...` は例外時 `false`）。Android 依存部分は interface の seam に切り出し、判定ロジックを local JVM test で検証できるようにする。
- 設定画面は `settings/FeatureCatalog` 駆動。patch-status に ID がない機能は行自体を表示しない。

### 機能を 1 つ追加するときに触る場所

1 機能の追加はおおむね次を一通り変更する（例: コミット `0e24e85`）。

- patches: `features/<area>/<Name>Patch.kt` とテスト、`PatchStatus.kt` の `FeatureId` / `PatchId`、`LinimalPatchTest` の依存鎖
- extension: `LinimalFeature`、`LinimalConfigSchema`（キー追加。構造変更時は `CURRENT_VERSION` と移行を検討）、`LinimalDefaults`、`LinimalConfig`、`PatchStatusRequirements`、`FeatureCatalog`、`features/<Name>Hooks.java` と各テスト
- 文言: ソースには日本語の原文を書き、表示の直前に `LinimalText.t(...)` を通す。`i18n/LinimalTranslations` に英語・繁体字中国語・タイ語・インドネシア語の訳を足す（`LinimalTranslationsTest` が漏れを検出する）
- docs: README の機能表（英語の `README.md` と `README.ja.md`・`README.zh-TW.md`・`README.th.md`・`README.id.md` の 5 言語すべて。設定名は `LinimalTranslations` の訳と一致させる）、必要なら `docs/analysis/` の解析文書と `docs/testing/baseline-matrix.md`

既存ユーザーの設定値は更新後も引き継ぐ。`LinimalDefaults` は新規インストール向けの値で今後も変わる。migration が既存インストールへ書き戻す値は `LinimalLegacyDefaults` に凍結してあり、変更しない。

## 制約

- Firebase Installations が送る `X-Android-Cert` の値だけを公式証明書の SHA-1 に置き換える（`docs/adr/0002-fis-certificate-header.md`）。範囲をそれ以上に広げる変更は新しい ADR を要する。
- 既読系は UI ではなく実際の outbound 送信とローカル既読反映の経路で抑制する。未確認経路があれば完全対応と表示しない。
- smali 注入ではレジスタを壊さない。過去に model 参照のレジスタを boolean 結果で上書きして ART `VerifyError` になった例や、高位レジスタを非 range invoke に渡して invalid register になった例がある（`docs/testing/baseline-matrix.md`）。
- reference version 以外への適用や Morphe の `--force` は想定しない（`docs/adr/0001-reference-and-signing-policy.md`）。

## リリース

`gradle.properties` の `version`、`patches-bundle.json`（説明・download_url・version）、`generatePatchesList` で再生成した `patches-list.json` を 1 コミット（`chore: リリース vX.Y.Z ...`）で更新する。`patches-list.json` は手で編集しない。

## 参考資料

- `docs/analysis/`: LINE 内部の該当経路の解析（新機能の fingerprint 設計前に既存の解析を確認する）
- `docs/security/threat-model.md`、`docs/compatibility/`、`reference/README.md`
- `.linimal-feature-worklog.md`: これまでの実装経緯と検証結果の作業ログ
