# 引き継ぎメモ

更新: 2026-11-12（最新の追記は末尾）

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

## 2026-11-03更新（最新）

- 読み取り可能なMac作業先: `/Users/Shared/GeminiPatch-20261103/repo`。以前のDocumentsはSSHの権限で読めず、GitHubからcloneして再開した。
- Google 17.70.11.ve.arm64 / code 301827586、Gemini 1.0.995038376 / code 345を端末から抽出して対応。追加のLens/tclib動的feature splitは抽出・保管のみで、配布セットは従来と同じbase+xxhdpi。未検証機能は未対応と判断する。
- microGは7.3.0。user 150でGoogleのUncertifiedDeviceActivity起動を確認し、ローカル転送分岐を1命令変更。端末認定の偽装ではない。
- 古い署名キーが不明なため、ユーザーの指示でGoogle/Geminiクローンだけをアンインストールし、新キーでuser 150へ再インストール。microGと元アプリは維持。
- 新キーの保管先: Windows `B:\Androidアプリ 署名鍵\Gemini microG patches`。`gemini-release.p12`、`password`、`署名情報.txt`、`restore-map.json`。秘密鍵の再インポートとバックアップのSHA一致を確認。今後はこのキーを使う。パスワードは公開資料へ書かない。
- Macの`.env`と`local/keys/`にも設定済み。これらはGit対象外。Bドライブには日付サブフォルダを作らずアプリ単位で保管する既存規則に従った。
- DEX分岐、資格判定の1命令差分、警告分岐の1命令差分、MPP構造を検証。ユーザーがセキュアフォルダで警告消失・内部サービス復旧後のチャット送受信を確認。通常領域・強制停止・端末再起動は新版で未再検証。
- 探索はビルド時のみ。将来DexKitを実行時導入する場合の初回/更新後だけのキャッシュ方針はdocs/hook-analysis.mdに記載。

### 送信失敗の追記

初回の「できた」は起動確認だった。チャット成功の記録を訂正。送信時にUNIMPLEMENTED: InteractorProcessEndpointService bindService returned falseを確認し、user 150のdisabledComponentsにも同サービスが入っていた。警告転送だけの修正では不十分。Checking for device compliance...の既存feature-disabled分岐を選び、元のcomponent-reset復旧処理を通す修正を追加。検証完了までv0.2.0タグを公開しない。

### 送信失敗の解決確認

追加修正版を同じ新キーで上書きし、既存feature-disabled経路の復旧ログ、内部サービスのdisabledComponentsからの消失を確認。ユーザーに改めて送信・返答を依頼し「できた」と確認済み。最初の起動確認と混同しない。通常領域・端末再起動・音声/Liveは今回未再検証。

## 2026-11-10（最新）

- 作業先は `/Users/ryuya/Documents/GeminiPatch`。11月4日にSharedからGit履歴・入力・キー込みで移動済み。
- Google 17.72.17.ve.arm64を端末から抽出して新版定義を追加。Geminiは1.0.995038376のまま。
- Issue #7を調査。投稿者本人がclosed/not_plannedにしていた。コメント・再オープンは行っていない。queriesの変更漏れを修正し、Standalone Supportがsplitの話であることも明記。
- DexKit 2.3.0をホスト解析へ導入。9ルールの候補・参照関係をJSON保存。同じAPK/ルール/コード/ツールはキャッシュ利用。端末には探索コードを追加していない。ネイティブライブラリはtools下でビルドする。初回はscripts/setup-dexkit.sh。
- 新版のtrampoline直前にはnullable Booleanの別条件が増えたため、最寄り分岐を書き換える方法を使わず、検証済みAND_INT_2ADDR直後の条件と分岐先を使う。
- プロセス名探索では定数文字列googleappを返す別ヘルパーを除外。版別完全記述子に一致する本物のプロセス名取得関数だけを選択する。
- キーは既存のlocal/keys/gemini-release.p12を維持。バックアップはBドライブの既存アプリ別フォルダを維持。
- 入力ハッシュ/版定義/DEX分岐・資格判定・認定チェック・trampoline/Manifestを検証。実機更新をuser 150へ実施し、利用者の確認待ち。

## 2026-11-12: Issue #8（最新）

- 公式Clone appの名前・権限/Provider設定を明記し、Google/Geminiの許可参照を宣言済み権限に限って同じクローン名前空間へ補正。宣言そのものは公式Clone appがfinalizeで変更するため、こちらで先に変更して二重.morphe化しない。
- APKの固定packageName、permission宣言とprotectionLevel、Manifest/DEX参照、Provider競合をビルド・署名・インストール前に検証。
- default=falseの失敗実験3パッチは、HookIdのenabled=falseを実行時にも強制し、選択時に理由付きで停止。
- パッチ失敗時にMorpheの終了コードだけを信用しない。fresh出力とresult JSONを検証し、前回成功APKを失敗結果で置き換えない。
- 専用API36 Google APIsエミュレータで、元Googleが存在して権限を所有する条件から重複インストール失敗を再現。ユーザー削除後も失敗することを確認し復元。v0.3.0のLens許可参照不足と修正版の解消、元Google無効時の改造Googleへの起動を確認。adb root/suは未使用。詳細はdocs/testing/issue-8-emulator.md。
- 構成違い3ケースを拒否、失敗実験3つを停止、既存出力を維持するテストが成功。Manager内で外部ソースのオプションを強制する機能ではないため、英語手順を守る必要がある。
- エミュレータはアカウント未登録。チャット・実際のLens処理・OnePlus8実機/API31の動作を確認したという意味ではない。現行入力のminSdk=32は維持。
- 新たな署名キーは作成していない。Bドライブの既存キーとMacの.envを維持。Issueへの返信/クローズはしていない。

### リリース前の追加クラッシュ修正

エミュレータ画面の追加確認でGoogle (Morphe) keeps stoppingを検出。元のプロセス名補正がlabel付きreturnの手前への挿入だったため、キャッシュ済みIF_NEZが補正を飛び越えていた。RETURN_OBJECTを補正の先頭命令に置換し、ラベルを保持して解消。

ProcessNameProbeがインストール済みAPKの実コードを呼び、初回/キャッシュ/seeded cacheの差を検証。旧版の未補正キャッシュとwidget receiverのClassCastExceptionを再現し、修正版の正常化とクラッシュ消失を確認。最終26項目+設定9項目が成功。保護されたAPPWIDGET_UPDATEは偽装せず、同じexported receiverのDI入口へ無害な独自actionを明示送信する。

公開前の最終証拠はlocal/issue8/emulator-verified/。スクリーンショットはログイン待ち画面（アカウント未登録）で、エラーのDownload Google画面でもクラッシュダイアログでもない。チャット/Lensの実処理を検証した意味ではない。

## Android 12での追加確認（2026-11-12）

- ユーザーからAndroid12エミュレータでの検証を指定された。API31イメージrevision11の専用AVD `GeminiPatch_Issue8_API31` を作成し、同じv0.3.1実装で26項目すべて成功。公開前のAPI36確認とは別の、公開後の追加検証。
- 既定入力のminSdk32をバージョン全体の制限のように説明した点を訂正。同じGoogle17.72.17.ve.arm64/301831138にAPI30 nodpi単体APK、同じGemini1.0.995038376/345にAPI29バリアントがある。Mac側Codexへユーザーの許可で取得だけを依頼し、通常ブラウザから原本を取得、ハッシュを検証した。
- 原本Google全14DEX・Gemini全3DEXが既定入力と完全一致。フックの追加変更・新しいMPP・署名キーは不要。最低SDKは原本もパッチ後も30/29を維持。minSdkを書き換えたローカル実験はインストールせず不採用。
- 元Googleあり／ユーザーのみ削除後の重複権限エラーを再現。API31で最初の衝突はC2D_MESSAGE。v0.3.0のLens許可不整合とキャッシュ後のWidget ClassCastExceptionを再現し、修正版で解消。元Google無効時の改造Googleへの起動、独自action受信後のクラッシュ無しを確認。元Googleの状態を復元。
- API31のdumpsysは `mResumedActivity:` を使うため、最初のテストは起動済みにもかかわらずAPI36向けの文字列判定で失敗。実際の両フォーマットを扱うようテストを修正し、全26項目を再実行。専用AVD・SDK・通常shellの制約は維持。
- 再現用ビルドは `scripts/emulator/build-android12-fixtures.sh`。既定の `inputs/` / `dist/` を置き換えない。記録・ハッシュ・コマンドは `docs/testing/issue-8-android12.md`、ローカル証拠は `local/issue8/api31/emulator-verified/`。
- エミュレータはGoogleアカウント・microG未登録。画面はSign in to use Gemini。インストール／権限／プロセス／起動確認であり、アカウント認証・チャット・Lens処理・OnePlus8実機の確認ではない。Galaxyの既存アプリは今回更新していない。
- v0.3.1公開済み。Issue #8へは利用者の指示で短い英語の返信を投稿済み。バージョン質問とAPI31非対応の段落は利用者の指示で削除。Issueは開いたまま。

## Morphe標準設定への対応・実機更新作業（2026-11-12）

- ユーザーが実機の更新と「Morpheの標準設定でインストールが通ること」を指定。v0.3.2としてAutomatic Clone Setupをdefault=trueで追加し、Google/Geminiの必須依存にもした。通常ビルドは独自ソースの既定選択のみで、公式Clone app/Expert mode/-O指定が不要。
- 原本Manifestの権限・Providerを先に記録し、Patcher1.12の名前順実行・逆順finalizeを使って最後に固定.morphe名前空間へ設定。既存のpermissionSupportは参照だけを更新する。旧公式Clone appの既定false/false、従来true/trueでも二重変換なし。任意名は明示的に停止。Automatic Clone Setupの既定選択を維持すること。
- 生成後の権限保護レベル、Manifest/DEX参照、Provider競合、各フックの命令幅/分岐を検証済み。既存キーで署名、公開MPPに26 JVMクラスのAndroid DEXを収録し検証済み。
- 配布MPPからの既定生成と旧設定の互換性/出力保持/実験拒否11項目成功。API31とAPI36で各26項目を再実行し、旧不具合の再現と修正版の解消が成功。詳細はdocs/testing/default-clone.md。
- install-device.shはANDROID_USERを両installへ渡す。未指定時は0、Secure Folderは150を明示。新規キー生成・アンインストール・データ消去は行わない。
- 実機のlease取得・同一署名でのuser150更新・データ領域/端末状態/インストール済みAPKハッシュ確認は、ユーザーが依頼を許可したMac側Codexへ担当を分離。端末の元Google/microGやuser0/10へは変更を加えない。実機チャットは利用者の確認待ちとして扱う。

### 実機への適用結果

- SM-S948Q / Android17のSecure Folder user150にGoogle/Gemini修正版を-r更新済み。Google base+xxhdpiは同一PackageInstallerセッション。インストール済み3APKのSHA256・既存署名を照合し一致。
- LensServiceは `com.google.android.googlequicksearchbox.morphe.permission.LENS_SERVICE` を要求する状態へ修正済み。user150のCE/DE領域を維持し、user0/10は未導入のまま。OS/SystemUI識別・SELinux状態も維持。
- Samsungがshellのcross-userアクセスを拒否したため、このSecure Folderへの自動更新では許可済みroot PackageInstallerを使用。通常ユーザーでのエミュレータインストールはshell UID2000で確認済み。
- 一時APKと所有したleaseを解放。親も `local/issue8/auto-clone/device-update/RESULT.md` と `verified-summary.json` を照合。更新後、利用者がログイン状態の維持とチャット返答成功を「返答できた」と確認。自動照合結果と利用者の動作確認を区別して記録。秘密の端末識別子・生ログはGitへ含めない。
