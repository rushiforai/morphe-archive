# 標準バックアップXML共通化と共有NG誤検知（2026-11-07）

標準バックアップの公開ファイル名を jp.co.airfront.android.a2chMate_preferences.xml に統一。実設定はパッケージ固有のストアのまま保持する。191/226/242の固定されたexport/restoreワーカーだけでFile生成とgetSharedPreferencesを補正する。追加の全クラス走査なし。staging/ZIPは元名、実shared_prefsからの読込は現在のパッケージ名。復元は元名を優先し、無ければ同一パッケージの旧名へfallbackする。他パッケージの旧名を推測して取り込まない。

ユーザー提示の `左のネ|([チョンパヨ].*){5}` はバックアップ要望文の「パ」5回で一致することをJava正規表現で再現。NgRegexSafetyは単一文字クラス＋任意文字列の反復だけからなるトップレベル分岐を検出し、そのオンラインkeywordルール全体を自動適用から外す。共有NG確認に理由を表示。条件/票数/失効情報を改変せず、標準のローカルNGには介入しない。一般の正規表現を意味解析する機能ではなく、すべての誤検知を解消する保証ではない。配信ルールの実データ取得はlock timeoutで失敗したため、ユーザー提供の式を基に検証。サーバー変更なし。

通常Lint/R8製品ビルド成功4m33s（canonical-backup-shared-ng-build.log）。ホスト25（XML/ZIP）、19（誤検知）、96（共有NG）、10306（索引等価）項目成功。固定ワーカーのレジスター、元命令、分岐/switch先保持は3版PASS。191は既存NativeRestore191のduplicate guard/isInterruptedフックを明示的に照合し、今回差分と区別した。

emulator-5580に署名照合後install-r、専用instrumentationは191=10、226=13、242=13項目成功。226/242は隔離FixtureApplicationの専用ストアで実native restoreを実行し型付き値、元名優先、旧同一パッケージ名fallbackを確認。191は全データを扱うworkerを実行せず、ヘルパー実行とバイトコード検査に限定。ユーザー設定への復元や実機操作は行わない。

検証環境の経過: エミュレータのQt/software OpenGL起動が失敗。該当AVD/portの自身のqemuだけ停止し、同じAVDをno-windowで起動して成功。データ消去なし。native reader試験の初回191はinstrumentation開始前にHomeを起動していたため、試験側のresumed追跡がなくforeground待ちで失敗。製品クラッシュとは扱わず、開始後にHomeを起動する順序で再実行する。

最終native回帰: 191=276（canonical-backup191-reader-retry.log）、226=285、242=282項目成功（canonical-backup<版>-reader.log）。標準本文/画像/模擬投稿dialogを確認、公開POST0、試験finallyで設定復元。3版Home Complete。開始UTC11:17以降crash buffer0行。初回191は試験起動順のforeground待ち失敗だったため開始後Home起動で全項目を再実行し成功。最終MPPの専用復元/NG試験と区別して両方確認済み。



1.25.0-dev.6 検証用公開完了。Semantic Release CI https://github.com/areteruhiro/Haiagaru-Morphe/actions/runs/42367834199 success / https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.25.0-dev.6 / 2026-11-07 20:25:01 JST。APIでprerelease=true/draft=false、MPP/bundle JSON2個/任意ZIP3個を確認。配布MPPを実ダウンロードし7001425bytes / SHA256 858ab81a6042227f84c09a592f9603f9f36328c1c570b2bd819eb185a613af5c。pre JSONのversion/download_url一致。ソースa7c22449、CI生成eef240a9はff-only取得、生成ファイル手編集なし。配布MPP自体の再パッチ/導入は未実施、同一製品ソースのローカル最終候補で全3版試験済み。

