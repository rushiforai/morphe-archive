# v0.4.0-beta.32

あにまんの画像アップロード判定と事前検証を公式フォームの契約に合わせる修正。

## 解析結果

保存済みの公式フォーム取得物（2026-11-23）を確認。category5.html / index.html は新規スレフォームを含み、読み込む公式スクリプトは main.js?1795015802。2026-11-26 の公開ページ・スクリプト再取得は HTTP 403 で、当日配信コードとの一致は未確認。

公式フォームのフィールドと処理順は次のとおり。

1. #resform が title・category・name・text を送る。
2. POST /inc/comment.php?preCheck で事前検証。
3. 成功後に同じデータを POST /inc/comment.php へ送り、JSONの number・thread・jump を受け取る。
4. その後、別フォーム #upform の file1・hidden upname・thread を FormData にして POST https://bbs.animanch.com/upload/ へ送る。単一画像フォームのDOM順も file1 → upname → thread。
5. 公式JavaScriptは dataType: "html" のjQuery AJAXを使い、.done() / .fail() で結果を扱う。成功はHTTP 2xxであり、HTTP 200限定ではない。

公式のクライアント側 uploadCheck は JPG/JPEG/GIF/PNG/WEBP を許可し、maxSize = 5242880（5 MiB）を超えるファイルを拒否する。JPEG 512,000 bytes、PNG 1,048,576 bytes は追加警告の閾値で、5 MiBのハード上限とは別。取得した main.js 内のチェック処理自体には画像変換コードはなく、警告表示のみ。サーバー側の別上限は未確認。

## beta.31 の不整合と修正

- **確定した契約不一致:** ブリッジは画像アップロードをHTTP 200のみ成功としていた。公式jQueryは2xxを成功として扱うため、HTTP 201/204等でもbeta.31は失敗扱いにしていた。前回実機結果には上流HTTPステータスが残っておらず、今回の写真が実際に201/204だったか、4xx/5xxだったかは断定できない。
- ブリッジの上限8,000,000 bytesを公式フォームの5,242,880 bytesへ合わせ、カテゴリ選択・preCheck・本文投稿より前に検証。上限超過で本文だけが作られることを防ぐ。
- multipartの順序を公式フォームの file1 → upname → thread に一致させ、HTML応答用 Accept ヘッダーも合わせた。
- 画像アップロードのHTTPステータスを部分失敗結果に保持し、画面にも表示。通信例外時はステータス未取得と明示する。
- 返信と新規スレ立ては、どちらも同じ /upload/ と3フィールドを使用する。違いは upname が返信番号か新規スレのOP番号か、thread が既存スレIDか作成レスポンスのスレIDか。新規スレでは投稿後の画像付きスレ読戻し確認も行う。

## 部分失敗の意味

公式フォームは本文の comment.php 受理後に、画像を別リクエストで送る。トランザクションや画像失敗時のロールバック処理は確認できない。したがって本文受理後に画像アップロードがHTTPエラーとなった場合、スレッドと本文は残り、画像なしの状態になる。HTTP 2xxを返したがブリッジ側の旧判定だけが失敗した場合は、画像も既に付いている可能性がある。どちらかはbeta.31の表示だけでは区別できなかった。beta.32ではHTTPステータスを表示し、2xx後も新規スレの画像付き読戻しが通るまで成功扱いにしない。

公式JavaScriptはブラウザのCookieを使うが、保存済みフォーム／JSに明示的なCSRFトークンは見当たらない。PHPSESSIDの存在は過去のGET取得で観測されているものの、preCheck・comment.php・upload/ の各段階で必須かどうかはサーバー側で未検証。実ログイン・実投稿を禁止されているため、ここは推測で変更していない。

## 検証

- AnimanchPostContractTest: 返信画像のmultipartフィールド・順序・セッション・HTTP 201成功を合成通信で確認。
- StockNewThreadContractTest: 新規スレのHTTP 201後の画像付き読戻し、HTTP 403部分失敗のステータス表示、5 MiB超過がカテゴリ選択・外部通信より前に拒否されることを確認。
- いずれもURLStreamHandlerによるローカル合成通信。実投稿・実ログイン・共有エミュレータ不使用。
- 実機で使用されたPNGの正確なバイト数と、beta.31時点の上流HTTP応答は未取得。したがって当該写真の失敗がサイズ制限だったとは断定しない。
