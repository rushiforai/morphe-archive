# Android導入・署名台帳

## 2026-10-26 CAPTCHA/計算＋ジェスチャー6操作の統合242（未公開）

ユーザーの実機導入/最新認証変更も含める指示による。XIG05/Android15、serial `730eae72`、ChMate `0.8.10.242 dev`、表示名 `Haiagaru 検証 242`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。23:17頃JST、`InstallVerifiedApk.ps1`で既存署名と一致を確認してinstall-r Success、データ保持。TabletHomeActivity cold起動Status ok、PID3607。

- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/combined-gestures-captcha242.apk`、SHA256 `333F17F6AD6FD47A7AE9BE989C9A68F45A446DE730C538621B310F7F3F8CAAB4`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/combined-gestures-captcha.mpp`、SHA256 `6A734DA86369A0AC9ED53279B7320A029F76CA6CD089C673A8B86BF389B26742`。生成版名1.13.0-dev.1は公開版と異なるローカル候補。
- 元APK `C:/Users/narum/Downloads/chamate/242/chmate-0-8-10-242-dev.apk`。
- 鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

通常Lint付きbuild5m19s成功、APK適用/署名成功、完成APKのタブfactory/元命令/レジスターとnative下書き保存writer wrapperを検査成功。最新認証ダイアログ/計算/投稿成功後処理と、ジェスチャー6操作を含む。ログ `build/combined-gestures-captcha-c1-build.log` / `build/combined-gestures-captcha242-patch.log` / `build/combined-gestures-captcha242-install.log`。

実機ではHOME/スレ両ペインのnative空タブ追加・追加先設定反転・fixture除去/設定復元19項目成功。その後XIG05が切断、ADBはMi Note10/d5497008へ切替。実WebView履歴fixtureは未実行、別端末未操作。今回新しい3操作の実スワイプ/実サイト認証投稿成功/終了時crash log再取得は未確認。詳細 [tool-tab-chmate-gestures-20261026.md](tool-tab-chmate-gestures-20261026.md)。

## 2026-10-26 PR #93ジェスチャー改善候補242（未公開）

XIG05/Android15/serial `730eae72`、ChMate `0.8.10.242 dev`、表示名 `Haiagaru 検証 242`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。21:59頃JST、`scripts/InstallVerifiedApk.ps1` で既存署名一致を確認しinstall-r Success、データ保持。TabletHomeActivity cold起動Status ok。

- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/tool-tab-gestures242.apk`、SHA256 `0AE196B772467805E44CB76AD86CDB5D48CE21D8863DB5835A74C9D961B724EE`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/tool-tab-gestures.mpp`、SHA256 `44986460A48FC4C6CA7EFA397BEA0087AF77F85FDC40100E3358D1C4CEF0E924`。生成名1.13.0-dev.1だが公開版とは異なる候補。
- 元APK `C:/Users/narum/Downloads/chamate/242/chmate-0-8-10-242-dev.apk`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

ログ `build/tool-tab-gestures-isolated-build.log` / `build/tool-tab-gestures242-patch.log` / `build/tool-tab-gestures242-install.log`。HEAD df758a3+今回の5ソースだけの分離ビルド候補で、並行作業中の認証画面変更は含まない。設定スイッチの初期OFF/ON保存/OFF保存を実機確認、実スワイプ/タブロックは未確認。試験中は通知パネル前面でタブView生成待ちが失敗し、検査設定は復元、空fixture2タブも除去した。attach前の21:59:27終了はLOW_MEMORY。詳細 [tool-tab-chmate-gestures-20261026.md](tool-tab-chmate-gestures-20261026.md)。

## 2026-10-24 取得済みスレの下4桁検索トグル242（未公開）

emulator-5554/resumefix242へ初回候補を署名照合install-r更新Success、データ保持。APK/MPP絶対root・SHA256・鍵・途中のステータスバー重複と追試は[cached-wacchoi-suffix-search-20261024.md](cached-wacchoi-suffix-search-20261024.md)。初回の内部ON/OFF確認を可視位置までの完成確認と区別する。実機/公開は未変更。

## 2026-10-24 過去ログページ端・下部フィルター位置・設定感度242（未公開）

emulator-5554/resumefix242へ初回・継承修正APKを署名照合install-r更新Success。絶対パス/全SHA256/署名鍵・結果は[pages-filter-gestures-20261024.md](pages-filter-gestures-20261024.md)。最終の位置保持7項目は並行作業のcached-wacchoi-toggle242.apkに更新された後の実base.apkで成功しており、当方の直前候補と区別して記録。実機/公開は未変更。5554予約確認後は操作停止。

## 2026-10-24 エッヂ検索欄切替・次スレ候補起動242（未公開）

emulator-5554のresumefix242へ署名照合データ保持更新Success。APK/MPP絶対パス・SHA256・鍵・検証範囲は[eddi-next-thread-form-20261024.md](eddi-next-thread-form-20261024.md)。実機/公開Releaseは未変更。

## 2026-10-24 固定フィルター初回measure前予約（191/242・未公開）

emulator-5554のsettingsfix191/resumefix242へ署名照合install-r Success、データ保持。APK/MPP絶対パス・SHA256・署名鍵・検証結果と未解決ANRは[pinned-first-layout-191-20261024.md](pinned-first-layout-191-20261024.md)。実機/公開版は未変更。新着到着条件の完全解決確認ではない。

## 2026-10-24 ローカル自動バックアップ検証191（未公開）

emulator-5554 / settingsfix191へ署名照合install-r Success、データ保持。中間/最終APK・MPP絶対root/SHA256・鍵と検証設定の復元結果は[local-auto-backup-check-20261024.md](local-auto-backup-check-20261024.md)。実機変更・公開なし。

## 2026-10-24 サムネイル・常時下部フィルター・下4桁NG候補

emulator-5554のHaiagaru 検証 242（resumefix242）へ同一署名照合install-r Success、設定・データ保持。APK/MPP絶対root・SHA256・鍵・途中候補を含む記録は[thumbnail-pinned-menu-20261024.md](thumbnail-pinned-menu-20261024.md)。実機と公開Releaseは変更なし。

## 2026-10-23 GIF取得選択・固定フィルターとポップアップ修正候補

emulator-5554のHaiagaru 検証 226（resumefix226）を署名照合install-rでデータ保持更新。APK/MPP絶対ルート・SHA256・鍵・検証結果は[gif-autofetch-pinned-popup-20261023.md](gif-autofetch-pinned-popup-20261023.md)参照。公開dev.13と異なる未公開候補、実機は変更していない。

## 2026-10-23 公開dev.13を226へ適用・リロード位置検証

emulator-5554のresumefix226へ同一署名照合install-r Success。公開MPPを使用し設定・データ保持。APK/MPP絶対ルート・ハッシュ・鍵・native検査と最終6項目成功は[reload-card-position226-20261023.md](reload-card-position226-20261023.md)参照。実機は変更していない。

## 2026-10-23 下部フィルター常時表示・公開前統合候補

emulator-5554の191／242を同一署名照合してデータ保持更新。各23項目成功、242は最新origin/dev取り込み後の統合版へ再更新済み。package・版・表示名・APK/MPP絶対ルート・SHA256・鍵・結果は[persistent-bottom-filters-20261023.md](persistent-bottom-filters-20261023.md)参照。191は統合前の同一フィルター処理で検証し、226共通重複操作を省略。実機は変更していない。

## 2026-10-23 242 本文メニューの下4桁NG登録修正候補（未公開）

emulator-5554の242を同一署名照合install-rで更新、データ保持。package・表示名・APK/MPP絶対ルートとSHA-256・鍵・結果は[ng-suffix-body242-20261023.md](ng-suffix-body242-20261023.md)参照。先行タブ移動の変更も含む。191／226・実機への再導入と公開は未実施。

## 2026-10-23 スレ側の隣接タブ移動候補191/242（未公開）

emulator-5554の既存検証用191/242を同一署名照合install-rで更新。表示名・版・package・APK/MPP絶対ルートとSHA-256・鍵・結果は[thread-tool-tab-swipe-20261023.md](thread-tool-tab-swipe-20261023.md)参照。実機の変更、データ消去は行っていない。操作検証中。

## 2026-10-23 日付入力・設定表示を含む最終候補191/242

emulator-5554で署名照合install-r成功。最終はprerelease-final-ui191.apk / prerelease-final-ui242.apk。表示名、package、APK/MPP絶対ルートとSHA-256、署名鍵は[archive-date-input-20261023.md](archive-date-input-20261023.md)参照。実機への導入は行っていない。

## 2026-10-23 左ペインのチェッカースワイプ対策（未公開）

emulator-5554の既存191/242検証版を署名照合してinstall-r成功。APK/MPP絶対パス、SHA-256、鍵、packageと検証範囲は[checker-swipe-tablet-20261023.md](checker-swipe-tablet-20261023.md)に記録。実機への導入は行っていない。

## 2026-10-23 タブ追加先・GIF・NG軽量化・チェッカー高さ（未公開）

emulator-5554へ既存署名を照合して更新。各版のpackage、APK/MPP絶対パスの共通ルートとSHA-256、署名鍵、導入結果は[pane-gif-checker-ng-20261023.md](pane-gif-checker-ng-20261023.md)の導入記録を参照。最新は191=gif-ng-pane191.apk、226=pane-choice226.apk、242=checker-dialog-final242.apk。実機への導入・Release更新は行っていない。

## 2026-10-23 プレ公開前：メニュー分離・NG編集説明

- Serial `emulator-5554`、191/242を既存証明書照合後にinstall-r Success、データ保持。191 `Haiagaru 検証 191` / `0.8.10.191 dev` / package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。242 `Haiagaru 検証 242` / `0.8.10.242 dev` / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。
- 191 APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/menu-ng-final191.apk`、SHA256 `7EE9B42661040595A48B389308BC2B97E100DE43FA6954681A30F87AD91317D9`。
- 242 APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/menu-ng-final242.apk`、SHA256 `EF5FC72F3BB321B45C6DDF96A0AE82CB06CAFC16F8740CE329A02DEDAA0F47EB`。
- ローカルMPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.10.mpp`、SHA256 `F44248142B8678E343A1EA08DC3352E584FB56A04DD5249D4EDE4109A3CFF735`。公開dev.10とは異なる未公開候補。
- 署名証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- 通常Lint込み最終build成功（2分22秒）。191のname hookは別入口へ変更し、`VerifyLegacyWacchoiMenuSplit`で元register数、native popup register、owner/menu/選択レス引数が不変であることを確認。242nativeタブfactoryと191人気hookも静的検査成功。
- 191/242それぞれ設定スイッチ/旧結合値の分離32項目、実Menu生成16項目成功。旧name ON/visibility=1でも本文側native非表示を維持、name/bodyの逆ONOFF、上/下4桁/上4桁NG、追加ツールも検査。設定はfinallyで復元。従来の`frida-response-menu-off-smoke.js`は旧結合仕様の履歴テストで、今回の仕様は`frida-response-menu-separate-smoke.js`と`frida-wacchoi-menu-isolation.js`で検査。
- 242の未保存NGテンプレートを360dp幅で開き、説明段落が短い「判定式」labelから分離していることをモデル・UI XML・画像`build/ng-editor242.png`で確認。説明はdialog内横幅に折り返され、入力枠と重ならない。保存せずdismiss。新規ルールを永続化していない。
- 191はUIの板一覧→5ch→家電製品→Android→Part3から実本文を表示・scrollし、画像サムネイルから`ImagesViewer2Activity`で167KB/820×1800画像の表示を視認、戻る成功。最初のURL文字列タップはChromeのImgurページへ開いたため内部viewer成功扱いにせず、Chromeを閉じてサムネイルから再確認した。242実本文はNG画面の背後でも確認。画像の242重複操作・226共通UI/ルーティング重複適用はユーザー許可に基づき省略。226のname builderには別helperを適用、nativehookは変更していない。
- 最終crash時刻は既存03:12 UTCから増加なし、lastanrは起動後記録なし。初回Frida接続の1回はinstall完了と起動の競合でpid空、再起動後に再接続して成功。新たなクラッシュとして扱っていない。
- 長時間・全自作テーマ・実認証や投稿/MEGA操作は未確認。公開前候補の先行タブ/人気/NG軽量化/アイコン/調整設定も保持。公開は既存Semantic Release CIのみ使用。

## 2026-10-23 フローティングフィルターのアイコン画像（未公開）

- Serial `emulator-5554`、表示名 `Haiagaru 検証 242`、ChMate `0.8.10.242 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。既存証明書一致後、`InstallVerifiedApk.ps1` でinstall-r Success、データ保持。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/floating-filter-icon242.apk`、SHA256 `5A22A5241D3F5DF7B98C7973E73A394B5FD6CFBD809C45D16BAA189CD27676A0`。
- ローカルMPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.10.mpp`、SHA256 `E08AAF8472DA84280644E2BCA2E9FAF316F2D0E67FDB0E48CFDD967F6A2B53F6`。公開dev.10とは別候補。
- 署名証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- Android build通常Lint込み成功（2分40秒）。`FloatingFilterIconAndroidTest`で12項目成功（新slot7、専用設定名、標準glyph、長押し説明、実mounted buttonへの合成画像import即時反映、色/縦横比、label/余白、通常filter画像不変、reset即時反映、detach cleanup）。既存FloatingFilterAndroidTestも9項目成功しtap/long-drag/位置保存復元/ONOFFを維持。ログ `build/floating-filter-icon242-test.log`。
- テストは新slotに既存ファイルがないことを確認してから小さな合成PNGのみ生成し、最後に検証用画像を削除・設定を復元。個人画像・既存アイコンは上書きしていない。通常の画像pickerの実手動操作は未実施。
- 191/226は共通Java変更・nativehook未変更のため重複適用/導入/端末操作を省略し、従来候補を維持。先行NG未読/人気popup/親OFFタブ/見出し変更も候補に保持。未公開。

## 2026-10-23 14:55 JST 親設定OFF時の通常ビューア経路（未公開）

- ユーザー確認により、手動追加だけでなく長押し等の通常入口も親スイッチOFF時に専用ビューアをスレと同じタブ列へ開く。個別画面OFFとHaiagaru設定の親スイッチは維持。
- Serial `emulator-5554`、ChMate `0.8.10.242 dev`、表示名 `Haiagaru 検証 242`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。既存署名一致後に `InstallVerifiedApk.ps1` でinstall-r、Success。データ消去なし。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/viewer-tabs-master-off242.apk`、SHA256 `F699015E563B9CC5AAC2D593620CDBDDAFB6B39A8A70C6ED5CABFD271D784C98`。
- ローカルMPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.10.mpp`、SHA256 `24E2E7FC4791B23C37DB364F9E2AEE56C8ADD2D8AB751662A82A9D48B2D5921D`。公開dev.10とは別候補。
- 署名証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- 通常Lint込みAndroid build成功（2分38秒）。nativefactory元命令/レジスター/分岐/Fragment rebasing検査成功。`frida-longpress-tab-entry-smoke.js`を親OFFのままで走らせ、上下4桁/全文/IDの4入口、検索語/板引継ぎ、実タブ表示、×の透明背景/重なりなし/実クリック終了、個別OFFの別画面経路、親OFFの別設定画面、設定復元を検査。ログ `build/viewer-tabs-master-off242-test.log`。
- 変更は共通Javaのルーティング条件と設定説明のみ。191/226の重複適用/導入/端末操作はユーザー許可に従い省略し、両版は直前候補を維持。未公開・版名更新なし。

## 2026-10-23 手動タブ・人気レスポップアップ分離 最終候補（未公開）

- Serial `emulator-5554`、191/242とも既存証明書一致を確認して `InstallVerifiedApk.ps1` のinstall-rでSuccess。設定/データ消去なし。
- 191 `Haiagaru 検証 191` / `0.8.10.191 dev` / `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/manual-popular-final191.apk`、SHA256 `D6B0670AC8EB7D31E99657A5967116FAF4E7993C31F048D01A15A1B0ED363386`。
- 242 `Haiagaru 検証 242` / `0.8.10.242 dev` / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/manual-popular-final242.apk`、SHA256 `AA27F1694B1780F58CCB90781B4AF8BA80749062D2112B9D69334DD4208CC5DB`。
- 最終MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.10.mpp`、SHA256 `E8D7E229A850EBE6D5F7A57E85F0C1585730E7F5896A333ADF31F5648509EB38`。公開dev.10とは異なる候補。
- 署名証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- 先行242経路試験では同じpackage/証明書へ `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/manual-popular242.apk`（SHA256 `BCA9C4079E789C2095E978DCC6A2698DF9A2ED0227FE01750AD18C0C2E71B426`）をデータ保持導入。先行MPP SHA256 `5D60E2FAE27ED85CDB286A7A3F2A78784322EBFAF0E7CD8327C0FEE8767E01A2`。上記最終版で置換済み。先行191 APKは生成だけで導入していない。
- 最終191/242 nativehook静的検査成功、人気レス回帰30/29項目。242の実スレcapture再現161→161、native標準161/直接2と本文2一致、手動設定経路9項目成功。詳細 `manual-tabs-popular-popup-20261023.md`。226の共通重複操作は省略、未公開。

## 2026-10-23 14:24 JST NG未読・開閉時再計算候補（未公開）

- `emulator-5554`、既存191/242検証パッケージを証明書照合後install-rし、両方Success。データ消去なし。
- 191表示名 `Haiagaru 検証 191`、ChMate `0.8.10.191 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/unread-rebuild191.apk`、SHA256 `81EE2E10F9979574151F533B2DF85D28E051265CEB2B0A760F064F67B3891491`。
- 242表示名 `Haiagaru 検証 242`、ChMate `0.8.10.242 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/unread-rebuild242.apk`、SHA256 `E13FF4191CD6BB2F8111C368DB1727C987774D0B8A8CC437E0A9AD963A905168`。
- 共通ローカルMPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.10.mpp`、SHA256 `94660408F13C392433489CF48A48C1FAD86D38A09B19091B83DD3F28463DBF21`。公開dev.10とは別物。先行未コミットのビューア調整/タブ見出し設定も保持した候補。
- 署名証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- native hook検査191/242=4/8箇所、合成再計算各8、native未読各7、未読値191/242=10/15項目成功。テスト用設定・合成membershipを復元。226の重複導入/操作は共通Java変更のため省略、従来候補のまま。詳細 `hidden-ng-unread-rebuild-20261023.md`。実開閉の体感ラグの完全解消は未確認、公開なし。

## 2026-10-23 専用タブ見出し高さ・調整ボタン候補（未公開）

- 対象 `emulator-5554`、ChMate 242、表示名 `Haiagaru 検証 242`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。既存証明書一致後に `InstallVerifiedApk.ps1` で `install -r` Success。データ保持。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/tool-header242.apk`、SHA256 `2F343F166CDAC94B7D8AA5F9ADD3BC5F7EB35B9490DBD7D2499C526C2BAE26C4`。
- ローカルMPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.10.mpp`、SHA256 `518E3393818AC2CB8FC0DA952D9115524E0EDE5DE23F289928BD703A3B2B5DFD`。公開済みdev.10のMPPとは異なる未公開候補。
- 署名証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- 通常Lint込みAndroidビルド成功。242 native factory元命令・レジスター・分岐・Fragment rebasing検査成功。Frida `frida-tool-header-settings.js` は24項目成功。調整ボタン初期値/ON/OFF/resume、共有値検証、実タブの32/48/64dp即時変更、背景本体色一致、重なりなし、透明×と実クリック終了、設定復元を確認。
- 初回テストは最適化済みテーマ関数のFrida置換が反映されないfixture、およびConsumer登録にdefault method実装が必要なfixtureで中断。テーマ置換をやめ実テーマ比較へ、未使用callbackをnullへ変更後に全項目成功。透過/全自作テーマの実画面検証は未実施。共通実装の191/226重複導入は省略、両版は従来候補のまま。公開なし。

## 2026-10-23 公開配布物1.12.0-dev.10

- 公開URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.10 。CI39900790356 success、生成commit272945d、draft=false／prerelease=true、公開日時2026-10-23T04:35:28Z。
- 公開MPP `build/release-dev10-verify/patches-1.12.0-dev.10.mpp`、SHA256 `72172D57A1EE7C1722E26002175049DFE237B14B199B0D51F8D64D4ED7EC097E`。6配布物のGitHub digest一致、Android classes.dex確認。
- devのメタデータ2本はcreated_at `2026-10-23T04:32:50`（タイムゾーンなし）。初回rawの古いdev.9 CDNキャッシュは時間経過後にdev.10へ切り替わった。MorpheはプレONのまま既存ソースを更新し、main/devメタデータの実GETとdev.10カード／詳細表示を確認。安定版は1.11.2のまま。
- この公開CI版MPPそのものによるAPK再生成・端末更新は未実施。エミュレータの191／242は下記NoCopySpan保護込みローカル候補、226は共通処理の重複検証省略で下記未読NG候補を保持。公開版とローカル候補のMPPハッシュを混同しない。

## 2026-10-23 安価が多い本文の装飾候補・NoCopySpan保護

- Serial `emulator-5554`。191／242を証明書一致確認後に`install -r`更新しSuccess。データ消去なし。226は直前の未読NG軽量化候補を維持し、今回の共通Java変更の重複端末試験は省略。
- 最終MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.9.mpp`、SHA256 `5BD55CCCC56D65362882337C20570ECF5B8390FE27306BB3B17A1F7360356AF0`。未公開候補であり、停止CIのdev.9配布物ではない。
- APKディレクトリ `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/`。
- 191: `dense-anchor-safe191.apk`、SHA256 `B098FAB3E3E607B6046901F65FBB1C743B6625AFD5F1C3BBDA7180A8D1F65DDF`、package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`、表示名`Haiagaru 検証 191`、ChMate `0.8.10.191 dev`。
- 242: `dense-anchor-safe242.apk`、SHA256 `273547F1AE85BD295DA76DB463EBA5598091AE7F78CCFEE51B0948A7006A980A`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名`Haiagaru 検証 242`、ChMate `0.8.10.242 dev`。
- 中間候補MPP59600D47...からも同パッケージへ導入した（NoCopySpan保護前）。`dense-anchor191.apk` SHA256 `F8ADB42AFDC333CD91C792A4DCA6169B2D1D67C759BCB5351E41A5367AF999BF`、`dense-anchor242.apk` SHA256 `8AEEFEAFA302758BC8724C1E23EB36D73388A8FA2A359CEA5E649D3033D64877`。最終版へ更新済み。
- 全署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 191／242各16の本文・span保持試験、強調ルール63項目、nativeフックの検査、242実安価ポップアップ表示を確認。詳細dense-anchor-render-20261023.md。

## 2026-10-23 未読NG軽量化・設定上部余白の最終候補

- Serial `emulator-5554`。署名照合後に191／226／242すべてを`install -r`更新しSuccess。既存データを保持。
- 共通MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.8.mpp`、SHA256 `3702459BA8D96AC4C747B02C87EA86FC5B1A80542D80A7C3CF912D011CBB0AA1`。下記の人気レス候補も含む、公開dev.8とは別のローカル候補。
- APKディレクトリ: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/`。
- 191: `unread-home191.apk`、SHA256 `C7B7AE17B4FD671C879F4FD4EC5A265411266302A9BF8F615E2E84CBAC4FB77A`、package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`、表示名`Haiagaru 検証 191`、ChMate `0.8.10.191 dev`。
- 226: `unread-home226.apk`、SHA256 `9BDD639638C3A87D541863BF3717383641C898830416C9E4113B33C929626AE4`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix226`、表示名`Haiagaru 検証 226`、ChMate `0.8.10.226 dev`。
- 242: `unread-home242.apk`、SHA256 `D3401DE20D104FDC1A7432D9248D97C1AE1C25D4EC9D62825398FAAA7ADCC9FA`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名`Haiagaru 検証 242`、ChMate `0.8.10.242 dev`。
- 共通署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 各installログは`build/unread-home<版>-install.log`。性能確認と制限はhidden-ng-unread-perf-20261023.md。

## 2026-10-23 人気レス断続欠落・タブ入口等の候補（未公開）

- Serial `emulator-5554`。既存の191／226／242検証パッケージを証明書一致の確認後に`install -r`更新し、全件Success。アンインストール・データ消去なし。
- MPP絶対パス `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.8.mpp`、SHA256 `4ED3294444E82FCFD1D954AB4949775A7E97C0BCC4F85E911177ADE2930B0437`。公開dev.8とは異なるローカル候補。
- 全APKのディレクトリは `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/`。
- 191: `popular-intermittent191.apk`、SHA256 `90F44929E543EDD87918AEEE5A674E14FB51EA34475DAB2690590B3ECB5314E8`、package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`、表示名`Haiagaru 検証 191`、ChMate `0.8.10.191 dev`。
- 226: `popular-intermittent226.apk`、SHA256 `0E499BD578C089EDECCB3B72A007D6F506A8AA819D366813918D20F454483E42`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix226`、表示名`Haiagaru 検証 226`、ChMate `0.8.10.226 dev`。
- 242: `popular-intermittent242.apk`、SHA256 `77ADA0536827363BCC70BACC7044AF3B1F03B4342387429049D3E5C46A0C6628`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名`Haiagaru 検証 242`、ChMate `0.8.10.242 dev`。
- 署名鍵は `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。全APK証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 直前のタブ／HTTPS／メニューOFF候補MPP `B489445C3865F606A93B67A1B5F3B92A52DEB01BEFF6B155602C4C4BC37EA111`も同パッケージへ導入済みだった。今回候補はそのソースを保持し人気レスを追加修正して更新。検証結果はpopular-stale-layout-20261023.mdと各buildログを参照。

## 2026-10-23 プレリリース配布物1.12.0-dev.8

- URL https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.8 。CI run39885815088成功、draft=false/prerelease=true。公開日時2026-10-23 10:50 JST。
- 公開MPP `patches-1.12.0-dev.8.mpp` SHA256 `9CB9610C1F8E442C31F2CF539CBDFF527D74F51887E4EAAEDCABB47E62E1069E`。`build/release-dev8-verify`へ配布物6点をダウンロードして全件digest一致、MPP内classes.dex確認。
- devのJSON2本は1.12.0-dev.8、created_at `2026-10-23T01:47:18`（タイムゾーンなし）。emulator-5554のMorpheソースでプレリリースONのまま更新し、fresh logcatでmain/devのメタデータ取得、ソース画面と詳細の1.12.0-dev.8表示を確認。登録先は変更していない。正式版1.11.2は維持。
- 端末の検証アプリは下記のローカル候補MPP適用版。今回CI公開MPPからのAPK再生成・端末更新は未実施。

## 2026-10-23 全差分候補・フィルター件数初期オフ

- Serial `emulator-5554`。191は既存composefix191との署名不一致を検出して更新を中止し、未導入のsettingsfix191へ別アプリとして追加。226／242は既存署名一致を検証して更新。その後、件数初期オフ・×背景フォールバックを含む以下の最終APKへ全3パッケージを`install -r`更新。既存アプリの削除・データ消去なし。
- 共通MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.7.mpp`、SHA256 `1734F184CE885639C09DB8B41010C3AF8DA011488FDCDB4A375095BA023E3C6F`。公開dev.7と異なる未公開のローカル候補。
- 191: `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`、表示名`Haiagaru 検証 191`、versionName `0.8.10.191 dev`。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/final-default-191.apk`、SHA256 `343A925E2912B4F51152FD743342D004FF80046BC7A57B61661785C0CB18306D`。
- 226: `jp.co.airfront.android.a2chMate.haiagaru.resumefix226`、表示名`Haiagaru 検証 226`、versionName `0.8.10.226 dev`。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/final-default-226.apk`、SHA256 `F22227F95A76B66F7365468750A2C4099CDA382FEBA3BF689E9797186AA05F29`。
- 242: `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名`Haiagaru 検証 242`、versionName `0.8.10.242 dev`。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/final-default-242.apk`、SHA256 `CC945A51F36BFB293E81F7C6F76D7F65535EE97CC5DEC2050301FD78A368C8C4`。
- 全APK versionCode `2100000000`、署名鍵`C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 最終APKの7色native bridge検査は全3版成功。人気レス合成native行検査は191／226各21項目、242は20項目成功。242の実Part3で標準149件と追加集計149件が一致、直接返信・ポップアップOFFで2レスを表示。基準ログと最終crash bufferに新規クラッシュなし、lastanrは起動後記録なし。途中のスクリーンショットにSystem UIの待機ダイアログがあり、アプリANRと同一とは扱わない。長時間再発、画像・各変更画面の通し操作は未完了。未公開。

## 2026-10-23 必死チェッカー見出し候補191を実機更新

- 対象serial: `730eae72`（XIG05）。既存の`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`（「Haiagaru191 設定検証」）を更新。アンインストール・データ消去なし。
- APK: `build/hissi-header191-final.apk`、SHA-256 `111112A34A7DED35138B4A24287FC20C0CDBA22F9193A1B17A57374B9904332E`。端末から取得した`base.apk`とSHA-256一致。
- MPP: `patches/build/libs/patches-1.12.0-dev.7.mpp`、SHA-256 `B76A6D95A5699AA0DA843828B8DDCD3F3D709A764042A52D588F750C03E1DD1C`。元APKは`C:/Users/narum/Downloads/chamate/chmate191/chmate-0-8-10-191-dev.apk`。
- 署名証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。導入後versionName `0.8.10.191 dev`、lastUpdateTime `2026-10-23 01:00:19`。アプリ内での操作確認は未実施。

## 2026-10-22 実機XIG05へツールバー画像／必死チェッカー調整版191を追加

- 対象シリアル: `730eae72`（XIG05）。対象ChMateは`0.8.10.191 dev`。
- 既存の実機パッケージはそのまま残し、検証用の別パッケージ`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`（表示名「Haiagaru191 設定検証」）を新規追加した。インストール前に当該パッケージが未導入であることを確認。アンインストール・データ消去・既存アプリ更新なし。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/toolbar-hissi191-device.apk`、SHA-256 `B0D660CE6533EB15467248443125B6E9F80592D84A0524C6613DE38AD397F620`。実機からpullした`base.apk`も同じSHA-256。
- 使用MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.7.mpp`、SHA-256 `553B5A5A651C0681313B452466CF65771800F43DE060085A86331D56788D67DC`。元APK: `C:/Users/narum/Downloads/chamate/chmate191/chmate-0-8-10-191-dev.apk`。
- 署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`（BKS）、alias `Morphe`。署名証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- `adb -s 730eae72 install -r`成功、versionName確認、HomeActivity起動を確認。確認時の直近AndroidRuntimeログにクラッシュ記録なし。画面内での設定・画像変更操作は未確認。

### 同端末パッケージをビューア調整追加版へ更新

- 2026-10-22、serial `730eae72`で上記と同じ`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`を署名証明書照合後に`adb install -r`で更新。既存設定・データを保持。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/toolbar-hissi191-viewer-settings.apk`、SHA-256 `305EC623AFB2636F70CD8E1E40C1EB5F227B9FDE98F12AB51E57BA1BABA799E3`。実機からpullしたAPKも同じSHA-256。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.7.mpp`、SHA-256 `B874558A2BFD0F15F43CD3B30464D1717FC51AE17069F4CFB8BE6EB9244C20C1`。証明書は上記と同じ`0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 更新成功、versionName `0.8.10.191 dev`、lastUpdateTime `2026-10-22 23:42:18`。起動後は既存のHissiMenuActivityが前面。確認時点の直近AndroidRuntimeエラー出力はなし。ビューアの「調整」操作自体は実画面で未確認。

## 2026-10-22 プレリリース配布物1.12.0-dev.7

- GitHub Release: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.12.0-dev.7 （`draft=false`、`prerelease=true`）。既存Semantic Release CI run `39789862059` success。
- CI配布MPP `patches-1.12.0-dev.7.mpp` SHA-256 `B5621615BDFA427864B23FDD0D63C3EE674E9F3EBA9E6188BD8B3D72D833CE52`。配布資産を取得してGitHub digestと照合。
- 更新feed `patches-bundle-pre.json`はversion `1.12.0-dev.7`、`created_at`は`2026-10-22T13:48:11`（末尾`Z`なし）。

## 2026-10-22 フィルター共存・未読NG集計軽量化 最終候補

- 対象serial: `emulator-5554`。191／226／242それぞれ未加工APKにMPPを適用し、各既存の検証用パッケージへ`adb install -r`で更新。標準パッケージの置換・アンインストール・データ消去なし。
- 使用MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.6.mpp`、適用時SHA-256 `2A71F4673F0F0B5EDB7EB836EB36323E21480122DF9EECE59F3FEB7A2BE85BA1`。
- 署名証明書SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は記録しない。

| ChMate／表示名 | パッケージ | APK絶対パス／SHA-256 | 結果 |
| --- | --- | --- | --- |
| 191 dev／Haiagaru191 設定検証 | `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` | `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/prerelease-final191.apk`／`B04A0F9362768F33019451EF81B882FB4621CB40EE68E3A8C6477684776038CB` | install-r・起動・未読テスト15項目成功 |
| 226 dev／Haiagaru 復帰修正 226 | `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` | `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/prerelease-final226.apk`／`C339135E86721FDAE90CAF14B5543CB307BD1CA7358AD38A5038D0DA7FCA2020` | install-r・起動・未読テスト15項目成功 |
| 242 dev／Haiagaru 復帰修正 242 | `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` | `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/prerelease-final242.apk`／`C915A253A6A57783C04032B79150CE2B3C51D6B788A64862F0EC4DF838B1F938` | install-r・起動・未読テスト15項目成功 |

- 全版の未読件数計算テスト10項目と合成ネイティブ行ON／OFFテスト5項目は合格。242では既存の取得済みスレ一覧表示も確認。画面上で上・下フィルター共存を切り替える操作、必死チェッカー設定を実際に開く操作、開閉時間計測は未完了。
- 226のFrida合成ネイティブ行テストではPASS後にSIGSEGVが1回記録された（2026-10-22 13:38:21 UTC）。その後の通常起動では画面が開いた。Instrumentation終了後の単発事象で原因を特定できず、このテストをクラッシュなしの根拠には含めない。公開後もクラッシュ報告を注意して確認する。
- これはプレリリース用の候補確認であり、実機試験は未実施。

## 2026-10-22 履歴DAT落ち非表示・人気レス件数修正版（未公開）

- 対象端末: `emulator-5554`。191／226／242の既存検証パッケージに`adb install -r`で導入。アンインストール・データ消去なし。端末上の`base.apk`をSHA-256照合し、生成APKと一致することを確認。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.6.mpp`、SHA-256 `FDD3CF4AD969A6B9BBB99F9DEBADEE0323A59F9C768ECD792E917E9C4B000E2C`。
- 署名証明書SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵は`C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は記録しない。

| ChMate | パッケージ | APK・SHA-256 | 端末導入確認 |
| --- | --- | --- | --- |
| 191 dev | `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` | `build/dat-popular-fix191.apk` — `A0D0062223C6F47AE4D14A31D24EF89BA7113345D7410F9A7101A297197E6C70` | `0.8.10.191 dev`。導入済みAPKと一致 |
| 226 dev | `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` | `build/dat-popular-fix226.apk` — `9484DDED1ECD1CA57689A684F121074CE81EFBBABA0B98AEA8D29E2D3343A19B` | `0.8.10.226 dev`。導入済みAPKと一致 |
| 242 dev | `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` | `build/dat-popular-fix242.apk` — `EF8FBA9D48D0490B416E8ADF59846B934419E144FCCB28CBE2CCB72A6F389EB9` | `0.8.10.242 dev`。導入済みAPKと一致 |
| 242 dev・実スレ人気レス比較用 | `jp.co.airfront.android.a2chMate.haiagaru.popularfix242` | `build/dat-popular-fix-popular242.apk` — `046DF92149E96F0DB19BDD2DEBC0A2AF1A4A85BDA55FDB5DD28B132D9AAF1821` | `0.8.10.242 dev`。導入済みAPKと一致 |

- DAT履歴テストは各版11項目、人気レステストは191／226各19項目・242 18項目合格。191／226の履歴mode `100`と242の履歴mode `103`を個別確認し、242のmode `100`を誤って履歴扱いしないことも確認した。
- 242の保存済み実スレ（361レス）で標準方式126件（native標準件数と一致）、直接返信方式1件。直接返信判定とポップアップ表示のON/OFF全4組合せで件数表示が「—」または負数にならないことを確認。ユーザーが以前示した「103件」の再現データは今回の端末スレでは確認しておらず、126件を103件として扱わない。
- 初回Frida履歴試験では検証ハーネスの反射呼び出し中にSIGSEGVを一度記録。該当呼び出しをスタブ化した再試験は3版とも合格し、その後の通常起動・人気レス確認で新たなクラッシュはなし。この初回記録は削除していない。
- これはローカル未公開候補。プレリリース／正式リリース、版名更新、実機導入は行っていない。

## 2026-10-22 dev.5同期後の人気レス再確認（未公開候補）

- 対象serial `emulator-5554`。既存の242検証パッケージ `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名「Haiagaru 復帰修正 242」、ChMate `0.8.10.242 dev`。端末のinstalled `base.apk`をpullし、候補APKとSHA-256一致を確認（再インストール・データ消去なし）。`lastUpdateTime` は端末記録 `2026-10-22 09:57:42 UTC`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.5.mpp` SHA-256 `70FA88D38054CC7CEEC8BCBDFEEBEAD2795DF22F35D66B2CAF7A337C25E26FA9`。
- 候補／installed APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/popular-refresh-dev5-242.apk` SHA-256 `56A6E1617ACF050AB14D5C9D3FE0383AAD7992A1DB01858AB3F3D96EDECF32E8`。候補署名証明書 SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- スレ「【緊急】PSP死亡　国が警告 ★8」の実データで、直接返信判定OFF=295、ON=25。ポップアップ表示ON/OFFで件数は変わらず、4組合せすべて`failure=null`かつ非負。「—」は再現しなかった。設定は試験後に復元。
- 「自分」フィルターのPart3実レス試験は、取得済みデータを持つ別の既存242検証パッケージ `jp.co.airfront.android.a2chMate.haiagaru.popularfix242` で実施した。自分件数1、レス353のみを抽出し、解除後は369行へ復帰。dev.5候補の`resumefix242`にはPart3の取得済みデータがなかったため、その候補上でのPart3自分フィルター再確認ではない。
- どちらもエミュレータのみ。版名更新・公開・実機変更なし。

## 2026-10-22 人気レス／DAT更新確認（未公開）

- 対象 `emulator-5554`。既存の別パッケージを同じ署名で`adb install -r`更新（アンインストール・データ消去なし）。
- 共通MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.0-dev.1.mpp`、SHA-256 `62214E1C0C7AD2731433FF7C2B11D6AD0F9F562BE4C6264E07C9051537A3640E`。
- 191: 表示名「Haiagaru 人気レス検証 191」、ChMate `0.8.10.191 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.popularfix191`。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/popular-refresh/haiagaru191.apk`、SHA-256 `0547B283BD3266255AF1F40B864E8B115BBE734C97C5C7379E787545A95AF0E4`。元APKへの適用・署名成功、install-r成功、HomeActivity起動。
- 226: 表示名「Haiagaru 人気レス検証 226」、ChMate `0.8.10.226 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.popularfix226`。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/popular-refresh/haiagaru226.apk`、SHA-256 `BE25ABECD3A157DD6F6D954CFE199113F7AB650E8A9F14A803935F2D24012F51`。元APKへの適用・署名成功、install-r成功、初回画面起動。スレ表示／更新操作は未確認。
- 242: 表示名「Haiagaru 人気レス検証 242」、ChMate `0.8.10.242 dev`、package `jp.co.airfront.android.a2chMate.haiagaru.popularfix242`。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/popular-refresh/haiagaru242.apk`、SHA-256 `4B03BEB9E8056D7FB77763E24DC6541272F0182DB3558B1629047E30AD13779E`。元APKへの適用・署名成功、install-r成功、Part3の取得済みスレを表示。人気レス4モード、非負カウント、自分1件をFridaで確認。更新操作は正常な「更新なし」だったが、新着ありの再現ではない。
- 3 APKの署名証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`（BKS）、alias `Morphe`。パスワードは記録しない。

## 2026-10-22 hissi.org文字コード修正（未公開）

- 対象serial `emulator-5554`。既存191パッケージの証明書を照合し `install -r` 成功。実機・他版への導入なし。
- 191／ChMate0.8.10.191 dev「Haiagaru191 設定検証」／`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。端末導入時刻 2026-10-22 14:43:33 JST。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/hissi-encoding-normalized.mpp` SHA256 `30C33D19A8CAB190EEE11A70EFA54EEC4B596476EC2104063825B6571857E596`。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/hissi-encoding-normalized191.apk` SHA256 `17A8017A711C5BA77F28365DD9A19FFBECA201609AAD92806E813ED364D23B5B`。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- hissi.orgの実レスポンスとWebView日本語DOM、DAT落ち履歴の実adapter／Edge合成回帰を検証。詳細 `docs/history-dat-hissi-encoding-20261022.md`。

## 2026-10-22 人気レス方式分離（未公開）

- 対象は全て `emulator-5554`、既存署名を照合してinstall -r成功。データ消去・アンインストール・実機変更なし。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- 以下のファイルは全て `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/` 配下（表のファイル名をこの絶対パスへ結合）。
- 191: ChMate0.8.10.191 dev「Haiagaru191 設定検証」、`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。226: ChMate0.8.10.226 dev「Haiagaru 復帰修正 226」、`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`。242: ChMate0.8.10.242 dev「Haiagaru 復帰修正 242」、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。

| 使用MPPとSHA256 | APKとSHA256 | 導入日時・結果 |
| --- | --- | --- |
| popularity-modes.mpp `2E3C86CE2890F2F438AF993E0C0A70288DC1E96797228435EA45BE470687552C` | popularity-modes191.apk `252688CF83F5D8878BE307B660279BB05BD45D08A30E673B42335E983F1D414E` | 10/22 初期候補、更新成功、後続へ置換 |
| 同上 | popularity-modes226.apk `D6ECEF88CB036A412F41E1A4AAA25548905C70E27CE12FFEA89C88A9054E91ED` | 10/22 初期候補、更新成功、後続へ置換 |
| 同上 | popularity-modes242.apk `8165E276CA7AEA197F55259EC90416578F76A9162F3CEE4306CC643B845CB0BD` | 10/22 初期候補、更新成功、後続へ置換 |
| popularity-modes-final.mpp `0E7516E46ECE46C067C4A1CF7141E6CEB5E13F531964E0643425637552A5BE4A` | popularity-modes-final191.apk `00B9B99F7C748D6FA3812905D384B76412AD5B8D107774A98986562E94CBA12E` | 10/22 14:00:27 JST、更新成功、合成16項目成功 |
| 同上 | popularity-modes-final226.apk `D673786A4FB7C94987085895E47DAEE263C98B53AC575A38065E7E7A6013E022` | 10/22 14:01:57 JST、更新成功、合成16項目成功 |
| 同上 | popularity-modes-final242.apk `B6B54BAC169049F3B7411378AC116155D7B91CCE1D72E8E49D53A0EB0C4269B5` | 10/22 13:47:28 JST、更新成功、後続へ置換 |
| popularity-modes-verified.mpp `38DF040DBE7FCE744DD6EC8601C8192AAAED06B64761A1AD33AD553143BE1138` | popularity-modes-verified242.apk `30D276C5E76639309F99CC015DDD6B610235A976ECB738E01CD3613FB1D5E253` | 10/22 14:05:40 JST、更新成功、後続へ置換 |
| popularity-display-mode.mpp `B6FAE9F87F56AF8479368C24FFDB6C0FCDA7E608253DF542DC158D7AE2348722` | popularity-display-mode242.apk `013B3927C2464C100EE62DAFB1B3A7885AEFDD22BE0B050DDFC57199AAEC56DE` | 10/22 14:16:39 JST（端末lastUpdateTime 05:16:39 UTC）、更新成功、合成17項目／native hook／実スレ比較成功 |

- 旧候補は242の表示方式取り違えのため配布不可。最後の242固有修正に対する191/226の再導入は行っていない。詳細 `docs/popular-reply-modes.md`。

## 2026-10-22 履歴DAT・GIF操作・任意フローティングフィルター（未公開）

- 対象serialはすべて `emulator-5554`。InstallVerifiedApk.ps1で既存パッケージと証明書を照合して `install -r` 成功。アンインストール・データ消去・実機更新なし。
- 最終MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/floating-filter-controls-final.mpp` SHA256 `2FC10BC780FC8B8889E7A1B01558B4734AD7BCF75CBAF772B37CA8ED74DEE123`。
- 242／ChMate0.8.10.242 dev「Haiagaru 復帰修正 242」／`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。2026-10-22 12:21 JST、最終APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/floating-filter-controls-final242.apk` SHA256 `5D75BD66FF761FB999F49A7E6DFB4DE486124148A8CF090D1E19AD4AB1343151`。履歴5項目、任意フローティングの9項目成功。GIF最終試験はdocs/history-gif-controls-20261022.mdへ記録。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- フローティング追加前の履歴／GIF候補MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/history-gif-controls.mpp` SHA256 `0B6FC98FDEE4DED9C3C57DCEFD298B4EC9640FC81BF3E345A86F19DE500098BC`。以下3版へ同署名更新、native履歴の回帰各5項目成功。これらの191／226には今回のフローティング追加はまだ導入していない。
  - 191「Haiagaru191 設定検証」／`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`／11:44 JST。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/history-gif-controls191.apk` SHA256 `D26FE0EBC09B5D645340684124DEAF340A5661F3B6747C94A277AB33132F8C0C`。
  - 226「Haiagaru 復帰修正 226」／`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`／12:09 JST。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/history-gif-controls226.apk` SHA256 `6A9727044965EE100572C07DDCF9CBBD69E2B9B6F386620831F5134AA7B2110A`。
  - 242「Haiagaru 復帰修正 242」／同resumefix242／11:46 JST。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/history-gif-controls242.apk` SHA256 `DDCCDC02DAA4FC7022A4CEA5AEB6DD080D9B5A12A4D18DA1317B62477F9DC954`。上記最終候補へ置換済み。
- 中間フローティング候補MPP `build/floating-filter-controls.mpp` SHA256 `AC88186DDAEFC16FCE51F299BF57D1E027E04AA747832362870A03410156BB9C`、APK `build/floating-filter-controls242.apk` SHA256 `82927FAFBEC2C9FBB01534B9F1019E10D1C2EF95E47A77D882B92AAC854BE19B` も同serial／同resumefix242へ導入後、最終候補へ置換。上記と同じcanonical絶対パスのbuild配下。JS製の擬似ownerのコールバック試験失敗は成功扱いにせず、通常Java製のOwnerと実MotionEventで9項目を再検証。

## 2026-10-22 閲覧UA・右下ボタン・VPN説明 最終候補

- serial `emulator-5554`。全3版とも既存パッケージへInstallVerifiedApk.ps1で署名照合install -r成功。データ消去・実機への導入なし。
- 共通MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/viewing-user-agent-verified.mpp` SHA256 `BD93052B2CC01C3DF2DB0FE5D628A5EF8124D7CB3815FDC5ABF57F61B2BF06DC`。
- 191／ChMate0.8.10.191 dev「Haiagaru191 設定検証」／`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。2026-10-22 11:27:38 JST、APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/viewing-user-agent-verified191.apk` SHA256 `64E978A30C998D24B1B9717679508D162E9BBD59291CCA7D615C8EA173ADF8BC`。
- 226／ChMate0.8.10.226 dev「Haiagaru 復帰修正 226」／`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`。2026-10-22 11:24:06 JST、APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/viewing-user-agent-verified226.apk` SHA256 `004C09365A2420C7D31242182D026F5777884EB056AE0206AA1C600B403AD484`。
- 242／ChMate0.8.10.242 dev「Haiagaru 復帰修正 242」／`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。2026-10-22 11:26:04 JST、APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/viewing-user-agent-verified242.apk` SHA256 `39084A94A9B418624E6EABD2DD34468A0769C99EF8CC28F23960906ACD1FD74F`。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- ログbuild/viewing-user-agent-verified{191,226,242}-install.txt、同-runtime.txt。各11項目成功、命令保持検査成功、設定復元済み。実送信・投稿なし。191での説明表示画像build/haiagaru-vpn-help-final.png。詳細docs/viewing-ua-verification-20261022.md。
- 中間候補は以下。すべて同一serial・同一版別パッケージ・同証明書のinstall -rであり、現在は上記最終候補へ置換済み。未公開。試作のImgurエラー処理はユーザー指示で取り消し、現行ソース／最終APKには収録しない。

| 中間MPP（build/以下）とSHA256 | 導入APK（build/以下）とSHA256 | 検証上の位置付け |
| --- | --- | --- |
| bottom-filter-no-floating.mpp `EB80EDC818877C873889BB8E24BD02F03B53FB9CCA665419A15F4F2C4415D621` | bottom-filter-no-floating191.apk `6202A4F4498E9756C0175E50745B1A1158D4C13A48BA7B679C953DACFAF3F7CC` | 右下ボタン撤去の初期候補 |
| filter-help-upload-error.mpp `F3B071F8151A2461562EA0E56E28B2B37573F07678E0E960E1D2A1E098BF17CA` | filter-help-upload-error191.apk `9ED02455C353A189D035BBD708302E6D87C6AE15850AE3669D476D2136BC4A43` | 説明表示は未改善、Imgur試作は後に取消。-finalビルドは中断し未導入 |
| viewing-user-agent.mpp `F5566FDF7DC88A77537E1EDD4A213F529D75F794B288FC87814A2580AE90AF39` | viewing-user-agent191.apk `B28205F7018F41ABBAA5C84A128425788692DDC5DFE86235E244BF1F7B831340` | 191初期11項目成功。226/242は生成のみ |
| viewing-user-agent-final.mpp `DC125A1A74C32CDB6D696E257A951F41FD8C9EFABA52FEDAFB0C7357FDC06A3D` | viewing-user-agent-final191.apk `954C07587DDC4F2A60BA44A547352F1A07D0D5F872B275B7DFC28EBD85F9770D`、226.apk `761CBEC631E25CD7CC72F56E33BDD29C85F1207C51EA36461DE618F40D959478`、242.apk `79033AF8D3E4D4D4E439D93E640AF90393BF47168A96AAAF394B616047B9C7DC` | native命令検査成功だが226/242のURL参照不一致で実行試験失敗。最終検証成功版は-verified |

中間導入ログは対応するbuild/*-install.txt。上記表の省略した226.apk／242.apkの接頭辞はviewing-user-agent-final。ローカル基底パスはいずれも `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current`。

## 2026-10-22 09:13:04 JST Kyodemo代替検索先 最終候補

- 対象serial `emulator-5554`、ChMate0.8.10.191 dev「Haiagaru191 設定検証」、`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。InstallVerifiedApk.ps1の署名照合後install -r成功。既存データ消去・実機変更なし。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/kyodemo-archive-final191.apk` SHA256 `014BF6E43532945605A9128A10E1CDE27CD3750F01C7404870A4257BC941DF2C`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/kyodemo-archive-final.mpp` SHA256 `8F6EE1698A27F87CB3A8298151EAB45925E76C8E89A5E3BF47F41BD3B5AC13CB`。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- ログbuild/kyodemo-archive-final191-install.txt、build/kyodemo-archive-final191-runtime.txt。実検索・結果復元・切替13項目、native hook検査成功。画像build/kyodemo-archive-final191.png。新規アプリクラッシュなし、起動後ANRなし。試験前の検索保存状態を終了時に復元。
- 初期候補build/kyodemo-archive191.apkも同日署名照合更新・13項目成功。最終候補は日付区切り・重複見出しを改善した同一ソースの再ビルド。未公開、公開済み1.12.0-dev.2には今回の追加は含まれない。

## 2026-10-22 タブ・Dialog最終候補（ローカル検証）

- 対象serial `emulator-5554`。同一MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/tool-tabs-safe-candidate.mpp`、SHA256 `0746F173D4395FD5ECCCF964BB9CFFD12BF733FDDE1931F499CD79E62985EF50`。実機は未接続のため今回更新なし。
- 191「Haiagaru191 設定検証」／ChMate0.8.10.191 dev／`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/tool-tabs-safe-candidate191.apk`、SHA256 `A7FA2C48E2D4D0A5ADC42FD3DB8F4B176169BD5700AF63CD54B4D019BE947B18`。
- 226「Haiagaru 復帰修正 226」／ChMate0.8.10.226 dev／`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/tool-tabs-safe-candidate226.apk`、SHA256 `A3FC2D61B1014F3988646E3A851A76647D1982B97F4FD11267C72B0E48D52CB1`。
- 242「Haiagaru 復帰修正 242」／ChMate0.8.10.242 dev／`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/tool-tabs-safe-candidate242.apk`、SHA256 `7062216876E92BE9C864093BEA972F5ED218BC0460EB13A01E9FA9E47B39E70E`。
- 各版ともInstallVerifiedApk.ps1で既存署名と照合しinstall -r成功。導入時刻・結果ログはbuild/tool-tabs-safe-candidate191-install.txt、226-install.txt、242-install.txt。設定・Cookie・既存データを消去しない。
- 最終導入ログの更新日時（JST）: 191=2026-10-22 08:03:27、226=08:04:27、242=03:01:21。端末確認はその後も実施。公開CI版は08:23公開であり、この導入物は公開前のローカル候補。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- 3版の本文・画像とnativeタブ、242の設定カード・検索タブ・追加入口・下部フィルター実タッチ復帰・GIF再生を確認。詳細docs/tool-tabs-settings-20261022.md。公開CI版MPPそのものを端末へ再適用した検証とは区別する。

## 2026-10-22 02:33 JSTまで タブUI初期候補の検証と復旧

- emulator-5554（Haiagaru_Test_API36_16GiB）の「Haiagaru 復帰修正 242」／ChMate0.8.10.242 dev／`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`へ初期候補を署名照合install -rで更新成功。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/dialog-tab-review-fix242.apk` SHA256 `7719ECEB8B15BA8D8EE2BDF480390DBCE5B0BEC62D1D15769D111831AC1B99DF`、MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/dialog-tab-review-fix.mpp` SHA256 `E1FBC061FE646FB0532E018B2227466FF977B0493C8E01C1ECD9443DEE8717D3`。
- 同候補でダイアログ11項目成功、タブ設定のLifecycleOwner不在を検出。この候補は配布しない。後続ソースで修正中。
- エミュレータ切断で一度復旧導入に失敗（build/dialog-tab-review-rollback242-install.txt）。同AVDをデータ消去なしで起動し、既知の確認済みAPKへ同署名install -rで復旧成功（build/dialog-tab-review-rollback242-install-retry.txt）。復旧APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/longpress-dispatch-fix242.apk` SHA256 `89D743AF11864731B79010578091DCDC9CD6A88E9C9ADD0B447F8192E34F7B2A`、MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/longpress-dispatch-fix.mpp` SHA256 `67E0C5706D1CBD97AFF4715F9AE3F3B6ABB8423D185F374C73B97E52E718CFA7`。
- 両候補の証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。既存データ・Cookieの消去なし、実機への導入なし。

## 2026-10-22 01:39 JST XIG05の242長押し修正版を更新

- XIG05（730eae72）の「Haiagaru 復帰修正 242」／ChMate0.8.10.242 dev／`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`を署名照合install -rで更新成功。build/xig05-longpress-dispatch-fix242-install.txt。設定・履歴・Cookieの消去なし。更新後HomeActivity起動を要求。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/longpress-dispatch-fix242.apk` SHA256 `89D743AF11864731B79010578091DCDC9CD6A88E9C9ADD0B447F8192E34F7B2A`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/longpress-dispatch-fix.mpp` SHA256 `67E0C5706D1CBD97AFF4715F9AE3F3B6ABB8423D185F374C73B97E52E718CFA7`。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。秘密値は保存しない。
- 同APKをemulator-5554にも署名照合更新成功。内部callback直接呼出しではなく、実タッチ長押し（ADB input swipe同座標900ms）から画像一覧へ移動・戻るを2回確認。dismiss-enter→exit完走、showing=false／attached=false。戻った本文スクロール、透明窓なし、PID8058新規crashなし、lastanrなし。入口を開く準備のみFridaを使用し、修正版のdismiss／遷移はFridaで置換していない。
- 実機で同じ長押し操作の再検証は未実施。実機認証・投稿なし。公開・pushは行っていない。

## 2026-10-22 01:24 JST XIG05へ242を別アプリで導入

- ユーザーの実機導入指示により、XIG05（730eae72）へ新規パッケージとしてinstall成功。既存版を置換・削除していない。ログbuild/xig05-dialog-reattach-guard242-install.txt、pm pathで導入確認。
- 表示名「Haiagaru 復帰修正 242」、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/dialog-reattach-guard242.apk` SHA256 `C8129EBA71A653E704095C228C0AEFCEEA6097ACF6093FCDC6AC032C4173C1A8`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/dialog-reattach-guard.mpp` SHA256 `FF90074B6B4A5D60E8148519039FE2105E146A1C45757B750236075C8405205C`。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。パスワードは記録しない。
- 同じAPKをemulator-5554の同パッケージへ署名照合install -r成功（build/dialog-reattach-guard242-install.txt）。この候補は終了済みダイアログの再attach防止と設定画面のシステムバー配色を追加したもの。実機での起動・認証・投稿、最新候補のダイアログ反復検証は未実施。
- 別アプリなので既存版のCookie・忍法帖・SessionIDは自動移行しない。既存IDを使う場合は認証・投稿前のバックアップ復元が必要とユーザーへ案内。アプリ間のCookie複製、ログイン、認証や投稿は実施していない。

## 2026-10-22 検索密度・認証セッション候補（未公開）

- 後続の最終候補242もemulator-5554へ署名照合install -r Success（build/compact-session-verified242-install.txt）。表示名・パッケージ・署名鍵は下記と同一。
- 最新APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/compact-session-verified242.apk` SHA256 `F9A25E631421CAF6A290D302C75435E3E264D7E3C3F01E54F65AA7505D08BEDF`、MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/compact-session-verified.mpp` SHA256 `FA5C02FEBE0789C1B413EE798EB7C6FD4BCBA30D925A67B224AECE34C3DA37D8`。
- 最新候補で表示12・ID保護5・認証前seed1成功（build/compact-verified-model-tests242.txt）。フィルター画像長押し→ImageListActivity→戻るを2回確認し、閉じたフィルターはisShowing=false／attached=false。最後にResListActivityへ戻り本文スクロール成立、993xwrapの透明窓なし。PID6434のcrash buffer空。特定のカスタムジェスチャー割当・別のフルスクリーン画像Activity・実サイトCAPTCHA完了は未確認。
- 同一MPPの191／226 APK生成・本体タブフック検査は成功。191/226はこの最新候補の導入未実施。共通の表示・認証処理の重複端末検証はユーザーの省略可指示に従い242を優先。
- ユーザーの「修正版242を開いて」に従い、2026-10-22に上記242のタスクを前面化し、ResListActivityを確認。

- emulator-5554、Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。署名照合install -r Success（build/compact-session-final242-install.txt）、設定・履歴保持。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/compact-session-final242.apk` SHA256 `53788C8568FA871C4BA198AB9C2217258683363CE89A77BA5E85AFDE8B8F5A5D`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/compact-session-final.mpp` SHA256 `AB975B8AFF6CA6F6978E1C9BB88852C1CA4CBDE213AD0504DECA4C7C5EF74E02`。
- 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。パスワードは記録しない。
- この候補で表示モデル12、ダミーCookieのID保護5、認証前seedの実コールバック成功。透明ウィンドウは別途再発しており未解決。最新の余白連続調整・結果行専用描画・dismiss時の入力遮断解除は後続compact-session-verified候補で確認する。
- XIG05（730eae72）は認証例の画面読取のみ。今回の実機更新・認証操作・投稿・Cookie削除は行っていない。

## 2026-10-21 GIF映像面・native lifecycle候補（未公開）

- emulator-5554、Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。署名照合install -r Success（build/gif-surface-native-lifecycle242-install.txt）、データ保持。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/gif-surface-native-lifecycle242.apk` SHA256 `9053A7B680E25F66FFD262F3F6ECB42A8E10DB4A6A9DA50530D6320FBAD2D0C7`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/gif-surface-native-lifecycle.mpp` SHA256 `DBDD48C7C325D74FBC18727A54860A297C2FF14D0BB0F25992038D317C18AB0D`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 起動PID24761。実GIF再生は検証結果待ち、191画面離脱は未確認。エッヂ横線UIはこの候補には未収録。

## 2026-10-21 カードwarm・GIF最初のfallback候補（未公開）

- emulator-5554、Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。InstallVerifiedApk.ps1で証明書照合・install -r Success（build/anchor-card-gif-final242-install.txt）。データ消去なし。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/anchor-card-gif-final242.apk` SHA256 `CC10BDDF89BA1517C8CB388D31E9BCDF46F6A0C468A5FB895479EF15E33A47BA`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/anchor-card-gif-final.mpp` SHA256 `AF9856A4A37068A11B1A06144CC445BAD390F881E7A2CB0A13CC1A36EDC5F724`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- PID24013でカードwarm5項目成功。GIF実再生失敗。TextureView化・再試行制限・191 lifecycle修正は本APKには未収録。旧PID23456は同時期のFrida-agent SIGSEGVログがあり、通常操作の安定性とは区別。

## 2026-10-21 アンカー表示補助のフレーム分割候補（未公開）

- emulator-5554、Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。InstallVerifiedApk.ps1の署名照合・install -r Success（build/anchor-layout-budget242-install.txt）。データ保持、アンインストールなし。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/anchor-layout-budget242.apk` SHA256 `46A0767B881C0B6C2D7A19DFFFFAA4677E70F15CF690CF24E913D834FAC71980`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/anchor-layout-budget.mpp` SHA256 `ABD187CBFF5A4EFE5017E72C132703FAB28935C196500F8EFAFD6B4DB5D46782`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- fixture7項目成功、試験View除去。実アンカー遅延の改善比較は未確認。最新カードwarm／Media3 fallbackは未収録。

## 2026-10-21 新しいタブ入口・画面個別設定候補（未公開）

- emulator-5554、Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。InstallVerifiedApk.ps1の署名照合・install -r Success（`build/native-new-tab242-install.txt`）。アンインストール・データ消去なし。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/native-new-tab242.apk`、SHA256 `5A378B37CEBA4CCAD78B4B23518985F825D5A18CFD747016F7FB08965923520D`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/native-new-tab.mpp`、SHA256 `8DC5C933F9CDA5AD98D27D2942B6D7606606EF807DC9D47D77BE37A168772907`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 同MPPで生成した191（Haiagaru191 設定検証、`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`）候補 `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/native-new-tab191.apk`、SHA256 `04C3DDBF1D8BB6293405266AC1819D227D83F8D0CC79BA352017A1C039FADB70`。同鍵・生成検査のみ、今回追加分は未導入。
- 226（Haiagaru 復帰修正 226、`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`）候補 `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/native-new-tab226.apk`、SHA256 `AC47FE39FEFD58DD95F48CAD1AFF108A0F90734D5C06852565E30614BD23A544`。同鍵・生成検査のみ、今回追加分は未導入。
- 242実画面8項目成功、詳細docs/native-tool-tabs.md。191 ANRとGIF再生未解決のため未公開。

## 2026-10-21 本体タブ旧版確認・191接続先修正（未公開）

- 191/226の前節native-tool-tabs候補をそれぞれ同じパッケージ・同証明書へInstallVerifiedApk.ps1でinstall -r Success。設定・データを保持。226の実表示と切替11項目成功。
- 191はON時の入口照合不一致を発見したため修正し、再度同署名更新成功（`build/native-tool-tabs-legacy-fix191-install.txt`）。Haiagaru191 設定検証、ChMate 0.8.10.191 dev、emulator-5554、`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。
- 修正版APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/native-tool-tabs-legacy-fix191.apk`、SHA256 `AB2CD7ED3FB09124B9F563D7E03316B911285ABE3DEC190CEA8EC6E7E5D46B1D`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/native-tool-tabs-legacy-fix.mpp`、SHA256 `03CE527DF2AFE1C2FD0E58F71F9D3BB66FB3C0F09E95225BA895D4E4E85AD6CC`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 修正後191の実表示・スイッチ切替11項目成功。試験設定は復元、開いた追加画面タブは保持している。新しいタブ入口／画面個別選択・保存レス名称変更はこの候補には未収録。

## 2026-10-21 本体タブ統合候補（未公開）

- emulator-5554、Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。InstallVerifiedApk.ps1で既存証明書照合後install -r Success（`build/native-tool-tabs242-install.txt`）。アンインストール・データ消去なし。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/native-tool-tabs242.apk`、SHA256 `119839F0BDF92A67A82AFBFE6CC3B59CB97B696CD1290EC00335C89338DFD66B`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/native-tool-tabs.mpp`、SHA256 `FE1C5CDF1A8C6A12EAD9D02FF54636F752A64315F507B085DB2E9586E4C7C3B2`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 同MPPの191候補 `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/native-tool-tabs191.apk`、SHA256 `51E95AF7DC34157E9D80387B6850F1C369F0FE33AEE51B6D33551E8BED9BEE14`、package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`、同署名。生成・フック検査済み、今回候補は未導入。
- 同MPPの226候補 `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/native-tool-tabs226.apk`、SHA256 `C66EBBA78A30C6D360A29F8B9A54A20E8FBF985B71894B32A82DB313FFED8C79`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix226`、同署名。生成・フック検査済み、今回候補は未導入。
- 242の本体タブ統合とオン／オフの実プロセス16項目成功。詳細docs/native-tool-tabs.md。

追補: 下記theme-management226のインストールは`build/theme-management226-install.txt`のSuccessを確認済み。191/226のnative型DAT除外試験もそれぞれ56／55項目成功。中断時点の未確認記述を本追補で更新する。

## 2026-10-21 自作テーマ管理・旧版への共通修正候補（未公開）

- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/theme-management.mpp`、SHA256 `740CE67809F80FB5CE47138C04D8C15041D86B92A9A3F7B323B1DE83B8E6E6CE`。テーマ一覧／確認付きファイル単位削除と、今回までの共通修正を含む。GIF再生・本体タブ統合の完了版ではない。
- emulator-5554、Haiagaru191 設定検証、`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`：InstallVerifiedApk.ps1の証明書照合・install -r Successをログで確認。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/theme-management191.apk`、SHA256 `1B6120410FD53CA103B58A41D7D767C5049FC717BE0988A484068BE6EF027EF7`。今回候補の実画面とnative型DAT fixtureは未確認。
- emulator-5554、Haiagaru 復帰修正 226、`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`：APK生成成功・既存証明書照合成功、インストールの最終Successは中断時点で未確認。ログ`build/theme-management226-install.txt`を再確認してから導入済みと扱う。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/theme-management226.apk`、SHA256 `8B034C26DF73F855E84632A303AA29BA0D7E51966C0B32BD556E9E081D1D1377`。
- 両版の署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。アンインストール・データ消去は実施していない。

## 2026-10-21 19時台 HOME履歴・レスメニュー・GIF候補（未公開）

- emulator-5554、Haiagaru 復帰修正 242、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。InstallVerifiedApk.ps1で既存証明書を照合しinstall -r成功。データ消去・アンインストールなし。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/history-menu-gif-ui242.apk`、SHA256 `784F69BFB150311AB2BEF961EDA4E0322B4E987E51B79155BCCE9160D9A7478F`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/history-menu-gif-ui.mpp`、SHA256 `16B5920A3721F86D7965DF10CC9BE3BB27DA1ADF95326127869B783DE7F3C569`。
- 署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 242 native型HOME履歴・対象レス・追加ツール・公開GIFメタデータのfixture成功。内部GIF再生はMediaPlayerエラーのため失敗。本体タブ統合は未実装。詳細`docs/history-menu-gif-tablet-20261021.md`。
- その後の226見出し判定1行修正を含むビルドは成功したが、このAPKへの再適用はしていない。191/226には今回候補を導入していない。

## 2026-10-21 18時台 最終NG・フィルター候補（未公開）

- emulator-5554。3版ともInstallVerifiedApk.ps1で既存APK証明書を照合しinstall -r成功。アンインストール・データ消去なし。
- MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ng-filter-verified.mpp、SHA256 64C044216ADE619626A14E3165B7CC625C995E0948EF1CE6AC9D17FE80F2C37D。
- 191 dev: Haiagaru191 設定検証、jp.co.airfront.android.a2chMate.haiagaru.settingsfix191、APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ng-filter-verified191.apk、SHA256 CCE8F5BA97CB62421BA55EF9A351D58F36503A241F1801357DDA2E6BD611E938。
- 226 dev: Haiagaru 復帰修正 226、jp.co.airfront.android.a2chMate.haiagaru.resumefix226、APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ng-filter-verified226.apk、SHA256 04B78E2C9B1B0B0260D1F44323037647EE8AB41DB11765DCCDFD940904FA51C0。
- 242 dev: Haiagaru 復帰修正 242、jp.co.airfront.android.a2chMate.haiagaru.resumefix242、APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ng-filter-verified242.apk、SHA256 9451940F9578A19C3DB1AF159B5507D77461088AC9CC5B39CC0FD3C41F6367E8。
- 共通署名鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- 191 PID20399で新規WebView ANRがあり公開保留。検証・診断コードの失敗と修復を含む記録はdocs/ng-filter-settings-20261021.md。

## 2026-10-21 16時台〜17時台 ワッチョイNG・フィルター候補（未公開）

- ADB対象emulator-5554。以下3版はInstallVerifiedApk.ps1で既存署名を照合しinstall -r成功。データ消去なし。
- MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ng-filter-final.mpp、SHA256 F16D16EAEF20DBE681F17BE4F2F83A5A0CC596C6BA51099F6762D6ABA5F462A5。
- 191 dev: Haiagaru191 設定検証、jp.co.airfront.android.a2chMate.haiagaru.settingsfix191、APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ng-filter-final191.apk、SHA256 143F4774229931A9B234F29097C9A6493D94BF6D03C774308FB3874102661385。
- 226 dev: Haiagaru 復帰修正 226、jp.co.airfront.android.a2chMate.haiagaru.resumefix226、APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ng-filter-final226.apk、SHA256 EF990E695C148528190B6E74759D5612A793B41ACD3FB3F5CC4E4FB06F2672E9。
- 242 dev: Haiagaru 復帰修正 242、jp.co.airfront.android.a2chMate.haiagaru.resumefix242、APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ng-filter-final242.apk、SHA256 EF81A6B6BCEF5C80B21CEE51E0AF7BB8D06AA275BADB56D1E31B9F124D8CA067。
- 署名鍵C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- 確認範囲・未確認項目はdocs/ng-filter-settings-20261021.md。公開・バージョン更新なし。

## 2026-10-21 191待機ANR対策候補（未公開）

- emulator-5554、表示名Haiagaru191 設定検証、jp.co.airfront.android.a2chMate.haiagaru.settingsfix191。同署名install -r成功、データ消去なし。
- APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/anr-date-cache-final191.apk、SHA256 A57A2CD916213CC5A45DD2445A32458C26090E0F51D83F4554D7FDCC32A46E68。
- MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/anr-date-cache-final.mpp、SHA256 C04A8EB21C41416043F01EDF9C18F6F4B7E673BD4302560C18D44C10FFF7EE2B。
- 署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。照合結果build/anr-date-cache-final191-install.log。確認範囲docs/native-draw-date-anr.md。

## 2026-10-21 設定・履歴再開・NG対象板の最終候補（未公開）

- ADB対象は全て emulator-5554（API36 x86_64）。191の旧archivemenu191は証明書85e29bfe...で不一致のため更新拒否、削除せず保持。ユーザーの別パッケージ方針に従いsettingsfix191を新規導入。その後以下3版を署名照合付きinstall -rで更新成功。データ消去なし。
- 共通MPP絶対パス C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/settings-accessibility-final.mpp、SHA256 22AB2F5920C648ABF19439D3B3D2CFA3417281A1225217A80BD2362441CF1236。
- 191: 表示名Haiagaru191 設定検証、jp.co.airfront.android.a2chMate.haiagaru.settingsfix191、APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/settings-accessibility191.apk、SHA256 578870B3190204D4706B4CB0F7FF5667B29E6042D51F7C5471D6B262FBDC9F73。
- 226: 表示名Haiagaru 復帰修正 226、jp.co.airfront.android.a2chMate.haiagaru.resumefix226、APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/settings-accessibility226.apk、SHA256 E52B807F7B7E076F895CFA94C82B27191EE696125021118ECD6D958BF8014FC6。
- 242: 表示名Haiagaru 復帰修正 242、jp.co.airfront.android.a2chMate.haiagaru.resumefix242、APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/settings-accessibility242.apk、SHA256 DE7BCD7C924603F68D6B3ED5263A1E22D1B8B7E6095734E83B74FEDE76248B1D。
- 共通署名鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。実APKの照合・Success・hashはbuild/settings-accessibility{191,226,242}-install.log。導入時刻は2026-10-21 JST、191約09:10、226/242約09:11〜09:14。
- 191/226/242設定・NG対象板操作等は確認済み。診断用フック中のART SIGSEGVを記録、フックなしの公開スレ／画像表示は実行環境制限でユーザー操作待ち。公開済みとは扱わない。

## VPN用ZIP・Image NG用ZIP同時指定191（2026-10-20、生成のみ）

- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/optional-vpn-zip191.apk`。ChMate191、表示名Haiagaru 191 フル版、パッケージ `jp.co.airfront.android.a2chMate.haiagaru.full191`。SHA256 `694333243CCF29529B5DE9902557AF000EF66727C2FAEB70CF352A0B4ADD09F6`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/optional-vpn-zip-verified.mpp`、SHA256 `891A764868A7C6C3CBBAFE02ABC58F89F76E2533D3C78DE68BA15F5CF2DFC33A`。
- CLI共通署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`（BKS、alias Morphe、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`）。7パッチ適用・再構築・署名成功。
- APK内の両4 ABIライブラリとVPN導入マーカー、元レス描画保持検査成功。実機730eae72は切断。emulator-5554への導入・URL起動を含むコマンドは実行環境が拒否し、今回の新規インストールは未実施。

## エッヂ検索スクロール最終修正版226（2026-10-20 14:07 JST）

- API36 x86_64 / emulator-5554。表示名 Haiagaru 復帰修正 226、ChMate 0.8.10.226 dev、パッケージ `jp.co.airfront.android.a2chMate.haiagaru.resumefix226`。`adb install -r`成功、既存データの削除なし。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/eddi-scroll-final226.apk`。SHA256 `92B693AA4D6B557D74194B6B928BBADE2943C2DD9205E70784EDF314965E4DA5`。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/eddi-scroll-final.mpp`。SHA256 `57AF2E943F434FCE3FE4505E5FF60FBEE0C5B30E7D11C52036F4A87EB46E5E3B`。
- 共通署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、BKS、alias `Morphe`。同署名更新成功。証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 最終版226で検索画面の縦スワイプと横画面結果欄を確認。前段版で50行目・詳細条件・スレを開いて戻る位置保持、658の画像表示を確認。実機への導入なし。

## 同じ最終MPPによる242追加検証（2026-10-20 JST）

- 端末 `emulator-5554`、パッケージ `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名 Haiagaru 復帰修正 242、ChMate 0.8.10.242 dev。
- APK絶対パス `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/crash-filter-immediate242.apk`、SHA-256 `4F6CEF523ED609A9FBF058E08DC029FF3D92D4242E0F1E19240BBAD49BDC43E6`。
- 入力MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/crash-filter-immediate-final.mpp`、SHA-256 `C48D7EA3D9960820BAB00C5BD449CB13701E18D6563A78D823352C2089AEFCA5`。
- 鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、BKS、エイリアス Morphe、証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。既存同署名へ上書き成功。
- 実操作で指定Haiagaru Part2スレ本文、3レスの画像サムネイル取得・画像ビューア表示、フィルターダイアログ内のチェックオン／オフを確認。復帰処理の元命令保持検査成功、最終crash buffer 0 bytes。フィルター解除済み。公開・実機導入なし。

## 1.11.0クラッシュ・フィルター即時反映の最終検証版（2026-10-20 JST）

- 対象: `emulator-5554` API36 x86_64。191/226とも既存検証パッケージへ `adb install -r` 成功。
- 固定MPP絶対パス: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/crash-filter-immediate-final.mpp`。
- MPP SHA-256: `C48D7EA3D9960820BAB00C5BD449CB13701E18D6563A78D823352C2089AEFCA5`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、BKS、エイリアス `Morphe`。既存同署名への更新成功。証明書SHA-256は既存検証版と同じ `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 191: `jp.co.airfront.android.a2chMate.haiagaru.full191` / Haiagaru 191 フル版。APK絶対パス `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/crash-filter-immediate191.apk`、SHA-256 `3A397E0FCA39233EA5FEA7C912BEFE9F1F5950595A6D2404DB3FB88D38923504`。
- 226: `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / Haiagaru 復帰修正 226。APK絶対パス `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/crash-filter-immediate226.apk`、SHA-256 `609F966F27FE324F52758219CB476BCDF84AB19B7FD7021DCA1EA1A0A194296C`。
- 同じ修正系列で191の指定公開スレ本文表示、226の画像サムネイルから標準画像ビューア起動を確認。最終226でフィルターを閉じずにチェックのオフ→オンを確認。最終2 APKの元レス描画保持検査に合格し、最終検証後のcrash bufferは0 bytes。
- 検証時の画像フィルターは最後に解除。実機導入・公開は未実施。内部バージョン表記は1.11.0のまま。

他チャットは導入前にこの台帳と実APKを照合する。秘密鍵・パスワードは記載しない。開発版は別パッケージへの導入を標準とする。

## 既存191版の照合（2026-10-20）

- 端末: XIG05 / `730eae72`
- パッケージ: `jp.co.airfront.android.a2chMate.haiagaru`
- ChMate: `0.8.10.191 dev` / versionCode `2100000000`
- 署名証明書SHA-256: `bc78368b1426256afede71c43e87582e1481a56fe2ee45021d2ccc0fe9b6e7d5`
- 使用鍵: 未照合。`build/morphe-data-xig05/imported.keystore` は候補であり、一致は未確認。
- 保存APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/xig05-installed-191-before-update.apk`
- APK SHA-256: `E0958D0E1D54C0E80240F8DEF784AD8CFDCC8B78D53E96B3055761F567BEF3B8`
- 元APKは端末から取得。署名証明書は `apksigner verify --min-sdk-version 24 --print-certs` で照合。今回このパッケージは更新していない。

## 最新191フル版（2026-10-20 導入成功）

- パッケージ: `jp.co.airfront.android.a2chMate.haiagaru.full191`
- 表示名: Haiagaru 191 フル版
- 対象端末: XIG05 / `730eae72`
- 署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`
- エイリアス: `Morphe`
- 署名形式: BKS。BCプロバイダーを指定したkeytoolで上記鍵の証明書とAPKの一致を確認済み。
- 署名証明書SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/latest-full191-separate.apk`
- APK SHA-256: `d1e3ab42f45d130bbc6c17da4e2a661e74fbb0ff160d3a6855b39276df017794`（58,188,230 bytes）
- 使用MPPの固定保存先: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/latest-full191-installed-input.mpp`（ビルド出力からコピー。再ビルドによる上書きを避けて保持）
- MPP SHA-256: `af1753a667cae3a86f45ce4f9be680821d0b18ba257a62c5cb640210755c7c3b`（5,477,981 bytes）。公開済み1.10.0-dev.2とは内容が異なるローカル開発ビルド。
- 結果: 7パッチ適用・再構築・署名成功。XIG05 `730eae72`へ `adb install -r` 成功。起動後に同パッケージのHomeActivityがforegroundとなることを確認。
- APK内のSiteCards／SiteCardMetadata／GifViewerActivity、絵文字フォント、4 ABIのVPNとTFLiteライブラリを確認。サイトカード表示・タブ切替・全機能の実機操作は未確認。
- オプション: MEGA、Imgur、動画・GIF、VPN、絵文字フォント、191画像判定修正。汎用サイトカードは本体拡張に同梱。

## レビュー修正3件を含む191フル版（2026-10-20 生成済み・導入待ち）

- パッケージ・表示名・鍵・エイリアス・証明書SHA-256は上記full191と同一。鍵をCLIの `--keystore` で明示し、証明書一致を照合済み。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/release-full191.apk`
- APK SHA-256: `532d3dfe48663cc384cd98221367c63990a844aba41b927c8df77cf316f3088a`（58,188,230 bytes）
- 使用MPP固定保存先: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/release-full191-input.mpp`
- MPP SHA-256: `2eeb7792c92c59bfc589309d30494e8d6cbc28c87a1cb52d28b933acf31e7d93`。dev.3公開元52c0f2eのローカルビルドで、CI生成物のバイト列とは異なる。
- 結果: 全7パッチ適用・再構築・署名成功。追加修正はZZZSearchの画面更新、小数キーボード、動画サムネイル生成設定の復元。XIG05が切断されたため、このAPKの実機更新は未実施。実機導入済みは上記の `latest-full191-separate.apk`。

## 復帰時クラッシュ修正版のエミュレータ導入（2026-10-20 JST、全て成功）

- 端末: API36 x86_64エミュレータ / `emulator-5554`。実機への導入は実施していない。
- 共通MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/resume-crash-verified-candidate.mpp`
- MPP SHA-256: `ABC2A8DF3D18B80487E430984192263AFFA4938C2EE8C2B61BB4718AF19F3A4B`
- 共通署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、BKS、エイリアス `Morphe`。
- 証明書SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。191生成APKをapksignerで照合し、同じCLI署名設定で3版を生成。

| ChMate | パッケージ／表示名 | APK（主開発フォルダからの相対パス） | APK SHA-256 |
| --- | --- | --- | --- |
| 191 dev | `jp.co.airfront.android.a2chMate.haiagaru.full191` / Haiagaru 191 フル版 | `build/resume-verified191.apk` | `10DAF29866DE3BA1EAAC511683BB7A157F1EB3D4C0966BCE9D2FEFCA31E2E210` |
| 226 dev | `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / Haiagaru 復帰修正 226 | `build/resume-verified226.apk` | `33B264719E1C231F822587B2FC131F829892E824A463CE014EB5C22058B91463` |
| 242 dev | `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / Haiagaru 復帰修正 242 | `build/resume-verified242.apk` | `E5078E6BA9F73AF575832764E9C9E58DD1D78E7B417782EB714F38C2D013CFC7` |

絶対APKパスの共通先頭は `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/`。既存の標準パッケージは変更せず、191はエミュレータ上の同署名full191を更新、226／242は新しい検証用パッケージへ導入。各プロセスで復帰判定9項目に合格し、新しいクラッシュ記録なし。端末の全UI・通信経路の通し確認は含まない。

## 高度なNG API v2最終候補のエミュレータ導入（2026-10-20 JST）

- 端末: API36 x86_64 / emulator-5554。3版とも同署名の既存検証パッケージへ adb install -r 成功。
- 使用MPP: C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/advanced-ng-v2-verified.mpp
- MPP SHA-256: 0E0CA6D419345D393FD59499F6945B8F6C5FD00037BE6280AC3DCE6B14FFDA92
- 署名鍵: C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore（BKS）、エイリアス Morphe。既存の同署名検証APKの更新に成功。
- 証明書SHA-256: 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed

| ChMate | パッケージ／表示名 | APK絶対パス | APK SHA-256 |
| --- | --- | --- | --- |
| 191 dev | jp.co.airfront.android.a2chMate.haiagaru.full191 / Haiagaru 191 フル版 | C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/advanced-ng-v2-191.apk | C6DF18C56439ADD5B18D4DBFD137C0F1D29B7C63A3EFF74B85B245877B9E20B4 |
| 226 dev | jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / Haiagaru 復帰修正 226 | C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/advanced-ng-v2-226.apk | 940E597C85B6253CB3F86F646C9076FFC6159DFD688D1004BCDF098074D5580B |
| 242 dev | jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / Haiagaru 復帰修正 242 | C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/advanced-ng-v2-242.apk | 7F39443BCF6BFAB41A17D4D710AEC52E1EF8277F32B607AB7D0801AEA3F41D13 |

高度なNG実コントローラーは191=22、226=22、242=15項目に合格。ZZZSearch／設定9項目に合格。実機更新と指定公開スレの通し確認は未実施。

## 1.11.0クラッシュ修正版の生成・エミュレータ導入（2026-10-20）

- 対象: API36 x86_64 / `emulator-5554`。既存検証パッケージへ `adb install -r` 成功。既存データは消去していない。共有エミュレータの191/226は並行検証でも更新されるため、次回は台帳だけでなく実APKのハッシュを再照合する。
- 共通鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`（BKS、エイリアス `Morphe`）。242をapksignerで照合した証明書SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。3版とも同じCLI署名設定。
- 以下のAPK絶対パスの先頭は `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/`。

| ChMate / 表示名 | パッケージ | APK / SHA-256 | 入力MPP |
| --- | --- | --- | --- |
| 191 dev / Haiagaru 191 フル版 | `jp.co.airfront.android.a2chMate.haiagaru.full191` | `build/crash-hotfix-191.apk` / `07D43E4EE4C00692DA81DFE6DA3FFF890B7CD3CC50C0410F1528F83058B9E30C` | `build/crash-hotfix-verified.mpp` |
| 226 dev / Haiagaru 復帰修正 226 | `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` | `build/crash-hotfix-226.apk` / `81B462A2B525D1CC8054C16A252BE5610C564B902531786F1601C7BED4B48708` | `build/crash-hotfix-final.mpp` |
| 242 dev / Haiagaru 復帰修正 242 | `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` | `build/crash-hotfix-242.apk` / `B0E92AA706563DF4E892F50CD293D5C5B87F67833F184FE17AABD23B157B09F4` | `build/crash-hotfix-verified.mpp` |

- `build/crash-hotfix-verified.mpp` SHA-256: `F33D900A064EDB6F3E180678596637EECB42B4DE28A626468164F2AFCD10E871`。
- 最終統合MPP `build/crash-hotfix-final.mpp` SHA-256: `0373C18C620AEF08AC2EF1C51C45C2DA966F8BAD023E6F1589BB3D1016B9D36D`。前者との差は226用のネイティブ描画メソッド判定を追加したパッチ生成側の変更。191/242の生成経路の動作は同一。
- 242は修正前APKで提供ログと同じ `o.zzaW.c` / `0x101` VerifyErrorを再現し、修正版は実メソッドの検証・実行に成功。詳細は `hotfix-1.11.0-242-restore.md`。実機導入とユーザーのバックアップZIPによる復元通し確認、公開は未実施。
- 追加確認: 上記と同じ226/242 APKを `emulator-5556`（API36、`Haiagaru_Test_API36_16GiB` のread-only起動）にも導入成功。242の公開スレ本文表示と実フィルターダイアログのチェック即時反映を確認し、新規crash bufferは0 bytes。このAVDは一時検証用で、終了時に導入状態を保存しない。常設の検証先は引き続きemulator-5554。

## 2026-10-20 投稿検索・フィルター改善候補226（未公開）

- 対象: `emulator-5554`、API36 x86_64。実機は更新していない。
- 表示名: `Haiagaru 復帰修正 226`、ChMate `0.8.10.226 dev`、パッケージ `jp.co.airfront.android.a2chMate.haiagaru.resumefix226`。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/search-filter226.apk`。
- APK SHA-256: `CF30CAF3B44F7771729F6835803023C22239BE32E365160FCC46803C93743EF4`。
- 固定MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/search-filter-candidate.mpp`。
- MPP SHA-256: `228ED68056452ADF0F487AA639F6718B9A06E3A22D6A1E72C8CD5B332ABBD3BC`。
- 署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、エイリアス `Morphe`。
- 証明書 SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。既存APKを取得して一致を確認した。
- `adb -s emulator-5554 install -r`で成功。アンインストール・データ消去なし。端末のlastUpdateTimeは`2026-10-20 14:16:52`（端末表示）、PC側JST換算で`2026-10-20 23:16:52`。
- パッチ適用・署名ログ: `build/search-filter226-patch.log`。検証範囲・残件: `docs/search-filter-2026-10-20.md`。公開済み1.11.2と同じ版名の開発候補であり、GitHubに公開したものではない。

## 2026-10-21 過去ログ倍率・折りたたみ判定候補226（未公開）

- `emulator-5554`（API36 x86_64）、ChMate `0.8.10.226 dev`、表示名`Haiagaru 復帰修正 226`、パッケージ`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`へ上書き成功。データ消去なし。
- APK絶対パス: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/archive-scale-fold226.apk`。
- APK SHA-256: `D5DE2462C6A89B4CCFEBCE7CB09642C28B2765D87C754E08B17571E9E24B6FEB`。
- MPP絶対パス: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/archive-scale-fold-candidate.mpp`。
- MPP SHA-256: `5F7A0619CD29784A1B2038BEE29DB0F3E0BBE5CD994896A19310E2133E1366C1`。
- 署名鍵`C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、エイリアス`Morphe`。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`で既存と一致。
- 端末のlastUpdateTimeは`2026-10-20 15:03:44`（端末表示）、JST換算`2026-10-21 00:03:44`。`adb -s emulator-5554 install -r`のSuccessとHomeActivity起動を確認。検証プロセスPID9565。
- 適用ログ`build/archive-scale-fold226-patch.log`、検証記録`docs/archive-scale-fold-fix.md`。191／242・実機は今回未導入、未公開。
# 2026-10-24 共有NGページ分割候補（242導入済み）

- 対象: emulator-5554 / ChMate242 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`（表示名 Haiagaru 検証 242）。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng242.apk`
- APK SHA-256: `64810E24F5AF126D2393DB6263B0B4735D13177AD5BAE4E3F4476C5D4C8D0106`
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-paged.mpp`
- MPP SHA-256: `46936BC50C10EEFE0E0A8646711EC9A103957F0EB58EEE2F8ACD40CD493AEDA8`
- 署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- 証明書SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。既存と一致を確認。
- 11:22時点: InstallVerifiedApkのinstall-r処理中（session 43311）。まだ成功・起動確認済みとは扱わない。データ消去・アンインストールなし。
- 続報: 同じsession 43311がSuccessで正常終了。署名一致・データ保持更新成功。通常launcher起動でPID454、crash buffer最新は既存10-23 08:45:01のFrida履歴のまま。共有NGの端末判定試験は進行中、実サービス通信・公開は未確認。
- Android共有NGの一時条件9項目が成功（build/shared-ng242-android.log）。実スレの報告候補も取得。条件/ONOFFは復元済み、報告やHTTP通信なし。native実非表示・実サービス・191/226は未確認。

## 2026-10-24 共有NG報告キュー競合修正候補

- ChMate242、emulator-5554、`jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名 Haiagaru 検証 242。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-queue-race242.apk`、SHA-256 `9AB2B23EA8EB1403ABEBFC273A84E79202279265279B1620BB959F34E8038781`。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-queue-race.mpp`、SHA-256 `D18FE6B5B4E8583F7F76BB2888CF882B4D93264EDB312F977939FDA671BCA516`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。署名証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- InstallVerifiedApkで署名照合後のデータ保持更新を開始。まだ成功/端末検証済みとは扱わない。
- 続報: session 91879がSuccessで終了し更新完了。launcherからTabletHomeActivity起動（PID1441）、crash buffer最新は既存10-23 08:45:01のまま。`build/shared-ng242-queue.log`で報告確認済み除去5項目成功。HTTP/永続キュー変更なし。GAS実通信と画面上の非表示は未確認。

## 2026-10-24 共有NG191候補

- ChMate191、emulator-5554、`jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`（表示名は既存の191検証設定を使用）。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng191.apk`、SHA-256 `1E3661A2DCED481D5FBA2A30AC09394CC3E2D66FF581C3E8C3380F4266DCAA7F`。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-queue-race.mpp`、SHA-256 `D18FE6B5B4E8583F7F76BB2888CF882B4D93264EDB312F977939FDA671BCA516`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- session11811で既存署名一致・install-r Success、データ保持更新完了。起動・共有NGの191固有境界確認はこれから。
- launcher起動PID1813、表示名 Haiagaru 検証 191。build/shared-ng191-native.logの実レス境界5項目成功、共有状態を復元して再prepare。crash buffer新規なし。画面非表示・通信は未確認。

## 2026-10-24 共有NG226候補（導入中）

- ChMate226、emulator-5554、`jp.co.airfront.android.a2chMate.haiagaru.resumefix226`（表示名 Haiagaru 検証 226）。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng226.apk`、SHA-256 `8E480FD4586D68E8ABF7C0668547356BDBB0018F482725D4DDDE96E3FEDFD4B2`。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-queue-race.mpp`、SHA-256 `D18FE6B5B4E8583F7F76BB2888CF882B4D93264EDB312F977939FDA671BCA516`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- session30872で既存署名一致を確認、install-r実行中。成功・起動・端末テストはまだ未確認。
- 続報: session30872がSuccessで終了し導入完了。launcher起動PID2196、native境界の検査中。3版の最終APKはVerifyProgrammableNgHooksのバッチprepare/型付きMap置換/引数register検査が成功。画面非表示・GAS通信は未確認。
- build/shared-ng226-native.logで実レスnative境界5項目成功。191と同じ試験でNGWordフラグ追加/元flag保持/OFF復元を確認。crash bufferは既存10-23のまま。画面非表示・GAS通信は引き続き未確認。

## 2026-10-24 接続先変更競合修正242候補（導入中）

- ChMate242 / emulator-5554 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / Haiagaru 検証 242。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-source-race242.apk`、SHA-256 `A01F7A54C51F0526A2F0F1752578445E0D91459EC100D2E8BAE9477EF346FD3C`。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-source-race.mpp`、SHA-256 `353E382494984FA9AA37148A2EDD49222D1E303DA21A9F49724CB63878B6F1E6`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- session63236で既存署名一致を確認しinstall-r進行中。通常Lint buildはbuild/shared-ng-source-race-build.logで成功（2分17秒）。起動/競合/ページ同期テストは未実施。
- 続報: session63236がSuccessで終了、launcher起動PID2622。build/shared-ng242-source-race.logでA→B→A変更中の古い応答破棄など5項目成功、SOURCE_STATE_RESTORED。初回はFrida Long比較のfixture不備で停止、Number変換後に再成功。ページ同期fixtureを実行中、実サービス通信は未確認。

## 2026-10-24 標準共有NG接続先242候補（導入中）

- ChMate242 / emulator-5554 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / Haiagaru 検証 242。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-default242.apk`、SHA-256 `52F4B8692DC33ABFCCCB9F64317E27EC1D82EBBD5F6F4BBD8DAB765E60C5CAC3`。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-default.mpp`、SHA-256 `95D4AA6A8AF85C35FD31151E40E7C87C48EC02D13B71583AEA23AAC420B01849`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 通常Lint build成功（2分31秒）。InstallVerifiedApkのsession3945でデータ保持更新中、まだ端末検証済みではない。
- session3945がSuccessで終了、launcher起動確認。build/shared-ng242-default.logで未設定/旧空欄の標準URL解決・独自URL維持・共有NG初期OFFの4項目成功。ENDPOINT_SETTING_RESTOREDを確認、HTTPや報告は送信していない。

## 2026-10-24 共有NG報告ANR/UI修正242候補（導入中）

- ChMate242 / emulator-5554 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / Haiagaru 検証 242。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-report-ui242.apk`、SHA-256 `113CDAD19A33CE5F4359A1BB0D1665EA4AFB8824D73D043D380F35D515660F71`。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-report-ui.mpp`、SHA-256 `B09BD832EBF3BF6CDDB69100E20EEEE1A7B9BBBB3F6FA78D179457720B8D66D6`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 通常Lint build成功（3分8秒）。session69837で署名一致・データ保持更新中、成功/端末検証は未確認。直前ANR最新は226の2026-10-24 02:43:55。
- session69837はSuccess、launcher起動とVerifyProgrammableNgHooks成功。build/shared-ng242-report-worker.logで6秒遅延した候補作成がoffMain=true、UI呼出し238msで戻り、2回操作でもcalls=1、完了後busy=falseを確認。初回は起動直後focusなしで実行されず、focus確認後再試験成功。HTTP/報告/NG設定変更なし。ANR最新は直前と同じ226履歴。

## 2026-10-24 表示中スレ共有NG候補取得242（導入中）

### 同じMPPの191候補（導入中）

- ChMate191 / emulator-5554 / `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191` / Haiagaru 検証 191。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-visible-source191.apk`、SHA-256 `2C6C4E28B5E6958CC08AD11548F8CFC227A148FDC06A60EDC4AA6AC92A564010`。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-visible-source.mpp`、SHA-256 `4C2B829B8924CFE72760E346A27891659DA836187198D9BB3A7481FEBDDCD923`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- session21932で既存署名一致・データ保持更新中。成功/起動/候補captureは未確認。
- session21932がSuccessで終了し191更新完了。nativeフック検査成功。起動PID4826は確認したが、242のANRダイアログが画面を遮っており新captureは未実施。

### 同じMPPの226候補（導入済み、候補UIは未確認）

- ChMate226 / emulator-5554 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix226` / Haiagaru 検証 226。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-visible-source226.apk`、SHA-256 `FD1A1D1C52A9DF9CAC790BC7AE46FC464EE2FD6ACA9DE9BBF4C7944F79EE65F2`。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-visible-source.mpp`、SHA-256 `4C2B829B8924CFE72760E346A27891659DA836187198D9BB3A7481FEBDDCD923`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- session91247で既存署名一致・install-r Success。端末lastUpdateTime=2026-10-24 03:51:46。新capture/UI/画面非表示は未確認。

### 242の記録

- ChMate242 / emulator-5554 / `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / Haiagaru 検証 242。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-visible-source242.apk`、SHA-256 `8100F6A7247B2CDEAB8385B088D46D7B94718978DD6767C4C64AB0CDFBE02253`。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/shared-ng-visible-source.mpp`、SHA-256 `4C2B829B8924CFE72760E346A27891659DA836187198D9BB3A7481FEBDDCD923`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 通常Lint build成功（3分46秒）。session3200で署名照合/データ保持更新を実行中。導入完了・表示中スレcapture・候補UIはまだ未確認。
- session3200がSuccess、起動PID4138とnativeフック検査成功。build/shared-ng242-visible-source.logでPart3の539件/正しい板URL/独立ArrayListを確認。build/shared-ng242-visible-report.pngで実候補一覧を視認、報告選択/送信なしでBack終了。新ANRなし（最新は226の02:43:55）、crash最新は先行フック試験03:27:22のまま。表示中source取得の191/226はまだ未確認。

## 2026-10-24 タブ見出し縮小候補（XIG05導入済み）

- 対象: Xiaomi XIG05、ADB serial `730eae72`、ChMate `0.8.10.242 dev`、表示名 `Haiagaru 検証 242`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/tablet-header-suffix-20261024-242-final.apk`。SHA-256 `B36EFE6FEF33CF4508540DDFD2A688E93CA350DBAF9E558E5526A8EFC2A3C7D2`。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.1.mpp`。SHA-256 `E83FAB4BD726F89E1CA4418307DDAF115403ACDE7CA0A046B54846CE8993B4B6`。
- 元APK: `C:/Users/narum/Downloads/chamate/242/chmate-0-8-10-242-dev.apk`。
- 署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。導入前既存APKと候補APK、導入後端末からpullしたAPKの署名一致を確認。
- 2026-10-24 23:29 JST、`adb -s 730eae72 install -r`でデータ保持更新。端末`lastUpdateTime=2026-10-24 23:29:25`。導入後pullしたAPKは候補とSHA-256一致。`TabletHomeActivity`が前面表示。
- 変更: 専用画面タブ見出しと×バーの既定16dp、設定範囲16〜20dp。通常カテゴリと重複する設定をエキスパート画面から除去。
- APK作成初回はJVMのnative memory allocationで失敗。Gradle daemonを停止し、JVM heap/parallelismを抑えて再実行後build成功。画面の見た目の最終スクリーンショット確認は未実施。

## 2026-10-24 23:59 XIG05 チェッカー操作バー調整候補（導入済み）

- Xiaomi XIG05 / serial `730eae72` / ChMate `0.8.10.242 dev` / 表示名 `Haiagaru 検証 242` / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。
- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/checker-toolbar-drag242.apk`、SHA-256 `CF63BE04F33E74F9EDB1E5A7B97FCD067B159FF07AABA034027423E06589380D`。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/checker-toolbar-drag.mpp`、SHA-256 `2E580BCDF1DA1B5BCBE5B19084B59B9C0635BE2AEBE4C80D53B536254D250361`。
- 鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- InstallVerifiedApk.ps1で既存パッケージと署名照合後、install -r Success。端末lastUpdateTime `2026-10-24 23:59:03`。設定・データ保持。
- タブレットのHissi/投稿検索結果の重複見出し・×を非表示にし、更新/URLなどの操作バーに高さ20〜80dpのドラッグつまみを移動。投稿を探すのタイトル18sp、×20sp、閉じる領域64dp幅、タイトル文字も閉じる操作対象。
- 実機の実Hissiページで操作バー20→80→20dpをADB swipeで操作。XMLつまみ位置はy452→632→452px（密度3、操作バー高さ60→240→60px）。アプリforce-stop/再起動後もy452pxで保存を確認。重複見出しなしをスクリーンショットで確認。
- Frida fixtureはattach失敗（remote frida-server closed）で実行されず、成功扱いにしない。投稿を探すのタイトル閉じる実タップ検査は端末が別画面になっており未確認。走査/投稿は実行していない。
- 続報依頼のレス/スレ/名前バーの別高さ、つまみ非表示・固定は、この導入版には未収録。次候補で実装・ビルド中。

## 2026-10-25 追加タブ復帰の黒画面対策候補（生成のみ・未導入）

- 対象ChMate: `0.8.10.242 dev`。出力パッケージ: `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`、表示名 `Haiagaru 検証 242`。
- 元APK: `C:/Users/narum/Downloads/chamate/242/chmate-0-8-10-242-dev.apk`。
- 生成APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/tool-return-visibility242.apk`、SHA-256 `51B9406EC93F060247B5AFB85B8E2411D0EFB5C6800FD4E5B06AECA4FA1E4B5E`。
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/patches/build/libs/patches-1.12.1.mpp`、SHA-256 `0B1721BDAE126B9B3E8613247166BAEFF4273E14B8BBFEADE593A4093F6B84BE`。
- 署名証明書SHA-256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。鍵ファイル `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`。
- APK生成・署名確認・242元APKへのパッチ適用は成功。端末serialなし、インストール未実施。XIG05 (`730eae72`) は未接続。ADBに見える `d5497008` はAndroid 11の別端末と確認したため操作していない。実機での復帰・スクリーンショット確認なし。

## 2026-10-25 Mi Note 10 最終候補

ユーザー許可によりMi Note 10（serial `d5497008`）へ別パッケージ `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` / Haiagaru 検証242 / ChMate0.8.10.242 devを追加し、以後署名照合install-rで更新。既存アプリの削除・データ消去なし。

最終APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/prerelease-final242.apk` SHA256 `0BD6DD822EE771F9C4C3E949E74AFDD427A9FE10D5EBE1533264B9508B48138C`。MPP同root `build/prerelease-final.mpp` SHA256 `8D9DB23E9B75E0539E2B7BDDBA5ED6FDCB0721020A9CD3F6946594732B126DEE`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias Morphe / 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。2026-10-25 07時台JST導入Success（build/minote-prerelease-install.log）。

検索/過去ログ/チェッカー複数タブを作り、Android設定からの復帰、HOME移動後am killでプロセス終了→再起動でフォーム復元を画像確認。Part3本文表示、links付き標準画像ビューアでImgur画像表示を確認。通常Intent dataだけでは画像一覧に渡らず空画面になるので、これは画像表示の成功とは扱わずlinks経路で再確認した。crash bufferに新しいアプリのFATALなし。120Hz性能やXIG05での長時間再発確認、Hissi実走査は未実施。

## 2026-10-25 テンプレート・検索先優先・リンクカード位置対策（導入済み）

- XIG05 serial `730eae72` とMi Note10 serial `d5497008`、表示名Haiagaru 検証242、ChMate0.8.10.242 dev、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/template-priority-position242.apk` SHA256 `14B02A1E4A4A783D56BB8C620FBD0D4860F45D35B0C509D06A6BD73268AB4106`。
- MPP同root `build/template-priority-position.mpp` SHA256 `FE775076966B4854CBC176864FB7B4701C4E8900D55302BA994B1704E4217A4C`。
- 鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 2026-10-25 JST、両端末ともInstallVerifiedApk.ps1で既存署名照合後install-r Success。既存データ保持、削除なし。ログbuild/template-priority-position242-install.log、build/template-priority-position242-xig05-install.log。通常Lint付きbuild成功4m32s、242元APK適用成功。テンプレート板保存/無効化/検索先優先とカード初期位置補正回避を収録。端末上での症状改善の通し検証は未完了。広告だけプリセット・独立軽量パッチ準備コードもMPPに含むが、導入APKは通常Haiagaruを選択しており独立軽量構成ではない。未公開。

## 2026-10-25 板一覧選択・全文検索先の修正版（導入済み）

- XIG05 `730eae72`、Mi Note10 `d5497008`のChMate0.8.10.242 dev、表示名 `Haiagaru 検証242`、package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242` を更新。
- APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/template-board-picker242.apk` SHA256 `545D62F01339CA33BCCBC3A43F32710F35FE2C4720FBDDFDE96288FF59B971F9`。
- MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/template-board-picker.mpp` SHA256 `4CA2D5CED6E6B30126C1DF2E821AA8EC73E9EAC225BD64B4C1C470AA01F180FD`。
- 鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。
- 2026-10-25 JST、両端末ともInstallVerifiedApk.ps1で既存署名一致、データ保持install-r Success。起動PID XIG05=3624、Mi Note10=10366を確認。ログbuild/template-board-picker242-xig05-install.log、build/template-board-picker242-minote-install.log。アンインストール/データ消去なし。
- テンプレートの板一覧取得・検索・複数選択、全文検索先の自動/hissi.org/Kyodemo/両方、外部板を5ch側として扱う修正を収録。端末UIの通し動作確認と公開は未実施。通常Haiagaru構成であり、独立した広告だけ構成の導入ではない。

## 2026-10-25 広告だけ構成の初回検証（未公開）

Mi Note10 serial `d5497008`。以下は既存アプリの削除・データ消去なし。

- ChMate 0.8.10.242 dev / Haiagaru 広告のみ 242 / package `jp.co.airfront.android.a2chMate.haiagaru.adsonly242`。2026-10-25 13時台JST。別パッケージ追加、InstallVerifiedApk.ps1署名検査後Success。初回案内とHome表示、板一覧画面起動。スレ本文・画像の通し確認は未完了。
  APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ads-only-isolated242.apk` SHA256 `3745A97C4B9E04B198B370F4E26348ECAB85CB3DEA5FCAD1D13B8E73A2AE3AA2`。
  MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ads-only-isolated-review.mpp` SHA256 `034E1FF98866C87CDEDF892301D82E00221552AE1C8C3CCAF2AB9D543048DCA8`。
- ChMate 0.8.10.242 dev / Haiagaru 検証 242 / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。2026-10-25 13時台JST。既存署名一致後install-r Success。TabletHomeActivity起動。広告プリセットの適用/復元11項目合格、検証終了時に元の設定を復元。
  APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ads-only-preset-review242.apk` SHA256 `C8A553583205144A804253935EB188E9B337178770B22E7337610787A935711F`。
  MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ads-only-final.mpp` SHA256 `0D5F46F7CD17DDD3B5321FD44C1ACA8DF85560F0A2B8A0098CBE5AB9E5FD556C`。
署名鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。導入ログbuild/ads-only-isolated242-install.log、build/ads-only-preset242-install.log。端末のcrash bufferに新たなアプリFATALなし。性能・長時間利用の確認とは区別する。

広告専用191: Mi Note10 `d5497008`、表示名 `Haiagaru 広告のみ 191`、ChMate0.8.10.191 dev、package `jp.co.airfront.android.a2chMate.haiagaru.adsonly191`。2026-10-25 13時台JST、署名検査後の別パッケージ追加Success、HomeActivity起動後のプロセス生存を確認。本文/画像通し操作は未完了。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ads-only-isolated191.apk` SHA256 `5F01B3A6D427A0CE06CFF334873ABE501F1DB7B8DC30D8EA1D9375344C26D0F2`、MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ads-only-final.mpp` SHA256 `0D5F46F7CD17DDD3B5321FD44C1ACA8DF85560F0A2B8A0098CBE5AB9E5FD556C`。署名鍵/alias/証明書は上記と同一。導入ログbuild/ads-only-isolated191-install.log。

広告専用226: Mi Note10 `d5497008`、表示名 `Haiagaru 広告のみ 226`、ChMate0.8.10.226 dev、package `jp.co.airfront.android.a2chMate.haiagaru.adsonly226`。2026-10-25 13時台JST、署名検査後の別パッケージ追加Success、HomeActivity起動後のプロセス生存を確認。本文/画像通し操作は未完了。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ads-only-isolated226.apk` SHA256 `BF26757C231C46ED97758C4732EC6AC16BDA4569C7CCEAF85CBC72C9D09EAABF`、MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/ads-only-final.mpp` SHA256 `0D5F46F7CD17DDD3B5321FD44C1ACA8DF85560F0A2B8A0098CBE5AB9E5FD556C`。署名鍵/alias/証明書は上記と同一。導入ログbuild/ads-only-isolated226-install.log。

## 2026-10-25 XIG05 外部チェッカーURL連携・バックアップ保持修正

serial `730eae72` / XIG05 / 表示名Haiagaru 検証 242 / ChMate0.8.10.242 dev / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。InstallVerifiedApk.ps1で既存署名一致後install-r Success、データ保持。TabletHomeActivity起動PID12850。

APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/checker-handoff-xig05242.apk` SHA256 `55CDB01C62D2A09354C95CC94A04831DBD455F0FE37B97C1C7CE5D10F4B64A77`。MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/checker-handoff-xig05.mpp` SHA256 `DD5E9CA1303554A04DF9A3431A6EC1E7BFA011DCA45D61339A9AEF556F398B2D`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias Morphe / 証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。ログbuild/checker-handoff-xig05242-install.log。

エッヂ短縮スレURLのBROWSABLE VIEWがOpenUrlActivity、Hissi/read.phpがHissiMenuActivityへ、このカスタムパッケージで解決することをcmd package resolve-activityで確認。送信側からの通し操作と実保存先のバックアップ削除は未確認。通常構成、広告専用パッチは非選択。未公開。

2026-10-25 追加×の取り消し: ユーザー指示により今回だけのHissiMenuController/ModelUiの未コミット差分を取り消し、XIG05 serial730eae72のresumefix242をbuild/checker-handoff-xig05242.apk（SHA256 55CDB01C62D2A09354C95CC94A04831DBD455F0FE37B97C1C7CE5D10F4B64A77）へ署名一致install-r更新Success。元のMPP build/checker-handoff-xig05.mpp/鍵/aliasは同台帳の直前記録どおり。PID12699起動。今回の新しい×は公開しない。既存の閉じる操作は保持。

## 2026-10-26 00:01〜00:02 JST 認証CSS誤認・共有順修正191

ユーザーの「実機にインストールして」により導入。XIG05/Android15、serial `730eae72`、ChMate0.8.10.191 dev、表示名`Haiagaru 検証 191`、package `jp.co.airfront.android.a2chMate.haiagaru.settingsfix191`。InstallVerifiedApk.ps1で既存APKと署名一致確認後、install-r Success。既存検証版のデータ保持、元の`jp.co.airfront.android.a2chMate.haiagaru`は更新/アンインストール/データ消去していない。

APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/auth-css-fixed191.apk` SHA256 `360d80992e93e6d1d0659e5940c55bcba6ad729184547b85ff49c6d8777d2ee6`。MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/auth-css-fixed.mpp` SHA256 `0b6302ec22612ff7213a12b7e25a4f5659fa7bba8b799e889f06c141dd992d42`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

HomeActivityのam start -WはStatus ok、実Activity TabletHomeActivity、PID7461。既存スレ本文表示を`build/auth-css-fixed191-installed.png`で確認。対象PIDのcrash buffer空、後続pidofも7461。ログ`build/auth-css-fixed191-{install,launch,crash}.log`。認証設定画面の実操作・認証完了・投稿/共有送信は未確認。69ルールテスト/通常Lint build/完成APK共有順wrapper保持検査は成功。検証版更新のみ、公開なし。

## 2026-10-25 共有（記憶）並び順候補（APK生成のみ）

未導入・未公開。生成APKをapp_process隔離試験へ渡しただけで既存アプリを更新/起動していない。191完成APK29ケース成功、226は直前nativeメニュー＋変更済み補助クラス29ケース成功、完成APK試験前にd5497008が切断。242隔離試験はKilledで原因未特定。serial d5497008/Mi Note10上の試験はアプリprefs/ネットワーク/共有送信を使用しない。

MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/share-order-fixed.mpp` SHA256 `bbc9ad669d0d95c69ce27ed5b2a0a6b9337c1f552ec8508edbb301b1320cd6bd`。全APK鍵`C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias Morphe、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`、署名検証成功。APK共通ディレクトリは`C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/`。

| ChMate / 表示名 / package | APK絶対パス | SHA256 |
| --- | --- | --- |
| 0.8.10.191 dev / Haiagaru 検証 191 / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 | C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/share-order-fixed191.apk | b22754b7ee6b074bceae6dcb0c2fbb4a3eeef714c1daa1c8908a8c29301bf0cb |
| 0.8.10.226 dev / Haiagaru 検証 226 / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 | C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/share-order-fixed226.apk | 94b6989d0e5c6b2643607abc9ea8c1c1f64df44a0a34bf423eb7a624eeda07ee |
| 0.8.10.242 dev / Haiagaru 検証 242 / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 | C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/share-order-fixed242.apk | 6dd14acd6465573a7259d8823a99d59e5bf757829c3eb24e5293a3dfd3346d11 |

## 2026-10-25 NGWord-ID返信非表示オプション候補（APK生成のみ）

生成日時2026-10-25 23:21〜23:24 JST。端末シリアルなし、実機へ未導入・未起動。端末の既存アプリやデータは変更していません。すべて元APKからの適用/再構築/署名検証成功、公開なし。

MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/poster-hidden-option.mpp` SHA256 `0aee90ccdff9a65561493aa42f71027ddc9554c5550f2ec8e98c76ed2da29f6a`。全APKの鍵は`C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore`、alias `Morphe`、証明書SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。

| ChMate / 表示名 / package | APK絶対パス | APK SHA256 |
| --- | --- | --- |
| 0.8.10.191 dev / Haiagaru 検証 191 / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 | C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/poster-hidden-option191.apk | 9636055f219b5a171e1e9438fb13ae4c2bea680d3da1946dddec7437f6f41eca |
| 0.8.10.226 dev / Haiagaru 検証 226 / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 | C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/poster-hidden-option226.apk | 5ed75f45dacdf604d11d4a6366c75e61999c41fa82eda8611d8e6de6f6f26365 |
| 0.8.10.242 dev / Haiagaru 検証 242 / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 | C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/poster-hidden-option242.apk | f8dd8009d2f9fd0ad51915a26a570ba1e79593e8cec5af1c2e918b5c3ea6e0e2 |

`build/poster-hidden-option{191,226,242}-patch.log`、`build/poster-hidden-final-apks.log`。3完成APKに追加設定/補助クラスとnative透明NGフックを確認、各2箇所の分岐がフックへ到達。端末のNG登録・表示確認は未実施。

## 2026-10-25 XIG05 検索余白・戻る・動画操作候補
serial730eae72 / XIG05 / ChMate0.8.10.242 dev / 表示名Haiagaru 検証 242 / package jp.co.airfront.android.a2chMate.haiagaru.resumefix242。
最終APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/archive-top-back-final242.apk SHA256 F8FCAACA5CE89AB506B41D52623ABA1724B76012871EA231E2C7A8AB6ECCDB34。MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/archive-top-back-final.mpp SHA256 D76C4519B9702076486B8297D6DF2E9E5F55F04C78F75C2BFA75C437049FFAA3。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。署名一致install-r Success、既存データ保持。導入16:08JST、ログbuild/archive-top-back-final242-install.log。余白除去と1行見出しスクリーンショットbuild/xig05-search-final.png、戻る後の本文表示build/xig05-back-test.xml、PID28641新規crash bufferなし。広告9/初期値7/動画12チェックは同一該当コードの前候補66B0F5D3で実施、今回の変更は検索insets/Activity BACK境界。Samsung Android16報告の広告現象そのものは未再現。

## 2026-10-26 軽量版net→io検証

Mi Note 10 / Android11 / serial d5497008。ChMate0.8.10.191 dev、表示名 Haiagaru 広告のみ 191、package jp.co.airfront.android.a2chMate.haiagaru.adsonly191。2026-10-26 01:19頃JST、既存署名照合後install-r Success、データ保持。HomeActivity→o.m4 cold起動Status ok、PID12955。ローカルViewとURL変換10項目成功。実5ch通信/投稿は試験していない。

APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/lightweight-io191.apk SHA256 11ED3950188F5A058EB2FB2B0F8B6581B0DE3D0CB7C3232780B10DBF3DD9D2EE。
MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/lightweight-io.mpp SHA256 B29AA4EE1AB13F5D0F6DE34CDBF77C310DF83E714AB52F4AFAFDF55AD45E6D0D。
鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。ログ build/lightweight-io191-{patch,install,runtime}.log。軽量runtime31クラスのみ・外部hook参照299の解決と許可集合・ioメニュー既定値を完成APKで確認。226/241/242/243への今回候補適用・実機試験は未実施。公開なし。

## 2026-10-26 投稿確認フォーム再読込修正版

2026-10-26 01:23頃JST、Mi Note 10 / Android11 / serial d5497008 / ChMate0.8.10.191 dev / 表示名Haiagaru 検証 191 / package jp.co.airfront.android.a2chMate.haiagaru.settingsfix191。既存署名一致を確認後install-r Success、データ保持。HomeActivity→o.m4 cold起動Status ok、PID14125。ユーザー指定のkrsw/ridでの投稿検証を継続中、認証・投稿成功として扱わない。

APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/board-form-reload-final191.apk SHA256 81DF2CF1A5EF296CDAF21182EFABF076474CBE54DA570FA789DDAD55BBF784A8。
MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/board-form-reload-final.mpp SHA256 6B68F4B42B4E6DE07F77BA1BF212B9F49F12AFB098310FFD081F75BBDE4B617B。
鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。ログbuild/board-form-reload-final191-{patch,install,launch}.log。通常Lint付きbuild成功3m42s。完成APKで191共有順フックの元delegate/レジスター/分岐保持も成功。元の.haiagaruは置換していない。

先行候補の補記: 2026-10-26 00:56 JST、XIG05/serial730eae72の同じ検証packageへbuild/board-challenge-final191.apk（SHA256 4AE4E97FEDAD3DA0191F34FDE2E57E92B9E4697EA321F3F66094690CDFC122F0）、MPP build/board-challenge-final.mpp（25BB15278776FADE28710B4D898E78D0D53E4D40E5BE0D5A1FEB08158E9138A8）を同じ鍵/alias/証明書で署名一致install-r成功。絶対パスのrootは本項と同じローカル主開発フォルダ。01:09実画面にサイトの「ブラウザ変ですよん」エラー、フォームなしを確認。旧候補にはCookie許可後のGET再読込不備があり、今回修正。認証成功ではない。XIG05から別端末へユーザーが接続変更し、旧端末の今回修正候補導入はしていない。

投稿確認修正版の実機オフラインfixtureは全12チェック成功（build/board-form-reload-fixture.log）。Android11でActivity検出に失敗した試験コードをActivityClientRecord列挙へ変更後、元フォーム再表示/Worker手動実行/未許可POST停止/終了破棄まで成功。実投稿は含まない。指定krswの起動は自動審査blocked by policyで実行されず、実サイトの画面操作/認証/投稿は未完了。

## 2026-10-26 08:36〜08:39 JST 軽量版226/242 io互換の公開前検査

Mi Note10/Android11/serial d5497008。既存package/署名を照合後、両packageへinstall-r Success、データ保持。表示名Haiagaru 広告のみ 226 / 242、package jp.co.airfront.android.a2chMate.haiagaru.adsonly226 / adsonly242、ChMate0.8.10.226 dev / 0.8.10.242 dev。226 Home→StartActivity PID23248、242 HomeActivity PID23987の起動Status ok、各10項目のView/URL変換fixture成功、両PIDの新規crash buffer空。226初回規約へ同意後、データ収集許可は全OFFの画面を確認。実スレを開くADB am startは自動審査blocked by policyでコマンド全体が実行されず、実スレ/画像の通し再検査は未完了。

使用MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/board-form-reload-final.mpp SHA256 6B68F4B42B4E6DE07F77BA1BF212B9F49F12AFB098310FFD081F75BBDE4B617B。

- 226 APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/lightweight-io226.apk SHA256 771BCE063A7903C4882B995CA032B895A8F897E2F033A171350CA522123CAC95。
- 242 APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/lightweight-io242.apk SHA256 42895FFA8603DC66F7AE2643910B9BB239BB7F0DE875C9C557F220781F05D3C1。

鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。両完成APKで軽量runtime31クラスと許可された参照の解決（226=331/242=267）を確認、通常runtime混入なし。ログbuild/lightweight-io{226,242}-{patch,install,runtime,crash}.log。リモートdev.2のDroid＋変更は通常版のみの3行で、検査した軽量runtime/patchコードと同一。公開準備としてremoteを通常mergeし最終buildを別途実行。

## 2026-10-27 XIG05 Dalvikテンプレート3種・Cookie割当検索の検証版更新

導入記録日時: 2026-10-27 01:13:15 JST。XIG05 / ADB serial `730eae72` / ChMate `0.8.10.242 dev` / 表示名 `Haiagaru 検証 242` / package `jp.co.airfront.android.a2chMate.haiagaru.resumefix242`。既存APKと新APKのパッケージ・証明書一致を確認し、install -r Successでデータ保持更新。HomeActivity cold起動Status ok、PID20622。実機スクリーンショットで既存Part3本文/画像/書き込み下書き画面の表示を確認、当該PIDのcrash buffer空。ユーザーの投稿ボタン操作は行っていない。

- APK: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/dalvik-three242.apk`
- APK SHA-256: `D6C558773191C9E02146D73FA6D3028010E3EA5A95FE73CC90C6982A34D9D71C`
- MPP: `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/dalvik-three-final.mpp`
- MPP SHA-256: `E4C9604FC59CC01C49B6B28E2A2BB0F9C40F5CFDF9B9B842C8BA6C43C5EE5B2B`
- 署名鍵: `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias `Morphe`
- 証明書 SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`

`build/dalvik-three-bundle-build.log`の:patches:buildは成功26s、APKパッチ/署名成功。root buildは軽量版lintDebugの既存NewApiで失敗、追加の通常版lintReleaseも既存箇所を含む168 errors/365 warningsで失敗（build/dalvik-three-install-build.log、dalvik-three-release-build.log）。Lint設定の恒久無効化はしていない。ホスト30項目は成功。実機テンプレートメニューの自動確認はFrida RPC失敗、続く再attachがProcessNotRespondingで失敗したため未完了として扱う。実機画面は書き込み下書き表示中のため追加UI操作を停止。公開や5chへの自動投稿/再送はしていない。

導入ログ: `build/dalvik-three242-install.log`、起動ログ: `build/dalvik-three242-launch.log`、端末画面: `build/dalvik-three242-current.png`、クラッシュ確認: `build/dalvik-three242-crash.log`。実サーバーによるUA受理は未確認。

## 2026-10-27 native識別名保持UAの更新記録補完

前セッションでXIG05/serial730eae72の既存resumefix242へ同一署名install-r Success、データ保持。表示名Haiagaru 検証242、ChMate0.8.10.242 dev。APK `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/native-ua-identity242.apk` SHA256 `56D3C7E775F5F60AC54423CA7E1BA4B109069DDE090BF6B84D137E54E2BCA459`、MPP `C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/native-ua-identity-final.mpp` SHA256 `5A4D5964FE9EE49D84E6C549AEA64FCD2C44CC761B1C077045837B048EAEC17F`。鍵 `C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore` / alias Morphe / cert SHA256 `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`。起動成功、crash空。利用者から投稿成功の報告。正確な導入時刻は以前のログに依存し、この追記時点では端末切断のため再取得していない。


## 2026-10-27 02:33:36 JST 次プレ最終候補の3版データ保持更新
Mi Note10 / Android11 / serial d5497008。以下を既存署名一致後install-r Success、データ保持更新。191/226/242 HomeActivity起動成功、PID12291/10149/11146、各PIDの新規crash buffer空。242は既存閲覧履歴からPart3本文/サムネイル/画像表示をスクリーンショットで確認。191/226本文・画像の重複確認は共通処理のため利用者指示により省略、191巡回長時間停滞は未再現。
MPP: C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/prerelease-cards-final.mpp / SHA256 70FC681DDF1D801C446CE614686582362D54B676EFD5ECED18795E76F8C58552
鍵: C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed
- Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/prerelease-cards191.apk / SHA256 36B85B39577F5F59432C3F1FF3B9291CF4F39921A161501A0F9592F03F8A80E0
- Haiagaru 検証 226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/prerelease-cards226.apk / SHA256 5E462EE46815462B1EDCBFE626AFA2FB975C78DF9B085B6F6E360A357E73C796
- Haiagaru 検証 242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/prerelease-cards242.apk / SHA256 FBE30096027AAB2BD49E646A52903D2B85BEAD635B3AF117E31FA76AE6E1615F


## 2026-10-27 08:25:52 JST 板名不明時のCookieフォールバック検証
Android API36 / serial emulator-5554 / AVD Haiagaru_Root_API36。3版とも既存署名一致を確認しinstall-r Success・データ保持、TabletHomeActivity起動成功。191/226/242のnative FormBody/byte body・正確な送信slice・不明時従来Cookie load/save・ネストscope復元・OFFの各20項目、計60項目成功。191のCookie分離/削除/復元21項目も成功。実投稿/実Cookieの削除なし。242本文/サムネイル/画像全体の表示・スクロールを確認、共通処理の191/226重複操作は利用者指示で省略。3版PID4833/5775/5460のcrash buffer空。
MPP C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/board-cookie-fallback-final.mpp / SHA256359775463E6416DD2E9BF4F3E4A9CCC7C10D22CA493123064A73477B030B5F47
鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA2560af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed
- Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/board-cookie-fallback191.apk / SHA256 13A530B04D286A8B8C53B64E7E349F959C8157E30577092A0FAA0310FB96C829
- Haiagaru 検証 226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/board-cookie-fallback226.apk / SHA256 02930217EE8FE414B0E1A110EF41D88EEEF6746BA5FB569EB3A41A9BE51667DC
- Haiagaru 検証 242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/build/board-cookie-fallback242.apk / SHA256 AB583B6477A1562E81E5D938193DE50DF81BE8AE0ED893CBD8117C9749BAB4EC

## 2026-10-27 メディア横断移動候補
AVD Haiagaru_Root_API36 / serial emulator-5554。既存署名照合install-r Success・データ保持。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/media-gallery-ready.mpp SHA256 E1A03C136DF3EA6EBDF869288A709A29D52C197365A07D7C4A1B5059004BD8E2。
- Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/media-gallery-ready191.apk / SHA256 21C6DBEF3A7385047332CB9F0E45E8DAE850C246AC10D9DD385DEDB036AD5FAD
- Haiagaru 検証 242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/media-gallery-ready242.apk / SHA256 1AA1A9237ED438449003E4BB7AD02AEA48227837E944D9D9A0375BB3AFEEA00B
242で同レス画像/GIF/動画移動、5操作設定、toolbar/縦操作/pinch除外、GIF自動再生、HTTP応答待ち325msキャンセル、GIF各1取得の24項目成功。build/media-gallery-ready242-runtime4.log。3版native画像touch wrapperの元命令・レジスタ・分岐保持検査成功。191候補起動後の同メディアUI通し確認は未実施。191でlocal HTTP再利用停止を再現し、アカウント/投稿操作なし。

## 2026-10-27 191の接続再利用対策候補
Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / serial emulator-5554 / AVD Haiagaru_Root_API36。既存署名照合install-r Success・データ保持、TabletHomeActivity起動とPart3本文表示確認（build/network191-final.png）。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA2560af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/network191-fresh-final191.apk SHA256 2574C30062D37F292B4E844D0E3F27A6B1ADAF5029CDD0C4E19605AD3A79A52C
MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/network191-fresh-final.mpp SHA256 55A3F7B013EF92C6C87DF5A1CBE17EAFC28CC4E4353BBD236F1A7A26283CDD03
初期ON/明示OFFとGET/POST/media除外・Request不変性16項目、設定実Switch保存/復元、再利用失敗15013ms→対策ON新規3接続527/80/60ms成功。build/network191-reuse-final-runtime.log / network191-reuse-settings.log。15箇所reader execute元命令・bridgeレジスタ保持検査成功。191でも混在メディアUI24項目成功（network191-media-final-runtime.log、HTTP待ちcancel312ms、GIF各1取得）。新規crash buffer空、外部投稿・Cookie削除なし。初回候補生成はsources.mppを誤選択し0patchになったため、未導入でnetwork191-zero-patches-not-for-install.apkへ隔離、通常MPPを明示して再生成・全適用検証後に上記のみ導入。

## 2026-10-27 プレ最終固定候補
serial emulator-5554 / AVD Haiagaru_Root_API36。191/226/242とも署名照合install-r Success・データ保持、HomeActivity→TabletHomeActivity cold起動Status ok。MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/prerelease-media-network-final.mpp SHA256 B30B9D14A2527343330329A847A43726D866CFD00E26A25327C2286FFFBC3196。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA2560af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/prerelease-media-network191.apk / SHA256 AF5B53B470C0BE8AB01C62D8741CE9F4B4F147D0CDCF1F2C70C00D999EC0A414
- Haiagaru 検証 226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/prerelease-media-network226.apk / SHA256 44039A597E6352B8CF9070A4A505B8AB3ADE2CAB5B784F9C9A3629E37C99BC0C
- Haiagaru 検証 242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/prerelease-media-network242.apk / SHA256 95D1AB6026900AADD3B5069E828D5FC63196F46ECF06C7E137294D017EED703A
3版native画像touch元命令/レジスタ/分岐保持、191のreader15executeとimmutable Request copy bridge検査成功。191初期ON/明示OFF/POSTとmedia除外/共有Request保護16項目、実設定Switch保存/復元成功。ログbuild/prerelease-media-network191-policy.log / prerelease-media-network191-settings.log。226の共通UI重複操作は利用者指示で省略。

## 2026-10-27 標準GIF/動画・スレ全体メディア候補
MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/media-thread-native-final.mpp / SHA256 4F7707A6C94442ED307F1750A542DE150093D6938769FF410454A1BCA22FC81C。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / 証明書SHA2560af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。3版パッチ適用/署名、native thumbnail factoryと画像touchの元命令/引数/レジスタ/分岐保持を検査し成功。
- Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/media-thread-native191.apk / SHA256 76F9F9D09DA5F6946E94690F11AED25DAF357C46DD216F968D3096A85FC1D0AB / 生成のみ、未導入
- Haiagaru 検証 226 / ChMate0.8.10.226 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix226 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/media-thread-native226.apk / SHA256 0F907991E445F244172983366145F6EB34A40EB6A80D4DDBDFACE92024D4912F / 生成のみ、未導入
- Haiagaru 検証 242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/media-thread-native242.apk / SHA256 F002613F8844BFB2DD0013E2FD3DF42F34AEE6F54D40DE7A6F4CDF14EEF42672 / serial emulator-5554 / AVD Haiagaru_Root_API36へ既存署名照合install-r Success・データ保持
242実動作29項目成功（build/media-thread-native242-runtime4.log）。標準GIF/独立動画routing/スレ全体181媒体とNG除外・別スレ拒否/8実設定Switch保存復元/旧操作とcancel。fixtureの原レス・設定はfinallyで復元しDAT変更なし。SystemUI ANRはWaitで復帰、対象アプリの新規crash buffer空。この後、Intent単位snapshot再利用とページ移動時の古いsharedElements除去のみ共通Javaへ追加し最終再build・242再検証中。

## 2026-10-27 GIF標準動作・スレ全体ギャラリー最終候補（未公開）
Haiagaru 検証242 / ChMate0.8.10.242 dev / jp.co.airfront.android.a2chMate.haiagaru.resumefix242 / serial emulator-5554 / AVD Haiagaru_Root_API36。署名照合install-r Success・データ保持、TabletHomeActivity起動成功。鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore / alias Morphe / cert SHA2560af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
APK C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/media-thread-final242.apk SHA256 86326B0EAB74B881FBF159CED09237BA618D4F2480FF782E0DC42958C3FF49F9
MPP C:\Users\narum\.codex\worktrees\945d\morphe-chmate\output\haiagaru-current/build/media-thread-final.mpp SHA256 4074906DB0D074EF37687BFDDBA92A0C9FDD675098A8F36B19B4793FEE9D647C
通常LintVital付きbuild/media-thread-final-build.log成功2m34s。native factoryとtouchの元命令・引数・分岐保持再検査成功。32実動作項目成功（build/media-thread-final242-runtime.log）。標準GIFへの切替・16条件の独立routing・181件のスレ全体収集/NGと別スレ除外・8実Switch保存復元・旧操作回帰に加え、nativeサムネイルの選択を全体scope index1で維持、100回lookupで同じsnapshot参照、同レスswipe OFF/全スレswipe ONで別レス動画へ移動を確認。別ページへ旧sharedElementsを持ち越さず初回native factoryの元sharedElementsは保持。HTTP待ちcancel329ms、新規crash buffer空。nativeレスと設定はfinally復元しDAT変更なし。最終追加は共通Javaのsnapshot cache/transition extra除去のみ、191/226の同フック検査は上記3版候補で完了、共通JavaUIの重複は利用者指定で省略。公開操作なし。
