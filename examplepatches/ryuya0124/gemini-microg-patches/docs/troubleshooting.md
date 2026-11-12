# トラブルシューティング

| 症状 | 確認すること |
| --- | --- |
| `Missing input` / ハッシュ不一致 | inputsのファイル名と配布バージョン。config/inputs.sha256を不用意に書き換えない |
| KotlinやMorpheが見つからない | `scripts/setup-tools.sh` を実行。JDK 21が使われているか確認 |
| `INSTALL_FAILED_DUPLICATE_PERMISSION` | v0.3.2以降の標準選択で原本から再パッチ。Automatic Clone Setupを選択したままにする。元Googleの削除は不要 |
| Providerの競合 | v0.3.2以降のAutomatic Clone Setupで自動設定。verify-clone-contract.shで生成物を確認 |
| Unsupported historical experiment | Account ID Fallback / Account Switch Lock Bypass / Account Sync Binder Loop Fixを選択解除する |
| `INSTALL_FAILED_OLDER_SDK` | APKのバリアントを確認。同じ版でも既定のAPI32入力とGoogle API30／Gemini API29版がある。Android12では後者を使う。最低SDKを無理に書き換えない |
| `INSTALL_FAILED_UPDATE_INCOMPATIBLE` | 既存アプリと署名キーが異なる。既存キーを使い直す。スクリプトは自動アンインストールしない |
| ログインできない | 同じプロファイル内にmicroGとアカウントがあるか、初回権限を許可したか確認 |
| 権限に「不明な操作の実行」と表示される | microG 7.0.0の `app.revanced.gms.EXTENDED_ACCESS` の表示。アカウント同期に必要 |
| 「連絡先とアカウント」の権限画面 | GET_ACCOUNTSの権限グループ表示。READ_CONTACTSを追加したわけではない |
| Webに転送される | Work Profileトランポリンパッチの適用結果を確認 |
| 利用できません `(19)` | WorkProfileEligibilityパッチの適用を確認。ユーザー150で許可ログが出るか確認 |
| Secure Folder内をADBで起動できない | Samsungの制約。フォルダ内でGemini (Morphe)を手動起動 |
| Secure Folderのuser150へのshellインストールが拒否される | Samsungのcross-user制約。プロファイル内の通常インストール操作、または許可済みrootのPackageInstallerを使う。データ消去・アンインストールで回避しない |
| ADB `No route to host` | 接続先IP・無線デバッグのポート・ネットワークを確認し、ADB_SERIALを変更 |

APIキーやトークンをチャットやIssueに貼らない。アプリの生ログには認証情報が含まれ得るため、必要なエラー行だけを抽出する。画面ロックやSecure FolderのUI制限で取得できなかった画面を、過去のダンプで代用して判断しない。

動作確認はGoogle 17.54.18、Geminiランチャー1.0.958859967、microG 7.0.0、SM-S948Qで実施。Live・音声・アシスタント設定・別バージョンは未確認。

英語の構成表は [setup-en.md](setup-en.md)、Issue #8の修正前後のエミュレータ検証は [testing/issue-8-emulator.md](testing/issue-8-emulator.md) を参照。通常CIはMPP/コンパイル検証であり、公開CI内でGoogle APKやアカウントを使うエミュレータ試験は行っていません。
