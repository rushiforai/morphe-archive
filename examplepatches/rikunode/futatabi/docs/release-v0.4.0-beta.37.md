# v0.4.0-beta.37 — beta 系列の最終版

**beta 系列の最終版。所有者の実機検証はこの版でまとめて実施。**

対象はふたったー 3.1.1（ARM64、versionCode 65）。正式版ではなく、beta.36のキャッシュ対策を含む最終プレリリース。実機・エミュレータ操作、実投稿、実ログインは行っていない。

## A8: めぶきのGoogleログインボタン非表示
公式トップページの読み取り取得で HTTP 200、X・Google・Discord の各ボタンを確認。Google は aria-label「Google でログイン」と img[src="/social/google.svg"] の両方で識別し、めぶき公式 HTTPS オリジンのルートページだけで CSS display:none を適用する。DOM再描画にも追随し、X・Discord、既存の認証処理、Cookie、遷移、アカウント設定には触れない。公式側の構造変更で一致しなくなれば非表示にならない。実WebViewの表示と実認証は未確認。

## A9: jun（二次元裏）の既定追加
純正APKの文字列 pp+0x1eb30 に ://jun.2chan.net/jun/ があり、SureProvider の判定（0x915f24、0x915f64）で参照される。カタログは板URLに futaba.php?mode=cat、純正投稿URL生成は板に応じた /futaba.php?guid=on を使用。2026-11-27 の読み取り確認で img/may/jun の板トップ・カタログ・スレページがすべて HTTP 200。jun の投稿フォームは /jun/futaba.php?guid=on、multipart/form-data、mode=regist、返信時 resto 等を持ち、may と同じフォーム項目構成。実際の送信は未実施。
既存の板補完に https://jun.2chan.net/jun/ を「二次元裏（jun)」として追加。新規は6板、既存の5板へは不足分のみ追加、同じURLの既存junの名前・設定・順序は保持。jun 用ブリッジは作らず、純正経路を利用。既存のimg/may補完・名称正規化等の処理は変更していない。純正画面での実際の閲覧・投稿結果は所有者確認待ち。

## A10: 端末情報へのパッチ版付記
独立パッチ Append futatabi version to device info（既定ON）。純正 AOT InitApp.init（0x928660）からの DeviceInfoPlugin.androidInfo 呼出し（0x9295d0）と、version.release を末尾に連結（0x929648–0x929654）、tanmatsuInfoProvider へ格納（0x929750）する経路を確認。該当APKの唯一の直接呼出し。DEX LC5/c;->onMethodCall の release キー、Build.VERSION.RELEASE の読取り、Map.put の命令・レジスタ・参照先を前置検証して、その値にだけ /futatabi <版> を追加する。AndroidシステムのOS版・ホストアプリのバージョン・その他のプラグイン情報フィールドは変更しない。ただしこの方式はアプリ内部の device_info_plus 応答の release 値に付記するため、将来ほかの消費箇所が追加された版への流用は不可。実機の端末情報ボタンと投稿文字列の最終表示は未確認。
版数は Gradle の project.version から .mpp 内の futatabi-patch-version.txt をビルド時に生成し、適用時に読み取る。生成物の manifest Version と一致することを確認。手動の別版数更新は不要。末尾の想定例は /futatabi 0.4.0-beta.37。

## 検証
- 元APKの既知ARM64ハッシュ、既存Local board bridgeのAOT前置条件、A10の対象DEX命令列に一致した場合だけ適用。全9パッチ併用の生成APKは適用成功。libapp.soはbeta.36の検証済み生成APKとバイト単位で一致。
- MebukiBoardNameTest: 新規6板、旧5板からの追加、既存junの名前・設定・順序保持、復元・配色の回帰 PASS。
- MebukiLoginFlowTest: 遷移分類13件、認証エラー経路6件 PASS。実際のJava定数から抽出したGoogle非表示JSのNode DOMモックで Googleのみ非表示、X/Discord保持、再描画、重複初期化防止、別経路／別オリジン非適用 PASS。
- CacheSweepTest 30 assertions PASS。beta.36の制限・実機効果測定待ちは変更なし。
- 生成APKの再逆コンパイルで release 値への concat("/futatabi 0.4.0-beta.37") と他のversionフィールドの一致を確認。DEXに対象クラスが各1個であること、.mppの生成版数とmanifestの一致を確認。
- **所有者の実機検証はこの版でまとめて実施**。正式版の公開はその判断後。
