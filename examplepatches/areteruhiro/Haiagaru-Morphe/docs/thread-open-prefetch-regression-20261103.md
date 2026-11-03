# 未取得5chスレの遷移前DAT取得による遅延

対象は191 / Haiagaru 1.12.0-dev.1と1.19.0の比較GIF。提供映像では選択色から読込画面まで170ms対1250ms、本文まで1130ms対2540msだった。映像の入力時刻・通信・設定は統制されておらず、この値を修正前後の性能保証には使わない。

## 差分から特定した待機経路

`968d107`（1.18.0から収録）はHaiagaruのActivity / Tabletナビゲーションに `ArchiveThreadLinks.is5chThread(original)` を追加した。これにより90日以内の通常5chスレも `ArchivedThreadImporter.importIfNeeded` に渡り、DATが未取得なら画面遷移を引き受けてtrueを返す。Tabletのnativeルーターはこのtrueで即returnする。

importerはworkerでlive DATを全取得し、live DATが有効ならそのバイト列を保存せず `reopen` する。その後ChMateが同じDATを改めて取得する。したがって一覧が残る区間に最初のHTTP取得が入り、本文表示までには二度の取得が入る。キャッシュ済みDATでは早期returnするため、未取得のスレに偏る症状とも整合する。これはメインスレッド上のHTTPや、パッチ適用時のクラス走査ではない。

利用者提供の両 `.haiagaru` 原本は `settings.automaticDat=true` / `settings.chtoio=true` でこの経路が有効だった。原本は変更しない。導入コミットは1.18.2にも存在するため、以前の「1.18.2対1.18.3」の差すべてをこの一件だけで説明しない。

## 再現と修正

公開前候補1.19.0相当の191で、未取得の所有テストURLを使い、requestBytesだけを有効なDAT・600ms待機に置換した。`rewriteLegacyTabletThreadBundle` はtrueを返し、再ナビゲーションまで620msを要した。real HTTPは0。`build/archive-prefetch-delay-before.json`。既存cached fixtureを開く旧プロファイルではこの経路を通らないため、この再現とは区別する。再帰メソッドを全hookしたinclusive合計も実時間として採用しない。

通常の最近の5ch URLはnativeナビゲーションを先に進める。既存の3版DAT worker bridge（歴史的名称 `loadLiveTalkDat`、native DAT lock下）から初回5ch取得を実行し、有効な初回取得DATをそのままnativeキャッシュ・パーサーへ渡す。native結果の構築は既存Talk bridgeと同じで、nativeフック/レジスターの追加・変更はない。

取得済みDATはnative更新へ戻す。自動取得OFF・URL変換OFF・外部板は対象外。mainからの呼び出しで取得しない。live取得に失敗した最近の過去ログは既存ミラーへ進み、代替取得も失敗すればnative downloaderを継続する。従来の古いサーバー/90日超/Talk/VIP向けナビゲーションを維持。初回worker取得では既存IDXを消さない。通信先・代替順は従来の先行取得と同じで、通常更新のnative通信設定は変えない。

## 検証

通常Lint/R8 build成功（4m16s）。MPP `build/thread-prefetch-fix.mpp` SHA256 `9a6fe7f97a0924bb563ab508309de03c7fbc834427f7024e5bb52c1cafd5b7f3`。

emulator-5580 / Android16の既存隔離bindings191/226/242へ署名照合install-r。各18項目成功（遷移前HTTP/Importer=0、main拒否、初回1取得、cache native更新、既存IDX維持、設定OFF、外部板除外、live失敗後の代替、全失敗時のnative復帰）。`scripts/thread-navigation-prefetch-runtime.js` / `build/thread-prefetch-suite-{191,226,242}.json`。修正後のナビゲーション試験は24/23/23msだったが、これはHTTPなしのメソッド試験時間で、GIFのタップ→描画や旧620msと同条件の測定ではない。

3版とも通常のResListActivity→native Tablet転送から未取得の合成スレを開き、1回の制御DAT取得で9991bytes/80レスをnativeが読み、レス45を実画面に表示。`scripts/thread-initial-dat-runtime.js` / `build/thread-prefetch-native-{191,226,242}.json` とXML。実HTTP・投稿・NG送信0。試験設定はfinallyで復元。所有DAT・bookmark・論理位置・markerを照合して削除、調査開始時の旧191 fixtureも削除。cleanup初回のFrida再attach timeoutは隔離アプリ再起動で解消し、ハーネスのJava配列反復を明示indexへ修正してcleanup成功。アプリのテスト成功と混同しない。

導入後APKを再取得してhash一致、各対象PIDに新規fatalなし。台帳は `docs/android-installations.md`。Samsung / Android17の同一一覧タップによる実時間比較は未実施。実回線の混雑やnative転送・初回描画に別の遅延が残る可能性はあり、端末全体の改善率は主張しない。

公式1.19.0の配布物やGASは更新しない。この修正は未公開。


2026-11-03公開追記: 公式[1.20.0](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.20.0)へ収録済み。既存Semantic Release/Build CI成功、公開MPP SHA256 `fe849e75858486f27a7afeb722286955a90fe56000fb34358dfb6435cf79e669`、配布asset digest/CRC/更新feed6件/README一致を確認。詳細は`build/official1200-public/verification.json`とintegration-statusの公開記録。
