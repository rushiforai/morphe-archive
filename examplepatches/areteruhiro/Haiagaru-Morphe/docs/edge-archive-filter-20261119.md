# エッヂ過去ログ遷移・タブレット下部フィルター

2026-11-19 `1.46.0-dev.9` に含めてプレリリース公開済み。通常ChMateパッケージには変更を導入していない。

## 修正

- エッヂ過去ログビューア1の検索結果から開く外部板スレは、5ch/2ch.scの過去ログ取得ルートへ入れず、ChMate標準の外部板スレ遷移へ渡す。元の処理ではEddiのURLから5ch用URLを組み立て、複数の過去ログ経路を順に試していたため、待ち時間の後に「過去ログを自動取得できませんでした」と表示される可能性があった。
- タブレットの一時的な下部フィルターPopupWindowは、全Activity幅ではなく表示中のレス一覧paneの矩形に合わせる。表示範囲と上部ツールバーを考慮して高さ・位置を再計算する。スマートフォンの表示経路は従来どおり。
- ChMate 0.8.10.242のエキスパート設定は既存devコードで修正済み。reporter242の実際の設定Activityを開き、設定カテゴリの本物のtoggleからON/OFFし、View表示・保存値・Composeへ渡す設定行一覧が同じ画面内で即時更新することをFridaで検証。

## 確認

- Frida 17.18.0 / reporter191: Eddi URLが5ch用経路から除外される、5ch/Talkの既存経路は維持される、Eddi URLの処理は250ms未満、外部通信0回、tablet pane内のpopup frameになる、の計7項目に合格。
- Frida 17.18.0 / reporter242: ExpertSettingsの本物の画面コントロールをON/OFFし、保存値とView visibilityが即時に切り替わること、`settingsRows`が同じ画面内で増減することを計7項目確認。設定値は元の状態へ復元。
- Mi Note 10 Android 11で各reporterアプリを起動。実Eddi過去ログURLの遷移とタブレット実機表示は未実施。
- `git diff --check`成功。Android buildはこの2変更を含んで成功済み。試験に使った追加ネットワーク、投稿、DAT書込みなし。

## 生成物

- MPP: `build/edge-archive-filter-20261119/apks/candidate.mpp`
- MPP SHA-256: `4d43a279ad8f256d22880d495995b1fa81ab2d9b14d0fa98603cb10aaca1f705`
- reporter191 APK SHA-256: `c29de62e04d7df5b692ee498755a1da59b0cd0069bb896893c21dd3847ccb8b`
- reporter242 APK SHA-256: `a11750b976d02a22e4480094f076400c89fcd1bb5c23dc3c76cae2813e1b9f38`
- 実機導入先: `jp.co.airfront.android.a2chMate.haiagaru.reporter191` と `jp.co.airfront.android.a2chMate.haiagaru.reporter242`（ADB `d5497008`、署名一致後にデータ保持install-r）。鍵証明書SHA-256は既存Morphe証明書 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

プレリリース: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.46.0-dev.9
