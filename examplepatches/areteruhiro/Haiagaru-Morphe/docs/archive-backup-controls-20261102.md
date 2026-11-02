# アーカイブ遷移・自動バックアップ表示の調査

対象報告は226 / OPPO CPH2353 / Android 12 / Haiagaru 1.18.1の「下方のアーカイブをタップしても上に戻るだけ」と、更新後にローカル自動バックアップのチェックが外れる症状。

利用者は当初Haiagaruのレスのアーカイブと回答したが、その後ChMate標準かもしれないと補足。スレ一覧・保存レス一覧・従来形式のどの段階かは不明。自動バックアップの保存先・間隔も消えるかは不明。

## 確認した不具合と修正

`ModelUi`のチェック操作が、ネイティブの設定リスナーが返した値と別のCompose内状態を持っていた。保存先未選択でローカル自動バックアップをONにすると、設定リスナーは拒否してOFFへ戻すが、画面のチェックだけがONに残った。226の修正前実APKで画面ON・保存値OFFを再現。これは画面やアプリを開き直すとOFF表示になる経路であり、実際の上書き更新で保存済みのtrueがfalseへ変更された証拠とは区別する。

チェック描画を既存の`BoundSettingRow`へ統一し、設定リスナーが確定した値を表示する。行のラベルもタップ対象になる。保存先を推測して自動で有効にせず、ON/OFFの保存先キーも変えない。

保存レスの詳細遷移では、一覧の`dismiss()`が非同期なのに詳細を同期で開いていた。修正前Frida記録ではdetail → show → dismissNowの順。既存の`dismissForNavigation`を使い、Composeの入力処理後に一覧を閉じてから詳細へ進む。連打の抑止とActivity破棄チェックも同処理に任せる。保存データ・並び順・DATを変えない。

## 再現範囲と未確認事項

API36エミュレータの隔離アプリで、ChMate標準に50件のスレッドアーカイブ、Haiagaruに40件の保存用スレと各3件の保存レスを作成した。修正前226でも標準の37件目、Haiagaru一覧の下方のスレ、下方の保存レスは開けた。報告された「上に戻るだけ」は未再現。Android 12 / OPPO上での確認は未実施で、遷移順の改善だけで報告全体が解決したとはしない。

上書き更新で保存済み自動バックアップがOFFになる現象自体も未再現。表示と保存値の不一致を修正したことと、更新時の保存値変更を修正したことを混同しない。

検証結果・公開状態は`integration-status.md`、APK・署名・対象端末は`android-installations.md`へ記録する。

## 最終検証（未公開）

通常Lint/R8を含むビルド成功（2分52秒）。MPPは`build/archive-toggle-final.mpp`、SHA256 `48b562db1f8f36324a37f24da57e9e0fa3ef9a81804aa560524dfd03018674dc`。

`emulator-5580`の専用packageを署名照合し、191→226→242へ上書きした。各版でONの更新後保持、保存先なしの操作が表示・保存ともOFF、保存先ありの操作が表示・保存ともON、再起動後保持、40件の一覧をスクロールして選んだスレと保存レス1の詳細が一致することを確認。191/242は各11項目、226はFrida確認を加え13項目成功。226の最終記録はdismissForNavigation → dismissNow → detail → show。保存値trueが更新でfalseになる症状そのものは未再現。

各版の標準画像・GIF移動・拡大時の操作を8項目ずつ確認、最終crash buffer空。初回画像スモークは入力動画ファイルのパス指定ミスで開始できず、実在するfixtureを指定した各8項目を採用した。

証跡は`build/archive-toggle-{191,226,242}-ui-result.json`、`archive226-baseline-transition-trace.json`、`archive-toggle-226-final-trace.json`、`archive-toggle-image{191,226,242}.log`、`archive-toggle-final-crash.log`。テストで作った40保存用スレ・50標準アーカイブは、専用packageとパス・ID・ファイル名を照合して削除し、自動バックアップをOFFへ戻した（`archive-toggle-cleanup.json`）。実機・通常package・実投稿・NG送信・GASには変更なし。

## 追加修正（未公開）

「最低限構成」と「広告だけの設定プリセット」がローカル自動バックアップの`enabled`を強制的にfalseへ書いていた。修正前242の実アプリで、Fridaから広告だけのプリセットを適用すると保存済みONがOFFになることを確認。この経路からバックアップの名前空間を除外した。以前の退避情報を戻す処理でも同名前空間をスキップし、現在のバックアップ設定を維持する。利用者の報告がこの経路で起きたかは未確定であり、APKの上書きだけで値が消えたことを再現したとはしない。

アーカイブのスレ選択と従来形式のレス選択は、Android標準AlertDialogのListViewへ変更した。選択項目の表示と位置・タップ判定を一つのListViewに任せ、Composeのスクロール領域の入れ子を通さない。保存用スレの内容・詳細・管理の機能と、元のファイル構造は維持する。ChMate標準のスレッドアーカイブのタップ処理は変更しない。

追加修正の最終Lint/R8ビルドは3分で成功。MPP `build/archive-preset-final.mpp`のSHA256は`375b01f1056663269ac389d790e0d5fa2d61530fbe293705e31f710977226100`。191/242のUI各15項目、226はFrida遷移順を含め17項目成功。40保存用スレ・40従来形式レスで下方の選択と表示内容の一致、ListView実使用を確認した。`scripts/backup-preset-preservation-runtime.js`で各版15項目成功（ON/OFF両方のプリセット適用・復元・旧退避情報、名前空間全値一致、最低限設定の実コールバック実行）。テストのKotlinクラス名・最適化されたshow呼び出しの仮定を修正して再実施し、旧ハーネス失敗を成功扱いしない。

各版の画像/GIF/拡大操作は8項目成功。同じAPKへ再度署名照合更新して、キャッシュ済み合成スレのレス45が実本文に表示されることを3版で確認（自動更新OFF、投稿なし）。bytecode patchのフック・レジスター・元命令には変更なし。最終crash buffer空。証跡は`build/archive-preset-{191,226,242}-ui-result.json`、`archive-preset-preservation{191,226,242}.json`、`archive-preset-image{191,226,242}.log`、`archive-preset-thread-smoke.json`、`archive-preset-final-crash.log`。

40保存用スレと40従来形式レスはテスト作成ID/URL/パス/内容を照合して削除、自動バックアップをOFFへ戻した。`archive-preset-cleanup.json`、`archive-preset-legacy-cleanup.json`。実機/通常package/実投稿/NG送信/GAS変更なし。公式公開はSemantic Release CI経由、結果は`integration-status.md`へ別記する。
