# スレ取得遅延・復元後の本文不足：静的修正候補

利用者が「静的に一回直してみましょう」と指定したため、今回候補は静的修正・既存ホストテスト・ビルド確認まで。改善後の端末計測、APK導入、公開は行わない。

## 復元後の取得判定

以前提供されたZIP Aは履歴115/DAT115で本文欠落なし。ZIP Bは履歴160/DAT0で、categories=767にはDATビット256が含まれない。A/Bの組合せでは45スレにDATがなく、45件すべてに正のres_countが保存されている。その45件はserver_res_count<=res_countで、39件はstateのbit2もOFFだった。集約build/backup-dat-presence-20261104.json。ZIP原本・本文・認証情報は変更/公開しない。

191のnative AutoCheckWorkの静的命令では、cursor列3 res_countをf、列4 server_res_countをh、列7 stateをjへ保持し、h>fまたはstate&2でだけ本文downloaderへ進む。従って本文なしでも保存済み取得数だけで巡回取得を省略する状態を説明できる。39件すべてが実際に巡回対象だったことや、利用者実機でこの分岐を実行したことは未確認。

RestoredThreadCacheを追加。復元対象の履歴キーに限って、実DATが存在しない/0bytesの場合のres_countだけを0へ補正する。read_count/server_res_count/read_state/flag/state/履歴/IDX/投稿マークは変更しない。非空DATはそのまま。保存領域やDATが読めない場合は欠落と断定せず例外にする。

HaiagaruSyncSnapshotのJSON復元/不足分同期は最後に整合確認。HaiagaruBackupArchiveのZIP復元は整合確認を遅延し、DATの書き戻しとその他の復元を完了した後に実施する。本文入りZIPを展開する前に誤って0へ戻さない。すでに復元済みの状態へ補正を適用するには、修正版で履歴を再復元する必要がある。起動時の一括DB更新や強制ネットワーク取得は追加しない。

## 画像がある初期表示

画像補助処理で頻繁に呼ぶPreviewUrls.normalizeの末尾句読点/HTTP判定とDirectVideoUrls.supportedの拡張子判定が、呼ぶたびにString.replaceAll/String.matchesからPatternをコンパイルしていた。式とフラグを変えずstatic final Patternへ置換する。ImgurAlbumAttachments.append内の画像設定は一度読み、各URLでSharedPreferences取得を繰り返さない。画像/GIF/動画の取得方針やURL順は変更しない。

静的修正指定前に開始した旧候補の補助getter反復測定はbuild/attachment-hot-before-191.log。エミュレータ191、通常JPGのメモリ内モデルで0/1/8画像・各4800回を3反復し、画像数と処理時間が増えることは観測した。画面遷移・実画像decode・利用者端末の時間ではなく、今回修正後との速度比較も行わない。初回DEX読込はAndroidのWritable dex拒否で失敗、検証DEXをread-onlyにして実行した。製品クラッシュとは区別する。所有検証モデル以外のDAT/DBを書き換えていない。検証用設定を復元し、AVDをWiFi ON/mobile OFFでデータ保持停止。

## 検証・状態

既存PreviewUrlsTest56、GifAutoFetchPolicyTest34、MediaAttachmentOrderTest7の計97項目成功。DB整合補正の実DB動作と修正後の実時間は未検証。新規bytecodeフックなし。通常Lint付きbuild/buildAndroid成功2m13s、64tasks。ローカル候補build/haiagaru-thread-open-static.mpp、SHA256 0d28771daeab8b3fec9a0471bdadbdfd4e8600f6499f6524d5fcad3178fe1847、ZIP CRC正常。versionラベルは現行dev.7を使用するローカル候補で、公式dev.7資材とは別。今回の変更は未公開で、公開版は1.23.0-dev.7/正式1.22.1を維持。


## 検証用プレ公開の指示

2026-11-04 利用者が「プレリリースして（検証用）として」と明示。静的修正の指定を維持し、端末の復元・速度・表示再検証を行わず検証用プレ公開へ進む。公開説明の冒頭/タイトルへ検証用を明記し、ビルド/host97成功と未確認の実DB・表示・crash・実時間を区別する。既存Semantic Release CIだけを用い、正式版は1.22.1を維持する。


## 検証用プレ公開完了

[1.23.0-dev.8（検証用）](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.23.0-dev.8)を既存Semantic Release CI41787507505で公開。Release/Attest success、実装7c78146/生成2edac33をdevへFF。draft=false/prerelease=true、APIのrelease nameも1.23.0-dev.8（検証用）。冒頭に実DB動作・修正後の表示/crash/速度が未確認と記載し、static/build/host97との区別を確認した。公開6assetのsize/digest/SHA256・MPP/ZIP CRCとRestoredThreadCache同梱を確認。公開MPP SHA256 `c2daef1db7bf4d69733daebbeb7af05972664d0e833440a2b6bbc5e2998426a6`。dev両feedは1.23.0-dev.8、master/main両feedは正式1.22.1のまま。任意VPN ZIP2本は1.21.1と同一。証跡build/release-1.23.0-dev.8-verify/verification.json。公開MPP再適用・端末導入は行わない。
