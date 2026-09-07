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
