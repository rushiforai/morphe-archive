2026-10-30 最適化候補のコード走査

対象は主開発フォルダの拡張Java/Kotlin。描画、レス・NG判定、GIF/動画サムネイル、専用画面の状態監視、個人NGの定期照合を中心に呼び出し元まで確認した。製品コードの変更、ビルド、端末への再導入は行っていない。以下は静的な確認結果であり、CPU時間・FPS・削減率の実測値ではない。

| 優先度 | 箇所 | 確認した処理と改善案 |
| --- | --- | --- |
| 高 | 共有NGの準備・照合 | 判定のたびに掲示板別の条件一覧を再生成。各条件の設定取得、各レスの候補リスト作成・掲示板URL解析も繰り返す。条件受信・設定変更時に不変の索引を作り、ID等の種類別に照合する。 |
| 高 | 共有NGの日付・本文加工 | 日付条件を使わない現行の `matchesPrepared` に対して、全対象レスで `day` と `week` を算出している。`week` は再度 `day` を呼ぶ。ID条件だけでも本文NFKC正規化と空白置換を実行する。日付計算を呼び出し側から省き、本文・名前等は候補の種類に応じて必要なものだけ加工する。 |
| 高 | 専用画面の200ms監視 | STARTED中、毎秒5回、モデルのViewツリー全体を再帰走査して指紋を計算する。非表示の子や表示範囲外の結果モデルも走査対象。結果数・本文量が多い画面では待機中もコストが増える。検索完了・設定変更・入力変更で更新番号を通知する方式へ段階的に移す。 |
| 高〜中 | GIF完成時の全体無効化 | GIFサムネイルが完成するたび、管理中の全モデルの `CharSequence[]` キャッシュを反射で無効化する。画面の再バインド自体には既存の80ms集約があるが、全モデルの無効化はその前に毎回走る。URL→対象モデルの対応を使い、そのGIFに関係するモデルだけを無効化する。 |
| 中 | レスごとの設定・反射取得 | 赤いIDの `merge`、共通の `ResponseArchiveEntry.field`、`ProgrammableNgController.field` で設定オブジェクト取得・Field探索を繰り返す。赤いIDの242一覧処理でも行ごとに設定を読む。版・Class・フィールド名単位のメタデータキャッシュと、一回の一覧処理用の設定スナップショットが候補。 |
| 中 | 投稿者情報とSpanの再生成 | `PosterHighlight.decorateResponse` は投稿者情報とスレURLを取り直し、Spannedをコピーする。安価などSpanが多い本文では割り当てが増える。元テキスト・レス・強調設定の世代を使って再利用可能か検討する。長押しメニューもこの情報を使うため、強調OFFだけを理由に処理全体を省略してはいけない。 |
| 中 | 個人NGの定期照合 | 変更がなくても3カテゴリのnative保存先を解決し、全件をJSON化・ハッシュ化して、同期 `commit()` を呼ぶ。同値の実ディスク書込みはAndroid側で省略される場合があるが、全量の前処理は残る。native APIのメタデータを再利用し、内容が同じならシリアライズ・保存を省略する。60秒照合の設定と復元時の検出は維持する。 |
| 中〜低 | 同期タスクの重複投入 | `SharedNg.schedule` は `busy` を見てからExecutorへ投入し、`busy=true` は後段の `sync` 内で設定する。キュー待ちの間の重複投入を、投入済みフラグでまとめられる。実際の重複HTTP回数は未測定で、同期側の時刻・busy検査も既に存在する。 |
| 低 | 動画サムネイルの期限走査 | リクエストごとに最大128件の試行履歴を走査する。期限掃除の実行時刻をまとめる余地があるが、既に小さい上限があるため、上記の描画・NG処理より優先度は低い。失敗後の再試行と実行中判定は残す。 |

GIFには別途、最適化とあわせて直したい上限処理がある。`GifAutoFetch.ATTEMPTS` は128件で新規URLを拒否する一方、通常完了時・期限切れ時に古い項目を除去していない。途中でキュー投入を拒否された場合を除き、128種類に達すると、その後の新しいGIFの静止画サムネイル生成を受け付けなくなる構造。動画用の `VideoFrameThumbnail` とは別の履歴なので、動画側の再試行修正だけでは解消しない。稼働中URLを保護した期限削除と、成功・失敗・キュー満杯を区別する管理が必要。

確認箇所:

- [共有NGの照合](C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/extensions/chmate/src/main/java/app/morphe/extension/chmate/SharedNg.java:39)
- [日付・週の計算](C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/extensions/chmate/src/main/java/app/morphe/extension/chmate/SharedNgRules.java:70)
- [画面モデルの定期走査](C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/extensions/chmate/src/main/kotlin/app/morphe/extension/chmate/ModelUi.kt:110)
- [GIFの全モデル無効化](C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/extensions/chmate/src/main/java/app/morphe/extension/chmate/GifAutoFetch.java:26)
- [GIF試行履歴の上限](C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/extensions/chmate/src/main/java/app/morphe/extension/chmate/GifAutoFetch.java:76)
- [赤いIDの判定](C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/extensions/chmate/src/main/java/app/morphe/extension/chmate/RedIdAutoNg.java:69)
- [共通のField探索](C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/extensions/chmate/src/main/java/app/morphe/extension/chmate/ResponseArchiveEntry.java:48)
- [投稿者情報・Spanの生成](C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/extensions/chmate/src/main/java/app/morphe/extension/chmate/PosterHighlight.java:169)
- [個人NGの定期照合](C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/extensions/chmate/src/main/java/app/morphe/extension/chmate/PersonalNgSubmissions.java:97)
- [動画サムネイルの履歴走査](C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/extensions/chmate/src/main/java/app/morphe/extension/chmate/VideoFrameThumbnail.java:42)

既に対策があるため、単純な削除・変更を避けたい箇所も確認した。`HiddenNgUnread` は設定参照・反射メタデータ・隠しレスの整列結果をキャッシュし、未読件数は二分探索を使っている。スレ全メディア一覧にもIntentのスナップショットを使うキャッシュがある。常時下部フィルターの `onPreDraw` は毎フレーム全処理を実行する構造ではなく、更新がキューにある場合だけ `layout` する。GIF通信のキャンセル監視には、接続待ち・読込待ちの中止を速くする役割がある。

実装順は「共有NGの不要な前処理と索引化 → GIFの対象別無効化・128件上限 → レス判定のメタデータキャッシュ → 画面モデル監視の通知方式化」を推奨する。最後の監視方式変更は更新漏れを起こしやすいため、カレンダー選択、検索結果、設定保存、タブ復帰で表示更新が維持されることを確認して段階的に置き換える。

2026-10-30 修正（検証中）

- `SharedNgIndex` で掲示板・種類別の索引を保持。配信リスト、除外、必要票数、禁止レベル、種類の設定が変わると再生成する。ID・ワッチョイの完全一致にはSetを使用する。レスごとの候補ArrayList生成と不要な日付計算を除去し、本文はキーワード候補がある場合だけ正規化する。掲示板URLの解析は一回の一覧処理内で共有する。
- `SharedNg.schedule` に投入済みフラグを追加。待機中を含む同期タスクの重複投入を抑える。
- `GifAutoFetch` は完成URLをまとめて、関係するモデルだけ描画キャッシュを無効化。設定変更では従来どおり全モデルを無効化する。生成posterの逆引きをSetへ変更し、poster一覧のLRU上限とモデル内の旧poster管理を追加した。
- GIF・動画で `MediaAttemptGate` を共有。実行中は期限で解除せず、成功時は枠を返し、失敗時は完了から60秒後に再試行可能。履歴の期限掃除は通常1秒単位にまとめる。キュー投入失敗では直ちに枠を返す。
- `NativeFields` はClass・フィールド名単位の反射メタデータだけを保持。共通レス参照、NG判定、GIFキャッシュ無効化で使う。レスやViewの値はキャッシュしない。赤いID判定の設定オブジェクトと正規表現も再利用し、242の一括判定中はON/OFF値を一度だけ読む。
- 個人NG定期照合は内容が同じならJSONの再シリアライズとsnapshot/queueのcommitを省く。SHA-256の16進文字列生成で1byteごとのFormatter生成を廃止した。
- 画面監視の通知方式への全面移行は見送った。代わりに、過去ログ検索の結果部分へ更新番号を付けて再帰走査を省略する。検索結果の入替、検索先変更、表示設定変更で番号を進める。入力欄やダイアログの監視は維持する。`PosterHighlight` のSpanコピーは長押しと安価Spanの互換性が必要なため残し、共通の反射参照を最適化する。

host検証: 共有NG旧判定との比較10,001ケース、メディア試行履歴1,135ケース、共有NGpolicy96項目、個人NGcollector20項目（変更なしcommit省略を含む）、定期scheduler19項目、送信同意6項目、票数UI9項目、フィールド探索の継承・キャッシュ・インスタンス分離。速度/FPSの実測値はまだない。
