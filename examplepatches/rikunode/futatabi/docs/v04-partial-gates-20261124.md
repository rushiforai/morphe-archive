# futatabi v0.4.0 — 部分実装・検証報告（2026-11-24）

**判定：PARTIAL。4件中、画像高速化と初期板調整は実装・エミュレータで検証済み。広告枠の完全除去とめぶきは未実装。v0.4.0は未公開。**

## 1. 広告枠の完全除去：未実装（AOT側の確定が必要）

既存のBlockBannerAdsPatch.ktはAndroid側のBannerAdとAdManagerBannerAdのロードを失敗にするが、Flutter側の親ContainerやSizedBoxが確保した高さは変更しない。Google公式Flutterガイドも、AdWidgetを広告サイズの高さを指定したContainerに置く実装を紹介している（https://developers.google.com/admob/flutter/banner）。

ふたったー3.1.1のFlutter AOT libapp.soで、カタログとスレ画面の広告枠の生成位置はまだ確定できていない。Androidプラグイン側だけで固定サイズの親レイアウトを消す根拠がないため、バイナリやアプリUIへの推測パッチを加えない。**リワード広告は一切変更なし。**

## 2. あにまん画像の高速化：実装／ローカルフィクスチャE2E PASS

対象：AnimanchAdapter.java、BridgeServer.java。

- 従来は画像取得まで共通の1,250ms待機に入っていた。画像GETのみこの待機から分離し、上流の同時画像取得を最大4件に制限。HTML・投稿側の取得間隔は維持。
- BridgeのHTTPリクエストワーカーを2→6に変更。HTTP GETのストリームを閉じて接続再利用を可能にした。
- 画像をJPEGへ縮小変換した後にメモリLRU（10MiB）とディスク（48MiB／24時間）に保存。サムネイル最大240px、原寸最大960px。
- 13桁の仮想IDを持つサムネイルs.jpgと原寸.jpgのURL体裁は維持。

エミュレータ emulator-5554、テスト専用APK、ローカル画像フィクスチャ（上流画像ごと250msの遅延）で12セルを検証。

| 計測 | 正常に取得したJPEG | 合計時間 |
| --- | --- | ---: |
| 初回並列取得 | 12/12 | 1,015ms |
| メモリキャッシュ時 | 12/12 | 94ms |
| アプリ再起動後、ディスクキャッシュ時 | 12/12、上流再取得0件 | 125ms |

上流フィクスチャの画像GET累計は10件。**これらは合成ネットワークでの実測であり、所有者の実サイトでの表示速度は未検証。**

## 3. 初期板調整：実装／純正初期データE2E PASS

対象：FutatabiProvider.java。

初回だけ実行するフラグ futatabi.v04.default_boards_done をアプリ専用SharedPreferencesに導入。未登録状態、または純正の「ねこ」だけとBridge板で構成される初期リストに限って、「ねこ」を削除してimg・mayを追加。Bridgeのあいもげ・あにまん登録は引き続き冪等。後からユーザーが編集した一覧は移行フラグにより上書きしない。

エミュレータで「ねこ」だけのテスト入力を作成して起動し、**img、may、あいもげ、あにまんの4板・ねこ無し・移行フラグ保存を確認**。

追加の「編集後再起動」試験では、手作業で生成したテスト用XMLが不正で読み込み失敗したため、この試験は**未検証**とする。成功扱いにはしない。実環境のSharedPreferencesは退避したものとSHA-256一致で復元済み。

## 4. めぶき：未実装（読み取り段階で仕様不足）

公開GETで確認できるのは、5分遅延のおためしカタログAPI /api/trial/catalog と /api/trial/trending。後者にはslug、name、messageCount、imageUrlがある。ただしログイン済みスレの /api/thread/:tslug/messages は匿名GETではトップページへ戻され、本文・添付の実データ契約を確認できない。

「読み取りE2Eを通してからログイン、その後に書き込み」というMUSE指定の段階ゲートを守るため、ログイン済みスレのJSON構造、Cookieの実名・属性・有効期限、投稿フォームの正規フィールドやサーバ側応答を**推測で実装しない**。実OAuthや実サイト投稿もしていない。MUSE側の契約・許可範囲の検収が必要。

## 保全と次の判断

- テスト専用パッチ：741,903 bytes、SHA-256 0a4596b42a1b3e861a3e3640328ce664ac10b7acb07bbbdba6f29a17b836a09d。
- 通常HTTPSへのソース復旧後、Gradle BUILD SUCCESSFUL。開発ビルド（バージョン未更新、内部0.3.0）：742,121 bytes、SHA-256 b42f19700c9bbcc7ac81220a2866fb3b830141823f7c7dce42dd0597d66dde9b。テスト版とハッシュ不一致。
- エミュレータの元APK、SharedPreferences、元18766フィクスチャを復旧。外部通信遮断と一時ADB forwardは解除。従来のADB reverseのみ保持。
- 検証データ：[v04-image-default-boards-20261124.json](gate-evidence/v04-image-default-boards-20261124.json)。
- 0.4.0へのバージョン変更、patches-list.json・patches-bundle.json更新、GitHub Releaseは**未実施**。公開済みv0.3.0を変更しない。

**MUSEへの確認依頼**：①ふたったーAOTのカタログ／スレ広告枠を生成するコード位置（安全に高さ0へ変える根拠）、②めぶきの認証済みスレ本文・添付とmultipart投稿の実物レスポンス／フォーム契約、③Cookie属性と有効期限。これらが未確定の間は残り2件をPASS扱いにしない。
