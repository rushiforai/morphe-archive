# v0.2.0 Androidエミュレータ統合試験（2026-11-22）

対象：照合済みふたったー3.1.1 XAPKからマージしたAPKへ **Block banner ads + Clone app + Local board bridge** を同時適用。Android API 36 / `emulator-5554`。デバッグ署名したAPKをテスト専用クローン `com.Nanasaki.ftutter.morphe` にインストールした。元アプリ `com.Nanasaki.ftutter` は維持。

| 検収項目 | 判定 | 実測 |
| --- | --- | --- |
| XAPKマージ／3パッチ同時適用 | PASS | Morphe DesktopのPATCHING・REBUILDINGが成功、適用済み3件、失敗0 |
| 署名 | PASS | 既存のAndroidデバッグ鍵によるテストAPKの署名を`apksigner verify`でv1/v2/v3検証 |
| クローンとオリジナル共存 | PASS | `pm list packages`に両方 |
| Provider組み込み | PASS | AAPTに`dev.rikunode.futatabi.bridge.FutatabiProvider`、authority `com.Nanasaki.ftutter.morphe.futatabi.init`、Android側にも同Provider |
| ローカルサーバー | PASS | クローン起動後、`adb shell nc -z -w 1 127.0.0.1 18765` exit 0 |
| 自動板登録 | PASS | 初回起動の`flutter.itaList`に既定「ねこ」を残し、`http://127.0.0.1:18765/aimoge/`追加。利用規約同意後の板一覧UIに「あいもげ」 |
| 冪等性 | PASS | 強制停止→再起動後、Aimogeの同一URLは1件のみ、既定板も1件、既存の別板は保持 |
| 実APIカタログ | PASS | 既存UIに約20のセル・タイトル・レス数。null-checkエラーなし |
| 実APIスレ | PASS | 既存UIに投稿本文・投稿番号複数件。null-checkエラーなし |
| JPEG画像 | PASS | スレUIスクリーンショットで元画像表示を目視確認。JPEGレスポンスは署名`FF D8 FF` |
| 動画サムネイル代替 | PASS | MP4添付の仮想`/aimoge/src/9619791189401.jpg`をGETしてHTTP 200・20,460 bytes・`image/jpeg`を確認。動画自体をJPEGとして返さない |
| POST禁止 | PASS | HTTP 403 `Read only` |
| めぶき無効 | PASS | GET /mebuki/futaba.php?mode=cat → 503 |
| あにまん | **延期** | アダプタ未実装、初回自動登録なし。既存の利用者が登録した項目は消さない |

**検証経路**：テスト専用PCから `adb -s emulator-5554 forward tcp:18767 tcp:18765` でBridgeを照会。ただし画面検証は**パッチ済みのふたったー自身のUI**を使用し、外部カタログフィクスチャは使わなかった。

**実装制限**：GET専用のAimogeアダプタ（公式API `2026-11-11`、`/client-policy`確認、90秒／30秒／10分のTTL、1.5秒間隔、許可済みHTTPSドメイン、レスポンス上限、Shift_JIS数値参照変換）。ContentProviderのbind失敗はBridge機能のみ停止する設計。エミュレータでのポート競合故障注入は未実施。

**所有者実機で未検証**：実インストール、バナー視覚非表示、リワード広告（24時間非表示）導線。これらをPASS扱いしない。テスト用署名済みAPKは配布せず、Git管理対象外に保管。

**参考**：旧版の外部フィクスチャ実証は[こちら](gate4-may-real-html-parser-20261122.md)。この試験はアプリ内Bridge自体のE2E。
