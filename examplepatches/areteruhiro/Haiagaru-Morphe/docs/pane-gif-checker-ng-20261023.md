# タブ追加先・GIF操作バー・チェッカー高さ・NG未読補正

## 実装（未公開）

- nativeToolTabsは有効／無効ではなく追加先の選択。オン=ホーム側、オフ=スレ側。設定画面も含む自動追加と手動追加が共通の経路を使う。画面ごとの自動表示スイッチは維持。191はk/I、226はr[0]/r[1]、242はw[0]/w[1]の本体ペインを使い、元Web用設定は変更しない。
- ペインごとに識別URLを分離し、同じツールを左右で同時に保持できる。旧URLも復元可能。既存タブは移動しない。
- GifViewerActivityは利用者提供diff（協力: ﾜｯﾁｮｲ 3f3c-gNc7）を基に下部へGIF/再生/メニューを配置。生pxではなくdp、タップ領域48dp、文字拡大に備えたwrap_content、空statusのGONE化。Composeモデル変換を避けて実ボタンを配置し、Popupのアンカーを保持。システム戻る経路は維持。
- NG未読補正は、非空のNG集合から数値スレIDをインデックス化。未該当スレのネイティブモデル／URL生成を省略。陽性・未知のキーは板込みURLの正確な既存判定へ進む。NG更新・解除・削除でインデックスを無効化。DBと既読位置は変更しない。
- PopularReplies.fullListはクラス単位でmBaseフィールドの有無をキャッシュ。値自体は毎回読むためリスト交換を保持。標準Listに対する反射失敗例外の繰り返しを削減。
- checkerHeaderPercentは操作パネル全体の上限率（固定高さではない）。新UIの別画面は35%固定、タブ内は30%固定だったため、両方のCompose経路へチェッカー識別タグを接続。ツールバーの高さはモデルのminHeightをComposeが無視していたため、専用タグで32〜56dpを指定し、文字拡大時には文字を切らない最小高さを確保。一般ボタンには影響しない。
- 検証中の初回案内終了で、既に外れたDecorのdismissによるIllegalArgumentExceptionが発生。HaiagaruDialog.dismissNowを冪等化し、既に外れたDecorの場合だけ例外を吸収。接続中ウィンドウの異常は再送出。

## 確認

- 通常Lint込みAndroid build成功: build/pane-choice-build.log、gif-ng-pane-build.log、checker-height-gif-ng-build.log、checker-dialog-final-build.log。
- 191/226/242のタブ候補を元APKへ適用、署名照合install-rでemulator-5554へ導入。各61項目成功（scripts/frida-native-tab-pane-choice.js、build/pane-choice{191,226,242}-frida.log）。ホーム／スレ各6ツールのFragment所属ペイン・再選択・native close、設定復元を確認。現行スレ・実ユーザーの全状態復元は網羅していない。
- GIF/NG候補191/242も導入。NG回帰は191=13 rebuild+8 native row+10 value、242=13+8+15に成功。無関係な1000行のnative URL lookupは0回。Inherited mBase・値交換、NG解除、欠番・並替え・逐次リスト、既読値不変を含む。ログbuild/ng-third{191,242}.log。226は共通処理の重複確認を省略。合成計測であり、報告された開閉ラグの完全再現・解消証明ではない。
- GIFの合成2フレーム/200msデータを実デコーダで読み、キャンバスへ注入して9項目成功。下部順序・status GONE・アンカー接続・48dpタッチ領域・再生/停止ラベルを確認。build/gif-bottom242-controls.log、gif-controls.pngでメニューを目視。ネットワークローダーはこの成功試験の対象外。先行のFake HttpURLConnection方式はコンストラクターで失敗し、成功扱いにしていない。
- 高さの実Compose描画は、checker-measure-small.xmlでWebView上端174、large.xmlで726。利用可能領域1104pxの10%=110px、60%=662px。操作ボタン範囲small=[12,56][70,96]、large=[12,64][70,120]で変化を確認。32dp指定は最小描画制約により40px、56dp指定は56pxだった。ローカルWebView・合成の多数コントロールによる別画面経路の試験。タブ内は同じタグを使う実装だが、この高さ比較はタブ内の実通信結果ではない。
- 高さfixture初回はタグ定数のFrida参照、setText overload、Kotlin非nullコールバックで失敗。初回案内に覆われた実行もあり、成功扱いにしていない。最終比較では初回案内showだけを一時抑制し、最低限構成の適用はしていない。設定はfixture終了時に元値へ戻す。初回案内をdismissした先行試験で新規Javaクラッシュがあったため、追加したDialogガードの再確認が必要。

公開・タグ・CI生成版の更新はしていない。ローカル候補の1.12.0-dev.11表記は公開済み同版の配布物とは別物。

最終Dialog修正候補は242へ署名照合して導入。frida-dialog-detach-regression.jsの3項目（連続dismiss、明示的外部detach、その後のdismiss）が成功し、先行試験で発生したJava例外の経路を確認。build/dialog-detach242-final.log。初回のfixtureはsetTitle overloadで実行前失敗し、明示CharSequenceで再試験。lastanrは起動後なし。新規クラッシュ記録は先行検証のPID17858分が残るが、最終修正版の同経路試験ではプロセス生存。全ダイアログ／全テーマの網羅確認ではない。

## 導入記録（2026-10-23 JST）

全導入先はemulator-5554、鍵は`C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias=Morphe、証明書SHA-256=`0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。各回InstallVerifiedApk.ps1で既存署名を照合しinstall-r成功。既存データ消去なし。

候補パスの共通絶対ルートは`C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/`。

| 表示名 / ChMate版 / package | APK（上記ルート配下） | SHA-256 | 使用MPP（上記ルート配下） |
| --- | --- | --- | --- |
| Haiagaru 検証 191 / 191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 | pane-choice191.apk | 48A4649157165402E0C516684EA07D0C755423383F8E2E5BCA1F4C684295A658 | pane-choice-candidate.mpp |
| Haiagaru 検証 226 / 226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 | pane-choice226.apk | 72F26F1E96C2D577C5439E0F2784A46978FE0F52B36001AEF187C81FBECA2B58 | pane-choice-candidate.mpp |
| Haiagaru 検証 242 / 242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 | pane-choice242.apk | E216EBDE34734A8B6B8C63CBB686B99531070C322E566D307C021C3ACE74333E | pane-choice-candidate.mpp |
| 同191 | gif-ng-pane191.apk | C4341FA26A56B5D12E1D549F81BCF9C12C9E0E1E451053864DB115A3E4F64130 | gif-ng-pane-candidate.mpp |
| 同242 | gif-ng-pane242.apk | 240BC69A54AE160B529B626AEFAA47F2396C7275F0A68C5631550540C60D0463 | gif-ng-pane-candidate.mpp |
| 同242 | checker-gif-ng-pane242.apk | FF047A0339080CFB444FFD6A578E04F71E034D12DC4012F146CFD628D4664821 | checker-gif-ng-pane-final.mpp |
| 同242（最終） | checker-dialog-final242.apk | 76D1DFF00DDDA97C8EDC7538F7153500073742E4B90BFDCE3286C8CFF9C2E74E | checker-dialog-final.mpp |

MPP SHA-256:

- pane-choice-candidate.mpp: 0404AB01313669E938702BC8657DE809E1F05B4FAEB06EC10BEB2E0ADA6D251D
- gif-ng-pane-candidate.mpp: 75AF0198F9F38359272F148B95681B4AE5F7F72686BEC6AD3441145C8A72872F
- checker-gif-ng-pane-final.mpp: 1CB39078F68D9EA7846F173F39434692884483574E89AF9620DB475AF0E32108
- checker-dialog-final.mpp: E01BF5606A51BEF0466E209AD13672E76A505B93FDA344840D14C9FE8EEBF474
