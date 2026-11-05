# 未読が多いスレの本文表示前処理（未公開候補）

利用者は本文表示まで遅いと回答し、フィルター拡張OFFでも発生すると補足。今回の原因をフィルター集計だけに断定しない。実機の通信/ChMateパーサー/NG/初回描画の所要時間は未計測。既存の静的修正方針でコードから確認した無駄を削減する。

1. ExtraQuickFilters.collectは件数表示OFFでも全レスのURL getter・動画/画像分類・直接返信の件数用HTML変換を実行していた。件数表示に必要な処理だけをcounts=trueへ限定。AA/自分/返信の追加フィルターに必要な集合は維持する。設定を後からONにした際はnative rebuildと遅延値の再計算を実行し、0のまま表示しない。人気レスのnative layout準備待ちを示す-1は保持する。
2. PopularNativeRowsのnative rendererフックは拡張OFFでも全レスのrow/response/layout配列を毎回作っていた。件数表示・人気popup・直接返信判定がすべてOFFなら保存自体を省略。人気thresholdのnative処理自体は維持し、新規bytecodeフックなし。人気popup/件数をONにしたときに再構築してsnapshotを用意する。
3. 226/242のmodern snapshotは拡張がすべてOFFでもcollectしていた。191/226 legacyと同じ条件で元のsnapshotをそのまま返す早期経路を追加し、以前拡張が返したsnapshotの場合はrawへ戻す。直接人気filterが有効な場合は省略しない。

この候補は無効な機能の処理を省く修正であり、利用者の遅延の主因を特定した証明ではない。件数・人気機能が有効な場合は必要な処理が残る。DAT欠落による通信待ちや標準NG判定を飛ばす修正ではない。初回本文の一部だけを表示する仕様変更や、既読/未読・DAT/NGデータ改変はしない。

4. 利用者の本体最適化許可を受け、191の `Lo/MediationServiceImplExternalSyntheticLambda1;->g(String)Z` のAA文字比率判定へ早期確定を追加。全文走査後の `count*3>length && length>3` と同じ結果を維持し、必要文字数を満たした時点でtrueを返す。UTF-16の文字範囲・短文・nullの例外を保持し、極端に巨大な文字列は元のint乗算overflowを維持するため最後まで走査。通常の非AA文は最後まで走査するため、この変更だけで全スレの高速化を保証しない。元メソッドの命令を `haiagaruNativeAaClassifier` として保持。191の固定owner/署名にだけ適用し、226/242の本体AA判定は変更しない。

検証: 既存VerifyPopularReplyRulesの7項目成功（直接返信の同一投稿重複/範囲/全角/巨大range/空を含む）。NativeAaClassifierTestで全UTF-16文字・境界比率・順序・乱数・長文の296,911件が元判定と一致、null契約も成功。通常Lint付き `:patches:build :patches:buildAndroid` は2m14sで成功（build/unread-native-aa-build.log）。191へ最終MPP適用・署名成功。VerifyNativeAaClassifierHookで元の命令/分岐offset/register保持、wrapperの引数/戻り値registerと同梱呼出し先を確認。

ローカル候補: `build/haiagaru-unread-open-optimized.mpp` SHA256 `930c13adaba1462d7bdc06424391474d17dd7f8d48bb6409cf7e8e39e47e3b77`。内部versionは開発元のdev.9で、公開済みdev.9配布物とは異なる未公開候補。CRC正常。191 APK生成記録はdocs/android-installations.md。

今回変更するゲート・native snapshot・設定ON再構築の端末検証は未実施。初回本文表示時間・通常文への追加分岐の影響も未計測で、遅延の主因特定/症状解消は未確認。

## 226/242の追加確認

利用者の「191以外も確認」に従い、226の `Lo/BouncyCastleSocketAdapterCompanionfactory1;->a(String)Z`、242の `Lo/KeJ13;->e(String)Z` を未パッチAPKから確認した。いずれも同一文字範囲/比率/短文条件で全文走査。両版に同じ最適化を追加。各版のnull時の元の入力チェック/例外を保持するため、nullだけは保持した元メソッドへ委譲する。191も同じwrapper構造へ統一。全クラス走査によるowner推定は追加せず、対応版ごとの固定owner/署名で指定。

最終通常Lint buildは1m11s成功（build/unread-native-aa-all-build.log）。3版へ最終MPPを適用し、各版の元命令/分岐offset/register保持、wrapperの引数/返値/呼出し先/null分岐をVerifyNativeAaClassifierHookで確認。未パッチの各版AAメソッドの命令を限定的に評価するVerifyNativeAaOriginalBytecodeでも、全UTF-16文字の4連続・比率境界・乱数本文の各70,326件が最適化後と一致（build/unread-aa-original-equivalence.log）。既存Java参照比較296,911件+nullも再成功。命令評価は対応命令を列挙して未対応で失敗させるホスト試験で、Android上の実行ではない。

最終候補は `build/haiagaru-unread-open-optimized-all.mpp` SHA256 `7f33fe3d952958748119cc22f565afe695f878ec31cb75e9d0037d149b6914df`。3版APKのpackage/証明書・MPP CRC正常、証跡build/unread-open-optimized-all-verification.json/導入台帳。内部dev.9は未公開候補の識別で、公開dev.9配布物と異なる。端末導入/起動/本文・画像表示/実速度/公開は未実施。

利用者の追加情報: Haiagaru初期設定では開くまで重く、最低限構成では開いてから遅い。「開いた後」が本文待ちか操作の重さかは両方/区別不明。本文表示前後の別の負荷があり得るため、AA判定やfilterを主因と断定しない。静的確認ではサイトカード/Xプレビューは初期OFFで、SiteCardsのmetadata取得はworkerへ分離されている。読書位置補助の描画前処理、ChMate本文取得/解析・画像更新後の再描画も候補として残るが、所要時間/ユーザーの最低限構成での実行有無は未計測。現時点では追加の原因確定・症状解消を報告しない。

## 検証用プレ公開

利用者が静的確認結果・端末未確認の報告を受けて「プレリリースして」と明示。先行の静的修正/検証用公開指定と合わせ、端末の基本操作・速度計測は今回も未実施として公開する。必須端末試験を成功扱いせず、.releasercの公開冒頭に起動/本文/画像/設定切替/速度未確認、主因未特定を記載。新たな実機導入や投稿/GAS変更はしない。既存Semantic Release CIをdevへの通常pushで実行し、正式版は1.22.1を維持する。

公開完了: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.0-dev.10 、name=1.23.0-dev.10（検証用）、draft=false/prerelease=true、2026-11-04 19:29:54 JST公開。実装2cfe5d3、CI41813804375のRelease/Attest成功、生成347c58bをdevへFF取得。公開6assetのsize/digest/SHA256とZIP/MPP CRC、NativeAaClassifier/AAフック同梱、作業環境パス不在、任意3ZIPがdev.9と同一を確認。MPP SHA256 `8b4b57e1af16e4d0c1549a4b4ecb8c6b9b24bede2da6a0dd41f007a7a6903a29`。dev通常/pre feedはdev.10、master/mainは正式1.22.1保持。証跡 `build/release-1.23.0-dev.10-verify/verification.json`。公開CI版MPPの再適用/端末導入は実施せず、先行ローカル候補の3版静的検証と区別する。
