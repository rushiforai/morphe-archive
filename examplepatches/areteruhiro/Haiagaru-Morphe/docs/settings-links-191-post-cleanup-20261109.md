# 191の設定文字列と送信本文の接続修正

## 原因と変更

191は `patchSetTextCalls` を通らず、既存の本文bindingから設定用spanを追加する経路もありませんでした。既存の `XPostPreview.onBound` に、設定リンク専用のbindingを接続しました。X投稿プレビューの有効判定より前に実行し、通常の文字列・既存span・本文自体を保持します。EditText/Editableを除外し、再入とspan重複を防ぎます。新しい全クラス走査は追加していません。

191の送信には2経路あります。従来の9文字列n7a constructorだけの処理では、通常返信の `processAdDisplayErrorPostbackForUserError(name,mail,body)` に届きません。固定クラス `p9ExternalSyntheticLambda6` の `i():String` が双方の送信用本文を返すことを元APKで確認し、各return直前にU+FFFDと数値文字参照の除去を追加しました。元のtrim設定・return・分岐を保持し、入力中のEditText、名前・メール・タイトルは変更しません。外部板用の既存絵文字処理は維持します。

226/242のネイティブPostDataコピー経路は保持します。追加検証で、通常返信がこのコピーを経由しないことも確認し、226の `ResEditFragment.j()`、242の `ResEditFragment.f()` に同じ送信直前の除去を接続しました。3版とも固定クラス・固定メソッドだけを扱います。

## 2026-11-10の追加修正

導入時の `edgeArchiveToolbarIconPath` オプションと任意画像の読み込み分岐を削除。内蔵24dpベクターを常に組み込み、アプリ内の画像設定を継続します。CLIの実オプション一覧から項目が消え、APKのXMLで24dpが維持されることを確認。

191のgetterを実際の書き込み画面で検証したところ、当初のreturn直前挿入では末尾空白削除OFFの分岐が元returnへ直接着地し、除去処理を通らないことを検出しました。return命令自体をinvokeへ置換して元ラベルを引き継ぎ、その後にresult/returnを置く方式へ修正。静的検査にも「分岐がreturnへ直接着地して除去処理を飛ばさない」条件を追加しました。

試験コードのFragmentManagerメソッド名と継承されたbindingフィールドの参照失敗も記録。標準画面の設定リンクからの画面遷移は通過しましたが、旧候補の本文処理失敗を成功として扱いません。

## 226/242の追加確認

226の実際の書き込み試験で、元の本文 `�&#65533;&#xFFFD;` が追加掲示板への投稿時に `&#65533;&#65533;&#xFFFD;` として残ることを検出。元APKの固定 `ResEditFragment` を調べ、コピー用フックは新規スレ作成経路のみで、通常返信は別のpayload constructorへ本文getterの結果を渡していました。242にも同じ構造があることを確認し、両版のgetterへ接続しました。コピー生成側だけの単体試験を送信経路全体の成功として扱わず、3版の実際のcomposer・隔離transportで再確認する方式へ変更しました。

初回の226導入はWindows PowerShellで最後のGet-FileHashが利用できず、署名一致・install-r Successの後に検証スクリプトが停止しました。既存のPowerShell 7ランタイムで同じAPKの署名・導入・ハッシュ取得を完了しています。

## 検証

初回buildはPC側のnativeメモリ不足でGradle daemonが停止。エミュレータ停止とGradleのメモリ調整後に再実行しました。あにまんの画像経路修正まで含めた最終通常Lint/R8 buildは3分37秒で成功。3版へのパッチ適用も成功しています。

最終APKを元APKと比較し、3版の送信用getter各1returnが除去処理を通り、元命令・レジスター・try範囲を保持し、分岐で処理を飛ばさないことを検査。CLIのオプション一覧に `edgeArchiveToolbarIconPath` が存在しないこと、3版の内蔵アイコンXMLが幅・高さ24dpであることも再確認しました。アプリの最終通し結果は[統合検証記録](thread-search-animanch-save-20261110.md)へ記載します。
