# 2026-11-20 通知・リンクカード・HOME・設定・履歴の修正

## 変更

- 返信通知で使うDAT文字コードを、UTF-8か板の既定文字コードかで日本語の復号結果を比較して選びます。UTF-8として形式上読めるレガシー文字列で、文字化けしたUTF-8を選んでしまうケースを避けます。
- 本文内URLの直前に日本語が続いていてもリンク候補として検出します。ASCIIの単語中に埋まった`xhttps://...`等は引き続き対象外です。
- HOMEの「キーワードの表示名を設定」を、共通のメニュークリック振り分けからも開けるようにしました。
- Haiagaru設定のカテゴリ見出しと、カテゴリ内の画面見出しをテーマのアクセント色で統一しました。
- 191の閲覧履歴削除がnative側で成功した後、保持している履歴ソースとライブ表示リストから対象スレを除き、一覧を再通知します。native削除や表示更新に失敗した場合も互いに妨げません。

## 確認

- `:patches:clean :patches:buildAndroid`成功。`PreviewUrlsTest` 57項目、`NotificationDatTextTest`のUTF-8／MS932／EUC-JP復号とファイル読み込みに成功。
- Mi Note 10 Android 11の隔離reporter191でFrida 17.18.0を実行。通知復号3項目、URL抽出2項目、履歴から対象IDのみを除く合成行1項目、HOMEメニューのクリック振り分け1項目、全13カテゴリの見出し色27項目が成功。
- reporter191／226／242は署名照合後、`adb install -r`成功。通常のChMateアプリとそのデータは変更していません。
- 226／242ではFridaによる画面テストを完了していません。ユーザー報告端末（moto g64 5G／moto g05）で実際の通知、リンクカード、履歴削除を操作する確認も未実施です。ここでのFrida検査は合成データと隔離reporterによるものです。

詳細なAPKハッシュは [`android-installations.md`](android-installations.md) を参照。

## 最終ビルド・導入確認

- 最終ソースで`:patches:buildAndroid`成功。MPP SHA-256 `59d99eb6d54ca5a32d74cc716a4dce89c4a128d1deb187300e96e91730c3fa05`から作成したreporter191／226／242のAPKは証明書照合と実機への`adb install -r`が成功しました。
- reporter191の最終候補Frida再実行では通知復号、URL抽出、191履歴行削除、全13カテゴリ見出し色の確認に成功。端末が画面ロック中のため、HOME Activityを使うメニュー確認だけskipしました。HOMEメニューのルートは直前のFrida実行で成功済みです。226／242では今回Fridaを実行していません。
- `SharedNg.showAboon`と`showAboon`設定の既定値はtrueで、共有NG一致レスを「あぼーん」行で表示する初期設定は有効です。
