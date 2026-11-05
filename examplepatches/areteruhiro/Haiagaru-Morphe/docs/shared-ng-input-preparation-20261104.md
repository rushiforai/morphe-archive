# 共有NG有効時の入力準備の追加最適化

dev.11配布後、利用者はオンライン共有NG有効でまだ遅いと報告し、`https://greta.5ch.io/test/read.cgi/poverty/1793682328/` を提示。前回の文字列検索器の改善だけで実症状が解消したとは扱わない。実スレ本文を取得/複製せず、入力生成経路を静的調査した。

191/226/242の共有NG経路は全レスの本文/名前をHtml.fromHtmlで変換してInputを生成する。226のmergeModernResponseFlagsは一致済みのレス番号を見るだけなのにresponseData(response).numberを評価し、ResponseData constructorで本文/名前も再変換していた。native hookの引数がBouncyCastleSocketAdapterCompanionであることをProgrammableNgPatch.ktから確認し、既存の同型ResponseDataと同じlフィールドだけを読むようにした。191/242のフックやNGビット/連鎖/既読は変更しない。

共通plain変換にNgPlainTextCacheを追加。入力HTML文字列そのものをキーとして、Html.fromHtml(...).toString()の結果だけを再利用する。投稿者IDやレス番号やオブジェクト同一性で使い回さないため編集・別本文は別キー。最大512件、入力+出力の合計1,000,000 UTF-16文字に制限し、大きい1件は保存しない。値はプロセス内のみ、ファイル/通信/ログに保存しない。変換中はcache lockを保持せず、複数threadの競合時も不変文字列だけを返す。NG判定結果/共有設定を保存しないため、設定・受信条件・例外変更の再判定は既存経路のまま。

検証: NgPlainTextCacheTestの5014項目成功。null/空・同内容別String・hash衝突・LRU件数/文字数超過・巨大入力非保存・本文変更・別threadの遅い変換でlockを保持しないことを確認。同一入力5000回に対し変換器1回。変換器の単体試験でAndroid Htmlや利用者スレの実時間ではない。共有NGindex10306/regex17/個別除外263はdev.11時の成功を保持し、今回判定器自体は変更しない。

既存index10306/regex17/個別除外263を再実行し成功。通常Lint付きbuild/buildAndroidは2m21s成功（build/shared-ng-input-preparation-build.log）。ローカル候補build/haiagaru-shared-ng-input-preparation.mppのCRC/cache同梱を確認。公開済みdev.11とは異なるローカル候補であり、内部version表記で公開済みと判断しない。

今回候補のAndroid Htmlの等価実行・端末起動/本文/画像/共有条件切替・指定URLでの実症状/実時間/クラッシュは未検証。191/242では反復HTMLが少ない場合、初回変換負荷は残る。標準NGや正規表現多数の別負荷も残り得る。静的修正方針を維持し、APK生成/導入/投稿/GAS変更/公開は行わない。

## 件数・容量の任意指定

利用者が再利用件数/容量を任意指定したいと要望。オンライン共有NG画面に「NG判定用テキストの再利用設定」を追加。最大件数と入力+変換結果の合計UTF16文字数（容量）を0〜2147483647の整数で設定する。初期512件/1000000文字、どちらか0なら無効、空/負数/桁あふれは保存しない。容量は文字データ約2MB/100万文字＋管理領域と明記し、実際のヒープ占有サイズと区別。初期値へ戻すボタンは入力のみ戻し保存で反映、キャンセル無変更。

保存するとprogrammable-ng prefsのplainTextCacheEntries/plainTextCacheCharactersをapplyしreloadでcache.configure。起動時/設定再読込でも取得する。plainの各呼出しでprefs再読込はしない。configureは上限を減らした分をLRU破棄し、0では既存全件を破棄。変換中に無効化されても再挿入しない。設定は既存のHaiagaruバックアップの「設定」カテゴリでprogrammable-ng全prefsとして保存対象（NGルールだけのカテゴリは既存ルール/ON-OFFのみ）。cache内容はバックアップしない。

host cacheテストを5020項目へ拡張し、件数0/容量0/再有効化/縮小時破棄/最大int/実行中無効化を確認。設定追加後の通常Lint付きbuild/buildAndroidは2m14s成功（build/shared-ng-input-cache-settings-build.log）。候補build/haiagaru-shared-ng-cache-settings.mppのCRC/settings class同梱確認。Android上の設定画面・入力保存・キャンセル・バックアップ往復は未確認。端末導入/公開は実施していない。

利用者が静的修正結果・端末未確認の報告後にプレリリースを指定。先行の静的/検証用公開方針を維持し、.releasercの冒頭に端末起動/本文/画像/設定操作/速度未確認を明記。本文の反復が少ない場合や標準NG/regexの負荷は残ること、5014→5020の単体試験とAndroid動作は別であることも記載。既存Semantic Release CIをdevへの通常pushで実行し、正式1.22.1を維持する。候補MPP SHA256 e6d49c44944ce192fc53a8e69594068370bc20b0221e9431b45d76c1cedea580。

公開完了: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.0-dev.12 、2026-11-04 21:19:47 JST。実装d6c5f61、CI41827274812のRelease/Attest success、生成5cdb378をdevへFF取得。API name=1.23.0-dev.12（検証用）/draft=false/prerelease=true。公開6asset size/digest/SHA256・MPP/ZIP CRC、NgPlainTextCacheSettings/容量keyと既存検索/URL/AA同梱、作業環境パス不在を確認。MPP SHA256 `9946d955a96b9e77d8bceef0def998f8e73c6d73988df37cc4a1cfe833b3f6d6`。dev両feedはdev.12、master/mainは正式1.22.1保持、任意3ZIPはdev.9と同一。証跡build/release-1.23.0-dev.12-verify/verification.json。公開CI版MPPの再適用/端末導入は実施していない。
