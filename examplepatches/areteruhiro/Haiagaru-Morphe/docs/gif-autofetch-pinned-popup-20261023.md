# GIF自動取得設定・常時下部フィルターとポップアップ

## GIFリンク

- Haiagaru設定「画像・動画を見る」に「GIFリンクから自動で読み込むもの」を追加。画像＋GIF=0／画像のみ=1／GIFのみ=2／取得しない=3、key=urlGifFetchMode。画像は静止JPEGサムネイル、GIFは元ファイルのnative添付。自動再生の追加ではない。
- 未設定では従来の画像取得ONならGIFのみ、OFFなら取得しないを継承。明示設定後は通常画像・動画の設定とは独立。.gifのHTTP(S)リンクを対象とし、大文字拡張子・query/fragmentも対応。gifvやXのMP4アニメーションは既存動画設定を維持。
- native添付の共通complete経路に投影し、本文URLは変更しない。既存GIFの除去／再追加と生成済みposter除去を行い、OFF→ONも本文のキャッシュ済み解析から復元する。解析は弱参照modelごと最大4096件、毎bindで再走査しない。型付き添付キャッシュを設定変更/生成完了時に無効化する。
- 先頭フレーム生成は単一worker・待ち行列16・最大128URL、失敗再試行60秒。元GIF最大8MB/20秒、redirectなし、GIF署名・寸法検証、480pxへ縮小。静止JPEGのみcacheDirへ保存。登録VPN対象は既存保護経路を利用し直接通信へfallbackしない。「画像のみ」でも生成のためGIF取得が必要な点を設定内に説明。
- .haiagaru共有の数値allowlistとdefault catalogにも追加。

## ポップアップの末尾隠れ

- 報告画像wPmaSVa/7rQXHuRをブラウザで確認。固定フィルターはActivity overlayで、本文にだけbottom paddingを追加していたため、内蔵の返信/ID抽出ポップアップの末尾を隠していた。
- 同じFragment内のnativeレスadapterを持つ補助ListView/RecyclerViewに、フィルターと重なる分だけbottom paddingを加える。別ペイン・無関係なリストは対象外。元paddingを記録しnative変更に追従、非重複/OFF/detachで自分の変更だけ復元。常時フィルター自体は維持する。フックやnative registerは変更していない。

## 確認

- GifAutoFetchPolicyTest: 27項目成功。全モード、旧設定fallback、通常画像/MP4/gifvの非対象、URL形式、重複除去、抽出上限。
- 通常Lint込み最終build成功、build/gif-popup-verified-build.log（2分20秒）。先行popup buildの例外型宣言エラーは修正し、失敗候補は導入していない。最終MPPとAPKは以下。
- 226の実Android設定Viewに4選択肢があることと選択値、4モードの添付投影、通常画像/動画維持、再投影の冪等性、OFF→ON、共有validate/export: 19項目成功（build/gif-autofetch226-final-test.log）。設定・メモリposterを復元、外部通信なし。
- 合成1px GIFをAndroid loopbackだけで配信し、実worker経路のdecode→JPEG保存→ローカルHTTP配信→再decodeの1px一致を確認（build/gif-poster226-test.log）。検証JPEG削除・設定復元。外部GIFの通信・全配信サイト・長時間使用は未確認。
- 226nativeの長いレスpopupで旧候補の重なり126px/padding0を再現（build/pinned-popup226-before.log）。最終候補はpadding126、末尾レスがfilter上端より上に完全表示、padding累積なし、OFFで0復元: 9項目成功（build/pinned-popup226-after.log / pinned-popup226-visual-test.log）。実画面build/pinned-popup226-fixed.pngと端末XMLでも確認。テストpopupを閉じ、元設定を復元。
- native167 text binding/8 touch dispatch/write reentry guardとnative tab factoryの元register/operand/branch/標準Web constructor保持検査成功。
- 同一候補で固定フィルターの従来23項目も成功（build/gif-popup226-persistent-regression.log）。上部との併用、各ボタン、本文余白、従来の開閉popup、OFF時の復元を維持。最終crash bufferと/data/anrは既存08:45/11:09:56の記録から増加なし。
- 191/242は共通Javaと既存complete経路を使用、今回の重複導入・端末操作はユーザーの共通処理省略許可に基づき未実施。全版で実画面確認したとは扱わない。

## 候補導入（未公開）

絶対ルート C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/ 。

- emulator-5554、Haiagaru 検証 226、0.8.10.226 dev、jp.co.airfront.android.a2chMate.haiagaru.resumefix226。同一証明書照合install-r Success、データ消去なし。実機は変更していない。
- APK build/gif-popup226.apk SHA256=1A6E362CCCA78664EBE77F8EB654654214FD7379EB6FD70CEFAC03C7D2231635。
- MPP build/gif-popup-verified.mpp SHA256=E13999DCC2E2B6CC7ABF0407224959F07465D3019503815DB36C942BA3408044。公開dev.13とは異なる未公開候補。
- 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256=0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- リリース/生成版名/配布JSONは変更していない。先行の226リンクカード位置調査差分は保持。
