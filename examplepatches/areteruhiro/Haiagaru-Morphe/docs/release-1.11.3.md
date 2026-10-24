# Haiagaru 1.11.3

## UA変更機能を削除

- Haiagaru設定から「User-Agent の変更」と任意のUser-Agent入力欄を削除しました。
- ChMate起動時に`http.agent`を上書きする処理を削除しました。保存済みの旧設定値も以後参照されません。
- Haiagaru自身の通信で個別に指定しているUser-Agentは変更していません。
- 既存の正式版・プレリリース版のMPPも、各リリースの元のソースに同じ機能削除だけを適用して差し替えます。

## 確認範囲

- Android向けMPPを`:patches:buildAndroid`で作成します。
- 各過去版は対応するタグのソースから再ビルドし、MPP内の他のパッチ機能とバージョン情報を維持します。
