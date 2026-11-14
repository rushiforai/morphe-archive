# 通常版ChMateへエッヂの書き込みを渡す

Haiagaruのエッヂ書き込み画面のメニューに「通常版ChMateで書き込む」を追加する。
本文と、新規スレ作成時のスレタイを、通常版の公開Activityへ明示Intentで渡す。
通常版の画面で利用者が送信し、通常版に保存されたCookie・エッヂレベルを使う。
root、Shizuku、プロキシ、CA追加は不要。

## 操作

1. 同じAndroidユーザーに通常版ChMateをインストールし、エッヂの認証を済ませる。
2. Haiagaruでエッヂの書き込み画面を開き、本文と必要なスレタイを入力する。
3. メニューの「通常版ChMateで書き込む」→「通常版へ渡す」を選ぶ。
4. 通常版の投稿先・本文・名前・メール欄を確認し、通常版の画面で送信する。
5. 通常版から投稿成功の結果（RESULT_OK）を受け取るとHaiagaruへ戻り、渡した下書きを削除する。戻るボタンで中断した場合はHaiagaruへ戻り、下書きを保持する。

名前・メールは通常版の設定を使う。書き込み履歴・自分の書き込みマーク・Cookie更新も通常版側で管理され、Haiagaruへ自動同期しない。
通常版248では同じ投稿先の下書きが残っていると、受け取った本文が追記される場合がある。通常版で本文全体を確認してから送信する。
通常版248の成功分岐がsetResult(RESULT_OK)とfinishを行うことをDEXで確認した。専用の非公開relay Activityで結果を受け取り、成功時だけ渡した下書きを削除する。本文・スレタイが受け渡し後に変わった場合やプロセスが消滅した場合は削除しない。実際の公開投稿による成功試験は行っていない。
渡す前にネイティブ下書き保存処理を呼び、通常版を開けない場合にも本文を保持する。

## 連携仕様

- パッケージ固定: `jp.co.airfront.android.a2chMate`
- Activity固定: `jp.syoboi.a2chMate.activity.ResEditActivity`
- action: `android.intent.action.SENDTO`
- data: ネイティブ編集モデルから得た `https://bbs.eddibb.cc/liveedge/` または同ホストの `/test/read.cgi/liveedge/{正のスレID}/`
- `Intent.EXTRA_TEXT`: 現在の本文。改行・Unicode・引用をそのまま渡す。
- `Intent.EXTRA_SUBJECT`: スレ作成時の現在のスレタイのみ。
- 連携用のbooleanマーカーを追加。パッケージ変更版の自己画面遷移補正は、マーカー・action・通常版の固定Component・正規化済みエッヂURLがすべて一致する場合に限り、このIntentを通常版へ保持する。
- 専用のStockPostingRelayActivityをApplication context + FLAG_ACTIVITY_NEW_TASKで開き、その画面から通常版をstartActivityForResultで起動する。ChMate独自Activityの内部編集画面への取り込みを避け、成功・中断の結果を受け取る。
- 本文は128 Ki文字、スレタイは改行なし1024文字まで。超過時に切り詰めず停止する。
- URIのuserinfo・別ホスト・別ポート・query・fragmentを拒否。本文内URLから投稿先を決定しない。
- アプリ未導入・無効化・起動拒否時は、別アプリへフォールバックせず下書きを保持して案内する。

通常版248のManifestでActivityが`exported=true`、エディター側でdata・EXTRA_TEXT・EXTRA_SUBJECTを読み取ることを確認。
端末のresolve-activityでも同Activityを確認済み。元の通常版APKや保存領域を変更する処理はない。
Haiagaru側は既存の191/226/241/242用の編集画面フックを利用し、ネイティブ下書き保存処理の先頭のタイトル読み取りに対応するgetterを生成する。

以前のエッヂCookie移行・受信UI、ローカル受信サーバー、取り込み専用の永続化ブリッジ・テストは削除した。
通常版248はHTTPSを使うため、従来のHTTP受信方式ではCookieを取得できなかった。
旧テスト版で通常版のProxyを変更した場合は、通常版の設定で元に戻す必要がある。

## 検証

`scripts/StockChmatePostingRulesTest.java` は模擬本文・URLで対象の限定、スレURLの正規化、スレ立てと返信の区別、空本文・タイトル・IPCサイズ制限を確認する。
GitHub Actionsの `Verify stock ChMate posting` で上記テストとMPP生成を行う。
公開掲示板への投稿は検証に使用しない。

2026-11-14の検証結果:

- 投稿先・入力のホストテスト36項目成功。
- 未改造191/226/241/242のネイティブ下書き保存・スレタイ取得位置を検証。
- コミット849da1fのCIでMPP生成成功: https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/43503227151
- 同MPPを191へ7パッチ適用してAPKを生成。DEXでタイトルgetter、自己遷移補正の限定例外、旧受信クラス・移植メソッドの削除を確認。
- 隔離エミュレーターで実際のHaiagaru編集画面から未改造通常版248へ連携。通常版無効時の案内・下書き保持等32項目、返信とスレ立て・Unicode/改行・キャンセル・引き渡し後の下書き保持等47項目成功。
- 検証はrootやShizukuを使わず、通常版の画面への引き渡しまで。公開投稿・実アカウントのCookie抽出・レベル更新のサーバー検証は行っていない。
- Mi Note 10の既存テストアプリを更新インストール。通常版と既存の通常使用用Haiagaruは更新していない。

テストアプリ表示名: `Haiagaru 通常版書込連携テスト`。
パッケージは旧Cookie移行テストと同じ `jp.co.airfront.android.a2chMate.haiagaru.cookietransfer191`。
APK SHA-256: `48e4d2bd75d63c8513a7c861d8e4ce1f5a2efaf7c08f819fb2cca6760aefe32b`。

## 追加した設定と操作

- Haiagaru設定 → 書き込む → 「書き込みボタンの長押しで通常版ChMateを開く（エッヂ）」を追加。初期OFF。OFFや対象外の板では既存の長押し操作を保持する。
- スレのツールバー候補に「標準アプリで書き込むを開く」を追加。エッヂのスレで利用し、本文を追加せず通常版の既存下書きを開く。
- 確認画面に「次回から表示しない」を追加。「通常版へ渡す」を押した場合だけ記憶する。設定の「通常版ChMateへ渡す確認を省略する」で解除できる。
- 最新候補の3版パッチ適用・タイトルbridge・自己Intent例外・長押しの元命令とレジスター保持を確認。Mi Note 10の隔離191でrelay/中断/成功削除/設定省略/ツールバー/長押し15項目成功。結果は模擬し、実投稿は行っていない。

- 書き込む設定の「書き込み画面の『︙』に『通常版ChMateで書き込む』を追加」は初期オン。オフはメニュー項目だけを非表示にし、ツールバーと長押しの起動は独立して利用できる。設定共有でも初期値trueとして扱う。
