# HOME更新完了で先頭へ移動する問題（2026-11-08）

報告環境：191 dev / Pixel 10a / Android 17 / Haiagaru 1.24.1。HOME一覧の下まで移動して更新すると先頭へ戻る。

原本191のHOME Fragment `o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk.e(o.me)` は、更新があった通知（event.d）を処理し、進捗カウンターe/bが両方0になると `n_()` を呼ぶ。継承先のn_はnative ListViewへsetSelection(0)を実行する。この完了通知だけの呼出しをNOPへ置換し、データ更新・並べ替え・ボタン表示・ユーザーによる先頭移動・タブ切替は保持する。

対象は固定の191クラス/メソッド/38命令/register7を照合した1命令。アプリ全体のスクロール抑止や全クラス走査は追加しない。226/242の動作は今回の変更対象外。

検証 `HomeRefreshScrollInstrumentation` は実native Fragment/ListView/adapter/完了ボタンと150件のnative thread rowを隔離メモリに構築し、更新完了イベント（0,0,true）を送る。native modelはスナップショットなしとして、既存ユーザーのDBや閲覧履歴を触らずに完了時の先頭移動を通す。

- 修正前候補で130行目→0行目への移動を再現、4項目成功（baseline-dirty.log）。
- 初回は実HOMEの検索でobfuscated FragmentManager.getFragmentsが見つからず失敗。画面状態が「最近閉じたタブ」で本物のHOMEが存在しないケースもあり、隔離した実nativeオブジェクト方式へ変更。
- 最初の隔離試験はevent.d=falseで通知処理自体を通らず、先頭移動を再現しなかった。実更新を表すtrueにし、必要なtyped model/flowsを用意して再現確認した。これらの試験失敗を製品の成功には含めない。
- 既存Gradle build/buildAndroid成功（1分37秒、91tasks）。
- APKの固定class全メソッド・registerを直前候補と比較し、1命令だけの変更を確認する。

ユーザーが報告したPixel実機・動画での直接再現は未実施。1件のADB VIEW起動を含むコマンドがautomatic approval reviewでblocked by policyと拒否され、同操作は再実行しなかった。許可される検証用Activityの起動・隔離試験を使用した。

最終の位置保持/既存先頭移動/本文画像等の結果と候補hashは完了後追記。公開・実機置換なし。

## 最終結果

- 最終191候補で、更新ありの完了通知を4回通して可視行とpixel offset保持、手動n_による先頭移動を確認。12項目成功（build/home-refresh-scroll/confirmed.log）。
- 固定HOME class全43メソッドの命令/register比較成功。変更は完了通知メソッドのn_呼出し1命令→NOPのみ。native branch targetsはpatcherのlabel保持で再計算される。
- native gateway/本文/画像/composer/設定641項目、共有NGファイル削除/設定保持/全文エラー表示22項目、板一覧通知141項目成功。crash buffer空。226は直前の共通修正候補で647項目成功。
- 試験の先頭移動メソッドはprotectedのため初回getMethod失敗。その後の試験修正は変数名衝突でjavac失敗し、コマンドが旧試験APKを再作成したため同じ失敗を残した。コンパイル成否を検査し、getDeclaredMethod/setAccessibleの最終試験へ更新して成功。製品APKはその間変更していない。
- MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/home-refresh-scroll/final.mpp / SHA256 29992532c912383f529804538e7e02740065f942b518f1a38371177c58d2666d。
- APK final191.apk（同ディレクトリ） / SHA256 e065e8da5659025283131c799ed6fa906bde23d5d55117f14338ac34c9f3a901。emulator-5580の既存reporter191へ署名一致install-r。詳細台帳参照。実機導入・公開なし。
