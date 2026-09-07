# トラブルシューティング

| 症状 | 確認すること |
| --- | --- |
| `Missing input` / ハッシュ不一致 | inputsのファイル名と配布バージョン。config/inputs.sha256を不用意に書き換えない |
| KotlinやMorpheが見つからない | `scripts/setup-tools.sh` を実行。JDK 21が使われているか確認 |
| `INSTALL_FAILED_UPDATE_INCOMPATIBLE` | 既存アプリと署名キーが異なる。既存キーを使い直す。スクリプトは自動アンインストールしない |
| ログインできない | 同じプロファイル内にmicroGとアカウントがあるか、初回権限を許可したか確認 |
| 権限に「不明な操作の実行」と表示される | microG 7.0.0の `app.revanced.gms.EXTENDED_ACCESS` の表示。アカウント同期に必要 |
| 「連絡先とアカウント」の権限画面 | GET_ACCOUNTSの権限グループ表示。READ_CONTACTSを追加したわけではない |
| Webに転送される | Work Profileトランポリンパッチの適用結果を確認 |
| 利用できません `(19)` | WorkProfileEligibilityパッチの適用を確認。ユーザー150で許可ログが出るか確認 |
| Secure Folder内をADBで起動できない | Samsungの制約。フォルダ内でGemini (Morphe)を手動起動 |
| ADB `No route to host` | 接続先IP・無線デバッグのポート・ネットワークを確認し、ADB_SERIALを変更 |

APIキーやトークンをチャットやIssueに貼らない。アプリの生ログには認証情報が含まれ得るため、必要なエラー行だけを抽出する。画面ロックやSecure FolderのUI制限で取得できなかった画面を、過去のダンプで代用して判断しない。

動作確認はGoogle 17.54.18、Geminiランチャー1.0.958859967、microG 7.0.0、SM-S948Qで実施。Live・音声・アシスタント設定・別バージョンは未確認。
