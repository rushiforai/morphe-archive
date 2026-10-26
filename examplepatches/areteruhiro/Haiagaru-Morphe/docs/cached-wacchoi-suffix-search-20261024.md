# 取得済みスレ検索の下4桁トグル（未公開）

## 仕様

ワッチョイ長押しから開くChMate本体の「取得済みのスレから検索」画面に「ワッチョイを下4桁で検索」トグルを追加。初期OFF、選択を端末内に保持。ONで完全なワッチョイを `-下4桁` に変換し、同じnative検索欄へ反映。ハイフンを残して上4桁との誤一致を避ける。OFFは元条件へ戻す。ただしON中に利用者が条件を書き換えた場合は編集内容を上書きしない。画面再作成用に元条件をfragment arguments内へ保存。

対象板・本文/名前など他の検索条件は変更しない。外部検索やNG登録には影響しない。完全なワッチョイを読み取れない検索では無効化し、無関係な文字列を勝手に切り詰めない。

## 版差

- 191: `jp.syoboi.a2chMate.fragment.SearchFragment`、native EditTextに反映。
- 226: `o.setUtf8okio`、model `o.isDirectory` のSavedStateHandleへSearchFormStateの先頭文字列だけをcopyして反映。既存フラグを保持。
- 242: `o.GNk49`、native SearchFragmentViewModelのquery setterで反映。

onCreateViewの戻り値に縦LinearLayoutを挿入する。重ね表示ではなくnative検索画面の領域内に収める。元Viewやfragmentのリスナーを置換しない。

## 確認状況

`CachedWacchoiQueryTest`の10項目成功（全体表記、+/、長すぎるトークン拒否、OFF復元、編集維持）。Android SDK jarに対する単体javac成功。

通常Lint付き全体ビルドは `build/cached-wacchoi-toggle-build.log`。APK適用/実UI確認は後続。作業ツリーには他チャットの設定/タブ/認証等と以前からの未完了修正もあり、それらを今回完成したとは扱わない。公開/バージョン名変更なし。

## 追試

- 通常Lint付き初回build成功（5m25s）。MPP `build/cached-wacchoi-toggle.mpp` SHA256 `603512F8274E50EE65B1B8DC5F4231180FB47601B194C74879871CCB58082096`。
- 191/226/242へのパッチ適用・再構築・署名成功。`VerifyCachedWacchoiHook`で各native onCreateViewの元命令/レジスター保持とwrapper挿入を確認。初回242検査は試験側がMOVE_OBJECT_16をFROM16と誤認して失敗し、修正後に成功。
- emulator-5554の242検証パッケージ `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`（Haiagaru 検証242）へ署名照合データ保持更新Success。初回APK `build/cached-wacchoi-toggle242.apk` SHA256 `EA5405EE6DFBE8A616EC72BCCC90F14ABE1A3F78F89A72EC14756D2DDE4A85D0`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。全artifactはcanonical root `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current` 基準。
- 242 native検索画面のON/OFF・保存・他条件保持・手動編集保持10項目成功。ただし最初は存在のみを確認しており、画面確認でtoggle boundsがy=0..86、ステータスバー下に隠れていると判明。検査不足として表示を修正。例外付き初期のFragmentManager反射試験は成功扱いしない。
- 226/242のedge-to-edge wrapperでsystemBars/cutout分を予約し、native Compose子には減らしたinsetsを渡す処理を追加。191の従来windowは変更しない。修正後通常Lint build成功2m58s（`build/cached-wacchoi-toggle-insets-build.log`）。最終242への適用/可視位置追試は継続中。
- 試験は合成検索語bed4-6Zunをnative画面へ入力したもの。実レスの検索結果網羅性や全検索フラグ組合せは未検証。テストの設定は復元、投稿/外部通信なし。191/226の実画面トグル操作は未実施。
