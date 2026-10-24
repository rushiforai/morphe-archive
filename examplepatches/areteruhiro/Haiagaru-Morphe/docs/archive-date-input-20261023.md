# 過去ログ日付入力と設定表示の最終確認

## 変更

- ArchiveSearchScreenの検索フォームは自身がverticalScrollを持つが、詳細条件のScrollViewを変換するともう一つのverticalScrollが生成されていた。フォーム子へinsideScroll=trueを渡し、詳細条件は内容だけを展開する。検索結果の独立スクロールと位置保存は維持。
- BrowserModelとModelScreenのWebView上下の操作欄も、既に外側でスクロールしているため同じフラグを渡す。一般の本文・検索結果のroot ScrollViewは変更せず、独自の位置復元や操作を維持する。
- BoundTextFieldの通常／コンパクト双方のラベルはmaxLines=1と省略表示。狭い幅や浮動ラベルの大小で折り返し行数が変わることを防ぐ。入力本文の行数やカーソル操作は変更しない。
- ユーザー指示によりUAの変更スイッチと入力欄、対応するLiveSettings登録を設定生成から削除。設定検索も同じ生成モデルを使うため検索に現れない。通信処理と保存値を削除・変更していない。公開リリース説明にはUA変更を記載しない。

## 確認

- 最終Android build通常Lint込み成功、build/prerelease-final-ui-build.log（4分36秒）。元191/242 APKへパッチ適用・署名成功。
- 242の実タブで詳細条件を開き、IMEから終了日を入力。最初の2でフォーカス／IME配置が落ち着いた後、残り9文字を1文字ずつ入力。全てのEditText boundsが[24,320][647,384]で一致し、最終値2026-10-23に成功（build/archive-date-typing242-pass.log、archive-date-pass242.xml）。検索通信はfixtureで抑止。外部サーバーへ検索は送っていない。試験後は表示された×をADBでタップしてタブを閉じた。
- 初回は4文字まで安定したがfixtureの自動終了時間に達し、Focused input disappearedで試験中断。延長後の再接続はFrida attach timeout、次はfixtureのEditText.setText overload指定が誤りで停止。IME直後の初回フォーカス確認が早すぎた試験もあった。これらは成功扱いせず、実際にフォーカスと先頭2を確認してから9文字の成功試験を実行。入力中の揺れの完全な端末別再現・すべてのIMEを網羅したとは扱わない。
- 191の最終設定モデルで23個のTextViewを走査し、User-Agent項目がないこと・モデル生成前後のSharedPreferences全体が不変であることを確認（build/hidden-ua-settings191.log）。191の最終APKで実スレ本文表示もUI dumpにより確認。242の最終APKでも実入力試験を実施。
- 日付入力の実操作は242のみ。共有Compose変更につき191/226の重複操作は省略。上部／下部パネル全画面と全テーマ・文字倍率の網羅確認は未実施。

## 導入台帳（2026-10-23 JST）

対象はemulator-5554。署名照合後install-r成功、データ消去なし。鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias=Morphe、証明書SHA256=0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。

共通絶対ルートはC:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/。

- 最終MPP: prerelease-final-ui.mpp SHA256=79D8BDFE0A23C5813FBBEA523AAE4DB87D0F25FD072DD01366BD2C4EFB456B93。
- Haiagaru 検証 191 / ChMate 191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191: prerelease-final-ui191.apk SHA256=2057559B1B9D410FCDFC3B62540422E834CBECBA1814163EAA35CF4FF55DA333。
- Haiagaru 検証 242 / ChMate 242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242: prerelease-final-ui242.apk SHA256=19A3F95D9A6AD6C183882CB4130AB3E771DB188FCC313B5BA016CED713D4C9C6。
- 中間242: archive-input242.apk SHA256=C1ADAB1604D8B265155A4F161B7BD9F7CC4BF724E583D5A442EE491D3E6A36D7。UA項目削除前のMPP archive-input-candidate.mppによるもの。最終APKへ更新済み。

中間MPP archive-input-candidate.mpp SHA256=59CFD21494EC04173B5D118FDBA94BC8EE1EE0925873543D44027E8567A3CDE1。

公開前の候補。CI生成版・公開済みの配布物とは区別する。
