# nicoid Re v2.1.9-dev.7 ライブラリ・ツール更新記録

- 実施日: 2026-11-24 JST
- 基準: ユーザー実機確認済みの添付 v2.1.9-dev.6 MPP
- 入力 SHA-256: `44524586c98c4fdce3e614c542f8f49c55f3481093be9aea2f00dd5813823a18`
- 出力: `nicoid-re-v2.1.9-dev.7.mpp` (5,802,963 bytes)
- 出力 SHA-256: `ea951e84930b393130dff2381d2aa549ab41519ba557e15daa50b99239d68528`
- 比較: dev.6 (5,750,876 bytes) から +52,087 bytes (約0.91%)
- 対応対象: nicoid 6.49 / Android 9 (API 28) 以降を維持する設定で構築
- 判定: ツールチェーンCI成功、候補MPPの生成・静的検査成功。実機検証前の候補であり、正式リリースではない

## 1. ビルド・CI

| 項目 | 更新前 | 更新後 |
|---|---|---|
| Morphe Patcher | 2.4.0 | 2.5.0 |
| Morphe Gradle Plugin | 2.1.1 | 2.1.2 |
| Gradle | 9.9.1 | 9.9.2 |
| CodeQL Action | 4.39.3 | 4.39.4 |
| conventional-commits-filter (直接依存) | 5.0.0 | 6.0.1 |
| dev.7ローカルSmali実行用Guava | 27.1-android | 33.8.0-android + failureaccess 1.0.3 |

- 検証ブランチ: `audit/stable-toolchain-v219-20261124`
- 更新コミット: `1ea6f28d944b8593669ba67f38cea9a4e947dc8a`
- CI: https://github.com/chikuwadon/nicoid-re-patches/actions/runs/45336583279 (build、リリースツール、Actions lock、ソース検証の4ジョブ成功)
- CodeQL ActionのSHAとロックファイルは更新・ロック検証済み。新SHAでCodeQL解析そのものを実行した結果は本記録に含めない
- Gradle配布物のSHA-256は公式値 `971fcd7150ca4ba04852c0b2ca0d2d0ab9468e14b03473eab19528809914c76b` に更新。公式wrapper JARのSHAは9.9.1と9.9.2で同じ。関連CIのミラーURLを同期
- conventional-commits-filterのロックは旧PR #158と同じ依存解決。semantic-release 25系の内部依存5.0.0は互換性のため保持。npm公開無効化stub・既存security overridesを維持
- 確認対象のnpm latest: 26.0.1/1.10.3/6.0.1/10.4.1/9.3.0/7.1.4/7.1.0/11.0.1 (artifact `npm-stable.txt`)
- 履歴再現専用の過去バージョン固定ツールは書換えない。新規のruntime D8は9.5.29を使用

## 2. MPP内部の実体更新

| 項目 | 更新前 | 更新後 | 判定 |
|---|---|---|---|
| Guava Android | 33.3.1 | 33.8.0 | 更新 |
| failureaccess | 1.0.2 | 1.0.3 | 更新 |
| AndroidX Concurrent Futures | 1.2.0 | 1.3.0 | 更新 |
| AndroidX ExifInterface | 1.3.6 | 1.4.2 | 更新 |
| AndroidX Media3 | 1.11.1 | 1.11.1 | 現行維持（最新安定版） |
| AndroidX Annotation | 歴史的NOTICEに1.6.0 | — | 通常annotation-jvm由来のクラスはMPPに存在しない。不要な追加をしない |
| AndroidX Annotation Experimental | 1.3.1 | 1.3.1 | 互換性保留 |

旧ライブラリを公式JAR/AARからD8で再構築してdev.6と比較。旧版に一致する2169クラスの対象パッケージを更新し、新版2268クラスと置き換えた。旧バージョンのライセンス記録だけで更新対象を決めていない。通常AnnotationのJARとAnnotation ExperimentalのAARの実物を照合。既存annotationパッケージ6クラスはすべて後者由来。新版のannotation experimentalの2つのenum初期化が `kotlin/enums/EnumEntriesKt.enumEntries` を呼び出すが、既存MPPにはKotlinランタイム定義がない。元APKに対応ランタイムが存在するか不明なため、追加同梱による重複やABI不一致を避けて1.3.1を保持。

Guava公式はAndroid版の実行時依存としてfailureaccessを明示。新規のJSpecify等アノテーション参照は存在するが、検査した新規4ライブラリにはそれらへの実行命令参照がない。元APKの全依存クラスやリフレクションは未検証。ExifInterface AAR minSdk21、annotation-experimental候補minSdk23。D8のmin-api28で生成。API 28実機での全経路検証は未実施。

## 3. 保留と現状の限界

- `semantic-release` 25.0.9 → 26.0.1: `gradle-semantic-release-plugin` 1.10.3は25系までのpeer dependencyを宣言。強制インストールは不採用
- `AndroidX Annotation Experimental` 1.3.1 → 1.6.0: 上記のKotlin実行時依存のため保留
- 通常のAndroidX Annotationは同梱なし。不要なクラス注入を避ける
- 更新済みの4ライブラリのABI検査はMPPの3つのapp DEXおよびSDKスタブに基づく。元APKを含めた完全なリンク/ART型検証、API 28実機・長時間動作、リフレクション、アプリ全機能の実行、全間接依存の最新CVE監査までは実施していない
- 新版CodeQLの解析結果は未取得。既存CIのソース検証とActions lock検証とは区別

## 4. 実配布候補の検証

- Patcher 2.5.0・Plugin 2.1.2・Gradle 9.9.2でCI生成した `patches-2.1.8.mpp` のルートclasses.dexと全JVMパッチクラスはdev.6にバイト一致。CIの新Patcher manifestを利用し、古いapp payloadは採用していない
- dev.6のキャッシュ安全修正を含む非更新helper 5418クラス、Media3 2718クラスは再逆アセンブル内容一致。変更された非ライブラリクラスはバージョン表記2クラスのみ。extensionはModernShortsのバージョン表記のみ。native method deltaとresources.zipはバイト一致
- 3つのapp DEXにおける参照先検査: 254の外部メソッド/フィールド、67の外部クラス、12606のライブラリ内部メンバー参照が解決。削除済みの参照先クラス・新規未解決参照・別DEXとの新規重複なし。SDKスタブを含む静的検査でありAndroid VMによる全型検証ではない
- 26 ZIPエントリ中23件がバイト一致。変更はhelpers.mpe、extensions/extension.mpe、manifestのみ。全4 DEXのSHA1、Adler32、ヘッダサイズ、method/field ID上限、MPP CRC、resource ZIP CRC、1191リソースを確認
- 新旧GuavaをホストSmali classpathに用いた2構築の再逆アセンブルは全クラス一致。DEXのバイナリ配置は異なったため、バイト完全再現とは主張しない。最終候補は新版Guavaによる構築
- dev.6キャッシュ専用19項目（保存先競合の模擬、3言語、容量順、バッファ等）成功
- JVM新旧比較: ImmutableList、ImmutableMap、Future transform/cancel、CallbackToFutureAdapter、SHA-256成功。Android ExifInterfaceの実動作は未確認
- helper DEX: 7688 classes, 54858 method IDs, 26840 field IDs。ルートDEX: 19 classes, 74016 bytes

## 5. 実機確認推奨

1. Morphe ManagerでローカルMPPとしてdev.7を選択、パッチ適用・インストール・起動。設定でパッチバージョン2.1.9-dev.7を確認
2. 通常/全画面/ポップアップ/ミニプレーヤー/BG再生、停止中切替、シーク、倍速、連続再生
3. ニコ生HLS・追っかけ、サムネイル/画像表示・Exif付き画像の読み込み、検索、コメント、マイリスト
4. 一時キャッシュ削除、動画キャッシュ削除の3言語、容量→説明順、取得停止・保存先変更。不要なテスト用データで確認
5. 端末に可能ならAndroid 9(API28)実機またはエミュレータで確認

## 6. 再現・引継ぎ

- 本ZIPにはdev.7候補、ステージングソース、ハッシュ、テストコード、検証ログを収録。元dev.6は今回添付されたZIPを使用する
- CIのパッチャー出力: https://github.com/chikuwadon/nicoid-re-patches/actions/runs/45336583279/artifacts/14894283102 （ZIP内 `patches-2.1.8.mpp`、SHA-256 `302715a10c994f1dc12bb6549d0a5e093c6b365382262a722283b69280efd11f`）。これは内部入力であり実機に入れない
- Runtime依存取得: https://github.com/chikuwadon/nicoid-re-patches/actions/runs/45336769895/artifacts/14893924107 （保持期間2日）。`runtime-lock/SOURCES.txt` と `SHA256SUMS` を収録。公式配布物とSDKスタブの取得元は同ファイル・CIを参照
- Smali tool取得: https://github.com/chikuwadon/nicoid-re-patches/actions/runs/45331780400/artifacts/14891503497 （ZIP内smali-tools.zipを展開しtoolsを指定）。既存lockの8個の実行用JARを新scriptで検証。旧host Guavaは使用しない
- コマンド: `python3 porting/revisions/v2.1.9-dev.7/stage_candidate.py --input /path/dev6.mpp --ci-mpp /path/patches-2.1.8.mpp --libs /path/runtime-libs --tools /path/tools --output /path/dev7.mpp`
- `dev` と `main` は本作業で変更していない。build関連のみauditブランチに反映済み。dev.6+dev.7のruntime変更は検証用MPPと再現スクリプトに収録し、実機確認後に正式なdev統合対象とする。タグ・Release・Issue操作なし

## 7. ライセンス

更新したGuava/failureaccess、AndroidX Concurrent Futures、AndroidX ExifInterfaceは従前のApache License 2.0の第三者コンポーネントの更新。既存のnicoid Re GPLv3および元アプリのライセンスを変更しない。第三者の表記・Apache 2.0ライセンスは統合時のsource releaseに維持する。

## 実機検証追記（2026-11-24）

- ユーザーは配布候補 v2.1.9-dev.7 の実機検証で「一通りの動作に問題ありません」と報告した。全端末・全機能の検証を意味しない。
- 既存のローカル中間MPPと短期保持CI artifactに依存しない統合用 `stage_verified.py` を追加する。公式 v2.1.8 の固定SHA-256を基準とし、直接の読みやすいSmali差分と固定Maven依存で構築する。
- ローカル再構築: 全3 app DEXの 9,863 クラスの再逆アセンブル内容が実機検証済み候補に一致。その他の全ZIPメンバーはバイト一致。DEXレイアウトによりMPPのSHA-256は異なる。再構築MPPの実機検証は未実施。
- 再構築時のSHA-256: `8542c988dd6d0940f62c6958a89cffc3d9c0e0cd268114a1719b08e49c4404d8`（環境・DEX配置により変化し得る）。
- 正式リリースは別途ユーザーの明示承認を必要とする。
