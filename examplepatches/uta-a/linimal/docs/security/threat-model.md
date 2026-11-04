# reference input preflight 脅威モデル

## 資産と信頼境界

信頼する成果物は review 済み descriptor と Android SDK の `apksigner` です。APKM はローカルで与えられる非信頼入力として扱います。守る対象は、ホストのファイルシステム、一時ディレクトリ以外への書込み禁止、APK 原本、秘密鍵・認証情報、LINE のアカウント/メッセージ/URL/token を含む解析出力です。

## 脅威と対策

| 脅威 | 対策 |
| --- | --- |
| 別版 APKM や split の差替え | APKM、base、全 split の SHA-256 と正確な entry set を照合する。|
| zip slip | 絶対 path、`..`、空 path 部品、NUL、Windows separator を拒否する。`ZipFile.extract()` を使わない。|
| zip bomb / 巨大 entry | entry 数、entry 展開サイズ、合計展開サイズ、圧縮率を descriptor の上限で拒否し、チャンク単位で上限を再確認する。|
| 同名/想定外 entry | 重複を拒否し、許可リストと完全一致しなければ拒否する。|
| 偽造または壊れた APK 署名 | APKM 内の各 APK へ SDK `apksigner verify --verbose --print-certs` を実行し、scheme、Source Stamp、lineage、fingerprint を照合する。|
| manifest 偽装 | 標準ライブラリ実装の binary Android XML reader で package/version/SDK/required split/split name を読む。|
| 残留データ | APK は private `TemporaryDirectory` のみへストリーム展開し、`finally` 相当の context manager で削除する。subprocess 出力はメモリだけで処理し、ログを書かない。|

## 残存リスク

この gate は APKM の同一性を確認するもので、パッチ後の LINE の認証/integrity 挙動、端末 installability、機能の安全性を保証しません。`apksigner` と SDK 自体は開発環境の信頼境界であり、CI では既知の SDK build-tools を明示的に指定します。

パッチ側では、再署名で失われた push 通知の登録を戻すため、Firebase Installations が送る `X-Android-Cert` の値だけを公式証明書の SHA-1 に置き換える（[ADR 0002](../adr/0002-fis-certificate-header.md)）。送るのは公開鍵の識別子だけで、元の署名鍵は扱わない。これはアプリの身元を Google の API key 制限に対して偽る処理であり、利用規約上のリスクと、Google 側の検証変更で効かなくなるリスクが残る。

同じく、再署名で使えなくなる Google ドライブ連携を戻すため、`GoogleAuthUtil` の token 要求だけを MicroG-RE へ向け、manifest の meta-data `app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE` で公式証明書の SHA-1 を申告する（[ADR 0003](../adr/0003-microg-re-google-auth.md)）。Google アカウントでの LINE へのログインも、同じ設定で Identity API の Sign-In だけを MicroG-RE へ向ける（[ADR 0004](../adr/0004-microg-re-google-sign-in.md)）。MicroG-RE は申告値を検証しないため、meta-data を書けるのはパッチ適用者だけという前提が信頼境界になる。利用者は第三者アプリである MicroG-RE と、そこに追加した Google アカウントの資格情報を信頼することになる。OAuth client の照合に対して身元を偽る処理であり、利用規約上のリスク、Google アカウントへの影響、Google 側や MicroG-RE の変更で効かなくなるリスクが残る。MicroG-RE は、パッケージ名に加えて公式リリースの署名証明書（SHA-256）で確かめ、一致しなければ未導入と同じに扱う。同じパッケージ名の別アプリへ token の要求を渡すと、そのアプリが返した別アカウントの token でトーク履歴のバックアップが送られうるためである。MicroG-RE が未導入のときは元の経路を使い、導入を案内する通知の URL は固定のリリースページに限る。

preflight に URL、message content、credential、keystore、private key を渡したり保存したりしてはいけません。エラー出力は入力不一致を示す最小限の情報だけに限定します。
