# v0.4.3 — 意図的に削除した板の自動復活を防止

対象：ふたったー3.1.1、arm64-v8a、versionCode 65。v0.4.2の機能と公開8パッチを維持し、板削除と自動補完の区別のみを修正します。

## 原因と修正

従来の FutatabiProvider.completeBoards は、管理対象の may、img、jun、めぶきちゃんねる、あいもげ、あにまんの欠落を一律に補完していたため、利用者が削除した板も再起動で復活していました。

純正APKでは板削除から ItaListNotifier.remove（呼出し0x885e68）、_save（0x886040）、SharedPreferences.setStringList（0x702fc4）、setEncodedStringList（0x9bfdf8）へ進み、ネイティブの g6.m のPigeonハンドラが g6.a.f(String,String) を呼びます。純正バックアップ復元はこれを通らず FlutterSharedPreferences.xml 全体を直接置換します。

g6.a.f の入口に厳密なキー判定付きの保存処理を追加しました。flutter.itaList の通常保存前後で管理対象URLの存在を比較し、正常な保存で消えたURLだけを既存の別ストア futatabi_default_migration の futatabi.v04.deleted_boards_mask に記録します（6板のビットマスク）。その記録にある板は起動時・旧形式の復元時にも補完しません。他のキーは元の純正処理を通ります。復元の欠落数で推測しません。

削除記録のない板は復元時に補完します。復元された明示的な板レコードは消さず、再登録として扱います。保存された板の設定・独自板・配色・認証情報・投稿経路は従来どおり。旧形式は純正デコーダーで読み取った内容を既存のJSON形式に変換します。

## 削除を取り消す方法

板一覧の「＋ 板追加」→ URLを空欄のままOK → 「終了して復活」→ アプリを起動し直す。削除記録を解除して、不足する管理対象6板を再登録します。既にある板は重複登録しません。通常のURL追加は変更しません。確認画面の登録状態表示は従来どおり追加3板です。

## 検証・制限

- BoardDeletionContractTest：6板それぞれの単独削除、再起動相当の補完、繰り返し、手動復活、明示的再登録、全消失を伴う復元、複数・全板の意図的削除、削除履歴がある状態での復元、旧形式復元、無関係な設定保持を確認。
- MebukiBoardNameTest：既存のB復元・配色・順序・冪等性の回帰PASS。
- ImportCatalogContractTest：初回・復元HTTPS false/trueで3板×3条件の模擬カタログ応答PASS。
- 公開8パッチの実APK適用PASS。生成DEXのg6.a.fからpersistBoardListを呼ぶ処理と、手動復活のrequestBoardRecovery→終了を読み戻した。libapp.soはv0.4.2との差分が統計の版数文字列のみ。公開.mpp内の版ファイル・広告パッチ非収録を確認。
- 実際の端末の操作・投稿・ログインはしていない。実機での削除、再起動、実バックアップ復元は所有者確認待ち。
- v0.4.2以前に削除した板の意図は記録されていないため、更新時に一度復活する場合がある。記録は本版から開始する。板リストと削除記録は別ファイルに順に保存するため、保存失敗・強制終了がその間に発生した場合の完全な原子性は保証しない。
- C（並び替え）、E（ABIエラー対策）、F（個別板URL追加）は本版未収録。Gのみを先行する。

[導入・更新](https://morphe.software/add-source?github=rikunode/futatabi)
