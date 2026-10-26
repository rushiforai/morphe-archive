# 過去ログページ端・下部フィルター位置・設定感度（未公開）

## 実装

- エッヂ過去ログの前へ/次へに最初/最後を追加。1ページ50件の既存仕様で総件数から最終ページを算出。最初/最後/取得中は適切に無効化。総件数不明のKyodemoでは最後を無効化し「最終ページ不明」を表示。全ページ走査・自動連続アクセスはしない。
- 下部BottomControlsのtoggleは任意keepQuickFilterPositionがOFFでもFilterPositionのPending(required=true)を登録する。解除直前のレスidentityとoffsetでnativecommit後の位置を復元。全解除も最初に一度だけcaptureし、個別reset通知のたびにcaptureを上書きしない。
- 242のMyLinearLayoutManagerではpending offsetのkが親クラスにある。初回試験の表示位置復帰でNoSuchFieldExceptionを確認し、jumpToResponse/Pendingの両方を継承階層探索へ修正。
- Haiagaru設定の基本設定に `settingsGestureSensitivity` (50〜200%、初期100)を追加。大きいほど必要距離が短い。ChMate標準gestureLengthから逆比例で算出し、DOWNごとに読み込む。標準ジェスチャーの割当/有効設定を尊重し、他画面へ感度を適用しない。設定共有にも範囲検証付き登録。専用HaiagaruSettingsGestures経路が対象で、本体側が処理するタブジェスチャー自体は変更しない。

## 検証

`VerifyFilterPositionAnchor` 9件成功。初回の通常Lint buildは成功したが、reset最終編集がJavaコンパイル直後だったため、全追記後のbuild/eddi-pages-filter-gesture-final-build.logで再ビルドしてからAPK生成する。

最終継承対応は `build/eddi-pages-filter-gesture-inheritance-build.log` 通常Lint build成功（4分52秒）、242元APK適用/署名照合install-r Success。

- `build/eddi-pages-gesture-fixed-model-test.log`: 10項目成功。ページ境界、最初/最後のボタンlistener・URLのpage引数、中間/末尾/総件数不明の有効状態、感度100/50/200%・範囲clamp。実通信して最終ページの内容を表示する試験ではない。
- 先行のsearch()呼出しをFridaで捕捉する試験はrequestsが空になり失敗。deopt試行でも解消しなかった。これを実ページ移動成功とはせず、最終試験はlistener/URI/状態検査に限定した。ログは残す。
- `build/bottom-filter-position-fixed-test.log` は位置不一致で失敗。追加diagnosticの最初の試行はProcess terminatedで未完了。APKが並行作業から更新されていたことを後で確認（下記）。
- `build/bottom-filter-position-fixed-diagnostic2.log`: 実native一覧7項目成功。任意keepQuickFilterPosition OFFで下部リンクフィルターON→途中へスクロール→OFF。target/currentともレス752、offsetとも-492px、解除後も同じレスと画面内位置を保持。フィルターと設定を復元、開始位置へのjumpToResponseも例外なく完了。
- 検査後crash buffer空、lastanrなし。191/226共通コードの端末重複導入は未実施。全フィルター種別/全解除の実操作・実機・設定画面のタッチ感度実操作は未確認。公開/版名変更なし。

## 導入記録・共有環境の注意

2026-10-24 JST、emulator-5554、ChMate0.8.10.242 dev、Haiagaru 検証 242、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。

絶対root `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current`。

- 初回APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/eddi-pages-filter-gesture242.apk` SHA256 `05ED9ED9EBDA00150BF39966BEDB9E7E234ECF1AD58F5875F4E59F48BAD9B9E1`、MPP同root `build/eddi-pages-filter-gesture.mpp` SHA256 `276134BAA5E09D3F0B9AA8129CF996B49877DDDA7E330AD6D630B432806320A9`。
- 継承対応APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/eddi-pages-filter-gesture-fixed242.apk` SHA256 `E94560AFF0F64D4F25F533454D9FF8FDEAB1D8E59EBD6879A68A8BCA83C6B388`、MPP同root `build/eddi-pages-filter-gesture-fixed.mpp` SHA256 `A63CEFB67707F4A158BC990F58D21F99537116F413390435B60E72E48FB5D87A`。
- どちらもInstallVerifiedApkで既存署名照合install-r Success・データ保持。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 最後の実一覧7項目は、並行作業により同packageが `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/cached-wacchoi-toggle242.apk` へ更新された後のPID4362で成功した。端末base.apk SHA256 `EA5405EE6DFBE8A616EC72BCCC90F14ABE1A3F78F89A72EC14756D2DDE4A85D0` とそのローカルAPKの一致を確認。上記E945候補での成功と取り違えない。この別候補のMPP/導入責任は並行作業側の台帳を参照。
- 最終照合時にintegration-status先頭の5554予約記載を初めて確認したため、以後この作業からの端末操作は停止。予約の解除/別チャットへの送信はしていない。実機の変更なし。
