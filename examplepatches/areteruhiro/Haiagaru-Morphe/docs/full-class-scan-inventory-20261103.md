# ChMateパッチの全クラス走査棚卸し（2026-11-03）

認証処理を版別クラス名の直接指定へ変更後のソースを対象に、classDefForEachの実呼出しを集計。return@classDefForEachは除外。16ファイル39か所。版分岐・任意パッチを含む静的件数で、1回のパッチで全39か所が実行されるという意味ではない。実アプリの起動時走査の件数でもない。

| ファイル | 呼出し箇所数 |
|---|---:|
| `ArchiveOriginsPatch.kt` | 1 |
| `BeAutoLogoutPatch.kt` | 1 |
| `BoardCookiesPatch.kt` | 1 |
| `ChangeChMatePackageNamePatch.kt` | 3 |
| `ClipboardHistoryPatch.kt` | 1 |
| `ExternalBoardAuthPatch.kt` | 1 |
| `HaiagaruPatch.kt` | 19 |
| `HiddenNgUnreadPatch.kt` | 1 |
| `HttpsTransportPatch.kt` | 1 |
| `ImageVpnTransportPatch.kt` | 1 |
| `RestoredDatRowsPatch.kt` | 2 |
| `StringReplacementPatch.kt` | 1 |
| `ThreadKeywordOrderPatch.kt` | 1 |
| `VideoViewerPatch.kt` | 2 |
| `ViewingUserAgentPatch.kt` | 1 |
| `XPostPreviewPatch.kt` | 2 |

このほかChMateExtensionIsolation.ktは同梱DEXのdex.classesを列挙してクラス名衝突を隔離する。これは元APKの対象クラス探索とは用途が異なる。

固定クラス名への変更を優先検討できるもの: NG編集ジェスチャー/動画ジェスチャー、復元DAT reader、242 keyword grouping coroutine、レスメニュー/ワッチョイ処理。既知3版のclass/methodが同定できるものは直接指定して構造検査を残せる。

広範囲の呼出し箇所を意図的に書き換えるもの: UA/java.net、HTTPS、Clipboard、Xプレビュー/TextView、ドメイン互換、package変更。単一クラス指定だけでは適用漏れになるため、版別の全対象一覧か共通索引化が必要。現時点で性能測定していないのでパッチ時間への寄与率は断定しない。

今回の棚卸しでは認証以外の処理は変更していない。

## 固定一覧への置き換え完了

続く利用者指示で上記39か所を全て `boundClassForEach` に変更した。対象を探すための全クラス列挙はChMate用パッチ本体からなくした。`ChMateClassBindings.kt` は版ごとの同梱一覧に書かれたクラス名を `classDefBy(String)` で直接参照する。全体走査・推測fallbackは行わず、一覧・必須クラスの不足や既存の構造検査違反でパッチを停止する。

| 対応版 | 実行対象の操作 | 固定クラス参照数 | 変更前後で完全一致したクラス数 |
|---|---:|---:|---:|
|191 dev|31|717|36,944|
|226 dev|33|710|58,564|
|242 dev|34|802|67,768|

39は版分岐・旧版向けの未使用経路を含むソース上の置換数。現在の配布対象は191/226/242。241/243の入力は現行の互換条件で全パッチが対象外のため、生成コマンドの正常終了を検証成功に数えていない。

最初に旧走査の選択先を開発用に記録し、読み取り専用の選択（BE logout worker等）とTextView祖先情報も補完。必死/動画の外部起動境界は、旧実装が事前に可変化していた約9,700クラス全体ではなく、実際の起動命令を持つクラスだけを固定一覧へ収めた。既存の関数内の構造検査・元命令保存処理は維持した。

全定義の比較には単一クラスDEXへの正規化を使用。命令・レジスター・分岐・switch/array payload・例外処理・フィールド・注釈・debug情報を含め、合計163,276クラスが旧走査版と一致。コード量や出力順、APKバイト列だけで一致を判断していない。`scripts/CompareChmateBindingOutput.java`、`build/class-bindings-compare3-{191,226,242}.log`。固定一覧への変更だけに関する比較で、実行時機能の別修正がなかったことを示す。

本体のDEXロード、出力コンパイル、同梱拡張のクラス名衝突を避ける `ChMateExtensionIsolation` の列挙は必要なため維持。これはパッチ対象探索の走査ではない。開発用の比較ツールも全定義を検査する。記録用 `ClassBindingTrace` は公開MPPに含めない。

通常ビルド `build/class-bindings-fixed3-build.log` 成功29s、MPP `build/class-bindings-fixed3.mpp` SHA256 `bdda80841ecabd3c1ea36be572045739587b208b80502b5ea8f6f38d2df76b1b`。3版の隔離エミュレータで各73項目（画像/GIF/拡大8、固定UA8、通知Job33、日時間分UI18、Cookie/UA連携6）が成功。キャッシュした合成スレ本文の再表示も3版で確認、新規fatalなし。検証用DAT/idx/bookmark/markerは所有確認して削除し、通知登録0・設定復元を確認。`build/class-bindings-validation-summary.json`、`class-bindings-final-smoke.json`、`class-bindings-installations.json`。

失敗履歴: 初回のBE worker一覧漏れはパッチ時の必須件数検査で停止し補完。比較ツールのAPI36指定は使用中のsmaliで未対応だったためDEX039へ修正。最初の191画像確認時はSystem UI応答停止があり、Wait後の再試験を採用。242の日時間分UIは7日の入力反映待ち150msでは失敗し、Compose反映待ち600msのハーネスで全18項目を再試験して成功。各失敗を成功として集計していない。ユーザーの接続設定や通常アプリには変更なし。

パッチ時間の改善率は、ログ出力の有無や端末負荷をそろえた計測が未実施のため断定しない。
