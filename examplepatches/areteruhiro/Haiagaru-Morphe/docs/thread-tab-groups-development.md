# スレタブのグループ管理（開発中）

標準タブ列へ組み込む。独立したボタン列を追加する試作方式は廃止。
グループAとBを重ねたら、所属スレをまとめた新しいグループCにする。
1段表示ではCの所属スレと他のグループDを同じ列に並べる。
2段表示では上段にグループ、下段に選択中の所属スレを表示する。
所属スレを長押ししてグループ領域外に離すと単独タブへ戻す。
元のタブを閉じたり、複製したり、スレデータを削除したりしない。

## 現状と証跡

- `ThreadTabGroupsTest` 34項目成功。統合、解除、グループ同士の統合、無関係のグループ保持、空グループ整理を含む。
- 実機 Mi Note 10 Android 11（d5497008）の隔離reporter242へFridaでDEXをロードして検証。製品APKへの最新版導入は未実施。
- `build/thread-tab-groups-live/integrated-test.txt`: ネイティブlistener通知から2タブ統合・1段展開・折畳み・再展開成功。
- `build/thread-tab-groups-live/tworow-test.txt`: 標準部品の上段1／下段2、下段表示・非表示成功。
- 画面再作成時にobserver二重解除でクラッシュ。disposeを冪等に修正。
- `build/thread-tab-groups-live/lifecycle-test.txt`: 修正後、上段1／下段2・開閉・再作成要求後もPID3089継続。
- 以上はネイティブ通知をFridaから呼んだ試験。実際の指の長押し・ドラッグ成功の証拠とはしない。
- 試験のグループ設定は保存前の内容へ戻した。画面再作成で試験部品も除去した。
- 最新の全体ビルドは `build/thread-tab-groups-live/native-final-build.log`。成否は末尾で確認する。

## 完了前に必要な確認・修正

- 最新フックを191／226／242へ適用し、ドラッグ・選択anchorが各1箇所で元命令を保持することを検証。
- 実ドラッグの中央600ms待機と境目の並べ替え、外へ離した解除、キャンセルを検証。
- 下段のドラッグ座標を下段adapterで判定し、領域外ドロップと上段への移動を区別する。
- ネイティブ並べ替えで移動中の表示位置が変わっても、重ねた相手を正しく保つ。
- 1段／2段切替、ネイティブスレ選択のハイライト、所属スレと他グループDの共存。
- 設定OFF時の取り外し、再attach時のobserver復帰、回転時の高さ、空グループ整理を確認。
- 新規スレの所属引継ぎ、再起動時の順序・名称・色・最後の選択復元、元に戻す操作を標準版へ接続。
- 名前・色・移動・解除メニューを完成させる（現在は名前／解除／表示切替のみ）。
- 対応3版の本文・画像・通常タブ選択・閉じる操作・新規クラッシュ確認。
- 検証後にのみ完了扱いにする。リリース指示はこのタスクにはない。

## 2026-11-23 メニュー操作と表示設定

- 「閉じる」「板へ」「レス複数選択」のネイティブメニュー内に「グループ化」を追加。「スレを選択してグループに追加」は廃止。
- TabletHomeActivity.onOptionsItemSelectedから専用処理へ配送。242実機で対象スレ選択済みの一覧表示を確認（popup-final6/group-click-result.png）。
- 設定「グループ化(実験的)」と「タブレット表示時にツールバーにグループ化ボタンを追加する」を追加。後者はthreadTabGroupButtonEnabled、初期true。管理本体は初期false。下部ツールバー追加案は撤回。
- 設定バックアップ・初期化、更新履歴のトグルへ登録。表示設定の最終ソースはJavaコンパイルで確認。最新表示設定の実機ON/OFF確認およびAPK再導入は未実施。

- 最新popup-final7: buildAndroid成功、191/226/242適用成功。242署名照合・実機更新・起動成功。Fridaで実際のタブFragmentとnative MenuBuilderを使用し、ボタンON表示／OFF非表示／管理OFF非表示／再ON表示の4条件成功、設定復元済み。証跡popup-final7/check-result.txt。クリックから選択一覧はpopup-final6の実画面で確認済み。

## 選択検索・バックアップ対応（作業中）

ThreadGroupSelectionDialogを追加。タイトル検索、表示結果の全選択／解除、選択維持、長押しスイープと端スクロールを実装。通常バックアップはHaiagaruSyncSnapshot.captureSettingsでui-config全項目を取得するため既存対象。設定エクスポートにもthreadTabGroupsStateの検証・取込を追加。設定初期化時はグループデータ保持。Javaコンパイル成功。Fridaの初回は非公開Resultへのアクセス失敗→publicへ修正。次回はall failed assertion、以後PID26972終了。選択／ジェスチャーとbackup roundtripの実機確認は未完。証跡selection-test/result2.txt。APK配布・公開なし。

## 2026-11-23 検証中クラッシュの調査

crash-current.txtの08:32:42/PID26972、08:35:02/PID27671は/tmpからロードした選択ダイアログの確定ボタンが、終了済みFrida Java.registerClassコールバックを呼びSIGSEGV。製品APK内のコールバックと区別する。検証ResultをJavaクラスGroupResultへ移し、finallyで必ずdismiss、EditText.setTextの明示overloadを使用。初期filterをshow前にも実行して、onShowの非同期配送前にもリストが操作できるよう製品処理を修正。check5.js/result5.txtで全選択・全解除・検索0件・検索解除の4条件（実9タブ）成功。Frida終了後PID28198継続、新規crash bufferエントリなし。01:56の古い事故はFridaメニューフックの再帰。長押しスイープ／backup往復は未検証。

## 現在画面の表示漏れ

current-user-screen.pngでClose/Board/multiple-selectメニューにグループ項目なし。両設定true。実行中reporter242は08:28:21更新で、FridaからNativeTabGroupsがClassNotFound（menu-route-fix.txt）。以前03:18導入の候補と異なるAPK。現在ソースではMultiResponseNg.menu（レス複数選択と同じ箇所）からaddThreadGroupActionを追加し、二重注入ではfindItemで重複を防止。最新修正APKのビルド・再導入・現画面確認は未実施。

## 3版メニュー・共通UIへの統一（進行中）

MultiResponseNg.menuから同じグループ項目を追加。既存tab popup hookとの重複はfindItemで防止。専用の4タイルアイコンをresourcesで登録。NativeTabGroups内の全ダイアログと選択画面をHaiagaruDialogへ変更。選択ListViewはNativeSurfaceSlotで実touchを維持（共通ModelContentの通常ListView置換ではsweepが届かないため）。初回unified-build成功6m17s。ただしそのビルド中にNativeSurfaceSlot修正を追加したため、unified-final-buildで再ビルド中。各版APK生成・実機確認は未完了。

- unified-final-build成功4m51s。unified/candidate.mppから191/226/242のAPK適用すべて成功。各版の検証パッケージへの署名照合・更新を実行中、導入済み版はandroid-installations.mdへ逐次記録。実機メニュー/共通UIの最終スクショと長押しスイープ、バックアップ往復確認は未完。

## 226のタブ重なり・長文タイトル（修正中）

bug226.pngでグループラベルが標準タブ上に重なり。geometry226.jsで本文はTTVideoLandingPageLink2Activity9→FrameLayout(AbsoluteLayout.LayoutParams)→AbsoluteLayout(RelativeLayout.LayoutParams)だが、ヘッダーはFrameLayout(RelativeLayout.LayoutParams)と判明。resize対象をheaderと同じ親に属する本文ancestorへ修正し、MATCH_PARENTのheightを負数のまま保持。実機再確認は未実施。選択CheckedTextViewは複数行・ellipsizeなし・wrap_content・48dp最小高へ変更。long-title-build成功、最終MPP/実機確認は未完。226グループ項目の4切替・アイコン・一意性・クリック配送はcheck226.txt成功。試験cleanupのGスコープエラーあり、画面は手動で閉じる必要。

- unified版: 191/check191.txtと242/check242.txtで表示切替4条件、アイコン有、一意性、クリック配送、共通選択dialog起動をFrida確認。設定復元・dialog cleanup完了。226/check226.txtも同条件成功だが旧cleanupでG参照エラー、後続手動操作で終了済み。226-layout-build成功4m26s、layout-final APKを3版適用中。長文titleと226段高調整を含む最終実機確認は未完。

- グループ名長押しで開く既存menu(group)を「グループ編集：名前」の見出しへ変更。191の2引数b、226/242の3引数コールバックは既存proxyのmenu経路へ接続済み。ただし実長押しの確認は未実施。layout-finalは3版適用成功、直後に編集見出し変更を加えたため最終成果物へは未反映。

- group-edit-final-build成功5m40s。226のbodyがnullのままだったためNativeThreadTabBridgeに非adapter viewによる本文fallback追加。edit-final/candidate.mppで3版適用成功。3版の署名照合・実機更新を実行中（session9361）、記録はandroid-installations.md。最終版各画面の確認は継続。

- edit-final 226: check226.txtで表示4条件・アイコン一意性・選択画面起動・復元成功。dialog226.pngの共通UIで長文タイトル全文折返しを視認。ただし上部操作欄が20%制限で検索のみ見えて全選択/解除が隠れる問題を発見。専用tagとBrowserModelの45%配分へ修正。selection-controls-build実行中（session8484）。最終成果物はまだこの調整を含まない。

## 操作欄固定（作業継続）

ModelUi.BrowserModelの専用tag分岐で検索・全選択/解除・件数・説明を固定Columnに配置しリストのみweight=1でスクロール。pinned-controls-build.log/session82582でMPPビルド中。226 group226.txt/edit226.pngで共通編集dialogと二段geometry（132/132/264）確認。長押しテストlongpress226.txtはconsumed=false、dialogのnull判定は過去dismiss済み参照が残るため成功証拠にならない。実長押しactual-long226.pngでは編集dialogが出ず未解決。直近9:07 crashはFrida agent先頭。pinned-final/apply.py準備済み、最新MPP反映・3版APK適用/導入・実画面確認は未実施。

- native-long-touch.jsで226上段stripへDOWN/UPを送信、c(strip,View,Object)コールバック到達を確認。ただし通常スレmenu表示（native-long226.png）。上段がグループ投影されても元pageを返すnative経路への対応として、上段stripのViewコールバックのみadapter.representativeを適用する変更追加。memberStripは変換しない。変更は未ビルド・未検証。pinned-final APKはこの変更前。

## 一時停止後の個別報告：長文の検索欄へのはみ出し

overlap-current.pngで現画面保存。検索/一括操作固定Columnの下にweight=1のBoxを置きclipToBoundsでnative一覧を明示クリップ、ListViewもclipChildren/clipToPaddingを有効化。overlap-build.logでJava/Kotlinコンパイル成功1m10s。MPP再生成・実機導入/スクショ比較は未実施。全体goalは利用者指定pausedを保持。

## ダイアログ見出しと初回操作欄

利用者の追加依頼で、選択dialog tagの場合のみ見出しをheadlineSmallからtitleMediumへ縮小。ModelUiの専用配置で検索直下の2ボタンをCompose OutlinedButton横並び（labelMedium）として明示描画し、検索/選択/解除を固定表示。件数・説明はbodySmall。リストのみweight+clipToBounds。compact-header-build.logでコンパイル確認中。実機APKへは未反映、全体goalはpaused維持。

## 2026-11-23 投稿・位置修正作業ツリーへの統合

Haiagaru用 (3) の未コミット差分からグループ管理、標準タブ連携、共通選択UI、設定・バックアップ・更新履歴を統合。NativeToolTabsの依存によりメモ画面のタブ内表示用コントローラー分離も取り込んだ。投稿後の復帰を実験的・初期OFFにする変更および投稿・位置修正を保持。Host ThreadTabGroupsTestは40項目成功。長押しの未解決経路と最新UIの実機確認は継続対象。統合先で公開操作は未実施。
