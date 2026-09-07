# 引き継ぎメモ

更新: 2026-09-06

## 現在の状態

- microGログイン修正とセキュアフォルダのエラー(19)回避を実装済み。
- 通常領域: チャット「１＋１」→「2 です。」、「２＋２」→「4」を実機で確認。アプリ終了・再起動後もログインを維持。
- セキュアフォルダ: user 150で `Work profile is allowed`、`Server eligibility response is ok`、`Robin is eligible` を確認し、その後ユーザーが利用成功を確認。
- GitHub管理向けにソース・スクリプト・ドキュメントを整理。旧APK・ログ・個人メモは `local/` に保管。
- ユーザーの明示指示でリポジトリを公開へ変更済み: https://github.com/ryuya0124/gemini-microg-patches
- 署名キーを維持。パスワードはユーザーの指定により `local/SIGNING.md` に明記し、`.env` に設定済み。これらはGit対象外。

## 次に作業するとき

1. [README.md](README.md) と [docs/architecture.md](docs/architecture.md) を読む。
2. `git status --short` で他の作業の差分を確認する。
3. `scripts/check-repo.sh`、`scripts/setup-tools.sh`、`scripts/compile-patches.sh` を実行する。
4. APKに影響する変更では `scripts/build-all.sh`、`scripts/sign-apks.sh` を実行する。
5. 端末を明示して `ADB_SERIAL=... scripts/install-device.sh`。Secure Folder内はユーザーが手動起動する。
6. 実機結果と未確認事項をこのメモに追記する。生ログに含まれるトークンやアカウント情報はコミットしない。

## 変更してはいけない前提

- `Account Switch Lock Bypass`、`Account Sync Binder Loop Fix`、`Account ID Fallback for Clone` は無効のまま。固定AccountIdやBinder成功の偽装はログイン不能・同期ループの原因になった。
- Dagger向けにはプロセス名から `.morphe` を除去するが、アカウントストアのmain-process判定は実際のプロセス名を使う。
- microGのUI actionは転送し、互換Binder service actionは元名を維持する。
- 権限要求の挿入位置はonCreate末尾ではない。末尾ではp0がActivity以外の値に上書きされる。
- エラー19は `appk.k` の `appk.x:Z` を読む1命令だけ変更する。Android全体のmanaged-profile判定は変更しない。
- 元APKのハッシュを検証する。別バージョンに対応するときは、難読化名と制御フローを再調査する。

## 整理後の検証記録

- JDK 21・固定Kotlin 2.4.10でGoogle本体、Geminiランチャー、xxhdpi splitを元APKから再生成。
- MainActivityの分岐先検証成功。
- エラー19修正が1命令で、レジスタ・命令幅・分岐オフセットを維持することを検証。
- 3つのAPKを既存キーで署名し、apksignerによる検証成功。
- 動作確認済みv8と再生成後のGoogle本体（15 DEX）・Geminiランチャー（4 DEX）のDEX内容が完全一致。
- ShellCheckとactionlintでスクリプト・Actions定義の検証成功。
- GitHub CIは2026-09-06の再実行で成功。実行ID 34036990773。スクリプト検査・パッチと検証ツールのコンパイル・Artifact保存まで確認。以前の課金ロックによる停止は今回解消している。課金設定はこちらでは変更していない。
- Macのoriginを上記リポジトリに設定済み。リポジトリ専用Deploy keyでfetch/pushする。秘密鍵はlocal/keys/github-deploy-ed25519、core.sshCommandはこのリポジトリ内だけに設定。アカウント全体の認証情報はコピーしていない。
- 旧履歴はlocal-history-before-organizationブランチとbundleに保持。通常のgit pushはmainのみ。git push --allは実行しない。

## ローカルに保管した旧資料

- `local/archive/before-organization.bundle`: 整理前のGit履歴。
- `local/archive/before-organization.diff`: 整理前の未コミット差分。
- `local/HANDOFF-private-history.md`: 以前の詳細調査メモと環境情報。
- `local/archive/dist-v8-before-reorganization/`: ユーザー確認済みv8のAPK。
- `local/archive/work/`: 途中の検証コード・ログ・ビルド。
- `local/archive/authfix-result.json`: 他作業由来の結果をそのまま保管。

旧Git履歴には署名パスワードを含むため、GitHubには整理後の新しい履歴を使用する。旧履歴をpushしない。

## 未確認・制約

- Gemini Live、音声、端末アシスタント設定、端末全体の再起動、他のGoogleバージョンは未確認。
- Samsungでは `am start --user 150` が拒否される。インストール更新は可能だが、フォルダ内の起動は手動。
- GeminiやGoogleのサーバー仕様変更によって利用できなくなる可能性は残る。

## MPP配布対応（2026-09-06）

- 中間JARだけの配布を修正し、scripts/build-mpp.shでAndroid DEXとManifest情報を含む正式なMPPを生成。
- R8/D8 9.4.17をSHA-256固定。SDK Build Tools 36.0.0内蔵D8はKotlin 2.4のmetadataを処理できなかったため使用しない。
- VerifyMpp.ktが全JVMクラスのDEX収録とManifestを検証し、Morphe Desktopのlist-patchesでも読み込む。
- patches-bundle.jsonでRemote sourceを登録可能。Clone appは公式ソース側で別途有効にする必要がある。
- v0.1.0を公開済み: https://github.com/ryuya0124/gemini-microg-patches/releases/tag/v0.1.0
- CI実行34037445468とRelease実行34037506485が成功。全15 JVMクラスのAndroid DEX収録を検証。公開リポジトリURLをDesktopに渡してMPPをダウンロードし、13パッチの読み込みを確認。
- Manager上での全パッチ適用操作は未確認。APK生成は既存のローカルスクリプトで検証済み。

## バージョン別フック管理（2026-09-06）

- 実行用定義はcommon/versionsのGoogle/Gemini版別Kotlin、閲覧用はdocs/versionsの生成JSON。
- versionNameとversionCodeを完全一致で選択。未登録版の汎用フォールバックは廃止。
- エラー19・権限要求・プロセス判定・GMS可用性/署名検証・転送のアンカーと対象を定義から参照。検証コードも共有。
- 旧Lauby.aの誤記を実DEXのaiwk.fへ修正。Web転送回避の既存2命令挿入は保持。
- 新バージョンは旧ファイルを残して追加し、check-hook-profiles.sh --writeでJSONを生成。詳細はdocs/versions/README.md。
- 定義・入力ハッシュ・JSON整合性と未登録版拒否の検証をCI/Releaseへ追加。
- 新構成でGoogle/Gemini/splitを再ビルド成功。Googleの15 DEX、Geminiの4 DEXと各AndroidManifestが整理前とバイト単位で一致。
- 未登録versionName・異なるversionCodeの拒否、入力ハッシュとJSON整合性、MPP生成・17クラスのDEX収録・Desktop読み込みも検証成功。
- バージョン別フック管理をv0.1.1として公開済み。公開v0.1.0の既存ファイルは変更しない。

## v0.1.1公開（2026-09-06）

- Release: https://github.com/ryuya0124/gemini-microg-patches/releases/tag/v0.1.1
- Release Actions実行34038918051でMPP生成・構造検証・版別定義の検証・公開に成功。
- 配布物はMPP、patches-bundle.json、SHA256SUMS。Remote sourceの更新情報も0.1.1へ更新。

## 新版のフック解析（2026-09-06）

[解析ガイド](docs/hook-analysis.md) と [調査テンプレート](docs/templates/hook-investigation.md) を追加。`scripts/inspect-hooks.sh APK search SUBSTRING` で全DEXの参照を検索し、`dump` で完全記述子に一致するメソッドを表示できる。未知版の解析を許可するが、対応版登録やパッチ適用はしない。現行Google APKでエラー19の文字列からappk.kを再発見できることを確認。配布パッチの挙動は変更していない。
