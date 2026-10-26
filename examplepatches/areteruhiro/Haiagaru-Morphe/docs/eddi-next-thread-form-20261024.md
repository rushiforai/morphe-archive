# エッヂ検索欄切替・次スレ候補起動（未公開）

- 検索欄非表示の既存hideSearchForm設定を画面直下のボタンから切替可能にした。「検索欄を隠して結果を広く表示」→「検索欄を表示」。既存の表示設定チェックと同じ値を使い、再度開いても保持する。Composeでは非表示の検索Column自体を構成から外す。条件/結果は消さない。
- RelatedThreadsの候補クリックをnative ResListActivityの明示Intentへ変更。native launch境界のHissiMenuCompatibilityでも、自アプリpackage指定・component未指定・認識済み掲示板スレURLだけ同Activityへ明示する。ブラウザ宛て/別package/明示component/板URLは保持。利用者のNo activity found報告の回避候補であり、報告端末の実クリック再現は未実施。
- 初回buildはKotlin incremental cache破損で失敗、次の呼出しはPowerShellで-P引数が分割され失敗。検索欄listenerのfinal keyword初期化検査エラーをmethod経由へ修正。最終 `build/eddi-next-thread-form-verified-build.log` は通常Lint付き3分24秒で成功。失敗を無視した配布はしていない。
- `scripts/frida-next-thread-intent-test.js`、242端末内で6項目成功。Edge same-package thread explicit/解決可能、ブラウザ・板・既存component・非掲示板URL保持。Intent生成/解決のみで実スレ起動はしない。
- `scripts/frida-eddi-search-visibility-test.js`、242端末内で7項目成功。空の保存済みfixtureで表示/非表示/保存/新画面保持/復帰。検索通信なし、設定復元、dispose済み。Composeの実画面タップによる面積確認は未実施。
- 起動/前面TabletHome確認、検証後crash buffer空、lastanrなし。新着位置/120fps/自然発生サムネイル点滅の修正確認の代わりにはしない。

## 導入台帳

root: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current`。

2026-10-24 JST、emulator-5554、ChMate0.8.10.242 dev「Haiagaru 検証 242」、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`へInstallVerifiedApkで既存署名照合install-r Success。データ保持、実機変更なし。

APK絶対パス `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/eddi-next-thread-form242.apk`、SHA256 `2D0FC3BB4A8AD10C9346BA5C6D0BF41E18607E8ED2B56973C61264ACC2F8E140`。

MPP絶対パス `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/eddi-next-thread-form.mpp`、SHA256 `8AC85CD3E077AD29E07ED8022700C3C17C790B1229CAFCCE48F8402F0337B8F0`。

鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。インストールログbuild/eddi-next-thread-form242-install.log。共通ソースの191/226導入は未実施。並行変更を含む作業ツリー候補であり、公開Releaseではない。版名更新/公開なし。
