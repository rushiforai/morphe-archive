# Changelog

> Haiagaru for Morphe
> Format inspired by Morphe patches CHANGELOG.
> Release dates and commit links are omitted because they are not present in the supplied source history.

## \[1.7.0]

**Channel:** Stable

### 🐛 Bug Fixes

* 191／226のBEアイコンとリンク下線のずれを修正

### ✨ New Features

* MEGA／ローカルのバックアップ・復元、項目選択、起動時の同期と復元前の変更確認を追加
* 191／226／241／242に外部TXTによる本文の文字列置換を追加（初期状態OFF）

### ♻️ Improvements

* hissi.org／Kyodemo専用ビュワー、外部板・ワッチョイ検索、コピー・配色・ジェスチャーを改善
* エッヂ過去ログ検索、ツールバーのフィルター、未読・新着バッジ、投稿・起動互換処理を改善

### 📝 Notes

* 1.5.2以降の先行版で追加・改善した機能をまとめた正式版です。
* 詳細は[1.7.0の更新内容](release-notes-1.7.0.md)をご覧ください。
* 更新時は元のChMate APKにパッチを適用し、事前にバックアップしてください。

## \[1.6.11]

**Channel:** Pre-release

### 🐛 Bug Fixes

* 任意の有効なパッケージ名でパッチできるよう検証条件を修正。アプリ名を変更すると起動時に`ClassNotFoundException`になる問題も修正
* 191 devのフィルター行を隠した際に残る余白を抑制し、フィルター画面の「画像」長押しから画像一覧を開けるよう改善
* 必死チェッカー／Kyodemoのインライン表示でスタイルが適用されないケースを修正

### ♻️ Improvements

* クラス名復号に使うパッケージ名の文字・長さだけを純正ChMateの値に固定し、通常のパッケージ名参照への影響を限定

### 📝 Notes

* ChMate 0.8.10.191 devでMorphe適用とXIG05での起動を確認しています。更新時は元のAPKへパッチを適用してください。

## \[1.6.8]

**Channel:** Pre-release

### 🐛 Bug Fixes

* パッケージ名変更時はChMate本来のパッケージ名を先頭に含む値だけを受け付け、起動時のクラス名復号に起因するクラッシュを防ぎます。

### ♻️ Improvements

* 「未読をすべて0にする」実行後に画面を再生成せず、開いているスレ一覧の状態を保つようにしました。

## \[1.6.7]

**Channel:** Pre-release

### 🐛 Bug Fixes

* 242 devで上部フィルタ行の高さを更新する際、未接続ComposeViewを直接計測してクラッシュする問題を修正します。行の高さを更新して親リストへ再レイアウトを依頼します。

## \[1.6.6]

**Channel:** Pre-release

### 🐛 Bug Fixes

* 5ch.io移行前のBEアイコンURL（`img.5ch.net`／`img.2ch.net`）を正規化し、レス表示で同じアイコンが重複しないよう補正します。

### ✨ New Features

* 必死チェッカー専用ビュワー上部の「更新」「URL」「全レス」「本文」「日付」「ID/ﾜｯﾁｮｲ」「分析」「文字」「配色」を個別に表示・非表示に設定できます。初期状態ではすべて表示します。
* 板のスレ一覧ツールバーにも「未読をすべて0にする」を追加します。

### ♻️ Improvements

* 191／226／241／242で、上部フィルタを隠した後にListViewへ残る古い行高を更新し、設定を戻した場合は元の高さを復元します。
* エッヂ過去ログ専用ビュワーに、専用ビュワーと同じ左右スワイプ設定を適用します。先頭ページで「戻る」操作をした場合はビュワーを閉じます。
* エッヂのワッチョイ検索で `L20 abcd-EFGH` のような階層表記を検索文字列に含めます。
* 「既読スレを上に」の対象を、すべての既読スレ／新着レスがある既読スレから選べるようにします。短いスレ一覧の上詰め表示もレイアウト後に位置を調整します。

## \[1.6.5]

**Channel:** Pre-release

### 🐛 Bug Fixes

* 板のスレ一覧に「既読スレを上に」を追加（191 dev／226 dev／241／242 dev）。241では履歴IDが0の既読スレも正しく並び替えるよう修正
* 226 dev／241でワッチョイ長押し時に選択中のレスから検索文字列を取得する処理を修正
* UPLIFTのログイン・書き込みに影響する再署名後の計算や分岐を修正（226 dev／241／242 dev／243 dev）
* 191 devの自動NG画像判定クラッシュ向けに、パッチ適用時に無効化できる修正オプションを追加
* 必死チェッカー専用ビューアでKyodemoの投稿／分析を切り替え可能に。エッヂ過去ログのエラー時は診断コードを表示し、`Download/Haiagaru`にログを保存
* クラッシュログ保存パッチを初期状態で有効化（Morpheで無効化できます）

### ✨ New Features

* 「未読をすべて0にする」をツールバーに追加。実行前に確認画面を表示し、レスや履歴は削除しません
* レス数の少ないスレを上詰めで表示する設定を追加（241／242 dev／243 dev）
* ツールバーのフィルタをチェックボックス式に変更し、ダイアログを開いたまま複数の項目を切り替え可能に。設定で元の上部フィルタ行だけを非表示にできます

## \[1.6.4]

**Channel:** Preview

### 🐛 Bug Fixes

* 242 devの画像添付でアップロード用一時ファイル名の計算がゼロ除算になる問題を修正
* 226 devのスレ起動クラッシュとツールバーのフィルタを開けない問題を修正

### 🚀 Updated App Support

* 191 devのエッヂ次スレ判定で、スレタイ末尾の記者IDを比較対象から除外

### 📝 Notes

* 226 devのスレ起動は修正版で確認済みです。画像添付、フィルタ操作、エッヂ次スレの自動お気に入り追加は実機での最終確認が必要です。利用前のバックアップを推奨します。

## \[1.6.3]

**Channel:** Preview

### 🐛 Bug Fixes

* エッヂ過去ログ検索をツールバーから開く際、Activityを一時的に取得できない場合もアプリ内で起動するよう修正

### ♻️ Improvements

* MEGAログインに必要な暗号化プロバイダをAndroid向けMPPに登録
* 191 devのTalk認証キャッシュが1日後に失効しないよう変更

### 📝 Notes

* MEGAログインとTalkのゼロ除算は実機での解消を未確認です。利用前のバックアップを推奨します。

## \[1.6.2]

**Channel:** Preview

### ✨ New Features

* 191 devのフィルタ行を非表示にしてもツールバーのフィルタを開けるよう改善
* 191 dev／226 dev／241／242 dev／243 devで、設定OFFでもフィルタをツールバー設定に追加可能に変更
* MEGAバックアップでCookieを個別に選択可能に（初期OFF。WebViewのCookieは対象外）
* MEGAを使わず、端末のファイルへバックアップ・ファイルから復元する機能を追加

### ♻️ Improvements

* 専用ビュワーで「戻る」スワイプ時に履歴がなければビュワーを閉じるよう変更

### 📝 Notes

* フィルタ操作、バックアップ・復元は実機で未検証です。Cookieを含むローカルバックアップは暗号化されません。

## \[1.6.1]

**Channel:** Pre-release

### 🐛 Bug Fixes

* ID中の `+` が検索欄で空白に変わる問題と、エッヂ過去ログ検索画面がステータスバーに重なる問題を修正
* 191 devのTalk投稿確認フォームで、改行を含む本文が失われる場合を修正

### ✨ New Features

* スレの4種類のフィルタをツールバーの「フィルタ」ボタンにまとめる設定を追加（191 dev／242 devでは旧フィルタ行も非表示）
* 必死チェッカー専用ビュワーに更新ボタンと、向きを選べる履歴スワイプ設定を追加

### ♻️ Improvements

* ID・ﾜｯﾁｮｲの長押しメニューを拡張し、Kyodemo検索でﾜｯﾁｮｲ全体を引き継ぐよう改善

## \[1.6.0]

**Channel:** Pre-release

### 🐛 Bug Fixes

* 必死チェッカー専用ビューアーを戻る操作で閉じた後、遅延したレスコピー処理がクラッシュを起こさないよう修正
* MEGA同期のAndroid実行時クラッシュを修正

### ✨ New Features

* エッヂ過去ログ検索を板カテゴリ一覧・板のスレ一覧のツールバーにも追加。ツールバー用画像を選択可能
* ID／ﾜｯﾁｮｲ検索でIDの引き継ぎと表記ゆれへの対応を改善

### 🚀 Updated App Support

* ChMate 0.8.10.242 devへの対応を追加

## \[1.5.9]

**Channel:** Pre-release

### ✨ New Features

* MEGA同期に必要なHTTPエンジン登録を追加し、コルーチン実行環境をChMate本体から分離

## \[1.5.8]

**Channel:** Pre-release

### 🐛 Bug Fixes

* 191 dev／226 devの古いBEアイコンが改行をまたいで二重に描かれる問題を修正
* Talk通信経路とエッヂの記者ID付きスレタイをコピーした際の表示を修正

### ✨ New Features

* エッヂ過去ログをChMate内の検索画面から探せるようにし、ホームツールバーの編集項目にも追加
* KyodemoのID／ﾜｯﾁｮｲ検索画面を追加（設定で有効化）。検索結果のレス・スレURLを元の掲示板で開く動作も改善
* Hissiの暗色テーマで本文を読みやすくし、AA表示用フォントを追加

### ♻️ Improvements

* パッチ時の全クラス探索を対象クラス指定に変更し、特に226 dev／241／243 devの適用負荷を軽減
* 191 dev／226 dev／241／243 devへのパッチ適用を確認

## \[1.5.7]

**Channel:** Pre-release

### 🐛 Bug Fixes

* 双方向同期では既存の設定・履歴・NG・書き込みメモを保持し、不足分だけを追加

### ✨ New Features

* MEGA同期に「MEGA → この端末」「この端末 → MEGA」の片方向同期を追加
* 自動同期の間隔を分・時間・日で指定可能化。アプリ起動時だけ実行
* 復元前の変更候補を表示し、表示の省略も設定可能

### ♻️ Improvements

* MEGA側のバックアップが前回適用分より新しい場合だけ復元

### 🚀 Updated App Support

* 191 dev／226 dev／241／243 devに共通対応

## \[1.5.6]

**Channel:** Pre-release

### 🐛 Bug Fixes

* 古いレスのBEアイコンURLを現在の配信先に補正し、アイコンが表示されない問題を修正

### ♻️ Improvements

* ID検索の自動選択でBBSPINKをhissi.orgへ接続し、両方表示モードでは板ごとに前回の検索先を記憶
* hissi.orgのダークモードで文字と表を読みやすくし、スマホ縦持ち時の順位表・レス本文の横幅を調整
* 専用ビューアを無効にしてもID長押しの検索メニューを残し、hissi.orgの結果をChMate内のWebViewで表示

### 🚀 Updated App Support

* 191 dev／226 dev／241／243 devに共通対応

## \[1.5.5]

**Channel:** Pre-release

### 🐛 Bug Fixes

* ダークモード端末でHissi／Kyodemoのレス本文が見にくくなる問題を修正
* 外部板投稿時の絵文字結合子・異体字セレクタ補正を継続適用

### ✨ New Features

* 「全レス」と「本文」のコピー内容を分離し、レス長押しからレス番号・名前・ID・本文・レスURL・ヘッダー＋本文・選択を個別にコピー可能化

### ♻️ Improvements

* 専用ビューアを無効にした場合も、Hissi結果をChMate内のWebViewで開くよう改善

### 🚀 Updated App Support

* 191 dev／226 dev／241／243 devに共通対応

## \[1.5.4]

**Channel:** Pre-release

### 🐛 Bug Fixes

* 外部板投稿時の絵文字結合子・異体字セレクタ補正を追加

### ✨ New Features

* Hissi／Kyodemo専用ビューアのレス長押しから、レス番号・名前・ID・本文・レスURL・ヘッダー＋本文を個別にコピー可能化

### ♻️ Improvements

* 「選択」からレス本文の任意範囲を選択してコピー可能化

### 🚀 Updated App Support

* 191 dev／226 dev／241／243 devに共通対応

## \[1.5.3]

**Channel:** Pre-release

### ♻️ Improvements

* ChMate `0.8.10.191 dev`／`0.8.10.226 dev`／`0.8.10.241`／`0.8.10.243 dev`の標準「必死チェッカーもどき」メニューを、ChMate内の画面で開くよう変更
* 既存のメニュー設定を維持し、5ch.ioの板でもメニューを表示

## \[1.5.2]

**Channel:** Release / Pre-release

### 🐛 Bug Fixes

* Android向けMPPを配布し、Morphe Managerで`Patch bundle is missing dex entries`となる問題を修正しました。

### ♻️ Improvements

* パッチの機能は1.5.1と同じです。版番号を更新し、登録済みの1.5.1から更新できるようにしました。

## \[1.5.1]

**Channel:** Release / Pre-release

### 🐛 Bug Fixes

* 過去ログのレス番号付きURL（例: `/test/read.cgi/android/1744849408/3`）を、DAT取得後も保持して指定レスへ移動できるよう修正
* `itest.5ch.io` への過去ログURL補正時に、レス番号・クエリ・フラグメントを維持
* TalkのDAT変換でゼロ幅接合子（ZWJ）を含む複合絵文字のバリエーションセレクタを保持
* Talk／過去ログのDAT取得完了時、タブレットの既存ペインを再利用して検索結果・スクロール位置・未読状態を保持
* 226版では検証エラーを避けるため、レス行アダプタ経由で安全に適用

### ✨ New Features

* Talkの名前・本文に含まれる端末未対応絵文字を同梱フォントで補完し、画面更新・行再利用後も再適用
* 絵文字適用範囲を`missing`（未対応のみ）／`all`（全絵文字）／`off`から選択可能
* パッチ時に任意のTTF/OTF絵文字フォントを指定可能

### ♻️ Improvements

* ChMate `0.8.10.191 dev`／`0.8.10.226 dev`／`0.8.10.241`／`0.8.10.243 dev`に共通適用

### 📝 Notes

* 過去ログURLを開いたときに先頭へ戻る場合があった問題と、タブレットモードでDAT取得後に開いていたタブが再読み込みされる問題を修正しました。
* また、Talkの複合絵文字が崩れるケースを修正しています。プレリリースのため、既存の設定やバックアップを確認したうえでお試しください。

## \[1.4.11]

**Channel:** Pre-release

### 🐛 Bug Fixes

* 既読のEdgeスレッドで履歴を削除しなくても、NGThreadから記者IDを登録できるよう修正

### ♻️ Improvements

* スレッド番号に加えて履歴タイトルの記者ID情報も保存し、NGThread操作時に復元

### 🚀 Updated App Support

* ChMate 0.8.10.191 dev / 0.8.10.226 dev / 0.8.10.241 / 0.8.10.243 devに共通対応

## \[1.4.10]

**Channel:** Pre-release

### 🐛 Bug Fixes

* ChMateの「本文内の5chスレURLにスレ立て日を表示」でURLを板名・日付へ置換する削除範囲を補正
* `hニュー速(嫌儲)/2026-09-14 23:29:15` のようにURL先頭の`h`が残る表示を修正
* 1.4.9までのBEアイコン、投稿、Talk、広告、URL補正を継承

### ♻️ Improvements

* NGワード・NG ID・NG名前などの保存上限を、Haiagaru設定から0（無制限）〜100000件で指定できるように変更

## \[1.4.9]

**Channel:** Pre-release

### 🐛 Bug Fixes

* 1.4.8で残っていた「本文内の5chスレURLにスレ立て日を表示」との併用時のアイコン二重表示・URL位置ずれを修正

### ♻️ Improvements

* ChMateが内部で使う制御文字付き`img.5ch.io/ico/...gif`表記もBEアイコン描画経路へ正規化

## \[1.4.8]

**Channel:** Pre-release

### 🐛 Bug Fixes

* 「本文内の5chスレURLにスレ立て日を表示」と併用した際のBEアイコン二重表示、URL認識ずれ、画像添付化を修正
* 1.4.7までの投稿、Talk、広告、URL補正、BEアイコン修正を継承

### ♻️ Improvements

* `https://img.5ch.io/ico/...gif`、プロトコル相対URL、`sssp://`形式のBEアイコンを既存のアイコン描画経路へ正規化

## \[1.4.7]

**Channel:** Pre-release

### 🐛 Bug Fixes

* BEアイコンと「本文内の5chスレURLにスレ立て日を表示」を併用した際の、アイコンの二重表示やURL認識のずれを修正
* 191 devのスレ立て確認処理で本文などの入力内容が失われる問題を修正
* 191 dev／226 devのモバイル回線固定投稿で、`getAllNetworks()`由来の失効Network／SocketFactoryを使わず、投稿ごとに新しいセルラーNetworkを要求するよう修正
* Android 16でNetworkが投稿中に切り替わる場合は、別のNetworkを再要求してから接続を再試行するよう修正

### ✨ New Features

* Haiagaru設定に「投稿時にモバイル回線を再取得する」を追加（初期値ON、OFFでChMate本来の接続選択へ戻す）
* 対応バージョン：ChMate `0.8.10.191 dev`／`0.8.10.226 dev`／`0.8.10.241`／`0.8.10.243 dev`

## \[1.4.2]

**Channel:** Pre-release

### 🐛 Bug Fixes

* Talk 以外の掲示板で、スレを初めて開いたときに本文が白くなり表示されない問題を修正
* Talk の投稿認証時刻を正しい単位で扱うよう修正

### ✨ New Features

* Talkスレ内の広告予約枠による大きな空欄を、対応バージョン共通のView構造判定で削除

### ♻️ Improvements

* Talk DAT 変換時に絵文字バリエーションセレクタを適切に処理

### 🚀 Updated App Support

* ChMate `0.8.10.191 dev`／`0.8.10.226 dev`／`0.8.10.241`／`0.8.10.243 dev`向けMPPを更新

## \[1.4.1]

**Channel:** Stable

### 🐛 Bug Fixes

* Talkの過去ログDAT変換で、MS932外の絵文字・複合絵文字・外字を保持

### ✨ New Features

* Talkスレ内の広告予約枠による大きな空欄を、対応バージョン共通のView構造判定で削除

### ♻️ Improvements

* 広告枠の判定が下部バーや書き込みボタンを巻き込まないよう対象を大きな子要素なしコンテナに限定

### 🚀 Updated App Support

* ChMate `0.8.10.191 dev`／`0.8.10.226 dev`／`0.8.10.241`／`0.8.10.243 dev`向けMPPを更新

## \[1.4.0]

**Channel:** Stable

### 🐛 Bug Fixes

* ChMate `0.8.10.226 dev`でモバイル回線固定の書き込み時に、失効直後のnetwork IDを再利用して`Binding socket to network ... failed: EPERM`になる問題を修正

### ♻️ Improvements

* モバイル回線固定の投稿では毎回Androidの`requestNetwork()`で有効なセルラー回線を取得し、投稿完了まで`NetworkCallback`を維持するよう変更

## \[1.3.9]

**Channel:** Stable

### 🐛 Bug Fixes

* `1.3.7`／`1.3.8`からアプリデータを残して更新した際、古いTalk書き込みキーが残って`divide by zero`になる問題を修正
* Talkスレ更新時にDAT全体とIDXを作り直さず、不足したレスだけを追記して「自分の書き込み」印を保持

### ♻️ Improvements

* ChMate本体の同じversionNameではなくAPKの更新時刻を使用し、パッチ済みAPKの更新ごとにTalk書き込みセッションを一度だけ安全に再生成
* Talkテストスレへ実投稿し、別画面へ移動後に再度開いても投稿レスと自分の書き込み印が残ることを実機で確認

### 🚀 Updated App Support

* 191 dev／226 dev／241／243 devの全対応APKへパッチできることを確認

## \[1.3.8]

**Channel:** Stable

### 🐛 Bug Fixes

* ChMate `0.8.10.191 dev`でTalk板一覧のURLから`/boards/`が失われ、板一覧を取得できなくなる回帰を修正
* ChMate `0.8.10.191 dev`のNGThread編集画面へ「記者IDだけをNG」を復旧
* Talk投稿直後に読み取りAPIが一世代古い場合、画面遷移後に投稿レスが消えないよう新しいローカルDATを保持

### ♻️ Improvements

* 読み取りAPIが追いついた後は通常どおり新しいDATへ更新されることを実機で確認

### 🚀 Updated App Support

* 191 dev／226 dev／241／243 devの全対応APKへパッチできることを確認

## \[1.3.7]

**Channel:** Stable

### 🐛 Bug Fixes

* Talkの書き込み確認画面を戻る操作で閉じた場合、次回投稿用のセッションだけを安全に再生成するよう修正
* Talkへの投稿直後、読み取りAPIの反映が遅れていてもローカルの新しいレスを短いDATで上書きしないよう修正
* ChMate `0.8.10.226 dev`で、Talk投稿前の生成キー処理に発生する`NullPointerException`対策を追加
* ChMate `0.8.10.241`で、Talkキー保持オブジェクトと投稿処理の署名依存経路を保護

### ✨ New Features

* ChMate `0.8.10.191 dev`で、過去のパッチや確認画面のキャンセルにより不整合になったTalk書き込みキーを、アプリデータを削除せず修復する処理を追加

### 🚀 Updated App Support

* 191 dev／226 dev／241／243 devの全対応APKへ静的にパッチできることと、生成APKの署名を確認

## \[1.3.6]

**Channel:** Stable

### 🐛 Bug Fixes

* ChMate `0.8.10.241`でTalkスレ取得時に数値エラーが発生する問題を修正し、Talk APIの応答をDATへ変換する経路を追加
* ChMate `0.8.10.241`のTalk投稿で署名依存トラップにより`222`などの数値エラーが発生する問題を修正
* ChMate `0.8.10.191 dev`のTalk認証状態が更新された場合に発生する`divide by zero`／`NullPointerException`への補正を強化
* 「投稿前の本文チェックを無効化」をHaiagaru設定へ追加し、226 dev／241で空欄ではない投稿が誤判定される問題を回避可能に変更
* 高度なNGのスレ一覧フィルターで、ARTが`Object`と具体型の不一致を検出する問題を修正

### ✨ New Features

* ChMate `0.8.10.241`を実機へ導入し、Talkスレの閲覧と投稿を確認

## \[1.3.5]

**Channel:** Pre-release

### 🐛 Bug Fixes

* 1.3.4の機能・修正を継承し、参考実装の作者 [`testuser0123-web`](https://github.com/testuser0123-web) を明記

### ♻️ Improvements

* 判定結果を各バージョンの標準NGWordフラグへ統合し、既存のNG処理と表示設定を維持

### 🚀 Updated App Support

* 「高度なNGルール」のレス本文判定を191 dev／226 dev／241／243 devの全対応バージョンへ拡張

## \[1.3.4]

**Channel:** Pre-release

### 🐛 Bug Fixes

* ChMate標準の書き込み履歴について、保持件数をHaiagaru設定から0〜10000件で変更可能に追加
* ChMate `0.8.10.191 dev`でNGThread追加画面を開けない問題を修正
* ChMate `0.8.10.191 dev`のTalk投稿で署名依存キャッシュが更新された後に発生する`divide by zero`を、一度だけ正規化して再試行するよう修正
* ChMate `0.8.10.241`／Android 17で設定画面を開く際の`divide by zero`を修正

### ✨ New Features

* 端末内だけで動作する「高度なNGルール」を追加し、スレタイ・レス本文のキーワード、正規表現、記者ID、JavaScript条件を設定可能に変更
* スレ一覧の高度なNG判定を191 dev／226 dev／241／243 devへ対応（レス本文は191 devで対応）
* GPLv3派生実装とMozilla Rhino（MPL-2.0）のライセンス表示を追加

### ♻️ Improvements

* 高度なNG設定画面から内部向けの「対象: 0.8.10.191 dev」表記を削除し、操作説明と状態表示を整理

## \[1.3.3]

**Channel:** Stable

### 🐛 Bug Fixes

* エッヂの記者IDをスレ履歴へ保持し、既読スレや再起動後でも取得済みの記者IDをNGThreadへ登録できるように修正
* ChMate `0.8.10.191 dev`／`0.8.10.226 dev`で、5ch.io移行後も必死チェッカーのメニューを利用できるように修正
* ChMate `0.8.10.243 dev`のTalk投稿時に発生する署名依存の整合性エラーを修正
* 226 devへ修正版を実機導入し、上部余白のみが消えてフィルターボタンが維持されることを確認

### ♻️ Improvements

* ChMate `0.8.10.191 dev`／`0.8.10.226 dev`／`0.8.10.243 dev`のスレ内広告行を非表示化
* タブレット表示で上部に残っていた広告予約枠を、191の旧View構造と226／241／243のCompose構造ごとに除去

## \[1.3.2]

**Channel:** Stable

### 🐛 Bug Fixes

* ChMate `0.8.10.191 dev`で広告削除をONにすると、取得済みスレの検索結果画面にある検索条件のチェックボックスが消える問題を修正
* 修正版191 APKを実機にインストールし、ユーザーによる表示確認済み

### ♻️ Improvements

* 「正規表現」「大文字小文字を区別しない」「ヘッダー」「本文」「取得済みのスレ」「アーカイブ」を表示したまま、特定済みの広告Viewを非表示にするよう変更

## \[1.3.1]

**Channel:** Stable

### 🐛 Bug Fixes

* 1.3.0のTalk対応、タブレット再取得ループ修正、広告行非表示を継承

### ✨ New Features

* エッヂの `subject.txt` を記者ID付き `subject-metadent.txt` へ切り替える設定を追加（初期値ON）
* アプリ内のHTTP通信（画像取得を含む）をHTTPSへ切り替える設定を追加（初期値OFF）

### ♻️ Improvements

* ChMate `0.8.10.191 dev`／`0.8.10.226 dev`／`0.8.10.241`／`0.8.10.243 dev` のエッヂ板で、記者ID付きスレタイを表示

## \[1.3.0]

**Channel:** Stable

### 🐛 Bug Fixes

* Talk投稿時に動的生成クラスの署名依存比較が不一致となり、`NullPointerException`で失敗する問題を修正
* ChMate `0.8.10.191 dev`／`0.8.10.226 dev`のタブレットモードで、取得済みTalk DATを再取得し続ける問題を修正
* タブレットモードで過去ログの自動取得に失敗した際、失敗通知と再取得が無限に繰り返される問題を修正
* 運用情報板・裏社会板を含むTalk板URLの補正、既存の自動DAT取得、URL補正、設定、パッケージカスタマイズを収録

### ♻️ Improvements

* ChMate `0.8.10.191 dev`／`0.8.10.226 dev`の1レス目と2レス目の間に残る広告行を非表示化

### 🚀 Updated App Support

* ChMate `0.8.10.226 dev`で、Talkの現行スレをTalk APIからDATへ変換して閲覧できるように対応

## \[1.2.4.r1]

**Channel:** Pre-release

### 🐛 Bug Fixes

* ChMate `0.8.10.191 dev`のタブレット表示で、板一覧からTalkスレを開くとDAT落ち扱いになる問題を修正

### ♻️ Improvements

* タブレット内遷移でもTalkスレを判定し、通常表示と同じTalk APIからDATキャッシュを生成する経路へ統一
* `5ch.net`からの自動DAT取得設定に依存せず、Talkスレは常にTalk専用処理へ渡すように変更

## \[1.2.4]

**Channel:** Pre-release

### 🐛 Bug Fixes

* `1.2.3.r5`のTalk旧形式URL・板一覧・スレ取得修正を収録
* ChMate `0.8.10.191 dev`／`0.8.10.243 dev`のタブレット二画面表示で、画面内遷移が通常のスレActivityを経由せず自動DAT取得を回避していた問題を修正

### ♻️ Improvements

* DAT変換完了後は通常のスレ表示Activityを経由して再表示し、タブレット側にも取得結果を反映

## \[1.2.3.r5]

**Channel:** Pre-release

### 🐛 Bug Fixes

* ChMate `0.8.10.191 dev`で、旧形式のTalk板URLから運用情報板や裏社会板を開くと404になる問題を修正
* `talk.jp/{板}/subject.txt`などの板情報を2ch互換配信先へ補正

### ♻️ Improvements

* `talk.jp/{板}/{スレID}`、`talk.jp/test/read.cgi/{板}/{スレID}`、`talk.jp/boards/{板}/{スレID}`を同じTalk API取得経路で扱うように変更
* Androidエミュレーター上で運用情報板・裏社会板の一覧表示と、両形式のスレ取得を確認

## \[1.2.3.r4]

**Channel:** Pre-release

### 🐛 Bug Fixes

* ChMate `0.8.10.191 dev`の荒らし省略・コピペ省略2について、設定がONでも判定処理が登録されない内部条件を修正

### ✨ New Features

* ChMate `0.8.10.243 dev`のHaiagaru設定に、単発ID表示の省略・コピペ省略2・荒らし省略を追加

### ♻️ Improvements

* 個別の報告レスが実機で省略されることは未確認

## \[1.2.3.r3]

**Channel:** Pre-release

### 🐛 Bug Fixes

* ChMate `0.8.10.191 dev`／`0.8.10.243 dev` で、Talkの現行スレを開くと `divide by zero` またはDAT落ちになる問題を修正

### ♻️ Improvements

* Talk APIのレスをChMateのDATキャッシュへ変換し、署名変更後に不安定になるTalk専用取得処理より先に読み込むように変更
* TalkのURL、板情報、書き込み処理はChMate本来の経路を維持

## \[1.2.3.r2]

**Channel:** Pre-release

### 🐛 Bug Fixes

* ChMate `0.8.10.226 dev` の設定画面復元時に `o.setImageAssetsFolder.<init>` の署名依存デコイで `divide by zero` が発生する問題を修正
* 226実機で起動後に `SettingActivity` を開き、同クラッシュが再発しないことを確認
* 広告View非表示処理で、View復元中の例外がChMate本体のクラッシュへ波及しないように保護

## \[1.2.3.r1]

**Channel:** Pre-release

### 🐛 Bug Fixes

* ChMate+互換設定のチェック状態だけが変わり、実機能が有効にならない問題を修正

### ♻️ Improvements

* 1.2.2-r15で検証した変更を、1.2.3系の最初の検証版として再公開
* Haiagaru設定ボタンが反応せず設定画面を開けない端末への互換処理を収録

## \[1.2.3]

**Channel:** Stable

### 🐛 Bug Fixes

* Android 16を含む一部端末でHaiagaru設定ボタンを押しても設定画面が開かない問題を修正
* Haiagaru設定からChMate+互換機能を有効にしても、実際の動作へ反映されない問題を修正
* ChMate 0.8.10.191 devの単一ID省略設定に残っていた有効化判定を補正

### 🚀 Updated App Support

* ChMate 0.8.10.191 dev、0.8.10.226 dev、0.8.10.241、0.8.10.243 devに対応

## \[1.2.2-r15]

**Channel:** Pre-release

### 🐛 Bug Fixes

* ChMate `0.8.10.191 dev`／`0.8.10.226 dev` のChMate+互換設定で、チェックはONになるが実際の機能が有効にならない問題を修正
* ChMate `0.8.10.191 dev` の `単発ID表示を省略` で、保存済み設定がONのときに追加の有効化ゲートで無効化されないように修正

### ♻️ Improvements

* `master` / `main` のパッチバンドル混在を解消するため、配布対象を `master` に統一
* `コピペ省略2` をONにした場合はChMate本体側の親設定 `copipeNg` もONにするように変更
* `荒らし省略` をONにした場合はChMate本体側の親設定 `copipeNgAR` もONにするように変更

## \[1.2.2-r14]

**Channel:** Stable

### 🐛 Bug Fixes

* Haiagaru設定ボタンをアプリ内のポップアップ表示へ変更し、Android 16 / Samsung系端末でボタンが表示されても設定画面が開けない問題を修正
* ChMate+設定、DAT経路、プリセット更新、Shizuku移行、重複板整理の各設定セクションを個別に保護し、追加機能側の失敗で基本設定画面全体が開けなくなる問題を回避
* DAT取得、URL自動補正、投稿、板整理、パッケージ名・アプリ名・アイコン・versionCode変更機能を維持

### ✨ New Features

* 診断用に追加していた設定ボタンのログ保存処理を正式版から削除
* ChMate `0.8.10.191 dev`／`0.8.10.226 dev` のHaiagaru設定画面にChMate+互換設定を追加

## \[1.2.2-r13]

**Channel:** Stable

### 🐛 Bug Fixes

* URV Managerが解釈できるタイムゾーンなしの`LocalDateTime`形式へ`created\\\_at`を修正

### ✨ New Features

* 対応バージョン一覧とパッチバンドルの配布情報を更新

## \[1.2.2-r11]

**Channel:** Stable

### 🐛 Bug Fixes

* `.io` URLを直接開いた古いスレッドも自動DAT取得の対象に修正
* 自動DAT取得開始時の「過去ログを取得しています」表示を抑制し、既存DATがある場合はChMate本来の処理へ移行
* kako HTMLとitest JSONの本文変換で、`<br>`・段落タグ・元改行を保持

### ✨ New Features

* ChMate内部の`roidon.sqlite`を直接編集し、外部板扱い／5ch扱いの5ch.io板を選択して一括削除できる機能を追加
* ChMate `0.8.10.191 dev` のAndroid「URLをアプリで開く」対象へ、`\\\*.5ch.io` と `itest.5ch.io` を追加

### ♻️ Improvements

* Haiagaru設定画面から、自動DAT取得をON/OFF可能に変更
* 削除後はChMateの再起動で板一覧を更新

### 🚀 Updated App Support

* 対応対象にChMate `0.8.10.226 dev`（versionCode 494）を追加

## \[1.2.2-r10]

**Channel:** Pre-release

### ✨ New Features

* 自動DAT取得で現役サーバーのDATを最初に確認する経路を追加
* DAT・kako HTML・itest JSONの形式指定と、任意HTTPS URLテンプレートの追加に対応
* GitHub配布プリセットへ、`.net`／`.io`対応の板別 `2ch.sc` 14経路を追加

### ♻️ Improvements

* `kako`、`itest`、`2ch.sc` を含む取得経路を1行単位で並べ替え可能に変更

## \[1.2.2-r9]

**Channel:** Stable

### ♻️ Improvements

* `kako.5ch.io`、`itest.5ch.io`、`2ch.sc` の自動DAT取得経路をスレッドURL起動時にも適用
* 191 devは `ResListActivity`、241／243 devは `Hilt\\\_ResListActivity` の構造差に合わせて注入

### 🚀 Updated App Support

* ChMate `0.8.10.191 dev`／`0.8.10.226 dev`／`0.8.10.241`／`0.8.10.243 dev` の全対応版でURL自動補正を有効化

## \[1.2.2-r8]

**Channel:** Pre-release

### 🐛 Bug Fixes

* ChMate `0.8.10.243 dev` で画像添付時に発生していたメモリ不足、0除算、null関連のクラッシュを修正
* パッケージ名変更後のバックアップ復元に含まれる旧パッケージ参照を補正
* 広告非表示時に広告SDKと計測SDKの初期化を抑制
* 任意パッチ `Save ChMate crash logs` を追加。クラッシュ時に `Download/Haiagaru/` へログを保存

### ✨ New Features

* パッケージ名変更を初期状態で有効化し、アプリ名、PNG/WebPアイコン、versionCodeの変更に対応
* Shizukuを使った旧ChMate共有データのコピー補助を追加

### ♻️ Improvements

* DAT落ちスレを `kako.5ch.io`、`itest.5ch.io`、`2ch.sc` から取得するプリセットを更新

### 🚀 Updated App Support

* 対応対象から ChMate `0.8.10.242 dev` を削除

## \[1.2.2-r7]

**Channel:** Pre-release

### ♻️ Improvements

* ChMate `0.8.10.191 dev` の添付解析用テキストから `sssp://`、HTTP(S)、制御文字形式のBEアイコントークンを入力段階で除去
* 本文側のBEアイコン描画は原文を使用するため維持

## \[1.2.2-r6]

**Channel:** Pre-release

### ♻️ Improvements

* ChMate `0.8.10.191 dev` のレス単体、スレ全体、表示変換の全添付経路からBEアイコンURLを除外
* `img.5ch.io/ico/marara\\\_tya.gif` と `img.5ch.io/ico/kuma.gif` を含む `img.5ch.io/ico/` / `img.5ch.net/ico/` を対象化

## \[1.2.2-r5]

**Channel:** Pre-release

### ♻️ Improvements

* ChMate `0.8.10.191 dev` の添付抽出結果からBEアイコンURLを直接除外

## \[1.2.2-r4]

**Channel:** Pre-release

### ♻️ Improvements

* ChMate `0.8.10.191 dev` のBEアイコンを通常の添付ファイル一覧から除外

## \[1.2.2]

### 🐛 Bug Fixes

* ChMate `0.8.10.191 dev` のBEアイコン分類と表示を修正
* URV Managerが1.2.2内の修正版を検出できる配布リビジョンを追加

## \[1.2.1]

### 🐛 Bug Fixes

* Android版Morphe Managerで読み込めるDEX形式のパッチバンドルへ修正

## \[1.2.0]

### 🐛 Bug Fixes

* ChMate `0.8.10.191 dev` の画像アップロード時クラッシュを修正

## \[1.1.0]

### ✨ New Features

* ChMate `0.8.10.191 dev` 対応
* `5ch.io` の表示・検索・書き込みに対応

