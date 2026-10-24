# スレ側の専用画面・隣接タブへの左右移動

## 依頼と実装

- HOME側ではなくスレ側に追加した専用画面から、左右スワイプで本体の隣接タブへ移動する。
- NativeToolTabSwipeLayoutを共通Fragmentのルートに使用。選択中のスレ側タブかをnativeの実所有一覧で判定する。設定変更前に作成したタブも現在の所属に従う。
- 左スワイプは次のタブ、右スワイプは前のタブ。端では移動しない。閉じる・一周・別ペインへの移動はしない。
- 96dp以上の水平移動、縦移動との比率、長押し時間、複数指、CANCELを扱う。子ViewへCANCELを送ってからdispatch後にnative selection APIを呼ぶ。破棄済み・非選択タブからは移動しない。
- スレ側のチェッカーWebViewは履歴スワイプより隣接タブ移動を優先。HOME側と独立Activityの履歴設定は変更しない。
- native呼出契約は191のpane.d(offset)、226のGNk.c(position)、242のzzev.e(position)。対応版を限定し、未知の状態では移動しない。

## ここまでの確認

- 通常Lint込みAndroid build成功（build/thread-tab-swipe-build.log、6分46秒）。
- 191／226／242の元APKでVerifyThreadToolNavigationの全契約検査成功。191／242の生成APKで既存factory hook・register・分岐・標準Web constructor・Fragment基底クラスの保持検査成功。
- 191／242を同一署名照合後install-r成功。実機は変更していない。導入台帳参照。
- 自動検証の初回は同じblank tabを再利用していた。別URLのローカルWebタブに変更。次にUIスレッドでJava.chooseを実行している間に応答待ちになったため、対象検証アプリをforce-stopして再起動し、nativeモデルからFragmentを直接取得する方式へ変更。データ消去なし。これらを成功として集計しない。
- 修正したfixtureでsettings／eddiの左右移動、縦移動・短いドラッグ・キャンセル・長押しの非移動を確認。ビュワー再選択後の検査が一部失敗しており、検証中。最新結果は追記する。

## NG修正後の追試（未完了）

- 新規依頼の242本文メニューNG修正を優先し、当変更を残して同時ビルド。最新242候補とハッシュはng-suffix-body242-20261023.md参照。タブ移動のpost先をViewではなくmain Handlerへ変更し、実行時のnative所有／選択検査は維持。
- 先行fixtureはtoolbarActivity経由で非表示の古いActivityを選ぶ可能性もあった。focused Activityをoff-main探索し、Fragmentはnative選択モデルから取得、rootのattach状態を検査するよう変更。実行対象の誤りとアプリの不具合は分ける。
- 242focused追試の初回はfixtureのenumフィールド取得がnullで中断。productionと同じgetDeclaredFieldで取得するよう修正。
- build/thread-tab-swipe242-focused2.logでは、実Activityへのtouch dispatchでhissiの左スワイプ→隣接タブ移動／タブ数維持に成功。一方、再選択直後の右スワイプはexpected=1／actual=2で失敗し、まだ完全確認とはしていない。選択モデルとpager表示更新のタイミングも含めて追加切り分けが必要。公開はしていない。

## 最終追試完了

- build/thread-tab-swipe242-layout-aware.logで6画面（hissi/checker/wacchoi/settings/eddi/search）145項目成功。focused Activityを選択し、native選択モデルと実表示・非ゼロサイズを待ってからMotionEventを送る。右移動の先行失敗はfixtureの表示待機を是正して解消し、長押し・縦移動・キャンセルの非移動も確認。
- 設定を復元し、検証専用markerのローカルblankページのみ終了。後からnativeが名称変更した18ページもBundle markerで特定して終了し、ユーザーのスレは保持した。最終統合後の起動・本文・内部画像・下4桁NG確認でも新規crash/ANRなし。191/226はnative契約の静的検査を実施し共通操作の重複は省略。

## 成果物・導入

ルートは C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/ 。

- build/thread-tab-swipe.mpp SHA-256: 8A5FB88F80A116A47A42B79FE9A42436BF23A8EF7108C356FEA6FA654A86708B。
- build/thread-tab-swipe191.apk SHA-256: 978941413497B712819B24E58E4CB3F0F3E241FF9A4C457FA4169C285A90F1F2。
- build/thread-tab-swipe242.apk SHA-256: 19E2999602C3591D05AA73F6D02CF79682D411569D0EA197A96855A300B506EA。
- emulator-5554、191=jp.co.airfront.android.a2chMate.haiagaru.settingsfix191／242=jp.co.airfront.android.a2chMate.haiagaru.resumefix242、表示名Haiagaru 検証 191／Haiagaru 検証 242。ChMateは各0.8.10.191 dev／0.8.10.242 dev。
- 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA-256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- アンインストール／データ消去なし。今回の変更は公開dev.12より後の候補であり、版名が同じでも公開済みではない。
