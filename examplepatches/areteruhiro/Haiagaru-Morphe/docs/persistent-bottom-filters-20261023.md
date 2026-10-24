# 下部フィルターの常時表示

## 仕様

- 「下部フィルターを常に表示」、key=persistentBottomQuickFilters、初期false。Haiagaruの表示設定と「ツールバーとフィルターの設定」に追加。
- 既存のbottomQuickFilterPanelは開閉するPopupWindowの選択。新設定は独立した非モーダルの固定パネルで、上部フィルターのcompactQuickFiltersとも独立する。
- スレ本文ListView／RecyclerViewの可視矩形に合わせ、Activity内のFrameLayoutに表示。タブレットの反対ペインを覆わず、native下部ツールバーより上に置く。システムの可視領域と交差させてIME等に追従。
- 本文リストの元bottom paddingを保存し、パネル高を追加して末尾のレスを隠さない。オフ・破棄時に復元。native側でpaddingが変わった場合は新しい元値へ追従し、閉じる時に他の変更を上書きしない。
- 一時パネルと共通のBottomControlsを使用。選択、AA／自分／返信の個別表示、件数、画像長押しを共用。固定パネルは外側タップで閉じず、常時の150msポーリングはしない。変更・native更新・layoutで同期し、非表示ペインでは隠す。
- detach時はoverlayとglobal-layout listenerを外し、再attachで復元する。設定共有の許可リストにも追加。

## 検証

- 通常Lint付きbuild成功: build/persistent-bottom-filter-final-build.log（2分20秒）。
- 191／242の実レスFragmentとnative adapterで各23項目成功。初期OFF、bottomQuickFilterPanel=falseでも固定ON、ペイン内の位置、下部ツールバーとの境界、末尾padding、7項目、件数OFF、AA切替と復元、padding累積なし、上部との独立、個別非表示、OFF時削除と元padding復元、従来popupの開閉。設定と元の追加フィルター選択を復元。ログ: persistent-bottom-filter191-final-test.log／persistent-bottom-filter242-test.log。
- 最初のfixtureはfindViewWithTagの返り値をViewへcastせず失敗。次のfixtureはplatform showAtLocation hookでPopupを捕捉できず失敗したが、実windowはPopupWindowで表示されていた。off-mainの実Popup探索で置き換え、上記最終検査に成功。アプリの不具合として成功数に混ぜない。
- 実際のsettingsDISPLAYのSwitchをオンにして表示を確認。build/persistent-filter242.pngで上部と下部の併用・本文領域・native下部ツールバーを目視確認。60秒後に元の設定値とkeyの有無を復元。
- 固定パネルの「画像」をADB長押しし、native ImageListActivityが開くことと画像サムネイルの表示を確認。画像保存ダイアログはキャンセルし、ファイル保存は行っていない。初回UI dumpは遷移中にnull rootだったため、次のdumpで確認。build/persistent-filter-image242.png。
- 226は共通Java実装と既存register hookであり、ユーザー許可に基づき今回の重複端末操作は省略。全テーマ・文字サイズ・実折りたたみ端末の組合せは未確認。

## 先行修正・統合

- 242本文メニュー下4桁NGとスレ側専用画面の左右タブ移動を保持。
- タブ移動は実ActivityへのMotionEvent dispatchで6画面145項目成功（build/thread-tab-swipe242-layout-aware.log）。native pagerの表示を待つfixtureに変更し、0サイズ／表示途中のViewへ操作を送らない。以前の再選択直後の失敗はこの検証手順を是正して解消。設定とfixtureページを復元。後からnativeがタイトルを更新した検証用about:blankページ18個も正確なhaiagaru-swipe markerで削除し、他のページを保持。
- 191／226／242のnative selection契約の静的検査、191／242の生成APKのfactory register・operand・分岐・標準Web constructor保持検査成功。
- リモートのcb7c7abまでをFFで取り込み、別作業の変更を保持。主開発先に重複修正はなく、生成メタデータを手編集しない。現在の正式版は1.11.3、以前のプレReleaseは別作業で削除済みだがdev.12タグは残っていた。次プレは既存Semantic Release CIのみ使用する。
- 統合後通常Lint build成功: build/persistent-bottom-integrated-build.log（2分50秒）。最終242でも23項目成功（build/persistent-bottom-integrated242-test.log）。Fridaなしの本文長押しから下4桁NG画面を表示し、保存せずキャンセル。内部画像の実表示はbuild/persistent-integrated242-image.pngで確認。
- 最終242をFridaなしでforce-stop後に通常起動し、UIAutomator dump成功。旧08:45のFrida crash、11:09:56の旧候補VungleProvider起動ANR以降、新規記録なし。旧起動ANRの根本原因解決は断定しないが、最終候補の起動・本文・画像・変更操作では再発していない。am start -Wの先行timeout自体を成功扱いせず、実表示とログを別に確認した。

## 候補導入

絶対ルート: C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/ 。対象はすべてemulator-5554。同一証明書を照合しinstall-r成功、データ消去・アンインストールなし。

- 191: Haiagaru 検証 191、0.8.10.191 dev、jp.co.airfront.android.a2chMate.haiagaru.settingsfix191。build/persistent-bottom-filter191.apk SHA256=31735A80E85D6866572DAD7756380448D9F8A42CFE3C3F7CAE25C9DA685FA194。
- 242: Haiagaru 検証 242、0.8.10.242 dev、jp.co.airfront.android.a2chMate.haiagaru.resumefix242。統合前build/persistent-bottom-filter242.apk SHA256=FF77043D22E8F6B714088BD7C7642C64FC17BD237D466F7A7ACEDD59FB0D34DB。
- 統合前MPP build/persistent-bottom-filter-final.mpp SHA256=9B4607DC833529C95288F80ABAB6911231E3337F42145409A7DF0290A6103317。
- 最終242: build/persistent-bottom-integrated242.apk SHA256=ACEC2F5F78BA9309E7AF0D6758EB78848841053BDCBC3073F6E8A153E04DA123。
- 最終MPP: build/persistent-bottom-integrated.mpp SHA256=97FAEAE5FD6EB0249D5D9DA81BBD3F171D8B24EA65CD6FFA629D7F1155E9756E。
- 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias=Morphe、証明書SHA256=0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- 実機は変更していない。これらは公開前候補であり版名dev.12は公開assetと同一ではない。
