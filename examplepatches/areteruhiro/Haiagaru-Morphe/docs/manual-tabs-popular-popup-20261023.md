# 手動タブ追加とレスポップアップ後の人気レス

## 原因と修正

### 手動タブ追加

「画面を新しいタブに追加」が自動タブ表示の親・個別設定を参照し、設定Activityの起点extraがないと本体へ戻れなかった。

- 自動経路の `open` と、明示操作の `openManual` を分離。後者は自動表示設定を変更せず、両スイッチがオフでも利用できる。
- 手動選択は全6画面を提示。自動表示する画面の個別選択は自動経路だけに適用。
- 同じtask内の生存中TabletHomeActivityを弱参照で関連付け、設定画面へ至る途中の別Activityにも対応。別taskのタブレットへ勝手に追加しない。
- 別画面の設定では、本体を前面へ戻しresume後にタブを追加。停止中にFragment状態を変更しない。説明も手動追加と自動表示の違いを記載。

### 人気レス

`PopularNativeRows.find` が「元スレのどれかのレスとsnapshot先頭が一致」すれば検索成功としていた。レス2以降のポップアップが最後に保存されると、元スレでその短いデータが選ばれ、0件になる。

- full sourceの先頭レスidentityとcapture先頭を一致させる。任意の共有レスでは一致としない。
- 既知の大きなcaptureに含まれる短いポップアップは保存しない。レス1のポップアップでも表示方式を変更しない。連続して16件以上開いてもfull captureを追い出さない。
- 人気判定はcapture時のdepth・返信数を使う。共有レスの可変fieldを後から読んで元の集計が変化しないようにする。実際のスレ再構築時は再captureし、正当な返信数変更・0件は反映する。

## 検証

- 実スレの取得済みレスと本番capture/save/selectを使用するFrida再現で、修正前は161→0件。修正後161→161件、ポップアップの表示方式変更でも元スレcaptureを維持。テストcacheは復元。
- Android build通常Lint込み成功、2分59秒。最終MPP SHA256 `E8D7E229A850EBE6D5F7A57E85F0C1585730E7F5896A333ADF31F5648509EB38`。公開済みdev.10と同名だが別の未公開ローカル候補。
- 191/242を元APKへ適用して既存検証アプリを署名照合後install-r。以前のNG未読軽量化・専用ビューア調整・タブ見出し変更も保持。
- 最終nativeタブfactoryと人気レスhookの元レジスター・元命令・分岐・threshold・Normal/Tree引数検査は191/242成功。
- 人気レス合成回帰は191が30・242が29項目成功。標準/直接判定とpopup設定の独立、ツリー103件/通常1件、レス2popup、レス1popup、29回連続popup、mutable返信数のcapture固定、再capture時の正当な0件、元リスト保持、構造行保持、legacy fallbackを含む。
- 242の実スレでは標準161件がnative件数と一致。直接返信ON/popupOFFでは件数2・実際の本文行2で一致し、設定/選択を復元。
- 最終191/242の手動追加テストは各9項目成功。自動/個別OFF、起点extraなし別設定Activityから同task本体の解決、全6項目、実タブ表示、OFF値維持、設定Activity終了、実タブ終了・設定復元。
- 最終ログで新規crash時刻の増加なし（既存03:12 UTCのART記録は残存）。lastanrは起動後記録なし。長時間での無再発を保証するものではない。
- 初回は初回構成案内dialogがActivityのwindow focusを奪いテストが停止。案内を適用せずdismissしてActivityの前面状態で判定し直した。次の試験は13秒時点のタブ描画確認が早く失敗したが、後の診断ではresumedな検索タブが存在。25秒後の描画確認へ修正し成功した。成功前のテスト停止を実装成功と扱っていない。
- 226は共通Java修正でnativehook未変更のため重複導入/端末操作を省略。全自然発生条件や長時間での完全解消は未確認。公開はしていない。

## 公開後の確認

- 上記「公開はしていない」はローカル検証時点の記録。2026-10-23、既存Semantic Release CI 39912727895が成功し、1.12.0-dev.11をプレリリースとして公開（draft=false、prerelease=true）。実装c21d00c、CI生成コミット569e244。
- https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.11
- 公開6資材を再ダウンロードし、全件GitHub digestとSHA-256が一致。Android MPPのclasses.dexを確認。MPP SHA-256: E4B920568112BBA5DA883BAF497FFE2180B2070DE0AC3136E2A3552F2F041BFC。
- devの公開JSON2本は1.12.0-dev.11、created_atは2026-10-23T06:40:09（Z・offsetなし）。mainの正式JSONは1.11.2のまま保持。
- emulator-5554のMorpheで、プレリリースONの既存ソースを更新。新規logcatにmain/patches-bundle.jsonとdev/patches-bundle.jsonの取得を確認。カードと詳細の双方が1.12.0-dev.11となり、BundleEntityも同版を記録。ソースの再登録・チャンネル変更・ログ消去はしていない。
- 公開物の検証はbuild/public-dev11、Morphe新規ログはbuild/morphe-dev11-live.log。APK操作確認は公開前の同一ソース候補によるもので、CI生成MPPからの再インストールではない。
