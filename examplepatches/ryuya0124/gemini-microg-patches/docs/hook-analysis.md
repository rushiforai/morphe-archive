# 新しいAPKでフックを探し直す

難読化名は版ごとに変わる。既存の名前は検索結果を比較するための記録であり、新版にそのまま適用する根拠にはしない。文字列 → メソッド → 呼び出し元と条件分岐 → 実機の症状、の順で確かめる。文字列自体が消えたり、別メソッドへ移動したりする場合もある。

## 読み取り専用の探索

`scripts/setup-tools.sh` の後、新しい元APKを `local/investigation/` に保存する。動作確認済みの `inputs/` を先に置き換えない。

```sh
mkdir -p local/investigation
scripts/inspect-hooks.sh local/investigation/google-new.apk search 'Work profile'
scripts/inspect-hooks.sh inputs/google-base.apk search 'Robin eligibility'
scripts/inspect-hooks.sh inputs/google-base.apk dump 'Lappk;->k(Lgtij;)Ljava/lang/Object;' > local/investigation/eligibility-old.txt
scripts/inspect-hooks.sh inputs/google-base.apk search 'Lappk;->x:Z'
```

このツールは全 `classes*.dex` の参照を部分一致検索する。文字列だけでなく、メソッド・フィールド参照も検索できる。APK SHA-256、DEX名、完全なメソッド記述子、レジスタ数、命令番号、code unit単位の位置と分岐先を出力する。`dump` は完全一致したメソッドの命令を表示する。0件はエラー終了し、複数件は候補としてすべて表示する。未知版でも解析できるが、対応版登録やパッチ適用は行わない。

`index` と `codeUnit` は別物。分岐先は命令数ではなくcode unitで読む。この表示は完全な逆アセンブラではなく、例外ハンドラやswitch payloadの詳細は省略する。複雑な制御フローはDEXビューアでも確認する。

## 今回の探索の手掛かり

以下の難読化名は **Google 17.54.18.ve.arm64だけ** の観測値。最新の正確な定義・件数・制約は [バージョン別記録](versions/README.md) を参照する。

| 症状・目的 | 探索文字列／参照 | 今回の対象と確認ポイント |
| --- | --- | --- |
| セキュアフォルダからWebへ飛ぶ | `Trampolining to web app for work profile.` / `Skipping trampoline to web app for work profile.` | `Laiwk;->f(Lfnbp;Lgtij;)Ljava/lang/Object;`。文字列直前のIF_EQZ/IF_NEZと入力値を追う。2つのfingerprintが同じメソッドに当たることもある。旧メモのLauby.aは誤りだった。 |
| 利用不可 (19) | `Robin eligibility : is disallowed on Work profile` / `Robin eligibility : Work profile is allowed.` | `Lappk;->k(Lgtij;)Ljava/lang/Object;` 内の `x:Z` のIGET_BOOLEANが1箇所。許可フラグをtrueにする分岐であること、他の資格判定を残すことを確認。コンストラクタのIPUTと取り違えない。 |
| プロセス名によるDaggerクラッシュ | `com.google.android.googlequicksearchbox:googleapp` | 呼び出される引数なしString返却メソッド `Leacx;->b()Ljava/lang/String;`。RETURN_OBJECTは2箇所。コンパイル済みの名前判定との整合を確認。 |
| AccountSyncServiceの自己接続ループ | `More than 1 custom main process specified` | 文字列は `Leact;->a()` にあるが、変更対象は同じクラスの `b()Z`。実際のプロセス名とContextのパッケージ名を比較し、ローカルストア経路を選ぶことを確認。 |
| Google Play開発者サービス署名判定 | `requires Google Play services, but their signature is invalid.` / `Unable to obtain package certificate history.` | `Lcwfs;->b(Context;I)I` と `Lcwft;` のbooleanメソッド3個。文字列のあるメソッドだけでなく対象クラスの呼出関係・戻り値の意味を確認。 |
| 初回のmicroG権限要求 | `MainActivity;->onCreate(Landroid/os/Bundle;)V` | MainActivityの `o:Z` 最後の書込み直後。今回13レジスタ、scratch v6/v7/v8。新版で生存値とp0の型を必ず再確認。 |
| ランチャーが元Googleを開く | `com.google.android.googlequicksearchbox` | Gemini 1.0.958859967では完全一致7箇所・7クラス。検索の部分一致件数を置換件数と混同しない。manifestのsplit要件も確認。 |

文字列が消えたら、近隣の残存ログ、同じエラー値を返す箇所、そのメソッドの呼出元、Context/アカウント/プロファイルAPI参照を順に追う。エラー値19だけでは対象を一意に特定できない。旧版と新版で条件がtrue/falseのとき何が起きるかを対にして記録する。

JADXが使える環境では `jadx -r --show-bad-code --no-inline-anonymous --no-inline-methods -d local/investigation/java local/investigation/google-new.apk` も補助になる。大きなAPKは時間とメモリを使う。コルーチンの擬似コードには復元失敗や不自然な重複分岐があるため、最終判断はDEX命令で行う。

## 再発させない失敗例

- MainActivityの末尾ではp0のレジスタが別の型に上書きされていた。単にRETURN_VOID直前へ権限コードを挿入すると壊れる。
- 分岐を含む挿入は `addInstructionsWithLabels` を使う。以前の挿入方法はVerifyErrorを起こした。レジスタ数、命令幅、分岐、例外範囲を再検証する。
- 全体の `isManagedProfile` を偽装しない。今回確認したエラー19の局所条件を対象にする。別の `Robin not available. Work profile` / `Showing Assistant is disallowed toast because work profile is enabled.` は未発症の別経路で、存在だけを理由に変更しない。
- account-switchロックを消す、bind成功を偽装する、アカウントIDを1に固定する案は解決策にならなかった。停止・トークン不整合を招くため、履歴用の無効パッチを再度有効化しない。
- プロセス名の正規化を全面削除しない。Daggerの判定とローカルストアの判定は必要な名前が異なる。

## 新版対応の完了条件

1. [調査テンプレート](templates/hook-investigation.md) をコピーし、旧版・新版のversionName/versionCode/SHA-256と候補の根拠を書く。版情報はAPK manifestから取得する。
2. [バージョン追加手順](versions/README.md) に従って別のKotlin定義を追加する。クラス名だけでなく記述子、フィールド型、件数、レジスタ制約を確認してJSONを生成する。
3. `scripts/check-hook-profiles.sh`、`scripts/build-all.sh`、`scripts/build-mpp.sh` を実行する。適用成功だけでは動作確認完了にしない。
4. 同じ署名キーで更新し、通常領域とセキュアフォルダでログイン・テキスト応答・強制停止後の再起動を確認する。未確認の音声/Live/端末再起動は未確認と書く。
5. 調査記録、HANDOFF、リリースノートを更新し、CIとReleaseの完了を確認する。

実機ログは現在のUID/PIDを取得して絞り、`local/` に保存する。user 150やUIDは別端末へ固定値で流用しない。`logcat -t` は全体の末尾件数を先に制限するため、目的のログを取りこぼし得る。セキュアフォルダではADB起動やUI取得が制限されることがあり、利用者の手動操作で確認する。UI dump失敗後の古いXMLを現在画面と判断しない。生ログにはアカウントや認証トークンが含まれるため、公開するメモは必要な文言だけを抜粋・匿名化する。

## 2026-11-03: 認定警告と新版の差分

Google 17.54.18のuser 150イベントログで `com.google.android.gms.gmscompliance.ui.UncertifiedDeviceActivity` の起動を確認。新版17.70.11ではログ `Redirecting to UncertifiedDeviceActivity.` から `Ldsuz;->invoke()Ljava/lang/Object;` を発見した（旧版はLdkww）。INSTANCE_OF直後のIF_NEZを、同じ幅・同じ分岐先のGOTO_16に変更し、警告画面の起動と元画面のfinishだけを飛ばす。端末のPlay Protect認定状態やサーバー側の完全性判定は変更しない。`VerifyCompliance.kt` で命令数・幅・分岐先・参照の保持と変更1箇所を検証する。

新版はtrampolineのskipログが消え、対象がajis.t、条件v13、適用1箇所になった。MainActivityは13→22レジスタで、p0はinvokeの短形式に収まらない。末尾の完了フラグ書込み時点のActivity別名v0を使用し、後続で使うv3/v19を保持する。プロセス名プロバイダeipn.bは戻り箇所が1個。資格判定はaqtv.kのx:Z。新版のJSONと調査記録も参照。

### 自動探索とキャッシュの方針

現在はMorpheのFingerprint/DEX検索で**パッチ生成時**に探索し、アプリ起動時に探索しない。文字列・引数/戻り値・参照先・分岐構造・期待件数を組み合わせ、版別の観測値とも照合する。難読化名だけが変わっても候補探索できるが、制御フロー変更は別途検証が必要。

[DexKit](https://github.com/LuckyPray/DexKit)も同種の複合探索を提供する。2026-11-10よりホスト解析ツールに導入した（analysis/dexkit/README.md）。MPP/端末には組み込んでいない。将来端末側に導入する場合は、初回起動またはAPK更新後の初回起動だけ探索する。APKのSHA-256（splitを使う場合はそれらも含む）・探索ルール版をキャッシュキーとし、同一キーでは探索しない。キーが変われば再探索し、0件/複数件ならフックせず停止して結果を記録する。更新前のキャッシュを無条件に流用しない。

### 警告だけ消しても送信できなかった理由

上記の転送抑止だけでは不十分だった。GMS complianceの結果処理 `dsuw` は非準拠の場合にservices/receivers/providersを無効化し、`PREFS_KEY_COMPONENTS_RESET_PENDING` をtrueにする。送信時には `InteractorProcessEndpointService` へのbindがfalseとなり、画面には「この機能はまだご利用いただけません」が出た。

`Checking for device compliance...` と `Feature is disabled!` から `Ldsvb;->a(Lhgpk;Lhgpk;)V` を特定。Boolean.booleanValue直後のMOVE_RESULTを同幅CONST_4 falseに置換して既存feature-disabled経路を使う。ここからdsvc.bの復旧処理が走り、通常のコンポーネント状態へ戻して一度再起動する。復旧ログとdisabledComponentsからのサービス消失、ユーザーによる送受信成功を確認した。旧版の対応メソッドはLdkwy.a(Lgtks;Lgtks;)V。

新規インストールだけでなく、**以前の認定チェックでコンポーネントが無効化された状態からの更新**を検証すること。bind成功を偽装したり、警告Activityだけ閉じたりしても根本解決にならない。`scripts/verify-apks.sh` には認定チェックのfeature gateと転送分岐の2つの単一命令差分検証を組み込んだ。

## 2026-11-10: Google 17.72.17 / Gemini Manifest

Google 17.72.17.ve.arm64 (301831138)を端末の元アプリから抽出。Geminiは1.0.995038376 (345)から変わっていなかった。DexKitで旧版・新版の9ルールを探索し、候補と参照関係を出力した。

- Trampolineはajiy.t(AccountId,hiiq)。ログ直前のIF_EQZ v2はnullable Booleanの判定で、本来の条件ではない。AND_INT_2ADDR v14,v9直後のIF_EQZ v14（命令146、code unit 264→392）を検証してからv14=0を挿入する。VerifyTrampolineで挿入1命令以外の命令・レジスタ・参照と全相対分岐先の対応を検証する。
- Process provider候補には新たにeyaq.bも現れたが、これはfbzs.GOOGLEAPPの文字列 `googleapp` を返す定数ヘルパー。現在のフルプロセス名を返すekjg.bとは別物。登録済み完全記述子に一致する呼び出しだけを選び、ekjc.bの実プロセス名利用と区別する。
- MainActivityは23レジスタになった。完了フラグo:Zはcode unit 811、Activity別名v0、scratch v6/v7/v8、後続cleanupのv3/v19は前版同様。新定義と元命令を照合した。
- Issue #7の画像の判定は、Gemini cma.b→ahx.u(getPackageInfo)→byf.a(versionCode)→BardEntryPointActivityの0判定→ErrorActivity(error-type=1)。パッチ済みDEXはクローンを検出するが、Manifest queriesに元Googleしか宣言されていなかった。連携先変更パッチの依存リソースパッチでクローン宣言を追加し、VerifyGeminiManifestで1件だけ存在することを検証する。修正前のAPKでは検証が失敗し、修正後は成功することを確認。
- 投稿者の環境や適用パッチは不明なので、Issue #7の原因をqueries不足だとは断定しない。元Googleを消した実機条件は別途検証が必要。

## Android ManagerとDesktopの生成差（v0.3.3）

`VerifyError: register index out of range` はフック名の変更だけでなく、パッチエンジン側の差も調べる。Patcher2.3.0はMutableMethodImplementationを内部サブクラスで包むため、旧private field reflectionは動作しなかった。レジスタ数の書換失敗を握りつぶすと、適用成功でも起動できないDEXになる。

プロセス名の正規化は元providerの割当を維持し、明示的な3レジスタのhelperへ移した。次版解析では実providerのreturnレジスタと全分岐先、helperパラメータ配置を検証する。特にキャッシュ分岐が補正を飛ばさないこと。`VerifyProcessName.kt` と `ProcessNameProbe` を両方実行し、Managerで原本から生成したAPKでも同じ検査を行う。詳細は [Manager再現記録](testing/issue-8-manager-registers.md)。
